@implementation HDMCExperienceModelManager

- (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager)initWithNotificationProvider:(id)a3
{
  return (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager *)HDMCExperienceModelManager.init(notificationProvider:)(a3);
}

- (void)dealloc
{
  void *v2;
  _TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_notificationProvider);
  v3 = self;
  objc_msgSend(v2, sel_removeObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for HDMCExperienceModelManager();
  -[HDMCExperienceModelManager dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_observers));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_notificationProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_queue));
}

- (void)didReceiveExperienceModelUpdateNotification
{
  _TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager *v2;

  v2 = self;
  sub_21967B3A8();

}

- (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager)init
{
  _TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager *result;

  result = (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)registerWithObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_observers), sel_registerObserver_queue_, a3, *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_queue));
}

- (void)removeWithObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_observers), sel_unregisterObserver_, a3);
}

@end
