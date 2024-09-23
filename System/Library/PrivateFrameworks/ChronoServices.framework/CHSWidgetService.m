@implementation CHSWidgetService

+ (CHSWidgetService)sharedWidgetService
{
  if (qword_1EE1897E0 != -1)
    swift_once();
  return (CHSWidgetService *)(id)qword_1EE1897E8;
}

- (void)invalidateRelevancesOfKind:(id)a3 inBundle:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  CHSWidgetService *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];

  v6 = _Block_copy(a5);
  sub_18FBCD0DC();
  sub_18FBCD0DC();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetService_connection);
  v9 = self;
  v10 = (void *)sub_18FBCD0B8();
  v11 = (void *)sub_18FBCD0B8();
  v13[4] = sub_18FB8B5C4;
  v13[5] = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_18FBC4E30;
  v13[3] = &block_descriptor_11;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_invalidateRelevancesOfKind_inBundle_completion_, v10, v11, v12);
  _Block_release(v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

}

- (CHSWidgetService)init
{
  uint64_t v3;
  void *v4;
  CHSWidgetService *v5;
  objc_super v7;

  v3 = OBJC_IVAR___CHSWidgetService_connection;
  v4 = (void *)objc_opt_self();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_sharedInstance);

  v7.receiver = v5;
  v7.super_class = (Class)CHSWidgetService;
  return -[CHSWidgetService init](&v7, sel_init);
}

- (void).cxx_destruct
{

}

@end
