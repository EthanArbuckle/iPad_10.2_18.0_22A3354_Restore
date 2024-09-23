@implementation ContinuityCaptureShieldUIDefaultSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  ContinuityCaptureShieldUIPauseSceneComponent *v11;
  ContinuityCaptureShieldUIViewController *v12;
  void *v13;
  void *v14;
  ContinuityCaptureShieldUIViewController *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a5;
  v8 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v17, v8) & 1) != 0)
  {
    v9 = v17;
    v10 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v9);
    objc_msgSend(v9, "_setBackgroundStyle:", 4);
    v11 = -[ContinuityCaptureShieldUIPauseSceneComponent initWithScene:]([ContinuityCaptureShieldUIPauseSceneComponent alloc], "initWithScene:", v9);
    objc_msgSend(v9, "_registerSceneComponent:forKey:", v11, CFSTR("com.apple.ContinuityCaptureShieldUI.PauseComponent"));

    v12 = [ContinuityCaptureShieldUIViewController alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "session"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "role"));
    v15 = -[ContinuityCaptureShieldUIViewController initWithSceneSessionRole:](v12, "initWithSceneSessionRole:", v14);

    objc_msgSend(v10, "setRootViewController:", v15);
    -[ContinuityCaptureShieldUIBaseSceneDelegate setWindow:](self, "setWindow:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLContexts"));
    -[ContinuityCaptureShieldUIBaseSceneDelegate scene:openURLContexts:](self, "scene:openURLContexts:", v9, v16);

    objc_msgSend(v10, "makeKeyAndVisible");
  }

}

- (void)sceneDidDisconnect:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ContinuityCaptureShieldUIDefaultSceneDelegate;
  v3 = a3;
  -[ContinuityCaptureShieldUIBaseSceneDelegate sceneDidDisconnect:](&v4, "sceneDidDisconnect:", v3);
  objc_msgSend(v3, "_unregisterSceneComponentForKey:", CFSTR("com.apple.ContinuityCaptureShieldUI.PauseComponent"), v4.receiver, v4.super_class);

}

@end
