@implementation _UIDocumentPickerAllContainersModel

- (_UIDocumentPickerAllContainersModel)initWithFoldersForPickableTypes:(id)a3 mode:(unint64_t)a4 sourceContainer:(id)a5
{
  id v9;
  _UIDocumentPickerAllContainersModel *v10;
  _UIDocumentPickerAllContainersModel *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_UIDocumentPickerAllContainersModel;
  v10 = -[_UIDocumentPickerURLContainerModel initWithURL:pickableTypes:mode:](&v13, sel_initWithURL_pickableTypes_mode_, 0, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_sourceContainer, a5);

  return v11;
}

- (_UIDocumentPickerAllContainersModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5
{
  return -[_UIDocumentPickerAllContainersModel initWithFoldersForPickableTypes:mode:sourceContainer:](self, "initWithFoldersForPickableTypes:mode:sourceContainer:", a4, a5, 0);
}

- (BOOL)shouldShowTopLevelContainers
{
  return 0;
}

- (id)displayTitle
{
  return CFSTR("All containers");
}

- (id)_createObserver
{
  _UIDocumentPickerCloudDirectoryObserver *v3;
  void *v4;
  _UIDocumentPickerCloudDirectoryObserver *v5;

  v3 = [_UIDocumentPickerCloudDirectoryObserver alloc];
  -[_UIDocumentPickerAllContainersModel scopes](self, "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIDocumentPickerCloudDirectoryObserver initWithRecursiveScopes:delegate:](v3, "initWithRecursiveScopes:delegate:", v4, self);

  return v5;
}

- (void)updateScopes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSArray *v9;
  NSArray *scopes;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _UIDocumentPickerAllContainersModel *v16;

  objc_msgSend(MEMORY[0x24BE175F8], "documentContainers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE175F8], "allContainersByContainerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1758];
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __51___UIDocumentPickerAllContainersModel_updateScopes__block_invoke;
  v14 = &unk_24E43B938;
  v15 = v5;
  v16 = self;
  v7 = v5;
  objc_msgSend(v6, "predicateWithBlock:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v8, v11, v12, v13, v14);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  scopes = self->_scopes;
  self->_scopes = v9;

}

- (void)startMonitoringChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _UIDocumentPickerAllContainersModel *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _UIDocumentPickerContainerContainerItem *v16;
  NSArray *scopes;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)_UIDocumentPickerAllContainersModel;
  -[_UIDocumentPickerURLContainerModel startMonitoringChanges](&v24, sel_startMonitoringChanges);
  -[_UIDocumentPickerContainerModel setSortOrder:](self, "setSortOrder:", 3);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("sortPath"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerURLContainerModel observer](self, "observer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v4);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K UTI-CONFORMS-TO %@"), *MEMORY[0x24BDD1040], *MEMORY[0x24BDC1770]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerURLContainerModel observer](self, "observer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQueryPredicate:", v6);

  v8 = self;
  -[_UIDocumentPickerAllContainersModel updateScopes](self, "updateScopes");
  v9 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(MEMORY[0x24BE175F8], "documentContainers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isInInitialState") & 1) == 0)
        {
          v16 = -[_UIDocumentPickerContainerContainerItem initWithContainer:]([_UIDocumentPickerContainerContainerItem alloc], "initWithContainer:", v15);
          scopes = v8->_scopes;
          objc_msgSend(v15, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIDocumentPickerContainerItem setPickable:](v16, "setPickable:", -[NSArray containsObject:](scopes, "containsObject:", v18));

          objc_msgSend(v9, "addObject:", v16);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v12);
  }

  -[_UIDocumentPickerURLContainerModel observer](v8, "observer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setStaticItems:", v9);

}

- (id)scopes
{
  NSArray *scopes;

  scopes = self->_scopes;
  if (!scopes)
  {
    -[_UIDocumentPickerAllContainersModel updateScopes](self, "updateScopes");
    scopes = self->_scopes;
  }
  return scopes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceContainer, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
}

@end
