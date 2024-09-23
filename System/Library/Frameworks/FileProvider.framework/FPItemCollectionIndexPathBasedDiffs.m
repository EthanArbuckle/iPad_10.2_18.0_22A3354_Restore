@implementation FPItemCollectionIndexPathBasedDiffs

- (BOOL)containsChanges
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[FPItemCollectionIndexPathBasedDiffs movedSourceIndexPaths](self, "movedSourceIndexPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[FPItemCollectionIndexPathBasedDiffs movedDestinationIndexPaths](self, "movedDestinationIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;
  -[FPItemCollectionIndexPathBasedDiffs deletedIndexes](self, "deletedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[FPItemCollectionIndexPathBasedDiffs insertedIndexes](self, "insertedIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 + v8 + objc_msgSend(v9, "count");
  -[FPItemCollectionIndexPathBasedDiffs updatedIndexes](self, "updatedIndexes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = v10 + objc_msgSend(v11, "count") != 0;

  return v10;
}

- (NSMutableArray)movedSourceIndexPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMovedSourceIndexPaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)movedDestinationIndexPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMovedDestinationIndexPaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableIndexSet)deletedIndexes
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeletedIndexes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableIndexSet)insertedIndexes
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInsertedIndexes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableIndexSet)updatedIndexes
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUpdatedIndexes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
  objc_storeStrong((id *)&self->_movedDestinationIndexPaths, 0);
  objc_storeStrong((id *)&self->_movedSourceIndexPaths, 0);
}

@end
