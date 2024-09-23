@implementation AVCaptureStillImageOutput

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureStillImageOutput)init
{
  AVCaptureStillImageOutput *v2;
  AVCaptureStillImageOutputInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureStillImageOutput;
  v2 = -[AVCaptureOutput initSubclass](&v5, sel_initSubclass);
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureStillImageOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v2);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureStillImageOutput;
  -[AVCaptureOutput dealloc](&v3, sel_dealloc);
}

- (void)updateSISSupportedForSourceDevice:(id)a3
{
  int v5;
  AVCaptureStillImageOutputInternal *internal;
  BOOL v7;
  int SISEnabled;
  int v9;
  BOOL v10;

  v5 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isSISSupported");
  internal = self->_internal;
  if (internal->SISSupported == v5)
    return;
  v7 = v5;
  if (!internal->SISSupported)
  {
    SISEnabled = 0;
    if (v5)
      goto LABEL_4;
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  SISEnabled = internal->SISEnabled;
  if (!v5)
    goto LABEL_6;
LABEL_4:
  v9 = internal->SISEnabled;
LABEL_7:
  v10 = (__CFString *)objc_msgSend(a3, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInDualCamera") && v7;
  -[AVCaptureStillImageOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stillImageStabilizationSupported"));
  if (SISEnabled == v9)
  {
    self->_internal->SISSupported = v7;
    self->_internal->bravoImageFusionSupported = v10;
  }
  else
  {
    -[AVCaptureStillImageOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("automaticallyEnablesStillImageStabilizationWhenAvailable"));
    self->_internal->SISSupported = v7;
    self->_internal->bravoImageFusionSupported = v10;
    -[AVCaptureStillImageOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("automaticallyEnablesStillImageStabilizationWhenAvailable"));
  }
  -[AVCaptureStillImageOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stillImageStabilizationSupported"));
}

- (void)clearPreparedBracketIfNeeded
{
  AVCaptureStillImageOutputInternal *internal;
  AVCaptureStillImageOutputInternal *v4;
  CMVideoDimensions Dimensions;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = self->_internal;
  if (v4->preparedBracket.imageCount)
  {
    if (v4->imageDataFormatType != v4->preparedBracket.outputFormat
      || (Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "activeFormat"), "formatDescription")), v4 = self->_internal, *(_QWORD *)&v4->preparedBracket.outputWidth != Dimensions))
    {
      *(_QWORD *)&v4->preparedBracket.outputWidth = 0;
      *(_QWORD *)&v4->preparedBracket.imageCount = 0;
    }
  }
  objc_sync_exit(internal);
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCaptureStillImageOutput;
  v5 = -[AVCaptureOutput addConnection:error:](&v8, sel_addConnection_error_, a3, a4);
  v6 = (void *)objc_msgSend(v5, "sourceDevice");
  -[AVCaptureStillImageOutput updateSISSupportedForSourceDevice:](self, "updateSISSupportedForSourceDevice:", v6);
  -[AVCaptureStillImageOutput _setStillImageStabilizationAutomaticallyEnabled:](self, "_setStillImageStabilizationAutomaticallyEnabled:", -[AVCaptureStillImageOutput automaticallyEnablesStillImageStabilizationWhenAvailable](self, "automaticallyEnablesStillImageStabilizationWhenAvailable"));
  -[AVCaptureStillImageOutput _updateMaxBracketedStillImageCaptureCountForSourceFormat:](self, "_updateMaxBracketedStillImageCaptureCountForSourceFormat:", objc_msgSend(v6, "activeFormat"));
  -[AVCaptureStillImageOutput _updateLensStabilizationDuringBracketedCaptureSupportedForDevice:](self, "_updateLensStabilizationDuringBracketedCaptureSupportedForDevice:", v6);
  return v5;
}

- (void)removeConnection:(id)a3
{
  objc_super v5;

  -[AVCaptureStillImageOutput _setStillImageStabilizationAutomaticallyEnabled:](self, "_setStillImageStabilizationAutomaticallyEnabled:", 0);
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureStillImageOutput;
  -[AVCaptureOutput removeConnection:](&v5, sel_removeConnection_, a3);
  -[AVCaptureStillImageOutput updateSISSupportedForSourceDevice:](self, "updateSISSupportedForSourceDevice:", 0);
  -[AVCaptureStillImageOutput _updateMaxBracketedStillImageCaptureCountForSourceFormat:](self, "_updateMaxBracketedStillImageCaptureCountForSourceFormat:", 0);
  -[AVCaptureStillImageOutput _updateLensStabilizationDuringBracketedCaptureSupportedForDevice:](self, "_updateLensStabilizationDuringBracketedCaptureSupportedForDevice:", 0);
}

- (NSDictionary)outputSettings
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_internal->outputSettings);
}

- (void)setOutputSettings:(NSDictionary *)outputSettings
{
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  float v9;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  self->_internal->outputSettings = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", outputSettings);
  v5 = -[NSDictionary objectForKeyedSubscript:](outputSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
  v6 = -[NSDictionary objectForKeyedSubscript:](outputSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]);
  v7 = -[NSDictionary objectForKeyedSubscript:](outputSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2CE0]);
  if (!v5)
  {
    if (!v6)
    {
LABEL_8:
      self->_internal->jpegQualitySpecified = 0;
      if (!v7)
      {
LABEL_24:
        -[AVCaptureStillImageOutput clearPreparedBracketIfNeeded](self, "clearPreparedBracketIfNeeded");
        return;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->_internal->imageDataFormatType == 1785750887)
        {
          objc_msgSend(v7, "floatValue");
          if (v9 >= 0.0 && v9 <= 1.0)
          {
            self->_internal->jpegQualitySpecified = 1;
            self->_internal->jpegQuality = v9;
            goto LABEL_24;
          }
          v11 = (void *)MEMORY[0x1E0C99DA0];
          v12 = *MEMORY[0x1E0C99778];
        }
        else
        {
          v11 = (void *)MEMORY[0x1E0C99DA0];
          v12 = *MEMORY[0x1E0C99778];
        }
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0C99DA0];
        v12 = *MEMORY[0x1E0C99778];
      }
      goto LABEL_21;
    }
    if (!-[NSArray containsObject:](-[AVCaptureStillImageOutput availableImageDataCodecTypes](self, "availableImageDataCodecTypes"), "containsObject:", v6))
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      v19 = (uint64_t)v6;
LABEL_21:
      v15 = AVMethodExceptionReasonWithObjectAndSelector();
      v16 = v11;
      v17 = v12;
      goto LABEL_22;
    }
    v8 = AVOSTypeForString();
LABEL_7:
    self->_internal->imageDataFormatType = v8;
    goto LABEL_8;
  }
  if (-[NSArray containsObject:](-[AVCaptureStillImageOutput availableImageDataCVPixelFormatTypes](self, "availableImageDataCVPixelFormatTypes"), "containsObject:", v5))
  {
    v8 = objc_msgSend(v5, "intValue");
    goto LABEL_7;
  }
  v13 = (void *)MEMORY[0x1E0C99DA0];
  v14 = *MEMORY[0x1E0C99778];
  objc_msgSend(v5, "intValue");
  v19 = AVStringForOSType();
  v20 = objc_msgSend(v5, "intValue");
  v15 = AVMethodExceptionReasonWithObjectAndSelector();
  v16 = v13;
  v17 = v14;
LABEL_22:
  v18 = (void *)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v15, 0, v19, v20);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v18);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v18);
}

- (NSArray)availableImageDataCVPixelFormatTypes
{
  return (NSArray *)&unk_1E424D888;
}

- (NSArray)availableImageDataCodecTypes
{
  NSArray *result;
  id v3;

  result = (NSArray *)availableImageDataCodecTypes_availableTypes;
  if (!availableImageDataCodecTypes_availableTypes)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D20]);
    result = (NSArray *)objc_msgSend(v3, "initWithObjects:", *MEMORY[0x1E0CF2C90], 0);
    availableImageDataCodecTypes_availableTypes = (uint64_t)result;
  }
  return result;
}

