@implementation CNUIFamilyDowntimeContactPickerCell

- (CNUIFamilyDowntimeContactPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNUIFamilyDowntimeContactPickerCell;
  return -[CNUIFamilyDowntimeContactPickerCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, 1, a4);
}

+ (id)reuseIdentifier
{
  return CFSTR("CNUIFamilyDowntimeContactPickerCellIdentifier");
}

@end
