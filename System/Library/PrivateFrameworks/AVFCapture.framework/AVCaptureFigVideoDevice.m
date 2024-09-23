@implementation AVCaptureFigVideoDevice

uint64_t __38__AVCaptureFigVideoDevice_isConnected__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 793);
  return result;
}

- (id)activePrimaryConstituentDevice
{
  NSObject *devicePropsQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  if (-[AVCaptureFigVideoDevice _isBravoVariant](self, "_isBravoVariant"))
  {
    devicePropsQueue = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__AVCaptureFigVideoDevice_activePrimaryConstituentDevice__block_invoke;
    v6[3] = &unk_1E4217A60;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(devicePropsQueue, v6);
  }
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_setCinematicVideoEnabled:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  v3 = a3;
  v5 = objc_msgSend(-[AVCaptureDeviceFormat supportedZoomRangesForCinematicVideo](self->_activeFormat, "supportedZoomRangesForCinematicVideo"), "count");
  if (self->_cinematicVideoZoomEnabled != (v5 & v3))
  {
    self->_cinematicVideoZoomEnabled = v5 & v3;
    -[AVCaptureFigVideoDevice _updateMinMaxDefaultVideoZoomFactors](self, "_updateMinMaxDefaultVideoZoomFactors");
  }
}

- (BOOL)supportsAVCaptureSessionPreset:(id)a3
{
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;

  if ((objc_msgSend(a3, "isEqual:", CFSTR("AVCaptureSessionPresetInputPriority")) & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = -[NSArray count](self->_formats, "count");
    if (v5)
    {
      v6 = 0;
      v7 = v5 - 1;
      do
      {
        LOBYTE(v5) = objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_formats, "objectAtIndexedSubscript:", v6), "AVCaptureSessionPresets"), "containsObject:", a3);
        if ((v5 & 1) != 0)
          break;
      }
      while (v7 != v6++);
    }
  }
  return v5;
}

- (id)deviceFormatForSessionPreset:(id)a3 sourceVideoFormat:(unsigned int)a4
{
  void *v7;
  const __CFString *v8;
  NSArray *formats;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVCaptureSessionPresetInputPriority")))
    return self->_activeFormat;
  v8 = -[AVCaptureFigVideoDevice deviceType](self, "deviceType");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  formats = self->_formats;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](formats, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v10)
    return 0;
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v18 != v13)
        objc_enumerationMutation(formats);
      v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(v7, "AVCaptureSessionPresets"), "containsObject:", a3))
      {
        if (CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v7, "formatDescription")) == a4)
          return v7;
        if (v12)
          v15 = 0;
        else
          v15 = v8 == CFSTR("AVCaptureDeviceTypeExternal");
        if (v15)
          v12 = v7;
      }
    }
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](formats, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    v7 = v12;
  }
  while (v11);
  return v7;
}

- (id)_copyFormatsArray
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  AVCaptureDeviceFormat *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04CD8]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = -[AVCaptureDeviceFormat initWithFigCaptureSourceFormat:fcSourceAttributes:]([AVCaptureDeviceFormat alloc], "initWithFigCaptureSourceFormat:fcSourceAttributes:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), self->_fcsAttributes);
        objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v4);
  return v10;
}

- (BOOL)isConnected
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AVCaptureFigVideoDevice_isConnected__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_copyFigCaptureSourceProperty:(__CFString *)a3
{
  NSObject *fcsQueue;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  fcsQueue = self->_fcsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AVCaptureFigVideoDevice__copyFigCaptureSourceProperty___block_invoke;
  block[3] = &unk_1E4217A38;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(fcsQueue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)_recommendedFrameRateRangeForVideoFormat:(id)a3 depthFormat:(id)a4 figSystemPressureLevel:(int)a5
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;

  v7 = objc_msgSend((id)objc_msgSend(a4, "videoSupportedFrameRateRanges"), "lastObject");
  if (v7)
  {
    v8 = (void *)v7;
    if (objc_msgSend(a3, "isPhotoFormat"))
    {
      if (a5 < 2)
      {
        objc_msgSend(v8, "maxFrameRate");
        v9 = (int)v10;
        return +[AVFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](AVFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", 15, v9);
      }
      if ((a5 - 3) < 2)
      {
        v9 = 15;
        return +[AVFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](AVFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", 15, v9);
      }
      if (a5 == 2)
      {
        v9 = 20;
        return +[AVFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](AVFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", 15, v9);
      }
    }
  }
  return 0;
}

- (BOOL)_setContinuousZoomWithDepthActiveWithEnabled:(BOOL)a3 disallowed:(BOOL)a4 isActiveDepthDataFormatChangingOut:(BOOL *)a5
{
  NSArray *formats;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BOOL8 v13;
  int v14;
  int continuousZoomWithDepthActive;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  self->_continuousZoomWithDepthEnabled = a3;
  self->_continuousZoomWithDepthDisallowed = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  formats = self->_formats;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](formats, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(formats);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "isContinuousZoomWithDepthSupported"))
        {
          v13 = self->_continuousZoomWithDepthEnabled && !self->_continuousZoomWithDepthDisallowed;
          objc_msgSend(v12, "setContinuousZoomWithDepthEnabled:", v13);
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](formats, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  v14 = -[AVCaptureDeviceFormat isContinuousZoomWithDepthEnabled](self->_activeFormat, "isContinuousZoomWithDepthEnabled");
  continuousZoomWithDepthActive = self->_continuousZoomWithDepthActive;
  self->_continuousZoomWithDepthActive = v14;
  v16 = -[NSArray containsObject:](-[AVCaptureDeviceFormat supportedDepthDataFormats](self->_activeFormat, "supportedDepthDataFormats"), "containsObject:", self->_activeDepthDataFormat);
  if (a5)
    *a5 = !v16;
  return continuousZoomWithDepthActive != v14;
}

- (BOOL)isFocusModeSupported:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 2)
    return 0;
  else
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04828], v3, v4), "BOOLValue");
}

- (BOOL)hasFlash
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04810]), "BOOLValue");
}

- (BOOL)isGeometricDistortionCorrectionSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04838]), "BOOLValue");
}

uint64_t __65__AVCaptureFigVideoDevice__setContinuousZoomWithDepthDisallowed___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateContinuousZoomWithDepthActiveWithEnabled:disallowed:isActiveDepthDataFormatChangingOut:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 193), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_updateContinuousZoomWithDepthActiveWithEnabled:(BOOL)a3 disallowed:(BOOL)a4 isActiveDepthDataFormatChangingOut:(BOOL *)a5
{
  _BOOL8 v6;
  _BOOL8 v7;

  v6 = a4;
  v7 = a3;
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  return -[AVCaptureFigVideoDevice _setContinuousZoomWithDepthActiveWithEnabled:disallowed:isActiveDepthDataFormatChangingOut:](self, "_setContinuousZoomWithDepthActiveWithEnabled:disallowed:isActiveDepthDataFormatChangingOut:", v7, v6, a5);
}

- (BOOL)hasTorch
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04908]), "BOOLValue");
}

- (BOOL)isExposureModeSupported:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 3)
    return 0;
  else
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", **((_QWORD **)&unk_1E4218218 + a3), v3, v4), "BOOLValue");
}

- (void)_setFigCaptureSource:(OpaqueFigCaptureSource *)a3 allowSendingWorkToMainThread:(BOOL)a4
{
  NSObject *fcsQueue;
  _QWORD block[6];
  BOOL v7;

  fcsQueue = self->_fcsQueue;
  if (fcsQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__AVCaptureFigVideoDevice__setFigCaptureSource_allowSendingWorkToMainThread___block_invoke;
    block[3] = &unk_1E42179E8;
    block[4] = self;
    block[5] = a3;
    v7 = a4;
    dispatch_sync(fcsQueue, block);
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)_initializeContinuousZoomWithDepthActiveWithEnabled:(BOOL)a3
{
  -[AVCaptureFigVideoDevice _setContinuousZoomWithDepthActiveWithEnabled:disallowed:isActiveDepthDataFormatChangingOut:](self, "_setContinuousZoomWithDepthActiveWithEnabled:disallowed:isActiveDepthDataFormatChangingOut:", a3, 0, 0);
}

+ (BOOL)_cameraAccessIsEnabled
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  return objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F88]) != 2;
}

- (BOOL)wideAngleCameraSourcesFromUltraWide
{
  return -[AVCaptureFigVideoDevice figCaptureSourceDeviceType](self, "figCaptureSourceDeviceType") == 11
      || -[AVCaptureFigVideoDevice figCaptureSourceDeviceType](self, "figCaptureSourceDeviceType") == 12
      || -[AVCaptureFigVideoDevice figCaptureSourceDeviceType](self, "figCaptureSourceDeviceType") == 18;
}

- (BOOL)_isBravoVariant
{
  int v2;

  v2 = -[AVCaptureFigVideoDevice figCaptureSourceDeviceType](self, "figCaptureSourceDeviceType");
  return v2 == 4 || (v2 & 0xFFFFFFFE) == 8;
}

- (int)figCaptureSourceDeviceType
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047F0]), "intValue");
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  objc_super v11;

  -[AVCaptureFigVideoDevice _incrementObserverCountForHighFrequencyProperty:](self, "_incrementObserverCountForHighFrequencyProperty:", a4);
  v11.receiver = self;
  v11.super_class = (Class)AVCaptureFigVideoDevice;
  -[AVCaptureFigVideoDevice addObserver:forKeyPath:options:context:](&v11, sel_addObserver_forKeyPath_options_context_, a3, a4, a5, a6);
}

- (void)_incrementObserverCountForHighFrequencyProperty:(id)a3
{
  NSDictionary *hevcEncoderSettings;
  _QWORD v4[6];

  hevcEncoderSettings = self->_hevcEncoderSettings;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__AVCaptureFigVideoDevice__incrementObserverCountForHighFrequencyProperty___block_invoke;
  v4[3] = &unk_1E4216408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(&hevcEncoderSettings->super, v4);
}

id __39__AVCaptureFigVideoDevice_activeFormat__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 144);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __43__AVCaptureFigVideoDevice_activeColorSpace__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 856);
  return result;
}

uint64_t __38__AVCaptureFigVideoDevice_isSuspended__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 794);
  return result;
}

uint64_t __59__AVCaptureFigVideoDevice_isActiveVideoMinFrameDurationSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 268) & 1;
  return result;
}

uint64_t __44__AVCaptureFigVideoDevice_isVideoHDREnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 845);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("videoZoomFactor")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("activeVideoMinFrameDuration")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("activeVideoMaxFrameDuration")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("minAvailableVideoZoomFactor")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("maxAvailableVideoZoomFactor")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("activeFormat")) & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AVCaptureFigVideoDevice;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (BOOL)hasMediaType:(id)a3
{
  uint64_t v5;
  __CFString **v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[AVCaptureFigVideoDevice deviceType](self, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInTimeOfFlightCamera"))
  {
    v6 = AVMediaTypePointCloudData;
    goto LABEL_13;
  }
  if (-[AVCaptureFigVideoDevice deviceType](self, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera")
    || -[AVCaptureFigVideoDevice deviceType](self, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera")
    || -[AVCaptureFigVideoDevice deviceType](self, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInInfraredMetadataCamera"))
  {
    v6 = (__CFString **)MEMORY[0x1E0CF2B80];
LABEL_13:
    LOBYTE(v5) = objc_msgSend(a3, "isEqualToString:", *v6);
    return v5;
  }
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CF2B90]) & 1) != 0)
  {
LABEL_9:
    LOBYTE(v5) = 1;
    return v5;
  }
  if (objc_msgSend(a3, "isEqualToString:", AVMediaTypeForMetadataObjects()))
  {
    if (-[AVCaptureFigVideoDevice isFaceDetectionSupported](self, "isFaceDetectionSupported")
      || -[AVCaptureFigVideoDevice isObjectDetectionSupported](self, "isObjectDetectionSupported"))
    {
      goto LABEL_9;
    }
    LOBYTE(v5) = -[AVCaptureFigVideoDevice isMachineReadableCodeDetectionSupported](self, "isMachineReadableCodeDetectionSupported");
  }
  else if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined()
         && objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CF2B78]))
  {
    LOBYTE(v5) = objc_msgSend(-[AVCaptureFigVideoDevice availableBoxedMetadataFormatDescriptions](self, "availableBoxedMetadataFormatDescriptions"), "count") != 0;
  }
  else
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CF2B70]))
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v7 = -[AVCaptureFigVideoDevice formats](self, "formats");
      v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (!v5)
        return v5;
      v8 = v5;
      v9 = *(_QWORD *)v30;
LABEL_20:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        if ((objc_msgSend(v11, "isStreamingDisparitySupported") & 1) != 0
          || (objc_msgSend(v11, "isStreamingDepthSupported") & 1) != 0
          || (objc_msgSend(v11, "isStillImageDisparitySupported") & 1) != 0
          || (objc_msgSend(v11, "isStillImageDepthSupported") & 1) != 0)
        {
          goto LABEL_9;
        }
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          LOBYTE(v5) = 0;
          if (v8)
            goto LABEL_20;
          return v5;
        }
      }
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("visn")))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v12 = -[AVCaptureFigVideoDevice formats](self, "formats");
      v5 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (!v5)
        return v5;
      v13 = v5;
      v14 = *(_QWORD *)v26;
LABEL_33:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v12);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v15), "isVisionDataDeliverySupported") & 1) != 0)
          goto LABEL_9;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          LOBYTE(v5) = 0;
          if (v13)
            goto LABEL_33;
          return v5;
        }
      }
    }
    LODWORD(v5) = objc_msgSend(a3, "isEqualToString:", CFSTR("cacd"));
    if ((_DWORD)v5)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v16 = -[AVCaptureFigVideoDevice formats](self, "formats", 0);
      v5 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      if (v5)
      {
        v17 = v5;
        v18 = *(_QWORD *)v22;
LABEL_44:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v16);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v19), "isCameraCalibrationDataDeliverySupported") & 1) != 0)
            goto LABEL_9;
          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
            LOBYTE(v5) = 0;
            if (v17)
              goto LABEL_44;
            return v5;
          }
        }
      }
    }
  }
  return v5;
}

- (id)deviceType
{
  int v2;
  id result;
  __CFString **v4;

  v2 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047F0]), "intValue");
  result = &stru_1E421DB28;
  switch(v2)
  {
    case 2:
    case 11:
      v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInWideAngleCamera;
      goto LABEL_17;
    case 3:
      v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInTelephotoCamera;
      goto LABEL_17;
    case 4:
      v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInDualCamera;
      goto LABEL_17;
    case 6:
    case 12:
      v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInTrueDepthCamera;
      goto LABEL_17;
    case 7:
      v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInUltraWideCamera;
      goto LABEL_17;
    case 8:
      v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInDualWideCamera;
      goto LABEL_17;
    case 9:
      v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInTripleCamera;
      goto LABEL_17;
    case 10:
      v4 = AVCaptureDeviceTypeBuiltInTimeOfFlightCamera;
      goto LABEL_17;
    case 13:
      v4 = (__CFString **)&AVCaptureDeviceTypeBuiltInLiDARDepthCamera;
      goto LABEL_17;
    case 14:
      v4 = (__CFString **)&AVCaptureDeviceTypeDeskViewCamera;
      goto LABEL_17;
    case 15:
      v4 = (__CFString **)&AVCaptureDeviceTypeExternal;
      goto LABEL_17;
    case 16:
      v4 = (__CFString **)&AVCaptureDeviceTypeContinuityCamera;
      goto LABEL_17;
    case 17:
    case 18:
      v4 = AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera;
      goto LABEL_17;
    case 19:
      v4 = AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera;
      goto LABEL_17;
    case 20:
      v4 = AVCaptureDeviceTypeBuiltInInfraredMetadataCamera;
LABEL_17:
      result = *v4;
      break;
    default:
      return result;
  }
  return result;
}

- (int64_t)position
{
  return self->_position;
}

- (id)formats
{
  return self->_formats;
}

- (id)availableBoxedMetadataFormatDescriptions
{
  id result;
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFAllocator *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  _BYTE v32[128];
  _QWORD v33[2];
  _QWORD v34[2];
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[2];
  uint64_t v38;
  _QWORD v39[2];
  _QWORD v40[2];
  uint64_t v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  _QWORD v45[4];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  result = *(id *)&self->_eyeDetectionEnabled;
  if (!result)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    formatDescriptionOut = 0;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = -[AVCaptureFigVideoDevice isFaceDetectionSupported](self, "isFaceDetectionSupported");
    v7 = (uint64_t *)MEMORY[0x1E0CA2528];
    v8 = (uint64_t *)MEMORY[0x1E0CA2518];
    if (v6)
    {
      v9 = *MEMORY[0x1E0CA2558];
      v10 = *MEMORY[0x1E0CA2518];
      v46[0] = *MEMORY[0x1E0CA2528];
      v46[1] = v10;
      v11 = *MEMORY[0x1E0CA24B0];
      v47[0] = v9;
      v47[1] = v11;
      v48[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
      objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1));
    }
    if (-[AVCaptureFigVideoDevice isObjectDetectionSupported](self, "isObjectDetectionSupported"))
    {
      v12 = *v7;
      v13 = *MEMORY[0x1E0CA2560];
      v14 = *v8;
      v42[0] = v12;
      v42[1] = v14;
      v15 = *MEMORY[0x1E0CA24B8];
      v43[0] = v13;
      v43[1] = v15;
      v44 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
      v45[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v16 = *MEMORY[0x1E0CA2548];
      v39[0] = v12;
      v39[1] = v14;
      v17 = *MEMORY[0x1E0CA24A0];
      v40[0] = v16;
      v40[1] = v17;
      v41 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
      v45[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      v18 = *MEMORY[0x1E0CA2550];
      v36[0] = v12;
      v36[1] = v14;
      v19 = *MEMORY[0x1E0CA24A8];
      v37[0] = v18;
      v37[1] = v19;
      v38 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
      v45[2] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v20 = *MEMORY[0x1E0CA2568];
      v33[0] = v12;
      v33[1] = v14;
      v21 = *MEMORY[0x1E0CA24C0];
      v34[0] = v20;
      v34[1] = v21;
      v35 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v45[3] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4));
    }
    if (-[AVCaptureFigVideoDevice isObjectDetectionSupported](self, "isObjectDetectionSupported")
      || -[AVCaptureFigVideoDevice isFaceDetectionSupported](self, "isFaceDetectionSupported"))
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v28;
        v25 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v28 != v24)
              objc_enumerationMutation(v5);
            if (!CMMetadataFormatDescriptionCreateWithMetadataSpecifications(v25, 0x6D656278u, *(CFArrayRef *)(*((_QWORD *)&v27 + 1) + 8 * v26), &formatDescriptionOut))
            {
              objc_msgSend(v4, "addObject:", formatDescriptionOut);
              CFRelease(formatDescriptionOut);
            }
            ++v26;
          }
          while (v23 != v26);
          v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v23);
      }
    }
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v4);
    *(_QWORD *)&self->_eyeDetectionEnabled = result;
  }
  return result;
}

- (BOOL)isFaceDetectionSupported
{
  return 1;
}

- (BOOL)isObjectDetectionSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048A0]), "BOOLValue");
}

uint64_t __59__AVCaptureFigVideoDevice_isActiveVideoMaxFrameDurationSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 316) & 1;
  return result;
}

id __48__AVCaptureFigVideoDevice_activeDepthDataFormat__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 152);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __49__AVCaptureFigVideoDevice_isPortraitEffectActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1250);
  return result;
}

uint64_t __46__AVCaptureFigVideoDevice_isStudioLightActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1253);
  return result;
}

uint64_t __46__AVCaptureFigVideoDevice_isCenterStageActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1212);
  return result;
}

uint64_t __62__AVCaptureFigVideoDevice_automaticallyAdjustsVideoHDREnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 844);
  return result;
}

- (int64_t)activeColorSpace
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_activeColorSpace__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)unlockForConfiguration
{
  NSObject *fcsQueue;
  _QWORD block[5];

  fcsQueue = self->_fcsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVCaptureFigVideoDevice_unlockForConfiguration__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  dispatch_sync(fcsQueue, block);
}

- (BOOL)lockForConfiguration:(id *)a3
{
  NSObject *fcsQueue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  fcsQueue = self->_fcsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVCaptureFigVideoDevice_lockForConfiguration___block_invoke;
  block[3] = &unk_1E4217A38;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(fcsQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isActiveVideoMinFrameDurationSet
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVCaptureFigVideoDevice_isActiveVideoMinFrameDurationSet__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isActiveVideoMaxFrameDurationSet
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVCaptureFigVideoDevice_isActiveVideoMaxFrameDurationSet__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)_setUpCameraHistoryOnce
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = a1;
  if (_setUpCameraHistoryOnce_onceToken != -1)
    dispatch_once(&_setUpCameraHistoryOnce_onceToken, block);
}

- (BOOL)isWideColorSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04950]), "BOOLValue");
}

- (BOOL)isPortraitEffectActive
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVCaptureFigVideoDevice_isPortraitEffectActive__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isStudioLightActive
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVCaptureFigVideoDevice_isStudioLightActive__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCenterStageActive
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVCaptureFigVideoDevice_isCenterStageActive__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setCameraCalibrationDataDeliveryEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *devicePropsQueue;
  _QWORD v6[7];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__AVCaptureFigVideoDevice__setCameraCalibrationDataDeliveryEnabled___block_invoke;
  v6[3] = &unk_1E4217E98;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v12;
  v6[6] = &v8;
  dispatch_sync(devicePropsQueue, v6);
  if (v3 && *((_BYTE *)v9 + 24))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Depth data delivery and camera calibration data delivery may not both be enabled"), 0));
  if (*((_BYTE *)v13 + 24))
    -[AVCaptureFigVideoDevice _updateMinMaxDefaultVideoZoomFactors](self, "_updateMinMaxDefaultVideoZoomFactors");
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

+ (id)_devices
{
  return +[AVCaptureFigVideoDevice _devicesWithPriorRegisteredDevices:](AVCaptureFigVideoDevice, "_devicesWithPriorRegisteredDevices:", 0);
}

- (id)activeFormat
{
  NSObject *devicePropsQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVCaptureFigVideoDevice_activeFormat__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)uniqueID
{
  return self->_fcsUID;
}

- (id)localizedName
{
  id result;

  result = self->_localizedName;
  if (!result)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04898]);
    AVCaptureBundleIdentifier();
    result = (id)AVLocalizedStringFromTableWithBundleIdentifier();
    self->_localizedName = (NSString *)result;
    if (!result)
    {
      result = -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04868]);
      self->_localizedName = (NSString *)result;
    }
  }
  return result;
}

- (void)_setConstantColorEnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD block[6];
  BOOL v5;
  _QWORD v6[3];
  char v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVCaptureFigVideoDevice__setConstantColorEnabled___block_invoke;
  block[3] = &unk_1E4217C68;
  v5 = a3;
  block[4] = self;
  block[5] = v6;
  dispatch_sync(devicePropsQueue, block);
  _Block_object_dispose(v6, 8);
}

- (void)_setDepthDataDeliveryEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *devicePropsQueue;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[6];
  _QWORD block[8];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v3 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  devicePropsQueue = self->_devicePropsQueue;
  v14 = 0;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVCaptureFigVideoDevice__setDepthDataDeliveryEnabled___block_invoke;
  block[3] = &unk_1E4217E70;
  v10 = a3;
  block[4] = self;
  block[5] = &v11;
  block[6] = &v19;
  block[7] = &v15;
  dispatch_sync(devicePropsQueue, block);
  if (v3 && *((_BYTE *)v16 + 24))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Depth data delivery and camera calibration data delivery may not both be enabled"), 0));
  if (*((_BYTE *)v12 + 24))
  {
    -[AVCaptureFigVideoDevice _updateMinMaxDefaultVideoZoomFactors](self, "_updateMinMaxDefaultVideoZoomFactors");
    if (-[AVCaptureFigVideoDevice _isBravoVariant](self, "_isBravoVariant"))
      -[AVCaptureFigVideoDevice _updateFallbackPrimaryConstituentDevicesForDepthDataDeliveryEnabled:](self, "_updateFallbackPrimaryConstituentDevicesForDepthDataDeliveryEnabled:", v3);
  }
  if (v20[5])
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("systemPressureState"));
    v7 = self->_devicePropsQueue;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __56__AVCaptureFigVideoDevice__setDepthDataDeliveryEnabled___block_invoke_2;
    v8[3] = &unk_1E42178B8;
    v8[4] = self;
    v8[5] = &v19;
    dispatch_sync(v7, v8);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("systemPressureState"));
  }
  if (*((_BYTE *)v12 + 24))
    -[AVCaptureFigVideoDevice _updateCenterStageActiveForEnabled:updateDependentProperties:](self, "_updateCenterStageActiveForEnabled:updateDependentProperties:", +[AVCaptureDevice isCenterStageEnabled](AVCaptureDevice, "isCenterStageEnabled"), 0);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)_setContinuousZoomWithDepthDisallowed:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v5[7];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AVCaptureFigVideoDevice__setContinuousZoomWithDepthDisallowed___block_invoke;
  v5[3] = &unk_1E4217AB0;
  v5[4] = self;
  v5[5] = &v7;
  v6 = a3;
  v5[6] = &v11;
  dispatch_sync(devicePropsQueue, v5);
  if (*((_BYTE *)v12 + 24))
    -[AVCaptureFigVideoDevice _updateActiveDepthDataFormatForContinuousZoomWithDepth](self, "_updateActiveDepthDataFormatForContinuousZoomWithDepth");
  if (*((_BYTE *)v8 + 24))
    -[AVCaptureFigVideoDevice _updateMinMaxDefaultVideoZoomFactors](self, "_updateMinMaxDefaultVideoZoomFactors");
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

- (double)videoZoomFactor
{
  return *(float *)&self->_activeColorSpace;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMinFrameDuration
{
  NSObject *devicePropsQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_19EF10DB5;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVCaptureFigVideoDevice_activeVideoMinFrameDuration__block_invoke;
  block[3] = &unk_1E4217A60;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeDepthDataMinFrameDuration
{
  NSObject *devicePropsQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_19EF10DB5;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AVCaptureFigVideoDevice_activeDepthDataMinFrameDuration__block_invoke;
  block[3] = &unk_1E4217A60;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (BOOL)isNonDestructiveCropEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureFigVideoDevice_isNonDestructiveCropEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)videoZoomRampAcceleration
{
  return self->_videoZoomRampTarget;
}

- (int64_t)videoStabilizationStrength
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__AVCaptureFigVideoDevice_videoStabilizationStrength__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)smileDetectionEnabled
{
  return BYTE2(self->_supportedOptionalFaceDetectionFeatures);
}

- (CGSize)normalizedNonDestructiveCropSize
{
  NSObject *devicePropsQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = &unk_19EF10DB5;
  devicePropsQueue = self->_devicePropsQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__AVCaptureFigVideoDevice_normalizedNonDestructiveCropSize__block_invoke;
  v7[3] = &unk_1E4217A60;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(devicePropsQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)isVariableFrameRateVideoCaptureEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AVCaptureFigVideoDevice_isVariableFrameRateVideoCaptureEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isSpatialOverCaptureEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureFigVideoDevice_isSpatialOverCaptureEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isManualFramingEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVCaptureFigVideoDevice_isManualFramingEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isLowLightVideoCaptureEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVCaptureFigVideoDevice_isLowLightVideoCaptureEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isGazeSelectionEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVCaptureFigVideoDevice_isGazeSelectionEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDockedTrackingEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AVCaptureFigVideoDevice_isDockedTrackingEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (OpaqueFigCaptureSource)figCaptureSource
{
  return self->_fcs;
}

- (id)fallbackPrimaryConstituentDevicesAsDeviceTypes
{
  if (-[AVCaptureFigVideoDevice _isBravoVariant](self, "_isBravoVariant")
    && !self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions)
  {
    -[AVCaptureFigVideoDevice _populateSupportedFallbackPrimaryConstituentDevices](self, "_populateSupportedFallbackPrimaryConstituentDevices");
  }
  return avcfvd_deviceTypesFromAVCaptureDevices(self->_supportedFallbackPrimaryConstituentDevices);
}

- (int)faceDrivenAEAFMode
{
  NSObject *devicePropsQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVCaptureFigVideoDevice_faceDrivenAEAFMode__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)eyeDetectionEnabled
{
  return (BOOL)self->_supportedOptionalFaceDetectionFeatures;
}

- (BOOL)eyeClosedDetectionEnabled
{
  return BYTE1(self->_supportedOptionalFaceDetectionFeatures);
}

- (BOOL)automaticallyAdjustsImageControlMode
{
  return BYTE1(self->_sceneClassificationKVO);
}

- (BOOL)appliesSessionPresetMaxIntegrationTimeOverrideToActiveFormat
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04770]), "BOOLValue");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeMaxExposureDurationClientOverride
{
  NSObject *devicePropsQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_19EF10DB5;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AVCaptureFigVideoDevice_activeMaxExposureDurationClientOverride__block_invoke;
  block[3] = &unk_1E4217A60;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (void)_setStudioLightingAllowed:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__AVCaptureFigVideoDevice__setStudioLightingAllowed___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_setReactionEffectsAllowed:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__AVCaptureFigVideoDevice__setReactionEffectsAllowed___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_setCenterStageAllowed:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__AVCaptureFigVideoDevice__setCenterStageAllowed___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_setBackgroundBlurAllowed:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__AVCaptureFigVideoDevice__setBackgroundBlurAllowed___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_updateCenterStageActiveForEnabled:(BOOL)a3 updateDependentProperties:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *devicePropsQueue;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[6];
  _QWORD block[10];
  BOOL v11;
  _QWORD v12[3];
  char v13;
  _QWORD v14[3];
  char v15;
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

  v4 = a4;
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
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  devicePropsQueue = self->_devicePropsQueue;
  v7 = MEMORY[0x1E0C809B0];
  v13 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__AVCaptureFigVideoDevice__updateCenterStageActiveForEnabled_updateDependentProperties___block_invoke;
  block[3] = &unk_1E4217E20;
  block[4] = self;
  block[5] = &v22;
  v11 = a3;
  block[6] = &v18;
  block[7] = v16;
  block[8] = v14;
  block[9] = v12;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned __int8 *)v23 + 24) != *((unsigned __int8 *)v19 + 24))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("centerStageActive"));
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cinematicFramingActive"));
    if (v4)
    {
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeVideoMinFrameDuration"));
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeVideoMaxFrameDuration"));
    }
    v8 = self->_devicePropsQueue;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __88__AVCaptureFigVideoDevice__updateCenterStageActiveForEnabled_updateDependentProperties___block_invoke_2;
    v9[3] = &unk_1E42178B8;
    v9[4] = self;
    v9[5] = &v18;
    dispatch_sync(v8, v9);
    if (v4)
    {
      -[AVCaptureFigVideoDevice _updateMinMaxDefaultVideoZoomFactors](self, "_updateMinMaxDefaultVideoZoomFactors");
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeVideoMaxFrameDuration"));
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeVideoMinFrameDuration"));
    }
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cinematicFramingActive"));
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("centerStageActive"));
  }
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

uint64_t __65__AVCaptureFigVideoDevice_isGeometricDistortionCorrectionEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1168);
  return result;
}

uint64_t __52__AVCaptureFigVideoDevice_canPerformReactionEffects__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1256);
  return result;
}

uint64_t __49__AVCaptureFigVideoDevice_unlockForConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t (*v3)(uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  result = CMBaseObjectGetVTable();
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(result + 16) + 16);
  if (v3)
    return v3(v1);
  return result;
}

uint64_t __75__AVCaptureFigVideoDevice__setVideoHDREnabled_forceResetVideoHDRSuspended___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 845) != *(unsigned __int8 *)(result + 48);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 845) = *(_BYTE *)(result + 48);
  return result;
}

uint64_t __54__AVCaptureFigVideoDevice__isDepthDataDeliveryEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 936);
  return result;
}

uint64_t __52__AVCaptureFigVideoDevice__setConstantColorEnabled___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 48);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 1369))
  {
    *(_BYTE *)(v2 + 1369) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)isAutoRedEyeReductionSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048D0]), "BOOLValue");
}

- (int)_orderInDevicesArray
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047F0]), "intValue");
}

uint64_t __68__AVCaptureFigVideoDevice__setCameraCalibrationDataDeliveryEnabled___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 56);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 952))
  {
    *(_BYTE *)(v2 + 952) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    v2 = *(_QWORD *)(result + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = *(_BYTE *)(v2 + 936);
  return result;
}

uint64_t __54__AVCaptureFigVideoDevice__setReactionEffectsAllowed___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1257) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __53__AVCaptureFigVideoDevice__setStudioLightingAllowed___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1254) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __53__AVCaptureFigVideoDevice__setBackgroundBlurAllowed___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1251) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __50__AVCaptureFigVideoDevice__setCenterStageAllowed___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1213) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __57__AVCaptureFigVideoDevice__copyFigCaptureSourceProperty___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD, uint64_t);

  v1 = *(_QWORD *)(a1[4] + 56);
  v2 = a1[6];
  v3 = *(_QWORD *)(a1[5] + 8);
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 48);
  if (v5)
    return v5(v1, v2, *MEMORY[0x1E0C9AE00], v3 + 40);
  return result;
}

uint64_t __39__AVCaptureFigVideoDevice_exposureMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 424);
  return result;
}

- (BOOL)isEyeClosedDetectionSupported
{
  id v2;

  v2 = -[AVCaptureFigVideoDevice _supportedOptionalFaceDetectionFeaturesDictionary](self, "_supportedOptionalFaceDetectionFeaturesDictionary");
  return objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D04B48]), "BOOLValue");
}

- (BOOL)isEyeDetectionSupported
{
  id v2;

  v2 = -[AVCaptureFigVideoDevice _supportedOptionalFaceDetectionFeaturesDictionary](self, "_supportedOptionalFaceDetectionFeaturesDictionary");
  return objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D04B50]), "BOOLValue");
}

- (BOOL)isSmileDetectionSupported
{
  id v2;

  v2 = -[AVCaptureFigVideoDevice _supportedOptionalFaceDetectionFeaturesDictionary](self, "_supportedOptionalFaceDetectionFeaturesDictionary");
  return objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D04B58]), "BOOLValue");
}

- (id)_supportedOptionalFaceDetectionFeaturesDictionary
{
  id result;

  result = self->_captureSourceSupportedMetadata;
  if (!result)
  {
    result = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04DC0]);
    self->_captureSourceSupportedMetadata = (NSMutableArray *)result;
  }
  return result;
}

uint64_t __54__AVCaptureFigVideoDevice_isNonDestructiveCropEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1142);
  return result;
}

- (CGPoint)exposurePointOfInterest
{
  double x;
  double y;
  CGPoint result;

  x = self->_exposurePointOfInterest.x;
  y = self->_exposurePointOfInterest.y;
  result.y = y;
  result.x = x;
  return result;
}

uint64_t __65__AVCaptureFigVideoDevice_isVariableFrameRateVideoCaptureEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1170);
  return result;
}

__n128 __59__AVCaptureFigVideoDevice_normalizedNonDestructiveCropSize__block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 1152);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

uint64_t __56__AVCaptureFigVideoDevice_isLowLightVideoCaptureEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1140);
  return result;
}

uint64_t __54__AVCaptureFigVideoDevice_isSpatialOverCaptureEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1141);
  return result;
}

uint64_t __53__AVCaptureFigVideoDevice_videoStabilizationStrength__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 1176);
  return result;
}

uint64_t __50__AVCaptureFigVideoDevice_isDockedTrackingEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1368);
  return result;
}

uint64_t __49__AVCaptureFigVideoDevice_isManualFramingEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1299);
  return result;
}

uint64_t __49__AVCaptureFigVideoDevice_isGazeSelectionEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1336);
  return result;
}

uint64_t __45__AVCaptureFigVideoDevice_faceDrivenAEAFMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 800);
  return result;
}

uint64_t __40__AVCaptureFigVideoDevice_isFlashActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 746);
  return result;
}

uint64_t __48__AVCaptureFigVideoDevice_lockForConfiguration___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t (*v4)(uint64_t);
  uint64_t **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1[4] + 56);
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(result + 16) + 8);
  if (v4)
  {
    result = v4(v2);
    if (!(_DWORD)result)
      return result;
    v5 = (uint64_t **)(a1 + 6);
    if (a1[6])
    {
      if ((_DWORD)result == -16455)
      {
        v6 = a1[4];
        v10 = *MEMORY[0x1E0CF2A68];
        v11[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
        result = AVLocalizedError();
LABEL_8:
        **v5 = result;
        goto LABEL_9;
      }
LABEL_7:
      v7 = a1[4];
      v8 = *MEMORY[0x1E0CF2A68];
      v9 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
      result = AVLocalizedErrorWithUnderlyingOSStatus();
      goto LABEL_8;
    }
  }
  else
  {
    v5 = (uint64_t **)(a1 + 6);
    if (a1[6])
      goto LABEL_7;
  }
LABEL_9:
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  return result;
}

uint64_t __46__AVCaptureFigVideoDevice_isAdjustingExposure__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 540);
  return result;
}

__n128 __58__AVCaptureFigVideoDevice_activeDepthDataMinFrameDuration__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 168);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

__n128 __66__AVCaptureFigVideoDevice_activeMaxExposureDurationClientOverride__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 516);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 532);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (CGPoint)focusPointOfInterest
{
  double x;
  double y;
  CGPoint result;

  x = self->_focusPointOfInterest.x;
  y = self->_focusPointOfInterest.y;
  result.y = y;
  result.x = x;
  return result;
}

float __45__AVCaptureFigVideoDevice_exposureTargetBias__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 460);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __36__AVCaptureFigVideoDevice_focusMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 336);
  return result;
}

void *__75__AVCaptureFigVideoDevice__incrementObserverCountForHighFrequencyProperty___block_invoke(uint64_t a1)
{
  void *result;
  int v3;
  NSObject *v4;
  _QWORD v5[4];
  __int128 v6;

  result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "objectForKeyedSubscript:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  if (result)
  {
    v3 = objc_msgSend(result, "intValue");
    result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v3 + 1)), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
    if (!v3)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __75__AVCaptureFigVideoDevice__incrementObserverCountForHighFrequencyProperty___block_invoke_2;
      v5[3] = &unk_1E4216408;
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
      v6 = *(_OWORD *)(a1 + 32);
      dispatch_sync(v4, v5);
      return (void *)objc_msgSend(*(id *)(a1 + 32), "_updateFigCaptureSourceObserverCounts");
    }
  }
  return result;
}

uint64_t __43__AVCaptureFigVideoDevice_isAdjustingFocus__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 364);
  return result;
}

uint64_t __48__AVCaptureFigVideoDevice_setVideoHDRSuspended___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04DF8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  if (!(_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 846) = *(_BYTE *)(a1 + 40);
  return result;
}

- (void)setAutomaticallyAdjustsImageControlMode:(BOOL)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04BB8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"));
  if (v5 == -16452)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
  else if (!v5)
  {
    BYTE1(self->_sceneClassificationKVO) = a3;
  }
}

- (void)setSubjectAreaChangeMonitoringEnabled:(BOOL)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04DA8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"));
  if (v5 == -16452)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
  else if (!v5)
  {
    BYTE1(self->_torchLevel) = a3;
  }
}

uint64_t __40__AVCaptureFigVideoDevice_setFocusMode___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;

  LODWORD(a2) = 2139095039;
  result = objc_msgSend(*(id *)(a1 + 32), "_setFocusWithMode:lensPosition:requestID:", *(_QWORD *)(a1 + 48), 0, a2);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) = *(_QWORD *)(a1 + 48);
  return result;
}

- (int)_setFocusWithMode:(int64_t)a3 lensPosition:(float)a4 requestID:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  CFDictionaryRef v16;
  double x;
  BOOL v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  double v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  CGSize size;

  v6 = *(_QWORD *)&a5;
  if (!_FigIsCurrentDispatchQueue())
  {
    v26 = v5;
    LODWORD(v25) = 0;
    FigDebugAssert3();
  }
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v25, v26);
  v11 = v10;
  if (a3)
  {
    if ((unint64_t)a3 <= 2)
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D04A30]);
      if (-[AVCaptureFigVideoDevice isAutoFocusRangeRestrictionSupported](self, "isAutoFocusRangeRestrictionSupported"))
      {
        v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_autoFocusRangeRestriction);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D04A40]);
      }
      if (-[AVCaptureFigVideoDevice isSmoothAutoFocusSupported](self, "isSmoothAutoFocusSupported"))
      {
        v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_smoothAutoFocusEnabled);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D04A58]);
      }
      if (-[AVCaptureFigVideoDevice isFocusPointOfInterestSupported](self, "isFocusPointOfInterestSupported"))
      {
        size.width = 0.0;
        size.height = 0.0;
        if (a3 != 2
          || (v15 = -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047E0])) == 0|| (CGSizeMakeWithDictionaryRepresentation(v15, &size), (v16 = fvd_cgRectDictionaryForCenterAndSize(self->_focusPointOfInterest.x, self->_focusPointOfInterest.y, size.width, size.height)) == 0))
        {
          x = self->_focusPointOfInterest.x;
          v18 = self->_focusPointOfInterest.y == 0.5 && x == 0.5;
          v19 = (_QWORD *)MEMORY[0x1E0D047D0];
          if (!v18)
            v19 = (_QWORD *)MEMORY[0x1E0D047D8];
          CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *v19, x), &size);
          v16 = fvd_cgRectDictionaryForCenterAndSize(self->_focusPointOfInterest.x, self->_focusPointOfInterest.y, size.width, size.height);
        }
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D04A48]);
      }
      v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&self->_torchAvailable);
      v21 = (_QWORD *)MEMORY[0x1E0D04A28];
      goto LABEL_23;
    }
  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E424D0E0, *MEMORY[0x1E0D04A30]);
    *(float *)&v22 = a4;
    v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D04A38]);
    if ((_DWORD)v6)
    {
      v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v21 = (_QWORD *)MEMORY[0x1E0D04A50];
LABEL_23:
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, *v21);
    }
  }
  return -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04CD0], v11);
}

- (void)setFocusPointOfInterest:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  uint64_t v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (-[AVCaptureFigVideoDevice isFocusPointOfInterestSupported](self, "isFocusPointOfInterestSupported"))
    {
      self->_focusPointOfInterest.x = x;
      self->_focusPointOfInterest.y = y;
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

- (BOOL)isFocusPointOfInterestSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04830]), "BOOLValue");
}

- (BOOL)isSmoothAutoFocusSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048E0]), "BOOLValue");
}

- (BOOL)isAutoFocusRangeRestrictionSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04790]), "BOOLValue");
}

uint64_t __76__AVCaptureFigVideoDevice__setFigCaptureSourceProperty_withValue_cacheOnly___block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  int v7;

  v1 = (_QWORD *)result;
  if (!*(_BYTE *)(result + 64))
  {
    v2 = *(_QWORD *)(result + 40);
    v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 56);
    v4 = *(_QWORD *)(result + 56);
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      result = v5(v3, v4, v2);
    else
      result = 4294954514;
    *(_DWORD *)(*(_QWORD *)(v1[6] + 8) + 24) = result;
  }
  v6 = *(_QWORD *)(v1[6] + 8);
  v7 = *(_DWORD *)(v6 + 24);
  if (v7 == -16453)
  {
    *(_DWORD *)(v6 + 24) = 0;
    v7 = *(_DWORD *)(*(_QWORD *)(v1[6] + 8) + 24);
  }
  if (!v7)
    return objc_msgSend(*(id *)(v1[4] + 1120), "setObject:forKeyedSubscript:", v1[5], v1[7]);
  return result;
}

uint64_t __43__AVCaptureFigVideoDevice__setFlashActive___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 746) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __45__AVCaptureFigVideoDevice_isRampingVideoZoom__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(float *)(*(_QWORD *)(result + 32) + 868) != 0.0;
  return result;
}

uint64_t __56__AVCaptureFigVideoDevice__setDepthDataDeliveryEnabled___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  AVCaptureSystemPressureState *v4;

  v1 = result;
  v2 = *(unsigned __int8 *)(result + 64);
  v3 = *(_QWORD *)(result + 32);
  if (v2 != *(unsigned __int8 *)(v3 + 936))
  {
    *(_BYTE *)(v3 + 936) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *(_DWORD *)(*(_QWORD *)(result + 32) + 1136) = objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1128), "figLevel");
    v4 = -[AVCaptureSystemPressureState initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:]([AVCaptureSystemPressureState alloc], "initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:", *(unsigned int *)(*(_QWORD *)(v1 + 32) + 1136), objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1128), "factors"), objc_msgSend(*(id *)(v1 + 32), "_recommendedFrameRateRangeForVideoFormat:depthFormat:figSystemPressureLevel:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 144), *(_QWORD *)(*(_QWORD *)(v1 + 32) + 152), *(unsigned int *)(*(_QWORD *)(v1 + 32) + 1136)));
    result = -[AVCaptureSystemPressureState isEqual:](v4, "isEqual:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 1128));
    if ((result & 1) == 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40) = v4;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(v1 + 32) + 952);
  return result;
}

void __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[5];
  os_log_type_t type;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, void *);
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, void *);
  void *v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  sUserPreferredCameraHistoryKey = (uint64_t)+[AVCaptureFigVideoDevice _userPreferredCameraHistoryKeyForClientPreferencesDomain:](AVCaptureFigVideoDevice, "_userPreferredCameraHistoryKeyForClientPreferencesDomain:", AVCaptureClientPreferencesDomain());
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 32);
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_2;
  v29 = &unk_1E4216450;
  v30 = v3;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  sUserPreferredCameraOverrideHistoryKey = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/override/%@"), CFSTR("camera-history"), CFSTR("preferred-camera-history"));
  v4 = *(_QWORD *)(a1 + 32);
  v21 = v2;
  v22 = 3221225472;
  v23 = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_27;
  v24 = &unk_1E4216450;
  v25 = v4;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  sStreamingCameraHistoryKey = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/system-wide/%@"), CFSTR("camera-history"), CFSTR("streaming-camera-history"));
  v5 = *(_QWORD *)(a1 + 32);
  v16 = v2;
  v17 = 3221225472;
  v18 = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_31;
  v19 = &unk_1E4216450;
  v20 = v5;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  sCameraHistoryHasBeenSetUp = 1;
  if (dword_1ECFED6C0)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v7 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue](AVCaptureFigVideoDevice, "_cameraHistoryDispatchQueue", v11, v12);
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_33;
  block[3] = &unk_1E42165A8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v7, block);
  if (dword_1ECFED6C0)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v9 = v15;
    if (os_log_type_enabled(v8, type))
      v10 = v9;
    else
      v10 = v9 & 0xFFFFFFFE;
    if (v10)
    {
      v31 = 136315138;
      v32 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke_2";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

+ (id)_userPreferredCameraHistoryKeyForClientPreferencesDomain:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@/%@"), CFSTR("camera-history"), v3, CFSTR("preferred-camera-history"));
}

+ (id)systemPreferredCamera
{
  id v2;
  int v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[19];

  v14[18] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_setUpCameraHistoryOnce");
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  v2 = (id)sSystemPreferredCamera;
  v3 = sAllowsSuspendedPreferredCameras;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (!v2)
  {
    if (dword_1ECFED6C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5 = *MEMORY[0x1E0CF2B88];
    v14[0] = *MEMORY[0x1E0CF2B90];
    v14[1] = v5;
    v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2, v9, v12);
    LOBYTE(v10) = 0;
    v2 = +[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpecialDeviceTypes:](AVCaptureFigVideoDevice, "_defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpecialDeviceTypes:", CFSTR("All"), v6, 0, 1, v3 != 0, 1, v10, &unk_1E424D948);
    if (dword_1ECFED6C0)
    {
      v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    +[AVCaptureFigVideoDevice _insurePreferredCameraGlobal:globalName:preferredCamera:](AVCaptureFigVideoDevice, "_insurePreferredCameraGlobal:globalName:preferredCamera:", &sSystemPreferredCamera, CFSTR("system"), v2, v11, v13);
  }
  return v2;
}

+ (void)_refreshPreferredCameraProperties:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[20];

  v3 = a3;
  v30[18] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  v4 = sAllowsSuspendedPreferredCameras;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (dword_1ECFED6C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = *MEMORY[0x1E0CF2B90];
  v7 = *MEMORY[0x1E0CF2B88];
  v30[0] = *MEMORY[0x1E0CF2B90];
  v30[1] = v7;
  v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2, v21, v26);
  LOBYTE(v22) = v4 != 0;
  v9 = +[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpecialDeviceTypes:](AVCaptureFigVideoDevice, "_defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpecialDeviceTypes:", CFSTR("All"), v8, 0, 0, 0, 0, v22, 0);
  if (dword_1ECFED6C0)
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v29[0] = v6;
  v29[1] = v7;
  v11 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2, v23, v27);
  LOBYTE(v24) = 0;
  v12 = +[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpecialDeviceTypes:](AVCaptureFigVideoDevice, "_defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpecialDeviceTypes:", CFSTR("All"), v11, 0, 1, v4 != 0, 1, v24, &unk_1E424D960);
  if (!v4)
  {
    if (objc_msgSend(v9, "isSuspended"))
    {
      if (dword_1ECFED6C0)
      {
        v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v9 = 0;
    }
    if (objc_msgSend(v12, "isSuspended", v25, v28))
    {
      if (dword_1ECFED6C0)
      {
        v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v12 = 0;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  if (v9 == (id)sUserPreferredCamera)
    v15 = 0;
  else
    v15 = objc_msgSend(v9, "isEqual:") ^ 1;
  if (v12 == (id)sSystemPreferredCamera)
    v16 = 0;
  else
    v16 = objc_msgSend(v12, "isEqual:") ^ 1;
  if (dword_1ECFED6C0)
  {
    v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1ECFED6C0)
    {
      v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if ((v15 | v16) == 1)
  {
    if (v3)
    {
      if (v15)
        objc_msgSend((id)objc_opt_class(), "willChangeValueForKey:", CFSTR("userPreferredCamera"));
      if (v16)
        objc_msgSend((id)objc_opt_class(), "willChangeValueForKey:", CFSTR("systemPreferredCamera"));
    }
    if (v15)
    {
      if (!dword_1ECFED6C0)
        goto LABEL_34;
    }
    else if (!dword_1ECFED6C0)
    {
      goto LABEL_34;
    }
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_34:
    if (v16)
    {
      if (dword_1ECFED6C0)
        goto LABEL_38;
    }
    else if (dword_1ECFED6C0)
    {
LABEL_38:
      v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
    if (v15)
    {

      sUserPreferredCamera = (uint64_t)v9;
    }
    if (v16)
    {

      sSystemPreferredCamera = (uint64_t)v12;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    if (v3)
    {
      if (v15)
        objc_msgSend((id)objc_opt_class(), "didChangeValueForKey:", CFSTR("userPreferredCamera"));
      if (v16)
        objc_msgSend((id)objc_opt_class(), "didChangeValueForKey:", CFSTR("systemPreferredCamera"));
    }
  }
}

+ (id)_defaultDeviceWithDeviceType:(id)a3 mediaTypes:(id)a4 position:(int64_t)a5 cameraOverrideHistoryAllowed:(BOOL)a6 cameraOverrideHistorySuspendedAllowed:(BOOL)a7 wombatsMustBeMagic:(BOOL)a8 userPreferredCameraHistorySuspendedAllowed:(BOOL)a9 invalidSpecialDeviceTypes:(id)a10
{
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  unsigned int v32;
  unsigned int v33;
  NSObject *v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  NSObject *v42;
  unsigned int v43;
  unsigned int v44;
  _BOOL4 v45;
  NSObject *v46;
  unsigned int v47;
  unsigned int v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  unsigned int v53;
  unsigned int v54;
  void *v55;
  _QWORD *v56;
  NSObject *v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  void *v64;
  _QWORD *v65;
  NSObject *v66;
  unsigned int v67;
  unsigned int v68;
  int v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  void *v76;
  void *v77;
  NSObject *v78;
  unsigned int v79;
  unsigned int v80;
  NSObject *v81;
  unsigned int v82;
  unsigned int v83;
  NSObject *v84;
  unsigned int v85;
  unsigned int v86;
  NSObject *v87;
  unsigned int v88;
  unsigned int v89;
  _QWORD *FirstAvailableDeviceFromHistory;
  NSObject *v91;
  unsigned int v92;
  unsigned int v93;
  _QWORD *v94;
  NSObject *v95;
  unsigned int v96;
  unsigned int v97;
  int v98;
  uint64_t v100;
  int *v101;
  int *v102;
  os_log_type_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _BOOL4 v108;
  _BOOL4 v109;
  _BOOL4 v110;
  id v111;
  id obj;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  os_log_type_t v126;
  unsigned int v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  void *v132;
  _BYTE v133[128];
  _BYTE v134[128];
  os_log_type_t v135[128];
  os_log_type_t type[4];
  const char *v137;
  __int16 v138;
  void *v139;
  int v140;
  const char *v141;
  __int16 v142;
  _BYTE v143[10];
  _BYTE v144[10];
  __int16 v145;
  int v146;
  _BYTE v147[128];
  uint64_t v148;

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v148 = *MEMORY[0x1E0C80C00];
  +[AVCaptureFigVideoDevice _setUpCameraHistoryOnce](AVCaptureFigVideoDevice, "_setUpCameraHistoryOnce");
  if (a5)
  {
    if (dword_1ECFED6C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  v108 = v11;
  v109 = v12;
  obj = +[AVCaptureDevice devicesForDefaultDeviceSupport:includeAudioDevices:](AVCaptureDevice, "devicesForDefaultDeviceSupport:includeAudioDevices:", 0, 0);
  if (dword_1ECFED6C0)
  {
    LODWORD(v128) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v111 = a3;
  v110 = v10;
  v113 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", obj, v100, v104);
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v135, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v123;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v123 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * i);
        if (dword_1ECFED6C0)
        {
          LODWORD(v128) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v25 = v128;
          if (os_log_type_enabled(v24, type[0]))
            v26 = v25;
          else
            v26 = v25 & 0xFFFFFFFE;
          if (v26)
          {
            v140 = 136315395;
            v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllow"
                   "ed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowe"
                   "d:invalidSpecialDeviceTypes:]";
            v142 = 2113;
            *(_QWORD *)v143 = v23;
            LODWORD(v105) = 22;
            v101 = &v140;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        v27 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v118, v134, 16, v101, v105);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v119;
LABEL_21:
          v30 = 0;
          while (1)
          {
            if (*(_QWORD *)v119 != v29)
              objc_enumerationMutation(a4);
            if ((objc_msgSend(v23, "hasMediaType:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * v30)) & 1) != 0)
              break;
            if (v28 == ++v30)
            {
              v28 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v118, v134, 16);
              if (v28)
                goto LABEL_21;
              goto LABEL_31;
            }
          }
          if ((objc_msgSend(a10, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v23, "specialDeviceType"))) & 1) == 0&& ((objc_msgSend(v111, "isEqualToString:", CFSTR("All")) & 1) != 0|| (objc_msgSend((id)objc_msgSend(v23, "deviceType"), "isEqualToString:", v111) & 1) != 0))
          {
            continue;
          }
        }
LABEL_31:
        objc_msgSend(v113, "removeObject:", v23);
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v135, 16);
    }
    while (v20);
  }
  if (dword_1ECFED6C0)
  {
    LODWORD(v128) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v32 = v128;
    if (os_log_type_enabled(v31, type[0]))
      v33 = v32;
    else
      v33 = v32 & 0xFFFFFFFE;
    if (v33)
    {
      v140 = 136315138;
      v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cam"
             "eraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpe"
             "cialDeviceTypes:]";
      LODWORD(v105) = 12;
      v101 = &v140;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1ECFED6C0)
    {
      LODWORD(v128) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v35 = v128;
      if (os_log_type_enabled(v34, type[0]))
        v36 = v35;
      else
        v36 = v35 & 0xFFFFFFFE;
      if (v36)
      {
        v140 = 136315394;
        v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:c"
               "ameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invali"
               "dSpecialDeviceTypes:]";
        v142 = 2112;
        *(_QWORD *)v143 = a4;
        LODWORD(v105) = 22;
        v101 = &v140;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v37 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v114, v133, 16, v101, v105);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v115;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v115 != v39)
          objc_enumerationMutation(v113);
        if (dword_1ECFED6C0)
        {
          v41 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * j);
          LODWORD(v128) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v43 = v128;
          if (os_log_type_enabled(v42, type[0]))
            v44 = v43;
          else
            v44 = v43 & 0xFFFFFFFE;
          if (v44)
          {
            v140 = 136315395;
            v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllow"
                   "ed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowe"
                   "d:invalidSpecialDeviceTypes:]";
            v142 = 2113;
            *(_QWORD *)v143 = v41;
            LODWORD(v106) = 22;
            v102 = &v140;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      v38 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v114, v133, 16);
    }
    while (v38);
  }
  v45 = v10;
  if (dword_1ECFED6C0)
  {
    LODWORD(v128) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v47 = v128;
    if (os_log_type_enabled(v46, type[0]))
      v48 = v47;
    else
      v48 = v47 & 0xFFFFFFFE;
    if (v48)
    {
      v140 = 136315138;
      v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cam"
             "eraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpe"
             "cialDeviceTypes:]";
      LODWORD(v106) = 12;
      v102 = &v140;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!v109)
  {
    v55 = 0;
LABEL_82:
    os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
    if (sUserPreferredCameraHistory)
      v49 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
    else
      v49 = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
LABEL_86:
    if (v110 && !v55)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
      if (sUserPreferredCameraOverrideHistory)
        v55 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
      else
        v55 = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    }
    if (objc_msgSend(v49, "count", v102, v106))
    {
      v56 = v110
          ? getFirstAvailableDeviceFromHistoryWhereWombatsMustBeMagic(v49, v113, a9, 1, v55)
          : getFirstAvailableDeviceFromHistory(v49, v113, a9, 1);
      v18 = v56;
      if (v56)
      {
        if (dword_1ECFED6C0)
        {
          LODWORD(v128) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v58 = v128;
          if (os_log_type_enabled(v57, type[0]))
            v59 = v58;
          else
            v59 = v58 & 0xFFFFFFFE;
          if (v59)
          {
            if (v45)
              v60 = 84;
            else
              v60 = 70;
            if (a9)
              v61 = 84;
            else
              v61 = 70;
            v62 = objc_msgSend(v18, "isSuspended");
            v140 = 136316162;
            v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllow"
                   "ed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowe"
                   "d:invalidSpecialDeviceTypes:]";
            if (v62)
              v63 = 84;
            else
              v63 = 70;
            v142 = 1024;
            *(_DWORD *)v143 = v60;
            *(_WORD *)&v143[4] = 1024;
            *(_DWORD *)&v143[6] = v61;
            *(_WORD *)v144 = 2112;
            *(_QWORD *)&v144[2] = v18;
            v145 = 1024;
            v146 = v63;
            _os_log_send_and_compose_impl();
          }
          goto LABEL_202;
        }
        return v18;
      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
    if (sStreamingCameraHistory)
      v64 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
    else
      v64 = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    if (objc_msgSend(v64, "count"))
    {
      v65 = v45
          ? getFirstAvailableDeviceFromHistoryWhereWombatsMustBeMagic(v64, v113, 0, 0, v55)
          : getFirstAvailableDeviceFromHistory(v64, v113, 0, 0);
      v18 = v65;
      if (v65)
      {
        if (!dword_1ECFED6C0)
          return v18;
        LODWORD(v128) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v67 = v128;
        if (os_log_type_enabled(v66, type[0]))
          v68 = v67;
        else
          v68 = v67 & 0xFFFFFFFE;
        if (!v68)
          goto LABEL_202;
        v69 = objc_msgSend(v18, "isSuspended");
        v140 = 136315650;
        v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:c"
               "ameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invali"
               "dSpecialDeviceTypes:]";
        if (v69)
          v70 = 84;
        else
          v70 = 70;
LABEL_199:
        v142 = 2112;
        *(_QWORD *)v143 = v18;
        *(_WORD *)&v143[8] = 1024;
        *(_DWORD *)v144 = v70;
        _os_log_send_and_compose_impl();
        goto LABEL_202;
      }
    }
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v71 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v128, v147, 16);
    if (!v71)
      goto LABEL_161;
    v72 = v71;
    v18 = 0;
    v73 = *(_QWORD *)v129;
    v74 = -1;
LABEL_130:
    v75 = 0;
    while (1)
    {
      if (*(_QWORD *)v129 != v73)
        objc_enumerationMutation(v113);
      v76 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v75);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v76, "isSuspended") & 1) != 0
        || objc_msgSend(v76, "position") != 2)
      {
        goto LABEL_150;
      }
      v77 = (void *)objc_msgSend(v76, "deviceType");
      if ((objc_msgSend(v77, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera")) & 1) != 0)
      {
        v18 = v76;
        goto LABEL_154;
      }
      if (objc_msgSend(v77, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTrueDepthCamera"))
        && v74 < 2)
      {
        v74 = 2;
      }
      else
      {
        if (!objc_msgSend(v77, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera"), v103, v107)|| v74 >= 1)
        {
          v127 = 0;
          v126 = OS_LOG_TYPE_DEFAULT;
          v78 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v79 = v127;
          if (os_log_type_enabled(v78, v126))
            v80 = v79;
          else
            v80 = v79 & 0xFFFFFFFE;
          if (v80)
          {
            *(_DWORD *)type = 136315394;
            v137 = "getMostCompatibleFrontCamera";
            v138 = 2112;
            v139 = v76;
            LODWORD(v107) = 22;
            v103 = type;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v74 = 0;
          v18 = v76;
          goto LABEL_150;
        }
        v74 = 1;
      }
      v18 = v76;
LABEL_150:
      if (v72 == ++v75)
      {
        v72 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v128, v147, 16);
        if (v72)
          goto LABEL_130;
LABEL_154:
        if (v18)
        {
          if (dword_1ECFED6C0)
          {
            LODWORD(v128) = 0;
            type[0] = OS_LOG_TYPE_DEFAULT;
            v81 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v82 = v128;
            if (os_log_type_enabled(v81, type[0]))
              v83 = v82;
            else
              v83 = v82 & 0xFFFFFFFE;
            if (v83)
              goto LABEL_160;
            goto LABEL_202;
          }
          return v18;
        }
LABEL_161:
        if (dword_1ECFED6C0)
        {
          LODWORD(v128) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          v84 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v85 = v128;
          if (os_log_type_enabled(v84, type[0]))
            v86 = v85;
          else
            v86 = v85 & 0xFFFFFFFE;
          if (v86)
          {
            v140 = 136315138;
            v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllow"
                   "ed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowe"
                   "d:invalidSpecialDeviceTypes:]";
            LODWORD(v107) = 12;
            v103 = (os_log_type_t *)&v140;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        return (id)objc_msgSend(v113, "firstObject", v103, v107);
      }
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  v49 = 0;
  if (sUserPreferredCameraHistory && sDownplayUserPreferredCameraOverrideHistory)
    v49 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (!objc_msgSend(v49, "count"))
    goto LABEL_186;
  v50 = (void *)objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
  if (v108)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sSuspendedDevicesLock);
    v51 = objc_msgSend(0, "objectForKey:", objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("DeviceUID")));
    if (v51 && dword_1ECFED6C0)
    {
      LODWORD(v128) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v52 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v53 = v128;
      if (os_log_type_enabled(v52, type[0]))
        v54 = v53;
      else
        v54 = v53 & 0xFFFFFFFE;
      if (v54)
      {
        v140 = 136315395;
        v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:c"
               "ameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invali"
               "dSpecialDeviceTypes:]";
        v142 = 2113;
        *(_QWORD *)v143 = v50;
        LODWORD(v106) = 22;
        v102 = &v140;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      os_unfair_lock_unlock((os_unfair_lock_t)&sSuspendedDevicesLock);
      goto LABEL_186;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sSuspendedDevicesLock);
    if (v51)
      goto LABEL_186;
  }
  if (dword_1ECFED6C0)
  {
    LODWORD(v128) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v87 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v88 = v128;
    if (os_log_type_enabled(v87, type[0]))
      v89 = v88;
    else
      v89 = v88 & 0xFFFFFFFE;
    if (v89)
    {
      v140 = 136315138;
      v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cam"
             "eraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpe"
             "cialDeviceTypes:]";
      LODWORD(v106) = 12;
      v102 = &v140;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v132 = v50;
  FirstAvailableDeviceFromHistory = getFirstAvailableDeviceFromHistory((void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 1, v102, v106), v113, v108, 1);
  if (!FirstAvailableDeviceFromHistory)
  {
LABEL_186:
    os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
    if (sUserPreferredCameraOverrideHistory)
      v55 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
    else
      v55 = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    if (objc_msgSend(v55, "count"))
    {
      v94 = getFirstAvailableDeviceFromHistory(v55, v113, 0, 1);
      if (v94)
      {
        v18 = v94;
        if (!dword_1ECFED6C0)
          return v18;
        LODWORD(v128) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        v95 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v96 = v128;
        if (os_log_type_enabled(v95, type[0]))
          v97 = v96;
        else
          v97 = v96 & 0xFFFFFFFE;
        if (!v97)
          goto LABEL_202;
        v98 = objc_msgSend(v18, "isSuspended");
        v140 = 136315650;
        v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:c"
               "ameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invali"
               "dSpecialDeviceTypes:]";
        if (v98)
          v70 = 84;
        else
          v70 = 70;
        goto LABEL_199;
      }
    }
    if (v49)
      goto LABEL_86;
    goto LABEL_82;
  }
  v18 = FirstAvailableDeviceFromHistory;
  if (dword_1ECFED6C0)
  {
    LODWORD(v128) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v91 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v92 = v128;
    if (os_log_type_enabled(v91, type[0]))
      v93 = v92;
    else
      v93 = v92 & 0xFFFFFFFE;
    if (v93)
    {
LABEL_160:
      v140 = 136315394;
      v141 = "+[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cam"
             "eraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpe"
             "cialDeviceTypes:]";
      v142 = 2112;
      *(_QWORD *)v143 = v18;
      _os_log_send_and_compose_impl();
    }
LABEL_202:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v18;
}

- (unsigned)specialDeviceType
{
  return self->_specialDeviceType;
}

- (BOOL)isSuspended
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AVCaptureFigVideoDevice_isSuspended__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)_insurePreferredCameraGlobal:(id *)a3 globalName:(id)a4 preferredCamera:(id)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[7];
  os_log_type_t type;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    if (dword_1ECFED6C0)
    {
      v14 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v9 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue](AVCaptureFigVideoDevice, "_cameraHistoryDispatchQueue", v10, v11);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__AVCaptureFigVideoDevice__insurePreferredCameraGlobal_globalName_preferredCamera___block_invoke;
    block[3] = &unk_1E4217978;
    block[5] = a4;
    block[6] = a3;
    block[4] = a5;
    dispatch_async(v9, block);
  }
}

+ (id)_cameraHistoryDispatchQueue
{
  if (_cameraHistoryDispatchQueue_onceToken != -1)
    dispatch_once(&_cameraHistoryDispatchQueue_onceToken, &__block_literal_global_16_0);
  return (id)sPreferredCameraPropertyRefreshQueue;
}

void __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_13(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

- (OpaqueCMClock)deviceClock
{
  OpaqueCMClock *result;

  result = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04C40]);
  if (result)
    return (OpaqueCMClock *)CFAutorelease(result);
  return result;
}

- (BOOL)automaticallyAdjustsVideoHDREnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__AVCaptureFigVideoDevice_automaticallyAdjustsVideoHDREnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setVideoHDREnabled:(BOOL)a3 forceResetVideoHDRSuspended:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *devicePropsQueue;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a4;
  -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoHDREnabled"));
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__AVCaptureFigVideoDevice__setVideoHDREnabled_forceResetVideoHDRSuspended___block_invoke;
  block[3] = &unk_1E4217BF0;
  block[4] = self;
  block[5] = &v10;
  v9 = a3;
  dispatch_sync(devicePropsQueue, block);
  if (*((_BYTE *)v11 + 24) || v4)
    -[AVCaptureFigVideoDevice _resetVideoHDRSuspended](self, "_resetVideoHDRSuspended");
  -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoHDREnabled"));
  _Block_object_dispose(&v10, 8);
}

- (BOOL)isVideoZoomSmoothingSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04930]), "BOOLValue");
}

- (BOOL)isCameraIntrinsicMatrixDeliverySupported
{
  int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04820]), "BOOLValue");
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04858]), "BOOLValue");
  return v3;
}

- (BOOL)isVideoStabilizationSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04918]), "BOOLValue");
}

- (void)setSpatialOverCaptureEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  BOOL v10;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (!v3
      || (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isSpatialOverCaptureSupported") & 1) != 0)
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__AVCaptureFigVideoDevice_setSpatialOverCaptureEnabled___block_invoke;
      block[3] = &unk_1E4217A10;
      block[4] = self;
      v10 = v3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

__n128 __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __n128 result;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  float v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  float v36;
  void *v37;
  __int128 v38;
  uint64_t v39;
  CMTime *v40;
  void *v41;
  void *v42;
  CMTime *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  AVCaptureSystemPressureState *v48;
  uint64_t v49;
  uint64_t v50;
  CMTime *v51;
  void *v52;
  CMTime *v53;
  void *v54;
  void *v55;
  __n128 *v56;
  void *v57;
  __n128 *v58;
  uint64_t v59;
  CMTime *v60;
  void *v61;
  void *v62;
  __n128 *v63;
  CMTime *v64;
  void *v65;
  void *v66;
  void *v67;
  __n128 *v68;
  uint64_t v69;
  CMTime *v70;
  void *v71;
  CMTime *v72;
  void *v73;
  void *v74;
  __n128 *v75;
  void *v76;
  __n128 *v77;
  uint64_t v78;
  CMTime *v79;
  void *v80;
  CMTime *v81;
  void *v82;
  void *v83;
  __n128 *v84;
  void *v85;
  __n128 *v86;
  uint64_t v87;
  CMTime *v88;
  void *v89;
  CMTime *v90;
  void *v91;
  void *v92;
  __n128 *v93;
  void *v94;
  __n128 *v95;
  uint64_t v96;
  CMTime *v97;
  void *v98;
  CMTime *v99;
  void *v100;
  void *v101;
  __n128 *v102;
  void *v103;
  __n128 *v104;
  uint64_t v105;
  CMTime *v106;
  void *v107;
  CMTime *v108;
  void *v109;
  void *v110;
  __n128 *v111;
  void *v112;
  __n128 *v113;
  uint64_t v114;
  CMTime *v115;
  void *v116;
  CMTime *v117;
  void *v118;
  void *v119;
  __n128 *v120;
  void *v121;
  __n128 *v122;
  __int128 v123;
  _QWORD v124[3];
  CMTime v125;
  _QWORD v126[3];
  CMTime v127;
  _QWORD v128[3];
  CMTime v129;
  _QWORD v130[3];
  CMTime v131;
  _QWORD v132[3];
  CMTime v133;
  _QWORD v134[3];
  CMTime v135;
  _QWORD v136[3];
  CMTime v137;
  _QWORD v138[3];
  CMTime v139;
  _QWORD v140[3];
  CMTime v141;
  _QWORD v142[3];
  CMTime v143;
  _QWORD v144[3];
  CMTime v145;
  _QWORD v146[3];
  CMTime v147;
  _QWORD v148[3];
  CMTime v149;
  _QWORD v150[3];
  CMTime v151;
  _QWORD v152[3];
  CMTime v153;
  _QWORD v154[3];
  CMTime v155;
  __int128 v156;
  uint64_t v157;
  CMTime v158;
  __int128 v159;
  uint64_t v160;
  CMTime v161;
  __int128 v162;
  uint64_t v163;
  CMTime v164;
  __int128 v165;
  uint64_t v166;
  CMTime v167;
  __int128 v168;
  uint64_t v169;
  CMTime v170;
  CMTime time2;
  CMTime time1;
  CMTime v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _BYTE v178[128];
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 160);
  *(_QWORD *)(v2 + 160) = 0;
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("AVCaptureSessionPresetInputPriority")) & 1) == 0)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = *(id *)(a1 + 40);

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144)) & 1) != 0)return result;
  v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 194) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isContinuousZoomWithDepthEnabled");
  v174 = 0u;
  v175 = 0u;
  v176 = 0u;
  v177 = 0u;
  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "supportedDepthDataFormats");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v174, v178, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v175;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v175 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v10);
      if ((objc_msgSend(v11, "isDefaultActiveFormat") & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v174, v178, 16);
        if (v8)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v11 = 0;
  }
  if (v11 != *(void **)(*(_QWORD *)(a1 + 32) + 152) && (objc_msgSend(v11, "isEqual:") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v11;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 936) = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isCenterStageActiveForEnabled:", +[AVCaptureDevice isCenterStageEnabled](AVCaptureDevice, "isCenterStageEnabled"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72)
                                                                                              + 8)
                                                                                  + 24) != *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1212);
  objc_msgSend(*(id *)(a1 + 32), "_computeMinVideoZoomFactorOut:maxVideoZoomFactorOut:defaultVideoZoomFactorOut:centerStageActiveOverride:resetZoomFactor:", *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(unsigned __int8 *)(a1 + 304));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isBackgroundBlurActiveForEnabled:", +[AVCaptureDevice isBackgroundBlurEnabled](AVCaptureDevice, "isBackgroundBlurEnabled"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 112)
                                                                                               + 8)
                                                                                   + 24) != *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1250);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isStudioLightingActiveForEnabled:", +[AVCaptureDevice isStudioLightEnabled](AVCaptureDevice, "isStudioLightEnabled"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 128)
                                                                                               + 8)
                                                                                   + 24) != *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1253);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_reactionEffectsActiveForEnabled:", +[AVCaptureDevice reactionEffectsEnabled](AVCaptureDevice, "reactionEffectsEnabled"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 144)
                                                                                               + 8)
                                                                                   + 24) != *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1256);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isBackgroundReplacementActiveForEnabled:", +[AVCaptureDevice isBackgroundReplacementEnabled](AVCaptureDevice, "isBackgroundReplacementEnabled"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 160)
                                                                                               + 8)
                                                                                   + 24) != *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1259);
  if (*(_BYTE *)(a1 + 304))
  {
    memset(&v173, 0, sizeof(v173));
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v12)
      objc_msgSend(v12, "defaultActiveMinFrameDurationForSessionPreset:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
    v13 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 232);
    time1.epoch = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248);
    *(_OWORD *)&time1.value = v13;
    time2 = v173;
    if (CMTimeCompare(&time1, &time2))
      *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 32) = v173;
    v14 = *(_QWORD *)(a1 + 32) + 256;
    v15 = MEMORY[0x1E0CA2E18];
    v123 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)v14 = *MEMORY[0x1E0CA2E18];
    v16 = *(_QWORD *)(v15 + 16);
    *(_QWORD *)(v14 + 16) = v16;
    memset(&time1, 0, sizeof(time1));
    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v17)
      objc_msgSend(v17, "defaultActiveMaxFrameDurationForSessionPreset:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
    v18 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 280);
    time2.epoch = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296);
    *(_OWORD *)&time2.value = v18;
    v170 = time1;
    if (CMTimeCompare(&time2, &v170))
      *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 32) = time1;
    v19 = *(_QWORD *)(a1 + 32) + 304;
    *(_OWORD *)v19 = v123;
    *(_QWORD *)(v19 + 16) = v16;
    v20 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 24) = v20;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144) != 0;
    v21 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "videoSupportedFrameRateRanges"), "lastObject");
    if (v21)
    {
      objc_msgSend(v21, "minFrameDuration");
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 208) + 8);
      *(_OWORD *)(v22 + 32) = v168;
      *(_QWORD *)(v22 + 48) = v169;
    }
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8);
    *(_OWORD *)(v23 + 32) = v123;
    *(_QWORD *)(v23 + 48) = v16;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8)
                                                                           + 44) & 1;
  }
  else
  {
    v24 = *(_QWORD *)(a1 + 32) + 232;
    v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v25)
      objc_msgSend(v25, "lowestSupportedVideoFrameDuration");
    else
      memset(&v167, 0, sizeof(v167));
    v26 = *(_OWORD *)v24;
    v173.epoch = *(_QWORD *)(v24 + 16);
    *(_OWORD *)&v173.value = v26;
    if (CMTimeCompare(&v173, &v167) < 0)
    {
      v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v27)
      {
        objc_msgSend(v27, "lowestSupportedVideoFrameDuration");
      }
      else
      {
        v165 = 0uLL;
        v166 = 0;
      }
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 176) + 8);
      *(_OWORD *)(v28 + 32) = v165;
      *(_QWORD *)(v28 + 48) = v166;
    }
    v29 = *(_QWORD *)(a1 + 32) + 280;
    v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v30)
      objc_msgSend(v30, "highestSupportedVideoFrameDuration");
    else
      memset(&v164, 0, sizeof(v164));
    v31 = *(_OWORD *)v29;
    v173.epoch = *(_QWORD *)(v29 + 16);
    *(_OWORD *)&v173.value = v31;
    if (CMTimeCompare(&v173, &v164) >= 1)
    {
      v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v32)
      {
        objc_msgSend(v32, "highestSupportedVideoFrameDuration");
      }
      else
      {
        v162 = 0uLL;
        v163 = 0;
      }
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 184) + 8);
      *(_OWORD *)(v33 + 32) = v162;
      *(_QWORD *)(v33 + 48) = v163;
    }
    v34 = *(float *)(*(_QWORD *)(a1 + 32) + 864);
    v35 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    if (v35 < v34 || (v35 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), v35 > v34))
    {
      v36 = v35;
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 24) = v36;
    }
    v37 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "videoSupportedFrameRateRanges"), "lastObject");
    if (v37)
    {
      memset(&v173, 0, sizeof(v173));
      objc_msgSend(v37, "minFrameDuration");
      v38 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 168);
      time1.epoch = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
      *(_OWORD *)&time1.value = v38;
      time2 = v173;
      if (CMTimeCompare(&time1, &time2) < 0)
        *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 32) = v173;
    }
    v39 = *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8);
    if ((*(_BYTE *)(v39 + 44) & 1) != 0)
    {
      v40 = (CMTime *)(v39 + 32);
      v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v41)
        objc_msgSend(v41, "maxExposureDuration");
      else
        memset(&v161, 0, sizeof(v161));
      v173 = *v40;
      if (CMTimeCompare(&v173, &v161) < 1)
      {
        v43 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 32);
        v44 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (v44)
          objc_msgSend(v44, "minExposureDuration");
        else
          memset(&v158, 0, sizeof(v158));
        v173 = *v43;
        if ((CMTimeCompare(&v173, &v158) & 0x80000000) == 0)
          goto LABEL_65;
        v67 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (v67)
        {
          objc_msgSend(v67, "minExposureDuration");
        }
        else
        {
          v156 = 0uLL;
          v157 = 0;
        }
        v45 = *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8);
        *(_OWORD *)(v45 + 32) = v156;
        v46 = v157;
      }
      else
      {
        v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (v42)
        {
          objc_msgSend(v42, "maxExposureDuration");
        }
        else
        {
          v159 = 0uLL;
          v160 = 0;
        }
        v45 = *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8);
        *(_OWORD *)(v45 + 32) = v159;
        v46 = v160;
      }
      *(_QWORD *)(v45 + 48) = v46;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 24) = 1;
    }
  }
LABEL_65:
  v47 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "supportedColorSpaces", v123);
  if ((objc_msgSend(v47, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 856))) & 1) == 0)*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 24) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "supportedColorSpaces"), "firstObject"), "integerValue");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1136) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "figLevel");
  v48 = -[AVCaptureSystemPressureState initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:]([AVCaptureSystemPressureState alloc], "initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1136), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "factors"), objc_msgSend(*(id *)(a1 + 32), "_recommendedFrameRateRangeForVideoFormat:depthFormat:figSystemPressureLevel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), v11, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1136)));
  if (!-[AVCaptureSystemPressureState isEqual:](v48, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128)))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 8) + 40) = v48;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 752) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 256) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1169);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 264) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1140);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 272) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1170);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 280) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 40), "isVideoStabilizationStrengthSupported:", 1);
  v49 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 280) + 8) + 24) != *(_QWORD *)(v49 + 1176))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 24) = 1;
    v49 = *(_QWORD *)(a1 + 32);
  }
  if ((objc_msgSend(*(id *)(v49 + 144), "isSpatialOverCaptureSupported") & 1) == 0
    && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1141))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 24) = 1;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    goto LABEL_109;
  v50 = *(_QWORD *)(*(_QWORD *)(a1 + 176) + 8);
  if ((*(_BYTE *)(v50 + 44) & 1) != 0)
  {
    v51 = (CMTime *)(v50 + 32);
    v52 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
    if (v52)
      objc_msgSend(v52, "minFrameDuration");
    else
      memset(&v155, 0, sizeof(v155));
    v173 = *v51;
    if (CMTimeCompare(&v173, &v155) < 0)
    {
      v55 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
      if (v55)
      {
        v56 = (__n128 *)v154;
        objc_msgSend(v55, "minFrameDuration");
      }
      else
      {
        memset(v154, 0, sizeof(v154));
        v56 = (__n128 *)v154;
      }
    }
    else
    {
      v53 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 32);
      v54 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
      if (v54)
        objc_msgSend(v54, "maxFrameDuration");
      else
        memset(&v153, 0, sizeof(v153));
      v173 = *v53;
      if (CMTimeCompare(&v173, &v153) < 1)
        goto LABEL_91;
      v57 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
      if (v57)
      {
        v56 = (__n128 *)v152;
        objc_msgSend(v57, "maxFrameDuration");
      }
      else
      {
        memset(v152, 0, sizeof(v152));
        v56 = (__n128 *)v152;
      }
    }
    v58 = *(__n128 **)(*(_QWORD *)(a1 + 176) + 8);
    result = *v56;
    v58[2] = *v56;
    v58[3].n128_u64[0] = v56[1].n128_u64[0];
  }
LABEL_91:
  v59 = *(_QWORD *)(*(_QWORD *)(a1 + 184) + 8);
  if ((*(_BYTE *)(v59 + 44) & 1) == 0)
    goto LABEL_109;
  v60 = (CMTime *)(v59 + 32);
  v61 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
  if (v61)
    objc_msgSend(v61, "maxFrameDuration");
  else
    memset(&v151, 0, sizeof(v151));
  v173 = *v60;
  if (CMTimeCompare(&v173, &v151) >= 1)
  {
    v62 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
    if (v62)
    {
      v63 = (__n128 *)v150;
      objc_msgSend(v62, "maxFrameDuration");
    }
    else
    {
      memset(v150, 0, sizeof(v150));
      v63 = (__n128 *)v150;
    }
LABEL_108:
    v68 = *(__n128 **)(*(_QWORD *)(a1 + 184) + 8);
    result = *v63;
    v68[2] = *v63;
    v68[3].n128_u64[0] = v63[1].n128_u64[0];
    goto LABEL_109;
  }
  v64 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 32);
  v65 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
  if (v65)
    objc_msgSend(v65, "minFrameDuration");
  else
    memset(&v149, 0, sizeof(v149));
  v173 = *v64;
  if (CMTimeCompare(&v173, &v149) < 0)
  {
    v66 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
    if (v66)
    {
      v63 = (__n128 *)v148;
      objc_msgSend(v66, "minFrameDuration");
    }
    else
    {
      memset(v148, 0, sizeof(v148));
      v63 = (__n128 *)v148;
    }
    goto LABEL_108;
  }
LABEL_109:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
    goto LABEL_142;
  v69 = *(_QWORD *)(*(_QWORD *)(a1 + 176) + 8);
  if ((*(_BYTE *)(v69 + 44) & 1) != 0)
  {
    v70 = (CMTime *)(v69 + 32);
    v71 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
    if (v71)
      objc_msgSend(v71, "minFrameDuration");
    else
      memset(&v147, 0, sizeof(v147));
    v173 = *v70;
    if (CMTimeCompare(&v173, &v147) < 0)
    {
      v74 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
      if (v74)
      {
        v75 = (__n128 *)v146;
        objc_msgSend(v74, "minFrameDuration");
      }
      else
      {
        memset(v146, 0, sizeof(v146));
        v75 = (__n128 *)v146;
      }
      goto LABEL_125;
    }
    v72 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 32);
    v73 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
    if (v73)
      objc_msgSend(v73, "maxFrameDuration");
    else
      memset(&v145, 0, sizeof(v145));
    v173 = *v72;
    if (CMTimeCompare(&v173, &v145) >= 1)
    {
      v76 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
      if (v76)
      {
        v75 = (__n128 *)v144;
        objc_msgSend(v76, "maxFrameDuration");
      }
      else
      {
        memset(v144, 0, sizeof(v144));
        v75 = (__n128 *)v144;
      }
LABEL_125:
      v77 = *(__n128 **)(*(_QWORD *)(a1 + 176) + 8);
      result = *v75;
      v77[2] = *v75;
      v77[3].n128_u64[0] = v75[1].n128_u64[0];
    }
  }
  v78 = *(_QWORD *)(*(_QWORD *)(a1 + 184) + 8);
  if ((*(_BYTE *)(v78 + 44) & 1) == 0)
    goto LABEL_142;
  v79 = (CMTime *)(v78 + 32);
  v80 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
  if (v80)
    objc_msgSend(v80, "minFrameDuration");
  else
    memset(&v143, 0, sizeof(v143));
  v173 = *v79;
  if (CMTimeCompare(&v173, &v143) < 0)
  {
    v83 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
    if (v83)
    {
      v84 = (__n128 *)v142;
      objc_msgSend(v83, "minFrameDuration");
    }
    else
    {
      memset(v142, 0, sizeof(v142));
      v84 = (__n128 *)v142;
    }
    goto LABEL_141;
  }
  v81 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 32);
  v82 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
  if (v82)
    objc_msgSend(v82, "maxFrameDuration");
  else
    memset(&v141, 0, sizeof(v141));
  v173 = *v81;
  if (CMTimeCompare(&v173, &v141) >= 1)
  {
    v85 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
    if (v85)
    {
      v84 = (__n128 *)v140;
      objc_msgSend(v85, "maxFrameDuration");
    }
    else
    {
      memset(v140, 0, sizeof(v140));
      v84 = (__n128 *)v140;
    }
LABEL_141:
    v86 = *(__n128 **)(*(_QWORD *)(a1 + 184) + 8);
    result = *v84;
    v86[2] = *v84;
    v86[3].n128_u64[0] = v84[1].n128_u64[0];
  }
LABEL_142:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24))
    goto LABEL_175;
  v87 = *(_QWORD *)(*(_QWORD *)(a1 + 176) + 8);
  if ((*(_BYTE *)(v87 + 44) & 1) != 0)
  {
    v88 = (CMTime *)(v87 + 32);
    v89 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
    if (v89)
      objc_msgSend(v89, "minFrameDuration");
    else
      memset(&v139, 0, sizeof(v139));
    v173 = *v88;
    if (CMTimeCompare(&v173, &v139) < 0)
    {
      v92 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
      if (v92)
      {
        v93 = (__n128 *)v138;
        objc_msgSend(v92, "minFrameDuration");
      }
      else
      {
        memset(v138, 0, sizeof(v138));
        v93 = (__n128 *)v138;
      }
      goto LABEL_158;
    }
    v90 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 32);
    v91 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
    if (v91)
      objc_msgSend(v91, "maxFrameDuration");
    else
      memset(&v137, 0, sizeof(v137));
    v173 = *v90;
    if (CMTimeCompare(&v173, &v137) >= 1)
    {
      v94 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
      if (v94)
      {
        v93 = (__n128 *)v136;
        objc_msgSend(v94, "maxFrameDuration");
      }
      else
      {
        memset(v136, 0, sizeof(v136));
        v93 = (__n128 *)v136;
      }
LABEL_158:
      v95 = *(__n128 **)(*(_QWORD *)(a1 + 176) + 8);
      result = *v93;
      v95[2] = *v93;
      v95[3].n128_u64[0] = v93[1].n128_u64[0];
    }
  }
  v96 = *(_QWORD *)(*(_QWORD *)(a1 + 184) + 8);
  if ((*(_BYTE *)(v96 + 44) & 1) == 0)
    goto LABEL_175;
  v97 = (CMTime *)(v96 + 32);
  v98 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
  if (v98)
    objc_msgSend(v98, "minFrameDuration");
  else
    memset(&v135, 0, sizeof(v135));
  v173 = *v97;
  if (CMTimeCompare(&v173, &v135) < 0)
  {
    v101 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
    if (v101)
    {
      v102 = (__n128 *)v134;
      objc_msgSend(v101, "minFrameDuration");
    }
    else
    {
      memset(v134, 0, sizeof(v134));
      v102 = (__n128 *)v134;
    }
    goto LABEL_174;
  }
  v99 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 32);
  v100 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
  if (v100)
    objc_msgSend(v100, "maxFrameDuration");
  else
    memset(&v133, 0, sizeof(v133));
  v173 = *v99;
  if (CMTimeCompare(&v173, &v133) >= 1)
  {
    v103 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
    if (v103)
    {
      v102 = (__n128 *)v132;
      objc_msgSend(v103, "maxFrameDuration");
    }
    else
    {
      memset(v132, 0, sizeof(v132));
      v102 = (__n128 *)v132;
    }
LABEL_174:
    v104 = *(__n128 **)(*(_QWORD *)(a1 + 184) + 8);
    result = *v102;
    v104[2] = *v102;
    v104[3].n128_u64[0] = v102[1].n128_u64[0];
  }
LABEL_175:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24))
    return result;
  v105 = *(_QWORD *)(*(_QWORD *)(a1 + 176) + 8);
  if ((*(_BYTE *)(v105 + 44) & 1) == 0)
    goto LABEL_192;
  v106 = (CMTime *)(v105 + 32);
  v107 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
  if (v107)
    objc_msgSend(v107, "minFrameDuration");
  else
    memset(&v131, 0, sizeof(v131));
  v173 = *v106;
  if (CMTimeCompare(&v173, &v131) < 0)
  {
    v110 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
    if (v110)
    {
      v111 = (__n128 *)v130;
      objc_msgSend(v110, "minFrameDuration");
    }
    else
    {
      memset(v130, 0, sizeof(v130));
      v111 = (__n128 *)v130;
    }
  }
  else
  {
    v108 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 32);
    v109 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
    if (v109)
      objc_msgSend(v109, "maxFrameDuration");
    else
      memset(&v129, 0, sizeof(v129));
    v173 = *v108;
    if (CMTimeCompare(&v173, &v129) < 1)
      goto LABEL_192;
    v112 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
    if (v112)
    {
      v111 = (__n128 *)v128;
      objc_msgSend(v112, "maxFrameDuration");
    }
    else
    {
      memset(v128, 0, sizeof(v128));
      v111 = (__n128 *)v128;
    }
  }
  v113 = *(__n128 **)(*(_QWORD *)(a1 + 176) + 8);
  result = *v111;
  v113[2] = *v111;
  v113[3].n128_u64[0] = v111[1].n128_u64[0];
LABEL_192:
  v114 = *(_QWORD *)(*(_QWORD *)(a1 + 184) + 8);
  if ((*(_BYTE *)(v114 + 44) & 1) == 0)
    return result;
  v115 = (CMTime *)(v114 + 32);
  v116 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
  if (v116)
    objc_msgSend(v116, "minFrameDuration");
  else
    memset(&v127, 0, sizeof(v127));
  v173 = *v115;
  if (CMTimeCompare(&v173, &v127) < 0)
  {
    v119 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
    if (v119)
    {
      v120 = (__n128 *)v126;
      objc_msgSend(v119, "minFrameDuration");
    }
    else
    {
      memset(v126, 0, sizeof(v126));
      v120 = (__n128 *)v126;
    }
    goto LABEL_207;
  }
  v117 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 32);
  v118 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
  if (v118)
    objc_msgSend(v118, "maxFrameDuration");
  else
    memset(&v125, 0, sizeof(v125));
  v173 = *v117;
  if (CMTimeCompare(&v173, &v125) >= 1)
  {
    v121 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
    if (v121)
    {
      v120 = (__n128 *)v124;
      objc_msgSend(v121, "maxFrameDuration");
    }
    else
    {
      memset(v124, 0, sizeof(v124));
      v120 = (__n128 *)v124;
    }
LABEL_207:
    v122 = *(__n128 **)(*(_QWORD *)(a1 + 184) + 8);
    result = *v120;
    v122[2] = *v120;
    v122[3].n128_u64[0] = v120[1].n128_u64[0];
  }
  return result;
}

uint64_t __66__AVCaptureFigVideoDevice__updateReactionEffectsActiveForEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1256);
  result = objc_msgSend(*(id *)(a1 + 32), "_reactionEffectsActiveForEnabled:", *(unsigned __int8 *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_reactionEffectsActiveForEnabled:(BOOL)a3
{
  return a3
      && -[AVCaptureDeviceFormat reactionEffectsSupported](self->_activeFormat, "reactionEffectsSupported")
      && +[AVCaptureDevice isEligibleForReactionEffects](AVCaptureDevice, "isEligibleForReactionEffects");
}

uint64_t __65__AVCaptureFigVideoDevice__updateStudioLightingActiveForEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1253);
  result = objc_msgSend(*(id *)(a1 + 32), "_isStudioLightingActiveForEnabled:", *(unsigned __int8 *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_isStudioLightingActiveForEnabled:(BOOL)a3
{
  return a3
      && -[AVCaptureDeviceFormat isStudioLightSupported](self->_activeFormat, "isStudioLightSupported")
      && +[AVCaptureDevice isEligibleForStudioLighting](AVCaptureDevice, "isEligibleForStudioLighting");
}

uint64_t __65__AVCaptureFigVideoDevice__updateBackgroundBlurActiveForEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1250);
  result = objc_msgSend(*(id *)(a1 + 32), "_isBackgroundBlurActiveForEnabled:", *(unsigned __int8 *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_isBackgroundBlurActiveForEnabled:(BOOL)a3
{
  return a3
      && -[AVCaptureDeviceFormat isBackgroundBlurSupported](self->_activeFormat, "isBackgroundBlurSupported")
      && +[AVCaptureDevice isEligibleForBackgroundBlur](AVCaptureDevice, "isEligibleForBackgroundBlur");
}

- (BOOL)_isCenterStageActiveForEnabled:(BOOL)a3
{
  _BOOL4 v4;
  int height_low;

  if (a3)
  {
    v4 = -[AVCaptureDeviceFormat isCenterStageSupported](self->_activeFormat, "isCenterStageSupported");
    if (v4)
    {
      if (LOBYTE(self->_stereoVideoCaptureStatus))
      {
        LOBYTE(v4) = 0;
      }
      else
      {
        height_low = LOBYTE(self->_normalizedNonDestructiveCropSize.height);
        LOBYTE(v4) = height_low == -[AVCaptureFigVideoDevice isGeometricDistortionCorrectionSupported](self, "isGeometricDistortionCorrectionSupported");
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)canPerformReactionEffects
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AVCaptureFigVideoDevice_canPerformReactionEffects__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__AVCaptureFigVideoDevice__setShallowDepthOfFieldEffectStatus___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 944) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __59__AVCaptureFigVideoDevice__setMinAvailableVideoZoomFactor___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(double *)(result + 48) != *(double *)(*(_QWORD *)(result + 32) + 880);
  return result;
}

uint64_t __59__AVCaptureFigVideoDevice__setMaxAvailableVideoZoomFactor___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(double *)(result + 48) != *(double *)(*(_QWORD *)(result + 32) + 888);
  return result;
}

uint64_t __40__AVCaptureFigVideoDevice_setTorchMode___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 776) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __53__AVCaptureFigVideoDevice__setAdjustingWhiteBalance___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 576) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __46__AVCaptureFigVideoDevice_isVideoHDRSuspended__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 846);
  return result;
}

uint64_t __62__AVCaptureFigVideoDevice_setActiveDepthDataMinFrameDuration___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "videoSupportedFrameRateRanges"), "lastObject");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __60__AVCaptureFigVideoDevice_preferredPrimaryConstituentDevice__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 1016);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __57__AVCaptureFigVideoDevice_activePrimaryConstituentDevice__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 960);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

float __46__AVCaptureFigVideoDevice_setVideoZoomFactor___block_invoke_2(uint64_t a1)
{
  float result;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 868) = 0;
  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *(float *)(*(_QWORD *)(a1 + 32) + 864) = result;
  return result;
}

- (void)setVideoMinFrameDurationOverride:(id *)a3 forOwner:(id)a4
{
  NSObject *devicePropsQueue;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  _QWORD block[7];
  __int128 v10;
  int64_t var3;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3810000000;
  v15 = &unk_19EF10DB5;
  v16 = *MEMORY[0x1E0CA2E18];
  devicePropsQueue = self->_devicePropsQueue;
  v17 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AVCaptureFigVideoDevice_setVideoMinFrameDurationOverride_forOwner___block_invoke;
  block[3] = &unk_1E4217B00;
  v6 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v10 = v6;
  block[4] = self;
  block[5] = a4;
  block[6] = &v12;
  dispatch_sync(devicePropsQueue, block);
  if ((*((_BYTE *)v13 + 44) & 1) != 0)
  {
    v7 = *((_OWORD *)v13 + 2);
    v8 = v13[6];
    -[AVCaptureFigVideoDevice _setActiveVideoMinFrameDurationInternal:](self, "_setActiveVideoMinFrameDurationInternal:", &v7);
  }
  _Block_object_dispose(&v12, 8);
}

- (int64_t)exposureMode
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVCaptureFigVideoDevice_exposureMode__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__AVCaptureFigVideoDevice_isStillImageStabilizationScene__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 848);
  return result;
}

- (BOOL)isGeometricDistortionCorrectionEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AVCaptureFigVideoDevice_isGeometricDistortionCorrectionEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isDepthDataDeliveryEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureFigVideoDevice__isDepthDataDeliveryEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)AVCaptureFigVideoDeviceCenterStageEnabledChangedContext == a6)
    -[AVCaptureFigVideoDevice _updateCenterStageActiveForEnabled:updateDependentProperties:](self, "_updateCenterStageActiveForEnabled:updateDependentProperties:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8], a4), "BOOLValue"), 1);
  if ((void *)AVCaptureFigVideoDeviceCenterStageFramingModeChangedContext == a6)
    -[AVCaptureFigVideoDevice _setCenterStageFramingMode:](self, "_setCenterStageFramingMode:", (int)objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "intValue"));
  if ((void *)AVCaptureFigVideoDeviceBackgroundBlurEnabledChangedContext == a6)
    -[AVCaptureFigVideoDevice _updateBackgroundBlurActiveForEnabled:](self, "_updateBackgroundBlurActiveForEnabled:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue"));
  if ((void *)AVCaptureFigVideoDeviceStudioLightingEnabledChangedContext == a6)
    -[AVCaptureFigVideoDevice _updateStudioLightingActiveForEnabled:](self, "_updateStudioLightingActiveForEnabled:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue"));
  if ((void *)AVCaptureFigVideoDeviceReactionEffectsEnabledChangedContext == a6)
    -[AVCaptureFigVideoDevice _updateReactionEffectsActiveForEnabled:](self, "_updateReactionEffectsActiveForEnabled:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue"));
  if ((void *)AVCaptureFigVideoDeviceBackgroundReplacementEnabledChangedContext == a6)
    -[AVCaptureFigVideoDevice _updateBackgroundReplacementActiveForEnabled:](self, "_updateBackgroundReplacementActiveForEnabled:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue"));
  if ((void *)AVCaptureFigVideoDevicePortraitEffectStudioLightQualityChangedContext == a6)
    -[AVCaptureFigVideoDevice _updatePortraitEffectStudioLightQuality:](self, "_updatePortraitEffectStudioLightQuality:", (int)objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "intValue"));
  if ((void *)AVCaptureFigVideoDeviceBackgroundBlurApertureChangedContext == a6)
  {
    objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "floatValue");
    -[AVCaptureFigVideoDevice _updateBackgroundBlurAperture:](self, "_updateBackgroundBlurAperture:");
  }
  if ((void *)AVCaptureFigVideoDeviceStudioLightingIntensityChangedContext == a6)
  {
    objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "floatValue");
    -[AVCaptureFigVideoDevice _updateStudioLightingIntensity:](self, "_updateStudioLightingIntensity:");
  }
  if ((void *)AVCaptureFigVideoDeviceGesturesEnabledChangedContext == a6)
    -[AVCaptureFigVideoDevice _updateGesturesEnabled:](self, "_updateGesturesEnabled:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue"));
  if ((void *)AVCaptureFigVideoDeviceBackgroundReplacementPixelBufferChangedContext == a6)
    -[AVCaptureFigVideoDevice _updateBackgroundReplacementPixelBuffer:](self, "_updateBackgroundReplacementPixelBuffer:", +[AVCaptureDevice backgroundReplacementPixelBuffer](AVCaptureDevice, "backgroundReplacementPixelBuffer"));
}

- (void)_updateStudioLightingIntensity:(float)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  float v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__AVCaptureFigVideoDevice__updateStudioLightingIntensity___block_invoke;
  v4[3] = &unk_1E4217D58;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_updateStudioLightingActiveForEnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  _QWORD block[7];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AVCaptureFigVideoDevice__updateStudioLightingActiveForEnabled___block_invoke;
  block[3] = &unk_1E4217AB0;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v10;
  v9 = a3;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned __int8 *)v15 + 24) != *((unsigned __int8 *)v11 + 24))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("studioLightingActive"));
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("studioLightActive"));
    v6 = self->_devicePropsQueue;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __65__AVCaptureFigVideoDevice__updateStudioLightingActiveForEnabled___block_invoke_2;
    v7[3] = &unk_1E42178B8;
    v7[4] = self;
    v7[5] = &v10;
    dispatch_sync(v6, v7);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("studioLightActive"));
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("studioLightingActive"));
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

- (void)_updateReactionEffectsActiveForEnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  _QWORD block[7];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AVCaptureFigVideoDevice__updateReactionEffectsActiveForEnabled___block_invoke;
  block[3] = &unk_1E4217AB0;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v10;
  v9 = a3;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned __int8 *)v15 + 24) != *((unsigned __int8 *)v11 + 24))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("canPerformReactionEffects"));
    v6 = self->_devicePropsQueue;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __66__AVCaptureFigVideoDevice__updateReactionEffectsActiveForEnabled___block_invoke_2;
    v7[3] = &unk_1E42178B8;
    v7[4] = self;
    v7[5] = &v10;
    dispatch_sync(v6, v7);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("canPerformReactionEffects"));
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

- (void)_updatePortraitEffectStudioLightQuality:(int64_t)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[6];

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__AVCaptureFigVideoDevice__updatePortraitEffectStudioLightQuality___block_invoke;
  v4[3] = &unk_1E4216650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_updateBackgroundBlurAperture:(float)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  float v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__AVCaptureFigVideoDevice__updateBackgroundBlurAperture___block_invoke;
  v4[3] = &unk_1E4217D58;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_updateBackgroundBlurActiveForEnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  _QWORD block[7];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AVCaptureFigVideoDevice__updateBackgroundBlurActiveForEnabled___block_invoke;
  block[3] = &unk_1E4217AB0;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v10;
  v9 = a3;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned __int8 *)v15 + 24) != *((unsigned __int8 *)v11 + 24))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("backgroundBlurActive"));
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("portraitEffectActive"));
    v6 = self->_devicePropsQueue;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __65__AVCaptureFigVideoDevice__updateBackgroundBlurActiveForEnabled___block_invoke_2;
    v7[3] = &unk_1E42178B8;
    v7[4] = self;
    v7[5] = &v10;
    dispatch_sync(v6, v7);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("portraitEffectActive"));
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("backgroundBlurActive"));
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

- (void)_handleNotification:(__CFString *)a3 payload:(id)a4
{
  id v7;
  const void *v8;
  NSObject *devicePropsQueue;
  CGRect *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  const __CFDictionary *v21;
  NSObject *v22;
  const __CFDictionary *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  CGRect *v27;
  int v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  char v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  AVCaptureFigVideoDevice *v55;
  const __CFString *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  int v68;
  NSObject *v69;
  CGSize v70;
  int v71;
  NSObject *v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  float v84;
  int v85;
  NSArray *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  void *v90;
  NSObject *v91;
  int v92;
  NSArray *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  NSArray *v97;
  NSObject *v98;
  char v99;
  NSObject *v100;
  uint64_t v101;
  NSObject *v102;
  uint64_t v103;
  unsigned int v104;
  AVCaptureSystemPressureState *v105;
  NSObject *v106;
  uint64_t v107;
  NSObject *v108;
  char v109;
  NSObject *v110;
  uint64_t v111;
  NSObject *v112;
  char v113;
  char v114;
  NSObject *v115;
  uint64_t v116;
  NSObject *v117;
  int v118;
  char v119;
  NSObject *v120;
  uint64_t v121;
  NSObject *v122;
  CGSize v123;
  NSObject *v124;
  uint64_t v125;
  NSObject *v126;
  float v127;
  double v128;
  double v129;
  NSObject *v130;
  _QWORD v131[6];
  _QWORD v132[5];
  CGRect v133;
  _QWORD v134[6];
  CGRect v135;
  _QWORD v136[5];
  char v137;
  _QWORD v138[6];
  char v139;
  _QWORD v140[5];
  char v141;
  _QWORD v142[6];
  char v143;
  _QWORD v144[6];
  _QWORD v145[8];
  char v146;
  _QWORD v147[6];
  _QWORD v148[7];
  _QWORD v149[5];
  char v150;
  _QWORD v151[6];
  char v152;
  _QWORD v153[6];
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _QWORD v158[6];
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _QWORD v163[6];
  _QWORD v164[6];
  _QWORD v165[5];
  CGPoint v166;
  CGSize size;
  int v168;
  _QWORD v169[9];
  _QWORD v170[6];
  _QWORD v171[10];
  _QWORD v172[11];
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  char v176;
  __int128 v177;
  uint64_t v178;
  char v179;
  CMTime v180;
  char v181;
  _QWORD v182[6];
  _QWORD v183[5];
  char v184;
  _QWORD v185[6];
  char v186;
  _QWORD v187[6];
  int y_low;
  _QWORD v189[6];
  int v190;
  _QWORD v191[7];
  int v192;
  _QWORD v193[6];
  _QWORD v194[7];
  _QWORD v195[5];
  int v196;
  _QWORD v197[6];
  int v198;
  _QWORD v199[5];
  int v200;
  _QWORD v201[6];
  int v202;
  _QWORD v203[7];
  CMTime v204;
  uint64_t v205;
  uint64_t *v206;
  uint64_t v207;
  char v208;
  CGRect v209;
  __int128 v210;
  uint64_t v211;
  _QWORD v212[6];
  CMTime v213;
  uint64_t v214;
  uint64_t *v215;
  uint64_t v216;
  uint64_t v217;
  _QWORD v218[5];
  CGPoint origin;
  CGFloat width;
  _QWORD v221[5];
  int v222;
  _QWORD v223[6];
  int v224;
  _QWORD v225[5];
  _QWORD v226[6];
  _QWORD block[6];
  char v228;
  _BYTE v229[128];
  _BYTE v230[128];
  _QWORD v231[2];
  _QWORD v232[3];

  v232[2] = *MEMORY[0x1E0C80C00];
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04B08]))
  {
    v7 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04E48]);
    if (v7 != (id)*MEMORY[0x1E0C9AE40])
    {
      v8 = v7;
      dispatch_semaphore_signal(&self->_propertyToFigCaptureSourcePropertyMap->super.super);
      if (v8)
        CFRelease(v8);
    }
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04C48]))
  {
    if (!self->_proxyDevice
      || (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "BOOLValue") & 1) != 0)
    {
      return;
    }
    v209.origin.x = 0.0;
    *(_QWORD *)&v209.origin.y = &v209;
    *(_QWORD *)&v209.size.width = 0x2020000000;
    LOBYTE(v209.size.height) = 0;
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke;
    block[3] = &unk_1E4217BF0;
    block[5] = &v209;
    block[4] = self;
    v228 = 0;
    dispatch_sync(devicePropsQueue, block);
    if (*(_BYTE *)(*(_QWORD *)&v209.origin.y + 24))
    {
      -[AVCaptureFigVideoDevice _setConnected:](self, "_setConnected:", 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureDeviceWasDisconnectedNotification"), self);
    }
    goto LABEL_10;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04AB0]))
  {
    -[AVCaptureFigVideoDevice _handleCMIOExtensionPropertyChangeNotification:](self, "_handleCMIOExtensionPropertyChangeNotification:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]));
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04B38]))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureDeviceSubjectAreaDidChangeNotification"), self);
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04BA0]))
  {
    v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "BOOLValue");
    -[AVCaptureFigVideoDevice _setAdjustingFocus:](self, "_setAdjustingFocus:", v11);
    if ((v11 & 1) != 0)
      return;
    v209.origin.x = 0.0;
    *(_QWORD *)&v209.origin.y = &v209;
    *(_QWORD *)&v209.size.width = 0x2020000000;
    v209.size.height = 0.0;
    v12 = self->_devicePropsQueue;
    v13 = MEMORY[0x1E0C809B0];
    v226[0] = MEMORY[0x1E0C809B0];
    v226[1] = 3221225472;
    v226[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_2;
    v226[3] = &unk_1E4217A60;
    v226[5] = &v209;
    v226[4] = self;
    dispatch_sync(v12, v226);
    if (*(_QWORD *)(*(_QWORD *)&v209.origin.y + 24) == 1)
    {
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("focusMode"));
      v14 = self->_devicePropsQueue;
      v225[0] = v13;
      v225[1] = 3221225472;
      v225[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_3;
      v225[3] = &unk_1E42165A8;
      v225[4] = self;
      dispatch_sync(v14, v225);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("focusMode"));
    }
    goto LABEL_10;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04CC8]))
  {
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "floatValue");
    v16 = v15;
    v209.origin.x = 0.0;
    *(_QWORD *)&v209.origin.y = &v209;
    *(_QWORD *)&v209.size.width = 0x2020000000;
    LOBYTE(v209.size.height) = 0;
    v17 = self->_devicePropsQueue;
    v18 = MEMORY[0x1E0C809B0];
    v223[0] = MEMORY[0x1E0C809B0];
    v223[1] = 3221225472;
    v223[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_4;
    v223[3] = &unk_1E4218028;
    v224 = v15;
    v223[5] = &v209;
    v223[4] = self;
    dispatch_sync(v17, v223);
    if (*(_BYTE *)(*(_QWORD *)&v209.origin.y + 24))
    {
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lensPosition"));
      v19 = self->_devicePropsQueue;
      v221[0] = v18;
      v221[1] = 3221225472;
      v221[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_5;
      v221[3] = &unk_1E4217D58;
      v221[4] = self;
      v222 = v16;
      dispatch_sync(v19, v221);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lensPosition"));
    }
    goto LABEL_10;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04AE0]))
  {
    v20 = 664;
LABEL_26:
    -[AVCaptureFigVideoDevice _handleManualControlCompletionForRequestQueue:withPayload:](self, "_handleManualControlCompletionForRequestQueue:withPayload:", *(Class *)((char *)&self->super.super.isa + v20), a4);
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04B98]))
  {
    -[AVCaptureFigVideoDevice _setAdjustingExposure:](self, "_setAdjustingExposure:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "BOOLValue"));
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04B80]))
  {
    v21 = (const __CFDictionary *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]);
    if (v21)
    {
      memset(&v209, 0, 24);
      CMTimeMakeFromDictionary((CMTime *)&v209, v21);
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeMaxExposureDuration"));
      v22 = self->_devicePropsQueue;
      v218[0] = MEMORY[0x1E0C809B0];
      v218[1] = 3221225472;
      v218[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_6;
      v218[3] = &unk_1E4217D08;
      v218[4] = self;
      origin = v209.origin;
      width = v209.size.width;
      dispatch_sync(v22, v218);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeMaxExposureDuration"));
    }
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04C80]))
  {
    v23 = (const __CFDictionary *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]);
    memset(&v180, 0, sizeof(v180));
    CMTimeMakeFromDictionary(&v180, v23);
    v214 = 0;
    v215 = &v214;
    v216 = 0x2020000000;
    LOBYTE(v217) = 0;
    v24 = self->_devicePropsQueue;
    v25 = MEMORY[0x1E0C809B0];
    v212[0] = MEMORY[0x1E0C809B0];
    v212[1] = 3221225472;
    v212[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_7;
    v212[3] = &unk_1E4218050;
    v213 = v180;
    v212[5] = &v214;
    v212[4] = self;
    dispatch_sync(v24, v212);
    if (!*((_BYTE *)v215 + 24))
    {
LABEL_38:
      v10 = (CGRect *)&v214;
      goto LABEL_11;
    }
    v209.origin.x = 0.0;
    *(_QWORD *)&v209.origin.y = &v209;
    *(_QWORD *)&v209.size.width = 0x3810000000;
    *(_QWORD *)&v209.size.height = &unk_19EF10DB5;
    v210 = *MEMORY[0x1E0CA2E18];
    v211 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v205 = 0;
    v206 = &v205;
    v207 = 0x2020000000;
    v208 = 0;
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("exposureDuration"));
    v26 = self->_devicePropsQueue;
    v203[0] = v25;
    v203[1] = 3221225472;
    v203[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_8;
    v203[3] = &unk_1E4218078;
    v204 = v180;
    v203[4] = self;
    v203[5] = &v209;
    v203[6] = &v205;
    dispatch_sync(v26, v203);
    if (*((_BYTE *)v206 + 24))
    {
      v177 = *(_OWORD *)(*(_QWORD *)&v209.origin.y + 32);
      v178 = *(_QWORD *)(*(_QWORD *)&v209.origin.y + 48);
      -[AVCaptureFigVideoDevice _setActiveVideoMaxFrameDurationInternal:](self, "_setActiveVideoMaxFrameDurationInternal:", &v177);
    }
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("exposureDuration"));
    _Block_object_dispose(&v205, 8);
    v27 = &v209;
LABEL_37:
    _Block_object_dispose(v27, 8);
    goto LABEL_38;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04D00]))
  {
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "floatValue");
    v29 = v28;
    v209.origin.x = 0.0;
    *(_QWORD *)&v209.origin.y = &v209;
    *(_QWORD *)&v209.size.width = 0x2020000000;
    LOBYTE(v209.size.height) = 0;
    v30 = self->_devicePropsQueue;
    v31 = MEMORY[0x1E0C809B0];
    v201[0] = MEMORY[0x1E0C809B0];
    v201[1] = 3221225472;
    v201[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_9;
    v201[3] = &unk_1E4218028;
    v202 = v28;
    v201[5] = &v209;
    v201[4] = self;
    dispatch_sync(v30, v201);
    if (*(_BYTE *)(*(_QWORD *)&v209.origin.y + 24))
    {
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("ISO"));
      v32 = self->_devicePropsQueue;
      v199[0] = v31;
      v199[1] = 3221225472;
      v199[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_10;
      v199[3] = &unk_1E4217D58;
      v199[4] = self;
      v200 = v29;
      dispatch_sync(v32, v199);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("ISO"));
    }
    goto LABEL_10;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04C90]))
  {
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "floatValue");
    v34 = v33;
    v209.origin.x = 0.0;
    *(_QWORD *)&v209.origin.y = &v209;
    *(_QWORD *)&v209.size.width = 0x2020000000;
    LOBYTE(v209.size.height) = 0;
    v35 = self->_devicePropsQueue;
    v36 = MEMORY[0x1E0C809B0];
    v197[0] = MEMORY[0x1E0C809B0];
    v197[1] = 3221225472;
    v197[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_11;
    v197[3] = &unk_1E4218028;
    v197[5] = &v209;
    v197[4] = self;
    v198 = v33;
    dispatch_sync(v35, v197);
    if (*(_BYTE *)(*(_QWORD *)&v209.origin.y + 24))
    {
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("exposureTargetBias"));
      v37 = self->_devicePropsQueue;
      v195[0] = v36;
      v195[1] = 3221225472;
      v195[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_12;
      v195[3] = &unk_1E4217D58;
      v195[4] = self;
      v196 = v34;
      dispatch_sync(v37, v195);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("exposureTargetBias"));
    }
    goto LABEL_10;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04CA0]))
  {
    v209.origin.x = 0.0;
    *(_QWORD *)&v209.origin.y = &v209;
    *(_QWORD *)&v209.size.width = 0x2020000000;
    LODWORD(v209.size.height) = 0;
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "floatValue");
    LODWORD(v209.size.height) = v38;
    v214 = 0;
    v215 = &v214;
    v216 = 0x2020000000;
    LOBYTE(v217) = 0;
    v39 = self->_devicePropsQueue;
    v40 = MEMORY[0x1E0C809B0];
    v194[0] = MEMORY[0x1E0C809B0];
    v194[1] = 3221225472;
    v194[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_13;
    v194[3] = &unk_1E42180A0;
    v194[4] = self;
    v194[5] = &v209;
    v194[6] = &v214;
    dispatch_sync(v39, v194);
    if (*((_BYTE *)v215 + 24))
    {
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("exposureTargetOffset"));
      v41 = self->_devicePropsQueue;
      v193[0] = v40;
      v193[1] = 3221225472;
      v193[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_14;
      v193[3] = &unk_1E42178B8;
      v193[4] = self;
      v193[5] = &v209;
      dispatch_sync(v41, v193);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("exposureTargetOffset"));
    }
    goto LABEL_48;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04AD8]))
  {
    v20 = 672;
    goto LABEL_26;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04AA8]))
  {
    v20 = 680;
    goto LABEL_26;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04BA8]))
  {
    -[AVCaptureFigVideoDevice _setAdjustingWhiteBalance:](self, "_setAdjustingWhiteBalance:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "BOOLValue"));
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04C50]))
  {
    v42 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]);
    if (!v42)
      return;
    v43 = v42;
    if (objc_msgSend(v42, "length") != 12)
      return;
    LODWORD(v215) = 0;
    v214 = 0;
    objc_msgSend(v43, "getBytes:length:", &v214, 12);
    v209.origin.x = 0.0;
    *(_QWORD *)&v209.origin.y = &v209;
    *(_QWORD *)&v209.size.width = 0x2020000000;
    LOBYTE(v209.size.height) = 0;
    v44 = self->_devicePropsQueue;
    v45 = MEMORY[0x1E0C809B0];
    v191[0] = MEMORY[0x1E0C809B0];
    v191[1] = 3221225472;
    v191[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_15;
    v191[3] = &unk_1E42180C8;
    v191[6] = v214;
    v192 = (int)v215;
    v191[5] = &v209;
    v191[4] = self;
    dispatch_sync(v44, v191);
    if (*(_BYTE *)(*(_QWORD *)&v209.origin.y + 24))
    {
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("deviceWhiteBalanceGains"));
      v46 = self->_devicePropsQueue;
      v189[0] = v45;
      v189[1] = 3221225472;
      v189[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_16;
      v189[3] = &unk_1E42180F0;
      v189[4] = self;
      v189[5] = v214;
      v190 = (int)v215;
      dispatch_sync(v46, v189);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("deviceWhiteBalanceGains"));
    }
    goto LABEL_10;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04CF0]))
  {
    v47 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]);
    if (v47)
    {
      v48 = v47;
      if (objc_msgSend(v47, "length") == 12)
      {
        LODWORD(v209.origin.y) = 0;
        v209.origin.x = 0.0;
        objc_msgSend(v48, "getBytes:length:", &v209, 12);
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("grayWorldDeviceWhiteBalanceGains"));
        v49 = self->_devicePropsQueue;
        v187[0] = MEMORY[0x1E0C809B0];
        v187[1] = 3221225472;
        v187[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_17;
        v187[3] = &unk_1E42180F0;
        y_low = LODWORD(v209.origin.y);
        v187[5] = *(_QWORD *)&v209.origin.x;
        v187[4] = self;
        dispatch_sync(v49, v187);
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("grayWorldDeviceWhiteBalanceGains"));
      }
    }
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04AE8]))
  {
    v20 = 688;
    goto LABEL_26;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04D70]))
  {
    v50 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "BOOLValue");
    v209.origin.x = 0.0;
    *(_QWORD *)&v209.origin.y = &v209;
    *(_QWORD *)&v209.size.width = 0x2020000000;
    LOBYTE(v209.size.height) = 0;
    v51 = self->_devicePropsQueue;
    v52 = MEMORY[0x1E0C809B0];
    v185[0] = MEMORY[0x1E0C809B0];
    v185[1] = 3221225472;
    v185[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_18;
    v185[3] = &unk_1E4217BF0;
    v186 = v50;
    v185[5] = &v209;
    v185[4] = self;
    dispatch_sync(v51, v185);
    if (*(_BYTE *)(*(_QWORD *)&v209.origin.y + 24))
    {
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sceneClassificationActive"));
      v53 = self->_devicePropsQueue;
      v183[0] = v52;
      v183[1] = 3221225472;
      v183[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_19;
      v183[3] = &unk_1E4217A10;
      v183[4] = self;
      v184 = v50;
      dispatch_sync(v53, v183);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sceneClassificationActive"));
    }
    goto LABEL_10;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04D78]))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("documentSceneConfidence"));
    v54 = self->_devicePropsQueue;
    v182[0] = MEMORY[0x1E0C809B0];
    v182[1] = 3221225472;
    v182[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_20;
    v182[3] = &unk_1E4216408;
    v182[4] = self;
    v182[5] = a4;
    dispatch_sync(v54, v182);
    v55 = self;
    v56 = CFSTR("documentSceneConfidence");
LABEL_71:
    -[AVCaptureFigVideoDevice didChangeValueForKey:](v55, "didChangeValueForKey:", v56);
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04B30]))
  {
    v57 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04E88]), "BOOLValue");
    v58 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04E90]), "BOOLValue");
    v59 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04E98]), "BOOLValue");
    v60 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04E80]);
    v214 = 0;
    v215 = &v214;
    v216 = 0x2020000000;
    LOBYTE(v217) = 0;
    v205 = 0;
    v206 = &v205;
    v207 = 0x2020000000;
    v208 = 0;
    v180.value = 0;
    *(_QWORD *)&v180.timescale = &v180;
    v180.epoch = 0x2020000000;
    v181 = 0;
    *(_QWORD *)&v177 = 0;
    *((_QWORD *)&v177 + 1) = &v177;
    v178 = 0x2020000000;
    v179 = 0;
    v173 = 0;
    v174 = &v173;
    v175 = 0x2020000000;
    v176 = 0;
    v209.origin.x = 0.0;
    *(_QWORD *)&v209.origin.y = &v209;
    *(_QWORD *)&v209.size.width = 0x3052000000;
    *(_QWORD *)&v209.size.height = __Block_byref_object_copy__5;
    *(_QWORD *)&v210 = __Block_byref_object_dispose__5;
    v61 = self->_devicePropsQueue;
    *((_QWORD *)&v210 + 1) = 0;
    v172[0] = MEMORY[0x1E0C809B0];
    v172[1] = 3221225472;
    v172[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_21;
    v172[3] = &unk_1E4218118;
    v172[5] = &v214;
    v172[4] = self;
    v172[6] = &v205;
    v172[7] = &v180;
    v172[8] = &v177;
    v172[9] = &v173;
    v172[10] = &v209;
    dispatch_sync(v61, v172);
    if (!*((_BYTE *)v206 + 24) && *((unsigned __int8 *)v215 + 24) != (_DWORD)v57)
      -[AVCaptureFigVideoDevice _setFlashActive:](self, "_setFlashActive:", v57);
    if (*(unsigned __int8 *)(*(_QWORD *)&v180.timescale + 24) != (_DWORD)v57)
      -[AVCaptureFigVideoDevice _setFlashSceneDetectedForPhotoOutput:](self, "_setFlashSceneDetectedForPhotoOutput:", v57);
    if (*(unsigned __int8 *)(*((_QWORD *)&v177 + 1) + 24) != (_DWORD)v58)
      -[AVCaptureFigVideoDevice _setHDRSceneDetectedForPhotoOutput:](self, "_setHDRSceneDetectedForPhotoOutput:", v58);
    if (*((unsigned __int8 *)v174 + 24) != (_DWORD)v59)
      -[AVCaptureFigVideoDevice _setIsStillImageStabilizationScene:](self, "_setIsStillImageStabilizationScene:", v59);
    if ((objc_msgSend(*(id *)(*(_QWORD *)&v209.origin.y + 40), "isEqualToDictionary:", v60) & 1) == 0)
      -[AVCaptureFigVideoDevice _setDigitalFlashSceneForPhotoOutput:](self, "_setDigitalFlashSceneForPhotoOutput:", v60);

    _Block_object_dispose(&v209, 8);
    _Block_object_dispose(&v173, 8);
    _Block_object_dispose(&v177, 8);
    _Block_object_dispose(&v180, 8);
    v27 = (CGRect *)&v205;
    goto LABEL_37;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04CC0]))
  {
    -[AVCaptureFigVideoDevice _setFlashAvailable:](self, "_setFlashAvailable:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "BOOLValue") ^ 1);
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04DD8]))
  {
    -[AVCaptureFigVideoDevice _setTorchActive:](self, "_setTorchActive:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "BOOLValue"));
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04DE8]))
  {
    -[AVCaptureFigVideoDevice _setTorchAvailable:](self, "_setTorchAvailable:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "BOOLValue") ^ 1);
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04DE0]))
  {
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "floatValue");
    -[AVCaptureFigVideoDevice _setTorchLevel:](self, "_setTorchLevel:");
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04D08]))
  {
    -[AVCaptureFigVideoDevice _setImageControlMode:](self, "_setImageControlMode:", (int)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "intValue"));
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04B40]))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return;
    v62 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04F08]);
    v63 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04F00]);
    v64 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04F10]);
    v65 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04F18]);
    v209.origin.x = 0.0;
    *(_QWORD *)&v209.origin.y = &v209;
    *(_QWORD *)&v209.size.width = 0x2020000000;
    LODWORD(v209.size.height) = 0;
    v214 = 0;
    v215 = &v214;
    v216 = 0x2020000000;
    LODWORD(v217) = 0;
    v205 = 0;
    v206 = &v205;
    v207 = 0x2020000000;
    v208 = 0;
    v66 = self->_devicePropsQueue;
    v67 = MEMORY[0x1E0C809B0];
    v171[0] = MEMORY[0x1E0C809B0];
    v171[1] = 3221225472;
    v171[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_22;
    v171[3] = &unk_1E4218140;
    v171[4] = self;
    v171[5] = v63;
    v171[7] = &v209;
    v171[6] = v64;
    v171[8] = &v214;
    v171[9] = &v205;
    dispatch_sync(v66, v171);
    if (!v62 || !v64 || !v65)
      goto LABEL_114;
    if (objc_msgSend(v65, "BOOLValue"))
    {
      v68 = objc_msgSend(v64, "intValue");
      if (v68 != *((_DWORD *)v215 + 6) || *(float *)(*(_QWORD *)&v209.origin.y + 24) == 0.0)
        goto LABEL_114;
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rampingVideoZoom"));
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoZoomFactor"));
      v69 = self->_devicePropsQueue;
      v170[0] = v67;
      v170[1] = 3221225472;
      v170[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_23;
      v170[3] = &unk_1E4216408;
      v170[4] = self;
      v170[5] = v62;
      dispatch_sync(v69, v170);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoZoomFactor"));
    }
    else
    {
      if (*(float *)(*(_QWORD *)&v209.origin.y + 24) == 0.0)
        goto LABEL_114;
      if (*((_BYTE *)v206 + 24))
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rampingVideoZoom"));
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoZoomFactor"));
      v74 = self->_devicePropsQueue;
      v169[0] = v67;
      v169[1] = 3221225472;
      v169[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_24;
      v169[3] = &unk_1E4218168;
      v169[4] = self;
      v169[5] = v62;
      v169[6] = &v205;
      v169[7] = &v209;
      v169[8] = &v214;
      dispatch_sync(v74, v169);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoZoomFactor"));
      if (!*((_BYTE *)v206 + 24))
        goto LABEL_114;
    }
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rampingVideoZoom"));
LABEL_114:
    _Block_object_dispose(&v205, 8);
LABEL_48:
    _Block_object_dispose(&v214, 8);
LABEL_10:
    v10 = &v209;
LABEL_11:
    _Block_object_dispose(v10, 8);
    return;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04AC8]))
  {
    v70 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v209.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v209.size = v70;
    if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A20]), &v209))
    {
      v71 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A18]), "intValue");
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("faceRectangle"));
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("faceRectangleAngle"));
      v165[1] = 3221225472;
      v166 = v209.origin;
      v72 = self->_devicePropsQueue;
      v165[0] = MEMORY[0x1E0C809B0];
      v165[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_25;
      v165[3] = &unk_1E4218190;
      v165[4] = self;
      size = v209.size;
      v168 = v71;
      dispatch_sync(v72, v165);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("faceRectangleAngle"));
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("faceRectangle"));
    }
  }
  else
  {
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04B18]))
    {
      v73 = *MEMORY[0x1E0D04E70];
      v231[0] = *MEMORY[0x1E0D04E78];
      v231[1] = v73;
      v232[0] = &unk_1E424D0C8;
      v232[1] = MEMORY[0x1E0C9AA70];
      -[AVCaptureFigVideoDevice _setDigitalFlashSceneForPhotoOutput:](self, "_setDigitalFlashSceneForPhotoOutput:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v232, v231, 2));
      -[AVCaptureFigVideoDevice _drainManualControlRequestQueues](self, "_drainManualControlRequestQueues");
      return;
    }
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04B28]))
    {
      -[AVCaptureFigVideoDevice _updateSpatialCaptureStatus:](self, "_updateSpatialCaptureStatus:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "integerValue"));
      return;
    }
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04B10]))
    {
      v75 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04E50]), "integerValue");
      v76 = v75;
      if ((unint64_t)(v75 - 13) <= 1 && v75 != *(_QWORD *)&self->_depthDataDeliveryEnabled)
      {
        v209.origin.x = 0.0;
        *(_QWORD *)&v209.origin.y = &v209;
        *(_QWORD *)&v209.size.width = 0x3052000000;
        *(_QWORD *)&v209.size.height = __Block_byref_object_copy__5;
        *(_QWORD *)&v210 = __Block_byref_object_dispose__5;
        *((_QWORD *)&v210 + 1) = 0;
        v77 = self->_devicePropsQueue;
        v78 = MEMORY[0x1E0C809B0];
        v164[0] = MEMORY[0x1E0C809B0];
        v164[1] = 3221225472;
        v164[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_26;
        v164[3] = &unk_1E42178B8;
        v164[4] = self;
        v164[5] = &v209;
        dispatch_sync(v77, v164);
        if (*(_QWORD *)(*(_QWORD *)&v209.origin.y + 40))
        {
          -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("systemPressureState"));
          v79 = self->_devicePropsQueue;
          v163[0] = v78;
          v163[1] = 3221225472;
          v163[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_27;
          v163[3] = &unk_1E42178B8;
          v163[4] = self;
          v163[5] = &v209;
          dispatch_sync(v79, v163);
          -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("systemPressureState"));
        }
        _Block_object_dispose(&v209, 8);
      }
      -[AVCaptureFigVideoDevice _setShallowDepthOfFieldEffectStatus:](self, "_setShallowDepthOfFieldEffectStatus:", v76);
      v80 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v76), CFSTR("AVCaptureDeviceShallowDepthOfFieldStatusChangedKeyEffectStatus"), 0);
      v81 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04E58]);
      if (v81)
      {
        v82 = objc_msgSend(v81, "integerValue");
        objc_msgSend(v80, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v82), CFSTR("AVCaptureDeviceShallowDepthOfFieldStatusChangedKeyStagePreviewStatus"));
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVCaptureDeviceShallowDepthOfFieldStatusChangedNotification"), self, v80);
    }
    else
    {
      if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04AA0]))
      {
        v83 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]);
        v209.origin.y = 0.0;
        v209.origin.x = 0.0;
        objc_msgSend(v83, "getBytes:length:", &v209, 16);
        -[AVCaptureFigVideoDevice _setActivePrimaryConstituentDeviceSwitchingBehavior:restrictedSwitchingBehaviorConditions:](self, "_setActivePrimaryConstituentDeviceSwitchingBehavior:restrictedSwitchingBehaviorConditions:", *(_QWORD *)&v209.origin.x, *(_QWORD *)&v209.origin.y);
        objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A90]), "floatValue");
        -[AVCaptureFigVideoDevice _updateMinMaxVideoZoomFactorsWithMinZoomFactorFromCameraSelection:](self, "_updateMinMaxVideoZoomFactorsWithMinZoomFactorFromCameraSelection:", v84);
        return;
      }
      if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04AC0]))
      {
        v85 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "intValue");
        v159 = 0u;
        v160 = 0u;
        v161 = 0u;
        v162 = 0u;
        v86 = -[AVCaptureDevice constituentDevices](self, "constituentDevices");
        v87 = -[NSArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v159, v230, 16);
        if (v87)
        {
          v88 = *(_QWORD *)v160;
          while (2)
          {
            for (i = 0; i != v87; ++i)
            {
              if (*(_QWORD *)v160 != v88)
                objc_enumerationMutation(v86);
              v90 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * i);
              if (objc_msgSend(v90, "figCaptureSourceDeviceType") == v85)
              {
                if (v90 && v90 != *(void **)&self->_cameraCalibrationDataDeliveryEnabled)
                {
                  -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentPrimaryConstituentDevice"));
                  -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activePrimaryConstituentDevice"));
                  v91 = self->_devicePropsQueue;
                  v158[0] = MEMORY[0x1E0C809B0];
                  v158[1] = 3221225472;
                  v158[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_28;
                  v158[3] = &unk_1E4216408;
                  v158[4] = self;
                  v158[5] = v90;
                  dispatch_sync(v91, v158);
                  -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activePrimaryConstituentDevice"));
                  -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentPrimaryConstituentDevice"));
                }
                return;
              }
            }
            v87 = -[NSArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v159, v230, 16);
            if (v87)
              continue;
            break;
          }
        }
      }
      else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04AF0]))
      {
        v92 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "intValue");
        v154 = 0u;
        v155 = 0u;
        v156 = 0u;
        v157 = 0u;
        v93 = -[AVCaptureDevice constituentDevices](self, "constituentDevices");
        v94 = -[NSArray countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v154, v229, 16);
        if (v94)
        {
          v95 = *(_QWORD *)v155;
          while (2)
          {
            for (j = 0; j != v94; ++j)
            {
              if (*(_QWORD *)v155 != v95)
                objc_enumerationMutation(v93);
              v97 = *(NSArray **)(*((_QWORD *)&v154 + 1) + 8 * j);
              if (-[NSArray figCaptureSourceDeviceType](v97, "figCaptureSourceDeviceType") == v92)
              {
                if (v97 && v97 != self->_fallbackPrimaryConstituentDevices)
                {
                  -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("preferredPrimaryConstituentDevice"));
                  v98 = self->_devicePropsQueue;
                  v153[0] = MEMORY[0x1E0C809B0];
                  v153[1] = 3221225472;
                  v153[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_29;
                  v153[3] = &unk_1E4216408;
                  v153[4] = self;
                  v153[5] = v97;
                  dispatch_sync(v98, v153);
                  -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("preferredPrimaryConstituentDevice"));
                }
                return;
              }
            }
            v94 = -[NSArray countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v154, v229, 16);
            if (v94)
              continue;
            break;
          }
        }
      }
      else
      {
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04AD0]))
        {
          v99 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "BOOLValue");
          v209.origin.x = 0.0;
          *(_QWORD *)&v209.origin.y = &v209;
          *(_QWORD *)&v209.size.width = 0x2020000000;
          LOBYTE(v209.size.height) = 0;
          v100 = self->_devicePropsQueue;
          v101 = MEMORY[0x1E0C809B0];
          v151[0] = MEMORY[0x1E0C809B0];
          v151[1] = 3221225472;
          v151[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_30;
          v151[3] = &unk_1E4217BF0;
          v152 = v99;
          v151[5] = &v209;
          v151[4] = self;
          dispatch_sync(v100, v151);
          if (*(_BYTE *)(*(_QWORD *)&v209.origin.y + 24))
          {
            -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("focusedAtMacro"));
            v102 = self->_devicePropsQueue;
            v149[0] = v101;
            v149[1] = 3221225472;
            v149[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_31;
            v149[3] = &unk_1E4217A10;
            v149[4] = self;
            v150 = v99;
            dispatch_sync(v102, v149);
            -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("focusedAtMacro"));
          }
          goto LABEL_10;
        }
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04DC8]))
        {
          v103 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04EC8]), "intValue");
          v104 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04EC0]), "intValue");
          if ((int)v103 > SLODWORD(self->_systemPressureState))
            LODWORD(self->_systemPressureState) = v103;
          v105 = -[AVCaptureSystemPressureState initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:]([AVCaptureSystemPressureState alloc], "initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:", v103, v104, -[AVCaptureFigVideoDevice _recommendedFrameRateRangeForVideoFormat:depthFormat:figSystemPressureLevel:](self, "_recommendedFrameRateRangeForVideoFormat:depthFormat:figSystemPressureLevel:", -[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), -[AVCaptureFigVideoDevice activeDepthDataFormat](self, "activeDepthDataFormat"), LODWORD(self->_systemPressureState)));
          v209.origin.x = 0.0;
          *(_QWORD *)&v209.origin.y = &v209;
          *(_QWORD *)&v209.size.width = 0x2020000000;
          LOBYTE(v209.size.height) = 0;
          v106 = self->_devicePropsQueue;
          v107 = MEMORY[0x1E0C809B0];
          v148[0] = MEMORY[0x1E0C809B0];
          v148[1] = 3221225472;
          v148[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_32;
          v148[3] = &unk_1E42178E0;
          v148[6] = &v209;
          v148[4] = v105;
          v148[5] = self;
          dispatch_sync(v106, v148);
          if (*(_BYTE *)(*(_QWORD *)&v209.origin.y + 24))
          {
            -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("systemPressureState"));
            v108 = self->_devicePropsQueue;
            v147[0] = v107;
            v147[1] = 3221225472;
            v147[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_33;
            v147[3] = &unk_1E4216408;
            v147[4] = self;
            v147[5] = v105;
            dispatch_sync(v108, v147);
            -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("systemPressureState"));
          }
          goto LABEL_10;
        }
        if (BYTE1(self->_degradedCaptureQualityFactors) && CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04E10])
          || BYTE2(self->_degradedCaptureQualityFactors) && CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04BF8]))
        {
          if (!-[AVCaptureFigVideoDevice hasFlash](self, "hasFlash"))
            return;
          v109 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "BOOLValue");
          v209.origin.x = 0.0;
          *(_QWORD *)&v209.origin.y = &v209;
          *(_QWORD *)&v209.size.width = 0x2020000000;
          LOBYTE(v209.size.height) = 0;
          v214 = 0;
          v215 = &v214;
          v216 = 0x2020000000;
          v110 = self->_devicePropsQueue;
          v217 = 0;
          v111 = MEMORY[0x1E0C809B0];
          v145[0] = MEMORY[0x1E0C809B0];
          v145[1] = 3221225472;
          v145[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_34;
          v145[3] = &unk_1E42181B8;
          v146 = v109;
          v145[4] = self;
          v145[5] = &v214;
          v145[7] = a3;
          v145[6] = &v209;
          dispatch_sync(v110, v145);
          if (*(_BYTE *)(*(_QWORD *)&v209.origin.y + 24))
          {
            -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("degradedCaptureQualityFactors"));
            v112 = self->_devicePropsQueue;
            v144[0] = v111;
            v144[1] = 3221225472;
            v144[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_35;
            v144[3] = &unk_1E42178B8;
            v144[4] = self;
            v144[5] = &v214;
            dispatch_sync(v112, v144);
            -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("degradedCaptureQualityFactors"));
          }
          goto LABEL_48;
        }
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04CF8]))
        {
          v113 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "BOOLValue");
          if ((v113 & 1) != 0)
            return;
          v114 = v113;
          v209.origin.x = 0.0;
          *(_QWORD *)&v209.origin.y = &v209;
          *(_QWORD *)&v209.size.width = 0x2020000000;
          LOBYTE(v209.size.height) = 0;
          v115 = self->_devicePropsQueue;
          v116 = MEMORY[0x1E0C809B0];
          v142[0] = MEMORY[0x1E0C809B0];
          v142[1] = 3221225472;
          v142[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_36;
          v142[3] = &unk_1E4217BF0;
          v142[4] = self;
          v142[5] = &v209;
          v143 = v114;
          dispatch_sync(v115, v142);
          if (*(_BYTE *)(*(_QWORD *)&v209.origin.y + 24))
          {
            -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hidden"));
            v117 = self->_devicePropsQueue;
            v140[0] = v116;
            v140[1] = 3221225472;
            v140[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_37;
            v140[3] = &unk_1E4217A10;
            v140[4] = self;
            v141 = v114;
            dispatch_sync(v117, v140);
            -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hidden"));
          }
          goto LABEL_10;
        }
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04D60]))
        {
          v118 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "BOOLValue");
          if (!v118)
            return;
          v119 = v118;
          v209.origin.x = 0.0;
          *(_QWORD *)&v209.origin.y = &v209;
          *(_QWORD *)&v209.size.width = 0x2020000000;
          LOBYTE(v209.size.height) = 0;
          v120 = self->_devicePropsQueue;
          v121 = MEMORY[0x1E0C809B0];
          v138[0] = MEMORY[0x1E0C809B0];
          v138[1] = 3221225472;
          v138[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_38;
          v138[3] = &unk_1E4217BF0;
          v138[4] = self;
          v138[5] = &v209;
          v139 = v119;
          dispatch_sync(v120, v138);
          if (*(_BYTE *)(*(_QWORD *)&v209.origin.y + 24))
          {
            -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("readyToUnhide"));
            v122 = self->_devicePropsQueue;
            v136[0] = v121;
            v136[1] = 3221225472;
            v136[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_39;
            v136[3] = &unk_1E4217A10;
            v136[4] = self;
            v137 = v119;
            dispatch_sync(v122, v136);
            -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("readyToUnhide"));
          }
          goto LABEL_10;
        }
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04C00]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04BF0]))
          return;
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04C30]))
        {
          v123 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
          v209.origin = (CGPoint)*MEMORY[0x1E0C9D628];
          v209.size = v123;
          if (!CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), &v209))return;
          v214 = 0;
          v215 = &v214;
          v216 = 0x2020000000;
          LOBYTE(v217) = 0;
          v124 = self->_devicePropsQueue;
          v125 = MEMORY[0x1E0C809B0];
          v134[0] = MEMORY[0x1E0C809B0];
          v134[1] = 3221225472;
          v134[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_40;
          v134[3] = &unk_1E4217840;
          v134[4] = self;
          v134[5] = &v214;
          v135 = v209;
          dispatch_sync(v124, v134);
          if (*((_BYTE *)v215 + 24))
          {
            -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("centerStageRectOfInterest"));
            v126 = self->_devicePropsQueue;
            v132[0] = v125;
            v132[1] = 3221225472;
            v132[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_41;
            v132[3] = &unk_1E4217E48;
            v132[4] = self;
            v133 = v209;
            dispatch_sync(v126, v132);
            -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("centerStageRectOfInterest"));
          }
          goto LABEL_38;
        }
        if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04C20]))
        {
          if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04B00]))
          {
            -[AVCaptureDevice updateReactionsInProgress:](self, "updateReactionsInProgress:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]));
            return;
          }
          if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04E00]))
          {
            CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04C70]);
            return;
          }
          objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]), "floatValue");
          v128 = v127;
          -[AVCaptureFigVideoDevice videoZoomFactor](self, "videoZoomFactor");
          if (v129 != v128)
          {
            -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoZoomFactor"));
            v130 = self->_devicePropsQueue;
            v131[0] = MEMORY[0x1E0C809B0];
            v131[1] = 3221225472;
            v131[2] = __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_42;
            v131[3] = &unk_1E4216650;
            v131[4] = self;
            *(double *)&v131[5] = v128;
            dispatch_sync(v130, v131);
            v55 = self;
            v56 = CFSTR("videoZoomFactor");
            goto LABEL_71;
          }
        }
      }
    }
  }
}

- (id)activeDepthDataFormat
{
  NSObject *devicePropsQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVCaptureFigVideoDevice_activeDepthDataFormat__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setShallowDepthOfFieldEffectStatus:(int64_t)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[6];

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__AVCaptureFigVideoDevice__setShallowDepthOfFieldEffectStatus___block_invoke;
  v4[3] = &unk_1E4216650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_setAdjustingWhiteBalance:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__AVCaptureFigVideoDevice__setAdjustingWhiteBalance___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)_updateMinMaxVideoZoomFactorsWithMinZoomFactorFromCameraSelection:(double)a3
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;

  v7 = 0;
  v8 = 0.0;
  v6 = 0;
  -[AVCaptureFigVideoDevice _computeMinVideoZoomFactorOut:maxVideoZoomFactorOut:defaultVideoZoomFactorOut:centerStageActiveOverride:resetZoomFactor:](self, "_computeMinVideoZoomFactorOut:maxVideoZoomFactorOut:defaultVideoZoomFactorOut:centerStageActiveOverride:resetZoomFactor:", &v8, &v7, &v6, BYTE4(self->_degradedCaptureQualityFactors), 0);
  v5 = v8;
  if (v8 <= a3)
    v5 = a3;
  v8 = v5;
  -[AVCaptureFigVideoDevice _setMinAvailableVideoZoomFactor:](self, "_setMinAvailableVideoZoomFactor:");
}

- (void)_setActivePrimaryConstituentDeviceSwitchingBehavior:(int64_t)a3 restrictedSwitchingBehaviorConditions:(unint64_t)a4
{
  AVCaptureDevice *activePrimaryConstituentDevice;
  int64_t activePrimaryConstituentDeviceSwitchingBehavior;
  NSObject *devicePropsQueue;
  _QWORD block[7];

  activePrimaryConstituentDevice = self->_activePrimaryConstituentDevice;
  activePrimaryConstituentDeviceSwitchingBehavior = self->_activePrimaryConstituentDeviceSwitchingBehavior;
  if (activePrimaryConstituentDevice != (AVCaptureDevice *)a3 || activePrimaryConstituentDeviceSwitchingBehavior != a4)
  {
    if (activePrimaryConstituentDevice != (AVCaptureDevice *)a3)
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activePrimaryConstituentDeviceSwitchingBehavior"));
    if (activePrimaryConstituentDeviceSwitchingBehavior != a4)
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions"));
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__AVCaptureFigVideoDevice__setActivePrimaryConstituentDeviceSwitchingBehavior_restrictedSwitchingBehaviorConditions___block_invoke;
    block[3] = &unk_1E4216628;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_sync(devicePropsQueue, block);
    if (activePrimaryConstituentDeviceSwitchingBehavior != a4)
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions"));
    if (activePrimaryConstituentDevice != (AVCaptureDevice *)a3)
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activePrimaryConstituentDeviceSwitchingBehavior"));
  }
}

- (BOOL)isFlashActive
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVCaptureFigVideoDevice_isFlashActive__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __66__AVCaptureFigVideoDevice__updateReactionEffectsActiveForEnabled___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1256) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __40__AVCaptureFigVideoDevice_isTorchActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 784);
  return result;
}

- (BOOL)isAdjustingExposure
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVCaptureFigVideoDevice_isAdjustingExposure__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)virtualDeviceSwitchOverVideoZoomFactors
{
  id v2;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04798]);
  if (objc_msgSend(v2, "count"))
    return v2;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

uint64_t __56__AVCaptureFigVideoDevice__setDigitalFlashModeInternal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04C60], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40)));
  if (!(_DWORD)result)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 752) = *(_QWORD *)(a1 + 40);
  return result;
}

- (void)setFaceDetectionDrivenImageProcessingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  int v6;
  NSObject *devicePropsQueue;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD block[5];
  int v12;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice isFaceDetectionSupported](self, "isFaceDetectionSupported"))
  {
    if (v3)
      v5 = 3;
    else
      v5 = 0;
    v6 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04CB0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5));
    if (v6 != -16452)
    {
      if (!v6)
      {
        devicePropsQueue = self->_devicePropsQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __72__AVCaptureFigVideoDevice_setFaceDetectionDrivenImageProcessingEnabled___block_invoke;
        block[3] = &unk_1E4217D58;
        block[4] = self;
        v12 = v5;
        dispatch_sync(devicePropsQueue, block);
      }
      return;
    }
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  v10 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v10);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
}

- (void)setExposurePointOfInterest:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  uint64_t v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (-[AVCaptureFigVideoDevice isExposurePointOfInterestSupported](self, "isExposurePointOfInterestSupported"))
    {
      self->_exposurePointOfInterest.x = x;
      self->_exposurePointOfInterest.y = y;
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

- (int)_setExposureWithMode:(int64_t)a3 duration:(id *)a4 ISO:(float)a5 requestID:(int)a6 newMaxFrameDuration:(id *)a7
{
  uint64_t v7;
  uint64_t v9;
  char v14;
  double v15;
  void *v16;
  uint64_t v17;
  double x;
  BOOL v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  const __CFAllocator *v23;
  CFDictionaryRef v24;
  int64_t var3;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  int result;
  uint64_t v34;
  uint64_t v35;
  CMTime time2;
  CMTime size;
  uint64_t v38;
  int epoch_high;
  uint64_t v40;

  v9 = *(_QWORD *)&a6;
  v40 = *MEMORY[0x1E0C80C00];
  if (a7)
    *a7 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  if (!_FigIsCurrentDispatchQueue())
  {
    v35 = v7;
    LODWORD(v34) = 0;
    FigDebugAssert3();
  }
  if (a3 != 1)
  {
    if (a3)
    {
      v14 = 0;
      goto LABEL_11;
    }
    if (self->_exposureMode != 3)
    {
      v14 = 0;
      a3 = 0;
      goto LABEL_11;
    }
  }
  v14 = 1;
  a3 = 2;
LABEL_11:
  if (a3 != 3 && self->_exposureMode == 3)
  {
    v15 = (double)self->_activeMinFrameDuration.timescale / (double)self->_activeMinFrameDuration.value;
    -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:cacheOnly:](self, "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E0D04B90], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)self->_activeMaxFrameDuration.timescale / (double)self->_activeMaxFrameDuration.value), self->_cachesFigCaptureSourceConfigurationChanges);
    -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:cacheOnly:](self, "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E0D04B88], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15), self->_cachesFigCaptureSourceConfigurationChanges);
  }
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v34, v35);
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D049D8]);
  if (a3 != 3)
  {
    if (a3 != 2)
      goto LABEL_31;
    if (-[AVCaptureFigVideoDevice isExposurePointOfInterestSupported](self, "isExposurePointOfInterestSupported"))
    {
      size.value = 0;
      *(_QWORD *)&size.timescale = 0;
      x = self->_exposurePointOfInterest.x;
      v19 = self->_exposurePointOfInterest.y == 0.5 && x == 0.5;
      v20 = (_QWORD *)MEMORY[0x1E0D047C0];
      if (!v19)
        v20 = (_QWORD *)MEMORY[0x1E0D047C8];
      CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *v20, x), (CGSize *)&size);
      objc_msgSend(v16, "setObject:forKeyedSubscript:", fvd_cgRectDictionaryForCenterAndSize(self->_exposurePointOfInterest.x, self->_exposurePointOfInterest.y, *(double *)&size.value, *(double *)&size.timescale), *MEMORY[0x1E0D049E0]);
    }
    v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&self->_torchAvailable);
    v22 = (_QWORD *)MEMORY[0x1E0D04A28];
    goto LABEL_30;
  }
  v23 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  size = (CMTime)*a4;
  v24 = CMTimeCopyAsDictionary(&size, v23);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D049C8]);

  var3 = a4->var3;
  *(_OWORD *)&self->_manualWhiteBalanceControlRequests = *(_OWORD *)&a4->var0;
  *(_QWORD *)&self->_lastCustomExposureDuration.timescale = var3;
  value = self->_activeMaxFrameDuration.value;
  timescale = self->_activeMaxFrameDuration.timescale;
  v28 = *(_QWORD *)&self->_activeMaxFrameDuration.flags;
  epoch_high = HIDWORD(self->_activeMaxFrameDuration.epoch);
  size = (CMTime)*a4;
  v38 = v28;
  memset(&time2, 0, sizeof(time2));
  if (CMTimeCompare(&size, &time2))
  {
    size = (CMTime)*a4;
    time2.value = value;
    time2.timescale = timescale;
    *(_QWORD *)&time2.flags = v38;
    HIDWORD(time2.epoch) = epoch_high;
    if (CMTimeCompare(&size, &time2) >= 1)
    {
      CMTimeMake(&size, 1, vcvtmd_s64_f64((double)a4->var1 / (double)a4->var0));
      value = size.value;
      timescale = size.timescale;
      v38 = *(_QWORD *)&size.flags;
      epoch_high = HIDWORD(size.epoch);
      if (a7)
      {
        a7->var0 = size.value;
        a7->var1 = timescale;
        *(_QWORD *)&a7->var2 = v38;
        HIDWORD(a7->var3) = epoch_high;
      }
    }
  }
  v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)timescale / (double)value);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D049C0]);
  v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)self->_activeMinFrameDuration.timescale / (double)self->_activeMinFrameDuration.value);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D049B8]);
  *(float *)&v31 = a5;
  v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D049D0]);
  *(float *)&self->_lastCustomExposureDuration.epoch = a5;
  if ((_DWORD)v9)
  {
    v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v22 = (_QWORD *)MEMORY[0x1E0D049E8];
LABEL_30:
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, *v22);
  }
LABEL_31:
  result = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04C88], v16);
  if (!result)
    BYTE5(self->_activeMaxExposureDurationClientOverride.epoch) = v14;
  return result;
}

- (BOOL)isExposurePointOfInterestSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04808]), "BOOLValue");
}

uint64_t __65__AVCaptureFigVideoDevice__setFallbackPrimaryConstituentDevices___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E0D04C78], *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 328));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {

    result = objc_msgSend(*(id *)(a1 + 48), "copy");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008) = result;
  }
  return result;
}

uint64_t __47__AVCaptureFigVideoDevice_setWhiteBalanceMode___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t result;

  LODWORD(a2) = 0;
  LODWORD(a3) = 0;
  LODWORD(a4) = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "_setWhiteBalanceWithMode:gains:requestID:", *(_QWORD *)(a1 + 48), 0, a2, a3, a4);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544) = *(_QWORD *)(a1 + 48);
  return result;
}

uint64_t __63__AVCaptureFigVideoDevice__setPhotoSettingsForSceneMonitoring___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 736);
  result = objc_msgSend(*(id *)(a1 + 40), "flashMode");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 745) = result == 2;
  return result;
}

- (void)setTorchMode:(int64_t)a3
{
  double v5;
  int v6;
  NSObject *devicePropsQueue;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  _QWORD block[6];

  if (-[AVCaptureFigVideoDevice isTorchModeSupported:](self, "isTorchModeSupported:"))
  {
    LODWORD(v5) = 2139095039;
    if (a3 != 1)
      *(float *)&v5 = 0.0;
    v6 = -[AVCaptureFigVideoDevice _setTorchMode:withLevel:](self, "_setTorchMode:withLevel:", a3, v5);
    if (v6 != -16452)
    {
      if (!v6)
      {
        devicePropsQueue = self->_devicePropsQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __40__AVCaptureFigVideoDevice_setTorchMode___block_invoke;
        block[3] = &unk_1E4216650;
        block[4] = self;
        block[5] = a3;
        dispatch_sync(devicePropsQueue, block);
      }
      return;
    }
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v10 = AVMethodExceptionReasonWithClassAndSelector();
    v11 = v13;
    v12 = v14;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    v16 = a3;
    v10 = AVMethodExceptionReasonWithClassAndSelector();
    v11 = v8;
    v12 = v9;
  }
  v15 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v10, 0, v16);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v15);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v15);
}

- (BOOL)isTorchModeSupported:(int64_t)a3
{
  return (unint64_t)a3 <= 2 && -[AVCaptureFigVideoDevice hasTorch](self, "hasTorch");
}

- (int)_setTorchMode:(int64_t)a3 withLevel:(float)a4
{
  int v7;
  double v8;
  int v9;

  v7 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04BD0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3 == 2));
  if (v7)
  {
    v9 = v7;
    goto LABEL_7;
  }
  if (a3 != 2)
  {
    *(float *)&v8 = a4;
    v9 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04DE0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8));
    if (!v9)
      return v9;
LABEL_7:
    FigDebugAssert3();
    return v9;
  }
  return 0;
}

- (int)_setFallbackPrimaryConstituentDevices:(id)a3
{
  id v3;
  void *v5;
  NSObject *devicePropsQueue;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = avcfvd_deviceTypesFromAVCaptureDevices(a3);
  devicePropsQueue = self->_devicePropsQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__AVCaptureFigVideoDevice__setFallbackPrimaryConstituentDevices___block_invoke;
  v8[3] = &unk_1E4217F60;
  v8[4] = self;
  v8[5] = v5;
  v8[6] = v3;
  v8[7] = &v9;
  dispatch_sync(devicePropsQueue, v8);
  LODWORD(v3) = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return (int)v3;
}

- (void)setCachesFigCaptureSourceConfigurationChanges:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    self->_cachesFigCaptureSourceConfigurationChanges = a3;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

- (void)setFlashMode:(int64_t)a3
{
  NSObject *devicePropsQueue;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  _QWORD block[8];
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
  int64_t v29;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (-[AVCaptureFigVideoDevice isFlashModeSupported:](self, "isFlashModeSupported:", a3))
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v29 = a3;
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__AVCaptureFigVideoDevice_setFlashMode___block_invoke;
      block[3] = &unk_1E4217B28;
      block[4] = self;
      block[5] = &v26;
      block[6] = &v22;
      block[7] = &v18;
      dispatch_sync(devicePropsQueue, block);
      -[AVCaptureFigVideoDevice _setFlashActive:](self, "_setFlashActive:", v27[3] == 1);
      if (*((_BYTE *)v19 + 24))
        v6 = 1;
      else
        v6 = *((unsigned __int8 *)v23 + 24);
      v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04BC0], v15);
      _Block_object_dispose(&v18, 8);
      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v26, 8);
      return;
    }
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    v16 = a3;
    v9 = AVMethodExceptionReasonWithClassAndSelector();
    v10 = v12;
    v11 = v13;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v9 = AVMethodExceptionReasonWithClassAndSelector();
    v10 = v7;
    v11 = v8;
  }
  v14 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v9, 0, v16);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v14);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
}

- (BOOL)isLockedForConfiguration
{
  id v2;
  const void *v3;
  BOOL v4;

  v2 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04D20]);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFBooleanGetValue((CFBooleanRef)v2) != 0;
  CFRelease(v3);
  return v4;
}

- (BOOL)isFlashModeSupported:(int64_t)a3
{
  return (unint64_t)a3 <= 2 && -[AVCaptureFigVideoDevice hasFlash](self, "hasFlash");
}

- (void)_setFlashActive:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__AVCaptureFigVideoDevice__setFlashActive___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __46__AVCaptureFigVideoDevice_setVideoZoomFactor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  float v7;
  float v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  float v17;
  uint64_t result;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(double *)(v3 + 24);
  v5 = *(double *)(v2 + 880);
  if (v4 < v5 || (v5 = *(double *)(v2 + 888), v4 > v5))
    *(double *)(v3 + 24) = v5;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 936) && !*(_BYTE *)(v6 + 194) && !*(_BYTE *)(v6 + 196))
  {
    v7 = *(double *)(v6 + 880);
    v8 = *(double *)(v6 + 888);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = (void *)objc_msgSend(*(id *)(v6 + 144), "supportedVideoZoomRangesForDepthDataDelivery", 0);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "minZoomFactor");
          v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          if (v15 <= v14)
            v8 = v14;
          if (v15 >= v14)
            v7 = v14;
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(double *)(v16 + 24) <= (float)((float)(v8 + v7) * 0.5))
      v17 = v7;
    else
      v17 = v8;
    *(double *)(v16 + 24) = v17;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 328) = 1;
    v6 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(float *)(v6 + 868) != 0.0;
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 872);
  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E0D04E00], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 328));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

__n128 __62__AVCaptureFigVideoDevice_setActiveDepthDataMinFrameDuration___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  __n128 result;
  __n128 *v5;
  __n128 *v6;
  unint64_t v7;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = 0.0;
  if ((*(_DWORD *)(v2 + 44) & 0x1D) == 1)
    v3 = (double)*(int *)(v2 + 40) / (double)*(uint64_t *)(v2 + 32);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E0D04B78], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 328));
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v5 = (__n128 *)(*(_QWORD *)(a1 + 32) + 168);
    v6 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
    v7 = v6[3].n128_u64[0];
    result = v6[2];
    *v5 = result;
    v5[1].n128_u64[0] = v7;
  }
  return result;
}

- (int)_setWhiteBalanceWithMode:(int64_t)a3 gains:(id)a4 requestID:(int)a5
{
  uint64_t v5;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $E2C29196C7A5C696474C6955C5A9CE06 v13;

  v5 = *(_QWORD *)&a5;
  v13 = a4;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D04F38]);
  if (!a3)
  {
    v10 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v13, 12);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D04F30]);
    if ((_DWORD)v5)
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D04F40]);
    }
  }
  return -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04E20], v8);
}

- (void)_setPhotoSettingsForSceneMonitoring:(id)a3
{
  NSObject *devicePropsQueue;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  if (-[AVCaptureFigVideoDevice lockForConfiguration:](self, "lockForConfiguration:", 0))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__AVCaptureFigVideoDevice__setPhotoSettingsForSceneMonitoring___block_invoke;
    v12[3] = &unk_1E42178E0;
    v12[5] = a3;
    v12[6] = &v13;
    v12[4] = self;
    dispatch_sync(devicePropsQueue, v12);
    v6 = objc_msgSend(a3, "flashMode");
    v7 = v14[3];
    if (v6)
    {
      if (v7 != 1)
        goto LABEL_8;
    }
    else if (v7 <= 0)
    {
      v6 = 0;
      goto LABEL_8;
    }
    v6 = v14[3];
LABEL_8:
    v8 = objc_msgSend(a3, "HDRMode");
    v9 = objc_msgSend(a3, "photoQualityPrioritization");
    v10 = objc_msgSend(a3, "digitalFlashMode");
    v17[0] = *MEMORY[0x1E0D04EA8];
    v18[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v17[1] = *MEMORY[0x1E0D04EB0];
    v18[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v17[2] = *MEMORY[0x1E0D04EB8];
    v18[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v17[3] = *MEMORY[0x1E0D04EA0];
    v18[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04D90], v11);
    -[AVCaptureFigVideoDevice unlockForConfiguration](self, "unlockForConfiguration");
    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __50__AVCaptureFigVideoDevice__updateGesturesEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "lockForConfiguration:", 0);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04CE0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
    return objc_msgSend(*(id *)(a1 + 32), "unlockForConfiguration");
  }
  return result;
}

uint64_t __57__AVCaptureFigVideoDevice__updateBackgroundBlurAperture___block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;

  result = objc_msgSend(*(id *)(a1 + 32), "lockForConfiguration:", 0);
  if ((_DWORD)result)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04BE0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3));
    return objc_msgSend(*(id *)(a1 + 32), "unlockForConfiguration");
  }
  return result;
}

uint64_t __58__AVCaptureFigVideoDevice__updateStudioLightingIntensity___block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;

  result = objc_msgSend(*(id *)(a1 + 32), "lockForConfiguration:", 0);
  if ((_DWORD)result)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04DA0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3));
    return objc_msgSend(*(id *)(a1 + 32), "unlockForConfiguration");
  }
  return result;
}

- (int)_setFigCaptureSourceProperty:(__CFString *)a3 withValue:(id)a4
{
  return -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:cacheOnly:](self, "_setFigCaptureSourceProperty:withValue:cacheOnly:", a3, a4, 0);
}

uint64_t __67__AVCaptureFigVideoDevice__updatePortraitEffectStudioLightQuality___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "lockForConfiguration:", 0);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04D50], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40)));
    return objc_msgSend(*(id *)(a1 + 32), "unlockForConfiguration");
  }
  return result;
}

- (int)_setFigCaptureSourceProperty:(__CFString *)a3 withValue:(id)a4 cacheOnly:(BOOL)a5
{
  NSObject *fcsQueue;
  int v6;
  _QWORD block[8];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  fcsQueue = self->_fcsQueue;
  v13 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AVCaptureFigVideoDevice__setFigCaptureSourceProperty_withValue_cacheOnly___block_invoke;
  block[3] = &unk_1E4217F88;
  v9 = a5;
  block[6] = &v10;
  block[7] = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_sync(fcsQueue, block);
  v6 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)_computeMinVideoZoomFactorOut:(double *)a3 maxVideoZoomFactorOut:(double *)a4 defaultVideoZoomFactorOut:(double *)a5 centerStageActiveOverride:(BOOL)a6 resetZoomFactor:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v7 = a7;
  v8 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  -[AVCaptureDeviceFormat videoMaxZoomFactor](self->_activeFormat, "videoMaxZoomFactor");
  if (self->_cinematicVideoZoomEnabled)
  {
    objc_msgSend((id)objc_msgSend(-[AVCaptureDeviceFormat supportedZoomRangesForCinematicVideo](self->_activeFormat, "supportedZoomRangesForCinematicVideo"), "firstObject"), "minZoomFactor");
    v15 = v14;
    v16 = (id)objc_msgSend(-[AVCaptureDeviceFormat supportedZoomRangesForCinematicVideo](self->_activeFormat, "supportedZoomRangesForCinematicVideo"), "firstObject");
LABEL_3:
    objc_msgSend(v16, "maxZoomFactor");
    goto LABEL_4;
  }
  v18 = v13;
  if (v8 && BYTE5(self->_degradedCaptureQualityFactors))
  {
    -[AVCaptureDeviceFormat videoMinZoomFactorForCenterStage](self->_activeFormat, "videoMinZoomFactorForCenterStage");
    v15 = v21;
    -[AVCaptureDeviceFormat videoMaxZoomFactorForCenterStage](self->_activeFormat, "videoMaxZoomFactorForCenterStage");
    goto LABEL_4;
  }
  if (LOBYTE(self->_stereoVideoCaptureStatus) && !self->_continuousZoomWithDepthActive)
  {
    objc_msgSend(-[NSArray firstObject](-[AVCaptureDeviceFormat supportedVideoZoomRangesForDepthDataDelivery](self->_activeFormat, "supportedVideoZoomRangesForDepthDataDelivery"), "firstObject"), "minZoomFactor");
    v15 = v29;
    v16 = -[NSArray lastObject](-[AVCaptureDeviceFormat supportedVideoZoomRangesForDepthDataDelivery](self->_activeFormat, "supportedVideoZoomRangesForDepthDataDelivery"), "lastObject");
    goto LABEL_3;
  }
  if (!LOBYTE(self->_shallowDepthOfFieldEffectStatus))
  {
    v15 = 1.0;
    goto LABEL_5;
  }
  -[AVCaptureDeviceFormat videoMinZoomFactorForCameraCalibrationDataDelivery](self->_activeFormat, "videoMinZoomFactorForCameraCalibrationDataDelivery");
  v15 = v22;
  -[AVCaptureDeviceFormat videoMaxZoomFactorForCameraCalibrationDataDelivery](self->_activeFormat, "videoMaxZoomFactorForCameraCalibrationDataDelivery");
LABEL_4:
  v18 = v17;
LABEL_5:
  v19 = *(float *)&self->_activeColorSpace;
  if (LOBYTE(self->_stereoVideoCaptureStatus) && !self->_cinematicVideoZoomEnabled)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = -[AVCaptureDeviceFormat supportedVideoZoomRangesForDepthDataDelivery](self->_activeFormat, "supportedVideoZoomRangesForDepthDataDelivery", 0);
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
LABEL_23:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v23);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v27), "containsZoomFactor:", v19) & 1) != 0)
          break;
        if (v25 == ++v27)
        {
          v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v25)
            goto LABEL_23;
          goto LABEL_31;
        }
      }
      if (!v7)
        goto LABEL_32;
    }
LABEL_31:
    objc_msgSend(-[NSArray firstObject](-[AVCaptureDeviceFormat supportedVideoZoomRangesForDepthDataDelivery](self->_activeFormat, "supportedVideoZoomRangesForDepthDataDelivery"), "firstObject"), "minZoomFactor");
    v19 = v28;
  }
  else if (v7 || (v15 <= v19 ? (v20 = v18 < v19) : (v20 = 1), v20))
  {
    v19 = v15;
  }
LABEL_32:
  *a3 = v15;
  *a4 = v18;
  *a5 = v19;
}

- (float)exposureTargetBias
{
  NSObject *devicePropsQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVCaptureFigVideoDevice_exposureTargetBias__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setActiveVideoMaxFrameDuration:(id *)a3
{
  void *v6;
  void *v7;
  NSObject *devicePropsQueue;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  _QWORD block[8];
  __int128 v14;
  int64_t var3;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3810000000;
  v20 = &unk_19EF10DB5;
  v21 = *a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3052000000;
  v16[3] = __Block_byref_object_copy__5;
  v16[4] = __Block_byref_object_dispose__5;
  v16[5] = 0;
  if ((a3->var2 & 1) != 0
    && -[AVCaptureFigVideoDevice isAutoVideoFrameRateEnabled](self, "isAutoVideoFrameRateEnabled"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    objc_opt_class();
    v7 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AVCaptureFigVideoDevice_setActiveVideoMaxFrameDuration___block_invoke;
    block[3] = &unk_1E4217BC8;
    v14 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    block[4] = self;
    block[5] = &v17;
    block[6] = v16;
    block[7] = a2;
    dispatch_sync(devicePropsQueue, block);
    v11 = *((_OWORD *)v18 + 2);
    v12 = v18[6];
    if (-[AVCaptureFigVideoDevice _setActiveVideoMaxFrameDurationInternal:](self, "_setActiveVideoMaxFrameDurationInternal:", &v11) == -16452)
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      objc_opt_class();
      v10 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v10);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
    }
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);
}

- (void)_setActiveVideoMaxFrameDuration:(id *)a3
{
  __int128 v5;
  int64_t var3;

  if (-[AVCaptureFigVideoDevice lockForConfiguration:](self, "lockForConfiguration:", 0))
  {
    v5 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[AVCaptureFigVideoDevice _setActiveVideoMaxFrameDurationInternal:](self, "_setActiveVideoMaxFrameDurationInternal:", &v5);
    -[AVCaptureFigVideoDevice unlockForConfiguration](self, "unlockForConfiguration");
  }
}

- (int)_setActiveVideoMaxFrameDurationInternal:(id *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *devicePropsQueue;
  uint64_t v6;
  NSObject *v7;
  int v8;
  double v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[10];
  _QWORD block[8];
  os_log_type_t type;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  int v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3810000000;
  v31 = &unk_19EF10DB5;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3810000000;
  v22 = &unk_19EF10DB5;
  v23 = *a3;
  if (dword_1ECFED6C0)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  devicePropsQueue = self->_devicePropsQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVCaptureFigVideoDevice__setActiveVideoMaxFrameDurationInternal___block_invoke;
  block[3] = &unk_1E4217B28;
  block[4] = self;
  block[5] = &v19;
  block[6] = &v43;
  block[7] = &v39;
  dispatch_sync(devicePropsQueue, block);
  if (*((_BYTE *)v44 + 24))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeVideoMaxFrameDuration"));
    v7 = self->_devicePropsQueue;
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __67__AVCaptureFigVideoDevice__setActiveVideoMaxFrameDurationInternal___block_invoke_225;
    v15[3] = &unk_1E4217B50;
    v15[4] = self;
    v15[5] = &v19;
    v15[6] = &v47;
    v15[7] = &v35;
    v15[8] = &v28;
    v15[9] = &v24;
    dispatch_sync(v7, v15);
    if (*((_DWORD *)v48 + 6))
    {
      v13 = v14;
      LODWORD(v12) = *((_DWORD *)v48 + 6);
      FigDebugAssert3();
    }
    else
    {
      if (*((_BYTE *)v40 + 24))
      {
        v51 = *((_OWORD *)v20 + 2);
        v52 = v20[6];
        v8 = -[AVCaptureFigVideoDevice _setActiveVideoMinFrameDurationInternal:](self, "_setActiveVideoMinFrameDurationInternal:", &v51);
        *((_DWORD *)v48 + 6) = v8;
      }
      if (*((_BYTE *)v36 + 24) && -[AVCaptureFigVideoDevice lockForConfiguration:](self, "lockForConfiguration:", 0))
      {
        LODWORD(v9) = *((_DWORD *)v25 + 6);
        v51 = *((_OWORD *)v29 + 2);
        v52 = v29[6];
        -[AVCaptureFigVideoDevice setExposureModeCustomWithDuration:ISO:completionHandler:](self, "setExposureModeCustomWithDuration:ISO:completionHandler:", &v51, 0, v9);
        -[AVCaptureFigVideoDevice unlockForConfiguration](self, "unlockForConfiguration");
      }
    }
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeVideoMaxFrameDuration"), v12, v13);
    v10 = *((_DWORD *)v48 + 6);
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  return v10;
}

- (void)setActiveVideoMinFrameDuration:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *devicePropsQueue;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[6];
  __int128 v19;
  int64_t var3;
  _QWORD block[8];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v38;

  v34 = 0;
  v35 = &v34;
  v36 = 0x3810000000;
  v37 = &unk_19EF10DB5;
  v38 = *a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  if ((a3->var2 & 1) != 0
    && -[AVCaptureFigVideoDevice isAutoVideoFrameRateEnabled](self, "isAutoVideoFrameRateEnabled"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    objc_opt_class();
    v6 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    devicePropsQueue = self->_devicePropsQueue;
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AVCaptureFigVideoDevice_setActiveVideoMinFrameDuration___block_invoke;
    block[3] = &unk_1E4217B78;
    block[4] = self;
    block[5] = &v34;
    block[6] = &v22;
    block[7] = &v28;
    dispatch_sync(devicePropsQueue, block);
    if (v29[5])
    {
      v9 = self->_devicePropsQueue;
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __58__AVCaptureFigVideoDevice_setActiveVideoMinFrameDuration___block_invoke_2;
      v18[3] = &unk_1E4217BA0;
      v19 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      v18[4] = self;
      v18[5] = &v34;
      dispatch_sync(v9, v18);
      v16 = *((_OWORD *)v35 + 2);
      v17 = v35[6];
      if (-[AVCaptureFigVideoDevice _setActiveVideoMinFrameDurationInternal:](self, "_setActiveVideoMinFrameDurationInternal:", &v16) == -16452)
      {
        v10 = (void *)MEMORY[0x1E0C99DA0];
        objc_opt_class();
        v11 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
        if (AVCaptureShouldThrowForAPIViolations())
          objc_exception_throw(v11);
        NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
      }
    }
    else
    {
      v12 = *((int *)v35 + 10);
      v13 = v35[4];
      v14 = (void *)MEMORY[0x1E0C99DA0];
      objc_opt_class();
      v15 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithClassAndSelector(), 0, v23[5], (float)(v12 / v13));
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v15);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v15);
    }
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
}

- (void)_setActiveVideoMinFrameDuration:(id *)a3
{
  __int128 v5;
  int64_t var3;

  if (-[AVCaptureFigVideoDevice lockForConfiguration:](self, "lockForConfiguration:", 0))
  {
    v5 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[AVCaptureFigVideoDevice _setActiveVideoMinFrameDurationInternal:](self, "_setActiveVideoMinFrameDurationInternal:", &v5);
    -[AVCaptureFigVideoDevice unlockForConfiguration](self, "unlockForConfiguration");
  }
}

- (int)_setActiveVideoMinFrameDurationInternal:(id *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *devicePropsQueue;
  uint64_t v6;
  NSObject *v7;
  int v8;
  double v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[10];
  _QWORD block[8];
  os_log_type_t type;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  int v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3810000000;
  v31 = &unk_19EF10DB5;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3810000000;
  v22 = &unk_19EF10DB5;
  v23 = *a3;
  if (dword_1ECFED6C0)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  devicePropsQueue = self->_devicePropsQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVCaptureFigVideoDevice__setActiveVideoMinFrameDurationInternal___block_invoke;
  block[3] = &unk_1E4217B28;
  block[4] = self;
  block[5] = &v19;
  block[6] = &v43;
  block[7] = &v39;
  dispatch_sync(devicePropsQueue, block);
  if (*((_BYTE *)v44 + 24))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeVideoMinFrameDuration"));
    v7 = self->_devicePropsQueue;
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __67__AVCaptureFigVideoDevice__setActiveVideoMinFrameDurationInternal___block_invoke_214;
    v15[3] = &unk_1E4217B50;
    v15[4] = self;
    v15[5] = &v19;
    v15[6] = &v47;
    v15[7] = &v35;
    v15[8] = &v28;
    v15[9] = &v24;
    dispatch_sync(v7, v15);
    if (*((_DWORD *)v48 + 6))
    {
      v13 = v14;
      LODWORD(v12) = *((_DWORD *)v48 + 6);
      FigDebugAssert3();
    }
    else
    {
      if (*((_BYTE *)v40 + 24))
      {
        v51 = *((_OWORD *)v20 + 2);
        v52 = v20[6];
        v8 = -[AVCaptureFigVideoDevice _setActiveVideoMaxFrameDurationInternal:](self, "_setActiveVideoMaxFrameDurationInternal:", &v51);
        *((_DWORD *)v48 + 6) = v8;
      }
      if (*((_BYTE *)v36 + 24) && -[AVCaptureFigVideoDevice lockForConfiguration:](self, "lockForConfiguration:", 0))
      {
        LODWORD(v9) = *((_DWORD *)v25 + 6);
        v51 = *((_OWORD *)v29 + 2);
        v52 = v29[6];
        -[AVCaptureFigVideoDevice setExposureModeCustomWithDuration:ISO:completionHandler:](self, "setExposureModeCustomWithDuration:ISO:completionHandler:", &v51, 0, v9);
        -[AVCaptureFigVideoDevice unlockForConfiguration](self, "unlockForConfiguration");
      }
    }
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeVideoMinFrameDuration"), v12, v13);
    v10 = *((_DWORD *)v48 + 6);
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  return v10;
}

void __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  char v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[5];
  os_log_type_t type;
  unsigned int v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = +[AVCaptureProprietaryDefaultsSingleton cameraHistoryDownplayOverrideList](AVCaptureProprietaryDefaultsSingleton, "cameraHistoryDownplayOverrideList");
  v6 = objc_msgSend(v5, "containsObject:", sUserPreferredCameraHistoryKey);
  if (dword_1ECFED6C0)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);

  sUserPreferredCameraHistory = a3;
  sDownplayUserPreferredCameraOverrideHistory = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (dword_1ECFED6C0)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v9 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue](AVCaptureFigVideoDevice, "_cameraHistoryDispatchQueue", v16, v17);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_25;
  block[3] = &unk_1E42165A8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v9, block);
  if (dword_1ECFED6C0)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v11 = v20;
    if (os_log_type_enabled(v10, type))
      v12 = v11;
    else
      v12 = v11 & 0xFFFFFFFE;
    if (v12)
    {
      v21 = 136315138;
      v22 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1ECFED6C0)
    {
      v20 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v14 = v20;
      if (os_log_type_enabled(v13, type))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if (v15)
      {
        v21 = 136315395;
        v22 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke";
        v23 = 2113;
        v24 = sUserPreferredCameraHistoryKey;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

void __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_31(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[5];
  os_log_type_t type;
  unsigned int v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6C0)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);

  sStreamingCameraHistory = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (dword_1ECFED6C0)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v7 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue](AVCaptureFigVideoDevice, "_cameraHistoryDispatchQueue", v14, v15);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_32;
  block[3] = &unk_1E42165A8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v7, block);
  if (dword_1ECFED6C0)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v9 = v18;
    if (os_log_type_enabled(v8, type))
      v10 = v9;
    else
      v10 = v9 & 0xFFFFFFFE;
    if (v10)
    {
      v19 = 136315138;
      v20 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1ECFED6C0)
    {
      v18 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v12 = v18;
      if (os_log_type_enabled(v11, type))
        v13 = v12;
      else
        v13 = v12 & 0xFFFFFFFE;
      if (v13)
      {
        v19 = 136315395;
        v20 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke";
        v21 = 2113;
        v22 = sStreamingCameraHistoryKey;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

void __58__AVCaptureFigVideoDevice_setActiveVideoMaxFrameDuration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  __int128 *v18;
  __int128 *v19;
  __int128 v20;
  __int128 v21;
  __int128 *v22;
  __int128 *v23;
  __int128 v24;
  CMTime time2;
  CMTime time1;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(a1 + 76) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "defaultActiveMaxFrameDurationForSessionPreset:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_OWORD *)(v2 + 32) = v31;
    *(_QWORD *)(v2 + 48) = v32;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoSupportedFrameRateRanges");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
LABEL_5:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v7);
      time1 = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
      if ((objc_msgSend(v8, "includesFrameDuration:", &time1) & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v5)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!v8)
      goto LABEL_15;
    v10 = *(_QWORD *)(a1 + 32) + 304;
    if ((*(_BYTE *)(a1 + 76) & 1) != 0)
    {
      v16 = *(_OWORD *)(v9 + 32);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320) = *(_QWORD *)(v9 + 48);
      *(_OWORD *)v10 = v16;
    }
    else
    {
      v11 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)v10 = *MEMORY[0x1E0CA2E18];
      *(_QWORD *)(v10 + 16) = *(_QWORD *)(v11 + 16);
    }
    v17 = *(_QWORD *)(a1 + 32);
    v18 = (__int128 *)(v17 + 304);
    if ((*(_BYTE *)(v17 + 316) & 1) != 0)
    {
      v19 = (__int128 *)(v17 + 256);
      if ((*((_BYTE *)v19 + 12) & 1) != 0)
      {
        v20 = *v19;
        time1.epoch = *((_QWORD *)v19 + 2);
        *(_OWORD *)&time1.value = v20;
        v21 = *v18;
        time2.epoch = *((_QWORD *)v18 + 2);
        *(_OWORD *)&time2.value = v21;
        if (CMTimeCompare(&time1, &time2) >= 1)
        {
          v22 = *(__int128 **)(a1 + 32);
          v23 = v22 + 16;
          v22 += 19;
          v24 = *v22;
          *((_QWORD *)v23 + 2) = *((_QWORD *)v22 + 2);
          *v23 = v24;
        }
      }
    }
  }
  else
  {
LABEL_11:
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_15:
    v12 = (float)(*(int *)(v9 + 40) / *(uint64_t *)(v9 + 32));
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    v15 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithClassAndSelector(), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v12);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v15);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v15);
  }
}

uint64_t __58__AVCaptureFigVideoDevice_setActiveVideoMinFrameDuration___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 44) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1[4] + 144), "defaultActiveMinFrameDurationForSessionPreset:", *(_QWORD *)(a1[4] + 160));
    v2 = *(_QWORD *)(a1[5] + 8);
    *(_OWORD *)(v2 + 32) = v16;
    *(_QWORD *)(v2 + 48) = v17;
  }
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = objc_msgSend(*(id *)(a1[4] + 144), "videoSupportedFrameRateRanges");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = *(_QWORD *)(a1[5] + 8);
        v10 = *(_OWORD *)(v9 + 32);
        v11 = *(_QWORD *)(v9 + 48);
        result = objc_msgSend(v8, "includesFrameDuration:", &v10);
        if ((_DWORD)result)
        {
          *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = v8;
          return result;
        }
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      v5 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMaxFrameDuration
{
  NSObject *devicePropsQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_19EF10DB5;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVCaptureFigVideoDevice_activeVideoMaxFrameDuration__block_invoke;
  block[3] = &unk_1E4217A60;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (int64_t)focusMode
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVCaptureFigVideoDevice_focusMode__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateFallbackPrimaryConstituentDevicesForDepthDataDeliveryEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;

  v3 = a3;
  if (!self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions)
    -[AVCaptureFigVideoDevice _populateSupportedFallbackPrimaryConstituentDevices](self, "_populateSupportedFallbackPrimaryConstituentDevices");
  v5 = -[NSArray firstObject](-[AVCaptureDevice constituentDevices](self, "constituentDevices"), "firstObject");
  if (v3)
  {
    if (!-[NSArray containsObject:](self->_supportedFallbackPrimaryConstituentDevices, "containsObject:", v5))
      return;
    v6 = (id)-[NSArray mutableCopy](self->_supportedFallbackPrimaryConstituentDevices, "mutableCopy");
    objc_msgSend(v6, "removeObject:", v5);
  }
  else
  {
    if (!self->_widestFallbackPrimaryConstituentDeviceRemovedForDepthDataDelivery
      || -[NSArray containsObject:](self->_supportedFallbackPrimaryConstituentDevices, "containsObject:", v5))
    {
      return;
    }
    v6 = (id)-[NSArray mutableCopy](self->_supportedFallbackPrimaryConstituentDevices, "mutableCopy");
    objc_msgSend(v6, "addObject:", v5);
  }
  if (v6)
  {
    if (!-[AVCaptureFigVideoDevice _setFallbackPrimaryConstituentDevices:](self, "_setFallbackPrimaryConstituentDevices:", v6))self->_widestFallbackPrimaryConstituentDeviceRemovedForDepthDataDelivery = v3;

  }
}

- (void)setVideoHDRSuspended:(BOOL)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  BOOL v10;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration")
    && (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isVideoHDRSuspensionSupported") & 1) != 0
    && -[AVCaptureFigVideoDevice isVideoHDREnabled](self, "isVideoHDREnabled"))
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__AVCaptureFigVideoDevice_setVideoHDRSuspended___block_invoke;
    block[3] = &unk_1E4217A10;
    block[4] = self;
    v10 = a3;
    dispatch_sync(devicePropsQueue, block);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

- (BOOL)isVideoHDREnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AVCaptureFigVideoDevice_isVideoHDREnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_resetVideoHDRSuspended
{
  NSObject *devicePropsQueue;
  _QWORD block[5];

  if (-[AVCaptureFigVideoDevice isVideoHDRSuspended](self, "isVideoHDRSuspended"))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoHDRSuspended"));
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__AVCaptureFigVideoDevice__resetVideoHDRSuspended__block_invoke;
    block[3] = &unk_1E42165A8;
    block[4] = self;
    dispatch_sync(devicePropsQueue, block);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoHDRSuspended"));
  }
}

- (BOOL)isVideoHDRSuspended
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVCaptureFigVideoDevice_isVideoHDRSuspended__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)serializedProcessingSettings
{
  return -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04D80]);
}

- (int)figCaptureSourcePosition
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048B0]), "intValue");
}

- (void)_populateSupportedFallbackPrimaryConstituentDevices
{
  id v3;
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04DB8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = -[AVCaptureDevice constituentDevices](self, "constituentDevices");
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v4, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "figCaptureSourceDeviceType"))))objc_msgSend(v3, "addObject:", v10);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    v11 = (void *)objc_msgSend(v3, "copy");
    self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions = (unint64_t)v11;
    if (!self->_supportedFallbackPrimaryConstituentDevices)
      self->_supportedFallbackPrimaryConstituentDevices = (NSArray *)v11;

  }
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_11(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1259) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

_QWORD *__40__AVCaptureFigVideoDevice_setFlashMode___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (!*(_BYTE *)(v1 + 768))
  {
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = 0;
    v1 = result[4];
  }
  *(_QWORD *)(v1 + 736) = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  *(_BYTE *)(result[4] + 744) = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) == 2;
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = *(_BYTE *)(result[4] + 744);
  *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) = *(_BYTE *)(result[4] + 745);
  return result;
}

- (void)setWhiteBalanceMode:(int64_t)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  if (-[AVCaptureFigVideoDevice isWhiteBalanceModeSupported:](self, "isWhiteBalanceModeSupported:"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__AVCaptureFigVideoDevice_setWhiteBalanceMode___block_invoke;
    block[3] = &unk_1E4217C18;
    block[4] = self;
    block[5] = &v12;
    block[6] = a3;
    dispatch_sync(devicePropsQueue, block);
    if (*((_DWORD *)v13 + 6) == -16452)
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      objc_opt_class();
      v7 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v7);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
    }
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    v10 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithClassAndSelector(), 0, a3);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v10);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
  }
}

- (BOOL)isWhiteBalanceModeSupported:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 | 2) == 2)
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04948], v3, v4), "BOOLValue");
  else
    return 0;
}

- (BOOL)isAdjustingFocus
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_isAdjustingFocus__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isRampingVideoZoom
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVCaptureFigVideoDevice_isRampingVideoZoom__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__AVCaptureFigVideoDevice__setActiveVideoMaxFrameDurationInternal___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  CMTime *v5;
  CMTime *v6;
  _QWORD *v7;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  void *v11;
  void *v12;
  CMTime *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  CMTime *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  CMTime *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  int32_t v27;
  uint64_t v28;
  __int128 *v29;
  __int128 v30;
  __int128 *v31;
  __int128 v32;
  uint64_t result;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  CMTime v38;
  __int128 v39;
  uint64_t v40;
  CMTime v41;
  __int128 v42;
  uint64_t v43;
  CMTime v44;
  os_log_type_t type;
  int v46;
  _QWORD v47[3];
  CMTime v48;
  _QWORD v49[3];
  CMTime time2;
  CMTime v51;
  CMTime time1;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if ((!*(_BYTE *)(v2 + 1212) || !*(_BYTE *)(v2 + 1213)) && !*(_BYTE *)(v2 + 1299))
    goto LABEL_21;
  v3 = (void *)objc_msgSend(*(id *)(v2 + 144), "videoFrameRateRangeForCenterStage");
  v4 = v3;
  v5 = (CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
  if (v3)
    objc_msgSend(v3, "minFrameDuration");
  else
    memset(&time2, 0, sizeof(time2));
  time1 = *v5;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    if (v4)
    {
      v7 = v49;
      objc_msgSend(v4, "minFrameDuration");
    }
    else
    {
      memset(v49, 0, sizeof(v49));
      v7 = v49;
    }
    goto LABEL_18;
  }
  v6 = (CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
  if (v4)
    objc_msgSend(v4, "maxFrameDuration");
  else
    memset(&v48, 0, sizeof(v48));
  time1 = *v6;
  if (CMTimeCompare(&time1, &v48) >= 1)
  {
    if (v4)
    {
      v7 = v47;
      objc_msgSend(v4, "maxFrameDuration");
    }
    else
    {
      memset(v47, 0, sizeof(v47));
      v7 = v47;
    }
LABEL_18:
    v8 = *(_QWORD *)(a1[5] + 8);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)v7;
    *(_QWORD *)(v8 + 48) = v7[2];
  }
  if (dword_1ECFED6C0)
  {
    v46 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_21:
  v10 = a1[4];
  if (*(_BYTE *)(v10 + 1250) && *(_BYTE *)(v10 + 1251))
  {
    v11 = (void *)objc_msgSend(*(id *)(v10 + 144), "videoFrameRateRangeForBackgroundBlur");
    v12 = v11;
    v13 = (CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
    if (v11)
      objc_msgSend(v11, "minFrameDuration");
    else
      memset(&v44, 0, sizeof(v44));
    time1 = *v13;
    if (CMTimeCompare(&time1, &v44) < 0)
    {
      if (v12)
      {
        objc_msgSend(v12, "minFrameDuration");
      }
      else
      {
        v42 = 0uLL;
        v43 = 0;
      }
      v14 = *(_QWORD *)(a1[5] + 8);
      *(_OWORD *)(v14 + 32) = v42;
      *(_QWORD *)(v14 + 48) = v43;
    }
  }
  v15 = a1[4];
  if (*(_BYTE *)(v15 + 1253) && *(_BYTE *)(v15 + 1254))
  {
    v16 = (void *)objc_msgSend(*(id *)(v15 + 144), "videoFrameRateRangeForStudioLight");
    v17 = v16;
    v18 = (CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
    if (v16)
      objc_msgSend(v16, "minFrameDuration");
    else
      memset(&v41, 0, sizeof(v41));
    time1 = *v18;
    if (CMTimeCompare(&time1, &v41) < 0)
    {
      if (v17)
      {
        objc_msgSend(v17, "minFrameDuration");
      }
      else
      {
        v39 = 0uLL;
        v40 = 0;
      }
      v19 = *(_QWORD *)(a1[5] + 8);
      *(_OWORD *)(v19 + 32) = v39;
      *(_QWORD *)(v19 + 48) = v40;
    }
  }
  v20 = a1[4];
  if (*(_BYTE *)(v20 + 1259) && *(_BYTE *)(v20 + 1260))
  {
    v21 = (void *)objc_msgSend(*(id *)(v20 + 144), "videoFrameRateRangeForBackgroundReplacement");
    v22 = v21;
    v23 = (CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
    if (v21)
      objc_msgSend(v21, "minFrameDuration");
    else
      memset(&v38, 0, sizeof(v38));
    time1 = *v23;
    if (CMTimeCompare(&time1, &v38) < 0)
    {
      if (v22)
      {
        objc_msgSend(v22, "minFrameDuration");
      }
      else
      {
        v36 = 0uLL;
        v37 = 0;
      }
      v24 = *(_QWORD *)(a1[5] + 8);
      *(_OWORD *)(v24 + 32) = v36;
      *(_QWORD *)(v24 + 48) = v37;
    }
  }
  v25 = a1[4];
  if ((*(_BYTE *)(v25 + 212) & 1) != 0)
  {
    time1 = *(CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
    v26 = *(_OWORD *)(v25 + 200);
    v51.epoch = *(_QWORD *)(v25 + 216);
    *(_OWORD *)&v51.value = v26;
    v27 = CMTimeCompare(&time1, &v51);
    v25 = a1[4];
    if (v27 < 0)
    {
      v28 = *(_QWORD *)(a1[5] + 8);
      v29 = (__int128 *)(v25 + 200);
      v30 = *v29;
      *(_QWORD *)(v28 + 48) = *((_QWORD *)v29 + 2);
      *(_OWORD *)(v28 + 32) = v30;
      v25 = a1[4];
    }
  }
  v31 = (__int128 *)(v25 + 280);
  time1 = *(CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
  v32 = *v31;
  v51.epoch = *((_QWORD *)v31 + 2);
  *(_OWORD *)&v51.value = v32;
  result = CMTimeCompare(&time1, &v51);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_DWORD)result != 0;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v34 = *(_QWORD *)(a1[5] + 8);
    v35 = *(_OWORD *)(a1[4] + 232);
    time1.epoch = *(_QWORD *)(a1[4] + 248);
    *(_OWORD *)&time1.value = v35;
    v51 = *(CMTime *)(v34 + 32);
    result = CMTimeCompare(&time1, &v51);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = (int)result > 0;
  }
  return result;
}

- (BOOL)isHEVCSupported
{
  int BoolAnswer;

  BoolAnswer = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureAppsMayUseHEVC"));
  if (BoolAnswer)
    LOBYTE(BoolAnswer) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04850]), "BOOLValue");
  return BoolAnswer;
}

- (BOOL)isProResSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048C8]), "BOOLValue");
}

- (BOOL)isHEVCPreferred
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048B8]), "BOOLValue");
}

void __52__AVCaptureFigVideoDevice_setActiveDepthDataFormat___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152)) & 1) == 0)
  {
    v2 = *(id *)(a1 + 32);

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152) = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)preferredPrimaryConstituentDevice
{
  NSObject *devicePropsQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  if (-[AVCaptureFigVideoDevice _isBravoVariant](self, "_isBravoVariant"))
  {
    devicePropsQueue = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__AVCaptureFigVideoDevice_preferredPrimaryConstituentDevice__block_invoke;
    v6[3] = &unk_1E4217A60;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(devicePropsQueue, v6);
  }
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

__n128 __54__AVCaptureFigVideoDevice_activeVideoMinFrameDuration__block_invoke(uint64_t a1)
{
  __n128 *v2;
  unint64_t v3;
  __n128 result;
  uint64_t v5;
  CMTime *v6;
  void *v7;
  CMTime *v8;
  void *v9;
  void *v10;
  __n128 *v11;
  void *v12;
  __n128 *v13;
  uint64_t v14;
  CMTime *v15;
  void *v16;
  CMTime *v17;
  void *v18;
  void *v19;
  __n128 *v20;
  void *v21;
  __n128 *v22;
  uint64_t v23;
  CMTime *v24;
  void *v25;
  CMTime *v26;
  void *v27;
  void *v28;
  __n128 *v29;
  void *v30;
  __n128 *v31;
  uint64_t v32;
  CMTime *v33;
  void *v34;
  CMTime *v35;
  void *v36;
  void *v37;
  __n128 *v38;
  void *v39;
  __n128 *v40;
  _QWORD v41[3];
  CMTime v42;
  _QWORD v43[3];
  CMTime v44;
  _QWORD v45[3];
  CMTime v46;
  _QWORD v47[3];
  CMTime v48;
  _QWORD v49[3];
  CMTime v50;
  _QWORD v51[3];
  CMTime v52;
  _QWORD v53[3];
  CMTime v54;
  _QWORD v55[3];
  CMTime time1;
  CMTime time2;

  v2 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248);
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 232);
  v2[2] = result;
  v2[3].n128_u64[0] = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 1212) && *(_BYTE *)(v5 + 1213) || *(_BYTE *)(v5 + 1299))
  {
    v6 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v7 = (void *)objc_msgSend(*(id *)(v5 + 144), "videoFrameRateRangeForCenterStage");
    if (v7)
      objc_msgSend(v7, "minFrameDuration");
    else
      memset(&time2, 0, sizeof(time2));
    time1 = *v6;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
      if (v10)
      {
        v11 = (__n128 *)v55;
        objc_msgSend(v10, "minFrameDuration");
      }
      else
      {
        memset(v55, 0, sizeof(v55));
        v11 = (__n128 *)v55;
      }
      goto LABEL_18;
    }
    v8 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
    if (v9)
      objc_msgSend(v9, "maxFrameDuration");
    else
      memset(&v54, 0, sizeof(v54));
    time1 = *v8;
    if (CMTimeCompare(&time1, &v54) >= 1)
    {
      v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
      if (v12)
      {
        v11 = (__n128 *)v53;
        objc_msgSend(v12, "maxFrameDuration");
      }
      else
      {
        memset(v53, 0, sizeof(v53));
        v11 = (__n128 *)v53;
      }
LABEL_18:
      v13 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
      result = *v11;
      v13[2] = *v11;
      v13[3].n128_u64[0] = v11[1].n128_u64[0];
    }
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v14 + 1250) && *(_BYTE *)(v14 + 1251))
  {
    v15 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v16 = (void *)objc_msgSend(*(id *)(v14 + 144), "videoFrameRateRangeForBackgroundBlur");
    if (v16)
      objc_msgSend(v16, "minFrameDuration");
    else
      memset(&v52, 0, sizeof(v52));
    time1 = *v15;
    if (CMTimeCompare(&time1, &v52) < 0)
    {
      v19 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
      if (v19)
      {
        v20 = (__n128 *)v51;
        objc_msgSend(v19, "minFrameDuration");
      }
      else
      {
        memset(v51, 0, sizeof(v51));
        v20 = (__n128 *)v51;
      }
      goto LABEL_35;
    }
    v17 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v18 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
    if (v18)
      objc_msgSend(v18, "maxFrameDuration");
    else
      memset(&v50, 0, sizeof(v50));
    time1 = *v17;
    if (CMTimeCompare(&time1, &v50) >= 1)
    {
      v21 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
      if (v21)
      {
        v20 = (__n128 *)v49;
        objc_msgSend(v21, "maxFrameDuration");
      }
      else
      {
        memset(v49, 0, sizeof(v49));
        v20 = (__n128 *)v49;
      }
LABEL_35:
      v22 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
      result = *v20;
      v22[2] = *v20;
      v22[3].n128_u64[0] = v20[1].n128_u64[0];
    }
  }
  v23 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v23 + 1253) && *(_BYTE *)(v23 + 1254))
  {
    v24 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v25 = (void *)objc_msgSend(*(id *)(v23 + 144), "videoFrameRateRangeForStudioLight");
    if (v25)
      objc_msgSend(v25, "minFrameDuration");
    else
      memset(&v48, 0, sizeof(v48));
    time1 = *v24;
    if (CMTimeCompare(&time1, &v48) < 0)
    {
      v28 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
      if (v28)
      {
        v29 = (__n128 *)v47;
        objc_msgSend(v28, "minFrameDuration");
      }
      else
      {
        memset(v47, 0, sizeof(v47));
        v29 = (__n128 *)v47;
      }
      goto LABEL_52;
    }
    v26 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v27 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
    if (v27)
      objc_msgSend(v27, "maxFrameDuration");
    else
      memset(&v46, 0, sizeof(v46));
    time1 = *v26;
    if (CMTimeCompare(&time1, &v46) >= 1)
    {
      v30 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
      if (v30)
      {
        v29 = (__n128 *)v45;
        objc_msgSend(v30, "maxFrameDuration");
      }
      else
      {
        memset(v45, 0, sizeof(v45));
        v29 = (__n128 *)v45;
      }
LABEL_52:
      v31 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
      result = *v29;
      v31[2] = *v29;
      v31[3].n128_u64[0] = v29[1].n128_u64[0];
    }
  }
  v32 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v32 + 1259) && *(_BYTE *)(v32 + 1260))
  {
    v33 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v34 = (void *)objc_msgSend(*(id *)(v32 + 144), "videoFrameRateRangeForBackgroundReplacement");
    if (v34)
      objc_msgSend(v34, "minFrameDuration");
    else
      memset(&v44, 0, sizeof(v44));
    time1 = *v33;
    if (CMTimeCompare(&time1, &v44) < 0)
    {
      v37 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
      if (v37)
      {
        v38 = (__n128 *)v43;
        objc_msgSend(v37, "minFrameDuration");
      }
      else
      {
        memset(v43, 0, sizeof(v43));
        v38 = (__n128 *)v43;
      }
      goto LABEL_69;
    }
    v35 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v36 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
    if (v36)
      objc_msgSend(v36, "maxFrameDuration");
    else
      memset(&v42, 0, sizeof(v42));
    time1 = *v35;
    if (CMTimeCompare(&time1, &v42) >= 1)
    {
      v39 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
      if (v39)
      {
        v38 = (__n128 *)v41;
        objc_msgSend(v39, "maxFrameDuration");
      }
      else
      {
        memset(v41, 0, sizeof(v41));
        v38 = (__n128 *)v41;
      }
LABEL_69:
      v40 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
      result = *v38;
      v40[2] = *v38;
      v40[3].n128_u64[0] = v38[1].n128_u64[0];
    }
  }
  return result;
}

float __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_5(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 360) = result;
  return result;
}

- (void)_updateGesturesEnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__AVCaptureFigVideoDevice__updateGesturesEnabled___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

+ (id)_devicesWithPriorRegisteredDevices:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, id *);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[AVCaptureDevice setUpCenterStageStateOnce](AVCaptureDevice, "setUpCenterStageStateOnce");
  +[AVCaptureDevice setUpBackgroundBlurStateOnce](AVCaptureDevice, "setUpBackgroundBlurStateOnce");
  +[AVCaptureDevice setUpStudioLightingStateOnce](AVCaptureDevice, "setUpStudioLightingStateOnce");
  +[AVCaptureDevice setUpReactionEffectsStateOnce](AVCaptureDevice, "setUpReactionEffectsStateOnce");
  +[AVCaptureDevice setUpBackgroundReplacementStateOnce](AVCaptureDevice, "setUpBackgroundReplacementStateOnce");
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = +[AVCaptureFigVideoDevice _newFigCaptureSources](AVCaptureFigVideoDevice, "_newFigCaptureSources");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    v20 = *MEMORY[0x1E0D04BB0];
    v19 = *MEMORY[0x1E0C9AE00];
    v22 = *MEMORY[0x1E0D04910];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(a3, "count"))
        {
          v28 = 0;
          v9 = *(void (**)(uint64_t, uint64_t, uint64_t, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
          if (v9)
            v9(v8, v20, v19, &v28);
          v10 = (id)objc_msgSend(v28, "objectForKeyedSubscript:", v22);

          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v25;
LABEL_11:
            v14 = 0;
            while (1)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(a3);
              v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
              if ((objc_msgSend((id)objc_msgSend(v15, "uniqueID"), "isEqualToString:", v10) & 1) != 0)
                break;
              if (v12 == ++v14)
              {
                v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
                if (v12)
                  goto LABEL_11;
                goto LABEL_17;
              }
            }
            v16 = v15;

            if (v16)
              goto LABEL_20;
          }
          else
          {
LABEL_17:

          }
        }
        v16 = -[AVCaptureFigVideoDevice _initWithFigCaptureSource:isProxy:]([AVCaptureFigVideoDevice alloc], "_initWithFigCaptureSource:isProxy:", v8, 0);
LABEL_20:
        objc_msgSend(v23, "addObject:", v16);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v5);
  }
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("_orderInDevicesArray"), 1));
  objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("position"), 1));
  return (id)objc_msgSend(v23, "sortedArrayUsingDescriptors:", v17);
}

+ (id)_newFigCaptureSources
{
  id result;
  char i;
  char v4;

  if ((AVCaptureIsRunningInMediaserverd() & 1) != 0)
    return (id)FigCaptureSourceCopySources();
  result = (id)FigCaptureSourceRemoteCopyCaptureSources();
  if (!result)
  {
    for (i = 1; ; i = 0)
    {
      v4 = i;
      result = (id)FigCaptureSourceRemoteCopyCaptureSources();
      if (result)
        break;
      usleep(0x3D090u);
      if ((v4 & 1) == 0)
        return 0;
    }
  }
  return result;
}

_QWORD *__77__AVCaptureFigVideoDevice__setFigCaptureSource_allowSendingWorkToMainThread___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, id *);
  int v7;
  int v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  const void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v1 = result[5];
  v2 = *(_QWORD *)(result[4] + 56);
  if (v1 != v2)
  {
    v3 = result;
    if (v2)
    {
      if (v1 && (AVCaptureIsRunningInMediaserverd() & 1) == 0)
      {
        v14 = 0;
        v4 = *(_QWORD *)(v3[4] + 56);
        v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
        if (v5)
        {
          if (!v5(v4, *MEMORY[0x1E0D04E40], *MEMORY[0x1E0C9AE00], &v14) && v14 != 0)
          {
            v7 = objc_msgSend(v14, "intValue");
            if (v7 >= 1)
            {
              v8 = v7;
              do
              {
                v9 = v3[5];
                v10 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
                if (v10)
                  v10(v9);
                --v8;
              }
              while (v8);
            }
          }
        }

      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", *(_QWORD *)(v3[4] + 1024), fvd_figCaptureSourceNotificationHandler, 0, *(_QWORD *)(v3[4] + 56));
      v11 = *(const void **)(v3[4] + 56);
      if (v11)
      {
        CFRelease(v11);
        *(_QWORD *)(v3[4] + 56) = 0;
      }
      if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0 || !*((_BYTE *)v3 + 48))
      {
        objc_msgSend((id)v3[4], "_drainManualControlRequestQueues");
      }
      else
      {
        v12 = (void *)v3[4];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __77__AVCaptureFigVideoDevice__setFigCaptureSource_allowSendingWorkToMainThread___block_invoke_2;
        v13[3] = &unk_1E42165A8;
        v13[4] = v12;
        objc_msgSend(v12, "_performBlockOnMainThread:", v13);
      }
    }
    result = (_QWORD *)v3[5];
    if (result)
    {
      *(_QWORD *)(v3[4] + 56) = CFRetain(result);
      return (_QWORD *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", *(_QWORD *)(v3[4] + 1024), fvd_figCaptureSourceNotificationHandler, 0, v3[5], 0);
    }
  }
  return result;
}

uint64_t __67__AVCaptureFigVideoDevice__setActiveVideoMinFrameDurationInternal___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  CMTime *v5;
  CMTime *v6;
  _QWORD *v7;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  void *v11;
  void *v12;
  CMTime *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CMTime *v25;
  uint64_t v26;
  NSObject *v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  CMTime *v37;
  uint64_t v38;
  NSObject *v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  __int128 v47;
  int32_t v48;
  uint64_t v49;
  __int128 *v50;
  __int128 v51;
  __int128 *v52;
  __int128 v53;
  uint64_t result;
  uint64_t v55;
  __int128 v56;
  int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  CMTime v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  CMTime v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  CMTime v93;
  os_log_type_t type;
  unsigned int v95;
  _QWORD v96[3];
  CMTime v97;
  _QWORD v98[3];
  CMTime time2;
  CMTime v100;
  int v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  CMTime time1;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if ((!*(_BYTE *)(v2 + 1212) || !*(_BYTE *)(v2 + 1213)) && !*(_BYTE *)(v2 + 1299))
    goto LABEL_21;
  v3 = (void *)objc_msgSend(*(id *)(v2 + 144), "videoFrameRateRangeForCenterStage");
  v4 = v3;
  v5 = (CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
  if (v3)
    objc_msgSend(v3, "minFrameDuration");
  else
    memset(&time2, 0, sizeof(time2));
  time1 = *v5;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    if (v4)
    {
      v7 = v98;
      objc_msgSend(v4, "minFrameDuration");
    }
    else
    {
      memset(v98, 0, sizeof(v98));
      v7 = v98;
    }
    goto LABEL_18;
  }
  v6 = (CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
  if (v4)
    objc_msgSend(v4, "maxFrameDuration");
  else
    memset(&v97, 0, sizeof(v97));
  time1 = *v6;
  if (CMTimeCompare(&time1, &v97) >= 1)
  {
    if (v4)
    {
      v7 = v96;
      objc_msgSend(v4, "maxFrameDuration");
    }
    else
    {
      memset(v96, 0, sizeof(v96));
      v7 = v96;
    }
LABEL_18:
    v8 = *(_QWORD *)(a1[5] + 8);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)v7;
    *(_QWORD *)(v8 + 48) = v7[2];
  }
  if (dword_1ECFED6C0)
  {
    v95 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_21:
  v10 = a1[4];
  if (*(_BYTE *)(v10 + 1250) && *(_BYTE *)(v10 + 1251))
  {
    v11 = (void *)objc_msgSend(*(id *)(v10 + 144), "videoFrameRateRangeForBackgroundBlur");
    v12 = v11;
    v13 = (CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
    if (v11)
      objc_msgSend(v11, "minFrameDuration");
    else
      memset(&v93, 0, sizeof(v93));
    time1 = *v13;
    if (CMTimeCompare(&time1, &v93) < 0)
    {
      if (v12)
      {
        objc_msgSend(v12, "minFrameDuration");
      }
      else
      {
        v91 = 0uLL;
        v92 = 0;
      }
      v14 = *(_QWORD *)(a1[5] + 8);
      *(_OWORD *)(v14 + 32) = v91;
      *(_QWORD *)(v14 + 48) = v92;
    }
    if (dword_1ECFED6C0)
    {
      v95 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v16 = v95;
      if (os_log_type_enabled(v15, type))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if (v17)
      {
        if (v12)
        {
          objc_msgSend(v12, "maxFrameDuration");
          v18 = v88;
          objc_msgSend(v12, "maxFrameDuration");
          v19 = v86;
          objc_msgSend(v12, "minFrameDuration");
          v20 = v82;
          objc_msgSend(v12, "minFrameDuration");
          v21 = v80;
        }
        else
        {
          v21 = 0;
          v20 = 0;
          v18 = 0;
          v19 = 0;
          v88 = 0;
          v89 = 0;
          v90 = 0;
          v86 = 0;
          v87 = 0;
          v84 = 0;
          v85 = 0;
          v82 = 0;
          v83 = 0;
          v80 = 0;
          v81 = 0;
          v79 = 0;
        }
        LODWORD(v100.value) = 136316162;
        *(CMTimeValue *)((char *)&v100.value + 4) = (CMTimeValue)"-[AVCaptureFigVideoDevice _setActiveVideoMinFrameDurati"
                                                                 "onInternal:]_block_invoke";
        LOWORD(v100.flags) = 2048;
        *(_QWORD *)((char *)&v100.flags + 2) = v18;
        HIWORD(v100.epoch) = 1024;
        v101 = v19;
        v102 = 2048;
        v103 = v20;
        v104 = 1024;
        LODWORD(v105) = v21;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v22 = a1[4];
  if (*(_BYTE *)(v22 + 1253) && *(_BYTE *)(v22 + 1254))
  {
    v23 = (void *)objc_msgSend(*(id *)(v22 + 144), "videoFrameRateRangeForStudioLight");
    v24 = v23;
    v25 = (CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
    if (v23)
      objc_msgSend(v23, "minFrameDuration");
    else
      memset(&v78, 0, sizeof(v78));
    time1 = *v25;
    if (CMTimeCompare(&time1, &v78) < 0)
    {
      if (v24)
      {
        objc_msgSend(v24, "minFrameDuration");
      }
      else
      {
        v76 = 0uLL;
        v77 = 0;
      }
      v26 = *(_QWORD *)(a1[5] + 8);
      *(_OWORD *)(v26 + 32) = v76;
      *(_QWORD *)(v26 + 48) = v77;
    }
    if (dword_1ECFED6C0)
    {
      v95 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v28 = v95;
      if (os_log_type_enabled(v27, type))
        v29 = v28;
      else
        v29 = v28 & 0xFFFFFFFE;
      if (v29)
      {
        if (v24)
        {
          objc_msgSend(v24, "maxFrameDuration");
          v30 = v73;
          objc_msgSend(v24, "maxFrameDuration");
          v31 = v71;
          objc_msgSend(v24, "minFrameDuration");
          v32 = v67;
          objc_msgSend(v24, "minFrameDuration");
          v33 = v65;
        }
        else
        {
          v33 = 0;
          v32 = 0;
          v30 = 0;
          v31 = 0;
          v73 = 0;
          v74 = 0;
          v75 = 0;
          v71 = 0;
          v72 = 0;
          v69 = 0;
          v70 = 0;
          v67 = 0;
          v68 = 0;
          v65 = 0;
          v66 = 0;
          v64 = 0;
        }
        LODWORD(v100.value) = 136316162;
        *(CMTimeValue *)((char *)&v100.value + 4) = (CMTimeValue)"-[AVCaptureFigVideoDevice _setActiveVideoMinFrameDurati"
                                                                 "onInternal:]_block_invoke";
        LOWORD(v100.flags) = 2048;
        *(_QWORD *)((char *)&v100.flags + 2) = v30;
        HIWORD(v100.epoch) = 1024;
        v101 = v31;
        v102 = 2048;
        v103 = v32;
        v104 = 1024;
        LODWORD(v105) = v33;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v34 = a1[4];
  if (*(_BYTE *)(v34 + 1259) && *(_BYTE *)(v34 + 1260))
  {
    v35 = (void *)objc_msgSend(*(id *)(v34 + 144), "videoFrameRateRangeForBackgroundReplacement");
    v36 = v35;
    v37 = (CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
    if (v35)
      objc_msgSend(v35, "minFrameDuration");
    else
      memset(&v63, 0, sizeof(v63));
    time1 = *v37;
    if (CMTimeCompare(&time1, &v63) < 0)
    {
      if (v36)
      {
        objc_msgSend(v36, "minFrameDuration");
      }
      else
      {
        v61 = 0uLL;
        v62 = 0;
      }
      v38 = *(_QWORD *)(a1[5] + 8);
      *(_OWORD *)(v38 + 32) = v61;
      *(_QWORD *)(v38 + 48) = v62;
    }
    if (dword_1ECFED6C0)
    {
      v95 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v40 = v95;
      if (os_log_type_enabled(v39, type))
        v41 = v40;
      else
        v41 = v40 & 0xFFFFFFFE;
      if (v41)
      {
        if (v36)
        {
          objc_msgSend(v36, "maxFrameDuration");
          v42 = v60;
          objc_msgSend(v36, "maxFrameDuration");
          v43 = v59;
          objc_msgSend(v36, "minFrameDuration");
          v44 = v58;
          objc_msgSend(v36, "minFrameDuration");
          v45 = v57;
        }
        else
        {
          v45 = 0;
          v44 = 0;
          v42 = 0;
          v43 = 0;
        }
        LODWORD(v100.value) = 136316162;
        *(CMTimeValue *)((char *)&v100.value + 4) = (CMTimeValue)"-[AVCaptureFigVideoDevice _setActiveVideoMinFrameDurati"
                                                                 "onInternal:]_block_invoke";
        LOWORD(v100.flags) = 2048;
        *(_QWORD *)((char *)&v100.flags + 2) = v42;
        HIWORD(v100.epoch) = 1024;
        v101 = v43;
        v102 = 2048;
        v103 = v44;
        v104 = 1024;
        LODWORD(v105) = v45;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v46 = a1[4];
  if ((*(_BYTE *)(v46 + 212) & 1) != 0)
  {
    time1 = *(CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
    v47 = *(_OWORD *)(v46 + 200);
    v100.epoch = *(_QWORD *)(v46 + 216);
    *(_OWORD *)&v100.value = v47;
    v48 = CMTimeCompare(&time1, &v100);
    v46 = a1[4];
    if (v48 < 0)
    {
      v49 = *(_QWORD *)(a1[5] + 8);
      v50 = (__int128 *)(v46 + 200);
      v51 = *v50;
      *(_QWORD *)(v49 + 48) = *((_QWORD *)v50 + 2);
      *(_OWORD *)(v49 + 32) = v51;
      v46 = a1[4];
    }
  }
  v52 = (__int128 *)(v46 + 232);
  time1 = *(CMTime *)(*(_QWORD *)(a1[5] + 8) + 32);
  v53 = *v52;
  v100.epoch = *((_QWORD *)v52 + 2);
  *(_OWORD *)&v100.value = v53;
  result = CMTimeCompare(&time1, &v100);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_DWORD)result != 0;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v55 = *(_QWORD *)(a1[5] + 8);
    v56 = *(_OWORD *)(a1[4] + 280);
    time1.epoch = *(_QWORD *)(a1[4] + 296);
    *(_OWORD *)&time1.value = v56;
    v100 = *(CMTime *)(v55 + 32);
    result = CMTimeCompare(&time1, &v100);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = (int)result < 0;
  }
  return result;
}

- (BOOL)isStillImageStabilizationScene
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__AVCaptureFigVideoDevice_isStillImageStabilizationScene__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

__n128 __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_2(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(a1 + 32) + 232);
  v2 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v3 = v2[3].n128_u64[0];
  result = v2[2];
  *v1 = result;
  v1[1].n128_u64[0] = v3;
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

uint64_t __72__AVCaptureFigVideoDevice_setFaceDetectionDrivenImageProcessingEnabled___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 800) = *(_DWORD *)(result + 40);
  return result;
}

uint64_t __66__AVCaptureFigVideoDevice_setAutomaticallyAdjustsVideoHDREnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 844) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __62__AVCaptureFigVideoDevice__setIsStillImageStabilizationScene___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 848) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __56__AVCaptureFigVideoDevice_setSpatialOverCaptureEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1141) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __56__AVCaptureFigVideoDevice_setNonDestructiveCropEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1142) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(float *)(result + 48) != *(float *)(*(_QWORD *)(result + 32) + 360);
  return result;
}

- (BOOL)isFaceDetectionDrivenImageProcessingEnabled
{
  return *(_DWORD *)&self->_torchAvailable == 3;
}

uint64_t __61__AVCaptureFigVideoDevice_isFlashSceneDetectedForPhotoOutput__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 747);
  return result;
}

uint64_t __59__AVCaptureFigVideoDevice_isHDRSceneDetectedForPhotoOutput__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 847);
  return result;
}

double __54__AVCaptureFigVideoDevice_minAvailableVideoZoomFactor__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 880);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __51__AVCaptureFigVideoDevice_stereoVideoCaptureStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 928);
  return result;
}

uint64_t __47__AVCaptureFigVideoDevice_setDigitalFlashMode___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1169);
  return result;
}

float __47__AVCaptureFigVideoDevice__setVideoZoomFactor___block_invoke(uint64_t a1)
{
  float result;

  result = *(double *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 864) = result;
  return result;
}

uint64_t __43__AVCaptureFigVideoDevice_isTorchAvailable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 792);
  return result;
}

uint64_t __43__AVCaptureFigVideoDevice_isFlashAvailable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 768);
  return result;
}

uint64_t __43__AVCaptureFigVideoDevice_imageControlMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 728);
  return result;
}

- (BOOL)isResponsiveCaptureWithDepthSupported
{
  id v2;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047E8]);
  return objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D04080]), "BOOLValue");
}

- (BOOL)isHEIFSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04848]), "BOOLValue");
}

- (void)setDigitalFlashMode:(int64_t)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if ((objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isDigitalFlashSupported") & 1) != 0)
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v13 = 0;
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__AVCaptureFigVideoDevice_setDigitalFlashMode___block_invoke;
      block[3] = &unk_1E4217A60;
      block[4] = self;
      block[5] = &v10;
      dispatch_sync(devicePropsQueue, block);
      if (a3)
      {
        if (*((_BYTE *)v11 + 24))
        {
          -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("globalToneMappingEnabled"));
          -[AVCaptureFigVideoDevice _setGlobalToneMappingEnabledInternal:](self, "_setGlobalToneMappingEnabledInternal:", 0);
          -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("globalToneMappingEnabled"));
        }
      }
      -[AVCaptureFigVideoDevice _setDigitalFlashModeInternal:](self, "_setDigitalFlashModeInternal:", a3);
      _Block_object_dispose(&v10, 8);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

- (BOOL)isPreviewQualityAdjustedPhotoFilterRenderingSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048C0]), "BOOLValue");
}

- (BOOL)isLensStabilizationSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048E8]), "BOOLValue");
}

- (void)_setDigitalFlashModeInternal:(int64_t)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[6];

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__AVCaptureFigVideoDevice__setDigitalFlashModeInternal___block_invoke;
  v4[3] = &unk_1E4216650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (id)supportedMetadataObjectIdentifiers
{
  id result;
  id v4;
  void *v5;
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
  result = self->_weakReference;
  if (!result)
  {
    v4 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04BD8]);
    self->_weakReference = (AVWeakReference *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = (void *)objc_msgSend(v4, "allValues");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[AVWeakReference addObjectsFromArray:](self->_weakReference, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    return self->_weakReference;
  }
  return result;
}

id __46__AVCaptureFigVideoDevice_systemPressureState__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 1128);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  __int128 v11;
  CMTime v12;
  CMTime time1;
  CMTime v14;

  v1 = *(_QWORD *)(result + 32) + 432;
  v2 = *(_QWORD *)(result + 72);
  *(_OWORD *)v1 = *(_OWORD *)(result + 56);
  *(_QWORD *)(v1 + 16) = v2;
  v3 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v3 + 424) == 3)
  {
    v4 = (_QWORD *)result;
    v5 = (double)*(int *)(result + 64) / (double)*(uint64_t *)(result + 56) + 0.05;
    if (v5 < (double)*(int *)(v3 + 288) / (double)*(uint64_t *)(v3 + 280))
    {
      v6 = floor(v5);
      v7 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 144), "videoSupportedFrameRateRanges"), "objectAtIndexedSubscript:", 0);
      objc_msgSend(v7, "minFrameRate");
      if (v6 < v8)
      {
        objc_msgSend(v7, "minFrameRate");
        v6 = v9;
      }
      CMTimeMake(&v14, 1, (int)v6);
      *(CMTime *)(*(_QWORD *)(v4[5] + 8) + 32) = v14;
      v10 = v4[4] + 280;
      time1 = *(CMTime *)(*(_QWORD *)(v4[5] + 8) + 32);
      v11 = *(_OWORD *)v10;
      v12.epoch = *(_QWORD *)(v10 + 16);
      *(_OWORD *)&v12.value = v11;
      result = CMTimeCompare(&time1, &v12);
      if ((_DWORD)result)
        *(_BYTE *)(*(_QWORD *)(v4[6] + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_3(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 336) = 0;
  return result;
}

uint64_t __67__AVCaptureFigVideoDevice_setExposureTargetBias_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t result;
  AVCaptureDeviceControlRequest *v4;
  double v5;
  OpaqueCMClock *HostTimeClock;
  double v7;
  uint64_t v8;
  CMTime v9;
  CMTime v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[53] != 3)
  {
    v4 = +[AVCaptureDeviceControlRequest deviceControlRequestWithCompletionBlock:](AVCaptureDeviceControlRequest, "deviceControlRequestWithCompletionBlock:", *(_QWORD *)(a1 + 40));
    v11[0] = *MEMORY[0x1E0D049F0];
    LODWORD(v7) = *(_DWORD *)(a1 + 64);
    v12[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v11[1] = *MEMORY[0x1E0D049F8];
    v12[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[AVCaptureDeviceControlRequest requestID](v4, "requestID"));
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04C98], v8);
    -[AVCaptureDeviceControlRequest setErrorCode:](v4, "setErrorCode:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "enqueueRequest:", v4);
  }
  result = objc_msgSend(v2, "isLockedForConfiguration");
  if ((_DWORD)result)
  {
    v4 = +[AVCaptureDeviceControlRequest deviceControlRequestWithCompletionBlock:](AVCaptureDeviceFakeBiasControlRequest, "deviceControlRequestWithCompletionBlock:", *(_QWORD *)(a1 + 40));
    LODWORD(v5) = *(_DWORD *)(a1 + 64);
    -[AVCaptureDeviceControlRequest setFakeBias:](v4, "setFakeBias:", v5);
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&v10, HostTimeClock);
    v9 = v10;
    -[AVCaptureDeviceControlRequest setFakeBiasCompletionTime:](v4, "setFakeBiasCompletionTime:", &v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "enqueueRequest:", v4);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -16452;
  return result;
}

- (void)_handleManualControlCompletionForRequestQueue:(id)a3 withPayload:(id)a4
{
  int v7;
  uint64_t v8;
  void *v9;
  CMTimeEpoch v10;
  int v11;
  NSObject *devicePropsQueue;
  uint64_t v13;
  void (*v14)(uint64_t, CMTime *);
  uint64_t v15;
  __int128 v16;
  CMTime v17;
  _QWORD block[6];
  CMTime v19;

  v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A88]), "intValue");
  v8 = objc_msgSend(a3, "head");
  if (v8)
  {
    v9 = (void *)v8;
    v15 = *MEMORY[0x1E0D04A98];
    v16 = *MEMORY[0x1E0CA2E18];
    v10 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    do
    {
      *(_OWORD *)&v19.value = v16;
      v19.epoch = v10;
      v11 = objc_msgSend(v9, "requestID");
      if (!objc_msgSend(v9, "errorCode"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("exposureTargetOffset"));
          -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("exposureTargetBias"));
          devicePropsQueue = self->_devicePropsQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __85__AVCaptureFigVideoDevice__handleManualControlCompletionForRequestQueue_withPayload___block_invoke;
          block[3] = &unk_1E4216408;
          block[4] = v9;
          block[5] = self;
          dispatch_sync(devicePropsQueue, block);
          -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("exposureTargetBias"));
          -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("exposureTargetOffset"));
          objc_msgSend(v9, "fakeBiasCompletionTime");
        }
        else if (v11 <= v7)
        {
          if (v11 == v7)
          {
            CMTimeMakeFromDictionary(&v17, (CFDictionaryRef)objc_msgSend(a4, "objectForKeyedSubscript:", v15));
            v19 = v17;
          }
        }
        else if ((int)objc_msgSend(v9, "requestID") > v7)
        {
          return;
        }
      }
      if (objc_msgSend(v9, "completionBlock"))
      {
        v13 = objc_msgSend(v9, "completionBlock");
        v14 = *(void (**)(uint64_t, CMTime *))(v13 + 16);
        v17 = v19;
        v14(v13, &v17);
      }
      objc_msgSend(a3, "dequeue");
      v9 = (void *)objc_msgSend(a3, "head");
    }
    while (v9);
  }
}

uint64_t __63__AVCaptureFigVideoDevice__updateMinMaxDefaultVideoZoomFactors__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(double *)(result + 48) != *(float *)(*(_QWORD *)(result + 32) + 864);
  return result;
}

__n128 __54__AVCaptureFigVideoDevice_activeVideoMaxFrameDuration__block_invoke(uint64_t a1)
{
  __n128 *v2;
  unint64_t v3;
  __n128 result;
  uint64_t v5;
  CMTime *v6;
  void *v7;
  void *v8;
  __n128 *v9;
  CMTime *v10;
  void *v11;
  void *v12;
  __n128 *v13;
  uint64_t v14;
  CMTime *v15;
  void *v16;
  void *v17;
  __n128 *v18;
  CMTime *v19;
  void *v20;
  void *v21;
  __n128 *v22;
  uint64_t v23;
  CMTime *v24;
  void *v25;
  void *v26;
  __n128 *v27;
  CMTime *v28;
  void *v29;
  void *v30;
  __n128 *v31;
  uint64_t v32;
  CMTime *v33;
  void *v34;
  void *v35;
  __n128 *v36;
  CMTime *v37;
  void *v38;
  void *v39;
  __n128 *v40;
  _QWORD v41[3];
  CMTime v42;
  _QWORD v43[3];
  CMTime v44;
  _QWORD v45[3];
  CMTime v46;
  _QWORD v47[3];
  CMTime v48;
  _QWORD v49[3];
  CMTime v50;
  _QWORD v51[3];
  CMTime v52;
  _QWORD v53[3];
  CMTime v54;
  _QWORD v55[3];
  CMTime time1;
  CMTime time2;

  v2 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296);
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 280);
  v2[2] = result;
  v2[3].n128_u64[0] = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 1212) && *(_BYTE *)(v5 + 1213) || *(_BYTE *)(v5 + 1299))
  {
    v6 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v7 = (void *)objc_msgSend(*(id *)(v5 + 144), "videoFrameRateRangeForCenterStage");
    if (v7)
      objc_msgSend(v7, "maxFrameDuration");
    else
      memset(&time2, 0, sizeof(time2));
    time1 = *v6;
    if (CMTimeCompare(&time1, &time2) >= 1)
    {
      v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
      if (v8)
      {
        v9 = (__n128 *)v55;
        objc_msgSend(v8, "maxFrameDuration");
      }
      else
      {
        memset(v55, 0, sizeof(v55));
        v9 = (__n128 *)v55;
      }
LABEL_18:
      v13 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
      result = *v9;
      v13[2] = *v9;
      v13[3].n128_u64[0] = v9[1].n128_u64[0];
      goto LABEL_19;
    }
    v10 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v11 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
    if (v11)
      objc_msgSend(v11, "minFrameDuration");
    else
      memset(&v54, 0, sizeof(v54));
    time1 = *v10;
    if (CMTimeCompare(&time1, &v54) < 0)
    {
      v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForCenterStage");
      if (v12)
      {
        v9 = (__n128 *)v53;
        objc_msgSend(v12, "minFrameDuration");
      }
      else
      {
        memset(v53, 0, sizeof(v53));
        v9 = (__n128 *)v53;
      }
      goto LABEL_18;
    }
  }
LABEL_19:
  v14 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v14 + 1250) && *(_BYTE *)(v14 + 1251))
  {
    v15 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v16 = (void *)objc_msgSend(*(id *)(v14 + 144), "videoFrameRateRangeForBackgroundBlur");
    if (v16)
      objc_msgSend(v16, "maxFrameDuration");
    else
      memset(&v52, 0, sizeof(v52));
    time1 = *v15;
    if (CMTimeCompare(&time1, &v52) >= 1)
    {
      v17 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
      if (v17)
      {
        v18 = (__n128 *)v51;
        objc_msgSend(v17, "maxFrameDuration");
      }
      else
      {
        memset(v51, 0, sizeof(v51));
        v18 = (__n128 *)v51;
      }
LABEL_35:
      v22 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
      result = *v18;
      v22[2] = *v18;
      v22[3].n128_u64[0] = v18[1].n128_u64[0];
      goto LABEL_36;
    }
    v19 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v20 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
    if (v20)
      objc_msgSend(v20, "minFrameDuration");
    else
      memset(&v50, 0, sizeof(v50));
    time1 = *v19;
    if (CMTimeCompare(&time1, &v50) < 0)
    {
      v21 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundBlur");
      if (v21)
      {
        v18 = (__n128 *)v49;
        objc_msgSend(v21, "minFrameDuration");
      }
      else
      {
        memset(v49, 0, sizeof(v49));
        v18 = (__n128 *)v49;
      }
      goto LABEL_35;
    }
  }
LABEL_36:
  v23 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v23 + 1253) && *(_BYTE *)(v23 + 1254))
  {
    v24 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v25 = (void *)objc_msgSend(*(id *)(v23 + 144), "videoFrameRateRangeForStudioLight");
    if (v25)
      objc_msgSend(v25, "maxFrameDuration");
    else
      memset(&v48, 0, sizeof(v48));
    time1 = *v24;
    if (CMTimeCompare(&time1, &v48) >= 1)
    {
      v26 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
      if (v26)
      {
        v27 = (__n128 *)v47;
        objc_msgSend(v26, "maxFrameDuration");
      }
      else
      {
        memset(v47, 0, sizeof(v47));
        v27 = (__n128 *)v47;
      }
LABEL_52:
      v31 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
      result = *v27;
      v31[2] = *v27;
      v31[3].n128_u64[0] = v27[1].n128_u64[0];
      goto LABEL_53;
    }
    v28 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v29 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
    if (v29)
      objc_msgSend(v29, "minFrameDuration");
    else
      memset(&v46, 0, sizeof(v46));
    time1 = *v28;
    if (CMTimeCompare(&time1, &v46) < 0)
    {
      v30 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForStudioLight");
      if (v30)
      {
        v27 = (__n128 *)v45;
        objc_msgSend(v30, "minFrameDuration");
      }
      else
      {
        memset(v45, 0, sizeof(v45));
        v27 = (__n128 *)v45;
      }
      goto LABEL_52;
    }
  }
LABEL_53:
  v32 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v32 + 1259) && *(_BYTE *)(v32 + 1260))
  {
    v33 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v34 = (void *)objc_msgSend(*(id *)(v32 + 144), "videoFrameRateRangeForBackgroundReplacement");
    if (v34)
      objc_msgSend(v34, "maxFrameDuration");
    else
      memset(&v44, 0, sizeof(v44));
    time1 = *v33;
    if (CMTimeCompare(&time1, &v44) >= 1)
    {
      v35 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
      if (v35)
      {
        v36 = (__n128 *)v43;
        objc_msgSend(v35, "maxFrameDuration");
      }
      else
      {
        memset(v43, 0, sizeof(v43));
        v36 = (__n128 *)v43;
      }
LABEL_69:
      v40 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
      result = *v36;
      v40[2] = *v36;
      v40[3].n128_u64[0] = v36[1].n128_u64[0];
      return result;
    }
    v37 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v38 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
    if (v38)
      objc_msgSend(v38, "minFrameDuration");
    else
      memset(&v42, 0, sizeof(v42));
    time1 = *v37;
    if (CMTimeCompare(&time1, &v42) < 0)
    {
      v39 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "videoFrameRateRangeForBackgroundReplacement");
      if (v39)
      {
        v36 = (__n128 *)v41;
        objc_msgSend(v39, "minFrameDuration");
      }
      else
      {
        memset(v41, 0, sizeof(v41));
        v36 = (__n128 *)v41;
      }
      goto LABEL_69;
    }
  }
  return result;
}

- (void)updateStreamingDeviceHistory
{
  +[AVCaptureProprietaryDefaultsSingleton updateCameraHistory:withCameraInfo:maxLength:updateCameraHistoryDownplayOverrideList:cameraCanBeInOverrideList:](AVCaptureProprietaryDefaultsSingleton, "updateCameraHistory:withCameraInfo:maxLength:updateCameraHistoryDownplayOverrideList:cameraCanBeInOverrideList:", sStreamingCameraHistoryKey, -[AVCaptureFigVideoDevice _cameraInfo](self, "_cameraInfo"), 10, 0, 0);
}

- (id)_cameraInfo
{
  unsigned int specialDeviceType;
  uint64_t v3;
  NSString *creatorID;
  NSString *fcsUID;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  specialDeviceType = self->_specialDeviceType;
  if (specialDeviceType == 2)
  {
    v3 = 0;
  }
  else if (specialDeviceType == 3)
  {
    v3 = 1;
  }
  else if (BYTE3(self->_degradedCaptureQualityFactors))
  {
    v3 = 2;
  }
  else
  {
    v3 = 3;
  }
  creatorID = self->_creatorID;
  v7[0] = CFSTR("CreatorID");
  v7[1] = CFSTR("DeviceUID");
  fcsUID = self->_fcsUID;
  v8[0] = creatorID;
  v8[1] = fcsUID;
  v7[2] = CFSTR("OverrideRanking");
  v8[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

__n128 __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_6(uint64_t a1)
{
  __n128 *v1;
  unint64_t v2;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(a1 + 32) + 492);
  v2 = *(_QWORD *)(a1 + 56);
  result = *(__n128 *)(a1 + 40);
  *v1 = result;
  v1[1].n128_u64[0] = v2;
  return result;
}

id __58__AVCaptureFigVideoDevice_digitalFlashSceneForPhotoOutput__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 760);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setNonDestructiveCropEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  BOOL v10;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (!v3
      || (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isNonDestructiveCropSupported") & 1) != 0)
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__AVCaptureFigVideoDevice_setNonDestructiveCropEnabled___block_invoke;
      block[3] = &unk_1E4217A10;
      block[4] = self;
      v10 = v3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

- (void)setActiveFormat:(id)a3
{
  -[AVCaptureFigVideoDevice _setActiveFormat:resetVideoZoomFactorAndMinMaxFrameDurations:sessionPreset:](self, "_setActiveFormat:resetVideoZoomFactorAndMinMaxFrameDurations:sessionPreset:", a3, 1, 0);
}

- (void)_updateMinMaxDefaultVideoZoomFactors
{
  NSObject *devicePropsQueue;
  _QWORD v4[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  double v9;
  double v10;
  double v11;

  v10 = 0.0;
  v11 = 0.0;
  v9 = 0.0;
  -[AVCaptureFigVideoDevice _computeMinVideoZoomFactorOut:maxVideoZoomFactorOut:defaultVideoZoomFactorOut:centerStageActiveOverride:resetZoomFactor:](self, "_computeMinVideoZoomFactorOut:maxVideoZoomFactorOut:defaultVideoZoomFactorOut:centerStageActiveOverride:resetZoomFactor:", &v11, &v10, &v9, BYTE4(self->_degradedCaptureQualityFactors), 0);
  -[AVCaptureFigVideoDevice _setMinAvailableVideoZoomFactor:](self, "_setMinAvailableVideoZoomFactor:", v11);
  -[AVCaptureFigVideoDevice _setMaxAvailableVideoZoomFactor:](self, "_setMaxAvailableVideoZoomFactor:", v10);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__AVCaptureFigVideoDevice__updateMinMaxDefaultVideoZoomFactors__block_invoke;
  v4[3] = &unk_1E4217C18;
  *(double *)&v4[6] = v9;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(devicePropsQueue, v4);
  if (*((_BYTE *)v6 + 24))
    -[AVCaptureFigVideoDevice _setVideoZoomFactor:](self, "_setVideoZoomFactor:", v9);
  _Block_object_dispose(&v5, 8);
}

- (void)_setVideoZoomFactor:(double)a3
{
  NSObject *devicePropsQueue;
  _QWORD v6[6];

  -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoZoomFactor"));
  devicePropsQueue = self->_devicePropsQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__AVCaptureFigVideoDevice__setVideoZoomFactor___block_invoke;
  v6[3] = &unk_1E4216650;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_sync(devicePropsQueue, v6);
  -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoZoomFactor"));
}

- (void)setActiveDepthDataFormat:(id)a3
{
  NSObject *devicePropsQueue;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  _QWORD block[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (!-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    objc_opt_class();
    v8 = (void *)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    goto LABEL_10;
  }
  if ((objc_msgSend((id)objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "supportedDepthDataFormats"), "containsObject:", a3) & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    objc_opt_class();
    v8 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
LABEL_10:
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
    goto LABEL_11;
  }
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVCaptureFigVideoDevice_setActiveDepthDataFormat___block_invoke;
  block[3] = &unk_1E4217778;
  block[4] = a3;
  block[5] = self;
  block[6] = &v15;
  dispatch_sync(devicePropsQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    v12 = *MEMORY[0x1E0CA2E30];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
    v6 = -[NSArray lastObject](-[AVCaptureDeviceFormat videoSupportedFrameRateRanges](self->_activeDepthDataFormat, "videoSupportedFrameRateRanges"), "lastObject");
    if (v6)
    {
      objc_msgSend(v6, "minFrameDuration");
      v12 = v10;
      v13 = v11;
    }
    v10 = v12;
    v11 = v13;
    -[AVCaptureFigVideoDevice setActiveDepthDataMinFrameDuration:](self, "setActiveDepthDataMinFrameDuration:", &v10);
  }
LABEL_11:
  _Block_object_dispose(&v15, 8);
}

- (void)_setActiveFormat:(id)a3 resetVideoZoomFactorAndMinMaxFrameDurations:(BOOL)a4 sessionPreset:(id)a5
{
  id v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  NSObject *devicePropsQueue;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  float v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[6];
  __int128 v38;
  uint64_t v39;
  _QWORD v40[5];
  _QWORD v41[6];
  __int128 v42;
  uint64_t v43;
  _QWORD v44[6];
  _QWORD v45[6];
  _QWORD v46[6];
  _QWORD v47[6];
  _QWORD v48[6];
  _QWORD v49[6];
  _QWORD v50[6];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[6];
  _QWORD v54[6];
  _QWORD block[38];
  BOOL v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  _QWORD v61[3];
  char v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  _QWORD v67[3];
  char v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  _QWORD v73[3];
  char v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  _QWORD v79[4];
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  void (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  uint64_t v93;
  _QWORD v94[3];
  char v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  char v99;
  _QWORD v100[3];
  char v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  char v109;
  os_log_type_t type[8];
  os_log_type_t *v111;
  uint64_t v112;
  void *v113;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  char v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  char v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  char v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  void (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  uint64_t v137;
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  char v141;
  uint64_t v142;
  uint64_t *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  float *v147;
  uint64_t v148;
  int v149;
  _QWORD v150[4];
  uint64_t v151;
  double *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  double *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t v161;
  void *v162;
  __int128 v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t *v166;
  uint64_t v167;
  void (*v168)(uint64_t, uint64_t);
  void (*v169)(uint64_t);
  id v170;
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  void *v174;
  __int128 v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t *v178;
  uint64_t v179;
  void *v180;
  __int128 v181;
  uint64_t v182;
  uint64_t v183;

  v183 = *MEMORY[0x1E0C80C00];
  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    v165 = 0;
    v166 = &v165;
    v167 = 0x3052000000;
    v168 = __Block_byref_object_copy__5;
    v169 = __Block_byref_object_dispose__5;
    v170 = a3;
    v9 = -[AVCaptureFigVideoDevice formats](self, "formats");
    if ((objc_msgSend(v9, "containsObject:", v166[5]) & 1) != 0)
    {
      if (dword_1ECFED6C0)
      {
        LODWORD(v159) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeFormat"), v35, v36);
      v16 = *MEMORY[0x1E0CA2E18];
      v17 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v174 = &unk_19EF10DB5;
      v162 = &unk_19EF10DB5;
      v181 = v16;
      v163 = v16;
      v145 = -1;
      v113 = &unk_19EF10DB5;
      v180 = &unk_19EF10DB5;
      v182 = v17;
      v176 = v17;
      v164 = v17;
      v115 = v17;
      v135 = __Block_byref_object_copy__5;
      v136 = __Block_byref_object_dispose__5;
      v91 = __Block_byref_object_copy__5;
      v92 = __Block_byref_object_dispose__5;
      block[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke;
      v179 = 0x3810000000;
      v173 = 0x3810000000;
      v161 = 0x3810000000;
      v112 = 0x3810000000;
      block[3] = &unk_1E4217A88;
      v138 = 0;
      v139 = &v138;
      block[4] = self;
      block[5] = a5;
      block[6] = &v165;
      v132 = 0;
      v133 = &v132;
      block[7] = &v138;
      block[8] = &v132;
      v155 = 0;
      v156 = (double *)&v155;
      v100[0] = 0;
      v100[1] = v100;
      block[9] = v100;
      v102 = 0;
      v103 = &v102;
      block[10] = &v102;
      v151 = 0;
      v152 = (double *)&v151;
      block[11] = &v155;
      block[12] = &v151;
      v177 = 0;
      v178 = &v177;
      v150[0] = 0;
      v150[1] = v150;
      block[13] = v150;
      v96 = 0;
      v97 = &v96;
      v56 = a4;
      v94[0] = 0;
      v94[1] = v94;
      block[14] = v94;
      v75 = 0;
      v76 = &v75;
      block[15] = &v96;
      v73[0] = 0;
      v73[1] = v73;
      block[16] = v73;
      v69 = 0;
      v70 = &v69;
      block[17] = &v75;
      v67[0] = 0;
      v67[1] = v67;
      block[18] = v67;
      block[19] = &v69;
      v61[0] = 0;
      v61[1] = v61;
      block[20] = v61;
      v171 = 0;
      v172 = &v171;
      v175 = v16;
      v63 = 0;
      v64 = &v63;
      block[21] = &v63;
      v159 = 0;
      v160 = &v159;
      v157 = 0x2020000000;
      v158 = 0;
      v153 = 0x2020000000;
      v154 = 0;
      v150[2] = 0x2020000000;
      v150[3] = 0;
      block[22] = &v177;
      v146 = 0;
      v147 = (float *)&v146;
      v148 = 0x2020000000;
      v149 = 0;
      block[23] = &v171;
      block[24] = &v146;
      v142 = 0;
      v143 = &v142;
      v144 = 0x2020000000;
      v140 = 0x2020000000;
      v141 = 0;
      v134 = 0x3052000000;
      v137 = 0;
      v128 = 0;
      v129 = &v128;
      v130 = 0x2020000000;
      v131 = 0;
      block[25] = &v128;
      block[26] = &v159;
      v124 = 0;
      v125 = &v124;
      v126 = 0x2020000000;
      v127 = 0;
      *(_QWORD *)type = 0;
      v111 = type;
      block[27] = type;
      v106 = 0;
      v107 = &v106;
      block[28] = &v106;
      v120 = 0;
      v121 = &v120;
      v122 = 0x2020000000;
      v123 = 0;
      block[29] = &v142;
      v88 = 0;
      v89 = &v88;
      block[30] = &v88;
      v116 = 0;
      v117 = &v116;
      v118 = 0x2020000000;
      v119 = 0;
      v114 = v16;
      v108 = 0x2020000000;
      v109 = 0;
      v104 = 0x2020000000;
      v105 = 0;
      v100[2] = 0x2020000000;
      v101 = 0;
      v98 = 0x2020000000;
      v99 = 0;
      v94[2] = 0x2020000000;
      v95 = 0;
      v90 = 0x3052000000;
      v93 = 0;
      block[31] = &v124;
      v84 = 0;
      v85 = &v84;
      v86 = 0x2020000000;
      v87 = 0;
      block[32] = &v120;
      v80 = 0;
      v81 = &v80;
      v82 = 0x2020000000;
      v83 = 0;
      block[33] = &v116;
      v79[0] = 0;
      v79[1] = v79;
      v79[2] = 0x2020000000;
      v79[3] = 0;
      v77 = 0x2020000000;
      v78 = 0;
      v73[2] = 0x2020000000;
      v74 = 0;
      v71 = 0x2020000000;
      v72 = 0;
      v67[2] = 0x2020000000;
      v68 = 0;
      v65 = 0x2020000000;
      v66 = 0;
      v61[2] = 0x2020000000;
      v62 = 0;
      block[34] = &v84;
      v57 = 0;
      v58 = &v57;
      v59 = 0x2020000000;
      block[35] = v79;
      block[36] = &v80;
      devicePropsQueue = self->_devicePropsQueue;
      v60 = 0;
      block[37] = &v57;
      v19 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      dispatch_sync(devicePropsQueue, block);
      if ((*((_BYTE *)v178 + 44) & 1) != 0)
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeVideoMinFrameDuration"));
        v20 = self->_devicePropsQueue;
        v54[0] = v19;
        v54[1] = 3221225472;
        v54[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_2;
        v54[3] = &unk_1E42178B8;
        v54[4] = self;
        v54[5] = &v177;
        dispatch_sync(v20, v54);
      }
      if ((*((_BYTE *)v172 + 44) & 1) != 0)
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeVideoMaxFrameDuration"));
        v21 = self->_devicePropsQueue;
        v53[0] = v19;
        v53[1] = 3221225472;
        v53[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_3;
        v53[3] = &unk_1E42178B8;
        v53[4] = self;
        v53[5] = &v171;
        dispatch_sync(v21, v53);
      }
      if (*((_BYTE *)v125 + 24))
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("digitalFlashMode"));
        -[AVCaptureFigVideoDevice _setDigitalFlashModeInternal:](self, "_setDigitalFlashModeInternal:", 0);
      }
      if (*((_BYTE *)v121 + 24))
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("globalToneMappingEnabled"));
        -[AVCaptureFigVideoDevice _setGlobalToneMappingEnabledInternal:](self, "_setGlobalToneMappingEnabledInternal:", 0);
      }
      if (*((_BYTE *)v117 + 24))
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lowLightVideoCaptureEnabled"));
        v22 = self->_devicePropsQueue;
        v52[0] = v19;
        v52[1] = 3221225472;
        v52[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_4;
        v52[3] = &unk_1E42165A8;
        v52[4] = self;
        dispatch_sync(v22, v52);
      }
      if (*((_BYTE *)v85 + 24))
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("variableFrameRateVideoCaptureEnabled"));
        v23 = self->_devicePropsQueue;
        v51[0] = v19;
        v51[1] = 3221225472;
        v51[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_5;
        v51[3] = &unk_1E42165A8;
        v51[4] = self;
        dispatch_sync(v23, v51);
      }
      if (*((_BYTE *)v81 + 24))
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoStabilizationStrength"));
        v24 = self->_devicePropsQueue;
        v50[0] = v19;
        v50[1] = 3221225472;
        v50[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_6;
        v50[3] = &unk_1E42178B8;
        v50[4] = self;
        v50[5] = v79;
        dispatch_sync(v24, v50);
      }
      if (*((_BYTE *)v103 + 24))
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("centerStageActive"));
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cinematicFramingActive"));
        v25 = self->_devicePropsQueue;
        v49[0] = v19;
        v49[1] = 3221225472;
        v49[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_7;
        v49[3] = &unk_1E42178B8;
        v49[4] = self;
        v49[5] = v100;
        dispatch_sync(v25, v49);
      }
      if (*((_BYTE *)v97 + 24))
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("backgroundBlurActive"));
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("portraitEffectActive"));
        v26 = self->_devicePropsQueue;
        v48[0] = v19;
        v48[1] = 3221225472;
        v48[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_8;
        v48[3] = &unk_1E42178B8;
        v48[4] = self;
        v48[5] = v94;
        dispatch_sync(v26, v48);
      }
      if (*((_BYTE *)v76 + 24))
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("studioLightingActive"));
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("studioLightActive"));
        v27 = self->_devicePropsQueue;
        v47[0] = v19;
        v47[1] = 3221225472;
        v47[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_9;
        v47[3] = &unk_1E42178B8;
        v47[4] = self;
        v47[5] = v73;
        dispatch_sync(v27, v47);
      }
      if (*((_BYTE *)v70 + 24))
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("canPerformReactionEffects"));
        v28 = self->_devicePropsQueue;
        v46[0] = v19;
        v46[1] = 3221225472;
        v46[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_10;
        v46[3] = &unk_1E42178B8;
        v46[4] = self;
        v46[5] = v67;
        dispatch_sync(v28, v46);
      }
      if (*((_BYTE *)v64 + 24))
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("backgroundReplacementActive"));
        v29 = self->_devicePropsQueue;
        v45[0] = v19;
        v45[1] = 3221225472;
        v45[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_11;
        v45[3] = &unk_1E42178B8;
        v45[4] = self;
        v45[5] = v61;
        dispatch_sync(v29, v45);
      }
      if (v156[3] >= 1.0)
        -[AVCaptureFigVideoDevice _setMinAvailableVideoZoomFactor:](self, "_setMinAvailableVideoZoomFactor:");
      v30 = v147[6];
      if (v30 >= 1.0)
        -[AVCaptureFigVideoDevice setVideoZoomFactor:](self, "setVideoZoomFactor:", v30);
      if (v152[3] >= 1.0)
        -[AVCaptureFigVideoDevice _setMaxAvailableVideoZoomFactor:](self, "_setMaxAvailableVideoZoomFactor:");
      if (*((_BYTE *)v129 + 24))
        -[AVCaptureFigVideoDevice setNonDestructiveCropAspectRatio:](self, "setNonDestructiveCropAspectRatio:", 0);
      if (v143[3] != -1)
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeColorSpace"));
        v31 = self->_devicePropsQueue;
        v44[0] = v19;
        v44[1] = 3221225472;
        v44[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_12;
        v44[3] = &unk_1E42178B8;
        v44[4] = self;
        v44[5] = &v142;
        dispatch_sync(v31, v44);
      }
      if (*((_BYTE *)v107 + 24))
      {
        v42 = *((_OWORD *)v111 + 2);
        v43 = *((_QWORD *)v111 + 6);
        -[AVCaptureFigVideoDevice setActiveMaxExposureDuration:](self, "setActiveMaxExposureDuration:", &v42);
      }
      if (*((_BYTE *)v139 + 24))
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeDepthDataFormat"));
        v32 = self->_devicePropsQueue;
        v41[0] = v19;
        v41[1] = 3221225472;
        v41[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_13;
        v41[3] = &unk_1E42178B8;
        v41[4] = self;
        v41[5] = &v132;
        dispatch_sync(v32, v41);
      }
      if (*((_BYTE *)v58 + 24))
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("spatialOverCaptureEnabled"));
        v33 = self->_devicePropsQueue;
        v40[0] = v19;
        v40[1] = 3221225472;
        v40[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_14;
        v40[3] = &unk_1E42165A8;
        v40[4] = self;
        dispatch_sync(v33, v40);
      }
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeFormat"));
      if (*((_BYTE *)v139 + 24))
      {
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeDepthDataFormat"));
        if (!v133[5])
          -[AVCaptureFigVideoDevice _setShallowDepthOfFieldEffectStatus:](self, "_setShallowDepthOfFieldEffectStatus:", 0);
        v38 = *((_OWORD *)v160 + 2);
        v39 = v160[6];
        -[AVCaptureFigVideoDevice setActiveDepthDataMinFrameDuration:](self, "setActiveDepthDataMinFrameDuration:", &v38);
      }
      if (v143[3] != -1)
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeColorSpace"));
      if (*((_BYTE *)v117 + 24))
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lowLightVideoCaptureEnabled"));
      if (*((_BYTE *)v121 + 24))
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("globalToneMappingEnabled"));
      if (*((_BYTE *)v125 + 24))
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("digitalFlashMode"));
      if (v89[5])
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("systemPressureState"));
        v34 = self->_devicePropsQueue;
        v37[0] = v19;
        v37[1] = 3221225472;
        v37[2] = __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_15;
        v37[3] = &unk_1E42178B8;
        v37[4] = self;
        v37[5] = &v88;
        dispatch_sync(v34, v37);
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("systemPressureState"));
      }
      if (*((_BYTE *)v85 + 24))
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("variableFrameRateVideoCaptureEnabled"));
      if (*((_BYTE *)v81 + 24))
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoStabilizationStrength"));
      if (*((_BYTE *)v103 + 24))
      {
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cinematicFramingActive"));
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("centerStageActive"));
      }
      if ((*((_BYTE *)v178 + 44) & 1) != 0)
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeVideoMinFrameDuration"));
      if ((*((_BYTE *)v172 + 44) & 1) != 0)
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeVideoMaxFrameDuration"));
      if (*((_BYTE *)v97 + 24))
      {
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("portraitEffectActive"));
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("backgroundBlurActive"));
      }
      if (*((_BYTE *)v76 + 24))
      {
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("studioLightActive"));
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("studioLightingActive"));
      }
      if (*((_BYTE *)v70 + 24))
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("canPerformReactionEffects"));
      if (*((_BYTE *)v64 + 24))
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("backgroundReplacementActive"));
      if (*((_BYTE *)v58 + 24))
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("spatialOverCaptureEnabled"));
      _Block_object_dispose(&v57, 8);
      _Block_object_dispose(v61, 8);
      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(v67, 8);
      _Block_object_dispose(&v69, 8);
      _Block_object_dispose(v73, 8);
      _Block_object_dispose(&v75, 8);
      _Block_object_dispose(v79, 8);
      _Block_object_dispose(&v80, 8);
      _Block_object_dispose(&v84, 8);
      _Block_object_dispose(&v88, 8);
      _Block_object_dispose(v94, 8);
      _Block_object_dispose(&v96, 8);
      _Block_object_dispose(v100, 8);
      _Block_object_dispose(&v102, 8);
      _Block_object_dispose(&v106, 8);
      _Block_object_dispose(type, 8);
      _Block_object_dispose(&v116, 8);
      _Block_object_dispose(&v120, 8);
      _Block_object_dispose(&v124, 8);
      _Block_object_dispose(&v128, 8);
      _Block_object_dispose(&v132, 8);
      _Block_object_dispose(&v138, 8);
      _Block_object_dispose(&v142, 8);
      _Block_object_dispose(&v146, 8);
      _Block_object_dispose(v150, 8);
      _Block_object_dispose(&v151, 8);
      _Block_object_dispose(&v155, 8);
      _Block_object_dispose(&v159, 8);
      _Block_object_dispose(&v171, 8);
      _Block_object_dispose(&v177, 8);
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      objc_opt_class();
      v15 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithClassAndSelector(), 0, v166[5]);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v15);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v15);
    }
    _Block_object_dispose(&v165, 8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v13 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v13);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
  }
}

- (void)setActiveDepthDataMinFrameDuration:(id *)a3
{
  NSObject *devicePropsQueue;
  uint64_t v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[7];
  CMTime time1;
  CMTime time2;
  char v20;
  _QWORD block[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3810000000;
  v31 = &unk_19EF10DB5;
  v32 = *a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AVCaptureFigVideoDevice_setActiveDepthDataMinFrameDuration___block_invoke;
  block[3] = &unk_1E4217A60;
  block[4] = self;
  block[5] = &v22;
  dispatch_sync(devicePropsQueue, block);
  v7 = (void *)v23[5];
  if ((a3->var2 & 1) == 0)
  {
    if (v7)
    {
      v8 = &v20;
      objc_msgSend(v7, "minFrameDuration");
    }
    else
    {
      v8 = (char *)MEMORY[0x1E0CA2E30];
    }
    v11 = v29;
    *((_OWORD *)v29 + 2) = *(_OWORD *)v8;
    v11[6] = *((_QWORD *)v8 + 2);
LABEL_10:
    v12 = self->_devicePropsQueue;
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __62__AVCaptureFigVideoDevice_setActiveDepthDataMinFrameDuration___block_invoke_2;
    v17[3] = &unk_1E4217AD8;
    v17[5] = &v28;
    v17[6] = &v33;
    v17[4] = self;
    dispatch_sync(v12, v17);
    if (*((_DWORD *)v34 + 6) == -16452)
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      objc_opt_class();
      v14 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v14);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
    }
    goto LABEL_15;
  }
  if (v7)
  {
    objc_msgSend(v7, "minFrameDuration");
    time1 = (CMTime)*a3;
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
      goto LABEL_10;
    v9 = (void *)MEMORY[0x1E0C99DA0];
    objc_opt_class();
    v10 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v10);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    objc_opt_class();
    v16 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v16);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v16);
  }
LABEL_15:
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v33, 8);
}

- (void)_setMinAvailableVideoZoomFactor:(double)a3
{
  NSObject *devicePropsQueue;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVCaptureFigVideoDevice__setMinAvailableVideoZoomFactor___block_invoke;
  block[3] = &unk_1E4217C18;
  *(double *)&block[6] = a3;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(devicePropsQueue, block);
  if (*((_BYTE *)v15 + 24))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("minAvailableVideoZoomFactor"));
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v7 = self->_devicePropsQueue;
    v12 = 0;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __59__AVCaptureFigVideoDevice__setMinAvailableVideoZoomFactor___block_invoke_2;
    v8[3] = &unk_1E4217A38;
    *(double *)&v8[6] = a3;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v7, v8);
    if (*((_BYTE *)v10 + 24))
      -[AVCaptureFigVideoDevice _setVideoZoomFactor:](self, "_setVideoZoomFactor:", a3);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("minAvailableVideoZoomFactor"));
    _Block_object_dispose(&v9, 8);
  }
  _Block_object_dispose(&v14, 8);
}

- (void)setVideoZoomFactor:(double)a3
{
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *devicePropsQueue;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[6];
  _QWORD block[8];
  _QWORD v17[4];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;

  if (a3 >= 1.0
    && (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "videoMaxZoomFactor"), v5 >= a3))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    *(double *)&v17[3] = a3;
    devicePropsQueue = self->_devicePropsQueue;
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__AVCaptureFigVideoDevice_setVideoZoomFactor___block_invoke;
    block[3] = &unk_1E4217B78;
    block[4] = self;
    block[5] = v17;
    block[6] = &v18;
    block[7] = &v22;
    dispatch_sync(devicePropsQueue, block);
    v11 = *((_DWORD *)v23 + 6);
    if (v11)
    {
      if (v11 == -16452)
      {
        v12 = (void *)MEMORY[0x1E0C99DA0];
        objc_opt_class();
        v13 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
        if (AVCaptureShouldThrowForAPIViolations())
          objc_exception_throw(v13);
        NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
      }
    }
    else
    {
      if (*((_BYTE *)v19 + 24))
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rampingVideoZoom"));
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoZoomFactor"));
      v14 = self->_devicePropsQueue;
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __46__AVCaptureFigVideoDevice_setVideoZoomFactor___block_invoke_2;
      v15[3] = &unk_1E42178B8;
      v15[4] = self;
      v15[5] = v17;
      dispatch_sync(v14, v15);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoZoomFactor"));
      if (*((_BYTE *)v19 + 24))
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rampingVideoZoom"));
    }
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0, *(_QWORD *)&a3);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

- (void)_setMaxAvailableVideoZoomFactor:(double)a3
{
  NSObject *devicePropsQueue;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVCaptureFigVideoDevice__setMaxAvailableVideoZoomFactor___block_invoke;
  block[3] = &unk_1E4217C18;
  *(double *)&block[6] = a3;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(devicePropsQueue, block);
  if (*((_BYTE *)v15 + 24))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("maxAvailableVideoZoomFactor"));
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v7 = self->_devicePropsQueue;
    v12 = 0;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __59__AVCaptureFigVideoDevice__setMaxAvailableVideoZoomFactor___block_invoke_2;
    v8[3] = &unk_1E4217A38;
    *(double *)&v8[6] = a3;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v7, v8);
    if (*((_BYTE *)v10 + 24))
      -[AVCaptureFigVideoDevice _setVideoZoomFactor:](self, "_setVideoZoomFactor:", a3);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("maxAvailableVideoZoomFactor"));
    _Block_object_dispose(&v9, 8);
  }
  _Block_object_dispose(&v14, 8);
}

id __69__AVCaptureFigVideoDevice_supportedFallbackPrimaryConstituentDevices__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 1000);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __83__AVCaptureFigVideoDevice__insurePreferredCameraGlobal_globalName_preferredCamera___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  v2 = **(void ***)(a1 + 48);
  if (v2)
  {
    v3 = v2;
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    v4 = *(id *)(a1 + 32);
    if (v4 == v3 || (objc_msgSend(v4, "isEqual:", v3) & 1) != 0)
    {
      if (!dword_1ECFED6C0)
        return;
    }
    else if (!dword_1ECFED6C0)
    {
      return;
    }
  }
  else
  {
    **(_QWORD **)(a1 + 48) = *(id *)(a1 + 32);
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    if (!dword_1ECFED6C0)
      return;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
}

double *__59__AVCaptureFigVideoDevice__setMaxAvailableVideoZoomFactor___block_invoke_2(double *result)
{
  *(double *)(*((_QWORD *)result + 4) + 888) = result[6];
  if (result[6] < *(float *)(*((_QWORD *)result + 4) + 864))
    *(_BYTE *)(*(_QWORD *)(*((_QWORD *)result + 5) + 8) + 24) = 1;
  return result;
}

void __54__AVCaptureFigVideoDevice__cameraHistoryDispatchQueue__block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECFED6C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  sPreferredCameraPropertyRefreshQueue = MEMORY[0x1E0C80D38];
}

uint64_t __56__AVCaptureFigVideoDevice_degradedCaptureQualityFactors__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(result + 1208))
  {
    objc_msgSend((id)result, "_initDegradedCaptureQualityFactors");
    result = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(result + 1200);
  return result;
}

- (void)_initDegradedCaptureQualityFactors
{
  int v3;
  uint64_t v4;

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  self->_cameraPoseMatrix = 0;
  if (BYTE1(self->_degradedCaptureQualityFactors))
    self->_cameraPoseMatrix = (NSData *)objc_msgSend(-[AVCaptureFigVideoDevice _getFigCaptureSourceProperty:](self, "_getFigCaptureSourceProperty:", *MEMORY[0x1E0D04E10]), "BOOLValue");
  if (BYTE2(self->_degradedCaptureQualityFactors))
  {
    v3 = objc_msgSend(-[AVCaptureFigVideoDevice _getFigCaptureSourceProperty:](self, "_getFigCaptureSourceProperty:", *MEMORY[0x1E0D04BF8]), "BOOLValue");
    v4 = 2;
    if (!v3)
      v4 = 0;
    self->_cameraPoseMatrix = (NSData *)((uint64_t)self->_cameraPoseMatrix | v4);
  }
  LOBYTE(self->_degradedCaptureQualityFactors) = 0;
}

- (id)_getFigCaptureSourceProperty:(__CFString *)a3
{
  return -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", a3);
}

- (void)_setAdjustingExposure:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD block[6];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVCaptureFigVideoDevice__setAdjustingExposure___block_invoke;
  block[3] = &unk_1E4217C68;
  v6 = a3;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  if (*((_BYTE *)v8 + 24) && -[AVCaptureFigVideoDevice lockForConfiguration:](self, "lockForConfiguration:", 0))
  {
    -[AVCaptureFigVideoDevice setExposureMode:](self, "setExposureMode:", 0);
    -[AVCaptureFigVideoDevice unlockForConfiguration](self, "unlockForConfiguration");
  }
  _Block_object_dispose(&v7, 8);
}

- (BOOL)isTorchActive
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVCaptureFigVideoDevice_isTorchActive__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_32(uint64_t result)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (sCameraHistoryHasBeenSetUp == 1)
    return objc_msgSend(*(id *)(result + 32), "_refreshPreferredCameraProperties:", 1);
  if (dword_1ECFED6C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

__n128 __69__AVCaptureFigVideoDevice_setVideoMinFrameDurationOverride_forOwner___block_invoke(uint64_t a1)
{
  __n128 *v1;
  unint64_t v2;
  __n128 result;
  uint64_t v4;
  __int128 *v5;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  __n128 *v10;
  CMTime v11;
  CMTime time1;

  v1 = (__n128 *)(*(_QWORD *)(a1 + 32) + 200);
  v2 = *(_QWORD *)(a1 + 72);
  result = *(__n128 *)(a1 + 56);
  *v1 = result;
  v1[1].n128_u64[0] = v2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (__int128 *)(v4 + 200);
  if ((*(_BYTE *)(v4 + 212) & 1) != 0)
  {
    v7 = (__int128 *)(v4 + 232);
    v8 = *v7;
    time1.epoch = *((_QWORD *)v7 + 2);
    *(_OWORD *)&time1.value = v8;
    v9 = *v5;
    v11.epoch = *((_QWORD *)v5 + 2);
    *(_OWORD *)&v11.value = v9;
    if (CMTimeCompare(&time1, &v11) < 0)
    {
      v10 = *(__n128 **)(*(_QWORD *)(a1 + 48) + 8);
      result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 200);
      v10[3].n128_u64[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216);
      v10[2] = result;
    }
  }
  return result;
}

uint64_t __49__AVCaptureFigVideoDevice__setAdjustingExposure___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 540) = *(_BYTE *)(result + 48);
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 541))
  {
    if (!*(_BYTE *)(result + 48))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(result + 32) + 541) = 0;
    }
  }
  return result;
}

- (void)setFallbackPrimaryConstituentDevices:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  if (-[AVCaptureFigVideoDevice _isBravoVariant](self, "_isBravoVariant")
    && !self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions)
  {
    -[AVCaptureFigVideoDevice _populateSupportedFallbackPrimaryConstituentDevices](self, "_populateSupportedFallbackPrimaryConstituentDevices");
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend((id)self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions, "containsObject:", v9) & 1) == 0)
        {
          v10 = (void *)MEMORY[0x1E0C99DA0];
          v11 = *MEMORY[0x1E0C99778];
          objc_opt_class();
          v12 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithClassAndSelector(), 0, v9);
          if (AVCaptureShouldThrowForAPIViolations())
            objc_exception_throw(v12);
          NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
          return;
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  if (!-[NSArray isEqualToArray:](self->_supportedFallbackPrimaryConstituentDevices, "isEqualToArray:", a3))
    -[AVCaptureFigVideoDevice _setFallbackPrimaryConstituentDevices:](self, "_setFallbackPrimaryConstituentDevices:", a3);
}

- (id)systemPressureState
{
  NSObject *devicePropsQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVCaptureFigVideoDevice_systemPressureState__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setIsStillImageStabilizationScene:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__AVCaptureFigVideoDevice__setIsStillImageStabilizationScene___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

- (void)setExposureTargetBias:(float)a3 completionHandler:(id)a4
{
  float v5;
  float v7;
  float v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *devicePropsQueue;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD block[8];
  float v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v5 = a3;
  a3 = 3.4028e38;
  if (v5 == 3.4028e38
    || (-[AVCaptureFigVideoDevice minExposureTargetBias](self, "minExposureTargetBias", *(double *)&a3), v7 <= v5)
    && (-[AVCaptureFigVideoDevice maxExposureTargetBias](self, "maxExposureTargetBias"), v8 >= v5))
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    devicePropsQueue = self->_devicePropsQueue;
    v23 = 0;
    v13 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__AVCaptureFigVideoDevice_setExposureTargetBias_completionHandler___block_invoke;
    block[3] = &unk_1E4217CE0;
    block[4] = self;
    block[5] = a4;
    v19 = v5;
    block[6] = &v20;
    block[7] = &v24;
    dispatch_sync(devicePropsQueue, block);
    v14 = *((_DWORD *)v25 + 6);
    if (v14)
    {
      if (v14 == -16452)
      {
        v15 = (void *)MEMORY[0x1E0C99DA0];
        objc_opt_class();
        v16 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
        if (AVCaptureShouldThrowForAPIViolations())
          objc_exception_throw(v16);
        NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v16);
        goto LABEL_12;
      }
    }
    else if (!*((_BYTE *)v21 + 24))
    {
LABEL_12:
      _Block_object_dispose(&v20, 8);
      _Block_object_dispose(&v24, 8);
      return;
    }
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __67__AVCaptureFigVideoDevice_setExposureTargetBias_completionHandler___block_invoke_2;
    v17[3] = &unk_1E42165A8;
    v17[4] = self;
    -[AVCaptureFigVideoDevice _performBlockOnMainThread:](self, "_performBlockOnMainThread:", v17);
    goto LABEL_12;
  }
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = *MEMORY[0x1E0C99858];
  objc_opt_class();
  v11 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithClassAndSelector(), 0, v5);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v11);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
}

- (float)minExposureTargetBias
{
  return -8.0;
}

- (float)maxExposureTargetBias
{
  return 8.0;
}

uint64_t __88__AVCaptureFigVideoDevice__updateCenterStageActiveForEnabled_updateDependentProperties___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1212);
  result = objc_msgSend(*(id *)(a1 + 32), "_isCenterStageActiveForEnabled:", *(unsigned __int8 *)(a1 + 80));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1213);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 936);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 952);
  return result;
}

- (unint64_t)stereoVideoCaptureStatus
{
  NSObject *devicePropsQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AVCaptureFigVideoDevice_stereoVideoCaptureStatus__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)minAvailableVideoZoomFactor
{
  NSObject *devicePropsQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureFigVideoDevice_minAvailableVideoZoomFactor__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isTorchAvailable
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_isTorchAvailable__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isHDRSceneDetectedForPhotoOutput
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVCaptureFigVideoDevice_isHDRSceneDetectedForPhotoOutput__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isFlashSceneDetectedForPhotoOutput
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__AVCaptureFigVideoDevice_isFlashSceneDetectedForPhotoOutput__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isFlashAvailable
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_isFlashAvailable__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)imageControlMode
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_imageControlMode__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)degradedCaptureQualityFactors
{
  NSObject *devicePropsQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVCaptureFigVideoDevice_degradedCaptureQualityFactors__block_invoke;
  v5[3] = &unk_1E42178B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __47__AVCaptureFigVideoDevice_setActiveColorSpace___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "supportedColorSpaces");
  if ((objc_msgSend(v2, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40))) & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 856) = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    v5 = (void *)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (id)digitalFlashSceneForPhotoOutput
{
  NSObject *devicePropsQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVCaptureFigVideoDevice_digitalFlashSceneForPhotoOutput__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__43__AVCaptureFigVideoDevice_setExposureMode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  double v5;
  void *result;
  __int128 v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "requestID");
  HIDWORD(v5) = HIDWORD(AVCaptureExposureDurationCurrent.value);
  v7 = *(_OWORD *)&AVCaptureExposureDurationCurrent.value;
  v8 = 0;
  LODWORD(v5) = 2139095039;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "_setExposureWithMode:duration:ISO:requestID:newMaxFrameDuration:", v2, &v7, v4, 0, v5);
  result = *(void **)(a1 + 40);
  if (result)
    result = (void *)objc_msgSend(result, "setErrorCode:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424) = *(_QWORD *)(a1 + 56);
  return result;
}

- (id)supportedFallbackPrimaryConstituentDevices
{
  NSObject *devicePropsQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = MEMORY[0x1E0C9AA60];
  if (-[AVCaptureFigVideoDevice _isBravoVariant](self, "_isBravoVariant"))
  {
    if (!self->_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions)
      -[AVCaptureFigVideoDevice _populateSupportedFallbackPrimaryConstituentDevices](self, "_populateSupportedFallbackPrimaryConstituentDevices");
    devicePropsQueue = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__AVCaptureFigVideoDevice_supportedFallbackPrimaryConstituentDevices__block_invoke;
    v6[3] = &unk_1E4217A60;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(devicePropsQueue, v6);
  }
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __60__AVCaptureFigVideoDevice_setNonDestructiveCropAspectRatio___block_invoke(uint64_t a1)
{
  unint64_t Dimensions;
  int32_t v3;
  unint64_t v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CFDictionaryRef DictionaryRepresentation;
  int v12;
  uint64_t v13;
  CGSize v14;

  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "formatDescription"));
  v3 = Dimensions;
  v4 = HIDWORD(Dimensions);
  switch(*(_QWORD *)(a1 + 40))
  {
    case 0:
    case 1:
      v5 = 1.0;
      goto LABEL_14;
    case 2:
      v6 = 1.0;
      v5 = 0.75;
      break;
    case 3:
      v6 = 0.75;
      v5 = 1.0;
      break;
    case 4:
      v10 = ((double)(int)Dimensions + (double)(int)Dimensions) / 3.0;
      goto LABEL_13;
    case 5:
      v7 = AVCaptureMainScreenPixelSize();
      if (v7 >= v8)
        v9 = v8;
      else
        v9 = v7;
      if (v7 < v8)
        v7 = v8;
      v10 = v9 * (double)v3 / v7;
LABEL_13:
      v5 = v10 / (double)(int)v4;
LABEL_14:
      v6 = 1.0;
      break;
    default:
      v5 = 0.0;
      v6 = 0.0;
      break;
  }
  v14.width = v6;
  v14.height = v5;
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v14);
  v12 = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E0D04D28], DictionaryRepresentation, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 328));

  if (!v12)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144) = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 32) + 1152;
    *(CGFloat *)v13 = v6;
    *(double *)(v13 + 8) = v5;
  }
}

- (void)setAutomaticallyAdjustsVideoHDREnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  BOOL v10;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__AVCaptureFigVideoDevice_setAutomaticallyAdjustsVideoHDREnabled___block_invoke;
    block[3] = &unk_1E4217A10;
    block[4] = self;
    v10 = a3;
    dispatch_sync(devicePropsQueue, block);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

- (void)setNonDestructiveCropAspectRatio:(int64_t)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[6];

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (!a3 || -[AVCaptureFigVideoDevice isNonDestructiveCropEnabled](self, "isNonDestructiveCropEnabled"))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__AVCaptureFigVideoDevice_setNonDestructiveCropAspectRatio___block_invoke;
      block[3] = &unk_1E4216650;
      block[4] = self;
      block[5] = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

- (void)setFocusMode:(int64_t)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  if (-[AVCaptureFigVideoDevice isFocusModeSupported:](self, "isFocusModeSupported:"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__AVCaptureFigVideoDevice_setFocusMode___block_invoke;
    block[3] = &unk_1E4217C18;
    block[4] = self;
    block[5] = &v12;
    block[6] = a3;
    dispatch_sync(devicePropsQueue, block);
    if (*((_DWORD *)v13 + 6) == -16452)
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      objc_opt_class();
      v7 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v7);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
    }
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    v10 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v10);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
  }
}

- (void)setActiveColorSpace:(int64_t)a3
{
  NSObject *devicePropsQueue;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD block[7];

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__AVCaptureFigVideoDevice_setActiveColorSpace___block_invoke;
    block[3] = &unk_1E4216628;
    block[4] = self;
    block[5] = a3;
    block[6] = a2;
    dispatch_sync(devicePropsQueue, block);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v9);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
  }
}

- (void)setExposureMode:(int64_t)a3
{
  AVCaptureDeviceControlRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *devicePropsQueue;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD block[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  if (-[AVCaptureFigVideoDevice isExposureModeSupported:](self, "isExposureModeSupported:"))
  {
    if (a3 == 3)
    {
      v5 = +[AVCaptureDeviceControlRequest deviceControlRequestWithCompletionBlock:](AVCaptureDeviceControlRequest, "deviceControlRequestWithCompletionBlock:", 0);
      -[AVCaptureDeviceControlRequestQueue enqueueRequest:](self->_manualFocusControlRequests, "enqueueRequest:", v5);
    }
    else
    {
      v5 = 0;
    }
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__AVCaptureFigVideoDevice_setExposureMode___block_invoke;
    block[3] = &unk_1E4217C90;
    block[6] = &v16;
    block[7] = a3;
    block[4] = self;
    block[5] = v5;
    dispatch_sync(devicePropsQueue, block);
    v11 = *((_DWORD *)v17 + 6);
    if (v11 == -16452)
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      objc_opt_class();
      v13 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v13);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
    }
    else if (v5 && v11)
    {
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __43__AVCaptureFigVideoDevice_setExposureMode___block_invoke_2;
      v14[3] = &unk_1E42165A8;
      v14[4] = self;
      -[AVCaptureFigVideoDevice _performBlockOnMainThread:](self, "_performBlockOnMainThread:", v14);
    }
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t result;
  CMTime v5;
  CMTime time1;

  v2 = *(_QWORD *)(a1 + 32) + 432;
  time1 = *(CMTime *)(a1 + 48);
  v3 = *(_OWORD *)v2;
  v5.epoch = *(_QWORD *)(v2 + 16);
  *(_OWORD *)&v5.value = v3;
  result = CMTimeCompare(&time1, &v5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result != 0;
  return result;
}

+ (void)_reconnectDevices:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, id *);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = +[AVCaptureFigVideoDevice _newFigCaptureSources](AVCaptureFigVideoDevice, "_newFigCaptureSources");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v19 = *(_QWORD *)v26;
    v18 = *MEMORY[0x1E0D04BB0];
    v17 = *MEMORY[0x1E0C9AE00];
    v6 = *MEMORY[0x1E0D04910];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v24 = 0;
        v9 = *(void (**)(uint64_t, uint64_t, uint64_t, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
        if (v9)
          v9(v8, v18, v17, &v24);
        v10 = (id)objc_msgSend(v24, "objectForKeyedSubscript:", v6);

        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(a3);
              v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v15, "uniqueID"), "isEqualToString:", v10))
              {
                objc_msgSend(v15, "_reconnectToFigCaptureSource:", v8);
                goto LABEL_18;
              }
            }
            v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

}

+ (id)_userPreferredCameraOverrideHistoryKey
{
  if (_userPreferredCameraOverrideHistoryKey_onceToken != -1)
    dispatch_once(&_userPreferredCameraOverrideHistoryKey_onceToken, &__block_literal_global_15);
  return (id)sUserPreferredCameraOverrideHistoryKey;
}

uint64_t __65__AVCaptureFigVideoDevice__userPreferredCameraOverrideHistoryKey__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/override/%@"), CFSTR("camera-history"), CFSTR("preferred-camera-history"));
  sUserPreferredCameraOverrideHistoryKey = result;
  return result;
}

uint64_t __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_25(uint64_t result)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (sCameraHistoryHasBeenSetUp == 1)
    return objc_msgSend(*(id *)(result + 32), "_refreshPreferredCameraProperties:", 1);
  if (dword_1ECFED6C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

void __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  char v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[5];
  os_log_type_t type;
  unsigned int v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = +[AVCaptureProprietaryDefaultsSingleton cameraHistoryDownplayOverrideList](AVCaptureProprietaryDefaultsSingleton, "cameraHistoryDownplayOverrideList");
  v6 = objc_msgSend(v5, "containsObject:", sUserPreferredCameraHistoryKey);
  if (dword_1ECFED6C0)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);

  sUserPreferredCameraOverrideHistory = a3;
  sDownplayUserPreferredCameraOverrideHistory = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (dword_1ECFED6C0)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v9 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue](AVCaptureFigVideoDevice, "_cameraHistoryDispatchQueue", v16, v17);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_28;
  block[3] = &unk_1E42165A8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v9, block);
  if (dword_1ECFED6C0)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v11 = v20;
    if (os_log_type_enabled(v10, type))
      v12 = v11;
    else
      v12 = v11 & 0xFFFFFFFE;
    if (v12)
    {
      v21 = 136315138;
      v22 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1ECFED6C0)
    {
      v20 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v14 = v20;
      if (os_log_type_enabled(v13, type))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if (v15)
      {
        v21 = 136315395;
        v22 = "+[AVCaptureFigVideoDevice _setUpCameraHistoryOnce]_block_invoke";
        v23 = 2113;
        v24 = sUserPreferredCameraOverrideHistoryKey;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

uint64_t __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_28(uint64_t result)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (sCameraHistoryHasBeenSetUp == 1)
    return objc_msgSend(*(id *)(result + 32), "_refreshPreferredCameraProperties:", 1);
  if (dword_1ECFED6C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __50__AVCaptureFigVideoDevice__setUpCameraHistoryOnce__block_invoke_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshPreferredCameraProperties:", 1);
}

+ (BOOL)allowsSuspendedPreferredCameras
{
  char v2;

  objc_msgSend(a1, "_setUpCameraHistoryOnce");
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  v2 = sAllowsSuspendedPreferredCameras;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  return v2;
}

+ (void)setAllowsSuspendedPreferredCameras:(BOOL)a3
{
  int v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];
  os_log_type_t type;
  unsigned int v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_setUpCameraHistoryOnce");
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  if (sAllowsSuspendedPreferredCameras == v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  }
  else
  {
    sAllowsSuspendedPreferredCameras = v3;
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    if (dword_1ECFED6C0)
    {
      v14 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v6 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue](AVCaptureFigVideoDevice, "_cameraHistoryDispatchQueue", v10, v11);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__AVCaptureFigVideoDevice_setAllowsSuspendedPreferredCameras___block_invoke;
    block[3] = &unk_1E42165A8;
    block[4] = a1;
    dispatch_async(v6, block);
    if (dword_1ECFED6C0)
    {
      v14 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v8 = v14;
      if (os_log_type_enabled(v7, type))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if (v9)
      {
        v15 = 136315138;
        v16 = "+[AVCaptureFigVideoDevice setAllowsSuspendedPreferredCameras:]";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

uint64_t __62__AVCaptureFigVideoDevice_setAllowsSuspendedPreferredCameras___block_invoke(uint64_t result)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (sCameraHistoryHasBeenSetUp == 1)
    return objc_msgSend(*(id *)(result + 32), "_refreshPreferredCameraProperties:", 1);
  if (dword_1ECFED6C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

+ (id)userPreferredCamera
{
  id v2;
  int v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[19];

  v14[18] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_setUpCameraHistoryOnce");
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  v2 = (id)sUserPreferredCamera;
  v3 = sAllowsSuspendedPreferredCameras;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  if (!v2)
  {
    if (dword_1ECFED6C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5 = *MEMORY[0x1E0CF2B88];
    v14[0] = *MEMORY[0x1E0CF2B90];
    v14[1] = v5;
    v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2, v9, v12);
    LOBYTE(v10) = v3 != 0;
    v2 = +[AVCaptureFigVideoDevice _defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpecialDeviceTypes:](AVCaptureFigVideoDevice, "_defaultDeviceWithDeviceType:mediaTypes:position:cameraOverrideHistoryAllowed:cameraOverrideHistorySuspendedAllowed:wombatsMustBeMagic:userPreferredCameraHistorySuspendedAllowed:invalidSpecialDeviceTypes:", CFSTR("All"), v6, 0, 0, 0, 0, v10, 0);
    if (dword_1ECFED6C0)
    {
      v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    +[AVCaptureFigVideoDevice _insurePreferredCameraGlobal:globalName:preferredCamera:](AVCaptureFigVideoDevice, "_insurePreferredCameraGlobal:globalName:preferredCamera:", &sUserPreferredCamera, CFSTR("user"), v2, v11, v13);
  }
  return v2;
}

+ (void)setUserPreferredCamera:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sSuspendedDevicesLock);
    if (objc_msgSend(0, "objectForKey:", objc_msgSend(a3, "uniqueID")))
    {
      if (dword_1ECFED6C0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(0, "removeObjectForKey:", objc_msgSend(a3, "uniqueID", v14, v15));
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sSuspendedDevicesLock);
    os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
    v9 = (id)sUserPreferredCamera;
    v10 = (id)sSystemPreferredCamera;
    os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
    if (v9 == a3 || objc_msgSend(a3, "isEqual:", v9))
    {
      if (v10 == a3)
      {
LABEL_20:

        return;
      }
      v11 = objc_msgSend(a3, "isEqual:", v10);
      if ((v11 & 1) != 0 || !dword_1ECFED6C0)
      {
        if ((v11 & 1) != 0)
          goto LABEL_20;
      }
      else
      {
        v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      if (dword_1ECFED6C0)
      {
        v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend((id)objc_opt_class(), "willChangeValueForKey:", CFSTR("userPreferredCamera"));
      os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);

      sUserPreferredCamera = (uint64_t)a3;
      os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
      objc_msgSend((id)objc_opt_class(), "didChangeValueForKey:", CFSTR("userPreferredCamera"));
    }
    objc_msgSend(a1, "_setUpCameraHistoryOnce", v14, v15);
    objc_msgSend(a3, "updateUserPreferredCameraHistory");
    goto LABEL_20;
  }
  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

+ (void)setUserPreferredCamera:(id)a3 forClientPreferenceDomain:(id)a4
{
  objc_msgSend(a1, "_setUpCameraHistoryOnce");
  objc_msgSend(a3, "updateUserPreferredCameraHistoryForKey:", +[AVCaptureFigVideoDevice _userPreferredCameraHistoryKeyForClientPreferencesDomain:](AVCaptureFigVideoDevice, "_userPreferredCameraHistoryKeyForClientPreferencesDomain:", a4));
}

+ (void)updateUserPreferredCameraOverrideHistoryWithDevice:(id)a3 setOverride:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  objc_msgSend(a1, "_setUpCameraHistoryOnce");
  objc_msgSend(a3, "updateUserPreferredCameraOverride:", v4);
}

+ (id)cameraInfoForCreatorID:(id)a3 uniqueID:(id)a4 specialDeviceType:(unsigned int)a5 centerStageSupported:(BOOL)a6
{
  uint64_t v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  if (a6)
    LODWORD(v6) = 2;
  else
    LODWORD(v6) = 3;
  if (a5 == 3)
    LODWORD(v6) = 1;
  if (a5 == 2)
    v6 = 0;
  else
    v6 = v6;
  v8[0] = CFSTR("CreatorID");
  v8[1] = CFSTR("DeviceUID");
  v9[0] = a3;
  v9[1] = a4;
  v8[2] = CFSTR("OverrideRanking");
  v9[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
}

+ (void)updateUserPreferredCameraOverride:(BOOL)a3 cameraInfo:(id)a4
{
  +[AVCaptureProprietaryDefaultsSingleton updateCameraOverrideHistory:withCameraInfo:setOverride:](AVCaptureProprietaryDefaultsSingleton, "updateCameraOverrideHistory:withCameraInfo:setOverride:", objc_msgSend(a1, "_userPreferredCameraOverrideHistoryKey"), a4, a3);
}

+ (void)_initiateRefreshPreferredCameraProperties:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[4];
  BOOL v6;

  +[AVCaptureFigVideoDevice _setUpCameraHistoryOnce](AVCaptureFigVideoDevice, "_setUpCameraHistoryOnce");
  v4 = +[AVCaptureFigVideoDevice _cameraHistoryDispatchQueue](AVCaptureFigVideoDevice, "_cameraHistoryDispatchQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AVCaptureFigVideoDevice__initiateRefreshPreferredCameraProperties___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v6 = a3;
  dispatch_async(v4, block);
}

uint64_t __69__AVCaptureFigVideoDevice__initiateRefreshPreferredCameraProperties___block_invoke(uint64_t result)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (sCameraHistoryHasBeenSetUp == 1)
    return +[AVCaptureFigVideoDevice _refreshPreferredCameraProperties:](AVCaptureFigVideoDevice, "_refreshPreferredCameraProperties:", *(unsigned __int8 *)(result + 32));
  if (dword_1ECFED6C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

+ (id)_prioritizedDeviceList:(id)a3
{
  id v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  void *v11;
  _QWORD v13[9];
  char v14;

  v3 = a3;
  if (a3)
  {
    if (objc_msgSend(a3, "count"))
    {
      objc_msgSend(a1, "_setUpCameraHistoryOnce");
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v3);
      v3 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
      if (sUserPreferredCameraHistory)
        v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
      else
        v6 = 0;
      if (sUserPreferredCameraOverrideHistory)
        v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
      else
        v7 = 0;
      if (sStreamingCameraHistory)
        v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
      else
        v8 = 0;
      v9 = sDownplayUserPreferredCameraOverrideHistory;
      os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __50__AVCaptureFigVideoDevice__prioritizedDeviceList___block_invoke;
      v13[3] = &unk_1E42179C0;
      v14 = v9;
      v13[4] = v6;
      v13[5] = v5;
      v13[6] = v3;
      v13[7] = v7;
      v13[8] = v8;
      __50__AVCaptureFigVideoDevice__prioritizedDeviceList___block_invoke((uint64_t)v13, 0, 1);
      __50__AVCaptureFigVideoDevice__prioritizedDeviceList___block_invoke((uint64_t)v13, 1, 0);
      if (objc_msgSend(v5, "count") && objc_msgSend(v5, "count"))
      {
        v10 = 0;
        do
        {
          v11 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
          if ((objc_msgSend(v11, "isSuspended") & 1) != 0 || objc_msgSend(v11, "specialDeviceType") != 1)
          {
            ++v10;
          }
          else
          {
            objc_msgSend(v3, "addObject:", v11);
            objc_msgSend(v5, "removeObjectAtIndex:", v10);
          }
        }
        while (v10 < objc_msgSend(v5, "count"));
      }
      if (objc_msgSend(v5, "count"))
        objc_msgSend(v3, "addObjectsFromArray:", v5);
    }
    else
    {
      return (id)MEMORY[0x1E0C9AA60];
    }
  }
  return v3;
}

unint64_t __50__AVCaptureFigVideoDevice__prioritizedDeviceList___block_invoke(uint64_t a1, int a2, int a3)
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t result;
  unint64_t v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72) && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v12[0] = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    fvd_prioritizeUsingCameraHistory(*(void **)(a1 + 40), *(void **)(a1 + 48), (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1), a2, 1, 1, 0);
  }
  fvd_prioritizeUsingCameraHistory(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), a2, 1, a3, *(void **)(a1 + 56));
  fvd_prioritizeUsingCameraHistory(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), a2, 1, a3, *(void **)(a1 + 56));
  fvd_prioritizeUsingCameraHistory(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 64), a2, 0, a3, *(void **)(a1 + 56));
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  result = objc_msgSend(v6, "count");
  if (result)
  {
    result = objc_msgSend(v6, "count");
    if (result)
    {
      v10 = 0;
      do
      {
        v11 = (void *)objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
        if (objc_msgSend(v11, "isSuspended") != a2
          || objc_msgSend(v11, "specialDeviceType") == 1)
        {
LABEL_16:
          ++v10;
          goto LABEL_17;
        }
        if (objc_msgSend(v11, "specialDeviceType") == 2)
        {
          if (!a3)
            goto LABEL_15;
        }
        else if (objc_msgSend(v11, "specialDeviceType") != 3 || (a3 & 1) == 0)
        {
          goto LABEL_15;
        }
        if (!fvd_deviceIsPresentInCameraList((uint64_t)v11, v8))
          goto LABEL_16;
LABEL_15:
        objc_msgSend(v7, "addObject:", v11);
        objc_msgSend(v6, "removeObjectAtIndex:", v10);
LABEL_17:
        result = objc_msgSend(v6, "count");
      }
      while (v10 < result);
    }
  }
  return result;
}

- (void)updateUserPreferredCameraHistory
{
  -[AVCaptureFigVideoDevice updateUserPreferredCameraHistoryForKey:](self, "updateUserPreferredCameraHistoryForKey:", sUserPreferredCameraHistoryKey);
}

- (void)updateUserPreferredCameraHistoryForKey:(id)a3
{
  +[AVCaptureProprietaryDefaultsSingleton updateCameraHistory:withCameraInfo:maxLength:updateCameraHistoryDownplayOverrideList:cameraCanBeInOverrideList:](AVCaptureProprietaryDefaultsSingleton, "updateCameraHistory:withCameraInfo:maxLength:updateCameraHistoryDownplayOverrideList:cameraCanBeInOverrideList:", a3, -[AVCaptureFigVideoDevice _cameraInfo](self, "_cameraInfo"), 3, 1, (self->_specialDeviceType & 0xFFFFFFFE) == 2);
}

- (void)updateUserPreferredCameraOverride:(BOOL)a3
{
  +[AVCaptureProprietaryDefaultsSingleton updateCameraOverrideHistory:withCameraInfo:setOverride:](AVCaptureProprietaryDefaultsSingleton, "updateCameraOverrideHistory:withCameraInfo:setOverride:", sUserPreferredCameraOverrideHistoryKey, -[AVCaptureFigVideoDevice _cameraInfo](self, "_cameraInfo"), a3);
}

- (id)_initWithFigCaptureSource:(OpaqueFigCaptureSource *)a3 isProxy:(BOOL)a4
{
  _BOOL4 v4;
  char *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  _OWORD *v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  id v46;
  void *v47;
  __int128 v48;
  uint64_t v49;
  double FloatAnswerWithDefault;
  char v51;
  uint64_t v52;
  void *ModelSpecificName;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  void *v63;
  _DWORD *v64;
  int v65;
  __CFString *v67;
  _BOOL4 v68;
  id obj;
  __int128 v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  objc_super v86;
  _BYTE v87[128];
  _QWORD v88[2];
  _QWORD v89[2];
  _BYTE v90[128];
  _BYTE v91[128];
  _QWORD v92[7];
  _QWORD v93[7];
  _QWORD v94[7];
  _QWORD v95[10];

  v4 = a4;
  v95[7] = *MEMORY[0x1E0C80C00];
  v86.receiver = self;
  v86.super_class = (Class)AVCaptureFigVideoDevice;
  v6 = -[AVCaptureDevice initSubclass](&v86, sel_initSubclass);
  if (!v6)
    return v6;
  v68 = v4;
  *((_QWORD *)v6 + 128) = objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v6);
  *((_QWORD *)v6 + 6) = dispatch_queue_create("com.apple.avfoundation.videocapturedevice.source_queue", 0);
  v7 = dispatch_queue_create("com.apple.avfoundation.videocapturedevice.state_queue", 0);
  *((_QWORD *)v6 + 9) = v7;
  dispatch_suspend(v7);
  *((_QWORD *)v6 + 139) = dispatch_semaphore_create(0);
  objc_msgSend(v6, "_setFigCaptureSource:allowSendingWorkToMainThread:", a3, 1);
  v8 = (void *)objc_msgSend(v6, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04BB0]);
  *((_QWORD *)v6 + 8) = v8;
  *((_QWORD *)v6 + 10) = (id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D04910]);
  *((_QWORD *)v6 + 13) = CFSTR("com.apple");
  *((_DWORD *)v6 + 28) = 0;
  *((_QWORD *)v6 + 15) = 0;
  v9 = *MEMORY[0x1E0D047F0];
  if (objc_msgSend((id)objc_msgSend(*((id *)v6 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E0D047F0]), "intValue") == 16)
  {
    v10 = 2;
  }
  else
  {
    if (objc_msgSend((id)objc_msgSend(*((id *)v6 + 8), "objectForKeyedSubscript:", v9), "intValue") != 15)
    {
      *((_DWORD *)v6 + 25) = 0;
      goto LABEL_8;
    }
    v10 = 3;
  }
  *((_DWORD *)v6 + 25) = v10;
LABEL_8:
  v67 = (__CFString *)objc_msgSend(v6, "deviceType");
  if ((-[__CFString isEqualToString:](v67, "isEqualToString:", CFSTR("AVCaptureDeviceTypeExternal")) & 1) != 0)
    v11 = 0;
  else
    v11 = (int)objc_msgSend((id)objc_msgSend(*((id *)v6 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E0D048B0]), "intValue");
  *((_QWORD *)v6 + 11) = v11;
  if (objc_msgSend((id)objc_msgSend(*((id *)v6 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E0D04828]), "BOOLValue"))v12 = 2;
  else
    v12 = 0;
  *((_QWORD *)v6 + 42) = v12;
  __asm { FMOV            V0.2D, #0.5 }
  v70 = _Q0;
  *(_OWORD *)(v6 + 344) = _Q0;
  *((_DWORD *)v6 + 90) = -1082130432;
  *((_QWORD *)v6 + 46) = 0;
  v6[376] = 0;
  v6[377] = objc_msgSend(v6, "isFocusModeSupported:", 2);
  v6[378] = 0;
  v6[379] = 0;
  v18 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *((_OWORD *)v6 + 24) = *MEMORY[0x1E0C9D628];
  *((_OWORD *)v6 + 25) = v18;
  v6[416] = 0;
  if (objc_msgSend((id)objc_msgSend(*((id *)v6 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E0D04800]), "BOOLValue"))v19 = 2;
  else
    v19 = 0;
  *((_QWORD *)v6 + 53) = v19;
  *((_QWORD *)v6 + 56) = 0;
  *((_OWORD *)v6 + 27) = xmmword_19EEEA8C0;
  *((_DWORD *)v6 + 114) = -1082130432;
  *((_DWORD *)v6 + 115) = 0;
  *((_DWORD *)v6 + 116) = 2139095039;
  *(_OWORD *)(v6 + 472) = v70;
  v6[488] = objc_msgSend(v6, "isExposureModeSupported:", 2);
  if (objc_msgSend((id)objc_msgSend(*((id *)v6 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E0D04948]), "BOOLValue"))v20 = 2;
  else
    v20 = 0;
  *((_QWORD *)v6 + 68) = v20;
  *((_QWORD *)v6 + 69) = 0xBF800000BF800000;
  *((_DWORD *)v6 + 140) = -1082130432;
  *(_QWORD *)(v6 + 564) = 0xBF800000BF800000;
  *((_DWORD *)v6 + 143) = -1082130432;
  *((_QWORD *)v6 + 77) = 0xBFF0000000000000;
  v6[624] = 1;
  v6[657] = 1;
  *((_QWORD *)v6 + 83) = objc_alloc_init(AVCaptureDeviceControlRequestQueue);
  *((_QWORD *)v6 + 84) = objc_alloc_init(AVCaptureDeviceControlRequestQueue);
  *((_QWORD *)v6 + 85) = objc_alloc_init(AVCaptureDeviceControlRequestQueue);
  *((_QWORD *)v6 + 86) = objc_alloc_init(AVCaptureDeviceControlRequestQueue);
  *((_QWORD *)v6 + 92) = 0;
  v6[746] = 0;
  v6[768] = objc_msgSend(v6, "hasFlash");
  *((_QWORD *)v6 + 97) = 0;
  v6[784] = 0;
  *((_DWORD *)v6 + 197) = 0;
  v6[792] = objc_msgSend(v6, "hasTorch");
  v6[797] = 0;
  v6[793] = +[AVCaptureFigVideoDevice _cameraAccessIsEnabled](AVCaptureFigVideoDevice, "_cameraAccessIsEnabled");
  v6[794] = 0;
  v21 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_OWORD *)(v6 + 808) = *MEMORY[0x1E0C9D648];
  *(_OWORD *)(v6 + 824) = v21;
  *((_DWORD *)v6 + 210) = 0;
  *((_DWORD *)v6 + 216) = 1065353216;
  *((_DWORD *)v6 + 217) = 0;
  *((_DWORD *)v6 + 218) = 0;
  *((_DWORD *)v6 + 219) = 1097859072;
  *((_QWORD *)v6 + 110) = 0x3FF0000000000000;
  if (!AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureFaceDrivenAEAFOnByDefault")))
    goto LABEL_24;
  if (v6[377])
  {
    if (v6[488])
      v22 = 3;
    else
      v22 = 2;
    goto LABEL_28;
  }
  if (!v6[488])
  {
LABEL_24:
    *((_DWORD *)v6 + 200) = 0;
    goto LABEL_29;
  }
  v22 = 1;
LABEL_28:
  *((_DWORD *)v6 + 200) = v22;
LABEL_29:
  *((_QWORD *)v6 + 115) = objc_alloc_init(MEMORY[0x1E0C99E60]);
  *((_QWORD *)v6 + 116) = 1;
  *((_QWORD *)v6 + 91) = 0;
  if (objc_msgSend(v6, "_isBravoVariant"))
  {
    *((_QWORD *)v6 + 121) = 1;
    *((_QWORD *)v6 + 122) = 0;
    *((_QWORD *)v6 + 123) = 1;
    *((_QWORD *)v6 + 124) = 0;
  }
  v6[844] = 1;
  *((_QWORD *)v6 + 140) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = *MEMORY[0x1E0D04CC8];
  v94[0] = CFSTR("lensPosition");
  v94[1] = CFSTR("exposureDuration");
  v24 = *MEMORY[0x1E0D04C80];
  v95[0] = v23;
  v95[1] = v24;
  v25 = *MEMORY[0x1E0D04D00];
  v94[2] = CFSTR("ISO");
  v94[3] = CFSTR("exposureTargetOffset");
  v26 = *MEMORY[0x1E0D04CA0];
  v95[2] = v25;
  v95[3] = v26;
  v27 = *MEMORY[0x1E0D04C50];
  v94[4] = CFSTR("deviceWhiteBalanceGains");
  v94[5] = CFSTR("grayWorldDeviceWhiteBalanceGains");
  v28 = *MEMORY[0x1E0D04CF0];
  v95[4] = v27;
  v95[5] = v28;
  v94[6] = CFSTR("documentSceneConfidence");
  v95[6] = *MEMORY[0x1E0D04D78];
  v29 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 7), "mutableCopy");
  *((_QWORD *)v6 + 138) = v29;
  v92[0] = objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("lensPosition"));
  v93[0] = &unk_1E424D0B0;
  v92[1] = objc_msgSend(*((id *)v6 + 138), "objectForKeyedSubscript:", CFSTR("exposureDuration"));
  v93[1] = &unk_1E424D0B0;
  v92[2] = objc_msgSend(*((id *)v6 + 138), "objectForKeyedSubscript:", CFSTR("ISO"));
  v93[2] = &unk_1E424D0B0;
  v92[3] = objc_msgSend(*((id *)v6 + 138), "objectForKeyedSubscript:", CFSTR("exposureTargetOffset"));
  v93[3] = &unk_1E424D0B0;
  v92[4] = objc_msgSend(*((id *)v6 + 138), "objectForKeyedSubscript:", CFSTR("deviceWhiteBalanceGains"));
  v93[4] = &unk_1E424D0B0;
  v92[5] = objc_msgSend(*((id *)v6 + 138), "objectForKeyedSubscript:", CFSTR("grayWorldDeviceWhiteBalanceGains"));
  v93[5] = &unk_1E424D0B0;
  v92[6] = objc_msgSend(*((id *)v6 + 138), "objectForKeyedSubscript:", CFSTR("documentSceneConfidence"));
  v93[6] = &unk_1E424D0B0;
  *((_QWORD *)v6 + 137) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 7), "mutableCopy");
  *((_QWORD *)v6 + 136) = dispatch_queue_create("com.apple.avfoundation.videocapturedevice.observed_properties_queue", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection"), "registerObserver:", v6);
  v30 = (void *)objc_msgSend(v6, "_copyFormatsArray");
  *((_QWORD *)v6 + 17) = v30;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v30;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
  v32 = &OBJC_IVAR___AVCaptureResolvedPhotoSettingsInternal_photoManifest;
  if (v31)
  {
    v33 = v31;
    v71 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v83 != v71)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        if (!*((_QWORD *)v6 + 18)
          && objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "isDefaultActiveFormat"))
        {
          *((_QWORD *)v6 + 18) = v35;
          v36 = v6 + 232;
          if (v35)
          {
            objc_msgSend(v35, "defaultActiveMinFrameDurationForSessionPreset:", 0);
            v37 = v80;
            *((_QWORD *)v6 + 31) = v81;
            *v36 = v37;
            objc_msgSend(v35, "defaultActiveMaxFrameDurationForSessionPreset:", 0);
          }
          else
          {
            *(_QWORD *)v36 = 0;
            *((_QWORD *)v6 + 30) = 0;
            *((_QWORD *)v6 + 31) = 0;
            v80 = 0uLL;
            v81 = 0;
          }
          v38 = v80;
          *((_QWORD *)v6 + 37) = v81;
          *(_OWORD *)(v6 + 280) = v38;
          objc_msgSend(v35, "videoMaxZoomFactor");
          *((_QWORD *)v6 + 111) = v39;
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          v40 = (void *)objc_msgSend(*((id *)v6 + 18), "supportedDepthDataFormats");
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v77;
            while (2)
            {
              for (j = 0; j != v42; ++j)
              {
                if (*(_QWORD *)v77 != v43)
                  objc_enumerationMutation(v40);
                v45 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
                if (objc_msgSend(v45, "isDefaultActiveFormat"))
                {
                  v46 = v45;
                  *((_QWORD *)v6 + 19) = v46;
                  v47 = (void *)objc_msgSend((id)objc_msgSend(v46, "videoSupportedFrameRateRanges"), "lastObject");
                  if (v47)
                  {
                    objc_msgSend(v47, "minFrameDuration");
                  }
                  else
                  {
                    v80 = 0uLL;
                    v81 = 0;
                  }
                  v32 = &OBJC_IVAR___AVCaptureResolvedPhotoSettingsInternal_photoManifest;
                  v48 = v80;
                  *((_QWORD *)v6 + 23) = v81;
                  *(_OWORD *)(v6 + 168) = v48;
                  goto LABEL_54;
                }
              }
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
              v32 = &OBJC_IVAR___AVCaptureResolvedPhotoSettingsInternal_photoManifest;
              if (v42)
                continue;
              break;
            }
          }
        }
LABEL_54:
        if (!v6[1211])
          v6[1211] = objc_msgSend(v35, "isCenterStageSupported");
        if (!v6[1298])
          v6[1298] = objc_msgSend((id)objc_msgSend(v35, "figCaptureSourceVideoFormat"), "isManualFramingSupported");
        if (!v6[1249])
          v6[1249] = objc_msgSend(v35, "isBackgroundBlurSupported");
        if (!v6[1252])
          v6[1252] = objc_msgSend(v35, "isStudioLightSupported");
        if (!v6[1255])
          v6[1255] = objc_msgSend(v35, "reactionEffectsSupported");
        v49 = v32[528];
        if (!v6[v49])
          v6[v49] = objc_msgSend(v35, "isBackgroundReplacementSupported");
        if (!v6[192])
          v6[192] = objc_msgSend(v35, "isContinuousZoomWithDepthSupported");
      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    }
    while (v33);
  }
  objc_msgSend(v6, "_initializeContinuousZoomWithDepthActiveWithEnabled:", v6[192]);
  *((_QWORD *)v6 + 113) = 0x3FF0000000000000;
  if (-[__CFString isEqualToString:](v67, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTelephotoCamera")))
  {
    FloatAnswerWithDefault = AVGestaltGetFloatAnswerWithDefault((uint64_t)CFSTR("AVGQWideCameraToTelephotoCameraRelativeZoomFactor"), 1.0);
  }
  else
  {
    FloatAnswerWithDefault = 0.5;
    if ((-[__CFString isEqualToString:](v67, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera")) & 1) == 0
      && (-[__CFString isEqualToString:](v67, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInDualWideCamera")) & 1) == 0
      && !-[__CFString isEqualToString:](v67, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTripleCamera")))
    {
      goto LABEL_76;
    }
  }
  *((double *)v6 + 113) = FloatAnswerWithDefault;
LABEL_76:
  v51 = 1;
  v6[1336] = 1;
  *((_DWORD *)v6 + 284) = 0;
  *((_QWORD *)v6 + 141) = -[AVCaptureSystemPressureState initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:]([AVCaptureSystemPressureState alloc], "initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:", *((unsigned int *)v6 + 284), 0, objc_msgSend(v6, "_recommendedFrameRateRangeForVideoFormat:depthFormat:figSystemPressureLevel:", *((_QWORD *)v6 + 18), *((_QWORD *)v6 + 19), 0));
  v6[1168] = objc_msgSend(v6, "isGeometricDistortionCorrectionSupported");
  v52 = *MEMORY[0x1E0D04E70];
  v88[0] = *MEMORY[0x1E0D04E78];
  v88[1] = v52;
  v89[0] = &unk_1E424D0C8;
  v89[1] = MEMORY[0x1E0C9AA70];
  *((_QWORD *)v6 + 95) = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 2);
  if (v67 == CFSTR("AVCaptureDeviceTypeBuiltInTimeOfFlightCamera"))
    *((_QWORD *)v6 + 148) = 1;
  v6[1208] = 1;
  ModelSpecificName = (void *)FigCaptureGetModelSpecificName();
  if ((objc_msgSend(ModelSpecificName, "isEqualToString:", CFSTR("D52g")) & 1) == 0)
    v51 = objc_msgSend(ModelSpecificName, "isEqualToString:", CFSTR("D16"));
  v6[1209] = v51;
  v6[1210] = 1;
  v6[1212] = 0;
  v6[1213] = 1;
  *((_QWORD *)v6 + 152) = 0;
  *((_QWORD *)v6 + 153) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)v6 + 77) = _Q0;
  *((_DWORD *)v6 + 325) = 0;
  *((_DWORD *)v6 + 326) = 0;
  *((_QWORD *)v6 + 164) = 0x3FF0000000000000;
  *((_QWORD *)v6 + 165) = 0x4008000000000000;
  *((_QWORD *)v6 + 166) = *((_QWORD *)v6 + 110);
  if (v67 == CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera"))
  {
    *((_QWORD *)v6 + 165) = 0x4018000000000000;
    if ((id)MGCopyAnswer() == (id)*MEMORY[0x1E0C9AE50] && objc_msgSend(v6, "position") == 2)
      *((_QWORD *)v6 + 166) = 0x4000000000000000;
  }
  v6[1250] = 0;
  v6[1251] = 1;
  v6[1253] = 0;
  v6[1254] = 1;
  v6[1256] = 0;
  v6[1257] = 1;
  v6[1259] = 0;
  v6[1260] = 1;
  if (v67 == CFSTR("AVCaptureDeviceTypeDeskViewCamera"))
    *((_QWORD *)v6 + 161) = 2;
  v6[795] = objc_msgSend((id)objc_msgSend(v6, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04CF8]), "BOOLValue");
  v6[796] = objc_msgSend((id)objc_msgSend(v6, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04D60]), "BOOLValue");
  if (v68)
  {
    v6[96] = 1;
    v55 = (void *)objc_msgSend(v6, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04E38]);
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v73;
      v59 = *MEMORY[0x1E0D04E00];
      v60 = *MEMORY[0x1E0D04C90];
      do
      {
        for (k = 0; k != v57; ++k)
        {
          if (*(_QWORD *)v73 != v58)
            objc_enumerationMutation(v55);
          v62 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
          v63 = (void *)objc_msgSend(v55, "objectForKeyedSubscript:", v62);
          v64 = v6 + 864;
          if ((objc_msgSend(v62, "isEqualToString:", v59) & 1) == 0)
          {
            v64 = v6 + 460;
            if (!objc_msgSend(v62, "isEqualToString:", v60))
              continue;
          }
          objc_msgSend(v63, "floatValue");
          *v64 = v65;
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
      }
      while (v57);
    }
  }
  dispatch_resume(*((dispatch_object_t *)v6 + 9));
  if (v6[1211])
  {
    objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v6, CFSTR("centerStageEnabled"), 7, AVCaptureFigVideoDeviceCenterStageEnabledChangedContext);
    objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v6, CFSTR("centerStageFramingMode"), 3, AVCaptureFigVideoDeviceCenterStageFramingModeChangedContext);
  }
  if (v6[1249])
  {
    objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v6, CFSTR("backgroundBlurEnabled"), 7, AVCaptureFigVideoDeviceBackgroundBlurEnabledChangedContext);
    objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v6, CFSTR("backgroundBlurAperture"), 7, AVCaptureFigVideoDeviceBackgroundBlurApertureChangedContext);
  }
  if (v6[1252])
  {
    objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v6, CFSTR("studioLightEnabled"), 7, AVCaptureFigVideoDeviceStudioLightingEnabledChangedContext);
    objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v6, CFSTR("studioLightingIntensity"), 7, AVCaptureFigVideoDeviceStudioLightingIntensityChangedContext);
  }
  if (v6[1255])
  {
    objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v6, CFSTR("reactionEffectsEnabled"), 7, AVCaptureFigVideoDeviceReactionEffectsEnabledChangedContext);
    objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v6, CFSTR("reactionEffectGesturesEnabled"), 7, AVCaptureFigVideoDeviceGesturesEnabledChangedContext);
  }
  if (v6[1258])
  {
    objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v6, CFSTR("backgroundReplacementEnabled"), 7, AVCaptureFigVideoDeviceBackgroundReplacementEnabledChangedContext);
    objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v6, CFSTR("backgroundReplacementPixelBuffer"), 7, AVCaptureFigVideoDeviceBackgroundReplacementPixelBufferChangedContext);
  }
  if (v6[1252] || v6[1249])
    objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v6, CFSTR("portraitEffectStudioLightQuality"), 7, AVCaptureFigVideoDevicePortraitEffectStudioLightQualityChangedContext);
  return v6;
}

- (AVCaptureFigVideoDevice)init
{
  AVCaptureFigVideoDevice *v2;
  AVCaptureFigVideoDevice *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureFigVideoDevice;
  v2 = -[AVCaptureDevice init](&v5, sel_init);
  if (v2)
  {
    v3 = v2;
    NSLog(CFSTR("-[AVCaptureDevice init] - Cannot directly instantiate a AVCaptureDevice object."));

  }
  return 0;
}

- (id)initProxyDeviceWithUniqueID:(id)a3 targetClientAuditToken:(id *)a4
{
  uint64_t v5;
  const void *v6;
  id v7;
  void *v8;

  if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementProxyDevices) & 1) == 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
    return 0;
  }
  v5 = FigCaptureSourceRemoteCopyProxySource();
  if (!v5)
  {

    return 0;
  }
  v6 = (const void *)v5;
  v7 = -[AVCaptureFigVideoDevice _initWithFigCaptureSource:isProxy:](self, "_initWithFigCaptureSource:isProxy:", v5, 1);
  CFRelease(v6);
  return v7;
}

- (void)dealloc
{
  unint64_t v3;
  objc_super v4;

  -[AVCaptureFigVideoDevice _setFigCaptureSource:allowSendingWorkToMainThread:](self, "_setFigCaptureSource:allowSendingWorkToMainThread:", 0, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection"), "unregisterObserver:", self);
  if (BYTE3(self->_degradedCaptureQualityFactors))
  {
    objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:context:", self, CFSTR("centerStageEnabled"), AVCaptureFigVideoDeviceCenterStageEnabledChangedContext);
    objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:context:", self, CFSTR("centerStageFramingMode"), AVCaptureFigVideoDeviceCenterStageFramingModeChangedContext);
  }
  if (BYTE1(self->_centerStageRectOfInterest.size.height))
  {
    objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:context:", self, CFSTR("backgroundBlurEnabled"), AVCaptureFigVideoDeviceBackgroundBlurEnabledChangedContext);
    objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:context:", self, CFSTR("backgroundBlurAperture"), AVCaptureFigVideoDeviceBackgroundBlurApertureChangedContext);
  }
  if (BYTE4(self->_centerStageRectOfInterest.size.height))
  {
    objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:context:", self, CFSTR("studioLightEnabled"), AVCaptureFigVideoDeviceStudioLightingEnabledChangedContext);
    objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:context:", self, CFSTR("studioLightingIntensity"), AVCaptureFigVideoDeviceStudioLightingIntensityChangedContext);
  }
  if (HIBYTE(self->_centerStageRectOfInterest.size.height))
  {
    objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:context:", self, CFSTR("reactionEffectsEnabled"), AVCaptureFigVideoDeviceReactionEffectsEnabledChangedContext);
    objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:context:", self, CFSTR("reactionEffectGesturesEnabled"), AVCaptureFigVideoDeviceGesturesEnabledChangedContext);
  }
  if (self->_backgroundBlurActive)
  {
    objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:context:", self, CFSTR("backgroundReplacementEnabled"), AVCaptureFigVideoDeviceBackgroundReplacementEnabledChangedContext);
    objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:context:", self, CFSTR("backgroundReplacementPixelBuffer"), AVCaptureFigVideoDeviceBackgroundReplacementPixelBufferChangedContext);
  }
  if (BYTE1(self->_centerStageRectOfInterest.size.height) || BYTE4(self->_centerStageRectOfInterest.size.height))
    objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:context:", self, CFSTR("portraitEffectStudioLightQuality"), AVCaptureFigVideoDevicePortraitEffectStudioLightQualityChangedContext);

  if (*(_QWORD *)&self->_adjustingWB)
  {
    v3 = 0;
    do
      free(*(void **)&self->_wbCalibrationTemperatures[v3++]);
    while (*(_QWORD *)&self->_adjustingWB > v3);
  }
  free(self->_wbCalibrationTemperatures);
  free((void *)self->_wbCalibrationCount);
  *(_QWORD *)&self->_adjustingWB = 0;

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureFigVideoDevice;
  -[AVCaptureDevice dealloc](&v4, sel_dealloc);
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  objc_super v9;

  -[AVCaptureFigVideoDevice _decrementObserverCountForHighFrequencyProperty:](self, "_decrementObserverCountForHighFrequencyProperty:", a4);
  v9.receiver = self;
  v9.super_class = (Class)AVCaptureFigVideoDevice;
  -[AVCaptureFigVideoDevice removeObserver:forKeyPath:context:](&v9, sel_removeObserver_forKeyPath_context_, a3, a4, a5);
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  objc_super v7;

  -[AVCaptureFigVideoDevice _decrementObserverCountForHighFrequencyProperty:](self, "_decrementObserverCountForHighFrequencyProperty:", a4);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureFigVideoDevice;
  -[AVCaptureFigVideoDevice removeObserver:forKeyPath:](&v7, sel_removeObserver_forKeyPath_, a3, a4);
}

void __75__AVCaptureFigVideoDevice__incrementObserverCountForHighFrequencyProperty___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  CMTime v13;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyFigCaptureSourceProperty:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v3 = (void *)v2;
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("lensPosition")))
    {
      objc_msgSend(v3, "floatValue");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 360;
LABEL_10:
      *(_DWORD *)(v5 + v6) = v4;
      goto LABEL_11;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("exposureDuration")))
    {
      v7 = *(_QWORD *)(a1 + 32) + 432;
      CMTimeMakeFromDictionary(&v13, (CFDictionaryRef)v3);
      v8 = *(_OWORD *)&v13.value;
      *(_QWORD *)(v7 + 16) = v13.epoch;
      *(_OWORD *)v7 = v8;
      goto LABEL_11;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("ISO")))
    {
      objc_msgSend(v3, "floatValue");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 456;
      goto LABEL_10;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("exposureTargetOffset")))
    {
      objc_msgSend(v3, "floatValue");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 464;
      goto LABEL_10;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("deviceWhiteBalanceGains")))
    {
      if (objc_msgSend(v3, "length") != 12)
        goto LABEL_11;
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 552;
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("grayWorldDeviceWhiteBalanceGains")))
      {
        if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("documentSceneConfidence")))
        {
          v11 = *(_QWORD *)(a1 + 32);
          v12 = *(const void **)(v11 + 648);
          *(_QWORD *)(v11 + 648) = v3;
          CFRetain(v3);
          if (v12)
            CFRelease(v12);
        }
        goto LABEL_11;
      }
      if (objc_msgSend(v3, "length") != 12)
      {
LABEL_11:

        return;
      }
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 564;
    }
    objc_msgSend(v3, "getBytes:length:", v9 + v10, 12);
    goto LABEL_11;
  }
}

- (void)_decrementObserverCountForHighFrequencyProperty:(id)a3
{
  NSDictionary *hevcEncoderSettings;
  _QWORD v4[6];

  hevcEncoderSettings = self->_hevcEncoderSettings;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__AVCaptureFigVideoDevice__decrementObserverCountForHighFrequencyProperty___block_invoke;
  v4[3] = &unk_1E4216408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(&hevcEncoderSettings->super, v4);
}

void *__75__AVCaptureFigVideoDevice__decrementObserverCountForHighFrequencyProperty___block_invoke(uint64_t a1)
{
  void *result;
  int v3;
  int v4;
  int v5;

  result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "objectForKeyedSubscript:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  if (result)
  {
    v3 = objc_msgSend(result, "intValue");
    if (v3 <= 1)
      v4 = 1;
    else
      v4 = v3;
    v5 = v4 - 1;
    result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v4 - 1)), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
    if (!v5)
      return (void *)objc_msgSend(*(id *)(a1 + 32), "_updateFigCaptureSourceObserverCounts");
  }
  return result;
}

- (void)_updateFigCaptureSourceObserverCounts
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  if (!_FigIsCurrentDispatchQueue())
  {
    v5 = v2;
    LODWORD(v4) = 0;
    FigDebugAssert3();
  }
  if (-[AVCaptureFigVideoDevice lockForConfiguration:](self, "lockForConfiguration:", 0, v4, v5))
  {
    -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04D30], self->_observedHighFrequencyPropertiesQueue);
    -[AVCaptureFigVideoDevice unlockForConfiguration](self, "unlockForConfiguration");
  }
}

- (BOOL)_hasKeyValueObserversForHighFrequencyProperty:(id)a3
{
  NSDictionary *hevcEncoderSettings;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  hevcEncoderSettings = self->_hevcEncoderSettings;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__AVCaptureFigVideoDevice__hasKeyValueObserversForHighFrequencyProperty___block_invoke;
  block[3] = &unk_1E42178E0;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(&hevcEncoderSettings->super, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __73__AVCaptureFigVideoDevice__hasKeyValueObserversForHighFrequencyProperty___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 1096), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1[4] + 1104), "objectForKeyedSubscript:", a1[5])), "intValue");
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (int)result > 0;
  return result;
}

uint64_t __77__AVCaptureFigVideoDevice__setFigCaptureSource_allowSendingWorkToMainThread___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drainManualControlRequestQueues");
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  int v5;
  int v6;
  NSObject *devicePropsQueue;
  NSString *const *v8;
  NSString *v9;
  _QWORD v10[5];
  char v11;

  v5 = +[AVCaptureFigVideoDevice _cameraAccessIsEnabled](AVCaptureFigVideoDevice, "_cameraAccessIsEnabled", a3, a4);
  if (*((unsigned __int8 *)&self->_torchActive + 1) != v5)
  {
    v6 = v5;
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("connected"));
    devicePropsQueue = self->_devicePropsQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __100__AVCaptureFigVideoDevice_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo___block_invoke;
    v10[3] = &unk_1E4217A10;
    v10[4] = self;
    v11 = v6;
    dispatch_sync(devicePropsQueue, v10);
    v8 = &AVCaptureDeviceWasConnectedNotification;
    if (!v6)
      v8 = &AVCaptureDeviceWasDisconnectedNotification;
    v9 = *v8;
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("connected"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", v9, self);
  }
}

uint64_t __100__AVCaptureFigVideoDevice_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 793) = *(_BYTE *)(result + 40);
  return result;
}

- (id)modelID
{
  return -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04890]);
}

- (id)manufacturer
{
  return -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04880]);
}

- (BOOL)isProxyDevice
{
  return self->_proxyDevice;
}

+ (void)_releaseStaticResources
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v4;
  os_log_type_t type;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6C0)
  {
    v6 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCameraHistoryLock);
  if (sSystemPreferredCamera)
  {

    sSystemPreferredCamera = 0;
  }
  if (sUserPreferredCamera)
  {

    sUserPreferredCamera = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sCameraHistoryLock);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___AVCaptureFigVideoDevice;
  objc_msgSendSuper2(&v4, sel__releaseStaticResources);
}

__n128 __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_3(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(a1 + 32) + 280);
  v2 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v3 = v2[3].n128_u64[0];
  result = v2[2];
  *v1 = result;
  v1[1].n128_u64[0] = v3;
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1140) = 0;
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_5(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1170) = 0;
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_6(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 1176) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_7(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1212) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_8(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1250) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_9(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1253) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_10(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1256) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_12(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 856) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_14(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1141) = 0;
  return result;
}

id __102__AVCaptureFigVideoDevice__setActiveFormat_resetVideoZoomFactorAndMinMaxFrameDurations_sessionPreset___block_invoke_15(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128) = result;
  return result;
}

- (BOOL)isContinuousZoomWithDepthSupported
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__AVCaptureFigVideoDevice_isContinuousZoomWithDepthSupported__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __61__AVCaptureFigVideoDevice_isContinuousZoomWithDepthSupported__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 192);
  return result;
}

- (BOOL)isContinuousZoomWithDepthEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVCaptureFigVideoDevice_isContinuousZoomWithDepthEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__AVCaptureFigVideoDevice_isContinuousZoomWithDepthEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 193);
  return result;
}

- (void)setContinuousZoomWithDepthEnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  _QWORD block[7];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  if (a3 && !-[AVCaptureFigVideoDevice isContinuousZoomWithDepthSupported](self, "isContinuousZoomWithDepthSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__AVCaptureFigVideoDevice_setContinuousZoomWithDepthEnabled___block_invoke;
    block[3] = &unk_1E4217AB0;
    block[4] = self;
    block[5] = &v9;
    v8 = a3;
    block[6] = &v13;
    dispatch_sync(devicePropsQueue, block);
    if (*((_BYTE *)v14 + 24))
      -[AVCaptureFigVideoDevice _updateActiveDepthDataFormatForContinuousZoomWithDepth](self, "_updateActiveDepthDataFormatForContinuousZoomWithDepth");
    if (*((_BYTE *)v10 + 24))
      -[AVCaptureFigVideoDevice _updateMinMaxDefaultVideoZoomFactors](self, "_updateMinMaxDefaultVideoZoomFactors");
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __61__AVCaptureFigVideoDevice_setContinuousZoomWithDepthEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateContinuousZoomWithDepthActiveWithEnabled:disallowed:isActiveDepthDataFormatChangingOut:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 195), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_updateActiveDepthDataFormatForContinuousZoomWithDepth
{
  uint64_t v2;
  NSObject *devicePropsQueue;
  uint64_t v5;
  uint64_t v6;
  _QWORD block[5];

  if (!_FigIsNotCurrentDispatchQueue())
  {
    v6 = v2;
    LODWORD(v5) = 0;
    FigDebugAssert3();
  }
  -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeDepthDataFormat"), v5, v6);
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__AVCaptureFigVideoDevice__updateActiveDepthDataFormatForContinuousZoomWithDepth__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  dispatch_sync(devicePropsQueue, block);
  -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeDepthDataFormat"));
}

__n128 __81__AVCaptureFigVideoDevice__updateActiveDepthDataFormatForContinuousZoomWithDepth__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __n128 result;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 *v12;
  void *v13;
  __n128 v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "isContinuousZoomWithDepthEnabled"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "supportedDepthDataFormats");
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v3)
    {
      v5 = v3;
      v6 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v8, "isDefaultActiveFormat"))
          {

            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = v8;
            v11 = *(_QWORD *)(a1 + 32);
            v12 = (__n128 *)(v11 + 168);
            v13 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v11 + 152), "videoSupportedFrameRateRanges"), "lastObject");
            if (v13)
            {
              objc_msgSend(v13, "minFrameDuration");
            }
            else
            {
              v14 = 0uLL;
              v15 = 0;
            }
            result = v14;
            v12[1].n128_u64[0] = v15;
            *v12 = v14;
            return result;
          }
        }
        v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          continue;
        break;
      }
    }
  }
  else
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
    v9 = *(_QWORD *)(a1 + 32) + 168;
    v10 = MEMORY[0x1E0CA2E68];
    result = *(__n128 *)MEMORY[0x1E0CA2E68];
    *(_OWORD *)v9 = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)(v9 + 16) = *(_QWORD *)(v10 + 16);
  }
  return result;
}

- (void)resetVideoMinFrameDurationOverrideForOwner:(id)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[6];

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__AVCaptureFigVideoDevice_resetVideoMinFrameDurationOverrideForOwner___block_invoke;
  v4[3] = &unk_1E4216408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(devicePropsQueue, v4);
}

__n128 __70__AVCaptureFigVideoDevice_resetVideoMinFrameDurationOverrideForOwner___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __n128 result;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 224) == *(_QWORD *)(a1 + 40))
  {
    v2 = v1 + 200;
    v3 = MEMORY[0x1E0CA2E18];
    result = *(__n128 *)MEMORY[0x1E0CA2E18];
    *(_OWORD *)v2 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v2 + 16) = *(_QWORD *)(v3 + 16);
  }
  return result;
}

uint64_t __67__AVCaptureFigVideoDevice__setActiveVideoMinFrameDurationInternal___block_invoke_214(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E0D04B88], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)/ (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32)), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 328));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v3 = *(_QWORD *)(a1 + 32) + 232;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(_QWORD *)(v4 + 48);
    *(_OWORD *)v3 = *(_OWORD *)(v4 + 32);
    *(_QWORD *)(v3 + 16) = v5;
    if (dword_1ECFED6C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 424) == 3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 712);
    *(_OWORD *)(v7 + 32) = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 696);
    *(_QWORD *)(v7 + 48) = v8;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 720);
  }
  return result;
}

__n128 __58__AVCaptureFigVideoDevice_setActiveVideoMinFrameDuration___block_invoke_2(uint64_t a1)
{
  __n128 *v2;
  uint64_t v3;
  __n128 result;
  __n128 *v5;
  uint64_t v6;
  __int128 *v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  __n128 *v11;
  __n128 *v12;
  CMTime v13;
  CMTime time1;

  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 256);
  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    v5 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
    result = v5[2];
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = v5[3].n128_u64[0];
    *v2 = result;
  }
  else
  {
    v3 = MEMORY[0x1E0CA2E18];
    result = *(__n128 *)MEMORY[0x1E0CA2E18];
    *v2 = *(__n128 *)MEMORY[0x1E0CA2E18];
    v2[1].n128_u64[0] = *(_QWORD *)(v3 + 16);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = (__int128 *)(v6 + 256);
  if ((*(_BYTE *)(v6 + 268) & 1) != 0)
  {
    v8 = (__int128 *)(v6 + 304);
    if ((*((_BYTE *)v8 + 12) & 1) != 0)
    {
      v9 = *v8;
      time1.epoch = *((_QWORD *)v8 + 2);
      *(_OWORD *)&time1.value = v9;
      v10 = *v7;
      v13.epoch = *((_QWORD *)v7 + 2);
      *(_OWORD *)&v13.value = v10;
      if (CMTimeCompare(&time1, &v13) < 0)
      {
        v11 = *(__n128 **)(a1 + 32);
        v12 = v11 + 19;
        v11 += 16;
        result = *v11;
        v12[1].n128_u64[0] = v11[1].n128_u64[0];
        *v12 = result;
      }
    }
  }
  return result;
}

uint64_t __67__AVCaptureFigVideoDevice__setActiveVideoMaxFrameDurationInternal___block_invoke_225(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  CMTime time2;
  CMTime time1;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E0D04B90], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)/ (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32)), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 328));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v3 = *(_QWORD *)(a1 + 32) + 280;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(_QWORD *)(v4 + 48);
    *(_OWORD *)v3 = *(_OWORD *)(v4 + 32);
    *(_QWORD *)(v3 + 16) = v5;
    if (dword_1ECFED6C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 424) == 3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 712);
    *(_OWORD *)(v7 + 32) = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 696);
    *(_QWORD *)(v7 + 48) = v8;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 720);
    time1 = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32);
    memset(&time2, 0, sizeof(time2));
    result = CMTimeCompare(&time1, &time2);
    if ((_DWORD)result)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v10 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 280);
      time1.epoch = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296);
      *(_OWORD *)&time1.value = v10;
      time2 = *(CMTime *)(v9 + 32);
      result = CMTimeCompare(&time1, &time2);
      if ((result & 0x80000000) != 0)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v12 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 280);
        *(_QWORD *)(v11 + 48) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296);
        *(_OWORD *)(v11 + 32) = v12;
      }
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMinFrameDurationSetByClient
{
  NSObject *devicePropsQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_19EF10DB5;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AVCaptureFigVideoDevice_activeVideoMinFrameDurationSetByClient__block_invoke;
  block[3] = &unk_1E4217A60;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __65__AVCaptureFigVideoDevice_activeVideoMinFrameDurationSetByClient__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 256);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMaxFrameDurationSetByClient
{
  NSObject *devicePropsQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_19EF10DB5;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AVCaptureFigVideoDevice_activeVideoMaxFrameDurationSetByClient__block_invoke;
  block[3] = &unk_1E4217A60;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __65__AVCaptureFigVideoDevice_activeVideoMaxFrameDurationSetByClient__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 304);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (BOOL)cachesFigCaptureSourceConfigurationChanges
{
  return self->_cachesFigCaptureSourceConfigurationChanges;
}

- (BOOL)supportsMultiCamCaptureWithDevice:(id)a3
{
  int64_t v5;
  int v6;
  int v7;
  _BOOL4 v8;
  NSArray *v9;
  void *v10;
  void *v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = -[AVCaptureFigVideoDevice position](self, "position");
  if (v5 != objc_msgSend(a3, "position"))
    return 1;
  v6 = (objc_msgSend(-[AVCaptureFigVideoDevice deviceType](self, "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInLiDARDepthCamera")) & 1) != 0? 1: objc_msgSend((id)objc_msgSend(a3, "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInLiDARDepthCamera"));
  v7 = (objc_msgSend(-[AVCaptureFigVideoDevice deviceType](self, "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeDeskViewCamera")) & 1) != 0? 1: objc_msgSend((id)objc_msgSend(a3, "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeDeskViewCamera"));
  v8 = -[AVCaptureDevice isVirtualDevice](self, "isVirtualDevice");
  if (((v8 ^ objc_msgSend(a3, "isVirtualDevice") ^ 1 | v6) & 1) == 0 && !v7)
    return 0;
  if (-[AVCaptureFigVideoDevice position](self, "position") == 2
    && (-[AVCaptureFigVideoDevice deviceType](self, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera")
     && (__CFString *)objc_msgSend(a3, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera")
     || -[AVCaptureFigVideoDevice deviceType](self, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera")
     && (__CFString *)objc_msgSend(a3, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera")))
  {
    return 0;
  }
  v9 = -[AVCaptureDevice constituentDevices](self, "constituentDevices");
  if (!-[NSArray count](v9, "count"))
  {
    v14[0] = self;
    v9 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  }
  v10 = (void *)objc_msgSend(a3, "constituentDevices");
  if (!objc_msgSend(v10, "count"))
  {
    v13 = a3;
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
  objc_msgSend(v11, "intersectSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10));
  return !objc_msgSend(v11, "count")
      && -[AVCaptureFigVideoDevice deviceType](self, "deviceType") != CFSTR("AVCaptureDeviceTypeBuiltInInfraredMetadataCamera")
      && (__CFString *)objc_msgSend(a3, "deviceType") != CFSTR("AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera")
      && (__CFString *)objc_msgSend(a3, "deviceType") != CFSTR("AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera");
}

- (id)constituentDeviceWithDeviceType:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[AVCaptureDevice constituentDevices](self, "constituentDevices", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((id)objc_msgSend(v9, "deviceType") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)isConstituentPhotoCalibrationDataSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047B8]), "BOOLValue");
}

- (int)powerConsumptionAt30FPSForOISMode:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 - 1) > 2)
    return 0;
  else
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", **((_QWORD **)&unk_1E4218200 + a3 - 1), v3, v4), "intValue");
}

- (void)setLowLightVideoCaptureEnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  BOOL v10;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if ((objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isLowLightVideoCaptureSupported") & 1) != 0)
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__AVCaptureFigVideoDevice_setLowLightVideoCaptureEnabled___block_invoke;
      block[3] = &unk_1E4217A10;
      block[4] = self;
      v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

uint64_t __58__AVCaptureFigVideoDevice_setLowLightVideoCaptureEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1140) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setVariableFrameRateVideoCaptureEnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  BOOL v10;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if ((objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isVariableFrameRateVideoCaptureSupported") & 1) != 0)
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__AVCaptureFigVideoDevice_setVariableFrameRateVideoCaptureEnabled___block_invoke;
      block[3] = &unk_1E4217A10;
      block[4] = self;
      v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

uint64_t __67__AVCaptureFigVideoDevice_setVariableFrameRateVideoCaptureEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1170) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isAutoVideoFrameRateEnabled
{
  return -[AVCaptureFigVideoDevice isVariableFrameRateVideoCaptureEnabled](self, "isVariableFrameRateVideoCaptureEnabled")|| -[AVCaptureFigVideoDevice isLowLightVideoCaptureEnabled](self, "isLowLightVideoCaptureEnabled");
}

- (void)setAutoVideoFrameRateEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isAutoVideoFrameRateSupported") & 1) != 0)
  {
    if (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isVariableFrameRateVideoCaptureSupported"))
    {
      -[AVCaptureFigVideoDevice setVariableFrameRateVideoCaptureEnabled:](self, "setVariableFrameRateVideoCaptureEnabled:", v3);
    }
    else if (objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isLowLightVideoCaptureSupported"))
    {
      -[AVCaptureFigVideoDevice setLowLightVideoCaptureEnabled:](self, "setLowLightVideoCaptureEnabled:", v3);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

- (void)setVideoStabilizationStrength:(int64_t)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[6];

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if ((objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "isVideoStabilizationStrengthSupported:", a3) & 1) != 0)
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__AVCaptureFigVideoDevice_setVideoStabilizationStrength___block_invoke;
      block[3] = &unk_1E4216650;
      block[4] = self;
      block[5] = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

uint64_t __57__AVCaptureFigVideoDevice_setVideoStabilizationStrength___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 1176) = *(_QWORD *)(result + 40);
  return result;
}

- (BOOL)isStabilizationAutoSelectionCinematicExtendedEnhancedEnabled
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04920]), "BOOLValue") ^ 1;
}

- (int64_t)digitalFlashMode
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_digitalFlashMode__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVCaptureFigVideoDevice_digitalFlashMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 752);
  return result;
}

- (void)_setConnected:(BOOL)a3
{
  BOOL v4;
  NSObject *devicePropsQueue;
  _QWORD block[6];
  BOOL v7;
  _QWORD v8[3];
  char v9;

  v4 = a3
    && +[AVCaptureFigVideoDevice _cameraAccessIsEnabled](AVCaptureFigVideoDevice, "_cameraAccessIsEnabled");
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AVCaptureFigVideoDevice__setConnected___block_invoke;
  block[3] = &unk_1E4217BF0;
  block[4] = self;
  block[5] = v8;
  v7 = v4;
  dispatch_sync(devicePropsQueue, block);
  _Block_object_dispose(v8, 8);
}

uint64_t __41__AVCaptureFigVideoDevice__setConnected___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 793) != *(unsigned __int8 *)(result + 48);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(result + 32) + 793) = *(_BYTE *)(result + 48);
  return result;
}

- (BOOL)isHidden
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__AVCaptureFigVideoDevice_isHidden__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__AVCaptureFigVideoDevice_isHidden__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 795);
  return result;
}

- (BOOL)isReadyToUnhide
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVCaptureFigVideoDevice_isReadyToUnhide__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__AVCaptureFigVideoDevice_isReadyToUnhide__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 796);
  return result;
}

- (void)unhide
{
  NSObject *devicePropsQueue;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AVCaptureFigVideoDevice_unhide__block_invoke;
  block[3] = &unk_1E4217A60;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(devicePropsQueue, block);
  if (*((_BYTE *)v9 + 24))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hidden"));
    v5 = self->_devicePropsQueue;
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __33__AVCaptureFigVideoDevice_unhide__block_invoke_2;
    v6[3] = &unk_1E42165A8;
    v6[4] = self;
    dispatch_sync(v5, v6);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hidden"));
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __33__AVCaptureFigVideoDevice_unhide__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 795);
  return result;
}

uint64_t __33__AVCaptureFigVideoDevice_unhide__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04CF8], MEMORY[0x1E0C9AAA0]);
  if (!(_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 795) = 0;
  return result;
}

- (void)_setAdjustingFocus:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AVCaptureFigVideoDevice__setAdjustingFocus___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __46__AVCaptureFigVideoDevice__setAdjustingFocus___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 364) = *(_BYTE *)(result + 40);
  return result;
}

- (int64_t)autoFocusRangeRestriction
{
  return self->_autoFocusRangeRestriction;
}

- (void)setAutoFocusRangeRestriction:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (-[AVCaptureFigVideoDevice isAutoFocusRangeRestrictionSupported](self, "isAutoFocusRangeRestrictionSupported"))
    {
      self->_autoFocusRangeRestriction = a3;
      return;
    }
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v7 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v7);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
}

- (float)lensPosition
{
  NSObject *devicePropsQueue;
  float v4;
  id v5;
  void *v6;
  int v7;
  _QWORD v9[6];
  uint64_t v10;
  float *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = (float *)&v10;
  v12 = 0x2020000000;
  v13 = -1082130432;
  if (-[AVCaptureFigVideoDevice _hasKeyValueObserversForHighFrequencyProperty:](self, "_hasKeyValueObserversForHighFrequencyProperty:", CFSTR("lensPosition")))
  {
    devicePropsQueue = self->_devicePropsQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__AVCaptureFigVideoDevice_lensPosition__block_invoke;
    v9[3] = &unk_1E4217A60;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(devicePropsQueue, v9);
  }
  v4 = v11[6];
  if (v4 == -1.0)
  {
    v5 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04CC8]);
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "floatValue");
      *((_DWORD *)v11 + 6) = v7;

      v4 = v11[6];
    }
    else
    {
      v11[6] = 1.0;
      v4 = 1.0;
    }
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

float __39__AVCaptureFigVideoDevice_lensPosition__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 360);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isLockingFocusWithCustomLensPositionSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04870]), "BOOLValue");
}

- (void)setFocusModeLockedWithLensPosition:(float)a3 completionHandler:(id)a4
{
  double v7;
  NSObject *devicePropsQueue;
  uint64_t v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[8];
  float v19;
  _QWORD block[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  if (!-[AVCaptureFigVideoDevice isFocusModeSupported:](self, "isFocusModeSupported:", 0))
    goto LABEL_11;
  LODWORD(v7) = 2139095039;
  if (a3 == 3.4028e38)
  {
LABEL_6:
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    v9 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__AVCaptureFigVideoDevice_setFocusModeLockedWithLensPosition_completionHandler___block_invoke;
    block[3] = &unk_1E4217C18;
    block[4] = self;
    block[5] = &v21;
    block[6] = 0;
    dispatch_sync(devicePropsQueue, block);
    if (*((_BYTE *)v22 + 24))
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("focusMode"));
    v10 = self->_devicePropsQueue;
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __80__AVCaptureFigVideoDevice_setFocusModeLockedWithLensPosition_completionHandler___block_invoke_2;
    v18[3] = &unk_1E4217C40;
    v18[4] = self;
    v18[5] = a4;
    v18[6] = &v25;
    v18[7] = 0;
    v19 = a3;
    dispatch_sync(v10, v18);
    v11 = *((_DWORD *)v26 + 6);
    if (v11 == -16452)
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      objc_opt_class();
      v13 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v13);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
    }
    else
    {
      if (*((_BYTE *)v22 + 24))
      {
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("focusMode"));
        v11 = *((_DWORD *)v26 + 6);
      }
      if (v11)
      {
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __80__AVCaptureFigVideoDevice_setFocusModeLockedWithLensPosition_completionHandler___block_invoke_3;
        v17[3] = &unk_1E42165A8;
        v17[4] = self;
        -[AVCaptureFigVideoDevice _performBlockOnMainThread:](self, "_performBlockOnMainThread:", v17);
      }
    }
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
    return;
  }
  if (-[AVCaptureFigVideoDevice isLockingFocusWithCustomLensPositionSupported](self, "isLockingFocusWithCustomLensPositionSupported", v7))
  {
    if (a3 >= 0.0 && a3 <= 1.0)
      goto LABEL_6;
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99858];
    objc_opt_class();
  }
  else
  {
LABEL_11:
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  v16 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v16);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v16);
}

_QWORD *__80__AVCaptureFigVideoDevice_setFocusModeLockedWithLensPosition_completionHandler___block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 336) != result[6];
  return result;
}

uint64_t __80__AVCaptureFigVideoDevice_setFocusModeLockedWithLensPosition_completionHandler___block_invoke_2(uint64_t a1)
{
  AVCaptureDeviceControlRequest *v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  double v7;
  uint64_t result;

  v2 = +[AVCaptureDeviceControlRequest deviceControlRequestWithCompletionBlock:](AVCaptureDeviceControlRequest, "deviceControlRequestWithCompletionBlock:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "enqueueRequest:", v2);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_DWORD *)(a1 + 64);
  v6 = -[AVCaptureDeviceControlRequest requestID](v2, "requestID");
  LODWORD(v7) = v5;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "_setFocusWithMode:lensPosition:requestID:", v4, v6, v7);
  result = -[AVCaptureDeviceControlRequest setErrorCode:](v2, "setErrorCode:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) = *(_QWORD *)(a1 + 56);
  return result;
}

uint64_t __80__AVCaptureFigVideoDevice_setFocusModeLockedWithLensPosition_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleManualControlCompletionForRequestQueue:withPayload:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 664), 0);
}

- (BOOL)isSmoothAutoFocusEnabled
{
  return self->_smoothAutoFocusEnabled;
}

- (void)setSmoothAutoFocusEnabled:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (-[AVCaptureFigVideoDevice isSmoothAutoFocusSupported](self, "isSmoothAutoFocusSupported"))
    {
      self->_smoothAutoFocusEnabled = a3;
      return;
    }
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v7 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v7);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
}

- (BOOL)automaticallyAdjustsFaceDrivenAutoFocusEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__AVCaptureFigVideoDevice_automaticallyAdjustsFaceDrivenAutoFocusEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __73__AVCaptureFigVideoDevice_automaticallyAdjustsFaceDrivenAutoFocusEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 377);
  return result;
}

- (void)setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  BOOL v10;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (-[AVCaptureFigVideoDevice isFocusModeSupported:](self, "isFocusModeSupported:", 2))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77__AVCaptureFigVideoDevice_setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled___block_invoke;
      block[3] = &unk_1E4217A10;
      block[4] = self;
      v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

uint64_t __77__AVCaptureFigVideoDevice_setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 377) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isFaceDrivenAutoFocusEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AVCaptureFigVideoDevice_isFaceDrivenAutoFocusEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__AVCaptureFigVideoDevice_isFaceDrivenAutoFocusEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = (*(_DWORD *)(*(_QWORD *)(result + 32) + 800) & 0xFFFFFFFE) == 2;
  return result;
}

- (void)setFaceDrivenAutoFocusEnabled:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *devicePropsQueue;
  _QWORD block[5];
  BOOL v10;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (-[AVCaptureFigVideoDevice isFocusModeSupported:](self, "isFocusModeSupported:", 2)
      && !-[AVCaptureFigVideoDevice automaticallyAdjustsFaceDrivenAutoFocusEnabled](self, "automaticallyAdjustsFaceDrivenAutoFocusEnabled"))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__AVCaptureFigVideoDevice_setFaceDrivenAutoFocusEnabled___block_invoke;
      block[3] = &unk_1E4217A10;
      v10 = a3;
      block[4] = self;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v7 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v7);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
}

uint64_t __57__AVCaptureFigVideoDevice_setFaceDrivenAutoFocusEnabled___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  _BOOL4 v3;

  v1 = *(_QWORD *)(result + 32);
  if ((*(_DWORD *)(v1 + 800) & 0xFFFFFFFD) == 1)
    v2 = 3;
  else
    v2 = 2;
  if (*(_BYTE *)(result + 40))
    v3 = v2;
  else
    v3 = (*(_DWORD *)(v1 + 800) & 0xFFFFFFFD) == 1;
  *(_DWORD *)(v1 + 800) = v3;
  return result;
}

- (float)focalLength
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04818]), "floatValue");
  return result;
}

- (float)lensAperture
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04860]), "floatValue");
  return result;
}

uint64_t __43__AVCaptureFigVideoDevice_setExposureMode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleManualControlCompletionForRequestQueue:withPayload:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672), 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exposureDuration
{
  NSObject *devicePropsQueue;
  id v6;
  void *v7;
  uint64_t *v8;
  uint64_t *v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v11;
  uint64_t v12;
  CMTime v13;
  CMTime time2;
  CMTime time1;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  uint64_t v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3810000000;
  v20 = &unk_19EF10DB5;
  v22 = 0;
  v21 = xmmword_19EEEA8C0;
  if (-[AVCaptureFigVideoDevice _hasKeyValueObserversForHighFrequencyProperty:](self, "_hasKeyValueObserversForHighFrequencyProperty:", CFSTR("exposureDuration")))
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__AVCaptureFigVideoDevice_exposureDuration__block_invoke;
    block[3] = &unk_1E4217A60;
    block[4] = self;
    block[5] = &v17;
    dispatch_sync(devicePropsQueue, block);
  }
  time1 = *(CMTime *)(v18 + 4);
  *(_OWORD *)&time2.value = xmmword_19EEEA8C0;
  time2.epoch = 0;
  if (!CMTimeCompare(&time1, &time2))
  {
    v6 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04C80]);
    v7 = v6;
    if (v6)
    {
      CMTimeMakeFromDictionary(&v13, (CFDictionaryRef)v6);
      *(CMTime *)(v18 + 4) = v13;

    }
    else
    {
      if (self)
      {
        -[AVCaptureFigVideoDevice activeVideoMinFrameDuration](self, "activeVideoMinFrameDuration");
      }
      else
      {
        v11 = 0uLL;
        v12 = 0;
      }
      v8 = v18;
      *((_OWORD *)v18 + 2) = v11;
      v8[6] = v12;
    }
  }
  v9 = v18;
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v18 + 2);
  retstr->var3 = v9[6];
  _Block_object_dispose(&v17, 8);
  return result;
}

__n128 __43__AVCaptureFigVideoDevice_exposureDuration__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 432);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (float)ISODigitalThreshold
{
  return 2800.0;
}

- (float)ISO
{
  NSObject *devicePropsQueue;
  float v4;
  id v5;
  void *v6;
  int v7;
  _QWORD v9[6];
  uint64_t v10;
  float *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = (float *)&v10;
  v12 = 0x2020000000;
  v13 = -1082130432;
  if (-[AVCaptureFigVideoDevice _hasKeyValueObserversForHighFrequencyProperty:](self, "_hasKeyValueObserversForHighFrequencyProperty:", CFSTR("ISO")))
  {
    devicePropsQueue = self->_devicePropsQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__AVCaptureFigVideoDevice_ISO__block_invoke;
    v9[3] = &unk_1E4217A60;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(devicePropsQueue, v9);
  }
  v4 = v11[6];
  if (v4 == -1.0)
  {
    v5 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04D00]);
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "floatValue");
      *((_DWORD *)v11 + 6) = v7;

      v4 = v11[6];
    }
    else
    {
      v11[6] = 50.0;
      v4 = 50.0;
    }
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

float __30__AVCaptureFigVideoDevice_ISO__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 456);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setExposureModeCustomWithDuration:(id *)a3 ISO:(float)a4 completionHandler:(id)a5
{
  id v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  float v19;
  float v20;
  uint64_t v21;
  NSObject *devicePropsQueue;
  uint64_t v23;
  AVCaptureDeviceControlRequest *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t var1;
  _QWORD v30[5];
  __int128 v31;
  uint64_t v32;
  _QWORD v33[8];
  __int128 v34;
  int64_t var3;
  float v36;
  _QWORD block[6];
  CMTime time1;
  void *v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  CMTime time2;
  int v47;
  CMTime v48;
  CMTime v49;

  if (!-[AVCaptureFigVideoDevice isExposureModeSupported:](self, "isExposureModeSupported:", 3))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    objc_opt_class();
LABEL_6:
    v13 = AVMethodExceptionReasonWithClassAndSelector();
    v14 = v11;
    v15 = v12;
LABEL_14:
    v18 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v13, 0, *(_QWORD *)&v28, var1);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v18);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v18);
    return;
  }
  v9 = -[AVCaptureFigVideoDevice activeFormat](self, "activeFormat");
  time1 = (CMTime)*a3;
  memset(&time2, 0, sizeof(time2));
  if (CMTimeCompare(&time1, &time2))
  {
    if (v9)
      objc_msgSend(v9, "minExposureDuration");
    else
      memset(&v49, 0, sizeof(v49));
    time1 = (CMTime)*a3;
    if (CMTimeCompare(&time1, &v49) < 0)
      goto LABEL_13;
    if (v9)
      objc_msgSend(v9, "maxExposureDuration");
    else
      memset(&v48, 0, sizeof(v48));
    time1 = (CMTime)*a3;
    if (CMTimeCompare(&time1, &v48) >= 1)
    {
LABEL_13:
      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99858];
      objc_opt_class();
      v28 = *(double *)&a3->var0;
      var1 = a3->var1;
      v13 = AVMethodExceptionReasonWithClassAndSelector();
      v14 = v16;
      v15 = v17;
      goto LABEL_14;
    }
  }
  LODWORD(v10) = 2139095039;
  if (a4 != 3.4028e38)
  {
    objc_msgSend(v9, "minISO", v10);
    if (v19 > a4 || (objc_msgSend(v9, "maxISO"), v20 < a4))
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99858];
      objc_opt_class();
      v28 = a4;
      goto LABEL_6;
    }
  }
  time2.value = 0;
  *(_QWORD *)&time2.timescale = &time2;
  time2.epoch = 0x2020000000;
  v47 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  time1.value = 0;
  *(_QWORD *)&time1.timescale = &time1;
  time1.epoch = 0x3810000000;
  v40 = *MEMORY[0x1E0CA2E18];
  v21 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v39 = &unk_19EF10DB5;
  v41 = v21;
  devicePropsQueue = self->_devicePropsQueue;
  v23 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__AVCaptureFigVideoDevice_setExposureModeCustomWithDuration_ISO_completionHandler___block_invoke;
  block[3] = &unk_1E4217A60;
  block[4] = self;
  block[5] = &v42;
  dispatch_sync(devicePropsQueue, block);
  if (*((_BYTE *)v43 + 24))
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("exposureMode"));
  v24 = +[AVCaptureDeviceControlRequest deviceControlRequestWithCompletionBlock:](AVCaptureDeviceControlRequest, "deviceControlRequestWithCompletionBlock:", a5);
  -[AVCaptureDeviceControlRequestQueue enqueueRequest:](self->_manualFocusControlRequests, "enqueueRequest:", v24);
  v25 = self->_devicePropsQueue;
  v33[0] = v23;
  v33[1] = 3221225472;
  v33[2] = __83__AVCaptureFigVideoDevice_setExposureModeCustomWithDuration_ISO_completionHandler___block_invoke_2;
  v33[3] = &unk_1E4217CB8;
  v34 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v36 = a4;
  v33[4] = self;
  v33[5] = v24;
  v33[6] = &time2;
  v33[7] = &time1;
  dispatch_sync(v25, v33);
  if (*(_DWORD *)(*(_QWORD *)&time2.timescale + 24) == -16452)
  {
    v26 = (void *)MEMORY[0x1E0C99DA0];
    objc_opt_class();
    v27 = (void *)objc_msgSend(v26, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v27);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v27);
  }
  else
  {
    if ((*(_BYTE *)(*(_QWORD *)&time1.timescale + 44) & 1) != 0)
    {
      v31 = *(_OWORD *)(*(_QWORD *)&time1.timescale + 32);
      v32 = *(_QWORD *)(*(_QWORD *)&time1.timescale + 48);
      -[AVCaptureFigVideoDevice _setActiveVideoMaxFrameDurationInternal:](self, "_setActiveVideoMaxFrameDurationInternal:", &v31);
    }
    if (*((_BYTE *)v43 + 24))
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("exposureMode"));
    if (*(_DWORD *)(*(_QWORD *)&time2.timescale + 24))
    {
      v30[0] = v23;
      v30[1] = 3221225472;
      v30[2] = __83__AVCaptureFigVideoDevice_setExposureModeCustomWithDuration_ISO_completionHandler___block_invoke_3;
      v30[3] = &unk_1E42165A8;
      v30[4] = self;
      -[AVCaptureFigVideoDevice _performBlockOnMainThread:](self, "_performBlockOnMainThread:", v30);
    }
  }
  _Block_object_dispose(&time1, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&time2, 8);
}

uint64_t __83__AVCaptureFigVideoDevice_setExposureModeCustomWithDuration_ISO_completionHandler___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 424) != 3;
  return result;
}

uint64_t __83__AVCaptureFigVideoDevice_setExposureModeCustomWithDuration_ISO_completionHandler___block_invoke_2(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  __int128 v7;
  uint64_t v8;

  v2 = *(_DWORD *)(a1 + 88);
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "requestID");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32;
  v7 = *(_OWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 80);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "_setExposureWithMode:duration:ISO:requestID:newMaxFrameDuration:", 3, &v7, v4, v5, COERCE_DOUBLE(__PAIR64__(DWORD1(v7), v2)));
  result = objc_msgSend(*(id *)(a1 + 40), "setErrorCode:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424) = 3;
  return result;
}

uint64_t __83__AVCaptureFigVideoDevice_setExposureModeCustomWithDuration_ISO_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleManualControlCompletionForRequestQueue:withPayload:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672), 0);
}

uint64_t __67__AVCaptureFigVideoDevice_setExposureTargetBias_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleManualControlCompletionForRequestQueue:withPayload:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680), 0);
}

- (float)exposureTargetOffset
{
  NSObject *devicePropsQueue;
  uint64_t v4;
  NSObject *v5;
  float v6;
  id v7;
  void *v8;
  int v9;
  float v10;
  _QWORD v12[6];
  _QWORD block[8];
  uint64_t v14;
  float *v15;
  uint64_t v16;
  int v17;
  _QWORD v18[4];
  uint64_t v19;
  float *v20;
  uint64_t v21;
  int v22;

  v19 = 0;
  v20 = (float *)&v19;
  v21 = 0x2020000000;
  v22 = 2139095039;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v14 = 0;
  v15 = (float *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVCaptureFigVideoDevice_exposureTargetOffset__block_invoke;
  block[3] = &unk_1E4217B78;
  block[4] = self;
  block[5] = v18;
  block[6] = &v14;
  block[7] = &v19;
  dispatch_sync(devicePropsQueue, block);
  if (v20[6] == 3.4028e38
    && -[AVCaptureFigVideoDevice _hasKeyValueObserversForHighFrequencyProperty:](self, "_hasKeyValueObserversForHighFrequencyProperty:", CFSTR("exposureTargetOffset")))
  {
    v5 = self->_devicePropsQueue;
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __47__AVCaptureFigVideoDevice_exposureTargetOffset__block_invoke_2;
    v12[3] = &unk_1E4217A60;
    v12[4] = self;
    v12[5] = &v19;
    dispatch_sync(v5, v12);
  }
  v6 = v20[6];
  if (v6 == 3.4028e38)
  {
    v7 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04CA0]);
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "floatValue");
      *((_DWORD *)v20 + 6) = v9;

      v6 = v20[6];
    }
    else
    {
      v20[6] = 0.0;
      v6 = 0.0;
    }
  }
  v10 = v6 - v15[6];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

_QWORD *__47__AVCaptureFigVideoDevice_exposureTargetOffset__block_invoke(_QWORD *result)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 424);
  v1 = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  if (v1)
  {
    if (v1 == 3)
      *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_DWORD *)(result[4] + 460);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(result[7] + 8) + 24) = 0;
  }
  return result;
}

float __47__AVCaptureFigVideoDevice_exposureTargetOffset__block_invoke_2(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 464);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)automaticallyAdjustsFaceDrivenAutoExposureEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__AVCaptureFigVideoDevice_automaticallyAdjustsFaceDrivenAutoExposureEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __76__AVCaptureFigVideoDevice_automaticallyAdjustsFaceDrivenAutoExposureEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 488);
  return result;
}

- (void)setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  BOOL v10;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (-[AVCaptureFigVideoDevice isExposureModeSupported:](self, "isExposureModeSupported:", 2))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__AVCaptureFigVideoDevice_setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled___block_invoke;
      block[3] = &unk_1E4217A10;
      block[4] = self;
      v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

uint64_t __80__AVCaptureFigVideoDevice_setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 488) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isFaceDrivenAutoExposureEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVCaptureFigVideoDevice_isFaceDrivenAutoExposureEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVCaptureFigVideoDevice_isFaceDrivenAutoExposureEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = (*(_DWORD *)(*(_QWORD *)(result + 32) + 800) & 0xFFFFFFFD) == 1;
  return result;
}

- (void)setFaceDrivenAutoExposureEnabled:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *devicePropsQueue;
  _QWORD block[5];
  BOOL v10;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (-[AVCaptureFigVideoDevice isExposureModeSupported:](self, "isExposureModeSupported:", 2)
      && !-[AVCaptureFigVideoDevice automaticallyAdjustsFaceDrivenAutoExposureEnabled](self, "automaticallyAdjustsFaceDrivenAutoExposureEnabled"))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__AVCaptureFigVideoDevice_setFaceDrivenAutoExposureEnabled___block_invoke;
      block[3] = &unk_1E4217A10;
      v10 = a3;
      block[4] = self;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v7 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v7);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
}

uint64_t __60__AVCaptureFigVideoDevice_setFaceDrivenAutoExposureEnabled___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  int v3;

  v1 = *(_QWORD *)(result + 32);
  if ((*(_DWORD *)(v1 + 800) & 0xFFFFFFFE) == 2)
    v2 = 3;
  else
    v2 = 1;
  if (*(_BYTE *)(result + 40))
    v3 = v2;
  else
    v3 = 2 * ((*(_DWORD *)(v1 + 800) & 0xFFFFFFFE) == 2);
  *(_DWORD *)(v1 + 800) = v3;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeMaxExposureDuration
{
  NSObject *devicePropsQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_19EF10DB5;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVCaptureFigVideoDevice_activeMaxExposureDuration__block_invoke;
  block[3] = &unk_1E42178B8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(devicePropsQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __52__AVCaptureFigVideoDevice_activeMaxExposureDuration__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 *v2;
  __n128 *v3;
  __n128 *v4;
  unint64_t v5;
  __n128 result;
  __n128 *v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (__n128 *)(v1 + 516);
  if ((*(_BYTE *)(v1 + 528) & 1) != 0)
  {
    v7 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
    result = *v2;
    v7[3].n128_u64[0] = v2[1].n128_u64[0];
    v7[2] = result;
  }
  else
  {
    v3 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    if ((*(_BYTE *)(v1 + 504) & 1) != 0)
    {
      result = *(__n128 *)(v1 + 492);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = *(_QWORD *)(v1 + 508);
      *v3 = result;
    }
    else
    {
      v4 = (__n128 *)(v1 + 280);
      v5 = v4[1].n128_u64[0];
      result = *v4;
      *v3 = *v4;
      v3[1].n128_u64[0] = v5;
    }
  }
  return result;
}

- (void)setActiveMaxExposureDuration:(id *)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  _QWORD block[5];
  __int128 v12;
  int64_t var3;
  CMTime v14;
  CMTime time1;
  CMTime time2;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if ((a3->var2 & 1) == 0)
      goto LABEL_3;
    v8 = -[AVCaptureFigVideoDevice activeFormat](self, "activeFormat");
    if (v8)
      objc_msgSend(v8, "minExposureDuration");
    else
      memset(&time2, 0, sizeof(time2));
    time1 = (CMTime)*a3;
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
    {
      v9 = -[AVCaptureFigVideoDevice activeFormat](self, "activeFormat");
      if (v9)
        objc_msgSend(v9, "maxExposureDuration");
      else
        memset(&v14, 0, sizeof(v14));
      time1 = (CMTime)*a3;
      if (CMTimeCompare(&time1, &v14) < 1)
      {
LABEL_3:
        devicePropsQueue = self->_devicePropsQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__AVCaptureFigVideoDevice_setActiveMaxExposureDuration___block_invoke;
        block[3] = &unk_1E4217D08;
        block[4] = self;
        v12 = *(_OWORD *)&a3->var0;
        var3 = a3->var3;
        dispatch_sync(devicePropsQueue, block);
        return;
      }
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v10 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v10);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
}

void __56__AVCaptureFigVideoDevice_setActiveMaxExposureDuration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  const __CFAllocator **v4;
  const __CFAllocator *v5;
  CFDictionaryRef v6;
  CMTime v7;

  v2 = *(_QWORD *)(a1 + 32) + 516;
  v3 = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(a1 + 56);
  v4 = (const __CFAllocator **)MEMORY[0x1E0C9AE00];
  *(_OWORD *)v2 = v3;
  v5 = *v4;
  v7 = *(CMTime *)(a1 + 40);
  v6 = CMTimeCopyAsDictionary(&v7, v5);
  objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E0D04B80], v6, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 328));

}

- (BOOL)isGlobalToneMappingEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__AVCaptureFigVideoDevice_isGlobalToneMappingEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__AVCaptureFigVideoDevice_isGlobalToneMappingEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1169);
  return result;
}

- (void)setGlobalToneMappingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (-[AVCaptureDeviceFormat isGlobalToneMappingSupported](self->_activeFormat, "isGlobalToneMappingSupported"))
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v13 = 0;
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__AVCaptureFigVideoDevice_setGlobalToneMappingEnabled___block_invoke;
      block[3] = &unk_1E4217A60;
      block[4] = self;
      block[5] = &v10;
      dispatch_sync(devicePropsQueue, block);
      if (v11[3])
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("digitalFlashMode"));
        -[AVCaptureFigVideoDevice _setDigitalFlashModeInternal:](self, "_setDigitalFlashModeInternal:", 0);
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("digitalFlashMode"));
      }
      -[AVCaptureFigVideoDevice _setGlobalToneMappingEnabledInternal:](self, "_setGlobalToneMappingEnabledInternal:", v3);
      _Block_object_dispose(&v10, 8);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

uint64_t __55__AVCaptureFigVideoDevice_setGlobalToneMappingEnabled___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 752);
  return result;
}

- (void)_setGlobalToneMappingEnabledInternal:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__AVCaptureFigVideoDevice__setGlobalToneMappingEnabledInternal___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __64__AVCaptureFigVideoDevice__setGlobalToneMappingEnabledInternal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04CE8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  if (!(_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1169) = *(_BYTE *)(a1 + 40);
  return result;
}

- (BOOL)isAdjustingWhiteBalance
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AVCaptureFigVideoDevice_isAdjustingWhiteBalance__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__AVCaptureFigVideoDevice_isAdjustingWhiteBalance__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 576);
  return result;
}

- (int64_t)whiteBalanceMode
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_whiteBalanceMode__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVCaptureFigVideoDevice_whiteBalanceMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 544);
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)deviceWhiteBalanceGains
{
  NSObject *devicePropsQueue;
  float *v4;
  id v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  _QWORD v14[6];
  uint64_t v15;
  float *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  int v20;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v15 = 0;
  v16 = (float *)&v15;
  v17 = 0x3010000000;
  v20 = -1082130432;
  v18 = &unk_19EF10DB5;
  v19 = 0xBF800000BF800000;
  if (-[AVCaptureFigVideoDevice _hasKeyValueObserversForHighFrequencyProperty:](self, "_hasKeyValueObserversForHighFrequencyProperty:", CFSTR("deviceWhiteBalanceGains")))
  {
    devicePropsQueue = self->_devicePropsQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__AVCaptureFigVideoDevice_deviceWhiteBalanceGains__block_invoke;
    v14[3] = &unk_1E4217A60;
    v14[4] = self;
    v14[5] = &v15;
    dispatch_sync(devicePropsQueue, v14);
  }
  v4 = v16;
  if (*((_QWORD *)v16 + 4) == 0xBF800000BF800000 && *((_DWORD *)v16 + 10) == -1082130432)
  {
    v6 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04C50]);
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "length") == 12)
        objc_msgSend(v7, "getBytes:length:", v16 + 8, 12);

      v4 = v16;
    }
    else
    {
      v4 = v16;
      *((_QWORD *)v16 + 4) = 0x3F80000040000000;
      v4[10] = 2.0;
    }
  }
  v8 = v4[8];
  v9 = v4[9];
  v10 = v4[10];
  _Block_object_dispose(&v15, 8);
  v11 = v8;
  v12 = v9;
  v13 = v10;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

uint64_t __50__AVCaptureFigVideoDevice_deviceWhiteBalanceGains__block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v2 = *(_DWORD *)(*(_QWORD *)(result + 32) + 560);
  *(_QWORD *)(v1 + 32) = *(_QWORD *)(*(_QWORD *)(result + 32) + 552);
  *(_DWORD *)(v1 + 40) = v2;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)grayWorldDeviceWhiteBalanceGains
{
  NSObject *devicePropsQueue;
  float *v4;
  id v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  _QWORD v14[6];
  uint64_t v15;
  float *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  int v20;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v15 = 0;
  v16 = (float *)&v15;
  v17 = 0x3010000000;
  v20 = -1082130432;
  v18 = &unk_19EF10DB5;
  v19 = 0xBF800000BF800000;
  if (-[AVCaptureFigVideoDevice _hasKeyValueObserversForHighFrequencyProperty:](self, "_hasKeyValueObserversForHighFrequencyProperty:", CFSTR("grayWorldDeviceWhiteBalanceGains")))
  {
    devicePropsQueue = self->_devicePropsQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__AVCaptureFigVideoDevice_grayWorldDeviceWhiteBalanceGains__block_invoke;
    v14[3] = &unk_1E4217A60;
    v14[4] = self;
    v14[5] = &v15;
    dispatch_sync(devicePropsQueue, v14);
  }
  v4 = v16;
  if (*((_QWORD *)v16 + 4) == 0xBF800000BF800000 && *((_DWORD *)v16 + 10) == -1082130432)
  {
    v6 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04CF0]);
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "length") == 12)
        objc_msgSend(v7, "getBytes:length:", v16 + 8, 12);

      v4 = v16;
    }
    else
    {
      v4 = v16;
      *((_QWORD *)v16 + 4) = 0x3F80000040000000;
      v4[10] = 2.0;
    }
  }
  v8 = v4[8];
  v9 = v4[9];
  v10 = v4[10];
  _Block_object_dispose(&v15, 8);
  v11 = v8;
  v12 = v9;
  v13 = v10;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

uint64_t __59__AVCaptureFigVideoDevice_grayWorldDeviceWhiteBalanceGains__block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v2 = *(_DWORD *)(*(_QWORD *)(result + 32) + 572);
  *(_QWORD *)(v1 + 32) = *(_QWORD *)(*(_QWORD *)(result + 32) + 564);
  *(_DWORD *)(v1 + 40) = v2;
  return result;
}

- (float)maxWhiteBalanceGain
{
  return 4.0;
}

- (BOOL)_ensureWhiteBalanceCalibrationUnpacked
{
  NSObject *devicePropsQueue;
  _QWORD block[5];

  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AVCaptureFigVideoDevice__ensureWhiteBalanceCalibrationUnpacked__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  dispatch_sync(devicePropsQueue, block);
  return *(_QWORD *)&self->_adjustingWB != 0;
}

void __65__AVCaptureFigVideoDevice__ensureWhiteBalanceCalibrationUnpacked__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  id v16;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[73])
    goto LABEL_2;
  v4 = (void *)objc_msgSend(v2, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04E18]);
  if (!v4)
  {
    FigDebugAssert3();
LABEL_2:
    v3 = 0;
    goto LABEL_17;
  }
  v16 = v4;
  if (objc_msgSend(v4, "count") == 2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592) = malloc_type_calloc(2uLL, 8uLL, 0x100004000313F17uLL);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 600) = malloc_type_calloc(2uLL, 8uLL, 0x80040B8603338uLL);
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 592))
    {
      if (*(_QWORD *)(v5 + 600))
      {
        v6 = 0;
        v7 = *MEMORY[0x1E0D04F28];
        v8 = *MEMORY[0x1E0D04F20];
        while (1)
        {
          v9 = objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", v6), "objectForKeyedSubscript:", v7);
          if (!v9)
            break;
          v10 = (void *)v9;
          v11 = (void *)objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", v6), "objectForKeyedSubscript:", v8);
          if (!v11)
            break;
          v12 = v11;
          if (objc_msgSend(v11, "length") != 36)
            break;
          v13 = objc_msgSend(v12, "bytes");
          objc_msgSend(v10, "doubleValue");
          *(float *)&v14 = v14;
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 592) + 8 * v6) = LODWORD(v14);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 600) + 8 * v6) = malloc_type_malloc(0x48uLL, 0x100004000313F17uLL);
          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 600) + 8 * v6))
            break;
          for (i = 0; i != 9; ++i)
            *(double *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 600) + 8 * v6) + 8 * i) = *(float *)(v13 + 4 * i);
          if (++v6 == 2)
          {
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584) = 2;
            goto LABEL_16;
          }
        }
      }
    }
  }
  FigDebugAssert3();
LABEL_16:
  v3 = v16;
LABEL_17:

}

- (BOOL)isLockingWhiteBalanceWithCustomDeviceGainsSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04878]), "BOOLValue");
}

- (void)setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains:(id)a3 completionHandler:(id)a4
{
  float var2;
  float var1;
  float var0;
  BOOL v9;
  float v10;
  float v11;
  NSObject *devicePropsQueue;
  uint64_t v13;
  AVCaptureDeviceControlRequest *v14;
  NSObject *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[8];
  $E2C29196C7A5C696474C6955C5A9CE06 v24;
  _QWORD block[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  $E2C29196C7A5C696474C6955C5A9CE06 v34;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v34 = a3;
  if (!-[AVCaptureFigVideoDevice isWhiteBalanceModeSupported:](self, "isWhiteBalanceModeSupported:", 0))
    goto LABEL_24;
  if (*(_QWORD *)&v34.var0)
    v9 = 0;
  else
    v9 = LODWORD(v34.var2) == 0;
  if (v9)
  {
LABEL_19:
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    v13 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__AVCaptureFigVideoDevice_setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains_completionHandler___block_invoke;
    block[3] = &unk_1E4217C18;
    block[4] = self;
    block[5] = &v26;
    block[6] = 0;
    dispatch_sync(devicePropsQueue, block);
    if (*((_BYTE *)v27 + 24))
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("whiteBalanceMode"));
    v14 = +[AVCaptureDeviceControlRequest deviceControlRequestWithCompletionBlock:](AVCaptureDeviceControlRequest, "deviceControlRequestWithCompletionBlock:", a4);
    -[AVCaptureDeviceControlRequestQueue enqueueRequest:](self->_biasedExposureControlRequests, "enqueueRequest:", v14);
    v15 = self->_devicePropsQueue;
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __98__AVCaptureFigVideoDevice_setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains_completionHandler___block_invoke_2;
    v23[3] = &unk_1E4217D30;
    v23[6] = &v30;
    v23[7] = 0;
    v24 = v34;
    v23[4] = self;
    v23[5] = v14;
    dispatch_sync(v15, v23);
    v16 = *((_DWORD *)v31 + 6);
    if (v16 == -16452)
    {
      v17 = (void *)MEMORY[0x1E0C99DA0];
      objc_opt_class();
      v18 = (void *)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v18);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v18);
    }
    else
    {
      if (*((_BYTE *)v27 + 24))
      {
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("whiteBalanceMode"));
        v16 = *((_DWORD *)v31 + 6);
      }
      if (v16)
      {
        v22[0] = v13;
        v22[1] = 3221225472;
        v22[2] = __98__AVCaptureFigVideoDevice_setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains_completionHandler___block_invoke_3;
        v22[3] = &unk_1E42165A8;
        v22[4] = self;
        -[AVCaptureFigVideoDevice _performBlockOnMainThread:](self, "_performBlockOnMainThread:", v22);
      }
    }
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    return;
  }
  if (-[AVCaptureFigVideoDevice isLockingWhiteBalanceWithCustomDeviceGainsSupported](self, "isLockingWhiteBalanceWithCustomDeviceGainsSupported"))
  {
    -[AVCaptureFigVideoDevice maxWhiteBalanceGain](self, "maxWhiteBalanceGain");
    if (var0 >= 1.0 && var0 <= v10 && var1 <= v10 && var1 >= 1.0 && var2 <= v10 && var2 >= 1.0)
    {
      if (var0 >= var1)
        v11 = var1;
      else
        v11 = var0;
      if (v11 >= var2)
        v11 = var2;
      v34.var0 = var0 / v11;
      v34.var1 = var1 / v11;
      v34.var2 = var2 / v11;
      goto LABEL_19;
    }
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99858];
    objc_opt_class();
  }
  else
  {
LABEL_24:
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  v21 = (void *)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v21);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v21);
}

_QWORD *__98__AVCaptureFigVideoDevice_setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains_completionHandler___block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 544) != result[6];
  return result;
}

uint64_t __98__AVCaptureFigVideoDevice_setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "requestID");
  LODWORD(v5) = *(_DWORD *)(a1 + 64);
  LODWORD(v6) = *(_DWORD *)(a1 + 68);
  LODWORD(v7) = *(_DWORD *)(a1 + 72);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "_setWhiteBalanceWithMode:gains:requestID:", v2, v4, v5, v6, v7);
  result = objc_msgSend(*(id *)(a1 + 40), "setErrorCode:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544) = *(_QWORD *)(a1 + 56);
  return result;
}

uint64_t __98__AVCaptureFigVideoDevice_setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleManualControlCompletionForRequestQueue:withPayload:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 688), 0);
}

- (double)_whiteBalanceMixingFactorForTemperature:(double)a3
{
  return fmin(fmax((1.0 / a3 - 1.0 / *(float *)self->_wbCalibrationCount)/ (1.0 / *(float *)(self->_wbCalibrationCount + 8) - 1.0 / *(float *)self->_wbCalibrationCount), 0.0), 1.0);
}

- (double)_whiteBalanceTemperatureForMixingFactor:(double)a3
{
  return 1.0
       / (1.0 / *(float *)self->_wbCalibrationCount
        + (1.0 / *(float *)(self->_wbCalibrationCount + 8) - 1.0 / *(float *)self->_wbCalibrationCount) * a3);
}

- ($E2C29196C7A5C696474C6955C5A9CE06)_deviceWhiteBalanceGainsForChromaticityValues:(id)a3 temperature:(double)a4
{
  float var1;
  float var0;
  double v8;
  uint64_t v9;
  $94F468A8D4C62B317260615823C2B210 *wbCalibrationTemperatures;
  $94F468A8D4C62B317260615823C2B210 v11;
  $94F468A8D4C62B317260615823C2B210 v12;
  uint64_t i;
  float v14;
  float32x2_t v20;
  float v21;
  float v22;
  double v23;
  float64x2_t v24;
  double v25[3];
  double v26[9];
  double v27[10];
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  var1 = a3.var1;
  var0 = a3.var0;
  v27[9] = *(double *)MEMORY[0x1E0C80C00];
  if (-[AVCaptureFigVideoDevice _ensureWhiteBalanceCalibrationUnpacked](self, "_ensureWhiteBalanceCalibrationUnpacked"))
  {
    -[AVCaptureFigVideoDevice _whiteBalanceMixingFactorForTemperature:](self, "_whiteBalanceMixingFactorForTemperature:", a4);
    v9 = 0;
    wbCalibrationTemperatures = self->_wbCalibrationTemperatures;
    v11 = *wbCalibrationTemperatures;
    v12 = wbCalibrationTemperatures[1];
    do
    {
      v27[v9] = v8 * *(double *)(*(_QWORD *)&v12 + v9 * 8) + *(double *)(*(_QWORD *)&v11 + v9 * 8) * (1.0 - v8);
      ++v9;
    }
    while (v9 != 9);
    InvertMatrix(v27, v26);
    xy_to_XYZ((uint64_t)v25, var0, var1);
    VectorMatrix(v25, v26, &v23);
    for (i = 0; i != 24; i += 8)
    {
      if (*(double *)((char *)&v23 + i) < 0.0)
        *(double *)((char *)&v23 + i) = 0.0;
    }
    v14 = 1.0 / v23;
    __asm { FMOV            V2.2D, #1.0 }
    v20 = vcvt_f32_f64(vdivq_f64(_Q2, v24));
    v21 = v20.f32[1];
    if (v20.f32[0] >= v20.f32[1])
      v22 = v20.f32[1];
    else
      v22 = v20.f32[0];
    if (v22 > v14)
      v22 = 1.0 / v23;
    if (fabsf(v22) != INFINITY)
    {
      v14 = v14 / v22;
      v20.f32[0] = v20.f32[0] / v22;
      v21 = v20.f32[1] / v22;
    }
  }
  else
  {
    v20.i32[0] = 1.0;
    v21 = 2.0;
    v14 = 2.0;
  }
  result.var1 = v20.f32[0];
  result.var2 = v21;
  result.var0 = v14;
  return result;
}

- (double)_predictedTempForGains:(id)a3
{
  float var2;
  float var1;
  float var0;
  double v7;
  _QWORD block[5];

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVCaptureFigVideoDevice__predictedTempForGains___block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  if (_predictedTempForGains__onceToken != -1)
    dispatch_once(&_predictedTempForGains__onceToken, block);
  v7 = (((float)(1.0 / var1) - *((double *)&_predictedTempForGains__knownDRGB + 1)) * *(double *)algn_1EE53A528
      + *(double *)_predictedTempForGains__minToMax
      * ((float)(1.0 / var0) - *(double *)&_predictedTempForGains__knownDRGB)
      + *(double *)&qword_1EE53A530 * ((float)(1.0 / var2) - *(double *)&qword_1EE53A500))
     / *(double *)&_predictedTempForGains__minToMaxLen;
  return (1.0 - v7) * *(float *)self->_wbCalibrationCount + v7 * *(float *)(self->_wbCalibrationCount + 8);
}

uint64_t __50__AVCaptureFigVideoDevice__predictedTempForGains___block_invoke(uint64_t a1, double a2, double a3)
{
  _QWORD *v4;
  _DWORD *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  _QWORD *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t result;
  uint64_t v14;
  unsigned int v20;
  __int32 v21;
  float32x2_t v22;
  uint64_t v23;
  double v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (_DWORD *)v4[74];
  LODWORD(a2) = *v5;
  LODWORD(a3) = v5[1];
  objc_msgSend(v4, "deviceWhiteBalanceGainsForTemperatureAndTintValues:", a2, a3);
  v26 = v6;
  v25 = v7;
  v27 = v8;
  v9 = *(_QWORD **)(a1 + 32);
  v10 = v9[74];
  LODWORD(v11) = *(_DWORD *)(v10 + 8);
  LODWORD(v12) = *(_DWORD *)(v10 + 12);
  result = objc_msgSend(v9, "deviceWhiteBalanceGainsForTemperatureAndTintValues:", v11, v12);
  v14 = 0;
  __asm { FMOV            V4.2D, #1.0 }
  v22.i32[1] = v21;
  _predictedTempForGains__knownDRGB = (__int128)vdivq_f64(_Q4, vcvtq_f64_f32((float32x2_t)__PAIR64__(v25, v26)));
  *(float64x2_t *)&qword_1EE53A500 = vdivq_f64(_Q4, vcvtq_f64_f32((float32x2_t)__PAIR64__(v20, v27)));
  xmmword_1EE53A510 = (__int128)vdivq_f64(_Q4, vcvtq_f64_f32(v22));
  do
  {
    *(double *)&_predictedTempForGains__minToMax[v14] = *(double *)((char *)&_predictedTempForGains__knownDRGB
                                                                  + v14 * 8
                                                                  + 24)
                                                      - *(double *)((char *)&_predictedTempForGains__knownDRGB + v14 * 8);
    ++v14;
  }
  while (v14 != 3);
  v23 = 0;
  v24 = sqrt(*(double *)algn_1EE53A528 * *(double *)algn_1EE53A528+ *(double *)_predictedTempForGains__minToMax * *(double *)_predictedTempForGains__minToMax+ *(double *)&qword_1EE53A530 * *(double *)&qword_1EE53A530);
  _predictedTempForGains__minToMaxLen = *(_QWORD *)&v24;
  do
  {
    *(double *)&_predictedTempForGains__minToMax[v23] = *(double *)&_predictedTempForGains__minToMax[v23] / v24;
    ++v23;
  }
  while (v23 != 3);
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)_chromaticityValuesForDeviceWhiteBalanceGains:(id)a3 atMix:(double)a4
{
  uint64_t v4;
  $94F468A8D4C62B317260615823C2B210 *wbCalibrationTemperatures;
  $94F468A8D4C62B317260615823C2B210 v6;
  $94F468A8D4C62B317260615823C2B210 v7;
  float var1;
  float v14;
  float v15;
  double v16;
  double v17;
  double v18[3];
  float64x2_t v19;
  double v20;
  double v21[10];
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = 0;
  v21[9] = *(double *)MEMORY[0x1E0C80C00];
  wbCalibrationTemperatures = self->_wbCalibrationTemperatures;
  v6 = *wbCalibrationTemperatures;
  v7 = wbCalibrationTemperatures[1];
  do
  {
    v21[v4] = *(double *)(*(_QWORD *)&v7 + v4 * 8) * a4 + *(double *)(*(_QWORD *)&v6 + v4 * 8) * (1.0 - a4);
    ++v4;
  }
  while (v4 != 9);
  var1 = a3.var1;
  __asm { FMOV            V1.2D, #1.0 }
  v19 = vdivq_f64(_Q1, vcvtq_f64_f32(*(float32x2_t *)&a3.var0));
  v20 = 1.0 / a3.var2;
  VectorMatrix(v19.f64, v21, v18);
  v16 = 0.0;
  v17 = 0.0;
  XYZ_to_xy(v18, &v17, &v16);
  v14 = v17;
  v15 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (BOOL)_isWBSeedEnabled
{
  return LOBYTE(self->_wbSeedTemp);
}

- (void)_setWBSeedEnabled:(BOOL)a3
{
  LOBYTE(self->_wbSeedTemp) = a3;
}

- (unint64_t)_wbTemperatureIterations
{
  return *(_QWORD *)&self->_wbSeedEnabled;
}

- ($94F468A8D4C62B317260615823C2B210)chromaticityValuesForDeviceWhiteBalanceGains:(id)a3
{
  float var2;
  float var1;
  float var0;
  float v7;
  double v8;
  double v9;
  double v10;
  void *v16;
  uint64_t v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  NSObject *devicePropsQueue;
  uint64_t v26;
  uint64_t v27;
  int v28;
  double v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  float v37;
  float v38;
  float v39;
  double v40;
  double v41;
  NSObject *v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD v45[7];
  int v46;
  _QWORD v47[5];
  int v48;
  uint64_t v49;
  double v50;
  _QWORD block[7];
  uint64_t v52;
  double *v53;
  uint64_t v54;
  uint64_t v55;
  $94F468A8D4C62B317260615823C2B210 result;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v7 = 0.5;
  if (!-[AVCaptureFigVideoDevice _ensureWhiteBalanceCalibrationUnpacked](self, "_ensureWhiteBalanceCalibrationUnpacked"))
  {
LABEL_21:
    v19 = 0.5;
    goto LABEL_22;
  }
  -[AVCaptureFigVideoDevice maxWhiteBalanceGain](self, "maxWhiteBalanceGain");
  if (var0 < 1.0 || var0 > *(float *)&v8 || var1 < 1.0 || var1 > *(float *)&v8 || var2 < 1.0 || var2 > *(float *)&v8)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99858];
    objc_opt_class();
    v18 = (void *)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v18);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v18);
    goto LABEL_21;
  }
  if (var0 >= var1)
    *(float *)&v8 = var1;
  else
    *(float *)&v8 = var0;
  if (*(float *)&v8 >= var2)
    *(float *)&v8 = var2;
  v22 = var0 / *(float *)&v8;
  v23 = var1 / *(float *)&v8;
  v24 = var2 / *(float *)&v8;
  *(float *)&v8 = v22;
  *(float *)&v9 = v23;
  *(float *)&v10 = v24;
  -[AVCaptureFigVideoDevice _predictedTempForGains:](self, "_predictedTempForGains:", v8, v9, v10);
  v52 = 0;
  v53 = (double *)&v52;
  v54 = 0x2020000000;
  v55 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v26 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  v44 = v27;
  block[1] = 3221225472;
  block[2] = __72__AVCaptureFigVideoDevice_chromaticityValuesForDeviceWhiteBalanceGains___block_invoke;
  block[3] = &unk_1E4217C18;
  block[4] = self;
  block[5] = &v52;
  block[6] = v27;
  dispatch_sync(devicePropsQueue, block);
  v28 = 0;
  v29 = v53[3];
  v30 = -1;
  v19 = 0.5;
  v31 = 3.40282347e38;
  while (1)
  {
    -[AVCaptureFigVideoDevice _whiteBalanceMixingFactorForTemperature:](self, "_whiteBalanceMixingFactorForTemperature:", v29);
    v33 = v32;
    *(float *)&v32 = v22;
    *(float *)&v34 = v23;
    *(float *)&v35 = v24;
    -[AVCaptureFigVideoDevice _chromaticityValuesForDeviceWhiteBalanceGains:atMix:](self, "_chromaticityValuesForDeviceWhiteBalanceGains:atMix:", v32, v34, v35, v33);
    v37 = v36;
    v39 = v38;
    v49 = 0;
    v50 = 0.0;
    xy_to_tempTint(&v50, (double *)&v49, v36, v38);
    v29 = v50;
    v40 = v53[3];
    v41 = vabdd_f64(v50, v40);
    if (v41 >= v31)
      break;
    v7 = v37;
    v30 = v28;
    v19 = v39;
    if (v50 - v40 == 0.0)
      goto LABEL_35;
LABEL_33:
    v53[3] = v50;
    ++v28;
    v31 = v41;
    if (v28 == 50)
    {
      v42 = self->_devicePropsQueue;
      v47[0] = v26;
      v47[1] = 3221225472;
      v47[2] = __72__AVCaptureFigVideoDevice_chromaticityValuesForDeviceWhiteBalanceGains___block_invoke_2;
      v47[3] = &unk_1E4217D58;
      v47[4] = self;
      v48 = 50;
      v43 = v47;
      goto LABEL_36;
    }
  }
  v41 = v31;
  if (v28 - v30 <= 1)
    goto LABEL_33;
LABEL_35:
  v42 = self->_devicePropsQueue;
  v45[0] = v26;
  v45[1] = 3221225472;
  v45[2] = __72__AVCaptureFigVideoDevice_chromaticityValuesForDeviceWhiteBalanceGains___block_invoke_3;
  v45[3] = &unk_1E4217D80;
  v45[4] = self;
  v45[5] = &v52;
  v45[6] = v44;
  v46 = v28;
  v43 = v45;
LABEL_36:
  dispatch_sync(v42, v43);
  _Block_object_dispose(&v52, 8);
LABEL_22:
  v20 = v7;
  v21 = v19;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

double *__72__AVCaptureFigVideoDevice_chromaticityValuesForDeviceWhiteBalanceGains___block_invoke(double *result)
{
  uint64_t v1;
  double v2;
  uint64_t v3;

  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 5) + 8) + 24) = *(_QWORD *)(*((_QWORD *)result + 4) + 616);
  v1 = *(_QWORD *)(*((_QWORD *)result + 5) + 8);
  if (*(double *)(v1 + 24) < 0.0)
  {
    v2 = result[6];
LABEL_5:
    *(double *)(v1 + 24) = v2;
    return result;
  }
  v3 = *((_QWORD *)result + 4);
  v2 = result[6];
  if (vabdd_f64(*(double *)(v3 + 608), v2) > 500.0 || !*(_BYTE *)(v3 + 624))
    goto LABEL_5;
  return result;
}

uint64_t __72__AVCaptureFigVideoDevice_chromaticityValuesForDeviceWhiteBalanceGains___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 632) = *(int *)(result + 40);
  return result;
}

double __72__AVCaptureFigVideoDevice_chromaticityValuesForDeviceWhiteBalanceGains___block_invoke_3(uint64_t a1)
{
  double result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 616) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = *(double *)(a1 + 48);
  *(double *)(*(_QWORD *)(a1 + 32) + 608) = result;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 632) = *(int *)(a1 + 56);
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)deviceWhiteBalanceGainsForChromaticityValues:(id)a3
{
  float var0;
  float var1;
  BOOL v5;
  double v7;
  double v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  var0 = a3.var0;
  if (a3.var0 > 1.0 || ((var1 = a3.var1, a3.var0 >= 0.0) ? (v5 = a3.var1 > 1.0) : (v5 = 1), v5 || a3.var1 < 0.0))
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99858];
    objc_opt_class();
    v14 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v14);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
  }
  else
  {
    v15 = 0;
    v16 = 0.0;
    v7 = xy_to_tempTint(&v16, (double *)&v15, a3.var0, a3.var1);
    *(float *)&v7 = var0;
    *(float *)&v8 = var1;
    -[AVCaptureFigVideoDevice _deviceWhiteBalanceGainsForChromaticityValues:temperature:](self, "_deviceWhiteBalanceGainsForChromaticityValues:temperature:", v7, v8, v16);
  }
  result.var2 = v11;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)temperatureAndTintValuesForDeviceWhiteBalanceGains:(id)a3
{
  float var2;
  float var1;
  float var0;
  double v7;
  double v8;
  double v9;
  void *v15;
  uint64_t v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  double v23;
  $94F468A8D4C62B317260615823C2B210 result;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  -[AVCaptureFigVideoDevice maxWhiteBalanceGain](self, "maxWhiteBalanceGain");
  if (var0 < 1.0 || var0 > *(float *)&v7 || var1 < 1.0 || var1 > *(float *)&v7 || var2 < 1.0 || var2 > *(float *)&v7)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99858];
    objc_opt_class();
    v17 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v17);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v17);
    v21 = 0.0;
    v20 = 0.0;
  }
  else
  {
    *(float *)&v7 = var0;
    *(float *)&v8 = var1;
    *(float *)&v9 = var2;
    -[AVCaptureFigVideoDevice chromaticityValuesForDeviceWhiteBalanceGains:](self, "chromaticityValuesForDeviceWhiteBalanceGains:", v7, v8, v9);
    v22 = 0.0;
    v23 = 0.0;
    xy_to_tempTint(&v23, &v22, v18, v19);
    v20 = v23;
    v21 = v22;
  }
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)deviceWhiteBalanceGainsForTemperatureAndTintValues:(id)a3
{
  double var0;
  double v5;
  double v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v10 = 0.0;
  v11 = 0.0;
  var0 = a3.var0;
  tempTint_to_xy(&v11, &v10, a3.var0, a3.var1);
  HIDWORD(v6) = HIDWORD(v10);
  HIDWORD(v5) = HIDWORD(v11);
  *(float *)&v5 = v11;
  *(float *)&v6 = v10;
  -[AVCaptureFigVideoDevice _deviceWhiteBalanceGainsForChromaticityValues:temperature:](self, "_deviceWhiteBalanceGainsForChromaticityValues:temperature:", v5, v6, var0);
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)_setFlashSceneDetectedForPhotoOutput:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__AVCaptureFigVideoDevice__setFlashSceneDetectedForPhotoOutput___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __64__AVCaptureFigVideoDevice__setFlashSceneDetectedForPhotoOutput___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 747) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_setFlashAvailable:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AVCaptureFigVideoDevice__setFlashAvailable___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __46__AVCaptureFigVideoDevice__setFlashAvailable___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 768) = *(_BYTE *)(result + 40);
  return result;
}

- (int64_t)flashMode
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVCaptureFigVideoDevice_flashMode__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVCaptureFigVideoDevice_flashMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 736);
  return result;
}

- (BOOL)_isFlashScene
{
  id v2;
  char v3;

  v2 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04CB8]);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_setTorchActive:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__AVCaptureFigVideoDevice__setTorchActive___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __43__AVCaptureFigVideoDevice__setTorchActive___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 784) = *(_BYTE *)(result + 40);
  return result;
}

- (float)torchLevel
{
  NSObject *devicePropsQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVCaptureFigVideoDevice_torchLevel__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __37__AVCaptureFigVideoDevice_torchLevel__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 788);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_setTorchLevel:(float)a3
{
  NSObject *devicePropsQueue;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  _QWORD block[6];
  float v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  devicePropsQueue = self->_devicePropsQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AVCaptureFigVideoDevice__setTorchLevel___block_invoke;
  block[3] = &unk_1E4217DA8;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(devicePropsQueue, block);
  if (v11[3] != -1)
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("torchMode"));
    v6 = self->_devicePropsQueue;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __42__AVCaptureFigVideoDevice__setTorchLevel___block_invoke_2;
    v7[3] = &unk_1E42178B8;
    v7[4] = self;
    v7[5] = &v10;
    dispatch_sync(v6, v7);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("torchMode"));
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __42__AVCaptureFigVideoDevice__setTorchLevel___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(*(_QWORD *)(result + 32) + 788) = *(_DWORD *)(result + 48);
  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 776);
  if (!v1)
  {
    if (*(float *)(result + 48) <= 0.0)
      return result;
    v2 = 1;
    goto LABEL_7;
  }
  if (v1 == 1 && *(float *)(result + 48) == 0.0)
  {
    v2 = 0;
LABEL_7:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  }
  return result;
}

uint64_t __42__AVCaptureFigVideoDevice__setTorchLevel___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 776) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

- (void)_setTorchAvailable:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AVCaptureFigVideoDevice__setTorchAvailable___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __46__AVCaptureFigVideoDevice__setTorchAvailable___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 792) = *(_BYTE *)(result + 40);
  return result;
}

- (int64_t)torchMode
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVCaptureFigVideoDevice_torchMode__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVCaptureFigVideoDevice_torchMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 776);
  return result;
}

- (BOOL)setTorchModeOnWithLevel:(float)a3 error:(id *)a4
{
  double v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *devicePropsQueue;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[5];
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  if (!-[AVCaptureFigVideoDevice isTorchModeSupported:](self, "isTorchModeSupported:", 1)
    || a3 != 3.4028e38 && (a3 <= 0.0 || a3 > 1.0))
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    goto LABEL_9;
  }
  *(float *)&v7 = a3;
  v8 = -[AVCaptureFigVideoDevice _setTorchMode:withLevel:](self, "_setTorchMode:withLevel:", 1, v7);
  v9 = v8;
  if (!v8)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    devicePropsQueue = self->_devicePropsQueue;
    v15 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__AVCaptureFigVideoDevice_setTorchModeOnWithLevel_error___block_invoke;
    block[3] = &unk_1E4217A60;
    block[4] = self;
    block[5] = &v19;
    dispatch_sync(devicePropsQueue, block);
    if (*((_BYTE *)v20 + 24))
    {
      -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("torchMode"));
      v16 = self->_devicePropsQueue;
      v17[0] = v15;
      v17[1] = 3221225472;
      v17[2] = __57__AVCaptureFigVideoDevice_setTorchModeOnWithLevel_error___block_invoke_2;
      v17[3] = &unk_1E42165A8;
      v17[4] = self;
      dispatch_sync(v16, v17);
      -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("torchMode"));
    }
    _Block_object_dispose(&v19, 8);
    return v9 == 0;
  }
  if (v8 != -16452)
  {
    if (a4)
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus();
    return v9 == 0;
  }
  v10 = (void *)MEMORY[0x1E0C99DA0];
  v11 = *MEMORY[0x1E0C99750];
  objc_opt_class();
LABEL_9:
  v12 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v12);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
  return 0;
}

uint64_t __57__AVCaptureFigVideoDevice_setTorchModeOnWithLevel_error___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 776) != 1;
  return result;
}

uint64_t __57__AVCaptureFigVideoDevice_setTorchModeOnWithLevel_error___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 776) = 1;
  return result;
}

- (BOOL)isSubjectAreaChangeMonitoringEnabled
{
  return BYTE1(self->_torchLevel);
}

- (BOOL)providesStortorgetMetadata
{
  return (BOOL)self->_sceneClassificationKVO;
}

- (void)setProvidesStortorgetMetadata:(BOOL)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04D58], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"));
  if (v5 == -16452)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
  else if (!v5)
  {
    LOBYTE(self->_sceneClassificationKVO) = a3;
  }
}

- (BOOL)isImageControlModeSupported:(int64_t)a3
{
  char v4;
  BOOL v5;

  v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04900]), "BOOLValue");
  if ((unint64_t)(a3 - 5) < 2)
    v5 = v4;
  else
    v5 = 0;
  return (unint64_t)a3 < 5 || v5;
}

- (void)setImageControlMode:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *devicePropsQueue;
  int64_t v15;
  _QWORD block[6];

  if (-[AVCaptureFigVideoDevice isImageControlModeSupported:](self, "isImageControlModeSupported:"))
  {
    if (!BYTE1(self->_sceneClassificationKVO))
    {
      v13 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04D08], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
      if (v13 != -16452)
      {
        if (!v13)
        {
          devicePropsQueue = self->_devicePropsQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __47__AVCaptureFigVideoDevice_setImageControlMode___block_invoke;
          block[3] = &unk_1E4216650;
          block[4] = self;
          block[5] = a3;
          dispatch_sync(devicePropsQueue, block);
        }
        return;
      }
    }
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v7 = AVMethodExceptionReasonWithClassAndSelector();
    v8 = v5;
    v9 = v6;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    v15 = a3;
    v7 = AVMethodExceptionReasonWithClassAndSelector();
    v8 = v10;
    v9 = v11;
  }
  v12 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v7, 0, v15);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v12);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
}

uint64_t __47__AVCaptureFigVideoDevice_setImageControlMode___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 728) = *(_QWORD *)(result + 40);
  return result;
}

- (void)_setImageControlMode:(int64_t)a3
{
  NSObject *devicePropsQueue;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[6];
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVCaptureFigVideoDevice__setImageControlMode___block_invoke;
  block[3] = &unk_1E4217C18;
  block[5] = &v10;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(devicePropsQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("imageControlMode"));
    v7 = self->_devicePropsQueue;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __48__AVCaptureFigVideoDevice__setImageControlMode___block_invoke_2;
    v8[3] = &unk_1E4216650;
    v8[4] = self;
    v8[5] = a3;
    dispatch_sync(v7, v8);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("imageControlMode"));
  }
  _Block_object_dispose(&v10, 8);
}

_QWORD *__48__AVCaptureFigVideoDevice__setImageControlMode___block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = result[6] != *(_QWORD *)(result[4] + 728);
  return result;
}

uint64_t __48__AVCaptureFigVideoDevice__setImageControlMode___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 728) = *(_QWORD *)(result + 40);
  return result;
}

- (id)runDiagnosticsWithTestType:(id)a3
{
  NSObject *devicePropsQueue;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVCaptureFigVideoDevice_runDiagnosticsWithTestType___block_invoke;
  block[3] = &unk_1E4217DD0;
  block[4] = self;
  block[5] = a3;
  block[6] = &v10;
  block[7] = &v14;
  dispatch_sync(devicePropsQueue, block);
  if (!*((_BYTE *)v11 + 24))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    objc_opt_class();
    v6 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithClassAndSelector(), 0, a3);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  v7 = (void *)v15[5];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __54__AVCaptureFigVideoDevice_runDiagnosticsWithTestType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDiagnosticsTestSupported:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (*(__CFString **)(a1 + 40) == CFSTR("AVCaptureDeviceDiagnosticsTestTypeAutoFocusPositionSensorCalibration"))
    {
      result = objc_msgSend(*(id *)(a1 + 32), "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04BC8]);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
    }
  }
  return result;
}

- (BOOL)isDiagnosticsTestSupported:(id)a3
{
  if (CFSTR("AVCaptureDeviceDiagnosticsTestTypeAutoFocusPositionSensorCalibration") == a3)
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04788]), "BOOLValue");
  else
    return 0;
}

- (CGRect)faceRectangle
{
  NSObject *devicePropsQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  CGRect result;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x4010000000;
  v15 = &unk_19EF10DB5;
  v16 = 0u;
  v17 = 0u;
  devicePropsQueue = self->_devicePropsQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__AVCaptureFigVideoDevice_faceRectangle__block_invoke;
  v11[3] = &unk_1E4217A60;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(devicePropsQueue, v11);
  v3 = v13[4];
  v4 = v13[5];
  v5 = v13[6];
  v6 = v13[7];
  _Block_object_dispose(&v12, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

__n128 __40__AVCaptureFigVideoDevice_faceRectangle__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 824);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 808);
  *(__n128 *)(v1 + 48) = result;
  return result;
}

- (int)faceRectangleAngle
{
  NSObject *devicePropsQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVCaptureFigVideoDevice_faceRectangleAngle__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__AVCaptureFigVideoDevice_faceRectangleAngle__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 840);
  return result;
}

- (BOOL)_isHighDynamicRangeScene
{
  id v2;
  char v3;

  v2 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04D10]);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_setHDRSceneDetectedForPhotoOutput:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__AVCaptureFigVideoDevice__setHDRSceneDetectedForPhotoOutput___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __62__AVCaptureFigVideoDevice__setHDRSceneDetectedForPhotoOutput___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 847) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)_isStillImageStabilizationScene
{
  id v2;
  char v3;

  v2 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04D18]);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (int64_t)_digitalFlashStatus
{
  id v2;
  int64_t v3;

  v2 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04C68]);
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (id)_digitalFlashExposureTimes
{
  return -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04C58]);
}

- (void)_setDigitalFlashSceneForPhotoOutput:(id)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[6];

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__AVCaptureFigVideoDevice__setDigitalFlashSceneForPhotoOutput___block_invoke;
  v4[3] = &unk_1E4216408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(devicePropsQueue, v4);
}

id __63__AVCaptureFigVideoDevice__setDigitalFlashSceneForPhotoOutput___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 760) = result;
  return result;
}

- (float)timeLapseCaptureRate
{
  float result;

  objc_msgSend(-[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04DD0]), "floatValue");
  return result;
}

- (void)setTimeLapseCaptureRate:(float)a3
{
  -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04DD0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"));
}

- (BOOL)ultraHighResolutionZeroShutterLagEnabled
{
  return objc_msgSend(-[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04DF0]), "BOOLValue");
}

- (void)setUltraHighResolutionZeroShutterLagEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice lockForConfiguration:](self, "lockForConfiguration:", 0))
  {
    -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04DF0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3));
    -[AVCaptureFigVideoDevice unlockForConfiguration](self, "unlockForConfiguration");
  }
}

- (BOOL)isMachineReadableCodeDetectionSupported
{
  return 1;
}

- (void)setVideoZoomRampAcceleration:(float)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04E08], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"));
  if (v5 == -16452)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
  else if (!v5)
  {
    self->_videoZoomRampTarget = a3;
  }
}

- (void)rampToVideoZoomFactor:(double)a3 withRate:(float)a4
{
  -[AVCaptureFigVideoDevice _rampToVideoZoomFactor:withRate:duration:rampType:rampTuning:](self, "_rampToVideoZoomFactor:withRate:duration:rampType:rampTuning:", 1, 0, a3);
}

- (void)rampExponentiallyToVideoZoomFactor:(float)a3 withDuration:(double)a4
{
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a4 == 0.0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99858];
    objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else
  {
    v4 = a4;
    LODWORD(a4) = 0;
    -[AVCaptureFigVideoDevice _rampToVideoZoomFactor:withRate:duration:rampType:rampTuning:](self, "_rampToVideoZoomFactor:withRate:duration:rampType:rampTuning:", 2, 0, a3, a4, v4);
  }
}

- (void)rampToVideoZoomFactor:(float)a3 withTuning:(int64_t)a4
{
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if ((unint64_t)a4 >= 3)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99858];
    objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else
  {
    LODWORD(v4) = 0;
    -[AVCaptureFigVideoDevice _rampToVideoZoomFactor:withRate:duration:rampType:rampTuning:](self, "_rampToVideoZoomFactor:withRate:duration:rampType:rampTuning:", 3, a4, a3, v4, 1.0);
  }
}

- (void)_rampToVideoZoomFactor:(double)a3 withRate:(float)a4 duration:(double)a5 rampType:(int)a6 rampTuning:(int)a7
{
  uint64_t v8;
  uint64_t v9;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *devicePropsQueue;
  uint64_t v18;
  double v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v27[6];
  _QWORD v28[5];
  _QWORD v29[6];
  _QWORD block[11];
  float v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  _QWORD v52[6];
  _QWORD v53[7];

  v53[6] = *MEMORY[0x1E0C80C00];
  if (a3 >= 1.0
    && (v8 = *(_QWORD *)&a7,
        v9 = *(_QWORD *)&a6,
        objc_msgSend(-[AVCaptureFigVideoDevice activeFormat](self, "activeFormat"), "videoMaxZoomFactor"),
        v13 >= a3))
  {
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v32 = 0;
    v33 = (double *)&v32;
    v34 = 0x2020000000;
    v35 = a3;
    devicePropsQueue = self->_devicePropsQueue;
    v18 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke;
    block[3] = &unk_1E4217DF8;
    block[4] = self;
    block[5] = &v32;
    block[6] = &v48;
    block[7] = &v44;
    v31 = a4;
    *(double *)&block[10] = a5;
    block[8] = &v36;
    block[9] = &v40;
    dispatch_sync(devicePropsQueue, block);
    if (!LOBYTE(self->_stereoVideoCaptureStatus)
      || self->_continuousZoomWithDepthActive
      || self->_cinematicVideoZoomEnabled)
    {
      if (*((_BYTE *)v45 + 24) && (*((_BYTE *)v49 + 24) || !*((_BYTE *)v41 + 24)))
      {
        v52[0] = *MEMORY[0x1E0D04ED0];
        v53[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33[3]);
        v52[1] = *MEMORY[0x1E0D04EE8];
        *(float *)&v19 = a4;
        v53[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
        v52[2] = *MEMORY[0x1E0D04EE0];
        v53[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
        v52[3] = *MEMORY[0x1E0D04EF8];
        v53[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
        v52[4] = *MEMORY[0x1E0D04EF0];
        v53[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
        v52[5] = *MEMORY[0x1E0D04ED8];
        v53[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v37 + 6));
        v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 6);
        v21 = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04E00], v20);
        if (v21)
        {
          if (v21 == -16452)
          {
            v22 = (void *)MEMORY[0x1E0C99DA0];
            objc_opt_class();
            v23 = (void *)objc_msgSend(v22, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
            if (AVCaptureShouldThrowForAPIViolations())
              objc_exception_throw(v23);
            NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v23);
          }
        }
        else
        {
          if (!*((_BYTE *)v49 + 24))
            -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rampingVideoZoom"));
          v26 = self->_devicePropsQueue;
          v27[0] = v18;
          v27[1] = 3221225472;
          v27[2] = __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke_4;
          v27[3] = &unk_1E42178B8;
          v27[4] = self;
          v27[5] = &v32;
          dispatch_sync(v26, v27);
          if (!*((_BYTE *)v49 + 24))
            -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rampingVideoZoom"));
        }
      }
      else
      {
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rampingVideoZoom"));
        v24 = self->_devicePropsQueue;
        v29[0] = v18;
        v29[1] = 3221225472;
        v29[2] = __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke_2;
        v29[3] = &unk_1E42178B8;
        v29[4] = self;
        v29[5] = &v32;
        dispatch_sync(v24, v29);
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rampingVideoZoom"));
        -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rampingVideoZoom"));
        v25 = self->_devicePropsQueue;
        v28[0] = v18;
        v28[1] = 3221225472;
        v28[2] = __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke_3;
        v28[3] = &unk_1E42165A8;
        v28[4] = self;
        dispatch_sync(v25, v28);
        -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rampingVideoZoom"));
      }
    }
    else
    {
      -[AVCaptureFigVideoDevice setVideoZoomFactor:](self, "setVideoZoomFactor:", v33[3]);
    }
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99858];
    objc_opt_class();
    v16 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithClassAndSelector(), 0, *(_QWORD *)&a3);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v16);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v16);
  }
}

uint64_t __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  BOOL v6;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v3 = *(double *)(v2 + 24);
  v4 = *(double *)(v1 + 880);
  if (v3 < v4)
  {
    *(double *)(v2 + 24) = v4;
    v1 = *(_QWORD *)(result + 32);
    v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    v3 = *(double *)(v2 + 24);
  }
  v5 = *(double *)(v1 + 888);
  if (v3 > v5)
  {
    *(double *)(v2 + 24) = v5;
    v1 = *(_QWORD *)(result + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = *(float *)(v1 + 868) != 0.0;
  v6 = *(float *)(result + 88) != 0.0
    || *(double *)(result + 80) != 0.0
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = v6;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24) = ++*(_DWORD *)(*(_QWORD *)(result + 32) + 872);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8)
                                                                             + 24) == *(float *)(*(_QWORD *)(result + 32)
                                                                                                 + 864);
  return result;
}

float __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke_2(uint64_t a1)
{
  float result;

  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *(float *)(*(_QWORD *)(a1 + 32) + 868) = result;
  return result;
}

uint64_t __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke_3(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 868) = 0;
  return result;
}

float __88__AVCaptureFigVideoDevice__rampToVideoZoomFactor_withRate_duration_rampType_rampTuning___block_invoke_4(uint64_t a1)
{
  float result;

  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *(float *)(*(_QWORD *)(a1 + 32) + 868) = result;
  return result;
}

- (void)cancelVideoZoomRamp
{
  NSObject *devicePropsQueue;
  double v4;
  float v5;
  _QWORD v6[6];
  uint64_t v7;
  float *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = (float *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__AVCaptureFigVideoDevice_cancelVideoZoomRamp__block_invoke;
  v6[3] = &unk_1E4217A60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(devicePropsQueue, v6);
  v5 = v8[6];
  if (v5 != 0.0)
  {
    LODWORD(v4) = 0;
    -[AVCaptureFigVideoDevice rampToVideoZoomFactor:withRate:](self, "rampToVideoZoomFactor:withRate:", v5, v4);
  }
  _Block_object_dispose(&v7, 8);
}

float __46__AVCaptureFigVideoDevice_cancelVideoZoomRamp__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 868);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)dualCameraSwitchOverVideoZoomFactor
{
  id v2;
  float v3;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04798]);
  if (!objc_msgSend(v2, "count"))
    return 1.0;
  objc_msgSend((id)objc_msgSend(v2, "firstObject"), "floatValue");
  return v3;
}

double *__59__AVCaptureFigVideoDevice__setMinAvailableVideoZoomFactor___block_invoke_2(double *result)
{
  *(double *)(*((_QWORD *)result + 4) + 880) = result[6];
  if (result[6] > *(float *)(*((_QWORD *)result + 4) + 864))
    *(_BYTE *)(*(_QWORD *)(*((_QWORD *)result + 5) + 8) + 24) = 1;
  return result;
}

- (double)maxAvailableVideoZoomFactor
{
  NSObject *devicePropsQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureFigVideoDevice_maxAvailableVideoZoomFactor__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __54__AVCaptureFigVideoDevice_maxAvailableVideoZoomFactor__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 888);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_resetDefaultVideoZoomFactor
{
  double v3;
  uint64_t v4;
  uint64_t v5;

  v4 = 0;
  v5 = 0;
  v3 = 0.0;
  -[AVCaptureFigVideoDevice _computeMinVideoZoomFactorOut:maxVideoZoomFactorOut:defaultVideoZoomFactorOut:centerStageActiveOverride:resetZoomFactor:](self, "_computeMinVideoZoomFactorOut:maxVideoZoomFactorOut:defaultVideoZoomFactorOut:centerStageActiveOverride:resetZoomFactor:", &v5, &v4, &v3, BYTE4(self->_degradedCaptureQualityFactors), 1);
  -[AVCaptureFigVideoDevice _setVideoZoomFactor:](self, "_setVideoZoomFactor:", v3);
}

- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[6];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (!v3
      || -[AVCaptureFigVideoDevice isGeometricDistortionCorrectionSupported](self, "isGeometricDistortionCorrectionSupported"))
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v14 = 0;
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__AVCaptureFigVideoDevice_setGeometricDistortionCorrectionEnabled___block_invoke;
      block[3] = &unk_1E4217BF0;
      block[4] = self;
      block[5] = &v11;
      v10 = v3;
      dispatch_sync(devicePropsQueue, block);
      if (*((_BYTE *)v12 + 24))
        -[AVCaptureFigVideoDevice _updateCenterStageActiveForEnabled:updateDependentProperties:](self, "_updateCenterStageActiveForEnabled:updateDependentProperties:", +[AVCaptureDevice isCenterStageEnabled](AVCaptureDevice, "isCenterStageEnabled"), 1);
      _Block_object_dispose(&v11, 8);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

uint64_t __67__AVCaptureFigVideoDevice_setGeometricDistortionCorrectionEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 1168) != *(unsigned __int8 *)(result + 48);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1168) = *(_BYTE *)(result + 48);
  return result;
}

- (id)cameraPoseMatrix
{
  NSObject *devicePropsQueue;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_cameraPoseMatrix__block_invoke;
  v5[3] = &unk_1E42178B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVCaptureFigVideoDevice_cameraPoseMatrix__block_invoke(uint64_t a1)
{
  uint64_t result;
  const __CFString *v3;
  void *v4;
  BOOL v5;

  result = objc_msgSend(*(id *)(a1 + 32), "isVirtualDevice");
  if ((result & 1) == 0)
  {
    v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "deviceType");
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1192);
    if (v4)
      v5 = v3 == CFSTR("AVCaptureDeviceTypeBuiltInTimeOfFlightCamera");
    else
      v5 = 1;
    if (v5)
    {

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1192) = objc_msgSend(*(id *)(a1 + 32), "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04C10]);
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1192);
    }
    result = v4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

uint64_t __88__AVCaptureFigVideoDevice__updateCenterStageActiveForEnabled_updateDependentProperties___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1212) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

- (CGRect)centerStageRectOfInterest
{
  __int128 v2;
  NSObject *devicePropsQueue;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[6];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  CGRect result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x4010000000;
  v16 = &unk_19EF10DB5;
  v2 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v17 = *MEMORY[0x1E0C9D628];
  v18 = v2;
  devicePropsQueue = self->_devicePropsQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__AVCaptureFigVideoDevice_centerStageRectOfInterest__block_invoke;
  v12[3] = &unk_1E4217A60;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(devicePropsQueue, v12);
  v4 = v14[4];
  v5 = v14[5];
  v6 = v14[6];
  v7 = v14[7];
  _Block_object_dispose(&v13, 8);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

__n128 __52__AVCaptureFigVideoDevice_centerStageRectOfInterest__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 1232);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 1216);
  *(__n128 *)(v1 + 48) = result;
  return result;
}

- (void)setCenterStageRectOfInterest:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSObject *devicePropsQueue;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (+[AVCaptureDevice isCenterStageEnabled](AVCaptureDevice, "isCenterStageEnabled")
      && validRectInUnitRectCoordinateSpace(x, y, width, height))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__AVCaptureFigVideoDevice_setCenterStageRectOfInterest___block_invoke;
      block[3] = &unk_1E4217E48;
      *(CGFloat *)&block[5] = x;
      *(CGFloat *)&block[6] = y;
      *(CGFloat *)&block[7] = width;
      *(CGFloat *)&block[8] = height;
      block[4] = self;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v11 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v11);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
}

void __56__AVCaptureFigVideoDevice_setCenterStageRectOfInterest___block_invoke(uint64_t a1)
{
  id *v2;
  CFDictionaryRef DictionaryRepresentation;
  _OWORD *v4;
  __int128 v5;

  v2 = (id *)(a1 + 40);
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(a1 + 40));
  if (!objc_msgSend(*(v2 - 1), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04C30], DictionaryRepresentation))
  {
    v4 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1216);
    v5 = *((_OWORD *)v2 + 1);
    *v4 = *(_OWORD *)v2;
    v4[1] = v5;
  }
  CFRelease(DictionaryRepresentation);
}

- (BOOL)_centerStageRectOfInterestSupportedOnDevice
{
  NSArray *formats;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  formats = self->_formats;
  if (formats)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = -[NSArray countByEnumeratingWithState:objects:count:](formats, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(formats);
          if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "figCaptureSourceVideoFormat"), "isCenterStageRectOfInterestSupported") & 1) != 0)
          {
            LOBYTE(v3) = 1;
            return v3;
          }
          ++v6;
        }
        while (v4 != v6);
        v3 = -[NSArray countByEnumeratingWithState:objects:count:](formats, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v4 = v3;
        if (v3)
          continue;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isCenterStageMetadataDeliverySupported
{
  return BYTE3(self->_degradedCaptureQualityFactors);
}

- (BOOL)isCenterStageMetadataDeliveryEnabled
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AVCaptureFigVideoDevice_isCenterStageMetadataDeliveryEnabled__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__AVCaptureFigVideoDevice_isCenterStageMetadataDeliveryEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1248);
  return result;
}

- (void)setCenterStageMetadataDeliveryEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD block[5];
  BOOL v15;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (!v3
      || -[AVCaptureFigVideoDevice isCenterStageMetadataDeliverySupported](self, "isCenterStageMetadataDeliverySupported"))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__AVCaptureFigVideoDevice_setCenterStageMetadataDeliveryEnabled___block_invoke;
      block[3] = &unk_1E4217A10;
      block[4] = self;
      v15 = v3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v8 = AVMethodExceptionReasonWithObjectAndSelector();
    v9 = v11;
    v10 = v12;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v8 = AVMethodExceptionReasonWithClassAndSelector();
    v9 = v6;
    v10 = v7;
  }
  v13 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v8, 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v13);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
}

uint64_t __65__AVCaptureFigVideoDevice_setCenterStageMetadataDeliveryEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04C28], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  if (!(_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1248) = *(_BYTE *)(a1 + 40);
  return result;
}

- (void)_setCenterStageFramingMode:(int64_t)a3
{
  NSObject *devicePropsQueue;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVCaptureFigVideoDevice__setCenterStageFramingMode___block_invoke;
  block[3] = &unk_1E4217A38;
  block[4] = self;
  block[5] = &v6;
  block[6] = a3;
  dispatch_sync(devicePropsQueue, block);
  if (*((_DWORD *)v7 + 6) && dword_1ECFED6C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __54__AVCaptureFigVideoDevice__setCenterStageFramingMode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "lockForConfiguration:", 0);
  if ((_DWORD)result)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04C20], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48)));
    return objc_msgSend(*(id *)(a1 + 32), "unlockForConfiguration");
  }
  return result;
}

- (BOOL)isManualFramingSupported
{
  return BYTE2(self->_deskViewCameraMode);
}

- (double)displayVideoZoomFactorMultiplier
{
  NSObject *devicePropsQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0x3FF0000000000000;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVCaptureFigVideoDevice_displayVideoZoomFactorMultiplier__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __59__AVCaptureFigVideoDevice_displayVideoZoomFactorMultiplier__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 904);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setManualFramingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  NSObject *devicePropsQueue;
  void *v8;
  _QWORD block[5];
  BOOL v10;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (!v3
      || -[AVCaptureFigVideoDevice isManualFramingSupported](self, "isManualFramingSupported")
      && !BYTE4(self->_degradedCaptureQualityFactors))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__AVCaptureFigVideoDevice_setManualFramingEnabled___block_invoke;
      block[3] = &unk_1E4217A10;
      block[4] = self;
      v10 = v3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

uint64_t __51__AVCaptureFigVideoDevice_setManualFramingEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1299) = *(_BYTE *)(result + 40);
  return result;
}

- (double)manualFramingMinZoomFactor
{
  NSObject *devicePropsQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__AVCaptureFigVideoDevice_manualFramingMinZoomFactor__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __53__AVCaptureFigVideoDevice_manualFramingMinZoomFactor__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 1312);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)manualFramingMaxZoomFactor
{
  NSObject *devicePropsQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__AVCaptureFigVideoDevice_manualFramingMaxZoomFactor__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __53__AVCaptureFigVideoDevice_manualFramingMaxZoomFactor__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 1320);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)manualFramingDefaultZoomFactor
{
  NSObject *devicePropsQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__AVCaptureFigVideoDevice_manualFramingDefaultZoomFactor__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __57__AVCaptureFigVideoDevice_manualFramingDefaultZoomFactor__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 1328);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGazeSelectionEnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__AVCaptureFigVideoDevice_setGazeSelectionEnabled___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __51__AVCaptureFigVideoDevice_setGazeSelectionEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1336) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __65__AVCaptureFigVideoDevice__updateBackgroundBlurActiveForEnabled___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1250) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __65__AVCaptureFigVideoDevice__updateStudioLightingActiveForEnabled___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1253) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

- (void)_performReaction:(id)a3
{
  NSObject *fcsQueue;
  _QWORD v4[6];

  fcsQueue = self->_fcsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__AVCaptureFigVideoDevice__performReaction___block_invoke;
  v4[3] = &unk_1E4216408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fcsQueue, v4);
}

_QWORD *__44__AVCaptureFigVideoDevice__performReaction___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v1 = result[5];
  v2 = *(_QWORD *)(result[4] + 56);
  if (v2)
  {
    result = (_QWORD *)CMBaseObjectGetVTable();
    v3 = (_QWORD *)result[2];
  }
  else
  {
    v3 = 0;
  }
  if (*v3 >= 4uLL)
  {
    v4 = (uint64_t (*)(uint64_t, uint64_t))v3[11];
    if (v4)
      return (_QWORD *)v4(v2, v1);
  }
  return result;
}

- (BOOL)isBackgroundReplacementActive
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVCaptureFigVideoDevice_isBackgroundReplacementActive__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__AVCaptureFigVideoDevice_isBackgroundReplacementActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1259);
  return result;
}

- (BOOL)_isBackgroundReplacementActiveForEnabled:(BOOL)a3
{
  return a3
      && -[AVCaptureDeviceFormat isBackgroundReplacementSupported](self->_activeFormat, "isBackgroundReplacementSupported")&& +[AVCaptureDevice isEligibleForBackgroundReplacement](AVCaptureDevice, "isEligibleForBackgroundReplacement");
}

- (void)_updateBackgroundReplacementActiveForEnabled:(BOOL)a3
{
  NSObject *devicePropsQueue;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  _QWORD block[7];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AVCaptureFigVideoDevice__updateBackgroundReplacementActiveForEnabled___block_invoke;
  block[3] = &unk_1E4217AB0;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v10;
  v9 = a3;
  dispatch_sync(devicePropsQueue, block);
  if (*((unsigned __int8 *)v15 + 24) != *((unsigned __int8 *)v11 + 24))
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("backgroundReplacementActive"));
    v6 = self->_devicePropsQueue;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __72__AVCaptureFigVideoDevice__updateBackgroundReplacementActiveForEnabled___block_invoke_2;
    v7[3] = &unk_1E42178B8;
    v7[4] = self;
    v7[5] = &v10;
    dispatch_sync(v6, v7);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("backgroundReplacementActive"));
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

uint64_t __72__AVCaptureFigVideoDevice__updateBackgroundReplacementActiveForEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1259);
  result = objc_msgSend(*(id *)(a1 + 32), "_isBackgroundReplacementActiveForEnabled:", *(unsigned __int8 *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __72__AVCaptureFigVideoDevice__updateBackgroundReplacementActiveForEnabled___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1259) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

- (void)_setBackgroundReplacementAllowed:(BOOL)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[5];
  BOOL v5;

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__AVCaptureFigVideoDevice__setBackgroundReplacementAllowed___block_invoke;
  v4[3] = &unk_1E4217A10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __60__AVCaptureFigVideoDevice__setBackgroundReplacementAllowed___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1260) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_updateBackgroundReplacementPixelBuffer:(__CVBuffer *)a3
{
  NSObject *devicePropsQueue;
  _QWORD v4[6];

  devicePropsQueue = self->_devicePropsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__AVCaptureFigVideoDevice__updateBackgroundReplacementPixelBuffer___block_invoke;
  v4[3] = &unk_1E4216650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(devicePropsQueue, v4);
}

uint64_t __67__AVCaptureFigVideoDevice__updateBackgroundReplacementPixelBuffer___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "lockForConfiguration:", 0);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourcePixelBufferProperty:withValue:", *MEMORY[0x1E0D04BE8], *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "unlockForConfiguration");
  }
  return result;
}

- (void)setVideoHDREnabled:(BOOL)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *devicePropsQueue;
  _QWORD block[6];
  BOOL v11;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration")
    && !-[AVCaptureFigVideoDevice automaticallyAdjustsVideoHDREnabled](self, "automaticallyAdjustsVideoHDREnabled"))
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__AVCaptureFigVideoDevice_setVideoHDREnabled___block_invoke;
    block[3] = &unk_1E42179E8;
    block[4] = self;
    block[5] = a2;
    v11 = a3;
    dispatch_sync(devicePropsQueue, block);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

void __46__AVCaptureFigVideoDevice_setVideoHDREnabled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "isVideoHDRSupported") & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 845) = *(_BYTE *)(a1 + 48);
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C99DA0];
    v3 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    v4 = (void *)objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
}

uint64_t __50__AVCaptureFigVideoDevice__resetVideoHDRSuspended__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04DF8], MEMORY[0x1E0C9AAA0]);
  if (!(_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 846) = 0;
  return result;
}

- (BOOL)isSISSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048D8]), "BOOLValue");
}

- (void)_setStillImageStabilizationAutomaticallyEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice lockForConfiguration:](self, "lockForConfiguration:", 0))
  {
    -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:](self, "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04D98], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3));
    -[AVCaptureFigVideoDevice unlockForConfiguration](self, "unlockForConfiguration");
  }
}

- (id)spatialCaptureDiscomfortReasons
{
  NSObject *devicePropsQueue;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVCaptureFigVideoDevice_spatialCaptureDiscomfortReasons__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVCaptureFigVideoDevice_spatialCaptureDiscomfortReasons__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 920));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_updateSpatialCaptureStatus:(unint64_t)a3
{
  unint64_t v3;
  char v4;
  void *v6;
  void *v7;
  NSObject *devicePropsQueue;
  _QWORD block[7];

  v3 = a3 & 7;
  if (((uint64_t)self->_spatialCaptureDiscomfortReasons & 7) != v3)
  {
    v4 = a3;
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("spatialCaptureDiscomfortReasons"));
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stereoCaptureStatus"));
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stereoVideoCaptureStatus"));
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = v6;
    if ((v4 & 2) != 0)
      objc_msgSend(v6, "addObject:", CFSTR("AVSpatialCaptureDiscomfortReasonNotEnoughLight"));
    if ((v4 & 4) != 0)
      objc_msgSend(v7, "addObject:", CFSTR("AVSpatialCaptureDiscomfortReasonSubjectTooClose"));
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__AVCaptureFigVideoDevice__updateSpatialCaptureStatus___block_invoke;
    block[3] = &unk_1E4217978;
    block[4] = self;
    block[5] = v7;
    block[6] = v3;
    dispatch_sync(devicePropsQueue, block);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("spatialCaptureDiscomfortReasons"));
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stereoCaptureStatus"));
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stereoVideoCaptureStatus"));
  }
}

uint64_t __55__AVCaptureFigVideoDevice__updateSpatialCaptureStatus___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", a1[5]);
  *(_QWORD *)(a1[4] + 920) = result;
  *(_QWORD *)(a1[4] + 928) = a1[6];
  return result;
}

- (int64_t)shallowDepthOfFieldEffectStatus
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVCaptureFigVideoDevice_shallowDepthOfFieldEffectStatus__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVCaptureFigVideoDevice_shallowDepthOfFieldEffectStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 944);
  return result;
}

id __56__AVCaptureFigVideoDevice__setDepthDataDeliveryEnabled___block_invoke_2(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128) = result;
  return result;
}

- (id)supportedVisionDataProperties
{
  return -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04938]);
}

- (void)setEyeDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice isEyeDetectionSupported](self, "isEyeDetectionSupported"))
  {
    if (-[AVCaptureFigVideoDevice _setFaceDetectionFeatureEnabled:enabledState:](self, "_setFaceDetectionFeatureEnabled:enabledState:", v3, &self->_supportedOptionalFaceDetectionFeatures) != -16452)return;
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  v7 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v7);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
}

- (void)setEyeClosedDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice isEyeClosedDetectionSupported](self, "isEyeClosedDetectionSupported"))
  {
    if (-[AVCaptureFigVideoDevice _setFaceDetectionFeatureEnabled:enabledState:](self, "_setFaceDetectionFeatureEnabled:enabledState:", v3, (char *)&self->_supportedOptionalFaceDetectionFeatures + 1) != -16452)return;
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  v7 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v7);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
}

- (void)setSmileDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice isSmileDetectionSupported](self, "isSmileDetectionSupported"))
  {
    if (-[AVCaptureFigVideoDevice _setFaceDetectionFeatureEnabled:enabledState:](self, "_setFaceDetectionFeatureEnabled:enabledState:", v3, (char *)&self->_supportedOptionalFaceDetectionFeatures + 2) != -16452)return;
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  v7 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v7);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
}

- (int)_setFaceDetectionFeatureEnabled:(BOOL)a3 enabledState:(BOOL *)a4
{
  _BOOL4 v4;
  int result;

  v4 = *a4;
  if (v4 == a3)
    return 0;
  *a4 = a3;
  result = -[AVCaptureFigVideoDevice _setFigCaptureSourceProperty:withValue:cacheOnly:](self, "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E0D04CA8], -[AVCaptureFigVideoDevice _faceDetectionConfigurationDictionary](self, "_faceDetectionConfigurationDictionary"), self->_cachesFigCaptureSourceConfigurationChanges);
  if (result)
    *a4 = v4;
  return result;
}

- (id)_faceDetectionConfigurationDictionary
{
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = *MEMORY[0x1E0D04A08];
  v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", LOBYTE(self->_supportedOptionalFaceDetectionFeatures));
  v4[1] = *MEMORY[0x1E0D04A00];
  v5[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE1(self->_supportedOptionalFaceDetectionFeatures));
  v4[2] = *MEMORY[0x1E0D04A10];
  v5[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE2(self->_supportedOptionalFaceDetectionFeatures));
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (BOOL)isAttentionDetectionSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04778]), "BOOLValue");
}

- (BOOL)setValue:(id)a3 forCMIOExtensionProperty:(id)a4 error:(id *)a5
{
  NSObject *devicePropsQueue;
  _QWORD v11[10];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  _QWORD v16[3];
  int v17;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_devicePropsQueue);
  devicePropsQueue = self->_devicePropsQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__AVCaptureFigVideoDevice_setValue_forCMIOExtensionProperty_error___block_invoke;
  v11[3] = &unk_1E4217EC0;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a3;
  v11[7] = v16;
  v11[8] = &v12;
  v11[9] = a5;
  dispatch_async_and_wait(devicePropsQueue, v11);
  LOBYTE(a5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);
  return (char)a5;
}

uint64_t __67__AVCaptureFigVideoDevice_setValue_forCMIOExtensionProperty_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if ((_DWORD)result)
  {
    if (*(_QWORD *)(a1 + 72))
    {
      result = AVLocalizedErrorWithUnderlyingOSStatus();
      **(_QWORD **)(a1 + 72) = result;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  return result;
}

- (id)copyValueForCMIOExtensionProperty:(id)a3 error:(id *)a4
{
  NSObject *devicePropsQueue;
  void *v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__5;
  v14 = __Block_byref_object_dispose__5;
  v15 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_devicePropsQueue);
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVCaptureFigVideoDevice_copyValueForCMIOExtensionProperty_error___block_invoke;
  block[3] = &unk_1E42178E0;
  block[5] = a3;
  block[6] = &v10;
  block[4] = self;
  dispatch_async_and_wait(devicePropsQueue, block);
  v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __67__AVCaptureFigVideoDevice_copyValueForCMIOExtensionProperty_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copyFigCaptureSourceProperty:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (BOOL)addCMIOExtensionPropertyValueChangeHandler:(id)a3
{
  NSObject *devicePropsQueue;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_devicePropsQueue);
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__AVCaptureFigVideoDevice_addCMIOExtensionPropertyValueChangeHandler___block_invoke;
  block[3] = &unk_1E4217EE8;
  block[4] = self;
  block[5] = a3;
  block[6] = &v8;
  dispatch_async_and_wait(devicePropsQueue, block);
  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

uint64_t __70__AVCaptureFigVideoDevice_addCMIOExtensionPropertyValueChangeHandler___block_invoke(_QWORD *a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__AVCaptureFigVideoDevice_addCMIOExtensionPropertyValueChangeHandler___block_invoke_2;
  block[3] = &unk_1E42165A8;
  block[4] = a1[4];
  if (addCMIOExtensionPropertyValueChangeHandler__onceToken != -1)
    dispatch_once(&addCMIOExtensionPropertyValueChangeHandler__onceToken, block);
  if (objc_msgSend(*(id *)(a1[4] + 1344), "containsObject:", a1[5]))
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  return objc_msgSend(*(id *)(a1[4] + 1344), "addObject:", a1[5]);
}

id __70__AVCaptureFigVideoDevice_addCMIOExtensionPropertyValueChangeHandler___block_invoke_2(uint64_t a1)
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1344) = result;
  return result;
}

- (void)removeCMIOExtensionPropertyValueChangeHandler:(id)a3
{
  NSObject *devicePropsQueue;
  _QWORD v6[6];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_devicePropsQueue);
  devicePropsQueue = self->_devicePropsQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__AVCaptureFigVideoDevice_removeCMIOExtensionPropertyValueChangeHandler___block_invoke;
  v6[3] = &unk_1E42171D0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async_and_wait(devicePropsQueue, v6);
}

uint64_t __73__AVCaptureFigVideoDevice_removeCMIOExtensionPropertyValueChangeHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1344), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1344), "removeObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)enumerateCMIOExtensionPropertiesWithBlock:(id)a3
{
  NSObject *devicePropsQueue;
  _QWORD v6[6];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_devicePropsQueue);
  devicePropsQueue = self->_devicePropsQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__AVCaptureFigVideoDevice_enumerateCMIOExtensionPropertiesWithBlock___block_invoke;
  v6[3] = &unk_1E42171D0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async_and_wait(devicePropsQueue, v6);
}

void __69__AVCaptureFigVideoDevice_enumerateCMIOExtensionPropertiesWithBlock___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04DB0]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __69__AVCaptureFigVideoDevice_enumerateCMIOExtensionPropertiesWithBlock___block_invoke_2;
    v3[3] = &unk_1E4217F10;
    v3[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

  }
}

uint64_t __69__AVCaptureFigVideoDevice_enumerateCMIOExtensionPropertiesWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A78]);
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A80]);
  v4 = *MEMORY[0x1E0D04A70];
  v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A70]), "BOOLValue");
  v6 = *MEMORY[0x1E0D04A68];
  v7 = objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A68]);
  v8 = *MEMORY[0x1E0D04A60];
  v9 = objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A60]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), v4);
  if (v7)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v6);
  if (v9)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v8);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)AVVideoSettingsForSessionPreset:(id)a3
{
  NSArray *availableBoxedMetadataFormatDescriptions;

  availableBoxedMetadataFormatDescriptions = self->_availableBoxedMetadataFormatDescriptions;
  if (!availableBoxedMetadataFormatDescriptions)
  {
    availableBoxedMetadataFormatDescriptions = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04B60]);
    self->_availableBoxedMetadataFormatDescriptions = availableBoxedMetadataFormatDescriptions;
  }
  return (id)-[NSArray objectForKeyedSubscript:](availableBoxedMetadataFormatDescriptions, "objectForKeyedSubscript:", a3);
}

- ($2825F4736939C4A6D3AD43837233062D)maxH264PhotoDimensions
{
  NSDictionary *sessionPresetCompressionSettings;
  uint64_t v4;
  id v5;
  unsigned int v6;
  id v7;

  sessionPresetCompressionSettings = self->_sessionPresetCompressionSettings;
  if (!sessionPresetCompressionSettings)
  {
    sessionPresetCompressionSettings = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04B68]);
    self->_sessionPresetCompressionSettings = sessionPresetCompressionSettings;
  }
  v4 = *MEMORY[0x1E0D04728];
  v5 = -[NSDictionary objectForKeyedSubscript:](sessionPresetCompressionSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0D04728]);
  v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D04720]), "intValue");
  v7 = -[NSDictionary objectForKeyedSubscript:](self->_sessionPresetCompressionSettings, "objectForKeyedSubscript:", v4);
  return ($2825F4736939C4A6D3AD43837233062D)(v6 | (unint64_t)(objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D04718]), "intValue") << 32));
}

- ($2825F4736939C4A6D3AD43837233062D)maxH264VideoDimensions
{
  NSDictionary *sessionPresetCompressionSettings;
  uint64_t v4;
  id v5;
  unsigned int v6;
  id v7;

  sessionPresetCompressionSettings = self->_sessionPresetCompressionSettings;
  if (!sessionPresetCompressionSettings)
  {
    sessionPresetCompressionSettings = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04B68]);
    self->_sessionPresetCompressionSettings = sessionPresetCompressionSettings;
  }
  v4 = *MEMORY[0x1E0D04730];
  v5 = -[NSDictionary objectForKeyedSubscript:](sessionPresetCompressionSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0D04730]);
  v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D04720]), "intValue");
  v7 = -[NSDictionary objectForKeyedSubscript:](self->_sessionPresetCompressionSettings, "objectForKeyedSubscript:", v4);
  return ($2825F4736939C4A6D3AD43837233062D)(v6 | (unint64_t)(objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D04718]), "intValue") << 32));
}

- (int)minMacroblocksForHighProfileUpTo30fps
{
  NSDictionary *sessionPresetCompressionSettings;

  sessionPresetCompressionSettings = self->_sessionPresetCompressionSettings;
  if (!sessionPresetCompressionSettings)
  {
    sessionPresetCompressionSettings = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04B68]);
    self->_sessionPresetCompressionSettings = sessionPresetCompressionSettings;
  }
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](sessionPresetCompressionSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0D04740]), "intValue");
}

- (int)minMacroblocksForHighProfileAbove30fps
{
  NSDictionary *sessionPresetCompressionSettings;

  sessionPresetCompressionSettings = self->_sessionPresetCompressionSettings;
  if (!sessionPresetCompressionSettings)
  {
    sessionPresetCompressionSettings = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04B68]);
    self->_sessionPresetCompressionSettings = sessionPresetCompressionSettings;
  }
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](sessionPresetCompressionSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0D04738]), "intValue");
}

- (BOOL)usesQuantizationScalingMatrix_H264_Steep_16_48
{
  NSDictionary *sessionPresetCompressionSettings;

  sessionPresetCompressionSettings = self->_sessionPresetCompressionSettings;
  if (!sessionPresetCompressionSettings)
  {
    sessionPresetCompressionSettings = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04B68]);
    self->_sessionPresetCompressionSettings = sessionPresetCompressionSettings;
  }
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](sessionPresetCompressionSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0D04748]), "BOOLValue");
}

- (int)hevcTurboModeVersion
{
  NSDictionary *h264EncoderLimitations;

  h264EncoderLimitations = self->_h264EncoderLimitations;
  if (!h264EncoderLimitations)
  {
    h264EncoderLimitations = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04B70]);
    self->_h264EncoderLimitations = h264EncoderLimitations;
  }
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](h264EncoderLimitations, "objectForKeyedSubscript:", *MEMORY[0x1E0D04768]), "intValue");
}

- (BOOL)hevcAllowBFramesForHighCTUCount
{
  NSDictionary *h264EncoderLimitations;

  h264EncoderLimitations = self->_h264EncoderLimitations;
  if (!h264EncoderLimitations)
  {
    h264EncoderLimitations = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04B70]);
    self->_h264EncoderLimitations = h264EncoderLimitations;
  }
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](h264EncoderLimitations, "objectForKeyedSubscript:", *MEMORY[0x1E0D04750]), "BOOLValue");
}

- (BOOL)isHEVCRelaxedAverageBitRateTargetSupported
{
  NSDictionary *h264EncoderLimitations;

  h264EncoderLimitations = self->_h264EncoderLimitations;
  if (!h264EncoderLimitations)
  {
    h264EncoderLimitations = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04B70]);
    self->_h264EncoderLimitations = h264EncoderLimitations;
  }
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](h264EncoderLimitations, "objectForKeyedSubscript:", *MEMORY[0x1E0D04760]), "BOOLValue");
}

- (BOOL)isMotionCompensatedTemporalFilteringSupported
{
  NSDictionary *h264EncoderLimitations;

  h264EncoderLimitations = self->_h264EncoderLimitations;
  if (!h264EncoderLimitations)
  {
    h264EncoderLimitations = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04B70]);
    self->_h264EncoderLimitations = h264EncoderLimitations;
  }
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](h264EncoderLimitations, "objectForKeyedSubscript:", *MEMORY[0x1E0D04758]), "BOOLValue");
}

- (id)bravoCameraSelectionBehavior
{
  id result;
  __CFString **v3;

  result = -[AVCaptureFigVideoDevice activePrimaryConstituentDeviceSwitchingBehavior](self, "activePrimaryConstituentDeviceSwitchingBehavior");
  switch((unint64_t)result)
  {
    case 0uLL:
      v3 = AVCaptureBravoCameraSelectionBehaviorUnsupported;
      goto LABEL_6;
    case 1uLL:
      v3 = AVCaptureBravoCameraSelectionBehaviorEvaluatesContinuously;
      goto LABEL_6;
    case 2uLL:
      v3 = AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange;
      goto LABEL_6;
    case 3uLL:
      v3 = AVCaptureBravoCameraSelectionBehaviorEvaluatesNever;
LABEL_6:
      result = *v3;
      break;
    default:
      return result;
  }
  return result;
}

- (void)setPrimaryConstituentDeviceSwitchingBehavior:(int64_t)a3 restrictedSwitchingBehaviorConditions:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *devicePropsQueue;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[7];
  _QWORD block[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  if (!-[AVCaptureFigVideoDevice _isBravoVariant](self, "_isBravoVariant"))
  {
    if (!a3)
      goto LABEL_12;
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    if (a4 >= 8)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99778];
      goto LABEL_8;
    }
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_7:
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    goto LABEL_8;
  }
  if (a4)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
LABEL_8:
    v9 = (void *)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v9);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
    return;
  }
LABEL_12:
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__AVCaptureFigVideoDevice_setPrimaryConstituentDeviceSwitchingBehavior_restrictedSwitchingBehaviorConditions___block_invoke;
  block[3] = &unk_1E4217F38;
  block[6] = a3;
  block[7] = a4;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(devicePropsQueue, block);
  if (*((_DWORD *)v16 + 6))
  {
    FigDebugAssert3();
  }
  else
  {
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("primaryConstituentDeviceSwitchingBehavior"));
    -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("primaryConstituentDeviceRestrictedSwitchingBehaviorConditions"));
    v12 = self->_devicePropsQueue;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __110__AVCaptureFigVideoDevice_setPrimaryConstituentDeviceSwitchingBehavior_restrictedSwitchingBehaviorConditions___block_invoke_2;
    v13[3] = &unk_1E4216628;
    v13[4] = self;
    v13[5] = a3;
    v13[6] = a4;
    dispatch_sync(v12, v13);
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("primaryConstituentDeviceRestrictedSwitchingBehaviorConditions"));
    -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("primaryConstituentDeviceSwitchingBehavior"));
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __110__AVCaptureFigVideoDevice_setPrimaryConstituentDeviceSwitchingBehavior_restrictedSwitchingBehaviorConditions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  __int128 v4;

  v4 = *(_OWORD *)(a1 + 48);
  v2 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 16);
  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:cacheOnly:", *MEMORY[0x1E0D04C08], v2, 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

_QWORD *__110__AVCaptureFigVideoDevice_setPrimaryConstituentDeviceSwitchingBehavior_restrictedSwitchingBehaviorConditions___block_invoke_2(_QWORD *result)
{
  *(_QWORD *)(result[4] + 984) = result[5];
  *(_QWORD *)(result[4] + 992) = result[6];
  return result;
}

- (int64_t)primaryConstituentDeviceSwitchingBehavior
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__AVCaptureFigVideoDevice_primaryConstituentDeviceSwitchingBehavior__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __68__AVCaptureFigVideoDevice_primaryConstituentDeviceSwitchingBehavior__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 984);
  return result;
}

- (unint64_t)primaryConstituentDeviceRestrictedSwitchingBehaviorConditions
{
  NSObject *devicePropsQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__AVCaptureFigVideoDevice_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __88__AVCaptureFigVideoDevice_primaryConstituentDeviceRestrictedSwitchingBehaviorConditions__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 992);
  return result;
}

- (int64_t)activePrimaryConstituentDeviceSwitchingBehavior
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__AVCaptureFigVideoDevice_activePrimaryConstituentDeviceSwitchingBehavior__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __74__AVCaptureFigVideoDevice_activePrimaryConstituentDeviceSwitchingBehavior__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 968);
  return result;
}

- (unint64_t)activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions
{
  NSObject *devicePropsQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__AVCaptureFigVideoDevice_activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __94__AVCaptureFigVideoDevice_activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 976);
  return result;
}

- (id)fallbackPrimaryConstituentDevices
{
  NSObject *devicePropsQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = MEMORY[0x1E0C9AA60];
  if (-[AVCaptureFigVideoDevice _isBravoVariant](self, "_isBravoVariant"))
  {
    if (!self->_supportedFallbackPrimaryConstituentDevices)
      -[AVCaptureFigVideoDevice _populateSupportedFallbackPrimaryConstituentDevices](self, "_populateSupportedFallbackPrimaryConstituentDevices");
    devicePropsQueue = self->_devicePropsQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__AVCaptureFigVideoDevice_fallbackPrimaryConstituentDevices__block_invoke;
    v6[3] = &unk_1E4217A60;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(devicePropsQueue, v6);
  }
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __60__AVCaptureFigVideoDevice_fallbackPrimaryConstituentDevices__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 1008);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

_QWORD *__117__AVCaptureFigVideoDevice__setActivePrimaryConstituentDeviceSwitchingBehavior_restrictedSwitchingBehaviorConditions___block_invoke(_QWORD *result)
{
  *(_QWORD *)(result[4] + 968) = result[5];
  *(_QWORD *)(result[4] + 976) = result[6];
  return result;
}

- (BOOL)isFocusedAtMacro
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVCaptureFigVideoDevice_isFocusedAtMacro__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVCaptureFigVideoDevice_isFocusedAtMacro__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 953);
  return result;
}

- (int64_t)minimumFocusDistance
{
  int64_t result;

  result = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04888]), "integerValue");
  if (result <= 0)
    return -1;
  return result;
}

- (BOOL)isTimeOfFlightProjectorModeSupported:(int64_t)a3
{
  id v5;

  if (!objc_msgSend(-[AVCaptureFigVideoDevice deviceType](self, "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTimeOfFlightCamera")))return a3 == 0;
  v5 = -[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048F8]);
  return objc_msgSend(v5, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
}

- (int64_t)timeOfFlightProjectorMode
{
  return self->_videoStabilizationStrength;
}

- (void)setTimeOfFlightProjectorMode:(int64_t)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD block[6];

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (-[AVCaptureFigVideoDevice isTimeOfFlightProjectorModeSupported:](self, "isTimeOfFlightProjectorModeSupported:", a3))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__AVCaptureFigVideoDevice_setTimeOfFlightProjectorMode___block_invoke;
      block[3] = &unk_1E4216650;
      block[4] = self;
      block[5] = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v8 = AVMethodExceptionReasonWithObjectAndSelector();
    v9 = v11;
    v10 = v12;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
    v8 = AVMethodExceptionReasonWithClassAndSelector();
    v9 = v6;
    v10 = v7;
  }
  v13 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v8, 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v13);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
}

uint64_t __56__AVCaptureFigVideoDevice_setTimeOfFlightProjectorMode___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 1184) = *(_QWORD *)(result + 40);
  return result;
}

- (int64_t)timeOfFlightBankCount
{
  return 4 * (-[AVCaptureFigVideoDevice timeOfFlightProjectorMode](self, "timeOfFlightProjectorMode") != 0);
}

- (int64_t)nonDestructiveCropAspectRatio
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVCaptureFigVideoDevice_nonDestructiveCropAspectRatio__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__AVCaptureFigVideoDevice_nonDestructiveCropAspectRatio__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 1144);
  return result;
}

- (int)_setFigCaptureSourcePixelBufferProperty:(__CFString *)a3 withValue:(__CVBuffer *)a4
{
  NSObject *fcsQueue;
  int v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  fcsQueue = self->_fcsQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__AVCaptureFigVideoDevice__setFigCaptureSourcePixelBufferProperty_withValue___block_invoke;
  v7[3] = &unk_1E4217F38;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(fcsQueue, v7);
  v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __77__AVCaptureFigVideoDevice__setFigCaptureSourcePixelBufferProperty_withValue___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v8;

  v2 = *(_QWORD *)(a1[4] + 56);
  v3 = a1[6];
  v4 = a1[7];
  if (v2)
    v5 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  else
    v5 = 0;
  if (*v5 >= 6uLL && (v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v5[13]) != 0)
    result = v6(v2, v3, v4);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  v8 = *(_QWORD *)(a1[5] + 8);
  if (*(_DWORD *)(v8 + 24) == -16453)
    *(_DWORD *)(v8 + 24) = 0;
  return result;
}

- (void)_restoreFigCaptureSourceProperties
{
  NSObject *fcsQueue;
  _QWORD block[5];

  if (-[AVCaptureFigVideoDevice lockForConfiguration:](self, "lockForConfiguration:", 0))
  {
    fcsQueue = self->_fcsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__AVCaptureFigVideoDevice__restoreFigCaptureSourceProperties__block_invoke;
    block[3] = &unk_1E42165A8;
    block[4] = self;
    dispatch_sync(fcsQueue, block);
    -[AVCaptureFigVideoDevice unlockForConfiguration](self, "unlockForConfiguration");
  }
}

uint64_t __61__AVCaptureFigVideoDevice__restoreFigCaptureSourceProperties__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1120);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__AVCaptureFigVideoDevice__restoreFigCaptureSourceProperties__block_invoke_2;
  v4[3] = &unk_1E4217FB0;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

uint64_t __61__AVCaptureFigVideoDevice__restoreFigCaptureSourceProperties__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  result = CMBaseObjectGetVTable();
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v7)
    return v7(v5, a2, a3);
  return result;
}

- (void)_reconnectToFigCaptureSource:(OpaqueFigCaptureSource *)a3
{
  id v5;
  const void *v6;
  NSObject *devicePropsQueue;
  _QWORD block[5];

  v5 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04E48]);
  v6 = v5;
  if (v5 == (id)*MEMORY[0x1E0C9AE50])
  {
    dispatch_semaphore_wait(&self->_propertyToFigCaptureSourcePropertyMap->super.super, 0xFFFFFFFFFFFFFFFFLL);
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v5)
LABEL_3:
    CFRelease(v6);
LABEL_4:
  -[AVCaptureFigVideoDevice _setFigCaptureSource:allowSendingWorkToMainThread:](self, "_setFigCaptureSource:allowSendingWorkToMainThread:", a3, 1);
  -[AVCaptureFigVideoDevice _restoreFigCaptureSourceProperties](self, "_restoreFigCaptureSourceProperties");
  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVCaptureFigVideoDevice__reconnectToFigCaptureSource___block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  dispatch_sync(devicePropsQueue, block);
}

uint64_t __56__AVCaptureFigVideoDevice__reconnectToFigCaptureSource___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1208) = 1;
  return result;
}

- (void)_handleCMIOExtensionPropertyChangeNotification:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  float v10;
  float v11;
  double v12;
  double v13;
  NSObject *devicePropsQueue;
  NSObject *v15;
  _QWORD v16[8];
  _QWORD block[6];
  os_log_type_t type;
  int v19;
  _QWORD v20[6];
  _QWORD v21[26];

  v21[25] = *MEMORY[0x1E0C80C00];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3052000000;
  v21[3] = __Block_byref_object_copy__5;
  v21[4] = __Block_byref_object_dispose__5;
  v21[5] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3052000000;
  v20[3] = __Block_byref_object_copy__5;
  v20[4] = __Block_byref_object_dispose__5;
  v20[5] = 0;
  if (dword_1ECFED6C0)
  {
    v19 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_devicePropsQueue);
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = *MEMORY[0x1E0D04A78];
      if (objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A78]))
      {
        v7 = *MEMORY[0x1E0D04A80];
        if (objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04A80]))
        {
          v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v6), "isEqualToString:", CFSTR("VideoZoomFactor"));
          v9 = MEMORY[0x1E0C809B0];
          if (v8)
          {
            objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v7), "floatValue");
            v11 = v10;
            -[AVCaptureFigVideoDevice videoZoomFactor](self, "videoZoomFactor");
            v12 = v11;
            if (v13 != v12)
            {
              -[AVCaptureFigVideoDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoZoomFactor"));
              devicePropsQueue = self->_devicePropsQueue;
              block[0] = v9;
              block[1] = 3221225472;
              block[2] = __74__AVCaptureFigVideoDevice__handleCMIOExtensionPropertyChangeNotification___block_invoke;
              block[3] = &unk_1E4216650;
              block[4] = self;
              *(double *)&block[5] = v12;
              dispatch_sync(devicePropsQueue, block);
              -[AVCaptureFigVideoDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoZoomFactor"));
            }
          }
          if (*(_QWORD *)&self->_gazeSelectionEnabled)
          {
            v15 = self->_devicePropsQueue;
            v16[0] = v9;
            v16[1] = 3221225472;
            v16[2] = __74__AVCaptureFigVideoDevice__handleCMIOExtensionPropertyChangeNotification___block_invoke_427;
            v16[3] = &unk_1E4218000;
            v16[6] = v21;
            v16[7] = v20;
            v16[4] = a3;
            v16[5] = self;
            dispatch_async_and_wait(v15, v16);
          }
        }
      }
    }
  }
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);
}

float __74__AVCaptureFigVideoDevice__handleCMIOExtensionPropertyChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  float result;

  if (dword_1ECFED6C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = *(double *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 864) = result;
  return result;
}

uint64_t __74__AVCaptureFigVideoDevice__handleCMIOExtensionPropertyChangeNotification___block_invoke_427(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *global_queue;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D04A78]);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D04A80]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1344);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __74__AVCaptureFigVideoDevice__handleCMIOExtensionPropertyChangeNotification___block_invoke_2;
        block[3] = &unk_1E4217FD8;
        block[4] = v8;
        v11 = *(_OWORD *)(a1 + 48);
        dispatch_async_and_wait(global_queue, block);
        ++v7;
      }
      while (v4 != v7);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __74__AVCaptureFigVideoDevice__handleCMIOExtensionPropertyChangeNotification___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 793) != *(unsigned __int8 *)(result + 48);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 336);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_9(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(float *)(result + 48) != *(float *)(*(_QWORD *)(result + 32) + 456);
  return result;
}

float __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_10(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 456) = result;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_11(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(float *)(*(_QWORD *)(result + 32) + 460) != *(float *)(result + 48);
  return result;
}

float __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_12(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 460) = result;
  return result;
}

_QWORD *__55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_13(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (!*(_QWORD *)(v1 + 424))
  {
    *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = 0;
    v1 = result[4];
  }
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = *(float *)(v1 + 464) != *(float *)(*(_QWORD *)(result[5] + 8)
                                                                                     + 24);
  return result;
}

float __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_14(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *(float *)(*(_QWORD *)(a1 + 32) + 464) = result;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_15(uint64_t result)
{
  BOOL v2;

  v2 = *(_QWORD *)(result + 48) != *(_QWORD *)(*(_QWORD *)(result + 32) + 552)
    || *(_DWORD *)(result + 56) != (unint64_t)*(unsigned int *)(*(_QWORD *)(result + 32) + 560);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_16(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32) + 552;
  v2 = *(_DWORD *)(result + 48);
  *(_QWORD *)v1 = *(_QWORD *)(result + 40);
  *(_DWORD *)(v1 + 8) = v2;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_17(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = result + 40;
  v2 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(result + 40) == *(_QWORD *)(v2 + 564)
    && *(_DWORD *)(result + 48) == (unint64_t)*(unsigned int *)(v2 + 572))
  {
    v6 = result;
    result = FigDebugAssert3();
    v2 = *(_QWORD *)(v6 + 32);
  }
  v4 = v2 + 564;
  v5 = *(_QWORD *)v1;
  *(_DWORD *)(v4 + 8) = *(_DWORD *)(v1 + 8);
  *(_QWORD *)v4 = v5;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_18(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(result + 48) != *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 640);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_19(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 640) = *(_BYTE *)(result + 40);
  return result;
}

void __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_20(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 648);
  v3 = (const void *)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D04A98]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 648) = v3;
  if (v3)
    CFRetain(v3);
  if (v2)
    CFRelease(v2);
}

id __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_21(_QWORD *a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 746);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 736) == 1;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_BYTE *)(a1[4] + 747);
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = *(_BYTE *)(a1[4] + 847);
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = *(_BYTE *)(a1[4] + 848);
  result = *(id *)(a1[4] + 760);
  *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40) = result;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_22(uint64_t result)
{
  uint64_t v1;
  int v2;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 868);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 872);
  if (*(float *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) == 0.0)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 40), "floatValue");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = v2;
    result = objc_msgSend(*(id *)(v1 + 48), "intValue");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_23(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(a1 + 40), "floatValue");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 864) = v3;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 868) = 0;
  return result;
}

float __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_24(uint64_t a1)
{
  float result;

  objc_msgSend(*(id *)(a1 + 40), "floatValue");
  *(float *)(*(_QWORD *)(a1 + 32) + 864) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    result = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(float *)(*(_QWORD *)(a1 + 32) + 868) = result;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 872) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }
  return result;
}

__n128 __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_25(uint64_t a1)
{
  uint64_t v1;
  __n128 result;

  v1 = *(_QWORD *)(a1 + 32) + 808;
  result = *(__n128 *)(a1 + 56);
  *(_OWORD *)v1 = *(_OWORD *)(a1 + 40);
  *(__n128 *)(v1 + 16) = result;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 840) = *(_DWORD *)(a1 + 72);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_26(uint64_t a1)
{
  AVCaptureSystemPressureState *v2;
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1136) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "figLevel");
  v2 = -[AVCaptureSystemPressureState initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:]([AVCaptureSystemPressureState alloc], "initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1136), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "factors"), objc_msgSend(*(id *)(a1 + 32), "_recommendedFrameRateRangeForVideoFormat:depthFormat:figSystemPressureLevel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1136)));
  result = -[AVCaptureSystemPressureState isEqual:](v2, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128));
  if ((result & 1) == 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v2;
  return result;
}

id __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_27(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128) = result;
  return result;
}

id __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_28(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 960) = result;
  return result;
}

id __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_29(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016) = result;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_30(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(result + 48) != *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 953);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_31(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 953) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_32(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1128));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result ^ 1;
  return result;
}

id __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_33(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128) = result;
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_34(uint64_t a1)
{
  _BOOL4 v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0D04E10]))
  {
    v2 = 0;
    v3 = 1;
  }
  else
  {
    v4 = CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0D04BF8]);
    v2 = v4 == 0;
    v3 = 2 * (v4 != 0);
  }
  result = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(result + 1208))
  {
    result = objc_msgSend((id)result, "_initDegradedCaptureQualityFactors");
    if (v2)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1200);
      goto LABEL_17;
    }
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 64))
      v8 = *(_QWORD *)(v7 + 1200) & ~v3;
    else
      v8 = *(_QWORD *)(v7 + 1200) | v3;
    *(_QWORD *)(v7 + 1200) = v8;
    v6 = a1 + 40;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1200);
  }
  else
  {
    v6 = a1 + 40;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(result + 1200);
    if (v2)
      goto LABEL_17;
  }
  v9 = *(_QWORD *)(*(_QWORD *)v6 + 8);
  if (*(_BYTE *)(a1 + 64))
    v10 = *(_QWORD *)(v9 + 24) | v3;
  else
    v10 = *(_QWORD *)(v9 + 24) & ~v3;
  *(_QWORD *)(v9 + 24) = v10;
LABEL_17:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1200);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_35(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 1200) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_36(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 795) != *(unsigned __int8 *)(result + 48);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_37(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 795) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_38(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 796) != *(unsigned __int8 *)(result + 48);
  return result;
}

uint64_t __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_39(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 796) = *(_BYTE *)(result + 40);
  return result;
}

BOOL __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_40(uint64_t a1)
{
  _BOOL8 result;

  result = CGRectEqualToRect(*(CGRect *)(a1 + 48), *(CGRect *)(*(_QWORD *)(a1 + 32) + 1216));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = !result;
  return result;
}

__n128 __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_41(uint64_t a1)
{
  uint64_t v1;
  __n128 result;

  v1 = *(_QWORD *)(a1 + 32) + 1216;
  result = *(__n128 *)(a1 + 56);
  *(_OWORD *)v1 = *(_OWORD *)(a1 + 40);
  *(__n128 *)(v1 + 16) = result;
  return result;
}

float __55__AVCaptureFigVideoDevice__handleNotification_payload___block_invoke_42(uint64_t a1)
{
  float result;

  result = *(double *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 864) = result;
  return result;
}

uint64_t __85__AVCaptureFigVideoDevice__handleManualControlCompletionForRequestQueue_withPayload___block_invoke(uint64_t a1)
{
  uint64_t result;
  float v3;
  int v4;

  result = objc_msgSend(*(id *)(a1 + 32), "fakeBias");
  if (v3 != 3.4028e38)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "fakeBias");
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 460) = v4;
  }
  return result;
}

- (void)_drainManualControlRequestQueues
{
  -[AVCaptureFigVideoDevice _drainManualControlRequestQueue:](self, "_drainManualControlRequestQueue:", *(_QWORD *)&self->_providesStortorgetMetadata);
  -[AVCaptureFigVideoDevice _drainManualControlRequestQueue:](self, "_drainManualControlRequestQueue:", self->_manualFocusControlRequests);
  -[AVCaptureFigVideoDevice _drainManualControlRequestQueue:](self, "_drainManualControlRequestQueue:", self->_manualExposureControlRequests);
  -[AVCaptureFigVideoDevice _drainManualControlRequestQueue:](self, "_drainManualControlRequestQueue:", self->_biasedExposureControlRequests);
}

- (void)_drainManualControlRequestQueue:(id)a3
{
  uint64_t v4;
  void *v5;
  __int128 *v6;
  uint64_t v7;
  void (*v8)(uint64_t, __int128 *);
  __int128 v9;
  uint64_t v10;

  v4 = objc_msgSend(a3, "dequeue");
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (__int128 *)MEMORY[0x1E0CA2E18];
    do
    {
      if (objc_msgSend(v5, "completionBlock"))
      {
        v7 = objc_msgSend(v5, "completionBlock");
        v8 = *(void (**)(uint64_t, __int128 *))(v7 + 16);
        v9 = *v6;
        v10 = *((_QWORD *)v6 + 2);
        v8(v7, &v9);
      }
      v5 = (void *)objc_msgSend(a3, "dequeue");
    }
    while (v5);
  }
}

- (void)_performBlockOnMainThread:(id)a3
{
  __CFRunLoop *Main;
  __CFRunLoop *v5;

  if (a3)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E0C9B270], a3);
    v5 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v5);
  }
}

- (void)_checkTCCAccess
{
  NSObject *fcsQueue;
  _QWORD block[5];

  if (!-[AVCaptureFigVideoDevice isProxyDevice](self, "isProxyDevice"))
  {
    fcsQueue = self->_fcsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__AVCaptureFigVideoDevice__checkTCCAccess__block_invoke;
    block[3] = &unk_1E42165A8;
    block[4] = self;
    dispatch_sync(fcsQueue, block);
  }
}

uint64_t __42__AVCaptureFigVideoDevice__checkTCCAccess__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 56);
  if (v1)
  {
    result = CMBaseObjectGetVTable();
    v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(result + 16) + 24);
    if (v2)
      return v2(v1);
  }
  return result;
}

- (BOOL)isCinematicVideoFocusAtPointSupported
{
  return AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureDeviceSupportsCinematicVideoFocusAtPoint"));
}

- (void)setCinematicVideoFocusAtPoint:(CGPoint)a3 objectID:(int64_t)a4 isHardFocus:(BOOL)a5 isFixedPlaneFocus:(BOOL)a6
{
  CGFloat y;
  CGFloat x;
  NSObject *devicePropsQueue;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD block[9];
  BOOL v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  y = a3.y;
  x = a3.x;
  if (-[AVCaptureFigVideoDevice isCinematicVideoFocusAtPointSupported](self, "isCinematicVideoFocusAtPointSupported"))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    devicePropsQueue = self->_devicePropsQueue;
    v24 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__AVCaptureFigVideoDevice_setCinematicVideoFocusAtPoint_objectID_isHardFocus_isFixedPlaneFocus___block_invoke;
    block[3] = &unk_1E42181E0;
    *(CGFloat *)&block[6] = x;
    *(CGFloat *)&block[7] = y;
    block[8] = a4;
    v19 = a5;
    v20 = a6;
    block[4] = self;
    block[5] = &v21;
    dispatch_sync(devicePropsQueue, block);
    if (*((_DWORD *)v22 + 6) == -16452)
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      objc_opt_class();
      v14 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithClassAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v14);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    v17 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v17);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v17);
  }
}

uint64_t __96__AVCaptureFigVideoDevice_setCinematicVideoFocusAtPoint_objectID_isHardFocus_isFixedPlaneFocus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v4[0] = *MEMORY[0x1E0D049B0];
  v5[0] = CGPointCreateDictionaryRepresentation(*(CGPoint *)(a1 + 48));
  v4[1] = *MEMORY[0x1E0D049A8];
  v5[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v4[2] = *MEMORY[0x1E0D049A0];
  v5[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
  v4[3] = *MEMORY[0x1E0D04998];
  v5[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 73));
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04C38], v2);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isContinuityCamera
{
  return self->_specialDeviceType == 2;
}

- (id)continuityDeviceUniqueID
{
  return self->_cmioActiveExtensionPropertyListenerHandlers;
}

- (id)companionDeskViewCamera
{
  return 0;
}

- (id)hardwareUniformType
{
  return (id)-[NSUUID copy](self->_continuityDeviceUniqueID, "copy");
}

- (void)setDeskViewCameraMode:(int64_t)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[6];

  if (-[AVCaptureFigVideoDevice isDeskViewCameraModeSupported:](self, "isDeskViewCameraModeSupported:"))
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__AVCaptureFigVideoDevice_setDeskViewCameraMode___block_invoke;
    block[3] = &unk_1E4216650;
    block[4] = self;
    block[5] = a3;
    dispatch_sync(devicePropsQueue, block);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

uint64_t __49__AVCaptureFigVideoDevice_setDeskViewCameraMode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04D38], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40)));
  if (!(_DWORD)result)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1288) = *(_QWORD *)(a1 + 40);
  return result;
}

- (int64_t)deskViewCameraMode
{
  NSObject *devicePropsQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVCaptureFigVideoDevice_deskViewCameraMode__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__AVCaptureFigVideoDevice_deskViewCameraMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 1288);
  return result;
}

- (BOOL)isDeskViewCameraModeSupported:(int64_t)a3
{
  if ((objc_msgSend(-[AVCaptureFigVideoDevice deviceType](self, "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeDeskViewCamera")) & 1) != 0|| objc_msgSend(-[AVCaptureFigVideoDevice deviceType](self, "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera"))&& -[AVCaptureFigVideoDevice position](self, "position") == 1)
  {
    return a3 != 0;
  }
  else
  {
    return a3 == 0;
  }
}

- (void)setCenterStageFieldOfViewRestrictedToWide:(BOOL)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  BOOL v10;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (+[AVCaptureDevice isCenterStageEnabled](AVCaptureDevice, "isCenterStageEnabled"))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__AVCaptureFigVideoDevice_setCenterStageFieldOfViewRestrictedToWide___block_invoke;
      block[3] = &unk_1E4217A10;
      block[4] = self;
      v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

uint64_t __69__AVCaptureFigVideoDevice_setCenterStageFieldOfViewRestrictedToWide___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1297) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04C18], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
}

- (BOOL)isCenterStageFieldOfViewRestrictedToWide
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__AVCaptureFigVideoDevice_isCenterStageFieldOfViewRestrictedToWide__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__AVCaptureFigVideoDevice_isCenterStageFieldOfViewRestrictedToWide__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1297);
  return result;
}

- (void)setManualFramingPanningAngleX:(float)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  float v10;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (BYTE2(self->_deskViewCameraMode))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__AVCaptureFigVideoDevice_setManualFramingPanningAngleX___block_invoke;
      block[3] = &unk_1E4217D58;
      block[4] = self;
      v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

float __57__AVCaptureFigVideoDevice_setManualFramingPanningAngleX___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 1300) = result;
  return result;
}

- (float)manualFramingPanningAngleX
{
  NSObject *devicePropsQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__AVCaptureFigVideoDevice_manualFramingPanningAngleX__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __53__AVCaptureFigVideoDevice_manualFramingPanningAngleX__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 1300);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setManualFramingPanningAngleY:(float)a3
{
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  float v10;

  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (BYTE2(self->_deskViewCameraMode))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__AVCaptureFigVideoDevice_setManualFramingPanningAngleY___block_invoke;
      block[3] = &unk_1E4217D58;
      block[4] = self;
      v10 = a3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

float __57__AVCaptureFigVideoDevice_setManualFramingPanningAngleY___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 1304) = result;
  return result;
}

- (float)manualFramingPanningAngleY
{
  NSObject *devicePropsQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__AVCaptureFigVideoDevice_manualFramingPanningAngleY__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __53__AVCaptureFigVideoDevice_manualFramingPanningAngleY__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 1304);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)startPanningAtPoint:(CGPoint)a3
{
  NSObject *devicePropsQueue;
  _QWORD block[5];
  CGPoint v5;

  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVCaptureFigVideoDevice_startPanningAtPoint___block_invoke;
  block[3] = &unk_1E4216628;
  v5 = a3;
  block[4] = self;
  dispatch_sync(devicePropsQueue, block);
}

uint64_t __47__AVCaptureFigVideoDevice_startPanningAtPoint___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04D88], CGPointCreateDictionaryRepresentation(*(CGPoint *)(a1 + 40)));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1296) = 1;
  return result;
}

- (void)panWithTranslation:(CGPoint)a3
{
  NSObject *devicePropsQueue;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD block[5];
  CGPoint v8;

  if (LOBYTE(self->_deskViewCameraMode))
  {
    devicePropsQueue = self->_devicePropsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__AVCaptureFigVideoDevice_panWithTranslation___block_invoke;
    block[3] = &unk_1E4216628;
    v8 = a3;
    block[4] = self;
    dispatch_sync(devicePropsQueue, block);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99768];
    objc_opt_class();
    v6 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithClassAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

uint64_t __46__AVCaptureFigVideoDevice_panWithTranslation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04D40], CGPointCreateDictionaryRepresentation(*(CGPoint *)(a1 + 40)));
}

- (void)performOneShotFraming
{
  NSObject *devicePropsQueue;
  _QWORD block[5];

  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVCaptureFigVideoDevice_performOneShotFraming__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  dispatch_sync(devicePropsQueue, block);
}

uint64_t __48__AVCaptureFigVideoDevice_performOneShotFraming__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04D48], MEMORY[0x1E0C9AAB0]);
}

- (void)resetFraming
{
  NSObject *devicePropsQueue;
  _QWORD block[5];

  devicePropsQueue = self->_devicePropsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AVCaptureFigVideoDevice_resetFraming__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  dispatch_sync(devicePropsQueue, block);
}

uint64_t __39__AVCaptureFigVideoDevice_resetFraming__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureSourceProperty:withValue:", *MEMORY[0x1E0D04D68], MEMORY[0x1E0C9AAB0]);
}

- (BOOL)isDockedTrackingSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_fcsAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047F8]), "BOOLValue");
}

- (void)setDockedTrackingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *devicePropsQueue;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  BOOL v10;

  v3 = a3;
  if (-[AVCaptureFigVideoDevice isLockedForConfiguration](self, "isLockedForConfiguration"))
  {
    if (!v3 || -[AVCaptureFigVideoDevice isDockedTrackingSupported](self, "isDockedTrackingSupported"))
    {
      devicePropsQueue = self->_devicePropsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__AVCaptureFigVideoDevice_setDockedTrackingEnabled___block_invoke;
      block[3] = &unk_1E4217A10;
      block[4] = self;
      v10 = v3;
      dispatch_sync(devicePropsQueue, block);
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_opt_class();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    objc_opt_class();
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

uint64_t __52__AVCaptureFigVideoDevice_setDockedTrackingEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1368) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isSceneClassificationActive
{
  NSObject *devicePropsQueue;
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
  devicePropsQueue = self->_devicePropsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureFigVideoDevice_isSceneClassificationActive__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(devicePropsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVCaptureFigVideoDevice_isSceneClassificationActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 640);
  return result;
}

- (float)documentSceneConfidence
{
  NSObject *devicePropsQueue;
  id v4;
  void *v5;
  float v6;
  float v7;
  const void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = 0;
  if (-[AVCaptureFigVideoDevice _hasKeyValueObserversForHighFrequencyProperty:](self, "_hasKeyValueObserversForHighFrequencyProperty:", CFSTR("documentSceneConfidence")))
  {
    devicePropsQueue = self->_devicePropsQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__AVCaptureFigVideoDevice_documentSceneConfidence__block_invoke;
    v10[3] = &unk_1E4217A60;
    v10[4] = self;
    v10[5] = &v11;
    dispatch_sync(devicePropsQueue, v10);
  }
  v4 = (id)v12[5];
  if (!v4)
  {
    v4 = -[AVCaptureFigVideoDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04D78]);
    v12[5] = (uint64_t)v4;
  }
  v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05118]);
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v7 = v6;
  }
  else
  {
    v7 = -1.0;
  }
  v8 = (const void *)v12[5];
  if (v8)
    CFRelease(v8);
  _Block_object_dispose(&v11, 8);
  return v7;
}

CFTypeRef __50__AVCaptureFigVideoDevice_documentSceneConfidence__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 648);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end
