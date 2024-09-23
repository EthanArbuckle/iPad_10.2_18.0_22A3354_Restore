@implementation CHSubstrokePlacement

- (CHSubstrokePlacement)initWithSubstroke:(id)a3
{
  id v5;
  CHSubstrokePlacement *v6;
  CHSubstrokePlacement *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSubstrokePlacement;
  v6 = -[CHSubstrokePlacement init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_substroke, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v7 = (void *)objc_msgSend_allocWithZone_(CHSubstrokePlacement, a2, (uint64_t)a3, v3, v4, v5);
  objc_msgSend_substroke(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_initWithSubstroke_(v7, v14, (uint64_t)v13, v15, v16, v17);

  objc_msgSend_writingOrientation(self, v19, v20, v21, v22, v23);
  objc_msgSend_setWritingOrientation_(v18, v24, v25, v26, v27, v28);
  objc_msgSend_strokeDeviation(self, v29, v30, v31, v32, v33);
  objc_msgSend_setStrokeDeviation_(v18, v34, v35, v36, v37, v38);
  v44 = objc_msgSend_originalWritingDirectionIndex(self, v39, v40, v41, v42, v43);
  objc_msgSend_setOriginalWritingDirectionIndex_(v18, v45, v44, v46, v47, v48);
  objc_msgSend_coalescedCenter(self, v49, v50, v51, v52, v53);
  objc_msgSend_setCoalescedCenter_(v18, v54, v55, v56, v57, v58);
  return v18;
}

- (CGRect)rotatedBounds
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  long double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  long double v36;
  float v37;
  const char *v38;
  __float2 v39;
  __float2 v40;
  __float2 v41;
  __float2 v42;
  __float2 v43;
  uint64_t v44;
  unint64_t v45;
  double cosval;
  double sinval;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double MidY;
  double MidX;
  CGRect v83;
  CGRect v84;
  CGRect result;

  objc_msgSend_substroke(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v7, v8, v9, v10, v11, v12);
  MidX = CGRectGetMidX(v83);
  objc_msgSend_substroke(self, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v18, v19, v20, v21, v22, v23);
  MidY = CGRectGetMidY(v84);

  objc_msgSend_writingOrientation(self, v24, v25, v26, v27, v28);
  v30 = v29;
  objc_msgSend_writingOrientation(self, v31, v32, v33, v34, v35);
  v37 = atan2(v30, v36);
  v43 = __sincosf_stret(v37);
  v44 = 0;
  v45 = 0;
  cosval = v43.__cosval;
  sinval = v43.__sinval;
  v48 = 2.22507386e-308;
  v49 = 1.79769313e308;
  v50 = 1.79769313e308;
  v51 = 2.22507386e-308;
  while (1)
  {
    objc_msgSend_substroke(self, v38, *(_QWORD *)&v39, *(_QWORD *)&v40, *(_QWORD *)&v41, *(_QWORD *)&v42, *(_QWORD *)&MidY);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (_QWORD *)objc_msgSend_convexHull(v52, v53, v54, v55, v56, v57);
    v59 = v58[1] - *v58;

    if (v45 >= v59 >> 4)
      break;
    objc_msgSend_substroke(self, v60, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (double *)(*(_QWORD *)objc_msgSend_convexHull(v65, v66, v67, v68, v69, v70) + v44);
    v72 = *v71;
    v73 = v71[1];

    v74 = MidX + cosval * (v72 - MidX) - (v73 - MidY) * sinval;
    v75 = (v73 - MidY) * cosval;
    v76 = MidY + v75 + sinval * (v72 - MidX);
    if (v74 < v49)
      v49 = MidX + cosval * (v72 - MidX) - (v73 - MidY) * sinval;
    if (v74 > v48)
      v48 = MidX + cosval * (v72 - MidX) - (v73 - MidY) * sinval;
    if (v76 < v50)
      v50 = MidY + v75 + sinval * (v72 - MidX);
    if (v76 > v51)
      v51 = MidY + v75 + sinval * (v72 - MidX);
    ++v45;
    v44 += 16;
  }
  v77 = v48 - v49;
  v78 = v51 - v50;
  v79 = v49;
  v80 = v50;
  result.size.height = v78;
  result.size.width = v77;
  result.origin.y = v80;
  result.origin.x = v79;
  return result;
}

- (CGAffineTransform)orientationTransform
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v9;
  long double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  long double v16;
  long double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGAffineTransform *result;
  __int128 v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGRect v37;
  CGRect v38;

  objc_msgSend_writingOrientation(self, a3, v3, v4, v5, v6);
  v10 = v9;
  objc_msgSend_writingOrientation(self, v11, v12, v13, v14, v15);
  v17 = atan2(v10, v16);
  objc_msgSend_rotatedBounds(self, v18, v19, v20, v21, v22);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  MidX = CGRectGetMidX(v37);
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  MidY = CGRectGetMidY(v38);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  CGAffineTransformMakeTranslation(retstr, MidX, MidY);
  v29 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v35.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v35.c = v29;
  *(_OWORD *)&v35.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformRotate(&v36, &v35, v17);
  v30 = *(_OWORD *)&v36.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v36.a;
  *(_OWORD *)&retstr->c = v30;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v36.tx;
  v31 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v34.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v34.c = v31;
  *(_OWORD *)&v34.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v36, &v34, -MidX, -MidY);
  v33 = *(_OWORD *)&v36.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v36.a;
  *(_OWORD *)&retstr->c = v33;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v36.tx;
  return result;
}

