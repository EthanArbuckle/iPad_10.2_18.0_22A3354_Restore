@implementation HMDAccessoryInfoFetchController

- (NSUUID)messageTargetUUID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1CDAB822C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___HMDAccessoryInfoFetchController_messageTargetUUID;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_1CDAB81FC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (void)setMessageTargetUUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  HMDAccessoryInfoFetchController *v10;
  uint64_t v11;

  v4 = sub_1CDAB822C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CDAB8214();
  v8 = (char *)self + OBJC_IVAR___HMDAccessoryInfoFetchController_messageTargetUUID;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();

}

- (OS_dispatch_queue)messageReceiveQueue
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HMDAccessoryInfoFetchController_messageReceiveQueue);
  swift_beginAccess();
  return (OS_dispatch_queue *)*v2;
}

- (void)setMessageReceiveQueue:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___HMDAccessoryInfoFetchController_messageReceiveQueue);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (HMDAccessoryInfoFetchController)initWithHomeUUID:(id)a3 workQueue:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  objc_class *Controller;
  id v11;
  HMDAccessoryInfoFetchController *v12;
  objc_super v14;

  v6 = sub_1CDAB822C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CDAB8214();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HMDAccessoryInfoFetchController_messageDispatcher) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HMDAccessoryInfoFetchController_remoteEventRouterClientController) = 0;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR___HMDAccessoryInfoFetchController_messageTargetUUID, v9, v6);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HMDAccessoryInfoFetchController_messageReceiveQueue) = (Class)a4;
  Controller = (objc_class *)type metadata accessor for AccessoryInfoFetchController();
  v14.receiver = self;
  v14.super_class = Controller;
  v11 = a4;
  v12 = -[HMDAccessoryInfoFetchController init](&v14, sel_init);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)configureWithMessageDispatcher:(id)a3 remoteEventRouterClientController:(id)a4
{
  HMFMessageDispatcher *v6;
  HMDHomeRemoteEventRouterClientController *v7;
  HMDAccessoryInfoFetchController *v8;

  v6 = (HMFMessageDispatcher *)a3;
  v7 = (HMDHomeRemoteEventRouterClientController *)a4;
  v8 = self;
  AccessoryInfoFetchController.configure(with:remoteEventRouterClientController:)(v6, v7);

}

- (void)handleFetchWithMessage:(id)a3
{
  objc_msgSend(a3, sel_respondWithSuccess);
}

- (HMDAccessoryInfoFetchController)init
{
  HMDAccessoryInfoFetchController *result;

  result = (HMDAccessoryInfoFetchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___HMDAccessoryInfoFetchController_messageTargetUUID;
  v4 = sub_1CDAB822C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___HMDAccessoryInfoFetchController_remoteEventRouterClientController));

}

@end
