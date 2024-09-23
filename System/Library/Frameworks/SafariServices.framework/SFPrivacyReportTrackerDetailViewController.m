@implementation SFPrivacyReportTrackerDetailViewController

- (SFPrivacyReportTrackerDetailViewController)initWithTracker:(id)a3
{
  id v5;
  SFPrivacyReportTrackerDetailViewController *v6;
  SFPrivacyReportTrackerDetailViewController *v7;
  void *v8;
  id v9;
  SFPrivacyReportTrackerDetailViewController *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFPrivacyReportTrackerDetailViewController;
  v6 = -[SFPrivacyReportTrackerDetailViewController initWithStyle:](&v12, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tracker, a3);
    objc_msgSend(MEMORY[0x1E0DC3E88], "safari_traitsAffectingTextAppearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)-[SFPrivacyReportTrackerDetailViewController registerForTraitChanges:withTarget:action:](v7, "registerForTraitChanges:withTarget:action:", v8, v7, sel__updateHeaderSizeForTraitChanges);

    v10 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;
  UIView *header;
  UIView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  NSString *tableViewHeaderText;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)SFPrivacyReportTrackerDetailViewController;
  -[SFPrivacyReportTrackerDetailViewController viewDidLoad](&v37, sel_viewDidLoad);
  -[WBSKnownTrackingThirdParty domain](self->_tracker, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivacyReportTrackerDetailViewController setTitle:](self, "setTitle:", v3);

  -[SFPrivacyReportTrackerDetailViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC53D8];
  objc_msgSend(v4, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  v36 = v4;
  objc_msgSend(v4, "setSectionHeaderHeight:", v5);
  objc_msgSend(v4, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("websiteListSectionHeaderView"));
  v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v8);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v6, "setNumberOfLines:", 0);
  v9 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSKnownTrackingThirdParty domain](self->_tracker, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSKnownTrackingThirdParty ownerName](self->_tracker, "ownerName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v13);

  v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 320.0, 200.0);
  header = self->_header;
  self->_header = v14;

  -[UIView setPreservesSuperviewLayoutMargins:](self->_header, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIView addSubview:](self->_header, "addSubview:", v6);
  v16 = self->_header;
  -[SFPrivacyReportTrackerDetailViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTableHeaderView:", v16);

  -[UIView layoutMarginsGuide](self->_header, "layoutMarginsGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v6, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v18;
  objc_msgSend(v18, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v32;
  objc_msgSend(v6, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_header, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v30, 4.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v19;
  objc_msgSend(v6, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v22;
  objc_msgSend(v6, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_header, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v26);

  _WBSLocalizedString();
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  tableViewHeaderText = self->_tableViewHeaderText;
  self->_tableViewHeaderText = v27;

}

- (void)_updateHeaderSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIView *header;
  void *v8;
  CGFloat Width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIView *v16;
  id v17;
  CGRect v18;

  -[UIView frame](self->_header, "frame");
  v4 = v3;
  v6 = v5;
  header = self->_header;
  -[SFPrivacyReportTrackerDetailViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  Width = CGRectGetWidth(v18);
  LODWORD(v10) = 1148846080;
  LODWORD(v11) = 1112014848;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](header, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v10, v11);
  v13 = v12;
  v15 = v14;

  -[UIView setFrame:](self->_header, "setFrame:", v4, v6, v13, v15);
  v16 = self->_header;
  -[SFPrivacyReportTrackerDetailViewController tableView](self, "tableView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTableHeaderView:", v16);

}

- (void)_updateHeaderSizeForTraitChanges
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SFPrivacyReportTrackerDetailViewController__updateHeaderSizeForTraitChanges__block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __78__SFPrivacyReportTrackerDetailViewController__updateHeaderSizeForTraitChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHeaderSize");
}

- (void)viewLayoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFPrivacyReportTrackerDetailViewController;
  -[SFPrivacyReportTrackerDetailViewController viewLayoutMarginsDidChange](&v3, sel_viewLayoutMarginsDidChange);
  -[SFPrivacyReportTrackerDetailViewController _updateHeaderSize](self, "_updateHeaderSize");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WBSKnownTrackingThirdParty firstParties](self->_tracker, "firstParties", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("websiteCellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("websiteCellIdentifier"));
  -[WBSKnownTrackingThirdParty firstParties](self->_tracker, "firstParties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return self->_tableViewHeaderText;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewHeaderText, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end
