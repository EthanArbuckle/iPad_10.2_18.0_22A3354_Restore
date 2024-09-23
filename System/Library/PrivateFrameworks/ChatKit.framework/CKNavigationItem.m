@implementation CKNavigationItem

- (UIScrollView)contentScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_contentScrollView);
}

- (void)setContentScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_contentScrollView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentScrollView);
}

@end
