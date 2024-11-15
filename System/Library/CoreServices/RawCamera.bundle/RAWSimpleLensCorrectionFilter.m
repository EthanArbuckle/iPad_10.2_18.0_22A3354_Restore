@implementation RAWSimpleLensCorrectionFilter

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v18;
  void *v19;
  _QWORD v20[7];
  _QWORD v21[7];
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[7];
  _QWORD v25[7];
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[6];
  uint64_t v33;
  _QWORD v34[4];
  _QWORD v35[6];

  v35[4] = *MEMORY[0x1E0C80C00];
  v34[0] = CFSTR("inputDistortionScaleHalfMinorRadius");
  v3 = *MEMORY[0x1E0C9DE60];
  v26[0] = *MEMORY[0x1E0C9DE50];
  v2 = v26[0];
  v26[1] = v3;
  v32[0] = &unk_1E99CC278;
  v32[1] = &unk_1E99CC288;
  v5 = *MEMORY[0x1E0C9DE48];
  v27 = *MEMORY[0x1E0C9DE58];
  v4 = v27;
  v28 = v5;
  v32[2] = &unk_1E99CC298;
  v32[3] = &unk_1E99CC2A8;
  v7 = *MEMORY[0x1E0C9DE40];
  v29 = *MEMORY[0x1E0C9DE10];
  v6 = v29;
  v30 = v7;
  v32[4] = &unk_1E99CC2B8;
  v32[5] = &unk_1E99CC2B8;
  v31 = *MEMORY[0x1E0C9DE68];
  v8 = v31;
  v33 = *MEMORY[0x1E0C9DED0];
  v9 = v33;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v32, (uint64_t)v26, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v19;
  v34[1] = CFSTR("inputDistortionScaleMinorRadius");
  v24[0] = v2;
  v24[1] = v3;
  v25[0] = &unk_1E99CC278;
  v25[1] = &unk_1E99CC288;
  v24[2] = v4;
  v24[3] = v5;
  v25[2] = &unk_1E99CC298;
  v25[3] = &unk_1E99CC2A8;
  v24[4] = v6;
  v24[5] = v7;
  v25[4] = &unk_1E99CC2B8;
  v25[5] = &unk_1E99CC2B8;
  v24[6] = v8;
  v25[6] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v25, (uint64_t)v24, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v18;
  v34[2] = CFSTR("inputDistortionScaleMajorRadius");
  v22[0] = v2;
  v22[1] = v3;
  v23[0] = &unk_1E99CC278;
  v23[1] = &unk_1E99CC288;
  v22[2] = v4;
  v22[3] = v5;
  v23[2] = &unk_1E99CC298;
  v23[3] = &unk_1E99CC2A8;
  v22[4] = v6;
  v22[5] = v7;
  v23[4] = &unk_1E99CC2B8;
  v23[5] = &unk_1E99CC2B8;
  v22[6] = v8;
  v23[6] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v23, (uint64_t)v22, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v12;
  v34[3] = CFSTR("inputDistortionScaleMaxRadius");
  v20[0] = v2;
  v20[1] = v3;
  v21[0] = &unk_1E99CC278;
  v21[1] = &unk_1E99CC288;
  v20[2] = v4;
  v20[3] = v5;
  v21[2] = &unk_1E99CC298;
  v21[3] = &unk_1E99CC2A8;
  v20[4] = v6;
  v20[5] = v7;
  v21[4] = &unk_1E99CC2B8;
  v21[5] = &unk_1E99CC2B8;
  v20[6] = v8;
  v21[6] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v21, (uint64_t)v20, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v35, (uint64_t)v34, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_opt_class();
  return (id)MEMORY[0x1E0DE7D20](v2, sel_customAttributes, v3, v4, v5);
}

