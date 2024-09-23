@implementation AMSUIMessageButton

- (AMSUIMessageButton)initWithDialogAction:(id)a3 messageStyle:(unint64_t)a4
{
  id v7;
  AMSUIMessageButton *v8;
  AMSUIMessageButton *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIMessageButton;
  v8 = -[AMSUICommonButton init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dialogAction, a3);
    v9->_messageStyle = a4;
    -[AMSUIMessageButton _setupWithDialogAction:](v9, "_setupWithDialogAction:", v7);
    -[AMSUIMessageButton _setAccessibilityIdentifier](v9, "_setAccessibilityIdentifier");
    -[AMSUIMessageButton _startObservations](v9, "_startObservations");
    if (!-[AMSUIMessageButton messageStyle](v9, "messageStyle"))
      -[AMSUIMessageButton _setOverrideUserInterfaceRenderingMode:](v9, "_setOverrideUserInterfaceRenderingMode:", 1);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[AMSUIMessageButton _endObservations](self, "_endObservations");
  v3.receiver = self;
  v3.super_class = (Class)AMSUIMessageButton;
  -[AMSUIMessageButton dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIMessageButton;
  -[AMSUIMessageButton layoutSubviews](&v3, sel_layoutSubviews);
  -[AMSUIMessageButton _setImagePadding](self, "_setImagePadding");
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)_setupWithDialogAction:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v5 = a3;
  +[AMSUIMessageButton _defaultConfiguration](AMSUIMessageButton, "_defaultConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMacIdiomStyle:", 3);
  objc_msgSend(v6, "setContentInsets:", *MEMORY[0x24BEBD250], *(double *)(MEMORY[0x24BEBD250] + 8), *(double *)(MEMORY[0x24BEBD250] + 16), *(double *)(MEMORY[0x24BEBD250] + 24));
  -[AMSUIMessageButton titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineBreakMode:", 4);

  -[AMSUIMessageButton dialogAction](self, "dialogAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "style");

  v20 = v5;
  if (v9 == 2)
  {
    -[AMSUIMessageButton _closeImage](self, "_closeImage");
    v10 = objc_claimAutoreleasedReturnValue();
    -[AMSUIMessageButton setContentVerticalAlignment:](self, "setContentVerticalAlignment:", 1);
    -[AMSUIMessageButton setContentHorizontalAlignment:](self, "setContentHorizontalAlignment:", 5);
    v11 = 0;
  }
  else
  {
    objc_msgSend(v5, "title");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "ams_imageWithSystemSymbolName:", v13);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    if (!(v10 | v11))
    {
      if (-[AMSUIMessageButton messageStyle](self, "messageStyle") == 5)
      {
        v10 = 0;
      }
      else
      {
        -[AMSUIMessageButton _chevronImage](self, "_chevronImage");
        v10 = objc_claimAutoreleasedReturnValue();
      }
    }
    -[AMSUIMessageButton setContentHorizontalAlignment:](self, "setContentHorizontalAlignment:", 5);

  }
  -[AMSUIMessageButton setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 0);
  objc_initWeak(&location, self);
  objc_msgSend(v6, "setImage:", v10);
  v14 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __45__AMSUIMessageButton__setupWithDialogAction___block_invoke;
  v24[3] = &unk_24CB50008;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v6, "setImageColorTransformer:", v24);
  -[AMSUIMessageButton preferredBackgroundColor](self, "preferredBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    v17 = -[AMSUIMessageButton messageStyle](self, "messageStyle");
    -[AMSUIMessageButton traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIAppearance _defaultButtonBackgroundColorForStyle:withTraitCollection:](AMSUIAppearance, "_defaultButtonBackgroundColorForStyle:withTraitCollection:", v17, v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setBaseBackgroundColor:", v16);
  if (!v15)
  {

  }
  -[AMSUIMessageButton _symbolConfiguration](self, "_symbolConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredSymbolConfigurationForImage:", v18);

  if (v11)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v11);
    objc_msgSend(v6, "setAttributedTitle:", v19);
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __45__AMSUIMessageButton__setupWithDialogAction___block_invoke_2;
    v21[3] = &unk_24CB50030;
    objc_copyWeak(&v23, &location);
    v22 = (id)v11;
    objc_msgSend(v6, "setTitleTextAttributesTransformer:", v21);

    objc_destroyWeak(&v23);
  }
  -[AMSUIMessageButton setConfiguration:](self, "setConfiguration:", v6);
  -[AMSUIMessageButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

id __45__AMSUIMessageButton__setupWithDialogAction___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "preferredForegroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[AMSUIAppearance _defaultButtonIconColorForStyle:isFooter:](AMSUIAppearance, "_defaultButtonIconColorForStyle:isFooter:", objc_msgSend(WeakRetained, "messageStyle"), objc_msgSend(WeakRetained, "isFooterButton"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

id __45__AMSUIMessageButton__setupWithDialogAction___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "preferredFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BEBB360]);
  }
  else
  {
    v8 = objc_msgSend(WeakRetained, "messageStyle");
    objc_msgSend(WeakRetained, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIAppearance _defaultButtonTextFontForStyle:withTraitCollection:](AMSUIAppearance, "_defaultButtonTextFontForStyle:withTraitCollection:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BEBB360]);

  }
  objc_msgSend(WeakRetained, "preferredForegroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BEBB368]);
  }
  else
  {
    +[AMSUIAppearance _defaultButtonTextColorForStyle:isFooter:](AMSUIAppearance, "_defaultButtonTextColorForStyle:isFooter:", objc_msgSend(WeakRetained, "messageStyle"), objc_msgSend(WeakRetained, "isFooterButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BEBB368]);

  }
  if (UIAccessibilityButtonShapesEnabled())
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEBB440]);
  if (*(_QWORD *)(a1 + 32))
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setAlignment:", 4);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BEBB3A8]);

  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_setAccessibilityIdentifier
{
  const __CFString *v3;

  if (-[AMSUIMessageButton isFooterButton](self, "isFooterButton"))
  {
    v3 = CFSTR("footerActionButton");
  }
  else if (-[AMSUIMessageButton isDefaultCloseButton](self, "isDefaultCloseButton"))
  {
    v3 = CFSTR("closeActionButton");
  }
  else
  {
    v3 = CFSTR("actionButton");
  }
  -[AMSUIMessageButton setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v3);
}

- (void)commitAppearance
{
  void *v3;
  id v4;

  -[AMSUIMessageButton preferredForegroundColor](self, "preferredForegroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageButton dialogAction](self, "dialogAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageButton _setupWithDialogAction:](self, "_setupWithDialogAction:", v3);

  -[AMSUIMessageButton setPreferredBackgroundColor:](self, "setPreferredBackgroundColor:", v4);
  if (-[AMSUIMessageButton isFooterButton](self, "isFooterButton"))
    -[AMSUIMessageButton setFooterStyle](self, "setFooterStyle");
  -[AMSUIMessageButton _setAccessibilityIdentifier](self, "_setAccessibilityIdentifier");

}

- (void)_startObservations
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__axSettingsDidUpdate_, *MEMORY[0x24BEBDDC8], 0);

}