- (id)connectionMediaTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CF2B90];
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL result;

  v7 = (void *)objc_msgSend(a3, "mediaType");
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B90]))
  {
    v8 = 1;
    goto LABEL_5;
  }
  if (-[NSArray count](-[AVCaptureOutput connections](self, "connections"), "count"))
  {
    v8 = 2;
LABEL_5:
    v9 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
    result = 0;
    *a4 = v9;
    return result;
  }
  return 1;
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  objc_super v7;

  -[AVCaptureStillImageOutput updateSISSupportedForSourceDevice:](self, "updateSISSupportedForSourceDevice:", a4);
  -[AVCaptureStillImageOutput _setStillImageStabilizationAutomaticallyEnabled:](self, "_setStillImageStabilizationAutomaticallyEnabled:", -[AVCaptureStillImageOutput automaticallyEnablesStillImageStabilizationWhenAvailable](self, "automaticallyEnablesStillImageStabilizationWhenAvailable"));
  -[AVCaptureStillImageOutput _updateMaxBracketedStillImageCaptureCountForSourceFormat:](self, "_updateMaxBracketedStillImageCaptureCountForSourceFormat:", a3);
  -[AVCaptureStillImageOutput _updateLensStabilizationDuringBracketedCaptureSupportedForDevice:](self, "_updateLensStabilizationDuringBracketedCaptureSupportedForDevice:", a4);
  -[AVCaptureStillImageOutput clearPreparedBracketIfNeeded](self, "clearPreparedBracketIfNeeded");
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureStillImageOutput;
  -[AVCaptureOutput handleChangedActiveFormat:forDevice:](&v7, sel_handleChangedActiveFormat_forDevice_, a3, a4);
}

- (void)handleCenterStageActiveChangedForDevice:(id)a3
{
  -[AVCaptureStillImageOutput _updateMaxBracketedStillImageCaptureCountForSourceFormat:](self, "_updateMaxBracketedStillImageCaptureCountForSourceFormat:", objc_msgSend(a3, "activeFormat"));
}

- (void)handleBackgroundBlurActiveChangedForDevice:(id)a3
{
  -[AVCaptureStillImageOutput _updateMaxBracketedStillImageCaptureCountForSourceFormat:](self, "_updateMaxBracketedStillImageCaptureCountForSourceFormat:", objc_msgSend(a3, "activeFormat"));
}

- (void)handleStudioLightingActiveChangedForDevice:(id)a3
{
  -[AVCaptureStillImageOutput _updateMaxBracketedStillImageCaptureCountForSourceFormat:](self, "_updateMaxBracketedStillImageCaptureCountForSourceFormat:", objc_msgSend(a3, "activeFormat"));
}

- (void)handleBackgroundReplacementActiveChangedForDevice:(id)a3
{
  -[AVCaptureStillImageOutput _updateMaxBracketedStillImageCaptureCountForSourceFormat:](self, "_updateMaxBracketedStillImageCaptureCountForSourceFormat:", objc_msgSend(a3, "activeFormat"));
}

- (BOOL)squareCropEnabled
{
  return self->_internal->squareCropEnabled;
}

- (void)setSquareCropEnabled:(BOOL)a3
{
  self->_internal->squareCropEnabled = a3;
}

- (CGSize)previewImageSize
{
  AVCaptureStillImageOutputInternal *internal;
  double width;
  double height;
  CGSize result;

  internal = self->_internal;
  width = internal->previewImageSize.width;
  height = internal->previewImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviewImageSize:(CGSize)a3
{
  self->_internal->previewImageSize = a3;
}

- (unsigned)imageDataFormatType
{
  return self->_internal->imageDataFormatType;
}

- (BOOL)isStillImageStabilizationSupported
{
  return self->_internal->SISSupported;
}

- (BOOL)isStillImageStabilizationActive
{
  return self->_internal->SISActive;
}

- (BOOL)automaticallyEnablesStillImageStabilizationWhenAvailable
{
  AVCaptureStillImageOutputInternal *internal;

  internal = self->_internal;
  return internal->SISSupported && internal->SISEnabled;
}

- (void)setAutomaticallyEnablesStillImageStabilizationWhenAvailable:(BOOL)automaticallyEnablesStillImageStabilizationWhenAvailable
{
  void *v5;

  if (-[AVCaptureStillImageOutput isStillImageStabilizationSupported](self, "isStillImageStabilizationSupported"))
  {
    self->_internal->SISEnabled = automaticallyEnablesStillImageStabilizationWhenAvailable;
    -[AVCaptureStillImageOutput _setStillImageStabilizationAutomaticallyEnabled:](self, "_setStillImageStabilizationAutomaticallyEnabled:", -[AVCaptureStillImageOutput automaticallyEnablesStillImageStabilizationWhenAvailable](self, "automaticallyEnablesStillImageStabilizationWhenAvailable"));
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (BOOL)isHighResolutionStillImageOutputEnabled
{
  return self->_internal->highResStillEnabled;
}

- (void)setHighResolutionStillImageOutputEnabled:(BOOL)highResolutionStillImageOutputEnabled
{
  AVCaptureStillImageOutputInternal *internal;
  AVCaptureConnection *v5;
  AVCaptureConnection *v6;

  internal = self->_internal;
  if (internal->highResStillEnabled != highResolutionStillImageOutputEnabled)
  {
    internal->highResStillEnabled = highResolutionStillImageOutputEnabled;
    v5 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]);
    if (v5)
    {
      v6 = v5;
      -[AVCaptureStillImageOutput _updateMaxBracketedStillImageCaptureCountForSourceFormat:](self, "_updateMaxBracketedStillImageCaptureCountForSourceFormat:", objc_msgSend(-[AVCaptureConnection sourceDevice](v5, "sourceDevice"), "activeFormat"));
      -[AVCaptureOutput updateMetadataTransformForSourceFormat:](self, "updateMetadataTransformForSourceFormat:", objc_msgSend(-[AVCaptureConnection sourceDevice](v6, "sourceDevice"), "activeFormat"));
      if (-[AVCaptureStillImageOutput highResolutionStillImageOutputEnabledChangeCausesCaptureSessionRestart](self, "highResolutionStillImageOutputEnabledChangeCausesCaptureSessionRestart"))
      {
        -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
      }
    }
  }
}

- (BOOL)highResolutionStillImageOutputEnabledChangeCausesCaptureSessionRestart
{
  AVCaptureConnection *v2;

  v2 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]);
  if (v2)
    LOBYTE(v2) = objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](v2, "sourceDevice"), "activeFormat"), "supportsQuadraHighResolutionStillImageOutput");
  return (char)v2;
}

- (BOOL)isNoiseReductionEnabled
{
  return self->_internal->noiseReductionEnabled;
}

- (void)setNoiseReductionEnabled:(BOOL)a3
{
  self->_internal->noiseReductionEnabled = a3;
}

- (unsigned)shutterSound
{
  return self->_internal->shutterSoundID;
}

- (void)setShutterSound:(unsigned int)a3
{
  void *v5;

  if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementShutterSoundManipulation) & 1) != 0)
  {
    self->_internal->shutterSoundID = a3;
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (BOOL)isCapturingStillImage
{
  return self->_internal->isCapturingPhoto;
}

- (id)firstActiveConnection
{
  return (id)objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "firstObject");
}

