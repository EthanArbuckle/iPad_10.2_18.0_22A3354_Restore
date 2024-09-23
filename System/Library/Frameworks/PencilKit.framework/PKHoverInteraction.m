@implementation PKHoverInteraction

- (PKHoverInteraction)initWithDelegate:(id)a3
{
  id v4;
  PKHoverInteraction *v5;
  PKHoverInteraction *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKHoverInteraction;
  v5 = -[PKHoverInteraction init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)didMoveToView:(id)a3
{
  PKHoverController *v4;
  PKHoverController *hoverController;
  id v6;

  v6 = a3;
  -[PKHoverInteraction setView:](self, "setView:", v6);
  if (v6)
  {
    v4 = (PKHoverController *)-[PKHoverController initWithDelegate:view:]((int64x2_t *)[PKHoverController alloc], self, v6);
    hoverController = self->_hoverController;
    self->_hoverController = v4;
  }
  else
  {
    hoverController = self->_hoverController;
    self->_hoverController = 0;
  }

}

- (void)hoverController:(id)a3 holdGestureMeanInputPoint:(id *)a4 latestInputPoint:(id *)a5
{
  PKHoverInteractionDelegate **p_delegate;
  id WeakRetained;
  char v9;
  id v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "hoverInteraction:didBeginHoverAndHoldAtLocation:elevation:", self, a4->var0.var0.x, a4->var0.var0.y, a4->var6);

  }
}

- (void)hoverControllerHoldGestureEnded:(id)a3
{
  PKHoverInteractionDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "hoverInteractionDidEndHoverAndHold:", self);

  }
}

- (PKHoverInteractionDelegate)delegate
{
  return (PKHoverInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (PKHoverController)hoverController
{
  return self->_hoverController;
}

- (void)setHoverController:(id)a3
{
  objc_storeStrong((id *)&self->_hoverController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverController, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
