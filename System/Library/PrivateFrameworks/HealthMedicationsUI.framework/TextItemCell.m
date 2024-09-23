@implementation TextItemCell

- (_TtC19HealthMedicationsUI12TextItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI12TextItemCell *)sub_1BC1BECB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI12TextItemCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI12TextItemCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI12TextItemCell____lazy_storage___textView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI12TextItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI12TextItemCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void)didTapDoneWithSender:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI12TextItemCell *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1BC1BE93C();
  objc_msgSend(v6, sel_resignFirstResponder);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC19HealthMedicationsUI12TextItemCell *v13;

  length = a4.length;
  location = a4.location;
  v9 = sub_1BC2B4460();
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1BC1BF8E4(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI12TextItemCell *v5;

  v4 = a3;
  v5 = self;
  sub_1BC1BFED0(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI12TextItemCell____lazy_storage___textView));
  sub_1BC0E7B24((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI12TextItemCell_item, (unint64_t *)&qword_1EDA0F7D0, (unint64_t *)&qword_1EDA0F7C0);
}

@end
