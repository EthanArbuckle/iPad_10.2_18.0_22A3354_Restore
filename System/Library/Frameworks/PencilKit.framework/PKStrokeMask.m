@implementation PKStrokeMask

- (PKStrokeMask)initWithMaskPaths:(const void *)a3 centerlineSlices:(const void *)a4
{
  PKStrokeMask *v6;
  PKStrokeMask *v7;
  vector<_PKFloatRange, std::allocator<_PKFloatRange>> *p_centerlineSlices;
  char *v9;
  char *v10;
  int64_t v11;
  unint64_t v12;
  uint64_t value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v15;
  unint64_t v16;
  void **p_end;
  uint64_t v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  unint64_t v20;
  char *v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v22;
  char *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PKStrokeMask;
  v6 = -[PKStrokeMask init](&v25, sel_init);
  v7 = v6;
  if (&v6->_maskPaths != a3)
    std::vector<std::vector<ClipperLib::IntPoint>>::__assign_with_size[abi:ne180100]<std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>((uint64_t)&v6->_maskPaths, *(_QWORD *)a3, *((_QWORD *)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3));
  p_centerlineSlices = &v6->_centerlineSlices;
  if (&v6->_centerlineSlices != a4)
  {
    v9 = *(char **)a4;
    v10 = (char *)*((_QWORD *)a4 + 1);
    v11 = (int64_t)&v10[-*(_QWORD *)a4];
    v12 = v11 >> 4;
    value = (uint64_t)v7->_centerlineSlices.__end_cap_.__value_;
    begin = v7->_centerlineSlices.__begin_;
    if (v11 >> 4 <= (unint64_t)((value - (uint64_t)begin) >> 4))
    {
      p_end = (void **)&v7->_centerlineSlices.__end_;
      end = v7->_centerlineSlices.__end_;
      v20 = (end - begin) >> 4;
      if (v20 < v12)
      {
        v21 = &v9[16 * v20];
        if (end != begin)
        {
          memmove(v7->_centerlineSlices.__begin_, v9, end - begin);
          begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_end;
        }
        v11 = v10 - v21;
        if (v10 == v21)
          goto LABEL_23;
        v22 = begin;
        v23 = v21;
        goto LABEL_22;
      }
    }
    else
    {
      if (begin)
      {
        v7->_centerlineSlices.__end_ = begin;
        operator delete(begin);
        value = 0;
        p_centerlineSlices->__begin_ = 0;
        p_centerlineSlices->__end_ = 0;
        p_centerlineSlices->__end_cap_.__value_ = 0;
      }
      if (v11 < 0)
        goto LABEL_25;
      v15 = value >> 3;
      if (value >> 3 <= v12)
        v15 = v11 >> 4;
      v16 = (unint64_t)value >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v15;
      if (v16 >> 60)
LABEL_25:
        std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessElement>>(v16);
      v7->_centerlineSlices.__end_ = begin;
      p_end = (void **)&v7->_centerlineSlices.__end_;
      v7->_centerlineSlices.__begin_ = begin;
      v7->_centerlineSlices.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 16 * v18);
    }
    if (v10 == v9)
    {
LABEL_23:
      *p_end = (char *)begin + v11;
      return v7;
    }
    v22 = begin;
    v23 = v9;
LABEL_22:
    memmove(v22, v23, v11);
    goto LABEL_23;
  }
  return v7;
}

