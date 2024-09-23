@implementation ToolbarPlatformDelegate

- (_TtC7SwiftUI23ToolbarPlatformDelegate)init
{
  objc_super v4;

  *(_QWORD *)&self->provider[OBJC_IVAR____TtC7SwiftUI23ToolbarPlatformDelegate_provider] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ToolbarPlatformDelegate();
  return -[ToolbarPlatformDelegate init](&v4, sel_init);
}

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI23ToolbarPlatformDelegate_provider);
}

@end
