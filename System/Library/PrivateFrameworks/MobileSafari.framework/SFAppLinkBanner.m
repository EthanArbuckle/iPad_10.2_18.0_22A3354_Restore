@implementation SFAppLinkBanner

- (SFAppLinkBanner)initWithAppLink:(id)a3 openActionHandler:(id)a4
{
  id v7;
  id v8;
  SFAppLinkBanner *v9;
  SFAppLinkBanner *v10;
  void *v11;
  void *v12;
  WBSAppLink *appLink;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SFAppLinkBanner *v22;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SFAppLinkBanner;
  v9 = -[SFLinkBanner init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appLink, a3);
    -[SFLinkBanner setOpenActionHandler:](v10, "setOpenActionHandler:", v8);
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner setOpenButtonTitle:](v10, "setOpenButtonTitle:", v11);

    -[SFLinkBanner openButton](v10, "openButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("AppLinkBannerOpenButton"));

    appLink = v10->_appLink;
    v25 = 0;
    v26 = 0;
    v24 = 0;
    -[WBSAppLink getAppLinkLabel:name:bundleIdentifier:icon:](appLink, "getAppLinkLabel:name:bundleIdentifier:icon:", &v26, &v25, 0, &v24);
    v14 = v26;
    v15 = v25;
    v16 = v24;
    -[SFLinkBanner titleLabel](v10, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAttributedText:", v14);

    v18 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner setMessageLabelText:](v10, "setMessageLabelText:", v20);

    -[SFLinkBanner icon](v10, "icon");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:", v16);

    v22 = v10;
  }

  return v10;
}

- (WBSAppLink)appLink
{
  return self->_appLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLink, 0);
}

@end
