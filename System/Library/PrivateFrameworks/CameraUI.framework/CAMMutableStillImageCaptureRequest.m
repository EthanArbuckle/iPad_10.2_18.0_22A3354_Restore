@implementation CAMMutableStillImageCaptureRequest

- (void)setDelegate:(id)a3
{
  CAMStillImageCaptureRequestDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->super._delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (void)setCaptureOrientation:(int64_t)a3
{
  if (self->super.super._captureOrientation != a3)
    self->super.super._captureOrientation = a3;
}

- (void)setCaptureDevice:(int64_t)a3
{
  if (self->super.super._captureDevice != a3)
    self->super.super._captureDevice = a3;
}

- (void)setCaptureMode:(int64_t)a3
{
  if (self->super.super._captureMode != a3)
    self->super.super._captureMode = a3;
}

- (void)setPressType:(int64_t)a3
{
  if (self->super.super._pressType != a3)
    self->super.super._pressType = a3;
}

- (void)setWantsSquareCrop:(BOOL)a3
{
  if (self->super._wantsSquareCrop != a3)
    self->super._wantsSquareCrop = a3;
}

- (void)setEffectFilterType:(int64_t)a3
{
  if (self->super._effectFilterType != a3)
    self->super._effectFilterType = a3;
}

- (void)setSessionIdentifier:(unsigned __int16)a3
{
  if (self->super.super._sessionIdentifier != a3)
    self->super.super._sessionIdentifier = a3;
}

- (void)setAdjustmentFilters:(id)a3
{
  NSArray *v4;
  NSArray *adjustmentFilters;
  BOOL v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)a3;
  adjustmentFilters = self->super._adjustmentFilters;
  if (adjustmentFilters != v4)
  {
    v9 = v4;
    v6 = -[NSArray isEqualToArray:](adjustmentFilters, "isEqualToArray:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSArray *)-[NSArray copy](v9, "copy");
      v8 = self->super._adjustmentFilters;
      self->super._adjustmentFilters = v7;

      v4 = v9;
    }
  }

}

- (void)setOriginalFilters:(id)a3
{
  NSArray *v4;
  NSArray *originalFilters;
  BOOL v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)a3;
  originalFilters = self->super._originalFilters;
  if (originalFilters != v4)
  {
    v9 = v4;
    v6 = -[NSArray isEqualToArray:](originalFilters, "isEqualToArray:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSArray *)-[NSArray copy](v9, "copy");
      v8 = self->super._originalFilters;
      self->super._originalFilters = v7;

      v4 = v9;
    }
  }

}

- (void)setWantsHighResolutionStills:(BOOL)a3
{
  if (self->super._wantsHighResolutionStills != a3)
    self->super._wantsHighResolutionStills = a3;
}

- (void)setWantsAutoDualCameraFusion:(BOOL)a3
{
  if (self->super._wantsAutoDualCameraFusion != a3)
    self->super._wantsAutoDualCameraFusion = a3;
}

- (void)setWantsAudioForCapture:(BOOL)a3
{
  if (self->super._wantsAudioForCapture != a3)
    self->super._wantsAudioForCapture = a3;
}

- (void)setLightingEffectType:(int64_t)a3
{
  if (self->super._lightingEffectType != a3)
    self->super._lightingEffectType = a3;
}

- (void)setFlashMode:(int64_t)a3
{
  if (self->super._flashMode != a3)
    self->super._flashMode = a3;
}

- (void)setHdrMode:(int64_t)a3
{
  if (self->super._hdrMode != a3)
    self->super._hdrMode = a3;
}

- (void)setIrisMode:(int64_t)a3
{
  NSString *irisIdentifier;
  NSString *videoPersistenceUUID;
  NSString *EV0IrisIdentifier;
  NSString *EV0VideoPersistenceUUID;

  if (!a3)
  {
    irisIdentifier = self->super._irisIdentifier;
    self->super._irisIdentifier = 0;

    videoPersistenceUUID = self->super._videoPersistenceUUID;
    self->super._videoPersistenceUUID = 0;

    EV0IrisIdentifier = self->super._EV0IrisIdentifier;
    self->super._EV0IrisIdentifier = 0;

    EV0VideoPersistenceUUID = self->super._EV0VideoPersistenceUUID;
    self->super._EV0VideoPersistenceUUID = 0;

  }
  if (self->super._irisMode != a3)
    self->super._irisMode = a3;
}

