@implementation PolyNomialExtrapolation

- (PolyNomialExtrapolation)initWithHistorySize:(unint64_t)a3 degreeOfPolynomial:(unint64_t)a4
{
  int v4;
  int v5;
  PolyNomialExtrapolation *v6;
  PolyNomialExtrapolation *v7;
  PolyNomialExtrapolation *v8;
  float *begin;
  float *end;
  int v11;
  unsigned int N;
  int v13;
  unsigned int v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  objc_super v19;

  v4 = a4;
  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PolyNomialExtrapolation;
  v6 = -[PolyNomialExtrapolation init](&v19, sel_init);
  v7 = v6;
  v8 = v6;
  if (v6)
  {
    v6->_N = v5;
    v6->_n = v4;
    std::vector<float>::resize((uint64_t)&v6->_g, v5);
    begin = v8->_g.__begin_;
    end = v8->_g.__end_;
    if (begin != end)
    {
      v11 = 0;
      do
        *begin++ = (float)v11++;
      while (begin != end);
    }
    N = v8->_N;
    v13 = v8->_n + 1;
    v8->_A[0].m_rows = N;
    v8->_A[0].m_cols = v13;
    cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v7->_A, v13 * N);
    v14 = v8->_N;
    v15 = v8->_n + 1;
    v8->_A[1].m_rows = v14;
    v8->_A[1].m_cols = v15;
    cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)&v7->_A[1], v15 * v14);
    v16 = v8->_N;
    v8->_b[0].m_rows = v16;
    cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v7->_b, v16);
    v17 = v8->_N;
    v8->_b[1].m_rows = v17;
    cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)&v7->_b[1], v17);
  }
  return v8;
}

- (BOOL)ready
{
  unint64_t value;

  value = self->_x.__size_.__value_;
  return value >= self->_N && value == self->_y.__size_.__value_;
}

- (void)pushPoint:(PolyNomialExtrapolation *)self
{
  uint64_t v2;
  deque<float, std::allocator<float>> *p_x;
  unint64_t value;
  float v6;
  float v7;
  int v8;

  v6 = *((float *)&v2 + 1);
  p_x = &self->_x;
  v8 = v2;
  std::deque<float>::push_back(&self->_x.__map_.__first_, (float *)&v8);
  v7 = v6;
  std::deque<float>::push_back(&self->_y.__map_.__first_, &v7);
  value = self->_x.__size_.__value_;
  if (value > self->_N)
  {
    ++self->_x.__start_;
    self->_x.__size_.__value_ = value - 1;
    std::deque<float>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)p_x, 1);
    *(int64x2_t *)&self->_y.__start_ = vaddq_s64(*(int64x2_t *)&self->_y.__start_, (int64x2_t)xmmword_210881D00);
    std::deque<float>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)&self->_y, 1);
  }
}

