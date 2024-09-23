@implementation SUUIImageViewElementCacheKey

- (SUUIImageViewElementCacheKey)initWithURL:(id)a3 size:(CGSize)a4 imageTreatment:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  SUUIImageViewElementCacheKey *v12;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SUUIImageViewElementCacheKey;
  v12 = -[SUUIImageViewElementCacheKey init](&v14, sel_init);
  if (v12)
  {
    v12->_imageTreatment = SUUIImageTreatmentForString(v11);
    v12->_size.width = width;
    v12->_size.height = height;
    objc_storeStrong((id *)&v12->_url, a3);
  }

  return v12;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_url, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SUUIImageViewElementCacheKey *v4;
  uint64_t v5;
  char v6;

  v4 = (SUUIImageViewElementCacheKey *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && *(uint64_t *)&self->_size.height == *(uint64_t *)&v4->_size.height
      && *(uint64_t *)&self->_size.width == *(uint64_t *)&v4->_size.width
      && self->_imageTreatment == v4->_imageTreatment)
    {
      v6 = -[NSURL isEqual:](self->_url, "isEqual:", v4->_url);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
