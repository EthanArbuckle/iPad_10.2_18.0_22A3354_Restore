@implementation CNContainerDataSource

- (void)setIgnoresExchangeContainers:(BOOL)a3
{
  self->_ignoresExchangeContainers = a3;
}

- (CNContainerDataSource)initWithContactStore:(id)a3
{
  CNContactStore *v4;
  CNContainerDataSource *v5;
  CNContactStore *store;
  CNContactStore *v7;
  NSArray *containerPickerItems;
  CNContactViewCache *v9;
  CNContactViewCache *contactViewCache;
  objc_super v12;

  v4 = (CNContactStore *)a3;
  v12.receiver = self;
  v12.super_class = (Class)CNContainerDataSource;
  v5 = -[CNContainerDataSource init](&v12, sel_init);
  store = v5->_store;
  v5->_store = v4;
  v7 = v4;

  containerPickerItems = v5->_containerPickerItems;
  v5->_containerPickerItems = (NSArray *)MEMORY[0x1E0C9AA60];

  v9 = objc_alloc_init(CNContactViewCache);
  contactViewCache = v5->_contactViewCache;
  v5->_contactViewCache = v9;

  return v5;
}

- (NSArray)containerPickerItems
{
  NSArray *containerPickerItems;

  containerPickerItems = self->_containerPickerItems;
  if (!containerPickerItems)
  {
    -[CNContainerDataSource discoverContainers](self, "discoverContainers");
    containerPickerItems = self->_containerPickerItems;
  }
  return containerPickerItems;
}

- (NSArray)containers
{
  NSArray *containers;

  containers = self->_containers;
  if (!containers)
  {
    -[CNContainerDataSource discoverContainers](self, "discoverContainers");
    containers = self->_containers;
  }
  return containers;
}

- (void)discoverContainers
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  CNContainerPickerItem *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  CNContainerPickerItem *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18AC56000, v3, OS_LOG_TYPE_DEBUG, "Fetching containers", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContainerDataSource allAccounts](self, "allAccounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D137F8];
  if ((*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D137F8] + 16))(*MEMORY[0x1E0D137F8], v6))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "Accounts fetch returned 0 items", buf, 2u);
    }
    goto LABEL_37;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v42 = v6;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (!v10)
    goto LABEL_34;
  v11 = v10;
  v12 = *(_QWORD *)v55;
  v49 = v4;
  v44 = v9;
  v45 = v7;
  v43 = *(_QWORD *)v55;
  do
  {
    v13 = 0;
    v46 = v11;
    do
    {
      if (*(_QWORD *)v55 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v13);
      -[CNContainerDataSource writableContainersForAccount:](self, "writableContainersForAccount:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (((*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v15) & 1) == 0)
      {
        v47 = v13;
        v48 = v15;
        v16 = objc_msgSend(v15, "count");
        objc_msgSend((id)objc_opt_class(), "os_log");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
        if (v16 < 2)
        {
          if (v18)
          {
            objc_msgSend(v14, "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v59 = (uint64_t)v36;
            _os_log_debug_impl(&dword_18AC56000, v17, OS_LOG_TYPE_DEBUG, "Account %@ has only 1 container", buf, 0xCu);

          }
          objc_msgSend(v48, "firstObject");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_cnui_displayName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_alloc_init(CNContainerPickerItem);
          -[CNContainerPickerItem setName:](v32, "setName:", v31);
          objc_msgSend(v19, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContainerPickerItem setIdentifier:](v32, "setIdentifier:", v33);

          -[CNContainerPickerItem setType:](v32, "setType:", objc_msgSend(v19, "type"));
          objc_msgSend(v5, "addObject:", v32);
          objc_msgSend(v4, "addObject:", v19);
          objc_msgSend((id)objc_opt_class(), "os_log");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v19, "identifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v59 = (uint64_t)v37;
            v60 = 2112;
            v61 = v31;
            _os_log_debug_impl(&dword_18AC56000, v34, OS_LOG_TYPE_DEBUG, "Added container %@ wih display name %@", buf, 0x16u);

            v4 = v49;
          }

LABEL_30:
          v11 = v46;
          v15 = v48;
        }
        else
        {
          if (v18)
          {
            objc_msgSend(v14, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v59 = (uint64_t)v35;
            _os_log_debug_impl(&dword_18AC56000, v17, OS_LOG_TYPE_DEBUG, "Account %@ has more than 1 container", buf, 0xCu);

          }
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v15 = v48;
          v19 = v48;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v51;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v51 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                v25 = objc_alloc_init(CNContainerPickerItem);
                objc_msgSend(v24, "name");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[CNContainerPickerItem setName:](v25, "setName:", v26);

                objc_msgSend(v24, "identifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[CNContainerPickerItem setIdentifier:](v25, "setIdentifier:", v27);

                -[CNContainerPickerItem setType:](v25, "setType:", objc_msgSend(v24, "type"));
                objc_msgSend(v5, "addObject:", v25);
                objc_msgSend(v4, "addObject:", v24);
                objc_msgSend((id)objc_opt_class(), "os_log");
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v24, "identifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "name");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v59 = (uint64_t)v29;
                  v60 = 2112;
                  v61 = v30;
                  _os_log_debug_impl(&dword_18AC56000, v28, OS_LOG_TYPE_DEBUG, "Added container %@ wih display name %@", buf, 0x16u);

                  v4 = v49;
                }

              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
            }
            while (v21);
            v9 = v44;
            v7 = v45;
            v12 = v43;
            goto LABEL_30;
          }
        }

        v13 = v47;
      }

      ++v13;
    }
    while (v13 != v11);
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  }
  while (v11);
