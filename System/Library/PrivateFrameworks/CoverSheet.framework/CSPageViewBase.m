@implementation CSPageViewBase

- (CSPageViewControllerProtocol)pageViewController
{
  return (CSPageViewControllerProtocol *)objc_loadWeakRetained((id *)&self->_pageViewController);
}

- (void)setPageViewController:(id)a3
{
  objc_storeWeak((id *)&self->_pageViewController, a3);
}

- (double)contentWidth
{
  return self->_contentWidth;
}

- (void)setContentWidth:(double)a3
{
  self->_contentWidth = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageViewController);
}

@end
