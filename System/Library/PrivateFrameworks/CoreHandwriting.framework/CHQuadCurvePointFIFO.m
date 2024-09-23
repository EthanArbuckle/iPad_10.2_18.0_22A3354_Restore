@implementation CHQuadCurvePointFIFO

- (CHQuadCurvePointFIFO)initWithFIFO:(id)a3
{
  CHQuadCurvePointFIFO *v3;
  CHQuadCurvePointFIFO *v4;
  CHPointFIFODrawingTarget *drawingTarget;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHQuadCurvePointFIFO;
  v3 = -[CHPointFIFO initWithFIFO:](&v7, sel_initWithFIFO_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_unitScale = 1.0;
    v3->_emitInterpolatedPoints = 1;
    drawingTarget = v3->_drawingTarget;
    v3->_drawingTarget = 0;

  }
  return v4;
}

- (CHQuadCurvePointFIFO)initWithFIFO:(id)a3 drawingTarget:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CHQuadCurvePointFIFO *v13;

  v7 = a4;
  v12 = objc_msgSend_initWithFIFO_(self, v8, (uint64_t)a3, v9, v10, v11);
  v13 = (CHQuadCurvePointFIFO *)v12;
  if (v12)
    objc_storeStrong((id *)(v12 + 48), a4);

  return v13;
}

- (void)dealloc
{
  CGPath *path;
  objc_super v4;

  path = self->_path;
  if (path)
    CGPathRelease(path);
  v4.receiver = self;
  v4.super_class = (Class)CHQuadCurvePointFIFO;
  -[CHQuadCurvePointFIFO dealloc](&v4, sel_dealloc);
}

+ (double)interpolateFromPoint:(float32x4_t)a1 toPoint:(float32x4_t)a2 controlPoint:(float32x4_t)a3 time:(float)a4
{
  double result;

  *(_QWORD *)&result = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(a3, (float)((float)(1.0 - a4) + (float)(1.0 - a4)) * a4), a1, (float)(1.0 - a4) * (float)(1.0 - a4)), a2, a4 * a4).u64[0];
  return result;
}

- (void)setUnitScaleForViewSize:(CGSize)a3 normalizedSize:(CGSize)a4 contentScaleFactor:(double)a5
{
  ((void (*)(CHQuadCurvePointFIFO *, char *))MEMORY[0x1E0DE7D20])(self, sel_setUnitScale_);
}

