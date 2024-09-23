@implementation EMUbiquitouslyPersistedDictionaryMergeResult

- (EMUbiquitouslyPersistedDictionaryMergeResult)initWithChangedItems:(id)a3 deletedItems:(id)a4 requiresSynchronizing:(BOOL)a5
{
  id v9;
  id v10;
  EMUbiquitouslyPersistedDictionaryMergeResult *v11;
  EMUbiquitouslyPersistedDictionaryMergeResult *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMUbiquitouslyPersistedDictionaryMergeResult;
  v11 = -[EMUbiquitouslyPersistedDictionaryMergeResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_changedItems, a3);
    objc_storeStrong((id *)&v12->_deletedItems, a4);
    v12->_requiresSynchronizing = a5;
  }

  return v12;
}

- (NSDictionary)changedItems
{
  return self->_changedItems;
}

- (NSArray)deletedItems
{
  return self->_deletedItems;
}

- (BOOL)requiresSynchronizing
{
  return self->_requiresSynchronizing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedItems, 0);
  objc_storeStrong((id *)&self->_changedItems, 0);
}

@end
