@implementation PKPathUtility

+ (vector<CGPoint,)unorderedSimplifiedPointsFromPoints:(id)a2 factor:(SEL)a3
{
  unint64_t v5;
  double *v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint8x8_t v18;
  unint64_t v19;
  double **v20;
  double *i;
  unint64_t v22;
  double **v24;
  double *j;
  unint64_t v26;
  _QWORD *v28;
  float v29;
  _BOOL8 v30;
  unint64_t v31;
  unint64_t v32;
  size_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  CGPoint *value;
  CGPoint *end;
  CGPoint *v39;
  CGPoint *begin;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  CGPoint *v46;
  CGPoint *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  float v52;

  v50 = 0u;
  v51 = 0u;
  v52 = 1.0;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  std::vector<CGPoint>::reserve((void **)&retstr->__begin_, (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4);
  v9 = *(double **)a4;
  v10 = (double *)*((_QWORD *)a4 + 1);
  if (*(double **)a4 != v10)
  {
    while (1)
    {
      v12 = *v9;
      v11 = v9[1];
      v13 = floor(*v9 / a5);
      v14 = floor(v11 / a5);
      *(double *)&v49 = v13;
      *((double *)&v49 + 1) = v14;
      v15 = PKHashBytes((uint64_t)&v49, 16);
      v16 = v15;
      v17 = *((_QWORD *)&v50 + 1);
      if (*((_QWORD *)&v50 + 1))
      {
        v18 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v50 + 8));
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          v19 = v15;
          if (v15 >= *((_QWORD *)&v50 + 1))
            v19 = v15 % *((_QWORD *)&v50 + 1);
        }
        else
        {
          v19 = (*((_QWORD *)&v50 + 1) - 1) & v15;
        }
        v20 = *(double ***)(v50 + 8 * v19);
        if (v20)
        {
          for (i = *v20; i; i = *(double **)i)
          {
            v22 = *((_QWORD *)i + 1);
            if (v22 == v15)
            {
              if (i[2] == v13 && i[3] == v14)
                goto LABEL_81;
            }
            else
            {
              if (v18.u32[0] > 1uLL)
              {
                if (v22 >= *((_QWORD *)&v50 + 1))
                  v22 %= *((_QWORD *)&v50 + 1);
              }
              else
              {
                v22 &= *((_QWORD *)&v50 + 1) - 1;
              }
              if (v22 != v19)
                break;
            }
          }
        }
        if (v18.u32[0] > 1uLL)
        {
          v5 = v15;
          if (v15 >= *((_QWORD *)&v50 + 1))
            v5 = v15 % *((_QWORD *)&v50 + 1);
        }
        else
        {
          v5 = (*((_QWORD *)&v50 + 1) - 1) & v15;
        }
        v24 = *(double ***)(v50 + 8 * v5);
        if (v24)
        {
          for (j = *v24; j; j = *(double **)j)
          {
            v26 = *((_QWORD *)j + 1);
            if (v26 == v15)
            {
              if (j[2] == v13 && j[3] == v14)
                goto LABEL_64;
            }
            else
            {
              if (v18.u32[0] > 1uLL)
              {
                if (v26 >= *((_QWORD *)&v50 + 1))
                  v26 %= *((_QWORD *)&v50 + 1);
              }
              else
              {
                v26 &= *((_QWORD *)&v50 + 1) - 1;
              }
              if (v26 != v5)
                break;
            }
          }
        }
      }
      v28 = operator new(0x20uLL);
      *v28 = 0;
      v28[1] = v16;
      *((_OWORD *)v28 + 1) = v49;
      v29 = (float)(unint64_t)(*((_QWORD *)&v51 + 1) + 1);
      if (!v17 || (float)(v52 * (float)v17) < v29)
      {
        v30 = v17 < 3 || (v17 & (v17 - 1)) != 0;
        v31 = v30 | (2 * v17);
        v32 = vcvtps_u32_f32(v29 / v52);
        if (v31 <= v32)
          v33 = v32;
        else
          v33 = v31;
        v17 = *((_QWORD *)&v50 + 1);
        if ((*((_QWORD *)&v50 + 1) & (*((_QWORD *)&v50 + 1) - 1)) != 0)
        {
          if (v16 >= *((_QWORD *)&v50 + 1))
            v5 = v16 % *((_QWORD *)&v50 + 1);
          else
            v5 = v16;
        }
        else
        {
          v5 = (*((_QWORD *)&v50 + 1) - 1) & v16;
        }
      }
      v34 = v50;
      v35 = *(_QWORD **)(v50 + 8 * v5);
      if (v35)
        break;
      *v28 = v51;
      *(_QWORD *)&v51 = v28;
      *(_QWORD *)(v34 + 8 * v5) = &v51;
      if (*v28)
      {
        v36 = *(_QWORD *)(*v28 + 8);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v36 >= v17)
            v36 %= v17;
        }
        else
        {
          v36 &= v17 - 1;
        }
        v35 = (_QWORD *)(v50 + 8 * v36);
        goto LABEL_62;
      }
LABEL_63:
      ++*((_QWORD *)&v51 + 1);
LABEL_64:
      end = retstr->__end_;
      value = retstr->__end_cap_.__value_;
      if (end >= value)
      {
        begin = retstr->__begin_;
        v41 = end - retstr->__begin_;
        v42 = v41 + 1;
        if ((unint64_t)(v41 + 1) >> 60)
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        v43 = (char *)value - (char *)begin;
        if (v43 >> 3 > v42)
          v42 = v43 >> 3;
        if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0)
          v44 = 0xFFFFFFFFFFFFFFFLL;
        else
          v44 = v42;
        if (v44)
        {
          v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&retstr->__end_cap_, v44);
          begin = retstr->__begin_;
          end = retstr->__end_;
        }
        else
        {
          v45 = 0;
        }
        v46 = (CGPoint *)&v45[16 * v41];
        v46->x = v12;
        v46->y = v11;
        v47 = v46;
        if (end != begin)
        {
          do
          {
            v47[-1] = end[-1];
            --v47;
            --end;
          }
          while (end != begin);
          begin = retstr->__begin_;
        }
        v39 = v46 + 1;
        retstr->__begin_ = v47;
        retstr->__end_ = v46 + 1;
        retstr->__end_cap_.__value_ = (CGPoint *)&v45[16 * v44];
        if (begin)
          operator delete(begin);
      }
      else
      {
        end->x = v12;
        end->y = v11;
        v39 = end + 1;
      }
      retstr->__end_ = v39;
