@implementation ARPlaneData

- (ARPlaneData)initWithDetectionResult:(CV3DPlaneDetectionPlaneList *)a3 detectionTypeMask:(unint64_t)a4 sceneUnderstandingEnabled:(BOOL)a5
{
  ARPlaneData *v8;
  ARCV3DPlaneDetectionPlaneList *v9;
  ARCV3DPlaneDetectionPlaneList *detectionResult;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  NSDictionary *v15;
  unint64_t i;
  const void *v17;
  void *v18;
  void *v19;
  NSDictionary *planeIdentifiers;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ARPlaneData;
  v8 = -[ARPlaneData init](&v22, sel_init);
  if (v8)
  {
    v9 = -[ARCV3DPlaneDetectionPlaneList initWithDetectionResult:]([ARCV3DPlaneDetectionPlaneList alloc], "initWithDetectionResult:", a3);
    detectionResult = v8->_detectionResult;
    v8->_detectionResult = v9;

    v8->_detectionTypeMask = a4;
    v8->_sceneUnderstandingEnabled = a5;
    *(double *)&v11 = ARVisionToRenderingCoordinateTransform();
    *(_OWORD *)v8->_anon_20 = v11;
    *(_OWORD *)&v8->_anon_20[16] = v12;
    *(_OWORD *)&v8->_anon_20[32] = v13;
    *(_OWORD *)&v8->_anon_20[48] = v14;
    v8->_applyPivotRotation = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.planeEstimation.anchorRotation"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[ARCV3DPlaneDetectionPlaneList numberOfPlanes](v8->_detectionResult, "numberOfPlanes"));
    v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < -[ARCV3DPlaneDetectionPlaneList numberOfPlanes](v8->_detectionResult, "numberOfPlanes"); ++i)
    {
      -[ARCV3DPlaneDetectionPlaneList planeAtIndex:](v8->_detectionResult, "planeAtIndex:", i);
      v17 = (const void *)CV3DPlaneDetectionPlaneCopyUUID();
      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithCFUUIDRef:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKey:](v15, "setObject:forKey:", v19, v18);

        CFRelease(v17);
      }
    }
    planeIdentifiers = v8->_planeIdentifiers;
    v8->_planeIdentifiers = v15;

  }
  return v8;
}

