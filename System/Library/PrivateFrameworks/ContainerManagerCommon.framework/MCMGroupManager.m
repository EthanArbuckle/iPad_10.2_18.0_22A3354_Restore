@implementation MCMGroupManager

+ (id)defaultManager
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__MCMGroupManager_defaultManager__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  if (defaultManager_onceToken_8243 != -1)
    dispatch_once(&defaultManager_onceToken_8243, v3);
  return (id)defaultManager_sharedInstance;
}

- (id)groupContainerIdentifiersForOwnerIdentifier:(id)a3 groupContainerClass:(unint64_t)a4 codeSignInfo:(id)a5 withError:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  MCMError *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  objc_opt_class();
  v13 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  if (v14)
  {
    if (v10)
      v15 = v12;
    else
      v15 = 0;
    if ((v15 & 1) != 0)
    {
      objc_msgSend(v10, "entitlements");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (a4 == 13)
        objc_msgSend(v16, "systemGroupIdentifiers");
      else
        objc_msgSend(v16, "appGroupIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (a4 == 13)
        objc_msgSend((id)gCodeSigningMapping, "systemGroupIdentifiersForIdentifier:", v13);
      else
        objc_msgSend((id)gCodeSigningMapping, "appGroupIdentifiersForIdentifier:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
      v19 = 0;
      goto LABEL_33;
    }
    objc_opt_class();
    v21 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;

    if (v22)
      goto LABEL_26;
    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = 138412546;
      v26 = v13;
      v27 = 2112;
      v28 = v21;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Wrong group id obj type for ID: %@ : %@", (uint8_t *)&v25, 0x16u);
    }

    v19 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 11, 3);
  }
  else
  {
    container_log_handle_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v25 = 138412290;
      v26 = v13;
      _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, "Can't act on an invalid object: ID: %@", (uint8_t *)&v25, 0xCu);
    }

    v19 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 11, 3);
  }
  v21 = 0;
  if (a6 && v19)
  {
    v19 = objc_retainAutorelease(v19);
    v21 = 0;
    *a6 = v19;
  }
LABEL_33:

  return v21;
}

- (MCMGroupManager)initWithUserIdentityCache:(id)a3
{
  id v5;
  MCMGroupManager *v6;
  MCMGroupManager *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMGroupManager;
  v6 = -[MCMGroupManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userIdentityCache, a3);

  return v7;
}

- (void)reconcileGroupContainersForContainerClass:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend((id)gCodeSigningMapping, "copyReferenceCountSetForContainerClass:", a3);
  if (v7)
  {
    if (a3 == 7)
    {
      -[MCMGroupManager userIdentityCache](self, "userIdentityCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __69__MCMGroupManager_reconcileGroupContainersForContainerClass_context___block_invoke;
      v12[3] = &unk_1E8CB5D30;
      v12[4] = self;
      v15 = 7;
      v13 = v7;
      v14 = v6;
      objc_msgSend(v11, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v12);

    }
    else if (a3 == 13)
    {
      -[MCMGroupManager userIdentityCache](self, "userIdentityCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "globalSystemUserIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[MCMGroupManager _cleanupUnreferencedGroupContainersForUserIdentity:containerClass:referenceCounts:context:](self, "_cleanupUnreferencedGroupContainersForUserIdentity:containerClass:referenceCounts:context:", v9, 13, v7, v6);
    }
  }
  else
  {
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v17 = a3;
      _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Failed to get reference count information for group type: %llu", buf, 0xCu);
    }

  }
}

- (void)_cleanupUnreferencedGroupContainersForUserIdentity:(id)a3 containerClass:(unint64_t)a4 referenceCounts:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MCMResultPromise *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v42 = (void *)objc_opt_new();
  objc_msgSend(v11, "containerCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v9;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  objc_msgSend(v12, "entriesForUserIdentities:contentClass:transient:error:", v13, a4, 0, &v43);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v43;

  if (v14)
  {
    v39 = v15;
    v40 = v11;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v38 = v14;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
    v18 = v42;
    if (v17)
    {
      v19 = v17;
      v20 = *(_QWORD *)v52;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v21), "metadataMinimal");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v10, "countForObject:", v23);
          if (v24)
          {
            v25 = v24;
            container_log_handle_for_category();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v45 = v23;
              v46 = 2048;
              v47 = v25;
              _os_log_impl(&dword_1CF807000, v26, OS_LOG_TYPE_DEFAULT, "Reference count for [%{public}@] is %lu", buf, 0x16u);
            }
          }
          else
          {
            objc_msgSend(v22, "containerIdentity");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v27);

            container_log_handle_for_category();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v41, "shortDescription");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "containerPath");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v45 = v23;
              v46 = 2112;
              v47 = (uint64_t)v28;
              v48 = 2112;
              v49 = v29;
              _os_log_error_impl(&dword_1CF807000, v26, OS_LOG_TYPE_ERROR, "Removing group container [%@] for %@ at %@", buf, 0x20u);

              v18 = v42;
            }
          }

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
      }
      while (v19);
    }

    v30 = v18;
    v31 = objc_alloc_init(MCMResultPromise);
    if (objc_msgSend(v30, "count"))
    {
      objc_msgSend(v30, "allObjects");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v40;
      +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:](MCMCommandOperationDelete, "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:", v32, 0, v40, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "execute");
      -[MCMResultPromise result](v31, "result");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "error");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v38;
      if (v35)
      {
        container_log_handle_for_category();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v35;
          _os_log_error_impl(&dword_1CF807000, v36, OS_LOG_TYPE_ERROR, "Failed to destroy group container(s) during reconciliation; error = %@",
            buf,
            0xCu);
        }

      }
      v15 = v39;
    }
    else
    {
      v15 = v39;
      v11 = v40;
      v14 = v38;
    }
  }
  else
  {
    container_log_handle_for_category();
    v31 = (MCMResultPromise *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v31->super, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v41, "shortDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v37;
      v46 = 2112;
      v47 = (uint64_t)v15;
      _os_log_error_impl(&dword_1CF807000, &v31->super, OS_LOG_TYPE_ERROR, "Failed to fetch group container list for %@: %@", buf, 0x16u);

    }
  }

}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
}

void __69__MCMGroupManager_reconcileGroupContainersForContainerClass_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "homeDirectoryExists"))
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v4, "_cleanupUnreferencedGroupContainersForUserIdentity:containerClass:referenceCounts:context:", v6, v3, v5, *(_QWORD *)(a1 + 48));

  }
}

void __33__MCMGroupManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithUserIdentityCache:");
  v3 = (void *)defaultManager_sharedInstance;
  defaultManager_sharedInstance = v2;

}

@end
