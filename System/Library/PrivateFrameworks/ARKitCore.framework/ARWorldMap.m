@implementation ARWorldMap

- (ARWorldMap)initWithTrackingData:(__n128)a3 referenceOriginTransform:(__n128)a4
{
  id v8;
  ARWorldMap *v9;
  ARPointCloud *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  NSData *trackingData;
  ARPointCloud *rawFeaturePoints;
  ARPointCloud *v16;
  NSArray *anchors;
  __int128 v19;
  __int128 v20;
  objc_super v25;

  v8 = a7;
  v25.receiver = a1;
  v25.super_class = (Class)ARWorldMap;
  v9 = -[ARWorldMap init](&v25, sel_init);
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "featurePointsForTrackingData:referenceOriginTransform:", v8, a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0]);
    v10 = (ARPointCloud *)objc_claimAutoreleasedReturnValue();
    -[ARPointCloud computeBounds](v10, "computeBounds");
    v19 = v12;
    v20 = v11;
    v9->_version = 2;
    v13 = objc_msgSend(v8, "copy");
    trackingData = v9->_trackingData;
    v9->_trackingData = (NSData *)v13;

    *(__n128 *)&v9[1].super.isa = a2;
    *(__n128 *)&v9[1]._rawFeaturePoints = a3;
    *(__n128 *)&v9[1]._trackingData = a4;
    *(__n128 *)v9[1]._center = a5;
    rawFeaturePoints = v9->_rawFeaturePoints;
    v9->_rawFeaturePoints = v10;
    v16 = v10;

    *(_OWORD *)v9->_center = v20;
    *(_OWORD *)v9->_extent = v19;
    anchors = v9->_anchors;
    v9->_anchors = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v9;
}

