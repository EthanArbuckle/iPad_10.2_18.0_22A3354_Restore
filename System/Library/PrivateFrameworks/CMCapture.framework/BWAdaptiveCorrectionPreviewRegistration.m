@implementation BWAdaptiveCorrectionPreviewRegistration

- (uint64_t)_computeApproximateHomographyAtDepth:(uint64_t)a3@<X2> calibration:(void *)a4@<X3> narrowerPortType:(unint64_t)a5@<X4> widerMetadata:(float64x2_t *)a6@<X8> pixelBufferDimensions:(double)a7@<D0>
{
  uint64_t v45;
  unint64_t v46;
  __int128 v47;
  uint64_t v48;
  char v49;
  char v55;
  unint64_t *v56;
  __int128 v57;
  unint64_t *v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t *v67;
  uint64_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t *v78;
  uint64_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float64x2_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  float64x2_t v110;
  float64x2_t v111;
  float64x2_t v112;
  float64x2_t v113;
  float64x2_t v114;
  float64x2_t *v115;
  __int128 v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  double v121;
  int v122;
  double v123;
  __int128 v124;
  __int128 v125;
  float64x2_t v126;
  __int128 v127;
  float64x2_t v128;
  uint64_t v129;
  float64x2_t v130;
  __int128 v131;
  float64x2_t v132;
  float64x2_t v133;
  float64x2_t v136;
  float64x2_t v137;
  float64x2_t *v138;
  uint64_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v142;
  float64x2_t v143;
  float64x2_t v144;
  float64x2_t v145;
  float64x2_t v146;
  float64x2_t v147;
  float64x2_t *v148;
  float64x2_t v149;
  float64x2_t v150;
  float64x2_t v151;
  float64x2_t v152;
  float64x2_t v153;
  __int128 v154;
  __int128 v155;
  float64x2_t v156;
  float64x2_t v157;
  float64x2_t vars0;

  STACK[0x778] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v45 = result;
    v46 = HIDWORD(a5);
    objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v48 = 0;
    v49 = 1;
    __asm { FMOV            V20.2D, #1.0 }
    do
    {
      v55 = v49;
      v56 = &a2[v48];
      *(_QWORD *)&v57 = v56[2];
      v58 = &STACK[0x6B0] + 12 * v48;
      *((_QWORD *)&v59 + 1) = 0;
      *(_QWORD *)&v60 = 0;
      *((_QWORD *)&v60 + 1) = *v56;
      *((_QWORD *)&v57 + 1) = v56[4];
      *(_OWORD *)v58 = *v56;
      *((_OWORD *)v58 + 1) = 0uLL;
      *((_OWORD *)v58 + 2) = v60;
      *((_OWORD *)v58 + 3) = 0uLL;
      *((_OWORD *)v58 + 4) = v57;
      *((float64x2_t *)v58 + 5) = _Q20;
      v48 = 1;
      v49 = 0;
    }
    while ((v55 & 1) != 0);
    v61 = 0;
    v64.f64[0] = (float64_t)a2[6];
    *(_QWORD *)&v62 = a2[7];
    *(_QWORD *)&v63 = a2[8];
    v64.f64[1] = (float64_t)a2[10];
    *(_QWORD *)&v59 = a2[14];
    *(_QWORD *)&v60 = a2[15];
    *(_QWORD *)&v47 = a2[16];
    *((_QWORD *)&v62 + 1) = a2[11];
    *((_QWORD *)&v63 + 1) = a2[12];
    *(float64x2_t *)&STACK[0x640] = v64;
    *(_OWORD *)&STACK[0x650] = v59;
    *(_OWORD *)&STACK[0x660] = v62;
    *(_OWORD *)&STACK[0x670] = v60;
    *(_OWORD *)&STACK[0x680] = v63;
    *(_OWORD *)&STACK[0x690] = v47;
    a30 = 0u;
    a31 = 0u;
    a32 = 0u;
    a33 = 0u;
    v64.f64[1] = -1.0;
    a34 = 0u;
    a35 = 0u;
    do
    {
      v66 = *(float64x2_t *)((char *)&STACK[0x640] + v61);
      v65 = *(float64x2_t *)((char *)&STACK[0x640] + v61 + 16);
      v67 = (float64x2_t *)((char *)&a30 + v61);
      *v67 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1A32A2320, v66.f64[0]), (float64x2_t)xmmword_1A32A2330, v66, 1), (float64x2_t)0, v65.f64[0]);
      v67[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v66, (float64x2_t)0), (float64x2_t)0, v66, 1), _Q20, v65);
      v61 += 32;
    }
    while (v61 != 96);
    v68 = 0;
    v72 = a30;
    v69 = a31;
    v73 = a32;
    v70 = a33;
    v74 = a34;
    v71 = a35;
    *(_OWORD *)&STACK[0x640] = xmmword_1A32A2320;
    *(_OWORD *)&STACK[0x650] = 0u;
    *(_OWORD *)&STACK[0x660] = xmmword_1A32A2330;
    *(_OWORD *)&STACK[0x670] = 0u;
    *(_OWORD *)&STACK[0x680] = 0uLL;
    *(float64x2_t *)&STACK[0x690] = _Q20;
    a36 = 0u;
    a37 = 0u;
    a38 = 0u;
    a39 = 0u;
    *(_OWORD *)&STACK[0x620] = 0u;
    *(_OWORD *)&STACK[0x630] = 0u;
    *(_QWORD *)&v72.f64[1] = vextq_s8((int8x16_t)v72, (int8x16_t)v72, 8uLL).u64[0];
    *(_QWORD *)&v73.f64[1] = vextq_s8((int8x16_t)v73, (int8x16_t)v73, 8uLL).u64[0];
    *(_QWORD *)&v74.f64[1] = vextq_s8((int8x16_t)v74, (int8x16_t)v74, 8uLL).u64[0];
    do
    {
      v76 = *(float64x2_t *)((char *)&STACK[0x640] + v68);
      v75 = *(float64x2_t *)((char *)&STACK[0x640] + v68 + 16);
      v77 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v69, v76), v70, v76, 1), v75, v71);
      v78 = (float64x2_t *)((char *)&a36 + v68);
      *v78 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v72, v76.f64[0]), v73, v76, 1), v74, v75.f64[0]);
      v78[1] = v77;
      v68 += 32;
    }
    while (v68 != 96);
    v79 = 0;
    v75.f64[0] = (float64_t)a2[9];
    v76.f64[0] = (float64_t)a2[13];
    v77.f64[0] = (float64_t)a2[17];
    v80 = vmulq_n_f64((float64x2_t)xmmword_1A32A2320, v75.f64[0]);
    v156 = _Q20;
    v81 = vmlaq_f64(vmlaq_f64(vmulq_f64(v75, (float64x2_t)0), (float64x2_t)0, v76), _Q20, v77);
    v82 = vmlaq_n_f64(vmlaq_n_f64(v80, (float64x2_t)xmmword_1A32A2330, v76.f64[0]), (float64x2_t)0, v77.f64[0]);
    v64.f64[0] = -1.0 / a7;
    v83 = vmulq_f64(v64, (float64x2_t)0);
    v84 = vmulq_n_f64((float64x2_t)0, -1.0 / a7);
    v85 = vsubq_f64(a36, v84);
    v86 = vsubq_f64(a37, v83);
    v87 = vsubq_f64(a38, v84);
    v88 = vsubq_f64(a39, v83);
    v89 = vsubq_f64(*(float64x2_t *)&STACK[0x620], vmulq_n_f64(v82, -1.0 / a7));
    v90 = vsubq_f64(*(float64x2_t *)&STACK[0x630], vmulq_f64(v64, v81));
    v94 = *(float64x2_t *)&STACK[0x710];
    v91 = *(float64x2_t *)&STACK[0x720];
    v95 = *(float64x2_t *)&STACK[0x730];
    v92 = *(float64x2_t *)&STACK[0x740];
    v96 = *(float64x2_t *)&STACK[0x750];
    v93 = *(float64x2_t *)&STACK[0x760];
    *(float64x2_t *)&STACK[0x640] = v85;
    *(float64x2_t *)&STACK[0x650] = v86;
    *(float64x2_t *)&STACK[0x660] = v87;
    *(float64x2_t *)&STACK[0x670] = v88;
    *(float64x2_t *)&STACK[0x680] = v89;
    *(float64x2_t *)&STACK[0x690] = v90;
    a36 = 0u;
    a37 = 0u;
    a38 = 0u;
    a39 = 0u;
    *(_OWORD *)&STACK[0x620] = 0u;
    *(_OWORD *)&STACK[0x630] = 0u;
    *(_QWORD *)&v94.f64[1] = vextq_s8((int8x16_t)v94, (int8x16_t)v94, 8uLL).u64[0];
    *(_QWORD *)&v95.f64[1] = vextq_s8((int8x16_t)v95, (int8x16_t)v95, 8uLL).u64[0];
    *(_QWORD *)&v96.f64[1] = vextq_s8((int8x16_t)v96, (int8x16_t)v96, 8uLL).u64[0];
    do
    {
      v98 = *(float64x2_t *)((char *)&STACK[0x640] + v79);
      v97 = *(float64x2_t *)((char *)&STACK[0x640] + v79 + 16);
      v99 = (float64x2_t *)((char *)&a36 + v79);
      *v99 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v94, v98.f64[0]), v95, v98, 1), v96, v97.f64[0]);
      v99[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v91, v98), v92, v98, 1), v97, v93);
      v79 += 32;
    }
    while (v79 != 96);
    v100 = *(_OWORD *)&STACK[0x6E0];
    *(_OWORD *)&STACK[0x660] = *(_OWORD *)&STACK[0x6D0];
    *(_OWORD *)&STACK[0x670] = v100;
    v101 = *(_OWORD *)&STACK[0x700];
    *(_OWORD *)&STACK[0x680] = *(_OWORD *)&STACK[0x6F0];
    *(_OWORD *)&STACK[0x690] = v101;
    v102 = *(_OWORD *)&STACK[0x6C0];
    *(_OWORD *)&STACK[0x640] = *(_OWORD *)&STACK[0x6B0];
    *(_OWORD *)&STACK[0x650] = v102;
    __invert_d3();
    v103 = 0;
    v110 = a36;
    v104 = a37;
    v111 = a38;
    v105 = a39;
    v112 = *(float64x2_t *)&STACK[0x620];
    v106 = *(float64x2_t *)&STACK[0x630];
    v107 = a21;
    *(_OWORD *)&STACK[0x660] = a20;
    *(_OWORD *)&STACK[0x670] = v107;
    v108 = a23;
    *(_OWORD *)&STACK[0x680] = a22;
    *(_OWORD *)&STACK[0x690] = v108;
    v109 = a19;
    *(_OWORD *)&STACK[0x640] = a18;
    *(_OWORD *)&STACK[0x650] = v109;
    a24 = 0u;
    a25 = 0u;
    a26 = 0u;
    a27 = 0u;
    a28 = 0u;
    a29 = 0u;
    *(_QWORD *)&v110.f64[1] = vextq_s8((int8x16_t)v110, (int8x16_t)v110, 8uLL).u64[0];
    *(_QWORD *)&v111.f64[1] = vextq_s8((int8x16_t)v111, (int8x16_t)v111, 8uLL).u64[0];
    *(_QWORD *)&v112.f64[1] = vextq_s8((int8x16_t)v112, (int8x16_t)v112, 8uLL).u64[0];
    do
    {
      v114 = *(float64x2_t *)((char *)&STACK[0x640] + v103);
      v113 = *(float64x2_t *)((char *)&STACK[0x640] + v103 + 16);
      v115 = (float64x2_t *)((char *)&a24 + v103);
      *v115 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v110, v114.f64[0]), v111, v114, 1), v112, v113.f64[0]);
      v115[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v104, v114), v105, v114, 1), v113, v106);
      v103 += 32;
    }
    while (v103 != 96);
    a38 = a26;
    a39 = a27;
    v116 = a29;
    *(_OWORD *)&STACK[0x620] = a28;
    *(_OWORD *)&STACK[0x630] = v116;
    a36 = a24;
    a37 = a25;
    v117 = (void *)objc_msgSend(*(id *)(v45 + 48), "objectForKeyedSubscript:", a3);
    v118 = (void *)objc_msgSend(v117, "objectForKeyedSubscript:", *MEMORY[0x1E0D05978]);
    v119 = (void *)objc_msgSend(v118, "objectForKeyedSubscript:", *MEMORY[0x1E0D05BC8]);
    v120 = (void *)objc_msgSend(v118, "objectForKeyedSubscript:", *MEMORY[0x1E0D05B90]);
    v121 = (double)(int)objc_msgSend(v119, "intValue");
    v122 = objc_msgSend(v120, "intValue");
    v123 = v121 / (double)(int)a5;
    *(double *)&v124 = v121 * 0.5 + (double)(int)a5 * -0.5 * v123;
    *(_QWORD *)&v125 = 0;
    *((double *)&v125 + 1) = v123;
    v154 = v125;
    *((double *)&v124 + 1) = (double)v122 * 0.5 + (double)(int)v46 * -0.5 * v123;
    v155 = v124;
    a28 = 0u;
    a29 = 0u;
    a26 = 0u;
    a27 = 0u;
    a24 = 0u;
    a25 = 0u;
    acpr_computePixelBufferToRawSensorHomography(a4, a5, (uint64_t)&a24);
    v126 = a27;
    *(float64x2_t *)&STACK[0x660] = a26;
    *(float64x2_t *)&STACK[0x670] = v126;
    v127 = a29;
    *(_OWORD *)&STACK[0x680] = a28;
    *(_OWORD *)&STACK[0x690] = v127;
    v128 = a25;
    *(float64x2_t *)&STACK[0x640] = a24;
    *(float64x2_t *)&STACK[0x650] = v128;
    result = __invert_d3();
    v129 = 0;
    v130 = a39;
    *(float64x2_t *)&STACK[0x660] = a38;
    *(float64x2_t *)&STACK[0x670] = v130;
    v131 = *(_OWORD *)&STACK[0x630];
    *(_OWORD *)&STACK[0x680] = *(_OWORD *)&STACK[0x620];
    *(_OWORD *)&STACK[0x690] = v131;
    v132 = a37;
    *(float64x2_t *)&STACK[0x640] = a36;
    *(float64x2_t *)&STACK[0x650] = v132;
    v133 = v157;
    a12 = 0u;
    a13 = 0u;
    a14 = 0u;
    a15 = 0u;
    a16 = 0u;
    a17 = 0u;
    *(_QWORD *)&v133.f64[1] = vextq_s8((int8x16_t)v133, (int8x16_t)v133, 8uLL).u64[0];
    *(_QWORD *)&a8.f64[1] = vextq_s8((int8x16_t)a8, (int8x16_t)a8, 8uLL).u64[0];
    *(_QWORD *)&a10.f64[1] = vextq_s8((int8x16_t)a10, (int8x16_t)a10, 8uLL).u64[0];
    do
    {
      v137 = *(float64x2_t *)((char *)&STACK[0x640] + v129);
      v136 = *(float64x2_t *)((char *)&STACK[0x640] + v129 + 16);
      v138 = (float64x2_t *)((char *)&a12 + v129);
      *v138 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v133, v137.f64[0]), a8, v137, 1), a10, v136.f64[0]);
      v138[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(vars0, v137), a9, v137, 1), v136, a11);
      v129 += 32;
    }
    while (v129 != 96);
    v139 = 0;
    v143 = a12;
    v140 = a13;
    v144 = a14;
    v141 = a15;
    v145 = a16;
    v142 = a17;
    *(_OWORD *)&STACK[0x640] = COERCE_UNSIGNED_INT64(v121 / (double)(int)a5);
    *(_OWORD *)&STACK[0x650] = 0u;
    *(_OWORD *)&STACK[0x660] = v154;
    *(_OWORD *)&STACK[0x670] = 0uLL;
    *(float64x2_t *)&STACK[0x690] = v156;
    *(_OWORD *)&STACK[0x680] = v155;
    *a6 = 0u;
    a6[1] = 0u;
    a6[2] = 0u;
    a6[3] = 0u;
    a6[4] = 0u;
    a6[5] = 0u;
    *(_QWORD *)&v143.f64[1] = vextq_s8((int8x16_t)v143, (int8x16_t)v143, 8uLL).u64[0];
    *(_QWORD *)&v144.f64[1] = vextq_s8((int8x16_t)v144, (int8x16_t)v144, 8uLL).u64[0];
    *(_QWORD *)&v145.f64[1] = vextq_s8((int8x16_t)v145, (int8x16_t)v145, 8uLL).u64[0];
    do
    {
      v147 = *(float64x2_t *)((char *)&STACK[0x640] + v139 * 16);
      v146 = *(float64x2_t *)((char *)&STACK[0x640] + v139 * 16 + 16);
      v148 = &a6[v139];
      *v148 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v143, v147.f64[0]), v144, v147, 1), v145, v146.f64[0]);
      v148[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v140, v147), v141, v147, 1), v146, v142);
      v139 += 2;
    }
    while (v139 != 6);
    v149 = a6[5];
    v150 = vmulq_f64(v149, a6[1]);
    v151 = vmulq_f64(v149, a6[3]);
    v152 = vmulq_n_f64(a6[2], v149.f64[0]);
    v153 = vmulq_n_f64(a6[4], v149.f64[0]);
    *a6 = vmulq_n_f64(*a6, v149.f64[0]);
    a6[1] = v150;
    a6[2] = v152;
    a6[3] = v151;
    a6[4] = v153;
    a6[5] = vmulq_f64(v149, v149);
  }
  else
  {
    a6[4] = 0u;
    a6[5] = 0u;
    a6[2] = 0u;
    a6[3] = 0u;
    *a6 = 0u;
    a6[1] = 0u;
  }
  return result;
}

