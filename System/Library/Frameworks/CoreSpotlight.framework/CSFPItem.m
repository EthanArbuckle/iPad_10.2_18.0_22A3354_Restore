@implementation CSFPItem

+ (id)itemWithFileURL:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __28__CSFPItem_itemWithFileURL___block_invoke;
    v9[3] = &unk_1E24053B0;
    v12 = &v13;
    v10 = v3;
    v6 = v5;
    v11 = v6;
    objc_msgSend(v4, "fetchItemForURL:completionHandler:", v10, v9);
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  }
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __28__CSFPItem_itemWithFileURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  CSFPItem *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = -[CSFPItem initWithFPItem:]([CSFPItem alloc], "initWithFPItem:", v5);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else if (v6)
  {
    logForCSLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_18C42F000, v11, OS_LOG_TYPE_INFO, "%@ fetching %@", (uint8_t *)&v13, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

+ (id)itemWithFileURL:(id)a3 forEUID:(unsigned int)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  CSFPItem *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (FPURLMightBeInFileProviderForEUID())
  {
    FPCopyItemForURLWithEUID();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = v6;
    if (!v5 || v6)
    {
      if (v6)
      {
        logForCSLogCategoryDefault();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v12 = v7;
          v13 = 2112;
          v14 = v4;
          _os_log_impl(&dword_18C42F000, v9, OS_LOG_TYPE_INFO, "%@ fetching %@", buf, 0x16u);
        }

      }
      v8 = 0;
    }
    else
    {
      v8 = -[CSFPItem initWithFPItem:]([CSFPItem alloc], "initWithFPItem:", v5);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CSFPItem)initWithFPItem:(id)a3
{
  id v5;
  CSFPItem *v6;
  CSFPItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSFPItem;
  v6 = -[CSFPItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internal, a3);

  return v7;
}

- (NSString)providerIdentifier
{
  return (NSString *)-[FPItem providerIdentifier](self->_internal, "providerIdentifier");
}

- (NSString)itemIdentifier
{
  return (NSString *)-[FPItem itemIdentifier](self->_internal, "itemIdentifier");
}

- (CSSearchableItem)searchableItem
{
  return (CSSearchableItem *)-[FPItem toSearchableItem](self->_internal, "toSearchableItem");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