- (void)addPoint:(CHQuadCurvePointFIFO *)self
{
  float32x4_t v2;
  float32x4_t v3;
  unsigned __int8 *anon_50;
  float32x4_t *v6;
  unint64_t v7;
  char *v8;
  CGPath *path;
  float32x4_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  float32x4_t *v18;
  float32x4_t v19;
  float32x4_t *v20;
  uint64_t v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float32x4_t *v29;
  unint64_t v30;
  float32x4_t v31;
  _OWORD *f32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  size_t v36;
  float v37;
  float v38;
  double v39;
  unsigned __int8 *anon_68;
  double v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float v45;
  CHPointFIFO v46;
  int v47;
  float v48;
  _OWORD *v49;
  __int128 v50;
  unint64_t v51;
  _OWORD *v52;
  _OWORD *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  _OWORD *v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  unint64_t v65;
  uint64_t v66;
  _OWORD *v67;
  _OWORD *v68;
  double v69;
  double v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  double v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  double v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  double v102;
  unint64_t v103;
  _OWORD *v104;
  _OWORD *v105;
  _OWORD *v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char *v111;
  char *v112;
  char *v113;
  _OWORD *v114;
  __int128 v115;
  __int128 v116;
  unint64_t v117;
  _OWORD *v118;
  _OWORD *v119;
  _OWORD *v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char *v125;
  char *v126;
  char *v127;
  _OWORD *v128;
  __int128 v129;
  CHQuadCurvePointFIFO *v130;
  unint64_t v131;
  CHPointFIFO *nextFIFO;
  CHPointFIFO *v133;
  uint64_t v134;
  CHPointFIFO *isa;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  unint64_t v139;
  char *v140;
  CHPointFIFO *v141;
  char *v142;
  CHPointFIFO v143;
  float v144;
  double v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  double v151;
  float v152;
  float v153;
  double v154;
  double v155;
  double v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  double v162;
  double v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  double v174;
  double v175;
  float v176;
  double v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  double v183;
  double v184;
  float v185;
  double v186;
  double v187;
  CGFloat v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  double v194;
  CGFloat v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  double v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void (**emissionHandler)(void);
  unsigned __int8 *v208;
  uint64_t v209;
  unint64_t v210;
  uint64_t v211;
  __int128 r1;
  __int128 r1a;
  __int128 r1b;
  double r1c;
  float32x4_t r1_16;
  float32x4_t v217;
  float32x4_t v218;
  float32x4_t v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;

  v3 = v2;
  anon_50 = self->_anon_50;
  v6 = *(float32x4_t **)&self->_anon_50[8];
  v218 = v2;
  if (v6 == *(float32x4_t **)self->_anon_50)
  {
    path = self->_path;
    if (path)
      CGPathRelease(path);
    self->_path = CGPathCreateMutable();
    v6 = (float32x4_t *)*((_QWORD *)anon_50 + 1);
    v7 = *((_QWORD *)anon_50 + 2);
    v3 = v218;
    if ((unint64_t)v6 < v7)
      goto LABEL_3;
  }
  else
  {
    v7 = *(_QWORD *)&self->_anon_50[16];
    if ((unint64_t)v6 < v7)
    {
LABEL_3:
      *v6 = v3;
      v8 = (char *)&v6[1];
      goto LABEL_22;
    }
  }
  v10 = *(float32x4_t **)anon_50;
  v11 = ((uint64_t)v6 - *(_QWORD *)anon_50) >> 4;
  v12 = v11 + 1;
  if ((unint64_t)(v11 + 1) >> 60)
    goto LABEL_132;
  v13 = v7 - (_QWORD)v10;
  if (v13 >> 3 > v12)
    v12 = v13 >> 3;
  if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
    v14 = 0xFFFFFFFFFFFFFFFLL;
  else
    v14 = v12;
  if (v14)
  {
    if (v14 >> 60)
      goto LABEL_133;
    v15 = (char *)operator new(16 * v14);
    v3.i64[0] = v218.i64[0];
    v16 = &v15[16 * v11];
    v17 = &v15[16 * v14];
    *(float32x4_t *)v16 = v218;
    v8 = v16 + 16;
    if (v6 == v10)
      goto LABEL_20;
  }
  else
  {
    v16 = (char *)(16 * v11);
    v17 = 0;
    v18 = (float32x4_t *)(16 * v11);
    *v18 = v3;
    v8 = (char *)&v18[1];
    if (v6 == v10)
      goto LABEL_20;
  }
  do
  {
    v19 = v6[-1];
    --v6;
    *((float32x4_t *)v16 - 1) = v19;
    v16 -= 16;
  }
  while (v6 != v10);
  v6 = *(float32x4_t **)anon_50;
LABEL_20:
  *(_QWORD *)anon_50 = v16;
  *((_QWORD *)anon_50 + 1) = v8;
  *((_QWORD *)anon_50 + 2) = v17;
  if (v6)
  {
    operator delete(v6);
    v3.i64[0] = v218.i64[0];
  }
LABEL_22:
  *((_QWORD *)anon_50 + 1) = v8;
  v20 = *(float32x4_t **)anon_50;
  v21 = (uint64_t)&v8[-*(_QWORD *)anon_50] >> 4;
  if (v21 != 3)
  {
    if (v21 != 1)
      return;
    v22 = v3.f32[0];
    v23 = v3.f32[1];
    CGPathMoveToPoint(self->_path, 0, v3.f32[0], v3.f32[1]);
    v29 = *(float32x4_t **)self->_anon_68;
    *(_QWORD *)&self->_anon_68[8] = v29;
    v30 = *(_QWORD *)&self->_anon_68[16];
    if ((unint64_t)v29 < v30)
    {
      v31 = v218;
      *v29 = v218;
      f32 = (_OWORD *)v29[1].f32;
LABEL_56:
      *(_QWORD *)&self->_anon_68[8] = f32;
      *(float32x4_t *)self->_lastPoint = v31;
      if (self->_drawingTarget)
      {
        objc_msgSend_lineWidth(self, v24, v25, v26, v27, v28);
        v70 = v22 - v69 * 0.5;
        objc_msgSend_lineWidth(self, v71, v72, v73, v74, v75);
        v77 = v23 - v76 * 0.5;
        objc_msgSend_lineWidth(self, v78, v79, v80, v81, v82);
        v84 = v83;
        objc_msgSend_lineWidth(self, v85, v86, v87, v88, v89);
        objc_msgSend_setNeedsDisplayInRect_(self->_drawingTarget, v90, v91, v92, v93, v94, v70, v77, v84, v95);
      }
      goto LABEL_122;
    }
    v62 = v30 - (_QWORD)v29;
    v63 = v62 >> 3;
    if ((unint64_t)(v62 >> 3) <= 1)
      v63 = 1;
    v64 = (unint64_t)v62 >= 0x7FFFFFFFFFFFFFF0;
    v65 = 0xFFFFFFFFFFFFFFFLL;
    if (!v64)
      v65 = v63;
    if (!(v65 >> 60))
    {
      v66 = v65;
      v67 = operator new(16 * v65);
      v68 = &v67[v66];
      v31 = v218;
      *v67 = v218;
      f32 = v67 + 1;
      *(_QWORD *)self->_anon_68 = v67;
      *(_QWORD *)&self->_anon_68[8] = v67 + 1;
      *(_QWORD *)&self->_anon_68[16] = v68;
      if (v29)
      {
        operator delete(v29);
        v31 = v218;
      }
      goto LABEL_56;
    }
LABEL_133:
    sub_1BE61F100();
  }
  v211 = 64;
  v33 = v20[1];
  v34.i64[0] = 0x3F0000003F000000;
  v34.i64[1] = 0x3F0000003F000000;
  v35 = vmlaq_f32(v33, v34, vsubq_f32(v20[2], v33));
  v36 = v8 - (char *)&v20[1];
  v219 = v33;
  r1_16 = *(float32x4_t *)self->_lastPoint;
  v217 = v35;
  if (v36)
  {
    memmove(v20, &v20[1], v36);
    v35.i64[0] = v217.i64[0];
    v33.i64[0] = v219.i64[0];
  }
  *((_QWORD *)anon_50 + 1) = (char *)v20 + v36;
  v37 = v33.f32[1];
  v38 = v35.f32[1];
  CGPathAddQuadCurveToPoint(self->_path, 0, v33.f32[0], v33.f32[1], v35.f32[0], v35.f32[1]);
  anon_68 = self->_anon_68;
  *(_QWORD *)&self->_anon_68[8] = *(_QWORD *)self->_anon_68;
  if (!self->_emitInterpolatedPoints)
  {
    LODWORD(v39) = 0;
    objc_msgSend_interpolateFromPoint_toPoint_controlPoint_time_(CHQuadCurvePointFIFO, v24, v25, v26, v27, v28, *(double *)r1_16.i64, *(double *)v217.i64, *(double *)v219.i64, v39);
    v104 = *(_OWORD **)&self->_anon_68[8];
    v103 = *(_QWORD *)&self->_anon_68[16];
    if ((unint64_t)v104 < v103)
    {
      *v104 = v101;
      v105 = v104 + 1;
      goto LABEL_75;
    }
    v106 = *(_OWORD **)anon_68;
    v107 = ((uint64_t)v104 - *(_QWORD *)anon_68) >> 4;
    v108 = v107 + 1;
    if ((unint64_t)(v107 + 1) >> 60)
      goto LABEL_132;
    v109 = v103 - (_QWORD)v106;
    if (v109 >> 3 > v108)
      v108 = v109 >> 3;
    if ((unint64_t)v109 >= 0x7FFFFFFFFFFFFFF0)
      v110 = 0xFFFFFFFFFFFFFFFLL;
    else
      v110 = v108;
    if (v110)
    {
      r1a = v101;
      if (v110 >> 60)
        goto LABEL_133;
      v111 = (char *)operator new(16 * v110);
      v112 = &v111[16 * v107];
      v113 = &v111[16 * v110];
      *(_OWORD *)v112 = r1a;
      v105 = v112 + 16;
      if (v104 == v106)
        goto LABEL_73;
    }
    else
    {
      v112 = (char *)(16 * v107);
      v113 = 0;
      v114 = (_OWORD *)(16 * v107);
      *v114 = v101;
      v105 = v114 + 1;
      if (v104 == v106)
        goto LABEL_73;
    }
    do
    {
      v115 = *--v104;
      *((_OWORD *)v112 - 1) = v115;
      v112 -= 16;
    }
    while (v104 != v106);
    v104 = *(_OWORD **)anon_68;
LABEL_73:
    *(_QWORD *)anon_68 = v112;
    *(_QWORD *)&self->_anon_68[8] = v105;
    *(_QWORD *)&self->_anon_68[16] = v113;
    if (v104)
      operator delete(v104);
LABEL_75:
    *(_QWORD *)&self->_anon_68[8] = v105;
    LODWORD(v102) = 1.0;
    objc_msgSend_interpolateFromPoint_toPoint_controlPoint_time_(CHQuadCurvePointFIFO, v96, v97, v98, v99, v100, *(double *)r1_16.i64, *(double *)v217.i64, *(double *)v219.i64, v102, 64);
    v118 = *(_OWORD **)&self->_anon_68[8];
    v117 = *(_QWORD *)&self->_anon_68[16];
    if ((unint64_t)v118 < v117)
    {
      *v118 = v116;
      v119 = v118 + 1;
LABEL_92:
      v46 = (CHPointFIFO)v217;
      v42 = v219;
      *(_QWORD *)&self->_anon_68[8] = v119;
      goto LABEL_93;
    }
    v120 = *(_OWORD **)anon_68;
    v121 = ((uint64_t)v118 - *(_QWORD *)anon_68) >> 4;
    v122 = v121 + 1;
    if ((unint64_t)(v121 + 1) >> 60)
      goto LABEL_132;
    v123 = v117 - (_QWORD)v120;
    if (v123 >> 3 > v122)
      v122 = v123 >> 3;
    if ((unint64_t)v123 >= 0x7FFFFFFFFFFFFFF0)
      v124 = 0xFFFFFFFFFFFFFFFLL;
    else
      v124 = v122;
    if (v124)
    {
      r1b = v116;
      if (v124 >> 60)
        goto LABEL_133;
      v125 = (char *)operator new(16 * v124);
      v126 = &v125[16 * v121];
      v127 = &v125[16 * v124];
      *(_OWORD *)v126 = r1b;
      v119 = v126 + 16;
      if (v118 == v120)
        goto LABEL_90;
    }
    else
    {
      v126 = (char *)(16 * v121);
      v127 = 0;
      v128 = (_OWORD *)(16 * v121);
      *v128 = v116;
      v119 = v128 + 1;
      if (v118 == v120)
        goto LABEL_90;
    }
    do
    {
      v129 = *--v118;
      *((_OWORD *)v126 - 1) = v129;
      v126 -= 16;
    }
    while (v118 != v120);
    v118 = *(_OWORD **)anon_68;
LABEL_90:
    *(_QWORD *)anon_68 = v126;
    *(_QWORD *)&self->_anon_68[8] = v119;
    *(_QWORD *)&self->_anon_68[16] = v127;
    if (v118)
      operator delete(v118);
    goto LABEL_92;
  }
  HIDWORD(v41) = v217.i32[1];
  v42 = v219;
  v43 = vsubq_f32(r1_16, v219);
  v44 = vsubq_f32(v219, v217);
  v45 = (float)(sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v43, v43)))
              + sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v44, v44))))
      / self->_unitScale;
  v46 = (CHPointFIFO)v217;
  if (v45 > 0.0)
  {
    v47 = 0;
    v48 = 0.0;
    while (1)
    {
      *(float *)&v41 = v48 / v45;
      objc_msgSend_interpolateFromPoint_toPoint_controlPoint_time_(CHQuadCurvePointFIFO, v24, v25, v26, v27, v28, *(double *)r1_16.i64, *(double *)&v46.super.isa, *(double *)v42.i64, v41, v211);
      v52 = *(_OWORD **)&self->_anon_68[8];
      v51 = *(_QWORD *)&self->_anon_68[16];
      if ((unint64_t)v52 >= v51)
        break;
      *v52 = v50;
      v49 = v52 + 1;
LABEL_32:
      v46 = (CHPointFIFO)v217;
      v42 = v219;
      *(_QWORD *)&self->_anon_68[8] = v49;
      v48 = (float)++v47;
      if (v45 <= (float)v47)
        goto LABEL_93;
    }
    v53 = *(_OWORD **)anon_68;
    v54 = ((uint64_t)v52 - *(_QWORD *)anon_68) >> 4;
    v55 = v54 + 1;
    if ((unint64_t)(v54 + 1) >> 60)
      goto LABEL_132;
    v56 = v51 - (_QWORD)v53;
    if (v56 >> 3 > v55)
      v55 = v56 >> 3;
    if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF0)
      v57 = 0xFFFFFFFFFFFFFFFLL;
    else
      v57 = v55;
    if (v57)
    {
      r1 = v50;
      if (v57 >> 60)
        goto LABEL_133;
      v58 = (char *)operator new(16 * v57);
      v59 = &v58[16 * v54];
      *(_OWORD *)v59 = r1;
      v49 = v59 + 16;
      if (v52 == v53)
        goto LABEL_47;
    }
    else
    {
      v58 = 0;
      v59 = (char *)(16 * v54);
      v60 = (_OWORD *)(16 * v54);
      *v60 = v50;
      v49 = v60 + 1;
      if (v52 == v53)
        goto LABEL_47;
    }
    do
    {
      v61 = *--v52;
      *((_OWORD *)v59 - 1) = v61;
      v59 -= 16;
    }
    while (v52 != v53);
    v52 = *(_OWORD **)anon_68;