- (id)_figCaptureStillImageSettingsForConnection:(id)a3
{
  unint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  CMVideoDimensions Dimensions;
  int v13;
  uint64_t v14;
  _BOOL8 v15;
  AVCaptureStillImageOutputInternal *internal;
  AVCaptureStillImageOutputInternal *v17;
  double height;
  double width;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v28;
  float v29;
  uint64_t v30;
  double v31;
  double v32;
  float v33;
  double v34;
  uint64_t v35;
  id v36;
  int v37;
  int v38;
  int v39;
  int v40;
  double v41;
  uint64_t v42;
  AVCaptureStillImageOutputInternal *v43;
  uint64_t v45;
  _QWORD v46[2];
  CGRect v47;
  CGRect v48;

  v46[1] = *MEMORY[0x1E0C80C00];
  do
    v5 = __ldxr((unint64_t *)&_figCaptureStillImageSettingsForConnection__gSettingsID);
  while (__stxr(v5 + 1, (unint64_t *)&_figCaptureStillImageSettingsForConnection__gSettingsID));
  v6 = objc_alloc(MEMORY[0x1E0D03C28]);
  v7 = (id)objc_msgSend(v6, "initWithSettingsID:", _figCaptureStillImageSettingsForConnection__gSettingsID);
  v8 = (void *)objc_msgSend(a3, "sourceDevice");
  v9 = (void *)objc_msgSend(v8, "activeFormat");
  v10 = v9;
  if (self->_internal->highResStillEnabled && (objc_msgSend(v9, "supportsHighResolutionStillImageOutput") & 1) != 0)
  {
    v11 = 0;
    Dimensions = 0;
    v13 = 1;
  }
  else
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v10, "formatDescription"));
    v13 = 0;
    v11 = HIDWORD(*(unint64_t *)&Dimensions);
  }
  objc_msgSend(v7, "setOutputFormat:", self->_internal->imageDataFormatType);
  if (objc_msgSend(v7, "outputFormat") == 1785750887)
    v14 = 1785096550;
  else
    v14 = 0;
  objc_msgSend(v7, "setOutputFileType:", v14);
  objc_msgSend(v7, "setSquareCropEnabled:", self->_internal->squareCropEnabled);
  objc_msgSend(v7, "setOutputWidth:", Dimensions);
  objc_msgSend(v7, "setOutputHeight:", v11);
  objc_msgSend(v7, "setOutputMirroring:", objc_msgSend(a3, "isVideoMirrored"));
  objc_msgSend(v7, "setOutputOrientation:", objc_msgSend(a3, "videoOrientation"));
  v15 = 0;
  internal = self->_internal;
  if (internal->previewImageSize.width > 0.0)
    v15 = internal->previewImageSize.height > 0.0;
  objc_msgSend(v7, "setPreviewEnabled:", v15);
  if (objc_msgSend(v7, "previewEnabled"))
  {
    v17 = self->_internal;
    width = v17->previewImageSize.width;
    height = v17->previewImageSize.height;
    v20 = objc_msgSend(v7, "outputWidth");
    v21 = objc_msgSend(v7, "outputHeight");
    if (v13)
    {
      v22 = objc_msgSend(v10, "highResolutionStillImageDimensions");
      v23 = (double)(int)v22;
      v24 = (double)SHIDWORD(v22);
    }
    else
    {
      v23 = (double)v20;
      v24 = (double)v21;
    }
    if (v23 >= v24)
      v25 = v24;
    else
      v25 = v23;
    if (self->_internal->squareCropEnabled)
      v26 = v25;
    else
      v26 = v24;
    if (self->_internal->squareCropEnabled)
      v23 = v25;
    if (v23 <= width && v26 <= height)
    {
      objc_msgSend(v7, "setPreviewWidth:", v23);
      v30 = v26;
    }
    else
    {
      v28 = v23 / v26;
      v29 = width / height;
      if (vabds_f32(v28, v29) >= 0.01)
      {
        v48.origin.x = 0.0;
        v48.origin.y = 0.0;
        v31 = v26;
        v48.size.width = width;
        v48.size.height = height;
        v47 = AVMakeRectWithAspectRatioInsideRect(*(CGSize *)&v23, v48);
        v32 = v47.size.height;
        *(float *)&v47.origin.x = v47.size.width * 0.5;
        objc_msgSend(v7, "setPreviewWidth:", 2 * llroundf(*(float *)&v47.origin.x));
        v33 = v32 * 0.5;
        v30 = 2 * llroundf(v33);
      }
      else
      {
        objc_msgSend(v7, "setPreviewWidth:", width);
        v30 = height;
      }
    }
    objc_msgSend(v7, "setPreviewHeight:", v30);
    objc_msgSend(v7, "setPreviewFormat:", 875704422);
    objc_msgSend(v7, "setPreviewMirroring:", objc_msgSend(v7, "outputMirroring"));
    objc_msgSend(v7, "setPreviewOrientation:", objc_msgSend(v7, "outputOrientation"));
  }
  objc_msgSend(v7, "setNoiseReductionEnabled:", self->_internal->noiseReductionEnabled);
  objc_msgSend(a3, "videoScaleAndCropFactor");
  *(float *)&v34 = v34;
  objc_msgSend(v7, "setScaleFactor:", v34);
  objc_msgSend(v7, "setShutterSound:", self->_internal->shutterSoundID);
  objc_msgSend(v7, "setFlashMode:", objc_msgSend(v8, "flashMode"));
  objc_msgSend(v7, "setWideColorMode:", 2);
  if (self->_internal->bravoImageFusionSupported)
    objc_msgSend(v7, "setBravoImageFusionMode:", 2);
  if (-[AVCaptureStillImageOutput automaticallyEnablesStillImageStabilizationWhenAvailable](self, "automaticallyEnablesStillImageStabilizationWhenAvailable"))
  {
    v35 = 2;
  }
  else
  {
    v35 = 1;
  }
  objc_msgSend(v7, "setQualityPrioritization:", v35);
  objc_msgSend(v7, "setClientQualityPrioritization:", objc_msgSend(v7, "qualityPrioritization"));
  v36 = -[AVCaptureConnection sourceDeviceInput](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDeviceInput");
  if (objc_msgSend(v8, "isCenterStageActive"))
    v37 = objc_msgSend(v36, "isCenterStageAllowed");
  else
    v37 = 0;
  if (objc_msgSend(v8, "isBackgroundBlurActive"))
    v38 = objc_msgSend(v36, "isBackgroundBlurAllowed");
  else
    v38 = 0;
  if (objc_msgSend(v8, "isStudioLightingActive"))
    v39 = objc_msgSend(v36, "isStudioLightingAllowed");
  else
    v39 = 0;
  v40 = objc_msgSend(v8, "isBackgroundReplacementActive");
  if (v40)
    v40 = objc_msgSend(v36, "isBackgroundReplacementAllowed");
  if (((v37 | v38 | v39) & 1) != 0 || v40)
    objc_msgSend(v7, "setQualityPrioritization:", 1);
  if (objc_msgSend(v10, "videoHDRFlavor") == 2
    && ((int)objc_msgSend(v7, "qualityPrioritization") > 1 || objc_msgSend(v7, "HDRMode")))
  {
    if (objc_msgSend(v8, "isVideoHDREnabled"))
    {
      if (objc_msgSend(v8, "isVideoHDRSuspended"))
        v42 = 0;
      else
        v42 = 2;
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v7, "setHDRMode:", v42);
  }
  v43 = self->_internal;
  if (v43->jpegQualitySpecified)
  {
    v45 = *MEMORY[0x1E0CED190];
    *(float *)&v41 = v43->jpegQuality;
    v46[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
    objc_msgSend(v7, "setVtCompressionProperties:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1));
  }
  return v7;
}

- (void)captureStillImageAsynchronouslyFromConnection:(AVCaptureConnection *)connection completionHandler:(void *)handler
{
  NSObject *CTGreenTeaOsLogHandle;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[8];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  char v17;

  if (handler)
  {
    if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", connection) & 1) != 0)
    {
      CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
      if (CTGreenTeaOsLogHandle)
      {
        v8 = CTGreenTeaOsLogHandle;
        if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19EDF1000, v8, OS_LOG_TYPE_INFO, "Take a photo", buf, 2u);
        }
      }
      *(_QWORD *)buf = 0;
      v15 = buf;
      v16 = 0x2020000000;
      v17 = 0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __93__AVCaptureStillImageOutput_captureStillImageAsynchronouslyFromConnection_completionHandler___block_invoke;
      v13[3] = &unk_1E4217158;
      v13[4] = self;
      v13[5] = connection;
      v13[6] = handler;
      v13[7] = buf;
      -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v13);
      if (!v15[24])
      {
        v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
        objc_exception_throw(v12);
      }
      _Block_object_dispose(buf, 8);
      return;
    }
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
  }
  v11 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v11);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
}

