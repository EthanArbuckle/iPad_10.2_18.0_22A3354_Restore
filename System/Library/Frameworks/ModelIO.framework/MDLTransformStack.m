@implementation MDLTransformStack

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedValues, 0);
  objc_storeStrong((id *)&self->_transformOps, 0);
}

- (matrix_float4x4)float4x4AtTime:(NSTimeInterval)time
{
  uint64_t v3;
  const char *v6;
  unint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  const char *v16;
  uint64_t v17;
  simd_float4 v18;
  simd_float4 v19;
  simd_float4 v20;
  simd_float4 v21;
  simd_float4 v22;
  float32x4_t v23;
  simd_float4 v24;
  float32x4_t v25;
  simd_float4 v26;
  float32x4_t v27;
  simd_float4 v28;
  float32x4_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  simd_float4 v34;
  simd_float4 v35;
  simd_float4 v36;
  simd_float4 v37;
  matrix_float4x4 result;

  v26 = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 16);
  v28 = *(simd_float4 *)MEMORY[0x1E0C83FF0];
  v22 = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 48);
  v24 = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 32);
  if (objc_msgSend_count(self->_transformOps, a2, v3))
  {
    v7 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_transformOps, v6, v7, *(_OWORD *)&v22, *(_OWORD *)&v24, *(_OWORD *)&v26, *(_OWORD *)&v28, v30, v31, v32, v33);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_float4x4AtTime_(v8, v9, v10, time);
      v11 = 0;
      v30 = v12;
      v31 = v13;
      v32 = v14;
      v33 = v15;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v34 + v11) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(__int128 *)((char *)&v30 + v11))), v27, *(float32x2_t *)((char *)&v30 + v11), 1), v25, *(float32x4_t *)((char *)&v30 + v11), 2), v23, *(float32x4_t *)((char *)&v30 + v11), 3);
        v11 += 16;
      }
      while (v11 != 64);
      v26 = v35;
      v28 = v34;
      v22 = v37;
      v24 = v36;

      ++v7;
    }
    while (objc_msgSend_count(self->_transformOps, v16, v17) > v7);
  }
  v19 = v26;
  v18 = v28;
  v21 = v22;
  v20 = v24;
  result.columns[3] = v21;
  result.columns[2] = v20;
  result.columns[1] = v19;
  result.columns[0] = v18;
  return result;
}

