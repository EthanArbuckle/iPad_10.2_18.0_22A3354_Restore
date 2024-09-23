@implementation BarAppearanceBridge

- (void).cxx_destruct
{
  outlined destroy of BarAppearanceBridge.PlatformStorage((uint64_t)self + OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_platformStorage);
  outlined destroy of AccessibilityTableContext?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_updateContext, &lazy cache variable for type metadata for BarAppearanceBridge.UpdateContext?, (uint64_t)&type metadata for BarAppearanceBridge.UpdateContext);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  outlined consume of NavigationTitleStorage?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_lastNavigationTitleStorage), *(_QWORD *)&self->platformStorage[OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_lastNavigationTitleStorage], *(_QWORD *)&self->platformStorage[OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_lastNavigationTitleStorage + 8], *(_QWORD *)&self->platformStorage[OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_lastNavigationTitleStorage + 16], *(_QWORD *)&self->updateContext[OBJC_IVAR____TtC7SwiftUI19BarAppearanceBridge_lastNavigationTitleStorage + 7]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC7SwiftUI19BarAppearanceBridge)init
{
  return (_TtC7SwiftUI19BarAppearanceBridge *)BarAppearanceBridge.init()();
}

@end
