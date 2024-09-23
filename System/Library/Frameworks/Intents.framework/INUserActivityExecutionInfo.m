@implementation INUserActivityExecutionInfo

- (INUserActivityExecutionInfo)initWithUserActivityType:(id)a3 launchableAppBundleId:(id)a4
{
  return (INUserActivityExecutionInfo *)-[INUserActivityExecutionInfo _initWithUserActivityType:launchableAppBundleId:containingAppBundleURL:extensionBundleId:](self, "_initWithUserActivityType:launchableAppBundleId:containingAppBundleURL:extensionBundleId:", a3, a4, 0, 0);
}

- (id)_initWithUserActivityType:(id)a3 launchableAppBundleId:(id)a4 containingAppBundleURL:(id)a5 extensionBundleId:(id)a6
{
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INUserActivityExecutionInfo;
  v11 = -[INExecutionInfo _initWithLaunchableAppBundleId:displayableAppBundleId:containingAppBundleURL:extensionBundleId:](&v15, sel__initWithLaunchableAppBundleId_displayableAppBundleId_containingAppBundleURL_extensionBundleId_, a4, 0, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    v13 = (void *)v11[6];
    v11[6] = v12;

  }
  return v11;
}

- (BOOL)canRunOnLocalDevice
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[INExecutionInfo _applicationRecord](self, "_applicationRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInstalled");

  if (!v5)
    return 0;
  -[INExecutionInfo _appInfo](self, "_appInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "supportedActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUserActivityExecutionInfo userActivityType](self, "userActivityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  return (v9 & 1) != 0;
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityType, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

@end
