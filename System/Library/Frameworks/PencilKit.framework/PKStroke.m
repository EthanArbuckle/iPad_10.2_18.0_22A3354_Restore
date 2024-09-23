@implementation PKStroke

- (void)generateClipPaths:(void *)a3 transform:(CGAffineTransform *)a4
{
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  CGFloat MaxX;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double *v21;
  double v22;
  double v23;
  double *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double *v34;
  double *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double *v42;
  double *v43;
  double *v44;
  double *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  double *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  double *v60;
  double *v61;
  char *v62;
  double *v63;
  double *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  double *v70;
  double *v71;
  double *v72;
  double *v73;
  char *v74;
  unint64_t v75;
  int32x2_t v76;
  __int128 v77;
  __int128 v78;
  char *v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  char *v83;
  char *v84;
  char *v85;
  __int128 v86;
  char *v87;
  char *v88;
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  BOOL v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  __int128 v96;
  float64x2_t v97;
  void *v98;
  char *v99;
  char *v100;
  void *__p;
  double *v102;
  unint64_t v103;
  __int128 v104;
  uint64_t v105;
  __int128 v106;
  CGFloat v107;
  CGFloat MaxY;
  CGFloat v109;
  CGFloat MinY;
  CGFloat v111;
  CGFloat v112;
  __int128 v113;
  uint64_t v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;

  v114 = *MEMORY[0x1E0C80C00];
  -[PKStroke _clipPlane](self, "_clipPlane");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_106;
  -[PKStroke _untransformedBounds](self, "_untransformedBounds");
  v116 = CGRectInset(v115, -100.0, -100.0);
  x = v116.origin.x;
  y = v116.origin.y;
  width = v116.size.width;
  height = v116.size.height;
  MinX = CGRectGetMinX(v116);
  v117.origin.x = x;
  v117.origin.y = y;
  v117.size.width = width;
  v117.size.height = height;
  *(CGFloat *)&v106 = MinX;
  *((_QWORD *)&v106 + 1) = CGRectGetMaxY(v117);
  v118.origin.x = x;
  v118.origin.y = y;
  v118.size.width = width;
  v118.size.height = height;
  MaxX = CGRectGetMaxX(v118);
  v119.origin.x = x;
  v119.origin.y = y;
  v119.size.width = width;
  v119.size.height = height;
  v107 = MaxX;
  MaxY = CGRectGetMaxY(v119);
  v120.origin.x = x;
  v120.origin.y = y;
  v120.size.width = width;
  v120.size.height = height;
  v14 = CGRectGetMaxX(v120);
  v121.origin.x = x;
  v121.origin.y = y;
  v121.size.width = width;
  v121.size.height = height;
  v109 = v14;
  MinY = CGRectGetMinY(v121);
  v122.origin.x = x;
  v122.origin.y = y;
  v122.size.width = width;
  v122.size.height = height;
  v15 = CGRectGetMinX(v122);
  v123.origin.x = x;
  v123.origin.y = y;
  v123.size.width = width;
  v123.size.height = height;
  v111 = v15;
  v112 = CGRectGetMinY(v123);
  v113 = v106;
  objc_msgSend(v7, "normal");
  v17 = v16;
  v19 = v18;
  v20 = 0;
  __p = 0;
  v102 = 0;
  v103 = 0;
  do
  {
    v21 = (double *)(&v106 + v20);
    v23 = *v21;
    v22 = v21[1];
    ++v20;
    v24 = (double *)(&v106 + v20);
    v26 = *v24;
    v25 = v24[1];
    objc_msgSend(v7, "distanceToPoint:", v23, v22);
    v28 = v27;
    objc_msgSend(v7, "distanceToPoint:", v26, v25);
    if (v28 >= 0.0 && v29 < 0.0)
    {
      v30 = 1.0 / sqrt((v25 - v22) * (v25 - v22) + (v26 - v23) * (v26 - v23));
      v31 = (v26 - v23) * v30;
      v32 = (v25 - v22) * v30;
      v33 = v28 / (v19 * v32 + v31 * v17);
      v26 = v23 - v31 * v33;
      v25 = v22 - v32 * v33;
      v34 = v102;
      if ((unint64_t)v102 >= v103)
      {
        v45 = (double *)__p;
        v51 = ((char *)v102 - (_BYTE *)__p) >> 4;
        v52 = v51 + 1;
        if ((unint64_t)(v51 + 1) >> 60)
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        v53 = v103 - (_QWORD)__p;
        if ((uint64_t)(v103 - (_QWORD)__p) >> 3 > v52)
          v52 = v53 >> 3;
        if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0)
          v49 = 0xFFFFFFFFFFFFFFFLL;
        else
          v49 = v52;
        if (v49)
        {
          v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v103, v49);
          v45 = (double *)__p;
          v34 = v102;
        }
        else
        {
          v50 = 0;
        }
        v60 = (double *)&v50[16 * v51];
        *v60 = v26;
        v60[1] = v25;
        v61 = v60;
        if (v34 != v45)
        {
          do
          {
            *((_OWORD *)v61 - 1) = *((_OWORD *)v34 - 1);
            v61 -= 2;
            v34 -= 2;
          }
          while (v34 != v45);
          goto LABEL_41;
        }
        goto LABEL_42;
      }
      goto LABEL_6;
    }
    if (v28 < 0.0 && v29 >= 0.0)
    {
      v36 = 1.0 / sqrt((v25 - v22) * (v25 - v22) + (v26 - v23) * (v26 - v23));
      v37 = (v26 - v23) * v36;
      v38 = (v25 - v22) * v36;
      v39 = v28 / (v19 * v38 + v37 * v17);
      v40 = v23 - v37 * v39;
      v41 = v22 - v38 * v39;
      v43 = v102;
      v42 = (double *)v103;
      if ((unint64_t)v102 >= v103)
      {
        v54 = (double *)__p;
        v55 = ((char *)v102 - (_BYTE *)__p) >> 4;
        v56 = v55 + 1;
        if ((unint64_t)(v55 + 1) >> 60)
          goto LABEL_108;
        v57 = v103 - (_QWORD)__p;
        if ((uint64_t)(v103 - (_QWORD)__p) >> 3 > v56)
          v56 = v57 >> 3;
        if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF0)
          v58 = 0xFFFFFFFFFFFFFFFLL;
        else
          v58 = v56;
        if (v58)
        {
          v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v103, v58);
          v54 = (double *)__p;
          v43 = v102;
        }
        else
        {
          v59 = 0;
        }
        v63 = (double *)&v59[16 * v55];
        *v63 = v40;
        v63[1] = v41;
        v64 = v63;
        if (v43 != v54)
        {
          do
          {
            *((_OWORD *)v64 - 1) = *((_OWORD *)v43 - 1);
            v64 -= 2;
            v43 -= 2;
          }
          while (v43 != v54);
          v54 = (double *)__p;
        }
        v42 = (double *)&v59[16 * v58];
        v44 = v63 + 2;
        __p = v64;
        v102 = v63 + 2;
        v103 = (unint64_t)v42;
        if (v54)
        {
          operator delete(v54);
          v42 = (double *)v103;
        }
      }
      else
      {
        *v102 = v40;
        v43[1] = v41;
        v44 = v43 + 2;
      }
      v102 = v44;
      if (v44 < v42)
      {
        *v44 = v26;
        v44[1] = v25;
        v35 = v44 + 2;
        goto LABEL_66;
      }
      v45 = (double *)__p;
      v65 = ((char *)v44 - (_BYTE *)__p) >> 4;
      v66 = v65 + 1;
      if ((unint64_t)(v65 + 1) >> 60)
LABEL_108:
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      v67 = (char *)v42 - (_BYTE *)__p;
      if (v67 >> 3 > v66)
        v66 = v67 >> 3;
      if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF0)
        v68 = 0xFFFFFFFFFFFFFFFLL;
      else
        v68 = v66;
      if (v68)
      {
        v69 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v103, v68);
        v45 = (double *)__p;
        v44 = v102;
      }
      else
      {
        v69 = 0;
      }
      v70 = (double *)&v69[16 * v65];
      *v70 = v26;
      v70[1] = v25;
      v71 = v70;
      if (v44 != v45)
      {
        do
        {
          *((_OWORD *)v71 - 1) = *((_OWORD *)v44 - 1);
          v71 -= 2;
          v44 -= 2;
        }
        while (v44 != v45);
        v45 = (double *)__p;
      }
      v62 = &v69[16 * v68];
      v35 = v70 + 2;
      __p = v71;
LABEL_64:
      v102 = v35;
      v103 = (unint64_t)v62;
      if (v45)
        operator delete(v45);
      goto LABEL_66;
    }
    if (v28 >= 0.0 && v29 >= 0.0)
    {
      v34 = v102;
      if ((unint64_t)v102 >= v103)
      {
        v45 = (double *)__p;
        v46 = ((char *)v102 - (_BYTE *)__p) >> 4;
        v47 = v46 + 1;
        if ((unint64_t)(v46 + 1) >> 60)
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        v48 = v103 - (_QWORD)__p;
        if ((uint64_t)(v103 - (_QWORD)__p) >> 3 > v47)
          v47 = v48 >> 3;
        if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF0)
          v49 = 0xFFFFFFFFFFFFFFFLL;
        else
          v49 = v47;
        if (v49)
        {
          v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v103, v49);
          v45 = (double *)__p;
          v34 = v102;
        }
        else
        {
          v50 = 0;
        }
        v60 = (double *)&v50[16 * v46];
        *v60 = v26;
        v60[1] = v25;
        v61 = v60;
        if (v34 != v45)
        {
          do
          {
            *((_OWORD *)v61 - 1) = *((_OWORD *)v34 - 1);
            v61 -= 2;
            v34 -= 2;
          }
          while (v34 != v45);
LABEL_41:
          v45 = (double *)__p;
        }
LABEL_42:
        v62 = &v50[16 * v49];
        v35 = v60 + 2;
        __p = v61;
        goto LABEL_64;
      }
LABEL_6:
      *v34 = v26;
      v34[1] = v25;
      v35 = v34 + 2;
LABEL_66:
      v102 = v35;
    }
  }
  while (v20 != 4);
  v73 = (double *)__p;
  v72 = v102;
  if (v102 != __p)
  {
    v95 = (uint64_t *)a3;
    v74 = 0;
    v75 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 0;
    v97 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    do
    {
      v76 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v73[2 * v75 + 1]), *(float64x2_t *)&a4->a, v73[2 * v75])), v97)));
      *(_QWORD *)&v77 = v76.i32[0];
      *((_QWORD *)&v77 + 1) = v76.i32[1];
      v78 = v77;
      if (v74 >= v100)
      {
        v96 = v78;
        v79 = (char *)v98;
        v80 = 0xAAAAAAAAAAAAAAABLL * ((v74 - (_BYTE *)v98) >> 3);
        v81 = v80 + 1;
        if (v80 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * ((v100 - (_BYTE *)v98) >> 3) > v81)
          v81 = 0x5555555555555556 * ((v100 - (_BYTE *)v98) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((v100 - (_BYTE *)v98) >> 3) >= 0x555555555555555)
          v82 = 0xAAAAAAAAAAAAAAALL;
        else
          v82 = v81;
        if (v82)
        {
          v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v100, v82);
          v79 = (char *)v98;
          v74 = v99;
        }
        else
        {
          v83 = 0;
        }
        v84 = &v83[24 * v80];
        *(_OWORD *)v84 = v96;
        *((_QWORD *)v84 + 2) = 0x3F800000BF800000;
        v85 = v84;
        if (v74 != v79)
        {
          do
          {
            v86 = *(_OWORD *)(v74 - 24);
            *((_QWORD *)v85 - 1) = *((_QWORD *)v74 - 1);
            *(_OWORD *)(v85 - 24) = v86;
            v85 -= 24;
            v74 -= 24;
          }
          while (v74 != v79);
          v79 = (char *)v98;
        }
        v74 = v84 + 24;
        v98 = v85;
        v99 = v84 + 24;
        v100 = &v83[24 * v82];
        if (v79)
          operator delete(v79);
      }
      else
      {
        *(_OWORD *)v74 = v78;
        *((_QWORD *)v74 + 2) = 0x3F800000BF800000;
        v74 += 24;
      }
      v99 = v74;
      ++v75;
      v73 = (double *)__p;
    }
    while (v75 < ((char *)v102 - (_BYTE *)__p) >> 4);
    if (ClipperLib::Area((uint64_t *)&v98) >= 0.0 && v98 != v74)
    {
      v87 = v74 - 24;
      if (v74 - 24 > v98)
      {
        v88 = (char *)v98 + 24;
        do
        {
          v104 = *(_OWORD *)(v88 - 24);
          v89 = v104;
          v105 = *((_QWORD *)v88 - 1);
          v90 = v105;
          v91 = *((_QWORD *)v87 + 2);
          *(_OWORD *)(v88 - 24) = *(_OWORD *)v87;
          *((_QWORD *)v88 - 1) = v91;
          *((_QWORD *)v87 + 2) = v90;
          *(_OWORD *)v87 = v89;
          v87 -= 24;
          v92 = v88 >= v87;
          v88 += 24;
        }
        while (!v92);
      }
    }
    v93 = v95[1];
    if (v93 >= v95[2])
    {
      v94 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v95, (uint64_t)&v98);
    }
    else
    {
      std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v95, (uint64_t)&v98);
      v94 = v93 + 24;
    }
    v95[1] = v94;
    if (v98)
    {
      v99 = (char *)v98;
      operator delete(v98);
    }
    v72 = (double *)__p;
  }
  if (v72)
  {
    v102 = v72;
    operator delete(v72);
  }
LABEL_106:

}

- (BOOL)_shouldBeClippedAgainstLegacyCanvas
{
  void *v3;
  void *v4;
  char v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  if (-[PKStroke _isHidden](self, "_isHidden"))
    return 0;
  -[PKStroke ink](self, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ink.eraser"));

  if ((v5 & 1) != 0)
    return 0;
  -[PKStroke _bounds](self, "_bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v13.size.width = 1024.0;
  v13.size.height = 768.0;
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v14 = CGRectIntersection(v11, v13);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return !CGRectEqualToRect(v12, v14);
}

- (PKStroke)initWithData:(id)a3 error:(id *)a4
{
  id v4;

  v4 = a3;
  PKCrash();
}

- (PKStroke)initWithArchive:(const void *)a3 error:(id *)a4
{
  PKCrash();
}

- (id)dataRepresentation
{
  PKCrash();
}

- (void)saveToArchive:(void *)a3
{
  PKCrash();
}

- (id)deltaTo:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (id)strokeApplying:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

+ ($78FB54F4A6B442EA15B736438C71FAD1)averagePointForSynthesisFromSourceStrokes:(SEL)a3
{
  PKAveragePointGenerator *v5;
  $78FB54F4A6B442EA15B736438C71FAD1 *result;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v5 = objc_alloc_init(PKAveragePointGenerator);
    -[PKAveragePointGenerator addStrokes:]((uint64_t)v5, v7);
    *(_OWORD *)&retstr->var11 = 0u;
    *(_OWORD *)&retstr->var13 = 0u;
    *(_OWORD *)&retstr->var7 = 0u;
    *(_OWORD *)&retstr->var9 = 0u;
    *(_OWORD *)&retstr->var3 = 0u;
    *(_OWORD *)&retstr->var5 = 0u;
    retstr->var0 = 0u;
    *(_OWORD *)&retstr->var1 = 0u;
    -[PKAveragePointGenerator currentInputPoint]((uint64_t)v5, (uint64_t)retstr);

  }
  else
  {
    *(_OWORD *)&retstr->var7 = xmmword_1BE4FC600;
    *(_OWORD *)&retstr->var9 = unk_1BE4FC610;
    *(_OWORD *)&retstr->var11 = xmmword_1BE4FC620;
    *(_OWORD *)&retstr->var13 = unk_1BE4FC630;
    retstr->var0 = ($9076B28992D74D3AA2059476C2B9E2A9)PKInkingToolWidthCalcPoint;
    *(_OWORD *)&retstr->var1 = unk_1BE4FC5D0;
    *(_OWORD *)&retstr->var3 = xmmword_1BE4FC5E0;
    *(_OWORD *)&retstr->var5 = unk_1BE4FC5F0;
  }

  return result;
}

+ (id)_createStrokesFromCHDrawing:(id)a3 transform:(CGAffineTransform *)a4 inputScale:(double)a5 sourceStrokes:(id)a6 strokeClass:(Class)a7 newInk:(id)a8 suggestedHeight:(double)a9 shouldSetSynthesizedFlag:(BOOL)a10
{
  id v15;
  PKInk *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  PKStrokePoint *v25;
  PKStrokePoint *v26;
  id v27;
  PKInk *v28;
  PKInk *v29;
  PKStrokePath *v30;
  void *v31;
  void *v32;
  PKStrokePath *v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  unint64_t i;
  unint64_t v40;
  uint64_t j;
  double v42;
  double v43;
  float64x2_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  float64x2_t *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  int v62;
  double v63;
  double v64;
  uint64_t v65;
  double *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t k;
  float v79;
  float v80;
  _OWORD *v81;
  __int128 v82;
  PKStrokePath *v83;
  _BYTE *v84;
  _BYTE *v85;
  uint64_t v86;
  double v87;
  double v88;
  void *v89;
  PKStrokePath *v90;
  id v91;
  void *v92;
  char *v93;
  char *v94;
  unint64_t v95;
  double v96;
  double v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  double v101;
  double v102;
  _OWORD *v103;
  PKStrokePath *v104;
  _BYTE *v105;
  _BYTE *v106;
  uint64_t v107;
  void *v108;
  PKStrokePath *v109;
  id v110;
  void *v111;
  __int128 v112;
  void *v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t m;
  void *v120;
  PKInk *v121;
  int v123;
  id v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  float64x2_t v129;
  PKAveragePointGenerator *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _OWORD v135[3];
  _OWORD v136[8];
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _OWORD v140[3];
  _PKStrokePoint v141;
  void *v142[2];
  __int128 v143;
  void *v144;
  _BYTE *v145;
  void *__p;
  char *v147;
  char *v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _OWORD v157[3];
  char v158[48];
  _BYTE v159[128];
  uint8_t buf[32];
  __int128 v161;
  __int128 v162;
  __int128 v163;
  double v164;
  _QWORD v165[4];

  v165[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v125 = a6;
  v16 = (PKInk *)a8;
  v128 = v15;
  if (!objc_msgSend(v15, "strokeCount"))
  {
    v124 = 0;
    goto LABEL_97;
  }
  v121 = v16;
  objc_msgSend(v125, "indexesOfObjectsPassingTest:", &__block_literal_global_36);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v120, "count"))
  {
    objc_msgSend(v125, "objectsAtIndexes:", v120);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v17;
  }
  else
  {
    v18 = v125;
  }
  v125 = v18;
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v16 && v19)
  {
    v21 = [a7 alloc];
    objc_msgSend(v20, "_strokeData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "transform");
    objc_msgSend(v20, "mask");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v21, "initWithInk:strokePath:transform:mask:", v16, v22, v158, v23);

    v19 = (void *)v24;
    if (!v24)
      goto LABEL_11;
  }
  else if (!v19)
  {
LABEL_11:
    v25 = [PKStrokePoint alloc];
    v26 = -[PKStrokePoint initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:](v25, "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 0.0, 3.0, 3.0, 1.0, 1.0, 0.0, 0);
    v27 = [a7 alloc];
    v28 = v16;
    if (!v16)
    {
      v29 = [PKInk alloc];
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      a7 = (Class)objc_claimAutoreleasedReturnValue();
      v28 = -[PKInk initWithInkType:color:](v29, "initWithInkType:color:", CFSTR("com.apple.ink.monoline"), a7);
    }
    v30 = [PKStrokePath alloc];
    v165[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PKStrokePath initWithControlPoints:creationDate:](v30, "initWithControlPoints:creationDate:", v31, v32);
    v34 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v157[0] = *MEMORY[0x1E0C9BAA8];
    v157[1] = v34;
    v157[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v35 = objc_msgSend(v27, "initWithInk:strokePath:transform:mask:", v28, v33, v157, 0);

    if (!v121)
    {

    }
    v19 = (void *)v35;
  }
  v127 = v19;
  objc_msgSend(v19, "path");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "count"))
  {
    objc_msgSend(v127, "ink");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "_isFountainPenInk");

    v123 = v38 ^ 1;
  }
  else
  {
    v123 = 0;
  }

  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  +[PKStroke averagePointForSynthesisFromSourceStrokes:](PKStroke, "averagePointForSynthesisFromSourceStrokes:", v125);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v124 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 0; objc_msgSend(v128, "strokeCount") > i; ++i)
  {
    v40 = objc_msgSend(v128, "pointCountForStrokeIndex:", i);
    if (v40)
    {
      v147 = 0;
      __p = 0;
      v148 = 0;
      std::vector<CGPoint>::reserve(&__p, v40);
      for (j = 0; j != v40; ++j)
      {
        objc_msgSend(v128, "pointForStrokeIndex:pointIndex:", i, j);
        v44 = vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v42), *(float64x2_t *)&a4->a, v43));
        v45 = v147;
        v46 = (char *)__p;
        v47 = v147 - (_BYTE *)__p;
        if (v147 == __p || *((double *)v147 - 2) != v44.f64[0] || *((double *)v147 - 1) != v44.f64[1])
        {
          v129 = v44;
          if (v147 >= v148)
          {
            v49 = v47 >> 4;
            v50 = (v47 >> 4) + 1;
            if (v50 >> 60)
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            v51 = v148 - (_BYTE *)__p;
            if ((v148 - (_BYTE *)__p) >> 3 > v50)
              v50 = v51 >> 3;
            if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0)
              v52 = 0xFFFFFFFFFFFFFFFLL;
            else
              v52 = v50;
            if (v52)
            {
              v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v148, v52);
              v45 = v147;
              v46 = (char *)__p;
            }
            else
            {
              v53 = 0;
            }
            v54 = (float64x2_t *)&v53[16 * v49];
            *v54 = v129;
            v48 = (char *)&v54[1];
            if (v45 != v46)
            {
              do
              {
                v54[-1] = *((float64x2_t *)v45 - 1);
                --v54;
                v45 -= 16;
              }
              while (v45 != v46);
              v46 = (char *)__p;
            }
            __p = v54;
            v147 = v48;
            v148 = &v53[16 * v52];
            if (v46)
              operator delete(v46);
          }
          else
          {
            *(float64x2_t *)v147 = v44;
            v48 = v45 + 16;
          }
          v147 = v48;
        }
      }
      v55 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v127, "ink");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "identifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "ink");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "_weight");
        v60 = v59;
        objc_msgSend(v127, "ink");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "_weightIsUndefined");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v57;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v60;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v62;
        _os_log_impl(&dword_1BE213000, v55, OS_LOG_TYPE_INFO, "Synthesize stroke with ink: %@, weight: %g, undefined: %d", buf, 0x1Cu);

      }
      if (v123)
      {
        v130 = objc_alloc_init(PKAveragePointGenerator);
        if (objc_msgSend(v125, "count"))
          -[PKAveragePointGenerator addStrokes:]((uint64_t)v130, v125);
        else
          -[PKAveragePointGenerator addStroke:]((uint64_t)v130, v127);
        v164 = 0.0;
        v163 = 0u;
        v162 = 0u;
        v161 = 0u;
        memset(buf, 0, sizeof(buf));
        -[PKAveragePointGenerator currentStrokePoint]((uint64_t)v130, (double *)buf);
        v93 = v147;
        v94 = (char *)__p;
        v95 = (v147 - (_BYTE *)__p) >> 4;
        std::vector<PKCompressedStrokePoint>::vector(&v144, v95);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v97 = v96;
        if (v93 != v94)
        {
          v98 = 0;
          v99 = 0;
          v100 = 0;
          if (v95 <= 1)
            v95 = 1;
          if (*(double *)&buf[24] >= a9 * 0.142857143 + 2.0)
            v101 = a9 * 0.142857143 + 2.0;
          else
            v101 = *(double *)&buf[24];
          if (a9 <= 0.0)
            v102 = *(double *)&buf[24];
          else
            v102 = v101;
          do
          {
            v141.location = *(CGPoint *)((char *)__p + v98);
            v141.timestamp = v97 + (double)v100 * 0.05;
            v141.radius = v102;
            *(_OWORD *)&v141.aspectRatio = v161;
            *(_OWORD *)&v141.force = v162;
            *(_OWORD *)&v141.altitude = v163;
            v141.radius2 = v164;
            PKCompressStrokePoint((PKCompressedStrokePoint *)&v141, v97, (float32x2_t *)v142);
            v103 = (char *)v144 + v99;
            *v103 = *(_OWORD *)v142;
            v103[1] = v143;
            ++v100;
            v99 += 32;
            v98 += 16;
          }
          while (v95 != v100);
        }
        v104 = [PKStrokePath alloc];
        v105 = v144;
        v106 = v145;
        v107 = objc_msgSend(v127, "_inputType");
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = -[PKStrokePath initWithPoints:count:immutableCount:inputType:timestamp:UUID:](v104, "initWithPoints:count:immutableCount:inputType:timestamp:UUID:", v105, (v106 - v105) >> 5, (v106 - v105) >> 5, v107, v108, v97);

        v110 = objc_alloc((Class)objc_opt_class());
        objc_msgSend(v127, "ink");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v140[0] = *MEMORY[0x1E0C9BAA8];
        v140[1] = v112;
        v140[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v113 = (void *)objc_msgSend(v110, "initWithInk:strokePath:transform:mask:", v111, v109, v140, 0);

        objc_msgSend(v124, "addObject:", v113);
        if (v144)
        {
          v145 = v144;
          operator delete(v144);
        }
      }
      else
      {
        if (v127)
        {
          objc_msgSend(v127, "transform");
          v64 = *((double *)&v137 + 1);
          v63 = *(double *)&v137;
        }
        else
        {
          v138 = 0u;
          v139 = 0u;
          v64 = 0.0;
          v63 = 0.0;
          v137 = 0u;
        }
        v130 = objc_alloc_init(PKStrokeGenerator);
        v65 = ((v147 - (_BYTE *)__p) >> 4) - 1;
        if ((v147 - (_BYTE *)__p) >> 4 == 1)
        {
          v69 = 0.0;
        }
        else
        {
          v68 = *(double *)__p;
          v67 = *((double *)__p + 1);
          v66 = (double *)((char *)__p + 24);
          v69 = 0.0;
          do
          {
            v70 = *(v66 - 1);
            v71 = *v66;
            v69 = v69 + sqrt((v67 - *v66) * (v67 - *v66) + (v68 - v70) * (v68 - v70));
            v66 += 2;
            v67 = v71;
            v68 = v70;
            --v65;
          }
          while (v65);
        }
        *((double *)&v151 + 1) = v69 / ((double)v40 * 0.05 * a5);
        v136[4] = v153;
        v136[5] = v154;
        v136[6] = v155;
        v136[7] = v156;
        v136[0] = v149;
        v136[1] = v150;
        v136[2] = v151;
        v136[3] = v152;
        -[PKAveragePointGenerator strokeFromPoints:sourceStroke:inputScale:averageInputPoint:](v130, "strokeFromPoints:sourceStroke:inputScale:averageInputPoint:", &__p, v127, v136, a5);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v72;
        v74 = sqrt(v64 * v64 + v63 * v63);
        if (fabs(v74 + -1.0) >= 0.00999999978)
        {
          v126 = v72;
          objc_msgSend(v72, "_strokeData");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "count");
          std::vector<PKCompressedStrokePoint>::vector(v142, v76);
          if (v76)
          {
            v77 = 0;
            for (k = 0; k != v76; ++k)
            {
              memset(buf, 0, sizeof(buf));
              if (v75)
              {
                objc_msgSend(v75, "_compressedPointAt:", k);
                v79 = *(float *)&buf[12];
              }
              else
              {
                v79 = 0.0;
              }
              v80 = (v79 + -2.0) * v74 + 2.0;
              *(float *)&buf[12] = v80;
              v81 = (char *)v142[0] + v77;
              v82 = *(_OWORD *)&buf[16];
              *v81 = *(_OWORD *)buf;
              v81[1] = v82;
              v77 += 32;
            }
          }
          v83 = [PKStrokePath alloc];
          v84 = v142[0];
          v85 = v142[1];
          v86 = objc_msgSend(v127, "_inputType");
          objc_msgSend(v126, "timestamp");
          v88 = v87;
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = -[PKStrokePath initWithPoints:count:immutableCount:inputType:timestamp:UUID:](v83, "initWithPoints:count:immutableCount:inputType:timestamp:UUID:", v84, (v85 - v84) >> 5, (v85 - v84) >> 5, v86, v89, v88);

          v91 = objc_alloc((Class)objc_opt_class());
          objc_msgSend(v126, "ink");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if (v126)
            objc_msgSend(v126, "transform");
          else
            memset(v135, 0, sizeof(v135));
          v73 = (void *)objc_msgSend(v91, "initWithInk:strokePath:transform:mask:", v92, v90, v135, 0);

          if (v142[0])
          {
            v142[1] = v142[0];
            operator delete(v142[0]);
          }

        }
        objc_msgSend(v124, "addObject:", v73);

      }
      if (__p)
      {
        v147 = (char *)__p;
        operator delete(__p);
      }
    }
  }
  if (a10)
  {
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v114 = v124;
    v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v131, v159, 16);
    if (v115)
    {
      v116 = *(_QWORD *)v132;
      do
      {
        for (m = 0; m != v115; ++m)
        {
          if (*(_QWORD *)v132 != v116)
            objc_enumerationMutation(v114);
          objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * m), "_setIsSynthesizedInk:", 1);
        }
        v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v131, v159, 16);
      }
      while (v115);
    }

  }
  v16 = v121;
