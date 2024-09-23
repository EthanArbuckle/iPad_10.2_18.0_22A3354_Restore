@implementation ARCoachingMetalSplineData

- (id)init:(id)a3
{
  id v4;
  ARCoachingMetalSplineData *v5;
  ARCoachingMetalSplineData *v6;
  int v7;
  uint64_t v8;
  MTLBuffer *tessellationFactorsBuffer;
  void *v10;
  void *v11;
  uint64_t v12;
  MTLBuffer *controlPointsBuffer;
  uint64_t v14;
  MTLBuffer *controlPointIndicesBuffer;
  uint64_t v16;
  MTLBuffer *patchUserDataBuffer;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ARCoachingMetalSplineData;
  v5 = -[ARCoachingMetalSplineData init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ARCoachingMetalSplineData makeShapes](v5, "makeShapes");
    v7 = -[ARCoachingBlendableSplineGroup patchDataLength](v6->_shapes, "patchDataLength");
    v6->_patchCount = v7;
    v8 = objc_msgSend(v4, "newBufferWithLength:options:", 12 * v7, 32);
    tessellationFactorsBuffer = v6->_tessellationFactorsBuffer;
    v6->_tessellationFactorsBuffer = (MTLBuffer *)v8;

    -[MTLBuffer setLabel:](v6->_tessellationFactorsBuffer, "setLabel:", CFSTR("Tessellation Factors"));
    -[ARCoachingBlendableSplineGroup controlPoints](v6->_shapes, "controlPoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v4, "newBufferWithBytes:length:options:", objc_msgSend(v11, "controlPoints"), 32 * objc_msgSend(v11, "numControlPoints"), 0);
    controlPointsBuffer = v6->_controlPointsBuffer;
    v6->_controlPointsBuffer = (MTLBuffer *)v12;

    -[MTLBuffer setLabel:](v6->_controlPointsBuffer, "setLabel:", CFSTR("Control Points"));
    v14 = objc_msgSend(v4, "newBufferWithBytes:length:options:", -[ARCoachingBlendableSplineGroup indices](v6->_shapes, "indices"), 2 * (int)-[ARCoachingBlendableSplineGroup numIndices](v6->_shapes, "numIndices"), 0);
    controlPointIndicesBuffer = v6->_controlPointIndicesBuffer;
    v6->_controlPointIndicesBuffer = (MTLBuffer *)v14;

    -[MTLBuffer setLabel:](v6->_controlPointIndicesBuffer, "setLabel:", CFSTR("Control Point Indices"));
    v16 = objc_msgSend(v4, "newBufferWithBytes:length:options:", -[ARCoachingBlendableSplineGroup patchData](v6->_shapes, "patchData"), 8 * (int)-[ARCoachingBlendableSplineGroup patchDataLength](v6->_shapes, "patchDataLength"), 0);
    patchUserDataBuffer = v6->_patchUserDataBuffer;
    v6->_patchUserDataBuffer = (MTLBuffer *)v16;

    -[MTLBuffer setLabel:](v6->_patchUserDataBuffer, "setLabel:", CFSTR("Per Patch Tessellator variables"));
    -[ARCoachingMetalSplineData resetInstanceTransforms:](v6, "resetInstanceTransforms:", v4);

  }
  return v6;
}

