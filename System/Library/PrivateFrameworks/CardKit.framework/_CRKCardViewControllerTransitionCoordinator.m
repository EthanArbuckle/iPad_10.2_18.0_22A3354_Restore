@implementation _CRKCardViewControllerTransitionCoordinator

- (_CRKCardViewControllerTransitionCoordinator)init
{
  _CRKCardViewControllerTransitionCoordinator *v2;
  _CRKCardViewControllerTransitionCoordinator *v3;
  id initialSetup;
  id finalSetup;
  id animations;
  id completion;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CRKCardViewControllerTransitionCoordinator;
  v2 = -[_CRKCardViewControllerTransitionCoordinator init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_animated = 0;
    initialSetup = v2->_initialSetup;
    v2->_initialSetup = 0;

    finalSetup = v3->_finalSetup;
    v3->_finalSetup = 0;

    animations = v3->_animations;
    v3->_animations = 0;

    completion = v3->_completion;
    v3->_completion = 0;

    objc_storeWeak((id *)&v3->_containerView, 0);
    v3->_duration = 0.2;
  }
  return v3;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (id)initialSetup
{
  return self->_initialSetup;
}

- (void)setInitialSetup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)finalSetup
{
  return self->_finalSetup;
}

- (void)setFinalSetup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (void)setContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_containerView, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_animations, 0);
  objc_storeStrong(&self->_finalSetup, 0);
  objc_storeStrong(&self->_initialSetup, 0);
}

@end
