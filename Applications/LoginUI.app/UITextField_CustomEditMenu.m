@implementation UITextField_CustomEditMenu

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  objc_super v8;

  if ("copy:" != a3 && "paste:" != a3 && "selectAll:" != a3 && "select:" != a3)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)UITextField_CustomEditMenu;
  return -[UITextField_CustomEditMenu canPerformAction:withSender:](&v8, "canPerformAction:withSender:");
}

@end
