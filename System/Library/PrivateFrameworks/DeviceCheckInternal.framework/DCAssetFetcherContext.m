@implementation DCAssetFetcherContext

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p - refreshAllowed: %d, ignoreMetadataCache: %d>"), v4, self, self->_allowCatalogRefresh, self->_ignoreCachedMetadata);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)allowCatalogRefresh
{
  return self->_allowCatalogRefresh;
}

- (void)setAllowCatalogRefresh:(BOOL)a3
{
  self->_allowCatalogRefresh = a3;
}

- (BOOL)ignoreCachedMetadata
{
  return self->_ignoreCachedMetadata;
}

- (void)setIgnoreCachedMetadata:(BOOL)a3
{
  self->_ignoreCachedMetadata = a3;
}

@end
