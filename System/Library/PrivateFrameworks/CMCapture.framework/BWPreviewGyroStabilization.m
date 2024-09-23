@implementation BWPreviewGyroStabilization

- (void)_adjustSmoothParameterWithQuaternion:(id *)a3 cameraMetadata:(id *)a4 reduceSmoothParameterForLowLight:(BOOL)a5
{
  _BOOL4 v5;
  float *p_lowpassParameter;
  double frameRateNormalizationFactor;
  int var3;
  _BOOL8 v12;
  double v13;
  float *v14;
  float v15;
  _BOOL8 v16;
  double v17;
  double v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  char *v27;
  double deltaFrameTime;
  double v29;
  float v30;
  float v31;
  float v32;
  _BOOL4 v33;
  _BOOL8 v34;
  double v35;
  double v36;
  double v37;
  float v38;
  float v39;
  float v40;
  float v41;
  long double quaternionThreshold;
  double v43;
  double v44;
  long double v45;
  float v46;
  float v47;
  int v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v5 = a5;
  p_lowpassParameter = &self->_lowpassParameter;
  frameRateNormalizationFactor = self->_frameRateNormalizationFactor;
  var3 = a4->var3;
  v12 = a4->var3 != 0;
  v52 = 0;
  v53 = 0;
  v54 = 0;
  -[BWPreviewGyroStabilization _updateTripodSmoothParametersWithSphereVideoEnabled:frameRateNormalization:](self, "_updateTripodSmoothParametersWithSphereVideoEnabled:frameRateNormalization:", v12, frameRateNormalizationFactor);
  if (-[BWPreviewGyroStabilizationTripodDetection empty](self->_previewTripodDetection, "empty"))
    v14 = (float *)&v52;
  else
    v14 = p_lowpassParameter;
  v15 = *v14;
  v50 = 2.0;
  v51 = 0.0;
  v49 = 2.0;
  *(float *)&v13 = a4->var1;
  -[BWPreviewGyroStabilization _computeMotionStatisticsWithQuaternion:focalLength:maxAngleAccumulateOut:maxAngleInstantOut:translationOut:](self, "_computeMotionStatisticsWithQuaternion:focalLength:maxAngleAccumulateOut:maxAngleInstantOut:translationOut:", a3, &v49, &v50, &v51, v13);
  v48 = 0;
  v16 = -[BWPreviewGyroStabilizationPanningDetection detectPanningUsingTranslation:maxAvgTranslationOut:](self->_previewPanningDetection, "detectPanningUsingTranslation:maxAvgTranslationOut:", &v48, v51);
  HIDWORD(v18) = HIDWORD(v49);
  HIDWORD(v17) = HIDWORD(v50);
  *(float *)&v17 = v50;
  *(float *)&v18 = v49;
  v19 = frameRateNormalizationFactor;
  *(float *)&v20 = v19;
  -[BWPreviewGyroStabilizationTripodDetection detectTripodStateUsingMaxAngleInstant:maxAngleAccumulate:frameRateNormalizationFactor:](self->_previewTripodDetection, "detectTripodStateUsingMaxAngleInstant:maxAngleAccumulate:frameRateNormalizationFactor:", v17, v18, v20);
  if (-[BWPreviewGyroStabilizationTripodDetection isStationary](self->_previewTripodDetection, "isStationary"))
  {
    LODWORD(v21) = v48;
    LODWORD(v23) = v54;
    LODWORD(v24) = v53;
    LODWORD(v25) = v52;
    *(float *)&v22 = v15;
    -[BWPreviewGyroStabilization _computeSmoothParameterForStationaryCaseWithPanningStatus:translation:previousLowPassParameter:rampDownRate:rampUpRate:targetSmoothParameter:](self, "_computeSmoothParameterForStationaryCaseWithPanningStatus:translation:previousLowPassParameter:rampDownRate:rampUpRate:targetSmoothParameter:", v16, v21, v22, v23, v24, v25);
  }
  else
  {
    v27 = (char *)&v53 + 4;
    deltaFrameTime = self->_deltaFrameTime;
    v29 = (float)(fmaxf(fabsf(*(float *)&v51), fabsf(*((float *)&v51 + 1))) / a4->var1) / deltaFrameTime;
    *(float *)&v29 = v29;
    if (p_lowpassParameter[37] < *(float *)&v29)
      v27 = (char *)&v54 + 4;
    LODWORD(deltaFrameTime) = *(_DWORD *)v27;
    LODWORD(v23) = v53;
    LODWORD(v24) = v52;
    *(float *)&v29 = v15;
    -[BWPreviewGyroStabilization _computeSmoothParameterForNonStationaryCaseWithPanningStatus:frameIsSphereStabilized:previousLowPassParameter:rampDownRate:rampUpRate:targetSmoothParameter:](self, "_computeSmoothParameterForNonStationaryCaseWithPanningStatus:frameIsSphereStabilized:previousLowPassParameter:rampDownRate:rampUpRate:targetSmoothParameter:", v16, var3 != 0, v29, deltaFrameTime, v23, v24);
  }
  v30 = fminf(fmaxf(v26, fminf(p_lowpassParameter[21], *(float *)&v52)), *((float *)&v52 + 1));
  v31 = fmaxf(v15 - *((float *)&v53 + 1), 0.4);
  if (v5)
    v32 = v31;
  else
    v32 = v30;
  v33 = -[BWPreviewGyroStabilizationTripodDetection isLikelyPhysicalTripod](self->_previewTripodDetection, "isLikelyPhysicalTripod");
  v34 = -[BWPreviewGyroStabilizationTripodDetection isPhysicalTripod](self->_previewTripodDetection, "isPhysicalTripod");
  if (v33)
  {
    *(float *)&v35 = v32;
    *(float *)&v36 = v15;
    *(float *)&v37 = frameRateNormalizationFactor;
    -[BWPreviewGyroStabilization _computeSmoothParameterForPhysicalTripod:lowpassParameter:previousLowPassParameter:frameRateNormalization:](self, "_computeSmoothParameterForPhysicalTripod:lowpassParameter:previousLowPassParameter:frameRateNormalization:", v34, v35, v36, v37);
    v39 = v38;
  }
  else
  {
    v40 = 0.08 / frameRateNormalizationFactor + v15;
    v39 = fminf(v32, v40);
    v41 = 0.005 / frameRateNormalizationFactor;
    p_lowpassParameter[11] = v41;
  }
  quaternionThreshold = self->_quaternionThreshold;
  v43 = fabs(FigMotionMultiplyByInverseOfQuaternion(&self->_stabilizedCenterQuaternion[0].w, (uint64_t *)a3));
  if (v43 < quaternionThreshold)
  {
    v44 = acos(quaternionThreshold);
    v45 = acos(v43);
    v46 = v44 / (v45 + v45);
    if (v39 > v46)
      v39 = v46;
  }
  v47 = v39;
  if (var3
    && v39 > *(float *)&v52
    && !-[BWPreviewGyroStabilization _limitSmoothParameterToOverscanWithQuaternion:cameraMetadata:minSmoothParameter:smoothParameterInOut:](self, "_limitSmoothParameterToOverscanWithQuaternion:cameraMetadata:minSmoothParameter:smoothParameterInOut:", a3, a4, &v47))
  {
    v39 = v47;
  }
  *p_lowpassParameter = v39;
}

