@implementation _SFWebView

- (void)setHitTestInsets:(UIEdgeInsets)a3
{
  self->_hitTestInsets = a3;
}

- (void)_setObscuredInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v19;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[_SFWebView _obscuredInsets](self, "_obscuredInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v19.receiver = self;
  v19.super_class = (Class)_SFWebView;
  -[_SFWebView _setObscuredInsets:](&v19, sel__setObscuredInsets_, top, left, bottom, right);
  -[SFDialogView setObscuredInsets:](self->_dialogView, "setObscuredInsets:", top, left, bottom, right);
  if (self->_placeholderView)
  {
    if (v11 != left || v9 != top || v15 != right || v13 != bottom)
      -[_SFWebView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPlaceholderImage:(id)a3
{
  -[_SFWebView setPlaceholderImage:offset:](self, "setPlaceholderImage:offset:", a3, 0.0);
}

- (void)setBottomBarHeightAboveKeyboard:(double)a3
{
  if ((_SFEqualWithEpsilon() & 1) == 0)
  {
    self->_bottomBarHeightAboveKeyboard = a3;
    -[SFWebFormAccessoryViewWrapper setBottomBarHeight:](self->_inputAccessoryContainerView, "setBottomBarHeight:", a3);
    -[_SFWebView reloadInputViews](self, "reloadInputViews");
  }
}

- (id)_enclosingViewForExposedRectComputation
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_clippingView);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SFWebView;
    -[_SFWebView _enclosingViewForExposedRectComputation](&v8, sel__enclosingViewForExposedRectComputation);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat Width;
  CGFloat v19;
  _QWORD v20[9];
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)_SFWebView;
  -[_SFWebView layoutSubviews](&v21, sel_layoutSubviews);
  -[_SFWebView _updateNavigationGesturesAllowed](self, "_updateNavigationGesturesAllowed");
  if (self->_placeholderView)
  {
    -[_SFWebView _obscuredInsets](self, "_obscuredInsets");
    v4 = v3;
    -[_SFWebView bounds](self, "bounds");
    v6 = v5;
    v8 = v7 + 0.0;
    v10 = v4 + v9;
    v12 = v11 - (v4 + 0.0);
    -[UIImageView image](self->_placeholderView, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    v15 = v14;
    v17 = v16;

    v22.origin.x = v8;
    v22.origin.y = v10;
    v22.size.width = v6;
    v22.size.height = v12;
    Width = CGRectGetWidth(v22);
    v19 = v10 + self->_placeholderOffset;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __28___SFWebView_layoutSubviews__block_invoke;
    v20[3] = &unk_1E4AC7E20;
    v20[4] = self;
    *(CGFloat *)&v20[5] = v8;
    *(CGFloat *)&v20[6] = v19;
    *(CGFloat *)&v20[7] = v6;
    *(double *)&v20[8] = v17 * Width / v15;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v20);
  }
}

- (void)_updateNavigationGesturesAllowed
{
  int64_t navigationGesturePolicy;
  objc_super v3;
  objc_super v4;

  navigationGesturePolicy = self->_navigationGesturePolicy;
  if (navigationGesturePolicy == 1)
  {
    -[_SFWebView setAllowsBackForwardNavigationGestures:](&v3, sel_setAllowsBackForwardNavigationGestures_, 0, self, _SFWebView, v4.receiver, v4.super_class);
  }
  else if (!navigationGesturePolicy)
  {
    -[_SFWebView setAllowsBackForwardNavigationGestures:](&v4, sel_setAllowsBackForwardNavigationGestures_, self->_dialogView == 0, v3.receiver, v3.super_class, self, _SFWebView);
  }
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *callStackSymbolsForLastRemovalFromWindow;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFWebView;
  -[_SFWebView didMoveToWindow](&v7, sel_didMoveToWindow);
  -[_SFWebView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    self->_hasBeenInWindow = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    callStackSymbolsForLastRemovalFromWindow = self->_callStackSymbolsForLastRemovalFromWindow;
    self->_callStackSymbolsForLastRemovalFromWindow = v5;

  }
}