- (void)_endObservations
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBDDC8], 0);

}

- (id)_appendChevronToString:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v4 = (void *)MEMORY[0x24BEBD660];
  v5 = *MEMORY[0x24BEBE1E0];
  v6 = a3;
  objc_msgSend(v4, "configurationWithTextStyle:scale:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BEBB4B8]);
  -[AMSUIMessageButton _chevronImage](self, "_chevronImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithConfiguration:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageButton preferredForegroundColor](self, "preferredForegroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    +[AMSUIAppearance _defaultButtonContentColorForStyle:isFooter:](AMSUIAppearance, "_defaultButtonContentColorForStyle:isFooter:", -[AMSUIMessageButton messageStyle](self, "messageStyle"), -[AMSUIMessageButton isFooterButton](self, "isFooterButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "imageWithTintColor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v13);

  if (!v11)
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x24BDD1688]);
  objc_msgSend(v15, "appendAttributedString:", v6);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR(" "));
  objc_msgSend(v15, "appendAttributedString:", v16);

  objc_msgSend(v15, "appendAttributedString:", v14);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithAttributedString:", v15);

  return v17;
}

- (void)_setImagePadding
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  if (-[AMSUIMessageButton isFooterButton](self, "isFooterButton"))
  {
    -[AMSUIMessageButton configuration](self, "configuration");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSUIMessageButton frame](self, "frame");
    v4 = v3;
    -[AMSUIMessageButton layoutMargins](self, "layoutMargins");
    v6 = v4 - v5;
    -[AMSUIMessageButton titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v6 - v8;
    -[AMSUIMessageButton imageView](self, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v9 - v11;
    -[AMSUIMessageButton layoutMargins](self, "layoutMargins");
    objc_msgSend(v19, "setImagePadding:", v12 - v13);

    -[AMSUIMessageButton configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imagePadding");
    v16 = v15;
    objc_msgSend(v19, "imagePadding");
    v18 = v17;

    if (v16 != v18)
      -[AMSUIMessageButton setConfiguration:](self, "setConfiguration:", v19);

  }
}

- (void)setFooterStyle
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[AMSUIMessageButton setIsFooterButton:](self, "setIsFooterButton:", 1);
  -[AMSUIMessageButton configuration](self, "configuration");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSUIMessageButton _defaultConfiguration](AMSUIMessageButton, "_defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInsets");
  v5 = v4;
  v7 = v6;

  -[AMSUIMessageButton directionalLayoutMargins](self, "directionalLayoutMargins");
  v9 = v8;
  if (-[AMSUIMessageButton messageStyle](self, "messageStyle"))
  {
    if (-[AMSUIMessageButton messageStyle](self, "messageStyle") == 6)
    {
      v5 = *MEMORY[0x24BEBD250];
      v10 = *(double *)(MEMORY[0x24BEBD250] + 8);
      v7 = *(double *)(MEMORY[0x24BEBD250] + 16);
      v9 = *(double *)(MEMORY[0x24BEBD250] + 24);
    }
    else
    {
      v10 = 0.0;
    }
  }
  else
  {
    v5 = *MEMORY[0x24BEBD250];
    v10 = *(double *)(MEMORY[0x24BEBD250] + 8);
    v7 = *(double *)(MEMORY[0x24BEBD250] + 16);
    v9 = *(double *)(MEMORY[0x24BEBD250] + 24);
    objc_msgSend(v14, "attributedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v14, "attributedTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageButton _appendChevronToString:](self, "_appendChevronToString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAttributedTitle:", v13);

    }
  }
  objc_msgSend(v14, "setImagePlacement:", 8);
  objc_msgSend(v14, "setContentInsets:", v5, v10, v7, v9);
  -[AMSUIMessageButton setConfiguration:](self, "setConfiguration:", v14);
  -[AMSUIMessageButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  -[AMSUIMessageButton setContentHorizontalAlignment:](self, "setContentHorizontalAlignment:", 4);
  -[AMSUIMessageButton _setAXSettings](self, "_setAXSettings");
  -[AMSUIMessageButton _setAccessibilityIdentifier](self, "_setAccessibilityIdentifier");

}

