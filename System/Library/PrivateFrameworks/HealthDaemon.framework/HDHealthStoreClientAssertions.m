@implementation HDHealthStoreClientAssertions

- (void)dealloc
{
  _TtC12HealthDaemon29HDHealthStoreClientAssertions *v2;
  objc_super v3;

  v2 = self;
  sub_1B7859960();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for HDHealthStoreClientAssertions();
  -[HDHealthStoreClientAssertions dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)invalidateAssertions
{
  _TtC12HealthDaemon29HDHealthStoreClientAssertions *v2;

  v2 = self;
  sub_1B7859960();

}

- (id)firstAssertion
{
  os_unfair_lock_s *v3;
  _TtC12HealthDaemon29HDHealthStoreClientAssertions *v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (os_unfair_lock_s *)((char *)self + OBJC_IVAR____TtC12HealthDaemon29HDHealthStoreClientAssertions__dbAssertionLock);
  swift_beginAccess();
  v4 = self;
  os_unfair_lock_lock(v3);
  swift_endAccess();
  v5 = (uint64_t *)((char *)v4
                 + OBJC_IVAR____TtC12HealthDaemon29HDHealthStoreClientAssertions_databaseAccessibilityAssertions);
  swift_beginAccess();
  sub_1B7859618(*v5);
  if (v7)
  {
    v8 = v6;
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  swift_beginAccess();
  os_unfair_lock_unlock(v3);
  swift_endAccess();

  return v8;
}

- (id)accessibilityAssertions
{
  _TtC12HealthDaemon29HDHealthStoreClientAssertions *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1B7859D10();

  if (v3)
  {
    sub_1B785AEBC();
    v4 = (void *)sub_1B7EF9D04();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)assertionForHKDatabaseAccessibilityAssertionWithHkDatabaseAccessibilityAssertion:(id)a3
{
  id v4;
  _TtC12HealthDaemon29HDHealthStoreClientAssertions *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B7859E64(v4);

  return v6;
}

- (void)addAssertionMappingWithAssertion:(id)a3
{
  id v4;
  _TtC12HealthDaemon29HDHealthStoreClientAssertions *v5;

  v4 = a3;
  v5 = self;
  sub_1B785A048(v4);

}

- (void)removeAssertionMappingWithAssertion:(id)a3
{
  id v4;
  _TtC12HealthDaemon29HDHealthStoreClientAssertions *v5;

  v4 = a3;
  v5 = self;
  sub_1B785A228(v4);

}

- (_TtC12HealthDaemon29HDHealthStoreClientAssertions)init
{
  uint64_t v3;
  _TtC12HealthDaemon29HDHealthStoreClientAssertions *v4;
  objc_super v6;

  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon29HDHealthStoreClientAssertions__dbAssertionLock) = 0;
  v3 = OBJC_IVAR____TtC12HealthDaemon29HDHealthStoreClientAssertions_databaseAccessibilityAssertions;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1B78597C4(MEMORY[0x1E0DEE9D8]);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for HDHealthStoreClientAssertions();
  return -[HDHealthStoreClientAssertions init](&v6, sel_init);
}

@end