LABEL_97:

  return v124;
}

uint64_t __154__PKStroke_SynthesizeSupport___createStrokesFromCHDrawing_transform_inputScale_sourceStrokes_strokeClass_newInk_suggestedHeight_shouldSetSynthesizedFlag___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isSynthesizedInk") ^ 1;
}

+ (PKStroke)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (PKStroke *)+[PKStroke allocWithZone:](_PKStrokeConcrete, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PKStroke;
  return (PKStroke *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (PKStroke)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKStroke;
  return -[PKStroke init](&v3, sel_init);
}

- (id)_initWithPath:(CGPath *)a3 ink:(id)a4 inputScale:(double)a5
{
  return -[PKStroke _initWithPath:ink:maxSegmentLength:inputScale:velocityForDistanceFunction:](self, "_initWithPath:ink:maxSegmentLength:inputScale:velocityForDistanceFunction:", a3, a4, 0, 1.79769313e308, a5);
}

- (id)_initWithPath:(CGPath *)a3 ink:(id)a4 maxSegmentLength:(double)a5 inputScale:(double)a6 velocityForDistanceFunction:(id)a7
{
  id v12;
  id v13;
  PKStrokeGenerator *v14;
  void *v15;

  v12 = a4;
  v13 = a7;
  v14 = objc_alloc_init(PKStrokeGenerator);
  -[PKStrokeGenerator strokeFromPath:ink:inputScale:maxSegmentLength:velocityForDistanceFunction:strokeClass:](v14, "strokeFromPath:ink:inputScale:maxSegmentLength:velocityForDistanceFunction:strokeClass:", a3, v12, v13, objc_opt_class(), a6, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (PKStroke)initWithData:(id)a3 id:(id)a4 hidden:(BOOL)a5 ink:(id)a6 transform:(CGAffineTransform *)a7 substrokes:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  unsigned int v18;
  __int128 v19;
  PKStroke *v20;
  _OWORD v22[3];

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = objc_msgSend(v14, "_legacyRandomSeed");
  v19 = *(_OWORD *)&a7->c;
  v22[0] = *(_OWORD *)&a7->a;
  v22[1] = v19;
  v22[2] = *(_OWORD *)&a7->tx;
  v20 = -[PKStroke initWithData:id:flags:ink:transform:substrokes:](self, "initWithData:id:flags:ink:transform:substrokes:", v14, v15, v11 | (32 * v18) | 0x2000000000, v16, v22, v17);

  return v20;
}

- (PKStroke)initWithData:(id)a3 id:(id)a4 flags:(id)a5 ink:(id)a6 transform:(CGAffineTransform *)a7 substrokes:(id)a8
{
  void *v9;
  id v11;
  id v12;
  id v13;
  CGAffineTransform *v14;

  v9 = (void *)*(&a5.var0.var1 + 1);
  v11 = a3;
  v12 = a4;
  v13 = v9;
  v14 = a7;
  PKCrash();
}

- (PKStroke)initWithInk:(PKInk *)ink strokePath:(PKStrokePath *)strokePath transform:(CGAffineTransform *)transform mask:(UIBezierPath *)mask
{
  PKInk *v10;
  PKStrokePath *v11;
  UIBezierPath *v12;
  __int128 v13;
  PKStroke *v14;
  _OWORD v16[3];

  v10 = ink;
  v11 = strokePath;
  v12 = mask;
  v13 = *(_OWORD *)&transform->c;
  v16[0] = *(_OWORD *)&transform->a;
  v16[1] = v13;
  v16[2] = *(_OWORD *)&transform->tx;
  v14 = -[PKStroke initWithInk:strokePath:transform:mask:randomSeed:](self, "initWithInk:strokePath:transform:mask:randomSeed:", v10, v11, v16, v12, arc4random());

  return v14;
}

- (PKStroke)initWithInk:(PKInk *)ink strokePath:(PKStrokePath *)strokePath transform:(CGAffineTransform *)transform mask:(UIBezierPath *)mask randomSeed:(uint32_t)randomSeed
{
  PKInk *v9;
  PKStrokePath *v10;
  UIBezierPath *v11;

  v9 = ink;
  v10 = strokePath;
  v11 = mask;
  PKCrash();
}

- (id)parentStrokeForInsertionInDrawing:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (id)copyForMutation
{
  PKCrash();
}

- (id)copyForSubstroke
{
  PKCrash();
}

- (id)sliceIdentifierForTStart:(double)a3 tEnd:(double)a4
{
  PKCrash();
}

- (PKInk)ink
{
  PKCrash();
}

- (void)setInk:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (PKStroke)strokeWithInk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  _BYTE v11[48];

  v4 = a3;
  -[PKStroke path](self, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "regenerateStrokeWithInk:randomSeed:strokeClass:", v4, -[PKStroke randomSeed](self, "randomSeed"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStroke transform](self, "transform");
    objc_msgSend(v6, "_setTransform:", v11);
    -[PKStroke _strokeMask](self, "_strokeMask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setStrokeMask:", v7);
  }
  else
  {
    v8 = objc_alloc((Class)objc_opt_class());
    -[PKStroke transform](self, "transform");
    -[PKStroke mask](self, "mask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v8, "initWithInk:strokePath:transform:mask:", v4, v5, &v10, v7);
  }

  return (PKStroke *)v6;
}

- (PKStrokePath)path
{
  PKCrash();
}

- (void)setPath:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (NSUUID)_strokeDataUUID
{
  void *v2;
  void *v3;

  -[PKStroke path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_strokeDataUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- ($4CB05A214F79A85768ACD038E8951CD9)_flags
{
  PKCrash();
}

- (void)_setFlags:(id)a3
{
  PKCrash();
}

- (id)_groupID
{
  PKCrash();
}

- (void)_setGroupID:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (id)_renderGroupID
{
  PKCrash();
}

- (void)_setRenderGroupID:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (int64_t)_shapeType
{
  PKCrash();
}

- (void)_setShapeType:(int64_t)a3
{
  PKCrash();
}

- (BOOL)_isSynthesizedInk
{
  return ((unint64_t)-[PKStroke _flags](self, "_flags") >> 40) & 1;
}

- (void)_setIsSynthesizedInk:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[PKStroke _flags](self, "_flags");
  v6 = 0x10000000000;
  if (!v3)
    v6 = 0;
  -[PKStroke _setFlags:](self, "_setFlags:", v5 & 0xFFFFFEFFFFFFFFFFLL | v6);
}

- (BOOL)_isSafeForStyleInventory
{
  return ((unint64_t)-[PKStroke _flags](self, "_flags") >> 42) & 1;
}

- (void)_setIsSafeForStyleInventory:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[PKStroke _flags](self, "_flags");
  v6 = 0x40000000000;
  if (!v3)
    v6 = 0;
  -[PKStroke _setFlags:](self, "_setFlags:", v5 & 0xFFFFFBFFFFFFFFFFLL | v6);
}

- (BOOL)_isPastedStroke
{
  return ((unint64_t)-[PKStroke _flags](self, "_flags") >> 43) & 1;
}

- (void)_setIsPastedStroke:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[PKStroke _flags](self, "_flags");
  v6 = 0x80000000000;
  if (!v3)
    v6 = 0;
  -[PKStroke _setFlags:](self, "_setFlags:", v5 & 0xFFFFF7FFFFFFFFFFLL | v6);
}

- (BOOL)_isSharedStroke
{
  return ((unint64_t)-[PKStroke _flags](self, "_flags") >> 44) & 1;
}

- (void)_setIsSharedStroke:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[PKStroke _flags](self, "_flags");
  v6 = 0x100000000000;
  if (!v3)
    v6 = 0;
  -[PKStroke _setFlags:](self, "_setFlags:", v5 & 0xFFFFEFFFFFFFFFFFLL | v6);
}

- (BOOL)_isHidden
{
  return -[PKStroke _flags](self, "_flags") & 1;
}

- (void)_setHidden:(BOOL)a3
{
  -[PKStroke _setFlags:](self, "_setFlags:", -[PKStroke _flags](self, "_flags") & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)_isNewCopy
{
  return ((unint64_t)-[PKStroke _flags](self, "_flags") >> 4) & 1;
}

- (void)_setIsNewCopy:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[PKStroke _flags](self, "_flags");
  v6 = 16;
  if (!v3)
    v6 = 0;
  -[PKStroke _setFlags:](self, "_setFlags:", v5 & 0xFFFFFFFFFFFFFFEFLL | v6);
}

- (BOOL)_isInProgressScribbleStroke
{
  return ((unint64_t)-[PKStroke _flags](self, "_flags") >> 38) & 1;
}

- (void)_setIsInProgressScribbleStroke:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[PKStroke _flags](self, "_flags");
  v6 = 0x4000000000;
  if (!v3)
    v6 = 0;
  -[PKStroke _setFlags:](self, "_setFlags:", v5 & 0xFFFFFFBFFFFFFFFFLL | v6);
}

- (CGPath)_newPathRepresentation
{
  void *v3;
  void *v5;
  CGPath *v6;

  -[PKStroke _strokeMask](self, "_strokeMask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return -[PKStroke newPathRepresentationMasked](self, "newPathRepresentationMasked");
  -[PKStroke path](self, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (CGPath *)objc_msgSend(v5, "_newPathRepresentation");

  return v6;
}

- (unint64_t)_pointsCount
{
  void *v2;
  unint64_t v3;

  -[PKStroke path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_pointsCount");

  return v3;
}

- (void)_setRandomSeed:(unsigned int)a3
{
  -[PKStroke _setFlags:](self, "_setFlags:", -[PKStroke _flags](self, "_flags") & 0xFFFFFFC00000001FLL | (32 * a3) | 0x2000000000);
}

- (uint32_t)randomSeed
{
  void *v3;
  uint64_t v4;

  if ((-[PKStroke _flags](self, "_flags") & 0x2000000000) != 0)
  {
    return (unint64_t)-[PKStroke _flags](self, "_flags") >> 5;
  }
  else
  {
    -[PKStroke _strokeData](self, "_strokeData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v3, "_legacyRandomSeed");

  }
  return v4;
}

- (id)_strokeMask
{
  PKCrash();
}

- (void)_setStrokeMask:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (PKStrokeRenderMask)_renderMask
{
  return 0;
}

- (BOOL)hasSubstrokes
{
  PKCrash();
}

- (UIBezierPath)mask
{
  void *v2;
  void *v3;

  -[PKStroke _strokeMask](self, "_strokeMask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bezierPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBezierPath *)v3;
}

- (NSArray)maskedPathRanges
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  double **v8;
  double *v9;
  double *v10;
  PKFloatRange *v11;
  PKFloatRange *v12;
  void *v13;
  PKFloatRange *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[PKStroke _strokeMask](self, "_strokeMask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0C99DE8];
    v6 = (_QWORD *)objc_msgSend(v3, "centerlineSlices");
    objc_msgSend(v5, "arrayWithCapacity:", (uint64_t)(v6[1] - *v6) >> 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (double **)objc_msgSend(v4, "centerlineSlices");
    v9 = *v8;
    v10 = v8[1];
    if (*v8 != v10)
    {
      do
      {
        v11 = -[PKFloatRange initWithLowerBound:upperBound:]([PKFloatRange alloc], "initWithLowerBound:upperBound:", *v9, v9[1]);
        objc_msgSend(v7, "addObject:", v11);

        v9 += 2;
      }
      while (v9 != v10);
    }
  }
  else
  {
    v12 = [PKFloatRange alloc];
    -[PKStroke path](self, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKFloatRange initWithLowerBound:upperBound:](v12, "initWithLowerBound:upperBound:", 0.0, (double)(unint64_t)(objc_msgSend(v13, "count") - 1));
    v16[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v7;
}

- (id)_strokeUUID
{
  PKCrash();
}

- (void)_setStrokeUUID:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (BOOL)isEqual:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKStroke _strokeUUID](self, "_strokeUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  -[PKStroke path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_timestamp");
  v4 = v3;

  return v4;
}

- (int64_t)_inputType
{
  void *v2;
  int64_t v3;

  -[PKStroke path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_inputType");

  return v3;
}

- (BOOL)_isInternal
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[PKStroke ink](self, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_isEraserInk") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[PKStroke ink](self, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "_isLassoInk") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[PKStroke _clipPlane](self, "_clipPlane");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (void)_setClipPlane:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (id)_clipPlane
{
  PKCrash();
}

+ (void)_consumeRenderVertexes:(id)a3 ink:(id)a4 inkTransform:(CGAffineTransform *)a5 strokePath:(id)a6
{
  void (**v9)(id, uint64_t, void *);
  PKInk *v10;
  PKStrokePath *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  PKInk *v23;
  __int128 v24;
  void *v25;
  uint64_t v26;
  _QWORD aBlock[4];
  PKInk *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  double v33;
  double v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;

  v9 = (void (**)(id, uint64_t, void *))a3;
  v10 = (PKInk *)a4;
  v11 = (PKStrokePath *)a6;
  -[PKInk behavior](v10, "behavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "particleDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "particleSize");
    v15 = v14;
    v17 = v16;
    v18 = objc_msgSend(v13, "particleRotation");
    v19 = 0;
  }
  else
  {
    v18 = -[PKInk particleRotation](v10, "particleRotation");
    v15 = 1.0;
    v19 = 0xBFFCCCCCCCCCCCCDLL;
    v17 = 1.0;
  }

  v20 = operator new();
  *(_BYTE *)(v20 + 16) = 0;
  *(_QWORD *)(v20 + 24) = 0x3FF0000000000000;
  *(_OWORD *)(v20 + 32) = 0u;
  *(_OWORD *)(v20 + 48) = 0u;
  *(_OWORD *)(v20 + 64) = 0u;
  *(_OWORD *)(v20 + 80) = 0u;
  *(_QWORD *)(v20 + 96) = 0;
  *(_QWORD *)v20 = &unk_1E7773C78;
  *(_QWORD *)(v20 + 8) = 0;
  *(_DWORD *)(v20 + 104) = 0;
  *(_WORD *)(v20 + 108) = 1;
  *(_QWORD *)(v20 + 112) = 0;
  *(_OWORD *)(v20 + 120) = xmmword_1BE4FB830;
  *(_QWORD *)(v20 + 136) = 0x4010000000000000;
  *(_QWORD *)(v20 + 144) = 1;
  *(_DWORD *)(v20 + 152) = 2;
  v37 = v20;
  PKBSplineFilter::splineFromStroke((id *)v20, v11, v10, 0.9);
  v21 = v18 == 1;
  v22 = v37;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKStroke__consumeRenderVertexes_ink_inkTransform_strokePath___block_invoke;
  aBlock[3] = &unk_1E7779EF0;
  v29 = v37 + 80;
  v23 = v10;
  v28 = v23;
  v24 = *(_OWORD *)&a5->c;
  v30 = *(_OWORD *)&a5->a;
  v31 = v24;
  v32 = *(_OWORD *)&a5->tx;
  v36 = v21;
  v33 = v15;
  v34 = v17;
  v35 = v19;
  v25 = _Block_copy(aBlock);
  v9[2](v9, 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(_QWORD *)(v22 + 88) - *(_QWORD *)(v22 + 80)) >> 3), v25);

  v26 = v37;
  v37 = 0;
  if (v26)
    std::default_delete<PKBSplineFilter>::operator()[abi:ne180100]((uint64_t)&v37, v26);

}

CGFloat __63__PKStroke__consumeRenderVertexes_ink_inkTransform_strokePath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v5)(_QWORD, double, double);
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  CGFloat b;
  CGFloat a;
  double d;
  CGFloat c;
  CGFloat ty;
  CGFloat tx;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  __n128 v28;
  double v30;
  double v31;
  CGFloat angle;
  CGFloat v33;
  CGFloat v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v43;
  double v44;
  CGFloat v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = **(_QWORD **)(a1 + 40) + 88 * a2;
  v33 = *(double *)(v7 + 8);
  v34 = *(double *)(v7 + 16);
  v8 = *(double *)(v7 + 40);
  v30 = *(double *)(v7 + 32);
  v31 = *(double *)(v7 + 24);
  angle = *(double *)(v7 + 56);
  if (v6)
  {
    v9 = *(double *)(v7 + 80);
    a = *(double *)(a1 + 48);
    b = *(double *)(a1 + 56);
    c = *(double *)(a1 + 64);
    d = *(double *)(a1 + 72);
    tx = *(double *)(a1 + 80);
    ty = *(double *)(a1 + 88);
    if (objc_msgSend(v6, "_isFountainPenInkV2"))
    {
      v16 = 0.0;
      if (v9 >= 0.0)
      {
        v16 = v9;
        if (v9 > 1.0)
          v16 = 1.0;
      }
      d = 1.0 - v16 + d * (1.0 - (1.0 - v16));
    }
  }
  else
  {
    ty = 0.0;
    tx = 0.0;
    d = 0.0;
    c = 0.0;
    b = 0.0;
    a = 0.0;
  }
  if (*(_BYTE *)(a1 + 120))
  {
    t1.a = a;
    t1.b = b;
    t1.c = c;
    t1.d = d;
    t1.tx = tx;
    t1.ty = ty;
    CGAffineTransformMakeRotation(&t2, angle);
    CGAffineTransformConcat(&v43, &t1, &t2);
    a = v43.a;
    b = v43.b;
    c = v43.c;
    d = v43.d;
    tx = v43.tx;
    ty = v43.ty;
  }
  v40.a = a;
  v40.b = b;
  v40.c = c;
  v40.d = d;
  v40.tx = tx;
  v40.ty = ty;
  CGAffineTransformMakeTranslation(&v39, v33, v34);
  CGAffineTransformConcat(&v43, &v40, &v39);
  v17 = 0;
  v18 = *(double *)(a1 + 112);
  v20 = v43.a;
  v19 = v43.b;
  v22 = v43.c;
  v21 = v43.d;
  v24 = v43.tx;
  v23 = v43.ty;
  v25 = v18 + v31 * v30 * *(double *)(a1 + 96);
  v26 = v18 + v31 * *(double *)(a1 + 104);
  v43.a = -v25;
  v43.b = -v26;
  v43.c = v25;
  v43.d = -v26;
  v43.tx = v25;
  v43.ty = v26;
  v44 = -v25;
  v45 = v26;
  do
  {
    v5[2](v5, v24 + v22 * *(double *)((char *)&v43.b + v17) + v20 * *(double *)((char *)&v43.a + v17), v23 + v21 * *(double *)((char *)&v43.b + v17) + v19 * *(double *)((char *)&v43.a + v17));
    v17 += 16;
  }
  while (v17 != 64);
  if (v8 != 0.0)
  {
    memset(&v38, 0, sizeof(v38));
    CGAffineTransformMakeRotation(&v38, angle);
    v36 = v38;
    v35.a = v20;
    v35.b = v19;
    v35.c = v22;
    v35.d = v21;
    v35.tx = v24;
    v35.ty = v23;
    CGAffineTransformConcat(&v37, &v36, &v35);
    v27 = 0;
    v38 = v37;
    do
    {
      v28 = (__n128)vaddq_f64(*(float64x2_t *)&v38.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v38.c, *(double *)((char *)&v43.b + v27) + 0.0), *(float64x2_t *)&v38.a, *(double *)((char *)&v43.a + v27) - v8));
      ((void (*)(void (**)(_QWORD, double, double), __n128, double))v5[2])(v5, v28, v28.n128_f64[1]);
      v27 += 16;
    }
    while (v27 != 64);
  }

  return v33;
}

