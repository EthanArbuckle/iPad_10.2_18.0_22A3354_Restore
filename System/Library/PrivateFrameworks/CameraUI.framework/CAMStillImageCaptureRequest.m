@implementation CAMStillImageCaptureRequest

- (CAMStillImageCaptureRequest)init
{
  CAMStillImageCaptureRequest *v2;
  CAMStillImageCaptureRequest *v3;
  void *v4;
  CEKCaptureStyle *semanticStyle;
  NSString *burstIdentifier;
  void *v7;
  uint64_t v8;
  NSString *irisIdentifier;
  void *v10;
  uint64_t v11;
  NSString *videoPersistenceUUID;
  void *v13;
  uint64_t v14;
  NSString *EV0IrisIdentifier;
  void *v16;
  uint64_t v17;
  NSString *EV0VideoPersistenceUUID;
  void *v19;
  uint64_t v20;
  NSString *EV0PersistenceUUID;
  CAMStillImageCaptureRequest *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CAMStillImageCaptureRequest;
  v2 = -[CAMCaptureRequest initWithType:](&v24, sel_initWithType_, 0);
  v3 = v2;
  if (v2)
  {
    v2->_flashMode = 2;
    v2->_torchMode = 2;
    v2->_hdrMode = 2;
    v2->_photoQualityPrioritization = 1;
    v2->_wantsAutoDualCameraFusion = 1;
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_wantsSemanticSceneFilter = objc_msgSend(v4, "semanticDevelopmentSupported");

    semanticStyle = v3->_semanticStyle;
    v3->_semanticStyle = 0;

    v3->_ctmCaptureType = 0;
    v3->_desiredPreviewSize = (CGSize)*MEMORY[0x1E0C9D820];
    burstIdentifier = v3->_burstIdentifier;
    v3->_burstIdentifier = 0;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    irisIdentifier = v3->_irisIdentifier;
    v3->_irisIdentifier = (NSString *)v8;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    videoPersistenceUUID = v3->_videoPersistenceUUID;
    v3->_videoPersistenceUUID = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    EV0IrisIdentifier = v3->_EV0IrisIdentifier;
    v3->_EV0IrisIdentifier = (NSString *)v14;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = objc_claimAutoreleasedReturnValue();
    EV0VideoPersistenceUUID = v3->_EV0VideoPersistenceUUID;
    v3->_EV0VideoPersistenceUUID = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = objc_claimAutoreleasedReturnValue();
    EV0PersistenceUUID = v3->_EV0PersistenceUUID;
    v3->_EV0PersistenceUUID = (NSString *)v20;

    v3->_userInitiationTime = 0;
    v3->_maximumPhotoResolution = 0;
    v3->_wantsWhiteBalanceLockedDuringVideoRecording = 0;
    v3->_stereoCaptureStatus = 1;
    v22 = v3;
  }

  return v3;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (int64_t)hdrMode
{
  return self->_hdrMode;
}

- (int64_t)irisMode
{
  return self->_irisMode;
}

- (NSArray)adjustmentFilters
{
  return self->_adjustmentFilters;
}

- (NSArray)originalFilters
{
  return self->_originalFilters;
}

- (BOOL)wantsAutoDualCameraFusion
{
  return self->_wantsAutoDualCameraFusion;
}

- (BOOL)wantsAudioForCapture
{
  return self->_wantsAudioForCapture;
}

- (BOOL)wantsSquareCrop
{
  return self->_wantsSquareCrop;
}

- (BOOL)wantsHighResolutionStills
{
  return self->_wantsHighResolutionStills;
}

- (CGSize)desiredPreviewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_desiredPreviewSize.width;
  height = self->_desiredPreviewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CAMStillImageCaptureRequestDelegate)delegate
{
  return (CAMStillImageCaptureRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (unint64_t)maximumBurstLength
{
  return self->_maximumBurstLength;
}

- (int64_t)effectFilterType
{
  return self->_effectFilterType;
}

- (NSString)timelapseIdentifier
{
  return self->_timelapseIdentifier;
}

- (int64_t)lightingEffectType
{
  return self->_lightingEffectType;
}

- (NSString)irisIdentifier
{
  return self->_irisIdentifier;
}

- (NSURL)localVideoDestinationURL
{
  return self->_localVideoDestinationURL;
}

- (NSString)videoPersistenceUUID
{
  return self->_videoPersistenceUUID;
}

- (NSString)EV0IrisIdentifier
{
  return self->_EV0IrisIdentifier;
}

- (NSURL)EV0LocalVideoDestinationURL
{
  return self->_EV0LocalVideoDestinationURL;
}

- (NSString)EV0VideoPersistenceUUID
{
  return self->_EV0VideoPersistenceUUID;
}

- (NSString)EV0PersistenceUUID
{
  return self->_EV0PersistenceUUID;
}

- (unint64_t)userInitiationTime
{
  return self->_userInitiationTime;
}

- (id)irisLocalVideoDestinationURLForEV0:(BOOL)a3
{
  if (a3)
    -[CAMStillImageCaptureRequest EV0LocalVideoDestinationURL](self, "EV0LocalVideoDestinationURL");
  else
    -[CAMStillImageCaptureRequest localVideoDestinationURL](self, "localVideoDestinationURL");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)irisVideoPersistenceUUIDForEV0:(BOOL)a3
{
  if (a3)
    -[CAMStillImageCaptureRequest EV0VideoPersistenceUUID](self, "EV0VideoPersistenceUUID");
  else
    -[CAMStillImageCaptureRequest videoPersistenceUUID](self, "videoPersistenceUUID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_EV0VideoPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_EV0LocalVideoDestinationURL, 0);
  objc_storeStrong((id *)&self->_EV0IrisIdentifier, 0);
  objc_storeStrong((id *)&self->_videoPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_localCTMVideoDestinationURL, 0);
  objc_storeStrong((id *)&self->_localVideoDestinationURL, 0);
  objc_storeStrong((id *)&self->_irisIdentifier, 0);
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_textAnalysisRegion, 0);
  objc_storeStrong((id *)&self->_textAnalysisIdentifier, 0);
  objc_storeStrong((id *)&self->_semanticStyle, 0);
  objc_storeStrong((id *)&self->_originalFilters, 0);
  objc_storeStrong((id *)&self->_adjustmentFilters, 0);
  objc_storeStrong((id *)&self->_EV0PersistenceUUID, 0);
  objc_storeStrong((id *)&self->_timelapseIdentifier, 0);
}

- (CAMStillImageCaptureRequest)initWithRequest:(id)a3 distinctPersistence:(BOOL)a4 includeAnalytics:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  CAMStillImageCaptureRequest *v9;
  void *v10;
  uint64_t v11;
  NSArray *adjustmentFilters;
  void *v13;
  uint64_t v14;
  NSArray *originalFilters;
  uint64_t v16;
  CEKCaptureStyle *semanticStyle;
  void *v18;
  uint64_t v19;
  NSString *textAnalysisIdentifier;
  uint64_t v21;
  CAMTextRegionResult *textAnalysisRegion;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  uint64_t v26;
  NSString *burstIdentifier;
  uint64_t v28;
  NSString *timelapseIdentifier;
  uint64_t v30;
  NSString *irisIdentifier;
  uint64_t v32;
  NSURL *localVideoDestinationURL;
  uint64_t v34;
  NSURL *localCTMVideoDestinationURL;
  void *v36;
  uint64_t v37;
  NSString *EV0IrisIdentifier;
  uint64_t v39;
  NSURL *EV0LocalVideoDestinationURL;
  void *v41;
  void *v42;
  CAMStillImageCaptureRequest *v43;
  objc_super v45;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CAMStillImageCaptureRequest;
  v9 = -[CAMCaptureRequest initWithRequest:distinctPersistence:includeAnalytics:](&v45, sel_initWithRequest_distinctPersistence_includeAnalytics_, v8, v6, v5);
  if (v9)
  {
    v9->_flashMode = objc_msgSend(v8, "flashMode");
    v9->_hdrMode = objc_msgSend(v8, "hdrMode");
    v9->_irisMode = objc_msgSend(v8, "irisMode");
    v9->_ctmCaptureType = objc_msgSend(v8, "ctmCaptureType");
    v9->_lowLightMode = objc_msgSend(v8, "lowLightMode");
    v9->_wantsDepthData = objc_msgSend(v8, "wantsDepthData");
    objc_msgSend(v8, "adjustmentFilters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    adjustmentFilters = v9->_adjustmentFilters;
    v9->_adjustmentFilters = (NSArray *)v11;

    objc_msgSend(v8, "originalFilters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    originalFilters = v9->_originalFilters;
    v9->_originalFilters = (NSArray *)v14;

    v9->_photoQualityPrioritization = objc_msgSend(v8, "photoQualityPrioritization");
    v9->_wantsAutoDualCameraFusion = objc_msgSend(v8, "wantsAutoDualCameraFusion");
    v9->_wantsSemanticSceneFilter = objc_msgSend(v8, "wantsSemanticSceneFilter");
    objc_msgSend(v8, "semanticStyle");
    v16 = objc_claimAutoreleasedReturnValue();
    semanticStyle = v9->_semanticStyle;
    v9->_semanticStyle = (CEKCaptureStyle *)v16;

    v9->_wantsAudioForCapture = objc_msgSend(v8, "wantsAudioForCapture");
    v9->_wantsSquareCrop = objc_msgSend(v8, "wantsSquareCrop");
    v9->_aspectRatioCrop = objc_msgSend(v8, "aspectRatioCrop");
    v9->_wantsHighResolutionStills = objc_msgSend(v8, "wantsHighResolutionStills");
    v9->_stillDuringVideo = objc_msgSend(v8, "stillDuringVideo");
    objc_msgSend(v8, "textAnalysisIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    textAnalysisIdentifier = v9->_textAnalysisIdentifier;
    v9->_textAnalysisIdentifier = (NSString *)v19;

    objc_msgSend(v8, "textAnalysisRegion");
    v21 = objc_claimAutoreleasedReturnValue();
    textAnalysisRegion = v9->_textAnalysisRegion;
    v9->_textAnalysisRegion = (CAMTextRegionResult *)v21;

    objc_msgSend(v8, "desiredPreviewSize");
    v9->_desiredPreviewSize.width = v23;
    v9->_desiredPreviewSize.height = v24;
    objc_msgSend(v8, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_delegate, v25);

    objc_msgSend(v8, "burstIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    burstIdentifier = v9->_burstIdentifier;
    v9->_burstIdentifier = (NSString *)v26;

    v9->_maximumBurstLength = objc_msgSend(v8, "maximumBurstLength");
    v9->_effectFilterType = objc_msgSend(v8, "effectFilterType");
    objc_msgSend(v8, "timelapseIdentifier");
    v28 = objc_claimAutoreleasedReturnValue();
    timelapseIdentifier = v9->_timelapseIdentifier;
    v9->_timelapseIdentifier = (NSString *)v28;

    v9->_lightingEffectType = objc_msgSend(v8, "lightingEffectType");
    v9->_wantsEV0ForHDR = objc_msgSend(v8, "wantsEV0ForHDR");
    objc_msgSend(v8, "irisIdentifier");
    v30 = objc_claimAutoreleasedReturnValue();
    irisIdentifier = v9->_irisIdentifier;
    v9->_irisIdentifier = (NSString *)v30;

    objc_msgSend(v8, "localVideoDestinationURL");
    v32 = objc_claimAutoreleasedReturnValue();
    localVideoDestinationURL = v9->_localVideoDestinationURL;
    v9->_localVideoDestinationURL = (NSURL *)v32;

    objc_msgSend(v8, "localCTMVideoDestinationURL");
    v34 = objc_claimAutoreleasedReturnValue();
    localCTMVideoDestinationURL = v9->_localCTMVideoDestinationURL;
    v9->_localCTMVideoDestinationURL = (NSURL *)v34;

    v9->_disablesCameraSwitchingDuringRecording = objc_msgSend(v8, "disablesCameraSwitchingDuringRecording");
    v9->_torchMode = objc_msgSend(v8, "torchMode");
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
    }
    else
    {
      objc_msgSend(v8, "videoPersistenceUUID");
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v9->_videoPersistenceUUID, v36);
    if (v6)
    {

      v36 = v25;
    }

    objc_msgSend(v8, "EV0IrisIdentifier");
    v37 = objc_claimAutoreleasedReturnValue();
    EV0IrisIdentifier = v9->_EV0IrisIdentifier;
    v9->_EV0IrisIdentifier = (NSString *)v37;

    objc_msgSend(v8, "EV0LocalVideoDestinationURL");
    v39 = objc_claimAutoreleasedReturnValue();
    EV0LocalVideoDestinationURL = v9->_EV0LocalVideoDestinationURL;
    v9->_EV0LocalVideoDestinationURL = (NSURL *)v39;

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
    }
    else
    {
      objc_msgSend(v8, "EV0VideoPersistenceUUID");
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v9->_EV0VideoPersistenceUUID, v41);

    if (v6)
    {

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
    }
    else
    {
      objc_msgSend(v8, "EV0PersistenceUUID");
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v9->_EV0PersistenceUUID, v42);
    if (v6)
    {

      v42 = v25;
    }

    v9->_userInitiationTime = objc_msgSend(v8, "userInitiationTime");
    v9->_maximumPhotoResolution = objc_msgSend(v8, "maximumPhotoResolution");
    v9->_wantsWhiteBalanceLockedDuringVideoRecording = objc_msgSend(v8, "wantsWhiteBalanceLockedDuringVideoRecording");
    v9->super._rawFileFormatBehavior = objc_msgSend(v8, "rawFileFormatBehavior");
    v9->_stereoCaptureStatus = objc_msgSend(v8, "stereoCaptureStatus");
    v43 = v9;
  }

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CAMStillImageCaptureRequest initWithRequest:distinctPersistence:includeAnalytics:]([CAMMutableStillImageCaptureRequest alloc], "initWithRequest:distinctPersistence:includeAnalytics:", self, 0, 1);
}

- (id)irisIdentifierForEV0:(BOOL)a3
{
  if (a3)
    -[CAMStillImageCaptureRequest EV0IrisIdentifier](self, "EV0IrisIdentifier");
  else
    -[CAMStillImageCaptureRequest irisIdentifier](self, "irisIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)irisStillImagePersistenceUUIDForEV0:(BOOL)a3
{
  if (a3)
    -[CAMStillImageCaptureRequest EV0PersistenceUUID](self, "EV0PersistenceUUID");
  else
    -[CAMCaptureRequest persistenceUUID](self, "persistenceUUID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEV0LocalVideoDestinationURL:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CAMStillImageCaptureRequest irisLocalVideoDestinationURLForEV0:](self, "irisLocalVideoDestinationURLForEV0:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (BOOL)shouldProtectPersistenceForVideo
{
  _BOOL4 v3;

  v3 = -[CAMCaptureRequest shouldProtectPersistence](self, "shouldProtectPersistence");
  if (v3)
    LOBYTE(v3) = -[CAMStillImageCaptureRequest isCTMVideo](self, "isCTMVideo");
  return v3;
}

- (BOOL)isCTMVideo
{
  return -[CAMStillImageCaptureRequest ctmCaptureType](self, "ctmCaptureType") == 2;
}

- (BOOL)hasAdjustments
{
  BOOL v3;
  void *v5;

  if (-[CAMStillImageCaptureRequest effectFilterType](self, "effectFilterType")
    || -[CAMStillImageCaptureRequest lightingEffectType](self, "lightingEffectType")
    || -[CAMStillImageCaptureRequest aspectRatioCrop](self, "aspectRatioCrop"))
  {
    return 1;
  }
  -[CAMStillImageCaptureRequest adjustmentFilters](self, "adjustmentFilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "count") != 0;

  return v3;
}

- (BOOL)wantsDepthData
{
  return self->_wantsDepthData;
}

- (int64_t)photoQualityPrioritization
{
  return self->_photoQualityPrioritization;
}

- (BOOL)wantsSemanticSceneFilter
{
  return self->_wantsSemanticSceneFilter;
}

- (BOOL)stillDuringVideo
{
  return self->_stillDuringVideo;
}

- (int64_t)ctmCaptureType
{
  return self->_ctmCaptureType;
}

- (int64_t)lowLightMode
{
  return self->_lowLightMode;
}

- (CEKCaptureStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (NSString)textAnalysisIdentifier
{
  return self->_textAnalysisIdentifier;
}

- (CAMTextRegionResult)textAnalysisRegion
{
  return self->_textAnalysisRegion;
}

- (NSURL)localCTMVideoDestinationURL
{
  return self->_localCTMVideoDestinationURL;
}

- (BOOL)disablesCameraSwitchingDuringRecording
{
  return self->_disablesCameraSwitchingDuringRecording;
}

- (int64_t)torchMode
{
  return self->_torchMode;
}

- (BOOL)wantsEV0ForHDR
{
  return self->_wantsEV0ForHDR;
}

- (int64_t)maximumPhotoResolution
{
  return self->_maximumPhotoResolution;
}

- (BOOL)wantsWhiteBalanceLockedDuringVideoRecording
{
  return self->_wantsWhiteBalanceLockedDuringVideoRecording;
}

- (int64_t)stereoCaptureStatus
{
  return self->_stereoCaptureStatus;
}

- (int64_t)aspectRatioCrop
{
  return self->_aspectRatioCrop;
}

- (id)capturePhotoSettingsWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMStillImageCaptureRequest burstIdentifier](self, "burstIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C8B0F8], "burstQualityPhotoSettings");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v7 = (void *)v6;
    goto LABEL_4;
  }
  v9 = -[CAMCaptureRequest photoEncodingBehavior](self, "photoEncodingBehavior");
  switch(v9)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0C8B0F8], "photoSettings");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 2:
      v12 = (void *)objc_opt_class();
      objc_msgSend(v4, "currentStillImageOutput");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "rawPixelFormatTypeForPhotoOutput:", v13);

      objc_msgSend(MEMORY[0x1E0C8B0F8], "photoSettingsWithRawPixelFormatType:rawFileType:processedFormat:processedFileType:", v14, *MEMORY[0x1E0C8A2C0], 0, *MEMORY[0x1E0C8A2C0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMStillImageCaptureRequest _configureRawFileFormat:context:rawPixelFormatType:](self, "_configureRawFileFormat:context:rawPixelFormatType:", v7, v4, v14);
      break;
    case 1:
      v10 = (void *)MEMORY[0x1E0C8B0F8];
      v15 = *MEMORY[0x1E0C8AE68];
      v16[0] = *MEMORY[0x1E0C8AE78];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "photoSettingsWithFormat:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v7 = 0;
      break;
  }
LABEL_4:
  -[CAMStillImageCaptureRequest _configurePhotoSettings:shouldIgnoreInitiationSettingsProperties:context:](self, "_configurePhotoSettings:shouldIgnoreInitiationSettingsProperties:context:", v7, 0, v4);

  return v7;
}

- (void)_configureRawFileFormat:(id)a3 context:(id)a4 rawPixelFormatType:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v5 = *(_QWORD *)&a5;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[CAMCaptureRequest rawFileFormatBehavior](self, "rawFileFormatBehavior");
  objc_msgSend(v9, "currentStillImageOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "supportedRawPhotoCodecTypesForRawPhotoPixelFormatType:fileType:", v5, *MEMORY[0x1E0C8A2C0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == 1)
  {
    v13 = &unk_1EA3B3B80;
    goto LABEL_5;
  }
  if (v10 == 2)
  {
    v13 = &unk_1EA3B3B90;
LABEL_5:
    CAMNUStringForTypeCode(1786276963);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    goto LABEL_7;
  }
  v13 = 0;
  v14 = 0;
  v15 = 1;
LABEL_7:
  v16 = objc_msgSend(v12, "indexOfObject:", v14);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v14)
    {
      v19 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v14;
        v23 = 2114;
        v24 = v20;
        _os_log_impl(&dword_1DB760000, v19, OS_LOG_TYPE_DEFAULT, "Raw file format: requested type %{public}@ not supported, supportedCodecTypes=(%{public}@)", (uint8_t *)&v21, 0x16u);

      }
    }
  }
  else
  {
    if (v14)
      objc_msgSend(v17, "setObject:forKey:", v14, *MEMORY[0x1E0C8AE68]);
    if ((v15 & 1) == 0)
      objc_msgSend(v18, "setObject:forKey:", v13, *MEMORY[0x1E0C8AF28]);
  }
  if (objc_msgSend(v18, "count"))
    objc_msgSend(v8, "setRawFileFormat:", v18);

}

