@implementation WFUISceneDelegateRouter

- (WFUISceneDelegateRouter)init
{
  WFUISceneDelegateRouter *v2;
  uint64_t v3;
  UIWindowSceneDelegate *forwardingTarget;
  WFUISceneDelegateRouter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFUISceneDelegateRouter;
  v2 = -[WFUISceneDelegateRouter init](&v7, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[WFAngelSceneManager sharedManager](WFAngelSceneManager, "sharedManager"));
    forwardingTarget = v2->_forwardingTarget;
    v2->_forwardingTarget = (UIWindowSceneDelegate *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[WFUISceneDelegateRouter forwardingTarget](self, "forwardingTarget"));
  objc_msgSend(v11, "scene:willConnectToSession:options:", v10, v9, v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[WFUISceneDelegateRouter forwardingTarget](self, "forwardingTarget"));
  objc_msgSend(v5, "sceneDidDisconnect:", v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[WFUISceneDelegateRouter forwardingTarget](self, "forwardingTarget"));
  objc_msgSend(v5, "sceneDidEnterBackground:", v4);

}

- (UIWindowSceneDelegate)forwardingTarget
{
  return self->_forwardingTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardingTarget, 0);
}

@end