- (CGRect)_calculateBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  char v19[48];
  CGRect result;

  if (-[PKStroke hasSubstrokes](self, "hasSubstrokes"))
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    -[PKStroke _strokeMask](self, "_strokeMask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStroke _transform](self, "_transform");
    -[PKStroke ink](self, "ink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStroke _inkTransform](self, "_inkTransform");
    -[PKStroke path](self, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKStroke _calculateBounds:transform:ink:inkTransform:strokePath:](PKStroke, "_calculateBounds:transform:ink:inkTransform:strokePath:", v7, v19, v8, &v18, v9);
    v3 = v10;
    v4 = v11;
    v5 = v12;
    v6 = v13;

  }
  v14 = v3;
  v15 = v4;
  v16 = v5;
  v17 = v6;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (CGRect)_calculateBounds:(id)a3 transform:(CGAffineTransform *)a4 ink:(id)a5 inkTransform:(CGAffineTransform *)a6 strokePath:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  __int128 v15;
  double v16;
  CGFloat x;
  double v18;
  CGFloat y;
  double v20;
  CGFloat width;
  double v22;
  CGFloat height;
  __int128 v24;
  void *v25;
  __int128 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _OWORD v37[3];
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[8];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  double *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  double *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  double *v57;
  uint64_t v58;
  uint64_t v59;
  _OWORD v60[3];
  CGRect v61;
  CGRect result;

  v11 = a3;
  v12 = a5;
  v13 = a7;
  v14 = v13;
  if (v11)
  {
    v15 = *(_OWORD *)&a4->c;
    v60[0] = *(_OWORD *)&a4->a;
    v60[1] = v15;
    v60[2] = *(_OWORD *)&a4->tx;
    objc_msgSend(v11, "_boundsWithTransform:", v60);
    x = v16;
    y = v18;
    width = v20;
    height = v22;
  }
  else if (objc_msgSend(v13, "count"))
  {
    v24 = *(_OWORD *)&a4->c;
    v41 = *(_OWORD *)&a4->a;
    v42 = v24;
    v43 = *(_OWORD *)&a4->tx;
    v56 = 0;
    v57 = (double *)&v56;
    v58 = 0x2020000000;
    v59 = 0x7FEFFFFFFFFFFFFFLL;
    v52 = 0;
    v53 = (double *)&v52;
    v54 = 0x2020000000;
    v55 = 0xFFEFFFFFFFFFFFFFLL;
    v48 = 0;
    v49 = (double *)&v48;
    v50 = 0x2020000000;
    v51 = 0x7FEFFFFFFFFFFFFFLL;
    v44 = 0;
    v45 = (double *)&v44;
    v46 = 0x2020000000;
    v47 = 0xFFEFFFFFFFFFFFFFLL;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKStroke__calculateBounds_transform_ink_inkTransform_strokePath___block_invoke;
    aBlock[3] = &unk_1E7779F18;
    aBlock[4] = &v56;
    aBlock[5] = &v52;
    aBlock[6] = &v48;
    aBlock[7] = &v44;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __67__PKStroke__calculateBounds_transform_ink_inkTransform_strokePath___block_invoke_2;
    v38[3] = &unk_1E7779F40;
    v25 = _Block_copy(aBlock);
    v39 = v25;
    v26 = *(_OWORD *)&a6->c;
    v37[0] = *(_OWORD *)&a6->a;
    v37[1] = v26;
    v37[2] = *(_OWORD *)&a6->tx;
    +[PKStroke _consumeRenderVertexes:ink:inkTransform:strokePath:](PKStroke, "_consumeRenderVertexes:ink:inkTransform:strokePath:", v38, v12, v37, v14);
    v27 = v53[3];
    v28 = v57[3];
    if (v27 >= v28 && (v29 = v45[3], v30 = v49[3], v29 >= v30))
    {
      v31 = v27 - v28;
      v32 = v29 - v30;
      v61 = CGRectIntegral(*(CGRect *)&v28);
      x = v61.origin.x;
      y = v61.origin.y;
      width = v61.size.width;
      height = v61.size.height;
    }
    else
    {
      x = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v56, 8);
  }
  else
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v33 = x;
  v34 = y;
  v35 = width;
  v36 = height;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

uint64_t __67__PKStroke__calculateBounds_transform_ink_inkTransform_strokePath___block_invoke(uint64_t result, double a2, double a3)
{
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;

  v3 = *(double *)(result + 96) + a3 * *(double *)(result + 80) + *(double *)(result + 64) * a2;
  v4 = *(double *)(result + 104) + a3 * *(double *)(result + 88) + *(double *)(result + 72) * a2;
  v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v6 = *(double *)(v5 + 24);
  if (v6 >= v3)
    v6 = v3;
  *(double *)(v5 + 24) = v6;
  v7 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v8 = *(double *)(v7 + 24);
  if (v8 < v3)
    v8 = v3;
  *(double *)(v7 + 24) = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
  v10 = *(double *)(v9 + 24);
  if (v10 >= v4)
    v10 = v4;
  *(double *)(v9 + 24) = v10;
  v11 = *(_QWORD *)(*(_QWORD *)(result + 56) + 8);
  if (*(double *)(v11 + 24) >= v4)
    v4 = *(double *)(v11 + 24);
  *(double *)(v11 + 24) = v4;
  return result;
}

void __67__PKStroke__calculateBounds_transform_ink_inkTransform_strokePath___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (**v6)(id, uint64_t, _QWORD);

  v6 = a3;
  if (a2 >= 1)
  {
    v5 = 0;
    do
      v6[2](v6, v5++, *(_QWORD *)(a1 + 32));
    while (a2 != v5);
  }

}

- (CGAffineTransform)_transform
{
  PKCrash();
}

- (CGAffineTransform)_inkTransform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (void)_setTransform:(CGAffineTransform *)a3
{
  PKCrash();
}

- (void)_setInkTransform:(CGAffineTransform *)a3
{
  PKCrash();
}

- (void)_applyTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  CGAffineTransform v6;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v9;

  -[PKStroke _transform](self, "_transform");
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v5;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v9, &t1, &t2);
  v6 = v9;
  -[PKStroke _setTransform:](self, "_setTransform:", &v6);
}

- (id)_substrokesInDrawing:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

- (id)_newStrokeWithSubstrokes:(id)a3 inDrawing:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  PKCrash();
}

- (void)_setBounds:(CGRect)a3
{
  PKCrash();
}

- (CGRect)renderBounds
{
  PKCrash();
}

- (CGRect)_untransformedBounds
{
  CGAffineTransform v3;
  CGAffineTransform v4;
  CGAffineTransform v5;
  CGRect v6;

  memset(&v5, 0, sizeof(v5));
  -[PKStroke _transform](self, "_transform");
  CGAffineTransformInvert(&v5, &v4);
  -[PKStroke _bounds](self, "_bounds");
  v3 = v5;
  return CGRectApplyAffineTransform(v6, &v3);
}

- (void)_appendPointsOfInterestForSelection:(void *)a3
{
  -[PKStroke _appendPointsOfInterestForSelection:step:](self, "_appendPointsOfInterestForSelection:step:", a3, 0.7);
}

- (void)_appendPointsOfInterestForSelection:(void *)a3 step:(double)a4
{
  void *v7;
  _QWORD v8[6];

  -[PKStroke _strokeMask](self, "_strokeMask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKStroke _appendPointsOfInterestForSelectionMasked:](self, "_appendPointsOfInterestForSelectionMasked:", a3);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__PKStroke__appendPointsOfInterestForSelection_step___block_invoke;
    v8[3] = &unk_1E7779F68;
    v8[4] = self;
    v8[5] = a3;
    -[PKStroke interpolatePointDataWithStep:usingBlock:](self, "interpolatePointDataWithStep:usingBlock:", v8, a4);
  }
}

void __53__PKStroke__appendPointsOfInterestForSelection_step___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __double2 v26;
  double v27;
  double v28;
  uint64_t v29;
  double *v30;
  unint64_t v31;
  double *v32;
  double *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  double *v39;
  double *v40;
  __int128 v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;

  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v7, "_transform");
    v8 = v44;
    v9 = v43;
    v11 = v46;
    v10 = v45;
    v12 = v48;
    v13 = v47;
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    v12 = 0.0;
    v11 = 0.0;
    v8 = 0.0;
    v13 = 0.0;
    v10 = 0.0;
    v9 = 0.0;
  }
  v42 = 0u;
  objc_msgSend(v7, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "_compressedPointAt:", (uint64_t)a4);
  else
    v42 = 0u;
  v16 = v13 + a3 * v10 + v9 * a2;
  v17 = v12 + a3 * v11 + v8 * a2;

  LOWORD(v18) = 0;
  v19 = 10.0;
  LOWORD(v19) = 0;
  v20 = (double)v19 / 1000.0;
  v21 = (double)v18 / 10.0 + *((float *)&v42 + 3);
  v22 = 1.0;
  if (v20 >= 1.0)
    v22 = v20;
  v23 = v21 * v22;
  if (v23 >= 15.0)
    v24 = v23;
  else
    v24 = 15.0;
  v25 = 0.0;
  do
  {
    v26 = __sincos_stret(v25);
    v27 = v16 + v24 * v26.__cosval;
    v28 = v17 + v24 * v26.__sinval;
    v29 = *(_QWORD *)(a1 + 40);
    v30 = *(double **)(v29 + 8);
    v31 = *(_QWORD *)(v29 + 16);
    if ((unint64_t)v30 >= v31)
    {
      v33 = *(double **)v29;
      v34 = ((uint64_t)v30 - *(_QWORD *)v29) >> 4;
      v35 = v34 + 1;
      if ((unint64_t)(v34 + 1) >> 60)
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      v36 = v31 - (_QWORD)v33;
      if (v36 >> 3 > v35)
        v35 = v36 >> 3;
      if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
        v37 = 0xFFFFFFFFFFFFFFFLL;
      else
        v37 = v35;
      if (v37)
      {
        v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>(v29 + 16, v37);
        v33 = *(double **)v29;
        v30 = *(double **)(v29 + 8);
      }
      else
      {
        v38 = 0;
      }
      v39 = (double *)&v38[16 * v34];
      *v39 = v27;
      v39[1] = v28;
      v40 = v39;
      if (v30 != v33)
      {
        do
        {
          *((_OWORD *)v40 - 1) = *((_OWORD *)v30 - 1);
          v40 -= 2;
          v30 -= 2;
        }
        while (v30 != v33);
        v33 = *(double **)v29;
      }
      v32 = v39 + 2;
      *(_QWORD *)v29 = v40;
      *(_QWORD *)(v29 + 8) = v39 + 2;
      *(_QWORD *)(v29 + 16) = &v38[16 * v37];
      if (v33)
        operator delete(v33);
    }
    else
    {
      *v30 = v27;
      v30[1] = v28;
      v32 = v30 + 2;
    }
    *(_QWORD *)(v29 + 8) = v32;
    v25 = v25 + 0.392699082;
  }
  while (v25 < 6.28318531);
}

- (double)_maxWidthForStroke
{
  void *v2;
  double v3;
  double v4;

  -[PKStroke path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_maxWidth");
  v4 = v3;

  return v4;
}

- (id)description
{
  return -[PKStroke descriptionAtDepth:](self, "descriptionAtDepth:", 0);
}

- (id)descriptionAtDepth:(int64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGAffineTransform transform;
  CGAffineTransform v16;
  CGAffineTransform v17;

  v4 = &stru_1E777DEE8;
  objc_msgSend(&stru_1E777DEE8, "stringByPaddingToLength:withString:startingAtIndex:", 2 * a3, CFSTR(" "), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v17, 0, sizeof(v17));
  -[PKStroke transform](self, "transform");
  v16 = v17;
  if (!CGAffineTransformIsIdentity(&v16))
  {
    if (*MEMORY[0x1E0C9BAA8] != v17.a
      || *(double *)(MEMORY[0x1E0C9BAA8] + 8) != v17.b
      || *(double *)(MEMORY[0x1E0C9BAA8] + 16) != v17.c)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
LABEL_12:
      transform = v17;
      NSStringFromCGAffineTransform(&transform);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("transform=%@ "), v9);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    v8 = (void *)MEMORY[0x1E0CB3940];
    if (*(double *)(MEMORY[0x1E0C9BAA8] + 24) != v17.d)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("transform=[%ld, %ld] "), (uint64_t)v17.tx, (uint64_t)v17.ty);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[PKStroke ink](self, "ink");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@<PKStroke: %p %@ %@>"), v5, self, v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (int64_t)_asciiDimensionForBoundsDimension:(double)a3
{
  return (uint64_t)(a3 * 0.25);
}

- (id)_ascii
{
  double v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  BOOL *v7;
  void *v8;
  uint64_t i;
  uint64_t j;
  __CFString *v11;
  __CFString *v12;

  -[PKStroke bounds](self, "bounds");
  v4 = +[PKStroke _asciiDimensionForBoundsDimension:](PKStroke, "_asciiDimensionForBoundsDimension:", v3);
  -[PKStroke bounds](self, "bounds");
  v6 = +[PKStroke _asciiDimensionForBoundsDimension:](PKStroke, "_asciiDimensionForBoundsDimension:", v5);
  v7 = -[PKStroke _newAsciiBitfieldWithWidth:height:](self, "_newAsciiBitfieldWithWidth:height:", v4, v6);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      if (v4 >= 1)
      {
        for (j = 0; j != v4; ++j)
        {
          if (v7[+[PKStroke _asciiBitfieldIndexForX:y:width:](PKStroke, "_asciiBitfieldIndexForX:y:width:", j, i, v4)])v11 = CFSTR("■");
          else
            v11 = CFSTR(" ");
          v12 = v11;
          objc_msgSend(v8, "appendString:", v12);

        }
      }
      objc_msgSend(v8, "appendString:", CFSTR("\n"));
    }
  }
  free(v7);
  return v8;
}

- (BOOL)_newAsciiBitfield
{
  double v3;
  int64_t v4;
  double v5;

  -[PKStroke bounds](self, "bounds");
  v4 = +[PKStroke _asciiDimensionForBoundsDimension:](PKStroke, "_asciiDimensionForBoundsDimension:", v3);
  -[PKStroke bounds](self, "bounds");
  return -[PKStroke _newAsciiBitfieldWithWidth:height:](self, "_newAsciiBitfieldWithWidth:height:", v4, +[PKStroke _asciiDimensionForBoundsDimension:](PKStroke, "_asciiDimensionForBoundsDimension:", v5));
}

- (BOOL)_newAsciiBitfieldWithWidth:(int64_t)a3 height:(int64_t)a4
{
  int64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[11];

  v7 = a4 * a3;
  v8 = malloc_type_calloc(a4 * a3, 1uLL, 0x100004077774924uLL);
  -[PKStroke bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  -[PKStroke bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  if (v7 >= 1)
    bzero(v8, v7);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __46__PKStroke__newAsciiBitfieldWithWidth_height___block_invoke;
  v18[3] = &__block_descriptor_88_e26_v40__0_CGPoint_dd_8d24_B32l;
  v18[4] = v14;
  v18[5] = v16;
  v18[6] = v10;
  v18[7] = v12;
  v18[8] = a3;
  v18[9] = a4;
  v18[10] = v8;
  -[PKStroke interpolatePointDataWithStep:usingBlock:](self, "interpolatePointDataWithStep:usingBlock:", v18, 1.0);
  return (BOOL *)v8;
}

int64_t __46__PKStroke__newAsciiBitfieldWithWidth_height___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t result;

  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = (a2 - *(double *)(a1 + 32)) / *(double *)(a1 + 48) * (double)v4;
  v7 = (a3 - *(double *)(a1 + 40)) / *(double *)(a1 + 56) * (double)v5;
  if (v4 - 1 >= ((uint64_t)v6 & ~((uint64_t)v6 >> 63)))
    v8 = (uint64_t)v6 & ~((uint64_t)v6 >> 63);
  else
    v8 = v4 - 1;
  v9 = v5 - 1;
  if (v9 >= ((uint64_t)v7 & ~((uint64_t)v7 >> 63)))
    v10 = (uint64_t)v7 & ~((uint64_t)v7 >> 63);
  else
    v10 = v9;
  result = +[PKStroke _asciiBitfieldIndexForX:y:width:](PKStroke, "_asciiBitfieldIndexForX:y:width:", v8, v10);
  *(_BYTE *)(*(_QWORD *)(a1 + 80) + result) = 1;
  return result;
}

+ (int64_t)_asciiBitfieldIndexForX:(int64_t)a3 y:(int64_t)a4 width:(int64_t)a5
{
  return a3 + a5 * a4;
}

- (id)debugQuickLookObject
{
  PKDrawing *v3;
  id v4;
  void *v5;

  v3 = objc_alloc_init(PKDrawing);
  v4 = -[PKDrawing _addStroke:](v3, "_addStroke:", self);
  -[PKDrawing bounds](v3, "bounds");
  -[PKDrawing imageFromRect:scale:](v3, "imageFromRect:scale:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)compareToStroke:(id)a3
{
  id v3;

  v3 = a3;
  PKCrash();
}

+ (id)copyStrokes:(id)a3 hidden:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "_isHidden", (_QWORD)v14) == v4)
        {
          objc_msgSend(v6, "addObject:", v11);
        }
        else
        {
          v12 = (void *)objc_msgSend(v11, "copyForMutation");
          objc_msgSend(v12, "_setHidden:", v4);
          objc_msgSend(v6, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)_substrokeWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  _BOOL4 v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  __int128 *v16;
  void *v17;
  PKStrokePath *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  PKStrokePath *v23;
  __int128 v25;
  __int128 v26;
  void *__p[3];

  length = a3.length;
  location = a3.location;
  +[PKContentVersionUtility sharedUtility]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKContentVersionUtility programLinkedOnOrAfterDawnburst]((_BOOL8)v6);

  v8 = 0;
  if (location < -[PKStroke _pointsCount](self, "_pointsCount"))
  {
    v9 = length + location + !v7 - 1;
    v10 = v9 - location;
    if (v9 >= location)
    {
      if (v9 >= -[PKStroke _pointsCount](self, "_pointsCount"))
      {
        v8 = 0;
      }
      else
      {
        v11 = v10 + 1;
        std::vector<PKCompressedStrokePoint>::vector(__p, v10 + 1);
        if (v10 != -1)
        {
          v12 = 0;
          v13 = v10 + 1;
          do
          {
            -[PKStroke path](self, "path", v25, v26);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
            {
              objc_msgSend(v14, "_compressedPointAt:", location);
            }
            else
            {
              v25 = 0u;
              v26 = 0u;
            }
            v16 = (__int128 *)((char *)__p[0] + v12);
            *v16 = v25;
            v16[1] = v26;

            v12 += 32;
            ++location;
            --v13;
          }
          while (v13);
        }
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", v25, v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = [PKStrokePath alloc];
        v19 = __p[0];
        -[PKStroke path](self, "path");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "_inputType");
        -[PKStroke path](self, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_timestamp");
        v23 = -[PKStrokePath initWithPoints:count:immutableCount:inputType:timestamp:UUID:](v18, "initWithPoints:count:immutableCount:inputType:timestamp:UUID:", v19, v11, v11, v21, v17);

        v8 = -[PKStroke copyForMutation](self, "copyForMutation");
        objc_msgSend(v8, "setPath:", v23);

        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
    }
  }
  return v8;
}

- (CGPoint)_locationAtIndex:(unint64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[PKStroke _locationAtIndex:applyStrokeTransform:](self, "_locationAtIndex:applyStrokeTransform:", a3, 1);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)_locationAtIndex:(unint64_t)a3 applyStrokeTransform:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  float64_t v8;
  double v9;
  float64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  CGPoint result;

  v4 = a4;
  -[PKStroke path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationAtIndex:", a3);
  if (v4)
  {
    v13 = v9;
    v14 = v8;
    -[PKStroke _transform](self, "_transform");
    v15 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v17, v13), v16, v14));
    v10 = v15.f64[1];
  }
  else
  {
    v15.f64[0] = v8;
    v10 = v9;
  }

  v11 = v15.f64[0];
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)enumeratePointsWithDistanceStep:(double)a3 usingBlock:(id)a4
{
  PKStrokeProviderSlice *v6;
  id v7;

  v7 = a4;
  v6 = -[PKStrokeProviderSlice initWithStroke:tStart:tEnd:]([PKStrokeProviderSlice alloc], "initWithStroke:tStart:tEnd:", self, 0.0, (double)-[PKStroke _pointsCount](self, "_pointsCount"));
  -[PKStrokeProviderSlice enumeratePointsWithDistanceStep:usingBlock:](v6, "enumeratePointsWithDistanceStep:usingBlock:", v7, a3);

}

