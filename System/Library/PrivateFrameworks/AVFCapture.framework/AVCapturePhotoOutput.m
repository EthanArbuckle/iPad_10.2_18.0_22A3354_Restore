@implementation AVCapturePhotoOutput

- (void)_updateMaxBracketedCapturePhotoCountForSourceDevice:(id)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  AVCapturePhotoOutputInternal *internal;
  unint64_t maxBracketedCapturePhotoCount;

  v5 = (void *)objc_msgSend(a3, "activeFormat");
  if ((int)FigCapturePlatformIdentifier() >= 5)
    v6 = 8;
  else
    v6 = 4;
  -[AVCaptureOutput session](self, "session");
  objc_opt_class();
  v7 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0 && v5)
  {
    v8 = -[AVCaptureConnection sourceDeviceInput](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDeviceInput");
    if (objc_msgSend(a3, "isCenterStageActive"))
      v9 = objc_msgSend(v8, "isCenterStageAllowed");
    else
      v9 = 0;
    if (objc_msgSend(a3, "isBackgroundBlurActive"))
      v10 = objc_msgSend(v8, "isBackgroundBlurAllowed");
    else
      v10 = 0;
    if (objc_msgSend(a3, "isStudioLightActive"))
      v11 = objc_msgSend(v8, "isStudioLightingAllowed");
    else
      v11 = 0;
    v12 = objc_msgSend(a3, "isBackgroundReplacementActive");
    if (v12)
      LOBYTE(v12) = objc_msgSend(v8, "isBackgroundReplacementAllowed");
    v7 = 0;
    if (((v9 | v10 | v11) & 1) == 0 && (v12 & 1) == 0)
    {
      v7 = v6;
      if (objc_msgSend(v5, "supportsQuadraHighResolutionStillImageOutput"))
      {
        if (self->_internal->highResolutionCaptureEnabled)
          v7 = 0;
        else
          v7 = v6;
      }
    }
  }
  MEMORY[0x1A1AF1298](self->_internal->requestsLock);
  internal = self->_internal;
  maxBracketedCapturePhotoCount = internal->maxBracketedCapturePhotoCount;
  MEMORY[0x1A1AF12A4](internal->requestsLock);
  if (v7 != maxBracketedCapturePhotoCount)
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("maxBracketedCapturePhotoCount"));
  MEMORY[0x1A1AF1298](self->_internal->requestsLock);
  self->_internal->maxBracketedCapturePhotoCount = v7;
  MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  if (v7 != maxBracketedCapturePhotoCount)
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("maxBracketedCapturePhotoCount"));
}

- (BOOL)isDepthDataDeliveryEnabled
{
  return self->_internal->depthDataDeliveryEnabled;
}

- (BOOL)isVirtualDeviceConstituentPhotoDeliveryEnabled
{
  return self->_internal->virtualDeviceConstituentPhotoDeliveryEnabled;
}

- (BOOL)isLivePhotoCaptureEnabled
{
  return self->_internal->livePhotoCaptureEnabled;
}

- (NSArray)enabledSemanticSegmentationMatteTypes
{
  return self->_internal->enabledSemanticSegmentationTypes;
}

- (BOOL)isAppleProRAWEnabled
{
  return self->_internal->appleProRAWEnabled;
}

- (BOOL)isSemanticStyleRenderingEnabled
{
  return self->_internal->semanticStyleRenderingEnabled;
}

- (BOOL)maxPhotoDimensionsAreHighResolution
{
  uint64_t v3;
  AVCapturePhotoOutputInternal *internal;

  v3 = objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "activeFormat"), "defaultPhotoDimensionsWithHighResolutionCaptureEnabled:", 1);
  internal = self->_internal;
  return internal->maxPhotoDimensions.width >= (int)v3 && internal->maxPhotoDimensions.height >= SHIDWORD(v3);
}

- (BOOL)isContentAwareDistortionCorrectionEnabled
{
  return self->_internal->contentAwareDistortionCorrectionEnabled;
}

- (BOOL)isAutoDeferredPhotoDeliveryEnabled
{
  return self->_internal->autoDeferredPhotoDeliveryEnabled;
}

- (id)figCaptureIrisPreparedSettings
{
  id v3;

  MEMORY[0x1A1AF1298](self->_internal->requestsLock, a2);
  v3 = -[AVCapturePhotoOutput _figCaptureIrisPreparedSettingsForRequest:](self, "_figCaptureIrisPreparedSettingsForRequest:", -[NSMutableArray lastObject](self->_internal->prepareRequests, "lastObject"));
  MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  return v3;
}

- (BOOL)preservesLivePhotoCaptureSuspendedOnSessionStop
{
  return self->_internal->preservesLivePhotoCaptureSuspendedOnSessionStop;
}

- (BOOL)optimizesImagesForOfflineVideoStabilization
{
  return self->_internal->optimizesImagesForOfflineVideoStabilization;
}

- (AVCapturePhotoQualityPrioritization)maxPhotoQualityPrioritization
{
  return self->_internal->maxPhotoQualityPrioritization;
}

- (CMVideoDimensions)maxPhotoDimensions
{
  return (CMVideoDimensions)self->_internal->maxPhotoDimensions;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoMovieVideoFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 184);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoMovieDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 160);
  return self;
}

- (BOOL)isZeroShutterLagEnabled
{
  return self->_internal->zeroShutterLagEnabled;
}

- (BOOL)isSpatialOverCaptureEnabled
{
  return self->_internal->spatialOverCaptureEnabled;
}

- (BOOL)isResponsiveCaptureEnabled
{
  return self->_internal->responsiveCaptureEnabled;
}

- (BOOL)isPreviewQualityAdjustedPhotoFilterRenderingEnabled
{
  return self->_internal->previewQualityAdjustedPhotoFilterRenderingEnabled;
}

- (BOOL)isPortraitEffectsMatteDeliveryEnabled
{
  return self->_internal->portraitEffectsMatteDeliveryEnabled;
}

- (BOOL)isMovieRecordingEnabled
{
  return self->_internal->movieRecordingEnabled;
}

- (BOOL)isLivePhotoCaptureSuspended
{
  return self->_internal->livePhotoCaptureSuspended;
}

- (BOOL)isLivePhotoAutoTrimmingEnabled
{
  return self->_internal->livePhotoAutoTrimmingEnabled;
}

- (BOOL)isFocusPixelBlurScoreEnabled
{
  return self->_internal->focusPixelFocusBlurScoreEnabled;
}

- (BOOL)isFilterRenderingEnabled
{
  return self->_internal->filterRenderingEnabled;
}

- (BOOL)isFastCapturePrioritizationEnabled
{
  return self->_internal->fastCapturePrioritizationEnabled;
}

- (BOOL)isDigitalFlashCaptureEnabled
{
  return self->_internal->digitalFlashCaptureEnabled;
}

- (BOOL)isConstantColorSaturationBoostEnabled
{
  return self->_internal->constantColorSaturationBoostEnabled;
}

- (BOOL)isConstantColorClippingRecoveryEnabled
{
  return self->_internal->constantColorClippingRecoveryEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)livePhotoMovieDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_internal->livePhotoMovieDimensions;
}

- (BOOL)isConstantColorEnabled
{
  return self->_internal->constantColorEnabled;
}

uint64_t __62__AVCapturePhotoOutput__updateSceneMonitoringForSourceDevice___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 320), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_figCaptureIrisPreparedSettingsForRequest:(id)a3
{
  id v5;
  void *v6;
  NSArray *availablePhotoCodecTypes;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t maxBracketedCapturePhotoCount;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  AVCapturePhotoOutputInternal *internal;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0D03BB8]);
  v30 = a3;
  objc_msgSend(v5, "setSettingsID:", objc_msgSend(a3, "requestID"));
  objc_msgSend(v5, "setOutputHeight:", 0xFFFFFFFFLL);
  objc_msgSend(v5, "setOutputWidth:", 0xFFFFFFFFLL);
  objc_msgSend(v5, "setQualityPrioritization:", 1);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  availablePhotoCodecTypes = self->_internal->availablePhotoCodecTypes;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](availablePhotoCodecTypes, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(availablePhotoCodecTypes);
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", AVOSTypeForString()));
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](availablePhotoCodecTypes, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v9);
  }
  objc_msgSend(v6, "addObjectsFromArray:", self->_internal->availablePhotoPixelFormatTypes);
  v32 = (void *)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "activeFormat");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = (id)objc_msgSend(v30, "photoSettingsArray");
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v12)
  {
    v13 = v12;
    v31 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v35 != v31)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = objc_msgSend((id)objc_msgSend(v15, "bracketedSettings"), "count");
          if (v16 > objc_msgSend(v5, "bracketedImageCount"))
          {
            v17 = objc_msgSend((id)objc_msgSend(v15, "bracketedSettings"), "count");
            maxBracketedCapturePhotoCount = self->_internal->maxBracketedCapturePhotoCount;
            if (v17 < maxBracketedCapturePhotoCount)
              maxBracketedCapturePhotoCount = objc_msgSend((id)objc_msgSend(v15, "bracketedSettings"), "count");
            objc_msgSend(v5, "setBracketedImageCount:", maxBracketedCapturePhotoCount);
          }
        }
        if (objc_msgSend(v15, "formatFourCC"))
        {
          v19 = objc_msgSend(v6, "indexOfObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "processedOutputFormat")));
          v20 = objc_msgSend(v6, "indexOfObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v15, "formatFourCC")));
          v21 = v19 == 0x7FFFFFFFFFFFFFFFLL ? -1 : v19;
          v22 = v20 == 0x7FFFFFFFFFFFFFFFLL ? -1 : v20;
          if (v22 > v21)
            objc_msgSend(v5, "setProcessedOutputFormat:", objc_msgSend(v15, "formatFourCC"));
        }
        if (objc_msgSend(v15, "rawPhotoPixelFormatType")
          && -[NSDictionary objectForKeyedSubscript:](self->_internal->availableRawPhotoPixelFormatTypes, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v15, "rawPhotoPixelFormatType"))))
        {
          objc_msgSend(v5, "setRawOutputFormat:", -[AVCapturePhotoOutput _internalRawFormatFromRawFormat:](self, "_internalRawFormatFromRawFormat:", objc_msgSend(v15, "rawPhotoPixelFormatType")));
        }
        v33 = 0;
        if (po_requestingDefaultHighResStillForAVCapturePhotoSettings(v15, v32, &v33))
        {
          objc_msgSend(v5, "setOutputHeight:", 0);
          objc_msgSend(v5, "setOutputWidth:", 0);
        }
        else if (objc_msgSend(v5, "outputWidth") == -1)
        {
          objc_msgSend(v5, "setOutputWidth:", v33);
          objc_msgSend(v5, "setOutputHeight:", HIDWORD(v33));
        }
        internal = self->_internal;
        if (internal->stillImageStabilizationSupported || internal->highPhotoQualitySupported)
        {
          v24 = objc_msgSend(v5, "qualityPrioritization");
          if (v24 <= (int)objc_msgSend(v15, "photoQualityPrioritization"))
            v25 = objc_msgSend(v15, "photoQualityPrioritization");
          else
            v25 = objc_msgSend(v5, "qualityPrioritization");
          objc_msgSend(v5, "setQualityPrioritization:", v25);
        }
        v26 = objc_msgSend(v15, "HDRMode");
        if (v26 > (int)objc_msgSend(v5, "HDRMode")
          && -[NSArray containsObject:](self->_internal->supportedHDRModes, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "HDRMode"))))
        {
          objc_msgSend(v5, "setHDRMode:", objc_msgSend(v15, "HDRMode"));
        }
        v27 = objc_msgSend(v15, "digitalFlashMode");
        if (v27 > (int)objc_msgSend(v5, "digitalFlashMode")
          && -[NSArray containsObject:](self->_internal->supportedDigitalFlashModes, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "digitalFlashMode"))))
        {
          objc_msgSend(v5, "setDigitalFlashMode:", objc_msgSend(v15, "digitalFlashMode"));
        }
        if (objc_msgSend((id)objc_msgSend(v15, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count")
          && self->_internal->virtualDeviceConstituentPhotoDeliverySupported)
        {
          objc_msgSend(v5, "setBravoConstituentImageDeliveryDeviceTypes:", po_deviceArrayToFigCaptureSourceDeviceTypesArray((void *)objc_msgSend(v15, "virtualDeviceConstituentPhotoDeliveryEnabledDevices")));
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v13);
  }
  return v5;
}

+ (BOOL)isBayerRAWPixelFormat:(OSType)pixelFormat
{
  BOOL result;
  int v4;

  result = 1;
  if ((int)pixelFormat <= 1734505011)
  {
    if (pixelFormat == 1650943796)
      return result;
    v4 = 1651519798;
    goto LABEL_7;
  }
  if (pixelFormat != 1734505012 && pixelFormat != 1735549492)
  {
    v4 = 1919379252;
LABEL_7:
    if (pixelFormat != v4)
      return 0;
  }
  return result;
}

+ (id)validMetadataTopLevelCGImagePropertiesKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[25];

  v15[24] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CBCB50];
  v15[0] = *MEMORY[0x1E0CBD090];
  v15[1] = v2;
  v3 = *MEMORY[0x1E0CBCED8];
  v15[2] = *MEMORY[0x1E0CBD028];
  v15[3] = v3;
  v4 = *MEMORY[0x1E0CBC980];
  v15[4] = *MEMORY[0x1E0CBCD68];
  v15[5] = v4;
  v5 = *MEMORY[0x1E0D04098];
  v15[6] = *MEMORY[0x1E0CBCF70];
  v15[7] = v5;
  v6 = *MEMORY[0x1E0CA2660];
  v15[8] = *MEMORY[0x1E0D04108];
  v15[9] = v6;
  v7 = *MEMORY[0x1E0CBC770];
  v15[10] = *MEMORY[0x1E0CA2668];
  v15[11] = v7;
  v8 = *MEMORY[0x1E0CBD040];
  v15[12] = *MEMORY[0x1E0CBCCD0];
  v15[13] = v8;
  v9 = *MEMORY[0x1E0CBC9F8];
  v15[14] = *MEMORY[0x1E0CBD048];
  v15[15] = v9;
  v10 = *MEMORY[0x1E0CBCFF0];
  v15[16] = *MEMORY[0x1E0CBCA00];
  v15[17] = v10;
  v11 = *MEMORY[0x1E0CBCF38];
  v15[18] = *MEMORY[0x1E0CBCF30];
  v15[19] = v11;
  v12 = *MEMORY[0x1E0CBC8C8];
  v15[20] = *MEMORY[0x1E0CBCEA0];
  v15[21] = v12;
  v13 = *MEMORY[0x1E0CBCA28];
  v15[22] = *MEMORY[0x1E0CBD060];
  v15[23] = v13;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 24);
}

- (void)setPreservesLivePhotoCaptureSuspendedOnSessionStop:(BOOL)preservesLivePhotoCaptureSuspendedOnSessionStop
{
  _BOOL8 v3;
  OpaqueCMClock *HostTimeClock;
  void *v6;
  CMTime v7;

  v3 = preservesLivePhotoCaptureSuspendedOnSessionStop;
  memset(&v7, 0, sizeof(v7));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v7, HostTimeClock);
  if (v3 && !-[AVCapturePhotoOutput isLivePhotoCaptureSupported](self, "isLivePhotoCaptureSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6, v7.value, *(_QWORD *)&v7.timescale, v7.epoch);
  }
  else
  {
    self->_internal->preservesLivePhotoCaptureSuspendedOnSessionStop = v3;
    -[AVCapturePhotoOutput setFigCaptureSessionSectionProperty:withValue:](self, "setFigCaptureSessionSectionProperty:withValue:", *MEMORY[0x1E0D042D8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3));
  }
}

- (void)setFigCaptureSessionSectionProperty:(__CFString *)a3 withValue:(void *)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__AVCapturePhotoOutput_setFigCaptureSessionSectionProperty_withValue___block_invoke;
  v4[3] = &unk_1E421D780;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v4);
}

uint64_t __59__AVCapturePhotoOutput__isStillImageStabilizationSupported__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16)
                                                                            + 89);
  return result;
}

uint64_t __55__AVCapturePhotoOutput_photoSettingsForSceneMonitoring__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 16)
                                                                              + 320);
  return result;
}

id __50__AVCapturePhotoOutput_supportedDigitalFlashModes__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 120);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __64__AVCapturePhotoOutput__updateSupportedHDRModesForSourceDevice___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 96) = result;
  return result;
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  BOOL result;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "mediaType");
  v8 = *MEMORY[0x1E0CF2B90];
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B90]) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B68]) & 1) == 0
    && (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B78])
     || !AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined()))
  {
    v9 = 1;
    goto LABEL_23;
  }
  if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B68]))
  {
    if (-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", v7))
    {
      v9 = 2;
LABEL_23:
      v19 = (void *)AVCaptureOutputConnectionFailureReasonString(v9, (uint64_t)self, a3);
      result = 0;
      *a4 = v19;
      return result;
    }
    return 1;
  }
  v10 = *MEMORY[0x1E0CF2B78];
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B78]))
    return 1;
  v11 = (void *)objc_msgSend((id)objc_msgSend(a3, "inputPorts"), "firstObject");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = -[AVCaptureOutput connections](self, "connections", 0);
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v13)
    return 1;
  v14 = v13;
  v15 = *(_QWORD *)v21;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v21 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(v17, "mediaType"), "isEqualToString:", v10)
        && (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "inputPorts"), "firstObject"), "input"), "isEqual:", objc_msgSend(v11, "input")) & 1) == 0)
      {
        v9 = 3;
        goto LABEL_23;
      }
    }
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    result = 1;
    if (v14)
      continue;
    return result;
  }
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  objc_super v11;

  -[AVCapturePhotoOutput _incrementObserverCountForKeyPath:](self, "_incrementObserverCountForKeyPath:", a4);
  v11.receiver = self;
  v11.super_class = (Class)AVCapturePhotoOutput;
  -[AVCapturePhotoOutput addObserver:forKeyPath:options:context:](&v11, sel_addObserver_forKeyPath_options_context_, a3, a4, a5, a6);
}

- (void)_incrementObserverCountForKeyPath:(id)a3
{
  char v5;
  char v6;
  char v7;
  char v8;
  int v9;
  NSObject *sceneDetectionObserversDispatchQueue;
  _QWORD v11[5];
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;

  v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("isFlashScene"));
  v6 = objc_msgSend(a3, "isEqualToString:", CFSTR("isHDRScene"));
  v7 = objc_msgSend(a3, "isEqualToString:", CFSTR("isStillImageStabilizationScene"));
  v8 = objc_msgSend(a3, "isEqualToString:", CFSTR("digitalFlashStatus"));
  v9 = objc_msgSend(a3, "isEqualToString:", CFSTR("digitalFlashExposureTimes"));
  if ((v5 & 1) != 0 || (v6 & 1) != 0 || (v7 & 1) != 0 || (v8 & 1) != 0 || v9)
  {
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__AVCapturePhotoOutput__incrementObserverCountForKeyPath___block_invoke;
    v11[3] = &unk_1E421D640;
    v12 = v5;
    v11[4] = self;
    v13 = v6;
    v14 = v7;
    v15 = v8;
    v16 = v9;
    dispatch_async(sceneDetectionObserversDispatchQueue, v11);
  }
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVCapturePhotoOutput;
  v5 = -[AVCaptureOutput addConnection:error:](&v12, sel_addConnection_error_, a3, a4);
  v6 = (void *)objc_msgSend(v5, "mediaType");
  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0CF2B90]))
  {
    v7 = (void *)objc_msgSend(v5, "sourceDevice");
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("flashSceneDetectedForPhotoOutput"), 7, AVCapturePhotoOutputDeviceFlashSceneDetectedForPhotoOutputChangedContext);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("HDRSceneDetectedForPhotoOutput"), 7, AVCapturePhotoOutputDeviceHDRSceneDetectedForPhotoOutputChangedContext);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("isStillImageStabilizationScene"), 7, AVCapturePhotoOutputDeviceStillImageStabilizationSceneChangedContext);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("digitalFlashSceneForPhotoOutput"), 7, AVCapturePhotoOutputDeviceDigitalFlashSceneForPhotoOutputChangedContext);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("videoHDREnabled"), 0, AVCapturePhotoOutputDeviceVideoHDREnabledChangedContext);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("spatialOverCaptureEnabled"), 0, AVCapturePhotoOutputDeviceSpatialOverCaptureEnabledChangedContext);
    v8 = -[AVCaptureOutput session](self, "session");
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("sessionPreset"), 0, AVCapturePhotoOutputSessionPresetChangedContext);
    v9 = -[AVCaptureOutput session](self, "session");
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("outputs"), 0, AVCapturePhotoOutputSessionOutputsChangedContext);
    v10 = -[AVCaptureOutput session](self, "session");
    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, CFSTR("running"), 5, AVCapturePhotoOutputSessionIsRunningChangedContext);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("geometricDistortionCorrectionEnabled"), 3, AVCapturePhotoOutputDeviceGDCEnabledChangedContext);
    self->_internal->timeLapseCaptureRateNeedsUpdate = 1;
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("imageControlMode"), 15, AVCapturePhotoOutputDeviceImageControlModeChangedContext);
    -[AVCapturePhotoOutput _updateSupportedPropertiesForSourceDevice:](self, "_updateSupportedPropertiesForSourceDevice:", v7);
  }
  return v5;
}

- (void)setSession:(id)a3
{
  int64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCapturePhotoOutput;
  -[AVCaptureOutput setSession:](&v5, sel_setSession_);
  if (!self->_internal->maxPhotoQualityPrioritizationHasBeenSetByClient)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = 1;
    else
      v4 = 2;
    if (self->_internal->maxPhotoQualityPrioritization != v4)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("maxPhotoQualityPrioritization"));
      self->_internal->maxPhotoQualityPrioritization = v4;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("maxPhotoQualityPrioritization"));
    }
  }
}

- (void)_updateMaxPhotoDimensionsForDevice:(id)a3
{
  uint64_t v5;

  if (objc_msgSend(a3, "activeFormat"))
    v5 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "defaultPhotoDimensionsWithHighResolutionCaptureEnabled:", self->_internal->highResolutionCaptureEnabled);
  else
    v5 = 0;
  -[AVCapturePhotoOutput _setMaxPhotoDimensions:bumpChangeSeedOut:](self, "_setMaxPhotoDimensions:bumpChangeSeedOut:", v5, 0);
}

id __43__AVCapturePhotoOutput_supportedFlashModes__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 112);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __41__AVCapturePhotoOutput_supportedHDRModes__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 96);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_updateLivePhotoCaptureSupportedForSourceDevice:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  AVCapturePhotoOutputInternal *internal;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isIrisSupported"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = (void *)objc_msgSend(-[AVCaptureOutput session](self, "session"), "outputs");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = 1;
            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v7)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_12:
    if (objc_msgSend((id)objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"), "isEqual:", CFSTR("AVCaptureSessionPresetInputPriority")))
    {
      if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isPhotoFormat"))
      {
        v20 = 0u;
        v21 = 0u;
        v19 = 0u;
        v11 = (void *)objc_msgSend(-[AVCaptureOutput session](self, "session", 0, 0), "outputs");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
LABEL_16:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_23;
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              if (v13)
                goto LABEL_16;
              break;
            }
          }
        }
      }
    }
    if ((v10 & 1) != 0)
    {
LABEL_23:
      v16 = 0;
      goto LABEL_25;
    }
  }
  v16 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isIrisSupported");
LABEL_25:
  if (self->_internal->livePhotoCaptureSupported != v16)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("livePhotoCaptureSupported"));
    self->_internal->livePhotoCaptureSupported = v16;
    self->_internal->videoCaptureSupported = v16;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("livePhotoCaptureSupported"));
    internal = self->_internal;
    if ((v16 & 1) == 0)
    {
      if (internal->livePhotoCaptureEnabled)
      {
        -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("livePhotoCaptureEnabled"));
        self->_internal->livePhotoCaptureEnabled = v16;
        -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("livePhotoCaptureEnabled"));
        internal = self->_internal;
      }
      if (internal->preservesLivePhotoCaptureSuspendedOnSessionStop)
      {
        -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("preservesLivePhotoCaptureSuspendedOnSessionStop"));
        self->_internal->preservesLivePhotoCaptureSuspendedOnSessionStop = v16;
        -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("preservesLivePhotoCaptureSuspendedOnSessionStop"));
        internal = self->_internal;
      }
    }
    if (internal->livePhotoAutoTrimmingEnabled != v16)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("livePhotoAutoTrimmingEnabled"));
      self->_internal->livePhotoAutoTrimmingEnabled = v16;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("livePhotoAutoTrimmingEnabled"));
    }
  }
}

- (void)_updateDepthDataDeliverySupportedForSourceDevice:(id)a3
{
  id v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;

  v5 = -[AVCaptureConnection sourceDeviceInput](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDeviceInput");
  v6 = objc_msgSend(a3, "isBackgroundBlurActive")
    && (objc_msgSend(v5, "isBackgroundBlurAllowed") & 1) != 0
    || objc_msgSend(a3, "isStudioLightActive") && (objc_msgSend(v5, "isStudioLightingAllowed") & 1) != 0
    || objc_msgSend(a3, "isBackgroundReplacementActive")
    && objc_msgSend(v5, "isBackgroundReplacementAllowed");
  v7 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isStillImageDisparitySupported") & !v6;
  if (self->_internal->depthDataDeliverySupported != v7)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("depthDataDeliverySupported"));
    self->_internal->depthDataDeliverySupported = v7;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("depthDataDeliverySupported"));
    if (!v7 && self->_internal->depthDataDeliveryEnabled)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("depthDataDeliveryEnabled"));
      self->_internal->depthDataDeliveryEnabled = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("depthDataDeliveryEnabled"));
    }
  }
  v8 = objc_msgSend((id)objc_msgSend(a3, "activeDepthDataFormat"), "isPortraitEffectsMatteStillImageDeliverySupported") & !v6;
  if (self->_internal->portraitEffectsMatteDeliverySupported != v8)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("portraitEffectsMatteDeliverySupported"));
    self->_internal->portraitEffectsMatteDeliverySupported = v8;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("portraitEffectsMatteDeliverySupported"));
    if (!v8 && self->_internal->portraitEffectsMatteDeliveryEnabled)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("portraitEffectsMatteDeliveryEnabled"));
      self->_internal->portraitEffectsMatteDeliveryEnabled = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("portraitEffectsMatteDeliveryEnabled"));
    }
  }
  v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a3, "activeDepthDataFormat"), "supportedSemanticSegmentationMatteTypes"));
  if (v6)
    v10 = (void *)MEMORY[0x1E0C9AA60];
  else
    v10 = (void *)v9;
  if ((objc_msgSend(v10, "isEqual:", self->_internal->availableSemanticSegmentationTypes) & 1) == 0)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableSemanticSegmentationTypes"));

    self->_internal->availableSemanticSegmentationTypes = (NSArray *)v10;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableSemanticSegmentationTypes"));
    if (-[NSArray count](self->_internal->enabledSemanticSegmentationTypes, "count"))
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("enabledSemanticSegmentationTypes"));

      self->_internal->enabledSemanticSegmentationTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("enabledSemanticSegmentationTypes"));
    }
  }
}

uint64_t __69__AVCapturePhotoOutput__setIsStillImageStabilizationScene_firingKVO___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16) + 286) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __42__AVCapturePhotoOutput_digitalFlashStatus__block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[4] + 16) + 296);
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1[4] + 16) + 288);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 16) + 320), "digitalFlashMode");
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

uint64_t __59__AVCapturePhotoOutput_setPhotoSettingsForSceneMonitoring___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 320) = result;
  return result;
}

- (void)setPhotoSettingsForSceneMonitoring:(AVCapturePhotoSettings *)photoSettingsForSceneMonitoring
{
  int64_t v5;
  int64_t v6;
  AVCaptureFlashMode v7;
  AVCapturePhotoQualityPrioritization v8;
  AVCapturePhotoQualityPrioritization v9;
  int64_t v10;
  int64_t v11;
  NSObject *sceneDetectionObserversDispatchQueue;
  void *v13;
  AVCaptureFlashMode v14;
  _QWORD block[6];

  if (photoSettingsForSceneMonitoring && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v13);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
  }
  else
  {
    v5 = -[AVCapturePhotoSettings HDRMode](self->_internal->photoSettingsForSceneMonitoring, "HDRMode");
    v6 = -[AVCapturePhotoSettings HDRMode](photoSettingsForSceneMonitoring, "HDRMode");
    v14 = -[AVCapturePhotoSettings flashMode](self->_internal->photoSettingsForSceneMonitoring, "flashMode");
    v7 = -[AVCapturePhotoSettings flashMode](photoSettingsForSceneMonitoring, "flashMode");
    v8 = -[AVCapturePhotoSettings photoQualityPrioritization](self->_internal->photoSettingsForSceneMonitoring, "photoQualityPrioritization");
    v9 = -[AVCapturePhotoSettings photoQualityPrioritization](photoSettingsForSceneMonitoring, "photoQualityPrioritization");
    v10 = -[AVCapturePhotoSettings digitalFlashMode](self->_internal->photoSettingsForSceneMonitoring, "digitalFlashMode");
    v11 = -[AVCapturePhotoSettings digitalFlashMode](photoSettingsForSceneMonitoring, "digitalFlashMode");
    if (v5 != v6)
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isHDRScene"));
    if (v14 != v7)
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFlashScene"));
    if (v8 != v9)
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isStillImageStabilizationScene"));
    if (v10 != v11)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("digitalFlashStatus"));
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("digitalFlashExposureTimes"));
    }
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__AVCapturePhotoOutput_setPhotoSettingsForSceneMonitoring___block_invoke;
    block[3] = &unk_1E4216408;
    block[4] = self;
    block[5] = photoSettingsForSceneMonitoring;
    dispatch_sync(sceneDetectionObserversDispatchQueue, block);
    if (v5 != v6)
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isHDRScene"));
    if (v14 != v7)
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFlashScene"));
    if (v8 != v9)
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isStillImageStabilizationScene"));
    if (v10 != v11)
    {
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("digitalFlashExposureTimes"));
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("digitalFlashStatus"));
    }
    -[AVCapturePhotoOutput _updateSceneMonitoringForSourceDevice:](self, "_updateSceneMonitoringForSourceDevice:", -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"));
  }
}

- (void)_updateSceneMonitoringForSourceDevice:(id)a3
{
  NSObject *sceneDetectionObserversDispatchQueue;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3052000000;
    v14 = __Block_byref_object_copy__8;
    v15 = __Block_byref_object_dispose__8;
    v16 = 0;
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__AVCapturePhotoOutput__updateSceneMonitoringForSourceDevice___block_invoke;
    block[3] = &unk_1E4217A60;
    block[4] = self;
    block[5] = &v11;
    dispatch_sync(sceneDetectionObserversDispatchQueue, block);
    v6 = -[AVCapturePhotoOutput supportedFlashModes](self, "supportedFlashModes");
    if (!-[NSArray containsObject:](v6, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)v12[5], "flashMode"))))objc_msgSend((id)v12[5], "setFlashMode:", 0);
    v7 = -[AVCapturePhotoOutput supportedHDRModes](self, "supportedHDRModes");
    if ((objc_msgSend(v7, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)v12[5], "HDRMode"))) & 1) == 0)objc_msgSend((id)v12[5], "setHDRMode:", 0);
    if (!-[AVCapturePhotoOutput _isStillImageStabilizationSupported](self, "_isStillImageStabilizationSupported")
      && !self->_internal->highPhotoQualitySupported)
    {
      objc_msgSend((id)v12[5], "setPhotoQualityPrioritization:", 1);
    }
    v8 = -[AVCapturePhotoOutput supportedDigitalFlashModes](self, "supportedDigitalFlashModes");
    if ((objc_msgSend(v8, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)v12[5], "digitalFlashMode"))) & 1) == 0)objc_msgSend((id)v12[5], "setDigitalFlashMode:", 0);
    objc_msgSend(a3, "_setPhotoSettingsForSceneMonitoring:", v12[5]);

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    -[AVCapturePhotoOutput _setIsFlashScene:firingKVO:](self, "_setIsFlashScene:firingKVO:", 0, 1);
    -[AVCapturePhotoOutput _setIsHDRScene:firingKVO:](self, "_setIsHDRScene:firingKVO:", 0, 1);
    -[AVCapturePhotoOutput _setIsStillImageStabilizationScene:firingKVO:](self, "_setIsStillImageStabilizationScene:firingKVO:", 0, 1);
    v9 = *MEMORY[0x1E0D04E70];
    v17[0] = *MEMORY[0x1E0D04E78];
    v17[1] = v9;
    v18[0] = &unk_1E424D260;
    v18[1] = MEMORY[0x1E0C9AA70];
    -[AVCapturePhotoOutput _setDigitalFlashScene:fireStatusKVO:fireExposureTimesKVO:](self, "_setDigitalFlashScene:fireStatusKVO:fireExposureTimesKVO:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2), 1, 1);
  }
}

- (id)supportedDigitalFlashModes
{
  NSObject *sceneDetectionObserversDispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AVCapturePhotoOutput_supportedDigitalFlashModes__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)supportedHDRModes
{
  NSObject *sceneDetectionObserversDispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AVCapturePhotoOutput_supportedHDRModes__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)supportedFlashModes
{
  NSObject *sceneDetectionObserversDispatchQueue;
  NSArray *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVCapturePhotoOutput_supportedFlashModes__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v5);
  v3 = (NSArray *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isStillImageStabilizationSupported
{
  NSObject *sceneDetectionObserversDispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVCapturePhotoOutput__isStillImageStabilizationSupported__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setIsHDRScene:(BOOL)a3 firingKVO:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *sceneDetectionObserversDispatchQueue;
  _QWORD v8[5];
  BOOL v9;

  v4 = a4;
  if (a4)
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isHDRScene"));
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__AVCapturePhotoOutput__setIsHDRScene_firingKVO___block_invoke;
  v8[3] = &unk_1E4217A10;
  v8[4] = self;
  v9 = a3;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v8);
  if (v4)
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isHDRScene"));
}

- (void)_setIsFlashScene:(BOOL)a3 firingKVO:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *sceneDetectionObserversDispatchQueue;
  _QWORD v8[5];
  BOOL v9;

  v4 = a4;
  if (a4)
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFlashScene"));
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__AVCapturePhotoOutput__setIsFlashScene_firingKVO___block_invoke;
  v8[3] = &unk_1E4217A10;
  v8[4] = self;
  v9 = a3;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v8);
  if (v4)
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFlashScene"));
}

- (void)_updateSemanticStyleRenderingSupportedForDevice:(id)a3
{
  int v4;
  AVCapturePhotoOutputInternal *internal;
  _BOOL4 v6;
  AVCapturePhotoOutputInternal *v7;
  _BOOL4 semanticStyleRenderingSupported;
  _BOOL4 semanticStyleRenderingEnabled;
  BOOL v10;

  v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isSemanticStyleRenderingSupported");
  internal = self->_internal;
  if (v4)
    v6 = internal->maxPhotoQualityPrioritization > 1;
  else
    v6 = 0;
  if (internal->semanticStyleRenderingSupported != v6)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyleRenderingSupported"));
    self->_internal->semanticStyleRenderingSupported = v6;
    v7 = self->_internal;
    semanticStyleRenderingSupported = v7->semanticStyleRenderingSupported;
    semanticStyleRenderingEnabled = v7->semanticStyleRenderingEnabled;
    if (semanticStyleRenderingSupported)
    {
      if (!semanticStyleRenderingEnabled)
      {
        v10 = 1;
LABEL_10:
        -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyleRenderingEnabled"));
        self->_internal->semanticStyleRenderingEnabled = v10;
        -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyleRenderingEnabled"));
      }
    }
    else if (semanticStyleRenderingEnabled)
    {
      v10 = 0;
      goto LABEL_10;
    }
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyleRenderingSupported"));
  }
}

- (id)_figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:(id)a3 captureRequestIdentifier:(id)a4 delegate:(id)a5 connections:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  $2825F4736939C4A6D3AD43837233062D v26;
  unint64_t v27;
  int v28;
  AVCapturePhotoOutput *v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  int v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _BOOL4 v46;
  _BOOL4 v47;
  double height;
  double v49;
  double v50;
  int v51;
  double v52;
  double v53;
  double v54;
  int v55;
  double v56;
  double v57;
  double width;
  float v59;
  float v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  float v64;
  float v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  int v73;
  double v74;
  double v75;
  _BOOL4 v76;
  double v77;
  double v78;
  int v79;
  double v80;
  double v81;
  float v82;
  float v83;
  float v84;
  float v85;
  uint64_t v86;
  _QWORD *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  int v99;
  double v100;
  double v101;
  _BOOL4 v102;
  double v103;
  double v104;
  float v105;
  float v106;
  uint64_t v107;
  uint64_t v108;
  double v109;
  float v110;
  float v111;
  double v112;
  uint64_t v113;
  void *v114;
  char v115;
  id v116;
  char v117;
  char v118;
  void *v119;
  int v120;
  int v121;
  int v122;
  double v123;
  double v124;
  uint64_t IntegerAnswer;
  void *v126;
  char isKindOfClass;
  char v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  int v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  void *v143;
  uint64_t v145;
  uint64_t v146;
  id v147;
  AVCapturePhotoOutput *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  __int128 v154;
  uint64_t v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint64_t v160;
  CMTime v161;
  CMTime v162;
  __int128 v163;
  uint64_t v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _BYTE v169[128];
  _QWORD v170[2];
  _QWORD v171[2];
  _BYTE v172[128];
  uint64_t v173;
  CGSize v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;

  v7 = v6;
  v173 = *MEMORY[0x1E0C80C00];
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D03BC8]), "initWithSettingsID:captureRequestIdentifier:", objc_msgSend(a3, "uniqueID"), a4);
  v149 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  objc_msgSend(v11, "setClientQualityPrioritization:", objc_msgSend(a3, "photoQualityPrioritization"));
  v147 = -[AVCapturePhotoOutput _sanitizedSettingsForSettings:](self, "_sanitizedSettingsForSettings:", a3);
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v12 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v165, v172, 16);
  v153 = v11;
  v148 = self;
  if (!v12)
  {
    v151 = 0;
LABEL_19:
    v146 = v7;
    LODWORD(v145) = 0;
    FigDebugAssert3();
    v23 = 0;
    goto LABEL_20;
  }
  v13 = v12;
  v151 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v166;
  v16 = *MEMORY[0x1E0CF2B90];
  v17 = *MEMORY[0x1E0CF2B68];
  v18 = *MEMORY[0x1E0CF2B78];
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v166 != v15)
        objc_enumerationMutation(a6);
      v20 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * i);
      v21 = (void *)objc_msgSend((id)objc_msgSend(v20, "inputPorts"), "firstObject");
      if (objc_msgSend(v20, "isEnabled") && objc_msgSend(v21, "isEnabled"))
      {
        v22 = (void *)objc_msgSend(v21, "mediaType");
        if ((objc_msgSend(v22, "isEqual:", v16) & 1) != 0)
        {
          v14 = v20;
        }
        else if ((objc_msgSend(v22, "isEqual:", v17) & 1) != 0)
        {
          v151 = v20;
        }
        else if (objc_msgSend(v22, "isEqual:", v18))
        {
          objc_msgSend(v149, "addObject:", v20);
        }
      }
    }
    v13 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v165, v172, 16);
  }
  while (v13);
  v11 = v153;
  self = v148;
  v7 = v6;
  v23 = v14;
  if (!v14)
    goto LABEL_19;
LABEL_20:
  v150 = v23;
  if (objc_msgSend(v147, "livePhotoMovieFileURL", v145, v146))
  {
    objc_msgSend(v11, "setMovieMode:", 1);
    v24 = objc_alloc_init(MEMORY[0x1E0D03BE0]);
    objc_msgSend(v24, "setSettingsID:", objc_msgSend(v147, "uniqueID"));
    objc_msgSend(v24, "setIrisRecording:", 1);
    objc_msgSend(v24, "setOutputURL:", objc_msgSend(v147, "livePhotoMovieFileURL"));
    v25 = *MEMORY[0x1E0CF2B08];
    objc_msgSend(v24, "setOutputFileType:", *MEMORY[0x1E0CF2B08]);
    v163 = *MEMORY[0x1E0CA2E18];
    v164 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    objc_msgSend(v24, "setMaxDuration:", &v163);
    objc_msgSend(v24, "setMaxFileSize:", 0);
    objc_msgSend(v24, "setMinFreeDiskSpaceLimit:", 0);
    v26 = -[AVCapturePhotoOutput livePhotoMovieDimensions](self, "livePhotoMovieDimensions");
    v27 = HIDWORD(*(unint64_t *)&v26);
    v170[0] = *MEMORY[0x1E0CA90E0];
    v171[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26);
    v170[1] = *MEMORY[0x1E0CA8FD8];
    v171[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
    objc_msgSend(v24, "setVideoSettings:", -[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v23, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v171, v170, 2), objc_msgSend(v147, "livePhotoVideoCodecType"), v25, 1, 0));
    objc_msgSend(v24, "setVideoMirrored:", objc_msgSend(v23, "isVideoMirrored"));
    objc_msgSend(v24, "setVideoOrientation:", objc_msgSend(v23, "_videoOrientation"));
    objc_msgSend(v24, "setRecordVideoOrientationAndMirroringChanges:", 1);
    v28 = objc_msgSend(v23, "isDebugMetadataSidecarFileEnabled");
    if (v28)
      LOBYTE(v28) = objc_opt_respondsToSelector();
    objc_msgSend(v24, "setDebugMetadataSidecarFileEnabled:", v28 & 1);
    objc_msgSend(v24, "setMetadataIdentifiersEnabled:", objc_opt_respondsToSelector() & 1);
    objc_msgSend(v24, "setSendPreviewIOSurface:", 0);
    if (v151)
      objc_msgSend(v24, "setAudioSettings:", -[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v151, 0, 0, *MEMORY[0x1E0CF2B18], 1, 0));
    CMTimeMake(&v162, 1, 1);
    v161 = v162;
    objc_msgSend(v24, "setMovieFragmentInterval:", &v161);
    objc_msgSend(v24, "setMovieLevelMetadata:", objc_msgSend(MEMORY[0x1E0CF2D28], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(v147, "livePhotoMovieMetadata")));
    if (objc_msgSend(v147, "isAutoSpatialOverCaptureEnabled"))
    {
      objc_msgSend(v24, "setSpatialOverCaptureMovieURL:", objc_msgSend(v147, "spatialOverCaptureLivePhotoMovieFileURL"));
      objc_msgSend(v24, "setSpatialOverCaptureMovieLevelMetadata:", objc_msgSend(MEMORY[0x1E0CF2D28], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(v147, "spatialOverCaptureLivePhotoMovieMetadata")));
    }
    objc_msgSend(v11, "setMovieRecordingSettings:", v24);
  }
  objc_msgSend(v11, "setSettingsProvider:", 1);
  objc_msgSend(v11, "setPayloadType:", objc_opt_respondsToSelector() & 1);
  objc_msgSend(v11, "setOutputFormat:", objc_msgSend(v147, "formatFourCC"));
  objc_msgSend(v11, "setOutputFileType:", po_figCaptureStillImageSettingsFileTypeForAVFileType((void *)objc_msgSend(v147, "processedFileType")));
  objc_msgSend(v11, "setRawOutputFormat:", -[AVCapturePhotoOutput _internalRawFormatFromRawFormat:](self, "_internalRawFormatFromRawFormat:", objc_msgSend(v147, "rawPhotoPixelFormatType")));
  objc_msgSend(v11, "setRawOutputFileType:", po_figCaptureStillImageSettingsFileTypeForAVFileType((void *)objc_msgSend(v147, "rawFileType")));
  v152 = (void *)objc_msgSend(v23, "sourceDevice");
  v29 = self;
  v30 = (void *)objc_msgSend(v152, "activeFormat");
  v160 = 0;
  v31 = po_requestingDefaultHighResStillForAVCapturePhotoSettings(v147, v30, &v160);
  v32 = v160;
  v33 = HIDWORD(v160);
  if ((v31 & 1) != 0)
  {
    v34 = 0;
    v35 = 0;
  }
  else if (v29->_internal->optimizesImagesForOfflineVideoStabilization)
  {
    v35 = -[AVCapturePhotoOutput optimizedImageDimensionsForOfflineStabilization](v29, "optimizedImageDimensionsForOfflineStabilization");
    v34 = HIDWORD(v35);
  }
  else
  {
    v34 = HIDWORD(v160);
    v35 = v160;
  }
  objc_msgSend(v11, "setSquareCropEnabled:", objc_msgSend(v147, "isSquareCropEnabled"));
  objc_msgSend(v11, "setOutputWidth:", v35);
  objc_msgSend(v11, "setOutputHeight:", v34);
  v36 = (void *)objc_msgSend(v147, "format");
  objc_msgSend(v11, "setVtCompressionProperties:", objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C98]));
  v37 = -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](v148, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice");
  objc_msgSend(v11, "setDeferredSourceDeviceType:", objc_msgSend(v37, "figCaptureSourceDeviceType"));
  objc_msgSend(v11, "setDeferredSourcePosition:", objc_msgSend(v37, "figCaptureSourcePosition"));
  objc_msgSend(v11, "setDeferredVideoFormatUniqueID:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "activeFormat"), "figCaptureSourceVideoFormat"), "uniqueID"));
  if (-[AVCapturePhotoOutput isDepthDataDeliverySupported](v148, "isDepthDataDeliverySupported")
    && -[AVCapturePhotoOutput isDepthDataDeliveryEnabled](v148, "isDepthDataDeliveryEnabled"))
  {
    objc_msgSend(v11, "setDeferredDepthDataFormatUniqueID:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "activeDepthDataFormat"), "figCaptureSourceDepthDataFormat"), "uniqueID"));
  }
  v38 = (double)v32;
  v39 = (double)v33;
  objc_msgSend(v11, "setOutputMirroring:", objc_msgSend(v23, "isVideoMirrored"));
  objc_msgSend(v11, "setOutputOrientation:", objc_msgSend(v23, "_videoOrientation"));
  objc_msgSend(v11, "setPreviewEnabled:", objc_msgSend(v147, "previewFormatFourCC") != 0);
  v40 = objc_msgSend(v11, "previewEnabled");
  v41 = (double *)MEMORY[0x1E0C9D820];
  if (v40)
  {
    v42 = (double)objc_msgSend(v11, "outputWidth");
    v43 = (double)objc_msgSend(v11, "outputHeight");
    objc_msgSend(v147, "previewCGSize");
    v46 = v44 == *v41;
    v47 = v45 == v41[1];
    if (v46 && v47)
      height = 640.0;
    else
      height = v45;
    if (v46 && v47)
      v49 = 852.0;
    else
      v49 = v44;
    if (v31)
    {
      v43 = (double)v33;
      v50 = (double)v32;
    }
    else
    {
      v50 = v42;
    }
    v51 = objc_msgSend(v147, "isSquareCropEnabled");
    if (v50 >= v43)
      v52 = v43;
    else
      v52 = v50;
    if (v51)
      v53 = v52;
    else
      v53 = v43;
    if (v51)
      v54 = v52;
    else
      v54 = v50;
    v55 = objc_msgSend(v147, "arePreviewPhotoFormatDimensionsLimitedToDisplayDimensions");
    v56 = v53;
    v57 = v54;
    if (v55)
      v56 = AVCaptureMainScreenPixelSize();
    if (v49 <= v57)
      width = v49;
    else
      width = v57;
    if (height > v56)
      height = v56;
    v59 = v54 / v53;
    v60 = width / height;
    if (vabds_f32(v59, v60) >= 0.01)
    {
      v61 = 0;
      v62 = 0;
      v174.width = v54;
      v174.height = v53;
      v63 = height;
      v175 = AVMakeRectWithAspectRatioInsideRect(v174, *(CGRect *)(&width - 2));
      width = v175.size.width;
      height = v175.size.height;
    }
    v64 = width * 0.5;
    objc_msgSend(v11, "setPreviewWidth:", 2 * llroundf(v64));
    v65 = height * 0.5;
    objc_msgSend(v11, "setPreviewHeight:", 2 * llroundf(v65));
    objc_msgSend(v11, "setPreviewFormat:", objc_msgSend(v147, "previewFormatFourCC"));
    objc_msgSend(v11, "setPreviewMirroring:", objc_msgSend(v11, "outputMirroring"));
    objc_msgSend(v11, "setPreviewOrientation:", objc_msgSend(v11, "outputOrientation"));
  }
  objc_msgSend(v11, "setThumbnailEnabled:", objc_msgSend(v147, "embeddedThumbnailFormatFourCC") != 0);
  if (objc_msgSend(v11, "thumbnailEnabled"))
  {
    v66 = (double)objc_msgSend(v11, "outputWidth");
    v67 = (double)objc_msgSend(v11, "outputHeight");
    objc_msgSend(v147, "embeddedThumbnailCGSize");
    v70 = v69;
    v71 = v68;
    if (v69 == *v41
      && v68 == v41[1]
      && (objc_msgSend(v11, "outputFileType") == 1785096550
       || objc_msgSend(v11, "outputFileType") == 1953064550))
    {
      v70 = 160.0;
      v71 = 160.0;
    }
    if (v31)
    {
      v67 = (double)v33;
      v72 = (double)v32;
    }
    else
    {
      v72 = v66;
    }
    if (objc_msgSend(v11, "outputFileType") == 1785096550
      || (v73 = objc_msgSend(v11, "outputFileType"), v74 = v72, v75 = v67, v73 == 1953064550))
    {
      v74 = 160.0;
      v75 = 160.0;
    }
    v76 = v70 > v74;
    if (v71 > v75)
      v76 = 1;
    if (v76)
      v77 = v74;
    else
      v77 = v70;
    if (v76)
      v78 = v75;
    else
      v78 = v71;
    v79 = objc_msgSend(v147, "isSquareCropEnabled");
    if (v72 >= v67)
      v80 = v67;
    else
      v80 = v72;
    if (v79)
      v81 = v80;
    else
      v81 = v67;
    if (!v79)
      v80 = v72;
    v82 = v80 / v81;
    v83 = v77 / v78;
    if (vabds_f32(v82, v83) >= 0.01)
    {
      v178.origin.x = 0.0;
      v178.origin.y = 0.0;
      v178.size.width = v77;
      v178.size.height = v78;
      v176 = AVMakeRectWithAspectRatioInsideRect(*(CGSize *)&v80, v178);
      v77 = v176.size.width;
      v78 = v176.size.height;
    }
    v84 = v77 * 0.5;
    objc_msgSend(v11, "setThumbnailWidth:", 2 * llroundf(v84));
    v85 = v78 * 0.5;
    objc_msgSend(v11, "setThumbnailHeight:", 2 * llroundf(v85));
    objc_msgSend(v11, "setThumbnailFormat:", objc_msgSend(v147, "embeddedThumbnailFormatFourCC"));
  }
  v86 = objc_msgSend(v147, "rawFileFormat");
  v87 = (_QWORD *)MEMORY[0x1E0CF2C58];
  if (v86)
  {
    v88 = (void *)objc_msgSend(v147, "rawFileFormat");
    v89 = (void *)objc_msgSend(v88, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C40]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v11, "setRawOutputFileBitDepth:", objc_msgSend(v89, "unsignedIntValue"));
    if (objc_msgSend((id)objc_msgSend(v147, "rawFileFormat"), "objectForKeyedSubscript:", *v87))
      objc_msgSend(v11, "setRawOutputFileCodec:", AVOSTypeForString());
    v90 = (void *)objc_msgSend(v147, "rawFileFormat");
    v91 = (void *)objc_msgSend(v90, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2CE0]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v91, "floatValue");
      objc_msgSend(v11, "setRawOutputFileCodecQuality:");
    }
  }
  objc_msgSend(v11, "setRawThumbnailEnabled:", objc_msgSend(v147, "rawEmbeddedThumbnailFormatFourCC") != 0);
  if (objc_msgSend(v11, "rawThumbnailEnabled"))
  {
    v92 = (double)objc_msgSend(v11, "outputWidth");
    v93 = (double)objc_msgSend(v11, "outputHeight");
    objc_msgSend(v147, "rawEmbeddedThumbnailCGSize");
    v96 = v95;
    v97 = v94;
    if (v95 == *v41 && v94 == v41[1] && objc_msgSend(v11, "rawOutputFileType") == 1684956519)
    {
      v96 = 320.0;
      v97 = 320.0;
    }
    if (v31)
    {
      v92 = v38;
      v98 = v39;
    }
    else
    {
      v98 = v93;
    }
    v99 = objc_msgSend(v147, "isSquareCropEnabled");
    if (v92 >= v98)
      v100 = v98;
    else
      v100 = v92;
    if (v99)
      v101 = v100;
    else
      v101 = v92;
    if (!v99)
      v100 = v98;
    v102 = v96 > v101;
    if (v97 > v100)
      v102 = 1;
    if (v102)
      v103 = v101;
    else
      v103 = v96;
    if (v102)
      v104 = v100;
    else
      v104 = v97;
    v105 = v101 / v100;
    v106 = v103 / v104;
    if (vabds_f32(v105, v106) >= 0.01)
    {
      v107 = 0;
      v108 = 0;
      v109 = v104;
      v177 = AVMakeRectWithAspectRatioInsideRect(*(CGSize *)(&v100 - 1), *(CGRect *)(&v103 - 2));
      v103 = v177.size.width;
      v104 = v177.size.height;
    }
    v110 = v103 * 0.5;
    objc_msgSend(v11, "setRawThumbnailWidth:", 2 * llroundf(v110));
    v111 = v104 * 0.5;
    objc_msgSend(v11, "setRawThumbnailHeight:", 2 * llroundf(v111));
    objc_msgSend(v11, "setRawThumbnailFormat:", objc_msgSend(v147, "rawEmbeddedThumbnailFormatFourCC"));
  }
  objc_msgSend(v11, "setNoiseReductionEnabled:", objc_msgSend(v147, "isTurboModeEnabled") ^ 1);
  objc_msgSend(v11, "setBurstQualityCaptureEnabled:", objc_msgSend(v147, "isBurstQualityCaptureEnabled"));
  objc_msgSend(v23, "videoScaleAndCropFactor");
  *(float *)&v112 = v112;
  objc_msgSend(v11, "setScaleFactor:", v112);
  objc_msgSend(v11, "setShutterSound:", objc_msgSend(v147, "shutterSound"));
  objc_msgSend(v11, "setFlashMode:", objc_msgSend(v147, "flashMode"));
  objc_msgSend(v11, "setAutoRedEyeReductionEnabled:", objc_msgSend(v147, "isAutoRedEyeReductionEnabled"));
  objc_msgSend(v11, "setDigitalFlashMode:", objc_msgSend(v147, "digitalFlashMode"));
  objc_msgSend(v11, "setConstantColorEnabled:", objc_msgSend(v147, "isConstantColorEnabled"));
  objc_msgSend(v11, "setConstantColorFallbackPhotoDeliveryEnabled:", objc_msgSend(v147, "isConstantColorFallbackPhotoDeliveryEnabled"));
  objc_msgSend(v11, "setAutoStereoPhotoCaptureEnabled:", objc_msgSend(v147, "isAutoSpatialPhotoCaptureEnabled"));
  objc_msgSend(v11, "setWideColorMode:", 2);
  objc_msgSend(v11, "setProvidesOriginalImage:", objc_msgSend(v147, "isEV0PhotoDeliveryEnabled"));
  objc_msgSend(v11, "setHDRMode:", objc_msgSend(v147, "HDRMode"));
  if (objc_msgSend(v30, "videoHDRFlavor") == 2
    && (objc_msgSend(v147, "photoQualityPrioritization") > 1 || objc_msgSend(v147, "HDRMode")))
  {
    if (objc_msgSend(v152, "isVideoHDREnabled"))
    {
      if (objc_msgSend(v152, "isVideoHDRSuspended"))
        v113 = 0;
      else
        v113 = 2;
    }
    else
    {
      v113 = 0;
    }
    objc_msgSend(v11, "setHDRMode:", v113);
  }
  objc_msgSend(v11, "setDepthDataDeliveryEnabled:", objc_msgSend(v147, "isDepthDataDeliveryEnabled"));
  objc_msgSend(v11, "setEmbedsDepthDataInImage:", objc_msgSend(v147, "embedsDepthDataInPhoto"));
  objc_msgSend(v11, "setDepthDataFiltered:", objc_msgSend(v147, "isDepthDataFiltered"));
  objc_msgSend(v11, "setCameraCalibrationDataDeliveryEnabled:", objc_msgSend(v147, "isCameraCalibrationDataDeliveryEnabled"));
  objc_msgSend(v11, "setPortraitEffectsMatteDeliveryEnabled:", objc_msgSend(v147, "isPortraitEffectsMatteDeliveryEnabled"));
  objc_msgSend(v11, "setEmbedsPortraitEffectsMatteInImage:", objc_msgSend(v147, "embedsPortraitEffectsMatteInPhoto"));
  if (objc_msgSend((id)objc_msgSend(v147, "enabledSemanticSegmentationMatteTypes"), "count"))
  {
    objc_msgSend(v11, "setEnabledSemanticSegmentationMatteURNs:", AVSemanticSegmentationCMPhotoURNsForMatteTypes((void *)objc_msgSend(v147, "enabledSemanticSegmentationMatteTypes")));
    objc_msgSend(v11, "setEmbedsSemanticSegmentationMattesInImage:", objc_msgSend(v147, "embedsSemanticSegmentationMattesInPhoto"));
  }
  if (objc_msgSend(v147, "isDepthDataDeliveryEnabled")
    && AVCIFilterArrayContainsPortraitFilters((void *)objc_msgSend(v147, "adjustedPhotoFilters")))
  {
    v114 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "inputPorts"), "firstObject"), "input");
    objc_msgSend(v114, "simulatedAperture");
    objc_msgSend(v11, "setSimulatedAperture:");
    objc_msgSend(v114, "portraitLightingEffectStrength");
    objc_msgSend(v11, "setPortraitLightingEffectStrength:");
  }
  objc_msgSend(v11, "setMetadata:", objc_msgSend(v147, "metadata"));
  objc_msgSend(v11, "setMetadataForOriginalImage:", objc_msgSend(v147, "metadataForOriginalPhoto"));
  objc_msgSend(v11, "setOriginalImageFilters:", objc_msgSend(v147, "photoFilters"));
  objc_msgSend(v11, "setProcessedImageFilters:", objc_msgSend(v147, "adjustedPhotoFilters"));
  if (objc_msgSend(v147, "isAutoSpatialOverCaptureEnabled"))
  {
    objc_msgSend(v11, "setSpatialOverCaptureMetadata:", objc_msgSend(v147, "spatialOverCaptureMetadata"));
    if (objc_msgSend(v11, "providesOriginalImage"))
      objc_msgSend(v11, "setSpatialOverCaptureMetadataForOriginalImage:", objc_msgSend(v147, "spatialOverCaptureMetadataForOriginalPhoto"));
  }
  if (objc_msgSend(v11, "providesOriginalImage"))
  {
    if (objc_msgSend(v147, "livePhotoMovieFileURL"))
    {
      objc_msgSend(v11, "setMovieURLForOriginalImage:", objc_msgSend(v147, "livePhotoMovieFileURLForOriginalPhoto"));
      objc_msgSend(v11, "setMovieLevelMetadataForOriginalImage:", objc_msgSend(MEMORY[0x1E0CF2D28], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(v147, "livePhotoMovieMetadataForOriginalPhoto")));
      if (objc_msgSend(v147, "isAutoSpatialOverCaptureEnabled"))
      {
        objc_msgSend(v11, "setSpatialOverCaptureMovieURLForOriginalImage:", objc_msgSend(v147, "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"));
        objc_msgSend(v11, "setSpatialOverCaptureMovieLevelMetadataForOriginalImage:", objc_msgSend(MEMORY[0x1E0CF2D28], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(v147, "spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto")));
      }
    }
  }
  objc_msgSend(v11, "setAutoDeferredProcessingEnabled:", -[AVCapturePhotoOutput isAutoDeferredPhotoDeliveryEnabled](v148, "isAutoDeferredPhotoDeliveryEnabled"));
  objc_msgSend(v11, "setQualityPrioritization:", objc_msgSend(v147, "photoQualityPrioritization"));
  if (objc_msgSend(v147, "isAutoVirtualDeviceFusionEnabled"))
    objc_msgSend(v11, "setBravoImageFusionMode:", 2);
  objc_msgSend(v11, "setBravoConstituentImageDeliveryDeviceTypes:", po_deviceArrayToFigCaptureSourceDeviceTypesArray((void *)objc_msgSend(v147, "virtualDeviceConstituentPhotoDeliveryEnabledDevices")));
  objc_msgSend(v11, "setZoomWithoutUpscalingEnabled:", objc_msgSend(v147, "isProcessedPhotoZoomWithoutUpscalingEnabled"));
  objc_msgSend(v11, "setAutoIntelligentDistortionCorrectionEnabled:", objc_msgSend(v147, "isAutoContentAwareDistortionCorrectionEnabled"));
  v115 = objc_msgSend(v147, "isConstantColorEnabled");
  v116 = (id)objc_msgSend(v147, "semanticStyle");
  if (-[AVCapturePhotoOutput isSemanticStyleRenderingEnabled](v148, "isSemanticStyleRenderingEnabled") && !v116)
  {
    if ((objc_msgSend(v147, "isBurstQualityCaptureEnabled") & 1) != 0)
      goto LABEL_167;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_167;
    v117 = objc_msgSend(v147, "photoQualityPrioritization") < 2 ? 1 : v115;
    if ((v117 & 1) != 0)
      goto LABEL_167;
    v116 = +[AVSemanticStyle identityStyle](AVSemanticStyle, "identityStyle");
  }
  if (v116)
    v118 = v115;
  else
    v118 = 1;
  if ((v118 & 1) == 0)
  {
    v119 = (void *)MEMORY[0x1E0D03BF8];
    objc_msgSend(v116, "toneBias");
    v121 = v120;
    objc_msgSend(v116, "warmthBias");
    LODWORD(v123) = v122;
    LODWORD(v124) = v121;
    objc_msgSend(v11, "setSemanticStyle:", objc_msgSend(v119, "semanticStyleWithToneBias:warmthBias:", v124, v123));
  }
LABEL_167:
  IntegerAnswer = AVGestaltGetIntegerAnswer((uint64_t)CFSTR("AVGQGYSWMQKMTMQOUYQ2AKUCKEN6AA"));
  if (objc_msgSend((id)objc_msgSend(v11, "semanticStyle"), "isIdentity")
    && (unint64_t)(IntegerAnswer - 1) <= 0x7FFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(v11, "setSemanticStyle:", 0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v126 = (void *)objc_msgSend(v147, "bracketedSettings");
    objc_msgSend(v153, "setLensStabilizationDuringBracketEnabled:", objc_msgSend(v147, "isLensStabilizationEnabled"));
    objc_msgSend(v126, "firstObject");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v128 = 0;
      v129 = 1;
    }
    else
    {
      objc_msgSend(v126, "firstObject");
      objc_opt_class();
      v128 = objc_opt_isKindOfClass();
      v129 = (v128 & 1) != 0 ? 2 : 0;
    }
    objc_msgSend(v153, "setBracketType:imageCount:", v129, objc_msgSend(v126, "count"));
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v130 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v156, v169, 16);
    if (v130)
    {
      v131 = v130;
      v132 = 0;
      v133 = *(_QWORD *)v157;
      do
      {
        v134 = 0;
        v135 = 24 * v132;
        do
        {
          if (*(_QWORD *)v157 != v133)
            objc_enumerationMutation(v126);
          v136 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * v134);
          if ((isKindOfClass & 1) != 0)
          {
            v137 = objc_msgSend(v153, "exposureDurations");
            if (v136)
            {
              objc_msgSend(v136, "exposureDuration");
            }
            else
            {
              v154 = 0uLL;
              v155 = 0;
            }
            v141 = v137 + v135;
            *(_QWORD *)(v141 + 16) = v155;
            *(_OWORD *)v141 = v154;
            objc_msgSend(v136, "ISO");
            v139 = v142;
            v140 = objc_msgSend(v153, "ISOs");
          }
          else
          {
            if ((v128 & 1) == 0)
              goto LABEL_189;
            objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * v134), "exposureTargetBias");
            v139 = v138;
            v140 = objc_msgSend(v153, "exposureTargetBiases");
          }
          *(_DWORD *)(v140 + 4 * v132) = v139;
LABEL_189:
          ++v132;
          ++v134;
          v135 += 24;
        }
        while (v131 != v134);
        v131 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v156, v169, 16);
      }
      while (v131);
    }
  }
  if (objc_msgSend((id)objc_msgSend(v152, "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeContinuityCamera")))
  {
    v143 = (void *)objc_msgSend(v147, "format");
    objc_msgSend(v153, "setCmioCompressedFormat:", objc_msgSend(v143, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]));
    objc_msgSend(v153, "setCmioHighResolutionPhotoEnabled:", objc_msgSend(v147, "isHighResolutionPhotoEnabled"));
    objc_msgSend(v153, "setCmioMaxPhotoDimensionsWidth:", objc_msgSend(v147, "maxPhotoDimensions"));
    objc_msgSend(v153, "setCmioMaxPhotoDimensionsHeight:", (unint64_t)objc_msgSend(v147, "maxPhotoDimensions") >> 32);
  }
  objc_msgSend(v153, "setStillImageUserInitiatedRequestTime:", objc_msgSend(v147, "userInitiatedPhotoRequestTime"));
  objc_msgSend(v153, "setDeviceOrientationCorrectionEnabled:", objc_msgSend(v150, "isVideoDeviceOrientationCorrectionEnabled"));
  return v153;
}

- (void)_updateSupportedHDRModesForSourceDevice:(id)a3
{
  uint64_t v5;
  void *v6;
  NSObject *sceneDetectionObserversDispatchQueue;
  int v8;
  char v9;
  NSObject *v10;
  _QWORD v11[5];
  char v12;
  _QWORD block[6];

  v5 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "videoHDRFlavor");
  if (!objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isHDRSupported")
    || (v6 = &unk_1E424DA20, objc_msgSend(a3, "isVideoHDREnabled")) && v5 != 2)
  {
    v6 = &unk_1E424DA38;
  }
  if ((objc_msgSend(v6, "isEqual:", self->_internal->supportedHDRModes) & 1) == 0)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("supportedHDRModes"));
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("HDRSupported"));
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__AVCapturePhotoOutput__updateSupportedHDRModesForSourceDevice___block_invoke;
    block[3] = &unk_1E4216408;
    block[4] = self;
    block[5] = v6;
    dispatch_sync(sceneDetectionObserversDispatchQueue, block);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("HDRSupported"));
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("supportedHDRModes"));
  }
  v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "figCaptureSourceVideoFormat"), "isHDROriginalImageDeliverySupported");
  if (self->_internal->EV0PhotoDeliverySupported != v8)
  {
    v9 = v8;
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("EV0PhotoDeliverySupported"));
    v10 = self->_internal->sceneDetectionObserversDispatchQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__AVCapturePhotoOutput__updateSupportedHDRModesForSourceDevice___block_invoke_2;
    v11[3] = &unk_1E4217A10;
    v11[4] = self;
    v12 = v9;
    dispatch_sync(v10, v11);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("EV0PhotoDeliverySupported"));
  }
}

- (BOOL)isDepthDataDeliverySupported
{
  return self->_internal->depthDataDeliverySupported;
}

- (id)deferredSettingsForCapturingPhotoWithSettings:(id)a3
{
  id v4;

  v4 = -[AVCapturePhotoOutput _figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:captureRequestIdentifier:delegate:connections:](self, "_figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:captureRequestIdentifier:delegate:connections:", a3, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), 0, -[AVCaptureOutput connections](self, "connections"));
  objc_msgSend(v4, "setDepthDataDeliveryEnabled:", self->_internal->depthDataDeliveryEnabled);
  objc_msgSend(v4, "setEmbedsDepthDataInImage:", objc_msgSend(v4, "depthDataDeliveryEnabled"));
  objc_msgSend(v4, "setPortraitEffectsMatteDeliveryEnabled:", self->_internal->portraitEffectsMatteDeliveryEnabled);
  objc_msgSend(v4, "setEmbedsPortraitEffectsMatteInImage:", objc_msgSend(v4, "portraitEffectsMatteDeliveryEnabled"));
  objc_msgSend(v4, "setEnabledSemanticSegmentationMatteURNs:", AVSemanticSegmentationCMPhotoURNsForMatteTypes(-[AVCapturePhotoOutput enabledSemanticSegmentationMatteTypes](self, "enabledSemanticSegmentationMatteTypes")));
  objc_msgSend(v4, "setEmbedsSemanticSegmentationMattesInImage:", objc_msgSend((id)objc_msgSend(v4, "enabledSemanticSegmentationMatteURNs"), "count") != 0);
  return -[AVCaptureDeferredPhotoSettings _initWithCaptureSettings:serializedProcessingSettings:]([AVCaptureDeferredPhotoSettings alloc], "_initWithCaptureSettings:serializedProcessingSettings:", v4, objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "serializedProcessingSettings"));
}

- (unsigned)_internalRawFormatFromRawFormat:(unsigned int)a3
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_internal->availableRawPhotoPixelFormatTypes, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3)), "intValue");
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("highResolutionCaptureEnabled")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("maxPhotoDimensions")) & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AVCapturePhotoOutput;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (BOOL)isSemanticStyleRenderingSupported
{
  return self->_internal->semanticStyleRenderingSupported;
}

- (BOOL)isPortraitEffectsMatteDeliverySupported
{
  return self->_internal->portraitEffectsMatteDeliverySupported;
}

uint64_t __58__AVCapturePhotoOutput__incrementObserverCountForKeyPath___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 40))
  {
    v1 = 272;
  }
  else if (*(_BYTE *)(result + 41))
  {
    v1 = 276;
  }
  else if (*(_BYTE *)(result + 42))
  {
    v1 = 280;
  }
  else if (*(_BYTE *)(result + 43))
  {
    v1 = 288;
  }
  else
  {
    if (!*(_BYTE *)(result + 44))
      return result;
    v1 = 304;
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16) + v1);
  return result;
}

- (void)setLivePhotoCaptureEnabled:(BOOL)livePhotoCaptureEnabled
{
  _BOOL4 v3;
  AVCapturePhotoOutputInternal *internal;
  void *v6;

  v3 = livePhotoCaptureEnabled;
  if (livePhotoCaptureEnabled
    && !-[AVCapturePhotoOutput isLivePhotoCaptureSupported](self, "isLivePhotoCaptureSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->livePhotoCaptureEnabled != v3)
    {
      internal->livePhotoCaptureEnabled = v3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  int v10;
  int v11;
  AVCapturePhotoOutputInternal *internal;
  int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *sceneDetectionObserversDispatchQueue;
  int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  void *v30;
  int v31;
  unsigned int v32;
  NSObject *v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  int v38;
  int v39;
  char v40;
  _QWORD v41[7];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _QWORD v46[6];
  _QWORD v47[6];
  _QWORD block[6];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;

  if ((void *)AVCapturePhotoOutputDeviceVideoHDREnabledChangedContext == a6)
  {
    -[AVCapturePhotoOutput _updateSupportedHDRModesForSourceDevice:](self, "_updateSupportedHDRModesForSourceDevice:", -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90], a4, a5), "sourceDevice"));
    return;
  }
  if ((void *)AVCapturePhotoOutputSessionOutputsChangedContext == a6
    || AVCapturePhotoOutputSessionPresetChangedContext == (_QWORD)a6)
  {
    v8 = -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90], a4, a5), "sourceDevice");
    -[AVCapturePhotoOutput _updateLivePhotoCaptureSupportedForSourceDevice:](self, "_updateLivePhotoCaptureSupportedForSourceDevice:", v8);
    -[AVCapturePhotoOutput _updateLivePhotoMovieDimensionsForSourceDevice:](self, "_updateLivePhotoMovieDimensionsForSourceDevice:", v8);
    -[AVCapturePhotoOutput _updateAvailableLivePhotoVideoCodecTypesForSourceDevice:](self, "_updateAvailableLivePhotoVideoCodecTypesForSourceDevice:", v8);
    -[AVCapturePhotoOutput _updateAvailableRawPhotoPixelFormatTypesForSourceDevice:](self, "_updateAvailableRawPhotoPixelFormatTypesForSourceDevice:", v8);
    -[AVCapturePhotoOutput _updateAvailableRawPhotoFileTypesForSourceDevice:](self, "_updateAvailableRawPhotoFileTypesForSourceDevice:", v8);
    return;
  }
  if ((void *)AVCapturePhotoOutputSessionIsRunningChangedContext != a6)
  {
    if ((void *)AVCapturePhotoOutputDeviceFlashSceneDetectedForPhotoOutputChangedContext == a6)
    {
      v13 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8], a4), "BOOLValue");
      v14 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
      if (v13 == (_DWORD)v14)
        return;
      v15 = v14;
      v49 = 0;
      v50 = &v49;
      v51 = 0x2020000000;
      v52 = 0;
      sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E4217A60;
      block[4] = self;
      block[5] = &v49;
      dispatch_sync(sceneDetectionObserversDispatchQueue, block);
      -[AVCapturePhotoOutput _setIsFlashScene:firingKVO:](self, "_setIsFlashScene:firingKVO:", v15, *((unsigned __int8 *)v50 + 24));
    }
    else if ((void *)AVCapturePhotoOutputDeviceHDRSceneDetectedForPhotoOutputChangedContext == a6)
    {
      v17 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8], a4), "BOOLValue");
      v18 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
      if (v17 == (_DWORD)v18)
        return;
      v19 = v18;
      v49 = 0;
      v50 = &v49;
      v51 = 0x2020000000;
      v52 = 0;
      v20 = self->_internal->sceneDetectionObserversDispatchQueue;
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v47[3] = &unk_1E4217A60;
      v47[4] = self;
      v47[5] = &v49;
      dispatch_sync(v20, v47);
      -[AVCapturePhotoOutput _setIsHDRScene:firingKVO:](self, "_setIsHDRScene:firingKVO:", v19, *((unsigned __int8 *)v50 + 24));
    }
    else if ((void *)AVCapturePhotoOutputDeviceStillImageStabilizationSceneChangedContext == a6)
    {
      v21 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8], a4), "BOOLValue");
      v22 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
      if (v21 == (_DWORD)v22)
        return;
      v23 = v22;
      v49 = 0;
      v50 = &v49;
      v51 = 0x2020000000;
      v52 = 0;
      v24 = self->_internal->sceneDetectionObserversDispatchQueue;
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
      v46[3] = &unk_1E4217A60;
      v46[4] = self;
      v46[5] = &v49;
      dispatch_sync(v24, v46);
      -[AVCapturePhotoOutput _setIsStillImageStabilizationScene:firingKVO:](self, "_setIsStillImageStabilizationScene:firingKVO:", v23, *((unsigned __int8 *)v50 + 24));
    }
    else
    {
      if ((void *)AVCapturePhotoOutputDeviceDigitalFlashSceneForPhotoOutputChangedContext != a6)
      {
        if ((void *)AVCapturePhotoOutputDeviceImageControlModeChangedContext == a6)
        {
          v37 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC0], a4), "BOOLValue");
          v38 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "intValue");
          v39 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "intValue");
          if (v38 == 5)
            v40 = v37;
          else
            v40 = 0;
          if ((v40 & 1) != 0 || v39 == 6)
            -[AVCapturePhotoOutput _updateTimeLapseCaptureRate](self, "_updateTimeLapseCaptureRate");
        }
        else if ((void *)AVCapturePhotoOutputDeviceSpatialOverCaptureEnabledChangedContext == a6)
        {
          -[AVCapturePhotoOutput _updateLivePhotoMovieDimensionsForSourceDevice:](self, "_updateLivePhotoMovieDimensionsForSourceDevice:", a4);
        }
        else if ((void *)AVCapturePhotoOutputDeviceGDCEnabledChangedContext == a6)
        {
          v10 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8], a4), "BOOLValue");
          if (v10 != objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue"))-[AVCapturePhotoOutput _updateCameraCalibrationDataDeliverySupportedForSourceDevice:](self, "_updateCameraCalibrationDataDeliverySupportedForSourceDevice:", -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"));
        }
        return;
      }
      v25 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8], a4);
      v26 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v27 = *MEMORY[0x1E0D04E78];
      v28 = objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D04E78]), "intValue");
      v29 = *MEMORY[0x1E0D04E70];
      v30 = (void *)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D04E70]);
      v31 = objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", v27), "intValue");
      v32 = objc_msgSend(v30, "isEqualToDictionary:", objc_msgSend(v26, "objectForKeyedSubscript:", v29)) ^ 1;
      if (v28 == v31 && !v32)
        return;
      v49 = 0;
      v50 = &v49;
      v51 = 0x2020000000;
      v52 = 0;
      v42 = 0;
      v43 = &v42;
      v44 = 0x2020000000;
      v45 = 0;
      v33 = self->_internal->sceneDetectionObserversDispatchQueue;
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke_4;
      v41[3] = &unk_1E421D618;
      v41[4] = self;
      v41[5] = &v49;
      v41[6] = &v42;
      dispatch_sync(v33, v41);
      if (*((_BYTE *)v50 + 24))
        v34 = v28 == v31;
      else
        v34 = 1;
      v35 = !v34;
      if (*((_BYTE *)v43 + 24))
        v36 = v32;
      else
        v36 = 0;
      -[AVCapturePhotoOutput _setDigitalFlashScene:fireStatusKVO:fireExposureTimesKVO:](self, "_setDigitalFlashScene:fireStatusKVO:fireExposureTimesKVO:", v26, v35, v36);
      _Block_object_dispose(&v42, 8);
    }
    _Block_object_dispose(&v49, 8);
    return;
  }
  v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8], a4), "BOOLValue");
  MEMORY[0x1A1AF1298](self->_internal->requestsLock);
  internal = self->_internal;
  if (internal->readinessState.sessionIsRunning == v11)
    JUMPOUT(0x1A1AF12A4);
  internal->readinessState.sessionIsRunning = v11;
  MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  -[AVCapturePhotoOutput _updateCaptureReadiness](self, "_updateCaptureReadiness");
}

- (void)_updateAvailableRawPhotoPixelFormatTypesForSourceDevice:(id)a3
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "supportedRawPixelFormat");
  if (objc_msgSend((id)objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"), "isEqualToString:", CFSTR("AVCaptureSessionPresetPhoto")))v7 = (_DWORD)v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6));
  }
  if (-[AVCapturePhotoOutput isAppleProRAWEnabled](self, "isAppleProRAWEnabled")
    && objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isDemosaicedRawSupported"))
  {
    v9 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "internalDemosaicedRawPixelFormat");
    v10 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "supportedDemosaicedRawPixelFormat");
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10));
  }
  if ((objc_msgSend(v5, "isEqual:", self->_internal->availableRawPhotoPixelFormatTypes) & 1) == 0)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableRawPhotoPixelFormatTypes"));

    self->_internal->availableRawPhotoPixelFormatTypes = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v5);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableRawPhotoPixelFormatTypes"));
  }
}

- (void)_updateAvailableLivePhotoVideoCodecTypesForSourceDevice:(id)a3
{
  void *v5;
  void *v6;
  AVCapturePhotoOutputInternal *internal;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "activeFormat");
  if (-[AVCapturePhotoOutput isLivePhotoCaptureSupported](self, "isLivePhotoCaptureSupported")
    && objc_msgSend(v5, "isPhotoFormat"))
  {
    v6 = (void *)objc_opt_class();
    internal = self->_internal;
    v8 = *MEMORY[0x1E0CF2B08];
    v9 = *MEMORY[0x1E0CF2C88];
    v11[0] = *MEMORY[0x1E0CF2C80];
    v11[1] = v9;
    v10 = (void *)objc_msgSend(v6, "availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:", a3, 0, *(_QWORD *)&internal->livePhotoMovieDimensions, v8, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2));
  }
  else
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
  if ((objc_msgSend(v10, "isEqual:", self->_internal->availableLivePhotoVideoCodecTypes) & 1) == 0)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableLivePhotoVideoCodecTypes"));

    self->_internal->availableLivePhotoVideoCodecTypes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v10);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableLivePhotoVideoCodecTypes"));
  }
}

- (void)_updateLivePhotoMovieDimensionsForSourceDevice:(id)a3
{
  void *v4;
  unint64_t Dimensions;
  int32_t v6;
  unint64_t v7;
  uint64_t v8;
  _BOOL4 v10;
  int v11;
  AVCapturePhotoOutputInternal *internal;
  AVCapturePhotoOutputInternal *v13;

  v4 = (void *)objc_msgSend(a3, "activeFormat");
  if (-[AVCapturePhotoOutput isLivePhotoCaptureSupported](self, "isLivePhotoCaptureSupported")
    && objc_msgSend(v4, "isPhotoFormat"))
  {
    Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v4, "formatDescription"));
    v6 = Dimensions;
    v7 = HIDWORD(Dimensions);
    v8 = objc_msgSend((id)objc_opt_class(), "maxLivePhotoMovieDimensions");
    v10 = v6 < (int)v8 || (int)v7 < SHIDWORD(v8);
    if (v10)
      v11 = v6;
    else
      v11 = v8;
    if (!v10)
      LODWORD(v7) = HIDWORD(v8);
  }
  else
  {
    v11 = 0;
    LODWORD(v7) = 0;
  }
  internal = self->_internal;
  if (internal->livePhotoMovieDimensions.width != v11 || internal->livePhotoMovieDimensions.height != (_DWORD)v7)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("livePhotoMovieDimensions"));
    v13 = self->_internal;
    v13->livePhotoMovieDimensions.width = v11;
    v13->livePhotoMovieDimensions.height = v7;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("livePhotoMovieDimensions"));
  }
}

- (BOOL)isLivePhotoCaptureSupported
{
  return self->_internal->livePhotoCaptureSupported;
}

+ (unint64_t)maxLivePhotoDataSize
{
  uint64_t v2;

  v2 = objc_msgSend((id)objc_opt_class(), "maxLivePhotoMovieDimensions");
  return (unint64_t)((double)(int)v2 * 4.1 * (double)SHIDWORD(v2) * 0.125 * 3.4) + 8233312;
}

+ ($2825F4736939C4A6D3AD43837233062D)maxLivePhotoMovieDimensions
{
  if ((int)FigCapturePlatformIdentifier() > 5
    || objc_msgSend(&unk_1E424D9F0, "containsObject:", FigCaptureGetModelSpecificName()))
  {
    return ($2825F4736939C4A6D3AD43837233062D)0x5A000000780;
  }
  else
  {
    return ($2825F4736939C4A6D3AD43837233062D)0x438000005A0;
  }
}

- (void)_setIsStillImageStabilizationScene:(BOOL)a3 firingKVO:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *sceneDetectionObserversDispatchQueue;
  _QWORD v8[5];
  BOOL v9;

  v4 = a4;
  if (a4)
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isStillImageStabilizationScene"));
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__AVCapturePhotoOutput__setIsStillImageStabilizationScene_firingKVO___block_invoke;
  v8[3] = &unk_1E4217A10;
  v8[4] = self;
  v9 = a3;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v8);
  if (v4)
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isStillImageStabilizationScene"));
}

- (void)_setDigitalFlashScene:(id)a3 fireStatusKVO:(BOOL)a4 fireExposureTimesKVO:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *sceneDetectionObserversDispatchQueue;
  _QWORD v10[6];

  v5 = a5;
  v6 = a4;
  if (a4)
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("digitalFlashStatus"));
  if (v5)
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("digitalFlashExposureTimes"));
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__AVCapturePhotoOutput__setDigitalFlashScene_fireStatusKVO_fireExposureTimesKVO___block_invoke;
  v10[3] = &unk_1E4216408;
  v10[4] = self;
  v10[5] = a3;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v10);
  if (v5)
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("digitalFlashExposureTimes"));
  if (v6)
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("digitalFlashStatus"));
}

- (void)_updateCaptureReadiness
{
  AVCapturePhotoOutputInternal *internal;
  __int128 v4;
  BOOL sessionIsRunning;
  BOOL autoDeferredPhotoDeliveryEnabled;
  BOOL responsiveCaptureEnabled;
  int64_t v8;
  AVCapturePhotoOutputInternal *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int64_t captureReadiness;
  int64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  __int128 v25;
  _BYTE v26[21];
  _BYTE v27[128];
  __int128 v28;
  _BYTE v29[21];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A1AF1298](self->_internal->requestsLock, a2);
  internal = self->_internal;
  *(_QWORD *)&v29[13] = internal->readinessState.inflightUniqueIDWaitingForProcessing;
  v4 = *(_OWORD *)((char *)&internal->readinessState.inflightNonOverlappingCaptureUniqueID + 3);
  v28 = *(_OWORD *)(&internal->readinessState.responsiveCaptureEnabled + 1);
  *(_OWORD *)v29 = v4;
  sessionIsRunning = internal->readinessState.sessionIsRunning;
  autoDeferredPhotoDeliveryEnabled = internal->autoDeferredPhotoDeliveryEnabled;
  responsiveCaptureEnabled = internal->responsiveCaptureEnabled;
  v22 = sessionIsRunning;
  v23 = autoDeferredPhotoDeliveryEnabled;
  v24 = responsiveCaptureEnabled;
  v25 = v28;
  *(_OWORD *)v26 = *(_OWORD *)((char *)&internal->readinessState.inflightNonOverlappingCaptureUniqueID + 3);
  *(_QWORD *)&v26[13] = internal->readinessState.inflightUniqueIDWaitingForProcessing;
  v8 = +[AVCapturePhotoOutputReadinessCoordinator _captureReadinessFromReadinessState:](AVCapturePhotoOutputReadinessCoordinator, "_captureReadinessFromReadinessState:", &v22);
  v9 = self->_internal;
  captureReadiness = v9->captureReadiness;
  v17 = v8;
  v10 = (id)-[NSMutableArray copy](v9->readinessCoordinators, "copy");
  MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v22 = sessionIsRunning;
        v23 = autoDeferredPhotoDeliveryEnabled;
        v24 = responsiveCaptureEnabled;
        v25 = v28;
        *(_OWORD *)v26 = *(_OWORD *)v29;
        *(_QWORD *)&v26[13] = *(_QWORD *)&v29[13];
        objc_msgSend(v15, "_photoOutputDidUpdateCaptureReadinessState:", &v22);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v12);
  }
  if (v17 != captureReadiness)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("captureReadiness"));
    MEMORY[0x1A1AF1298](self->_internal->requestsLock);
    self->_internal->captureReadiness = v17;
    MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("captureReadiness"));
  }
}

uint64_t __72__AVCapturePhotoOutput_setPreparedPhotoSettingsArray_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePreparationCompleteNotificationWithPayload:settingsID:", 0, *(_QWORD *)(a1 + 40));
}

- (AVCapturePhotoSettings)photoSettingsForSceneMonitoring
{
  NSObject *sceneDetectionObserversDispatchQueue;
  AVCapturePhotoSettings *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AVCapturePhotoOutput_photoSettingsForSceneMonitoring__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v5);
  v3 = (AVCapturePhotoSettings *)(id)objc_msgSend((id)v7[5], "copy");
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04288], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D042B0], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D042A8], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D042B8], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04258], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D042A0], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04290], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04238], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04270], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04260], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04278], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04280], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04248], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04268], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04298], a3, 0);
  v6.receiver = self;
  v6.super_class = (Class)AVCapturePhotoOutput;
  -[AVCaptureOutput attachSafelyToFigCaptureSession:](&v6, sel_attachSafelyToFigCaptureSession_, a3);
}

- (void)setPrivatePhotoDimensionsEnabled:(BOOL)a3
{
  self->_internal->privatePhotoDimensionsEnabled = a3;
}

- (BOOL)isPreviewQualityAdjustedPhotoFilterRenderingSupported
{
  return self->_internal->previewQualityAdjustedPhotoFilterRenderingSupported;
}

- (BOOL)isMovieRecordingSupported
{
  return self->_internal->movieRecordingSupported;
}

- (BOOL)isImageOptimizationForOfflineVideoStabilizationSupported
{
  return self->_internal->imageOptimizationForOfflineVideoStabilizationSupported;
}

- (BOOL)isFastCapturePrioritizationSupported
{
  return self->_internal->fastCapturePrioritizationSupported;
}

- (BOOL)isAppleProRAWSupported
{
  return self->_internal->appleProRAWSupported;
}

id __81__AVCapturePhotoOutput__setDigitalFlashScene_fireStatusKVO_fireExposureTimesKVO___block_invoke(uint64_t a1)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 296) = (int)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D04E78]), "intValue");

  result = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D04E70]);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 312) = result;
  return result;
}

uint64_t __79__AVCapturePhotoOutput__updateStillImageStabilizationSupportedForSourceDevice___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16) + 89) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __72__AVCapturePhotoOutput__updateAutoRedReductionSupportedForSourceDevice___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16) + 129) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __51__AVCapturePhotoOutput__setIsFlashScene_firingKVO___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16) + 284) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __49__AVCapturePhotoOutput__setIsHDRScene_firingKVO___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16) + 285) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setContentAwareDistortionCorrectionEnabled:(BOOL)contentAwareDistortionCorrectionEnabled
{
  _BOOL4 v3;
  AVCapturePhotoOutputInternal *internal;
  void *v6;

  v3 = contentAwareDistortionCorrectionEnabled;
  if (contentAwareDistortionCorrectionEnabled
    && !-[AVCapturePhotoOutput isContentAwareDistortionCorrectionSupported](self, "isContentAwareDistortionCorrectionSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->contentAwareDistortionCorrectionEnabled != v3)
    {
      internal->contentAwareDistortionCorrectionEnabled = v3;
      -[AVCapturePhotoOutput _updateCameraCalibrationDataDeliverySupportedForSourceDevice:](self, "_updateCameraCalibrationDataDeliverySupportedForSourceDevice:", -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"));
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isContentAwareDistortionCorrectionSupported
{
  return self->_internal->contentAwareDistortionCorrectionSupported;
}

- (void)_updateCameraCalibrationDataDeliverySupportedForSourceDevice:(id)a3
{
  _BOOL4 v5;
  int v6;
  int v7;

  v5 = self->_internal->virtualDeviceConstituentPhotoDeliveryEnabled
    && (objc_msgSend(a3, "isGeometricDistortionCorrectionEnabled") & 1) == 0
    && !self->_internal->contentAwareDistortionCorrectionEnabled;
  if (objc_msgSend((id)objc_msgSend(a3, "constituentDevices"), "count") == 2)
    v6 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isStillImageDisparitySupported");
  else
    v6 = 1;
  v7 = v5 & v6;
  if (self->_internal->cameraCalibrationDataDeliverySupported != v7)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cameraCalibrationDataDeliverySupported"));
    self->_internal->cameraCalibrationDataDeliverySupported = v7;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cameraCalibrationDataDeliverySupported"));
  }
}

- (void)setResponsiveCaptureEnabled:(BOOL)responsiveCaptureEnabled
{
  _BOOL4 v3;
  AVCapturePhotoOutputInternal *internal;
  void *v6;

  v3 = responsiveCaptureEnabled;
  if (responsiveCaptureEnabled
    && !-[AVCapturePhotoOutput isResponsiveCaptureSupported](self, "isResponsiveCaptureSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->responsiveCaptureEnabled != v3)
    {
      internal->responsiveCaptureEnabled = v3;
      -[AVCapturePhotoOutput _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:](self, "_updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:", -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"));
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isResponsiveCaptureSupported
{
  return self->_internal->responsiveCaptureSupported;
}

- (void)_updateSupportedPropertiesForSourceDevice:(id)a3
{
  NSString *v5;
  AVCapturePhotoOutputInternal *internal;
  NSString *sourceDeviceType;

  v5 = (NSString *)(id)objc_msgSend(a3, "deviceType");
  internal = self->_internal;
  sourceDeviceType = internal->sourceDeviceType;
  internal->sourceDeviceType = v5;

  -[AVCapturePhotoOutput _updateAvailablePhotoPixelFormatTypesForSourceDevice:](self, "_updateAvailablePhotoPixelFormatTypesForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateAvailablePhotoCodecTypesForSourceDevice:](self, "_updateAvailablePhotoCodecTypesForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateAvailableRawPhotoPixelFormatTypesForSourceDevice:](self, "_updateAvailableRawPhotoPixelFormatTypesForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateAvailablePhotoFileTypesForSourceDevice:](self, "_updateAvailablePhotoFileTypesForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateAvailableRawPhotoFileTypesForSourceDevice:](self, "_updateAvailableRawPhotoFileTypesForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateAutoRedReductionSupportedForSourceDevice:](self, "_updateAutoRedReductionSupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateStillImageStabilizationSupportedForSourceDevice:](self, "_updateStillImageStabilizationSupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateVirtualDeviceFusionSupportedForSourceDevice:](self, "_updateVirtualDeviceFusionSupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateVirtualDeviceConstituentPhotoDeliveryAndDualCameraDualPhotoDeliverySupportedForSourceDevice:](self, "_updateVirtualDeviceConstituentPhotoDeliveryAndDualCameraDualPhotoDeliverySupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateSupportedHDRModesForSourceDevice:](self, "_updateSupportedHDRModesForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateSupportedFlashModesForSourceDevice:](self, "_updateSupportedFlashModesForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateSupportedDigitalFlashModesForSourceDevice:](self, "_updateSupportedDigitalFlashModesForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateMaxBracketedCapturePhotoCountForSourceDevice:](self, "_updateMaxBracketedCapturePhotoCountForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateLensStabilizationDuringBracketedCaptureSupportedForSourceDevice:](self, "_updateLensStabilizationDuringBracketedCaptureSupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateLivePhotoCaptureSupportedForSourceDevice:](self, "_updateLivePhotoCaptureSupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateLivePhotoMovieDimensionsForSourceDevice:](self, "_updateLivePhotoMovieDimensionsForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateAvailableLivePhotoVideoCodecTypesForSourceDevice:](self, "_updateAvailableLivePhotoVideoCodecTypesForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateOfflineVISSupportedForSourceDevice:](self, "_updateOfflineVISSupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateSceneMonitoringForSourceDevice:](self, "_updateSceneMonitoringForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateDepthDataDeliverySupportedForSourceDevice:](self, "_updateDepthDataDeliverySupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateConstantColorSupportedForSourceDevice:](self, "_updateConstantColorSupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateMovieRecordingSupportedForSourceDevice:](self, "_updateMovieRecordingSupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateSpatialOverCaptureSupportedForSourceDevice:](self, "_updateSpatialOverCaptureSupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateDeferredProcessingSupportedForSourceDevice:](self, "_updateDeferredProcessingSupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateProcessedPhotoZoomWithoutUpscalingSupportedForSourceDevice:](self, "_updateProcessedPhotoZoomWithoutUpscalingSupportedForSourceDevice:", a3);
  -[AVCapturePhotoOutput _updateFocusPixelBlurScoreSupportedForDevice:](self, "_updateFocusPixelBlurScoreSupportedForDevice:", a3);
  -[AVCapturePhotoOutput _updatePreviewQualityAdjustedPhotoFilterRenderingSupportedForDevice:](self, "_updatePreviewQualityAdjustedPhotoFilterRenderingSupportedForDevice:", a3);
  -[AVCapturePhotoOutput _updateContentAwareDistortionCorrectionSupportedForDevice:](self, "_updateContentAwareDistortionCorrectionSupportedForDevice:", a3);
  -[AVCapturePhotoOutput _updateAppleProRAWSupportedForDevice:](self, "_updateAppleProRAWSupportedForDevice:", a3);
  -[AVCapturePhotoOutput _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:](self, "_updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:", a3);
  -[AVCapturePhotoOutput _updateHighPhotoQualitySupportedForDevice:](self, "_updateHighPhotoQualitySupportedForDevice:", a3);
  -[AVCapturePhotoOutput _updateSemanticStyleRenderingSupportedForDevice:](self, "_updateSemanticStyleRenderingSupportedForDevice:", a3);
  -[AVCapturePhotoOutput _updateMaxPhotoDimensionsForDevice:](self, "_updateMaxPhotoDimensionsForDevice:", a3);
  -[AVCapturePhotoOutput _updateSpatialPhotoCaptureSupportedForDevice:](self, "_updateSpatialPhotoCaptureSupportedForDevice:", a3);
}

- (void)_updateAvailableRawPhotoFileTypesForSourceDevice:(id)a3
{
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (-[NSDictionary count](self->_internal->availableRawPhotoPixelFormatTypes, "count", a3))
  {
    v5[0] = *MEMORY[0x1E0CF2AE0];
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  if ((objc_msgSend(v4, "isEqual:", self->_internal->availableRawPhotoFileTypes) & 1) == 0)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableRawPhotoFileTypes"));

    self->_internal->availableRawPhotoFileTypes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v4);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableRawPhotoFileTypes"));
  }
}

- (void)setMaxPhotoQualityPrioritization:(AVCapturePhotoQualityPrioritization)maxPhotoQualityPrioritization
{
  AVCapturePhotoOutputInternal *internal;
  void *v5;

  if ((unint64_t)(maxPhotoQualityPrioritization - 1) >= 3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, maxPhotoQualityPrioritization);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
  else
  {
    internal = self->_internal;
    if (internal->maxPhotoQualityPrioritization != maxPhotoQualityPrioritization)
    {
      internal->maxPhotoQualityPrioritization = maxPhotoQualityPrioritization;
      -[AVCapturePhotoOutput _updateSemanticStyleRenderingSupportedForDevice:](self, "_updateSemanticStyleRenderingSupportedForDevice:", -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"));
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
      internal = self->_internal;
    }
    internal->maxPhotoQualityPrioritizationHasBeenSetByClient = 1;
  }
}

- (void)setDepthDataDeliveryEnabled:(BOOL)depthDataDeliveryEnabled
{
  AVCapturePhotoOutputInternal *internal;
  id v5;
  void *v6;

  internal = self->_internal;
  if (depthDataDeliveryEnabled && !internal->depthDataDeliverySupported)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else if (internal->depthDataDeliveryEnabled != depthDataDeliveryEnabled)
  {
    internal->depthDataDeliveryEnabled = depthDataDeliveryEnabled;
    v5 = -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice");
    -[AVCapturePhotoOutput _updateContentAwareDistortionCorrectionSupportedForDevice:](self, "_updateContentAwareDistortionCorrectionSupportedForDevice:", v5);
    -[AVCapturePhotoOutput _updateAppleProRAWSupportedForDevice:](self, "_updateAppleProRAWSupportedForDevice:", v5);
    -[AVCapturePhotoOutput _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:](self, "_updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:", v5);
    -[AVCapturePhotoOutput _updateVirtualDeviceConstituentPhotoDeliveryAndDualCameraDualPhotoDeliverySupportedForSourceDevice:](self, "_updateVirtualDeviceConstituentPhotoDeliveryAndDualCameraDualPhotoDeliverySupportedForSourceDevice:", v5);
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)_updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:(id)a3
{
  void *v5;
  AVCapturePhotoOutputInternal *internal;
  int v7;
  AVCapturePhotoOutputInternal *v8;
  int zeroShutterLagEnabled;
  _BOOL4 v10;
  int v11;
  int v13;
  _BOOL4 ultraHighResolutionZeroShutterLagSupported;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  AVCapturePhotoOutputInternal *v20;
  int v21;
  _BOOL4 responsiveCaptureEnabled;
  _BOOL4 v23;
  int v24;
  _BOOL4 v25;
  _BOOL4 v26;
  int v27;
  int fastCapturePrioritizationSupported;
  int v29;
  AVCapturePhotoOutputInternal *v30;
  int v31;
  unsigned int v32;
  int v33;
  _BOOL4 v34;
  _BOOL4 v35;
  _BOOL4 v36;
  int v37;
  int zeroShutterLagSupported;

  v5 = (void *)objc_msgSend(a3, "activeFormat");
  if (objc_msgSend(v5, "isZeroShutterLagSupported"))
  {
    internal = self->_internal;
    if (!internal->depthDataDeliveryEnabled)
    {
LABEL_5:
      v7 = !internal->virtualDeviceConstituentPhotoDeliveryEnabled;
      goto LABEL_7;
    }
    if (objc_msgSend(v5, "isZeroShutterLagWithDepthSupported"))
    {
      internal = self->_internal;
      goto LABEL_5;
    }
  }
  v7 = 0;
LABEL_7:
  v8 = self->_internal;
  zeroShutterLagSupported = v8->zeroShutterLagSupported;
  zeroShutterLagEnabled = v8->zeroShutterLagEnabled;
  if (!v8->zeroShutterLagAutomaticallyEnabled)
  {
    v10 = 0;
    if (!v8->zeroShutterLagEnabled || v7 == 0)
    {
      v34 = zeroShutterLagEnabled != 0;
      v11 = 0;
      goto LABEL_20;
    }
LABEL_16:
    v34 = v10;
    v13 = objc_msgSend(v5, "isUltraHighResolutionZeroShutterLagSupported");
    v8 = self->_internal;
    if (v13)
    {
      v11 = objc_msgSend(v5, "maxPhotoDimensionsAreUltraHighResolution:privateDimensionsEnabled:", *(_QWORD *)&v8->maxPhotoDimensions, v8->privatePhotoDimensionsEnabled);
      v8 = self->_internal;
    }
    else
    {
      v11 = 0;
    }
    v10 = 1;
    goto LABEL_20;
  }
  v10 = zeroShutterLagEnabled != v7;
  if ((v7 & 1) != 0)
    goto LABEL_16;
  v34 = zeroShutterLagEnabled != v7;
  v10 = 0;
  v11 = 0;
LABEL_20:
  ultraHighResolutionZeroShutterLagSupported = v8->ultraHighResolutionZeroShutterLagSupported;
  v35 = v10;
  v15 = v10 & v11 ^ 1;
  if (!v8->ultraHighResolutionZeroShutterLagSupportEnabled)
    v15 = 0;
  v37 = v15;
  if (v8->ultraHighResolutionZeroShutterLagSupportEnabled)
    v16 = v10 & v11;
  else
    v16 = 0;
  if (v8->ultraHighResolutionZeroShutterLagEnabled)
    v17 = v16 ^ 1;
  else
    v17 = 0;
  if (v8->ultraHighResolutionZeroShutterLagEnabled)
    v18 = v16;
  else
    v18 = 0;
  v19 = objc_msgSend(a3, "ultraHighResolutionZeroShutterLagEnabled");
  v32 = v18;
  if ((v18 & 1) == 0 && v19)
    objc_msgSend(a3, "setUltraHighResolutionZeroShutterLagEnabled:", 0);
  if (!objc_msgSend(v5, "isFastCapturePrioritizationSupported"))
    goto LABEL_40;
  v20 = self->_internal;
  if (!v20->depthDataDeliveryEnabled)
    goto LABEL_38;
  if (!objc_msgSend(a3, "isResponsiveCaptureWithDepthSupported"))
  {
LABEL_40:
    v24 = ultraHighResolutionZeroShutterLagSupported;
    v20 = self->_internal;
    v36 = !v20->responsiveCaptureSupported;
    responsiveCaptureEnabled = v20->responsiveCaptureEnabled;
    v21 = v17;
    goto LABEL_41;
  }
  v20 = self->_internal;
LABEL_38:
  v21 = v17;
  responsiveCaptureEnabled = v20->responsiveCaptureEnabled;
  v23 = v20->responsiveCaptureEnabled;
  v36 = v20->responsiveCaptureSupported == v35;
  v24 = ultraHighResolutionZeroShutterLagSupported;
  if (v35)
  {
    v25 = 0;
    v26 = 1;
    goto LABEL_42;
  }
LABEL_41:
  v26 = 0;
  v23 = 0;
  v25 = responsiveCaptureEnabled;
LABEL_42:
  v27 = v26 && v23;
  fastCapturePrioritizationSupported = v20->fastCapturePrioritizationSupported;
  v29 = !v36;
  if (fastCapturePrioritizationSupported != (v26 && v23))
    v29 = 1;
  if (zeroShutterLagSupported != v7)
    v29 = 1;
  if (v24 != v11)
    v29 = 1;
  if (((v21 | v37 | v29) & 1) != 0)
  {
    v33 = v24;
    if (!v36)
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("responsiveCaptureSupported"));
    if (fastCapturePrioritizationSupported != v27)
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("fastCapturePrioritizationSupported"));
    if (v33 != v11)
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("ultraHighResolutionZeroShutterLagSupported"));
    if (v37)
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("ultraHighResolutionZeroShutterLagSupportEnabled"));
    if (zeroShutterLagSupported != v7)
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("zeroShutterLagSupported"));
    self->_internal->responsiveCaptureSupported = v26;
    self->_internal->fastCapturePrioritizationSupported = v27;
    self->_internal->ultraHighResolutionZeroShutterLagSupported = v11;
    self->_internal->ultraHighResolutionZeroShutterLagSupportEnabled = v16;
    self->_internal->zeroShutterLagSupported = v7;
    if (v25)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("responsiveCaptureEnabled"));
      self->_internal->responsiveCaptureEnabled = 0;
    }
    v30 = self->_internal;
    if (v30->fastCapturePrioritizationSupported || !v30->fastCapturePrioritizationEnabled)
    {
      v31 = 0;
      if (!v21)
        goto LABEL_64;
    }
    else
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("fastCapturePrioritizationEnabled"));
      self->_internal->fastCapturePrioritizationEnabled = 0;
      v31 = 1;
      if (!v21)
      {
LABEL_64:
        if (v34)
        {
          -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("zeroShutterLagEnabled"));
          self->_internal->zeroShutterLagEnabled = v35;
          -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("zeroShutterLagEnabled"));
          if (!v21)
          {
LABEL_66:
            if (!v31)
              goto LABEL_67;
            goto LABEL_81;
          }
        }
        else if (!v21)
        {
          goto LABEL_66;
        }
        -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("ultraHighResolutionZeroShutterLagEnabled"));
        if (!v31)
        {
LABEL_67:
          if (!v25)
          {
LABEL_69:
            if (zeroShutterLagSupported != v7)
              -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("zeroShutterLagSupported"));
            if (v37)
              -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("ultraHighResolutionZeroShutterLagSupportEnabled"));
            if (v33 != v11)
              -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("ultraHighResolutionZeroShutterLagSupported"));
            if (fastCapturePrioritizationSupported != v27)
              -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("fastCapturePrioritizationSupported"));
            if (!v36)
              -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("responsiveCaptureSupported"));
            return;
          }
LABEL_68:
          -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("responsiveCaptureEnabled"));
          goto LABEL_69;
        }
LABEL_81:
        -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("fastCapturePrioritizationEnabled"));
        if (!v25)
          goto LABEL_69;
        goto LABEL_68;
      }
    }
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("ultraHighResolutionZeroShutterLagEnabled"));
    -[AVCapturePhotoOutput _setUltraHighResolutionZeroShutterLagEnabled:](self, "_setUltraHighResolutionZeroShutterLagEnabled:", v32);
    goto LABEL_64;
  }
}

- (void)_updateContentAwareDistortionCorrectionSupportedForDevice:(id)a3
{
  int v5;
  AVCapturePhotoOutputInternal *internal;

  if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isContentAwareDistortionCorrectionSupported"))
  {
    if (self->_internal->depthDataDeliveryEnabled)
      v5 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isDCProcessingWithDepthSupported");
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  if (self->_internal->contentAwareDistortionCorrectionSupported != v5)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("contentAwareDistortionCorrectionSupported"));
    self->_internal->contentAwareDistortionCorrectionSupported = v5;
    internal = self->_internal;
    if (!internal->contentAwareDistortionCorrectionSupported && internal->contentAwareDistortionCorrectionEnabled)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("contentAwareDistortionCorrectionEnabled"));
      self->_internal->contentAwareDistortionCorrectionEnabled = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("contentAwareDistortionCorrectionEnabled"));
    }
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("contentAwareDistortionCorrectionSupported"));
  }
}

- (void)_updateAppleProRAWSupportedForDevice:(id)a3
{
  int v5;
  AVCapturePhotoOutputInternal *internal;

  if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isDemosaicedRawSupported"))
  {
    if (self->_internal->depthDataDeliveryEnabled)
      v5 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isDemosaicedRawConfigurationWithDepthSupported");
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  if (self->_internal->appleProRAWSupported != v5)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("appleProRAWSupported"));
    self->_internal->appleProRAWSupported = v5;
    internal = self->_internal;
    if (!internal->appleProRAWSupported && internal->appleProRAWEnabled)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("appleProRAWEnabled"));
      self->_internal->appleProRAWEnabled = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("appleProRAWEnabled"));
    }
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("appleProRAWSupported"));
  }
}

- (void)_updateVirtualDeviceFusionSupportedForSourceDevice:(id)a3
{
  int v5;

  if (objc_msgSend(a3, "isVirtualDevice"))
    v5 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isStereoFusionSupported");
  else
    v5 = 0;
  if (self->_internal->virtualDeviceFusionSupported != v5)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("virtualDeviceFusionSupported"));
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("dualCameraFusionSupported"));
    self->_internal->virtualDeviceFusionSupported = v5;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("dualCameraFusionSupported"));
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("virtualDeviceFusionSupported"));
  }
}

- (void)_updateSupportedFlashModesForSourceDevice:(id)a3
{
  void *v4;
  NSObject *sceneDetectionObserversDispatchQueue;
  _QWORD v6[6];

  if (objc_msgSend(a3, "hasFlash"))
    v4 = &unk_1E424DA50;
  else
    v4 = &unk_1E424DA68;
  if ((objc_msgSend(v4, "isEqual:", self->_internal->supportedFlashModes) & 1) == 0)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("supportedFlashModes"));
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("flashSupported"));
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__AVCapturePhotoOutput__updateSupportedFlashModesForSourceDevice___block_invoke;
    v6[3] = &unk_1E4216408;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("flashSupported"));
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("supportedFlashModes"));
  }
}

- (void)_updateStillImageStabilizationSupportedForSourceDevice:(id)a3
{
  int v4;
  char v5;
  NSObject *sceneDetectionObserversDispatchQueue;
  _QWORD v7[5];
  char v8;

  v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isSISSupported");
  if (self->_internal->stillImageStabilizationSupported != v4)
  {
    v5 = v4;
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stillImageStabilizationSupported"));
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__AVCapturePhotoOutput__updateStillImageStabilizationSupportedForSourceDevice___block_invoke;
    v7[3] = &unk_1E4217A10;
    v7[4] = self;
    v8 = v5;
    dispatch_sync(sceneDetectionObserversDispatchQueue, v7);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stillImageStabilizationSupported"));
  }
}

- (void)_updateSpatialOverCaptureSupportedForSourceDevice:(id)a3
{
  int v4;
  BOOL v5;

  v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isSpatialOverCaptureSupported");
  if (self->_internal->spatialOverCaptureSupported != v4)
  {
    v5 = v4;
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("spatialOverCaptureSupported"));
    self->_internal->spatialOverCaptureSupported = v5;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("spatialOverCaptureSupported"));
    if (!v5 && self->_internal->spatialOverCaptureEnabled)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("spatialOverCaptureEnabled"));
      self->_internal->spatialOverCaptureEnabled = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("spatialOverCaptureEnabled"));
    }
  }
}

- (void)_updatePreviewQualityAdjustedPhotoFilterRenderingSupportedForDevice:(id)a3
{
  int v4;
  BOOL v5;
  AVCapturePhotoOutputInternal *internal;

  v4 = objc_msgSend(a3, "isPreviewQualityAdjustedPhotoFilterRenderingSupported");
  if (self->_internal->previewQualityAdjustedPhotoFilterRenderingSupported != v4)
  {
    v5 = v4;
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("previewQualityAdjustedPhotoFilterRenderingSupported"));
    self->_internal->previewQualityAdjustedPhotoFilterRenderingSupported = v5;
    internal = self->_internal;
    if (!internal->previewQualityAdjustedPhotoFilterRenderingSupported
      && internal->previewQualityAdjustedPhotoFilterRenderingEnabled)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("previewQualityAdjustedPhotoFilterRenderingEnabled"));
      self->_internal->previewQualityAdjustedPhotoFilterRenderingEnabled = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("previewQualityAdjustedPhotoFilterRenderingEnabled"));
    }
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("previewQualityAdjustedPhotoFilterRenderingSupported"));
  }
}

- (void)_updateOfflineVISSupportedForSourceDevice:(id)a3
{
  void *v4;
  int v5;
  AVCapturePhotoOutputInternal *internal;
  _BOOL4 v7;
  float *v8;
  float v9;
  CMVideoDimensions Dimensions;
  int v11;
  AVCapturePhotoOutputInternal *v12;
  AVCapturePhotoOutputInternal *v13;

  v4 = (void *)objc_msgSend(a3, "activeFormat");
  v5 = objc_msgSend(v4, "isVideoStabilizationModeSupported:", 2);
  if (self->_internal->imageOptimizationForOfflineVideoStabilizationSupported != v5)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("imageOptimizationForOfflineVideoStabilizationSupported"));
    self->_internal->imageOptimizationForOfflineVideoStabilizationSupported = v5;
    internal = self->_internal;
    if (!internal->imageOptimizationForOfflineVideoStabilizationSupported
      && internal->optimizesImagesForOfflineVideoStabilization)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("optimizesImagesForOfflineVideoStabilization"));
      self->_internal->optimizesImagesForOfflineVideoStabilization = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("optimizesImagesForOfflineVideoStabilization"));
    }
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("imageOptimizationForOfflineVideoStabilizationSupported"));
  }
  if (v5)
  {
    v7 = -[AVCaptureConnection sourcesFromFrontFacingCamera](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourcesFromFrontFacingCamera");
    v8 = (float *)MEMORY[0x1E0D040B0];
    if (!v7)
      v8 = (float *)MEMORY[0x1E0D040A8];
    v9 = *v8;
    Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v4, "formatDescription"));
    v5 = 4 * llroundf((float)(int)(float)((float)(v9 + 1.0) * (float)Dimensions.width) * 0.25);
    v11 = 4 * llroundf((float)(int)(float)((float)(v9 + 1.0) * (float)Dimensions.height) * 0.25);
  }
  else
  {
    v11 = 0;
  }
  v12 = self->_internal;
  if (v5 != v12->optimizedImageDimensionsForOfflineStabilization.width
    || v11 != v12->optimizedImageDimensionsForOfflineStabilization.height)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("optimizedImageDimensionsForOfflineStabilization"));
    v13 = self->_internal;
    v13->optimizedImageDimensionsForOfflineStabilization.width = v5;
    v13->optimizedImageDimensionsForOfflineStabilization.height = v11;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("optimizedImageDimensionsForOfflineStabilization"));
  }
}

- (void)_updateMovieRecordingSupportedForSourceDevice:(id)a3
{
  int v4;
  BOOL v5;

  v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isMomentCaptureMovieRecordingSupported");
  if (self->_internal->movieRecordingSupported != v4)
  {
    v5 = v4;
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("movieRecordingSupported"));
    self->_internal->movieRecordingSupported = v5;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("movieRecordingSupported"));
    if (!v5 && self->_internal->movieRecordingEnabled)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("movieRecordingEnabled"));
      self->_internal->movieRecordingEnabled = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("movieRecordingEnabled"));
    }
  }
}

- (void)_updateProcessedPhotoZoomWithoutUpscalingSupportedForSourceDevice:(id)a3
{
  int v4;
  BOOL v5;

  v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isMomentCaptureMovieRecordingSupported");
  if (self->_internal->processedPhotoZoomWithoutUpscalingSupported != v4)
  {
    v5 = v4;
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("processedPhotoZoomWithoutUpscalingSupported"));
    self->_internal->processedPhotoZoomWithoutUpscalingSupported = v5;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("processedPhotoZoomWithoutUpscalingSupported"));
  }
}

- (void)_updateLensStabilizationDuringBracketedCaptureSupportedForSourceDevice:(id)a3
{
  AVCapturePhotoOutputInternal *internal;
  _BOOL4 v5;

  if (objc_msgSend(a3, "isLensStabilizationSupported"))
  {
    MEMORY[0x1A1AF1298](self->_internal->requestsLock);
    internal = self->_internal;
    v5 = internal->maxBracketedCapturePhotoCount != 0;
    MEMORY[0x1A1AF12A4](internal->requestsLock);
  }
  else
  {
    v5 = 0;
  }
  if (self->_internal->lensStabilizationDuringBracketedCaptureSupported != v5)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lensStabilizationDuringBracketedCaptureSupported"));
    self->_internal->lensStabilizationDuringBracketedCaptureSupported = v5;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lensStabilizationDuringBracketedCaptureSupported"));
  }
}

- (void)_updateHighPhotoQualitySupportedForDevice:(id)a3
{
  self->_internal->highPhotoQualitySupported = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isHighPhotoQualitySupported");
}

- (void)_updateFocusPixelBlurScoreSupportedForDevice:(id)a3
{
  int v4;
  BOOL v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "figCaptureSourceVideoFormat"), "isFocusPixelBlurScoreSupported");
  if (self->_internal->focusPixelFocusBlurScoreSupported != v4)
  {
    v5 = v4;
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("focusPixelBlurScoreSupported"));
    self->_internal->focusPixelFocusBlurScoreSupported = v5;
    if (!v5 && self->_internal->focusPixelFocusBlurScoreEnabled)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("focusPixelBlurScoreEnabled"));
      self->_internal->focusPixelFocusBlurScoreEnabled = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("focusPixelBlurScoreEnabled"));
    }
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("focusPixelBlurScoreSupported"));
  }
}

- (void)_updateDeferredProcessingSupportedForSourceDevice:(id)a3
{
  int v4;
  BOOL v5;

  v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isDeferredPhotoProcessingSupported");
  if (self->_internal->autoDeferredPhotoDeliverySupported != v4)
  {
    v5 = v4;
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("autoDeferredPhotoDeliverySupported"));
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("deferredProcessingSupported"));
    self->_internal->autoDeferredPhotoDeliverySupported = v5;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("deferredProcessingSupported"));
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("autoDeferredPhotoDeliverySupported"));
    if (!v5 && self->_internal->autoDeferredPhotoDeliveryEnabled)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("autoDeferredPhotoDeliveryEnabled"));
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("deferredProcessingEnabled"));
      self->_internal->autoDeferredPhotoDeliveryEnabled = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("deferredProcessingEnabled"));
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("autoDeferredPhotoDeliveryEnabled"));
    }
  }
}

- (void)_updateConstantColorSupportedForSourceDevice:(id)a3
{
  int v4;
  BOOL v5;
  AVCapturePhotoOutputInternal *internal;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "figCaptureSourceVideoFormat"), "isConstantColorSupported");
  if (self->_internal->constantColorSupported != v4)
  {
    v5 = v4;
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("constantColorSupported"));
    self->_internal->constantColorSupported = v5;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("constantColorSupported"));
    if (!v5)
    {
      internal = self->_internal;
      if (internal->constantColorEnabled)
      {
        -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("constantColorEnabled"));
        self->_internal->constantColorEnabled = 0;
        -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("constantColorEnabled"));
        internal = self->_internal;
      }
      if (internal->constantColorClippingRecoveryEnabled)
      {
        -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("constantColorClippingRecoveryEnabled"));
        self->_internal->constantColorClippingRecoveryEnabled = 0;
        -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("constantColorClippingRecoveryEnabled"));
        internal = self->_internal;
      }
      if (internal->constantColorSaturationBoostEnabled)
      {
        -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("constantColorSaturationBoostEnabled"));
        self->_internal->constantColorSaturationBoostEnabled = 0;
        -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("constantColorSaturationBoostEnabled"));
      }
    }
  }
}

- (void)_updateAvailablePhotoPixelFormatTypesForSourceDevice:(id)a3
{
  void *v5;
  uint64_t MediaSubType;
  int v7;
  uint64_t v8;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (a3)
  {
    MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "formatDescription"));
    if ((MediaSubType & 0xFFFFFFFD) == 0x78343230)
    {
      objc_msgSend(v5, "addObjectsFromArray:", &unk_1E424DA08);
    }
    else
    {
      v7 = MediaSubType;
      objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", MediaSubType));
      if (v7 == 875704422)
        v8 = 875704438;
      else
        v8 = 875704422;
      objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
    }
    objc_msgSend(v5, "addObject:", &unk_1E424D248);
  }
  if ((objc_msgSend(v5, "isEqual:", self->_internal->availablePhotoPixelFormatTypes) & 1) == 0)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availablePhotoPixelFormatTypes"));

    self->_internal->availablePhotoPixelFormatTypes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v5);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availablePhotoPixelFormatTypes"));
  }
}

- (void)_updateAvailablePhotoFileTypesForSourceDevice:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v5, "addObject:", *MEMORY[0x1E0CF2AF8]);
  if (-[AVCapturePhotoOutput _HEVCAndHEIFAreAvailableForSourceDevice:](self, "_HEVCAndHEIFAreAvailableForSourceDevice:", a3))
  {
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0CF2AE8]);
  }
  objc_msgSend(v5, "addObject:", *MEMORY[0x1E0CF2B10]);
  if ((objc_msgSend(v5, "isEqual:", self->_internal->availablePhotoFileTypes) & 1) == 0)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availablePhotoFileTypes"));

    self->_internal->availablePhotoFileTypes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v5);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availablePhotoFileTypes"));
  }
}

- (void)_updateAvailablePhotoCodecTypesForSourceDevice:(id)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0CF2C90]);
    if (-[AVCapturePhotoOutput _HEVCAndHEIFAreAvailableForSourceDevice:](self, "_HEVCAndHEIFAreAvailableForSourceDevice:", a3))
    {
      objc_msgSend(v6, "addObject:", *MEMORY[0x1E0CF2C88]);
    }
  }
  if ((objc_msgSend(v6, "isEqual:", self->_internal->availablePhotoCodecTypes) & 1) == 0)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availablePhotoCodecTypes"));

    self->_internal->availablePhotoCodecTypes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v6);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availablePhotoCodecTypes"));
  }
}

- (void)_updateAutoRedReductionSupportedForSourceDevice:(id)a3
{
  int v4;
  char v5;
  NSObject *sceneDetectionObserversDispatchQueue;
  _QWORD v7[5];
  char v8;

  v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "supportsRedEyeReduction");
  if (self->_internal->autoRedEyeReductionSupported != v4)
  {
    v5 = v4;
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("autoRedEyeReductionSupported"));
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__AVCapturePhotoOutput__updateAutoRedReductionSupportedForSourceDevice___block_invoke;
    v7[3] = &unk_1E4217A10;
    v7[4] = self;
    v8 = v5;
    dispatch_sync(sceneDetectionObserversDispatchQueue, v7);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("autoRedEyeReductionSupported"));
  }
}

- (BOOL)_HEVCAndHEIFAreAvailableForSourceDevice:(id)a3
{
  CMVideoDimensions Dimensions;
  double v5;
  double v6;
  BOOL result;

  result = 0;
  if (objc_msgSend(a3, "isHEIFSupported"))
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "formatDescription"));
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "videoSupportedFrameRateRanges"), "lastObject"), "maxFrameRate");
    v6 = v5;
    if ((objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isPhotoFormat") & 1) != 0
      || v6 * (double)(Dimensions.height * Dimensions.width) * 0.0625 * 0.0625 <= 1000000.0)
    {
      return 1;
    }
  }
  return result;
}

- (void)_updateSupportedDigitalFlashModesForSourceDevice:(id)a3
{
  void *v4;
  NSObject *sceneDetectionObserversDispatchQueue;
  _QWORD v6[6];

  if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isDigitalFlashSupported"))
    v4 = &unk_1E424DA80;
  else
    v4 = &unk_1E424DA98;
  if ((objc_msgSend(v4, "isEqual:", self->_internal->supportedDigitalFlashModes) & 1) == 0)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("supportedDigitalFlashModes"));
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__AVCapturePhotoOutput__updateSupportedDigitalFlashModesForSourceDevice___block_invoke;
    v6[3] = &unk_1E4216408;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("supportedDigitalFlashModes"));
    if ((unint64_t)objc_msgSend(v4, "count") <= 1 && self->_internal->digitalFlashCaptureEnabled)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("digitalFlashCaptureEnabled"));
      self->_internal->digitalFlashCaptureEnabled = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("digitalFlashCaptureEnabled"));
    }
  }
}

- (void)setFilterRenderingEnabled:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;

  internal = self->_internal;
  if (internal->filterRenderingEnabled != a3)
  {
    internal->filterRenderingEnabled = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

uint64_t __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                         + 16)
                                                                             + 280) > 0;
  return result;
}

+ (void)initialize
{
  const void *v2;

  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    v2 = (const void *)MGCopyAnswer();
    sIsForcedShutterSoundRegion = v2 == (const void *)*MEMORY[0x1E0C9AE50];
    if (v2)
      CFRelease(v2);
  }
}

- (void)setPortraitEffectsMatteDeliveryEnabled:(BOOL)portraitEffectsMatteDeliveryEnabled
{
  AVCapturePhotoOutputInternal *internal;
  void *v4;

  internal = self->_internal;
  if (portraitEffectsMatteDeliveryEnabled && !internal->portraitEffectsMatteDeliverySupported)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else if (internal->portraitEffectsMatteDeliveryEnabled != portraitEffectsMatteDeliveryEnabled)
  {
    internal->portraitEffectsMatteDeliveryEnabled = portraitEffectsMatteDeliveryEnabled;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)setAutoDeferredPhotoDeliveryEnabled:(BOOL)autoDeferredPhotoDeliveryEnabled
{
  _BOOL4 v3;
  AVCapturePhotoOutputInternal *internal;
  void *v6;

  v3 = autoDeferredPhotoDeliveryEnabled;
  if (autoDeferredPhotoDeliveryEnabled
    && !-[AVCapturePhotoOutput isAutoDeferredPhotoDeliverySupported](self, "isAutoDeferredPhotoDeliverySupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->autoDeferredPhotoDeliveryEnabled != v3)
    {
      internal->autoDeferredPhotoDeliveryEnabled = v3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isAutoDeferredPhotoDeliverySupported
{
  return self->_internal->autoDeferredPhotoDeliverySupported;
}

- (void)setMaxPhotoDimensions:(CMVideoDimensions)maxPhotoDimensions
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;

  v5 = -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice");
  v6 = (void *)objc_msgSend(v5, "activeFormat");
  if (v6)
  {
    if ((objc_msgSend(v6, "validateMaxPhotoDimensions:privateDimensionsEnabled:", maxPhotoDimensions, self->_internal->privatePhotoDimensionsEnabled) & 1) != 0)
    {
      v10 = 0;
      -[AVCapturePhotoOutput _setMaxPhotoDimensions:bumpChangeSeedOut:](self, "_setMaxPhotoDimensions:bumpChangeSeedOut:", maxPhotoDimensions, &v10);
      -[AVCapturePhotoOutput _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:](self, "_updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:", v5);
      -[AVCapturePhotoOutput _setHighResolutionCaptureEnabled:bumpChangeSeedOut:](self, "_setHighResolutionCaptureEnabled:bumpChangeSeedOut:", -[AVCapturePhotoOutput maxPhotoDimensionsAreHighResolution](self, "maxPhotoDimensionsAreHighResolution"), &v10);
      if (v10)
        -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
      return;
    }
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
  }
  v9 = (void *)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v9);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
}

- (void)setHighResolutionCaptureEnabled:(BOOL)highResolutionCaptureEnabled
{
  _BOOL8 v3;
  void *v5;
  char v6;

  if (self->_internal->highResolutionCaptureEnabled != highResolutionCaptureEnabled)
  {
    v3 = highResolutionCaptureEnabled;
    v6 = 0;
    -[AVCapturePhotoOutput _setHighResolutionCaptureEnabled:bumpChangeSeedOut:](self, "_setHighResolutionCaptureEnabled:bumpChangeSeedOut:");
    v5 = (void *)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "activeFormat");
    if (v5)
      -[AVCapturePhotoOutput _setMaxPhotoDimensions:bumpChangeSeedOut:](self, "_setMaxPhotoDimensions:bumpChangeSeedOut:", objc_msgSend(v5, "defaultPhotoDimensionsWithHighResolutionCaptureEnabled:", v3), &v6);
    if (v6)
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)_setMaxPhotoDimensions:(id)a3 bumpChangeSeedOut:(BOOL *)a4
{
  int var0;
  int var1;
  AVCapturePhotoOutputInternal *internal;

  var0 = a3.var0;
  var1 = a3.var1;
  if (*(_QWORD *)&self->_internal->maxPhotoDimensions != a3)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("maxPhotoDimensions"));
    internal = self->_internal;
    internal->maxPhotoDimensions.width = var0;
    internal->maxPhotoDimensions.height = var1;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("maxPhotoDimensions"));
    if (a4)
      *a4 = 1;
  }
}

- (void)_setHighResolutionCaptureEnabled:(BOOL)a3 bumpChangeSeedOut:(BOOL *)a4
{
  _BOOL4 v5;
  void *v7;
  int v8;

  if (self->_internal->highResolutionCaptureEnabled != a3)
  {
    v5 = a3;
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("highResolutionCaptureEnabled"));
    self->_internal->highResolutionCaptureEnabled = v5;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("highResolutionCaptureEnabled"));
    v7 = (void *)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "activeFormat");
    if (v5)
    {
      v8 = objc_msgSend(v7, "supportsQuadraHighResolutionStillImageOutput");
      if (a4)
      {
        if (v8)
          *a4 = 1;
      }
    }
  }
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)fastCapturePrioritizationEnabled
{
  AVCapturePhotoOutputInternal *internal;
  void *v4;

  internal = self->_internal;
  if (fastCapturePrioritizationEnabled && !internal->fastCapturePrioritizationSupported)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else if (internal->fastCapturePrioritizationEnabled != fastCapturePrioritizationEnabled)
  {
    internal->fastCapturePrioritizationEnabled = fastCapturePrioritizationEnabled;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)setPreviewQualityAdjustedPhotoFilterRenderingEnabled:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;
  void *v4;

  internal = self->_internal;
  if (a3 && !internal->previewQualityAdjustedPhotoFilterRenderingSupported)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else if (internal->previewQualityAdjustedPhotoFilterRenderingEnabled != a3)
  {
    internal->previewQualityAdjustedPhotoFilterRenderingEnabled = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)setPreparedPhotoSettingsArray:(NSArray *)preparedPhotoSettingsArray completionHandler:(void *)completionHandler
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVCapturePreparedPhotoSettingsArrayRequest *v11;
  int v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[7];
  _QWORD v20[6];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (preparedPhotoSettingsArray)
  {
    v25 = 0;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](preparedPhotoSettingsArray, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(preparedPhotoSettingsArray);
          if (!po_photoSettingsAreValid(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v10), 0, 0, 0, &v25))
          {
            v16 = (void *)MEMORY[0x1E0C99DA0];
            v17 = *MEMORY[0x1E0C99778];
            goto LABEL_19;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](preparedPhotoSettingsArray, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v8)
          continue;
        break;
      }
    }
    v11 = +[AVCapturePreparedPhotoSettingsArrayRequest preparedPhotoSettingsArrayRequestWithArray:completionHandler:](AVCapturePreparedPhotoSettingsArrayRequest, "preparedPhotoSettingsArrayRequestWithArray:completionHandler:", preparedPhotoSettingsArray, completionHandler);
    v12 = objc_msgSend(-[AVCaptureOutput session](self, "session"), "isBeingConfigured");
    if (!completionHandler)
    {
      if (v12)
      {
        v13 = -[AVCapturePhotoOutput figCaptureIrisPreparedSettings](self, "figCaptureIrisPreparedSettings");
        v14 = -[AVCapturePhotoOutput _figCaptureIrisPreparedSettingsForRequest:](self, "_figCaptureIrisPreparedSettingsForRequest:", v11);
        objc_msgSend(v14, "setSettingsID:", objc_msgSend(v13, "settingsID"));
        if (objc_msgSend(v14, "isEqual:", v13))
          -[AVCapturePreparedPhotoSettingsArrayRequest _setRequestID:](v11, "_setRequestID:", objc_msgSend(v13, "settingsID"));
      }
    }
    MEMORY[0x1A1AF1298](self->_internal->requestsLock);
    v15 = objc_msgSend((id)-[NSMutableArray lastObject](self->_internal->prepareRequests, "lastObject"), "requestID");
    -[NSMutableArray addObject:](self->_internal->prepareRequests, "addObject:", v11);
    MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
    if (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isBeingConfigured"))
    {
      if (v15 >= 1)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __72__AVCapturePhotoOutput_setPreparedPhotoSettingsArray_completionHandler___block_invoke;
        v20[3] = &unk_1E4216650;
        v20[4] = self;
        v20[5] = v15;
        -[AVCaptureOutput performBlockOnSessionNotifyingThread:](self, "performBlockOnSessionNotifyingThread:", v20);
      }
    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __72__AVCapturePhotoOutput_setPreparedPhotoSettingsArray_completionHandler___block_invoke_2;
      v19[3] = &unk_1E421D550;
      v19[4] = self;
      v19[5] = v11;
      v19[6] = v15;
      -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v19);
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
LABEL_19:
    v18 = (void *)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v18);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v18);
  }
}

- (AVCapturePhotoOutput)init
{
  AVCapturePhotoOutput *v2;
  AVCapturePhotoOutputInternal *v3;
  AVCapturePhotoOutputInternal *internal;
  AVCapturePhotoOutputInternal *v5;
  AVCapturePhotoSettings *v6;
  void *v7;
  AVCapturePreparedPhotoSettingsArrayRequest *v8;
  CMTime v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)AVCapturePhotoOutput;
  v2 = -[AVCaptureOutput initSubclass](&v11, sel_initSubclass);
  if (v2)
  {
    v3 = objc_alloc_init(AVCapturePhotoOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v2);
      v2->_internal->sceneDetectionObserversDispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.photooutput.observed_scene_detection_queue", 0);
      v2->_internal->requestsLock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
      v2->_internal->photoRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v2->_internal->movieRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v2->_internal->readinessCoordinators = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      internal = v2->_internal;
      CMTimeMakeWithSeconds(&v10, 3.0, 1000);
      internal->livePhotoMovieDuration = ($95D729B680665BEAEFA1D6FCA8238556)v10;
      v5 = v2->_internal;
      CMTimeMake(&v10, 1, 30);
      v5->livePhotoMovieVideoFrameDuration = ($95D729B680665BEAEFA1D6FCA8238556)v10;
      v2->_internal->availablePhotoPixelFormatTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v2->_internal->availablePhotoCodecTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v2->_internal->availableRawPhotoPixelFormatTypes = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
      v2->_internal->availablePhotoFileTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v2->_internal->availableRawPhotoCodecTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v2->_internal->availableRawPhotoFileTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v2->_internal->availableLivePhotoVideoCodecTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v2->_internal->supportedHDRModes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1E424D128, 0);
      v2->_internal->supportedFlashModes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1E424D128, 0);
      v2->_internal->availableSemanticSegmentationTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v2->_internal->enabledSemanticSegmentationTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v2->_internal->maxPhotoQualityPrioritization = 2;
      v2->_internal->timeLapseCaptureRate = 2.0;
      v2->_internal->timeLapseCaptureRateNeedsUpdate = 1;
      v2->_internal->supportedDigitalFlashModes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1E424D128, 0);
      v2->_internal->digitalFlashStatus = -1;
      v2->_internal->digitalFlashExposureTimes = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
      v6 = +[AVCapturePhotoSettings photoSettings](AVCapturePhotoSettings, "photoSettings");
      v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
      if ((objc_msgSend(v7, "isEqualToString:", 0x1E4220D28) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", 0x1E4221D68) & 1) != 0
        || objc_msgSend(v7, "isEqualToString:", 0x1E4221D88))
      {
        -[AVCapturePhotoSettings setHDRMode:](v6, "setHDRMode:", 2);
      }
      v12[0] = v6;
      v8 = +[AVCapturePreparedPhotoSettingsArrayRequest preparedPhotoSettingsArrayRequestWithArray:completionHandler:](AVCapturePreparedPhotoSettingsArrayRequest, "preparedPhotoSettingsArrayRequestWithArray:completionHandler:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1), 0);
      v2->_internal->prepareRequests = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v8, 0);
      if (sIsForcedShutterSoundRegion)
      {
        v2->_internal->beginEndIrisMovieCaptureHostTimeQueue = (OS_dispatch_queue *)dispatch_queue_create("avcapturephotooutput-begin-end-iris-movie-capture-host-time-queue", 0);
        v2->_internal->beginEndIrisMovieCaptureHostTimeDispatchGroup = (OS_dispatch_group *)dispatch_group_create();
      }
      v2->_internal->greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
      v2->_internal->zeroShutterLagAutomaticallyEnabled = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureZeroShutterLagAutomaticallyEnabled"));
      v2->_internal->captureReadiness = 1;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

_QWORD *__71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke_4(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result[4] + 16) + 288) > 0;
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result[4] + 16) + 304) > 0;
  return result;
}

id __73__AVCapturePhotoOutput__updateSupportedDigitalFlashModesForSourceDevice___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 120) = result;
  return result;
}

id __66__AVCapturePhotoOutput__updateSupportedFlashModesForSourceDevice___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 112) = result;
  return result;
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04408]), "longLongValue");
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04288]))
    {
      -[AVCapturePhotoOutput _handlePreparationCompleteNotificationWithPayload:settingsID:](self, "_handlePreparationCompleteNotificationWithPayload:settingsID:", a4, v7);
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04280]))
    {
      -[AVCapturePhotoOutput _resetLivePhotoMovieProcessingSuspended](self, "_resetLivePhotoMovieProcessingSuspended");
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04278]))
    {
      -[AVCapturePhotoOutput _resetLivePhotoCaptureSuspended](self, "_resetLivePhotoCaptureSuspended");
    }
    else
    {
      v8 = -[AVCapturePhotoOutput _photoRequestForUniqueID:](self, "_photoRequestForUniqueID:", v7);
      v9 = -[AVCapturePhotoOutput _movieRequestForUniqueID:](self, "_movieRequestForUniqueID:", v7);
      if (v8 | v9)
      {
        if (v8)
        {
          if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D042B0]))
          {
            -[AVCapturePhotoOutput _handleWillBeginCaptureBeforeResolvingSettingsNotificationWithPayload:forRequest:](self, "_handleWillBeginCaptureBeforeResolvingSettingsNotificationWithPayload:forRequest:", a4, v8);
          }
          else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D042A8]))
          {
            -[AVCapturePhotoOutput _handleWillBeginCaptureNotificationWithPayload:forRequest:](self, "_handleWillBeginCaptureNotificationWithPayload:forRequest:", a4, v8);
          }
          else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D042B8]))
          {
            -[AVCapturePhotoOutput _handleWillCaptureStillImageNotificationWithPayload:forRequest:](self, "_handleWillCaptureStillImageNotificationWithPayload:forRequest:", a4, v8);
          }
          else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04258]))
          {
            -[AVCapturePhotoOutput _handleDidCaptureStillImageNotificationWithPayload:forRequest:](self, "_handleDidCaptureStillImageNotificationWithPayload:forRequest:", a4, v8);
          }
          else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04298]))
          {
            -[AVCapturePhotoOutput _handleReadyForResponsiveRequestWithPayload:forRequest:](self, "_handleReadyForResponsiveRequestWithPayload:forRequest:", a4, v8);
          }
          else if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D042A0]) & 1) != 0
                 || (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04290]) & 1) != 0
                 || objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04238]))
          {
            -[AVCapturePhotoOutput _handleStillImageCompleteNotification:withPayload:forRequest:](self, "_handleStillImageCompleteNotification:withPayload:forRequest:", a3, a4, v8);
          }
          else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04270]))
          {
            if (!objc_msgSend((id)objc_msgSend((id)v8, "unresolvedSettings"), "videoFileURL"))
              -[AVCapturePhotoOutput _handleDidRecordIrisMovieNotificationWithPayload:forRequest:](self, "_handleDidRecordIrisMovieNotificationWithPayload:forRequest:", a4, v8);
          }
          else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04260]))
          {
            if (objc_msgSend((id)objc_msgSend((id)v8, "unresolvedSettings"), "videoFileURL"))
              -[AVCapturePhotoOutput _handleDidFinishRecordingVideoNotificationWithPayload:forRequest:](self, "_handleDidFinishRecordingVideoNotificationWithPayload:forRequest:", a4, v8);
            else
              -[AVCapturePhotoOutput _handleDidFinishRecordingIrisMovieNotificationWithPayload:forRequest:](self, "_handleDidFinishRecordingIrisMovieNotificationWithPayload:forRequest:", a4, v8);
          }
        }
        else
        {
          v10 = v9;
          if (v9)
          {
            if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04248]))
            {
              -[AVCapturePhotoOutput _handleDidBeginRecordingMomentCaptureMovieNotificationWithPayload:forRequest:](self, "_handleDidBeginRecordingMomentCaptureMovieNotificationWithPayload:forRequest:", a4, v10);
            }
            else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04270]))
            {
              -[AVCapturePhotoOutput _handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload:forRequest:](self, "_handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload:forRequest:", a4, v10);
            }
            else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04268]))
            {
              -[AVCapturePhotoOutput _handleDidFinishWritingMomentCaptureMovieNotificationWithPayload:forRequest:](self, "_handleDidFinishWritingMomentCaptureMovieNotificationWithPayload:forRequest:", a4, v10);
            }
          }
        }
      }
    }
  }
}

- (void)_handlePreparationCompleteNotificationWithPayload:(id)a3 settingsID:(int64_t)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *prepareRequests;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  AVCapturePhotoOutput *v26;
  int v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04360]), "intValue");
  if ((_DWORD)v7)
    v28 = -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v7, 0);
  else
    v28 = 0;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  MEMORY[0x1A1AF1298](self->_internal->requestsLock);
  v10 = -[NSMutableArray lastObject](self->_internal->prepareRequests, "lastObject");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  prepareRequests = self->_internal->prepareRequests;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](prepareRequests, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v12)
  {
    v13 = v12;
    v26 = self;
    v27 = v7;
    v14 = *(_QWORD *)v34;
LABEL_6:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v14)
        objc_enumerationMutation(prepareRequests);
      v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
      if (objc_msgSend(v16, "requestID") >= (unint64_t)a4)
        break;
      objc_msgSend(v8, "addObject:", v16);
      if (v16 != (void *)v10)
        objc_msgSend(v9, "addObject:", v16);
      if (v13 == ++v15)
      {
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](prepareRequests, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v13)
          goto LABEL_6;
        goto LABEL_20;
      }
    }
    if (objc_msgSend(v16, "requestID") != a4)
    {
LABEL_20:
      v17 = 0;
      LODWORD(v7) = v27;
      self = v26;
      goto LABEL_21;
    }
    v17 = v16;
    self = v26;
    if (v16 != (void *)v10)
      objc_msgSend(v9, "addObject:", v16);
    LODWORD(v7) = v27;
  }
  else
  {
    v17 = 0;
  }
LABEL_21:
  -[NSMutableArray removeObjectsInArray:](self->_internal->prepareRequests, "removeObjectsInArray:", v9);
  MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v8);
        v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if ((objc_msgSend(v22, "isCompleted") & 1) == 0)
        {
          if (objc_msgSend(v22, "completionHandler"))
          {
            v23 = objc_msgSend(v22, "completionHandler");
            (*(void (**)(uint64_t, _QWORD, _QWORD))(v23 + 16))(v23, 0, 0);
          }
          objc_msgSend(v22, "setCompleted:", 1);
        }
      }
      v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v19);
  }
  if ((objc_msgSend(v17, "isCompleted") & 1) == 0)
  {
    if (objc_msgSend(v17, "completionHandler"))
    {
      v24 = objc_msgSend(v17, "completionHandler");
      if ((_DWORD)v7)
        v25 = 0;
      else
        v25 = objc_msgSend(v9, "containsObject:", v17) ^ 1;
      (*(void (**)(uint64_t, uint64_t, id))(v24 + 16))(v24, v25, v28);
    }
    objc_msgSend(v17, "setCompleted:", 1);
  }
  objc_msgSend(v9, "count");

}

uint64_t __34__AVCapturePhotoOutput_isHDRScene__block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1[4] + 16) + 285);
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1[4] + 16) + 276);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 16) + 320), "HDRMode");
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

uint64_t __49__AVCapturePhotoOutput_digitalFlashExposureTimes__block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = *(id *)(*(_QWORD *)(a1[4] + 16) + 312);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[4] + 16) + 296);
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1[4] + 16) + 304);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 16) + 320), "digitalFlashMode");
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = result;
  return result;
}

- (id)_sanitizedSettingsForSettings:(id)a3
{
  NSObject *sceneDetectionObserversDispatchQueue;
  uint64_t v6;
  int64_t maxPhotoQualityPrioritization;
  id v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  _QWORD v15[10];
  _QWORD v16[3];
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__AVCapturePhotoOutput__sanitizedSettingsForSettings___block_invoke;
  v15[3] = &unk_1E421D668;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = &v26;
  v15[7] = &v22;
  v15[8] = &v18;
  v15[9] = v16;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v15);
  if (!*((_BYTE *)v19 + 24) && !self->_internal->highPhotoQualitySupported)
  {
    maxPhotoQualityPrioritization = 1;
    goto LABEL_6;
  }
  v6 = objc_msgSend(a3, "photoQualityPrioritization");
  maxPhotoQualityPrioritization = self->_internal->maxPhotoQualityPrioritization;
  if (v6 > maxPhotoQualityPrioritization)
LABEL_6:
    objc_msgSend(a3, "_setPhotoQualityPrioritization:", maxPhotoQualityPrioritization);
  v8 = -[AVCaptureConnection sourceDeviceInput](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDeviceInput");
  v9 = (void *)objc_msgSend(v8, "device");
  if (objc_msgSend(v9, "isCenterStageActive"))
    v10 = objc_msgSend(v8, "isCenterStageAllowed");
  else
    v10 = 0;
  if (objc_msgSend(v9, "isBackgroundBlurActive"))
    v11 = objc_msgSend(v8, "isBackgroundBlurAllowed");
  else
    v11 = 0;
  if (objc_msgSend(v9, "isStudioLightActive"))
    v12 = objc_msgSend(v8, "isStudioLightingAllowed");
  else
    v12 = 0;
  v13 = objc_msgSend(v9, "isBackgroundReplacementActive");
  if (v13)
    v13 = objc_msgSend(v8, "isBackgroundReplacementAllowed");
  if (((v10 | v11 | v12) & 1) != 0 || v13)
    objc_msgSend(a3, "_setPhotoQualityPrioritization:", 1);
  if (self->_internal->highPhotoQualitySupported
    && objc_msgSend(a3, "photoQualityPrioritization") == 3
    && (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureHighPhotoQualityFrameDropAllowed")) & 1) == 0)
  {
    objc_msgSend(a3, "_setPhotoQualityPrioritization:", 2);
  }
  if (self->_internal->depthDataDeliveryEnabled
    && objc_msgSend(a3, "photoQualityPrioritization") == 3
    && (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureDepthWithDeepFusionSupported")) & 1) == 0)
  {
    objc_msgSend(a3, "_setPhotoQualityPrioritization:", 2);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a3, "_setPhotoQualityPrioritization:", 1);
  if (!self->_internal->virtualDeviceFusionSupported)
    objc_msgSend(a3, "setAutoVirtualDeviceFusionEnabled:", 0);
  if (!*((_BYTE *)v23 + 24))
    objc_msgSend(a3, "setHDRMode:", 0);
  if (!*((_BYTE *)v27 + 24))
    objc_msgSend(a3, "setFlashMode:", 0);
  if (objc_msgSend(a3, "flashMode") == 2 && objc_msgSend(a3, "isConstantColorEnabled"))
    objc_msgSend(a3, "setFlashMode:", 1);
  if (!objc_msgSend(a3, "HDRMode"))
    objc_msgSend(a3, "setEV0PhotoDeliveryEnabled:", 0);
  if (AVCIFilterArrayContainsPortraitFilters((void *)objc_msgSend(a3, "adjustedPhotoFilters")))
    objc_msgSend(a3, "setAutoVirtualDeviceFusionEnabled:", 0);
  if (objc_msgSend(a3, "rawPhotoPixelFormatType"))
  {
    if (+[AVCapturePhotoOutput isAppleProRAWPixelFormat:](AVCapturePhotoOutput, "isAppleProRAWPixelFormat:", objc_msgSend(a3, "rawPhotoPixelFormatType")))
    {
      objc_msgSend(a3, "setLivePhotoMovieFileURL:", 0);
      objc_msgSend(a3, "setAutoContentAwareDistortionCorrectionEnabled:", 0);
      objc_msgSend(a3, "setAutoRedEyeReductionEnabled:", 0);
      objc_msgSend(a3, "setDepthDataDeliveryEnabled:", 0);
      objc_msgSend(a3, "setPortraitEffectsMatteDeliveryEnabled:", 0);
      objc_msgSend(a3, "setEnabledSemanticSegmentationMatteTypes:", MEMORY[0x1E0C9AA60]);
    }
    else if (!objc_msgSend(a3, "formatFourCC"))
    {
      objc_msgSend(a3, "setTurboModeEnabled:", 1);
      objc_msgSend(a3, "setProcessedPhotoZoomWithoutUpscalingEnabled:", 0);
    }
  }
  if (objc_msgSend((id)objc_msgSend(a3, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count"))
    objc_msgSend(a3, "setAutoVirtualDeviceFusionEnabled:", 0);
  if ((objc_msgSend(a3, "isDepthDataDeliveryEnabled") & 1) == 0)
  {
    objc_msgSend(a3, "setEmbedsDepthDataInPhoto:", 0);
    objc_msgSend(a3, "setDepthDataFiltered:", 0);
  }
  if ((objc_msgSend(a3, "isPortraitEffectsMatteDeliveryEnabled") & 1) == 0)
    objc_msgSend(a3, "setEmbedsPortraitEffectsMatteInPhoto:", 0);
  if (!objc_msgSend((id)objc_msgSend(a3, "enabledSemanticSegmentationMatteTypes"), "count"))
    objc_msgSend(a3, "setEmbedsSemanticSegmentationMattesInPhoto:", 0);
  if (objc_msgSend(a3, "livePhotoMovieFileURL"))
  {
    objc_msgSend(a3, "setSquareCropEnabled:", 0);
    objc_msgSend(a3, "setShutterSound:", 0);
  }
  if (!objc_msgSend(a3, "livePhotoMovieFileURL"))
  {
    objc_msgSend(a3, "setLivePhotoMovieMetadata:", 0);
    objc_msgSend(a3, "setLivePhotoMovieFileURLForOriginalPhoto:", 0);
    objc_msgSend(a3, "setLivePhotoMovieMetadataForOriginalPhoto:", 0);
  }
  if ((objc_msgSend(a3, "isEV0PhotoDeliveryEnabled") & 1) == 0)
  {
    objc_msgSend(a3, "setLivePhotoMovieFileURLForOriginalPhoto:", 0);
    objc_msgSend(a3, "setLivePhotoMovieMetadataForOriginalPhoto:", 0);
  }
  if (objc_msgSend(a3, "isBurstQualityCaptureEnabled"))
  {
    objc_msgSend(a3, "setHDRMode:", 0);
    objc_msgSend(a3, "_setPhotoQualityPrioritization:", 1);
    objc_msgSend(a3, "setAutoVirtualDeviceFusionEnabled:", 0);
    objc_msgSend(a3, "setFlashMode:", 0);
    objc_msgSend(a3, "setConstantColorEnabled:", 0);
    objc_msgSend(a3, "setLivePhotoMovieFileURL:", 0);
  }
  if (objc_msgSend(a3, "digitalFlashMode"))
    objc_msgSend(a3, "setShutterSound:", 1119);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return a3;
}

- (void)setLivePhotoCaptureSuspended:(BOOL)livePhotoCaptureSuspended
{
  _BOOL4 v3;
  OpaqueCMClock *HostTimeClock;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t *v7;
  uint64_t v8;
  AVCapturePhotoOutputInternal *internal;
  NSObject *beginEndIrisMovieCaptureHostTimeDispatchGroup;
  NSObject *beginEndIrisMovieCaptureHostTimeQueue;
  void *v12;
  OpaqueCMClock *v13;
  CMTime v14;
  _QWORD block[6];
  os_log_type_t type;
  int v17;
  CMTime v18;
  uint64_t v19;

  v3 = livePhotoCaptureSuspended;
  v19 = *MEMORY[0x1E0C80C00];
  memset(&v18, 0, sizeof(v18));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v18, HostTimeClock);
  if (dword_1ECFED660)
  {
    v17 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!v3)
  {
    v7 = (uint64_t *)MEMORY[0x1E0D042C0];
LABEL_7:
    self->_internal->livePhotoCaptureSuspended = v3;
    v8 = *v7;
    if (*v7)
    {
      if (sIsForcedShutterSoundRegion)
      {
        internal = self->_internal;
        beginEndIrisMovieCaptureHostTimeQueue = internal->beginEndIrisMovieCaptureHostTimeQueue;
        beginEndIrisMovieCaptureHostTimeDispatchGroup = internal->beginEndIrisMovieCaptureHostTimeDispatchGroup;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __53__AVCapturePhotoOutput_setLivePhotoCaptureSuspended___block_invoke;
        block[3] = &unk_1E4216650;
        block[4] = self;
        block[5] = v8;
        dispatch_group_async(beginEndIrisMovieCaptureHostTimeDispatchGroup, beginEndIrisMovieCaptureHostTimeQueue, block);
      }
      else
      {
        v13 = CMClockGetHostTimeClock();
        CMClockGetTime(&v14, v13);
        -[AVCapturePhotoOutput setFigCaptureSessionSectionProperty:withHostTime:](self, "setFigCaptureSessionSectionProperty:withHostTime:", v8, &v14);
      }
    }
    return;
  }
  if (-[AVCapturePhotoOutput isLivePhotoCaptureEnabled](self, "isLivePhotoCaptureEnabled"))
  {
    v7 = (uint64_t *)MEMORY[0x1E0D042C8];
    goto LABEL_7;
  }
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v12);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
}

- (void)setEnabledSemanticSegmentationMatteTypes:(NSArray *)enabledSemanticSegmentationMatteTypes
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  if (!enabledSemanticSegmentationMatteTypes)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v8 = AVMethodExceptionReasonWithObjectAndSelector();
    v9 = v11;
    v10 = v12;
    goto LABEL_5;
  }
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:");
  objc_msgSend(v5, "minusSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[AVCapturePhotoOutput availableSemanticSegmentationMatteTypes](self, "availableSemanticSegmentationMatteTypes")));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v15 = v5;
    v8 = AVMethodExceptionReasonWithObjectAndSelector();
    v9 = v6;
    v10 = v7;
LABEL_5:
    v13 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v8, 0, v15);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v13);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
    return;
  }
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_internal->enabledSemanticSegmentationTypes);
  if ((objc_msgSend(v14, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", enabledSemanticSegmentationMatteTypes)) & 1) == 0)
  {

    self->_internal->enabledSemanticSegmentationTypes = (NSArray *)-[NSArray copy](enabledSemanticSegmentationMatteTypes, "copy");
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (NSArray)availableSemanticSegmentationMatteTypes
{
  return self->_internal->availableSemanticSegmentationTypes;
}

uint64_t __54__AVCapturePhotoOutput__sanitizedSettingsForSettings___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 112), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "flashMode")));
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 96), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "HDRMode")));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 89);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
                                                                        + 432);
  return result;
}

- (void)setDigitalFlashCaptureEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCapturePhotoOutputInternal *internal;
  void *v6;

  v3 = a3;
  if (a3
    && (unint64_t)objc_msgSend(-[AVCapturePhotoOutput supportedDigitalFlashModes](self, "supportedDigitalFlashModes"), "count") <= 1)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->digitalFlashCaptureEnabled != v3)
    {
      internal->digitalFlashCaptureEnabled = v3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (void)setAppleProRAWEnabled:(BOOL)appleProRAWEnabled
{
  _BOOL4 v3;
  AVCapturePhotoOutputInternal *internal;
  id v6;
  void *v7;

  v3 = appleProRAWEnabled;
  if (appleProRAWEnabled && !-[AVCapturePhotoOutput isAppleProRAWSupported](self, "isAppleProRAWSupported"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else
  {
    internal = self->_internal;
    if (internal->appleProRAWEnabled != v3)
    {
      internal->appleProRAWEnabled = v3;
      v6 = -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice");
      -[AVCapturePhotoOutput _updateAvailableRawPhotoPixelFormatTypesForSourceDevice:](self, "_updateAvailableRawPhotoPixelFormatTypesForSourceDevice:", v6);
      -[AVCapturePhotoOutput _updateAvailableRawPhotoFileTypesForSourceDevice:](self, "_updateAvailableRawPhotoFileTypesForSourceDevice:", v6);
      -[AVCapturePhotoOutput _updateVirtualDeviceConstituentPhotoDeliveryAndDualCameraDualPhotoDeliverySupportedForSourceDevice:](self, "_updateVirtualDeviceConstituentPhotoDeliveryAndDualCameraDualPhotoDeliverySupportedForSourceDevice:", v6);
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (int64_t)digitalFlashStatus
{
  AVCapturePhotoOutputInternal *internal;
  NSObject *sceneDetectionObserversDispatchQueue;
  int64_t v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  internal = self->_internal;
  v11 = 0;
  sceneDetectionObserversDispatchQueue = internal->sceneDetectionObserversDispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__AVCapturePhotoOutput_digitalFlashStatus__block_invoke;
  v7[3] = &unk_1E4217B78;
  v7[4] = self;
  v7[5] = &v16;
  v7[6] = &v12;
  v7[7] = &v8;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v7);
  if (v9[3])
  {
    if (*((_DWORD *)v13 + 6))
    {
      v5 = v17[3];
    }
    else
    {
      v5 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "_digitalFlashStatus");
      v17[3] = v5;
    }
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v5;
}

- (BOOL)isHDRScene
{
  AVCapturePhotoOutputInternal *internal;
  NSObject *sceneDetectionObserversDispatchQueue;
  char v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  internal = self->_internal;
  v11 = 0;
  sceneDetectionObserversDispatchQueue = internal->sceneDetectionObserversDispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__AVCapturePhotoOutput_isHDRScene__block_invoke;
  v7[3] = &unk_1E4217B78;
  v7[4] = self;
  v7[5] = &v16;
  v7[6] = &v12;
  v7[7] = &v8;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v7);
  if (v9[3])
  {
    if (*((_DWORD *)v13 + 6))
    {
      v5 = *((_BYTE *)v17 + 24) != 0;
    }
    else
    {
      v5 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "_isHighDynamicRangeScene");
      *((_BYTE *)v17 + 24) = v5;
    }
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v5;
}

- (void)setSpatialOverCaptureEnabled:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;
  void *v4;

  internal = self->_internal;
  if (a3 && !internal->spatialOverCaptureSupported)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else if (internal->spatialOverCaptureEnabled != a3)
  {
    internal->spatialOverCaptureEnabled = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;
  void *v5;

  internal = self->_internal;
  if (internal->semanticStyleRenderingSupported || !a3)
  {
    if (internal->semanticStyleRenderingEnabled != a3)
    {
      internal->semanticStyleRenderingEnabled = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (void)setMovieRecordingEnabled:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;
  void *v4;
  uint64_t v5;
  void *v6;

  internal = self->_internal;
  if (a3)
  {
    if (internal->videoCaptureEnabled)
    {
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99778];
LABEL_4:
      v6 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v6);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
      return;
    }
    if (!internal->movieRecordingSupported)
    {
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99778];
      goto LABEL_4;
    }
  }
  if (internal->movieRecordingEnabled != a3)
  {
    internal->movieRecordingEnabled = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (id)digitalFlashExposureTimes
{
  NSObject *sceneDetectionObserversDispatchQueue;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__AVCapturePhotoOutput_digitalFlashExposureTimes__block_invoke;
  v11[3] = &unk_1E421D578;
  v11[4] = self;
  v11[5] = &v24;
  v11[6] = &v20;
  v11[7] = &v16;
  v11[8] = &v12;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v11);
  if (v13[3] && v21[3])
  {
    if (*((_DWORD *)v17 + 6))
    {
      v4 = (id)v25[5];
    }
    else
    {
      v6 = -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice");

      v4 = (id)objc_msgSend(v6, "_digitalFlashExposureTimes");
      v25[5] = (uint64_t)v4;
    }
    if (objc_msgSend(v4, "count"))
    {
      v30[0] = &unk_1E424D158;
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)objc_msgSend((id)v25[5], "objectForKeyedSubscript:", *MEMORY[0x1E0D04E68]), "doubleValue");
      v8 = objc_msgSend(v7, "numberWithDouble:");
      v30[1] = &unk_1E424D170;
      v31[0] = v8;
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)objc_msgSend((id)v25[5], "objectForKeyedSubscript:", *MEMORY[0x1E0D04E60]), "doubleValue");
      v31[1] = objc_msgSend(v9, "numberWithDouble:");
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {

    v5 = (void *)MEMORY[0x1E0C9AA70];
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v5;
}

uint64_t __70__AVCapturePhotoOutput_setFigCaptureSessionSectionProperty_withValue___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);

  if (a2)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v5 = *(_QWORD *)(v3 + 40);
    v6 = *(_QWORD *)(v3 + 48);
    result = CMBaseObjectGetVTable();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(result + 16) + 8);
    if (v7)
      return v7(a2, v4, v5, v6);
  }
  return result;
}

- (void)dealloc
{
  AVCapturePhotoOutputInternal *internal;
  NSObject *beginEndIrisMovieCaptureHostTimeDispatchGroup;
  dispatch_time_t v5;
  objc_super v6;

  internal = self->_internal;
  if (internal)
  {

    while (-[NSMutableArray count](self->_internal->readinessCoordinators, "count"))
      -[AVCapturePhotoOutput _removeReadinessCoordinator:](self, "_removeReadinessCoordinator:", -[NSMutableArray lastObject](self->_internal->readinessCoordinators, "lastObject"));

    if (sIsForcedShutterSoundRegion)
    {
      beginEndIrisMovieCaptureHostTimeDispatchGroup = self->_internal->beginEndIrisMovieCaptureHostTimeDispatchGroup;
      v5 = dispatch_time(0, 5000000000);
      dispatch_group_wait(beginEndIrisMovieCaptureHostTimeDispatchGroup, v5);

    }
    FigSimpleMutexDestroy();

    ct_green_tea_logger_destroy();
  }
  v6.receiver = self;
  v6.super_class = (Class)AVCapturePhotoOutput;
  -[AVCaptureOutput dealloc](&v6, sel_dealloc);
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  objc_super v7;

  -[AVCapturePhotoOutput _decrementObserverCountForKeyPath:](self, "_decrementObserverCountForKeyPath:", a4);
  v7.receiver = self;
  v7.super_class = (Class)AVCapturePhotoOutput;
  -[AVCapturePhotoOutput removeObserver:forKeyPath:](&v7, sel_removeObserver_forKeyPath_, a3, a4);
}

- (void)capturePhotoWithSettings:(AVCapturePhotoSettings *)settings delegate:(id)delegate
{
  uint64_t v4;
  AVCaptureConnection *v8;
  id v9;
  NSObject *beginEndIrisMovieCaptureHostTimeDispatchGroup;
  dispatch_time_t v11;
  void *v12;
  NSObject *CTGreenTeaOsLogHandle;
  NSObject *v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD v17[8];
  uint8_t buf[16];
  const __CFString *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19 = 0;
  if (!delegate)
  {
    v15 = CFSTR("Nil delegate");
LABEL_20:
    v19 = v15;
LABEL_11:
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v12);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
    goto LABEL_13;
  }
  v8 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]);
  if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", v8) & 1) == 0)
  {
    v15 = CFSTR("No active and enabled video connection");
    goto LABEL_20;
  }
  if (-[AVCapturePhotoSettings isAutoSpatialOverCaptureEnabled](settings, "isAutoSpatialOverCaptureEnabled"))
  {
    v15 = CFSTR("autoSpatialOverCaptureEnabled is not supported through this interface. Use beginMomentCapture...");
    goto LABEL_20;
  }
  if (!self->_internal->optimizesImagesForOfflineVideoStabilization)
  {
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
    v14 = CTGreenTeaOsLogHandle;
    if (CTGreenTeaOsLogHandle)
    {
      if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EDF1000, v14, OS_LOG_TYPE_INFO, "Take a photo", buf, 2u);
      }
    }
  }
  v9 = (id)-[AVCapturePhotoSettings copy](settings, "copy");
  if (po_photoSettingsAreValid(v9, (uint64_t)delegate, self, v8, &v19))
  {
    if (sIsForcedShutterSoundRegion)
    {
      beginEndIrisMovieCaptureHostTimeDispatchGroup = self->_internal->beginEndIrisMovieCaptureHostTimeDispatchGroup;
      v11 = dispatch_time(0, 2000000000);
      dispatch_group_wait(beginEndIrisMovieCaptureHostTimeDispatchGroup, v11);
    }
    self->_internal->lastSettingsUniqueID = objc_msgSend(v9, "uniqueID");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__AVCapturePhotoOutput_capturePhotoWithSettings_delegate___block_invoke;
    v17[3] = &unk_1E421D528;
    v17[4] = self;
    v17[5] = v9;
    v17[6] = delegate;
    v17[7] = &v20;
    -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v17);
    v24 = *MEMORY[0x1E0CF2A88];
    v25[0] = &unk_1E424D140;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    if (!*((_BYTE *)v21 + 24))
    {
      LODWORD(v16) = 0;
      FigDebugAssert3();
      -[AVCapturePhotoOutput _dispatchFailureCallbacksForPhotoSettings:toDelegate:withError:](self, "_dispatchFailureCallbacksForPhotoSettings:toDelegate:withError:", settings, delegate, AVLocalizedError(), v16, v4);
    }
  }
  if (v19)
    goto LABEL_11;
LABEL_13:
  _Block_object_dispose(&v20, 8);
}

uint64_t __58__AVCapturePhotoOutput_capturePhotoWithSettings_delegate___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  AVCapturePhotoRequest *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, void *);
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = a2 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v3 = result;
    v4 = (void *)objc_msgSend(*(id *)(result + 32), "_figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:captureRequestIdentifier:delegate:connections:", *(_QWORD *)(result + 40), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), *(_QWORD *)(v3 + 48), objc_msgSend(*(id *)(v3 + 32), "connections"));
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 144) != 0;
    v6 = +[AVCapturePhotoRequest requestWithDelegate:settings:lensStabilizationSupported:](AVCapturePhotoRequest, "requestWithDelegate:settings:lensStabilizationSupported:", *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 40), v5);
    MEMORY[0x1A1AF1298](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 328));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 336), "addObject:", v6);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 460);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 464) = objc_msgSend(v4, "settingsID");
    if (!+[AVCapturePhotoOutputReadinessCoordinator _isOverlappingCaptureSupportedForPhotoSettings:autoDeferredPhotoDeliveryEnabled:responsiveCaptureEnabled:](AVCapturePhotoOutputReadinessCoordinator, "_isOverlappingCaptureSupportedForPhotoSettings:autoDeferredPhotoDeliveryEnabled:responsiveCaptureEnabled:", *(_QWORD *)(v3 + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 433), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 440)))*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 472) = objc_msgSend(v4, "settingsID");
    MEMORY[0x1A1AF12A4](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 328));
    objc_msgSend(*(id *)(v3 + 32), "_updateCaptureReadiness");
    v7 = objc_msgSend(*(id *)(v3 + 32), "sinkID");
    v8 = *(uint64_t (**)(uint64_t, uint64_t, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 96);
    if (v8)
    {
      return v8(a2, v7, v4);
    }
    else
    {
      v9 = *MEMORY[0x1E0D04368];
      v10[0] = &unk_1E424D2A8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (NSArray)preparedPhotoSettingsArray
{
  void *v3;
  NSArray *v4;

  MEMORY[0x1A1AF1298](self->_internal->requestsLock, a2);
  v3 = (void *)-[NSMutableArray lastObject](self->_internal->prepareRequests, "lastObject");
  v4 = (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", objc_msgSend(v3, "photoSettingsArray"), 1);
  MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  return v4;
}

uint64_t __72__AVCapturePhotoOutput_setPreparedPhotoSettingsArray_completionHandler___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  _QWORD v11[2];

  v2 = result;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = objc_msgSend(*(id *)(result + 32), "_figCaptureIrisPreparedSettingsForRequest:", *(_QWORD *)(result + 40));
    v5 = objc_msgSend(*(id *)(v2 + 32), "sinkID");
    v6 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
    if (*(_QWORD *)(v6 + 96))
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 104))(a2, v5, v4);
    }
    else
    {
      v10 = *MEMORY[0x1E0D04368];
      v11[0] = &unk_1E424D2A8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  else
  {
    v7 = *(_QWORD *)(result + 48);
    if (v7 >= 1)
    {
      v8 = *(void **)(result + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __72__AVCapturePhotoOutput_setPreparedPhotoSettingsArray_completionHandler___block_invoke_3;
      v9[3] = &unk_1E4216650;
      v9[4] = v8;
      v9[5] = v7;
      return objc_msgSend(v8, "performBlockOnSessionNotifyingThread:", v9);
    }
  }
  return result;
}

uint64_t __72__AVCapturePhotoOutput_setPreparedPhotoSettingsArray_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePreparationCompleteNotificationWithPayload:settingsID:", 0, *(_QWORD *)(a1 + 40));
}

- (NSArray)availablePhotoPixelFormatTypes
{
  return self->_internal->availablePhotoPixelFormatTypes;
}

- (NSArray)availablePhotoCodecTypes
{
  return self->_internal->availablePhotoCodecTypes;
}

+ (BOOL)isBayerRawPixelFormat:(unsigned int)a3
{
  return +[AVCapturePhotoOutput isBayerRAWPixelFormat:](AVCapturePhotoOutput, "isBayerRAWPixelFormat:", *(_QWORD *)&a3);
}

+ (BOOL)isAppleProRAWPixelFormat:(OSType)pixelFormat
{
  return pixelFormat == 1815491698;
}

+ (BOOL)isDemosaicedRawPixelFormat:(unsigned int)a3
{
  return +[AVCapturePhotoOutput isAppleProRAWPixelFormat:](AVCapturePhotoOutput, "isAppleProRAWPixelFormat:", *(_QWORD *)&a3);
}

- (NSArray)availableRawPhotoPixelFormatTypes
{
  return -[NSDictionary allKeys](self->_internal->availableRawPhotoPixelFormatTypes, "allKeys");
}

- (NSArray)availablePhotoFileTypes
{
  return self->_internal->availablePhotoFileTypes;
}

- (NSArray)availableRawPhotoFileTypes
{
  return self->_internal->availableRawPhotoFileTypes;
}

- (NSArray)availableRawPhotoCodecTypes
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQLBZEVZETJU77LU4MEZH4LWJ54M")))
  {
    v7 = *MEMORY[0x1E0CF2C90];
    v8 = AVStringForOSType();
    v2 = (void *)MEMORY[0x1E0C99D20];
    v3 = &v7;
    v4 = 2;
  }
  else
  {
    v6 = *MEMORY[0x1E0CF2C90];
    v2 = (void *)MEMORY[0x1E0C99D20];
    v3 = &v6;
    v4 = 1;
  }
  return (NSArray *)objc_msgSend(v2, "arrayWithObjects:count:", v3, v4, v6, v7, v8, v9);
}

- (id)supportedRawPhotoCodecTypesForRawPhotoPixelFormatType:(unsigned int)a3 fileType:(id)a4
{
  uint64_t v4;
  _QWORD v7[2];

  v4 = *(_QWORD *)&a3;
  v7[1] = *MEMORY[0x1E0C80C00];
  if (!-[NSArray containsObject:](-[AVCapturePhotoOutput availableRawPhotoFileTypes](self, "availableRawPhotoFileTypes"), "containsObject:", a4))return (id)MEMORY[0x1E0C9AA60];
  if (+[AVCapturePhotoOutput isAppleProRAWPixelFormat:](AVCapturePhotoOutput, "isAppleProRAWPixelFormat:", v4))
  {
    return -[AVCapturePhotoOutput availableRawPhotoCodecTypes](self, "availableRawPhotoCodecTypes");
  }
  if (!+[AVCapturePhotoOutput isBayerRAWPixelFormat:](AVCapturePhotoOutput, "isBayerRAWPixelFormat:", v4))
    return (id)MEMORY[0x1E0C9AA60];
  v7[0] = *MEMORY[0x1E0CF2C90];
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
}

- (NSArray)supportedPhotoPixelFormatTypesForFileType:(AVFileType)fileType
{
  if (-[NSArray containsObject:](-[AVCapturePhotoOutput availablePhotoFileTypes](self, "availablePhotoFileTypes"), "containsObject:", fileType)&& -[NSString isEqualToString:](fileType, "isEqualToString:", *MEMORY[0x1E0CF2B10]))
  {
    return -[AVCapturePhotoOutput availablePhotoPixelFormatTypes](self, "availablePhotoPixelFormatTypes");
  }
  else
  {
    return (NSArray *)MEMORY[0x1E0C9AA60];
  }
}

- (NSArray)supportedPhotoCodecTypesForFileType:(AVFileType)fileType
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[NSArray containsObject:](-[AVCapturePhotoOutput availablePhotoFileTypes](self, "availablePhotoFileTypes"), "containsObject:", fileType))
  {
    if (-[NSString isEqualToString:](fileType, "isEqualToString:", *MEMORY[0x1E0CF2AF8]))
    {
      v8[0] = *MEMORY[0x1E0CF2C90];
      v4 = v8;
      return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1, v6, v7, v8[0]);
    }
    if (-[NSString isEqualToString:](fileType, "isEqualToString:", *MEMORY[0x1E0CF2AE8]))
    {
      v7 = *MEMORY[0x1E0CF2C88];
      v4 = &v7;
      return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1, v6, v7, v8[0]);
    }
    if (-[NSString isEqualToString:](fileType, "isEqualToString:", *MEMORY[0x1E0CF2AF0]))
    {
      v6 = *MEMORY[0x1E0CF2C88];
      v4 = &v6;
      return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1, v6, v7, v8[0]);
    }
  }
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)supportedRawPhotoPixelFormatTypesForFileType:(AVFileType)fileType
{
  if (-[NSArray containsObject:](-[AVCapturePhotoOutput availableRawPhotoFileTypes](self, "availableRawPhotoFileTypes"), "containsObject:", fileType))
  {
    return -[AVCapturePhotoOutput availableRawPhotoPixelFormatTypes](self, "availableRawPhotoPixelFormatTypes");
  }
  else
  {
    return (NSArray *)MEMORY[0x1E0C9AA60];
  }
}

- (BOOL)isEV0PhotoDeliverySupported
{
  NSObject *sceneDetectionObserversDispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AVCapturePhotoOutput_isEV0PhotoDeliverySupported__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__AVCapturePhotoOutput_isEV0PhotoDeliverySupported__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16)
                                                                            + 104);
  return result;
}

- (BOOL)isStillImageStabilizationScene
{
  AVCapturePhotoOutputInternal *internal;
  NSObject *sceneDetectionObserversDispatchQueue;
  char v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  internal = self->_internal;
  v11 = 0;
  sceneDetectionObserversDispatchQueue = internal->sceneDetectionObserversDispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__AVCapturePhotoOutput_isStillImageStabilizationScene__block_invoke;
  v7[3] = &unk_1E4217B78;
  v7[4] = self;
  v7[5] = &v16;
  v7[6] = &v12;
  v7[7] = &v8;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v7);
  if (*((_BYTE *)v9 + 24))
  {
    if (*((_DWORD *)v13 + 6))
    {
      v5 = *((_BYTE *)v17 + 24) != 0;
    }
    else
    {
      v5 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "_isStillImageStabilizationScene");
      *((_BYTE *)v17 + 24) = v5;
    }
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v5;
}

uint64_t __54__AVCapturePhotoOutput_isStillImageStabilizationScene__block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1[4] + 16) + 286);
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1[4] + 16) + 280);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 16) + 320), "isAutoStillImageStabilizationEnabled");
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (BOOL)isAutoRedEyeReductionSupported
{
  return self->_internal->autoRedEyeReductionSupported;
}

- (BOOL)isFlashScene
{
  AVCapturePhotoOutputInternal *internal;
  NSObject *sceneDetectionObserversDispatchQueue;
  char v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  internal = self->_internal;
  v11 = 0;
  sceneDetectionObserversDispatchQueue = internal->sceneDetectionObserversDispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__AVCapturePhotoOutput_isFlashScene__block_invoke;
  v7[3] = &unk_1E4217B78;
  v7[4] = self;
  v7[5] = &v16;
  v7[6] = &v12;
  v7[7] = &v8;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v7);
  if (v9[3])
  {
    if (*((_DWORD *)v13 + 6))
    {
      v5 = *((_BYTE *)v17 + 24) != 0;
    }
    else
    {
      v5 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "_isFlashScene");
      *((_BYTE *)v17 + 24) = v5;
    }
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v5;
}

uint64_t __36__AVCapturePhotoOutput_isFlashScene__block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1[4] + 16) + 284);
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1[4] + 16) + 272);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 16) + 320), "flashMode");
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (BOOL)isVirtualDeviceFusionSupported
{
  return self->_internal->virtualDeviceFusionSupported;
}

- (BOOL)isDualCameraFusionSupported
{
  return self->_internal->virtualDeviceFusionSupported;
}

- (BOOL)isVirtualDeviceConstituentPhotoDeliverySupported
{
  return self->_internal->virtualDeviceConstituentPhotoDeliverySupported;
}

- (BOOL)isDualCameraDualPhotoDeliverySupported
{
  return self->_internal->dualCameraDualPhotoDeliverySupported;
}

- (void)setVirtualDeviceConstituentPhotoDeliveryEnabled:(BOOL)virtualDeviceConstituentPhotoDeliveryEnabled
{
  _BOOL4 v3;
  AVCapturePhotoOutputInternal *internal;
  AVCapturePhotoOutputInternal *v6;
  id v7;
  void *v8;

  v3 = virtualDeviceConstituentPhotoDeliveryEnabled;
  if (virtualDeviceConstituentPhotoDeliveryEnabled
    && !-[AVCapturePhotoOutput isVirtualDeviceConstituentPhotoDeliverySupported](self, "isVirtualDeviceConstituentPhotoDeliverySupported"))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
  else
  {
    internal = self->_internal;
    if (internal->virtualDeviceConstituentPhotoDeliveryEnabled != v3)
    {
      if (internal->dualCameraDualPhotoDeliverySupported)
      {
        -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("dualCameraDualPhotoDeliveryEnabled"));
        internal = self->_internal;
      }
      internal->virtualDeviceConstituentPhotoDeliveryEnabled = v3;
      v6 = self->_internal;
      if (v6->dualCameraDualPhotoDeliverySupported)
        v6->dualCameraDualPhotoDeliveryEnabled = v3;
      v7 = -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice");
      -[AVCapturePhotoOutput _updateCameraCalibrationDataDeliverySupportedForSourceDevice:](self, "_updateCameraCalibrationDataDeliverySupportedForSourceDevice:", v7);
      if (self->_internal->dualCameraDualPhotoDeliverySupported)
        -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("dualCameraDualPhotoDeliveryEnabled"));
      -[AVCapturePhotoOutput _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:](self, "_updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:", v7);
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isDualCameraDualPhotoDeliveryEnabled
{
  return self->_internal->dualCameraDualPhotoDeliveryEnabled;
}

- (void)setDualCameraDualPhotoDeliveryEnabled:(BOOL)dualCameraDualPhotoDeliveryEnabled
{
  _BOOL4 v3;
  void *v5;

  v3 = dualCameraDualPhotoDeliveryEnabled;
  if (dualCameraDualPhotoDeliveryEnabled
    && !-[AVCapturePhotoOutput isDualCameraDualPhotoDeliverySupported](self, "isDualCameraDualPhotoDeliverySupported"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
  else if (self->_internal->dualCameraDualPhotoDeliveryEnabled != v3)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("virtualDeviceConstituentPhotoDeliveryEnabled"));
    self->_internal->dualCameraDualPhotoDeliveryEnabled = v3;
    self->_internal->virtualDeviceConstituentPhotoDeliveryEnabled = v3;
    -[AVCapturePhotoOutput _updateCameraCalibrationDataDeliverySupportedForSourceDevice:](self, "_updateCameraCalibrationDataDeliverySupportedForSourceDevice:", -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"));
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("virtualDeviceConstituentPhotoDeliveryEnabled"));
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (BOOL)isCameraCalibrationDataDeliverySupported
{
  return self->_internal->cameraCalibrationDataDeliverySupported;
}

- (BOOL)isFocusPixelBlurScoreSupported
{
  return self->_internal->focusPixelFocusBlurScoreSupported;
}

- (void)setFocusPixelBlurScoreEnabled:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;
  void *v4;

  internal = self->_internal;
  if (a3 && !internal->focusPixelFocusBlurScoreSupported)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else if (internal->focusPixelFocusBlurScoreEnabled != a3)
  {
    internal->focusPixelFocusBlurScoreEnabled = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (BOOL)arePrivatePhotoDimensionsEnabled
{
  return self->_internal->privatePhotoDimensionsEnabled;
}

- (void)setExifFocalLengthsByZoomFactor:(id)a3
{
  NSDictionary *exifFocalLengthsByZoomFactor;

  exifFocalLengthsByZoomFactor = self->_internal->exifFocalLengthsByZoomFactor;
  if (exifFocalLengthsByZoomFactor != a3)
  {

    self->_internal->exifFocalLengthsByZoomFactor = (NSDictionary *)objc_msgSend(a3, "copy");
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (id)exifFocalLengthsByZoomFactor
{
  return (id)-[NSDictionary copy](self->_internal->exifFocalLengthsByZoomFactor, "copy");
}

- (BOOL)isHighResolutionCaptureEnabled
{
  return self->_internal->highResolutionCaptureEnabled;
}

- (NSUInteger)maxBracketedCapturePhotoCount
{
  AVCapturePhotoOutputInternal *internal;
  NSUInteger maxBracketedCapturePhotoCount;

  MEMORY[0x1A1AF1298](self->_internal->requestsLock, a2);
  internal = self->_internal;
  maxBracketedCapturePhotoCount = internal->maxBracketedCapturePhotoCount;
  MEMORY[0x1A1AF12A4](internal->requestsLock);
  return maxBracketedCapturePhotoCount;
}

- (BOOL)isLensStabilizationDuringBracketedCaptureSupported
{
  return self->_internal->lensStabilizationDuringBracketedCaptureSupported;
}

uint64_t __53__AVCapturePhotoOutput_setLivePhotoCaptureSuspended___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  OpaqueCMClock *HostTimeClock;
  CMTime v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v5, HostTimeClock);
  return objc_msgSend(v1, "setFigCaptureSessionSectionProperty:withHostTime:", v2, &v5);
}

- (void)setLivePhotoAutoTrimmingEnabled:(BOOL)livePhotoAutoTrimmingEnabled
{
  AVCapturePhotoOutputInternal *internal;
  void *v5;

  internal = self->_internal;
  if (internal->livePhotoCaptureSupported || !livePhotoAutoTrimmingEnabled)
  {
    if (internal->livePhotoAutoTrimmingEnabled != livePhotoAutoTrimmingEnabled)
    {
      internal->livePhotoAutoTrimmingEnabled = livePhotoAutoTrimmingEnabled;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (NSArray)availableLivePhotoVideoCodecTypes
{
  return self->_internal->availableLivePhotoVideoCodecTypes;
}

- (BOOL)isLivePhotoMovieProcessingSuspended
{
  return self->_internal->livePhotoMovieProcessingSuspended;
}

- (void)setLivePhotoMovieProcessingSuspended:(BOOL)a3
{
  _BOOL4 v3;
  AVCapturePhotoOutputInternal *internal;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  v3 = a3;
  if (a3 && !-[AVCapturePhotoOutput isLivePhotoCaptureEnabled](self, "isLivePhotoCaptureEnabled"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->livePhotoMovieProcessingSuspended != v3)
    {
      internal->livePhotoMovieProcessingSuspended = v3;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __61__AVCapturePhotoOutput_setLivePhotoMovieProcessingSuspended___block_invoke;
      v7[3] = &unk_1E4216820;
      v7[4] = self;
      v8 = v3;
      -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v7);
    }
  }
}

_QWORD *__61__AVCapturePhotoOutput_setLivePhotoMovieProcessingSuspended___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, _QWORD, uint64_t);

  result = *(_QWORD **)(a1 + 32);
  if (!a2)
    goto LABEL_5;
  v5 = objc_msgSend(result, "sinkID");
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v7 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v7 || (result = (_QWORD *)v7(a2, v5, *MEMORY[0x1E0D042D0], v6), (_DWORD)result))
  {
    result = *(_QWORD **)(a1 + 32);
LABEL_5:
    *(_BYTE *)(result[2] + 257) = 0;
  }
  return result;
}

+ (NSData)JPEGPhotoDataRepresentationForJPEGSampleBuffer:(CMSampleBufferRef)JPEGSampleBuffer previewPhotoSampleBuffer:(CMSampleBufferRef)previewPhotoSampleBuffer
{
  const opaqueCMFormatDescription *FormatDescription;
  OpaqueCMBlockBuffer *DataBuffer;
  const __CFAllocator *v9;
  CFDataRef v10;
  const void *v11;
  void *PreviewJPEGRepresentationForSampleBuffer;
  NSData *EXIFJPEGData;
  NSData *v14;
  char v15;
  void *v16;
  size_t totalLengthOut;
  char *dataPointerOut;
  CMBlockBufferRef blockBufferOut;

  blockBufferOut = 0;
  if (!JPEGSampleBuffer)
  {
    EXIFJPEGData = 0;
LABEL_17:
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v16);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v16);
    return EXIFJPEGData;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(JPEGSampleBuffer);
  if (CMFormatDescriptionGetMediaSubType(FormatDescription) == 1785750887)
  {
    DataBuffer = CMSampleBufferGetDataBuffer(JPEGSampleBuffer);
    if (DataBuffer)
    {
      v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E0C9AE00], DataBuffer, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, 0, &blockBufferOut)|| (totalLengthOut = 0, dataPointerOut = 0, CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, &totalLengthOut, &dataPointerOut)))
      {
        EXIFJPEGData = 0;
        PreviewJPEGRepresentationForSampleBuffer = 0;
      }
      else
      {
        v10 = CFDataCreateWithBytesNoCopy(v9, (const UInt8 *)dataPointerOut, totalLengthOut, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
        v11 = (const void *)objc_msgSend(a1, "_copyAttachmentsAndPropagateFaceRegionsToExifAuxDictionaryForSampleBuffer:", JPEGSampleBuffer);
        if (previewPhotoSampleBuffer)
          PreviewJPEGRepresentationForSampleBuffer = (void *)po_createPreviewJPEGRepresentationForSampleBuffer((uint64_t)previewPhotoSampleBuffer, (uint64_t)&unk_1E424D188);
        else
          PreviewJPEGRepresentationForSampleBuffer = 0;
        EXIFJPEGData = (NSData *)CGImageCreateEXIFJPEGData();
        v14 = EXIFJPEGData;
        if (v11)
          CFRelease(v11);
        if (v10)
          CFRelease(v10);
      }
      v15 = 1;
    }
    else
    {
      EXIFJPEGData = 0;
      v15 = 0;
      PreviewJPEGRepresentationForSampleBuffer = 0;
    }
  }
  else
  {
    EXIFJPEGData = 0;
    v15 = 0;
    PreviewJPEGRepresentationForSampleBuffer = 0;
  }
  if (blockBufferOut)
    CFRelease(blockBufferOut);

  if ((v15 & 1) == 0)
    goto LABEL_17;
  return EXIFJPEGData;
}

+ (NSData)DNGPhotoDataRepresentationForRawSampleBuffer:(CMSampleBufferRef)rawSampleBuffer previewPhotoSampleBuffer:(CMSampleBufferRef)previewPhotoSampleBuffer
{
  const opaqueCMFormatDescription *FormatDescription;
  void *PreviewJPEGRepresentationForSampleBuffer;
  const void *v9;
  void *v11;

  if (rawSampleBuffer)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(rawSampleBuffer);
    if (objc_msgSend(&unk_1E424D9D8, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CMFormatDescriptionGetMediaSubType(FormatDescription))))
    {
      if (CMSampleBufferGetImageBuffer(rawSampleBuffer))
      {
        if (previewPhotoSampleBuffer)
          PreviewJPEGRepresentationForSampleBuffer = (void *)po_createPreviewJPEGRepresentationForSampleBuffer((uint64_t)previewPhotoSampleBuffer, 0);
        else
          PreviewJPEGRepresentationForSampleBuffer = 0;
        v9 = (const void *)objc_msgSend(a1, "_copyAttachmentsAndPropagateFaceRegionsToExifAuxDictionaryForSampleBuffer:", rawSampleBuffer);
        CMPhotoDNGCreateDNGFromRAWPixelBuffer();
        if (v9)
          CFRelease(v9);

        return (NSData *)0;
      }
    }
    else if (!objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unrecognized raw format %@"), AVStringForOSType()))
    {
      return (NSData *)0;
    }
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v11);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
  return 0;
}

- (BOOL)isZeroShutterLagSupported
{
  return self->_internal->zeroShutterLagSupported;
}

- (void)setZeroShutterLagEnabled:(BOOL)zeroShutterLagEnabled
{
  _BOOL4 v3;
  AVCapturePhotoOutputInternal *internal;
  void *v6;

  v3 = zeroShutterLagEnabled;
  if (zeroShutterLagEnabled && !-[AVCapturePhotoOutput isZeroShutterLagSupported](self, "isZeroShutterLagSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    self->_internal->zeroShutterLagAutomaticallyEnabled = 0;
    internal = self->_internal;
    if (internal->zeroShutterLagEnabled != v3)
    {
      internal->zeroShutterLagEnabled = v3;
      -[AVCapturePhotoOutput _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:](self, "_updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:", -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"));
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isUltraHighResolutionZeroShutterLagSupported
{
  return self->_internal->ultraHighResolutionZeroShutterLagSupported;
}

- (BOOL)isUltraHighResolutionZeroShutterLagSupportEnabled
{
  return self->_internal->ultraHighResolutionZeroShutterLagSupportEnabled;
}

- (void)setUltraHighResolutionZeroShutterLagSupportEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCapturePhotoOutputInternal *internal;
  void *v6;

  v3 = a3;
  if (a3
    && !-[AVCapturePhotoOutput isUltraHighResolutionZeroShutterLagSupported](self, "isUltraHighResolutionZeroShutterLagSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->ultraHighResolutionZeroShutterLagSupportEnabled != v3)
    {
      internal->ultraHighResolutionZeroShutterLagSupportEnabled = v3;
      -[AVCapturePhotoOutput _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:](self, "_updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:", -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"));
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isUltraHighResolutionZeroShutterLagEnabled
{
  return self->_internal->ultraHighResolutionZeroShutterLagEnabled;
}

- (void)setUltraHighResolutionZeroShutterLagEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (a3
    && !-[AVCapturePhotoOutput isUltraHighResolutionZeroShutterLagSupportEnabled](self, "isUltraHighResolutionZeroShutterLagSupportEnabled"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
  else
  {
    -[AVCapturePhotoOutput _setUltraHighResolutionZeroShutterLagEnabled:](self, "_setUltraHighResolutionZeroShutterLagEnabled:", v3);
  }
}

- (void)_setUltraHighResolutionZeroShutterLagEnabled:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;

  internal = self->_internal;
  if (internal->ultraHighResolutionZeroShutterLagEnabled != a3)
  {
    internal->ultraHighResolutionZeroShutterLagEnabled = a3;
    objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "setUltraHighResolutionZeroShutterLagEnabled:", a3);
  }
}

- (AVCapturePhotoOutputCaptureReadiness)captureReadiness
{
  AVCapturePhotoOutputInternal *internal;
  AVCapturePhotoOutputCaptureReadiness captureReadiness;

  MEMORY[0x1A1AF1298](self->_internal->requestsLock, a2);
  internal = self->_internal;
  captureReadiness = internal->captureReadiness;
  MEMORY[0x1A1AF12A4](internal->requestsLock);
  return captureReadiness;
}

- (void)_updateCaptureReadinessStateForCompletedRequest:(id)a3
{
  AVCapturePhotoOutputInternal *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  MEMORY[0x1A1AF1298](self->_internal->requestsLock, a2);
  --self->_internal->readinessState.numberOfPhotoCapturesInflight;
  internal = self->_internal;
  if (internal->readinessState.inflightNonOverlappingCaptureUniqueID)
  {
    v6 = objc_msgSend((id)objc_msgSend(a3, "resolvedSettings"), "uniqueID");
    internal = self->_internal;
    if (v6 >= internal->readinessState.inflightNonOverlappingCaptureUniqueID)
    {
      internal->readinessState.inflightNonOverlappingCaptureUniqueID = 0;
      internal = self->_internal;
    }
  }
  if (internal->readinessState.inflightUniqueIDWaitingForCapture)
  {
    v7 = objc_msgSend((id)objc_msgSend(a3, "resolvedSettings"), "uniqueID");
    internal = self->_internal;
    if (v7 >= internal->readinessState.inflightUniqueIDWaitingForCapture)
    {
      internal->readinessState.inflightUniqueIDWaitingForCapture = 0;
      internal = self->_internal;
    }
  }
  if (internal->readinessState.inflightUniqueIDWaitingForProcessing)
  {
    v8 = objc_msgSend((id)objc_msgSend(a3, "resolvedSettings"), "uniqueID");
    internal = self->_internal;
    if (v8 >= internal->readinessState.inflightUniqueIDWaitingForProcessing)
    {
      internal->readinessState.inflightUniqueIDWaitingForProcessing = 0;
      internal = self->_internal;
    }
  }
  MEMORY[0x1A1AF12A4](internal->requestsLock);
  -[AVCapturePhotoOutput _updateCaptureReadiness](self, "_updateCaptureReadiness");
}

- (BOOL)_requestUsesWaitingForCaptureReadiness:(id)a3
{
  void *v4;
  void *v5;

  if (!a3)
    return 0;
  v4 = (void *)objc_msgSend(a3, "unresolvedSettings");
  v5 = (void *)objc_msgSend(a3, "resolvedSettings");
  if (objc_msgSend(v4, "digitalFlashMode") <= 0)
    return objc_msgSend(v5, "isFlashEnabled");
  else
    return 1;
}

- (BOOL)_requestUsesWaitingForProcessingReadiness:(id)a3
{
  void *v4;
  int v5;
  int v6;
  AVCapturePhotoOutputInternal *internal;

  if (a3)
  {
    v4 = (void *)objc_msgSend(a3, "unresolvedSettings");
    if (objc_msgSend(v4, "digitalFlashMode") <= 0
      && (v5 = objc_msgSend(v4, "maxPhotoDimensions"),
          (int)(((unint64_t)objc_msgSend(v4, "maxPhotoDimensions") >> 32) * v5) <= 47999999)
      && ((internal = self->_internal, internal->autoDeferredPhotoDeliveryEnabled)
       || internal->responsiveCaptureEnabled
       || objc_msgSend(v4, "photoQualityPrioritization") != 3))
    {
      v6 = -[AVCapturePhotoOutput isFilterRenderingEnabled](self, "isFilterRenderingEnabled");
      if (v6)
        LOBYTE(v6) = objc_msgSend(v4, "isDepthDataDeliveryEnabled");
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_addReadinessCoordinator:(id)a3
{
  AVCapturePhotoOutputInternal *internal;
  __int128 v6;
  _OWORD v7[2];
  int64_t inflightUniqueIDWaitingForProcessing;

  MEMORY[0x1A1AF1298](self->_internal->requestsLock, a2);
  -[NSMutableArray addObject:](self->_internal->readinessCoordinators, "addObject:", a3);
  internal = self->_internal;
  v6 = *(_OWORD *)&internal->readinessState.inflightNonOverlappingCaptureUniqueID;
  v7[0] = *(_OWORD *)&internal->readinessState.sessionIsRunning;
  v7[1] = v6;
  inflightUniqueIDWaitingForProcessing = internal->readinessState.inflightUniqueIDWaitingForProcessing;
  objc_msgSend(a3, "_photoOutputDidUpdateCaptureReadinessState:", v7);
  MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
}

- (void)_removeReadinessCoordinator:(id)a3
{
  MEMORY[0x1A1AF1298](self->_internal->requestsLock, a2);
  -[NSMutableArray removeObjectIdenticalTo:](self->_internal->readinessCoordinators, "removeObjectIdenticalTo:", a3);
  JUMPOUT(0x1A1AF12A4);
}

- (void)setOptimizesImagesForOfflineVideoStabilization:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;
  void *v5;

  internal = self->_internal;
  if (a3)
  {
    if (internal->imageOptimizationForOfflineVideoStabilizationSupported)
    {
      if (internal->optimizesImagesForOfflineVideoStabilization != a3)
      {
        internal->optimizesImagesForOfflineVideoStabilization = a3;
        -[AVCapturePhotoOutput optimizedImageDimensionsForOfflineStabilization](self, "optimizedImageDimensionsForOfflineStabilization");
        CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "activeFormat"), "formatDescription"));
LABEL_7:
        -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
      }
    }
    else
    {
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v5);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
    }
  }
  else if (internal->optimizesImagesForOfflineVideoStabilization)
  {
    internal->optimizesImagesForOfflineVideoStabilization = 0;
    goto LABEL_7;
  }
}

- ($2825F4736939C4A6D3AD43837233062D)optimizedImageDimensionsForOfflineStabilization
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_internal->optimizedImageDimensionsForOfflineStabilization;
}

- (float)timeLapseCaptureRate
{
  return self->_internal->timeLapseCaptureRate;
}

- (void)setTimeLapseCaptureRate:(float)a3
{
  AVCapturePhotoOutputInternal *internal;
  float timeLapseCaptureRate;
  BOOL v5;

  internal = self->_internal;
  timeLapseCaptureRate = internal->timeLapseCaptureRate;
  if (timeLapseCaptureRate != a3
    || (timeLapseCaptureRate == 2.0 ? (v5 = !internal->timeLapseCaptureRateNeedsUpdate) : (v5 = 1), !v5))
  {
    internal->timeLapseCaptureRate = a3;
    self->_internal->timeLapseCaptureRateNeedsUpdate = 1;
    -[AVCapturePhotoOutput _updateTimeLapseCaptureRate](self, "_updateTimeLapseCaptureRate");
  }
}

- (void)_updateTimeLapseCaptureRate
{
  id v3;
  double v4;

  if (self->_internal->timeLapseCaptureRateNeedsUpdate)
  {
    v3 = -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice");
    if (v3)
    {
      *(float *)&v4 = self->_internal->timeLapseCaptureRate;
      objc_msgSend(v3, "setTimeLapseCaptureRate:", v4);
      self->_internal->timeLapseCaptureRateNeedsUpdate = 0;
    }
  }
}

- (void)_resetTimeLapseCaptureRate
{
  self->_internal->timeLapseCaptureRateNeedsUpdate = 1;
  if (self->_internal->timeLapseCaptureRate != 2.0)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("timeLapseCaptureRate"));
    self->_internal->timeLapseCaptureRate = 2.0;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("timeLapseCaptureRate"));
  }
}

- (void)userInitiatedCaptureRequestAtTime:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__AVCapturePhotoOutput_userInitiatedCaptureRequestAtTime___block_invoke;
  v3[3] = &unk_1E4216C78;
  v3[4] = self;
  v3[5] = a3;
  -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v3);
}

uint64_t __58__AVCapturePhotoOutput_userInitiatedCaptureRequestAtTime___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD, uint64_t);

  if (a2)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v3 + 40));
    result = CMBaseObjectGetVTable();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 16) + 8);
    if (v6)
      return v6(a2, v4, *MEMORY[0x1E0D042E0], v5);
  }
  return result;
}

- (BOOL)isSpatialOverCaptureSupported
{
  return self->_internal->spatialOverCaptureSupported;
}

- (void)beginMomentCaptureWithSettings:(id)a3
{
  -[AVCapturePhotoOutput beginMomentCaptureWithSettings:delegate:](self, "beginMomentCaptureWithSettings:delegate:", a3, 0);
}

- (void)beginMomentCaptureWithSettings:(id)a3 delegate:(id)a4
{
  AVCaptureConnection *v7;
  int v8;
  AVCapturePhotoOutputInternal *internal;
  void *v10;
  const __CFString *v11;
  _QWORD v12[7];
  const __CFString *v13;

  v13 = 0;
  if (!self->_internal->movieRecordingEnabled)
  {
    v11 = CFSTR("movieRecordingEnabled must be YES in order to begin moment capture");
LABEL_24:
    v13 = v11;
LABEL_14:
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v10);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
    return;
  }
  if (!a3)
  {
    v11 = CFSTR("Nil momentCaptureSettings");
    goto LABEL_24;
  }
  if (objc_msgSend(a3, "uniqueID") <= self->_internal->lastMomentSettingsUniqueID)
  {
    v11 = CFSTR("momentCaptureSettings may not be re-used");
    goto LABEL_24;
  }
  v7 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]);
  if (objc_msgSend(a3, "torchMode")
    && (objc_msgSend(-[AVCaptureConnection sourceDevice](v7, "sourceDevice"), "isTorchModeSupported:", objc_msgSend(a3, "torchMode")) & 1) == 0)
  {
    v11 = CFSTR("torchMode is unsupported in this configuration");
    goto LABEL_24;
  }
  v8 = objc_msgSend(a3, "isAutoSpatialOverCaptureEnabled");
  internal = self->_internal;
  if (v8 && !internal->spatialOverCaptureEnabled)
  {
    v11 = CFSTR("spatialOverCaptureEnabled must be YES on the AVCapturePhotoOutput in order to begin a moment capture with autoSpatialOverCaptureEnabled set to YES");
    goto LABEL_24;
  }
  if (internal->momentCaptureInFlight)
  {
    v11 = CFSTR("Can't begin a new moment capture when you've already got a moment capture in flight");
    goto LABEL_24;
  }
  if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", v7) & 1) == 0)
  {
    v11 = CFSTR("No active and enabled video connection");
    goto LABEL_24;
  }
  if (!objc_msgSend(a3, "photoSettings")
    || po_photoSettingsAreValid((void *)objc_msgSend(a3, "photoSettings"), (uint64_t)a4, self, v7, &v13))
  {
    self->_internal->momentCaptureInFlight = (AVMomentCaptureSettings *)objc_msgSend(a3, "copy");
    self->_internal->momentPhotoCaptureDelegateInFlight = (AVCapturePhotoCaptureDelegate *)a4;
    self->_internal->momentCaptureRequestIdentifierInFlight = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), "copy");
    self->_internal->lastMomentSettingsUniqueID = objc_msgSend(a3, "uniqueID");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__AVCapturePhotoOutput_beginMomentCaptureWithSettings_delegate___block_invoke;
    v12[3] = &unk_1E421D5A0;
    v12[4] = a3;
    v12[5] = self;
    v12[6] = a4;
    -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v12);
  }
  if (v13)
    goto LABEL_14;
}

void __64__AVCapturePhotoOutput_beginMomentCaptureWithSettings_delegate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *);
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "photoSettings"))
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "_figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:captureRequestIdentifier:delegate:connections:", objc_msgSend(*(id *)(a1 + 32), "photoSettings"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 416), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "connections"));
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D03C70]), "initWithStillImageSettings:", v4);
    }
    else
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D03C70]), "initWithSettingsID:captureRequestIdentifier:userInitiatedCaptureTime:", objc_msgSend(*(id *)(a1 + 32), "uniqueID"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 416), objc_msgSend(*(id *)(a1 + 32), "userInitiatedCaptureTime"));
      objc_msgSend(v5, "setFlashMode:", objc_msgSend(*(id *)(a1 + 32), "flashMode"));
      objc_msgSend(v5, "setAutoRedEyeReductionEnabled:", objc_msgSend(*(id *)(a1 + 32), "isAutoRedEyeReductionEnabled"));
      objc_msgSend(v5, "setDigitalFlashMode:", objc_msgSend(*(id *)(a1 + 32), "digitalFlashMode"));
      v6 = objc_msgSend(*(id *)(a1 + 32), "photoQualityPrioritization");
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 80);
      if (v6 < v7)
        v7 = objc_msgSend(*(id *)(a1 + 32), "photoQualityPrioritization");
      objc_msgSend(v5, "setQualityPrioritization:", v7);
      objc_msgSend(v5, "setClientQualityPrioritization:", objc_msgSend(*(id *)(a1 + 32), "photoQualityPrioritization"));
      objc_msgSend(v5, "setHDRMode:", objc_msgSend(*(id *)(a1 + 32), "HDRMode"));
      objc_msgSend(v5, "setAutoOriginalPhotoDeliveryEnabled:", objc_msgSend(*(id *)(a1 + 32), "isAutoOriginalPhotoDeliveryEnabled"));
      objc_msgSend(v5, "setAutoSpatialOverCaptureEnabled:", objc_msgSend(*(id *)(a1 + 32), "isAutoSpatialOverCaptureEnabled"));
      objc_msgSend(v5, "setAutoDeferredProcessingEnabled:", objc_msgSend(*(id *)(a1 + 40), "isAutoDeferredPhotoDeliveryEnabled"));
      objc_msgSend(v5, "setRawOutputFormat:", objc_msgSend(*(id *)(a1 + 40), "_internalRawFormatFromRawFormat:", objc_msgSend(*(id *)(a1 + 32), "rawOutputFormat")));
      objc_msgSend(v5, "setOutputWidth:", objc_msgSend(*(id *)(a1 + 32), "maxPhotoDimensions"));
      objc_msgSend(v5, "setOutputHeight:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "maxPhotoDimensions") >> 32);
      objc_msgSend(v5, "setDepthDataDeliveryEnabled:", objc_msgSend(*(id *)(a1 + 32), "isDepthDataDeliveryEnabled"));
    }
    objc_msgSend(v5, "setTorchMode:", objc_msgSend(*(id *)(a1 + 32), "torchMode"));
    v8 = objc_msgSend(*(id *)(a1 + 40), "sinkID");
    v9 = *(void (**)(uint64_t, uint64_t, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
    if (v9)
    {
      v9(a2, v8, v5);
    }
    else
    {
      v10 = *MEMORY[0x1E0D04368];
      v11[0] = &unk_1E424D2A8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
    }

  }
}

- (void)commitMomentCaptureToPhotoWithUniqueID:(int64_t)a3
{
  AVCapturePhotoOutputInternal *internal;
  AVMomentCaptureSettings *momentCaptureInFlight;
  void *v6;

  internal = self->_internal;
  momentCaptureInFlight = internal->momentCaptureInFlight;
  if (momentCaptureInFlight && internal->momentPhotoCaptureDelegateInFlight)
  {
    -[AVCapturePhotoOutput commitMomentCaptureWithUniqueID:toPhotoCaptureWithSettings:delegate:](self, "commitMomentCaptureWithUniqueID:toPhotoCaptureWithSettings:delegate:", a3, -[AVMomentCaptureSettings photoSettings](momentCaptureInFlight, "photoSettings"), self->_internal->momentPhotoCaptureDelegateInFlight);

    self->_internal->momentPhotoCaptureDelegateInFlight = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (void)commitMomentCaptureWithUniqueID:(int64_t)a3 toPhotoCaptureWithSettings:(id)a4 delegate:(id)a5
{
  uint64_t v5;
  AVCapturePhotoOutputInternal *internal;
  int64_t lastMomentSettingsUniqueID;
  AVCaptureConnection *v11;
  NSString *v12;
  id v13;
  NSObject *beginEndIrisMovieCaptureHostTimeDispatchGroup;
  dispatch_time_t v15;
  void *v16;
  NSObject *CTGreenTeaOsLogHandle;
  NSObject *v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[9];
  uint8_t buf[16];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  const __CFString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  if (!a4)
  {
    v19 = CFSTR("Nil photoSettings");
LABEL_24:
    v27 = v19;
LABEL_13:
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v16);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v16);
    goto LABEL_15;
  }
  if (!a5)
  {
    v19 = CFSTR("Nil delegate");
    goto LABEL_24;
  }
  internal = self->_internal;
  if (!internal->momentCaptureInFlight)
  {
    v19 = CFSTR("You must call beginMomentCaptureWithSettings: first");
    goto LABEL_24;
  }
  lastMomentSettingsUniqueID = internal->lastMomentSettingsUniqueID;
  if (lastMomentSettingsUniqueID != objc_msgSend(a4, "uniqueID", a3))
  {
    v19 = CFSTR("MomentCapture and PhotoSettings uniqueID mismatch");
    goto LABEL_24;
  }
  v11 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]);
  if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", v11) & 1) == 0)
  {
    v19 = CFSTR("No active and enabled video connection");
    goto LABEL_24;
  }

  self->_internal->momentCaptureInFlight = 0;
  v12 = self->_internal->momentCaptureRequestIdentifierInFlight;
  self->_internal->momentCaptureRequestIdentifierInFlight = 0;
  if (!self->_internal->optimizesImagesForOfflineVideoStabilization)
  {
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
    v18 = CTGreenTeaOsLogHandle;
    if (CTGreenTeaOsLogHandle)
    {
      if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EDF1000, v18, OS_LOG_TYPE_INFO, "Take a photo", buf, 2u);
      }
    }
  }
  v13 = (id)objc_msgSend(a4, "copy");
  if (po_photoSettingsAreValid(v13, (uint64_t)a5, self, v11, &v27))
  {
    if (sIsForcedShutterSoundRegion)
    {
      beginEndIrisMovieCaptureHostTimeDispatchGroup = self->_internal->beginEndIrisMovieCaptureHostTimeDispatchGroup;
      v15 = dispatch_time(0, 2000000000);
      dispatch_group_wait(beginEndIrisMovieCaptureHostTimeDispatchGroup, v15);
    }
    self->_internal->lastSettingsUniqueID = objc_msgSend(v13, "uniqueID");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __92__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toPhotoCaptureWithSettings_delegate___block_invoke;
    v21[3] = &unk_1E421D5C8;
    v21[7] = a5;
    v21[8] = &v23;
    v21[4] = self;
    v21[5] = v13;
    v21[6] = v12;
    -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v21);
    v28 = *MEMORY[0x1E0CF2A88];
    v29[0] = &unk_1E424D140;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    if (!*((_BYTE *)v24 + 24))
    {
      LODWORD(v20) = 0;
      FigDebugAssert3();
      -[AVCapturePhotoOutput _dispatchFailureCallbacksForPhotoSettings:toDelegate:withError:](self, "_dispatchFailureCallbacksForPhotoSettings:toDelegate:withError:", a4, a5, AVLocalizedError(), v20, v5);
    }
  }
  if (v27)
    goto LABEL_13;
LABEL_15:
  _Block_object_dispose(&v23, 8);
}

uint64_t __92__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toPhotoCaptureWithSettings_delegate___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  AVCapturePhotoRequest *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24) = a2 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24))
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "_figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:captureRequestIdentifier:delegate:connections:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 56), objc_msgSend(*(id *)(result + 32), "connections"));
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 144) != 0;
    v6 = +[AVCapturePhotoRequest requestWithDelegate:settings:lensStabilizationSupported:](AVCapturePhotoRequest, "requestWithDelegate:settings:lensStabilizationSupported:", *(_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 40), v5);
    MEMORY[0x1A1AF1298](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 328));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 336), "addObject:", v6);
    MEMORY[0x1A1AF12A4](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 328));
    v7 = objc_msgSend(*(id *)(v3 + 32), "sinkID");
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 120);
    if (v8)
    {
      return v8(a2, v7, v4);
    }
    else
    {
      v9 = *MEMORY[0x1E0D04368];
      v10[0] = &unk_1E424D2A8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)commitMomentCaptureWithUniqueID:(int64_t)a3 toMovieRecordingWithSettings:(id)a4 delegate:(id)a5
{
  uint64_t v5;
  AVCapturePhotoOutputInternal *internal;
  int64_t lastMomentSettingsUniqueID;
  AVCaptureConnection *v11;
  NSObject *CTGreenTeaOsLogHandle;
  NSObject *v13;
  id v14;
  void *v15;
  AVCapturePhotoOutputInternal *v16;
  uint64_t v17;
  NSObject *beginEndIrisMovieCaptureHostTimeDispatchGroup;
  dispatch_time_t v19;
  NSObject *beginEndIrisMovieCaptureHostTimeQueue;
  NSObject *v21;
  dispatch_time_t v22;
  AVMomentCaptureSettings *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[10];
  _QWORD block[6];
  uint8_t buf[8];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  if (!a4)
    goto LABEL_28;
  if (!a5)
    goto LABEL_28;
  internal = self->_internal;
  if (!internal->momentCaptureInFlight)
    goto LABEL_28;
  lastMomentSettingsUniqueID = internal->lastMomentSettingsUniqueID;
  if (lastMomentSettingsUniqueID != objc_msgSend(a4, "uniqueID", a3))
    goto LABEL_28;
  v11 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]);
  if (!objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", v11))
    goto LABEL_28;
  CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
  v13 = CTGreenTeaOsLogHandle;
  if (CTGreenTeaOsLogHandle && os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EDF1000, v13, OS_LOG_TYPE_INFO, "Record a video", buf, 2u);
  }
  if ((v14 = (id)objc_msgSend(a4, "copy"), (v15 = v14) != 0)
    && ((v16 = self->_internal) == 0
     || objc_msgSend(v14, "uniqueID") == v16->lastMomentSettingsUniqueID
     && -[NSArray containsObject:](v16->availableLivePhotoVideoCodecTypes, "containsObject:", objc_msgSend(v15, "videoCodecType")))&& objc_msgSend(v15, "movieFileURL")&& objc_msgSend((id)objc_msgSend(v15, "movieFileURL"), "isFileURL")&& ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)&& (!objc_msgSend(v15, "isAutoSpatialOverCaptureEnabled")|| (!v11|| objc_msgSend(-[AVCaptureConnection sourceDevice](v11, "sourceDevice"), "isSpatialOverCaptureEnabled"))&& objc_msgSend(v15, "spatialOverCaptureMovieFileURL")&& objc_msgSend((id)objc_msgSend(v15, "spatialOverCaptureMovieFileURL"), "isFileURL")))
  {
    v17 = MEMORY[0x1E0C809B0];
    if (sIsForcedShutterSoundRegion)
    {
      beginEndIrisMovieCaptureHostTimeDispatchGroup = self->_internal->beginEndIrisMovieCaptureHostTimeDispatchGroup;
      v19 = dispatch_time(0, 2000000000);
      dispatch_group_wait(beginEndIrisMovieCaptureHostTimeDispatchGroup, v19);
      beginEndIrisMovieCaptureHostTimeQueue = self->_internal->beginEndIrisMovieCaptureHostTimeQueue;
      block[0] = v17;
      block[1] = 3221225472;
      block[2] = __94__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toMovieRecordingWithSettings_delegate___block_invoke;
      block[3] = &unk_1E42178B8;
      block[4] = self;
      block[5] = &v29;
      dispatch_sync(beginEndIrisMovieCaptureHostTimeQueue, block);
      v21 = self->_internal->beginEndIrisMovieCaptureHostTimeDispatchGroup;
      v22 = dispatch_time(0, 2000000000);
      if (dispatch_group_wait(v21, v22))
        v30[3] = mach_absolute_time();
    }
    self->_internal->lastSettingsUniqueID = objc_msgSend(v15, "uniqueID");
    v23 = self->_internal->momentCaptureInFlight;
    self->_internal->momentCaptureInFlight = 0;

    self->_internal->momentPhotoCaptureDelegateInFlight = 0;
    self->_internal->momentCaptureRequestIdentifierInFlight = 0;
    v26[0] = v17;
    v26[1] = 3221225472;
    v26[2] = __94__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toMovieRecordingWithSettings_delegate___block_invoke_3;
    v26[3] = &unk_1E421D5F0;
    v26[4] = self;
    v26[5] = v15;
    v26[6] = v23;
    v26[7] = a5;
    v26[8] = &v33;
    v26[9] = &v29;
    -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v26);
    v37 = *MEMORY[0x1E0CF2A88];
    v38[0] = &unk_1E424D140;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    if (!*((_BYTE *)v34 + 24))
    {
      LODWORD(v25) = 0;
      FigDebugAssert3();
      -[AVCapturePhotoOutput _dispatchFailureCallbacksForMovieRecordingSettings:momentCaptureSettings:toDelegate:withError:](self, "_dispatchFailureCallbacksForMovieRecordingSettings:momentCaptureSettings:toDelegate:withError:", a4, v23, a5, AVLocalizedError(), v25, v5);
    }
  }
  else
  {
LABEL_28:
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v24);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v24);
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

void __94__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toMovieRecordingWithSettings_delegate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  OpaqueCMClock *HostTimeClock;
  _QWORD inCompletionBlock[4];
  __int128 v6;
  CMTime v7;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 368));
  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0D042C8];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v7, HostTimeClock);
  objc_msgSend(v2, "setFigCaptureSessionSectionProperty:withHostTime:", v3, &v7);
  inCompletionBlock[0] = MEMORY[0x1E0C809B0];
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = __94__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toMovieRecordingWithSettings_delegate___block_invoke_2;
  inCompletionBlock[3] = &unk_1E42178B8;
  v6 = *(_OWORD *)(a1 + 32);
  AudioServicesPlaySystemSoundWithCompletion(0x45Du, inCompletionBlock);
}

void __94__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toMovieRecordingWithSettings_delegate___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  OpaqueCMClock *HostTimeClock;
  CMTime v5;

  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0D042C0];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v5, HostTimeClock);
  objc_msgSend(v2, "setFigCaptureSessionSectionProperty:withHostTime:", v3, &v5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = mach_absolute_time();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 368));
}

uint64_t __94__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toMovieRecordingWithSettings_delegate___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  AVMomentCaptureMovieRequest *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, void *);
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24) = a2 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24))
  {
    v3 = result;
    v4 = (void *)objc_msgSend(*(id *)(result + 32), "_figCaptureMovieFileRecordingSettingsForAVMomentCaptureMovieRecordingSettings:momentCaptureSettings:delegate:connections:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 56), objc_msgSend(*(id *)(result + 32), "connections"));
    v5 = v4;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 72) + 8) + 24))
      objc_msgSend(v4, "setMovieStartTimeOverride:");
    v6 = +[AVMomentCaptureMovieRequest requestWithDelegate:movieRecordingSettings:momentSettings:](AVMomentCaptureMovieRequest, "requestWithDelegate:movieRecordingSettings:momentSettings:", *(_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48));
    MEMORY[0x1A1AF1298](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 328));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 352), "addObject:", v6);
    MEMORY[0x1A1AF12A4](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 328));
    v7 = objc_msgSend(*(id *)(v3 + 32), "sinkID");
    v8 = *(uint64_t (**)(uint64_t, uint64_t, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 128);
    if (v8)
    {
      return v8(a2, v7, v5);
    }
    else
    {
      v9 = *MEMORY[0x1E0D04368];
      v10[0] = &unk_1E424D2A8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)cancelMomentCaptureWithUniqueID:(int64_t)a3
{
  AVCapturePhotoOutputInternal *internal;
  AVMomentCaptureSettings *momentCaptureInFlight;
  void *v7;
  _QWORD v8[7];
  _QWORD v9[3];
  char v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90])) & 1) != 0&& (internal = self->_internal, internal->lastMomentSettingsUniqueID == a3)&& (momentCaptureInFlight = internal->momentCaptureInFlight) != 0)
  {

    self->_internal->momentCaptureInFlight = 0;
    self->_internal->momentPhotoCaptureDelegateInFlight = 0;

    self->_internal->momentCaptureRequestIdentifierInFlight = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__AVCapturePhotoOutput_cancelMomentCaptureWithUniqueID___block_invoke;
    v8[3] = &unk_1E4216678;
    v8[4] = self;
    v8[5] = v9;
    v8[6] = a3;
    -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v8);
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  _Block_object_dispose(v9, 8);
}

uint64_t __56__AVCapturePhotoOutput_cancelMomentCaptureWithUniqueID___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v5 = *(_QWORD *)(v3 + 48);
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 136);
    if (v6)
    {
      return v6(a2, v4, v5);
    }
    else
    {
      v7 = *MEMORY[0x1E0D04368];
      v8[0] = &unk_1E424D2A8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)endMomentCaptureWithUniqueID:(int64_t)a3
{
  AVCapturePhotoOutputInternal *internal;
  void *v6;
  _QWORD v7[7];
  _QWORD v8[3];
  char v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90])) & 1) != 0&& (internal = self->_internal, !internal->momentCaptureInFlight)&& internal->lastMomentSettingsUniqueID == a3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__AVCapturePhotoOutput_endMomentCaptureWithUniqueID___block_invoke;
    v7[3] = &unk_1E4216678;
    v7[4] = self;
    v7[5] = v8;
    v7[6] = a3;
    -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v7);
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  _Block_object_dispose(v8, 8);
}

uint64_t __53__AVCapturePhotoOutput_endMomentCaptureWithUniqueID___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v5 = *(_QWORD *)(v3 + 48);
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 144);
    if (v6)
    {
      return v6(a2, v4, v5);
    }
    else
    {
      v7 = *MEMORY[0x1E0D04368];
      v8[0] = &unk_1E424D2A8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (BOOL)isVideoCaptureSupported
{
  return self->_internal->videoCaptureSupported;
}

- (void)setVideoCaptureEnabled:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;
  void *v4;

  internal = self->_internal;
  if (a3 && internal->movieRecordingEnabled)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else if (internal->videoCaptureEnabled != a3)
  {
    internal->videoCaptureEnabled = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (BOOL)isVideoCaptureEnabled
{
  return self->_internal->videoCaptureEnabled;
}

- (void)initiateCaptureWithSettings:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__AVCapturePhotoOutput_initiateCaptureWithSettings___block_invoke;
  v3[3] = &unk_1E4216870;
  v3[4] = self;
  v3[5] = a3;
  -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v3);
}

uint64_t __52__AVCapturePhotoOutput_initiateCaptureWithSettings___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD, uint64_t);

  if (a2)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(v3 + 40), "timestamp"));
    result = CMBaseObjectGetVTable();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 16) + 8);
    if (v6)
      return v6(a2, v4, *MEMORY[0x1E0D042E0], v5);
  }
  return result;
}

- (void)commitCaptureWithSettings:(id)a3 delegate:(id)a4
{
  void *v7;
  uint64_t v8;

  if (objc_msgSend(a3, "videoFileURL"))
  {
    self->_internal->resumeLivePhotoMovieCaptureAfterVideoCaptureEnds = !-[AVCapturePhotoOutput isLivePhotoCaptureSuspended](self, "isLivePhotoCaptureSuspended");
    if (-[AVCapturePhotoOutput isLivePhotoCaptureSuspended](self, "isLivePhotoCaptureSuspended"))
      -[AVCapturePhotoOutput setLivePhotoCaptureSuspended:](self, "setLivePhotoCaptureSuspended:", 0);
    objc_msgSend(a3, "setTurboModeEnabled:", 1);
    objc_msgSend(a3, "setLivePhotoMovieFileURL:", objc_msgSend(a3, "videoFileURL"));
    v7 = (void *)objc_msgSend(a3, "videoFormat");
    v8 = *MEMORY[0x1E0CF2C58];
    if (objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]))
      objc_msgSend(a3, "setLivePhotoVideoCodecType:", objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "objectForKeyedSubscript:", v8));
    objc_msgSend(a3, "setLivePhotoMovieMetadata:", objc_msgSend(a3, "videoFileMetadata"));
  }
  -[AVCapturePhotoOutput capturePhotoWithSettings:delegate:](self, "capturePhotoWithSettings:delegate:", a3, a4);
}

- (void)endCaptureWithUniqueID:(int64_t)a3
{
  -[AVCapturePhotoOutput setLivePhotoCaptureSuspended:](self, "setLivePhotoCaptureSuspended:", 1);
  if (self->_internal->resumeLivePhotoMovieCaptureAfterVideoCaptureEnds)
    -[AVCapturePhotoOutput setLivePhotoCaptureSuspended:](self, "setLivePhotoCaptureSuspended:", 0);
}

- (BOOL)isProcessedPhotoZoomWithoutUpscalingSupported
{
  return self->_internal->processedPhotoZoomWithoutUpscalingSupported;
}

- (BOOL)isConstantColorSupported
{
  return self->_internal->constantColorSupported;
}

- (void)setConstantColorEnabled:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;
  void *v4;

  internal = self->_internal;
  if (a3 && !internal->constantColorSupported)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else if (internal->constantColorEnabled != a3)
  {
    internal->constantColorEnabled = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)setConstantColorClippingRecoveryEnabled:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;
  void *v4;

  internal = self->_internal;
  if (a3 && !internal->constantColorSupported)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else if (internal->constantColorClippingRecoveryEnabled != a3)
  {
    internal->constantColorClippingRecoveryEnabled = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)setConstantColorSaturationBoostEnabled:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;
  void *v4;

  internal = self->_internal;
  if (a3 && !internal->constantColorSupported)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else if (internal->constantColorSaturationBoostEnabled != a3)
  {
    internal->constantColorSaturationBoostEnabled = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (BOOL)isShutterSoundSuppressionSupported
{
  return sIsForcedShutterSoundRegion == 0;
}

- (BOOL)isStereoPhotoCaptureSupported
{
  return self->_internal->spatialPhotoCaptureSupported;
}

- (BOOL)isSpatialPhotoCaptureSupported
{
  return self->_internal->spatialPhotoCaptureSupported;
}

- (BOOL)isStereoPhotoCaptureEnabled
{
  return self->_internal->spatialPhotoCaptureEnabled;
}

- (BOOL)isSpatialPhotoCaptureEnabled
{
  return self->_internal->spatialPhotoCaptureEnabled;
}

- (void)setSpatialPhotoCaptureEnabled:(BOOL)a3
{
  AVCapturePhotoOutputInternal *internal;
  void *v4;

  internal = self->_internal;
  if (a3 && !internal->spatialPhotoCaptureSupported)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else if (internal->spatialPhotoCaptureEnabled != a3)
  {
    internal->spatialPhotoCaptureEnabled = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (id)connectionMediaTypes
{
  uint64_t *v2;
  uint64_t v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined())
  {
    v5[0] = *MEMORY[0x1E0CF2B90];
    v2 = v5;
  }
  else
  {
    v4 = *MEMORY[0x1E0CF2B90];
    v2 = &v4;
  }
  v2[1] = *MEMORY[0x1E0CF2B68];
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
}

- (void)removeConnection:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVCapturePhotoOutput;
  -[AVCaptureOutput removeConnection:](&v17, sel_removeConnection_);
  v5 = (void *)objc_msgSend(a3, "mediaType");
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CF2B90]))
  {
    v6 = (void *)objc_msgSend(a3, "sourceDevice");
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("imageControlMode"), AVCapturePhotoOutputDeviceImageControlModeChangedContext);
    v7 = (void *)objc_msgSend(a3, "sourceDevice");
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("geometricDistortionCorrectionEnabled"), AVCapturePhotoOutputDeviceGDCEnabledChangedContext);
    v8 = -[AVCaptureOutput session](self, "session");
    objc_msgSend(v8, "removeObserver:forKeyPath:context:", self, CFSTR("outputs"), AVCapturePhotoOutputSessionOutputsChangedContext);
    v9 = -[AVCaptureOutput session](self, "session");
    objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, CFSTR("sessionPreset"), AVCapturePhotoOutputSessionPresetChangedContext);
    v10 = -[AVCaptureOutput session](self, "session");
    objc_msgSend(v10, "removeObserver:forKeyPath:context:", self, CFSTR("running"), AVCapturePhotoOutputSessionIsRunningChangedContext);
    v11 = (void *)objc_msgSend(a3, "sourceDevice");
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("spatialOverCaptureEnabled"), AVCapturePhotoOutputDeviceSpatialOverCaptureEnabledChangedContext);
    v12 = (void *)objc_msgSend(a3, "sourceDevice");
    objc_msgSend(v12, "removeObserver:forKeyPath:context:", self, CFSTR("videoHDREnabled"), AVCapturePhotoOutputDeviceVideoHDREnabledChangedContext);
    v13 = (void *)objc_msgSend(a3, "sourceDevice");
    objc_msgSend(v13, "removeObserver:forKeyPath:context:", self, CFSTR("digitalFlashSceneForPhotoOutput"), AVCapturePhotoOutputDeviceDigitalFlashSceneForPhotoOutputChangedContext);
    v14 = (void *)objc_msgSend(a3, "sourceDevice");
    objc_msgSend(v14, "removeObserver:forKeyPath:context:", self, CFSTR("isStillImageStabilizationScene"), AVCapturePhotoOutputDeviceStillImageStabilizationSceneChangedContext);
    v15 = (void *)objc_msgSend(a3, "sourceDevice");
    objc_msgSend(v15, "removeObserver:forKeyPath:context:", self, CFSTR("HDRSceneDetectedForPhotoOutput"), AVCapturePhotoOutputDeviceHDRSceneDetectedForPhotoOutputChangedContext);
    v16 = (void *)objc_msgSend(a3, "sourceDevice");
    objc_msgSend(v16, "removeObserver:forKeyPath:context:", self, CFSTR("flashSceneDetectedForPhotoOutput"), AVCapturePhotoOutputDeviceFlashSceneDetectedForPhotoOutputChangedContext);
    -[AVCapturePhotoOutput _updateSupportedPropertiesForSourceDevice:](self, "_updateSupportedPropertiesForSourceDevice:", 0);
  }
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04288], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D042B0], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D042A8], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D042B8], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04258], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D042A0], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04290], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04238], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04270], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04260], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04278], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04280], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04248], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04268], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, po_notificationHandler, *MEMORY[0x1E0D04298], a3);
  -[AVCapturePhotoOutput _resetTimeLapseCaptureRate](self, "_resetTimeLapseCaptureRate");
  -[AVCapturePhotoOutput _resetLivePhotoMovieProcessingSuspended](self, "_resetLivePhotoMovieProcessingSuspended");
  -[AVCapturePhotoOutput _resetLivePhotoCaptureSuspended](self, "_resetLivePhotoCaptureSuspended");
  v6.receiver = self;
  v6.super_class = (Class)AVCapturePhotoOutput;
  -[AVCaptureOutput detachSafelyFromFigCaptureSession:](&v6, sel_detachSafelyFromFigCaptureSession_, a3);
}

- (void)safelyHandleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A1AF1298](self->_internal->requestsLock, a2, a3);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_internal->photoRequests);
  -[NSMutableArray removeAllObjects](self->_internal->photoRequests, "removeAllObjects");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_internal->movieRequests);
  -[NSMutableArray removeAllObjects](self->_internal->movieRequests, "removeAllObjects");
  MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  v7 = *MEMORY[0x1E0CF2A88];
  v33[0] = *MEMORY[0x1E0CF2A90];
  v6 = v33[0];
  v33[1] = v7;
  v34[0] = MEMORY[0x1E0C9AAA0];
  v34[1] = &unk_1E424D200;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v8 = AVLocalizedErrorWithUnderlyingOSStatus();
  v31[0] = v6;
  v31[1] = v7;
  v32[0] = MEMORY[0x1E0C9AAB0];
  v32[1] = &unk_1E424D200;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v9 = AVLocalizedErrorWithUnderlyingOSStatus();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v4);
        -[AVCapturePhotoOutput _dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:](self, "_dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:", 2147549183, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), v8, 0);
      }
      v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v5);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        v19 = objc_msgSend((id)objc_msgSend(v18, "resolvedSettings"), "movieURL");
        v20 = v8;
        if (v19)
        {
          if (FigConsolidateMovieFragments())
            v20 = v8;
          else
            v20 = v9;
        }
        -[AVCapturePhotoOutput _dispatchFailureCallbacks:forMovieRequest:withError:cleanupRequest:](self, "_dispatchFailureCallbacks:forMovieRequest:withError:cleanupRequest:", 63, v18, v20, 0);
      }
      v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  objc_super v7;

  -[AVCapturePhotoOutput _updateSupportedPropertiesForSourceDevice:](self, "_updateSupportedPropertiesForSourceDevice:", a4);
  v7.receiver = self;
  v7.super_class = (Class)AVCapturePhotoOutput;
  -[AVCaptureOutput handleChangedActiveFormat:forDevice:](&v7, sel_handleChangedActiveFormat_forDevice_, a3, a4);
}

- (void)handleBackgroundBlurActiveChangedForDevice:(id)a3
{
  -[AVCapturePhotoOutput _updateMaxBracketedCapturePhotoCountForSourceDevice:](self, "_updateMaxBracketedCapturePhotoCountForSourceDevice:");
  -[AVCapturePhotoOutput _updateDepthDataDeliverySupportedForSourceDevice:](self, "_updateDepthDataDeliverySupportedForSourceDevice:", a3);
}

- (void)handleStudioLightingActiveChangedForDevice:(id)a3
{
  -[AVCapturePhotoOutput _updateMaxBracketedCapturePhotoCountForSourceDevice:](self, "_updateMaxBracketedCapturePhotoCountForSourceDevice:");
  -[AVCapturePhotoOutput _updateDepthDataDeliverySupportedForSourceDevice:](self, "_updateDepthDataDeliverySupportedForSourceDevice:", a3);
}

- (void)handleBackgroundReplacementActiveChangedForDevice:(id)a3
{
  -[AVCapturePhotoOutput _updateMaxBracketedCapturePhotoCountForSourceDevice:](self, "_updateMaxBracketedCapturePhotoCountForSourceDevice:");
  -[AVCapturePhotoOutput _updateDepthDataDeliverySupportedForSourceDevice:](self, "_updateDepthDataDeliverySupportedForSourceDevice:", a3);
}

uint64_t __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                         + 16)
                                                                             + 272) > 0;
  return result;
}

uint64_t __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                         + 16)
                                                                             + 276) > 0;
  return result;
}

- (void)_updateVirtualDeviceConstituentPhotoDeliveryAndDualCameraDualPhotoDeliverySupportedForSourceDevice:(id)a3
{
  int v5;
  int v6;
  AVCapturePhotoOutputInternal *internal;
  char v8;
  BOOL v9;
  char v10;
  int v11;
  _BOOL4 v12;

  v5 = objc_msgSend((id)objc_msgSend(a3, "constituentDevices"), "count");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "figCaptureSourceVideoFormat"), "capturesStillsFromVideoStream");
  internal = self->_internal;
  if (internal->spatialPhotoCaptureEnabled)
  {
    v8 = 1;
  }
  else
  {
    v9 = !internal->depthDataDeliveryEnabled || v5 <= 2;
    v8 = !v9;
  }
  if (objc_msgSend(a3, "isVirtualDevice")
    && ((unint64_t)objc_msgSend((id)objc_msgSend(a3, "constituentDevices"), "count") < 2 ? (v10 = 1) : (v10 = v8),
        (v10 & 1) == 0
     && ((objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isStillImageDisparitySupported") & 1) != 0
      || objc_msgSend(a3, "isConstituentPhotoCalibrationDataSupported"))))
  {
    if (self->_internal->appleProRAWEnabled)
      v11 = 0;
    else
      v11 = v6 ^ 1;
  }
  else
  {
    v11 = 0;
  }
  if (self->_internal->virtualDeviceConstituentPhotoDeliverySupported == v11)
  {
    if (!v11)
    {
LABEL_27:
      v12 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("virtualDeviceConstituentPhotoDeliverySupported"));
    self->_internal->virtualDeviceConstituentPhotoDeliverySupported = v11;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("virtualDeviceConstituentPhotoDeliverySupported"));
    if ((v11 & 1) == 0)
    {
      if (self->_internal->virtualDeviceConstituentPhotoDeliveryEnabled)
      {
        -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("virtualDeviceConstituentPhotoDeliveryEnabled"));
        self->_internal->virtualDeviceConstituentPhotoDeliveryEnabled = 0;
        -[AVCapturePhotoOutput _updateCameraCalibrationDataDeliverySupportedForSourceDevice:](self, "_updateCameraCalibrationDataDeliverySupportedForSourceDevice:", a3);
        -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("virtualDeviceConstituentPhotoDeliveryEnabled"));
      }
      goto LABEL_27;
    }
  }
  v12 = objc_msgSend(a3, "deviceType") == (_QWORD)CFSTR("AVCaptureDeviceTypeBuiltInDualCamera");
LABEL_28:
  if (self->_internal->dualCameraDualPhotoDeliverySupported != v12)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("dualCameraDualPhotoDeliverySupported"));
    self->_internal->dualCameraDualPhotoDeliverySupported = v12;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("dualCameraDualPhotoDeliverySupported"));
    if (!v12 && self->_internal->dualCameraDualPhotoDeliveryEnabled)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("dualCameraDualPhotoDeliveryEnabled"));
      self->_internal->dualCameraDualPhotoDeliveryEnabled = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("dualCameraDualPhotoDeliveryEnabled"));
    }
  }
}

uint64_t __64__AVCapturePhotoOutput__updateSupportedHDRModesForSourceDevice___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16) + 104) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_resetLivePhotoCaptureSuspended
{
  if (self->_internal->livePhotoCaptureSuspended)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("livePhotoCaptureSuspended"));
    self->_internal->livePhotoCaptureSuspended = 0;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("livePhotoCaptureSuspended"));
  }
}

- (void)_resetLivePhotoMovieProcessingSuspended
{
  if (self->_internal->livePhotoMovieProcessingSuspended)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("livePhotoMovieProcessingSuspended"));
    self->_internal->livePhotoMovieProcessingSuspended = 0;
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("livePhotoMovieProcessingSuspended"));
  }
}

- (void)_updateSpatialPhotoCaptureSupportedForDevice:(id)a3
{
  int BoolAnswer;
  AVCapturePhotoOutputInternal *internal;

  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "figCaptureSourceVideoFormat"), "isStereoPhotoCaptureSupported"))BoolAnswer = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQMZMLNHBX4MFF5QD4PJWZFEVCEI"));
  else
    BoolAnswer = 0;
  if (self->_internal->spatialPhotoCaptureSupported != BoolAnswer)
  {
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("spatialPhotoCaptureSupported"));
    -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stereoPhotoCaptureSupported"));
    self->_internal->spatialPhotoCaptureSupported = BoolAnswer;
    internal = self->_internal;
    if (!internal->spatialPhotoCaptureSupported && internal->spatialPhotoCaptureEnabled)
    {
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("spatialPhotoCaptureEnabled"));
      -[AVCapturePhotoOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stereoPhotoCaptureEnabled"));
      self->_internal->spatialPhotoCaptureEnabled = 0;
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stereoPhotoCaptureEnabled"));
      -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("spatialPhotoCaptureEnabled"));
    }
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stereoPhotoCaptureSupported"));
    -[AVCapturePhotoOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("spatialPhotoCaptureSupported"));
  }
}

- (void)_decrementObserverCountForKeyPath:(id)a3
{
  char v5;
  char v6;
  char v7;
  char v8;
  int v9;
  NSObject *sceneDetectionObserversDispatchQueue;
  _QWORD v11[5];
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;

  v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("isFlashScene"));
  v6 = objc_msgSend(a3, "isEqualToString:", CFSTR("isHDRScene"));
  v7 = objc_msgSend(a3, "isEqualToString:", CFSTR("isStillImageStabilizationScene"));
  v8 = objc_msgSend(a3, "isEqualToString:", CFSTR("digitalFlashStatus"));
  v9 = objc_msgSend(a3, "isEqualToString:", CFSTR("digitalFlashExposureTimes"));
  if ((v5 & 1) != 0 || (v6 & 1) != 0 || (v7 & 1) != 0 || (v8 & 1) != 0 || v9)
  {
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__AVCapturePhotoOutput__decrementObserverCountForKeyPath___block_invoke;
    v11[3] = &unk_1E421D640;
    v12 = v5;
    v11[4] = self;
    v13 = v6;
    v14 = v7;
    v15 = v8;
    v16 = v9;
    dispatch_async(sceneDetectionObserversDispatchQueue, v11);
  }
}

uint64_t __58__AVCapturePhotoOutput__decrementObserverCountForKeyPath___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 40))
  {
    v1 = 272;
  }
  else if (*(_BYTE *)(result + 41))
  {
    v1 = 276;
  }
  else if (*(_BYTE *)(result + 42))
  {
    v1 = 280;
  }
  else if (*(_BYTE *)(result + 43))
  {
    v1 = 288;
  }
  else
  {
    if (!*(_BYTE *)(result + 44))
      return result;
    v1 = 304;
  }
  --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16) + v1);
  return result;
}

- (id)_figCaptureMovieFileRecordingSettingsForAVMomentCaptureMovieRecordingSettings:(id)a3 momentCaptureSettings:(id)a4 delegate:(id)a5 connections:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  $2825F4736939C4A6D3AD43837233062D v26;
  unint64_t v27;
  uint64_t v28;
  __int128 v29;
  int v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  AVCapturePhotoOutput *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  char v41;
  __int16 v42;
  char v43;
  __int128 v44;
  CMTime v45;
  CMTime v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[2];
  _QWORD v54[2];
  _BYTE v55[128];
  uint64_t v56;

  v7 = v6;
  v56 = *MEMORY[0x1E0C80C00];
  v12 = objc_alloc_init(MEMORY[0x1E0D03BE0]);
  v39 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  if ((objc_msgSend(a3, "isAutoSpatialOverCaptureEnabled") & 1) == 0)
  {
    objc_msgSend(a3, "setSpatialOverCaptureMovieFileURL:", 0);
    objc_msgSend(a3, "setSpatialOverCaptureMovieMetadata:", 0);
  }
  v36 = a4;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v13 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (!v13)
  {
    v24 = 0;
LABEL_21:
    v34 = v7;
    LODWORD(v33) = 0;
    FigDebugAssert3();
    v15 = 0;
    goto LABEL_22;
  }
  v14 = v13;
  v35 = self;
  v37 = a3;
  v38 = v12;
  v40 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v50;
  v17 = *MEMORY[0x1E0CF2B90];
  v18 = *MEMORY[0x1E0CF2B68];
  v19 = *MEMORY[0x1E0CF2B78];
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v50 != v16)
        objc_enumerationMutation(a6);
      v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      v22 = (void *)objc_msgSend((id)objc_msgSend(v21, "inputPorts"), "firstObject");
      if (objc_msgSend(v21, "isEnabled") && objc_msgSend(v22, "isEnabled"))
      {
        v23 = (void *)objc_msgSend(v22, "mediaType");
        if ((objc_msgSend(v23, "isEqual:", v17) & 1) != 0)
        {
          v15 = v21;
        }
        else if ((objc_msgSend(v23, "isEqual:", v18) & 1) != 0)
        {
          v40 = v21;
        }
        else if (objc_msgSend(v23, "isEqual:", v19))
        {
          objc_msgSend(v39, "addObject:", v21);
        }
      }
    }
    v14 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  }
  while (v14);
  a3 = v37;
  v12 = v38;
  v7 = v6;
  self = v35;
  v24 = v40;
  if (!v15)
    goto LABEL_21;
LABEL_22:
  objc_msgSend(v12, "setSettingsID:", objc_msgSend(a3, "uniqueID", v33, v34));
  objc_msgSend(v12, "setIrisRecording:", 1);
  objc_msgSend(v12, "setIrisMovieRecording:", 1);
  objc_msgSend(v12, "setOutputURL:", objc_msgSend(a3, "movieFileURL"));
  v25 = *MEMORY[0x1E0CF2B08];
  objc_msgSend(v12, "setOutputFileType:", *MEMORY[0x1E0CF2B08]);
  v47 = *MEMORY[0x1E0CA2E18];
  v48 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  objc_msgSend(v12, "setMaxDuration:", &v47);
  objc_msgSend(v12, "setMaxFileSize:", 0);
  objc_msgSend(v12, "setMinFreeDiskSpaceLimit:", 0);
  v26 = -[AVCapturePhotoOutput livePhotoMovieDimensions](self, "livePhotoMovieDimensions");
  v27 = HIDWORD(*(unint64_t *)&v26);
  v53[0] = *MEMORY[0x1E0CA90E0];
  v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26);
  v53[1] = *MEMORY[0x1E0CA8FD8];
  v54[0] = v28;
  v54[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
  objc_msgSend(v12, "setVideoSettings:", -[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v15, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2), objc_msgSend(a3, "videoCodecType"), v25, 0, 0));
  objc_msgSend(v12, "setVideoMirrored:", objc_msgSend(v15, "isVideoMirrored"));
  objc_msgSend(v12, "setVideoOrientation:", objc_msgSend(v15, "_videoOrientation"));
  objc_msgSend(v12, "setRecordVideoOrientationAndMirroringChanges:", 1);
  objc_msgSend(v12, "setSendPreviewIOSurface:", 1);
  objc_msgSend(v12, "setDebugMetadataSidecarFileEnabled:", objc_msgSend(v15, "isDebugMetadataSidecarFileEnabled"));
  if (v24)
    objc_msgSend(v12, "setAudioSettings:", -[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v24, 0, 0, *MEMORY[0x1E0CF2B18], 0, 0));
  CMTimeMake(&v46, 1, 1);
  v45 = v46;
  objc_msgSend(v12, "setMovieFragmentInterval:", &v45);
  objc_msgSend(v12, "setMovieLevelMetadata:", objc_msgSend(MEMORY[0x1E0CF2D28], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(a3, "movieMetadata")));
  if (objc_msgSend((id)objc_msgSend(v15, "sourceDevice"), "isVirtualDevice")
    && (unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "sourceDevice"), "constituentDevices"), "count") >= 2)
  {
    if ((objc_msgSend((id)objc_msgSend(v36, "bravoCameraSelectionBehaviorForRecording"), "isEqualToString:", CFSTR("AVCaptureBravoCameraSelectionBehaviorEvaluatesContinuously")) & 1) != 0)
    {
      v29 = xmmword_19EEEA950;
    }
    else if ((objc_msgSend((id)objc_msgSend(v36, "bravoCameraSelectionBehaviorForRecording"), "isEqualToString:", CFSTR("AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange")) & 1) != 0)
    {
      v29 = xmmword_19EEEA960;
    }
    else
    {
      v30 = objc_msgSend((id)objc_msgSend(v36, "bravoCameraSelectionBehaviorForRecording"), "isEqualToString:", CFSTR("AVCaptureBravoCameraSelectionBehaviorEvaluatesNever"));
      v31 = 3;
      if (!v30)
        v31 = 0;
      v29 = (unint64_t)v31;
    }
    v43 = 0;
    v42 = 0;
    v41 = 1;
    v44 = v29;
    objc_msgSend(v12, "setBravoCameraSelectionConfigurationForRecording:", &v41);
  }
  if (objc_msgSend(a3, "isAutoSpatialOverCaptureEnabled"))
  {
    objc_msgSend(v12, "setSpatialOverCaptureMovieURL:", objc_msgSend(a3, "spatialOverCaptureMovieFileURL"));
    objc_msgSend(v12, "setSpatialOverCaptureMovieLevelMetadata:", objc_msgSend(MEMORY[0x1E0CF2D28], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(a3, "spatialOverCaptureMovieMetadata")));
  }
  return v12;
}

+ (__CFDictionary)_copyAttachmentsAndPropagateFaceRegionsToExifAuxDictionaryForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  const __CFAllocator *v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const void *Value;
  const void *v7;
  const void *v8;
  __CFDictionary *Mutable;
  __CFDictionary *v10;
  CFIndex Count;
  __CFDictionary *MutableCopy;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, 1u);
  v5 = v4;
  if (v4)
  {
    Value = CFDictionaryGetValue(v4, CFSTR("FaceRegions"));
    if (Value)
    {
      v7 = Value;
      v8 = (const void *)*MEMORY[0x1E0CBCA28];
      if (!CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CBCA28]))
      {
        Mutable = CFDictionaryCreateMutable(v3, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        if (Mutable)
        {
          v10 = Mutable;
          CFDictionarySetValue(Mutable, v8, v7);
          Count = CFDictionaryGetCount(v5);
          MutableCopy = CFDictionaryCreateMutableCopy(v3, Count, v5);
          CFDictionarySetValue(MutableCopy, v8, v10);
          CFRelease(v10);
          CFRelease(v5);
          return MutableCopy;
        }
      }
    }
  }
  return v5;
}

- (void)_dispatchFailureCallbacksForPhotoSettings:(id)a3 toDelegate:(id)a4 withError:(id)a5
{
  _BOOL8 v9;

  objc_opt_class();
  v9 = (objc_opt_isKindOfClass() & 1) != 0 && self->_internal->lensStabilizationDuringBracketedCaptureSupported;
  -[AVCapturePhotoOutput _dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:](self, "_dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:", 2147549183, +[AVCapturePhotoRequest requestWithDelegate:settings:lensStabilizationSupported:](AVCapturePhotoRequest, "requestWithDelegate:settings:lensStabilizationSupported:", a4, a3, v9), a5, 0);
}

- (void)_dispatchFailureCallbacks:(unsigned int)a3 forPhotoRequest:(id)a4 withError:(id)a5 cleanupRequest:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v11;
  uint64_t v12;
  char v13;
  BOOL v14;
  BOOL v15;
  char v16;
  BOOL v17;
  id v18;
  char v19;
  uint64_t v20;
  __int128 v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  AVCapturePhotoOutput *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t i;
  unsigned int v31;
  int v32;
  int v33;
  uint64_t v34;
  unsigned int v36;
  void *v37;
  int v38;
  int v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  _BOOL4 v52;
  _BOOL4 v53;
  char v54;
  unint64_t v55;
  AVCapturePhotoOutput *v56;
  void *v57;
  _QWORD v58[11];
  unsigned int v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v6 = a6;
  v68 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a4, "resolvedSettings"))
  {
    v56 = self;
    v54 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "isTurboModeEnabled");
    v11 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "flashMode");
    v12 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "HDRMode");
    v52 = v6;
    v50 = a5;
    if (v12 == 1)
      v13 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "isEV0PhotoDeliveryEnabled");
    else
      v13 = 0;
    v14 = v12 == 1;
    v15 = v11 == 1;
    v16 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "isSquareCropEnabled");
    v17 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURL") != 0;
    v18 = (id)objc_msgSend((id)objc_msgSend(a4, "expectedPhotoManifest"), "copy");
    v19 = objc_msgSend(a4, "firedCallbackFlags");
    v20 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "uniqueID");
    v21 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v64 = *MEMORY[0x1E0CA2E40];
    v65 = v21;
    v66 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    LOBYTE(v47) = v19 & 1;
    LOWORD(v46) = 0;
    LOBYTE(v45) = v16;
    HIWORD(v44) = 0;
    BYTE5(v44) = v13;
    *(_WORD *)((char *)&v44 + 3) = v14;
    *(_WORD *)((char *)&v44 + 1) = v15;
    LOBYTE(v44) = v54;
    LOBYTE(v42) = v17;
    self = v56;
    v6 = v52;
    a5 = v50;
    objc_msgSend(a4, "setResolvedSettings:", +[AVCaptureResolvedPhotoSettings resolvedSettingsWithUniqueID:photoDimensions:rawPhotoDimensions:previewDimensions:embeddedThumbnailDimensions:rawEmbeddedThumbnailDimensions:livePhotoMovieEnabled:livePhotoMovieDimensions:portraitEffectsMatteDimensions:hairSegmentationMatteDimensions:skinSegmentationMatteDimensions:teethSegmentationMatteDimensions:glassesSegmentationMatteDimensions:spatialOverCapturePhotoDimensions:turboModeEnabled:flashEnabled:redEyeReductionEnabled:HDREnabled:adjustedPhotoFiltersEnabled:EV0PhotoDeliveryEnabled:stillImageStabilizationEnabled:virtualDeviceFusionEnabled:squareCropEnabled:deferredPhotoProxyDimensions:photoProcessingTimeRange:contentAwareDistortionCorrectionEnabled:spatialPhotoCaptureEnabled:photoManifest:digitalFlashUserInterfaceHints:digitalFlashUserInterfaceRGBEstimate:captureBeforeResolvingSettingsEnabled:](AVCaptureResolvedPhotoSettings, "resolvedSettingsWithUniqueID:photoDimensions:rawPhotoDimensions:previewDimensions:embeddedThumbnailDimensions:rawEmbeddedThumbnailDimensions:livePhotoMovieEnabled:livePhotoMovieDimensions:portraitEffectsMatteDimensions:hairSegmentationMatteDimensions:skinSegmentationMatteDimensions:teethSegmentationMatteDimensions:glassesSegmentationMatteDimensions:spatialOverCapturePhotoDimensions:turboModeEnabled:flashEnabled:redEyeReductionEnabled:HDREnabled:adjustedPhotoFiltersEnabled:EV0PhotoDeliveryEnabled:stillImageStabilizationEnabled:virtualDeviceFusionEnabled:squareCropEnabled:deferredPhotoProxyDimensions:photoProcessingTimeRange:contentAwareDistortionCorrectionEnabled:spatialPhotoCaptureEnabled:photoManifest:digitalFlashUserInterfaceHints:digitalFlashUserInterfaceRGBEstimate:captureBeforeResolvingSettingsEnabled:", v20, 0, 0, 0, 0, 0, v42,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        v44,
        v45,
        0,
        &v64,
        v46,
        v18,
        0,
        0,
        v47));
  }
  v22 = (void *)objc_msgSend(a4, "resolvedSettings");
  v23 = objc_msgSend(a4, "firedCallbackFlags");
  *(_QWORD *)&v64 = 0;
  *((_QWORD *)&v64 + 1) = &v64;
  v65 = 0x2020000000uLL;
  v55 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count");
  objc_msgSend(a4, "unresolvedSettings");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = (void *)objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "bracketedSettings");
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v48 = v22;
    v24 = (void *)objc_msgSend(v22, "photoManifest");
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    v51 = a5;
    v53 = v6;
    v26 = self;
    v27 = 0;
    v28 = 0;
    if (v25)
    {
      v29 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v61 != v29)
            objc_enumerationMutation(v24);
          v31 = objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "unsignedIntValue");
          if ((v31 & 0x10000) == 0)
            ++v27;
          v28 += ((v31 >> 7) & 1) + (unint64_t)((v31 & 0x10000) >> 16);
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
      }
      while (v25);
    }
    if (v55)
    {
      v27 /= v55;
      v28 /= v55;
    }
    self = v26;
    v6 = v53;
    a5 = v51;
    v22 = v48;
    if (objc_msgSend(v57, "count") != v27 && objc_msgSend(v57, "count") != v28)
    {
      v43 = v49;
      LODWORD(v42) = 0;
      FigDebugAssert3();
    }
  }
  else
  {
    v57 = 0;
  }
  if ((((v23 & 2) == 0) & (a3 >> 1)) != 0)
    v32 = 2;
  else
    v32 = 0;
  if ((((v23 & 4) == 0) & (a3 >> 2)) != 0)
    v32 |= 4u;
  if ((((v23 & 8) == 0) & (a3 >> 3)) != 0)
    v33 = v32 | 8;
  else
    v33 = v32;
  if ((a3 & 0x8000) != 0 && (v23 & 0x8000) == 0)
  {
    -[AVCapturePhotoOutput _updateCaptureReadinessStateForCompletedRequest:](self, "_updateCaptureReadinessStateForCompletedRequest:", a4);
    v33 |= 0x8000u;
  }
  if ((a3 & 0x10) != 0 && (v23 & 0x10) == 0)
  {
    v34 = objc_msgSend(a4, "firedPhotoCallbacksCount");
    *(_QWORD *)(*((_QWORD *)&v64 + 1) + 24) = v34;
    objc_msgSend(a4, "setFiredPhotoCallbacksCount:", objc_msgSend((id)objc_msgSend(v22, "photoManifest"), "count"));
    v33 |= 0x10u;
  }
  if (objc_msgSend(v22, "livePhotoMovieEnabled", v42, v43)
    && !objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "videoFileURL"))
  {
    if (objc_msgSend(v22, "isEV0PhotoDeliveryEnabled")
      && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto"))
    {
      v38 = (((v23 & 0x20) == 0) & (a3 >> 5)) != 0 ? v33 | 0x20 : v33;
      v33 = (((v23 & 0x200) == 0) & (a3 >> 9)) != 0 ? v38 | 0x200 : v38;
      if ((int)objc_msgSend(v22, "spatialOverCapturePhotoDimensions") >= 1
        && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"))
      {
        if ((((v23 & 0x40) == 0) & (a3 >> 6)) != 0)
          v39 = v33 | 0x40;
        else
          v39 = v33;
        if ((((v23 & 0x400) == 0) & (a3 >> 10)) != 0)
          v33 = v39 | 0x400;
        else
          v33 = v39;
      }
    }
    if ((((v23 & 0x80) == 0) & (a3 >> 7)) != 0)
      v40 = v33 | 0x80;
    else
      v40 = v33;
    if ((((v23 & 0x800) == 0) & (a3 >> 11)) != 0)
      v33 = v40 | 0x800;
    else
      v33 = v40;
    if ((int)objc_msgSend(v22, "spatialOverCapturePhotoDimensions") >= 1
      && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL"))
    {
      if ((((v23 & 0x100) == 0) & (a3 >> 8)) != 0)
        v41 = v33 | 0x100;
      else
        v41 = v33;
      if ((((v23 & 0x1000) == 0) & (a3 >> 12)) != 0)
        v33 = v41 | 0x1000;
      else
        v33 = v41;
    }
  }
  if (objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "HEICSFileURL")
    && (((v23 & 0x2000) == 0) & (a3 >> 13)) != 0)
  {
    v33 |= 0x2000u;
  }
  if (objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "videoFileURL")
    && (((v23 & 0x4000) == 0) & (a3 >> 14)) != 0)
  {
    v33 |= 0x4000u;
  }
  if (v23 > -1 && (a3 & 0x80000000) != 0)
    v36 = v33 | 0x80000000;
  else
    v36 = v33;
  objc_msgSend(a4, "setFiredCallbackFlags:", v36 | objc_msgSend(a4, "firedCallbackFlags"));
  v37 = (void *)objc_msgSend(a4, "delegateStorage");
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __91__AVCapturePhotoOutput__dispatchFailureCallbacks_forPhotoRequest_withError_cleanupRequest___block_invoke_3;
  v58[3] = &unk_1E421D690;
  v59 = v36;
  v58[4] = self;
  v58[5] = v22;
  v58[6] = a4;
  v58[7] = v57;
  v58[9] = &v64;
  v58[10] = v55;
  v58[8] = a5;
  objc_msgSend(v37, "invokeDelegateCallbackWithBlock:", v58);
  if (v6)
  {
    MEMORY[0x1A1AF1298](self->_internal->requestsLock);
    -[NSMutableArray removeObject:](self->_internal->photoRequests, "removeObject:", a4);
    MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  }
  _Block_object_dispose(&v64, 8);
}

unint64_t __91__AVCapturePhotoOutput__dispatchFailureCallbacks_forPhotoRequest_withError_cleanupRequest___block_invoke_3(unint64_t result, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  __int128 *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AVCaptureDeferredPhotoProxy *v15;
  AVCaptureDeferredPhotoProxy *v16;
  AVCapturePhoto *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;

  v3 = result;
  if ((*(_BYTE *)(result + 88) & 2) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(a2, "captureOutput:willBeginCaptureForResolvedSettings:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
  }
  if ((*(_BYTE *)(v3 + 88) & 4) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(a2, "captureOutput:willCapturePhotoForResolvedSettings:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
  }
  if ((*(_BYTE *)(v3 + 88) & 8) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(a2, "captureOutput:didCapturePhotoForResolvedSettings:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
  }
  if ((*(_BYTE *)(v3 + 89) & 0x80) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(a2, "captureOutput:readyForResponsiveRequestAfterResolvedSettings:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
  }
  if ((*(_BYTE *)(v3 + 88) & 0x10) != 0)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 72) + 8) + 24);
    result = objc_msgSend(*(id *)(v3 + 48), "expectedPhotoCount");
    if (v4 < result)
    {
      v5 = (__int128 *)MEMORY[0x1E0CA2E18];
      do
      {
        v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "resolvedSettings"), "photoManifest"), "objectAtIndexedSubscript:", v4), "unsignedIntValue");
        if (*(_QWORD *)(v3 + 56))
        {
          v7 = v4;
          if (objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "rawPhotoPixelFormatType"))v7 = v4 >> (objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "formatFourCC") != 0);
          v8 = *(_QWORD *)(v3 + 80);
          if (v8)
            v7 /= v8;
          v9 = objc_msgSend(*(id *)(v3 + 56), "objectAtIndexedSubscript:", v7);
          v10 = v7 + 1;
        }
        else
        {
          v9 = 0;
          v10 = 0;
        }
        ++v4;
        if (objc_msgSend(*(id *)(v3 + 48), "photoCallbackFlavor"))
        {
          if (objc_msgSend(*(id *)(v3 + 48), "photoCallbackFlavor") == 1)
          {
            v11 = *(_QWORD *)(v3 + 32);
            v12 = *(_QWORD *)(v3 + 40);
            v13 = *(_QWORD *)(v3 + 64);
            if ((v6 & 0x10080) != 0)
              objc_msgSend(a2, "captureOutput:didFinishProcessingRawPhotoSampleBuffer:previewPhotoSampleBuffer:resolvedSettings:bracketSettings:error:", v11, 0, 0, v12, v9, v13);
            else
              objc_msgSend(a2, "captureOutput:didFinishProcessingPhotoSampleBuffer:previewPhotoSampleBuffer:resolvedSettings:bracketSettings:error:", v11, 0, 0, v12, v9, v13);
          }
        }
        else
        {
          v14 = po_metadataWithMakerNoteProcessingFlags(v6);
          if (objc_msgSend(*(id *)(v3 + 40), "deferredPhotoProxyDimensions"))
          {
            v15 = [AVCaptureDeferredPhotoProxy alloc];
            v64 = *v5;
            v65 = *((_QWORD *)v5 + 2);
            v16 = -[AVCaptureDeferredPhotoProxy initWithApplicationIdentifier:captureRequestIdentifier:photoIdentifier:timestamp:expectedPhotoProcessingFlags:](v15, "initWithApplicationIdentifier:captureRequestIdentifier:photoIdentifier:timestamp:expectedPhotoProcessingFlags:", 0, 0, 0, &v64, v6);
            objc_msgSend(a2, "captureOutput:didFinishCapturingDeferredPhotoProxy:error:", *(_QWORD *)(v3 + 32), v16, *(_QWORD *)(v3 + 64));
          }
          else
          {
            v17 = [AVCapturePhoto alloc];
            v18 = *(_QWORD *)(v3 + 48);
            v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 376);
            v64 = *v5;
            v65 = *((_QWORD *)v5 + 2);
            LODWORD(v61) = v6;
            v16 = -[AVCapturePhoto initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:](v17, "initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:", &v64, 0, 0, 0, 0, 0, v14, 0, 0, 0, 0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    v18,
                    v9,
                    v10,
                    v4,
                    v61,
                    v19);
            objc_msgSend(a2, "captureOutput:didFinishProcessingPhoto:error:", *(_QWORD *)(v3 + 32), v16, *(_QWORD *)(v3 + 64));
          }

        }
        result = objc_msgSend(*(id *)(v3 + 48), "expectedPhotoCount");
      }
      while (v4 < result);
    }
  }
  if ((*(_BYTE *)(v3 + 89) & 0x20) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(a2, "captureOutput:didFinishProcessingPhotoFileAtURL:resolvedSettings:error:", *(_QWORD *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "HEICSFileURL"), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 64));
  }
  if ((*(_BYTE *)(v3 + 88) & 0x20) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(a2, "captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:", *(_QWORD *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto"), *(_QWORD *)(v3 + 40));
  }
  if ((*(_BYTE *)(v3 + 88) & 0x40) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(a2, "captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:", *(_QWORD *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"), *(_QWORD *)(v3 + 40));
  }
  if ((*(_BYTE *)(v3 + 88) & 0x80) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(a2, "captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:", *(_QWORD *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "livePhotoMovieFileURL"), *(_QWORD *)(v3 + 40));
  }
  if ((*(_BYTE *)(v3 + 89) & 1) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(a2, "captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:", *(_QWORD *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL"), *(_QWORD *)(v3 + 40));
  }
  if ((*(_BYTE *)(v3 + 89) & 2) != 0)
  {
    if (objc_msgSend(*(id *)(v3 + 48), "delegateSupportsMetadataIdentifiersCallback"))
    {
      v20 = *(_QWORD *)(v3 + 32);
      v21 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto");
      v22 = *(_QWORD *)(v3 + 40);
      v23 = *(_QWORD *)(v3 + 64);
      v64 = *MEMORY[0x1E0CA2E18];
      v65 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v62 = v64;
      v63 = v65;
      result = objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:metadataIdentifiers:resolvedSettings:error:", v20, v21, &v64, &v62, MEMORY[0x1E0C9AA70], v22, v23);
    }
    else
    {
      v24 = objc_msgSend(*(id *)(v3 + 48), "delegateSupportsDebugMetadataSidecarFile");
      v25 = *(_QWORD *)(v3 + 32);
      v26 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto");
      v27 = *(_QWORD *)(v3 + 40);
      v28 = *(_QWORD *)(v3 + 64);
      v64 = *MEMORY[0x1E0CA2E18];
      v65 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v62 = v64;
      v63 = v65;
      if (v24)
        result = objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:debugMetadataSidecarFileURL:duration:photoDisplayTime:resolvedSettings:error:", v25, v26, 0, &v64, &v62, v27, v28);
      else
        result = objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:resolvedSettings:error:", v25, v26, &v64, &v62, v27, v28);
    }
  }
  if ((*(_BYTE *)(v3 + 89) & 4) != 0)
  {
    if (objc_msgSend(*(id *)(v3 + 48), "delegateSupportsMetadataIdentifiersCallback"))
    {
      v29 = *(_QWORD *)(v3 + 32);
      v30 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto");
      v31 = *(_QWORD *)(v3 + 40);
      v32 = *(_QWORD *)(v3 + 64);
      v64 = *MEMORY[0x1E0CA2E18];
      v65 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v62 = v64;
      v63 = v65;
      result = objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:metadataIdentifiers:resolvedSettings:error:", v29, v30, &v64, &v62, MEMORY[0x1E0C9AA70], v31, v32);
    }
    else
    {
      v33 = objc_msgSend(*(id *)(v3 + 48), "delegateSupportsDebugMetadataSidecarFile");
      v34 = *(_QWORD *)(v3 + 32);
      v35 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto");
      v36 = *(_QWORD *)(v3 + 40);
      v37 = *(_QWORD *)(v3 + 64);
      v64 = *MEMORY[0x1E0CA2E18];
      v65 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v62 = v64;
      v63 = v65;
      if (v33)
        result = objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:debugMetadataSidecarFileURL:duration:photoDisplayTime:resolvedSettings:error:", v34, v35, 0, &v64, &v62, v36, v37);
      else
        result = objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:resolvedSettings:error:", v34, v35, &v64, &v62, v36, v37);
    }
  }
  if ((*(_BYTE *)(v3 + 89) & 8) != 0)
  {
    if (objc_msgSend(*(id *)(v3 + 48), "delegateSupportsMetadataIdentifiersCallback"))
    {
      v38 = *(_QWORD *)(v3 + 32);
      v39 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "livePhotoMovieFileURL");
      v40 = *(_QWORD *)(v3 + 40);
      v41 = *(_QWORD *)(v3 + 64);
      v64 = *MEMORY[0x1E0CA2E18];
      v65 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v62 = v64;
      v63 = v65;
      result = objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:metadataIdentifiers:resolvedSettings:error:", v38, v39, &v64, &v62, MEMORY[0x1E0C9AA70], v40, v41);
    }
    else
    {
      v42 = objc_msgSend(*(id *)(v3 + 48), "delegateSupportsDebugMetadataSidecarFile");
      v43 = *(_QWORD *)(v3 + 32);
      v44 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "livePhotoMovieFileURL");
      v45 = *(_QWORD *)(v3 + 40);
      v46 = *(_QWORD *)(v3 + 64);
      v64 = *MEMORY[0x1E0CA2E18];
      v65 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v62 = v64;
      v63 = v65;
      if (v42)
        result = objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:debugMetadataSidecarFileURL:duration:photoDisplayTime:resolvedSettings:error:", v43, v44, 0, &v64, &v62, v45, v46);
      else
        result = objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:resolvedSettings:error:", v43, v44, &v64, &v62, v45, v46);
    }
  }
  if ((*(_BYTE *)(v3 + 89) & 0x10) != 0)
  {
    if (objc_msgSend(*(id *)(v3 + 48), "delegateSupportsMetadataIdentifiersCallback"))
    {
      v47 = *(_QWORD *)(v3 + 32);
      v48 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL");
      v49 = *(_QWORD *)(v3 + 40);
      v50 = *(_QWORD *)(v3 + 64);
      v64 = *MEMORY[0x1E0CA2E18];
      v65 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v62 = v64;
      v63 = v65;
      result = objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:metadataIdentifiers:resolvedSettings:error:", v47, v48, &v64, &v62, MEMORY[0x1E0C9AA70], v49, v50);
    }
    else
    {
      v51 = objc_msgSend(*(id *)(v3 + 48), "delegateSupportsDebugMetadataSidecarFile");
      v52 = *(_QWORD *)(v3 + 32);
      v53 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL");
      v54 = *(_QWORD *)(v3 + 40);
      v55 = *(_QWORD *)(v3 + 64);
      v64 = *MEMORY[0x1E0CA2E18];
      v65 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v62 = v64;
      v63 = v65;
      if (v51)
        result = objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:debugMetadataSidecarFileURL:duration:photoDisplayTime:resolvedSettings:error:", v52, v53, 0, &v64, &v62, v54, v55);
      else
        result = objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:resolvedSettings:error:", v52, v53, &v64, &v62, v54, v55);
    }
  }
  v56 = *(_DWORD *)(v3 + 88);
  if ((v56 & 0x4000) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      v57 = *(_QWORD *)(v3 + 32);
      v58 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "videoFileURL");
      v59 = *(_QWORD *)(v3 + 40);
      v60 = *(_QWORD *)(v3 + 64);
      v64 = *MEMORY[0x1E0CA2E18];
      v65 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      result = objc_msgSend(a2, "captureOutput:didFinishProcessingVideoFileAtURL:resolvedSettings:previewPixelBuffer:recordedDuration:error:", v57, v58, v59, 0, &v64, v60);
    }
    v56 = *(_DWORD *)(v3 + 88);
  }
  if (v56 < 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "captureOutput:didFinishCaptureForResolvedSettings:error:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 64));
  }
  return result;
}

- (id)_photoRequestForUniqueID:(int64_t)a3
{
  NSMutableArray *photoRequests;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A1AF1298](self->_internal->requestsLock, a2);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  photoRequests = self->_internal->photoRequests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](photoRequests, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(photoRequests);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "unresolvedSettings"), "uniqueID") == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](photoRequests, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:
  MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  return v11;
}

- (void)_dispatchFailureCallbacksForMovieRecordingSettings:(id)a3 momentCaptureSettings:(id)a4 toDelegate:(id)a5 withError:(id)a6
{
  -[AVCapturePhotoOutput _dispatchFailureCallbacks:forMovieRequest:withError:cleanupRequest:](self, "_dispatchFailureCallbacks:forMovieRequest:withError:cleanupRequest:", 63, +[AVMomentCaptureMovieRequest requestWithDelegate:movieRecordingSettings:momentSettings:](AVMomentCaptureMovieRequest, "requestWithDelegate:movieRecordingSettings:momentSettings:", a5, a3, a4), a6, 0);
}

- (void)_dispatchFailureCallbacks:(unsigned int)a3 forMovieRequest:(id)a4 withError:(id)a5 cleanupRequest:(BOOL)a6
{
  _BOOL4 v6;
  void *v11;
  char v12;
  char v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;
  _QWORD v20[8];
  int v21;

  v6 = a6;
  if (!objc_msgSend(a4, "resolvedSettings"))
    objc_msgSend(a4, "setResolvedSettings:", +[AVMomentCaptureMovieRecordingResolvedSettings movieRecordingResolvedSettingsWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:](AVMomentCaptureMovieRecordingResolvedSettings, "movieRecordingResolvedSettingsWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:", objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "uniqueID"), objc_msgSend((id)objc_msgSend(a4, "momentCaptureSettings"), "torchMode") == 1, objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "movieFileURL"), 0, 0));
  v11 = (void *)objc_msgSend(a4, "resolvedSettings");
  v12 = objc_msgSend(a4, "firedCallbackFlags");
  v13 = v12;
  v14 = a3 & ((v12 & 1) == 0);
  if ((((v12 & 2) == 0) & (a3 >> 1)) != 0)
    v14 |= 2u;
  if ((((v12 & 8) == 0) & (a3 >> 3)) != 0)
    v14 |= 8u;
  if ((((v12 & 0x20) == 0) & (a3 >> 5)) != 0)
    v15 = v14 | 0x20;
  else
    v15 = v14;
  v16 = objc_msgSend(v11, "spatialOverCaptureURL");
  if ((((v13 & 4) == 0) & (a3 >> 2)) != 0)
    v17 = v15 | 4;
  else
    v17 = v15;
  if ((((v13 & 0x10) == 0) & (a3 >> 4)) != 0)
    v17 |= 0x10u;
  if (v16)
    v18 = v17;
  else
    v18 = v15;
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | v18);
  v19 = (void *)objc_msgSend(a4, "delegateStorage");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __91__AVCapturePhotoOutput__dispatchFailureCallbacks_forMovieRequest_withError_cleanupRequest___block_invoke;
  v20[3] = &unk_1E421D6B8;
  v21 = v18;
  v20[4] = self;
  v20[5] = v11;
  v20[6] = a4;
  v20[7] = a5;
  objc_msgSend(v19, "invokeDelegateCallbackWithBlock:", v20);
  if (v6)
  {
    MEMORY[0x1A1AF1298](self->_internal->requestsLock);
    -[NSMutableArray removeObject:](self->_internal->movieRequests, "removeObject:", a4);
    MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  }
}

uint64_t __91__AVCapturePhotoOutput__dispatchFailureCallbacks_forMovieRequest_withError_cleanupRequest___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v3 = result;
  if ((*(_BYTE *)(result + 64) & 1) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(a2, "captureOutput:didBeginMovieCaptureForResolvedSettings:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
  }
  if ((*(_BYTE *)(v3 + 64) & 2) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (!objc_msgSend(*(id *)(v3 + 48), "movie"))
        objc_msgSend(*(id *)(v3 + 48), "setMovie:", +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(v3 + 48), "resolvedSettings"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "movieFileURL"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "movieMetadata")));
      result = objc_msgSend(a2, "captureOutput:didFinishRecordingMovie:", *(_QWORD *)(v3 + 32), objc_msgSend(*(id *)(v3 + 48), "movie"));
    }
    else
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        result = objc_msgSend(a2, "captureOutput:didFinishRecordingMovieFileAtEventualURL:resolvedSettings:", *(_QWORD *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "movieFileURL"), *(_QWORD *)(v3 + 40));
    }
  }
  if ((*(_BYTE *)(v3 + 64) & 4) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (!objc_msgSend(*(id *)(v3 + 48), "spatialOverCaptureMovie"))
        objc_msgSend(*(id *)(v3 + 48), "setSpatialOverCaptureMovie:", +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(v3 + 48), "resolvedSettings"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureMovieFileURL"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureMovieMetadata")));
      result = objc_msgSend(a2, "captureOutput:didFinishRecordingMovie:", *(_QWORD *)(v3 + 32), objc_msgSend(*(id *)(v3 + 48), "spatialOverCaptureMovie"));
    }
    else
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        result = objc_msgSend(a2, "captureOutput:didFinishRecordingMovieFileAtEventualURL:resolvedSettings:", *(_QWORD *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureMovieFileURL"), *(_QWORD *)(v3 + 40));
    }
  }
  if ((*(_BYTE *)(v3 + 64) & 8) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (!objc_msgSend(*(id *)(v3 + 48), "movie"))
        objc_msgSend(*(id *)(v3 + 48), "setMovie:", +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(v3 + 48), "resolvedSettings"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "movieFileURL"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "movieMetadata")));
      result = objc_msgSend(a2, "captureOutput:didFinishWritingMovie:error:", *(_QWORD *)(v3 + 32), objc_msgSend(*(id *)(v3 + 48), "movie"), *(_QWORD *)(v3 + 56));
    }
    else
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
      {
        v4 = *(_QWORD *)(v3 + 32);
        v5 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "movieFileURL");
        v6 = *(_QWORD *)(v3 + 40);
        v7 = *(_QWORD *)(v3 + 56);
        v12 = *MEMORY[0x1E0CA2E18];
        v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
        result = objc_msgSend(a2, "captureOutput:didFinishWritingMovieFileAtURL:debugMetadataSidecarFileURL:previewPixelBuffer:duration:resolvedSettings:error:", v4, v5, 0, 0, &v12, v6, v7);
      }
    }
  }
  if ((*(_BYTE *)(v3 + 64) & 0x10) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (!objc_msgSend(*(id *)(v3 + 48), "spatialOverCaptureMovie"))
        objc_msgSend(*(id *)(v3 + 48), "setSpatialOverCaptureMovie:", +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(v3 + 48), "resolvedSettings"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureMovieFileURL"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureMovieMetadata")));
      result = objc_msgSend(a2, "captureOutput:didFinishWritingMovie:error:", *(_QWORD *)(v3 + 32), objc_msgSend(*(id *)(v3 + 48), "spatialOverCaptureMovie"), *(_QWORD *)(v3 + 56));
    }
    else
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
      {
        v8 = *(_QWORD *)(v3 + 32);
        v9 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureMovieFileURL");
        v10 = *(_QWORD *)(v3 + 40);
        v11 = *(_QWORD *)(v3 + 56);
        v12 = *MEMORY[0x1E0CA2E18];
        v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
        result = objc_msgSend(a2, "captureOutput:didFinishWritingMovieFileAtURL:debugMetadataSidecarFileURL:previewPixelBuffer:duration:resolvedSettings:error:", v8, v9, 0, 0, &v12, v10, v11);
      }
    }
  }
  if ((*(_BYTE *)(v3 + 64) & 0x20) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "captureOutput:didFinishMovieCaptureForResolvedSettings:error:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 56));
  }
  return result;
}

- (id)_movieRequestForUniqueID:(int64_t)a3
{
  NSMutableArray *movieRequests;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A1AF1298](self->_internal->requestsLock, a2);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  movieRequests = self->_internal->movieRequests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieRequests, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(movieRequests);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "unresolvedSettings"), "uniqueID") == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieRequests, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:
  MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  return v11;
}

- (id)_errorForFigCaptureSessionNotificationPayloadErrorStatus:(int)a3 userInfo:(id)a4
{
  if (!a3)
    return 0;
  if (a3 == -15541)
    return (id)AVLocalizedError();
  return (id)AVLocalizedErrorWithUnderlyingOSStatus();
}

- (void)_handleWillBeginCaptureBeforeResolvingSettingsNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  void *v6;
  _QWORD v7[6];

  if (!objc_msgSend(a4, "resolvedSettings", a3))
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 1);
    v6 = (void *)objc_msgSend(a4, "delegateStorage");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __105__AVCapturePhotoOutput__handleWillBeginCaptureBeforeResolvingSettingsNotificationWithPayload_forRequest___block_invoke;
    v7[3] = &unk_1E42175B8;
    v7[4] = self;
    v7[5] = a4;
    objc_msgSend(v6, "invokeDelegateCallbackWithBlock:", v7);
  }
}

uint64_t __105__AVCapturePhotoOutput__handleWillBeginCaptureBeforeResolvingSettingsNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "captureOutput:willBeginCaptureBeforeResolvingSettingsForUniqueID:", *(_QWORD *)(a1 + 32), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "unresolvedSettings"), "uniqueID"));
  return result;
}

- (void)_handleWillBeginCaptureNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  __int128 v12;
  const __CFDictionary *v13;
  char v14;
  id v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  int v41;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  unsigned int v53;
  uint64_t v54;
  unsigned int v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  AVCapturePhotoOutput *v66;
  _QWORD v67[6];
  CMTimeRange v68;
  CMTimeRange v69;
  uint64_t v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v65 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D046E0]), "intValue");
  v64 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D046D8]), "intValue");
  if (objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "previewPhotoFormat"))
  {
    LODWORD(v7) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04660]), "intValue");
    v63 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04658]), "intValue") << 32;
    v7 = v7;
  }
  else
  {
    v63 = 0;
    v7 = 0;
  }
  v61 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04700]), "intValue");
  v60 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D046F8]), "intValue");
  v59 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04688]), "intValue");
  v58 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04680]), "intValue");
  v57 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04678]), "intValue");
  v56 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04670]), "intValue");
  v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04620]), "intValue");
  v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04618]), "intValue");
  v55 = v8;
  v62 = v7;
  v54 = v9;
  v10 = v8 >= 1 && (int)v9 > 0 || objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURL") != 0;
  v31 = v10;
  v53 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04650]), "intValue");
  v52 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04648]), "intValue");
  v51 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04608]), "intValue");
  v50 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04600]), "intValue");
  v49 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D046A8]), "intValue");
  v48 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D046A0]), "intValue");
  v47 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D046F0]), "intValue");
  v46 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D046E8]), "intValue");
  v45 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D045F0]), "intValue");
  v44 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D045E8]), "intValue");
  v43 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D046C0]), "intValue");
  v42 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D046B8]), "intValue");
  v11 = *MEMORY[0x1E0D04628];
  if (objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04628]))
    v41 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v11), "BOOLValue") ^ 1;
  else
    LOBYTE(v41) = 0;
  v66 = self;
  v40 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D045E0]), "BOOLValue");
  v39 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04690]), "BOOLValue");
  v38 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D045F8]), "BOOLValue");
  v37 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04668]), "BOOLValue");
  v36 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04630]), "BOOLValue");
  v35 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04698]), "BOOLValue");
  v34 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D046C8]), "BOOLValue");
  v33 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D045B8]), "BOOLValue");
  v12 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&v69.start.value = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&v69.start.epoch = v12;
  *(_OWORD *)&v69.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v13 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04640]);
  if (v13)
    CMTimeRangeMakeFromDictionary(&v69, v13);
  v32 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04610]), "BOOLValue");
  v14 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D046D0]), "BOOLValue");
  v15 = (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04638]);
  v16 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D045C8]), "intValue");
  v17 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D045C0]), "intValue");
  v18 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  if ((_DWORD)v18 && !v15)
    v15 = (id)objc_msgSend((id)objc_msgSend(a4, "expectedPhotoManifest"), "copy");
  v19 = objc_msgSend(a4, "firedCallbackFlags");
  v20 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D045D0]), "unsignedIntegerValue");
  v21 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D045D8]);
  v22 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "uniqueID");
  v68 = v69;
  LOBYTE(v30) = v19 & 1;
  BYTE1(v29) = v14;
  LOBYTE(v29) = v32;
  LOBYTE(v28) = v34;
  HIBYTE(v27) = v33;
  BYTE6(v27) = v35;
  BYTE5(v27) = v36;
  BYTE4(v27) = v37;
  BYTE3(v27) = v38;
  BYTE2(v27) = v39;
  BYTE1(v27) = v40;
  LOBYTE(v27) = v41;
  LOBYTE(v26) = v31;
  v23 = +[AVCaptureResolvedPhotoSettings resolvedSettingsWithUniqueID:photoDimensions:rawPhotoDimensions:previewDimensions:embeddedThumbnailDimensions:rawEmbeddedThumbnailDimensions:livePhotoMovieEnabled:livePhotoMovieDimensions:portraitEffectsMatteDimensions:hairSegmentationMatteDimensions:skinSegmentationMatteDimensions:teethSegmentationMatteDimensions:glassesSegmentationMatteDimensions:spatialOverCapturePhotoDimensions:turboModeEnabled:flashEnabled:redEyeReductionEnabled:HDREnabled:adjustedPhotoFiltersEnabled:EV0PhotoDeliveryEnabled:stillImageStabilizationEnabled:virtualDeviceFusionEnabled:squareCropEnabled:deferredPhotoProxyDimensions:photoProcessingTimeRange:contentAwareDistortionCorrectionEnabled:spatialPhotoCaptureEnabled:photoManifest:digitalFlashUserInterfaceHints:digitalFlashUserInterfaceRGBEstimate:captureBeforeResolvingSettingsEnabled:](AVCaptureResolvedPhotoSettings, "resolvedSettingsWithUniqueID:photoDimensions:rawPhotoDimensions:previewDimensions:embeddedThumbnailDimensions:rawEmbeddedThumbnailDimensions:livePhotoMovieEnabled:livePhotoMovieDimensions:portraitEffectsMatteDimensions:hairSegmentationMatteDimensions:skinSegmentationMatteDimensions:teethSegmentationMatteDimensions:glassesSegmentationMatteDimensions:spatialOverCapturePhotoDimensions:turboModeEnabled:flashEnabled:redEyeReductionEnabled:HDREnabled:adjustedPhotoFiltersEnabled:EV0PhotoDeliveryEnabled:stillImageStabilizationEnabled:virtualDeviceFusionEnabled:squareCropEnabled:deferredPhotoProxyDimensions:photoProcessingTimeRange:contentAwareDistortionCorrectionEnabled:spatialPhotoCaptureEnabled:photoManifest:digitalFlashUserInterfaceHints:digitalFlashUserInterfaceRGBEstimate:captureBeforeResolvingSettingsEnabled:", v22, v65 | (unint64_t)(v64 << 32), v57 | (unint64_t)(v56 << 32), v62 | v63, v61 | (unint64_t)(v60 << 32), v59 | (unint64_t)(v58 << 32), v26, v55 | (unint64_t)(v54 << 32), v53 | (unint64_t)(v52 << 32), v51 | (unint64_t)(v50 << 32),
          v49 | (unint64_t)(v48 << 32),
          v47 | (unint64_t)(v46 << 32),
          v45 | (unint64_t)(v44 << 32),
          v43 | (unint64_t)(v42 << 32),
          v27,
          v28,
          v16 | (unint64_t)(v17 << 32),
          &v68,
          v29,
          v15,
          v20,
          v21,
          v30);
  objc_msgSend(a4, "setResolvedSettings:", v23);
  MEMORY[0x1A1AF1298](v66->_internal->requestsLock);
  v24 = -[AVCapturePhotoOutput _requestUsesWaitingForCaptureReadiness:](v66, "_requestUsesWaitingForCaptureReadiness:", a4);
  if (v24)
    v66->_internal->readinessState.inflightUniqueIDWaitingForCapture = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "uniqueID");
  if (-[AVCapturePhotoOutput _requestUsesWaitingForProcessingReadiness:](v66, "_requestUsesWaitingForProcessingReadiness:", a4))
  {
    v66->_internal->readinessState.inflightUniqueIDWaitingForProcessing = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "uniqueID");
    MEMORY[0x1A1AF12A4](v66->_internal->requestsLock);
  }
  else
  {
    MEMORY[0x1A1AF12A4](v66->_internal->requestsLock);
    if (!v24)
      goto LABEL_22;
  }
  -[AVCapturePhotoOutput _updateCaptureReadiness](v66, "_updateCaptureReadiness");
LABEL_22:
  if ((_DWORD)v18)
  {
    v70 = *MEMORY[0x1E0CF2A88];
    v71[0] = &unk_1E424D140;
    -[AVCapturePhotoOutput _dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:](v66, "_dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:", 2147549183, a4, -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](v66, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v18, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1)), 1);
  }
  else
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 2);
    v25 = (void *)objc_msgSend(a4, "delegateStorage");
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __82__AVCapturePhotoOutput__handleWillBeginCaptureNotificationWithPayload_forRequest___block_invoke;
    v67[3] = &unk_1E42175B8;
    v67[4] = v66;
    v67[5] = v23;
    objc_msgSend(v25, "invokeDelegateCallbackWithBlock:", v67);
  }
}

uint64_t __82__AVCapturePhotoOutput__handleWillBeginCaptureNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "captureOutput:willBeginCaptureForResolvedSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_handleWillCaptureStillImageNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  SystemSoundID v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[6];
  os_log_type_t type;
  int v15;
  uint64_t v16;
  _QWORD v17[21];

  v17[20] = *MEMORY[0x1E0C80C00];
  if (sIsForcedShutterSoundRegion
    || (objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "isShutterSoundSuppressionEnabled") & 1) == 0)
  {
    v8 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "shutterSound");
    if (v8)
      AVCaptureStillImageOutputPlayShutterSound(self, v8);
  }
  else if (dword_1ECFED660)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368], v11, v12), "intValue");
  if ((_DWORD)v9)
  {
    v16 = *MEMORY[0x1E0CF2A88];
    v17[0] = &unk_1E424D278;
    -[AVCapturePhotoOutput _dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:](self, "_dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:", 2147549183, a4, -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v9, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1)), 1);
  }
  else
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 4);
    v10 = (void *)objc_msgSend(a4, "delegateStorage");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __87__AVCapturePhotoOutput__handleWillCaptureStillImageNotificationWithPayload_forRequest___block_invoke;
    v13[3] = &unk_1E42175B8;
    v13[4] = self;
    v13[5] = a4;
    objc_msgSend(v10, "invokeDelegateCallbackWithBlock:", v13);
  }
}

uint64_t __87__AVCapturePhotoOutput__handleWillCaptureStillImageNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "captureOutput:willCapturePhotoForResolvedSettings:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "resolvedSettings"));
  return result;
}

- (void)_handleDidCaptureStillImageNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v6;
  AVCapturePhotoOutputInternal *internal;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  MEMORY[0x1A1AF1298](self->_internal->requestsLock);
  internal = self->_internal;
  if (internal->readinessState.inflightUniqueIDWaitingForCapture
    && (v8 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "uniqueID"),
        internal = self->_internal,
        v8 >= internal->readinessState.inflightUniqueIDWaitingForCapture))
  {
    internal->readinessState.inflightUniqueIDWaitingForCapture = 0;
    MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
    -[AVCapturePhotoOutput _updateCaptureReadiness](self, "_updateCaptureReadiness");
    if ((_DWORD)v6)
      goto LABEL_4;
  }
  else
  {
    MEMORY[0x1A1AF12A4](internal->requestsLock);
    if ((_DWORD)v6)
    {
LABEL_4:
      v11 = *MEMORY[0x1E0CF2A88];
      v12[0] = &unk_1E424D278;
      -[AVCapturePhotoOutput _dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:](self, "_dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:", 2147549183, a4, -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v6, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1)), 1);
      return;
    }
  }
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 8);
  v9 = (void *)objc_msgSend(a4, "delegateStorage");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__AVCapturePhotoOutput__handleDidCaptureStillImageNotificationWithPayload_forRequest___block_invoke;
  v10[3] = &unk_1E42175B8;
  v10[4] = self;
  v10[5] = a4;
  objc_msgSend(v9, "invokeDelegateCallbackWithBlock:", v10);
}

uint64_t __86__AVCapturePhotoOutput__handleDidCaptureStillImageNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "captureOutput:didCapturePhotoForResolvedSettings:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "resolvedSettings"));
  return result;
}

- (void)_handleReadyForResponsiveRequestWithPayload:(id)a3 forRequest:(id)a4
{
  void *v7;
  _QWORD v8[6];

  if ((objc_msgSend(a4, "firedCallbackFlags") & 0x8000) == 0)
  {
    -[AVCapturePhotoOutput _updateCaptureReadinessStateForCompletedRequest:](self, "_updateCaptureReadinessStateForCompletedRequest:", a4);
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x8000);
    v7 = (void *)objc_msgSend(a4, "delegateStorage");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__AVCapturePhotoOutput__handleReadyForResponsiveRequestWithPayload_forRequest___block_invoke;
    v8[3] = &unk_1E42175B8;
    v8[4] = self;
    v8[5] = a4;
    objc_msgSend(v7, "invokeDelegateCallbackWithBlock:", v8);
    -[AVCapturePhotoOutput _handlePotentiallyFinalPhotoRequestCallbackWithPayload:forRequest:](self, "_handlePotentiallyFinalPhotoRequestCallbackWithPayload:forRequest:", a3, a4);
  }
}

uint64_t __79__AVCapturePhotoOutput__handleReadyForResponsiveRequestWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "captureOutput:readyForResponsiveRequestAfterResolvedSettings:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "resolvedSettings"));
  return result;
}

- (void)_handleStillImageCompleteNotification:(id)a3 withPayload:(id)a4 forRequest:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  const __CFDictionary *v27;
  BOOL v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  AVCaptureDeferredPhotoProxy *v40;
  NSString *sourceDeviceType;
  uint64_t v42;
  id v43;
  AVCapturePhoto *v44;
  NSString *v45;
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
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  _QWORD v77[10];
  int v78;
  _QWORD v79[7];
  _QWORD v80[7];
  CMTime v81;
  CMTime v82;
  uint64_t v83;
  _QWORD v84[4];

  v84[1] = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04360]), "intValue");
  v83 = *MEMORY[0x1E0CF2A88];
  v84[0] = &unk_1E424D278;
  v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
  if ((_DWORD)v9)
    v11 = -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v9, v10);
  else
    v11 = 0;
  if (objc_msgSend((id)objc_msgSend(a5, "unresolvedSettings"), "rawPhotoPixelFormatType"))
    v12 = objc_msgSend((id)objc_msgSend(a5, "unresolvedSettings"), "formatFourCC") != 0;
  else
    v12 = 0;
  v13 = objc_msgSend(a5, "firedPhotoCallbacksCount");
  if (v13 == objc_msgSend(a5, "expectedPhotoCount"))
    return;
  objc_msgSend(a5, "setFiredPhotoCallbacksCount:", objc_msgSend(a5, "firedPhotoCallbacksCount") + 1);
  v14 = objc_msgSend(a5, "firedPhotoCallbacksCount");
  if (v14 == objc_msgSend(a5, "expectedPhotoCount"))
  {
    objc_msgSend(a5, "setFiredCallbackFlags:", objc_msgSend(a5, "firedCallbackFlags") | 0x10);
    if (objc_msgSend((id)objc_msgSend(a5, "unresolvedSettings"), "digitalFlashMode"))
      AVCaptureStillImageOutputPlayShutterSound(self, 0x462u);
  }
  v15 = objc_msgSend(a5, "firedPhotoCallbacksCount");
  v16 = v15 - 1;
  v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "resolvedSettings"), "photoManifest"), "objectAtIndexedSubscript:", v15 - 1), "unsignedIntValue");
  if (!objc_msgSend(a5, "photoCallbackFlavor"))
  {
    v75 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04420]);
    v74 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04428]), "unsignedIntegerValue");
    v21 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043D8]);
    if (v21)
    {
      v72 = v21;
      objc_msgSend(a5, "setPreviewSurface:");
    }
    else
    {
      v72 = objc_msgSend(a5, "previewSurface");
    }
    v26 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04440]);
    if (v26)
    {
      v69 = v26;
      objc_msgSend(a5, "setThumbnailSurface:", v26);
    }
    else
    {
      v69 = objc_msgSend(a5, "thumbnailSurface");
    }
    v71 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04340]);
    v70 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04348]), "unsignedIntegerValue");
    v68 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04330]), "unsignedIntValue");
    v67 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04338]), "intValue");
    v76 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04398]);
    v82 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    v27 = (const __CFDictionary *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043C8]);
    if (v27)
      CMTimeMakeFromDictionary(&v82, v27);
    v63 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043A0]), "unsignedIntValue");
    v61 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043A8]), "intValue");
    v66 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04350]);
    v65 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04358]);
    v64 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043C0]);
    v62 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043B8]);
    v60 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04390]);
    v59 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04388]);
    v58 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04418]);
    v57 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04410]);
    v56 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04438]);
    v55 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04430]);
    v54 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04380]);
    v53 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04378]);
    v52 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04318]);
    v51 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04320]);
    if (!v75 || !v74)
    {
      v28 = !v70 || v71 == 0;
      if (v28 && !v11)
        v11 = AVLocalizedError();
    }
    if (!v76)
      v76 = (void *)po_metadataWithMakerNoteProcessingFlags(v17);
    objc_msgSend(a5, "unresolvedSettings");
    objc_opt_class();
    v73 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = (void *)objc_msgSend(v76, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
      v30 = (void *)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D03CE0]);
      if (v30)
      {
        v31 = objc_msgSend(v30, "integerValue");
        v32 = v31 - 1;
      }
      else
      {
        v34 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "unresolvedSettings"), "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count");
        if (v34)
          v16 /= v34;
        v32 = v16 >> v12;
        v31 = (v16 >> v12) + 1;
      }
      v33 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "unresolvedSettings"), "bracketedSettings"), "objectAtIndexedSubscript:", v32);
    }
    else
    {
      v31 = 0;
      v33 = 0;
    }
    v35 = v17;
    if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04238]) & 1) != 0)
    {
      v36 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
      v37 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04308]);
      v38 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043B0]);
      v39 = +[AVCapturePhoto AVFileTypeFromFigCaptureStillImageSettingsFileType:codec:unresolvedSettings:](AVCapturePhoto, "AVFileTypeFromFigCaptureStillImageSettingsFileType:codec:unresolvedSettings:", v67, v68, objc_msgSend(a5, "unresolvedSettings"));
      v40 = [AVCaptureDeferredPhotoProxy alloc];
      sourceDeviceType = self->_internal->sourceDeviceType;
      v81 = v82;
      LODWORD(v49) = v35;
      v42 = -[AVCaptureDeferredPhotoProxy initWithTimestamp:proxySurface:proxySurfaceSize:proxyFileType:previewPhotoSurface:metadata:captureRequest:sequenceCount:photoCount:applicationIdentifier:captureRequestIdentifier:photoIdentifier:expectedPhotoProcessingFlags:sourceDeviceType:](v40, "initWithTimestamp:proxySurface:proxySurfaceSize:proxyFileType:previewPhotoSurface:metadata:captureRequest:sequenceCount:photoCount:applicationIdentifier:captureRequestIdentifier:photoIdentifier:expectedPhotoProcessingFlags:sourceDeviceType:", &v81, v71, v70, v39, v72, v76, a5, v31, v73, v36, v37, v38, v49, sourceDeviceType);
      v24 = (void *)objc_msgSend(a5, "delegateStorage");
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __85__AVCapturePhotoOutput__handleStillImageCompleteNotification_withPayload_forRequest___block_invoke_2;
      v79[3] = &unk_1E4217590;
      v79[4] = self;
      v79[5] = v42;
      v79[6] = v11;
      v25 = v79;
    }
    else
    {
      v43 = +[AVCapturePhoto AVFileTypeFromFigCaptureStillImageSettingsFileType:codec:unresolvedSettings:](AVCapturePhoto, "AVFileTypeFromFigCaptureStillImageSettingsFileType:codec:unresolvedSettings:", v61, v63, objc_msgSend(a5, "unresolvedSettings"));
      v44 = [AVCapturePhoto alloc];
      v45 = self->_internal->sourceDeviceType;
      v81 = v82;
      LODWORD(v50) = v17;
      v46 = -[AVCapturePhoto initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:](v44, "initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:", &v81, v75, v74, v43, v72, v69, v76, v66, v65, v64, v62,
              v60,
              v59,
              v58,
              v57,
              v56,
              v55,
              v54,
              v53,
              v52,
              v51,
              a5,
              v33,
              v31,
              v73,
              v50,
              v45);
      v24 = (void *)objc_msgSend(a5, "delegateStorage");
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __85__AVCapturePhotoOutput__handleStillImageCompleteNotification_withPayload_forRequest___block_invoke;
      v80[3] = &unk_1E4217590;
      v80[4] = self;
      v80[5] = v46;
      v80[6] = v11;
      v25 = v80;
    }
    goto LABEL_57;
  }
  v18 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043F8]);
  v19 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043D0]);
  if (v19)
  {
    v20 = (const void *)v19;
    objc_msgSend(a5, "setPreviewSampleBuffer:", v19);
  }
  else
  {
    v20 = (const void *)objc_msgSend(a5, "previewSampleBuffer");
  }
  if (!(v18 | v11))
    v11 = AVLocalizedError();
  v22 = (void *)CMGetAttachment((CMAttachmentBearerRef)v18, (CFStringRef)*MEMORY[0x1E0CBCF70], 0);
  if (v22)
    LODWORD(v17) = objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("25")), "unsignedIntValue");
  objc_msgSend(a5, "unresolvedSettings");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "unresolvedSettings"), "bracketedSettings"), "objectAtIndexedSubscript:", v16 >> v12);
    if (!v18)
      goto LABEL_26;
    goto LABEL_25;
  }
  v23 = 0;
  if (v18)
LABEL_25:
    CFRetain((CFTypeRef)v18);
LABEL_26:
  if (v20)
    CFRetain(v20);
  v24 = (void *)objc_msgSend(a5, "delegateStorage");
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __85__AVCapturePhotoOutput__handleStillImageCompleteNotification_withPayload_forRequest___block_invoke_3;
  v77[3] = &unk_1E421D6E0;
  v78 = v17;
  v77[8] = v18;
  v77[9] = v20;
  v77[4] = self;
  v77[5] = a5;
  v77[6] = v23;
  v77[7] = v11;
  v25 = v77;
LABEL_57:
  objc_msgSend(v24, "invokeDelegateCallbackWithBlock:", v25);
  v47 = objc_msgSend(a5, "firedPhotoCallbacksCount");
  if (v47 == objc_msgSend(a5, "expectedPhotoCount"))
  {
    objc_msgSend(a5, "setPreviewSurface:", 0);
    objc_msgSend(a5, "setPreviewSampleBuffer:", 0);
    objc_msgSend(a5, "setThumbnailSurface:", 0);
  }
  -[AVCapturePhotoOutput _handlePotentiallyFinalPhotoRequestCallbackWithPayload:forRequest:](self, "_handlePotentiallyFinalPhotoRequestCallbackWithPayload:forRequest:", a4, a5);
  if (v11)
  {
    v48 = objc_msgSend(a5, "firedPhotoCallbacksCount");
    if (v48 == objc_msgSend(a5, "expectedPhotoCount") && po_allLivePhotoCallbacksHaveFinishedRecordingForRequest(a5))
      -[AVCapturePhotoOutput _dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:](self, "_dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:", 2147549183, a5, v11, 1);
  }
}

void __85__AVCapturePhotoOutput__handleStillImageCompleteNotification_withPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "captureOutput:didFinishProcessingPhoto:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __85__AVCapturePhotoOutput__handleStillImageCompleteNotification_withPayload_forRequest___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "captureOutput:didFinishCapturingDeferredPhotoProxy:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __85__AVCapturePhotoOutput__handleStillImageCompleteNotification_withPayload_forRequest___block_invoke_3(uint64_t a1, void *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  const void *v12;

  v4 = *(_DWORD *)(a1 + 80) & 0x10080;
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = objc_msgSend(*(id *)(a1 + 40), "resolvedSettings");
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  if (v4)
    objc_msgSend(a2, "captureOutput:didFinishProcessingRawPhotoSampleBuffer:previewPhotoSampleBuffer:resolvedSettings:bracketSettings:error:", v7, v5, v6, v8, v9, v10);
  else
    objc_msgSend(a2, "captureOutput:didFinishProcessingPhotoSampleBuffer:previewPhotoSampleBuffer:resolvedSettings:bracketSettings:error:", v7, v5, v6, v8, v9, v10);
  v11 = *(const void **)(a1 + 64);
  if (v11)
    CFRelease(v11);
  v12 = *(const void **)(a1 + 72);
  if (v12)
    CFRelease(v12);
}

- (void)_handleDidRecordIrisMovieNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  _BOOL4 v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSMutableArray *photoRequests;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *beginEndIrisMovieCaptureHostTimeQueue;
  _QWORD v17[7];
  _QWORD block[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings", a3), "isEV0PhotoDeliveryEnabled")
    && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto")
    && (objc_msgSend(a4, "firedCallbackFlags") & 0x20) == 0;
  v7 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "spatialOverCapturePhotoDimensions");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = objc_msgSend(a4, "firedCallbackFlags");
  v10 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", v9 | 0x20u);
    objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto"));
    if (v7 >= 1
      && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"))
    {
      objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x40);
      objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"));
    }
  }
  else
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", v9 | 0x80u);
    objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURL"));
    if (v7 >= 1 && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL"))
    {
      objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x100);
      objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL"));
    }
    if (sIsForcedShutterSoundRegion)
    {
      MEMORY[0x1A1AF1298](self->_internal->requestsLock);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      photoRequests = self->_internal->photoRequests;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](photoRequests, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(photoRequests);
            if (!po_allLivePhotoCallbacksHaveFinishedRecordingForRequest(*(void **)(*((_QWORD *)&v19 + 1) + 8 * i)))
            {
              MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
              goto LABEL_23;
            }
          }
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](photoRequests, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v13)
            continue;
          break;
        }
      }
      MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
      beginEndIrisMovieCaptureHostTimeQueue = self->_internal->beginEndIrisMovieCaptureHostTimeQueue;
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __84__AVCapturePhotoOutput__handleDidRecordIrisMovieNotificationWithPayload_forRequest___block_invoke;
      block[3] = &unk_1E42165A8;
      block[4] = self;
      dispatch_async(beginEndIrisMovieCaptureHostTimeQueue, block);
    }
  }
LABEL_23:
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __84__AVCapturePhotoOutput__handleDidRecordIrisMovieNotificationWithPayload_forRequest___block_invoke_3;
  v17[3] = &unk_1E4217590;
  v17[4] = v8;
  v17[5] = self;
  v17[6] = a4;
  objc_msgSend((id)objc_msgSend(a4, "delegateStorage"), "invokeDelegateCallbackWithBlock:", v17);
}

void __84__AVCapturePhotoOutput__handleDidRecordIrisMovieNotificationWithPayload_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  OpaqueCMClock *HostTimeClock;
  _QWORD v5[5];
  CMTime v6;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 368));
  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0D042C8];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v6, HostTimeClock);
  objc_msgSend(v2, "setFigCaptureSessionSectionProperty:withHostTime:", v3, &v6);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__AVCapturePhotoOutput__handleDidRecordIrisMovieNotificationWithPayload_forRequest___block_invoke_2;
  v5[3] = &unk_1E42165A8;
  v5[4] = *(_QWORD *)(a1 + 32);
  AudioServicesPlaySystemSoundWithCompletion(0x45Eu, v5);
}

void __84__AVCapturePhotoOutput__handleDidRecordIrisMovieNotificationWithPayload_forRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  OpaqueCMClock *HostTimeClock;
  CMTime v5;

  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0D042C0];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v5, HostTimeClock);
  objc_msgSend(v2, "setFigCaptureSessionSectionProperty:withHostTime:", v3, &v5);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 368));
}

uint64_t __84__AVCapturePhotoOutput__handleDidRecordIrisMovieNotificationWithPayload_forRequest___block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(void **)(a1 + 32);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(a2, "captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:", *(_QWORD *)(a1 + 40), v9, objc_msgSend(*(id *)(a1 + 48), "resolvedSettings"));
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

- (void)_handlePotentiallyFinalPhotoRequestCallbackWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;

  v7 = objc_msgSend(a4, "firedPhotoCallbacksCount");
  if (v7 == objc_msgSend(a4, "expectedPhotoCount"))
  {
    if (!objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "livePhotoMovieEnabled"))
      goto LABEL_16;
    v8 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "isEV0PhotoDeliveryEnabled");
    v9 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "spatialOverCapturePhotoDimensions");
    v10 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURL");
    v11 = v10 != 0;
    if (v8)
    {
      v12 = v10;
      v13 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto");
      v14 = v12 ? 2 : 1;
      if (v13)
        v11 = v14;
    }
    if (v9)
    {
      if (objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL"))
        ++v11;
      if (v8
        && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"))
      {
        ++v11;
      }
    }
    v15 = (objc_msgSend(a4, "firedCallbackFlags") >> 11) & 1;
    v16 = ((objc_msgSend(a4, "firedCallbackFlags") >> 9) & 1) + v15;
    v17 = (objc_msgSend(a4, "firedCallbackFlags") >> 12) & 1;
    if (v16 + v17 + ((objc_msgSend(a4, "firedCallbackFlags") >> 10) & 1) == v11)
    {
LABEL_16:
      if ((objc_msgSend(a4, "firedCallbackFlags") & 0x8000) != 0)
        -[AVCapturePhotoOutput _handleDidFinishCaptureNotificationWithPayload:forRequest:](self, "_handleDidFinishCaptureNotificationWithPayload:forRequest:", a3, a4);
    }
  }
}

- (void)_handleDidFinishRecordingIrisMovieNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7;
  int v8;
  _BOOL4 v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[9];
  CMTime v21;
  CMTime v22;
  char v23;
  char v24;
  CMTime v25;
  CMTime v26;

  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04360]), "intValue");
  memset(&v26, 0, sizeof(v26));
  CMTimeMakeFromDictionary(&v26, (CFDictionaryRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D041A0]));
  memset(&v25, 0, sizeof(v25));
  CMTimeMakeFromDictionary(&v25, (CFDictionaryRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D041A8]));
  v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04190]), "BOOLValue");
  v9 = (int)objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "spatialOverCapturePhotoDimensions") >= 1
    && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL") != 0;
  v10 = v8 & v9;
  v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04188]), "BOOLValue");
  if (objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "isEV0PhotoDeliveryEnabled")
    && (objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto")
      ? (v12 = v11)
      : (v12 = 0),
        v12 == 1))
  {
    v13 = (void *)objc_msgSend(a4, "unresolvedSettings");
    if (v10)
    {
      v14 = objc_msgSend(v13, "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto");
      v15 = 1;
      v16 = 1024;
    }
    else
    {
      v14 = objc_msgSend(v13, "livePhotoMovieFileURLForOriginalPhoto");
      v15 = 1;
      v16 = 512;
    }
  }
  else
  {
    v17 = (void *)objc_msgSend(a4, "unresolvedSettings");
    if (v10)
    {
      v14 = objc_msgSend(v17, "spatialOverCaptureLivePhotoMovieFileURL");
      v15 = 0;
      v16 = 4096;
    }
    else
    {
      v14 = objc_msgSend(v17, "livePhotoMovieFileURL");
      v15 = 0;
      v16 = 2048;
    }
  }
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | v16);
  if ((_DWORD)v7)
    v18 = -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v7, -[AVCapturePhotoOutput _avErrorUserInfoDictionaryForError:photoRequest:payload:isOriginalMovie:](self, "_avErrorUserInfoDictionaryForError:photoRequest:payload:isOriginalMovie:", v7, a4, a3, v15));
  else
    v18 = 0;
  v19 = (void *)objc_msgSend(a4, "delegateStorage");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__AVCapturePhotoOutput__handleDidFinishRecordingIrisMovieNotificationWithPayload_forRequest___block_invoke;
  v20[3] = &unk_1E421D708;
  v23 = v15;
  v24 = v10;
  v20[4] = a4;
  v20[5] = a3;
  v20[6] = self;
  v20[7] = v14;
  v21 = v26;
  v22 = v25;
  v20[8] = v18;
  objc_msgSend(v19, "invokeDelegateCallbackWithBlock:", v20);
  -[AVCapturePhotoOutput _handlePotentiallyFinalPhotoRequestCallbackWithPayload:forRequest:](self, "_handlePotentiallyFinalPhotoRequestCallbackWithPayload:forRequest:", a3, a4);
}

uint64_t __93__AVCapturePhotoOutput__handleDidFinishRecordingIrisMovieNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  if (objc_msgSend(*(id *)(a1 + 32), "delegateSupportsMetadataIdentifiersCallback"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D04198]);
    if (v4)
      v5 = v4;
    else
      v5 = MEMORY[0x1E0C9AA70];
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = objc_msgSend(*(id *)(a1 + 32), "resolvedSettings");
    v9 = *(_QWORD *)(a1 + 64);
    v23 = *(_OWORD *)(a1 + 72);
    v24 = *(_QWORD *)(a1 + 88);
    v21 = *(_OWORD *)(a1 + 96);
    v22 = *(_QWORD *)(a1 + 112);
    return objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:metadataIdentifiers:resolvedSettings:error:", v6, v7, &v23, &v21, v5, v8, v9);
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "delegateSupportsDebugMetadataSidecarFile"))
  {
    v11 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D04328]);
    if (v11)
      v12 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
    else
      v12 = 0;
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 56);
    v19 = objc_msgSend(*(id *)(a1 + 32), "resolvedSettings");
    v20 = *(_QWORD *)(a1 + 64);
    v23 = *(_OWORD *)(a1 + 72);
    v24 = *(_QWORD *)(a1 + 88);
    v21 = *(_OWORD *)(a1 + 96);
    v22 = *(_QWORD *)(a1 + 112);
    return objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:debugMetadataSidecarFileURL:duration:photoDisplayTime:resolvedSettings:error:", v17, v18, v12, &v23, &v21, v19, v20);
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    v15 = objc_msgSend(*(id *)(a1 + 32), "resolvedSettings");
    v16 = *(_QWORD *)(a1 + 64);
    v23 = *(_OWORD *)(a1 + 72);
    v24 = *(_QWORD *)(a1 + 88);
    v21 = *(_OWORD *)(a1 + 96);
    v22 = *(_QWORD *)(a1 + 112);
    return objc_msgSend(a2, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:resolvedSettings:error:", v13, v14, &v23, &v21, v15, v16);
  }
}

- (void)_handleDidFinishRecordingVideoNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[9];
  CMTime v12;
  CMTime v13;

  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04360]), "intValue");
  memset(&v13, 0, sizeof(v13));
  CMTimeMakeFromDictionary(&v13, (CFDictionaryRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D041A0]));
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x4000);
  v8 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "videoFileURL");
  if ((_DWORD)v7)
    v9 = -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v7, -[AVCapturePhotoOutput _avErrorUserInfoDictionaryForError:photoRequest:payload:isOriginalMovie:](self, "_avErrorUserInfoDictionaryForError:photoRequest:payload:isOriginalMovie:", v7, a4, a3, 0));
  else
    v9 = 0;
  v10 = (void *)objc_msgSend(a4, "delegateStorage");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__AVCapturePhotoOutput__handleDidFinishRecordingVideoNotificationWithPayload_forRequest___block_invoke;
  v11[3] = &unk_1E421D730;
  v11[4] = self;
  v11[5] = v8;
  v11[7] = v9;
  v11[8] = 0;
  v12 = v13;
  v11[6] = a4;
  objc_msgSend(v10, "invokeDelegateCallbackWithBlock:", v11);
  if ((objc_msgSend(a4, "firedCallbackFlags") & 0x2010) != 0)
    -[AVCapturePhotoOutput _handleDidFinishCaptureNotificationWithPayload:forRequest:](self, "_handleDidFinishCaptureNotificationWithPayload:forRequest:", a3, a4);
}

uint64_t __89__AVCapturePhotoOutput__handleDidFinishRecordingVideoNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(*(id *)(a1 + 48), "resolvedSettings");
  v8 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v10 = *(_OWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 88);
  return objc_msgSend(a2, "captureOutput:didFinishProcessingVideoFileAtURL:resolvedSettings:previewPixelBuffer:recordedDuration:error:", v4, v5, v6, v7, &v10, v8);
}

- (void)setFigCaptureSessionSectionProperty:(__CFString *)a3 withHostTime:(id *)a4
{
  _QWORD v4[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__AVCapturePhotoOutput_setFigCaptureSessionSectionProperty_withHostTime___block_invoke;
  v4[3] = &unk_1E421D758;
  v5 = *a4;
  v4[4] = self;
  v4[5] = a3;
  -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v4);
}

void __73__AVCapturePhotoOutput_setFigCaptureSessionSectionProperty_withHostTime___block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFAllocator *v4;
  CFDictionaryRef v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, CFDictionaryRef);
  CMTime v9;

  if (a2)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v9 = *(CMTime *)(a1 + 48);
    v5 = CMTimeCopyAsDictionary(&v9, v4);
    v6 = objc_msgSend(*(id *)(a1 + 32), "sinkID");
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 8);
    if (v8)
      v8(a2, v6, v7, v5);
    CFRelease(v5);
  }
}

- (id)_avErrorUserInfoDictionaryForError:(int)a3 photoRequest:(id)a4 payload:(id)a5 isOriginalMovie:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v6 = a6;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D043F0]);
  if (v11)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CF2A90]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E424D290, *MEMORY[0x1E0CF2A88]);
  if (a3 == -16411)
  {
    v12 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "videoFileURL");
    v13 = (void *)objc_msgSend(a4, "unresolvedSettings");
    if (v12)
    {
      v14 = objc_msgSend(v13, "videoFileURL");
    }
    else if (v6)
    {
      v14 = objc_msgSend(v13, "livePhotoMovieFileURLForOriginalPhoto");
    }
    else
    {
      v14 = objc_msgSend(v13, "livePhotoMovieFileURL");
    }
    if (v14)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB3308]);
  }
  return v10;
}

- (id)_avErrorUserInfoDictionaryForError:(int)a3 movieRequest:(id)a4 payload:(id)a5 isSpatialOverCaptureMovie:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v6 = a6;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D043F0]);
  if (v11)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CF2A90]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E424D290, *MEMORY[0x1E0CF2A88]);
  if (a3 == -16411)
  {
    v12 = (void *)objc_msgSend(a4, "unresolvedSettings");
    if (v6)
      v13 = objc_msgSend(v12, "spatialOverCaptureMovieFileURL");
    else
      v13 = objc_msgSend(v12, "movieFileURL");
    if (v13)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB3308]);
  }
  return v10;
}

- (void)_handleDidFinishCaptureNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[7];

  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04360]), "intValue");
  if ((_DWORD)v7)
    v8 = -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v7, 0);
  else
    v8 = 0;
  MEMORY[0x1A1AF1298](self->_internal->requestsLock);
  -[NSMutableArray removeObject:](self->_internal->photoRequests, "removeObject:", a4);
  MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x80000000);
  v9 = (void *)objc_msgSend(a4, "delegateStorage");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__AVCapturePhotoOutput__handleDidFinishCaptureNotificationWithPayload_forRequest___block_invoke;
  v10[3] = &unk_1E4217590;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = v8;
  objc_msgSend(v9, "invokeDelegateCallbackWithBlock:", v10);
}

uint64_t __82__AVCapturePhotoOutput__handleDidFinishCaptureNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "captureOutput:didFinishCaptureForResolvedSettings:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "resolvedSettings"), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_handleDidBeginRecordingMomentCaptureMovieNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  AVMomentCaptureMovieRecordingResolvedSettings *v12;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04180]), "BOOLValue");
  v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04620]), "intValue");
  v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04618]), "intValue");
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D046B0]), "BOOLValue"))
    v11 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureMovieFileURL");
  else
    v11 = 0;
  v12 = +[AVMomentCaptureMovieRecordingResolvedSettings movieRecordingResolvedSettingsWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:](AVMomentCaptureMovieRecordingResolvedSettings, "movieRecordingResolvedSettingsWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:", objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "uniqueID"), v8, objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "movieFileURL"), v11, v9 | (unint64_t)(v10 << 32));
  objc_msgSend(a4, "setResolvedSettings:", v12);
  if ((_DWORD)v7)
  {
    v15 = *MEMORY[0x1E0CF2A88];
    v16[0] = &unk_1E424D140;
    -[AVCapturePhotoOutput _dispatchFailureCallbacks:forMovieRequest:withError:cleanupRequest:](self, "_dispatchFailureCallbacks:forMovieRequest:withError:cleanupRequest:", 63, a4, -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v7, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1)), 1);
  }
  else
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 1);
    v13 = (void *)objc_msgSend(a4, "delegateStorage");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __101__AVCapturePhotoOutput__handleDidBeginRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke;
    v14[3] = &unk_1E42175B8;
    v14[4] = self;
    v14[5] = v12;
    objc_msgSend(v13, "invokeDelegateCallbackWithBlock:", v14);
  }
}

uint64_t __101__AVCapturePhotoOutput__handleDidBeginRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "captureOutput:didBeginMovieCaptureForResolvedSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *photoRequests;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSObject *beginEndIrisMovieCaptureHostTimeQueue;
  _QWORD v14[6];
  BOOL v15;
  _QWORD block[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings", a3), "spatialOverCaptureURL");
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 2);
  if (v6)
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 4);
  v7 = MEMORY[0x1E0C809B0];
  if (sIsForcedShutterSoundRegion)
  {
    MEMORY[0x1A1AF1298](self->_internal->requestsLock);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    photoRequests = self->_internal->photoRequests;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](photoRequests, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(photoRequests);
          if (!po_allLivePhotoCallbacksHaveFinishedRecordingForRequest(*(void **)(*((_QWORD *)&v17 + 1) + 8 * i)))
          {
            MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
            goto LABEL_14;
          }
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](photoRequests, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
    MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
    beginEndIrisMovieCaptureHostTimeQueue = self->_internal->beginEndIrisMovieCaptureHostTimeQueue;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __102__AVCapturePhotoOutput__handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke;
    block[3] = &unk_1E42165A8;
    block[4] = self;
    dispatch_async(beginEndIrisMovieCaptureHostTimeQueue, block);
  }
LABEL_14:
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __102__AVCapturePhotoOutput__handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke_3;
  v14[3] = &unk_1E421D7A8;
  v14[4] = a4;
  v14[5] = self;
  v15 = v6 != 0;
  objc_msgSend((id)objc_msgSend(a4, "delegateStorage"), "invokeDelegateCallbackWithBlock:", v14);
}

void __102__AVCapturePhotoOutput__handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  OpaqueCMClock *HostTimeClock;
  _QWORD v5[5];
  CMTime v6;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 368));
  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0D042C8];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v6, HostTimeClock);
  objc_msgSend(v2, "setFigCaptureSessionSectionProperty:withHostTime:", v3, &v6);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __102__AVCapturePhotoOutput__handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke_2;
  v5[3] = &unk_1E42165A8;
  v5[4] = *(_QWORD *)(a1 + 32);
  AudioServicesPlaySystemSoundWithCompletion(0x45Eu, v5);
}

void __102__AVCapturePhotoOutput__handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  OpaqueCMClock *HostTimeClock;
  CMTime v5;

  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0D042C0];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v5, HostTimeClock);
  objc_msgSend(v2, "setFigCaptureSessionSectionProperty:withHostTime:", v3, &v5);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 368));
}

uint64_t __102__AVCapturePhotoOutput__handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "movie"))
      objc_msgSend(*(id *)(a1 + 32), "setMovie:", +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), "movieURL"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "unresolvedSettings"), "movieMetadata")));
    result = objc_msgSend(a2, "captureOutput:didFinishRecordingMovie:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "movie"));
  }
  else
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(a2, "captureOutput:didFinishRecordingMovieFileAtEventualURL:resolvedSettings:", *(_QWORD *)(a1 + 40), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), "movieURL"), objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"));
  }
  if (*(_BYTE *)(a1 + 48))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "spatialOverCaptureMovie"))
        objc_msgSend(*(id *)(a1 + 32), "setSpatialOverCaptureMovie:", +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), "spatialOverCaptureURL"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "unresolvedSettings"), "spatialOverCaptureMovieMetadata")));
      return objc_msgSend(a2, "captureOutput:didFinishRecordingMovie:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "spatialOverCaptureMovie"));
    }
    else
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        return objc_msgSend(a2, "captureOutput:didFinishRecordingMovieFileAtEventualURL:resolvedSettings:", *(_QWORD *)(a1 + 40), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), "spatialOverCaptureURL"), objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"));
    }
  }
  return result;
}

- (void)_handleDidFinishWritingMomentCaptureMovieNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __IOSurface *v14;
  id v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  _QWORD v19[10];
  CMTime v20;
  char v21;
  char v22;
  CVPixelBufferRef pixelBufferOut;
  CMTime v24;

  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04360]), "intValue");
  memset(&v24, 0, sizeof(v24));
  CMTimeMakeFromDictionary(&v24, (CFDictionaryRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D041A0]));
  v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04190]), "BOOLValue");
  v9 = v8;
  if (v8 && objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "spatialOverCaptureURL"))
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x10);
    v10 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "spatialOverCaptureURL");
    v11 = 1;
  }
  else
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 8);
    v10 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "movieURL");
    v11 = 0;
  }
  v12 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04328]);
  if (v12)
    v13 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
  else
    v13 = 0;
  pixelBufferOut = 0;
  v14 = (__IOSurface *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D043D8]);
  if (v14)
    CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, 0, &pixelBufferOut);
  if ((_DWORD)v7)
    v15 = -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v7, -[AVCapturePhotoOutput _avErrorUserInfoDictionaryForError:movieRequest:payload:isSpatialOverCaptureMovie:](self, "_avErrorUserInfoDictionaryForError:movieRequest:payload:isSpatialOverCaptureMovie:", v7, a4, a3, v11));
  else
    v15 = 0;
  v16 = (void *)objc_msgSend(a4, "delegateStorage");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__AVCapturePhotoOutput__handleDidFinishWritingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke;
  v19[3] = &unk_1E421D7D0;
  v21 = v11;
  v22 = v9;
  v19[4] = a4;
  v19[5] = v10;
  v20 = v24;
  v19[6] = v13;
  v19[7] = self;
  v19[8] = v15;
  v19[9] = pixelBufferOut;
  objc_msgSend(v16, "invokeDelegateCallbackWithBlock:", v19);
  v17 = (objc_msgSend(a4, "firedCallbackFlags") >> 3) & 1;
  v18 = ((objc_msgSend(a4, "firedCallbackFlags") >> 4) & 1) + v17;
  if (objc_msgSend(a4, "expectedMovieCount") == v18)
    -[AVCapturePhotoOutput _handleDidFinishMovieCaptureMovieNotificationWithPayload:forRequest:](self, "_handleDidFinishMovieCaptureMovieNotificationWithPayload:forRequest:", a3, a4);
}

void __100__AVCapturePhotoOutput__handleDidFinishWritingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AVMomentCaptureMovie *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  __int128 v18;
  uint64_t v19;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 105))
      v5 = objc_msgSend(v4, "spatialOverCaptureMovie");
    else
      v5 = objc_msgSend(v4, "movie");
    v12 = (AVMomentCaptureMovie *)v5;
    if (!v5)
    {
      v13 = *(unsigned __int8 *)(a1 + 105);
      v14 = (void *)objc_msgSend(*(id *)(a1 + 32), "unresolvedSettings");
      if (v13)
        v15 = objc_msgSend(v14, "spatialOverCaptureMovieMetadata");
      else
        v15 = objc_msgSend(v14, "movieMetadata");
      v12 = +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), *(_QWORD *)(a1 + 40), v15);
    }
    v18 = *(_OWORD *)(a1 + 80);
    v19 = *(_QWORD *)(a1 + 96);
    -[AVMomentCaptureMovie _setDuration:](v12, "_setDuration:", &v18);
    -[AVMomentCaptureMovie _setPreviewPixelBuffer:](v12, "_setPreviewPixelBuffer:", *(_QWORD *)(a1 + 72));
    -[AVMomentCaptureMovie _setDebugMetadataSidecarFileURL:](v12, "_setDebugMetadataSidecarFileURL:", *(_QWORD *)(a1 + 48));
    objc_msgSend(a2, "captureOutput:didFinishWritingMovie:error:", *(_QWORD *)(a1 + 56), v12, *(_QWORD *)(a1 + 64));
    v16 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 105))
      objc_msgSend(v16, "setSpatialOverCaptureMovie:", 0);
    else
      objc_msgSend(v16, "setMovie:", 0);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = objc_msgSend(*(id *)(a1 + 32), "resolvedSettings");
    v11 = *(_QWORD *)(a1 + 64);
    v18 = *(_OWORD *)(a1 + 80);
    v19 = *(_QWORD *)(a1 + 96);
    objc_msgSend(a2, "captureOutput:didFinishWritingMovieFileAtURL:debugMetadataSidecarFileURL:previewPixelBuffer:duration:resolvedSettings:error:", v6, v9, v7, v8, &v18, v10, v11);
  }
  v17 = *(const void **)(a1 + 72);
  if (v17)
    CFRelease(v17);
}

- (void)_handleDidFinishMovieCaptureMovieNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[7];

  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04360]), "intValue");
  if ((_DWORD)v7)
    v8 = -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v7, 0);
  else
    v8 = 0;
  MEMORY[0x1A1AF1298](self->_internal->requestsLock);
  -[NSMutableArray removeObject:](self->_internal->movieRequests, "removeObject:", a4);
  MEMORY[0x1A1AF12A4](self->_internal->requestsLock);
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x20);
  v9 = (void *)objc_msgSend(a4, "delegateStorage");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__AVCapturePhotoOutput__handleDidFinishMovieCaptureMovieNotificationWithPayload_forRequest___block_invoke;
  v10[3] = &unk_1E4217590;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = v8;
  objc_msgSend(v9, "invokeDelegateCallbackWithBlock:", v10);
}

uint64_t __92__AVCapturePhotoOutput__handleDidFinishMovieCaptureMovieNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "captureOutput:didFinishMovieCaptureForResolvedSettings:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "resolvedSettings"), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)setFastCapturePrioritizationSupported:(BOOL)fastCapturePrioritizationSupported
{
  self->_fastCapturePrioritizationSupported = fastCapturePrioritizationSupported;
}

@end
