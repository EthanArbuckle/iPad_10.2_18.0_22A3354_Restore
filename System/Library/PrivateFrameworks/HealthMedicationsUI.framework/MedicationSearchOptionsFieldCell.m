@implementation MedicationSearchOptionsFieldCell

- (_TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell *)sub_1BC15EF3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC160478();
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  double Width;
  objc_super v5;
  CGRect v6;
  CGRect v7;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MedicationSearchOptionsFieldCell();
  v2 = v5.receiver;
  -[MedicationSearchOptionsFieldCell layoutSubviews](&v5, sel_layoutSubviews);
  v3 = sub_1BC15E4B0();
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  Width = CGRectGetWidth(v6);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setFrame_, 0.0, 0.0, Width, CGRectGetHeight(v7) + -10.0);

}

- (void)onSearch
{
  _TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell *v2;

  v2 = self;
  sub_1BC15F2D0();

}

- (void)onScan
{
  _TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell *v2;

  v2 = self;
  sub_1BC15F7C0();

}

- (void).cxx_destruct
{
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell_item, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell____lazy_storage___searchButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell____lazy_storage___scanButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell____lazy_storage___fixedSpace));
}

@end
