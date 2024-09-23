@implementation HealthAppHealthDaemonOrchestrationClient

- (void)requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion:(id)a3
{
  void *v4;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_23DB8C214();

  swift_release();
}

- (void)requestBackgroundGenerationForAllModelsAfterUnlockWithCompletion:(id)a3
{
  void *v4;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_23DB8C208();

  swift_release();
}

- (void)runOrRequestBackgroundGenerationWithCompletion:(id)a3
{
  void *v4;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_23DB8C1FC();

  swift_release();
}

- (void)runBackgroundGenerationWithPlugins:(id)a3 commitAsUrgent:(BOOL)a4 generationType:(unint64_t)a5 completion:(id)a6
{
  void *v8;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v9;

  v8 = _Block_copy(a6);
  if (a3)
    sub_23DB8C370();
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v9 = self;
  sub_23DB8C1F0();

  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient)init
{
  uint64_t v3;
  id v4;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient_connection;
  v4 = objc_allocWithZone((Class)sub_23DB8C220());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for HealthAppHealthDaemonOrchestrationClient();
  return -[HealthAppHealthDaemonOrchestrationClient init](&v7, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient_connection));
}

@end
