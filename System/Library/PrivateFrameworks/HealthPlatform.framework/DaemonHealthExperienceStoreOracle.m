@implementation DaemonHealthExperienceStoreOracle

- (void)dealloc
{
  _TtC14HealthPlatform33DaemonHealthExperienceStoreOracle *v2;
  objc_super v3;

  v2 = self;
  sub_1BC719BAC();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DaemonHealthExperienceStoreOracle();
  -[DaemonHealthExperienceStoreOracle dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)debuggingInfoRequestedWithNote:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC14HealthPlatform33DaemonHealthExperienceStoreOracle *v8;
  uint64_t v9;

  v4 = sub_1BC816CE4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC816CA8();
  v8 = self;
  DaemonHealthExperienceStoreOracle.debuggingInfoRequested(note:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