- (void)_configurePhotoSettings:(id)a3 shouldIgnoreInitiationSettingsProperties:(BOOL)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  _BOOL8 v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  int64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  $2825F4736939C4A6D3AD43837233062D v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  int v66;
  void *v67;
  int v68;
  int64_t v69;
  void *v70;
  void *v71;
  unint64_t v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  $2825F4736939C4A6D3AD43837233062D v77;
  _QWORD v78[5];
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint8_t buf[4];
  int var0;
  __int16 v87;
  int var1;
  uint64_t v89;
  void *v90;
  _QWORD v91[3];
  _QWORD v92[5];

  v92[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentStillImageOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentVideoDeviceFormat");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    objc_msgSend(v8, "setFlashMode:", +[CAMCaptureConversions captureFlashModeForFlashMode:](CAMCaptureConversions, "captureFlashModeForFlashMode:", -[CAMStillImageCaptureRequest flashMode](self, "flashMode")));
    objc_msgSend(v8, "setHDRMode:", +[CAMCaptureConversions captureHDRModeForHDRMode:](CAMCaptureConversions, "captureHDRModeForHDRMode:", -[CAMStillImageCaptureRequest hdrMode](self, "hdrMode")));
    if (objc_msgSend(v8, "flashMode") == 1 && objc_msgSend(v8, "HDRMode") == 1)
      objc_msgSend(v8, "setHDRMode:", 0);
    objc_msgSend(v8, "setPhotoQualityPrioritization:", +[CAMCaptureConversions AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:](CAMCaptureConversions, "AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:", -[CAMStillImageCaptureRequest photoQualityPrioritization](self, "photoQualityPrioritization")));
  }
  if (objc_msgSend(v76, "hasFilteringEntitlement"))
  {
    -[CAMStillImageCaptureRequest originalFilters](self, "originalFilters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMStillImageCaptureRequest adjustmentFilters](self, "adjustmentFilters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
      objc_msgSend(v8, "setPhotoFilters:", v11);
    if (objc_msgSend(v12, "count"))
      objc_msgSend(v8, "setAdjustedPhotoFilters:", v12);

  }
  objc_msgSend(v8, "setDigitalFlashMode:", +[CAMCaptureConversions captureDigitalFlashModeForLowLightMode:](CAMCaptureConversions, "captureDigitalFlashModeForLowLightMode:", -[CAMStillImageCaptureRequest lowLightMode](self, "lowLightMode")));
  v13 = objc_msgSend(v76, "isHDREV0CaptureSupported")
     && -[CAMStillImageCaptureRequest wantsEV0ForHDR](self, "wantsEV0ForHDR")
     && objc_msgSend(v8, "HDRMode") != 0;
  objc_msgSend(v8, "setEV0PhotoDeliveryEnabled:", v13);
  v14 = -[CAMStillImageCaptureRequest wantsDepthData](self, "wantsDepthData");
  objc_msgSend(v8, "setDepthDataDeliveryEnabled:", v14);
  objc_msgSend(v8, "setEmbedsDepthDataInPhoto:", v14);
  objc_msgSend(v8, "setPortraitEffectsMatteDeliveryEnabled:", v14);
  objc_msgSend(v8, "setEmbedsPortraitEffectsMatteInPhoto:", v14);
  if (v14)
  {
    objc_msgSend(v10, "availableSemanticSegmentationMatteTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabledSemanticSegmentationMatteTypes:", v15);

  }
  objc_msgSend(v8, "setAutoVirtualDeviceFusionEnabled:", -[CAMStillImageCaptureRequest wantsAutoDualCameraFusion](self, "wantsAutoDualCameraFusion"));
  if (-[CAMStillImageCaptureRequest wantsAudioForCapture](self, "wantsAudioForCapture"))
    v16 = 1108;
  else
    v16 = 0;
  objc_msgSend(v8, "setShutterSound:", v16);
  objc_msgSend(v8, "setHighResolutionPhotoEnabled:", -[CAMStillImageCaptureRequest wantsHighResolutionStills](self, "wantsHighResolutionStills"));
  v17 = -[CAMStillImageCaptureRequest wantsSquareCrop](self, "wantsSquareCrop");
  objc_msgSend(v8, "setSquareCropEnabled:", v17);
  -[CAMStillImageCaptureRequest burstIdentifier](self, "burstIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17 && (unint64_t)(-[CAMStillImageCaptureRequest irisMode](self, "irisMode") - 1) <= 1)
  {
    -[CAMStillImageCaptureRequest irisLocalVideoDestinationURLForEV0:](self, "irisLocalVideoDestinationURLForEV0:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLivePhotoMovieFileURL:", v19);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMPersistenceController clientVideoMetadataForRequest:withCreationDate:isEV0ForHDR:livePhotoIdentifierOverride:slomoPlayback:](CAMPersistenceController, "clientVideoMetadataForRequest:withCreationDate:isEV0ForHDR:livePhotoIdentifierOverride:slomoPlayback:", self, v20, 0, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLivePhotoMovieMetadata:", v21);
    if (v13)
    {
      -[CAMStillImageCaptureRequest irisLocalVideoDestinationURLForEV0:](self, "irisLocalVideoDestinationURLForEV0:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLivePhotoMovieFileURLForOriginalPhoto:", v22);
      +[CAMPersistenceController clientVideoMetadataForRequest:withCreationDate:isEV0ForHDR:livePhotoIdentifierOverride:slomoPlayback:](CAMPersistenceController, "clientVideoMetadataForRequest:withCreationDate:isEV0ForHDR:livePhotoIdentifierOverride:slomoPlayback:", self, v20, 1, 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLivePhotoMovieMetadataForOriginalPhoto:", v23);

    }
  }
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__31;
  v83 = __Block_byref_object_dispose__31;
  v84 = 0;
  objc_msgSend(v8, "availablePreviewPhotoPixelFormatTypes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __122__CAMStillImageCaptureRequest_CAMCaptureEngine___configurePhotoSettings_shouldIgnoreInitiationSettingsProperties_context___block_invoke;
  v78[3] = &unk_1EA32FC28;
  v78[4] = &v79;
  objc_msgSend(v24, "enumerateObjectsUsingBlock:", v78);
  v74 = v24;
  if (v80[5])
  {
    v25 = objc_alloc(MEMORY[0x1E0C99E08]);
    v26 = (void *)objc_msgSend(v25, "initWithObjectsAndKeys:", v80[5], *MEMORY[0x1E0CA9040], 0);
    -[CAMStillImageCaptureRequest desiredPreviewSize](self, "desiredPreviewSize");
    v28 = v27;
    if (v29 > 0.0 || v27 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v30, *MEMORY[0x1E0CA90E0]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v31, *MEMORY[0x1E0CA8FD8]);

    }
    objc_msgSend(v8, "setPreviewPhotoFormat:", v26);
    -[CAMStillImageCaptureRequest textAnalysisIdentifier](self, "textAnalysisIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 != 0;

    objc_msgSend(v8, "setPreviewPhotoFormatDimensionsLimitedToDisplayDimensions:", v33);
  }
  if (-[CAMCaptureRequest photoEncodingBehavior](self, "photoEncodingBehavior") == 2)
  {
    if (objc_msgSend(v76, "useFullResolutionThumbnailForRAWCaptures")
      && -[CAMStillImageCaptureRequest maximumPhotoResolution](self, "maximumPhotoResolution"))
    {
      v34 = -[CAMStillImageCaptureRequest maximumPhotoResolution](self, "maximumPhotoResolution");
    }
    else
    {
      v34 = 1;
    }
    v38 = +[CAMCaptureConversions CMVideoDimensionsForCAMPhotoResolution:](CAMCaptureConversions, "CMVideoDimensionsForCAMPhotoResolution:", v34);
    objc_msgSend(v8, "availableRawEmbeddedThumbnailPhotoCodecTypes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v40 = *MEMORY[0x1E0C8AE68];
      v92[0] = v36;
      v41 = *MEMORY[0x1E0C8AF60];
      v91[0] = v40;
      v91[1] = v41;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v38);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v92[1] = v42;
      v91[2] = *MEMORY[0x1E0C8AEF0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(*(unint64_t *)&v38));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v92[2] = v43;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
      v37 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setRawEmbeddedThumbnailPhotoFormat:", v37);
    }
    else
    {
      v37 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[CAMStillImageCaptureRequest(CAMCaptureEngine) _configurePhotoSettings:shouldIgnoreInitiationSettingsProperties:context:].cold.2(v37, v51, v52, v53, v54, v55, v56, v57);
    }
  }
  else
  {
    objc_msgSend(v8, "availableEmbeddedThumbnailPhotoCodecTypes");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMCaptureEncodingUtilities selectPhotoCodecFromAvailableCodecs:withBehavior:](CAMCaptureEncodingUtilities, "selectPhotoCodecFromAvailableCodecs:withBehavior:", v35, -[CAMCaptureRequest photoEncodingBehavior](self, "photoEncodingBehavior"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v89 = *MEMORY[0x1E0C8AE68];
      v90 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEmbeddedThumbnailPhotoFormat:", v37);
    }
    else
    {
      v37 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[CAMStillImageCaptureRequest(CAMCaptureEngine) _configurePhotoSettings:shouldIgnoreInitiationSettingsProperties:context:].cold.3(v37, v44, v45, v46, v47, v48, v49, v50);
    }
  }

  -[CAMStillImageCaptureRequest semanticStyle](self, "semanticStyle");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    if (!v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v59 = v58;
        objc_msgSend(v59, "avSemanticStyle");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSemanticStyle:", v60);

      }
    }
  }
  +[CAMCaptureMetadataUtilities metadataFromRequest:](CAMCaptureMetadataUtilities, "metadataFromRequest:", self);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMetadata:", v61);
  if (-[CAMStillImageCaptureRequest maximumPhotoResolution](self, "maximumPhotoResolution"))
  {
    v77 = +[CAMCaptureConversions CMVideoDimensionsForCAMPhotoResolution:](CAMCaptureConversions, "CMVideoDimensionsForCAMPhotoResolution:", -[CAMStillImageCaptureRequest maximumPhotoResolution](self, "maximumPhotoResolution"));
    objc_msgSend(v75, "supportedMaxPhotoDimensionsPrivate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v77, "{?=ii}");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v62, "containsObject:", v63))
    {
      objc_msgSend(v8, "setMaxPhotoDimensions:", v77);
    }
    else
    {
      v64 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        var0 = v77.var0;
        v87 = 1024;
        var1 = v77.var1;
        _os_log_impl(&dword_1DB760000, v64, OS_LOG_TYPE_DEFAULT, "supportedMaxPhotoDimensionsPrivate did not contain desired max photo dimensions (%d, %d)! Not setting AVCapturePhotoSettings maxPhotoDimensions", buf, 0xEu);
      }

    }
  }
  objc_msgSend(v8, "setUserInitiatedPhotoRequestTime:", -[CAMStillImageCaptureRequest userInitiationTime](self, "userInitiationTime"));
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "processZoomWithoutUpscaleForDevicePosition:", -[CAMCaptureRequest captureDevicePosition](self, "captureDevicePosition"));

  if (v66 && objc_msgSend(v10, "isProcessedPhotoZoomWithoutUpscalingSupported"))
    objc_msgSend(v8, "setProcessedPhotoZoomWithoutUpscalingEnabled:", 1);
  if (objc_msgSend(v75, "supportsQuadraHighResolutionStillImageOutput"))
    objc_msgSend(v8, "setHighResolutionPhotoEnabled:", objc_msgSend(v10, "isHighResolutionCaptureEnabled"));
  objc_msgSend(v8, "livePhotoMovieFileURL");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = objc_msgSend(v10, "isLivePhotoCaptureEnabled");

    if (v68)
    {
      v69 = -[CAMCaptureRequest videoEncodingBehavior](self, "videoEncodingBehavior");
      objc_msgSend(v10, "availableLivePhotoVideoCodecTypes");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMCaptureEncodingUtilities selectVideoCodecFromAvailableCodecs:withBehavior:](CAMCaptureEncodingUtilities, "selectVideoCodecFromAvailableCodecs:withBehavior:", v70, v69);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (v71)
        objc_msgSend(v8, "setLivePhotoVideoCodecType:", v71);

    }
  }
  objc_msgSend(v8, "setAutoContentAwareDistortionCorrectionEnabled:", objc_msgSend(v10, "isContentAwareDistortionCorrectionEnabled"));
  if (objc_msgSend(v10, "isSpatialPhotoCaptureSupported")
    && objc_msgSend(v10, "isSpatialPhotoCaptureEnabled"))
  {
    if (objc_msgSend(v8, "photoQualityPrioritization") == 3)
    {
      objc_msgSend(v8, "setAutoSpatialPhotoCaptureEnabled:", 1);
    }
    else
    {
      v72 = +[CAMCaptureConversions CAMPhotoQualityPrioritizationForAVCapturePhotoQualityPrioritization:](CAMCaptureConversions, "CAMPhotoQualityPrioritizationForAVCapturePhotoQualityPrioritization:", objc_msgSend(v8, "photoQualityPrioritization"));
      v73 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        -[CAMStillImageCaptureRequest(CAMCaptureEngine) _configurePhotoSettings:shouldIgnoreInitiationSettingsProperties:context:].cold.1(v72, v73);

    }
  }
  -[CAMStillImageCaptureRequest _sanitizeCapturePhotoSettings:withContext:](self, "_sanitizeCapturePhotoSettings:withContext:", v8, v9);

  _Block_object_dispose(&v79, 8);
}