- (id)outputImage
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  float v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  float v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  float v37;
  float v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  float v43;
  float v44;
  _DWORD *v45;
  _DWORD *v46;
  void *v47;
  uint64_t v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  const float *v60;
  int8x16_t v61;
  float32x4_t v62;
  float32x4_t v68;
  float v70;
  float v71;
  float v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  float v80;
  float v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  float v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  double v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  double v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  id v117;
  id v118;
  id v119;
  void *v120;
  id v121;
  float (**v122)(_QWORD, float);
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unsigned __int8 v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  float v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  float v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  float v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  float v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  float v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  float v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  float v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  float v185;
  id v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  int v197;
  double v198;
  double v199;
  double v200;
  double v201;
  const char *v202;
  uint64_t v203;
  const char *v204;
  void *v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  void *v213;
  void *v214;
  void *v215;
  float v216;
  void *v217;
  float v218;
  void *v219;
  float v220;
  void *v221;
  void (**v222)(_QWORD);
  void *v223;
  void *v224;
  long double v225;
  long double v226;
  double v227;
  double v228;
  float v229;
  id v230;
  float v231;
  id v232;
  float32x4_t v233;
  id v234;
  _QWORD v235[4];
  id v236;
  _QWORD v237[4];
  id v238;
  id v239;
  _QWORD v240[4];
  id v241;
  id v242;
  id v243;
  id v244;
  id v245;
  id v246;
  _QWORD v247[5];
  _QWORD v248[6];
  _BYTE v249[20];
  int v250;
  float32x4_t v251;
  uint8_t buf[4];
  float32x4_t v253;
  uint64_t v254;

  v254 = *MEMORY[0x1E0C80C00];
  if (self->inputImage)
  {
    sub_1D52EB19C();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWSimpleLensCorrectionFilter", (const char *)&unk_1D548AF1A, buf, 2u);
    }

    v247[0] = MEMORY[0x1E0C809B0];
    v247[1] = 3221225472;
    v247[2] = sub_1D5352CE4;
    v247[3] = &unk_1E996F870;
    v247[4] = self;
    v222 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v247);
    objc_msgSend_extent(self->inputImage, v5, v6, v7, v8);
    v227 = v10;
    v228 = v9;
    v225 = v12;
    v226 = v11;
    *(float *)&v9 = v11;
    v13 = *(float *)&v9 * 0.5;
    *(float *)&v10 = v12;
    v14 = *(float *)&v10 * 0.5;
    if (v13 >= v14)
      v15 = v14;
    else
      v15 = v13;
    if (v13 <= v14)
      v16 = v14;
    else
      v16 = v13;
    v17 = hypotf(v13, v14);
    *(_DWORD *)buf = 0;
    v18 = (float)(v15 * 0.5) / v17;
    v19 = v15 / v17;
    v253.i64[0] = __PAIR64__(LODWORD(v19), LODWORD(v18));
    v20 = v16 / v17;
    v253.f32[2] = v16 / v17;
    v253.i32[3] = 1065353216;
    v250 = 0;
    *(_QWORD *)v249 = 0;
    *(_QWORD *)&v249[8] = 0;
    objc_msgSend_floatValue(self->inputDistortionScaleHalfMinorRadius, v21, v22, v23, v24);
    v26 = v25 * v18;
    v251.f32[0] = v25 * v18;
    objc_msgSend_floatValue(self->inputDistortionScaleMinorRadius, v27, v28, v29, v30);
    v32 = fminf(v31, 1.0) * v19;
    v251.f32[1] = v32;
    objc_msgSend_floatValue(self->inputDistortionScaleMajorRadius, v33, v34, v35, v36);
    v38 = fminf(v37, 1.0) * v20;
    v251.f32[2] = v38;
    objc_msgSend_floatValue(self->inputDistortionScaleMaxRadius, v39, v40, v41, v42);
    v44 = fminf(v43, 1.0);
    v251.f32[3] = v44;
    v45 = malloc_type_calloc(5uLL, 4uLL, 0x100004052888210uLL);
    v46 = malloc_type_calloc(5uLL, 4uLL, 0x100004052888210uLL);
    v47 = v46;
    v48 = 0;
    *v46 = 0;
    *v45 = 0;
    v49 = v26;
    v50 = v18;
    do
    {
      v51 = *(float *)&buf[v48 * 4];
      v52 = v50 - v51;
      v53 = v253.f32[v48 + 1];
      v54 = v53 - v51;
      v55 = v251.f32[v48 + 1];
      v56 = (float)(v55 - v49) / (float)(v53 - v50);
      v57 = (float)((float)(v52 / v54) * *(float *)&v45[v48]) + 2.0;
      v58 = (float)(v49 - *(float *)((char *)&v250 + v48 * 4)) / v52;
      *(float *)&v45[v48 + 1] = (float)((float)(v52 / v54) + -1.0) / v57;
      *(float *)&v46[v48 + 1] = (float)((float)((float)((float)(v56 - v58) * 6.0) / v54)
                                      - (float)((float)(v52 / v54) * *(float *)&v46[v48]))
                              / v57;
      ++v48;
      v49 = v55;
      v50 = v53;
    }
    while (v48 != 3);
    v220 = v26;
    *(_DWORD *)&v249[16] = 0;
    v59 = 0.0;
    do
    {
      v59 = *(float *)&v46[v48] + (float)(*(float *)&v45[v48] * v59);
      *(float *)&v249[v48 * 4] = v59;
      --v48;
    }
    while (v48 != -1);
    v60 = (const float *)v249;
    v61 = (int8x16_t)vld1q_dup_f32(v60);
    v62 = vsubq_f32(v253, (float32x4_t)vextq_s8((int8x16_t)0, (int8x16_t)v253, 0xCuLL));
    __asm { FMOV            V3.4S, #3.0 }
    v68 = vdivq_f32((float32x4_t)vextq_s8(v61, *(int8x16_t *)&v249[4], 0xCuLL), _Q3);
    __asm { FMOV            V3.4S, #6.0 }
    v233 = vmlsq_f32(vdivq_f32(vsubq_f32(v251, (float32x4_t)vextq_s8((int8x16_t)0, (int8x16_t)v251, 0xCuLL)), v62), vaddq_f32(v68, vdivq_f32(*(float32x4_t *)&v249[4], _Q3)), v62);
    v229 = v44;
    v231 = v38;
    v70 = v44 - v38;
    v71 = *(float *)&v249[12] / 6.0;
    v72 = *(float *)&v249[16] / 3.0;
    free(v45);
    free(v47);
    _V6.D[1] = v233.i64[1];
    _S4 = 981668463;
    __asm { FMLA            S1, S4, V6.S[2] }
    if (_S1 <= (float)(v19 + 0.001))
      v218 = v233.f32[2];
    else
      v218 = (float)((float)(v19 + 0.001) - v32) / 0.001;
    __asm { FMLA            S3, S4, V6.S[3] }
    if (_S3 <= (float)(v20 + 0.001))
      v80 = v233.f32[3];
    else
      v80 = (float)((float)(v20 + 0.001) - v231) / 0.001;
    v81 = (float)(v70 / (float)(1.0 - v20)) + (float)((float)(1.0 - v20) * (float)(v71 + v72));
    if ((float)(v231 + (float)(v80 * -0.001)) > (float)(v20 + -0.001))
      v80 = (float)((float)(v20 + -0.001) - v231) / -0.001;
    v216 = v80;
    if ((float)(v229 + (float)(v81 * -0.001)) > 0.999)
      v81 = (float)(0.999 - v229) / -0.001;
    objc_msgSend_kernelWithName_(LCKernels, v73, (uint64_t)CFSTR("simpleLens"), v74, v75);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(LCKernels, v82, (uint64_t)CFSTR("simpleLensDraft"), v83, v84);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = hypot(v226, v225);
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v86, v87, v88, v89, (double)(v228 + v226 * 0.5), (double)(v227 + v225 * 0.5), (float)(2.0 / v85), 1.0);
    v90 = v18;
    v91 = v20;
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v92, v93, v94, v95, v18, v19, v20, 1.0);
    v96 = v220;
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1D5352D68(0.0, 0.0, v233.f32[0], v90, v220, v233.f32[1], (uint64_t)v213, v97, v98, v99, v100);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v32;
    v102 = v218;
    sub_1D5352D68(v90, v96, v233.f32[1], v19, v101, v218, (uint64_t)v221, v103, v104, v105, v106);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v216;
    sub_1D5352D68(v19, v101, v102, v91, v231, v216, (uint64_t)v219, v108, v109, v110, v111);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1D5352D68(v91, v231, v107, 1.0, v229, v81, (uint64_t)v217, v112, v113, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v240[0] = MEMORY[0x1E0C809B0];
    v240[1] = 3221225472;
    v240[2] = sub_1D5352E70;
    v240[3] = &unk_1E9986F38;
    v117 = v214;
    v241 = v117;
    v230 = v221;
    v242 = v230;
    v232 = v219;
    v243 = v232;
    v118 = v217;
    v244 = v118;
    v234 = v116;
    v245 = v234;
    v119 = v213;
    v246 = v119;
    v120 = (void *)MEMORY[0x1D82721B4](v240);
    v237[0] = MEMORY[0x1E0C809B0];
    v237[1] = 3221225472;
    v237[2] = sub_1D5353000;
    v237[3] = &unk_1E9986F60;
    v121 = v117;
    v238 = v121;
    v122 = v120;
    v239 = v122;
    v215 = (void *)MEMORY[0x1D82721B4](v237);
    v127 = atomic_load((unsigned __int8 *)&qword_1EFF32718);
    if ((v127 & 1) == 0 && __cxa_guard_acquire(&qword_1EFF32718))
    {
      byte_1EFF32710 = getenv("RAWCAMERA_SIMPLELENSCORRECTION_LOGGING") != 0;
      __cxa_guard_release(&qword_1EFF32718);
    }
    if (byte_1EFF32710)
    {
      objc_msgSend_floatValue(self->inputFocalLength, v123, v124, v125, v126);
      printf("%g, array(", v128);
      v129 = v122[2](v122, 0.001);
      printf("0.0, %.5f, ", (float)(v129 / 0.001));
      v130 = v253.f32[0];
      v131 = v253.f32[0] * 0.5;
      v132 = v122[2](v122, v253.f32[0] * 0.5);
      printf("%.5f, %.5f, ", v131, (float)(v132 / v131));
      v133 = v251.f32[0];
      printf("%.5f, %.5f, ", v130, (float)(v251.f32[0] / v130));
      v134 = v253.f32[1];
      v135 = (float)(v130 + v253.f32[1]) * 0.5;
      v136 = v122[2](v122, v135);
      printf("%.5f, %.5f, ", v135, (float)(v136 / v135));
      v137 = v251.f32[1];
      printf("%.5f, %.5f, ", v134, (float)(v251.f32[1] / v134));
      v138 = v253.f32[2];
      v139 = (float)(v134 + v253.f32[2]) * 0.5;
      v140 = v122[2](v122, v139);
      printf("%.5f, %.5f, ", v139, (float)(v140 / v139));
      v141 = v251.f32[2];
      printf("%.5f, %.5f, ", v138, (float)(v251.f32[2] / v138));
      v142 = v253.f32[3];
      v143 = (float)(v138 + v253.f32[3]) * 0.5;
      v144 = v122[2](v122, v143);
      printf("%.5f, %.5f, ", v143, (float)(v144 / v143));
      v145 = v251.f32[3];
      printf("1.0, %.5f", (float)(v251.f32[3] / v142));
      objc_msgSend_floatValue(self->inputDistortionScaleHalfMinorRadius, v146, v147, v148, v149);
      v251.f32[0] = v133 * v150;
      objc_msgSend_floatValue(self->inputDistortionScaleMinorRadius, v151, v152, v153, v154);
      v251.f32[1] = v137 * fminf(v155, 1.0);
      objc_msgSend_floatValue(self->inputDistortionScaleMajorRadius, v156, v157, v158, v159);
      v251.f32[2] = v141 * fminf(v160, 1.0);
      objc_msgSend_floatValue(self->inputDistortionScaleMaxRadius, v161, v162, v163, v164);
      v251.f32[3] = v145 * fminf(v165, 1.0);
      printf(") <!-- ");
      objc_msgSend_floatValue(self->inputDistortionScaleHalfMinorRadius, v166, v167, v168, v169);
      printf("%.4f ", v170);
      objc_msgSend_floatValue(self->inputDistortionScaleMinorRadius, v171, v172, v173, v174);
      printf("%.4f ", fminf(v175, 1.0));
      objc_msgSend_floatValue(self->inputDistortionScaleMajorRadius, v176, v177, v178, v179);
      printf("%.4f ", fminf(v180, 1.0));
      objc_msgSend_floatValue(self->inputDistortionScaleMaxRadius, v181, v182, v183, v184);
      printf("%.4f ", fminf(v185, 1.0));
      puts("-->");
    }
    v235[0] = MEMORY[0x1E0C809B0];
    v235[1] = 3221225472;
    v235[2] = sub_1D53530C0;
    v235[3] = &unk_1E9986F88;
    v186 = v215;
    v236 = v186;
    v187 = (void *)MEMORY[0x1D82721B4](v235);
    objc_msgSend_imageByClampingToExtent(self->inputImage, v188, v189, v190, v191);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = objc_msgSend_BOOLValue(self->inputDraftMode, v193, v194, v195, v196);
    v198 = *MEMORY[0x1E0C9D5E0];
    v199 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v200 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v201 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    v248[0] = v121;
    v248[1] = v119;
    v248[2] = v230;
    v248[3] = v232;
    v248[4] = v118;
    v248[5] = v234;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v202, (uint64_t)v248, 6, v203);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    if (v197)
      objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v204, (uint64_t)v223, (uint64_t)v192, (uint64_t)v187, v205, self->inputColorSpace, v198, v199, v200, v201);
    else
      objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v204, (uint64_t)v224, (uint64_t)v192, (uint64_t)v187, v205, self->inputColorSpace, v198, v199, v200, v201);
    v206 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_imageByCroppingToRect_(v206, v207, v208, v209, v210, v228, v227, (double)v226, (double)v225);
    v211 = (void *)objc_claimAutoreleasedReturnValue();

    v222[2](v222);
  }
  else
  {
    v211 = 0;
  }
  return v211;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputFocalLength, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputDraftMode, 0);
  objc_storeStrong((id *)&self->inputDistortionScaleMaxRadius, 0);
  objc_storeStrong((id *)&self->inputDistortionScaleMajorRadius, 0);
  objc_storeStrong((id *)&self->inputDistortionScaleMinorRadius, 0);
  objc_storeStrong((id *)&self->inputDistortionScaleHalfMinorRadius, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
