@implementation FileWrapperPlatformDocument

- (id)contentsForType:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  _TtC7SwiftUI27FileWrapperPlatformDocument *v8;
  void *v9;
  uint64_t v11[4];

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;
  v8 = self;
  FileWrapperPlatformDocument.contents(forType:)(v5, v7, v11);
  swift_bridgeObjectRelease();

  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  v9 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v9;
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC7SwiftUI27FileWrapperPlatformDocument *v10;
  uint64_t v12;

  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = self;
  FileWrapperPlatformDocument.read(from:)((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  return 1;
}

@end