- (__n128)initWithDetectionResult:(__n128)a3 detectionTypeMask:(__n128)a4 sceneUnderstandingEnabled:(__n128)a5 renderingFromVision:(double)a6 atTimestamp:
{
  __n128 *result;

  result = (__n128 *)objc_msgSend(a1, "initWithDetectionResult:detectionTypeMask:sceneUnderstandingEnabled:");
  if (result)
  {
    result[2] = a2;
    result[3] = a3;
    result[4] = a4;
    result[5] = a5;
    result[6].n128_f64[0] = a6;
  }
  return result;
}

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(__n128)a6
{
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t i;
  NSUUID *v33;
  void *v34;
  uint64_t v35;
  const CV3DPlaneDetectionPlane *v36;
  uint64_t v37;
  ARPlaneAnchor *v38;
  int v39;
  void *v40;
  id v42;
  int v43;
  _BYTE v44[64];
  id v45;
  id v46;
  simd_float4x4 v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  id v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  *(__n128 *)&v44[32] = a8;
  *(__n128 *)&v44[48] = a9;
  *(__n128 *)v44 = a6;
  *(__n128 *)&v44[16] = a7;
  v65 = *MEMORY[0x1E0C80C00];
  v42 = a11;
  v46 = a12;
  if ((*(_BYTE *)(a1 + 104) & 3) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v14 = v42;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v54;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v54 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = v18;
            v20 = *(void **)(a1 + 8);
            objc_msgSend(v19, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKey:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v20) = v22 == 0;

            if ((v20 & 1) != 0)
            {
              if (_ARLogGeneral(void)::onceToken != -1)
                dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_55);
              v24 = (id)_ARLogGeneral(void)::logObj;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                v25 = (objc_class *)objc_opt_class();
                NSStringFromClass(v25);
                v26 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "identifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v59 = v26;
                v60 = 2048;
                v61 = a1;
                v62 = 2114;
                v63 = v27;
                _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Plane anchor removed by plane detection: %{public}@", buf, 0x20u);

              }
              objc_msgSend(v46, "addObject:", v19);
            }
            else
            {
              objc_msgSend(v19, "identifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "setObject:forKey:", v19, v23);

            }
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(*(id *)(a1 + 8), "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v50;
      v31 = *MEMORY[0x1E0D84210];
      v43 = *MEMORY[0x1E0D84218];
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v50 != v30)
            objc_enumerationMutation(v28);
          v33 = *(NSUUID **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v33, v42);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "unsignedLongValue");

          v36 = (const CV3DPlaneDetectionPlane *)objc_msgSend(*(id *)(a1 + 112), "planeAtIndex:", v35);
          if (!CV3DPlaneDetectionPlaneAge())
          {
            v37 = *(_QWORD *)(a1 + 104);
            if ((v37 & 1) == 0)
            {
              if ((v31 & CV3DPlaneDetectionPlaneGetOrientation()) != 0)
                continue;
              v37 = *(_QWORD *)(a1 + 104);
            }
            if ((v37 & 2) != 0 || (v43 & CV3DPlaneDetectionPlaneGetOrientation()) == 0)
            {
              objc_msgSend(v48, "objectForKey:", v33);
              v38 = (ARPlaneAnchor *)objc_claimAutoreleasedReturnValue();
              v47.columns[0] = *(simd_float4 *)(a1 + 32);
              v47.columns[1] = *(simd_float4 *)(a1 + 48);
              v47.columns[2] = *(simd_float4 *)(a1 + 64);
              v47.columns[3] = *(simd_float4 *)(a1 + 80);
              v39 = *(unsigned __int8 *)(a1 + 16);
              if (v38)
                ARUpdatePlaneAnchorFromCV3DPlane(v38, v36, *(simd_float4x4 *)v44, v47, v39 != 0, objc_msgSend((id)a1, "applyPivotRotation"), *(_QWORD *)(a1 + 104));
              else
                ARCreatePlaneAnchorFromCV3DPlane(v36, v33, *(simd_float4x4 *)v44, v47, v39 != 0, objc_msgSend((id)a1, "applyPivotRotation"), *(_QWORD *)(a1 + 104));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObject:", v40);

            }
          }
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v29);
    }

  }
  else
  {
    v45 = (id)MEMORY[0x1E0C9AA60];
  }

  return v45;
}

- (BOOL)applyPivotRotation
{
  return !ARLinkedOnOrAfterSydney() || self->_applyPivotRotation;
}

+ (float)_pivotForPlane:(CV3DPlaneDetectionPlane *)a3
{
  int v3;
  int Orientation;
  __int128 v5;
  float result;
  unsigned __int8 v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  float32x2_t v12;
  int32x2_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v3 = CV3DPlaneDetectionPlaneExtentOrientedBoundingBox();
  Orientation = CV3DPlaneDetectionPlaneGetOrientation();
  result = 0.0;
  if (Orientation == *MEMORY[0x1E0D84210] && v3 != 0)
  {
    v18 = v15;
    v19 = v16;
    v20 = v17;
    {
      pivotForOrientedBox(simd_float4x2)::k_cos45 = 1060439283;
    }
    v9 = 0;
    v10 = *(float *)&pivotForOrientedBox(simd_float4x2)::k_cos45;
    result = 0.0;
    do
    {
      v11 = v9 + 1;
      v12 = vsub_f32(*(float32x2_t *)((char *)&v18 + 8 * v9), *(float32x2_t *)((char *)&v18 + 8 * ((v9 + 1) & 3)));
      v13 = (int32x2_t)vmul_f32(v12, v12);
      *(float *)v13.i32 = sqrtf(vmlas_n_f32(*(float *)&v13.i32[1], v12.f32[0], v12.f32[0]));
      *(float32x2_t *)&v5 = vdiv_f32(v12, (float32x2_t)vdup_lane_s32(v13, 0));
      if (*(float *)&v5 >= v10)
      {
        v14 = v5;
        result = acosf(fminf(fmaxf(*(float *)&v5, -1.0), 1.0));
        *((_QWORD *)&v5 + 1) = *((_QWORD *)&v14 + 1);
        if (*((float *)&v14 + 1) < 0.0)
          result = -result;
      }
      v9 = v11;
    }
    while (v11 != 4);
  }
  return result;
}

