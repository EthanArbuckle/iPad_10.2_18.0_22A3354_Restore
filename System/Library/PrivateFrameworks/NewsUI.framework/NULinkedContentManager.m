@implementation NULinkedContentManager

void __87__NULinkedContentManager_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (NULinkedContentManager)initWithLinkedContentProviders:(id)a3
{
  id v5;
  NULinkedContentManager *v6;
  NULinkedContentManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NULinkedContentManager;
  v6 = -[NULinkedContentManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_linkedContentProviders, a3);

  return v7;
}

- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 priority:(int64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  id v23;
  id obj;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[4];
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_group_create();
  if (v9 && v10)
  {
    v23 = v11;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = (id)-[NSArray copy](self->_linkedContentProviders, "copy");
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          dispatch_group_enter(v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v28[0] = MEMORY[0x24BDAC760];
            v28[1] = 3221225472;
            v28[2] = __87__NULinkedContentManager_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke;
            v28[3] = &unk_24D5A1D88;
            v29 = v13;
            objc_msgSend(v18, "loadLinkedContentForHeadline:withContext:priority:completion:", v9, v10, a5, v28);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (id *)&v29;
          }
          else
          {
            v26[0] = MEMORY[0x24BDAC760];
            v26[1] = 3221225472;
            v26[2] = __87__NULinkedContentManager_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke_2;
            v26[3] = &unk_24D5A1D88;
            v27 = v13;
            objc_msgSend(v18, "loadLinkedContentForHeadline:withContext:completion:", v9, v10, v26);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (id *)&v27;
          }
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v15);
    }

    v11 = v23;
  }
  dispatch_group_notify(v13, MEMORY[0x24BDAC9B8], v11);
  objc_msgSend(MEMORY[0x24BE6CBF8], "groupCancelHandlerWithCancelHandlers:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSArray)linkedContentProviders
{
  return self->_linkedContentProviders;
}

- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 completion:(id)a5
{
  return -[NULinkedContentManager loadLinkedContentForHeadline:withContext:priority:completion:](self, "loadLinkedContentForHeadline:withContext:priority:completion:", a3, a4, 0, a5);
}

void __87__NULinkedContentManager_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedContentProviders, 0);
}

@end