- (void)enumeratePointsWithTimestep:(double)a3 usingBlock:(id)a4
{
  PKStrokeProviderSlice *v6;
  id v7;

  v7 = a4;
  v6 = -[PKStrokeProviderSlice initWithStroke:tStart:tEnd:]([PKStrokeProviderSlice alloc], "initWithStroke:tStart:tEnd:", self, 0.0, (double)-[PKStroke _pointsCount](self, "_pointsCount"));
  -[PKStrokeProviderSlice enumeratePointsWithTimestep:usingBlock:](v6, "enumeratePointsWithTimestep:usingBlock:", v7, a3);

}

- (double)timestampAtIndex:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;

  -[PKStroke path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestampAtIndex:", a3);
  v6 = v5;

  return v6;
}

- (double)_timestampAtIndex:(unint64_t)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[PKStroke timestampAtIndex:](self, "timestampAtIndex:", a3);
  v5 = v4;
  -[PKStroke path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_timestamp");
  v8 = v5 + v7;

  return v8;
}

- (BOOL)_containsSamePointsAsStroke:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v28;
  CGRect v29;

  v4 = a3;
  -[PKStroke _bounds](self, "_bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "_bounds");
  v29.origin.x = v13;
  v29.origin.y = v14;
  v29.size.width = v15;
  v29.size.height = v16;
  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  if (CGRectEqualToRect(v28, v29)
    && (v17 = -[PKStroke _pointsCount](self, "_pointsCount"), v17 == objc_msgSend(v4, "_pointsCount")))
  {
    v18 = 0;
    do
    {
      v19 = -[PKStroke _pointsCount](self, "_pointsCount");
      v20 = v19 <= v18;
      if (v19 <= v18)
        break;
      -[PKStroke _locationAtIndex:](self, "_locationAtIndex:", v18);
      v22 = v21;
      v24 = v23;
      objc_msgSend(v4, "_locationAtIndex:", v18);
      if (vabdd_f64(v22, v26) >= 0.01)
        break;
      ++v18;
    }
    while (vabdd_f64(v24, v25) < 0.01);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (double)startTimestamp
{
  void *v2;
  double v3;
  double v4;

  -[PKStroke path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestampAtIndex:", 0);
  v4 = v3;

  return v4;
}

- (double)endTimestamp
{
  void *v3;
  double v4;
  double v5;

  -[PKStroke path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestampAtIndex:", -[PKStroke _pointsCount](self, "_pointsCount") - 1);
  v5 = v4;

  return v5;
}

+ (int64_t)_requiredContentVersionForStrokePath:(id)a3 ink:(id)a4
{
  id v5;
  id v6;
  int64_t v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "requiredContentVersion");
  if (v7 >= 3
    && objc_msgSend(v6, "_isFountainPenInk")
    && !objc_msgSend(v5, "hasAzimuthAngles"))
  {
    v7 = 2;
  }

  return v7;
}

- (PKContentVersion)requiredContentVersion
{
  void *v3;
  void *v4;
  PKContentVersion v5;

  -[PKStroke _strokeData](self, "_strokeData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStroke ink](self, "ink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PKStroke _requiredContentVersionForStrokePath:ink:](PKStroke, "_requiredContentVersionForStrokePath:ink:", v3, v4);

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PKCrash();
}

- (CGPoint)intersectionFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[9];
  _QWORD v9[3];
  char v10;
  _QWORD v11[8];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  __n128 (*v15)(__n128 *, __n128 *);
  uint64_t (*v16)();
  const char *v17;
  int64x2_t v18;
  CGPoint v19[2];
  uint64_t v20;
  CGPoint result;

  v20 = *MEMORY[0x1E0C80C00];
  v19[0] = a3;
  v19[1] = a4;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x4012000000;
  v15 = __Block_byref_object_copy__13;
  v16 = __Block_byref_object_dispose__13;
  v17 = "";
  v18 = vdupq_n_s64(0x7FF8000000000000uLL);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4012000000;
  v11[3] = __Block_byref_object_copy__13;
  v11[4] = __Block_byref_object_dispose__13;
  v11[5] = "";
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PKStroke_intersectionFromPoint_toPoint___block_invoke;
  v8[3] = &unk_1E7779FB0;
  v8[4] = self;
  v8[5] = v9;
  v8[7] = &v12;
  v8[8] = v19;
  v8[6] = v11;
  -[PKStroke interpolatePointDataWithStep:usingBlock:](self, "interpolatePointDataWithStep:usingBlock:", v8, 1.0);
  v4 = v13[6];
  v5 = v13[7];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v12, 8);
  v6 = v4;
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

void *__42__PKStroke_intersectionFromPoint_toPoint___block_invoke(uint64_t a1, _BYTE *a2, double a3, double a4)
{
  void *result;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  double v11;
  double v12;
  float64x2_t v13;
  __int128 v14;
  uint64_t v15;
  double v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = *(void **)(a1 + 32);
  if (result)
  {
    v11 = a4;
    v12 = a3;
    result = (void *)objc_msgSend(result, "_transform");
    a4 = v11;
    a3 = v12;
    v8 = v17;
    v7 = v18;
    v9 = v19;
  }
  else
  {
    v9 = 0uLL;
    v18 = 0u;
    v19 = 0u;
    v17 = 0u;
    v8 = 0uLL;
    v7 = 0uLL;
  }
  v10 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v7, a4), v8, a3));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v15 = 0;
    v20[0] = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
    v20[1] = v10;
    v13 = v10;
    result = (void *)DKDIntersectionOfLines(*(double **)(a1 + 64), (double *)v20, (double *)&v15, &v16, (double *)&v14, 0, 0);
    if ((_DWORD)result)
    {
      *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) = v14;
      *a2 = 1;
    }
    v10 = v13;
  }
  *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48) = v10;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

+ (id)_testStrokeFromPoints:(PKCompressedStrokePoint *)a3 length:(int64_t)a4 ink:(id)a5
{
  id v8;
  void *v9;
  PKStrokePath *v10;
  void *v11;
  PKStrokePath *v12;
  id v13;
  __int128 v14;
  void *v15;
  _OWORD v17[3];

  v8 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", CFSTR("com.apple.ink.pen"), v9, -1.0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = [PKStrokePath alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKStrokePath initWithPoints:count:immutableCount:inputType:timestamp:UUID:](v10, "initWithPoints:count:immutableCount:inputType:timestamp:UUID:", a3, a4, a4, 0, v11, 0.0);

  v13 = objc_alloc((Class)a1);
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v17[0] = *MEMORY[0x1E0C9BAA8];
  v17[1] = v14;
  v17[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v15 = (void *)objc_msgSend(v13, "initWithInk:strokePath:transform:mask:", v8, v12, v17, 0);

  return v15;
}

- (unique_ptr<std::vector<PKCompressedStrokePoint>,)_compressedStrokePoints
{
  _QWORD *v2;
  _QWORD *v4;
  _QWORD *v5;
  unique_ptr<std::vector<PKCompressedStrokePoint>, std::default_delete<std::vector<PKCompressedStrokePoint>>> v6;
  char *var0;
  uint64_t v8;
  char *i;
  void *v10;
  void *v11;
  __int128 *v12;
  __int128 v13;
  __int128 v14;

  v4 = v2;
  v5 = (_QWORD *)operator new();
  std::vector<PKCompressedStrokePoint>::vector(v5, -[PKStroke _pointsCount](self, "_pointsCount"));
  v6.var0.var0 = (void *)-[PKStroke _pointsCount](self, "_pointsCount");
  if (v6.var0.var0)
  {
    var0 = (char *)v6.var0.var0;
    v8 = 0;
    for (i = 0; i != var0; ++i)
    {
      -[PKStroke path](self, "path", v13, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "_compressedPointAt:", i);
      }
      else
      {
        v13 = 0u;
        v14 = 0u;
      }
      v12 = (__int128 *)(*v5 + v8);
      *v12 = v13;
      v12[1] = v14;

      v8 += 32;
    }
  }
  *v4 = v5;
  return v6;
}

- (BOOL)_pathHasClockwisePointOrdering
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;

  -[PKStroke path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKStroke _pointsCount](self, "_pointsCount");
  v5 = v4;
  if (v4)
  {
    v6 = 0;
    v7 = v4 - 1;
    v8 = 0.0;
    do
    {
      objc_msgSend(v3, "locationAtIndex:", v6);
      v10 = v9;
      v12 = v11;
      if (v7 == v6)
        v13 = 0;
      else
        v13 = v6 + 1;
      objc_msgSend(v3, "locationAtIndex:", v13);
      ++v6;
      v8 = v8 + v10 * v15 - v14 * v12;
    }
    while (v5 != v6);
    LOBYTE(v5) = v8 < 0.0;
  }

  return v5;
}

- (BOOL)_pathHasAzimuthAngles
{
  void *v2;
  char v3;

  -[PKStroke path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAzimuthAngles");

  return v3;
}

+ (id)_commonGroupIDForStrokes:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(v9, "_groupID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (!v10 || (objc_msgSend(v10, "isEqual:", v6) & 1) == 0)
            v5 = 0;

        }
        else
        {
          objc_msgSend(v9, "_groupID", (_QWORD)v16);
          v12 = objc_claimAutoreleasedReturnValue();
          v5 = v12 != 0;
          v6 = (void *)v12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);

    if (v5)
      v13 = v6;
    else
      v13 = 0;
  }
  else
  {

    v6 = 0;
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

+ (void)_applyPropertiesToNewStrokes:(id)a3 fromOldStrokes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PKStroke _commonGroupIDForStrokes:](PKStroke, "_commonGroupIDForStrokes:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_setGroupID:", v6, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)_isBitmapEraserStroke
{
  void *v2;
  void *v3;
  char v4;

  -[PKStroke ink](self, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ink.eraser"));

  return v4;
}

- (BOOL)_isMaskedStroke
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PKStroke _clipPlane](self, "_clipPlane");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[PKStroke _renderMask](self, "_renderMask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (id)copyWithNewAnchorPointForTexture:(CGPoint)a3
{
  PKCrash();
}

- (CGPoint)_anchorPointForTexture
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

+ (id)_snapToShape:(id)a3
{
  return (id)objc_msgSend(a1, "_snapToShape:inputScale:", a3, 0.0);
}

+ (id)_snapToShape:(id)a3 inputScale:(double)a4
{
  id v5;
  PKShapeDrawingController *v6;
  PKShapeDrawingController *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v12[8];

  v5 = a3;
  if (objc_msgSend(v5, "count") == 1)
  {
    v6 = objc_alloc_init(PKShapeDrawingController);
    v7 = v6;
    if (v6)
      v6->_shapeRecognitionOn = 1;
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v12, 0, sizeof(v12));
    -[PKShapeDrawingController shapeFromStroke:inputScale:averageInputPoint:allowedShapeTypes:]((uint64_t)v7, v8, v12, 0, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "strokes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)interpolatePointDataWithStep:(double)a3 usingBlock:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  id v8;

  v8 = a4;
  v6 = -[PKStroke _pointsCount](self, "_pointsCount");
  v7 = v6 - 1;
  if (!v6)
    v7 = 0;
  -[PKStroke interpolatePointDataWithStep:from:to:usingBlock:](self, "interpolatePointDataWithStep:from:to:usingBlock:", v8, a3, 0.0, (double)v7);

}

- (void)interpolatePointDataWithStep:(double)a3 from:(double)a4 to:(double)a5 usingBlock:(id)a6
{
  void (**v10)(id, _BYTE *, double, double, double);
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  BOOL v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v30;
  char v31;

  v10 = (void (**)(id, _BYTE *, double, double, double))a6;
  -[PKStroke _strokeData](self, "_strokeData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v31 = 0;
    v13 = (unint64_t)a4;
    v14 = (unint64_t)a5;
    if ((unint64_t)a4 <= (unint64_t)a5)
    {
      v30 = a5 - (double)(unint64_t)a5;
      v15 = (unint64_t)a4;
      do
      {
        if (v15 == v13)
          v16 = a4 - (double)(unint64_t)a4;
        else
          v16 = 0.0;
        if (v15 == v14 || (a3 >= 1.0 ? (v17 = v15 == v13) : (v17 = 1), v17))
        {
          v19 = v30;
          if (v15 != v14)
            v19 = 1.0;
          v20 = v19 - v16;
          v21 = vcvtpd_s64_f64(v20 / a3);
          if (v21 < 1)
            v22 = 0.0;
          else
            v22 = v20 / (double)v21;
          v23 = v15 != v13;
          if (v23 <= v21)
          {
            do
            {
              -[PKStroke _strokeData](self, "_strokeData", *(_QWORD *)&v30);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "locationOnSegment:t:", v15, v16 + v22 * (double)v23);
              v26 = v25;
              v28 = v27;

              v10[2](v10, &v31, v26, v28, v16 + v22 * (double)v23 + (double)v15);
              if (v31)
                break;
            }
            while (v23++ < v21);
          }
        }
        else
        {
          -[PKStroke _strokeData](self, "_strokeData");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "locationAtIndex:", v15);
          ((void (*)(void (**)(id, _BYTE *, double, double, double), char *))v10[2])(v10, &v31);

          if (v31)
            break;
        }
        ++v15;
      }
      while (v15 <= v14);
    }
  }

}

- (void)debugRender:(CGContext *)a3
{
  void *v5;
  const CGPath *Mutable;
  _QWORD v7[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  const CGPath *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[3];
  char v16;
  CGAffineTransform v17;
  CGRect v18;

  if (!-[PKStroke hasSubstrokes](self, "hasSubstrokes"))
  {
    -[PKStroke _strokeMask](self, "_strokeMask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PKStroke debugRenderMasked:](self, "debugRenderMasked:", a3);
    }
    else
    {
      memset(&v17, 0, sizeof(v17));
      CGContextGetCTM(&v17, a3);
      CGContextSetLineWidth(a3, 2.0 / v17.a);
      if (!-[PKStroke _isHidden](self, "_isHidden"))
      {
        CGContextSetRGBStrokeColor(a3, 1.0, 0.0, 0.0, 0.5);
        -[PKStroke _bounds](self, "_bounds");
        CGContextStrokeRect(a3, v18);
      }
      CGContextSetRGBStrokeColor(a3, 1.0, 0.578, 0.0, 1.0);
      Mutable = CGPathCreateMutable();
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x2020000000;
      v16 = 1;
      v13 = 0u;
      v14 = 0u;
      v12 = 0u;
      -[PKStroke _transform](self, "_transform");
      v7[1] = 3221225472;
      v8 = v12;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[2] = __33__PKStroke_Slicing__debugRender___block_invoke;
      v7[3] = &unk_1E777A880;
      v9 = v13;
      v10 = v14;
      v7[4] = v15;
      v11 = Mutable;
      -[PKStroke interpolatePointDataWithStep:usingBlock:](self, "interpolatePointDataWithStep:usingBlock:", v7, 0.1);
      CGContextAddPath(a3, Mutable);
      CGContextStrokePath(a3);
      _Block_object_dispose(v15, 8);
    }
  }
}

void __33__PKStroke_Slicing__debugRender___block_invoke(uint64_t a1, double a2, double a3)
{
  double v5;
  double v6;
  int v7;
  CGPath *v8;

  v5 = *(double *)(a1 + 72) + a3 * *(double *)(a1 + 56) + *(double *)(a1 + 40) * a2;
  v6 = *(double *)(a1 + 80) + a3 * *(double *)(a1 + 64) + *(double *)(a1 + 48) * a2;
  v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v8 = *(CGPath **)(a1 + 88);
  if (v7)
  {
    CGPathMoveToPoint(v8, 0, v5, v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    CGPathAddLineToPoint(v8, 0, v5, v6);
  }
}

- (CGPath)newSelectionPathRepresentationWithPointsCount:(int *)a3
{
  void *v5;

  -[PKStroke _strokeData](self, "_strokeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = vcvtd_n_s64_f64((double)(unint64_t)objc_msgSend(v5, "_pointsCount"), 2uLL);

  return -[PKStroke _newPathRepresentation](self, "_newPathRepresentation");
}

- (void)newOutlinePaths
{
  uint64_t *v3;
  unint64_t v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v17;
  double v18;
  double v19;
  int32x2_t v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  char *v24;
  unint64_t v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  int32x2_t v41;
  __int128 v42;
  __int128 v43;
  char *v44;
  char *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  __int128 v52;
  char *v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  __int128 v60;
  double v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  double v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  float64x2_t v72;
  double v73;
  float64x2_t v74;
  double v75;
  __int128 v76;
  __int128 v77;
  void **v78[10];
  __int128 v79;
  __int128 v80;
  char v81;
  char v82;
  char v83;
  uint64_t v84;
  _QWORD v85[5];
  void *v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[8];
  char v90[48];
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  char *v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;

  v3 = (uint64_t *)operator new();
  v3[1] = 0;
  v3[2] = 0;
  *v3 = 0;
  v71 = v3;
  v4 = -[PKStroke _pointsCount](self, "_pointsCount");
  v101 = 0u;
  v102 = 0u;
  v100 = 0u;
  -[PKStroke _transform](self, "_transform");
  v6 = v100.f64[1];
  v5 = v100.f64[0];
  v97 = 0;
  v98 = 0;
  v99 = 0;
  v94 = 0;
  v95 = 0;
  v96 = 0;
  -[PKStroke _strokeData](self, "_strokeData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "radiusAtIndex:", 0);
  v9 = v8;

  std::vector<ClipperLib::IntPoint>::reserve((void **)&v97, 10 * v4);
  v10 = sqrt(v6 * v6 + v5 * v5);
  v68 = v10;
  v11 = v10 * (v9 + -2.0);
  __asm { FMOV            V0.2S, #-1.0 }
  v70 = _D0;
  if (v4 == 1)
  {
    -[PKStroke _strokeData](self, "_strokeData", *(_QWORD *)&v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "locationAtIndex:", 0);
    v74 = vaddq_f64(v102, vmlaq_n_f64(vmulq_n_f64(v101, v18), v100, v19));

    v20 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(v74, (float64x2_t)vdupq_n_s64(0x4059000000000000uLL))));
    *(_QWORD *)&v21 = v20.i32[0];
    *((_QWORD *)&v21 + 1) = v20.i32[1];
    v22 = v21;
    v23 = v98;
    if (v98 >= v99)
    {
      v77 = v22;
      v53 = v97;
      v54 = 0xAAAAAAAAAAAAAAABLL * ((v98 - v97) >> 3);
      v55 = v54 + 1;
      if (v54 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * ((v99 - v97) >> 3) > v55)
        v55 = 0x5555555555555556 * ((v99 - v97) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((v99 - v97) >> 3) >= 0x555555555555555)
        v56 = 0xAAAAAAAAAAAAAAALL;
      else
        v56 = v55;
      if (v56)
      {
        v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v99, v56);
        v53 = v97;
        v23 = v98;
      }
      else
      {
        v57 = 0;
      }
      v58 = &v57[24 * v54];
      v59 = &v57[24 * v56];
      *(_OWORD *)v58 = v77;
      *((_QWORD *)v58 + 2) = 0xBF80000000000000;
      v24 = v58 + 24;
      if (v23 != v53)
      {
        do
        {
          v60 = *(_OWORD *)(v23 - 24);
          *((_QWORD *)v58 - 1) = *((_QWORD *)v23 - 1);
          *(_OWORD *)(v58 - 24) = v60;
          v58 -= 24;
          v23 -= 24;
        }
        while (v23 != v53);
        v53 = v97;
      }
      v97 = v58;
      v98 = v24;
      v99 = v59;
      if (v53)
        operator delete(v53);
    }
    else
    {
      *(_OWORD *)v98 = v22;
      *((_QWORD *)v23 + 2) = 0xBF80000000000000;
      v24 = v23 + 24;
    }
    v98 = v24;
    v26 = v11;
  }
  else
  {
    v25 = 0;
    v69 = v4 - 2;
    v72 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    v26 = v10 * (v9 + -2.0);
    do
    {
      -[PKStroke _strokeData](self, "_strokeData", *(_QWORD *)&v68);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "radiusAtIndex:", v25);
      v29 = v28;

      -[PKStroke _strokeData](self, "_strokeData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "radiusAtIndex:", v25 + 1);
      v31 = v68 * (v29 + -2.0);
      v33 = v68 * (v32 + -2.0);

      v34 = dbl_1BE4FD410[v25 < v69];
      if (v11 >= v33)
        v11 = v33;
      v35 = v33 - v31;
      v36 = 0.0;
      do
      {
        if (vabdd_f64(v31 + v35 * v36, v26) > 0.25 && v98 != v97)
        {
          v79 = 0u;
          v80 = 0u;
          v37 = 25.0;
          if (v26 * 0.025 <= 0.25)
            v37 = v26 * 0.025 * 100.0;
          memset(&v78[2], 0, 64);
          v85[4] = v70;
          v86 = &unk_1E77745C0;
          v87 = 0uLL;
          v88 = 0uLL;
          memset(v89, 0, 29);
          v78[0] = (void **)0x4000000000000000;
          v78[1] = *(void ***)&v37;
          *(_OWORD *)&v85[2] = xmmword_1BE4FD2B0;
          ClipperLib::ClipperOffset::AddPath((uint64_t)v78, &v97, 1, 4u);
          ClipperLib::ClipperOffset::Execute((uint64_t *)v78, &v94, v26 * 100.0);
          std::vector<std::vector<ClipperLib::IntPoint>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::vector<ClipperLib::IntPoint>*>,std::__wrap_iter<std::vector<ClipperLib::IntPoint>*>>(v71, v71[1], v94, v95, 0xAAAAAAAAAAAAAAABLL * ((v95 - v94) >> 3));
          std::vector<ClipperLib::IntPoint>::resize((uint64_t)&v97, 0);
          std::vector<std::vector<ClipperLib::IntPoint>>::resize(&v94, 0);
          ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)v78);
          v26 = v31 + v35 * v36;
        }
        -[PKStroke _strokeData](self, "_strokeData");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "locationOnSegment:t:", v25, v36);
        v73 = v40;
        v75 = v39;

        v41 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(vaddq_f64(v102, vmlaq_n_f64(vmulq_n_f64(v101, v73), v100, v75)), v72)));
        *(_QWORD *)&v42 = v41.i32[0];
        *((_QWORD *)&v42 + 1) = v41.i32[1];
        v43 = v42;
        v44 = v98;
        if (v98 >= v99)
        {
          v76 = v43;
          v45 = v97;
          v46 = 0xAAAAAAAAAAAAAAABLL * ((v98 - v97) >> 3);
          v47 = v46 + 1;
          if (v46 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * ((v99 - v97) >> 3) > v47)
            v47 = 0x5555555555555556 * ((v99 - v97) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((v99 - v97) >> 3) >= 0x555555555555555)
            v48 = 0xAAAAAAAAAAAAAAALL;
          else
            v48 = v47;
          if (v48)
          {
            v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v99, v48);
            v45 = v97;
            v44 = v98;
          }
          else
          {
            v49 = 0;
          }
          v50 = &v49[24 * v46];
          *(_OWORD *)v50 = v76;
          *((_QWORD *)v50 + 2) = 0xBF80000000000000;
          v51 = v50;
          if (v44 != v45)
          {
            do
            {
              v52 = *(_OWORD *)(v44 - 24);
              *((_QWORD *)v51 - 1) = *((_QWORD *)v44 - 1);
              *(_OWORD *)(v51 - 24) = v52;
              v51 -= 24;
              v44 -= 24;
            }
            while (v44 != v45);
            v45 = v97;
          }
          v24 = v50 + 24;
          v97 = v51;
          v98 = v50 + 24;
          v99 = &v49[24 * v48];
          if (v45)
            operator delete(v45);
        }
        else
        {
          *(_OWORD *)v98 = v43;
          *((_QWORD *)v44 + 2) = 0xBF80000000000000;
          v24 = v44 + 24;
        }
        v98 = v24;
        v36 = v36 + 0.1;
      }
      while (v36 < v34);
    }
    while (v25++ != v69);
  }
  if (v24 != v97)
  {
    v80 = 0u;
    v79 = 0u;
    v61 = v26 * 0.025 * 100.0;
    if (v26 * 0.025 > 0.25)
      v61 = 25.0;
    memset(&v78[2], 0, 64);
    v85[4] = v70;
    v86 = &unk_1E77745C0;
    v87 = 0uLL;
    v88 = 0uLL;
    memset(v89, 0, 29);
    v78[0] = (void **)0x4000000000000000;
    v78[1] = *(void ***)&v61;
    *(_OWORD *)&v85[2] = xmmword_1BE4FD2B0;
    ClipperLib::ClipperOffset::AddPath((uint64_t)v78, &v97, 1, 4u);
    ClipperLib::ClipperOffset::Execute((uint64_t *)v78, &v94, v26 * 100.0);
    std::vector<std::vector<ClipperLib::IntPoint>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::vector<ClipperLib::IntPoint>*>,std::__wrap_iter<std::vector<ClipperLib::IntPoint>*>>(v71, v71[1], v94, v95, 0xAAAAAAAAAAAAAAABLL * ((v95 - v94) >> 3));
    ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)v78);
  }
  ClipperLib::SimplifyPolygons(v71, v71, 1);
  ClipperLib::CleanPolygons(v71, v71, v11 * 0.001 * 100.0);
  if (v71[1] != *v71)
  {
    -[PKStroke _clipPlane](self, "_clipPlane");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      v91 = 0;
      v92 = 0;
      v93 = 0;
      -[PKStroke _transform](self, "_transform");
      -[PKStroke generateClipPaths:transform:](self, "generateClipPaths:transform:", &v91, v90);
      if (v92 != v91)
      {
        v87 = 0uLL;
        *(_QWORD *)&v88 = 0;
        memset(v89, 0, 24);
        memset(&v89[4], 0, 24);
        memset(&v85[1], 0, 32);
        v78[0] = (void **)&off_1E7774540;
        memset(&v78[1], 0, 72);
        *((_QWORD *)&v79 + 1) = (char *)&v79 + 8;
        *(_QWORD *)&v80 = (char *)&v79 + 8;
        *((_QWORD *)&v80 + 1) = 0;
        v81 = 0;
        LOBYTE(v86) = 0;
        v82 = 0;
        v83 = 0;
        WORD4(v88) = 0;
        v84 = 0;
        v85[0] = &off_1E7774588;
        ClipperLib::ClipperBase::AddPaths((uint64_t)v85, v71, 0, 1);
        v63 = v91;
        if (v92 != v91)
        {
          v64 = 0;
          v65 = 0;
          v66 = (char *)v78 + (unint64_t)*(v78[0] - 3);
          do
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v66 + 16))(v66, v63 + v64, 1, 1);
            ++v65;
            v63 = v91;
            v64 += 24;
          }
          while (v65 < 0xAAAAAAAAAAAAAAABLL * ((v92 - v91) >> 3));
        }
        std::vector<std::vector<ClipperLib::IntPoint>>::resize(v71, 0);
        ClipperLib::Clipper::Execute((uint64_t)v78, 2, v71, 0, 0);
        v78[0] = (void **)&off_1E7774540;
        v85[0] = &off_1E7774588;
        std::__list_imp<long long>::clear((_QWORD *)&v79 + 1);
        if (v78[7])
        {
          v78[8] = v78[7];
          operator delete(v78[7]);
        }
        if (v78[4])
        {
          v78[5] = v78[4];
          operator delete(v78[4]);
        }
        if (v78[1])
        {
          v78[2] = v78[1];
          operator delete(v78[1]);
        }
        ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)v85);
      }
      v78[0] = (void **)&v91;
      std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](v78);
    }
  }
  v78[0] = (void **)&v94;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](v78);
  if (v97)
  {
    v98 = v97;
    operator delete(v97);
  }
  return v71;
}

