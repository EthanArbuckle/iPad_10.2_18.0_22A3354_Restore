@implementation SFSafariProfileDelegate

- (SFSafariProfileDelegate)initWithDataSource:(id)a3
{
  id v5;
  SFSafariProfileDelegate *v6;
  SFSafariProfileDelegate *v7;
  SFSafariProfileDelegate *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSafariProfileDelegate;
  v6 = -[SFSafariProfileDelegate init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = v7;
  }

  return v7;
}

- (id)sfWebExtensionsControllerTabGroupManager:(id)a3
{
  -[SFExtensionsProfilesDataSource tabGroupManager](self->_dataSource, "tabGroupManager", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sfWebExtensionsControllerAllProfileExtensionsControllers:(id)a3
{
  void *v3;
  void *v4;

  -[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers](self->_dataSource, "profileServerIDToWebExtensionsControllers", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sfWebExtensionsController:(id)a3 forProfileServerID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers](self->_dataSource, "profileServerIDToWebExtensionsControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sfWebExtensionsControllerContentBlockerManager:(id)a3 forProfileServerID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers](self->_dataSource, "profileServerIDToContentBlockerManagers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sfWebExtensionsControllersForAllProfiles:(id)a3
{
  void *v3;
  void *v4;

  -[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers](self->_dataSource, "profileServerIDToWebExtensionsControllers", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sfWebExtensionsControllersContentBlockerManagersForAllProfiles:(id)a3
{
  void *v3;
  void *v4;

  -[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers](self->_dataSource, "profileServerIDToContentBlockerManagers", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)enumerateContentBlockerManagersUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers](self->_dataSource, "profileServerIDToContentBlockerManagers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v6);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
