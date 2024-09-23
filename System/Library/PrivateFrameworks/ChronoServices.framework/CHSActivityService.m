@implementation CHSActivityService

- (CHSActivityService)init
{
  id v3;
  CHSActivityService *v4;

  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v4 = -[CHSActivityService initWithConnection:](self, sel_initWithConnection_, v3);

  return v4;
}

- (CHSActivityService)initWithConnection:(id)a3
{
  return (CHSActivityService *)sub_18FB859E0(a3);
}

- (void)dealloc
{
  void *v3;
  CHSActivityService *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSActivityService_queue_activityServiceAssertion);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_invalidate);
  v5.receiver = self;
  v5.super_class = (Class)CHSActivityService;
  -[CHSActivityService dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

- (void)invalidate
{
  CHSActivityService *v2;

  v2 = self;
  CHSActivityService.invalidate()();

}

- (id)subscribeToActivityID:(id)a3 withHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHSActivityService *v10;
  id v11;

  v5 = _Block_copy(a4);
  v6 = sub_18FBCD0DC();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  v11 = CHSActivityService.subscribe(toActivityID:withHandler:)(v6, v8, (uint64_t)sub_18FB87374, v9);

  swift_bridgeObjectRelease();
  swift_release();
  return v11;
}

@end
