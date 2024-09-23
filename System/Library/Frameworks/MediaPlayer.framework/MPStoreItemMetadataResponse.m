@implementation MPStoreItemMetadataResponse

- (MPStoreItemMetadataResponse)init
{
  MPStoreItemMetadataResponse *v2;
  uint64_t v3;
  NSMutableDictionary *itemIdentifierToStoreItemMetadata;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPStoreItemMetadataResponse;
  v2 = -[MPStoreItemMetadataResponse init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    itemIdentifierToStoreItemMetadata = v2->_itemIdentifierToStoreItemMetadata;
    v2->_itemIdentifierToStoreItemMetadata = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[NSArray copy](self->_cacheMissItemIdentifiers, "copy");
    v6 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v5;

    v7 = -[NSArray copy](self->_requestItemIdentifiers, "copy");
    v8 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v7;

    *(_BYTE *)(v4 + 24) = self->_finalResponse;
    v9 = -[NSMutableDictionary mutableCopy](self->_itemIdentifierToStoreItemMetadata, "mutableCopy");
    v10 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v9;

    v11 = -[NSArray copy](self->_lastBatchItemIdentifiers, "copy");
    v12 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v11;

    objc_storeStrong((id *)(v4 + 48), self->_performanceMetrics);
  }
  return (id)v4;
}

- (NSArray)lastBatchStoreItemDictionaries
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[MPStoreItemMetadataResponse lastBatchItemIdentifiers](self, "lastBatchItemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MPStoreItemMetadataResponse lastBatchItemIdentifiers](self, "lastBatchItemIdentifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_itemIdentifierToStoreItemMetadata, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "effectiveStorePlatformDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v13;
}

- (NSArray)cacheMissItemIdentifiers
{
  if (self->_cacheMissItemIdentifiers)
    return self->_cacheMissItemIdentifiers;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)itemIdentifiers
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NSMutableDictionary allKeys](self->_itemIdentifierToStoreItemMetadata, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (NSDate)earliestExpirationDate
{
  NSMutableDictionary *itemIdentifierToStoreItemMetadata;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__42613;
  v10 = __Block_byref_object_dispose__42614;
  v11 = 0;
  itemIdentifierToStoreItemMetadata = self->_itemIdentifierToStoreItemMetadata;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MPStoreItemMetadataResponse_earliestExpirationDate__block_invoke;
  v5[3] = &unk_1E315F558;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](itemIdentifierToStoreItemMetadata, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (BOOL)isExpired
{
  NSMutableDictionary *itemIdentifierToStoreItemMetadata;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  itemIdentifierToStoreItemMetadata = self->_itemIdentifierToStoreItemMetadata;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__MPStoreItemMetadataResponse_isExpired__block_invoke;
  v5[3] = &unk_1E315F558;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](itemIdentifierToStoreItemMetadata, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)storeItemMetadataForItemIdentifier:(id)a3
{
  return -[MPStoreItemMetadataResponse storeItemMetadataForItemIdentifier:returningIsFinalMetadata:](self, "storeItemMetadataForItemIdentifier:returningIsFinalMetadata:", a3, 0);
}

- (id)storeItemMetadataForItemIdentifier:(id)a3 returningIsFinalMetadata:(BOOL *)a4
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_itemIdentifierToStoreItemMetadata, "objectForKey:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setStoreItemMetadata:(id)a3 forItemIdentifier:(id)a4
{
  if (a3)
  {
    if (a4)
      -[NSMutableDictionary setObject:forKey:](self->_itemIdentifierToStoreItemMetadata, "setObject:forKey:");
  }
}

- (BOOL)isFinalResponse
{
  return self->_finalResponse;
}

- (void)setFinalResponse:(BOOL)a3
{
  self->_finalResponse = a3;
}

- (void)setCacheMissItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)lastBatchItemIdentifiers
{
  return self->_lastBatchItemIdentifiers;
}

- (void)setLastBatchItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)requestItemIdentifiers
{
  return self->_requestItemIdentifiers;
}

- (void)setRequestItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (ICURLAggregatedPerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (void)setPerformanceMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_performanceMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_requestItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastBatchItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemIdentifierToStoreItemMetadata, 0);
  objc_storeStrong((id *)&self->_cacheMissItemIdentifiers, 0);
}

uint64_t __40__MPStoreItemMetadataResponse_isExpired__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "isExpired");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __53__MPStoreItemMetadataResponse_earliestExpirationDate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(a3, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    v11 = v4;
    if (v6)
    {
      objc_msgSend(v6, "earlierDate:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;
    }
    else
    {
      v10 = v4;
      v9 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v10;
    }

    v4 = v11;
  }

}

@end
