@implementation ARFrame

- (ARFrame)initWithCamera:(id)a3 timestamp:(double)a4
{
  id v7;
  ARFrame *v8;
  ARFrame *v9;
  NSArray *anchors;
  NSArray *v11;
  NSArray *privateAnchors;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  NSArray *detectedBodies;
  NSArray *detectedPersonMetadata;
  objc_super v21;

  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ARFrame;
  v8 = -[ARFrame init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_timestamp = a4;
    objc_storeStrong((id *)&v8->_camera, a3);
    anchors = v9->_anchors;
    v11 = (NSArray *)MEMORY[0x1E0C9AA60];
    v9->_anchors = (NSArray *)MEMORY[0x1E0C9AA60];

    privateAnchors = v9->_privateAnchors;
    v9->_privateAnchors = v11;

    v9->_worldMappingStatus = 0;
    v13 = MEMORY[0x1E0C83FF0];
    v14 = *MEMORY[0x1E0C83FF0];
    v15 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    *(_OWORD *)v9->_anon_1f0 = *MEMORY[0x1E0C83FF0];
    *(_OWORD *)&v9->_anon_1f0[16] = v15;
    v16 = *(_OWORD *)(v13 + 32);
    v17 = *(_OWORD *)(v13 + 48);
    *(_OWORD *)&v9->_anon_1f0[32] = v16;
    *(_OWORD *)&v9->_anon_1f0[48] = v17;
    *(_OWORD *)v9->_anon_230 = v14;
    *(_OWORD *)&v9->_anon_230[16] = v15;
    *(_OWORD *)&v9->_anon_230[32] = v16;
    *(_OWORD *)&v9->_anon_230[48] = v17;
    *(_OWORD *)v9->_anon_270 = v14;
    *(_OWORD *)&v9->_anon_270[16] = v15;
    *(_OWORD *)&v9->_anon_270[32] = v16;
    *(_OWORD *)&v9->_anon_270[48] = v17;
    *(_OWORD *)&v9[1]._shouldRestrictFrameRate = v16;
    *(_OWORD *)&v9[1]._segmentationBuffer = v17;
    *(_OWORD *)&v9[1].super.isa = v14;
    *(_OWORD *)&v9[1]._cachedVerticalPlaneAnchors = v15;
    detectedBodies = v9->_detectedBodies;
    v9->_detectedBodies = v11;

    detectedPersonMetadata = v9->_detectedPersonMetadata;
    v9->_detectedPersonMetadata = v11;

    kdebug_trace();
  }

  return v9;
}

- (ARFrame)initWithTimestamp:(double)a3 context:(id)a4
{
  id v6;
  void *v7;
  id v8;
  ARFrame *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *tiffData;
  double v17;
  uint64_t v18;
  NSDate *captureDate;
  uint64_t v20;
  AVDepthData *capturedDepthData;
  uint64_t v22;
  ARPointCloud *capturedPointCloudData;
  double v24;
  uint64_t v25;
  ARFaceData *faceData;
  double v27;
  double v28;
  double v29;
  void *v30;
  float v31;
  uint64_t v32;
  MTLTexture *cameraGrainTexture;
  void *v34;
  void *v35;
  double v36;
  ARCamera *v37;
  ARCamera *ultraWideCamera;
  uint64_t v39;
  void *v40;
  float v41;
  double v42;
  double v43;
  double v44;
  float v45;

  v6 = a4;
  objc_msgSend(v6, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ARCamera initFromImageData:]([ARCamera alloc], "initFromImageData:", v7);
  v9 = -[ARFrame initWithCamera:timestamp:](self, "initWithCamera:timestamp:", v8, a3);
  if (v9)
  {
    v9->_capturedImage = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v7, "pixelBuffer"));
    objc_msgSend(v7, "exifData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v9->_exifData, v13);

    objc_msgSend(v7, "tiffData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    tiffData = v9->_tiffData;
    v9->_tiffData = (NSDictionary *)v15;

    v9->_highResolution = objc_msgSend(v7, "isHighResolution");
    v9->_deviceOrientation = objc_msgSend(v7, "deviceOrientation");
    objc_msgSend(v7, "currentCaptureTimestamp");
    v9->_currentCaptureTimestamp = v17;
    objc_msgSend(v7, "captureDate");
    v18 = objc_claimAutoreleasedReturnValue();
    captureDate = v9->_captureDate;
    v9->_captureDate = (NSDate *)v18;

    objc_msgSend(v7, "depthData");
    v20 = objc_claimAutoreleasedReturnValue();
    capturedDepthData = v9->_capturedDepthData;
    v9->_capturedDepthData = (AVDepthData *)v20;

    objc_msgSend(v7, "pointCloud");
    v22 = objc_claimAutoreleasedReturnValue();
    capturedPointCloudData = v9->_capturedPointCloudData;
    v9->_capturedPointCloudData = (ARPointCloud *)v22;

    objc_msgSend(v7, "depthDataTimestamp");
    v9->_capturedDepthDataTimestamp = v24;
    objc_msgSend(v7, "faceData");
    v25 = objc_claimAutoreleasedReturnValue();
    faceData = v9->_faceData;
    v9->_faceData = (ARFaceData *)v25;

    v9->_renderFramesPerSecond = objc_msgSend(v7, "captureFramesPerSecond");
    v9->_worldAlignment = objc_msgSend(v6, "worldAlignment");
    if (objc_msgSend(v7, "pixelBuffer") && (objc_msgSend(v7, "isHighResolution") & 1) == 0)
    {
      objc_msgSend(v8, "imageResolution");
      v28 = v27;
      objc_msgSend(v8, "imageResolution");
      +[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:](ARImageNoiseTexture, "sharedInstanceForCameraPosition:longEdgeImageResolution:", objc_msgSend(v7, "cameraPosition"), fmax(v28, v29));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "signalToNoiseRatio");
      objc_msgSend(v30, "snrToNoiseIntensity:");
      v9->_cameraGrainIntensity = v31;
      objc_msgSend(v30, "texture");
      v32 = objc_claimAutoreleasedReturnValue();
      cameraGrainTexture = v9->_cameraGrainTexture;
      v9->_cameraGrainTexture = (MTLTexture *)v32;

      v9->_imageNoiseIntensity = v9->_cameraGrainIntensity;
      objc_storeStrong((id *)&v9->_imageNoiseTexture, v9->_cameraGrainTexture);

    }
    objc_msgSend(v7, "latestUltraWideImage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      v9->_capturedUltraWideImage = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v34, "pixelBuffer"));
      objc_msgSend(v35, "timestamp");
      v9->_ultraWideImageTimestamp = v36;
      v37 = -[ARCamera initFromImageData:]([ARCamera alloc], "initFromImageData:", v35);
      ultraWideCamera = v9->_ultraWideCamera;
      v9->_ultraWideCamera = v37;

    }
    v39 = objc_msgSend(v8, "devicePosition");
    objc_msgSend(v7, "cameraType");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ISO");
    v42 = v41;
    objc_msgSend(v7, "exposureDuration");
    v44 = v43;
    objc_msgSend(v7, "exposureTargetOffset");
    v9->_estimatedLuminance = AREstimatedSceneLuminanceForCamera(v39, v40, v42, v44, v45);

  }
  return v9;
}

- (void)setCapturedImage:(__CVBuffer *)a3
{
  __CVBuffer *capturedImage;

  capturedImage = self->_capturedImage;
  if (capturedImage != a3)
  {
    CVPixelBufferRelease(capturedImage);
    self->_capturedImage = CVPixelBufferRetain(a3);
  }
}

