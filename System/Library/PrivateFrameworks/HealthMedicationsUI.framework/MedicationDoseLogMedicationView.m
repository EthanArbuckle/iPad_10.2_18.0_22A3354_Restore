@implementation MedicationDoseLogMedicationView

- (void)layoutSubviews
{
  _TtC19HealthMedicationsUI31MedicationDoseLogMedicationView *v2;

  v2 = self;
  sub_1BC12D1A0();

}

- (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationView)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationView *)sub_1BC12D384(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC1307F0();
}

- (void)didTapSkip:(id)a3
{
  sub_1BC12D75C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1BC12D5AC);
}

- (void)didTapRecord:(id)a3
{
  sub_1BC12D75C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1BC12D684);
}

- (void)didTapUnitTime:(id)a3
{
  _TtC19HealthMedicationsUI31MedicationDoseLogMedicationView *v4;
  uint64_t v5;
  uint64_t v6;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BC2B5024();
  swift_unknownObjectRelease();
  if (MEMORY[0x1BCCEF478]((char *)v4 + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView_logDelegate))
  {
    v5 = swift_retain();
    sub_1BC210644(v5);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {

  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v6);
}

- (void).cxx_destruct
{
  swift_release();
  sub_1BC0F0430((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView_logDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___timeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___medicationNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___formStrengthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___medmojiImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___notesLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___skippedButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___takenButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___doseAmountTimeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___medicationStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___lowerSectionStackViewWithNotes));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___lowerSectionStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___skippedTakenStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___dividerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView_lastDoseLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView_lastDoseLabelContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView_contentView));
}

@end
