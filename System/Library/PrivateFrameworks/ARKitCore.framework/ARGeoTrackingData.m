@implementation ARGeoTrackingData

- (__n128)initWithENUOrigin:(__n128)a3 vioFromENU:(__n128)a4
{
  id v9;
  ARGeoTrackingData *v10;
  __n128 *v11;
  objc_super v17;

  v9 = a7;
  v17.receiver = a1;
  v17.super_class = (Class)ARGeoTrackingData;
  v10 = -[ARGeoTrackingData init](&v17, sel_init);
  v11 = (__n128 *)v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_enuOrigin, a7);
    v11[1] = a2;
    v11[2] = a3;
    v11[3] = a4;
    v11[4] = a5;
  }

  return v11;
}

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  void *v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  uint64_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t *v44;
  uint64_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t *v56;
  uint64_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t *v68;
  uint64_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t *v80;
  __int128 v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  void *v87;
  id obj;
  uint64_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float64x2_t v106;
  float64x2_t v107;
  float64x2_t v108;
  float64x2_t v109;
  float64x2_t v110;
  float64x2_t v111;
  float64x2_t v112;
  float64x2_t v113;
  float64x2_t v114;
  float64x2_t v115;
  float64x2_t v116;
  float64x2_t v117;
  float64x2_t v118;
  float64x2_t v119;
  float64x2_t v120;
  float64x2_t v121;
  float64x2_t v122;
  float64x2_t v123;
  float64x2_t v124;
  float64x2_t v125;
  float64x2_t v126;
  float64x2_t v127;
  float64x2_t v128;
  float64x2_t v129;
  float64x2_t v130;
  float64x2_t v131;
  float64x2_t v132;
  float64x2_t v133;
  float64x2_t v134;
  float64x2_t v135;
  float64x2_t v136;
  float64x2_t v137;
  float64x2_t v138;
  float64x2_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v142;
  float64x2_t v143;
  float64x2_t v144;
  float64x2_t v145;
  float64x2_t v146;
  float64x2_t v147;
  float64x2_t v148;
  float64x2_t v149;
  float64x2_t v150;
  float64x2_t v151;
  float64x2_t v152;
  float64x2_t v153;
  float64x2_t v154;
  float64x2_t v155;
  float64x2_t v156;
  float64x2_t v157;
  float64x2_t v158;
  float64x2_t v159;
  float64x2_t v160;
  float64x2_t v161;
  float64x2_t v162;
  float64x2_t v163;
  float64x2_t v164;
  float64x2_t v165;
  float64x2_t v166;
  float64x2_t v167;
  float64x2_t v168;
  float64x2_t v169;
  float64x2_t v170;
  float64x2_t v171;
  float64x2_t v172;
  float64x2_t v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _OWORD v178[4];
  _BYTE v179[128];
  float64x2_t buf[2];
  float64x2_t v181;
  float64x2_t v182;
  float64x2_t v183;
  float64x2_t v184;
  float64x2_t v185;
  float64x2_t v186;
  uint64_t v187;
  simd_float4x4 v188;

  v187 = *MEMORY[0x1E0C80C00];
  v12 = a11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_67);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v12;
  objc_msgSend(v12, "filteredArrayUsingPredicate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _ARLogGeneral_24();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf[0].f64[0]) = 138543874;
    *(_QWORD *)((char *)buf[0].f64 + 4) = v17;
    WORD2(buf[0].f64[1]) = 2048;
    *(_QWORD *)((char *)&buf[0].f64[1] + 6) = a1;
    HIWORD(buf[1].f64[0]) = 2048;
    *(_QWORD *)&buf[1].f64[1] = objc_msgSend(v14, "count");
    _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VL geo anchors updated: %lu", (uint8_t *)buf, 0x20u);

  }
  _ARLogGeneral_24();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = __invert_f4(*(simd_float4x4 *)(a1 + 16));
    ARMatrix4x4Description(1, (__n128)v188.columns[0], (__n128)v188.columns[1], (__n128)v188.columns[2], (__n128)v188.columns[3]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf[0].f64[0]) = 138543875;
    *(_QWORD *)((char *)buf[0].f64 + 4) = v20;
    WORD2(buf[0].f64[1]) = 2048;
    *(_QWORD *)((char *)&buf[0].f64[1] + 6) = a1;
    HIWORD(buf[1].f64[0]) = 2113;
    *(_QWORD *)&buf[1].f64[1] = v21;
    _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: enuFromVIO: %{private}@", (uint8_t *)buf, 0x20u);

  }
  v177 = 0u;
  v176 = 0u;
  v175 = 0u;
  v174 = 0u;
  v22 = v14;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v174, v179, 16);
  if (v23)
  {
    v24 = v23;
    obj = v22;
    v93 = *(_QWORD *)v175;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v175 != v93)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * i);
        if (objc_msgSend(v26, "isAltitudeAvailable"))
        {
          v173 = 0u;
          v172 = 0u;
          v171 = 0u;
          v170 = 0u;
          v169 = 0u;
          v168 = 0u;
          v167 = 0u;
          v166 = 0u;
          ARMatrix4x4FloatToDouble(&v166, (float32x4_t)_PromotedConst_3, unk_1B3C08160, (float32x4_t)xmmword_1B3C08170, unk_1B3C08180);
          v165 = 0u;
          v164 = 0u;
          v163 = 0u;
          v162 = 0u;
          v161 = 0u;
          v160 = 0u;
          v159 = 0u;
          v158 = 0u;
          *(double *)v27.i64 = ARVisionToRenderingCoordinateTransform();
          ARMatrix4x4FloatToDouble(&v158, v27, v28, v29, v30);
          v157 = 0u;
          v156 = 0u;
          v155 = 0u;
          v154 = 0u;
          v153 = 0u;
          v151 = 0u;
          v152 = 0u;
          v150 = 0u;
          v31 = *(void **)(a1 + 8);
          if (v31)
          {
            objc_msgSend(v31, "ecefFromlocation");
          }
          else
          {
            v148 = 0uLL;
            v149 = 0uLL;
            v146 = 0uLL;
            v147 = 0uLL;
            v144 = 0uLL;
            v145 = 0uLL;
            v142 = 0uLL;
            v143 = 0uLL;
          }
          v183 = v146;
          v184 = v147;
          v185 = v148;
          v186 = v149;
          buf[0] = v142;
          buf[1] = v143;
          v181 = v144;
          v182 = v145;
          __invert_d4();
          v185 = 0u;
          v186 = 0u;
          v183 = 0u;
          v184 = 0u;
          v181 = 0u;
          v182 = 0u;
          memset(buf, 0, sizeof(buf));
          ARMatrix4x4FloatToDouble(buf, *(float32x4_t *)(a1 + 16), *(float32x4_t *)(a1 + 32), *(float32x4_t *)(a1 + 48), *(float32x4_t *)(a1 + 64));
          v32 = 0uLL;
          v140 = 0u;
          v141 = 0u;
          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          v134 = 0u;
          v135 = 0u;
          v33 = 0uLL;
          if (v26)
          {
            objc_msgSend(v26, "ecefFromAnchor");
            v33 = 0uLL;
            v34 = v134;
            v35 = v135;
            v36 = v136;
            v37 = v137;
            v38 = v138;
            v39 = v139;
            v32 = v140;
            v40 = v141;
          }
          else
          {
            v40 = 0uLL;
            v38 = 0uLL;
            v39 = 0uLL;
            v36 = 0uLL;
            v37 = 0uLL;
            v34 = 0uLL;
            v35 = 0uLL;
          }
          v41 = 0;
          v122 = v170;
          v123 = v171;
          v124 = v172;
          v125 = v173;
          v118 = v166;
          v119 = v167;
          v120 = v168;
          v121 = v169;
          v126 = v33;
          v127 = v33;
          v128 = v33;
          v129 = v33;
          v130 = v33;
          v131 = v33;
          v132 = v33;
          v133 = v33;
          do
          {
            v43 = *(float64x2_t *)((char *)&v118 + v41);
            v42 = *(float64x2_t *)((char *)&v118 + v41 + 16);
            v44 = (float64x2_t *)((char *)&v126 + v41);
            *v44 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v34, v43.f64[0]), v36, v43, 1), v38, v42.f64[0]), v32, v42, 1);
            v44[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v35, v43.f64[0]), v37, v43, 1), v39, v42.f64[0]), v40, v42, 1);
            v41 += 32;
          }
          while (v41 != 128);
          v45 = 0;
          v47 = v150;
          v46 = v151;
          v48 = v153;
          v49 = v152;
          v50 = v155;
          v51 = v154;
          v52 = v157;
          v53 = v156;
          v114 = v130;
          v115 = v131;
          v116 = v132;
          v117 = v133;
          v110 = v126;
          v111 = v127;
          v112 = v128;
          v113 = v129;
          v124 = v33;
          v125 = v33;
          v122 = v33;
          v123 = v33;
          v120 = v33;
          v121 = v33;
          v118 = v33;
          v119 = v33;
          do
          {
            v55 = *(float64x2_t *)((char *)&v110 + v45);
            v54 = *(float64x2_t *)((char *)&v110 + v45 + 16);
            v56 = (float64x2_t *)((char *)&v118 + v45);
            *v56 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v47, v55.f64[0]), v49, v55, 1), v51, v54.f64[0]), v53, v54, 1);
            v56[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v46, v55.f64[0]), v48, v55, 1), v50, v54.f64[0]), v52, v54, 1);
            v45 += 32;
          }
          while (v45 != 128);
          v57 = 0;
          v59 = buf[0];
          v58 = buf[1];
          v61 = v181;
          v60 = v182;
          v63 = v183;
          v62 = v184;
          v65 = v185;
          v64 = v186;
          v106 = v122;
          v107 = v123;
          v108 = v124;
          v109 = v125;
          v102 = v118;
          v103 = v119;
          v104 = v120;
          v105 = v121;
          v116 = v33;
          v117 = v33;
          v114 = v33;
          v115 = v33;
          v112 = v33;
          v113 = v33;
          v110 = v33;
          v111 = v33;
          do
          {
            v67 = *(float64x2_t *)((char *)&v102 + v57);
            v66 = *(float64x2_t *)((char *)&v102 + v57 + 16);
            v68 = (float64x2_t *)((char *)&v110 + v57);
            *v68 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v59, v67.f64[0]), v61, v67, 1), v63, v66.f64[0]), v65, v66, 1);
            v68[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v58, v67.f64[0]), v60, v67, 1), v62, v66.f64[0]), v64, v66, 1);
            v57 += 32;
          }
          while (v57 != 128);
          v69 = 0;
          v70 = v159;
          v71 = v158;
          v72 = v161;
          v73 = v160;
          v74 = v163;
          v75 = v162;
          v76 = v165;
          v77 = v164;
          v98 = v114;
          v99 = v115;
          v100 = v116;
          v101 = v117;
          v94 = v110;
          v95 = v111;
          v96 = v112;
          v97 = v113;
          v108 = v33;
          v109 = v33;
          v106 = v33;
          v107 = v33;
          v104 = v33;
          v105 = v33;
          v102 = v33;
          v103 = v33;
          do
          {
            v79 = *(float64x2_t *)((char *)&v94 + v69);
            v78 = *(float64x2_t *)((char *)&v94 + v69 + 16);
            v80 = (float64x2_t *)((char *)&v102 + v69);
            *v80 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v71, v79.f64[0]), v73, v79, 1), v75, v78.f64[0]), v77, v78, 1);
            v80[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v70, v79.f64[0]), v72, v79, 1), v74, v78.f64[0]), v76, v78, 1);
            v69 += 32;
          }
          while (v69 != 128);
          v98 = v106;
          v99 = v107;
          v100 = v108;
          v101 = v109;
          v94 = v102;
          v95 = v103;
          v96 = v104;
          v97 = v105;
          *(double *)&v81 = ARMatrix4x4DoubleToFloat(&v94);
          v82 = 0;
          v178[0] = v81;
          v178[1] = v83;
          v178[2] = v84;
          v178[3] = v85;
          v94 = 0u;
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v94 + v82 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(v178[v82])), a7, *(float32x2_t *)&v178[v82], 1), a8, (float32x4_t)v178[v82], 2), a9, (float32x4_t)v178[v82], 3);
            ++v82;
          }
          while (v82 != 4);
          objc_msgSend(v26, "setTransform:", v94.f64[0], v95.f64[0], v96.f64[0], v97.f64[0]);
          objc_msgSend(v26, "setIsTracked:", 1);
        }
      }
      v22 = obj;
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v174, v179, 16);
    }
    while (v24);
  }

  return v22;
}