- (uint64_t)_computeApproximateOISCalibrationFromWiderMetadata:(uint64_t)a3 narrowerPortType:(double *)a4 narrowerToWiderCameraScale:(double)a5 calibrationOut:
{
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int32x4_t v19;
  uint64_t *v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  double v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  double v29;
  double v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  float v41;
  float v42;
  CGPoint *v43;
  BOOL v44;
  float v45;
  int v46;
  float v47;
  double y;
  void *v49;
  float v50;
  float v51;
  int v52;
  float v53;
  float v54;
  const __CFDictionary *v55;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  uint64_t v58;
  float v59;
  float v60;
  void *v61;
  void *v62;
  int v63;
  int v64;
  void *v65;
  uint64_t v66;
  CGFloat v67;
  CGFloat v68;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  CGPoint point;
  CMTime time;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  CMTimeValue value;
  CMTimeScale timescale;
  double v82;
  double v83;
  CGPoint v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  objc_msgSend(v10, "setObject:atIndexedSubscript:", a3, 0);
  objc_msgSend(v10, "setObject:atIndexedSubscript:", objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]), 1);
  v11 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
  v12 = *MEMORY[0x1E0D058E8];
  v13 = (uint64_t *)objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D058E8]), "bytes");
  v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", 0)), "objectForKeyedSubscript:", v12), "bytes");
  if (!v13 || (v20 = (uint64_t *)v14) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_25;
  }
  *(double *)v21.i64 = acpr_convertFloatRowMajorArrayToSimdMatrix(v13, v15, v16, v17, v18, v19);
  v21.i32[3] = 0;
  v22.i32[3] = 0;
  v71 = v22;
  v72 = v21;
  v23.i32[3] = 0;
  v70 = v23;
  *(double *)v26.i64 = acpr_convertFloatRowMajorArrayToSimdMatrix(v20, *(double *)v21.i64, *(double *)v22.i64, *(double *)v23.i64, v24, v25);
  v26.i32[3] = 0;
  v27.i32[3] = 0;
  v28.i32[3] = 0;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v30 = acpr_computeRelativeExtrinsics(v26, v27, v28, v29, v72, v71, v70);
  v31 = 0;
  DWORD2(v76) = v32;
  DWORD2(v77) = v33;
  *(double *)&v76 = v30;
  *(_QWORD *)&v77 = v34;
  DWORD2(v78) = v35;
  DWORD2(v79) = v36;
  v37 = a4 + 6;
  *(_QWORD *)&v78 = v38;
  *(_QWORD *)&v79 = v39;
  do
  {
    for (i = 0; i != 4; ++i)
      v37[i] = *(float *)((unint64_t)(&v76 + i) & 0xFFFFFFFFFFFFFFF3 | (4 * (v31 & 3)));
    ++v31;
    v37 += 4;
  }
  while (v31 != 3);
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CF0]), "floatValue");
  if (v41 == 0.0
    || ((v42 = v41,
         CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CE0]), &v84), v43 = (CGPoint *)MEMORY[0x1E0C9D538], v84.x == *MEMORY[0x1E0C9D538])? (v44 = v84.y == *(double *)(MEMORY[0x1E0C9D538] + 8)): (v44 = 0), v44))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0xFFFFFFFFLL;
  }
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D40], v84.x, v84.y), "floatValue");
  v46 = (int)v45;
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D38]), "floatValue");
  y = v84.y;
  a4[3] = ((double)v46 + -1.0) * 0.5 + v84.x - ((double)v46 + -1.0) * 0.5;
  a4[5] = ((double)(int)v47 + -1.0) * 0.5 + y - ((double)(int)v47 + -1.0) * 0.5;
  v49 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
  objc_msgSend((id)objc_msgSend(v49, "objectForKeyedSubscript:", *MEMORY[0x1E0D05968]), "floatValue");
  v51 = v50;
  v52 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
  v53 = (float)v52;
  if (!v52)
    v53 = 1.0;
  v54 = v51 * v53;
  a4[1] = (float)(v42 / v54);
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B50]))
    goto LABEL_20;
  v55 = (const __CFDictionary *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]);
  v75 = 0;
  value = *MEMORY[0x1E0CA2E18];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  if (!v55)
  {
    flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
    epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    if ((flags & 1) != 0)
      goto LABEL_18;
    goto LABEL_23;
  }
  CMTimeMakeFromDictionary(&time, v55);
  value = time.value;
  flags = time.flags;
  timescale = time.timescale;
  epoch = time.epoch;
  if ((time.flags & 1) == 0)
  {
LABEL_23:
    fig_log_get_emitter();
LABEL_25:
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
LABEL_18:
  time.value = value;
  time.timescale = timescale;
  time.flags = flags;
  time.epoch = epoch;
  CMTimeGetSeconds(&time);
  v58 = FigMotionComputeAverageSpherePosition();
  if ((_DWORD)v58)
  {
    v66 = v58;
    fig_log_get_emitter();
    FigDebugAssert3();
    return v66;
  }
  v59 = *((float *)&v75 + 1);
  a4[3] = a4[3] + (float)((float)(1.0 / v54) * *(float *)&v75);
  a4[5] = a4[5] + (float)((float)(1.0 / v54) * v59);
LABEL_20:
  objc_msgSend(v10, "setObject:atIndexedSubscript:", a3, 0);
  v60 = 1.0 / a5 * v42;
  v61 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", a3);
  v62 = (void *)objc_msgSend(v61, "objectForKeyedSubscript:", *MEMORY[0x1E0D05978]);
  v63 = objc_msgSend((id)objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E0D05BC8]), "intValue");
  v64 = objc_msgSend((id)objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E0D05B90]), "intValue");
  v82 = (double)v63 * 0.5;
  v83 = (double)v64 * 0.5;
  point = *v43;
  v65 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", a3);
  CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v65, "objectForKeyedSubscript:", *MEMORY[0x1E0D05960]), &point);
  v66 = 0;
  v67 = point.x + v82;
  v68 = point.y + v83;
  *a4 = v60;
  a4[2] = v67;
  a4[4] = v68;
  return v66;
}

- (int)computeApproximateCorrectionForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCameraPortType:(id)a4 narrowerPixelBufferDimensions:(id)a5 narrowerToWiderCameraScale:(double)a6 narrowerToWiderTransformsOut:(id *)a7
{
  void *v12;
  int v13;
  uint64_t v14;
  float64x2_t *v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  int v19;
  float64x2_t v21;
  float64x2_t __src[18];
  __int128 v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  __int128 v32;
  __int128 v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64_t v42;

  if (a3 && a4 && a7)
  {
    v12 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0.0;
    v13 = -[BWAdaptiveCorrectionPreviewRegistration _computeApproximateOISCalibrationFromWiderMetadata:narrowerPortType:narrowerToWiderCameraScale:calibrationOut:]((uint64_t)self, v12, (uint64_t)a4, v31.f64, a6);
    if (v13)
    {
      v19 = v13;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
      v24.f64[0] = v42;
      -[BWAdaptiveCorrectionPreviewRegistration _computeApproximateHomographyAtDepth:calibration:narrowerPortType:widerMetadata:pixelBufferDimensions:]((uint64_t)self, &v23, (uint64_t)a4, v12, *(_QWORD *)&a5, &v25, 1.0e10, v21, __src[0], __src[1], __src[2], __src[3], __src[4], __src[5], __src[6], __src[7], __src[8], *(_OWORD *)&__src[9], *(_OWORD *)&__src[10],
        *(_OWORD *)&__src[11],
        *(_OWORD *)&__src[12],
        *(_OWORD *)&__src[13],
        *(_OWORD *)&__src[14],
        __src[15],
        __src[16],
        __src[17],
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        v41,
        v24,
        (float64x2_t)0);
      v14 = 0;
      memset(__src, 0, sizeof(__src));
      do
      {
        v15 = &__src[v14];
        v16 = v28;
        v15[2] = v27;
        v15[3] = v16;
        v17 = v30;
        v15[4] = v29;
        v15[5] = v17;
        v18 = v26;
        v14 += 6;
        *v15 = v25;
        v15[1] = v18;
      }
      while (v14 != 18);
      memcpy(a7, __src, 0x120uLL);
      return 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  return v19;
}

+ (BOOL)flattenNarrowerToWiderTransforms:(int)a3@<W4> narrowerDimensions:(_OWORD *)a4@<X8> narrowerFinalCropRect:(double)a5@<D0> atNarrowerToWiderCameraScale:(double)a6@<D1> useYAnchorAtHeightCenter:(double)a7@<D2>
{
  __int128 v32;
  int64x2_t v33;
  _BOOL8 result;
  float64x2_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  int64x2_t v40;
  int64x2_t v41;
  int8x16_t v42;
  unint64_t v43;
  int8x16_t v44;
  int64x2_t v45;
  int64x2_t v46;
  float64x2_t v52;
  uint64_t v54;
  _OWORD *v55;
  int8x16_t v56;
  float64x2_t v57;
  int8x16_t v58;
  float64x2_t v59;
  int8x16_t v60;
  float64x2_t v61;
  int64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t *v75;
  uint64_t i;
  double v77;
  float64x2_t v78;
  _OWORD *v79;
  float64x2_t v80;
  __int128 v82;
  __int128 v83;
  float64x2_t v85;
  double v86;

  a29 = *MEMORY[0x1E0C80C00];
  a4[16] = 0u;
  a4[17] = 0u;
  a4[14] = 0u;
  a4[15] = 0u;
  a4[12] = 0u;
  a4[13] = 0u;
  a4[10] = 0u;
  a4[11] = 0u;
  a4[8] = 0u;
  a4[9] = 0u;
  a4[6] = 0u;
  a4[7] = 0u;
  a4[4] = 0u;
  a4[5] = 0u;
  *(_QWORD *)&v32 = 0;
  a4[2] = 0u;
  a4[3] = 0u;
  v86 = a9.n128_f64[0] + -1.0;
  v33.i64[0] = (int)a2;
  v33.i64[1] = SHIDWORD(a2);
  *a4 = 0u;
  a4[1] = 0u;
  v85 = vcvtq_f64_s64(v33);
  *((_QWORD *)&v32 + 1) = a9.n128_u64[0];
  v82 = v32;
  v83 = a9.n128_u64[0];
  result = FigCaptureMetadataUtilitiesDenormalizeCropRect(a5, a6, a7, a8);
  *(_QWORD *)&v35.f64[0] = a9.n128_u64[0];
  v36 = 0;
  a26 = v37;
  a27 = v37 + v38;
  a28 = v37 + v38 * 0.5;
  v40 = (int64x2_t)vmlaq_n_f64((float64x2_t)vdupq_lane_s64(v42.i64[0], 0), (float64x2_t)xmmword_1A32A2340, v39);
  v41 = vdupq_laneq_s64(v40, 1);
  *(double *)v42.i64 = *(double *)v42.i64 + v39 * 0.75;
  if (a3)
    v43 = -1;
  else
    v43 = 0;
  v44 = (int8x16_t)vdupq_n_s64(v43);
  v45 = (int64x2_t)vbslq_s8(v44, (int8x16_t)v41, (int8x16_t)v40);
  v46 = (int64x2_t)vbslq_s8(v44, (int8x16_t)v41, v42);
  __asm { FMOV            V3.2D, #0.5 }
  v52 = vmulq_f64(vmulq_n_f64(v85, v86), _Q3);
  __asm { FMOV            V3.2D, #1.0 }
  *(_QWORD *)&v35.f64[1] = a9.n128_u64[0];
  do
  {
    v54 = 0;
    v55 = (_OWORD *)(a1 + 96 * v36);
    v56 = *(int8x16_t *)v55;
    v57 = *((float64x2_t *)v55 + 1);
    v58 = *((int8x16_t *)v55 + 2);
    v59 = *((float64x2_t *)v55 + 3);
    v60 = *((int8x16_t *)v55 + 4);
    v61 = *((float64x2_t *)v55 + 5);
    v41.i64[0] = *(uint64_t *)(&a26 + v36);
    v62 = vdupq_lane_s64(v41.i64[0], 0);
    v63 = (float64x2_t)vzip1q_s64(v62, v45);
    v64 = (float64x2_t)vzip2q_s64(v62, v45);
    v65 = (float64x2_t)vzip1q_s64(v41, v46);
    a20 = v63;
    a21 = _Q3;
    a22 = v64;
    a23 = _Q3;
    a24 = v65;
    a25 = _Q3;
    a14 = 0uLL;
    a15 = 0uLL;
    a16 = 0uLL;
    a17 = 0uLL;
    a18 = 0uLL;
    a19 = 0uLL;
    v66 = vextq_s8(v56, v56, 8uLL).u64[0];
    v67 = vextq_s8(v58, v58, 8uLL).u64[0];
    v68 = vextq_s8(v60, v60, 8uLL).u64[0];
    do
    {
      v70 = *(float64x2_t *)((char *)&a20 + v54);
      v69 = *(float64x2_t *)((char *)&a20 + v54 + 16);
      *(_QWORD *)&v71.f64[0] = v56.i64[0];
      *(_QWORD *)&v71.f64[1] = v66;
      *(_QWORD *)&v72.f64[0] = v58.i64[0];
      *(_QWORD *)&v72.f64[1] = v67;
      v73 = vmlaq_laneq_f64(vmulq_n_f64(v71, v70.f64[0]), v72, v70, 1);
      v74 = vmlaq_laneq_f64(vmulq_f64(v57, v70), v59, v70, 1);
      *(_QWORD *)&v70.f64[0] = v60.i64[0];
      *(_QWORD *)&v70.f64[1] = v68;
      v75 = (float64x2_t *)((char *)&a14 + v54);
      *v75 = vmlaq_n_f64(v73, v70, v69.f64[0]);
      v75[1] = vmlaq_f64(v74, v69, v61);
      v54 += 32;
    }
    while (v54 != 96);
    for (i = 0; i != 12; i += 4)
    {
      v77 = *(double *)((char *)&a14 + i * 8 + 16);
      v78.f64[0] = a14.f64[i] / v77;
      v78.f64[1] = a14.f64[i + 1] / v77;
      *(float64x2_t *)((char *)&a14 + i * 8) = v78;
    }
    v79 = &a4[6 * v36];
    v80 = vaddq_f64(vaddq_f64(vsubq_f64(a14, vmulq_f64(v35, v63)), vsubq_f64(a16, vmulq_f64(v35, v64))), vsubq_f64(a18, vmulq_f64(v35, v65)));
    __asm { FMOV            V5.2D, #3.0 }
    *v79 = v83;
    v79[1] = 0uLL;
    v79[2] = v82;
    v79[3] = 0uLL;
    v41 = (int64x2_t)vaddq_f64(v52, vdivq_f64(v80, _Q5));
    v79[4] = v41;
    v79[5] = _Q3;
    *((_QWORD *)v79 + 10) = 0x3FF0000000000000;
    ++v36;
  }
  while (v36 != 3);
  return result;
}

- (BWAdaptiveCorrectionPreviewRegistration)initWithCameraInfoByPortType:(id)a3 excludeStaticComponentFromAlignmentShifts:(BOOL)a4
{
  BWAdaptiveCorrectionPreviewRegistration *v6;
  BWAdaptiveCorrectionPreviewRegistration *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v24;
  BWAdaptiveCorrectionPreviewRegistration *v25;
  uint64_t v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)BWAdaptiveCorrectionPreviewRegistration;
  v6 = -[BWAdaptiveCorrectionPreviewRegistration init](&v36, sel_init);
  v7 = v6;
  if (a3)
  {
    if (v6)
    {
      v24 = a4;
      v6->_tuningParameters = objc_alloc_init(BWAdaptiveCorrectionPreviewRegistrationTuningParameters);
      v25 = v7;
      v7->_estimatedSagPositionsByPortType = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v30 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      obj = (id)objc_msgSend(a3, "allKeys");
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v31)
      {
        v29 = *(_QWORD *)v33;
        v8 = *MEMORY[0x1E0D05968];
        v9 = *MEMORY[0x1E0D058E8];
        v28 = *MEMORY[0x1E0D05A28];
        v10 = *MEMORY[0x1E0D058B8];
        v26 = *MEMORY[0x1E0D058C0];
        v11 = *MEMORY[0x1E0D05978];
        v12 = *MEMORY[0x1E0D05960];
        while (2)
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v33 != v29)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v16 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v8);
            if (!v16)
              goto LABEL_19;
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v8);
            v17 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v9);
            if (!v17)
              goto LABEL_19;
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v9);
            v18 = objc_msgSend(v14, "isEqualToString:", v28);
            v19 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v14);
            if (v18)
            {
              v20 = objc_msgSend(v19, "objectForKeyedSubscript:", v26);
              if (!v20)
                goto LABEL_19;
            }
            else
            {
              v20 = objc_msgSend(v19, "objectForKeyedSubscript:", v10);
              if (!v20)
                goto LABEL_19;
            }
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, v10);
            v21 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v11);
            if (!v21
              || (objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v11),
                  (v22 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v12)) == 0))
            {
LABEL_19:
              fig_log_get_emitter();
              FigDebugAssert3();
              v7 = v25;
              goto LABEL_20;
            }
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v12);
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v15, v14);
          }
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v31)
            continue;
          break;
        }
      }
      v7 = v25;
      v25->_staticParametersByPortType = (NSDictionary *)v30;
      v25->_registrationPoolReadyAssertion = (BWMemoryPoolFlushAssertion *)-[BWMemoryPool newFlushAssertion:](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "newFlushAssertion:", CFSTR("BWAdaptiveCorrectionPreviewRegistration registrationPool"));
      v25->_excludeExtrinsicsCorrectionFromWideTeleAlignment = v24;
      v25->_excludeEstimatedSagFromWideTeleAlignment = v24;
      v25->_sagEstimationAlpha = 0.01;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_20:

    return 0;
  }
  return v7;
}

+ (void)initialize
{
  objc_opt_class();
}

- (int)allocateResourcesWithVideoFormat:(id)a3 metalContext:(id)a4
{
  uint64_t v4;
  int AdaptiveCorrection;
  FigRegToolboxGPU *v9;
  OSStatus v10;
  double v11;
  BWAdaptiveCorrectionPreviewRegistrationTuningParameters *tuningParameters;
  int v13;
  BWVideoFormatRequirements *v14;
  BWAdaptiveCorrectionPreviewRegistrationTuningParameters *v15;
  uint64_t v16;
  BWAdaptiveCorrectionPreviewRegistrationTuningParameters *v17;
  uint64_t v18;
  BWPixelBufferPool *v19;
  unsigned int v20;
  $9A3F6720D51884C1BD061C340F5007EE *v21;
  uint64_t v22;
  uint64_t v23;
  size_t v24;
  char v25;
  char v26;
  double *v27;
  double *v28;
  uint64_t v29;
  double *v30;
  double *v31;
  int v32;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  BWVideoFormatRequirements *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  if (!a4 || !a3)
  {
    fig_log_get_emitter();
    v37 = v4;
    LODWORD(v36) = 0;
    FigDebugAssert3();
    v32 = -12780;
    goto LABEL_30;
  }
  self->_resourcesCleaned = 0;
  AdaptiveCorrection = -[BWAdaptiveCorrectionPreviewRegistration _loadAdaptiveCorrectionSymbols]((uint64_t)self);
  if (AdaptiveCorrection)
  {
    v34 = AdaptiveCorrection;
    fig_log_get_emitter();
    v37 = v4;
    LODWORD(v36) = v34;
LABEL_29:
    FigDebugAssert3();
    v32 = -12786;
LABEL_30:
    -[BWAdaptiveCorrectionPreviewRegistration cleanupResources](self, "cleanupResources", v36, v37, v38, v39, v40, v41);
    return v32;
  }
  self->_metalContext = (FigMetalContext *)a4;
  v9 = (FigRegToolboxGPU *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B30]), "initWithCommandQueue:", -[FigMetalContext commandQueue](self->_metalContext, "commandQueue"));
  self->_keypointDetector = v9;
  if (v9)
  {
    v10 = VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &self->_cropAndScaleSession);
    if (v10
      || (v10 = VTSessionSetProperty(self->_cropAndScaleSession, (CFStringRef)*MEMORY[0x1E0CED768], MEMORY[0x1E0C9AAB0])) != 0)
    {
      v32 = v10;
      fig_log_get_emitter();
      v37 = v4;
      LODWORD(v36) = v32;
      FigDebugAssert3();
      goto LABEL_30;
    }
    HIDWORD(v11) = 0;
    tuningParameters = self->_tuningParameters;
    if (tuningParameters)
      -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters regToolBoxConfig](tuningParameters, "regToolBoxConfig");
    LODWORD(v11) = 0;
    LODWORD(v36) = 0;
    v13 = -[FigRegToolboxGPU allocateResources:imageWidth:imageHeight:gridWidth:gridHeight:templateRadius:searchRadius:minNCCThreshold:](self->_keypointDetector, "allocateResources:imageWidth:imageHeight:gridWidth:gridHeight:templateRadius:searchRadius:minNCCThreshold:", 0, 0, 0, 0, 0, 0, v11, v36);
    if (v13)
    {
      v35 = v13;
      fig_log_get_emitter();
      v37 = v4;
      LODWORD(v36) = v35;
    }
    else
    {
      v14 = objc_alloc_init(BWVideoFormatRequirements);
      v15 = self->_tuningParameters;
      if (v15)
      {
        -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters regToolBoxConfig](v15, "regToolBoxConfig");
        v16 = DWORD1(v40);
      }
      else
      {
        v16 = 0;
        v40 = 0u;
        v41 = 0u;
      }
      -[BWVideoFormatRequirements setWidth:](v14, "setWidth:", v16);
      v17 = self->_tuningParameters;
      if (v17)
      {
        -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters regToolBoxConfig](v17, "regToolBoxConfig");
        v18 = DWORD2(v38);
      }
      else
      {
        v18 = 0;
        v38 = 0u;
        v39 = 0u;
      }
      -[BWVideoFormatRequirements setHeight:](v14, "setHeight:", v18);
      v43[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1));
      v42 = v14;
      v19 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1)), 2, CFSTR("BWAdaptiveCorrectionPreviewRegistration"), +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
      self->_registrationPool = v19;
      if (v19)
      {
        v20 = -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters configuredNumKeypoints](self->_tuningParameters, "configuredNumKeypoints");
        v21 = ($9A3F6720D51884C1BD061C340F5007EE *)malloc_type_malloc(24 * v20, 0xD306E1DEuLL);
        self->_keypointList = v21;
        if (v21)
        {
          v22 = 0;
          v23 = v20;
          v24 = 16 * v20;
          v25 = 1;
          while (1)
          {
            v26 = v25;
            v27 = (double *)malloc_type_malloc(v24, 0x100004000313F17uLL);
            self->_validKeypointsInSensorResolution[v22] = v27;
            if (!v27)
              break;
            v28 = (double *)malloc_type_malloc(v24, 0x100004000313F17uLL);
            self->_transposedKeypoints[v22] = v28;
            if (!v28)
              break;
            v25 = 0;
            v22 = 1;
            if ((v26 & 1) == 0)
            {
              v29 = 0;
              while (1)
              {
                v30 = (double *)malloc_type_malloc(8 * v23, 0x100004000313F17uLL);
                self->_keypointWeights[v29] = v30;
                if (!v30)
                  goto LABEL_28;
                if (++v29 == 3)
                {
                  v31 = (double *)malloc_type_malloc(8 * v23, 0x100004000313F17uLL);
                  self->_keypointDepths = v31;
                  if (!v31)
                    goto LABEL_28;
                  return 0;
                }
              }
            }
          }
        }
      }
