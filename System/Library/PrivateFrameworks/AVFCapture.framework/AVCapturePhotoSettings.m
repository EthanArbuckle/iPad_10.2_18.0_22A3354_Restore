@implementation AVCapturePhotoSettings

- (CMVideoDimensions)maxPhotoDimensions
{
  return (CMVideoDimensions)self->_internal->maxPhotoDimensions;
}

- (BOOL)isHighResolutionPhotoEnabled
{
  return self->_internal->highResolutionPhotoEnabled;
}

- (int64_t)HDRMode
{
  return self->_internal->HDRMode;
}

- (AVCapturePhotoQualityPrioritization)photoQualityPrioritization
{
  return self->_internal->photoQualityPrioritization;
}

- (id)_initWithFormat:(id)a3 processedFileType:(id)a4 rawPixelFormatType:(unsigned int)a5 rawFileType:(id)a6 burstQualityCaptureEnabled:(BOOL)a7 uniqueID:(int64_t)a8 exceptionReason:(id *)a9
{
  uint64_t v12;
  AVCapturePhotoSettings *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  int v22;
  id *v23;
  _BOOL4 v24;
  BOOL v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  char v32;
  id v33;
  void *v34;
  id *v35;
  void *v36;
  uint64_t v37;
  $2825F4736939C4A6D3AD43837233062D v38;
  uint64_t v39;
  uint64_t v40;
  objc_super v42;
  __CFString *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  uint64_t v49;
  _QWORD v50[2];
  uint64_t v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v12 = *(_QWORD *)&a5;
  v54 = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)AVCapturePhotoSettings;
  v43 = 0;
  v15 = -[AVCapturePhotoSettings init](&v42, sel_init);
  if (!v15)
    return v15;
  v15->_internal = objc_alloc_init(AVCapturePhotoSettingsInternal);
  v16 = *MEMORY[0x1E0CF2C58];
  if (!a3)
  {
    if ((_DWORD)v12)
    {
      a3 = 0;
      v17 = 29;
      goto LABEL_6;
    }
    v51 = *MEMORY[0x1E0CF2C58];
    v52 = *MEMORY[0x1E0CF2C90];
    a3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
  }
  v17 = 28;
LABEL_6:
  v18 = *MEMORY[0x1E0CF2C98];
  v50[0] = v16;
  v50[1] = v18;
  v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v49 = *MEMORY[0x1E0CA9040];
  if (+[AVCaptureVideoSettingsValidator validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:](AVCaptureVideoSettingsValidator, "validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:", a3, v17, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1), 0, v19, 0, &v43))
  {
    v20 = 0x1E0C99000uLL;
    if (a3)
      v15->_internal->format = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", a3);
    if (!(_DWORD)v12)
    {
LABEL_15:
      v22 = -[AVCapturePhotoSettings formatFourCC](v15, "formatFourCC");
      if (!v22)
        goto LABEL_29;
      if (a4)
        goto LABEL_28;
      if (v22 <= 1111970368)
      {
        if (v22 != 875704422 && v22 != 875704438)
          goto LABEL_28;
      }
      else if (v22 != 1111970369)
      {
        if (v22 == 1752589105)
        {
          v23 = (id *)MEMORY[0x1E0CF2AE8];
          goto LABEL_27;
        }
        if (v22 == 1785750887)
        {
          v23 = (id *)MEMORY[0x1E0CF2AF8];
LABEL_27:
          a4 = *v23;
        }
LABEL_28:
        v15->_internal->processedFileType = (NSString *)a4;
LABEL_29:
        if (!a8)
          a8 = +[AVCapturePhotoSettings uniqueID](AVCapturePhotoSettings, "uniqueID");
        v15->_internal->uniqueID = a8;
        v15->_internal->turboModeEnabled = 0;
        v24 = +[AVCapturePhotoOutput isBayerRAWPixelFormat:](AVCapturePhotoOutput, "isBayerRAWPixelFormat:", v12);
        v25 = v24;
        if (v24)
          v26 = 1;
        else
          v26 = 2;
        v15->_internal->photoQualityPrioritization = v26;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v27 = +[AVCaptureDeviceDiscoverySession allVideoDevices](AVCaptureDeviceDiscoverySession, "allVideoDevices");
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v45;
          while (2)
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v45 != v30)
                objc_enumerationMutation(v27);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "isAutoRedEyeReductionSupported") & 1) != 0)
              {
                v32 = 1;
                goto LABEL_44;
              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
            if (v29)
              continue;
            break;
          }
          v32 = 0;
LABEL_44:
          v20 = 0x1E0C99000;
        }
        else
        {
          v32 = 0;
        }
        if (!a4)
          v32 = 0;
        v15->_internal->autoRedEyeReductionEnabled = v32;
        v15->_internal->autoVirtualDeviceFusionEnabled = !v25;
        v15->_internal->burstQualityCaptureEnabled = a7;
        v15->_internal->embedsDepthDataInPhoto = 1;
        v15->_internal->depthDataFiltered = 1;
        v15->_internal->embedsPortraitEffectsMatteInPhoto = 1;
        v15->_internal->enabledSemanticSegmentationMatteTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
        v15->_internal->embedsSemanticSegmentationMattesInPhoto = 1;
        v15->_internal->metadata = (NSDictionary *)objc_alloc_init(*(Class *)(v20 + 3456));
        v15->_internal->shutterSound = 1108;
        v15->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
        v33 = (id)_initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason__sDefaultLivePhotoVideoCodecType;
        if (_initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason__sDefaultLivePhotoVideoCodecType)
          goto LABEL_52;
        v34 = (void *)objc_msgSend(+[AVCaptureDeviceDiscoverySession allVideoDevices](AVCaptureDeviceDiscoverySession, "allVideoDevices"), "firstObject");
        v35 = (id *)MEMORY[0x1E0CF2C80];
        if (v34)
        {
          v36 = v34;
          v37 = objc_msgSend((id)objc_msgSend(v34, "formats"), "lastObject");
          v38 = +[AVCapturePhotoOutput maxLivePhotoMovieDimensions](AVCapturePhotoOutput, "maxLivePhotoMovieDimensions");
          v39 = *MEMORY[0x1E0CF2B08];
          v40 = *MEMORY[0x1E0CF2C88];
          v48[0] = *v35;
          v48[1] = v40;
          v33 = (id)objc_msgSend(+[AVCaptureOutput availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:](AVCaptureOutput, "availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:", v36, v37, v38, v39, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2)), "firstObject");
          _initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason__sDefaultLivePhotoVideoCodecType = (uint64_t)v33;
          if (v33)
          {
LABEL_52:
            v15->_internal->livePhotoVideoCodecType = (NSString *)objc_msgSend(v33, "copy");
            v15->_internal->photoFilters = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
            v15->_internal->adjustedPhotoFilters = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
            v15->_internal->spatialOverCaptureMetadata = (NSDictionary *)objc_alloc_init(*(Class *)(v20 + 3456));
            v15->_internal->spatialOverCaptureMetadataForOriginalPhoto = (NSDictionary *)objc_alloc_init(*(Class *)(v20 + 3456));
            v15->_internal->previewPhotoFormatDimensionsLimitedToDisplayDimensions = 1;
            return v15;
          }
        }
        else
        {
          v33 = (id)_initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason__sDefaultLivePhotoVideoCodecType;
          if (_initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason__sDefaultLivePhotoVideoCodecType)
            goto LABEL_52;
        }
        v33 = *v35;
        _initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason__sDefaultLivePhotoVideoCodecType = (uint64_t)v33;
        goto LABEL_52;
      }
      v23 = (id *)MEMORY[0x1E0CF2B10];
      goto LABEL_27;
    }
    if (+[AVCapturePhotoOutput isBayerRAWPixelFormat:](AVCapturePhotoOutput, "isBayerRAWPixelFormat:", v12)|| +[AVCapturePhotoOutput isAppleProRAWPixelFormat:](AVCapturePhotoOutput, "isAppleProRAWPixelFormat:", v12))
    {
      v15->_internal->rawPhotoPixelFormatType = v12;
      v21 = (id)*MEMORY[0x1E0CF2AE0];
      if (a6)
        v21 = a6;
      v15->_internal->rawFileType = (NSString *)v21;
      goto LABEL_15;
    }
    v43 = CFSTR("Unrecognized raw pixel format type");
  }
  if (a9)
    *a9 = v43;

  return 0;
}

