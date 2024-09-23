@implementation HDMCPregnancyFeatureAdjustmentManager

- (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager)initWithPregnancyManager:(id)a3 profile:(id)a4 experienceModelProvider:(id)a5
{
  char *v8;
  id v9;
  id v10;
  char *v11;

  v8 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager());
  v9 = a3;
  v10 = a4;
  swift_unknownObjectRetain();
  v11 = sub_219657C70(v9, v10, a5, 0, 0, 0, v8);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager *)v11;
}

- (void)pregnancyModelDidUpdate:(id)a3
{
  id v4;
  _TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager *v5;

  v4 = a3;
  v5 = self;
  sub_219657258(2);

}

- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager *v15;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_21965BCC4((void (*)(void))sub_21965C210, (void (*)(void))v11);

  swift_release();
}

- (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager)init
{
  _TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager *result;

  result = (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation));
}

- (void)experienceModelManagerDidUpdateModel
{
  _TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager *v2;

  v2 = self;
  HDMCPregnancyFeatureAdjustmentManager.experienceModelManagerDidUpdateModel()();

}

@end
