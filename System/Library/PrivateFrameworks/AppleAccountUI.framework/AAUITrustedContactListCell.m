@implementation AAUITrustedContactListCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AAUITrustedContactListCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v20, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("contactGrayed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[AAUITrustedContactListCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v8);

  -[AAUITrustedContactListCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

  -[AAUITrustedContactListCell textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D80978]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  -[AAUITrustedContactListCell detailTextLabel](self, "detailTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v14);

  -[AAUITrustedContactListCell detailTextLabel](self, "detailTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v16);

  -[AAUITrustedContactListCell detailTextLabel](self, "detailTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D80950]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v18);

  -[AAUITrustedContactListCell imageView](self, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentMode:", 1);

  -[AAUITrustedContactListCell setNeedsLayout](self, "setNeedsLayout");
}

+ (id)specifierForContact:(id)a3 loadAction:(SEL)a4 target:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  _BOOL4 IsAccessibilityCategory;
  double v19;
  void *v20;

  v7 = (void *)MEMORY[0x1E0D804E8];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, v8, 0, 0, 0, 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v12, *MEMORY[0x1E0D80978]);

  objc_msgSend(v9, "detailsText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v13, *MEMORY[0x1E0D80950]);

  objc_msgSend(v11, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  +[AAUITrustedContactsImageProvider imageForLocalContact:](AAUITrustedContactsImageProvider, "imageForLocalContact:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v14, *MEMORY[0x1E0D80870]);

  objc_msgSend(v11, "setControllerLoadAction:", a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "shouldGrayOutContactRow"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v15, CFSTR("contactGrayed"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);
  v19 = *MEMORY[0x1E0DC53D8];
  if (!IsAccessibilityCategory)
    v19 = 60.0;
  objc_msgSend(v16, "numberWithDouble:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v20, *MEMORY[0x1E0D80938]);

  objc_msgSend(v11, "setUserInfo:", v9);
  return v11;
}

@end
