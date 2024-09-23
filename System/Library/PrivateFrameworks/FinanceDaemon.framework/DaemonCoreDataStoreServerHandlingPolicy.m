@implementation DaemonCoreDataStoreServerHandlingPolicy

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  id v4;
  _TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1CF495DF4();

  return self & 1;
}

- (id)allowableClassesForClientWithContext:(id)a3
{
  void *v3;

  if (sub_1CF496CF8())
  {
    v3 = (void *)sub_1CF52516C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)restrictingWritePredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  id v6;
  id v7;
  _TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1CF496E8C((uint64_t)a4);

  return v9;
}

- (id)restrictingReadPredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  id v7;
  id v8;
  _TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1CF496134(a3, a4);

  return v10;
}

- (BOOL)shouldAcceptMetadataChangesFromClientWithContext:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  BOOL result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy *v16;
  id v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;

  v5 = sub_1CF5233CC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v19 - v11;
  if (a3)
  {
    v13 = (uint64_t)self + OBJC_IVAR____TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy_policyLevelProvider;
    v14 = *(uint64_t *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy_entitlementChecker);
    v15 = (char *)self + OBJC_IVAR____TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy_authStatusProvider;
    v16 = self;
    v17 = a3;
    sub_1CF495B14(v13, v14, (uint64_t)v15, MEMORY[0x1E0CAC2D8], (uint64_t)v12);
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x1E0CAC8A0], v5);
    LOBYTE(v13) = sub_1CF5233C0();
    v18 = *(void (**)(char *, uint64_t))(v6 + 8);
    v18(v9, v5);
    v18(v12, v5);

    return v13 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy)init
{
  _TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy *result;

  result = (_TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1CF3CB808((uint64_t)self + OBJC_IVAR____TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy_bundleInfoProvider, &qword_1ED8F2780);
  sub_1CF3CB808((uint64_t)self + OBJC_IVAR____TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy_policyLevelProvider, &qword_1ED8F26D0);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy_authStatusProvider);
}

@end
