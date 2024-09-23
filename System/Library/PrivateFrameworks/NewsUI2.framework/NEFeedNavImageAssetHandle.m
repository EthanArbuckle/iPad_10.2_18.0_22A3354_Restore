@implementation NEFeedNavImageAssetHandle

- (NEFeedNavImageAssetHandle)initWithIdentifier:(id)a3 feedNavImage:(id)a4 feedNavImageSize:(CGSize)a5 feedNavImageStyler:(id)a6 scale:(double)a7
{
  double height;
  double width;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NEFeedNavImageAssetHandle *v16;

  height = a5.height;
  width = a5.width;
  v12 = sub_1D6E26978();
  v14 = v13;
  v15 = a4;
  swift_unknownObjectRetain();
  v16 = (NEFeedNavImageAssetHandle *)sub_1D678A7D0(v12, v14, v15, (uint64_t)a6, width, height, a7);

  swift_unknownObjectRelease();
  return v16;
}

- (NEFeedNavImageAssetHandle)initWithTag:(id)a3 feedNavImageSize:(CGSize)a4 feedNavImageStyler:(id)a5 scale:(double)a6 overrideFallbackColor:(id)a7
{
  double height;
  double width;
  id v13;
  NEFeedNavImageAssetHandle *v14;

  height = a4.height;
  width = a4.width;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v13 = a7;
  v14 = (NEFeedNavImageAssetHandle *)sub_1D678A6C4((uint64_t)a3, (uint64_t)a5, a7, width, height, a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v14;
}

- (NEFeedNavImageAssetHandle)init
{
  NEFeedNavImageAssetHandle *result;

  result = (NEFeedNavImageAssetHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

@end
