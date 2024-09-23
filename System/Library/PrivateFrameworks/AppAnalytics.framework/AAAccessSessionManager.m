@implementation AAAccessSessionManager

- (BOOL)isActive
{
  AAAccessSessionManager *v2;
  char v3;

  v2 = self;
  v3 = BridgedAccessSessionManager.isActive.getter();

  return v3 & 1;
}

- (void)pushSessionData:(id)a3
{
  id v5;
  id v6;
  AAAccessSessionManager *v7;
  id v8;

  v5 = objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits());
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_init);
  BridgedAccessSessionManager.push(_:traits:)((uint64_t)v6);

}

- (void)pushSessionData:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  AAAccessSessionManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  BridgedAccessSessionManager.push(_:traits:)((uint64_t)v6);

}

- (void)pushSessionData:(id)a3 submitEventQueues:(BOOL)a4
{
  id v6;
  id v7;
  AAAccessSessionManager *v8;
  id v9;

  v6 = objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits());
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, sel_init);
  BridgedAccessSessionManager.push(_:traits:)((uint64_t)v7);

}

- (void)pushSessionData:(id)a3 traits:(id)a4 submitEventQueues:(BOOL)a5
{
  id v7;
  id v8;
  AAAccessSessionManager *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  BridgedAccessSessionManager.push(_:traits:)((uint64_t)v7);

}

- (AAAccessSessionManager)init
{
  AAAccessSessionManager *result;

  result = (AAAccessSessionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
