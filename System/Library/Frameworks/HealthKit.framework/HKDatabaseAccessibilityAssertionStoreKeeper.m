@implementation HKDatabaseAccessibilityAssertionStoreKeeper

- (HKDatabaseAccessibilityAssertionStoreKeeper)initWithHealthStore:(id)a3
{
  return (HKDatabaseAccessibilityAssertionStoreKeeper *)DatabaseAccessibilityAssertionStoreKeeper.init(healthStore:)(a3);
}

- (void)dealloc
{
  _DWORD *v3;
  HKDatabaseAccessibilityAssertionStoreKeeper *v4;
  objc_super v5;

  v3 = (_DWORD *)((char *)self
                + OBJC_IVAR___HKDatabaseAccessibilityAssertionStoreKeeper__didBecomeAvailableNotificationToken);
  swift_beginAccess();
  LODWORD(v3) = *v3;
  v4 = self;
  notify_cancel((int)v3);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for DatabaseAccessibilityAssertionStoreKeeper();
  -[HKDatabaseAccessibilityAssertionStoreKeeper dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___HKDatabaseAccessibilityAssertionStoreKeeper____lazy_storage____queue));
}

- (void)fetchDatabaseAccessibilityAssertionForOwnerIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  HKDatabaseAccessibilityAssertionStoreKeeper *v12;

  v7 = _Block_copy(a5);
  v8 = sub_19A353430();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = self;
  sub_19A337A68(v8, v10, (uint64_t)sub_19A32D398, v11, a4);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)connectionConfigured
{
  HKDatabaseAccessibilityAssertionStoreKeeper *v2;

  v2 = self;
  sub_19A339E7C();

}

- (void)invalidateAllDatabaseAccessibilityAssertions
{
  HKDatabaseAccessibilityAssertionStoreKeeper *v2;

  v2 = self;
  sub_19A33A0C0();

}

- (void)invalidateDatabaseAccessibilityAssertionWithAssertion:(id)a3
{
  id v4;
  HKDatabaseAccessibilityAssertionStoreKeeper *v5;

  v4 = a3;
  v5 = self;
  sub_19A33A3E4(v4);

}

- (HKDatabaseAccessibilityAssertionStoreKeeper)init
{
  HKDatabaseAccessibilityAssertionStoreKeeper *result;

  result = (HKDatabaseAccessibilityAssertionStoreKeeper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
