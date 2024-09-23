@implementation BRCRecentsEnumeratorBatch

- (BRCRecentsEnumeratorBatch)initWithBatchSize:(unint64_t)a3
{
  BRCRecentsEnumeratorBatch *v4;
  uint64_t v5;
  NSFileProviderItem *toIndexItems;
  uint64_t v7;
  NSMutableArray *deletedItemIDs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRCRecentsEnumeratorBatch;
  v4 = -[BRCRecentsEnumeratorBatch init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    toIndexItems = v4->_toIndexItems;
    v4->_toIndexItems = (NSFileProviderItem *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    deletedItemIDs = v4->_deletedItemIDs;
    v4->_deletedItemIDs = (NSMutableArray *)v7;

  }
  return v4;
}

- (void)addIndexOfItem:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  +[BRCNotification notificationGatheredFromItem:](BRCNotification, "notificationGatheredFromItem:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDocumentsFolder");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0D10EB8];
    objc_msgSend(v12, "appLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerItemForContainer:withRepresentativeItem:", v9, v4);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }
  objc_msgSend(v4, "asFileProviderItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NSFileProviderItem addObject:](self->_toIndexItems, "addObject:", v11);
    -[BRCRecentsEnumeratorBatch setRank:](self, "setRank:", objc_msgSend(v12, "notifsRank"));
  }

}

- (void)addDeletionOfFileObjectID:(id)a3 rank:(unint64_t)a4
{
  -[NSMutableArray addObject:](self->_deletedItemIDs, "addObject:", a3);
  -[BRCRecentsEnumeratorBatch setRank:](self, "setRank:", a4);
}

- (unint64_t)batchCount
{
  uint64_t v3;

  v3 = -[NSFileProviderItem count](self->_toIndexItems, "count");
  return -[NSMutableArray count](self->_deletedItemIDs, "count") + v3;
}

- (void)setRank:(unint64_t)a3
{
  void *v5;
  NSObject *v6;

  if (self->_rank > a3)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCRecentsEnumeratorBatch setRank:].cold.1();

  }
  self->_rank = a3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, %lu indexed, %lu deleted>"), objc_opt_class(), self, -[NSFileProviderItem count](self->_toIndexItems, "count"), -[NSMutableArray count](self->_deletedItemIDs, "count"));
}

- (void)listItems:(id)a3
{
  if (a3)
    (*((void (**)(id, NSFileProviderItem *, NSMutableArray *))a3 + 2))(a3, self->_toIndexItems, self->_deletedItemIDs);
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deletedItemIDs, 0);
  objc_storeStrong((id *)&self->_toIndexItems, 0);
}

- (void)setRank:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: rank >= _rank%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
