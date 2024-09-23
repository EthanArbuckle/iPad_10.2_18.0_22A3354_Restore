@implementation SwiftUIApplication

- (id)_extendLaunchTest
{
  _TtC7SwiftUIP33_ACC2C5639A7D76F611E170E831FCA49118SwiftUIApplication *v3;
  void *v4;
  uint64_t v6;

  if (!static AppGraph.shared)
    return 0;
  type metadata accessor for AccessibilityValueStorage?(0, (unint64_t *)&lazy cache variable for type metadata for String?);
  v3 = self;
  swift_retain();
  static Update.ensure<A>(_:)();

  swift_release();
  if (!v6)
    return 0;
  v4 = (void *)MEMORY[0x18D75CC88]();
  swift_bridgeObjectRelease();
  return v4;
}

- (_TtC7SwiftUIP33_ACC2C5639A7D76F611E170E831FCA49118SwiftUIApplication)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[SwiftUIApplication init](&v3, sel_init);
}

- (BOOL)_supportsPrintCommand
{
  uint64_t v2;
  _TtC7SwiftUIP33_ACC2C5639A7D76F611E170E831FCA49118SwiftUIApplication *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v7;

  if (!static AppGraph.shared)
    return 0;
  v2 = one-time initialization token for printing;
  v3 = self;
  v4 = swift_retain();
  if (v2 != -1)
    v4 = swift_once();
  MEMORY[0x1E0C80A78](v4, v5);
  static Update.ensure<A>(_:)();

  swift_release();
  return v7;
}

@end
