@implementation CDPRemoteSecretEntryPane

- (CDPRemoteSecretEntryPane)initWithFrame:(CGRect)a3
{
  CDPRemoteSecretEntryPane *v3;
  CDPRemoteSecretEntryPane *v4;
  UIScrollView *containerView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CDPRemoteSecretEntryPane;
  v3 = -[CDPPassphraseEntryPane initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    containerView = v3->super._containerView;
    -[CDPRemoteSecretEntryPane _createFooterButton](v3, "_createFooterButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView addSubview:](containerView, "addSubview:", v6);

  }
  return v4;
}

- (double)keyboardHeightOffset
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double MaxY;
  double v29;
  CGRect v30;
  CGRect v31;

  v3 = (void *)MEMORY[0x24BEBD6C8];
  -[PSEditingPane viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeForInterfaceOrientation:", objc_msgSend(v4, "interfaceOrientation"));
  v29 = v5;

  -[PSEditingPane viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSEditingPane viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v7, "convertRect:toView:", 0);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v30.origin.x = v20;
  v30.origin.y = v22;
  v30.size.width = v24;
  v30.size.height = v26;
  MaxY = CGRectGetMaxY(v30);
  v31.origin.x = v11;
  v31.origin.y = v13;
  v31.size.width = v15;
  v31.size.height = v17;
  return fmax(v29 - (MaxY - CGRectGetMaxY(v31)), 0.0);
}

- (id)_createFooterButton
{
  UIButton *v3;
  UIButton *footerButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  footerButton = self->_footerButton;
  self->_footerButton = v3;

  -[UIButton titleLabel](self->_footerButton, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  -[UIButton titleLabel](self->_footerButton, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", 1);

  -[UIButton titleLabel](self->_footerButton, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BEBB520];
  v9 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredFontForTextStyle:compatibleWithTraitCollection:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v12);

  -[UIButton setAutoresizingMask:](self->_footerButton, "setAutoresizingMask:", 12);
  return self->_footerButton;
}

- (void)setEscapeOffer:(id)a3
{
  CDPRemoteValidationEscapeOffer **p_escapeOffer;
  UIButton *footerButton;
  void *v7;
  id v8;

  v8 = a3;
  p_escapeOffer = &self->_escapeOffer;
  -[UIButton removeTarget:action:forControlEvents:](self->_footerButton, "removeTarget:action:forControlEvents:", self->_escapeOffer, sel_handleEscapeAction_, 64);
  if (v8)
  {
    objc_storeStrong((id *)&self->_escapeOffer, a3);
    -[UIButton addTarget:action:forControlEvents:](self->_footerButton, "addTarget:action:forControlEvents:", *p_escapeOffer, sel_handleEscapeAction_, 64);
    footerButton = self->_footerButton;
    -[CDPRemoteValidationEscapeOffer escapeOfferName](*p_escapeOffer, "escapeOfferName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](footerButton, "setTitle:forState:", v7, 0);

  }
  else
  {
    -[UIButton removeFromSuperview](self->_footerButton, "removeFromSuperview");
  }

}

- (void)setRemoteSecretType:(unint64_t)a3
{
  self->_remoteSecretType = a3;
}

- (void)setTitle:(id)a3
{
  CDPPaneHeaderView *headerView;
  id v4;
  id v5;

  headerView = self->super._headerView;
  v4 = a3;
  -[CDPPaneHeaderView detailTextLabel](headerView, "detailTextLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)didFinishResizingHeaderView
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  CGRect v7;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 560), "bounds");
  NSStringFromCGRect(v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_20DC8F000, a2, OS_LOG_TYPE_DEBUG, "\"Available frame for remote secret view: %@\", (uint8_t *)&v4, 0xCu);

}

- (void)didFinishResizingPinView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double Height;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double MidX;
  CGFloat v32;
  double v33;
  CGFloat v34;
  void *v35;
  CGFloat v36;
  UIScrollView *containerView;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  -[CDPRemoteSecretEntryPane _scaledFooterPadding](self, "_scaledFooterPadding");
  v4 = v3;
  -[UIButton frame](self->_footerButton, "frame");
  v41 = v6;
  v42 = v5;
  -[UIButton titleLabel](self->_footerButton, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteSecretEntryPane frame](self, "frame");
  objc_msgSend(v7, "sizeThatFits:", CGRectGetWidth(v43), 1.79769313e308);
  v39 = v9;
  v40 = v8;
  v10 = v9;

  v11 = (int)*MEMORY[0x24BE75678];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v11), "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v38 = v17;
  v20 = v19;

  v44.origin.x = v14;
  v44.origin.y = v16;
  v44.size.width = v18;
  v44.size.height = v20;
  Height = CGRectGetHeight(v44);
  -[CDPPassphraseEntryPane desiredMinPinHeight](self, "desiredMinPinHeight");
  v23 = v22;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v11), "superview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  v26 = 0.0;
  if (Height > v23)
    v26 = v4 + v10;
  v27 = v20 - v26;
  if (Height <= v23)
    v4 = 8.0;
  v28 = v14;
  objc_msgSend(v24, "setFrame:", v14, v16, v38, v27);

  v29 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v11);
  objc_msgSend(v29, "superview");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  objc_msgSend(v29, "setFrame:");

  -[UIScrollView bounds](self->super._containerView, "bounds");
  MidX = CGRectGetMidX(v45);
  v46.origin.y = v41;
  v46.origin.x = v42;
  v46.size.width = v40;
  v46.size.height = v39;
  v32 = MidX + CGRectGetWidth(v46) * -0.5;
  -[CDPRemoteSecretEntryPane _footerRectY:](self, "_footerRectY:", v28, v16, v38, v27);
  v34 = v33;
  -[UIButton setFrame:](self->_footerButton, "setFrame:", v32, v33, v40, v39);
  v47.origin.x = v32;
  v47.origin.y = v34;
  v47.size.width = v40;
  v47.size.height = v39;
  -[UIScrollView setContentSize:](self->super._containerView, "setContentSize:", 0.0, v4 + CGRectGetMaxY(v47) + self->super._keyboardOffset);
  -[UIButton superview](self->_footerButton, "superview");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75680]), "frame");
    v36 = CGRectGetMaxY(v48) + self->super._keyboardOffset;
    containerView = self->super._containerView;
    -[UIScrollView frame](containerView, "frame");
    -[UIScrollView setContentOffset:](containerView, "setContentOffset:", 0.0, fmax(v36 - CGRectGetHeight(v49), 0.0));
  }
}

