@implementation CCUIContentModuleDetailClickPresentationTransition

- (CCUIContentModuleDetailClickPresentationTransition)initWithPresentedViewController:(id)a3 animationController:(id)a4
{
  id v7;
  id v8;
  CCUIContentModuleDetailClickPresentationTransition *v9;
  CCUIContentModuleDetailClickPresentationTransition *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCUIContentModuleDetailClickPresentationTransition;
  v9 = -[CCUIContentModuleDetailClickPresentationTransition init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentedViewController, a3);
    objc_storeStrong((id *)&v10->_animationController, a4);
  }

  return v10;
}

- (UIViewPropertyAnimator)customAnimator
{
  return -[CCUIContentModuleDetailAnimationController propertyAnimator](self->_animationController, "propertyAnimator");
}

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;

  -[UIViewController transitionCoordinator](self->_presentedViewController, "transitionCoordinator", a3, a4, a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "_mainContext");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[CCUIContentModuleDetailAnimationController performTransition:](self->_animationController, "performTransition:", v6);

    }
  }

}

- (void)transitionDidEnd:(BOOL)a3
{
  CCUIContentModuleDetailAnimationController *animationController;

  -[CCUIContentModuleDetailAnimationController animationEnded:](self->_animationController, "animationEnded:", a3);
  animationController = self->_animationController;
  self->_animationController = 0;

}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (CCUIContentModuleDetailAnimationController)animationController
{
  return self->_animationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
}

@end
