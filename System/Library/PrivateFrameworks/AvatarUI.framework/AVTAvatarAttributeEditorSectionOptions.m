@implementation AVTAvatarAttributeEditorSectionOptions

- (AVTAvatarAttributeEditorSectionOptions)initWithFramingMode:(id)a3 poseOverride:(id)a4 presetOverrides:(id)a5 displayMode:(unint64_t)a6 stickerConfiguration:(id)a7 showsLabel:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  AVTAvatarAttributeEditorSectionOptions *v18;
  AVTAvatarAttributeEditorSectionOptions *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)AVTAvatarAttributeEditorSectionOptions;
  v18 = -[AVTAvatarAttributeEditorSectionOptions init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_framingMode, a3);
    objc_storeStrong((id *)&v19->_poseOverride, a4);
    objc_storeStrong((id *)&v19->_presetOverrides, a5);
    v19->_displayMode = a6;
    objc_storeStrong((id *)&v19->_stickerConfiguration, a7);
    v19->_showsLabel = a8;
  }

  return v19;
}

- (id)stringForDisplayMode
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[AVTAvatarAttributeEditorSectionOptions displayMode](self, "displayMode");
  v3 = CFSTR("unknown");
  if (v2 == 1)
    v3 = CFSTR("highlightPicker");
  if (v2)
    return (id)v3;
  else
    return CFSTR("section");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarAttributeEditorSectionOptions;
  -[AVTAvatarAttributeEditorSectionOptions description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTAvatarAttributeEditorSectionOptions framingMode](self, "framingMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionOptions stringForDisplayMode](self, "stringForDisplayMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionOptions poseOverride](self, "poseOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionOptions presetOverrides](self, "presetOverrides");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avt_description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionOptions stickerConfiguration](self, "stickerConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" framingMode: %@, displayMode: %@, poseOverride: %@, presetOverrides: %@, stickerConfiguration:  %@ showsLabel:%i"), v5, v6, v7, v9, v11, -[AVTAvatarAttributeEditorSectionOptions showsLabel](self, "showsLabel"));

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (NSString)framingMode
{
  return self->_framingMode;
}

- (AVTAvatarPose)poseOverride
{
  return self->_poseOverride;
}

- (NSArray)presetOverrides
{
  return self->_presetOverrides;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
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
  objc_storeStrong((id *)&self->_presetOverrides, 0);
  objc_storeStrong((id *)&self->_poseOverride, 0);
  objc_storeStrong((id *)&self->_framingMode, 0);
}

@end