- (double)_thresholdForPoint:(_PKStrokePoint *)a3
{
  double aspectRatio;
  double result;

  aspectRatio = 1.0;
  if (a3->aspectRatio >= 1.0)
    aspectRatio = a3->aspectRatio;
  result = (a3->radius + a3->edgeWidth) * aspectRatio;
  if (result < 3.5)
    return 3.5;
  return result;
}

- (BOOL)intersectsPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[PKStroke _strokeMask](self, "_strokeMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return -[PKStroke intersectsPointMasked:](self, "intersectsPointMasked:", x, y);
  else
    return -[PKStroke intersectsPoint:boundsOutset:minimumStrokeThreshold:](self, "intersectsPoint:boundsOutset:minimumStrokeThreshold:", x, y, 10.0, 10.0);
}

- (BOOL)intersectsPoint:(CGPoint)a3 boundsOutset:(double)a4 minimumStrokeThreshold:(double)a5
{
  double y;
  double x;
  void *v10;
  char v12;
  _QWORD v13[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  CGPoint v18;
  CGRect v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  -[PKStroke _strokeMask](self, "_strokeMask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    return -[PKStroke intersectsPointMasked:boundsOutset:minimumStrokeThreshold:](self, "intersectsPointMasked:boundsOutset:minimumStrokeThreshold:", x, y, a4, a5);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[PKStroke _bounds](self, "_bounds");
  v20 = CGRectInset(v19, -a4, -a4);
  v18.x = x;
  v18.y = y;
  if (CGRectContainsPoint(v20, v18))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__PKStroke_Slicing__intersectsPoint_boundsOutset_minimumStrokeThreshold___block_invoke;
    v13[3] = &unk_1E777A8A8;
    *(double *)&v13[6] = a5;
    *(double *)&v13[7] = x;
    *(double *)&v13[8] = y;
    v13[4] = self;
    v13[5] = &v14;
    -[PKStroke interpolatePointDataWithStep:usingBlock:](self, "interpolatePointDataWithStep:usingBlock:", v13, 1.0);
  }
  v12 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v12;
}

uint64_t __73__PKStroke_Slicing__intersectsPoint_boundsOutset_minimumStrokeThreshold___block_invoke(uint64_t a1, _BYTE *a2, double a3, double a4, double a5)
{
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t result;
  double v20;
  double v21;
  _OWORD v23[5];
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v9, "_transform");
    v10 = *((double *)&v31 + 1);
    v11 = *(double *)&v31;
    v13 = *((double *)&v32 + 1);
    v12 = *(double *)&v32;
    v14 = *((double *)&v33 + 1);
    v15 = *(double *)&v33;
    v9 = *(void **)(a1 + 32);
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
    v14 = 0.0;
    v13 = 0.0;
    v10 = 0.0;
    v15 = 0.0;
    v12 = 0.0;
    v11 = 0.0;
  }
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  objc_msgSend(v9, "_strokeData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "decompressedPointAt:", (uint64_t)a5);
  }
  else
  {
    v30 = 0;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
  }

  v18 = *(void **)(a1 + 32);
  v23[2] = v27;
  v23[3] = v28;
  v23[4] = v29;
  v24 = v30;
  v23[0] = v25;
  v23[1] = v26;
  result = objc_msgSend(v18, "_thresholdForPoint:", v23);
  v21 = fmax(v20, *(double *)(a1 + 48));
  if ((v14 + a4 * v13 + v10 * a3 - *(double *)(a1 + 64)) * (v14 + a4 * v13 + v10 * a3 - *(double *)(a1 + 64))
     + (v15 + a4 * v12 + v11 * a3 - *(double *)(a1 + 56)) * (v15 + a4 * v12 + v11 * a3 - *(double *)(a1 + 56)) < v21 * v21)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a2 = 1;
  }
  return result;
}

- (BOOL)intersectsLineFrom:(CGPoint)a3 to:(CGPoint)a4 minThreshold:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  CGFloat v13;
  CGFloat v14;
  CGFloat width;
  CGFloat height;
  char v17;
  _QWORD v18[12];
  BOOL v19;
  _QWORD v20[3];
  char v21;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  CGPoint v27;
  CGRect v28;
  CGRect v29;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  -[PKStroke _strokeMask](self, "_strokeMask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    return -[PKStroke intersectsLineFromMasked:to:minThreshold:](self, "intersectsLineFromMasked:to:minThreshold:", v9, v8, x, y, a5);
  -[PKStroke _bounds](self, "_bounds");
  v29 = CGRectInset(v28, -a5, -a5);
  v13 = v29.origin.x;
  v14 = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v27.x = v9;
  v27.y = v8;
  if (CGRectContainsPoint(v29, v27) || DKDLineIntersectsRect(x, y, v9, v8, v13, v14, width, height))
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x4012000000;
    v22[3] = __Block_byref_object_copy__17;
    v22[4] = __Block_byref_object_dispose__17;
    v22[5] = "";
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__PKStroke_Slicing__intersectsLineFrom_to_minThreshold___block_invoke;
    v18[3] = &unk_1E777A8D0;
    *(double *)&v18[8] = v9;
    *(double *)&v18[9] = v8;
    v18[4] = self;
    v18[5] = &v23;
    v19 = (y - v8) * (y - v8) + (x - v9) * (x - v9) > 1.0;
    *(double *)&v18[10] = x;
    *(double *)&v18[11] = y;
    v18[6] = v20;
    v18[7] = v22;
    -[PKStroke interpolatePointDataWithStep:usingBlock:](self, "interpolatePointDataWithStep:usingBlock:", v18, 1.0, 0x2020000000);
    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v22, 8);
  }
  v17 = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);
  return v17;
}

uint64_t __56__PKStroke_Slicing__intersectsLineFrom_to_minThreshold___block_invoke(uint64_t a1, _BYTE *a2, double a3, double a4, double a5)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t result;
  float64x2_t v13;
  double v14;
  __int128 v15;
  __int128 v16;
  float64x2_t v17;
  __int128 v18;
  float64x2_t v19;
  __int128 v20;
  float64x2_t v21;
  float64x2_t v24;
  double v25[2];
  uint64_t v26;
  double v27;
  _OWORD v28[5];
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[2];
  _OWORD v40[2];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v8, "_transform");
    v16 = v37;
    v18 = v36;
    v20 = v38;
    v8 = *(void **)(a1 + 32);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v18 = 0u;
    v20 = 0u;
    v36 = 0u;
    v16 = 0u;
  }
  v35 = 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
  objc_msgSend(v8, "_strokeData", v16, v18, v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "decompressedPointAt:", (uint64_t)a5);
  }
  else
  {
    v35 = 0;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v30 = 0u;
  }

  v11 = *(void **)(a1 + 32);
  v28[2] = v32;
  v28[3] = v33;
  v28[4] = v34;
  v29 = v35;
  v28[0] = v30;
  v28[1] = v31;
  result = objc_msgSend(v11, "_thresholdForPoint:", v28);
  v13 = vaddq_f64(v21, vmlaq_n_f64(vmulq_n_f64(v17, a4), v19, a3));
  if ((v13.f64[1] - *(double *)(a1 + 72)) * (v13.f64[1] - *(double *)(a1 + 72))
     + (v13.f64[0] - *(double *)(a1 + 64)) * (v13.f64[0] - *(double *)(a1 + 64)) < v14 * v14)
    goto LABEL_8;
  if (*(_BYTE *)(a1 + 96) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v26 = 0;
    v15 = *(_OWORD *)(a1 + 64);
    v40[0] = *(_OWORD *)(a1 + 80);
    v40[1] = v15;
    v39[0] = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
    v39[1] = v13;
    v24 = v13;
    result = DKDIntersectionOfLines((double *)v40, (double *)v39, (double *)&v26, &v27, v25, 0, 0);
    if ((_DWORD)result)
    {
LABEL_8:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a2 = 1;
      return result;
    }
    v13 = v24;
  }
  *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) = v13;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (void)generateClipperPath:(void *)a3
{
  char *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  -[PKStroke _transform](self, "_transform");
  std::vector<ClipperLib::IntPoint>::reserve((void **)a3, -[PKStroke _pointsCount](self, "_pointsCount"));
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __41__PKStroke_Slicing__generateClipperPath___block_invoke;
  v21[3] = &__block_descriptor_88_e26_v40__0_CGPoint_dd_8d24_B32l;
  v22 = v26;
  v23 = v27;
  v24 = v28;
  v25 = a3;
  -[PKStroke interpolatePointDataWithStep:usingBlock:](self, "interpolatePointDataWithStep:usingBlock:", v21, 1.0);
  v5 = *(char **)a3;
  v6 = *((_QWORD *)a3 + 1);
  if (v6 - *(_QWORD *)a3 == 24)
  {
    v20 = *(_OWORD *)(v5 + 8);
    v7 = *(_QWORD *)v5 + 1;
    v8 = *((_QWORD *)a3 + 2);
    if (v6 >= v8)
    {
      v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - (_QWORD)v5) >> 3);
      if (2 * v10 <= 2)
        v11 = 2;
      else
        v11 = 2 * v10;
      if (v10 >= 0x555555555555555)
        v12 = 0xAAAAAAAAAAAAAAALL;
      else
        v12 = v11;
      v13 = std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)a3 + 16, v12);
      v14 = (char *)(v13 + 3);
      v16 = (char *)&v13[3 * v15];
      v13[3] = v7;
      *((_OWORD *)v13 + 2) = v20;
      v9 = (char *)(v13 + 6);
      v18 = *(char **)a3;
      v17 = (char *)*((_QWORD *)a3 + 1);
      if (v17 != *(char **)a3)
      {
        do
        {
          v19 = *(_OWORD *)(v17 - 24);
          *((_QWORD *)v14 - 1) = *((_QWORD *)v17 - 1);
          *(_OWORD *)(v14 - 24) = v19;
          v14 -= 24;
          v17 -= 24;
        }
        while (v17 != v18);
        v17 = *(char **)a3;
      }
      *(_QWORD *)a3 = v14;
      *((_QWORD *)a3 + 1) = v9;
      *((_QWORD *)a3 + 2) = v16;
      if (v17)
        operator delete(v17);
    }
    else
    {
      *(_QWORD *)v6 = v7;
      *(_OWORD *)(v6 + 8) = v20;
      v9 = (char *)(v6 + 24);
    }
    *((_QWORD *)a3 + 1) = v9;
  }
}

void __41__PKStroke_Slicing__generateClipperPath___block_invoke(uint64_t a1, double a2, double a3, double a4)
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

- (BOOL)intersectsClosedStroke:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *__p;
  void *v9;
  uint64_t v10;

  v4 = a3;
  -[PKStroke _strokeMask](self, "_strokeMask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[PKStroke intersectsClosedStrokeMasked:](self, "intersectsClosedStrokeMasked:", v4);
  }
  else
  {
    __p = 0;
    v9 = 0;
    v10 = 0;
    objc_msgSend(v4, "generateClipperPath:", &__p);
    v6 = -[PKStroke intersectsClipperPath:](self, "intersectsClipperPath:", &__p);
    if (__p)
    {
      v9 = __p;
      operator delete(__p);
    }
  }

  return v6;
}

- (BOOL)intersectsClipperPath:(void *)a3
{
  unint64_t v4;
  void *v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[29];
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (**v13)(ClipperLib::Clipper *__hidden);
  void *v14[2];
  __int128 v15;
  __int128 v16;
  __int128 __p;
  uint64_t v18;
  _QWORD v19[4];
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  void (**v24)(ClipperLib::Clipper *__hidden);
  __int128 v25;
  __int128 v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;

  v38 = 0;
  v39 = 0;
  v40 = 0;
  -[PKStroke generateClipperPath:](self, "generateClipperPath:", &v38);
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v25 = 0u;
  v26 = 0u;
  v13 = &off_1E7774540;
  v15 = 0u;
  v16 = 0u;
  __p = 0u;
  *(_OWORD *)v14 = 0u;
  v18 = 0;
  v19[0] = v19;
  v19[1] = v19;
  v19[2] = 0;
  v20 = 0;
  v27 = 0;
  v21 = 0;
  v22 = 0;
  v31 = 0;
  v23 = 0;
  v24 = &off_1E7774588;
  ClipperLib::ClipperBase::AddPath((uint64_t)&v24, &v38, 0, 0);
  ClipperLib::ClipperBase::AddPath((uint64_t)&v24, (uint64_t **)a3, 1, 1);
  memset(v9, 0, sizeof(v9));
  v8 = 0u;
  v7 = 0u;
  v6 = &unk_1E77745E0;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  ClipperLib::Clipper::Execute((uint64_t)&v13, 0, (ClipperLib::PolyTree *)&v6, 0, 0);
  v4 = (unint64_t)(v11 - (_QWORD)v10) >> 3;
  if ((int)v4 >= 1)
    LODWORD(v4) = v4 - (**((_QWORD **)&v8 + 1) != *v10);
  ClipperLib::PolyTree::~PolyTree((ClipperLib::PolyTree *)&v6);
  v13 = &off_1E7774540;
  v24 = &off_1E7774588;
  std::__list_imp<long long>::clear(v19);
  if ((_QWORD)__p)
  {
    *((_QWORD *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (*((_QWORD *)&v15 + 1))
  {
    *(_QWORD *)&v16 = *((_QWORD *)&v15 + 1);
    operator delete(*((void **)&v15 + 1));
  }
  if (v14[0])
  {
    v14[1] = v14[0];
    operator delete(v14[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v24);
  if (v38)
  {
    v39 = v38;
    operator delete(v38);
  }
  return (int)v4 > 0;
}

- (BOOL)intersectsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  float64x2_t v10;
  BOOL v11;
  float64x2_t v12[3];
  void *__p;
  void *v14;
  uint64_t v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKStroke _strokeMask](self, "_strokeMask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    return -[PKStroke intersectsRectMasked:](self, "intersectsRectMasked:", x, y, width, height);
  __p = 0;
  v14 = 0;
  v15 = 0;
  v10 = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16);
  v12[0] = *(float64x2_t *)MEMORY[0x1E0C9BAA8];
  v12[1] = v10;
  v12[2] = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 32);
  generateRectClipperPath(v12, (uint64_t)&__p, x, y, width, height);
  v11 = -[PKStroke intersectsClipperPath:](self, "intersectsClipperPath:", &__p);
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
  return v11;
}

- (id)_sliceWithSlicingBlock:(id)a3 inDrawing:(id)a4 newRootStroke:(id *)a5
{
  id v8;
  id *v9;
  PKStroke *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  PKStroke *v30;
  id v31;
  id v32;
  void *v34;
  void **v35;
  PKStroke *v36;
  void (**v37)(id, PKStroke *);
  id v38;
  id v39;

  v37 = (void (**)(id, PKStroke *))a3;
  v8 = a4;
  v9 = a5;
  v38 = v8;
  v10 = self;
  objc_storeStrong(v9, self);
  if (-[PKStroke hasSubstrokes](v10, "hasSubstrokes"))
  {
    -[PKStroke _substrokesInDrawing:](v10, "_substrokesInDrawing:", v38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "count");
    if (v13 < 1)
    {
      v17 = 0;
    }
    else
    {
      v36 = v10;
      v35 = v9;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      do
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v14, v35);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        objc_msgSend(v18, "_sliceWithSlicingBlock:inDrawing:newRootStroke:", v37, v38, &v39);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v19);
        v16 |= v39 != v18;
        v20 = v39 != 0;
        if ((v16 & 1) != 0 && !v17)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v21;
          if (v14)
            objc_msgSend(v21, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v11, 0, v14);
        }
        if (v39)
          objc_msgSend(v17, "addObject:");
        v15 |= v20;

        ++v14;
      }
      while (v13 != v14);
      if ((v16 & 1) != 0)
      {
        if ((v15 & 1) == 0)
        {
          v34 = *v35;
          *v35 = 0;

          v31 = (id)MEMORY[0x1E0C9AA60];
          v10 = v36;
          goto LABEL_25;
        }
        v10 = v36;
        v22 = -[PKStroke _newStrokeWithSubstrokes:inDrawing:](v36, "_newStrokeWithSubstrokes:inDrawing:", v17, v38);
        objc_msgSend(v12, "addObject:", v22);
        v23 = *v35;
        *v35 = (void *)v22;

      }
      else
      {
        v10 = v36;
      }
    }
    v31 = v12;
LABEL_25:

    goto LABEL_26;
  }
  v37[2](v37, v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24 || !objc_msgSend(v24, "count"))
  {
    v32 = *v9;
    *v9 = 0;

LABEL_20:
    v31 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_21;
  }
  if (objc_msgSend(v25, "count") == 1)
  {
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_strokeUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStroke _strokeUUID](v10, "_strokeUUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if ((v29 & 1) != 0)
      goto LABEL_20;
  }
  v30 = -[PKStroke _newStrokeWithSubstrokes:inDrawing:](v10, "_newStrokeWithSubstrokes:inDrawing:", v25, v38);

  objc_storeStrong(v9, v30);
  objc_msgSend(v25, "arrayByAddingObject:", v30);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v30;
LABEL_21:

LABEL_26:
  return v31;
}

