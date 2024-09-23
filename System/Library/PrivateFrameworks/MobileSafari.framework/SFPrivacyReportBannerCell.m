@implementation SFPrivacyReportBannerCell

- (void)setPrivateBrowsingEnabled:(BOOL)a3
{
  if (self->_privateBrowsingEnabled != a3)
  {
    self->_privateBrowsingEnabled = a3;
    -[SFPrivacyReportBannerCell _updateState](self, "_updateState");
  }
}

- (void)setNumberOfTrackers:(int64_t)a3
{
  if (self->_numberOfTrackers != a3)
  {
    self->_numberOfTrackers = a3;
    -[SFPrivacyReportBannerCell _updateState](self, "_updateState");
  }
}

- (void)configureUsingBanner:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportBannerCell;
  -[SFInteractiveBannerCell configureUsingBanner:](&v4, sel_configureUsingBanner_, a3);
  -[SFPrivacyReportBannerCell _updateState](self, "_updateState");
}

- (void)_updateState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v3 = (void *)MEMORY[0x1E0DC12B0];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("shield.lefthalf.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textAttachmentWithImage:", v4);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(v6, "appendAttributedString:", v5);
  if (self->_numberOfTrackers >= 1)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd"), self->_numberOfTrackers);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

    if (-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
      objc_msgSend(v6, "appendAttributedString:", v9);
    else
      objc_msgSend(v6, "insertAttributedString:atIndex:", v9, 0);

  }
  -[SFInteractiveBannerCell leadingLabel](self, "leadingLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v6);

  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isPrivacyProxyActive");
  v13 = objc_msgSend(v11, "state");
  -[SFInteractiveBannerCell captionLabel](self, "captionLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_privateBrowsingEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB3678], "sharedHTTPCookieStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "webui_trackerProtectionEnabled");

    if ((v20 & 1) == 0)
    {
      _WBSLocalizedString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v23);

      _WBSLocalizedString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPrivacyReportBannerCell _setAction:text:](self, "_setAction:text:", 0, v24);

      goto LABEL_34;
    }
    if (v12)
    {
      if (v13 == 2)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
      }
      else if (v13 == 1)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
      }
      else
      {
        if (v13)
          goto LABEL_34;
        v21 = (void *)MEMORY[0x1E0CB3940];
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
    }
    _WBSLocalizedString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithFormat:", v25, self->_numberOfTrackers);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v26);

    -[SFInteractiveBannerCell _removeActionButton](self, "_removeActionButton");
    goto LABEL_34;
  }
  -[SFInteractiveBannerCell _removeActionButton](self, "_removeActionButton");
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "safari_enableAdvancedPrivacyProtections:", 1);

  if (!v16)
    goto LABEL_22;
  if (v13)
    v17 = v12;
  else
    v17 = 0;
  if (!self->_numberOfTrackers)
  {
    if (v17 && v13 != 2 && v13 != 1)
      goto LABEL_34;
LABEL_22:
    _WBSLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v22);

    goto LABEL_34;
  }
  if (!v17)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    goto LABEL_33;
  }
  if (v13 == 2)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    goto LABEL_33;
  }
  if (v13 == 1)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
LABEL_33:
    _WBSLocalizedString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v27, self->_numberOfTrackers);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v28);

  }
LABEL_34:

}

- (SFPrivacyReportBannerCell)initWithFrame:(CGRect)a3
{
  SFPrivacyReportBannerCell *v3;
  SFPrivacyReportBannerCell *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SFPrivacyReportBannerCell *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFPrivacyReportBannerCell;
  v3 = -[SFInteractiveBannerCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_numberOfTrackers = -1;
    -[SFPrivacyReportBannerCell _updateState](v3, "_updateState");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D8B2B0];
    objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__privacyProxyAvailabilityChanged_, v6, v7);

    v8 = v4;
  }

  return v4;
}

+ (id)reuseIdentifier
{
  return CFSTR("PrivacyReportBanner");
}

- (void)_privacyProxyAvailabilityChanged:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__SFPrivacyReportBannerCell__privacyProxyAvailabilityChanged___block_invoke;
  v3[3] = &unk_1E21E2050;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v3, 0);
}

void __62__SFPrivacyReportBannerCell__privacyProxyAvailabilityChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateState");
  objc_msgSend(*(id *)(a1 + 32), "superview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "collectionViewLayout");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidateLayout");

  }
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");

}

- (void)_setAction:(unint64_t)a3 text:(id)a4
{
  self->_action = a3;
  -[SFInteractiveBannerCell _updateActionButtonWithText:](self, "_updateActionButtonWithText:", a4);
}

- (int64_t)numberOfTrackers
{
  return self->_numberOfTrackers;
}

- (BOOL)isPrivateBrowsingEnabled
{
  return self->_privateBrowsingEnabled;
}

@end
