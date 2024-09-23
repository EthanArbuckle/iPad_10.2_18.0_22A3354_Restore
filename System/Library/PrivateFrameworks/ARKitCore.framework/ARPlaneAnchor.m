@implementation ARPlaneAnchor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARPlaneAnchor;
  v4 = a3;
  -[ARAnchor encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_alignment, CFSTR("alignment"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "ar_encodeVector3:forKey:", CFSTR("center"), *(double *)self->_center);
  objc_msgSend(v4, "ar_encodeVector3:forKey:", CFSTR("extent"), *(double *)self->_extent);
  objc_msgSend(v4, "encodeObject:forKey:", self->_planeExtent, CFSTR("planeExtent"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_geometry, CFSTR("geometry"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_worldAlignmentRotation, CFSTR("worldAlignmentRotation"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_classificationStatus, CFSTR("classificationStatus"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_classification, CFSTR("classification"));
  *(float *)&v5 = self->_uncertaintyAlongNormal;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("uncertaintyAlongNormal"), v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_classificationLabel, CFSTR("classificationLabel"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_gridExtent, CFSTR("gridExtent"));

}

- (ARPlaneAnchor)initWithCoder:(id)a3
{
  id v4;
  ARPlaneAnchor *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  ARPlaneExtent *planeExtent;
  uint64_t v10;
  ARPlaneGeometry *geometry;
  float v12;
  uint64_t v13;
  NSString *classificationLabel;
  uint64_t v15;
  ARPatchGrid *gridExtent;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ARPlaneAnchor;
  v5 = -[ARAnchor initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_alignment = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("alignment"));
    objc_msgSend(v4, "ar_decodeVector3ForKey:", CFSTR("center"));
    *(_OWORD *)v5->_center = v6;
    objc_msgSend(v4, "ar_decodeVector3ForKey:", CFSTR("extent"));
    *(_OWORD *)v5->_extent = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planeExtent"));
    v8 = objc_claimAutoreleasedReturnValue();
    planeExtent = v5->_planeExtent;
    v5->_planeExtent = (ARPlaneExtent *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geometry"));
    v10 = objc_claimAutoreleasedReturnValue();
    geometry = v5->_geometry;
    v5->_geometry = (ARPlaneGeometry *)v10;

    v5->_worldAlignmentRotation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("worldAlignmentRotation"));
    v5->_classificationStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("classificationStatus"));
    v5->_classification = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("classification"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("uncertaintyAlongNormal"));
    v5->_uncertaintyAlongNormal = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classificationLabel"));
    v13 = objc_claimAutoreleasedReturnValue();
    classificationLabel = v5->_classificationLabel;
    v5->_classificationLabel = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gridExtent"));
    v15 = objc_claimAutoreleasedReturnValue();
    gridExtent = v5->_gridExtent;
    v5->_gridExtent = (ARPatchGrid *)v15;

  }
  return v5;
}

- (ARPlaneAnchor)initWithIdentifier:(uint64_t)a3 transform:(int64_t)a4 alignment:
{
  ARPlaneAnchor *v5;
  ARPlaneAnchor *v6;
  uint64_t v12;
  ARPlaneExtent *planeExtent;
  objc_super v15;

  v15.receiver = a1;
  v15.super_class = (Class)ARPlaneAnchor;
  v5 = -[ARAnchor initWithIdentifier:transform:](&v15, sel_initWithIdentifier_transform_);
  v6 = v5;
  if (v5)
  {
    v5->_alignment = a4;
    *(_OWORD *)v5->_center = 0u;
    __asm { FMOV            V0.4S, #-1.0 }
    *(_OWORD *)v5->_extent = _Q0;
    v12 = objc_opt_new();
    planeExtent = v6->_planeExtent;
    v6->_planeExtent = (ARPlaneExtent *)v12;

  }
  return v6;
}

- (id)_hitTestFromOrigin:(ARPlaneAnchor *)self withDirection:(SEL)a2 usingExtent:(BOOL)a3 usingGeometry:(BOOL)a4
{
  float32x4_t v4;
  float32x4_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  float32x4_t v18;
  uint64_t v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  __float2 v25;
  float v34;
  float v35;
  float32x4_t v36;
  float v37;
  float32x4_t v41;
  __int32 v47;
  float32x4_t v48;
  __int32 v49;
  float32x4_t v50;
  __int32 v51;
  float32x4_t v52;
  __int32 v53;
  float32x4_t v54;
  double v55;
  float v56;
  double v57;
  float v58;
  float v59;
  double v60;
  float v61;
  float v62;
  double v63;
  float v64;
  float v65;
  double v66;
  float v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  float32x4_t v74;
  int32x4_t v75;
  float32x2_t v76;
  float32x2_t v77;
  uint64_t v78;
  unsigned __int32 v79;
  float32x2_t v80;
  float32x2_t v81;
  float v82;
  float32x4_t v83;
  int32x4_t v84;
  float32x4_t v85;
  float32x2_t v86;
  float32x2_t v87;
  float32x4_t v88;
  ARHitTestResult *v89;
  uint64_t v91;
  uint64_t v92;
  __int32 v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float v98;
  double v99;
  double v100;
  double v101;
  __int128 v102;
  __int128 v103;
  float32x4_t v104;
  __int128 v105;
  float32x4_t v106;
  float v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;
  _OWORD v112[4];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  float32x4_t v116;
  simd_float4x4 v117;
  simd_float4x4 v118;

  v6 = a4;
  v7 = a3;
  v108 = v5;
  v110 = v4;
  -[ARAnchor transform](self, "transform");
  v10 = vmulq_f32(v9, v108);
  v11 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1)));
  if (v11.f32[0] > -0.00000011921)
    goto LABEL_20;
  v104 = v9;
  v106 = v11;
  -[ARAnchor transform](self, "transform");
  v13 = vmulq_f32(v104, vsubq_f32(v12, v110));
  v14 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))), v106).f32[0];
  if (v14 < 0.0)
    goto LABEL_20;
  v107 = v14;
  -[ARAnchor transform](self, "transform");
  v103 = v16;
  v105 = v15;
  v102 = v17;
  v18 = vmlaq_n_f32(v110, v108, v107);
  v18.i32[3] = 1.0;
  v111 = v18;
  -[ARAnchor transform](self, "transform");
  v118 = __invert_f4(v117);
  v19 = 0;
  v112[0] = v105;
  v112[1] = v103;
  v112[2] = v102;
  v112[3] = v111;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  do
  {
    *(__int128 *)((char *)&v113 + v19 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v118.columns[0], COERCE_FLOAT(v112[v19])), (float32x4_t)v118.columns[1], *(float32x2_t *)&v112[v19], 1), (float32x4_t)v118.columns[2], (float32x4_t)v112[v19], 2), (float32x4_t)v118.columns[3], (float32x4_t)v112[v19], 3);
    ++v19;
  }
  while (v19 != 4);
  v100 = *(double *)&v114;
  v101 = *(double *)&v113;
  v99 = *(double *)&v115;
  v109 = v116;
  if (!v7)
    goto LABEL_13;
  -[ARPlaneAnchor planeExtent](self, "planeExtent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rotationOnYAxis");
  v22 = v21;

  if (v22 == 0.0)
  {
    v54 = v109;
  }
  else
  {
    -[ARPlaneAnchor planeExtent](self, "planeExtent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "rotationOnYAxis");
    v25 = __sincosf_stret(v24 * -0.5);
    _Q0 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDD0, v25.__sinval);
    _S2 = _Q0.i32[1];
    _S4 = _Q0.i32[2];
    __asm { FMLS            S3, S4, V0.S[2] }
    v34 = vmlas_n_f32(vmuls_lane_f32(v25.__cosval, _Q0, 2), _Q0.f32[1], _Q0.f32[0]);
    v35 = vmlas_n_f32(-(float)(v25.__cosval * _Q0.f32[1]), _Q0.f32[2], _Q0.f32[0]);
    v36.i32[3] = 0;
    v36.f32[0] = _S3 + (float)(v25.__cosval * v25.__cosval);
    v36.f32[1] = v34 + v34;
    v36.f32[2] = v35 + v35;
    v37 = vmlas_n_f32(-(float)(v25.__cosval * _Q0.f32[2]), _Q0.f32[1], _Q0.f32[0]);
    __asm
    {
      FMLA            S5, S2, V0.S[1]
      FMLS            S5, S0, V0.S[0]
      FMLA            S6, S4, V0.S[1]
    }
    v41.i32[3] = 0;
    v41.f32[0] = v37 + v37;
    v41.i32[1] = _S5;
    v41.f32[2] = _S6 + _S6;
    v95 = v41;
    v96 = v36;
    __asm
    {
      FMLA            S7, S0, V0.S[2]
      FMLA            S5, S4, V0.S[1]
      FMLA            S1, S4, V0.S[2]
      FMLS            S1, S0, V0.S[0]
      FMLS            S1, S2, V0.S[1]
    }
    _Q0.f32[0] = _S7 + _S7;
    _Q0.f32[1] = _S5 + _S5;
    _Q0.i64[1] = _S1;
    v94 = _Q0;

    -[ARPlaneAnchor center](self, "center");
    v93 = v47;
    -[ARPlaneAnchor center](self, "center");
    v48 = (float32x4_t)xmmword_1B3BDFD50;
    v48.i32[0] = v93;
    v48.i32[2] = v49;
    v50 = vsubq_f32(v109, v48);
    v97 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v96, v50.f32[0]), v95, *(float32x2_t *)v50.f32, 1), v94, v50, 2), (float32x4_t)xmmword_1B3BDFD50, v50, 3);
    -[ARPlaneAnchor center](self, "center");
    v95.i32[0] = v51;
    -[ARPlaneAnchor center](self, "center");
    v52 = (float32x4_t)xmmword_1B3BDFD50;
    v52.i32[0] = v95.i32[0];
    v52.i32[2] = v53;
    v54 = vaddq_f32(v52, v97);
  }
  v98 = v54.f32[2];
  v55 = v54.f32[0];
  -[ARPlaneAnchor center](self, "center");
  v57 = v56;
  -[ARPlaneAnchor extent](self, "extent");
  if (v57 + v58 * -0.5 > v55)
    goto LABEL_20;
  -[ARPlaneAnchor center](self, "center");
  v60 = v59;
  -[ARPlaneAnchor extent](self, "extent");
  if (v61 * 0.5 + v60 < v55
    || (-[ARPlaneAnchor center](self, "center"),
        v63 = v62,
        -[ARPlaneAnchor extent](self, "extent"),
        v63 + v64 * -0.5 > v98)
    || (-[ARPlaneAnchor center](self, "center"),
        v66 = v65,
        -[ARPlaneAnchor extent](self, "extent"),
        v67 * 0.5 + v66 < v98))
  {
LABEL_20:
    v89 = 0;
  }
  else
  {
LABEL_13:
    if (v6)
    {
      -[ARPlaneAnchor geometry](self, "geometry");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "boundaryVertices");

      -[ARPlaneAnchor geometry](self, "geometry");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "boundaryVertexCount");

      v72 = 0;
      while ((v71 & ~(v71 >> 63)) != v72)
      {
        v73 = v72 + 1;
        v74 = vsubq_f32(*(float32x4_t *)(v69 + 16 * v72), v109);
        v75 = (int32x4_t)vmulq_f32(v74, v74);
        v76 = (float32x2_t)vdupq_laneq_s32(v75, 2).u64[0];
        v77 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v75.i8, 1);
        if (v72 + 1 < v71)
          v78 = v72 + 1;
        else
          v78 = 0;
        v79 = vadd_f32(v76, vadd_f32(*(float32x2_t *)v75.i8, v77)).u32[0];
        v80 = vrsqrte_f32((float32x2_t)v79);
        v81 = vmul_f32(v80, vrsqrts_f32((float32x2_t)v79, vmul_f32(v80, v80)));
        LODWORD(v82) = vmul_f32(v81, vrsqrts_f32((float32x2_t)v79, vmul_f32(v81, v81))).u32[0];
        v83 = vsubq_f32(*(float32x4_t *)(v69 + 16 * v78), v109);
        v84 = (int32x4_t)vmulq_f32(v83, v83);
        v84.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v84, 2), vadd_f32(*(float32x2_t *)v84.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v84.i8, 1))).u32[0];
        v85 = vmulq_n_f32(v74, v82);
        v86 = vrsqrte_f32((float32x2_t)v84.u32[0]);
        v87 = vmul_f32(v86, vrsqrts_f32((float32x2_t)v84.u32[0], vmul_f32(v86, v86)));
        v88 = vmulq_n_f32(v83, vmul_f32(v87, vrsqrts_f32((float32x2_t)v84.u32[0], vmul_f32(v87, v87))).f32[0]);
        v72 = v73;
        if (vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v88, (int32x4_t)v88), (int8x16_t)v88, 0xCuLL), vnegq_f32(v85)), v88, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v85, (int32x4_t)v85), (int8x16_t)v85, 0xCuLL)).f32[0] < -0.00000011921)goto LABEL_20;
      }
    }
    v91 = 8;
    if (v7)
      v91 = 16;
    if (v6)
      v92 = 32;
    else
      v92 = v91;
    v89 = -[ARHitTestResult initWithType:]([ARHitTestResult alloc], "initWithType:", v92);
    -[ARHitTestResult setAnchor:](v89, "setAnchor:", self);
    -[ARHitTestResult setDistance:](v89, "setDistance:", v107);
    -[ARHitTestResult setWorldTransform:](v89, "setWorldTransform:", *(double *)&v105, *(double *)&v103, *(double *)&v102, *(double *)v111.i64);
    -[ARHitTestResult setLocalTransform:](v89, "setLocalTransform:", v101, v100, v99, *(double *)v109.i64);
  }
  return v89;
}

