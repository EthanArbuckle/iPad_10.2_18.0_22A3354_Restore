@implementation PanoramaGyroStage

- (PanoramaGyroStage)init
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_resetState(self, a2, v2, v3);
  fig_note_initialize_category_with_default_work();
  return self;
}

- (int)resetState
{
  uint64_t v2;
  __int128 v3;

  self->_isTranslationValid = 0;
  *(_OWORD *)self->_translationRate = 0u;
  *(_OWORD *)self->_translation = 0u;
  *(_OWORD *)self->_rotation = 0u;
  self->_curTime = -1.0;
  *(_QWORD *)&self->_focalLength = 0x457C000041CD999ALL;
  *(_QWORD *)&self->_sliceWidth = 1161625600;
  *(_QWORD *)self->_txty = 0;
  *(_QWORD *)&self->_txty[8] = 0;
  v2 = MEMORY[0x24BDAEDF8];
  v3 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
  *(_OWORD *)self->_anon_60 = *MEMORY[0x24BDAEDF8];
  *(_OWORD *)&self->_anon_60[16] = v3;
  *(_OWORD *)&self->_anon_60[32] = *(_OWORD *)(v2 + 32);
  return 0;
}

- (int)update:(id)a3 sliceType:(int)a4 sliceWidth:(float)a5 sliceHeight:(float)a6 sliceID:(int)a7
{
  uint64_t v10;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  unsigned int *BytePtr;
  const __CFData *v25;
  uint64_t v26;
  double HostTime;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  double v47;
  NSObject *v48;
  double v49;
  float v51[32];
  uint64_t v52;

  v10 = *(_QWORD *)&a4;
  v52 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v15 = v12;
  if (!v12)
  {
    LODWORD(BytePtr) = 2;
    goto LABEL_27;
  }
  objc_msgSend_objectForKey_(v12, v13, (uint64_t)CFSTR("FocalLenIn35mmFilm"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_objectForKeyedSubscript_(v15, v17, (uint64_t)CFSTR("FocalLenIn35mmFilm"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v19, v20, v21, v22);
    self->_focalLength = v23 / 17.5;

  }
  self->_sliceHeight = a6;
  self->_sliceWidth = a5;
  self->_motionSource = 0;
  if (!USE_ISP_MOTION)
  {
LABEL_11:
    LODWORD(BytePtr) = 0;
    goto LABEL_12;
  }
  objc_msgSend_objectForKey_(v15, v17, (uint64_t)CFSTR("DebugMotionDataFromISP"), v18);
  BytePtr = (unsigned int *)objc_claimAutoreleasedReturnValue();

  if (BytePtr)
  {
    objc_msgSend_objectForKeyedSubscript_(v15, v17, (uint64_t)CFSTR("DebugMotionDataFromISP"), v18);
    v25 = (const __CFData *)(id)objc_claimAutoreleasedReturnValue();
    BytePtr = (unsigned int *)CFDataGetBytePtr(v25);
    v26 = 104 * BytePtr[1] + 8;
    if (CFDataGetLength(v25) == v26 && BytePtr[1] >= 2)
    {
      LODWORD(BytePtr) = objc_msgSend_updateWithDebugISPMedian_(self, v17, (uint64_t)BytePtr, v18);
      if (!(_DWORD)BytePtr)
        self->_motionSource |= 1u;
      HostTime = getHostTime();
      panoLog(32, "FrameID:%04d time %.3f: gyro updated with debug motion data\n", a7, HostTime);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend_objectForKey_(v15, v17, (uint64_t)CFSTR("TransformMatrix"), v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend_objectForKeyedSubscript_(v15, v29, (uint64_t)CFSTR("TransformMatrix"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v31, v32, v33, v34) == 36)
    {
      objc_msgSend_getBytes_length_(v31, v35, (uint64_t)v51, 36);
      LODWORD(BytePtr) = objc_msgSend_updateWithTransformMatrix_sliceType_(self, v36, (uint64_t)v51, v10);
      if (!(_DWORD)BytePtr)
        self->_motionSource |= 2u;
      v37 = getHostTime();
      panoLog(32, "FrameID:%04d time %.3f: gyro updated with TransformMatrix\n", a7, v37);
    }

  }
  objc_msgSend_objectForKey_(v15, v29, (uint64_t)CFSTR("Translation"), v30);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend_objectForKeyedSubscript_(v15, v39, (uint64_t)CFSTR("Translation"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v41, v42, v43, v44) == 8)
    {
      objc_msgSend_getBytes_length_(v41, v45, (uint64_t)v51, 8);
      LODWORD(BytePtr) = objc_msgSend_updateWithTranslation_sliceType_(self, v46, (uint64_t)v51, v10);
      if (!(_DWORD)BytePtr)
        self->_motionSource |= 4u;
      v47 = getHostTime();
      panoLog(32, "FrameID:%04d time %.3f: gyro updated with txty = %f %f\n", a7, v47, v51[0], v51[1]);
    }

  }
  if (!self->_motionSource)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v48 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v49 = getHostTime();
    panoLog(4, "FrameID:%04d time %.3f: NO motion data available\n", a7, v49);
  }
LABEL_27:

  return (int)BytePtr;
}

- (int)updateWithTranslation:(float *)a3 sliceType:(int)a4
{
  __int128 v4;
  float32x2_t v5;

  *(_QWORD *)&v4 = *(_QWORD *)a3;
  if (a4)
    v5 = vsub_f32(*(float32x2_t *)&v4, *(float32x2_t *)self->_txty);
  else
    v5 = 0;
  *((float32x2_t *)&v4 + 1) = v5;
  *(_OWORD *)self->_txty = v4;
  return 0;
}

- (int)updateWithTransformMatrix:(float *)a3 sliceType:(int)a4
{
  uint64_t i;
  uint64_t v5;
  unsigned __int8 *anon_60;

  if (a4)
  {
    for (i = 0; i != 3; ++i)
    {
      v5 = 0;
      anon_60 = self->_anon_60;
      do
      {
        *(float *)&anon_60[4 * i] = a3[v5++];
        anon_60 += 16;
      }
      while (v5 != 3);
      a3 += 3;
    }
  }
  return 0;
}

- (int)updateWithDebugISPMedian:(id *)a3
{
  uint64_t var1;
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  int *p_var21;
  double v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  Float64 Seconds;
  double v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  double v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  PanoramaGyroStage *v74;
  double v75;
  double curTime;
  float v77;
  BOOL v78;
  float v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  float v106;
  float v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  float v115;
  float32x4_t v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  float v123;
  float v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  float v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  float v138;
  float v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  float v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  float v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  float v164;
  float32x4_t v165;
  float32x4_t v166;
  float32x4_t v167;
  float32x4_t v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  unsigned int v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  float v197;
  float v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  float v205;
  float32x4_t v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  float v213;
  float v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  float v221;
  const char *v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  float v228;
  float v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  float v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  float v248;
  const char *v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  float v254;
  float32x4_t v255;
  float32x4_t v256;
  unsigned int v258;
  void *v260;
  void *v261;
  float v262;
  void *v263;
  float v264;
  float32x4_t v265;
  unsigned int v266;
  void *v267;
  float v268;
  void *v269;
  float v270;
  float32x4_t v271;
  void *v272;
  int v273;
  void *v274;
  int v275;
  void *v276;
  int v277;
  float v278;
  CMTime time;

  var1 = a3->var1;
  v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v260 = (void *)objc_msgSend_initWithCapacity_(v5, v6, var1, v7);
  v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v261 = (void *)objc_msgSend_initWithCapacity_(v8, v9, var1, v10);
  v11 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v263 = (void *)objc_msgSend_initWithCapacity_(v11, v12, var1, v13);
  v14 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v267 = (void *)objc_msgSend_initWithCapacity_(v14, v15, var1, v16);
  v17 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v269 = (void *)objc_msgSend_initWithCapacity_(v17, v18, var1, v19);
  v20 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v272 = (void *)objc_msgSend_initWithCapacity_(v20, v21, var1, v22);
  v258 = var1;
  if ((_DWORD)var1)
  {
    v266 = 0;
    p_var21 = &a3->var2[0].var3.var2.var21;
    v26 = 0.0;
    do
    {
      v28 = *(p_var21 - 14);
      v27 = *(p_var21 - 13);
      v273 = *(p_var21 - 12);
      v30 = *(p_var21 - 7);
      v29 = *(p_var21 - 6);
      v31 = *(p_var21 - 5);
      v32 = *((unsigned __int16 *)p_var21 - 8);
      v33 = *(p_var21 - 2);
      v275 = *(p_var21 - 1);
      v277 = *p_var21;
      v34 = FigHostTimeToNanoseconds();
      CMTimeMake(&time, v34, 1000000000);
      Seconds = CMTimeGetSeconds(&time);
      v39 = Seconds;
      if (v32 == 1)
      {
        *(float *)&Seconds = -(float)(v30 - v28);
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v35, v36, v37, Seconds);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v260, v41, (uint64_t)v40, v42);

        *(float *)&v43 = -(float)(v29 - v27);
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v44, v45, v46, v43);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v261, v48, (uint64_t)v47, v49);

        *(float *)&v50 = (float)(v31 - v273);
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v51, v52, v53, v50);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v263, v55, (uint64_t)v54, v56);

        ++v266;
      }
      v26 = v26 + v39;
      p_var21 += 26;
      *(float *)&Seconds = -(float)v33;
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v35, v36, v37, Seconds);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v267, v58, (uint64_t)v57, v59);

      *(float *)&v60 = -(float)v275;
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v61, v62, v63, v60);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v269, v65, (uint64_t)v64, v66);

      *(float *)&v67 = -(float)v277;
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v68, v69, v70, v67);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v272, v72, (uint64_t)v71, v73);

      --var1;
    }
    while (var1);
  }
  else
  {
    v266 = 0;
    v26 = 0.0;
  }
  v74 = self;
  v75 = v26 / (double)v258;
  curTime = self->_curTime;
  v77 = v75 - curTime;
  v78 = curTime <= 0.0;
  v79 = 0.0333;
  if (!v78)
    v79 = v77;
  v278 = v79;
  self->_curTime = v75;
  objc_msgSend_sortedArrayUsingSelector_(v260, v23, (uint64_t)sel_compare_, v24);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend_mutableCopy(v80, v81, v82, v83);

  objc_msgSend_sortedArrayUsingSelector_(v261, v85, (uint64_t)sel_compare_, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = (void *)objc_msgSend_mutableCopy(v87, v88, v89, v90);

  objc_msgSend_sortedArrayUsingSelector_(v263, v92, (uint64_t)sel_compare_, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)objc_msgSend_mutableCopy(v94, v95, v96, v97);

  v101 = v266 >> 1;
  v274 = v98;
  v276 = v91;
  if ((v266 & 1) != 0)
  {
    objc_msgSend_objectAtIndex_(v84, v99, v266 >> 1, v100);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v147, v148, v149, v150);
    v265.i64[0] = v151;

    objc_msgSend_objectAtIndex_(v91, v152, v101, v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v154, v155, v156, v157);
    v264 = v158;

    objc_msgSend_objectAtIndex_(v98, v159, v101, v160);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v134, v161, v162, v163);
    v262 = v164;
  }
  else
  {
    objc_msgSend_objectAtIndex_(v84, v99, (v101 - 1), v100);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v102, v103, v104, v105);
    v107 = v106;
    objc_msgSend_objectAtIndex_(v84, v108, v101, v109);
    v110 = v84;
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v111, v112, v113, v114);
    v116.f32[0] = (float)(v107 + v115) * 0.5;
    v265 = v116;

    objc_msgSend_objectAtIndex_(v91, v117, (v101 - 1), v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v119, v120, v121, v122);
    v124 = v123;
    objc_msgSend_objectAtIndex_(v91, v125, v101, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v127, v128, v129, v130);
    v264 = (float)(v124 + v131) * 0.5;

    v84 = v110;
    objc_msgSend_objectAtIndex_(v98, v132, (v101 - 1), v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v134, v135, v136, v137);
    v139 = v138;
    objc_msgSend_objectAtIndex_(v98, v140, v101, v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v142, v143, v144, v145);
    v262 = (float)(v139 + v146) * 0.5;

  }
  v165 = v265;
  v165.f32[1] = v264;
  v165.f32[2] = v262;
  v166 = vmulq_f32(vmulq_f32(v165, (float32x4_t)vdupq_n_s32(0x411CCCCDu)), (float32x4_t)vdupq_n_s32(0x37800000u));
  v167.i64[0] = 0x3F0000003F000000;
  v167.i64[1] = 0x3F0000003F000000;
  v168 = vmulq_n_f32(vmlaq_n_f32(*(float32x4_t *)self->_translationRate, vmulq_f32(v166, v167), v278), v278);
  *(float32x4_t *)self->_translationRate = vmlaq_n_f32(*(float32x4_t *)self->_translationRate, v166, v278);
  *(float32x4_t *)self->_translation = v168;
  objc_msgSend_sortedArrayUsingSelector_(v267, v169, (uint64_t)sel_compare_, v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = (void *)objc_msgSend_mutableCopy(v171, v172, v173, v174);

  objc_msgSend_sortedArrayUsingSelector_(v269, v176, (uint64_t)sel_compare_, v177);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = (void *)objc_msgSend_mutableCopy(v178, v179, v180, v181);

  objc_msgSend_sortedArrayUsingSelector_(v272, v183, (uint64_t)sel_compare_, v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = (void *)objc_msgSend_mutableCopy(v185, v186, v187, v188);

  v192 = v258 >> 1;
  if ((v258 & 1) != 0)
  {
    objc_msgSend_objectAtIndex_(v175, v190, v192, v191);
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v237, v238, v239, v240);
    v271.i64[0] = v241;

    objc_msgSend_objectAtIndex_(v182, v242, v192, v243);
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v244, v245, v246, v247);
    v270 = v248;

    objc_msgSend_objectAtIndex_(v189, v249, v192, v250);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v224, v251, v252, v253);
    v268 = v254;
  }
  else
  {
    objc_msgSend_objectAtIndex_(v175, v190, v192 - 1, v191);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v193, v194, v195, v196);
    v198 = v197;
    objc_msgSend_objectAtIndex_(v175, v199, v192, v200);
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v201, v202, v203, v204);
    v206.f32[0] = (float)(v198 + v205) * 0.5;
    v271 = v206;

    objc_msgSend_objectAtIndex_(v182, v207, v192 - 1, v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v209, v210, v211, v212);
    v214 = v213;
    objc_msgSend_objectAtIndex_(v182, v215, v192, v216);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v217, v218, v219, v220);
    v270 = (float)(v214 + v221) * 0.5;

    v74 = self;
    objc_msgSend_objectAtIndex_(v189, v222, v192 - 1, v223);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v224, v225, v226, v227);
    v229 = v228;
    objc_msgSend_objectAtIndex_(v189, v230, v192, v231);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v232, v233, v234, v235);
    v268 = (float)(v229 + v236) * 0.5;

  }
  v255 = v271;
  v255.f32[1] = v270;
  v255.f32[2] = v268;
  v256 = vmulq_n_f32(vmulq_f32(v255, (float32x4_t)vdupq_n_s32(0x37800000u)), v278);
  *(float32x4_t *)v74->_rotation = v256;
  if (!v74->_isTranslationValid)
    *(_OWORD *)v74->_translation = COERCE_UNSIGNED_INT(vmuls_lane_f32(0.1, *(float32x2_t *)v256.f32, 1));

  return 0;
}

