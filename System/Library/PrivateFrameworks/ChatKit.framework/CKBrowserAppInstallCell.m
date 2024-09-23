@implementation CKBrowserAppInstallCell

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserAppInstallCell;
  -[CKBrowserCell layoutSubviews](&v4, sel_layoutSubviews);
  -[CKBrowserCell badgeView](self, "badgeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

+ (id)reuseIdentifier
{
  return CFSTR("CKBrowserAppInstallCell");
}

- (id)iconView
{
  void *v3;
  CKBrowserIconView *v4;
  CKBrowserIconView *v5;

  -[CKBrowserAppInstallCell browserIconView](self, "browserIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [CKBrowserIconView alloc];
    v5 = -[CKBrowserIconView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKBrowserAppInstallCell setBrowserIconView:](self, "setBrowserIconView:", v5);

  }
  return -[CKBrowserAppInstallCell browserIconView](self, "browserIconView");
}

- (void)setInstallation:(id)a3
{
  CKAppInstallation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CKAppInstallation *v12;

  v5 = (CKAppInstallation *)a3;
  if (self->_installation != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_installation, a3);
    -[CKAppInstallation icon](v12, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserAppInstallCell browserIconView](self, "browserIconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIconImage:", v6);

    -[CKAppInstallation localizedDisplayName](v12, "localizedDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserCell browserLabel](self, "browserLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[CKBrowserAppInstallCell browserIconView](self, "browserIconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CKAppInstallation installed](v12, "installed"))
      v11 = 100.0;
    else
      -[CKAppInstallation percentComplete](v12, "percentComplete");
    objc_msgSend(v10, "setPercentComplete:animated:", 1, v11);

    -[CKBrowserAppInstallCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v12;
  }

}

- (CKAppInstallation)installation
{
  return self->_installation;
}

- (CKBrowserIconView)browserIconView
{
  return self->_browserIconView;
}

- (void)setBrowserIconView:(id)a3
{
  objc_storeStrong((id *)&self->_browserIconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserIconView, 0);
  objc_storeStrong((id *)&self->_installation, 0);
}

@end
