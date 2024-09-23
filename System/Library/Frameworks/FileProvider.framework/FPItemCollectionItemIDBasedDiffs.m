@implementation FPItemCollectionItemIDBasedDiffs

- (BOOL)containsChanges
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[FPItemCollectionItemIDBasedDiffs deletedItemIDs](self, "deletedItemIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[FPItemCollectionItemIDBasedDiffs updatedItems](self, "updatedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;
  -[FPItemCollectionItemIDBasedDiffs replacedItemsByFormerID](self, "replacedItemsByFormerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = v6 + objc_msgSend(v7, "count") != 0;

  return v6;
}

- (NSMutableArray)deletedItemIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeletedItemIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)updatedItems
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUpdatedItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)replacedItemsByFormerID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReplacedItemsByFormerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacedItemsByFormerID, 0);
  objc_storeStrong((id *)&self->_updatedItems, 0);
  objc_storeStrong((id *)&self->_deletedItemIDs, 0);
}

@end