- (CAAnimation)transformAnimation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const __CFString *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  double v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  double v90;
  double v91;
  const char *v92;
  uint64_t v93;
  double v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  unint64_t v98;
  const char *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  double v104;
  double v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  float v115;
  float v116;
  float v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  const char *v138;
  uint64_t v139;
  float32x4_t v140;
  float32x4_t v141;
  float32x4_t v142;
  float32x4_t v143;
  const char *v144;
  void *v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  float v149;
  double v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  float v159;
  float v160;
  float v161;
  float v162;
  const char *v163;
  uint64_t v164;
  const char *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  float32x4_t v171;
  float32x4_t v172;
  float32x4_t v173;
  float32x4_t v174;
  const char *v175;
  const char *v176;
  const char *v177;
  const char *v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  const char *v184;
  double v185;
  const char *v186;
  uint64_t v187;
  const char *v188;
  const char *v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  double v201;
  const char *v202;
  const char *v203;
  uint64_t v204;
  double v205;
  const char *v206;
  uint64_t v207;
  const char *v208;
  const char *v209;
  double v210;
  const char *v211;
  uint64_t v212;
  float32x4_t v214;
  float32x4_t v215;
  float32x4_t v216;
  float32x4_t v217;
  uint64_t v218;
  void *v219;
  NSMutableArray *obj;
  uint64_t v221;
  uint64_t v222;
  _OWORD v223[8];
  _OWORD v224[8];
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  _BYTE v229[128];
  uint64_t v230;

  v230 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isScaleRotateTransformOrder(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_decomposedTransformAnimation(self, v4, v5);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    return (CAAnimation *)v190;
  }
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = objc_msgSend_count(self->_transformOps, v4, v5);
  objc_msgSend_arrayWithCapacity_(v6, v8, v7);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0u;
  v228 = 0u;
  v225 = 0u;
  v226 = 0u;
  obj = self->_transformOps;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v225, v229, 16);
  if (!v10)
  {
    v11 = 0.0;
    v12 = 0.0;
    goto LABEL_71;
  }
  v221 = *(_QWORD *)v226;
  v218 = *MEMORY[0x1E0CD2B58];
  v11 = 0.0;
  v12 = 0.0;
  do
  {
    v222 = v10;
    for (i = 0; i != v222; ++i)
    {
      if (*(_QWORD *)v226 != v221)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v225 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_animatedValue(v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_keyTimes(v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = CFSTR("position");
        if (!v20)
          goto LABEL_64;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_animatedValue(v14, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_keyTimes(v26, v27, v28);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_order(v14, v29, v30) == 1)
            v23 = CFSTR("eulerAngles");
          else
            v23 = CFSTR("transform");
          if (!v20)
            goto LABEL_64;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_animatedValue(v14, v31, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_keyTimes(v33, v34, v35);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = CFSTR("eulerAngles.x");
            if (!v20)
              goto LABEL_64;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_animatedValue(v14, v36, v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_keyTimes(v38, v39, v40);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              v23 = CFSTR("eulerAngles.y");
              if (!v20)
                goto LABEL_64;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend_animatedValue(v14, v41, v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_keyTimes(v43, v44, v45);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                v23 = CFSTR("eulerAngles.z");
                if (!v20)
                  goto LABEL_64;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend_animatedValue(v14, v46, v47);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_keyTimes(v48, v49, v50);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  v23 = CFSTR("orientation");
                  if (!v20)
                    goto LABEL_64;
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend_animatedValue(v14, v51, v52);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_keyTimes(v53, v54, v55);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();

                    v23 = CFSTR("scale");
                    if (!v20)
                      goto LABEL_64;
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v20 = 0;
                      goto LABEL_64;
                    }
                    objc_msgSend_animatedValue(v14, v56, v57);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_keyTimes(v58, v59, v60);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();

                    v23 = CFSTR("transform");
                    if (!v20)
                      goto LABEL_64;
                  }
                }
              }
            }
          }
        }
      }
      if (!objc_msgSend_count(v20, v21, v22))
        goto LABEL_64;
      objc_msgSend_animation(MEMORY[0x1E0CD2798], v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setKeyPath_(v63, v64, (uint64_t)v23);
      v65 = (void *)MEMORY[0x1E0C99DE8];
      v68 = objc_msgSend_count(v20, v66, v67);
      objc_msgSend_arrayWithCapacity_(v65, v69, v68);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = (void *)MEMORY[0x1E0C99DE8];
      v74 = objc_msgSend_count(v20, v72, v73);
      objc_msgSend_arrayWithCapacity_(v71, v75, v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v20, v77, 0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v78, v79, v80);
      v82 = v81;

      v85 = objc_msgSend_count(v20, v83, v84);
      objc_msgSend_objectAtIndex_(v20, v86, v85 - 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v87, v88, v89);
      v91 = v90;

      v94 = v91 - v82;
      if (v94 == 0.0)
        goto LABEL_63;
      v95 = objc_msgSend_count(v219, v92, v93);
      v98 = 0;
      if (v12 > v82 || v95 == 0)
        v12 = v82;
      if (v11 < v94)
        v11 = v94;
      while (v98 < objc_msgSend_count(v20, v96, v97, *(_OWORD *)&v214, *(_OWORD *)&v215, *(_OWORD *)&v216, *(_OWORD *)&v217))
      {
        objc_msgSend_objectAtIndex_(v20, v100, v98);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v101, v102, v103);
        v105 = v104;

        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v106, v107, (v105 - v82) * (1.0 / v94));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v70, v109, (uint64_t)v108);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_44;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend_order(v14, v122, v123) == 1)
          {
            objc_msgSend_animatedValue(v14, v124, v125);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_float3AtTime_(v126, v127, v128, v105);
            v130 = v129 * 0.0174532925;
            v132 = v131 * 0.0174532925;
            v134 = v133 * 0.0174532925;
            objc_msgSend_valueWithCGRect_(MEMORY[0x1E0CB3B18], v135, v136, v130, v132, v134, 0.0);
            v120 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend_float4x4AtTime_(v14, v124, v125, v105);
            v224[0] = vcvtq_f64_f32(*(float32x2_t *)v140.f32);
            v224[1] = vcvt_hight_f64_f32(v140);
            v224[2] = vcvtq_f64_f32(*(float32x2_t *)v141.f32);
            v224[3] = vcvt_hight_f64_f32(v141);
            v224[4] = vcvtq_f64_f32(*(float32x2_t *)v142.f32);
            v224[5] = vcvt_hight_f64_f32(v142);
            v224[6] = vcvtq_f64_f32(*(float32x2_t *)v143.f32);
            v224[7] = vcvt_hight_f64_f32(v143);
            objc_msgSend_valueWithCATransform3D_(MEMORY[0x1E0CB3B18], v144, (uint64_t)v224);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_addObject_(v76, v137, (uint64_t)v120);
          goto LABEL_45;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v145 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend_animatedValue(v14, v138, v139);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_floatAtTime_(v146, v147, v148, v105);
          v150 = v149 * 0.0174532925;
          *(float *)&v150 = v150;
          objc_msgSend_numberWithFloat_(v145, v151, v152, v150);
          v120 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_addObject_(v76, v153, (uint64_t)v120);
          goto LABEL_45;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_animatedValue(v14, v154, v155);
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_floatQuaternionAtTime_(v156, v157, v158, v105);
          objc_msgSend_valueWithCGRect_(MEMORY[0x1E0CB3B18], v163, v164, v162, v159, v160, v161);
          v120 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_addObject_(v76, v165, (uint64_t)v120);
          goto LABEL_45;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_44:
          objc_msgSend_animatedValue(v14, v110, v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_float3AtTime_(v112, v113, v114, v105);
          objc_msgSend_valueWithCGRect_(MEMORY[0x1E0CB3B18], v118, v119, v117, v115, v116, 0.0);
          v120 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_addObject_(v76, v121, (uint64_t)v120);
LABEL_45:

          goto LABEL_46;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_animatedValue(v14, v166, v167);
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_float4x4AtTime_(v168, v169, v170, v105);
          v214 = v171;
          v215 = v172;
          v216 = v173;
          v217 = v174;

          v223[0] = vcvtq_f64_f32(*(float32x2_t *)v214.f32);
          v223[1] = vcvt_hight_f64_f32(v214);
          v223[2] = vcvtq_f64_f32(*(float32x2_t *)v215.f32);
          v223[3] = vcvt_hight_f64_f32(v215);
          v223[4] = vcvtq_f64_f32(*(float32x2_t *)v216.f32);
          v223[5] = vcvt_hight_f64_f32(v216);
          v223[6] = vcvtq_f64_f32(*(float32x2_t *)v217.f32);
          v223[7] = vcvt_hight_f64_f32(v217);
          objc_msgSend_valueWithCATransform3D_(MEMORY[0x1E0CB3B18], v175, (uint64_t)v223);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v76, v176, (uint64_t)v120);
          goto LABEL_45;
        }
