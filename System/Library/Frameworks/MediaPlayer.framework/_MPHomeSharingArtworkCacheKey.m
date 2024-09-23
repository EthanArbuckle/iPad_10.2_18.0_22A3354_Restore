@implementation _MPHomeSharingArtworkCacheKey

- (_MPHomeSharingArtworkCacheKey)initWithPersistentID:(unint64_t)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  _MPHomeSharingArtworkCacheKey *result;
  objc_super v8;

  height = a4.height;
  width = a4.width;
  v8.receiver = self;
  v8.super_class = (Class)_MPHomeSharingArtworkCacheKey;
  result = -[_MPHomeSharingArtworkCacheKey init](&v8, sel_init);
  if (result)
  {
    result->_persistentID = a3;
    result->_size.width = width;
    result->_size.height = height;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v15;
  BOOL v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "persistentID");
    v7 = -[_MPHomeSharingArtworkCacheKey persistentID](self, "persistentID");
    objc_msgSend(v5, "size");
    v9 = v8;
    v11 = v10;

    -[_MPHomeSharingArtworkCacheKey size](self, "size");
    v15 = v9 == v13 && v6 == v7;
    v16 = v11 == v12 && v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t persistentID;
  double v4;
  unint64_t v5;
  double v6;

  persistentID = self->_persistentID;
  -[_MPHomeSharingArtworkCacheKey size](self, "size");
  v5 = llround(v4) ^ persistentID;
  -[_MPHomeSharingArtworkCacheKey size](self, "size");
  return v5 ^ llround(v6);
}

- (unint64_t)persistentID
{
  return self->_persistentID;
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

@end
