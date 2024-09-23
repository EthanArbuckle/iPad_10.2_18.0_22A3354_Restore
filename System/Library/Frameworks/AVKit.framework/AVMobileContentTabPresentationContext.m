@implementation AVMobileContentTabPresentationContext

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
    self->_state = a3;
}

- (void)setCustomInfoViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_customInfoViewController;
  UIViewController *customInfoViewController;
  UIViewController *v8;

  v5 = (UIViewController *)a3;
  customInfoViewController = self->_customInfoViewController;
  p_customInfoViewController = &self->_customInfoViewController;
  if (customInfoViewController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_customInfoViewController, a3);
    v5 = v8;
  }

}

- (void)setPresentationHeight:(double)a3
{
  if (self->_presentationHeight != a3)
    self->_presentationHeight = a3;
}

- (void)setContentTabsLayout:(unint64_t)a3
{
  if (self->_contentTabsLayout != a3)
    self->_contentTabsLayout = a3;
}

- (void)setTransitionContext:(id)a3
{
  AVMobileContentTabTransitionContext *v5;
  AVMobileContentTabTransitionContext **p_transitionContext;
  AVMobileContentTabTransitionContext *transitionContext;
  AVMobileContentTabTransitionContext *v8;

  v5 = (AVMobileContentTabTransitionContext *)a3;
  transitionContext = self->_transitionContext;
  p_transitionContext = &self->_transitionContext;
  if (transitionContext != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_transitionContext, a3);
    v5 = v8;
  }

}

- (unint64_t)state
{
  return self->_state;
}

- (UIViewController)customInfoViewController
{
  return self->_customInfoViewController;
}

- (double)presentationHeight
{
  return self->_presentationHeight;
}

- (unint64_t)contentTabsLayout
{
  return self->_contentTabsLayout;
}

- (AVMobileContentTabTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (UIViewController)upcomingCustomInfoViewController
{
  return self->_upcomingCustomInfoViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upcomingCustomInfoViewController, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_customInfoViewController, 0);
}

@end
