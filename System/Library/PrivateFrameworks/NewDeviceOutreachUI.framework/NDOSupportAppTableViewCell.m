@implementation NDOSupportAppTableViewCell

+ (int64_t)cellStyle
{
  return 3;
}

- (NDOSupportAppTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  NDOSupportAppTableViewCell *v9;
  NDOSupportAppTableViewCell *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  uint64_t v16;
  objc_super v18;

  v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)NDOSupportAppTableViewCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v18, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[NDOSupportAppTableViewCell _setupAppSuportCell](v9, "_setupAppSuportCell");
    objc_msgSend(v8, "propertyForKey:", CFSTR("NDOWarranty"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "supportAppURL");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (__CFString *)v12;
    else
      v14 = CFSTR("https://getsupport.apple.com/?caller=prefscoverage");
    objc_storeStrong((id *)&v10->_supportAppURL, v14);

    _NDOLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[NDOSupportAppTableViewCell initWithStyle:reuseIdentifier:specifier:].cold.1((uint64_t *)&v10->_supportAppURL, v15, v16);

  }
  return v10;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;
  NSRect v8;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "lockupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  NSStringFromRect(v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136446466;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_229EC7000, a2, v5, "%{public}s: lockupView frame: %@", (uint8_t *)v6);

}

- (void)_setupAppSuportCell
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UITraitChangeRegistration *v28;
  UITraitChangeRegistration *traitRegistration;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE04480]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[NDOSupportAppTableViewCell setLockupView:](self, "setLockupView:", v4);

  -[NDOSupportAppTableViewCell lockupView](self, "lockupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[NDOSupportAppTableViewCell lockupView](self, "lockupView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = *MEMORY[0x24BE04440];
  -[NDOSupportAppTableViewCell lockupView](self, "lockupView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSize:", v7);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Bridge")))
  {
    objc_msgSend(MEMORY[0x24BE044A0], "primaryTheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BE044A0]);
    objc_msgSend(v11, "titleBackgroundColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "orangeColor");
    v31 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "orangeColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "colorWithAlphaComponent:", 0.3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subtitleTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "orangeColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "progressColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v12, "initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:", v30, v13, v15, v16, v17, v18);
    -[NDOSupportAppTableViewCell lockupView](self, "lockupView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setOfferTheme:", v19);

    v10 = v31;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04450]), "initWithStringValue:", CFSTR("1130498044"));
  v22 = objc_alloc(MEMORY[0x24BE04478]);
  v23 = (void *)objc_msgSend(v22, "_initWithID:kind:context:clientID:", v21, *MEMORY[0x24BE04430], *MEMORY[0x24BE04420], CFSTR("SupportApp"));
  -[NDOSupportAppTableViewCell lockupView](self, "lockupView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRequest:", v23);

  -[NDOSupportAppTableViewCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOSupportAppTableViewCell lockupView](self, "lockupView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  -[NDOSupportAppTableViewCell layoutSubviews](self, "layoutSubviews");
  v32[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOSupportAppTableViewCell registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v27, sel_didChangeTraitPreferredContentSizeCategory);
  v28 = (UITraitChangeRegistration *)objc_claimAutoreleasedReturnValue();
  traitRegistration = self->_traitRegistration;
  self->_traitRegistration = v28;

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v13 = (void *)MEMORY[0x24BDD1628];
  -[NDOSupportAppTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOSupportAppTableViewCell lockupView](self, "lockupView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  -[NDOSupportAppTableViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOSupportAppTableViewCell lockupView](self, "lockupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v5;
  -[NDOSupportAppTableViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOSupportAppTableViewCell lockupView](self, "lockupView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v11);

  v20.receiver = self;
  v20.super_class = (Class)NDOSupportAppTableViewCell;
  -[NDOSupportAppTableViewCell updateConstraints](&v20, sel_updateConstraints);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NDOSupportAppTableViewCell lockupView](self, "lockupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[NDOSupportAppTableViewCell unregisterForTraitChanges:](self, "unregisterForTraitChanges:", self->_traitRegistration);
  v3.receiver = self;
  v3.super_class = (Class)NDOSupportAppTableViewCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (void)openButtonAction
{
  void *v2;
  NSString *supportAppURL;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = (void *)MEMORY[0x24BDBCF48];
  supportAppURL = self->_supportAppURL;
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](supportAppURL, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__NDOSupportAppTableViewCell_openButtonAction__block_invoke;
  v9[3] = &unk_24F334910;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "openURL:options:completionHandler:", v8, MEMORY[0x24BDBD1B8], v9);

}

void __46__NDOSupportAppTableViewCell_openButtonAction__block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;

  if ((a2 & 1) == 0)
  {
    _NDOLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __46__NDOSupportAppTableViewCell_openButtonAction__block_invoke_cold_1(a1, v3);

  }
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[NDOSupportAppTableViewCell presentingViewControllerForLockupView:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  -[NDOSupportAppTableViewCell parentViewController](self, "parentViewController");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)lockupViewDidBeginRequest:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  _NDOLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[NDOSupportAppTableViewCell lockupViewDidBeginRequest:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  ASCOffer *v14;
  ASCOffer *originalAppOffer;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  _NDOLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[NDOSupportAppTableViewCell lockupViewDidFinishRequest:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  if (!self->_originalAppOffer)
  {
    objc_msgSend(v4, "lockup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "offer");
    v14 = (ASCOffer *)objc_claimAutoreleasedReturnValue();
    originalAppOffer = self->_originalAppOffer;
    self->_originalAppOffer = v14;

  }
  objc_msgSend(MEMORY[0x24BE04490], "sharedMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lockupWithOffer:", self->_originalAppOffer);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v16, "recordCampaignToken:providerToken:withLockup:", CFSTR("coverage.settings"), CFSTR("2003"), v18);

}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  _NDOLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[NDOSupportAppTableViewCell lockupView:didFailRequestWithError:].cold.1();

}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v6 = a3;
  v7 = a4;
  _NDOLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[NDOSupportAppTableViewCell lockupView:appStateDidChange:].cold.1();

  if ((objc_msgSend(v7, "isEqual:", *MEMORY[0x24BE043E0]) & 1) != 0
    || objc_msgSend(v7, "isEqual:", *MEMORY[0x24BE043E8]))
  {
    v9 = (void *)MEMORY[0x24BE04498];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OPEN"), &stru_24F3352F8, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textMetadataWithTitle:subtitle:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x24BE04468]);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __59__NDOSupportAppTableViewCell_lockupView_appStateDidChange___block_invoke;
    v17[3] = &unk_24F334938;
    v17[4] = self;
    v14 = (void *)objc_msgSend(v13, "initWithMetadata:action:", v12, v17);
    objc_msgSend(v6, "lockup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lockupWithOffer:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLockup:", v16);

  }
}

uint64_t __59__NDOSupportAppTableViewCell_lockupView_appStateDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __59__NDOSupportAppTableViewCell_lockupView_appStateDidChange___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  return objc_msgSend(*(id *)(a1 + 32), "openButtonAction");
}

- (id)parentViewController
{
  return 0;
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
  objc_storeStrong((id *)&self->_lockupView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_traitRegistration, 0);
  objc_storeStrong((id *)&self->_originalAppOffer, 0);
  objc_storeStrong((id *)&self->_supportAppURL, 0);
}

- (void)initWithStyle:(uint64_t *)a1 reuseIdentifier:(NSObject *)a2 specifier:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 136446466;
  v5 = "-[NDOSupportAppTableViewCell initWithStyle:reuseIdentifier:specifier:]";
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_3(&dword_229EC7000, a2, a3, "%{public}s: supportApp url: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __46__NDOSupportAppTableViewCell_openButtonAction__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_229EC7000, a2, OS_LOG_TYPE_ERROR, "Could not open URL %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)presentingViewControllerForLockupView:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)lockupViewDidBeginRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s: Started Request", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)lockupViewDidFinishRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s: Finished Request", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)lockupView:didFailRequestWithError:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_229EC7000, v0, OS_LOG_TYPE_ERROR, "%{public}s: Failed with error: %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)lockupView:appStateDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_229EC7000, v0, v1, "%{public}s: appStateDidChange with state: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __59__NDOSupportAppTableViewCell_lockupView_appStateDidChange___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s: appStateDidChange with action", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
