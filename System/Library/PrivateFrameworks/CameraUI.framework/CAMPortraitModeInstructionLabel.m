@implementation CAMPortraitModeInstructionLabel

+ (BOOL)shouldDisplayInstructionForShallowDepthOfFieldStatus:(int64_t)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "_textForShallowDepthOfFieldStatus:numberOfPeopleFound:flashSupported:flashMode:devicePosition:lightingType:lowlightMode:lowLightStatus:", a3, 0, 1, 2, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3
{
  int64_t shallowDepthOfFieldStatus;
  id v5;

  shallowDepthOfFieldStatus = self->_shallowDepthOfFieldStatus;
  if (shallowDepthOfFieldStatus != a3)
  {
    self->_shallowDepthOfFieldStatus = a3;
    -[CAMPortraitModeInstructionLabel _updateTextWithPriorStatus:](self, "_updateTextWithPriorStatus:", shallowDepthOfFieldStatus);
    -[CAMInstructionLabel delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instructionLabelDidChangeIntrinsicContentSize:", self);

  }
}

- (void)setNumberOfPeopleFound:(unint64_t)a3
{
  if (self->_numberOfPeopleFound != a3)
  {
    self->_numberOfPeopleFound = a3;
    -[CAMPortraitModeInstructionLabel _updateTextWithPriorStatus:](self, "_updateTextWithPriorStatus:", -[CAMPortraitModeInstructionLabel shallowDepthOfFieldStatus](self, "shallowDepthOfFieldStatus"));
  }
}

- (void)setFlashSupported:(BOOL)a3
{
  if (self->_flashSupported != a3)
  {
    self->_flashSupported = a3;
    -[CAMPortraitModeInstructionLabel _updateTextWithPriorStatus:](self, "_updateTextWithPriorStatus:", -[CAMPortraitModeInstructionLabel shallowDepthOfFieldStatus](self, "shallowDepthOfFieldStatus"));
  }
}

- (void)setFlashMode:(int64_t)a3
{
  if (self->_flashMode != a3)
  {
    self->_flashMode = a3;
    -[CAMPortraitModeInstructionLabel _updateTextWithPriorStatus:](self, "_updateTextWithPriorStatus:", -[CAMPortraitModeInstructionLabel shallowDepthOfFieldStatus](self, "shallowDepthOfFieldStatus"));
  }
}

- (void)setDevicePosition:(int64_t)a3
{
  if (self->_devicePosition != a3)
  {
    self->_devicePosition = a3;
    -[CAMPortraitModeInstructionLabel _updateTextWithPriorStatus:](self, "_updateTextWithPriorStatus:", -[CAMPortraitModeInstructionLabel shallowDepthOfFieldStatus](self, "shallowDepthOfFieldStatus"));
  }
}

- (void)setLightingType:(int64_t)a3
{
  if (self->_lightingType != a3)
  {
    self->_lightingType = a3;
    -[CAMPortraitModeInstructionLabel _updateTextWithPriorStatus:](self, "_updateTextWithPriorStatus:", -[CAMPortraitModeInstructionLabel shallowDepthOfFieldStatus](self, "shallowDepthOfFieldStatus"));
  }
}

- (void)_updateTextWithPriorStatus:(int64_t)a3
{
  int64_t v5;
  unint64_t v6;
  _BOOL8 v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = -[CAMPortraitModeInstructionLabel shallowDepthOfFieldStatus](self, "shallowDepthOfFieldStatus");
  v6 = -[CAMPortraitModeInstructionLabel numberOfPeopleFound](self, "numberOfPeopleFound");
  v7 = -[CAMPortraitModeInstructionLabel isFlashSupported](self, "isFlashSupported");
  v8 = -[CAMPortraitModeInstructionLabel flashMode](self, "flashMode");
  objc_msgSend((id)objc_opt_class(), "_textForShallowDepthOfFieldStatus:numberOfPeopleFound:flashSupported:flashMode:devicePosition:lightingType:lowlightMode:lowLightStatus:", v5, v6, v7, v8, -[CAMPortraitModeInstructionLabel devicePosition](self, "devicePosition"), -[CAMPortraitModeInstructionLabel lightingType](self, "lightingType"), -[CAMPortraitModeInstructionLabel lowLightMode](self, "lowLightMode"), -[CAMPortraitModeInstructionLabel lowLightStatus](self, "lowLightStatus"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_textForShallowDepthOfFieldStatus:numberOfPeopleFound:flashSupported:flashMode:devicePosition:lightingType:lowlightMode:lowLightStatus:", a3, v6, v7, v8, -[CAMPortraitModeInstructionLabel devicePosition](self, "devicePosition"), -[CAMPortraitModeInstructionLabel lightingType](self, "lightingType"), -[CAMPortraitModeInstructionLabel lowLightMode](self, "lowLightMode"), -[CAMPortraitModeInstructionLabel lowLightStatus](self, "lowLightStatus"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v12)
  {
    -[CAMInstructionLabel setText:](self, "setText:");
    if (!v10)
      goto LABEL_5;
  }
  else if (v9)
  {
LABEL_5:
    -[CAMInstructionLabel delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "instructionLabelDidChangeIntrinsicContentSize:", self);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  objc_super v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CAMPortraitModeInstructionLabel;
  -[CAMInstructionLabel sizeThatFits:](&v9, sel_sizeThatFits_);
  if (v5 < 108.0 && height == 0.0 && width == 0.0)
    v5 = 108.0;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (id)_textForShallowDepthOfFieldStatus:(int64_t)a3 numberOfPeopleFound:(unint64_t)a4 flashSupported:(BOOL)a5 flashMode:(int64_t)a6 devicePosition:(int64_t)a7 lightingType:(int64_t)a8 lowlightMode:(int64_t)a9 lowLightStatus:(int64_t)a10
{
  void *v10;
  _BOOL4 v11;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  __CFString *v28;
  __CFString *v29;
  double v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  __CFString *v34;
  void *v35;

  v10 = 0;
  if (a6)
    v11 = 0;
  else
    v11 = a5;
  switch(a3)
  {
    case 3:
      v15 = a8 - 4;
      CAMPortraitModeInstructionLabelMeasurementFormatter();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "locale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0C997F0]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isSingleCameraPortraitModeSupportedForDevicePosition:", a7);

      if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C99808]) & 1) != 0
        || (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C99800]) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 3.0;
        v23 = a7 == 1;
        v24 = 8.0;
        if (a7 == 1)
          v24 = 3.0;
        v25 = 6.0;
        v26 = 1.5;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 1.0;
        v23 = a7 == 1;
        v24 = 2.5;
        if (a7 == 1)
          v24 = 1.0;
        v25 = 2.0;
        v26 = 0.5;
      }
      if (v23)
        v25 = v26;
      if (v15 <= 2)
        v24 = v25;
      if ((v20 & 1) != 0)
        v30 = v22;
      else
        v30 = v24;
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3758]), "initWithDoubleValue:unit:", v21, v30);
      objc_msgSend(v16, "stringFromMeasurement:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("PORTRAIT_MODE_SUBJECT_TOO_FAR");
      if (v15 < 3)
        v33 = CFSTR("PORTRAIT_MODE_SUBJECT_TOO_FAR_STAGE");
      if (a8 == 6)
        v33 = CFSTR("PORTRAIT_MODE_SUBJECT_TOO_FAR_HIGH_KEY");
      if (v20)
        v34 = CFSTR("PORTRAIT_MODE_SUBJECT_TOO_FAR_SINGLE_CAMERA");
      else
        v34 = (__CFString *)v33;
      CAMLocalizedFrameworkString(v34, &stru_1EA3325A0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v35, CFSTR("%lu%@"), 0, a4, v32);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      return v10;
    case 4:
      v28 = CFSTR("PORTRAIT_MODE_SUBJECT_TOO_CLOSE");
      goto LABEL_43;
    case 5:
      if (a9)
        v27 = 0;
      else
        v27 = (unint64_t)(a10 - 3) >= 0xFFFFFFFFFFFFFFFELL;
      if (!v27 || !v11)
      {
        if (v11)
          v28 = CFSTR("PORTRAIT_MODE_LOW_LIGHT_FLASH_DISABLED");
        else
          v28 = CFSTR("PORTRAIT_MODE_LOW_LIGHT");
LABEL_43:
        v29 = &stru_1EA3325A0;
      }
      else
      {
        v28 = CFSTR("PORTRAIT_MODE_LOW_LIGHT_NIGHT_MODE_DISABLED_FLASH_DISABLED");
LABEL_18:
        v29 = 0;
      }
      CAMLocalizedFrameworkString(v28, v29);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      return v10;
    case 7:
      v28 = CFSTR("PORTRAIT_MODE_TOO_MUCH_LIGHT");
      goto LABEL_43;
    case 8:
      v28 = CFSTR("PORTRAIT_MODE_BACKGROUND_TOO_FAR");
      goto LABEL_43;
    case 10:
      v28 = CFSTR("PORTRAIT_MODE_LOW_LIGHT_NIGHT_MODE_AVAILABLE");
      goto LABEL_18;
    default:
      return v10;
  }
}

- (int64_t)shallowDepthOfFieldStatus
{
  return self->_shallowDepthOfFieldStatus;
}

- (BOOL)isFlashSupported
{
  return self->_flashSupported;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (unint64_t)numberOfPeopleFound
{
  return self->_numberOfPeopleFound;
}

- (int64_t)devicePosition
{
  return self->_devicePosition;
}

- (int64_t)lightingType
{
  return self->_lightingType;
}

- (int64_t)lowLightStatus
{
  return self->_lowLightStatus;
}

- (void)setLowLightStatus:(int64_t)a3
{
  self->_lowLightStatus = a3;
}

- (int64_t)lowLightMode
{
  return self->_lowLightMode;
}

- (void)setLowLightMode:(int64_t)a3
{
  self->_lowLightMode = a3;
}

@end
