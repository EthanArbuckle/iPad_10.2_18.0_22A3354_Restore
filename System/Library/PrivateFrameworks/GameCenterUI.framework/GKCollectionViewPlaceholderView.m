@implementation GKCollectionViewPlaceholderView

- (GKCollectionViewPlaceholderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  GKCollectionViewPlaceholderView *v7;
  void *v8;
  void *v9;
  GKPlaceholderContentStateMachine *v10;
  GKPlaceholderContentStateMachine *loadingMachine;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  id *v27;
  objc_super v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v28.receiver = self;
  v28.super_class = (Class)GKCollectionViewPlaceholderView;
  v7 = -[GKCollectionViewPlaceholderView initWithFrame:](&v28, sel_initWithFrame_);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewPlaceholderView setBackgroundColor:](v7, "setBackgroundColor:", v9);

    v10 = objc_alloc_init(GKPlaceholderContentStateMachine);
    loadingMachine = v7->_loadingMachine;
    v7->_loadingMachine = v10;

    -[_GKStateMachine setDelegate:](v7->_loadingMachine, "setDelegate:", v7);
    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewPlaceholderView setNoContentTitle:](v7, "setNoContentTitle:", v13);

    -[GKCollectionViewPlaceholderView setNoContentMessage:](v7, "setNoContentMessage:", 0);
    GKGameCenterUIFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewPlaceholderView setErrorTitle:](v7, "setErrorTitle:", v15);

    GKGameCenterUIFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewPlaceholderView setErrorMessage:](v7, "setErrorMessage:", v17);

    +[GKPlaceholderView placeholderViewWithTitle:message:frame:](GKPlaceholderView, "placeholderViewWithTitle:message:frame:", v7->_noContentTitle, v7->_noContentTitle, x, y, width, height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewPlaceholderView setPlaceholderView:](v7, "setPlaceholderView:", v18);

    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__8;
    v26[4] = __Block_byref_object_dispose__8;
    v19 = v7;
    v27 = v19;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __49__GKCollectionViewPlaceholderView_initWithFrame___block_invoke;
    v25[3] = &unk_1E59C4690;
    v25[4] = v26;
    objc_msgSend(v19[62], "setButtonAction:", v25);
    objc_msgSend(v19[62], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithFrame:", x, y, width, height);
    v21 = v19[71];
    v19[71] = (id)v20;

    objc_msgSend(v19[71], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v19, "addSubview:", v19[71]);
    objc_msgSend(v19[62], "setAlpha:", 0.0);
    objc_msgSend(v19[71], "setActivityIndicatorViewStyle:", 101);
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activityIndicatorColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19[71], "setColor:", v23);

    objc_msgSend(v19[71], "setAlpha:", 0.0);
    objc_msgSend(v19, "addSubview:", v19[62]);
    objc_msgSend(v19, "setAlignment:", 2);
    _Block_object_dispose(v26, 8);

  }
  return v7;
}

uint64_t __49__GKCollectionViewPlaceholderView_initWithFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "buttonPressed");
}

- (void)dealloc
{
  objc_super v3;

  -[UIActivityIndicatorView stopAnimating](self->_loadingIndicatorView, "stopAnimating");
  v3.receiver = self;
  v3.super_class = (Class)GKCollectionViewPlaceholderView;
  -[GKCollectionViewPlaceholderView dealloc](&v3, sel_dealloc);
}

- (void)buttonPressed
{
  id noContentButtonTarget;

  noContentButtonTarget = self->_noContentButtonTarget;
  if (noContentButtonTarget)
  {
    if (self->_noContentButtonAction)
      objc_msgSend(noContentButtonTarget, "_gkPerformSelector:withObject:");
  }
}

- (void)setAlignment:(int64_t)a3
{
  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    -[GKCollectionViewPlaceholderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  int64_t alignment;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GKCollectionViewPlaceholderView;
  -[GKCollectionViewPlaceholderView updateConstraints](&v16, sel_updateConstraints);
  -[GKCollectionViewPlaceholderView cachedConstraints](self, "cachedConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[GKCollectionViewPlaceholderView removeConstraints:](self, "removeConstraints:", v3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  alignment = self->_alignment;
  if (alignment == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredXInView:", self->_placeholderView, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_placeholderView, 3, 0, self, 3, 1.0, 20.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredXInView:", self->_loadingIndicatorView, self->_placeholderView);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

    objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredYInView:", self->_loadingIndicatorView, self->_placeholderView);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);
    goto LABEL_7;
  }
  if (alignment == 2)
  {
    v6 = *MEMORY[0x1E0DC49E8];
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintsForView:withinView:insets:", self->_placeholderView, self, *MEMORY[0x1E0DC49E8], v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v10);

    objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintsForView:withinView:insets:", self->_loadingIndicatorView, self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v11);
LABEL_7:

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:withWidthDerivedFromView:insetBy:", self->_placeholderView, self, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v15);

  -[GKCollectionViewPlaceholderView setCachedConstraints:](self, "setCachedConstraints:", v4);
  -[GKCollectionViewPlaceholderView addConstraints:](self, "addConstraints:", v4);

}

- (void)setLoadingState:(id)a3
{
  GKPlaceholderContentStateMachine *loadingMachine;
  id v5;

  loadingMachine = self->_loadingMachine;
  v5 = a3;
  -[_GKStateMachine setCurrentState:](loadingMachine, "setCurrentState:", CFSTR("Initial"));
  -[_GKStateMachine setCurrentState:](self->_loadingMachine, "setCurrentState:", v5);

}

- (NSString)loadingState
{
  return -[_GKStateMachine currentState](self->_loadingMachine, "currentState");
}

- (void)delayedShowLoadingIndicator
{
  __CFString *v3;
  UIActivityIndicatorView *loadingIndicatorView;
  _QWORD v5[5];

  -[_GKStateMachine currentState](self->_loadingMachine, "currentState");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  loadingIndicatorView = self->_loadingIndicatorView;
  if (v3 == CFSTR("LoadingState"))
  {
    -[UIActivityIndicatorView startAnimating](loadingIndicatorView, "startAnimating");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__GKCollectionViewPlaceholderView_delayedShowLoadingIndicator__block_invoke;
    v5[3] = &unk_1E59C4148;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.15);
  }
  else
  {
    -[UIActivityIndicatorView setAlpha:](loadingIndicatorView, "setAlpha:", 0.0);
  }
}

uint64_t __62__GKCollectionViewPlaceholderView_delayedShowLoadingIndicator__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "setAlpha:", 1.0);
}

