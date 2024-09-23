@implementation _UIDocumentPickerRootContainerModel

- (_UIDocumentPickerRootContainerModel)initWithPickableTypes:(id)a3 mode:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _UIDocumentPickerRootContainerModel *v13;
  _UIDocumentPickerRootContainerModel *v14;
  objc_super v16;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "ui_cloudDocsContainerURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE175F8], "localizedNameForDefaultCloudDocsContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLForDirectory:inDomain:appropriateForURL:create:error:", 9, 1, 0, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("Documents"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Local documents"), CFSTR("Local documents"), CFSTR("Localizable"));
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  v16.receiver = self;
  v16.super_class = (Class)_UIDocumentPickerRootContainerModel;
  v13 = -[_UIDocumentPickerURLContainerModel initWithURL:pickableTypes:mode:](&v16, sel_initWithURL_pickableTypes_mode_, v7, v6, a4);
  v14 = v13;
  if (v13)
    -[_UIDocumentPickerURLContainerModel setDisplayTitle:](v13, "setDisplayTitle:", v8);

  return v14;
}

- (_UIDocumentPickerRootContainerModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5
{
  return -[_UIDocumentPickerRootContainerModel initWithPickableTypes:mode:](self, "initWithPickableTypes:mode:", a4, a5);
}

- (void)startMonitoringChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[_UIDocumentPickerURLContainerModel observer](self, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (self->_isObservingContainers)
    {
      v4 = (void *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__containerListDidChange, *MEMORY[0x24BE17328], 0);

      -[_UIDocumentPickerRootContainerModel _containerListDidChange](self, "_containerListDidChange");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      self->_isObservingContainers = 1;
    }
    v8.receiver = self;
    v8.super_class = (Class)_UIDocumentPickerRootContainerModel;
    -[_UIDocumentPickerURLContainerModel startMonitoringChanges](&v8, sel_startMonitoringChanges);
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerURLContainerModel observer](self, "observer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStaticItems:", v6);

  }
}

- (id)_containerListDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  _UIDocumentPickerContainerContainerItem *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(MEMORY[0x24BE175F8], "documentContainers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = *MEMORY[0x24BE17550];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqualToString:", v8) & 1) == 0 && (objc_msgSend(v10, "isInInitialState") & 1) == 0)
        {
          objc_msgSend(v10, "documentsURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v13 = -[_UIDocumentPickerContainerContainerItem initWithContainer:]([_UIDocumentPickerContainerContainerItem alloc], "initWithContainer:", v10);
            -[_UIDocumentPickerContainerItem setPickable:](v13, "setPickable:", -[_UIDocumentPickerURLContainerModel shouldEnableContainer:](self, "shouldEnableContainer:", v10));
            objc_msgSend(v3, "addObject:", v13);

          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerURLContainerModel observer](self, "observer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStaticItems:", v14);

  return v3;
}

@end
