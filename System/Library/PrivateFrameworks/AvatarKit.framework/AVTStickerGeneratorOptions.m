@implementation AVTStickerGeneratorOptions

- (AVTStickerGeneratorOptions)init
{
  AVTStickerGeneratorOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTStickerGeneratorOptions;
  result = -[AVTStickerGeneratorOptions init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_size = xmmword_1DD26A0F0;
    result->_scaleFactor = 3.0;
    result->_contentMode = 0;
    result->_useLegacyCorrectClippingImplementation = 0;
  }
  return result;
}

+ (id)defaultOptions
{
  return objc_alloc_init((Class)a1);
}

+ (id)optionsWithCorrectClipping:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;

  v3 = a3;
  objc_msgSend(a1, "defaultOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", v3);
  return v4;
}

- (BOOL)correctClipping
{
  return self->_contentMode == 1;
}

- (void)setCorrectClipping:(BOOL)a3
{
  self->_contentMode = a3;
}

- (double)size
{
  return self->_size;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (double)sizeMultiplier
{
  return self->_sizeMultiplier;
}

- (void)setSizeMultiplier:(double)a3
{
  self->_sizeMultiplier = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (unint64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentMode:(unint64_t)a3
{
  self->_contentMode = a3;
}

- (BOOL)useLegacyCorrectClippingImplementation
{
  return self->_useLegacyCorrectClippingImplementation;
}

- (void)setUseLegacyCorrectClippingImplementation:(BOOL)a3
{
  self->_useLegacyCorrectClippingImplementation = a3;
}

@end
