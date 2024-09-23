@implementation SFPrivacyReportWebsiteDetailViewController

- (SFPrivacyReportWebsiteDetailViewController)initWithWebsite:(id)a3
{
  id v5;
  SFPrivacyReportWebsiteDetailViewController *v6;
  SFPrivacyReportWebsiteDetailViewController *v7;
  SFPrivacyReportWebsiteDetailViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFPrivacyReportWebsiteDetailViewController;
  v6 = -[SFPrivacyReportWebsiteDetailViewController initWithStyle:](&v10, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_website, a3);
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFPrivacyReportWebsiteDetailViewController;
  -[SFPrivacyReportWebsiteDetailViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[WBSTrackedFirstParty domain](self->_website, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivacyReportWebsiteDetailViewController setTitle:](self, "setTitle:", v3);

  -[SFPrivacyReportWebsiteDetailViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC53D8];
  objc_msgSend(v4, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v4, "setSectionHeaderHeight:", v5);
  -[SFPrivacyReportWebsiteDetailViewController _loadSections](self, "_loadSections");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("trackerCellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("trackerCellIdentifier"));
  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "row");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(v7, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v15);

  objc_msgSend(v11, "ownerName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v16);

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)_loadSections
{
  void *v3;
  void *v4;
  void *v5;
  SFPrivacyReportWebsiteDetailSection *v6;
  void *v7;
  void *v8;
  void *v9;
  SFPrivacyReportWebsiteDetailSection *v10;
  NSArray *v11;
  NSArray *sections;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSTrackedFirstParty blockedTrackers](self->_website, "blockedTrackers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_separatesBlockedTrackers)
    goto LABEL_6;
  if (objc_msgSend(v3, "count"))
  {
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SFPrivacyReportWebsiteDetailSection initWithTitle:trackers:]([SFPrivacyReportWebsiteDetailSection alloc], "initWithTitle:trackers:", v5, v4);
    objc_msgSend(v13, "addObject:", v6);

  }
  if (self->_separatesBlockedTrackers)
  {
    -[WBSTrackedFirstParty preventedTrackers](self->_website, "preventedTrackers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    -[WBSTrackedFirstParty trackers](self->_website, "trackers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (objc_msgSend(v7, "count"))
  {
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFPrivacyReportWebsiteDetailSection initWithTitle:trackers:]([SFPrivacyReportWebsiteDetailSection alloc], "initWithTitle:trackers:", v9, v8);
    objc_msgSend(v13, "addObject:", v10);

  }
  v11 = (NSArray *)objc_msgSend(v13, "copy");
  sections = self->_sections;
  self->_sections = v11;

}

- (BOOL)separatesBlockedTrackers
{
  return self->_separatesBlockedTrackers;
}

- (void)setSeparatesBlockedTrackers:(BOOL)a3
{
  self->_separatesBlockedTrackers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_website, 0);
}

@end