- (PKStrokeMask)initWithBezierPath:(id)a3 stroke:(id)a4
{
  id v6;
  id v7;
  id v8;
  const CGPath *v9;
  uint64_t *v10;
  int v11;
  uint64_t v13;
  uint64_t (**v14)(ClipperLib::Clipper *__hidden);
  void *v15[2];
  void *v16[2];
  __int128 v17;
  void *__p[2];
  uint64_t v19;
  _QWORD v20[4];
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  void (**v25)(ClipperLib::Clipper *__hidden);
  __int128 v26;
  __int128 v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v39;
  void **v40;

  v6 = a3;
  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)PKStrokeMask;
  v8 = -[PKStrokeMask init](&v39, sel_init);
  v9 = (const CGPath *)objc_msgSend(v6, "PK_CGPath");
  v10 = PKClipperPathsFromCGPath(v9, 100.0);
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v26 = 0u;
  v27 = 0u;
  *(_OWORD *)v15 = 0u;
  *(_OWORD *)v16 = 0u;
  v17 = 0u;
  *(_OWORD *)__p = 0u;
  v19 = 0;
  v20[0] = v20;
  v20[1] = v20;
  v20[2] = 0;
  v21 = 0;
  v28 = 0;
  v22 = 0;
  v24 = 0;
  v25 = &off_1E7774588;
  v23 = 1;
  v32 = 1;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v25, v10, 0, 1);
  v11 = objc_msgSend(v6, "usesEvenOddFillRule", 0, 0, 0, &off_1E7774540);
  ClipperLib::Clipper::Execute((uint64_t)&v14, 1, (uint64_t *)v8 + 1, v11 ^ 1, v11 ^ 1);
  objc_msgSend(v8, "calculateCenterlineSlices:", v7);
  v40 = (void **)v10;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v40);
  MEMORY[0x1C3B7F770](v10, 0x20C40960023A9);
  CGPathRelease(v9);
  v40 = (void **)&v13;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v40);
  v14 = &off_1E7774540;
  v25 = &off_1E7774588;
  std::__list_imp<long long>::clear(v20);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v16[1])
  {
    *(void **)&v17 = v16[1];
    operator delete(v16[1]);
  }
  if (v15[0])
  {
    v15[1] = v15[0];
    operator delete(v15[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v25);

  return (PKStrokeMask *)v8;
}

- (void)maskPaths
{
  return &self->_maskPaths;
}

- (void)centerlineSlices
{
  return &self->_centerlineSlices;
}

- (void)calculateCenterlineSlices:(id)a3
{
  id v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t (**v9)(ClipperLib::Clipper *__hidden);
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *i;
  uint64_t v15;
  float v16;
  float v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  double v20;
  double v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v22;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v33;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v34;
  double *v35;
  unint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[29];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (**v48)(ClipperLib::Clipper *__hidden);
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 __p;
  uint64_t v53;
  _QWORD v54[4];
  char v55;
  char v56;
  char v57;
  void (*v58)(IntPoint *, IntPoint *, IntPoint *, IntPoint *, IntPoint *, double, float);
  void (**v59)(ClipperLib::Clipper *__hidden);
  __int128 v60;
  __int128 v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[4];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  void **v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void **v84;

  v4 = a3;
  v81 = 0;
  v82 = 0;
  v83 = 0;
  *((_QWORD *)&v50 + 1) = &v83;
  v5 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v83, 1uLL);
  v48 = (uint64_t (**)(ClipperLib::Clipper *__hidden))v5;
  *(_QWORD *)&v49 = v5;
  *(_QWORD *)&v50 = &v5[3 * v6];
  *v5 = 0;
  v5[1] = 0;
  v5[2] = 0;
  *((_QWORD *)&v49 + 1) = v5 + 3;
  std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(&v81, &v48);
  v7 = v82;
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)&v48);
  v82 = v7;
  v8 = (void **)(v7 - 24);
  std::vector<ClipperLib::IntPoint>::reserve(v8, 10 * objc_msgSend(v4, "_pointsCount"));
  v79 = 0u;
  v80 = 0u;
  v78 = 0u;
  if (v4)
    objc_msgSend(v4, "_transform");
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __42__PKStrokeMask_calculateCenterlineSlices___block_invoke;
  v73[3] = &__block_descriptor_88_e26_v40__0_CGPoint_dd_8d24_B32l;
  v74 = v78;
  v75 = v79;
  v76 = v80;
  v77 = v8;
  objc_msgSend(v4, "interpolatePointDataWithStep:usingBlock:", v73, 0.1);
  v63 = 0;
  v64 = 0;
  v65 = 0;
  v67 = 0;
  v68 = 0;
  v69 = 0;
  v70 = 0;
  v71 = 0;
  v72 = 0;
  v60 = 0u;
  v61 = 0u;
  v9 = &off_1E7774540;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  __p = 0u;
  v48 = &off_1E7774540;
  v53 = 0;
  v54[0] = v54;
  v54[1] = v54;
  v54[2] = 0;
  v55 = 0;
  v62 = 0;
  v56 = 0;
  v57 = 0;
  v66 = 0;
  v58 = ZFillCallback;
  v59 = &off_1E7774588;
  v10 = v81;
  if (v82 != v81)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      ((void (*)(void (***)(ClipperLib::Clipper *__hidden), uint64_t, _QWORD, _QWORD))v59[2])(&v59, v10 + v11, 0, 0);
      ++v12;
      v10 = v81;
      v11 += 24;
    }
    while (v12 < 0xAAAAAAAAAAAAAAABLL * ((v82 - v81) >> 3));
    v9 = v48;
  }
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v48 + (_QWORD)*(v9 - 3), (uint64_t *)&self->_maskPaths, 1, 1);
  memset(v44, 0, sizeof(v44));
  v43 = 0u;
  v42 = 0u;
  v40 = 0;
  v41 = &unk_1E77745E0;
  v46 = 0;
  v47 = 0;
  v45 = 0;
  v38 = 0;
  v39 = 0;
  ClipperLib::Clipper::Execute((uint64_t)&v48, 0, (ClipperLib::PolyTree *)&v41, 0, 0);
  ClipperLib::OpenPathsFromPolyTree((uint64_t)&v41, (uint64_t *)&v38);
  v13 = v38;
  for (i = v39; v13 != i; v13 += 3)
  {
    v15 = v13[1];
    if (0xAAAAAAAAAAAAAAABLL * ((v15 - *v13) >> 3) < 2)
      continue;
    v16 = *(float *)(*v13 + 16);
    if (v16 < 0.0)
      continue;
    v17 = *(float *)(v15 - 8);
    if (v17 < 0.0)
      continue;
    end = self->_centerlineSlices.__end_;
    value = self->_centerlineSlices.__end_cap_.__value_;
    v20 = v16;
    v21 = v17;
    if (v16 >= v17)
    {
      if (end >= value)
      {
        begin = self->_centerlineSlices.__begin_;
        v29 = (end - begin) >> 4;
        v30 = v29 + 1;
        if ((unint64_t)(v29 + 1) >> 60)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v31 = value - begin;
        if (v31 >> 3 > v30)
          v30 = v31 >> 3;
        if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0)
          v27 = 0xFFFFFFFFFFFFFFFLL;
        else
          v27 = v30;
        if (v27)
        {
          v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessElement>>(v27);
          begin = self->_centerlineSlices.__begin_;
          end = self->_centerlineSlices.__end_;
        }
        else
        {
          v28 = 0;
        }
        v32 = v27 + 16 * v29;
        *(double *)v32 = v21;
        *(double *)(v32 + 8) = v20;
        v33 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v32;
        if (end != begin)
        {
          do
          {
            *((_OWORD *)v33 - 1) = *((_OWORD *)end - 1);
            v33 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v33 - 16);
            end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 16);
          }
          while (end != begin);
LABEL_40:
          begin = self->_centerlineSlices.__begin_;
        }
