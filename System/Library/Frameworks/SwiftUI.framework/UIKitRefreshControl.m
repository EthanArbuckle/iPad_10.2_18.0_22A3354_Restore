@implementation UIKitRefreshControl

- (_TtC7SwiftUI19UIKitRefreshControl)initWithCoder:(id)a3
{
  id v4;
  _TtC7SwiftUI19UIKitRefreshControl *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI19UIKitRefreshControl_currentTask) = 0;
  v4 = a3;

  result = (_TtC7SwiftUI19UIKitRefreshControl *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC7SwiftUI19UIKitRefreshControl *v4;
  uint64_t v5;
  _TtC7SwiftUI19UIKitRefreshControl *v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7SwiftUI19UIKitRefreshControl_currentTask))
  {
    v4 = self;
    v5 = swift_retain();
    MEMORY[0x18D75D204](v5, MEMORY[0x1E0DEE9C0] + 8, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEDD18]);
    swift_release();
  }
  else
  {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = ObjectType;
  -[UIRefreshControl dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (void)_swiftui_handleRefreshControl
{
  _TtC7SwiftUI19UIKitRefreshControl *v2;

  v2 = self;
  UIKitRefreshControl._swiftui_handleRefreshControl()();

}

- (_TtC7SwiftUI19UIKitRefreshControl)init
{
  _TtC7SwiftUI19UIKitRefreshControl *result;

  result = (_TtC7SwiftUI19UIKitRefreshControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI19UIKitRefreshControl)initWithFrame:(CGRect)a3
{
  _TtC7SwiftUI19UIKitRefreshControl *result;

  result = (_TtC7SwiftUI19UIKitRefreshControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