- (void)setSegmentationBuffer:(__CVBuffer *)a3
{
  __CVBuffer *segmentationBuffer;

  segmentationBuffer = self->_segmentationBuffer;
  if (segmentationBuffer != a3)
  {
    CVPixelBufferRelease(segmentationBuffer);
    self->_segmentationBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setEstimatedDepthData:(__CVBuffer *)a3
{
  __CVBuffer *estimatedDepthData;

  estimatedDepthData = self->_estimatedDepthData;
  if (estimatedDepthData != a3)
  {
    CVPixelBufferRelease(estimatedDepthData);
    self->_estimatedDepthData = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setDepthConfidenceData:(__CVBuffer *)a3
{
  __CVBuffer *depthConfidenceData;

  depthConfidenceData = self->_depthConfidenceData;
  if (depthConfidenceData != a3)
  {
    CVPixelBufferRelease(depthConfidenceData);
    self->_depthConfidenceData = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setDepthNormalData:(__CVBuffer *)a3
{
  __CVBuffer *depthNormalData;

  depthNormalData = self->_depthNormalData;
  if (depthNormalData != a3)
  {
    CVPixelBufferRelease(depthNormalData);
    self->_depthNormalData = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setSemanticSegmentationBuffer:(__CVBuffer *)a3
{
  __CVBuffer *semanticSegmentationBuffer;

  semanticSegmentationBuffer = self->_semanticSegmentationBuffer;
  if (semanticSegmentationBuffer != a3)
  {
    CVPixelBufferRelease(semanticSegmentationBuffer);
    self->_semanticSegmentationBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setDownSampledMattingPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *downSampledMattingPixelBuffer;

  downSampledMattingPixelBuffer = self->_downSampledMattingPixelBuffer;
  if (downSampledMattingPixelBuffer != a3)
  {
    CVPixelBufferRelease(downSampledMattingPixelBuffer);
    self->_downSampledMattingPixelBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setMattingScaleImagePixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *mattingScaleImagePixelBuffer;

  mattingScaleImagePixelBuffer = self->_mattingScaleImagePixelBuffer;
  if (mattingScaleImagePixelBuffer != a3)
  {
    CVPixelBufferRelease(mattingScaleImagePixelBuffer);
    self->_mattingScaleImagePixelBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (ARBody2D)detectedBody
{
  void *v2;
  void *v3;

  -[ARFrame detectedBodies](self, "detectedBodies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ARBody2D *)v3;
}

- (void)dealloc
{
  objc_super v3;

  kdebug_trace();
  CVPixelBufferRelease(self->_capturedImage);
  CVPixelBufferRelease(self->_capturedUltraWideImage);
  CVPixelBufferRelease(self->_segmentationBuffer);
  CVPixelBufferRelease(self->_estimatedDepthData);
  CVPixelBufferRelease(self->_downSampledMattingPixelBuffer);
  CVPixelBufferRelease(self->_mattingScaleImagePixelBuffer);
  CVPixelBufferRelease(self->_depthConfidenceData);
  CVPixelBufferRelease(self->_depthNormalData);
  CVPixelBufferRelease(self->_semanticSegmentationBuffer);
  CGImageRelease(self->_depthMap);
  v3.receiver = self;
  v3.super_class = (Class)ARFrame;
  -[ARFrame dealloc](&v3, sel_dealloc);
}

- (double)transformPointToNDCSpace:(double)a3
{
  float v3;
  float v4;
  void *v5;
  float32x4_t v6;
  double result;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float v12;
  float v13;
  simd_float4x4 v14;
  simd_float4x4 v15;

  v3 = a2;
  v13 = (float)(v3 * 2.0) + -1.0;
  v4 = a3;
  v12 = (float)(v4 * -2.0) + 1.0;
  objc_msgSend(a1, "camera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "projectionMatrix");
  v15 = __invert_f4(v14);
  v8 = (float32x4_t)v15.columns[0];
  v9 = (float32x4_t)v15.columns[1];
  v10 = (float32x4_t)v15.columns[3];
  v11 = (float32x4_t)v15.columns[2];

  v6 = vaddq_f32(v10, vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v8, v13), v9, v12), (float32x4_t)0, v11));
  *(_QWORD *)&result = vdivq_f32(v6, (float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 3)).u64[0];
  return result;
}

- (NSArray)hitTest:(CGPoint)point types:(ARHitTestResultType)types
{
  void *v6;
  void *v7;

  -[ARFrame transformPointToNDCSpace:](self, "transformPointToNDCSpace:", point.x, point.y);
  -[ARFrame camera](self, "camera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transform");

  -[ARFrame camera](self, "camera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transform");

  return (NSArray *)-[ARFrame _hitTestFromOrigin:withDirection:types:](self, "_hitTestFromOrigin:withDirection:types:", types);
}

- (ARRaycastQuery)raycastQueryFromPoint:(CGPoint)point allowingTarget:(ARRaycastTarget)target alignment:(ARRaycastTargetAlignment)alignment
{
  float32x4_t v8;
  void *v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  void *v14;
  float32x4_t v15;
  float32x4_t v16;
  int32x4_t v17;
  float32x2_t v18;
  float32x2_t v19;
  ARRaycastQuery *v20;
  void *v21;
  double v22;
  ARRaycastQuery *v23;
  float32x4_t v25;
  float32x4_t v26;

  -[ARFrame transformPointToNDCSpace:](self, "transformPointToNDCSpace:", point.x, point.y);
  v25 = v8;
  -[ARFrame camera](self, "camera");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transform");
  v26 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, v25.f32[0]), v11, *(float32x2_t *)v25.f32, 1), v12, v25, 2), v13, v25, 3);

  -[ARFrame camera](self, "camera");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transform");
  v16 = vsubq_f32(v26, v15);
  v17 = (int32x4_t)vmulq_f32(v16, v16);
  v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v17, 2), vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 1))).u32[0];
  v18 = vrsqrte_f32((float32x2_t)v17.u32[0]);
  v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v18, v18)));
  v26.i64[0] = vmulq_n_f32(v16, vmul_f32(v19, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v19, v19))).f32[0]).u64[0];

  v20 = [ARRaycastQuery alloc];
  -[ARFrame camera](self, "camera");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "transform");
  v23 = -[ARRaycastQuery initWithOrigin:direction:allowingTarget:alignment:](v20, "initWithOrigin:direction:allowingTarget:alignment:", target, alignment, v22, *(double *)v26.i64);

  return v23;
}

- (CGAffineTransform)displayTransformForOrientation:(SEL)a3 viewportSize:(UIInterfaceOrientation)orientation
{
  double height;
  double width;
  double v9;
  double v10;
  CGAffineTransform *result;
  id v12;

  height = viewportSize.height;
  width = viewportSize.width;
  -[ARFrame camera](self, "camera");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageResolution");
  ARCameraImageToViewTransform(orientation, 0, retstr, v9, v10, width, height);

  return result;
}

- (ARPointCloud)rawFeaturePoints
{
  return self->_featurePoints;
}

- (__n128)setReferenceOriginTransform:(__n128)a3
{
  result[31] = a2;
  result[32] = a3;
  result[33] = a4;
  result[34] = a5;
  result[1].n128_u64[1] |= 1uLL;
  return result;
}

- (BOOL)referenceOriginTransformAvailable
{
  return self->_transformFlags & 1;
}

- (BOOL)referenceOriginTransformUpdated
{
  return (LOBYTE(self->_transformFlags) >> 1) & 1;
}

