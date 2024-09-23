@implementation _AAUIRawImageAndCropRectCacheEntry

+ (id)entryWithRawImage:(id)a3 rawCropRect:(CGRect)a4 serverCacheTag:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIImage *v10;
  id v11;
  _AAUIRawImageAndCropRectCacheEntry *v12;
  UIImage *rawImage;
  UIImage *v14;
  uint64_t v15;
  NSString *serverCacheTag;
  void *v17;
  uint64_t v18;
  NSDate *expirationDate;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = (UIImage *)a3;
  v11 = a5;
  v12 = objc_alloc_init(_AAUIRawImageAndCropRectCacheEntry);
  rawImage = v12->_rawImage;
  v12->_rawImage = v10;
  v14 = v10;

  v12->_rawCropRect.origin.x = x;
  v12->_rawCropRect.origin.y = y;
  v12->_rawCropRect.size.width = width;
  v12->_rawCropRect.size.height = height;
  v15 = objc_msgSend(v11, "copy");

  serverCacheTag = v12->_serverCacheTag;
  v12->_serverCacheTag = (NSString *)v15;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dateByAddingTimeInterval:", 60.0);
  v18 = objc_claimAutoreleasedReturnValue();
  expirationDate = v12->_expirationDate;
  v12->_expirationDate = (NSDate *)v18;

  return v12;
}

- (BOOL)isValid
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "compare:", self->_expirationDate) != 1;

  return (char)self;
}

- (UIImage)rawImage
{
  return self->_rawImage;
}

- (CGRect)rawCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rawCropRect.origin.x;
  y = self->_rawCropRect.origin.y;
  width = self->_rawCropRect.size.width;
  height = self->_rawCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)serverCacheTag
{
  return self->_serverCacheTag;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_serverCacheTag, 0);
  objc_storeStrong((id *)&self->_rawImage, 0);
}

@end
