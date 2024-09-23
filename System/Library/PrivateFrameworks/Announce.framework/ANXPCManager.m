@implementation ANXPCManager

- (ANXPCManagerDelegate)delegate
{
  return (ANXPCManagerDelegate *)sub_2157185D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ANXPCManager_delegate);
}

- (void)setDelegate:(id)a3
{
  sub_215718674();
}

- (ANXPCManagerCheckInProvider)checkInProvider
{
  return (ANXPCManagerCheckInProvider *)sub_2157185D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ANXPCManager_checkInProvider);
}

- (void)setCheckInProvider:(id)a3
{
  sub_215718674();
}

- (ANXPCManager)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedInterface:(id)a5 exportedObject:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v8 = sub_21571B210();
  v10 = v9;
  v11 = a4;
  v12 = a5;
  swift_unknownObjectRetain();
  return (ANXPCManager *)XPCManager.init(machServiceName:remoteObjectInterface:exportedInterface:exportedObject:)(v8, v10, v11, v12);
}

- (void)dealloc
{
  void *v3;
  ANXPCManager *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ANXPCManager__connection);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_invalidate);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for XPCManager();
  -[ANXPCManager dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_21571A650((uint64_t)self + OBJC_IVAR___ANXPCManager_delegate);
  sub_21571A650((uint64_t)self + OBJC_IVAR___ANXPCManager_checkInProvider);

  v3 = (char *)self + OBJC_IVAR___ANXPCManager_logger;
  v4 = sub_21571B1F8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_21571A650((uint64_t)self + OBJC_IVAR___ANXPCManager_exportedObject);

}

- (void)addCheckInObserver:(id)a3
{
  ANXPCManager *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_215718F54();
  swift_unknownObjectRelease();

}

- (NSXPCConnection)connection
{
  ANXPCManager *v2;
  id v3;

  v2 = self;
  v3 = sub_2157190A0();

  return (NSXPCConnection *)v3;
}

- (ANXPCManager)init
{
  ANXPCManager *result;

  result = (ANXPCManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