- (void)didEnterLoadingState
{
  -[GKCollectionViewPlaceholderView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_delayedShowLoadingIndicator, 0, 0.15);
}

- (void)didExitLoadingState
{
  _QWORD v3[5];

  -[UIActivityIndicatorView stopAnimating](self->_loadingIndicatorView, "stopAnimating");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__GKCollectionViewPlaceholderView_didExitLoadingState__block_invoke;
  v3[3] = &unk_1E59C4148;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.25);
}

uint64_t __54__GKCollectionViewPlaceholderView_didExitLoadingState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "setAlpha:", 0.0);
}

- (void)didEnterNoContentState
{
  _QWORD v3[5];

  -[_UIContentUnavailableView setTitle:](self->_placeholderView, "setTitle:", self->_noContentTitle);
  -[_UIContentUnavailableView setMessage:](self->_placeholderView, "setMessage:", self->_noContentMessage);
  -[_UIContentUnavailableView setButtonTitle:](self->_placeholderView, "setButtonTitle:", self->_noContentButtonTitle);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__GKCollectionViewPlaceholderView_didEnterNoContentState__block_invoke;
  v3[3] = &unk_1E59C4148;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.15);
}

uint64_t __57__GKCollectionViewPlaceholderView_didEnterNoContentState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 1.0);
}

- (void)didExitNoContentState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__GKCollectionViewPlaceholderView_didExitNoContentState__block_invoke;
  v2[3] = &unk_1E59C4148;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.15);
}

uint64_t __56__GKCollectionViewPlaceholderView_didExitNoContentState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 0.0);
}

- (void)didEnterErrorState
{
  _QWORD v3[5];

  -[_UIContentUnavailableView setTitle:](self->_placeholderView, "setTitle:", self->_errorTitle);
  -[_UIContentUnavailableView setMessage:](self->_placeholderView, "setMessage:", self->_errorMessage);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__GKCollectionViewPlaceholderView_didEnterErrorState__block_invoke;
  v3[3] = &unk_1E59C4148;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.15);
}

uint64_t __53__GKCollectionViewPlaceholderView_didEnterErrorState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 1.0);
}

- (void)didExitErrorState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__GKCollectionViewPlaceholderView_didExitErrorState__block_invoke;
  v2[3] = &unk_1E59C4148;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.15);
}

uint64_t __52__GKCollectionViewPlaceholderView_didExitErrorState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 0.0);
}

- (GKPlaceholderView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderView, a3);
}

- (NSString)noContentTitle
{
  return self->_noContentTitle;
}

- (void)setNoContentTitle:(id)a3
{
  objc_storeStrong((id *)&self->_noContentTitle, a3);
}

- (NSString)noContentMessage
{
  return self->_noContentMessage;
}

- (void)setNoContentMessage:(id)a3
{
  objc_storeStrong((id *)&self->_noContentMessage, a3);
}

- (NSString)noContentButtonTitle
{
  return self->_noContentButtonTitle;
}

- (void)setNoContentButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_noContentButtonTitle, a3);
}

- (id)noContentButtonTarget
{
  return self->_noContentButtonTarget;
}

- (void)setNoContentButtonTarget:(id)a3
{
  self->_noContentButtonTarget = a3;
}

- (SEL)noContentButtonAction
{
  return self->_noContentButtonAction;
}

- (void)setNoContentButtonAction:(SEL)a3
{
  self->_noContentButtonAction = a3;
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (void)setErrorTitle:(id)a3
{
  objc_storeStrong((id *)&self->_errorTitle, a3);
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessage, a3);
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (UIActivityIndicatorView)loadingIndicatorView
{
  return self->_loadingIndicatorView;
}

- (void)setLoadingIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicatorView, a3);
}

- (GKPlaceholderContentStateMachine)loadingMachine
{
  return self->_loadingMachine;
}

- (void)setLoadingMachine:(id)a3
{
  objc_storeStrong((id *)&self->_loadingMachine, a3);
}

- (NSArray)cachedConstraints
{
  return self->_cachedConstraints;
}

- (void)setCachedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConstraints, 0);
  objc_storeStrong((id *)&self->_loadingMachine, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
  objc_storeStrong((id *)&self->_noContentButtonTitle, 0);
  objc_storeStrong((id *)&self->_noContentMessage, 0);
  objc_storeStrong((id *)&self->_noContentTitle, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
}

@end
