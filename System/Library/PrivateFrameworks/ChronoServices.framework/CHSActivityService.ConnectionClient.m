@implementation CHSActivityService.ConnectionClient

- (void)activityDidUpdate:(id)a3 payloadID:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  _TtCE14ChronoServicesCSo18CHSActivityService16ConnectionClient *v11;

  v4 = sub_18FBCD0DC();
  v6 = v5;
  v7 = sub_18FBCD0DC();
  v9 = v8;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtCE14ChronoServicesCSo18CHSActivityService16ConnectionClient_activityPayloadUpdateHandler);
  v11 = self;
  if (v10)
  {
    sub_18FB87340((uint64_t)v10);
    v10(v4, v6, v7, v9);
    sub_18FB7C270((uint64_t)v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (_TtCE14ChronoServicesCSo18CHSActivityService16ConnectionClient)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCE14ChronoServicesCSo18CHSActivityService16ConnectionClient_activityPayloadUpdateHandler);
  v4 = (objc_class *)_s16ConnectionClientCMa();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[CHSActivityService.ConnectionClient init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_18FB7C270(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCE14ChronoServicesCSo18CHSActivityService16ConnectionClient_activityPayloadUpdateHandler));
}

@end
