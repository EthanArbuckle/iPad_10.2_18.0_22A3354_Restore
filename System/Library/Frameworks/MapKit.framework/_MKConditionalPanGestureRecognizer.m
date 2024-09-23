@implementation _MKConditionalPanGestureRecognizer

- (void)setRequiredModifierFlags:(int64_t)a3
{
  self->_requiredModifierFlags = a3;
}

- (_MKConditionalPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKConditionalPanGestureRecognizer;
  return -[_MKConditionalPanGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, a3, a4);
}

- (BOOL)_shouldReceiveEvent:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (!-[_MKConditionalPanGestureRecognizer state](self, "state")
    && (self->_requiredModifierFlags & ~objc_msgSend(v4, "modifierFlags")) != 0)
  {
    -[_MKConditionalPanGestureRecognizer setState:](self, "setState:", 5);
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_MKConditionalPanGestureRecognizer;
    v5 = -[_MKConditionalPanGestureRecognizer _shouldReceiveEvent:](&v7, sel__shouldReceiveEvent_, v4);
  }

  return v5;
}

- (int64_t)requiredModifierFlags
{
  return self->_requiredModifierFlags;
}

@end