- (NSObject)extractReferenceObjectWithTransform:(__n128)a3 center:(__n128)a4 extent:(__n128)a5 error:(float32x4_t)a6
{
  void *v11;
  uint64_t v12;
  float32x4_t v13;
  simd_float4 v14;
  simd_float4 v15;
  simd_float4 v16;
  simd_float4 v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __n128 v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  void *v41;
  unsigned int v42;
  NSObject *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  ARReferenceObject *v47;
  void *v48;
  unint64_t v49;
  float32x4_t v51;
  int8x16_t v52;
  float32x4_t v53;
  int8x16_t v54;
  float32x4_t v55;
  __n128 v56;
  float32x4_t v57;
  __n128 v58;
  float32x4_t v59;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v68;
  simd_float4 v69;
  simd_float4 v71;
  simd_float4 v73;
  simd_float4 v75;
  float64x2_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  _BYTE buf[48];
  __n128 v82;
  uint64_t v83;
  simd_float4x4 v84;
  simd_float4x4 v85;
  simd_float4x4 v86;
  simd_float4x4 v87;

  v83 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_opt_new();
  objc_msgSend(a1, "referenceOriginTransform");
  v85 = __invert_f4(v84);
  v12 = 0;
  *(__n128 *)buf = a2;
  *(__n128 *)&buf[16] = a3;
  *(__n128 *)&buf[32] = a4;
  v82 = a5;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v77 + v12) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v85.columns[0], COERCE_FLOAT(*(_OWORD *)&buf[v12])), (float32x4_t)v85.columns[1], *(float32x2_t *)&buf[v12], 1), (float32x4_t)v85.columns[2], *(float32x4_t *)&buf[v12], 2), (float32x4_t)v85.columns[3], *(float32x4_t *)&buf[v12], 3);
    v12 += 16;
  }
  while (v12 != 64);
  v68 = v77;
  *(__n64 *)v13.f32 = ARInnerScaleFromMatrix(v77, v78);
  v59 = v13;
  *(double *)v14.i64 = ARNormalizedTransform(v68);
  v73 = v15;
  v75 = v14;
  v69 = v17;
  v71 = v16;
  *(double *)v18.i64 = ARRenderingToVisionCoordinateTransform();
  v22 = 0;
  *(simd_float4 *)buf = v75;
  *(simd_float4 *)&buf[16] = v73;
  *(simd_float4 *)&buf[32] = v71;
  v82 = (__n128)v69;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v77 + v22) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)&buf[v22])), v19, *(float32x2_t *)&buf[v22], 1), v20, *(float32x4_t *)&buf[v22], 2), v21, *(float32x4_t *)&buf[v22], 3);
    v22 += 16;
  }
  while (v22 != 64);
  v55 = v78;
  v57 = v77;
  v51 = v80;
  v53 = v79;
  *(double *)&v23 = ARVisionToRenderingCoordinateTransform();
  v24 = 0;
  *(_OWORD *)buf = v23;
  *(_OWORD *)&buf[16] = v25;
  *(_OWORD *)&buf[32] = v26;
  v82 = v27;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v77 + v24) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(_OWORD *)&buf[v24])), v55, *(float32x2_t *)&buf[v24], 1), v53, *(float32x4_t *)&buf[v24], 2), v51, *(float32x4_t *)&buf[v24], 3);
    v24 += 16;
  }
  while (v24 != 64);
  v56 = (__n128)v79;
  v58 = (__n128)v80;
  v52 = (int8x16_t)v77;
  v54 = (int8x16_t)v78;
  v28.i64[0] = 0x3F0000003F000000;
  v28.i64[1] = 0x3F0000003F000000;
  v29 = vmulq_f32(a7, v28);
  v61 = vmulq_f32(vsubq_f32(a6, v29), v59);
  v65 = vmulq_f32(vaddq_f32(a6, v29), v59);
  *(double *)v30.i64 = ARRenderingToVisionCoordinateTransform();
  v62 = vaddq_f32(v33, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v30, v61.f32[0]), v31, *(float32x2_t *)v61.f32, 1), v32, v61, 2));
  *(double *)v34.i64 = ARRenderingToVisionCoordinateTransform();
  v38 = vaddq_f32(v37, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v34, v65.f32[0]), v35, *(float32x2_t *)v65.f32, 1), v36, v65, 2));
  v39 = vdivq_f32(v62, (float32x4_t)vdupq_laneq_s32((int32x4_t)v62, 3));
  v40 = vdivq_f32(v38, (float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 3));
  v39.i32[3] = 0;
  v40.i32[3] = 0;
  v63 = vminnmq_f32(v39, v40);
  v66 = vmaxnmq_f32(v39, v40);
  objc_msgSend(a1, "trackingData", ARMatrix4x4RowMajorRotationAndTranslation((float64x2_t *)&v77, &v76, v52, v54, v56, v58));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  *(float64x2_t *)buf = vcvtq_f64_f32(*(float32x2_t *)v63.f32);
  *(float64x2_t *)&buf[24] = vcvtq_f64_f32(*(float32x2_t *)v66.f32);
  *(double *)&buf[16] = v63.f32[2];
  *(double *)&buf[40] = v66.f32[2];
  v42 = CV3DVIOExtractObjectMap();

  if (v42)
  {
    _ARLogGeneral_23();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCV3DVIOReturn(v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v46;
      _os_log_impl(&dword_1B3A68000, v43, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error extracting reference object: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    v47 = [ARReferenceObject alloc];
    v86.columns[1] = v73;
    v86.columns[0] = v75;
    v86.columns[3] = v69;
    v86.columns[2] = v71;
    v87 = __invert_f4(v86);
    v43 = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](v47, "initWithTrackingData:referenceOriginTransform:", v11, *(double *)v87.columns[0].i64, *(double *)v87.columns[1].i64, *(double *)v87.columns[2].i64, *(double *)v87.columns[3].i64);
    -[NSObject rawFeaturePoints](v43, "rawFeaturePoints");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "count");

    if (v49 >= 0x33)
    {

      return v43;
    }
  }

  if (a9)
  {
    ARErrorWithCodeAndUserInfo(400, 0);
    v43 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }
  return v43;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ARWorldMap trackingData](self, "trackingData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float32x4_t *v5;
  NSData *surfaceData;
  NSData *trackingData;
  void *v8;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (float32x4_t *)v4;
    if (AREqualTransforms(*(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&self[1]._rawFeaturePoints, *(float32x4_t *)&self[1]._trackingData, *(float32x4_t *)self[1]._center, v5[5], v5[6], v5[7], v5[8])&& -[NSArray isEqual:](self->_anchors, "isEqual:", v5->i64[1])&& ((surfaceData = self->_surfaceData, surfaceData == (NSData *)v5[2].i64[1])|| -[NSData isEqual:](surfaceData, "isEqual:")))
    {
      trackingData = self->_trackingData;
      -[float32x4_t trackingData](v5, "trackingData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSData isEqual:](trackingData, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    *(_QWORD *)(v5 + 24) = self->_version;
    v7 = -[NSData copyWithZone:](self->_trackingData, "copyWithZone:", a3);
    v8 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v7;

    v9 = *(_OWORD *)&self[1].super.isa;
    v10 = *(_OWORD *)&self[1]._rawFeaturePoints;
    v11 = *(_OWORD *)self[1]._center;
    *(_OWORD *)(v6 + 112) = *(_OWORD *)&self[1]._trackingData;
    *(_OWORD *)(v6 + 128) = v11;
    *(_OWORD *)(v6 + 80) = v9;
    *(_OWORD *)(v6 + 96) = v10;
    objc_storeStrong((id *)(v6 + 16), self->_rawFeaturePoints);
    *(_OWORD *)(v6 + 48) = *(_OWORD *)self->_center;
    *(_OWORD *)(v6 + 64) = *(_OWORD *)self->_extent;
    v12 = -[NSData copyWithZone:](self->_surfaceData, "copyWithZone:", a3);
    v13 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v12;

    v14 = -[NSArray copyWithZone:](self->_anchors, "copyWithZone:", a3);
    v15 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v14;

  }
  return (id)v6;
}

- (id)description
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  __n128 v10;
  void *v11;
  __n128 v12;
  void *v13;
  void *v14;
  void *v15;

  -[ARWorldMap anchors](self, "anchors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    v4 = CFSTR("1 anchor");
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[ARWorldMap anchors](self, "anchors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%d anchors"), objc_msgSend(v6, "count"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARWorldMap center](self, "center");
  ARVector3Description(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARWorldMap extent](self, "extent");
  ARVector3Description(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARWorldMap rawFeaturePoints](self, "rawFeaturePoints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p center=%@ extent=%@ | %@, %d features>"), v9, self, v11, v13, v4, objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARWorldMap version](self, "version"), CFSTR("version"));
  -[ARWorldMap trackingData](self, "trackingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("trackingData"));

  -[ARWorldMap surfaceData](self, "surfaceData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("surfaceData"));

  -[ARWorldMap referenceOriginTransform](self, "referenceOriginTransform");
  objc_msgSend(v4, "ar_encodeMatrix4x4:forKey:", CFSTR("referenceOriginTransform"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ARWorldMap anchors](self, "anchors", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(v7, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("anchors"));
}

- (ARWorldMap)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  ARWorldMap *v10;
  ARWorldMap *v11;
  uint64_t v12;
  NSData *surfaceData;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  ARWorldMap *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  ARWorldMap *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  if (v5 >= 3)
  {
    ARErrorWithCodeAndUserInfo(302, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v6);

    _ARLogGeneral_23();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v9;
      v28 = 2048;
      v29 = self;
      v30 = 2048;
      v31 = v5;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading map: Unsupported map version (%ld)", buf, 0x20u);

    }
LABEL_14:
    v20 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingData"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    ARErrorWithCodeAndUserInfo(302, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v21);

    _ARLogGeneral_23();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v24;
      v28 = 2048;
      v29 = self;
      _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading map: Malformed map data", buf, 0x16u);

    }
    goto LABEL_14;
  }
  objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("referenceOriginTransform"));
  v10 = -[ARWorldMap initWithTrackingData:referenceOriginTransform:](self, "initWithTrackingData:referenceOriginTransform:", v7);
  v11 = v10;
  if (v10)
  {
    v10->_version = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("surfaceData"));
    v12 = objc_claimAutoreleasedReturnValue();
    surfaceData = v11->_surfaceData;
    v11->_surfaceData = (NSData *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("anchors"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v11->_anchors, v19);

  }
  self = v11;
  v20 = self;
LABEL_15:

  return v20;
}