- (_SFWebView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  _SFWebView *v4;
  void *v5;
  void *v6;
  void *v7;
  _SFWebView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SFWebView;
  v4 = -[_SFWebView initWithFrame:configuration:](&v10, sel_initWithFrame_configuration_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__sf_applicationDidEnterBackgroundOrWillTerminate_, *MEMORY[0x1E0DC4768], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__sf_applicationDidEnterBackgroundOrWillTerminate_, *MEMORY[0x1E0DC4870], 0);
    -[_SFWebView scrollView](v4, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "_setAlwaysAppliesKeyboardBottomInsetAdjustment:", 1);
    objc_msgSend(v6, "setContentInsetAdjustmentBehavior:", 2);
    SFFocusGroupIdentifierForOwner();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFWebView setFocusGroupIdentifier:](v4, "setFocusGroupIdentifier:", v7);

    v8 = v4;
  }

  return v4;
}

- (void)safeAreaInsetsDidChange
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFWebView;
  -[_SFWebView safeAreaInsetsDidChange](&v4, sel_safeAreaInsetsDidChange);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sfWebViewDidChangeSafeAreaInsets:", self);

}

- (void)setPlaceholderImage:(id)a3 offset:(double)a4
{
  id v6;
  id v7;
  void *v8;
  NSTimer *placeholderViewRemovalTimer;
  UIImageView *placeholderView;
  UIImageView *v11;
  UIImageView *v12;
  UIImageView *v13;
  double placeholderOffset;
  void *v15;
  void *v16;
  NSTimer *v17;
  NSTimer *v18;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[5];
  _QWORD v23[5];

  v6 = a3;
  -[UIImageView image](self->_placeholderView, "image");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {
    placeholderOffset = self->_placeholderOffset;

    if (placeholderOffset == a4)
      goto LABEL_13;
  }
  else
  {

  }
  -[_SFWebView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScrollEnabled:", v6 == 0);

  -[NSTimer invalidate](self->_placeholderViewRemovalTimer, "invalidate");
  placeholderViewRemovalTimer = self->_placeholderViewRemovalTimer;
  self->_placeholderViewRemovalTimer = 0;

  if (v6)
  {
    objc_initWeak(&location, self);
    placeholderView = self->_placeholderView;
    if (!placeholderView)
    {
      v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v12 = self->_placeholderView;
      self->_placeholderView = v11;

      v13 = self->_placeholderView;
      if (self->_contentObscuringView)
        -[_SFWebView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v13);
      else
        -[_SFWebView addSubview:](self, "addSubview:", v13);
      -[_SFWebView setNeedsLayout](self, "setNeedsLayout");
      placeholderView = self->_placeholderView;
    }
    -[UIImageView setImage:](placeholderView, "setImage:", v6);
    -[UIImageView setAlpha:](self->_placeholderView, "setAlpha:", 1.0);
    -[UIImageView layer](self->_placeholderView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAllAnimations");

    self->_placeholderOffset = a4;
    v16 = (void *)MEMORY[0x1E0C99E88];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __41___SFWebView_setPlaceholderImage_offset___block_invoke_3;
    v19[3] = &unk_1E4AC1450;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v16, "scheduledTimerWithTimeInterval:repeats:block:", 0, v19, 5.0);
    v17 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v18 = self->_placeholderViewRemovalTimer;
    self->_placeholderViewRemovalTimer = v17;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v22[4] = self;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __41___SFWebView_setPlaceholderImage_offset___block_invoke;
    v23[3] = &unk_1E4ABFE00;
    v23[4] = self;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __41___SFWebView_setPlaceholderImage_offset___block_invoke_2;
    v22[3] = &unk_1E4AC05E0;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0x10000, v23, v22, 0.2, 0.05);
  }
LABEL_13:

}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_placeholderViewRemovalTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SFWebView;
  -[_SFWebView dealloc](&v3, sel_dealloc);
}