LABEL_41:
        v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v32 + 16);
        self->_centerlineSlices.__begin_ = v33;
        self->_centerlineSlices.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v32 + 16);
        self->_centerlineSlices.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v27 + 16 * v28);
        if (begin)
          operator delete(begin);
        goto LABEL_43;
      }
      *(double *)end = v21;
      *((double *)end + 1) = v20;
    }
    else
    {
      if (end >= value)
      {
        begin = self->_centerlineSlices.__begin_;
        v24 = (end - begin) >> 4;
        v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 60)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v26 = value - begin;
        if (v26 >> 3 > v25)
          v25 = v26 >> 3;
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0)
          v27 = 0xFFFFFFFFFFFFFFFLL;
        else
          v27 = v25;
        if (v27)
        {
          v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessElement>>(v27);
          begin = self->_centerlineSlices.__begin_;
          end = self->_centerlineSlices.__end_;
        }
        else
        {
          v28 = 0;
        }
        v32 = v27 + 16 * v24;
        *(double *)v32 = v20;
        *(double *)(v32 + 8) = v21;
        v33 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v32;
        if (end != begin)
        {
          do
          {
            *((_OWORD *)v33 - 1) = *((_OWORD *)end - 1);
            v33 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v33 - 16);
            end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 16);
          }
          while (end != begin);
          goto LABEL_40;
        }
        goto LABEL_41;
      }
      *(double *)end = v20;
      *((double *)end + 1) = v21;
    }
    v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 16);
LABEL_43:
    self->_centerlineSlices.__end_ = v22;
  }
  v34 = self->_centerlineSlices.__begin_;
  v35 = (double *)self->_centerlineSlices.__end_;
  v36 = 126 - 2 * __clz(((char *)v35 - (char *)v34) >> 4);
  if (v35 == (double *)v34)
    v37 = 0;
  else
    v37 = v36;
  std::__introsort<std::_ClassicAlgPolicy,-[PKStrokeMask calculateCenterlineSlices:]::$_0 &,_PKFloatRange *,false>((unint64_t)v34, v35, v37, 1);
  v84 = (void **)&v38;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v84);
  ClipperLib::PolyTree::~PolyTree((ClipperLib::PolyTree *)&v41);
  v48 = &off_1E7774540;
  v59 = &off_1E7774588;
  std::__list_imp<long long>::clear(v54);
  if ((_QWORD)__p)
  {
    *((_QWORD *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (*((_QWORD *)&v50 + 1))
  {
    *(_QWORD *)&v51 = *((_QWORD *)&v50 + 1);
    operator delete(*((void **)&v50 + 1));
  }
  if ((_QWORD)v49)
  {
    *((_QWORD *)&v49 + 1) = v49;
    operator delete((void *)v49);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v59);
  v48 = (uint64_t (**)(ClipperLib::Clipper *__hidden))&v81;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);

}

void __42__PKStrokeMask_calculateCenterlineSlices___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v4;
  int32x2_t v5;
  __int128 v6;
  __int128 v7;
  float v8;
  _OWORD *v9;
  unint64_t v10;
  char *v11;
  _OWORD *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  __int128 v21;
  __int128 v22;

  v4 = *(_QWORD *)(a1 + 80);
  v5 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(vaddq_f64(*(float64x2_t *)(a1 + 64), vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 48), a3), *(float64x2_t *)(a1 + 32), a2)), (float64x2_t)vdupq_n_s64(0x4059000000000000uLL))));
  *(_QWORD *)&v6 = v5.i32[0];
  *((_QWORD *)&v6 + 1) = v5.i32[1];
  v7 = v6;
  v8 = a4;
  v9 = *(_OWORD **)(v4 + 8);
  v10 = *(_QWORD *)(v4 + 16);
  if ((unint64_t)v9 >= v10)
  {
    v12 = *(_OWORD **)v4;
    v13 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v9 - *(_QWORD *)v4) >> 3);
    v14 = v13 + 1;
    if (v13 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - (_QWORD)v12) >> 3);
    if (2 * v15 > v14)
      v14 = 2 * v15;
    if (v15 >= 0x555555555555555)
      v16 = 0xAAAAAAAAAAAAAAALL;
    else
      v16 = v14;
    if (v16)
    {
      v22 = v7;
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(v4 + 16, v16);
      v7 = v22;
      v18 = v17;
      v12 = *(_OWORD **)v4;
      v9 = *(_OWORD **)(v4 + 8);
    }
    else
    {
      v18 = 0;
    }
    v19 = &v18[24 * v13];
    v20 = &v18[24 * v16];
    *(_OWORD *)v19 = v7;
    *((float *)v19 + 4) = v8;
    *((_DWORD *)v19 + 5) = -1082130432;
    v11 = v19 + 24;
    if (v9 != v12)
    {
      do
      {
        v21 = *(_OWORD *)((char *)v9 - 24);
        *((_QWORD *)v19 - 1) = *((_QWORD *)v9 - 1);
        *(_OWORD *)(v19 - 24) = v21;
        v19 -= 24;
        v9 = (_OWORD *)((char *)v9 - 24);
      }
      while (v9 != v12);
      v12 = *(_OWORD **)v4;
    }
    *(_QWORD *)v4 = v19;
    *(_QWORD *)(v4 + 8) = v11;
    *(_QWORD *)(v4 + 16) = v20;
    if (v12)
      operator delete(v12);
  }
  else
  {
    *v9 = v7;
    *((float *)v9 + 4) = v8;
    *((_DWORD *)v9 + 5) = -1082130432;
    v11 = (char *)v9 + 24;
  }
  *(_QWORD *)(v4 + 8) = v11;
}

