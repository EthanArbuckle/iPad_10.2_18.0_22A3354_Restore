@implementation CAMConflictingControlConfiguration

- (int64_t)desiredFlashMode
{
  return self->_desiredFlashMode;
}

- (int64_t)desiredHDRMode
{
  return self->_desiredHDRMode;
}

- (int64_t)flashAndHDRConflictingControl
{
  return self->_flashAndHDRConflictingControl;
}

- (CAMConflictingControlConfiguration)initWithDesiredFlashMode:(int64_t)a3 desiredHDRMode:(int64_t)a4 flashAndHDRConflictingControl:(int64_t)a5 desiredLivePhotoMode:(int64_t)a6 desiredRAWMode:(int64_t)a7 desiredPhotoResolution:(int64_t)a8 photoFormatConflicts:(unint64_t)a9 desiredLowLightControlMode:(unint64_t)a10 lowLightConflicts:(unint64_t)a11 desiredMacroMode:(int64_t)a12
{
  CAMConflictingControlConfiguration *v18;
  CAMConflictingControlConfiguration *v19;
  CAMConflictingControlConfiguration *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CAMConflictingControlConfiguration;
  v18 = -[CAMConflictingControlConfiguration init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_desiredFlashMode = a3;
    v18->_desiredHDRMode = a4;
    v18->_flashAndHDRConflictingControl = a5;
    v18->_desiredLivePhotoMode = a6;
    v18->_desiredRAWMode = a7;
    v18->_desiredPhotoResolution = a8;
    v18->_photoFormatConflicts = a9;
    v18->_desiredLowLightControlMode = a10;
    v18->_lowLightConflicts = a11;
    v18->_desiredMacroMode = a12;
    v20 = v18;
  }

  return v19;
}

+ (void)resolveDesiredFlashMode:(int64_t)a3 desiredHDRMode:(int64_t)a4 primaryConflictingControl:(int64_t)a5 device:(int64_t)a6 toFlashMode:(int64_t *)a7 HDRMode:(int64_t *)a8
{
  void *v14;
  char v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  int v21;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isSmartHDRSupported");

  if ((v15 & 1) == 0)
  {
    if (a5 == 1)
    {
      if (a3 == 1)
      {
        a4 = 0;
      }
      else if (a3 == 2 && a4 == 1)
      {
        if ((unint64_t)(a6 - 1) > 0xA)
          v19 = 0;
        else
          v19 = qword_1DB9A5748[a6 - 1];
        +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isAutomaticHDRSupportedForDevicePosition:", v19);

        a3 = 2;
        if (v21)
          a4 = 2;
        else
          a4 = 0;
      }
    }
    else
    {
      v16 = 1;
      v17 = 2;
      if (a3 == 1 && a4 == 2)
        v18 = 2;
      else
        v18 = a4;
      if (a3 != 1 || a4 != 2)
        v17 = a3;
      if (a4 == 1)
        v17 = 0;
      else
        v16 = v18;
      if (a5 == 2)
      {
        a4 = v16;
        a3 = v17;
      }
    }
  }
  if (a7)
    *a7 = a3;
  if (a8)
    *a8 = a4;
}

+ (void)resolveDesiredRAWMode:(int64_t)a3 photoFormatConflicts:(unint64_t)a4 desiredLivePhotoMode:(int64_t)a5 desiredFlashMode:(int64_t)a6 toRAWMode:(int64_t *)a7 toLivePhotoMode:(int64_t *)a8 toFlashMode:(int64_t *)a9
{
  int64_t v9;
  int64_t v10;

  if (a3 == 1)
    v9 = a4 == 0;
  else
    v9 = a3;
  if (a3 == 1 && a4 == 0)
    v10 = 0;
  else
    v10 = a5;
  if (a9)
    *a9 = a6;
  if (a8)
    *a8 = v10;
  if (a7)
    *a7 = v9;
}

+ (unint64_t)resolveDesiredLowLightControlMode:(unint64_t)a3 lowLightConflicts:(unint64_t)a4 resolvedFlashMode:(int64_t)a5
{
  BOOL v6;
  BOOL v7;
  unint64_t v8;

  v6 = a4 != 1 || a5 != 2;
  if (a4)
  {
    v7 = a3 == 2;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  if (v7)
    v8 = 1;
  else
    v8 = a3;
  if (v8 == 1 && v6)
    return 0;
  else
    return v8;
}

+ (int64_t)resolveDesiredMacroMode:(int64_t)a3 forMode:(int64_t)a4 device:(int64_t)a5 videoConfiguration:(int64_t)a6 videoStabilizationStrength:(int64_t)a7 photoFormat:(id)a8 optionalDepthEffectEnabled:(BOOL)a9 spatialVideoEnabled:(BOOL)a10
{
  void *v16;
  uint64_t v17;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isSuperWideAutoMacroSupportedForMode:device:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a4, a5, a6, a7, a10))
  {
    if ((unint64_t)(a5 - 1) > 0xA)
      v17 = 0;
    else
      v17 = qword_1DB9A5748[a5 - 1];
    if (objc_msgSend(a1, "shouldDisableMacroForLockedPortraitForMode:devicePosition:photoFormat:optionalDepthEffectEnabled:", a4, v17, a8.var0, a8.var1, a9))a3 = 0;
  }
  else
  {
    a3 = 0;
  }

  return a3;
}

+ (BOOL)shouldDisableMacroForLockedPortraitForMode:(int64_t)a3 devicePosition:(int64_t)a4 photoFormat:(id)a5 optionalDepthEffectEnabled:(BOOL)a6
{
  int64_t var1;
  int64_t var0;
  void *v11;
  char v12;
  BOOL v13;
  BOOL v14;

  var1 = a5.var1;
  var0 = a5.var0;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isDepthSuggestionSupportedForMode:devicePosition:photoFormat:", a3, a4, var0, var1);
  v13 = (~objc_msgSend(v11, "portraitInPhotoModeBehavior") & 0x11) == 0 && a6;
  v14 = v12 & v13;

  return v14;
}

- (int64_t)desiredLivePhotoMode
{
  return self->_desiredLivePhotoMode;
}

- (int64_t)desiredRAWMode
{
  return self->_desiredRAWMode;
}

- (int64_t)desiredPhotoResolution
{
  return self->_desiredPhotoResolution;
}

- (unint64_t)photoFormatConflicts
{
  return self->_photoFormatConflicts;
}

- (unint64_t)desiredLowLightControlMode
{
  return self->_desiredLowLightControlMode;
}

- (unint64_t)lowLightConflicts
{
  return self->_lowLightConflicts;
}

- (int64_t)desiredMacroMode
{
  return self->_desiredMacroMode;
}

@end