- (unsigned)formatFourCC
{
  return ps_formatFourCCForSettingsDictionary(self->_internal->format);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  AVCapturePhotoSettingsInternal *internal;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  AVCapturePhotoSettingsInternal *v9;
  int64_t photoQualityPrioritization;
  uint64_t v12;

  v12 = 0;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  internal = self->_internal;
  v6 = (_QWORD *)objc_msgSend(v4, "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", internal->format, internal->processedFileType, internal->rawPhotoPixelFormatType, internal->rawFileType, internal->burstQualityCaptureEnabled, internal->uniqueID, &v12);
  v7 = v6;
  if (v12)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
    return 0;
  }
  else
  {
    objc_msgSend(v6, "setFlashMode:", self->_internal->flashMode);
    objc_msgSend(v7, "setAutoRedEyeReductionEnabled:", self->_internal->autoRedEyeReductionEnabled);
    objc_msgSend(v7, "setDigitalFlashMode:", self->_internal->digitalFlashMode);
    objc_msgSend(v7, "setConstantColorEnabled:", self->_internal->constantColorEnabled);
    objc_msgSend(v7, "setConstantColorFallbackPhotoDeliveryEnabled:", self->_internal->constantColorFallbackPhotoDeliveryEnabled);
    objc_msgSend(v7, "setShutterSoundSuppressionEnabled:", self->_internal->shutterSoundSuppressionEnabled);
    objc_msgSend(v7, "setAutoSpatialPhotoCaptureEnabled:", self->_internal->autoSpatialPhotoCaptureEnabled);
    v9 = self->_internal;
    photoQualityPrioritization = v9->photoQualityPrioritization;
    if (v9->photoQualityPrioritizationIsSetByClient)
      objc_msgSend(v7, "setPhotoQualityPrioritization:", photoQualityPrioritization);
    else
      objc_msgSend(v7, "_setPhotoQualityPrioritization:", photoQualityPrioritization);
    objc_msgSend(v7, "setAutoVirtualDeviceFusionEnabled:", self->_internal->autoVirtualDeviceFusionEnabled);
    objc_msgSend(v7, "setVirtualDeviceConstituentPhotoDeliveryEnabledDevices:", self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices);
    objc_msgSend(v7, "setHighResolutionPhotoEnabled:", self->_internal->highResolutionPhotoEnabled);
    objc_msgSend(v7, "setDepthDataDeliveryEnabled:", self->_internal->depthDataDeliveryEnabled);
    objc_msgSend(v7, "setEmbedsDepthDataInPhoto:", self->_internal->embedsDepthDataInPhoto);
    objc_msgSend(v7, "setDepthDataFiltered:", self->_internal->depthDataFiltered);
    objc_msgSend(v7, "setCameraCalibrationDataDeliveryEnabled:", self->_internal->cameraCalibrationDataDeliveryEnabled);
    objc_msgSend(v7, "setPortraitEffectsMatteDeliveryEnabled:", self->_internal->portraitEffectsMatteDeliveryEnabled);
    objc_msgSend(v7, "setEmbedsPortraitEffectsMatteInPhoto:", self->_internal->embedsPortraitEffectsMatteInPhoto);
    objc_msgSend(v7, "setEnabledSemanticSegmentationMatteTypes:", self->_internal->enabledSemanticSegmentationMatteTypes);
    objc_msgSend(v7, "setEmbedsSemanticSegmentationMattesInPhoto:", self->_internal->embedsSemanticSegmentationMattesInPhoto);
    objc_msgSend(v7, "setMetadata:", self->_internal->metadata);
    objc_msgSend(v7, "setLivePhotoMovieFileURL:", self->_internal->livePhotoMovieFileURL);
    objc_msgSend(v7, "setLivePhotoVideoCodecType:", self->_internal->livePhotoVideoCodecType);
    objc_msgSend(v7, "setLivePhotoMovieMetadata:", self->_internal->livePhotoMovieMetadata);
    objc_msgSend(v7, "setPreviewPhotoFormat:", self->_internal->previewPhotoFormat);
    objc_msgSend(v7, "setEmbeddedThumbnailPhotoFormat:", self->_internal->embeddedThumbnailPhotoFormat);
    objc_msgSend(v7, "setRawFileFormat:", self->_internal->rawFileFormat);
    objc_msgSend(v7, "setRawEmbeddedThumbnailPhotoFormat:", self->_internal->rawEmbeddedThumbnailPhotoFormat);
    objc_msgSend(v7, "setHDRMode:", self->_internal->HDRMode);
    objc_msgSend(v7, "setEV0PhotoDeliveryEnabled:", self->_internal->EV0PhotoDeliveryEnabled);
    objc_msgSend(v7, "setLivePhotoMovieFileURLForOriginalPhoto:", self->_internal->livePhotoMovieFileURLForOriginalPhoto);
    objc_msgSend(v7, "setLivePhotoMovieMetadataForOriginalPhoto:", self->_internal->livePhotoMovieMetadataForOriginalPhoto);
    objc_msgSend(v7, "setPhotoFilters:", self->_internal->photoFilters);
    objc_msgSend(v7, "setAdjustedPhotoFilters:", self->_internal->adjustedPhotoFilters);
    objc_msgSend(v7, "setHEICSFileURL:", self->_internal->HEICSFileURL);
    objc_msgSend(v7, "setVideoFileURL:", self->_internal->videoFileURL);
    objc_msgSend(v7, "setVideoFormat:", self->_internal->videoFormat);
    objc_msgSend(v7, "setVideoFileMetadata:", self->_internal->videoFileMetadata);
    objc_msgSend(v7, "setAutoSpatialOverCaptureEnabled:", self->_internal->autoSpatialOverCaptureEnabled);
    objc_msgSend(v7, "setSpatialOverCaptureMetadata:", self->_internal->spatialOverCaptureMetadata);
    objc_msgSend(v7, "setSpatialOverCaptureLivePhotoMovieFileURL:", self->_internal->spatialOverCaptureLivePhotoMovieFileURL);
    objc_msgSend(v7, "setSpatialOverCaptureLivePhotoMovieMetadata:", self->_internal->spatialOverCaptureLivePhotoMovieMetadata);
    *(_QWORD *)(v7[1] + 336) = -[NSString copy](self->_internal->spatialOverCaptureLivePhotoContentIdentifier, "copy");
    *(_QWORD *)(v7[1] + 344) = -[NSString copy](self->_internal->spatialOverCaptureGroupIdentifier, "copy");
    objc_msgSend(v7, "setSpatialOverCaptureMetadataForOriginalPhoto:", self->_internal->spatialOverCaptureMetadataForOriginalPhoto);
    objc_msgSend(v7, "setSpatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto:", self->_internal->spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto);
    objc_msgSend(v7, "setSpatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto:", self->_internal->spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto);
    *(_QWORD *)(v7[1] + 376) = -[NSString copy](self->_internal->spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto, "copy");
    *(_QWORD *)(v7[1] + 384) = -[NSString copy](self->_internal->spatialOverCaptureGroupIdentifierForOriginalPhoto, "copy");
    objc_msgSend(v7, "setProcessedPhotoZoomWithoutUpscalingEnabled:", self->_internal->processedPhotoZoomWithoutUpscalingEnabled);
    objc_msgSend(v7, "setAutoContentAwareDistortionCorrectionEnabled:", self->_internal->autoContentAwareDistortionCorrectionEnabled);
    *(_BYTE *)(v7[1] + 264) = self->_internal->autoDeferredPhotoDeliveryEnabled;
    objc_msgSend(v7, "setSquareCropEnabled:", self->_internal->squareCropEnabled);
    objc_msgSend(v7, "setTurboModeEnabled:", self->_internal->turboModeEnabled);
    objc_msgSend(v7, "setUserInitiatedPhotoRequestTime:", self->_internal->userInitiatedPhotoRequestTime);
    objc_msgSend(v7, "setSemanticStyle:", self->_internal->semanticStyle);
    objc_msgSend(v7, "setPreviewPhotoFormatDimensionsLimitedToDisplayDimensions:", self->_internal->previewPhotoFormatDimensionsLimitedToDisplayDimensions);
    objc_msgSend(v7, "setLivePhotoContentIdentifier:", -[AVCapturePhotoSettings livePhotoContentIdentifier](self, "livePhotoContentIdentifier"));
    objc_msgSend(v7, "setLivePhotoContentIdentifierForOriginalPhoto:", -[AVCapturePhotoSettings livePhotoContentIdentifierForOriginalPhoto](self, "livePhotoContentIdentifierForOriginalPhoto"));
    objc_msgSend(v7, "setShutterSound:", self->_internal->shutterSound);
    *($470D365275581EF16070F5A11344F73E *)(v7[1] + 412) = self->_internal->maxPhotoDimensions;
  }
  return v7;
}

- (void)setFlashMode:(AVCaptureFlashMode)flashMode
{
  self->_internal->flashMode = flashMode;
}

- (void)setMaxPhotoDimensions:(CMVideoDimensions)maxPhotoDimensions
{
  self->_internal->maxPhotoDimensions = ($470D365275581EF16070F5A11344F73E)maxPhotoDimensions;
}

- (void)setHDRMode:(int64_t)a3
{
  self->_internal->HDRMode = a3;
}

- (void)setHighResolutionPhotoEnabled:(BOOL)highResolutionPhotoEnabled
{
  self->_internal->highResolutionPhotoEnabled = highResolutionPhotoEnabled;
  -[AVCapturePhotoSettings setMaxPhotoDimensions:](self, "setMaxPhotoDimensions:", 0);
}

- (void)setLivePhotoMovieFileURLForOriginalPhoto:(id)a3
{

  self->_internal->livePhotoMovieFileURLForOriginalPhoto = (NSURL *)objc_msgSend(a3, "copy");
}

- (void)setAutoVirtualDeviceFusionEnabled:(BOOL)autoVirtualDeviceFusionEnabled
{
  _BOOL4 v3;
  BOOL v5;
  void *v6;

  v3 = autoVirtualDeviceFusionEnabled;
  if (+[AVCapturePhotoOutput isBayerRAWPixelFormat:](AVCapturePhotoOutput, "isBayerRAWPixelFormat:", self->_internal->rawPhotoPixelFormatType))
  {
    v5 = !v3;
  }
  else
  {
    v5 = 1;
  }
  if (v5)
  {
    if (self->_internal->autoVirtualDeviceFusionEnabled != v3)
    {
      -[AVCapturePhotoSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("autoDualCameraFusionEnabled"));
      self->_internal->autoVirtualDeviceFusionEnabled = v3;
      -[AVCapturePhotoSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("autoDualCameraFusionEnabled"));
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (void)setLivePhotoMovieMetadata:(NSArray *)livePhotoMovieMetadata
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v5 = -[AVCapturePhotoSettings _sanitizedLivePhotoMovieMetadataForArray:exceptionReason:](self, "_sanitizedLivePhotoMovieMetadataForArray:exceptionReason:", livePhotoMovieMetadata, &v19);
  if (v19)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    v7 = v5;

    self->_internal->livePhotoMovieMetadata = (NSArray *)v7;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](livePhotoMovieMetadata, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      v11 = *MEMORY[0x1E0CF2BE0];
      v12 = *MEMORY[0x1E0CF2BF0];
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(livePhotoMovieMetadata);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v14, "keySpace"), "isEqual:", v11)
            && objc_msgSend((id)objc_msgSend(v14, "key"), "isEqual:", v12))
          {

            self->_internal->livePhotoContentIdentifier = (NSString *)objc_msgSend((id)objc_msgSend(v14, "value"), "copy");
            return;
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](livePhotoMovieMetadata, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
  }
}

- (void)setLivePhotoMovieMetadataForOriginalPhoto:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v5 = -[AVCapturePhotoSettings _sanitizedLivePhotoMovieMetadataForArray:exceptionReason:](self, "_sanitizedLivePhotoMovieMetadataForArray:exceptionReason:", a3, &v19);
  if (v19)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    v7 = v5;

    self->_internal->livePhotoMovieMetadataForOriginalPhoto = (NSArray *)v7;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      v11 = *MEMORY[0x1E0CF2BE0];
      v12 = *MEMORY[0x1E0CF2BF0];
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(a3);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v14, "keySpace"), "isEqual:", v11)
            && objc_msgSend((id)objc_msgSend(v14, "key"), "isEqual:", v12))
          {

            self->_internal->livePhotoContentIdentifierForOriginalPhoto = (NSString *)objc_msgSend((id)objc_msgSend(v14, "value"), "copy");
            return;
          }
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
  }
}

- (id)_sanitizedLivePhotoMovieMetadataForArray:(id)a3 exceptionReason:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id result;
  id *v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    v9 = CFSTR("Array must only contain AVMetadataItems");
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(a3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_35:
          if (!a4)
            return 0;
LABEL_36:
          result = 0;
          *a4 = v9;
          return result;
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }
  v11 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  if ((objc_msgSend(v11, "isEqualToString:", 0x1E4220D28) & 1) != 0
    || (objc_msgSend(v11, "isEqualToString:", 0x1E4221D68) & 1) != 0
    || (objc_msgSend(v11, "isEqualToString:", 0x1E4221D88) & 1) != 0)
  {
    LOBYTE(v24) = 0;
  }
  else
  {
    v24 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) ^ 1;
  }
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count", a4));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (!v13)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v12);
  v14 = v13;
  v15 = *(_QWORD *)v26;
  v16 = *MEMORY[0x1E0CF2BE0];
  v17 = *MEMORY[0x1E0CF2BF0];
  v18 = *MEMORY[0x1E0CF2BF8];
  v19 = *MEMORY[0x1E0CF2BE8];