- (void)setReferenceOriginTransformUpdated:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_transformFlags = self->_transformFlags & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)referenceOriginChanged
{
  return (LOBYTE(self->_transformFlags) >> 2) & 1;
}

- (void)setReferenceOriginChanged:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_transformFlags = self->_transformFlags & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (__n128)setReferenceOriginDelta:(__n128)a3
{
  result[35] = a2;
  result[36] = a3;
  result[37] = a4;
  result[38] = a5;
  result[1].n128_u64[1] |= 8uLL;
  return result;
}

- (BOOL)referenceOriginDeltaAvailable
{
  return (LOBYTE(self->_transformFlags) >> 3) & 1;
}

- (__n128)setSessionOriginTransform:(__n128)a3
{
  result[39] = a2;
  result[40] = a3;
  result[41] = a4;
  result[42] = a5;
  result[1].n128_u64[1] |= 0x10uLL;
  return result;
}

- (BOOL)sessionOriginTransformAvailable
{
  return (LOBYTE(self->_transformFlags) >> 4) & 1;
}

- (__n128)setWorldAlignmentTransform:(__n128)a3
{
  result[43] = a2;
  result[44] = a3;
  result[45] = a4;
  result[46] = a5;
  result[1].n128_u64[1] |= 0x20uLL;
  return result;
}

- (BOOL)worldAlignmentTransformAvailable
{
  return (LOBYTE(self->_transformFlags) >> 5) & 1;
}

- (__n128)gravityAlignedReferenceOriginTransform
{
  uint64_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  simd_float4x4 v8;
  _OWORD v9[4];
  simd_float4x4 v10;

  if (objc_msgSend((id)a1, "sessionOriginTransformAvailable")
    && objc_msgSend((id)a1, "worldAlignmentTransformAvailable"))
  {
    v10 = __invert_f4(*(simd_float4x4 *)(a1 + 688));
    v2 = 0;
    v3 = *(float32x4_t *)(a1 + 624);
    v4 = *(float32x4_t *)(a1 + 640);
    v5 = *(float32x4_t *)(a1 + 656);
    v6 = *(float32x4_t *)(a1 + 672);
    v8 = v10;
    memset(v9, 0, sizeof(v9));
    do
    {
      v9[v2] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v3, COERCE_FLOAT(*(_OWORD *)&v8.columns[v2])), v4, *(float32x2_t *)v8.columns[v2].f32, 1), v5, (float32x4_t)v8.columns[v2], 2), v6, (float32x4_t)v8.columns[v2], 3);
      ++v2;
    }
    while (v2 != 4);
    v10.columns[0].i64[0] = *(_QWORD *)&v9[0];
  }
  else if (objc_msgSend((id)a1, "worldAlignmentTransformAvailable"))
  {
    v10.columns[0].i64[0] = (unint64_t)__invert_f4(*(simd_float4x4 *)(a1 + 688));
  }
  else if (objc_msgSend((id)a1, "sessionOriginTransformAvailable"))
  {
    v10.columns[0] = *(simd_float4 *)(a1 + 624);
  }
  else
  {
    v10.columns[0] = (simd_float4)*MEMORY[0x1E0C83FF0];
  }
  return (__n128)v10.columns[0];
}

- (BOOL)useHittestRaycasting
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!ARDeviceSupportsJasper())
    return 0;
  -[ARFrame capturedPointCloudData](self, "capturedPointCloudData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ARFrame capturedPointCloudData](self, "capturedPointCloudData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_hitTestFromOrigin:(ARFrame *)self withDirection:(SEL)a2 types:(unint64_t)a3
{
  double v3;
  double v4;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  BOOL v20;
  char v21;
  BOOL v22;
  void *v23;
  void *v24;
  float v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  uint64_t v36;
  void *v37;
  float v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  float32x4_t v55;
  float32x4_t v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  double v60;
  double v61;
  double v62;
  double v63;
  float v64;
  float v65;
  float32x4_t v66;
  double v67;
  double v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _OWORD v73[4];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  double v77[3];
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v67 = v3;
  v68 = v4;
  v80 = *MEMORY[0x1E0C80C00];
  -[ARFrame timestamp](self, "timestamp");
  kdebug_trace();
  +[ARSessionMetrics recordHitTest:](ARSessionMetrics, "recordHitTest:", a3);
  v7 = (void *)objc_opt_new();
  if ((a3 & 0x38) != 0)
  {
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    -[ARFrame anchors](self, "anchors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    if (!v9)
      goto LABEL_23;
    v10 = v9;
    v11 = *(_QWORD *)v70;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v70 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((a3 & 0x20) != 0)
          {
            objc_msgSend(v13, "_hitTestFromOrigin:withDirection:usingExtent:usingGeometry:", 1, 1, v67, v68);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(v7, "addObject:", v14);

            if ((a3 & 0x10) == 0)
            {
LABEL_10:
              if ((a3 & 8) == 0)
                continue;
LABEL_18:
              objc_msgSend(v13, "_hitTestFromOrigin:withDirection:usingExtent:usingGeometry:", 0, 0, v67, v68);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                objc_msgSend(v7, "addObject:", v16);

              continue;
            }
          }
          else if ((a3 & 0x10) == 0)
          {
            goto LABEL_10;
          }
          objc_msgSend(v13, "_hitTestFromOrigin:withDirection:usingExtent:usingGeometry:", 1, 0, v67, v68);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v7, "addObject:", v15);

          if ((a3 & 8) != 0)
            goto LABEL_18;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
      if (!v10)
      {
LABEL_23:

        break;
      }
    }
  }
  -[ARFrame featurePoints](self, "featurePoints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_msgSend(v7, "count");
    if ((a3 & 2) != 0)
    {
      v19 = -[ARFrame worldAlignment](self, "worldAlignment");
      if (v18)
        v20 = 0;
      else
        v20 = *((float *)&v68 + 1) <= -0.00000011921;
      v21 = a3 & 0xFD;
      if (v20)
        v21 = a3;
      if (v19 != 2)
        LOBYTE(a3) = v21;
    }
    if ((a3 & 1) == 0)
    {
      v22 = -[ARFrame useHittestRaycasting](self, "useHittestRaycasting");
      v23 = 0;
      if ((a3 & 2) == 0 || v22)
        goto LABEL_47;
    }
    -[ARFrame camera](self, "camera");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "intrinsics");
    v62 = v26;
    v64 = v25;
    v60 = v27;
    -[ARFrame camera](self, "camera");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "imageResolution");
    LODWORD(v65) = ARCameraFieldOfViewFromIntrinsics(v64, v62, v60, v29, v30).u32[0];

    if (-[ARFrame useHittestRaycasting](self, "useHittestRaycasting"))
    {
      -[ARFrame camera](self, "camera");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "transform");
      v36 = 0;
      v73[0] = xmmword_1B3C07D90;
      v73[1] = xmmword_1B3C07DA0;
      v73[2] = xmmword_1B3C07DB0;
      v73[3] = xmmword_1B3BDFD50;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      *(_OWORD *)v77 = 0u;
      do
      {
        *(__int128 *)((char *)&v74 + v36 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(v73[v36])), v33, *(float32x2_t *)&v73[v36], 1), v34, (float32x4_t)v73[v36], 2), v35, (float32x4_t)v73[v36], 3);
        ++v36;
      }
      while (v36 != 4);
      v61 = *(double *)&v76;
      v63 = v77[0];
      v58 = v74;
      v59 = v75;

      -[ARFrame capturedPointCloudData](self, "capturedPointCloudData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v65 * 0.5;
      *(float *)&v39 = v65 * 0.5;
      objc_msgSend(v37, "_hitTestPointFromOrigin:withDirection:maximumAngle:cameraToWorldTransform:", v67, v68, v39, *(double *)&v58, *(double *)&v59, v61, v63);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        if ((a3 & 1) == 0)
          goto LABEL_47;
        goto LABEL_45;
      }
    }
    else
    {
      v38 = v65 * 0.5;
    }
    -[ARFrame featurePoints](self, "featurePoints", v58, v59);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v41 = v38;
    objc_msgSend(v40, "_hitTestPointFromOrigin:withDirection:maximumAngle:cameraToWorldTransform:", v67, v68, v41, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if ((a3 & 1) == 0)
    {
LABEL_47:
      if ((a3 & 2) != 0)
      {
        if (-[ARFrame useHittestRaycasting](self, "useHittestRaycasting"))
        {
          -[ARFrame referenceOriginTransform](self, "referenceOriginTransform");
          +[ARHitTestRaycasting hitTestFromOrigin:resultType:origin:withDirection:referenceOriginTransform:](ARHitTestRaycasting, "hitTestFromOrigin:resultType:origin:withDirection:referenceOriginTransform:", self, 2, v67, v68, v42, v43, v44, v45);
        }
        else
        {
          -[ARFrame _hitTestEstimatedPlanesFromOrigin:withDirection:planeAlignment:](self, "_hitTestEstimatedPlanesFromOrigin:withDirection:planeAlignment:", 0, v67, v68);
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          objc_msgSend(v7, "addObject:", v46);
        }
        else if (v23 && !-[ARFrame useHittestRaycasting](self, "useHittestRaycasting"))
        {
          objc_msgSend(v23, "worldTransform");
          v66 = v55;
          objc_msgSend(v23, "localTransform");
          -[ARFrame _horizontalPlaneEstimateFromFeaturePoint:fromOrigin:withDirection:](self, "_horizontalPlaneEstimateFromFeaturePoint:fromOrigin:withDirection:", *(double *)vsubq_f32(v66, v56).i64, v67, v68);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (v57)
            objc_msgSend(v7, "addObject:", v57);

        }
      }
      if (!v18 && (a3 & 4) != 0)
      {
        if (-[ARFrame useHittestRaycasting](self, "useHittestRaycasting"))
        {
          -[ARFrame referenceOriginTransform](self, "referenceOriginTransform");
          +[ARHitTestRaycasting hitTestFromOrigin:resultType:origin:withDirection:referenceOriginTransform:](ARHitTestRaycasting, "hitTestFromOrigin:resultType:origin:withDirection:referenceOriginTransform:", self, 4, v67, v68, v47, v48, v49, v50);
        }
        else
        {
          -[ARFrame _hitTestEstimatedPlanesFromOrigin:withDirection:planeAlignment:](self, "_hitTestEstimatedPlanesFromOrigin:withDirection:planeAlignment:", 1, v67, v68);
        }
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
          objc_msgSend(v7, "addObject:", v51);

      }
      goto LABEL_63;
    }
LABEL_45:
    if (v23)
      objc_msgSend(v7, "addObject:", v23);
    goto LABEL_47;
  }
