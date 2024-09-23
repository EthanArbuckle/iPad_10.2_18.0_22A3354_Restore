@implementation SFWebExtensionPermissionBanner

- (SFWebExtensionPermissionBanner)initWithExtension:(id)a3
{
  id v4;
  SFWebExtensionPermissionBanner *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SFWebExtensionPermissionBanner *v12;

  v4 = a3;
  v5 = -[SFLinkBanner init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner titleLabel](v5, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner setMessageLabelText:](v5, "setMessageLabelText:", v8);

    objc_msgSend(v4, "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner icon](v5, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v9);

    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner setOpenButtonTitle:](v5, "setOpenButtonTitle:", v11);

    v12 = v5;
  }

  return v5;
}

- (id)preferredButtonBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
}

- (id)preferredButtonTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
}

@end
