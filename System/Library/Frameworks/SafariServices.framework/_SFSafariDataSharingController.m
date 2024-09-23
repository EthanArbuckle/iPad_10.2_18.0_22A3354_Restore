@implementation _SFSafariDataSharingController

+ (id)sharedController
{
  if (sharedController_onceToken_0 != -1)
    dispatch_once(&sharedController_onceToken_0, &__block_literal_global_64);
  return (id)sharedController_sharedController_0;
}

- (_SFSafariDataSharingController)init
{
  _SFSafariDataSharingController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dataSharingQueue;
  _SFSafariDataSharingController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFSafariDataSharingController;
  v2 = -[_SFSafariDataSharingController init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.SafariServices.SafariDataSharing", 0);
    dataSharingQueue = v2->_dataSharingQueue;
    v2->_dataSharingQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)systemDataContainerURLWithAppBundleID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataContainerURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("/SystemData/com.apple.SafariViewService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_loadAppBundlesWithSeparateDataIfNeeded
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *appBundlesWithSeparateData;
  NSMutableArray *v7;
  NSMutableArray *v8;

  if (!self->_appBundlesWithSeparateData)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayForKey:", CFSTR("AppBundleIDsWithSeperateData"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSMutableArray *)objc_msgSend(v4, "mutableCopy");
    appBundlesWithSeparateData = self->_appBundlesWithSeparateData;
    self->_appBundlesWithSeparateData = v5;

    if (!self->_appBundlesWithSeparateData)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v8 = self->_appBundlesWithSeparateData;
      self->_appBundlesWithSeparateData = v7;

    }
  }
}

- (void)checkInAppBundleIDIfNeeded:(id)a3
{
  id v4;
  NSObject *dataSharingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dataSharingQueue = self->_dataSharingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61___SFSafariDataSharingController_checkInAppBundleIDIfNeeded___block_invoke;
  v7[3] = &unk_1E4ABFB20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dataSharingQueue, v7);

}

- (void)clearAllWebsitesData
{
  NSObject *dataSharingQueue;
  _QWORD block[5];

  dataSharingQueue = self->_dataSharingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___SFSafariDataSharingController_clearAllWebsitesData__block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(dataSharingQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundlesWithSeparateData, 0);
  objc_storeStrong((id *)&self->_dataSharingQueue, 0);
}

@end
