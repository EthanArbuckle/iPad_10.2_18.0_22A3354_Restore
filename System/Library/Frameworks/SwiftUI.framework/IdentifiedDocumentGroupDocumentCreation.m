@implementation IdentifiedDocumentGroupDocumentCreation

- (_TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation)init
{
  _TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation *result;

  result = (_TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of UIKitInspectorV3Bridge<TabItem.RootView>.PresentationKind?((uint64_t)self+ OBJC_IVAR____TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation____lazy_storage___defaultEditorConfiguration, &lazy cache variable for type metadata for IdentifiedDocumentGroupConfiguration??, (uint64_t)&lazy cache variable for type metadata for IdentifiedDocumentGroupConfiguration?, (uint64_t)&type metadata for IdentifiedDocumentGroupConfiguration, (void (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for AccessibilityValueStorage?);
  outlined destroy of UIKitInspectorV3Bridge<TabItem.RootView>.PresentationKind?((uint64_t)self+ OBJC_IVAR____TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation____lazy_storage___defaultConfiguration, &lazy cache variable for type metadata for IdentifiedDocumentGroupConfiguration??, (uint64_t)&lazy cache variable for type metadata for IdentifiedDocumentGroupConfiguration?, (uint64_t)&type metadata for IdentifiedDocumentGroupConfiguration, (void (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for AccessibilityValueStorage?);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation____lazy_storage___documentBrowser));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation_newDocumentHandler));
  swift_bridgeObjectRelease();
}

- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  specialized IdentifiedDocumentGroupDocumentCreation.documentBrowser(_:didRequestDocumentCreationWithHandler:)(v7, (char *)v8, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation *v8;

  type metadata accessor for URL();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = a3;
  v8 = self;
  specialized IdentifiedDocumentGroupDocumentCreation.documentBrowser(_:didPickDocumentsAt:)(v6);

  swift_bridgeObjectRelease();
}

- (void)documentBrowser:(id)a3 didImportDocumentAtURL:(id)a4 toDestinationURL:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;

  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v19 - v14;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = a3;
  v17 = self;
  IdentifiedDocumentGroupDocumentCreation.presentDocument(at:)((uint64_t)v11);

  v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v18(v11, v7);
  v18(v15, v7);
}

@end