LABEL_63:
  if ((unint64_t)objc_msgSend(v7, "count", v58, v59) >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("distance"), 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortUsingDescriptors:", v53);

  }
  kdebug_trace();
  return v7;
}

- (id)_horizontalPlaneEstimateFromFeaturePoint:(ARFrame *)self fromOrigin:(SEL)a2 withDirection:
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float v6;
  float v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x2_t v11;
  float v12;
  ARHitTestResult *v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  float32x4_t v30;
  __int128 v31;
  float32x4_t v32;
  __int128 v33;
  float32x4_t v34;
  __int128 v35;
  float32x4_t v36;
  float32x4_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  float32x4_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  simd_float4x4 v46;
  simd_float4x4 v47;

  v34 = v4;
  v36 = v3;
  v32 = v2;
  -[ARFrame referenceOriginTransform](self, "referenceOriginTransform");
  v7 = fabsf(v6 + -1.0);
  if (v7 >= 0.00000011921)
  {
    -[ARFrame referenceOriginTransform](self, "referenceOriginTransform");
    v47 = __invert_f4(v46);
    v10 = vaddq_f32((float32x4_t)v47.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v47.columns[0], v32.f32[0]), (float32x4_t)v47.columns[1], *(float32x2_t *)v32.f32, 1), (float32x4_t)v47.columns[2], v32, 2));
    v9 = vaddq_f32((float32x4_t)v47.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v47.columns[0], v36.f32[0]), (float32x4_t)v47.columns[1], *(float32x2_t *)v36.f32, 1), (float32x4_t)v47.columns[2], v36, 2));
    v8 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v47.columns[0], v34.f32[0]), (float32x4_t)v47.columns[1], *(float32x2_t *)v34.f32, 1), (float32x4_t)v47.columns[2], v34, 2), (float32x4_t)0, (float32x4_t)v47.columns[3]);
  }
  else
  {
    v8 = v34;
    v9 = v36;
    v10 = v32;
  }
  v11 = (float32x2_t)vdivq_f32(vsubq_f32(v10, v9), v8).u64[0];
  v12 = v11.f32[1];
  if (v11.f32[1] >= 0.0)
  {
    v14 = vmlaq_lane_f32(v9, v8, v11, 1);
    v15 = vsubq_f32(v14, v10);
    v14.i32[3] = 1.0;
    v15.i32[3] = 1.0;
    v35 = *MEMORY[0x1E0C83FF0];
    v37 = v14;
    v31 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
    v33 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    v30 = v15;
    if (v7 >= 0.00000011921)
    {
      -[ARFrame referenceOriginTransform](self, "referenceOriginTransform");
      v20 = 0;
      v38 = v35;
      v39 = v33;
      v40 = v31;
      v41 = v37;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      do
      {
        *(__int128 *)((char *)&v42 + v20) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, COERCE_FLOAT(*(__int128 *)((char *)&v38 + v20))), v17, *(float32x2_t *)((char *)&v38 + v20), 1), v18, *(float32x4_t *)((char *)&v38 + v20), 2), v19, *(float32x4_t *)((char *)&v38 + v20), 3);
        v20 += 16;
      }
      while (v20 != 64);
      *(_QWORD *)&v28 = v43;
      *(_QWORD *)&v29 = v42;
      *(_QWORD *)&v27 = v44;
      v37.i64[0] = v45;
      -[ARFrame referenceOriginTransform](self, "referenceOriginTransform");
      v25 = 0;
      v38 = v35;
      v39 = v33;
      v40 = v31;
      v41 = v30;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      do
      {
        *(__int128 *)((char *)&v42 + v25) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(__int128 *)((char *)&v38 + v25))), v22, *(float32x2_t *)((char *)&v38 + v25), 1), v23, *(float32x4_t *)((char *)&v38 + v25), 2), v24, *(float32x4_t *)((char *)&v38 + v25), 3);
        v25 += 16;
      }
      while (v25 != 64);
      *(_QWORD *)&v33 = v43;
      *(_QWORD *)&v35 = v42;
      v30.i64[0] = v45;
      *(_QWORD *)&v31 = v44;
    }
    else
    {
      v28 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
      v29 = *MEMORY[0x1E0C83FF0];
      v27 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
    }
    v13 = -[ARHitTestResult initWithType:]([ARHitTestResult alloc], "initWithType:", 2);
    -[ARHitTestResult setDistance:](v13, "setDistance:", v12);
    -[ARHitTestResult setWorldTransform:](v13, "setWorldTransform:", *(double *)&v29, *(double *)&v28, *(double *)&v27, *(double *)v37.i64);
    -[ARHitTestResult setLocalTransform:](v13, "setLocalTransform:", *(double *)&v35, *(double *)&v33, *(double *)&v31, *(double *)v30.i64);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (ARHitTestResult)_hitTestFromOrigin:(float32x4_t)a3 withDirection:(float32x4_t)a4 planeAlignment:(float32x4_t)a5 forPlanes:(float32x4_t)a6 referenceOriginTransform:(uint64_t)a7
{
  id v11;
  ARHitTestResult *v12;
  unint64_t v13;
  float v14;
  uint64_t v15;
  BOOL v16;
  float v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  float32x4_t v24;
  double v25;
  double v26;
  double v27;
  float32x4_t v28;
  int32x4_t v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x4_t v32;
  float v33;
  ARPlaneAnchor *v34;
  void *v35;
  ARPlaneAnchor *v36;
  void *v37;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  float v48;
  _OWORD v51[4];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  float32x4_t v55;

  v11 = a10;
  v12 = 0;
  if (objc_msgSend(v11, "count"))
  {
    v13 = 0;
    v14 = fabsf(a4.f32[1] + -1.0);
    v15 = 2;
    if (a9)
      v15 = 4;
    v39 = v15;
    v16 = v14 >= 0.00000011921 || a9 != 0;
    v17 = -0.00000011921;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "alignment") == a9)
      {
        objc_msgSend(v18, "transform");
        v19 = 0;
        v51[0] = v20;
        v51[1] = v21;
        v51[2] = v22;
        v51[3] = v23;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        do
        {
          *(__int128 *)((char *)&v52 + v19 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a3, COERCE_FLOAT(v51[v19])), a4, *(float32x2_t *)&v51[v19], 1), a5, (float32x4_t)v51[v19], 2), a6, (float32x4_t)v51[v19], 3);
          ++v19;
        }
        while (v19 != 4);
        v24 = v55;
        if (v16)
        {
          v25 = *(double *)&v52;
          v26 = *(double *)&v53;
          v27 = *(double *)&v54;
        }
        else
        {
          ARMatrix4x4FromRotationAndTranslation();
        }
        v28 = vsubq_f32(v24, a1);
        v29 = (int32x4_t)vmulq_f32(v28, v28);
        v29.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v29, 2), vadd_f32(*(float32x2_t *)v29.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v29.i8, 1))).u32[0];
        v30 = vrsqrte_f32((float32x2_t)v29.u32[0]);
        v31 = vmul_f32(v30, vrsqrts_f32((float32x2_t)v29.u32[0], vmul_f32(v30, v30)));
        v32 = vmulq_f32(vmulq_n_f32(v28, vmul_f32(v31, vrsqrts_f32((float32x2_t)v29.u32[0], vmul_f32(v31, v31))).f32[0]), a2);
        v33 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1))).f32[0];
        if (v33 > v17)
        {
          v48 = v33;
          v42 = v27;
          v43 = *(double *)v24.i64;
          v40 = v25;
          v41 = v26;
          v34 = [ARPlaneAnchor alloc];
          objc_msgSend(v18, "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[ARPlaneAnchor initWithIdentifier:transform:alignment:](v34, "initWithIdentifier:transform:alignment:", v35, a9, v40, v41, v42, v43);

          -[ARPlaneAnchor _hitTestFromOrigin:withDirection:usingExtent:usingGeometry:](v36, "_hitTestFromOrigin:withDirection:usingExtent:usingGeometry:", 0, 0, *(double *)a1.i64, *(double *)a2.i64);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            if (!v12)
              v12 = -[ARHitTestResult initWithType:]([ARHitTestResult alloc], "initWithType:", v39);
            objc_msgSend(v37, "distance");
            -[ARHitTestResult setDistance:](v12, "setDistance:");
            objc_msgSend(v37, "worldTransform");
            -[ARHitTestResult setWorldTransform:](v12, "setWorldTransform:");
            objc_msgSend(v37, "localTransform");
            -[ARHitTestResult setLocalTransform:](v12, "setLocalTransform:");
          }
          else
          {
            v48 = v17;
          }

          v17 = v48;
        }
      }

      ++v13;
    }
    while (v13 < objc_msgSend(v11, "count"));
  }

  return v12;
}