- (void)setPhotoEncodingBehavior:(int64_t)a3
{
  if (self->super.super._photoEncodingBehavior != a3)
    self->super.super._photoEncodingBehavior = a3;
}

- (void)setVideoEncodingBehavior:(int64_t)a3
{
  if (self->super.super._videoEncodingBehavior != a3)
    self->super.super._videoEncodingBehavior = a3;
}

- (void)setPersistenceOptions:(int64_t)a3
{
  if (self->super.super._persistenceOptions != a3)
    self->super.super._persistenceOptions = a3;
}

- (void)setUserInitiationTime:(unint64_t)a3
{
  self->super._userInitiationTime = a3;
}

- (void)setLocation:(id)a3
{
  CLLocation *v5;
  CLLocation *v6;

  v5 = (CLLocation *)a3;
  if (self->super.super._location != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super.super._location, a3);
    v5 = v6;
  }

}

- (void)setHeading:(id)a3
{
  CLHeading *v5;
  CLHeading *v6;

  v5 = (CLHeading *)a3;
  if (self->super.super._heading != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super.super._heading, a3);
    v5 = v6;
  }

}

- (void)setShouldDelayRemotePersistence:(BOOL)a3
{
  if (self->super.super._shouldDelayRemotePersistence != a3)
    self->super.super._shouldDelayRemotePersistence = a3;
}

- (void)setTemporaryPersistenceOptions:(int64_t)a3
{
  if (self->super.super._temporaryPersistenceOptions != a3)
    self->super.super._temporaryPersistenceOptions = a3;
}

- (void)setOrigin:(int64_t)a3
{
  if (self->super.super._origin != a3)
    self->super.super._origin = a3;
}

- (void)setDesiredPreviewSize:(CGSize)a3
{
  if (self->super._desiredPreviewSize.width != a3.width || self->super._desiredPreviewSize.height != a3.height)
    self->super._desiredPreviewSize = a3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequest:distinctPersistence:includeAnalytics:", self, 0, 1);
}

- (void)setAssertionIdentifier:(unsigned int)a3
{
  self->super.super._assertionIdentifier = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CAMStillImageCaptureRequest initWithRequest:distinctPersistence:includeAnalytics:]([CAMStillImageCaptureRequest alloc], "initWithRequest:distinctPersistence:includeAnalytics:", self, 0, 1);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CAMStillImageCaptureRequest burstIdentifier](self, "burstIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStillImageCaptureRequest irisIdentifier](self, "irisIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ burstIdentifier:%@ irisIdentifier%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isCaptureMirrored
{
  return self->super.super._captureMirrored;
}

- (void)setCaptureMirrored:(BOOL)a3
{
  self->super.super._captureMirrored = a3;
}

- (CAMAnalyticsCaptureEvent)analyticsEvent
{
  return self->super.super._analyticsEvent;
}

- (void)setAnalyticsEvent:(id)a3
{
  CAMAnalyticsCaptureEvent **p_analyticsEvent;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_analyticsEvent = &self->super.super._analyticsEvent;
  -[CAMAnalyticsEvent uuid](*p_analyticsEvent, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    objc_storeStrong((id *)p_analyticsEvent, a3);

}

- (void)setCtmCaptureType:(int64_t)a3
{
  if (self->super._ctmCaptureType != a3)
    self->super._ctmCaptureType = a3;
}

- (void)setLowLightMode:(int64_t)a3
{
  if (self->super._lowLightMode != a3)
    self->super._lowLightMode = a3;
}

- (void)setWantsDepthData:(BOOL)a3
{
  if (self->super._wantsDepthData != a3)
    self->super._wantsDepthData = a3;
}

- (void)setPhotoQualityPrioritization:(int64_t)a3
{
  if (self->super._photoQualityPrioritization != a3)
    self->super._photoQualityPrioritization = a3;
}

- (void)setWantsSemanticSceneFilter:(BOOL)a3
{
  if (self->super._wantsSemanticSceneFilter != a3)
    self->super._wantsSemanticSceneFilter = a3;
}

- (void)setSemanticStyle:(id)a3
{
  CEKCaptureStyle **p_semanticStyle;
  id v5;

  p_semanticStyle = &self->super._semanticStyle;
  v5 = a3;
  if ((-[CEKCaptureStyle isEqual:](*p_semanticStyle, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_semanticStyle, a3);

}

- (void)setAspectRatio:(int64_t)a3
{
  if (self->super._aspectRatio != a3)
    self->super._aspectRatio = a3;
}

- (void)setStillDuringVideo:(BOOL)a3
{
  if (self->super._stillDuringVideo != a3)
    self->super._stillDuringVideo = a3;
}

- (void)setTextAnalysisIdentifier:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *textAnalysisIdentifier;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->super._textAnalysisIdentifier != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      textAnalysisIdentifier = self->super._textAnalysisIdentifier;
      self->super._textAnalysisIdentifier = v7;

      v5 = v9;
    }
  }

}

- (void)setTextAnalysisRegion:(id)a3
{
  CAMTextRegionResult *v5;
  CAMTextRegionResult *v6;

  v5 = (CAMTextRegionResult *)a3;
  if (self->super._textAnalysisRegion != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._textAnalysisRegion, a3);
    v5 = v6;
  }

}

