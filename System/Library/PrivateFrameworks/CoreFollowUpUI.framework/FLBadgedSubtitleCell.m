@implementation FLBadgedSubtitleCell

+ (id)reuseIdentifierForClassAndType:(int64_t)a3
{
  return CFSTR("FLBadgedSubtitleCell");
}

- (FLBadgedSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7;
  FLBadgedSubtitleCell *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)FLBadgedSubtitleCell;
  v8 = -[PSBadgedTableCell initWithStyle:reuseIdentifier:specifier:](&v12, sel_initWithStyle_reuseIdentifier_specifier_, 3, a4, v7);
  if (v8)
  {
    objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75D28]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell valueLabel](v8, "valueLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

  }
  return v8;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FLBadgedSubtitleCell;
  v4 = a3;
  -[PSBadgedTableCell refreshCellContentsWithSpecifier:](&v7, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D28], v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSTableCell valueLabel](self, "valueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (int64_t)style
{
  return 3;
}

@end
