@implementation BrowserSceneDelegateRouter

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[Application sharedApplication](Application, "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "browserWindowController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistentIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "windowForSceneID:options:", v12, v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDelegate:", v14);
  objc_msgSend(v14, "scene:willConnectToSession:options:", v9, v8, v7);

  +[Application sharedApplication](Application, "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startCommandLineTest");

}

@end