- (void)makeShapes
{
  ARCoachingSplineGroup *v3;
  ARCoachingCorner *v4;
  double v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double v10;
  ARCoachingCorner *v11;
  ARCoachingCorner *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  ARCoachingCorner *v19;
  ARCoachingCorner *v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  ARCoachingCorner *v27;
  ARCoachingCorner *v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  ARCoachingCorner *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  ARCoachingSplineGroup *v48;
  ARCoachingCorner *v49;
  double v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  uint64_t v55;
  float32x4_t v56;
  double v57;
  double v58;
  ARCoachingCorner *v59;
  ARCoachingCorner *v60;
  double v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  uint64_t v66;
  double v67;
  double v68;
  ARCoachingCorner *v69;
  ARCoachingCorner *v70;
  double v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  uint64_t v76;
  double v77;
  double v78;
  ARCoachingCorner *v79;
  ARCoachingCorner *v80;
  double v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  uint64_t v86;
  double v87;
  double v88;
  ARCoachingCorner *v89;
  void *v90;
  ARCoachingSplineGroup *v91;
  ARCoachingSplineGroup *v92;
  ARCoachingCorner *v93;
  double v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  uint64_t v99;
  float32x4_t v100;
  double v101;
  double v102;
  ARCoachingCorner *v103;
  ARCoachingCorner *v104;
  double v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  uint64_t v110;
  double v111;
  double v112;
  ARCoachingCorner *v113;
  ARCoachingCorner *v114;
  double v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  uint64_t v120;
  double v121;
  double v122;
  ARCoachingCorner *v123;
  ARCoachingCorner *v124;
  double v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  uint64_t v130;
  double v131;
  double v132;
  ARCoachingCorner *v133;
  void *v134;
  ARCoachingSplineGroup *v135;
  ARCoachingBlendableSplineGroup *v136;
  void *v137;
  ARCoachingBlendableSplineGroup *v138;
  ARCoachingBlendableSplineGroup *shapes;
  ARCoachingControlPointContainer *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  ARCoachingControlPointContainer *v146;
  ARCoachingControlPointContainer *recordedControlPoints;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _QWORD v176[3];
  _QWORD v177[4];
  _QWORD v178[4];
  _QWORD v179[6];

  v179[4] = *MEMORY[0x1E0C80C00];
  v3 = [ARCoachingSplineGroup alloc];
  v4 = [ARCoachingCorner alloc];
  LODWORD(v5) = 0;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", v5);
  v156 = v6;
  v160 = v7;
  v148 = v8;
  v152 = v9;
  LODWORD(v8) = 1.0;
  LODWORD(v6) = 0;
  LODWORD(v9) = 1064178811;
  LODWORD(v7) = 1058642330;
  LODWORD(v10) = 1065017672;
  v11 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v4, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", *(double *)&v8, *(double *)&v9, *(double *)&v6, *(double *)&v7, v10, v148, v152, v156, v160);
  v179[0] = v11;
  v12 = [ARCoachingCorner alloc];
  LODWORD(v13) = 1119092736;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", v13, 0.0);
  v15 = v14;
  v149 = v16;
  v153 = v17;
  LODWORD(v16) = 1.0;
  LODWORD(v14) = 0;
  v157 = v15;
  v161 = v18;
  LODWORD(v17) = 1064178811;
  LODWORD(v18) = 1058642330;
  LODWORD(v15) = 1065017672;
  v19 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v12, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", *(double *)&v16, *(double *)&v17, *(double *)&v14, *(double *)&v18, *(double *)&v15, v149, v153, v157, v161);
  v179[1] = v19;
  v20 = [ARCoachingCorner alloc];
  LODWORD(v21) = 1127481344;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", v21, 0.0);
  v23 = v22;
  v150 = v24;
  v154 = v25;
  LODWORD(v24) = 1.0;
  LODWORD(v22) = 0;
  v158 = v23;
  v162 = v26;
  LODWORD(v25) = 1064178811;
  LODWORD(v26) = 1058642330;
  LODWORD(v23) = 1065017672;
  v27 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v20, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", *(double *)&v24, *(double *)&v25, *(double *)&v22, *(double *)&v26, *(double *)&v23, v150, v154, v158, v162);
  v179[2] = v27;
  v28 = [ARCoachingCorner alloc];
  LODWORD(v29) = 1132920832;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", v29, 0.0);
  v31 = v30;
  v151 = v32;
  v155 = v33;
  LODWORD(v32) = 1.0;
  LODWORD(v30) = 0;
  v159 = v31;
  v163 = v34;
  LODWORD(v33) = 1064178811;
  LODWORD(v34) = 1058642330;
  LODWORD(v31) = 1065017672;
  v35 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v28, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", *(double *)&v32, *(double *)&v33, *(double *)&v30, *(double *)&v34, *(double *)&v31, v151, v155, v159, v163);
  v179[3] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v179, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[ARCoachingSplineGroup initWithSplines:](v3, "initWithSplines:", v36);

  v38 = (void *)v37;
  __asm { FMOV            V0.4S, #1.0 }
  +[ARCoachingTransformations scale:](ARCoachingTransformations, "scale:", *(double *)&_Q0);
  v164 = v45;
  v165 = v44;
  v166 = v47;
  v167 = v46;
  v48 = [ARCoachingSplineGroup alloc];
  v49 = [ARCoachingCorner alloc];
  LODWORD(v50) = 0;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", v50, 0.0);
  v55 = 0;
  v168 = v165;
  v169 = v164;
  v170 = v167;
  v171 = v166;
  do
  {
    v56 = *(float32x4_t *)((char *)&v168 + v55);
    *(__int128 *)((char *)&v172 + v55) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v51, v56.f32[0]), v52, *(float32x2_t *)v56.f32, 1), v53, v56, 2), v54, v56, 3);
    v55 += 16;
  }
  while (v55 != 64);
  HIDWORD(v57) = DWORD1(v174);
  HIDWORD(v58) = DWORD1(v175);
  LODWORD(v57) = 0;
  LODWORD(v58) = 1053609165;
  v56.i32[0] = 1065017672;
  v59 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v49, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v172), 1.0)), COERCE_DOUBLE(__PAIR64__(DWORD1(v173), 1.0)), v57, v58, *(double *)v56.i64, v172, v173, v174, v175);
  v178[0] = v59;
  v60 = [ARCoachingCorner alloc];
  LODWORD(v61) = 1119092736;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", v61, 0.0);
  v66 = 0;
  v168 = v165;
  v169 = v164;
  v170 = v167;
  v171 = v166;
  do
  {
    *(__int128 *)((char *)&v172 + v66) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v62, COERCE_FLOAT(*(__int128 *)((char *)&v168 + v66))), v63, *(float32x2_t *)((char *)&v168 + v66), 1), v64, *(float32x4_t *)((char *)&v168 + v66), 2), v65, *(float32x4_t *)((char *)&v168 + v66), 3);
    v66 += 16;
  }
  while (v66 != 64);
  HIDWORD(v67) = DWORD1(v172);
  HIDWORD(v68) = DWORD1(v173);
  v64.i32[0] = 0;
  LODWORD(v67) = 1053609165;
  LODWORD(v68) = 1065017672;
  v69 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v60, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v174), 1.0)), COERCE_DOUBLE(__PAIR64__(DWORD1(v175), 1.0)), *(double *)v64.i64, v67, v68, v172, v173, v174, v175);
  v178[1] = v69;
  v70 = [ARCoachingCorner alloc];
  LODWORD(v71) = 1127481344;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", v71, 0.0);
  v76 = 0;
  v168 = v165;
  v169 = v164;
  v170 = v167;
  v171 = v166;
  do
  {
    *(__int128 *)((char *)&v172 + v76) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v72, COERCE_FLOAT(*(__int128 *)((char *)&v168 + v76))), v73, *(float32x2_t *)((char *)&v168 + v76), 1), v74, *(float32x4_t *)((char *)&v168 + v76), 2), v75, *(float32x4_t *)((char *)&v168 + v76), 3);
    v76 += 16;
  }
  while (v76 != 64);
  HIDWORD(v77) = DWORD1(v172);
  HIDWORD(v78) = DWORD1(v173);
  v74.i32[0] = 0;
  LODWORD(v77) = 1053609165;
  LODWORD(v78) = 1065017672;
  v79 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v70, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v174), 1.0)), COERCE_DOUBLE(__PAIR64__(DWORD1(v175), 1.0)), *(double *)v74.i64, v77, v78, v172, v173, v174, v175);
  v178[2] = v79;
  v80 = [ARCoachingCorner alloc];
  LODWORD(v81) = 1132920832;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", v81, 0.0);
  v86 = 0;
  v168 = v165;
  v169 = v164;
  v170 = v167;
  v171 = v166;
  do
  {
    *(__int128 *)((char *)&v172 + v86) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v82, COERCE_FLOAT(*(__int128 *)((char *)&v168 + v86))), v83, *(float32x2_t *)((char *)&v168 + v86), 1), v84, *(float32x4_t *)((char *)&v168 + v86), 2), v85, *(float32x4_t *)((char *)&v168 + v86), 3);
    v86 += 16;
  }
  while (v86 != 64);
  HIDWORD(v87) = DWORD1(v172);
  HIDWORD(v88) = DWORD1(v173);
  v84.i32[0] = 0;
  LODWORD(v87) = 1053609165;
  LODWORD(v88) = 1065017672;
  v89 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v80, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v174), 1.0)), COERCE_DOUBLE(__PAIR64__(DWORD1(v175), 1.0)), *(double *)v84.i64, v87, v88, v172, v173, v174, v175);
  v178[3] = v89;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 4);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = -[ARCoachingSplineGroup initWithSplines:](v48, "initWithSplines:", v90);

  v92 = [ARCoachingSplineGroup alloc];
  v93 = [ARCoachingCorner alloc];
  LODWORD(v94) = 0;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", v94, 0.0);
  v99 = 0;
  v168 = v165;
  v169 = v164;
  v170 = v167;
  v171 = v166;
  do
  {
    v100 = *(float32x4_t *)((char *)&v168 + v99);
    *(__int128 *)((char *)&v172 + v99) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v95, v100.f32[0]), v96, *(float32x2_t *)v100.f32, 1), v97, v100, 2), v98, v100, 3);
    v99 += 16;
  }
  while (v99 != 64);
  HIDWORD(v101) = DWORD1(v173);
  HIDWORD(v102) = DWORD1(v175);
  LODWORD(v102) = 0;
  LODWORD(v101) = 1050253722;
  v100.i32[0] = 1065336439;
  v103 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v93, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v172), 1.0)), v101, COERCE_DOUBLE(__PAIR64__(DWORD1(v174), -1.0)), v102, *(double *)v100.i64, v172, v173, v174, v175);
  v177[0] = v103;
  v104 = [ARCoachingCorner alloc];
  LODWORD(v105) = 1119092736;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", v105, 0.0);
  v110 = 0;
  v168 = v165;
  v169 = v164;
  v170 = v167;
  v171 = v166;
  do
  {
    *(__int128 *)((char *)&v172 + v110) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v106, COERCE_FLOAT(*(__int128 *)((char *)&v168 + v110))), v107, *(float32x2_t *)((char *)&v168 + v110), 1), v108, *(float32x4_t *)((char *)&v168 + v110), 2), v109, *(float32x4_t *)((char *)&v168 + v110), 3);
    v110 += 16;
  }
  while (v110 != 64);
  HIDWORD(v111) = DWORD1(v172);
  HIDWORD(v112) = DWORD1(v173);
  v109.i32[0] = 0;
  LODWORD(v111) = 1050253722;
  LODWORD(v112) = 1065336439;
  v113 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v104, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v174), 1.0)), v111, COERCE_DOUBLE(__PAIR64__(DWORD1(v175), -1.0)), *(double *)v109.i64, v112, v172, v173, v174, v175);
  v177[1] = v113;
  v114 = [ARCoachingCorner alloc];
  LODWORD(v115) = 1127481344;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", v115, 0.0);
  v120 = 0;
  v168 = v165;
  v169 = v164;
  v170 = v167;
  v171 = v166;
  do
  {
    *(__int128 *)((char *)&v172 + v120) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v116, COERCE_FLOAT(*(__int128 *)((char *)&v168 + v120))), v117, *(float32x2_t *)((char *)&v168 + v120), 1), v118, *(float32x4_t *)((char *)&v168 + v120), 2), v119, *(float32x4_t *)((char *)&v168 + v120), 3);
    v120 += 16;
  }
  while (v120 != 64);
  HIDWORD(v121) = DWORD1(v172);
  HIDWORD(v122) = DWORD1(v173);
  v119.i32[0] = 0;
  LODWORD(v121) = 1050253722;
  LODWORD(v122) = 1065336439;
  v123 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v114, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v174), 1.0)), v121, COERCE_DOUBLE(__PAIR64__(DWORD1(v175), -1.0)), *(double *)v119.i64, v122, v172, v173, v174, v175);
  v177[2] = v123;
  v124 = [ARCoachingCorner alloc];
  LODWORD(v125) = 1132920832;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", v125, 0.0);
  v130 = 0;
  v168 = v165;
  v169 = v164;
  v170 = v167;
  v171 = v166;
  do
  {
    *(__int128 *)((char *)&v172 + v130) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v126, COERCE_FLOAT(*(__int128 *)((char *)&v168 + v130))), v127, *(float32x2_t *)((char *)&v168 + v130), 1), v128, *(float32x4_t *)((char *)&v168 + v130), 2), v129, *(float32x4_t *)((char *)&v168 + v130), 3);
    v130 += 16;
  }
  while (v130 != 64);
  HIDWORD(v131) = DWORD1(v172);
  HIDWORD(v132) = DWORD1(v173);
  v129.i32[0] = 0;
  LODWORD(v131) = 1050253722;
  LODWORD(v132) = 1065336439;
  v133 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v124, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v174), 1.0)), v131, COERCE_DOUBLE(__PAIR64__(DWORD1(v175), -1.0)), *(double *)v129.i64, v132, v172, v173, v174, v175);
  v177[3] = v133;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 4);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = -[ARCoachingSplineGroup initWithSplines:](v92, "initWithSplines:", v134);

  v136 = [ARCoachingBlendableSplineGroup alloc];
  v176[0] = v38;
  v176[1] = v91;
  v176[2] = v135;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 3);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = -[ARCoachingBlendableSplineGroup initWithSplineGroups:](v136, "initWithSplineGroups:", v137);
  shapes = self->_shapes;
  self->_shapes = v138;

  v140 = [ARCoachingControlPointContainer alloc];
  -[ARCoachingBlendableSplineGroup controlPoints](self->_shapes, "controlPoints");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectAtIndexedSubscript:", 0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v142, "controlPoints");
  -[ARCoachingBlendableSplineGroup controlPoints](self->_shapes, "controlPoints");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "objectAtIndexedSubscript:", 0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = -[ARCoachingControlPointContainer initWithControlPoints:numControlPoints:](v140, "initWithControlPoints:numControlPoints:", v143, objc_msgSend(v145, "numControlPoints"));
  recordedControlPoints = self->_recordedControlPoints;
  self->_recordedControlPoints = v146;

}

