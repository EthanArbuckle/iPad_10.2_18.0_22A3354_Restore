@implementation CNContactDowntimeWhitelistCell

- (CNContactDowntimeWhitelistCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNContactDowntimeWhitelistCell *v4;
  CNContactDowntimeWhitelistCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNContactDowntimeWhitelistCell *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNContactDowntimeWhitelistCell;
  v4 = -[CNContactCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[CNContactDowntimeWhitelistCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 4);

    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_WARNING"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactDowntimeWhitelistCell textLabel](v5, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactDowntimeWhitelistCell textLabel](v5, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    v12 = v5;
  }

  return v5;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end