- (void)setIrisIdentifier:(id)a3
{
  NSString *v4;
  NSString *irisIdentifier;

  if (self->super._irisIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    irisIdentifier = self->super._irisIdentifier;
    self->super._irisIdentifier = v4;

  }
}

- (void)setDisablesCameraSwitchingDuringRecording:(BOOL)a3
{
  if (self->super._disablesCameraSwitchingDuringRecording != a3)
    self->super._disablesCameraSwitchingDuringRecording = a3;
}

- (void)setTorchMode:(int64_t)a3
{
  if (self->super._torchMode != a3)
    self->super._torchMode = a3;
}

- (void)setLocalCTMVideoDestinationURL:(id)a3
{
  NSURL *v4;
  NSURL *localCTMVideoDestinationURL;

  if (self->super._localCTMVideoDestinationURL != a3)
  {
    v4 = (NSURL *)objc_msgSend(a3, "copy");
    localCTMVideoDestinationURL = self->super._localCTMVideoDestinationURL;
    self->super._localCTMVideoDestinationURL = v4;

  }
}

- (void)setLocalVideoDestinationURL:(id)a3
{
  NSURL *v4;
  NSURL *localVideoDestinationURL;

  if (self->super._localVideoDestinationURL != a3)
  {
    v4 = (NSURL *)objc_msgSend(a3, "copy");
    localVideoDestinationURL = self->super._localVideoDestinationURL;
    self->super._localVideoDestinationURL = v4;

  }
}

- (void)setVideoPersistenceUUID:(id)a3
{
  NSString *v4;
  NSString *videoPersistenceUUID;

  if (self->super._videoPersistenceUUID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    videoPersistenceUUID = self->super._videoPersistenceUUID;
    self->super._videoPersistenceUUID = v4;

  }
}

- (void)setWantsEV0ForHDR:(BOOL)a3
{
  if (self->super._wantsEV0ForHDR != a3)
    self->super._wantsEV0ForHDR = a3;
}

- (void)setEV0IrisIdentifier:(id)a3
{
  NSString *v4;
  NSString *EV0IrisIdentifier;

  if (self->super._EV0IrisIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    EV0IrisIdentifier = self->super._EV0IrisIdentifier;
    self->super._EV0IrisIdentifier = v4;

  }
}

- (void)setEV0LocalVideoDestinationURL:(id)a3
{
  NSURL *v4;
  NSURL *EV0LocalVideoDestinationURL;

  if (self->super._EV0LocalVideoDestinationURL != a3)
  {
    v4 = (NSURL *)objc_msgSend(a3, "copy");
    EV0LocalVideoDestinationURL = self->super._EV0LocalVideoDestinationURL;
    self->super._EV0LocalVideoDestinationURL = v4;

  }
}

- (void)setEV0VideoPersistenceUUID:(id)a3
{
  NSString *v4;
  NSString *EV0VideoPersistenceUUID;

  if (self->super._EV0VideoPersistenceUUID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    EV0VideoPersistenceUUID = self->super._EV0VideoPersistenceUUID;
    self->super._EV0VideoPersistenceUUID = v4;

  }
}

