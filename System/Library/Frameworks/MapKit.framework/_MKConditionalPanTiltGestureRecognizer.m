@implementation _MKConditionalPanTiltGestureRecognizer

- (_MKConditionalPanTiltGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _MKConditionalPanTiltGestureRecognizer *v4;
  _MKConditionalPanTiltGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKConditionalPanTiltGestureRecognizer;
  v4 = -[_MKConditionalPanGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_MKConditionalPanTiltGestureRecognizer _setCanPanHorizontally:](v4, "_setCanPanHorizontally:", 0);
    -[_MKConditionalPanGestureRecognizer setRequiredModifierFlags:](v5, "setRequiredModifierFlags:", 0x80000);
  }
  return v5;
}

@end
