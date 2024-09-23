@implementation InferenceSupportXPC.Server

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
  _TtCC24IntelligencePlatformCore19InferenceSupportXPC6Server *v16;
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
  sub_1C0B55E40(v9, v11, v12, v14, v17, v19, (uint64_t)v16, v8);
  _Block_release(v8);
  sub_1C07B3374(v17, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtCC24IntelligencePlatformCore19InferenceSupportXPC6Server)init
{
  InferenceSupportXPC.Server.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC24IntelligencePlatformCore19InferenceSupportXPC6Server_assetRegistryXPCBaseServer));
}

@end