- (PKStrokeMask)initWithArchive:(const void *)a3
{
  PKStrokeMask *v3;
  uint64_t v4;
  unint64_t v5;
  float32x2_t v6;
  uint64_t *v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int64x2_t v23;
  int64x2_t *v24;
  unint64_t v25;
  char *v26;
  int64x2_t *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  __int128 v35;
  void **v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  _BYTE *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  float64x2_t **v52;
  float64x2_t v53;
  unint64_t v54;
  float64x2_t *v55;
  float64x2_t *v56;
  float64x2_t *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  float64x2_t *v63;
  unint64_t v65;
  uint64_t v67;
  int64x2_t v68;
  float64x2_t v69;
  objc_super v70;
  _QWORD v71[5];

  v70.receiver = self;
  v70.super_class = (Class)PKStrokeMask;
  v3 = -[PKStrokeMask init](&v70, sel_init);
  std::vector<std::vector<ClipperLib::IntPoint>>::reserve((uint64_t *)-[PKStrokeMask maskPaths](v3, "maskPaths"), (uint64_t)(*((_QWORD *)a3 + 9) - *((_QWORD *)a3 + 8)) >> 4);
  v4 = *((_QWORD *)a3 + 9) - *((_QWORD *)a3 + 8);
  if (v4)
  {
    v67 = 0;
    v5 = v4 >> 4;
    if (v5 <= 1)
      v5 = 1;
    v65 = v5;
    v6 = (float32x2_t)vdup_n_s32(0x42C80000u);
    do
    {
      v7 = -[PKStrokeMask maskPaths](v3, "maskPaths");
      v8 = v7[2];
      v9 = (_QWORD *)v7[1];
      if ((unint64_t)v9 >= v8)
      {
        v11 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v9 - *v7) >> 3);
        v12 = v11 + 1;
        if (v11 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - *v7) >> 3);
        if (2 * v13 > v12)
          v12 = 2 * v13;
        if (v13 >= 0x555555555555555)
          v14 = 0xAAAAAAAAAAAAAAALL;
        else
          v14 = v12;
        v71[4] = v7 + 2;
        if (v14)
          v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)(v7 + 2), v14);
        else
          v15 = 0;
        v16 = &v15[24 * v11];
        v71[0] = v15;
        v71[1] = v16;
        v71[3] = &v15[24 * v14];
        *(_QWORD *)v16 = 0;
        *((_QWORD *)v16 + 1) = 0;
        *((_QWORD *)v16 + 2) = 0;
        v71[2] = v16 + 24;
        std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(v7, v71);
        v10 = (_QWORD *)v7[1];
        std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)v71);
      }
      else
      {
        *v9 = 0;
        v9[1] = 0;
        v9[2] = 0;
        v10 = v9 + 3;
        v7[1] = (uint64_t)(v9 + 3);
      }
      v7[1] = (uint64_t)v10;
      v17 = (uint64_t *)(*((_QWORD *)a3 + 8) + 16 * v67);
      v18 = v17[1];
      if (v18 >= 8)
      {
        v19 = 0;
        v20 = *v17;
        v21 = v18 >> 3;
        do
        {
          v22 = *(_QWORD *)(-[PKStrokeMask maskPaths](v3, "maskPaths") + 8);
          v23 = vcvtq_s64_f64(vcvtq_f64_f32(vmul_f32(*(float32x2_t *)(v20 + 8 * v19), v6)));
          v24 = *(int64x2_t **)(v22 - 16);
          v25 = *(_QWORD *)(v22 - 8);
          if ((unint64_t)v24 >= v25)
          {
            v68 = v23;
            v27 = *(int64x2_t **)(v22 - 24);
            v28 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24 - (char *)v27) >> 3);
            v29 = v28 + 1;
            if (v28 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            v30 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v25 - (_QWORD)v27) >> 3);
            if (2 * v30 > v29)
              v29 = 2 * v30;
            if (v30 >= 0x555555555555555)
              v31 = 0xAAAAAAAAAAAAAAALL;
            else
              v31 = v29;
            if (v31)
            {
              v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(v22 - 8, v31);
              v27 = *(int64x2_t **)(v22 - 24);
              v24 = *(int64x2_t **)(v22 - 16);
            }
            else
            {
              v32 = 0;
            }
            v33 = &v32[24 * v28];
            *(int64x2_t *)v33 = v68;
            *((_QWORD *)v33 + 2) = 0;
            v34 = v33;
            if (v24 != v27)
            {
              do
              {
                v35 = *(__int128 *)((char *)&v24[-2] + 8);
                *((_QWORD *)v34 - 1) = v24[-1].i64[1];
                *(_OWORD *)(v34 - 24) = v35;
                v34 -= 24;
                v24 = (int64x2_t *)((char *)v24 - 24);
              }
              while (v24 != v27);
              v27 = *(int64x2_t **)(v22 - 24);
            }
            v26 = v33 + 24;
            *(_QWORD *)(v22 - 24) = v34;
            *(_QWORD *)(v22 - 16) = v33 + 24;
            *(_QWORD *)(v22 - 8) = &v32[24 * v31];
            if (v27)
              operator delete(v27);
          }
          else
          {
            *v24 = v23;
            v26 = &v24[1].i8[8];
            v24[1].i64[0] = 0;
          }
          *(_QWORD *)(v22 - 16) = v26;
          ++v19;
        }
        while (v19 != v21);
      }
      ++v67;
    }
    while (v67 != v65);
  }
  v36 = -[PKStrokeMask centerlineSlices](v3, "centerlineSlices");
  v37 = *((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1);
  v38 = (unint64_t)(v37 >> 2) >> 1;
  v39 = (char *)*v36;
  if (v38 > ((_BYTE *)v36[2] - (_BYTE *)*v36) >> 4)
  {
    if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFDLL)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v40 = v36[1];
    v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessElement>>(v38);
    v42 = &v41[(v40 - v39) & 0xFFFFFFFFFFFFFFF0];
    v44 = &v41[16 * v43];
    v46 = (char *)*v36;
    v45 = (char *)v36[1];
    v47 = v42;
    if (v45 != *v36)
    {
      do
      {
        *((_OWORD *)v47 - 1) = *((_OWORD *)v45 - 1);
        v47 -= 16;
        v45 -= 16;
      }
      while (v45 != v46);
      v45 = (char *)*v36;
    }
    *v36 = v47;
    v36[1] = v42;
    v36[2] = v44;
    if (v45)
      operator delete(v45);
  }
  v48 = *((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1);
  if (v48)
  {
    v49 = 0;
    v50 = v48 >> 2;
    do
    {
      v51 = -[PKStrokeMask centerlineSlices](v3, "centerlineSlices");
      v52 = (float64x2_t **)v51;
      v53 = vcvtq_f64_f32(*(float32x2_t *)(*((_QWORD *)a3 + 1) + 4 * v49));
      v55 = *(float64x2_t **)(v51 + 8);
      v54 = *(_QWORD *)(v51 + 16);
      if ((unint64_t)v55 >= v54)
      {
        v69 = v53;
        v57 = *(float64x2_t **)v51;
        v58 = v55 - *v52;
        v59 = v58 + 1;
        if ((unint64_t)(v58 + 1) >> 60)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v60 = v54 - (_QWORD)v57;
        if (v60 >> 3 > v59)
          v59 = v60 >> 3;
        if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0)
          v61 = 0xFFFFFFFFFFFFFFFLL;
        else
          v61 = v59;
        if (v61)
        {
          v61 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessElement>>(v61);
          v57 = *v52;
          v55 = v52[1];
        }
        else
        {
          v62 = 0;
        }
        v63 = (float64x2_t *)(v61 + 16 * v58);
        *v63 = v69;
        v56 = v63 + 1;
        if (v55 != v57)
        {
          do
          {
            v63[-1] = v55[-1];
            --v63;
            --v55;
          }
          while (v55 != v57);
          v57 = *v52;
        }
        *v52 = v63;
        v52[1] = v56;
        v52[2] = (float64x2_t *)(v61 + 16 * v62);
        if (v57)
          operator delete(v57);
      }
      else
      {
        *v55 = v53;
        v56 = v55 + 1;
      }
      v52[1] = v56;
      v49 += 2;
    }
    while (v49 < v50);
  }
  return v3;
}