- (id)scrollViewAtLocation:(CGPoint)a3
{
  _SFWebView *v4;
  _SFWebView *v5;
  _SFWebView *v6;
  _SFWebView *v7;

  -[_SFWebView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  v4 = (_SFWebView *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0;
  if (!v4 || v4 == self)
  {
    v7 = v4;
  }
  else
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      -[_SFWebView superview](v5, "superview");
      v7 = (_SFWebView *)objc_claimAutoreleasedReturnValue();

      v6 = 0;
      if (v7)
      {
        v5 = v7;
        if (v7 != self)
          continue;
      }
      goto LABEL_9;
    }
    v7 = v5;
    v6 = v7;
  }
LABEL_9:

  return v6;
}

- (void)setNavigationGesturePolicy:(int64_t)a3
{
  self->_navigationGesturePolicy = a3;
  -[_SFWebView _updateNavigationGesturesAllowed](self, "_updateNavigationGesturesAllowed");
}

- (void)_close
{
  objc_super v3;

  -[WKWebView _sf_saveUnsubmittedGeneratedPasswordAndRemoveFormMetadata](self, "_sf_saveUnsubmittedGeneratedPasswordAndRemoveFormMetadata");
  v3.receiver = self;
  v3.super_class = (Class)_SFWebView;
  -[_SFWebView _close](&v3, sel__close);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  double top;
  double left;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  objc_super v27;
  CGPoint v28;
  CGPoint v29;
  CGRect v30;
  CGRect v31;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if ((-[_SFWebView isHidden](self, "isHidden") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[_SFWebView bounds](self, "bounds");
    top = self->_hitTestInsets.top;
    left = self->_hitTestInsets.left;
    v30.origin.x = v11 + left;
    v30.origin.y = v12 + top;
    v30.size.width = v13 - (left + self->_hitTestInsets.right);
    v30.size.height = v14 - (top + self->_hitTestInsets.bottom);
    v28.x = x;
    v28.y = y;
    if (CGRectContainsPoint(v30, v28))
    {
      v27.receiver = self;
      v27.super_class = (Class)_SFWebView;
      -[_SFWebView hitTest:withEvent:](&v27, sel_hitTest_withEvent_, v7, x, y);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_SFWebView scrollView](self, "scrollView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      objc_msgSend(v15, "convertPoint:fromView:", self, x, y);
      v29.x = v24;
      v29.y = v25;
      v31.origin.x = v17;
      v31.origin.y = v19;
      v31.size.width = v21;
      v31.size.height = v23;
      if (CGRectContainsPoint(v31, v29))
        v8 = v15;
      else
        v8 = 0;

    }
  }

  return v8;
}

- (BOOL)becomeFirstResponder
{
  id WeakRetained;
  SFDialogView *dialogView;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sfWebViewDidBecomeFirstResponder:", self);
  dialogView = self->_dialogView;
  if (dialogView)
  {
    v5 = -[SFDialogView becomeFirstResponder](dialogView, "becomeFirstResponder");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SFWebView;
    v5 = -[_SFWebView becomeFirstResponder](&v8, sel_becomeFirstResponder);
  }
  v6 = v5;

  return v6;
}

- (void)didStartFormControlInteraction
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sfWebViewDidStartFormControlInteraction:", self);

}

- (void)didEndFormControlInteraction
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sfWebViewDidEndFormControlInteraction:", self);

}

- (id)inputDashboardViewController
{
  return self->_inputDashboardViewController;
}