- (CGRect)orientedBounds
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double *v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  double v77;
  double *v78;
  double *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  uint64_t v85;
  char *v86;
  double v87;
  double v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  double v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  double v109;
  double v110;
  double *v111;
  double *v112;
  double v113;
  double v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  char *v119;
  double *v120;
  double *v121;
  double v122;
  double *v123;
  double v124;
  double v125;
  double c;
  double tx;
  CGFloat MaxX;
  double v129;
  double MaxY;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double ty;
  double d;
  double a;
  double b;
  double *v144;
  double *v145;
  double *v146;
  CGAffineTransform v147;
  CGAffineTransform v148;
  CGAffineTransform v149;
  CGRect v150;
  CGRect v151;
  CGRect result;

  memset(&v149, 0, sizeof(v149));
  objc_msgSend_orientationTransform(self, a2, v2, v3, v4, v5);
  v147 = v149;
  memset(&v148, 0, sizeof(v148));
  CGAffineTransformInvert(&v148, &v147);
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  objc_msgSend_rotatedBounds(self, v11, v12, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v20 = (double *)operator new(0x10uLL);
  *(_QWORD *)v20 = v17;
  *((_QWORD *)v20 + 1) = v19;
  v145 = v20 + 2;
  v146 = v20 + 2;
  v144 = v20;
  objc_msgSend_rotatedBounds(self, v21, v22, v23, v24, v25);
  v27 = v26;
  objc_msgSend_rotatedBounds(self, v28, v29, v30, v31, v32);
  v34 = v33;
  objc_msgSend_rotatedBounds(self, v35, v36, v37, v38, v39);
  v46 = v45;
  v47 = v27 + v34;
  v48 = v145;
  if (v145 < v146)
  {
    *v145 = v47;
    *((_QWORD *)v145 + 1) = v45;
    v49 = (unint64_t)(v145 + 2);
    goto LABEL_14;
  }
  v50 = ((char *)v145 - (char *)v144) >> 4;
  v51 = v50 + 1;
  if ((unint64_t)(v50 + 1) >> 60)
    sub_1BE61F930();
  v52 = (char *)v146 - (char *)v144;
  if (v146 - v144 > v51)
    v51 = v52 >> 3;
  if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFF0)
    v53 = 0xFFFFFFFFFFFFFFFLL;
  else
    v53 = v51;
  if (v53)
  {
    if (v53 >> 60)
      sub_1BE61F100();
    v54 = (char *)operator new(16 * v53);
    v55 = (uint64_t)&v54[16 * v50];
    v56 = &v54[16 * v53];
    *(double *)v55 = v47;
    *(_QWORD *)(v55 + 8) = v46;
    v49 = v55 + 16;
    if (v145 == v144)
    {
LABEL_12:
      v144 = (double *)v55;
      v146 = (double *)v56;
      if (!v145)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else
  {
    v55 = 16 * v50;
    v56 = 0;
    *(double *)v55 = v47;
    *(_QWORD *)(v55 + 8) = v45;
    v49 = 16 * v50 + 16;
    if (v145 == v144)
      goto LABEL_12;
  }
  do
  {
    *(_OWORD *)(v55 - 16) = *((_OWORD *)v48 - 1);
    v55 -= 16;
    v48 -= 2;
  }
  while (v48 != v144);
  v48 = v144;
  v144 = (double *)v55;
  v146 = (double *)v56;
  if (v48)
LABEL_13:
    operator delete(v48);
LABEL_14:
  objc_msgSend_rotatedBounds(self, v40, v41, v42, v43, v44);
  v58 = v57;
  objc_msgSend_rotatedBounds(self, v59, v60, v61, v62, v63);
  v65 = v64;
  objc_msgSend_rotatedBounds(self, v66, v67, v68, v69, v70);
  v77 = v65 + v76;
  v78 = (double *)v49;
  if (v49 < (unint64_t)v146)
  {
    *(_QWORD *)v49 = v58;
    *(double *)(v49 + 8) = v77;
    v79 = (double *)(v49 + 16);
    goto LABEL_27;
  }
  v80 = (uint64_t)(v49 - (_QWORD)v144) >> 4;
  v81 = v80 + 1;
  if ((unint64_t)(v80 + 1) >> 60)
    sub_1BE61F930();
  v82 = (char *)v146 - (char *)v144;
  if (v146 - v144 > v81)
    v81 = v82 >> 3;
  if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF0)
    v83 = 0xFFFFFFFFFFFFFFFLL;
  else
    v83 = v81;
  if (v83)
  {
    if (v83 >> 60)
      sub_1BE61F100();
    v84 = (char *)operator new(16 * v83);
    v85 = (uint64_t)&v84[16 * v80];
    v86 = &v84[16 * v83];
    *(_QWORD *)v85 = v58;
    *(double *)(v85 + 8) = v77;
    v79 = (double *)(v85 + 16);
    if (v78 == v144)
    {
LABEL_25:
      v144 = (double *)v85;
      v146 = (double *)v86;
      if (!v78)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else
  {
    v85 = 16 * v80;
    v86 = 0;
    *(_QWORD *)v85 = v58;
    *(double *)(v85 + 8) = v77;
    v79 = (double *)(16 * v80 + 16);
    if (v78 == v144)
      goto LABEL_25;
  }
  do
  {
    *(_OWORD *)(v85 - 16) = *((_OWORD *)v78 - 1);
    v85 -= 16;
    v78 -= 2;
  }
  while (v78 != v144);
  v78 = v144;
  v144 = (double *)v85;
  v146 = (double *)v86;
  if (v78)
LABEL_26:
    operator delete(v78);
LABEL_27:
  objc_msgSend_rotatedBounds(self, v71, v72, v73, v74, v75);
  v88 = v87;
  objc_msgSend_rotatedBounds(self, v89, v90, v91, v92, v93);
  v95 = v94;
  objc_msgSend_rotatedBounds(self, v96, v97, v98, v99, v100);
  v102 = v101;
  objc_msgSend_rotatedBounds(self, v103, v104, v105, v106, v107);
  v108 = v88 + v95;
  v110 = v102 + v109;
  v111 = v79;
  if (v79 >= v146)
  {
    v115 = ((char *)v79 - (char *)v144) >> 4;
    v116 = v115 + 1;
    if ((unint64_t)(v115 + 1) >> 60)
      sub_1BE61F930();
    v117 = (char *)v146 - (char *)v144;
    if (v146 - v144 > v116)
      v116 = v117 >> 3;
    if ((unint64_t)v117 >= 0x7FFFFFFFFFFFFFF0)
      v118 = 0xFFFFFFFFFFFFFFFLL;
    else
      v118 = v116;
    if (v118)
    {
      if (v118 >> 60)
        sub_1BE61F100();
      v119 = (char *)operator new(16 * v118);
    }
    else
    {
      v119 = 0;
    }
    v120 = (double *)&v119[16 * v115];
    *v120 = v108;
    v120[1] = v110;
    v112 = v120 + 2;
    v113 = v7;
    if (v111 != v144)
    {
      do
      {
        *((_OWORD *)v120 - 1) = *((_OWORD *)v111 - 1);
        v120 -= 2;
        v111 -= 2;
      }
      while (v111 != v144);
      v111 = v144;
    }
    v114 = v9;
    v144 = v120;
    if (v111)
      operator delete(v111);
  }
  else
  {
    *v79 = v108;
    v79[1] = v110;
    v112 = v79 + 2;
    v113 = v7;
    v114 = v9;
  }
  v121 = v144;
  if (v144 == v112)
  {
    v121 = v112;
LABEL_68:
    operator delete(v121);
    goto LABEL_69;
  }
  v122 = v144[1];
  v113 = v148.tx + v122 * v148.c + v148.a * *v144 + -0.5;
  v8 = v148.ty + v122 * v148.d + v148.b * *v144 + -0.5;
  v123 = v144 + 2;
  v114 = 1.0;
  v10 = 1.0;
  if (v144 + 2 == v112)
    goto LABEL_68;
  do
  {
    v124 = *v123;
    v125 = v123[1];
    c = v148.c;
    a = v148.a;
    b = v148.b;
    tx = v148.tx;
    ty = v148.ty;
    d = v148.d;
    v150.origin.x = v113;
    v150.origin.y = v8;
    v150.size.width = v10;
    v150.size.height = v114;
    MaxX = CGRectGetMaxX(v150);
    v151.size.height = v114;
    v129 = MaxX;
    v151.origin.x = v113;
    v151.origin.y = v8;
    v151.size.width = v10;
    MaxY = CGRectGetMaxY(v151);
    v131 = tx + v125 * c + a * v124;
    v132 = v125 * d + b * v124;
    v133 = ty + v132;
    if (v113 >= v131)
      v113 = tx + v125 * c + a * v124;
    if (v8 >= v133)
      v8 = ty + v132;
    v134 = v131 - v113;
    if (v129 - v113 <= v134)
      v10 = v134;
    else
      v10 = v129 - v113;
    v135 = MaxY - v8;
    if (v135 <= v133 - v8)
      v114 = v133 - v8;
    else
      v114 = v135;
    v123 += 2;
  }
  while (v123 != v112);
  v121 = v144;
  if (v144)
    goto LABEL_68;
LABEL_69:
  v136 = v113;
  v137 = v8;
  v138 = v10;
  v139 = v114;
  result.size.height = v139;
  result.size.width = v138;
  result.origin.y = v137;
  result.origin.x = v136;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;

  v31 = a3;
  objc_msgSend_encodeObject_forKey_(v31, v4, (uint64_t)self->_substroke, (uint64_t)CFSTR("substroke"), v5, v6);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v7, (uint64_t)&self->_writingOrientation, (uint64_t)"{CGPoint=dd}", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v31, v11, (uint64_t)v10, (uint64_t)CFSTR("writingOrientation"), v12, v13);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v14, (uint64_t)&self->_strokeDeviation, (uint64_t)"{CGPoint=dd}", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v31, v18, (uint64_t)v17, (uint64_t)CFSTR("strokeDeviation"), v19, v20);
  objc_msgSend_encodeInteger_forKey_(v31, v21, self->_originalWritingDirectionIndex, (uint64_t)CFSTR("originalWritingDirectionIndex"), v22, v23);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v24, (uint64_t)&self->_coalescedCenter, (uint64_t)"{CGPoint=dd}", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v31, v28, (uint64_t)v27, (uint64_t)CFSTR("coalescedCenter"), v29, v30);

}

