@implementation BNPanGestureLocalProxy

- (BNPanGestureLocalProxy)initWithPanGestureRecognizer:(id)a3 containerView:(id)a4
{
  id v6;
  id v7;
  BNPanGestureLocalProxy *v8;
  BNPanGestureLocalProxy *v9;
  id v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BNPanGestureLocalProxy;
  v8 = -[BNPanGestureLocalProxy init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = objc_storeWeak((id *)&v8->_panGesture, v6);
    objc_msgSend(v6, "addTarget:action:", v9, sel__handlePan_);

    objc_storeWeak((id *)&v9->_containerView, v7);
  }

  return v9;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "gestureRecognizerProxy:locationForTouch:inCoordinateSpace:", self, 0, v4);
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v10 = objc_loadWeakRetained((id *)&self->_panGesture);
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v11);
    objc_msgSend(v11, "convertPoint:toCoordinateSpace:", v4);
    v7 = v12;
    v9 = v13;

  }
  v14 = v7;
  v15 = v9;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)translationInCoordinateSpace:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "gestureRecognizerProxy:translationInCoordinateSpace:", self, v4);
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v10 = objc_loadWeakRetained((id *)&self->_panGesture);
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "translationInView:", v11);
    objc_msgSend(v11, "convertPoint:toCoordinateSpace:", v4);
    v7 = v12;
    v9 = v13;

  }
  v14 = v7;
  v15 = v9;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)visualTranslationInCoordinateSpace:(id)a3
{
  BNPanGestureProxyDelegate **p_delegate;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "gestureRecognizerProxy:visualTranslationInCoordinateSpace:", self, v5);
  else
    -[BNPanGestureLocalProxy translationInCoordinateSpace:](self, "translationInCoordinateSpace:", v5);
  v9 = v7;
  v10 = v8;

  v11 = v9;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)velocityInCoordinateSpace:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  UIPanGestureRecognizer **p_panGesture;
  id v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "gestureRecognizerProxy:velocityInCoordinateSpace:", self, v4);
    v7 = v6;
    v9 = v8;
  }
  else
  {
    p_panGesture = &self->_panGesture;
    v11 = objc_loadWeakRetained((id *)p_panGesture);
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained((id *)p_panGesture);
    objc_msgSend(v13, "velocityInView:", v12);
    objc_msgSend(v12, "convertPoint:toCoordinateSpace:", v4);
    v7 = v14;
    v9 = v15;

  }
  v16 = v7;
  v17 = v9;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)sendAction
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_panGesture);
  -[BNPanGestureLocalProxy _handlePan:](self, "_handlePan:", WeakRetained);

}

- (void)_handlePan:(id)a3
{
  int64_t v4;
  id WeakRetained;
  double v6;
  double v7;
  void (**actionHandler)(id, BNPanGestureLocalProxy *);

  v4 = objc_msgSend(a3, "state");
  self->_state = v4;
  if (v4 == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
    -[BNPanGestureLocalProxy visualTranslationInCoordinateSpace:](self, "visualTranslationInCoordinateSpace:", WeakRetained);
    v7 = v6;

    if (v7 > 40.0)
      self->_didCrossDefaultThreshold = 1;
  }
  actionHandler = (void (**)(id, BNPanGestureLocalProxy *))self->_actionHandler;
  if (actionHandler)
    actionHandler[2](actionHandler, self);
}

- (int64_t)state
{
  return self->_state;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)didCrossDefaultThreshold
{
  return self->_didCrossDefaultThreshold;
}

- (BNPanGestureProxyDelegate)delegate
{
  return (BNPanGestureProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_panGesture);
}

@end
