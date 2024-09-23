@implementation CSDiscoveryItemPlatterSleepMigration

- (CSDiscoveryItemPlatterSleepMigration)init
{
  CSDiscoveryItemPlatterSleepMigration *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSDiscoveryItemPlatterSleepMigration;
  v2 = -[PLPlatterDiscoveryView init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DISCOVERY_LIST_ITEM_PLATTER_SLEEP_MIGRATION_TITLE"), &stru_1E8E30B28, CFSTR("CoverSheet"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterDiscoveryView setTitleText:](v2, "setTitleText:", v4);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DISCOVERY_LIST_ITEM_PLATTER_SLEEP_MIGRATION_BODY"), &stru_1E8E30B28, CFSTR("CoverSheet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterDiscoveryView setBodyText:](v2, "setBodyText:", v6);

  }
  return v2;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)CSDiscoveryItemPlatterSleepMigration;
  -[PLPlatterDiscoveryView layoutSubviews](&v3, sel_layoutSubviews);
  -[CSDiscoveryItemPlatterSleepMigration _configureGraphicViewIfNecessary](self, "_configureGraphicViewIfNecessary");
  -[CSDiscoveryItemPlatterSleepMigration bounds](self, "bounds");
  if (CGRectGetWidth(v4) > 0.0)
    -[CSDiscoveryItemPlatterSleepMigration _layoutGraphicView](self, "_layoutGraphicView");
}

- (void)_configureGraphicViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *deviceImageView;
  UIImageView *v8;
  void *v9;
  UIView *v10;
  UIView *sleepSymbolBackgroundView;
  UIView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIView *v18;
  UIView *sleepSymbolImageView;
  UIView *v20;
  void *v21;
  id v22;

  -[PLPlatterDiscoveryView graphicView](self, "graphicView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 2, 70.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("apps.iphone"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v5);
    deviceImageView = self->_deviceImageView;
    self->_deviceImageView = v6;

    -[UIImageView setContentMode:](self->_deviceImageView, "setContentMode:", 11);
    objc_msgSend(v22, "addSubview:", self->_deviceImageView);
    v8 = self->_deviceImageView;
    -[PLPlatterDiscoveryView strokeVisualStylingProvider](self, "strokeVisualStylingProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterDiscoveryView updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v8, 1, v9, 0);

    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    sleepSymbolBackgroundView = self->_sleepSymbolBackgroundView;
    self->_sleepSymbolBackgroundView = v10;

    v12 = self->_sleepSymbolBackgroundView;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    objc_msgSend(v22, "addSubview:", self->_sleepSymbolBackgroundView);
    objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB550], 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("bed.double.fill"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v17);
    sleepSymbolImageView = self->_sleepSymbolImageView;
    self->_sleepSymbolImageView = v18;

    v20 = self->_sleepSymbolImageView;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemMintColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v20, "setTintColor:", v21);

    objc_msgSend(v22, "addSubview:", self->_sleepSymbolImageView);
    -[PLPlatterDiscoveryView setGraphicView:](self, "setGraphicView:", v22);

  }
}

- (void)_layoutGraphicView
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MinX;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  uint64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v3 = -[CSDiscoveryItemPlatterSleepMigration _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CSDiscoveryItemPlatterSleepMigration traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  -[PLPlatterDiscoveryView graphicView](self, "graphicView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");

  UIRectCenteredIntegralRectScale();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIImageView setFrame:](self->_deviceImageView, "setFrame:", v6);
  v28.origin.x = v9;
  v28.origin.y = v11;
  v28.size.width = v13;
  v28.size.height = v15;
  MinX = CGRectGetMinX(v28);
  v17 = -0.0;
  if (v3)
    v17 = v13;
  v18 = MinX + v17 + 15.0;
  v29.origin.x = v9;
  v29.origin.y = v11;
  v29.size.width = v13;
  v29.size.height = v15;
  -[UIView setCenter:](self->_sleepSymbolImageView, "setCenter:", v18, CGRectGetMaxY(v29) + -15.0);
  -[UIView frame](self->_sleepSymbolImageView, "frame");
  v27 = v6;
  UIRectCenteredIntegralRectScale();
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[UIView setFrame:](self->_sleepSymbolBackgroundView, "setFrame:", v27);
  v30.origin.x = v20;
  v30.origin.y = v22;
  v30.size.width = v24;
  v30.size.height = v26;
  -[UIView _setCornerRadius:](self->_sleepSymbolBackgroundView, "_setCornerRadius:", CGRectGetWidth(v30) * 0.5);
}

- (void)visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  UIImageView *deviceImageView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSDiscoveryItemPlatterSleepMigration;
  -[PLPlatterDiscoveryView visualStylingProviderDidChange:forCategory:outgoingProvider:](&v8, sel_visualStylingProviderDidChange_forCategory_outgoingProvider_, a3, a4, a5);
  deviceImageView = self->_deviceImageView;
  -[PLPlatterDiscoveryView strokeVisualStylingProvider](self, "strokeVisualStylingProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPlatterDiscoveryView updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", deviceImageView, 1, v7, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceImageView, 0);
  objc_storeStrong((id *)&self->_sleepSymbolImageView, 0);
  objc_storeStrong((id *)&self->_sleepSymbolBackgroundView, 0);
}

@end