LABEL_81:
      v9 += 2;
      if (v9 == v10)
    }
    *v28 = *v35;
LABEL_62:
    *v35 = v28;
    goto LABEL_63;
  }
}

+ (void)smoothedHullForPoints:(const void *)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *__p[3];

  v6 = (void (**)(id, void *))a4;
  if (*(_QWORD *)a3 == *((_QWORD *)a3 + 1))
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);

  }
  else
  {
    objc_msgSend(a1, "smoothedHullForPoints:alpha:granularity:minAngleFactor:maxLengthThreshold:edgeRemovalConstant:", a3, 0.5, 100.0, 1.57079633, 5.0, 0.3);
    objc_msgSend(a1, "bezierPathFromPoints:", __p);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);

    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }

}

+ (id)bezierPathFromPoints:(const void *)a3
{
  void *v4;
  double *v5;
  uint64_t v6;
  unint64_t v7;

  if (*((_QWORD *)a3 + 1) - *(_QWORD *)a3 < 0x11uLL)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "moveToPoint:", **(double **)a3, *(double *)(*(_QWORD *)a3 + 8));
    v5 = *(double **)a3;
    if (*((_QWORD *)a3 + 1) - *(_QWORD *)a3 >= 0x11uLL)
    {
      v6 = 0;
      v7 = 1;
      do
      {
        objc_msgSend(v4, "addLineToPoint:", v5[v6 + 2], v5[v6 + 3]);
        ++v7;
        v5 = *(double **)a3;
        v6 += 2;
      }
      while (v7 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
    }
    objc_msgSend(v4, "closePath");
  }
  return v4;
}

+ (vector<CGPoint,)smoothedHullForPoints:(id)a2
{
  return (vector<CGPoint, std::allocator<CGPoint>> *)objc_msgSend(a2, "smoothedHullForPoints:alpha:granularity:minAngleFactor:maxLengthThreshold:edgeRemovalConstant:", a4, 0.5, 100.0, 1.57079633, 5.0, 0.3);
}

+ (vector<CGPoint,)smoothedHullForPoints:(id)a2 alpha:(SEL)a3 granularity:(const void *)a4 minAngleFactor:(double)a5 maxLengthThreshold:(double)a6 edgeRemovalConstant:(double)a7
{
  vector<CGPoint, std::allocator<CGPoint>> *result;
  void *__p;
  void *v18;
  uint64_t v19;

  __p = 0;
  v18 = 0;
  v19 = 0;
  +[PKPathUtility convexHull:forPoints:](PKPathUtility, "convexHull:forPoints:", &__p, a4);
  objc_msgSend(a2, "openConvexHullToConcave:points:minAngleFactor:maxLengthThreshold:edgeRemovalConstant:", &__p, a4, a7, a8, a9);
  objc_msgSend(a2, "centripetalCatmullRomPointsFromConvexHull:alpha:granularity:", &__p, a5, a6);
  result = (vector<CGPoint, std::allocator<CGPoint>> *)__p;
  if (__p)
  {
    v18 = __p;
    operator delete(__p);
  }
  return result;
}