- (PreviewStabilizationFrameRateCompensatedParameter)_updateTripodSmoothParametersWithSphereVideoEnabled:(SEL)a3 frameRateNormalization:(BOOL)a4
{
  float var2;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;

  var2 = self[1136].var2;
  v6 = self[1136].var3 + self[1136].var4 * a5;
  v7 = self[1136].var5 + self[1137].var0 * a5;
  if (a4)
  {
    v7 = v7 + 0.02;
    v6 = v6 + 0.1;
  }
  v8 = fminf(var2, v6);
  v9 = fminf(var2, v7);
  v10 = (float)(v9 - v8) / a5;
  *(float *)&v10 = v10;
  retstr->var0 = v8;
  retstr->var1 = v9;
  *(float32x4_t *)&retstr->var2 = vdivq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v10, 0), vcvtq_f32_s32(*(int32x4_t *)&self[1137].var1));
  return self;
}

- (float)_computeSmoothParameterForStationaryCaseWithPanningStatus:(BOOL)a3 translation:(float)a4 previousLowPassParameter:(float)a5 rampDownRate:(float)a6 rampUpRate:(float)a7 targetSmoothParameter:(float)a8
{
  float result;
  float v9;

  result = fmaxf(a8, a5 - a6);
  v9 = a5 + a7;
  if (!a3)
    return v9;
  return result;
}

- (float)_computeSmoothParameterForPhysicalTripod:(BOOL)a3 lowpassParameter:(float)a4 previousLowPassParameter:(float)a5 frameRateNormalization:(float)a6
{
  float v6;

  if (!a3)
    return fminf(a4, a5);
  v6 = fminf(self->_physicalTripodRate * 1.3, 1.0);
  self->_physicalTripodRate = v6;
  return fmaxf(self->_physicalTripodMinSmoothParameter, a5 - (float)(v6 / a6));
}