- (id)_hitTestEstimatedPlanesFromOrigin:(ARFrame *)self withDirection:(SEL)a2 planeAlignment:(int64_t)a3
{
  double v3;
  double v4;
  ARFrame *v6;
  NSArray *v7;
  NSArray *cachedVerticalPlaneAnchors;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v15;
  double v16;

  v15 = v3;
  v16 = v4;
  v6 = self;
  objc_sync_enter(v6);
  if (a3)
  {
    v7 = v6->_cachedVerticalPlaneAnchors;
    if (!v7)
    {
      +[ARPlaneEstimationTechnique detectPlanes:withFrame:](ARPlaneEstimationTechnique, "detectPlanes:withFrame:", 2, v6);
      v7 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      cachedVerticalPlaneAnchors = v6->_cachedVerticalPlaneAnchors;
      v6->_cachedVerticalPlaneAnchors = v7;
LABEL_6:

    }
  }
  else
  {
    v7 = v6->_cachedHorizontalPlaneAnchors;
    if (!v7)
    {
      +[ARPlaneEstimationTechnique detectPlanes:withFrame:](ARPlaneEstimationTechnique, "detectPlanes:withFrame:", 1, v6);
      v7 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      cachedVerticalPlaneAnchors = v6->_cachedHorizontalPlaneAnchors;
      v6->_cachedHorizontalPlaneAnchors = v7;
      goto LABEL_6;
    }
  }
  objc_sync_exit(v6);

  -[ARFrame referenceOriginTransform](v6, "referenceOriginTransform");
  -[ARFrame _hitTestFromOrigin:withDirection:planeAlignment:forPlanes:referenceOriginTransform:](v6, "_hitTestFromOrigin:withDirection:planeAlignment:forPlanes:referenceOriginTransform:", a3, v7, v15, v16, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)hash
{
  return (uint64_t)self->_timestamp;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ARFrame timestamp](self, "timestamp");
    v6 = v5;
    objc_msgSend(v4, "timestamp");
    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARFrame timestamp](self, "timestamp");
  objc_msgSend(v6, "appendFormat:", CFSTR(" timestamp=%f"), v7);
  objc_msgSend(v6, "appendFormat:", CFSTR(" capturedImage=%p"), -[ARFrame capturedImage](self, "capturedImage"));
  -[ARFrame camera](self, "camera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" camera=%p"), v8);

  -[ARFrame lightEstimate](self, "lightEstimate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" lightEstimate=%p"), v9);

  -[ARFrame anchors](self, "anchors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") == 1)
  {
    v11 = CFSTR("1 anchor");
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[ARFrame anchors](self, "anchors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%d anchors"), objc_msgSend(v13, "count"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "appendFormat:", CFSTR(" | %@"), v11);
  -[ARFrame featurePoints](self, "featurePoints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", %d features"), objc_msgSend(v14, "count"));

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARFrame)initWithCoder:(id)a3
{
  id v4;
  ARFrame *v5;
  double v6;
  double v7;
  uint64_t v8;
  ARCamera *camera;
  uint64_t v10;
  CLLocation *location;
  double v12;
  uint64_t v13;
  CLLocation *rawLocation;
  double v15;
  double v16;
  uint64_t v17;
  ARVLStateData *vlState;
  uint64_t v19;
  ARGeoTrackingStatus *geoTrackingStatus;
  uint64_t v21;
  VLLocalizationDebugInfo *vlDebugInfo;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSArray *anchors;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  ARLightEstimate *lightEstimate;
  uint64_t v38;
  ARPointCloud *featurePoints;
  uint64_t v40;
  ARFaceData *faceData;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)ARFrame;
  v5 = -[ARFrame init](&v49, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("currentCaptureTimestamp"));
    v5->_currentCaptureTimestamp = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("camera"));
    v8 = objc_claimAutoreleasedReturnValue();
    camera = v5->_camera;
    v5->_camera = (ARCamera *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v10 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("heading"));
    v5->_heading = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawLocation"));
    v13 = objc_claimAutoreleasedReturnValue();
    rawLocation = v5->_rawLocation;
    v5->_rawLocation = (CLLocation *)v13;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rawHeading"));
    v5->_rawHeading = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rawLocationTimestamp"));
    v5->_rawLocationTimestamp = v16;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vlState"));
    v17 = objc_claimAutoreleasedReturnValue();
    vlState = v5->_vlState;
    v5->_vlState = (ARVLStateData *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geoTrackingStatus"));
    v19 = objc_claimAutoreleasedReturnValue();
    geoTrackingStatus = v5->_geoTrackingStatus;
    v5->_geoTrackingStatus = (ARGeoTrackingStatus *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vlDebugInfo"));
    v21 = objc_claimAutoreleasedReturnValue();
    vlDebugInfo = v5->_vlDebugInfo;
    v5->_vlDebugInfo = (VLLocalizationDebugInfo *)v21;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("undulation"));
    v5->_undulation = v23;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("capturedDepthDataTimestamp"));
    v5->_capturedDepthDataTimestamp = v24;
    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("anchors"));
    v28 = objc_claimAutoreleasedReturnValue();
    anchors = v5->_anchors;
    v5->_anchors = (NSArray *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("privateAnchors"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v33)
      v35 = (void *)v33;
    else
      v35 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_privateAnchors, v35);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lightEstimate"));
    v36 = objc_claimAutoreleasedReturnValue();
    lightEstimate = v5->_lightEstimate;
    v5->_lightEstimate = (ARLightEstimate *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featurePoints"));
    v38 = objc_claimAutoreleasedReturnValue();
    featurePoints = v5->_featurePoints;
    v5->_featurePoints = (ARPointCloud *)v38;

    v5->_renderFramesPerSecond = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("renderFramesPerSecond"));
    v5->_shouldRestrictFrameRate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldRestrictFrameRate"));
    v5->_worldMappingStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("worldMappingStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceData"));
    v40 = objc_claimAutoreleasedReturnValue();
    faceData = v5->_faceData;
    v5->_faceData = (ARFaceData *)v40;

    v5->_highResolution = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("highResolution"));
    v42 = (void *)MEMORY[0x1E0C99E60];
    v43 = objc_opt_class();
    v44 = objc_opt_class();
    v45 = objc_opt_class();
    objc_msgSend(v42, "setWithObjects:", v43, v44, v45, objc_opt_class(), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("exifData"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
      objc_storeStrong((id *)&v5->_exifData, v47);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), timestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("currentCaptureTimestamp"), self->_currentCaptureTimestamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_camera, CFSTR("camera"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("heading"), self->_heading);
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawLocation, CFSTR("rawLocation"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("rawHeading"), self->_rawHeading);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("rawLocationTimestamp"), self->_rawLocationTimestamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_vlState, CFSTR("vlState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_geoTrackingStatus, CFSTR("geoTrackingStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vlDebugInfo, CFSTR("vlDebugInfo"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("undulation"), self->_undulation);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("capturedDepthDataTimestamp"), self->_capturedDepthDataTimestamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_anchors, CFSTR("anchors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privateAnchors, CFSTR("privateAnchors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lightEstimate, CFSTR("lightEstimate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_featurePoints, CFSTR("featurePoints"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_renderFramesPerSecond, CFSTR("renderFramesPerSecond"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldRestrictFrameRate, CFSTR("shouldRestrictFrameRate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_worldMappingStatus, CFSTR("worldMappingStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_faceData, CFSTR("faceData"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_highResolution, CFSTR("highResolution"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_exifData, CFSTR("exifData"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  ARFaceData *faceData;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[ARCamera copyWithZone:](self->_camera, "copyWithZone:", a3);
  v7 = objc_msgSend(v5, "initWithCamera:timestamp:", v6, self->_timestamp);

  if (v7)
  {
    *(_QWORD *)(v7 + 56) = CVPixelBufferRetain(self->_capturedImage);
    *(_BYTE *)(v7 + 33) = self->_highResolution;
    v8 = -[CLLocation copyWithZone:](self->_location, "copyWithZone:", a3);
    v9 = *(void **)(v7 + 384);
    *(_QWORD *)(v7 + 384) = v8;

    *(double *)(v7 + 392) = self->_heading;
    v10 = -[CLLocation copyWithZone:](self->_rawLocation, "copyWithZone:", a3);
    v11 = *(void **)(v7 + 400);
    *(_QWORD *)(v7 + 400) = v10;

    *(double *)(v7 + 408) = self->_rawHeading;
    *(double *)(v7 + 416) = self->_rawLocationTimestamp;
    v12 = -[ARVLStateData copyWithZone:](self->_vlState, "copyWithZone:", a3);
    v13 = *(void **)(v7 + 424);
    *(_QWORD *)(v7 + 424) = v12;

    v14 = -[ARGeoTrackingStatus copyWithZone:](self->_geoTrackingStatus, "copyWithZone:", a3);
    v15 = *(void **)(v7 + 144);
    *(_QWORD *)(v7 + 144) = v14;

    objc_storeStrong((id *)(v7 + 432), self->_vlDebugInfo);
    *(double *)(v7 + 440) = self->_undulation;
    v16 = -[NSArray copyWithZone:](self->_anchors, "copyWithZone:", a3);
    v17 = *(void **)(v7 + 112);
    *(_QWORD *)(v7 + 112) = v16;

    v18 = -[NSArray copyWithZone:](self->_privateAnchors, "copyWithZone:", a3);
    v19 = *(void **)(v7 + 176);
    *(_QWORD *)(v7 + 176) = v18;

    objc_storeStrong((id *)(v7 + 120), self->_lightEstimate);
    objc_storeStrong((id *)(v7 + 184), self->_featurePoints);
    *(_QWORD *)(v7 + 128) = self->_worldMappingStatus;
    objc_storeStrong((id *)(v7 + 192), self->_referenceFeaturePoints);
    v20 = *(_OWORD *)self->_anon_1f0;
    v21 = *(_OWORD *)&self->_anon_1f0[16];
    v22 = *(_OWORD *)&self->_anon_1f0[48];
    *(_OWORD *)(v7 + 528) = *(_OWORD *)&self->_anon_1f0[32];
    *(_OWORD *)(v7 + 544) = v22;
    *(_OWORD *)(v7 + 496) = v20;
    *(_OWORD *)(v7 + 512) = v21;
    v23 = *(_OWORD *)self->_anon_230;
    v24 = *(_OWORD *)&self->_anon_230[16];
    v25 = *(_OWORD *)&self->_anon_230[48];
    *(_OWORD *)(v7 + 592) = *(_OWORD *)&self->_anon_230[32];
    *(_OWORD *)(v7 + 608) = v25;
    *(_OWORD *)(v7 + 560) = v23;
    *(_OWORD *)(v7 + 576) = v24;
    v26 = *(_OWORD *)self->_anon_270;
    v27 = *(_OWORD *)&self->_anon_270[16];
    v28 = *(_OWORD *)&self->_anon_270[48];
    *(_OWORD *)(v7 + 656) = *(_OWORD *)&self->_anon_270[32];
    *(_OWORD *)(v7 + 672) = v28;
    *(_OWORD *)(v7 + 624) = v26;
    *(_OWORD *)(v7 + 640) = v27;
    v29 = *(_OWORD *)&self[1].super.isa;
    v30 = *(_OWORD *)&self[1]._cachedVerticalPlaneAnchors;
    v31 = *(_OWORD *)&self[1]._segmentationBuffer;
    *(_OWORD *)(v7 + 720) = *(_OWORD *)&self[1]._shouldRestrictFrameRate;
    *(_OWORD *)(v7 + 736) = v31;
    *(_OWORD *)(v7 + 688) = v29;
    *(_OWORD *)(v7 + 704) = v30;
    *(_QWORD *)(v7 + 24) = self->_transformFlags;
    *(_QWORD *)(v7 + 208) = self->_worldAlignment;
    objc_storeStrong((id *)(v7 + 216), self->_timingData);
    objc_storeStrong((id *)(v7 + 224), self->_worldTrackingErrorData);
    objc_storeStrong((id *)(v7 + 232), self->_worldTrackingLineCloud);
    *(_QWORD *)(v7 + 256) = self->_renderFramesPerSecond;
    *(_BYTE *)(v7 + 32) = self->_shouldRestrictFrameRate;
    *(double *)(v7 + 168) = self->_currentCaptureTimestamp;
    objc_storeStrong((id *)(v7 + 264), self->_captureDate);
    *(double *)(v7 + 272) = self->_estimatedLuminance;
    faceData = self->_faceData;
    if (faceData)
      objc_storeStrong((id *)(v7 + 328), faceData);
    *(double *)(v7 + 96) = self->_capturedDepthDataTimestamp;
    objc_storeStrong((id *)(v7 + 88), self->_capturedDepthData);
    *(_QWORD *)(v7 + 48) = CVPixelBufferRetain(self->_segmentationBuffer);
    *(_QWORD *)(v7 + 136) = CVPixelBufferRetain(self->_estimatedDepthData);
    *(_QWORD *)(v7 + 296) = CVPixelBufferRetain(self->_downSampledMattingPixelBuffer);
    *(_QWORD *)(v7 + 304) = CVPixelBufferRetain(self->_mattingScaleImagePixelBuffer);
    -[ARFrame detectedBodies](self, "detectedBodies");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copyWithZone:", a3);
    v35 = *(void **)(v7 + 312);
    *(_QWORD *)(v7 + 312) = v34;

    -[ARFrame detectedPersonMetadata](self, "detectedPersonMetadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copyWithZone:", a3);
    v38 = *(void **)(v7 + 320);
    *(_QWORD *)(v7 + 320) = v37;

    *(_QWORD *)(v7 + 352) = CVPixelBufferRetain(self->_depthConfidenceData);
    *(_QWORD *)(v7 + 360) = CVPixelBufferRetain(self->_depthNormalData);
    *(_QWORD *)(v7 + 368) = CVPixelBufferRetain(self->_semanticSegmentationBuffer);
    -[ARFrame resultDatas](self, "resultDatas");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copyWithZone:", a3);
    v41 = *(void **)(v7 + 280);
    *(_QWORD *)(v7 + 280) = v40;

    *(_QWORD *)(v7 + 288) = self->_deviceOrientation;
    objc_storeStrong((id *)(v7 + 152), self->_sceneDepth);
    objc_storeStrong((id *)(v7 + 160), self->_smoothedSceneDepth);
    -[ARFrame exifData](self, "exifData");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copyWithZone:", a3);
    v44 = *(void **)(v7 + 80);
    *(_QWORD *)(v7 + 80) = v43;

  }
  return (id)v7;
}

- (CVPixelBufferRef)segmentationBuffer
{
  return self->_segmentationBuffer;
}

- (CVPixelBufferRef)capturedImage
{
  return self->_capturedImage;
}

- (id)cameraGrainTexture
{
  return self->_cameraGrainTexture;
}

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (NSDictionary)exifData
{
  return self->_exifData;
}

- (float)cameraGrainIntensity
{
  return self->_cameraGrainIntensity;
}

- (AVDepthData)capturedDepthData
{
  return self->_capturedDepthData;
}

- (void)setCapturedDepthData:(id)a3
{
  objc_storeStrong((id *)&self->_capturedDepthData, a3);
}

- (NSTimeInterval)capturedDepthDataTimestamp
{
  return self->_capturedDepthDataTimestamp;
}

- (void)setCapturedDepthDataTimestamp:(double)a3
{
  self->_capturedDepthDataTimestamp = a3;
}

- (ARCamera)camera
{
  return self->_camera;
}

- (NSArray)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (ARLightEstimate)lightEstimate
{
  return self->_lightEstimate;
}

- (void)setLightEstimate:(id)a3
{
  objc_storeStrong((id *)&self->_lightEstimate, a3);
}

- (ARWorldMappingStatus)worldMappingStatus
{
  return self->_worldMappingStatus;
}

- (void)setWorldMappingStatus:(int64_t)a3
{
  self->_worldMappingStatus = a3;
}

- (CVPixelBufferRef)estimatedDepthData
{
  return self->_estimatedDepthData;
}

- (ARGeoTrackingStatus)geoTrackingStatus
{
  return self->_geoTrackingStatus;
}

- (void)setGeoTrackingStatus:(id)a3
{
  objc_storeStrong((id *)&self->_geoTrackingStatus, a3);
}

- (ARDepthData)sceneDepth
{
  return self->_sceneDepth;
}

- (void)setSceneDepth:(id)a3
{
  objc_storeStrong((id *)&self->_sceneDepth, a3);
}

- (ARDepthData)smoothedSceneDepth
{
  return self->_smoothedSceneDepth;
}

- (void)setSmoothedSceneDepth:(id)a3
{
  objc_storeStrong((id *)&self->_smoothedSceneDepth, a3);
}

- (double)currentCaptureTimestamp
{
  return self->_currentCaptureTimestamp;
}

- (NSArray)privateAnchors
{
  return self->_privateAnchors;
}

- (void)setPrivateAnchors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (ARPointCloud)featurePoints
{
  return self->_featurePoints;
}

- (void)setFeaturePoints:(id)a3
{
  objc_storeStrong((id *)&self->_featurePoints, a3);
}

- (ARPointCloud)referenceFeaturePoints
{
  return self->_referenceFeaturePoints;
}

- (void)setReferenceFeaturePoints:(id)a3
{
  objc_storeStrong((id *)&self->_referenceFeaturePoints, a3);
}

- (NSArray)cachedPointClouds
{
  return self->_cachedPointClouds;
}

- (void)setCachedPointClouds:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPointClouds, a3);
}

- (__n128)referenceOriginTransform
{
  return a1[31];
}

- (__n128)referenceOriginDelta
{
  return a1[35];
}

- (__n128)sessionOriginTransform
{
  return a1[39];
}

- (__n128)worldAlignmentTransform
{
  return a1[43];
}

- (int64_t)worldAlignment
{
  return self->_worldAlignment;
}

- (void)setWorldAlignment:(int64_t)a3
{
  self->_worldAlignment = a3;
}

- (ARFrameTimingData)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
  objc_storeStrong((id *)&self->_timingData, a3);
}

- (ARWorldTrackingErrorData)worldTrackingErrorData
{
  return self->_worldTrackingErrorData;
}

- (void)setWorldTrackingErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_worldTrackingErrorData, a3);
}

