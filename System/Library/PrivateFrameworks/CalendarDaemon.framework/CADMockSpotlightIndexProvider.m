@implementation CADMockSpotlightIndexProvider

- (CADMockSpotlightIndexProvider)init
{
  return -[CADMockSpotlightIndexProvider initWithMinArtificialDelay:maxArtificialDelay:failureMode:](self, "initWithMinArtificialDelay:maxArtificialDelay:failureMode:", 0, 0.0, 0.0);
}

- (CADMockSpotlightIndexProvider)initWithMinArtificialDelay:(double)a3 maxArtificialDelay:(double)a4 failureMode:(unint64_t)a5
{
  CADMockSpotlightIndexProvider *v8;
  CADMockSpotlightIndexProvider *v9;
  uint64_t v10;
  NSMutableArray *store;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CADMockSpotlightIndexProvider;
  v8 = -[CADMockSpotlightIndexProvider init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_minArtificialDelay = a3;
    v8->_maxArtificialDelay = a4;
    v8->_failureMode = a5;
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    store = v9->_store;
    v9->_store = (NSMutableArray *)v10;

  }
  return v9;
}

- (void)setFailureMode:(unint64_t)a3
{
  self->_failureMode = a3;
  -[CADMockSpotlightIndexProvider setNumCalls:](self, "setNumCalls:", 0);
}

- (id)newSpotlightIndexForBundleID:(id)a3
{
  return -[CADMockSpotlightIndex initWithProvider:]([CADMockSpotlightIndex alloc], "initWithProvider:", self);
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableArray *store;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  store = self->_store;
  v7 = (void *)MEMORY[0x1E0CB3880];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__CADMockSpotlightIndexProvider_deleteSearchableItemsWithDomainIdentifiers___block_invoke;
  v10[3] = &unk_1E6A37678;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "predicateWithBlock:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](store, "filterUsingPredicate:", v9);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __76__CADMockSpotlightIndexProvider_deleteSearchableItemsWithDomainIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend(v3, "domainIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v10, "hasPrefix:", v9);

        if ((v9 & 1) != 0)
        {
          v11 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (void)indexSearchableItems:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *store;
  uint64_t v11;
  id obj;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        os_unfair_lock_lock(&self->_lock);
        store = self->_store;
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __54__CADMockSpotlightIndexProvider_indexSearchableItems___block_invoke;
        v13[3] = &unk_1E6A376A0;
        v13[4] = v9;
        v11 = -[NSMutableArray indexOfObjectPassingTest:](store, "indexOfObjectPassingTest:", v13);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          -[NSMutableArray removeObjectAtIndex:](self->_store, "removeObjectAtIndex:", v11);
        -[NSMutableArray addObject:](self->_store, "addObject:", v9);
        os_unfair_lock_unlock(&self->_lock);
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

uint64_t __54__CADMockSpotlightIndexProvider_indexSearchableItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)deleteAllSearchableItemsForBundleID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CADMockSpotlightIndexProvider deleteSearchableItemsWithDomainIdentifiers:](self, "deleteSearchableItemsWithDomainIdentifiers:", v6, v7, v8);
}

- (id)itemsInIndex
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_store, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)minArtificialDelay
{
  return self->_minArtificialDelay;
}

- (void)setMinArtificialDelay:(double)a3
{
  self->_minArtificialDelay = a3;
}

- (double)maxArtificialDelay
{
  return self->_maxArtificialDelay;
}

- (void)setMaxArtificialDelay:(double)a3
{
  self->_maxArtificialDelay = a3;
}

- (unint64_t)failureMode
{
  return self->_failureMode;
}

- (BOOL)failDeleteSearchableItemsWithDomainIdentifiers
{
  return self->_failDeleteSearchableItemsWithDomainIdentifiers;
}

- (void)setFailDeleteSearchableItemsWithDomainIdentifiers:(BOOL)a3
{
  self->_failDeleteSearchableItemsWithDomainIdentifiers = a3;
}

- (BOOL)failIndexSearchableItems
{
  return self->_failIndexSearchableItems;
}

- (void)setFailIndexSearchableItems:(BOOL)a3
{
  self->_failIndexSearchableItems = a3;
}

- (BOOL)failDeleteAllSearchableItemsForBundleID
{
  return self->_failDeleteAllSearchableItemsForBundleID;
}

- (void)setFailDeleteAllSearchableItemsForBundleID:(BOOL)a3
{
  self->_failDeleteAllSearchableItemsForBundleID = a3;
}

- (int64_t)numCalls
{
  return self->_numCalls;
}

- (void)setNumCalls:(int64_t)a3
{
  self->_numCalls = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