LABEL_46:

        ++v98;
      }
      objc_msgSend_setValues_(v63, v100, (uint64_t)v76);
      objc_msgSend_setFillMode_(v63, v177, v218);
      objc_msgSend_setKeyTimes_(v63, v178, (uint64_t)v70);
      objc_msgSend_setBeginTime_(v63, v179, v180, v82);
      objc_msgSend_setDuration_(v63, v181, v182, v94);
      objc_msgSend_setAdditive_(v63, v183, 0);
      objc_msgSend_setRemovedOnCompletion_(v63, v184, 0);
      LODWORD(v185) = 1.0;
      objc_msgSend_setRepeatCount_(v63, v186, v187, v185);
      objc_msgSend_addObject_(v219, v188, (uint64_t)v63);
LABEL_63:

LABEL_64:
    }
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v189, (uint64_t)&v225, v229, 16);
  }
  while (v10);
LABEL_71:

  if (objc_msgSend_count(v219, v191, v192))
  {
    if (objc_msgSend_count(v219, v193, v194) != 1)
      goto LABEL_75;
    objc_msgSend_objectAtIndex_(v219, v195, 0);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_beginTime(v190, v197, v198);
    if (v201 <= 0.0)
    {
      LODWORD(v201) = 2139095039;
      objc_msgSend_setRepeatCount_(v190, v199, v200, v201);
    }
    else
    {

LABEL_75:
      objc_msgSend_animation(MEMORY[0x1E0CD2700], v195, v196);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAnimations_(v190, v202, (uint64_t)v219);
      v205 = 0.0;
      if (v12 <= 0.0)
        v205 = v12;
      objc_msgSend_setBeginTime_(v190, v203, v204, v205);
      objc_msgSend_setDuration_(v190, v206, v207, fmax(v12, -0.0) + v11);
      objc_msgSend_setFillMode_(v190, v208, *MEMORY[0x1E0CD2B58]);
      objc_msgSend_setRemovedOnCompletion_(v190, v209, 0);
      LODWORD(v210) = 2139095039;
      objc_msgSend_setRepeatCount_(v190, v211, v212, v210);
    }
  }
  else
  {
    v190 = 0;
  }

  return (CAAnimation *)v190;
}

- (BOOL)isScaleRotateTransformOrder
{
  NSMutableArray *v2;
  const char *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
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
  v2 = self->_transformOps;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v16, v20, 16);
  if (!v4)
    goto LABEL_29;
  v5 = 0;
  v6 = *(_QWORD *)v17;
  do
  {
    v7 = 0;
    v8 = v5;
    do
    {
      if (*(_QWORD *)v17 != v6)
        objc_enumerationMutation(v2);
      v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = 1;
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend_order(v9, v11, v12, (_QWORD)v16) != 1)
          goto LABEL_22;
LABEL_10:
        if (v8 > 5)
          goto LABEL_30;
LABEL_13:
        v5 = 4;
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = 3;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = 2;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_10;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v5 = 5;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
LABEL_22:
              if (v8)
                goto LABEL_30;
              v5 = 6;
              goto LABEL_24;
            }
            v5 = 0;
          }
        }
      }
LABEL_24:
      if (v8 >= v5)
      {
LABEL_30:
        v14 = 0;
        goto LABEL_31;
      }
      ++v7;
      v8 = v5;
    }
    while (v4 != v7);
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v10, (uint64_t)&v16, v20, 16);
    v4 = v13;
  }
  while (v13);
LABEL_29:
  v14 = 1;
LABEL_31:

  return v14;
}

- (id)init
{
  MDLTransformStack *v2;
  NSMutableArray *v3;
  NSMutableArray *transformOps;
  NSMutableDictionary *v5;
  NSMutableDictionary *animatedValues;
  MDLTransformStack *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MDLTransformStack;
  v2 = -[MDLTransformStack init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transformOps = v2->_transformOps;
    v2->_transformOps = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    animatedValues = v2->_animatedValues;
    v2->_animatedValues = v5;

    v7 = v2;
  }

  return v2;
}

- (uint64_t)matrix
{
  return objc_msgSend_localTransformAtTime_(a1, a2, a3, 0.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  NSMutableArray *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  id v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  id v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  id v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  id v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  id v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  id v89;
  const char *v90;
  uint64_t v91;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  *(_BYTE *)(v10 + 8) = self->_resetsTransform;
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v11 = self->_animatedValues;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v97, v102, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v98 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(self->_animatedValues, v13, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend_copy(v18, v19, v20);
        objc_msgSend_setObject_forKeyedSubscript_(*(void **)(v10 + 24), v22, (uint64_t)v21, v17);

      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v97, v102, 16);
    }
    while (v14);
  }

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v23 = self->_transformOps;
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v93, v101, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v94;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v94 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v27);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_name(v28, v29, v30);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend_inverse(v28, v32, v33);
          v36 = (id)objc_msgSend_addRotateXOp_inverse_((void *)v10, v35, (uint64_t)v31, v34);
