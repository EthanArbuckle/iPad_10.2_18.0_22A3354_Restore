@implementation DOCThumbnailCache

- (NSMapTable)cachedThumbnailNodes
{
  return self->_cachedThumbnailNodes;
}

- (NSCache)recentlyUsedNodes
{
  return self->_recentlyUsedNodes;
}

- (DOCThumbnailCache)init
{
  DOCThumbnailCache *v2;
  uint64_t v3;
  NSMapTable *cachedThumbnailNodes;
  NSCache *v5;
  NSCache *recentlyUsedNodes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DOCThumbnailCache;
  v2 = -[DOCThumbnailCache init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    cachedThumbnailNodes = v2->_cachedThumbnailNodes;
    v2->_cachedThumbnailNodes = (NSMapTable *)v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    recentlyUsedNodes = v2->_recentlyUsedNodes;
    v2->_recentlyUsedNodes = v5;

    -[NSCache setCountLimit:](v2->_recentlyUsedNodes, "setCountLimit:", maxCachedNodes);
    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v2->_recentlyUsedNodes, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
  }
  return v2;
}

- (void)clear
{
  id v2;

  -[DOCThumbnailCache recentlyUsedNodes](self, "recentlyUsedNodes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyUsedNodes, 0);
  objc_storeStrong((id *)&self->_cachedThumbnailNodes, 0);
}

@end
