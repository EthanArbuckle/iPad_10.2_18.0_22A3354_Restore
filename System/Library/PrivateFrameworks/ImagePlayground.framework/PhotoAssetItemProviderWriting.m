@implementation PhotoAssetItemProviderWriting

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v2;

  if (qword_256DCF608 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23EFD16E8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC15ImagePlayground29PhotoAssetItemProviderWriting *v9;
  void *v10;

  v5 = _Block_copy(a4);
  v6 = sub_23EFD1514();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  v10 = (void *)sub_23EECF484(v6, v8, (uint64_t)v9, v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC15ImagePlayground29PhotoAssetItemProviderWriting)init
{
  _TtC15ImagePlayground29PhotoAssetItemProviderWriting *result;

  result = (_TtC15ImagePlayground29PhotoAssetItemProviderWriting *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
