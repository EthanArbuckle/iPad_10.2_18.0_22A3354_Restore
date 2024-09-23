@implementation TrainingLoadSummaryQueryServer

+ (Class)queryClass
{
  sub_23DCE164C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_queue_start
{
  _TtC19HealthBalanceDaemon30TrainingLoadSummaryQueryServer *v2;

  v2 = self;
  sub_23DCC3F8C();

}

- (void)_queue_stop
{
  _TtC19HealthBalanceDaemon30TrainingLoadSummaryQueryServer *v2;

  v2 = self;
  sub_23DCC554C();

}

- (BOOL)_shouldListenForUpdates
{
  _TtC19HealthBalanceDaemon30TrainingLoadSummaryQueryServer *v2;
  HKQueryServerConfiguration *v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = -[HDQueryServer configuration](v2, sel_configuration);
  v4 = -[HKQueryServerConfiguration shouldDeactivateAfterInitialResults](v3, sel_shouldDeactivateAfterInitialResults);

  return v4 ^ 1;
}

- (void)associationsUpdatedForObject:(id)a3 subObject:(id)a4 type:(unint64_t)a5 objects:(id)a6 anchor:(id)a7
{
  uint64_t v12;
  id v13;
  _TtC19HealthBalanceDaemon30TrainingLoadSummaryQueryServer *v14;

  sub_23DC802D0(0, (unint64_t *)&unk_256CF9EB0);
  v12 = sub_23DCE1DC0();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v13 = a7;
  v14 = self;
  sub_23DCC59D8((uint64_t)a3, a4, a5, v12, (uint64_t)v13);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC19HealthBalanceDaemon30TrainingLoadSummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  objc_class *ObjectType;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  void *v17;
  _TtC19HealthBalanceDaemon30TrainingLoadSummaryQueryServer *v18;
  objc_super v20;

  ObjectType = (objc_class *)swift_getObjectType();
  v11 = sub_23DCE122C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DCE1214();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC19HealthBalanceDaemon30TrainingLoadSummaryQueryServer____lazy_storage___loadBaselineUnit) = 0;
  v15 = a4;
  v16 = a5;
  swift_unknownObjectRetain();
  v17 = (void *)sub_23DCE11FC();
  v20.receiver = self;
  v20.super_class = ObjectType;
  v18 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v20, sel_initWithUUID_configuration_client_delegate_, v17, v15, v16, a6);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v18;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon30TrainingLoadSummaryQueryServer____lazy_storage___loadBaselineUnit));
}

@end
