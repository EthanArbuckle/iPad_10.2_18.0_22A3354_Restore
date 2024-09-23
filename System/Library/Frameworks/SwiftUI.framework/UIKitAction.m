@implementation UIKitAction

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUIP33_BF747AB022DCE7FC5B6AD0F035BC8E0D11UIKitAction)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[UIMenuElement initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
