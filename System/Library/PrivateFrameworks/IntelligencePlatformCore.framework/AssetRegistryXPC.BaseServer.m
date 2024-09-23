@implementation AssetRegistryXPC.BaseServer

- (void)assetEntryResultDataForAssetId:(id)a3 inDomainId:(id)a4 remoteOptionsData:(id)a5 completion:(id)a6
{
  sub_1C08000A4(self, (int)a2, (int)a3, (int)a4, a5, a6, "AssetRegistryXPC: assetEntryResultData: %s in %s", (uint64_t (*)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))sub_1C07FF040, (uint64_t)"AssetRegistryXPC: assetEntryResultData: failed: %s");
}

- (_TtCC24IntelligencePlatformCore16AssetRegistryXPC10BaseServer)init
{
  AssetRegistryXPC.BaseServer.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end