uint64_t __93__AVCaptureStillImageOutput_captureStillImageAsynchronouslyFromConnection_completionHandler___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, void *);
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = a2 != 0;
  if (a2)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(*(id *)(result + 32), "_figCaptureStillImageSettingsForConnection:", *(_QWORD *)(result + 40));
    objc_msgSend(v4, "setPayloadType:", 0);
    v5 = +[AVCaptureStillImageRequest request](AVCaptureStillImageRequest, "request");
    objc_msgSend(v5, "setSettingsID:", objc_msgSend(v4, "settingsID"));
    objc_msgSend(v5, "setSbufCompletionBlock:", *(_QWORD *)(v3 + 48));
    objc_msgSend(v5, "setShutterSoundID:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 80));
    v6 = *(void **)(*(_QWORD *)(v3 + 32) + 16);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 16), "addObject:", v5);
    objc_sync_exit(v6);
    v7 = objc_msgSend(*(id *)(v3 + 32), "sinkID");
    v8 = *(uint64_t (**)(uint64_t, uint64_t, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
    if (v8)
    {
      return v8(a2, v7, v4);
    }
    else
    {
      v9 = *MEMORY[0x1E0D04368];
      v10[0] = &unk_1E424D020;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)captureStillImageSurfaceAsynchronouslyFromConnection:(id)a3 completionHandler:(id)a4
{
  NSObject *CTGreenTeaOsLogHandle;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[8];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  char v17;

  if (a4)
  {
    if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", a3) & 1) != 0)
    {
      CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
      if (CTGreenTeaOsLogHandle)
      {
        v8 = CTGreenTeaOsLogHandle;
        if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19EDF1000, v8, OS_LOG_TYPE_INFO, "Take a photo", buf, 2u);
        }
      }
      *(_QWORD *)buf = 0;
      v15 = buf;
      v16 = 0x2020000000;
      v17 = 0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __100__AVCaptureStillImageOutput_captureStillImageSurfaceAsynchronouslyFromConnection_completionHandler___block_invoke;
      v13[3] = &unk_1E4217158;
      v13[4] = self;
      v13[5] = a3;
      v13[6] = a4;
      v13[7] = buf;
      -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v13);
      if (!v15[24])
      {
        v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
        objc_exception_throw(v12);
      }
      _Block_object_dispose(buf, 8);
      return;
    }
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
  }
  v11 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v11);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
}

uint64_t __100__AVCaptureStillImageOutput_captureStillImageSurfaceAsynchronouslyFromConnection_completionHandler___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, void *);
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = a2 != 0;
  if (a2)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(*(id *)(result + 32), "_figCaptureStillImageSettingsForConnection:", *(_QWORD *)(result + 40));
    objc_msgSend(v4, "setPayloadType:", 1);
    v5 = +[AVCaptureStillImageRequest request](AVCaptureStillImageRequest, "request");
    objc_msgSend(v5, "setSettingsID:", objc_msgSend(v4, "settingsID"));
    objc_msgSend(v5, "setIosurfaceCompletionBlock:", *(_QWORD *)(v3 + 48));
    objc_msgSend(v5, "setShutterSoundID:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 80));
    v6 = *(void **)(*(_QWORD *)(v3 + 32) + 16);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 16), "addObject:", v5);
    objc_sync_exit(v6);
    v7 = objc_msgSend(*(id *)(v3 + 32), "sinkID");
    v8 = *(uint64_t (**)(uint64_t, uint64_t, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
    if (v8)
    {
      return v8(a2, v7, v4);
    }
    else
    {
      v9 = *MEMORY[0x1E0D04368];
      v10[0] = &unk_1E424D020;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (NSUInteger)maxBracketedCaptureStillImageCount
{
  AVCaptureStillImageOutputInternal *internal;
  NSUInteger maxBracketedCaptureCount;

  internal = self->_internal;
  objc_sync_enter(internal);
  maxBracketedCaptureCount = self->_internal->maxBracketedCaptureCount;
  objc_sync_exit(internal);
  return maxBracketedCaptureCount;
}

- (BOOL)isLensStabilizationDuringBracketedCaptureSupported
{
  return self->_internal->lensStabilizationDuringBracketedCaptureSupported;
}

- (BOOL)isLensStabilizationDuringBracketedCaptureEnabled
{
  return self->_internal->lensStabilizationDuringBracketedCaptureEnabled;
}

- (void)setLensStabilizationDuringBracketedCaptureEnabled:(BOOL)lensStabilizationDuringBracketedCaptureEnabled
{
  void *v5;

  if (-[AVCaptureStillImageOutput isLensStabilizationDuringBracketedCaptureSupported](self, "isLensStabilizationDuringBracketedCaptureSupported"))
  {
    self->_internal->lensStabilizationDuringBracketedCaptureEnabled = lensStabilizationDuringBracketedCaptureEnabled;
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (void)prepareToCaptureStillImageBracketFromConnection:(AVCaptureConnection *)connection withSettingsArray:(NSArray *)settings completionHandler:(void *)handler
{
  unint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  AVCaptureStillImageOutputInternal *internal;
  id v15;
  _BOOL4 v16;
  void *v17;
  _QWORD v18[9];
  _QWORD v19[3];
  char v20;
  _QWORD v21[5];
  uint64_t v22;
  _QWORD v23[5];

  if (!handler)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
LABEL_12:
    v17 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v17);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v17);
    return;
  }
  if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", connection) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    goto LABEL_12;
  }
  v10 = -[NSArray count](settings, "count");
  if (v10 > -[AVCaptureStillImageOutput maxBracketedCaptureStillImageCount](self, "maxBracketedCaptureStillImageCount"))
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __113__AVCaptureStillImageOutput_prepareToCaptureStillImageBracketFromConnection_withSettingsArray_completionHandler___block_invoke;
    v23[3] = &unk_1E4217180;
    v23[4] = handler;
    v11 = v23;
LABEL_5:
    -[AVCaptureOutput performBlockOnSessionNotifyingThread:](self, "performBlockOnSessionNotifyingThread:", v11);
    return;
  }
  v22 = 0;
  if (!-[AVCaptureStillImageOutput _bracketedSettingsAreValid:fromConnection:exceptionReason:](self, "_bracketedSettingsAreValid:fromConnection:exceptionReason:", settings, connection, &v22))
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    goto LABEL_12;
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  v15 = -[AVCaptureStillImageOutput _figCaptureStillImageSettingsForBracketedCaptureSettingsArray:fromConnection:](self, "_figCaptureStillImageSettingsForBracketedCaptureSettingsArray:fromConnection:", settings, connection);
  v16 = -[AVCaptureStillImageOutput _preparedForBracketedCaptureWithSettings:](self, "_preparedForBracketedCaptureWithSettings:", v15);
  objc_sync_exit(internal);
  if (v16)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __113__AVCaptureStillImageOutput_prepareToCaptureStillImageBracketFromConnection_withSettingsArray_completionHandler___block_invoke_2;
    v21[3] = &unk_1E4217180;
    v21[4] = handler;
    v11 = v21;
    goto LABEL_5;
  }
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __113__AVCaptureStillImageOutput_prepareToCaptureStillImageBracketFromConnection_withSettingsArray_completionHandler___block_invoke_3;
  v18[3] = &unk_1E42171A8;
  v18[6] = handler;
  v18[7] = v19;
  v18[4] = self;
  v18[5] = v15;
  v18[8] = a2;
  -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v18);
  _Block_object_dispose(v19, 8);
}

