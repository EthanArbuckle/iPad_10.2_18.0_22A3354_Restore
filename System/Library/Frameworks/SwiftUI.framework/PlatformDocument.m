@implementation PlatformDocument

- (void)dealloc
{
  _TtC7SwiftUI16PlatformDocument *v2;

  v2 = self;
  PlatformDocument.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (_TtC7SwiftUI16PlatformDocument)initWithFileURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _TtC7SwiftUI16PlatformDocument *result;

  v3 = type metadata accessor for URL();
  MEMORY[0x1E0C80A78](v3, v4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  result = (_TtC7SwiftUI16PlatformDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