- (id)inputAccessoryView
{
  uint64_t v3;
  void *v4;
  SFWebFormAccessoryViewWrapper *inputAccessoryContainerView;
  SFWebFormAccessoryViewWrapper *v6;
  SFWebFormAccessoryViewWrapper *v7;
  void *v8;
  SFWebFormAccessoryViewWrapper *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_SFWebView;
  -[_SFWebView inputAccessoryView](&v11, sel_inputAccessoryView);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    inputAccessoryContainerView = (SFWebFormAccessoryViewWrapper *)v3;
    if (self->_bottomBarHeightAboveKeyboard != 0.0)
    {
      inputAccessoryContainerView = self->_inputAccessoryContainerView;
      if (!inputAccessoryContainerView)
      {
        v6 = (SFWebFormAccessoryViewWrapper *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EF10]), "initWithWebFormAccessoryView:bottomBarHeight:", v3, self->_bottomBarHeightAboveKeyboard);
        v7 = self->_inputAccessoryContainerView;
        self->_inputAccessoryContainerView = v6;

        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFWebFormAccessoryViewWrapper setBackgroundColor:](self->_inputAccessoryContainerView, "setBackgroundColor:", v8);

        -[SFWebFormAccessoryViewWrapper setTranslatesAutoresizingMaskIntoConstraints:](self->_inputAccessoryContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        inputAccessoryContainerView = self->_inputAccessoryContainerView;
      }
    }
    v9 = inputAccessoryContainerView;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)undoManager
{
  id WeakRetained;
  void *v4;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(WeakRetained, "overrideUndoManagerForSFWebView:", self),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6.receiver = self;
    v6.super_class = (Class)_SFWebView;
    -[_SFWebView undoManager](&v6, sel_undoManager);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (NSString)evOrganizationName
{
  uint64_t v2;
  __SecTrust *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = -[_SFWebView serverTrust](self, "serverTrust");
  if (!v2)
    goto LABEL_11;
  v3 = (__SecTrust *)v2;
  v4 = (void *)SecTrustCopyInfo();
  if (!v4)
  {
    v7 = 0;
    if (!SecTrustEvaluateWithError(v3, 0))
      return (NSString *)v7;
    v4 = (void *)SecTrustCopyInfo();
    if (!v4)
    {
LABEL_11:
      v7 = 0;
      return (NSString *)v7;
    }
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CD7050]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "BOOLValue"))
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CD7068]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "BOOLValue"))
    {
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CD7048]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (void)setObscuringContents:(BOOL)a3
{
  id v4;
  UIView *v5;
  UIView *contentObscuringView;
  void *v7;
  UIView *v8;

  if (self->_obscuringContents != a3)
  {
    self->_obscuringContents = a3;
    if (a3)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[_SFWebView bounds](self, "bounds");
      v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
      contentObscuringView = self->_contentObscuringView;
      self->_contentObscuringView = v5;

      -[UIView setAutoresizingMask:](self->_contentObscuringView, "setAutoresizingMask:", 18);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_contentObscuringView, "setBackgroundColor:", v7);

      -[_SFWebView addSubview:](self, "addSubview:", self->_contentObscuringView);
    }
    else
    {
      -[UIView removeFromSuperview](self->_contentObscuringView, "removeFromSuperview");
      v8 = self->_contentObscuringView;
      self->_contentObscuringView = 0;

    }
  }
}

- (void)setSuggestedFilenameForCurrentBackForwardListItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_SFWebView backForwardList](self, "backForwardList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sf_setExplicitSuggestedFilename:", v4);

}

- (void)presentDialogView:(id)a3 withAdditionalAnimations:(id)a4 forDialogController:(id)a5
{
  id v8;
  id v9;
  SFDialogView *dialogView;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];

  v8 = a3;
  v9 = a4;
  objc_storeStrong((id *)&self->_dialogView, a3);
  -[SFDialogView setAutoresizingMask:](self->_dialogView, "setAutoresizingMask:", 18);
  -[_SFWebView bounds](self, "bounds");
  -[SFDialogView setFrame:](self->_dialogView, "setFrame:");
  dialogView = self->_dialogView;
  -[_SFWebView _obscuredInsets](self, "_obscuredInsets");
  -[SFDialogView setObscuredInsets:](dialogView, "setObscuredInsets:");
  -[_SFWebView addSubview:](self, "addSubview:", self->_dialogView);
  -[SFDialogView setAlpha:](self->_dialogView, "setAlpha:", 0.0);
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77___SFWebView_presentDialogView_withAdditionalAnimations_forDialogController___block_invoke;
  v17[3] = &unk_1E4ABFE00;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v17);
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __77___SFWebView_presentDialogView_withAdditionalAnimations_forDialogController___block_invoke_2;
  v15[3] = &unk_1E4AC1338;
  v13 = v9;
  v15[4] = self;
  v16 = v13;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __77___SFWebView_presentDialogView_withAdditionalAnimations_forDialogController___block_invoke_3;
  v14[3] = &unk_1E4AC05E0;
  v14[4] = self;
  objc_msgSend(v12, "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v15, v14);
  if ((-[_SFWebView isFirstResponder](self, "isFirstResponder") & 1) != 0
    || -[_SFWebView _isAncestorOfFirstResponder](self, "_isAncestorOfFirstResponder"))
  {
    -[SFDialogView becomeFirstResponder](self->_dialogView, "becomeFirstResponder");
  }

}

