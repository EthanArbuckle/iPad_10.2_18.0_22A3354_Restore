@implementation ARImageDetectionResultData

- (id)anchorsForCameraWithTransform:(float32x4_t)a3 referenceOriginTransform:(float32x4_t)a4 existingAnchors:(float32x4_t)a5 anchorsToRemove:(float32x4_t)a6
{
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _UNKNOWN **v30;
  id v31;
  void *v32;
  void *v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  int v48;
  double v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  uint64_t v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  uint64_t v66;
  float v67;
  __int128 v68;
  __int128 v69;
  float v70;
  __int128 v71;
  float v72;
  __int128 v73;
  float v74;
  float v75;
  float32x4_t v76;
  float32x4_t v77;
  unint64_t v78;
  float32x4_t v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  float64x2_t v86;
  float32x2_t v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  float64x2_t v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  float v102;
  float v103;
  NSObject *v104;
  _BOOL4 v105;
  objc_class *v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  float32x4_t v119;
  float32x4_t v120;
  float32x4_t v121;
  float32x4_t v122;
  uint64_t v123;
  objc_class *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t k;
  void *v132;
  void *v133;
  id v135;
  id v136;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  id obj;
  void *v150;
  float32x4_t v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  float32x4_t v155;
  float32x4_t v156;
  float32x4_t v157;
  float32x4_t v158;
  float32x4_t v159;
  float32x4_t v160;
  float32x4_t v161;
  float32x4_t v162;
  float32x4_t v163;
  float32x4_t v164;
  float32x4_t v165;
  float32x4_t v166;
  float32x4_t v167;
  float32x4_t v168;
  float32x4_t v169;
  float64_t v170;
  float32x4_t v171;
  __int128 v172;
  double v173;
  float64_t v174;
  float64_t v175;
  float32x4_t v176;
  __int128 v177;
  double v178;
  float64_t v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  _BYTE v192[128];
  _BYTE v193[128];
  uint8_t v194[128];
  _BYTE buf[32];
  __int128 v196;
  __int128 v197;
  float32x4_t v198;
  float32x4_t v199;
  __int128 v200;
  __int128 v201;
  uint64_t v202;

  v202 = *MEMORY[0x1E0C80C00];
  v14 = a11;
  v136 = a12;
  if (anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__onceToken != -1)
    dispatch_once(&anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__onceToken, &__block_literal_global_107);
  v153 = (void *)objc_opt_new();
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  v191 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v188, v194, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v189;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v189 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "setObject:forKey:", v20, v21);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v188, v194, 16);
    }
    while (v17);
  }
  v135 = v15;

  v150 = (void *)objc_opt_new();
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  v187 = 0u;
  objc_msgSend(a1, "detectedImages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = v153;
  v154 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v184, v193, 16);
  if (v154)
  {
    v152 = *(_QWORD *)v185;
    v143 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    v144 = *MEMORY[0x1E0C83FF0];
    v141 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
    v142 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
    do
    {
      for (j = 0; j != v154; ++j)
      {
        if (*(_QWORD *)v185 != v152)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * j);
        objc_msgSend(v24, "referenceImage", v135, v136);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v28 = (void *)objc_msgSend(v27, "copyWithTrackedState:", 1);
        }
        else
        {
          v29 = objc_msgSend(a1, "detectionOnly");
          if ((ARLinkedOnOrAfterAzulE() & 1) != 0)
          {
            v30 = &off_1E666D000;
          }
          else
          {
            v30 = &off_1E666D000;
            if ((objc_msgSend(a1, "detectionOnly") & 1) != 0)
              v29 = 1;
            else
              v29 = objc_msgSend(a1, "providesWorldTrackingCameraPose");
          }
          v31 = objc_alloc((Class)v30[462]);
          objc_msgSend(v24, "referenceImage");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v31, "initWithReferenceImage:transform:detectionOnly:tracked:", v32, v29, 1, *(double *)&v144, *(double *)&v143, *(double *)&v142, *(double *)&v141);

        }
        objc_msgSend(v28, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeObjectForKey:", v33);

        *(double *)v34.i64 = ARVisionCameraToRenderingCoordinateTransform();
        v171 = v35;
        v176 = v34;
        v165 = v37;
        v168 = v36;
        objc_msgSend(v24, "visionTransform");
        v38 = 0;
        *(_OWORD *)buf = v39;
        *(_OWORD *)&buf[16] = v40;
        v196 = v41;
        v197 = v42;
        v198 = 0u;
        v199 = 0u;
        v200 = 0u;
        v201 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v198 + v38) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v176, COERCE_FLOAT(*(_OWORD *)&buf[v38])), v171, *(float32x2_t *)&buf[v38], 1), v168, *(float32x4_t *)&buf[v38], 2), v165, *(float32x4_t *)&buf[v38], 3);
          v38 += 16;
        }
        while (v38 != 64);
        v43 = 0;
        v44 = v198;
        v45 = v199;
        v46 = (float32x4_t)v200;
        v47 = (float32x4_t)v201;
        *(_OWORD *)buf = anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_0;
        *(_OWORD *)&buf[16] = anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_1;
        v196 = anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_2;
        v197 = anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_3;
        v198 = 0u;
        v199 = 0u;
        v200 = 0u;
        v201 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v198 + v43) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(_OWORD *)&buf[v43])), v45, *(float32x2_t *)&buf[v43], 1), v46, *(float32x4_t *)&buf[v43], 2), v47, *(float32x4_t *)&buf[v43], 3);
          v43 += 16;
        }
        while (v43 != 64);
        v166 = v198;
        v169 = v199;
        v172 = v200;
        v177 = v201;
        v48 = objc_msgSend(a1, "detectionOnly");
        if (!v27
          || !v48
          || (LODWORD(v49) = anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__s_percentThreshold,
              *(float *)&anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__s_percentThreshold <= 0.0))
        {
          if (objc_msgSend(a1, "providesWorldTrackingCameraPose", v49))
          {
            objc_msgSend(v24, "worldTrackingCameraTransformAtDetection");
            v113 = 0;
            *(_OWORD *)buf = v114;
            *(_OWORD *)&buf[16] = v115;
            v196 = v116;
            v197 = v117;
            v198 = 0u;
            v199 = 0u;
            v200 = 0u;
            v201 = 0u;
            do
            {
              *(float32x4_t *)((char *)&v198 + v113) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(_OWORD *)&buf[v113])), a7, *(float32x2_t *)&buf[v113], 1), a8, *(float32x4_t *)&buf[v113], 2), a9, *(float32x4_t *)&buf[v113], 3);
              v113 += 16;
            }
            while (v113 != 64);
            v118 = 0;
            v119 = v198;
            v120 = v199;
            v121 = (float32x4_t)v200;
            v122 = (float32x4_t)v201;
            *(float32x4_t *)buf = v166;
            *(float32x4_t *)&buf[16] = v169;
            v196 = v172;
            v197 = v177;
            v198 = 0u;
            v199 = 0u;
            v200 = 0u;
            v201 = 0u;
            do
            {
              *(float32x4_t *)((char *)&v198 + v118) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v119, COERCE_FLOAT(*(_OWORD *)&buf[v118])), v120, *(float32x2_t *)&buf[v118], 1), v121, *(float32x4_t *)&buf[v118], 2), v122, *(float32x4_t *)&buf[v118], 3);
              v118 += 16;
            }
            while (v118 != 64);
          }
          else
          {
            v123 = 0;
            *(float32x4_t *)buf = v166;
            *(float32x4_t *)&buf[16] = v169;
            v196 = v172;
            v197 = v177;
            v198 = 0u;
            v199 = 0u;
            v200 = 0u;
            v201 = 0u;
            do
            {
              *(float32x4_t *)((char *)&v198 + v123) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)&buf[v123])), a3, *(float32x2_t *)&buf[v123], 1), a4, *(float32x4_t *)&buf[v123], 2), a5, *(float32x4_t *)&buf[v123], 3);
              v123 += 16;
            }
            while (v123 != 64);
          }
          v109 = *(double *)v198.i64;
          v110 = *(double *)v199.i64;
          v111 = *(double *)&v200;
          v112 = *(double *)&v201;
          v108 = v28;
