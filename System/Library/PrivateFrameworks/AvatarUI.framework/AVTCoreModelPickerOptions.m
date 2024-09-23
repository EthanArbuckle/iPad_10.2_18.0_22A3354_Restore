@implementation AVTCoreModelPickerOptions

+ (unint64_t)displayModeFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("colorPickerHeaderAccessory")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("highlightPicker"));

  return v4;
}

+ (unint64_t)sortingOptionFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("defaultFirst")) & 1) != 0)
    v4 = 2;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("reversed"));

  return v4;
}

- (AVTCoreModelPickerOptions)initWithFramingMode:(id)a3 separatorFlag:(BOOL)a4 presetOverrides:(id)a5 poseOverride:(id)a6 framingModeOverrides:(id)a7 displayMode:(unint64_t)a8 displayCondition:(id)a9 sortingOption:(unint64_t)a10 stickerConfiguration:(id)a11 showsLabel:(BOOL)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  AVTCoreModelPickerOptions *v22;
  uint64_t v23;
  NSString *framingMode;
  uint64_t v25;
  NSArray *presetOverrides;
  uint64_t v27;
  AVTAvatarPose *poseOverride;
  id v31;
  objc_super v32;

  v31 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = a11;
  v32.receiver = self;
  v32.super_class = (Class)AVTCoreModelPickerOptions;
  v22 = -[AVTCoreModelPickerOptions init](&v32, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v31, "copy");
    framingMode = v22->_framingMode;
    v22->_framingMode = (NSString *)v23;

    v22->_separator = a4;
    v25 = objc_msgSend(v17, "copy");
    presetOverrides = v22->_presetOverrides;
    v22->_presetOverrides = (NSArray *)v25;

    v27 = objc_msgSend(v18, "copy");
    poseOverride = v22->_poseOverride;
    v22->_poseOverride = (AVTAvatarPose *)v27;

    objc_storeStrong((id *)&v22->_framingModeOverrides, a7);
    v22->_displayMode = a8;
    objc_storeStrong((id *)&v22->_displayCondition, a9);
    v22->_sortingOption = a10;
    objc_storeStrong((id *)&v22->_stickerConfiguration, a11);
    v22->_showsLabel = a12;
  }

  return v22;
}

- (NSString)framingMode
{
  return self->_framingMode;
}

- (BOOL)separator
{
  return self->_separator;
}

- (NSArray)presetOverrides
{
  return self->_presetOverrides;
}

- (AVTCoreModelFramingModeOverrides)framingModeOverrides
{
  return self->_framingModeOverrides;
}

- (AVTAvatarPose)poseOverride
{
  return self->_poseOverride;
}

- (AVTCoreModelPickerDisplayCondition)displayCondition
{
  return self->_displayCondition;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (unint64_t)sortingOption
{
  return self->_sortingOption;
}

- (AVTStickerConfiguration)stickerConfiguration
{
  return self->_stickerConfiguration;
}

- (BOOL)showsLabel
{
  return self->_showsLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerConfiguration, 0);
  objc_storeStrong((id *)&self->_displayCondition, 0);
  objc_storeStrong((id *)&self->_poseOverride, 0);
  objc_storeStrong((id *)&self->_framingModeOverrides, 0);
  objc_storeStrong((id *)&self->_presetOverrides, 0);
  objc_storeStrong((id *)&self->_framingMode, 0);
}

@end