+ (id)featurePointsForTrackingData:(float32x4_t)a3 referenceOriginTransform:(float32x4_t)a4
{
  id v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  ARPointCloud *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  _OWORD v30[4];
  uint8_t buf[32];
  __int128 v32;
  double v33[3];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a7;
  v9 = (void *)objc_opt_new();
  v10 = CV3DVIOCreatePointsFromMap();
  if (v10)
  {
    v11 = v10;
    _ARLogGeneral_23();
    v12 = (ARPointCloud *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCV3DVIOReturn(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v15;
      _os_log_impl(&dword_1B3A68000, &v12->super, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to parse feature points: %{public}@", buf, 0x20u);

    }
LABEL_11:

    +[ARPointCloud emptyPointCloud](ARPointCloud, "emptyPointCloud");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v12 = -[ARPointCloud initWithPointData:]([ARPointCloud alloc], "initWithPointData:", v9);
  if (!-[ARPointCloud count](v12, "count"))
  {
    _ARLogGeneral_23();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Warning: Zero feature points in map.", buf, 0x16u);

    }
    goto LABEL_11;
  }
  *(double *)&v16 = ARVisionToRenderingCoordinateTransform();
  v17 = 0;
  v30[0] = v16;
  v30[1] = v18;
  v30[2] = v19;
  v30[3] = v20;
  memset(buf, 0, sizeof(buf));
  v32 = 0u;
  *(_OWORD *)v33 = 0u;
  do
  {
    *(float32x4_t *)&buf[v17 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(v30[v17])), a3, *(float32x2_t *)&v30[v17], 1), a4, (float32x4_t)v30[v17], 2), a5, (float32x4_t)v30[v17], 3);
    ++v17;
  }
  while (v17 != 4);
  -[ARPointCloud pointCloudByApplyingTransform:](v12, "pointCloudByApplyingTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v32, v33[0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v21;
}