LABEL_54:
          objc_msgSend(v108, "setTransform:", v109, v110, v111, v112);
          objc_msgSend(v24, "estimatedScaleFactor");
          objc_msgSend(v28, "setEstimatedScaleFactor:");
          objc_msgSend(v150, "addObject:", v28);
          goto LABEL_58;
        }
        objc_msgSend(v24, "worldTrackingCameraTransformAtDetection", v49);
        v50 = 0;
        *(_OWORD *)buf = v51;
        *(_OWORD *)&buf[16] = v52;
        v196 = v53;
        v197 = v54;
        v198 = 0u;
        v199 = 0u;
        v200 = 0u;
        v201 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v198 + v50) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(_OWORD *)&buf[v50])), a7, *(float32x2_t *)&buf[v50], 1), a8, *(float32x4_t *)&buf[v50], 2), a9, *(float32x4_t *)&buf[v50], 3);
          v50 += 16;
        }
        while (v50 != 64);
        v161 = v198;
        v163 = v199;
        v159 = (float32x4_t)v200;
        v151 = (float32x4_t)v201;
        objc_msgSend(v27, "transform");
        v157 = v56;
        v158 = v55;
        v155 = v58;
        v156 = v57;
        v59 = 0;
        *(float32x4_t *)buf = v166;
        *(float32x4_t *)&buf[16] = v169;
        v196 = v172;
        v197 = v177;
        v198 = 0u;
        v199 = 0u;
        v200 = 0u;
        v201 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v198 + v59) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v161, COERCE_FLOAT(*(_OWORD *)&buf[v59])), v163, *(float32x2_t *)&buf[v59], 1), v159, *(float32x4_t *)&buf[v59], 2), v151, *(float32x4_t *)&buf[v59], 3);
          v59 += 16;
        }
        while (v59 != 64);
        v164 = v199;
        v167 = v198;
        v160 = (float32x4_t)v201;
        v162 = (float32x4_t)v200;
        objc_msgSend(v27, "referenceImage");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "physicalSize");
        v62 = v61;

        objc_msgSend(v27, "referenceImage");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "physicalSize");
        v65 = v64;

        v66 = 0;
        v67 = v62 * -0.5;
        v68 = xmmword_1B3BDFD50;
        v69 = xmmword_1B3BDFD50;
        *(float *)&v69 = v67;
        v70 = v65 * -0.5;
        v71 = v69;
        *((float *)&v71 + 2) = v70;
        v72 = v62 * 0.5;
        *(float *)&v68 = v72;
        v73 = v68;
        *((float *)&v73 + 2) = v70;
        v74 = v65 * 0.5;
        *((float *)&v68 + 2) = v74;
        v198 = (float32x4_t)v71;
        v199 = (float32x4_t)v73;
        *((float *)&v69 + 2) = v74;
        v200 = v68;
        v201 = v69;
        v75 = 0.0;
        do
        {
          v76 = *(float32x4_t *)((char *)&v198 + v66);
          v77 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v158, v76.f32[0]), v157, *(float32x2_t *)v76.f32, 1), v156, v76, 2), v155, v76, 3);
          v78 = vdivq_f32(v77, (float32x4_t)vdupq_laneq_s32((int32x4_t)v77, 3)).u64[0];
          v79 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v167, v76.f32[0]), v164, *(float32x2_t *)v76.f32, 1), v162, v76, 2), v160, v76, 3);
          v173 = *(double *)&v78;
          *(_QWORD *)&v178 = vdivq_f32(v79, (float32x4_t)vdupq_laneq_s32((int32x4_t)v79, 3)).u64[0];
          objc_msgSend(a1, "currentCamera");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "currentCamera");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "imageResolution");
          objc_msgSend(v80, "projectPoint:orientation:viewportSize:", 3, v173, v82, v83);
          v170 = v85;
          v174 = v84;

          v86.f64[0] = v174;
          v86.f64[1] = v170;
          v87 = vcvt_f32_f64(v86);
          objc_msgSend(a1, "currentCamera");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "currentCamera");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "imageResolution");
          objc_msgSend(v88, "projectPoint:orientation:viewportSize:", 3, v178, v90, v91);
          v175 = v93;
          v179 = v92;

          v94.f64[0] = v179;
          v94.f64[1] = v175;
          *(float32x2_t *)&v94.f64[0] = vsub_f32(v87, vcvt_f32_f64(v94));
          v75 = v75 + sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v94.f64[0], *(float32x2_t *)&v94.f64[0])));
          v66 += 16;
        }
        while (v66 != 64);
        objc_msgSend(a1, "currentCamera");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "imageResolution");
        v97 = v96;

        objc_msgSend(a1, "currentCamera");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "imageResolution");
        v100 = v99;

        if (v97 >= v100)
          v101 = v100;
        else
          v101 = v97;
        v102 = v101;
        v103 = *(float *)&anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__s_percentThreshold
             * v102;
        _ARLogGeneral_38();
        v104 = objc_claimAutoreleasedReturnValue();
        v105 = os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG);
        v22 = v153;
        if (v75 > v103)
        {
          if (v105)
          {
            v106 = (objc_class *)objc_opt_class();
            NSStringFromClass(v106);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v107;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = a1;
            *(_WORD *)&buf[22] = 2048;
            *(double *)&buf[24] = v75;
            LOWORD(v196) = 2048;
            *(double *)((char *)&v196 + 2) = v103;
            _os_log_impl(&dword_1B3A68000, v104, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Updated transform of image anchor as the sum of differences of image corners was greater than threshold. (%f > %f)", buf, 0x2Au);

          }
          v108 = v28;
          v110 = *(double *)v164.i64;
          v109 = *(double *)v167.i64;
          v112 = *(double *)v160.i64;
          v111 = *(double *)v162.i64;
          goto LABEL_54;
        }
        if (v105)
        {
          v124 = (objc_class *)objc_opt_class();
          NSStringFromClass(v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v125;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a1;
          _os_log_impl(&dword_1B3A68000, v104, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Did not update transform of image anchor", buf, 0x16u);

        }
LABEL_58:

      }
      v154 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v184, v193, 16);
    }
    while (v154);
  }

  v182 = 0u;
  v183 = 0u;
  v180 = 0u;
  v181 = 0u;
  objc_msgSend(v22, "allValues");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v180, v192, 16);
  v128 = v135;
  if (v127)
  {
    v129 = v127;
    v130 = *(_QWORD *)v181;
    do
    {
      for (k = 0; k != v129; ++k)
      {
        if (*(_QWORD *)v181 != v130)
          objc_enumerationMutation(v126);
        v132 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * k);
        if (objc_msgSend(v132, "isTracked", v135))
        {
          v133 = (void *)objc_msgSend(v132, "copyWithTrackedState:", 0);
          objc_msgSend(v150, "addObject:", v133);

        }
      }
      v129 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v180, v192, 16);
    }
    while (v129);
  }

  objc_msgSend(v153, "count");
  objc_msgSend(v150, "count");
  objc_msgSend(v150, "count");
  kdebug_trace();

  return v150;
}