uint64_t __113__AVCaptureStillImageOutput_prepareToCaptureStillImageBracketFromConnection_withSettingsArray_completionHandler___block_invoke(uint64_t a1)
{
  AVLocalizedError();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __113__AVCaptureStillImageOutput_prepareToCaptureStillImageBracketFromConnection_withSettingsArray_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __113__AVCaptureStillImageOutput_prepareToCaptureStillImageBracketFromConnection_withSettingsArray_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2 != 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    objc_exception_throw(v9);
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 104), "addObject:", +[AVCapturePrepareBracketRequest prepareBracketRequestWithCompletionBlock:settings:](AVCapturePrepareBracketRequest, "prepareBracketRequestWithCompletionBlock:settings:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40)));
  objc_sync_exit(v4);
  v5 = objc_msgSend(*(id *)(a1 + 32), "sinkID");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 88);
  if (v7)
    return v7(a2, v5, v6);
  v10 = *MEMORY[0x1E0D04368];
  v11[0] = &unk_1E424D020;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

- (void)captureStillImageBracketAsynchronouslyFromConnection:(AVCaptureConnection *)connection withSettingsArray:(NSArray *)settings completionHandler:(void *)handler
{
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  AVCaptureStillImageOutputInternal *internal;
  id v14;
  void *v15;
  _QWORD v16[9];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD v22[6];

  if (handler)
  {
    if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", connection) & 1) != 0)
    {
      v9 = -[NSArray count](settings, "count");
      if (v9 > -[AVCaptureStillImageOutput maxBracketedCaptureStillImageCount](self, "maxBracketedCaptureStillImageCount"))
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __118__AVCaptureStillImageOutput_captureStillImageBracketAsynchronouslyFromConnection_withSettingsArray_completionHandler___block_invoke;
        v22[3] = &unk_1E42171D0;
        v22[4] = settings;
        v22[5] = handler;
        -[AVCaptureOutput performBlockOnSessionNotifyingThread:](self, "performBlockOnSessionNotifyingThread:", v22);
        return;
      }
      v21 = 0;
      if (-[AVCaptureStillImageOutput _bracketedSettingsAreValid:fromConnection:exceptionReason:](self, "_bracketedSettingsAreValid:fromConnection:exceptionReason:", settings, connection, &v21))
      {
        internal = self->_internal;
        objc_sync_enter(internal);
        v14 = -[AVCaptureStillImageOutput _figCaptureStillImageSettingsForBracketedCaptureSettingsArray:fromConnection:](self, "_figCaptureStillImageSettingsForBracketedCaptureSettingsArray:fromConnection:", settings, connection);
        -[AVCaptureStillImageOutput _preparedForBracketedCaptureWithSettings:](self, "_preparedForBracketedCaptureWithSettings:", v14);
        objc_sync_exit(internal);
        v17 = 0;
        v18 = &v17;
        v19 = 0x2020000000;
        v20 = 0;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __118__AVCaptureStillImageOutput_captureStillImageBracketAsynchronouslyFromConnection_withSettingsArray_completionHandler___block_invoke_2;
        v16[3] = &unk_1E42171F8;
        v16[7] = handler;
        v16[8] = &v17;
        v16[4] = self;
        v16[5] = v14;
        v16[6] = settings;
        -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v16);
        if (!*((_BYTE *)v18 + 24))
        {
          v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
          objc_exception_throw(v15);
        }
        _Block_object_dispose(&v17, 8);
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
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
  }
  v12 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v12);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
}

uint64_t __118__AVCaptureStillImageOutput_captureStillImageBracketAsynchronouslyFromConnection_withSettingsArray_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  AVLocalizedError();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __118__AVCaptureStillImageOutput_captureStillImageBracketAsynchronouslyFromConnection_withSettingsArray_completionHandler___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24) = a2 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24))
  {
    v3 = result;
    v4 = *(void **)(*(_QWORD *)(result + 32) + 16);
    objc_sync_enter(v4);
    v5 = 0;
    v6 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 80);
    while (objc_msgSend(*(id *)(v3 + 40), "bracketImageCount") > v5)
    {
      v7 = +[AVCaptureStillImageRequest request](AVCaptureStillImageRequest, "request");
      objc_msgSend(v7, "setSettingsID:", objc_msgSend(*(id *)(v3 + 40), "settingsID"));
      objc_msgSend(v7, "setBracketedCaptureCompletionBlock:", *(_QWORD *)(v3 + 56));
      objc_msgSend(v7, "setBracketedSettings:", objc_msgSend(*(id *)(v3 + 48), "objectAtIndexedSubscript:", v5));
      objc_msgSend(v7, "setShutterSoundID:", v6);
      ++v5;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 16), "addObject:", v7);
      v6 = 0;
    }
    objc_sync_exit(v4);
    v8 = objc_msgSend(*(id *)(v3 + 32), "sinkID");
    v9 = *(_QWORD *)(v3 + 40);
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
    if (v10)
    {
      return v10(a2, v8, v9);
    }
    else
    {
      v11 = *MEMORY[0x1E0D04368];
      v12[0] = &unk_1E424D020;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (BOOL)_bracketedSettingsAreValid:(id)a3 fromConnection:(id)a4 exceptionReason:(id *)a5
{
  unint64_t v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  uint64_t v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CMTime v49;
  CMTime v50;
  CMTime v51;
  CMTime v52;
  CMTime time2;
  CMTime time1;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a3, "count");
  if (v9 > -[AVCaptureStillImageOutput maxBracketedCaptureStillImageCount](self, "maxBracketedCaptureStillImageCount"))
  {
    LOBYTE(v10) = 0;
    v11 = CFSTR("Bracketed capture settings array exceeds -maxBracketedCaptureStillImageCount");
    goto LABEL_62;
  }
  v10 = objc_msgSend(a3, "count");
  if (!v10)
  {
    v11 = CFSTR("Bracketed capture settings array contains 0 elements");
    goto LABEL_62;
  }
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v10) = 0;
    v11 = CFSTR("Bracketed capture settings array may only contain AVCaptureBracketedStillImageSettings objects");
    goto LABEL_62;
  }
  v12 = objc_opt_class();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (!v13)
  {
LABEL_13:
    v17 = (void *)objc_msgSend(a4, "sourceDevice");
    v18 = (void *)objc_msgSend(v17, "activeFormat");
    if (v12 != objc_opt_class())
    {
      if (v12 == objc_opt_class())
      {
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v31 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v46;
          while (2)
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v46 != v33)
                objc_enumerationMutation(a3);
              v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              objc_msgSend(v35, "exposureTargetBias");
              if (v36 != 3.4028e38)
              {
                objc_msgSend(v35, "exposureTargetBias");
                v38 = v37;
                objc_msgSend(v17, "minExposureTargetBias");
                if (v38 < v39
                  || (objc_msgSend(v35, "exposureTargetBias"),
                      v41 = v40,
                      objc_msgSend(v17, "maxExposureTargetBias"),
                      v41 > v42))
                {
                  v43 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ contains an out of range exposure target bias. Use AVCaptureDevice -minExposureTargetBias / -maxExposureTargetBias"), v35);
                  goto LABEL_60;
                }
              }
            }
            v32 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
            if (v32)
              continue;
            break;
          }
        }
      }
      goto LABEL_15;
    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v19 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    if (!v19)
      goto LABEL_44;
    v20 = v19;
    v21 = *(_QWORD *)v56;
