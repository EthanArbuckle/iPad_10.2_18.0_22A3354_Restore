@implementation SCNSkinner(AVTExtension)

- (double)avt_simdBaseGeometryBindTransform
{
  double v2;

  objc_msgSend(a1, "baseGeometryBindTransform");
  return v2;
}

- (uint64_t)avt_setSimdBaseGeometryBindTransform:()AVTExtension
{
  _OWORD v6[4];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  return objc_msgSend(a1, "setBaseGeometryBindTransform:", v6);
}

+ (id)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:
{
  id v8;
  id v9;
  id v10;
  float v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int32x2_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  void *v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  char v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  void *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  id v89;
  BOOL v90;
  char v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  char *v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unsigned __int8 v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unsigned int *v129;
  unsigned int v130;
  uint64_t v131;
  unint64_t v134;
  size_t v135;
  float *v136;
  uint64_t v137;
  uint64_t v138;
  float32x4_t v139;
  float32x4_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  float v145;
  float *v146;
  char *v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;
  uint64_t v163;
  unint64_t v164;
  uint64_t v165;
  uint64_t v167;
  uint64_t v168;
  unsigned int *v169;
  float *v170;
  unsigned int v171;
  uint64_t v172;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  id v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  id v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  id v187;
  id v188;
  float32x4_t v189;
  float32x4_t v190;
  float32x4_t v191;
  float32x4_t v192;
  float32x4_t v193;
  float32x4_t v194;
  float32x4_t v195;
  float32x4_t v196;
  uint64_t v197;
  size_t v198;
  size_t v199;
  id v200;
  id v201;
  id v202;
  id v203;
  uint64_t *v204;
  id v205;
  id v206;
  float32x4_t v207;
  __int128 v208;
  id v209;
  id v210;
  id v211;
  char *v212;
  char *v213;
  float32x4_t v214;
  float32x4_t v215;
  float32x4_t v216;
  float32x4_t v217;
  float32x4_t v218;
  float32x4_t v219;
  float32x4_t v220;
  float32x4_t v221;
  id v222;
  id v223;
  id v224;
  id v225;
  id v226;
  _QWORD v227[5];
  _QWORD v228[5];
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  uint64_t v244;

  *(double *)&v208 = a1;
  v244 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a6;
  v11 = *(float *)&v208;
  v12 = v10;
  if (!v10)
  {
    avt_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:].cold.11(v13, v14, v15, v16, v17, v18, v19, v20);

    v11 = *(float *)&v208;
  }
  if (v11 == 0.0)
  {
    objc_msgSend(v8, "setSkeleton:", v12);
    v21 = v8;
LABEL_9:
    v22 = v21;
    goto LABEL_10;
  }
  if (v11 == 1.0)
  {
    objc_msgSend(v9, "setSkeleton:", v12);
    v21 = v9;
    goto LABEL_9;
  }
  v223 = v12;
  objc_msgSend(v8, "bones");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bones");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boneInverseBindTransforms");
  v211 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "boneInverseBindTransforms");
  v210 = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v237 = 0u;
  v238 = 0u;
  v239 = 0u;
  v240 = 0u;
  v225 = v24;
  v27 = objc_msgSend(v225, "countByEnumeratingWithState:objects:count:", &v237, v243, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v238;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v238 != v29)
          objc_enumerationMutation(v225);
        objc_msgSend(*(id *)(*((_QWORD *)&v237 + 1) + 8 * i), "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v31);

      }
      v28 = objc_msgSend(v225, "countByEnumeratingWithState:objects:count:", &v237, v243, 16);
    }
    while (v28);
  }
  v206 = v8;

  v235 = 0u;
  v236 = 0u;
  v233 = 0u;
  v234 = 0u;
  v224 = v25;
  v32 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v233, v242, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v234;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v234 != v34)
          objc_enumerationMutation(v224);
        objc_msgSend(*(id *)(*((_QWORD *)&v233 + 1) + 8 * j), "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v36);

      }
      v33 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v233, v242, 16);
    }
    while (v33);
  }
  v205 = v9;
  v37 = v224;

  v38 = objc_msgSend(v26, "count");
  objc_msgSend(v225, "count");
  v204 = &v197;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v213 = (char *)&v197 - v39;
  objc_msgSend(v37, "count");
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v212 = (char *)&v197 - v40;
  v226 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v38);
  v222 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v38);
  v229 = 0u;
  v230 = 0u;
  v231 = 0u;
  v232 = 0u;
  v209 = v26;
  v41 = objc_msgSend(v209, "countByEnumeratingWithState:objects:count:", &v229, v241, 16);
  if (v41)
  {
    v43 = v41;
    v44 = *(_QWORD *)v230;
    *(float *)v42.i32 = 1.0 - *(float *)&v208;
    v207 = (float32x4_t)vdupq_lane_s32(v42, 0);
    v45 = MEMORY[0x1E0C809B0];
    do
    {
      for (k = 0; k != v43; ++k)
      {
        if (*(_QWORD *)v230 != v44)
          objc_enumerationMutation(v209);
        v47 = *(_QWORD *)(*((_QWORD *)&v229 + 1) + 8 * k);
        v228[0] = v45;
        v228[1] = 3221225472;
        v228[2] = __92__SCNSkinner_AVTExtension__avt_skinnerByInterpolatingFromSkinner_toSkinner_factor_skeleton___block_invoke;
        v228[3] = &unk_1EA61FC38;
        v228[4] = v47;
        v48 = objc_msgSend(v225, "indexOfObjectPassingTest:", v228);
        v227[0] = v45;
        v227[1] = 3221225472;
        v227[2] = __92__SCNSkinner_AVTExtension__avt_skinnerByInterpolatingFromSkinner_toSkinner_factor_skeleton___block_invoke_2;
        v227[3] = &unk_1EA61FC38;
        v227[4] = v47;
        v49 = objc_msgSend(v224, "indexOfObjectPassingTest:", v227);
        v50 = objc_msgSend(v226, "count");
        if (v48 == 0x7FFFFFFFFFFFFFFFLL || v49 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v48 == 0x7FFFFFFFFFFFFFFFLL)
          {
            *(_QWORD *)&v212[8 * v49] = v50;
            v62 = v210;
            v63 = v49;
          }
          else
          {
            *(_QWORD *)&v213[8 * v48] = v50;
            v62 = v211;
            v63 = v48;
          }
          objc_msgSend(v62, "objectAtIndexedSubscript:", v63);
          v61 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          *(_QWORD *)&v213[8 * v48] = v50;
          *(_QWORD *)&v212[8 * v49] = v50;
          objc_msgSend(v211, "objectAtIndexedSubscript:", v48);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "avt_float4x4Value");
          v218 = v52;
          v219 = v53;
          v220 = v54;
          v221 = v55;

          objc_msgSend(v210, "objectAtIndexedSubscript:", v49);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "avt_float4x4Value");
          v214 = v57;
          v215 = v58;
          v216 = v59;
          v217 = v60;

          objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4x4:", *(double *)vmlaq_f32(vmulq_n_f32(v214, *(float *)&v208), v218, v207).i64, *(double *)vmlaq_f32(vmulq_n_f32(v215, *(float *)&v208), v219, v207).i64, *(double *)vmlaq_f32(vmulq_n_f32(v216, *(float *)&v208), v220, v207).i64, *(double *)vmlaq_f32(vmulq_n_f32(v217, *(float *)&v208), v221, v207).i64);
          v61 = objc_claimAutoreleasedReturnValue();
        }
        v64 = (void *)v61;
        objc_msgSend(v222, "addObject:", v61);

        objc_msgSend(v223, "childNodeWithName:recursively:", v47, 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v226, "addObject:", v65);

      }
      v43 = objc_msgSend(v209, "countByEnumeratingWithState:objects:count:", &v229, v241, 16);
    }
    while (v43);
  }

  v66 = v206;
  objc_msgSend(v206, "boneWeights");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v216.i64[0] = objc_msgSend(v67, "bytesPerComponent");
  objc_msgSend(v67, "data");
  v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v215.i64[0] = objc_msgSend(v68, "bytes");

  v218.i64[0] = objc_msgSend(v67, "componentsPerVector");
  objc_msgSend(v66, "boneIndices");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v214.i64[0] = objc_msgSend(v69, "bytesPerComponent");
  objc_msgSend(v69, "data");
  v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v207.i64[0] = objc_msgSend(v70, "bytes");

  v203 = v69;
  if (v67)
    _ZF = v69 == 0;
  else
    _ZF = 1;
  v72 = _ZF;
  if (_ZF)
  {
    v73 = objc_msgSend(v225, "count");
    v82 = v205;
    if (v73 != 1)
    {
      avt_default_log();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:].cold.10(v74, v75, v76, v77, v78, v79, v80, v81);

    }
    v218.i64[0] = 1;
  }
  else
  {
    v82 = v205;
  }
  objc_msgSend(v82, "boneWeights");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v83, "bytesPerComponent");
  objc_msgSend(v83, "data");
  v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v221.i64[0] = objc_msgSend(v85, "bytes");

  v86 = objc_msgSend(v83, "componentsPerVector");
  objc_msgSend(v82, "boneIndices");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "bytesPerComponent");
  objc_msgSend(v87, "data");
  v89 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v220.i64[0] = objc_msgSend(v89, "bytes");

  v201 = v87;
  v202 = v83;
  if (v83)
    v90 = v87 == 0;
  else
    v90 = 1;
  v91 = v90;
  if (v90)
  {
    if (objc_msgSend(v224, "count") != 1)
    {
      avt_default_log();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:].cold.9(v92, v93, v94, v95, v96, v97, v98, v99);

    }
    v86 = 1;
  }
  v100 = objc_msgSend(v67, "vectorCount");
  v101 = MEMORY[0x1E0C80A78](v100);
  v104 = (char *)&v197 - v103;
  v105 = 0;
  v219.i64[0] = v101;
  if (v101)
  {
    v107 = (uint64_t)v212;
    v106 = (uint64_t)v213;
    v108 = v216.i64[0];
    v109 = v215.i64[0];
    v110 = v214.i64[0];
    v111 = v207.i64[0];
    v112 = v218.i64[0];
    if (v102)
    {
      v113 = 0;
      v114 = 0;
      v105 = 0;
      while (1)
      {
        v115 = 0;
        if (v112)
        {
          v116 = v113;
          do
          {
            if ((v72 & 1) != 0)
            {
              v117 = 0;
            }
            else
            {
              switch(v108)
              {
                case 8:
                  _S0 = *(double *)(v109 + 8 * v116);
                  break;
                case 4:
                  _S0 = *(float *)(v109 + 4 * v116);
                  break;
                case 2:
                  _H0 = *(_WORD *)(v109 + 2 * v116);
                  __asm { FCVT            S0, H0 }
                  break;
                default:
                  +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:].cold.1(v101, v106, v107);
              }
              if (_S0 <= 0.0)
                goto LABEL_84;
              switch(v110)
              {
                case 4:
                  v117 = *(unsigned int *)(v111 + 4 * v116);
                  break;
                case 2:
                  v117 = *(unsigned __int16 *)(v111 + 2 * v116);
                  break;
                case 1:
                  v117 = *(unsigned __int8 *)(v111 + v116);
                  break;
                default:
                  +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:].cold.2(v101, v106, v107);
              }
            }
            v118 = v115++;
            *(_DWORD *)&v104[4 * v118] = *(_QWORD *)(v106 + 8 * v117);
LABEL_84:
            ++v116;
            --v112;
          }
          while (v112);
        }
        if (v86)
          break;
LABEL_114:
        if (v105 <= v115)
          v134 = v115;
        else
          v134 = v105;
        if ((unint64_t)++v114 >= v219.i64[0])
        {
          v105 = v134;
          goto LABEL_121;
        }
        v112 = v218.i64[0];
        v113 += v218.i64[0];
        v105 = v134;
        if (v134 >= v102)
          goto LABEL_121;
      }
      v124 = 0;
      while ((v91 & 1) == 0)
      {
        v131 = v124 + v114 * v86;
        switch(v84)
        {
          case 8:
            _S0 = *(double *)(v221.i64[0] + 8 * v131);
            break;
          case 4:
            _S0 = *(float *)(v221.i64[0] + 4 * v131);
            break;
          case 2:
            _H0 = *(_WORD *)(v221.i64[0] + 2 * v131);
            __asm { FCVT            S0, H0 }
            break;
          default:
            +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:].cold.1(v101, v106, v107);
        }
        if (_S0 > 0.0)
        {
          switch(v88)
          {
            case 4:
              v125 = *(unsigned int *)(v220.i64[0] + 4 * v131);
              break;
            case 2:
              v125 = *(unsigned __int16 *)(v220.i64[0] + 2 * v131);
              break;
            case 1:
              v125 = *(unsigned __int8 *)(v220.i64[0] + v131);
              break;
            default:
              +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:].cold.2(v101, v106, v107);
          }
