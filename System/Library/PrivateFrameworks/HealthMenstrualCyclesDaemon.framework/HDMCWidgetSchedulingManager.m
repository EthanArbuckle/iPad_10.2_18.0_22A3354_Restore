@implementation HDMCWidgetSchedulingManager

- (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager)initWithProfile:(id)a3
{
  return (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager *)HDMCWidgetSchedulingManager.init(profile:)(a3);
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager *v4;
  void *v5;
  void *v6;
  id v7;
  _TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = (void *)sub_219676548();
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel__bridging_analysisProviding);

    if (v7)
    {
      v8 = v4;
      objc_msgSend(v7, sel_unregisterObserver_, v8);

      swift_unknownObjectRelease();
    }
  }
  v9.receiver = v4;
  v9.super_class = ObjectType;
  -[HDMCWidgetSchedulingManager dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_profile));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_widgetReloader);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_previousAnalysis));
  sub_21966509C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_didBecomeReady));
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  _TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager *v5;

  v4 = a3;
  v5 = self;
  HDMCWidgetSchedulingManager.profileDidBecomeReady(_:)(v4);

}

- (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager)init
{
  _TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager *result;

  result = (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didUpdateAnalysis:(id)a3
{
  id v4;
  _TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager *v5;

  v4 = a3;
  v5 = self;
  HDMCWidgetSchedulingManager.didUpdate(_:)(v4);

}

@end