- (void)recordState
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  _OWORD *v8;
  char *v9;
  __int128 v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  __int128 v18;
  char *v19;
  char *v20;
  __int128 v21;
  char *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *__p;
  char *v33;
  char *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = -[MTLBuffer contents](self->_controlPointsBuffer, "contents");
  v4 = 0;
  __p = 0;
  v33 = 0;
  v34 = 0;
  while (1)
  {
    -[ARCoachingBlendableSplineGroup controlPoints](self->_shapes, "controlPoints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4 < objc_msgSend(v6, "numControlPoints");

    if (!v7)
      break;
    v8 = (_OWORD *)(v3 + 32 * v4);
    v9 = v33;
    if (v33 >= v34)
    {
      v12 = (char *)__p;
      v13 = (v33 - (_BYTE *)__p) >> 5;
      v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) >> 59)
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      v15 = v34 - (_BYTE *)__p;
      if ((v34 - (_BYTE *)__p) >> 4 > v14)
        v14 = v15 >> 4;
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0)
        v16 = 0x7FFFFFFFFFFFFFFLL;
      else
        v16 = v14;
      if (v16)
      {
        v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>((uint64_t)&v34, v16);
        v12 = (char *)__p;
        v9 = v33;
      }
      else
      {
        v17 = 0;
      }
      v18 = v8[1];
      v19 = &v17[32 * v13];
      *(_OWORD *)v19 = *v8;
      *((_OWORD *)v19 + 1) = v18;
      if (v9 == v12)
      {
        v22 = &v17[32 * v13];
      }
      else
      {
        v20 = &v17[32 * v13];
        do
        {
          v21 = *((_OWORD *)v9 - 1);
          v22 = v20 - 32;
          *((_OWORD *)v20 - 2) = *((_OWORD *)v9 - 2);
          *((_OWORD *)v20 - 1) = v21;
          v9 -= 32;
          v20 -= 32;
        }
        while (v9 != v12);
      }
      v11 = v19 + 32;
      __p = v22;
      v33 = v19 + 32;
      v34 = &v17[32 * v16];
      if (v12)
        operator delete(v12);
    }
    else
    {
      v10 = v8[1];
      *(_OWORD *)v33 = *v8;
      *((_OWORD *)v9 + 1) = v10;
      v11 = v9 + 32;
    }
    v33 = v11;
    ++v4;
  }
  -[ARCoachingControlPointContainer overwriteWithControlPoints:numControlPoints:](self->_recordedControlPoints, "overwriteWithControlPoints:numControlPoints:");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = self->_instanceTransforms;
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v27, "localScale", (_QWORD)v28);
        objc_msgSend(v27, "setRecordedScale:");
        objc_msgSend(v27, "localTranslation");
        objc_msgSend(v27, "setRecordedTranslation:");
      }
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v24);
  }

  if (__p)
  {
    v33 = (char *)__p;
    operator delete(__p);
  }
}