- (void)saveToArchive:(void *)a3
{
  int64x2_t ***v4;
  int64x2_t **v5;
  float32x2_t v6;
  uint64_t v7;
  unint64_t v8;
  float32x2_t *v9;
  uint64_t v10;
  float32x2_t *v11;
  int64x2_t *v12;
  int64x2_t *v13;
  float32x2_t *v14;
  float32x2_t *v15;
  float32x2_t v16;
  float32x2_t *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  float32x2_t *v22;
  float32x2_t v23;
  void **v24;
  unint64_t v25;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  void **v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  void **v37;
  uint64_t v38;
  float **v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  int v48;
  double **v49;
  double *v50;
  double *v51;
  float *v52;
  double v53;
  double v54;
  float *v55;
  float v56;
  float *v57;
  float *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  float *v64;
  float v65;
  int v66;
  float v67;
  float *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  float *v74;
  float v75;
  int v76;
  uint64_t *v78;
  int64x2_t **v79;
  void *v80;
  void *v81;
  _QWORD v82[5];

  v4 = -[PKStrokeMask maskPaths](self, "maskPaths");
  v5 = *v4;
  v79 = v4[1];
  if (*v4 != v79)
  {
    v78 = (uint64_t *)((char *)a3 + 64);
    v6 = (float32x2_t)vdup_n_s32(0x42C80000u);
    do
    {
      v7 = (char *)v5[1] - (char *)*v5;
      if (v7)
      {
        v8 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 3);
        if (v8 >> 61)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v9 = (float32x2_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<legacy_drawing::Command>>>(v8);
        v11 = v9;
        v13 = *v5;
        v12 = v5[1];
        if (*v5 != v12)
        {
          v14 = &v9[v10];
          v15 = v9;
          do
          {
            v16 = vdiv_f32(vcvt_f32_f64(vcvtq_f64_s64(*v13)), v6);
            if (v15 >= v14)
            {
              v18 = v15 - v11;
              v19 = v18 + 1;
              if ((unint64_t)(v18 + 1) >> 61)
                std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
              if (((char *)v14 - (char *)v11) >> 2 > v19)
                v19 = ((char *)v14 - (char *)v11) >> 2;
              if ((unint64_t)((char *)v14 - (char *)v11) >= 0x7FFFFFFFFFFFFFF8)
                v20 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v20 = v19;
              if (v20)
                v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<legacy_drawing::Command>>>(v20);
              else
                v21 = 0;
              v22 = (float32x2_t *)(v20 + 8 * v18);
              *v22 = v16;
              v17 = v22 + 1;
              while (v15 != v11)
              {
                v23 = v15[-1];
                --v15;
                v22[-1] = v23;
                --v22;
              }
              v14 = (float32x2_t *)(v20 + 8 * v21);
              if (v11)
                operator delete(v11);
              v11 = v22;
            }
            else
            {
              *v15 = v16;
              v17 = v15 + 1;
            }
            v13 = (int64x2_t *)((char *)v13 + 24);
            v15 = v17;
          }
          while (v13 != v12);
        }
      }
      else
      {
        v11 = 0;
      }
      PB::Data::Data((PB::Data *)&v80, (const unsigned __int8 *)v11);
      v24 = (void **)*((_QWORD *)a3 + 9);
      v25 = *((_QWORD *)a3 + 10);
      if ((unint64_t)v24 >= v25)
      {
        v28 = ((uint64_t)v24 - *v78) >> 4;
        v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) >> 60)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v30 = v25 - *v78;
        if (v30 >> 3 > v29)
          v29 = v30 >> 3;
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0)
          v31 = 0xFFFFFFFFFFFFFFFLL;
        else
          v31 = v29;
        v82[4] = (char *)a3 + 80;
        v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 80, v31);
        v33 = (void **)&v32[16 * v28];
        v82[0] = v32;
        v82[1] = v33;
        v82[3] = &v32[16 * v34];
        *v33 = v80;
        v33[1] = v81;
        v80 = 0;
        v81 = 0;
        v82[2] = v33 + 2;
        std::vector<PB::Data>::__swap_out_circular_buffer(v78, v82);
        v27 = (_QWORD *)*((_QWORD *)a3 + 9);
        std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)v82);
        v26 = v80;
      }
      else
      {
        v26 = 0;
        *v24 = v80;
        v24[1] = v81;
        v80 = 0;
        v81 = 0;
        v27 = v24 + 2;
        *((_QWORD *)a3 + 9) = v24 + 2;
      }
      *((_QWORD *)a3 + 9) = v27;
      free(v26);
      if (v11)
        operator delete(v11);
      v5 += 3;
    }
    while (v5 != v79);
  }
  v35 = -[PKStrokeMask centerlineSlices](self, "centerlineSlices");
  v37 = (void **)((char *)a3 + 8);
  v36 = *((_QWORD *)a3 + 1);
  v38 = v35[1] - *v35;
  v39 = (float **)((char *)a3 + 24);
  if (v38 >> 3 > (unint64_t)((*((_QWORD *)a3 + 3) - v36) >> 2))
  {
    if (v38 < 0)
LABEL_83:
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v40 = *((_QWORD *)a3 + 2) - v36;
    v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)a3 + 24, v38 >> 3);
    v42 = &v41[v40 & 0xFFFFFFFFFFFFFFFCLL];
    v44 = &v41[4 * v43];
    v45 = (char *)*((_QWORD *)a3 + 1);
    v46 = (char *)*((_QWORD *)a3 + 2);
    v47 = v42;
    if (v46 != v45)
    {
      v47 = v42;
      do
      {
        v48 = *((_DWORD *)v46 - 1);
        v46 -= 4;
        *((_DWORD *)v47 - 1) = v48;
        v47 -= 4;
      }
      while (v46 != v45);
    }
    *((_QWORD *)a3 + 1) = v47;
    *((_QWORD *)a3 + 2) = v42;
    *((_QWORD *)a3 + 3) = v44;
    if (v45)
      operator delete(v45);
  }
  v49 = -[PKStrokeMask centerlineSlices](self, "centerlineSlices");
  v50 = *v49;
  v51 = v49[1];
  if (*v49 != v51)
  {
    v52 = (float *)*((_QWORD *)a3 + 2);
    do
    {
      v54 = *v50;
      v53 = v50[1];
      v55 = *v39;
      if (v52 >= *v39)
      {
        v58 = (float *)*v37;
        v59 = ((char *)v52 - (_BYTE *)*v37) >> 2;
        v60 = v59 + 1;
        if ((unint64_t)(v59 + 1) >> 62)
          goto LABEL_83;
        v61 = (char *)v55 - (char *)v58;
        if (v61 >> 1 > v60)
          v60 = v61 >> 1;
        if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFFCLL)
          v62 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v62 = v60;
        if (v62)
        {
          v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)a3 + 24, v62);
          v58 = (float *)*((_QWORD *)a3 + 1);
          v52 = (float *)*((_QWORD *)a3 + 2);
        }
        else
        {
          v63 = 0;
        }
        v64 = (float *)&v63[4 * v59];
        v65 = v54;
        *v64 = v65;
        v57 = v64 + 1;
        while (v52 != v58)
        {
          v66 = *((_DWORD *)v52-- - 1);
          *((_DWORD *)v64-- - 1) = v66;
        }
        v55 = (float *)&v63[4 * v62];
        *((_QWORD *)a3 + 1) = v64;
        *((_QWORD *)a3 + 2) = v57;
        *((_QWORD *)a3 + 3) = v55;
        if (v58)
        {
          operator delete(v58);
          v55 = *v39;
        }
      }
      else
      {
        v56 = v54;
        *v52 = v56;
        v57 = v52 + 1;
      }
      *((_QWORD *)a3 + 2) = v57;
      if (v57 >= v55)
      {
        v68 = (float *)*v37;
        v69 = ((char *)v57 - (_BYTE *)*v37) >> 2;
        v70 = v69 + 1;
        if ((unint64_t)(v69 + 1) >> 62)
          goto LABEL_83;
        v71 = (char *)v55 - (char *)v68;
        if (v71 >> 1 > v70)
          v70 = v71 >> 1;
        if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFFCLL)
          v72 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v72 = v70;
        if (v72)
        {
          v73 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)a3 + 24, v72);
          v68 = (float *)*((_QWORD *)a3 + 1);
          v57 = (float *)*((_QWORD *)a3 + 2);
        }
        else
        {
          v73 = 0;
        }
        v74 = (float *)&v73[4 * v69];
        v75 = v53;
        *v74 = v75;
        v52 = v74 + 1;
        while (v57 != v68)
        {
          v76 = *((_DWORD *)v57-- - 1);
          *((_DWORD *)v74-- - 1) = v76;
        }
        *((_QWORD *)a3 + 1) = v74;
        *((_QWORD *)a3 + 2) = v52;
        *((_QWORD *)a3 + 3) = &v73[4 * v72];
        if (v68)
          operator delete(v68);
      }
      else
      {
        v67 = v53;
        *v57 = v67;
        v52 = v57 + 1;
      }
      *((_QWORD *)a3 + 2) = v52;
      v50 += 2;
    }
    while (v50 != v51);
  }
}