LABEL_29:

          goto LABEL_30;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_name(v28, v37, v38);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend_inverse(v28, v39, v40);
          v43 = (id)objc_msgSend_addRotateYOp_inverse_((void *)v10, v42, (uint64_t)v31, v41);
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_name(v28, v44, v45);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend_inverse(v28, v46, v47);
          v50 = (id)objc_msgSend_addRotateZOp_inverse_((void *)v10, v49, (uint64_t)v31, v48);
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = v28;
          objc_msgSend_name(v31, v51, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend_order(v31, v54, v55);
          v59 = objc_msgSend_inverse(v31, v57, v58);
          v61 = (id)objc_msgSend_addRotateOp_order_inverse_((void *)v10, v60, (uint64_t)v53, v56, v59);

          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_name(v28, v62, v63);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend_inverse(v28, v64, v65);
          v68 = (id)objc_msgSend_addTranslateOp_inverse_((void *)v10, v67, (uint64_t)v31, v66);
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_name(v28, v69, v70);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend_inverse(v28, v71, v72);
          v75 = (id)objc_msgSend_addScaleOp_inverse_((void *)v10, v74, (uint64_t)v31, v73);
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_name(v28, v76, v77);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend_inverse(v28, v78, v79);
          v82 = (id)objc_msgSend_addOrientOp_inverse_((void *)v10, v81, (uint64_t)v31, v80);
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_name(v28, v83, v84);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend_inverse(v28, v85, v86);
          v89 = (id)objc_msgSend_addMatrixOp_inverse_((void *)v10, v88, (uint64_t)v31, v87);
          goto LABEL_29;
        }
        NSLog(CFSTR("Internal error: Skipping unknown MDLTransformOp."), (_QWORD)v93);
LABEL_30:
        ++v27;
      }
      while (v25 != v27);
      v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v90, (uint64_t)&v93, v101, 16);
      v25 = v91;
    }
    while (v91);
  }

  return (id)v10;
}

- (double)minimumTime
{
  uint64_t v2;
  NSMutableDictionary *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_count(self->_transformOps, a2, v2))
    return 0.0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_animatedValues;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    v9 = 1000000000.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend_objectForKey_(self->_animatedValues, v6, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_minimumTime(v11, v12, v13);
        if (v14 < v9)
          v9 = v14;

      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 1000000000.0;
  }

  return v9;
}

- (double)maximumTime
{
  uint64_t v2;
  NSMutableDictionary *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_count(self->_transformOps, a2, v2))
    return 0.0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_animatedValues;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    v9 = -1000000000.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend_objectForKey_(self->_animatedValues, v6, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_maximumTime(v11, v12, v13);
        if (v14 > v9)
          v9 = v14;

      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v9 = -1000000000.0;
  }

  return v9;
}

- (NSArray)keyTimes
{
  id v3;
  const char *v4;
  uint64_t v5;
  NSMutableDictionary *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend_count(self->_transformOps, v4, v5))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = self->_animatedValues;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v27;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend_objectForKey_(self->_animatedValues, v8, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11), (_QWORD)v26);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_keyTimes(v12, v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v3, v16, (uint64_t)v15);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v26, v31, 16);
      }
      while (v9);
    }

    objc_msgSend_orderedSetWithArray_(MEMORY[0x1E0C99E40], v17, (uint64_t)v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v19, (uint64_t)CFSTR("self"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v20;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)&v30, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingDescriptors_(v18, v23, (uint64_t)v22);
    v24 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = v3;
  }

  return (NSArray *)v24;
}

- (id)animatedVector3WithName:(id)a3 shouldCreateIfMissing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  const char *v8;
  void *v9;
  BOOL v10;
  void *v11;
  const char *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend_objectForKey_(self->_animatedValues, v7, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = 1;
  else
    v10 = !v4;
  if (!v10)
  {
    objc_msgSend_objectForKey_(self->_animatedValues, v8, (uint64_t)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v9 = 0;
    }
    else
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_animatedValues, v12, (uint64_t)v9, v6);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
  }
  else
  {
    NSLog(CFSTR("Warning: %@ is not of type MDLAnimatedVector3"), v6);
    v13 = 0;
  }

  return v13;
}

- (id)animatedVector4WithName:(id)a3 shouldCreateIfMissing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  const char *v8;
  void *v9;
  BOOL v10;
  void *v11;
  const char *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend_objectForKey_(self->_animatedValues, v7, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = 1;
  else
    v10 = !v4;
  if (!v10)
  {
    objc_msgSend_objectForKey_(self->_animatedValues, v8, (uint64_t)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v9 = 0;
    }
    else
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_animatedValues, v12, (uint64_t)v9, v6);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
  }
  else
  {
    NSLog(CFSTR("Warning: %@ is not of type MDLAnimatedVector4"), v6);
    v13 = 0;
  }

  return v13;
}

- (id)animatedQuaternionWithName:(id)a3 shouldCreateIfMissing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  const char *v8;
  void *v9;
  BOOL v10;
  void *v11;
  const char *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend_objectForKey_(self->_animatedValues, v7, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = 1;
  else
    v10 = !v4;
  if (!v10)
  {
    objc_msgSend_objectForKey_(self->_animatedValues, v8, (uint64_t)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v9 = 0;
    }
    else
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_animatedValues, v12, (uint64_t)v9, v6);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
  }
  else
  {
    NSLog(CFSTR("Warning: %@ is not of type MDLAnimatedQuaternion"), v6);
    v13 = 0;
  }

  return v13;
}

- (id)animatedMatrix4x4WithName:(id)a3 shouldCreateIfMissing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  const char *v8;
  void *v9;
  BOOL v10;
  void *v11;
  const char *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend_objectForKey_(self->_animatedValues, v7, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = 1;
  else
    v10 = !v4;
  if (!v10)
  {
    objc_msgSend_objectForKey_(self->_animatedValues, v8, (uint64_t)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v9 = 0;
    }
    else
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_animatedValues, v12, (uint64_t)v9, v6);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
  }
  else
  {
    NSLog(CFSTR("Warning: %@ is not of type MDLAnimatedMatrix4x4"), v6);
    v13 = 0;
  }

  return v13;
}

