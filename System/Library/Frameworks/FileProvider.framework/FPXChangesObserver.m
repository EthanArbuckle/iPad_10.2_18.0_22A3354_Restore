@implementation FPXChangesObserver

- (FPXChangesObserver)initWithObservedItemID:(id)a3 domainContext:(id)a4 nsFileProviderRequest:(id)a5
{
  return -[FPXChangesObserver initWithObservedItemID:domainContext:previousChangeToken:nsFileProviderRequest:](self, "initWithObservedItemID:domainContext:previousChangeToken:nsFileProviderRequest:", a3, a4, 0, a5);
}

- (FPXChangesObserver)initWithObservedItemID:(id)a3 domainContext:(id)a4 previousChangeToken:(id)a5 nsFileProviderRequest:(id)a6
{
  id v11;
  FPXChangesObserver *v12;
  NSMutableArray *v13;
  NSMutableArray *changedItems;
  NSMutableArray *v15;
  NSMutableArray *deletedItemIDs;
  objc_super v18;

  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FPXChangesObserver;
  v12 = -[FPXObserver initWithObservedItemID:domainContext:nsFileProviderRequest:](&v18, sel_initWithObservedItemID_domainContext_nsFileProviderRequest_, a3, a4, a6);
  if (v12)
  {
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    changedItems = v12->_changedItems;
    v12->_changedItems = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedItemIDs = v12->_deletedItemIDs;
    v12->_deletedItemIDs = v15;

    objc_storeStrong((id *)&v12->_originalSyncAnchor, a5);
    v12->_suggestedBatchSize = 200;
  }

  return v12;
}

- (void)didDeleteItemsWithIdentifiers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  NSMutableArray *deletedItemIDs;
  void *v28;
  id v29;

  v29 = a3;
  -[FPXDomainContext log](self->super._domainContext, "log");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = fpfs_adopt_log(v4);

  -[FPXDomainContext domain](self->super._domainContext, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personaIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FPXDomainContext domain](self->super._domainContext, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "personaIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentPersona");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userPersonaUniqueString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "isEqualToString:", v13);

    if ((v14 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentPersona");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "userPersonaUniqueString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "currentPersona");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "uid");
      -[FPXDomainContext domain](self->super._domainContext, "domain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "personaIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v18, v21, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXChangesObserver didDeleteItemsWithIdentifiers:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 209, (const char *)objc_msgSend(objc_retainAutorelease(v24), "UTF8String"));
    }
  }
  else
  {

  }
  v26 = -[NSMutableArray count](self->_deletedItemIDs, "count");
  if ((unint64_t)(objc_msgSend(v29, "count") + v26) >= 0x4E21)
    __FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__(self->super._observedItemID);
  deletedItemIDs = self->_deletedItemIDs;
  -[FPXDomainContext itemIDsFromVendorItemIDs:](self->super._domainContext, "itemIDsFromVendorItemIDs:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](deletedItemIDs, "addObjectsFromArray:", v28);

}

- (void)didUpdateItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  NSMutableArray *deletedItemIDs;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FPXDomainContext log](self->super._domainContext, "log");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = fpfs_adopt_log(v5);

  -[FPXDomainContext domain](self->super._domainContext, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personaIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FPXDomainContext domain](self->super._domainContext, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "personaIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentPersona");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userPersonaUniqueString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentPersona");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "userPersonaUniqueString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "currentPersona");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "uid");
      -[FPXDomainContext domain](self->super._domainContext, "domain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "personaIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v19, v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXChangesObserver didUpdateItems:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 219, (const char *)objc_msgSend(objc_retainAutorelease(v25), "UTF8String"));
    }
  }
  else
  {

  }
  v27 = -[NSMutableArray count](self->_changedItems, "count");
  if ((unint64_t)(objc_msgSend(v4, "count") + v27) >= 0x4E21)
    __FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__(self->super._observedItemID);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v28 = v4;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[FPXObserver updateForProviderItem:](self, "updateForProviderItem:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          -[NSMutableArray addObject:](self->_changedItems, "addObject:", v34);
        }
        else
        {
          objc_msgSend(v33, "itemIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            deletedItemIDs = self->_deletedItemIDs;
            -[FPXDomainContext itemIDFromVendorItemID:](self->super._domainContext, "itemIDFromVendorItemID:", v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](deletedItemIDs, "addObject:", v37);

          }
        }

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v30);
  }

}

