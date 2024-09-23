@implementation UIKitMainMenuController

- (void)buildMenuWithBuilder:(id)a3
{
  _TtC7SwiftUI23UIKitMainMenuController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  UIKitMainMenuController.buildMenu(with:)(a3);
  swift_unknownObjectRelease();

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC7SwiftUI23UIKitMainMenuController *v6;
  _TtC7SwiftUI23UIKitMainMenuController *v7;
  char v8;
  _OWORD v10[2];

  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = UIKitMainMenuController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  outlined destroy of TableRowID?((uint64_t)v10, (uint64_t)&lazy cache variable for type metadata for Any?, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))type metadata accessor for _EnvironmentKeyWritingModifier<Bool>);
  return v8 & 1;
}

- (void)_performMainMenuShortcutKeyCommand:(id)a3
{
  UIKeyCommand *v4;
  _TtC7SwiftUI23UIKitMainMenuController *v5;

  v4 = (UIKeyCommand *)a3;
  v5 = self;
  UIKitMainMenuController._performMainMenuShortcutKeyCommand(_:)(v4);

}

- (_TtC7SwiftUI23UIKitMainMenuController)init
{
  _TtC7SwiftUI23UIKitMainMenuController *result;

  result = (_TtC7SwiftUI23UIKitMainMenuController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
