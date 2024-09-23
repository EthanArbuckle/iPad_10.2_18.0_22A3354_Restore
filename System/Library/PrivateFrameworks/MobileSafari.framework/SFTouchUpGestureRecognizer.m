@implementation SFTouchUpGestureRecognizer

- (SFTouchUpGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SFTouchUpGestureRecognizer *v4;
  SFTouchUpGestureRecognizer *v5;
  SFTouchUpGestureRecognizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFTouchUpGestureRecognizer;
  v4 = -[SFTouchUpGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SFTouchUpGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[SFTouchUpGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    v6 = v5;
  }

  return v5;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFTouchUpGestureRecognizer;
  -[SFTouchUpGestureRecognizer touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[SFTouchUpGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFTouchUpGestureRecognizer;
  -[SFTouchUpGestureRecognizer touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[SFTouchUpGestureRecognizer setState:](self, "setState:", 3);
}

@end
