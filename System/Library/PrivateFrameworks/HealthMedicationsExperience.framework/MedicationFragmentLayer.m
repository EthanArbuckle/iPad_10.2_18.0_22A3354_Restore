@implementation MedicationFragmentLayer

- (_TtC27HealthMedicationsExperience23MedicationFragmentLayer)initWithLayer:(id)a3
{
  _QWORD v4[4];

  swift_unknownObjectRetain();
  sub_1BCB646A0();
  swift_unknownObjectRelease();
  return (_TtC27HealthMedicationsExperience23MedicationFragmentLayer *)MedicationFragmentLayer.init(layer:)(v4);
}

- (_TtC27HealthMedicationsExperience23MedicationFragmentLayer)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  _TtC27HealthMedicationsExperience23MedicationFragmentLayer *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_fragment);
  *v4 = 0u;
  v4[1] = 0u;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_color) = 0;
  v5 = a3;

  result = (_TtC27HealthMedicationsExperience23MedicationFragmentLayer *)sub_1BCB648B0();
  __break(1u);
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtC27HealthMedicationsExperience23MedicationFragmentLayer *v5;

  v4 = a3;
  v5 = self;
  sub_1BCB18E10(v4);

}

- (_TtC27HealthMedicationsExperience23MedicationFragmentLayer)init
{
  _TtC27HealthMedicationsExperience23MedicationFragmentLayer *result;

  result = (_TtC27HealthMedicationsExperience23MedicationFragmentLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BCB1925C(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_fragment), *(_QWORD *)((char *)&self->super._attr.refcount+ OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_fragment), *(uint64_t *)((char *)&self->super._attr.layer+ OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_fragment), *(uint64_t *)((char *)&self->super._attr._objc_observation_info+ OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_fragment));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_color));
}

@end
