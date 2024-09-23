@implementation _MPMediaLibraryArtworkDataSourceCacheKey

- (void).cxx_destruct
{
  objc_storeStrong(&self->_catalogIdentifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "catalogIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPMediaLibraryArtworkDataSourceCacheKey catalogIdentifier](self, "catalogIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    objc_msgSend(v5, "representationSize");
    v10 = v9;
    v12 = v11;

    -[_MPMediaLibraryArtworkDataSourceCacheKey representationSize](self, "representationSize");
    if (v10 == v14)
      v15 = v8;
    else
      v15 = 0;
    v16 = v12 == v13 && v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)catalogIdentifier
{
  return self->_catalogIdentifier;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;

  -[_MPMediaLibraryArtworkDataSourceCacheKey catalogIdentifier](self, "catalogIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_MPMediaLibraryArtworkDataSourceCacheKey representationSize](self, "representationSize");
  v6 = v4 ^ (unint64_t)v5;
  -[_MPMediaLibraryArtworkDataSourceCacheKey representationSize](self, "representationSize");
  v8 = v6 ^ (unint64_t)v7;

  return v8;
}

- (CGSize)representationSize
{
  double width;
  double height;
  CGSize result;

  width = self->_representationSize.width;
  height = self->_representationSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (_MPMediaLibraryArtworkDataSourceCacheKey)initWithArtworkCatalog:(id)a3 representativeSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  _MPMediaLibraryArtworkDataSourceCacheKey *v8;
  uint64_t v9;
  id catalogIdentifier;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MPMediaLibraryArtworkDataSourceCacheKey;
  v8 = -[_MPMediaLibraryArtworkDataSourceCacheKey init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "visualIdenticalityIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    catalogIdentifier = v8->_catalogIdentifier;
    v8->_catalogIdentifier = (id)v9;

    v8->_representationSize.width = width;
    v8->_representationSize.height = height;
  }

  return v8;
}

- (void)setCatalogIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setRepresentationSize:(CGSize)a3
{
  self->_representationSize = a3;
}

@end