LABEL_47:
    *(_QWORD *)anon_68 = v59;
    *(_QWORD *)&self->_anon_68[8] = v49;
    *(_QWORD *)&self->_anon_68[16] = &v58[16 * v57];
    if (v52)
      operator delete(v52);
    goto LABEL_32;
  }
LABEL_93:
  v130 = self + 1;
  nextFIFO = self[1].super._nextFIFO;
  v131 = *(_QWORD *)&self[1]._emitInterpolatedPoints;
  if ((unint64_t)nextFIFO < v131)
  {
    *nextFIFO = (CHPointFIFO)v42;
    v133 = nextFIFO + 1;
    v134 = v211;
    goto LABEL_108;
  }
  isa = (CHPointFIFO *)v130->super.super.isa;
  v136 = ((char *)nextFIFO - (char *)v130->super.super.isa) >> 4;
  v137 = v136 + 1;
  if ((unint64_t)(v136 + 1) >> 60)
LABEL_132:
    sub_1BE61F930();
  v138 = v131 - (_QWORD)isa;
  if (v138 >> 3 > v137)
    v137 = v138 >> 3;
  if ((unint64_t)v138 >= 0x7FFFFFFFFFFFFFF0)
    v139 = 0xFFFFFFFFFFFFFFFLL;
  else
    v139 = v137;
  if (v139)
  {
    if (v139 >> 60)
      goto LABEL_133;
    v140 = (char *)operator new(16 * v139);
    v46 = (CHPointFIFO)v217;
    v42 = v219;
    v141 = (CHPointFIFO *)&v140[16 * v136];
    v142 = &v140[16 * v139];
    *v141 = (CHPointFIFO)v219;
    v133 = v141 + 1;
    if (nextFIFO != isa)
    {
LABEL_104:
      v134 = v211;
      do
      {
        v143 = nextFIFO[-1];
        --nextFIFO;
        v141[-1] = v143;
        --v141;
      }
      while (nextFIFO != isa);
      nextFIFO = (CHPointFIFO *)v130->super.super.isa;
      v130->super.super.isa = (Class)v141;
      self[1].super._nextFIFO = v133;
      *(_QWORD *)&self[1]._emitInterpolatedPoints = v142;
      if (nextFIFO)
        goto LABEL_107;
      goto LABEL_108;
    }
  }
  else
  {
    v141 = (CHPointFIFO *)(16 * v136);
    v142 = 0;
    *(float32x4_t *)(16 * v136) = v42;
    v133 = (CHPointFIFO *)(16 * v136 + 16);
    if (nextFIFO != isa)
      goto LABEL_104;
  }
  v134 = v211;
  v130->super.super.isa = (Class)v141;
  self[1].super._nextFIFO = v133;
  *(_QWORD *)&self[1]._emitInterpolatedPoints = v142;
  if (nextFIFO)
  {
LABEL_107:
    operator delete(nextFIFO);
    v46 = (CHPointFIFO)v217;
    v42 = v219;
  }
