@implementation WFAngelSceneManager

- (WFAngelSceneManager)init
{
  WFAngelSceneManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  WFAngelSceneManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFAngelSceneManager;
  v2 = -[WFAngelSceneManager init](&v11, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.shortcuts.WFAngelSceneManager", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)getWindowWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  void (**v12)(id, void *, _QWORD);
  _QWORD block[5];

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = objc_claimAutoreleasedReturnValue(-[WFAngelSceneManager queue](self, "queue"));
  dispatch_assert_queue_not_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFAngelSceneManager activeWindow](self, "activeWindow"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFAngelSceneManager activeWindow](self, "activeWindow"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    v4[2](v4, v8, 0);

  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[WFAngelSceneManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000409C;
    block[3] = &unk_100034BE8;
    block[4] = self;
    dispatch_sync(v9, block);

    -[WFAngelSceneManager setWindowActivationCompletionHandler:](self, "setWindowActivationCompletionHandler:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000040A8;
    v11[3] = &unk_1000347A0;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v10, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, 0, 0, v11);

  }
}

- (void)destroyActiveWindow
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFAngelSceneManager activeWindow](self, "activeWindow"));

  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFAngelSceneManager activeWindow](self, "activeWindow"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
    objc_msgSend(v6, "requestSceneSessionDestruction:options:errorHandler:", v5, 0, &stru_1000347C0);

  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  WFActiveWindowScene *v17;
  NSObject *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  id v22;
  _QWORD block[5];

  v22 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFAngelSceneManager windowActivationCompletionHandler](self, "windowActivationCompletionHandler"));

  if (v8)
  {
    v10 = v22;
    if (v10)
    {
      v11 = objc_opt_class(UIWindowScene, v9);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        v12 = v10;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v14 = v12;

    v13 = objc_alloc_init((Class)UIViewController);
    v15 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v14);

    objc_msgSend(v15, "setRootViewController:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_rootSheetPresentationController"));
    objc_msgSend(v16, "_setShouldScaleDownBehindDescendantSheets:", 0);

    objc_msgSend(v15, "makeKeyAndVisible");
    v17 = -[WFActiveWindowScene initWithSceneSession:window:]([WFActiveWindowScene alloc], "initWithSceneSession:window:", v7, v15);

    -[WFAngelSceneManager setActiveWindow:](self, "setActiveWindow:", v17);
    v18 = objc_claimAutoreleasedReturnValue(-[WFAngelSceneManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004088;
    block[3] = &unk_100034BE8;
    block[4] = self;
    dispatch_sync(v18, block);

    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[WFAngelSceneManager windowActivationCompletionHandler](self, "windowActivationCompletionHandler"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[WFAngelSceneManager activeWindow](self, "activeWindow"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "window"));
    ((void (**)(_QWORD, void *, _QWORD))v19)[2](v19, v21, 0);

    v7 = v15;
  }
  else
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", v22));
    objc_msgSend(v13, "requestSceneSessionDestruction:options:errorHandler:", v7, 0, &stru_1000347E0);
  }

}

- (void)sceneDidDisconnect:(id)a3
{
  -[WFAngelSceneManager setActiveWindow:](self, "setActiveWindow:", 0);
}

- (WFActiveWindowScene)activeWindow
{
  return self->_activeWindow;
}

- (void)setActiveWindow:(id)a3
{
  objc_storeStrong((id *)&self->_activeWindow, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)awaitingScene
{
  return self->_awaitingScene;
}

- (void)setAwaitingScene:(BOOL)a3
{
  self->_awaitingScene = a3;
}

- (id)windowActivationCompletionHandler
{
  return self->_windowActivationCompletionHandler;
}

- (void)setWindowActivationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_windowActivationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeWindow, 0);
}

+ (id)sharedManager
{
  if (qword_10003FEC8 != -1)
    dispatch_once(&qword_10003FEC8, &stru_100034800);
  return (id)qword_10003FED0;
}

@end