+ (void)convexHull:(void *)a3 forPoints:(const void *)a4
{
  __n128 v5;
  double v6;
  double v7;
  char *v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  double *v12;
  double v13;
  double v14;
  char *v16;
  int64_t v17;
  char *v18;
  uint64_t v19;
  __n128 *v20;
  __n128 *v21;
  uint64_t v22;
  __n128 *v23;
  double v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  __n128 *v32;
  const std::nothrow_t *v33;
  unint64_t v34;
  void *v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  __n128 *v40;
  __n128 v41;
  double *v42;
  double *v43;
  double *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  double *v50;
  char *v51;
  char *v52;
  char *v53;
  unint64_t v54;
  __int128 v55;
  double *v56;
  double *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  double *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  double *v73;
  double *v74;
  double **v75;
  double *v76;
  double *v77;
  double *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  double *v84;
  _OWORD *v85;
  _OWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  double *v94;
  double *v95;
  _OWORD *v96;
  unint64_t v97;
  double *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  char *v104;
  char *v105;
  double *v106;
  double *v107;
  unint64_t v108;
  double *v109;
  double *v110;
  double v111;
  double v112;
  uint64_t i;
  double v114;
  double v115;
  BOOL v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char *v121;
  char *v122;
  double *v123;
  double *v124;
  char *v125;
  __int128 v126;
  __int128 v127;
  void *__p;
  double *v129;
  double *v130;
  void *v131;
  char *v132;
  uint64_t v133;

  v131 = 0;
  v132 = 0;
  v133 = 0;
  std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(&v131, *(const void **)a4, *((_QWORD *)a4 + 1), (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4);
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v8 = (char *)v131;
  if (v132 == v131)
  {
    v10 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = (v132 - (_BYTE *)v131) >> 4;
    if (v11 <= 1)
      v11 = 1;
    v12 = (double *)((char *)v131 + 8);
    v5.n128_u64[0] = 0xFFEFFFFFFFFFFFFFLL;
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v14 = *MEMORY[0x1E0C9D538];
    do
    {
      v6 = *(v12 - 1);
      v7 = *v12;
      if (*v12 <= v5.n128_f64[0])
      {
        if (*v12 == v5.n128_f64[0] && v6 < v14)
        {
          v10 = v9;
        }
        else
        {
          v6 = v14;
          v7 = v13;
        }
      }
      else
      {
        v10 = v9;
        v5.n128_f64[0] = *v12;
      }
      ++v9;
      v12 += 2;
      v13 = v7;
      v14 = v6;
    }
    while (v11 != v9);
  }
  v16 = (char *)v131 + 16 * v10;
  v17 = v132 - (v16 + 16);
  if (v132 != v16 + 16)
  {
    memmove((char *)v131 + 16 * v10, v16 + 16, v132 - (v16 + 16));
    v8 = (char *)v131;
  }
  v18 = &v16[v17];
  v132 = &v16[v17];
  v19 = &v16[v17] - v8;
  if (&v16[v17] == v8)
  {
    v20 = 0;
    v21 = 0;
  }
  else
  {
    if (v19 < 0)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v20 = (__n128 *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::LocalMinimum>>(v19 >> 4);
    v21 = (__n128 *)((char *)v20 + 24 * v22);
    v8 = (char *)v131;
    v18 = v132;
  }
  if (v8 >= v18)
  {
    v23 = v20;
  }
  else
  {
    v23 = v20;
    do
    {
      v25 = *(double *)v8;
      v24 = *((double *)v8 + 1);
      v5.n128_f64[0] = atan2(v24 - v7, *(double *)v8 - v6);
      v26 = v5.n128_u64[0];
      if (v23 >= v21)
      {
        v27 = 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v20) >> 3) + 1;
        if (v27 > 0xAAAAAAAAAAAAAAALL)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * (((char *)v21 - (char *)v20) >> 3) > v27)
          v27 = 0x5555555555555556 * (((char *)v21 - (char *)v20) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v21 - (char *)v20) >> 3) >= 0x555555555555555)
          v28 = 0xAAAAAAAAAAAAAAALL;
        else
          v28 = v27;
        if (v28)
          v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::LocalMinimum>>(v28);
        else
          v29 = 0;
        v30 = v28 + 8 * (((char *)v23 - (char *)v20) >> 3);
        *(double *)v30 = v25;
        *(double *)(v30 + 8) = v24;
        *(_QWORD *)(v30 + 16) = v26;
        if (v23 == v20)
        {
          v32 = (__n128 *)(v28 + 8 * (((char *)v23 - (char *)v20) >> 3));
        }
        else
        {
          v31 = v28 + 8 * (((char *)v23 - (char *)v20) >> 3);
          do
          {
            v5 = *(__n128 *)((char *)v23 - 24);
            v32 = (__n128 *)(v31 - 24);
            *(_QWORD *)(v31 - 8) = v23[-1].n128_u64[1];
            *(__n128 *)(v31 - 24) = v5;
            v23 = (__n128 *)((char *)v23 - 24);
            v31 -= 24;
          }
          while (v23 != v20);
        }
        v21 = (__n128 *)(v28 + 24 * v29);
        v23 = (__n128 *)(v30 + 24);
        if (v20)
          operator delete(v20);
        v20 = v32;
      }
      else
      {
        v23->n128_f64[0] = v25;
        v23->n128_f64[1] = v24;
        v23[1].n128_u64[0] = v5.n128_u64[0];
        v23 = (__n128 *)((char *)v23 + 24);
      }
      v8 += 16;
    }
    while (v8 < v132);
  }
  if ((char *)v23 - (char *)v20 < 3073)
  {
LABEL_50:
    std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(v20, v23, 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v20) >> 3), 0, 0, v5);
  }
  else
  {
    v33 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
    v34 = 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v20) >> 3);
    while (1)
    {
      v35 = operator new(24 * v34, v33);
      if (v35)
        break;
      v36 = v34 > 1;
      v34 >>= 1;
      if (!v36)
        goto LABEL_50;
    }
    v37 = v35;
    std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(v20, v23, 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v20) >> 3), (uint64_t)v35, v34, v5);
    operator delete(v37);
  }
  if (v23 != v20)
  {
    v38 = 0;
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v20) >> 3) <= 1)
      v39 = 1;
    else
      v39 = 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v20) >> 3);
    v40 = v20;
    do
    {
      v41 = *v40;
      v40 = (__n128 *)((char *)v40 + 24);
      *(__n128 *)((char *)v131 + v38) = v41;
      v38 += 16;
      --v39;
    }
    while (v39);
  }
  __p = 0;
  v129 = 0;
  v130 = 0;
  std::vector<CGPoint>::reserve(&__p, (v132 - (_BYTE *)v131) >> 4);
  v42 = v129;
  if (v129 >= v130)
  {
    v44 = (double *)__p;
    v45 = ((char *)v129 - (_BYTE *)__p) >> 4;
    v46 = v45 + 1;
    if ((unint64_t)(v45 + 1) >> 60)
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    v47 = (char *)v130 - (_BYTE *)__p;
    if (((char *)v130 - (_BYTE *)__p) >> 3 > v46)
      v46 = v47 >> 3;
    if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0)
      v48 = 0xFFFFFFFFFFFFFFFLL;
    else
      v48 = v46;
    if (v48)
    {
      v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v130, v48);
      v44 = (double *)__p;
      v42 = v129;
    }
    else
    {
      v49 = 0;
    }
    v50 = (double *)&v49[16 * v45];
    v51 = &v49[16 * v48];
    *v50 = v6;
    v50[1] = v7;
    v43 = v50 + 2;
    if (v42 != v44)
    {
      do
      {
        *((_OWORD *)v50 - 1) = *((_OWORD *)v42 - 1);
        v50 -= 2;
        v42 -= 2;
      }
      while (v42 != v44);
      v44 = (double *)__p;
    }
    __p = v50;
    v129 = v43;
    v130 = (double *)v51;
    if (v44)
      operator delete(v44);
  }
  else
  {
    *v129 = v6;
    v42[1] = v7;
    v43 = v42 + 2;
  }
  v129 = v43;
  v53 = (char *)v131;
  v52 = v132;
  if (v132 - (_BYTE *)v131 != 16)
  {
    v54 = 0;
    do
    {
      v55 = *(_OWORD *)&v53[16 * v54++];
      v126 = v55;
      if (fabs((*((double *)&v55 + 1) - v7) * (*(double *)&v53[16 * v54] - *(double *)&v55)- (*(double *)&v55 - v6) * (*(double *)&v53[16 * v54 + 8] - *((double *)&v55 + 1))) >= 0.000001)
      {
        if (v43 >= v130)
        {
          v57 = (double *)__p;
          v58 = ((char *)v43 - (_BYTE *)__p) >> 4;
          v59 = v58 + 1;
          if ((unint64_t)(v58 + 1) >> 60)
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          v60 = (char *)v130 - (_BYTE *)__p;
          if (((char *)v130 - (_BYTE *)__p) >> 3 > v59)
            v59 = v60 >> 3;
          if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0)
            v61 = 0xFFFFFFFFFFFFFFFLL;
          else
            v61 = v59;
          if (v61)
          {
            v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v130, v61);
            v57 = (double *)__p;
            v43 = v129;
          }
          else
          {
            v62 = 0;
          }
          v63 = (double *)&v62[16 * v58];
          *(_OWORD *)v63 = v126;
          v56 = v63 + 2;
          if (v43 != v57)
          {
            do
            {
              *((_OWORD *)v63 - 1) = *((_OWORD *)v43 - 1);
              v63 -= 2;
              v43 -= 2;
            }
            while (v43 != v57);
            v57 = (double *)__p;
          }
          __p = v63;
          v129 = v56;
          v130 = (double *)&v62[16 * v61];
          if (v57)
            operator delete(v57);
        }
        else
        {
          *(_OWORD *)v43 = v55;
          v56 = v43 + 2;
        }
        v129 = v56;
        v43 = v56;
        v53 = (char *)v131;
        v52 = v132;
      }
    }
    while (((v52 - v53) >> 4) - 1 > v54);
  }
  v127 = *((_OWORD *)v52 - 1);
  if (v43 >= v130)
  {
    v65 = ((char *)v43 - (_BYTE *)__p) >> 4;
    if ((unint64_t)(v65 + 1) >> 60)
      goto LABEL_201;
    v66 = ((char *)v130 - (_BYTE *)__p) >> 3;
    if (v66 <= v65 + 1)
      v66 = v65 + 1;
    if ((unint64_t)((char *)v130 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF0)
      v67 = 0xFFFFFFFFFFFFFFFLL;
    else
      v67 = v66;
    if (v67)
      v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v130, v67);
    else
      v68 = 0;
    v69 = &v68[16 * v65];
    v70 = &v68[16 * v67];
    *(_OWORD *)v69 = v127;
    v64 = (uint64_t)(v69 + 16);
    v72 = (char *)__p;
    v71 = (char *)v129;
    if (v129 != __p)
    {
      do
      {
        *((_OWORD *)v69 - 1) = *((_OWORD *)v71 - 1);
        v69 -= 16;
        v71 -= 16;
      }
      while (v71 != v72);
      v71 = (char *)__p;
    }
    __p = v69;
    v129 = (double *)v64;
    v130 = (double *)v70;
    if (v71)
      operator delete(v71);
  }
  else
  {
    *(_OWORD *)v43 = *((_OWORD *)v52 - 1);
    v64 = (uint64_t)(v43 + 2);
  }
  v129 = (double *)v64;
  v73 = (double *)__p;
  if ((unint64_t)(v64 - (_QWORD)__p) <= 0x2F)
  {
    if (&__p != a3)
    {
      std::vector<CGPoint>::__assign_with_size[abi:ne180100]<CGPoint*,CGPoint*>((char *)a3, (char *)__p, v64, (v64 - (uint64_t)__p) >> 4);
      v73 = (double *)__p;
    }
    goto LABEL_189;
  }
  std::vector<CGPoint>::reserve((void **)a3, (v64 - (uint64_t)__p) >> 4);
  v75 = (double **)((char *)a3 + 16);
  v74 = (double *)*((_QWORD *)a3 + 2);
  v76 = (double *)*((_QWORD *)a3 + 1);
  if (v76 >= v74)
  {
    v78 = *(double **)a3;
    v79 = ((uint64_t)v76 - *(_QWORD *)a3) >> 4;
    v80 = v79 + 1;
    if ((unint64_t)(v79 + 1) >> 60)
      goto LABEL_201;
    v81 = (char *)v74 - (char *)v78;
    if (v81 >> 3 > v80)
      v80 = v81 >> 3;
    if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFF0)
      v82 = 0xFFFFFFFFFFFFFFFLL;
    else
      v82 = v80;
    if (v82)
    {
      v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 16, v82);
      v78 = *(double **)a3;
      v76 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v83 = 0;
    }
    v84 = (double *)&v83[16 * v79];
    v74 = (double *)&v83[16 * v82];
    *v84 = v6;
    v84[1] = v7;
    v77 = v84 + 2;
    if (v76 != v78)
    {
      do
      {
        *((_OWORD *)v84 - 1) = *((_OWORD *)v76 - 1);
        v84 -= 2;
        v76 -= 2;
      }
      while (v76 != v78);
      v78 = *(double **)a3;
    }
    *(_QWORD *)a3 = v84;
    *((_QWORD *)a3 + 1) = v77;
    *((_QWORD *)a3 + 2) = v74;
    if (v78)
    {
      operator delete(v78);
      v74 = *v75;
    }
  }
  else
  {
    *v76 = v6;
    v76[1] = v7;
    v77 = v76 + 2;
  }
  *((_QWORD *)a3 + 1) = v77;
  v85 = (char *)__p + 16;
  if (v77 >= v74)
  {
    v87 = ((uint64_t)v77 - *(_QWORD *)a3) >> 4;
    if ((unint64_t)(v87 + 1) >> 60)
      goto LABEL_201;
    v88 = (uint64_t)v74 - *(_QWORD *)a3;
    v89 = v88 >> 3;
    if (v88 >> 3 <= (unint64_t)(v87 + 1))
      v89 = v87 + 1;
    if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFF0)
      v90 = 0xFFFFFFFFFFFFFFFLL;
    else
      v90 = v89;
    if (v90)
      v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 16, v90);
    else
      v91 = 0;
    v92 = &v91[16 * v87];
    v93 = &v91[16 * v90];
    *(_OWORD *)v92 = *v85;
    v86 = v92 + 16;
    v95 = *(double **)a3;
    v94 = (double *)*((_QWORD *)a3 + 1);
    if (v94 != *(double **)a3)
    {
      do
      {
        *((_OWORD *)v92 - 1) = *((_OWORD *)v94 - 1);
        v92 -= 16;
        v94 -= 2;
      }
      while (v94 != v95);
      v94 = *(double **)a3;
    }
    *(_QWORD *)a3 = v92;
    *((_QWORD *)a3 + 1) = v86;
    *((_QWORD *)a3 + 2) = v93;
    if (v94)
      operator delete(v94);
  }
  else
  {
    *(_OWORD *)v77 = *v85;
    v86 = v77 + 2;
  }
  *((_QWORD *)a3 + 1) = v86;
  v96 = (char *)__p + 32;
  v97 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v86 >= v97)
  {
    v99 = ((uint64_t)v86 - *(_QWORD *)a3) >> 4;
    if (!((unint64_t)(v99 + 1) >> 60))
    {
      v100 = v97 - *(_QWORD *)a3;
      v101 = v100 >> 3;
      if (v100 >> 3 <= (unint64_t)(v99 + 1))
        v101 = v99 + 1;
      if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFF0)
        v102 = 0xFFFFFFFFFFFFFFFLL;
      else
        v102 = v101;
      if (v102)
        v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 16, v102);
      else
        v103 = 0;
      v104 = &v103[16 * v99];
      v105 = &v103[16 * v102];
      *(_OWORD *)v104 = *v96;
      v98 = (double *)(v104 + 16);
      v107 = *(double **)a3;
      v106 = (double *)*((_QWORD *)a3 + 1);
      if (v106 != *(double **)a3)
      {
        do
        {
          *((_OWORD *)v104 - 1) = *((_OWORD *)v106 - 1);
          v104 -= 16;
          v106 -= 2;
        }
        while (v106 != v107);
        v106 = *(double **)a3;
      }
      *(_QWORD *)a3 = v104;
      *((_QWORD *)a3 + 1) = v98;
      *((_QWORD *)a3 + 2) = v105;
      if (v106)
        operator delete(v106);
      goto LABEL_162;
    }
