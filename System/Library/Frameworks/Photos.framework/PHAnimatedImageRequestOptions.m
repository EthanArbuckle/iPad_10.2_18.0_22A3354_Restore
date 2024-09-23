@implementation PHAnimatedImageRequestOptions

- (PHAnimatedImageRequestOptions)init
{
  PHAnimatedImageRequestOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHAnimatedImageRequestOptions;
  result = -[PHImageRequestOptions init](&v3, sel_init);
  if (result)
  {
    result->_allowPreCaching = 1;
    result->_useSharedImageDecoding = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHAnimatedImageRequestOptions;
  v4 = -[PHImageRequestOptions copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAllowPreCaching:", self->_allowPreCaching);
  objc_msgSend(v4, "setUseSharedImageDecoding:", self->_useSharedImageDecoding);
  return v4;
}

- (BOOL)allowPreCaching
{
  return self->_allowPreCaching;
}

- (void)setAllowPreCaching:(BOOL)a3
{
  self->_allowPreCaching = a3;
}

- (BOOL)useSharedImageDecoding
{
  return self->_useSharedImageDecoding;
}

- (void)setUseSharedImageDecoding:(BOOL)a3
{
  self->_useSharedImageDecoding = a3;
}

@end
