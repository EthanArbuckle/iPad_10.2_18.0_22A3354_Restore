@implementation ASToastPresentationWindow

- (ASToastPresentationWindow)init
{
  ASToastPresentationWindow *v2;
  ASToastPresentationWindow *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASToastPresentationWindow;
  v2 = -[ASToastPresentationWindow init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[ASToastPresentationWindow setOpaque:](v2, "setOpaque:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[ASToastPresentationWindow setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    -[ASToastPresentationWindow setScreen:](v3, "setScreen:", v5);

    -[ASToastPresentationWindow setWindowLevel:](v3, "setWindowLevel:", UIWindowLevelAlert);
    -[ASToastPresentationWindow setHidden:](v3, "setHidden:", 1);
  }
  return v3;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastPresentationWindow _presentationViewController](self, "_presentationViewController"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000A2FC;
  v12[3] = &unk_1007344C8;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, v5, v12);

}

- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, BOOL);
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = (void (**)(id, BOOL))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastPresentationWindow _presentationViewController](self, "_presentationViewController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentedViewController"));
  if (v10)
  {
    if (v8)
      v8[2](v8, v10 == v11);
  }
  else
  {
    -[ASToastPresentationWindow presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, v6, v8);
  }

}

- (id)_presentationViewController
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASToastPresentationWindow rootViewController](self, "rootViewController"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)UIApplicationRotationFollowingController);
    objc_msgSend(v4, "setSizesWindowToScene:", 1);
    -[ASToastPresentationWindow setRootViewController:](self, "setRootViewController:", v4);

  }
  return -[ASToastPresentationWindow rootViewController](self, "rootViewController");
}

@end
