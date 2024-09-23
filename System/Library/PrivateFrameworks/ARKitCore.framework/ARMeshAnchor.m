@implementation ARMeshAnchor

- (uint64_t)initWithGeometry:(__n128)a3 atTimestamp:(__n128)a4 identifier:(__n128)a5 referenceOriginTransform:(__n128)a6
{
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;

  v12 = a9;
  v13 = a8;
  objc_msgSend(v13, "vertices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ARMinimumCornerForVertexSource(v14);

  ARMatrix4x4FromRotationAndTranslation();
  v19 = objc_msgSend(a1, "initWithGeometry:atTimestamp:identifier:visionTransform:referenceOriginTransform:", v13, v12, a2, v15, v16, v17, v18, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6);

  return v19;
}

- (__n128)initWithGeometry:(simd_float4)a3 atTimestamp:(simd_float4)a4 identifier:(simd_float4)a5 visionTransform:(simd_float4)a6 referenceOriginTransform:(uint64_t)a7
{
  id v20;
  id v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  unint64_t v26;
  simd_float4 v27;
  unint64_t v28;
  simd_float4 v29;
  simd_float4 v30;
  simd_float4 v31;
  unint64_t v32;
  void *v33;
  void *v34;
  __n128 *v35;
  __n128 *v36;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  simd_float4 v50;
  simd_float4 v51;
  simd_float4 v52;
  simd_float4 v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;

  v20 = a8;
  v21 = a9;
  *(double *)v22.i64 = ARVisionToRenderingCoordinateTransform();
  v26 = 0;
  v50 = a3;
  v51 = a4;
  v52 = a5;
  v53 = a6;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v54 + v26) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(*(_OWORD *)((char *)&v50 + v26))), v23, *(float32x2_t *)&v50.f32[v26 / 4], 1), v24, *(float32x4_t *)((char *)&v50 + v26), 2), v25, *(float32x4_t *)((char *)&v50 + v26), 3);
    v26 += 16;
  }
  while (v26 != 64);
  v40 = v55;
  v41 = v54;
  v38 = v57;
  v39 = v56;
  *(double *)v27.i64 = ARRenderingToVisionCoordinateTransform();
  v28 = 0;
  v50 = v27;
  v51 = v29;
  v52 = v30;
  v53 = v31;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v54 + v28) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v41, COERCE_FLOAT(*(_OWORD *)((char *)&v50 + v28))), v40, *(float32x2_t *)&v50.f32[v28 / 4], 1), v39, *(float32x4_t *)((char *)&v50 + v28), 2), v38, *(float32x4_t *)((char *)&v50 + v28), 3);
    v28 += 16;
  }
  while (v28 != 64);
  v32 = 0;
  v50 = (simd_float4)v54;
  v51 = (simd_float4)v55;
  v52 = (simd_float4)v56;
  v53 = (simd_float4)v57;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v54 + v32) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a14, COERCE_FLOAT(*(_OWORD *)((char *)&v50 + v32))), a15, *(float32x2_t *)&v50.f32[v32 / 4], 1), a16, *(float32x4_t *)((char *)&v50 + v32), 2), a17, *(float32x4_t *)((char *)&v50 + v32), 3);
    v32 += 16;
  }
  while (v32 != 64);
  v44 = *(double *)v56.i64;
  v45 = *(double *)v57.i64;
  v42 = *(double *)v54.i64;
  v43 = *(double *)v55.i64;
  objc_msgSend(v20, "vertices");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  ARConvertVisionSourceToWorldSource(v33, 0, a3, a4, a5, a6);

  objc_msgSend(v20, "normals");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  ARConvertVisionSourceToWorldSource(v34, 1, a3, a4, a5, a6);

  v35 = (__n128 *)objc_msgSend(a1, "initWithGeometry:atTimestamp:identifier:transform:", v20, v21, a2, v42, v43, v44, v45);
  v36 = v35;
  if (v35)
  {
    v35[15] = (__n128)a3;
    v35[16] = (__n128)a4;
    v35[17] = (__n128)a5;
    v35[18] = (__n128)a6;
  }

  return v36;
}