- (id)animatedScalarWithName:(id)a3 shouldCreateIfMissing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  const char *v8;
  void *v9;
  BOOL v10;
  void *v11;
  const char *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend_objectForKey_(self->_animatedValues, v7, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = 1;
  else
    v10 = !v4;
  if (!v10)
  {
    objc_msgSend_objectForKey_(self->_animatedValues, v8, (uint64_t)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v9 = 0;
    }
    else
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_animatedValues, v12, (uint64_t)v9, v6);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
  }
  else
  {
    NSLog(CFSTR("Warning: %@ is not of type MDLAnimatedMatrix4x4"), v6);
    v13 = 0;
  }

  return v13;
}

- (MDLTransformTranslateOp)addTranslateOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  _BOOL8 v4;
  NSString *v6;
  const char *v7;
  void *v8;
  MDLTransformTranslateOp *v9;
  const char *v10;
  void *v11;
  const char *v12;

  v4 = inverse;
  v6 = animatedValueName;
  objc_msgSend_animatedVector3WithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [MDLTransformTranslateOp alloc];
    v11 = (void *)objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformTranslateOp *)v11;
}

- (MDLTransformRotateXOp)addRotateXOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  _BOOL8 v4;
  NSString *v6;
  const char *v7;
  void *v8;
  MDLTransformRotateXOp *v9;
  const char *v10;
  void *v11;
  const char *v12;

  v4 = inverse;
  v6 = animatedValueName;
  objc_msgSend_animatedScalarWithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [MDLTransformRotateXOp alloc];
    v11 = (void *)objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformRotateXOp *)v11;
}

- (MDLTransformRotateYOp)addRotateYOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  _BOOL8 v4;
  NSString *v6;
  const char *v7;
  void *v8;
  MDLTransformRotateYOp *v9;
  const char *v10;
  void *v11;
  const char *v12;

  v4 = inverse;
  v6 = animatedValueName;
  objc_msgSend_animatedScalarWithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [MDLTransformRotateYOp alloc];
    v11 = (void *)objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformRotateYOp *)v11;
}

- (MDLTransformRotateZOp)addRotateZOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  _BOOL8 v4;
  NSString *v6;
  const char *v7;
  void *v8;
  MDLTransformRotateZOp *v9;
  const char *v10;
  void *v11;
  const char *v12;

  v4 = inverse;
  v6 = animatedValueName;
  objc_msgSend_animatedScalarWithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [MDLTransformRotateZOp alloc];
    v11 = (void *)objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformRotateZOp *)v11;
}

- (MDLTransformRotateOp)addRotateOp:(NSString *)animatedValueName order:(MDLTransformOpRotationOrder)order inverse:(BOOL)inverse
{
  _BOOL8 v5;
  NSString *v8;
  const char *v9;
  void *v10;
  MDLTransformRotateOp *v11;
  const char *v12;
  void *v13;
  const char *v14;

  v5 = inverse;
  v8 = animatedValueName;
  objc_msgSend_animatedVector3WithName_shouldCreateIfMissing_(self, v9, (uint64_t)v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = [MDLTransformRotateOp alloc];
    v13 = (void *)objc_msgSend_initWithName_inverse_order_data_(v11, v12, (uint64_t)v8, v5, order, v10);
    objc_msgSend_addObject_(self->_transformOps, v14, (uint64_t)v13);
  }
  else
  {
    v13 = 0;
  }

  return (MDLTransformRotateOp *)v13;
}

- (MDLTransformScaleOp)addScaleOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  _BOOL8 v4;
  NSString *v6;
  const char *v7;
  void *v8;
  MDLTransformScaleOp *v9;
  const char *v10;
  void *v11;
  const char *v12;

  v4 = inverse;
  v6 = animatedValueName;
  objc_msgSend_animatedVector3WithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [MDLTransformScaleOp alloc];
    v11 = (void *)objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformScaleOp *)v11;
}

- (MDLTransformMatrixOp)addMatrixOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  _BOOL8 v4;
  NSString *v6;
  const char *v7;
  void *v8;
  MDLTransformMatrixOp *v9;
  const char *v10;
  void *v11;
  const char *v12;

  v4 = inverse;
  v6 = animatedValueName;
  objc_msgSend_animatedMatrix4x4WithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [MDLTransformMatrixOp alloc];
    v11 = (void *)objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformMatrixOp *)v11;
}

- (MDLTransformOrientOp)addOrientOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  _BOOL8 v4;
  NSString *v6;
  const char *v7;
  void *v8;
  MDLTransformOrientOp *v9;
  const char *v10;
  void *v11;
  const char *v12;

  v4 = inverse;
  v6 = animatedValueName;
  objc_msgSend_animatedQuaternionWithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [MDLTransformOrientOp alloc];
    v11 = (void *)objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformOrientOp *)v11;
}