- (int64_t)_visibleSubstrokeCountInDrawing:(id)a3
{
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PKStroke_Slicing___visibleSubstrokeCountInDrawing___block_invoke;
  v5[3] = &unk_1E777A8F8;
  v5[4] = &v6;
  -[PKStroke _visitVisibleSubstrokes:inDrawing:](self, "_visitVisibleSubstrokes:inDrawing:", v5, a3);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__PKStroke_Slicing___visibleSubstrokeCountInDrawing___block_invoke(uint64_t a1, void *a2)
{
  if ((objc_msgSend(a2, "hasSubstrokes") & 1) == 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

- (void)_addVisibleSubstrokesTo:(id)a3 inDrawing:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PKStroke_Slicing___addVisibleSubstrokesTo_inDrawing___block_invoke;
  v8[3] = &unk_1E777A5D8;
  v9 = v6;
  v7 = v6;
  -[PKStroke _visitVisibleSubstrokes:inDrawing:](self, "_visitVisibleSubstrokes:inDrawing:", v8, a4);

}

uint64_t __55__PKStroke_Slicing___addVisibleSubstrokesTo_inDrawing___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "hasSubstrokes") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

- (BOOL)_visitVisibleSubstrokes:(id)a3 inDrawing:(id)a4
{
  uint64_t (**v6)(id, PKStroke *, _BYTE *);
  id v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unsigned __int8 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, PKStroke *, _BYTE *))a3;
  v7 = a4;
  v21 = 0;
  if (!-[PKStroke _isHidden](self, "_isHidden")
    && (-[PKStroke hasSubstrokes](self, "hasSubstrokes") || -[PKStroke _pointsCount](self, "_pointsCount")))
  {
    v9 = v6[2](v6, self, &v21);
    v8 = v21;
    if (v21)
      v10 = 0;
    else
      v10 = v9;
    if (v10 == 1)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[PKStroke _substrokesInDrawing:](self, "_substrokesInDrawing:", v7, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v18;
LABEL_11:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          v21 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "_visitVisibleSubstrokes:inDrawing:", v6, v7);
          if ((v21 & 1) != 0)
            break;
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
            if (v12)
              goto LABEL_11;
            break;
          }
        }
      }

      v8 = v21;
    }
  }
  else
  {
    v8 = 0;
  }
  v15 = v8 != 0;

  return v15;
}

- (id)_updateStroke:(id)a3 inDrawing:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  PKCrash();
}

- (id)_mergeWithStroke:(id)a3 inDrawing:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  PKCrash();
}

- (void)_appendPointsOfInterestForSelectionMasked:(void *)a3
{
  uint64_t *v5;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t *v15;
  float64x2_t *v16;
  float64x2_t v17;
  float64x2_t *v18;
  float64x2_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  float64x2_t *v25;
  uint64_t v26;
  float64x2_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  _OWORD v31[11];
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[29];
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;

  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  -[PKStroke _transform](self, "_transform");
  v5 = (uint64_t *)operator new();
  v5[1] = 0;
  v5[2] = 0;
  *v5 = 0;
  __asm { FMOV            V0.2S, #-1.0 }
  v32 = _D0;
  v33 = &unk_1E77745C0;
  v34 = 0u;
  v35 = 0u;
  memset(v36, 0, sizeof(v36));
  v31[0] = xmmword_1BE4FD420;
  memset(&v31[1], 0, 96);
  v31[10] = xmmword_1BE4FD2B0;
  -[PKStroke _strokeMask](self, "_strokeMask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ClipperLib::ClipperOffset::AddPaths((uint64_t)v31, (uint64_t *)objc_msgSend(v11, "maskPaths"), 1, 0);

  ClipperLib::ClipperOffset::Execute((uint64_t *)v31, v5, 1500.0);
  v12 = *v5;
  v26 = v5[1];
  if (*v5 != v26)
  {
    v13 = (char *)a3 + 16;
    do
    {
      v28 = 0;
      v29 = 0;
      v30 = 0;
      std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(&v28, *(const void **)v12, *(_QWORD *)(v12 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v12 + 8) - *(_QWORD *)v12) >> 3));
      v14 = v28;
      v15 = v29;
      if (v28 != v29)
      {
        v16 = (float64x2_t *)*((_QWORD *)a3 + 1);
        do
        {
          v17 = vaddq_f64(v39, vmlaq_n_f64(vmulq_n_f64(v38, (double)v14[1] / 100.0), v37, (double)*v14 / 100.0));
          if ((unint64_t)v16 >= *v13)
          {
            v27 = v17;
            v19 = *(float64x2_t **)a3;
            v20 = ((uint64_t)v16 - *(_QWORD *)a3) >> 4;
            v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) >> 60)
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            v22 = *v13 - (_QWORD)v19;
            if (v22 >> 3 > v21)
              v21 = v22 >> 3;
            if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
              v23 = 0xFFFFFFFFFFFFFFFLL;
            else
              v23 = v21;
            if (v23)
            {
              v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 16, v23);
              v19 = *(float64x2_t **)a3;
              v16 = (float64x2_t *)*((_QWORD *)a3 + 1);
            }
            else
            {
              v24 = 0;
            }
            v25 = (float64x2_t *)&v24[16 * v20];
            *v25 = v27;
            v18 = v25 + 1;
            if (v16 != v19)
            {
              do
              {
                v25[-1] = v16[-1];
                --v25;
                --v16;
              }
              while (v16 != v19);
              v19 = *(float64x2_t **)a3;
            }
            *(_QWORD *)a3 = v25;
            *((_QWORD *)a3 + 1) = v18;
            *((_QWORD *)a3 + 2) = &v24[16 * v23];
            if (v19)
              operator delete(v19);
          }
          else
          {
            *v16 = v17;
            v18 = v16 + 1;
          }
          *((_QWORD *)a3 + 1) = v18;
          v14 += 3;
          v16 = v18;
        }
        while (v14 != v15);
        v14 = v28;
      }
      if (v14)
      {
        v29 = v14;
        operator delete(v14);
      }
      v12 += 24;
    }
    while (v12 != v26);
  }
  ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)v31);
}

- (id)sliceWithEraser:(const void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKStroke sliceWithEraser:toClip:clipType:](PKStroke, "sliceWithEraser:toClip:clipType:", a3, v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sliceWithMask:(const void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKStroke sliceWithEraser:toClip:clipType:](PKStroke, "sliceWithEraser:toClip:clipType:", a3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sliceWithEraser:(const void *)a3 toClip:(id)a4
{
  objc_msgSend(a1, "sliceWithEraser:toClip:clipType:", a3, a4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sliceWithEraser:(const void *)a3 toClip:(id)a4 clipType:(int)a5
{
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  CGFloat b;
  CGFloat a;
  int64x2_t *v16;
  __int32 v17;
  __int32 v18;
  int64x2_t v19;
  int64x2_t *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  __int128 v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void **v42;
  _QWORD *v43;
  unint64_t v44;
  _QWORD *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  int64_t v57;
  char *v58;
  char **v59;
  CGFloat v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  CGFloat v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  PKStrokeMask *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  int64x2_t ***v90;
  int64x2_t **v91;
  int64x2_t **v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  int64x2_t *v96;
  int64x2_t *v97;
  _QWORD *v99;
  ClipperLib::ClipperBase *v100;
  int64_t v101;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _BOOL4 v107;
  void *v108;
  float64x2_t v109;
  id v110;
  id v111;
  CGPoint point;
  CGPoint pointa;
  void *pointb;
  CGAffineTransform v115;
  CGAffineTransform v116;
  CGAffineTransform v117;
  CGAffineTransform v118;
  CGAffineTransform v119;
  CGAffineTransform v120;
  CGAffineTransform v121;
  void *v122;
  int v123[2];
  uint64_t v124;
  char *v125;
  char *v126;
  char *v127;
  _BYTE v128[69];
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *__p;
  int64x2_t *v133;
  int64x2_t *v134;
  CGAffineTransform v135;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v138;
  CGAffineTransform v139;
  CGAffineTransform v140;
  uint64_t (**v141)(ClipperLib::Clipper *__hidden);
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;
  _QWORD v147[4];
  char v148;
  char v149;
  char v150;
  void (*v151)(IntPoint *, IntPoint *, IntPoint *, IntPoint *, IntPoint *, double, float);
  void (**v152)(ClipperLib::Clipper *__hidden);
  __int128 v153;
  __int128 v154;
  char v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  __int16 v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  _QWORD v166[4];
  CGRect v167;
  CGRect v168;
  CGRect v169;

  v166[1] = *MEMORY[0x1E0C80C00];
  v157 = 0;
  v156 = 0;
  v158 = 0;
  v160 = 0;
  v161 = 0;
  v162 = 0;
  v163 = 0;
  v165 = 0;
  v164 = 0;
  v153 = 0u;
  v154 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v141 = &off_1E7774540;
  v146 = 0;
  v147[0] = v147;
  v99 = v147;
  v100 = (ClipperLib::ClipperBase *)&v152;
  v147[1] = v147;
  v147[2] = 0;
  v148 = 0;
  v155 = 0;
  v149 = 0;
  v150 = 0;
  v159 = 0;
  v152 = &off_1E7774588;
  v151 = ZFillCallback;
  v111 = a4;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v152, (uint64_t *)a3, 1, 1);
  v104 = objc_msgSend(v111, "count");
  if (v104 >= 1)
  {
    for (i = 0; i != v104; ++i)
    {
      objc_msgSend(v111, "objectAtIndexedSubscript:", i, v99, v100);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      memset(v128, 0, 48);
      if (v7)
        objc_msgSend(v7, "_transform");
      v140 = *(CGAffineTransform *)v128;
      if (CGAffineTransformIsIdentity(&v140))
      {
        v9 = (uint64_t)*(v141 - 3);
        objc_msgSend(v8, "_strokeMask");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ClipperLib::ClipperBase::AddPaths((uint64_t)&v141 + v9, (uint64_t *)objc_msgSend(v10, "maskPaths"), 0, 1);

      }
      else
      {
        memset(&v139, 0, sizeof(v139));
        CGAffineTransformMakeScale(&t1, 0.01, 0.01);
        t2 = *(CGAffineTransform *)v128;
        CGAffineTransformConcat(&v138, &t1, &t2);
        CGAffineTransformMakeScale(&v135, 100.0, 100.0);
        CGAffineTransformConcat(&v139, &v138, &v135);
        objc_msgSend(v8, "_strokeMask");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (uint64_t *)objc_msgSend(v11, "maskPaths");

        v13 = *v12;
        v106 = v12[1];
        v108 = v8;
        if (*v12 != v106)
        {
          do
          {
            memset(&v120, 0, 24);
            std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(&v120, *(const void **)v13, *(_QWORD *)(v13 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v13 + 8) - *(_QWORD *)v13) >> 3));
            v133 = 0;
            __p = 0;
            v134 = 0;
            std::vector<ClipperLib::IntPoint>::reserve(&__p, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&v120.b - *(_QWORD *)&v120.a) >> 3));
            a = v120.a;
            b = v120.b;
            if (*(_QWORD *)&v120.a != *(_QWORD *)&v120.b)
            {
              v16 = v133;
              do
              {
                v18 = *(_DWORD *)(*(_QWORD *)&a + 16);
                v17 = *(_DWORD *)(*(_QWORD *)&a + 20);
                v19 = vcvtq_s64_f64(vaddq_f64(*(float64x2_t *)&v139.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v139.c, (double)*(uint64_t *)(*(_QWORD *)&a + 8)), *(float64x2_t *)&v139.a, (double)(uint64_t)**(_QWORD **)&a)));
                if (v16 >= v134)
                {
                  point = (CGPoint)v19;
                  v20 = (int64x2_t *)__p;
                  v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)v16 - (_BYTE *)__p) >> 3);
                  v22 = v21 + 1;
                  if (v21 + 1 > 0xAAAAAAAAAAAAAAALL)
                    std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                  if (0x5555555555555556 * (((char *)v134 - (_BYTE *)__p) >> 3) > v22)
                    v22 = 0x5555555555555556 * (((char *)v134 - (_BYTE *)__p) >> 3);
                  if (0xAAAAAAAAAAAAAAABLL * (((char *)v134 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
                    v23 = 0xAAAAAAAAAAAAAAALL;
                  else
                    v23 = v22;
                  if (v23)
                  {
                    v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v134, v23);
                    v16 = v133;
                    v20 = (int64x2_t *)__p;
                  }
                  else
                  {
                    v24 = 0;
                  }
                  v25 = &v24[24 * v21];
                  *(CGPoint *)v25 = point;
                  *((_DWORD *)v25 + 4) = v18;
                  *((_DWORD *)v25 + 5) = v17;
                  v26 = v25;
                  if (v16 != v20)
                  {
                    do
                    {
                      v27 = *(__int128 *)((char *)&v16[-2] + 8);
                      *((_QWORD *)v26 - 1) = v16[-1].i64[1];
                      *(_OWORD *)(v26 - 24) = v27;
                      v26 -= 24;
                      v16 = (int64x2_t *)((char *)v16 - 24);
                    }
                    while (v16 != v20);
                    v20 = (int64x2_t *)__p;
                  }
                  v16 = (int64x2_t *)(v25 + 24);
                  __p = v26;
                  v133 = (int64x2_t *)(v25 + 24);
                  v134 = (int64x2_t *)&v24[24 * v23];
                  if (v20)
                    operator delete(v20);
                }
                else
                {
                  *v16 = v19;
                  v16[1].i32[0] = v18;
                  v16[1].i32[1] = v17;
                  v16 = (int64x2_t *)((char *)v16 + 24);
                }
                v133 = v16;
                *(_QWORD *)&a += 24;
              }
              while (*(_QWORD *)&a != *(_QWORD *)&b);
            }
            v8 = v108;
            ClipperLib::ClipperBase::AddPath((uint64_t)&v141 + (_QWORD)*(v141 - 3), (uint64_t **)&__p, 0, 1);
            if (__p)
            {
              v133 = (int64x2_t *)__p;
              operator delete(__p);
            }
            if (*(_QWORD *)&v120.a)
            {
              v120.b = v120.a;
              operator delete(*(void **)&v120.a);
            }
            v13 += 24;
          }
          while (v13 != v106);
        }
      }

    }
  }
  v133 = 0;
  __p = 0;
  memset(&v128[8], 0, 61);
  v134 = 0;
  *(_QWORD *)v128 = &unk_1E77745E0;
  v129 = 0;
  v131 = 0;
  v130 = 0;
  ClipperLib::Clipper::Execute((uint64_t)&v141, a5, (ClipperLib::PolyTree *)v128, 0, 0);
  if (*(_QWORD *)&v128[40] == *(_QWORD *)&v128[32])
  {
    v103 = 0;
  }
  else
  {
    v28 = objc_msgSend(v111, "count");
    v29 = v28;
    v125 = 0;
    v126 = 0;
    v127 = 0;
    *(_QWORD *)&v139.a = &v125;
    LOBYTE(v139.b) = 0;
    if (v28)
    {
      if (v28 > 0xAAAAAAAAAAAAAAALL)
        std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
      v30 = (char *)operator new(24 * v28);
      v31 = &v30[24 * v29];
      v125 = v30;
      v127 = v31;
      bzero(v30, 24 * ((24 * v29 - 24) / 0x18) + 24);
      v126 = v31;
    }
    v33 = *(uint64_t **)&v128[40];
    v32 = *(uint64_t **)&v128[32];
    if (*(_QWORD *)&v128[32] != *(_QWORD *)&v128[40])
    {
      v109 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
      do
      {
        v34 = 0;
        v35 = 0;
        v36 = *v32;
        pointa = (CGPoint)vdivq_f64(vcvtq_f64_s64(*(int64x2_t *)*(_QWORD *)(*v32 + 8)), v109);
        while (v35 < objc_msgSend(v111, "count", v99))
        {
          objc_msgSend(v111, "objectAtIndexedSubscript:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "_bounds");
          v168 = CGRectInset(v167, -1.0, -1.0);
          x = v168.origin.x;
          y = v168.origin.y;
          width = v168.size.width;
          height = v168.size.height;

          v169.origin.x = x;
          v169.origin.y = y;
          v169.size.width = width;
          v169.size.height = height;
          if (CGRectContainsPoint(v169, pointa))
          {
            v42 = (void **)&v125[v34];
            v43 = *(_QWORD **)&v125[v34 + 8];
            v44 = *(_QWORD *)&v125[v34 + 16];
            if ((unint64_t)v43 >= v44)
            {
              v46 = (char *)*v42;
              v47 = ((char *)v43 - (_BYTE *)*v42) >> 3;
              if ((unint64_t)(v47 + 1) >> 61)
                std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
              v48 = v44 - (_QWORD)v46;
              v49 = (uint64_t)(v44 - (_QWORD)v46) >> 2;
              if (v49 <= v47 + 1)
                v49 = v47 + 1;
              if (v48 >= 0x7FFFFFFFFFFFFFF8)
                v50 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v50 = v49;
              if (v50)
                v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v125[v34 + 16], v50);
              else
                v51 = 0;
              v52 = &v51[8 * v47];
              *(_QWORD *)v52 = v36;
              v45 = v52 + 8;
              v54 = (char *)*v42;
              v53 = (char *)v42[1];
              if (v53 != *v42)
              {
                do
                {
                  v55 = *((_QWORD *)v53 - 1);
                  v53 -= 8;
                  *((_QWORD *)v52 - 1) = v55;
                  v52 -= 8;
                }
                while (v53 != v54);
                v53 = (char *)*v42;
              }
              *v42 = v52;
              v42[1] = v45;
              v42[2] = &v51[8 * v50];
              if (v53)
                operator delete(v53);
            }
            else
            {
              *v43 = v36;
              v45 = v43 + 1;
            }
            v42[1] = v45;
            break;
          }
          ++v35;
          v34 += 24;
        }
        ++v32;
      }
      while (v32 != v33);
    }
    v103 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v126 - v125 >= 1)
    {
      v56 = 0;
      v57 = (v126 - v125) / 0x18uLL;
      if (v57 <= 1)
        v57 = 1;
      v101 = v57;
      while (*(_QWORD *)&v125[24 * v56 + 8] == *(_QWORD *)&v125[24 * v56])
      {
        objc_msgSend(v103, "addObject:", MEMORY[0x1E0C9AA60]);
LABEL_116:
        if (++v56 == v101)
          goto LABEL_117;
      }
      objc_msgSend(v111, "objectAtIndexedSubscript:", v56);
      pointb = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v125;
      v59 = (char **)&v125[24 * v56];
      if (v59[1] - *v59 == 8)
      {
        memset(&v139, 0, 24);
        std::vector<ClipperLib::PolyNode *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<ClipperLib::PolyNode **>,std::__wrap_iter<ClipperLib::PolyNode **>>((void **)&v139, 0, *v59, v59[1], (v59[1] - *v59) >> 3);
        v60 = v139.a;
        if ((uint64_t)(*(_QWORD *)&v139.b - *(_QWORD *)&v139.a) >= 1)
        {
          v61 = 0;
          v62 = (*(_QWORD *)&v139.b - *(_QWORD *)&v139.a) >> 3;
          while (2)
          {
            v63 = *(_QWORD *)(*(_QWORD *)&v60 + 8 * v61);
            for (j = *(_QWORD *)(v63 + 8); j != *(_QWORD *)(v63 + 16); j += 24)
            {
              if (*(float *)(j + 20) > 0.0)
              {
                if (v60 != 0.0)
                {
                  v139.b = v60;
                  operator delete(*(void **)&v60);
                }
                v58 = v125;
                goto LABEL_80;
              }
            }
            std::vector<ClipperLib::PolyNode *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<ClipperLib::PolyNode **>,std::__wrap_iter<ClipperLib::PolyNode **>>((void **)&v139, *(uint64_t *)&v139.b, *(char **)(v63 + 32), *(char **)(v63 + 40), (uint64_t)(*(_QWORD *)(v63 + 40) - *(_QWORD *)(v63 + 32)) >> 3);
            v60 = v139.a;
            v62 += (uint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v139.a + 8 * v61) + 40)
                           - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v139.a + 8 * v61) + 32)) >> 3;
            if (++v61 < v62)
              continue;
            break;
          }
        }
        v166[0] = pointb;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v166, 1, v99);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "addObject:", v65);

        v66 = v139.a;
        if (!*(_QWORD *)&v139.a)
          goto LABEL_115;
        v139.b = v139.a;
      }
      else
      {
LABEL_80:
        v122 = 0;
        *(_QWORD *)v123 = 0;
        v124 = 0;
        std::vector<ClipperLib::PolyNode *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<ClipperLib::PolyNode **>,std::__wrap_iter<ClipperLib::PolyNode **>>(&v122, 0, *(char **)&v58[24 * v56], *(char **)&v58[24 * v56 + 8], (uint64_t)(*(_QWORD *)&v58[24 * v56 + 8] - *(_QWORD *)&v58[24 * v56]) >> 3);
        v107 = *(_QWORD *)v123 - (_QWORD)v122 >= 9uLL && objc_msgSend(pointb, "_shapeType") != 0;
        v110 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if ((uint64_t)(*(_QWORD *)v123 - (_QWORD)v122) >= 1)
        {
          v67 = 0;
          v68 = (*(_QWORD *)v123 - (_QWORD)v122) >> 3;
          v105 = v56;
          do
          {
            v69 = (void *)objc_msgSend(pointb, "copyForSubstroke", v99);
            v70 = objc_alloc_init(PKStrokeMask);
            objc_msgSend(v69, "_setStrokeMask:", v70);
            if (v107)
            {
              objc_msgSend(v69, "_setGroupID:", 0);
              objc_msgSend(v69, "_setShapeType:", 0);
            }
            v71 = -[PKStrokeMask maskPaths](v70, "maskPaths");
            v72 = v71;
            v73 = *((_QWORD *)v122 + v67) + 8;
            v74 = v71[1];
            if (v74 >= v71[2])
            {
              v75 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v71, v73);
            }
            else
            {
              std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v71, v73);
              v75 = v74 + 24;
            }
            v72[1] = v75;
            v76 = *((_QWORD *)v122 + v67);
            v77 = *(uint64_t **)(v76 + 32);
            v78 = *(uint64_t **)(v76 + 40);
            while (v77 != v78)
            {
              v79 = *v77;
              v80 = -[PKStrokeMask maskPaths](v70, "maskPaths");
              v81 = v80;
              v82 = v79 + 8;
              v83 = v80[1];
              if (v83 >= v80[2])
              {
                v84 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v80, v82);
              }
              else
              {
                std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v80, v82);
                v84 = v83 + 24;
              }
              v81[1] = v84;
              std::vector<ClipperLib::PolyNode *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<ClipperLib::PolyNode **>,std::__wrap_iter<ClipperLib::PolyNode **>>(&v122, *(uint64_t *)v123, *(char **)(v79 + 32), *(char **)(v79 + 40), (uint64_t)(*(_QWORD *)(v79 + 40) - *(_QWORD *)(v79 + 32)) >> 3);
              v68 += (uint64_t)(*(_QWORD *)(v79 + 40) - *(_QWORD *)(v79 + 32)) >> 3;
              ++v77;
            }
            -[PKStrokeMask calculateCenterlineSlices:](v70, "calculateCenterlineSlices:", v69);
            v56 = v105;
            v85 = -[PKStrokeMask maskPaths](v70, "maskPaths");
            v86 = *(uint64_t **)v85;
            v87 = *(uint64_t **)(v85 + 8);
            while (v86 != v87)
            {
              v88 = *v86;
              v89 = v86[1];
              while (v88 != v89)
              {
                *(_DWORD *)(v88 + 20) = -1082130432;
                v88 += 24;
              }
              v86 += 3;
            }
            memset(&v139, 0, sizeof(v139));
            if (pointb)
              objc_msgSend(pointb, "_transform");
            v121 = v139;
            if (!CGAffineTransformIsIdentity(&v121))
            {
              memset(&v120, 0, sizeof(v120));
              CGAffineTransformMakeScale(&v117, 0.01, 0.01);
              v116 = v139;
              CGAffineTransformConcat(&v118, &v117, &v116);
              CGAffineTransformMakeScale(&v115, 100.0, 100.0);
              CGAffineTransformConcat(&v119, &v118, &v115);
              CGAffineTransformInvert(&v120, &v119);
              v90 = -[PKStrokeMask maskPaths](v70, "maskPaths");
              v91 = *v90;
              v92 = v90[1];
              if (*v90 != v92)
              {
                v93 = *(float64x2_t *)&v120.a;
                v94 = *(float64x2_t *)&v120.c;
                v95 = *(float64x2_t *)&v120.tx;
                do
                {
                  v96 = *v91;
                  v97 = v91[1];
                  while (v96 != v97)
                  {
                    *v96 = vcvtq_s64_f64(vaddq_f64(v95, vmlaq_n_f64(vmulq_n_f64(v94, (double)v96->i64[1]), v93, (double)v96->i64[0])));
                    v96 = (int64x2_t *)((char *)v96 + 24);
                  }
                  v91 += 3;
                }
                while (v91 != v92);
              }
            }
            objc_msgSend(v110, "addObject:", v69);

            ++v67;
          }
          while (v67 < v68);
        }
        objc_msgSend(v103, "addObject:", v110, v99);

        v66 = *(double *)&v122;
        if (!v122)
          goto LABEL_115;
        *(_QWORD *)v123 = v122;
      }
      operator delete(*(void **)&v66);