LABEL_20:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v56 != v21)
        objc_enumerationMutation(a3);
      v23 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v22);
      objc_msgSend(v23, "ISO");
      if (v24 != 3.4028e38)
      {
        objc_msgSend(v23, "ISO");
        v26 = v25;
        objc_msgSend(v18, "minISO");
        if (v26 < v27 || (objc_msgSend(v23, "ISO"), v29 = v28, objc_msgSend(v18, "maxISO"), v29 > v30))
        {
          v43 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ contains an out of range ISO value. Use AVCaptureDeviceFormat -minISO / -maxISO"), v23);
LABEL_60:
          v11 = (__CFString *)v43;
          goto LABEL_61;
        }
      }
      if (v23)
        objc_msgSend(v23, "exposureDuration");
      else
        memset(&time1, 0, sizeof(time1));
      memset(&time2, 0, sizeof(time2));
      if (CMTimeCompare(&time1, &time2))
        break;
LABEL_42:
      if (v20 == ++v22)
      {
        v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        if (v20)
          goto LABEL_20;
LABEL_44:
        if ((objc_msgSend(v17, "isExposureModeSupported:", 3) & 1) == 0)
        {
          LOBYTE(v10) = 0;
          v11 = CFSTR("Source device does not support manual exposure bracketed capture. Use AVCaptureDevice -isExposureModeSupported: with AVCaptureExposureModeCustom");
          goto LABEL_62;
        }
LABEL_15:
        v11 = 0;
        LOBYTE(v10) = 1;
        goto LABEL_62;
      }
    }
    if (v23)
    {
      objc_msgSend(v23, "exposureDuration");
      if (v18)
      {
LABEL_32:
        objc_msgSend(v18, "minExposureDuration");
        goto LABEL_35;
      }
    }
    else
    {
      memset(&v52, 0, sizeof(v52));
      if (v18)
        goto LABEL_32;
    }
    memset(&v51, 0, sizeof(v51));
LABEL_35:
    if (CMTimeCompare(&v52, &v51) < 0)
      goto LABEL_59;
    if (v23)
    {
      objc_msgSend(v23, "exposureDuration");
      if (v18)
      {
LABEL_38:
        objc_msgSend(v18, "maxExposureDuration");
        goto LABEL_41;
      }
    }
    else
    {
      memset(&v50, 0, sizeof(v50));
      if (v18)
        goto LABEL_38;
    }
    memset(&v49, 0, sizeof(v49));
LABEL_41:
    if (CMTimeCompare(&v50, &v49) >= 1)
    {
LABEL_59:
      v43 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ contains an out of range exposure duration. Use AVCaptureDeviceFormat -minExposureDuration / -maxExposureDuration"), v23);
      goto LABEL_60;
    }
    goto LABEL_42;
  }
  v14 = v13;
  v15 = *(_QWORD *)v60;
  v11 = CFSTR("All elements in the bracketed capture settings array must be of the same class");
LABEL_7:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v60 != v15)
      objc_enumerationMutation(a3);
    if (objc_opt_class() != v12)
      break;
    if (v14 == ++v16)
    {
      v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      if (!v14)
        goto LABEL_13;
      goto LABEL_7;
    }
  }
LABEL_61:
  LOBYTE(v10) = 0;
LABEL_62:
  if (a5)
    *a5 = v11;
  return v10;
}

- (id)_figCaptureStillImageSettingsForBracketedCaptureSettingsArray:(id)a3 fromConnection:(id)a4
{
  id v6;
  uint64_t v7;
  char isKindOfClass;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  char v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = -[AVCaptureStillImageOutput _figCaptureStillImageSettingsForConnection:](self, "_figCaptureStillImageSettingsForConnection:", a4);
  objc_msgSend(v6, "setFlashMode:", 0);
  objc_msgSend(v6, "setHDRMode:", 0);
  v7 = 1;
  objc_msgSend(v6, "setQualityPrioritization:", 1);
  objc_msgSend(v6, "setLensStabilizationDuringBracketEnabled:", -[AVCaptureStillImageOutput isLensStabilizationDuringBracketedCaptureEnabled](self, "isLensStabilizationDuringBracketedCaptureEnabled"));
  objc_msgSend(a3, "firstObject");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(a3, "firstObject");
    objc_opt_class();
    v24 = objc_opt_isKindOfClass();
    if ((v24 & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
  }
  objc_msgSend(v6, "setBracketType:imageCount:", v7, objc_msgSend(a3, "count"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      v14 = 24 * v11;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(a3);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
        if ((isKindOfClass & 1) != 0)
        {
          v16 = a3;
          v17 = objc_msgSend(v6, "exposureDurations");
          if (v15)
          {
            objc_msgSend(v15, "exposureDuration");
          }
          else
          {
            v25 = 0uLL;
            v26 = 0;
          }
          v21 = v17 + v14;
          *(_QWORD *)(v21 + 16) = v26;
          *(_OWORD *)v21 = v25;
          objc_msgSend(v15, "ISO");
          v19 = v22;
          v20 = objc_msgSend(v6, "ISOs");
          a3 = v16;
        }
        else
        {
          if ((v24 & 1) == 0)
            goto LABEL_19;
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v13), "exposureTargetBias");
          v19 = v18;
          v20 = objc_msgSend(v6, "exposureTargetBiases");
        }
        *(_DWORD *)(v20 + 4 * v11) = v19;
LABEL_19:
        ++v11;
        ++v13;
        v14 += 24;
      }
      while (v10 != v13);
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }
  return v6;
}

- (BOOL)_preparedForBracketedCaptureWithSettings:(id)a3
{
  return objc_msgSend(a3, "bracketImageCount") == self->_internal->preparedBracket.imageCount
      && objc_msgSend(a3, "outputFormat") == self->_internal->preparedBracket.outputFormat
      && objc_msgSend(a3, "outputWidth") == self->_internal->preparedBracket.outputWidth
      && objc_msgSend(a3, "outputHeight") == self->_internal->preparedBracket.outputHeight;
}

- (void)_updateMaxBracketedStillImageCaptureCountForSourceFormat:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  int v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  AVCaptureStillImageOutputInternal *internal;

  if ((int)FigCapturePlatformIdentifier() >= 5)
    v5 = 8;
  else
    v5 = 4;
  if (a3)
  {
    v6 = -[AVCaptureConnection sourceDeviceInput](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDeviceInput");
    v7 = (void *)objc_msgSend(v6, "device");
    if (objc_msgSend(v7, "isCenterStageActive"))
      v8 = objc_msgSend(v6, "isCenterStageAllowed");
    else
      v8 = 0;
    if (objc_msgSend(v7, "isBackgroundBlurActive"))
      v10 = objc_msgSend(v6, "isBackgroundBlurAllowed");
    else
      v10 = 0;
    if (objc_msgSend(v7, "isStudioLightingActive"))
      v11 = objc_msgSend(v6, "isStudioLightingAllowed");
    else
      v11 = 0;
    v12 = objc_msgSend(v7, "isBackgroundReplacementActive");
    if (v12)
      LOBYTE(v12) = objc_msgSend(v6, "isBackgroundReplacementAllowed");
    v9 = 0;
    if (((v8 | v10 | v11) & 1) == 0 && (v12 & 1) == 0)
    {
      v9 = v5;
      if (objc_msgSend(a3, "supportsQuadraHighResolutionStillImageOutput"))
      {
        if (self->_internal->highResStillEnabled)
          v9 = 0;
        else
          v9 = v5;
      }
    }
  }
  else
  {
    v9 = 0;
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  if (v9 != self->_internal->maxBracketedCaptureCount)
  {
    -[AVCaptureStillImageOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("maxBracketedCaptureStillImageCount"));
    self->_internal->maxBracketedCaptureCount = v9;
    -[AVCaptureStillImageOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("maxBracketedCaptureStillImageCount"));
  }
  objc_sync_exit(internal);
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  AVWeakReference *weakReference;
  objc_super v7;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  weakReference = self->_internal->weakReference;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, sioNotificationHandler, *MEMORY[0x1E0D04570], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, sioNotificationHandler, *MEMORY[0x1E0D04560], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, sioNotificationHandler, *MEMORY[0x1E0D04568], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, sioNotificationHandler, *MEMORY[0x1E0D04558], a3, 0);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureStillImageOutput;
  -[AVCaptureOutput attachSafelyToFigCaptureSession:](&v7, sel_attachSafelyToFigCaptureSession_, a3);
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  AVWeakReference *weakReference;
  objc_super v7;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  weakReference = self->_internal->weakReference;
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", weakReference, sioNotificationHandler, *MEMORY[0x1E0D04570], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", weakReference, sioNotificationHandler, *MEMORY[0x1E0D04560], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", weakReference, sioNotificationHandler, *MEMORY[0x1E0D04568], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", weakReference, sioNotificationHandler, *MEMORY[0x1E0D04558], a3);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureStillImageOutput;
  -[AVCaptureOutput detachSafelyFromFigCaptureSession:](&v7, sel_detachSafelyFromFigCaptureSession_, a3);
}