- (int)_computeMotionStatisticsWithQuaternion:(id *)a3 focalLength:(float)a4 maxAngleAccumulateOut:(double *)a5 maxAngleInstantOut:(double *)a6 translationOut:
{
  float32x2_t *v6;
  float32x2_t *v9;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  float32x2_t v21;
  double v23[4];
  char v24[8];
  uint64_t v25;
  unsigned int v26;
  float v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3 && a5 && a6 && (v9 = v6) != 0)
  {
    *v6 = 0;
    v13 = fabs(FigMotionMultiplyByInverseOfQuaternion(&a3->var0, (uint64_t *)self->_stabilizedCenterQuaternion));
    v14 = 2.0;
    if (v13 <= 2.0)
      v15 = v13;
    else
      v15 = 2.0;
    v23[0] = FigMotionMultiplyByInverseOfQuaternion(&a3->var0, (uint64_t *)&self->_lowpassQuaternionsInstant);
    v23[1] = v16;
    v23[2] = v17;
    v23[3] = v18;
    v19 = fabs(v23[0]);
    if (v19 <= 2.0)
      v14 = v19;
    pgs_inverseRotationMatrixFromQuaternion(v23, (uint64_t)v24);
    if (fabsf(v27) <= 0.00000001)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v20 = FigSignalErrorAt();
      v21 = 0;
    }
    else
    {
      v20 = 0;
      v21 = vmul_n_f32((float32x2_t)__PAIR64__(v26, v25), a4 / v27);
    }
    *v9 = v21;
    *a6 = acos(v14) * self->_frameRateNormalizationFactor;
    *a5 = acos(v15) * sqrt(self->_frameRateNormalizationFactor);
    return v20;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)computeStabilizationShiftUsingMetadata:(id)a3 pixelBufferDimensions:(id)a4 pixelSizeInMicrons:(float)a5 stabilizationShiftOut:(CGPoint *)a6
{
  BOOL *p_isFirstFrame;
  PreviewGyroStabilizationTransformContext *p_transformContext;
  CGPoint *p_imageCenter;
  float v12;
  int v13;
  double v14;
  unsigned __int8 *p_didHaveMotionData;
  int v16;
  int x;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  uint64_t v27;
  double *v28;
  $2FED4CF3216092304D4513EB121F1E87 *v29;
  __int128 v30;
  __int128 v31;
  double previousCaptureTime;
  double v33;
  float v34;
  _BOOL8 v35;
  float v36;
  uint64_t v37;
  $2FED4CF3216092304D4513EB121F1E87 *stabilizedCenterQuaternion;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BWPreviewGyroStabilization *v44;
  $2FED4CF3216092304D4513EB121F1E87 *stabilizedCenterQuaternionAdjusted;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __int128 v54;
  float v55;
  float v56;
  int v57;
  _OWORD v59[3];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;

  p_isFirstFrame = &self->_isFirstFrame;
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v57 = FigSignalErrorAt();
    goto LABEL_49;
  }
  self->_transformContext.width = a4.var0;
  p_transformContext = &self->_transformContext;
  self->_transformContext.height = a4.var1;
  self->_transformContext.imageCenter.x = ((double)a4.var0 + -1.0) * 0.5;
  p_imageCenter = &self->_transformContext.imageCenter;
  self->_transformContext.imageCenter.y = ((double)a4.var1 + -1.0) * 0.5;
  if (a5 <= 0.0)
    v12 = 1.0;
  else
    v12 = 1.0 / a5;
  self->_transformContext.pixelsPerMicron = v12;
  v66 = 0u;
  v67 = 0u;
  memset(v59, 0, sizeof(v59));
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v13 = -[BWPreviewGyroStabilization _extractMetadataFromTopToBottomRowsFromDictionary:cameraMetadata:quaternion:](self, "_extractMetadataFromTopToBottomRowsFromDictionary:cameraMetadata:quaternion:");
  if (!v13)
  {
    p_didHaveMotionData = &self->_motionData.didHaveMotionData;
    self->_transformContext.forceIdentity = self->_motionData.didHaveMotionData == 0;
    v16 = (int)((double)(int)v63 * 0.14);
    x = self->_transformContext.finalCropRect.origin.x;
    if (x <= self->_transformContext.finalCropRect.origin.y)
      x = self->_transformContext.finalCropRect.origin.y;
    if (x < v16)
      v16 = x;
    *((float *)p_isFirstFrame + 109) = (float)(*((float *)p_isFirstFrame + 127) * (float)v16) / 10.0;
    v18 = *((double *)&v66 + 1);
    v19 = *(double *)&v66;
    v20 = *((double *)&v67 + 1);
    v21 = *(double *)&v67;
    if (*((_DWORD *)p_isFirstFrame + 111) == 2)
    {
      LODWORD(v14) = DWORD1(v59[0]);
      -[BWPreviewGyroStabilization _adjustQuaternionForSagRemoval:focalLength:](self, "_adjustQuaternionForSagRemoval:focalLength:", v66, v67, v14);
      v19 = v22;
      v18 = v23;
      v21 = v24;
      v20 = v25;
    }
    v26 = *p_isFirstFrame;
    if (!*p_isFirstFrame)
    {
      if (!*p_didHaveMotionData)
        goto LABEL_45;
      if (self->_motionData.prevDidHaveMotionData)
        goto LABEL_20;
    }
    v27 = 0x7FFFFFFFFFFFFFCLL;
    do
    {
      v28 = (double *)((char *)self + v27 * 32);
      v29 = &self->_stabilizedCenterQuaternionAdjusted[v27];
      v30 = v67;
      *(_OWORD *)&v29->w = v66;
      *(_OWORD *)&v29->y = v30;
      v28[3383] = v19;
      v28[3384] = v18;
      v28[3385] = v21;
      v28[3386] = v20;
      ++v27;
    }
    while (v27 * 32);
    v31 = v67;
    *(_OWORD *)&self->_lowpassQuaternionsInstant.w = v66;
    *(_OWORD *)&self->_lowpassQuaternionsInstant.y = v31;
    if (!*p_didHaveMotionData)
    {
LABEL_45:
      if (self->_transformContext.forceIdentity)
      {
        v54 = v67;
        *(_OWORD *)&self->_stabilizedCenterQuaternion[0].w = v66;
        *(_OWORD *)&self->_stabilizedCenterQuaternion[0].y = v54;
        v55 = 0.0;
        v56 = 0.0;
        if (!a6)
        {
LABEL_48:
          v57 = 0;
          *((float *)p_isFirstFrame + 95) = v55;
          *((float *)p_isFirstFrame + 96) = v56;
          self->_motionData.prevDidHaveMotionData = *p_didHaveMotionData;
          self->_previousCaptureTime = *((double *)&v61 + 1);
          goto LABEL_49;
        }
      }
      else
      {
        v55 = *((float *)p_isFirstFrame + 88);
        v56 = *((float *)p_isFirstFrame + 91);
        if (!a6)
          goto LABEL_48;
      }
      a6->x = v55;
      a6->y = v56;
      goto LABEL_48;
    }
    if (!v26)
    {
LABEL_20:
      previousCaptureTime = self->_previousCaptureTime;
      if (*((double *)&v61 + 1) <= previousCaptureTime)
        v33 = 0.0333333333;
      else
        v33 = *((double *)&v61 + 1) - previousCaptureTime;
      self->_deltaFrameTime = v33;
      self->_frameRateNormalizationFactor = 0.0333333333 / v33;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06978]), "floatValue");
      if (p_isFirstFrame[452])
        v35 = v34 < 16.0 || *(double *)&v60 > 0.0299999993;
      else
        v35 = 0;
      -[BWPreviewGyroStabilization _adjustSmoothParameterWithQuaternion:cameraMetadata:reduceSmoothParameterForLowLight:](self, "_adjustSmoothParameterWithQuaternion:cameraMetadata:reduceSmoothParameterForLowLight:", &v66, v59, v35);
      v36 = *((float *)p_isFirstFrame + 112);
      if (v36 > 0.0)
        *((float *)p_isFirstFrame + 97) = v36;
    }
    if (p_isFirstFrame[440])
      v37 = 4;
    else
      v37 = 1;
    if (p_isFirstFrame[440])
      LODWORD(v14) = 1045220557;
    else
      LODWORD(v14) = *((_DWORD *)p_isFirstFrame + 97);
    *((_DWORD *)p_isFirstFrame + 98) = LODWORD(v14);
    self->_transformContext.limitFactor = 1.0;
    stabilizedCenterQuaternion = self->_stabilizedCenterQuaternion;
    v39 = *((_DWORD *)p_isFirstFrame + 111);
    if (v39)
    {
      if (v39 != 2)
      {
        if (v39 != 1)
        {
          v57 = -12780;
          goto LABEL_49;
        }
        LODWORD(v14) = *((_DWORD *)p_isFirstFrame + 97);
        v41 = *((double *)&v66 + 1);
        v40 = *(double *)&v66;
        v43 = *((double *)&v67 + 1);
        v42 = *(double *)&v67;
        v44 = self;
        stabilizedCenterQuaternionAdjusted = self->_stabilizedCenterQuaternion;
        v46 = 1;
        goto LABEL_43;
      }
      LODWORD(v14) = *((_DWORD *)p_isFirstFrame + 97);
      -[BWPreviewGyroStabilization _applyCascadeFiltering:quaternion:lowpassParameter:cascadeLevel:](self, "_applyCascadeFiltering:quaternion:lowpassParameter:cascadeLevel:", self->_stabilizedCenterQuaternion, 1, v66, v67, v14);
      stabilizedCenterQuaternion = self->_stabilizedCenterQuaternionAdjusted;
      LODWORD(v14) = *((_DWORD *)p_isFirstFrame + 98);
      v44 = self;
      stabilizedCenterQuaternionAdjusted = self->_stabilizedCenterQuaternionAdjusted;
      v40 = v19;
      v41 = v18;
      v42 = v21;
      v43 = v20;
    }
    else
    {
      v41 = *((double *)&v66 + 1);
      v40 = *(double *)&v66;
      v43 = *((double *)&v67 + 1);
      v42 = *(double *)&v67;
      v44 = self;
      stabilizedCenterQuaternionAdjusted = self->_stabilizedCenterQuaternion;
    }
    v46 = v37;
