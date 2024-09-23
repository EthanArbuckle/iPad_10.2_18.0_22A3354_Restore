@implementation SFScribbleClickGestureRecognizer

- (SFScribbleClickGestureRecognizer)initWithOverlay:(id)a3
{
  id v4;
  SFScribbleClickGestureRecognizer *v5;
  SFScribbleClickGestureRecognizer *v6;
  SFScribbleClickGestureRecognizer *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFScribbleClickGestureRecognizer;
  v5 = -[SFScribbleClickGestureRecognizer initWithTarget:action:](&v9, sel_initWithTarget_action_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_overlay, v4);
    v7 = v6;
  }

  return v6;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  CGPoint *p_touchStartLocation;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFScribbleClickGestureRecognizer;
  v6 = a3;
  -[SFScribbleClickGestureRecognizer touchesBegan:withEvent:](&v12, sel_touchesBegan_withEvent_, v6, a4);
  self->_canDispatchClick = 1;
  p_touchStartLocation = &self->_touchStartLocation;
  objc_msgSend(v6, "anyObject", v12.receiver, v12.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFScribbleClickGestureRecognizer view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInView:", v9);
  p_touchStartLocation->x = v10;
  p_touchStartLocation->y = v11;

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFScribbleClickGestureRecognizer;
  v6 = a3;
  -[SFScribbleClickGestureRecognizer touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFScribbleClickGestureRecognizer _cancelClickIfNeeded:](self, "_cancelClickIfNeeded:", v7);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFScribbleClickGestureRecognizer;
  -[SFScribbleClickGestureRecognizer touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  self->_canDispatchClick = 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFScribbleClickGestureRecognizer;
  v6 = a3;
  -[SFScribbleClickGestureRecognizer touchesEnded:withEvent:](&v9, sel_touchesEnded_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFScribbleClickGestureRecognizer _cancelClickIfNeeded:](self, "_cancelClickIfNeeded:", v7);
  if (self->_canDispatchClick)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_overlay);
    objc_msgSend(WeakRetained, "_didReceiveTapOrClick:", self);

  }
}

- (void)_cancelClickIfNeeded:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  if (self->_canDispatchClick)
  {
    v10 = v4;
    -[SFScribbleClickGestureRecognizer view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    v4 = v10;
    if ((v9 - self->_touchStartLocation.y) * (v9 - self->_touchStartLocation.y)
       + (v7 - self->_touchStartLocation.x) * (v7 - self->_touchStartLocation.x) > 200.0)
      self->_canDispatchClick = 0;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overlay);
}

@end
