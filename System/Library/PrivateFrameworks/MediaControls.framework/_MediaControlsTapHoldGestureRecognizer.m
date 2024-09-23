@implementation _MediaControlsTapHoldGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MediaControlsTapHoldGestureRecognizer;
  -[_MediaControlsTapHoldGestureRecognizer touchesBegan:withEvent:](&v12, sel_touchesBegan_withEvent_, v6, a4);
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MediaControlsTapHoldGestureRecognizer view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v9);
    self->_startingLocation.x = v10;
    self->_startingLocation.y = v11;

    -[_MediaControlsTapHoldGestureRecognizer setState:](self, "setState:", 1);
  }
  else
  {
    -[_MediaControlsTapHoldGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MediaControlsTapHoldGestureRecognizer;
  -[_MediaControlsTapHoldGestureRecognizer touchesMoved:withEvent:](&v14, sel_touchesMoved_withEvent_, v6, a4);
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MediaControlsTapHoldGestureRecognizer view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v9);
    v11 = v10;
    v13 = v12;

    if ((v13 - self->_startingLocation.y) * (v13 - self->_startingLocation.y)
       + (v11 - self->_startingLocation.x) * (v11 - self->_startingLocation.x) > 484.0)
      -[_MediaControlsTapHoldGestureRecognizer setState:](self, "setState:", 5);

  }
  else
  {
    -[_MediaControlsTapHoldGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MediaControlsTapHoldGestureRecognizer;
  -[_MediaControlsTapHoldGestureRecognizer touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[_MediaControlsTapHoldGestureRecognizer setState:](self, "setState:", 3);
}

@end