LABEL_43:
    -[BWPreviewGyroStabilization _applyCascadeFiltering:quaternion:lowpassParameter:cascadeLevel:](v44, "_applyCascadeFiltering:quaternion:lowpassParameter:cascadeLevel:", stabilizedCenterQuaternionAdjusted, v46, v40, v41, v42, v43, v14);
    FigMotionInterpolateQuaternionsByAngle((uint64_t)&v66, &self->_lowpassQuaternionsInstant.w, 0.05);
    self->_lowpassQuaternionsInstant.w = v47;
    self->_lowpassQuaternionsInstant.x = v48;
    self->_lowpassQuaternionsInstant.y = v49;
    self->_lowpassQuaternionsInstant.z = v50;
    self->_correctionQuaternion.w = FigMotionMultiplyByInverseOfQuaternion(&stabilizedCenterQuaternion->w, (uint64_t *)&v66);
    self->_correctionQuaternion.x = v51;
    self->_correctionQuaternion.y = v52;
    self->_correctionQuaternion.z = v53;
    v13 = pgs_computeTransformFromCameraMotion(&self->_correctionQuaternion.w, &p_imageCenter->x, (float32x2_t *)&self->_oisOffsetInput, (float32x2_t *)&self->_sagPosition, (uint64_t)self->_baseVector, *((float *)v59 + 1));
    if (!v13)
    {
      pgs_limitTransformToOverscan((uint64_t)p_transformContext, (int *)&v62 + 2, (uint64_t)self->_baseVector);
      goto LABEL_45;
    }
  }
  v57 = v13;
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_49:
  if (*p_isFirstFrame)
    *p_isFirstFrame = 0;
  return v57;
}

