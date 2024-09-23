@implementation ARReferenceObject

- (ARReferenceObject)initWithTrackingData:(__n128)a3 referenceOriginTransform:(__n128)a4
{
  id v8;
  ARReferenceObject *v9;
  ARReferenceObject *v10;
  uint64_t v11;
  NSData *trackingData;
  uint64_t v13;
  ARPointCloud *rawFeaturePoints;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  NSUUID *identifier;
  NSString *resourceGroupName;
  objc_super v25;

  v8 = a7;
  v25.receiver = a1;
  v25.super_class = (Class)ARReferenceObject;
  v9 = -[ARReferenceObject init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_version = 1;
    v11 = objc_msgSend(v8, "copy");
    trackingData = v10->_trackingData;
    v10->_trackingData = (NSData *)v11;

    *(__n128 *)&v10[1].super.isa = a2;
    *(__n128 *)&v10[1]._name = a3;
    *(__n128 *)&v10[1]._rawFeaturePoints = a4;
    *(__n128 *)&v10[1]._version = a5;
    +[ARWorldMap featurePointsForTrackingData:referenceOriginTransform:](ARWorldMap, "featurePointsForTrackingData:referenceOriginTransform:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    rawFeaturePoints = v10->_rawFeaturePoints;
    v10->_rawFeaturePoints = (ARPointCloud *)v13;

    -[ARPointCloud computeBounds](v10->_rawFeaturePoints, "computeBounds");
    *(_OWORD *)v10->_center = v15;
    *(_OWORD *)v10->_extent = v16;
    objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithData:", v8);
    v17 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v17;

    resourceGroupName = v10->_resourceGroupName;
    v10->_resourceGroupName = 0;

  }
  return v10;
}

- (simd_float3)scale
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;

  v2 = vmulq_f32(*(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&self[1].super.isa);
  v3 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1)));
  v4 = vmulq_f32(*(float32x4_t *)&self[1]._name, *(float32x4_t *)&self[1]._name);
  v5 = vmulq_f32(*(float32x4_t *)&self[1]._rawFeaturePoints, *(float32x4_t *)&self[1]._rawFeaturePoints);
  v3.f32[0] = sqrtf(v3.f32[0]);
  v3.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2), vaddq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 1))).f32[0]);
  v3.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0]);
  return (simd_float3)vmulq_laneq_f32(v3, *(float32x4_t *)&self[1]._version, 3);
}

- (ARReferenceObject)initWithArchiveData:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  ARArchive *v10;
  ARReferenceObject *v11;

  v8 = a4;
  v9 = a3;
  v10 = -[ARArchive initWithData:error:]([ARArchive alloc], "initWithData:error:", v9, a5);

  v11 = -[ARReferenceObject initWithArchive:name:error:](self, "initWithArchive:name:error:", v10, v8, a5);
  return v11;
}