LABEL_34:

  v38 = (void *)objc_msgSend(v4, "copy");
  -[CNContainerDataSource setContainers:](self, "setContainers:", v38);

  v39 = (void *)objc_msgSend(v5, "copy");
  -[CNContainerDataSource setContainerPickerItems:](self, "setContainerPickerItems:", v39);

  objc_msgSend((id)objc_opt_class(), "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[CNContainerDataSource containers](self, "containers");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "count");
    *(_DWORD *)buf = 134217984;
    v59 = v41;
    _os_log_debug_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEBUG, "Finished fetching %lu containers", buf, 0xCu);

  }
  v6 = v42;
LABEL_37:

}

- (id)allAccounts
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CNContainerDataSource contactViewCache](self, "contactViewCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "accountsMatchingPredicate:error:", 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_error_impl(&dword_18AC56000, v6, OS_LOG_TYPE_ERROR, "Error fetching accounts: %@", buf, 0xCu);

    }
  }

  return v4;
}

- (id)writableContainersForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[6];
  id v18;
  _BYTE buf[24];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C972C0];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForContainersInAccountWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContainerDataSource contactViewCache](self, "contactViewCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v9, "containersMatchingPredicate:error:", v7, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;

  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_error_impl(&dword_18AC56000, v12, OS_LOG_TYPE_ERROR, "Error fetching containers in account %@: %@", buf, 0x16u);

    }
    v13 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v20 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__CNContainerDataSource_writableContainersForAccount___block_invoke;
    v17[3] = &unk_1E204D0B8;
    v17[4] = self;
    v17[5] = buf;
    objc_msgSend(v10, "_cn_filter:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(buf, 8);
  }

  return v13;
}

- (void)setContainerPickerItems:(id)a3
{
  objc_storeStrong((id *)&self->_containerPickerItems, a3);
}

- (void)setContainers:(id)a3
{
  objc_storeStrong((id *)&self->_containers, a3);
}

- (BOOL)ignoresExchangeContainers
{
  return self->_ignoresExchangeContainers;
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (void)setContactViewCache:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_containerPickerItems, 0);
}

uint64_t __54__CNContainerDataSource_writableContainersForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "isEnabled")
    && (objc_msgSend(v3, "type") != 2 || (objc_msgSend(*(id *)(a1 + 32), "ignoresExchangeContainers") & 1) == 0))
  {
    if (objc_msgSend(v3, "type") != 2)
    {
      v5 = 1;
      goto LABEL_9;
    }
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!*(_BYTE *)(v4 + 24))
    {
      v5 = 1;
      *(_BYTE *)(v4 + 24) = 1;
      goto LABEL_9;
    }
  }
  v5 = 0;
LABEL_9:

  return v5;
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_41167 != -1)
    dispatch_once(&os_log_cn_once_token_1_41167, &__block_literal_global_41168);
  return (id)os_log_cn_once_object_1_41169;
}

void __31__CNContainerDataSource_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "containerDataSource");
  v1 = (void *)os_log_cn_once_object_1_41169;
  os_log_cn_once_object_1_41169 = (uint64_t)v0;

}

@end
