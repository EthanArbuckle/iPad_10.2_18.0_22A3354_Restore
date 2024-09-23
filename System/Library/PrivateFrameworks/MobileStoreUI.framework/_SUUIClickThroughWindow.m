@implementation _SUUIClickThroughWindow

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  char v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_SUUIClickThroughWindow interactionView](self, "interactionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_SUUIClickThroughWindow interactionView](self, "interactionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUUIClickThroughWindow convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
    v11 = v10;
    v13 = v12;

    -[_SUUIClickThroughWindow interactionView](self, "interactionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "pointInside:withEvent:", v7, v11, v13);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _SUUIClickThroughWindow *v5;
  _SUUIClickThroughWindow *v6;
  _SUUIClickThroughWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SUUIClickThroughWindow;
  -[_SUUIClickThroughWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_SUUIClickThroughWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (UIView)interactionView
{
  return self->_interactionView;
}

- (void)setInteractionView:(id)a3
{
  objc_storeStrong((id *)&self->_interactionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionView, 0);
}

@end