- (void)resetInstanceTransforms:(id)a3
{
  id v4;
  ARCoachingInstanceTransform *v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id v15;
  ARCoachingInstanceTransform *v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  ARCoachingInstanceTransform *v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  ARCoachingInstanceTransform *v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  ARCoachingInstanceTransform *v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  ARCoachingInstanceTransform *v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  NSArray *v71;
  NSArray *instanceTransforms;
  uint64_t v73;
  __int128 *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  id *p_instanceBuffer;
  MTLBuffer *instanceBuffer;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  double v114[43];
  _QWORD v115[7];

  v115[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [ARCoachingInstanceTransform alloc];
  +[ARCoachingTransformations translate:](ARCoachingTransformations, "translate:", -0.0078125);
  v98 = v7;
  v104 = v6;
  v86 = v9;
  v92 = v8;
  v6.i32[0] = 1119092736;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", *(double *)v6.i64);
  v10 = 0;
  v107 = v11;
  v108 = v12;
  v109 = v13;
  v110 = v14;
  do
  {
    *(__int128 *)((char *)&v111 + v10) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v104, COERCE_FLOAT(*(__int128 *)((char *)&v107 + v10))), v98, *(float32x2_t *)((char *)&v107 + v10), 1), v92, *(float32x4_t *)((char *)&v107 + v10), 2), v86, *(float32x4_t *)((char *)&v107 + v10), 3);
    v10 += 16;
  }
  while (v10 != 64);
  v15 = -[ARCoachingInstanceTransform init:](v5, "init:", *(double *)&v111, *(double *)&v112, *(double *)&v113, v114[0]);
  v115[0] = v15;
  v16 = [ARCoachingInstanceTransform alloc];
  +[ARCoachingTransformations translate:](ARCoachingTransformations, "translate:");
  v93 = v18;
  v99 = v17;
  v83 = v20;
  v87 = v19;
  v17.i32[0] = 1119092736;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", *(double *)v17.i64, COERCE_DOUBLE(1065353216));
  v21 = 0;
  v107 = v22;
  v108 = v23;
  v109 = v24;
  v110 = v25;
  do
  {
    *(__int128 *)((char *)&v111 + v21) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v99, COERCE_FLOAT(*(__int128 *)((char *)&v107 + v21))), v93, *(float32x2_t *)((char *)&v107 + v21), 1), v87, *(float32x4_t *)((char *)&v107 + v21), 2), v83, *(float32x4_t *)((char *)&v107 + v21), 3);
    v21 += 16;
  }
  while (v21 != 64);
  v26 = -[ARCoachingInstanceTransform init:](v16, "init:", *(double *)&v111, *(double *)&v112, *(double *)&v113, v114[0]);
  v115[1] = v26;
  v27 = [ARCoachingInstanceTransform alloc];
  +[ARCoachingTransformations translate:](ARCoachingTransformations, "translate:", 0.0);
  v94 = v29;
  v100 = v28;
  v84 = v31;
  v88 = v30;
  v28.i32[0] = 0;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", *(double *)v28.i64, COERCE_DOUBLE(1065353216));
  v32 = 0;
  v107 = v33;
  v108 = v34;
  v109 = v35;
  v110 = v36;
  do
  {
    *(__int128 *)((char *)&v111 + v32) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v100, COERCE_FLOAT(*(__int128 *)((char *)&v107 + v32))), v94, *(float32x2_t *)((char *)&v107 + v32), 1), v88, *(float32x4_t *)((char *)&v107 + v32), 2), v84, *(float32x4_t *)((char *)&v107 + v32), 3);
    v32 += 16;
  }
  while (v32 != 64);
  v37 = -[ARCoachingInstanceTransform init:](v27, "init:", *(double *)&v111, *(double *)&v112, *(double *)&v113, v114[0]);
  v115[2] = v37;
  v38 = [ARCoachingInstanceTransform alloc];
  +[ARCoachingTransformations translate:](ARCoachingTransformations, "translate:", 0.0);
  v95 = v40;
  v101 = v39;
  v85 = v42;
  v89 = v41;
  v39.i32[0] = 0;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", *(double *)v39.i64, COERCE_DOUBLE(1065353216));
  v43 = 0;
  v107 = v44;
  v108 = v45;
  v109 = v46;
  v110 = v47;
  do
  {
    *(__int128 *)((char *)&v111 + v43) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v101, COERCE_FLOAT(*(__int128 *)((char *)&v107 + v43))), v95, *(float32x2_t *)((char *)&v107 + v43), 1), v89, *(float32x4_t *)((char *)&v107 + v43), 2), v85, *(float32x4_t *)((char *)&v107 + v43), 3);
    v43 += 16;
  }
  while (v43 != 64);
  v48 = -[ARCoachingInstanceTransform init:](v38, "init:", *(double *)&v111, *(double *)&v112, *(double *)&v113, v114[0]);
  v115[3] = v48;
  v49 = [ARCoachingInstanceTransform alloc];
  +[ARCoachingTransformations translate:](ARCoachingTransformations, "translate:", COERCE_DOUBLE(1065353216));
  v105 = v50;
  v96 = v52;
  v102 = v51;
  v90 = v53;
  v50.i32[0] = 1119092736;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", *(double *)v50.i64, 0.0078125);
  v54 = 0;
  v107 = v55;
  v108 = v56;
  v109 = v57;
  v110 = v58;
  do
  {
    *(__int128 *)((char *)&v111 + v54) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v105, COERCE_FLOAT(*(__int128 *)((char *)&v107 + v54))), v102, *(float32x2_t *)((char *)&v107 + v54), 1), v96, *(float32x4_t *)((char *)&v107 + v54), 2), v90, *(float32x4_t *)((char *)&v107 + v54), 3);
    v54 += 16;
  }
  while (v54 != 64);
  v59 = -[ARCoachingInstanceTransform init:](v49, "init:", *(double *)&v111, *(double *)&v112, *(double *)&v113, v114[0]);
  v115[4] = v59;
  v60 = [ARCoachingInstanceTransform alloc];
  +[ARCoachingTransformations translate:](ARCoachingTransformations, "translate:", COERCE_DOUBLE(3212836864));
  v106 = v61;
  v97 = v63;
  v103 = v62;
  v91 = v64;
  v61.i32[0] = 1119092736;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", *(double *)v61.i64, 0.0078125);
  v65 = 0;
  v107 = v66;
  v108 = v67;
  v109 = v68;
  v110 = v69;
  do
  {
    *(__int128 *)((char *)&v111 + v65) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v106, COERCE_FLOAT(*(__int128 *)((char *)&v107 + v65))), v103, *(float32x2_t *)((char *)&v107 + v65), 1), v97, *(float32x4_t *)((char *)&v107 + v65), 2), v91, *(float32x4_t *)((char *)&v107 + v65), 3);
    v65 += 16;
  }
  while (v65 != 64);
  v70 = -[ARCoachingInstanceTransform init:](v60, "init:", *(double *)&v111, *(double *)&v112, *(double *)&v113, v114[0]);
  v115[5] = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 6);
  v71 = (NSArray *)objc_claimAutoreleasedReturnValue();
  instanceTransforms = self->_instanceTransforms;
  self->_instanceTransforms = v71;

  v73 = 0;
  v74 = &v113;
  do
  {
    -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setLocalScale:", 0.0);
    objc_msgSend(v75, "transform");
    *(v74 - 2) = v76;
    *(v74 - 1) = v77;
    *v74 = v78;
    v74[1] = v79;

    ++v73;
    v74 += 4;
  }
  while (v73 != 6);
  v80 = objc_msgSend(v4, "newBufferWithBytes:length:options:", &v111, 384, 0);
  instanceBuffer = self->_instanceBuffer;
  p_instanceBuffer = (id *)&self->_instanceBuffer;
  *p_instanceBuffer = (id)v80;

  objc_msgSend(*p_instanceBuffer, "setLabel:", CFSTR("Per Instance Post Tessellation variables"));
}

