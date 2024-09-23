@implementation AVCapturePhotoBracketSettings

+ (void)initialize
{
  objc_opt_class();
}

+ (AVCapturePhotoBracketSettings)photoBracketSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType processedFormat:(NSDictionary *)processedFormat bracketedSettings:(NSArray *)bracketedSettings
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v9 = 0;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:bracketedSettings:uniqueID:exceptionReason:", processedFormat, 0, *(_QWORD *)&rawPixelFormatType, 0, bracketedSettings, 0, &v9);
  v6 = v5;
  if (!v9)
    return (AVCapturePhotoBracketSettings *)v5;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v7);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  return 0;
}

+ (AVCapturePhotoBracketSettings)photoBracketSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType rawFileType:(AVFileType)rawFileType processedFormat:(NSDictionary *)processedFormat processedFileType:(AVFileType)processedFileType bracketedSettings:(NSArray *)bracketedSettings
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v11 = 0;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:bracketedSettings:uniqueID:exceptionReason:", processedFormat, processedFileType, *(_QWORD *)&rawPixelFormatType, rawFileType, bracketedSettings, 0, &v11);
  v8 = v7;
  if (!v11)
    return (AVCapturePhotoBracketSettings *)v7;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v9);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
  return 0;
}

- (id)_initWithFormat:(id)a3 processedFileType:(id)a4 rawPixelFormatType:(unsigned int)a5 rawFileType:(id)a6 bracketedSettings:(id)a7 uniqueID:(int64_t)a8 exceptionReason:(id *)a9
{
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  AVCapturePhotoBracketSettings *v21;
  __CFString *v22;
  AVCapturePhotoBracketSettingsInternal *v23;
  id v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __CFString *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  if (!a7)
  {
    v22 = CFSTR("bracketedSettings may not be nil");
LABEL_17:
    v31 = v22;
    goto LABEL_18;
  }
  v13 = *(_QWORD *)&a5;
  if (!objc_msgSend(a7, "count"))
  {
    v22 = CFSTR("Bracketed capture settings array contains 0 elements");
    goto LABEL_17;
  }
  objc_msgSend(a7, "objectAtIndexedSubscript:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = CFSTR("Bracketed capture settings array may only contain AVCaptureBracketedStillImageSettings objects");
    goto LABEL_17;
  }
  v25 = a3;
  v16 = objc_opt_class();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(a7);
        if (objc_opt_class() != v16)
        {
          v22 = CFSTR("All elements in the bracketed capture settings array must be of the same class");
          goto LABEL_17;
        }
      }
      v18 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v18)
        continue;
      break;
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)AVCapturePhotoBracketSettings;
  v21 = -[AVCapturePhotoSettings _initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:](&v26, sel__initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason_, v25, a4, v13, a6, 0, a8, &v31);
  self = v21;
  v22 = v31;
  if (!v31)
  {
    if (v21)
    {
      v23 = objc_alloc_init(AVCapturePhotoBracketSettingsInternal);
      self->_bracketSettingsInternal = v23;
      if (v23)
      {
        self->_bracketSettingsInternal->bracketedSettings = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", a7);
        -[AVCapturePhotoSettings _setPhotoQualityPrioritization:](self, "_setPhotoQualityPrioritization:", 1);
        -[AVCapturePhotoBracketSettings setAutoVirtualDeviceFusionEnabled:](self, "setAutoVirtualDeviceFusionEnabled:", 0);
        -[AVCapturePhotoBracketSettings setAutoRedEyeReductionEnabled:](self, "setAutoRedEyeReductionEnabled:", 0);
      }
    }
    return self;
  }
LABEL_18:
  if (a9)
    *a9 = v22;

  return 0;
}

- (void)dealloc
{
  AVCapturePhotoBracketSettingsInternal *bracketSettingsInternal;
  objc_super v4;

  bracketSettingsInternal = self->_bracketSettingsInternal;
  if (bracketSettingsInternal)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVCapturePhotoBracketSettings;
  -[AVCapturePhotoSettings dealloc](&v4, sel_dealloc);
}