LABEL_28:
      fig_log_get_emitter();
      v37 = v4;
      LODWORD(v36) = 0;
    }
    goto LABEL_29;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (uint64_t)_loadAdaptiveCorrectionSymbols
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (result)
  {
    v1 = result;
    v2 = -[FigCaptureCameraParameters disparityVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "disparityVersion");
    if ((int)v2 > 3)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DisparityV%d.bundle"), v2);
      v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("/System/Library/VideoProcessors/"), v3);
      v5 = dlopen((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v4, objc_msgSend(v3, "stringByDeletingPathExtension")), "fileSystemRepresentation"), 1);
      *(_QWORD *)(v1 + 696) = v5;
      if (v5)
      {
        v6 = dlsym(v5, "AdaptiveCorrection_fullCorrection");
        *(_QWORD *)(v1 + 664) = v6;
        if (v6)
        {
          v7 = dlsym(*(void **)(v1 + 696), "AdaptiveCorrection_computeVerticalBaselineTransform");
          *(_QWORD *)(v1 + 672) = v7;
          if (v7)
          {
            v8 = dlsym(*(void **)(v1 + 696), "AdaptiveCorrection_rotateCalModel");
            *(_QWORD *)(v1 + 680) = v8;
            if (v8)
            {
              v9 = dlsym(*(void **)(v1 + 696), "AdaptiveCorrection_transformPointsWithMatrix");
              *(_QWORD *)(v1 + 688) = v9;
              if (v9)
                return 0;
            }
          }
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      return 4294954510;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (int)registerWiderSampleBufferUsingADC:(opaqueCMSampleBuffer *)a3 narrowerSampleBuffer:(opaqueCMSampleBuffer *)a4 narrowerRect:(CGRect)a5 macroTransitionType:(int)a6 narrowerToWiderTransformsOut:(id *)a7
{
  float64_t v7;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  opaqueCMSampleBuffer *v22;
  int v23;
  BWAdaptiveCorrectionPreviewRegistrationTuningParameters *tuningParameters;
  BWAdaptiveCorrectionPreviewRegistrationTuningParameters *v25;
  uint64_t v26;
  char v27;
  char v28;
  __CVBuffer *v29;
  uint64_t *v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  double Width;
  size_t Height;
  __CVBuffer *v38;
  void *v39;
  double v40;
  double v41;
  int v42;
  void *v43;
  void *v44;
  uint64_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  unint64_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  $9A3F6720D51884C1BD061C340F5007EE *v71;
  float var4;
  float v73;
  float v74;
  $9A3F6720D51884C1BD061C340F5007EE *v75;
  double *v76;
  unsigned int validKeypointsCount;
  unsigned int v78;
  unsigned int v79;
  double *v80;
  CalModel *p_correctedCalibration;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  void *v89;
  double v90;
  float64_t v91;
  double v92;
  double v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  float64x2_t v98;
  float64x2_t v99;
  double v100;
  double v101;
  __n128 v102;
  __n128 v103;
  int v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  float64x2_t v110;
  int v111;
  double *v112;
  uint64_t i;
  float64x2_t *v114;
  double v115;
  void *v116;
  void *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  float64x2_t v123;
  float64x2_t v124;
  float64x2_t v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  float64x2_t v129;
  float64x2_t v130;
  int v131;
  uint64_t v132;
  char v133;
  char v134;
  const void *v135;
  float64x2_t v137;
  uint64_t v138;
  uint64_t v139;
  float64x2_t v140;
  uint64_t v141;
  uint64_t v142;
  float64x2_t v143;
  uint64_t v144;
  uint64_t v145;
  float64x2_t v146;
  uint64_t v147;
  uint64_t v148;
  float64x2_t v149;
  void *v150;
  uint64_t v151;
  float64x2_t v152;
  double v153;
  uint64_t v154;
  float64x2_t v155;
  CMAttachmentBearerRef target;
  CMAttachmentBearerRef targeta;
  float64x2_t v158;
  double v159;
  uint64_t v160;
  float64x2_t v161;
  double v162;
  uint64_t v163;
  unsigned int v164;
  float64x2_t v165;
  uint64_t v166;
  uint64_t v167;
  float64x2_t v168;
  unsigned int v169;
  uint64_t v170;
  uint64_t v171;
  float64x2_t v172;
  __int128 v173;
  __int128 v174;
  float64x2_t v175;
  float64x2_t __dst[18];
  float64x2_t v177;
  float64x2_t v178;
  float64x2_t v179;
  float64x2_t v180;
  float64x2_t v181;
  float64x2_t v182;
  float64x2_t v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  double v200;
  float64x2_t v201;
  float64x2_t v202;
  float64x2_t v203;
  float64x2_t v204;
  float64x2_t v205;
  float64x2_t v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  double v222;
  _QWORD v223[3];
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  float64_t v231;
  double v232[8];
  uint64_t v233[2];
  _QWORD v234[2];
  uint64_t v235;
  uint64_t v236;
  _QWORD v237[4];

  v237[2] = *MEMORY[0x1E0C80C00];
  v237[0] = 0;
  v237[1] = 0;
  v235 = 0;
  v236 = 0;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v14 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  *(_QWORD *)&v149.f64[0] = a7;
  if (a3 && a4 && a7)
  {
    v15 = (void *)v14;
    LODWORD(v158.f64[1]) = a6;
    v143.f64[1] = v7;
    v16 = 0;
    *(_QWORD *)&v152.f64[1] = a4;
    v234[0] = a4;
    v234[1] = a3;
    v17 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v18 = *MEMORY[0x1E0D06D00];
    v19 = *MEMORY[0x1E0D058B8];
    v20 = 1;
    do
    {
      v21 = v20;
      v22 = (opaqueCMSampleBuffer *)v234[v16];
      v237[v16] = CMSampleBufferGetImageBuffer(v22);
      objc_msgSend(v13, "setObject:atIndexedSubscript:", CMGetAttachment(v22, v17, 0), v16);
      objc_msgSend(v15, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v16), "objectForKeyedSubscript:", v18), v16);
      objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_staticParametersByPortType, "objectForKeyedSubscript:", objc_msgSend(v15, "objectAtIndexedSubscript:", v16)), "objectForKeyedSubscript:", v19), "doubleValue");
      v20 = 0;
      v16 = 1;
    }
    while ((v21 & 1) != 0);
    v222 = 0.0;
    v221 = 0u;
    v220 = 0u;
    v219 = 0u;
    v218 = 0u;
    v217 = 0u;
    v215 = 0u;
    v216 = 0u;
    v213 = 0u;
    v214 = 0u;
    v211 = 0u;
    v212 = 0u;
    v23 = -[BWAdaptiveCorrectionPreviewRegistration _computeOISCalibrationFromWiderMetadata:narrowerMetadata:updateEstimatedSagPositions:excludeEstimatedSagFromAlignment:calibrationOut:]((uint64_t)self, objc_msgSend(v13, "objectAtIndexedSubscript:", 1), objc_msgSend(v13, "objectAtIndexedSubscript:", 0), 0, 0, (uint64_t)&v211);
    if (v23)
    {
LABEL_49:
      v131 = v23;
      fig_log_get_emitter();
LABEL_54:
      FigDebugAssert3();
      goto LABEL_39;
    }
    tuningParameters = self->_tuningParameters;
    if (tuningParameters)
    {
      -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters regToolBoxConfig](tuningParameters, "regToolBoxConfig");
      v25 = self->_tuningParameters;
      v169 = DWORD1(v209);
      if (v25)
      {
        -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters regToolBoxConfig](v25, "regToolBoxConfig");
        v164 = DWORD2(v207);
        goto LABEL_12;
      }
    }
    else
    {
      v169 = 0;
      v209 = 0u;
      v210 = 0u;
    }
    v164 = 0;
    v207 = 0u;
    v208 = 0u;
LABEL_12:
    v26 = 0;
    v172.f64[0] = *(float64_t *)MEMORY[0x1E0D06D40];
    v172.f64[1] = *(float64_t *)MEMORY[0x1E0D06D38];
    v27 = 1;
    do
    {
      v28 = v27;
      v29 = (__CVBuffer *)v237[v26];
      v30 = &v233[v26];
      *(_DWORD *)v30 = CVPixelBufferGetWidth(v29);
      *((_DWORD *)v30 + 1) = CVPixelBufferGetHeight(v29);
      v31 = &v232[4 * v26];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v26), "objectForKeyedSubscript:", *(_QWORD *)&v172.f64[0]), "doubleValue");
      v33 = v32;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v26), "objectForKeyedSubscript:", *(_QWORD *)&v172.f64[1]), "doubleValue");
      *v31 = 0.0;
      v31[1] = 0.0;
      *((_QWORD *)v31 + 2) = v33;
      *((_QWORD *)v31 + 3) = v34;
      objc_msgSend(v13, "objectAtIndexedSubscript:", v26);
      FigCFDictionaryGetCGRectIfPresent();
      v35 = &v224 + 4 * v26;
      Width = (double)CVPixelBufferGetWidth(v29);
      Height = CVPixelBufferGetHeight(v29);
      *v35 = 0.0;
      v35[1] = 0.0;
      v35[2] = Width;
      v35[3] = (double)Height;
      objc_msgSend(v13, "objectAtIndexedSubscript:", v26);
      FigCFDictionaryGetCGRectIfPresent();
      v38 = -[BWPixelBufferPool newPixelBuffer](self->_registrationPool, "newPixelBuffer");
      *(&v235 + v26) = (uint64_t)v38;
      if (!v38)
      {
        fig_log_get_emitter();
LABEL_47:
        FigDebugAssert3();
        v131 = -1;
        goto LABEL_39;
      }
      v27 = 0;
      v26 = 1;
    }
    while ((v28 & 1) != 0);
    acpr_conformRectForMSR420vf(v224, v225, v226, v227);
    v165.f64[0] = (double)v164;
    v165.f64[1] = (double)v169;
    v23 = VTPixelRotationSessionRotateSubImage();
    if (v23)
      goto LABEL_49;
    v39 = (void *)objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    objc_msgSend((id)objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A88]), "doubleValue");
    v41 = v40 * 10.0;
    if (v40 * 10.0 <= 0.0)
    {
      v41 = 1.0e10;
      v42 = LODWORD(v158.f64[1]);
    }
    else
    {
      v42 = LODWORD(v158.f64[1]);
      if (!LODWORD(v158.f64[1]))
        v41 = 2.0 / (1.0 / v41 + 1.0e-10);
    }
    v205 = 0u;
    v206 = 0u;
    v203 = 0u;
    v204 = 0u;
    v201 = 0u;
    v202 = 0u;
    v43 = (void *)objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v44 = (void *)objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v197 = v219;
    v198 = v220;
    v199 = v221;
    v200 = v222;
    v193 = v215;
    v194 = v216;
    v195 = v217;
    v196 = v218;
    v189 = v211;
    v190 = v212;
    v191 = v213;
    v192 = v214;
    v45 = v233[0];
    -[BWAdaptiveCorrectionPreviewRegistration _homographyAtDepth:calibration:narrowerMetadata:widerMetadata:pixelBufferDimensions:excludeExtrinsics:]((uint64_t)self, &v189, v43, v44, v233[0], 0, &v201, v41, v137, v143, v149, v152, v158, v165, v172, __dst[0], __dst[1], *(_OWORD *)&__dst[2], *(_OWORD *)&__dst[3],
      *(_OWORD *)&__dst[4],
      *(_OWORD *)&__dst[5],
      *(_OWORD *)&__dst[6],
      *(_OWORD *)&__dst[7],
      *(_OWORD *)&__dst[8],
      *(_OWORD *)&__dst[9],
      *(_OWORD *)&__dst[10],
      *(_OWORD *)&__dst[11],
      *(_OWORD *)&__dst[12],
      *(_OWORD *)&__dst[13],
      *(_OWORD *)&__dst[14],
      *(_OWORD *)&__dst[15],
      *(_OWORD *)&__dst[16],
      *(_OWORD *)&__dst[17],
      *(_OWORD *)&v177,
      *(_OWORD *)&v178,
      v179,
      v180,
      v181,
      v182,
      v183);
    v46.f64[0] = v224;
    v47.f64[0] = v225;
    v48 = vdivq_f64(vaddq_f64(v205, vmlaq_n_f64(vmulq_n_f64(v201, v224), v203, v225)), (float64x2_t)vdupq_lane_s64(*(_OWORD *)&vaddq_f64(v206, vmlaq_f64(vmulq_f64(v46, v202), v47, v204)), 0));
    v46.f64[0] = v224 + v226;
    v47.f64[0] = v225 + v227;
    v49 = vdivq_f64(vaddq_f64(v205, vmlaq_n_f64(vmulq_n_f64(v201, v224 + v226), v203, v225 + v227)), (float64x2_t)vdupq_lane_s64(*(_OWORD *)&vaddq_f64(v206, vmlaq_f64(vmulq_f64(v202, v46), v47, v204)), 0));
    v50 = acpr_conformRectForMSR420vf(v48.f64[0], v48.f64[1], v49.f64[0] - v48.f64[0], v49.f64[1] - v48.f64[1]);
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v57 = VTPixelRotationSessionRotateSubImage();
    if (v57)
      goto LABEL_51;
    v58 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", v235, 10, 17, 0);
    v59 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", v236, 10, 17, 0);
    v57 = -[FigRegToolboxGPU processReferenceImage:histogram:doWaitForIdle:](self->_keypointDetector, "processReferenceImage:histogram:doWaitForIdle:", v58, 0, 1);
    if (v57)
      goto LABEL_51;
    v57 = -[FigRegToolboxGPU computeTransform:transform:outputCorners:solverSelector:histogram:roi:](self->_keypointDetector, "computeTransform:transform:outputCorners:solverSelector:histogram:roi:", v59, 0, self->_keypointList, 1, 0, 0);
    if (v57)
      goto LABEL_51;
    v60 = v228;
    v61 = v229;
    v62 = v232[6];
    v63 = v230;
    v149.f64[1] = v231;
    v153 = v232[7];
    v159 = v232[5];
    v162 = v232[4];
    self->_validKeypointsCount = 0;
    if (-[BWAdaptiveCorrectionPreviewRegistrationTuningParameters configuredNumKeypoints](self->_tuningParameters, "configuredNumKeypoints"))
    {
      v64 = 0;
      v65 = 0;
      v66 = v54 / *(double *)&v170;
      v67 = v56 / *(double *)&v166;
      v68 = v50 - v60;
      v69 = v52 - v61;
      v70 = v62 / v63;
      do
      {
        v71 = &self->_keypointList[v64];
        var4 = v71->var4;
        v73 = var4 * log2f(fmaxf(v71->var5, 1.0));
        -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters keypointsMinSelectionScore](self->_tuningParameters, "keypointsMinSelectionScore");
        if (v73 > v74)
        {
          v75 = &self->_keypointList[v64];
          v76 = self->_validKeypointsInSensorResolution[0];
          validKeypointsCount = self->_validKeypointsCount;
          v78 = 2 * validKeypointsCount;
          v76[v78] = v232[0] + v75->var0 * (v232[2] / *(double *)&v170);
          v79 = (2 * validKeypointsCount) | 1;
          v76[v79] = v232[1] + v75->var1 * (v232[3] / *(double *)&v166);
          v80 = self->_validKeypointsInSensorResolution[1];
          v80[v78] = v162 + (v68 + v75->var2 * v66) * v70;
          v80[v79] = v159 + (v69 + v75->var3 * v67) * (v153 / v149.f64[1]);
          self->_validKeypointsCount = validKeypointsCount + 1;
        }
        ++v65;
        ++v64;
      }
      while (v65 < -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters configuredNumKeypoints](self->_tuningParameters, "configuredNumKeypoints"));
    }
    v197 = v219;
    v198 = v220;
    v199 = v221;
    v200 = v222;
    v193 = v215;
    v194 = v216;
    v195 = v217;
    v196 = v218;
    v189 = v211;
    v190 = v212;
    v191 = v213;
    v192 = v214;
    v57 = -[BWAdaptiveCorrectionPreviewRegistration _updateCorrectedCalibrationUsingInitialOISCalibration:macroTransitionType:]((uint64_t)self, (uint64_t)&v189, v42);
    if (v57)
    {
LABEL_51:
      v131 = v57;
      fig_log_get_emitter();
    }
    else
    {
      memset(v223, 0, sizeof(v223));
      v183 = 0u;
      v184 = 0u;
      v185 = 0u;
      v186 = 0u;
      p_correctedCalibration = &self->_correctedCalibration;
      v187 = 0u;
      v188 = 0u;
      v82 = objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v83 = objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v84 = *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale;
      v197 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10];
      v198 = v84;
      v199 = *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1];
      v200 = self->_correctedCalibration.pixelSize_um[1];
      v85 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4];
      v193 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2];
      v194 = v85;
      v86 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8];
      v195 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6];
      v196 = v86;
      v87 = *(_OWORD *)self->_correctedCalibration.opticalCenterX;
      v189 = *(_OWORD *)self->_correctedCalibration.focalLengthPix;
      v190 = v87;
      v88 = *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary;
      v191 = *(_OWORD *)self->_correctedCalibration.opticalCenterY;
      v192 = v88;
      v89 = (void *)objc_msgSend(v13, "objectAtIndexedSubscript:", 0, -[BWAdaptiveCorrectionPreviewRegistration _fundamentalMatrixFromCalibration:narrowerMetadata:widerMetadata:]((uint64_t)self, &v189, v82, v83, &v183, v138, v141, v144, v147, *(uint64_t *)&v149.f64[0], *(uint64_t *)&v149.f64[1], *(uint64_t *)&v153, (uint64_t)target, *(uint64_t *)&v159, *(uint64_t *)&v162,
                        v166,
                        v170,
                        v173,
                        *(_OWORD *)__dst,
                        *(_OWORD *)&__dst[1],
                        *(_OWORD *)&__dst[2],
                        *(_OWORD *)&__dst[3],
                        *(_OWORD *)&__dst[4],
                        __dst[5],
                        __dst[6],
                        __dst[7],
                        __dst[8],
                        __dst[9],
                        __dst[10],
                        __dst[11],
                        __dst[12],
                        __dst[13],
                        __dst[14],
                        __dst[15],
                        __dst[16],
                        __dst[17],
                        v177,
                        v178,
                        v179,
                        v180,
                        v181,
                        v182,
                        (float64x2_t)0));
      objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", (_QWORD)v174), "doubleValue");
      v91 = v90;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", 0), "objectForKeyedSubscript:", *((_QWORD *)&v174 + 1)), "doubleValue");
      v93 = v92;
      v94 = (void *)CMGetAttachment(targeta, CFSTR("TotalZoomFactor"), 0);
      if (v94)
      {
        objc_msgSend(v94, "floatValue");
        LODWORD(v98.f64[0]) = v104;
      }
      else
      {
        LODWORD(v98.f64[0]) = 1.0;
      }
      v105 = *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale;
      v197 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10];
      v198 = v105;
      v199 = *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1];
      v200 = self->_correctedCalibration.pixelSize_um[1];
      v106 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4];
      v193 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2];
      v194 = v106;
      v107 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8];
      v195 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6];
      v196 = v107;
      v108 = *(_OWORD *)self->_correctedCalibration.opticalCenterX;
      v189 = *(_OWORD *)p_correctedCalibration->focalLengthPix;
      v190 = v108;
      v109 = *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary;
      v191 = *(_OWORD *)self->_correctedCalibration.opticalCenterY;
      v192 = v109;
      v110.f64[1] = v183.f64[1];
      v110.f64[0] = v91;
      v111 = -[BWAdaptiveCorrectionPreviewRegistration _estimateDepthFromKeypointsUsingCalibration:narrowerRawSensorResolution:fundamentalMatrix:macroTransitionType:totalZoomFactor:consolidatedDepthsOut:]((uint64_t)self, &v189, &v177, v42, v223, v110, v93, v98, v99, v100, v101, v102, v103, v95, v96, v97, v139, v142, v145,
               v148,
               (uint64_t)v150,
               v151,
               v154,
               (uint64_t)targeta,
               v160,
               v163,
               v167,
               v171,
               v174,
               *(_OWORD *)__dst,
               *(_OWORD *)&__dst[1],
               *(_OWORD *)&__dst[2],
               *(_OWORD *)&__dst[3],
               *(_OWORD *)&__dst[4],
               *(_OWORD *)&__dst[5],
               *(_OWORD *)&__dst[6],
               __dst[7],
               __dst[8],
               __dst[9],
               __dst[10],
               __dst[11],
               __dst[12],
               *(uint64_t *)&__dst[13].f64[0],
               __dst[13].f64[1],
               SLODWORD(__dst[14].f64[0]),
               SHIDWORD(__dst[14].f64[0]),
               SLODWORD(__dst[14].f64[1]),
               SHIDWORD(__dst[14].f64[1]),
               SLODWORD(__dst[15].f64[0]),
               SHIDWORD(__dst[15].f64[0]),
               SLODWORD(__dst[15].f64[1]),
               SHIDWORD(__dst[15].f64[1]),
               *(uint64_t *)&__dst[16].f64[0],
               *(uint64_t *)&__dst[16].f64[1],
               *(uint64_t *)&__dst[17].f64[0],
               *(uint64_t *)&__dst[17].f64[1],
               *(uint64_t *)&v183.f64[0],
               *(uint64_t *)&v183.f64[1],
               v184,
               v185,
               v186,
               v187,
               v188);
      if (!v111)
      {
        v112 = (double *)v223;
        for (i = 320; i != 608; i += 96)
        {
          v114 = (float64x2_t *)((char *)self + i);
          v115 = *v112++;
          v116 = (void *)objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v117 = (void *)objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v118 = *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale;
          v197 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10];
          v198 = v118;
          v199 = *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1];
          v200 = self->_correctedCalibration.pixelSize_um[1];
          v119 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4];
          v193 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2];
          v194 = v119;
          v120 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8];
          v195 = *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6];
          v196 = v120;
          v121 = *(_OWORD *)self->_correctedCalibration.opticalCenterX;
          v189 = *(_OWORD *)p_correctedCalibration->focalLengthPix;
          v190 = v121;
          v122 = *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary;
          v191 = *(_OWORD *)self->_correctedCalibration.opticalCenterY;
          v192 = v122;
          -[BWAdaptiveCorrectionPreviewRegistration _homographyAtDepth:calibration:narrowerMetadata:widerMetadata:pixelBufferDimensions:excludeExtrinsics:]((uint64_t)self, &v189, v116, v117, v45, 0, &v177, v115, v140, v146, v149, v155, v161, v168, v175, __dst[0], __dst[1], *(_OWORD *)&__dst[2], *(_OWORD *)&__dst[3],
            *(_OWORD *)&__dst[4],
            *(_OWORD *)&__dst[5],
            *(_OWORD *)&__dst[6],
            *(_OWORD *)&__dst[7],
            *(_OWORD *)&__dst[8],
            *(_OWORD *)&__dst[9],
            *(_OWORD *)&__dst[10],
            *(_OWORD *)&__dst[11],
            *(_OWORD *)&__dst[12],
            *(_OWORD *)&__dst[13],
            *(_OWORD *)&__dst[14],
            *(_OWORD *)&__dst[15],
            *(_OWORD *)&__dst[16],
            *(_OWORD *)&__dst[17],
            *(_OWORD *)&v177,
            *(_OWORD *)&v178,
            v179,
            v180,
            v181,
            v182,
            v183);
          v123 = v180;
          v114[2] = v179;
          v114[3] = v123;
          v124 = v182;
          v114[4] = v181;
          v114[5] = v124;
          v125 = v178;
          *v114 = v177;
          v114[1] = v125;
        }
        if (!self->_excludeExtrinsicsCorrectionFromWideTeleAlignment)
          goto LABEL_38;
        if (!self->_excludeEstimatedSagFromWideTeleAlignment)
          goto LABEL_38;
        memcpy(__dst, self->_anon_140, sizeof(__dst));
        v126 = objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v127 = objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v197 = v219;
        v198 = v220;
        v199 = v221;
        v200 = v222;
        v193 = v215;
        v194 = v216;
        v195 = v217;
        v196 = v218;
        v189 = v211;
        v190 = v212;
        v191 = v213;
        v192 = v214;
        if (!-[BWAdaptiveCorrectionPreviewRegistration _verifyRegistrationTransform:usingInitialOISCalibration:narrowerMetadata:widerMetadata:narrowerDimensions:]((uint64_t)self, (uint64_t)__dst, (uint64_t)&v189, v126, v127, v45, *(double *)&v213, *(double *)&v214, v128, v129, v130))
        {
LABEL_38:
          v131 = 0;
          goto LABEL_39;
        }
        fig_log_get_emitter();
        goto LABEL_47;
      }
      v131 = v111;
      fig_log_get_emitter();
    }
    goto LABEL_54;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v131 = -12780;
