@implementation CardDAVFolderSyncTaskGroup

- (CardDAVFolderSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 syncItemOrder:(BOOL)a7 context:(id)a8 accountInfoProvider:(id)a9 taskManager:(id)a10 appSpecificDataItemClass:(Class)a11
{
  CardDAVFolderSyncTaskGroup *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CardDAVFolderSyncTaskGroup;
  result = -[CoreDAVContainerSyncTaskGroup initWithFolderURL:previousCTag:previousSyncToken:actions:syncItemOrder:context:accountInfoProvider:taskManager:](&v12, sel_initWithFolderURL_previousCTag_previousSyncToken_actions_syncItemOrder_context_accountInfoProvider_taskManager_, a3, a4, a5, a6, a7, a8, a9, a10);
  if (result)
    result->super._appSpecificDataItemClass = a11;
  return result;
}

- (CardDAVFolderSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 context:(id)a7 accountInfoProvider:(id)a8 taskManager:(id)a9 appSpecificDataItemClass:(Class)a10
{
  return -[CardDAVFolderSyncTaskGroup initWithFolderURL:previousCTag:previousSyncToken:actions:syncItemOrder:context:accountInfoProvider:taskManager:appSpecificDataItemClass:](self, "initWithFolderURL:previousCTag:previousSyncToken:actions:syncItemOrder:context:accountInfoProvider:taskManager:appSpecificDataItemClass:", a3, a4, a5, a6, 0, a7, a8, a9, a10);
}

- (id)copyMultiGetTaskWithURLs:(id)a3
{
  id v4;
  CardDAVFolderMultiGetTask *v5;

  v4 = a3;
  v5 = -[CardDAVFolderMultiGetTask initWithURLs:atContainerURL:appSpecificDataItemClass:]([CardDAVFolderMultiGetTask alloc], "initWithURLs:atContainerURL:appSpecificDataItemClass:", v4, self->super._folderURL, self->super._appSpecificDataItemClass);

  return v5;
}

- (id)copyGetTaskWithURL:(id)a3
{
  id v3;
  CardDAVFolderGetTask *v4;

  v3 = a3;
  v4 = -[CoreDAVTask initWithURL:]([CardDAVFolderGetTask alloc], "initWithURL:", v3);

  return v4;
}

- (id)dataContentType
{
  return CFSTR("text/vcard; charset=utf-8");
}

- (Class)bulkChangeTaskClass
{
  return (Class)objc_opt_class();
}

- (void)applyAdditionalPropertiesFromPutTask:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  NSMutableSet *locationChangedURLs;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "responseHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CDVObjectForKeyCaseInsensitive:", CFSTR("Location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CoreDAVTaskGroup delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CoreDAVTaskGroup delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "setExternalLocation:forItemWithURL:inFolderWithURL:", v5, v9, self->super._folderURL);

      if (v10)
      {
        locationChangedURLs = self->super._locationChangedURLs;
        objc_msgSend(v13, "url");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](locationChangedURLs, "addObject:", v12);

      }
    }
  }

}

- (BOOL)isInitialSync
{
  return self->_isInitialSync;
}

- (void)setIsInitialSync:(BOOL)a3
{
  self->_isInitialSync = a3;
}

@end