- (MDLAnimatedValue)animatedValueWithName:(NSString *)name
{
  objc_msgSend_objectForKey_(self->_animatedValues, a2, (uint64_t)name);
  return (MDLAnimatedValue *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSUInteger)count
{
  uint64_t v2;

  return objc_msgSend_count(self->_transformOps, a2, v2);
}

- (unint64_t)double4x4AtTime:(uint64_t)a3@<X2>
{
  float64x2_t *v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  unint64_t result;
  const char *v42;
  unint64_t i;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t *v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  const char *v63;
  uint64_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t vars0;

  v36 = (float64x2_t *)MEMORY[0x1E0C83FD8];
  v37 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 80);
  a4[4] = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 64);
  a4[5] = v37;
  v38 = v36[7];
  a4[6] = v36[6];
  a4[7] = v38;
  v39 = v36[1];
  *a4 = *v36;
  a4[1] = v39;
  v40 = v36[3];
  a4[2] = v36[2];
  a4[3] = v40;
  result = objc_msgSend_count(*(void **)(a1 + 16), a2, a3);
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 16), v42, i, *(_OWORD *)&v65);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v44;
      if (v44)
        objc_msgSend_double4x4AtTime_(v44, v45, v46, a5);
      v48 = 0;
      v50 = *a4;
      v49 = a4[1];
      v52 = a4[2];
      v51 = a4[3];
      v54 = a4[4];
      v53 = a4[5];
      v56 = a4[6];
      v55 = a4[7];
      a30 = 0u;
      a31 = 0u;
      a32 = 0u;
      a33 = 0u;
      a26 = 0u;
      a27 = 0u;
      a28 = 0u;
      a29 = 0u;
      v69 = 0u;
      vars0 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      do
      {
        v58 = *(float64x2_t *)((char *)&a26 + v48);
        v57 = *(float64x2_t *)((char *)&a26 + v48 + 16);
        v59 = (float64x2_t *)((char *)&v65 + v48);
        *v59 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v50, v58.f64[0]), v52, v58, 1), v54, v57.f64[0]), v56, v57, 1);
        v59[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v49, v58.f64[0]), v51, v58, 1), v53, v57.f64[0]), v55, v57, 1);
        v48 += 32;
      }
      while (v48 != 128);
      v60 = vars0;
      a4[4] = v69;
      a4[5] = v60;
      a4[6] = 0u;
      a4[7] = 0u;
      v61 = v66;
      *a4 = v65;
      a4[1] = v61;
      v62 = v68;
      a4[2] = v67;
      a4[3] = v62;

      result = objc_msgSend_count(*(void **)(a1 + 16), v63, v64);
    }
  }
  return result;
}

- (uint64_t)setMatrix:(uint64_t)a3
{
  return MEMORY[0x1E0DE7D20](a1, sel_setLocalTransform_, a3);
}

- (void)setLocalTransform:(uint64_t)a1 forTime:(const char *)a2
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v3, v6, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]:set local transform forTime not yet supported"), v7, v5);

}

- (void)setLocalTransform:(uint64_t)a3
{
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  id v12;
  void *v17;

  objc_msgSend_clearTransformStack(a1, a2, a3);
  objc_msgSend_animatedMatrix4x4WithName_shouldCreateIfMissing_(a1, v8, (uint64_t)CFSTR("transform"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFloat4x4_atTime_(v17, v9, v10, a4, a5, a6, a7, 0.0);
  v12 = (id)objc_msgSend_addMatrixOp_inverse_(a1, v11, (uint64_t)CFSTR("transform"), 0);

}

+ (__n128)localTransformWithObject:(const char *)a3 atTime:(void *)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v11;

  objc_msgSend_componentConformingToProtocol_(a4, a3, (uint64_t)&unk_1F03B9AF8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v5)
  {
    objc_msgSend_localTransformAtTime_(v5, v6, v7, a1);
    v11 = v9;
  }
  else
  {
    v11 = *MEMORY[0x1E0C83FF0];
  }

  return (__n128)v11;
}

+ (__n128)globalTransformWithObject:(uint64_t)a3 atTime:(void *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  const char *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  __int128 v33;
  _OWORD v34[4];
  _OWORD v35[4];

  v5 = a4;
  objc_msgSend_parent(v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    do
    {
      objc_msgSend_componentConformingToProtocol_(v9, v8, (uint64_t)&unk_1F03B9AF8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        break;
      objc_msgSend_parent(v9, v8, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
    }
    while (v12);
  }
  objc_msgSend_componentConformingToProtocol_(v9, v8, (uint64_t)&unk_1F03B9AF8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_resetsTransform(v13, v14, v15) || !v13)
  {
    objc_msgSend_localTransformWithObject_atTime_(MDLTransformStack, v16, (uint64_t)v5, a1);
    v33 = v27;
  }
  else
  {
    objc_msgSend_globalTransformWithObject_atTime_(MDLTransformStack, v16, (uint64_t)v9, a1);
    v31 = v18;
    v32 = v17;
    v29 = v20;
    v30 = v19;
    objc_msgSend_localTransformWithObject_atTime_(MDLTransformStack, v21, (uint64_t)v5, a1);
    v22 = 0;
    v34[0] = v23;
    v34[1] = v24;
    v34[2] = v25;
    v34[3] = v26;
    memset(v35, 0, sizeof(v35));
    do
    {
      v35[v22] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(v34[v22])), v31, *(float32x2_t *)&v34[v22], 1), v30, (float32x4_t)v34[v22], 2), v29, (float32x4_t)v34[v22], 3);
      ++v22;
    }
    while (v22 != 4);
    v33 = v35[0];
  }

  return (__n128)v33;
}

- (void)clearTransformStack
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  objc_msgSend_removeAllObjects(self->_transformOps, a2, v2);
  objc_msgSend_removeAllObjects(self->_animatedValues, v4, v5);
}

