@implementation ACDKeychainItemCache

- (NSMutableDictionary)nonSyncableItems
{
  NSMutableDictionary *nonSyncableItems;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  nonSyncableItems = self->_nonSyncableItems;
  if (!nonSyncableItems)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_nonSyncableItems;
    self->_nonSyncableItems = v4;

    nonSyncableItems = self->_nonSyncableItems;
  }
  return nonSyncableItems;
}

- (NSMutableDictionary)syncableItems
{
  NSMutableDictionary *syncableItems;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  syncableItems = self->_syncableItems;
  if (!syncableItems)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_syncableItems;
    self->_syncableItems = v4;

    syncableItems = self->_syncableItems;
  }
  return syncableItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncableItems, 0);
  objc_storeStrong((id *)&self->_nonSyncableItems, 0);
}

@end
