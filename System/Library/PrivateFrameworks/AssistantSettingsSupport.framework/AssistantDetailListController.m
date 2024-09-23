@implementation AssistantDetailListController

- (AssistantDetailListController)init
{
  AssistantDetailListController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AssistantDetailListController;
  v2 = -[AssistantDetailListController init](&v4, sel_init);
  if (v2)
    v2->_supportsMultilingualResponses = objc_msgSend(MEMORY[0x24BE091E0], "isMultilingualResponseVariantSelectorEnabled");
  return v2;
}

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sAssistantLanguageBundle_0;
  if (!bundle_sAssistantLanguageBundle_0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sAssistantLanguageBundle_0;
    bundle_sAssistantLanguageBundle_0 = v3;

    v2 = (void *)bundle_sAssistantLanguageBundle_0;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AssistantDetailListController;
  -[AssistantDetailListController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AssistantDetailListController;
  -[AssistantDetailListController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Siri"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceSupported");

  if (v6)
    v7 = CFSTR("Apple Intelligence & Siri");
  else
    v7 = CFSTR("Siri");
  v8 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", v7, 0, v9, v11);

  -[AssistantDetailListController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.siri"), v12, MEMORY[0x24BDBD1A8], v4);
}

- (void)setChecked:(BOOL)a3 forSpecifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PSSpecifier *checkedSpecifier;
  id v12;

  v6 = a4;
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    -[AssistantDetailListController checkmarkImage](self, "checkmarkImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v8);

    -[AssistantDetailListController checkmarkImage](self, "checkmarkImage");
  }
  else
  {
    -[AssistantDetailListController transparentImage](self, "transparentImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v9);

    -[AssistantDetailListController transparentImage](self, "transparentImage");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v10, *MEMORY[0x24BE75AC8]);

  checkedSpecifier = self->_checkedSpecifier;
  self->_checkedSpecifier = (PSSpecifier *)v6;

}

- (UIImage)checkmarkImage
{
  UIImage *checkmarkImage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;

  checkmarkImage = self->_checkmarkImage;
  if (!checkmarkImage)
  {
    objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v5, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v6, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v7);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v9 = self->_checkmarkImage;
    self->_checkmarkImage = v8;

    checkmarkImage = self->_checkmarkImage;
  }
  return checkmarkImage;
}

- (UIImage)transparentImage
{
  UIImage *transparentImage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIImage *v12;
  UIImage *v13;

  transparentImage = self->_transparentImage;
  if (!transparentImage)
  {
    objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v5, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v6, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BEBD660];
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationWithHierarchicalColor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "configurationByApplyingConfiguration:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v11);
    v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v13 = self->_transparentImage;
    self->_transparentImage = v12;

    transparentImage = self->_transparentImage;
  }
  return transparentImage;
}

- (void)setCheckmarkImage:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkImage, a3);
}

- (void)setTransparentImage:(id)a3
{
  objc_storeStrong((id *)&self->_transparentImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparentImage, 0);
  objc_storeStrong((id *)&self->_checkmarkImage, 0);
  objc_storeStrong((id *)&self->_checkedSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_previousSelectedSpecifier, 0);
}

@end
