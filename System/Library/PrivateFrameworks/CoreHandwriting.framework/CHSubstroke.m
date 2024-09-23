@implementation CHSubstroke

- (CHSubstroke)initWithStrokeIdentifier:(id)a3 bounds:(CGRect)a4 startTimestamp:(double)a5 endTimestamp:(double)a6 convexHull:(const void *)a7 curvature:(double)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  CHSubstroke *v19;
  CHSubstroke *v20;
  objc_super v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CHSubstroke;
  v19 = -[CHSubstroke init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_strokeIdentifier, a3);
    v20->_bounds.origin.x = x;
    v20->_bounds.origin.y = y;
    v20->_bounds.size.width = width;
    v20->_bounds.size.height = height;
    v20->_startTimestamp = a5;
    v20->_endTimestamp = a6;
    if (&v20->_convexHull != a7)
      sub_1BE6F5A88(&v20->_convexHull.__begin_, *(char **)a7, *((char **)a7 + 1), (uint64_t)(*((_QWORD *)a7 + 1) - *(_QWORD *)a7) >> 4);
    v20->_curvature = a8;
  }

  return v20;
}

+ (id)substrokesForStroke:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  float64x2_t *v20;
  unint64_t v21;
  float64x2_t v22;
  double v23;
  uint64_t i;
  float64x2_t v25;
  float32x2_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  unint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _OWORD *v52;
  _QWORD *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  _OWORD *v60;
  unint64_t v61;
  _OWORD *v62;
  _OWORD *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  double v83;
  double v84;
  CHSubstroke *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  double v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  CHSubstroke *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *started;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  void *v136;
  void *v137;
  void *__p;
  void *v139;
  uint64_t v140;
  _QWORD v141[4];
  id v142;
  id v143;
  uint64_t *v144;
  uint64_t *v145;
  uint64_t *v146;
  uint64_t *v147;
  _QWORD *v148;
  _QWORD *v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  __n128 (*v154)(__n128 *, __n128 *);
  void (*v155)(uint64_t);
  void *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  double *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  double *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  double *v169;
  uint64_t v170;
  uint64_t v171;
  _QWORD v172[6];
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  _QWORD v176[6];
  int64x2_t v177;
  uint64_t v178;
  double *v179;
  uint64_t v180;
  __n128 (*v181)(uint64_t, uint64_t);
  uint64_t (*v182)();
  void *v183;
  __int128 v184;
  __int128 v185;
  CGRect v186;
  CGRect v187;

  v3 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5, v6, v7, v8);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = 0;
  v179 = (double *)&v178;
  v180 = 0x5012000000;
  v181 = sub_1BE7DA27C;
  v182 = nullsub_37;
  v183 = &unk_1BE94989A;
  v9 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v184 = *MEMORY[0x1E0C9D628];
  v185 = v9;
  v176[0] = 0;
  v176[1] = v176;
  v176[2] = 0x4012000000;
  v176[3] = sub_1BE7DA28C;
  v176[4] = nullsub_38;
  v176[5] = &unk_1BE94989A;
  v177 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v172[0] = 0;
  v172[1] = v172;
  v172[2] = 0x4812000000;
  v172[3] = sub_1BE7DA29C;
  v172[4] = sub_1BE7DA2E8;
  v172[5] = 0;
  v173 = (uint64_t)&v173;
  v174 = &v173;
  v175 = 0;
  v168 = 0;
  v169 = (double *)&v168;
  v170 = 0x2020000000;
  v171 = 0;
  v164 = 0;
  v165 = (double *)&v164;
  v166 = 0x2020000000;
  v167 = 0;
  v160 = 0;
  v161 = (double *)&v160;
  v162 = 0x2020000000;
  v163 = 0;
  v151 = 0;
  v152 = &v151;
  v153 = 0x4812000000;
  v154 = sub_1BE7DA34C;
  v155 = sub_1BE7DA370;
  v156 = &unk_1BE94989A;
  v157 = 0;
  v158 = 0;
  v159 = 0;
  v10 = (void *)objc_opt_class();
  v141[0] = MEMORY[0x1E0C809B0];
  v141[1] = 3221225472;
  v141[2] = sub_1BE7DA388;
  v141[3] = &unk_1E77F5438;
  v144 = &v151;
  v145 = &v178;
  v146 = &v164;
  v147 = &v160;
  v148 = v176;
  v149 = v172;
  v150 = &v168;
  v11 = v3;
  v142 = v11;
  v12 = v137;
  v143 = v12;
  objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v10, v13, (uint64_t)v11, 0, 1, (uint64_t)v141);
  v20 = (float64x2_t *)v152[6];
  v19 = (char *)v152[7];
  if ((unint64_t)(v19 - (char *)v20) < 0x11)
  {
    if (v19 == (char *)v20)
      goto LABEL_45;
  }
  else
  {
    v21 = (v19 - (char *)v20) >> 4;
    v22 = *v20;
    if (v21 <= 2)
      v21 = 2;
    v23 = 0.0;
    for (i = 1; i != v21; ++i)
    {
      v25 = v20[i];
      v26 = vsub_f32(vcvt_f32_f64(v25), vcvt_f32_f64(v22));
      v23 = v23 + sqrtf(vaddv_f32(vmul_f32(v26, v26)));
      v22 = v25;
    }
    if (v23 >= 10.0 && v169[3] != 0.0)
    {
      if (v19 == (char *)v20)
        goto LABEL_45;
      goto LABEL_36;
    }
  }
  if (!objc_msgSend_count(v12, v14, v15, v16, v17, v18))
  {
    if (v152[7] == v152[6])
      goto LABEL_45;
LABEL_36:
    v77 = (void *)objc_opt_class();
    if (v77)
    {
      objc_msgSend_convexHullForPoints_(v77, v78, (uint64_t)(v152 + 6), v79, v80, v81);
    }
    else
    {
      __p = 0;
      v139 = 0;
      v140 = 0;
    }
    v115 = [CHSubstroke alloc];
    objc_msgSend_encodedStrokeIdentifier(v11, v116, v117, v118, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    started = (void *)objc_msgSend_initWithStrokeIdentifier_bounds_startTimestamp_endTimestamp_convexHull_curvature_(v115, v122, (uint64_t)v121, (uint64_t)&__p, v123, v124, v179[6], v179[7], v179[8], v179[9], v165[3], v161[3], v169[3]);

    objc_msgSend_addObject_(v12, v126, (uint64_t)started, v127, v128, v129);
    if (__p)
    {
      v139 = __p;
      operator delete(__p);
    }
    goto LABEL_45;
  }
  objc_msgSend_lastObject(v12, v27, v28, v29, v30, v31, v3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v179[6];
  v34 = v179[7];
  v35 = v179[8];
  v36 = v179[9];
  objc_msgSend_bounds(v32, v37, v38, v39, v40, v41);
  v187.origin.x = v42;
  v187.origin.y = v43;
  v187.size.width = v44;
  v187.size.height = v45;
  v186.origin.x = v33;
  v186.origin.y = v34;
  v186.size.width = v35;
  v186.size.height = v36;
  v136 = v12;
  v46 = 0;
  *(CGRect *)(v179 + 6) = CGRectUnion(v186, v187);
  while (1)
  {
    v53 = (_QWORD *)objc_msgSend_convexHull(v32, v47, v48, v49, v50, v51);
    if (v46 >= (uint64_t)(v53[1] - *v53) >> 4)
      break;
    v59 = v152;
    v60 = (_OWORD *)(*(_QWORD *)objc_msgSend_convexHull(v32, v54, v55, v56, v57, v58) + 16 * v46);
    v62 = (_OWORD *)v59[7];
    v61 = v59[8];
    if ((unint64_t)v62 < v61)
    {
      *v62 = *v60;
      v52 = v62 + 1;
      goto LABEL_14;
    }
    v63 = (_OWORD *)v59[6];
    v64 = v62 - v63;
    v65 = v64 + 1;
    if ((unint64_t)(v64 + 1) >> 60)
      sub_1BE61F930();
    v66 = v61 - (_QWORD)v63;
    if (v66 >> 3 > v65)
      v65 = v66 >> 3;
    if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF0)
      v67 = 0xFFFFFFFFFFFFFFFLL;
    else
      v67 = v65;
    if (v67)
    {
      if (v67 >> 60)
        sub_1BE61F100();
      v68 = (char *)operator new(16 * v67);
      v69 = &v68[16 * v64];
      *(_OWORD *)v69 = *v60;
      v70 = (uint64_t)v69;
      if (v62 == v63)
      {
LABEL_31:
        v52 = v69 + 16;
        v59[6] = v70;
        v59[7] = (uint64_t)(v69 + 16);
        v59[8] = (uint64_t)&v68[16 * v67];
        if (!v62)
          goto LABEL_14;
LABEL_32:
        operator delete(v62);
        goto LABEL_14;
      }
    }
    else
    {
      v68 = 0;
      v69 = (char *)(16 * v64);
      *(_OWORD *)(16 * v64) = *v60;
      v70 = 16 * v64;
      if (v62 == v63)
        goto LABEL_31;
    }
    do
    {
      *(_OWORD *)(v70 - 16) = *(v62 - 1);
      v70 -= 16;
      --v62;
    }
    while (v62 != v63);
    v62 = (_OWORD *)v59[6];
    v52 = v69 + 16;
    v59[6] = v70;
    v59[7] = (uint64_t)(v69 + 16);
    v59[8] = (uint64_t)&v68[16 * v67];
    if (v62)
      goto LABEL_32;
LABEL_14:
    v59[7] = (uint64_t)v52;
    ++v46;
  }
  v71 = (void *)objc_opt_class();
  v12 = v136;
  if (v71)
  {
    objc_msgSend_convexHullForPoints_(v71, v72, (uint64_t)(v152 + 6), v74, v75, v76);
  }
  else
  {
    __p = 0;
    v139 = 0;
    v140 = 0;
  }
  v82 = v169[3];
  objc_msgSend_curvature(v32, v72, v73, v74, v75, v76);
  v84 = v83;
  v85 = [CHSubstroke alloc];
  objc_msgSend_strokeIdentifier(v32, v86, v87, v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v179[6];
  v93 = v179[7];
  v94 = v179[8];
  v95 = v179[9];
  objc_msgSend_startTimestamp(v32, v96, v97, v98, v99, v100);
  v105 = (void *)objc_msgSend_initWithStrokeIdentifier_bounds_startTimestamp_endTimestamp_convexHull_curvature_(v85, v101, (uint64_t)v91, (uint64_t)&__p, v102, v103, v92, v93, v94, v95, v104, v161[3], v82 + v84);

  v111 = objc_msgSend_count(v136, v106, v107, v108, v109, v110);
  objc_msgSend_setObject_atIndexedSubscript_(v136, v112, (uint64_t)v105, v111 - 1, v113, v114);

  if (__p)
  {
    v139 = __p;
    operator delete(__p);
  }

LABEL_45:
  v130 = v12;

  _Block_object_dispose(&v151, 8);
  if (v157)
  {
    v158 = v157;
    operator delete(v157);
  }
  _Block_object_dispose(&v160, 8);
  _Block_object_dispose(&v164, 8);
  _Block_object_dispose(&v168, 8);
  _Block_object_dispose(v172, 8);
  if (v175)
  {
    v132 = v173;
    v131 = v174;
    v133 = *v174;
    *(_QWORD *)(v133 + 8) = *(_QWORD *)(v173 + 8);
    **(_QWORD **)(v132 + 8) = v133;
    v175 = 0;
    if (v131 != &v173)
    {
      do
      {
        v134 = (uint64_t *)v131[1];
        operator delete(v131);
        v131 = v134;
      }
      while (v134 != &v173);
    }
  }
  _Block_object_dispose(v176, 8);
  _Block_object_dispose(&v178, 8);

  return v130;
}

- (void)convexHull
{
  return &self->_convexHull;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
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
  void *v38;
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
  uint64_t v49;
  _QWORD *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;

  v67 = a3;
  objc_msgSend_strokeIdentifier(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v67, v10, (uint64_t)v9, (uint64_t)CFSTR("strokeIdentifier"), v11, v12);

  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v13, (uint64_t)&self->_bounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v67, v17, (uint64_t)v16, (uint64_t)CFSTR("bounds"), v18, v19);
  objc_msgSend_startTimestamp(self, v20, v21, v22, v23, v24);
  objc_msgSend_encodeDouble_forKey_(v67, v25, (uint64_t)CFSTR("startTimestamp"), v26, v27, v28);
  objc_msgSend_endTimestamp(self, v29, v30, v31, v32, v33);
  objc_msgSend_encodeDouble_forKey_(v67, v34, (uint64_t)CFSTR("endTimestamp"), v35, v36, v37);
  v38 = (void *)MEMORY[0x1E0C99D50];
  v44 = *(_QWORD *)objc_msgSend_convexHull(self, v39, v40, v41, v42, v43);
  v50 = (_QWORD *)objc_msgSend_convexHull(self, v45, v46, v47, v48, v49);
  objc_msgSend_dataWithBytes_length_(v38, v51, v44, v50[1] - *v50, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v67, v55, (uint64_t)v54, (uint64_t)CFSTR("convexHull"), v56, v57);
  objc_msgSend_curvature(self, v58, v59, v60, v61, v62);
  objc_msgSend_encodeDouble_forKey_(v67, v63, (uint64_t)CFSTR("curvature"), v64, v65, v66);

}

