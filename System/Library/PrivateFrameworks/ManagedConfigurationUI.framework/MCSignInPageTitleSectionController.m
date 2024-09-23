@implementation MCSignInPageTitleSectionController

- (unint64_t)numberOfRows
{
  return 2;
}

- (double)heightForHeader
{
  return 55.0;
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

  if (a3 == 1)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    MCUILocalizedString(CFSTR("SIGN_IN_TO_%@"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCSignInPageTitleSectionController orgName](self, "orgName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageMetaDataSectionController subtitleCell](self, "subtitleCell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v11);

    -[MCProfileTitlePageMetaDataSectionController subtitleCell](self, "subtitleCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v7 = 0;
  }
  else
  {
    MCUILocalizedString(CFSTR("SIGN_IN"));
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

- (NSString)orgName
{
  return self->_orgName;
}

- (void)setOrgName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orgName, 0);
}

@end
