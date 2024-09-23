@implementation CKNoAnimationSearchFieldAnimator

- (CKNoAnimationSearchFieldAnimator)initWithAppearing:(BOOL)a3
{
  CKNoAnimationSearchFieldAnimator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKNoAnimationSearchFieldAnimator;
  result = -[CKNoAnimationSearchFieldAnimator init](&v5, sel_init);
  if (result)
    result->_appearing = a3;
  return result;
}

- (void)animateTransition:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[CKNoAnimationSearchFieldAnimator isAppearing](self, "isAppearing"))
  {
    objc_msgSend(v6, "viewForKey:", *MEMORY[0x1E0CEBDC0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v5, "addSubview:", v4);

  }
  else
  {
    objc_msgSend(v6, "viewForKey:", *MEMORY[0x1E0CEBDB0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");
  }

  objc_msgSend(v6, "completeTransition:", 1);
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (BOOL)isAppearing
{
  return self->_appearing;
}

- (void)setAppearing:(BOOL)a3
{
  self->_appearing = a3;
}

@end