- (void)safelyHandleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  AVCaptureStillImageOutputInternal *internal;
  uint64_t v5;
  NSMutableArray *stillImageRequests;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  objc_sync_enter(internal);
  v15 = *MEMORY[0x1E0D04368];
  v16[0] = &unk_1E424D008;
  v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  stillImageRequests = self->_internal->stillImageRequests;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stillImageRequests, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(stillImageRequests);
        -[AVCaptureStillImageOutput handleNotificationForRequest:withPayload:imageIsEV0:](self, "handleNotificationForRequest:withPayload:imageIsEV0:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), v5, 0);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stillImageRequests, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[NSMutableArray removeAllObjects](self->_internal->stillImageRequests, "removeAllObjects");
  objc_sync_exit(internal);
}

- (void)_setStillImageStabilizationAutomaticallyEnabled:(BOOL)a3
{
  objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "sourceDevice"), "_setStillImageStabilizationAutomaticallyEnabled:", a3);
}

- (void)_updateLensStabilizationDuringBracketedCaptureSupportedForDevice:(id)a3
{
  AVCaptureStillImageOutputInternal *internal;
  _BOOL4 v5;

  if (objc_msgSend(a3, "isLensStabilizationSupported"))
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    v5 = self->_internal->maxBracketedCaptureCount != 0;
    objc_sync_exit(internal);
  }
  else
  {
    v5 = 0;
  }
  if (self->_internal->lensStabilizationDuringBracketedCaptureSupported != v5)
  {
    -[AVCaptureStillImageOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lensStabilizationDuringBracketedCaptureSupported"));
    self->_internal->lensStabilizationDuringBracketedCaptureSupported = v5;
    -[AVCaptureStillImageOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lensStabilizationDuringBracketedCaptureSupported"));
    if (!v5 && self->_internal->lensStabilizationDuringBracketedCaptureEnabled)
    {
      -[AVCaptureStillImageOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lensStabilizationDuringBracketedCaptureEnabled"));
      self->_internal->lensStabilizationDuringBracketedCaptureEnabled = 0;
      -[AVCaptureStillImageOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lensStabilizationDuringBracketedCaptureEnabled"));
    }
  }
}

- (CGSize)outputSizeForSourceFormat:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  objc_super v8;
  CGSize result;

  if (-[AVCaptureStillImageOutput isHighResolutionStillImageOutputEnabled](self, "isHighResolutionStillImageOutputEnabled"))
  {
    v5 = objc_msgSend(a3, "highResolutionStillImageDimensions");
    v6 = (double)(int)v5;
    v7 = (double)SHIDWORD(v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVCaptureStillImageOutput;
    -[AVCaptureOutput outputSizeForSourceFormat:](&v8, sel_outputSizeForSourceFormat_, a3);
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)handleNotificationForRequest:(id)a3 withPayload:(id)a4 imageIsEV0:(BOOL *)a5
{
  int v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04360]), "intValue");
  if (v8)
    v9 = AVLocalizedErrorWithUnderlyingOSStatus();
  else
    v9 = 0;
  if (objc_msgSend(a3, "sbufCompletionBlock"))
  {
    v10 = (const void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043F8]);
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v10, (CFStringRef)*MEMORY[0x1E0CBCB50], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB30]), "intValue");
      if (a5)
        *a5 = v12 == 4;
    }
    else if (!v9)
    {
      v9 = AVLocalizedError();
    }
    v24 = objc_msgSend(a3, "sbufCompletionBlock");
    (*(void (**)(uint64_t, const void *, uint64_t))(v24 + 16))(v24, v11, v9);
  }
  else if (objc_msgSend(a3, "iosurfaceCompletionBlock"))
  {
    v13 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04420]);
    v14 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04428]), "unsignedIntegerValue");
    v15 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043D8]);
    v16 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043E0]), "unsignedIntegerValue");
    v17 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04398]);
    v18 = v17;
    if (v17)
    {
      v19 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB50]);
      if (v19)
      {
        v20 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB30]), "intValue");
        if (a5)
          *a5 = v20 == 4;
      }
    }
    if (v14)
      v21 = v13 == 0;
    else
      v21 = 1;
    if (v21 && v9 == 0)
      v9 = AVLocalizedError();
    v23 = objc_msgSend(a3, "iosurfaceCompletionBlock");
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t))(v23 + 16))(v23, v13, v14, v15, v16, v18, v9);
  }
  else if (objc_msgSend(a3, "bracketedCaptureCompletionBlock"))
  {
    v25 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043F8]);
    if (!(v25 | v9))
      v9 = AVLocalizedError();
    v26 = objc_msgSend(a3, "bracketedCaptureCompletionBlock");
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 16))(v26, v25, objc_msgSend(a3, "bracketedSettings"), v9);
  }
}

- (void)handleNotificationForPrepareRequest:(id)a3 withPayload:(id)a4
{
  int v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04360]), "intValue");
  if (v6)
    v7 = AVLocalizedErrorWithUnderlyingOSStatus();
  else
    v7 = 0;
  if (objc_msgSend(a3, "completionBlock"))
  {
    v8 = objc_msgSend(a3, "completionBlock");
    (*(void (**)(uint64_t, BOOL, uint64_t))(v8 + 16))(v8, v6 == 0, v7);
  }
}

- (void)handleNotification:(id)a3 payload:(id)a4
{
  uint64_t v7;
  AVCaptureStillImageOutputInternal *internal;
  NSMutableArray *stillImageRequests;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  SystemSoundID v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSMutableArray *prepareRequests;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  AVCaptureStillImageOutputInternal *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  AVCaptureStillImageOutputInternal *obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04570]))
    {
      v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04408]), "longLongValue");
      internal = self->_internal;
      objc_sync_enter(internal);
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      stillImageRequests = self->_internal->stillImageRequests;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stillImageRequests, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v46;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v46 != v11)
              objc_enumerationMutation(stillImageRequests);
            v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            if (objc_msgSend(v13, "settingsID") == v7)
            {
              v14 = objc_msgSend(v13, "shutterSoundID");
              objc_sync_exit(internal);
              if (v14)
                AVCaptureStillImageOutputPlayShutterSound(self, v14);
              goto LABEL_18;
            }
          }
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stillImageRequests, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
          if (v10)
            continue;
          break;
        }
      }
      objc_sync_exit(internal);
