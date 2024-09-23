@implementation CSNotificationViewController

- (void)expandedPlatterDidPresent:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MaxY;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v20.receiver = self;
  v20.super_class = (Class)CSNotificationViewController;
  -[NCNotificationShortLookViewController expandedPlatterDidPresent:](&v20, sel_expandedPlatterDidPresent_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "platterBarSwipeAffordanceViewForParticipant:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", self);
    -[NCNotificationShortLookViewController containerViewForExpandedContent](self, "containerViewForExpandedContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v5);
    objc_msgSend(v6, "bounds");
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    CGRectGetWidth(v21);
    objc_msgSend(v5, "sizeThatFits:", width, height);
    BSRectWithSize();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    MaxY = CGRectGetMaxY(v22);
    v23.origin.x = v12;
    v23.origin.y = v14;
    v23.size.width = v16;
    v23.size.height = v18;
    objc_msgSend(v5, "setFrame:", v12, MaxY - CGRectGetHeight(v23), v16, v18);
    objc_msgSend(v5, "setAutoresizingMask:", 10);

  }
  objc_msgSend(WeakRetained, "setWantsHomeGesture:", 1);

}

- (void)expandedPlatter:(id)a3 willDismissWithReason:(id)a4
{
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSNotificationViewController;
  -[NCNotificationShortLookViewController expandedPlatter:willDismissWithReason:](&v6, sel_expandedPlatter_willDismissWithReason_, a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  objc_msgSend(WeakRetained, "setWantsHomeGesture:", 0);

}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  id v3;
  void *v4;
  id v5;

  -[NCNotificationShortLookViewController presentedExpandedPlatterViewController](self, "presentedExpandedPlatterViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = v5;
    objc_msgSend(v3, "dismisser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expandedPlatterPresentable:requestsDismissalWithTrigger:", v3, 2);

  }
}

- (SBUIPresentableHomeGestureContext)homeGestureContext
{
  return (SBUIPresentableHomeGestureContext *)objc_loadWeakRetained((id *)&self->_homeGestureContext);
}

- (void)setHomeGestureContext:(id)a3
{
  objc_storeWeak((id *)&self->_homeGestureContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeGestureContext);
}

@end
