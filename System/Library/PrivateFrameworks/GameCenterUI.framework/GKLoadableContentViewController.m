@implementation GKLoadableContentViewController

- (GKLoadableContentViewController)init
{
  GKLoadableContentViewController *v2;
  GKLoadableContentStateMachine *v3;
  GKLoadableContentStateMachine *loadingMachine;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKLoadableContentViewController;
  v2 = -[GKLoadableContentViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(GKLoadableContentStateMachine);
    loadingMachine = v2->_loadingMachine;
    v2->_loadingMachine = v3;

    -[_GKStateMachine setDelegate:](v2->_loadingMachine, "setDelegate:", v2);
    v2->_loadingIndicatorDelay = 2.0;
  }
  return v2;
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
  void *v5;
  double v6;
  NSArray *v7;
  _QWORD v8[5];

  v7 = (NSArray *)a3;
  if (self->_viewsToHideWhileLoading != v7)
  {
    objc_storeStrong((id *)&self->_viewsToHideWhileLoading, a3);
    -[GKLoadableContentViewController loadingState](self, "loadingState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("LoadingState")))
      v6 = 0.0;
    else
      v6 = 1.0;

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__GKLoadableContentViewController_setViewsToHideWhileLoading___block_invoke;
    v8[3] = &__block_descriptor_40_e23_v32__0__UIView_8Q16_B24l;
    *(double *)&v8[4] = v6;
    -[NSArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v8);
  }

}

uint64_t __62__GKLoadableContentViewController_setViewsToHideWhileLoading___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", *(double *)(a1 + 32));
}

- (void)didEnterLoadingState
{
  uint64_t v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;
  uint64_t v11;

  v3 = ++didEnterLoadingState_globalSeed;
  -[GKLoadableContentViewController loadingMachine](self, "loadingMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = dispatch_time(0, (uint64_t)(self->_loadingIndicatorDelay * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__GKLoadableContentViewController_didEnterLoadingState__block_invoke;
  block[3] = &unk_1E59C5150;
  v10 = v5;
  v11 = v3;
  block[4] = self;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  -[GKLoadableContentViewController viewsToHideWhileLoading](self, "viewsToHideWhileLoading");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_7);

}

void __55__GKLoadableContentViewController_didEnterLoadingState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48) == didEnterLoadingState_globalSeed)
  {
    objc_msgSend(*(id *)(a1 + 32), "loadingMachine");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);

    if (v3 == v4)
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
      if (!v5)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0DC3438]);
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(void **)(v7 + 992);
        *(_QWORD *)(v7 + 992) = v6;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setActivityIndicatorViewStyle:", 101);
        objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "activityIndicatorColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setColor:", v10);

        objc_msgSend(*(id *)(a1 + 32), "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992), 9, 0, v11, 9, 1.0, 0.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992), 10, 0, v11, 10, 1.0, 0.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v12;
        v15[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addConstraints:", v14);

        v5 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
      }
      objc_msgSend(v5, "setAlpha:", 1.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "startAnimating");
    }
  }
}

uint64_t __55__GKLoadableContentViewController_didEnterLoadingState__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", 0.0);
}

- (void)didExitLoadingState
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__GKLoadableContentViewController_didExitLoadingState__block_invoke;
  v3[3] = &unk_1E59C4148;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__GKLoadableContentViewController_didExitLoadingState__block_invoke_3;
  v2[3] = &unk_1E59C4430;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v3, v2, 0.3);
}

uint64_t __54__GKLoadableContentViewController_didExitLoadingState__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "viewsToHideWhileLoading");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_7_0);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAlpha:", 0.0);
}

uint64_t __54__GKLoadableContentViewController_didExitLoadingState__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", 1.0);
}

uint64_t __54__GKLoadableContentViewController_didExitLoadingState__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "stopAnimating");
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingMachine, 0);
  objc_storeStrong((id *)&self->_viewsToHideWhileLoading, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