- (id)shapeBlendWithStart:(id *)a3 startCount:(int)a4 end:(id *)a5 endCount:(int)a6 t:(float)a7
{
  float32x4_t *v9;
  uint64_t v10;
  uint64_t v11;
  float32x4_t *v12;
  float32x4_t *v13;
  float32x4_t v14;
  float v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  float32x4_t *v20;
  float32x4_t *v21;
  float32x4_t *v22;
  float32x4_t v23;
  ARCoachingControlPointContainer *v24;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t *__p;
  float32x4_t *v30;
  float32x4_t *v31;

  if (a4 != a6)
    -[ARCoachingMetalSplineData shapeBlendWithStart:startCount:end:endCount:t:].cold.1();
  __p = 0;
  v30 = 0;
  v31 = 0;
  if (a4 >= 1)
  {
    v9 = 0;
    v10 = 0;
    v27 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a7, 0);
    v11 = a4;
    do
    {
      v12 = (float32x4_t *)&a3[8 * v10];
      v13 = (float32x4_t *)&a5[8 * v10];
      v14 = vmlaq_f32(*v12, vsubq_f32(*v13, *v12), v27);
      v15 = v12[1].f32[0] + (float)(a7 * (float)(v13[1].f32[0] - v12[1].f32[0]));
      if (v9 >= v31)
      {
        v26 = v14;
        v16 = ((char *)v9 - (char *)__p) >> 5;
        if ((unint64_t)(v16 + 1) >> 59)
          _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
        v17 = v31 - __p;
        if (v17 <= v16 + 1)
          v17 = v16 + 1;
        if ((unint64_t)((char *)v31 - (char *)__p) >= 0x7FFFFFFFFFFFFFE0)
          v18 = 0x7FFFFFFFFFFFFFFLL;
        else
          v18 = v17;
        if (v18)
          v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>((uint64_t)&v31, v18);
        else
          v19 = 0;
        v20 = (float32x4_t *)&v19[32 * v16];
        *v20 = v26;
        v20[1].f32[0] = v15;
        v21 = v30;
        v22 = v20;
        if (v30 != __p)
        {
          do
          {
            v23 = v21[-1];
            v22[-2] = v21[-2];
            v22[-1] = v23;
            v22 -= 2;
            v21 -= 2;
          }
          while (v21 != __p);
          v21 = __p;
        }
        v9 = v20 + 2;
        __p = v22;
        v31 = (float32x4_t *)&v19[32 * v18];
        if (v21)
          operator delete(v21);
      }
      else
      {
        *v9 = v14;
        v9[1].f32[0] = v15;
        v9 += 2;
      }
      v30 = v9;
      ++v10;
    }
    while (v10 != v11);
  }
  v24 = -[ARCoachingControlPointContainer initWithControlPoints:numControlPoints:]([ARCoachingControlPointContainer alloc], "initWithControlPoints:numControlPoints:");
  if (__p)
    operator delete(__p);
  return v24;
}

