@implementation CalDAVGetNotificationItemTask

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CalDAVNotificationItemData *v9;
  void *v10;
  CalDAVNotificationItemData *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  -[CalDAVGetNotificationItemTask responseHeaders](self, "responseHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CDVObjectForKeyCaseInsensitive:", *MEMORY[0x24BE1AA80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalDAVGetNotificationItemTask responseBodyParser](self, "responseBodyParser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "octetStreamData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [CalDAVNotificationItemData alloc];
  -[CalDAVGetNotificationItemTask url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CoreDAVLeafDataPayload initWithURL:eTag:dataPayload:inContainerWithURL:withAccountInfoProvider:](v9, "initWithURL:eTag:dataPayload:inContainerWithURL:withAccountInfoProvider:", v10, v6, v8, 0, 0);

  -[CalDAVGetNotificationItemTask url](self, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVLeafDataPayload setServerID:](v11, "setServerID:", v12);

  -[CoreDAVGetTask setAppSpecificDataItemResult:](self, "setAppSpecificDataItemResult:", v11);
  v13.receiver = self;
  v13.super_class = (Class)CalDAVGetNotificationItemTask;
  -[CoreDAVGetTask finishCoreDAVTaskWithError:](&v13, sel_finishCoreDAVTaskWithError_, v4);

}

@end
