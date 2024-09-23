@implementation RPModalPresentationWindow

- (RPModalPresentationWindow)init
{
  RPModalPresentationWindow *v2;
  RPModalPresentationWindow *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RPModalPresentationWindow;
  v2 = -[UIApplicationRotationFollowingWindow init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[RPModalPresentationWindow setOpaque:](v2, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPModalPresentationWindow setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPModalPresentationWindow setScreen:](v3, "setScreen:", v5);

    -[RPModalPresentationWindow setWindowLevel:](v3, "setWindowLevel:", *MEMORY[0x24BDF8000]);
    -[RPModalPresentationWindow setHidden:](v3, "setHidden:", 1);
    -[RPModalPresentationWindow mainWindow](v3, "mainWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginDisablingInterfaceAutorotation");

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[RPModalPresentationWindow mainWindow](self, "mainWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDisablingInterfaceAutorotation");

  v4.receiver = self;
  v4.super_class = (Class)RPModalPresentationWindow;
  -[RPModalPresentationWindow dealloc](&v4, sel_dealloc);
}

- (id)mainWindow
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  -[RPModalPresentationWindow _presentationViewController](self, "_presentationViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__RPModalPresentationWindow_presentViewController_animated_completion___block_invoke;
  v12[3] = &unk_24D15E300;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, v5, v12);

}

uint64_t __71__RPModalPresentationWindow_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
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
  -[RPModalPresentationWindow _presentationViewController](self, "_presentationViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentedViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v8)
      v8[2](v8, v10 == v11);
  }
  else
  {
    -[RPModalPresentationWindow presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, v6, v8);
  }

}

- (id)_presentationViewController
{
  void *v3;
  id v4;

  -[RPModalPresentationWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF6808]);
    objc_msgSend(v4, "setSizesWindowToScene:", 1);
    -[RPModalPresentationWindow setRootViewController:](self, "setRootViewController:", v4);

  }
  return (id)-[RPModalPresentationWindow rootViewController](self, "rootViewController");
}

@end