- (double)predict
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  float v12;
  double v13;
  unint64_t v14;
  float v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int32 *v20;
  unsigned int v21;
  unsigned int v22;
  _BOOL4 v24;
  float32x2_t v25;
  __int32 *v26;
  double v27;
  __int32 v28;
  float32x2_t v29;
  uint64_t v31;
  uint64_t v32;
  void *v33[2];
  unsigned int v34;
  int v35;
  void *v36[3];
  void *v37;
  void *v38;
  void *v39[2];
  unsigned int v40;
  int v41;
  void *v42[2];
  unsigned int v43;
  unsigned int v44;
  char v45[8];
  void **v46;
  uint64_t v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)a1, "ready");
  if ((_DWORD)v2)
  {
    v31 = *(unsigned int *)(a1 + 8);
    if ((int)v31 >= 1)
    {
      v5 = 0;
      v32 = *(unsigned int *)(a1 + 12);
      do
      {
        if ((v32 & 0x80000000) == 0)
        {
          v6 = *(unsigned int *)(a1 + 32);
          if (v5 < v6)
          {
            v7 = 0;
            v8 = *(_QWORD *)(a1 + 112);
            v9 = *(unsigned int *)(a1 + 36);
            v10 = v32;
            v11 = v5;
            while (v9 != v7)
            {
              v12 = pow(*(float *)(v8 + 4 * v5), (double)v10);
              *(float *)(*(_QWORD *)(a1 + 16) + 4 * v11) = v12;
              v13 = pow(*(float *)(v8 + 4 * v5), (double)v10);
              v14 = *(unsigned int *)(a1 + 56);
              if (v5 >= v14 || v7 >= *(unsigned int *)(a1 + 60))
                -[PolyNomialExtrapolation predict].cold.1(v2, v3, v4);
              v15 = v13;
              *(float *)(*(_QWORD *)(a1 + 40) + 4 * (v5 + v14 * v7++)) = v15;
              v11 += v6;
              --v10;
              if (v32 + 1 == v7)
                goto LABEL_11;
            }
          }
          -[PolyNomialExtrapolation predict].cold.1(v2, v3, v4);
        }
LABEL_11:
        ++v5;
      }
      while (v5 != (v31 & ~((int)v31 >> 31)));
    }
    if ((int)v31 >= 1)
    {
      v16 = 0;
      v17 = *(unsigned int *)(a1 + 80);
      do
      {
        if (v17 == v16)
          -[PolyNomialExtrapolation predict].cold.1(v2, v3, v4);
        *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * v16) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144)
                                                                            + (((v16 + *(_QWORD *)(a1 + 168)) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                                + 4 * ((v16 + *(_QWORD *)(a1 + 168)) & 0x3FF));
        if (v16 >= *(unsigned int *)(a1 + 104))
          -[PolyNomialExtrapolation predict].cold.1(v2, v3, v4);
        *(_DWORD *)(*(_QWORD *)(a1 + 88) + 4 * v16) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 192)
                                                                            + (((v16 + *(_QWORD *)(a1 + 216)) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                                + 4 * ((v16 + *(_QWORD *)(a1 + 216)) & 0x3FF));
        ++v16;
      }
      while (v31 != v16);
    }
    v44 = 869711765;
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,0u,0u,false>>((uint64_t)v36, (_DWORD *)(a1 + 16), 3, 0);
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v36, &v44, (uint64_t)v39);
    if (v41 != *(_DWORD *)(a1 + 80))
      __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    v42[0] = 0;
    v42[1] = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(v42, v40);
    v43 = v40;
    v46 = v39;
    v47 = a1 + 64;
    if (v41 != *(_DWORD *)(a1 + 80))
      __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    v48 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,1u,false>,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,1u,false>>((uint64_t)v42, (uint64_t)v45);
    free(v39[0]);
    free(v38);
    free(v37);
    free(v36[0]);
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,0u,0u,false>>((uint64_t)v36, (_DWORD *)(a1 + 40), 3, 0);
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v36, &v44, (uint64_t)v33);
    if (v35 != *(_DWORD *)(a1 + 104))
      __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    v39[0] = 0;
    v39[1] = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(v39, v34);
    v40 = v34;
    v46 = v33;
    v47 = a1 + 88;
    if (v35 != *(_DWORD *)(a1 + 104))
      __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    v48 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,1u,false>,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,1u,false>>((uint64_t)v39, (uint64_t)v45);
    free(v33[0]);
    free(v38);
    free(v37);
    free(v36[0]);
    v18 = *(unsigned int *)(a1 + 12);
    v19 = v39[0];
    if ((v18 & 0x80000000) != 0)
    {
      v25 = 0;
    }
    else
    {
      v20 = (__int32 *)v42[0];
      if (v18 >= v40)
        v21 = v40;
      else
        v21 = *(_DWORD *)(a1 + 12);
      if (v21 >= v43)
        v22 = v43;
      else
        v22 = v21;
      v24 = v43 <= v21 || v40 == v22;
      v25 = 0;
      v26 = (__int32 *)v39[0];
      do
      {
        if (v24)
          __assert_rtn("assert_in_bounds", "matrixmixin.h", 2269, "((row < mixed().rows()) && (col < mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")");
        v27 = pow((double)*(int *)(a1 + 8), (double)(int)v18);
        v28 = *v20++;
        v29.i32[0] = v28;
        v29.i32[1] = *v26++;
        v25 = vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(v25), vcvtq_f64_f32(v29), v27));
        --v18;
      }
      while (v18 != -1);
    }
    free(v19);
    free(v42[0]);
  }
  else
  {
    v25 = (float32x2_t)vdup_n_s32(0x7FC00000u);
  }
  return *(double *)&v25;
}

- (void)printHistoryNamed:(id)a3
{
  unint64_t v4;

  printf("%s = [", (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
  if (self->_x.__size_.__value_)
  {
    v4 = 0;
    do
    {
      printf("%f, %f;",
        (*(float **)((char *)self->_x.__map_.__begin_ + (((v4 + self->_x.__start_) >> 7) & 0x1FFFFFFFFFFFFF8)))[(v4 + self->_x.__start_) & 0x3FF],
        (*(float **)((char *)self->_y.__map_.__begin_ + (((v4 + self->_y.__start_) >> 7) & 0x1FFFFFFFFFFFFF8)))[(v4 + self->_y.__start_) & 0x3FF]);
      ++v4;
    }
    while (self->_x.__size_.__value_ > v4);
  }
  puts("];");
}

- (void).cxx_destruct
{
  float *begin;
  uint64_t i;

  std::deque<float>::~deque[abi:ne180100](&self->_y.__map_.__first_);
  std::deque<float>::~deque[abi:ne180100](&self->_x.__map_.__first_);
  begin = self->_g.__begin_;
  if (begin)
  {
    self->_g.__end_ = begin;
    operator delete(begin);
  }
  for (i = 88; i != 40; i -= 24)
    free(*(void **)((char *)&self->super.isa + i));
  do
  {
    free(*(void **)((char *)&self->super.isa + i));
    i -= 24;
  }
  while (i != -8);
}

- (id).cxx_construct
{
  uint64_t i;
  _QWORD *v3;
  uint64_t j;
  char *v5;

  for (i = 16; i != 64; i += 24)
  {
    v3 = (char *)self + i;
    *v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
  }
  for (j = 64; j != 112; j += 24)
  {
    v5 = (char *)self + j;
    *(_QWORD *)v5 = 0;
    *((_QWORD *)v5 + 1) = 0;
    *((_DWORD *)v5 + 4) = 0;
  }
  *((_QWORD *)self + 28) = 0;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 7) = 0u;
  return self;
}

- (void)predict
{
  OUTLINED_FUNCTION_1("assert_in_bounds", "matrixmixin.h", a3, "((row < mixed().rows()) && (col < mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")");
}

@end