LABEL_108:
  self[1].super._nextFIFO = v133;
  *(CHPointFIFO *)((char *)&self->super + v134) = v46;
  if (self->_drawingTarget)
  {
    if ((vmovn_s32(vcgtq_f32(v42, r1_16)).u8[0] & 1) != 0)
      v144 = r1_16.f32[0];
    else
      v144 = v42.f32[0];
    v145 = v144;
    objc_msgSend_lineWidth(self, v24, v25, v26, v27, v28, v211);
    r1c = v145 - v151 * 0.5;
    if (r1_16.f32[1] >= v37)
      v152 = v37;
    else
      v152 = r1_16.f32[1];
    v153 = v37;
    v154 = v152;
    objc_msgSend_lineWidth(self, v146, v147, v148, v149, v150);
    v156 = v154 - v155 * 0.5;
    objc_msgSend_lineWidth(self, v157, v158, v159, v160, v161);
    v163 = v162 + fabsf(vsubq_f32(v219, r1_16).f32[0]);
    objc_msgSend_lineWidth(self, v164, v165, v166, v167, v168);
    v175 = v174 + vabds_f32(v153, r1_16.f32[1]);
    if ((vmovn_s32(vcgtq_f32(v217, v219)).u8[0] & 1) != 0)
      v176 = v219.f32[0];
    else
      v176 = v217.f32[0];
    v177 = v176;
    objc_msgSend_lineWidth(self, v169, v170, v171, v172, v173);
    v184 = v177 - v183 * 0.5;
    if (v153 >= v38)
      v185 = v38;
    else
      v185 = v153;
    v186 = v185;
    objc_msgSend_lineWidth(self, v178, v179, v180, v181, v182);
    v188 = v186 - v187 * 0.5;
    objc_msgSend_lineWidth(self, v189, v190, v191, v192, v193);
    v195 = v194 + fabsf(vsubq_f32(v217, v219).f32[0]);
    objc_msgSend_lineWidth(self, v196, v197, v198, v199, v200);
    v222.size.height = v201 + vabds_f32(v38, v153);
    v220.origin.x = r1c;
    v220.origin.y = v156;
    v220.size.width = v163;
    v220.size.height = v175;
    v222.origin.x = v184;
    v222.origin.y = v188;
    v222.size.width = v195;
    v221 = CGRectUnion(v220, v222);
    objc_msgSend_setNeedsDisplayInRect_(self->_drawingTarget, v202, v203, v204, v205, v206, v221.origin.x, v221.origin.y, v221.size.width, v221.size.height);
  }
