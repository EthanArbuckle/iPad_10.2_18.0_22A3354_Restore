@implementation MedicationLogDetailsUnitView

- (void)didChangeText:(id)a3
{
  _TtC19HealthMedicationsUI28MedicationLogDetailsUnitView *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BC2B5024();
  swift_unknownObjectRelease();
  sub_1BC171250();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitView)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitView *)sub_1BC17196C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC171D50();
}

- (void).cxx_destruct
{
  swift_release();
  sub_1BC0F0430((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitView_detailsDelegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitView____lazy_storage___valueAffixStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitView____lazy_storage___valueTextField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitView____lazy_storage___countingAffixLabel));
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI28MedicationLogDetailsUnitView *v5;

  v4 = a3;
  v5 = self;
  sub_1BC171E10(v4);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  _TtC19HealthMedicationsUI28MedicationLogDetailsUnitView *v10;

  length = a4.length;
  location = a4.location;
  sub_1BC2B4460();
  v9 = a3;
  v10 = self;
  LOBYTE(length) = _s19HealthMedicationsUI24DosageCollectionViewCellC9textField_24shouldChangeCharactersIn17replacementStringSbSo06UITextI0C_So8_NSRangeVSStF_0(v9, location, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

@end
