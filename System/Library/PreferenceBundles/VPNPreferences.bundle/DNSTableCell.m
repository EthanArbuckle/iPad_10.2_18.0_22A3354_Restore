@implementation DNSTableCell

- (DNSTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DNSTableCell;
  return -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v6, sel_initWithStyle_reuseIdentifier_specifier_, 3, a4, a5);
}

@end
