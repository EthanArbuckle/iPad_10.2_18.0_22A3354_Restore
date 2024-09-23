@implementation _UIDocumentPickerSearchContainerModel

- (_UIDocumentPickerSearchContainerModel)initWithPickableTypes:(id)a3 mode:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerSearchContainerModel;
  return -[_UIDocumentPickerURLContainerModel initWithURL:pickableTypes:mode:](&v5, sel_initWithURL_pickableTypes_mode_, 0, a3, a4);
}

- (_UIDocumentPickerSearchContainerModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5
{
  return -[_UIDocumentPickerSearchContainerModel initWithPickableTypes:mode:](self, "initWithPickableTypes:mode:", a4, a5);
}

- (BOOL)shouldShowTopLevelContainers
{
  return 0;
}

- (id)displayTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Search Results"), CFSTR("Search Results"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)startMonitoringChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerSearchContainerModel;
  -[_UIDocumentPickerURLContainerModel startMonitoringChanges](&v3, sel_startMonitoringChanges);
  -[_UIDocumentPickerSearchContainerModel _updateObserverForQuery](self, "_updateObserverForQuery");
}

- (id)scopes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE175F8], "documentContainers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_createObserver
{
  _UIDocumentPickerCloudDirectoryObserver *v3;
  void *v4;
  _UIDocumentPickerCloudDirectoryObserver *v5;

  v3 = [_UIDocumentPickerCloudDirectoryObserver alloc];
  -[_UIDocumentPickerSearchContainerModel scopes](self, "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIDocumentPickerCloudDirectoryObserver initWithRecursiveScopes:delegate:](v3, "initWithRecursiveScopes:delegate:", v4, self);

  return v5;
}

- (void)setQueryString:(id)a3
{
  NSString *v4;
  NSString *queryString;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_queryString, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    queryString = self->_queryString;
    self->_queryString = v4;

    if (-[NSString length](self->_queryString, "length"))
      -[_UIDocumentPickerSearchContainerModel startMonitoringChanges](self, "startMonitoringChanges");
  }

}

- (void)arrayController:(id)a3 modelChanged:(id)a4 differences:(id)a5
{
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDocumentPickerSearchContainerModel;
  -[_UIDocumentPickerURLContainerModel arrayController:modelChanged:differences:](&v7, sel_arrayController_modelChanged_differences_, a3, a4, a5);
  if (!-[NSString length](self->_queryString, "length"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82___UIDocumentPickerSearchContainerModel_arrayController_modelChanged_differences___block_invoke;
    block[3] = &unk_24E43A808;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (void)_updateObserverForQuery
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  NSString *queryString;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[NSString length](self->_queryString, "length");
  v4 = (void *)MEMORY[0x24BDD1758];
  if (v3)
  {
    v5 = *MEMORY[0x24BDD1048];
    queryString = self->_queryString;
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1798], "escapedPatternForString:", queryString);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("*%@*"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K BEGINSWITH[cd] %@ OR %K LIKE[cd] %@"), v5, queryString, v5, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[_UIDocumentPickerURLContainerModel observer](self, "observer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setQueryPredicate:", v11);

}

- (NSString)queryString
{
  return self->_queryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryString, 0);
}

@end