LABEL_39:

  v132 = 0;
  self->_registrationPoolReadyAssertion = 0;
  v133 = 1;
  do
  {
    v134 = v133;
    v135 = (const void *)*(&v235 + v132);
    if (v135)
      CFRelease(v135);
    v133 = 0;
    v132 = 1;
  }
  while ((v134 & 1) != 0);
  if (!v131)
    memcpy(*(void **)&v149.f64[0], self->_anon_140, 0x120uLL);
  return v131;
}

- (uint64_t)_computeOISCalibrationFromWiderMetadata:(uint64_t)a3 narrowerMetadata:(int)a4 updateEstimatedSagPositions:(int)a5 excludeEstimatedSagFromAlignment:(uint64_t)a6 calibrationOut:
{
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  float v18;
  CGPoint *v19;
  double y;
  BOOL v21;
  float v22;
  int v23;
  _DWORD *v24;
  float v25;
  int *v26;
  void *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int32x4_t v35;
  uint64_t *v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  double v40;
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  double v45;
  double v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  int *v62;
  double v63;
  double v64;
  int *v65;
  double *v66;
  double v67;
  double v68;
  uint64_t v69;
  double *v70;
  float v71;
  float v72;
  int v73;
  float v74;
  float v75;
  const __CFDictionary *v76;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  uint64_t v79;
  float v80;
  uint64_t v81;
  CGFloat v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  void *v92;
  double v93;
  double v94;
  double v95;
  uint64_t v96;
  uint64_t v99;
  CMTimeEpoch v100;
  CMTimeFlags v101;
  uint64_t v102;
  uint64_t v104;
  uint64_t v105;
  float32x4_t v106;
  uint64_t v107;
  uint64_t v109;
  float32x4_t v110;
  char v111;
  uint64_t v112;
  float32x4_t v113;
  double *v114;
  uint64_t v115;
  void *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  CMTime time;
  uint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  CMTimeValue value;
  CMTimeScale timescale;
  _DWORD v130[18];
  uint64_t v131;
  CGPoint v132;

  v131 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  objc_msgSend(v9, "setObject:atIndexedSubscript:", a3, 0);
  v11 = 1;
  objc_msgSend(v9, "setObject:atIndexedSubscript:", a2, 1);
  v12 = 0;
  v115 = *MEMORY[0x1E0D06D00];
  v112 = *MEMORY[0x1E0D06CF0];
  v109 = *MEMORY[0x1E0D06CE0];
  v13 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v15 = *MEMORY[0x1E0D06D40];
  v16 = *MEMORY[0x1E0D06D38];
  do
  {
    v17 = v11;
    objc_msgSend(v10, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12), "objectForKeyedSubscript:", v115), v12);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12), "objectForKeyedSubscript:", v112), "floatValue");
    *(float *)&v130[v12] = v18;
    if (v18 == 0.0
      || ((v19 = (CGPoint *)&v130[4 * v12 + 6],
           CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12), "objectForKeyedSubscript:", v109), v19), y = v19->y, v19->x == v13)? (v21 = y == v14): (v21 = 0), v21))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0xFFFFFFFFLL;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12, v19->x, y), "objectForKeyedSubscript:", v15), "floatValue");
    v23 = (int)v22;
    v24 = &v130[2 * v12 + 2];
    *v24 = (int)v22;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12), "objectForKeyedSubscript:", v16), "floatValue");
    v11 = 0;
    v24[1] = (int)v25;
    v26 = &v130[2 * v12 + 14];
    *v26 = v23;
    v26[1] = (int)v25;
    v12 = 1;
  }
  while ((v17 & 1) != 0);
  v116 = v9;
  v27 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
  v28 = *MEMORY[0x1E0D058E8];
  v29 = (uint64_t *)objc_msgSend((id)objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0D058E8]), "bytes");
  v30 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", 0)), "objectForKeyedSubscript:", v28), "bytes");
  if (v29)
  {
    v36 = (uint64_t *)v30;
    if (v30)
    {
      *(double *)v37.i64 = acpr_convertFloatRowMajorArrayToSimdMatrix(v29, v31, v32, v33, v34, v35);
      v37.i32[3] = 0;
      v38.i32[3] = 0;
      v110 = v38;
      v113 = v37;
      v39.i32[3] = 0;
      v106 = v39;
      *(double *)v42.i64 = acpr_convertFloatRowMajorArrayToSimdMatrix(v36, *(double *)v37.i64, *(double *)v38.i64, *(double *)v39.i64, v40, v41);
      v42.i32[3] = 0;
      v43.i32[3] = 0;
      v44.i32[3] = 0;
      v123 = 0u;
      v124 = 0u;
      v125 = 0u;
      v126 = 0u;
      v46 = acpr_computeRelativeExtrinsics(v42, v43, v44, v45, v113, v110, v106);
      v47 = 0;
      DWORD2(v123) = v48;
      DWORD2(v124) = v49;
      *(double *)&v123 = v46;
      *(_QWORD *)&v124 = v50;
      DWORD2(v125) = v51;
      DWORD2(v126) = v52;
      v53 = a6 + 48;
      *(_QWORD *)&v125 = v54;
      *(_QWORD *)&v126 = v55;
      do
      {
        for (i = 0; i != 4; ++i)
          *(double *)(v53 + 8 * i) = *(float *)((unint64_t)(&v123 + i) & 0xFFFFFFFFFFFFFFF3 | (4 * (v47 & 3)));
        ++v47;
        v53 += 32;
      }
      while (v47 != 3);
      v57 = 0;
      v107 = *MEMORY[0x1E0D05968];
      v105 = *MEMORY[0x1E0D06D20];
      v104 = *MEMORY[0x1E0D06B50];
      v102 = *MEMORY[0x1E0D05D00];
      v101 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
      v100 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v99 = *MEMORY[0x1E0D06ED8];
      v58 = 1;
      v59 = *MEMORY[0x1E0D06B58];
      v60 = *MEMORY[0x1E0D06B60];
      while (1)
      {
        v61 = v58;
        v62 = &v130[2 * v57 + 2];
        v63 = ((double)*v62 + -1.0) * 0.5;
        v64 = ((double)v62[1] + -1.0) * 0.5;
        v65 = &v130[2 * v57 + 14];
        v66 = (double *)&v130[4 * v57 + 6];
        v67 = v66[1];
        v68 = (double)v65[1] + -1.0;
        v69 = a6 + 8 * v57;
        *(double *)(v69 + 16) = ((double)*v65 + -1.0) * 0.5 + *v66 - v63;
        v114 = (double *)(v69 + 16);
        *(double *)(v69 + 32) = v68 * 0.5 + v67 - v64;
        v70 = (double *)(v69 + 32);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", v57)), "objectForKeyedSubscript:", v107), "floatValue");
        v72 = v71;
        v73 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v116, "objectAtIndexedSubscript:", v57), "objectForKeyedSubscript:", v105), "intValue");
        v74 = (float)v73;
        if (!v73)
          v74 = 1.0;
        v75 = v72 * v74;
        *(double *)(a6 + 8 * v57) = (float)(*(float *)&v130[v57] / v75);
        if (objc_msgSend((id)objc_msgSend(v116, "objectAtIndexedSubscript:", v57), "objectForKeyedSubscript:", v104))
        {
          v111 = v61;
          v76 = (const __CFDictionary *)objc_msgSend((id)objc_msgSend(v116, "objectAtIndexedSubscript:", v57), "objectForKeyedSubscript:", v102);
          v122 = 0;
          value = *MEMORY[0x1E0CA2E18];
          timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
          flags = v101;
          epoch = v100;
          if (v76)
          {
            CMTimeMakeFromDictionary(&time, v76);
            value = time.value;
            flags = time.flags;
            timescale = time.timescale;
            epoch = time.epoch;
          }
          if ((flags & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_46;
          }
          objc_msgSend(v116, "objectAtIndexedSubscript:", v57);
          time.value = value;
          time.timescale = timescale;
          time.flags = flags;
          time.epoch = epoch;
          CMTimeGetSeconds(&time);
          v79 = FigMotionComputeAverageSpherePosition();
          if ((_DWORD)v79)
          {
            v96 = v79;
            fig_log_get_emitter();
            FigDebugAssert3();
            return v96;
          }
          v80 = 1.0 / v75;
          v81 = v122;
          *v114 = *v114 + (float)((float)(1.0 / v75) * *(float *)&v122);
          *v70 = *v70 + (float)((float)(1.0 / v75) * *((float *)&v81 + 1));
          if (a4 | a5)
          {
            v82 = -[BWAdaptiveCorrectionPreviewRegistration _estimatedSagPositionUsingOISShift:forPortType:](a1, objc_msgSend(v10, "objectAtIndexedSubscript:", v57), *(float *)&v81, *((float *)&v81 + 1));
            v84 = v82;
            v85 = v83;
            if (a4)
              objc_msgSend(*(id *)(a1 + 632), "setObject:forKeyedSubscript:", CGPointCreateDictionaryRepresentation(*(CGPoint *)&v82), objc_msgSend(v10, "objectAtIndexedSubscript:", v57));
            if (a5)
            {
              *v114 = *v114 - v84 * v80;
              *v70 = *v70 - v85 * v80;
            }
          }
          v86 = (void *)objc_msgSend((id)objc_msgSend(v116, "objectAtIndexedSubscript:", v57), "objectForKeyedSubscript:", v99);
          if (a4)
          {
            v87 = v86;
            if (v86)
            {
              v119 = 0u;
              v120 = 0u;
              v117 = 0u;
              v118 = 0u;
              v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v117, v127, 16);
              if (v88)
              {
                v89 = v88;
                v90 = *(_QWORD *)v118;
                do
                {
                  for (j = 0; j != v89; ++j)
                  {
                    if (*(_QWORD *)v118 != v90)
                      objc_enumerationMutation(v87);
                    v92 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * j);
                    if ((objc_msgSend(v92, "isEqualToString:", objc_msgSend(v10, "objectAtIndexedSubscript:", 0)) & 1) == 0
                      && (objc_msgSend(v92, "isEqualToString:", objc_msgSend(v10, "objectAtIndexedSubscript:", 1)) & 1) == 0)
                    {
                      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v87, "objectForKeyedSubscript:", v92), "objectForKeyedSubscript:", v59), "doubleValue");
                      v94 = v93 * 0.00390625;
                      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v87, "objectForKeyedSubscript:", v92), "objectForKeyedSubscript:", v60), "doubleValue");
                      v132.x = -[BWAdaptiveCorrectionPreviewRegistration _estimatedSagPositionUsingOISShift:forPortType:](a1, (uint64_t)v92, v94, v95 * 0.00390625);
                      objc_msgSend(*(id *)(a1 + 632), "setObject:forKeyedSubscript:", CGPointCreateDictionaryRepresentation(v132), v92);
                    }
                  }
                  v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v117, v127, 16);
                }
                while (v89);
              }
            }
          }
          v61 = v111;
        }
        v58 = 0;
        v57 = 1;
        if ((v61 & 1) == 0)
          return 0;
      }
    }
  }
  fig_log_get_emitter();