LABEL_122:
  emissionHandler = (void (**)(void))self->_emissionHandler;
  if (emissionHandler)
  {
    emissionHandler[2]();
    v208 = self->_anon_68;
    v209 = *(_QWORD *)self->_anon_68;
    if (*(_QWORD *)&self->_anon_68[8] == v209)
      return;
  }
  else
  {
    v208 = self->_anon_68;
    v209 = *(_QWORD *)self->_anon_68;
    if (*(_QWORD *)&self->_anon_68[8] == v209)
      return;
  }
  v210 = 0;
  do
  {
    objc_msgSend_emitPoint_(self, v24, v25, v26, v27, v28, *(double *)(v209 + 16 * v210++), v211);
    v209 = *(_QWORD *)v208;
  }
  while (v210 < (uint64_t)(*((_QWORD *)v208 + 1) - *(_QWORD *)v208) >> 4);
}

- (void)flush
{
  unsigned __int8 *anon_50;
  uint64_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  unsigned __int8 *anon_68;
  double v16;
  float32x4_t v17;
  float32x4_t v18;
  float v19;
  __n128 v20;
  __n128 v21;
  CHPointFIFO v22;
  int v23;
  _OWORD *v24;
  __int128 v25;
  unint64_t v26;
  _OWORD *v27;
  _OWORD *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  _OWORD *v35;
  __int128 v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  double v43;
  unint64_t v44;
  _OWORD *v45;
  _OWORD *v46;
  _OWORD *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  _OWORD *v55;
  __int128 v56;
  __int128 v57;
  unint64_t v58;
  _OWORD *v59;
  _OWORD *v60;
  _OWORD *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  _OWORD *v69;
  __int128 v70;
  CHQuadCurvePointFIFO *v71;
  unint64_t v72;
  CHPointFIFO *nextFIFO;
  CHPointFIFO *v74;
  CHPointFIFO *isa;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  CHPointFIFO *v81;
  char *v82;
  CHPointFIFO *v83;
  CHPointFIFO v84;
  double v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  double v92;
  float v93;
  double v94;
  double v95;
  double v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  double v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void (**emissionHandler)(__n128, __n128);
  _OWORD *v116;
  unint64_t v117;
  float32x4_t v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  float32x4_t v122;
  float32x4_t v123;
  float32x4_t v124;
  objc_super v125;
  CHPointFIFO v126;

  v126 = (CHPointFIFO)0;
  anon_50 = self->_anon_50;
  v4 = *(_QWORD *)&self->_anon_50[8];
  if (v4 == *(_QWORD *)self->_anon_50)
    goto LABEL_87;
  v5 = *(float32x4_t *)self->_lastPoint;
  v6 = *(float32x4_t *)(v4 - 16);
  v7.i64[0] = 0x3F0000003F000000;
  v7.i64[1] = 0x3F0000003F000000;
  v123 = v6;
  v124 = v5;
  v118 = vsubq_f32(v6, v5);
  v122 = vmlaq_f32(v5, v7, v118);
  LODWORD(v8) = HIDWORD(*(_QWORD *)(v4 - 16));
  CGPathAddLineToPoint(self->_path, 0, v6.f32[0], v6.f32[1]);
  anon_68 = self->_anon_68;
  *(_QWORD *)&self->_anon_68[8] = *(_QWORD *)self->_anon_68;
  if (!self->_emitInterpolatedPoints)
  {
    LODWORD(v14) = 0;
    objc_msgSend_interpolateFromPoint_toPoint_controlPoint_time_(CHQuadCurvePointFIFO, v9, v10, v11, v12, v13, *(double *)v124.i64, *(double *)v123.i64, *(double *)v122.i64, v14);
    v45 = *(_OWORD **)&self->_anon_68[8];
    v44 = *(_QWORD *)&self->_anon_68[16];
    if ((unint64_t)v45 < v44)
    {
      *v45 = v42;
      v46 = v45 + 1;
      goto LABEL_40;
    }
    v47 = *(_OWORD **)anon_68;
    v48 = ((uint64_t)v45 - *(_QWORD *)anon_68) >> 4;
    v49 = v48 + 1;
    if ((unint64_t)(v48 + 1) >> 60)
      goto LABEL_88;
    v50 = v44 - (_QWORD)v47;
    if (v50 >> 3 > v49)
      v49 = v50 >> 3;
    if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF0)
      v51 = 0xFFFFFFFFFFFFFFFLL;
    else
      v51 = v49;
    if (v51)
    {
      v120 = v42;
      if (v51 >> 60)
        goto LABEL_89;
      v52 = (char *)operator new(16 * v51);
      v53 = &v52[16 * v48];
      v54 = &v52[16 * v51];
      *(_OWORD *)v53 = v120;
      v46 = v53 + 16;
      if (v45 == v47)
        goto LABEL_38;
    }
    else
    {
      v53 = (char *)(16 * v48);
      v54 = 0;
      v55 = (_OWORD *)(16 * v48);
      *v55 = v42;
      v46 = v55 + 1;
      if (v45 == v47)
        goto LABEL_38;
    }
    do
    {
      v56 = *--v45;
      *((_OWORD *)v53 - 1) = v56;
      v53 -= 16;
    }
    while (v45 != v47);
    v45 = *(_OWORD **)anon_68;
LABEL_38:
    *(_QWORD *)anon_68 = v53;
    *(_QWORD *)&self->_anon_68[8] = v46;
    *(_QWORD *)&self->_anon_68[16] = v54;
    if (v45)
      operator delete(v45);
LABEL_40:
    *(_QWORD *)&self->_anon_68[8] = v46;
    LODWORD(v43) = 1.0;
    objc_msgSend_interpolateFromPoint_toPoint_controlPoint_time_(CHQuadCurvePointFIFO, v37, v38, v39, v40, v41, *(double *)v124.i64, *(double *)v123.i64, *(double *)v122.i64, v43, *(_OWORD *)&v118);
    v59 = *(_OWORD **)&self->_anon_68[8];
    v58 = *(_QWORD *)&self->_anon_68[16];
    if ((unint64_t)v59 < v58)
    {
      *v59 = v57;
      v60 = v59 + 1;
LABEL_57:
      v21 = (__n128)v123;
      v20 = (__n128)v124;
      *(_QWORD *)&self->_anon_68[8] = v60;
      v22 = (CHPointFIFO)v122;
      goto LABEL_58;
    }
    v61 = *(_OWORD **)anon_68;
    v62 = ((uint64_t)v59 - *(_QWORD *)anon_68) >> 4;
    v63 = v62 + 1;
    if ((unint64_t)(v62 + 1) >> 60)
      goto LABEL_88;
    v64 = v58 - (_QWORD)v61;
    if (v64 >> 3 > v63)
      v63 = v64 >> 3;
    if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF0)
      v65 = 0xFFFFFFFFFFFFFFFLL;
    else
      v65 = v63;
    if (v65)
    {
      v121 = v57;
      if (v65 >> 60)
        goto LABEL_89;
      v66 = (char *)operator new(16 * v65);
      v67 = &v66[16 * v62];
      v68 = &v66[16 * v65];
      *(_OWORD *)v67 = v121;
      v60 = v67 + 16;
      if (v59 == v61)
        goto LABEL_55;
    }
    else
    {
      v67 = (char *)(16 * v62);
      v68 = 0;
      v69 = (_OWORD *)(16 * v62);
      *v69 = v57;
      v60 = v69 + 1;
      if (v59 == v61)
        goto LABEL_55;
    }
    do
    {
      v70 = *--v59;
      *((_OWORD *)v67 - 1) = v70;
      v67 -= 16;
    }
    while (v59 != v61);
    v59 = *(_OWORD **)anon_68;
