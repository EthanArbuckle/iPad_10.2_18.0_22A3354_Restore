@implementation FigMomentCaptureSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigMomentCaptureSettings)initWithStillImageSettings:(id)a3
{
  FigMomentCaptureSettings *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigMomentCaptureSettings;
  v4 = -[FigMomentCaptureSettings init](&v6, sel_init);
  if (v4)
    v4->_stillImageSettings = (FigCaptureIrisStillImageSettings *)a3;
  return v4;
}

- (FigMomentCaptureSettings)initWithSettingsID:(int64_t)a3 captureRequestIdentifier:(id)a4 userInitiatedCaptureTime:(unint64_t)a5
{
  FigMomentCaptureSettings *v8;
  FigMomentCaptureSettings *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FigMomentCaptureSettings;
  v8 = -[FigMomentCaptureSettings init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_settingsID = a3;
    v8->_captureRequestIdentifier = (NSString *)a4;
    v9->_userInitiatedCaptureTime = a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigMomentCaptureSettings;
  -[FigMomentCaptureSettings dealloc](&v3, sel_dealloc);
}

- (FigMomentCaptureSettings)initWithCoder:(id)a3
{
  uint64_t v5;
  FigMomentCaptureSettings *v6;

  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stillImageSettings"));
  if (v5)
  {
    v6 = -[FigMomentCaptureSettings initWithStillImageSettings:](self, "initWithStillImageSettings:", v5);
    if (!v6)
      return v6;
    goto LABEL_6;
  }
  v6 = -[FigMomentCaptureSettings initWithSettingsID:captureRequestIdentifier:userInitiatedCaptureTime:](self, "initWithSettingsID:captureRequestIdentifier:userInitiatedCaptureTime:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("settingsID")), objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captureRequestIdentifier")), objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("userInitiatedCaptureTime")));
  if (v6)
  {
    v6->_flashMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("flashMode"));
    v6->_autoRedEyeReductionEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("autoRedEyeReductionEnabled"));
    v6->_digitalFlashMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("digitalFlashMode"));
    v6->_qualityPrioritization = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("qualityPrioritization"));
    v6->_clientQualityPrioritization = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("clientQualityPrioritization"));
    v6->_HDRMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("HDRMode"));
    v6->_autoOriginalPhotoDeliveryEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("autoOriginalPhotoDeliveryEnabled"));
    v6->_autoDeferredProcessingEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("autoDeferredProcessingEnabled"));
    v6->_rawOutputFormat = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawOutputFormat"));
    v6->_outputWidth = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputWidth"));
    v6->_outputHeight = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputHeight"));
    v6->_depthDataDeliveryEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("depthDataDeliveryEnabled"));
