@implementation IMServiceReachabilityController

+ (IMServiceReachabilityController)sharedController
{
  if (qword_1EE65C368 != -1)
    swift_once();
  return (IMServiceReachabilityController *)(id)qword_1EE65C358;
}

- (IMServiceReachabilityController)initWithDelegate:(id)a3
{
  uint64_t v5;
  IMServiceReachabilityController *v6;
  IMServiceReachabilityController *v7;
  objc_super v9;

  v5 = OBJC_IVAR___IMServiceReachabilityController_taskIDToTask;
  swift_unknownObjectRetain();
  v6 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)sub_1A217BFAC(MEMORY[0x1E0DEE9D8], &qword_1EE65C3A8);
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR___IMServiceReachabilityController_delegate) = (Class)a3;
  swift_unknownObjectRetain();

  v9.receiver = v6;
  v9.super_class = (Class)IMServiceReachabilityController;
  v7 = -[IMServiceReachabilityController init](&v9, sel_init);
  swift_unknownObjectRelease();
  return v7;
}

- (id)reachabilityContextForChat:(id)a3
{
  id v4;
  IMServiceReachabilityController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1A217E834(v4);

  return v6;
}

- (void)calculateServiceForSendingToChat:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  IMServiceReachabilityController *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1A217C2B8(v8, (uint64_t)sub_1A217FCD8, v7);

  swift_release();
}

- (void)calculateServiceForSendingToHandles:(id)a3 withContext:(id)a4 completionBlock:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  IMServiceReachabilityController *v10;

  v7 = _Block_copy(a5);
  v8 = sub_1A21997D0();
  _Block_copy(v7);
  v9 = a4;
  v10 = self;
  sub_1A217F760(v8, v9, (char *)v10, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (IMServiceReachabilityController)init
{
  IMServiceReachabilityController *result;

  result = (IMServiceReachabilityController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end
