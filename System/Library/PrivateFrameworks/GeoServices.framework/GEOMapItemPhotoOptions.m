@implementation GEOMapItemPhotoOptions

- (GEOMapItemPhotoOptions)initWithAllowSmaller:(BOOL)a3 cropStyle:(int64_t)a4 format:(int64_t)a5
{
  GEOMapItemPhotoOptions *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOMapItemPhotoOptions;
  result = -[GEOMapItemPhotoOptions init](&v9, sel_init);
  if (result)
  {
    result->_allowSmaller = a3;
    result->_preferredCropStyle = a4;
    result->_preferredFormat = a5;
  }
  return result;
}

+ (id)defaultPhotoOptionsWithAllowSmaller:(BOOL)a3
{
  return -[GEOMapItemPhotoOptions initWithAllowSmaller:cropStyle:format:]([GEOMapItemPhotoOptions alloc], "initWithAllowSmaller:cropStyle:format:", a3, 0, 0);
}

+ (id)defaultPhotoOptionsWithCropStyle:(int64_t)a3
{
  return -[GEOMapItemPhotoOptions initWithAllowSmaller:cropStyle:format:]([GEOMapItemPhotoOptions alloc], "initWithAllowSmaller:cropStyle:format:", 1, a3, 0);
}

- (BOOL)allowSmaller
{
  return self->_allowSmaller;
}

- (int64_t)preferredCropStyle
{
  return self->_preferredCropStyle;
}

- (int64_t)preferredFormat
{
  return self->_preferredFormat;
}

@end
