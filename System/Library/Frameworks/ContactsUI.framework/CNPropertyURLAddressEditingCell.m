@implementation CNPropertyURLAddressEditingCell

- (CNPropertyURLAddressEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPropertyURLAddressEditingCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPropertyURLAddressEditingCell;
  v4 = -[CNPropertyEditingCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[CNPropertySimpleEditingCell textField](v4, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardType:", 3);

  return v4;
}

@end
