@implementation TIFuzzyPinyinPairTableCell

+ (int64_t)cellStyle
{
  return 0;
}

- (TIFuzzyPinyinPairTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  TIFuzzyPinyinPairTableCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIFuzzyPinyinPairTableCell;
  v6 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4);
  if (v6)
    -[PSTableCell setChecked:](v6, "setChecked:", objc_msgSend((id)objc_msgSend(a5, "propertyForKey:", *MEMORY[0x24BE75DA0]), "BOOLValue"));
  return v6;
}

@end
