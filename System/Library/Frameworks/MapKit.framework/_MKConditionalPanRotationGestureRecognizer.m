@implementation _MKConditionalPanRotationGestureRecognizer

- (_MKConditionalPanRotationGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _MKConditionalPanRotationGestureRecognizer *v4;
  _MKConditionalPanRotationGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKConditionalPanRotationGestureRecognizer;
  v4 = -[_MKConditionalPanGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_MKConditionalPanRotationGestureRecognizer _setCanPanVertically:](v4, "_setCanPanVertically:", 0);
    -[_MKConditionalPanGestureRecognizer setRequiredModifierFlags:](v5, "setRequiredModifierFlags:", 0x80000);
  }
  return v5;
}

@end
