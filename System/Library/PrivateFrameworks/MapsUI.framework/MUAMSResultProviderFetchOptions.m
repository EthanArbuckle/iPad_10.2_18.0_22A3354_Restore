@implementation MUAMSResultProviderFetchOptions

- (MUAMSResultProviderFetchOptions)initWithDisplayScale:(double)a3 artworkSize:(CGSize)a4 source:(int64_t)a5
{
  CGFloat height;
  CGFloat width;
  MUAMSResultProviderFetchOptions *result;
  objc_super v10;

  height = a4.height;
  width = a4.width;
  v10.receiver = self;
  v10.super_class = (Class)MUAMSResultProviderFetchOptions;
  result = -[MUAMSResultProviderFetchOptions init](&v10, sel_init);
  if (result)
  {
    result->_displayScale = a3;
    result->_artworkSize.width = width;
    result->_artworkSize.height = height;
    result->_source = a5;
  }
  return result;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (CGSize)artworkSize
{
  double width;
  double height;
  CGSize result;

  width = self->_artworkSize.width;
  height = self->_artworkSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setArtworkSize:(CGSize)a3
{
  self->_artworkSize = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

@end