LABEL_55:
    *(_QWORD *)anon_68 = v67;
    *(_QWORD *)&self->_anon_68[8] = v60;
    *(_QWORD *)&self->_anon_68[16] = v68;
    if (v59)
      operator delete(v59);
    goto LABEL_57;
  }
  HIDWORD(v16) = v123.i32[1];
  v17 = vsubq_f32(v124, v122);
  v18 = vsubq_f32(v122, v123);
  v19 = (float)(sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v17, v17)))
              + sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v18, v18))))
      / self->_unitScale;
  v20 = (__n128)v124;
  v21 = (__n128)v123;
  v22 = (CHPointFIFO)v122;
  if (v19 > 0.0)
  {
    v23 = 0;
    LODWORD(v16) = 0;
    while (1)
    {
      *(float *)&v16 = *(float *)&v16 / v19;
      objc_msgSend_interpolateFromPoint_toPoint_controlPoint_time_(CHQuadCurvePointFIFO, v9, v10, v11, v12, v13, v20.n128_f64[0], v21.n128_f64[0], *(double *)&v22.super.isa, v16, *(_OWORD *)&v118);
      v27 = *(_OWORD **)&self->_anon_68[8];
      v26 = *(_QWORD *)&self->_anon_68[16];
      if ((unint64_t)v27 >= v26)
        break;
      *v27 = v25;
      v24 = v27 + 1;
LABEL_6:
      v21 = (__n128)v123;
      v20 = (__n128)v124;
      *(_QWORD *)&self->_anon_68[8] = v24;
      *(float *)&v16 = (float)++v23;
      v22 = (CHPointFIFO)v122;
      if (v19 <= (float)v23)
        goto LABEL_58;
    }
    v28 = *(_OWORD **)anon_68;
    v29 = ((uint64_t)v27 - *(_QWORD *)anon_68) >> 4;
    v30 = v29 + 1;
    if ((unint64_t)(v29 + 1) >> 60)
      goto LABEL_88;
    v31 = v26 - (_QWORD)v28;
    if (v31 >> 3 > v30)
      v30 = v31 >> 3;
    if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0)
      v32 = 0xFFFFFFFFFFFFFFFLL;
    else
      v32 = v30;
    if (v32)
    {
      v119 = v25;
      if (v32 >> 60)
        goto LABEL_89;
      v33 = (char *)operator new(16 * v32);
      v34 = &v33[16 * v29];
      *(_OWORD *)v34 = v119;
      v24 = v34 + 16;
      if (v27 == v28)
        goto LABEL_21;
    }
    else
    {
      v33 = 0;
      v34 = (char *)(16 * v29);
      v35 = (_OWORD *)(16 * v29);
      *v35 = v25;
      v24 = v35 + 1;
      if (v27 == v28)
        goto LABEL_21;
    }
    do
    {
      v36 = *--v27;
      *((_OWORD *)v34 - 1) = v36;
      v34 -= 16;
    }
    while (v27 != v28);
    v27 = *(_OWORD **)anon_68;