- (ARMeshAnchor)initWithGeometry:(id)a3 atTimestamp:(double)a4 identifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  ARMeshAnchor *v15;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "vertices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ARMinimumCornerForVertexSource(v10);

  ARMatrix4x4FromRotationAndTranslation();
  v15 = -[ARMeshAnchor initWithGeometry:atTimestamp:identifier:transform:](self, "initWithGeometry:atTimestamp:identifier:transform:", v9, v8, a4, v11, v12, v13, v14);

  return v15;
}

- (ARMeshAnchor)initWithGeometry:(double)a3 atTimestamp:(double)a4 identifier:(double)a5 transform:(double)a6
{
  id v13;
  ARMeshAnchor *v14;
  ARMeshAnchor *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  float *v22;
  float v23;
  float v24;
  float v25;
  float32x2_t v26;
  float32x2_t v27;
  void *v28;
  objc_super v34;

  v13 = a8;
  v34.receiver = a1;
  v34.super_class = (Class)ARMeshAnchor;
  v14 = -[ARAnchor initWithIdentifier:transform:](&v34, sel_initWithIdentifier_transform_, a9, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_geometry, a8);
    v15->_timestamp = a2;
    objc_msgSend(v13, "vertices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    v18 = 0uLL;
    if (v17 >= 2)
    {
      v19 = v17;
      objc_msgSend(v16, "buffer");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = objc_msgSend(v20, "contents");

      *(_QWORD *)&v18 = *(_QWORD *)v21;
      v23 = *(float *)(v21 + 8);
      v22 = (float *)(v21 + 8);
      v24 = v23;
      v25 = v23;
      v26 = (float32x2_t)v18;
      do
      {
        if (v24 >= *v22)
          v24 = *v22;
        v27 = *(float32x2_t *)(v22 - 2);
        v26 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v27, v26), (int8x8_t)v26, (int8x8_t)v27);
        *(int8x8_t *)&v18 = vbsl_s8((int8x8_t)vcgt_f32(v27, *(float32x2_t *)&v18), (int8x8_t)v27, *(int8x8_t *)&v18);
        if (v25 < *v22)
          v25 = *v22;
        v22 += 3;
        --v19;
      }
      while (v19);
      *(float32x2_t *)&v18 = vsub_f32(*(float32x2_t *)&v18, v26);
      *((float *)&v18 + 2) = v25 - v24;
    }
    *(_OWORD *)v15->_extent = v18;

    objc_msgSend(v13, "vertices");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(__n128 *)v15->_corner = ARMinimumCornerForVertexSource(v28);

    v15->_maxExtentError = 0.0;
    -[ARAnchor setLastUpdateTimestamp:](v15, "setLastUpdateTimestamp:", a2);
  }

  return v15;
}

- (ARMeshAnchor)initWithGeometry:(double)a3 atTimestamp:(double)a4 identifier:(double)a5 transform:(double)a6 voxelSize:(double)a7
{
  id v15;
  ARMeshAnchor *v16;
  ARMeshAnchor *v17;
  double v18;
  float32x4_t v19;
  objc_super v25;

  v15 = a9;
  v25.receiver = a1;
  v25.super_class = (Class)ARMeshAnchor;
  v16 = -[ARAnchor initWithIdentifier:transform:](&v25, sel_initWithIdentifier_transform_, a10, a3, a4, a5, a6);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_geometry, a9);
    v17->_timestamp = a2;
    v18 = a7 * 64.0;
    *(float *)&v18 = a7 * 64.0;
    *(int32x4_t *)v17->_extent = vdupq_lane_s32(*(int32x2_t *)&v18, 0);
    v17->_maxExtentError = a7 * 8.0;
    v19 = vnegq_f32(*(float32x4_t *)v17->_extent);
    v19.i32[1] = 0;
    *(float32x4_t *)v17->_corner = v19;
    -[ARAnchor setLastUpdateTimestamp:](v17, "setLastUpdateTimestamp:", a2);
  }

  return v17;
}

