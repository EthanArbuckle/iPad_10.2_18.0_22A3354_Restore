@implementation UIKitSplitViewController

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC7SwiftUI24UIKitSplitViewController_allowsSecureDrawing);
}

- (_TtC7SwiftUI24UIKitSplitViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI24UIKitSplitViewController_allowsSecureDrawing) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[UIKitSplitViewController initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (_TtC7SwiftUI24UIKitSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC7SwiftUI24UIKitSplitViewController *v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = v9;
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC7SwiftUI24UIKitSplitViewController_allowsSecureDrawing) = 0;
    v11 = a4;
    a3 = (id)MEMORY[0x18D75CC88](v8, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC7SwiftUI24UIKitSplitViewController_allowsSecureDrawing) = 0;
    v12 = a4;
  }
  v15.receiver = self;
  v15.super_class = ObjectType;
  v13 = -[UIKitSplitViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, a3, a4);

  return v13;
}

- (_TtC7SwiftUI24UIKitSplitViewController)initWithStyle:(int64_t)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI24UIKitSplitViewController_allowsSecureDrawing) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[UIKitSplitViewController initWithStyle:](&v7, sel_initWithStyle_, a3);
}

@end