- (ARReferenceObject)initWithArchiveURL:(NSURL *)url error:(NSError *)error
{
  NSURL *v6;
  ARArchive *v7;
  void *v8;
  void *v9;
  ARReferenceObject *v10;

  v6 = url;
  v7 = -[ARArchive initWithContentsOfURL:error:]([ARArchive alloc], "initWithContentsOfURL:error:", v6, error);
  if (v7)
  {
    -[NSURL lastPathComponent](v6, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingPathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ARReferenceObject initWithArchive:name:error:](self, "initWithArchive:name:error:", v7, v9, error);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (ARReferenceObject)initWithArchive:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  ARReferenceObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  __n128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_class *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  ARReferenceObject *v36;
  ARReferenceObject *v37;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  _OWORD v43[4];
  uint8_t buf[32];
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(v8, "dataForResourceAtPath:", CFSTR("Info.plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v12 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;

    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Version"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    if (v15 < 2)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TrackingDataReference"));
      v16 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v8, "dataForResourceAtPath:", v16), (v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v20 = v19;
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ReferenceOrigin"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = ARMatrix4x4FromDictionary(v21);
          +[ARWorldMap boundsForTrackingData:](ARWorldMap, "boundsForTrackingData:", v20, v27, v28, v25, v26, v23, v24, *(_OWORD *)&v22);
        }
        else
        {
          +[ARWorldMap boundsForTrackingData:](ARWorldMap, "boundsForTrackingData:", v20, *(_QWORD *)(MEMORY[0x1E0C83FF0] + 48), *(_QWORD *)(MEMORY[0x1E0C83FF0] + 56), *(_QWORD *)(MEMORY[0x1E0C83FF0] + 32), *(_QWORD *)(MEMORY[0x1E0C83FF0] + 40), *(_QWORD *)(MEMORY[0x1E0C83FF0] + 16), *(_QWORD *)(MEMORY[0x1E0C83FF0] + 24), *MEMORY[0x1E0C83FF0], *(_QWORD *)(MEMORY[0x1E0C83FF0] + 8));
        }
        ARMatrix4x4FromRotationAndTranslation();
        v31 = 0;
        v43[0] = v32;
        v43[1] = v33;
        v43[2] = v34;
        v43[3] = v35;
        memset(buf, 0, sizeof(buf));
        v45 = 0u;
        v46 = 0u;
        do
        {
          *(float32x4_t *)&buf[v31 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, COERCE_FLOAT(v43[v31])), v41, *(float32x2_t *)&v43[v31], 1), v40, (float32x4_t)v43[v31], 2), v39, (float32x4_t)v43[v31], 3);
          ++v31;
        }
        while (v31 != 4);
        v36 = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](self, "initWithTrackingData:referenceOriginTransform:", v20, *(double *)buf, *(double *)&buf[16], *(double *)&v45, *(double *)&v46);
        v37 = v36;
        if (v36)
        {
          v36->_version = v15;
          objc_storeStrong((id *)&v36->_name, a4);
        }
        self = v37;

        v13 = self;
      }
      else
      {
        if (a5)
        {
          ARErrorWithCodeAndUserInfo(301, 0);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        _ARLogGeneral_31();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = self;
          _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading reference object: Malformed data", buf, 0x16u);

        }
        v13 = 0;
      }

    }
    else
    {
      if (a5)
      {
        ARErrorWithCodeAndUserInfo(301, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      _ARLogGeneral_31();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = v15;
        _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading reference object: Unsupported object version (%ld)", buf, 0x20u);

      }
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)exportObjectToURL:(NSURL *)url previewImage:(UIImage *)previewImage error:(NSError *)error
{
  NSURL *v8;
  void *v9;

  v8 = url;
  -[ARReferenceObject writeToArchiveWithPreviewImage:error:](self, "writeToArchiveWithPreviewImage:error:", previewImage, error);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(error) = objc_msgSend(v9, "writeToURL:error:", v8, error);

  return (char)error;
}

- (id)exportObjectToMemoryWithPreviewImage:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[ARReferenceObject writeToArchiveWithPreviewImage:error:](self, "writeToArchiveWithPreviewImage:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataRepresentation");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a4 && !v6)
  {
    v12 = *MEMORY[0x1E0CB2D68];
    ARKitCoreBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Unable to create archive."), &stru_1E6676798, CFSTR("Localizable_iOS"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    ARErrorWithCodeAndUserInfo(500, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)writeToArchiveWithPreviewImage:(id)a3 error:(id *)a4
{
  return 0;
}

- (ARReferenceObject)referenceObjectByApplyingTransform:(simd_float4x4)transform
{
  ARReferenceObject *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  ARReferenceObject *v11;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  _OWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  simd_float4x4 v23;

  v4 = [ARReferenceObject alloc];
  -[ARReferenceObject trackingData](self, "trackingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = __invert_f4(transform);
  v16 = (float32x4_t)v23.columns[1];
  v17 = (float32x4_t)v23.columns[0];
  v14 = (float32x4_t)v23.columns[3];
  v15 = (float32x4_t)v23.columns[2];
  -[ARReferenceObject referenceOriginTransform](self, "referenceOriginTransform");
  v6 = 0;
  v18[0] = v7;
  v18[1] = v8;
  v18[2] = v9;
  v18[3] = v10;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  do
  {
    *(__int128 *)((char *)&v19 + v6 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(v18[v6])), v16, *(float32x2_t *)&v18[v6], 1), v15, (float32x4_t)v18[v6], 2), v14, (float32x4_t)v18[v6], 3);
    ++v6;
  }
  while (v6 != 4);
  v11 = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](v4, "initWithTrackingData:referenceOriginTransform:", v5, *(double *)&v19, *(double *)&v20, *(double *)&v21, *(double *)&v22);

  return v11;
}

