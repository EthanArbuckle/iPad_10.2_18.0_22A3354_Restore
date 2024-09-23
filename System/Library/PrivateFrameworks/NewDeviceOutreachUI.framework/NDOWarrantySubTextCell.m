@implementation NDOWarrantySubTextCell

+ (int64_t)cellStyle
{
  return 3;
}

- (NDOWarrantySubTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NDOWarrantySubTextCell *v4;
  NDOWarrantySubTextCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NDOWarrantySubTextCell;
  v4 = -[NDOWarrantySubTextCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[NDOWarrantySubTextCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

    -[NDOWarrantySubTextCell detailTextLabel](v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 2);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarrantySubTextCell detailTextLabel](v5, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

  }
  return v5;
}

@end
