@implementation HealthAppOrchestrationClient

- (_TtC17HealthAppServices28HealthAppOrchestrationClient)init
{
  return (_TtC17HealthAppServices28HealthAppOrchestrationClient *)HealthAppOrchestrationClient.init()();
}

- (void)dealloc
{
  void *v3;
  _TtC17HealthAppServices28HealthAppOrchestrationClient *v4;
  objc_super v5;

  swift_unknownObjectWeakAssign();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_connection);
  v4 = self;
  objc_msgSend(v3, sel_invalidate);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for HealthAppOrchestrationClient();
  -[HealthAppOrchestrationClient dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_connection));
  swift_release();
}

@end