LABEL_46:
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (uint64_t)_homographyAtDepth:(void *)a3@<X2> calibration:(void *)a4@<X3> narrowerMetadata:(uint64_t)a5@<X4> widerMetadata:(char)a6@<W5> pixelBufferDimensions:(float64x2_t *)a7@<X8> excludeExtrinsics:(double)a8@<D0>
{
  void *v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  float64x2_t v59;
  unint64_t *v60;
  unint64_t v61;
  __int128 v62;
  unint64_t *v63;
  __int128 v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t *v82;
  uint64_t v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t *v92;
  float64x2_t v93;
  uint64_t v94;
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
  float64x2_t *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  float64x2_t v118;
  float64x2_t v119;
  float64x2_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  float64x2_t v124;
  float64x2_t v125;
  float64x2_t v126;
  float64x2_t v127;
  float64x2_t v128;
  float64x2_t *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint64_t v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v143;
  float64x2_t v144;
  float64x2_t *v145;
  uint64_t v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  float64x2_t v150;
  float64x2_t v151;
  float64x2_t v152;
  float64x2_t v153;
  float64x2_t v154;
  float64x2_t v155;
  float64x2_t v156;
  float64x2_t v157;
  float64x2_t *v158;
  float64x2_t v159;
  float64x2_t v160;
  float64x2_t v161;
  float64x2_t v162;
  float64x2_t v163;
  void *v164;
  float64x2_t v167;
  float64x2_t v168;
  float64x2_t v169;
  float64x2_t vars0;

  STACK[0x818] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v45 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v164 = a3;
    objc_msgSend(v45, "setObject:atIndexedSubscript:", a3, 0);
    v46 = 1;
    objc_msgSend(v45, "setObject:atIndexedSubscript:", a4, 1);
    v47 = 0;
    v48 = *MEMORY[0x1E0D06D00];
    v49 = *MEMORY[0x1E0D06D38];
    __asm { FMOV            V21.2D, #1.0 }
    v167 = _Q21;
    do
    {
      v55 = v46;
      objc_msgSend((id)objc_msgSend(v45, "objectAtIndexedSubscript:", v47), "objectForKeyedSubscript:", v48);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v45, "objectAtIndexedSubscript:", v47), "objectForKeyedSubscript:", v49), "intValue");
      v59 = v167;
      v46 = 0;
      v60 = &a2[v47];
      v61 = *v60;
      *(_QWORD *)&v62 = v60[2];
      *((_QWORD *)&v62 + 1) = v60[4];
      v63 = &STACK[0x750] + 12 * v47;
      *(_QWORD *)&v64 = 0;
      *((_QWORD *)&v64 + 1) = v61;
      *(_OWORD *)v63 = v61;
      *((_OWORD *)v63 + 1) = 0u;
      *((_OWORD *)v63 + 2) = v64;
      *((_OWORD *)v63 + 3) = 0u;
      *((_OWORD *)v63 + 4) = v62;
      *((float64x2_t *)v63 + 5) = v167;
      v47 = 1;
    }
    while ((v55 & 1) != 0);
    if ((a6 & 1) != 0)
    {
      v65 = (float64x2_t)xmmword_1A32A2300;
      v66 = (float64x2_t)xmmword_1A32A2310;
      v67 = 0uLL;
      v68 = 0uLL;
      v69 = 0uLL;
      v70 = 0uLL;
      v71 = 0uLL;
      v73 = a4;
      v72 = a5;
      v74 = v164;
    }
    else
    {
      v75 = 0;
      *(_QWORD *)&v76 = a2[6];
      *(_QWORD *)&v77 = a2[7];
      *(_QWORD *)&v78 = a2[8];
      *((_QWORD *)&v76 + 1) = a2[10];
      *(_QWORD *)&v56 = a2[14];
      *(_QWORD *)&v57 = a2[15];
      *(_QWORD *)&v58 = a2[16];
      *((_QWORD *)&v77 + 1) = a2[11];
      *((_QWORD *)&v78 + 1) = a2[12];
      *(_OWORD *)&STACK[0x6F0] = v76;
      *(_OWORD *)&STACK[0x700] = v56;
      *(_OWORD *)&STACK[0x710] = v77;
      *(_OWORD *)&STACK[0x720] = v57;
      *(_OWORD *)&STACK[0x730] = v78;
      *(_OWORD *)&STACK[0x740] = v58;
      a36 = 0u;
      a37 = 0u;
      a38 = 0u;
      a39 = 0u;
      __asm { FMOV            V1.2D, #1.0 }
      a40 = 0u;
      *(_OWORD *)&STACK[0x680] = 0u;
      do
      {
        v81 = *(float64x2_t *)((char *)&STACK[0x6F0] + v75);
        v80 = *(float64x2_t *)((char *)&STACK[0x6F0] + v75 + 16);
        v82 = (float64x2_t *)((char *)&a36 + v75);
        *v82 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1A32A2320, v81.f64[0]), (float64x2_t)xmmword_1A32A2330, v81, 1), (float64x2_t)0, v80.f64[0]);
        v82[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v81, (float64x2_t)0), (float64x2_t)0, v81, 1), _Q1, v80);
        v75 += 32;
      }
      while (v75 != 96);
      v83 = 0;
      v87 = a36;
      v84 = a37;
      v88 = a38;
      v85 = a39;
      v89 = a40;
      v86 = *(float64x2_t *)&STACK[0x680];
      *(_OWORD *)&STACK[0x6F0] = xmmword_1A32A2320;
      *(_OWORD *)&STACK[0x700] = 0u;
      *(_OWORD *)&STACK[0x710] = xmmword_1A32A2330;
      *(_OWORD *)&STACK[0x720] = 0u;
      *(_OWORD *)&STACK[0x730] = 0uLL;
      *(float64x2_t *)&STACK[0x740] = _Q1;
      *(_OWORD *)&STACK[0x690] = 0u;
      *(_OWORD *)&STACK[0x6A0] = 0u;
      *(_OWORD *)&STACK[0x6B0] = 0u;
      *(_OWORD *)&STACK[0x6C0] = 0u;
      *(_OWORD *)&STACK[0x6D0] = 0u;
      *(_OWORD *)&STACK[0x6E0] = 0u;
      *(_QWORD *)&v87.f64[1] = vextq_s8((int8x16_t)v87, (int8x16_t)v87, 8uLL).u64[0];
      *(_QWORD *)&v88.f64[1] = vextq_s8((int8x16_t)v88, (int8x16_t)v88, 8uLL).u64[0];
      *(_QWORD *)&v89.f64[1] = vextq_s8((int8x16_t)v89, (int8x16_t)v89, 8uLL).u64[0];
      v73 = a4;
      v72 = a5;
      v74 = v164;
      do
      {
        v91 = *(float64x2_t *)((char *)&STACK[0x6F0] + v83);
        v90 = *(float64x2_t *)((char *)&STACK[0x6F0] + v83 + 16);
        v92 = (float64x2_t *)((char *)&STACK[0x690] + v83);
        *v92 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v87, v91.f64[0]), v88, v91, 1), v89, v90.f64[0]);
        v92[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v84, v91), v85, v91, 1), v90, v86);
        v83 += 32;
      }
      while (v83 != 96);
      v66 = *(float64x2_t *)&STACK[0x690];
      v67 = *(float64x2_t *)&STACK[0x6A0];
      v65 = *(float64x2_t *)&STACK[0x6B0];
      v68 = *(float64x2_t *)&STACK[0x6C0];
      v69 = *(float64x2_t *)&STACK[0x6D0];
      v59 = *(float64x2_t *)&STACK[0x6E0];
      v86.f64[0] = (float64_t)a2[9];
      v90.f64[0] = (float64_t)a2[13];
      v91.f64[0] = (float64_t)a2[17];
      v93 = vmulq_n_f64((float64x2_t)xmmword_1A32A2320, v86.f64[0]);
      v71 = vmlaq_f64(vmlaq_f64(vmulq_f64(v86, (float64x2_t)0), (float64x2_t)0, v90), _Q1, v91);
      v70 = vmlaq_n_f64(vmlaq_n_f64(v93, (float64x2_t)xmmword_1A32A2330, v90.f64[0]), (float64x2_t)0, v91.f64[0]);
    }
    v94 = 0;
    v95 = (float64x2_t)vdupq_laneq_s64((int64x2_t)v70, 1);
    v70.f64[1] = v95.f64[0];
    v95.f64[0] = -1.0 / a8;
    v96 = vmulq_f64(v95, (float64x2_t)0);
    v97 = vmulq_n_f64((float64x2_t)0, -1.0 / a8);
    v98 = vmulq_f64(v95, v71);
    v99 = vsubq_f64(v66, v97);
    v100 = vsubq_f64(v67, v96);
    v101 = vsubq_f64(v65, v97);
    v102 = vsubq_f64(v68, v96);
    v103 = vsubq_f64(v69, vmulq_n_f64(v70, -1.0 / a8));
    v104 = vsubq_f64(v59, v98);
    v108 = *(float64x2_t *)&STACK[0x7B0];
    v105 = *(float64x2_t *)&STACK[0x7C0];
    v109 = *(float64x2_t *)&STACK[0x7D0];
    v106 = *(float64x2_t *)&STACK[0x7E0];
    v110 = *(float64x2_t *)&STACK[0x7F0];
    v107 = *(float64x2_t *)&STACK[0x800];
    *(float64x2_t *)&STACK[0x6F0] = v99;
    *(float64x2_t *)&STACK[0x700] = v100;
    *(float64x2_t *)&STACK[0x710] = v101;
    *(float64x2_t *)&STACK[0x720] = v102;
    *(float64x2_t *)&STACK[0x730] = v103;
    *(float64x2_t *)&STACK[0x740] = v104;
    *(_OWORD *)&STACK[0x690] = 0uLL;
    *(_OWORD *)&STACK[0x6A0] = 0uLL;
    *(_OWORD *)&STACK[0x6B0] = 0uLL;
    *(_OWORD *)&STACK[0x6C0] = 0uLL;
    *(_OWORD *)&STACK[0x6D0] = 0uLL;
    *(_OWORD *)&STACK[0x6E0] = 0uLL;
    *(_QWORD *)&v108.f64[1] = vextq_s8((int8x16_t)v108, (int8x16_t)v108, 8uLL).u64[0];
    *(_QWORD *)&v109.f64[1] = vextq_s8((int8x16_t)v109, (int8x16_t)v109, 8uLL).u64[0];
    *(_QWORD *)&v110.f64[1] = vextq_s8((int8x16_t)v110, (int8x16_t)v110, 8uLL).u64[0];
    do
    {
      v112 = *(float64x2_t *)((char *)&STACK[0x6F0] + v94);
      v111 = *(float64x2_t *)((char *)&STACK[0x6F0] + v94 + 16);
      v113 = (float64x2_t *)((char *)&STACK[0x690] + v94);
      *v113 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v108, v112.f64[0]), v109, v112, 1), v110, v111.f64[0]);
      v113[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v105, v112), v106, v112, 1), v111, v107);
      v94 += 32;
    }
    while (v94 != 96);
    v114 = *(_OWORD *)&STACK[0x780];
    *(_OWORD *)&STACK[0x710] = *(_OWORD *)&STACK[0x770];
    *(_OWORD *)&STACK[0x720] = v114;
    v115 = *(_OWORD *)&STACK[0x7A0];
    *(_OWORD *)&STACK[0x730] = *(_OWORD *)&STACK[0x790];
    *(_OWORD *)&STACK[0x740] = v115;
    v116 = *(_OWORD *)&STACK[0x760];
    *(_OWORD *)&STACK[0x6F0] = *(_OWORD *)&STACK[0x750];
    *(_OWORD *)&STACK[0x700] = v116;
    __invert_d3();
    v117 = 0;
    v124 = *(float64x2_t *)&STACK[0x690];
    v118 = *(float64x2_t *)&STACK[0x6A0];
    v125 = *(float64x2_t *)&STACK[0x6B0];
    v119 = *(float64x2_t *)&STACK[0x6C0];
    v126 = *(float64x2_t *)&STACK[0x6D0];
    v120 = *(float64x2_t *)&STACK[0x6E0];
    v121 = a27;
    *(_OWORD *)&STACK[0x710] = a26;
    *(_OWORD *)&STACK[0x720] = v121;
    v122 = a29;
    *(_OWORD *)&STACK[0x730] = a28;
    *(_OWORD *)&STACK[0x740] = v122;
    v123 = a25;
    *(_OWORD *)&STACK[0x6F0] = a24;
    *(_OWORD *)&STACK[0x700] = v123;
    a30 = 0u;
    a31 = 0u;
    a32 = 0u;
    a33 = 0u;
    a34 = 0u;
    a35 = 0u;
    *(_QWORD *)&v124.f64[1] = vextq_s8((int8x16_t)v124, (int8x16_t)v124, 8uLL).u64[0];
    *(_QWORD *)&v125.f64[1] = vextq_s8((int8x16_t)v125, (int8x16_t)v125, 8uLL).u64[0];
    *(_QWORD *)&v126.f64[1] = vextq_s8((int8x16_t)v126, (int8x16_t)v126, 8uLL).u64[0];
    do
    {
      v128 = *(float64x2_t *)((char *)&STACK[0x6F0] + v117);
      v127 = *(float64x2_t *)((char *)&STACK[0x6F0] + v117 + 16);
      v129 = (float64x2_t *)((char *)&a30 + v117);
      *v129 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v124, v128.f64[0]), v125, v128, 1), v126, v127.f64[0]);
      v129[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v118, v128), v119, v128, 1), v127, v120);
      v117 += 32;
    }
    while (v117 != 96);
    v130 = a33;
    *(_OWORD *)&STACK[0x6B0] = a32;
    *(_OWORD *)&STACK[0x6C0] = v130;
    v131 = a35;
    *(_OWORD *)&STACK[0x6D0] = a34;
    *(_OWORD *)&STACK[0x6E0] = v131;
    v132 = a31;
    *(_OWORD *)&STACK[0x690] = a30;
    *(_OWORD *)&STACK[0x6A0] = v132;
    a34 = 0u;
    a35 = 0u;
    a32 = 0u;
    a33 = 0u;
    a30 = 0u;
    a31 = 0u;
    acpr_computePixelBufferToRawSensorHomography(v74, v72, (uint64_t)&a30);
    a22 = 0u;
    a23 = 0u;
    a20 = 0u;
    a21 = 0u;
    a18 = 0u;
    a19 = 0u;
    acpr_computePixelBufferToRawSensorHomography(v73, v72, (uint64_t)&a18);
    v133 = a21;
    *(_OWORD *)&STACK[0x710] = a20;
    *(_OWORD *)&STACK[0x720] = v133;
    v134 = a23;
    *(_OWORD *)&STACK[0x730] = a22;
    *(_OWORD *)&STACK[0x740] = v134;
    v135 = a19;
    *(_OWORD *)&STACK[0x6F0] = a18;
    *(_OWORD *)&STACK[0x700] = v135;
    result = __invert_d3();
    v136 = 0;
    v137 = *(_OWORD *)&STACK[0x6C0];
    *(_OWORD *)&STACK[0x710] = *(_OWORD *)&STACK[0x6B0];
    *(_OWORD *)&STACK[0x720] = v137;
    v138 = *(_OWORD *)&STACK[0x6E0];
    *(_OWORD *)&STACK[0x730] = *(_OWORD *)&STACK[0x6D0];
    *(_OWORD *)&STACK[0x740] = v138;
    v139 = *(_OWORD *)&STACK[0x6A0];
    *(_OWORD *)&STACK[0x6F0] = *(_OWORD *)&STACK[0x690];
    *(_OWORD *)&STACK[0x700] = v139;
    v140 = v168;
    v141 = vars0;
    a12 = 0u;
    a13 = 0u;
    a14 = 0u;
    a15 = 0u;
    a16 = 0u;
    a17 = 0u;
    *(_QWORD *)&v140.f64[1] = vextq_s8((int8x16_t)v140, (int8x16_t)v140, 8uLL).u64[0];
    *(_QWORD *)&v141.f64[1] = vextq_s8((int8x16_t)v141, (int8x16_t)v141, 8uLL).u64[0];
    *(_QWORD *)&a10.f64[1] = vextq_s8((int8x16_t)a10, (int8x16_t)a10, 8uLL).u64[0];
    do
    {
      v144 = *(float64x2_t *)((char *)&STACK[0x6F0] + v136);
      v143 = *(float64x2_t *)((char *)&STACK[0x6F0] + v136 + 16);
      v145 = (float64x2_t *)((char *)&a12 + v136);
      *v145 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v140, v144.f64[0]), v141, v144, 1), a10, v143.f64[0]);
      v145[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v169, v144), a9, v144, 1), v143, a11);
      v136 += 32;
    }
    while (v136 != 96);
    v146 = 0;
    v147 = a33;
    *(_OWORD *)&STACK[0x710] = a32;
    *(_OWORD *)&STACK[0x720] = v147;
    v148 = a35;
    *(_OWORD *)&STACK[0x730] = a34;
    *(_OWORD *)&STACK[0x740] = v148;
    v149 = a31;
    *(_OWORD *)&STACK[0x6F0] = a30;
    *(_OWORD *)&STACK[0x700] = v149;
    v153 = a12;
    v150 = a13;
    v154 = a14;
    v151 = a15;
    v155 = a16;
    v152 = a17;
    *a7 = 0u;
    a7[1] = 0u;
    a7[2] = 0u;
    a7[3] = 0u;
    a7[4] = 0u;
    a7[5] = 0u;
    *(_QWORD *)&v153.f64[1] = vextq_s8((int8x16_t)v153, (int8x16_t)v153, 8uLL).u64[0];
    *(_QWORD *)&v154.f64[1] = vextq_s8((int8x16_t)v154, (int8x16_t)v154, 8uLL).u64[0];
    *(_QWORD *)&v155.f64[1] = vextq_s8((int8x16_t)v155, (int8x16_t)v155, 8uLL).u64[0];
    do
    {
      v157 = *(float64x2_t *)((char *)&STACK[0x6F0] + v146 * 16);
      v156 = *(float64x2_t *)((char *)&STACK[0x6F0] + v146 * 16 + 16);
      v158 = &a7[v146];
      *v158 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v153, v157.f64[0]), v154, v157, 1), v155, v156.f64[0]);
      v158[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v150, v157), v151, v157, 1), v156, v152);
      v146 += 2;
    }
    while (v146 != 6);
    v159 = a7[5];
    v160 = vmulq_f64(v159, a7[1]);
    v161 = vmulq_f64(v159, a7[3]);
    v162 = vmulq_n_f64(a7[2], v159.f64[0]);
    v163 = vmulq_n_f64(a7[4], v159.f64[0]);
    *a7 = vmulq_n_f64(*a7, v159.f64[0]);
    a7[1] = v160;
    a7[2] = v162;
    a7[3] = v161;
    a7[4] = v163;
    a7[5] = vmulq_f64(v159, v159);
  }
  else
  {
    a7[4] = 0u;
    a7[5] = 0u;
    a7[2] = 0u;
    a7[3] = 0u;
    *a7 = 0u;
    a7[1] = 0u;
  }
  return result;
}