LABEL_16:
  v20 = 0;
  while (1)
  {
    if (*(_QWORD *)v26 != v15)
      objc_enumerationMutation(a3);
    v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v20);
    if (objc_msgSend((id)objc_msgSend(v21, "keySpace"), "isEqual:", v16))
    {
      if (objc_msgSend((id)objc_msgSend(v21, "key"), "isEqual:", v17))
        break;
    }
    if (objc_msgSend((id)objc_msgSend(v21, "keySpace"), "isEqual:", v16)
      && (objc_msgSend((id)objc_msgSend(v21, "key"), "isEqual:", v18) & 1) != 0)
    {
      v9 = CFSTR("AVMetadataKeySpaceQuickTimeMetadata/AVMetadataQuickTimeMetadataKeySpatialOverCaptureGroupIdentifier must not be specified");
      a4 = v23;
      if (v23)
        goto LABEL_36;
      return 0;
    }
    if (objc_msgSend((id)objc_msgSend(v21, "keySpace"), "isEqual:", v16)
      && (objc_msgSend((id)objc_msgSend(v21, "key"), "isEqual:", v19) & 1) != 0)
    {
      v9 = CFSTR("AVMetadataKeySpaceQuickTimeMetadata/AVMetadataQuickTimeMetadataKeyContainsSpatialOverCaptureContent must not be specified");
      a4 = v23;
      goto LABEL_35;
    }
    objc_msgSend(v12, "addObject:", (id)objc_msgSend(v21, "copy"));
LABEL_28:
    if (v14 == ++v20)
    {
      v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v14)
        goto LABEL_16;
      return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v12);
    }
  }
  if ((v24 & 1) == 0)
    goto LABEL_28;
  a4 = v23;
  v9 = CFSTR("AVMetadataKeySpaceQuickTimeMetadata/AVMetadataQuickTimeMetadataKeyContentIdentifier must not be specified");
  if (v23)
    goto LABEL_36;
  return 0;
}

- (void)setEmbedsPortraitEffectsMatteInPhoto:(BOOL)embedsPortraitEffectsMatteInPhoto
{
  self->_internal->embedsPortraitEffectsMatteInPhoto = embedsPortraitEffectsMatteInPhoto;
}

- (void)setEmbedsDepthDataInPhoto:(BOOL)embedsDepthDataInPhoto
{
  self->_internal->embedsDepthDataInPhoto = embedsDepthDataInPhoto;
}

- (void)setDigitalFlashMode:(int64_t)a3
{
  void *v3;

  if ((unint64_t)a3 >= 3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    self->_internal->digitalFlashMode = a3;
  }
}

- (void)setUserInitiatedPhotoRequestTime:(unint64_t)a3
{
  self->_internal->userInitiatedPhotoRequestTime = a3;
}

- (void)setSquareCropEnabled:(BOOL)a3
{
  self->_internal->squareCropEnabled = a3;
}

- (void)setShutterSound:(unsigned int)a3
{
  self->_internal->shutterSound = a3;
}

- (void)setSemanticStyle:(id)a3
{

  self->_internal->semanticStyle = (AVSemanticStyle *)a3;
}

- (void)setPreviewPhotoFormatDimensionsLimitedToDisplayDimensions:(BOOL)a3
{
  self->_internal->previewPhotoFormatDimensionsLimitedToDisplayDimensions = a3;
}

- (void)setPreviewPhotoFormat:(NSDictionary *)previewPhotoFormat
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v5 = *MEMORY[0x1E0CA90E0];
  v8[0] = *MEMORY[0x1E0CA9040];
  v8[1] = v5;
  v8[2] = *MEMORY[0x1E0CA8FD8];
  if (+[AVCaptureVideoSettingsValidator validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:](AVCaptureVideoSettingsValidator, "validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:", previewPhotoFormat, 5, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3), -[AVCapturePhotoSettings availablePreviewPhotoPixelFormatTypes](self, "availablePreviewPhotoPixelFormatTypes"), 0, 0, &v7))
  {

    self->_internal->previewPhotoFormat = (NSDictionary *)-[NSDictionary copy](previewPhotoFormat, "copy");
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (NSArray)availablePreviewPhotoPixelFormatTypes
{
  unsigned int v2;
  NSArray *v3;
  NSArray *v4;
  void *v5;
  void *v6;

  v2 = -[AVCapturePhotoSettings formatFourCC](self, "formatFourCC");
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = v3;
  if (v2 == 875704438)
    v5 = &unk_1E424CB58;
  else
    v5 = &unk_1E424CB70;
  if (v2 == 875704438)
    v6 = &unk_1E424CB70;
  else
    v6 = &unk_1E424CB58;
  -[NSArray addObject:](v3, "addObject:", v5);
  -[NSArray addObject:](v4, "addObject:", v6);
  -[NSArray addObject:](v4, "addObject:", &unk_1E424CB88);
  return v4;
}

- (void)setPortraitEffectsMatteDeliveryEnabled:(BOOL)portraitEffectsMatteDeliveryEnabled
{
  self->_internal->portraitEffectsMatteDeliveryEnabled = portraitEffectsMatteDeliveryEnabled;
}

- (void)setLivePhotoMovieFileURL:(NSURL *)livePhotoMovieFileURL
{

  self->_internal->livePhotoMovieFileURL = (NSURL *)-[NSURL copy](livePhotoMovieFileURL, "copy");
}

- (void)setEmbedsSemanticSegmentationMattesInPhoto:(BOOL)embedsSemanticSegmentationMattesInPhoto
{
  self->_internal->embedsSemanticSegmentationMattesInPhoto = embedsSemanticSegmentationMattesInPhoto;
}

- (void)setEmbeddedThumbnailPhotoFormat:(NSDictionary *)embeddedThumbnailPhotoFormat
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v5 = *MEMORY[0x1E0CF2D08];
  v8[0] = *MEMORY[0x1E0CF2C58];
  v8[1] = v5;
  v8[2] = *MEMORY[0x1E0CF2CB8];
  if (+[AVCaptureVideoSettingsValidator validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:](AVCaptureVideoSettingsValidator, "validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:", embeddedThumbnailPhotoFormat, 25, 0, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3), -[AVCapturePhotoSettings availableEmbeddedThumbnailPhotoCodecTypes](self, "availableEmbeddedThumbnailPhotoCodecTypes"), &v7))
  {

    self->_internal->embeddedThumbnailPhotoFormat = (NSDictionary *)-[NSDictionary copy](embeddedThumbnailPhotoFormat, "copy");
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (NSArray)availableEmbeddedThumbnailPhotoCodecTypes
{
  char BoolAnswer;
  AVCapturePhotoSettingsInternal *internal;
  void *v5;
  uint64_t *v6;
  NSString *processedFileType;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  BoolAnswer = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCapturePhotoSettingsSupportRawEmbeddedThumbnailFormat"));
  internal = self->_internal;
  if ((BoolAnswer & 1) == 0 && internal->rawFileType)
  {
    v15 = *MEMORY[0x1E0CF2C90];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v15;
LABEL_7:
    v8 = 1;
    return (NSArray *)objc_msgSend(v5, "arrayWithObjects:count:", v6, v8, v11, v12, v13, v14, v15, v16);
  }
  processedFileType = internal->processedFileType;
  if (processedFileType)
  {
    if (-[NSString isEqual:](processedFileType, "isEqual:", *MEMORY[0x1E0CF2AF8]))
    {
      v14 = *MEMORY[0x1E0CF2C90];
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v14;
      goto LABEL_7;
    }
    if ((-[NSString isEqual:](self->_internal->processedFileType, "isEqual:", *MEMORY[0x1E0CF2AE8]) & 1) != 0
      || -[NSString isEqual:](self->_internal->processedFileType, "isEqual:", *MEMORY[0x1E0CF2AF0]))
    {
      v9 = *MEMORY[0x1E0CF2C90];
      v12 = *MEMORY[0x1E0CF2C88];
      v13 = v9;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v12;
      v8 = 2;
      return (NSArray *)objc_msgSend(v5, "arrayWithObjects:count:", v6, v8, v11, v12, v13, v14, v15, v16);
    }
    if (-[NSString isEqual:](self->_internal->processedFileType, "isEqual:", *MEMORY[0x1E0CF2B10]))
    {
      v11 = *MEMORY[0x1E0CF2C90];
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v11;
      goto LABEL_7;
    }
  }
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)setEV0PhotoDeliveryEnabled:(BOOL)a3
{
  self->_internal->EV0PhotoDeliveryEnabled = a3;
}

- (void)setDepthDataFiltered:(BOOL)depthDataFiltered
{
  self->_internal->depthDataFiltered = depthDataFiltered;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)depthDataDeliveryEnabled
{
  self->_internal->depthDataDeliveryEnabled = depthDataDeliveryEnabled;
}

- (void)setAutoContentAwareDistortionCorrectionEnabled:(BOOL)autoContentAwareDistortionCorrectionEnabled
{
  self->_internal->autoContentAwareDistortionCorrectionEnabled = autoContentAwareDistortionCorrectionEnabled;
}

- (void)setVirtualDeviceConstituentPhotoDeliveryEnabledDevices:(NSArray *)virtualDeviceConstituentPhotoDeliveryEnabledDevices
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (virtualDeviceConstituentPhotoDeliveryEnabledDevices)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](virtualDeviceConstituentPhotoDeliveryEnabledDevices, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(virtualDeviceConstituentPhotoDeliveryEnabledDevices);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "isVirtualDevice"))
          {
            v10 = (void *)MEMORY[0x1E0C99DA0];
            v11 = *MEMORY[0x1E0C99778];
            goto LABEL_16;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](virtualDeviceConstituentPhotoDeliveryEnabledDevices, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", virtualDeviceConstituentPhotoDeliveryEnabledDevices), "count");
    if (v9 == -[NSArray count](virtualDeviceConstituentPhotoDeliveryEnabledDevices, "count"))
    {
      if ((-[NSArray isEqual:](self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices, "isEqual:", virtualDeviceConstituentPhotoDeliveryEnabledDevices) & 1) == 0)
      {
        -[AVCapturePhotoSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("dualCameraDualPhotoDeliveryEnabled"));

        self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", virtualDeviceConstituentPhotoDeliveryEnabledDevices);
        -[AVCapturePhotoSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("dualCameraDualPhotoDeliveryEnabled"));
      }
      return;
    }
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
  }
LABEL_16:
  v12 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v12);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
}