LABEL_18:
      -[AVCaptureStillImageOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("capturingStillImage"));
      v15 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04708]);
      if (v15)
      {
        -[AVCaptureStillImageOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stillImageStabilizationActive"));
        self->_internal->SISActive = objc_msgSend(v15, "BOOLValue");
        -[AVCaptureStillImageOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stillImageStabilizationActive"));
      }
      self->_internal->isCapturingPhoto = 1;
      -[AVCaptureStillImageOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("capturingStillImage"));
    }
    else
    {
      if (!objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04560]))
      {
        if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04568]))
        {
          v16 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04408]), "longLongValue");
          obj = self->_internal;
          objc_sync_enter(obj);
          if (-[NSMutableArray count](self->_internal->stillImageRequests, "count"))
          {
            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            v17 = self->_internal->stillImageRequests;
            v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            if (v18)
            {
              v19 = 0;
              v20 = *(_QWORD *)v42;
              while (2)
              {
                v21 = 0;
                v33 = v19 + v18;
                do
                {
                  if (*(_QWORD *)v42 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v21);
                  if (objc_msgSend(v22, "settingsID", v33) == v16)
                  {
                    v30 = v22;
                    -[NSMutableArray removeObjectAtIndex:](self->_internal->stillImageRequests, "removeObjectAtIndex:", v19 + v21);
                    objc_sync_exit(obj);
                    if (v30)
                    {
                      v40 = 0;
                      -[AVCaptureStillImageOutput handleNotificationForRequest:withPayload:imageIsEV0:](self, "handleNotificationForRequest:withPayload:imageIsEV0:", v30, a4, &v40);
                      if (v40)
                      {
                        v31 = self->_internal;
                        objc_sync_enter(v31);
                        -[NSMutableArray insertObject:atIndex:](self->_internal->stillImageRequests, "insertObject:atIndex:", v30, 0);
                        objc_sync_exit(v31);
                      }

                    }
                    return;
                  }
                  ++v21;
                }
                while (v18 != v21);
                v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
                v19 = v33;
                if (v18)
                  continue;
                break;
              }
            }
          }
        }
        else
        {
          if (!objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04558]))
            return;
          v23 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04408]), "longLongValue");
          obj = self->_internal;
          objc_sync_enter(obj);
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          prepareRequests = self->_internal->prepareRequests;
          v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](prepareRequests, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
          if (v25)
          {
            v26 = 0;
            v27 = *(_QWORD *)v37;
            while (2)
            {
              v28 = 0;
              v34 = v26 + v25;
              do
              {
                if (*(_QWORD *)v37 != v27)
                  objc_enumerationMutation(prepareRequests);
                v29 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v28);
                if (objc_msgSend((id)objc_msgSend(v29, "settings", v34), "settingsID") == v23)
                {
                  v32 = v29;
                  -[NSMutableArray removeObjectAtIndex:](self->_internal->prepareRequests, "removeObjectAtIndex:", v26 + v28);
                  self->_internal->preparedBracket.imageCount = objc_msgSend((id)objc_msgSend(v32, "settings"), "bracketImageCount");
                  self->_internal->preparedBracket.outputFormat = objc_msgSend((id)objc_msgSend(v32, "settings"), "outputFormat");
                  self->_internal->preparedBracket.outputWidth = objc_msgSend((id)objc_msgSend(v32, "settings"), "outputWidth");
                  self->_internal->preparedBracket.outputHeight = objc_msgSend((id)objc_msgSend(v32, "settings"), "outputHeight");
                  objc_sync_exit(obj);
                  if (v32)
                  {
                    -[AVCaptureStillImageOutput handleNotificationForPrepareRequest:withPayload:](self, "handleNotificationForPrepareRequest:withPayload:", v32, a4);

                  }
                  return;
                }
                ++v28;
              }
              while (v25 != v28);
              v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](prepareRequests, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
              v26 = v34;
              if (v25)
                continue;
              break;
            }
          }
        }
        objc_sync_exit(obj);
        return;
      }
      -[AVCaptureStillImageOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("capturingStillImage"));
      self->_internal->isCapturingPhoto = 0;
      if (self->_internal->SISActive)
      {
        -[AVCaptureStillImageOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stillImageStabilizationActive"));
        self->_internal->SISActive = 0;
        -[AVCaptureStillImageOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stillImageStabilizationActive"));
      }
      -[AVCaptureStillImageOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("capturingStillImage"));
    }
  }
}

+ (unint64_t)maxStillImageJPEGDataSize
{
  if (maxStillImageJPEGDataSize_onceToken != -1)
    dispatch_once(&maxStillImageJPEGDataSize_onceToken, &__block_literal_global_10);
  return maxStillImageJPEGDataSize_maxDataSize;
}

CMVideoDimensions __54__AVCaptureStillImageOutput_maxStillImageJPEGDataSize__block_invoke()
{
  id v0;
  CMVideoDimensions result;
  unint64_t v2;

  if ((AVCaptureIsRunningInMediaserverd() & 1) == 0)
  {
    result = (CMVideoDimensions)FigCaptureSourceRemoteMaxStillImageJPEGDataSize();
LABEL_9:
    maxStillImageJPEGDataSize_maxDataSize = (uint64_t)result;
    return result;
  }
  v0 = -[NSArray lastObject](-[AVCaptureDevice formats](+[AVCaptureDevice defaultDeviceWithMediaType:](AVCaptureDevice, "defaultDeviceWithMediaType:", *MEMORY[0x1E0CF2B90]), "formats"), "lastObject");
  if (v0)
  {
    result = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v0, "formatDescription"));
    v2 = HIDWORD(*(unint64_t *)&result);
  }
  else
  {
    LODWORD(v2) = 2448;
    result = (CMVideoDimensions)3264;
  }
  if (result.width >= 1 && (int)v2 >= 1)
  {
    result = (CMVideoDimensions)(2 * result.width * (int)v2 / 3);
    goto LABEL_9;
  }
  return result;
}

+ (NSData)jpegStillImageNSDataRepresentation:(CMSampleBufferRef)jpegSampleBuffer
{
  const opaqueCMFormatDescription *FormatDescription;
  OpaqueCMBlockBuffer *DataBuffer;
  const __CFAllocator *v7;
  CFDataRef v8;
  const void *v9;
  NSData *EXIFJPEGData;
  NSData *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  size_t totalLengthOut;
  char *dataPointerOut;
  CMBlockBufferRef blockBufferOut;

  if (jpegSampleBuffer)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(jpegSampleBuffer);
    if (CMFormatDescriptionGetMediaSubType(FormatDescription) == 1785750887)
    {
      DataBuffer = CMSampleBufferGetDataBuffer(jpegSampleBuffer);
      if (DataBuffer)
      {
        blockBufferOut = 0;
        v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        if (CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E0C9AE00], DataBuffer, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, 0, &blockBufferOut)|| (totalLengthOut = 0, dataPointerOut = 0, CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, &totalLengthOut, &dataPointerOut)))
        {
          EXIFJPEGData = 0;
        }
        else
        {
          v8 = CFDataCreateWithBytesNoCopy(v7, (const UInt8 *)dataPointerOut, totalLengthOut, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
          v9 = (const void *)objc_msgSend(a1, "_copyAttachmentsAndPropagateFaceRegionsToExifAuxDictionaryForSampleBuffer:", jpegSampleBuffer);
          EXIFJPEGData = (NSData *)CGImageCreateEXIFJPEGData();
          v11 = EXIFJPEGData;
          if (v9)
            CFRelease(v9);
          if (v8)
            CFRelease(v8);
        }
        if (blockBufferOut)
          CFRelease(blockBufferOut);
        return EXIFJPEGData;
      }
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
  }
  v14 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v14);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
  return 0;
}

+ (id)jpegStillImageNSDataRepresentationForSurface:(__IOSurface *)a3 size:(unint64_t)a4 metadata:(id)a5
{
  const UInt8 *BaseAddress;
  CFDataRef v8;
  void *EXIFJPEGData;
  id v10;
  void *v11;

  if (a3 && a4)
  {
    CFRetain(a3);
    IOSurfaceLock(a3, 1u, 0);
    BaseAddress = (const UInt8 *)IOSurfaceGetBaseAddress(a3);
    v8 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], BaseAddress, a4, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    EXIFJPEGData = (void *)CGImageCreateEXIFJPEGData();
    v10 = EXIFJPEGData;
    if (v8)
      CFRelease(v8);
    IOSurfaceUnlock(a3, 1u, 0);
    CFRelease(a3);
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v11);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
    return 0;
  }
  return EXIFJPEGData;
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

@end