- (uint64_t)_updateCorrectedCalibrationUsingInitialOISCalibration:(int)a3 macroTransitionType:
{
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  uint64_t v12;
  uint64_t (*v13)(_OWORD *, __int128 *, __n128, __n128, __n128, __n128, double, double, double, double);
  simd_float2x2 v14;
  simd_float2x2 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  simd_float2x2 v27;
  simd_float2x2 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  _BYTE v33[1864];
  _OWORD v34[11];
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _OWORD v48[11];
  uint64_t v49;

  if (!a1)
    return 0;
  v49 = 0;
  memset(v48, 0, sizeof(v48));
  v47 = 0;
  v46 = 0u;
  v45 = 0u;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0;
  memset(v34, 0, sizeof(v34));
  bzero(v33, 0x748uLL);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28.columns[0] = 0;
  v28.columns[1] = 0;
  v27.columns[0] = 0;
  v27.columns[1] = 0;
  v6 = *(float64x2_t *)(a2 + 48);
  *(float32x2_t *)&v6.f64[0] = vcvt_f32_f64(v6);
  v7 = *(float64x2_t *)(a2 + 80);
  *(float32x2_t *)&v7.f64[0] = vcvt_f32_f64(v7);
  v8 = *(float64x2_t *)(a2 + 112);
  *(float32x2_t *)&v8.f64[0] = vcvt_f32_f64(v8);
  v9 = vzip1q_s32((int32x4_t)v6, (int32x4_t)v8);
  v10 = vzip2q_s32((int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)(a2 + 64), *(float64x2_t *)(a2 + 64)), (int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)(a2 + 128), *(float64x2_t *)(a2 + 128)));
  v11 = vzip2q_s32((int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)(a2 + 96), *(float64x2_t *)(a2 + 96)), (int32x4_t)0);
  v25 = (__n128)vzip1q_s32(v10, v11);
  v26 = (__n128)vzip1q_s32(v9, (int32x4_t)v7);
  v23 = (__n128)vzip2q_s32(v10, v11);
  v24 = (__n128)vzip2q_s32(v9, vdupq_lane_s32(*(int32x2_t *)&v7.f64[0], 1));
  v12 = (*(uint64_t (**)(__n128 *, simd_float2x2 *, simd_float2x2 *))(a1 + 672))(&v29, &v28, &v27);
  if ((_DWORD)v12
    || (v12 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double, double))(a1 + 688))(*(_QWORD *)(a1 + 240), *(unsigned int *)(a1 + 256), *(_QWORD *)(a1 + 264), *(double *)v28.columns, *(double *)&v28.columns[1]), (_DWORD)v12)|| (v12 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double, double))(a1 + 688))(*(_QWORD *)(a1 + 248), *(unsigned int *)(a1 + 256), *(_QWORD *)(a1 + 272), *(double *)v27.columns, *(double *)&v27.columns[1]), (_DWORD)v12)|| (v12 = (*(uint64_t (**)(uint64_t, _OWORD *, __n128, __n128, __n128, __n128, double, double, double, double))(a1 + 680))(a2, v48, v29, v30, v31,
                v32,
                *(double *)v28.columns,
                *(double *)&v28.columns[1],
                *(double *)v27.columns,
                *(double *)&v27.columns[1]),
        (_DWORD)v12))
  {
    v16 = v12;
    fig_log_get_emitter();
LABEL_14:
    FigDebugAssert3();
    return v16;
  }
  (*(void (**)(_OWORD *__return_ptr, _QWORD, _QWORD, _QWORD, _OWORD *, uint64_t, _BYTE *))(a1 + 664))(v34, *(_QWORD *)(a1 + 264), *(_QWORD *)(a1 + 272), *(unsigned int *)(a1 + 256), v48, objc_msgSend(*(id *)(a1 + 8), "adaptiveCorrectionConfigsPtr") + ((uint64_t)a3 << 9), v33);
  if (!v33[812])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0xFFFFFFFFLL;
  }
  v13 = *(uint64_t (**)(_OWORD *, __int128 *, __n128, __n128, __n128, __n128, double, double, double, double))(a1 + 680);
  v14 = __invert_f2(v28);
  v15 = __invert_f2(v27);
  v16 = v13(v34, &v36, v26, v24, v25, v23, *(double *)v14.columns, *(double *)&v14.columns[1], *(double *)v15.columns, *(double *)&v15.columns[1]);
  if ((_DWORD)v16)
  {
    fig_log_get_emitter();
    goto LABEL_14;
  }
  v17 = v45;
  *(_OWORD *)(a1 + 184) = v44;
  *(_OWORD *)(a1 + 200) = v17;
  *(_OWORD *)(a1 + 216) = v46;
  v18 = v41;
  *(_OWORD *)(a1 + 120) = v40;
  *(_OWORD *)(a1 + 136) = v18;
  v19 = v43;
  *(_OWORD *)(a1 + 152) = v42;
  *(_OWORD *)(a1 + 168) = v19;
  v20 = v37;
  *(_OWORD *)(a1 + 56) = v36;
  *(_OWORD *)(a1 + 72) = v20;
  v21 = v39;
  *(_OWORD *)(a1 + 88) = v38;
  *(_QWORD *)(a1 + 232) = v47;
  *(_OWORD *)(a1 + 104) = v21;
  return v16;
}

- (float64_t)_fundamentalMatrixFromCalibration:(uint64_t)a3@<X2> narrowerMetadata:(uint64_t)a4@<X3> widerMetadata:(_OWORD *)a5@<X8>
{
  void *v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t *v63;
  uint64_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t *v73;
  uint64_t v74;
  float64x2_t v75;
  uint64_t v76;
  char v77;
  char v78;
  unint64_t *v79;
  unint64_t v80;
  __int128 v81;
  unint64_t *v82;
  __int128 v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  int64x2_t v89;
  int64x2_t v90;
  double v91;
  int64x2_t v92;
  int64x2_t v93;
  int64x2_t v94;
  __int128 v95;
  __int128 v96;
  int64x2_t v97;
  int64x2_t v98;
  uint64_t v99;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t *v105;
  uint64_t v106;
  __int128 v107;
  float64x2_t v108;
  float64x2_t v109;
  float64x2_t v110;
  float64x2_t v111;
  float64x2_t v112;
  float64x2_t v113;
  float64x2_t v114;
  float64x2_t v115;
  float64x2_t *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  float64x2_t v121;
  float64x2_t v122;
  float64x2_t v123;
  float64x2_t v124;
  float64x2_t v125;
  float64x2_t v126;
  float64x2_t v127;
  float64x2_t v128;
  float64x2_t *v129;
  float64x2_t v131;
  float64x2_t v132;
  int64x2_t v133;
  float64x2_t v134;
  int64x2_t v135;
  unint64_t v136;
  __int128 v137;
  float64x2_t vars0;
  float64x2_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v142;
  float64x2_t v143;
  float64x2_t v144;
  int64x2_t v145;

  STACK[0x7B8] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v47 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v48 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    objc_msgSend(v47, "setObject:atIndexedSubscript:", a3, 0);
    objc_msgSend(v47, "setObject:atIndexedSubscript:", a4, 1);
    v49 = 0;
    *(_QWORD *)&v50 = a2[6];
    *(_QWORD *)&v51 = a2[7];
    *(_QWORD *)&v52 = a2[8];
    *((_QWORD *)&v50 + 1) = a2[10];
    *(_QWORD *)&v53 = a2[14];
    *(_QWORD *)&v54 = a2[15];
    *(_QWORD *)&v55 = a2[16];
    *((_QWORD *)&v51 + 1) = a2[11];
    *((_QWORD *)&v52 + 1) = a2[12];
    *(_OWORD *)&STACK[0x6F0] = v50;
    *(_OWORD *)&STACK[0x700] = v53;
    *(_OWORD *)&STACK[0x710] = v51;
    *(_OWORD *)&STACK[0x720] = v54;
    *(_OWORD *)&STACK[0x730] = v52;
    *(_OWORD *)&STACK[0x740] = v55;
    a42 = 0u;
    a43 = 0u;
    *(_OWORD *)&STACK[0x640] = 0u;
    *(_OWORD *)&STACK[0x650] = 0u;
    __asm { FMOV            V18.2D, #1.0 }
    *(_OWORD *)&STACK[0x660] = 0u;
    *(_OWORD *)&STACK[0x670] = 0u;
    do
    {
      v62 = *(float64x2_t *)((char *)&STACK[0x6F0] + v49);
      v61 = *(float64x2_t *)((char *)&STACK[0x6F0] + v49 + 16);
      v63 = (float64x2_t *)((char *)&a42 + v49);
      *v63 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1A32A2320, v62.f64[0]), (float64x2_t)xmmword_1A32A2330, v62, 1), (float64x2_t)0, v61.f64[0]);
      v63[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v62, (float64x2_t)0), (float64x2_t)0, v62, 1), _Q18, v61);
      v49 += 32;
    }
    while (v49 != 96);
    v64 = 0;
    v68 = a42;
    v65 = a43;
    v69 = *(float64x2_t *)&STACK[0x640];
    v66 = *(float64x2_t *)&STACK[0x650];
    v70 = *(float64x2_t *)&STACK[0x660];
    v67 = *(float64x2_t *)&STACK[0x670];
    *(_OWORD *)&STACK[0x6F0] = xmmword_1A32A2320;
    *(_OWORD *)&STACK[0x700] = 0u;
    *(_OWORD *)&STACK[0x710] = xmmword_1A32A2330;
    *(_OWORD *)&STACK[0x720] = 0u;
    *(_OWORD *)&STACK[0x730] = 0uLL;
    *(float64x2_t *)&STACK[0x740] = _Q18;
    *(_OWORD *)&STACK[0x680] = 0u;
    *(_OWORD *)&STACK[0x690] = 0u;
    *(_OWORD *)&STACK[0x6A0] = 0u;
    *(_OWORD *)&STACK[0x6B0] = 0u;
    *(_OWORD *)&STACK[0x6C0] = 0u;
    *(_OWORD *)&STACK[0x6D0] = 0u;
    *(_QWORD *)&v68.f64[1] = vextq_s8((int8x16_t)v68, (int8x16_t)v68, 8uLL).u64[0];
    *(_QWORD *)&v69.f64[1] = vextq_s8((int8x16_t)v69, (int8x16_t)v69, 8uLL).u64[0];
    *(_QWORD *)&v70.f64[1] = vextq_s8((int8x16_t)v70, (int8x16_t)v70, 8uLL).u64[0];
    do
    {
      v72 = *(float64x2_t *)((char *)&STACK[0x6F0] + v64);
      v71 = *(float64x2_t *)((char *)&STACK[0x6F0] + v64 + 16);
      v73 = (float64x2_t *)((char *)&STACK[0x680] + v64);
      *v73 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v68, v72.f64[0]), v69, v72, 1), v70, v71.f64[0]);
      v73[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v65, v72), v66, v72, 1), v71, v67);
      v64 += 32;
    }
    while (v64 != 96);
    v74 = 0;
    v142 = *(float64x2_t *)&STACK[0x690];
    v143 = *(float64x2_t *)&STACK[0x680];
    v140 = *(float64x2_t *)&STACK[0x6B0];
    v141 = *(float64x2_t *)&STACK[0x6A0];
    v75 = *(float64x2_t *)&STACK[0x6C0];
    vars0 = *(float64x2_t *)&STACK[0x6D0];
    v139 = *(float64x2_t *)&STACK[0x6C0];
    v75.f64[0] = (float64_t)a2[9];
    v131 = v75;
    v75.f64[0] = (float64_t)a2[13];
    v132 = v75;
    v75.f64[0] = (float64_t)a2[17];
    v134 = v75;
    v76 = *MEMORY[0x1E0D06D00];
    v77 = 1;
    v144 = _Q18;
    do
    {
      v78 = v77;
      objc_msgSend(v48, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v47, "objectAtIndexedSubscript:", v74, *(_OWORD *)&v131), "objectForKeyedSubscript:", v76), v74);
      v77 = 0;
      v79 = &a2[v74];
      v80 = *v79;
      *(_QWORD *)&v81 = v79[2];
      *((_QWORD *)&v81 + 1) = v79[4];
      v82 = &STACK[0x6F0] + 12 * v74;
      *(_QWORD *)&v83 = 0;
      *((_QWORD *)&v83 + 1) = v80;
      *(_OWORD *)v82 = v80;
      *((_OWORD *)v82 + 1) = 0u;
      *((_OWORD *)v82 + 2) = v83;
      *((_OWORD *)v82 + 3) = 0u;
      *((_OWORD *)v82 + 4) = v81;
      *((float64x2_t *)v82 + 5) = v144;
      v74 = 1;
    }
    while ((v78 & 1) != 0);
    v84.f64[0] = v131.f64[0];
    v84.f64[1] = v131.f64[0];
    v85.f64[0] = v132.f64[0];
    v85.f64[1] = v132.f64[0];
    v86 = vmlaq_f64(vmulq_f64(v84, (float64x2_t)xmmword_1A32A2320), (float64x2_t)xmmword_1A32A2330, v85);
    v85.f64[0] = v134.f64[0];
    v85.f64[1] = v134.f64[0];
    v87 = vmlaq_f64(v86, (float64x2_t)0, v85);
    v88 = vmlaq_f64(vmlaq_f64(vmulq_f64(v131, (float64x2_t)0), (float64x2_t)0, v132), v144, v134);
    v89 = (int64x2_t)vnegq_f64(v143);
    v90 = (int64x2_t)vnegq_f64(v141);
    v91 = vmlsq_f64(vmlsq_laneq_f64(vmulq_f64(vnegq_f64(v139), v87), (float64x2_t)vdupq_laneq_s64((int64x2_t)v87, 1), v139, 1), v88, vars0).f64[0];
    v92 = (int64x2_t)vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)vzip1q_s64(v89, v90), v87.f64[0]), (float64x2_t)vzip2q_s64(v89, v90), v87, 1), (float64x2_t)vzip1q_s64((int64x2_t)vnegq_f64(v142), (int64x2_t)vnegq_f64(v140)), v88.f64[0]);
    v135 = (int64x2_t)*(unint64_t *)&v91;
    v136 = vdupq_laneq_s64(v92, 1).u64[0];
    v137 = COERCE_UNSIGNED_INT64(-v91);
    a5[4] = 0u;
    a5[5] = 0u;
    a5[2] = 0u;
    a5[3] = 0u;
    *a5 = 0u;
    a5[1] = 0u;
    v93 = *(int64x2_t *)&STACK[0x760];
    v94 = *(int64x2_t *)&STACK[0x780];
    v96 = *(_OWORD *)&STACK[0x790];
    v95 = *(_OWORD *)&STACK[0x7A0];
    v97 = vzip2q_s64(*(int64x2_t *)&STACK[0x750], *(int64x2_t *)&STACK[0x770]);
    v98 = vdupq_laneq_s64(*(int64x2_t *)&STACK[0x790], 1);
    v145 = v92;
    *(double *)v92.i64 = -*(double *)&v92.i64[1];
    v133 = v92;
    *(int64x2_t *)&STACK[0x680] = vzip1q_s64(*(int64x2_t *)&STACK[0x750], *(int64x2_t *)&STACK[0x770]);
    *(_OWORD *)&STACK[0x690] = v96;
    *(int64x2_t *)&STACK[0x6A0] = v97;
    *(int64x2_t *)&STACK[0x6B0] = v98;
    *(int64x2_t *)&STACK[0x6C0] = vzip1q_s64(v93, v94);
    *(_OWORD *)&STACK[0x6D0] = v95;
    __invert_d3();
    v99 = 0;
    *(float64x2_t *)&STACK[0x680] = v143;
    *(float64x2_t *)&STACK[0x690] = v142;
    *(float64x2_t *)&STACK[0x6A0] = v141;
    *(float64x2_t *)&STACK[0x6B0] = v140;
    *(float64x2_t *)&STACK[0x6C0] = v139;
    *(float64x2_t *)&STACK[0x6D0] = vars0;
    a30 = 0u;
    a31 = 0u;
    a32 = 0u;
    a33 = 0u;
    a34 = 0u;
    a35 = 0u;
    *(_QWORD *)&a24.f64[1] = vextq_s8((int8x16_t)a24, (int8x16_t)a24, 8uLL).u64[0];
    *(_QWORD *)&a26.f64[1] = vextq_s8((int8x16_t)a26, (int8x16_t)a26, 8uLL).u64[0];
    *(_QWORD *)&a28.f64[1] = vextq_s8((int8x16_t)a28, (int8x16_t)a28, 8uLL).u64[0];
    do
    {
      v104 = *(float64x2_t *)((char *)&STACK[0x680] + v99);
      v103 = *(float64x2_t *)((char *)&STACK[0x680] + v99 + 16);
      v105 = (float64x2_t *)((char *)&a30 + v99);
      *v105 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a24, v104.f64[0]), a26, v104, 1), a28, v103.f64[0]);
      v105[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(a25, v104), a27, v104, 1), v103, a29);
      v99 += 32;
    }
    while (v99 != 96);
    v106 = 0;
    *(_QWORD *)&v107 = v136;
    *((double *)&v107 + 1) = -*(double *)v145.i64;
    v111 = a30;
    v108 = a31;
    v112 = a32;
    v109 = a33;
    v113 = a34;
    v110 = a35;
    *(int64x2_t *)&STACK[0x680] = vzip1q_s64((int64x2_t)0, v135);
    *(int64x2_t *)&STACK[0x690] = v133;
    *(_OWORD *)&STACK[0x6A0] = v137;
    *(int64x2_t *)&STACK[0x6B0] = v145;
    *(_OWORD *)&STACK[0x6C0] = v107;
    *(_OWORD *)&STACK[0x6D0] = 0u;
    a36 = 0u;
    a37 = 0u;
    a38 = 0u;
    a39 = 0u;
    a40 = 0u;
    a41 = 0u;
    *(_QWORD *)&v111.f64[1] = vextq_s8((int8x16_t)v111, (int8x16_t)v111, 8uLL).u64[0];
    *(_QWORD *)&v112.f64[1] = vextq_s8((int8x16_t)v112, (int8x16_t)v112, 8uLL).u64[0];
    *(_QWORD *)&v113.f64[1] = vextq_s8((int8x16_t)v113, (int8x16_t)v113, 8uLL).u64[0];
    do
    {
      v115 = *(float64x2_t *)((char *)&STACK[0x680] + v106);
      v114 = *(float64x2_t *)((char *)&STACK[0x680] + v106 + 16);
      v116 = (float64x2_t *)((char *)&a36 + v106);
      *v116 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v111, v115.f64[0]), v112, v115, 1), v113, v114.f64[0]);
      v116[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v108, v115), v109, v115, 1), v114, v110);
      v106 += 32;
    }
    while (v106 != 96);
    v117 = *(_OWORD *)&STACK[0x720];
    *(_OWORD *)&STACK[0x6A0] = *(_OWORD *)&STACK[0x710];
    *(_OWORD *)&STACK[0x6B0] = v117;
    v118 = *(_OWORD *)&STACK[0x740];
    *(_OWORD *)&STACK[0x6C0] = *(_OWORD *)&STACK[0x730];
    *(_OWORD *)&STACK[0x6D0] = v118;
    v119 = *(_OWORD *)&STACK[0x700];
    *(_OWORD *)&STACK[0x680] = *(_OWORD *)&STACK[0x6F0];
    *(_OWORD *)&STACK[0x690] = v119;
    __invert_d3();
    v120 = 0;
    v124 = a36;
    v121 = a37;
    v125 = a38;
    v122 = a39;
    v126 = a40;
    v123 = a41;
    *(_OWORD *)&STACK[0x6A0] = a20;
    *(_OWORD *)&STACK[0x6B0] = a21;
    *(_OWORD *)&STACK[0x6C0] = a22;
    *(_OWORD *)&STACK[0x6D0] = a23;
    *(_OWORD *)&STACK[0x680] = a18;
    *(_OWORD *)&STACK[0x690] = a19;
    *a5 = 0u;
    a5[1] = 0u;
    a5[2] = 0u;
    a5[3] = 0u;
    a5[4] = 0u;
    a5[5] = 0u;
    *(_QWORD *)&v124.f64[1] = vextq_s8((int8x16_t)v124, (int8x16_t)v124, 8uLL).u64[0];
    *(_QWORD *)&v125.f64[1] = vextq_s8((int8x16_t)v125, (int8x16_t)v125, 8uLL).u64[0];
    *(_QWORD *)&v126.f64[1] = vextq_s8((int8x16_t)v126, (int8x16_t)v126, 8uLL).u64[0];
    do
    {
      v128 = *(float64x2_t *)((char *)&STACK[0x680] + v120 * 16);
      v127 = *(float64x2_t *)((char *)&STACK[0x680] + v120 * 16 + 16);
      v129 = (float64x2_t *)&a5[v120];
      *v129 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v124, v128.f64[0]), v125, v128, 1), v126, v127.f64[0]);
      v129[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v121, v128), v122, v128, 1), v127, v123);
      v120 += 2;
    }
    while (v120 != 6);
  }
  else
  {
    v124.f64[0] = 0.0;
    a5[4] = 0u;
    a5[5] = 0u;
    a5[2] = 0u;
    a5[3] = 0u;
    *a5 = 0u;
    a5[1] = 0u;
  }
  return v124.f64[0];
}

