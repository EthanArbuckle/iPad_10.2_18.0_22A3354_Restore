@implementation CardDAVFolderGetTask

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CoreDAVLeafDataPayload *v9;
  void *v10;
  void *v11;
  CoreDAVLeafDataPayload *v12;
  objc_super v13;

  v4 = a3;
  -[CoreDAVTask responseHeaders](self, "responseHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CDVObjectForKeyCaseInsensitive:", CFSTR("ETag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "octetStreamData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [CoreDAVLeafDataPayload alloc];
  -[CoreDAVTask url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTask accountInfoProvider](self, "accountInfoProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CoreDAVLeafDataPayload initWithURL:eTag:dataPayload:inContainerWithURL:withAccountInfoProvider:](v9, "initWithURL:eTag:dataPayload:inContainerWithURL:withAccountInfoProvider:", v10, v6, v8, 0, v11);

  -[CoreDAVGetTask setAppSpecificDataItemResult:](self, "setAppSpecificDataItemResult:", v12);
  v13.receiver = self;
  v13.super_class = (Class)CardDAVFolderGetTask;
  -[CoreDAVGetTask finishCoreDAVTaskWithError:](&v13, sel_finishCoreDAVTaskWithError_, v4);

}

@end