LABEL_201:
    std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
  }
  *v86 = *v96;
  v98 = (double *)(v86 + 1);
LABEL_162:
  *((_QWORD *)a3 + 1) = v98;
  v73 = (double *)__p;
  if ((unint64_t)((char *)v129 - (_BYTE *)__p) >= 0x31)
  {
    v108 = 3;
    do
    {
      v109 = *(double **)a3;
      v110 = &v73[2 * v108];
      v111 = *v110;
      v112 = v110[1];
      for (i = (uint64_t)v98 - *(_QWORD *)a3; ; i -= 16)
      {
        v114 = (*(double *)((char *)v109 + i - 8) - *(double *)((char *)v109 + i - 24))
             * (v111 - *(double *)((char *)v109 + i - 16))
             - (*(double *)((char *)v109 + i - 16) - *(double *)((char *)v109 + i - 32))
             * (v112 - *(double *)((char *)v109 + i - 8));
        v115 = fabs(v114);
        v116 = v114 > 0.0 || v115 < 0.000001;
        if (!v116 || (unint64_t)i < 0x21)
          break;
        v98 -= 2;
        *((_QWORD *)a3 + 1) = v98;
      }
      if (v98 >= *v75)
      {
        v117 = i >> 4;
        v118 = (i >> 4) + 1;
        if (v118 >> 60)
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        v119 = (char *)*v75 - (char *)v109;
        if (v119 >> 3 > v118)
          v118 = v119 >> 3;
        if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFF0)
          v120 = 0xFFFFFFFFFFFFFFFLL;
        else
          v120 = v118;
        if (v120)
          v121 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 16, v120);
        else
          v121 = 0;
        v122 = &v121[16 * v117];
        *(_OWORD *)v122 = *(_OWORD *)v110;
        v124 = *(double **)a3;
        v123 = (double *)*((_QWORD *)a3 + 1);
        v125 = v122;
        if (v123 != *(double **)a3)
        {
          do
          {
            *((_OWORD *)v125 - 1) = *((_OWORD *)v123 - 1);
            v125 -= 16;
            v123 -= 2;
          }
          while (v123 != v124);
          v123 = *(double **)a3;
        }
        v98 = (double *)(v122 + 16);
        *(_QWORD *)a3 = v125;
        *((_QWORD *)a3 + 1) = v122 + 16;
        *((_QWORD *)a3 + 2) = &v121[16 * v120];
        if (v123)
          operator delete(v123);
      }
      else
      {
        *(_OWORD *)v98 = *(_OWORD *)v110;
        v98 += 2;
      }
      *((_QWORD *)a3 + 1) = v98;
      ++v108;
      v73 = (double *)__p;
    }
    while (v108 < ((char *)v129 - (_BYTE *)__p) >> 4);
  }