LABEL_92:
          v126 = *(_QWORD *)(v107 + 8 * v125);
          if (v115)
          {
            v127 = v115;
            v128 = v115;
            v129 = (unsigned int *)v104;
            while (1)
            {
              v130 = *v129++;
              v101 = v130;
              if (v130 == (_DWORD)v126)
                break;
              if (!--v128)
                goto LABEL_102;
            }
          }
          else
          {
            v127 = 0;
LABEL_102:
            ++v115;
            *(_DWORD *)&v104[4 * v127] = v126;
          }
        }
        if (++v124 == v86)
          goto LABEL_114;
      }
      v125 = 0;
      goto LABEL_92;
    }
  }
LABEL_121:
  v197 = v88;
  v200 = v67;
  v135 = v105 * v219.i64[0];
  v198 = 4 * v105 * v219.i64[0];
  v136 = (float *)malloc_type_malloc(v198, 0x20175611uLL);
  v199 = v135;
  v137 = (uint64_t)malloc_type_malloc(v135, 0x697AD132uLL);
  v141 = v137;
  v217.i64[0] = 4 * v105;
  if (v219.i64[0])
  {
    v142 = v105;
    v143 = 0;
    v144 = 0;
    v145 = *(float *)&v208;
    v140.f32[0] = 1.0 - *(float *)&v208;
    v146 = v136;
    v148 = v212;
    v147 = v213;
    v149 = v216.i64[0];
    v150 = v215.i64[0];
    v151 = v214.i64[0];
    v152 = v207.i64[0];
    v153 = v218.i64[0];
    v154 = v197;
    while (1)
    {
      if (v153)
      {
        v155 = v153;
        LODWORD(v153) = 0;
        v156 = v143;
        do
        {
          if ((v72 & 1) != 0)
          {
            v157 = 0;
            _S0 = 1.0;
          }
          else
          {
            switch(v149)
            {
              case 8:
                _S0 = *(double *)(v150 + 8 * v156);
                break;
              case 4:
                _S0 = *(float *)(v150 + 4 * v156);
                break;
              case 2:
                _H0 = *(_WORD *)(v150 + 2 * v156);
                __asm { FCVT            S0, H0 }
                break;
              default:
                +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:].cold.1(v137, v142, v138);
            }
            if (_S0 <= 0.0)
              goto LABEL_139;
            switch(v151)
            {
              case 4:
                v157 = *(unsigned int *)(v152 + 4 * v156);
                break;
              case 2:
                v157 = *(unsigned __int16 *)(v152 + 2 * v156);
                break;
              case 1:
                v157 = *(unsigned __int8 *)(v152 + v156);
                break;
              default:
                +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:].cold.2(v137, v142, v138);
            }
          }
          v159 = *(_QWORD *)&v147[8 * v157];
          v160 = v144 * v142 + v153;
          v136[v160] = v140.f32[0] * _S0;
          v161 = v153;
          *(_BYTE *)(v141 + v160) = v159;
          LODWORD(v153) = v153 + 1;
          *(_DWORD *)&v104[4 * v161] = v159;
LABEL_139:
          ++v156;
          --v155;
        }
        while (v155);
      }
      if (v86)
        break;