LABEL_6:
    v6->_torchMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("torchMode"));
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_stillImageSettings, CFSTR("stillImageSettings"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_settingsID, CFSTR("settingsID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_captureRequestIdentifier, CFSTR("captureRequestIdentifier"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_userInitiatedCaptureTime, CFSTR("userInitiatedCaptureTime"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_torchMode, CFSTR("torchMode"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_flashMode, CFSTR("flashMode"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_autoRedEyeReductionEnabled, CFSTR("autoRedEyeReductionEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_digitalFlashMode, CFSTR("digitalFlashMode"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_qualityPrioritization, CFSTR("qualityPrioritization"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_clientQualityPrioritization, CFSTR("clientQualityPrioritization"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_HDRMode, CFSTR("HDRMode"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_autoOriginalPhotoDeliveryEnabled, CFSTR("autoOriginalPhotoDeliveryEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_autoSpatialOverCaptureEnabled, CFSTR("autoSpatialOverCaptureEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_autoDeferredProcessingEnabled, CFSTR("autoDeferredProcessingEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_rawOutputFormat, CFSTR("rawOutputFormat"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputWidth, CFSTR("outputWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputHeight, CFSTR("outputHeight"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_depthDataDeliveryEnabled, CFSTR("depthDataDeliveryEnabled"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSettingsID:captureRequestIdentifier:userInitiatedCaptureTime:", self->_settingsID, self->_captureRequestIdentifier, self->_userInitiatedCaptureTime);
  objc_msgSend(v4, "setTorchMode:", self->_torchMode);
  objc_msgSend(v4, "setFlashMode:", self->_flashMode);
  objc_msgSend(v4, "setAutoRedEyeReductionEnabled:", self->_autoRedEyeReductionEnabled);
  objc_msgSend(v4, "setDigitalFlashMode:", self->_digitalFlashMode);
  objc_msgSend(v4, "setQualityPrioritization:", self->_qualityPrioritization);
  objc_msgSend(v4, "setClientQualityPrioritization:", self->_clientQualityPrioritization);
  objc_msgSend(v4, "setHDRMode:", self->_HDRMode);
  objc_msgSend(v4, "setAutoOriginalPhotoDeliveryEnabled:", self->_autoOriginalPhotoDeliveryEnabled);
  objc_msgSend(v4, "setAutoSpatialOverCaptureEnabled:", self->_autoSpatialOverCaptureEnabled);
  objc_msgSend(v4, "setAutoDeferredProcessingEnabled:", self->_autoDeferredProcessingEnabled);
  objc_msgSend(v4, "setRawOutputFormat:", self->_rawOutputFormat);
  objc_msgSend(v4, "setOutputWidth:", self->_outputWidth);
  objc_msgSend(v4, "setOutputHeight:", self->_outputHeight);
  objc_msgSend(v4, "setDepthDataDeliveryEnabled:", self->_depthDataDeliveryEnabled);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  int64_t settingsID;
  unint64_t userInitiatedCaptureTime;
  int torchMode;
  int flashMode;
  int autoRedEyeReductionEnabled;
  int digitalFlashMode;
  int qualityPrioritization;
  int clientQualityPrioritization;
  int HDRMode;
  int autoOriginalPhotoDeliveryEnabled;
  int autoSpatialOverCaptureEnabled;
  int autoDeferredProcessingEnabled;
  unsigned int rawOutputFormat;
  unsigned int outputWidth;
  unsigned int outputHeight;
  int depthDataDeliveryEnabled;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    v5 = -[FigCaptureStillImageSettings isEqual:](self->_stillImageSettings, "isEqual:", objc_msgSend(a3, "stillImageSettings"));
    if (!v5)
      return v5;
    settingsID = self->_settingsID;
    if (settingsID != objc_msgSend(a3, "settingsID"))
      goto LABEL_21;
    v5 = -[NSString isEqualToString:](self->_captureRequestIdentifier, "isEqualToString:", objc_msgSend(a3, "captureRequestIdentifier"));
    if (!v5)
      return v5;
    userInitiatedCaptureTime = self->_userInitiatedCaptureTime;
    if (userInitiatedCaptureTime != objc_msgSend(a3, "userInitiatedCaptureTime"))
      goto LABEL_21;
    torchMode = self->_torchMode;
    if (torchMode != objc_msgSend(a3, "torchMode"))
      goto LABEL_21;
    flashMode = self->_flashMode;
    if (flashMode != objc_msgSend(a3, "flashMode"))
      goto LABEL_21;
    autoRedEyeReductionEnabled = self->_autoRedEyeReductionEnabled;
    if (autoRedEyeReductionEnabled != objc_msgSend(a3, "autoRedEyeReductionEnabled"))
      goto LABEL_21;
    digitalFlashMode = self->_digitalFlashMode;
    if (digitalFlashMode != objc_msgSend(a3, "digitalFlashMode"))
      goto LABEL_21;
    qualityPrioritization = self->_qualityPrioritization;
    if (qualityPrioritization != objc_msgSend(a3, "qualityPrioritization"))
      goto LABEL_21;
    clientQualityPrioritization = self->_clientQualityPrioritization;
    if (clientQualityPrioritization != objc_msgSend(a3, "clientQualityPrioritization")
      || (HDRMode = self->_HDRMode, HDRMode != objc_msgSend(a3, "HDRMode"))
      || (autoOriginalPhotoDeliveryEnabled = self->_autoOriginalPhotoDeliveryEnabled,
          autoOriginalPhotoDeliveryEnabled != objc_msgSend(a3, "isAutoOriginalPhotoDeliveryEnabled"))
      || (autoSpatialOverCaptureEnabled = self->_autoSpatialOverCaptureEnabled,
          autoSpatialOverCaptureEnabled != objc_msgSend(a3, "isAutoSpatialOverCaptureEnabled"))
      || (autoDeferredProcessingEnabled = self->_autoDeferredProcessingEnabled,
          autoDeferredProcessingEnabled != objc_msgSend(a3, "isAutoDeferredProcessingEnabled"))
      || (rawOutputFormat = self->_rawOutputFormat, rawOutputFormat != objc_msgSend(a3, "rawOutputFormat"))
      || (outputWidth = self->_outputWidth, outputWidth != objc_msgSend(a3, "outputWidth"))
      || (outputHeight = self->_outputHeight, outputHeight != objc_msgSend(a3, "outputHeight")))
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    depthDataDeliveryEnabled = self->_depthDataDeliveryEnabled;
    LOBYTE(v5) = depthDataDeliveryEnabled == objc_msgSend(a3, "depthDataDeliveryEnabled");
  }
  return v5;
}

- (unint64_t)hash
{
  return self->_settingsID;
}

- (id)description
{
  uint64_t torchMode;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  _BOOL4 autoOriginalPhotoDeliveryEnabled;
  _BOOL4 autoSpatialOverCaptureEnabled;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v15;
  const __CFString *v16;

  torchMode = self->_torchMode;
  if ((_DWORD)torchMode)
    v16 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" TORCH:%d"), torchMode);
  else
    v16 = &stru_1E4928818;
  if (self->_flashMode)
    v15 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" FLASH:%d"), self->_flashMode);
  else
    v15 = &stru_1E4928818;
  if (self->_digitalFlashMode)
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" DIGITALFLASH:%d"), self->_digitalFlashMode);
  else
    v4 = &stru_1E4928818;
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" QUAL:%d"), self->_qualityPrioritization);
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" CQUAL:%d"), self->_clientQualityPrioritization);
  if (self->_HDRMode)
    v7 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" HDR:%d"), self->_HDRMode);
  else
    v7 = &stru_1E4928818;
  autoOriginalPhotoDeliveryEnabled = self->_autoOriginalPhotoDeliveryEnabled;
  autoSpatialOverCaptureEnabled = self->_autoSpatialOverCaptureEnabled;
  v10 = &stru_1E4928818;
  if (self->_rawOutputFormat)
    v11 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" RAW:%c%c%c%c"), HIBYTE(self->_rawOutputFormat), BYTE2(self->_rawOutputFormat), BYTE1(self->_rawOutputFormat), self->_rawOutputFormat);
  else
    v11 = &stru_1E4928818;
  if (autoSpatialOverCaptureEnabled)
    v12 = CFSTR(" OverCapture:1");
  else
    v12 = &stru_1E4928818;
  if (autoOriginalPhotoDeliveryEnabled)
    v13 = CFSTR(" ORIGINAL:1");
  else
    v13 = &stru_1E4928818;
  if (self->_depthDataDeliveryEnabled)
    v10 = CFSTR(" DEPTH:1");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %p: captureID:%lld userTime:%llu %dx%d %@%@%@%@%@%@%@%@%@%@"), objc_opt_class(), self, self->_settingsID, self->_userInitiatedCaptureTime, self->_outputWidth, self->_outputHeight, v16, v15, v4, v5, v6, v7, v13, v12, v11, v10);
}

