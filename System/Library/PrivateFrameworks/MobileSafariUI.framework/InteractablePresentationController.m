@implementation InteractablePresentationController

- (InteractablePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  InteractablePresentationController *v4;
  InteractablePresentationController *v5;
  InteractablePresentationController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)InteractablePresentationController;
  v4 = -[InteractablePresentationController initWithPresentedViewController:presentingViewController:](&v8, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[InteractablePresentationController _setContainerIgnoresDirectTouchEvents:](v4, "_setContainerIgnoresDirectTouchEvents:", 1);
    v6 = v5;
  }

  return v5;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

@end
