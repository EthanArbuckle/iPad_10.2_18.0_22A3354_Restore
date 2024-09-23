@implementation EKUIViewControllerNullTransitionCoordinator

- (BOOL)isCancelled
{
  return 0;
}

- (CGAffineTransform)targetTransform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (double)percentComplete
{
  return 0.0;
}

- (BOOL)isInteractive
{
  return 0;
}

- (UIView)containerView
{
  return (UIView *)(id)objc_opt_new();
}

- (int64_t)completionCurve
{
  return 0;
}

- (double)transitionDuration
{
  return 0.0;
}

- (BOOL)initiallyInteractive
{
  return 0;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (int64_t)presentationStyle
{
  return 0;
}

- (double)completionVelocity
{
  return 0.0;
}

- (BOOL)isAnimated
{
  return 0;
}

- (id)viewControllerForKey:(id)a3
{
  return 0;
}

- (id)viewForKey:(id)a3
{
  return 0;
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  return 0;
}

@end
