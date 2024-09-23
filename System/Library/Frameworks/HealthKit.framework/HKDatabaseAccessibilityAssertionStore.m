@implementation HKDatabaseAccessibilityAssertionStore

- (HKDatabaseAccessibilityAssertionStore)initWithHealthStore:(id)a3
{
  return (HKDatabaseAccessibilityAssertionStore *)DatabaseAccessibilityAssertionStore.init(healthStore:)(a3);
}

- (void)fetchDatabaseAccessibilityAssertionForOwnerIdentifier:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  HKDatabaseAccessibilityAssertionStore *v10;

  v5 = _Block_copy(a4);
  v6 = sub_19A353430();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  sub_19A32C3A0(v6, v8, (uint64_t)sub_19A32D398, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)invalidateDatabaseAccessibilityAssertionWithAssertion:(id)a3
{
  id v4;
  HKDatabaseAccessibilityAssertionStore *v5;

  v4 = a3;
  v5 = self;
  sub_19A32CD10(v4);

}

- (id)exportedInterface
{
  return sub_19A32D1BC((uint64_t)self, (uint64_t)a2, &protocolRef_HKDatabaseAccessibilityAssertionClientInterface);
}

- (id)remoteInterface
{
  return sub_19A32D1BC((uint64_t)self, (uint64_t)a2, &protocolRef_HKDatabaseAccessibilityAssertionServerInterface);
}

- (HKDatabaseAccessibilityAssertionStore)init
{
  HKDatabaseAccessibilityAssertionStore *result;

  result = (HKDatabaseAccessibilityAssertionStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___HKDatabaseAccessibilityAssertionStore____lazy_storage____proxyProvider));

}

@end
