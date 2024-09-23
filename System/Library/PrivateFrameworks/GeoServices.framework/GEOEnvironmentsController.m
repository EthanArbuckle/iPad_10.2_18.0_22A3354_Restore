@implementation GEOEnvironmentsController

- (id)initEnablingCustomEnvironments:(BOOL)a3
{
  GEOEnvironmentsController *v4;
  GEOEnvironmentsController *v5;
  void *v6;
  GEOEnvironmentsController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOEnvironmentsController;
  v4 = -[GEOEnvironmentsController init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_enableCustomEnvironments = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_reloadEnvironments, CFSTR("GEONetworkDefaultsDidChangeNotification"), 0);

    v7 = v5;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GEOEnvironmentsController;
  -[GEOEnvironmentsController dealloc](&v4, sel_dealloc);
}

- (void)reloadEnvironments
{
  -[GEOEnvironmentsController reloadEnvironments:](self, "reloadEnvironments:", 0);
}

- (void)reloadEnvironments:(id)a3
{
  GEODefaultEnvironmentInfo *v4;
  NSArray *v5;
  NSArray *defaultEnvironmentInfos;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  GEOCustomEnvironmentInfo *v23;
  void *v24;
  void *v25;
  GEOCustomEnvironmentInfo *v26;
  GEOCustomEnvironmentInfo *v27;
  NSArray *customEnvironmentInfos;
  id obj;
  NSArray *v30;
  uint64_t v31;
  _QWORD v32[5];
  GEOCustomEnvironmentInfo *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[6];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(GEODefaultEnvironmentInfo);
  v45[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  defaultEnvironmentInfos = self->_defaultEnvironmentInfos;
  self->_defaultEnvironmentInfos = v5;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = self->_defaultEnvironmentInfos;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  v9 = MEMORY[0x1E0C809B0];
  v10 = &unk_1E1C00738;
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v38[0] = v9;
        v38[1] = 3221225472;
        v38[2] = __48__GEOEnvironmentsController_reloadEnvironments___block_invoke;
        v38[3] = &unk_1E1C00738;
        v38[4] = self;
        v38[5] = v14;
        objc_msgSend(v14, "reloadManifestDataWithCompletionHandler:", v38);
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (self->_enableCustomEnvironments)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("CustomEnvironments"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v16;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v17)
    {
      v18 = v17;
      v31 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          v20 = v10;
          v21 = v9;
          if (*(_QWORD *)v35 != v31)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          v23 = [GEOCustomEnvironmentInfo alloc];
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("GEOResourceManifestEnvironment"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("displayName"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[GEOCustomEnvironmentInfo initWithName:displayName:dictionaryRepresentation:](v23, "initWithName:displayName:dictionaryRepresentation:", v24, v25, v22);

          if (v26)
            -[NSArray addObject:](v30, "addObject:", v26);
          v9 = v21;
          v32[0] = v21;
          v32[1] = 3221225472;
          v32[2] = __48__GEOEnvironmentsController_reloadEnvironments___block_invoke_2;
          v32[3] = v20;
          v10 = v20;
          v32[4] = self;
          v33 = v26;
          v27 = v26;
          -[GEOEnvironmentInfo reloadManifestDataWithCompletionHandler:](v27, "reloadManifestDataWithCompletionHandler:", v32);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v18);
    }

  }
  customEnvironmentInfos = self->_customEnvironmentInfos;
  self->_customEnvironmentInfos = v30;

}

void __48__GEOEnvironmentsController_reloadEnvironments___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(WeakRetained, "environmentsController:didUpdateEnvironmentInfo:inSection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

  }
}

void __48__GEOEnvironmentsController_reloadEnvironments___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(WeakRetained, "environmentsController:didUpdateEnvironmentInfo:inSection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);

  }
}

- (id)environmentInfosForSection:(int64_t)a3
{
  uint64_t v3;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    v3 = 16;
  }
  else
  {
    v3 = 8;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)addCustomEnvironment:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *customEnvironmentInfos;
  NSArray *v7;
  id WeakRetained;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_customEnvironmentInfos);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v5, "addObject:", v4);
  customEnvironmentInfos = self->_customEnvironmentInfos;
  self->_customEnvironmentInfos = v5;
  v7 = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "environmentsController:didUpdateEnvironmentsSection:", self, 1);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__GEOEnvironmentsController_addCustomEnvironment___block_invoke;
  v10[3] = &unk_1E1C00738;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v9, "reloadManifestDataWithCompletionHandler:", v10);

}

void __50__GEOEnvironmentsController_addCustomEnvironment___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "environmentsController:didUpdateEnvironmentInfo:inSection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);

}

- (void)removeCustomEnvironment:(id)a3
{
  void *v4;
  NSArray *customEnvironmentInfos;
  id v6;
  NSArray *v7;
  NSArray *v8;
  id WeakRetained;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  customEnvironmentInfos = self->_customEnvironmentInfos;
  v6 = a3;
  objc_msgSend(v4, "arrayWithArray:", customEnvironmentInfos);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[NSArray removeObject:](v7, "removeObject:", v6);

  v8 = self->_customEnvironmentInfos;
  self->_customEnvironmentInfos = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "environmentsController:didUpdateEnvironmentsSection:", self, 1);

}

- (id)activeEnvironment
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_defaultEnvironmentInfos);
  objc_msgSend(v3, "addObjectsFromArray:", self->_customEnvironmentInfos);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "isActive", (_QWORD)v10))
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (GEOEnvironmentsControllerDelegate)delegate
{
  return (GEOEnvironmentsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customEnvironmentInfos, 0);
  objc_storeStrong((id *)&self->_defaultEnvironmentInfos, 0);
}

@end
