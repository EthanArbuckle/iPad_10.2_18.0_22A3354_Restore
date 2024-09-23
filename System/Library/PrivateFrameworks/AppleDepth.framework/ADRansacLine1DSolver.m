@implementation ADRansacLine1DSolver

- (ADRansacLine1DSolver)initWithParameters:(id)a3
{
  id v4;
  ADRansacLine1DSolver *v5;
  uint64_t v6;
  RansacLineModel *value;
  uint64_t v8;
  RansacLineModel *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ADRansacLine1DSolver;
  v5 = -[ADRansacLine1DSolver init](&v22, sel_init);
  if (v5)
  {
    v6 = operator new();
    *(_QWORD *)v6 = &off_24C421438;
    *(_DWORD *)(v6 + 8) = 0;
    value = v5->_model1D.__ptr_.__value_;
    v5->_model1D.__ptr_.__value_ = (RansacLineModel *)v6;
    if (value)
      (*(void (**)(RansacLineModel *))(*(_QWORD *)value + 8))(value);
    v8 = operator new();
    v9 = v5->_model1D.__ptr_.__value_;
    v10 = objc_msgSend(v4, "maxIterations");
    objc_msgSend(v4, "threshold");
    v12 = v11;
    objc_msgSend(v4, "minInlinersRatio");
    v14 = v13;
    v15 = objc_msgSend(v4, "seed");
    v16 = objc_msgSend(v4, "errorByY");
    *(_QWORD *)v8 = v9;
    *(_DWORD *)(v8 + 8) = v10;
    *(_DWORD *)(v8 + 12) = v12;
    *(_DWORD *)(v8 + 16) = v14;
    v17 = 1;
    v18 = 7;
    *(_DWORD *)(v8 + 24) = v15;
    do
    {
      v19 = 1812433253 * (v15 ^ (v15 >> 30));
      v15 = v19 + v17;
      *(_DWORD *)(v8 + 4 * v18) = v18 + v19 - 6;
      ++v17;
      ++v18;
    }
    while (v18 != 630);
    *(_QWORD *)(v8 + 2520) = 0;
    *(_BYTE *)(v8 + 2528) = v16;
    v20 = v5->_solver.__ptr_.__value_;
    v5->_solver.__ptr_.__value_ = (void *)v8;
    if (v20)
      MEMORY[0x20BD36498](v20, 0x1020C40E53961DBLL);
  }

  return v5;
}

