@implementation HUAccessorySettingsDataAnalyticsViewController

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  HUItemTableSectionHeaderFooterView *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "footerTitleForSection:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("footerReuseIdentifier"));
    v9 = (HUItemTableSectionHeaderFooterView *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v9 = -[HUItemTableSectionHeaderFooterView initWithReuseIdentifier:]([HUItemTableSectionHeaderFooterView alloc], "initWithReuseIdentifier:", CFSTR("footerReuseIdentifier"));
    -[HUItemTableSectionHeaderFooterView setType:](v9, "setType:", 1);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayedSectionIdentifierForSectionIndex:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isEqualToString:", CFSTR("root.general.analytics.shareSpeakerAnalytics")))
    {
      HFLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(MEMORY[0x1E0D319D0], "supportsAnalytics");
      v14 = (void *)MEMORY[0x1E0CB3498];
      if ((v13 & 1) != 0)
      {
        HFLocalizedString();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "hf_applePrivacyURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hf_attributedString:withAppendedLinkString:linkURL:", v15, v12, v16);
      }
      else
      {
        HFLocalizedString();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "hf_applePrivacyURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hf_attributedLinkStringForString:linkString:linkURL:", v15, v12, v16);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableSectionHeaderFooterView setMessage:](v9, "setMessage:", v22);

    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("root.general.analytics.shareSiriAnalytics")))
    {
      v17 = (void *)MEMORY[0x1E0CB3498];
      HFLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HFLocalizedString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D31970], "aboutImproveSiriAndDictationURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hf_attributedString:withAppendedLinkString:linkURL:", v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableSectionHeaderFooterView setMessage:](v9, "setMessage:", v21);

    }
    else
    {
      -[HUItemTableSectionHeaderFooterView setMessage:](v9, "setMessage:", v8);
    }
    -[HUItemTableSectionHeaderFooterView messageTextView](v9, "messageTextView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", self);

  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)HUAccessorySettingsDataAnalyticsViewController;
    -[HUItemTableViewController tableView:viewForFooterInSection:](&v25, sel_tableView_viewForFooterInSection_, v6, a4);
    v9 = (HUItemTableSectionHeaderFooterView *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HUAccessorySettingsDataAnalyticsViewController *v17;
  HUAccessorySettingsDataAnalyticsViewController *v18;
  _QWORD v20[2];
  uint8_t buf[4];
  HUAccessorySettingsDataAnalyticsViewController *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31970], "aboutImproveSiriAndDictationURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  v11 = (void *)MEMORY[0x1E0D65198];
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x1E0D651F0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = *MEMORY[0x1E0D651C8];
    v20[0] = *MEMORY[0x1E0D651C0];
    v20[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presenterForPrivacyUnifiedAboutWithIdentifiers:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HUAccessorySettingsDataAnalyticsViewController navigationController](self, "navigationController");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (HUAccessorySettingsDataAnalyticsViewController *)v15;
  else
    v17 = self;
  v18 = v17;

  objc_msgSend(v12, "setPresentingViewController:", v18);
  objc_msgSend(v12, "present");

  return 0;
}

- (void)dismissPrivacyController
{
  -[HUAccessorySettingsDataAnalyticsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (UIView)linkFooterView
{
  return self->_linkFooterView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkFooterView, 0);
}

@end