LABEL_189:
  if (v73)
  {
    v129 = v73;
    operator delete(v73);
  }
  if (v20)
    operator delete(v20);
  if (v131)
  {
    v132 = (char *)v131;
    operator delete(v131);
  }
}

+ (vector<CGPoint,)centripetalCatmullRomPointsFromConvexHull:(id)a2 alpha:(SEL)a3 granularity:(const void *)a4
{
  vector<CGPoint, std::allocator<CGPoint>> *result;
  double v10;
  double v11;
  CGPoint *value;
  __compressed_pair<CGPoint *, std::allocator<CGPoint>> *p_end_cap;
  CGPoint *end;
  CGPoint *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  CGPoint *v21;
  CGPoint *v22;
  double *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  float v27;
  double v28;
  double v29;
  int v30;
  unsigned int v31;
  unint64_t v32;
  double *v33;
  double *v34;
  double v35;
  double v36;
  double *v37;
  double v38;
  double v39;
  double *v40;
  double v41;
  double v42;
  float v43;
  float v44;
  double v45;
  float v46;
  float v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  CGPoint *v71;
  CGPoint *v72;
  float v73;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  std::vector<CGPoint>::reserve((void **)&retstr->__begin_, 0);
  v11 = **(double **)a4;
  v10 = *(double *)(*(_QWORD *)a4 + 8);
  p_end_cap = &retstr->__end_cap_;
  value = retstr->__end_cap_.__value_;
  end = retstr->__end_;
  if (end >= value)
  {
    result = (vector<CGPoint, std::allocator<CGPoint>> *)retstr->__begin_;
    v16 = end - retstr->__begin_;
    v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) >> 60)
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    v18 = (char *)value - (char *)result;
    if (v18 >> 3 > v17)
      v17 = v18 >> 3;
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0)
      v19 = 0xFFFFFFFFFFFFFFFLL;
    else
      v19 = v17;
    if (v19)
    {
      v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&retstr->__end_cap_, v19);
      result = (vector<CGPoint, std::allocator<CGPoint>> *)retstr->__begin_;
      end = retstr->__end_;
    }
    else
    {
      v20 = 0;
    }
    v21 = (CGPoint *)&v20[16 * v16];
    v22 = (CGPoint *)&v20[16 * v19];
    v21->x = v11;
    v21->y = v10;
    v15 = v21 + 1;
    if (end != (CGPoint *)result)
    {
      do
      {
        v21[-1] = end[-1];
        --v21;
        --end;
      }
      while (end != (CGPoint *)result);
      result = (vector<CGPoint, std::allocator<CGPoint>> *)retstr->__begin_;
    }
    retstr->__begin_ = v21;
    retstr->__end_ = v15;
    retstr->__end_cap_.__value_ = v22;
    if (result)
      operator delete(result);
  }
  else
  {
    end->x = v11;
    end->y = v10;
    v15 = end + 1;
  }
  retstr->__end_ = v15;
  v23 = *(double **)a4;
  v24 = *((_QWORD *)a4 + 1);
  if (v24 != *(_QWORD *)a4)
  {
    v25 = 0;
    v26 = (unint64_t)(v24 - *(_QWORD *)a4) >> 4;
    v27 = a5;
    v28 = 0.0;
    v73 = v27;
    do
    {
      v29 = v28;
      v30 = v25 + 2;
      v31 = (int)v25 % (int)v26;
      if (v25)
        v32 = v25;
      else
        v32 = v26;
      ++v25;
      v33 = (double *)((char *)v23 + ((uint64_t)((v32 << 32) - 0x100000000) >> 28));
      v34 = &v23[2 * v31];
      v35 = *v34;
      v36 = v34[1];
      v37 = &v23[2 * ((int)v25 % (int)v26)];
      v38 = *v37;
      v39 = v37[1];
      v40 = &v23[2 * (v30 % (int)v26)];
      v86 = v33[1];
      v87 = *v33;
      v84 = v36;
      v85 = v35;
      v41 = sqrt((v39 - v36) * (v39 - v36) + (v38 - v35) * (v38 - v35));
      v82 = v39;
      v83 = *v37;
      v80 = v40[1];
      v81 = *v40;
      v42 = sqrt((v80 - v39) * (v80 - v39) + (v81 - v38) * (v81 - v38));
      v43 = sqrt((v36 - v86) * (v36 - v86) + (v35 - v87) * (v35 - v87));
      v28 = v28 + powf(v43, v27);
      v44 = v41;
      v45 = v28 + powf(v44, v27);
      v46 = v42;
      v47 = powf(v46, v27);
      if (v28 < v45)
      {
        v48 = v10;
        v49 = v11;
        v76 = v28 - v29;
        v77 = v45 + v47;
        v50 = v45 - v28;
        v51 = v77 - v45;
        v78 = v29;
        v79 = v28;
        v52 = v45 - v29;
        v53 = v77 - v28;
        v75 = (v45 - v28) / a6;
        do
        {
          v54 = (v79 - v28) / v76;
          v55 = (v28 - v78) / v76;
          v56 = v87 * v54 + v85 * v55;
          v57 = v86 * v54 + v84 * v55;
          v58 = (v45 - v28) / v50;
          v59 = (v28 - v79) / v50;
          v60 = (v77 - v28) / v51;
          v61 = (v28 - v45) / v51;
          v62 = (v45 - v28) / v52;
          v63 = (v28 - v78) / v52;
          v64 = (v77 - v28) / v53;
          v65 = (v28 - v79) / v53;
          v11 = v58 * (v62 * v56 + v63 * (v85 * v58 + v83 * v59))
              + v59 * (v64 * (v85 * v58 + v83 * v59) + v65 * (v83 * v60 + v81 * v61));
          v10 = v58 * (v62 * v57 + v63 * (v84 * v58 + v82 * v59))
              + v59 * (v64 * (v84 * v58 + v82 * v59) + v65 * (v82 * v60 + v80 * v61));
          if (floor(v49) == floor(v11) && floor(v48) == floor(v10))
          {
            v11 = v49;
            v10 = v48;
          }
          else
          {
            if (v15 >= p_end_cap->__value_)
            {
              result = (vector<CGPoint, std::allocator<CGPoint>> *)retstr->__begin_;
              v66 = v15 - retstr->__begin_;
              v67 = v66 + 1;
              if ((unint64_t)(v66 + 1) >> 60)
                std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
              v68 = (char *)p_end_cap->__value_ - (char *)result;
              if (v68 >> 3 > v67)
                v67 = v68 >> 3;
              if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF0)
                v69 = 0xFFFFFFFFFFFFFFFLL;
              else
                v69 = v67;
              if (v69)
              {
                v70 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&retstr->__end_cap_, v69);
                result = (vector<CGPoint, std::allocator<CGPoint>> *)retstr->__begin_;
                v15 = retstr->__end_;
              }
              else
              {
                v70 = 0;
              }
              v71 = (CGPoint *)&v70[16 * v66];
              v71->x = v11;
              v71->y = v10;
              v72 = v71;
              if (v15 != (CGPoint *)result)
              {
                do
                {
                  v72[-1] = v15[-1];
                  --v72;
                  --v15;
                }
                while (v15 != (CGPoint *)result);
                result = (vector<CGPoint, std::allocator<CGPoint>> *)retstr->__begin_;
              }
              v15 = v71 + 1;
              retstr->__begin_ = v72;
              retstr->__end_ = v71 + 1;
              retstr->__end_cap_.__value_ = (CGPoint *)&v70[16 * v69];
              if (result)
                operator delete(result);
            }
            else
            {
              v15->x = v11;
              v15->y = v10;
              ++v15;
            }
            retstr->__end_ = v15;
            v48 = v10;
            v49 = v11;
          }
          v28 = v75 + v28;
        }
        while (v28 < v45);
        v23 = *(double **)a4;
        v24 = *((_QWORD *)a4 + 1);
        v27 = v73;
        v28 = v79;
      }
    }
    while (v25 < (v24 - (uint64_t)v23) >> 4);
  }
  return result;
}

