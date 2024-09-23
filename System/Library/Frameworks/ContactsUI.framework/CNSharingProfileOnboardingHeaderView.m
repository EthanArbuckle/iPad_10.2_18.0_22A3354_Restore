@implementation CNSharingProfileOnboardingHeaderView

- (void)setHeaderView:(id)a3
{
  OBHeaderView *v5;
  OBHeaderView **p_headerView;
  OBHeaderView *headerView;
  OBHeaderView *v8;

  v5 = (OBHeaderView *)a3;
  p_headerView = &self->_headerView;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    v8 = v5;
    -[OBHeaderView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    v5 = v8;
    if (v8)
    {
      -[CNSharingProfileOnboardingHeaderView bounds](self, "bounds");
      -[OBHeaderView setFrame:](*p_headerView, "setFrame:");
      -[OBHeaderView setAutoresizingMask:](*p_headerView, "setAutoresizingMask:", 18);
      -[CNSharingProfileOnboardingHeaderView addSubview:](self, "addSubview:", *p_headerView);
      v5 = v8;
    }
  }

}

- (CNSharingProfileOnboardingHeaderView)initWithTitle:(id)a3
{
  CNSharingProfileOnboardingHeaderView *v3;
  CNSharingProfileOnboardingHeaderView *v4;
  CNSharingProfileOnboardingHeaderView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNSharingProfileOnboardingHeaderView;
  v3 = -[CNSharingProfileOnboardingHeaderView initWithFrame:](&v7, sel_initWithFrame_, a3, 0.0, 0.0, 50.0, 50.0);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (id)reuseIdentifier
{
  return (id)objc_msgSend((id)objc_opt_class(), "reuseIdentifier");
}

- (OBHeaderView)headerView
{
  return self->_headerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("CNSharingProfileOnboardingHeaderView");
}

@end
