@implementation MFMailPopoverManager

+ (id)managerForWindow:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;

  v4 = a4;
  v7 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFMailPopoverManager.m"), 35, CFSTR("Current thread must be main"));

    if (v7)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFMailPopoverManager.m"), 36, CFSTR("window can't be nil"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_11;
LABEL_3:
  objc_msgSend((id)sManagersMap, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 || !v4)
  {
    v10 = v8;
  }
  else
  {
    v10 = -[MFMailPopoverManager _init]([MFMailPopoverManager alloc], "_init");
    v11 = (void *)sManagersMap;
    if (!sManagersMap)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)sManagersMap;
      sManagersMap = v12;

      v11 = (void *)sManagersMap;
    }
    objc_msgSend(v11, "setObject:forKey:", v10, v7);
  }

  return v10;
}

+ (void)enumerateManagersUsingBlock:(id)a3
{
  void (**v5)(id, uint64_t, char *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, uint64_t, char *))a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFMailPopoverManager.m"), 50, CFSTR("Current thread must be main"));

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend((id)sManagersMap, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
      v12 = 0;
      v5[2](v5, v10, &v12);
      if (v12)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_5;
        break;
      }
    }
  }

}

- (MFMailPopoverManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailPopoverManager.m"), 61, CFSTR("Don't instantiate this class directly.  Use +managerForWindow:createIfNeeded:."));

  return 0;
}

- (id)_init
{
  MFMailPopoverManager *v2;
  uint64_t v3;
  NSMutableArray *passThroughProviders;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMailPopoverManager;
  v2 = -[MFMailPopoverManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    passThroughProviders = v2->_passThroughProviders;
    v2->_passThroughProviders = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)dealloc
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  MFMailPopoverManager *v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailPopoverManager.m"), 73, CFSTR("Current thread must be main"));

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend((id)sManagersMap, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend((id)sManagersMap, "objectForKey:", v8);
        v9 = (MFMailPopoverManager *)objc_claimAutoreleasedReturnValue();
        if (v9 == self)
        {
          objc_msgSend((id)sManagersMap, "removeObjectForKey:", v8);

          goto LABEL_13;
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  v11.receiver = self;
  v11.super_class = (Class)MFMailPopoverManager;
  -[MFMailPopoverManager dealloc](&v11, sel_dealloc);
}

- (void)addPassthroughViewProvider:(id)a3
{
  -[NSMutableArray addObject:](self->_passThroughProviders, "addObject:", a3);
}

- (void)removePassthroughViewProvider:(id)a3
{
  -[NSMutableArray removeObject:](self->_passThroughProviders, "removeObject:", a3);
}

- (id)allPassThroughViews
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_passThroughProviders;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "passthroughViews", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passThroughProviders, 0);
}

@end