+ (double)averageDistanceForEdge:(Edge)a3 withPoints:(const void *)a4
{
  double *v4;
  double *v5;
  int v6;
  double v7;
  double v8;
  double v10;

  v4 = *(double **)a4;
  v5 = (double *)*((_QWORD *)a4 + 1);
  if (*(double **)a4 == v5)
  {
    v6 = 0;
    v7 = 0.0;
  }
  else
  {
    v6 = 0;
    v7 = 0.0;
    do
    {
      v8 = v4[1];
      if (*v4 != a3.var0.x || v8 != a3.var0.y)
      {
        v10 = sqrt((a3.var0.y - v8) * (a3.var0.y - v8) + (a3.var0.x - *v4) * (a3.var0.x - *v4));
        if (v10 >= 150.0)
          v10 = -0.0;
        else
          ++v6;
        v7 = v7 + v10;
      }
      v4 += 2;
    }
    while (v4 != v5);
  }
  return v7 / (double)v6;
}

+ (CGPoint)pointWithMinAngleForEdge:(Edge)a3 fromPoints:(const void *)a4 minAngle:(double *)a5
{
  double v6;
  double v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  uint64_t v11;
  double *v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v29;
  double v30;
  CGPoint result;

  v7 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v8 = *((_QWORD *)a4 + 1) - *(_QWORD *)a4;
  if (v8)
  {
    v9 = v8 >> 4;
    v10 = 1.0
        / sqrt((a3.var0.y - a3.var1.y) * (a3.var0.y - a3.var1.y) + (a3.var0.x - a3.var1.x) * (a3.var0.x - a3.var1.x));
    v26 = (a3.var0.y - a3.var1.y) * v10;
    v27 = (a3.var0.x - a3.var1.x) * v10;
    if (v9 <= 1)
      v11 = 1;
    else
      v11 = v9;
    v12 = (double *)(*(_QWORD *)a4 + 8);
    v13 = 1.79769313e308;
    do
    {
      v15 = *(v12 - 1);
      v14 = *v12;
      v16 = a3.var0.y - *v12;
      v17 = 1.0 / sqrt(v16 * v16 + (a3.var0.x - v15) * (a3.var0.x - v15));
      v18 = (a3.var0.x - v15) * v17;
      v19 = v16 * v17;
      v20 = *v12 - a3.var1.y;
      v21 = 1.0 / sqrt(v20 * v20 + (v15 - a3.var1.x) * (v15 - a3.var1.x));
      v29 = v20 * v21;
      v30 = (v15 - a3.var1.x) * v21;
      v22 = acos(v26 * v19 + v18 * v27);
      v23 = acos(v19 * v29 + v18 * v30);
      if (v22 > v23)
        v23 = v22;
      if (v23 < v13)
      {
        v13 = v23;
        v7 = v15;
        v6 = v14;
      }
      v12 += 2;
      --v11;
    }
    while (v11);
  }
  else
  {
    v13 = 1.79769313e308;
  }
  *a5 = v13;
  v24 = v7;
  v25 = v6;
  result.y = v25;
  result.x = v24;
  return result;
}