- (void)dismissDialogView:(id)a3 withAdditionalAnimations:(id)a4 forDialogController:(id)a5
{
  id v7;
  id v8;
  SFDialogView *dialogView;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  dialogView = self->_dialogView;
  self->_dialogView = 0;

  -[_SFWebView setNeedsLayout](self, "setNeedsLayout");
  objc_msgSend(v7, "willDisappear");
  v10 = MEMORY[0x1E0C809B0];
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77___SFWebView_dismissDialogView_withAdditionalAnimations_forDialogController___block_invoke;
  v16[3] = &unk_1E4AC1338;
  v18 = v8;
  v17 = v7;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __77___SFWebView_dismissDialogView_withAdditionalAnimations_forDialogController___block_invoke_2;
  v14[3] = &unk_1E4AC05E0;
  v15 = v17;
  v12 = v17;
  v13 = v8;
  objc_msgSend(v11, "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v16, v14);

}

- (BOOL)webui_canPromptForAccountSecurityRecommendation
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "sfWebViewCanPromptForAccountSecurityRecommendation");
  else
    v3 = 1;

  return v3;
}

- (void)webui_setInputDashboardViewController:(id)a3
{
  UIPredictiveViewController *v5;
  void *v6;
  UIPredictiveViewController *v7;

  v5 = (UIPredictiveViewController *)a3;
  if (self->_inputDashboardViewController != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_inputDashboardViewController, a3);
    -[_SFWebView firstResponder](self, "firstResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadInputViews");

    v5 = v7;
  }

}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFWebView;
  -[_SFWebView findInteraction:didEndFindSession:](&v6, sel_findInteraction_didEndFindSession_, a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sfWebViewDidDismissFindOnPage:", self);

}

- (UIEdgeInsets)hitTestInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestInsets.top;
  left = self->_hitTestInsets.left;
  bottom = self->_hitTestInsets.bottom;
  right = self->_hitTestInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)navigationGesturePolicy
{
  return self->_navigationGesturePolicy;
}

- (_SFWebViewDelegate)delegate
{
  return (_SFWebViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)clippingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_clippingView);
}

- (void)setClippingView:(id)a3
{
  objc_storeWeak((id *)&self->_clippingView, a3);
}

- (double)bottomBarHeightAboveKeyboard
{
  return self->_bottomBarHeightAboveKeyboard;
}

- (BOOL)isObscuringContents
{
  return self->_obscuringContents;
}

- (BOOL)hasBeenInWindow
{
  return self->_hasBeenInWindow;
}

- (NSArray)callStackSymbolsForLastRemovalFromWindow
{
  return self->_callStackSymbolsForLastRemovalFromWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callStackSymbolsForLastRemovalFromWindow, 0);
  objc_destroyWeak((id *)&self->_clippingView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inputDashboardViewController, 0);
  objc_storeStrong((id *)&self->_inputAccessoryContainerView, 0);
  objc_storeStrong((id *)&self->_contentObscuringView, 0);
  objc_storeStrong((id *)&self->_placeholderViewRemovalTimer, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_dialogView, 0);
}

@end
