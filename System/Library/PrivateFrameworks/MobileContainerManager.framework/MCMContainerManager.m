@implementation MCMContainerManager

- (id)_containersWithClass:(int64_t)a3 temporary:(BOOL)a4 error:(id *)a5
{
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8 = 1;
  v7 = 0;
  container_get_all_with_class_for_current_user();
  v5 = (void *)objc_opt_new();
  container_free_array_of_containers();

  return v5;
}

- (MCMContainerManager)init
{
  NSObject *v2;
  uint8_t v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  container_log_handle_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_21A231000, v2, OS_LOG_TYPE_FAULT, "Aborting because you tried to init MobileContainerManager singleton!", v3, 2u);
  }

  abort();
}

- (id)containerWithContentClass:(int64_t)a3 identifier:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;

  v7 = a4;
  objc_msgSend(_containerClassForContentClass(a3), "containerWithIdentifier:error:", v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)containerWithContentClass:(int64_t)a3 identifier:(id)a4 createIfNecessary:(BOOL)a5 existed:(BOOL *)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v11;
  void *v12;

  v9 = a5;
  v11 = a4;
  objc_msgSend(_containerClassForContentClass(a3), "containerWithIdentifier:createIfNecessary:existed:error:", v11, v9, a6, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)temporaryContainerWithContentClass:(int64_t)a3 identifier:(id)a4 existed:(BOOL *)a5 error:(id *)a6
{
  id v9;
  void *v10;

  v9 = a4;
  objc_msgSend(_containerClassForContentClass(a3), "temporaryContainerWithIdentifier:existed:error:", v9, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)containersWithClass:(int64_t)a3 error:(id *)a4
{
  return -[MCMContainerManager _containersWithClass:temporary:error:](self, "_containersWithClass:temporary:error:", a3, 0, a4);
}

- (id)temporaryContainersWithClass:(int64_t)a3 error:(id *)a4
{
  return -[MCMContainerManager _containersWithClass:temporary:error:](self, "_containersWithClass:temporary:error:", a3, 1, a4);
}

- (id)deleteContainers:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  size_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v21;
  void *v22;
  _QWORD *__s;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  v8 = v7;
  if (v7 <= 1)
    v7 = 1;
  v9 = malloc_type_calloc(v7, 8uLL, 0x2004093837F09uLL);
  __s = v9;
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v5, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9[i] = objc_msgSend(v11, "getLowLevelContainerObject");

    }
  }
  v21 = MEMORY[0x24BDAC760];
  v12 = v6;
  v13 = container_delete_array_of_containers();
  if (v13 != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), v13, 0, v21, 3221225472, __55__MCMContainerManager_deleteContainers_withCompletion___block_invoke, &unk_24DC883F8, v12, __s);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_18;
LABEL_17:
    free(v9);
    memset_s(&__s, 8uLL, 0, 8uLL);
    goto LABEL_18;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v24, 16, v21, 3221225472, __55__MCMContainerManager_deleteContainers_withCompletion___block_invoke, &unk_24DC883F8, v12, __s);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "markDeleted");
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    }
    while (v16);
  }

  v19 = 0;
  if (v9)
    goto LABEL_17;
LABEL_18:

  return v19;
}

- (BOOL)replaceContainer:(id)a3 withContainer:(id)a4 error:(id *)a5
{
  return -[MCMContainerManager replaceContainer:withContainer:error:withCompletion:](self, "replaceContainer:withContainer:error:withCompletion:", a3, a4, a5, 0);
}

- (BOOL)replaceContainer:(id)a3 withContainer:(id)a4 error:(id *)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  v11 = a4;
  objc_msgSend(v9, "getLowLevelContainerObject");
  objc_msgSend(v11, "getLowLevelContainerObject");

  v17 = MEMORY[0x24BDAC760];
  v18 = v10;
  v12 = v10;
  v13 = container_replace();
  if (v13 == 1)
  {
    objc_msgSend(v9, "markDeleted", v17, 3221225472, __75__MCMContainerManager_replaceContainer_withContainer_error_withCompletion___block_invoke, &unk_24DC883F8, v18, v20);
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), v13, 0, v17, 3221225472, __75__MCMContainerManager_replaceContainer_withContainer_error_withCompletion___block_invoke, &unk_24DC883F8, v18, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    if (a5 && v15)
    {
      v14 = objc_retainAutorelease(v15);
      *a5 = v14;
    }
  }

  return v14 == 0;
}

void __75__MCMContainerManager_replaceContainer_withContainer_error_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (a2 == 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), a2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

void __55__MCMContainerManager_deleteContainers_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (a2 == 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), a2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_83);
  return (id)defaultManager_sharedInstance;
}

void __37__MCMContainerManager_defaultManager__block_invoke()
{
  MCMContainerManager *v0;
  void *v1;

  v0 = [MCMContainerManager alloc];
  v1 = (void *)defaultManager_sharedInstance;
  defaultManager_sharedInstance = (uint64_t)v0;

}

@end
