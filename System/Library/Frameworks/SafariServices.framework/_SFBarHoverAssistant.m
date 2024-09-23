@implementation _SFBarHoverAssistant

- (_SFBarHoverAssistant)initWithBar:(id)a3 withAnimator:(id)a4 inContainerView:(id)a5
{
  id v8;
  id v9;
  id v10;
  _SFBarHoverAssistant *v11;
  _SFBarHoverAssistant *v12;
  uint64_t v13;
  UIHoverGestureRecognizer *hoverRecognizer;
  _SFBarHoverAssistant *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_SFBarHoverAssistant;
  v11 = -[_SFBarHoverAssistant init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_bar, v8);
    objc_storeWeak((id *)&v12->_dynamicBarAnimator, v9);
    objc_msgSend(v9, "addObserver:", v12);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v12, sel__hover_);
    hoverRecognizer = v12->_hoverRecognizer;
    v12->_hoverRecognizer = (UIHoverGestureRecognizer *)v13;

    objc_storeWeak((id *)&v12->_containerView, v10);
    objc_msgSend(v10, "addGestureRecognizer:", v12->_hoverRecognizer);
    v15 = v12;
  }

  return v12;
}

+ (void)attachToBar:(id)a3 withAnimator:(id)a4 inContainerView:(id)a5
{
  id v7;
  id v8;
  id v9;
  _SFBarHoverAssistant *value;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  value = -[_SFBarHoverAssistant initWithBar:withAnimator:inContainerView:]([_SFBarHoverAssistant alloc], "initWithBar:withAnimator:inContainerView:", v9, v8, v7);

  objc_setAssociatedObject(v9, "hoverAssistant", value, (void *)1);
}

- (void)_hover:(id)a3
{
  uint64_t v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id WeakRetained;

  if ((unint64_t)(objc_msgSend(a3, "state") - 1) <= 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicBarAnimator);
    v4 = objc_msgSend(WeakRetained, "targetState");
    v5 = -[_SFBarHoverAssistant _gestureIsOverBar](self, "_gestureIsOverBar");
    v6 = objc_loadWeakRetained((id *)&self->_containerView);
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 || !v5)
    {
      if (v4 == 1)
      {
        v10 = !self->_didShowBarFromHover || v5;
        if ((v10 & 1) == 0 && !v9)
          objc_msgSend(WeakRetained, "attemptTransitionToState:animated:", 0, 1);
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "attemptTransitionToState:animated:", 1, 1);
      self->_didShowBarFromHover = 1;
    }

  }
}

- (BOOL)_gestureIsOverBar
{
  id WeakRetained;
  id v4;
  double v5;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double v12;
  BOOL v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  v4 = objc_loadWeakRetained((id *)&self->_bar);
  -[UIHoverGestureRecognizer locationInView:](self->_hoverRecognizer, "locationInView:", WeakRetained);
  v6 = v5;
  objc_msgSend(v4, "bounds");
  objc_msgSend(WeakRetained, "convertRect:fromView:", v4);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  MinY = CGRectGetMinY(v15);
  objc_msgSend(WeakRetained, "bounds");
  v12 = CGRectGetHeight(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  if (MinY >= v12 - CGRectGetMaxY(v17))
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v13 = v6 >= CGRectGetMinY(v19);
  }
  else
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v13 = v6 <= CGRectGetMaxY(v18);
  }

  return v13;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_hoverRecognizer);

  v4.receiver = self;
  v4.super_class = (Class)_SFBarHoverAssistant;
  -[_SFBarHoverAssistant dealloc](&v4, sel_dealloc);
}

- (void)dynamicBarAnimatorStateDidChange:(id)a3
{
  id WeakRetained;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicBarAnimator);
  v5 = objc_msgSend(WeakRetained, "targetState");

  if (!v5)
    self->_didShowBarFromHover = 0;
}

- (void)dynamicBarAnimatorWillLeaveSteadyState:(id)a3
{
  id WeakRetained;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicBarAnimator);
  v5 = objc_msgSend(WeakRetained, "targetState");

  if (!v5)
    self->_didShowBarFromHover = 0;
}

- (_SFBarCommon)bar
{
  return (_SFBarCommon *)objc_loadWeakRetained((id *)&self->_bar);
}

- (_SFDynamicBarAnimator)dynamicBarAnimator
{
  return (_SFDynamicBarAnimator *)objc_loadWeakRetained((id *)&self->_dynamicBarAnimator);
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_dynamicBarAnimator);
  objc_destroyWeak((id *)&self->_bar);
  objc_storeStrong((id *)&self->_hoverRecognizer, 0);
}

@end
