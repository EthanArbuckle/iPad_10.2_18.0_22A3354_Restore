@implementation CNLimitedAccessSelectedContactsCell

- (CNLimitedAccessSelectedContactsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNLimitedAccessSelectedContactsCell *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNLimitedAccessSelectedContactsCell *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNLimitedAccessSelectedContactsCell;
  v4 = -[CNLimitedAccessSelectedContactsCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, 1, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_alloc_init(MEMORY[0x1E0C97218]);
    -[CNLimitedAccessSelectedContactsCell setFormatter:](v4, "setFormatter:", v6);

    -[CNLimitedAccessSelectedContactsCell formatter](v4, "formatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEmphasizesPrimaryNameComponent:", 1);

    -[CNLimitedAccessSelectedContactsCell formatter](v4, "formatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIgnoresNickname:", 1);

    -[CNLimitedAccessSelectedContactsCell formatter](v4, "formatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIgnoresOrganization:", 1);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsCell textLabel](v4, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    v12 = v4;
  }

  return v4;
}

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CNLimitedAccessSelectedContactsCell;
  -[CNLimitedAccessSelectedContactsCell awakeFromNib](&v2, sel_awakeFromNib);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNLimitedAccessSelectedContactsCell;
  -[CNLimitedAccessSelectedContactsCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (CNContactFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("CNLimitedAccessSelectedContactsCellIdentifier");
}

@end
