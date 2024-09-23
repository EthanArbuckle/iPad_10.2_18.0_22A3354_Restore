@implementation CKViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKViewController;
  -[CKViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CKViewController setAppearing:](self, "setAppearing:", 1);
  -[CKViewController setDissapearing:](self, "setDissapearing:", 0);
  -[CKViewController setAppeared:](self, "setAppeared:", 0);
  -[CKViewController setDeferredAppeared:](self, "setDeferredAppeared:", 0);
}

- (void)setDissapearing:(BOOL)a3
{
  self->_dissapearing = a3;
}

- (void)setDeferredAppeared:(BOOL)a3
{
  self->_deferredAppeared = a3;
}

- (void)setAppearing:(BOOL)a3
{
  self->_appearing = a3;
}

- (void)setAppeared:(BOOL)a3
{
  self->_appeared = a3;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKViewController;
  -[CKViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CKViewController setAppearing:](self, "setAppearing:", 0);
  -[CKViewController setDissapearing:](self, "setDissapearing:", 0);
  -[CKViewController setAppeared:](self, "setAppeared:", 1);
  -[CKViewController setDeferredAppeared:](self, "setDeferredAppeared:", 0);
  -[CKViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_viewDidAppearDeferredSetup, 0, 0.0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKViewController;
  -[CKViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CKViewController setAppearing:](self, "setAppearing:", 0);
  -[CKViewController setDissapearing:](self, "setDissapearing:", 1);
  -[CKViewController setAppeared:](self, "setAppeared:", 0);
  -[CKViewController setDeferredAppeared:](self, "setDeferredAppeared:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKViewController;
  -[CKViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CKViewController setAppearing:](self, "setAppearing:", 0);
  -[CKViewController setDissapearing:](self, "setDissapearing:", 0);
  -[CKViewController setAppeared:](self, "setAppeared:", 0);
  -[CKViewController setDeferredAppeared:](self, "setDeferredAppeared:", 0);
}

- (void)significantTimeChange
{
  -[CKViewController childViewControllersPerform:](self, "childViewControllersPerform:", a2);
}

- (void)prepareForSuspend
{
  -[CKViewController childViewControllersPerform:](self, "childViewControllersPerform:", a2);
}

- (void)prepareForResume
{
  -[CKViewController childViewControllersPerform:](self, "childViewControllersPerform:", a2);
}

- (void)parentControllerDidResume:(BOOL)a3 animating:(BOOL)a4
{
  id v6;
  _QWORD v7[4];
  BOOL v8;
  BOOL v9;

  -[CKViewController childViewControllers](self, "childViewControllers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CKViewController_parentControllerDidResume_animating___block_invoke;
  v7[3] = &__block_descriptor_34_e33_v32__0__UIViewController_8Q16_B24l;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __56__CKViewController_parentControllerDidResume_animating___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "parentControllerDidResume:animating:", *(unsigned __int8 *)(a1 + 32), *(unsigned __int8 *)(a1 + 33));

}

- (void)parentControllerDidBecomeActive
{
  -[CKViewController childViewControllersPerform:](self, "childViewControllersPerform:", a2);
}

- (void)systemApplicationWillEnterForeground
{
  -[CKViewController childViewControllersPerform:](self, "childViewControllersPerform:", a2);
}

- (void)performResumeDeferredSetup
{
  -[CKViewController childViewControllersPerform:](self, "childViewControllersPerform:", a2);
}

- (void)viewDidAppearDeferredSetup
{
  -[CKViewController setDeferredAppeared:](self, "setDeferredAppeared:", 1);
}

- (void)childViewControllersPerform:(SEL)a3
{
  id v4;
  _QWORD v5[5];

  -[CKViewController childViewControllers](self, "childViewControllers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__CKViewController_childViewControllersPerform___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v32__0__UIViewController_8Q16_B24l;
  v5[4] = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __48__CKViewController_childViewControllersPerform___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "performSelector:", *(_QWORD *)(a1 + 32));

}

- (BOOL)appeared
{
  return self->_appeared;
}

- (BOOL)deferredAppeared
{
  return self->_deferredAppeared;
}

- (BOOL)appearing
{
  return self->_appearing;
}

- (BOOL)dissapearing
{
  return self->_dissapearing;
}

@end
