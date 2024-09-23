@implementation AVTAvatarAttributeEditorPreviewModeOptions

- (AVTAvatarAttributeEditorPreviewModeOptions)initWithFramingMode:(id)a3 bodyPosePack:(id)a4
{
  id v7;
  id v8;
  AVTAvatarAttributeEditorPreviewModeOptions *v9;
  AVTAvatarAttributeEditorPreviewModeOptions *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarAttributeEditorPreviewModeOptions;
  v9 = -[AVTAvatarAttributeEditorPreviewModeOptions init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_framingMode, a3);
    objc_storeStrong((id *)&v10->_bodyPosePack, a4);
  }

  return v10;
}

- (NSString)framingMode
{
  return self->_framingMode;
}

- (NSString)bodyPosePack
{
  return self->_bodyPosePack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyPosePack, 0);
  objc_storeStrong((id *)&self->_framingMode, 0);
}

@end
