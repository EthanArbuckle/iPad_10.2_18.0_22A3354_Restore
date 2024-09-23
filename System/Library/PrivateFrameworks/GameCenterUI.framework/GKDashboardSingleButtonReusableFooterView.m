@implementation GKDashboardSingleButtonReusableFooterView

- (void)awakeFromNib
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardSingleButtonReusableFooterView;
  -[GKDashboardSingleButtonReusableFooterView awakeFromNib](&v4, sel_awakeFromNib);
  -[GKDashboardSingleButtonReusableFooterView button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_buttonTapped_, 64);

}

- (void)setButtonTitle:(id)a3 forState:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[GKDashboardSingleButtonReusableFooterView button](self, "button");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v6, a4);

}

- (void)buttonTapped:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[GKDashboardSingleButtonReusableFooterView buttonTapHandler](self, "buttonTapHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GKDashboardSingleButtonReusableFooterView buttonTapHandler](self, "buttonTapHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (NSLayoutConstraint)buttonLeadingConstraint
{
  return self->_buttonLeadingConstraint;
}

- (void)setButtonLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonLeadingConstraint, a3);
}

- (id)buttonTapHandler
{
  return self->_buttonTapHandler;
}

- (void)setButtonTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong(&self->_buttonTapHandler, 0);
  objc_storeStrong((id *)&self->_buttonLeadingConstraint, 0);
}

@end