+ (Edge)longestEdgeInHull:(const void *)a3 atIndex:(int *)a4 visitedEdges:(const void *)a5
{
  double *v5;
  uint64_t v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  uint64_t v16;
  unint64_t v17;
  double v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  Edge result;

  v5 = *(double **)a3;
  v6 = *((_QWORD *)a3 + 1);
  v8 = **(double **)a3;
  v7 = *(double *)(*(_QWORD *)a3 + 8);
  v9 = v6 - *(_QWORD *)a3;
  v11 = *(double *)(v6 - 16);
  v10 = *(double *)(v6 - 8);
  *a4 = (v9 >> 4) - 1;
  v28 = v10;
  if (v9 != 32)
  {
    v16 = 0;
    v17 = 0;
    v18 = sqrt((v7 - v10) * (v7 - v10) + (v8 - v11) * (v8 - v11));
    do
    {
      v19 = &v5[v16];
      v20 = *v19;
      v21 = v19[1];
      v22 = v19[2];
      v23 = v19[3];
      if ((objc_msgSend(a1, "edgeSet:containsEdge:", a5, *v19, v21, v22, v23) & 1) == 0
        && sqrt((v21 - v23) * (v21 - v23) + (v20 - v22) * (v20 - v22)) > v18)
      {
        *a4 = v17;
        v28 = v23;
        v11 = v22;
        v7 = v21;
        v8 = v20;
      }
      ++v17;
      v5 = *(double **)a3;
      v16 += 2;
    }
    while (((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4) - 2 > v17);
  }
  v24 = v8;
  v25 = v7;
  v26 = v11;
  v27 = v28;
  result.var1.y = v27;
  result.var1.x = v26;
  result.var0.y = v25;
  result.var0.x = v24;
  return result;
}

+ (void)openConvexHullToConcave:(void *)a3 points:(const void *)a4 minAngleFactor:(double)a5 maxLengthThreshold:(double)a6 edgeRemovalConstant:(double)a7
{
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  float64x2_t *v24;
  int v25;
  unint64_t v26;
  int v27;
  float64x2_t *v28;
  int32x2_t v29;
  float64x2_t *v30;
  int64_t v31;
  double v32;
  double v33;
  double v34;
  double v35[4];
  _OWORD v36[2];
  int v37;
  int v38;

  v38 = 0;
  memset(v36, 0, sizeof(v36));
  v37 = 1065353216;
  +[PKPathUtility longestEdgeInHull:atIndex:visitedEdges:](PKPathUtility, "longestEdgeInHull:atIndex:visitedEdges:", a3, &v38, v36);
  while (1)
  {
    v16 = v12;
    v17 = v13;
    v18 = v14;
    v19 = v15;
    v35[0] = v12;
    v35[1] = v13;
    v35[2] = v14;
    v35[3] = v15;
    if (sqrt((v13 - v15) * (v13 - v15) + (v12 - v14) * (v12 - v14)) <= a6
      || +[PKPathUtility edgeSet:containsEdge:](PKPathUtility, "edgeSet:containsEdge:", v36, v12, v13, v14, v15))
    {
      break;
    }
    +[PKPathUtility averageDistanceForEdge:withPoints:](PKPathUtility, "averageDistanceForEdge:withPoints:", a4, v16, v17, v18, v19);
    if (sqrt((v17 - v19) * (v17 - v19) + (v16 - v18) * (v16 - v18)) <= v20 * a7
      || (v33 = 0.0,
          v34 = 0.0,
          v32 = 0.0,
          +[PKPathUtility pointWithMinAngleForEdge:fromPoints:minAngle:](PKPathUtility, "pointWithMinAngleForEdge:fromPoints:minAngle:", a4, &v34, v16, v17, v18, v19), v32 = v21, v33 = v22, v34 >= a5)|| +[PKPathUtility vector:containsPoint:](PKPathUtility, "vector:containsPoint:", a3)|| +[PKPathUtility newEdgeWithPoint:betweenEdge:intersectsOtherEdgesInHull:](PKPathUtility, "newEdgeWithPoint:betweenEdge:intersectsOtherEdgesInHull:", a3, v32, v33, v16,
           v17,
           v18,
           v19))
    {
    }
    else
    {
      std::vector<CGPoint>::insert((uint64_t)a3, (char *)(*(_QWORD *)a3 + 16 * v38 + 16), (char *)&v32);
    }
    +[PKPathUtility longestEdgeInHull:atIndex:visitedEdges:](PKPathUtility, "longestEdgeInHull:atIndex:visitedEdges:", a3, &v38, v36);
  }
  v23 = *(_QWORD *)a3;
  v24 = (float64x2_t *)*((_QWORD *)a3 + 1);
  if ((unint64_t)v24 - *(_QWORD *)a3 >= 0x11)
  {
    v25 = 0;
    v26 = 1;
    v27 = 1;
    do
    {
      v28 = (float64x2_t *)(v23 + 16 * v25);
      v29 = vmovn_s64(vceqq_f64(vrndmq_f64(*v28), vrndmq_f64(*(float64x2_t *)(v23 + 16 * v26))));
      if ((v29.i32[0] & v29.i32[1] & 1) != 0)
      {
        v30 = v28 + 1;
        v31 = (char *)v24 - (char *)&v28[2];
        if (v24 != &v28[2])
        {
          memmove(&v28[1], &v28[2], (char *)v24 - (char *)&v28[2]);
          v23 = *(_QWORD *)a3;
        }
        v24 = (float64x2_t *)((char *)v30 + v31);
        *((_QWORD *)a3 + 1) = (char *)v30 + v31;
      }
      else
      {
        v25 = v27;
      }
      v27 = v25 + 1;
      v26 = v25 + 1;
    }
    while (v26 < ((uint64_t)v24 - v23) >> 4);
  }
}

+ (BOOL)newEdgeWithPoint:(CGPoint)a3 betweenEdge:(Edge)a4 intersectsOtherEdgesInHull:(const void *)a5
{
  uint64_t v5;
  uint64_t v6;
  double y;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v19;
  double v20;
  CGFloat v24;
  double v25;
  double v28;
  double x;

  x = a4.var1.x;
  v6 = *(_QWORD *)a5;
  v5 = *((_QWORD *)a5 + 1);
  if (v5 - *(_QWORD *)a5 == 16)
    return 0;
  y = a4.var1.y;
  v9 = a4.var0.y;
  v10 = a4.var0.x;
  v11 = a3.y;
  v12 = a3.x;
  v13 = 0;
  v14 = 0;
  v28 = a4.var1.y;
  while (1)
  {
    v15 = v6 + v13;
    v16 = *(double *)(v6 + v13);
    v17 = *(double *)(v6 + v13 + 8);
    if (v16 == v10 && v17 == v9)
      goto LABEL_22;
    v19 = *(double *)(v15 + 16);
    v20 = *(double *)(v15 + 24);
    if (v19 == x && v20 == y)
      goto LABEL_22;
    if (v19 == v10 && v20 == v9)
      goto LABEL_22;
    if (v16 == x && v17 == y)
      goto LABEL_22;
    v24 = v11;
    if (+[PKPathUtility edge:intersectsEdge:](PKPathUtility, "edge:intersectsEdge:", v10, v9, v12))
      return 1;
    v25 = v24;
    y = v28;
    if (+[PKPathUtility edge:intersectsEdge:](PKPathUtility, "edge:intersectsEdge:", v12, v25, x, v28, v16, v17, v19, v20))
    {
      return 1;
    }
    v6 = *(_QWORD *)a5;
    v5 = *((_QWORD *)a5 + 1);
    v12 = a3.x;
    v11 = a3.y;
LABEL_22:
    ++v14;
    v13 += 16;
    if (((v5 - v6) >> 4) - 1 <= v14)
      return 0;
  }
}

+ (BOOL)edge:(Edge)a3 intersectsEdge:(Edge)a4
{
  double v5[2];
  uint64_t v6;
  double v7;
  Edge v8;
  Edge v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v9 = a3;
  v8 = a4;
  return DKDIntersectionOfLines(&v9.var0.x, &v8.var0.x, (double *)&v6, &v7, v5, 0, 0);
}

+ (BOOL)vector:(const void *)a3 containsPoint:(CGPoint)a4
{
  double *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  double *v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  double v13;

  v4 = *(double **)a3;
  v5 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  if (!v5)
    return 0;
  v6 = v5 >> 4;
  if (v6 <= 1)
    v7 = 1;
  else
    v7 = v6;
  if (*v4 == a4.x && v4[1] == a4.y)
    return 1;
  v9 = v4 + 3;
  v10 = 1;
  do
  {
    v11 = v10;
    if (v7 == v10)
      break;
    v12 = *(v9 - 1);
    v13 = *v9;
    ++v10;
    v9 += 2;
  }
  while (v12 != a4.x || v13 != a4.y);
  return v6 > v11;
}

+ (BOOL)edgeSet:(const void *)a3 containsEdge:(Edge)a4
{
  double y;
  double x;
  double v6;
  double v7;
  unint64_t v9;
  int8x8_t v10;
  uint8x8_t v11;
  unint64_t v12;
  double *i;
  unint64_t v14;
  Edge v18;

  y = a4.var1.y;
  x = a4.var1.x;
  v6 = a4.var0.y;
  v7 = a4.var0.x;
  v18 = a4;
  v9 = PKHashBytes((uint64_t)&v18, 32);
  v10 = *(int8x8_t *)((char *)a3 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8(v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v12 = v9;
      if (v9 >= *(_QWORD *)&v10)
        v12 = v9 % *(_QWORD *)&v10;
    }
    else
    {
      v12 = (*(_QWORD *)&v10 - 1) & v9;
    }
    i = *(double **)(*(_QWORD *)a3 + 8 * v12);
    if (i)
    {
      for (i = *(double **)i; i; i = *(double **)i)
      {
        v14 = *((_QWORD *)i + 1);
        if (v9 == v14)
        {
          if (i[2] == v7 && i[3] == v6 && i[4] == x && i[5] == y)
            return i != 0;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= *(_QWORD *)&v10)
              v14 %= *(_QWORD *)&v10;
          }
          else
          {
            v14 &= *(_QWORD *)&v10 - 1;
          }
          if (v14 != v12)
            goto LABEL_27;
        }
      }
    }
  }
  else
  {
LABEL_27:
    i = 0;
  }
  return i != 0;
}

@end