- (void)computeShapeBlendWithEnd:(id *)a3 endCount:(int)a4 t:(float)a5
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  $3BA783FF50B239963188BE194EBFFEBA *v10;
  $3BA783FF50B239963188BE194EBFFEBA *v11;
  float32x4_t v12;
  int32x2_t v13;

  v13 = *(int32x2_t *)&a5;
  if (-[ARCoachingControlPointContainer numControlPoints](self->_recordedControlPoints, "numControlPoints") != a4)
    -[ARCoachingMetalSplineData computeShapeBlendWithEnd:endCount:t:].cold.1();
  v7 = -[MTLBuffer contents](self->_controlPointsBuffer, "contents");
  if (-[ARCoachingControlPointContainer numControlPoints](self->_recordedControlPoints, "numControlPoints"))
  {
    v8 = 0;
    v9 = 0;
    v12 = (float32x4_t)vdupq_lane_s32(v13, 0);
    do
    {
      v10 = -[ARCoachingControlPointContainer controlPoints](self->_recordedControlPoints, "controlPoints", *(_OWORD *)&v12);
      *(float32x4_t *)(v7 + v8 * 4) = vmlaq_f32(*(float32x4_t *)&v10[v8].var0, vsubq_f32(*(float32x4_t *)&a3[v8].var0, *(float32x4_t *)&v10[v8].var0), v12);
      v11 = -[ARCoachingControlPointContainer controlPoints](self->_recordedControlPoints, "controlPoints");
      *(float *)(v7 + v8 * 4 + 16) = v11[v8 + 4].var0
                                   + (float)(*(float *)v13.i32 * (float)(a3[v8 + 4].var0 - v11[v8 + 4].var0));
      ++v9;
      v8 += 8;
    }
    while (v9 < -[ARCoachingControlPointContainer numControlPoints](self->_recordedControlPoints, "numControlPoints"));
  }
}

