@implementation CPLExtractedBatch

- (CPLExtractedBatch)init
{
  CPLExtractedBatch *v2;
  CPLChangeBatch *v3;
  CPLChangeBatch *batch;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPLExtractedBatch;
  v2 = -[CPLExtractedBatch init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CPLChangeBatch);
    batch = v2->_batch;
    v2->_batch = v3;

    v2->_resourceSizeIsCalculated = 1;
  }
  return v2;
}

- (CPLExtractedBatch)initWithCoder:(id)a3
{
  id v4;
  CPLExtractedBatch *v5;
  uint64_t v6;
  CPLChangeBatch *batch;
  uint64_t v8;
  NSDictionary *pushContexts;
  uint64_t v10;
  NSDictionary *v11;
  uint64_t v12;
  NSSet *untrustableScopedIdentifiers;
  uint64_t v14;
  NSSet *v15;
  CPLChangeBatch *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSString *clientCacheIdentifier;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CPLExtractedBatch;
  v5 = -[CPLExtractedBatch init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batch"));
    v6 = objc_claimAutoreleasedReturnValue();
    batch = v5->_batch;
    v5->_batch = (CPLChangeBatch *)v6;

    if (initWithCoder__onceToken_19772 != -1)
      dispatch_once(&initWithCoder__onceToken_19772, &__block_literal_global_19773);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__pushContextsClasses_19774, CFSTR("pushContexts"));
    v8 = objc_claimAutoreleasedReturnValue();
    pushContexts = v5->_pushContexts;
    v5->_pushContexts = (NSDictionary *)v8;

    if (!v5->_pushContexts)
    {
      +[CPLRecordPushContext pushContextsFromStoredUploadIdentifiersInCoder:key:](CPLRecordPushContext, "pushContextsFromStoredUploadIdentifiersInCoder:key:", v4, CFSTR("uploadIdentifiers"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v5->_pushContexts;
      v5->_pushContexts = (NSDictionary *)v10;

    }
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__untrustableIdentifiersClasses, CFSTR("untrustableIdentifiers"));
    v12 = objc_claimAutoreleasedReturnValue();
    untrustableScopedIdentifiers = v5->_untrustableScopedIdentifiers;
    v5->_untrustableScopedIdentifiers = (NSSet *)v12;

    +[CPLScopedIdentifier scopedIdentifiersFromSetOfUnknownIdentifiers:](CPLScopedIdentifier, "scopedIdentifiersFromSetOfUnknownIdentifiers:", v5->_untrustableScopedIdentifiers);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v5->_untrustableScopedIdentifiers;
    v5->_untrustableScopedIdentifiers = (NSSet *)v14;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = v5->_batch;
    v17 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v21, "scopedIdentifier", (_QWORD)v27);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v5->_pushContexts, "objectForKeyedSubscript:", v22);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          if (!v23)
            v23 = +[CPLRecordPushContext newEmptyPushContext](CPLRecordPushContext, "newEmptyPushContext");
          objc_msgSend(v21, "_setPushContext:", v23);
          if (-[NSSet containsObject:](v5->_untrustableScopedIdentifiers, "containsObject:", v22))
            objc_msgSend(v21, "_setShouldNotTrustCloudCache:", 1);

        }
        v18 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientCacheIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    clientCacheIdentifier = v5->_clientCacheIdentifier;
    v5->_clientCacheIdentifier = (NSString *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *mutablePushContexts;
  NSObject *v6;
  void *v7;
  void *v8;
  NSMutableSet *mutableUntrustableScopedIndentifiers;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  CPLExtractedBatch *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend(v11, "encodeObject:forKey:", self->_batch, CFSTR("batch"));
  mutablePushContexts = self->_mutablePushContexts;
  if (mutablePushContexts)
  {
    if (self->_pushContexts)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v13 = self;
          _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "%@ can't have both mutable and immutable push contexts", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLExtractedBatch.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 79, CFSTR("%@ can't have both mutable and immutable push contexts"), self);
      goto LABEL_16;
    }
  }
  else
  {
    mutablePushContexts = (NSMutableDictionary *)self->_pushContexts;
  }
  objc_msgSend(v11, "encodeObject:forKey:", mutablePushContexts, CFSTR("pushContexts"));
  mutableUntrustableScopedIndentifiers = self->_mutableUntrustableScopedIndentifiers;
  if (mutableUntrustableScopedIndentifiers)
  {
    if (self->_untrustableScopedIdentifiers)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v13 = self;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "%@ can't have both mutable and immutable untrustable identifiers", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLExtractedBatch.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 81, CFSTR("%@ can't have both mutable and immutable untrustable identifiers"), self);
LABEL_16:

      abort();
    }
  }
  else
  {
    mutableUntrustableScopedIndentifiers = (NSMutableSet *)self->_untrustableScopedIdentifiers;
  }
  objc_msgSend(v11, "encodeObject:forKey:", mutableUntrustableScopedIndentifiers, CFSTR("untrustableIdentifiers"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_clientCacheIdentifier, CFSTR("clientCacheIdentifier"));

}