- (void)_applyCascadeFiltering:(id *)a3 quaternion:(id)a4 lowpassParameter:(float)a5 cascadeLevel:(int)a6
{
  int v8;
  uint64_t v9;
  $01BB1521EC52D44A8E7628F5261DCEC8 *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  $01BB1521EC52D44A8E7628F5261DCEC8 *v16;
  $01BB1521EC52D44A8E7628F5261DCEC8 *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  $01BB1521EC52D44A8E7628F5261DCEC8 v22;

  v22 = a4;
  if (a6 >= 4)
    v8 = 4;
  else
    v8 = a6;
  v9 = (v8 - 1);
  v10 = &a3[(int)v9];
  FigMotionInterpolateQuaternionsByAngle((uint64_t)&v22, &v10->var0, a5);
  v10->var0 = v11;
  v10->var1 = v12;
  v10->var2 = v13;
  v10->var3 = v14;
  if (v8 >= 2)
  {
    v15 = v9 + 1;
    v16 = &a3[v9];
    do
    {
      v17 = &a3[(v15 - 2)];
      FigMotionInterpolateQuaternionsByAngle((uint64_t)v16, &v17->var0, a5);
      v17->var0 = v18;
      v17->var1 = v19;
      v17->var2 = v20;
      v17->var3 = v21;
      --v15;
      --v16;
    }
    while (v15 > 1);
  }
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_adjustQuaternionForSagRemoval:(id)a3 focalLength:(float)a4
{
  $38C3DEC81229B66F67FB6D350D75FF5A *p_oisOffsetInput;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14[4];
  float v15[3];
  $01BB1521EC52D44A8E7628F5261DCEC8 v16;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  p_oisOffsetInput = &self->_oisOffsetInput;
  v16 = a3;
  v15[0] = atanf(self->_oisOffsetInput.y / a4);
  v15[1] = -atanf(p_oisOffsetInput->x / a4);
  v15[2] = 0.0;
  FigMotionQuaternionFromDeltaRotation(v15);
  v14[0] = v6;
  v14[1] = v7;
  v14[2] = v8;
  v14[3] = v9;
  v10 = FigMotionMultiplyQuaternions(&v16.var0, v14);
  result.var3 = v13;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (int)_extractMetadataFromTopToBottomRowsFromDictionary:(__CFDictionary *)a3 cameraMetadata:(id *)a4 quaternion:(id *)a5
{
  char *v5;
  const __CFDictionary *v6;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  double *v10;
  const __CFDictionary *v11;
  char *v12;
  int v13;
  int v14;
  int v15;
  double v21;
  float v22;
  int v23;
  double v24;
  float v25;
  double v26;
  int v27;
  int v28;
  double v29;
  const void *Value;
  int v31;
  uint64_t v32;
  double v33;
  int MotionDataFromISP;
  int *v35;
  char *v36;
  uint64_t v37;
  int v38;
  double *v39;
  int *v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  char *v44;
  float32x2_t *v45;
  float32x2_t *v46;
  float32x2_t *v47;
  int v48;
  float32x2_t v49;
  float32x2_t v50;
  float32x2_t *v51;
  uint64_t v52;
  uint64_t v53;
  float32x2_t v54;
  float32x2_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  float32x2_t *v59;
  int v60;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[2];
  __int128 v67;
  float64x2_t v68;
  _QWORD v69[659];

  v5 = (char *)MEMORY[0x1E0C80A78](self, a2, a3, a4);
  v69[658] = *MEMORY[0x1E0C80C00];
  if (v6)
  {
    v9 = v7;
    if (v7)
    {
      v10 = v8;
      if (v8)
      {
        v11 = v6;
        v12 = v5;
        v13 = objc_msgSend(v5, "_getAllMetadataFromDictionary:cameraMetadata:");
        if (v13)
        {
          v60 = v13;
          fig_log_get_emitter();
        }
        else
        {
          v63 = 0;
          v64 = 0;
          if (*(_OWORD *)(v9 + 88) == 0)
            *(_QWORD *)(v9 + 96) = *((_QWORD *)v12 + 1);
          v14 = *((_DWORD *)v12 + 2);
          v15 = *((_DWORD *)v12 + 3);
          v66[0] = 0;
          v66[1] = 0;
          __asm { FMOV            V0.2D, #1.0 }
          v67 = _Q0;
          FigCFDictionaryGetCGRectIfPresent();
          v21 = (float)v14;
          v22 = v21 * 0.0 + 0.5;
          v23 = llroundf(v22);
          v24 = (float)v15;
          v25 = v24 * 0.0 + 0.5;
          v26 = *((double *)&v67 + 1);
          *(float *)&v21 = v21 * *(double *)&v67 + -0.5;
          v27 = llroundf(*(float *)&v21);
          *((_DWORD *)v12 + 9) = v23;
          *((_DWORD *)v12 + 10) = llroundf(v25);
          *(float *)&v21 = v24 * v26 + -0.5;
          v28 = llroundf(*(float *)&v21);
          *((_DWORD *)v12 + 11) = v27;
          *((_DWORD *)v12 + 12) = v28;
          v29 = *(double *)(v9 + 32)
              + *(double *)(v9 + 48) * -0.5
              + ((double)v28 + -1.0) / (double)v28 * 0.5 * *(double *)(v9 + 56);
          *(double *)(v9 + 72) = v29;
          v62 = 0;
          Value = CFDictionaryGetValue(v11, (const void *)*MEMORY[0x1E0D06D00]);
          v31 = portIndexFromPortType(Value, (int *)&v62);
          if (v31)
          {
            v60 = v31;
            fig_log_get_emitter();
          }
          else
          {
            v32 = v62;
            v33 = *((double *)v12 + 1289);
            bzero(&v68, 0x14A0uLL);
            bzero(v66, 0x2FD0uLL);
            v65 = 0;
            MotionDataFromISP = FigMotionGetMotionDataFromISP(v11, &v68, 0, 110, (int *)&v65 + 1, 0, (uint64_t)v66, 510, (int *)&v65);
            if (MotionDataFromISP)
            {
              v60 = MotionDataFromISP;
              fig_log_get_emitter();
              FigDebugAssert3();
              fig_log_get_emitter();
            }
            else
            {
              v35 = (int *)(v12 + 64);
              v36 = v12 + 10328;
              v37 = HIDWORD(v65);
              if (SHIDWORD(v65) >= 1)
              {
                v38 = *v35;
                v39 = (double *)v69;
                do
                {
                  *(double *)&v35[2 * v38 + 2] = v33 + -0.005 + *(v39 - 1);
                  v40 = &v35[8 * v38 + 514];
                  v42 = *(_OWORD *)v39;
                  v41 = *((_OWORD *)v39 + 1);
                  v39 += 6;
                  *(_OWORD *)v40 = v42;
                  *((_OWORD *)v40 + 1) = v41;
                  v38 = (*v35 + 1);
                  *v35 = v38;
                  --v37;
                }
                while (v37);
              }
              v43 = v65;
              if ((int)v65 >= 1)
              {
                v44 = &v36[v32 + 16416];
                v45 = (float32x2_t *)&v36[8 * v32];
                v46 = v45 + 2049;
                v47 = v45 + 2053;
                v48 = *(_DWORD *)&v36[4 * v32];
                v49 = (float32x2_t)vdup_n_s32(0x3C23D700u);
                v50 = (float32x2_t)vdup_n_s32(0x3F7D70A4u);
                v51 = (float32x2_t *)&v67;
                do
                {
                  v52 = v48;
                  v53 = (uint64_t)&v36[4096 * v32 + 8 * v48];
                  *(float32x2_t *)(v53 + 8) = v51[-2];
                  *(float32x2_t *)(v53 + 8200) = v51[-1];
                  if (*v44)
                  {
                    *(float32x2_t *)(*(_QWORD *)v46 + 8 * v52) = *v51;
                    v54 = *v51;
                    *v44 = 0;
                  }
                  else
                  {
                    v55 = vmla_f32(vmul_f32(*v51, v49), v50, *v47);
                    *(float32x2_t *)(*(_QWORD *)v46 + 8 * v52) = v55;
                    v54 = v55;
                  }
                  *v47 = v54;
                  v48 = ((unsigned __int16)*(_DWORD *)&v36[4 * v32] + 1) & 0x1FF;
                  *(_DWORD *)&v36[4 * v32] = v48;
                  v51 += 3;
                  --v43;
                }
                while (v43);
              }
              FigMotionComputeQuaternionForTimeStamp((uint64_t)v35, v10, v12 + 10322, v29);
              if (!v12[10322])
              {
                fig_log_get_emitter();
                FigDebugAssert3();
                return FigSignalErrorAt();
              }
              *v10 = FigMotionMultiplyQuaternions(v10, (double *)v12 + 3346);
              *((_QWORD *)v10 + 1) = v56;
              *((_QWORD *)v10 + 2) = v57;
              *((_QWORD *)v10 + 3) = v58;
              if (!*(_BYTE *)(v9 + 12))
              {
                v60 = 0;
                *(_OWORD *)(v12 + 27128) = 0u;
                return v60;
              }
              if (*((_DWORD *)v12 + 6811) == 1)
                v59 = (float32x2_t *)(v12 + 27136);
              else
                v59 = 0;
              v60 = FigMotionComputeLensMovementAndSagForTimeStamp((uint64_t)(v12 + 10328), (float32x2_t *)v12 + 3391, v59, v62, v29, *(float *)(v9 + 16));
              if (!v60)
                return v60;
              fig_log_get_emitter();
            }
          }
        }
        FigDebugAssert3();
        return v60;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_getAllMetadataFromDictionary:(__CFDictionary *)a3 cameraMetadata:(id *)a4
{
  __int128 v6;
  int v7;
  int v8;
  int v10;
  int v11;
  __int128 v12;
  __int128 v13;

  if (a3 && a4)
  {
    *(_OWORD *)&a4->var15.origin.y = 0u;
    *(_OWORD *)&a4->var15.size.height = 0u;
    *(_OWORD *)&a4->var13.var0 = 0u;
    *(_OWORD *)&a4->var14.var1.var0 = 0u;
    *(_OWORD *)&a4->var9 = 0u;
    *(_OWORD *)&a4->var11 = 0u;
    *(_OWORD *)&a4->var4 = 0u;
    *(_OWORD *)&a4->var7 = 0u;
    *(_OWORD *)&a4->var0 = 0u;
    a4->var14.var0 = 0;
    a4->var14.var1 = 0;
    v6 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *MEMORY[0x1E0C9D648];
    v13 = v6;
    if (FigCFDictionaryGetCGRectIfPresent())
    {
      v7 = llround(*((double *)&v12 + 1));
      a4->var14.var0.var0 = llround(*(double *)&v12);
      a4->var14.var0.var1 = v7;
      v8 = llround(*((double *)&v13 + 1));
      a4->var14.var1.var0 = llround(*(double *)&v13);
      a4->var14.var1.var1 = v8;
    }
    a4->var3 = CFDictionaryContainsKey(a3, (const void *)*MEMORY[0x1E0D06E58]);
    if (FigCFDictionaryGetDoubleIfPresent())
    {
      v11 = 0;
      if (FigCFDictionaryGetInt32IfPresent() || FigCFDictionaryGetInt32IfPresent())
      {
        a4->var10 = (double)v11 / 1000000.0;
        if (!FigCFDictionaryGetInt32IfPresent())
          a4->var17 = 1;
        v10 = 0;
        FigCFDictionaryGetFloatIfPresent();
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (id)initForStillImagePreview:(BOOL)a3
{
  _BOOL8 v3;
  BWPreviewGyroStabilization *v4;
  BWPreviewGyroStabilization *v5;
  uint64_t v6;
  char i;
  char v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  BWPreviewGyroStabilizationPanningDetection *v10;
  double v11;
  BWPreviewGyroStabilizationTripodDetection *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v18;

  v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BWPreviewGyroStabilization;
  v4 = -[BWPreviewGyroStabilization init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    -[BWPreviewGyroStabilization _setDefaultParametersForStillImagePreview:isFrontCamera:](v4, "_setDefaultParametersForStillImagePreview:isFrontCamera:", v3, 0);
    v6 = 0;
    for (i = 1; ; i = 0)
    {
      v8 = i;
      v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(0x1000uLL, 0x100004000313F17uLL);
      v5->_hallData.fusedRingSagPosition[v6] = v9;
      if (!v9)
        break;
      v6 = 1;
      if ((v8 & 1) == 0)
      {
        v10 = [BWPreviewGyroStabilizationPanningDetection alloc];
        *(float *)&v11 = v5->_panningSpeedThreshold;
        v5->_previewPanningDetection = -[BWPreviewGyroStabilizationPanningDetection initWithPanningThreshold:](v10, "initWithPanningThreshold:", v11);
        v12 = [BWPreviewGyroStabilizationTripodDetection alloc];
        *(float *)&v14 = v5->_tripodMaxAngleThresholdAccumulate;
        *(float *)&v13 = v5->_tripodMaxAngleThresholdInstant;
        *(float *)&v15 = v5->_physicalTripodLikelyMaxAngleThreshold;
        *(float *)&v16 = v5->_physicalTripodGuaranteedMaxAngleThreshold;
        v5->_previewTripodDetection = -[BWPreviewGyroStabilizationTripodDetection initWithTripodDetectionThresholds:tripodMaxAngleThresholdAccumulate:physicalTripodLikelyMaxAngleThreshold:physicalTripodGuaranteedMaxAngleThreshold:](v12, "initWithTripodDetectionThresholds:tripodMaxAngleThresholdAccumulate:physicalTripodLikelyMaxAngleThreshold:physicalTripodGuaranteedMaxAngleThreshold:", v13, v14, v15, v16);
        return v5;
      }
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **fusedRingSagPosition;
  char v5;
  char v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v7;
  objc_super v8;

  v3 = 0;
  fusedRingSagPosition = self->_hallData.fusedRingSagPosition;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = fusedRingSagPosition[v3];
    if (v7)
    {
      fusedRingSagPosition[v3] = 0;
      free(v7);
    }
    v5 = 0;
    v3 = 1;
  }
  while ((v6 & 1) != 0);
  v8.receiver = self;
  v8.super_class = (Class)BWPreviewGyroStabilization;
  -[BWPreviewGyroStabilization dealloc](&v8, sel_dealloc);
}

- (int)_limitSmoothParameterToOverscanWithQuaternion:(id *)a3 cameraMetadata:(id *)a4 minSmoothParameter:(float)a5 smoothParameterInOut:(float *)a6
{
  PreviewGyroStabilizationTransformContext *p_transformContext;
  float v12;
  CGPoint *p_imageCenter;
  $2FED4CF3216092304D4513EB121F1E87 *stabilizedCenterQuaternion;
  $38C3DEC81229B66F67FB6D350D75FF5A *p_oisOffsetInput;
  $38C3DEC81229B66F67FB6D350D75FF5A *p_sagPosition;
  int result;
  BOOL v18;
  float v19;
  char v20;
  BOOL v21;

  v20 = 1;
  p_transformContext = &self->_transformContext;
  self->_transformContext.prevTransformLimited = 0;
  v12 = *a6;
  p_imageCenter = &self->_transformContext.imageCenter;
  stabilizedCenterQuaternion = self->_stabilizedCenterQuaternion;
  p_oisOffsetInput = &self->_oisOffsetInput;
  p_sagPosition = &self->_sagPosition;
  result = pgs_iir_TestCorrectionFitsForSmoothParameter((uint64_t)&self->_transformContext, &self->_transformContext.imageCenter.x, (uint64_t *)a3, &self->_stabilizedCenterQuaternion[0].w, (uint64_t)a4, (float32x2_t *)&self->_oisOffsetInput, (float32x2_t *)&self->_sagPosition, (BOOL *)&v20, *a6);
  if (result)
    v18 = 0;
  else
    v18 = v20 == 0;
  if (v18)
  {
    self->_transformContext.prevTransformLimited = 1;
    if (v12 < a5)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      result = FigSignalErrorAt();
      v19 = a5;
    }
    else
    {
      while (1)
      {
        v19 = a5;
        if ((float)(v12 - a5) <= 0.01)
          break;
        v21 = 0;
        a5 = (float)(v12 + a5) * 0.5;
        result = pgs_iir_TestCorrectionFitsForSmoothParameter((uint64_t)p_transformContext, &p_imageCenter->x, (uint64_t *)a3, &stabilizedCenterQuaternion->w, (uint64_t)a4, (float32x2_t *)p_oisOffsetInput, (float32x2_t *)p_sagPosition, &v21, (float)(v12 + v19) * 0.5);
        if (!v21)
        {
          v12 = (float)(v12 + v19) * 0.5;
          a5 = v19;
        }
        if (result)
          goto LABEL_13;
      }
      result = 0;
    }
LABEL_13:
    *a6 = v19;
  }
  return result;
}

- (float)_computeSmoothParameterForNonStationaryCaseWithPanningStatus:(BOOL)a3 frameIsSphereStabilized:(BOOL)a4 previousLowPassParameter:(float)a5 rampDownRate:(float)a6 rampUpRate:(float)a7 targetSmoothParameter:(float)a8
{
  if (!a4)
    return fmaxf(a8, a5 - a6);
  if (a3 && self->_transformContext.prevTransformLimited)
    return a5 - a6;
  if (a5 <= a8)
    return fminf(a8, a5 + a7);
  else
    return fmaxf(a8, a5 - a6);
}

- (void)_setDefaultParametersForStillImagePreview:(BOOL)a3 isFrontCamera:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  unsigned __int8 *isFirstSample;
  uint64_t v8;
  int v9;
  double v10;
  double v11;
  double v12;
  int v13;
  int v14;
  unsigned int v15;

  v4 = a4;
  v5 = a3;
  isFirstSample = self->_hallData.isFirstSample;
  self->_isStillImagePreview = a3;
  self->_sagRemovalMethod = 0;
  self->_isFirstFrame = 1;
  *(_WORD *)&self->_motionData.didHaveMotionData = 257;
  self->_previousCaptureTime = 0.0;
  *(_WORD *)self->_hallData.isFirstSample = 257;
  self->_frameRateNormalizationFactor = 1.0;
  self->_sagPosition = 0;
  -[BWPreviewGyroStabilizationPanningDetection reset](self->_previewPanningDetection, "reset");
  -[BWPreviewGyroStabilizationTripodDetection reset](self->_previewTripodDetection, "reset");
  v8 = 0;
  *((_DWORD *)isFirstSample + 122) = 1000593162;
  do
    FigMotionInitializeQuaternion(&self->_stabilizedCenterQuaternion[v8++].w);
  while (v8 != 4);
  FigMotionInitializeQuaternion(&self->_lowpassQuaternionsInstant.w);
  FigMotionInitializeQuaternion(&self->_correctionQuaternion.w);
  self->_transformContext.limitFactor = 1.0;
  self->_deltaFrameTime = 0.0333333333;
  *((_DWORD *)isFirstSample + 111) = 1057971241;
  self->_quaternionThreshold = 0.99;
  if (v4)
  {
    v9 = FigCaptureCameraRequires180DegreesRotation(1, 0);
    v10 = -0.707106781;
    v11 = 0.0;
    if (v9)
    {
      v12 = 0.707106781;
    }
    else
    {
      v10 = 0.0;
      v12 = 0.0;
    }
    if (!v9)
      v11 = 0.707106781;
  }
  else
  {
    v11 = 0.0;
    v12 = 0.707106781;
    v10 = -0.707106781;
  }
  self->_extrinsicAlignmentPose.w = v11;
  self->_extrinsicAlignmentPose.x = v12;
  self->_extrinsicAlignmentPose.y = v10;
  self->_extrinsicAlignmentPose.z = v11;
  *((_OWORD *)isFirstSample + 33) = xmmword_1A32B15D0;
  *((_DWORD *)isFirstSample + 136) = 1000593162;
  *((_DWORD *)isFirstSample + 138) = 30;
  *(_OWORD *)(isFirstSample + 564) = xmmword_1A32B15E0;
  *(_OWORD *)(isFirstSample + 580) = xmmword_1A32B15F0;
  if (v5)
    v13 = 2;
  else
    v13 = 1;
  if (v5)
    v14 = 10;
  else
    v14 = 20;
  if (v5)
    v15 = -1;
  else
    v15 = 0;
  *((_DWORD *)isFirstSample + 125) = v13;
  *((_DWORD *)isFirstSample + 137) = v14;
  *(int8x8_t *)(isFirstSample + 556) = vbsl_s8((int8x8_t)vdup_n_s32(v15), (int8x8_t)0x500000096, (int8x8_t)0x140000003CLL);
  isFirstSample[496] = 0;
  *((_DWORD *)isFirstSample + 126) = -1082130432;
}

@end