- (id)_description:(BOOL)a3
{
  _BOOL4 v3;
  ARPlaneAnchorAlignment v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  void *v16;
  __n128 v17;
  void *v18;
  __n128 v19;
  void *v20;
  ARPlaneClassification v21;
  const __CFString *v22;
  void *v23;
  void *v24;

  v3 = a3;
  v5 = -[ARPlaneAnchor alignment](self, "alignment");
  v6 = CFSTR("vertical");
  if (v5 != ARPlaneAnchorAlignmentVertical)
    v6 = 0;
  if (v5 == ARPlaneAnchorAlignmentHorizontal)
    v6 = CFSTR("horizontal");
  v7 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[ARPlaneAnchor alignment](self, "alignment"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARAnchor identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARAnchor transform](self, "transform");
  ARMatrix4x4Description(v3, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPlaneAnchor center](self, "center");
  ARVector3Description(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPlaneAnchor extent](self, "extent");
  ARVector3Description(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[ARPlaneAnchor classification](self, "classification");
  if ((unint64_t)(v21 - 1) > 6)
    v22 = CFSTR("None");
  else
    v22 = off_1E6674638[v21 - 1];
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p identifier=\"%@\" transform=%@ alignment=%@ center=%@ extent=%@ classification=%@"), v10, self, v11, v16, v7, v18, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "stringByAppendingString:", CFSTR(">"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (NSString)description
{
  return (NSString *)-[ARPlaneAnchor _description:](self, "_description:", 0);
}

- (id)debugQuickLookObject
{
  return -[ARPlaneAnchor _description:](self, "_description:", 1);
}

- (float)area
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  float v11;
  __int128 v13;

  -[ARPlaneAnchor geometry](self, "geometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "boundaryVertexCount");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = v3 - 1;
    v7 = 0.0;
    do
    {
      v13 = *(_OWORD *)(objc_msgSend(v2, "boundaryVertices") + 16 * v5);
      v8 = objc_msgSend(v2, "boundaryVertices");
      if (v6 == v5)
        v9 = 0;
      else
        v9 = v5 + 1;
      v7 = v7
         + vmlas_n_f32((float)-*((float *)&v13 + 2) * COERCE_FLOAT(*(_OWORD *)(v8 + 16 * v9)), COERCE_FLOAT(*(_QWORD *)(v8 + 16 * v9 + 8)), *(float *)&v13);
      ++v5;
    }
    while (v4 != v5);
    v10 = v7 * 0.5;
  }
  else
  {
    v10 = 0.0;
  }
  v11 = fabsf(v10);

  return v11;
}

- (ARPlaneAnchor)initWithAnchor:(id)a3
{
  id v4;
  ARPlaneAnchor *v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  ARPlaneExtent *planeExtent;
  uint64_t v11;
  ARPatchGrid *gridExtent;
  uint64_t v13;
  ARPlaneGeometry *geometry;
  float v15;
  void *v16;
  uint64_t v17;
  NSDictionary *possibleClassifications;
  void *v19;
  uint64_t v20;
  NSString *classificationLabel;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ARPlaneAnchor;
  v5 = -[ARAnchor initWithAnchor:](&v23, sel_initWithAnchor_, v4);
  if (v5)
  {
    v5->_alignment = objc_msgSend(v4, "alignment");
    objc_msgSend(v4, "center");
    *(_OWORD *)v5->_center = v6;
    objc_msgSend(v4, "extent");
    *(_OWORD *)v5->_extent = v7;
    objc_msgSend(v4, "planeExtent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    planeExtent = v5->_planeExtent;
    v5->_planeExtent = (ARPlaneExtent *)v9;

    objc_msgSend(v4, "gridExtent");
    v11 = objc_claimAutoreleasedReturnValue();
    gridExtent = v5->_gridExtent;
    v5->_gridExtent = (ARPatchGrid *)v11;

    objc_msgSend(v4, "geometry");
    v13 = objc_claimAutoreleasedReturnValue();
    geometry = v5->_geometry;
    v5->_geometry = (ARPlaneGeometry *)v13;

    objc_msgSend(v4, "uncertaintyAlongNormal");
    v5->_uncertaintyAlongNormal = v15;
    v5->_worldAlignmentRotation = objc_msgSend(v4, "worldAlignmentRotation");
    v5->_classificationStatus = objc_msgSend(v4, "classificationStatus");
    v5->_classification = objc_msgSend(v4, "classification");
    objc_msgSend(v4, "possibleClassifications");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    possibleClassifications = v5->_possibleClassifications;
    v5->_possibleClassifications = (NSDictionary *)v17;

    objc_msgSend(v4, "classificationLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    classificationLabel = v5->_classificationLabel;
    v5->_classificationLabel = (NSString *)v20;

  }
  return v5;
}

- (NSDictionary)tracingEntry
{
  return (NSDictionary *)+[ARQAHelper dictionaryFromPlaneAnchor:](ARQAHelper, "dictionaryFromPlaneAnchor:", self);
}

- (ARPlaneAnchorAlignment)alignment
{
  return self->_alignment;
}

- (simd_float3)center
{
  return *(simd_float3 *)self->_center;
}

- (void)setCenter:(ARPlaneAnchor *)self
{
  __int128 v2;

  *(_OWORD *)self->_center = v2;
}

- (simd_float3)extent
{
  return *(simd_float3 *)self->_extent;
}

- (void)setExtent:(ARPlaneAnchor *)self
{
  __int128 v2;

  *(_OWORD *)self->_extent = v2;
}

- (ARPlaneExtent)planeExtent
{
  return self->_planeExtent;
}

- (void)setPlaneExtent:(id)a3
{
  objc_storeStrong((id *)&self->_planeExtent, a3);
}

- (ARPlaneGeometry)geometry
{
  return (ARPlaneGeometry *)objc_getProperty(self, a2, 208, 1);
}

- (void)setGeometry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (ARPlaneClassificationStatus)classificationStatus
{
  return self->_classificationStatus;
}

- (void)setClassificationStatus:(int64_t)a3
{
  self->_classificationStatus = a3;
}

- (ARPlaneClassification)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (ARPatchGrid)gridExtent
{
  return self->_gridExtent;
}

- (void)setGridExtent:(id)a3
{
  objc_storeStrong((id *)&self->_gridExtent, a3);
}

- (float)uncertaintyAlongNormal
{
  return self->_uncertaintyAlongNormal;
}

- (void)setUncertaintyAlongNormal:(float)a3
{
  self->_uncertaintyAlongNormal = a3;
}

- (int64_t)worldAlignmentRotation
{
  return self->_worldAlignmentRotation;
}

- (void)setWorldAlignmentRotation:(int64_t)a3
{
  self->_worldAlignmentRotation = a3;
}

- (NSDictionary)possibleClassifications
{
  return self->_possibleClassifications;
}

- (void)setPossibleClassifications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)classificationLabel
{
  return self->_classificationLabel;
}

- (void)setClassificationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_classificationLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationLabel, 0);
  objc_storeStrong((id *)&self->_possibleClassifications, 0);
  objc_storeStrong((id *)&self->_gridExtent, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_planeExtent, 0);
}

@end
