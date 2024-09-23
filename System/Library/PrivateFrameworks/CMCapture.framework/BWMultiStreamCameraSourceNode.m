@implementation BWMultiStreamCameraSourceNode

BOOL __72__BWMultiStreamCameraSourceNode_updateFormatRequirementsFromSourceNode___block_invoke(uint64_t a1, void *a2)
{
  if (!((unint64_t)FigCapturePixelFormatTileAlignment(objc_msgSend(a2, "intValue")) >> 32))
    return 1;
  if (*(_QWORD *)(a1 + 32))
    return 0;
  if (!*(_QWORD *)(a1 + 40))
    return 1;
  return *(_BYTE *)(a1 + 48) != 0;
}

- (id)_supportedPixelFormatsForOutputID:(id *)result
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int IsFullRange;
  int IsTenBit;
  char v10;
  int v11;
  _BOOL4 v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  int v26;
  int v27;
  int CompressionType;
  int LossyCompressionLevel;
  int v30;
  char v32;
  _BOOL4 v33;
  id v34;
  _BOOL4 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(result[15], "objectAtIndexedSubscript:", *((int *)result + 80));
    v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EE8]), "objectForKeyedSubscript:", a2);
    v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D08068]);
    v7 = objc_msgSend(v3[39], "clientVideoFormat");
    IsFullRange = FigCapturePixelFormatIsFullRange(v7);
    IsTenBit = FigCapturePixelFormatIsTenBit(v7);
    v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v3[39], "previewOutputEnabled"))
      v10 = objc_msgSend(v3[39], "videoCaptureOutputEnabled");
    else
      v10 = 0;
    v11 = HIDWORD(v3[63 * (int)mscsn_streamOutputIndexForOutputID(a2) + 48]);
    if (FigCapturePlatformSupportsUniversalCompression())
      v12 = 1;
    else
      v12 = FigCapturePlatformSupportsHTPC16x8Compression() != 0;
    v33 = v12;
    v35 = FigCapturePlatformSupportsUniversalLossyCompression() != 0;
    if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FF8]) & 1) != 0
      || objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D08000]))
    {
      IsTenBit = objc_msgSend(v3[39], "stillImageOutputRequires10BitPixelFormat");
      v13 = objc_msgSend(v3[39], "stillImageMaxLossyCompressionLevel");
      v14 = 0;
      IsFullRange = 1;
    }
    else
    {
      if (objc_msgSend(a2, "isEqualToString:", v3[1326]))
        v14 = FigCapturePixelFormatIs422(v7);
      else
        v14 = 0;
      if ((objc_msgSend(v3[39], "faceTrackingEnabled") & 1) != 0
        || objc_msgSend((id)objc_msgSend(v3[39], "visionDataConfiguration"), "count"))
      {
        v33 = 0;
        v35 = 0;
      }
      v13 = 3;
    }
    if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D08010]))
    {
      if (!*((_BYTE *)v3 + 160))
      {
        v15 = objc_msgSend(v3[12], "sensorRawPixelFormat");
        if (!objc_msgSend(v6, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15)))return (id *)v34;
        v16 = (void *)MEMORY[0x1E0CB37E8];
        v17 = v15;
LABEL_25:
        v18 = objc_msgSend(v16, "numberWithUnsignedInt:", v17);
LABEL_29:
        objc_msgSend(v34, "addObject:", v18);
        return (id *)v34;
      }
LABEL_28:
      v18 = objc_msgSend(v6, "firstObject");
      goto LABEL_29;
    }
    if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FD8]))
    {
      if (!objc_msgSend(v6, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7)))return (id *)v34;
      v16 = (void *)MEMORY[0x1E0CB37E8];
      v17 = v7;
      goto LABEL_25;
    }
    if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FE8]))
    {
      if (!*((_BYTE *)v3 + 160))
        return (id *)v34;
      goto LABEL_28;
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (!v19)
      return (id *)v34;
    v20 = v19;
    v21 = (v11 & 3) == 0;
    v22 = *(_QWORD *)v37;
    if (v21)
      v23 = v10;
    else
      v23 = 0;
    v32 = v23 & v33;
LABEL_37:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v22)
        objc_enumerationMutation(v6);
      v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v24);
      v26 = objc_msgSend(v25, "intValue");
      if (!v26)
        goto LABEL_58;
      v27 = v26;
      if (IsFullRange != FigCapturePixelFormatIsFullRange(v26)
        || IsTenBit != FigCapturePixelFormatIsTenBit(v27)
        || v14 != FigCapturePixelFormatIs422(v27))
      {
        goto LABEL_58;
      }
      CompressionType = FigCapturePixelFormatGetCompressionType(v27);
      if (!CompressionType)
        break;
      if (CompressionType == 2)
      {
        if ((v32 & 1) != 0)
          break;
      }
      else if (v33)
      {
        break;
      }
LABEL_58:
      if (v20 == ++v24)
      {
        v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (!v20)
          return (id *)v34;
        goto LABEL_37;
      }
    }
    LossyCompressionLevel = FigCapturePixelFormatGetLossyCompressionLevel(v27);
    if (LossyCompressionLevel)
      v30 = v35;
    else
      v30 = 1;
    if (v30 == 1 && LossyCompressionLevel <= v13)
      objc_msgSend(v34, "addObject:", v25);
    goto LABEL_58;
  }
  return result;
}

- (int)configure:(id)a3
{
  int updated;
  int v6;
  int v7;
  double v8;
  BOOL v9;
  double v10;

  self->_configuration = (BWMultiStreamCameraSourceNodeConfiguration *)a3;
  -[BWMultiStreamCameraSourceNode _updateBufferPoolSharingProperties]((unint64_t)self);
  -[BWMultiStreamCameraSourceNode _updateDepthSettings]((uint64_t)self);
  if (-[BWMultiStreamCameraSourceNodeConfiguration depthType](self->_configuration, "depthType") - 1 < 2
    || (objc_msgSend(a3, "originalCameraIntrinsicMatrixDeliveryOnPreviewOutputEnabled") & 1) != 0
    || (objc_msgSend(a3, "originalCameraIntrinsicMatrixDeliveryOnVideoCaptureOutputEnabled") & 1) != 0
    || (objc_msgSend(a3, "originalCameraIntrinsicMatrixDeliveryOnDepthOutputEnabled") & 1) != 0
    || (objc_msgSend(a3, "originalCameraIntrinsicMatrixDeliveryOnStillImageOutputEnabled") & 1) != 0
    || (objc_msgSend(a3, "cameraIntrinsicMatrixDeliveryOnPreviewOutputEnabled") & 1) != 0
    || objc_msgSend(a3, "cameraIntrinsicMatrixDeliveryOnVideoCaptureOutputEnabled"))
  {
    -[BWMultiStreamCameraSourceNode _retrieveCameraCharacterizationDataForCameraIntrinsicMatrixDelivery]((uint64_t)self);
  }
  self->_firmwareStillImageOutputRetainedBufferCountOverride = objc_msgSend(a3, "firmwareStillImageOutputRetainedBufferCountOverride");
  self->_stillImageOutputSushiRawAttachmentOptionEnabled = objc_msgSend(a3, "stillImageOutputSushiRawAttachmentOptionEnabled");
  updated = -[BWMultiStreamCameraSourceNode _updateOutputRequirements]((uint64_t)self);
  if (updated)
  {
    v7 = updated;
LABEL_22:
    FigDebugAssert3();
    return v7;
  }
  -[BWMultiStreamCameraSourceNode updateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping](self, "updateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping");
  v6 = -[BWMultiStreamCameraSourceNode _updateGDCStrengthAndBaseZoomFactorAfterGDC]((id *)&self->super.super.super.isa);
  if (v6)
  {
    v7 = v6;
    goto LABEL_22;
  }
  -[BWMultiStreamCameraSourceNode _updateDolbyVisionMetadataOutputEnabledConfiguration]((uint64_t)self);
  if (-[BWFigVideoCaptureDevice adaptiveOverscanEnabled](self->_captureDevice, "adaptiveOverscanEnabled")
    && !self->_streamConfigurationQueue)
  {
    self->_streamConfigurationQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  }
  if (self->_bravoShiftRestrictedToHighestNondisruptiveZoomRange)
    return 0;
  -[BWMultiStreamCameraSourceNodeConfiguration visOverscan](self->_configuration, "visOverscan");
  v7 = 0;
  v9 = v8 == *MEMORY[0x1E0C9D820];
  if (v10 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    v9 = 0;
  self->_bravoShiftRestrictedToHighestNondisruptiveZoomRange = v9;
  return v7;
}

- (unint64_t)_updateBufferPoolSharingProperties
{
  unint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;

  if (result)
  {
    v1 = result;
    if (!objc_msgSend(*(id *)(result + 96), "isBravoVariant")
      || (v2 = *(_QWORD *)(v1 + 104), v2 == objc_msgSend(*(id *)(v1 + 96), "captureStream")))
    {
      v4 = 0;
      v3 = 0;
    }
    else
    {
      v3 = objc_msgSend(*(id *)(v1 + 312), "streamingRequiredWhenConfiguredAsSlave") ^ 1;
      v4 = 1;
    }
    *(_BYTE *)(v1 + 376) = v3;
    result = objc_msgSend(*(id *)(v1 + 96), "overCaptureEnabled");
    if ((_DWORD)result)
    {
      v5 = *(_BYTE *)(v1 + 376);
      if (v5)
      {
        result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "captureStreams"), "indexOfObject:", *(_QWORD *)(v1 + 104));
        v5 = result > 1;
      }
      *(_BYTE *)(v1 + 376) = v5;
    }
    *(_BYTE *)(v1 + 377) = v4;
    *(_BYTE *)(v1 + 378) = v4;
  }
  return result;
}

- (void)updateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping
{
  uint64_t v3;
  NSDictionary *v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  v3 = -[BWMultiStreamCameraSourceNode _ultraHighResolutionNondisruptiveStreamingFormatIndex]((uint64_t)self);
  -[BWMultiStreamCameraSourceNode _calculateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping:nondisruptiveSwitchingFormatIndicesByZoomfactorSIFRNonBinnedOut:ultraHighResolutionNondisruptiveStreamingFormatIndex:]((unint64_t)self, &v7, &v6, v3);
  v4 = -[BWMultiStreamCameraSourceNodeConfiguration quadraSubPixelSwitchingParameters](self->_configuration, "quadraSubPixelSwitchingParameters");
  if (v4)
    v5 = v4;
  else
    v5 = -[FigCaptureCameraParameters quadraSubPixelSwitchingParametersForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "quadraSubPixelSwitchingParametersForPortType:sensorIDString:", self->_portType, -[BWFigVideoCaptureStream sensorIDString](self->_captureStream, "sensorIDString"));
  -[BWFigVideoCaptureDevice setNondisruptiveSwitchingFormatIndicesByZoomFactorSIFRBinned:nondisruptiveSwitchingFormatIndicesByZoomFactorSIFRNonBinned:ultraHighResolutionNondisruptiveStreamingFormatIndex:mainFormatSIFRBinningFactor:forPortType:quadraSubPixelSwitchingParameters:](self->_captureDevice, "setNondisruptiveSwitchingFormatIndicesByZoomFactorSIFRBinned:nondisruptiveSwitchingFormatIndicesByZoomFactorSIFRNonBinned:ultraHighResolutionNondisruptiveStreamingFormatIndex:mainFormatSIFRBinningFactor:forPortType:quadraSubPixelSwitchingParameters:", v7, v6, v3, self->_mainFormatSIFRBinningFactor, self->_portType, v5, v6, v7);
}

- (uint64_t)_updateOverscanReservedInISPZoom
{
  uint64_t v1;
  float v2;
  float v3;
  double v4;
  double v5;
  float v6;
  float v7;

  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 312), "overscanForShiftMitigation");
    if (v2 > 0.0)
    {
      v3 = v2;
      objc_msgSend(*(id *)(v1 + 312), "visOverscan");
      objc_msgSend(*(id *)(v1 + 312), "visOverscan");
      objc_msgSend(*(id *)(v1 + 312), "visOverscan");
      objc_msgSend(*(id *)(v1 + 312), "visOverscan");
      if (v4 >= v3)
      {
        objc_msgSend(*(id *)(v1 + 312), "visOverscan");
        v3 = v5;
      }
      result = objc_msgSend(*(id *)(v1 + 312), "additionalVISOverscanReservedInZoom");
      if (v6 != 0.0)
      {
        result = objc_msgSend(*(id *)(v1 + 312), "additionalVISOverscanWhenRecording");
        v3 = v3 * (float)(v7 + 1.0);
      }
      if (*(float *)(v1 + 10544) != v3)
        *(float *)(v1 + 10544) = v3;
    }
  }
  return result;
}

- (double)_totalAvailableOverscan
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 312), "visOverscan");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
  v4 = *(void **)(a1 + 312);
  if (v3 <= v5)
    objc_msgSend(v4, "sensorOverscan");
  else
    objc_msgSend(v4, "visOverscan");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 312), "visOverscan");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
  v10 = *(void **)(a1 + 312);
  if (v9 <= v11)
    objc_msgSend(v10, "sensorOverscan");
  else
    objc_msgSend(v10, "visOverscan");
  return v7;
}

- (double)_overscanWithFOVSacrifice
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 312), "visOverscan");
  v3 = v2 + 1.0;
  objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
  v5 = 0.0;
  if (v3 / (v4 + 1.0) + -1.0 >= 0.0)
  {
    objc_msgSend(*(id *)(a1 + 312), "visOverscan");
    v7 = v6 + 1.0;
    objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
    v5 = v7 / (v8 + 1.0) + -1.0;
  }
  objc_msgSend(*(id *)(a1 + 312), "visOverscan");
  v10 = v9 + 1.0;
  objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
  if (v10 / (v11 + 1.0) + -1.0 >= 0.0)
  {
    objc_msgSend(*(id *)(a1 + 312), "visOverscan");
    objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
  }
  return v5;
}

- (uint64_t)_updateGDCStrengthAndBaseZoomFactorAfterGDC
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;

  if (!a1)
    return 0;
  objc_msgSend(a1[39], "visOverscan");
  v4 = -[BWMultiStreamCameraSourceNode _outputConfigurationsForAllOutputsWithVISOverscan:](a1, v2, v3);
  if (v4)
  {
    v8 = 0;
    v5 = -[BWMultiStreamCameraSourceNode _updateGDCStrengthForOutputConfigurations:updatedOutputConfigurations:]((uint64_t)a1, v4, &v8);
    if ((_DWORD)v5)
    {
      v6 = v5;
    }
    else
    {
      v6 = -[BWMultiStreamCameraSourceNode _updateBaseZoomFactorAfterGDCFromOutputConfigurations:]((uint64_t)a1, v8);
      if (!(_DWORD)v6)
        return v6;
    }
    FigDebugAssert3();
    return v6;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (uint64_t)_updateGDCStrengthForOutputConfigurations:(_QWORD *)a3 updatedOutputConfigurations:
{
  uint64_t v5;
  int *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  int *v19;
  uint64_t v20;
  const __CFDictionary *v21;
  CGSize v22;
  double width;
  double height;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  float v29;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  uint64_t v39;
  float v40;
  float v41;
  float v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  CGRect rect;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;
  uint64_t v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v6 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
    if ((objc_msgSend(*(id *)(result + 312), "geometricDistortionCorrectionOnStillImageOutputEnabled") & 1) != 0
      || (objc_msgSend(*(id *)(v5 + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled") & 1) != 0
      || (result = objc_msgSend(*(id *)(v5 + 312), "geometricDistortionCorrectionOnPreviewOutputEnabled"), (_DWORD)result))
    {
      if (a2)
      {
        v43 = a3;
        v55 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v7 = (void *)objc_msgSend(*(id *)(v5 + 120), "objectAtIndexedSubscript:", *(int *)(v5 + 320));
        v8 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EE8]);
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v63;
          v56 = *MEMORY[0x1E0D08088];
          v54 = *MEMORY[0x1E0D08078];
          v49 = *MEMORY[0x1E0D07F20];
          v47 = *MEMORY[0x1E0D08040];
          v48 = *MEMORY[0x1E0D08050];
          v45 = *MEMORY[0x1E0D08048];
          v46 = *MEMORY[0x1E0D08058];
          v44 = *MEMORY[0x1E0D07FF8];
          v53 = *MEMORY[0x1E0D07FE0];
          v52 = *MEMORY[0x1E0D07F38];
          v50 = *(_QWORD *)v63;
          do
          {
            v12 = 0;
            v51 = v10;
            do
            {
              if (*(_QWORD *)v63 != v11)
                objc_enumerationMutation(a2);
              v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v12);
              v14 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v13);
              v15 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", v13);
              if (objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v56), "BOOLValue"))
              {
                v16 = 0.0;
                if (objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v54), "BOOLValue"))
                {
                  v17 = a2;
                  v18 = v8;
                  v19 = v6;
                  v20 = v5;
                  v21 = (const __CFDictionary *)objc_msgSend(v14, "objectForKeyedSubscript:", v49);
                  v22 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
                  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
                  rect.size = v22;
                  CGRectMakeWithDictionaryRepresentation(v21, &rect);
                  width = rect.size.width;
                  height = rect.size.height;
                  v25 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v48), "intValue");
                  v26 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v47), "intValue");
                  v27 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v46), "intValue");
                  v28 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v45), "intValue");
                  if (v27 <= v25 && v28 <= (int)v26)
                  {
                    v26 = (int)height;
                    v25 = (int)width;
                  }
                  v5 = v20;
                  v6 = v19;
                  v16 = BWGetGeometricDistortionCorrectionStrengthFromDimensions(v25 | (unint64_t)(v26 << 32), objc_msgSend(*(id *)(v5 + v19[984]), "maximumGeometricDistortionCorrectionEnabled"));
                  objc_msgSend(v13, "isEqualToString:", v44);
                  v8 = v18;
                  a2 = v17;
                  v11 = v50;
                  v10 = v51;
                }
                if (v16 >= 0.0)
                  v29 = v16;
                else
                  v29 = 0.0;
                if (v29 > 1.0)
                  v29 = 1.0;
                if (v16 < 0.0 || v16 > 1.0)
                  v16 = v29;
                if (objc_msgSend(v13, "isEqualToString:", v53))
                  *(float *)(v5 + 10616) = v16;
                v67 = v52;
                *(float *)&v31 = v16;
                v68 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
                objc_msgSend(v55, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1), v13);
              }
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
          }
          while (v10);
        }
        result = objc_msgSend(*(id *)(v5 + 112), "setProperty:value:", *MEMORY[0x1E0D07888], v55);
        if (!(_DWORD)result)
        {
          if (v43)
          {
            v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a2);
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v33 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v58;
              do
              {
                for (i = 0; i != v34; ++i)
                {
                  if (*(_QWORD *)v58 != v35)
                    objc_enumerationMutation(v55);
                  objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i)), "addEntriesFromDictionary:", objc_msgSend(v55, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i)));
                }
                v34 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
              }
              while (v34);
            }
            *v43 = v32;
          }
          result = objc_msgSend(*(id *)(v5 + v6[984]), "reflectsStillsOnStreamingOutputs");
          if ((_DWORD)result)
          {
            v37 = (void *)objc_msgSend(v55, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FE0]);
            v38 = (void *)objc_msgSend(v55, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FF8]);
            v39 = *MEMORY[0x1E0D07F38];
            objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F38]), "floatValue");
            v41 = v40;
            objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", v39), "floatValue");
            if (vabds_f32(v42, v41) > 0.00001)
              objc_msgSend(*(id *)(v5 + v6[984]), "setReflectsStillsOnStreamingOutputs:", 0);
            return 0;
          }
        }
      }
      else
      {
        FigDebugAssert3();
        return FigSignalErrorAt();
      }
    }
  }
  return result;
}

- (uint64_t)_updateDolbyVisionMetadataOutputEnabledConfiguration
{
  int v2;
  _QWORD *v3;
  _QWORD *v4;

  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 312), "dolbyVisionMetadataOnPreviewOutputEnabled");
    v3 = (_QWORD *)MEMORY[0x1E0CA8D68];
    v4 = (_QWORD *)MEMORY[0x1E0CA8D98];
    if (v2
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "colorInfoForOutput:", *(_QWORD *)(a1 + 200)), "objectForKeyedSubscript:", *MEMORY[0x1E0CA8D68]), "isEqualToString:", *MEMORY[0x1E0CA8D98]))
    {
      objc_msgSend(*(id *)(a1 + 312), "setDolbyVisionMetadataOnPreviewOutputEnabled:", 0);
    }
    if (objc_msgSend(*(id *)(a1 + 312), "dolbyVisionMetadataOnVideoCaptureOutputEnabled")
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "colorInfoForOutput:", *(_QWORD *)(a1 + 208)), "objectForKeyedSubscript:", *v3), "isEqualToString:", *v4))
    {
      objc_msgSend(*(id *)(a1 + 312), "setDolbyVisionMetadataOnVideoCaptureOutputEnabled:", 0);
    }
  }
  return 0;
}

- (uint64_t)_updateBaseZoomFactorAfterGDCFromOutputConfigurations:(uint64_t)result
{
  uint64_t v3;
  int *v4;
  void *v5;
  uint64_t v6;
  double v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  double v18;
  float v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  float v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  CGRect v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  unsigned int v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v40 = 0;
    v4 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
    if (objc_msgSend(*(id *)(result + 312), "geometricDistortionCorrectionSupported"))
    {
      if (!a2)
      {
        FigDebugAssert3();
        v25 = 0;
        v40 = FigSignalErrorAt();
        goto LABEL_41;
      }
      v5 = (void *)*MEMORY[0x1E0D07FE0];
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      v8 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
      v34 = v5;
      if (!v6)
      {
        v25 = 0;
        v19 = 0.0;
        goto LABEL_27;
      }
      v9 = v6;
      v10 = *(_QWORD *)v37;
      v11 = *MEMORY[0x1E0D08078];
      v12 = *MEMORY[0x1E0D07F38];
      v13 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(a2);
          v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v16 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v15);
          v17 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v11), "BOOLValue");
          LODWORD(v18) = 0;
          if (v17)
            objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v12, v18), "floatValue");
          if (*(float *)&v18 > v13)
          {
            v13 = *(float *)&v18;
            v5 = v15;
          }
        }
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v9);
      v19 = 0.0;
      if (v13 == 0.0)
      {
        v25 = 0;
        v4 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
        v8 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
        goto LABEL_27;
      }
      v20 = *MEMORY[0x1E0D07F40];
      v43[0] = *MEMORY[0x1E0D07F90];
      v43[1] = v20;
      v43[2] = *MEMORY[0x1E0D07F20];
      v43[3] = v11;
      v21 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
      v22 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v5);
      v23 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      BWAddEntriesWithKeysFromDictionaryToDictionary(v22, v21, v23);
      v41 = v5;
      v42 = v23;
      v24 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v40 = objc_msgSend(*(id *)(v3 + 112), "setProperty:value:", *MEMORY[0x1E0D07888], v24);
      if (!v40)
      {
        v8 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
        if ((objc_msgSend(*(id *)(v3 + 104), "hasFocus") & 1) != 0)
        {
          v25 = 0;
        }
        else
        {
          v25 = (void *)objc_msgSend(*(id *)(v3 + 112), "copyProperty:error:", *MEMORY[0x1E0D07890], &v40);
          if (v40)
            goto LABEL_41;
          v35.origin = (CGPoint)*MEMORY[0x1E0C9D628];
          v35.size = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
          FigCFDictionaryGetCGRectIfPresent();
          if (CGRectIsNull(v35))
            goto LABEL_41;
          objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", v20), "floatValue");
          v7 = v26 / v35.size.height;
          if (v7 <= 1.0)
            v7 = 1.0;
          v19 = v7;
        }
        v4 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
LABEL_27:
        if (*(_QWORD *)(v3 + 10608)
          && objc_msgSend((id)objc_msgSend(*(id *)(v3 + v4[984]), "videoStabilizationMethods"), "count")
          && (objc_msgSend(*(id *)(v3 + v4[984]), "livePhotoCaptureEnabled") & 1) == 0)
        {
          v27 = *(void **)(v3 + 10608);
          if (objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0D07FF0])
            && -[BWMultiStreamCameraSourceNode _scalerChainingEnabled](v3))
          {
            v27 = v34;
          }
          v28 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v27);
          objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F38]), "floatValue");
          if (*(float *)&v7 < 1.0)
          {
            objc_msgSend(*(id *)(v3 + v4[984]), "visOverscan");
            v29 = 1.0;
            v7 = 1.2 / (v30 + 1.0);
            if (v7 >= 1.0)
            {
              objc_msgSend(*(id *)(v3 + v4[984]), "visOverscan");
              v7 = v31 + 1.0;
              v29 = 1.2 / v7;
            }
            if (v29 >= v19)
            {
              objc_msgSend(*(id *)(v3 + v4[984]), "visOverscan");
              v7 = 1.2 / (v32 + 1.0);
              v19 = 1.0;
              if (v7 < 1.0)
                goto LABEL_40;
              objc_msgSend(*(id *)(v3 + v4[984]), "visOverscan");
              v7 = 1.2 / (v33 + 1.0);
              v19 = v7;
            }
          }
        }
        if (v19 == 0.0)
        {
LABEL_41:

          return v40;
        }
LABEL_40:
        *(float *)&v7 = v19;
        objc_msgSend(*(id *)(v3 + v8[938]), "setBaseZoomFactorAfterGDC:", v7);
        goto LABEL_41;
      }
    }
    v25 = 0;
    goto LABEL_41;
  }
  return result;
}

- (BWVideoFormatRequirements)_videoFormatRequirementsForOutputID:(void *)a3 configuration:
{
  BWVideoFormatRequirements *v6;
  int v7;
  int64_t v8;
  uint64_t v9;

  if (!a1)
    return 0;
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D08008]) & 1) == 0
    && (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FC0]) & 1) == 0
    && (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FD8]) & 1) == 0
    && (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FD0]) & 1) == 0)
  {
    v7 = mscsn_streamOutputIndexForOutputID(a2);
    v8 = -[BWMultiStreamCameraSourceNode _outputDimensionsForOutputID:outputConfiguration:]((uint64_t)a1, a2, a3);
    -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", (int)v8);
    -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", v8 >> 32);
    v9 = (uint64_t)&a1[63 * v7 + 48];
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v6, "setBytesPerRowAlignment:", *(int *)(v9 + 100));
    -[BWVideoFormatRequirements setPlaneAlignment:](v6, "setPlaneAlignment:", *(int *)(v9 + 104));
    -[BWVideoFormatRequirements setHeightAlignment:](v6, "setHeightAlignment:", 16);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", -[BWMultiStreamCameraSourceNode _supportedPixelFormatsForOutputID:](a1, a2));
  }
  return v6;
}

- (BWMultiStreamCameraSourceNode)initWithCaptureDevice:(id)a3 captureStream:(id)a4
{
  char *v6;
  void *v7;
  BWDeferredMetadataCache *v8;
  void *v9;
  float v10;
  float v11;
  BWNodeOutput *v12;
  BWNodeOutput *v13;
  BWNodeOutput *v14;
  BWNodeOutput *v15;
  BWNodeOutput *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BWNodeOutput *v22;
  BWNodeOutput *v23;
  BWNodeOutput *v24;
  BWNodeOutput *v25;
  BWNodeOutput *v26;
  BWNodeOutput *v27;
  BWNodeOutput *v28;
  BWNodeOutput *v29;
  NSObject *v30;
  const __CFAllocator *v31;
  uint64_t v32;
  char *v33;
  const __CFDictionary *v34;
  uint64_t v35;
  const __CFDictionary *v36;
  double y;
  double x;
  double v39;
  double v40;
  id v42;
  CGPoint v43;
  CGPoint v44;
  CGPoint point;
  objc_super v46;
  _QWORD v47[4];
  _QWORD v48[7];

  v48[5] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)BWMultiStreamCameraSourceNode;
  v6 = -[BWNode init](&v46, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 12) = a3;
    *((_QWORD *)v6 + 13) = a4;
    *((_QWORD *)v6 + 14) = (id)objc_msgSend(a4, "stream");
    *((_QWORD *)v6 + 23) = (id)objc_msgSend(*((id *)v6 + 13), "portType");
    *((_DWORD *)v6 + 48) = objc_msgSend(*((id *)v6 + 13), "deviceType");
    v6[160] = objc_msgSend(*((id *)v6 + 23), "isEqualToString:", *MEMORY[0x1E0D05A40]);
    if (*((_QWORD *)v6 + 12) && *((_QWORD *)v6 + 14) && (v7 = (void *)*((_QWORD *)v6 + 13)) != 0)
    {
      v42 = a3;
      *((_QWORD *)v6 + 15) = (id)objc_msgSend(v7, "supportedFormats");
      *((_DWORD *)v6 + 2660) = -1;
      *((_DWORD *)v6 + 44) = BWActiveDeviceTypeFromPortType(*((void **)v6 + 23));
      *((_DWORD *)v6 + 45) = BWCaptureDevicePositionFromPortType(*((void **)v6 + 23));
      -[BWMultiStreamCameraSourceNode _registerStreamOutputHandlers]((uint64_t)v6);
      if (objc_msgSend((id)objc_msgSend(*((id *)v6 + 14), "supportedProperties"), "objectForKeyedSubscript:", CFSTR("DeferAdditionOfAttachments"))&& !objc_msgSend(*((id *)v6 + 14), "setProperty:value:", CFSTR("DeferAdditionOfAttachments"), MEMORY[0x1E0C9AAB0]))
      {
        v6[140] = 1;
        v8 = -[BWDeferredMetadataCache initWithCaptureStream:atomicTransactions:]([BWDeferredMetadataCache alloc], "initWithCaptureStream:atomicTransactions:", *((_QWORD *)v6 + 14), 0);
        *((_QWORD *)v6 + 18) = v8;
        -[BWDeferredMetadataCache setNumberOfExpectedSampleBuffersForEachPTS:](v8, "setNumberOfExpectedSampleBuffersForEachPTS:", 2);
      }
      *((_DWORD *)v6 + 80) = -1;
      v9 = (void *)objc_msgSend((id)objc_msgSend(*((id *)v6 + 13), "stream"), "supportedProperties");
      v6[128] = objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D07458]) != 0;
      *((_QWORD *)v6 + 19) = dispatch_queue_create("com.apple.bwgraph.source-node-pool-preallocation", 0);
      *((_DWORD *)v6 + 33) = 1065353216;
      objc_msgSend(*((id *)v6 + 13), "pixelSize");
      if (v10 > 0.0)
        *((float *)v6 + 33) = 1.0 / v10;
      *((_DWORD *)v6 + 34) = 1065353216;
      objc_msgSend((id)objc_msgSend(*((id *)v6 + 12), "bravoTelephotoCaptureStream"), "pixelSize");
      if (v11 > 0.0)
        *((float *)v6 + 34) = 1.0 / v11;
      -[BWMultiStreamCameraSourceNode _updateBufferPoolSharingProperties]((unint64_t)v6);
      v6[10520] = objc_msgSend(*((id *)v6 + 13), "usePinholeCameraFocalLengthInIntrinsicMatrixCalculation");
      v12 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
      -[BWNodeOutput setProvidesPixelBufferPool:](v12, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setName:](v12, "setName:", CFSTR("Preview"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v12, "setDropsSampleBuffersWithUnexpectedPTS:", 1);
      objc_msgSend(v6, "addOutput:", v12);
      *((_QWORD *)v6 + 25) = v12;

      v13 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
      -[BWNodeOutput setProvidesPixelBufferPool:](v13, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setName:](v13, "setName:", CFSTR("VideoCapture"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v13, "setDropsSampleBuffersWithUnexpectedPTS:", 1);
      objc_msgSend(v6, "addOutput:", v13);
      *((_QWORD *)v6 + 26) = v13;

      v14 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
      -[BWNodeOutput setProvidesPixelBufferPool:](v14, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setName:](v14, "setName:", CFSTR("StillImage"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v14, "setDropsSampleBuffersWithUnexpectedPTS:", 0);
      objc_msgSend(v6, "addOutput:", v14);
      *((_QWORD *)v6 + 27) = v14;

      v15 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
      -[BWNodeOutput setProvidesPixelBufferPool:](v15, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setName:](v15, "setName:", CFSTR("StillImageSensorRaw"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v15, "setDropsSampleBuffersWithUnexpectedPTS:", 0);
      objc_msgSend(v6, "addOutput:", v15);
      *((_QWORD *)v6 + 28) = v15;

      v16 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1836016234, v6);
      -[BWNodeOutput setName:](v16, "setName:", CFSTR("DetectedObjects"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v16, "setDropsSampleBuffersWithUnexpectedPTS:", 1);
      v17 = *MEMORY[0x1E0CA2558];
      v18 = *MEMORY[0x1E0CA2560];
      v48[0] = *MEMORY[0x1E0CA2558];
      v48[1] = v18;
      v19 = *MEMORY[0x1E0CA2548];
      v20 = *MEMORY[0x1E0CA2550];
      v48[2] = *MEMORY[0x1E0CA2548];
      v48[3] = v20;
      v48[4] = *MEMORY[0x1E0CA2568];
      -[BWNodeOutput setFormat:](v16, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 5)));
      objc_msgSend(v6, "addOutput:", v16);
      *((_QWORD *)v6 + 29) = v16;

      *((_QWORD *)v6 + 1341) = -[BWDetectedFacesRingBuffer initWithDepth:]([BWDetectedFacesRingBuffer alloc], "initWithDepth:", 3);
      v21 = (void *)objc_msgSend(*((id *)v6 + 14), "supportedProperties");
      if (objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D076E8]))
        *((_QWORD *)v6 + 1342) = -[BWDetectedObjectsInfoRingBuffer initWithRingBufferDepth:]([BWDetectedObjectsInfoRingBuffer alloc], "initWithRingBufferDepth:", 3);
      objc_msgSend(*((id *)v6 + 14), "setPropertyIfSupported:value:", *MEMORY[0x1E0D074E8], &unk_1E49FAF98);
      v22 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1836016234, v6);
      -[BWNodeOutput setName:](v22, "setName:", CFSTR("SecureDetectedObjects"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v22, "setDropsSampleBuffersWithUnexpectedPTS:", 1);
      v47[0] = v17;
      v47[1] = v18;
      v47[2] = v19;
      v47[3] = v20;
      -[BWNodeOutput setFormat:](v22, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4)));
      objc_msgSend(v6, "addOutput:", v22);
      *((_QWORD *)v6 + 30) = v22;

      v23 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
      -[BWNodeOutput setProvidesPixelBufferPool:](v23, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setName:](v23, "setName:", CFSTR("Depth"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v23, "setDropsSampleBuffersWithUnexpectedPTS:", 1);
      objc_msgSend(v6, "addOutput:", v23);
      *((_QWORD *)v6 + 31) = v23;

      v24 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1885564004, v6);
      -[BWNodeOutput setProvidesDataBufferPool:](v24, "setProvidesDataBufferPool:", 0);
      -[BWNodeOutput setName:](v24, "setName:", CFSTR("PointCloud"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v24, "setDropsSampleBuffersWithUnexpectedPTS:", 1);
      objc_msgSend(v6, "addOutput:", v24);
      *((_QWORD *)v6 + 32) = v24;

      v25 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
      -[BWNodeOutput setProvidesPixelBufferPool:](v25, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setName:](v25, "setName:", CFSTR("LightSourceMask"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v25, "setDropsSampleBuffersWithUnexpectedPTS:", 1);
      objc_msgSend(v6, "addOutput:", v25);
      *((_QWORD *)v6 + 33) = v25;

      v26 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1885564004, v6);
      -[BWNodeOutput setProvidesDataBufferPool:](v26, "setProvidesDataBufferPool:", 0);
      -[BWNodeOutput setName:](v26, "setName:", CFSTR("KeypointDescriptorData"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v26, "setDropsSampleBuffersWithUnexpectedPTS:", 1);
      objc_msgSend(v6, "addOutput:", v26);
      *((_QWORD *)v6 + 34) = v26;

      v27 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
      -[BWNodeOutput setName:](v27, "setName:", CFSTR("SemanticMasks"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v27, "setDropsSampleBuffersWithUnexpectedPTS:", 0);
      objc_msgSend(v6, "addOutput:", v27);
      *((_QWORD *)v6 + 35) = v27;

      v28 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1835365473, v6);
      -[BWNodeOutput setName:](v28, "setName:", CFSTR("EyeReliefStatus"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v28, "setDropsSampleBuffersWithUnexpectedPTS:", 1);
      -[BWNodeOutput setFormat:](v28, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", 0));
      objc_msgSend(v6, "addOutput:", v28);
      *((_QWORD *)v6 + 36) = v28;

      v29 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
      -[BWNodeOutput setProvidesPixelBufferPool:](v29, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setName:](v29, "setName:", CFSTR("PreLTMThumbnail"));
      -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v29, "setDropsSampleBuffersWithUnexpectedPTS:", 1);
      objc_msgSend(v6, "addOutput:", v29);
      *((_QWORD *)v6 + 38) = v29;

      v30 = FigDispatchQueueCreateWithPriority();
      dispatch_queue_set_specific(v30, CFSTR("BWFigCaptureStreamSetPropertySetPropertyAsyncQueue"), (void *)objc_msgSend(v42, "streamSetPropertyAsyncQueue"), 0);
      v31 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v32 = 20;
      v33 = v6;
      do
      {
        *((_QWORD *)v33 + 52) = v30;
        CMSimpleQueueCreate(v31, 30, (CMSimpleQueueRef *)v33 + 51);
        FigSimpleQueueSetQueueIsFullErrorLoggingEnabled();
        v33 += 504;
        --v32;
      }
      while (v32);
      *((_QWORD *)v6 + 53) = multiStreamCameraSourceNode_primaryScalerServiceQueueCallback;
      *((_QWORD *)v6 + 116) = multiStreamCameraSourceNode_secondaryScalerServiceQueueCallback;
      *((_QWORD *)v6 + 179) = multiStreamCameraSourceNode_intermediateTapServiceQueueCallback;
      *((_QWORD *)v6 + 557) = multiStreamCameraSourceNode_rawServiceQueueCallback;
      *((_QWORD *)v6 + 242) = multiStreamCameraSourceNode_stillImageServiceQueueCallback;
      *((_QWORD *)v6 + 305) = multiStreamCameraSourceNode_stillImageIntermediateTapServiceQueueCallback;
      *((_QWORD *)v6 + 368) = multiStreamCameraSourceNode_stillImageRawServiceQueueCallback;
      *((_QWORD *)v6 + 431) = multiStreamCameraSourceNode_depthServiceQueueCallback;
      *((_QWORD *)v6 + 494) = multiStreamCameraSourceNode_pointCloudServiceQueueCallback;
      *((_QWORD *)v6 + 620) = multiStreamCameraSourceNode_lightSourceMaskServiceQueueCallback;
      *((_QWORD *)v6 + 683) = multiStreamCameraSourceNode_keypointDescriptorDataServiceQueueCallback;
      *((_QWORD *)v6 + 746) = multiStreamCameraSourceNode_semanticMasksServiceQueueCallback;
      *((_QWORD *)v6 + 809) = multiStreamCameraSourceNode_secureDetectedObjectsServiceQueueCallback;
      *((_QWORD *)v6 + 872) = multiStreamCameraSourceNode_secureEyeReliefStatusServiceQueueCallback;
      *((_QWORD *)v6 + 1187) = multiStreamCameraSourceNode_preLTMThumbnailServiceQueueCallback;

      v43 = (CGPoint)*MEMORY[0x1E0C9D538];
      *(_OWORD *)(v6 + 10808) = *MEMORY[0x1E0C9D538];
      *((_DWORD *)v6 + 2706) = 1065353216;
      *((_DWORD *)v6 + 2707) = 0;
      v6[379] = 0;
      v6[10905] = 1;
      v6[10906] = 1;
      *((_QWORD *)v6 + 1370) = 0x3FD3333333333333;
      v6[10968] = 1;
      v6[10969] = 0;
      v6[10970] = 1;
      if ((objc_msgSend(*((id *)v6 + 23), "isEqualToString:", *MEMORY[0x1E0D05A28]) & 1) != 0)
      {
        if (objc_msgSend(*((id *)v6 + 12), "isBravoVariant"))
        {
          v34 = (const __CFDictionary *)objc_msgSend(*((id *)v6 + 14), "getPropertyIfSupported:error:", *MEMORY[0x1E0D076F0], 0);
          v35 = objc_msgSend(*((id *)v6 + 14), "getPropertyIfSupported:error:", *MEMORY[0x1E0D076F8], 0);
          if (v34)
          {
            v36 = (const __CFDictionary *)v35;
            if (v35)
            {
              v44 = v43;
              point = v43;
              CGPointMakeWithDictionaryRepresentation(v34, &point);
              CGPointMakeWithDictionaryRepresentation(v36, &v44);
              x = point.x;
              y = point.y;
              v40 = v44.x;
              v39 = v44.y;
              if (point.x != v44.x || point.y != v44.y)
              {
                v6[10882] = 1;
                *((double *)v6 + 1361) = v40 - x;
                *((double *)v6 + 1362) = v39 - y;
              }
            }
          }
        }
      }
      *((_DWORD *)v6 + 2743) = 1065353216;
    }
    else
    {

      return 0;
    }
  }
  return (BWMultiStreamCameraSourceNode *)v6;
}

- (void)didSelectFormat:(id)a3 forOutput:(id)a4
{
  uint64_t v6;
  BWStreamOutputStorage *outputsStorage;
  uint64_t i;
  id v9;
  BOOL v10;
  BWFormatRequirements *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[BWMultiStreamCameraSourceNodeConfiguration stillImageOutputEnabled](self->_configuration, "stillImageOutputEnabled", a3)&& (self->_videoCaptureOutput == a4 || self->_stillImageOutput == a4))
  {
    v6 = objc_msgSend((id)objc_msgSend(a4, "videoFormat"), "pixelFormat");
    outputsStorage = self->_outputsStorage;
    for (i = -10080; i; i += 504)
    {
      if ((*((_BYTE *)&outputsStorage[20].flags + i) & 3) != 0)
      {
        v9 = *(BWNodeOutput **)((char *)&outputsStorage[20].nodeOutput + i);
        if (v9 == a4)
        {
          v11 = -[BWNodeOutput formatRequirements](self->_stillImageOutput, "formatRequirements");
          v12[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
          -[BWFormatRequirements setSupportedPixelFormats:](v11, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1));
          return;
        }
        if (v9)
          v10 = self->_stillImageOutput == a4;
        else
          v10 = 0;
        if (v10 && !objc_msgSend(v9, "videoFormat"))
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Internal inconsistency, still image output's format was resolved before its driving streaming output's format was resolved")), 0));
      }
    }
  }
}

- (NSString)portType
{
  return self->_portType;
}

- (void)updateFormatRequirementsFromSourceNode:(id)a3
{
  _BOOL4 v5;
  BOOL *p_enabled;
  uint64_t v7;
  BWNodeOutput *v8;
  BWFormatRequirements *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  void *v21;
  _BOOL4 v23;
  _QWORD v24[6];
  char v25;

  if (a3)
  {
    if (FigCapturePlatformSupportsHTPC16x8Compression())
      v5 = 1;
    else
      v5 = FigCapturePlatformSupportsUniversalCompression() != 0;
    v23 = v5;
    p_enabled = &self->_outputsStorage[0].enabled;
    v7 = -20;
    do
    {
      if (*p_enabled)
      {
        v8 = *(BWNodeOutput **)(p_enabled + 7);
        v9 = -[BWNodeOutput formatRequirements](v8, "formatRequirements");
        if (v8 == self->_previewOutput)
        {
          v10 = (void *)objc_msgSend(a3, "previewOutput");
          goto LABEL_13;
        }
        if (v8 == self->_videoCaptureOutput)
        {
          v10 = (void *)objc_msgSend(a3, "videoCaptureOutput");
          goto LABEL_13;
        }
        if (v8 == self->_stillImageOutput)
        {
          v10 = (void *)objc_msgSend(a3, "stillImageOutput");
LABEL_13:
          v11 = (void *)objc_msgSend(v10, "formatRequirements");
          if (v11)
          {
            v12 = v11;
            v13 = objc_msgSend(v11, "width");
            if (v13 >= -[BWFormatRequirements width](v9, "width")
              || (v14 = objc_msgSend(v12, "height"), v14 > -[BWFormatRequirements height](v9, "height")))
            {
              v15 = -[BWFormatRequirements height](v9, "height");
              v16 = -[BWFormatRequirements width](v9, "width");
              v17 = objc_msgSend(v12, "height");
              v18 = objc_msgSend(v12, "width");
              -[BWFormatRequirements setHeight:](v9, "setHeight:", v17);
              -[BWFormatRequirements setWidth:](v9, "setWidth:", v18);
              if (v7 == -17)
                v19 = !-[BWMultiStreamCameraSourceNodeConfiguration geometricDistortionCorrectionOnStillImageOutputEnabled](self->_configuration, "geometricDistortionCorrectionOnStillImageOutputEnabled");
              else
                v19 = 0;
              if (v23)
              {
                v20 = (unint64_t)(v18 - v16) >> 1;
                v21 = (void *)-[BWFormatRequirements supportedPixelFormats](v9, "supportedPixelFormats");
                v24[0] = MEMORY[0x1E0C809B0];
                v24[1] = 3221225472;
                v24[2] = __72__BWMultiStreamCameraSourceNode_updateFormatRequirementsFromSourceNode___block_invoke;
                v24[3] = &__block_descriptor_49_e35_B24__0__NSNumber_8__NSDictionary_16l;
                v24[4] = v20;
                v24[5] = (unint64_t)(v17 - v15) >> 1;
                v25 = v19;
                -[BWFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", objc_msgSend(v21, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v24)));
              }
            }
          }
        }
      }
      p_enabled += 504;
    }
    while (!__CFADD__(v7++, 1));
  }
}

- (BWNodeOutput)videoCaptureOutput
{
  return self->_videoCaptureOutput;
}

- (BWNodeOutput)stillImageOutput
{
  return self->_stillImageOutput;
}

- (BOOL)_serviceZoomForPTS:(uint64_t)a3 synchronizedStreamsCaptureID:
{
  int v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  double v20;
  double v21;
  __int128 v23;
  uint64_t v24;

  if (a1)
  {
    v6 = objc_msgSend(*(id *)(a1 + 96), "overCaptureEnabled");
    v7 = *(void **)(a1 + 96);
    if (v6)
    {
      v8 = (void *)objc_msgSend(v7, "zoomCommandHandler");
      v23 = *a2;
      v24 = *((_QWORD *)a2 + 2);
      objc_msgSend(v8, "updateZoomModelAndAppliedZoomFactorForNextFrameWithPTS:captureID:delayedISPAppliedZoomFactor:", &v23, a3, COERCE_DOUBLE(__PAIR64__(DWORD1(v23), 1.0)));
    }
    else
    {
      if (objc_msgSend(v7, "depthType") == 3
        && !objc_msgSend(*(id *)(a1 + 184), "isEqualToString:", *MEMORY[0x1E0D05A18]))
      {
        return a1 != 0;
      }
      v10 = (void *)objc_msgSend(*(id *)(a1 + 96), "zoomCommandHandler");
      v23 = *a2;
      v24 = *((_QWORD *)a2 + 2);
      objc_msgSend(v10, "updateZoomModelForNextFrameWithPTS:captureID:", &v23, a3);
    }
    v11 = v9;
    if (v9 >= 1.0)
    {
      v12 = *(float *)(a1 + 10544);
      objc_msgSend(*(id *)(a1 + 104), "baseZoomFactorAfterGDC");
      v14 = v13;
      objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
      if ((float)(v14 / v15) + -1.0 >= v12)
      {
        objc_msgSend(*(id *)(a1 + 104), "baseZoomFactorAfterGDC");
        v18 = v17;
        objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
        v16 = (float)(v18 / v19) + -1.0;
      }
      else
      {
        v16 = *(float *)(a1 + 10544);
      }
      v20 = 1.0;
      v21 = v11 / (v16 + 1.0);
      if (v21 <= 1.0)
        v21 = 1.0;
      *(float *)&v21 = v21;
      *(float *)&v20 = v11;
      objc_msgSend(*(id *)(a1 + 96), "setISPZoomFactor:totalZoomFactor:", v21, v20);
    }
  }
  return a1 != 0;
}

- (double)_updateZoomForOutputIndex:(opaqueCMSampleBuffer *)a3 sampleBuffer:(float)a4 additionalScaleFactor:
{
  unint64_t v8;
  void *v9;
  float64_t ValidBufferRect;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double *v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double *v34;
  double v35;
  double v36;
  double v37;
  char v38;
  double v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v42;
  float v43;
  float v44;
  float v45;
  uint64_t v46;
  int v47;
  int v48;
  BOOL v49;
  _BOOL4 v51;
  char v52;
  double v53;
  int IsD9x;
  int v55;
  int v56;
  BOOL v58;
  int v59;
  int v60;
  float v61;
  int v62;
  int *v63;
  uint64_t v64;
  void *v65;
  float v66;
  float v67;
  void *v68;
  double v69;
  float v70;
  float v71;
  float v72;
  int v73;
  int v74;
  __int128 v75;
  int CGRectIfPresent;
  double v77;
  double v78;
  float v79;
  int v80;
  double v81;
  float v82;
  float v83;
  double v84;
  int v85;
  void *v86;
  int v87;
  int v88;
  void *v89;
  double v90;
  float v91;
  float v92;
  uint64_t v93;
  opaqueCMSampleBuffer *v94;
  int *v95;
  float v96;
  float v97;
  double v98;
  double v99;
  float v100;
  int v101;
  double v102;
  uint64_t v103;
  int v104;
  _BOOL4 v106;
  float v107;
  double v108;
  float v109;
  float v110;
  float v111;
  float v112;
  void *v113;
  float v114;
  void *v115;
  float v116;
  float v117;
  float v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  BOOL v124;
  double v125;
  double v126;
  float v127;
  double v128;
  float v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  float v138;
  double v139;
  double v140;
  double v142;
  int v143;
  double v144;
  double v145;
  double v146;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  NSObject *v151;
  float v152;
  float v153;
  uint64_t v154;
  float v155;
  float v156;
  float v157;
  float v158;
  float v159;
  void *v160;
  uint64_t v161;
  int v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  float v182;
  float v183;
  float v184;
  double v185;
  double v186;
  CFDictionaryRef DictionaryRepresentation;
  CGFloat v188;
  CGFloat v189;
  CGFloat v190;
  CGFloat v191;
  float v192;
  float v193;
  double v194;
  double v195;
  float v196;
  double v197;
  float v198;
  double v199;
  double v201;
  double v202;
  double v203;
  double v204;
  CGFloat v205;
  CGFloat v206;
  CGFloat v207;
  CGFloat v208;
  CGFloat v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  uint64_t v215;
  uint64_t v216;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CGFloat v218;
  CGFloat v219;
  float v220;
  double v221;
  double v222;
  void *v223;
  double v224;
  double v225;
  double v226;
  CGFloat v227;
  CGFloat v228;
  CGFloat v229;
  CGFloat v230;
  double v231;
  double v232;
  double v233;
  uint64_t v234;
  _BOOL4 v235;
  float v236;
  float v237;
  float v238;
  double v239;
  _BOOL4 v240;
  float v241;
  double v242;
  double v243;
  opaqueCMSampleBuffer *v244;
  float v245;
  double v246;
  uint64_t v247;
  double v248;
  double rect1;
  uint64_t v250;
  double v251;
  uint64_t v252;
  double v253;
  double v254;
  double v255;
  int v256;
  double v257;
  double v258;
  uint64_t v259;
  CMTime v260;
  CGPoint v261;
  CGFloat v262;
  CGFloat v263;
  float64x2_t v264;
  __int128 v265;
  uint64_t v266;
  CGPoint v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;
  CGRect v272;
  CGRect v273;
  CGRect v274;
  CGRect v275;
  CGRect v276;

  v266 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  v8 = BWPixelBufferDimensionsFromSampleBuffer(a3);
  v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  ValidBufferRect = FigCaptureMetadataUtilitiesGetValidBufferRect();
  v12 = v11;
  v14 = v13;
  v261.x = ValidBufferRect;
  v261.y = v15;
  v262 = v11;
  v263 = v13;
  FigCaptureMetadataUtilitiesNormalizeCropRect(ValidBufferRect, v15, v11, v13);
  v17 = v16;
  v19 = v18;
  v248 = v20;
  rect1 = v21;
  v22 = (double *)MEMORY[0x1E0C9D648];
  v259 = a1 + 384;
  v23 = a1 + 384 + 504 * a2;
  v247 = *(_QWORD *)(a1 + 208);
  v250 = *(_QWORD *)(a1 + 200);
  v252 = *(_QWORD *)(v23 + 16);
  v245 = a4;
  if ((*(_BYTE *)(v23 + 4) & 4) != 0)
  {
    v25 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]);
    if (v25)
      v26 = objc_msgSend(v25, "intValue");
    else
      v26 = 0xFFFFFFFFLL;
    CMSampleBufferGetPresentationTimeStamp(&v260, a3);
    v24 = -[BWMultiStreamCameraSourceNode _serviceZoomForPTS:synchronizedStreamsCaptureID:](a1, (__int128 *)&v260.value, v26);
  }
  else
  {
    v24 = 0;
  }
  v28 = *v22;
  v27 = v22[1];
  if (!v9)
    return *v22;
  v240 = v24;
  v227 = v22[3];
  v228 = v22[2];
  v256 = a2;
  v29 = 1.0;
  v30 = 1.0;
  if ((*(_BYTE *)(v23 + 4) & 8) != 0)
  {
    objc_msgSend(*(id *)(a1 + 312), "visOverscan", 1.0, 1.0);
    v33 = v32;
    if (*(_DWORD *)v23 == 2)
    {
      v257 = v31;
      if ((objc_msgSend(*(id *)(a1 + 312), "includeOverscanInStillImageFinalCropRect") & 1) != 0)
      {
        v34 = (double *)MEMORY[0x1E0C9D820];
      }
      else
      {
        v38 = objc_msgSend(*(id *)(a1 + 312), "stillImageGeometricDistortionCorrectionExpansionCoversOverscan");
        v34 = (double *)MEMORY[0x1E0C9D820];
        if ((v38 & 1) == 0)
        {
          v37 = *(double *)(a1 + 10704);
          v36 = *(double *)(a1 + 10712);
          v39 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          v40 = v37 == *MEMORY[0x1E0C9D820];
          if (v36 != v39)
            v40 = 0;
          if (a2 != 5 || v40)
          {
            v37 = *(double *)(a1 + 10664);
            v41 = v37 == *MEMORY[0x1E0C9D820];
            v42 = *(double *)(a1 + 10672) == v39;
            v36 = v41 && v42 ? v33 : *(double *)(a1 + 10672);
            if (v41 && v42)
              v37 = v257;
          }
          goto LABEL_29;
        }
      }
    }
    else
    {
      if (v252 != v250)
      {
        v36 = v32;
        v37 = v31;
LABEL_29:
        v29 = v37 + 1.0;
        v30 = v36 + 1.0;
        goto LABEL_30;
      }
      v34 = (double *)(a1 + 10584);
    }
    v37 = *v34;
    v36 = v34[1];
    goto LABEL_29;
  }
LABEL_30:
  v242 = v30;
  v254 = v29;
  v232 = v17;
  v233 = v19;
  v244 = a3;
  objc_msgSend(*(id *)(a1 + 312), "additionalVISOverscanReservedInZoom");
  v238 = v43;
  objc_msgSend(*(id *)(a1 + 312), "additionalVISOverscanReservedInZoom");
  v236 = v44;
  v45 = -[BWMultiStreamCameraSourceNode _ispAppliedZoomFactorFromSampleBufferMetadataDictionary:outputIndex:](a1, v9, a2);
  v46 = v259 + 504 * a2;
  v48 = *(_DWORD *)(v46 + 120);
  v47 = *(_DWORD *)(v46 + 124);
  v49 = v48 >= 1 && v48 < (int)v8;
  v229 = v27;
  v230 = v28;
  if (v49)
  {
    IsD9x = BWDeviceModelIsD9x();
    v235 = a2 == 5;
    if (a2 != 5 || !IsD9x)
      goto LABEL_57;
    LOBYTE(v51) = 1;
  }
  else
  {
    v51 = v47 > 0 && v47 < SHIDWORD(v8);
    v52 = BWDeviceModelIsD9x();
    v235 = a2 == 5;
    if (a2 != 5 || (v52 & 1) == 0)
    {
      v53 = 1.0;
      v258 = 1.0;
      if (!v51)
        goto LABEL_58;
LABEL_57:
      v258 = (double)v48 / (double)(int)v8;
      v53 = (double)v47 / (double)SHIDWORD(v8);
      goto LABEL_58;
    }
  }
  v55 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D40]), "intValue");
  v56 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D38]), "intValue");
  v58 = (HIDWORD(v8) - 3201) < 0xAEF && v55 < (int)v8;
  v59 = v58 && v56 < SHIDWORD(v8);
  if (v59)
  {
    v47 = v56;
    v48 = v55;
  }
  if ((v59 & 1) != 0)
    goto LABEL_57;
  v53 = 1.0;
  v258 = 1.0;
  if (v51)
    goto LABEL_57;
LABEL_58:
  v231 = (double)(int)v8;
  if (*(_DWORD *)v23 == 1)
  {
    if ((objc_msgSend(*(id *)(a1 + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled") & 1) != 0)
      v60 = 1;
    else
      v60 = objc_msgSend(*(id *)(a1 + 312), "geometricDistortionCorrectionOnPreviewOutputEnabled");
  }
  else
  {
    v60 = 0;
  }
  v61 = 1.0;
  v62 = a2;
  if (!objc_msgSend(*(id *)(a1 + 104), "hasFocus") || a2)
  {
    v63 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
  }
  else
  {
    v63 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
    if (v60)
    {
      if (objc_msgSend(*(id *)(a1 + 96), "adaptiveOverscanEnabled"))
      {
        v64 = *MEMORY[0x1E0D07FE0];
        v65 = (void *)objc_msgSend(*(id *)(a1 + 10560), "objectForKeyedSubscript:", *MEMORY[0x1E0D07FE0]);
        objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "floatValue");
        v67 = v66;
        v68 = (void *)objc_msgSend(*(id *)(a1 + 10560), "objectForKeyedSubscript:", v64);
        objc_msgSend((id)objc_msgSend(v68, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "floatValue");
        v69 = v53;
        v71 = v70;
        v72 = v67 / v70;
        v73 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D40]), "intValue");
        v74 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D38]), "intValue");
        v75 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
        v264 = *(float64x2_t *)MEMORY[0x1E0C9D628];
        v265 = v75;
        CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
        v78 = *((double *)&v265 + 1);
        v77 = *(double *)&v265;
        v63 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
        if (!CGRectIfPresent)
        {
          v78 = (double)v74;
          v77 = (double)v73;
        }
        v79 = v77 / v78;
        v80 = (int)v71;
        v53 = v69;
        if (vabds_f32((float)v48 / (float)v47, v79) > vabds_f32(v72, v79))
        {
          v47 = v80;
          v48 = (int)v67;
        }
      }
      v81 = (double)v48 / v12;
      if (v81 <= (double)v47 / v14)
        v81 = (double)v47 / v14;
      v61 = v81;
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + v63[938]), "nondisruptiveSwitchingZoomFactors"), "count"))
      {
        if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue") == 2)
        {
          objc_msgSend(*(id *)(a1 + v63[938]), "baseZoomFactor");
          if ((float)(v61 / v82) > 1.2)
          {
            objc_msgSend(*(id *)(a1 + v63[938]), "baseZoomFactorAfterGDC");
            v61 = v83;
          }
        }
      }
      objc_msgSend(*(id *)(a1 + v63[938]), "baseZoomFactorAfterGDC");
      if (*(float *)&v84 != v61)
      {
        *(float *)&v84 = v61;
        objc_msgSend(*(id *)(a1 + v63[938]), "setBaseZoomFactorAfterGDC:", v84);
        objc_msgSend(*(id *)(a1 + 96), "updateFudgedZoomRanges");
      }
    }
  }
  v85 = objc_msgSend(*(id *)(a1 + 96), "overCaptureEnabled");
  v86 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]);
  v87 = objc_msgSend(v86, "BOOLValue");
  v223 = v86;
  if (v86)
    v88 = v87;
  else
    v88 = 1;
  if ((v240 & (v85 ^ 1)) == 1 && v88)
  {
    v89 = (void *)objc_msgSend(*(id *)(a1 + 96), "zoomCommandHandler");
    *(float *)&v90 = v45;
    objc_msgSend(v89, "updateAppliedZoomFactorForDelayedISPAppliedZoomFactor:", v90);
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "zoomCommandHandler"), "appliedZoomFactor");
  v92 = v91;
  v93 = *(_QWORD *)(a1 + v63[938]);
  v94 = v244;
  if (v93 == objc_msgSend(*(id *)(a1 + 96), "bravoTelephotoCaptureStream"))
  {
    v95 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
    if (objc_msgSend(*(id *)(a1 + 96), "bravoStreamSelectionConfiguration") == 3)
    {
      objc_msgSend(*(id *)(a1 + v63[938]), "baseZoomFactor");
      if (v92 <= v96)
      {
        objc_msgSend(*(id *)(a1 + v63[938]), "baseZoomFactor");
        v92 = v97;
      }
    }
  }
  else
  {
    v95 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
  }
  if (((objc_msgSend(*(id *)(a1 + 96), "isBravoVariant") ^ 1 | v85) & 1) == 0
    && (!objc_msgSend(*(id *)(a1 + 96), "depthDataDeliveryEnabled")
     || objc_msgSend(*(id *)(a1 + 96), "parallaxMitigationBasedOnZoomFactorEnabled")))
  {
    objc_msgSend(*(id *)(a1 + 96), "updateSphereShiftStateWithSampleBuffer:", v244);
  }
  v98 = 1.0;
  v99 = v236 + 1.0;
  v100 = 1.0;
  if (v61 > 1.0)
    v101 = v85;
  else
    v101 = 0;
  if (v101 == 1)
  {
    *(float *)&v98 = v61;
    CMSetAttachment(v244, CFSTR("ZoomFactorLowerBoundAfterGDCAndFocus"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v98), 1u);
  }
  v102 = v254 * (v238 + 1.0);
  v255 = v242 * v99;
  v103 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "zoomCommandHandler"), "rampTuning"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v103, *MEMORY[0x1E0D06130]);
  v104 = objc_msgSend(*(id *)(a1 + 96), "optimizesZoomRampsForVISZoomSmoothing");
  v106 = v252 == v247 || v252 == v250;
  v237 = v92;
  v107 = v92 / v45;
  if (v104 && v106)
  {
    v108 = v242 * v99;
    if (v102 < v255)
      v108 = v102;
    v109 = v108;
    v110 = 1.0 / v109;
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "zoomCommandHandler"), "earlySwitchOverScaleFactorForZoomIn");
    v112 = v111;
    v113 = (void *)objc_msgSend(*(id *)(a1 + 96), "zoomCommandHandler");
    if (v112 == 1.0)
    {
      objc_msgSend(v113, "allowableMinimumDigitalZoomFactorDuringZoomOut");
      v115 = *(void **)(a1 + 96);
      if (v116 == 1.0)
      {
        v100 = 1.0;
        if (objc_msgSend(v115, "isBravoVariant"))
        {
          if (objc_msgSend(*(id *)(a1 + 184), "isEqualToString:", *MEMORY[0x1E0D05A28]))
          {
            if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue") == 1)
            {
              objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "captureStream"), "baseZoomFactor");
              v153 = v152;
              v154 = *MEMORY[0x1E0D06CC8];
              objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]), "floatValue");
              v156 = v153 / v155;
              v100 = 1.0;
              if (v156 < 1.0)
              {
                objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "captureStream"), "baseZoomFactor");
                v158 = v157;
                objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v154), "floatValue");
                v100 = v158 / v159;
              }
            }
          }
        }
        goto LABEL_115;
      }
      objc_msgSend((id)objc_msgSend(v115, "zoomCommandHandler"), "allowableMinimumDigitalZoomFactorDuringZoomOut");
    }
    else
    {
      objc_msgSend(v113, "earlySwitchOverScaleFactorForZoomIn");
    }
    v100 = v114;
LABEL_115:
    if (v100 <= v110)
      v100 = v110;
  }
  if (v107 <= v100)
    v117 = v100;
  else
    v117 = v107;
  v118 = v245;
  v241 = 1.0;
  if (v245 <= 0.0)
    v118 = 1.0;
  v246 = v102;
  v119 = (float)(v118 * v117);
  v120 = fmin(1.0 / v102 / v119, 1.0);
  v121 = fmin(1.0 / v255 / v119, 1.0);
  v123 = *MEMORY[0x1E0C9D538];
  v122 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v124 = v120 < 1.0 || v121 < 1.0;
  v224 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v225 = *MEMORY[0x1E0C9D538];
  if (v124)
  {
    v35 = (1.0 - v120) * 0.5;
    v134 = (1.0 - v121) * 0.5;
    if ((v85 & 1) != 0 || objc_msgSend(*(id *)(a1 + 96), "parallaxMitigationBasedOnZoomFactorEnabled"))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 10828));
      v125 = *(double *)(a1 + 10808);
      v126 = *(double *)(a1 + 10816);
      v221 = v53;
      v127 = *(float *)(a1 + 10824);
      v95 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 10828));
      v239 = -[BWMultiStreamCameraSourceNode _applyNondisruptiveSwitchingZoomFactorAndSensorCenterOffsetToPreviewShift:forSampleBuffer:outputIndex:](a1, v244, v125, v126);
      v226 = v128;
      v241 = v127;
      v129 = v127;
      v53 = v221;
      v35 = mscsn_applyPreviewShiftToCropRect(v35, (1.0 - v121) * 0.5, v120, v121, v239, v128, v129);
      v134 = v130;
      v243 = v131;
      v133 = v132;
    }
    else
    {
      v239 = v123;
      v226 = v122;
      v133 = v121;
      v243 = v120;
    }
  }
  else
  {
    v239 = *MEMORY[0x1E0C9D538];
    v226 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v133 = v227;
    v243 = v228;
    v134 = v229;
    v35 = v230;
  }
  v135 = v258 * v120;
  v136 = v53 * v121;
  if (v258 * v120 > v248 || v136 > rect1)
  {
    v138 = v135 / v136;
    FigCaptureMetadataUtilitiesRectWithAspectRatioInsideDimensions(v248, rect1, v138);
    v135 = v139;
    v136 = v140;
  }
  if (v135 >= 1.0 && v136 >= 1.0)
    goto LABEL_219;
  v218 = v134;
  if ((objc_msgSend(*(id *)(a1 + v95[984]), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled") & 1) != 0)
    v143 = 1;
  else
    v143 = objc_msgSend(*(id *)(a1 + v95[984]), "geometricDistortionCorrectionOnPreviewOutputEnabled");
  v144 = v232 + (v248 - v135) * 0.5;
  HIDWORD(v145) = HIDWORD(v233);
  v142 = (rect1 - v136) * 0.5;
  v146 = v233 + v142;
  v220 = v45;
  v222 = v35;
  v219 = v133;
  if ((v235 & v143) == 1)
  {
    if (*(_BYTE *)(a1 + 10905))
    {
      v268.origin.x = FigCaptureMetadataUtilitiesNormalizedRectEnforcedWithinValidRegionAfterGDC(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "cameraInfoByPortType"), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 184)), v9, v8, v144, v146, v135, v136);
      x = v268.origin.x;
      y = v268.origin.y;
      width = v268.size.width;
      height = v268.size.height;
      v273.origin.x = v232 + (v248 - v135) * 0.5;
      v273.origin.y = v146;
      v273.size.width = v135;
      v273.size.height = v136;
      if (CGRectEqualToRect(v268, v273))
      {
        x = v232 + (v248 - v135) * 0.5;
        y = v146;
        width = v135;
        height = v136;
LABEL_156:
        v63 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
        goto LABEL_162;
      }
      if (!dword_1ECFE9B50)
        goto LABEL_156;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      v63 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v94 = v244;
LABEL_162:
      if (CMGetAttachment(v94, (CFStringRef)*MEMORY[0x1E0D05DB8], 0))
      {
        v160 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "zoomCommandHandler"), "appliedZoomFactorWithoutFudge");
        v161 = objc_msgSend(v160, "numberWithFloat:");
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v161, *MEMORY[0x1E0D05E00]);
      }
      v144 = x;
      v146 = y;
      v135 = width;
      v136 = height;
      goto LABEL_165;
    }
    if (dword_1ECFE9B50)
    {
      v151 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT);
      v94 = v244;
      v63 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      x = v232 + (v248 - v135) * 0.5;
      y = v233 + v142;
      width = v135;
      height = v136;
      v95 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
      goto LABEL_162;
    }
LABEL_153:
    x = v232 + (v248 - v135) * 0.5;
    y = v233 + v142;
    width = v135;
    height = v136;
    goto LABEL_162;
  }
  if (v256 == 5)
    goto LABEL_153;
  x = v232 + (v248 - v135) * 0.5;
  y = v233 + v142;
  width = v135;
  height = v136;
  if (v256 == 3)
    goto LABEL_162;
LABEL_165:
  if (v235)
  {
    v162 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D40]), "intValue");
    if (!FigCaptureVideoDimensionsAreValid(v162 | (unint64_t)(objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D38]), "intValue") << 32)))goto LABEL_175;
    if (FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(a1 + v95[984]), "sensorCropDimensions"))
      && v246 == 1.0
      && v255 == 1.0)
    {
      v163 = (float)((float)(int)objc_msgSend(*(id *)(a1 + v95[984]), "sensorCropDimensions", 1.0, v255) / (float)v162);
      objc_msgSend(*(id *)(a1 + v95[984]), "sensorCropDimensions");
      v144 = FigCaptureMetadataUtilitiesScaleRect2D(v144, v146, v135, v136, v163);
      v146 = v164;
      v135 = v165;
      v136 = v166;
    }
    if ((objc_msgSend(*(id *)(a1 + v95[984]), "sensorCenterOffset", v215, v216), v168 == v225)
      && (HIDWORD(v145) = HIDWORD(v224), v167 == v224)
      || *(double *)(a1 + 10704) == *MEMORY[0x1E0C9D820]
      && (v145 = *(double *)(a1 + 10712), v145 == *(double *)(MEMORY[0x1E0C9D820] + 8)))
    {
LABEL_175:
      v63 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + v95[984]), "sensorCenterOffset");
      v203 = FigCaptureMetadataUtilitiesNormalizePoint(v201, v202, (double)v162);
      v205 = v204;
      v270.origin.x = v144;
      v270.origin.y = v146;
      v270.size.width = v135;
      v270.size.height = v136;
      v271 = CGRectOffset(v270, v203, v205);
      v206 = v271.origin.x;
      v207 = v271.origin.y;
      v208 = v271.size.width;
      v209 = v271.size.height;
      v271.origin.x = v232;
      v271.origin.y = v233;
      v271.size.width = v248;
      v271.size.height = rect1;
      v275.origin.x = v206;
      v275.origin.y = v207;
      v275.size.width = v208;
      v275.size.height = v209;
      v63 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
      if (CGRectContainsRect(v271, v275))
      {
        v136 = v209;
        v135 = v208;
        v146 = v207;
        v144 = v206;
      }
    }
  }
  if (v85)
  {
    v45 = v220;
    if (objc_msgSend(*(id *)(a1 + v95[984]), "applyPreviewShiftToStillImage"))
    {
      if (v256 == 5 || v256 == 3)
      {
        v169 = mscsn_applyPreviewShiftToCropRect(v144, v146, v135, v136, v239, v226, v241);
        v171 = v170;
        v135 = v172;
        v136 = v173;
        objc_msgSend(*(id *)(a1 + v95[984]), "sensorOverscan");
        v176 = v175 / (v175 + 1.0);
        v177 = v174 / (v174 + 1.0) * 0.5;
        v178 = 1.0 - v177;
        if (1.0 - v177 >= v169)
          v178 = v169;
        if (v177 <= v178)
          v144 = v178;
        else
          v144 = v177;
        v179 = v176 * 0.5;
        v180 = 1.0 - v176 * 0.5;
        if (v180 >= v171)
          v180 = v171;
        if (v179 <= v180)
          v146 = v180;
        else
          v146 = v179;
      }
      else if (v239 != v225 || v226 != v224)
      {
        v267.x = v239 * v241;
        v267.y = v226 * v241;
        DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v267);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", DictionaryRepresentation, CFSTR("PreviewShiftForIrisStillImageMovieMetadataCache"));
        CMSetAttachment(v94, CFSTR("PreviewShift"), DictionaryRepresentation, 1u);

      }
    }
  }
  else
  {
    *(float *)&v145 = v237;
    v45 = v220;
    if (v237 <= 1.0
      || (objc_msgSend(*(id *)(a1 + v95[984]), "bravoShiftMitigationMaxZoomFactor", v145), *(float *)&v145 <= 1.0))
    {
      if (objc_msgSend(*(id *)(a1 + 96), "stereoVideoCaptureEnabled", v145, v215))
      {
        if (objc_msgSend(v223, "BOOLValue"))
        {
          v264 = 0uLL;
          if (!BWStereoUtilitiesComputeCenterShiftForPrimaryStream(*(_QWORD *)(a1 + 184), *MEMORY[0x1E0D05A28], (void *)objc_msgSend(*(id *)(a1 + 96), "cameraInfoByPortType"), v94, (float64x2_t *)&v261, &v264))
          {
            v251 = v232 + v248;
            v253 = FigCaptureMetadataUtilitiesNormalizePoint(v264.f64[0], v264.f64[1], v231);
            v211 = v232 + v248 - v135;
            if (v211 >= v144 + v253)
              v211 = v144 + v253;
            if (v232 <= v211)
              v144 = v211;
            else
              v144 = v232;
            v212 = v233 + rect1 - v136;
            v213 = v146 + v210;
            if (v212 >= v213)
              v212 = v213;
            if (v233 <= v212)
              v146 = v212;
            else
              v146 = v233;
            v272.origin.x = v222;
            v272.size.height = v219;
            v272.origin.y = v218;
            v272.size.width = v243;
            v276.origin.y = v229;
            v276.origin.x = v230;
            v276.size.height = v227;
            v276.size.width = v228;
            if (CGRectEqualToRect(v272, v276))
            {
              v45 = v220;
            }
            else
            {
              v214 = v251 - v243;
              if (v251 - v243 >= v222 + v253)
                v214 = v222 + v253;
              if (v232 > v214)
                v214 = v232;
              v222 = v214;
              v45 = v220;
            }
          }
        }
      }
    }
    else
    {
      if (v252 == v250 || (objc_msgSend(*(id *)(a1 + v95[984]), "previewOutputEnabled") & 1) == 0 && v252 == v247)
      {
        v239 = -[BWMultiStreamCameraSourceNode _bravoShiftMitigationCropOffset:totalZoom:totalConfiguredOverscan:totalAvailableOverscan:](a1, v94, v237, v246, v255, v248 / v135, rect1 / v136);
        v226 = v181;
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]), "floatValue");
        if (v182 == 0.0)
          v183 = 1.0;
        else
          v183 = v182;
        objc_msgSend(*(id *)(a1 + v63[938]), "baseZoomFactor", v215);
        -[BWMultiStreamCameraSourceNode _setPreviewShift:previewScaleFactor:previewShiftAtBaseZoom:ispAppliedZoomFactorForCaptureStream:](a1, v239 / v183, v226 / v183, 1.0, v225, v224, v220 / (float)(v183 * v184));
      }
      v185 = 1.0 - v135;
      if (1.0 - v135 >= v144 + v239)
        v185 = v144 + v239;
      if (v185 >= 0.0)
        v144 = v185;
      else
        v144 = 0.0;
      v186 = 1.0 - v136;
      if (1.0 - v136 >= v146 + v226)
        v186 = v146 + v226;
      if (v186 >= 0.0)
        v146 = v186;
      else
        v146 = 0.0;
    }
  }
  FigCaptureMetadataUtilitiesDenormalizeCropRect(v144, v146, v135, v136);
  v274.origin.x = v188;
  v274.origin.y = v189;
  v274.size.width = v190;
  v274.size.height = v191;
  v269.origin = v261;
  v269.size.width = v262;
  v269.size.height = v263;
  if (!CGRectContainsRect(v269, v274))
  {
    v216 = v234;
    LODWORD(v215) = 0;
    FigDebugAssert3();
  }
  FigCFDictionarySetCGRect();
  FigCFDictionarySetCGRect();
  v35 = v222;
LABEL_219:
  if (v85)
  {
    objc_msgSend(*(id *)(a1 + v63[938]), "baseZoomFactorAfterGDC");
    v193 = v192 / v45;
    if (v193 <= 1.0)
      v193 = 1.0;
    v194 = v193;
    v195 = v255;
    if (v246 > v255)
      v195 = v246;
    v196 = v195;
    v197 = 1.0 / v196 / v194;
    if (v197 >= 1.0)
      v197 = 1.0;
    *(float *)&v197 = v197;
    CMSetAttachment(v94, CFSTR("FinalCropRectScaleFactorAtBaseZoom"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v197, v215, v216), 1u);
  }
  v198 = v258 / v246;
  v199 = v198 / v135;
  *(float *)&v199 = v199;
  *(float *)&v199 = v45 * *(float *)&v199;
  CMSetAttachment(v94, CFSTR("TotalZoomFactor"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v199, v215), 1u);
  *(float *)(v259 + 504 * v62 + 160) = v45;
  return v35;
}

- (float)_ispAppliedZoomFactorFromSampleBufferMetadataDictionary:(int)a3 outputIndex:
{
  float v5;
  float v6;
  float v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t *v12;
  float v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
  v6 = v5;
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]), "floatValue");
  v8 = (_QWORD *)MEMORY[0x1E0D06DD0];
  v9 = (uint64_t *)MEMORY[0x1E0D06DC0];
  v10 = (uint64_t *)MEMORY[0x1E0D06DB0];
  v11 = (_QWORD *)MEMORY[0x1E0D06DA8];
  v12 = (uint64_t *)MEMORY[0x1E0D06BB0];
  v13 = v6 * fmaxf(v7, 1.0);
  v14 = (uint64_t *)MEMORY[0x1E0D06BA0];
  v15 = (uint64_t *)MEMORY[0x1E0D06B98];
  switch(a3)
  {
    case 2:
      v16 = *MEMORY[0x1E0D06BC0];
      if (!objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06BC0]))
        v16 = *MEMORY[0x1E0D06F58];
      if (!v16)
        goto LABEL_23;
      goto LABEL_12;
    case 1:
      v16 = *MEMORY[0x1E0D06DD0];
      if (!*MEMORY[0x1E0D06DD0])
      {
LABEL_23:
        if (a3 == 2)
        {
          v29 = *v12;
          if (objc_msgSend(a2, "objectForKeyedSubscript:", *v12))
          {
            v30 = objc_msgSend(a2, "objectForKeyedSubscript:", v29);
            objc_msgSend(a2, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D06F30]);
            objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, v29);
          }
          v31 = *v14;
          if (objc_msgSend(a2, "objectForKeyedSubscript:", *v14))
          {
            v32 = objc_msgSend(a2, "objectForKeyedSubscript:", v31);
            objc_msgSend(a2, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D06AC0]);
            objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, v31);
          }
          v33 = *v15;
          if (objc_msgSend(a2, "objectForKeyedSubscript:", *v15))
          {
            v34 = objc_msgSend(a2, "objectForKeyedSubscript:", v33);
            objc_msgSend(a2, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D06A70]);
            objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, v33);
          }
        }
        break;
      }
LABEL_12:
      v17 = v9;
      v18 = v10;
      v19 = v11;
      v20 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v16);
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "floatValue");
        v13 = v13 * v22;
      }
      if (v16 == *v8)
      {
        objc_msgSend(a2, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D06F58]);
        objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, v16);
        v23 = *v17;
        if (objc_msgSend(a2, "objectForKeyedSubscript:", *v17))
        {
          v24 = objc_msgSend(a2, "objectForKeyedSubscript:", v23);
          objc_msgSend(a2, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D06F30]);
          objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, v23);
        }
        v25 = *v18;
        v11 = v19;
        if (objc_msgSend(a2, "objectForKeyedSubscript:", *v18))
        {
          v26 = objc_msgSend(a2, "objectForKeyedSubscript:", v25);
          objc_msgSend(a2, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D06AC0]);
          objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, v25);
        }
        v27 = *v19;
        if (objc_msgSend(a2, "objectForKeyedSubscript:", *v19))
        {
          v28 = objc_msgSend(a2, "objectForKeyedSubscript:", v27);
          objc_msgSend(a2, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D06A70]);
          objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, v27);
        }
      }
      else
      {
        v11 = v19;
      }
      v10 = v18;
      v9 = v17;
      v15 = (uint64_t *)MEMORY[0x1E0D06B98];
      goto LABEL_23;
    case 0:
      v16 = *MEMORY[0x1E0D06F58];
      if (!*MEMORY[0x1E0D06F58])
        goto LABEL_23;
      goto LABEL_12;
  }
  if (*v8)
    objc_msgSend(a2, "setObject:forKeyedSubscript:", 0);
  objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, *v9);
  objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, *v10);
  objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, *v11);
  objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, *v12);
  objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, *v14);
  objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, *v15);
  objc_msgSend(a2, "removeObjectForKey:", *MEMORY[0x1E0D06EE8]);
  objc_msgSend(a2, "removeObjectForKey:", *MEMORY[0x1E0D06EE0]);
  return v13;
}

- (BOOL)hardwareDepthFilteringEnabled
{
  return self->_hardwareDepthFilteringSupported
      && -[BWMultiStreamCameraSourceNodeConfiguration hardwareDepthFilteringPreferred](self->_configuration, "hardwareDepthFilteringPreferred");
}

- (int)colorSpaceProperties
{
  return self->_colorSpaceProperties;
}

- (OpaqueCMClock)clock
{
  return -[BWFigVideoCaptureDevice clock](self->_captureDevice, "clock");
}

- (uint64_t)_updateColorSpaceProperties
{
  uint64_t v1;
  unint64_t v2;
  id v3;

  if (result)
  {
    v1 = result;
    v2 = -[BWMultiStreamCameraSourceNode videoCaptureDimensionsForColorspace](result);
    v3 = (id)objc_msgSend(*(id *)(v1 + 112), "getPropertyIfSupported:error:", *MEMORY[0x1E0D077C8], 0);
    if ((int)FigCapturePlatformIdentifier() <= 7)
    {
      v3 = (id)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v3, "removeObject:", &unk_1E49FB058);
    }
    result = +[BWVideoFormat colorSpacePropertiesForSourceThatSupportsWideColor:sourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:supportedColorSpaces:](BWVideoFormat, "colorSpacePropertiesForSourceThatSupportsWideColor:sourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:supportedColorSpaces:", objc_msgSend(*(id *)(v1 + 96), "supportsWideColor"), objc_msgSend(*(id *)(v1 + 312), "colorSpace"), objc_msgSend(*(id *)(v1 + 312), "clientVideoFormat"), v2, objc_msgSend(*(id *)(v1 + 312), "clientVideoFormat"), v3);
    *(_DWORD *)(v1 + 328) = result;
  }
  return result;
}

- (unint64_t)videoCaptureDimensionsForColorspace
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 312), "preferredPreviewDimensions");
    v3 = objc_msgSend(*(id *)(a1 + 312), "videoCaptureDimensions");
    v4 = v3;
    v5 = HIDWORD(v3);
    if ((objc_msgSend(*(id *)(a1 + 312), "videoCaptureOutputEnabled") & 1) == 0
      && objc_msgSend(*(id *)(a1 + 312), "previewOutputEnabled"))
    {
      if ((int)v2 < 960)
      {
        if ((int)v2 < v4 && SHIDWORD(v2) < (int)v5)
        {
          v8 = -[BWMultiStreamCameraSourceNode _finalPreviewOutputDimensions](a1);
          if ((int)v2 < (int)v8 && SHIDWORD(v2) < SHIDWORD(v8))
          {
            v5 = HIDWORD(v8);
            v4 = v8;
          }
        }
      }
      else
      {
        v6 = -[BWMultiStreamCameraSourceNode _finalPreviewOutputDimensions](a1);
        v4 = v6;
        v5 = HIDWORD(v6);
      }
      v9 = (void *)objc_msgSend(*(id *)(a1 + 112), "supportedProperties");
      if (!objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D078E0]))
      {
        v10 = -[BWMultiStreamCameraSourceNode _finalPreviewOutputDimensions](a1);
        v4 = v10;
        v5 = HIDWORD(v10);
      }
    }
  }
  else
  {
    LODWORD(v5) = 0;
    v4 = 0;
  }
  return v4 | ((unint64_t)v5 << 32);
}

- (uint64_t)_bringStreamUpToDate
{
  float v2;
  float v3;
  double v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  BOOL v10;
  double v11;
  BOOL v12;
  float v13;
  float v14;
  void *v15;
  uint64_t v16;
  void *v17;
  float v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t CaptureStreamColorSpace;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t YCbCrMatrix;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t updated;
  id *v40;
  int v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 104), "setLowLightVideoEnabled:", objc_msgSend(*(id *)(a1 + 312), "lowLightVideoEnabled"));
    objc_msgSend(*(id *)(a1 + 312), "maximumSupportedFrameRate");
    objc_msgSend(*(id *)(a1 + 104), "setMaximumSupportedFrameRate:");
    objc_msgSend(*(id *)(a1 + 312), "minimumSupportedFrameRate");
    objc_msgSend(*(id *)(a1 + 104), "setMinimumSupportedFrameRate:");
    objc_msgSend(*(id *)(a1 + 312), "minFrameRate");
    if ((v2 > 0.0
       || (objc_msgSend(*(id *)(a1 + 312), "minFrameRate"), v5 == 0.0)
       && objc_msgSend(*(id *)(a1 + 312), "pointCloudOutputEnabled")
       && objc_msgSend(*(id *)(a1 + 312), "pointCloudOutputIsSupplementalPointCloudData"))
      && (objc_msgSend(*(id *)(a1 + 312), "maxFrameRate"), v3 > 0.0))
    {
      objc_msgSend(*(id *)(a1 + 312), "minFrameRate");
      objc_msgSend(*(id *)(a1 + 104), "setMinimumFrameRate:");
      objc_msgSend(*(id *)(a1 + 312), "maxFrameRate");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 104), "maximumSupportedFrameRate");
      v7 = v6;
      objc_msgSend(*(id *)(a1 + 104), "minimumSupportedFrameRate");
      v9 = v8;
      objc_msgSend(*(id *)(a1 + 104), "minimumFrameRate");
      v10 = v7 < *(float *)&v11;
      *(float *)&v11 = v7;
      if (!v10)
        objc_msgSend(*(id *)(a1 + 104), "minimumFrameRate", v11);
      v12 = v9 <= *(float *)&v11;
      *(float *)&v11 = v9;
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 104), "minimumFrameRate", v11);
        v10 = v7 < *(float *)&v11;
        *(float *)&v11 = v7;
        if (!v10)
          objc_msgSend(*(id *)(a1 + 104), "minimumFrameRate", v11);
      }
      objc_msgSend(*(id *)(a1 + 104), "setMinimumFrameRate:", v11);
      objc_msgSend(*(id *)(a1 + 104), "maximumFrameRate");
      v10 = v7 < *(float *)&v4;
      *(float *)&v4 = v7;
      if (!v10)
        objc_msgSend(*(id *)(a1 + 104), "maximumFrameRate", v4);
      if (v9 > *(float *)&v4 || (objc_msgSend(*(id *)(a1 + 104), "maximumFrameRate"), v9 = v7, v7 < *(float *)&v4))
      {
LABEL_20:
        *(float *)&v4 = v9;
        objc_msgSend(*(id *)(a1 + 104), "setMaximumFrameRate:", v4);
        objc_msgSend(*(id *)(a1 + 312), "fastSwitchingMainFormatMaxFrameRate");
        if (v13 == 0.0)
          objc_msgSend(*(id *)(a1 + 312), "maximumSupportedFrameRate");
        objc_msgSend(*(id *)(a1 + 104), "setMaximumFrameRateForSensorRawOutputBufferPoolRequirements:");
        if (objc_msgSend(*(id *)(a1 + 104), "synchronizedStreamsEnabled"))
          objc_msgSend(*(id *)(a1 + 104), "setStreamingRequiredWhenConfiguredAsSlave:", objc_msgSend(*(id *)(a1 + 312), "streamingRequiredWhenConfiguredAsSlave"));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07408], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "chromaNoiseReductionEnabled")));
        objc_msgSend(*(id *)(a1 + 312), "aeMaxGain");
        if (v14 > 0.0)
        {
          v15 = *(void **)(a1 + 112);
          v16 = *MEMORY[0x1E0D07308];
          v17 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 312), "aeMaxGain");
          LODWORD(v19) = vcvts_n_s32_f32(v18, 8uLL);
          objc_msgSend(v15, "setProperty:value:", v16, objc_msgSend(v17, "numberWithInt:", v19));
          objc_msgSend(*(id *)(a1 + 312), "aeMaxGain");
          objc_msgSend(*(id *)(a1 + 104), "setAeMaxGain:");
        }
        v20 = *(void **)(a1 + 312);
        if (v20)
        {
          objc_msgSend(v20, "maxExposureDurationFrameworkOverride");
        }
        else
        {
          v52 = 0uLL;
          v53 = 0;
        }
        v21 = *(void **)(a1 + 104);
        v50 = v52;
        v51 = v53;
        objc_msgSend(v21, "setMaxExposureDurationFrameworkOverride:", &v50);
        v22 = *(void **)(a1 + 312);
        if (v22)
        {
          objc_msgSend(v22, "maxExposureDurationClientOverride");
        }
        else
        {
          v48 = 0uLL;
          v49 = 0;
        }
        v23 = *(void **)(a1 + 104);
        v46 = v48;
        v47 = v49;
        objc_msgSend(v23, "setMaxExposureDurationClientOverride:", &v46);
        CaptureStreamColorSpace = BWColorSpacePropertiesGetCaptureStreamColorSpace(*(_DWORD *)(a1 + 328));
        v25 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "stream"), "supportedProperties");
        v26 = *MEMORY[0x1E0D07428];
        if (objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D07428]))
          objc_msgSend(*(id *)(a1 + 112), "setProperty:value:", v26, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CaptureStreamColorSpace));
        v27 = (void *)objc_msgSend(*(id *)(a1 + 112), "supportedProperties");
        v28 = *MEMORY[0x1E0D078E0];
        if (objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0D078E0]) && !*(_BYTE *)(a1 + 160))
        {
          YCbCrMatrix = BWColorSpacePropertiesGetYCbCrMatrix(*(_DWORD *)(a1 + 328));
          if (YCbCrMatrix == *MEMORY[0x1E0CA8F00])
            v30 = *MEMORY[0x1E0CA8F18];
          else
            v30 = YCbCrMatrix;
          objc_msgSend(*(id *)(a1 + 112), "setProperty:value:", v28, v30);
        }
        v31 = 1;
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07410], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1));
        objc_msgSend(*(id *)(a1 + 104), "setKeypointDetectionEnabled:", objc_msgSend(*(id *)(a1 + 312), "keypointDetectionEnabled"));
        objc_msgSend(*(id *)(a1 + 104), "setStillImageKeypointDetectionEnabled:", objc_msgSend(*(id *)(a1 + 312), "stillImageKeypointDetectionEnabled"));
        objc_msgSend(*(id *)(a1 + 104), "setMultiBandNoiseReductionMode:", objc_msgSend(*(id *)(a1 + 312), "ispMultiBandNoiseReductionMode"));
        if ((objc_msgSend(*(id *)(a1 + 312), "ltmLookUpTableMetadataEnabledForStills") & 1) == 0)
          v31 = objc_msgSend(*(id *)(a1 + 312), "ltmLookUpTableMetadataEnabledForStreaming");
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D075C8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07470], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "ltmLookUpTableMetadataEnabledForStreaming")));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D075D8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "ltmThumbnailMetadataEnabledForStreaming")));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07478], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "ltmThumbnailMetadataEnabledForStreaming")));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D075D0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07640], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "lumaHistogramMetadataEnabled")));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07480], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "lumaHistogramMetadataEnabled")));
        v32 = objc_msgSend(*(id *)(a1 + 312), "stillImageLocalHistogramClippingDataMetadataEnabled");
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07600], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v32));
        v33 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07440], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "contentAwareEnhancementEnabled")));
        if ((_DWORD)v33)
        {
          v44 = v33;
        }
        else
        {
          v34 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07438], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "contentAwareAWBEnabled")));
          if ((_DWORD)v34)
          {
            v44 = v34;
          }
          else
          {
            v35 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D076C8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "multiIlluminantWhiteBalanceEnabled")));
            if ((_DWORD)v35)
            {
              v44 = v35;
            }
            else
            {
              v36 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07418], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1));
              if ((_DWORD)v36)
              {
                v44 = v36;
              }
              else
              {
                if ((int)objc_msgSend(*(id *)(a1 + 96), "videoStabilizationStrength") <= 2)
                  v37 = 0;
                else
                  v37 = &unk_1E4A024D0;
                v38 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D075F0], v37);
                if ((_DWORD)v38)
                {
                  v44 = v38;
                }
                else
                {
                  objc_msgSend(*(id *)(a1 + 104), "setFocusBlurMapEnabled:", objc_msgSend(*(id *)(a1 + 312), "focusBlurMapEnabled"));
                  -[BWMultiStreamCameraSourceNode _updateMetadataConfigurations](a1);
                  -[BWMultiStreamCameraSourceNode _updateObjectDetectionMetadataRegistration](a1);
                  -[BWMultiStreamCameraSourceNode _updateDepthConfiguration](a1);
                  updated = -[BWMultiStreamCameraSourceNode _updateOutputConfigurations](a1);
                  if ((_DWORD)updated)
                  {
                    v44 = updated;
                  }
                  else
                  {
                    -[BWMultiStreamCameraSourceNode _updateOverscanReservedInISPZoom](a1);
                    v40 = -[BWMultiStreamCameraSourceNode _verifyColorSpacePropertiesForAllOutputs]((id *)a1);
                    if (!(_DWORD)v40)
                    {
                      v41 = FigCapturePixelFormatIs422(objc_msgSend(*(id *)(a1 + 312), "clientVideoFormat"));
                      v42 = *(void **)(a1 + 112);
                      v43 = *MEMORY[0x1E0D077B0];
                      if (v41)
                        objc_msgSend(v42, "setProperty:value:", v43, &unk_1E49FAF98);
                      else
                        objc_msgSend(v42, "setPropertyIfSupported:value:", v43, &unk_1E49FAFE0);
                      objc_msgSend(*(id *)(a1 + 104), "setMainToSIFRFrameRateRatio:", objc_msgSend(*(id *)(a1 + 312), "mainToSIFRFrameRateRatio"));
                      objc_msgSend(*(id *)(a1 + 104), "setHighlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream:", objc_msgSend(*(id *)(a1 + 312), "highlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream"));
                      objc_msgSend(*(id *)(a1 + 104), "setHighlightRecoveryEnabledWhenConfiguredAsSlave:", objc_msgSend(*(id *)(a1 + 312), "highlightRecoveryEnabledWhenConfiguredAsSlave"));
                      objc_msgSend(*(id *)(a1 + 104), "setVideoHDRImageStatisticsEnabled:", objc_msgSend(*(id *)(a1 + 312), "videoHDRImageStatisticsEnabled"));
                      objc_msgSend(*(id *)(a1 + 104), "setVideoHDRFusionEnabled:", objc_msgSend(*(id *)(a1 + 312), "videoHDRFusionEnabled"));
                      objc_msgSend(*(id *)(a1 + 104), "setPixelFormatIsTenBit:", FigCapturePixelFormatIsTenBit(objc_msgSend(*(id *)(a1 + 312), "clientVideoFormat")));
                      objc_msgSend(*(id *)(a1 + 104), "setColorSpaceIsAppleLog:", objc_msgSend(*(id *)(a1 + 312), "colorSpace") == 3);
                      objc_msgSend(*(id *)(a1 + 104), "setVideoCaptureDimensions:", objc_msgSend(*(id *)(a1 + 312), "videoCaptureDimensions"));
                      objc_msgSend(*(id *)(a1 + 104), "setBackgroundBlurEnabled:", objc_msgSend(*(id *)(a1 + 312), "backgroundBlurEnabled"));
                      objc_msgSend(*(id *)(a1 + 104), "setStudioLightingEnabled:", objc_msgSend(*(id *)(a1 + 312), "studioLightingEnabled"));
                      objc_msgSend(*(id *)(a1 + 104), "setReactionEffectsEnabled:", objc_msgSend(*(id *)(a1 + 312), "reactionEffectsEnabled"));
                      objc_msgSend(*(id *)(a1 + 104), "setBackgroundReplacementEnabled:", objc_msgSend(*(id *)(a1 + 312), "backgroundReplacementEnabled"));
                      objc_msgSend(*(id *)(a1 + 104), "setCinematicFramingEnabled:", objc_msgSend(*(id *)(a1 + 312), "cinematicFramingEnabled"));
                      return 0;
                    }
                    v44 = (uint64_t)v40;
                  }
                }
              }
            }
          }
        }
        FigDebugAssert3();
        return v44;
      }
      objc_msgSend(*(id *)(a1 + 104), "maximumFrameRate");
    }
    v9 = *(float *)&v4;
    goto LABEL_20;
  }
  return 0;
}

- (uint64_t)_stillImageColorSpaceProperties
{
  uint64_t v1;
  int v2;
  unsigned int CaptureStreamColorSpace;

  if (result)
  {
    v1 = result;
    if ((FigCapturePixelFormatIsFullRange(objc_msgSend(*(id *)(result + 312), "clientVideoFormat")) & 1) != 0
      || !objc_msgSend(*(id *)(v1 + 312), "usesFirmwareStillImageOutput"))
    {
      goto LABEL_17;
    }
    v2 = *(_DWORD *)(v1 + 328);
    if ((v2 - 5) < 3)
      return 7;
    if (v2)
    {
      return 1;
    }
    else
    {
LABEL_17:
      if (objc_msgSend(*(id *)(v1 + 312), "usesFirmwareStillImageOutput")
        && objc_msgSend(*(id *)(v1 + 312), "stillImageOutputRequires10BitPixelFormat"))
      {
        CaptureStreamColorSpace = BWColorSpacePropertiesGetCaptureStreamColorSpace(*(_DWORD *)(v1 + 328));
        if (BWColorSpaceIsWide(CaptureStreamColorSpace))
          return 3;
        else
          return 1;
      }
      else
      {
        return *(unsigned int *)(v1 + 328);
      }
    }
  }
  return result;
}

- (uint64_t)_updateMetadataConfigurations
{
  id *v1;
  int v2;
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (result)
  {
    v1 = (id *)result;
    v2 = objc_msgSend(*(id *)(result + 312), "motionAttachmentsSource");
    v3 = v2 == 2 || objc_msgSend(v1[39], "motionAttachmentsSource") == 1;
    v4 = (void *)objc_msgSend(v1[14], "supportedProperties");
    v5 = *MEMORY[0x1E0D07580];
    if (objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07580]))
      objc_msgSend(v1[14], "setProperty:value:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v1[39], "ispAPSDataEnabled")));
    else
      objc_msgSend(v1[39], "ispAPSDataEnabled");
    v6 = (void *)objc_msgSend(v1[14], "supportedProperties");
    v7 = *MEMORY[0x1E0D07588];
    if (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D07588]))
    {
      objc_msgSend(v1[14], "setProperty:value:", v7, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2 == 2));
    }
    else if (v2 == 2)
    {
      objc_msgSend(v1[12], "captureStream");
    }
    v8 = (void *)objc_msgSend((id)objc_msgSend(v1[13], "stream"), "supportedProperties");
    result = objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D07590]);
    if (result)
      return objc_msgSend(v1[13], "setMotionDataDeliveryEnabled:", v3);
  }
  return result;
}

- (uint64_t)_updateDepthSettings
{
  uint64_t v1;
  int v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  _BOOL4 v15;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  *(_QWORD *)(result + 344) = 0;
  v2 = objc_msgSend(*(id *)(result + 312), "depthType");
  if (v2 == 1)
  {
    v3 = (_QWORD *)MEMORY[0x1E0D063B8];
    goto LABEL_6;
  }
  if (v2 == 2)
  {
    v3 = (_QWORD *)MEMORY[0x1E0D063A0];
LABEL_6:
    *(_QWORD *)(v1 + 344) = *v3;
  }
  result = objc_msgSend(*(id *)(v1 + 312), "depthType");
  if ((result - 1) <= 1)
  {
    v4 = objc_msgSend(*(id *)(v1 + 312), "depthDimensions");
    v5 = (void *)objc_msgSend(*(id *)(v1 + 112), "getProperty:error:", *MEMORY[0x1E0D07498], 0);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v5;
    result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (result)
    {
      v6 = result;
      v7 = *(_QWORD *)v23;
      v8 = *MEMORY[0x1E0D06428];
      v9 = *MEMORY[0x1E0D06420];
      v20 = v1;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
          v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v8, v20), "intValue");
          v13 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v9), "intValue");
          v15 = v12 == (_DWORD)v4 && v13 == HIDWORD(v4);
          if (v12 == HIDWORD(v4) && v13 == (_DWORD)v4)
          {
            v17 = *(unsigned __int8 *)(v20 + 160);
            if (*(_BYTE *)(v20 + 160))
              v17 = objc_msgSend(*(id *)(v20 + 96), "captureStream") != *(_QWORD *)(v20 + 104);
          }
          else
          {
            v17 = 0;
          }
          if ((v15 | v17) == 1)
          {
            v18 = objc_msgSend(*(id *)(v20 + 312), "hardwareDepthFilteringPreferred");
            if (v18)
              LOBYTE(v18) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06430]), "BOOLValue");
            *(_BYTE *)(v20 + 352) = v18;
            v19 = objc_msgSend(*(id *)(v20 + 312), "strictDepthModePreferred");
            if (v19)
              LOBYTE(v19) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06458]), "BOOLValue");
            *(_BYTE *)(v20 + 353) = v19;
            *(_BYTE *)(v20 + 354) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06450]), "BOOLValue");
            *(_BYTE *)(v20 + 355) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06448]), "BOOLValue");
            *(_BYTE *)(v20 + 356) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06440]), "BOOLValue");
            result = objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06438]);
            *(_QWORD *)(v20 + 360) = result;
            return result;
          }
          ++v10;
        }
        while (v6 != v10);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v6 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_updateDepthConfiguration
{
  void *v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void **v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "stream"), "supportedProperties");
  v3 = *MEMORY[0x1E0D07488];
  if (!objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D07488]))
    return 0;
  v4 = objc_msgSend(*(id *)(a1 + 312), "depthType");
  v5 = objc_msgSend(*(id *)(a1 + 312), "depthDimensions");
  v6 = v4 - 1;
  if ((v4 - 1) <= 1)
  {
    v7 = v5;
    v8 = HIDWORD(v5);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v42[0] = *(_QWORD *)(a1 + 344);
    v10 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D063C8]);
    if (objc_msgSend(*(id *)(a1 + 312), "depthOutputEnabled"))
    {
      v11 = (void *)objc_msgSend(*(id *)(a1 + 248), "videoFormat");
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 312), "videoCaptureOutputEnabled"))
        v12 = 208;
      else
        v12 = 200;
      v11 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + v12), "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "resolvedVideoFormat");
    }
    v13 = objc_msgSend(v11, "pixelFormat");
    v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D063E0]);
    if (!*(_BYTE *)(a1 + 160) || objc_msgSend(*(id *)(a1 + 96), "captureStream") == *(_QWORD *)(a1 + 104))
    {
      v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D063E8]);
      v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
      v23 = (_QWORD *)MEMORY[0x1E0D063D8];
    }
    else
    {
      v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "captureStream"), "portType");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D063C0]);
      v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D063E8]);
      v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D063D8]);
      v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "RGBIRStereoFusionEnabled"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D063F0]);
      if (!objc_msgSend(*(id *)(a1 + 312), "RGBIRStereoFusionEnabled"))
        goto LABEL_22;
      if (*(_BYTE *)(a1 + 354))
      {
        v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 312), "RGBIRStereoFusionMinDepthThresholdMM"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D06410]);
      }
      if (*(_BYTE *)(a1 + 355))
      {
        v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 312), "RGBIRStereoFusionMaxDepthThresholdMM"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D06408]);
      }
      if (!*(_BYTE *)(a1 + 356))
        goto LABEL_22;
      v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 312), "RGBIRStereoFusionFixedDepthThresholdMM"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D063F8]);
      v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 312), "RGBIRStereoFusionFixedDepthValueMM"));
      v23 = (_QWORD *)MEMORY[0x1E0D06400];
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, *v23);
LABEL_22:
    if (*(_BYTE *)(a1 + 352))
    {
      v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "hardwareDepthFilteringPreferred"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D063D0]);
    }
    if (*(_BYTE *)(a1 + 353))
    {
      v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "strictDepthModePreferred"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D06418]);
    }
    goto LABEL_26;
  }
  v9 = 0;
LABEL_26:
  objc_msgSend(*(id *)(a1 + 112), "setProperty:value:", v3, v9);
  if (*(_BYTE *)(a1 + 160))
  {
    if (v6 > 1)
    {
      v34 = *MEMORY[0x1E0D06608];
      v35 = &unk_1E49FAF98;
      v28 = (void *)MEMORY[0x1E0C99D80];
      v29 = &v35;
      v30 = &v34;
      v31 = 1;
    }
    else
    {
      v27 = *MEMORY[0x1E0D06610];
      v36 = *MEMORY[0x1E0D06608];
      v37 = v27;
      v39 = &unk_1E49FAFF8;
      v40 = &unk_1E49FAF98;
      v38 = *MEMORY[0x1E0D06618];
      v41 = &unk_1E49FAFE0;
      v28 = (void *)MEMORY[0x1E0C99D80];
      v29 = &v39;
      v30 = &v36;
      v31 = 3;
    }
    v32 = objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, v31, v34, v35, v36, v37, v38, v39, v40, v41);
    objc_msgSend(*(id *)(a1 + 112), "setProperty:value:", *MEMORY[0x1E0D07598], v32);
    objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D077C0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "isAutoFocusAssistSourceNode")));
  }
  return 0;
}

- (BWNodeOutput)previewOutput
{
  return self->_previewOutput;
}

- (uint64_t)_primaryScalerIsAvailable
{
  uint64_t v1;
  void *v2;
  int v3;
  int v4;
  int v5;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(*(id *)(result + 104), "supportedOutputs");
    v3 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0D07FE0]);
    if (objc_msgSend(*(id *)(v1 + 312), "depthType") - 1 <= 1
      && objc_msgSend(*(id *)(v1 + 312), "secondaryScalerIsNotAvailable")
      && objc_msgSend(*(id *)(v1 + 312), "previewOutputEnabled"))
    {
      v4 = objc_msgSend(*(id *)(v1 + 312), "videoCaptureOutputEnabled");
    }
    else
    {
      v4 = 0;
    }
    if (*(_BYTE *)(v1 + 128)
      && objc_msgSend(*(id *)(v1 + 96), "depthDataDeliveryEnabled")
      && ((objc_msgSend(*(id *)(v1 + 96), "isBravoVariant") ^ 1 | v4) & 1) == 0
      && (objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled") & 1) == 0)
    {
      v5 = objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnPreviewOutputEnabled");
      if (v3)
        return v5 & ~objc_msgSend(*(id *)(v1 + 312), "primaryScalerDecoupled");
    }
    else
    {
      v5 = 1;
      if (v3)
        return v5 & ~objc_msgSend(*(id *)(v1 + 312), "primaryScalerDecoupled");
    }
    return 0;
  }
  return result;
}

- (uint64_t)_secondaryScalerIsAvailable
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    if ((objc_msgSend(*(id *)(result + 312), "secondaryScalerIsNotAvailable") & 1) != 0)
    {
      return 0;
    }
    else
    {
      v2 = (void *)objc_msgSend(*(id *)(v1 + 104), "supportedOutputs");
      result = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0D07FF0]);
      if ((_DWORD)result)
        return !objc_msgSend(*(id *)(v1 + 312), "primaryScalerDecoupled") || *(_BYTE *)(v1 + 128) != 0;
    }
  }
  return result;
}

- (uint64_t)_updateOutputIDMappingsForStreamingOutputs
{
  unint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  char v13;
  int v14;
  void *v15;
  void *v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  void **v21;
  void **v22;
  void **v23;
  void **v24;
  void *v25;
  int v26;
  BOOL v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 312), "previewOutputEnabled");
    v3 = -[BWMultiStreamCameraSourceNode _shouldEnableStreamCaptureOutputForNodeOutput:](v1, 0);
    v4 = -[BWMultiStreamCameraSourceNode _primaryScalerIsAvailable](v1);
    v5 = -[BWMultiStreamCameraSourceNode _secondaryScalerIsAvailable](v1);
    v6 = (void *)objc_msgSend(*(id *)(v1 + 104), "supportedOutputs");
    v7 = (void *)*MEMORY[0x1E0D07FC8];
    v8 = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0D07FC8]);
    if (v4)
    {
      v9 = -[BWMultiStreamCameraSourceNode _isVideoCaptureOutputSupportedByOutputID:](v1, (void *)*MEMORY[0x1E0D07FE0]);
      if (!v5)
        goto LABEL_4;
    }
    else
    {
      v9 = 0;
      if (!v5)
      {
LABEL_4:
        v10 = 0;
        if (!v8)
          goto LABEL_5;
        goto LABEL_9;
      }
    }
    v10 = -[BWMultiStreamCameraSourceNode _isVideoCaptureOutputSupportedByOutputID:](v1, (void *)*MEMORY[0x1E0D07FF0]);
    if (!v8)
    {
LABEL_5:
      v31 = 0;
      if (!v10)
        goto LABEL_12;
LABEL_10:
      if (objc_msgSend(*(id *)(v1 + 312), "primaryScalerDeprioritized"))
      {
        LODWORD(v29) = objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled") ^ 1;
LABEL_13:
        v30 = v9;
        if (v31
          && objc_msgSend(*(id *)(v1 + 312), "primaryScalerDeprioritized")
          && (objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled") & 1) == 0)
        {
          if (-[BWMultiStreamCameraSourceNode _scalingRequiredForOutput:](v1, *(void **)(v1 + 208)))
            v11 = FigCapturePixelFormatIs422(objc_msgSend(*(id *)(v1 + 312), "clientVideoFormat"));
          else
            v11 = 1;
        }
        else
        {
          v11 = 0;
        }
        HIDWORD(v29) = v10;
        if (v5 && objc_msgSend(*(id *)(v1 + 312), "primaryScalerDeprioritized"))
        {
          v12 = objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnPreviewOutputEnabled") ^ 1;
          if (!v8)
            goto LABEL_24;
        }
        else
        {
          v12 = 0;
          if (!v8)
            goto LABEL_24;
        }
        if (objc_msgSend(*(id *)(v1 + 312), "primaryScalerDeprioritized", v29)
          && (objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnPreviewOutputEnabled") & 1) == 0)
        {
          v13 = -[BWMultiStreamCameraSourceNode _scalingRequiredForOutput:](v1, *(void **)(v1 + 200)) ^ 1;
LABEL_25:
          v14 = v2 & v3;
          if (*(_BYTE *)(v1 + 160))
          {
            if (v14)
              objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot enable two streaming outputs on the IR camera.")), 0));
            v15 = (void *)*MEMORY[0x1E0D07FE8];
            if (v3)
              v16 = (void *)*MEMORY[0x1E0D07FE8];
            else
              v16 = 0;
            if (v2)
            {
              v7 = 0;
            }
            else
            {
              v15 = 0;
              v7 = v16;
            }
            goto LABEL_33;
          }
          if (v14)
          {
            if (((v4 | v5) & 1) == 0)
              return FigSignalErrorAt();
            if ((v4 & v5) == 1)
            {
              if (objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled")&& objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnPreviewOutputEnabled"))
              {
                v17 = -[BWMultiStreamCameraSourceNode _calculateVideoCaptureDimensions](v1);
                v18 = v17;
                v19 = HIDWORD(v17);
                v20 = -[BWMultiStreamCameraSourceNode _calculatePreviewDimensionsForShiftMitigation](v1);
                if (v18 >= (int)v20 && (int)v19 >= SHIDWORD(v20) && v30 == 1)
                {
                  v21 = (void **)MEMORY[0x1E0D07FE0];
                  v22 = (void **)MEMORY[0x1E0D07FF0];
LABEL_108:
                  v7 = *v21;
                  v15 = *v22;
                  goto LABEL_33;
                }
                v27 = v18 < (int)v20 && (int)v19 < SHIDWORD(v20);
                v28 = HIDWORD(v29);
                if (!v27)
                  v28 = 0;
                if (v28 == 1)
                {
                  v21 = (void **)MEMORY[0x1E0D07FF0];
                  v22 = (void **)MEMORY[0x1E0D07FE0];
                  goto LABEL_108;
                }
                return 4294954516;
              }
              if (v11)
              {
                v23 = (void **)MEMORY[0x1E0D07FF0];
                if (!v12)
                  v23 = (void **)MEMORY[0x1E0D07FE0];
                goto LABEL_95;
              }
              if (v30)
              {
                v25 = (void *)*MEMORY[0x1E0D07FE0];
                if ((objc_msgSend(*(id *)(v1 + 312), "optimizeBandwidthForPreviewOutput") & 1) != 0)
                {
                  v26 = -[BWMultiStreamCameraSourceNode _preferIntermediateTapOverSecondaryScalerForPreviewOutputBasedOnBandwidth](v1);
                  v15 = (void *)*MEMORY[0x1E0D07FF0];
                  if (v26)
                    v15 = v7;
                }
                else
                {
                  v15 = (void *)*MEMORY[0x1E0D07FF0];
                }
                v7 = v25;
                goto LABEL_33;
              }
              if (HIDWORD(v29))
              {
                v7 = (void *)*MEMORY[0x1E0D07FF0];
                goto LABEL_94;
              }
LABEL_93:
              if (!v31)
                return 4294954516;
              goto LABEL_94;
            }
            if (v4)
            {
              if (!objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled")|| !objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnPreviewOutputEnabled"))
              {
                if ((v31 & v30) == 1)
                {
                  if ((-[BWMultiStreamCameraSourceNode _scalingRequiredForOutput:](v1, *(void **)(v1 + 208)) & 1) == 0
                    && !-[BWMultiStreamCameraSourceNode _preferPrimaryScalerOverIntermediateTapForVideoOutputBasedOnBandwidth](v1)
                    || objc_msgSend(*(id *)(v1 + 312), "depthType", v29) - 1 <= 1
                    && !-[BWMultiStreamCameraSourceNode _videoCaptureOutputDimensionsValidForDepth](v1))
                  {
                    goto LABEL_94;
                  }
                }
                else if (!v30)
                {
                  goto LABEL_93;
                }
                v24 = (void **)MEMORY[0x1E0D07FE0];
                goto LABEL_89;
              }
              return FigSignalErrorAt();
            }
            if (v5)
            {
              if ((objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled") & 1) != 0
                || objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnPreviewOutputEnabled"))
              {
                return FigSignalErrorAt();
              }
              if (!v31)
              {
                if (!HIDWORD(v29))
                  return 4294954516;
                v24 = (void **)MEMORY[0x1E0D07FF0];
LABEL_89:
                v15 = v7;
                goto LABEL_90;
              }
LABEL_47:
              v23 = (void **)MEMORY[0x1E0D07FF0];
LABEL_95:
              v15 = *v23;
              goto LABEL_33;
            }
            goto LABEL_76;
          }
          if (v2)
          {
            if (v12)
            {
LABEL_46:
              v7 = 0;
              goto LABEL_47;
            }
            if ((v13 & 1) == 0)
            {
              if (v4)
              {
                v7 = 0;
LABEL_94:
                v23 = (void **)MEMORY[0x1E0D07FE0];
                goto LABEL_95;
              }
              if (v5)
                goto LABEL_46;
              if ((v8 & 1) == 0)
                return 4294954516;
            }
            v15 = v7;
LABEL_77:
            v7 = 0;
LABEL_33:
            result = 0;
            *(_QWORD *)(v1 + 10576) = v15;
            *(_QWORD *)(v1 + 10608) = v7;
            return result;
          }
          if (!v3)
          {
LABEL_76:
            v15 = 0;
            goto LABEL_77;
          }
          if ((_DWORD)v29)
          {
LABEL_53:
            v15 = 0;
            v24 = (void **)MEMORY[0x1E0D07FF0];
LABEL_90:
            v7 = *v24;
            goto LABEL_33;
          }
          if ((v11 & 1) == 0)
          {
            if (v30)
            {
              v15 = 0;
              v24 = (void **)MEMORY[0x1E0D07FE0];
              goto LABEL_90;
            }
            if (HIDWORD(v29))
              goto LABEL_53;
            if (!v31)
              return 4294954516;
          }
          v15 = 0;
          goto LABEL_33;
        }
LABEL_24:
        v13 = 0;
        goto LABEL_25;
      }
LABEL_12:
      LODWORD(v29) = 0;
      goto LABEL_13;
    }
LABEL_9:
    v31 = -[BWMultiStreamCameraSourceNode _isVideoCaptureOutputSupportedByOutputID:](v1, v7);
    if (!v10)
      goto LABEL_12;
    goto LABEL_10;
  }
  return result;
}

- (uint64_t)_firmwareStillImageOutputRetainedBufferCountForClientBracketCount:(uint64_t)result
{
  uint64_t v3;
  unsigned int v4;
  int v5;

  if (result)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 312), "stillImageOutputEnabled");
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(v3 + 312), "usesFirmwareStillImageOutput");
      if ((_DWORD)result)
      {
        v4 = *(_DWORD *)(v3 + 10640);
        if (v4 == -1)
        {
          v5 = objc_msgSend(*(id *)(v3 + 216), "retainedBufferCount");
          result = (a2 + 1);
          if (v5 > (int)result)
            return objc_msgSend(*(id *)(v3 + 216), "retainedBufferCount");
        }
        else if ((int)v4 <= a2 + 1)
        {
          return (a2 + 1);
        }
        else
        {
          return v4;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_updateOutputRequirements
{
  uint64_t v1;
  uint64_t v2;
  uint64_t updated;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  id *v7;
  BWVideoFormatRequirements *v8;
  BWNodeOutputMediaConfiguration *v9;
  BWNodeOutputMediaConfiguration *v10;
  BWNodeOutputMediaConfiguration *v11;
  id *v12;
  BWVideoFormatRequirements *v13;
  BWNodeOutputMediaConfiguration *v14;
  BWNodeOutputMediaConfiguration *v15;
  BWVideoFormatRequirements *v16;
  BWNodeOutputMediaConfiguration *v17;
  BWNodeOutputMediaConfiguration *v18;
  char v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  int v23;
  int *v24;
  void *v25;
  BWVideoFormatRequirements *v26;
  BWNodeOutputMediaConfiguration *v27;
  uint64_t v28;
  BWNodeOutputMediaConfiguration *v29;
  BWVideoFormatRequirements *v30;
  uint64_t v31;
  BWNodeOutputMediaConfiguration *v32;
  BWVideoFormatRequirements *v33;
  uint64_t v34;
  BWNodeOutputMediaConfiguration *v35;
  BWVideoFormatRequirements *v36;
  BWNodeOutputMediaConfiguration *v37;
  BWVideoFormatRequirements *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  BWVideoFormatRequirements *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  int v58;
  int v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t j;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  int v73;
  int v74;
  BWVideoFormatRequirements *v75;
  BWPointCloudFormatRequirements *v76;
  BWVideoFormatRequirements *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  BWNodeOutputMediaConfiguration *v84;
  uint64_t v85;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD v116[3];

  v116[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = a1;
  v2 = objc_msgSend(*(id *)(a1 + 312), "secureMetadataOutputConfiguration");
  objc_msgSend(*(id *)(v1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D074C0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2 != 0));
  updated = -[BWMultiStreamCameraSourceNode _updateFormatIndex](v1);
  if ((_DWORD)updated)
  {
    v85 = updated;
LABEL_138:
    FigDebugAssert3();
    return v85;
  }
  v4 = -[BWMultiStreamCameraSourceNode _updateActiveNondisruptiveSwitchingFormatIndices](v1);
  if ((_DWORD)v4)
  {
    v85 = v4;
    goto LABEL_138;
  }
  v5 = -[BWMultiStreamCameraSourceNode _updateOutputIDs](v1);
  if ((_DWORD)v5)
  {
    v85 = v5;
    goto LABEL_138;
  }
  if (objc_msgSend(*(id *)(v1 + 312), "previewOutputEnabled")
    && objc_msgSend(*(id *)(v1 + 312), "videoCaptureOutputEnabled")
    && objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled")
    && objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnPreviewOutputEnabled")
    && (-[BWMultiStreamCameraSourceNode _scalerChainingEnabled](v1) & 1) == 0)
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot have two streaming outputs AND GDC enabled without scaler chaining.")), 0));
  }
  -[BWMultiStreamCameraSourceNode _updateOutputsStorage](v1);
  -[BWMultiStreamCameraSourceNode _updateVideoCaptureOutputFlags](v1);
  -[BWMultiStreamCameraSourceNode _updateColorSpaceProperties](v1);
  if (objc_msgSend(*(id *)(v1 + 312), "depthType") - 1 > 1)
  {
    v6 = 0;
  }
  else if (objc_msgSend(*(id *)(v1 + 312), "depthOutputEnabled"))
  {
    v6 = 0;
  }
  else
  {
    v6 = CFSTR("Depth");
  }
  if (objc_msgSend(*(id *)(v1 + 312), "previewOutputEnabled"))
  {
    v7 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:]((id *)v1, *(void **)(v1 + 10576), *(void **)(v1 + 200));
    v8 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForOutputID:configuration:]((id *)v1, *(void **)(v1 + 10576), v7);
    -[BWVideoFormatRequirements setSupportedCacheModes:](v8, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess](BWVideoFormatRequirements, "cacheModesForOptimizedCPUAccess"));
    -[BWVideoFormatRequirements setPrewireBuffers:](v8, "setPrewireBuffers:", 0);
    v116[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v1 + 328));
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v8, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 1));
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 200), "primaryMediaConfiguration"), "setFormatRequirements:", v8);
    objc_msgSend(*(id *)(v1 + 200), "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), objc_msgSend(*(id *)(v1 + 200), "name"), *(_QWORD *)(v1 + 10576)));
    if (v6)
    {
      v9 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v9, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForDepthOutput](v1));
      objc_msgSend(*(id *)(v1 + 200), "setMediaConfiguration:forAttachedMediaKey:", v9, v6);
    }
    if (objc_msgSend(*(id *)(v1 + 312), "preLTMThumbnailOnPreviewOutputEnabled"))
    {
      v10 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v10, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForPreLTMThumbnailOutput](v1));
      objc_msgSend(*(id *)(v1 + 200), "setMediaConfiguration:forAttachedMediaKey:", v10, 0x1E494FBD8);
    }
    if (objc_msgSend(*(id *)(v1 + 312), "postColorProcessingThumbnailOnPreviewOutputEnabled"))
    {
      v11 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v11, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForPostColorProcessingThumbnailOutput](v1));
      objc_msgSend(*(id *)(v1 + 200), "setMediaConfiguration:forAttachedMediaKey:", v11, 0x1E495B478);
    }
    *(_QWORD *)(v1 + 10600) = -[BWMultiStreamCameraSourceNode _colorInfoDictionaryForStreamOutputID:]((id *)v1, *(void **)(v1 + 10576));
  }
  else
  {
    objc_msgSend(*(id *)(v1 + 200), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
  }
  if (objc_msgSend(*(id *)(v1 + 312), "videoCaptureOutputEnabled"))
  {
    v12 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:]((id *)v1, *(void **)(v1 + 10608), *(void **)(v1 + 208));
    v13 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForOutputID:configuration:]((id *)v1, *(void **)(v1 + 10608), v12);
    -[BWVideoFormatRequirements setSupportedCacheModes:](v13, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess](BWVideoFormatRequirements, "cacheModesForOptimizedCPUAccess"));
    -[BWVideoFormatRequirements setPrewireBuffers:](v13, "setPrewireBuffers:", 0);
    v115 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v1 + 328));
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v13, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1));
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 208), "primaryMediaConfiguration"), "setFormatRequirements:", v13);
    objc_msgSend(*(id *)(v1 + 208), "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), objc_msgSend(*(id *)(v1 + 208), "name"), *(_QWORD *)(v1 + 10608)));
    if (v6)
    {
      v14 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v14, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForDepthOutput](v1));
      objc_msgSend(*(id *)(v1 + 208), "setMediaConfiguration:forAttachedMediaKey:", v14, v6);
    }
    if (objc_msgSend(*(id *)(v1 + 312), "visionDataConfiguration"))
    {
      v15 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v16 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v16, "setWidth:", 128);
      -[BWVideoFormatRequirements setHeight:](v16, "setHeight:", 128);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v16, "setSupportedPixelFormats:", &unk_1E4A01418);
      -[BWVideoFormatRequirements setSupportedCacheModes:](v16, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess](BWVideoFormatRequirements, "cacheModesForOptimizedCPUAccess"));
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v15, "setFormatRequirements:", v16);
      objc_msgSend(*(id *)(v1 + 208), "setMediaConfiguration:forAttachedMediaKey:", v15, 0x1E4947718);
    }
    if (objc_msgSend(*(id *)(v1 + 312), "preLTMThumbnailOnVideoCaptureOutputEnabled"))
    {
      v17 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v17, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForPreLTMThumbnailOutput](v1));
      objc_msgSend(*(id *)(v1 + 208), "setMediaConfiguration:forAttachedMediaKey:", v17, 0x1E494FBD8);
    }
    if (objc_msgSend(*(id *)(v1 + 312), "postColorProcessingThumbnailOnVideoCaptureOutputEnabled"))
    {
      v18 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v18, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForPostColorProcessingThumbnailOutput](v1));
      objc_msgSend(*(id *)(v1 + 208), "setMediaConfiguration:forAttachedMediaKey:", v18, 0x1E495B478);
    }
    *(_QWORD *)(v1 + 10624) = -[BWMultiStreamCameraSourceNode _colorInfoDictionaryForStreamOutputID:]((id *)v1, *(void **)(v1 + 10608));
  }
  else
  {
    objc_msgSend(*(id *)(v1 + 208), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
  }
  v19 = objc_msgSend(*(id *)(v1 + 312), "stillImageOutputEnabled");
  v20 = (uint64_t *)MEMORY[0x1E0D07EE8];
  v90 = v1;
  if ((v19 & 1) != 0 || objc_msgSend(*(id *)(v1 + 312), "forceFirmwareStillImageOutputEnabled"))
  {
    v21 = *(void **)(v1 + 10632);
    if (!v21)
      v21 = *(void **)(v1 + 10608);
    v88 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 120), "objectAtIndexedSubscript:", *(int *)(v1 + 320)), "objectForKeyedSubscript:", *v20), "objectForKeyedSubscript:", v21);
    if ((objc_msgSend(*(id *)(v1 + 312), "usesFirmwareStillImageOutput") & 1) != 0
      || objc_msgSend(*(id *)(v1 + 312), "forceFirmwareStillImageOutputEnabled"))
    {
      v22 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStillImageOutputID:](v1, v21);
    }
    else
    {
      v23 = objc_msgSend(*(id *)(v1 + 312), "videoCaptureOutputEnabled");
      v24 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__stillImageOutput;
      if (v23)
        v24 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureOutput;
      v22 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:]((id *)v1, v21, *(void **)(v1 + *v24));
    }
    v25 = v22;
    v26 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForOutputID:configuration:]((id *)v1, v21, v22);
    if (objc_msgSend(*(id *)(v1 + 312), "usesFirmwareStillImageOutput"))
      -[BWVideoFormatRequirements setSupportedCacheModes:](v26, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
    v114 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BWMultiStreamCameraSourceNode _stillImageColorSpaceProperties](v1));
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v26, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1));
    -[BWVideoFormatRequirements setPrewireBuffers:](v26, "setPrewireBuffers:", 0);
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 216), "primaryMediaConfiguration"), "setFormatRequirements:", v26);
    objc_msgSend(*(id *)(v1 + 216), "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), objc_msgSend(*(id *)(v1 + 216), "name"), v21));
    if (objc_msgSend(*(id *)(v1 + 312), "depthType") - 1 <= 1
      && (objc_msgSend(*(id *)(v1 + 312), "discardsDepthDataForStillImages") & 1) == 0)
    {
      v27 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v27, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForDepthOutput](v1));
      objc_msgSend(*(id *)(v1 + 216), "setMediaConfiguration:forAttachedMediaKey:", v27, CFSTR("Depth"));
    }
    if (objc_msgSend(*(id *)(v1 + 312), "stillImageOutputSensorInterfaceRawAttachmentOptionRetainedBufferCount"))
    {
      v28 = *(unsigned int *)(v1 + 384 + 504 * (int)mscsn_streamOutputIndexForOutputID(v21) + 108);
      if ((_DWORD)v28)
      {
        v29 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v30 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedCacheModes:](v30, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
        -[BWVideoFormatRequirements setWidth:](v30, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "intValue"));
        -[BWVideoFormatRequirements setHeight:](v30, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "intValue"));
        v113 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v28);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v30, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1));
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v29, "setFormatRequirements:", v30);
        -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v29, "setProvidesPixelBufferPool:", 0);
        objc_msgSend(*(id *)(v1 + 216), "setMediaConfiguration:forAttachedMediaKey:", v29, CFSTR("SensorInterfaceRaw"));
      }
    }
    if (objc_msgSend(*(id *)(v1 + 312), "stillImageOutputSashimiRawAttachmentOptionRetainedBufferCount"))
    {
      v31 = *(unsigned int *)(v1 + 384 + 504 * (int)mscsn_streamOutputIndexForOutputID(v21) + 112);
      if ((_DWORD)v31)
      {
        v32 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v33 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedCacheModes:](v33, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
        -[BWVideoFormatRequirements setWidth:](v33, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "intValue"));
        -[BWVideoFormatRequirements setHeight:](v33, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "intValue"));
        v112 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v31);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v33, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1));
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v32, "setFormatRequirements:", v33);
        -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v32, "setProvidesPixelBufferPool:", 0);
        objc_msgSend(*(id *)(v1 + 216), "setMediaConfiguration:forAttachedMediaKey:", v32, 0x1E495AED8);
      }
    }
    if (objc_msgSend(*(id *)(v1 + 312), "stillImageOutputSushiRawAttachmentOptionSupportEnabled"))
    {
      v34 = *(unsigned int *)(v1 + 384 + 504 * (int)mscsn_streamOutputIndexForOutputID(v21) + 116);
      if ((_DWORD)v34)
      {
        v35 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v36 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedCacheModes:](v36, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
        -[BWVideoFormatRequirements setWidth:](v36, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "intValue"));
        -[BWVideoFormatRequirements setHeight:](v36, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "intValue"));
        v111 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v34);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v36, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1));
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v35, "setFormatRequirements:", v36);
        -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v35, "setProvidesPixelBufferPool:", 0);
        objc_msgSend(*(id *)(v1 + 216), "setMediaConfiguration:forAttachedMediaKey:", v35, 0x1E495AEF8);
      }
    }
    if (objc_msgSend(*(id *)(v1 + 312), "stillImageOutputFocusPixelDataAttachmentOptionRetainedBufferCount")&& objc_msgSend((id)objc_msgSend(v88, "objectForKeyedSubscript:", *MEMORY[0x1E0D07C88]), "BOOLValue"))
    {
      v37 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v38 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedCacheModes:](v38, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
      -[BWVideoFormatRequirements setWidth:](v38, "setWidth:", 1);
      -[BWVideoFormatRequirements setHeight:](v38, "setHeight:", 1);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v38, "setSupportedPixelFormats:", &unk_1E4A01430);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v37, "setFormatRequirements:", v38);
      -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v37, "setProvidesPixelBufferPool:", 0);
      objc_msgSend(*(id *)(v1 + 216), "setMediaConfiguration:forAttachedMediaKey:", v37, CFSTR("FocusPixelData"));
    }
    *(_QWORD *)(v1 + 10688) = -[BWMultiStreamCameraSourceNode _colorInfoDictionaryForStreamOutputID:]((id *)v1, v21);
    v20 = (uint64_t *)MEMORY[0x1E0D07EE8];
  }
  else
  {
    objc_msgSend(*(id *)(v1 + 216), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
  }
  if (objc_msgSend(*(id *)(v1 + 312), "sensorRawStillImageOutputEnabled"))
  {
    v39 = *(void **)(v1 + 10696);
    if (!v39)
      return 4294954516;
    v40 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend(*(id *)(v1 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"));
    objc_msgSend(v40, "addObjectsFromArray:", objc_msgSend(*(id *)(v1 + 312), "activeUltraHighResStillImageNondisruptiveSwitchingFormatIndices"));
    objc_msgSend(v40, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v1 + 320)));
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v104;
      v44 = *v20;
LABEL_68:
      v45 = 0;
      while (1)
      {
        if (*(_QWORD *)v104 != v43)
          objc_enumerationMutation(v40);
        if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v90 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * v45), "intValue")), "objectForKeyedSubscript:", v44), "allKeys"), "containsObject:", v39))return 4294954516;
        if (v42 == ++v45)
        {
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
          if (v42)
            goto LABEL_68;
          break;
        }
      }
    }
    v46 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStillImageOutputID:](v90, v39);
    v47 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForOutputID:configuration:]((id *)v90, v39, v46);
    -[BWVideoFormatRequirements setSupportedCacheModes:](v47, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedDisplayAccess](BWVideoFormatRequirements, "cacheModesForOptimizedDisplayAccess"));
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v47, "setSupportedColorSpaceProperties:", 0);
    -[BWVideoFormatRequirements setPrewireBuffers:](v47, "setPrewireBuffers:", 0);
    objc_msgSend((id)objc_msgSend(*(id *)(v90 + 224), "primaryMediaConfiguration"), "setFormatRequirements:", v47);
    objc_msgSend(*(id *)(v90 + 224), "setProvidesPixelBufferPool:", 0);
    v1 = v90;
    objc_msgSend(*(id *)(v90 + 224), "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), objc_msgSend(*(id *)(v90 + 224), "name"), v39));
  }
  else
  {
    objc_msgSend(*(id *)(v1 + 224), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v48 = (void *)objc_msgSend(*(id *)(v1 + 312), "activeUltraHighResStillImageNondisruptiveSwitchingFormatIndices");
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
  if (v49)
  {
    v50 = v49;
    v51 = 0;
    LODWORD(v52) = 0;
    v53 = *(_QWORD *)v100;
    v54 = *MEMORY[0x1E0D07ED0];
    v55 = *MEMORY[0x1E0D07EC8];
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v100 != v53)
          objc_enumerationMutation(v48);
        v57 = (void *)objc_msgSend(*(id *)(v90 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * i), "intValue"));
        v58 = objc_msgSend((id)objc_msgSend(v57, "objectForKeyedSubscript:", v54), "intValue");
        v59 = objc_msgSend((id)objc_msgSend(v57, "objectForKeyedSubscript:", v55), "intValue");
        if ((int)v51 <= v58)
          v51 = v58;
        if ((int)v52 <= v59)
          v52 = v59;
        else
          v52 = v52;
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
    }
    while (v50);
  }
  else
  {
    v51 = 0;
    v52 = 0;
  }
  v60 = v90;
  if (FigCaptureVideoDimensionsAreValid(v51 | (unint64_t)(v52 << 32)))
  {
    *(_DWORD *)(v90 + 10656) = v51;
    *(_DWORD *)(v90 + 10660) = v52;
  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v61 = (void *)objc_msgSend(*(id *)(v90 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices");
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
  if (v62)
  {
    v63 = v62;
    v64 = 0;
    v65 = 0;
    v66 = *(_QWORD *)v96;
    v67 = *MEMORY[0x1E0D07E98];
    v89 = *MEMORY[0x1E0D07ED0];
    v87 = *MEMORY[0x1E0D07EC8];
    do
    {
      for (j = 0; j != v63; ++j)
      {
        if (*(_QWORD *)v96 != v66)
          objc_enumerationMutation(v61);
        v69 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
        v70 = objc_msgSend(v69, "intValue");
        if (v70 != -[BWMultiStreamCameraSourceNode _ultraHighResolutionNondisruptiveStreamingFormatIndex](v90))
        {
          v71 = (void *)objc_msgSend(*(id *)(v90 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(v69, "intValue"));
          v72 = (void *)objc_msgSend(v71, "objectForKeyedSubscript:", v67);
          if (v72)
          {
            if (objc_msgSend(v72, "intValue") == 1)
            {
              v73 = objc_msgSend((id)objc_msgSend(v71, "objectForKeyedSubscript:", v89), "intValue");
              v74 = objc_msgSend((id)objc_msgSend(v71, "objectForKeyedSubscript:", v87), "intValue");
              if ((int)v64 <= v73)
                v64 = v73;
              if ((int)v65 <= v74)
                v65 = v74;
              else
                v65 = v65;
            }
          }
        }
      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
    }
    while (v63);
  }
  else
  {
    v64 = 0;
    v65 = 0;
  }
  if (FigCaptureVideoDimensionsAreValid(v64 | (unint64_t)(v65 << 32)))
  {
    *(_DWORD *)(v90 + 10980) = v64;
    *(_DWORD *)(v90 + 10984) = v65;
  }
  if (objc_msgSend(*(id *)(v90 + 312), "depthOutputEnabled"))
  {
    v75 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForDepthOutput](v90);
    -[BWVideoFormatRequirements setPrewireBuffers:](v75, "setPrewireBuffers:", 0);
  }
  else
  {
    v75 = objc_alloc_init(BWVideoFormatRequirements);
  }
  objc_msgSend(*(id *)(v90 + 248), "setFormatRequirements:", v75);
  if (objc_msgSend(*(id *)(v90 + 312), "pointCloudOutputEnabled"))
    v76 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForPointCloudOutput]((id *)v90);
  else
    v76 = objc_alloc_init(BWPointCloudFormatRequirements);
  objc_msgSend(*(id *)(v90 + 256), "setFormatRequirements:", v76);
  if (objc_msgSend(*(id *)(v90 + 312), "lightSourceMaskOutputEnabled"))
  {
    objc_msgSend(*(id *)(v90 + 264), "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForLightSourceMaskOutput](v90));
    v60 = v90;
    if (!objc_msgSend(*(id *)(v90 + 264), "formatRequirements"))
      return 4294954516;
  }
  if (objc_msgSend(*(id *)(v60 + 312), "keypointDescriptorDataOutputEnabled"))
  {
    objc_msgSend(*(id *)(v90 + 272), "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForKeypointDescriptorDataOutput](v60));
    v60 = v90;
    if (!objc_msgSend(*(id *)(v90 + 272), "formatRequirements"))
      return 4294954516;
  }
  if (objc_msgSend(*(id *)(v60 + 312), "semanticMasksOutputEnabled"))
  {
    v77 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v77, "setWidth:", 1);
    -[BWVideoFormatRequirements setHeight:](v77, "setHeight:", 1);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v77, "setSupportedPixelFormats:", &unk_1E4A01448);
    objc_msgSend(*(id *)(v90 + 280), "setFormatRequirements:", v77);
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v78 = (void *)objc_msgSend(*(id *)(v90 + 312), "enabledSemanticMaskTypes");
    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v92;
LABEL_124:
      v82 = 0;
      while (1)
      {
        if (*(_QWORD *)v92 != v81)
          objc_enumerationMutation(v78);
        v83 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v82);
        v84 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v84, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForSemanticMaskType:](v90, v83));
        if (!-[BWNodeOutputMediaConfiguration formatRequirements](v84, "formatRequirements"))
          return 4294954516;
        -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v84, "setProvidesPixelBufferPool:", 0);
        objc_msgSend(*(id *)(v90 + 280), "setMediaConfiguration:forAttachedMediaKey:", v84, v83);
        if (v80 == ++v82)
        {
          v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
          if (v80)
            goto LABEL_124;
          break;
        }
      }
    }
  }
  if (objc_msgSend(*(id *)(v90 + 312), "preLTMThumbnailOutputEnabled"))
  {
    objc_msgSend(*(id *)(v90 + 304), "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForPreLTMThumbnailOutput](v90));
    if (!objc_msgSend(*(id *)(v90 + 304), "formatRequirements"))
      return 4294954516;
  }
  return 0;
}

- (void)_outputConfigurationForStillImageOutputID:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  unint64_t v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int64x2_t v39;
  float64x2_t v40;
  double v46;
  double v47;
  double v48;
  double v49;
  int v50;
  int v51;
  int v52;
  int64x2_t v53;
  float64x2_t v54;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  int v71;
  uint64_t v72;
  unint64_t v74;
  uint64_t v75;
  int v76;
  void *v77;
  void *v78;
  uint64_t v79;

  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v78 = (void *)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", *(int *)(a1 + 320));
  v5 = objc_msgSend((id)objc_msgSend(v78, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EE8]), "objectForKeyedSubscript:", a2);
  v6 = -[BWMultiStreamCameraSourceNode _totalAvailableOverscan](a1);
  v8 = v7;
  v10 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v11 = v7 == v9 && v6 == *MEMORY[0x1E0C9D820];
  if (!objc_msgSend(*(id *)(a1 + 312), "includeOverscanOnStillImageOutput"))
  {
    v9 = v8;
    v10 = v6;
  }
  v12 = (void *)*MEMORY[0x1E0D07FF8];
  if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FF8]) & 1) == 0
    && (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D08000]) & 1) == 0
    && !objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D08010]))
  {
    objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D08008]);
    return v4;
  }
  v77 = (void *)v5;
  v76 = mscsn_streamOutputIndexForOutputID(a2);
  v13 = objc_msgSend(*(id *)(a1 + 312), "horizontalSensorBinningFactor");
  v14 = objc_msgSend(*(id *)(a1 + 312), "verticalSensorBinningFactor");
  v15 = objc_msgSend(*(id *)(a1 + 312), "fesBinningFactorHorizontal");
  v16 = objc_msgSend(*(id *)(a1 + 312), "cropAspectRatio");
  if ((objc_msgSend(*(id *)(a1 + 312), "cinematicFramingEnabled") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 312), "manualCinematicFramingEnabled"))
  {
    v74 = 0;
    LODWORD(v16) = 0;
  }
  else
  {
    v74 = HIDWORD(v16);
  }
  v75 = objc_msgSend(*(id *)(a1 + 312), "sensorCropDimensions");
  if (objc_msgSend(*(id *)(a1 + 312), "geometricDistortionCorrectionOnStillImageOutputEnabled")
    && FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(a1 + 312), "postGDCCropDimensions")))
  {
    v75 = objc_msgSend(*(id *)(a1 + 312), "postGDCCropDimensions");
  }
  v17 = (float)v13;
  if (objc_msgSend(*(id *)(a1 + 312), "stillImageOutputEnabled"))
  {
    v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "videoFormat"), "pixelFormat");
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 312), "forceFirmwareStillImageOutputEnabled"))
    {
      v19 = 0;
      goto LABEL_23;
    }
    v18 = objc_msgSend((id)objc_msgSend(-[BWMultiStreamCameraSourceNode _supportedPixelFormatsForOutputID:]((id *)a1, a2), "firstObject"), "intValue");
  }
  v19 = v18;
LABEL_23:
  v20 = (float)v15;
  v21 = v17 / (float)v14;
  if (objc_msgSend(a2, "isEqualToString:", v12))
  {
    objc_msgSend(*(id *)(a1 + 312), "sensorCenterOffset");
    v23 = v22;
    v25 = v24;
    v26 = objc_msgSend(*(id *)(a1 + 312), "roundingOfStillImageDimensionsToMultipleOfFourEnabled");
    v27 = objc_msgSend(*(id *)(a1 + 312), "geometricDistortionCorrectionOnStillImageOutputEnabled");
    v28 = a2;
    v29 = v78;
    mscsn_setScalerCropAndOutputDimensionsInConfiguration(v4, v28, v78, v75, v16 | (v74 << 32), 0, v26, 0, v10, v9, v23, v25, v21, (float)v15, v27);
    if (!v11
      && objc_msgSend(*(id *)(a1 + 312), "includeOverscanOnStillImageOutput")
      && (objc_msgSend(*(id *)(a1 + 312), "includeOverscanInStillImageFinalCropRect") & 1) == 0)
    {
      *(double *)(a1 + 10664) = v6;
      *(double *)(a1 + 10672) = v8;
      v30 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "intValue");
      v31 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "intValue");
      *(_DWORD *)(a1 + 10648) = 2 * llroundf((float)(int)((double)v30 / (v6 + 1.0)) * 0.5);
      *(_DWORD *)(a1 + 10652) = 2 * llroundf((float)(int)((double)v31 / (v8 + 1.0)) * 0.5);
    }
  }
  else if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D08000]))
  {
    v32 = objc_msgSend((id)objc_msgSend(v77, "objectForKeyedSubscript:", *MEMORY[0x1E0D08050]), "intValue");
    v33 = objc_msgSend((id)objc_msgSend(v77, "objectForKeyedSubscript:", *MEMORY[0x1E0D08040]), "intValue");
    v29 = v78;
    if (v11 || (objc_msgSend(*(id *)(a1 + 312), "includeOverscanInStillImageFinalCropRect") & 1) != 0)
    {
      *(_DWORD *)(a1 + 10648) = v32;
      *(_DWORD *)(a1 + 10652) = v33;
    }
    else
    {
      v79 = 0;
      objc_msgSend(*(id *)(a1 + 312), "sensorCenterOffset");
      v47 = v46;
      v49 = v48;
      v50 = objc_msgSend(*(id *)(a1 + 312), "roundingOfStillImageDimensionsToMultipleOfFourEnabled");
      v51 = objc_msgSend(*(id *)(a1 + 312), "geometricDistortionCorrectionOnStillImageOutputEnabled");
      v52 = v50;
      v29 = v78;
      mscsn_calculateScalerCropAndOutputDimensions(v12, v78, v75, v16 | (v74 << 32), 0, v52, 0, v51, v6, v8, v47, v49, v21, v20, 0, &v79);
      v53.i64[0] = v32;
      v53.i64[1] = v33;
      v54 = vcvtq_f64_s64(v53);
      v53.i64[0] = (int)v79;
      v53.i64[1] = SHIDWORD(v79);
      __asm { FMOV            V1.2D, #-1.0 }
      *(float64x2_t *)(a1 + 10664) = vaddq_f64(vdivq_f64(v54, vcvtq_f64_s64(v53)), _Q1);
      *(_QWORD *)(a1 + 10648) = v79;
    }
  }
  else if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D08010]))
  {
    v29 = v78;
    if (!*(_BYTE *)(a1 + 160))
    {
      v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 224), "videoFormat"), "pixelFormat");
      if ((objc_msgSend(*(id *)(a1 + 312), "includeOverscanInStillImageFinalCropRect") & 1) == 0)
      {
        v34 = objc_msgSend((id)objc_msgSend(v78, "objectForKeyedSubscript:", *MEMORY[0x1E0D07ED0]), "intValue");
        v35 = objc_msgSend((id)objc_msgSend(v78, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EC8]), "intValue");
        v79 = 0;
        v36 = objc_msgSend(*(id *)(a1 + 312), "roundingOfStillImageDimensionsToMultipleOfFourEnabled");
        v37 = objc_msgSend(*(id *)(a1 + 312), "geometricDistortionCorrectionOnStillImageOutputEnabled");
        v38 = v36;
        v29 = v78;
        mscsn_calculateScalerCropAndOutputDimensions(v12, v78, v75, v16 | (v74 << 32), 0, v38, 0, v37, v6, v8, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v21, v20, 0, &v79);
        v39.i64[0] = v34;
        v39.i64[1] = v35;
        v40 = vcvtq_f64_s64(v39);
        v39.i64[0] = (int)v79;
        v39.i64[1] = SHIDWORD(v79);
        __asm { FMOV            V1.2D, #-1.0 }
        *(float64x2_t *)(a1 + 10704) = vaddq_f64(vdivq_f64(v40, vcvtq_f64_s64(v39)), _Q1);
      }
    }
  }
  else
  {
    v29 = v78;
  }
  v56 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v19);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0D07F58]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D07C68]);
  v57 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 312), "firmwareTimeMachineBufferCapacity"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v57, *MEMORY[0x1E0D07C70]);
  if (objc_msgSend(*(id *)(a1 + 312), "usesFIFOFirmwareTimeMachine"))
    v58 = &unk_1E49FAF98;
  else
    v58 = &unk_1E49FAFE0;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, *MEMORY[0x1E0D07C60]);
  if (objc_msgSend((id)objc_msgSend(v77, "objectForKeyedSubscript:", *MEMORY[0x1E0D07C98]), "intValue"))
  {
    v59 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 10680));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v59, *MEMORY[0x1E0D07C58]);
  }
  v60 = a1 + 384;
  if (objc_msgSend((id)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EA8]), "BOOLValue"))
  {
    if (((objc_msgSend(*(id *)(a1 + 96), "softISPEnabled") & 1) != 0
       || objc_msgSend(*(id *)(a1 + 312), "configureForSoftISPSupport"))
      && (objc_msgSend(*(id *)(a1 + 312), "sensorRawStillImageOutputEnabled") & 1) == 0)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D07C40]);
    }
    v61 = objc_msgSend(*(id *)(a1 + 312), "firmwareTimeMachineSIFREnabled");
    if ((int)objc_msgSend(*(id *)(a1 + 312), "maximumNumberOfBracketedSIFRFrames") < 1)
      v62 = 0;
    else
      v62 = objc_msgSend(*(id *)(a1 + 312), "maximumNumberOfBracketedSIFRFrames");
    v63 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v61);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v63, *MEMORY[0x1E0D07C78]);
    v64 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v62);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v64, *MEMORY[0x1E0D07C38]);
  }
  v65 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 96), "redEyeReductionEnabled"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v65, *MEMORY[0x1E0D07C48]);
  if (*(_DWORD *)(v60 + 504 * v76 + 108))
  {
    v66 = objc_msgSend(*(id *)(a1 + 312), "stillImageOutputSensorInterfaceRawAttachmentOptionRetainedBufferCount");
    v67 = *MEMORY[0x1E0D07EF8];
    if ((objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EF8]), "BOOLValue") & 1) == 0)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v66 != 0), v67);
  }
  if (*(_DWORD *)(v60 + 504 * v76 + 112))
  {
    v68 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 312), "stillImageOutputSashimiRawAttachmentOptionRetainedBufferCount"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v68, *MEMORY[0x1E0D07C50]);
  }
  if (objc_msgSend((id)objc_msgSend(v77, "objectForKeyedSubscript:", *MEMORY[0x1E0D07C88]), "BOOLValue"))
  {
    v69 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 312), "stillImageOutputFocusPixelDataAttachmentOptionRetainedBufferCount"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v69, *MEMORY[0x1E0D07C30]);
  }
  v70 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "stream"), "supportedProperties");
  if (objc_msgSend(v70, "objectForKeyedSubscript:", *MEMORY[0x1E0D078E0]) && !*(_BYTE *)(a1 + 160))
  {
    v71 = -[BWMultiStreamCameraSourceNode _stillImageColorSpaceProperties](a1);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", BWColorSpacePropertiesGetYCbCrMatrix(v71), *MEMORY[0x1E0D07C80]);
  }
  if (objc_msgSend((id)objc_msgSend(v77, "objectForKeyedSubscript:", *MEMORY[0x1E0D08088]), "BOOLValue"))
  {
    v72 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "geometricDistortionCorrectionOnStillImageOutputEnabled"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v72, *MEMORY[0x1E0D08078]);
  }
  return v4;
}

- (id)_colorInfoDictionaryForStreamOutputID:(id *)result
{
  id *v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    v4 = -[BWMultiStreamCameraSourceNode _colorSpacePropertiesForOuputID:]((uint64_t)result, a2);
    if ((_DWORD)v4)
      return (id *)+[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", v4);
    else
      return -[BWMultiStreamCameraSourceNode colorInfoForNonColorManagedDevicesForOutputID:](v3, a2);
  }
  return result;
}

- (uint64_t)_updateVideoCaptureOutputFlags
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 312), "stillImageOutputEnabled");
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(v1 + 312), "usesFirmwareStillImageOutput");
      if ((result & 1) == 0)
      {
        result = mscsn_streamOutputIndexForOutputID(*(void **)(v1 + 10608));
        *(_DWORD *)(v1 + 384 + 504 * result + 4) |= 1u;
      }
    }
  }
  return result;
}

- (uint64_t)_updateOutputsStorage
{
  double v2;
  double v3;
  double v4;
  double v5;
  _BOOL4 v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _DWORD *v17;
  _DWORD *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  int v26;
  int v27;
  void *v28;
  uint64_t v29;
  int *v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 312), "visOverscan");
  v4 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v5 == *MEMORY[0x1E0C9D820] && v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
    v7 = v8 != v4;
    if (v9 != v3)
      v7 = 1;
  }
  else
  {
    v7 = 1;
  }
  v38 = v7;
  v44 = (void *)objc_msgSend(*(id *)(a1 + 112), "getProperty:error:", *MEMORY[0x1E0D07888], 0);
  v10 = (void *)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", *(int *)(a1 + 320));
  v11 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EE8]);
  v12 = *MEMORY[0x1E0D07FD0];
  v39 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FD0]);
  v13 = 0;
  v43 = *MEMORY[0x1E0D07F08];
  v41 = *MEMORY[0x1E0D07C90];
  v42 = *MEMORY[0x1E0D07F18];
  v40 = *MEMORY[0x1E0D07C98];
  v14 = -10080;
  v15 = 9;
  v46 = *MEMORY[0x1E0CA2E18];
  v45 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  do
  {
    v16 = (void *)mscsn_streamOutputIDForOutputIndex(v13);
    v47 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", v16);
    *(_BYTE *)(a1 + 384 + v15) = 0;
    *(_QWORD *)(a1 + v14 + 10480) = 0;
    *(_QWORD *)(a1 + v14 + 10464) = 0;
    *(_OWORD *)(a1 + v14 + 10520) = v46;
    *(_QWORD *)(a1 + v14 + 10536) = v45;
    if ((objc_msgSend(v16, "isEqualToString:", v12) & 1) == 0)
    {
      v17 = (_DWORD *)(a1 + v14 + 384);
      v17[2545] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "objectForKeyedSubscript:", v16), "objectForKeyedSubscript:", v43), "intValue");
      v17[2546] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "objectForKeyedSubscript:", v16), "objectForKeyedSubscript:", v42), "intValue");
      v17[2547] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "captureStream"), "sensorInterfaceRawPixelFormat");
      v17[2548] = objc_msgSend((id)objc_msgSend(v47, "objectForKeyedSubscript:", v41), "intValue");
      v17[2549] = objc_msgSend((id)objc_msgSend(v47, "objectForKeyedSubscript:", v40), "intValue");
    }
    v18 = (_DWORD *)(a1 + v14 + 384);
    v18[2560] = 1065353216;
    v18[2643] = -1;
    v18[2644] = 0;
    ++v13;
    v15 += 504;
    v14 += 504;
  }
  while (v14);
  if (*(_QWORD *)(a1 + 10608))
  {
    v52 = 0;
    -[BWMultiStreamCameraSourceNode _shouldEnableStreamCaptureOutputForNodeOutput:](a1, &v52);
    -[BWMultiStreamCameraSourceNode _updateStreamingOutputStorageForOutputID:isVideoCaptureOutput:nodeOutput:](a1, *(void **)(a1 + 10608), 1, v52);
  }
  v19 = *(void **)(a1 + 10576);
  if (v19)
    -[BWMultiStreamCameraSourceNode _updateStreamingOutputStorageForOutputID:isVideoCaptureOutput:nodeOutput:](a1, v19, 0, *(_QWORD *)(a1 + 200));
  v20 = *(void **)(a1 + 10632);
  if (v20)
  {
    v21 = a1 + 384;
    v22 = mscsn_streamOutputIndexForOutputID(v20);
    v23 = a1 + 384 + 504 * v22;
    *(_BYTE *)(v23 + 9) = 1;
    if (objc_msgSend(*(id *)(a1 + 312), "stillImageOutputEnabled"))
      *(_QWORD *)(v21 + 504 * v22 + 16) = *(_QWORD *)(a1 + 216);
    *(_DWORD *)v23 = 2;
    v24 = v21 + 504 * v22;
    v26 = *(_DWORD *)(v24 + 4);
    v25 = (int *)(v24 + 4);
    v27 = v26 | 1;
    *v25 = v26 | 1;
    if (v38)
    {
      if (v22 != 4)
      {
        if (!objc_msgSend(*(id *)(a1 + 312), "includeOverscanOnStillImageOutput"))
          goto LABEL_25;
        v27 = *v25;
      }
      *v25 = v27 | 8;
    }
  }
LABEL_25:
  v28 = *(void **)(a1 + 10696);
  if (v28)
  {
    if (!*(_BYTE *)(a1 + 160))
    {
      v29 = a1 + 384 + 504 * (int)mscsn_streamOutputIndexForOutputID(v28);
      *(_BYTE *)(v29 + 9) = 1;
      *(_QWORD *)(v29 + 16) = *(_QWORD *)(a1 + 224);
      *(_DWORD *)v29 = 2;
      v31 = *(_DWORD *)(v29 + 4);
      v30 = (int *)(v29 + 4);
      *v30 = v31 | 1;
      if ((objc_msgSend(*(id *)(a1 + 312), "includeOverscanInStillImageFinalCropRect") & 1) == 0)
        *v30 |= 8u;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 312), "depthOutputEnabled"))
  {
    *(_BYTE *)(a1 + 3417) = 1;
    *(_QWORD *)(a1 + 3424) = *(_QWORD *)(a1 + 248);
    *(_DWORD *)(a1 + 3408) = 1;
  }
  if (objc_msgSend(*(id *)(a1 + 312), "pointCloudOutputEnabled"))
  {
    *(_BYTE *)(a1 + 3921) = 1;
    *(_QWORD *)(a1 + 3928) = *(_QWORD *)(a1 + 256);
    *(_DWORD *)(a1 + 3912) = 1;
  }
  if (objc_msgSend(*(id *)(a1 + 312), "lightSourceMaskOutputEnabled"))
  {
    if (!objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0D06738]))
      goto LABEL_55;
    *(_BYTE *)(a1 + 4929) = 1;
    *(_QWORD *)(a1 + 4936) = *(_QWORD *)(a1 + 264);
    *(_DWORD *)(a1 + 4920) = 1;
  }
  if (objc_msgSend(*(id *)(a1 + 312), "keypointDescriptorDataOutputEnabled"))
  {
    if (!objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0D06730]))
      goto LABEL_55;
    *(_BYTE *)(a1 + 5433) = 1;
    *(_QWORD *)(a1 + 5440) = *(_QWORD *)(a1 + 272);
    *(_DWORD *)(a1 + 5424) = 1;
  }
  if (objc_msgSend(*(id *)(a1 + 312), "semanticMasksOutputEnabled"))
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v32 = (void *)objc_msgSend(*(id *)(a1 + 312), "enabledSemanticMaskTypes");
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v49;
LABEL_42:
      v36 = 0;
      while (1)
      {
        if (*(_QWORD *)v49 != v35)
          objc_enumerationMutation(v32);
        if (!objc_msgSend(v39, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v36)))
          goto LABEL_55;
        if (v34 == ++v36)
        {
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
          if (v34)
            goto LABEL_42;
          break;
        }
      }
    }
    *(_BYTE *)(a1 + 5937) = 1;
    *(_QWORD *)(a1 + 5944) = *(_QWORD *)(a1 + 280);
    *(_DWORD *)(a1 + 5928) = 1;
  }
  if (objc_msgSend(*(id *)(a1 + 312), "secureMetadataOutputConfiguration"))
    -[BWMultiStreamCameraSourceNode _updateOutputStorageWithSecureMetadataOutputConfiguration:propagateToNodeOutputs:](a1, (void *)objc_msgSend(*(id *)(a1 + 312), "secureMetadataOutputConfiguration"), 0);
  if (objc_msgSend(*(id *)(a1 + 312), "preLTMThumbnailOutputEnabled"))
  {
    if (objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0D06748]))
    {
      *(_BYTE *)(a1 + 9465) = 1;
      *(_QWORD *)(a1 + 9472) = *(_QWORD *)(a1 + 304);
      *(_DWORD *)(a1 + 9456) = 1;
      return 0;
    }
LABEL_55:
    FigDebugAssert3();
  }
  return 0;
}

- (uint64_t)_updateOutputIDs
{
  uint64_t updated;

  if (!a1)
    return 0;
  updated = -[BWMultiStreamCameraSourceNode _updateOutputIDMappingsForStreamingOutputs](a1);
  if ((_DWORD)updated)
    FigDebugAssert3();
  else
    -[BWMultiStreamCameraSourceNode _updateOutputIDMappingsForOnDemandStills](a1);
  return updated;
}

- (uint64_t)_updateOutputIDMappingsForOnDemandStills
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    if ((-[BWMultiStreamCameraSourceNode _shouldEnableStillImageOutput](result) & 1) != 0
      || (result = objc_msgSend(*(id *)(v1 + 312), "sensorRawStillImageOutputEnabled"), (_DWORD)result))
    {
      v2 = (uint64_t *)MEMORY[0x1E0D08010];
      v3 = (uint64_t *)MEMORY[0x1E0D08010];
      if (!*(_BYTE *)(v1 + 160))
      {
        if (objc_msgSend(*(id *)(v1 + 312), "primaryScalerDecoupled") && !*(_BYTE *)(v1 + 128))
          v3 = (uint64_t *)MEMORY[0x1E0D08000];
        else
          v3 = (uint64_t *)MEMORY[0x1E0D07FF8];
      }
      v4 = *v3;
      result = objc_msgSend(*(id *)(v1 + 312), "sensorRawStillImageOutputEnabled");
      if ((_DWORD)result)
      {
        if (*(_BYTE *)(v1 + 160))
          v5 = 0;
        else
          v5 = *v2;
        goto LABEL_15;
      }
    }
    else
    {
      v4 = 0;
    }
    v5 = 0;
LABEL_15:
    *(_QWORD *)(v1 + 10632) = v4;
    *(_QWORD *)(v1 + 10696) = v5;
  }
  return result;
}

- (uint64_t)_updateStreamingOutputStorageForOutputID:(int)a3 isVideoCaptureOutput:(uint64_t)a4 nodeOutput:
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  CGRect *v19;
  float v20;
  CGRect v21;

  if (!result)
    return result;
  v7 = result;
  v8 = mscsn_streamOutputIndexForOutputID(a2);
  v9 = v7 + 384 + 504 * v8;
  result = objc_msgSend(*(id *)(v7 + 312), "visOverscan");
  v11 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  *(_BYTE *)(v9 + 9) = 1;
  *(_QWORD *)(v9 + 16) = a4;
  *(_DWORD *)v9 = 1;
  if (v13 == v11 && v10 == v12)
    return result;
  v15 = (void *)objc_msgSend(*(id *)(v7 + 120), "objectAtIndexedSubscript:", *(int *)(v7 + 320));
  v16 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EE8]);
  result = objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FE8]);
  if ((result & 1) == 0)
  {
    v18 = *MEMORY[0x1E0D07FC8];
    if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FC8]))
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", v18);
      v19 = (CGRect *)MEMORY[0x1E0C9D628];
      v21.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v21.size = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      FigCFDictionaryGetCGRectIfPresent();
      result = CGRectEqualToRect(v21, *v19);
      if ((a3 & 1) != 0)
      {
        v17 = result ^ 1;
        goto LABEL_14;
      }
      if ((result & 1) != 0)
      {
LABEL_20:
        *(_DWORD *)(v7 + 384 + 504 * v8 + 4) |= 8u;
        return result;
      }
    }
    else if ((a3 & 1) != 0)
    {
      v17 = 1;
      goto LABEL_14;
    }
    result = objc_msgSend(*(id *)(v7 + 312), "overscanForShiftMitigation", *(_OWORD *)&v21.origin, *(_OWORD *)&v21.size);
    if (v20 != 0.0)
      goto LABEL_20;
    result = objc_msgSend(*(id *)(v7 + 312), "includeOverscanOnPreviewOutput");
    if ((_DWORD)result)
      goto LABEL_20;
    return result;
  }
  if (!a3)
    goto LABEL_20;
  v17 = 0;
LABEL_14:
  result = objc_msgSend(*(id *)(v7 + 312), "videoStabilizationEnabled", *(_OWORD *)&v21.origin, *(_OWORD *)&v21.size);
  if (!(_DWORD)result || (v17 & 1) == 0)
    goto LABEL_20;
  return result;
}

- (BWVideoFormatRequirements)_videoFormatRequirementsForDepthOutput
{
  BWVideoFormatRequirements *v2;
  void *v3;
  void *v4;
  int v5;

  if (!a1)
    return 0;
  v2 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWMultiStreamCameraSourceNode _updateDepthConfiguration](a1);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 112), "getProperty:error:", *MEMORY[0x1E0D07490], 0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 344));
    v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06428]), "intValue");
    LODWORD(v4) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06420]), "intValue");
    -[BWVideoFormatRequirements setWidth:](v2, "setWidth:", v5);
    -[BWVideoFormatRequirements setHeight:](v2, "setHeight:", (int)v4);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v2, "setSupportedPixelFormats:", *(_QWORD *)(a1 + 360));
    -[BWVideoFormatRequirements setSupportedCacheModes:](v2, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess](BWVideoFormatRequirements, "cacheModesForOptimizedCPUAccess"));
  }
  else
  {
    FigDebugAssert3();
  }
  return v2;
}

- (void)_outputConfigurationForStreamingOutputID:(void *)a3 nodeOutput:(double)a4 visOverscan:(double)a5
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CGRect *v14;
  _BOOL4 v15;
  unint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  unint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  double v37;
  double v38;
  uint64_t v39;
  _BOOL4 v40;
  int v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  float v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  unsigned int v56;
  uint64_t v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  int v61;
  int v62;
  unsigned int v63;
  unint64_t v64;
  uint64_t v65;
  void *v66;
  _BOOL4 v67;
  CGRect v68;

  if (!a1)
    return 0;
  if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FD0]))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    return 0;
  }
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v66 = (void *)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", *(int *)(a1 + 320));
  v11 = (void *)objc_msgSend(v66, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EE8]);
  v12 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", a2);
  if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FE8]) & 1) != 0)
  {
    v67 = 0;
  }
  else
  {
    v13 = *MEMORY[0x1E0D07FC8];
    if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FC8]))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v13);
      v14 = (CGRect *)MEMORY[0x1E0C9D628];
      v68 = *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D628];
      FigCFDictionaryGetCGRectIfPresent();
      v15 = !CGRectEqualToRect(v68, *v14);
    }
    else
    {
      v15 = 1;
    }
    v67 = v15;
  }
  v16 = objc_msgSend(*(id *)(a1 + 312), "cropAspectRatio");
  v62 = objc_msgSend(*(id *)(a1 + 312), "horizontalSensorBinningFactor");
  v61 = objc_msgSend(*(id *)(a1 + 312), "verticalSensorBinningFactor");
  v60 = objc_msgSend(*(id *)(a1 + 312), "fesBinningFactorHorizontal");
  v17 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
  if (*(void **)(a1 + 200) == a3
    && (objc_msgSend(*(id *)(a1 + 312), "geometricDistortionCorrectionOnPreviewOutputEnabled") & 1) != 0)
  {
    v18 = 1;
  }
  else if (*(void **)(a1 + 208) == a3)
  {
    v18 = objc_msgSend(*(id *)(a1 + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled");
  }
  else
  {
    v18 = 0;
  }
  v64 = HIDWORD(v16);
  v65 = objc_msgSend(*(id *)(a1 + 312), "sensorCropDimensions");
  if (FigCaptureVideoDimensionsAreValid(v65))
  {
    if ((int)objc_msgSend((id)objc_msgSend(v66, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E80]), "intValue") >= 1)
    {
      v17 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
      if ((int)objc_msgSend((id)objc_msgSend(v66, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E78]), "intValue") < 1)
        goto LABEL_24;
      v19 = objc_msgSend(*(id *)(a1 + 312), "cropDimensionsWhenFESIsEnabled");
      goto LABEL_22;
    }
    v17 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
  }
  else if ((_DWORD)v18 && FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(a1 + 312), "postGDCCropDimensions")))
  {
    v19 = objc_msgSend(*(id *)(a1 + 312), "postGDCCropDimensions");
LABEL_22:
    v65 = v19;
  }
LABEL_24:
  if (*(void **)(a1 + 200) == a3)
  {
    objc_msgSend(*(id *)(a1 + 312), "maxFrameRate");
    if (v20 <= (float)(int)objc_msgSend(*(id *)(a1 + 312), "preferredPreviewMaxFrameRate"))
      v56 = 0;
    else
      v56 = objc_msgSend(*(id *)(a1 + 312), "preferredPreviewMaxFrameRate");
    v59 = objc_msgSend(*(id *)(a1 + 312), "faceTrackingEnabled");
    v58 = objc_msgSend(*(id *)(a1 + 312), "streamingForegroundSegmentationEnabled");
    v21 = -[BWMultiStreamCameraSourceNode _calculatePreviewDimensionsForShiftMitigation](a1);
    if (v67 && !objc_msgSend(*(id *)(a1 + 312), "includeOverscanOnPreviewOutput"))
    {
      objc_msgSend(*(id *)(a1 + 312), "overscanForShiftMitigation");
      if (v50 <= 0.0)
      {
        v22 = -[BWMultiStreamCameraSourceNode _totalAvailableOverscan](a1);
        v23 = v55;
        v57 = 0;
        v63 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
        v22 = v51;
        objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
        v23 = v52;
        v53 = -[BWMultiStreamCameraSourceNode _overscanWithFOVSacrifice](a1);
        v57 = 0;
        v63 = 0;
        if (v53 >= v54)
          v53 = v54;
        *(double *)(a1 + 10584) = v53;
        *(double *)(a1 + 10592) = v53;
      }
    }
    else
    {
      v22 = *MEMORY[0x1E0C9D820];
      v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v57 = 0;
      v63 = 0;
      *(double *)(a1 + 10584) = -[BWMultiStreamCameraSourceNode _totalAvailableOverscan](a1);
      *(_QWORD *)(a1 + 10592) = v24;
    }
  }
  else
  {
    if (*(void **)(a1 + v17[956]) == a3)
    {
      if (objc_msgSend(*(id *)(a1 + 96), "portraitAutoSuggestEnabled"))
        v59 = objc_msgSend(*(id *)(a1 + 312), "faceTrackingEnabled");
      else
        v59 = 0;
      v63 = objc_msgSend(*(id *)(a1 + 312), "videoStabilizationEnabled");
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 312), "videoStabilizationMethods"), "count") && !v63
        || (objc_msgSend(*(id *)(a1 + 312), "cinematicFramingEnabled") & 1) != 0
        || (objc_msgSend(*(id *)(a1 + 312), "deskCamEnabled") & 1) != 0
        || objc_msgSend(*(id *)(a1 + 312), "manualCinematicFramingEnabled"))
      {
        LODWORD(v64) = 0;
        LODWORD(v16) = 0;
      }
    }
    else
    {
      v59 = 0;
      v63 = 0;
    }
    v21 = -[BWMultiStreamCameraSourceNode _calculateVideoCaptureDimensionsWithVISOverscan:](a1, a4, a5);
    v57 = objc_msgSend(*(id *)(a1 + 312), "visionDataConfiguration");
    objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
    v26 = a4 + 1.0;
    v27 = (v25 + 1.0) / (a4 + 1.0) + -1.0;
    v23 = 0.0;
    v22 = 0.0;
    if (v27 >= 0.0)
    {
      objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
      v22 = (v28 + 1.0) / v26 + -1.0;
    }
    objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
    v30 = a5 + 1.0;
    if ((v29 + 1.0) / v30 + -1.0 >= 0.0)
    {
      objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
      v58 = 0;
      v56 = 0;
      v23 = (v31 + 1.0) / v30 + -1.0;
    }
    else
    {
      v58 = 0;
      v56 = 0;
    }
  }
  v32 = objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "pixelFormat");
  if (!a3)
  {
    if ((*(_BYTE *)(a1 + 384 + 504 * (int)mscsn_streamOutputIndexForOutputID(a2) + 4) & 3) != 0)
    {
      v32 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "videoFormat"), "pixelFormat");
    }
    else
    {
      v33 = -[BWMultiStreamCameraSourceNode _supportedPixelFormatsForOutputID:]((id *)a1, a2);
      v32 = FigCapturePixelFormatWithLeastAverageBandwidth(v33);
    }
  }
  v34 = v32;
  if (v67)
  {
    if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FC8])
      && ((v35 = FigCapturePlatformIdentifier(), v35 < 8)
       || v35 == 8 && (int)FigCapturePlatformChipRevisionIdentifier() <= 15))
    {
      v36 = FigCapturePixelFormatTileAlignment(v34);
    }
    else
    {
      v36 = 0;
    }
    objc_msgSend(*(id *)(a1 + 312), "sensorCenterOffset");
    mscsn_setScalerCropAndOutputDimensionsInConfiguration(v10, a2, v66, v65, v16 | ((unint64_t)v64 << 32), v21, objc_msgSend(*(id *)(a1 + 312), "roundingOfStillImageDimensionsToMultipleOfFourEnabled"), v36, v22, v23, v37, v38, (float)v62 / (float)v61, (float)v60, v18);
  }
  v39 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v34);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0D07F58]);
  if (objc_msgSend(*(id *)(a1 + 312), "primaryScalerDecoupled"))
    v40 = *(_BYTE *)(a1 + 128) == 0;
  else
    v40 = 0;
  v41 = FigCapturePlatformIdentifier();
  v42 = (_QWORD *)MEMORY[0x1E0D07FF0];
  if (v41 >= 7)
  {
    if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FF0]) & 1) == 0)
      goto LABEL_67;
    goto LABEL_66;
  }
  if (((v40 | objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FC8]) ^ 1) & 1) == 0)
  {
LABEL_66:
    v43 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v56);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v43, *MEMORY[0x1E0D07F48]);
  }
LABEL_67:
  if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FE0]))
  {
    v44 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v63);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0D08080]);
  }
  if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D08088]), "BOOLValue"))
  {
    v45 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v45, *MEMORY[0x1E0D08078]);
  }
  if (objc_msgSend(a2, "isEqualToString:", *v42) && (int)FigCapturePlatformIdentifier() >= 7)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BWMultiStreamCameraSourceNode _scalerChainingEnabled](a1)), *MEMORY[0x1E0D07F70]);
  if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D08020]), "BOOLValue"))
  {
    v46 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v59);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v46, *MEMORY[0x1E0D07F30]);
  }
  if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D08070]), "BOOLValue"))
  {
    if (v57)
      v47 = v57;
    else
      v47 = MEMORY[0x1E0C9AA70];
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v47, *MEMORY[0x1E0D07F80]);
  }
  if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D08060]), "BOOLValue"))
  {
    v48 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v58);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v48, *MEMORY[0x1E0D07F78]);
  }
  return v10;
}

- (BWMultiStreamCameraSourceNodeConfiguration)configuration
{
  return self->_configuration;
}

- (void)_addCaptureStreamAttachmentsToSampleBuffer:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  CGPoint v7;
  CGFloat y;
  CFDictionaryRef DictionaryRepresentation;
  float64x2_t v10;

  if (a1)
  {
    v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 184), *MEMORY[0x1E0D06D00]);
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 192));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D069B8]);
    if (*(_BYTE *)(a1 + 10882))
    {
      v5 = *MEMORY[0x1E0D06CE0];
      v6 = (const __CFDictionary *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CE0]);
      if (v6)
      {
        v10 = *(float64x2_t *)MEMORY[0x1E0C9D538];
        CGPointMakeWithDictionaryRepresentation(v6, (CGPoint *)&v10);
        v7 = (CGPoint)vaddq_f64(*(float64x2_t *)(a1 + 10888), v10);
        v10 = (float64x2_t)v7;
        y = v7.y;
        DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v7);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", DictionaryRepresentation, v5);

      }
    }
  }
}

- (uint64_t)_prependPreservedMotionDataToSampleBuffer:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 312), "reflectsStillsOnStreamingOutputs");
    if ((_DWORD)result)
    {
      if (!objc_msgSend(*(id *)(v3 + 104), "synchronizedStreamsEnabled"))
        return objc_msgSend(*(id *)(v3 + 10528), "prependPreservedMotionDataToSampleBuffer:", a2);
      result = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue");
      if ((_DWORD)result)
        return objc_msgSend(*(id *)(v3 + 10528), "prependPreservedMotionDataToSampleBuffer:", a2);
    }
  }
  return result;
}

- (void)_addDolbyVisionMetadataToPreviewPixelBufferForSampleBuffer:(uint64_t)a3 nodeOutput:
{
  void *v6;
  __CVBuffer *ImageBuffer;
  float v8;
  int DataFromStatisticsDictionary;
  CFTypeRef v10;
  CMTime v11;
  CMTime lhs;
  CMTime rhs;
  CMTime v14;
  CMTime v15;
  CFTypeRef v16;

  if (a1)
  {
    v16 = 0;
    if (*(_QWORD *)(a1 + 10928))
    {
      if (*(_QWORD *)(a1 + 208) == a3
        && (objc_msgSend(*(id *)(a1 + 312), "dolbyVisionMetadataOnVideoCaptureOutputEnabled") & 1) != 0
        || *(_QWORD *)(a1 + 200) == a3
        && objc_msgSend(*(id *)(a1 + 312), "dolbyVisionMetadataOnPreviewOutputEnabled"))
      {
        v6 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
        objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06978]), "floatValue");
        if (v8 != (float)*(unsigned int *)(a1 + 10920))
        {
          *(_DWORD *)(a1 + 10920) = v8;
          VTHDRMetadataGenerationSessionSetFramesPerSecond();
        }
        memset(&v15, 0, sizeof(v15));
        CMSampleBufferGetPresentationTimeStamp(&v15, (CMSampleBufferRef)a2);
        memset(&v14, 0, sizeof(v14));
        CMTimeMake(&rhs, 4, *(_DWORD *)(a1 + 10920));
        lhs = *(CMTime *)(a1 + 10936);
        CMTimeAdd(&v14, &lhs, &rhs);
        if ((v14.flags & 1) != 0)
        {
          lhs = v15;
          v11 = v14;
          CMTimeCompare(&lhs, &v11);
        }
        *(CMTime *)(a1 + 10936) = v15;
        -[BWMultiStreamCameraSourceNode _HDRImageStatisticsDictFromMetadata:](a1, v6);
        CVPixelBufferGetWidth(ImageBuffer);
        CVPixelBufferGetHeight(ImageBuffer);
        DataFromStatisticsDictionary = VTHDRMetadataGenerationSessionCreateDataFromStatisticsDictionary();
        v10 = v16;
        if (!DataFromStatisticsDictionary && v16)
        {
          CVBufferSetAttachment(ImageBuffer, (CFStringRef)*MEMORY[0x1E0CA8DC0], v16, kCVAttachmentMode_ShouldPropagate);
          v10 = v16;
        }
        if (v10)
          CFRelease(v10);
      }
    }
  }
}

- (BWStats)_tallyCompressedIOSurfaceStatsForRawForSBuf:(BWStats *)result
{
  BWStats *v2;
  void *v3;
  unsigned int v4;
  unsigned int v5;
  float v6;
  __int128 v8;
  __int128 v9;

  if (result)
  {
    v2 = result;
    v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    result = (BWStats *)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D28]), "intValue");
    if ((_DWORD)result)
    {
      v4 = result;
      v8 = *MEMORY[0x1E0C9D648];
      v9 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      FigCFDictionaryGetCGRectIfPresent();
      result = (BWStats *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D88], v8);
      v5 = (*((double *)&v9 + 1)
                        * (double)(llroundf((float)(int)*(double *)&v9 * 0.0078125) << 7)
                        * 10.0
                        * 0.125) << (result != 0);
      v6 = (float)v4 / (float)v5;
      if (!v2[112]._nextDataPointIndex)
      {
        result = objc_alloc_init(BWStats);
        v2[112]._nextDataPointIndex = (int64_t)result;
        v2[113].super.isa = 0;
        v2[113]._multiplier = 0.0;
        LODWORD(v2[113]._unitDesignator) = *((double *)&v9 + 1);
      }
      if (v6 > 0.0 && v6 <= 1.0)
      {
        result = (BWStats *)objc_msgSend((id)v2[112]._nextDataPointIndex, "addDataPoint:", v6);
        v2[113].super.isa = (Class)((char *)v2[113].super.isa + v4);
        *(_QWORD *)&v2[113]._multiplier += v5;
      }
    }
    else
    {
      BYTE4(v2[113]._unitDesignator) = 0;
    }
  }
  return result;
}

- (void)_addMetadataUsedByVideoEncoderToPixelBufferForSampleBuffer:(uint64_t)a3 nodeOutput:
{
  __CVBuffer *ImageBuffer;
  int *v7;

  if (a1)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
    if (*(_QWORD *)(a1 + 208) == a3
      && (objc_msgSend(*(id *)(a1 + 312), "videoEncoderMetadataOnVideoCaptureOutputEnabled") & 1) != 0)
    {
      v7 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureOutputColorInfo;
LABEL_8:
      FigCaptureMetadataUtilitiesAddSampleBufferMetadataUsedByVideoEncoderToPixelBuffer(sbuf);
      CVBufferSetAttachments(ImageBuffer, *(CFDictionaryRef *)(a1 + *v7), kCVAttachmentMode_ShouldPropagate);
      return;
    }
    if (*(_QWORD *)(a1 + 200) == a3
      && objc_msgSend(*(id *)(a1 + 312), "videoEncoderMetadataOnPreviewOutputEnabled"))
    {
      v7 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__previewOutputColorInfo;
      goto LABEL_8;
    }
  }
}

- (void)_registerStreamOutputHandlers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[6];

  if (a1)
  {
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3052000000;
    v35[3] = __Block_byref_object_copy__30;
    v35[4] = __Block_byref_object_dispose__30;
    v35[5] = a1;
    v2 = *(void **)(a1 + 112);
    v3 = MEMORY[0x1E0C809B0];
    v4 = *MEMORY[0x1E0D07FE0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke;
    v34[3] = &unk_1E49242C8;
    v34[4] = v35;
    mscsn_setStreamOutputBufferHandler(v2, v4, v34, 0);
    v5 = *(void **)(a1 + 112);
    v6 = *MEMORY[0x1E0D07FF0];
    v33[0] = v3;
    v33[1] = 3221225472;
    v33[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_2;
    v33[3] = &unk_1E49242C8;
    v33[4] = v35;
    mscsn_setStreamOutputBufferHandler(v5, v6, v33, 0);
    *(_BYTE *)(a1 + 10976) = 1;
    v7 = *(void **)(a1 + 112);
    v8 = *MEMORY[0x1E0D07FC8];
    v32[0] = v3;
    v32[1] = 3221225472;
    v32[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_3;
    v32[3] = &unk_1E49242C8;
    v32[4] = v35;
    mscsn_setStreamOutputBufferHandler(v7, v8, v32, 0);
    v9 = *(void **)(a1 + 112);
    v10 = *MEMORY[0x1E0D07FE8];
    v31[0] = v3;
    v31[1] = 3221225472;
    v31[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_4;
    v31[3] = &unk_1E49242C8;
    v31[4] = v35;
    mscsn_setStreamOutputBufferHandler(v9, v10, v31, 0);
    v11 = *(void **)(a1 + 112);
    v12 = *MEMORY[0x1E0D07FF8];
    v30[0] = v3;
    v30[1] = 3221225472;
    v30[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_5;
    v30[3] = &unk_1E49242C8;
    v30[4] = v35;
    mscsn_setStreamOutputBufferHandler(v11, v12, v30, 0);
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "getPropertyIfSupported:error:", CFSTR("CompressedStillImageCaptureSupported"), 0), "BOOLValue"))
    {
      v13 = *(void **)(a1 + 112);
      v29[0] = v3;
      v29[1] = 3221225472;
      v29[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_6;
      v29[3] = &unk_1E49242F0;
      v29[4] = v35;
      mscsn_setStreamOutputBlockBufferHandler(v13, v12, v29);
    }
    v14 = *(void **)(a1 + 112);
    v15 = *MEMORY[0x1E0D08000];
    v28[0] = v3;
    v28[1] = 3221225472;
    v28[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_7;
    v28[3] = &unk_1E49242C8;
    v28[4] = v35;
    mscsn_setStreamOutputBufferHandler(v14, v15, v28, 0);
    v16 = *(void **)(a1 + 112);
    v17 = *MEMORY[0x1E0D08010];
    v27[0] = v3;
    v27[1] = 3221225472;
    v27[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_8;
    v27[3] = &unk_1E49242C8;
    v27[4] = v35;
    mscsn_setStreamOutputBufferHandler(v16, v17, v27, 0);
    v18 = *(void **)(a1 + 112);
    v19 = *MEMORY[0x1E0D07FC0];
    v26[0] = v3;
    v26[1] = 3221225472;
    v26[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_9;
    v26[3] = &unk_1E49242C8;
    v26[4] = v35;
    mscsn_setStreamOutputBufferHandler(v18, v19, v26, 0);
    v20 = *(void **)(a1 + 112);
    v21 = *MEMORY[0x1E0D07FD8];
    v25[0] = v3;
    v25[1] = 3221225472;
    v25[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_10;
    v25[3] = &unk_1E49242C8;
    v25[4] = v35;
    mscsn_setStreamOutputBufferHandler(v20, v21, 0, v25);
    v22 = *(void **)(a1 + 112);
    v23 = *MEMORY[0x1E0D07FD0];
    v24[0] = v3;
    v24[1] = 3221225472;
    v24[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_11;
    v24[3] = &unk_1E4924318;
    v24[4] = v35;
    mscsn_setStreamOutputDictionaryHandler(v22, v23, v24);
    _Block_object_dispose(v35, 8);
  }
}

- (uint64_t)_registerForStreamNotifications
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 112), "registerForNotification:listener:callback:", *MEMORY[0x1E0D06FF0], result, mscsn_handleStreamDroppedSampleNotification);
    objc_msgSend(*(id *)(v1 + 112), "registerForNotification:listener:callback:", CFSTR("Discontinuity"), v1, mscsn_handleStreamDroppedSampleNotification);
    result = objc_msgSend(*(id *)(v1 + 312), "depthOutputEnabled");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(v1 + 112), "registerForNotification:listener:callback:", *MEMORY[0x1E0D07000], v1, mscsn_handlePoolReadyNotification);
  }
  return result;
}

- (id)_verifyColorSpacePropertiesForAllOutputs
{
  id *v1;
  uint64_t v2;
  void *v3;
  int v4;
  int *v5;
  void *v6;
  unsigned int v7;

  if (result)
  {
    v1 = result;
    v7 = 0;
    v2 = objc_msgSend(result[14], "getProperty:error:", *MEMORY[0x1E0D078A0], &v7);
    if (v7)
      goto LABEL_15;
    v3 = (void *)v2;
    if (objc_msgSend(v1[39], "previewOutputEnabled"))
    {
      v7 = -[BWMultiStreamCameraSourceNode _verifyColorSpacePropertiesForOutputID:matchVideoOutputsColorInfo:]((uint64_t)v1, v1[1322], v3);
      if (v7)
        goto LABEL_15;
    }
    if (objc_msgSend(v1[39], "videoCaptureOutputEnabled"))
    {
      v7 = -[BWMultiStreamCameraSourceNode _verifyColorSpacePropertiesForOutputID:matchVideoOutputsColorInfo:]((uint64_t)v1, v1[1326], v3);
      if (v7)
        goto LABEL_15;
    }
    if (objc_msgSend(v1[39], "stillImageOutputEnabled"))
    {
      v4 = objc_msgSend(v1[39], "usesFirmwareStillImageOutput");
      v5 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__stillImageStreamOutputID;
      if (!v4)
        v5 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureStreamOutputID;
      if (v7
        || (v6 = *(id *)((char *)v1 + *v5), (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D08008]) & 1) == 0)
        && (v7 = -[BWMultiStreamCameraSourceNode _verifyColorSpacePropertiesForOutputID:matchVideoOutputsColorInfo:]((uint64_t)v1, v6, v3)) != 0)
      {
LABEL_15:
        FigDebugAssert3();
      }
    }
    return (id *)v7;
  }
  return result;
}

- (void)_outputConfigurationsForAllOutputsWithVISOverscan:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  void *v24;
  CGSize v25;
  int v26;
  int v27;
  uint64_t v28;
  double v29;
  double v30;
  int v31;
  void *v32;
  CGRect v33;
  CGRect rect;
  CGRect v35;

  if (result)
  {
    v5 = (uint64_t)result;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (a2 != *MEMORY[0x1E0C9D820] || a3 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      objc_msgSend(*(id *)(v5 + 312), "videoStabilizationEnabled");
    if (objc_msgSend(*(id *)(v5 + 312), "previewOutputEnabled"))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v5, *(void **)(v5 + 10576), *(void **)(v5 + 200), a2, a3), *(_QWORD *)(v5 + 10576));
    v32 = 0;
    if (-[BWMultiStreamCameraSourceNode _shouldEnableStreamCaptureOutputForNodeOutput:](v5, &v32))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v5, *(void **)(v5 + 10608), v32, a2, a3), *(_QWORD *)(v5 + 10608));
    if (-[BWMultiStreamCameraSourceNode _shouldEnableStillImageOutput](v5))
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWMultiStreamCameraSourceNode _outputConfigurationForStillImageOutputID:](v5, *(void **)(v5 + 10632)), *(_QWORD *)(v5 + 10632));
      if (objc_msgSend(*(id *)(v5 + 312), "sensorRawStillImageOutputEnabled"))
      {
        v8 = (void *)objc_msgSend(*(id *)(v5 + 120), "objectAtIndexedSubscript:", *(int *)(v5 + 320));
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        if (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EA8]), "BOOLValue"))objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D07C40]);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(v5 + 10696));
      }
    }
    if (objc_msgSend(*(id *)(v5 + 312), "depthOutputEnabled"))
    {
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 16);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D07F60]);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D07FC0]);
    }
    if (objc_msgSend(*(id *)(v5 + 312), "pointCloudOutputEnabled"))
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(v5 + 312), "clientVideoFormat"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D07F58]);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D07FD8]);
    }
    v14 = *MEMORY[0x1E0D07FF0];
    v15 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FF0]);
    if (!objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F70]), "BOOLValue"))return v6;
    v16 = MEMORY[0x1E0C9D648];
    v17 = *MEMORY[0x1E0C9D648];
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v21 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FE0]);
    v22 = objc_msgSend(v6, "objectForKeyedSubscript:", v14);
    v23 = (uint64_t *)MEMORY[0x1E0D07F20];
    if (v21)
    {
      v24 = (void *)v22;
      if (v22)
      {
        v25 = *(CGSize *)(v16 + 16);
        rect.origin = *(CGPoint *)v16;
        rect.size = v25;
        v33.origin = rect.origin;
        v33.size = v25;
        v26 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "intValue");
        v27 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "intValue");
        v28 = *v23;
        CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v21, "objectForKeyedSubscript:", *v23), &rect);
        CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v24, "objectForKeyedSubscript:", v28), &v33);
        v29 = (v33.origin.x - rect.origin.x) * ((double)v26 / rect.size.width);
        if (v29 < 0.0)
          v29 = 0.0;
        v30 = (v33.origin.y - rect.origin.y) * ((double)v27 / rect.size.height);
        if (v30 < 0.0)
          v30 = 0.0;
        v17 = (double)(int)(2 * llroundf((float)(int)v29 * 0.5));
        v18 = (double)(int)(2 * llroundf((float)(int)v30 * 0.5));
        v19 = (double)(int)(4 * llroundf((float)(int)((double)v26 + v29 * -2.0) * 0.25));
        v20 = (double)(int)(2 * llroundf((float)(int)((double)v27 + v30 * -2.0) * 0.5));
      }
    }
    if (v19 != 0.0 && v20 != 0.0)
    {
      v35.origin.x = v17;
      v35.origin.y = v18;
      v35.size.width = v19;
      v35.size.height = v20;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", v14), "setObject:forKeyedSubscript:", CGRectCreateDictionaryRepresentation(v35), *v23);
      return v6;
    }
    v31 = FigSignalErrorAt();
    result = 0;
    if (!v31)
      return v6;
  }
  return result;
}

- (uint64_t)_shouldEnableStreamCaptureOutputForNodeOutput:(uint64_t)result
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v3 = result;
    if ((objc_msgSend(*(id *)(result + 312), "previewOutputEnabled") & 1) != 0
      || (objc_msgSend(*(id *)(v3 + 312), "videoCaptureOutputEnabled") & 1) != 0
      || (objc_msgSend(*(id *)(v3 + 312), "depthOutputEnabled") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v4 = objc_msgSend(*(id *)(v3 + 312), "pointCloudOutputEnabled");
    }
    if (objc_msgSend(*(id *)(v3 + 312), "videoCaptureOutputEnabled"))
    {
      v5 = 208;
LABEL_8:
      v6 = *(_QWORD *)(v3 + v5);
      goto LABEL_9;
    }
    if (objc_msgSend(*(id *)(v3 + 312), "stillImageOutputEnabled")
      && (objc_msgSend(*(id *)(v3 + 312), "usesFirmwareStillImageOutput") & 1) == 0)
    {
      v5 = 216;
      goto LABEL_8;
    }
    if ((v4 & 1) != 0)
    {
      result = 0;
    }
    else
    {
      if (objc_msgSend(*(id *)(v3 + 312), "stillImageOutputEnabled")
        && (objc_msgSend(*(id *)(v3 + 312), "usesFirmwareStillImageOutput") & 1) != 0)
      {
        v6 = 0;
LABEL_9:
        result = 1;
        if (!a2)
          return result;
        goto LABEL_10;
      }
      result = objc_msgSend(*(id *)(v3 + 312), "detectedObjectsOutputEnabled");
    }
    v6 = 0;
    if (a2)
LABEL_10:
      *a2 = v6;
  }
  return result;
}

- (uint64_t)_shouldEnableStillImageOutput
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (objc_msgSend(*(id *)(result + 312), "stillImageOutputEnabled")
      && (objc_msgSend(*(id *)(v1 + 312), "usesFirmwareStillImageOutput") & 1) != 0)
    {
      return 1;
    }
    else
    {
      return objc_msgSend(*(id *)(v1 + 312), "forceFirmwareStillImageOutputEnabled");
    }
  }
  return result;
}

- (uint64_t)_isVideoCaptureOutputSupportedByOutputID:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  int IsFullRange;
  int IsTenBit;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  v4 = (void *)objc_msgSend(*(id *)(result + 120), "objectAtIndexedSubscript:", *(int *)(result + 320));
  if (!v4)
    goto LABEL_32;
  v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EE8]), "objectForKeyedSubscript:", a2);
  if (!v5)
    goto LABEL_32;
  v6 = (void *)v5;
  v7 = *MEMORY[0x1E0D07FE0];
  if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FE0]) & 1) == 0
    && objc_msgSend(*(id *)(v3 + 312), "visionDataConfiguration")
    || (objc_msgSend(a2, "isEqualToString:", v7) & 1) == 0
    && (objc_msgSend(*(id *)(v3 + 312), "videoStabilizationEnabled") & 1) != 0)
  {
    return 0;
  }
  v8 = *MEMORY[0x1E0D07FF0];
  if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FF0]))
  {
    result = -[BWMultiStreamCameraSourceNode _secondaryScalerSupportsVideoCaptureDimensions](v3);
    if (!(_DWORD)result)
      return result;
  }
  v9 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D08088]), "BOOLValue");
  v10 = objc_msgSend(a2, "isEqualToString:", v8)
      ? -[BWMultiStreamCameraSourceNode _scalerChainingEnabled](v3)
      : 0;
  if (objc_msgSend(*(id *)(v3 + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled")
    && !(v10 | v9))
  {
    return 0;
  }
  if (objc_msgSend(a2, "isEqualToString:", v7))
  {
    if (objc_msgSend(*(id *)(v3 + 312), "previewOutputEnabled"))
    {
      if (objc_msgSend(*(id *)(v3 + 312), "geometricDistortionCorrectionOnPreviewOutputEnabled"))
      {
        result = objc_msgSend(*(id *)(v3 + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled");
        if (!(_DWORD)result)
          return result;
      }
    }
  }
  v11 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D08068]);
  if (!v11)
  {
LABEL_32:
    FigDebugAssert3();
    return 0;
  }
  v12 = (void *)v11;
  v13 = objc_msgSend(*(id *)(v3 + 312), "clientVideoFormat");
  IsFullRange = FigCapturePixelFormatIsFullRange(v13);
  IsTenBit = FigCapturePixelFormatIsTenBit(v13);
  v16 = FigCapturePixelFormatIs422(v13);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  result = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (result)
  {
    v17 = result;
    v18 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v12);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "intValue");
        if (IsFullRange == FigCapturePixelFormatIsFullRange(v20)
          && IsTenBit == FigCapturePixelFormatIsTenBit(v20)
          && v16 == FigCapturePixelFormatIs422(v20))
        {
          return 1;
        }
      }
      v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      result = 0;
      if (v17)
        continue;
      break;
    }
  }
  return result;
}

- (unint64_t)_calculateVideoCaptureDimensionsWithVISOverscan:(double)a3
{
  char v6;
  unint64_t v7;
  float v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  float v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  float v28;
  double v29;
  int v30;
  int v31;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  float v41;
  double v42;
  double v43;

  if (!a1)
    return 0;
  v6 = objc_msgSend(*(id *)(a1 + 312), "videoCaptureDimensionsIncludeVISOverscan");
  v7 = objc_msgSend(*(id *)(a1 + 312), "videoCaptureDimensions");
  if ((v6 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 312), "additionalVISOverscanWhenRecording");
    v9 = v8 <= 0.0;
    v10 = (float)(v8 + 1.0);
    v11 = (a2 + 1.0) * v10 + -1.0;
    v12 = (a3 + 1.0) * v10 + -1.0;
    if (v9)
      v13 = a2;
    else
      v13 = v11;
    if (v9)
      v14 = a3;
    else
      v14 = v12;
    v15 = *MEMORY[0x1E0C9D820];
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v17 = v14 == v16 && v13 == *MEMORY[0x1E0C9D820];
    objc_msgSend(*(id *)(a1 + 312), "overscanForShiftMitigation", v12);
    v19 = v18;
    if ((objc_msgSend(*(id *)(a1 + 312), "videoStabilizationEnabled") & 1) != 0 || v17)
    {
      v30 = objc_msgSend(*(id *)(a1 + 312), "videoStabilizationEnabled");
      if (v19 == 0.0)
        v31 = 1;
      else
        v31 = v30;
      v29 = v19;
      if (v31)
        v14 = v16;
      else
        v14 = v19;
      if (v31)
        v29 = v15;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
      v43 = v13 + 1.0;
      v21 = 0.0;
      if ((v13 + 1.0) / (v20 + 1.0) + -1.0 >= 0.0)
      {
        objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
        v21 = v43 / (v22 + 1.0) + -1.0;
      }
      v23 = v14 + 1.0;
      objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
      v25 = 0.0;
      if ((v14 + 1.0) / (v24 + 1.0) + -1.0 >= 0.0)
      {
        objc_msgSend(*(id *)(a1 + 312), "sensorOverscan");
        v25 = v23 / (v26 + 1.0) + -1.0;
      }
      if (v19 == 0.0 || (v27 = v21, v19 <= v27) && (v28 = v25, v19 <= v28))
      {
        v29 = v13;
        goto LABEL_30;
      }
      v34 = (float)(v19 + 1.0);
      v35 = v34 / (v21 + 1.0) + -1.0;
      v36 = v34 / (v25 + 1.0) + -1.0;
      if (v35 >= 0.0)
        v37 = v35 + 1.0;
      else
        v37 = 1.0;
      v29 = v43 * v37 + -1.0;
      if (v36 >= 0.0)
        v38 = v36 + 1.0;
      else
        v38 = 1.0;
      v39 = v23 * v38 + -1.0;
      if (v13 == v14)
        goto LABEL_48;
      v40 = (v29 + 1.0) / v43 * v23 + -1.0;
      v41 = v40;
      v42 = v41;
      if (v40 >= 0.0)
        v14 = v42;
      else
        v14 = 0.0;
      if (v14 <= v39)
      {
        v29 = (v39 + 1.0) / v23 * v43 + -1.0;
        if (v29 < 0.0)
          v29 = 0.0;
LABEL_48:
        v14 = v39;
      }
    }
LABEL_30:
    if (v29 != v15 || v14 != v16)
      return mscsn_scaleDimensionsWithAlignment(v7, 2, v29 + 1.0, v14 + 1.0);
  }
  return v7;
}

- (uint64_t)_scalerChainingEnabled
{
  id *v1;
  double v2;
  double v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  BOOL v10;

  if (result)
  {
    v1 = (id *)result;
    result = objc_msgSend(*(id *)(result + 312), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled");
    if ((_DWORD)result)
    {
      result = objc_msgSend(v1[39], "geometricDistortionCorrectionOnPreviewOutputEnabled");
      if ((_DWORD)result)
      {
        if ((int)FigCapturePlatformIdentifier() < 7)
          return 0;
        objc_msgSend(v1[39], "visOverscan");
        v4 = -[BWMultiStreamCameraSourceNode _calculateVideoCaptureDimensionsWithVISOverscan:]((uint64_t)v1, v2, v3);
        v5 = v4;
        v6 = HIDWORD(v4);
        v7 = -[BWMultiStreamCameraSourceNode _calculatePreviewDimensionsForShiftMitigation]((uint64_t)v1);
        v8 = v7;
        v9 = HIDWORD(v7);
        v10 = v5 < (int)v7 || (int)v6 < SHIDWORD(v7);
        if (!v10
          && objc_msgSend(v1[1322], "isEqualToString:", *MEMORY[0x1E0D07FF0])
          && (objc_msgSend(v1[1326], "isEqualToString:", *MEMORY[0x1E0D07FE0]) & 1) != 0)
        {
          return 1;
        }
        if (v5 < v8 && (int)v6 < (int)v9)
        {
          result = objc_msgSend(v1[1322], "isEqualToString:", *MEMORY[0x1E0D07FE0]);
          if ((_DWORD)result)
            return objc_msgSend(v1[1326], "isEqualToString:", *MEMORY[0x1E0D07FF0]);
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_verifyColorSpacePropertiesForOutputID:(void *)a3 matchVideoOutputsColorInfo:
{
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v5 = -[BWMultiStreamCameraSourceNode _colorSpacePropertiesForOuputID:](result, a2);
    v6 = objc_msgSend(a3, "objectForKeyedSubscript:", a2);
    if ((_DWORD)v5)
    {
      if (objc_msgSend(+[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", v5), "isEqualToDictionary:", v6))return 0;
      else
        return 4294954516;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_colorSpacePropertiesForOuputID:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FE0]) & 1) != 0
      || (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FF0]) & 1) != 0
      || (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FC8]) & 1) != 0
      || objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D08008]))
    {
      return *(unsigned int *)(v3 + 328);
    }
    else
    {
      if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FF8]) & 1) != 0)
        return -[BWMultiStreamCameraSourceNode _stillImageColorSpaceProperties](v3);
      result = objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D08000]);
      if ((_DWORD)result)
        return -[BWMultiStreamCameraSourceNode _stillImageColorSpaceProperties](v3);
    }
  }
  return result;
}

- (unint64_t)_calculatePreviewDimensionsForShiftMitigation
{
  unint64_t v2;
  float v3;

  if (!a1)
    return 0;
  v2 = objc_msgSend(*(id *)(a1 + 312), "preferredPreviewDimensions");
  objc_msgSend(*(id *)(a1 + 312), "overscanForShiftMitigation");
  if (v3 != 0.0)
    return mscsn_scaleDimensionsWithAlignment(v2, 2, (float)(v3 + 1.0), (float)(v3 + 1.0));
  return v2;
}

- (uint64_t)_updateActiveNondisruptiveSwitchingFormatIndices
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(*(id *)(a1 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"));
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 312), "fastSwitchingNondisruptiveFormatIndices"));
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v2);
  objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 312), "activeUltraHighResStillImageNondisruptiveSwitchingFormatIndices"));
  if (!objc_msgSend(v3, "count"))
    return 0;
  v4 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07378], objc_msgSend(v3, "allObjects"));
  if ((_DWORD)v4)
  {
    v5 = v4;
    goto LABEL_8;
  }
  v5 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07370], objc_msgSend(v2, "allObjects"));
  if ((_DWORD)v5)
LABEL_8:
    FigDebugAssert3();
  return v5;
}

- (BWNodeOutput)depthOutput
{
  return self->_depthOutput;
}

- (void)requestedZoomFactorChanged:(float)a3
{
  float v5;

  if (-[BWMultiStreamCameraSourceNodeConfiguration deferStreamingOutputsEnable](self->_configuration, "deferStreamingOutputsEnable"))
  {
    -[BWFigVideoCaptureStream baseZoomFactor](-[BWFigVideoCaptureDevice captureStream](self->_captureDevice, "captureStream"), "baseZoomFactor");
    if (v5 != a3
      && !-[BWMultiStreamCameraSourceNode _setStreamOutputsEnabled:streamingOutputs:onDemandStillOutputs:]((uint64_t)self, 1u, 1, 0))
    {
      -[BWFigVideoCaptureDevice setZoomFactorChangedDelegate:forPortType:](self->_captureDevice, "setZoomFactorChangedDelegate:forPortType:", 0, self->_portType);
    }
  }
}

- (uint64_t)_updateFormatIndex
{
  unsigned int v2;
  uint64_t v3;

  if (!a1)
    return 0;
  v2 = objc_msgSend(*(id *)(a1 + 312), "formatIndex");
  if (objc_msgSend(*(id *)(a1 + 120), "count") <= (unint64_t)v2)
  {
    FigDebugAssert3();
    return 4294954516;
  }
  else
  {
    *(_DWORD *)(a1 + 320) = objc_msgSend(*(id *)(a1 + 312), "formatIndex");
    objc_msgSend(*(id *)(a1 + 104), "setFastSwitchingMainFormatIndex:", objc_msgSend(*(id *)(a1 + 312), "fastSwitchingMainFormatIndex"));
    v3 = objc_msgSend(*(id *)(a1 + 104), "setActiveFormatIndex:", *(unsigned int *)(a1 + 320));
    if ((_DWORD)v3)
      FigDebugAssert3();
    else
      -[BWMultiStreamCameraSourceNode _updateDutyCycleMetadataCacheForActiveFormatIndex:](a1, *(int *)(a1 + 320));
  }
  return v3;
}

- (uint64_t)_updateDutyCycleMetadataCacheForActiveFormatIndex:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 120), "objectAtIndexedSubscript:", a2), "objectForKeyedSubscript:", CFSTR("VideoMaxFrameRate")), "intValue");
    if ((int)result > 60
      || (result = objc_msgSend(*(id *)(v2 + 312), "graphContainsMultipleVideoSources"), (result & 1) != 0))
    {
      if (*(_QWORD *)(v2 + 10536))
        return result;
      result = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
    else
    {

      result = 0;
    }
    *(_QWORD *)(v2 + 10536) = result;
  }
  return result;
}

- (uint64_t)_updateObjectDetectionMetadataRegistration
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 104), "setObjectDetectionStartupDeferred:", objc_msgSend(*(id *)(result + 312), "objectDetectionStartupDeferred"));
    if ((objc_msgSend(*(id *)(v1 + 312), "detectedFacesOnVideoCaptureOutputEnabled") & 1) != 0
      || (objc_msgSend(*(id *)(v1 + 312), "detectedFacesOnPreviewOutputEnabled") & 1) != 0)
    {
      v2 = 1;
    }
    else
    {
      v2 = objc_msgSend(*(id *)(v1 + 312), "detectedObjectsOutputEnabled");
    }
    objc_msgSend(*(id *)(v1 + 104), "setFaceDetectionEnabled:", v2);
    objc_msgSend(*(id *)(v1 + 104), "setFaceDetectionConfiguration:", objc_msgSend(*(id *)(v1 + 312), "detectedFacesOutputConfiguration"));
    objc_msgSend(*(id *)(v1 + 104), "setDetectedObjectTypes:", objc_msgSend(*(id *)(v1 + 312), "enabledDetectedObjectTypes"));
    return objc_msgSend(*(id *)(v1 + 104), "setEyeDetectionRequired:", objc_msgSend(*(id *)(v1 + 312), "eyeDetectionRequired"));
  }
  return result;
}

- (CMSampleBufferRef)_createDepthDataSampleBufferFromVideoSampleBuffer:(CMSampleBufferRef)result
{
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  __CVBuffer *v7;
  void *v8;
  const __CFString *v9;
  CFTypeRef v10;
  CMSampleBufferRef v11;

  if (result)
  {
    v3 = (uint64_t)result;
    v11 = 0;
    v4 = (const __CFString *)*MEMORY[0x1E0D05C28];
    v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05C28], 0);
    if (v5)
    {
      v6 = v5;
      v7 = (__CVBuffer *)objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(v3 + 344));
      if (v7)
      {
        if (BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)target, v7, (CFTypeRef *)(v3 + 336), &v11))
        {
          FigDebugAssert3();
        }
        else
        {
          if ((unint64_t)objc_msgSend(v6, "count") >= 2)
          {
            v8 = (void *)objc_msgSend(v6, "mutableCopy");
            objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(v3 + 344));
            CMSetAttachment(v11, v4, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v8), 1u);

          }
          v9 = (const __CFString *)*MEMORY[0x1E0D05CB0];
          v10 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
          CMSetAttachment(v11, v9, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10), 1u);
        }
      }
    }
    CMRemoveAttachment(target, v4);
    return v11;
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  _BOOL4 v3;
  OpaqueVTHDRMetadataGenerationSession *hdrMetadataSession;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWMultiStreamCameraSourceNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v6, sel_prepareForCurrentConfigurationToBecomeLive);
  if (-[BWMultiStreamCameraSourceNodeConfiguration reflectsStillsOnStreamingOutputs](self->_configuration, "reflectsStillsOnStreamingOutputs")&& !self->_motionDataPreserver)
  {
    self->_motionDataPreserver = -[BWMotionDataPreserver initWithName:]([BWMotionDataPreserver alloc], "initWithName:", -[BWNode description](self, "description"));
  }
  v3 = -[BWMultiStreamCameraSourceNodeConfiguration videoHDRImageStatisticsEnabled](self->_configuration, "videoHDRImageStatisticsEnabled");
  hdrMetadataSession = self->_hdrMetadataSession;
  if (v3)
  {
    if (!hdrMetadataSession)
      VTHDRMetadataGenerationSessionCreate();
    v5 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&self->_lastFramePTS.value = *MEMORY[0x1E0CA2E18];
    self->_lastFramePTS.epoch = *(_QWORD *)(v5 + 16);
  }
  else if (hdrMetadataSession)
  {
    CFRelease(hdrMetadataSession);
    self->_hdrMetadataSession = 0;
  }
}

- (uint64_t)_updateOutputConfigurations
{
  id *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  id *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  int v23;
  int v24;
  int v25;
  int CompressionType;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  int *v32;
  id *v33;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = -[BWMultiStreamCameraSourceNode _outputConfigurationsForAllOutputs]((id *)a1);
  if (v2)
  {
    v3 = v2;
    if (*(_BYTE *)(a1 + 128))
    {
      v4 = objc_msgSend(*(id *)(a1 + 112), "setProperty:value:", *MEMORY[0x1E0D07458], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "primaryScalerDecoupled")));
      if ((_DWORD)v4)
      {
        v5 = v4;
LABEL_37:
        FigDebugAssert3();
        return v5;
      }
    }
    else
    {
      v6 = (void *)objc_msgSend(*(id *)(a1 + 112), "supportedProperties");
      v7 = *MEMORY[0x1E0D07450];
      if (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D07450]))
      {
        v8 = objc_msgSend(*(id *)(a1 + 112), "setProperty:value:", v7, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "primaryScalerDecoupled")));
        if ((_DWORD)v8)
        {
          v5 = v8;
          goto LABEL_37;
        }
      }
    }
    v36 = a1;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      v12 = *MEMORY[0x1E0D07FD0];
      v35 = *MEMORY[0x1E0D07F58];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v3);
          v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isEqualToString:", v12) & 1) == 0)
          {
            v15 = mscsn_streamOutputIndexForOutputID(v14);
            v16 = v3;
            v17 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v14);
            v18 = v36 + 384;
            v19 = v36 + 384 + 504 * v15;
            *(_QWORD *)(v19 + 120) = -[BWMultiStreamCameraSourceNode _outputDimensionsForOutputID:outputConfiguration:](v36, v14, v17);
            FigCFDictionaryGetCGRectIfPresent();
            v22 = *(void **)(v19 + 168);
            v21 = (_QWORD *)(v19 + 168);
            v20 = v22;
            if (v22)
            {

              *v21 = 0;
            }
            v23 = v15;
            v24 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", v35), "intValue");
            if (v24)
            {
              v25 = v24;
              CompressionType = FigCapturePixelFormatGetCompressionType(v24);
              *(_DWORD *)(v18 + 504 * v23 + 176) = CompressionType;
              if ((CompressionType - 1) <= 1)
              {
                *v21 = objc_alloc_init(BWStats);
                v27 = v18 + 504 * v23;
                *(_QWORD *)(v27 + 184) = 0;
                *(_QWORD *)(v27 + 192) = 0;
              }
              v28 = v18 + 504 * v23;
              *(_OWORD *)(v28 + 200) = 0u;
              v28 += 200;
              *(_OWORD *)(v28 + 80) = 0u;
              *(_OWORD *)(v28 + 96) = 0u;
              *(_OWORD *)(v28 + 48) = 0u;
              *(_OWORD *)(v28 + 64) = 0u;
              *(_OWORD *)(v28 + 16) = 0u;
              *(_OWORD *)(v28 + 32) = 0u;
              *(_OWORD *)(v28 + 112) = 0u;
              *(_OWORD *)(v28 + 128) = 0u;
              *(_OWORD *)(v28 + 144) = 0u;
              *(_OWORD *)(v28 + 160) = 0u;
              *(_OWORD *)(v28 + 176) = 0u;
              *(_OWORD *)(v28 + 192) = 0u;
              *(_OWORD *)(v28 + 208) = 0u;
              *(_OWORD *)(v28 + 224) = 0u;
              *(_OWORD *)(v28 + 240) = 0u;
              *(_DWORD *)(v28 + 256) = 0;
              v29 = MEMORY[0x1E0CA2E18];
              *(_OWORD *)(v28 + 260) = *MEMORY[0x1E0CA2E18];
              *(_QWORD *)(v28 + 276) = *(_QWORD *)(v29 + 16);
              *(_BYTE *)(v28 + 284) = FigCapturePixelFormatIsTenBit(v25);
              *(_BYTE *)(v28 + 285) = FigCapturePixelFormatIs420(v25);
              *(_BYTE *)(v28 + 286) = FigCapturePixelFormatGetLossyCompressionLevel(v25) != 0;
            }
            else
            {
              *(_DWORD *)(v18 + 504 * v15 + 176) = 0;
            }
            v3 = v16;
          }
        }
        v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v10);
    }
    if (objc_msgSend(*(id *)(v36 + 96), "adaptiveOverscanEnabled"))
    {

      *(_QWORD *)(v36 + 10552) = -[BWMultiStreamCameraSourceNode _outputConfigurationsFilterCropRectAndDimensionsOfStreamingOutputs:](v36, v3);
      *(_QWORD *)(v36 + 10560) = 0;
    }
    v30 = objc_msgSend(*(id *)(v36 + 112), "setProperty:value:", *MEMORY[0x1E0D07888], v3);
    if ((_DWORD)v30)
    {
      v5 = v30;
      goto LABEL_37;
    }
    if ((objc_msgSend(*(id *)(v36 + 312), "previewOutputEnabled") & 1) != 0)
    {
      v31 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__previewOutput;
      v32 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__previewStreamOutputID;
    }
    else
    {
      if (!objc_msgSend(*(id *)(v36 + 312), "videoCaptureOutputEnabled"))
        goto LABEL_33;
      v31 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureOutput;
      v32 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureStreamOutputID;
    }
    v33 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:]((id *)v36, *(void **)(v36 + *v32), *(void **)(v36 + *v31));
    if (v33)
    {
      v5 = 0;
      *(float *)(v36 + 10972) = -[BWMultiStreamCameraSourceNode _maxISPZoomFactorForOutputConfiguration:](v36, v33);
      return v5;
    }
LABEL_33:
    v5 = 0;
    *(_DWORD *)(v36 + 10972) = 1065353216;
    return v5;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (unint64_t)_outputDimensionsForOutputID:(void *)a3 outputConfiguration:
{
  unsigned int width;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  const __CFDictionary *v10;
  CGSize v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  void *v15;
  CGRect v17;

  if (a1)
  {
    width = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "unsignedIntValue");
    v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "unsignedIntValue");
    v8 = v7;
    if (width)
      v9 = (_DWORD)v7 == 0;
    else
      v9 = 1;
    if (v9)
    {
      v10 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F20]);
      v11 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      v17.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      v17.size = v11;
      v12 = CGRectMakeWithDictionaryRepresentation(v10, &v17);
      v8 = v12 ? (int)v17.size.height : v8;
      if (v12)
        width = (int)v17.size.width;
    }
    if (width)
      v13 = (_DWORD)v8 == 0;
    else
      v13 = 1;
    if (v13)
    {
      v14 = (void *)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", *(int *)(a1 + 320));
      v15 = (void *)objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EE8]), "objectForKeyedSubscript:", a2);
      width = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D08050]), "unsignedIntValue");
      v8 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D08040]), "unsignedIntValue");
    }
    if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D08010]))
    {
      if (*(_BYTE *)(a1 + 160))
        v8 = v8;
      else
        v8 = 0;
      if (!*(_BYTE *)(a1 + 160))
        width = 0;
    }
  }
  else
  {
    v8 = 0;
    width = 0;
  }
  return width | (unint64_t)(v8 << 32);
}

- (int)allocateOrReuseBufferPoolsFromSourceNode:(id)a3
{
  BWMultiStreamCameraSourceNode *v3;
  uint64_t v4;
  BWStreamOutputStorage *outputsStorage;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  BWStreamOutputStorage *v12;
  uint64_t retainedBufferCount;
  BWNodeOutput *nodeOutput;
  int v15;
  uint64_t v16;
  BWDataBufferPool *v17;
  const char *v18;
  BWDataBufferPool *v19;
  BWDataBufferPool *v20;
  BWStreamOutputStorage *v21;
  BWStreamOutputStorage *v22;
  int v23;
  BWNodeOutput *v24;
  uint64_t v25;
  void *v26;
  int v27;
  BWStreamOutputStorage *v28;
  uint64_t v29;
  BWNodeOutput *v30;
  void *v31;
  int v32;
  BWVideoFormat *v33;
  BWPixelBufferPool *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  BWStreamOutputStorage *v38;
  int v39;
  BWNodeOutput *v40;
  int v41;
  uint64_t v42;
  BWDataBufferPool *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  BWStreamOutputStorage *v47;
  BWStreamOutputStorage *v48;
  BWNodeOutput *v49;
  BWStreamOutputStorage *v50;
  void *v51;
  uint64_t i;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  int v57;
  int v58;
  id v59;
  void *v60;
  BWPixelBufferPool *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  void *v66;
  id v67;
  void *v68;
  char v69;
  BWVideoFormat *v70;
  float v71;
  float v72;
  float v73;
  int v74;
  int v75;
  BWPixelBufferPool *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  BWStreamOutputStorage *v82;
  unsigned int v83;
  void *v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  _BOOL4 v91;
  _BOOL4 v92;
  void *v93;
  void *v94;
  BWPixelBufferPool *v95;
  BWPixelBufferPool *v96;
  int *v97;
  uint64_t v98;
  uint64_t v99;
  _BOOL4 v100;
  _BOOL4 v101;
  void *v102;
  void *v103;
  BWPixelBufferPool *v104;
  BWPixelBufferPool *v105;
  int *v106;
  uint64_t v107;
  uint64_t v108;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  BWStreamOutputStorage *v133;
  uint64_t v134;
  void *v135;
  NSSet *obj;
  BOOL *p_bufferPoolOwnedByAnotherNode;
  int *p_streamRetainedBufferCount;
  uint64_t v139;
  unsigned int v140;
  uint64_t v141;
  BWNodeOutput *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  BWMultiStreamCameraSourceNode *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  void *v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  int v157;
  _QWORD v158[2];
  _QWORD v159[2];
  _QWORD v160[2];
  _QWORD v161[2];
  _QWORD v162[2];
  _QWORD v163[2];
  uint64_t v164;
  uint64_t v165;
  BWVideoFormatRequirements *v166;
  uint64_t v167;
  uint64_t v168;
  _BYTE v169[128];
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  _QWORD v175[3];

  v3 = self;
  v175[1] = *MEMORY[0x1E0C80C00];
  -[BWMultiStreamCameraSourceNode _markPrimaryStreamingOutput]((uint64_t)self);
  v157 = -[BWMultiStreamCameraSourceNode _bringStreamUpToDate]((uint64_t)v3);
  if (v157)
    goto LABEL_121;
  v135 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = *MEMORY[0x1E0D07888];
  v146 = -[BWFigCaptureStream getProperty:error:](v3->_stream, "getProperty:error:", *MEMORY[0x1E0D07888], &v157);
  if (v157)
    goto LABEL_121;
  outputsStorage = v3->_outputsStorage;
  v157 = -[BWMemoryPool enableForCaptureStream:](-[BWNodeOutput memoryPool](v3->_outputsStorage[0].nodeOutput, "memoryPool"), "enableForCaptureStream:", v3->_stream);
  if (v157)
    goto LABEL_121;
  v122 = v4;
  if (-[BWMultiStreamCameraSourceNodeConfiguration usesFirmwareStillImageOutput](v3->_configuration, "usesFirmwareStillImageOutput"))
  {
    v3->_currentFirmwareStillImageOutputRetainedBufferCount = -[BWMultiStreamCameraSourceNode _firmwareStillImageOutputRetainedBufferCountForClientBracketCount:]((uint64_t)v3, 0);
  }
  v6 = 0;
  v7 = 0;
  v144 = *MEMORY[0x1E0D07F10];
  v143 = *MEMORY[0x1E0D07F58];
  v145 = *MEMORY[0x1E0D07F00];
  v131 = *MEMORY[0x1E0D066B0];
  v125 = *MEMORY[0x1E0D06730];
  v130 = *MEMORY[0x1E0D066C0];
  v124 = *MEMORY[0x1E0D06738];
  v123 = *MEMORY[0x1E0CA9040];
  v121 = *MEMORY[0x1E0D07F60];
  v129 = *MEMORY[0x1E0D07FD0];
  v128 = *MEMORY[0x1E0D066E0];
  v126 = *MEMORY[0x1E0D06678];
  v127 = *MEMORY[0x1E0D066D0];
  do
  {
    v8 = (uint64_t)&outputsStorage[v6];
    v10 = (_QWORD *)(v8 + 88);
    v9 = *(void **)(v8 + 88);
    if (v9)
    {

      *v10 = 0;
    }
    v134 = v6;
    if (outputsStorage[v6].enabled)
    {
      v11 = (void *)mscsn_streamOutputIDForOutputIndex(v6);
      -[BWMultiStreamCameraSourceNode _computeRetainedBufferCountForOutputStorage:]((uint64_t)v3, v8);
      v150 = v11;
      switch((int)v6)
      {
        case 5:
          if (!v3->_isInfraredSourceNode)
            break;
          goto LABEL_18;
        case 6:
          break;
        case 7:
          v12 = &outputsStorage[v6];
          retainedBufferCount = v12->retainedBufferCount;
          nodeOutput = v12->nodeOutput;
          v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v146, "objectForKeyedSubscript:", v11), "objectForKeyedSubscript:", v144), "intValue");
          v16 = -[BWNodeOutput pointCloudFormat](nodeOutput, "pointCloudFormat");
          v17 = [BWDataBufferPool alloc];
          v19 = -[BWDataBufferPool initWithFormat:capacity:name:clientProvidesPool:](v17, "initWithFormat:capacity:name:clientProvidesPool:", v16, retainedBufferCount + v15, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_BufferPool"), BWPortTypeToDisplayString(v3->_portType, v18), v11), 0);
          if (!v19)
            goto LABEL_121;
          v20 = v19;
          v21 = &outputsStorage[v134];
          v21->bufferPoolOwnedByAnotherNode = 0;
          v21->streamRetainedBufferCount = v15;
          v174 = v145;
          v175[0] = -[BWDataBufferPool cvDataBufferPool](v19, "cvDataBufferPool");
          objc_msgSend(v135, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v175, &v174, 1), v11);
          if (nodeOutput)
            -[BWNodeOutput setNodePreparedDataBufferPool:](nodeOutput, "setNodePreparedDataBufferPool:", v20);

          break;
        case 9:
          v28 = &outputsStorage[v6];
          v29 = v28->retainedBufferCount;
          v30 = v28->nodeOutput;
          v31 = (void *)objc_msgSend((id)objc_msgSend(v146, "objectForKeyedSubscript:", v11), "objectForKeyedSubscript:", v130);
          v32 = objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", v144), "intValue");
          LODWORD(v31) = objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", v143), "intValue");
          v33 = -[BWNodeOutput videoFormat](v30, "videoFormat");
          if ((_DWORD)v31 != -[BWVideoFormat pixelFormat](v33, "pixelFormat"))
            goto LABEL_121;
          v34 = [BWPixelBufferPool alloc];
          v36 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v34, "initWithVideoFormat:capacity:name:memoryPool:", v33, v29 + v32, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_BufferPool"), BWPortTypeToDisplayString(v3->_portType, v35), v124), -[BWNodeOutput memoryPool](v30, "memoryPool"));
          if (!v36)
            goto LABEL_121;
          v37 = (void *)v36;
          v38 = &outputsStorage[v134];
          v38->streamRetainedBufferCount = v32;
          v38->bufferPoolOwnedByAnotherNode = 0;
          if (!v7)
          {
            v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            objc_msgSend(v135, "setObject:forKeyedSubscript:", v7, v150);
          }
          v172 = v145;
          v173 = objc_msgSend(v37, "cvPixelBufferPool");
          objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1), v130);
          -[BWNodeOutput setNodePreparedPixelBufferPool:](v30, "setNodePreparedPixelBufferPool:", v37);

          break;
        case 10:
          v39 = outputsStorage[v6].retainedBufferCount;
          if (-[BWMultiStreamCameraSourceNodeConfiguration lightSourceMaskOutputEnabled](v3->_configuration, "lightSourceMaskOutputEnabled"))
          {
            v39 = outputsStorage[9].retainedBufferCount;
          }
          v40 = outputsStorage[v134].nodeOutput;
          v41 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v146, "objectForKeyedSubscript:", v11), "objectForKeyedSubscript:", v131), "objectForKeyedSubscript:", v144), "intValue");
          v42 = -[BWNodeOutput pointCloudFormat](v40, "pointCloudFormat");
          v43 = [BWDataBufferPool alloc];
          v45 = -[BWDataBufferPool initWithFormat:capacity:name:clientProvidesPool:](v43, "initWithFormat:capacity:name:clientProvidesPool:", v42, v41 + v39, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_BufferPool"), BWPortTypeToDisplayString(v3->_portType, v44), v125), 0);
          if (!v45)
            goto LABEL_121;
          v46 = (void *)v45;
          v47 = &outputsStorage[v134];
          v47->streamRetainedBufferCount = v41;
          v47->bufferPoolOwnedByAnotherNode = 0;
          if (!v7)
          {
            v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            objc_msgSend(v135, "setObject:forKeyedSubscript:", v7, v150);
          }
          v170 = v145;
          v171 = objc_msgSend(v46, "cvDataBufferPool");
          objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1), v131);
          -[BWNodeOutput setNodePreparedDataBufferPool:](v40, "setNodePreparedDataBufferPool:", v46);

          break;
        case 11:
          v48 = &outputsStorage[v6];
          v141 = v48->retainedBufferCount;
          v49 = v48->nodeOutput;
          v153 = 0u;
          v154 = 0u;
          v155 = 0u;
          v156 = 0u;
          obj = -[BWMultiStreamCameraSourceNodeConfiguration enabledSemanticMaskTypes](v3->_configuration, "enabledSemanticMaskTypes");
          v149 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v153, v169, 16);
          if (!v149)
            break;
          v50 = &outputsStorage[v6];
          p_streamRetainedBufferCount = &v50->streamRetainedBufferCount;
          v139 = *(_QWORD *)v154;
          p_bufferPoolOwnedByAnotherNode = &v50->bufferPoolOwnedByAnotherNode;
          v51 = v11;
          v147 = v3;
          v133 = outputsStorage;
          do
          {
            for (i = 0; i != v149; ++i)
            {
              if (*(_QWORD *)v154 != v139)
                objc_enumerationMutation(obj);
              v53 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
              v54 = mscsn_semanticMaskOutputConfigurationKeyForSemanticMaskType(v53);
              if (!v54)
                goto LABEL_121;
              v55 = v54;
              v152 = v7;
              v56 = (void *)objc_msgSend((id)objc_msgSend(v146, "objectForKeyedSubscript:", v51), "objectForKeyedSubscript:", v54);
              v57 = objc_msgSend((id)objc_msgSend(v56, "objectForKeyedSubscript:", v144), "intValue");
              v58 = objc_msgSend((id)objc_msgSend(v56, "objectForKeyedSubscript:", v143), "intValue");
              v59 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](v49, "mediaPropertiesForAttachedMediaKey:", v53);
              v60 = (void *)objc_msgSend(v59, "resolvedVideoFormat");
              if (v58 != objc_msgSend(v60, "pixelFormat"))
                goto LABEL_121;
              v61 = [BWPixelBufferPool alloc];
              v63 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v61, "initWithVideoFormat:capacity:name:memoryPool:", v60, v141 + v57, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_BufferPool"), BWPortTypeToDisplayString(v147->_portType, v62), v53), -[BWNodeOutput memoryPool](v49, "memoryPool"));
              if (!v63)
                goto LABEL_121;
              v64 = (void *)v63;
              *p_streamRetainedBufferCount = v57;
              *p_bufferPoolOwnedByAnotherNode = 0;
              v7 = v152;
              v51 = v150;
              if (!v152)
              {
                v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                objc_msgSend(v135, "setObject:forKeyedSubscript:", v7, v150);
              }
              v167 = v145;
              v168 = objc_msgSend(v64, "cvPixelBufferPool");
              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1), v55);
              objc_msgSend(v59, "setNodePreparedPixelBufferPool:", v64);

            }
            v3 = v147;
            outputsStorage = v133;
            v149 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v153, v169, 16);
          }
          while (v149);
          break;
        default:
          if ((v6 & 0x7FFFFFFE) == 0xC)
            break;
LABEL_18:
          v22 = &outputsStorage[v6];
          v23 = v22->retainedBufferCount;
          v24 = v22->nodeOutput;
          v25 = mscsn_metadataOutputKeyForOutputIndex(v6);
          v26 = (void *)objc_msgSend(v146, "objectForKeyedSubscript:", v11);
          v151 = v25;
          if (v25)
            v26 = (void *)objc_msgSend(v26, "objectForKeyedSubscript:", mscsn_metadataOutputConfigurationKeyForOutputIndex(v6));
          if (*(_DWORD *)v8 == 1)
          {
            v148 = v26;
            v27 = objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", v144), "intValue");
            goto LABEL_51;
          }
          if (*(_DWORD *)v8 != 2 || v24 != 0)
          {
            v148 = v26;
            v27 = 0;
LABEL_51:
            if (!a3)
              goto LABEL_66;
            if (!v3->_shareStreamingBufferPools)
              goto LABEL_55;
            if (v24 == v3->_previewOutput)
            {
              v66 = (void *)objc_msgSend(a3, "previewOutput");
            }
            else if (v24 == v3->_videoCaptureOutput)
            {
              v66 = (void *)objc_msgSend(a3, "videoCaptureOutput");
            }
            else
            {
LABEL_55:
              if (v24 != v3->_stillImageOutput)
              {
                if (v3->_sharePreLTMThumbnailBufferPools && v24 == v3->_preLTMThumbnailOutput)
                {
                  v66 = (void *)objc_msgSend(a3, "preLTMThumbnailOutput");
                  goto LABEL_64;
                }
LABEL_66:
                v70 = -[BWNodeOutput videoFormat](v24, "videoFormat");
                if (!v70)
                {
                  v166 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForOutputID:configuration:]((id *)&v3->super.super.super.isa, v11, v148);
                  v70 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v166, 1));
                }
                v142 = v24;
                if (v24 == v3->_videoCaptureOutput
                  && -[BWMultiStreamCameraSourceNodeConfiguration videoStabilizationTypeISPMeshEnabled](v3->_configuration, "videoStabilizationTypeISPMeshEnabled"))
                {
                  -[BWMultiStreamCameraSourceNodeConfiguration maxFrameRate](v3->_configuration, "maxFrameRate");
                  if (v71 < 120.0)
                    v72 = 250.0;
                  else
                    v72 = 125.0;
                  -[BWMultiStreamCameraSourceNodeConfiguration maxFrameRate](v3->_configuration, "maxFrameRate");
                  v23 += llroundf((float)(v73 * v72) / 1000.0);
                }
                v74 = v27;
                v75 = v23 + v27;
                v76 = [BWPixelBufferPool alloc];
                v77 = (void *)MEMORY[0x1E0CB3940];
                v79 = BWPortTypeToDisplayString(v3->_portType, v78);
                v80 = v150;
                if (v151)
                  v80 = (void *)v151;
                v81 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v76, "initWithVideoFormat:capacity:name:memoryPool:", v70, v75, objc_msgSend(v77, "stringWithFormat:", CFSTR("%@_%@_BufferPool"), v79, v80), -[BWNodeOutput memoryPool](v142, "memoryPool"));
                if (!v81)
                  goto LABEL_121;
                v68 = (void *)v81;
                v140 = v23;
                v69 = 0;
                v27 = v74;
                v24 = v142;
LABEL_78:
                v82 = &outputsStorage[v134];
                v82->streamRetainedBufferCount = v27;
                v82->bufferPoolOwnedByAnotherNode = v69;
                v83 = objc_msgSend((id)objc_msgSend(v148, "objectForKeyedSubscript:", v143), "intValue");
                v84 = (void *)-[__CFDictionary objectForKeyedSubscript:](CVPixelBufferPoolGetPixelBufferAttributes((CVPixelBufferPoolRef)objc_msgSend(v68, "cvPixelBufferPool")), "objectForKeyedSubscript:", v123);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v85 = objc_msgSend((id)objc_msgSend(v84, "firstObject"), "intValue");
                else
                  v85 = objc_msgSend(v84, "unsignedIntValue");
                if (v83 != v85)
                {
                  v110 = (void *)MEMORY[0x1E0C99DA0];
                  v111 = *MEMORY[0x1E0C99768];
                  v112 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Internal inconsistency, output pixel format (%c%c%c%c) doesn't match the pixelBufferPool's pixel format (%c%c%c%c)"), HIBYTE(v83), BYTE2(v83), BYTE1(v83), v83, HIBYTE(v85), BYTE2(v85), BYTE1(v85), v85);
LABEL_134:
                  objc_exception_throw((id)objc_msgSend(v110, "exceptionWithName:reason:userInfo:", v111, v112, 0));
                }
                if (v151)
                {
                  if (!v7)
                  {
                    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    objc_msgSend(v135, "setObject:forKeyedSubscript:", v7, v150);
                  }
                  v164 = v145;
                  v165 = objc_msgSend(v68, "cvPixelBufferPool");
                  v86 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1);
                  v87 = mscsn_metadataOutputConfigurationKeyForOutputIndex(v134);
                  v88 = v7;
                  v89 = v86;
                }
                else
                {
                  v162[0] = v145;
                  v90 = objc_msgSend(v68, "cvPixelBufferPool");
                  v162[1] = v121;
                  v163[0] = v90;
                  v163[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v140);
                  v89 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v163, v162, 2);
                  v88 = v135;
                  v87 = (uint64_t)v150;
                }
                objc_msgSend(v88, "setObject:forKeyedSubscript:", v89, v87);
                if (v24 && !-[BWNodeOutput providesPixelBufferPool](v24, "providesPixelBufferPool"))
                {
                  -[BWNodeOutput setNodePreparedPixelBufferPool:](v24, "setNodePreparedPixelBufferPool:", v68);

                }
                else
                {
                  *v10 = v68;
                }
                v91 = -[BWMultiStreamCameraSourceNodeConfiguration preLTMThumbnailOnPreviewOutputEnabled](v3->_configuration, "preLTMThumbnailOnPreviewOutputEnabled");
                v92 = v91;
                if (v24 == v3->_previewOutput && v91
                  || v24 == v3->_videoCaptureOutput
                  && -[BWMultiStreamCameraSourceNodeConfiguration preLTMThumbnailOnVideoCaptureOutputEnabled](v3->_configuration, "preLTMThumbnailOnVideoCaptureOutputEnabled"))
                {
                  v93 = (void *)objc_msgSend((id)objc_msgSend(v146, "objectForKeyedSubscript:", v129), "objectForKeyedSubscript:", v128);
                  if (v92)
                    v94 = (void *)objc_msgSend(a3, "previewOutput");
                  else
                    v94 = (void *)objc_msgSend(a3, "videoCaptureOutput");
                  v95 = -[BWMultiStreamCameraSourceNode _allocateOrReuseBufferPoolsFromSourceNodeOutput:forAttachedMedia:onNodeOutput:outputConfiguration:shareBufferPools:]((BWPixelBufferPool *)v3, v94, 0x1E494FBD8, v24, v93, v3->_sharePreLTMThumbnailBufferPools);
                  if (!v95)
                    goto LABEL_121;
                  v96 = v95;
                  if (!v7)
                  {
                    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    objc_msgSend(v135, "setObject:forKeyedSubscript:", v7, v129);
                  }
                  v97 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureStreamOutputID;
                  if (v92)
                    v97 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__previewStreamOutputID;
                  v98 = *(uint64_t *)((char *)&v3->super.super.super.isa + *v97);
                  v160[0] = v145;
                  v99 = -[BWPixelBufferPool cvPixelBufferPool](v96, "cvPixelBufferPool");
                  v160[1] = v126;
                  v161[0] = v99;
                  v161[1] = v98;
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v161, v160, 2), v128);
                }
                v100 = -[BWMultiStreamCameraSourceNodeConfiguration postColorProcessingThumbnailOnPreviewOutputEnabled](v3->_configuration, "postColorProcessingThumbnailOnPreviewOutputEnabled");
                v101 = v100;
                if (v24 == v3->_previewOutput && v100
                  || v24 == v3->_videoCaptureOutput
                  && -[BWMultiStreamCameraSourceNodeConfiguration postColorProcessingThumbnailOnVideoCaptureOutputEnabled](v3->_configuration, "postColorProcessingThumbnailOnVideoCaptureOutputEnabled"))
                {
                  v102 = (void *)objc_msgSend((id)objc_msgSend(v146, "objectForKeyedSubscript:", v129), "objectForKeyedSubscript:", v127);
                  if (v101)
                    v103 = (void *)objc_msgSend(a3, "previewOutput");
                  else
                    v103 = (void *)objc_msgSend(a3, "videoCaptureOutput");
                  v104 = -[BWMultiStreamCameraSourceNode _allocateOrReuseBufferPoolsFromSourceNodeOutput:forAttachedMedia:onNodeOutput:outputConfiguration:shareBufferPools:]((BWPixelBufferPool *)v3, v103, 0x1E495B478, v24, v102, v3->_sharePostColorProcessingThumbnailBufferPools);
                  if (!v104)
                    goto LABEL_121;
                  v105 = v104;
                  if (!v7)
                  {
                    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    objc_msgSend(v135, "setObject:forKeyedSubscript:", v7, v129);
                  }
                  v106 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureStreamOutputID;
                  if (v101)
                    v106 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__previewStreamOutputID;
                  v107 = *(uint64_t *)((char *)&v3->super.super.super.isa + *v106);
                  v158[0] = v145;
                  v108 = -[BWPixelBufferPool cvPixelBufferPool](v105, "cvPixelBufferPool");
                  v158[1] = v126;
                  v159[0] = v108;
                  v159[1] = v107;
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v159, v158, 2), v127);
                }
                break;
              }
              v66 = (void *)objc_msgSend(a3, "stillImageOutput");
            }
LABEL_64:
            v67 = (id)objc_msgSend(v66, "preparedPixelBufferPool");
            if (!v67)
              goto LABEL_66;
            v68 = v67;
            v140 = v23;
            objc_msgSend(v67, "setCapacity:", objc_msgSend(v67, "capacity") + v27);
            v69 = 1;
            goto LABEL_78;
          }
          if (!-[BWMultiStreamCameraSourceNodeConfiguration forceFirmwareStillImageOutputEnabled](v3->_configuration, "forceFirmwareStillImageOutputEnabled"))
          {
            v110 = (void *)MEMORY[0x1E0C99DA0];
            v111 = *MEMORY[0x1E0C99768];
            v112 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Internal inconsistency, the stream's still image output is enabled but the node's stillImageOutput is not enabled."), v113, v114, v115, v116, v117, v118, v119, v120);
            goto LABEL_134;
          }
          break;
      }
    }
    v6 = v134 + 1;
  }
  while (v134 != 19);
  v157 = -[BWFigCaptureStream setProperty:value:](v3->_stream, "setProperty:value:", v122, v135);
  if (v157)
LABEL_121:
    FigDebugAssert3();
  return v157;
}

- (uint64_t)_computeRetainedBufferCountForOutputStorage:(uint64_t)result
{
  uint64_t v3;
  int v4;
  float v5;

  if (result)
  {
    v3 = result;
    result = *(_QWORD *)(a2 + 16);
    if (result)
    {
      if (*(_DWORD *)a2 == 2)
      {
        v4 = *(_DWORD *)(v3 + 10644);
      }
      else if (*(_DWORD *)a2 == 1)
      {
        v4 = objc_msgSend((id)result, "retainedBufferCount");
        result = objc_msgSend(*(id *)(v3 + 312), "maxFrameRate");
        if (v5 > 120.0)
          ++v4;
        if ((*(_BYTE *)(a2 + 4) & 3) != 0)
        {
          if (v4 <= (int)objc_msgSend(*(id *)(v3 + 104), "timeMachineCapacity"))
            v4 = objc_msgSend(*(id *)(v3 + 104), "timeMachineCapacity");
          result = objc_msgSend(*(id *)(v3 + 216), "retainedBufferCount");
          v4 += result;
        }
      }
      else
      {
        v4 = 0;
      }
    }
    else
    {
      v4 = 1;
    }
    *(_DWORD *)(a2 + 80) = v4;
  }
  return result;
}

- (id)_outputConfigurationsForAllOutputs
{
  id *v1;
  double v2;
  double v3;

  if (result)
  {
    v1 = result;
    objc_msgSend(result[39], "visOverscan");
    return (id *)-[BWMultiStreamCameraSourceNode _outputConfigurationsForAllOutputsWithVISOverscan:](v1, v2, v3);
  }
  return result;
}

- (uint64_t)_markPrimaryStreamingOutput
{
  uint64_t v1;
  void *v2;
  int v3;
  float v4;
  float v5;
  int v6;
  int CompressionType;
  void **v9;
  uint64_t v10;
  uint64_t v11;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 10608);
    if (v2)
    {
      if (!*(_QWORD *)(result + 10576))
        goto LABEL_30;
      v3 = objc_msgSend((id)objc_msgSend(*(id *)(result + 208), "videoFormat"), "pixelFormat");
      objc_msgSend(*(id *)(v1 + 312), "maxFrameRate");
      v5 = v4;
      v6 = objc_msgSend(*(id *)(v1 + 312), "preferredPreviewMaxFrameRate");
      CompressionType = FigCapturePixelFormatGetCompressionType(v3);
      if (!CompressionType)
        goto LABEL_30;
      if (CompressionType != 2 && v5 > (float)v6)
        goto LABEL_30;
    }
    v2 = *(void **)(v1 + 10576);
    if (v2)
      goto LABEL_30;
    result = objc_msgSend(*(id *)(v1 + 312), "depthOutputEnabled");
    if ((result & 1) != 0)
    {
      v9 = (void **)MEMORY[0x1E0D07FC0];
    }
    else
    {
      result = objc_msgSend(*(id *)(v1 + 312), "pointCloudOutputEnabled");
      if ((result & 1) != 0)
      {
        v9 = (void **)MEMORY[0x1E0D07FD8];
      }
      else
      {
        result = objc_msgSend(*(id *)(v1 + 312), "secureMetadataOutputConfiguration");
        if (!result)
          return result;
        v9 = (void **)MEMORY[0x1E0D07FD0];
      }
    }
    v2 = *v9;
    if (*v9)
    {
LABEL_30:
      if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D07FD0]))
      {
        result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 312), "secureMetadataOutputConfiguration"), "objectDetectionEnabled");
        if ((_DWORD)result)
        {
          v10 = 6048;
        }
        else
        {
          result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 312), "secureMetadataOutputConfiguration"), "eyeReliefStatusDetectionEnabled");
          if (!(_DWORD)result)
            objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Metadata output is enabled, but no secure metadata features are enabled."), 0));
          v10 = 6552;
        }
        v11 = v1 + v10 + 384;
      }
      else
      {
        result = mscsn_streamOutputIndexForOutputID(v2);
        v11 = v1 + 384 + 504 * (int)result;
      }
      *(_DWORD *)(v11 + 4) |= 4u;
    }
  }
  return result;
}

- (id)_outputConfigurationForStreamingOutputID:(void *)a3 nodeOutput:
{
  uint64_t v5;
  double v6;
  double v7;

  if (result)
  {
    v5 = (uint64_t)result;
    objc_msgSend(result[39], "visOverscan");
    return (id *)-[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v5, a2, a3, v6, v7);
  }
  return result;
}

- (float)_maxISPZoomFactorForOutputConfiguration:(uint64_t)a1
{
  int v4;
  void *v5;
  int v6;
  float v7;

  if (!a1)
    return 0.0;
  if (a2)
  {
    v4 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "intValue");
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "intValue");
    v5 = (void *)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", *(int *)(a1 + 320));
    v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07ED0]), "intValue");
    objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EC8]), "intValue");
    if (FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(a1 + 312), "sensorCropDimensions")))
      v6 = objc_msgSend(*(id *)(a1 + 312), "sensorCropDimensions");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "nondisruptiveSwitchingZoomFactors"), "lastObject"), "floatValue");
    if (v7 == 0.0)
      objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
    return (float)((float)v6 / (float)v4) * v7;
  }
  else
  {
    FigDebugAssert3();
    return 1.0;
  }
}

- (id)nodeSubType
{
  return CFSTR("FigCaptureDevice");
}

- (BWFigVideoCaptureStream)captureStream
{
  return self->_captureStream;
}

- (BOOL)start:(id *)a3
{
  uint64_t v3;
  _BOOL4 v6;
  BOOL v7;
  BWFigVideoCaptureStream **p_captureStream;
  CGSize size;
  BWFaceDetector *v10;
  BWObjectDetector *v11;
  int v12;
  int v13;
  BWFigVideoCaptureStream *v14;
  BOOL v15;
  _BOOL4 v16;
  BWFigVideoCaptureStream *captureStream;
  BOOL v18;
  BOOL result;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  _QWORD v25[4];
  CGPoint origin;
  CGSize v27;
  _QWORD v28[6];

  self->_discardOutputSampleBuffers = 0;
  self->_stopStreamConfigurationUpdates = 0;
  if (self->_resolvedFormatIndex == -1)
  {
LABEL_28:
    -[BWMultiStreamCameraSourceNode makeOutputsLiveIfNeeded](self, "makeOutputsLiveIfNeeded");
    return 1;
  }
  self->_infraredProjectorUptimeInUsForLowPowerSparse = 0;
  self->_infraredProjectorUptimeInUsForHighPowerSparse = 0;
  self->_previousInfraredCaptureID = 0;
  self->_rawCompressionEnabled = 1;
  if (-[BWMultiStreamCameraSourceNodeConfiguration deferStreamingOutputsEnable](self->_configuration, "deferStreamingOutputsEnable"))
  {
    -[BWFigVideoCaptureDevice setZoomFactorChangedDelegate:forPortType:](self->_captureDevice, "setZoomFactorChangedDelegate:forPortType:", self, self->_portType);
  }
  if (-[BWMultiStreamCameraSourceNodeConfiguration stillImageOutputEnabled](self->_configuration, "stillImageOutputEnabled"))
  {
    if (-[BWMultiStreamCameraSourceNodeConfiguration stillImageOutputEnabled](self->_configuration, "stillImageOutputEnabled"))
    {
      v6 = -[BWMultiStreamCameraSourceNodeConfiguration usesFirmwareStillImageOutput](self->_configuration, "usesFirmwareStillImageOutput");
      v7 = v6;
      p_captureStream = &self->_captureStream;
      -[BWFigVideoCaptureStream setTimeMachineEnabled:](self->_captureStream, "setTimeMachineEnabled:", !v6);
      if (!v7)
      {
        v28[0] = 0;
        v28[1] = v28;
        v28[2] = 0x3052000000;
        v28[3] = __Block_byref_object_copy__30;
        v28[4] = __Block_byref_object_dispose__30;
        v28[5] = self;
        v25[0] = 0;
        v25[1] = v25;
        v25[2] = 0x4010000000;
        v25[3] = &unk_1A33536F2;
        size = self->_outputsStorage[3].cropRect.size;
        origin = self->_outputsStorage[3].cropRect.origin;
        v27 = size;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __39__BWMultiStreamCameraSourceNode_start___block_invoke;
        v24[3] = &unk_1E4924260;
        v24[5] = v28;
        v24[6] = v25;
        v24[4] = self;
        -[BWFigVideoCaptureStream setStillImageBufferTimeMachineHandler:](*p_captureStream, "setStillImageBufferTimeMachineHandler:", v24);
        _Block_object_dispose(v25, 8);
        _Block_object_dispose(v28, 8);
      }
    }
    else
    {
      p_captureStream = &self->_captureStream;
      -[BWFigVideoCaptureStream setTimeMachineEnabled:](self->_captureStream, "setTimeMachineEnabled:", 0);
    }
    -[BWFigVideoCaptureStream setUsesStillFusionReferenceFramePTSForDidCaptureCallback:](*p_captureStream, "setUsesStillFusionReferenceFramePTSForDidCaptureCallback:", -[BWMultiStreamCameraSourceNodeConfiguration livePhotoCaptureEnabled](self->_configuration, "livePhotoCaptureEnabled"));
  }
  if (-[BWFigVideoCaptureDevice smartCameraEnabled](self->_captureDevice, "smartCameraEnabled"))
    v10 = -[BWDetectedFacesRingBuffer faceDetector](self->_detectedFacesRingBuffer, "faceDetector");
  else
    v10 = 0;
  -[BWFigVideoCaptureStream setFaceDetector:](self->_captureStream, "setFaceDetector:", v10);
  if (-[BWFigVideoCaptureDevice smartCameraEnabled](self->_captureDevice, "smartCameraEnabled"))
    v11 = -[BWDetectedObjectsInfoRingBuffer objectDetector](self->_detectedObjectsInfoRingBuffer, "objectDetector");
  else
    v11 = 0;
  -[BWFigVideoCaptureStream setObjectDetector:](self->_captureStream, "setObjectDetector:", v11);
  -[BWMultiStreamCameraSourceNode _registerForStreamNotifications]((uint64_t)self);
  -[BWMultiStreamCameraSourceNode _asynchronouslyPreallocateBufferPools]((uint64_t)self);
  -[BWFigVideoCaptureStream sourceNodeWillStartStreaming](self->_captureStream, "sourceNodeWillStartStreaming");
  v12 = -[BWMultiStreamCameraSourceNode _setStreamOutputsEnabled:streamingOutputs:onDemandStillOutputs:]((uint64_t)self, 1u, -[BWMultiStreamCameraSourceNodeConfiguration deferStreamingOutputsEnable](self->_configuration, "deferStreamingOutputsEnable") ^ 1, 1);
  if (v12)
  {
    v20 = v12;
    v23 = v3;
    LODWORD(v22) = v12;
  }
  else
  {
    if (-[BWFigCaptureStream streaming](-[BWFigVideoCaptureStream stream](self->_captureStream, "stream"), "streaming")
      || -[BWFigVideoCaptureStream suspended](self->_captureStream, "suspended")
      || (v13 = -[BWFigVideoCaptureStream start](self->_captureStream, "start")) == 0)
    {
      -[BWFigVideoCaptureStream sourceNodeDidStartStreaming](self->_captureStream, "sourceNodeDidStartStreaming");
      v14 = -[BWFigVideoCaptureDevice masterCaptureStream](self->_captureDevice, "masterCaptureStream");
      v15 = -[BWFigVideoCaptureDevice isBravoVariant](self->_captureDevice, "isBravoVariant");
      if (-[BWMultiStreamCameraSourceNodeConfiguration pointCloudOutputEnabled](self->_configuration, "pointCloudOutputEnabled"))
      {
        v16 = -[BWMultiStreamCameraSourceNodeConfiguration pointCloudOutputIsSupplementalPointCloudData](self->_configuration, "pointCloudOutputIsSupplementalPointCloudData");
      }
      else
      {
        v16 = 0;
      }
      captureStream = self->_captureStream;
      v18 = captureStream != v14 && v15;
      if (!v18 && !-[BWFigVideoCaptureStream suspended](captureStream, "suspended") && !v16)
        return 1;
      goto LABEL_28;
    }
    v20 = v13;
    v23 = v3;
    LODWORD(v22) = v13;
  }
  FigDebugAssert3();
  -[BWMultiStreamCameraSourceNode makeOutputsLiveIfNeeded](self, "makeOutputsLiveIfNeeded", v22, v23);
  -[BWFigVideoCaptureStream sourceNodeFailedToStartStreaming](self->_captureStream, "sourceNodeFailedToStartStreaming");
  if (!a3)
    return 0;
  v21 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v20, 0);
  result = 0;
  *a3 = v21;
  return result;
}

- (uint64_t)_setStreamOutputsEnabled:(int)a3 streamingOutputs:(int)a4 onDemandStillOutputs:
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  char v31;
  _QWORD *v32;
  char v33;
  char v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = a1;
  v50 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v46 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v4 + 312), "secureMetadataOutputConfiguration"), "copy");
  v5 = 0;
  v6 = 0;
  v7 = *MEMORY[0x1E0D07FD0];
  v47 = *MEMORY[0x1E0D066E8];
  v45 = *MEMORY[0x1E0D066D8];
  v8 = *MEMORY[0x1E0D06718];
  v56 = *MEMORY[0x1E0D06728];
  v55 = *MEMORY[0x1E0D06720];
  v54 = *MEMORY[0x1E0D06760];
  v44 = *MEMORY[0x1E0D066B8];
  v9 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
  v43 = *MEMORY[0x1E0D066C8];
  v10 = 0x1E0CB3000uLL;
  v11 = (_QWORD *)MEMORY[0x1E0D06688];
  v51 = *MEMORY[0x1E0D07FD0];
  do
  {
    v12 = v4 + v9[970];
    if (!*(_BYTE *)(v12 + 504 * v5 + 9))
      goto LABEL_51;
    v13 = *(_DWORD *)(v12 + 504 * v5);
    if (v13 == 2)
    {
      if (!a4)
        goto LABEL_51;
    }
    else if (v13 == 1)
    {
      if (!a3)
        goto LABEL_51;
      *(_BYTE *)(v4 + 10881) = a2;
    }
    v14 = (void *)mscsn_streamOutputIDForOutputIndex(v5);
    if (!objc_msgSend(v14, "isEqualToString:", v7))
    {
      v18 = v9;
      v19 = v4 + v9[970];
      v20 = v5;
      v21 = *(_QWORD *)(v19 + 504 * v5 + 16);
      if (v21 == *(_QWORD *)(v4 + 200))
      {
        if ((objc_msgSend(*(id *)(v4 + 312), "preLTMThumbnailOnPreviewOutputEnabled") & 1) != 0)
        {
LABEL_19:
          if (!v6)
            v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", a2), v47);
LABEL_22:
          v22 = *(_QWORD *)(v4 + v18[970] + 504 * v5 + 16);
          if (v22 == *(_QWORD *)(v4 + 200))
          {
            if ((objc_msgSend(*(id *)(v4 + 312), "postColorProcessingThumbnailOnPreviewOutputEnabled") & 1) != 0)
              goto LABEL_27;
            v22 = *(_QWORD *)(v4 + v18[970] + 504 * v5 + 16);
          }
          if (v22 != *(_QWORD *)(v4 + 208)
            || !objc_msgSend(*(id *)(v4 + 312), "postColorProcessingThumbnailOnVideoCaptureOutputEnabled"))
          {
            v23 = a2;
LABEL_31:
            objc_msgSend(v50, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", v23), v14);
            v5 = v20;
            v9 = v18;
            v7 = v51;
            goto LABEL_51;
          }
LABEL_27:
          if (!v6)
            v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v23 = a2;
          objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", a2), v45);
          goto LABEL_31;
        }
        v21 = *(_QWORD *)(v4 + v18[970] + 504 * v5 + 16);
      }
      if (v21 != *(_QWORD *)(v4 + 208)
        || !objc_msgSend(*(id *)(v4 + 312), "preLTMThumbnailOnVideoCaptureOutputEnabled"))
      {
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    v52 = v5;
    if (!v6)
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    switch((int)v5)
    {
      case 9:
        v15 = objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", a2);
        v16 = v6;
        v17 = v43;
        goto LABEL_50;
      case 10:
        v15 = objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", a2);
        v16 = v6;
        v17 = v44;
        goto LABEL_50;
      case 11:
        v24 = v10;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v25 = (void *)objc_msgSend(*(id *)(v4 + 312), "enabledSemanticMaskTypes");
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        if (v26)
        {
          v27 = v26;
          v42 = v4;
          v28 = *(_QWORD *)v58;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v58 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
              v31 = objc_msgSend(v30, "isEqualToString:", v8, v42);
              v32 = v11;
              if ((v31 & 1) == 0)
              {
                v33 = objc_msgSend(v30, "isEqualToString:", v56);
                v32 = (_QWORD *)MEMORY[0x1E0D066A8];
                if ((v33 & 1) == 0)
                {
                  v34 = objc_msgSend(v30, "isEqualToString:", v55);
                  v32 = (_QWORD *)MEMORY[0x1E0D06698];
                  if ((v34 & 1) == 0)
                  {
                    v35 = objc_msgSend(v30, "isEqualToString:", v54);
                    v32 = (_QWORD *)MEMORY[0x1E0D06710];
                    if (!v35)
                      continue;
                  }
                }
              }
              if (*v32)
                objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v24 + 2024), "numberWithBool:", a2), *v32);
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
          }
          while (v27);
          v4 = v42;
          v7 = v51;
          v5 = v52;
          v10 = v24;
          v9 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
        }
        else
        {
          v5 = v52;
        }
        break;
      case 12:
        objc_msgSend(v46, "setObjectDetectionEnabled:", a2);
        break;
      case 13:
        objc_msgSend(v46, "setEyeReliefStatusDetectionEnabled:", a2);
        break;
      case 18:
        v15 = objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", a2);
        v16 = v6;
        v17 = v47;
LABEL_50:
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);
        break;
      default:
        break;
    }
LABEL_51:
    ++v5;
  }
  while (v5 != 20);
  if (!v46)
  {
    if (!objc_msgSend(v6, "count"))
      goto LABEL_62;
    goto LABEL_59;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(v4 + 104), "secureMetadataOutputConfigurator"), "setConfigurationForPrimaryClient:", v46);
  v7 = v51;
  objc_msgSend((id)objc_msgSend(*(id *)(v4 + 104), "secureMetadataOutputConfigurator"), "setDelegate:", v4);
  if (objc_msgSend(v6, "count"))
  {
LABEL_59:
    if (a2)
    {
      v36 = *(void **)(v4 + 112);
      v37 = *MEMORY[0x1E0D07888];
      v63 = v51;
      v64 = v6;
      v7 = v51;
      objc_msgSend(v36, "setProperty:value:", v37, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
    }
    goto LABEL_61;
  }
  if ((objc_msgSend(v46, "isEmpty") & 1) == 0)
  {
LABEL_61:
    objc_msgSend(v50, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", a2), v7);
    *(_BYTE *)(v4 + 10720) = a2;
  }
LABEL_62:
  v38 = objc_msgSend(*(id *)(v4 + 112), "setProperty:value:", *MEMORY[0x1E0D078A8], v50);
  if (v6 && (a2 & 1) == 0)
  {
    v39 = *(void **)(v4 + 112);
    v40 = *MEMORY[0x1E0D07888];
    v61 = v7;
    v62 = v6;
    objc_msgSend(v39, "setProperty:value:", v40, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
  }
  return v38;
}

- (void)_asynchronouslyPreallocateBufferPools
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  float v8;
  float v9;
  unint64_t v10;
  float v11;
  uint64_t v12;
  char v13;
  float v14;
  NSObject *v15;
  _QWORD v16[7];
  char v17;

  if (a1)
  {
    v2 = 20;
    v3 = a1;
    do
    {
      if (*(_DWORD *)(v3 + 384) == 1 && *(_BYTE *)(v3 + 393) && !*(_BYTE *)(v3 + 480))
      {
        v4 = *(void **)(v3 + 400);
        if (v4)
          v5 = (void *)objc_msgSend(v4, "preparedPixelBufferPool");
        else
          v5 = *(void **)(v3 + 472);
        v6 = *(_DWORD *)(v3 + 504);
        v7 = *(_DWORD *)(v3 + 508);
        objc_msgSend(*(id *)(a1 + 312), "maxFrameRate");
        v9 = v8;
        v10 = objc_msgSend(v5, "capacity");
        objc_msgSend(*(id *)(a1 + 312), "maxFrameRate");
        v12 = 0;
        v13 = 0;
        if (v6 >= 3840 && v7 >= 2160)
        {
          if (v9 < 60.0)
            v14 = 1.5;
          else
            v14 = 1.0;
          if ((float)(v14 * v11) <= (float)v10)
          {
            v12 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 400), "memoryPool"), "newFlushAssertion:", objc_msgSend(v5, "name"));
            v13 = 1;
          }
          else
          {
            v13 = 0;
            v12 = 0;
          }
        }
        v15 = *(NSObject **)(a1 + 152);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __70__BWMultiStreamCameraSourceNode__asynchronouslyPreallocateBufferPools__block_invoke;
        v16[3] = &unk_1E49228D8;
        v17 = v13;
        v16[5] = v12;
        v16[6] = v3 + 384;
        v16[4] = v5;
        dispatch_async(v15, v16);
      }
      v3 += 504;
      --v2;
    }
    while (v2);
  }
}

- (void)makeOutputsLiveIfNeeded
{
  void *v3;
  BOOL *p_enabled;
  uint64_t v5;
  uint64_t v6;
  OS_dispatch_queue **p_bufferServicingQueue;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[6];
  int v11;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  p_enabled = &self->_outputsStorage[0].enabled;
  v5 = 20;
  do
  {
    if (*p_enabled && *(_QWORD *)(p_enabled + 7))
      objc_msgSend(v3, "addObject:");
    p_enabled += 504;
    --v5;
  }
  while (v5);
  v6 = 0;
  p_bufferServicingQueue = &self->_outputsStorage[0].bufferServicingQueue;
  v8 = MEMORY[0x1E0C809B0];
  do
  {
    if (*((_BYTE *)p_bufferServicingQueue - 23))
    {
      v9 = *p_bufferServicingQueue;
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __56__BWMultiStreamCameraSourceNode_makeOutputsLiveIfNeeded__block_invoke;
      block[3] = &unk_1E491EEF8;
      v11 = v6;
      block[4] = self;
      block[5] = v3;
      dispatch_async(v9, block);
    }
    p_bufferServicingQueue += 63;
    ++v6;
  }
  while (v6 != 20);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  int64_t UpTimeNanoseconds;
  __IOSurface *IOSurface;
  dispatch_queue_t *v8;
  CMTime v9;
  CMTime time;

  memset(&v9, 0, sizeof(v9));
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v9, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    time = *a3;
    CMTimeGetSeconds(&time);
    time = v9;
    CMTimeGetSeconds(&time);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  v8 = *(dispatch_queue_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v8, 0, a2, (UInt8 *)&time);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_2(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  int64_t UpTimeNanoseconds;
  __IOSurface *IOSurface;
  dispatch_queue_t *v8;
  CMTime v9;
  CMTime time;

  memset(&v9, 0, sizeof(v9));
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v9, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    time = *a3;
    CMTimeGetSeconds(&time);
    time = v9;
    CMTimeGetSeconds(&time);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  v8 = *(dispatch_queue_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v8, 1u, a2, (UInt8 *)&time);
}

uint64_t __56__BWMultiStreamCameraSourceNode_makeOutputsLiveIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[BWMultiStreamCameraSourceNode _nodeOutputsMadeLiveByStreamOutputIndex:](*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 48));
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((v7 == *(void **)(*(_QWORD *)(a1 + 32) + 384 + 504 * *(int *)(a1 + 48) + 16)
           || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8) & 1) == 0)
          && !objc_msgSend(v7, "liveFormat", (_QWORD)v8))
        {
          objc_msgSend(v7, "makeConfiguredFormatLive");
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
    }
    while (result);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 384 + 504 * *(int *)(a1 + 48) + 8) = 1;
  return result;
}

- (void)_nodeOutputsMadeLiveByStreamOutputIndex:(uint64_t)a1
{
  uint64_t v4;
  void *v6;
  void *v7;

  if (!a1)
    return 0;
  v4 = a1 + 384;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = v6;
  if (*(_QWORD *)(v4 + 504 * a2 + 16))
    objc_msgSend(v6, "addObject:");
  if ((*(_BYTE *)(v4 + 504 * a2 + 4) & 4) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 312), "detectedObjectsOutputEnabled"))
      objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 232));
    if (objc_msgSend(*(id *)(a1 + 312), "stillImageOutputEnabled"))
      objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 216));
    if (objc_msgSend(*(id *)(a1 + 312), "sensorRawStillImageOutputEnabled"))
      objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 224));
  }
  return v7;
}

- (uint64_t)_secondaryScalerSupportsVideoCaptureDimensions
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  unint64_t v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  int v12;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(*(id *)(result + 120), "objectAtIndexedSubscript:", *(int *)(result + 320));
    if (v2)
    {
      v3 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EE8]);
      result = objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FF0]);
      if (result)
      {
        v4 = (void *)result;
        objc_msgSend(*(id *)(v1 + 312), "visOverscan");
        v7 = -[BWMultiStreamCameraSourceNode _calculateVideoCaptureDimensionsWithVISOverscan:](v1, v5, v6);
        objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D08030]), "floatValue");
        if (v8 == 0.0)
        {
          return (int)v7 < 2305;
        }
        else
        {
          v9 = v8;
          v10 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D08050]);
          v11 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D08040]);
          LODWORD(v10) = FigCaptureRoundFloatToMultipleOf(2, v9 * (float)objc_msgSend(v10, "integerValue"));
          v12 = FigCaptureRoundFloatToMultipleOf(2, v9 * (float)objc_msgSend(v11, "integerValue"));
          return (int)v10 >= (int)v7 && v12 >= SHIDWORD(v7);
        }
      }
    }
    else
    {
      FigDebugAssert3();
      return 0;
    }
  }
  return result;
}

- (id)colorInfoForOutput:(id)a3
{
  uint64_t v5;

  if (self->_videoCaptureOutput == a3)
  {
    if (!-[BWMultiStreamCameraSourceNodeConfiguration videoCaptureOutputEnabled](self->_configuration, "videoCaptureOutputEnabled"))goto LABEL_12;
    v5 = 10624;
  }
  else
  {
    if (self->_previewOutput != a3)
    {
      if (self->_stillImageOutput != a3)
        return 0;
      if (-[BWMultiStreamCameraSourceNodeConfiguration stillImageOutputEnabled](self->_configuration, "stillImageOutputEnabled"))
      {
        v5 = 10688;
        return *(Class *)((char *)&self->super.super.super.isa + v5);
      }
LABEL_12:
      FigDebugAssert3();
      return 0;
    }
    if (!-[BWMultiStreamCameraSourceNodeConfiguration previewOutputEnabled](self->_configuration, "previewOutputEnabled"))goto LABEL_12;
    v5 = 10600;
  }
  return *(Class *)((char *)&self->super.super.super.isa + v5);
}

void __70__BWMultiStreamCameraSourceNode__asynchronouslyPreallocateBufferPools__block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 487) = objc_msgSend(*(id *)(a1 + 32), "prefetch:lastEmittedSurfaceID:", (*(_DWORD *)(*(_QWORD *)(a1 + 48) + 84) + 2), 0) ^ 1;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "preallocate");
  }
}

- (BWNodeOutput)detectedObjectsOutput
{
  return self->_detectedObjectsOutput;
}

- (BWNodeOutput)stillImageSensorRawOutput
{
  return self->_stillImageSensorRawOutput;
}

- ($2825F4736939C4A6D3AD43837233062D)ultraHighResSensorRawStillImageOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_ultraHighResSensorRawStillImageOutputDimensions;
}

- (float)geometricDistortionCorrectionStrengthOnStreamingOutputs
{
  return self->_geometricDistortionCorrectionStrengthOnStreamingOutputs;
}

- (void)setDetectedFacesFilterDelegate:(id)a3
{
  self->_detectedFacesFilterDelegate = (BWDetectedFacesFilterDelegate *)a3;
}

- (uint64_t)_retrieveCameraCharacterizationDataForCameraIntrinsicMatrixDelivery
{
  uint64_t v1;
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  float v4;

  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 184), "isEqualToString:", *MEMORY[0x1E0D05A40]);
    if ((result & 1) == 0)
    {
      v2 = (const __CFDictionary *)objc_msgSend(*(id *)(v1 + 104), "moduleInfo");
      v3 = (const __CFDictionary *)objc_msgSend(*(id *)(v1 + 104), "sensorIDDictionary");
      objc_msgSend(*(id *)(v1 + 104), "pixelSize");
      return FigMotionGetCameraCharacterizationData(v2, v3, v4, *(_QWORD *)(v1 + 184), v1 + 10464);
    }
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  BWFigCaptureStream *stream;
  BWPixelBufferPool **p_internalPixelBufferPool;
  uint64_t v5;
  BWPixelBufferPool *v6;
  BWPixelBufferPool *v7;
  BOOL *p_pixelFormatIsTenBit;
  uint64_t v9;
  OpaqueVTPixelTransferSession *stillReflectionTransferSession;
  opaqueCMFormatDescription *stillReflectionFormatDescription;
  OpaqueVTPixelTransferSession *stillReflectionSecondaryTransferSession;
  opaqueCMFormatDescription *stillReflectionSecondaryFormatDescription;
  opaqueCMFormatDescription *depthOutputFormatDescription;
  opaqueCMFormatDescription *focusPixelDataFormatDescription;
  opaqueCMFormatDescription *visionDataFormatDescription;
  OpaqueVTHDRMetadataGenerationSession *hdrMetadataSession;
  NSObject *streamConfigurationQueue;
  objc_super v19;

  stream = self->_stream;
  if (stream)
    CFRelease(stream);

  p_internalPixelBufferPool = &self->_outputsStorage[0].internalPixelBufferPool;
  v5 = 0x1FFFFFFFFFFFFB14;
  do
  {

    v6 = p_internalPixelBufferPool[v5 + 1252];
    if (v6)
      CFRelease(v6);
    v7 = p_internalPixelBufferPool[v5 + 1255];
    if (v7)
      CFRelease(v7);

    v5 += 63;
  }
  while (v5 * 8);

  p_pixelFormatIsTenBit = &self->_outputsStorage[0].pixelFormatIsTenBit;
  v9 = 20;
  do
  {
    *(_WORD *)(p_pixelFormatIsTenBit - 1) = 0;
    p_pixelFormatIsTenBit += 504;
    --v9;
  }
  while (v9);
  dispatch_sync((dispatch_queue_t)self->_preAllocationQueue, &__block_literal_global_85);

  stillReflectionTransferSession = self->_stillReflectionTransferSession;
  if (stillReflectionTransferSession)
    CFRelease(stillReflectionTransferSession);
  stillReflectionFormatDescription = self->_stillReflectionFormatDescription;
  if (stillReflectionFormatDescription)
    CFRelease(stillReflectionFormatDescription);
  stillReflectionSecondaryTransferSession = self->_stillReflectionSecondaryTransferSession;
  if (stillReflectionSecondaryTransferSession)
    CFRelease(stillReflectionSecondaryTransferSession);
  stillReflectionSecondaryFormatDescription = self->_stillReflectionSecondaryFormatDescription;
  if (stillReflectionSecondaryFormatDescription)
    CFRelease(stillReflectionSecondaryFormatDescription);
  depthOutputFormatDescription = self->_depthOutputFormatDescription;
  if (depthOutputFormatDescription)
    CFRelease(depthOutputFormatDescription);
  focusPixelDataFormatDescription = self->_focusPixelDataFormatDescription;
  if (focusPixelDataFormatDescription)
    CFRelease(focusPixelDataFormatDescription);

  visionDataFormatDescription = self->_visionDataFormatDescription;
  if (visionDataFormatDescription)
    CFRelease(visionDataFormatDescription);
  hdrMetadataSession = self->_hdrMetadataSession;
  if (hdrMetadataSession)
    CFRelease(hdrMetadataSession);

  streamConfigurationQueue = self->_streamConfigurationQueue;
  if (streamConfigurationQueue)
  {
    dispatch_sync(streamConfigurationQueue, &__block_literal_global_865);

  }
  v19.receiver = self;
  v19.super_class = (Class)BWMultiStreamCameraSourceNode;
  -[BWNode dealloc](&v19, sel_dealloc);
}

- (int)prepareForStillImageCaptureWithFirmwareStillImageOutputRetainedBufferCountOverride:(int)a3 clientBracketCount:(int)a4 enableSushiRawAttachmentOption:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v9;
  int currentFirmwareStillImageOutputRetainedBufferCount;
  _BOOL4 stillImageOutputSushiRawAttachmentOptionEnabled;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  NSString *stillImageStreamOutputID;
  _QWORD v21[2];

  v5 = a5;
  v21[1] = *MEMORY[0x1E0C80C00];
  if (!-[BWMultiStreamCameraSourceNodeConfiguration stillImageOutputEnabled](self->_configuration, "stillImageOutputEnabled")|| !-[BWMultiStreamCameraSourceNodeConfiguration usesFirmwareStillImageOutput](self->_configuration, "usesFirmwareStillImageOutput"))
  {
    if (-[BWMultiStreamCameraSourceNodeConfiguration stillImageOutputEnabled](self->_configuration, "stillImageOutputEnabled"))
    {
      -[BWMultiStreamCameraSourceNodeConfiguration usesFirmwareStillImageOutput](self->_configuration, "usesFirmwareStillImageOutput");
    }
    return 0;
  }
  self->_firmwareStillImageOutputRetainedBufferCountOverride = a3;
  v9 = -[BWMultiStreamCameraSourceNode _firmwareStillImageOutputRetainedBufferCountForClientBracketCount:]((uint64_t)self, a4);
  currentFirmwareStillImageOutputRetainedBufferCount = self->_currentFirmwareStillImageOutputRetainedBufferCount;
  stillImageOutputSushiRawAttachmentOptionEnabled = self->_stillImageOutputSushiRawAttachmentOptionEnabled;
  if ((_DWORD)v9 == currentFirmwareStillImageOutputRetainedBufferCount
    && stillImageOutputSushiRawAttachmentOptionEnabled == v5)
  {
    return 0;
  }
  v13 = v9;
  if (!-[BWFigVideoCaptureStream started](self->_captureStream, "started"))
    return 0;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((_DWORD)v13 != currentFirmwareStillImageOutputRetainedBufferCount)
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D07F60]);
  }
  if (stillImageOutputSushiRawAttachmentOptionEnabled != v5)
  {
    if (v5
      && !-[BWMultiStreamCameraSourceNodeConfiguration stillImageOutputSushiRawAttachmentOptionSupportEnabled](self->_configuration, "stillImageOutputSushiRawAttachmentOptionSupportEnabled"))
    {
      return -12780;
    }
    v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D07C58]);
  }
  stillImageStreamOutputID = self->_stillImageStreamOutputID;
  v21[0] = v14;
  v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &stillImageStreamOutputID, 1);
  v18 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E0D07888], v17);
  if (v18)
  {
    FigDebugAssert3();
  }
  else
  {
    self->_currentFirmwareStillImageOutputRetainedBufferCount = v13;
    self->_stillImageOutputSushiRawAttachmentOptionEnabled = v5;
  }
  return v18;
}

- (BWVideoFormatRequirements)_videoFormatRequirementsForPreLTMThumbnailOutput
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _DWORD *v6;
  BWVideoFormatRequirements *v7;
  int v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = 0;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 112), "getProperty:error:", *MEMORY[0x1E0D07888], &v9);
  if (v9
    || (v3 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FD0]),
        (v4 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D066E0])) == 0))
  {
    FigDebugAssert3();
    return 0;
  }
  v5 = v4;
  v6 = (_DWORD *)(a1 + 384);
  v6[2293] = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F08]), "intValue");
  v6[2294] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F18]), "intValue");
  v6[2298] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "intValue");
  v6[2299] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "intValue");
  v6[2289] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F10]), "intValue");
  v7 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v7, "setWidth:", (int)v6[2298]);
  -[BWVideoFormatRequirements setHeight:](v7, "setHeight:", (int)v6[2299]);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v7, "setBytesPerRowAlignment:", (int)v6[2293]);
  -[BWVideoFormatRequirements setPlaneAlignment:](v7, "setPlaneAlignment:", (int)v6[2294]);
  -[BWVideoFormatRequirements setHeightAlignment:](v7, "setHeightAlignment:", 1);
  v10[0] = objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F58]);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v7, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1));
  return v7;
}

- (BWVideoFormatRequirements)_videoFormatRequirementsForPostColorProcessingThumbnailOutput
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  BWVideoFormatRequirements *v5;
  int v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v7 = 0;
  v1 = (void *)objc_msgSend(*(id *)(a1 + 112), "getProperty:error:", *MEMORY[0x1E0D07888], &v7);
  if (v7
    || (v2 = (void *)objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FD0]),
        (v3 = objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D066D0])) == 0))
  {
    FigDebugAssert3();
    return 0;
  }
  v4 = (void *)v3;
  v5 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v5, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "intValue"));
  -[BWVideoFormatRequirements setHeight:](v5, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "intValue"));
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v5, "setBytesPerRowAlignment:", (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F08]), "intValue"));
  -[BWVideoFormatRequirements setPlaneAlignment:](v5, "setPlaneAlignment:", (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F18]), "intValue"));
  -[BWVideoFormatRequirements setHeightAlignment:](v5, "setHeightAlignment:", 1);
  v8[0] = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F58]);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v5, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1));
  return v5;
}

- (uint64_t)_ultraHighResolutionNondisruptiveStreamingFormatIndex
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (objc_msgSend((id)objc_msgSend(*(id *)(result + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"), "count"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v2 = (void *)objc_msgSend(*(id *)(v1 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices", 0);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)v12;
        v6 = *MEMORY[0x1E0D07ED0];
        v7 = *MEMORY[0x1E0D07EC8];
        while (2)
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v12 != v5)
              objc_enumerationMutation(v2);
            v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
            v10 = (void *)objc_msgSend(*(id *)(v1 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(v9, "intValue"));
            if (FigCaptureSourceSensorRawHighResolutionFlavorFromDimensions(objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v6), "intValue") | (unint64_t)(objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v7), "intValue") << 32)) == 2)
              return objc_msgSend(v9, "intValue");
          }
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v4)
            continue;
          break;
        }
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

- (BWPointCloudFormatRequirements)_videoFormatRequirementsForPointCloudOutput
{
  void *v2;
  void *v3;
  void *v4;
  BWPointCloudFormatRequirements *v5;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(a1[14], "getProperty:error:", *MEMORY[0x1E0D07888], 0);
  if (!v2)
    return 0;
  v3 = (void *)*MEMORY[0x1E0D07FD8];
  v4 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FD8]);
  v5 = objc_alloc_init(BWPointCloudFormatRequirements);
  -[BWPointCloudFormatRequirements setSupportedDataFormats:](v5, "setSupportedDataFormats:", -[BWMultiStreamCameraSourceNode _supportedPixelFormatsForOutputID:](a1, v3));
  -[BWPointCloudFormatRequirements setDataBufferSize:](v5, "setDataBufferSize:", (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F28]), "intValue"));
  -[BWPointCloudFormatRequirements setMaxPoints:](v5, "setMaxPoints:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F50]), "unsignedLongLongValue"));
  return v5;
}

- (BWVideoFormatRequirements)_videoFormatRequirementsForLightSourceMaskOutput
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _DWORD *v6;
  BWVideoFormatRequirements *v7;
  int v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = 0;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 112), "getProperty:error:", *MEMORY[0x1E0D07888], &v9);
  if (v9
    || (v3 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FD0]),
        (v4 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D066C0])) == 0))
  {
    FigDebugAssert3();
    return 0;
  }
  v5 = v4;
  v6 = (_DWORD *)(a1 + 384);
  v6[1159] = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F08]), "intValue");
  v6[1160] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F18]), "intValue");
  v6[1164] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "intValue");
  v6[1165] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "intValue");
  v6[1155] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F10]), "intValue");
  v7 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v7, "setWidth:", (int)v6[1164]);
  -[BWVideoFormatRequirements setHeight:](v7, "setHeight:", (int)v6[1165]);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v7, "setBytesPerRowAlignment:", (int)v6[1159]);
  -[BWVideoFormatRequirements setPlaneAlignment:](v7, "setPlaneAlignment:", (int)v6[1160]);
  -[BWVideoFormatRequirements setHeightAlignment:](v7, "setHeightAlignment:", 1);
  v10[0] = objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F58]);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v7, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1));
  return v7;
}

- (BWPointCloudFormatRequirements)_videoFormatRequirementsForKeypointDescriptorDataOutput
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BWPointCloudFormatRequirements *v6;
  int v8;

  if (!a1)
    return 0;
  v8 = 0;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 112), "getProperty:error:", *MEMORY[0x1E0D07888], &v8);
  if (v8
    || (v3 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FD0]),
        (v4 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D066B0])) == 0))
  {
    FigDebugAssert3();
    return 0;
  }
  v5 = v4;
  *(_DWORD *)(a1 + 5508) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F10]), "intValue");
  v6 = objc_alloc_init(BWPointCloudFormatRequirements);
  -[BWPointCloudFormatRequirements setDataBufferSize:](v6, "setDataBufferSize:", (int)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F28]), "intValue"));
  -[BWPointCloudFormatRequirements setSupportedDataFormats:](v6, "setSupportedDataFormats:", &unk_1E4A01460);
  return v6;
}

- (BWVideoFormatRequirements)_videoFormatRequirementsForSemanticMaskType:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BWVideoFormatRequirements *v8;
  int v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v10 = 0;
  v3 = objc_msgSend(*(id *)(a1 + 112), "getProperty:error:", *MEMORY[0x1E0D07888], &v10);
  if (v10
    || (v4 = (void *)v3, (v5 = mscsn_semanticMaskOutputConfigurationKeyForSemanticMaskType(a2)) == 0)
    || (v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FD0]), "objectForKeyedSubscript:", v5)) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  v7 = (void *)v6;
  v8 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v8, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "intValue"));
  -[BWVideoFormatRequirements setHeight:](v8, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "intValue"));
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v8, "setBytesPerRowAlignment:", (int)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F08]), "intValue"));
  -[BWVideoFormatRequirements setPlaneAlignment:](v8, "setPlaneAlignment:", (int)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F18]), "intValue"));
  -[BWVideoFormatRequirements setHeightAlignment:](v8, "setHeightAlignment:", 1);
  v11[0] = objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F58]);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v8, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1));
  return v8;
}

- (id)colorInfoForNonColorManagedDevicesForOutputID:(id *)result
{
  id *v3;
  unint64_t v4;

  if (result)
  {
    v3 = result;
    v4 = -[BWMultiStreamCameraSourceNode videoCaptureDimensionsForColorspace]((uint64_t)result);
    if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D07FF8]) & 1) != 0
      || objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D08000]))
    {
      return (id *)+[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", 1);
    }
    else
    {
      return (id *)+[BWVideoFormat colorInfoWithSourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:](BWVideoFormat, "colorInfoWithSourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:", objc_msgSend(v3[39], "colorSpace"), objc_msgSend(v3[39], "clientVideoFormat"), v4, objc_msgSend(v3[39], "clientVideoFormat"));
    }
  }
  return result;
}

__n128 __39__BWMultiStreamCameraSourceNode_start___block_invoke(_QWORD *a1, opaqueCMSampleBuffer *a2)
{
  uint64_t v4;
  uint64_t v5;
  __n128 *v6;
  __n128 result;
  CMTime v8;

  v4 = a1[6];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 10728), "transferFacesToSampleBuffer:totalSensorCropRect:", a2, *(double *)(*(_QWORD *)(v4 + 8) + 32), *(double *)(*(_QWORD *)(v4 + 8) + 40), *(double *)(*(_QWORD *)(v4 + 8) + 48), *(double *)(*(_QWORD *)(v4 + 8) + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 10736), "transferObjectsToSampleBuffer:totalSensorCropRect:", a2, *(double *)(*(_QWORD *)(a1[6] + 8) + 32), *(double *)(*(_QWORD *)(a1[6] + 8) + 40), *(double *)(*(_QWORD *)(a1[6] + 8) + 48), *(double *)(*(_QWORD *)(a1[6] + 8) + 56));
  v5 = a1[4];
  if (*(_DWORD *)(v5 + 2072) && !*(_BYTE *)(v5 + 2382))
    -[BWMultiStreamCameraSourceNode _tallyCompressedIOSurfaceStatsForSBuf:outputStorage:](v5, a2, v5 + 1896);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 216), "emitSampleBuffer:", a2);
  v6 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 384);
  CMSampleBufferGetPresentationTimeStamp(&v8, a2);
  result = *(__n128 *)&v8.value;
  v6[99].n128_u64[0] = v8.epoch;
  v6[98] = result;
  return result;
}

- (void)_tallyCompressedIOSurfaceStatsForSBuf:(uint64_t)a3 outputStorage:
{
  _OWORD *v5;
  double Seconds;
  unint64_t v7;
  float v8;
  uint64_t v10;
  CMTime v11;
  _OWORD v12[8];
  _BYTE time[32];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_DWORD *)(a3 + 176) == 4 && *(_BYTE *)(a3 + 485))
    {
      memset(&v11, 0, sizeof(v11));
      CMSampleBufferGetPresentationTimeStamp(&v11, sbuf);
      v5 = (_OWORD *)(a3 + 460);
      if ((*(_DWORD *)(a3 + 472) & 0x1D) == 1)
      {
        *(CMTime *)time = v11;
        Seconds = CMTimeGetSeconds((CMTime *)time);
        *(_OWORD *)time = *v5;
        *(_QWORD *)&time[16] = *(_QWORD *)(a3 + 476);
        if (Seconds - CMTimeGetSeconds((CMTime *)time) > 1.0)
        {
          *v5 = *(_OWORD *)&v11.value;
          *(_QWORD *)(a3 + 476) = v11.epoch;
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          memset(v12, 0, sizeof(v12));
          memset(time, 0, sizeof(time));
          if (!BWSampleBufferComputeIOSurfaceCompressionHistogram(sbuf))
          {
            v7 = 0;
            ++*(_DWORD *)(a3 + 456);
            do
            {
              *(int64x2_t *)(a3 + v7 + 200) = vaddq_s64(*(int64x2_t *)(a3 + v7 + 200), *(int64x2_t *)&time[v7]);
              *(int64x2_t *)(a3 + v7 + 328) = vaddq_s64(*(int64x2_t *)(a3 + v7 + 328), (int64x2_t)v12[v7 / 0x10]);
              v7 += 16;
            }
            while (v7 != 128);
          }
        }
      }
      else
      {
        *v5 = *(_OWORD *)&v11.value;
        *(_QWORD *)(a3 + 476) = v11.epoch;
      }
    }
    else if (*(_QWORD *)(a3 + 168))
    {
      *(_QWORD *)time = 0;
      *(_QWORD *)&v12[0] = 0;
      v8 = BWSampleBufferComputeIOSurfaceCompressionRatio(sbuf, (unint64_t *)time, (unint64_t *)v12);
      if (v8 > 0.0 && v8 <= 1.0)
      {
        objc_msgSend(*(id *)(a3 + 168), "addDataPoint:", v8);
        v10 = *(_QWORD *)(a3 + 192) + *(_QWORD *)&v12[0];
        *(_QWORD *)(a3 + 184) += *(_QWORD *)time;
        *(_QWORD *)(a3 + 192) = v10;
      }
    }
  }
}

- (BOOL)stop:(id *)a3
{
  double v5;
  NSObject *streamConfigurationQueue;
  int v7;
  int v8;
  BWStreamOutputStorage *outputsStorage;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BWStats *ioSurfaceCompressionRatioStats;
  BWStats *ioSurfaceCompressionRatioStatsForRaw;

  if (-[BWMultiStreamCameraSourceNodeConfiguration deferStreamingOutputsEnable](self->_configuration, "deferStreamingOutputsEnable"))
  {
    -[BWFigVideoCaptureDevice setZoomFactorChangedDelegate:forPortType:](self->_captureDevice, "setZoomFactorChangedDelegate:forPortType:", 0, self->_portType);
  }
  if (!self->_emitsFramesWhileStopping)
    -[BWMultiStreamCameraSourceNode _markEndOfLiveOnAllOutputs]((uint64_t)self);
  self->_stopStreamConfigurationUpdates = 1;
  streamConfigurationQueue = self->_streamConfigurationQueue;
  if (streamConfigurationQueue)
    dispatch_sync(streamConfigurationQueue, &__block_literal_global_898);
  LODWORD(v5) = 2.0;
  if (!self->_emitsFramesWhileStopping)
    *(float *)&v5 = 0.0;
  -[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", *MEMORY[0x1E0D073F0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5));
  -[BWFigVideoCaptureStream sourceNodeWillStopStreaming](self->_captureStream, "sourceNodeWillStopStreaming");
  if (-[BWFigCaptureStream streaming](-[BWFigVideoCaptureStream stream](self->_captureStream, "stream"), "streaming")
    && !-[BWFigVideoCaptureStream suspended](self->_captureStream, "suspended"))
  {
    if (self->_keepISPStreamingWhenStopping)
      v8 = -[BWMultiStreamCameraSourceNode _setStreamOutputsEnabled:streamingOutputs:onDemandStillOutputs:]((uint64_t)self, 0, self->_streamingOutputsEnabled, 1);
    else
      v8 = -[BWFigVideoCaptureStream stop](self->_captureStream, "stop");
    v7 = v8;
  }
  else
  {
    v7 = 0;
  }
  -[BWMultiStreamCameraSourceNode _flushOutRemainingBuffers]((uint64_t)self);
  if (self->_emitsFramesWhileStopping)
    -[BWMultiStreamCameraSourceNode _markEndOfLiveOnAllOutputs]((uint64_t)self);
  outputsStorage = self->_outputsStorage;
  v10 = 393;
  v11 = 20;
  do
  {
    *((_BYTE *)&self->super.super.super.isa + v10) = 0;
    v10 += 504;
    --v11;
  }
  while (v11);
  -[BWFigVideoCaptureStream sourceNodeDidStopStreaming:](self->_captureStream, "sourceNodeDidStopStreaming:", self->_keepISPStreamingWhenStopping);
  -[BWMultiStreamCameraSourceNode _unregisterStreamOutputHandlers]((uint64_t)self);
  if (-[BWMultiStreamCameraSourceNodeConfiguration stillImageOutputEnabled](self->_configuration, "stillImageOutputEnabled")&& !-[BWMultiStreamCameraSourceNodeConfiguration usesFirmwareStillImageOutput](self->_configuration, "usesFirmwareStillImageOutput"))
  {
    -[BWFigVideoCaptureStream setStillImageBufferTimeMachineHandler:](self->_captureStream, "setStillImageBufferTimeMachineHandler:", 0);
  }
  -[BWMultiStreamCameraSourceNode _unregisterFromStreamNotifications]((uint64_t)self);
  v12 = 20;
  do
  {
    if (outputsStorage->pixelBufferCompressionType)
      -[BWMultiStreamCameraSourceNode _reportIOSurfaceCompressionCoreAnalyticsData:]((uint64_t)self, (uint64_t)outputsStorage);
    ioSurfaceCompressionRatioStats = outputsStorage->ioSurfaceCompressionRatioStats;
    if (ioSurfaceCompressionRatioStats)
    {

      outputsStorage->ioSurfaceCompressionRatioStats = 0;
      outputsStorage->totalCompressedDataSize = 0;
      outputsStorage->totalUncompressedDataSize = 0;
    }
    ++outputsStorage;
    --v12;
  }
  while (v12);
  ioSurfaceCompressionRatioStatsForRaw = self->_ioSurfaceCompressionRatioStatsForRaw;
  if (ioSurfaceCompressionRatioStatsForRaw)
  {
    if (-[BWStats numberOfSamples](ioSurfaceCompressionRatioStatsForRaw, "numberOfSamples"))
      -[BWMultiStreamCameraSourceNode _reportIOSurfaceCompressionCoreAnalyticsDataForRaw]((uint64_t)self);

    self->_ioSurfaceCompressionRatioStatsForRaw = 0;
    self->_totalCompressedDataSizeForRaw = 0;
    self->_totalUncompressedDataSizeForRaw = 0;
  }
  if (a3 && v7)
    *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v7, 0);
  return v7 == 0;
}

- (void)_markEndOfLiveOnAllOutputs
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[7];
  int v9;

  if (a1)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = 20;
    v4 = a1;
    do
    {
      if (*(_BYTE *)(v4 + 393) && *(_QWORD *)(v4 + 400))
        objc_msgSend(v2, "addObject:");
      v4 += 504;
      --v3;
    }
    while (v3);
    v5 = MEMORY[0x1E0C809B0];
    v6 = a1;
    do
    {
      if (*(_BYTE *)(v6 + 393))
      {
        v7 = *(NSObject **)(v6 + 416);
        v8[0] = v5;
        v8[1] = 3221225472;
        v8[2] = __59__BWMultiStreamCameraSourceNode__markEndOfLiveOnAllOutputs__block_invoke;
        v8[3] = &unk_1E4921268;
        v8[5] = v2;
        v8[6] = v6 + 384;
        v9 = v3;
        v8[4] = a1;
        dispatch_async(v7, v8);
      }
      ++v3;
      v6 += 504;
    }
    while (v3 != 20);
  }
}

- (uint64_t)_flushOutRemainingBuffers
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  if (result)
  {
    v1 = (id *)result;
    v2 = 0;
    v3 = result + 32;
    v4 = MEMORY[0x1E0C809B0];
    do
    {
      v5 = *(NSObject **)(v3 + 384);
      v6[0] = v4;
      v6[1] = 3221225472;
      v6[2] = __58__BWMultiStreamCameraSourceNode__flushOutRemainingBuffers__block_invoke;
      v6[3] = &unk_1E4920568;
      v6[4] = v1;
      v7 = v2;
      dispatch_sync(v5, v6);
      ++v2;
      v3 += 504;
    }
    while (v2 != 20);
    objc_msgSend(v1[18], "flush");
    objc_msgSend(v1[1317], "removeAllObjects");
    objc_msgSend(v1[1341], "flush");
    return objc_msgSend(v1[1342], "flush");
  }
  return result;
}

- (uint64_t)_unregisterStreamOutputHandlers
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    mscsn_setStreamOutputBufferHandler(*(void **)(result + 112), *MEMORY[0x1E0D07FE0], 0, 0);
    if (*(_BYTE *)(v1 + 10976))
    {
      mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E0D07FF0], 0, 0);
      *(_BYTE *)(v1 + 10976) = 0;
    }
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E0D07FC8], 0, 0);
    v2 = *MEMORY[0x1E0D07FF8];
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E0D07FF8], 0, 0);
    if (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 112), "getPropertyIfSupported:error:", CFSTR("CompressedStillImageCaptureSupported"), 0), "BOOLValue"))mscsn_setStreamOutputBlockBufferHandler(*(void **)(v1 + 112), v2, 0);
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E0D08000], 0, 0);
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E0D08008], 0, 0);
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E0D08010], 0, 0);
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E0D07FC0], 0, 0);
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E0D07FD8], 0, 0);
    return mscsn_setStreamOutputDictionaryHandler(*(void **)(v1 + 112), *MEMORY[0x1E0D07FD0], 0);
  }
  return result;
}

- (uint64_t)_unregisterFromStreamNotifications
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 112), "unregisterForNotification:listener:", *MEMORY[0x1E0D06FF0], result);
    objc_msgSend(*(id *)(v1 + 112), "unregisterForNotification:listener:", CFSTR("Discontinuity"), v1);
    result = objc_msgSend(*(id *)(v1 + 312), "depthOutputEnabled");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(v1 + 112), "unregisterForNotification:listener:", *MEMORY[0x1E0D07000], v1);
  }
  return result;
}

- (uint64_t)_reportIOSurfaceCompressionCoreAnalyticsData:(uint64_t)result
{
  uint64_t v3;
  BWIOSurfaceCompressionHistogramAnalyticsPayload *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (result)
  {
    if (*(_DWORD *)(a2 + 456))
    {
      v3 = result;
      v4 = objc_alloc_init(BWIOSurfaceCompressionHistogramAnalyticsPayload);
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setPortType:](v4, "setPortType:", *(_QWORD *)(v3 + 184));
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setBufferHeight:](v4, "setBufferHeight:", *(unsigned int *)(a2 + 124));
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setNodeType:](v4, "setNodeType:", 1);
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setPixelFormatIsTenBit:](v4, "setPixelFormatIsTenBit:", *(unsigned __int8 *)(a2 + 484));
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setNumberOfSamples:](v4, "setNumberOfSamples:", *(unsigned int *)(a2 + 456));
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setLumaCompressionHistogram:](v4, "setLumaCompressionHistogram:", a2 + 200);
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setChromaCompressionHistogram:](v4, "setChromaCompressionHistogram:", a2 + 328);
    }
    else
    {
      result = objc_msgSend(*(id *)(a2 + 168), "numberOfSamples");
      if (!result)
        return result;
      v4 = objc_alloc_init(BWIOSurfaceCompressionStatisticsAnalyticsPayload);
      objc_msgSend(*(id *)(a2 + 168), "average");
      *(float *)&v5 = v5;
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setAverageRatio:](v4, "setAverageRatio:", v5);
      objc_msgSend(*(id *)(a2 + 168), "min");
      *(float *)&v6 = v6;
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setMinRatio:](v4, "setMinRatio:", v6);
      objc_msgSend(*(id *)(a2 + 168), "max");
      *(float *)&v7 = v7;
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setMaxRatio:](v4, "setMaxRatio:", v7);
      objc_msgSend(*(id *)(a2 + 168), "standardDeviation");
      *(float *)&v8 = v8;
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setStandardDeviation:](v4, "setStandardDeviation:", v8);
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setNumberOfSamples:](v4, "setNumberOfSamples:", objc_msgSend(*(id *)(a2 + 168), "numberOfSamples"));
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setCompressionType:](v4, "setCompressionType:", *(unsigned int *)(a2 + 176));
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setBufferHeight:](v4, "setBufferHeight:", *(unsigned int *)(a2 + 124));
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setTotalCompressedSize:](v4, "setTotalCompressedSize:", *(_QWORD *)(a2 + 184));
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setTotalUncompressedSize:](v4, "setTotalUncompressedSize:", *(_QWORD *)(a2 + 192));
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setNodeType:](v4, "setNodeType:", 1);
    }
    return -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v4);
  }
  return result;
}

- (uint64_t)_reportIOSurfaceCompressionCoreAnalyticsDataForRaw
{
  uint64_t v1;
  BWIOSurfaceCompressionStatisticsAnalyticsPayload *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  if (result)
  {
    v1 = result;
    v2 = objc_alloc_init(BWIOSurfaceCompressionStatisticsAnalyticsPayload);
    objc_msgSend(*(id *)(v1 + 10840), "average");
    *(float *)&v3 = v3;
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setAverageRatio:](v2, "setAverageRatio:", v3);
    objc_msgSend(*(id *)(v1 + 10840), "min");
    *(float *)&v4 = v4;
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setMinRatio:](v2, "setMinRatio:", v4);
    objc_msgSend(*(id *)(v1 + 10840), "max");
    *(float *)&v5 = v5;
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setMaxRatio:](v2, "setMaxRatio:", v5);
    objc_msgSend(*(id *)(v1 + 10840), "standardDeviation");
    *(float *)&v6 = v6;
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setStandardDeviation:](v2, "setStandardDeviation:", v6);
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setNumberOfSamples:](v2, "setNumberOfSamples:", objc_msgSend(*(id *)(v1 + 10840), "numberOfSamples"));
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setCompressionType:](v2, "setCompressionType:", 3);
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setBufferHeight:](v2, "setBufferHeight:", *(unsigned int *)(v1 + 10864));
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setTotalCompressedSize:](v2, "setTotalCompressedSize:", *(_QWORD *)(v1 + 10848));
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setTotalUncompressedSize:](v2, "setTotalUncompressedSize:", *(_QWORD *)(v1 + 10856));
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setNodeType:](v2, "setNodeType:", 1);
    return -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v2);
  }
  return result;
}

- (int)secureMetadataOutputConfigurationDidChange:(id)a3
{
  BWFigCaptureStream *stream;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  BWFigCaptureStream *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  stream = self->_stream;
  v6 = *MEMORY[0x1E0D078A8];
  v7 = *MEMORY[0x1E0D07FD0];
  v18 = *MEMORY[0x1E0D07FD0];
  v19[0] = MEMORY[0x1E0C9AAA0];
  v8 = -[BWFigCaptureStream setProperty:value:](stream, "setProperty:value:", v6, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1));
  if (v8)
  {
    v11 = v8;
    goto LABEL_10;
  }
  v16 = v7;
  v17 = objc_msgSend(a3, "metadataOutputConfigurationDictionary");
  v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v10 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E0D07888], v9);
  if (v10)
  {
    v11 = v10;
    goto LABEL_10;
  }
  if (self->_metadataOutputInUseByPrimaryClient || (objc_msgSend(a3, "isEmpty") & 1) == 0)
  {
    v12 = self->_stream;
    v14 = v7;
    v15 = MEMORY[0x1E0C9AAB0];
    v11 = -[BWFigCaptureStream setProperty:value:](v12, "setProperty:value:", v6, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    if (!v11)
      return v11;
LABEL_10:
    FigDebugAssert3();
    return v11;
  }
  return 0;
}

- (unint64_t)_calculateVideoCaptureDimensions
{
  uint64_t v1;
  double v2;
  double v3;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 312), "visOverscan");
    return -[BWMultiStreamCameraSourceNode _calculateVideoCaptureDimensionsWithVISOverscan:](v1, v2, v3);
  }
  return result;
}

- (uint64_t)_scalingRequiredForOutput:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  const __CFDictionary *v10;
  CGSize v11;
  int v12;
  int v13;
  CGRect rect;

  if (!result)
    return result;
  v3 = result;
  v4 = (void *)objc_msgSend(*(id *)(result + 120), "objectAtIndexedSubscript:", *(int *)(result + 320));
  v5 = (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E80]), "intValue") >= 1
    && (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E78]), "intValue") > 0;
  if (objc_msgSend(*(id *)(v3 + 96), "temporalNoiseReductionEnabled")
    && (v5 & objc_msgSend(*(id *)(v3 + 96), "temporalNoiseReductionRawEnabled") & 1) != 0)
  {
    return 1;
  }
  v6 = (void *)*MEMORY[0x1E0D07FE0];
  objc_msgSend(*(id *)(v3 + 312), "visOverscan");
  v9 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v3, v6, a2, v7, v8);
  v10 = (const __CFDictionary *)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F20]);
  v11 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  rect.size = v11;
  if (!CGRectMakeWithDictionaryRepresentation(v10, &rect))
  {
    FigDebugAssert3();
    return 1;
  }
  v12 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "intValue");
  v13 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F40]), "intValue");
  return v12 != (int)rect.size.width || v13 != (int)rect.size.height;
}

- (uint64_t)_videoCaptureOutputDimensionsValidForDepth
{
  uint64_t v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;

  if (result)
  {
    v1 = result;
    v2 = (void *)*MEMORY[0x1E0D07FE0];
    v3 = *(void **)(result + 208);
    objc_msgSend(*(id *)(result + 312), "visOverscan");
    v6 = objc_msgSend((id)objc_msgSend(-[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v1, v2, v3, v4, v5), "objectForKeyedSubscript:", *MEMORY[0x1E0D07F90]), "intValue");
    v7 = (void *)objc_msgSend(*(id *)(v1 + 120), "objectAtIndexedSubscript:", *(int *)(v1 + 320));
    v8 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EE8]);
    v9 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D07FF0]);
    objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D08030]), "floatValue");
    if (v10 == 0.0)
      v10 = 0.25;
    return (float)(v10 * (float)v6) <= 640.0;
  }
  return result;
}

- (uint64_t)_bytesPerOutputBufferForOutputConfiguration:(void *)a3 outputID:
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (result)
  {
    v5 = result;
    v6 = (void *)objc_msgSend(*(id *)(result + 120), "objectAtIndexedSubscript:", *(int *)(result + 320));
    v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EE8]), "objectForKeyedSubscript:", a3);
    v8 = objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D08068]);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
    objc_msgSend(v9, "removeObject:", &unk_1E49FAFC8);
    v10 = -[BWMultiStreamCameraSourceNode _outputDimensionsForOutputID:outputConfiguration:](v5, a3, a2);
    LODWORD(a2) = v10;
    v11 = HIDWORD(v10);
    v12 = FigCapturePixelFormatWithLeastAverageBandwidth(v9);
    return (int)(float)(FigCapturePixelFormatGetAverageBandwidthInBytesPerPixel(v12)
                                    * (float)((int)v11 * (int)a2));
  }
  return result;
}

- (uint64_t)_preferPrimaryScalerOverIntermediateTapForVideoOutputBasedOnBandwidth
{
  uint64_t v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  float v21;
  float v22;
  float v23;
  float v24;
  int v25;
  int v26;
  int v27;

  if (result)
  {
    v1 = result;
    v2 = (void *)*MEMORY[0x1E0D07FE0];
    v3 = *(void **)(result + 208);
    objc_msgSend(*(id *)(result + 312), "visOverscan");
    v6 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v1, v2, v3, v4, v5);
    v7 = (void *)*MEMORY[0x1E0D07FC8];
    v8 = *(void **)(v1 + 208);
    objc_msgSend(*(id *)(v1 + 312), "visOverscan");
    v11 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v1, v7, v8, v9, v10);
    v12 = *(void **)(v1 + 200);
    objc_msgSend(*(id *)(v1 + 312), "visOverscan");
    v15 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v1, v2, v12, v13, v14);
    v16 = *(void **)(v1 + 200);
    objc_msgSend(*(id *)(v1 + 312), "visOverscan");
    v19 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v1, v7, v16, v17, v18);
    v20 = objc_msgSend(*(id *)(v1 + 312), "preferredPreviewMaxFrameRate");
    v21 = 1.0;
    if (v20)
    {
      v22 = (float)v20;
      objc_msgSend(*(id *)(v1 + 312), "maxFrameRate");
      if (v23 > v22)
      {
        objc_msgSend(*(id *)(v1 + 312), "maxFrameRate");
        v21 = v22 / v24;
      }
    }
    v25 = -[BWMultiStreamCameraSourceNode _bytesPerOutputBufferForOutputConfiguration:outputID:](v1, v11, v7);
    v26 = -[BWMultiStreamCameraSourceNode _bytesPerOutputBufferForOutputConfiguration:outputID:](v1, v15, v2);
    v27 = (int)(float)(v21
                     * (float)(int)-[BWMultiStreamCameraSourceNode _bytesPerOutputBufferForOutputConfiguration:outputID:](v1, v19, v7));
    return (int)(-[BWMultiStreamCameraSourceNode _bytesPerOutputBufferForOutputConfiguration:outputID:](v1, v6, v2) + v27) < v26 + v25;
  }
  return result;
}

- (uint64_t)_preferIntermediateTapOverSecondaryScalerForPreviewOutputBasedOnBandwidth
{
  uint64_t v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  float v15;
  float v16;
  float v17;
  float v18;
  int v19;

  if (result)
  {
    v1 = result;
    v2 = (void *)*MEMORY[0x1E0D07FF0];
    v3 = *(void **)(result + 200);
    objc_msgSend(*(id *)(result + 312), "visOverscan");
    v6 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v1, v2, v3, v4, v5);
    v7 = (void *)*MEMORY[0x1E0D07FC8];
    v8 = *(void **)(v1 + 200);
    objc_msgSend(*(id *)(v1 + 312), "visOverscan");
    v11 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v1, v7, v8, v9, v10);
    v12 = *MEMORY[0x1E0D07F48];
    v13 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F48]), "intValue");
    v14 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", v12), "intValue");
    v15 = 1.0;
    v16 = 1.0;
    if (v13 >= 1)
    {
      objc_msgSend(*(id *)(v1 + 312), "maxFrameRate");
      v16 = (float)v13 / v17;
    }
    if (v14 >= 1)
    {
      objc_msgSend(*(id *)(v1 + 312), "maxFrameRate");
      v15 = (float)v14 / v18;
    }
    v19 = (int)(float)(v15
                     * (float)(int)-[BWMultiStreamCameraSourceNode _bytesPerOutputBufferForOutputConfiguration:outputID:](v1, v6, v2));
    return (int)(float)(v16
                      * (float)(int)-[BWMultiStreamCameraSourceNode _bytesPerOutputBufferForOutputConfiguration:outputID:](v1, v11, v7)) <= v19;
  }
  return result;
}

- (uint64_t)_updateOutputStorageWithSecureMetadataOutputConfiguration:(char)a3 propagateToNodeOutputs:
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id obj;
  _QWORD block[6];
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_msgSend(a2, "objectDetectionEnabled");
    if (*(unsigned __int8 *)(v5 + 6441) != v6)
    {
      *(_BYTE *)(v5 + 6441) = v6;
      if (v6)
      {
        *(_QWORD *)(v5 + 6448) = *(_QWORD *)(v5 + 240);
        *(_DWORD *)(v5 + 6432) = 1;
      }
      objc_msgSend(obj, "addObject:", &unk_1E49FB010);
    }
    if (*(unsigned __int8 *)(v5 + 6945) != objc_msgSend(a2, "eyeReliefStatusDetectionEnabled"))
    {
      v7 = objc_msgSend(a2, "eyeReliefStatusDetectionEnabled");
      *(_BYTE *)(v5 + 6945) = v7;
      if (v7)
      {
        *(_QWORD *)(v5 + 6952) = *(_QWORD *)(v5 + 288);
        *(_DWORD *)(v5 + 6936) = 1;
      }
      objc_msgSend(obj, "addObject:", &unk_1E49FB028);
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (result)
    {
      v8 = result;
      v9 = *(_QWORD *)v18;
      v10 = MEMORY[0x1E0C809B0];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(obj);
          v12 = v5 + 384 + 504 * (int)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "intValue");
          v13 = *(NSObject **)(v12 + 32);
          block[0] = v10;
          block[1] = 3221225472;
          block[2] = __114__BWMultiStreamCameraSourceNode__updateOutputStorageWithSecureMetadataOutputConfiguration_propagateToNodeOutputs___block_invoke;
          block[3] = &unk_1E4922900;
          block[4] = v5;
          block[5] = v12;
          v16 = a3;
          dispatch_sync(v13, block);
          ++v11;
        }
        while (v8 != v11);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v8 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t __114__BWMultiStreamCameraSourceNode__updateOutputStorageWithSecureMetadataOutputConfiguration_propagateToNodeOutputs___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v1 = result;
  v3 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  v4 = *(void **)(v2 + 16);
  if (*(_BYTE *)(v2 + 9))
  {
    *(_BYTE *)(v3 + 10880) = 0;
    if (*(_BYTE *)(result + 48))
    {
      result = objc_msgSend(v4, "liveFormat");
      if (!result)
        result = objc_msgSend(v4, "makeConfiguredFormatLive");
      *(_BYTE *)(*(_QWORD *)(v1 + 40) + 8) = 1;
    }
  }
  else
  {
    *(_BYTE *)(v3 + 10880) = 1;
    *(_BYTE *)(v2 + 8) = 0;
    result = objc_msgSend(v4, "liveFormat");
    if (result)
      result = objc_msgSend(v4, "markEndOfLiveOutput");
    v5 = *(_QWORD *)(v1 + 40);
    *(_QWORD *)(v5 + 16) = 0;
    *(_DWORD *)v5 = 0;
  }
  return result;
}

- (void)_outputConfigurationsFilterCropRectAndDimensionsOfStreamingOutputs:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v17 = *(_QWORD *)v19;
    v5 = *MEMORY[0x1E0D07FE0];
    v15 = *MEMORY[0x1E0D07FF0];
    v14 = *MEMORY[0x1E0D07FC8];
    v6 = *MEMORY[0x1E0D07F20];
    v7 = *MEMORY[0x1E0D07F90];
    v8 = *MEMORY[0x1E0D07F40];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v17)
          objc_enumerationMutation(a2);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", v5, v14) & 1) != 0
          || (objc_msgSend(v10, "isEqualToString:", v15) & 1) != 0
          || objc_msgSend(v10, "isEqualToString:", v14))
        {
          v11 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", v6), v6);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", v7), v7);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", v8), v8);
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, v10);
        }
      }
      v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }
  return v16;
}

- (uint64_t)_finalPreviewOutputDimensions
{
  uint64_t v1;
  void *v2;
  float v3;
  float v4;
  float v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  if (result)
  {
    v1 = result;
    v15 = 0;
    v2 = (void *)objc_msgSend(*(id *)(result + 120), "objectAtIndexedSubscript:", *(int *)(result + 320));
    v3 = (float)(int)objc_msgSend(*(id *)(v1 + 312), "horizontalSensorBinningFactor");
    v4 = v3 / (float)(int)objc_msgSend(*(id *)(v1 + 312), "verticalSensorBinningFactor");
    v5 = (float)(int)objc_msgSend(*(id *)(v1 + 312), "fesBinningFactorHorizontal");
    v14 = 0;
    v6 = *(void **)(v1 + 10576);
    objc_msgSend(*(id *)(v1 + 312), "sensorCenterOffset");
    v8 = v7;
    v10 = v9;
    v11 = objc_msgSend(*(id *)(v1 + 312), "preferredPreviewDimensions");
    v12 = objc_msgSend(*(id *)(v1 + 312), "roundingOfStillImageDimensionsToMultipleOfFourEnabled");
    v13 = objc_msgSend(*(id *)(v1 + 312), "geometricDistortionCorrectionOnPreviewOutputEnabled");
    mscsn_calculateScalerCropAndOutputDimensions(v6, v2, 0, 0, v11, v12, 0, v13, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v8, v10, v4, v5, &v14, &v15);
    return v15;
  }
  return result;
}

- (void)setPreviewShift:(CGPoint)a3 previewScaleFactor:(float)a4 previewShiftAtBaseZoom:(CGPoint)a5
{
  double y;
  double x;
  double v8;
  double v9;

  y = a5.y;
  x = a5.x;
  v8 = a3.y;
  v9 = a3.x;
  if (-[BWFigVideoCaptureDevice overCaptureEnabled](self->_captureDevice, "overCaptureEnabled"))
    -[BWMultiStreamCameraSourceNode _setPreviewShift:previewScaleFactor:previewShiftAtBaseZoom:ispAppliedZoomFactorForCaptureStream:]((uint64_t)self, v9, v8, a4, x, y, 1.0);
}

- (void)_setPreviewShift:(double)a3 previewScaleFactor:(float)a4 previewShiftAtBaseZoom:(double)a5 ispAppliedZoomFactorForCaptureStream:(double)a6
{
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 10828));
    *(double *)(a1 + 10808) = a2;
    *(double *)(a1 + 10816) = a3;
    *(float *)(a1 + 10824) = a4;
    v14 = (float)(a4 / a7);
    v15 = a2 * v14;
    v16 = a3 * v14;
    if ((objc_msgSend(*(id *)(a1 + 96), "overCaptureEnabled") & 1) != 0
      || !objc_msgSend(*(id *)(a1 + 96), "parallaxMitigationBasedOnZoomFactorEnabled")
      || (objc_msgSend(*(id *)(a1 + 104), "previewShift"), vabdd_f64(v17, v15) > 0.01)
      || (objc_msgSend(*(id *)(a1 + 104), "previewShift"), vabdd_f64(v18, v16) > 0.01))
    {
      objc_msgSend(*(id *)(a1 + 104), "setPreviewShift:", v15, v16);
      objc_msgSend(*(id *)(a1 + 104), "setPreviewShiftAtBaseZoom:", a5, a6);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 10828));
  }
}

- (uint64_t)_updateStreamOutputConfigurationsWithPowerOptimizedVISOverscanEnabled:(uint64_t)result
{
  uint64_t v2;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  if (result)
  {
    v2 = result;
    if (*(_QWORD *)(result + 208)
      && (objc_msgSend(*(id *)(result + 96), "adaptiveOverscanEnabled") & 1) != 0
      && (v4 = *(void **)(v2 + 10552)) != 0)
    {
      if (*(unsigned __int8 *)(v2 + 10548) == a2)
      {
        return 0;
      }
      else
      {
        if (a2)
        {
          v4 = *(void **)(v2 + 10560);
          if (!v4)
          {
            objc_msgSend(*(id *)(v2 + 312), "visOverscan");
            v6 = v5;
            objc_msgSend(*(id *)(v2 + 312), "visOverscan");
            v8 = -[BWMultiStreamCameraSourceNode _outputConfigurationsForAllOutputsWithVISOverscan:]((void *)v2, v6, v7);
            v4 = -[BWMultiStreamCameraSourceNode _outputConfigurationsFilterCropRectAndDimensionsOfStreamingOutputs:](v2, v8);
            *(_QWORD *)(v2 + 10560) = v4;
          }
        }
        result = objc_msgSend(*(id *)(v2 + 112), "setProperty:value:", *MEMORY[0x1E0D07888], v4);
        *(_BYTE *)(v2 + 10548) = a2;
      }
    }
    else
    {
      FigDebugAssert3();
      return 4294954516;
    }
  }
  return result;
}

- (void)setPowerOptimizedVISOverscanEnabled:(BOOL)a3
{
  NSObject *streamConfigurationQueue;
  _QWORD v4[5];
  BOOL v5;

  if (!self->_stopStreamConfigurationUpdates)
  {
    streamConfigurationQueue = self->_streamConfigurationQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __69__BWMultiStreamCameraSourceNode_setPowerOptimizedVISOverscanEnabled___block_invoke;
    v4[3] = &unk_1E491EE18;
    v4[4] = self;
    v5 = a3;
    dispatch_async(streamConfigurationQueue, v4);
  }
}

uint64_t __69__BWMultiStreamCameraSourceNode_setPowerOptimizedVISOverscanEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 10568))
    return -[BWMultiStreamCameraSourceNode _updateStreamOutputConfigurationsWithPowerOptimizedVISOverscanEnabled:](result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (BWPixelBufferPool)_allocateOrReuseBufferPoolsFromSourceNodeOutput:(uint64_t)a3 forAttachedMedia:(void *)a4 onNodeOutput:(void *)a5 outputConfiguration:(char)a6 shareBufferPools:
{
  void **p_isa;
  int v12;
  BWPixelBufferPool *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  BWPixelBufferPool *v18;
  const char *v19;

  if (result)
  {
    p_isa = (void **)&result->super.isa;
    v12 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F10]), "intValue");
    if ((a6 & 1) != 0)
    {
      v13 = (BWPixelBufferPool *)(id)objc_msgSend((id)objc_msgSend(a2, "mediaPropertiesForAttachedMediaKey:", a3), "preparedPixelBufferPool");
      v14 = (void *)objc_msgSend(a4, "mediaPropertiesForAttachedMediaKey:", a3);
      if (v13)
      {
        -[BWPixelBufferPool setCapacity:](v13, "setCapacity:", -[BWPixelBufferPool capacity](v13, "capacity") + v12);
        goto LABEL_8;
      }
    }
    else
    {
      v14 = (void *)objc_msgSend(a4, "mediaPropertiesForAttachedMediaKey:", a3);
    }
    v15 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F58]), "intValue");
    v16 = (void *)objc_msgSend(v14, "resolvedVideoFormat");
    if (v15 != objc_msgSend(v16, "pixelFormat"))
    {
      FigDebugAssert3();
      v13 = 0;
      return v13;
    }
    v17 = objc_msgSend(v14, "resolvedRetainedBufferCount") + v12;
    v18 = [BWPixelBufferPool alloc];
    v13 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v18, "initWithVideoFormat:capacity:name:memoryPool:", v16, v17, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_BufferPool"), BWPortTypeToDisplayString(p_isa[23], v19), a3), objc_msgSend(a4, "memoryPool"));
    if (!v13)
    {
      FigDebugAssert3();
      return v13;
    }
LABEL_8:
    objc_msgSend(v14, "setNodePreparedPixelBufferPool:", v13);
    return v13;
  }
  return result;
}

- (void)_prefetchPixelBufferForOutputStorage:(int)a3 numberOfBuffersToFetch:(int)a4 lastEmittedSurfaceID:
{
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[6];
  int v12;
  int v13;

  if (a1 && *(_BYTE *)(a2 + 9) && !*(_BYTE *)(a2 + 96))
  {
    v8 = *(void **)(a2 + 16);
    if (v8)
    {
      v9 = objc_msgSend(v8, "livePixelBufferPool");
      if (!v9)
        return;
    }
    else
    {
      v9 = *(_QWORD *)(a2 + 88);
      if (!v9)
        return;
    }
    v10 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __114__BWMultiStreamCameraSourceNode__prefetchPixelBufferForOutputStorage_numberOfBuffersToFetch_lastEmittedSurfaceID___block_invoke;
    block[3] = &unk_1E4920768;
    block[4] = v9;
    block[5] = a2;
    v12 = a3;
    v13 = a4;
    dispatch_async(v10, block);
  }
}

uint64_t __114__BWMultiStreamCameraSourceNode__prefetchPixelBufferForOutputStorage_numberOfBuffersToFetch_lastEmittedSurfaceID___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 40) + 488))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "prefetch:lastEmittedSurfaceID:", *(unsigned int *)(v1 + 48), *(unsigned int *)(v1 + 52));
    if ((_DWORD)result)
      *(_WORD *)(*(_QWORD *)(v1 + 40) + 487) = 0;
  }
  return result;
}

- (void)startIncrementalPrefetchingOfSourcePoolsIfNecessary
{
  BOOL *p_pixelFormatIsTenBit;
  uint64_t v3;

  p_pixelFormatIsTenBit = &self->_outputsStorage[0].pixelFormatIsTenBit;
  v3 = 20;
  do
  {
    *p_pixelFormatIsTenBit = *(p_pixelFormatIsTenBit - 1);
    p_pixelFormatIsTenBit += 504;
    --v3;
  }
  while (v3);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_3(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  int64_t UpTimeNanoseconds;
  __IOSurface *IOSurface;
  dispatch_queue_t *v8;
  CMTime v9;
  CMTime time;

  memset(&v9, 0, sizeof(v9));
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v9, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    time = *a3;
    CMTimeGetSeconds(&time);
    time = v9;
    CMTimeGetSeconds(&time);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  v8 = *(dispatch_queue_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v8, 2u, a2, (UInt8 *)&time);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_4(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  int64_t UpTimeNanoseconds;
  __IOSurface *IOSurface;
  dispatch_queue_t *v8;
  CMTime v9;
  CMTime time;

  memset(&v9, 0, sizeof(v9));
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v9, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    time = *a3;
    CMTimeGetSeconds(&time);
    time = v9;
    CMTimeGetSeconds(&time);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  v8 = *(dispatch_queue_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v8, 8u, a2, (UInt8 *)&time);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_5(uint64_t a1, void *a2, CMTime *a3)
{
  dispatch_queue_t *v6;
  CMTime v7;

  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    v7 = *a3;
    CMTimeGetSeconds(&v7);
    kdebug_trace();
  }
  v6 = *(dispatch_queue_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v7 = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v6, 3u, a2, (UInt8 *)&v7);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_6(uint64_t a1, void *a2, CMTime *a3)
{
  int64_t UpTimeNanoseconds;
  dispatch_queue_t *v7;
  CMTime v8;
  CMTime time;

  memset(&v8, 0, sizeof(v8));
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v8, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    time = *a3;
    CMTimeGetSeconds(&time);
    time = v8;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  v7 = *(dispatch_queue_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v7, 3u, a2, (UInt8 *)&time);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_7(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  __IOSurface *IOSurface;
  dispatch_queue_t *v7;
  CMTime v8;

  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    v8 = *a3;
    CMTimeGetSeconds(&v8);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  v7 = *(dispatch_queue_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v7, 4u, a2, (UInt8 *)&v8);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_8(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  __IOSurface *IOSurface;
  dispatch_queue_t *v7;
  CMTime v8;

  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    v8 = *a3;
    CMTimeGetSeconds(&v8);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  v7 = *(dispatch_queue_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v7, 5u, a2, (UInt8 *)&v8);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_9(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  int64_t UpTimeNanoseconds;
  __IOSurface *IOSurface;
  dispatch_queue_t *v8;
  CMTime v9;
  CMTime time;

  memset(&v9, 0, sizeof(v9));
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v9, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    time = *a3;
    CMTimeGetSeconds(&time);
    time = v9;
    CMTimeGetSeconds(&time);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  v8 = *(dispatch_queue_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v8, 6u, a2, (UInt8 *)&time);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_10(uint64_t a1, void *a2, CMTime *a3)
{
  int64_t UpTimeNanoseconds;
  dispatch_queue_t *v7;
  CMTime v8;
  CMTime time;

  memset(&v8, 0, sizeof(v8));
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v8, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    time = *a3;
    CMTimeGetSeconds(&time);
    time = v8;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  v7 = *(dispatch_queue_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v7, 7u, a2, (UInt8 *)&time);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_11(uint64_t a1, void *a2, CMTime *a3)
{
  int64_t UpTimeNanoseconds;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  unsigned int v16;
  dispatch_queue_t *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  dispatch_queue_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CMTime v39;
  CMTime time;
  _BYTE v41[128];
  _BYTE v42[128];
  _QWORD v43[9];

  v43[6] = *MEMORY[0x1E0C80C00];
  memset(&v39, 0, sizeof(v39));
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v39, UpTimeNanoseconds, 1000000000);
  v29 = *MEMORY[0x1E0D06730];
  v7 = *MEMORY[0x1E0D06730];
  v30 = *MEMORY[0x1E0D06738];
  v43[0] = *MEMORY[0x1E0D06738];
  v43[1] = v7;
  v27 = *MEMORY[0x1E0D06758];
  v8 = *MEMORY[0x1E0D06758];
  v28 = *MEMORY[0x1E0D06750];
  v43[2] = *MEMORY[0x1E0D06750];
  v43[3] = v8;
  v9 = *MEMORY[0x1E0D06748];
  v43[4] = *MEMORY[0x1E0D06768];
  v43[5] = v9;
  v26 = v9;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 6);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(a2);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v10, "containsObject:", v15))
        {
          if ((objc_msgSend(v15, "isEqualToString:", v30) & 1) != 0)
          {
            v16 = 9;
          }
          else if ((objc_msgSend(v15, "isEqualToString:", v29) & 1) != 0)
          {
            v16 = 10;
          }
          else if ((objc_msgSend(v15, "isEqualToString:", v28) & 1) != 0)
          {
            v16 = 12;
          }
          else if ((objc_msgSend(v15, "isEqualToString:", v27) & 1) != 0)
          {
            v16 = 13;
          }
          else
          {
            if ((objc_msgSend(v15, "isEqualToString:", v26) & 1) == 0)
              objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Internal inconsistency, unknown metadata output key: %@"), v15), 0));
            v16 = 18;
          }
          if (*MEMORY[0x1E0CA1FC0] == 1)
          {
            time = *a3;
            CMTimeGetSeconds(&time);
            time = v39;
            CMTimeGetSeconds(&time);
            kdebug_trace();
          }
          v17 = *(dispatch_queue_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          v18 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v15);
          time = *a3;
          multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v17, v16, v18, (UInt8 *)&time);
        }
        else
        {
          objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 312), "enabledSemanticMaskTypes"), "containsObject:", v15);
        }
      }
      v12 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v12);
  }
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 312), "enabledSemanticMaskTypes");
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j)), *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v22);
  }
  if (objc_msgSend(v19, "count"))
  {
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      time = *a3;
      CMTimeGetSeconds(&time);
      time = v39;
      CMTimeGetSeconds(&time);
      kdebug_trace();
    }
    v25 = *(dispatch_queue_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    time = *a3;
    multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v25, 0xBu, v19, (UInt8 *)&time);
  }
}

- (void)_reflectStillSampleBufferOnStreamingOutputs:(int)a3 captureType:
{
  __CVBuffer *ImageBuffer;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  float v17;
  int v18;
  uint64_t v19;
  opaqueCMSampleBuffer *ScaledAndZoomedSampleBufferFromSampleBuffer;
  opaqueCMSampleBuffer *v21;
  double *v22;
  opaqueCMSampleBuffer *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  __CVBuffer *v37;
  opaqueCMSampleBuffer *v38;
  const void *v39;
  opaqueCMSampleBuffer *v40;
  int v41;
  void *target;
  char v43;
  void *v44;
  void *v46;
  CMTime v47;

  if (a1)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
    objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor");
    v6 = 0;
    v7 = 384;
    v8 = a1 + 384;
    v9 = (_BYTE *)(a1 + 388);
    while (!v9[5] || (*v9 & 4) == 0)
    {
      ++v6;
      v9 += 504;
      if (v6 == 20)
      {
        v6 = 0;
        break;
      }
    }
    v10 = 0;
    v11 = 0;
    v12 = *(void **)(v8 + 504 * v6 + 16);
    v46 = v12;
    while (!*(_BYTE *)(a1 + v7 + 9) || *(_DWORD *)(a1 + v7) != 1 || (*(_BYTE *)(a1 + v7 + 4) & 4) != 0)
    {
      ++v11;
      v10 += 504;
      v7 += 504;
      if (v11 == 3)
      {
        LODWORD(v11) = -1;
LABEL_13:
        target = 0;
        v13 = 0;
        v14 = v8 + 504 * v6;
        v15 = *(_QWORD *)(v14 + 120);
        v16 = *(float *)(v14 + 160);
        v17 = 1.0;
        v43 = 1;
        v18 = 1;
        v19 = v15;
        goto LABEL_14;
      }
    }
    if ((v11 & 0x80000000) != 0)
      goto LABEL_13;
    v24 = a1 + v7;
    v25 = *(void **)(v24 + 16);
    v26 = v8 + 504 * v6;
    v15 = *(_QWORD *)(v26 + 120);
    v19 = *(_QWORD *)(v24 + 120);
    v16 = *(float *)(v26 + 160);
    v17 = *(float *)(v24 + 160);
    if (v25)
    {
      v27 = objc_msgSend(v12, "liveFormat");
      v28 = objc_msgSend(v25, "liveFormat");
      v44 = (void *)v27;
      v29 = (void *)v27;
      v30 = (void *)v28;
      target = v25;
      v31 = objc_msgSend(v29, "width");
      if (v31 >= objc_msgSend(v30, "width") || (v32 = objc_msgSend(v44, "height"), v32 >= objc_msgSend(v30, "height")))
      {
        v43 = 0;
        v18 = 1;
        v12 = v46;
        v13 = target;
      }
      else
      {
        v43 = 0;
        v18 = 0;
        v33 = a1 + 384 + v10;
        v15 = *(_QWORD *)(v33 + 120);
        v34 = a1 + 384 + 504 * v6;
        v19 = *(_QWORD *)(v34 + 120);
        v16 = *(float *)(v33 + 160);
        v17 = *(float *)(v34 + 160);
        v12 = target;
        v13 = v46;
      }
    }
    else
    {
      target = 0;
      v13 = 0;
      v43 = 1;
      v18 = 1;
    }
LABEL_14:
    ScaledAndZoomedSampleBufferFromSampleBuffer = (opaqueCMSampleBuffer *)mscsn_createScaledAndZoomedSampleBufferFromSampleBuffer(sbuf, ImageBuffer, a3, (void *)objc_msgSend(v12, "livePixelBufferPool"), v15, (VTPixelTransferSessionRef *)(a1 + 10752), (CFTypeRef *)(a1 + 10760), *(double *)(a1 + 10664), *(double *)(a1 + 10672), v16);
    if (!ScaledAndZoomedSampleBufferFromSampleBuffer)
    {
      FigDebugAssert3();
      return;
    }
    v21 = ScaledAndZoomedSampleBufferFromSampleBuffer;
    if (v13)
    {
      if (v13 == *(void **)(a1 + 200))
        v22 = (double *)MEMORY[0x1E0C9D820];
      else
        v22 = (double *)(a1 + 10664);
      v36 = *v22;
      v35 = v22[1];
      v37 = CMSampleBufferGetImageBuffer(ScaledAndZoomedSampleBufferFromSampleBuffer);
      v23 = (opaqueCMSampleBuffer *)mscsn_createScaledAndZoomedSampleBufferFromSampleBuffer(v21, v37, a3, (void *)objc_msgSend(v13, "livePixelBufferPool"), v19, (VTPixelTransferSessionRef *)(a1 + 10768), (CFTypeRef *)(a1 + 10776), v36, v35, v17);
      if (!v23)
      {
        FigDebugAssert3();
        CFRelease(v21);
        return;
      }
    }
    else
    {
      v23 = 0;
    }
    v41 = v18;
    if (v18)
      v38 = v21;
    else
      v38 = v23;
    v39 = (const void *)*MEMORY[0x1E0C9AE50];
    CMSetAttachment(v38, CFSTR("IsHarvestedStillFrame"), (CFTypeRef)*MEMORY[0x1E0C9AE50], 1u);
    -[BWMultiStreamCameraSourceNode _addMetadataUsedByVideoEncoderToPixelBufferForSampleBuffer:nodeOutput:](a1, v38, (uint64_t)v46);
    mscsn_removeNonpropagatedAttachmentsFromReflectedStreamingFrame(v38);
    objc_msgSend(v46, "emitSampleBuffer:", v38);
    CMSampleBufferGetPresentationTimeStamp(&v47, v38);
    *(CMTime *)(a1 + 384 + 504 * v6 + 56) = v47;
    if ((v43 & 1) == 0)
    {
      if (v41)
        v40 = v23;
      else
        v40 = v21;
      CMSetAttachment(target, CFSTR("IsHarvestedStillFrame"), v39, 1u);
      -[BWMultiStreamCameraSourceNode _addMetadataUsedByVideoEncoderToPixelBufferForSampleBuffer:nodeOutput:](a1, v40, (uint64_t)target);
      mscsn_removeNonpropagatedAttachmentsFromReflectedStreamingFrame(v40);
      objc_msgSend(target, "emitSampleBuffer:", v40);
      CMSampleBufferGetPresentationTimeStamp(&v47, v40);
      *(CMTime *)(a1 + 384 + 504 * (int)v11 + 56) = v47;
    }
    CFRelease(v21);
    if (v23)
      CFRelease(v23);
  }
}

- (uint64_t)_preserveMotionDataForSoonToBeDroppedSampleBuffer:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 312), "reflectsStillsOnStreamingOutputs");
    if ((_DWORD)result)
    {
      if (!objc_msgSend(*(id *)(v3 + 104), "synchronizedStreamsEnabled"))
        return objc_msgSend(*(id *)(v3 + 10528), "preserveMotionDataForSoonToBeDroppedSampleBuffer:", a2);
      result = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue");
      if ((_DWORD)result)
        return objc_msgSend(*(id *)(v3 + 10528), "preserveMotionDataForSoonToBeDroppedSampleBuffer:", a2);
    }
  }
  return result;
}

- (void)_attachCameraIntrinsicMatrixToSampleBuffer:(int)a3 scaledToVideoBuffer:(int)a4 addToMetadataDictInTotalSensorCoords:
{
  __CVBuffer *ImageBuffer;
  void *v9;
  unsigned int v10;
  int v11;
  int v12;
  uint64_t v13;
  __int128 v14;
  int CGRectIfPresent;
  int Width;
  size_t Height;
  int v18;
  double v19;
  uint64_t v20;
  int v21;
  int v22;
  float v23;
  float v24;
  double v25;
  uint64_t v26;
  float v27;
  float64x2_t v29;
  unint64_t v30;
  id v31;
  CFDictionaryRef DictionaryRepresentation;
  int32x2_t v33;
  int64x2_t v34;
  float64x2_t v35;
  unint64_t v36;
  id v37;
  int v38;
  int v39;
  int v40;
  int v41;
  float64x2_t v42;
  CMTime time;
  float v44;
  int8x16_t v45;
  __int128 v46;
  float v47;
  __int128 v48;
  __int128 v49;
  float64x2_t v50;
  CGSize v51;

  if (!a1)
    return;
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  v9 = (void *)CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v47 = 1.0;
  v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
  if (v10 <= 1)
    v11 = 1;
  else
    v11 = v10;
  v12 = objc_msgSend(*(id *)(a1 + 312), "horizontalSensorBinningFactor") * v11;
  v13 = objc_msgSend(*(id *)(a1 + 312), "verticalSensorBinningFactor") * v11;
  v14 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v45 = *(int8x16_t *)MEMORY[0x1E0C9D648];
  v46 = v14;
  CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
  v40 = a3;
  v41 = a4;
  v39 = CGRectIfPresent;
  if (a3)
  {
    Width = CVPixelBufferGetWidth(ImageBuffer);
    Height = CVPixelBufferGetHeight(ImageBuffer);
    v18 = Height;
    FigMotionComputeLensPositionScalingFactor((const __CFDictionary *)v9, Width, Height, v12, v13, &v47);
    *(float *)&v19 = v47;
    v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D06DA0]);
  }
  else
  {
    if (!CGRectIfPresent)
      goto LABEL_31;
    Width = (int)(*(double *)&v46 * (double)v12);
    v18 = (int)(*((double *)&v46 + 1) * (double)(int)v13);
  }
  v21 = objc_msgSend(*(id *)(a1 + 104), "hasFocus");
  v22 = objc_msgSend(*(id *)(a1 + 104), "hasSphere");
  v44 = 0.0;
  if (!*(_BYTE *)(a1 + 10520)
    || (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CF0]), "floatValue"),
        v44 = (float)(v23 * *(float *)(a1 + 132)) * v47,
        v44 == 0.0))
  {
    if ((v21 | v22) == 1)
    {
      LODWORD(v48) = 0;
      if (FigMotionGetGravityZ((const __CFDictionary *)v9, (float *)&v48)
        || FigMotionCalculateAdjustedLensPosition((const __CFDictionary *)v9, a1 + 10464, &v44, *(float *)&v48, v47))
      {
        goto LABEL_31;
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D08]), "floatValue");
      v44 = (float)((float)(v24 * 1000.0) * *(float *)(a1 + 132)) * v47;
      if (v44 == 0.0)
      {
        v38 = FigMotionCalculateAdjustedLensPosition((const __CFDictionary *)v9, a1 + 10464, &v44, 0.0, v47);
        *(float *)&v25 = v44;
        if (v44 == 0.0
          && (v26 = *MEMORY[0x1E0D06A78], objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A78], v25)))
        {
          objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v26), "floatValue");
          v44 = (float)((float)(v27 * 1000.0) * *(float *)(a1 + 132)) * v47;
          if (v44 <= 0.0 && v38 != 0)
            goto LABEL_31;
        }
        else if (v38)
        {
          goto LABEL_31;
        }
      }
    }
  }
  CMSampleBufferGetPresentationTimeStamp(&time, sbuf);
  CMTimeGetSeconds(&time);
  v42 = *(float64x2_t *)MEMORY[0x1E0C9D538];
  if (FigMotionComputePrincipalPoint((const __CFDictionary *)v9, Width, v18, v12, v13, v22, &v42, *(float *)(a1 + 132), v47))
  {
LABEL_31:
    FigDebugAssert3();
    return;
  }
  *(float32x2_t *)&v29.f64[0] = vcvt_f32_f64(v42);
  LODWORD(v30) = 0;
  *((float *)&v30 + 1) = v44;
  v48 = LODWORD(v44);
  v49 = v30;
  *(_QWORD *)&v29.f64[1] = __PAIR64__(HIDWORD(v42.f64[1]), 1.0);
  v50 = v29;
  v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v48, 48);
  if (v40)
  {
    CMSetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0CA2638], v31, 1u);
  }
  else
  {
    CMSetAttachment(sbuf, CFSTR("OriginalCameraIntrinsicMatrix"), v31, 1u);
    v51.width = (double)Width;
    v51.height = (double)v18;
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v51);
    CMSetAttachment(sbuf, CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), DictionaryRepresentation, 1u);

  }
  if (v41)
  {
    v33 = vdup_n_s32(v39 == 0);
    v34.i64[0] = v33.u32[0];
    v34.i64[1] = v33.u32[1];
    v35 = vaddq_f64(v42, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v34, 0x3FuLL)), (int8x16_t)vdupq_n_s64(0x8000000000000000), v45));
    *(float32x2_t *)&v35.f64[0] = vcvt_f32_f64(v35);
    LODWORD(v36) = 0;
    *((float *)&v36 + 1) = v44;
    v48 = LODWORD(v44);
    v49 = v36;
    LODWORD(v35.f64[1]) = 1.0;
    v50 = v35;
    v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v48, 48);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D06120]);
  }
}

- (CMAttachmentBearerRef)_createFocusPixelDataSampleBufferFromVideoSampleBuffer:(CMAttachmentBearerRef)result
{
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CVBuffer *v8;
  const __CFString *v9;
  CFTypeRef v10;
  void *v11;
  CMAttachmentBearerRef targeta;

  if (result)
  {
    v3 = (uint64_t)result;
    targeta = 0;
    v4 = (const __CFString *)*MEMORY[0x1E0D05C78];
    v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05C78], 0);
    if (v5)
    {
      v6 = v5;
      v7 = *MEMORY[0x1E0D06578];
      v8 = (__CVBuffer *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06578]);
      if (!v8
        || BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)target, v8, (CFTypeRef *)(v3 + 368), (CMSampleBufferRef *)&targeta))
      {
        FigDebugAssert3();
      }
      else
      {
        CMRemoveAttachment(targeta, v4);
        v9 = (const __CFString *)*MEMORY[0x1E0D05CB0];
        v10 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        CMSetAttachment(targeta, v9, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10), 1u);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v6);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v7);
        CMSetAttachment(targeta, v4, v11, 1u);

      }
    }
    CMRemoveAttachment(target, v4);
    return targeta;
  }
  return result;
}

- (void)_propagatePixelBufferAttachmentFromSampleBuffer:(CFStringRef)key attachmentKey:(uint64_t)a4 usingAttachedMediaKey:(int)a5 resetValidBufferRect:
{
  __CVBuffer *v9;

  if (a1)
  {
    v9 = (__CVBuffer *)CMGetAttachment(target, key, 0);
    if (v9)
      -[BWMultiStreamCameraSourceNode _propagatePixelBufferAttachment:sampleBuffer:attachedMediaKey:removeAttachmentKey:resetValidBufferRect:](a1, v9, target, (uint64_t)key, key, a5);
    CMRemoveAttachment(target, key);
  }
}

- (void)_propagatePixelBufferAttachment:(void *)a3 sampleBuffer:(uint64_t)a4 attachedMediaKey:(const __CFString *)a5 removeAttachmentKey:(int)a6 resetValidBufferRect:
{
  id v10;
  void *v11;
  uint64_t v12;
  CFTypeRef cf;
  CMAttachmentBearerRef target;

  if (a1)
  {
    cf = 0;
    target = 0;
    if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)a3, a2, &cf, (CMSampleBufferRef *)&target))
    {
      if (a5)
        CMRemoveAttachment(target, a5);
      v10 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(target);
      if (a6)
      {
        v11 = v10;
        v12 = objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F30]);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D06F48]);
      }
      BWSampleBufferSetAttachedMedia(a3, a4, (uint64_t)target);
    }
    if (target)
      CFRelease(target);
    if (cf)
      CFRelease(cf);
    if (a5)
      CMRemoveAttachment(a3, a5);
  }
}

const void *__58__BWMultiStreamCameraSourceNode__flushOutRemainingBuffers__block_invoke(uint64_t a1)
{
  const void *result;

  for (result = CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(*(_QWORD *)(a1 + 32) + 384 + 504 * *(int *)(a1 + 40) + 24));
        result;
        result = CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(*(_QWORD *)(a1 + 32) + 384 + 504 * *(int *)(a1 + 40) + 24)))
  {
    CFRelease(result);
  }
  return result;
}

uint64_t __59__BWMultiStreamCameraSourceNode__markEndOfLiveOnAllOutputs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10880) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 8) = 0;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = -[BWMultiStreamCameraSourceNode _nodeOutputsMadeLiveByStreamOutputIndex:](*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 56));
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (v7 == *(void **)(*(_QWORD *)(a1 + 48) + 16)
          || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8) & 1) == 0)
        {
          if (objc_msgSend(v7, "liveFormat", (_QWORD)v8))
            objc_msgSend(v7, "markEndOfLiveOutput");
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (double)_applyNondisruptiveSwitchingZoomFactorAndSensorCenterOffsetToPreviewShift:(double)a3 forSampleBuffer:(double)a4 outputIndex:
{
  double v4;
  double v5;
  double v6;
  CFTypeRef v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  int RawSensorDimensions;
  double v17;
  double v18;
  float v19;

  if (!a1)
    return 0.0;
  v4 = a3;
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (a3 != *MEMORY[0x1E0C9D538] || a4 != v6)
  {
    v10 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (v10)
    {
      v11 = (void *)v10;
      v12 = FigCaptureMetadataUtilitiesNormalizedSensorCenterOffsetInValidBufferRect(target);
      objc_msgSend(*(id *)(a1 + 312), "sensorCenterOffset");
      if (v14 != v5 || v13 != v6)
      {
        RawSensorDimensions = FigCaptureMetadataUtilitiesGetRawSensorDimensions(v11);
        objc_msgSend(*(id *)(a1 + 312), "sensorCenterOffset");
        v12 = v12 - FigCaptureMetadataUtilitiesNormalizePoint(v17, v18, (double)RawSensorDimensions);
      }
      objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]), "floatValue");
      if (v19 == 0.0)
        v19 = 1.0;
      return v12 + v4 * v19;
    }
    else
    {
      FigDebugAssert3();
    }
  }
  return v4;
}

- (double)_bravoShiftMitigationCropOffset:(float)a3 totalZoom:(double)a4 totalConfiguredOverscan:(double)a5 totalAvailableOverscan:(double)a6
{
  uint64_t v7;
  double v13;
  double v14;
  float v15;
  float v16;
  void *v17;
  uint64_t v18;
  const __CFDictionary *v19;
  __CVBuffer *ImageBuffer;
  size_t Width;
  size_t Height;
  uint64x2_t v23;
  double Seconds;
  float64_t v25;
  float64_t v26;
  float64_t v27;
  float64_t v28;
  int v29;
  int v30;
  float64x2_t v31;
  void *v32;
  const void *v33;
  float v34;
  double v35;
  float v36;
  float v37;
  float v38;
  double v39;
  double v40;
  float v41;
  float v42;
  float v43;
  void *v44;
  double v45;
  double v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  double v58;
  double v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  double v72;
  double v73;
  double v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  double v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  double v111;
  float64x2_t v112;
  float64x2_t v113;
  double v114;
  double v115;
  double v116;
  float64x2_t v117;
  float64x2_t v118;
  double v119;
  float64x2_t v120;
  float64x2_t v125;
  float64x2_t v126;
  float64x2_t v127;
  double v128;
  double v129;
  double v130;
  double v131;
  float64x2_t v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  double v142;
  float v143;
  double v144;
  double v145;
  float v146;
  float v147;
  uint64x2_t v150;
  float32x2_t v151;
  float64x2_t v152;
  float64x2_t v153;
  float64x2_t v154;
  __int128 v155;
  float64x2_t v156;
  int v157;
  _OWORD v158[40];
  float64x2_t v159;
  float64x2_t v160;
  CMTime time;
  id v162;
  float64x2_t v163;

  if (!a1)
    return 0.0;
  v163 = *(float64x2_t *)MEMORY[0x1E0C9D538];
  v162 = 0;
  v13 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(*(id *)(a1 + 96), "parallaxMitigationStrengthAndTargetCaptureStream:", &v162);
  v16 = v15;
  if ((objc_msgSend(*(id *)(a1 + 96), "parallaxMitigationBasedOnZoomFactorEnabled") & 1) != 0 || v16 != 0.0)
  {
    v17 = (void *)objc_msgSend(*(id *)(a1 + 96), "captureStreamsByFocalLength");
    v18 = objc_msgSend(v17, "indexOfObject:", *(_QWORD *)(a1 + 104));
    if (objc_msgSend(v17, "indexOfObject:", v162) == v18 + 1)
    {
      v19 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
      Width = CVPixelBufferGetWidth(ImageBuffer);
      Height = CVPixelBufferGetHeight(ImageBuffer);
      v23.i64[0] = Width;
      v23.i64[1] = Height;
      v150 = v23;
      CMSampleBufferGetPresentationTimeStamp(&time, (CMSampleBufferRef)a2);
      Seconds = CMTimeGetSeconds(&time);
      v160 = 0uLL;
      objc_msgSend(*(id *)(a1 + 104), "opticalCenterOffsetInPhysicalSensorDimensions");
      v160.f64[0] = v25;
      v160.f64[1] = v26;
      objc_msgSend(v162, "opticalCenterOffsetInPhysicalSensorDimensions");
      v159.f64[0] = v27;
      v159.f64[1] = v28;
      v29 = objc_msgSend(*(id *)(a1 + 312), "horizontalSensorBinningFactor");
      v30 = objc_msgSend(*(id *)(a1 + 312), "verticalSensorBinningFactor");
      if (v160.f64[0] == v13 && v160.f64[1] == v14)
      {
        v141 = v7;
        LODWORD(v139) = 0;
        FigDebugAssert3();
      }
      v31 = vcvtq_f64_u64(v150);
      if (v159.f64[0] == v13 && v159.f64[1] == v14)
      {
        v141 = v7;
        LODWORD(v139) = 0;
        v152 = v31;
        FigDebugAssert3();
        v31 = v152;
      }
      v151 = vcvt_f32_f64(v31);
      memset(v158, 0, 512);
      v32 = *(void **)(a1 + 96);
      if (v32)
        objc_msgSend(v32, "sphereShiftState");
      else
        bzero(v158, 0x280uLL);
      v157 = 7;
      v153 = 0u;
      v154 = 0u;
      v155 = 0u;
      v156 = 0u;
      v33 = (const void *)objc_msgSend(v162, "portType", v139, v141);
      v34 = v151.f32[1];
      LODWORD(v140) = v30;
      if (FigMotionComputeWideToNarrowShift(v19, 0, v33, &v160, &v159, (int)v151.f32[0], (int)v151.f32[1], v29, Seconds, 0.0, 1.0, v140, &v157, (uint64_t)v158, v163.f64, &v153))goto LABEL_79;
      if (objc_msgSend(*(id *)(a1 + 96), "parallaxMitigationBasedOnZoomFactorEnabled"))
      {
        v145 = a7;
        v146 = v16;
        v36 = 1.0;
        v37 = *(float *)(a1 + 10972);
        v38 = *(float *)(a1 + 10544) + 1.0;
        LODWORD(v35) = 1.0;
        if (*(_BYTE *)(a1 + 10970))
        {
          objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor", v35);
          *(float *)&v35 = *(float *)&v35 / v37;
        }
        if (*(float *)&v35 >= 1.0)
          v36 = *(float *)&v35;
        v39 = (a4 + -1.0) * (1.0 - *(double *)(a1 + 10960));
        v144 = v38 + -1.0;
        v142 = v36;
        v40 = v36 * (a4 + -1.0 + 1.0 + v144) + -1.0;
        v41 = v38 * v37;
        objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor");
        v147 = v38 * v37;
        if ((float)(v38 * v37) >= v42)
        {
          objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor");
          v147 = v43;
        }
        v44 = *(void **)(a1 + 104);
        v45 = v39 / v40;
        if (*(_BYTE *)(a1 + 10968))
        {
          v143 = v41;
          v46 = v39 / v40;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "nondisruptiveSwitchingZoomFactors"), "lastObject"), "floatValue");
          v48 = v47;
          if (v47 == 0.0)
          {
            objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
            v48 = v49;
          }
          v50 = a3 - v48;
          objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor");
          if ((float)((float)(a3 - v48) / (float)(v51 - v48)) > 1.0
            || (objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor"),
                v53 = 0.0,
                (float)(v50 / (float)(v52 - v48)) >= 0.0))
          {
            objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor");
            v53 = 1.0;
            if ((float)(v50 / (float)(v54 - v48)) <= 1.0)
            {
              objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor");
              v53 = v50 / (float)(v55 - v48);
            }
          }
          v56 = v50 / (float)(v147 - v48);
          if (v36 < v56)
            v56 = v36;
          v57 = v56 >= 0.0 ? v56 : 0.0;
          v58 = a6;
          v59 = 1.0;
          v45 = v46;
          v41 = v143;
        }
        else
        {
          v58 = a6;
          objc_msgSend(v44, "baseZoomFactor");
          v80 = a3 - v79;
          objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor");
          v82 = v81;
          objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
          if ((float)(v80 / (float)(v82 - v83)) > 1.0
            || (objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor"),
                v85 = a3 - v84,
                objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor"),
                v87 = v86,
                objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor"),
                v53 = 0.0,
                (float)(v85 / (float)(v87 - v88)) >= 0.0))
          {
            objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
            v90 = a3 - v89;
            objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor");
            v92 = v91;
            objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
            v53 = 1.0;
            if ((float)(v90 / (float)(v92 - v93)) <= 1.0)
            {
              objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
              v95 = a3 - v94;
              objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor");
              v97 = v96;
              objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
              v53 = v95 / (float)(v97 - v98);
            }
          }
          objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
          v100 = a3 - v99;
          objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
          _NF = v36 < (float)(v100 / (float)(v147 - *(float *)&v102));
          *(float *)&v102 = v36;
          if (!_NF)
          {
            objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor", v102);
            v104 = a3 - v103;
            objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
            *(float *)&v102 = v104 / (float)(v147 - *(float *)&v102);
          }
          v57 = 0.0;
          if (*(float *)&v102 >= 0.0)
          {
            objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
            v106 = a3 - v105;
            objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
            if (v36 >= (float)(v106 / (float)(v147 - v107)))
            {
              objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
              v109 = a3 - v108;
              objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
              v57 = v109 / (float)(v147 - v110);
            }
            else
            {
              v57 = v36;
            }
          }
          v59 = 1.0;
        }
        v111 = v59 - v45;
        v112 = vcvtq_f64_f32(v151);
        v113 = vdivq_f64(vaddq_f64(v156, v154), v112);
        if (*(_BYTE *)(a1 + 10969))
        {
          if (v41 >= a3)
          {
            v129 = v57;
            v114 = (a4 + v144 + -1.0) * v129 + 1.0;
            v115 = (a5 + v144 + -1.0) * v129 + 1.0;
          }
          else
          {
            v114 = v58;
            v115 = v145;
          }
        }
        else if (*(_BYTE *)(a1 + 10970))
        {
          v116 = a4 + v144 + -1.0;
          v117.f64[0] = -v116;
          v118.f64[0] = v116 * v142 * v111;
          v119 = a5 + v144 + -1.0;
          v117.f64[1] = -v119;
          v120 = vmulq_n_f64(vmulq_n_f64(v117, v142), v111);
          __asm { FMOV            V7.2D, #0.5 }
          v125 = vmulq_f64(v120, _Q7);
          v118.f64[1] = v119 * v142 * v111;
          v126 = vmulq_f64(v118, _Q7);
          v127 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v113, v126), (int8x16_t)v126, (int8x16_t)v113);
          v113 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v125, v127), (int8x16_t)v125, (int8x16_t)v127);
          v128 = v57;
          v114 = v116 * v128 + 1.0;
          v115 = v119 * v128 + 1.0;
        }
        else
        {
          v115 = a5;
          v114 = a4;
        }
        v130 = v111 * (v114 + -1.0);
        v131 = v111 * (v115 + -1.0);
        v72 = v130 >= v58 + -1.0 ? v58 + -1.0 : v130;
        v74 = v131 >= v145 + -1.0 ? v145 + -1.0 : v131;
        v132 = vmulq_n_f64(vmulq_f64(v113, v112), v53);
        v163 = vmlaq_n_f64(v132, vmulq_n_f64(vsubq_f64(v163, v132), v146), v53);
        v34 = v151.f32[1];
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
        v61 = a3 - v60;
        objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor");
        v63 = v62;
        objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
        v65 = v61 / (float)(v63 - v64);
        v66 = 1.0;
        if (v65 <= 1.0)
        {
          objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
          v68 = a3 - v67;
          objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor");
          v70 = v69;
          objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor");
          v66 = v68 / (float)(v70 - v71);
        }
        v163 = vmulq_n_f64(v163, (float)(v16 * v66));
        v72 = -[BWMultiStreamCameraSourceNode _overscanWithFOVSacrifice](a1);
        v74 = v73;
        objc_msgSend(*(id *)(a1 + 312), "overscanForShiftMitigation");
        if (v72 <= v75)
        {
          objc_msgSend(*(id *)(a1 + 312), "overscanForShiftMitigation");
          v72 = v76;
        }
        objc_msgSend(*(id *)(a1 + 312), "overscanForShiftMitigation");
        if (v74 <= v77)
        {
          objc_msgSend(*(id *)(a1 + 312), "overscanForShiftMitigation");
          v74 = v78;
        }
      }
      v133 = v163.f64[0] / v151.f32[0];
      v134 = v163.f64[1] / v34;
      v163.f64[0] = v133;
      v163.f64[1] = v134;
      v135 = v72 * 0.5;
      if (v72 * 0.5 >= v133)
        v135 = v133;
      if (v72 * -0.5 <= v135)
        v13 = v135;
      else
        v13 = v72 * -0.5;
      v136 = v74 * 0.5;
      if (v74 * 0.5 >= v134)
        v136 = v134;
      v137 = v74 * -0.5 <= v136 ? v136 : v74 * -0.5;
      if (v13 != v133 || v137 != v134)
LABEL_79:
        FigDebugAssert3();
    }
  }
  return v13;
}

- (unint64_t)_updateNondisruptiveSwitchingZoomFactors:(unint64_t)result
{
  unint64_t v3;
  void *v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  float v14;
  float v15;
  void *v16;
  unint64_t v17;
  float v18;
  float v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
    result = objc_msgSend(v4, "count");
    if (result)
    {
      if (objc_msgSend(v4, "count") != 1
        || (objc_msgSend((id)objc_msgSend(v4, "firstObject"), "floatValue"),
            v6 = v5,
            result = objc_msgSend(*(id *)(v3 + 104), "baseZoomFactor"),
            v6 != v7))
      {
        v8 = BWFilterNonDisruptiveSwitchingFormatZoomFactors(v4);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v4);
              v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              if ((objc_msgSend(v8, "containsObject:", v13) & 1) == 0)
                objc_msgSend(a2, "removeObjectForKey:", v13);
            }
            v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v10);
        }
        if ((objc_msgSend(*(id *)(v3 + 96), "overCaptureEnabled") & 1) != 0
          || (result = objc_msgSend(*(id *)(v3 + 96), "maxOverscanVideoStabilizationMethod"), (int)result >= 1))
        {
          objc_msgSend((id)objc_msgSend(v8, "lastObject"), "floatValue");
          v15 = v14;
          v16 = (void *)objc_msgSend(*(id *)(v3 + 96), "captureStreamsByFocalLength");
          v17 = objc_msgSend(v16, "indexOfObject:", *(_QWORD *)(v3 + 104)) + 1;
          result = objc_msgSend(v16, "count");
          if (v17 < result)
          {
            objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", v17), "baseZoomFactorAfterGDC");
            v19 = v18;
            result = BWWiderNonDisruptiveSwitchingFormatZoomFactorAndNarrowerBaseZoomFactorShouldBeCombined(v15, v18);
            if ((_DWORD)result)
            {
              *(float *)&v20 = v15;
              v21 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20));
              *(float *)&v22 = v19;
              objc_msgSend(a2, "setObject:forKeyedSubscript:", v21, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22));
              *(float *)&v23 = v15;
              return objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23));
            }
          }
        }
      }
    }
  }
  return result;
}

- (unint64_t)_calculateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping:(_QWORD *)a3 nondisruptiveSwitchingFormatIndicesByZoomfactorSIFRNonBinnedOut:(int)a4 ultraHighResolutionNondisruptiveStreamingFormatIndex:
{
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  float v12;
  uint64_t i;
  void *v14;
  int v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t j;
  void *v25;
  void *v26;
  int v27;
  float v28;
  float v29;
  __int128 v30;
  double v31;
  double v32;
  double v33;
  float v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = result;
    result = objc_msgSend((id)objc_msgSend(*(id *)(result + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"), "count");
    if (result)
    {
      v37 = a2;
      v38 = a3;
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend(*(id *)(v6 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"));
      objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v6 + 320)));
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v53;
        v11 = 0.0;
        v41 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
        v43 = *MEMORY[0x1E0C9D648];
        v12 = 0.0;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v53 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(v6 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "intValue"));
            v50 = v43;
            v51 = v41;
            if (FigCFDictionaryGetCGRectIfPresent() && *(double *)&v51 > v12)
            {
              v12 = *(double *)&v51;
              v11 = *((double *)&v51 + 1);
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        }
        while (v9);
      }
      else
      {
        v11 = 0.0;
        v12 = 0.0;
      }
      v14 = (void *)objc_msgSend(*(id *)(v6 + 120), "objectAtIndexedSubscript:", *(int *)(v6 + 320));
      v42 = *MEMORY[0x1E0D07EA8];
      v15 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:"), "BOOLValue");
      v16 = (uint64_t *)MEMORY[0x1E0D07EA0];
      if (v15)
        *(_DWORD *)(v6 + 324) = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EA0]), "intValue");
      if (objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v42), "BOOLValue")
        && objc_msgSend(*(id *)(v6 + 312), "sifrBinningFactorOverrideForNondisruptiveSwitching"))
      {
        *(_DWORD *)(v6 + 324) = objc_msgSend(*(id *)(v6 + 312), "sifrBinningFactorOverrideForNondisruptiveSwitching");
      }
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)objc_msgSend(*(id *)(v6 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"), "count"));
      v44 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)objc_msgSend(*(id *)(v6 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"), "count"));
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v18 = (void *)objc_msgSend(*(id *)(v6 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices");
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v47;
        v39 = *v16;
        v22 = v12;
        v23 = v11;
        v40 = *MEMORY[0x1E0D07EB0];
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v47 != v21)
              objc_enumerationMutation(v18);
            v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
            if (objc_msgSend(v25, "intValue") != a4)
            {
              v26 = (void *)objc_msgSend(*(id *)(v6 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(v25, "intValue"));
              if (objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", v42), "BOOLValue"))
                v27 = objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", v39), "intValue");
              else
                v27 = 0;
              objc_msgSend(*(id *)(v6 + 104), "baseZoomFactor");
              v29 = v28;
              v30 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
              v50 = *MEMORY[0x1E0C9D648];
              v51 = v30;
              if (FigCFDictionaryGetCGRectIfPresent())
              {
                v32 = v22 / *(double *)&v51;
                v33 = v23 / *((double *)&v51 + 1);
                if (objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", v40), "BOOLValue"))
                  v31 = v33;
                else
                  v31 = v32;
                v34 = v31;
                v29 = v29 * v34;
              }
              *(float *)&v31 = v29;
              v35 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
              if (v27 == 2)
                v36 = v17;
              else
                v36 = v44;
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v25, v35);
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        }
        while (v20);
      }
      -[BWMultiStreamCameraSourceNode _updateNondisruptiveSwitchingZoomFactors:](v6, v17);
      result = -[BWMultiStreamCameraSourceNode _updateNondisruptiveSwitchingZoomFactors:](v6, v44);
      if (v37)
      {
        result = objc_msgSend(v17, "count");
        if (result)
          *v37 = v17;
      }
      if (v38)
      {
        result = objc_msgSend(v44, "count");
        if (result)
          *v38 = v44;
      }
    }
  }
  return result;
}

- (void)_HDRImageStatisticsDictFromMetadata:(uint64_t)a1
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B00]);
  v3 = v2;
  if (v2)
  {
    v4 = *MEMORY[0x1E0D06600];
    v5 = objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06600]);
    v6 = (_QWORD *)MEMORY[0x1E0D065F8];
    v7 = (_QWORD *)MEMORY[0x1E0CA8E30];
    v8 = (_QWORD *)MEMORY[0x1E0D065F0];
    v9 = (_QWORD *)MEMORY[0x1E0CA8E28];
    v10 = (_QWORD *)MEMORY[0x1E0D065E0];
    v11 = (_QWORD *)MEMORY[0x1E0CA8E20];
    v12 = (_QWORD *)MEMORY[0x1E0CA8E18];
    if (v5)
    {
      v13 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend((id)v13, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v4), "objectForKeyedSubscript:", *v6), *v7);
      objc_msgSend((id)v13, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v4), "objectForKeyedSubscript:", *v8), *v9);
      objc_msgSend((id)v13, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v4), "objectForKeyedSubscript:", *v10), *v11);
      v14 = (_QWORD *)MEMORY[0x1E0CA8EC8];
      objc_msgSend((id)v13, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CA8EC8], *v12);
      v15 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v4);
      v16 = (_QWORD *)MEMORY[0x1E0D065D0];
      v17 = objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D065D0]);
      v18 = (_QWORD *)MEMORY[0x1E0CED688];
      objc_msgSend((id)v13, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CED688]);
      v19 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v4);
      v20 = (_QWORD *)MEMORY[0x1E0D065D8];
      v21 = objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D065D8]);
      v22 = (_QWORD *)MEMORY[0x1E0CED690];
      objc_msgSend((id)v13, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CED690]);
    }
    else
    {
      v14 = (_QWORD *)MEMORY[0x1E0CA8EC8];
      v16 = (_QWORD *)MEMORY[0x1E0D065D0];
      v18 = (_QWORD *)MEMORY[0x1E0CED688];
      v20 = (_QWORD *)MEMORY[0x1E0D065D8];
      v22 = (_QWORD *)MEMORY[0x1E0CED690];
      v13 = 0;
    }
    v23 = *MEMORY[0x1E0D065E8];
    if (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D065E8]))
    {
      v24 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v25 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v23);
      v26 = objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D065F8]);
      objc_msgSend((id)v24, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CA8E30]);
      v27 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v23);
      v28 = objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0D065F0]);
      objc_msgSend((id)v24, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0CA8E28]);
      v29 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v23);
      v30 = objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D065E0]);
      objc_msgSend((id)v24, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CA8E20]);
      objc_msgSend((id)v24, "setObject:forKeyedSubscript:", *v14, *MEMORY[0x1E0CA8E18]);
      objc_msgSend((id)v24, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v23), "objectForKeyedSubscript:", *v16), *v18);
      objc_msgSend((id)v24, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v23), "objectForKeyedSubscript:", *v20), *v22);
    }
    else
    {
      v24 = 0;
    }
    if (v13 | v24)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CA8E10]);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CA8E08]);
      return v3;
    }
    return 0;
  }
  return v3;
}

- (unint64_t)infraredProjectorUptimeInUsForLowPowerSparse
{
  return self->_infraredProjectorUptimeInUsForLowPowerSparse;
}

- (unint64_t)infraredProjectorUptimeInUsForHighPowerSparse
{
  return self->_infraredProjectorUptimeInUsForHighPowerSparse;
}

- ($2825F4736939C4A6D3AD43837233062D)firmwareStillImageDimensionsAfterOverscanCropping
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_firmwareStillImageDimensionsAfterOverscanCropping;
}

- ($2825F4736939C4A6D3AD43837233062D)zoomBasedQSubSensorRawStillImageOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_zoomBasedQSubSensorRawStillImageOutputDimensions;
}

- (BWNodeOutput)secureDetectedObjectsOutput
{
  return self->_secureDetectedObjectsOutput;
}

- (BWNodeOutput)pointCloudOutput
{
  return self->_pointCloudOutput;
}

- (BWNodeOutput)lightSourceMaskOutput
{
  return self->_lightSourceMaskOutput;
}

- (BWNodeOutput)keypointDescriptorDataOutput
{
  return self->_keypointDescriptorDataOutput;
}

- (BWNodeOutput)semanticMasksOutput
{
  return self->_semanticMasksOutput;
}

- (BWNodeOutput)eyeReliefStatusOutput
{
  return self->_eyeReliefStatusOutput;
}

- (BWNodeOutput)trackedFacesOutput
{
  return self->_trackedFacesOutput;
}

- (BWNodeOutput)preLTMThumbnailOutput
{
  return self->_preLTMThumbnailOutput;
}

- (BOOL)keepISPStreamingWhenStopping
{
  return self->_keepISPStreamingWhenStopping;
}

- (void)setKeepISPStreamingWhenStopping:(BOOL)a3
{
  self->_keepISPStreamingWhenStopping = a3;
}

- (BOOL)emitsFramesWhileStopping
{
  return self->_emitsFramesWhileStopping;
}

- (void)setEmitsFramesWhileStopping:(BOOL)a3
{
  self->_emitsFramesWhileStopping = a3;
}

- (BWDetectedFacesFilterDelegate)detectedFacesFilterDelegate
{
  return self->_detectedFacesFilterDelegate;
}

@end