- (PKStrokeMask)initWithRawValue:(id)a3
{
  id v4;
  const unsigned __int8 *v5;
  PKStrokeMask *v6;
  _BYTE v8[32];
  void (**v9)(drawing::Stroke *__hidden);
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v9 = &off_1E77749B8;
  v23 = 0;
  v24 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0;
  v4 = objc_retainAutorelease(a3);
  v5 = (const unsigned __int8 *)objc_msgSend(v4, "bytes");
  objc_msgSend(v4, "length");
  PB::Reader::Reader((PB::Reader *)v8, v5);
  if (drawing::Stroke::readFrom((drawing::Stroke *)&v9, (PB::Reader *)v8))
  {
    self = -[PKStrokeMask initWithArchive:](self, "initWithArchive:", &v9);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }
  drawing::Stroke::~Stroke((drawing::Stroke *)&v9);

  return v6;
}

- (NSData)rawValue
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(drawing::Stroke *__hidden);
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v6 = &off_1E77749B8;
  v20 = 0;
  v21 = 0;
  v7 = 0u;
  v8 = 0u;
  v9 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0;
  -[PKStrokeMask saveToArchive:](self, "saveToArchive:", &v6);
  PB::Writer::Writer((PB::Writer *)&v4);
  drawing::Stroke::writeTo((drawing::Stroke *)&v6, (PB::Writer *)&v4);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, v4 - v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PB::Writer::~Writer((PB::Writer *)&v4);
  drawing::Stroke::~Stroke((drawing::Stroke *)&v6);
  return (NSData *)v2;
}