+ (void)setSemanticsFromCV3D:(int)a3 labelProbabilities:(id)a4 sceneUnderstandingEnabled:(BOOL)a5 onPlane:(id)a6
{
  setSemanticsFromCV3D(a3, a4, a5, a6);
}

- (NSDictionary)tracingEntry
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  ARQATraceableDefaultEntryForResultData(self);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend((id)v3, "mutableCopy");

  LOBYTE(v3) = -[ARPlaneData detectionTypeMask](self, "detectionTypeMask");
  v5 = -[ARPlaneData detectionTypeMask](self, "detectionTypeMask");
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if ((v3 & 1) != 0)
    objc_msgSend(v6, "addObject:", CFSTR("Horizontal"));
  if ((v5 & 2) != 0)
    objc_msgSend(v7, "addObject:", CFSTR("Vertical"));
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("|"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("detectionType"));

  return (NSDictionary *)v4;
}

+ (float)_surfacePivotForPlane:(CV3DSurfaceDetectionPlane *)a3
{
  __int128 v3;
  float result;
  CV3DSurfaceDetectionRect *var5;
  uint64_t i;
  unsigned __int8 v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  float32x2_t v11;
  int32x2_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  result = 0.0;
  if (a3->var3 == 1)
  {
    var5 = a3->var5;
    if (var5)
    {
      for (i = 0; i != 4; ++i)
        *((float32x2_t *)&v14 + i) = vcvt_f32_f64(*((float64x2_t *)var5 + i));
      v17 = v14;
      v18 = v15;
      v19 = v16;
      {
        pivotForOrientedBox(simd_float4x2)::k_cos45 = 1060439283;
      }
      v8 = 0;
      v9 = *(float *)&pivotForOrientedBox(simd_float4x2)::k_cos45;
      result = 0.0;
      do
      {
        v10 = v8 + 1;
        v11 = vsub_f32(*(float32x2_t *)((char *)&v17 + 8 * v8), *(float32x2_t *)((char *)&v17 + 8 * ((v8 + 1) & 3)));
        v12 = (int32x2_t)vmul_f32(v11, v11);
        *(float *)v12.i32 = sqrtf(vmlas_n_f32(*(float *)&v12.i32[1], v11.f32[0], v11.f32[0]));
        *(float32x2_t *)&v3 = vdiv_f32(v11, (float32x2_t)vdup_lane_s32(v12, 0));
        if (*(float *)&v3 >= v9)
        {
          v13 = v3;
          result = acosf(fminf(fmaxf(*(float *)&v3, -1.0), 1.0));
          *((_QWORD *)&v3 + 1) = *((_QWORD *)&v13 + 1);
          if (*((float *)&v13 + 1) < 0.0)
            result = -result;
        }
        v8 = v10;
      }
      while (v10 != 4);
    }
  }
  return result;
}