- (void)finishEnumeratingChangesUpToSyncAnchor:(id)a3 moreComing:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void (**v36)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _BOOL4 v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v41 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[FPXDomainContext log](self->super._domainContext, "log");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = fpfs_adopt_log(v7);

  -[FPXDomainContext domain](self->super._domainContext, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personaIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[FPXDomainContext domain](self->super._domainContext, "domain");
    v40 = v6;
    v12 = a2;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personaIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentPersona");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userPersonaUniqueString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v14, "isEqualToString:", v17);

    a2 = v12;
    v6 = v40;

    if ((v18 & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "currentPersona");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userPersonaUniqueString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "currentPersona");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "uid");
      -[FPXDomainContext domain](self->super._domainContext, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "personaIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v22, v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXChangesObserver finishEnumeratingChangesUpToSyncAnchor:moreComing:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 239, (const char *)objc_msgSend(objc_retainAutorelease(v28), "UTF8String"));
    }
  }
  else
  {

  }
  v30 = -[FPXDomainContext usesFPFS](self->super._domainContext, "usesFPFS");
  if (!v6 && v30)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPXEnumerator.m"), 242, CFSTR("%@ returned a nil anchor"), v32);

  }
  -[FPXObserver verifyVendorToken:](self, "verifyVendorToken:", v6);
  -[FPXChangesObserver finishedBlock](self, "finishedBlock");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
    __FILEPROVIDER_OBSERVER_FINISHED_MORE_THAN_ONCE__(self->super._observedItemID);
  fp_current_or_default_log();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_hashForToken:", v6);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v35;
    _os_log_impl(&dword_1A0A34000, v34, OS_LOG_TYPE_INFO, "[INFO] change enumeration returned change token %{public}@", buf, 0xCu);

  }
  -[FPXChangesObserver finishedBlock](self, "finishedBlock");
  v36 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)-[NSMutableArray copy](self->_changedItems, "copy");
    v38 = (void *)-[NSMutableArray copy](self->_deletedItemIDs, "copy");
    -[FPXDomainContext currentResponseWithRequest:](self->super._domainContext, "currentResponseWithRequest:", self->super._nsFileProviderRequest);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, _BOOL4, id, void *, _QWORD))v36)[2](v36, v37, v38, v41, v6, v39, 0);

    -[FPXChangesObserver setFinishedBlock:](self, "setFinishedBlock:", 0);
  }

}

- (void)finishEnumeratingWithError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v27;
  id v28;

  v28 = a3;
  -[FPXDomainContext log](self->super._domainContext, "log");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = fpfs_adopt_log(v4);

  -[FPXDomainContext domain](self->super._domainContext, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personaIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FPXDomainContext domain](self->super._domainContext, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "personaIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentPersona");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userPersonaUniqueString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "isEqualToString:", v13);

    if ((v14 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentPersona");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "userPersonaUniqueString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "currentPersona");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "uid");
      -[FPXDomainContext domain](self->super._domainContext, "domain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "personaIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v18, v21, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXChangesObserver finishEnumeratingWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 265, (const char *)objc_msgSend(objc_retainAutorelease(v24), "UTF8String"));
    }
  }
  else
  {

  }
  -[FPXChangesObserver finishedBlock](self, "finishedBlock");
  v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[FPXDomainContext currentResponseWithRequest:](self->super._domainContext, "currentResponseWithRequest:", self->super._nsFileProviderRequest);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *, id))v26)[2](v26, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, 0, v27, v28);

    -[FPXChangesObserver setFinishedBlock:](self, "setFinishedBlock:", 0);
  }

}

- (id)finishedBlock
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setFinishedBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (int64_t)suggestedBatchSize
{
  return self->_suggestedBatchSize;
}

- (void)setSuggestedBatchSize:(int64_t)a3
{
  self->_suggestedBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishedBlock, 0);
  objc_storeStrong((id *)&self->_originalSyncAnchor, 0);
  objc_storeStrong((id *)&self->_deletedItemIDs, 0);
  objc_storeStrong((id *)&self->_changedItems, 0);
}

@end
