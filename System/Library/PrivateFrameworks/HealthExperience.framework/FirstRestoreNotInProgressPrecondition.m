@implementation FirstRestoreNotInProgressPrecondition

- (void)dealloc
{
  _TtC16HealthExperience37FirstRestoreNotInProgressPrecondition *v2;
  objc_super v3;

  v2 = self;
  swift_retain();
  sub_1BC9331EC();
  swift_release();
  sub_1BC8DEFF0();
  swift_retain();
  sub_1BC9331F8();
  swift_release();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FirstRestoreNotInProgressPrecondition();
  -[FirstRestoreNotInProgressPrecondition dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience37FirstRestoreNotInProgressPrecondition_cloudSyncObserver));
  sub_1BC8BF81C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16HealthExperience37FirstRestoreNotInProgressPrecondition_preconditionCompletion));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience37FirstRestoreNotInProgressPrecondition_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience37FirstRestoreNotInProgressPrecondition_completionQueue));
  swift_release();
}

- (NSString)description
{
  _TtC16HealthExperience37FirstRestoreNotInProgressPrecondition *v2;
  void *v3;

  v2 = self;
  sub_1BC8DF2AC();

  v3 = (void *)sub_1BC933E88();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC16HealthExperience37FirstRestoreNotInProgressPrecondition)init
{
  _TtC16HealthExperience37FirstRestoreNotInProgressPrecondition *result;

  result = (_TtC16HealthExperience37FirstRestoreNotInProgressPrecondition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  _TtC16HealthExperience37FirstRestoreNotInProgressPrecondition *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1BC8DFB38(v7);

}

- (void)cloudSyncObserver:(id)a3 didFailToPopulateStatusWithError:(id)a4
{
  id v6;
  _TtC16HealthExperience37FirstRestoreNotInProgressPrecondition *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  _s16HealthExperience37FirstRestoreNotInProgressPreconditionC17cloudSyncObserver_32didFailToPopulateStatusWithErrorySo07HKCloudjK0C_s0R0_ptF_0();

}

@end
