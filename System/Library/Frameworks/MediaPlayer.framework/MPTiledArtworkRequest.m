@implementation MPTiledArtworkRequest

- (MPTiledArtworkRequest)init
{
  MPTiledArtworkRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPTiledArtworkRequest;
  result = -[MPTiledArtworkRequest init](&v3, sel_init);
  if (result)
    result->_cacheLock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPTiledArtworkRequest *v5;
  uint64_t v6;
  id artworkCatalogsBlock;
  uint64_t v8;
  NSCopying *entityIdentifier;
  uint64_t v10;
  NSCopying *namespaceIdentifier;
  uint64_t v12;
  NSCopying *revisionIdentifier;

  v5 = objc_alloc_init(MPTiledArtworkRequest);
  if (v5)
  {
    v6 = objc_msgSend(self->_artworkCatalogsBlock, "copy");
    artworkCatalogsBlock = v5->_artworkCatalogsBlock;
    v5->_artworkCatalogsBlock = (id)v6;

    v5->_allowsSynchronousArtworkCatalogsBlockExecution = self->_allowsSynchronousArtworkCatalogsBlockExecution;
    v5->_numberOfColumns = self->_numberOfColumns;
    v5->_numberOfRows = self->_numberOfRows;
    v5->_tileSpacing = self->_tileSpacing;
    v8 = -[NSCopying copyWithZone:](self->_entityIdentifier, "copyWithZone:", a3);
    entityIdentifier = v5->_entityIdentifier;
    v5->_entityIdentifier = (NSCopying *)v8;

    v10 = -[NSCopying copyWithZone:](self->_namespaceIdentifier, "copyWithZone:", a3);
    namespaceIdentifier = v5->_namespaceIdentifier;
    v5->_namespaceIdentifier = (NSCopying *)v10;

    v12 = -[NSCopying copyWithZone:](self->_revisionIdentifier, "copyWithZone:", a3);
    revisionIdentifier = v5->_revisionIdentifier;
    v5->_revisionIdentifier = (NSCopying *)v12;

  }
  return v5;
}

- (id)artworkCatalogsWithCount:(unint64_t)a3
{
  os_unfair_lock_s *p_cacheLock;
  void (**artworkCatalogsBlock)(id, unint64_t);
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  unint64_t artworkCatalogsCacheCount;
  uint64_t v11;
  NSArray *artworkCatalogsCache;
  unint64_t v13;
  unint64_t v14;
  void *v15;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  if (self->_artworkCatalogsCacheCount >= a3)
  {
    artworkCatalogsCache = self->_artworkCatalogsCache;
    v13 = -[NSArray count](artworkCatalogsCache, "count");
    if (v13 >= a3)
      v14 = a3;
    else
      v14 = v13;
    -[NSArray subarrayWithRange:](artworkCatalogsCache, "subarrayWithRange:", 0, v14);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    artworkCatalogsBlock = (void (**)(id, unint64_t))self->_artworkCatalogsBlock;
    if (!artworkCatalogsBlock)
    {
      v15 = 0;
      goto LABEL_12;
    }
    artworkCatalogsBlock[2](artworkCatalogsBlock, a3);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_artworkCatalogsCache;
    self->_artworkCatalogsCache = v7;

    v9 = self->_artworkCatalogsCache;
    artworkCatalogsCacheCount = self->_artworkCatalogsCacheCount;
    if (artworkCatalogsCacheCount <= a3)
      artworkCatalogsCacheCount = a3;
    self->_artworkCatalogsCacheCount = artworkCatalogsCacheCount;
    v11 = -[NSArray copy](v9, "copy");
  }
  v15 = (void *)v11;
LABEL_12:
  os_unfair_lock_unlock(p_cacheLock);
  return v15;
}

- (id)existingArtworkCatalogsWithCount:(int64_t)a3
{
  void *v5;
  os_unfair_lock_s *p_cacheLock;
  NSArray *artworkCatalogsCache;
  unint64_t v8;
  int64_t v9;

  if (-[MPTiledArtworkRequest allowsSynchronousArtworkCatalogsBlockExecution](self, "allowsSynchronousArtworkCatalogsBlockExecution"))
  {
    -[MPTiledArtworkRequest artworkCatalogsWithCount:](self, "artworkCatalogsWithCount:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    artworkCatalogsCache = self->_artworkCatalogsCache;
    v8 = -[NSArray count](artworkCatalogsCache, "count");
    if (v8 >= a3)
      v9 = a3;
    else
      v9 = v8;
    -[NSArray subarrayWithRange:](artworkCatalogsCache, "subarrayWithRange:", 0, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_cacheLock);
  }
  return v5;
}

- (BOOL)hasExistingArtworkCatalogsWithCount:(int64_t)a3
{
  BOOL v5;

  if (-[MPTiledArtworkRequest allowsSynchronousArtworkCatalogsBlockExecution](self, "allowsSynchronousArtworkCatalogsBlockExecution"))
  {
    return 1;
  }
  os_unfair_lock_lock(&self->_cacheLock);
  v5 = self->_artworkCatalogsCacheCount >= a3;
  os_unfair_lock_unlock(&self->_cacheLock);
  return v5;
}

- (id)artworkCatalogsBlock
{
  return self->_artworkCatalogsBlock;
}

- (void)setArtworkCatalogsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)allowsSynchronousArtworkCatalogsBlockExecution
{
  return self->_allowsSynchronousArtworkCatalogsBlockExecution;
}

- (void)setAllowsSynchronousArtworkCatalogsBlockExecution:(BOOL)a3
{
  self->_allowsSynchronousArtworkCatalogsBlockExecution = a3;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  self->_numberOfRows = a3;
}

- (double)tileSpacing
{
  return self->_tileSpacing;
}

- (void)setTileSpacing:(double)a3
{
  self->_tileSpacing = a3;
}

- (NSCopying)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSCopying)namespaceIdentifier
{
  return self->_namespaceIdentifier;
}

- (void)setNamespaceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSCopying)revisionIdentifier
{
  return self->_revisionIdentifier;
}

- (void)setRevisionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revisionIdentifier, 0);
  objc_storeStrong((id *)&self->_namespaceIdentifier, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong(&self->_artworkCatalogsBlock, 0);
  objc_storeStrong((id *)&self->_artworkCatalogsCache, 0);
}

@end
