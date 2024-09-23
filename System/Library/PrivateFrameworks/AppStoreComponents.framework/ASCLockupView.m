@implementation ASCLockupView

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCLockupView;
  v3 = *MEMORY[0x1E0DC4660] | -[ASCLockupView accessibilityTraits](&v8, sel_accessibilityTraits);
  -[ASCLockupView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  v6 = *MEMORY[0x1E0DC4698];
  if (v5)
    v6 = 0;
  return v3 | v6;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[ASCLockupView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  if (objc_msgSend(v2, "isOfferButtonOnlyLockup"))
  {
    objc_msgSend(v2, "offerButton");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (void *)v4;
    objc_msgSend(v3, "addObject:", v4);

    goto LABEL_8;
  }
  objc_msgSend(v2, "headingLabelIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v2, "headingLabelIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  objc_msgSend(v2, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(v2, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  objc_msgSend(v2, "offerStatusLabelIfLoaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v2, "offerStatusLabelIfLoaded");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  ASCAXLabelForElements(v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[ASCLockupView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isOfferButtonOnlyLockup") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[ASCLockupView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "offerButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  -[ASCLockupView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  if (!v4)
    return 0;
  -[ASCLockupView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOfferButtonOnlyLockup");

  -[ASCLockupView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "offerButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendActionsForControlEvents:", 64);

    return 1;
  }
  else
  {
    objc_msgSend(v7, "sendActionsForControlEvents:", 64);

    return -[ASCLockupView automaticallyPresentsProductDetails](self, "automaticallyPresentsProductDetails");
  }
}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[ASCLockupView lockup](self, "lockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v5)
  {
    -[ASCLockupView lockup](self, "lockup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "id");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Lockup[id=%@]"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ASCAXIdentifierWithSuffix((uint64_t)v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Lockup"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ASCAXIdentifierWithSuffix((uint64_t)v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (ASCLockupView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  ASCLockupView *v8;
  ASCLockupView *v9;
  ASCLockupContentView *v10;
  uint64_t v11;
  ASCLockupContentView *contentView;
  ASCOfferPresenter *v13;
  ASCOfferPresenter *offerPresenter;
  ASCAppearMetricsPresenter *v15;
  ASCAppearMetricsPresenter *metricsPresenter;
  ASCCustomLockupContentProvider *v17;
  ASCLockupPresenter *v18;
  ASCLockupPresenter *lockupPresenter;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v22.receiver = self;
  v22.super_class = (Class)ASCLockupView;
  v8 = -[ASCLockupView initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_automaticallyPresentsProductDetails = 1;
    v10 = [ASCLockupContentView alloc];
    v11 = -[ASCLockupContentView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    contentView = v9->_contentView;
    v9->_contentView = (ASCLockupContentView *)v11;

    v13 = -[ASCOfferPresenter initWithView:]([ASCOfferPresenter alloc], "initWithView:", v9->_contentView);
    offerPresenter = v9->_offerPresenter;
    v9->_offerPresenter = v13;

    v15 = -[ASCAppearMetricsPresenter initWithView:]([ASCAppearMetricsPresenter alloc], "initWithView:", v9);
    metricsPresenter = v9->_metricsPresenter;
    v9->_metricsPresenter = v15;

    v17 = -[ASCCustomLockupContentProvider initWithLockupView:]([ASCCustomLockupContentProvider alloc], "initWithLockupView:", v9);
    v18 = -[ASCLockupPresenter initWithView:customContentProvider:offerPresenter:metricsPresenter:]([ASCLockupPresenter alloc], "initWithView:customContentProvider:offerPresenter:metricsPresenter:", v9->_contentView, v17, v9->_offerPresenter, v9->_metricsPresenter);
    lockupPresenter = v9->_lockupPresenter;
    v9->_lockupPresenter = v18;

    -[ASCLockupPresenter setObserver:](v9->_lockupPresenter, "setObserver:", v9);
    -[ASCOfferPresenter setObserver:](v9->_offerPresenter, "setObserver:", v9);
    -[ASCLockupView setLayoutMargins:](v9, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[ASCLockupView setInsetsLayoutMarginsFromSafeArea:](v9, "setInsetsLayoutMarginsFromSafeArea:", 0);
    +[ASCSemanticColor tint]();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupView setTintColor:](v9, "setTintColor:", v20);

    -[ASCLockupContentView addOfferTarget:action:](v9->_contentView, "addOfferTarget:action:", v9->_offerPresenter, sel_performOfferAction);
    -[ASCLockupContentView addTarget:action:forControlEvents:](v9->_contentView, "addTarget:action:forControlEvents:", v9, sel_performLockupAction, 64);
    -[ASCLockupView addSubview:](v9, "addSubview:", v9->_contentView);

  }
  return v9;
}

- (ASCLockupView)initWithCoder:(id)a3
{
  -[ASCLockupView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCLockupView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (UIViewController)presentingViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  int v9;
  ASCLockupView *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ASCLockupView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForLockupView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[ASCLockupView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = self;
        _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Lockup view %@ is presenting from root view controller", (uint8_t *)&v9, 0xCu);
      }
      v7 = v5;
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[ASCLockupView presentingViewController].cold.1();
    }

  }
  return (UIViewController *)v5;
}

- (NSString)lockupSize
{
  void *v2;
  void *v3;

  -[ASCLockupView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockupSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLockupSize:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v7 = a3;
  if ((+[ASCEligibility currentClientIsEligibleToUseLockupViewSize:]((uint64_t)ASCEligibility, v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Current process is not eligible to use %@ lockup view size"), v7);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0C99DA0]);
    objc_exception_throw((id)objc_msgSend(v6, "initWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v5, 0));
  }
  -[ASCLockupView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLockupSize:", v7);

  -[ASCLockupView setNeedsLayout](self, "setNeedsLayout");
}

- (ASCLockup)lockup
{
  void *v2;
  void *v3;

  -[ASCLockupView lockupPresenter](self, "lockupPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCLockup *)v3;
}

- (void)setLockup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCLockupView lockupPresenter](self, "lockupPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLockup:", v4);

}

- (ASCLockupViewGroup)group
{
  void *v2;
  void *v3;

  -[ASCLockupView lockupPresenter](self, "lockupPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCLockupViewGroup *)v3;
}

- (void)setGroup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCLockupView lockupPresenter](self, "lockupPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroup:", v4);

}

- (ASCLockupRequest)request
{
  void *v2;
  void *v3;

  -[ASCLockupView lockupPresenter](self, "lockupPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCLockupRequest *)v3;
}

- (void)setRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCLockupView lockupPresenter](self, "lockupPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequest:", v4);

}

- (void)setDelegate:(id)a3
{
  void *v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  BOOL v16;
  __int16 v17;
  id v18;

  v18 = a3;
  objc_storeWeak((id *)&self->_delegate, v18);
  v4 = v18;
  if (v18)
  {
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFF7 | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFEF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFDF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 64;
    else
      v10 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFBF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 128;
    else
      v11 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFF7F | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 256;
    else
      v12 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFEFF | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 512;
    else
      v13 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFDFF | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 1024;
    else
      v14 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFBFF | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 2048;
    else
      v15 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xF7FF | v15;
    v16 = (objc_opt_respondsToSelector() & 1) == 0;
    v4 = v18;
    if (v16)
      v17 = 0;
    else
      v17 = 4096;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xEFFF | v17;
  }
  else
  {
    *(_WORD *)&self->_delegateRespondsTo &= 0xE000u;
  }

}

- (BOOL)isHighlighted
{
  void *v2;
  char v3;

  -[ASCLockupView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighlighted");

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCLockupView contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", v3);

}

- (BOOL)automaticallyGeneratesAppearMetrics
{
  void *v2;
  char v3;

  -[ASCLockupView metricsPresenter](self, "metricsPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)setAutomaticallyGeneratesAppearMetrics:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCLockupView metricsPresenter](self, "metricsPresenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (ASCMetricsActivity)appearMetricsActivity
{
  void *v2;
  void *v3;

  -[ASCLockupView metricsPresenter](self, "metricsPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCMetricsActivity *)v3;
}

- (void)setAppearMetricsActivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCLockupView metricsPresenter](self, "metricsPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActivity:", v4);

}

- (ASCOfferTheme)offerTheme
{
  void *v2;
  void *v3;

  -[ASCLockupView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "offerTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCOfferTheme *)v3;
}

- (void)setOfferTheme:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCLockupView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOfferTheme:", v4);

}

- (void)setShowsPlaceholderContent:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCLockupView lockupPresenter](self, "lockupPresenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsPlaceholderContent:", v3);

}

- (BOOL)showsPlaceholderContent
{
  void *v2;
  char v3;

  -[ASCLockupView lockupPresenter](self, "lockupPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsPlaceholderContent");

  return v3;
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCLockupView;
  -[ASCLockupView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[ASCLockupView setNeedsLayout](self, "setNeedsLayout");
  -[ASCLockupView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  objc_super v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[ASCLockupView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLayoutMargins:", top, left, bottom, right);

  v9.receiver = self;
  v9.super_class = (Class)ASCLockupView;
  -[ASCLockupView setLayoutMargins:](&v9, sel_setLayoutMargins_, top, left, bottom, right);
}

- (void)setHidden:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCLockupView;
  -[ASCLockupView setHidden:](&v5, sel_setHidden_, a3);
  -[ASCLockupView metricsPresenter](self, "metricsPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewDidSetHidden");

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCLockupView;
  -[ASCLockupView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[ASCLockupView metricsPresenter](self, "metricsPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewDidMoveToWindow");

}

- (void)invalidateIntrinsicContentSize
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCLockupView;
  -[ASCLockupView invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "lockupViewDidInvalidateIntrinsicContentSize:", self);

  }
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[ASCLockupView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASCLockupView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutContentView
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  _BOOL4 IsEmpty;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat MinX;
  double v19;
  id v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  -[ASCLockupView bounds](self, "bounds");
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  IsEmpty = CGRectIsEmpty(v21);
  -[ASCLockupView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (IsEmpty)
  {
    v10 = x;
    v11 = y;
    v12 = width;
    v13 = height;
  }
  else
  {
    objc_msgSend(v8, "sizeThatFits:", width, height);
    v15 = v14;
    v17 = v16;

    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    if (vabdd_f64(CGRectGetWidth(v22), v15) > 1.0
      || (v23.origin.x = x,
          v23.origin.y = y,
          v23.size.width = width,
          v23.size.height = height,
          vabdd_f64(CGRectGetHeight(v23), v17) > 1.0))
    {
      if (layoutContentView_onceToken[0] != -1)
        dispatch_once(layoutContentView_onceToken, &__block_literal_global_12);
    }
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    MinX = CGRectGetMinX(v24);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v19 = floor(CGRectGetMidY(v25) + v17 * -0.5);
    -[ASCLockupView contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = MinX;
    v11 = v19;
    v12 = v15;
    v13 = v17;
  }
  objc_msgSend(v8, "setFrame:", v10, v11, v12, v13);

  -[ASCLockupView contentView](self, "contentView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutSubviews");

}

void __34__ASCLockupView_layoutContentView__block_invoke()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v0 = 136446210;
    v1 = "-[ASCLockupView layoutContentView]_block_invoke";
    _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "*** %{public}s: Frame size does not match intrinsicContentSize, break on _ASCLockupView_incorrectFrameSize to debug", (uint8_t *)&v0, 0xCu);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCLockupView;
  -[ASCLockupView layoutSubviews](&v3, sel_layoutSubviews);
  -[ASCLockupView layoutContentView](self, "layoutContentView");
}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("contentView"));

  -[ASCLockupView offerPresenter](self, "offerPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("offerPresenter"));

  -[ASCLockupView lockupPresenter](self, "lockupPresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("lockupPresenter"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)preferredProductDetailsPresentationContext
{
  void *v2;
  void *v4;

  if ((*(_WORD *)&self->_delegateRespondsTo & 0x100) != 0)
  {
    -[ASCLockupView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productDetailsPresentationContextForLockupView:", self);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[ASCLockupProductDetailsPresentationContext defaultPresentationContext](ASCLockupProductDetailsPresentationContext, "defaultPresentationContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)presentProductDetailsViewController
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1BCB7B000, MEMORY[0x1E0C81028], v0, "Product details presentation context is %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_2();
}

- (void)performLockupAction
{
  void *v3;
  _QWORD v4[5];

  -[ASCLockupView lockupPresenter](self, "lockupPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__ASCLockupView_performLockupAction__block_invoke;
  v4[3] = &unk_1E7560308;
  v4[4] = self;
  objc_msgSend(v3, "retryRequestIfNeeded:", v4);

}

void __36__ASCLockupView_performLockupAction__block_invoke(uint64_t a1, char a2)
{
  void *v3;
  int v4;
  id v5;

  if ((a2 & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "automaticallyPresentsProductDetails")
      && (objc_msgSend(*(id *)(a1 + 32), "offerPresenter"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "viewAppForAppDistributionOffer"),
          v3,
          v4))
    {
      objc_msgSend(*(id *)(a1 + 32), "metricsPresenter");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "viewDidAction");

    }
    else if (objc_msgSend(*(id *)(a1 + 32), "automaticallyPresentsProductDetails"))
    {
      objc_msgSend(*(id *)(a1 + 32), "presentProductDetailsViewController");
    }
  }
}

- (void)lockupPresenterDidBeginRequest
{
  id v3;

  if ((*(_WORD *)&self->_delegateRespondsTo & 1) != 0)
  {
    -[ASCLockupView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lockupViewDidBeginRequest:", self);

  }
}

- (void)lockupPresenterDidFinishRequest
{
  id v3;

  if ((*(_WORD *)&self->_delegateRespondsTo & 2) != 0)
  {
    -[ASCLockupView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lockupViewDidFinishRequest:", self);

  }
}

- (void)lockupPresenterDidFailRequestWithError:(id)a3
{
  id v4;
  id v5;

  if ((*(_WORD *)&self->_delegateRespondsTo & 4) != 0)
  {
    v4 = a3;
    -[ASCLockupView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lockupView:didFailRequestWithError:", self, v4);

  }
}

- (void)offerPresenterDidObserveChangeToState:(id)a3
{
  id v4;
  id v5;

  if ((*(_WORD *)&self->_delegateRespondsTo & 8) != 0)
  {
    v4 = a3;
    -[ASCLockupView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lockupView:appStateDidChange:", self, v4);

  }
}

- (void)offerPresenterWillPerformActionOfOffer:(id)a3 inState:(id)a4 withActivity:(id *)a5 inContext:(id *)a6
{
  id v10;
  id v11;
  __int16 delegateRespondsTo;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v10 = a3;
  v11 = a4;
  delegateRespondsTo = (__int16)self->_delegateRespondsTo;
  if ((delegateRespondsTo & 0x10) != 0)
  {
    -[ASCLockupView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "metricsActivityForLockupView:toPerformActionOfOffer:", self, v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    delegateRespondsTo = (__int16)self->_delegateRespondsTo;
  }
  if ((delegateRespondsTo & 0x20) != 0)
  {
    -[ASCLockupView delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lockupViewPerformAdAttributionForState:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 4 * (v15 != 0);

    if ((*(_WORD *)&self->_delegateRespondsTo & 0x80) != 0)
      goto LABEL_5;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    if ((delegateRespondsTo & 0x80) != 0)
    {
LABEL_5:
      -[ASCLockupView delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "lockupViewShouldSupportDSIDLessInstalls:", self);

      goto LABEL_8;
    }
  }
  v17 = 0;
LABEL_8:
  v19 = *a6;
  -[ASCLockupView presentingSceneIdentifier](self, "presentingSceneIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupView presentingSceneBundleIdentifier](self, "presentingSceneBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "offerContextWithPresentingSceneIdentifier:presentingSceneBundleIdentifier:externalDeepLinkURL:", v20, v21, v15);
  *a6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*a6, "offerContextByAddingFlags:", v14);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  *a6 = v22;
  objc_msgSend(v22, "offerContextByAddingFlags:", v17);
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[ASCLockupView offerPresenterWillPerformActionOfOffer:inState:withActivity:inContext:].cold.1((uint64_t)a6, v23, v24, v25, v26, v27, v28, v29);

}

- (void)offerPresenterPreprocessOffer:(id)a3 inState:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x200) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[ASCLockupView offerPresenterPreprocessOffer:inState:completionBlock:].cold.1();
    -[ASCLockupView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lockupView:preprocessOffer:inState:completionBlock:", self, v8, v9, v11);

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (NSString)presentingSceneIdentifier
{
  NSString *presentingSceneIdentifier;
  NSString *v3;
  void *v4;
  void *v5;

  presentingSceneIdentifier = self->_presentingSceneIdentifier;
  if (presentingSceneIdentifier)
  {
    v3 = presentingSceneIdentifier;
  }
  else
  {
    -[ASCLockupView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneIdentifier");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)presentingSceneBundleIdentifier
{
  NSString *presentingSceneBundleIdentifier;
  NSString *v3;
  void *v4;

  presentingSceneBundleIdentifier = self->_presentingSceneBundleIdentifier;
  if (presentingSceneBundleIdentifier)
  {
    v3 = presentingSceneBundleIdentifier;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "asc_realMainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)productDetailsUserDidInteractWithApp:(id)a3 interactionType:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (__CFString *)a4;
  if (CFSTR("opened") == v7 && (*(_WORD *)&self->_delegateRespondsTo & 0x800) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[ASCLockupView productDetailsUserDidInteractWithApp:interactionType:].cold.2();
    -[ASCLockupView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lockupViewProductPageWillOpenApp:", self);

  }
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x1000) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[ASCLockupView productDetailsUserDidInteractWithApp:interactionType:].cold.1();
    -[ASCLockupView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "productDetailsUserDidInteractWithApp:interactionType:", self, v7);

  }
  if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("dismissed")))
    -[ASCLockupView setLockupProductDetails:](self, "setLockupProductDetails:", 0);

}

- (ASCLockupViewDelegate)delegate
{
  return (ASCLockupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)automaticallyPresentsProductDetails
{
  return self->_automaticallyPresentsProductDetails;
}

- (void)setAutomaticallyPresentsProductDetails:(BOOL)a3
{
  self->_automaticallyPresentsProductDetails = a3;
}

- (ASCLockupContentView)contentView
{
  return self->_contentView;
}

- (ASCOfferPresenter)offerPresenter
{
  return self->_offerPresenter;
}

- (ASCAppearMetricsPresenter)metricsPresenter
{
  return self->_metricsPresenter;
}

- (ASCLockupPresenter)lockupPresenter
{
  return self->_lockupPresenter;
}

- (NSString)storeSheetHostBundleID
{
  return self->_storeSheetHostBundleID;
}

- (void)setStoreSheetHostBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_storeSheetHostBundleID, a3);
}

- (NSString)storeSheetUsageContext
{
  return self->_storeSheetUsageContext;
}

- (void)setStoreSheetUsageContext:(id)a3
{
  objc_storeStrong((id *)&self->_storeSheetUsageContext, a3);
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, a3);
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, a3);
}

- (ASCLockupProductDetails)lockupProductDetails
{
  return self->_lockupProductDetails;
}

- (void)setLockupProductDetails:(id)a3
{
  objc_storeStrong((id *)&self->_lockupProductDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupProductDetails, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_storeSheetUsageContext, 0);
  objc_storeStrong((id *)&self->_storeSheetHostBundleID, 0);
  objc_storeStrong((id *)&self->_lockupPresenter, 0);
  objc_storeStrong((id *)&self->_metricsPresenter, 0);
  objc_storeStrong((id *)&self->_offerPresenter, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setViewRenderSpanProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCLockupView lockupPresenter](self, "lockupPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setViewRenderSpanProvider:", v4);

}

- (void)presentingViewController
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Lockup view %@ could not find view controller to present from.", v0, 0xCu);
  OUTLINED_FUNCTION_1_2();
}

- (void)offerPresenterWillPerformActionOfOffer:(uint64_t)a3 inState:(uint64_t)a4 withActivity:(uint64_t)a5 inContext:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Offer context configured: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

- (void)offerPresenterPreprocessOffer:inState:completionBlock:.cold.1()
{
  uint64_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v2 = 2112;
  v3 = v0;
  _os_log_debug_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Requesting delegate to preprocess offer: %@, in state: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_2();
}

- (void)productDetailsUserDidInteractWithApp:interactionType:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1BCB7B000, MEMORY[0x1E0C81028], v0, "Product details user did interact with app: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_2();
}

- (void)productDetailsUserDidInteractWithApp:interactionType:.cold.2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "ProductDetailsWillOpenApp", v0, 2u);
}

@end
