@implementation BCSBusinessItemMemoryCache

+ (id)sharedCache
{
  void *v0;

  objc_opt_self();
  v0 = (void *)_MergedGlobals_35;
  if (!_MergedGlobals_35)
  {
    if (qword_253EC0A58 != -1)
      dispatch_once(&qword_253EC0A58, &__block_literal_global_3);
    v0 = (void *)_MergedGlobals_35;
  }
  return v0;
}

void __41__BCSBusinessItemMemoryCache_sharedCache__block_invoke()
{
  BCSBusinessItemMemoryCache *v0;
  void *v1;

  v0 = objc_alloc_init(BCSBusinessItemMemoryCache);
  v1 = (void *)_MergedGlobals_35;
  _MergedGlobals_35 = (uint64_t)v0;

}

- (id)lastFetchedBusinessItemIconDataForBizItem:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "bizID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[2], "bizID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
      a1 = (id *)a1[3];
    else
      a1 = 0;
  }

  return a1;
}

- (void)setLastFetchedBusinesIconData:(void *)a3 withMatchingBusinessItem:
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 16), a3);
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)deleteCache
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    v3 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

- (void)setLastFetchedBusinessItem:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (id)itemMatching:(id)a3
{
  BCSBusinessItem *lastFetchedBusinessItem;
  BCSBusinessItem *v5;
  char v7;

  if (self)
  {
    if (!objc_msgSend(a3, "matchesItemIdentifying:", self->_lastFetchedBusinessItem))
    {
      v5 = 0;
      return v5;
    }
    lastFetchedBusinessItem = self->_lastFetchedBusinessItem;
  }
  else
  {
    v7 = objc_msgSend(a3, "matchesItemIdentifying:", 0);
    lastFetchedBusinessItem = 0;
    v5 = 0;
    if ((v7 & 1) == 0)
      return v5;
  }
  v5 = lastFetchedBusinessItem;
  return v5;
}

- (void)updateItem:(id)a3 withItemIdentifier:(id)a4
{
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[BCSBusinessItemMemoryCache setLastFetchedBusinessItem:]((uint64_t)self, v5);

}

- (void)deleteItemMatching:(id)a3
{
  BCSBusinessItemMemoryCache *v3;

  v3 = self;
  if (self)
    self = (BCSBusinessItemMemoryCache *)self->_lastFetchedBusinessItem;
  if (-[BCSBusinessItemMemoryCache matchesItemIdentifying:](self, "matchesItemIdentifying:", a3))
    -[BCSBusinessItemMemoryCache setLastFetchedBusinessItem:]((uint64_t)v3, 0);
}

- (void)deleteItemsOfType:(int64_t)a3
{
  if (a3 == 1)
    -[BCSBusinessItemMemoryCache deleteCache]((uint64_t)self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchedBusinessItemIconData, 0);
  objc_storeStrong((id *)&self->_bizItemForLastFetchedIcon, 0);
  objc_storeStrong((id *)&self->_lastFetchedBusinessItem, 0);
}

@end
