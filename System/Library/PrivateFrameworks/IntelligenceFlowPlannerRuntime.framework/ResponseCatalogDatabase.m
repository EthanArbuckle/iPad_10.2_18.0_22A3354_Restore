@implementation ResponseCatalogDatabase

- (void)dealloc
{
  _TtC30IntelligenceFlowPlannerRuntime23ResponseCatalogDatabase *v2;

  v2 = self;
  ResponseCatalogDatabase.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC30IntelligenceFlowPlannerRuntime23ResponseCatalogDatabase_config;
  v4 = sub_23F57D86C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC30IntelligenceFlowPlannerRuntime23ResponseCatalogDatabase)init
{
  ResponseCatalogDatabase.init()();
}

@end