- (ARLineCloud)worldTrackingLineCloud
{
  return self->_worldTrackingLineCloud;
}

- (void)setWorldTrackingLineCloud:(id)a3
{
  objc_storeStrong((id *)&self->_worldTrackingLineCloud, a3);
}

- (ARRawSceneUnderstandingData)rawSceneUnderstandingData
{
  return self->_rawSceneUnderstandingData;
}

- (void)setRawSceneUnderstandingData:(id)a3
{
  objc_storeStrong((id *)&self->_rawSceneUnderstandingData, a3);
}

- (ARWorldTrackingState)worldTrackingState
{
  return self->_worldTrackingState;
}

- (void)setWorldTrackingState:(id)a3
{
  objc_storeStrong((id *)&self->_worldTrackingState, a3);
}

- (int64_t)renderFramesPerSecond
{
  return self->_renderFramesPerSecond;
}

- (void)setRenderFramesPerSecond:(int64_t)a3
{
  self->_renderFramesPerSecond = a3;
}

- (BOOL)shouldRestrictFrameRate
{
  return self->_shouldRestrictFrameRate;
}

- (void)setShouldRestrictFrameRate:(BOOL)a3
{
  self->_shouldRestrictFrameRate = a3;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- (void)setCaptureDate:(id)a3
{
  objc_storeStrong((id *)&self->_captureDate, a3);
}

- (double)estimatedLuminance
{
  return self->_estimatedLuminance;
}

- (void)setEstimatedLuminance:(double)a3
{
  self->_estimatedLuminance = a3;
}

- (NSArray)resultDatas
{
  return self->_resultDatas;
}

- (void)setResultDatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (__CVBuffer)downSampledMattingPixelBuffer
{
  return self->_downSampledMattingPixelBuffer;
}

- (__CVBuffer)mattingScaleImagePixelBuffer
{
  return self->_mattingScaleImagePixelBuffer;
}

- (NSArray)detectedBodies
{
  return self->_detectedBodies;
}

- (void)setDetectedBodies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSArray)detectedPersonMetadata
{
  return self->_detectedPersonMetadata;
}

