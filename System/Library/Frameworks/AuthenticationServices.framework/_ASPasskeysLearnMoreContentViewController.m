@implementation _ASPasskeysLearnMoreContentViewController

- (_ASPasskeysLearnMoreContentViewController)init
{
  void *v3;
  void *v4;
  _ASPasskeysLearnMoreContentViewController *v5;
  objc_super v7;

  +[_ASPasskeysLearnMoreContent titleString](_ASPasskeysLearnMoreContent, "titleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ASPasskeysLearnMoreContent subtitleString](_ASPasskeysLearnMoreContent, "subtitleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_ASPasskeysLearnMoreContentViewController;
  v5 = -[_ASPasskeysLearnMoreContentViewController initWithTitle:detailText:symbolName:](&v7, sel_initWithTitle_detailText_symbolName_, v3, v4, 0);

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_ASPasskeysLearnMoreContentViewController;
  -[OBBaseWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  -[_ASPasskeysLearnMoreContentViewController _setUpContentBodyText](self, "_setUpContentBodyText");
  -[_ASPasskeysLearnMoreContentViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASPasskeysLearnMoreContentViewController _passkeySymbolHeaderImage](self, "_passkeySymbolHeaderImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIcon:accessibilityLabel:", v4, 0);

}

- (id)_passkeySymbolHeaderImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithScale:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "configurationByApplyingConfiguration:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BEBD640];
  +[_ASPasskeysLearnMoreContent systemImageName](_ASPasskeysLearnMoreContent, "systemImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemImageNamed:withConfiguration:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setUpContentBodyText
{
  void *v3;
  id v4;
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
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  -[_ASPasskeysLearnMoreContentViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[_ASPasskeysLearnMoreContentViewController _contentBodyAttributedString](self, "_contentBodyAttributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", v5);

  v6 = (void *)MEMORY[0x24BEBD5E0];
  objc_msgSend(MEMORY[0x24BEBD5E8], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v8);

  objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v4, "setNumberOfLines:", 0);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v4);
  v17 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  objc_msgSend(v4, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(v4, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v12;
  objc_msgSend(v4, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v16);

}

- (id)_contentBodyAttributedString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithScale:", -1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:renderingMode:", v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD368], "textAttachmentWithImage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BDD1688]);
  +[_ASPasskeysLearnMoreContent bodyString](_ASPasskeysLearnMoreContent, "bodyString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:", v11);

  v15 = CFSTR("{square.and.arrow.up}");
  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safari_replaceCharactersWithStringBindings:", v13);

  return v12;
}

@end