LABEL_21:
    *(_QWORD *)anon_68 = v34;
    *(_QWORD *)&self->_anon_68[8] = v24;
    *(_QWORD *)&self->_anon_68[16] = &v33[16 * v32];
    if (v27)
      operator delete(v27);
    goto LABEL_6;
  }
LABEL_58:
  v71 = self + 1;
  nextFIFO = self[1].super._nextFIFO;
  v72 = *(_QWORD *)&self[1]._emitInterpolatedPoints;
  if ((unint64_t)nextFIFO >= v72)
  {
    isa = (CHPointFIFO *)v71->super.super.isa;
    v76 = ((char *)nextFIFO - (char *)v71->super.super.isa) >> 4;
    v77 = v76 + 1;
    if (!((unint64_t)(v76 + 1) >> 60))
    {
      v78 = v72 - (_QWORD)isa;
      if (v78 >> 3 > v77)
        v77 = v78 >> 3;
      if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFF0)
        v79 = 0xFFFFFFFFFFFFFFFLL;
      else
        v79 = v77;
      if (!v79)
      {
        v81 = (CHPointFIFO *)(16 * v76);
        v82 = 0;
        v83 = (CHPointFIFO *)(16 * v76);
        *v83 = v22;
        v74 = v83 + 1;
        if (nextFIFO == isa)
          goto LABEL_73;
        do
        {
LABEL_71:
          v84 = nextFIFO[-1];
          --nextFIFO;
          v81[-1] = v84;
          --v81;
        }
        while (nextFIFO != isa);
        nextFIFO = (CHPointFIFO *)v71->super.super.isa;
LABEL_73:
        v71->super.super.isa = (Class)v81;
        self[1].super._nextFIFO = v74;
        *(_QWORD *)&self[1]._emitInterpolatedPoints = v82;
        if (nextFIFO)
        {
          operator delete(nextFIFO);
          v22 = (CHPointFIFO)v122;
          v21 = (__n128)v123;
          v20 = (__n128)v124;
        }
        goto LABEL_75;
      }
      if (!(v79 >> 60))
      {
        v80 = (char *)operator new(16 * v79);
        v21 = (__n128)v123;
        v20 = (__n128)v124;
        v22 = (CHPointFIFO)v122;
        v81 = (CHPointFIFO *)&v80[16 * v76];
        v82 = &v80[16 * v79];
        *v81 = (CHPointFIFO)v122;
        v74 = v81 + 1;
        if (nextFIFO == isa)
          goto LABEL_73;
        goto LABEL_71;
      }
LABEL_89:
      sub_1BE61F100();
    }
