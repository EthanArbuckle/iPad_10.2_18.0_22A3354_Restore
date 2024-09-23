@implementation _UIDocumentPickerSubfoldersContainerModel

- (_UIDocumentPickerSubfoldersContainerModel)initWithPickableTypes:(id)a3 container:(id)a4
{
  id v7;
  _UIDocumentPickerSubfoldersContainerModel *v8;
  _UIDocumentPickerSubfoldersContainerModel *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIDocumentPickerSubfoldersContainerModel;
  v8 = -[_UIDocumentPickerURLContainerModel initWithURL:pickableTypes:mode:](&v11, sel_initWithURL_pickableTypes_mode_, 0, a3, 1);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_containerID, a4);

  return v9;
}

- (_UIDocumentPickerSubfoldersContainerModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5
{
  return -[_UIDocumentPickerSubfoldersContainerModel initWithPickableTypes:container:](self, "initWithPickableTypes:container:", a4, 0, a5);
}

- (BOOL)shouldShowTopLevelContainers
{
  return 0;
}

- (id)displayTitle
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Subfolders of %@"), self->_containerID);
}

- (id)_createObserver
{
  _UIDocumentPickerCloudDirectoryObserver *v3;
  void *v4;
  _UIDocumentPickerCloudDirectoryObserver *v5;

  v3 = [_UIDocumentPickerCloudDirectoryObserver alloc];
  -[_UIDocumentPickerSubfoldersContainerModel scopes](self, "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIDocumentPickerCloudDirectoryObserver initWithRecursiveScopes:delegate:](v3, "initWithRecursiveScopes:delegate:", v4, self);

  return v5;
}

- (void)startMonitoringChanges
{
  void *v3;
  void *v4;
  void *v5;
  _UIDocumentPickerContainerContainerItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)_UIDocumentPickerSubfoldersContainerModel;
  -[_UIDocumentPickerURLContainerModel startMonitoringChanges](&v14, sel_startMonitoringChanges);
  objc_msgSend(MEMORY[0x24BE175F8], "allContainersByContainerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", self->_containerID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCF00];
  v6 = -[_UIDocumentPickerContainerContainerItem initWithContainer:]([_UIDocumentPickerContainerContainerItem alloc], "initWithContainer:", v4);
  objc_msgSend(v5, "orderedSetWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerURLContainerModel observer](self, "observer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStaticItems:", v7);

  -[_UIDocumentPickerContainerModel setSortOrder:](self, "setSortOrder:", 3);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("sortPath"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerURLContainerModel observer](self, "observer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v10);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K UTI-CONFORMS-TO %@"), *MEMORY[0x24BDD1040], *MEMORY[0x24BDC1770]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerURLContainerModel observer](self, "observer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setQueryPredicate:", v12);

}

- (id)scopes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self->_containerID;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end
