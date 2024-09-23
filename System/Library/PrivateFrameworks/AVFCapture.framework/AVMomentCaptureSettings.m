@implementation AVMomentCaptureSettings

- (id)_initWithPhotoSettings:(id)a3
{
  AVMomentCaptureSettings *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMomentCaptureSettings;
  v4 = -[AVMomentCaptureSettings init](&v6, sel_init);
  if (v4)
  {
    v4->_photoSettings = (AVCapturePhotoSettings *)objc_msgSend(a3, "copy");
    v4->_bravoCameraSelectionBehaviorForRecording = (NSString *)CFSTR("AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange");
  }
  return v4;
}

+ (id)settingsWithPhotoSettings:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithPhotoSettings:", a3);
}

+ (id)settingsWithUserInitiatedCaptureTime:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithUserInitiatedCaptureTime:uniqueID:", a3, +[AVCapturePhotoSettings uniqueID](AVCapturePhotoSettings, "uniqueID"));
}

+ (id)settingsWithUserInitiatedCaptureTime:(unint64_t)a3 uniqueID:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithUserInitiatedCaptureTime:uniqueID:", a3, a4);
}

- (id)_initWithUserInitiatedCaptureTime:(unint64_t)a3 uniqueID:(int64_t)a4
{
  AVMomentCaptureSettings *v6;
  AVMomentCaptureSettings *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVMomentCaptureSettings;
  v6 = -[AVMomentCaptureSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_uniqueID = a4;
    v6->_userInitiatedCaptureTime = a3;
    v6->_photoQualityPrioritization = 3;
    v6->_bravoCameraSelectionBehaviorForRecording = (NSString *)CFSTR("AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMomentCaptureSettings;
  -[AVMomentCaptureSettings dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVCapturePhotoSettings *photoSettings;
  AVMomentCaptureSettings *v5;
  id v6;

  photoSettings = self->_photoSettings;
  v5 = [AVMomentCaptureSettings alloc];
  if (photoSettings)
  {
    v6 = -[AVMomentCaptureSettings _initWithPhotoSettings:](v5, "_initWithPhotoSettings:", self->_photoSettings);
  }
  else
  {
    v6 = -[AVMomentCaptureSettings _initWithUserInitiatedCaptureTime:uniqueID:](v5, "_initWithUserInitiatedCaptureTime:uniqueID:", self->_userInitiatedCaptureTime, self->_uniqueID);
    objc_msgSend(v6, "setFlashMode:", self->_flashMode);
    objc_msgSend(v6, "setDigitalFlashMode:", self->_digitalFlashMode);
    objc_msgSend(v6, "setPhotoQualityPrioritization:", self->_photoQualityPrioritization);
    objc_msgSend(v6, "setHDRMode:", self->_HDRMode);
    objc_msgSend(v6, "setMaxPhotoDimensions:", *(_QWORD *)&self->_maxPhotoDimensions);
    objc_msgSend(v6, "setDepthDataDeliveryEnabled:", self->_depthDataDeliveryEnabled);
  }
  objc_msgSend(v6, "setTorchMode:", self->_torchMode);
  objc_msgSend(v6, "setBravoCameraSelectionBehaviorForRecording:", self->_bravoCameraSelectionBehaviorForRecording);
  return v6;
}

- (id)debugDescription
{
  const __CFString *v2;

  if (self->_depthDataDeliveryEnabled)
    v2 = CFSTR(" depth:1");
  else
    v2 = &stru_1E421DB28;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uid:%lld torch:%d flash:%d%@ SBQ:%d HDR:%d%@"), self->_uniqueID, self->_torchMode, self->_flashMode, CFSTR(" dflash:%d"), self->_photoQualityPrioritization, self->_HDRMode, v2);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVMomentCaptureSettings debugDescription](self, "debugDescription"));
}

- (int64_t)uniqueID
{
  AVCapturePhotoSettings *photoSettings;

  photoSettings = self->_photoSettings;
  if (photoSettings)
    return -[AVCapturePhotoSettings uniqueID](photoSettings, "uniqueID");
  else
    return self->_uniqueID;
}

- (unint64_t)userInitiatedCaptureTime
{
  AVCapturePhotoSettings *photoSettings;

  photoSettings = self->_photoSettings;
  if (photoSettings)
    return -[AVCapturePhotoSettings userInitiatedPhotoRequestTime](photoSettings, "userInitiatedPhotoRequestTime");
  else
    return self->_userInitiatedCaptureTime;
}

- (AVCapturePhotoSettings)photoSettings
{
  return (AVCapturePhotoSettings *)(id)-[AVCapturePhotoSettings copy](self->_photoSettings, "copy");
}

- (int64_t)torchMode
{
  return self->_torchMode;
}

- (void)setTorchMode:(int64_t)a3
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
    self->_torchMode = a3;
  }
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (void)setFlashMode:(int64_t)a3
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
    self->_flashMode = a3;
  }
}