+ (double)_surfaceToWorldTransformForPlane:(uint64_t)a3 pivot:(float64x2_t *)a4
{
  __float2 v5;
  float32x4_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[4];
  __int128 v22;

  if (a1 == 0.0)
    return ARMatrix4x4MakeColumnMajorTransformFromArray(a4 + 3);
  v5 = __sincosf_stret(a1 * 0.5);
  v6 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFF70, v5.__sinval);
  v6.i32[3] = LODWORD(v5.__cosval);
  *(double *)&v7 = simd_matrix4x4(v6);
  v17 = v8;
  v18 = v7;
  v19 = v10;
  v20 = v9;
  *(double *)v11.i64 = ARMatrix4x4MakeColumnMajorTransformFromArray(a4 + 3);
  v15 = 0;
  v21[0] = v18;
  v21[1] = v17;
  v21[2] = v20;
  v21[3] = v19;
  do
  {
    *(__int128 *)((char *)&v22 + v15 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(v21[v15])), v12, *(float32x2_t *)&v21[v15], 1), v13, (float32x4_t)v21[v15], 2), v14, (float32x4_t)v21[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  return *(double *)&v22;
}

+ (id)anchorForDetectionResult:(CV3DSurfaceDetectionResult *)a3
{
  void *v5;
  unint64_t v6;
  CV3DSurfaceDetectionPlane *v7;
  _BOOL8 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  ARPlaneAnchor *v27;
  void *v28;
  ARPlaneAnchor *v29;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  __int128 v35;
  double v36;
  __int128 v37;
  double v38;
  __int128 v39;
  double v40;
  __int128 v41;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3->var1)
  {
    v6 = 0;
    do
    {
      v7 = &a3->var0[v6];
      v8 = v7->var3 != 1;
      objc_msgSend(a1, "_surfacePivotForPlane:", v7);
      objc_msgSend(a1, "_surfaceToWorldTransformForPlane:pivot:", v7);
      v39 = v10;
      v41 = v9;
      v35 = v12;
      v37 = v11;
      *(double *)v13.i64 = ARVisionToRenderingCoordinateTransform();
      v33 = v14;
      v34 = v13;
      v31 = v16;
      v32 = v15;
      *(double *)&v17 = ARRenderingToVisionCoordinateTransform();
      v21 = 0;
      v43 = v41;
      v44 = v39;
      v45 = v37;
      v46 = v35;
      do
      {
        *(float32x4_t *)((char *)&v47 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v34, COERCE_FLOAT(*(__int128 *)((char *)&v43 + v21))), v33, *(float32x2_t *)((char *)&v43 + v21), 1), v32, *(float32x4_t *)((char *)&v43 + v21), 2), v31, *(float32x4_t *)((char *)&v43 + v21), 3);
        v21 += 16;
      }
      while (v21 != 64);
      v22 = 0;
      v23 = v47;
      v24 = v48;
      v25 = v49;
      v26 = v50;
      v43 = v17;
      v44 = v18;
      v45 = v19;
      v46 = v20;
      do
      {
        *(float32x4_t *)((char *)&v47 + v22) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(__int128 *)((char *)&v43 + v22))), v24, *(float32x2_t *)((char *)&v43 + v22), 1), v25, *(float32x4_t *)((char *)&v43 + v22), 2), v26, *(float32x4_t *)((char *)&v43 + v22), 3);
        v22 += 16;
      }
      while (v22 != 64);
      v40 = *(double *)v48.i64;
      v42 = *(double *)v47.i64;
      v36 = *(double *)v50.i64;
      v38 = *(double *)v49.i64;
      v27 = [ARPlaneAnchor alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "ar_zeroUUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[ARPlaneAnchor initWithIdentifier:transform:alignment:](v27, "initWithIdentifier:transform:alignment:", v28, v8, v42, v40, v38, v36);

      objc_msgSend(v5, "addObject:", v29);
      ++v6;
    }
    while (v6 < a3->var1);
  }
  return v5;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)detectionTypeMask
{
  return self->_detectionTypeMask;
}

- (ARCV3DPlaneDetectionPlaneList)detectionResult
{
  return self->_detectionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionResult, 0);
  objc_storeStrong((id *)&self->_planeIdentifiers, 0);
}

@end
