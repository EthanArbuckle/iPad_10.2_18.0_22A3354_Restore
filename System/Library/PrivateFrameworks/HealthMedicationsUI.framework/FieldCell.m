@implementation FieldCell

- (_TtC19HealthMedicationsUI9FieldCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI9FieldCell *)sub_1BC2ADBEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI9FieldCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC2B1094();
}

- (void)didTapCell
{
  _TtC19HealthMedicationsUI9FieldCell *v2;

  v2 = self;
  sub_1BC2AE8D4();

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  _TtC19HealthMedicationsUI9FieldCell *v10;

  length = a4.length;
  location = a4.location;
  sub_1BC2B4460();
  v9 = a3;
  v10 = self;
  LOBYTE(length) = sub_1BC2AECC8(v9, location, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)didTapDoneWithSender:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI9FieldCell *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1BC2AD784();
  objc_msgSend(v6, sel_resignFirstResponder);

}

- (void)textFieldDidChangeWithSender:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI9FieldCell *v5;

  v4 = a3;
  v5 = self;
  sub_1BC2AFBC0(v4);

}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___textField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___numberFormatter));
  swift_bridgeObjectRelease();
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
}

@end
