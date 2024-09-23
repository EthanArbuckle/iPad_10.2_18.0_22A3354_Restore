@implementation CNFRegSettingsCallerIdCell

- (CNFRegSettingsCallerIdCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  CNFRegSettingsCallerIdCell *v5;
  CNFRegSettingsCallerIdCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNFRegSettingsCallerIdCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, 0, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[CNFRegSettingsCallerIdCell setAccessoryType:](v5, "setAccessoryType:", 1);
    -[CNFRegSettingsCallerIdCell setSelectionStyle:](v6, "setSelectionStyle:", 1);
  }
  return v6;
}

@end
