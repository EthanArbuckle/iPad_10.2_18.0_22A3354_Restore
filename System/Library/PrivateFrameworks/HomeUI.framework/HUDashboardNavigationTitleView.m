@implementation HUDashboardNavigationTitleView

- (HUDashboardNavigationTitleView)initWithDelegate:(id)a3
{
  id v4;
  HUDashboardNavigationTitleView *v5;
  HUDashboardNavigationTitleView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUDashboardNavigationTitleView;
  v5 = -[HUDashboardNavigationTitleView init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_previousLargeTitleHeight = 0.0;
  }

  return v6;
}

- (void)contentDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUDashboardNavigationTitleView;
  -[_UINavigationBarTitleView contentDidChange](&v10, sel_contentDidChange);
  -[_UINavigationBarTitleView largeTitleHeight](self, "largeTitleHeight");
  v4 = round(v3);
  -[_UINavigationBarTitleView largeTitleHeightRange](self, "largeTitleHeightRange");
  v6 = v5;
  -[_UINavigationBarTitleView largeTitleHeightRange](self, "largeTitleHeightRange");
  v8 = fmax(v6, fmin(v7, v4));
  if (self->_previousLargeTitleHeight != v8)
  {
    -[HUDashboardNavigationTitleView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "largeTitleHeightDidChange:", v8);

  }
  self->_previousLargeTitleHeight = v8;
}

- (HUDashboardNavigationTitleViewDelegate)delegate
{
  return (HUDashboardNavigationTitleViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)previousLargeTitleHeight
{
  return self->_previousLargeTitleHeight;
}

- (void)setPreviousLargeTitleHeight:(double)a3
{
  self->_previousLargeTitleHeight = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
