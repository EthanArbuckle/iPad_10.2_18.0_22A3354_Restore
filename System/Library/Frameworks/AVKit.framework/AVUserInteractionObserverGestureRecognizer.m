@implementation AVUserInteractionObserverGestureRecognizer

- (AVUserInteractionObserverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  AVUserInteractionObserverGestureRecognizer *v4;
  uint64_t v5;
  NSMutableSet *trackedTouches;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVUserInteractionObserverGestureRecognizer;
  v4 = -[AVUserInteractionObserverGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    trackedTouches = v4->_trackedTouches;
    v4->_trackedTouches = (NSMutableSet *)v5;

    -[AVUserInteractionObserverGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
  }
  return v4;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;

  v5 = a3;
  -[AVUserInteractionObserverGestureRecognizer setState:](self, "setState:", 1);
  -[NSMutableSet unionSet:](self->_trackedTouches, "unionSet:", v5);

}

- (void)_touchesEndedOrCancelled:(id)a3
{
  -[NSMutableSet minusSet:](self->_trackedTouches, "minusSet:", a3);
  if (!-[NSMutableSet count](self->_trackedTouches, "count"))
    -[AVUserInteractionObserverGestureRecognizer setState:](self, "setState:", 3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedTouches, 0);
}

@end