- (uint64_t)_estimateDepthFromKeypointsUsingCalibration:(float64x2_t *)a3 narrowerRawSensorResolution:(int)a4 fundamentalMatrix:(_QWORD *)a5 macroTransitionType:(float64x2_t)a6 totalZoomFactor:(double)a7 consolidatedDepthsOut:(float64x2_t)a8
{
  __int128 a64;
  __int128 v64;
  float v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  double v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t *v81;
  uint64_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t *v91;
  uint64_t v92;
  __int128 v93;
  int64x2_t v94;
  __int128 v95;
  int64x2_t v96;
  __int128 v97;
  int64x2_t v98;
  float64x2_t v99;
  int64x2_t v100;
  int64x2_t v101;
  int64x2_t v102;
  int64x2_t v103;
  int64x2_t v104;
  int64x2_t v105;
  int64x2_t v106;
  int64x2_t v107;
  char v108;
  float64x2_t v109;
  float64x2_t v110;
  uint64_t v111;
  double *v112;
  float64_t v113;
  float64_t v114;
  float64_t v115;
  unint64_t *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  char v122;
  float64x2_t v123;
  float64x2_t v124;
  float64x2_t v125;
  float64x2_t v126;
  float64x2_t v127;
  float64x2_t *v128;
  __int128 v129;
  __int128 *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint64_t v134;
  __int128 v135;
  __int128 v136;
  uint64_t i;
  uint64_t v138;
  float64x2_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t *v142;
  void *v143;
  void *v144;
  double v145;
  uint64_t v146;
  uint64_t v147;
  double v148;
  double v149;
  double v150;
  double v151;
  void *v152;
  float v153;
  uint64_t v154;
  uint64_t v155;
  double v156;
  double v157;
  double v158;
  uint64_t v159;
  double v160;
  uint64_t v161;
  uint64_t v162;
  double v163;
  float64x2_t v164;
  float64x2_t v165;
  uint64_t v166;
  float64x2_t v167;
  double v168;
  double v169;
  double v170;
  uint64_t j;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  double v175;
  double v176;
  uint64_t v177;
  double v178;
  double v179;
  double v180;
  int *v181;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  _OWORD var10[2];

  STACK[0xBF8] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a5)
    {
      v65 = *(float *)a8.f64;
      v66 = a6.f64[0];
      v67 = result;
      v68 = 0;
      v69 = a6.f64[0] * 0.5;
      *a5 = 0;
      a5[1] = 0;
      v70 = a7 * 0.5;
      a5[2] = 0;
      *(_QWORD *)&v71 = a2[6];
      *(_QWORD *)&v72 = a2[7];
      *(_QWORD *)&v73 = a2[8];
      a6.f64[0] = (float64_t)a2[9];
      *((_QWORD *)&v71 + 1) = a2[10];
      a9.f64[0] = (float64_t)a2[13];
      a12.n128_u64[0] = a2[14];
      a13.n128_u64[0] = a2[15];
      *(_QWORD *)&v64 = a2[16];
      a8.f64[0] = (float64_t)a2[17];
      *((_QWORD *)&v72 + 1) = a2[11];
      *((_QWORD *)&v73 + 1) = a2[12];
      *(__n128 *)&STACK[0xB50] = a12;
      *(_OWORD *)&STACK[0xB40] = v71;
      *(__n128 *)&STACK[0xB70] = a13;
      *(_OWORD *)&STACK[0xB60] = v72;
      *(_OWORD *)&STACK[0xB90] = v64;
      *(_OWORD *)&STACK[0xB80] = v73;
      a41 = 0u;
      a42 = 0u;
      a39 = 0u;
      a40 = 0u;
      __asm { FMOV            V4.2D, #1.0 }
      a37 = 0u;
      a38 = 0u;
      do
      {
        v80 = *(float64x2_t *)((char *)&STACK[0xB40] + v68);
        v79 = *(float64x2_t *)((char *)&STACK[0xB40] + v68 + 16);
        v81 = (float64x2_t *)((char *)&a37 + v68);
        *v81 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1A32A2320, v80.f64[0]), (float64x2_t)xmmword_1A32A2330, v80, 1), (float64x2_t)0, v79.f64[0]);
        v81[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v80, (float64x2_t)0), (float64x2_t)0, v80, 1), _Q4, v79);
        v68 += 32;
      }
      while (v68 != 96);
      v82 = 0;
      v86 = a37;
      v83 = a38;
      v87 = a39;
      v84 = a40;
      v88 = a41;
      v85 = a42;
      *(_OWORD *)&STACK[0xB50] = 0u;
      *(_OWORD *)&STACK[0xB40] = xmmword_1A32A2320;
      *(_OWORD *)&STACK[0xB70] = 0u;
      *(_OWORD *)&STACK[0xB60] = xmmword_1A32A2330;
      *(_OWORD *)&STACK[0xB80] = 0uLL;
      *(float64x2_t *)&STACK[0xB90] = _Q4;
      *(_OWORD *)&STACK[0xAC0] = 0u;
      *(_OWORD *)&STACK[0xAD0] = 0u;
      *(_OWORD *)&STACK[0xAE0] = 0u;
      *(_OWORD *)&STACK[0xAF0] = 0u;
      *(_OWORD *)&STACK[0xB00] = 0u;
      *(_OWORD *)&STACK[0xB10] = 0u;
      *(_QWORD *)&v86.f64[1] = vextq_s8((int8x16_t)v86, (int8x16_t)v86, 8uLL).u64[0];
      *(_QWORD *)&v87.f64[1] = vextq_s8((int8x16_t)v87, (int8x16_t)v87, 8uLL).u64[0];
      *(_QWORD *)&v88.f64[1] = vextq_s8((int8x16_t)v88, (int8x16_t)v88, 8uLL).u64[0];
      do
      {
        v90 = *(float64x2_t *)((char *)&STACK[0xB40] + v82);
        v89 = *(float64x2_t *)((char *)&STACK[0xB40] + v82 + 16);
        v91 = (float64x2_t *)((char *)&STACK[0xAC0] + v82);
        *v91 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v86, v90.f64[0]), v87, v90, 1), v88, v89.f64[0]);
        v91[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v83, v90), v84, v90, 1), v89, v85);
        v82 += 32;
      }
      while (v82 != 96);
      v92 = 0;
      v93 = *(_OWORD *)&STACK[0xAD0];
      v94 = *(int64x2_t *)&STACK[0xAC0];
      v95 = *(_OWORD *)&STACK[0xAF0];
      v96 = *(int64x2_t *)&STACK[0xAE0];
      v97 = *(_OWORD *)&STACK[0xB10];
      v98 = *(int64x2_t *)&STACK[0xB00];
      v99 = vmulq_n_f64((float64x2_t)xmmword_1A32A2320, a6.f64[0]);
      v109 = vmlaq_f64(vmlaq_f64(vmulq_f64(a6, (float64x2_t)0), (float64x2_t)0, a9), _Q4, a8);
      v100 = (int64x2_t)vmlaq_n_f64(vmlaq_n_f64(v99, (float64x2_t)xmmword_1A32A2330, a9.f64[0]), (float64x2_t)0, a8.f64[0]);
      *(_OWORD *)&STACK[0x940] = xmmword_1A32A2310;
      *(_OWORD *)&STACK[0x950] = 0u;
      *(_OWORD *)&STACK[0x960] = xmmword_1A32A2300;
      *(_OWORD *)&STACK[0x970] = 0u;
      *(_OWORD *)&STACK[0x980] = 0u;
      *(float64x2_t *)&STACK[0x990] = _Q4;
      *(_OWORD *)&STACK[0x9A0] = 0u;
      *(_OWORD *)&STACK[0x9B0] = 0u;
      v101.i64[0] = vdupq_laneq_s64(v98, 1).u64[0];
      v102 = vzip1q_s64(v98, v100);
      v101.i64[1] = v100.i64[1];
      v103 = vzip1q_s64(v94, v96);
      v104 = vzip2q_s64(v94, v96);
      v105 = vzip1q_s64(v103, v104);
      v106 = vzip2q_s64(v103, v104);
      v107 = vzip1q_s64(v102, v101);
      v110 = (float64x2_t)vzip2q_s64(v102, v101);
      *(int64x2_t *)&STACK[0x9C0] = v105;
      *(_OWORD *)&STACK[0x9D0] = v93;
      *(int64x2_t *)&STACK[0x9E0] = v106;
      *(_OWORD *)&STACK[0x9F0] = v95;
      *(_OWORD *)&STACK[0xA10] = v97;
      *(int64x2_t *)&STACK[0xA00] = v107;
      *(float64x2_t *)&STACK[0xA30] = v109;
      *(float64x2_t *)&STACK[0xA20] = v110;
      v108 = 1;
      v109.f64[0] = 0.0;
      v110.f64[0] = 1.0;
      do
      {
        v111 = 0;
        v112 = (double *)&a2[v92];
        v113 = *v112;
        v114 = v112[2];
        v115 = v112[4];
        v116 = &STACK[0x940] + 16 * v92;
        v117 = *((_OWORD *)v116 + 5);
        *(_OWORD *)&STACK[0xB80] = *((_OWORD *)v116 + 4);
        *(_OWORD *)&STACK[0xB90] = v117;
        v118 = *((_OWORD *)v116 + 7);
        *(_OWORD *)&STACK[0xBA0] = *((_OWORD *)v116 + 6);
        *(_OWORD *)&STACK[0xBB0] = v118;
        v119 = *((_OWORD *)v116 + 1);
        *(_OWORD *)&STACK[0xB40] = *(_OWORD *)v116;
        *(_OWORD *)&STACK[0xB50] = v119;
        v120 = *((_OWORD *)v116 + 2);
        v121 = *((_OWORD *)v116 + 3);
        v122 = v108;
        *(_OWORD *)&STACK[0xB60] = v120;
        *(_OWORD *)&STACK[0xB70] = v121;
        *(_OWORD *)&STACK[0xAC0] = 0uLL;
        *(_OWORD *)&STACK[0xAD0] = 0uLL;
        *(_OWORD *)&STACK[0xAE0] = 0uLL;
        *(_OWORD *)&STACK[0xAF0] = 0uLL;
        *(_OWORD *)&STACK[0xB00] = 0uLL;
        *(_OWORD *)&STACK[0xB10] = 0uLL;
        *(_OWORD *)&STACK[0xB20] = 0uLL;
        *(_OWORD *)&STACK[0xB30] = 0uLL;
        do
        {
          v124 = *(float64x2_t *)((char *)&STACK[0xB40] + v111);
          v123 = *(float64x2_t *)((char *)&STACK[0xB40] + v111 + 16);
          v125.f64[0] = 0.0;
          v125.f64[1] = v113;
          v126 = vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)*(unint64_t *)&v113, v124.f64[0]), v125, v124, 1);
          v127 = vmlaq_laneq_f64(vmulq_f64(v109, v124), v109, v124, 1);
          v124.f64[0] = v114;
          v124.f64[1] = v115;
          v128 = (float64x2_t *)((char *)&STACK[0xAC0] + v111);
          *v128 = vmlaq_n_f64(v126, v124, v123.f64[0]);
          v128[1] = vmlaq_f64(v127, v123, v110);
          v111 += 32;
        }
        while (v111 != 128);
        v108 = 0;
        v129 = *(_OWORD *)&STACK[0xB10];
        v130 = &a59 + 8 * v92;
        v130[4] = *(_OWORD *)&STACK[0xB00];
        v130[5] = v129;
        v131 = *(_OWORD *)&STACK[0xB30];
        v130[6] = *(_OWORD *)&STACK[0xB20];
        v130[7] = v131;
        v132 = *(_OWORD *)&STACK[0xAD0];
        *v130 = *(_OWORD *)&STACK[0xAC0];
        v130[1] = v132;
        v133 = *(_OWORD *)&STACK[0xAF0];
        v130[2] = *(_OWORD *)&STACK[0xAE0];
        v130[3] = v133;
        v92 = 1;
      }
      while ((v122 & 1) != 0);
      bzero(*(void **)(result + 280), 8 * objc_msgSend(*(id *)(result + 8), "configuredNumKeypoints"));
      v187 = *(_QWORD *)(v67 + 248);
      v188 = *(_QWORD *)(v67 + 240);
      v134 = *(unsigned int *)(v67 + 256);
      v185 = *(_QWORD *)(v67 + 280);
      a33 = a63;
      a34 = a64;
      v135 = *(_OWORD *)&STACK[0x8B0];
      a35 = *(_OWORD *)&STACK[0x8A0];
      a36 = v135;
      a29 = a59;
      a30 = a60;
      a31 = a61;
      a32 = a62;
      v136 = *(_OWORD *)&STACK[0x8D0];
      var10[0] = *(_OWORD *)&STACK[0x8C0];
      var10[1] = v136;
      *(_OWORD *)&STACK[0xAB0] = 0u;
      *(_OWORD *)&STACK[0xAA0] = 0u;
      *(_OWORD *)&STACK[0xA90] = 0u;
      *(_OWORD *)&STACK[0xA80] = 0u;
      *(_OWORD *)&STACK[0xA70] = 0u;
      *(_OWORD *)&STACK[0xA60] = 0u;
      *(_OWORD *)&STACK[0xA50] = 0u;
      *(_OWORD *)&STACK[0xA40] = 0u;
      *(_OWORD *)&STACK[0xAC0] = 0u;
      *(_OWORD *)&STACK[0xAD0] = 0u;
      *(_OWORD *)&STACK[0xAE0] = 0u;
      *(_OWORD *)&STACK[0xAF0] = 0u;
      *(_OWORD *)&STACK[0xB00] = 0u;
      *(_OWORD *)&STACK[0xB10] = 0u;
      *(_OWORD *)&STACK[0xB20] = 0u;
      *(_OWORD *)&STACK[0xB30] = 0u;
      v186 = v134;
      if ((int)v134 >= 1)
      {
        for (i = 0; i != v186; ++i)
        {
          v138 = 0;
          v139 = *(float64x2_t *)(v188 + 16 * i);
          v140 = *(float64x2_t *)(v187 + 16 * i);
          do
          {
            v141 = vmlaq_n_f64(vnegq_f64((float64x2_t)var10[v138]), v140, *(double *)&var10[v138 + 1]);
            v142 = (float64x2_t *)((char *)&STACK[0xA40] + v138 * 16);
            *v142 = vmlaq_n_f64(vnegq_f64(*(float64x2_t *)((char *)&a29 + v138 * 16)), v139, *(double *)((char *)&a29 + v138 * 16 + 16));
            v142[1] = v141;
            v138 += 2;
          }
          while (v138 != 8);
          a52 = 4;
          a51 = 4;
          a50 = 4;
          a49 = 4;
          a48 = 4;
          a47 = 0;
          a46 = -1;
          a44 = -1.0;
          v181 = &a49;
          dgesvd_NEWLAPACK();
          if (a47
            || (a46 = (int)a44, (v143 = malloc_type_malloc(8 * (int)a44, 0x100004000313F17uLL)) == 0)
            || (v144 = v143, v181 = &a49, dgesvd_NEWLAPACK(), free(v144), a47))
          {
            fig_log_get_emitter();
            LODWORD(v181) = 0;
            FigDebugAssert3();
          }
          else if (*(double *)&STACK[0xB38] != 0.0)
          {
            v145 = *(double *)&STACK[0xB18] / *(double *)&STACK[0xB38];
            if (v145 <= 0.0)
              v145 = -v145;
            *(double *)(v185 + 8 * i) = v145;
            continue;
          }
          *(_QWORD *)(v185 + 8 * i) = 0;
        }
      }
      v146 = 0;
      v147 = v67 + 288;
      do
      {
        bzero(*(void **)(v147 + v146), 8 * objc_msgSend(*(id *)(v67 + 8), "configuredNumKeypoints", v181));
        v146 += 8;
      }
      while (v146 != 24);
      objc_msgSend(*(id *)(v67 + 8), "epipolarWeightFalloffDistance");
      v149 = v148;
      objc_msgSend(*(id *)(v67 + 8), "macroDepthWeightFalloffDistance");
      v150 = v151;
      LODWORD(v151) = 1.0;
      if (a4 == 2)
      {
        v152 = (void *)objc_msgSend(*(id *)(v67 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18], v151);
        objc_msgSend((id)objc_msgSend(v152, "objectForKeyedSubscript:", *MEMORY[0x1E0D058B8]), "floatValue");
        v151 = fmin((float)(v65 / v153), 3.0);
        if (v151 < 1.0)
          v151 = 1.0;
        *(float *)&v151 = v151;
      }
      v154 = *(unsigned int *)(v67 + 256);
      if ((_DWORD)v154)
      {
        v155 = 0;
        v156 = v66 * 0.25 * (v66 * 0.25);
        v157 = v149 / 0.693147181;
        v158 = v150 / 0.693147181;
        v159 = *(_QWORD *)(v67 + 280);
        v160 = v156 / (float)(*(float *)&v151 * *(float *)&v151);
        do
        {
          if (*(double *)(v159 + 8 * v155) != 0.0)
          {
            v161 = *(_QWORD *)(v67 + 240);
            *(long double *)(*(_QWORD *)(v67 + 288) + 8 * v155) = exp(-(*(double *)(v161 + 16 * v155)* *(double *)(v161 + 16 * v155))/ v156);
            *(long double *)(*(_QWORD *)(v67 + 296) + 8 * v155) = exp(-((v66 - *(double *)(v161 + 16 * v155))* (v66 - *(double *)(v161 + 16 * v155)))/ v156);
            v162 = (2 * v155) | 1;
            v163 = sqrt((v70 - *(double *)(v161 + 8 * v162)) * (v70 - *(double *)(v161 + 8 * v162))+ (v69 - *(double *)(v161 + 16 * v155)) * (v69 - *(double *)(v161 + 16 * v155)));
            v164.f64[0] = exp(-(v163 * v163) / v160);
            v166 = *(_QWORD *)(v67 + 304);
            *(float64_t *)(v166 + 8 * v155) = v164.f64[0];
            if (a4)
              *(long double *)(v166 + 8 * v155) = v164.f64[0] * exp(-*(double *)(v159 + 8 * v155) / v158);
            v165.f64[0] = *(float64_t *)(v161 + 16 * v155);
            v164.f64[0] = *(float64_t *)(v161 + 8 * v162);
            v167 = vaddq_f64(a3[4], vmlaq_n_f64(vmulq_n_f64(*a3, v165.f64[0]), a3[2], v164.f64[0]));
            v168 = sqrt(vmlad_n_f64(vmuld_lane_f64(v167.f64[1], v167, 1), v167.f64[0], v167.f64[0]));
            if (v168 == 0.0)
            {
              v170 = 0.0;
            }
            else
            {
              v169 = (vaddq_f64(a3[5], vmlaq_f64(vmulq_f64(v165, a3[1]), v164, a3[3])).f64[0]
                    + v167.f64[1] * *(double *)(*(_QWORD *)(v67 + 248) + 8 * v162)
                    + v167.f64[0] * *(double *)(*(_QWORD *)(v67 + 248) + 16 * v155))
                   / fabs(v168);
              if (v169 >= 0.0)
                v169 = -v169;
              v170 = exp(v169 / v157);
            }
            for (j = 0; j != 24; j += 8)
              *(double *)(*(_QWORD *)(v147 + j) + 8 * v155) = v170 * *(double *)(*(_QWORD *)(v147 + j) + 8 * v155);
          }
          ++v155;
        }
        while (v155 != v154);
        v172 = 0;
        a57 = 0;
        a56 = 0;
        a58 = 0;
        a55 = 0;
        a53 = 0;
        a54 = 0;
        v173 = *(_QWORD *)(v67 + 280);
        do
        {
          v174 = 0;
          v175 = *(double *)(v173 + 8 * v172);
          do
          {
            if (v175 != 0.0)
            {
              v176 = *(double *)(*(_QWORD *)(v147 + v174) + 8 * v172);
              *(double *)((char *)&a56 + v174) = *(double *)((char *)&a56 + v174) + 1.0 / v175 * v176;
              *(double *)((char *)&a53 + v174) = v176 + *(double *)((char *)&a53 + v174);
            }
            v174 += 8;
          }
          while (v174 != 24);
          ++v172;
        }
        while (v172 != v154);
      }
      else
      {
        a57 = 0;
        a56 = 0;
        a58 = 0;
        a55 = 0;
        a53 = 0;
        a54 = 0;
      }
      v177 = 0;
      while (1)
      {
        v178 = *(double *)((char *)&a53 + v177 * 8);
        if (v178 == 0.0)
          break;
        v179 = *(double *)((char *)&a56 + v177 * 8);
        if (v179 == 0.0)
          break;
        v180 = v179 / v178;
        *(double *)((char *)&a56 + v177 * 8) = v180;
        *(double *)&a5[v177++] = 1.0 / v180;
        if (v177 == 3)
          return 0;
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return 0xFFFFFFFFLL;
  }
  return result;
}

