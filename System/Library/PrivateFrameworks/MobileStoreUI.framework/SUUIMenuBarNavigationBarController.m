@implementation SUUIMenuBarNavigationBarController

- (id)fallbackTitleView
{
  return self->_titleView;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
