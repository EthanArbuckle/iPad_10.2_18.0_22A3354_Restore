@implementation WFActiveWindowScene

- (WFActiveWindowScene)initWithSceneSession:(id)a3 window:(id)a4
{
  id v7;
  id v8;
  WFActiveWindowScene *v9;
  WFActiveWindowScene *v10;
  WFActiveWindowScene *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFActiveWindowScene;
  v9 = -[WFActiveWindowScene init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_window, a4);
    v11 = v10;
  }

  return v10;
}

- (UISceneSession)session
{
  return self->_session;
}

- (UIWindow)window
{
  return self->_window;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
