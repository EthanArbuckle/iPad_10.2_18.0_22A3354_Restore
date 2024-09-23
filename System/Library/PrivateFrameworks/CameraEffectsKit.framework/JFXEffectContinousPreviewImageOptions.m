@implementation JFXEffectContinousPreviewImageOptions

- (id)initImageOptionsWithFrameRate:(unint64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXEffectContinousPreviewImageOptions;
  result = -[JFXEffectContinousPreviewOptions initContinousPreviewOptions](&v5, sel_initContinousPreviewOptions);
  if (result)
    *((_QWORD *)result + 11) = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXEffectContinousPreviewImageOptions;
  result = -[JFXEffectContinousPreviewOptions copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 11) = self->_preferredUpdatesPerSecond;
  return result;
}

- (unint64_t)preferredUpdatesPerSecond
{
  return self->_preferredUpdatesPerSecond;
}

- (JTImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

@end