- (void)setVideoFormat:(id)a3
{
  NSDictionary *videoFormat;

  videoFormat = self->_internal->videoFormat;
  if (videoFormat != a3)
  {

    self->_internal->videoFormat = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (void)setVideoFileURL:(id)a3
{
  NSURL *videoFileURL;

  videoFileURL = self->_internal->videoFileURL;
  if (videoFileURL != a3)
  {

    self->_internal->videoFileURL = (NSURL *)objc_msgSend(a3, "copy");
  }
}

- (void)setVideoFileMetadata:(id)a3
{
  NSArray *videoFileMetadata;

  videoFileMetadata = self->_internal->videoFileMetadata;
  if (videoFileMetadata != a3)
  {

    self->_internal->videoFileMetadata = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (void)setTurboModeEnabled:(BOOL)a3
{
  AVCapturePhotoSettingsInternal *internal;
  void *v4;

  internal = self->_internal;
  if (a3 && internal->autoSpatialOverCaptureEnabled)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else
  {
    internal->turboModeEnabled = a3;
  }
}

- (void)setSpatialOverCaptureMetadataForOriginalPhoto:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  if (a3)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", +[AVCapturePhotoOutput validMetadataTopLevelCGImagePropertiesKeys](AVCapturePhotoOutput, "validMetadataTopLevelCGImagePropertiesKeys"));
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a3, "allKeys"));
    objc_msgSend(v6, "minusSet:", v5);
    if (!objc_msgSend(v6, "count"))
    {

      self->_internal->spatialOverCaptureMetadataForOriginalPhoto = (NSDictionary *)objc_msgSend(a3, "copy");
      return;
    }
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v15 = v6;
    v9 = AVMethodExceptionReasonWithObjectAndSelector();
    v10 = v7;
    v11 = v8;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v9 = AVMethodExceptionReasonWithObjectAndSelector();
    v10 = v12;
    v11 = v13;
  }
  v14 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v9, 0, v15);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v14);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
}

- (void)setSpatialOverCaptureMetadata:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  if (a3)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", +[AVCapturePhotoOutput validMetadataTopLevelCGImagePropertiesKeys](AVCapturePhotoOutput, "validMetadataTopLevelCGImagePropertiesKeys"));
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a3, "allKeys"));
    objc_msgSend(v6, "minusSet:", v5);
    if (!objc_msgSend(v6, "count"))
    {

      self->_internal->spatialOverCaptureMetadata = (NSDictionary *)objc_msgSend(a3, "copy");
      return;
    }
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v15 = v6;
    v9 = AVMethodExceptionReasonWithObjectAndSelector();
    v10 = v7;
    v11 = v8;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v9 = AVMethodExceptionReasonWithObjectAndSelector();
    v10 = v12;
    v11 = v13;
  }
  v14 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v9, 0, v15);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v14);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
}

- (void)setMetadata:(NSDictionary *)metadata
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  if (metadata)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", +[AVCapturePhotoOutput validMetadataTopLevelCGImagePropertiesKeys](AVCapturePhotoOutput, "validMetadataTopLevelCGImagePropertiesKeys"));
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", -[NSDictionary allKeys](metadata, "allKeys"));
    objc_msgSend(v6, "minusSet:", v5);
    if (!objc_msgSend(v6, "count"))
    {

      self->_internal->metadata = (NSDictionary *)-[NSDictionary copy](metadata, "copy");
      return;
    }
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v15 = v6;
    v9 = AVMethodExceptionReasonWithObjectAndSelector();
    v10 = v7;
    v11 = v8;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v9 = AVMethodExceptionReasonWithObjectAndSelector();
    v10 = v12;
    v11 = v13;
  }
  v14 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v9, 0, v15);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v14);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
}

- (void)setSpatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v5 = -[AVCapturePhotoSettings _sanitizedLivePhotoMovieMetadataForArray:exceptionReason:](self, "_sanitizedLivePhotoMovieMetadataForArray:exceptionReason:", a3, &v19);
  if (v19)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    v7 = v5;

    self->_internal->spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto = (NSArray *)v7;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      v11 = *MEMORY[0x1E0CF2BE0];
      v12 = *MEMORY[0x1E0CF2BF0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(a3);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v14, "keySpace"), "isEqual:", v11)
            && objc_msgSend((id)objc_msgSend(v14, "key"), "isEqual:", v12))
          {

            self->_internal->spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto = (NSString *)objc_msgSend((id)objc_msgSend(v14, "value"), "copy");
          }
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }
  }
}

- (void)setSpatialOverCaptureLivePhotoMovieMetadata:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v5 = -[AVCapturePhotoSettings _sanitizedLivePhotoMovieMetadataForArray:exceptionReason:](self, "_sanitizedLivePhotoMovieMetadataForArray:exceptionReason:", a3, &v19);
  if (v19)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    v7 = v5;

    self->_internal->spatialOverCaptureLivePhotoMovieMetadata = (NSArray *)v7;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      v11 = *MEMORY[0x1E0CF2BE0];
      v12 = *MEMORY[0x1E0CF2BF0];
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(a3);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v14, "keySpace"), "isEqual:", v11)
            && objc_msgSend((id)objc_msgSend(v14, "key"), "isEqual:", v12))
          {

            self->_internal->spatialOverCaptureLivePhotoContentIdentifier = (NSString *)objc_msgSend((id)objc_msgSend(v14, "value"), "copy");
            return;
          }
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
  }
}

- (void)setSpatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto:(id)a3
{

  self->_internal->spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto = (NSURL *)objc_msgSend(a3, "copy");
}

- (void)setSpatialOverCaptureLivePhotoMovieFileURL:(id)a3
{

  self->_internal->spatialOverCaptureLivePhotoMovieFileURL = (NSURL *)objc_msgSend(a3, "copy");
}

- (void)setRawEmbeddedThumbnailPhotoFormat:(NSDictionary *)rawEmbeddedThumbnailPhotoFormat
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v5 = *MEMORY[0x1E0CF2D08];
  v8[0] = *MEMORY[0x1E0CF2C58];
  v8[1] = v5;
  v8[2] = *MEMORY[0x1E0CF2CB8];
  if (+[AVCaptureVideoSettingsValidator validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:](AVCaptureVideoSettingsValidator, "validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:", rawEmbeddedThumbnailPhotoFormat, 25, 0, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3), -[AVCapturePhotoSettings availableRawEmbeddedThumbnailPhotoCodecTypes](self, "availableRawEmbeddedThumbnailPhotoCodecTypes"), &v7))
  {

    self->_internal->rawEmbeddedThumbnailPhotoFormat = (NSDictionary *)-[NSDictionary copy](rawEmbeddedThumbnailPhotoFormat, "copy");
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (void)setProcessedPhotoZoomWithoutUpscalingEnabled:(BOOL)a3
{
  self->_internal->processedPhotoZoomWithoutUpscalingEnabled = a3;
}

- (void)setPhotoFilters:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
LABEL_15:
    v11 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v11);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
    return;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = (void *)MEMORY[0x1E0C99DA0];
          v10 = *MEMORY[0x1E0C99778];
          goto LABEL_15;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  if ((objc_msgSend(a3, "isEqual:", self->_internal->photoFilters) & 1) == 0)
  {
    if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementFilterRendering) & 1) != 0)
    {

      self->_internal->photoFilters = (NSArray *)objc_msgSend(a3, "copy");
      return;
    }
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    goto LABEL_15;
  }
}

- (void)setLivePhotoVideoCodecType:(AVVideoCodecType)livePhotoVideoCodecType
{
  void *v5;

  if (livePhotoVideoCodecType)
  {

    self->_internal->livePhotoVideoCodecType = (NSString *)-[NSString copy](livePhotoVideoCodecType, "copy");
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (void)setLivePhotoContentIdentifierForOriginalPhoto:(id)a3
{

  self->_internal->livePhotoContentIdentifierForOriginalPhoto = (NSString *)objc_msgSend(a3, "copy");
}

- (void)setLivePhotoContentIdentifier:(id)a3
{

  self->_internal->livePhotoContentIdentifier = (NSString *)objc_msgSend(a3, "copy");
}

- (void)setHEICSFileURL:(id)a3
{
  NSURL *HEICSFileURL;

  HEICSFileURL = self->_internal->HEICSFileURL;
  if (HEICSFileURL != a3)
  {

    self->_internal->HEICSFileURL = (NSURL *)objc_msgSend(a3, "copy");
  }
}

- (void)setEnabledSemanticSegmentationMatteTypes:(NSArray *)enabledSemanticSegmentationMatteTypes
{
  void *v5;

  if (enabledSemanticSegmentationMatteTypes)
  {

    self->_internal->enabledSemanticSegmentationMatteTypes = (NSArray *)-[NSArray copy](enabledSemanticSegmentationMatteTypes, "copy");
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (void)setConstantColorFallbackPhotoDeliveryEnabled:(BOOL)a3
{
  self->_internal->constantColorFallbackPhotoDeliveryEnabled = a3;
}

- (void)setConstantColorEnabled:(BOOL)a3
{
  self->_internal->constantColorEnabled = a3;
}

- (void)setCameraCalibrationDataDeliveryEnabled:(BOOL)cameraCalibrationDataDeliveryEnabled
{
  self->_internal->cameraCalibrationDataDeliveryEnabled = cameraCalibrationDataDeliveryEnabled;
}

- (void)setAutoSpatialOverCaptureEnabled:(BOOL)a3
{
  AVCapturePhotoSettingsInternal *internal;
  void *v4;

  internal = self->_internal;
  if (a3 && internal->turboModeEnabled)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else
  {
    internal->autoSpatialOverCaptureEnabled = a3;
  }
}

- (void)setAutoRedEyeReductionEnabled:(BOOL)autoRedEyeReductionEnabled
{
  self->_internal->autoRedEyeReductionEnabled = autoRedEyeReductionEnabled;
}

- (void)setAdjustedPhotoFilters:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
LABEL_15:
    v11 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v11);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
    return;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = (void *)MEMORY[0x1E0C99DA0];
          v10 = *MEMORY[0x1E0C99778];
          goto LABEL_15;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  if ((objc_msgSend(a3, "isEqual:", self->_internal->adjustedPhotoFilters) & 1) == 0)
  {
    if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementFilterRendering) & 1) != 0)
    {

      self->_internal->adjustedPhotoFilters = (NSArray *)objc_msgSend(a3, "copy");
      return;
    }
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    goto LABEL_15;
  }
}

- (id)livePhotoContentIdentifier
{
  id result;

  result = self->_internal->livePhotoContentIdentifier;
  if (!result)
  {
    self->_internal->livePhotoContentIdentifier = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    return self->_internal->livePhotoContentIdentifier;
  }
  return result;
}

- (id)livePhotoContentIdentifierForOriginalPhoto
{
  id result;

  result = self->_internal->livePhotoContentIdentifierForOriginalPhoto;
  if (!result)
  {
    self->_internal->livePhotoContentIdentifierForOriginalPhoto = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    return self->_internal->livePhotoContentIdentifierForOriginalPhoto;
  }
  return result;
}

- (NSArray)availableRawEmbeddedThumbnailPhotoCodecTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  if (!self->_internal->rawFileType)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v3[0] = *MEMORY[0x1E0CF2C90];
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (void)_setPhotoQualityPrioritization:(int64_t)a3
{
  self->_internal->photoQualityPrioritization = a3;
}

- (NSArray)virtualDeviceConstituentPhotoDeliveryEnabledDevices
{
  return self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices;
}

- (OSType)rawPhotoPixelFormatType
{
  return self->_internal->rawPhotoPixelFormatType;
}