- (void)computeShapeBlendWithEnd:(id *)a3 endCount:(int)a4
{
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  $3BA783FF50B239963188BE194EBFFEBA *v9;
  float var0;

  v6 = -[MTLBuffer contents](self->_controlPointsBuffer, "contents");
  if (a4 >= 1)
  {
    v7 = a4;
    v8 = (_DWORD *)(v6 + 16);
    v9 = a3 + 4;
    do
    {
      *((_OWORD *)v8 - 1) = *(_OWORD *)&v9[-4].var0;
      var0 = v9->var0;
      v9 += 8;
      *(float *)v8 = var0;
      v8 += 8;
      --v7;
    }
    while (v7);
  }
}

- (void)computeShapeBlendWithStart:(id *)a3 startCount:(int)a4 end:(id *)a5 endCount:(int)a6 t:(float)a7
{
  uint64_t v10;
  float32x4_t v11;
  float *v12;
  $3BA783FF50B239963188BE194EBFFEBA *v13;
  $3BA783FF50B239963188BE194EBFFEBA *v14;
  uint64_t v15;
  float var0;
  float v17;
  float v18;
  int32x2_t v19;

  if (a4 != a6)
    -[ARCoachingMetalSplineData computeShapeBlendWithStart:startCount:end:endCount:t:].cold.1();
  v19 = *(int32x2_t *)&a7;
  v10 = -[MTLBuffer contents](self->_controlPointsBuffer, "contents");
  if (a4 >= 1)
  {
    v11 = (float32x4_t)vdupq_lane_s32(v19, 0);
    v12 = (float *)(v10 + 16);
    v13 = a5 + 4;
    v14 = a3 + 4;
    v15 = a4;
    do
    {
      *((float32x4_t *)v12 - 1) = vmlaq_f32(*(float32x4_t *)&v14[-4].var0, vsubq_f32(*(float32x4_t *)&v13[-4].var0, *(float32x4_t *)&v14[-4].var0), v11);
      var0 = v14->var0;
      v14 += 8;
      v17 = var0;
      v18 = v13->var0;
      v13 += 8;
      *v12 = v17 + (float)(*(float *)v19.i32 * (float)(v18 - v17));
      v12 += 8;
      --v15;
    }
    while (v15);
  }
}

- (void)computeInstanceTransformScale:(float)a3 t:
{
  int32x2_t v3;
  uint64_t v5;
  unint64_t v6;
  _OWORD *v7;
  void *v8;
  float32x4_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  float32x4_t v16;
  float32x4_t v17;
  int32x2_t v18;
  float32x4_t v19;

  v18 = v3;
  v17 = *(float32x4_t *)&a3;
  v5 = -[MTLBuffer contents](self->_instanceBuffer, "contents");
  if (-[NSArray count](self->_instanceTransforms, "count"))
  {
    v6 = 0;
    v16 = (float32x4_t)vdupq_lane_s32(v18, 0);
    v7 = (_OWORD *)(v5 + 32);
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", v6, *(_OWORD *)&v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordedScale");
      v19 = v9;
      -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLocalScale:", *(double *)vmlaq_f32(v19, vsubq_f32(v17, v19), v16).i64);

      -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transform");
      *(v7 - 2) = v12;
      *(v7 - 1) = v13;
      *v7 = v14;
      v7[1] = v15;
      v7 += 4;

      ++v6;
    }
    while (-[NSArray count](self->_instanceTransforms, "count") > v6);
  }
}

- (void)computeInstanceTransformScale:(ARCoachingMetalSplineData *)self s1:(SEL)a2 t:(float)a3
{
  float32x4_t v3;
  float v4;
  uint64_t v6;
  unint64_t v7;
  _OWORD *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  float32x4_t v15;
  float v16;
  float32x4_t v17;
  double v18;

  v16 = v4;
  v15 = v3;
  v17 = *(float32x4_t *)&a3;
  v6 = -[MTLBuffer contents](self->_instanceBuffer, "contents");
  if (-[NSArray count](self->_instanceTransforms, "count"))
  {
    v7 = 0;
    *(_QWORD *)&v18 = vmlaq_n_f32(v17, vsubq_f32(v15, v17), v16).u64[0];
    v8 = (_OWORD *)(v6 + 32);
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLocalScale:", v18);

      -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transform");
      *(v8 - 2) = v11;
      *(v8 - 1) = v12;
      *v8 = v13;
      v8[1] = v14;
      v8 += 4;

      ++v7;
    }
    while (-[NSArray count](self->_instanceTransforms, "count") > v7);
  }
}

