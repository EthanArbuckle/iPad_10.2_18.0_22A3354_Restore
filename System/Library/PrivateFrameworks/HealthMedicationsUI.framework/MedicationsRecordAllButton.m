@implementation MedicationsRecordAllButton

- (_TtC19HealthMedicationsUI26MedicationsRecordAllButton)init
{
  return (_TtC19HealthMedicationsUI26MedicationsRecordAllButton *)sub_1BC1FF304();
}

- (_TtC19HealthMedicationsUI26MedicationsRecordAllButton)initWithCoder:(id)a3
{
  id v5;
  _TtC19HealthMedicationsUI26MedicationsRecordAllButton *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationsRecordAllButton_logDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationsRecordAllButton_recordAllViewModel) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI26MedicationsRecordAllButton *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void)didTapRecord:(id)a3
{
  _TtC19HealthMedicationsUI26MedicationsRecordAllButton *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BC2B5024();
  swift_unknownObjectRelease();
  sub_1BC1FFA60();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (_TtC19HealthMedicationsUI26MedicationsRecordAllButton)initWithFrame:(CGRect)a3
{
  _TtC19HealthMedicationsUI26MedicationsRecordAllButton *result;

  result = (_TtC19HealthMedicationsUI26MedicationsRecordAllButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC0F0430((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationsRecordAllButton_logDelegate);
  swift_release();
}

@end