- (int64_t)settingsID
{
  FigCaptureIrisStillImageSettings *stillImageSettings;

  stillImageSettings = self->_stillImageSettings;
  if (stillImageSettings)
    return -[FigCaptureStillImageSettings settingsID](stillImageSettings, "settingsID");
  else
    return self->_settingsID;
}

- (NSString)captureRequestIdentifier
{
  FigCaptureIrisStillImageSettings *stillImageSettings;

  stillImageSettings = self->_stillImageSettings;
  if (stillImageSettings)
    return -[FigCaptureStillImageSettings captureRequestIdentifier](stillImageSettings, "captureRequestIdentifier");
  else
    return self->_captureRequestIdentifier;
}

- (unint64_t)userInitiatedCaptureTime
{
  FigCaptureIrisStillImageSettings *stillImageSettings;

  stillImageSettings = self->_stillImageSettings;
  if (stillImageSettings)
    return -[FigCaptureStillImageSettings stillImageUserInitiatedRequestTime](stillImageSettings, "stillImageUserInitiatedRequestTime");
  else
    return self->_userInitiatedCaptureTime;
}

- (int)torchMode
{
  return self->_torchMode;
}

- (void)setTorchMode:(int)a3
{
  self->_torchMode = a3;
}

- (int)flashMode
{
  return self->_flashMode;
}

- (void)setFlashMode:(int)a3
{
  self->_flashMode = a3;
}

- (BOOL)autoRedEyeReductionEnabled
{
  return self->_autoRedEyeReductionEnabled;
}

- (void)setAutoRedEyeReductionEnabled:(BOOL)a3
{
  self->_autoRedEyeReductionEnabled = a3;
}

- (int)digitalFlashMode
{
  return self->_digitalFlashMode;
}

- (void)setDigitalFlashMode:(int)a3
{
  self->_digitalFlashMode = a3;
}

- (int)qualityPrioritization
{
  return self->_qualityPrioritization;
}

- (void)setQualityPrioritization:(int)a3
{
  self->_qualityPrioritization = a3;
}

- (int)clientQualityPrioritization
{
  return self->_clientQualityPrioritization;
}

- (void)setClientQualityPrioritization:(int)a3
{
  self->_clientQualityPrioritization = a3;
}

- (int)HDRMode
{
  return self->_HDRMode;
}

- (void)setHDRMode:(int)a3
{
  self->_HDRMode = a3;
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

- (BOOL)isAutoDeferredProcessingEnabled
{
  return self->_autoDeferredProcessingEnabled;
}

- (void)setAutoDeferredProcessingEnabled:(BOOL)a3
{
  self->_autoDeferredProcessingEnabled = a3;
}

- (unsigned)rawOutputFormat
{
  return self->_rawOutputFormat;
}

- (void)setRawOutputFormat:(unsigned int)a3
{
  self->_rawOutputFormat = a3;
}

- (unsigned)outputWidth
{
  return self->_outputWidth;
}

- (void)setOutputWidth:(unsigned int)a3
{
  self->_outputWidth = a3;
}

- (unsigned)outputHeight
{
  return self->_outputHeight;
}

- (void)setOutputHeight:(unsigned int)a3
{
  self->_outputHeight = a3;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (FigCaptureIrisStillImageSettings)stillImageSettings
{
  return self->_stillImageSettings;
}

@end
