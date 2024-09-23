@implementation AAUIAccountContactsDefaultTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAUIAccountContactsDefaultTableCell;
  -[AAUISpecifierWithSubtitleCell refreshCellContentsWithSpecifier:](&v5, sel_refreshCellContentsWithSpecifier_, a3);
  -[AAUIAccountContactsDefaultTableCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 15);

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AAUIAccountContactsDefaultTableCell;
  -[PSTableCell layoutSubviews](&v4, sel_layoutSubviews);
  -[AAUIAccountContactsDefaultTableCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSize:", 50.0, 60.0);

  -[AAUIAccountContactsDefaultTableCell setNeedsDisplay](self, "setNeedsDisplay");
}

@end
