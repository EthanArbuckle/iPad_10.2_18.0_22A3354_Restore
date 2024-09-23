@implementation FPXItemsObserver

- (FPXItemsObserver)initWithObservedItemID:(id)a3 domainContext:(id)a4 nsFileProviderRequest:(id)a5
{
  FPXItemsObserver *v5;
  NSMutableArray *v6;
  NSMutableArray *items;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FPXItemsObserver;
  v5 = -[FPXObserver initWithObservedItemID:domainContext:nsFileProviderRequest:](&v9, sel_initWithObservedItemID_domainContext_nsFileProviderRequest_, a3, a4, a5);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    items = v5->_items;
    v5->_items = v6;

    v5->_suggestedPageSize = 200;
  }
  return v5;
}

- (void)didEnumerateItems:(id)a3
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
  NSObject *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
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

      __assert_rtn("-[FPXItemsObserver didEnumerateItems:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 291, (const char *)objc_msgSend(objc_retainAutorelease(v25), "UTF8String"));
    }
  }
  else
  {

  }
  fp_current_or_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[FPXItemsObserver didEnumerateItems:].cold.1((uint64_t)self, v4, v27);

  v28 = -[NSMutableArray count](self->_items, "count");
  if ((unint64_t)(objc_msgSend(v4, "count") + v28) >= 0x4E21)
    __FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__(self->super._observedItemID);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v29 = v4;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v36;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v36 != v32)
          objc_enumerationMutation(v29);
        -[FPXObserver updateForProviderItem:](self, "updateForProviderItem:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v33));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
          -[NSMutableArray addObject:](self->_items, "addObject:", v34);

        ++v33;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v31);
  }

}

- (void)finishEnumeratingUpToPage:(id)a3
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
  void *v27;
  NSObject *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSMutableArray *items;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
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

      __assert_rtn("-[FPXItemsObserver finishEnumeratingUpToPage:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 310, (const char *)objc_msgSend(objc_retainAutorelease(v25), "UTF8String"));
    }
  }
  else
  {

  }
  -[FPXObserver verifyVendorToken:](self, "verifyVendorToken:", v4);
  -[FPXItemsObserver finishedBlock](self, "finishedBlock");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
    __FILEPROVIDER_OBSERVER_FINISHED_MORE_THAN_ONCE__(self->super._observedItemID);
  fp_current_or_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_hashForToken:", v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = v29;
    _os_log_impl(&dword_1A0A34000, v28, OS_LOG_TYPE_INFO, "[INFO] page enumeration returned page token %{public}@", buf, 0xCu);

  }
  -[FPXItemsObserver finishedBlock](self, "finishedBlock");
  v30 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    items = self->_items;
    -[FPXItemsObserver syncAnchor](self, "syncAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPXDomainContext currentResponseWithRequest:](self->super._domainContext, "currentResponseWithRequest:", self->super._nsFileProviderRequest);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSMutableArray *, id, void *, void *, _QWORD))v30)[2](v30, items, v4, v32, v33, 0);

    -[FPXItemsObserver setFinishedBlock:](self, "setFinishedBlock:", 0);
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
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
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

      __assert_rtn("-[FPXItemsObserver finishEnumeratingWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 325, (const char *)objc_msgSend(objc_retainAutorelease(v24), "UTF8String"));
    }
  }
  else
  {

  }
  -[FPXItemsObserver finishedBlock](self, "finishedBlock");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
    __FILEPROVIDER_OBSERVER_FINISHED_MORE_THAN_ONCE__(self->super._observedItemID);
  -[FPXItemsObserver finishedBlock](self, "finishedBlock");
  v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[FPXDomainContext currentResponseWithRequest:](self->super._domainContext, "currentResponseWithRequest:", self->super._nsFileProviderRequest);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *, id))v27)[2](v27, MEMORY[0x1E0C9AA60], 0, 0, v28, v29);

    -[FPXItemsObserver setFinishedBlock:](self, "setFinishedBlock:", 0);
  }

}

- (id)finishedBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setFinishedBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSData)syncAnchor
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSyncAnchor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (int64_t)suggestedPageSize
{
  return self->_suggestedPageSize;
}

- (void)setSuggestedPageSize:(int64_t)a3
{
  self->_suggestedPageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong(&self->_finishedBlock, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)didEnumerateItems:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: received %d items", (uint8_t *)&v4, 0x12u);
}

@end