- (double)_scaledFooterPadding
{
  double v2;
  void *v3;
  double v4;
  double v5;

  if (-[CDPPassphraseEntryPane isSmallScreen](self, "isSmallScreen"))
    v2 = 8.0;
  else
    v2 = 24.0;
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:", v2);
  v5 = v4;

  return v5;
}

- (void)setDevice:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  objc_storeStrong((id *)&self->_device, a3);
  objc_msgSend(v28, "modelClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceClass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CDPRemoteSecretEntryPane _headerStringForDevice:localDeviceClass:](self, "_headerStringForDevice:localDeviceClass:", v28, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v28, "modelClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[CDPPaneHeaderView textLabel](self->super._headerView, "textLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v12);

      v14 = (void *)MEMORY[0x24BE1A458];
      v15 = CFSTR("REMOTE_SECRET_ENTRY_SUBTITLE");
      v27 = v8;
      if ((objc_msgSend(CFSTR("REMOTE_SECRET_ENTRY_SUBTITLE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
        || !_os_feature_enabled_impl())
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(CFSTR("REMOTE_SECRET_ENTRY_SUBTITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v16 = 1;
      }
      objc_msgSend(v14, "builderForKey:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSecretType:", objc_msgSend(v28, "localSecretType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPPaneHeaderView subLabel](self->super._headerView, "subLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v19);

      if (v16)
      v21 = (void *)MEMORY[0x24BEBB520];
      v22 = *MEMORY[0x24BEBE1D0];
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "traitCollection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "preferredFontForTextStyle:compatibleWithTraitCollection:", v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPPaneHeaderView subLabel](self->super._headerView, "subLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setFont:", v25);

      -[CDPPaneHeaderView makeAllTheTextFits](self->super._headerView, "makeAllTheTextFits");
      v8 = v27;
    }
    -[CDPPaneHeaderView layoutSubviews](self->super._headerView, "layoutSubviews");

  }
}

- (id)_headerStringForDevice:(id)a3 localDeviceClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 remoteAccountRecovery;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isCurrentDevice"))
  {
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasLocalSecret"))
    {
      remoteAccountRecovery = self->_remoteAccountRecovery;

      if (remoteAccountRecovery)
      {
        v10 = (void *)MEMORY[0x24BE1A458];
        v11 = CFSTR("ACCOUNT_RECOVERY_CURRENT_DEVICE_REMOTE_SECRET_TITLE");
LABEL_16:
        objc_msgSend(v10, "builderForKey:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSecretType:", objc_msgSend(v6, "localSecretType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    else
    {

    }
    v10 = (void *)MEMORY[0x24BE1A458];
    v11 = CFSTR("REMOTE_SECRET_ENTRY_TITLE_OLD");
    goto LABEL_16;
  }
  objc_msgSend(v6, "modelClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v7 && v12)
  {
    objc_msgSend(v6, "modelClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", v7);

    if (v15)
    {
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_TITLE_SPECIFIC_OTHER"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSecretType:", objc_msgSend(v6, "localSecretType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addUnqualifiedDeviceClass:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "modelClass");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE1A458];
  if (!v20)
  {
    v11 = CFSTR("REMOTE_SECRET_ENTRY_TITLE_GENERIC_OTHER");
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_TITLE_SPECIFIC"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelClass");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addUnqualifiedDeviceClass:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
LABEL_17:

  return v19;
}

- (CDPRemoteValidationEscapeOffer)escapeOffer
{
  return self->_escapeOffer;
}

- (unint64_t)remoteSecretType
{
  return self->_remoteSecretType;
}

- (CDPDevice)device
{
  return self->_device;
}

- (BOOL)remoteAccountRecovery
{
  return self->_remoteAccountRecovery;
}

- (void)setRemoteAccountRecovery:(BOOL)a3
{
  self->_remoteAccountRecovery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_escapeOffer, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
}

@end
