@implementation GKLoadingViewController

- (GKLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  GKLoadingViewController *v4;
  GKLoadableContentStateMachine *v5;
  GKLoadableContentStateMachine *loadingMachine;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKLoadingViewController;
  v4 = -[GKLoadingViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(GKLoadableContentStateMachine);
    loadingMachine = v4->_loadingMachine;
    v4->_loadingMachine = v5;

    -[_GKStateMachine setDelegate:](v4->_loadingMachine, "setDelegate:", v4);
    v4->_loadingIndicatorDelay = 2.0;
  }
  return v4;
}

- (NSString)loadingState
{
  return -[_GKStateMachine currentState](self->_loadingMachine, "currentState");
}

- (void)setLoadingState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_GKStateMachine currentState](self->_loadingMachine, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[_GKStateMachine setCurrentState:](self->_loadingMachine, "setCurrentState:", v6);
    v5 = v6;
  }

}

- (void)setViewsToHideWhileLoading:(id)a3
{
  NSArray *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  _BOOL8 v9;
  NSArray *v10;

  v5 = (NSArray *)a3;
  if (self->_viewsToHideWhileLoading != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_viewsToHideWhileLoading, a3);
    -[GKLoadingViewController loadingState](self, "loadingState");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v6 == CFSTR("LoadingState"))
    {
      v9 = 1;
    }
    else
    {
      -[GKLoadingViewController loadingState](self, "loadingState");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v7 == CFSTR("Initial"))
      {
        v9 = 1;
      }
      else
      {
        -[GKLoadingViewController loadingState](self, "loadingState");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v9 = v8 == CFSTR("RefreshingState");

      }
    }

    -[GKLoadingViewController setViewsToHideHidden:](self, "setViewsToHideHidden:", v9);
    v5 = v10;
  }

}

- (void)setViewsToHideHidden:(BOOL)a3
{
  double v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = 0.0;
  else
    v3 = 1.0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_viewsToHideWhileLoading;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAlpha:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)showLoadingIndicator
{
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    v4 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x1E0DC3438]);
    v5 = self->_activityIndicator;
    self->_activityIndicator = v4;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_activityIndicator, "setActivityIndicatorViewStyle:", 101);
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityIndicatorColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](self->_activityIndicator, "setColor:", v7);

    -[GKLoadingViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_activityIndicator);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_activityIndicator, 9, 0, v8, 9, 1.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_activityIndicator, 10, 0, v8, 10, 1.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addConstraints:", v11);

    activityIndicator = self->_activityIndicator;
  }
  -[UIActivityIndicatorView setAlpha:](activityIndicator, "setAlpha:", 1.0);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
}

- (void)didEnterLoadingState
{
  uint64_t v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v3 = ++didEnterLoadingState_globalSeed_0;
  -[GKLoadingViewController loadingMachine](self, "loadingMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = dispatch_time(0, (uint64_t)(self->_loadingIndicatorDelay * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__GKLoadingViewController_didEnterLoadingState__block_invoke;
  block[3] = &unk_1E59C5150;
  v9 = v5;
  v10 = v3;
  block[4] = self;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);

}

void __47__GKLoadingViewController_didEnterLoadingState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 48) == didEnterLoadingState_globalSeed_0)
  {
    objc_msgSend(*(id *)(a1 + 32), "loadingMachine");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);

    if (v3 == v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "setViewsToHideHidden:", 1);
      objc_msgSend(*(id *)(a1 + 32), "showLoadingIndicator");
    }
  }
}

- (void)didExitLoadingState
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__GKLoadingViewController_didExitLoadingState__block_invoke;
  v3[3] = &unk_1E59C4148;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__GKLoadingViewController_didExitLoadingState__block_invoke_2;
  v2[3] = &unk_1E59C4430;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v3, v2, 0.3);
}

uint64_t __46__GKLoadingViewController_didExitLoadingState__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setViewsToHideHidden:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAlpha:", 0.0);
}

uint64_t __46__GKLoadingViewController_didExitLoadingState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "stopAnimating");
}

- (NSArray)viewsToHideWhileLoading
{
  return self->_viewsToHideWhileLoading;
}

- (double)loadingIndicatorDelay
{
  return self->_loadingIndicatorDelay;
}

- (void)setLoadingIndicatorDelay:(double)a3
{
  self->_loadingIndicatorDelay = a3;
}

- (GKLoadableContentStateMachine)loadingMachine
{
  return self->_loadingMachine;
}

- (void)setLoadingMachine:(id)a3
{
  objc_storeStrong((id *)&self->_loadingMachine, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_loadingMachine, 0);
  objc_storeStrong((id *)&self->_viewsToHideWhileLoading, 0);
}

@end