- (_DWORD)toHomography
{
  int v4;

  v4 = result[39];
  if ((v4 & 1) != 0)
    return (_DWORD *)objc_msgSend_ISPMotionToHomography(result, a2, a3, a4);
  if ((v4 & 4) != 0)
    return (_DWORD *)objc_msgSend_translationToHomography(result, a2, a3, a4);
  return result;
}

- (double)transformToHomography
{
  uint64_t v7;
  float32x4_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  float32x4_t v12;
  float32x4_t v13;
  uint64_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  _OWORD v19[2];
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;

  v7 = 0;
  v9 = *MEMORY[0x24BDAEDF8];
  v8 = *(float32x4_t *)(MEMORY[0x24BDAEDF8] + 16);
  LODWORD(v10) = a1[9].i32[1];
  a7.f32[0] = 1.0 / *(float *)&v10;
  DWORD1(v10) = HIDWORD(*MEMORY[0x24BDAEDF8]);
  DWORD2(v10) = *(_QWORD *)(MEMORY[0x24BDAEDF8] + 8);
  LODWORD(v11) = v8.i32[0];
  DWORD1(v11) = a1[9].i32[2];
  DWORD2(v11) = *(_QWORD *)(MEMORY[0x24BDAEDF8] + 24);
  a7.i32[1] = DWORD1(v10);
  a7.i32[2] = DWORD2(v10);
  v13 = v8;
  v13.f32[1] = 1.0 / *((float *)&v11 + 1);
  v12 = *(float32x4_t *)(MEMORY[0x24BDAEDF8] + 32);
  v13.i32[2] = DWORD2(v11);
  v20 = a1[8];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v21 + v7 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a7, COERCE_FLOAT(v19[v7])), v13, *(float32x2_t *)&v19[v7], 1), v12, (float32x4_t)v19[v7], 2);
    ++v7;
  }
  while (v7 != 3);
  v14 = 0;
  HIDWORD(v10) = HIDWORD(v9);
  HIDWORD(v11) = v8.i32[3];
  v15 = v21;
  v16 = v22;
  v17 = v23;
  v19[0] = v10;
  v19[1] = v11;
  v20 = v12;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v21 + v14 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(v19[v14])), v16, *(float32x2_t *)&v19[v14], 1), v17, (float32x4_t)v19[v14], 2);
    ++v14;
  }
  while (v14 != 3);
  return *(double *)v21.i64;
}