- (void)setDetectedPersonMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (ARFaceData)faceData
{
  return self->_faceData;
}

- (void)setFaceData:(id)a3
{
  objc_storeStrong((id *)&self->_faceData, a3);
}

- (ARVideoFormat)currentlyActiveVideoFormat
{
  return self->_currentlyActiveVideoFormat;
}

- (void)setCurrentlyActiveVideoFormat:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyActiveVideoFormat, a3);
}

- (BOOL)isHighResolution
{
  return self->_highResolution;
}

- (ARPointCloud)capturedPointCloudData
{
  return self->_capturedPointCloudData;
}

- (void)setCapturedPointCloudData:(id)a3
{
  objc_storeStrong((id *)&self->_capturedPointCloudData, a3);
}

- (__CVBuffer)depthConfidenceData
{
  return self->_depthConfidenceData;
}

- (__CVBuffer)depthNormalData
{
  return self->_depthNormalData;
}

- (__CVBuffer)semanticSegmentationBuffer
{
  return self->_semanticSegmentationBuffer;
}

- (CGImage)depthMap
{
  return self->_depthMap;
}

- (void)setDepthMap:(CGImage *)a3
{
  self->_depthMap = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (double)heading
{
  return self->_heading;
}

- (void)setHeading:(double)a3
{
  self->_heading = a3;
}

- (CLLocation)rawLocation
{
  return self->_rawLocation;
}

- (void)setRawLocation:(id)a3
{
  objc_storeStrong((id *)&self->_rawLocation, a3);
}

- (double)rawHeading
{
  return self->_rawHeading;
}

- (void)setRawHeading:(double)a3
{
  self->_rawHeading = a3;
}

- (double)rawLocationTimestamp
{
  return self->_rawLocationTimestamp;
}

- (void)setRawLocationTimestamp:(double)a3
{
  self->_rawLocationTimestamp = a3;
}

- (ARVLStateData)vlState
{
  return self->_vlState;
}

- (void)setVlState:(id)a3
{
  objc_storeStrong((id *)&self->_vlState, a3);
}

- (VLLocalizationDebugInfo)vlDebugInfo
{
  return self->_vlDebugInfo;
}

- (void)setVlDebugInfo:(id)a3
{
  objc_storeStrong((id *)&self->_vlDebugInfo, a3);
}

- (double)undulation
{
  return self->_undulation;
}

- (void)setUndulation:(double)a3
{
  self->_undulation = a3;
}

- (NSDictionary)tiffData
{
  return self->_tiffData;
}

- (double)ultraWideImageTimestamp
{
  return self->_ultraWideImageTimestamp;
}

- (__CVBuffer)capturedUltraWideImage
{
  return self->_capturedUltraWideImage;
}

- (ARCamera)ultraWideCamera
{
  return self->_ultraWideCamera;
}

- (MTLTexture)imageNoiseTexture
{
  return self->_imageNoiseTexture;
}

- (void)setImageNoiseTexture:(id)a3
{
  objc_storeStrong((id *)&self->_imageNoiseTexture, a3);
}

- (float)imageNoiseIntensity
{
  return self->_imageNoiseIntensity;
}

- (void)setImageNoiseIntensity:(float)a3
{
  self->_imageNoiseIntensity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageNoiseTexture, 0);
  objc_storeStrong((id *)&self->_ultraWideCamera, 0);
  objc_storeStrong((id *)&self->_tiffData, 0);
  objc_storeStrong((id *)&self->_vlDebugInfo, 0);
  objc_storeStrong((id *)&self->_vlState, 0);
  objc_storeStrong((id *)&self->_rawLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_capturedPointCloudData, 0);
  objc_storeStrong((id *)&self->_currentlyActiveVideoFormat, 0);
  objc_storeStrong((id *)&self->_faceData, 0);
  objc_storeStrong((id *)&self->_detectedPersonMetadata, 0);
  objc_storeStrong((id *)&self->_detectedBodies, 0);
  objc_storeStrong((id *)&self->_resultDatas, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
  objc_storeStrong((id *)&self->_worldTrackingState, 0);
  objc_storeStrong((id *)&self->_rawSceneUnderstandingData, 0);
  objc_storeStrong((id *)&self->_worldTrackingLineCloud, 0);
  objc_storeStrong((id *)&self->_worldTrackingErrorData, 0);
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_cachedPointClouds, 0);
  objc_storeStrong((id *)&self->_referenceFeaturePoints, 0);
  objc_storeStrong((id *)&self->_featurePoints, 0);
  objc_storeStrong((id *)&self->_privateAnchors, 0);
  objc_storeStrong((id *)&self->_smoothedSceneDepth, 0);
  objc_storeStrong((id *)&self->_sceneDepth, 0);
  objc_storeStrong((id *)&self->_geoTrackingStatus, 0);
  objc_storeStrong((id *)&self->_lightEstimate, 0);
  objc_storeStrong((id *)&self->_anchors, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_capturedDepthData, 0);
  objc_storeStrong((id *)&self->_exifData, 0);
  objc_storeStrong((id *)&self->_cameraGrainTexture, 0);
  objc_storeStrong((id *)&self->_cachedVerticalPlaneAnchors, 0);
  objc_storeStrong((id *)&self->_cachedHorizontalPlaneAnchors, 0);
}

@end