- (CHSubstroke)initWithCoder:(id)a3
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
  __int128 v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  CHSubstroke *started;
  void *__p;
  void *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("strokeIdentifier"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("bounds"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v62 = *MEMORY[0x1E0C9D628];
  v63 = v15;
  objc_msgSend_getValue_size_(v14, v16, (uint64_t)&v62, 32, v17, v18);
  objc_msgSend_decodeDoubleForKey_(v4, v19, (uint64_t)CFSTR("startTimestamp"), v20, v21, v22);
  v24 = v23;
  objc_msgSend_decodeDoubleForKey_(v4, v25, (uint64_t)CFSTR("endTimestamp"), v26, v27, v28);
  v30 = v29;
  v31 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("convexHull"), v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_length(v35, v36, v37, v38, v39, v40);
  v42 = objc_retainAutorelease(v35);
  v48 = (char *)objc_msgSend_bytes(v42, v43, v44, v45, v46, v47);
  __p = 0;
  v60 = 0;
  v61 = 0;
  sub_1BE6F5A88(&__p, v48, &v48[v41 & 0xFFFFFFFFFFFFFFF0], v41 >> 4);
  objc_msgSend_decodeDoubleForKey_(v4, v49, (uint64_t)CFSTR("curvature"), v50, v51, v52);
  started = (CHSubstroke *)objc_msgSend_initWithStrokeIdentifier_bounds_startTimestamp_endTimestamp_convexHull_curvature_(self, v53, (uint64_t)v9, (uint64_t)&__p, v54, v55, v62, v63, v24, v30, v56);
  if (__p)
  {
    v60 = __p;
    operator delete(__p);
  }

  return started;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToSubstroke:(id)a3
{
  CHSubstroke *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHSubstroke *v10;
  CHEncodedStrokeIdentifier *strokeIdentifier;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CHEncodedStrokeIdentifier *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int isEqual;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double startTimestamp;
  double v39;
  double endTimestamp;
  double v41;
  CGPoint *end;
  CGPoint *begin;
  _QWORD *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CGPoint *v50;
  double v51;
  double v52;
  uint64_t v53;
  CGPoint *v54;
  uint64_t v55;
  unint64_t v56;
  CGPoint *v57;
  double v58;
  double v59;
  uint64_t v60;
  double curvature;
  double v63;
  CGRect v65;
  CGRect v66;

  v4 = (CHSubstroke *)a3;
  v10 = v4;
  if (self == v4)
  {
    LOBYTE(v29) = 1;
    goto LABEL_28;
  }
  strokeIdentifier = self->_strokeIdentifier;
  objc_msgSend_strokeIdentifier(v4, v5, v6, v7, v8, v9);
  v17 = (CHEncodedStrokeIdentifier *)objc_claimAutoreleasedReturnValue();
  if (strokeIdentifier == v17)
  {

  }
  else
  {
    objc_msgSend_strokeIdentifier(v10, v12, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v18, v19, (uint64_t)self->_strokeIdentifier, v20, v21, v22);

    if (!isEqual)
    {
LABEL_10:
      v29 = 0;
      goto LABEL_11;
    }
  }
  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  objc_msgSend_bounds(v10, v24, v25, v26, v27, v28);
  v66.origin.x = v34;
  v66.origin.y = v35;
  v66.size.width = v36;
  v66.size.height = v37;
  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  if (!CGRectEqualToRect(v65, v66))
    goto LABEL_10;
  startTimestamp = self->_startTimestamp;
  objc_msgSend_startTimestamp(v10, v24, v25, v26, v27, v28);
  if (startTimestamp != v39)
    goto LABEL_10;
  endTimestamp = self->_endTimestamp;
  objc_msgSend_endTimestamp(v10, v24, v25, v26, v27, v28);
  v29 = endTimestamp == v41;
LABEL_11:
  begin = self->_convexHull.__begin_;
  end = self->_convexHull.__end_;
  v44 = (_QWORD *)objc_msgSend_convexHull(v10, v24, v25, v26, v27, v28);
  if ((char *)end - (char *)begin != v44[1] - *v44)
  {
LABEL_25:
    LOBYTE(v29) = 0;
    goto LABEL_28;
  }
  v50 = self->_convexHull.__begin_;
  if (self->_convexHull.__end_ == v50)
  {
    if (!v29)
      goto LABEL_28;
    goto LABEL_27;
  }
  if (v29)
  {
    v52 = v50->x;
    v51 = v50->y;
    v53 = objc_msgSend_convexHull(v10, v45, v46, v47, v48, v49);
    LOBYTE(v29) = 0;
    if (v52 == **(double **)v53 && v51 == *(double *)(*(_QWORD *)v53 + 8))
    {
      v54 = self->_convexHull.__begin_;
      if ((CGPoint *)((char *)self->_convexHull.__end_ - (char *)v54) >= (CGPoint *)0x11)
      {
        v55 = 0;
        v56 = 1;
        do
        {
          v57 = &v54[v55];
          v58 = v57[1].x;
          v59 = v57[1].y;
          v60 = *(_QWORD *)objc_msgSend_convexHull(v10, v45, v46, v47, v48, v49) + v55 * 16;
          if (v58 != *(double *)(v60 + 16) || v59 != *(double *)(v60 + 24))
            goto LABEL_25;
          ++v56;
          v54 = self->_convexHull.__begin_;
          ++v55;
        }
        while (v56 < self->_convexHull.__end_ - v54);
      }
LABEL_27:
      curvature = self->_curvature;
      objc_msgSend_curvature(v10, v45, v46, v47, v48, v49);
      LOBYTE(v29) = vabdd_f64(curvature, v63) < 2.22044605e-16;
    }
  }
LABEL_28:

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToSubstroke;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToSubstroke = objc_msgSend_isEqualToSubstroke_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToSubstroke;
  }
  else
  {

    return 0;
  }
}

- (CHEncodedStrokeIdentifier)strokeIdentifier
{
  return self->_strokeIdentifier;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (double)curvature
{
  return self->_curvature;
}

- (void).cxx_destruct
{
  CGPoint *begin;

  objc_storeStrong((id *)&self->_strokeIdentifier, 0);
  begin = self->_convexHull.__begin_;
  if (begin)
  {
    self->_convexHull.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