- (void)setPhotoQualityPrioritization:(AVCapturePhotoQualityPrioritization)photoQualityPrioritization
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  AVCapturePhotoQualityPrioritization v14;

  v5 = +[AVCapturePhotoOutput isBayerRAWPixelFormat:](AVCapturePhotoOutput, "isBayerRAWPixelFormat:", self->_internal->rawPhotoPixelFormatType);
  if (photoQualityPrioritization >= AVCapturePhotoQualityPrioritizationBalanced && v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = AVMethodExceptionReasonWithObjectAndSelector();
    v9 = v6;
    v10 = v7;
  }
  else
  {
    if ((unint64_t)(photoQualityPrioritization - 1) < 3)
    {
      self->_internal->photoQualityPrioritization = photoQualityPrioritization;
      self->_internal->photoQualityPrioritizationIsSetByClient = 1;
      return;
    }
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v14 = photoQualityPrioritization;
    v8 = AVMethodExceptionReasonWithObjectAndSelector();
    v9 = v11;
    v10 = v12;
  }
  v13 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v8, 0, v14);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v13);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
}

- (int64_t)digitalFlashMode
{
  return self->_internal->digitalFlashMode;
}

- (AVCaptureFlashMode)flashMode
{
  return self->_internal->flashMode;
}

- (void)dealloc
{
  AVCapturePhotoSettingsInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVCapturePhotoSettings;
  -[AVCapturePhotoSettings dealloc](&v4, sel_dealloc);
}

- (BOOL)isDepthDataDeliveryEnabled
{
  return self->_internal->depthDataDeliveryEnabled;
}

- (BOOL)isSquareCropEnabled
{
  return self->_internal->squareCropEnabled;
}

- (NSURL)livePhotoMovieFileURL
{
  return self->_internal->livePhotoMovieFileURL;
}

- (NSDictionary)format
{
  return self->_internal->format;
}

- (BOOL)isConstantColorEnabled
{
  return self->_internal->constantColorEnabled;
}

- (BOOL)isPortraitEffectsMatteDeliveryEnabled
{
  return self->_internal->portraitEffectsMatteDeliveryEnabled;
}

- (BOOL)isEV0PhotoDeliveryEnabled
{
  return self->_internal->EV0PhotoDeliveryEnabled;
}

- (NSArray)enabledSemanticSegmentationMatteTypes
{
  return self->_internal->enabledSemanticSegmentationMatteTypes;
}

- (id)adjustedPhotoFilters
{
  return self->_internal->adjustedPhotoFilters;
}

- (unsigned)shutterSound
{
  return self->_internal->shutterSound;
}

- (AVFileType)rawFileType
{
  return self->_internal->rawFileType;
}

- (AVFileType)processedFileType
{
  return self->_internal->processedFileType;
}

- (id)photoFilters
{
  return self->_internal->photoFilters;
}

- (BOOL)isProcessedPhotoZoomWithoutUpscalingEnabled
{
  return self->_internal->processedPhotoZoomWithoutUpscalingEnabled;
}

- (BOOL)isConstantColorFallbackPhotoDeliveryEnabled
{
  return self->_internal->constantColorFallbackPhotoDeliveryEnabled;
}

- (BOOL)isCameraCalibrationDataDeliveryEnabled
{
  return self->_internal->cameraCalibrationDataDeliveryEnabled;
}

- (BOOL)isAutoSpatialOverCaptureEnabled
{
  return self->_internal->autoSpatialOverCaptureEnabled;
}

- (BOOL)isAutoContentAwareDistortionCorrectionEnabled
{
  return self->_internal->autoContentAwareDistortionCorrectionEnabled;
}

- (id)videoFileURL
{
  return self->_internal->videoFileURL;
}

- (unsigned)previewFormatFourCC
{
  return ps_formatFourCCForSettingsDictionary(self->_internal->previewPhotoFormat);
}

- (BOOL)photoQualityPrioritizationIsSetByClient
{
  return self->_internal->photoQualityPrioritizationIsSetByClient;
}

- (id)livePhotoMovieFileURLForOriginalPhoto
{
  return self->_internal->livePhotoMovieFileURLForOriginalPhoto;
}

- (BOOL)isDualCameraDualPhotoDeliveryEnabled
{
  AVCaptureDevice *v3;
  void *v5;

  v3 = +[AVCaptureDevice defaultDeviceWithDeviceType:mediaType:position:](AVCaptureDevice, "defaultDeviceWithDeviceType:mediaType:position:", CFSTR("AVCaptureDeviceTypeBuiltInDualCamera"), *MEMORY[0x1E0CF2B90], 0);
  if ((__CFString *)-[AVCaptureDevice deviceType](v3, "deviceType") != CFSTR("AVCaptureDeviceTypeBuiltInDualCamera"))
    return 0;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[AVCaptureDevice constituentDevices](v3, "constituentDevices"));
  return objc_msgSend(v5, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices));
}

- (unsigned)embeddedThumbnailFormatFourCC
{
  return ps_formatFourCCForSettingsDictionary(self->_internal->embeddedThumbnailPhotoFormat);
}

- (id)HEICSFileURL
{
  return self->_internal->HEICSFileURL;
}

- (id)semanticStyle
{
  return self->_internal->semanticStyle;
}

- (unint64_t)userInitiatedPhotoRequestTime
{
  return self->_internal->userInitiatedPhotoRequestTime;
}

- (int64_t)uniqueID
{
  return self->_internal->uniqueID;
}

- (unsigned)rawEmbeddedThumbnailFormatFourCC
{
  char BoolAnswer;
  AVCapturePhotoSettingsInternal *internal;
  uint64_t v5;

  BoolAnswer = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCapturePhotoSettingsSupportRawEmbeddedThumbnailFormat"));
  internal = self->_internal;
  if ((BoolAnswer & 1) != 0 || !internal->rawFileType)
    v5 = 216;
  else
    v5 = 200;
  return ps_formatFourCCForSettingsDictionary(*(void **)((char *)&internal->super.isa + v5));
}

- (CGSize)previewCGSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = ps_CGSizeForSettingsDictionary(self->_internal->previewPhotoFormat);
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSDictionary)metadata
{
  NSDictionary *v3;
  NSDictionary *v4;
  uint64_t v5;
  id v6;

  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_internal->metadata);
  v4 = v3;
  if (self->_internal->autoSpatialOverCaptureEnabled)
  {
    v5 = *MEMORY[0x1E0CBCF70];
    v6 = -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
    if (!v6)
    {
      v6 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, v5);
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"), CFSTR("41"));
  }
  return v4;
}

- (id)metadataForOriginalPhoto
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_internal->metadata);
  v4 = v3;
  if (self->_internal->autoSpatialOverCaptureEnabled)
  {
    v5 = *MEMORY[0x1E0CBCF70];
    v6 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
    if (!v6)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifierForOriginalPhoto](self, "spatialOverCaptureGroupIdentifierForOriginalPhoto"), CFSTR("41"));
  }
  return v4;
}

- (BOOL)isTurboModeEnabled
{
  return self->_internal->turboModeEnabled;
}

- (BOOL)isDepthDataFiltered
{
  return self->_internal->depthDataFiltered;
}

- (BOOL)isAutoVirtualDeviceFusionEnabled
{
  return self->_internal->autoVirtualDeviceFusionEnabled;
}

- (BOOL)isAutoRedEyeReductionEnabled
{
  return self->_internal->autoRedEyeReductionEnabled;
}

- (BOOL)embedsPortraitEffectsMatteInPhoto
{
  return self->_internal->embedsPortraitEffectsMatteInPhoto;
}

- (BOOL)embedsDepthDataInPhoto
{
  return self->_internal->embedsDepthDataInPhoto;
}

- (CGSize)embeddedThumbnailCGSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = ps_CGSizeForSettingsDictionary(self->_internal->embeddedThumbnailPhotoFormat);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)arePreviewPhotoFormatDimensionsLimitedToDisplayDimensions
{
  return self->_internal->previewPhotoFormatDimensionsLimitedToDisplayDimensions;
}

+ (void)initialize
{
  objc_opt_class();
}

+ (AVCapturePhotoSettings)photoSettingsFromPhotoSettings:(AVCapturePhotoSettings *)photoSettings
{
  _QWORD *v3;

  v3 = (_QWORD *)-[AVCapturePhotoSettings copy](photoSettings, "copy");
  *(_QWORD *)(v3[1] + 40) = +[AVCapturePhotoSettings uniqueID](AVCapturePhotoSettings, "uniqueID");
  return (AVCapturePhotoSettings *)v3;
}

+ (int64_t)uniqueID
{
  unint64_t v2;
  int64_t result;

  do
  {
    v2 = __ldxr(&uniqueID_sCurrentUniqueID);
    result = v2 + 1;
  }
  while (__stxr(v2 + 1, &uniqueID_sCurrentUniqueID));
  return result;
}

+ (AVCapturePhotoSettings)photoSettings
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", 0, 0, 0, 0, 0, 0, &v6);
  v3 = v2;
  if (!v6)
    return (AVCapturePhotoSettings *)v2;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  return 0;
}

+ (AVCapturePhotoSettings)photoSettingsWithFormat:(NSDictionary *)format
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", format, 0, 0, 0, 0, 0, &v7);
  v4 = v3;
  if (!v7)
    return (AVCapturePhotoSettings *)v3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v5);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  return 0;
}

- (BOOL)isBurstQualityCaptureEnabled
{
  return self->_internal->burstQualityCaptureEnabled;
}

+ (id)burstQualityPhotoSettings
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", 0, 0, 0, 0, 1, 0, &v6);
  v3 = v2;
  if (v6)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
    return 0;
  }
  else
  {
    objc_msgSend(v2, "_setPhotoQualityPrioritization:", 1);
    objc_msgSend(v3, "setAutoVirtualDeviceFusionEnabled:", 0);
    return v3;
  }
}

+ (AVCapturePhotoSettings)photoSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", 0, 0, *(_QWORD *)&rawPixelFormatType, 0, 0, 0, &v7);
  v4 = v3;
  if (!v7)
    return (AVCapturePhotoSettings *)v3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v5);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  return 0;
}

+ (AVCapturePhotoSettings)photoSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType processedFormat:(NSDictionary *)processedFormat
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v8 = 0;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", processedFormat, 0, *(_QWORD *)&rawPixelFormatType, 0, 0, 0, &v8);
  v5 = v4;
  if (!v8)
    return (AVCapturePhotoSettings *)v4;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v6);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  return 0;
}

+ (AVCapturePhotoSettings)photoSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType rawFileType:(AVFileType)rawFileType processedFormat:(NSDictionary *)processedFormat processedFileType:(AVFileType)processedFileType
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v10 = 0;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", processedFormat, processedFileType, *(_QWORD *)&rawPixelFormatType, rawFileType, 0, 0, &v10);
  v7 = v6;
  if (!v10)
    return (AVCapturePhotoSettings *)v6;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  return 0;
}

+ (id)photoSettingsFromPhotoInitiationSettings:(id)a3 format:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v9 = 0;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", a4, 0, 0, 0, objc_msgSend(a3, "burstQualityCaptureEnabled"), objc_msgSend(a3, "uniqueID"), &v9);
  objc_msgSend(v5, "setFlashMode:", objc_msgSend(a3, "flashMode"));
  if (objc_msgSend(a3, "isAutoStillImageStabilizationEnabled"))
    v6 = 2;
  else
    v6 = 1;
  objc_msgSend(v5, "_setPhotoQualityPrioritization:", v6);
  objc_msgSend(v5, "setHDRMode:", objc_msgSend(a3, "HDRMode"));
  objc_msgSend(v5, "setUserInitiatedPhotoRequestTime:", objc_msgSend(a3, "timestamp"));
  if (!v9)
    return v5;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v7);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  return 0;
}

