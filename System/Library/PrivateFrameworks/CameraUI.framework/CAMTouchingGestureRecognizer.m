@implementation CAMTouchingGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[CAMTouchingGestureRecognizer _incrementTouchesBy:](self, "_incrementTouchesBy:", objc_msgSend(a3, "count"));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[CAMTouchingGestureRecognizer _decrementTouchesBy:](self, "_decrementTouchesBy:", objc_msgSend(a3, "count"));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[CAMTouchingGestureRecognizer _decrementTouchesBy:](self, "_decrementTouchesBy:", objc_msgSend(a3, "count"));
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMTouchingGestureRecognizer;
  -[CAMTouchingGestureRecognizer setEnabled:](&v5, sel_setEnabled_);
  if (!a3)
    -[CAMTouchingGestureRecognizer _setTouchCount:](self, "_setTouchCount:", 0);
}

- (void)reset
{
  -[CAMTouchingGestureRecognizer _setTouchCount:](self, "_setTouchCount:", 0);
}

- (void)cancelGesture
{
  -[CAMTouchingGestureRecognizer setState:](self, "setState:", 4);
}

- (void)_setTouchCount:(unint64_t)a3
{
  if (self->__touchCount != a3)
  {
    self->__touchCount = a3;
    -[CAMTouchingGestureRecognizer _updateStateFromTouchCount:toTouchCount:](self, "_updateStateFromTouchCount:toTouchCount:");
  }
}

- (void)_updateStateFromTouchCount:(unint64_t)a3 toTouchCount:(unint64_t)a4
{
  uint64_t v4;

  if (a3 && !a4)
  {
    v4 = 3;
LABEL_4:
    -[CAMTouchingGestureRecognizer setState:](self, "setState:", v4);
    return;
  }
  if (!a3 && a4)
  {
    v4 = 1;
    goto LABEL_4;
  }
}

- (void)_incrementTouchesBy:(unint64_t)a3
{
  -[CAMTouchingGestureRecognizer _setTouchCount:](self, "_setTouchCount:", -[CAMTouchingGestureRecognizer _touchCount](self, "_touchCount") + a3);
}

- (void)_decrementTouchesBy:(unint64_t)a3
{
  unint64_t v5;

  if (-[CAMTouchingGestureRecognizer _touchCount](self, "_touchCount") >= a3)
    v5 = -[CAMTouchingGestureRecognizer _touchCount](self, "_touchCount") - a3;
  else
    v5 = 0;
  -[CAMTouchingGestureRecognizer _setTouchCount:](self, "_setTouchCount:", v5);
}

- (unint64_t)_touchCount
{
  return self->__touchCount;
}

@end
