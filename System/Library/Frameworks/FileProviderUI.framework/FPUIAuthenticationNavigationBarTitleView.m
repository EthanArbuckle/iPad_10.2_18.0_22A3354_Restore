@implementation FPUIAuthenticationNavigationBarTitleView

- (FPUIAuthenticationNavigationBarTitleView)init
{
  FPUIAuthenticationNavigationBarTitleView *v2;
  FPUIAuthenticationNavigationBarTitleView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)FPUIAuthenticationNavigationBarTitleView;
  v2 = -[FPUIAuthenticationNavigationBarTitleView init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FPUIAuthenticationNavigationBarTitleView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    objc_storeWeak((id *)&v3->_activityIndicator, v4);
    v5 = (void *)objc_opt_new();
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)-[FPUIAuthenticationNavigationBarTitleView registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v8, &__block_literal_global_7);

    objc_storeWeak((id *)&v3->_label, v5);
    -[FPUIAuthenticationNavigationBarTitleView updateForChangedTraitsAffectingFonts](v3, "updateForChangedTraitsAffectingFonts");
    -[FPUIAuthenticationNavigationBarTitleView setAxis:](v3, "setAxis:", 0);
    -[FPUIAuthenticationNavigationBarTitleView setSpacing:](v3, "setSpacing:", 5.0);
    -[FPUIAuthenticationNavigationBarTitleView addArrangedSubview:](v3, "addArrangedSubview:", v4);
    -[FPUIAuthenticationNavigationBarTitleView addArrangedSubview:](v3, "addArrangedSubview:", v5);

  }
  return v3;
}

uint64_t __48__FPUIAuthenticationNavigationBarTitleView_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateForChangedTraitsAffectingFonts");
}

- (void)updateForChangedTraitsAffectingFonts
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[FPUIAuthenticationNavigationBarTitleView label](self, "label");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
  v3 = (void *)objc_opt_new();
  -[FPUIAuthenticationNavigationBarTitleView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "verticalSizeClass");

  if (v5 != 1 || (objc_msgSend(v3, "compactAppearance"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v3, "standardAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "titleTextAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

}

- (void)setTitle:(id)a3
{
  UILabel **p_label;
  id v4;
  id WeakRetained;

  p_label = &self->_label;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_label);
  objc_msgSend(WeakRetained, "setText:", v4);

}

- (NSString)title
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  objc_msgSend(WeakRetained, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setActivityIndicatorHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[FPUIAuthenticationNavigationBarTitleView activityIndicator](self, "activityIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  -[FPUIAuthenticationNavigationBarTitleView activityIndicator](self, "activityIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
    objc_msgSend(v6, "stopAnimating");
  else
    objc_msgSend(v6, "startAnimating");

}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_activityIndicator);
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeWeak((id *)&self->_activityIndicator, a3);
}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
  objc_destroyWeak((id *)&self->_activityIndicator);
}

@end
