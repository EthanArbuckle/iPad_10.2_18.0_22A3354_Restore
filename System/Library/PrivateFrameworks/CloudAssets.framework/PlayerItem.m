@implementation PlayerItem

- (void)dealloc
{
  _TtC11CloudAssets10PlayerItem *v2;

  v2 = self;
  PlayerItem.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11CloudAssets10PlayerItem_id;
  v3 = sub_237F92868();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_unknownObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  _TtC11CloudAssets10PlayerItem *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_237FE0748(v6);

  sub_237F9195C(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_237F91A00((uint64_t)v6);
  return v4;
}

- (_TtC11CloudAssets10PlayerItem)initWithAsset:(id)a3 automaticallyLoadedAssetKeys:(id)a4
{
  id v5;

  if (a4)
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a3;
  PlayerItem.init(asset:automaticallyLoadedAssetKeys:)();
}

@end
