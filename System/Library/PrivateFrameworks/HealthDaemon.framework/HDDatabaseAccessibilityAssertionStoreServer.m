@implementation HDDatabaseAccessibilityAssertionStoreServer

- (HDDatabaseAccessibilityAssertionStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  void *v16;
  objc_class *v17;
  HDDatabaseAccessibilityAssertionStoreServer *v18;
  HDDatabaseAccessibilityAssertionStoreServer *v19;
  id v20;
  objc_super v22;

  v10 = sub_1B7EF9C20();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78]();
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B7EF9C14();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___HDDatabaseAccessibilityAssertionStoreServer____lazy_storage___queue) = 0;
  v14 = a4;
  v15 = a5;
  swift_unknownObjectRetain();
  v16 = (void *)sub_1B7EF9C08();
  v17 = (objc_class *)type metadata accessor for DatabaseAccessibilityAssertionStoreServer();
  v22.receiver = self;
  v22.super_class = v17;
  v18 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v22, sel_initWithUUID_configuration_client_delegate_, v16, v14, v15, a6);

  v19 = v18;
  v20 = sub_1B7855CC8();

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v19;
}

- (id)exportedInterface
{
  sub_1B7EF9C98();
  return (id)sub_1B7EF9C8C();
}

- (id)remoteInterface
{
  sub_1B7EF9C98();
  return (id)sub_1B7EF9C80();
}

+ (id)taskIdentifier
{
  void *v2;

  sub_1B7EF9C98();
  sub_1B7EF9C74();
  v2 = (void *)sub_1B7EF9CB0();
  swift_bridgeObjectRelease();
  return v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HDDatabaseAccessibilityAssertionStoreServer____lazy_storage___queue));
}

- (void)remote_invalidateDatabaseAccessibilityAssertion:(id)a3
{
  id v5;
  HDDatabaseAccessibilityAssertionStoreServer *v6;

  v5 = a3;
  v6 = self;
  DatabaseAccessibilityAssertionStoreServer.remote_invalidateDatabaseAccessibilityAssertion(_:)(a3);

}

- (void)remote_requestDatabaseAccessibilityAssertionForOwnerIdentifier:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  HDDatabaseAccessibilityAssertionStoreServer *v10;

  v5 = _Block_copy(a4);
  v6 = sub_1B7EF9CBC();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  DatabaseAccessibilityAssertionStoreServer.remote_requestDatabaseAccessibilityAssertion(forOwnerIdentifier:completion:)(v6, v8, (uint64_t)sub_1B785682C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

@end