- (AVCapturePhotoSettings)init
{
  AVCapturePhotoSettings *v2;
  void *v3;
  uint64_t v5;

  v5 = 0;
  v2 = -[AVCapturePhotoSettings _initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:](self, "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", 0, 0, 0, 0, 0, 0, &v5);
  if (v5)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
    return 0;
  }
  return v2;
}

- (id)debugDescription
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  NSString *processedFileType;
  const __CFString *v7;
  AVCapturePhotoSettingsInternal *internal;
  void *v9;
  uint64_t v10;
  NSString *rawFileType;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  NSArray *virtualDeviceConstituentPhotoDeliveryEnabledDevices;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  const __CFString *v22;
  AVCapturePhotoSettingsInternal *v23;
  void *v24;
  NSURL *livePhotoMovieFileURLForOriginalPhoto;
  const __CFString *v26;
  uint64_t v27;
  AVCapturePhotoSettingsInternal *v28;
  AVCapturePhotoSettingsInternal *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  __CFString *v33;
  NSArray *enabledSemanticSegmentationMatteTypes;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  AVCapturePhotoSettingsInternal *v43;
  AVCapturePhotoSettingsInternal *v44;
  NSURL *livePhotoMovieFileURL;
  const __CFString *v46;
  AVCapturePhotoSettingsInternal *v47;
  AVSemanticStyle *semanticStyle;
  NSURL *HEICSFileURL;
  const __CFString *v50;
  NSURL *videoFileURL;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  const __CFString *v56;
  const __CFString *v57;
  NSURL *spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  unsigned int v76;
  unsigned int v77;
  uint64_t v78;
  _BOOL4 burstQualityCaptureEnabled;
  _BOOL4 turboModeEnabled;
  const __CFString *v81;
  const __CFString *v82;
  _BOOL4 highResolutionPhotoEnabled;
  _BOOL4 squareCropEnabled;
  const __CFString *v85;
  uint64_t v86;
  const __CFString *v87;
  const __CFString *v88;
  _BOOL4 v89;
  _BOOL4 autoSpatialPhotoCaptureEnabled;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  const __CFString *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CB3000uLL;
  if (-[AVCapturePhotoSettings formatFourCC](self, "formatFourCC"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[AVCapturePhotoSettings formatFourCC](self, "formatFourCC");
    v5 = AVStringForOSType();
    processedFileType = self->_internal->processedFileType;
    if (processedFileType)
      v7 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), ps_shortStringForFileType(processedFileType));
    else
      v7 = &stru_1E421DB28;
    v94 = (const __CFString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v5, v7);
  }
  else
  {
    v94 = CFSTR("(null)");
  }
  internal = self->_internal;
  if (internal->rawPhotoPixelFormatType)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = AVStringForOSType();
    rawFileType = self->_internal->rawFileType;
    if (rawFileType)
      v12 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), ps_shortStringForFileType(rawFileType));
    else
      v12 = &stru_1E421DB28;
    v93 = (const __CFString *)objc_msgSend(v9, "stringWithFormat:", CFSTR(" raw:%@%@"), v10, v12);
    internal = self->_internal;
  }
  else
  {
    v93 = &stru_1E421DB28;
  }
  if (internal->flashMode)
  {
    v92 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" flash:%d"), internal->flashMode);
    internal = self->_internal;
  }
  else
  {
    v92 = &stru_1E421DB28;
  }
  if (internal->constantColorEnabled)
  {
    if (internal->constantColorFallbackPhotoDeliveryEnabled)
      v13 = CFSTR("(fallback:1)");
    else
      v13 = &stru_1E421DB28;
    v91 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" constant-color:1%@"), v13);
    internal = self->_internal;
  }
  else
  {
    v91 = &stru_1E421DB28;
  }
  autoSpatialPhotoCaptureEnabled = internal->autoSpatialPhotoCaptureEnabled;
  if (-[NSArray count](internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices, "count"))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    virtualDeviceConstituentPhotoDeliveryEnabledDevices = self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices;
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](virtualDeviceConstituentPhotoDeliveryEnabledDevices, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v96 != v19)
            objc_enumerationMutation(virtualDeviceConstituentPhotoDeliveryEnabledDevices);
          objc_msgSend(v16, "appendFormat:", CFSTR("%@+"), AVCaptureDeviceTypeToShortString((void *)objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "deviceType")));
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](virtualDeviceConstituentPhotoDeliveryEnabledDevices, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
      }
      while (v18);
    }
    if ((unint64_t)objc_msgSend(v16, "length") < 2)
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v16);
    else
      v21 = objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "length") - 1);
    v22 = (const __CFString *)objc_msgSend(v14, "stringWithFormat:", CFSTR(" constituent-photos:%@"), v21);
  }
  else
  {
    v22 = &stru_1E421DB28;
  }
  v23 = self->_internal;
  if (v23->autoVirtualDeviceFusionEnabled)
  {
    v89 = -[NSArray count](v23->virtualDeviceConstituentPhotoDeliveryEnabledDevices, "count") == 0;
    v23 = self->_internal;
  }
  else
  {
    v89 = 0;
  }
  v24 = (void *)MEMORY[0x1E0CB3940];
  if (v23->EV0PhotoDeliveryEnabled
    && (livePhotoMovieFileURLForOriginalPhoto = v23->livePhotoMovieFileURLForOriginalPhoto) != 0)
  {
    v26 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%@, content-id:%@"), -[NSURL lastPathComponent](livePhotoMovieFileURLForOriginalPhoto, "lastPathComponent"), -[AVCapturePhotoSettings livePhotoContentIdentifierForOriginalPhoto](self, "livePhotoContentIdentifierForOriginalPhoto"));
  }
  else
  {
    v26 = &stru_1E421DB28;
  }
  v27 = objc_msgSend(v24, "stringWithFormat:", CFSTR("%@"), v26);
  v28 = self->_internal;
  if (v28->EV0PhotoDeliveryEnabled)
  {
    v88 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (EV0:1%@)"), v27);
    v28 = self->_internal;
  }
  else
  {
    v88 = &stru_1E421DB28;
  }
  if (v28->HDRMode)
  {
    v87 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" HDR:%d"), v28->HDRMode);
    v28 = self->_internal;
  }
  else
  {
    v87 = &stru_1E421DB28;
  }
  v86 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" quality:%d"), v28->photoQualityPrioritization);
  v29 = self->_internal;
  squareCropEnabled = v29->squareCropEnabled;
  highResolutionPhotoEnabled = v29->highResolutionPhotoEnabled;
  if (v29->depthDataDeliveryEnabled)
  {
    if (v29->embedsDepthDataInPhoto)
      v30 = "";
    else
      v30 = "(not embedded)";
    if (v29->depthDataFiltered)
      v31 = "";
    else
      v31 = "(unfiltered)";
    v85 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" depth:ON%s%s"), v30, v31);
    v29 = self->_internal;
  }
  else
  {
    v85 = &stru_1E421DB28;
  }
  if (v29->portraitEffectsMatteDeliveryEnabled)
  {
    if (v29->embedsPortraitEffectsMatteInPhoto)
      v32 = "";
    else
      v32 = "(not embedded)";
    v82 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" portrait-matte:ON%s"), v32);
    v29 = self->_internal;
  }
  else
  {
    v82 = &stru_1E421DB28;
  }
  v33 = &stru_1E421DB28;
  if (-[NSArray count](v29->enabledSemanticSegmentationMatteTypes, "count"))
  {
    enabledSemanticSegmentationMatteTypes = self->_internal->enabledSemanticSegmentationMatteTypes;
    v35 = -[NSArray containsObject:](enabledSemanticSegmentationMatteTypes, "containsObject:", CFSTR("AVSemanticSegmentationMatteTypeHair"));
    v36 = -[NSArray containsObject:](enabledSemanticSegmentationMatteTypes, "containsObject:", CFSTR("AVSemanticSegmentationMatteTypeSkin"));
    v37 = -[NSArray containsObject:](enabledSemanticSegmentationMatteTypes, "containsObject:", CFSTR("AVSemanticSegmentationMatteTypeTeeth"));
    v38 = -[NSArray containsObject:](enabledSemanticSegmentationMatteTypes, "containsObject:", CFSTR("AVSemanticSegmentationMatteTypeGlasses"));
    v39 = CFSTR("hair,");
    if (!v35)
      v39 = &stru_1E421DB28;
    v40 = CFSTR("skin,");
    if (!v36)
      v40 = &stru_1E421DB28;
    v41 = CFSTR("teeth,");
    if (!v37)
      v41 = &stru_1E421DB28;
    v42 = CFSTR("glasses,");
    if (!v38)
      v42 = &stru_1E421DB28;
    v33 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR(" seg-mattes:{%@%@%@%@}"), v39, v40, v41, v42);
    -[__CFString deleteCharactersInRange:](v33, "deleteCharactersInRange:", -[__CFString length](v33, "length") - 2, 1);
  }
  v43 = self->_internal;
  turboModeEnabled = v43->turboModeEnabled;
  burstQualityCaptureEnabled = v43->burstQualityCaptureEnabled;
  v78 = -[NSDictionary count](v43->previewPhotoFormat, "count");
  v77 = -[AVCapturePhotoSettings embeddedThumbnailFormatFourCC](self, "embeddedThumbnailFormatFourCC");
  v76 = -[AVCapturePhotoSettings rawEmbeddedThumbnailFormatFourCC](self, "rawEmbeddedThumbnailFormatFourCC");
  v44 = self->_internal;
  if (v44->shutterSound == 1108)
  {
    v81 = &stru_1E421DB28;
  }
  else
  {
    v81 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" custom-shutter:%d"), v44->shutterSound);
    v44 = self->_internal;
  }
  livePhotoMovieFileURL = v44->livePhotoMovieFileURL;
  if (livePhotoMovieFileURL)
  {
    v46 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" mov:{%@, %@, content-id:%@}"), -[NSURL lastPathComponent](livePhotoMovieFileURL, "lastPathComponent"), -[AVCapturePhotoSettings livePhotoVideoCodecType](self, "livePhotoVideoCodecType"), -[AVCapturePhotoSettings livePhotoContentIdentifier](self, "livePhotoContentIdentifier"));
    v44 = self->_internal;
  }
  else
  {
    v46 = &stru_1E421DB28;
  }
  if (-[NSArray count](v44->photoFilters, "count"))
    v75 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" photo-filters:[%@]"), AVCIFilterArrayDescription(self->_internal->photoFilters));
  else
    v75 = &stru_1E421DB28;
  if (-[NSArray count](self->_internal->adjustedPhotoFilters, "count"))
    v74 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" adjusted-filters:[%@]"), AVCIFilterArrayDescription(self->_internal->adjustedPhotoFilters));
  else
    v74 = &stru_1E421DB28;
  v47 = self->_internal;
  semanticStyle = v47->semanticStyle;
  if (semanticStyle)
  {
    v73 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" semantic-style:{%@}"), -[AVSemanticStyle debugDescription](semanticStyle, "debugDescription"));
    v47 = self->_internal;
  }
  else
  {
    v73 = &stru_1E421DB28;
  }
  HEICSFileURL = v47->HEICSFileURL;
  if (HEICSFileURL)
  {
    v50 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" HEICS:%@"), -[NSURL lastPathComponent](HEICSFileURL, "lastPathComponent"));
    v47 = self->_internal;
  }
  else
  {
    v50 = &stru_1E421DB28;
  }
  videoFileURL = v47->videoFileURL;
  if (videoFileURL)
  {
    v52 = (void *)MEMORY[0x1E0CB3940];
    v53 = -[NSURL lastPathComponent](videoFileURL, "lastPathComponent");
    v54 = *MEMORY[0x1E0CF2C58];
    if (-[NSDictionary objectForKeyedSubscript:](self->_internal->videoFormat, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]))
    {
      v55 = -[NSDictionary objectForKeyedSubscript:](self->_internal->videoFormat, "objectForKeyedSubscript:", v54);
    }
    else
    {
      v55 = (id)*MEMORY[0x1E0CF2C80];
    }
    v56 = (const __CFString *)objc_msgSend(v52, "stringWithFormat:", CFSTR(" video:{%@, %@}"), v53, v55);
    v47 = self->_internal;
  }
  else
  {
    v56 = &stru_1E421DB28;
  }
  if (v47->autoSpatialOverCaptureEnabled)
  {
    v72 = v56;
    v57 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" spatial-overcapture mov:{%@, %@, content-id:%@, group-id:%@}"), -[NSURL lastPathComponent](v47->spatialOverCaptureLivePhotoMovieFileURL, "lastPathComponent"), -[AVCapturePhotoSettings livePhotoVideoCodecType](self, "livePhotoVideoCodecType"), -[AVCapturePhotoSettings spatialOverCaptureLivePhotoContentIdentifier](self, "spatialOverCaptureLivePhotoContentIdentifier"), -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"));
    v47 = self->_internal;
    if (v47->EV0PhotoDeliveryEnabled
      && (spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto = v47->spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto) != 0)
    {
      v3 = 0x1E0CB3000;
      v59 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" spatial-overcapture (EV0) mov:{%@, %@, content-id:%@, group-id:%@}"), -[NSURL lastPathComponent](spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto, "lastPathComponent"), -[AVCapturePhotoSettings livePhotoVideoCodecType](self, "livePhotoVideoCodecType"), -[AVCapturePhotoSettings spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto](self, "spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto"), -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifierForOriginalPhoto](self, "spatialOverCaptureGroupIdentifierForOriginalPhoto"));
      v47 = self->_internal;
    }
    else
    {
      v59 = &stru_1E421DB28;
      v3 = 0x1E0CB3000uLL;
    }
    v56 = v72;
  }
  else
  {
    v57 = &stru_1E421DB28;
    v59 = &stru_1E421DB28;
  }
  if (v76)
    v60 = CFSTR(" raw-thumb:ON");
  else
    v60 = &stru_1E421DB28;
  if (v77)
    v61 = CFSTR(" thumb:ON");
  else
    v61 = &stru_1E421DB28;
  if (v78)
    v62 = CFSTR(" prev:ON");
  else
    v62 = &stru_1E421DB28;
  if (burstQualityCaptureEnabled)
    v63 = CFSTR(" burst:ON");
  else
    v63 = &stru_1E421DB28;
  if (turboModeEnabled)
    v64 = CFSTR(" turbo:ON");
  else
    v64 = &stru_1E421DB28;
  if (highResolutionPhotoEnabled)
    v65 = CFSTR(" high-res:ON");
  else
    v65 = &stru_1E421DB28;
  if (squareCropEnabled)
    v66 = CFSTR(" square-crop:ON");
  else
    v66 = &stru_1E421DB28;
  if (v89)
    v67 = CFSTR(" auto-virtualdevice-fusion:ON");
  else
    v67 = &stru_1E421DB28;
  if (autoSpatialPhotoCaptureEnabled)
    v68 = CFSTR(" spatialPhoto:ON");
  else
    v68 = &stru_1E421DB28;
  v69 = CFSTR(" zoom-without-upscale:ON");
  if (!v47->processedPhotoZoomWithoutUpscalingEnabled)
    v69 = &stru_1E421DB28;
  v70 = CFSTR(" preview-photo-format-dimensions-limited-to-display-dimensions:NO");
  if (v47->previewPhotoFormatDimensionsLimitedToDisplayDimensions)
    v70 = &stru_1E421DB28;
  return (id)objc_msgSend(*(id *)(v3 + 2368), "stringWithFormat:", CFSTR("uid:%lld %@:{%@%@%@%@%@%@%@%@%@%@ }%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@"), v47->uniqueID, v94, v93, v92, v91, &stru_1E421DB28, v87, v88, v86, v22, v67, v66, v65, v85, v82, v33,
               v64,
               v63,
               v62,
               v61,
               v60,
               v81,
               v46,
               v75,
               v74,
               v73,
               v50,
               v56,
               v57,
               v59,
               v69,
               v70,
               v68);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCapturePhotoSettings debugDescription](self, "debugDescription"));
}