LABEL_115:

      goto LABEL_116;
    }
LABEL_117:
    *(_QWORD *)&v139.a = &v125;
    std::vector<std::vector<ClipperLib::PolyNode *>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v139);
  }
  ClipperLib::PolyTree::~PolyTree((ClipperLib::PolyTree *)v128);
  *(_QWORD *)v128 = &__p;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)v128);
  v141 = &off_1E7774540;
  v152 = &off_1E7774588;
  std::__list_imp<long long>::clear(v99);
  if ((_QWORD)v145)
  {
    *((_QWORD *)&v145 + 1) = v145;
    operator delete((void *)v145);
  }
  if (*((_QWORD *)&v143 + 1))
  {
    *(_QWORD *)&v144 = *((_QWORD *)&v143 + 1);
    operator delete(*((void **)&v143 + 1));
  }
  if ((_QWORD)v142)
  {
    *((_QWORD *)&v142 + 1) = v142;
    operator delete((void *)v142);
  }
  ClipperLib::ClipperBase::~ClipperBase(v100);

  return v103;
}

- (CGPath)newPathRepresentationMasked
{
  CGPath *Mutable;
  void *v4;
  uint64_t v5;
  uint64_t **v6;
  uint64_t **i;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  Mutable = CGPathCreateMutable();
  -[PKStroke _strokeMask](self, "_strokeMask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maskPaths");

  v6 = *(uint64_t ***)v5;
  for (i = *(uint64_t ***)(v5 + 8); v6 != i; v6 += 3)
  {
    CGPathMoveToPoint(Mutable, 0, (double)**v6 / 100.0, (double)(*v6)[1] / 100.0);
    v8 = *v6;
    v9 = v6[1];
    while (v8 != v9)
    {
      v10 = *v8;
      v11 = v8[1];
      v8 += 3;
      CGPathAddLineToPoint(Mutable, 0, (double)v10 / 100.0, (double)v11 / 100.0);
    }
    CGPathCloseSubpath(Mutable);
  }
  return Mutable;
}

- (CGPath)newSelectionPathRepresentationWithPointsCountMasked:(int *)a3
{
  CGPath *Mutable;
  uint64_t *v6;
  void *v12;
  uint64_t **v13;
  uint64_t **v14;
  int v15;
  uint64_t *v16;
  uint64_t *v17;
  _OWORD v19[11];
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[29];

  Mutable = CGPathCreateMutable();
  v6 = (uint64_t *)operator new();
  v6[1] = 0;
  v6[2] = 0;
  *v6 = 0;
  __asm { FMOV            V1.2S, #-1.0 }
  v20 = _D1;
  v21 = &unk_1E77745C0;
  v22 = 0u;
  v23 = 0u;
  memset(v24, 0, sizeof(v24));
  v19[10] = xmmword_1BE4FD2B0;
  -[PKStroke _strokeMask](self, "_strokeMask", 0x4000000000000000, 0x3FD0000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ClipperLib::ClipperOffset::AddPaths((uint64_t)v19, (uint64_t *)objc_msgSend(v12, "maskPaths"), 1, 0);

  ClipperLib::ClipperOffset::Execute((uint64_t *)v19, v6, 1500.0);
  v13 = (uint64_t **)*v6;
  v14 = (uint64_t **)v6[1];
  if ((uint64_t **)*v6 == v14)
  {
    v15 = 0;
  }
  else
  {
    v15 = 0;
    do
    {
      CGPathMoveToPoint(Mutable, 0, (double)**v13 / 100.0, (double)(*v13)[1] / 100.0);
      v16 = *v13;
      v17 = v13[1];
      while (v16 != v17)
      {
        CGPathAddLineToPoint(Mutable, 0, (double)*v16 / 100.0, (double)v16[1] / 100.0);
        ++v15;
        v16 += 3;
      }
      CGPathCloseSubpath(Mutable);
      v13 += 3;
    }
    while (v13 != v14);
  }
  *a3 = v15;
  ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)v19);
  return Mutable;
}

- (void)debugRenderMasked:(CGContext *)a3
{
  CGPath *Mutable;
  void *v6;
  uint64_t v7;
  uint64_t **v8;
  uint64_t **i;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double *v16;
  double *v17;
  uint64_t v18;
  double v19;
  double v20;
  const CGPath *v21;
  _QWORD v22[7];
  _QWORD v23[3];
  char v24;
  CGAffineTransform transform;

  CGContextSetRGBStrokeColor(a3, 0.0, 0.97, 0.0, 1.0);
  Mutable = CGPathCreateMutable();
  -[PKStroke _strokeMask](self, "_strokeMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maskPaths");

  v8 = *(uint64_t ***)v7;
  for (i = *(uint64_t ***)(v7 + 8); v8 != i; v8 += 3)
  {
    CGPathMoveToPoint(Mutable, 0, (double)**v8 / 100.0, (double)(*v8)[1] / 100.0);
    v10 = *v8;
    v11 = v8[1];
    while (v10 != v11)
    {
      v12 = *v10;
      v13 = v10[1];
      v10 += 3;
      CGPathAddLineToPoint(Mutable, 0, (double)v12 / 100.0, (double)v13 / 100.0);
    }
    CGPathCloseSubpath(Mutable);
  }
  CGContextSaveGState(a3);
  -[PKStroke _transform](self, "_transform");
  CGContextConcatCTM(a3, &transform);
  CGContextAddPath(a3, Mutable);
  CGContextStrokePath(a3);
  CGContextRestoreGState(a3);
  CGPathRelease(Mutable);
  CGContextSetRGBStrokeColor(a3, 1.0, 0.578, 0.0, 1.0);
  -[PKStroke _strokeMask](self, "_strokeMask");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "centerlineSlices");

  v17 = *(double **)v15;
  v16 = *(double **)(v15 + 8);
  if (v17 != v16)
  {
    v18 = MEMORY[0x1E0C809B0];
    do
    {
      v19 = *v17;
      v20 = v17[1];
      v21 = CGPathCreateMutable();
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2020000000;
      v24 = 1;
      v22[0] = v18;
      v22[1] = 3221225472;
      v22[2] = __39__PKStroke_Slicing__debugRenderMasked___block_invoke;
      v22[3] = &unk_1E777A920;
      v22[4] = self;
      v22[5] = v23;
      v22[6] = v21;
      -[PKStroke interpolatePointDataWithStep:from:to:usingBlock:](self, "interpolatePointDataWithStep:from:to:usingBlock:", v22, 0.1, v19, v20);
      CGContextAddPath(a3, v21);
      CGContextStrokePath(a3);
      CGPathRelease(v21);
      _Block_object_dispose(v23, 8);
      v17 += 2;
    }
    while (v17 != v16);
  }
}

void __39__PKStroke_Slicing__debugRenderMasked___block_invoke(_QWORD *a1, double a2, double a3)
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPath *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v6 = (void *)a1[4];
  if (v6)
  {
    objc_msgSend(v6, "_transform");
    v8 = v17;
    v7 = v16;
    v9 = v19;
    v10 = v18;
    v11 = v21;
    v12 = v20;
  }
  else
  {
    v11 = 0.0;
    v9 = 0.0;
    v8 = 0.0;
    v12 = 0.0;
    v10 = 0.0;
    v7 = 0.0;
  }
  v13 = v12 + a3 * v10 + v7 * a2;
  v14 = v11 + a3 * v9 + v8 * a2;
  v15 = (CGPath *)a1[6];
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    CGPathMoveToPoint(v15, 0, v13, v14);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
  else
  {
    CGPathAddLineToPoint(v15, 0, v13, v14);
  }
}

- (void)generateMask
{
  void *v3;
  PKStrokeMask *v4;
  void *v5;
  PKStrokeMask *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD v11[4];
  PKStrokeMask *v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD aBlock[5];
  _QWORD v18[6];
  void *__p;
  void *v20;
  uint64_t v21;
  _QWORD v22[6];
  void *v23;
  void *v24;
  uint64_t v25;

  -[PKStroke _strokeMask](self, "_strokeMask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(PKStrokeMask);
    -[PKStroke _setStrokeMask:](self, "_setStrokeMask:", v4);
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x4812000000;
    v22[3] = __Block_byref_object_copy__7_0;
    v22[4] = __Block_byref_object_dispose__8_0;
    v22[5] = "";
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x4812000000;
    v18[3] = __Block_byref_object_copy__7_0;
    v18[4] = __Block_byref_object_dispose__8_0;
    v18[5] = "";
    __p = 0;
    v20 = 0;
    v21 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __33__PKStroke_Slicing__generateMask__block_invoke_11;
    aBlock[3] = &unk_1E777A968;
    aBlock[4] = v22;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__PKStroke_Slicing__generateMask__block_invoke_2;
    v11[3] = &unk_1E777A990;
    v15 = v22;
    v16 = v18;
    v5 = _Block_copy(aBlock);
    v13 = v5;
    v14 = &__block_literal_global_45;
    v6 = v4;
    v12 = v6;
    -[PKStroke ink](self, "ink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStroke _inkTransform](self, "_inkTransform");
    -[PKStroke path](self, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKStroke _consumeRenderVertexes:ink:inkTransform:strokePath:](PKStroke, "_consumeRenderVertexes:ink:inkTransform:strokePath:", v11, v7, &v10, v8);

    v9 = -[PKStrokeMask maskPaths](v6, "maskPaths");
    ClipperLib::SimplifyPolygons(v9, v9, 1);

    _Block_object_dispose(v18, 8);
    if (__p)
    {
      v20 = __p;
      operator delete(__p);
    }
    _Block_object_dispose(v22, 8);
    if (v23)
    {
      v24 = v23;
      operator delete(v23);
    }

  }
}

double __33__PKStroke_Slicing__generateMask__block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double result;

  v2 = *a2;
  v3 = a2[1] - *a2;
  if ((uint64_t)v3 < 1)
  {
    result = 0.0;
  }
  else
  {
    v4 = v3 >> 4;
    if (v3 >> 4 <= 1)
      v5 = 1;
    else
      v5 = v3 >> 4;
    v6 = v2 + 16 * v4;
    v8 = *(double *)(v6 - 16);
    v7 = *(double *)(v6 - 8);
    v9 = (double *)(v2 + 8);
    v10 = 0.0;
    do
    {
      v12 = *(v9 - 1);
      v11 = *v9;
      v10 = v10 + v12 * v7 - *v9 * v8;
      v9 += 2;
      v8 = v12;
      v7 = v11;
      --v5;
    }
    while (v5);
    result = v10 * 0.5;
  }
  if (result < 0.0)
    return -result;
  return result;
}

void __33__PKStroke_Slicing__generateMask__block_invoke_11(uint64_t a1, double a2, double a3)
{
  _QWORD *v5;
  double *v6;
  unint64_t v7;
  double *v8;
  double *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  double *v15;
  char *v16;

  v5 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = (double *)v5[7];
  v7 = v5[8];
  if ((unint64_t)v6 >= v7)
  {
    v9 = (double *)v5[6];
    v10 = ((char *)v6 - (char *)v9) >> 4;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60)
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    v12 = v7 - (_QWORD)v9;
    if (v12 >> 3 > v11)
      v11 = v12 >> 3;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)(v5 + 8), v13);
      v9 = (double *)v5[6];
      v6 = (double *)v5[7];
    }
    else
    {
      v14 = 0;
    }
    v15 = (double *)&v14[16 * v10];
    v16 = &v14[16 * v13];
    *v15 = a2;
    v15[1] = a3;
    v8 = v15 + 2;
    if (v6 != v9)
    {
      do
      {
        *((_OWORD *)v15 - 1) = *((_OWORD *)v6 - 1);
        v15 -= 2;
        v6 -= 2;
      }
      while (v6 != v9);
      v9 = (double *)v5[6];
    }
    v5[6] = v15;
    v5[7] = v8;
    v5[8] = v16;
    if (v9)
      operator delete(v9);
  }
  else
  {
    *v6 = a2;
    v6[1] = a3;
    v8 = v6 + 2;
  }
  v5[7] = v8;
}

void __33__PKStroke_Slicing__generateMask__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v5)(id, uint64_t, _QWORD);
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  char *v16;
  unint64_t v17;
  _QWORD *v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  _QWORD *v27;
  char *v28;
  unint64_t v29;
  _QWORD *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  double *v37;
  double *v38;
  double v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  _QWORD *v43;
  double *v44;
  unint64_t v45;
  _QWORD *v46;
  double *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  void **v58;
  double v59;
  uint64_t v60;
  BOOL v61;
  _UNKNOWN **v62;
  uint64_t v63;
  _UNKNOWN **v64;
  float64x2_t *v65;
  float64x2_t *v66;
  char *v67;
  int32x2_t v68;
  __int128 v69;
  __int128 v70;
  char *v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  __int128 v78;
  uint64_t *v79;
  uint64_t *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  float64x2_t v85;
  void *v86;
  char *v87;
  char *v88;
  void *__p;
  float64x2_t *v90;
  uint64_t v91;

  v5 = a3;
  v83 = a2 - 1;
  if (a2 >= 1)
  {
    v6 = 0;
    v7 = &off_1E776F000;
    v85 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    do
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 48);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 56) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 48);
      v5[2](v5, v6, *(_QWORD *)(a1 + 40));
      if (v6 >= v83)
        goto LABEL_64;
      v10 = v8;
      v11 = v9;
      v12 = ((double (*)(id, uint64_t, _QWORD))v5[2])(v5, v6 + 1, *(_QWORD *)(a1 + 40));
      v14 = v13;
      v15 = *(_QWORD **)(*(_QWORD *)(a1 + 64) + 8);
      v16 = (char *)v15[7];
      v17 = v15[8];
      if ((unint64_t)v16 >= v17)
      {
        v19 = (char *)v15[6];
        v20 = (v16 - v19) >> 4;
        v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 60)
          goto LABEL_95;
        v22 = v17 - (_QWORD)v19;
        if (v22 >> 3 > v21)
          v21 = v22 >> 3;
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
          v23 = 0xFFFFFFFFFFFFFFFLL;
        else
          v23 = v21;
        if (v23)
        {
          v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)(v15 + 8), v23);
          v19 = (char *)v15[6];
          v16 = (char *)v15[7];
        }
        else
        {
          v24 = 0;
        }
        v25 = &v24[16 * v20];
        *(_QWORD *)v25 = v10;
        *((_QWORD *)v25 + 1) = v11;
        v26 = v25;
        if (v16 != v19)
        {
          do
          {
            *((_OWORD *)v26 - 1) = *((_OWORD *)v16 - 1);
            v26 -= 16;
            v16 -= 16;
          }
          while (v16 != v19);
          v19 = (char *)v15[6];
        }
        v18 = v25 + 16;
        v15[6] = v26;
        v15[7] = v25 + 16;
        v15[8] = &v24[16 * v23];
        if (v19)
          operator delete(v19);
      }
      else
      {
        *(_QWORD *)v16 = v10;
        *((_QWORD *)v16 + 1) = v11;
        v18 = v16 + 16;
      }
      v15[7] = v18;
      v27 = *(_QWORD **)(*(_QWORD *)(a1 + 64) + 8);
      v28 = (char *)v27[7];
      v29 = v27[8];
      if ((unint64_t)v28 >= v29)
      {
        v31 = (char *)v27[6];
        v32 = (v28 - v31) >> 4;
        v33 = v32 + 1;
        if ((unint64_t)(v32 + 1) >> 60)
LABEL_95:
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        v34 = v29 - (_QWORD)v31;
        if (v34 >> 3 > v33)
          v33 = v34 >> 3;
        if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0)
          v35 = 0xFFFFFFFFFFFFFFFLL;
        else
          v35 = v33;
        if (v35)
        {
          v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)(v27 + 8), v35);
          v31 = (char *)v27[6];
          v28 = (char *)v27[7];
        }
        else
        {
          v36 = 0;
        }
        v37 = (double *)&v36[16 * v32];
        *v37 = v12;
        *((_QWORD *)v37 + 1) = v14;
        v38 = v37;
        if (v28 != v31)
        {
          do
          {
            *((_OWORD *)v38 - 1) = *((_OWORD *)v28 - 1);
            v38 -= 2;
            v28 -= 16;
          }
          while (v28 != v31);
          v31 = (char *)v27[6];
        }
        v30 = v37 + 2;
        v27[6] = v38;
        v27[7] = v37 + 2;
        v27[8] = &v36[16 * v35];
        if (v31)
          operator delete(v31);
      }
      else
      {
        *(double *)v28 = v12;
        *((_QWORD *)v28 + 1) = v14;
        v30 = v28 + 16;
      }
      v27[7] = v30;
      if (v6 + 2 >= a2)
      {
LABEL_64:
        v60 = v6;
      }
      else
      {
        do
        {
          v39 = ((double (*)(void (**)(id, uint64_t, _QWORD)))v5[2])(v5);
          v41 = v39;
          v42 = v40;
          v43 = *(_QWORD **)(*(_QWORD *)(a1 + 64) + 8);
          v44 = (double *)v43[7];
          v45 = v43[8];
          if ((unint64_t)v44 >= v45)
          {
            v47 = (double *)v43[6];
            v48 = ((char *)v44 - (char *)v47) >> 4;
            v49 = v48 + 1;
            if ((unint64_t)(v48 + 1) >> 60)
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            v50 = v45 - (_QWORD)v47;
            if (v50 >> 3 > v49)
              v49 = v50 >> 3;
            if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF0)
              v51 = 0xFFFFFFFFFFFFFFFLL;
            else
              v51 = v49;
            if (v51)
            {
              v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)(v43 + 8), v51);
              v47 = (double *)v43[6];
              v44 = (double *)v43[7];
            }
            else
            {
              v52 = 0;
            }
            v53 = &v52[16 * v48];
            *(double *)v53 = v41;
            *((_QWORD *)v53 + 1) = v42;
            v54 = v53;
            if (v44 != v47)
            {
              do
              {
                *((_OWORD *)v54 - 1) = *((_OWORD *)v44 - 1);
                v54 -= 16;
                v44 -= 2;
              }
              while (v44 != v47);
              v47 = (double *)v43[6];
            }
            v46 = v53 + 16;
            v43[6] = v54;
            v43[7] = v53 + 16;
            v43[8] = &v52[16 * v51];
            if (v47)
              operator delete(v47);
          }
          else
          {
            *v44 = v39;
            *((_QWORD *)v44 + 1) = v40;
            v46 = v44 + 2;
          }
          v43[7] = v46;
          v90 = 0;
          v91 = 0;
          __p = 0;
          v55 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v56 = *(char **)(v55 + 48);
          v57 = *(_QWORD *)(v55 + 56);
          v58 = (void **)(v55 + 48);
          if ((unint64_t)(v57 - (_QWORD)v56) < 0x31)
          {
            if (&__p != v58)
              std::vector<CGPoint>::__assign_with_size[abi:ne180100]<CGPoint*,CGPoint*>((char *)&__p, v56, v57, (v57 - (uint64_t)v56) >> 4);
          }
          else
          {
            objc_msgSend(v7[303], "convexHull:forPoints:", &__p, v58);
          }
          v59 = (*(double (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          if (__p)
          {
            v90 = (float64x2_t *)__p;
            operator delete(__p);
          }
          v60 = v6 + 1;
          v61 = v59 <= 10.0 && v6 + 3 < a2;
          ++v6;
        }
        while (v61);
      }
      v62 = v7;
      v63 = a2;
      v90 = 0;
      v91 = 0;
      __p = 0;
      v64 = v62;
      objc_msgSend(v62[303], "convexHull:forPoints:", &__p, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48, v83);
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v65 = (float64x2_t *)__p;
      v66 = v90;
      if (__p != v90)
      {
        v67 = 0;
        do
        {
          v68 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(*v65, v85)));
          *(_QWORD *)&v69 = v68.i32[0];
          *((_QWORD *)&v69 + 1) = v68.i32[1];
          v70 = v69;
          if (v67 >= v88)
          {
            v84 = v70;
            v71 = (char *)v86;
            v72 = 0xAAAAAAAAAAAAAAABLL * ((v67 - (_BYTE *)v86) >> 3);
            v73 = v72 + 1;
            if (v72 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((v88 - (_BYTE *)v86) >> 3) > v73)
              v73 = 0x5555555555555556 * ((v88 - (_BYTE *)v86) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((v88 - (_BYTE *)v86) >> 3) >= 0x555555555555555)
              v74 = 0xAAAAAAAAAAAAAAALL;
            else
              v74 = v73;
            if (v74)
            {
              v75 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v88, v74);
              v71 = (char *)v86;
              v67 = v87;
            }
            else
            {
              v75 = 0;
            }
            v76 = &v75[24 * v72];
            *(_OWORD *)v76 = v84;
            *((_QWORD *)v76 + 2) = 0xBF80000000000000;
            v77 = v76;
            if (v67 != v71)
            {
              do
              {
                v78 = *(_OWORD *)(v67 - 24);
                *((_QWORD *)v77 - 1) = *((_QWORD *)v67 - 1);
                *(_OWORD *)(v77 - 24) = v78;
                v77 -= 24;
                v67 -= 24;
              }
              while (v67 != v71);
              v71 = (char *)v86;
            }
            v67 = v76 + 24;
            v86 = v77;
            v87 = v76 + 24;
            v88 = &v75[24 * v74];
            if (v71)
              operator delete(v71);
          }
          else
          {
            *(_OWORD *)v67 = v70;
            *((_QWORD *)v67 + 2) = 0xBF80000000000000;
            v67 += 24;
          }
          v87 = v67;
          ++v65;
        }
        while (v65 != v66);
      }
      v79 = (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "maskPaths");
      v80 = v79;
      v81 = v79[1];
      if (v81 >= v79[2])
      {
        v82 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v79, (uint64_t)&v86);
      }
      else
      {
        std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v79, (uint64_t)&v86);
        v82 = v81 + 24;
      }
      a2 = v63;
      v80[1] = v82;
      v7 = v64;
      if (v86)
      {
        v87 = (char *)v86;
        operator delete(v86);
      }
      if (__p)
      {
        v90 = (float64x2_t *)__p;
        operator delete(__p);
      }
      v6 = v60 + 1;
    }
    while (v60 + 1 < a2);
  }

}