+ (__n64)boundsForTrackingData:(uint64_t)a1
{
  unsigned int v2;
  float64x2_t v3;
  float64x2_t v4;
  unsigned int v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  __n64 result;
  float64_t v16;
  float v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = CV3DVIOGetMapBounds();
  if (v2)
  {
    v5 = v2;
    _ARLogGeneral_23();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCV3DVIOReturn(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v8;
      v20 = 2048;
      v21 = a1;
      v22 = 2114;
      v23 = v9;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to parse bounds: %{public}@", buf, 0x20u);

    }
    return 0;
  }
  else
  {
    v3.f64[0] = 0.0;
    v4.f64[0] = 0.0;
    __asm { FMOV            V6.2D, #0.5 }
    v16 = vmulq_f64(vaddq_f64(v3, v4), _Q6).f64[0];
    v17 = COERCE_DOUBLE(*(_QWORD *)&vmulq_f64(vaddq_f64((float64x2_t)0, (float64x2_t)0), _Q6).f64[1]);
    result.n64_f32[0] = -v17;
    *(float *)&v16 = v16;
    result.n64_u32[1] = LODWORD(v16);
  }
  return result;
}

+ (id)keyframesForTrackingData:(double)a3 withFeaturePoints:(double)a4 referenceOriginTransform:(double)a5
{
  id v10;
  id v11;
  unsigned int v12;
  NSObject *v13;
  objc_class *v14;
  id v15;
  void *v16;
  uint64_t v17;
  unint64_t i;
  __int128 *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  ARKeyFrame *v29;
  _QWORD v35[2];
  uint64_t (*v36)();
  void *v37;
  uint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  _BYTE buf[32];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  v11 = a8;
  v43 = 0;
  v44 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v12 = CV3DVIOCreateKeyframesFromMap();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __82__ARWorldMap_keyframesForTrackingData_withFeaturePoints_referenceOriginTransform___block_invoke;
  v37 = &unk_1E66746E8;
  v38 = &v40;
  v39 = v44;
  if (v12)
  {
    _ARLogGeneral_23();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromCV3DVIOReturn(v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v16;
      _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to parse keyframes: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    a1 = (void *)objc_opt_new();
    if (v44)
    {
      v17 = 0;
      for (i = 0; i < v44; ++i)
      {
        v55 = 0;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        *(_OWORD *)&buf[16] = 0u;
        v46 = 0u;
        *(_OWORD *)buf = 0u;
        v19 = (__int128 *)(v41[3] + v17);
        v20 = *v19;
        v21 = v19[1];
        v22 = v19[2];
        v47 = v19[3];
        *(_OWORD *)&buf[16] = v21;
        v46 = v22;
        v23 = v19[7];
        v25 = v19[4];
        v24 = v19[5];
        v50 = v19[6];
        v51 = v23;
        v48 = v25;
        v49 = v24;
        v27 = v19[9];
        v26 = v19[10];
        v28 = v19[8];
        v55 = *((_QWORD *)v19 + 22);
        v53 = v27;
        v54 = v26;
        v52 = v28;
        *(_OWORD *)buf = v20;
        v29 = -[ARKeyFrame initWithKeyframeData:featurePoints:referenceOriginTransform:]([ARKeyFrame alloc], "initWithKeyframeData:featurePoints:referenceOriginTransform:", buf, v11, a2, a3, a4, a5);
        objc_msgSend(a1, "addObject:", v29);

        v17 += 184;
      }
    }
  }
  ((void (*)(_QWORD *))v36)(v35);
  _Block_object_dispose(&v40, 8);
  if (v12)
    a1 = (void *)objc_opt_new();

  return a1;
}

uint64_t __82__ARWorldMap_keyframesForTrackingData_withFeaturePoints_referenceOriginTransform___block_invoke()
{
  return CV3DKeyframeWithPointsRelease();
}

- (simd_float3)center
{
  return *(simd_float3 *)self->_center;
}

- (simd_float3)extent
{
  return *(simd_float3 *)self->_extent;
}

- (NSArray)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(NSArray *)anchors
{
  objc_setProperty_nonatomic_copy(self, a2, anchors, 8);
}

- (ARPointCloud)rawFeaturePoints
{
  return self->_rawFeaturePoints;
}

- (int64_t)version
{
  return self->_version;
}

- (NSData)trackingData
{
  return self->_trackingData;
}

- (NSData)surfaceData
{
  return self->_surfaceData;
}

- (void)setSurfaceData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (__n128)referenceOriginTransform
{
  return a1[5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surfaceData, 0);
  objc_storeStrong((id *)&self->_trackingData, 0);
  objc_storeStrong((id *)&self->_rawFeaturePoints, 0);
  objc_storeStrong((id *)&self->_anchors, 0);
}

@end