- (BOOL)isShutterSoundSuppressionEnabled
{
  return self->_internal->shutterSoundSuppressionEnabled;
}

- (void)setShutterSoundSuppressionEnabled:(BOOL)a3
{
  self->_internal->shutterSoundSuppressionEnabled = a3;
}

- (BOOL)isStereoPhotoCaptureEnabled
{
  return self->_internal->autoSpatialPhotoCaptureEnabled;
}

- (void)setStereoPhotoCaptureEnabled:(BOOL)a3
{
  self->_internal->autoSpatialPhotoCaptureEnabled = a3;
}

- (BOOL)isAutoSpatialPhotoCaptureEnabled
{
  return self->_internal->autoSpatialPhotoCaptureEnabled;
}

- (void)setAutoSpatialPhotoCaptureEnabled:(BOOL)a3
{
  self->_internal->autoSpatialPhotoCaptureEnabled = a3;
}

- (BOOL)isAutoStillImageStabilizationEnabled
{
  return self->_internal->photoQualityPrioritization > 1;
}

- (void)setAutoStillImageStabilizationEnabled:(BOOL)autoStillImageStabilizationEnabled
{
  int64_t v3;
  AVCapturePhotoSettingsInternal *internal;

  if (autoStillImageStabilizationEnabled)
    v3 = 2;
  else
    v3 = 1;
  internal = self->_internal;
  if (internal->photoQualityPrioritization != v3)
  {
    -[AVCapturePhotoSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("photoQualityPrioritization"));
    self->_internal->photoQualityPrioritization = v3;
    -[AVCapturePhotoSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("photoQualityPrioritization"));
    internal = self->_internal;
  }
  internal->photoQualityPrioritizationIsSetByClient = 1;
}

- (BOOL)isAutoDualCameraFusionEnabled
{
  return self->_internal->autoVirtualDeviceFusionEnabled;
}

- (void)setAutoDualCameraFusionEnabled:(BOOL)autoDualCameraFusionEnabled
{
  _BOOL4 v3;
  BOOL v5;
  void *v6;

  v3 = autoDualCameraFusionEnabled;
  if (+[AVCapturePhotoOutput isBayerRAWPixelFormat:](AVCapturePhotoOutput, "isBayerRAWPixelFormat:", self->_internal->rawPhotoPixelFormatType))
  {
    v5 = !v3;
  }
  else
  {
    v5 = 1;
  }
  if (v5)
  {
    if (self->_internal->autoVirtualDeviceFusionEnabled != v3)
    {
      -[AVCapturePhotoSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("autoVirtualDeviceFusionEnabled"));
      self->_internal->autoVirtualDeviceFusionEnabled = v3;
      -[AVCapturePhotoSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("autoVirtualDeviceFusionEnabled"));
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (void)setDualCameraDualPhotoDeliveryEnabled:(BOOL)dualCameraDualPhotoDeliveryEnabled
{
  AVCaptureDevice *v4;
  NSArray *v5;
  void *v6;

  if (dualCameraDualPhotoDeliveryEnabled
    && (v4 = +[AVCaptureDevice defaultDeviceWithDeviceType:mediaType:position:](AVCaptureDevice, "defaultDeviceWithDeviceType:mediaType:position:", CFSTR("AVCaptureDeviceTypeBuiltInDualCamera"), *MEMORY[0x1E0CF2B90], 0), (__CFString *)-[AVCaptureDevice deviceType](v4, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInDualCamera")))
  {
    v5 = -[AVCaptureDevice constituentDevices](v4, "constituentDevices");
  }
  else
  {
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  if ((objc_msgSend(v6, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices)) & 1) == 0)
  {
    -[AVCapturePhotoSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("virtualDeviceConstituentPhotoDeliveryEnabledDevices"));

    self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices = v5;
    -[AVCapturePhotoSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("virtualDeviceConstituentPhotoDeliveryEnabledDevices"));
  }
}

- (BOOL)embedsSemanticSegmentationMattesInPhoto
{
  return self->_internal->embedsSemanticSegmentationMattesInPhoto;
}

- (AVVideoCodecType)livePhotoVideoCodecType
{
  return self->_internal->livePhotoVideoCodecType;
}

- (NSArray)livePhotoMovieMetadata
{
  NSArray *v3;
  NSArray *v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_internal->livePhotoMovieMetadata, "count") + 2);
  v4 = v3;
  if (self->_internal->livePhotoMovieMetadata)
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:");
  v5 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
  v6 = *MEMORY[0x1E0CF2BE0];
  objc_msgSend(v5, "setKeySpace:", *MEMORY[0x1E0CF2BE0]);
  objc_msgSend(v5, "setKey:", *MEMORY[0x1E0CF2BF0]);
  objc_msgSend(v5, "setValue:", -[AVCapturePhotoSettings livePhotoContentIdentifier](self, "livePhotoContentIdentifier"));
  -[NSArray addObject:](v4, "addObject:", v5);

  if (self->_internal->autoSpatialOverCaptureEnabled)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
    objc_msgSend(v7, "setKeySpace:", v6);
    objc_msgSend(v7, "setKey:", *MEMORY[0x1E0CF2BF8]);
    objc_msgSend(v7, "setValue:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"));
    -[NSArray addObject:](v4, "addObject:", v7);

  }
  return v4;
}

- (id)livePhotoMovieMetadataForOriginalPhoto
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_internal->livePhotoMovieMetadataForOriginalPhoto, "count") + 2);
  v4 = v3;
  if (self->_internal->livePhotoMovieMetadataForOriginalPhoto)
    objc_msgSend(v3, "addObjectsFromArray:");
  v5 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
  v6 = *MEMORY[0x1E0CF2BE0];
  objc_msgSend(v5, "setKeySpace:", *MEMORY[0x1E0CF2BE0]);
  objc_msgSend(v5, "setKey:", *MEMORY[0x1E0CF2BF0]);
  objc_msgSend(v5, "setValue:", -[AVCapturePhotoSettings livePhotoContentIdentifierForOriginalPhoto](self, "livePhotoContentIdentifierForOriginalPhoto"));
  objc_msgSend(v4, "addObject:", v5);

  if (self->_internal->autoSpatialOverCaptureEnabled)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
    objc_msgSend(v7, "setKeySpace:", v6);
    objc_msgSend(v7, "setKey:", *MEMORY[0x1E0CF2BF8]);
    objc_msgSend(v7, "setValue:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifierForOriginalPhoto](self, "spatialOverCaptureGroupIdentifierForOriginalPhoto"));
    objc_msgSend(v4, "addObject:", v7);

  }
  return v4;
}