- (id)bezierPath
{
  CGPath *Mutable;
  uint64_t **i;
  uint64_t **begin;
  uint64_t *v6;
  uint64_t *v7;
  char v8;
  void *v9;

  Mutable = CGPathCreateMutable();
  begin = (uint64_t **)self->_maskPaths.__begin_;
  for (i = (uint64_t **)self->_maskPaths.__end_; begin != i; begin += 3)
  {
    v6 = *begin;
    v7 = begin[1];
    if (*begin != v7)
    {
      v8 = 1;
      do
      {
        if ((v8 & 1) != 0)
          CGPathMoveToPoint(Mutable, 0, (double)**begin / 100.0, (double)(*begin)[1] / 100.0);
        else
          CGPathAddLineToPoint(Mutable, 0, (double)*v6 / 100.0, (double)v6[1] / 100.0);
        v8 = 0;
        v6 += 3;
      }
      while (v6 != v7);
    }
    CGPathCloseSubpath(Mutable);
  }
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithCGPath:", Mutable);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);
  return v9;
}

- (CGRect)_boundsWithTransform:(CGAffineTransform *)a3
{
  double a;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  uint64_t ***v9;
  uint64_t **v10;
  uint64_t **v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v25;

  a = a3->a;
  b = a3->b;
  c = a3->c;
  d = a3->d;
  tx = a3->tx;
  ty = a3->ty;
  v9 = -[PKStrokeMask maskPaths](self, "maskPaths");
  v10 = *v9;
  v11 = v9[1];
  if (*v9 == v11)
    return *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D628];
  v12 = -1.79769313e308;
  v13 = 1.79769313e308;
  v14 = 1.79769313e308;
  v15 = -1.79769313e308;
  do
  {
    v16 = *v10;
    while (v16 != v10[1])
    {
      v17 = *v16;
      v18 = v16[1];
      v16 += 3;
      v19 = (double)v17 / 100.0;
      v20 = (double)v18 / 100.0;
      v21 = tx + c * v20 + a * v19;
      v22 = ty + d * v20 + b * v19;
      if (v13 >= v21)
        v13 = v21;
      if (v12 < v21)
        v12 = v21;
      if (v14 >= v22)
        v14 = v22;
      if (v15 < v22)
        v15 = v22;
    }
    v10 += 3;
  }
  while (v10 != v11);
  if (v12 < v13 || v15 < v14)
  {
    return *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D628];
  }
  else
  {
    v24 = v12 - v13;
    v25 = v15 - v14;
    return CGRectIntegral(*(CGRect *)&v13);
  }
}

