@implementation AVTAvatarAttributeEditorPreviewMode

+ (unint64_t)attributeEditorPreviewModeTypeForEditingPreviewModeType:(unint64_t)a3
{
  return a3 == 1;
}

- (AVTAvatarAttributeEditorPreviewMode)initWithType:(unint64_t)a3 options:(id)a4
{
  id v7;
  AVTAvatarAttributeEditorPreviewMode *v8;
  AVTAvatarAttributeEditorPreviewMode *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarAttributeEditorPreviewMode;
  v8 = -[AVTAvatarAttributeEditorPreviewMode init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (AVTAvatarAttributeEditorPreviewModeOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
