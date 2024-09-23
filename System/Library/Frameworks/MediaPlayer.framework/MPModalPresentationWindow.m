@implementation MPModalPresentationWindow

- (MPModalPresentationWindow)init
{
  MPModalPresentationWindow *v2;
  MPModalPresentationWindow *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPModalPresentationWindow;
  v2 = -[UIApplicationRotationFollowingWindow init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MPModalPresentationWindow setOpaque:](v2, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModalPresentationWindow setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[MPModalPresentationWindow setWindowLevel:](v3, "setWindowLevel:", *MEMORY[0x1E0DC5628]);
    -[MPModalPresentationWindow setHidden:](v3, "setHidden:", 1);
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
  -[MPModalPresentationWindow _presentationViewController](self, "_presentationViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__MPModalPresentationWindow_presentViewController_animated_completion___block_invoke;
  v12[3] = &unk_1E31637F8;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, v5, v12);

}

- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void (**v13)(id, BOOL);

  v5 = a4;
  v13 = (void (**)(id, BOOL))a5;
  v9 = a3;
  -[MPModalPresentationWindow _presentationViewController](self, "_presentationViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentedViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    if (v11 != v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModalPresentationWindow.m"), 49, CFSTR("Multiple alert controllers assigned to the same window: %@"), self);

    }
    if (v13)
      v13[2](v13, v11 == v9);
  }
  else
  {
    -[MPModalPresentationWindow presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, v5, v13);

  }
}

- (id)_presentationViewController
{
  void *v3;
  id v4;

  -[MPModalPresentationWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3478]);
    objc_msgSend(v4, "setSizesWindowToScene:", 1);
    -[MPModalPresentationWindow setRootViewController:](self, "setRootViewController:", v4);

  }
  return (id)-[MPModalPresentationWindow rootViewController](self, "rootViewController");
}

uint64_t __71__MPModalPresentationWindow_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

@end
