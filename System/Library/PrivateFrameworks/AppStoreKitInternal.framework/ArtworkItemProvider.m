@implementation ArtworkItemProvider

- (id)loadDataRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC19AppStoreKitInternal19ArtworkItemProvider *v10;
  id v11;

  v5 = _Block_copy(a4);
  v6 = sub_1D892ADB4();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  v11 = ArtworkItemProvider.loadDataRepresentation(forTypeIdentifier:completionHandler:)(v6, v8, (uint64_t)sub_1D88A4E80, v9);

  swift_bridgeObjectRelease();
  swift_release();
  return v11;
}

- (_TtC19AppStoreKitInternal19ArtworkItemProvider)init
{
  _TtC19AppStoreKitInternal19ArtworkItemProvider *result;

  result = (_TtC19AppStoreKitInternal19ArtworkItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19AppStoreKitInternal19ArtworkItemProvider)initWithItem:(id)a3 typeIdentifier:(id)a4
{
  _TtC19AppStoreKitInternal19ArtworkItemProvider *result;

  swift_unknownObjectRetain();
  result = (_TtC19AppStoreKitInternal19ArtworkItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
