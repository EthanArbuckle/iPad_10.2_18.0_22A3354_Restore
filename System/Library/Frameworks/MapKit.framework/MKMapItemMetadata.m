@implementation MKMapItemMetadata

- (MKMapItemMetadata)initWithBusiness:(id)a3
{
  id v5;
  MKMapItemMetadata *v6;
  MKMapItemMetadata *v7;
  MKMapItemMetadata *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKMapItemMetadata;
  v6 = -[MKMapItemMetadata init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_business, a3);
    v8 = v7;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MKMapItemMetadata;
  -[MKMapItemMetadata description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: business: %@ imageCache: %@"), v4, self->_business, self->_imageCache);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSMutableDictionary)imageCache
{
  NSMutableDictionary *imageCache;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  imageCache = self->_imageCache;
  if (!imageCache)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_imageCache;
    self->_imageCache = v4;

    imageCache = self->_imageCache;
  }
  return imageCache;
}

- (void)addImage:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[MKMapItemMetadata imageCache](self, "imageCache");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v6);

  }
}

- (id)imageForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MKMapItemMetadata imageCache](self, "imageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GEOBusiness)business
{
  return self->_business;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_business, 0);
}

@end
