@implementation UIView(CNContactStyle)

- (id)_cnui_contactStyle
{
  return +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
}

@end
