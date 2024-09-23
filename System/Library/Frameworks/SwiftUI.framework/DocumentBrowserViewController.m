@implementation DocumentBrowserViewController

- (_TtC7SwiftUI29DocumentBrowserViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC7SwiftUI29DocumentBrowserViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI29DocumentBrowserViewController_documentConfigurations) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI29DocumentBrowserViewController_configurationMap) = (Class)MEMORY[0x1E0DEE9E0];
  v4 = a3;

  result = (_TtC7SwiftUI29DocumentBrowserViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC7SwiftUI29DocumentBrowserViewController *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  specialized DocumentBrowserViewController.documentBrowser(_:didRequestDocumentCreationWithHandler:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSURL?, @unowned UIDocumentBrowserImportMode) -> (), v7);

  swift_release();
}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC7SwiftUI29DocumentBrowserViewController *v8;

  type metadata accessor for URL();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = a3;
  v8 = self;
  specialized DocumentBrowserViewController.documentBrowser(_:didPickDocumentsAt:)(v6);

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
  _TtC7SwiftUI29DocumentBrowserViewController *v17;
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
  DocumentBrowserViewController.presentDocument(at:animated:)((uint64_t)v11, 1);

  v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v18(v11, v7);
  v18(v15, v7);
}

- (void)documentBrowser:(id)a3 failedToImportDocumentAtURL:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC7SwiftUI29DocumentBrowserViewController *v14;
  id v15;
  uint64_t v16;

  v8 = type metadata accessor for URL();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = a3;
  v14 = self;
  v15 = a5;
  specialized DocumentBrowserViewController.documentBrowser(_:failedToImportDocumentAt:error:)(v13, (uint64_t)v12, (uint64_t)a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC7SwiftUI29DocumentBrowserViewController *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  specialized DocumentBrowserViewController.animationController(forPresented:presenting:source:)(v8);
  v13 = v12;

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC7SwiftUI29DocumentBrowserViewController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  DocumentBrowserViewController.animationController(forDismissed:)(v4);
  v7 = v6;

  return v7;
}

- (id)initForOpeningFilesWithContentTypes:(id)a3
{
  id result;

  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initForOpeningContentTypes:(id)a3
{
  id result;

  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  outlined destroy of RootModifier((uint64_t)self + OBJC_IVAR____TtC7SwiftUI29DocumentBrowserViewController_rootModifier);
  swift_bridgeObjectRelease();
}

@end
