@implementation SUUIScrollForwardingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SUUIScrollForwardingView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIScrollForwardingView;
  -[SUUIScrollForwardingView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SUUIScrollForwardingView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    -[SUUIScrollForwardingView scrollView](self, "scrollView");
    v5 = (SUUIScrollForwardingView *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
