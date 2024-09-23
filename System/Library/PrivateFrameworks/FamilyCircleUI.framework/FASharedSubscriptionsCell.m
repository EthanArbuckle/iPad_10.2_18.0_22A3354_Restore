@implementation FASharedSubscriptionsCell

- (FASharedSubscriptionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  FASharedSubscriptionsCell *v5;
  FASharedSubscriptionsCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FASharedSubscriptionsCell;
  v5 = -[FASharedSubscriptionsCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, 3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[FASharedSubscriptionsCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v8);

    -[FASharedSubscriptionsCell textLabel](v6, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

    -[FASharedSubscriptionsCell textLabel](v6, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 0);

    -[FASharedSubscriptionsCell detailTextLabel](v6, "detailTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    -[FASharedSubscriptionsCell detailTextLabel](v6, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLineBreakMode:", 0);

    -[FASharedSubscriptionsCell detailTextLabel](v6, "detailTextLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumberOfLines:", 0);

    -[FASharedSubscriptionsCell imageView](v6, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentMode:", 1);

  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FASharedSubscriptionsCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v9, sel_refreshCellContentsWithSpecifier_, v4);
  -[FASharedSubscriptionsCell textLabel](self, "textLabel", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  -[FASharedSubscriptionsCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D28]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setText:", v8);
  -[FASharedSubscriptionsCell setNeedsLayout](self, "setNeedsLayout");
}

@end
