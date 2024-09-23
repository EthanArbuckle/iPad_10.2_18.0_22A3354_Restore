@implementation JFXPassThroughContainerView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;
  void *v10;
  unsigned __int8 v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[JFXPassThroughContainerView shouldDelegatePointInside](self, "shouldDelegatePointInside")
    && (-[JFXPassThroughContainerView delegate](self, "delegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    -[JFXPassThroughContainerView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "passThroughContainerView:hasPointInside:", self, x, y);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)JFXPassThroughContainerView;
    v11 = -[JFXPassThroughContainerView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
  }

  return v11;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  JFXPassThroughContainerView *v7;
  void *v8;
  char v9;
  JFXPassThroughContainerView *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)JFXPassThroughContainerView;
  -[JFXPassThroughContainerView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4);
  v7 = (JFXPassThroughContainerView *)objc_claimAutoreleasedReturnValue();
  -[JFXPassThroughContainerView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "passThroughContainerView:shouldHandleTouchWithinView:atPoint:", self, v7, x, y);

  if ((v9 & 1) != 0 || v7 != self)
    v10 = v7;
  else
    v10 = 0;

  return v10;
}

- (JFXPassThroughContainerViewDelegate)delegate
{
  return (JFXPassThroughContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldDelegatePointInside
{
  return self->_shouldDelegatePointInside;
}

- (void)setShouldDelegatePointInside:(BOOL)a3
{
  self->_shouldDelegatePointInside = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
