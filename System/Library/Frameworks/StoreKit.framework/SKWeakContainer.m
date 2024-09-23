@implementation SKWeakContainer

- (UIView)scrollingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_scrollingView);
}

- (void)setScrollingView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollingView, a3);
}

- (UIView)trackingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_trackingView);
}

- (void)setTrackingView:(id)a3
{
  objc_storeWeak((id *)&self->_trackingView, a3);
}

- (BOOL)wasOnScreen
{
  return self->_wasOnScreen;
}

- (void)setWasOnScreen:(BOOL)a3
{
  self->_wasOnScreen = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trackingView);
  objc_destroyWeak((id *)&self->_scrollingView);
}

@end
