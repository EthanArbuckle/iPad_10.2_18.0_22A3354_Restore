@implementation CalDAVNotificationContainerSyncTaskGroup

- (CalDAVNotificationContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 accountInfoProvider:(id)a6 taskManager:(id)a7
{
  CalDAVNotificationContainerSyncTaskGroup *v7;
  CalDAVNotificationContainerSyncTaskGroup *v8;
  uint64_t v9;
  NSSet *notificationTypeNamesToFetch;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CalDAVNotificationContainerSyncTaskGroup;
  v7 = -[CoreDAVContainerSyncTaskGroup initWithFolderURL:previousCTag:previousSyncToken:actions:syncItemOrder:context:accountInfoProvider:taskManager:](&v12, sel_initWithFolderURL_previousCTag_previousSyncToken_actions_syncItemOrder_context_accountInfoProvider_taskManager_, a3, a4, a5, 0, 0, 0, a6, a7);
  v8 = v7;
  if (v7)
  {
    -[CoreDAVContainerSyncTaskGroup setUseMultiGet:](v7, "setUseMultiGet:", 0);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("invite-notification"), 0);
    notificationTypeNamesToFetch = v8->_notificationTypeNamesToFetch;
    v8->_notificationTypeNamesToFetch = (NSSet *)v9;

  }
  return v8;
}

- (id)copyGetTaskWithURL:(id)a3
{
  id v3;
  CalDAVGetNotificationItemTask *v4;

  v3 = a3;
  v4 = -[CalDAVGetNotificationItemTask initWithURL:]([CalDAVGetNotificationItemTask alloc], "initWithURL:", v3);

  return v4;
}

- (BOOL)shouldFetchResourceWithEtag:(id)a3 propertiesToValues:(id)a4
{
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a4, "CDVObjectForKeyWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("notificationtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVNotificationContainerSyncTaskGroup notificationTypeNamesToFetch](self, "notificationTypeNamesToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "notificationNameIn:", v6);

  return v7;
}

- (id)copyAdditionalResourcePropertiesToFetch
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ADC8], CFSTR("notificationtype"), objc_opt_class());
  return v2;
}

- (NSSet)notificationTypeNamesToFetch
{
  return self->_notificationTypeNamesToFetch;
}

- (void)setNotificationTypeNamesToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_notificationTypeNamesToFetch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationTypeNamesToFetch, 0);
}

@end
