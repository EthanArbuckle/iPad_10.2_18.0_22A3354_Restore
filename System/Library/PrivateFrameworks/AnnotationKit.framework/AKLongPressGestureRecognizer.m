@implementation AKLongPressGestureRecognizer

- (void)reset
{
  objc_super v3;

  -[AKLongPressGestureRecognizer setPenGestureDetected:](self, "setPenGestureDetected:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AKLongPressGestureRecognizer;
  -[AKLongPressGestureRecognizer reset](&v3, sel_reset);
}

- (void)_checkTouchesForStylus:(id)a3
{
  id v4;

  objc_msgSend(a3, "anyObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKLongPressGestureRecognizer setPenGestureDetected:](self, "setPenGestureDetected:", objc_msgSend(v4, "type") == 2);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[AKLongPressGestureRecognizer _checkTouchesForStylus:](self, "_checkTouchesForStylus:", v7);
  v8.receiver = self;
  v8.super_class = (Class)AKLongPressGestureRecognizer;
  -[AKLongPressGestureRecognizer touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v7, v6);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[AKLongPressGestureRecognizer _checkTouchesForStylus:](self, "_checkTouchesForStylus:", v7);
  v8.receiver = self;
  v8.super_class = (Class)AKLongPressGestureRecognizer;
  -[AKLongPressGestureRecognizer touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v7, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKLongPressGestureRecognizer;
  -[AKLongPressGestureRecognizer touchesEnded:withEvent:](&v4, sel_touchesEnded_withEvent_, a3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[AKLongPressGestureRecognizer setPenGestureDetected:](self, "setPenGestureDetected:", 0);
  v8.receiver = self;
  v8.super_class = (Class)AKLongPressGestureRecognizer;
  -[AKLongPressGestureRecognizer touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_, v7, v6);

}

- (BOOL)penGestureDetected
{
  return self->_penGestureDetected;
}

- (void)setPenGestureDetected:(BOOL)a3
{
  self->_penGestureDetected = a3;
}

@end