LABEL_170:
      if (v142 > v153)
      {
        v174 = v153;
        do
        {
          v175 = v174 + v144 * v142;
          v136[v175] = 0.0;
          *(_BYTE *)(v141 + v175) = 0;
          LODWORD(v153) = v153 + 1;
          v174 = v153;
        }
        while (v142 > v153);
      }
      ++v144;
      v153 = v218.i64[0];
      v143 += v218.i64[0];
      v146 = (float *)((char *)v146 + v217.i64[0]);
      if (v144 == v219.i64[0])
      {
        v221 = v140;
        goto LABEL_176;
      }
    }
    v163 = 0;
    v164 = v144 * v142;
    while ((v91 & 1) == 0)
    {
      v172 = v163 + v144 * v86;
      switch(v84)
      {
        case 8:
          _S0 = *(double *)(v221.i64[0] + 8 * v172);
          break;
        case 4:
          _S0 = *(float *)(v221.i64[0] + 4 * v172);
          break;
        case 2:
          _H0 = *(_WORD *)(v221.i64[0] + 2 * v172);
          __asm { FCVT            S0, H0 }
          break;
        default:
          +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:].cold.1(v137, v142, v138);
      }
      if (_S0 > 0.0)
      {
        switch(v154)
        {
          case 4:
            v165 = *(unsigned int *)(v220.i64[0] + 4 * v172);
            break;
          case 2:
            v165 = *(unsigned __int16 *)(v220.i64[0] + 2 * v172);
            break;
          case 1:
            v165 = *(unsigned __int8 *)(v220.i64[0] + v172);
            break;
          default:
            +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:].cold.2(v137, v142, v138);
        }
