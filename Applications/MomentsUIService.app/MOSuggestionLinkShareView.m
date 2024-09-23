@implementation MOSuggestionLinkShareView

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithURL:(id)a3
{
  @objc MOSuggestionLinkShareView.init(url:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))&type metadata accessor for URL, (void (*)(uint64_t))&static URL._unconditionallyBridgeFromObjectiveC(_:), (uint64_t)"init(url:)", 10);
}

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithMetadata:(id)a3
{
  id v3;
  _TtC16MomentsUIService25MOSuggestionLinkShareView *result;

  v3 = a3;
  result = (_TtC16MomentsUIService25MOSuggestionLinkShareView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionLinkShareView", 42, "init(metadata:)", 15, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithFrame:(CGRect)a3
{
  @objc MOSuggestionCutoutView.init(frame:)((uint64_t)self, (uint64_t)a2, (uint64_t)"MomentsUIService.MOSuggestionLinkShareView", 42);
}

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithPresentationProperties:(id)a3
{
  _TtC16MomentsUIService25MOSuggestionLinkShareView *result;

  swift_unknownObjectRetain();
  result = (_TtC16MomentsUIService25MOSuggestionLinkShareView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionLinkShareView", 42, "init(presentationProperties:)", 29, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithPresentationProperties:(id)a3 URL:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC16MomentsUIService25MOSuggestionLinkShareView *result;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v8 = type metadata accessor for URL(0);
    v9 = 0;
  }
  else
  {
    v8 = type metadata accessor for URL(0);
    v9 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, v9, 1);
  swift_unknownObjectRetain();
  result = (_TtC16MomentsUIService25MOSuggestionLinkShareView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionLinkShareView", 42, "init(presentationProperties:url:)", 33, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithMetadataLoadedFromURL:(id)a3
{
  @objc MOSuggestionLinkShareView.init(url:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))&type metadata accessor for URL, (void (*)(uint64_t))&static URL._unconditionallyBridgeFromObjectiveC(_:), (uint64_t)"init(metadataLoadedFrom:)", 25);
}

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithMetadataLoadedFromRequest:(id)a3
{
  @objc MOSuggestionLinkShareView.init(url:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))&type metadata accessor for URLRequest, (void (*)(uint64_t))&static URLRequest._unconditionallyBridgeFromObjectiveC(_:), (uint64_t)"init(metadataLoadedFrom:)", 25);
}

@end
