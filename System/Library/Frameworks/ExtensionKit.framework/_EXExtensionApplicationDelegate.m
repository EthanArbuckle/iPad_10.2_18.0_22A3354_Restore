@implementation _EXExtensionApplicationDelegate

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[_EXRunningUIExtension sharedInstance](_EXRunningUISceneExtension, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "application:willFinishLaunchingWithOptions:", v6, v5);

  return v8;
}

- (void)applicationDidFinishLaunching:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_EXRunningUIExtension sharedInstance](_EXRunningUISceneExtension, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationDidFinishLaunching:", v3);

}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[_EXRunningUIExtension sharedInstance](_EXRunningUISceneExtension, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "application:configurationForConnectingSceneSession:options:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