- (id)maskTransformedBy:(id)a3
{
  id v4;
  PKStrokeMask *v5;

  v4 = a3;
  v5 = -[PKStrokeMask initWithMaskPaths:centerlineSlices:]([PKStrokeMask alloc], "initWithMaskPaths:centerlineSlices:", &self->_maskPaths, &self->_centerlineSlices);
  -[PKStrokeMask _transformBy:](v5, "_transformBy:", v4);

  return v5;
}

- (void)_transformBy:(id)a3
{
  uint64_t **end;
  uint64_t **begin;
  uint64_t *v6;
  uint64_t *v7;
  float64x2_t v8;
  float64_t v9;
  float64x2_t v10;
  double (**v11)(double, double);

  v11 = (double (**)(double, double))a3;
  begin = (uint64_t **)self->_maskPaths.__begin_;
  end = (uint64_t **)self->_maskPaths.__end_;
  if (begin != end)
  {
    v10 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    do
    {
      v6 = *begin;
      v7 = begin[1];
      while (v6 != v7)
      {
        v8.f64[0] = v11[2]((double)*v6 / 100.0, (double)v6[1] / 100.0);
        v8.f64[1] = v9;
        *(int64x2_t *)v6 = vcvtq_s64_f64(vmulq_f64(v8, v10));
        v6 += 3;
      }
      begin += 3;
    }
    while (begin != end);
  }

}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  vector<std::vector<ClipperLib::IntPoint>, std::allocator<std::vector<ClipperLib::IntPoint>>> *p_maskPaths;

  begin = self->_centerlineSlices.__begin_;
  if (begin)
  {
    self->_centerlineSlices.__end_ = begin;
    operator delete(begin);
  }
  p_maskPaths = &self->_maskPaths;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_maskPaths);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)calculateCenterlineSlices:(uint64_t)a3
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  unint64_t v17;
  double *v18;
  double v19;
  double v20;
  double *v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  unint64_t v26;
  double *v27;
  double v28;
  double v29;
  double v30;
  double *v31;
  double v32;
  __int128 *v33;
  __int128 *v34;
  __int128 *v35;
  double *v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  double *v41;
  BOOL v43;
  uint64_t v44;
  unint64_t v45;
  double *v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  int64_t v52;
  int64_t v53;
  int64_t v54;
  uint64_t v55;
  double *v56;
  double *v57;
  __int128 v58;
  double *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double *v64;
  double *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  double *v70;
  double v71;
  uint64_t v72;
  double *v73;
  double *v75;
  double v76;
  uint64_t v77;
  double *v78;
  double v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;

@end