- (id)debugDescription
{
  const __CFString *v2;
  objc_super v4;

  if (self->_bracketSettingsInternal->lensStabilizationEnabled)
    v2 = CFSTR(" lensStab:ON");
  else
    v2 = &stru_1E421DB28;
  v4.receiver = self;
  v4.super_class = (Class)AVCapturePhotoBracketSettings;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ bracket:%d%@"), -[AVCapturePhotoSettings debugDescription](&v4, sel_debugDescription), -[NSArray count](self->_bracketSettingsInternal->bracketedSettings, "count"), v2);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCapturePhotoBracketSettings debugDescription](self, "debugDescription"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVCapturePhotoBracketSettings;
  v5 = -[AVCapturePhotoSettings copyWithZone:](&v7, sel_copyWithZone_);
  if (v5)
    v5[2] = -[AVCapturePhotoBracketSettingsInternal copyWithZone:](self->_bracketSettingsInternal, "copyWithZone:", a3);
  return v5;
}

- (NSArray)bracketedSettings
{
  return self->_bracketSettingsInternal->bracketedSettings;
}

- (BOOL)isLensStabilizationEnabled
{
  return self->_bracketSettingsInternal->lensStabilizationEnabled;
}

- (void)setLensStabilizationEnabled:(BOOL)lensStabilizationEnabled
{
  self->_bracketSettingsInternal->lensStabilizationEnabled = lensStabilizationEnabled;
}

- (void)setFlashMode:(int64_t)a3
{
  void *v3;
  objc_super v4;

  if (a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setFlashMode:](&v4, sel_setFlashMode_);
  }
}

- (void)setAutoRedEyeReductionEnabled:(BOOL)a3
{
  void *v3;
  objc_super v4;

  if (a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setAutoRedEyeReductionEnabled:](&v4, sel_setAutoRedEyeReductionEnabled_);
  }
}

- (void)setHDRMode:(int64_t)a3
{
  void *v3;
  objc_super v4;

  if (a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setHDRMode:](&v4, sel_setHDRMode_);
  }
}

- (void)setEV0PhotoDeliveryEnabled:(BOOL)a3
{
  void *v3;
  objc_super v4;

  if (a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setEV0PhotoDeliveryEnabled:](&v4, sel_setEV0PhotoDeliveryEnabled_);
  }
}

- (void)setAutoStillImageStabilizationEnabled:(BOOL)a3
{
  void *v3;
  objc_super v4;

  if (a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setAutoStillImageStabilizationEnabled:](&v4, sel_setAutoStillImageStabilizationEnabled_);
  }
}

- (void)setAutoVirtualDeviceFusionEnabled:(BOOL)a3
{
  void *v3;
  objc_super v4;

  if (a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setAutoVirtualDeviceFusionEnabled:](&v4, sel_setAutoVirtualDeviceFusionEnabled_);
  }
}

- (void)setAutoDualCameraFusionEnabled:(BOOL)a3
{
  void *v3;
  objc_super v4;

  if (a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setAutoDualCameraFusionEnabled:](&v4, sel_setAutoDualCameraFusionEnabled_);
  }
}

- (void)setLivePhotoMovieFileURL:(id)a3
{
  void *v3;
  objc_super v4;

  if (a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setLivePhotoMovieFileURL:](&v4, sel_setLivePhotoMovieFileURL_);
  }
}

- (void)setLivePhotoMovieFileURLForOriginalPhoto:(id)a3
{
  void *v3;
  objc_super v4;

  if (a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setLivePhotoMovieFileURLForOriginalPhoto:](&v4, sel_setLivePhotoMovieFileURLForOriginalPhoto_);
  }
}

- (void)setLivePhotoMovieMetadata:(id)a3
{
  void *v3;
  objc_super v4;

  if (a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setLivePhotoMovieMetadata:](&v4, sel_setLivePhotoMovieMetadata_);
  }
}

- (void)setLivePhotoMovieMetadataForOriginalPhoto:(id)a3
{
  void *v3;
  objc_super v4;

  if (a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setLivePhotoMovieMetadataForOriginalPhoto:](&v4, sel_setLivePhotoMovieMetadataForOriginalPhoto_);
  }
}

@end