float __117__ARImageDetectionResultData_anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove___block_invoke()
{
  float v0;
  float result;

  anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_0 = xmmword_1B3C0B420;
  anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_1 = xmmword_1B3C0B430;
  anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_2 = xmmword_1B3C0B440;
  anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_3 = xmmword_1B3BDFD50;
  +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.imagedetection.percentageThresholdPixels"));
  result = v0 / 100.0;
  anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__s_percentThreshold = LODWORD(result);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ARImageDetectionResultData detectedImages](self, "detectedImages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v7;

  *(_BYTE *)(v5 + 10) = -[ARImageDetectionResultData providesWorldTrackingCameraPose](self, "providesWorldTrackingCameraPose");
  *(_BYTE *)(v5 + 8) = -[ARImageDetectionResultData detectionOnly](self, "detectionOnly");
  -[ARImageDetectionResultData currentCamera](self, "currentCamera");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  *(_BYTE *)(v5 + 9) = self->_predicted;
  *(double *)(v5 + 16) = self->_timestamp;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    objc_msgSend(v5, "detectedImages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageDetectionResultData detectedImages](self, "detectedImages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7)
      && (v8 = v5[8], v8 == -[ARImageDetectionResultData detectionOnly](self, "detectionOnly"))
      && (v9 = v5[10],
          v9 == -[ARImageDetectionResultData providesWorldTrackingCameraPose](self, "providesWorldTrackingCameraPose")))
    {
      objc_msgSend(v5, "currentCamera");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageDetectionResultData currentCamera](self, "currentCamera");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqual:", v11)
        && self->_predicted == objc_msgSend(v5, "predicted"))
      {
        objc_msgSend(v5, "timestamp");
        v13 = v12 == self->_timestamp;
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ARImageDetectionResultData tracingEntry](self, "tracingEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (id)tracingEntryFormat
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (NSDictionary)tracingEntry
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v33;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[2];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  ARQATraceableDefaultEntryForResultData(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v3, "mutableCopy");

  v35 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[ARImageDetectionResultData detectedImages](self, "detectedImages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v37;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v7);
        v9 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "odtObjectIdentifer"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("odtObjectIdentifer"));

        objc_msgSend(v8, "referenceImage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("imageIdentifier"));

        objc_msgSend(v8, "visionTransform");
        +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("transform"));

        objc_msgSend(v8, "visionTransform");
        ARMatrix4x4Description(0, v15, v16, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("transformString"));

        objc_msgSend(v8, "referenceImage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("referenceImageName"));

        v22 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "referenceImage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "physicalSize");
        *(float *)&v24 = v24;
        objc_msgSend(v22, "numberWithFloat:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v25;
        v26 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "referenceImage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "physicalSize");
        *(float *)&v29 = v28;
        objc_msgSend(v26, "numberWithFloat:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v31, CFSTR("referenceImageSize"));

        objc_msgSend(v35, "addObject:", v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v5);
  }

  objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("detectedImages"));
  return (NSDictionary *)v33;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)detectionOnly
{
  return self->_detectionOnly;
}

- (void)setDetectionOnly:(BOOL)a3
{
  self->_detectionOnly = a3;
}

- (BOOL)predicted
{
  return self->_predicted;
}

- (void)setPredicted:(BOOL)a3
{
  self->_predicted = a3;
}

- (BOOL)providesWorldTrackingCameraPose
{
  return self->_providesWorldTrackingCameraPose;
}

- (void)setProvidesWorldTrackingCameraPose:(BOOL)a3
{
  self->_providesWorldTrackingCameraPose = a3;
}

- (ARCamera)currentCamera
{
  return self->_currentCamera;
}

- (void)setCurrentCamera:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)detectedImages
{
  return self->_detectedImages;
}

- (void)setDetectedImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedImages, 0);
  objc_storeStrong((id *)&self->_currentCamera, 0);
}

@end
