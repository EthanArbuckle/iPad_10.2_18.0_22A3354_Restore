@implementation DIXPCManager

- (DIClientContext)clientContext
{
  return (DIClientContext *)XPCManager.clientContext.getter();
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)(id)sub_23A755E54();
}

- (void)setClientQueue:(id)a3
{
  id v5;
  DIXPCManager *v6;

  v5 = a3;
  v6 = self;
  sub_23A755EA8(a3);

}

- (DIXPCManagerDelegate)delegate
{
  return (DIXPCManagerDelegate *)(id)sub_23A755F28();
}

- (void)setDelegate:(id)a3
{
  DIXPCManager *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_23A755FC0();

}

- (DIXPCManager)initWithClientContext:(id)a3 dispatcher:(id)a4 clientQueue:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  return (DIXPCManager *)XPCManager.init(clientContext:dispatcher:clientQueue:)(v7, v8, a5);
}

- (void)dealloc
{
  DIXPCManager *v2;

  v2 = self;
  XPCManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy();
  sub_23A7584F4((uint64_t)self + OBJC_IVAR___DIXPCManager_delegate);
  swift_unknownObjectWeakDestroy();

  v3 = (char *)self + OBJC_IVAR___DIXPCManager_logger;
  v4 = sub_23A76937C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

}

- (void)addCheckInObserver:(id)a3
{
  DIXPCManager *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_23A7565F8((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (NSXPCConnection)connection
{
  DIXPCManager *v2;
  id v3;

  v2 = self;
  v3 = sub_23A756874();

  return (NSXPCConnection *)v3;
}

- (DIXPCManager)init
{
  XPCManager.init()();
}

@end
