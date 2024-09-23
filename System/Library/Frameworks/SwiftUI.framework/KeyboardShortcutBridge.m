@implementation KeyboardShortcutBridge

- (_TtC7SwiftUI22KeyboardShortcutBridge)init
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC7SwiftUI22KeyboardShortcutBridge_currentBindings;
  v5 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)v4 = MEMORY[0x1E0DEE9D8];
  *((_DWORD *)v4 + 2) = -1;
  v6 = (char *)self + OBJC_IVAR____TtC7SwiftUI22KeyboardShortcutBridge_updatedBindings;
  *(_QWORD *)v6 = v5;
  *((_DWORD *)v6 + 2) = -1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI22KeyboardShortcutBridge_shortcutMap) = (Class)MEMORY[0x1E0DEE9E0];
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI22KeyboardShortcutBridge_isObservingPreferences) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[KeyboardShortcutBridge init](&v8, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)_performShortcutKeyCommand:(id)a3
{
  UIKeyCommand *v4;
  _TtC7SwiftUI22KeyboardShortcutBridge *v5;

  v4 = (UIKeyCommand *)a3;
  v5 = self;
  KeyboardShortcutBridge._performShortcutKeyCommand(_:)(v4);

}

@end