LABEL_147:
        v167 = *(_QWORD *)&v148[8 * v165];
        if ((_BYTE)v153)
        {
          v168 = v153;
          v137 = v153;
          v169 = (unsigned int *)v104;
          v170 = v146;
          while (1)
          {
            v171 = *v169++;
            v138 = v171;
            if (v171 == (_DWORD)v167)
              break;
            ++v170;
            if (!--v137)
            {
              v142 = v105;
              goto LABEL_157;
            }
          }
          *v170 = *v170 + (float)(v145 * _S0);
          v142 = v105;
        }
        else
        {
          v168 = 0;
LABEL_157:
          v136[v164 + v168] = _S0 * v145;
          *(_BYTE *)(v141 + v164 + v168) = v167;
          LODWORD(v153) = v153 + 1;
          *(_DWORD *)&v104[4 * v168] = v167;
        }
      }
      if (++v163 == v86)
        goto LABEL_170;
    }
    v165 = 0;
    _S0 = 1.0;
    goto LABEL_147;
  }
  v139.f32[0] = 1.0 - *(float *)&v208;
  v221 = v139;
LABEL_176:
  v176 = (void *)MEMORY[0x1E0CD5988];
  v177 = objc_alloc(MEMORY[0x1E0C99D50]);
  v178 = (void *)objc_msgSend(v177, "initWithBytesNoCopy:length:", v136, v198);
  v179 = v219.i64[0];
  objc_msgSend(v176, "geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", v178, *MEMORY[0x1E0CD5A58], v219.i64[0], 1, v105, 4, 0, v217.i64[0]);
  v180 = (void *)objc_claimAutoreleasedReturnValue();

  v181 = (void *)MEMORY[0x1E0CD5988];
  v182 = objc_alloc(MEMORY[0x1E0C99D50]);
  v183 = (void *)objc_msgSend(v182, "initWithBytesNoCopy:length:", v141, v199);
  objc_msgSend(v181, "geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", v183, *MEMORY[0x1E0CD5A50], v179, 0, v105, 1, 0, v105);
  v184 = (void *)objc_claimAutoreleasedReturnValue();

  v185 = (void *)MEMORY[0x1E0CD5A20];
  v8 = v206;
  objc_msgSend(v206, "baseGeometry");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = v226;
  v188 = v222;
  objc_msgSend(v185, "skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:", v186, v226, v222, v180, v184);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "avt_simdBaseGeometryBindTransform");
  v217 = v189;
  v218 = v190;
  v219 = v191;
  v220 = v192;
  v9 = v205;
  objc_msgSend(v205, "avt_simdBaseGeometryBindTransform");
  objc_msgSend(v22, "avt_setSimdBaseGeometryBindTransform:", *(double *)vmlaq_n_f32(vmulq_n_f32(v193, *(float *)&v208), v217, v221.f32[0]).i64, *(double *)vmlaq_n_f32(vmulq_n_f32(v194, *(float *)&v208), v218, v221.f32[0]).i64, *(double *)vmlaq_n_f32(vmulq_n_f32(v195, *(float *)&v208), v219, v221.f32[0]).i64, *(double *)vmlaq_n_f32(vmulq_n_f32(v196, *(float *)&v208), v220, v221.f32[0]).i64);
  v12 = v223;
  objc_msgSend(v22, "setSkeleton:", v223);

LABEL_10:
  return v22;
}

+ (void)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3_3("_skinnerWeightAtIndex", "SceneKit+AVTExtensions.m", a3, "0");
}

+ (void)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_4("_skinnerIndexAtIndex", "SceneKit+AVTExtensions.m", a3, "0");
}

+ (void)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:.cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Missing index or weight source for skinner with multiple bones", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:.cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Missing index or weight source for skinner with multiple bones", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:.cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

@end
