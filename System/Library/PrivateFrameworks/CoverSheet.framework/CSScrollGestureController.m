@implementation CSScrollGestureController

- (CSScrollGestureController)initWithScrollableView:(id)a3
{
  id v5;
  CSScrollGestureController *v6;
  CSScrollGestureController *v7;
  uint64_t v8;
  UIScrollView *scrollView;
  uint64_t v10;
  UIGestureRecognizer *scrollViewGestureRecognizer;
  CSHorizontalScrollFailureRecognizer *v12;
  CSHorizontalScrollFailureRecognizer *horizontalFailureGestureRecognizer;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSScrollGestureController;
  v6 = -[CSScrollGestureController init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollableView, a3);
    -[CSScrollableView scrollView](v7->_scrollableView, "scrollView");
    v8 = objc_claimAutoreleasedReturnValue();
    scrollView = v7->_scrollView;
    v7->_scrollView = (UIScrollView *)v8;

    -[UIScrollView panGestureRecognizer](v7->_scrollView, "panGestureRecognizer");
    v10 = objc_claimAutoreleasedReturnValue();
    scrollViewGestureRecognizer = v7->_scrollViewGestureRecognizer;
    v7->_scrollViewGestureRecognizer = (UIGestureRecognizer *)v10;

    -[UIGestureRecognizer sbf_setStylusTouchesAllowed:](v7->_scrollViewGestureRecognizer, "sbf_setStylusTouchesAllowed:", 1);
    v12 = -[CSHorizontalScrollFailureRecognizer initWithTarget:action:]([CSHorizontalScrollFailureRecognizer alloc], "initWithTarget:action:", v7, sel__horizontalScrollFailureGestureRecognizerChanged_);
    horizontalFailureGestureRecognizer = v7->_horizontalFailureGestureRecognizer;
    v7->_horizontalFailureGestureRecognizer = v12;

    -[CSHorizontalScrollFailureRecognizer setAllowMultiTouch:](v7->_horizontalFailureGestureRecognizer, "setAllowMultiTouch:", 0);
    -[CSHorizontalScrollFailureRecognizer setDelegate:](v7->_horizontalFailureGestureRecognizer, "setDelegate:", v7);
    -[CSHorizontalScrollFailureRecognizer sbf_setStylusTouchesAllowed:](v7->_horizontalFailureGestureRecognizer, "sbf_setStylusTouchesAllowed:", 1);
    -[CSScrollableView addGestureRecognizer:](v7->_scrollableView, "addGestureRecognizer:", v7->_horizontalFailureGestureRecognizer);
  }

  return v7;
}

- (void)dealloc
{
  id WeakRetained;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSScrollGestureController.m"), 61, CFSTR("ScrollGestureController must be invalidated before it hits dealloc."));

  }
  v6.receiver = self;
  v6.super_class = (Class)CSScrollGestureController;
  -[CSScrollGestureController dealloc](&v6, sel_dealloc);
}

- (void)setScrollingStrategy:(int64_t)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_scrollingStrategy != a3)
  {
    SBLogDashBoardScrollGestures();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCoverSheetScrollingStrategy(self->_scrollingStrategy);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCoverSheetScrollingStrategy(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_INFO, "%{public}@: scrolling strategy changed from %@ to %@", (uint8_t *)&v10, 0x20u);

    }
    -[CSScrollGestureController _updateForScrollingStrategy:fromScrollingStrategy:](self, "_updateForScrollingStrategy:fromScrollingStrategy:", a3, self->_scrollingStrategy);
    self->_scrollingStrategy = a3;
  }
}

- (void)invalidate
{
  -[CSScrollableView removeGestureRecognizer:](self->_scrollableView, "removeGestureRecognizer:", self->_horizontalFailureGestureRecognizer);
  -[CSScrollGestureController setDelegate:](self, "setDelegate:", 0);
  -[CSScrollGestureController setScrollingStrategy:](self, "setScrollingStrategy:", 1);
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  int v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == 10 || v5 == 6)
  {
    -[CSScrollGestureController setScrollingStrategy:](self, "setScrollingStrategy:", 1);
    v7 = objc_msgSend(v4, "isConsumable") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_horizontalScrollFailureGestureRecognizerChanged:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  -[CSScrollGestureController horizontalFailureGestureRecognizer](self, "horizontalFailureGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 == v8)
  {
    v6 = objc_msgSend(v8, "state") == 1;
    v5 = v8;
    if (v6)
    {
      if (-[UIGestureRecognizer state](self->_scrollViewGestureRecognizer, "state") == UIGestureRecognizerStateBegan
        || (v6 = -[UIGestureRecognizer state](self->_scrollViewGestureRecognizer, "state") == UIGestureRecognizerStateChanged,
            v5 = v8,
            v6))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "controllerWillCancelHorizontalScrolling:", self);
        -[UIScrollView _forcePanGestureToEndImmediately](self->_scrollView, "_forcePanGestureToEndImmediately");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "controllerDidCancelHorizontalScrolling:", self);

        v5 = v8;
      }
    }
  }

}

- (NSString)debugDescription
{
  return (NSString *)-[CSScrollGestureController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSScrollGestureController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCoverSheetScrollingStrategy(self->_scrollingStrategy);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("scrollingStrategy"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSScrollGestureController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[CSScrollGestureController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_scrollViewGestureRecognizer, CFSTR("scrollGesture"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_horizontalFailureGestureRecognizer, CFSTR("horizontalCancelGesture"));
  return v4;
}

- (void)_updateForScrollingStrategy:(int64_t)a3 fromScrollingStrategy:(int64_t)a4
{
  _BOOL8 v7;
  _BOOL4 v8;
  _BOOL8 v9;
  void *v10;

  v7 = -[CSScrollGestureController _shouldFailHorizontalSwipesForScrollingStrategy:](self, "_shouldFailHorizontalSwipesForScrollingStrategy:");
  v8 = -[CSScrollGestureController _shouldAllowScrollForScrollingStrategy:](self, "_shouldAllowScrollForScrollingStrategy:", a4);
  v9 = -[CSScrollGestureController _shouldAllowScrollForScrollingStrategy:](self, "_shouldAllowScrollForScrollingStrategy:", a3);
  -[CSScrollGestureController horizontalFailureGestureRecognizer](self, "horizontalFailureGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v7);

  if (v8 != v9)
    -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", v9);
}

- (BOOL)_shouldFailHorizontalSwipesForScrollingStrategy:(int64_t)a3
{
  return a3 == 1;
}

- (BOOL)_shouldAllowScrollForScrollingStrategy:(int64_t)a3
{
  return a3 != 3;
}

- (int64_t)scrollingStrategy
{
  return self->_scrollingStrategy;
}

- (CSScrollGestureControllerDelegate)delegate
{
  return (CSScrollGestureControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSHorizontalScrollFailureRecognizer)horizontalFailureGestureRecognizer
{
  return self->_horizontalFailureGestureRecognizer;
}

- (void)setHorizontalFailureGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalFailureGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalFailureGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollViewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollableView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
