@implementation PKLRUCacheKey

- (BOOL)isEqual:(id)a3
{
  PKLRUCacheKey *v4;
  PKLRUCacheKey *v5;
  NSCopying *key;
  NSCopying *v7;
  NSCopying *v8;
  NSCopying *v9;
  int64_t scaleFactor;
  int64_t v11;
  BOOL v12;

  v4 = (PKLRUCacheKey *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self)
        key = self->_key;
      else
        key = 0;
      v7 = key;
      v8 = v7;
      if (v5)
        v9 = v5->_key;
      else
        v9 = 0;
      if (!-[NSCopying isEqual:](v7, "isEqual:", v9))
      {
        v12 = 0;
        goto LABEL_15;
      }
      if (self)
      {
        scaleFactor = self->_scaleFactor;
        if (v5)
        {
LABEL_10:
          v11 = v5->_scaleFactor;
LABEL_11:
          v12 = scaleFactor == v11;
LABEL_15:

          goto LABEL_16;
        }
      }
      else
      {
        scaleFactor = 0;
        if (v5)
          goto LABEL_10;
      }
      v11 = 0;
      goto LABEL_11;
    }
    v12 = 0;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  NSCopying *key;
  NSCopying *v4;
  uint64_t v5;
  unint64_t scaleFactor;
  unint64_t v7;
  unint64_t v8;

  if (self)
    key = self->_key;
  else
    key = 0;
  v4 = key;
  v5 = -[NSCopying hash](v4, "hash");
  if (self)
    scaleFactor = self->_scaleFactor;
  else
    scaleFactor = 0;
  v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (scaleFactor ^ (scaleFactor >> 30))) ^ ((0xBF58476D1CE4E5B9
                                                                       * (scaleFactor ^ (scaleFactor >> 30))) >> 27));
  v8 = v5 ^ (v7 >> 31) ^ v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
