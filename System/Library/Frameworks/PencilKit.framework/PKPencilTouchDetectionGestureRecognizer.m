@implementation PKPencilTouchDetectionGestureRecognizer

- (PKPencilTouchDetectionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  PKPencilTouchDetectionGestureRecognizer *v4;
  PKPencilTouchDetectionGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPencilTouchDetectionGestureRecognizer;
  v4 = -[PKPencilTouchDetectionGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PKPencilTouchDetectionGestureRecognizer setAllowedTouchTypes:](v4, "setAllowedTouchTypes:", &unk_1E77EC940);
    -[PKPencilTouchDetectionGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 0);
    -[PKPencilTouchDetectionGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
  }
  return v5;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (void)updateTimestampsforTouches:(id)a3 withEvent:(id)a4
{
  unsigned int v5;
  void *v6;
  char v7;
  id v8;

  v5 = objc_msgSend(a4, "PK_isEventFromCrayon", a3);
  -[PKPencilTouchDetectionGestureRecognizer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[PKPencilTouchDetectionGestureRecognizer delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateTimestampForType:", v5);

  }
}

@end