- (ARMeshAnchor)initWithAnchor:(id)a3
{
  id v4;
  ARMeshAnchor *v5;
  uint64_t v6;
  ARMeshGeometry *geometry;
  double v8;
  __int128 v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARMeshAnchor;
  v5 = -[ARAnchor initWithAnchor:](&v17, sel_initWithAnchor_, v4);
  if (v5)
  {
    objc_msgSend(v4, "geometry");
    v6 = objc_claimAutoreleasedReturnValue();
    geometry = v5->_geometry;
    v5->_geometry = (ARMeshGeometry *)v6;

    objc_msgSend(v4, "timestamp");
    v5->_timestamp = v8;
    objc_msgSend(v4, "extent");
    *(_OWORD *)v5->_extent = v9;
    objc_msgSend(v4, "maxExtentError");
    v5->_maxExtentError = v10;
    objc_msgSend(v4, "visionTransform");
    *(_OWORD *)&v5[1].super.super.isa = v11;
    *(_OWORD *)&v5[1].super._identifier = v12;
    *(_OWORD *)&v5[1].super._sessionIdentifier = v13;
    *(_OWORD *)v5[1].super._anon_30 = v14;
    objc_msgSend(v4, "corner");
    *(_OWORD *)v5->_corner = v15;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARMeshAnchor;
  v4 = a3;
  -[ARAnchor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_geometry, CFSTR("geometry"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v4, "ar_encodeVector3:forKey:", CFSTR("extent"), *(double *)self->_extent);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxExtentError"), self->_maxExtentError);
  objc_msgSend(v4, "ar_encodeMatrix4x4:forKey:", CFSTR("visionTransform"), *(double *)&self[1].super.super.isa, *(double *)&self[1].super._identifier, *(double *)&self[1].super._sessionIdentifier, *(double *)self[1].super._anon_30);
  objc_msgSend(v4, "ar_encodeVector3:forKey:", CFSTR("corner"), *(double *)self->_corner);

}

- (ARMeshAnchor)initWithCoder:(id)a3
{
  id v4;
  ARMeshAnchor *v5;
  uint64_t v6;
  ARMeshGeometry *geometry;
  double v8;
  __int128 v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARMeshAnchor;
  v5 = -[ARAnchor initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geometry"));
    v6 = objc_claimAutoreleasedReturnValue();
    geometry = v5->_geometry;
    v5->_geometry = (ARMeshGeometry *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v8;
    objc_msgSend(v4, "ar_decodeVector3ForKey:", CFSTR("extent"));
    *(_OWORD *)v5->_extent = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxExtentError"));
    v5->_maxExtentError = v10;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("visionTransform"));
    *(_OWORD *)&v5[1].super.super.isa = v11;
    *(_OWORD *)&v5[1].super._identifier = v12;
    *(_OWORD *)&v5[1].super._sessionIdentifier = v13;
    *(_OWORD *)v5[1].super._anon_30 = v14;
    objc_msgSend(v4, "ar_decodeVector3ForKey:", CFSTR("corner"));
    *(_OWORD *)v5->_corner = v15;
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  void *v15;
  uint64_t v16;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARAnchor identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" identifier=\"%@\"), v7);

  -[ARAnchor name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ARAnchor name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" name=\"%@\"), v9);

  }
  -[ARMeshAnchor geometry](self, "geometry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" geometry=\"%@\"), v10);

  -[ARAnchor transform](self, "transform");
  ARMatrix4x4Description(0, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" transform=%@"), v15);

  if (ARInternalOSBuild())
  {
    -[ARMeshAnchor timestamp](self, "timestamp");
    objc_msgSend(v6, "appendFormat:", CFSTR(" timestamp=%f"), v16);
  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)tracingEntry
{
  return +[ARQAHelper dictionaryFromMeshAnchor:](ARQAHelper, "dictionaryFromMeshAnchor:", self);
}

- (ARMeshGeometry)geometry
{
  return self->_geometry;
}

- (__n128)corner
{
  return a1[13];
}

- (__n128)extent
{
  return a1[14];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)maxExtentError
{
  return self->_maxExtentError;
}

- (void)setMaxExtentError:(double)a3
{
  self->_maxExtentError = a3;
}

- (__n128)visionTransform
{
  return a1[15];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
}

@end
