@implementation MediaControlsCollectionViewCountData

- (MediaControlsCollectionViewCountData)init
{
  MediaControlsCollectionViewCountData *v2;
  NSMutableIndexSet *v3;
  NSMutableIndexSet *insertedIndexes;
  NSMutableIndexSet *v5;
  NSMutableIndexSet *deletedIndexes;
  NSMutableIndexSet *v7;
  NSMutableIndexSet *updatedIndexes;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MediaControlsCollectionViewCountData;
  v2 = -[MediaControlsCollectionViewCountData init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    insertedIndexes = v2->_insertedIndexes;
    v2->_insertedIndexes = v3;

    v5 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    deletedIndexes = v2->_deletedIndexes;
    v2->_deletedIndexes = v5;

    v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    updatedIndexes = v2->_updatedIndexes;
    v2->_updatedIndexes = v7;

  }
  return v2;
}

- (MediaControlsCollectionViewCountData)initWithNumberOfItems:(int64_t)a3
{
  MediaControlsCollectionViewCountData *result;

  result = -[MediaControlsCollectionViewCountData init](self, "init");
  if (result)
    result->_numberOfItems = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MediaControlsCollectionViewCountData initWithNumberOfItems:]([MediaControlsCollectionViewCountData alloc], "initWithNumberOfItems:", self->_numberOfItems);
}

- (NSIndexSet)insertedIndexes
{
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](self->_insertedIndexes, "copy");
}

- (NSIndexSet)deletedIndexes
{
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](self->_deletedIndexes, "copy");
}

- (NSIndexSet)updatedIndexes
{
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](self->_updatedIndexes, "copy");
}

- (void)insertItemAtIndex:(int64_t)a3
{
  self->_hasPendingChanges = 1;
  -[NSMutableIndexSet addIndex:](self->_insertedIndexes, "addIndex:", a3);
}

- (void)insertItemsAtIndexes:(id)a3
{
  self->_hasPendingChanges = 1;
  -[NSMutableIndexSet addIndexes:](self->_insertedIndexes, "addIndexes:", a3);
}

- (void)deleteItemAtIndex:(int64_t)a3
{
  self->_hasPendingChanges = 1;
  -[NSMutableIndexSet addIndex:](self->_deletedIndexes, "addIndex:", a3);
}

- (void)deleteItemsAtIndexes:(id)a3
{
  self->_hasPendingChanges = 1;
  -[NSMutableIndexSet addIndexes:](self->_deletedIndexes, "addIndexes:", a3);
}

- (void)moveItemAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  self->_hasPendingChanges = 1;
  -[NSMutableIndexSet addIndex:](self->_deletedIndexes, "addIndex:", a3);
  -[NSMutableIndexSet addIndex:](self->_insertedIndexes, "addIndex:", a4);
}

- (void)reloadItemAtIndex:(int64_t)a3
{
  self->_hasPendingChanges = 1;
  -[NSMutableIndexSet addIndex:](self->_updatedIndexes, "addIndex:", a3);
}

- (void)reloadItemsAtIndexes:(id)a3
{
  self->_hasPendingChanges = 1;
  -[NSMutableIndexSet addIndexes:](self->_updatedIndexes, "addIndexes:", a3);
}

- (void)applyChanges
{
  uint64_t v3;

  v3 = -[NSMutableIndexSet count](self->_insertedIndexes, "count");
  self->_numberOfItems += v3 - -[NSMutableIndexSet count](self->_deletedIndexes, "count");
  -[NSMutableIndexSet removeAllIndexes](self->_insertedIndexes, "removeAllIndexes");
  -[NSMutableIndexSet removeAllIndexes](self->_deletedIndexes, "removeAllIndexes");
  -[NSMutableIndexSet removeAllIndexes](self->_updatedIndexes, "removeAllIndexes");
  self->_hasPendingChanges = 0;
}

- (BOOL)validateCountForNumberOfItems:(int64_t)a3
{
  uint64_t v5;

  v5 = -[NSMutableIndexSet count](self->_insertedIndexes, "count");
  return v5 - -[NSMutableIndexSet count](self->_deletedIndexes, "count") + self->_numberOfItems == a3;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (void)setNumberOfItems:(int64_t)a3
{
  self->_numberOfItems = a3;
}

- (BOOL)hasPendingChanges
{
  return self->_hasPendingChanges;
}

- (void)setHasPendingChanges:(BOOL)a3
{
  self->_hasPendingChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedIndexes, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
}

@end
