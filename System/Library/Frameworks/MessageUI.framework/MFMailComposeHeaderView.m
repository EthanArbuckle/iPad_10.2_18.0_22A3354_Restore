@implementation MFMailComposeHeaderView

- (void)setDisplayMetrics:(id)a3
{
  MFComposeDisplayMetrics *v5;

  v5 = (MFComposeDisplayMetrics *)a3;
  if (self->_displayMetrics != v5)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    -[MFMailComposeHeaderView displayMetricsDidChange](self, "displayMetricsDidChange");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  -[MFMailComposeHeaderView traitCollection](self, "traitCollection", a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeHeaderView directionalLayoutMargins](self, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MFMailComposeHeaderView safeAreaInsets](self, "safeAreaInsets");
  +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v17, v5, v7, v9, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeHeaderView setDisplayMetrics:](self, "setDisplayMetrics:", v16);

}

- (void)layoutMarginsDidChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MFMailComposeHeaderView;
  -[MFMailComposeHeaderView layoutMarginsDidChange](&v17, sel_layoutMarginsDidChange);
  -[MFMailComposeHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeHeaderView directionalLayoutMargins](self, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MFMailComposeHeaderView safeAreaInsets](self, "safeAreaInsets");
  +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v3, v5, v7, v9, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeHeaderView setDisplayMetrics:](self, "setDisplayMetrics:", v16);

}

- (void)displayMetricsDidChange
{
  id v3;

  -[MFMailComposeHeaderView displayMetrics](self, "displayMetrics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerViewSeparatorInset");
  -[MFMailComposeHeaderView setSeparatorDirectionalEdgeInsets:](self, "setSeparatorDirectionalEdgeInsets:");

}

- (MFComposeDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMetrics, 0);
}

@end