- (int64_t)digitalFlashMode
{
  return self->_digitalFlashMode;
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
    self->_digitalFlashMode = a3;
  }
}

- (int64_t)photoQualityPrioritization
{
  return self->_photoQualityPrioritization;
}

- (void)setPhotoQualityPrioritization:(int64_t)a3
{
  void *v3;

  if ((unint64_t)(a3 - 1) >= 3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    self->_photoQualityPrioritization = a3;
  }
}

- (int64_t)HDRMode
{
  return self->_HDRMode;
}

- (void)setHDRMode:(int64_t)a3
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
    self->_HDRMode = a3;
  }
}

- (BOOL)isAutoDeferredProcessingEnabled
{
  return self->_autoDeferredPhotoDeliveryEnabled;
}

- (void)setAutoDeferredProcessingEnabled:(BOOL)a3
{
  self->_autoDeferredPhotoDeliveryEnabled = a3;
}

- (NSString)bravoCameraSelectionBehaviorForRecording
{
  return self->_bravoCameraSelectionBehaviorForRecording;
}

- (void)setBravoCameraSelectionBehaviorForRecording:(id)a3
{
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("AVCaptureBravoCameraSelectionBehaviorEvaluatesContinuously");
  v6[1] = CFSTR("AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange");
  v6[2] = CFSTR("AVCaptureBravoCameraSelectionBehaviorEvaluatesNever");
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3), "containsObject:", a3) & 1) != 0)
  {

    self->_bravoCameraSelectionBehaviorForRecording = (NSString *)objc_msgSend(a3, "copy");
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, a3);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (BOOL)isAutoRedEyeReductionEnabled
{
  return self->_autoRedEyeReductionEnabled;
}

- (void)setAutoRedEyeReductionEnabled:(BOOL)a3
{
  self->_autoRedEyeReductionEnabled = a3;
}

- (BOOL)isAutoOriginalPhotoDeliveryEnabled
{
  return self->_autoOriginalPhotoDeliveryEnabled;
}

- (void)setAutoOriginalPhotoDeliveryEnabled:(BOOL)a3
{
  self->_autoOriginalPhotoDeliveryEnabled = a3;
}

- (BOOL)isAutoSpatialOverCaptureEnabled
{
  return self->_autoSpatialOverCaptureEnabled;
}

- (void)setAutoSpatialOverCaptureEnabled:(BOOL)a3
{
  self->_autoSpatialOverCaptureEnabled = a3;
}

- (BOOL)isAutoDeferredPhotoDeliveryEnabled
{
  return self->_autoDeferredPhotoDeliveryEnabled;
}

- (void)setAutoDeferredPhotoDeliveryEnabled:(BOOL)a3
{
  self->_autoDeferredPhotoDeliveryEnabled = a3;
}

- (unsigned)rawOutputFormat
{
  return self->_rawOutputFormat;
}

- (void)setRawOutputFormat:(unsigned int)a3
{
  self->_rawOutputFormat = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)maxPhotoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_maxPhotoDimensions;
}

- (void)setMaxPhotoDimensions:(id)a3
{
  self->_maxPhotoDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)isDepthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

@end
