@implementation URLDocumentCreation

- (_TtC7SwiftUI19URLDocumentCreation)init
{
  _TtC7SwiftUI19URLDocumentCreation *result;

  result = (_TtC7SwiftUI19URLDocumentCreation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)self + OBJC_IVAR____TtC7SwiftUI19URLDocumentCreation_documentURL, (uint64_t (*)(_QWORD))type metadata accessor for Binding<URL?>);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19URLDocumentCreation_newDocumentHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUI19URLDocumentCreation____lazy_storage___documentBrowser));
}

- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  _TtC7SwiftUI19URLDocumentCreation *v16;
  id v17;
  _TtC7SwiftUI19URLDocumentCreation *v18;
  uint64_t v19;

  type metadata accessor for TupleView<(ModifiedContent<AnyView, _TraitWritingModifier<LayoutPriorityTraitKey>>, _ConditionalContent<Image, Image>?)>(0, &lazy cache variable for type metadata for TaskPriority?, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v19 - v9;
  v11 = _Block_copy(a4);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a3;
  v14[5] = self;
  v14[6] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSURL?, @unowned UIDocumentBrowserImportMode) -> ();
  v14[7] = v12;
  v15 = a3;
  v16 = self;
  v17 = v15;
  v18 = v16;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v10, (uint64_t)&async function pointer to partial apply for closure #1 in URLDocumentCreation.documentBrowser(_:didRequestDocumentCreationWithHandler:), (uint64_t)v14);

  swift_release();
  swift_release();
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
  _TtC7SwiftUI19URLDocumentCreation *v17;
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
  URLDocumentCreation.presentDocument(at:)((uint64_t)v11);

  v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v18(v11, v7);
  v18(v15, v7);
}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC7SwiftUI19URLDocumentCreation *v8;

  type metadata accessor for URL();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = a3;
  v8 = self;
  specialized URLDocumentCreation.documentBrowser(_:didPickDocumentsAt:)(v6);

  swift_bridgeObjectRelease();
}

@end
