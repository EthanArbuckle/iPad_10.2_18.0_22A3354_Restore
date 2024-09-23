@implementation UIKitIconPreferringButton

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  void *v9;
  _TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F725UIKitIconPreferringButton *v10;
  id v11;
  void *v12;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v9;
  }
  else
  {
    v8 = 0;
  }
  v10 = self;
  if (-[UIKitIconPreferringButton changesSelectionAsPrimaryAction](v10, sel_changesSelectionAsPrimaryAction))
  {
    v11 = -[UIKitIconPreferringButton titleForState:](v10, sel_titleForState_, a4);
    if (!v11)
    {

      swift_bridgeObjectRelease();
      return;
    }

  }
  if (a3)
    v12 = (void *)MEMORY[0x18D75CC88](v8, a3);
  else
    v12 = 0;
  v13.receiver = v10;
  v13.super_class = ObjectType;
  -[UIKitIconPreferringButton setTitle:forState:](&v13, sel_setTitle_forState_, v12, a4);

  swift_bridgeObjectRelease();
}

- (_TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F725UIKitIconPreferringButton)initWithFrame:(CGRect)a3
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
  return -[UIKitButtonBase initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F725UIKitIconPreferringButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[UIKitButtonBase initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
