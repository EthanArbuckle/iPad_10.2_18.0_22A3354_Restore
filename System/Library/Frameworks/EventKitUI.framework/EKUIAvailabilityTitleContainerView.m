@implementation EKUIAvailabilityTitleContainerView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 1000.0;
  v3 = 1000.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKUIAvailabilityTitleContainerView;
  -[EKUIAvailabilityTitleContainerView layoutSubviews](&v4, sel_layoutSubviews);
  -[EKUIAvailabilityTitleContainerView controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configureNavBarAndToolBar");

}

- (EKUIAvailabilityViewController)controller
{
  return (EKUIAvailabilityViewController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

@end