- (void)_setAXSettings
{
  void *v3;
  void *v4;
  id v5;

  -[AMSUIMessageButton configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[AMSUIMessageButton isFooterButton](self, "isFooterButton") && UIAccessibilityButtonShapesEnabled())
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "background");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v3);

    -[AMSUIMessageButton setConfiguration:](self, "setConfiguration:", v5);
  }

}

- (BOOL)isDefaultCloseButton
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  -[AMSUIMessageButton dialogAction](self, "dialogAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "style") == 2)
  {
    -[AMSUIMessageButton dialogAction](self, "dialogAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      -[AMSUIMessageButton dialogAction](self, "dialogAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "iconURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8 == 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_symbolConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  -[AMSUIMessageButton preferredFont](self, "preferredFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v7 = (id)*MEMORY[0x24BEBE1D0];
    if (-[AMSUIMessageButton messageStyle](self, "messageStyle"))
    {
      v8 = *MEMORY[0x24BEBB5E8];
      if (-[AMSUIMessageButton messageStyle](self, "messageStyle") != 1)
      {
        v10 = 2;
        goto LABEL_9;
      }
      v9 = (id)*MEMORY[0x24BEBE220];

      v10 = 1;
    }
    else
    {
      v9 = (id)*MEMORY[0x24BEBE220];

      v8 = *MEMORY[0x24BEBB600];
      v10 = 2;
    }
    v7 = v9;
LABEL_9:
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x24BEBB590];
    v18 = *MEMORY[0x24BEBB620];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fontDescriptorByAddingAttributes:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v16, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  v4 = (void *)MEMORY[0x24BEBD660];
  -[AMSUIMessageButton preferredFont](self, "preferredFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithFont:scale:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_chevronImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[AMSUIMessageButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection");

  if (v4 == 1)
    objc_msgSend(MEMORY[0x24BEBD640], "ams_systemChevronLeft");
  else
    objc_msgSend(MEMORY[0x24BEBD640], "ams_systemChevronRight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageButton _symbolConfiguration](self, "_symbolConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_imageWithSymbolConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_closeImage
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBD640], "ams_imageWithSystemSymbolName:", CFSTR("xmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageButton _symbolConfiguration](self, "_symbolConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_imageWithSymbolConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultConfiguration
{
  return (id)objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
}

- (UIColor)preferredForegroundColor
{
  return self->_preferredForegroundColor;
}

- (void)setPreferredForegroundColor:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_preferredForegroundColor, a3);
  -[AMSUIMessageButton configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v8)
  {
    objc_msgSend(v5, "setBaseForegroundColor:", v8);
  }
  else
  {
    +[AMSUIAppearance _defaultButtonContentColorForStyle:isFooter:](AMSUIAppearance, "_defaultButtonContentColorForStyle:isFooter:", -[AMSUIMessageButton messageStyle](self, "messageStyle"), -[AMSUIMessageButton isFooterButton](self, "isFooterButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBaseForegroundColor:", v7);

  }
  -[AMSUIMessageButton setConfiguration:](self, "setConfiguration:", v6);
  -[AMSUIMessageButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");

}

- (UIColor)preferredBackgroundColor
{
  void *v2;
  void *v3;

  -[AMSUIMessageButton configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setPreferredBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIMessageButton configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBaseBackgroundColor:", v4);

  -[AMSUIMessageButton setConfiguration:](self, "setConfiguration:", v5);
  -[AMSUIMessageButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");

}

- (AMSDialogAction)dialogAction
{
  return self->_dialogAction;
}

- (UIFont)preferredFont
{
  return self->_preferredFont;
}

- (void)setPreferredFont:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFont, a3);
}

- (unint64_t)messageStyle
{
  return self->_messageStyle;
}

- (void)setMessageStyle:(unint64_t)a3
{
  self->_messageStyle = a3;
}

- (BOOL)isFooterButton
{
  return self->_isFooterButton;
}

- (void)setIsFooterButton:(BOOL)a3
{
  self->_isFooterButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFont, 0);
  objc_storeStrong((id *)&self->_dialogAction, 0);
  objc_storeStrong((id *)&self->_preferredForegroundColor, 0);
}

@end
