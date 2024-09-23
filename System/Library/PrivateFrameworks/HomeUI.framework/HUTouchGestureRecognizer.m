@implementation HUTouchGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend(a3, "count") != 1)
    -[HUTouchGestureRecognizer setState:](self, "setState:", 5);
  -[HUTouchGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[HUTouchGestureRecognizer setState:](self, "setState:", 2, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[HUTouchGestureRecognizer setState:](self, "setState:", 3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[HUTouchGestureRecognizer setState:](self, "setState:", 4, a4);
}

@end