- (id)uploadIdentifierForChange:(id)a3
{
  NSMutableDictionary *mutablePushContexts;
  void *v4;
  void *v5;
  void *v6;

  mutablePushContexts = self->_mutablePushContexts;
  if (!mutablePushContexts)
    mutablePushContexts = (NSMutableDictionary *)self->_pushContexts;
  objc_msgSend(a3, "scopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mutablePushContexts, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uploadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addChange:(id)a3 fromStorage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *mutablePushContexts;
  NSDictionary *pushContexts;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableSet *mutableUntrustableScopedIndentifiers;
  NSSet *untrustableScopedIdentifiers;
  NSMutableSet *v17;
  NSMutableSet *v18;
  NSMutableSet *v19;
  NSMutableSet *v20;
  char v21;
  id v22;

  v22 = a3;
  v6 = a4;
  objc_msgSend(v22, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_pushContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    mutablePushContexts = self->_mutablePushContexts;
    if (!mutablePushContexts)
    {
      pushContexts = self->_pushContexts;
      if (pushContexts)
      {
        v11 = (NSMutableDictionary *)-[NSDictionary mutableCopy](pushContexts, "mutableCopy");
        v12 = self->_mutablePushContexts;
        self->_mutablePushContexts = v11;

        v13 = (NSMutableDictionary *)self->_pushContexts;
        self->_pushContexts = 0;
      }
      else
      {
        v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = self->_mutablePushContexts;
        self->_mutablePushContexts = v14;
      }

      mutablePushContexts = self->_mutablePushContexts;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](mutablePushContexts, "setObject:forKeyedSubscript:", v8, v7);
  }
  if (objc_msgSend(v22, "_shouldNotTrustCloudCache"))
  {
    mutableUntrustableScopedIndentifiers = self->_mutableUntrustableScopedIndentifiers;
    if (!mutableUntrustableScopedIndentifiers)
    {
      untrustableScopedIdentifiers = self->_untrustableScopedIdentifiers;
      if (untrustableScopedIdentifiers)
      {
        v17 = (NSMutableSet *)-[NSSet mutableCopy](untrustableScopedIdentifiers, "mutableCopy");
        v18 = self->_mutableUntrustableScopedIndentifiers;
        self->_mutableUntrustableScopedIndentifiers = v17;

        v19 = (NSMutableSet *)self->_untrustableScopedIdentifiers;
        self->_untrustableScopedIdentifiers = 0;
      }
      else
      {
        v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v19 = self->_mutableUntrustableScopedIndentifiers;
        self->_mutableUntrustableScopedIndentifiers = v20;
      }

      mutableUntrustableScopedIndentifiers = self->_mutableUntrustableScopedIndentifiers;
    }
    -[NSMutableSet addObject:](mutableUntrustableScopedIndentifiers, "addObject:", v7);
  }
  if (self->_batchCanLowerQuota)
    v21 = 1;
  else
    v21 = objc_msgSend(v22, "canLowerQuota");
  self->_batchCanLowerQuota = v21;
  if (objc_msgSend(v22, "supportsResources") && objc_msgSend(v22, "hasChangeType:", 8))
    self->_resourceSize += objc_msgSend(v22, "effectiveResourceSizeToUploadUsingStorage:", v6);
  -[CPLChangeBatch addRecord:](self->_batch, "addRecord:", v22);

}

- (NSFastEnumeration)uploadIdentifiers
{
  CPLMapEnumerator *v3;
  NSMutableDictionary *mutablePushContexts;
  void *v5;
  CPLMapEnumerator *v6;

  v3 = [CPLMapEnumerator alloc];
  mutablePushContexts = self->_mutablePushContexts;
  if (!mutablePushContexts)
    mutablePushContexts = (NSMutableDictionary *)self->_pushContexts;
  -[NSMutableDictionary objectEnumerator](mutablePushContexts, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CPLMapEnumerator initWithEnumerator:map:](v3, "initWithEnumerator:map:", v5, &__block_literal_global_25);

  return (NSFastEnumeration *)v6;
}

- (unint64_t)effectiveResourceSizeToUploadUsingStorage:(id)a3
{
  id v4;
  CPLChangeBatch *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t resourceSize;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_resourceSizeIsCalculated)
  {
    self->_resourceSizeIsCalculated = 1;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_batch;
    v6 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "supportsResources", (_QWORD)v13)
            && objc_msgSend(v10, "hasChangeType:", 8))
          {
            self->_resourceSize += objc_msgSend(v10, "effectiveResourceSizeToUploadUsingStorage:", v4);
          }
        }
        v7 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  resourceSize = self->_resourceSize;

  return resourceSize;
}

- (void)forceScopeIndexOnAllRecordsTo:(int64_t)a3
{
  CPLChangeBatch *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_batch;
  v5 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setScopeIndex:", a3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)enumeratePushContextsWithBlock:(id)a3
{
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_pushContexts, "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (CPLChangeBatch)batch
{
  return self->_batch;
}

- (unint64_t)resourceSize
{
  return self->_resourceSize;
}

- (BOOL)isFull
{
  return self->_full;
}

- (void)setFull:(BOOL)a3
{
  self->_full = a3;
}

- (BOOL)batchCanLowerQuota
{
  return self->_batchCanLowerQuota;
}

- (NSString)clientCacheIdentifier
{
  return self->_clientCacheIdentifier;
}

- (void)setClientCacheIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_batch, 0);
  objc_storeStrong((id *)&self->_mutableUntrustableScopedIndentifiers, 0);
  objc_storeStrong((id *)&self->_untrustableScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutablePushContexts, 0);
  objc_storeStrong((id *)&self->_pushContexts, 0);
}

uint64_t __38__CPLExtractedBatch_uploadIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uploadIdentifier");
}

void __35__CPLExtractedBatch_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)initWithCoder__pushContextsClasses_19774;
  initWithCoder__pushContextsClasses_19774 = v3;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)initWithCoder__untrustableIdentifiersClasses;
  initWithCoder__untrustableIdentifiersClasses = v8;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
