@implementation AVTStickerGeneratorPosterOptions

- (AVTStickerGeneratorPosterOptions)init
{
  AVTStickerGeneratorPosterOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTStickerGeneratorPosterOptions;
  result = -[AVTStickerGeneratorPosterOptions init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_minimumHorizontalMargin = xmmword_1DD26A100;
    result->_size = (CGSize)vdupq_n_s64(0x4061800000000000uLL);
    result->_growsForExtraTallContent = 1;
  }
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)minimumHorizontalMargin
{
  return self->_minimumHorizontalMargin;
}

- (void)setMinimumHorizontalMargin:(double)a3
{
  self->_minimumHorizontalMargin = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (BOOL)growsForExtraTallContent
{
  return self->_growsForExtraTallContent;
}

- (void)setGrowsForExtraTallContent:(BOOL)a3
{
  self->_growsForExtraTallContent = a3;
}

@end
