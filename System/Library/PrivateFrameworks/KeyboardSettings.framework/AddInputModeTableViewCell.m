@implementation AddInputModeTableViewCell

+ (int64_t)cellStyle
{
  return 3;
}

- (AddInputModeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AddInputModeTableViewCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AddInputModeTableViewCell;
  v6 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4);
  if (v6)
  {
    if (!objc_msgSend(a5, "propertyForKey:", CFSTR("TIKBAllIdentifiersKey")))
    {
      objc_msgSend(a5, "propertyForKey:", *MEMORY[0x24BE75AC0]);
      if (objc_msgSend((id)TIInputModeGetVariant(), "length"))
        objc_msgSend((id)-[AddInputModeTableViewCell detailTextLabel](v6, "detailTextLabel"), "setText:", TUIKeyboardTitle());
    }
  }
  return v6;
}

@end
