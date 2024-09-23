@implementation SFScrollingPanGestureRecognizer

- (SFScrollingPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SFScrollingPanGestureRecognizer *v4;
  SFScrollingPanGestureRecognizer *v5;
  SFScrollingPanGestureRecognizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFScrollingPanGestureRecognizer;
  v4 = -[SFScrollingPanGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SFScrollingPanGestureRecognizer setAllowedScrollTypesMask:](v4, "setAllowedScrollTypesMask:", 3);
    v6 = v5;
  }

  return v5;
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFScrollingPanGestureRecognizer;
  if (-[SFScrollingPanGestureRecognizer _shouldTryToBeginWithEvent:](&v7, sel__shouldTryToBeginWithEvent_, v4))
    v5 = objc_msgSend(v4, "buttonMask") == 0;
  else
    v5 = 0;

  return v5;
}

@end
