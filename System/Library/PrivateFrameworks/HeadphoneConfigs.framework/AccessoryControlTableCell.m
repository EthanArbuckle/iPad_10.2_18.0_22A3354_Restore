@implementation AccessoryControlTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AccessoryControlTableCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v7, sel_refreshCellContentsWithSpecifier_, v4);
  -[AccessoryControlTableCell detailTextLabel](self, "detailTextLabel", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D80950]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setText:", v6);
  -[AccessoryControlTableCell setNeedsLayout](self, "setNeedsLayout");
}

@end
