@implementation UIKitPickerView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  char v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v5 = v13.receiver;
  -[UIKitPickerView sizeThatFits:](&v13, sel_sizeThatFits_, width, height);
  v7 = v6;
  v9 = v8;
  if ((isLinkedOnOrAfter(_:)() & 1) != 0)
  {

  }
  else
  {
    lazy protocol witness table accessor for type EnableUnifiedLayoutFeature and conformance EnableUnifiedLayoutFeature();
    v10 = static UserDefaultKeyedFeature.isEnabled.getter();

    if ((v10 & 1) == 0)
      width = v7;
  }
  v11 = width;
  v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC7SwiftUIP33_6F6D7FC252FF6BD4B4AE026DA1B1779815UIKitPickerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[UIKitPickerView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUIP33_6F6D7FC252FF6BD4B4AE026DA1B1779815UIKitPickerView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[UIKitPickerView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
