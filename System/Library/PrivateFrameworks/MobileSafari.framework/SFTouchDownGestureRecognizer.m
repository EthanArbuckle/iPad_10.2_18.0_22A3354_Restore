@implementation SFTouchDownGestureRecognizer

- (SFTouchDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SFTouchDownGestureRecognizer *v4;
  SFTouchDownGestureRecognizer *v5;
  SFTouchDownGestureRecognizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFTouchDownGestureRecognizer;
  v4 = -[SFTouchDownGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SFTouchDownGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[SFTouchDownGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    v6 = v5;
  }

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFTouchDownGestureRecognizer;
  -[SFTouchDownGestureRecognizer touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[SFTouchDownGestureRecognizer setState:](self, "setState:", 3);
}

@end