- (NSDictionary)previewPhotoFormat
{
  return self->_internal->previewPhotoFormat;
}

- (NSDictionary)embeddedThumbnailPhotoFormat
{
  return self->_internal->embeddedThumbnailPhotoFormat;
}

- (NSDictionary)rawFileFormat
{
  return self->_internal->rawFileFormat;
}

- (void)setRawFileFormat:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[3];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_8;
  v13 = 0;
  v5 = *MEMORY[0x1E0CF2C40];
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C40]);
  if (!v6)
  {
LABEL_7:
    v15[0] = *MEMORY[0x1E0CF2C90];
    v15[1] = AVStringForOSType();
    v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = *MEMORY[0x1E0CF2CE0];
    v14[0] = *MEMORY[0x1E0CF2C58];
    v14[1] = v9;
    v14[2] = v5;
    if (!+[AVCaptureVideoSettingsValidator validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:](AVCaptureVideoSettingsValidator, "validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:", a3, 25, 0, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3), v8, &v13))
    {
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99778];
      goto LABEL_11;
    }
LABEL_8:

    self->_internal->rawFileFormat = (NSDictionary *)objc_msgSend(a3, "copy");
    return;
  }
  v7 = (void *)v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((int)objc_msgSend(v7, "intValue") < 8 || (int)objc_msgSend(v7, "intValue") >= 17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVVideoAppleProRAWBitDepthKey value (%@) not supported. Expected a value in the range of 8-16."), v7);
      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_9:
  v10 = (void *)MEMORY[0x1E0C99DA0];
  v11 = *MEMORY[0x1E0C99778];
LABEL_11:
  v12 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v12);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
}

- (NSDictionary)rawEmbeddedThumbnailPhotoFormat
{
  return self->_internal->rawEmbeddedThumbnailPhotoFormat;
}

- (CGSize)rawEmbeddedThumbnailCGSize
{
  char BoolAnswer;
  AVCapturePhotoSettingsInternal *internal;
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  BoolAnswer = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCapturePhotoSettingsSupportRawEmbeddedThumbnailFormat"));
  internal = self->_internal;
  if ((BoolAnswer & 1) != 0 || !internal->rawFileType)
    v5 = 216;
  else
    v5 = 200;
  v6 = ps_CGSizeForSettingsDictionary(*(void **)((char *)&internal->super.isa + v5));
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)isAutoDeferredProcessingEnabled
{
  return self->_internal->autoDeferredPhotoDeliveryEnabled;
}

- (void)setAutoDeferredProcessingEnabled:(BOOL)a3
{
  self->_internal->autoDeferredPhotoDeliveryEnabled = a3;
}

- (id)videoFormat
{
  return self->_internal->videoFormat;
}

- (id)videoFileMetadata
{
  return self->_internal->videoFileMetadata;
}

- (void)_setPropertiesFromMomentCaptureSettings:(id)a3
{
  self->_internal->userInitiatedPhotoRequestTime = objc_msgSend(a3, "userInitiatedCaptureTime");
  -[AVCapturePhotoSettings _setPhotoQualityPrioritization:](self, "_setPhotoQualityPrioritization:", objc_msgSend(a3, "photoQualityPrioritization"));
  -[AVCapturePhotoSettings setFlashMode:](self, "setFlashMode:", objc_msgSend(a3, "flashMode"));
  -[AVCapturePhotoSettings setAutoRedEyeReductionEnabled:](self, "setAutoRedEyeReductionEnabled:", objc_msgSend(a3, "isAutoRedEyeReductionEnabled"));
  -[AVCapturePhotoSettings setDigitalFlashMode:](self, "setDigitalFlashMode:", objc_msgSend(a3, "digitalFlashMode"));
  -[AVCapturePhotoSettings setHDRMode:](self, "setHDRMode:", objc_msgSend(a3, "HDRMode"));
  -[AVCapturePhotoSettings setEV0PhotoDeliveryEnabled:](self, "setEV0PhotoDeliveryEnabled:", objc_msgSend(a3, "isAutoOriginalPhotoDeliveryEnabled"));
  -[AVCapturePhotoSettings setAutoSpatialOverCaptureEnabled:](self, "setAutoSpatialOverCaptureEnabled:", objc_msgSend(a3, "isAutoSpatialOverCaptureEnabled"));
}

+ (id)photoSettingsFromMomentCaptureSettings:(id)a3 withFormat:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v9 = 0;
  v5 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", a4, 0, 0, 0, 0, objc_msgSend(a3, "uniqueID"), &v9);
  if (v9)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
    return 0;
  }
  else
  {
    v7 = v5;
    objc_msgSend(v5, "_setPropertiesFromMomentCaptureSettings:", a3);
  }
  return v7;
}

+ (id)photoSettingsFromMomentCaptureSettings:(id)a3 withRawPixelFormatType:(unsigned int)a4 rawFileType:(id)a5 format:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v11 = 0;
  v7 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", a6, 0, *(_QWORD *)&a4, a5, 0, objc_msgSend(a3, "uniqueID"), &v11);
  if (v11)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
    return 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v7, "_setPropertiesFromMomentCaptureSettings:", a3);
  }
  return v9;
}

- (id)spatialOverCaptureMetadata
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_internal->spatialOverCaptureMetadata);
  v4 = v3;
  if (self->_internal->autoSpatialOverCaptureEnabled)
  {
    v5 = *MEMORY[0x1E0CBCF70];
    v6 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
    if (!v6)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"), CFSTR("41"));
  }
  return v4;
}

- (id)spatialOverCaptureLivePhotoMovieFileURL
{
  return self->_internal->spatialOverCaptureLivePhotoMovieFileURL;
}

- (id)spatialOverCaptureLivePhotoMovieMetadata
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_internal->spatialOverCaptureLivePhotoMovieMetadata, "count") + 3);
  v4 = v3;
  if (self->_internal->spatialOverCaptureLivePhotoMovieMetadata)
    objc_msgSend(v3, "addObjectsFromArray:");
  v5 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
  v6 = *MEMORY[0x1E0CF2BE0];
  objc_msgSend(v5, "setKeySpace:", *MEMORY[0x1E0CF2BE0]);
  objc_msgSend(v5, "setKey:", *MEMORY[0x1E0CF2BF0]);
  objc_msgSend(v5, "setValue:", -[AVCapturePhotoSettings spatialOverCaptureLivePhotoContentIdentifier](self, "spatialOverCaptureLivePhotoContentIdentifier"));
  objc_msgSend(v4, "addObject:", v5);

  v7 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
  objc_msgSend(v7, "setKeySpace:", v6);
  objc_msgSend(v7, "setKey:", *MEMORY[0x1E0CF2BF8]);
  objc_msgSend(v7, "setValue:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"));
  objc_msgSend(v4, "addObject:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
  objc_msgSend(v8, "setKeySpace:", v6);
  objc_msgSend(v8, "setKey:", *MEMORY[0x1E0CF2BE8]);
  objc_msgSend(v8, "setDataType:", *MEMORY[0x1E0CA2488]);
  objc_msgSend(v8, "setValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 1));
  objc_msgSend(v4, "addObject:", v8);

  return v4;
}

- (id)spatialOverCaptureLivePhotoContentIdentifier
{
  id result;

  result = self->_internal->spatialOverCaptureLivePhotoContentIdentifier;
  if (!result)
  {
    self->_internal->spatialOverCaptureLivePhotoContentIdentifier = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    return self->_internal->spatialOverCaptureLivePhotoContentIdentifier;
  }
  return result;
}

- (id)spatialOverCaptureGroupIdentifier
{
  id result;

  result = self->_internal->spatialOverCaptureGroupIdentifier;
  if (!result)
  {
    self->_internal->spatialOverCaptureGroupIdentifier = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    return self->_internal->spatialOverCaptureGroupIdentifier;
  }
  return result;
}

- (id)spatialOverCaptureMetadataForOriginalPhoto
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_internal->spatialOverCaptureMetadataForOriginalPhoto);
  v4 = v3;
  if (self->_internal->autoSpatialOverCaptureEnabled)
  {
    v5 = *MEMORY[0x1E0CBCF70];
    v6 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
    if (!v6)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifierForOriginalPhoto](self, "spatialOverCaptureGroupIdentifierForOriginalPhoto"), CFSTR("41"));
  }
  return v4;
}

- (id)spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto
{
  return self->_internal->spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto;
}

- (id)spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_internal->spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto, "count")+ 3);
  v4 = v3;
  if (self->_internal->spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto)
    objc_msgSend(v3, "addObjectsFromArray:");
  v5 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
  v6 = *MEMORY[0x1E0CF2BE0];
  objc_msgSend(v5, "setKeySpace:", *MEMORY[0x1E0CF2BE0]);
  objc_msgSend(v5, "setKey:", *MEMORY[0x1E0CF2BF0]);
  objc_msgSend(v5, "setValue:", -[AVCapturePhotoSettings spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto](self, "spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto"));
  objc_msgSend(v4, "addObject:", v5);

  v7 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
  objc_msgSend(v7, "setKeySpace:", v6);
  objc_msgSend(v7, "setKey:", *MEMORY[0x1E0CF2BF8]);
  objc_msgSend(v7, "setValue:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifierForOriginalPhoto](self, "spatialOverCaptureGroupIdentifierForOriginalPhoto"));
  objc_msgSend(v4, "addObject:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0CF2D30]);
  objc_msgSend(v8, "setKeySpace:", v6);
  objc_msgSend(v8, "setKey:", *MEMORY[0x1E0CF2BE8]);
  objc_msgSend(v8, "setDataType:", *MEMORY[0x1E0CA2488]);
  objc_msgSend(v8, "setValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 1));
  objc_msgSend(v4, "addObject:", v8);

  return v4;
}

- (id)spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto
{
  id result;

  result = self->_internal->spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto;
  if (!result)
  {
    self->_internal->spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    return self->_internal->spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto;
  }
  return result;
}

- (id)spatialOverCaptureGroupIdentifierForOriginalPhoto
{
  id result;

  result = self->_internal->spatialOverCaptureGroupIdentifierForOriginalPhoto;
  if (!result)
  {
    self->_internal->spatialOverCaptureGroupIdentifierForOriginalPhoto = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    return self->_internal->spatialOverCaptureGroupIdentifierForOriginalPhoto;
  }
  return result;
}

@end
