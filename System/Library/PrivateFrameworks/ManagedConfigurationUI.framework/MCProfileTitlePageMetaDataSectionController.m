@implementation MCProfileTitlePageMetaDataSectionController

- (MCProfileTitlePageMetaDataSectionController)initWithProfile:(id)a3
{
  id v5;
  MCProfileTitlePageMetaDataSectionController *v6;
  MCProfileTitlePageMetaDataSectionController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCProfileTitlePageMetaDataSectionController;
  v6 = -[MCProfileTitlePageMetaDataSectionController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_profile, a3);

  return v7;
}

- (void)registerCellClassWithTableView:(id)a3
{
  id v4;

  v4 = a3;
  -[MCProfileTitlePageMetaDataSectionController setTableView:](self, "setTableView:", v4);
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("iconCell"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("titleCell"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("subtitleCell"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("organizationCell"));

}

- (id)cellForRowAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;

  if (a3 == 2)
  {
    -[MCProfileTitlePageMetaDataSectionController profile](self, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "organization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageMetaDataSectionController orgCell](self, "orgCell");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOrganizationName:", v9);

    -[MCProfileTitlePageMetaDataSectionController profile](self, "profile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "payloadsWithClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "managedAppleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageMetaDataSectionController orgCell](self, "orgCell");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAppleID:", v14);

    -[MCProfileTitlePageMetaDataSectionController orgCell](self, "orgCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    if (_os_feature_enabled_impl())
      v16 = CFSTR("USER_ENROLLMENT_DESCRIPTION_MAA");
    else
      v16 = CFSTR("USER_ENROLLMENT_DESCRIPTION");
    MCUILocalizedString(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageMetaDataSectionController subtitleCell](self, "subtitleCell");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v17);

    -[MCProfileTitlePageMetaDataSectionController subtitleCell](self, "subtitleCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v7 = 0;
  }
  else
  {
    MCUILocalizedString(CFSTR("USER_ENROLLMENT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageMetaDataSectionController titleCell](self, "titleCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v4);

    -[MCProfileTitlePageMetaDataSectionController titleCell](self, "titleCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)titleForHeader
{
  return 0;
}

- (double)heightForHeader
{
  return 55.0;
}

- (double)heightForRowAtIndex:(unint64_t)a3
{
  int v3;
  double result;

  if (a3 == 2)
    return 75.0;
  if (a3 == 1)
    return *MEMORY[0x1E0CEBC10];
  if (a3)
    return 0.0;
  v3 = MCUIIsiPhone();
  result = 46.0;
  if (v3)
    return 50.0;
  return result;
}

- (unint64_t)numberOfRows
{
  return 3;
}

- (MCProfileTitlePageSettingsIconCell)iconCell
{
  MCProfileTitlePageSettingsIconCell *iconCell;
  MCProfileTitlePageSettingsIconCell *v4;
  MCProfileTitlePageSettingsIconCell *v5;

  iconCell = self->_iconCell;
  if (!iconCell)
  {
    v4 = (MCProfileTitlePageSettingsIconCell *)objc_opt_new();
    v5 = self->_iconCell;
    self->_iconCell = v4;

    iconCell = self->_iconCell;
  }
  return iconCell;
}

- (MCProfileTitlePageTitleCell)titleCell
{
  MCProfileTitlePageTitleCell *titleCell;
  MCProfileTitlePageTitleCell *v4;
  MCProfileTitlePageTitleCell *v5;

  titleCell = self->_titleCell;
  if (!titleCell)
  {
    v4 = (MCProfileTitlePageTitleCell *)objc_opt_new();
    v5 = self->_titleCell;
    self->_titleCell = v4;

    titleCell = self->_titleCell;
  }
  return titleCell;
}

- (MCProfileTitlePageSubtitleCell)subtitleCell
{
  MCProfileTitlePageSubtitleCell *subtitleCell;
  MCProfileTitlePageSubtitleCell *v4;
  MCProfileTitlePageSubtitleCell *v5;

  subtitleCell = self->_subtitleCell;
  if (!subtitleCell)
  {
    v4 = (MCProfileTitlePageSubtitleCell *)objc_opt_new();
    v5 = self->_subtitleCell;
    self->_subtitleCell = v4;

    subtitleCell = self->_subtitleCell;
  }
  return subtitleCell;
}

- (MCProfileTitlePageOrganizationCell)orgCell
{
  MCProfileTitlePageOrganizationCell *orgCell;
  MCProfileTitlePageOrganizationCell *v4;
  MCProfileTitlePageOrganizationCell *v5;

  orgCell = self->_orgCell;
  if (!orgCell)
  {
    v4 = (MCProfileTitlePageOrganizationCell *)objc_opt_new();
    v5 = self->_orgCell;
    self->_orgCell = v4;

    orgCell = self->_orgCell;
  }
  return orgCell;
}

- (void)setIconCell:(id)a3
{
  objc_storeStrong((id *)&self->_iconCell, a3);
}

- (void)setTitleCell:(id)a3
{
  objc_storeStrong((id *)&self->_titleCell, a3);
}

- (void)setSubtitleCell:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleCell, a3);
}

- (void)setOrgCell:(id)a3
{
  objc_storeStrong((id *)&self->_orgCell, a3);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (MCProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_orgCell, 0);
  objc_storeStrong((id *)&self->_subtitleCell, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
  objc_storeStrong((id *)&self->_iconCell, 0);
}

@end
