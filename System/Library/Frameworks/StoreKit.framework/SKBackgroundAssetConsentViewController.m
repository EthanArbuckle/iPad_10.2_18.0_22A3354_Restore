@implementation SKBackgroundAssetConsentViewController

- (SKBackgroundAssetConsentViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SKBackgroundAssetConsentViewController *v10;
  objc_super v12;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BACKGROUND_ASSETS_CONSENT_TITLE"), &stru_1E5B2D460, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BACKGROUND_ASSETS_CONSENT_DESCRIPTION"), &stru_1E5B2D460, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:withConfiguration:", CFSTR("square.and.arrow.down.settings"), v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)SKBackgroundAssetConsentViewController;
  v10 = -[SKBackgroundAssetConsentViewController initWithTitle:detailText:icon:contentLayout:](&v12, sel_initWithTitle_detailText_icon_contentLayout_, v4, v6, v9, 2);

  return v10;
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKBackgroundAssetConsentViewController;
  -[OBBaseWelcomeController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BACKGROUND_ASSETS_CONSENT_CONTINUE"), &stru_1E5B2D460, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v5, 0);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__continueButtonPressed, 64);
  -[SKBackgroundAssetConsentViewController buttonTray](self, "buttonTray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addButton:", v3);

}

- (void)dealloc
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  objc_super v5;

  -[SKBackgroundAssetConsentViewController responseBlock](self, "responseBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SKBackgroundAssetConsentViewController responseBlock](self, "responseBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

  }
  v5.receiver = self;
  v5.super_class = (Class)SKBackgroundAssetConsentViewController;
  -[SKBackgroundAssetConsentViewController dealloc](&v5, sel_dealloc);
}

- (void)_continueButtonPressed
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  -[SKBackgroundAssetConsentViewController responseBlock](self, "responseBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SKBackgroundAssetConsentViewController responseBlock](self, "responseBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, MEMORY[0x1E0C9AAB0]);

  }
  -[SKBackgroundAssetConsentViewController setResponseBlock:](self, "setResponseBlock:", 0);
}

- (id)responseBlock
{
  return self->_responseBlock;
}

- (void)setResponseBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseBlock, 0);
}

@end
