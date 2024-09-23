@implementation SFCertificateWarningJSController

- (SFCertificateWarningJSController)initWithCertificateWarningController:(id)a3
{
  id v4;
  SFCertificateWarningJSController *v5;
  SFCertificateWarningJSController *v6;
  SFCertificateWarningJSController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCertificateWarningJSController;
  v5 = -[SFCertificateWarningJSController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_certificateWarningController, v4);
    v7 = v6;
  }

  return v6;
}

- (void)pageLoaded
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  objc_msgSend(WeakRetained, "certificateWarningPageLoaded");

}

- (void)visitInsecureWebsite
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  objc_msgSend(WeakRetained, "visitInsecureWebsite");

}

- (void)visitInsecureWebsiteWithTemporaryBypass
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  objc_msgSend(WeakRetained, "visitInsecureWebsiteWithTemporaryBypass");

}

- (void)showCertificateInformation
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  objc_msgSend(WeakRetained, "showCertificateInformation");

}

- (void)openClockSettings
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  objc_msgSend(WeakRetained, "openClockSettings");

}

- (void)goBackSelected
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  objc_msgSend(WeakRetained, "goBackSelected");

}

- (void)bypassFeatureVisitWebsite
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  objc_msgSend(WeakRetained, "visitWebsiteWithoutPrivateRelay");

}

- (id)bypassFeatureTitleText
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bypassFeatureWarningText
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  objc_msgSend(WeakRetained, "warningPageContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "failingURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "warningCategory");
  v6 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v5, CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)bypassFeatureButtonText
{
  return (id)_WBSLocalizedString();
}

- (id)bypassFeatureIconPath
{
  return &cfstr_M1252441412995;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_certificateWarningController);
}

@end
