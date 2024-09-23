@implementation MFNanoServerFullMessageLoader2

- (void).cxx_destruct
{
  swift_getObjectType();
  swift_release();
}

- (MFNanoServerFullMessageLoader2)initWithCallbackQueue:(id)a3 mailMessageLibrary:(id)a4 legacyLoader:(id)a5
{
  id v5;
  id v6;

  swift_getObjectType();
  v5 = a3;
  v6 = a4;
  swift_unknownObjectRetain();
  return (MFNanoServerFullMessageLoader2 *)sub_1A5349A08(a3, a4, (uint64_t)a5);
}

- (void)loadFullMessagesForMessageIds:(id)a3 completion:(id)a4
{
  id v5;
  MFNanoServerFullMessageLoader2 *v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  swift_getObjectType();
  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  v10 = sub_1A594B958();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  sub_1A5349BE0(v10, (uint64_t)sub_1A534D598, v9);
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)attemptToCancelFullMessageLoadForMessageIds:(id)a3
{
  id v4;
  MFNanoServerFullMessageLoader2 *v5;
  uint64_t v6;

  swift_getObjectType();
  v4 = a3;
  v5 = self;
  v6 = sub_1A594B958();
  sub_1A534B8C8(v6);
  swift_bridgeObjectRelease();

}

- (void)cancelAllPendingOperations
{
  MFNanoServerFullMessageLoader2 *v3;

  swift_getObjectType();
  v3 = self;
  sub_1A534C470();

}

- (void)start
{
  MFNanoServerFullMessageLoader2 *v3;

  swift_getObjectType();
  v3 = self;
  sub_1A534CFE4();

}

- (MFNanoServerFullMessageLoader2)init
{
  swift_getObjectType();
  return (MFNanoServerFullMessageLoader2 *)MFNanoServerFullMessageLoader2.init()();
}

@end
