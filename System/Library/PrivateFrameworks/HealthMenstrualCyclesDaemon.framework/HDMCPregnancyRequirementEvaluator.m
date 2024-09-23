@implementation HDMCPregnancyRequirementEvaluator

- (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator)initWithPregnancyManager:(id)a3
{
  char *v4;
  _TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator *v5;

  v4 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyRequirementEvaluator());
  v5 = (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator *)sub_2196668D0(a3, v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (id)isRequirementSatisfied:(id)a3 error:(id *)a4
{
  _TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator *v6;
  void *v7;
  void *v8;

  swift_unknownObjectRetain();
  v6 = self;
  sub_219665BD0(a3);
  v8 = v7;

  swift_unknownObjectRelease();
  return v8;
}

- (void)registerObserver:(id)a3 forRequirement:(id)a4 queue:(id)a5
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers), sel_registerObserver_, a3, a4, a5);
}

- (void)unregisterObserver:(id)a3 forRequirement:(id)a4
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers), sel_unregisterObserver_, a3, a4);
}

- (void)pregnancyModelDidUpdate:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator *v9;
  id v10;
  _QWORD v11[6];

  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = self;
  *(_QWORD *)(v6 + 24) = a3;
  v11[4] = sub_219666DE0;
  v11[5] = v6;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_219666688;
  v11[3] = &block_descriptor_8;
  v7 = _Block_copy(v11);
  v8 = a3;
  v9 = self;
  v10 = v8;
  swift_release();
  objc_msgSend(v5, sel_notifyObservers_, v7);
  _Block_release(v7);

}

- (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator)init
{
  _TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator *result;

  result = (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers));
}

@end