- (ARReferenceObject)referenceObjectByMergingObject:(ARReferenceObject *)object error:(NSError *)error
{
  ARReferenceObject *v6;
  void *v7;
  void *v8;
  int v9;
  ARReferenceObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  ARReferenceObject *v22;
  void *v23;
  NSError *v24;
  int v26;
  void *v27;
  __int16 v28;
  ARReferenceObject *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = object;
  -[ARReferenceObject trackingData](v6, "trackingData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARReferenceObject trackingData](self, "trackingData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v10 = [ARReferenceObject alloc];
    -[ARReferenceObject trackingData](self, "trackingData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARReferenceObject referenceOriginTransform](self, "referenceOriginTransform");
    error = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](v10, "initWithTrackingData:referenceOriginTransform:", v11);

    -[ARReferenceObject name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(error, "setName:", v12);
  }
  else
  {
    v12 = (void *)objc_opt_new();
    -[ARReferenceObject trackingData](self, "trackingData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARReferenceObject trackingData](v6, "trackingData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CV3DVIOAlignAndMergeMaps();

    if (v15 || !objc_msgSend(v12, "length"))
    {
      _ARLogGeneral_31();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARReferenceObject description](self, "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARReferenceObject description](v6, "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138544386;
        v27 = v18;
        v28 = 2048;
        v29 = self;
        v30 = 2114;
        v31 = v19;
        v32 = 2114;
        v33 = v20;
        v34 = 1024;
        v35 = v15;
        _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to merge reference object %{public}@ with %{public}@ (%u)", (uint8_t *)&v26, 0x30u);

      }
      if (error)
      {
        if (v15 == 19)
          v21 = 301;
        else
          v21 = 401;
        ARErrorWithCodeAndUserInfo(v21, 0);
        v24 = (NSError *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *error = v24;

        error = 0;
      }
    }
    else
    {
      v22 = [ARReferenceObject alloc];
      -[ARReferenceObject referenceOriginTransform](self, "referenceOriginTransform");
      error = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](v22, "initWithTrackingData:referenceOriginTransform:", v12);
      -[ARReferenceObject name](self, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(error, "setName:", v23);

    }
  }

  return (ARReferenceObject *)error;
}

- (NSSet)keyframes
{
  NSSet *keyframes;
  void *v4;
  ARPointCloud *rawFeaturePoints;
  NSSet *v6;
  NSSet *v7;

  keyframes = self->_keyframes;
  if (!keyframes)
  {
    -[ARReferenceObject trackingData](self, "trackingData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    rawFeaturePoints = self->_rawFeaturePoints;
    -[ARReferenceObject referenceOriginTransform](self, "referenceOriginTransform");
    +[ARWorldMap keyframesForTrackingData:withFeaturePoints:referenceOriginTransform:](ARWorldMap, "keyframesForTrackingData:withFeaturePoints:referenceOriginTransform:", v4, rawFeaturePoints);
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_keyframes;
    self->_keyframes = v6;

    keyframes = self->_keyframes;
  }
  return keyframes;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  __n128 v8;
  void *v9;
  __n128 v10;
  void *v11;
  void *v12;
  __n128 v13;
  __n128 v14;

  -[ARReferenceObject name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ARReferenceObject name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARReferenceObject center](self, "center");
    ARVector3Description(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARReferenceObject extent](self, "extent");
    ARVector3Description(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p name=\"%@\" center=%@ extent=%@>"), v6, self, v7, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ARReferenceObject center](self, "center");
    ARVector3Description(v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARReferenceObject extent](self, "extent");
    ARVector3Description(v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p center=%@ extent=%@>"), v6, self, v7, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  void *v14;
  void *v15;
  char v16;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ARReferenceObject referenceOriginTransform](self, "referenceOriginTransform");
    v20 = v7;
    v21 = v6;
    v18 = v9;
    v19 = v8;
    objc_msgSend(v5, "referenceOriginTransform");
    if (AREqualTransforms(v21, v20, v19, v18, v10, v11, v12, v13))
    {
      objc_msgSend(v5, "trackingData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARReferenceObject trackingData](self, "trackingData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARReferenceObject version](self, "version"), CFSTR("version"));
  -[ARReferenceObject trackingData](self, "trackingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("trackingData"));

  -[ARReferenceObject referenceOriginTransform](self, "referenceOriginTransform");
  objc_msgSend(v4, "ar_encodeMatrix4x4:forKey:", CFSTR("referenceOriginTransform"));
  -[ARReferenceObject name](self, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

}

- (ARReferenceObject)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  ARReferenceObject *v10;
  ARReferenceObject *v11;
  uint64_t v12;
  NSString *name;
  ARReferenceObject *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  ARReferenceObject *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  if (v5 >= 2)
  {
    ARErrorWithCodeAndUserInfo(301, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v6);

    _ARLogGeneral_31();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v9;
      v22 = 2048;
      v23 = self;
      v24 = 2048;
      v25 = v5;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading reference object: Unsupported object version (%ld)", (uint8_t *)&v20, 0x20u);

    }
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingData"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    ARErrorWithCodeAndUserInfo(301, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v15);

    _ARLogGeneral_31();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2048;
      v23 = self;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading reference object: Malformed data", (uint8_t *)&v20, 0x16u);

    }
    goto LABEL_11;
  }
  objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("referenceOriginTransform"));
  v10 = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](self, "initWithTrackingData:referenceOriginTransform:", v7);
  v11 = v10;
  if (v10)
  {
    v10->_version = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v12 = objc_claimAutoreleasedReturnValue();
    name = v11->_name;
    v11->_name = (NSString *)v12;

  }
  self = v11;
  v14 = self;