- (CHSubstrokePlacement)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CHSubstrokePlacement *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v64[2];
  double v65[2];
  double v66[2];

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("substroke"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("writingOrientation"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getValue_size_(v14, v15, (uint64_t)v66, 16, v16, v17);
  v18 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, (uint64_t)CFSTR("strokeDeviation"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getValue_size_(v22, v23, (uint64_t)v65, 16, v24, v25);
  v30 = objc_msgSend_decodeIntegerForKey_(v4, v26, (uint64_t)CFSTR("originalWritingDirectionIndex"), v27, v28, v29);
  v31 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("coalescedCenter"), v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getValue_size_(v35, v36, (uint64_t)v64, 16, v37, v38);
  v43 = (CHSubstrokePlacement *)objc_msgSend_initWithSubstroke_(self, v39, (uint64_t)v9, v40, v41, v42);
  objc_msgSend_setWritingOrientation_(v43, v44, v45, v46, v47, v48, v66[0], v66[1]);
  objc_msgSend_setStrokeDeviation_(v43, v49, v50, v51, v52, v53, v65[0], v65[1]);
  objc_msgSend_setOriginalWritingDirectionIndex_(v43, v54, v30, v55, v56, v57);
  objc_msgSend_setCoalescedCenter_(v43, v58, v59, v60, v61, v62, v64[0], v64[1]);

  return v43;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSubstroke)substroke
{
  return self->_substroke;
}

- (CGVector)writingOrientation
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_writingOrientation.dx;
  dy = self->_writingOrientation.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (void)setWritingOrientation:(CGVector)a3
{
  self->_writingOrientation = a3;
}

- (CGVector)strokeDeviation
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_strokeDeviation.dx;
  dy = self->_strokeDeviation.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (void)setStrokeDeviation:(CGVector)a3
{
  self->_strokeDeviation = a3;
}

- (int64_t)originalWritingDirectionIndex
{
  return self->_originalWritingDirectionIndex;
}

- (void)setOriginalWritingDirectionIndex:(int64_t)a3
{
  self->_originalWritingDirectionIndex = a3;
}

- (CGPoint)coalescedCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_coalescedCenter.x;
  y = self->_coalescedCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCoalescedCenter:(CGPoint)a3
{
  self->_coalescedCenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substroke, 0);
}

@end
