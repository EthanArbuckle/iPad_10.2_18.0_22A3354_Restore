@implementation WDClinicalSettingsAboutSection

- (unint64_t)numberOfRows
{
  return 1;
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    v6 = 0;
  }
  else
  {
    -[WDClinicalSettingsAboutSection _tableViewPrivacyInfoCell:](self, "_tableViewPrivacyInfoCell:", a4, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_tableViewPrivacyInfoCell:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  +[WDClinicalSettingsViewAnalyticsDataCell defaultReuseIdentifier](WDClinicalSettingsViewAnalyticsDataCell, "defaultReuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HRLocalizedString(CFSTR("CLINICAL_ACCOUNTS_SETTINGS_OPT_IN_FOOTER_ABOUT_PRIVACY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  objc_msgSend(v5, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 1);

  objc_msgSend(v5, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 0);

  objc_msgSend(v5, "setAccessoryType:", 0);
  return v5;
}

- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v6 = (void (**)(id, uint64_t, _QWORD))a5;
  +[HRViewControllerFactory shared](HRViewControllerFactory, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "makeImproveHealthRecordsPrivacyPresenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HRWDTableViewSection delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPresentingViewController:", v8);
  objc_msgSend(v9, "present");
  v6[2](v6, 1, 0);

}

@end
