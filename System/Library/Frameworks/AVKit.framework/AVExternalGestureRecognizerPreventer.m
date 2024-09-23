@implementation AVExternalGestureRecognizerPreventer

- (AVExternalGestureRecognizerPreventer)initWithTarget:(id)a3 action:(SEL)a4
{
  AVExternalGestureRecognizerPreventer *v4;
  AVExternalGestureRecognizerPreventer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVExternalGestureRecognizerPreventer;
  v4 = -[AVExternalGestureRecognizerPreventer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[AVExternalGestureRecognizerPreventer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
  return v5;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVExternalGestureRecognizerPreventer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isDescendantOfView:", v5);

  if ((v6 & 1) != 0)
    return 0;
  -[AVExternalGestureRecognizerPreventer view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVExternalGestureRecognizerPreventer locationInView:](self, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  -[AVExternalGestureRecognizerPreventer view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hitTest:withEvent:", 0, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EECA2F68))
  {
    -[AVExternalGestureRecognizerPreventer view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertPoint:toView:", v14, v10, v12);
    v7 = objc_msgSend(v14, "avkit_shouldPreventExternalGestureRecognizerAtPoint:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[AVExternalGestureRecognizerPreventer setState:](self, "setState:", 1, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[AVExternalGestureRecognizerPreventer setState:](self, "setState:", 3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[AVExternalGestureRecognizerPreventer setState:](self, "setState:", 4, a4);
}

@end