- (id)decomposedTransformAnimation
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  double v51;
  const char *v52;
  uint64_t v53;
  unint64_t v54;
  double v55;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  double v65;
  double v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  float32x4_t v74;
  int32x4_t v75;
  int32x4_t v76;
  uint64_t v77;
  float v78;
  int32x4_t v79;
  int32x4_t v80;
  float v81;
  int32x4_t v82;
  float32x4_t v83;
  int32x4_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  float v90;
  float v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  __int32 v95;
  float32_t v97;
  int32x4_t v98;
  float32x4_t v99;
  int32x4_t v100;
  int32x4_t v101;
  float v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  int8x16_t v107;
  float32x4_t v108;
  float32x4_t v109;
  void *v110;
  const char *v111;
  float32x4_t v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  const char *v121;
  void *v122;
  const char *v123;
  const char *v124;
  const char *v125;
  const char *v126;
  const char *v127;
  const char *v128;
  const char *v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  const char *v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  const char *v143;
  double v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  const char *v154;
  double v155;
  const char *v156;
  uint64_t v157;
  void *v159;
  void *v160;
  void *v161;
  float32x4_t v162;
  void *v163;
  void *v164;
  void *v165;
  int32x4_t v166;
  float v167;
  float32x4_t v168;

  objc_msgSend_keyTimes(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v4, v5, v6))
  {
    v147 = 0;
    goto LABEL_24;
  }
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = objc_msgSend_count(v4, v7, v8);
  objc_msgSend_arrayWithCapacity_(v9, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_animation(MEMORY[0x1E0CD2798], v13, v14);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeyPath_(v161, v15, (uint64_t)CFSTR("position"));
  v16 = (void *)MEMORY[0x1E0C99DE8];
  v19 = objc_msgSend_count(v4, v17, v18);
  objc_msgSend_arrayWithCapacity_(v16, v20, v19);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_animation(MEMORY[0x1E0CD2798], v21, v22);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeyPath_(v160, v23, (uint64_t)CFSTR("orientation"));
  v24 = (void *)MEMORY[0x1E0C99DE8];
  v27 = objc_msgSend_count(v4, v25, v26);
  objc_msgSend_arrayWithCapacity_(v24, v28, v27);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_animation(MEMORY[0x1E0CD2798], v29, v30);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeyPath_(v159, v31, (uint64_t)CFSTR("scale"));
  v32 = (void *)MEMORY[0x1E0C99DE8];
  v35 = objc_msgSend_count(v4, v33, v34);
  objc_msgSend_arrayWithCapacity_(v32, v36, v35);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v4, v37, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v38, v39, v40);
  v42 = v41;

  v45 = objc_msgSend_count(v4, v43, v44);
  objc_msgSend_objectAtIndex_(v4, v46, v45 - 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v47, v48, v49);
  v51 = v50;

  v54 = 0;
  v55 = v51 - v42;
  __asm { FMOV            V1.4S, #1.0 }
  v162 = _Q1;
  while (v54 < objc_msgSend_count(v4, v52, v53))
  {
    objc_msgSend_objectAtIndex_(v4, v61, v54);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v62, v63, v64);
    v66 = v65;

    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v67, v68, (v66 - v42) * (1.0 / v55));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localTransformAtTime_(self, v70, v71, v66);
    v79 = (int32x4_t)vmlaq_f32(vnegq_f32(vmulq_f32((float32x4_t)v75, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v76, v76), (int8x16_t)v76, 0xCuLL))), (float32x4_t)v76, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v75, v75), (int8x16_t)v75, 0xCuLL));
    v80 = (int32x4_t)vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v79, v79), (int8x16_t)v79, 0xCuLL), v74);
    if (vaddq_f32(vaddq_f32((float32x4_t)v80, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v80.i8, 1)), (float32x4_t)vdupq_laneq_s32(v80, 2)).f32[0] >= 0.0)v81 = 1.0;
    else
      v81 = -1.0;
    v82 = (int32x4_t)vmulq_f32(v74, v74);
    v83 = vaddq_f32(vaddq_f32((float32x4_t)v82, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v82.i8, 1)), (float32x4_t)vdupq_laneq_s32(v82, 2));
    v84 = (int32x4_t)vmulq_f32((float32x4_t)v75, (float32x4_t)v75);
    v83.f32[0] = sqrtf(v83.f32[0]);
    v85 = (int32x4_t)vmulq_f32((float32x4_t)v76, (float32x4_t)v76);
    v83.i32[1] = sqrtf(vaddq_f32(vaddq_f32((float32x4_t)v84, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v84.i8, 1)), (float32x4_t)vdupq_laneq_s32(v84, 2)).f32[0]);
    v83.i32[2] = sqrtf(vaddq_f32(vaddq_f32((float32x4_t)v85, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v85.i8, 1)), (float32x4_t)vdupq_laneq_s32(v85, 2)).f32[0]);
    v86 = (int32x4_t)vmulq_n_f32(v83, v81);
    v87 = (int32x4_t)vmulq_f32(v74, vdivq_f32(v162, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v86.i8, 0)));
    v88 = (int32x4_t)vmulq_f32((float32x4_t)v75, vdivq_f32(v162, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v86.i8, 1)));
    v166 = v86;
    v89 = (int32x4_t)vmulq_f32((float32x4_t)v76, vdivq_f32(v162, (float32x4_t)vdupq_laneq_s32(v86, 2)));
    v90 = *(float *)v87.i32 + *(float *)&v88.i32[1];
    v91 = (float)(*(float *)v87.i32 + *(float *)&v88.i32[1]) + *(float *)&v89.i32[2];
    if (v91 <= 0.0)
    {
      if (*(float *)v87.i32 > *(float *)&v88.i32[1] && *(float *)v87.i32 > *(float *)&v89.i32[2])
      {
        v102 = *(float *)&v89.i32[2] + *(float *)&v88.i32[1];
        v103 = (float32x4_t)vextq_s8((int8x16_t)v88, (int8x16_t)vtrn1q_s32(v88, v89), 0xCuLL);
        v104 = vaddq_f32(v103, (float32x4_t)v87);
        v103.f32[0] = *(float *)v87.i32 + 1.0;
        *(float *)v87.i32 = v102;
        v87.i32[3] = v89.i32[1];
        v105 = vsubq_f32(v103, (float32x4_t)v87);
        v104.i32[0] = v105.i32[0];
        v104.i32[3] = v105.i32[3];
        v167 = v105.f32[0];
        v168 = v104;
        goto LABEL_18;
      }
      if (*(float *)&v88.i32[1] <= *(float *)&v89.i32[2])
      {
        v106.i64[0] = v89.i64[0];
        v106.f32[2] = *(float *)&v89.i32[2] + 1.0;
        v106.i32[3] = v87.i32[1];
        v107 = (int8x16_t)vtrn1q_s32(v87, v88);
        v108 = (float32x4_t)vextq_s8(v107, v107, 8uLL);
        v109.i64[0] = vaddq_f32((float32x4_t)v89, v108).u64[0];
        v108.f32[2] = v90;
        v109.i64[1] = vsubq_f32(v106, v108).i64[1];
        v168 = v109;
        v95 = v109.i32[2];
      }
      else
      {
        v97 = *(float *)&v89.i32[2] + *(float *)v87.i32;
        v98 = vuzp1q_s32(v88, v87);
        v88.i64[1] = __PAIR64__(v89.u32[0], v89.u32[1]);
        v99 = (float32x4_t)vuzp2q_s32(v87, v98);
        v100 = (int32x4_t)vaddq_f32((float32x4_t)v88, v99);
        v99.f32[1] = v97;
        *(float *)&v88.i32[1] = *(float *)&v88.i32[1] + 1.0;
        v101 = (int32x4_t)vsubq_f32((float32x4_t)v88, v99);
        v168 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v100), v101);
        v95 = v101.i32[1];
      }
    }
    else
    {
      v92 = (float32x4_t)vzip2q_s32(v88, vuzp1q_s32(v88, v89));
      v92.i32[2] = v87.i32[1];
      v93 = (float32x4_t)vtrn2q_s32(v89, vzip2q_s32(v89, v87));
      v93.i32[2] = v88.i32[0];
      v94 = vsubq_f32(v92, v93);
      v93.i32[3] = 1.0;
      v92.f32[3] = v91;
      v94.i32[3] = vaddq_f32(v92, v93).i32[3];
      v168 = v94;
      v95 = v94.i32[3];
    }
    v167 = *(float *)&v95;