void __122__CAMStillImageCaptureRequest_CAMCaptureEngine___configurePhotoSettings_shouldIgnoreInitiationSettingsProperties_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "intValue") == 875704422)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_sanitizeCapturePhotoSettings:(id)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(a4, "currentStillImageOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "supportedFlashModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "flashMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) == 0)
    objc_msgSend(v5, "setFlashMode:", 0);
  objc_msgSend(v6, "supportedHDRModes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "HDRMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v5, "setHDRMode:", 0);
    objc_msgSend(v5, "setEV0PhotoDeliveryEnabled:", 0);
  }
  if ((objc_msgSend(v6, "isLivePhotoCaptureEnabled") & 1) == 0)
  {
    objc_msgSend(v5, "setLivePhotoMovieFileURL:", 0);
    objc_msgSend(v5, "setLivePhotoMovieFileURLForOriginalPhoto:", 0);
    objc_msgSend(v5, "setLivePhotoMovieMetadata:", 0);
    objc_msgSend(v5, "setLivePhotoMovieMetadataForOriginalPhoto:", 0);
  }
  v13 = objc_msgSend(v5, "digitalFlashMode");
  objc_msgSend(v6, "supportedDigitalFlashModes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "containsObject:", v15);

  if ((v16 & 1) != 0)
  {
    if (v13)
    {
      objc_msgSend(v5, "setHDRMode:", 0);
      objc_msgSend(v5, "setFlashMode:", 0);
      objc_msgSend(v5, "setLivePhotoMovieFileURL:", 0);
      objc_msgSend(v5, "setLivePhotoMovieFileURLForOriginalPhoto:", 0);
      objc_msgSend(v5, "setLivePhotoMovieMetadata:", 0);
      objc_msgSend(v5, "setLivePhotoMovieMetadataForOriginalPhoto:", 0);
    }
  }
  else
  {
    v17 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "Disabling digital-flash capture because the output doesn't support the feature. This should only occur when the feature is force enabled via defaults.", buf, 2u);
    }

    objc_msgSend(v5, "setDigitalFlashMode:", 0);
  }
  if ((objc_msgSend(v6, "isDepthDataDeliverySupported") & 1) == 0
    && objc_msgSend(v5, "isDepthDataDeliveryEnabled"))
  {
    v18 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1DB760000, v18, OS_LOG_TYPE_DEFAULT, "Disabling depth delivery on photo output settings, because the output doesn't support depth delivery. This should only occur when Portrait is force enabled, as during emulation.", v24, 2u);
    }

    objc_msgSend(v5, "setDepthDataDeliveryEnabled:", 0);
  }
  if ((objc_msgSend(v6, "isPortraitEffectsMatteDeliverySupported") & 1) == 0)
  {
    objc_msgSend(v5, "setPortraitEffectsMatteDeliveryEnabled:", 0);
    objc_msgSend(v5, "setEmbedsPortraitEffectsMatteInPhoto:", 0);
  }
  objc_msgSend(v5, "semanticStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v6, "isSemanticStyleRenderingSupported");
  v21 = objc_msgSend(v6, "isSemanticStyleRenderingEnabled");
  if (v19 && (v20 & v21 & 1) == 0)
  {
    v22 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1DB760000, v22, OS_LOG_TYPE_DEFAULT, "Disabling Semantic Style on photo settings, because it is not supported on the device. This should only occur if the device is forced without Camera.app knowing about it or a fallback device is used.", v23, 2u);
    }

    objc_msgSend(v5, "setSemanticStyle:", 0);
  }

}

+ (unsigned)rawPixelFormatTypeForPhotoOutput:(id)a3
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = 1815491698;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "availableRawPhotoPixelFormatTypes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(MEMORY[0x1E0C8B0E8], "isAppleProRAWPixelFormat:", objc_msgSend(v9, "unsignedIntValue")))
        {
          v3 = objc_msgSend(v9, "unsignedIntValue");
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)needsLivePhotoCaptureResumedOnPhotoOutput:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  char v7;
  char v8;
  BOOL v9;
  char v10;

  v4 = a3;
  v5 = -[CAMStillImageCaptureRequest irisMode](self, "irisMode");
  -[CAMStillImageCaptureRequest irisLocalVideoDestinationURLForEV0:](self, "irisLocalVideoDestinationURLForEV0:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "isLivePhotoCaptureEnabled");
  v8 = objc_msgSend(v4, "isLivePhotoCaptureSuspended");

  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
    v10 = 0;
  else
    v10 = v7;
  return v10 & v8;
}

@end
