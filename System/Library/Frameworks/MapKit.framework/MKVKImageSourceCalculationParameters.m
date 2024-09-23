@implementation MKVKImageSourceCalculationParameters

- (MKVKImageSourceCalculationParameters)initWithImageSourceKeys:(id)a3 scale:(double)a4
{
  id v6;
  MKVKImageSourceCalculationParameters *v7;
  uint64_t v8;
  NSArray *imageSourceKeys;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKVKImageSourceCalculationParameters;
  v7 = -[MKVKImageSourceCalculationParameters init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    imageSourceKeys = v7->_imageSourceKeys;
    v7->_imageSourceKeys = (NSArray *)v8;

    v7->_scale = a4;
  }

  return v7;
}

- (NSArray)imageSourceKeys
{
  return self->_imageSourceKeys;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSourceKeys, 0);
}

@end
