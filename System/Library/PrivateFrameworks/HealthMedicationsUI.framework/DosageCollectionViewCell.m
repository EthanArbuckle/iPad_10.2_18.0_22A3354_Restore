@implementation DosageCollectionViewCell

- (_TtC19HealthMedicationsUI24DosageCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI24DosageCollectionViewCell *)sub_1BC2469D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI24DosageCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s19HealthMedicationsUI24DosageCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)timePickerChanged:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI24DosageCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1BC249CFC();

}

- (void)textFieldChanged:(id)a3
{
  _TtC19HealthMedicationsUI24DosageCollectionViewCell *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1BC247FFC(v5);

}

- (void)valueLabelTapped:(id)a3
{
  _TtC19HealthMedicationsUI24DosageCollectionViewCell *v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = self;
  v5 = sub_1BC246390();
  objc_msgSend(v5, sel_becomeFirstResponder);

}

- (void)doneTapped
{
  id v2;
  _TtC19HealthMedicationsUI24DosageCollectionViewCell *v3;

  v3 = self;
  v2 = sub_1BC246390();
  objc_msgSend(v2, sel_resignFirstResponder);

}

- (void).cxx_destruct
{
  uint64_t (*v3)(uint64_t);

  sub_1BC0F2444((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell_currentDosage, &qword_1EF3FD980, (uint64_t (*)(uint64_t))type metadata accessor for Dosage);
  swift_bridgeObjectRelease();
  sub_1BC0E8594((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell_item, (uint64_t (*)(_QWORD))sub_1BC0E84E8);
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DC1D38];
  sub_1BC0F2444((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell____lazy_storage___deleteAccessory, &qword_1EDA0FAE8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DC1D38]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell_timePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell____lazy_storage___toolbar));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell____lazy_storage___valueField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell____lazy_storage___valueLabel));
  sub_1BC0F2444((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell____lazy_storage___spacerAccessory, &qword_1EDA0FAE8, v3);
  swift_bridgeObjectRelease();
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI24DosageCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = _s19HealthMedicationsUI24DosageCollectionViewCellC27textFieldShouldBeginEditingySbSo06UITextI0CF_0();

  return self & 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI24DosageCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  _s19HealthMedicationsUI24DosageCollectionViewCellC24textFieldDidBeginEditingyySo06UITextI0CF_0(v4);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  _TtC19HealthMedicationsUI24DosageCollectionViewCell *v10;

  length = a4.length;
  location = a4.location;
  sub_1BC2B4460();
  v9 = a3;
  v10 = self;
  LOBYTE(length) = _s19HealthMedicationsUI24DosageCollectionViewCellC9textField_24shouldChangeCharactersIn17replacementStringSbSo06UITextI0C_So8_NSRangeVSStF_0(v9, location, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI24DosageCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  _s19HealthMedicationsUI24DosageCollectionViewCellC22textFieldDidEndEditingyySo06UITextI0CF_0();

}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

@end