- (BOOL)intersectsPointMasked:(CGPoint)a3
{
  return -[PKStroke intersectsPointMasked:boundsOutset:minimumStrokeThreshold:](self, "intersectsPointMasked:boundsOutset:minimumStrokeThreshold:", a3.x, a3.y, 10.0, 0.0);
}

- (BOOL)intersectsPointMasked:(CGPoint)a3 boundsOutset:(double)a4 minimumStrokeThreshold:(double)a5
{
  int32x2_t v7;
  __int128 v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  double v15;
  double v16;
  __int128 v17;
  unint64_t v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  uint64_t (**v21)(ClipperLib::Clipper *__hidden);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 __p;
  uint64_t v26;
  _QWORD v27[4];
  char v28;
  char v29;
  char v30;
  uint64_t v31;
  void (**v32)(ClipperLib::Clipper *__hidden);
  __int128 v33;
  __int128 v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CGPoint v46;
  CGRect v47;
  CGRect v48;

  -[PKStroke _bounds](self, "_bounds");
  v48 = CGRectInset(v47, -a4, -a4);
  v46.y = v15;
  v46.x = v16;
  if (CGRectContainsPoint(v48, v46))
  {
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v33 = 0u;
    v34 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    __p = 0u;
    v21 = &off_1E7774540;
    v26 = 0;
    v27[0] = v27;
    v27[1] = v27;
    v27[2] = 0;
    v28 = 0;
    v35 = 0;
    v29 = 0;
    v30 = 0;
    v39 = 0;
    v31 = 0;
    v32 = &off_1E7774588;
    memset(&v20, 0, sizeof(v20));
    -[PKStroke _transform](self, "_transform");
    CGAffineTransformInvert(&v20, &v19);
    v7 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(vaddq_f64(*(float64x2_t *)&v20.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v20.c, v15), *(float64x2_t *)&v20.a, v16)), (float64x2_t)vdupq_n_s64(0x4059000000000000uLL))));
    *(_QWORD *)&v8 = v7.i32[0];
    *((_QWORD *)&v8 + 1) = v7.i32[1];
    v17 = v8;
    v18 = 0xBF80000000000000;
    -[PKStroke _strokeMask](self, "_strokeMask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (uint64_t *)objc_msgSend(v9, "maskPaths");

    v11 = *v10;
    v12 = v10[1];
    if (*v10 == v12)
    {
      v13 = 0;
    }
    else
    {
      v13 = 0;
      do
      {
        v13 ^= ClipperLib::PointInPolygon(&v17, v11) != 0;
        v11 += 24;
      }
      while (v11 != v12);
    }
    v21 = &off_1E7774540;
    v32 = &off_1E7774588;
    std::__list_imp<long long>::clear(v27);
    if ((_QWORD)__p)
    {
      *((_QWORD *)&__p + 1) = __p;
      operator delete((void *)__p);
    }
    if (*((_QWORD *)&v23 + 1))
    {
      *(_QWORD *)&v24 = *((_QWORD *)&v23 + 1);
      operator delete(*((void **)&v23 + 1));
    }
    if ((_QWORD)v22)
    {
      *((_QWORD *)&v22 + 1) = v22;
      operator delete((void *)v22);
    }
    ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v32);
  }
  else
  {
    v13 = 0;
  }
  return v13 & 1;
}

- (BOOL)intersectsLineFromMasked:(CGPoint)a3 to:(CGPoint)a4 minThreshold:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  CGFloat v11;
  CGFloat v12;
  CGFloat width;
  CGFloat height;
  double v15;
  double c;
  double tx;
  double v18;
  double v19;
  double d;
  double a;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  __int128 v50;
  uint64_t v51;
  void *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  double ty;
  double b;
  _QWORD v60[3];
  void *v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[8];
  uint64_t (**v65)(ClipperLib::Clipper *__hidden);
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  _QWORD v71[4];
  char v72;
  char v73;
  char v74;
  uint64_t v75;
  void (**v76)(ClipperLib::Clipper *__hidden);
  __int128 v77;
  __int128 v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *__p;
  char *v91;
  unint64_t v92;
  CGAffineTransform v93;
  CGAffineTransform v94;
  void **v95;
  CGPoint v96;
  CGRect v97;
  CGRect v98;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  -[PKStroke _bounds](self, "_bounds");
  v98 = CGRectInset(v97, -a5, -a5);
  v11 = v98.origin.x;
  v12 = v98.origin.y;
  width = v98.size.width;
  height = v98.size.height;
  v96.x = v9;
  v96.y = v8;
  if (!CGRectContainsPoint(v98, v96) && !DKDLineIntersectsRect(x, y, v9, v8, v11, v12, width, height))
    goto LABEL_57;
  v15 = (y - v8) * (y - v8) + (x - v9) * (x - v9);
  memset(&v94, 0, sizeof(v94));
  -[PKStroke _transform](self, "_transform");
  CGAffineTransformInvert(&v94, &v93);
  c = v94.c;
  tx = v94.tx;
  v18 = v94.tx + v8 * v94.c + v94.a * v9;
  v19 = v94.ty + v8 * v94.d + v94.b * v9;
  if (v15 > 1.0)
  {
    ty = v94.ty;
    b = v94.b;
    d = v94.d;
    a = v94.a;
    __p = 0;
    v91 = 0;
    v92 = 0;
    std::vector<ClipperLib::IntPoint>::reserve(&__p, 2uLL);
    v22 = (int)(v18 * 100.0);
    v23 = (int)(v19 * 100.0);
    v25 = v91;
    v24 = (char *)v92;
    if ((unint64_t)v91 >= v92)
    {
      v32 = (char *)__p;
      v33 = 0xAAAAAAAAAAAAAAABLL * ((v91 - (_BYTE *)__p) >> 3);
      v34 = v33 + 1;
      if (v33 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * ((uint64_t)(v92 - (_QWORD)__p) >> 3) > v34)
        v34 = 0x5555555555555556 * ((uint64_t)(v92 - (_QWORD)__p) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v92 - (_QWORD)__p) >> 3) >= 0x555555555555555)
        v35 = 0xAAAAAAAAAAAAAAALL;
      else
        v35 = v34;
      if (v35)
      {
        v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v92, v35);
        v32 = (char *)__p;
        v25 = v91;
      }
      else
      {
        v36 = 0;
      }
      v37 = &v36[24 * v33];
      v24 = &v36[24 * v35];
      *(_QWORD *)v37 = v22;
      *((_QWORD *)v37 + 1) = v23;
      *((_QWORD *)v37 + 2) = 0xBF80000000000000;
      v26 = v37 + 24;
      if (v25 != v32)
      {
        do
        {
          v38 = *(_OWORD *)(v25 - 24);
          *((_QWORD *)v37 - 1) = *((_QWORD *)v25 - 1);
          *(_OWORD *)(v37 - 24) = v38;
          v37 -= 24;
          v25 -= 24;
        }
        while (v25 != v32);
        v32 = (char *)__p;
      }
      __p = v37;
      v91 = v26;
      v92 = (unint64_t)v24;
      if (v32)
      {
        operator delete(v32);
        v24 = (char *)v92;
      }
    }
    else
    {
      *(_QWORD *)v91 = v22;
      *((_QWORD *)v25 + 1) = v23;
      *((_QWORD *)v25 + 2) = 0xBF80000000000000;
      v26 = v25 + 24;
    }
    v91 = v26;
    v39 = (int)((tx + y * c + a * x) * 100.0);
    v40 = (int)((ty + y * d + b * x) * 100.0);
    if (v26 >= v24)
    {
      v42 = (char *)__p;
      v43 = 0xAAAAAAAAAAAAAAABLL * ((v26 - (_BYTE *)__p) >> 3);
      v44 = v43 + 1;
      if (v43 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      v45 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (_BYTE *)__p) >> 3);
      if (2 * v45 > v44)
        v44 = 2 * v45;
      if (v45 >= 0x555555555555555)
        v46 = 0xAAAAAAAAAAAAAAALL;
      else
        v46 = v44;
      if (v46)
      {
        v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v92, v46);
        v42 = (char *)__p;
        v26 = v91;
      }
      else
      {
        v47 = 0;
      }
      v48 = &v47[24 * v43];
      v49 = &v47[24 * v46];
      *(_QWORD *)v48 = v39;
      *((_QWORD *)v48 + 1) = v40;
      *((_QWORD *)v48 + 2) = 0xBF80000000000000;
      v41 = v48 + 24;
      if (v26 != v42)
      {
        do
        {
          v50 = *(_OWORD *)(v26 - 24);
          *((_QWORD *)v48 - 1) = *((_QWORD *)v26 - 1);
          *(_OWORD *)(v48 - 24) = v50;
          v48 -= 24;
          v26 -= 24;
        }
        while (v26 != v42);
        v42 = (char *)__p;
      }
      __p = v48;
      v91 = v41;
      v92 = (unint64_t)v49;
      if (v42)
        operator delete(v42);
    }
    else
    {
      *(_QWORD *)v26 = v39;
      *((_QWORD *)v26 + 1) = v40;
      *((_QWORD *)v26 + 2) = 0xBF80000000000000;
      v41 = v26 + 24;
    }
    v91 = v41;
    v51 = *((_QWORD *)__p + 1);
    if (v51 == *((_QWORD *)__p + 4))
      *((_QWORD *)__p + 1) = v51 + 1;
    v80 = 0;
    v81 = 0;
    v82 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    v77 = 0u;
    v78 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v65 = &off_1E7774540;
    v70 = 0;
    v71[0] = v71;
    v71[1] = v71;
    v71[2] = 0;
    v72 = 0;
    v79 = 0;
    v73 = 0;
    v74 = 0;
    v83 = 0;
    v75 = 0;
    v76 = &off_1E7774588;
    ClipperLib::ClipperBase::AddPath((uint64_t)&v76, (uint64_t **)&__p, 0, 0);
    -[PKStroke _strokeMask](self, "_strokeMask");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    ClipperLib::ClipperBase::AddPaths((uint64_t)&v76, (uint64_t *)objc_msgSend(v52, "maskPaths"), 1, 1);

    memset(v64, 0, 29);
    v63 = 0u;
    v62 = 0u;
    v61 = &unk_1E77745E0;
    memset(&v64[5], 0, 24);
    memset(v60, 0, sizeof(v60));
    ClipperLib::Clipper::Execute((uint64_t)&v65, 2, (ClipperLib::PolyTree *)&v61, 0, 0);
    if (v64[0] - *((_QWORD *)&v63 + 1) == 8
      && (v53 = *(_QWORD **)(**((_QWORD **)&v63 + 1) + 8),
          *(_QWORD *)(**((_QWORD **)&v63 + 1) + 16) - (_QWORD)v53 == 48))
    {
      v54 = v53[1];
      v55 = *((_QWORD *)__p + 1);
      if (*v53 == *(_QWORD *)__p && v54 == v55
        || (v56 = 0, v53[3] == *(_QWORD *)__p)
        && v53[4] == v55
        && (v56 = 0, *v53 == *((_QWORD *)__p + 3))
        && v54 == *((_QWORD *)__p + 4))
      {
        v56 = 1;
      }
    }
    else
    {
      v56 = 0;
    }
    v95 = (void **)v60;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v95);
    ClipperLib::PolyTree::~PolyTree((ClipperLib::PolyTree *)&v61);
    v65 = &off_1E7774540;
    v76 = &off_1E7774588;
    std::__list_imp<long long>::clear(v71);
    if ((_QWORD)v69)
    {
      *((_QWORD *)&v69 + 1) = v69;
      operator delete((void *)v69);
    }
    if (*((_QWORD *)&v67 + 1))
    {
      *(_QWORD *)&v68 = *((_QWORD *)&v67 + 1);
      operator delete(*((void **)&v67 + 1));
    }
    if ((_QWORD)v66)
    {
      *((_QWORD *)&v66 + 1) = v66;
      operator delete((void *)v66);
    }
    ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v76);
    if (__p)
    {
      v91 = (char *)__p;
      operator delete(__p);
    }
    if ((v56 & 1) == 0)
    {
      v31 = 1;
      return v31 & 1;
    }
    goto LABEL_57;
  }
  v65 = (uint64_t (**)(ClipperLib::Clipper *__hidden))(int)(v18 * 100.0);
  *(_QWORD *)&v66 = (int)(v19 * 100.0);
  *((_QWORD *)&v66 + 1) = 0xBF80000000000000;
  -[PKStroke _strokeMask](self, "_strokeMask");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (uint64_t *)objc_msgSend(v27, "maskPaths");

  v29 = *v28;
  v30 = v28[1];
  if (v29 == v30)
  {
LABEL_57:
    v31 = 0;
    return v31 & 1;
  }
  v31 = 0;
  do
  {
    v31 ^= ClipperLib::PointInPolygon(&v65, v29) != 0;
    v29 += 24;
  }
  while (v29 != v30);
  return v31 & 1;
}

- (BOOL)intersectsClosedStrokeMasked:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  uint64_t v17;
  uint64_t **v18;
  uint64_t v19;
  __n128 (*v20)(__n128 *, __n128 *);
  void (*v21)(uint64_t);
  const char *v22;
  void *__p;
  void *v24;
  uint64_t v25;
  uint64_t (**v26)(ClipperLib::Clipper *__hidden);
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _QWORD v32[4];
  char v33;
  char v34;
  char v35;
  uint64_t v36;
  void (**v37)(ClipperLib::Clipper *__hidden);
  __int128 v38;
  __int128 v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void **v51;

  v4 = a3;
  v41 = 0;
  v42 = 0;
  v43 = 0;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v50 = 0;
  v49 = 0;
  v38 = 0u;
  v39 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = &off_1E7774540;
  v31 = 0;
  v32[0] = v32;
  v32[1] = v32;
  v32[2] = 0;
  v33 = 0;
  v40 = 0;
  v34 = 0;
  v35 = 0;
  v44 = 0;
  v36 = 0;
  v37 = &off_1E7774588;
  v17 = 0;
  v18 = (uint64_t **)&v17;
  v19 = 0x4812000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__16;
  v22 = "";
  __p = 0;
  v24 = 0;
  v25 = 0;
  std::vector<ClipperLib::IntPoint>::reserve(&__p, objc_msgSend(v4, "_pointsCount"));
  memset(&v16, 0, sizeof(v16));
  -[PKStroke _transform](self, "_transform");
  CGAffineTransformInvert(&v16, &v15);
  v13[1] = 3221225472;
  v14 = v16;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __50__PKStroke_Slicing__intersectsClosedStrokeMasked___block_invoke;
  v13[3] = &unk_1E777A9B8;
  v13[4] = &v17;
  objc_msgSend(v4, "interpolatePointDataWithStep:usingBlock:", v13, 1.0);
  ClipperLib::ClipperBase::AddPath((uint64_t)&v26 + (_QWORD)*(v26 - 3), v18 + 6, 0, 1);
  v5 = (uint64_t)*(v26 - 3);
  -[PKStroke _strokeMask](self, "_strokeMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v26 + v5, (uint64_t *)objc_msgSend(v6, "maskPaths"), 1, 1);

  v10 = 0;
  v11 = 0;
  v12 = 0;
  ClipperLib::Clipper::Execute((uint64_t)&v26, 0, &v10, 0, 0);
  v8 = v10;
  v7 = v11;
  v51 = (void **)&v10;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v51);
  _Block_object_dispose(&v17, 8);
  if (__p)
  {
    v24 = __p;
    operator delete(__p);
  }
  v26 = &off_1E7774540;
  v37 = &off_1E7774588;
  std::__list_imp<long long>::clear(v32);
  if ((_QWORD)v30)
  {
    *((_QWORD *)&v30 + 1) = v30;
    operator delete((void *)v30);
  }
  if (*((_QWORD *)&v28 + 1))
  {
    *(_QWORD *)&v29 = *((_QWORD *)&v28 + 1);
    operator delete(*((void **)&v28 + 1));
  }
  if ((_QWORD)v27)
  {
    *((_QWORD *)&v27 + 1) = v27;
    operator delete((void *)v27);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v37);

  return v7 != v8;
}

void __50__PKStroke_Slicing__intersectsClosedStrokeMasked___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  _QWORD *v4;
  int32x2_t v5;
  __int128 v6;
  __int128 v7;
  float v8;
  char *v9;
  unint64_t v10;
  char *v11;
  char *v12;
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

  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(vaddq_f64(*(float64x2_t *)(a1 + 72), vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 56), a3), *(float64x2_t *)(a1 + 40), a2)), (float64x2_t)vdupq_n_s64(0x4059000000000000uLL))));
  *(_QWORD *)&v6 = v5.i32[0];
  *((_QWORD *)&v6 + 1) = v5.i32[1];
  v7 = v6;
  v8 = a4;
  v9 = (char *)v4[7];
  v10 = v4[8];
  if ((unint64_t)v9 >= v10)
  {
    v12 = (char *)v4[6];
    v13 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v12) >> 3);
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
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)(v4 + 8), v16);
      v7 = v22;
      v18 = v17;
      v12 = (char *)v4[6];
      v9 = (char *)v4[7];
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
        v21 = *(_OWORD *)(v9 - 24);
        *((_QWORD *)v19 - 1) = *((_QWORD *)v9 - 1);
        *(_OWORD *)(v19 - 24) = v21;
        v19 -= 24;
        v9 -= 24;
      }
      while (v9 != v12);
      v12 = (char *)v4[6];
    }
    v4[6] = v19;
    v4[7] = v11;
    v4[8] = v20;
    if (v12)
      operator delete(v12);
  }
  else
  {
    *(_OWORD *)v9 = v7;
    *((float *)v9 + 4) = v8;
    *((_DWORD *)v9 + 5) = -1082130432;
    v11 = v9 + 24;
  }
  v4[7] = v11;
}

- (BOOL)intersectsRectMasked:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float64x2_t v16[3];
  void *__p;
  void *v18;
  uint64_t v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t (**v25)(ClipperLib::Clipper *__hidden);
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _QWORD v31[4];
  char v32;
  char v33;
  char v34;
  uint64_t v35;
  void (**v36)(ClipperLib::Clipper *__hidden);
  __int128 v37;
  __int128 v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void **v50;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v40 = 0;
  v41 = 0;
  v42 = 0;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v49 = 0;
  v37 = 0u;
  v38 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v24 = 0;
  v25 = &off_1E7774540;
  v30 = 0;
  v31[0] = v31;
  v31[1] = v31;
  v31[2] = 0;
  v32 = 0;
  v39 = 0;
  v33 = 0;
  v34 = 0;
  v43 = 0;
  v35 = 0;
  v36 = &off_1E7774588;
  v22 = 0;
  v23 = 0;
  std::vector<ClipperLib::IntPoint>::reserve(&v22, 4uLL);
  memset(&v21, 0, sizeof(v21));
  -[PKStroke _transform](self, "_transform");
  CGAffineTransformInvert(&v21, &v20);
  __p = 0;
  v18 = 0;
  v19 = 0;
  v16[0] = *(float64x2_t *)&v21.a;
  v16[1] = *(float64x2_t *)&v21.c;
  v16[2] = *(float64x2_t *)&v21.tx;
  generateRectClipperPath(v16, (uint64_t)&__p, x, y, width, height);
  ClipperLib::ClipperBase::AddPath((uint64_t)&v25 + (_QWORD)*(v25 - 3), (uint64_t **)&v22, 0, 1);
  v8 = (uint64_t)*(v25 - 3);
  -[PKStroke _strokeMask](self, "_strokeMask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v25 + v8, (uint64_t *)objc_msgSend(v9, "maskPaths"), 1, 1);

  v13 = 0;
  v14 = 0;
  v15 = 0;
  ClipperLib::Clipper::Execute((uint64_t)&v25, 0, &v13, 0, 0);
  v11 = v13;
  v10 = v14;
  v50 = (void **)&v13;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v50);
  if (__p)
  {
    v18 = __p;
    operator delete(__p);
  }
  if (v22)
  {
    v23 = v22;
    operator delete(v22);
  }
  v25 = &off_1E7774540;
  v36 = &off_1E7774588;
  std::__list_imp<long long>::clear(v31);
  if ((_QWORD)v29)
  {
    *((_QWORD *)&v29 + 1) = v29;
    operator delete((void *)v29);
  }
  if (*((_QWORD *)&v27 + 1))
  {
    *(_QWORD *)&v28 = *((_QWORD *)&v27 + 1);
    operator delete(*((void **)&v27 + 1));
  }
  if ((_QWORD)v26)
  {
    *((_QWORD *)&v26 + 1) = v26;
    operator delete((void *)v26);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v36);
  return v10 != v11;
}

+ (PKCompressedStrokePoint)_compressStrokePoint:(SEL)a3 withTimestamp:(_PKStrokePoint *)a4
{
  __int128 v5;
  __int128 v6;
  PKCompressedStrokePoint *result;
  PKCompressedStrokePoint v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  double radius2;

  v5 = *(_OWORD *)&a4->force;
  v9 = *(_OWORD *)&a4->aspectRatio;
  v10 = v5;
  v11 = *(_OWORD *)&a4->altitude;
  radius2 = a4->radius2;
  v6 = *(_OWORD *)&a4->location.y;
  *(_OWORD *)&v8.var0.var0 = *(_OWORD *)&a4->timestamp;
  *(_OWORD *)&v8.var3 = v6;
  PKCompressStrokePoint(&v8, a5, (float32x2_t *)retstr);
  return result;
}

+ (_PKStrokePoint)_decompressStrokePoint:(SEL)a3 withTimestamp:(PKCompressedStrokePoint *)a4
{
  __int128 v5;
  _PKStrokePoint *result;
  PKCompressedStrokePoint v7;

  v5 = *(_OWORD *)&a4->var3;
  *(_OWORD *)&v7.var0.var0 = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&v7.var3 = v5;
  PKDecompressStrokePoint(&v7, a5, (uint64_t)retstr);
  return result;
}

@end