LABEL_12:

  return v14;
}

+ (id)referenceObjectsInGroupNamed:(id)a3 catalog:(id)a4
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  ARReferenceObject *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  id v38;
  id v39;
  void *v40;
  float32x4_t v41;
  float32x4_t v42;
  double v43;
  double v44;
  float32x4_t v45;
  double v46;
  float32x4_t v47;
  double v48;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _OWORD v57[4];
  _BYTE v58[128];
  uint8_t buf[32];
  __int128 v60;
  double v61[3];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  objc_msgSend(a4, "namedRecognitionGroupWithName:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v38 = (id)objc_opt_new();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v5, "namedRecognitionObjectObjectList");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v54;
      v40 = v5;
      v50 = *(_QWORD *)v54;
      v51 = v6;
      do
      {
        v10 = 0;
        v52 = v8;
        do
        {
          if (*(_QWORD *)v54 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v5;
            objc_msgSend(v5, "recognitionObjectWithName:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13
              && (objc_msgSend(v13, "objectData"),
                  v15 = (void *)objc_claimAutoreleasedReturnValue(),
                  v15,
                  v15))
            {
              v16 = objc_msgSend(v14, "version");
              if (v16 < 2)
              {
                objc_msgSend(v14, "objectData");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                +[ARWorldMap boundsForTrackingData:](ARWorldMap, "boundsForTrackingData:", v23);

                objc_msgSend(v14, "referenceOriginTransformation");
                v45 = v25;
                v47 = v24;
                v41 = v27;
                v42 = v26;
                ARMatrix4x4FromRotationAndTranslation();
                v28 = 0;
                v57[0] = v29;
                v57[1] = v30;
                v57[2] = v31;
                v57[3] = v32;
                memset(buf, 0, sizeof(buf));
                v60 = 0u;
                *(_OWORD *)v61 = 0u;
                do
                {
                  *(float32x4_t *)&buf[v28 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(v57[v28])), v45, *(float32x2_t *)&v57[v28], 1), v42, (float32x4_t)v57[v28], 2), v41, (float32x4_t)v57[v28], 3);
                  ++v28;
                }
                while (v28 != 4);
                v46 = *(double *)&v60;
                v48 = v61[0];
                v43 = *(double *)buf;
                v44 = *(double *)&buf[16];
                v33 = [ARReferenceObject alloc];
                objc_msgSend(v14, "objectData");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](v33, "initWithTrackingData:referenceOriginTransform:", v34, v43, v44, v46, v48);

                -[NSObject setName:](v18, "setName:", v11);
                -[NSObject setResourceGroupName:](v18, "setResourceGroupName:", v39);
                objc_msgSend(v38, "addObject:", v18);
                v12 = v40;
                v9 = v50;
                v6 = v51;
              }
              else
              {
                v17 = v16;
                _ARLogGeneral_31();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  v19 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v19);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  *(_QWORD *)&buf[4] = v20;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = a1;
                  *(_WORD *)&buf[22] = 2114;
                  *(_QWORD *)&buf[24] = v11;
                  LOWORD(v60) = 2048;
                  *(_QWORD *)((char *)&v60 + 2) = v17;
                  _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading reference object %{public}@: Unsupported object version (%ld)", buf, 0x2Au);

                  v9 = v50;
                  v12 = v40;
                }