LABEL_18:
    objc_msgSend_valueWithCGRect_(MEMORY[0x1E0CB3B18], v72, v73, *(float *)&v77, *((float *)&v77 + 1), v78, 0.0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v165, v111, (uint64_t)v110);
    v112 = vmulq_n_f32(v168, 0.5 / sqrtf(v167));
    objc_msgSend_valueWithCGRect_(MEMORY[0x1E0CB3B18], v113, v114, v112.f32[0], v112.f32[1], v112.f32[2], v112.f32[3]);
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(v164, v116, (uint64_t)v115);
    objc_msgSend_valueWithCGRect_(MEMORY[0x1E0CB3B18], v117, v118, *(float *)v166.i32, *(float *)&v166.i32[1], *(float *)&v166.i32[2], 0.0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(v163, v120, (uint64_t)v119);
    objc_msgSend_addObject_(v12, v121, (uint64_t)v69);

    ++v54;
  }
  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v61, 3);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v161, v123, (uint64_t)v165);
  objc_msgSend_addObject_(v122, v124, (uint64_t)v161);
  objc_msgSend_setValues_(v160, v125, (uint64_t)v164);
  objc_msgSend_addObject_(v122, v126, (uint64_t)v160);
  objc_msgSend_setValues_(v159, v127, (uint64_t)v163);
  objc_msgSend_addObject_(v122, v128, (uint64_t)v159);
  v131 = 0;
  v132 = *MEMORY[0x1E0CD2B58];
  while (v131 < objc_msgSend_count(v122, v129, v130))
  {
    objc_msgSend_objectAtIndex_(v122, v133, v131);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFillMode_(v135, v136, v132);
    objc_msgSend_setKeyTimes_(v135, v137, (uint64_t)v12);
    objc_msgSend_setBeginTime_(v135, v138, v139, v42);
    objc_msgSend_setDuration_(v135, v140, v141, v55);
    objc_msgSend_setAdditive_(v135, v142, 0);
    objc_msgSend_setRemovedOnCompletion_(v135, v143, 0);
    LODWORD(v144) = 1.0;
    objc_msgSend_setRepeatCount_(v135, v145, v146, v144);

    ++v131;
  }
  objc_msgSend_animation(MEMORY[0x1E0CD2700], v133, v134);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAnimations_(v147, v148, (uint64_t)v122);
  objc_msgSend_setBeginTime_(v147, v149, v150, v42);
  objc_msgSend_setDuration_(v147, v151, v152, v55);
  objc_msgSend_setFillMode_(v147, v153, v132);
  objc_msgSend_setRemovedOnCompletion_(v147, v154, 0);
  LODWORD(v155) = 2139095039;
  objc_msgSend_setRepeatCount_(v147, v156, v157, v155);

LABEL_24:
  return v147;
}

- (BOOL)resetsTransform
{
  return self->_resetsTransform;
}

- (void)setResetsTransform:(BOOL)a3
{
  self->_resetsTransform = a3;
}

- (NSArray)transformOps
{
  return &self->_transformOps->super;
}

- (void)setTransformOps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)animatedValues
{
  return self->_animatedValues;
}

- (void)setAnimatedValues:(id)a3
{
  objc_storeStrong((id *)&self->_animatedValues, a3);
}

@end
