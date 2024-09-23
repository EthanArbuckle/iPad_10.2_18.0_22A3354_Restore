@implementation StubDocument

- (BOOL)writeContents:(id)a3 toURL:(id)a4 forSaveOperation:(int64_t)a5 originalContentsURL:(id)a6 error:(id *)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  id v19;
  _TtC7SwiftUI12StubDocument *v20;
  id v21;
  uint64_t v22;
  _BYTE v24[16];
  _BYTE v25[32];

  type metadata accessor for URL?(0);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = &v24[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for URL();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14, v16);
  v18 = &v24[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_unknownObjectRetain();
  v19 = a4;
  v20 = self;
  v21 = a6;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  if (v21)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v22 = 0;
  }
  else
  {
    v22 = 1;
  }
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, v22, 1, v14);
  specialized StubDocument.writeContents(_:to:for:originalContentsURL:)((uint64_t)v25, (uint64_t)v18);

  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for URL?);
  (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v18, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  return 1;
}

- (BOOL)loadFromContents:(id)a3 ofType:(id)a4 error:(id *)a5
{
  _TtC7SwiftUI12StubDocument *v7;
  id v8;
  uint64_t v10;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = a4;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (v8)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  swift_bridgeObjectRelease();

  return 1;
}

- (_TtC7SwiftUI12StubDocument)initWithFileURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _TtC7SwiftUI12StubDocument *result;

  v3 = type metadata accessor for URL();
  MEMORY[0x1E0C80A78](v3, v4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  result = (_TtC7SwiftUI12StubDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)self + OBJC_IVAR____TtC7SwiftUI12StubDocument_documentURL, (uint64_t (*)(_QWORD))type metadata accessor for Binding<URL?>);
  v3 = (char *)self + OBJC_IVAR____TtC7SwiftUI12StubDocument_contentType;
  v4 = type metadata accessor for UTType();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI12StubDocument_documentRenaming);
}

@end