LABEL_88:
    sub_1BE61F930();
  }
  *nextFIFO = v22;
  v74 = nextFIFO + 1;
LABEL_75:
  self[1].super._nextFIFO = v74;
  v126 = v22;
  if (self->_drawingTarget)
  {
    if ((vmovn_s32(vcgtq_f32((float32x4_t)v21, (float32x4_t)v20)).u8[0] & 1) != 0)
      v21.n128_f32[0] = v20.n128_f32[0];
    v85 = v21.n128_f32[0];
    objc_msgSend_lineWidth(self, v9, v10, v11, v12, v13, *(_OWORD *)&v118);
    v92 = v85 - v91 * 0.5;
    if (v124.f32[1] >= v8)
      v93 = v8;
    else
      v93 = v124.f32[1];
    v94 = v93;
    objc_msgSend_lineWidth(self, v86, v87, v88, v89, v90);
    v96 = v94 - v95 * 0.5;
    objc_msgSend_lineWidth(self, v97, v98, v99, v100, v101);
    v103 = v102 + fabsf(v118.f32[0]);
    objc_msgSend_lineWidth(self, v104, v105, v106, v107, v108);
    objc_msgSend_setNeedsDisplayInRect_(self->_drawingTarget, v110, v111, v112, v113, v114, v92, v96, v103, v109 + vabds_f32(v8, v124.f32[1]));
  }
  emissionHandler = (void (**)(__n128, __n128))self->_emissionHandler;
  if (emissionHandler)
    emissionHandler[2](v20, v21);
  v116 = *(_OWORD **)anon_68;
  if (*(_QWORD *)&self->_anon_68[8] != *(_QWORD *)self->_anon_68)
  {
    v117 = 0;
    do
    {
      objc_msgSend_emitPoint_(self, v9, v10, v11, v12, v13, *(double *)&v116[v117++], v21.n128_f64[0], *(_OWORD *)&v118);
      v116 = *(_OWORD **)anon_68;
    }
    while (v117 < (uint64_t)(*(_QWORD *)&self->_anon_68[8] - *(_QWORD *)self->_anon_68) >> 4);
  }
LABEL_87:
  *((_QWORD *)anon_50 + 1) = *(_QWORD *)anon_50;
  v125.receiver = self;
  v125.super_class = (Class)CHQuadCurvePointFIFO;
  -[CHPointFIFO flush](&v125, sel_flush, *(_OWORD *)&v118);
}

- (void)clear
{
  CGPath *path;
  objc_super v4;

  *(_QWORD *)&self->_anon_50[8] = *(_QWORD *)self->_anon_50;
  *(_QWORD *)&self->_anon_68[8] = *(_QWORD *)self->_anon_68;
  path = self->_path;
  if (path)
    CGPathRelease(path);
  self->_path = CGPathCreateMutable();
  v4.receiver = self;
  v4.super_class = (Class)CHQuadCurvePointFIFO;
  -[CHPointFIFO clear](&v4, sel_clear);
}

- (float)unitScale
{
  return self->_unitScale;
}

- (void)setUnitScale:(float)a3
{
  self->_unitScale = a3;
}

- (BOOL)emitInterpolatedPoints
{
  return self->_emitInterpolatedPoints;
}

- (void)setEmitInterpolatedPoints:(BOOL)a3
{
  self->_emitInterpolatedPoints = a3;
}

- (id)emissionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setEmissionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (CGPath)path
{
  return self->_path;
}

- (void)setPath:(CGPath *)a3
{
  self->_path = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
  CHQuadCurvePointFIFO *v3;
  Class isa;
  void *v5;
  void *v6;

  v3 = self + 1;
  isa = self[1].super.super.isa;
  if (isa)
  {
    v3->super._nextFIFO = (CHPointFIFO *)isa;
    operator delete(isa);
  }
  v5 = *(void **)self->_anon_68;
  if (v5)
  {
    *(_QWORD *)&self->_anon_68[8] = v5;
    operator delete(v5);
  }
  v6 = *(void **)self->_anon_50;
  if (v6)
  {
    *(_QWORD *)&self->_anon_50[8] = v6;
    operator delete(v6);
  }
  objc_storeStrong((id *)&self->_drawingTarget, 0);
  objc_storeStrong(&self->_emissionHandler, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 16) = 0;
  return self;
}

@end
