@implementation AssetRegistryXPC.Server

- (void)assetEntryResultDataForAssetId:(id)a3 inDomainId:(id)a4 remoteOptionsData:(id)a5 completion:(id)a6
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  _TtCC24IntelligencePlatformCore16AssetRegistryXPC6Server *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v8 = _Block_copy(a6);
  v9 = sub_1C106FB14();
  v11 = v10;
  v12 = sub_1C106FB14();
  v14 = v13;
  v15 = a5;
  v16 = self;
  v17 = sub_1C106AC18();
  v19 = v18;

  _Block_copy(v8);
  sub_1C07FF48C(v9, v11, v12, v14, v17, v19, (uint64_t)v16, v8);
  _Block_release(v8);
  sub_1C07B3374(v17, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)overrideAssetEntryForAssetId:(id)a3 inDomainId:(id)a4 overrideAssetEntryParametersData:(id)a5 completion:(id)a6
{
  sub_1C08000A4(self, (int)a2, (int)a3, (int)a4, a5, a6, "AssetRegistryXPC: overrideAssetEntry: %s in %s", (uint64_t (*)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))sub_1C07FF64C, (uint64_t)"AssetRegistryXPC: overrideAssetEntry: failed: %s");
}

- (_TtCC24IntelligencePlatformCore16AssetRegistryXPC6Server)init
{
  AssetRegistryXPC.Server.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC24IntelligencePlatformCore16AssetRegistryXPC6Server_baseServer));
  swift_bridgeObjectRelease();
}

@end
