@implementation WDClinicalSettingsViewController

+ (id)tableViewSectionClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  WDClinicalSettingsOptInNib *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WDClinicalSettingsViewController;
  -[HRWDTableViewController viewDidLoad](&v13, sel_viewDidLoad);
  HRLocalizedString(CFSTR("CLINICAL_ACCOUNTS_SETTINGS_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalSettingsViewController setTitle:](self, "setTitle:", v3);

  -[WDClinicalSettingsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLargeTitleDisplayMode:", 2);

  v5 = objc_alloc_init(WDClinicalSettingsOptInNib);
  -[WDClinicalSettingsOptInNib setTextViewDelegate:](v5, "setTextViewDelegate:", self);
  -[WDClinicalSettingsViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setSectionContentInset:", 0.0, 16.0, 0.0, 16.0);

  -[WDClinicalSettingsViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setSectionCornerRadius:", 10.0);

  -[WDClinicalSettingsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerNib:forHeaderFooterViewReuseIdentifier:", v5, CFSTR("_OptInSectionFooterCell"));

  -[WDClinicalSettingsViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("_OptInCell"));

  -[WDClinicalSettingsViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  +[WDClinicalSettingsViewAnalyticsDataCell defaultReuseIdentifier](WDClinicalSettingsViewAnalyticsDataCell, "defaultReuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", v11, v12);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDClinicalSettingsViewController;
  -[WDClinicalSettingsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  +[CHRAnalyticsManager shared](CHRAnalyticsManager, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postPrivacyInteractionEventWithType:context:action:", 1, 1, 0);

}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("_OptInSectionFooterCell"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  void *v8;
  int v9;
  void *v10;

  v7 = a4;
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("prefs"));

  if (!a6 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openSensitiveURL:withOptions:", v7, 0);

  }
  return 0;
}

@end