- (uint64_t)_verifyRegistrationTransform:(uint64_t)a3 usingInitialOISCalibration:(uint64_t)a4 narrowerMetadata:(uint64_t)a5 widerMetadata:(uint64_t)a6 narrowerDimensions:(double)a7
{
  uint64_t v12;
  double v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  uint64_t v17;
  float64x2_t *v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t *v22;
  float64x2_t v23;
  int v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  int8x16_t v34;
  float64x2_t v35;
  int8x16_t v36;
  float64x2_t v37;
  float64x2_t *v38;
  float64x2_t v39;
  float64x2_t v40;
  double v41;
  float64x2_t v42;
  double v43;
  float64x2_t v44;
  double v45;
  float64x2_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
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
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  int8x16_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  int8x16_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  int8x16_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  uint64_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;
  _OWORD v95[18];
  _OWORD v96[18];

  *(_QWORD *)&v70.f64[0] = a4;
  *(_QWORD *)&v70.f64[1] = a5;
  *(_QWORD *)&v66.f64[0] = a2;
  *(_QWORD *)&v68.f64[1] = result;
  if (result)
  {
    v12 = 0;
    memset(v96, 0, sizeof(v96));
    a11.f64[0] = (double)(int)a6 * 0.5;
    a10.f64[0] = (double)SHIDWORD(a6) * 0.5;
    *(_QWORD *)&v68.f64[0] = a6;
    v13 = (float)((float)(int)a6 * 0.0071023);
    v14.f64[0] = a11.f64[0];
    memset(v95, 0, sizeof(v95));
    v15.f64[0] = a10.f64[0];
    v62 = a10;
    v64 = a11;
    v14.f64[1] = a11.f64[0];
    v15.f64[1] = a10.f64[0];
    v58 = v15;
    v60 = v14;
    while (1)
    {
      v16 = *(float64x2_t *)(a3 + 144);
      *(_QWORD *)&v66.f64[1] = v12;
      v17 = 3 * v12;
      v85 = *(float64x2_t *)(a3 + 128);
      v86 = v16;
      v18 = (float64x2_t *)&v96[6 * v12];
      v87 = *(float64x2_t *)(a3 + 160);
      v88 = *(_QWORD *)(a3 + 176);
      -[BWAdaptiveCorrectionPreviewRegistration _homographyAtDepth:calibration:narrowerMetadata:widerMetadata:pixelBufferDimensions:excludeExtrinsics:](*(uint64_t *)&v68.f64[1], &v84, *(void **)&v70.f64[0], *(void **)&v70.f64[1], *(uint64_t *)&v68.f64[0], 0, &v89, 50.0, v54, v56, v58, v60, v62, v64, v66, v68, v70, *(_OWORD *)&v72, v73,
        v74,
        v75,
        *(_OWORD *)&v76,
        v77,
        v78,
        v79,
        *(_OWORD *)&v80,
        v81,
        v82,
        v83,
        *(_OWORD *)a3,
        *(_OWORD *)(a3 + 16),
        *(_OWORD *)(a3 + 32),
        *(_OWORD *)(a3 + 48),
        *(_OWORD *)(a3 + 64),
        *(_OWORD *)(a3 + 80),
        *(float64x2_t *)(a3 + 96),
        *(float64x2_t *)(a3 + 112),
        v85,
        v16,
        v87);
      v19 = v92;
      v18[2] = v91;
      v18[3] = v19;
      v20 = v94;
      v18[4] = v93;
      v18[5] = v20;
      v21 = v90;
      *v18 = v89;
      v18[1] = v21;
      v22 = (float64x2_t *)&v95[2 * v17];
      v23 = *(float64x2_t *)(a3 + 144);
      v85 = *(float64x2_t *)(a3 + 128);
      v86 = v23;
      v87 = *(float64x2_t *)(a3 + 160);
      v88 = *(_QWORD *)(a3 + 176);
      -[BWAdaptiveCorrectionPreviewRegistration _homographyAtDepth:calibration:narrowerMetadata:widerMetadata:pixelBufferDimensions:excludeExtrinsics:](*(uint64_t *)&v69.f64[1], &v84, *(void **)&v71.f64[0], *(void **)&v71.f64[1], *(uint64_t *)&v69.f64[0], 0, &v89, 1.0e10, v55, v57, v59, v61, v63, v65, v67, v69, v71, *(_OWORD *)&v72, v73,
        v74,
        v75,
        *(_OWORD *)&v76,
        v77,
        v78,
        v79,
        *(_OWORD *)&v80,
        v81,
        v82,
        v83,
        *(_OWORD *)a3,
        *(_OWORD *)(a3 + 16),
        *(_OWORD *)(a3 + 32),
        *(_OWORD *)(a3 + 48),
        *(_OWORD *)(a3 + 64),
        *(_OWORD *)(a3 + 80),
        *(float64x2_t *)(a3 + 96),
        *(float64x2_t *)(a3 + 112),
        v85,
        v23,
        v87);
      v24 = 0;
      v25 = *v18;
      v26 = v18[1];
      v28 = v18[2];
      v27 = v18[3];
      v30 = v18[4];
      v29 = v18[5];
      v31 = v92;
      v22[2] = v91;
      v22[3] = v31;
      v32 = v94;
      v22[4] = v93;
      v22[5] = v32;
      v33 = v90;
      *v22 = v89;
      v22[1] = v33;
      v34 = (int8x16_t)vaddq_f64(v30, vmlaq_f64(vmulq_f64(v60, v25), v58, v28));
      v35 = vaddq_f64(v29, vmlaq_f64(vmulq_f64(v64, v26), v62, v27));
      v36 = (int8x16_t)vaddq_f64(v22[4], vmlaq_f64(vmulq_f64(v60, *v22), v58, v22[2]));
      v37 = vaddq_f64(v22[5], vmlaq_f64(vmulq_f64(v64, v22[1]), v62, v22[3]));
      v38 = (float64x2_t *)(*(_QWORD *)&v66.f64[0] + 32 * v17);
      v39 = vaddq_f64(v38[4], vmlaq_f64(vmulq_f64(v60, *v38), v58, v38[2]));
      v40 = vaddq_f64(v38[5], vmlaq_f64(vmulq_f64(v64, v38[1]), v62, v38[3]));
      do
      {
        v82 = (__int128)v34;
        v83 = (__int128)v35;
        v41 = *((double *)&v82 + (v24 & 3)) / v35.f64[0];
        v80 = v34;
        v81 = (__int128)v35;
        *(double *)&v80.i64[v24 & 3] = v41;
        v34 = v80;
        *(_QWORD *)&v42.f64[0] = v81;
        v42.f64[1] = v35.f64[1];
        v78 = (__int128)v36;
        v79 = (__int128)v37;
        v43 = *((double *)&v78 + (v24 & 3)) / v37.f64[0];
        v76 = v36;
        v77 = (__int128)v37;
        *(double *)&v76.i64[v24 & 3] = v43;
        v36 = v76;
        *(_QWORD *)&v44.f64[0] = v77;
        v44.f64[1] = v37.f64[1];
        v74 = (__int128)v39;
        v75 = (__int128)v40;
        v45 = *((double *)&v74 + (v24 & 3)) / v40.f64[0];
        v72 = (int8x16_t)v39;
        v73 = (__int128)v40;
        *(double *)&v72.i64[v24 & 3] = v45;
        v39 = (float64x2_t)v72;
        *(_QWORD *)&v46.f64[0] = v73;
        ++v24;
        v46.f64[1] = v40.f64[1];
        v35 = v42;
        v37 = v44;
        v40 = v46;
      }
      while (v24 != 3);
      v47 = *(double *)vextq_s8(v34, v34, 8uLL).i64;
      v48 = *(double *)vextq_s8(v36, v36, 8uLL).i64;
      v49 = *(double *)vextq_s8(v72, v72, 8uLL).i64;
      v50 = v47 - v48;
      v51 = fmax(((v49 - v47) * (v47 - v48)+ (*(double *)v34.i64 - *(double *)v36.i64) * (*(double *)v72.i64 - *(double *)v34.i64))/ fabs(sqrt(v50 * v50 + (*(double *)v34.i64 - *(double *)v36.i64)* (*(double *)v34.i64 - *(double *)v36.i64))), 0.0);
      v52 = *(double *)v36.i64 - *(double *)v34.i64;
      v53 = fmax(((v49 - v48) * (v48 - v47)+ (*(double *)v36.i64 - *(double *)v34.i64) * (*(double *)v72.i64 - *(double *)v36.i64))/ fabs(sqrt((v48 - v47) * (v48 - v47) + v52 * v52)), 0.0);
      if (v51 < v53)
        v51 = v53;
      if (v51 >= v13
        || fabs(*(double *)v34.i64 * v48 - *(double *)v36.i64 * v47 + v49 * v52 + v50 * *(double *)v72.i64)
         / sqrt(v52 * v52 + v50 * v50) >= v13)
      {
        break;
      }
      v12 = *(_QWORD *)&v66.f64[1] + 1;
      if (*(_QWORD *)&v66.f64[1] == 2)
        return 0;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0xFFFFFFFFLL;
  }
  return result;
}

- (int)computeAlignmentFromWiderSampleBuffer:(opaqueCMSampleBuffer *)a3 narrowerSampleBuffer:(opaqueCMSampleBuffer *)a4 narrowerToWiderTransformsOut:(id *)a5
{
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  int v15;
  _BOOL4 v16;
  int v17;
  __CVBuffer *ImageBuffer;
  unsigned int Width;
  unsigned int Height;
  uint64_t v21;
  char v22;
  unint64_t v23;
  CMTime *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int v28;
  float64x2_t v30;
  __int128 v31;
  __int128 v32;
  float64x2_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[32];
  CMTime time1[12];
  _BYTE time2[32];
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  if (a3 && a4 && a5)
  {
    v9 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v10 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v11 = (void *)CMGetAttachment(a3, v9, 0);
    v12 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D05A30]);
    v14 = v13;
    if (self->_excludeEstimatedSagFromWideTeleAlignment)
      v15 = v13;
    else
      v15 = 0;
    memset(&v39[8], 0, 24);
    CMSampleBufferGetPresentationTimeStamp((CMTime *)&v39[8], a4);
    if (self->_excludeEstimatedSagFromWideTeleAlignment)
    {
      time1[0] = (CMTime)self->_lastNarrowerFramePTS;
      *(_OWORD *)time2 = *(_OWORD *)&v39[8];
      *(_QWORD *)&time2[16] = *(_QWORD *)&v39[24];
      v16 = CMTimeCompare(time1, (CMTime *)time2) != 0;
    }
    else
    {
      v16 = 0;
    }
    v51 = 0;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v42 = 0u;
    memset(time2, 0, sizeof(time2));
    *(_OWORD *)&self->_lastNarrowerFramePTS.value = *(_OWORD *)&v39[8];
    self->_lastNarrowerFramePTS.epoch = *(_QWORD *)&v39[24];
    v17 = -[BWAdaptiveCorrectionPreviewRegistration _computeOISCalibrationFromWiderMetadata:narrowerMetadata:updateEstimatedSagPositions:excludeEstimatedSagFromAlignment:calibrationOut:]((uint64_t)self, (uint64_t)v11, (uint64_t)v10, v16, v15, (uint64_t)time2);
    if (v17)
    {
      v28 = v17;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      memset(time1, 0, sizeof(time1));
      ImageBuffer = CMSampleBufferGetImageBuffer(a4);
      Width = CVPixelBufferGetWidth(ImageBuffer);
      Height = CVPixelBufferGetHeight(ImageBuffer);
      v21 = 0;
      if (self->_excludeExtrinsicsCorrectionFromWideTeleAlignment)
        v22 = v14;
      else
        v22 = 0;
      v23 = Width | ((unint64_t)Height << 32);
      do
      {
        v24 = &time1[v21];
        *(_QWORD *)&v32 = v51;
        -[BWAdaptiveCorrectionPreviewRegistration _homographyAtDepth:calibration:narrowerMetadata:widerMetadata:pixelBufferDimensions:excludeExtrinsics:]((uint64_t)self, &v31, v10, v11, v23, v22, &v33, 1.0e10, v30, *(float64x2_t *)time2, *(float64x2_t *)&time2[16], v42, v43, v44, v45, v46, v47, v48, v49,
          v50,
          v32,
          *(_OWORD *)&v33,
          v34,
          v35,
          v36,
          v37,
          v38,
          *(__int128 *)v39,
          *(__int128 *)&v39[16],
          *(__int128 *)&time1[0].value,
          *(__int128 *)&time1[0].epoch,
          *(__int128 *)&time1[1].timescale,
          *(__int128 *)&time1[2].value,
          *(__int128 *)&time1[2].epoch,
          *(__int128 *)&time1[3].timescale,
          *(float64x2_t *)&time1[4].value,
          *(float64x2_t *)&time1[4].epoch,
          *(float64x2_t *)&time1[5].timescale,
          *(float64x2_t *)&time1[6].value,
          *(float64x2_t *)&time1[6].epoch);
        v25 = v36;
        *(_OWORD *)&v24[1].timescale = v35;
        *(_OWORD *)&v24[2].value = v25;
        v26 = v38;
        *(_OWORD *)&v24[2].epoch = v37;
        *(_OWORD *)&v24[3].timescale = v26;
        v27 = v34;
        v21 += 4;
        *(float64x2_t *)&v24->value = v33;
        *(_OWORD *)&v24->epoch = v27;
      }
      while (v21 != 12);
      memcpy(a5, time1, 0x120uLL);
      return 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  return v28;
}

- (void)dealloc
{
  objc_super v3;

  -[BWAdaptiveCorrectionPreviewRegistration cleanupResources](self, "cleanupResources");

  v3.receiver = self;
  v3.super_class = (Class)BWAdaptiveCorrectionPreviewRegistration;
  -[BWAdaptiveCorrectionPreviewRegistration dealloc](&v3, sel_dealloc);
}

- (void)cleanupResources
{
  $9A3F6720D51884C1BD061C340F5007EE *keypointList;
  uint64_t v4;
  double **validKeypointsInSensorResolution;
  double **transposedKeypoints;
  char v7;
  char v8;
  double *v9;
  double *v10;
  uint64_t v11;
  double **keypointWeights;
  double *v13;
  double *keypointDepths;
  OpaqueVTPixelRotationSession *cropAndScaleSession;
  OpaqueVTPixelRotationSession *v16;

  if (!self->_resourcesCleaned)
  {

    self->_registrationPool = 0;
    self->_registrationPoolReadyAssertion = 0;

    self->_metalContext = 0;
    -[FigRegToolboxGPU releaseResources](self->_keypointDetector, "releaseResources");

    self->_keypointDetector = 0;
    keypointList = self->_keypointList;
    if (keypointList)
    {
      self->_keypointList = 0;
      free(keypointList);
    }
    v4 = 0;
    validKeypointsInSensorResolution = self->_validKeypointsInSensorResolution;
    transposedKeypoints = self->_transposedKeypoints;
    v7 = 1;
    do
    {
      v8 = v7;
      v9 = validKeypointsInSensorResolution[v4];
      if (v9)
      {
        validKeypointsInSensorResolution[v4] = 0;
        free(v9);
      }
      v10 = transposedKeypoints[v4];
      if (v10)
      {
        transposedKeypoints[v4] = 0;
        free(v10);
      }
      v7 = 0;
      v4 = 1;
    }
    while ((v8 & 1) != 0);
    v11 = 0;
    keypointWeights = self->_keypointWeights;
    do
    {
      v13 = keypointWeights[v11];
      if (v13)
      {
        keypointWeights[v11] = 0;
        free(v13);
      }
      ++v11;
    }
    while (v11 != 3);
    keypointDepths = self->_keypointDepths;
    if (keypointDepths)
    {
      self->_keypointDepths = 0;
      free(keypointDepths);
    }
    cropAndScaleSession = self->_cropAndScaleSession;
    if (cropAndScaleSession)
    {
      VTPixelRotationSessionInvalidate(cropAndScaleSession);
      v16 = self->_cropAndScaleSession;
      if (v16)
        CFRelease(v16);
      self->_cropAndScaleSession = 0;
    }
    self->_resourcesCleaned = 1;
  }
}

- (CGFloat)_estimatedSagPositionUsingOISShift:(double)a3 forPortType:(double)a4
{
  double *v8;
  double v9;
  CGPoint v13;

  if (!a1)
    return 0.0;
  v8 = (double *)MEMORY[0x1E0C9D538];
  v13 = (CGPoint)*MEMORY[0x1E0C9D538];
  if (objc_msgSend(*(id *)(a1 + 632), "objectForKeyedSubscript:", a2))
    CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(*(id *)(a1 + 632), "objectForKeyedSubscript:", a2), &v13);
  v9 = v8[1];
  if (a3 == *v8 && a4 == v9)
    return v13.x;
  if (v13.x != *v8 || v13.y != v9)
    return v13.x * (float)(1.0 - *(float *)(a1 + 628)) + a3 * *(float *)(a1 + 628);
  return a3;
}

@end