- (__n128)translationToHomography
{
  return *(__n128 *)MEMORY[0x24BDAEDF8];
}

- (double)ISPMotionToHomography
{
  __float2 v2;
  __float2 v3;
  unint64_t v4;
  uint64_t v5;
  simd_float3 v6;
  simd_float3 v7;
  simd_float3 v8;
  simd_float3 v9;
  float32x4_t v10;
  uint64_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  uint64_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  __int128 v19;
  unint64_t v20;
  float32x4_t v21;
  simd_float3 v22;
  uint64_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  __int128 v28;
  float32x4_t v29;
  simd_float3 v30;
  float32x4_t v31;
  uint64_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  uint64_t v38;
  uint64_t v39;
  double result;
  __int32 cosval_low;
  float v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  simd_float3x3 v46;
  simd_float3 v47;
  simd_float3 v48;
  simd_float3 v49;
  simd_float3x3 v50;

  v2 = __sincosf_stret(*(float *)(a1 + 64));
  cosval_low = LODWORD(v2.__cosval);
  LODWORD(v42) = *(_QWORD *)&v2;
  v3 = __sincosf_stret(*(float *)(a1 + 68));
  v4 = (unint64_t)__sincosf_stret(*(float *)(a1 + 72));
  v5 = 0;
  v6.i32[0] = 0;
  v6.i32[3] = 0;
  v6.i32[1] = cosval_low;
  v7.i32[0] = 0;
  v7.i32[3] = 0;
  v7.f32[1] = v42;
  v8.i64[0] = LODWORD(v3.__cosval);
  v8.i64[1] = LODWORD(v3.__sinval);
  v9.i32[1] = 0;
  v9.f32[0] = -v3.__sinval;
  v9.i64[1] = LODWORD(v3.__cosval);
  v10.i64[1] = 0;
  v10.i32[0] = HIDWORD(v4);
  v46.columns[0] = v8;
  v46.columns[1] = (simd_float3)xmmword_22764C2F0;
  v46.columns[2] = v9;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  do
  {
    v10.f32[1] = -*(float *)&v4;
    *(float32x4_t *)((char *)&v47 + v5 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, COERCE_FLOAT(*(_OWORD *)&v46.columns[v5])), (float32x4_t)v4, *(float32x2_t *)v46.columns[v5].f32, 1), (float32x4_t)xmmword_22764C2E0, (float32x4_t)v46.columns[v5], 2);
    ++v5;
  }
  while (v5 != 3);
  v11 = 0;
  v6.f32[2] = -v42;
  v7.i32[2] = cosval_low;
  v12 = (float32x4_t)v47;
  v13 = (float32x4_t)v48;
  v14 = (float32x4_t)v49;
  v46.columns[0] = (simd_float3)xmmword_22764C300;
  v46.columns[1] = v6;
  v46.columns[2] = v7;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v47 + v11 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v12, COERCE_FLOAT(*(_OWORD *)&v46.columns[v11])), v13, *(float32x2_t *)v46.columns[v11].f32, 1), v14, (float32x4_t)v46.columns[v11], 2);
    ++v11;
  }
  while (v11 != 3);
  v15 = 0;
  v16 = (float32x4_t)v47;
  v17 = (float32x4_t)v48;
  v18 = (float32x4_t)v49;
  v19 = *(_OWORD *)(a1 + 48);
  LODWORD(v20) = 0;
  HIDWORD(v20) = HIDWORD(*(_QWORD *)(a1 + 48));
  v21.i32[3] = 0;
  v22.i64[0] = 0;
  v22.i64[1] = *(_QWORD *)(a1 + 56);
  v46.columns[0] = (simd_float3)v19;
  v46.columns[1] = (simd_float3)v20;
  v46.columns[2] = v22;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v47 + v15 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)&v46.columns[v15])), v18, *(float32x2_t *)v46.columns[v15].f32, 1), v18, (float32x4_t)v46.columns[v15], 2);
    ++v15;
  }
  while (v15 != 3);
  v23 = 0;
  v24 = vmulq_n_f32(v18, 1.0 - *((float *)&v19 + 2));
  v25 = vaddq_f32(vmulq_n_f32(v16, 1.0 - *((float *)&v19 + 2)), (float32x4_t)v47);
  v26 = vaddq_f32(vmulq_n_f32(v17, 1.0 - *((float *)&v19 + 2)), (float32x4_t)v48);
  v28 = *MEMORY[0x24BDAEDF8];
  v27 = *(float32x4_t *)(MEMORY[0x24BDAEDF8] + 16);
  v18.i32[0] = v27.i32[0];
  v18.i32[1] = *(_DWORD *)(a1 + 144);
  v30.f32[0] = v18.f32[1] * (float)(*(float *)(a1 + 148) / *(float *)(a1 + 152));
  v31 = v27;
  v31.f32[1] = 1.0 / v18.f32[1];
  v29 = *(float32x4_t *)(MEMORY[0x24BDAEDF8] + 32);
  v21.f32[0] = 1.0 / v30.f32[0];
  v30.i32[1] = HIDWORD(*MEMORY[0x24BDAEDF8]);
  v30.i32[2] = *(_QWORD *)(MEMORY[0x24BDAEDF8] + 8);
  v18.i32[2] = *(_QWORD *)(MEMORY[0x24BDAEDF8] + 24);
  v21.i32[1] = v30.i32[1];
  v21.i32[2] = v30.i32[2];
  v31.i32[2] = v18.i32[2];
  v46.columns[0] = (simd_float3)v25;
  v46.columns[1] = (simd_float3)v26;
  v46.columns[2] = (simd_float3)vaddq_f32(v24, (float32x4_t)v49);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v47 + v23 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(_OWORD *)&v46.columns[v23])), v31, *(float32x2_t *)v46.columns[v23].f32, 1), v29, (float32x4_t)v46.columns[v23], 2);
    ++v23;
  }
  while (v23 != 3);
  v32 = 0;
  v30.i32[3] = HIDWORD(v28);
  v18.i32[3] = v27.i32[3];
  v33 = (float32x4_t)v47;
  v34 = (float32x4_t)v48;
  v35 = (float32x4_t)v49;
  v46.columns[0] = v30;
  v46.columns[1] = (simd_float3)v18;
  v46.columns[2] = (simd_float3)v29;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v47 + v32 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v33, COERCE_FLOAT(*(_OWORD *)&v46.columns[v32])), v34, *(float32x2_t *)v46.columns[v32].f32, 1), v35, (float32x4_t)v46.columns[v32], 2);
    ++v32;
  }
  while (v32 != 3);
  v36 = vzip1q_s32((int32x4_t)v47, (int32x4_t)v48);
  v36.i32[2] = v49.i32[0];
  v37 = vzip2q_s32((int32x4_t)v47, (int32x4_t)v48);
  v37.i32[2] = v49.i32[2];
  v44 = (float32x4_t)v37;
  v45 = (float32x4_t)v36;
  v43 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v47, (int32x4_t)v49), vdupq_lane_s32(*(int32x2_t *)v48.f32, 1));
  v50 = __invert_f3(*(simd_float3x3 *)byte_22764C730);
  v38 = 0;
  v46 = v50;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v47 + v38 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v45, COERCE_FLOAT(*(_OWORD *)&v46.columns[v38])), v43, *(float32x2_t *)v46.columns[v38].f32, 1), v44, (float32x4_t)v46.columns[v38], 2);
    ++v38;
  }
  while (v38 != 3);
  v39 = 0;
  v46.columns[0] = v47;
  v46.columns[1] = v48;
  v46.columns[2] = v49;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v47 + v39 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_22764C700, COERCE_FLOAT(*(_OWORD *)&v46.columns[v39])), (float32x4_t)xmmword_22764C710, *(float32x2_t *)v46.columns[v39].f32, 1), (float32x4_t)xmmword_22764C720, (float32x4_t)v46.columns[v39], 2);
    ++v39;
  }
  while (v39 != 3);
  *(_QWORD *)&result = vmulq_n_f32((float32x4_t)v47, 1.0 / v49.f32[2]).u64[0];
  return result;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return 0;
}

- (int)prewarm
{
  return 0;
}

- (int)process
{
  return 0;
}

- (int)purgeResources
{
  return 0;
}

- (int)setup
{
  return 0;
}

- (int)finishProcessing
{
  return 0;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->cameraInfoByPortType, a3);
}

- (NSDictionary)tuningParameters
{
  return self->tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->tuningParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tuningParameters, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
}

@end
