@implementation AAAppSessionManager

- (AAAppSessionManager)init
{
  return (AAAppSessionManager *)BridgedAppSessionManager.init()();
}

- (AAAppSessionManager)initWithTrackingConsent:(id)a3
{
  id v3;
  AAAppSessionManager *v4;

  v3 = a3;
  v4 = (AAAppSessionManager *)sub_1A5F5569C(v3);

  return v4;
}

- (id)createSessionManager
{
  AAAppSessionManager *v2;
  _QWORD *v3;
  id v4;
  id v5;
  unint64_t v7[9];

  v2 = self;
  sub_1A5F54B24((uint64_t)v7);
  v3 = AppSessionManager.createSessionManager(with:)(v7);
  sub_1A5F55844((uint64_t)v7);
  v4 = objc_allocWithZone((Class)type metadata accessor for BridgedSessionManager());
  v5 = sub_1A5F5A414((uint64_t)v3);

  return v5;
}

- (void)startAppSession
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  AAAppSessionManager *v6;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AAAppSessionManager_appSessionManager);
  v4 = *(_QWORD *)(v3 + 24);
  v5 = swift_allocObject();
  *(_BYTE *)(v5 + 16) = 1;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = self;
  swift_retain();
  sub_1A5EEC784(v4, (uint64_t)sub_1A5F505D8, v5);

  swift_release();
}

- (void)endAppSession:(id)a3
{
  void *v4;
  uint64_t v5;
  AAAppSessionManager *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  BridgedAppSessionManager.endAppSession(_:)((uint64_t)sub_1A5EBC084, v5);

  swift_release();
}

- (void)appSessionDidTerminate
{
  AAAppSessionManager *v2;

  v2 = self;
  BridgedAppSessionManager.appSessionDidTerminate()();

}

- (void).cxx_destruct
{
  swift_release();
}

@end