- (void)setStereoCaptureStatus:(int64_t)a3
{
  if (self->super._stereoCaptureStatus != a3)
    self->super._stereoCaptureStatus = a3;
}

- (void)setPersistenceUUID:(id)a3
{
  NSString *v4;
  NSString *persistenceUUID;

  if (self->super.super._persistenceUUID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    persistenceUUID = self->super.super._persistenceUUID;
    self->super.super._persistenceUUID = v4;

  }
}

- (void)setDeferredPersistenceOptions:(unint64_t)a3
{
  if (self->super.super._deferredPersistenceOptions != a3)
    self->super.super._deferredPersistenceOptions = a3;
}

- (void)setLocalDestinationURL:(id)a3
{
  NSURL **p_localDestinationURL;
  id v5;

  p_localDestinationURL = &self->super.super._localDestinationURL;
  v5 = a3;
  if ((-[NSURL isEqual:](*p_localDestinationURL, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_localDestinationURL, a3);

}

- (void)setShouldExtractDiagnosticsFromMetadata:(BOOL)a3
{
  if (self->super.super._shouldExtractDiagnosticsFromMetadata != a3)
    self->super.super._shouldExtractDiagnosticsFromMetadata = a3;
}

- (void)setShouldPersistDiagnosticsToSidecar:(BOOL)a3
{
  if (self->super.super._shouldPersistDiagnosticsToSidecar != a3)
    self->super.super._shouldPersistDiagnosticsToSidecar = a3;
}

- (void)setEV0PersistenceUUID:(id)a3
{
  NSString *v4;
  NSString *EV0PersistenceUUID;

  if (self->super._EV0PersistenceUUID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    EV0PersistenceUUID = self->super._EV0PersistenceUUID;
    self->super._EV0PersistenceUUID = v4;

  }
}

- (void)setRawFileFormatBehavior:(int64_t)a3
{
  if (self->super.super._rawFileFormatBehavior != a3)
    self->super.super._rawFileFormatBehavior = a3;
}

- (void)setCapturedFromPhotoBooth:(BOOL)a3
{
  if (self->super.super._capturedFromPhotoBooth != a3)
    self->super.super._capturedFromPhotoBooth = a3;
}

- (void)setBurstIdentifier:(id)a3
{
  NSString *v4;
  NSString *burstIdentifier;

  if (self->super._burstIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    burstIdentifier = self->super._burstIdentifier;
    self->super._burstIdentifier = v4;

  }
}

- (void)setMaximumBurstLength:(unint64_t)a3
{
  if (self->super._maximumBurstLength != a3)
    self->super._maximumBurstLength = a3;
}

- (void)setAspectRatioCrop:(int64_t)a3
{
  if (self->super._aspectRatioCrop != a3)
    self->super._aspectRatioCrop = a3;
}

- (void)setTimelapseIdentifier:(id)a3
{
  NSString *v4;
  NSString *timelapseIdentifier;

  if (self->super._timelapseIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    timelapseIdentifier = self->super._timelapseIdentifier;
    self->super._timelapseIdentifier = v4;

  }
}

- (void)setContactIDsInProximity:(id)a3
{
  NSArray *v4;
  NSArray *contactIDsInProximity;

  if (self->super.super._contactIDsInProximity != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    contactIDsInProximity = self->super.super._contactIDsInProximity;
    self->super.super._contactIDsInProximity = v4;

  }
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  if (self->super.super._sharedLibraryMode != a3)
    self->super.super._sharedLibraryMode = a3;
}

- (void)setSharedLibraryDiagnostics:(id)a3
{
  NSDictionary *v4;
  NSDictionary *sharedLibraryDiagnostics;

  if (self->super.super._sharedLibraryDiagnostics != a3)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    sharedLibraryDiagnostics = self->super.super._sharedLibraryDiagnostics;
    self->super.super._sharedLibraryDiagnostics = v4;

  }
}

- (void)setMaximumPhotoResolution:(int64_t)a3
{
  if (self->super._maximumPhotoResolution != a3)
    self->super._maximumPhotoResolution = a3;
}

- (void)setWantsWhiteBalanceLockedDuringVideoRecording:(BOOL)a3
{
  self->super._wantsWhiteBalanceLockedDuringVideoRecording = a3;
}

@end