- (void)computeInstanceTransformScale:(ARCoachingMetalSplineData *)self
{
  double v2;
  uint64_t v4;
  unint64_t v5;
  _OWORD *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double v13;

  v13 = v2;
  v4 = -[MTLBuffer contents](self->_instanceBuffer, "contents");
  if (-[NSArray count](self->_instanceTransforms, "count"))
  {
    v5 = 0;
    v6 = (_OWORD *)(v4 + 32);
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLocalScale:", v13);

      -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transform");
      *(v6 - 2) = v9;
      *(v6 - 1) = v10;
      *v6 = v11;
      v6[1] = v12;
      v6 += 4;

      ++v5;
    }
    while (-[NSArray count](self->_instanceTransforms, "count") > v5);
  }
}

- (void)computeInstanceTransformTranslate:(float)a3 t:(int)a4 index:
{
  float v4;
  uint64_t v7;
  float32x4_t v8;
  void *v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  float32x4_t v15;
  float32x4_t v16;
  float v17;
  void *v18;
  void *v19;

  v17 = v4;
  v16 = *(float32x4_t *)&a3;
  v7 = -[MTLBuffer contents](self->_instanceBuffer, "contents");
  -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "recordedTranslation");
  v15 = v8;
  -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocalTranslation:", *(double *)vmlaq_n_f32(v15, vsubq_f32(v16, v15), v17).i64);

  -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "transform");
  v10 = (_OWORD *)(v7 + ((uint64_t)a4 << 6));
  *v10 = v11;
  v10[1] = v12;
  v10[2] = v13;
  v10[3] = v14;

}

- (void)computeInstanceTransformTranslate:(ARCoachingMetalSplineData *)self x1:(SEL)a2 t:(float)a3 index:(int)a4
{
  float32x4_t v4;
  float v5;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  float32x4_t v14;
  float v15;
  void *v16;
  void *v17;
  float32x4_t v18;

  v15 = v5;
  v14 = v4;
  v18 = *(float32x4_t *)&a3;
  v8 = -[MTLBuffer contents](self->_instanceBuffer, "contents");
  v18.i64[0] = vmlaq_n_f32(v18, vsubq_f32(v14, v18), v15).u64[0];
  -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLocalTranslation:", *(double *)v18.i64);

  -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "transform");
  v9 = (_OWORD *)(v8 + ((uint64_t)a4 << 6));
  *v9 = v10;
  v9[1] = v11;
  v9[2] = v12;
  v9[3] = v13;

}

- (void)computeInstanceTransformTranslate:(int)a3 index:
{
  double v3;
  uint64_t v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  double v12;
  id v13;
  id v14;

  v12 = v3;
  v6 = -[MTLBuffer contents](self->_instanceBuffer, "contents");
  -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLocalTranslation:", v12);

  -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transform");
  v7 = (_OWORD *)(v6 + ((uint64_t)a3 << 6));
  *v7 = v8;
  v7[1] = v9;
  v7[2] = v10;
  v7[3] = v11;

}

- (MTLBuffer)controlPointsBuffer
{
  return self->_controlPointsBuffer;
}

- (MTLBuffer)controlPointIndicesBuffer
{
  return self->_controlPointIndicesBuffer;
}

- (MTLBuffer)patchUserDataBuffer
{
  return self->_patchUserDataBuffer;
}

- (MTLBuffer)tessellationFactorsBuffer
{
  return self->_tessellationFactorsBuffer;
}

- (MTLBuffer)instanceBuffer
{
  return self->_instanceBuffer;
}

- (int)patchCount
{
  return self->_patchCount;
}

- (NSArray)instanceTransforms
{
  return self->_instanceTransforms;
}

- (ARCoachingBlendableSplineGroup)shapes
{
  return self->_shapes;
}

- (ARCoachingControlPointContainer)recordedControlPoints
{
  return self->_recordedControlPoints;
}

- (__n128)recordedScale
{
  return a1[5];
}

- (__n128)recordedTranslation
{
  return a1[6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordedControlPoints, 0);
  objc_storeStrong((id *)&self->_shapes, 0);
  objc_storeStrong((id *)&self->_instanceTransforms, 0);
  objc_storeStrong((id *)&self->_instanceBuffer, 0);
  objc_storeStrong((id *)&self->_tessellationFactorsBuffer, 0);
  objc_storeStrong((id *)&self->_patchUserDataBuffer, 0);
  objc_storeStrong((id *)&self->_controlPointIndicesBuffer, 0);
  objc_storeStrong((id *)&self->_controlPointsBuffer, 0);
}

- (void)shapeBlendWithStart:startCount:end:endCount:t:.cold.1()
{
  __assert_rtn("-[ARCoachingMetalSplineData shapeBlendWithStart:startCount:end:endCount:t:]", "ARCoachingGlyphRenderSupport.mm", 516, "startCount == endCount");
}

- (void)computeShapeBlendWithEnd:endCount:t:.cold.1()
{
  __assert_rtn("-[ARCoachingMetalSplineData computeShapeBlendWithEnd:endCount:t:]", "ARCoachingGlyphRenderSupport.mm", 527, "_recordedControlPoints.numControlPoints == endCount");
}

- (void)computeShapeBlendWithStart:startCount:end:endCount:t:.cold.1()
{
  __assert_rtn("-[ARCoachingMetalSplineData computeShapeBlendWithStart:startCount:end:endCount:t:]", "ARCoachingGlyphRenderSupport.mm", 549, "startCount == endCount");
}

@end