- (id)fitWithX:(float *)a3 y:(float *)a4 count:(unsigned int)a5
{
  uint64_t v6;
  size_t v7;
  float *v8;
  uint64_t v9;
  float *v10;
  float *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  float *v16;
  float *v17;
  float *v18;
  unint64_t v19;
  float *v20;
  int v21;
  uint64_t v22;
  _OWORD *v23;
  float *v24;
  uint64_t v25;
  __int128 v26;
  float *v27;
  uint64_t v28;
  float *v29;
  float *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _BYTE *v34;
  float *v35;
  float *v36;
  unint64_t v37;
  float *v38;
  int v39;
  uint64_t v40;
  _OWORD *v41;
  float *v42;
  uint64_t v43;
  __int128 v44;
  ADRansacLineResult *v45;
  float v46;
  double v47;
  double v48;
  ADRansacLineResult *v49;
  float *v50;
  size_t __sz;
  uint64_t v54;
  void *__p;
  float *v57;
  float *v58;
  void *v59;
  void *v60;
  float *v61;

  v59 = 0;
  v60 = 0;
  v61 = 0;
  if (a5)
  {
    v6 = a5;
    v7 = 4 * a5;
    v8 = (float *)operator new(v7);
    v9 = 0;
    __sz = v7;
    v10 = &v8[v7 / 4];
    v11 = v8;
    v54 = v6;
    while (v8 < v10)
    {
      *v8++ = a3[v9];
LABEL_4:
      if (++v9 == v6)
      {
        v60 = v8;
        v61 = v10;
        v58 = 0;
        v59 = v11;
        __p = 0;
        v57 = 0;
        v27 = (float *)operator new(__sz);
        v28 = 0;
        v29 = v27;
        v30 = &v27[v6];
        while (v27 < v30)
        {
          *v27++ = a4[v28];
LABEL_35:
          if (++v28 == v6)
          {
            v57 = v27;
            goto LABEL_66;
          }
        }
        v31 = v27 - v29;
        v32 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 62)
        {
          v57 = v27;
          v58 = v30;
          __p = v29;
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        if (((char *)v30 - (char *)v29) >> 1 > v32)
          v32 = ((char *)v30 - (char *)v29) >> 1;
        if ((unint64_t)((char *)v30 - (char *)v29) >= 0x7FFFFFFFFFFFFFFCLL)
          v33 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v33 = v32;
        if (v33)
        {
          if (v33 >> 62)
          {
            v57 = v27;
            v58 = v30;
            __p = v29;
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v34 = operator new(4 * v33);
        }
        else
        {
          v34 = 0;
        }
        v35 = (float *)&v34[4 * v31];
        *v35 = a4[v28];
        v36 = v35 + 1;
        if (v27 != v29)
        {
          v37 = (char *)(v27 - 1) - (char *)v29;
          if (v37 < 0xBC)
          {
            v38 = v27;
            goto LABEL_50;
          }
          if (&v34[(char *)v27 - (char *)v29 - 4 - (v37 & 0xFFFFFFFFFFFFFFFCLL)] > &v34[(char *)v27 - (char *)v29 - 4])
          {
            v38 = v27;
            goto LABEL_50;
          }
          if ((float *)((char *)v27 - (v37 & 0xFFFFFFFFFFFFFFFCLL) - 4) > v27 - 1)
          {
            v38 = v27;
            goto LABEL_50;
          }
          if ((unint64_t)((char *)v29 - v34) < 0x20)
          {
            v38 = v27;
            goto LABEL_50;
          }
          v40 = (v37 >> 2) + 1;
          v38 = &v27[-(v40 & 0x7FFFFFFFFFFFFFF8)];
          v41 = &v34[4 * v31 - 16];
          v42 = v27 - 4;
          v43 = v40 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            v44 = *(_OWORD *)v42;
            *(v41 - 1) = *((_OWORD *)v42 - 1);
            *v41 = v44;
            v41 -= 2;
            v42 -= 8;
            v43 -= 8;
          }
          while (v43);
          v35 -= v40 & 0x7FFFFFFFFFFFFFF8;
          if (v40 != (v40 & 0x7FFFFFFFFFFFFFF8))
          {
            do
            {
LABEL_50:
              v39 = *((_DWORD *)v38-- - 1);
              *((_DWORD *)v35-- - 1) = v39;
            }
            while (v38 != v29);
          }
        }
        v30 = (float *)&v34[4 * v33];
        if (v29)
          operator delete(v29);
        v29 = v35;
        v27 = v36;
        goto LABEL_35;
      }
    }
    v12 = v8 - v11;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 62)
    {
      v60 = v8;
      v61 = v10;
      v59 = v11;
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    if (((char *)v10 - (char *)v11) >> 1 > v13)
      v13 = ((char *)v10 - (char *)v11) >> 1;
    if ((unint64_t)((char *)v10 - (char *)v11) >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
    {
      if (v14 >> 62)
      {
        v60 = v8;
        v61 = v10;
        v59 = v11;
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v15 = operator new(4 * v14);
    }
    else
    {
      v15 = 0;
    }
    v16 = (float *)&v15[4 * v12];
    v17 = a3;
    *v16 = a3[v9];
    v18 = v16 + 1;
    if (v8 != v11)
    {
      v19 = (char *)(v8 - 1) - (char *)v11;
      if (v19 >= 0xBC)
      {
        if (&v15[(char *)v8 - (char *)v11 - 4 - (v19 & 0xFFFFFFFFFFFFFFFCLL)] > &v15[(char *)v8 - (char *)v11 - 4])
        {
          v20 = v8;
        }
        else if ((float *)((char *)v8 - (v19 & 0xFFFFFFFFFFFFFFFCLL) - 4) > v8 - 1)
        {
          v20 = v8;
        }
        else if ((unint64_t)((char *)v11 - v15) >= 0x20)
        {
          v22 = (v19 >> 2) + 1;
          v20 = &v8[-(v22 & 0x7FFFFFFFFFFFFFF8)];
          v23 = &v15[4 * v12 - 16];
          v24 = v8 - 4;
          v25 = v22 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            v26 = *(_OWORD *)v24;
            *(v23 - 1) = *((_OWORD *)v24 - 1);
            *v23 = v26;
            v23 -= 2;
            v24 -= 8;
            v25 -= 8;
          }
          while (v25);
          v16 -= v22 & 0x7FFFFFFFFFFFFFF8;
          if (v22 == (v22 & 0x7FFFFFFFFFFFFFF8))
            goto LABEL_20;
        }
        else
        {
          v20 = v8;
        }
      }
      else
      {
        v20 = v8;
      }
      do
      {
        v21 = *((_DWORD *)v20-- - 1);
        *((_DWORD *)v16-- - 1) = v21;
      }
      while (v20 != v11);
    }
LABEL_20:
    v10 = (float *)&v15[4 * v14];
    if (v11)
      operator delete(v11);
    v11 = v16;
    v8 = v18;
    a3 = v17;
    v6 = v54;
    goto LABEL_4;
  }
  v29 = 0;
  v30 = 0;
  v57 = 0;
  v58 = 0;
LABEL_66:
  v58 = v30;
  __p = v29;
  if (!DisparityToDepth::Ransac<float,float>::fit((int *)self->_solver.__ptr_.__value_, (const void **)&v59, (const void **)&__p))
  {
    v49 = 0;
    v50 = (float *)__p;
    if (!__p)
      goto LABEL_71;
    goto LABEL_70;
  }
  v45 = [ADRansacLineResult alloc];
  v46 = (*(float (**)(RansacLineModel *))(*(_QWORD *)self->_model1D.__ptr_.__value_ + 48))(self->_model1D.__ptr_.__value_);
  v47 = (*(double (**)(RansacLineModel *))(*(_QWORD *)self->_model1D.__ptr_.__value_ + 56))(self->_model1D.__ptr_.__value_);
  LODWORD(v48) = LODWORD(v47);
  *(float *)&v47 = v46;
  v49 = -[ADRansacLineResult initWithSlope:intercept:](v45, "initWithSlope:intercept:", v47, v48);
  v50 = (float *)__p;
  if (__p)
  {
LABEL_70:
    v57 = v50;
    operator delete(v50);
  }
LABEL_71:
  if (v59)
  {
    v60 = v59;
    operator delete(v59);
  }
  return v49;
}

- (void).cxx_destruct
{
  RansacLineModel *value;
  void *v4;

  value = self->_model1D.__ptr_.__value_;
  self->_model1D.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(RansacLineModel *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->_solver.__ptr_.__value_;
  self->_solver.__ptr_.__value_ = 0;
  if (v4)
    JUMPOUT(0x20BD36498);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