LABEL_15:
                v6 = v51;
              }
            }
            else
            {
              _ARLogGeneral_31();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                v21 = (objc_class *)objc_opt_class();
                NSStringFromClass(v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v22;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = a1;
                v9 = v50;
                *(_WORD *)&buf[22] = 2114;
                *(_QWORD *)&buf[24] = v11;
                _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Invalid reference object in catalog: %{public}@", buf, 0x20u);

                goto LABEL_15;
              }
            }

            v8 = v52;
            v5 = v12;
          }
          ++v10;
        }
        while (v10 != v8);
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v8);
    }
  }
  else
  {
    _ARLogGeneral_31();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v39;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No resource group with name \"%{public}@\" found", buf, 0x20u);

    }
    v38 = 0;
  }

  return v38;
}

- (void)setResourceGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_resourceGroupName, a3);
}

+ (NSSet)referenceObjectsInGroupNamed:(NSString *)name bundle:(NSBundle *)bundle
{
  NSBundle *v5;
  NSString *v6;
  void *v7;

  v5 = bundle;
  v6 = name;
  objc_msgSend((id)objc_opt_class(), "referenceObjectsInGroupNamed:catalogName:bundle:", v6, CFSTR("Assets"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v7;
}

+ (id)referenceObjectsInGroupNamed:(id)a3 catalogName:(id)a4 bundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1A6A8]), "initWithName:fromBundle:error:", v9, v10, &v18);
  v12 = v18;
  if (v12)
  {
    _ARLogGeneral_31();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v20 = v15;
      v21 = 2048;
      v22 = a1;
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error while opening catalog named \"%{public}@\" in bundle \"%{public}@\": %@", buf, 0x34u);

    }
    v16 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "referenceObjectsInGroupNamed:catalog:", v8, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (id)referenceObjectsInGroupNamed:(id)a3 catalogURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1A6A8]), "initWithURL:error:", v7, &v15);
  v9 = v15;
  if (v9)
  {
    _ARLogGeneral_31();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v17 = v12;
      v18 = 2048;
      v19 = a1;
      v20 = 2114;
      v21 = v6;
      v22 = 2114;
      v23 = v7;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error while opening catalog named \"%{public}@\" from URL \"%{public}@\": %@", buf, 0x34u);

    }
    v13 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "referenceObjectsInGroupNamed:catalog:", v6, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 16);
}

- (simd_float3)center
{
  return *(simd_float3 *)self->_center;
}

- (simd_float3)extent
{
  return *(simd_float3 *)self->_extent;
}

- (NSString)resourceGroupName
{
  return self->_resourceGroupName;
}

- (ARPointCloud)rawFeaturePoints
{
  return self->_rawFeaturePoints;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)version
{
  return self->_version;
}

- (NSData)trackingData
{
  return self->_trackingData;
}

- (__n128)referenceOriginTransform
{
  return a1[6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rawFeaturePoints, 0);
  objc_storeStrong((id *)&self->_resourceGroupName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_keyframes, 0);
}

@end
