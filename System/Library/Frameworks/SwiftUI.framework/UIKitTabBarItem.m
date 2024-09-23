@implementation UIKitTabBarItem

- (void)updateAccessibility
{
  _TtC7SwiftUI15UIKitTabBarItem *v2;

  v2 = self;
  UIKitTabBarItem.updateAccessibility()();

}

- (_TtC7SwiftUI15UIKitTabBarItem)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI15UIKitTabBarItem_resolvedAccessibilityLabel) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI15UIKitTabBarItem_accessibility);
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[UIBarItem init](&v6, sel_init);
}

- (_TtC7SwiftUI15UIKitTabBarItem)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI15UIKitTabBarItem_resolvedAccessibilityLabel) = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI15UIKitTabBarItem_accessibility);
  *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[UIBarItem initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI15UIKitTabBarItem_resolvedAccessibilityLabel));
  swift_bridgeObjectRelease();
}

@end