uint64_t __108__ARGeoTrackingData_anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARGeoTrackingData)initWithCoder:(id)a3
{
  id v4;
  ARGeoTrackingData *v5;
  uint64_t v6;
  ARLocationData *enuOrigin;
  ARGeoTrackingData v8;
  ARGeoTrackingData v9;
  ARGeoTrackingData v10;
  ARGeoTrackingData v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARGeoTrackingData;
  v5 = -[ARGeoTrackingData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("enuOrigin"));
    v6 = objc_claimAutoreleasedReturnValue();
    enuOrigin = v5->_enuOrigin;
    v5->_enuOrigin = (ARLocationData *)v6;

    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("vioFromENU"));
    v5[1] = v8;
    v5[2] = v9;
    v5[3] = v10;
    v5[4] = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ARLocationData *enuOrigin;
  id v5;

  enuOrigin = self->_enuOrigin;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", enuOrigin, CFSTR("enuOrigin"));
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", CFSTR("vioFromENU"), *(double *)&self[1].super.isa, *(double *)&self[2].super.isa, *(double *)&self[3].super.isa, *(double *)&self[4].super.isa);

}

- (ARLocationData)enuOrigin
{
  return self->_enuOrigin;
}

- (__n128)vioFromENU
{
  return a1[1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enuOrigin, 0);
}

@end
