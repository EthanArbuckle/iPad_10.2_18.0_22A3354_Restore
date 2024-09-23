@implementation AddMedicationCell

- (_TtC19HealthMedicationsUI17AddMedicationCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC19HealthMedicationsUI17AddMedicationCell *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationCell____lazy_storage___addMedicationView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for AddMedicationCell();
  v8 = -[AddMedicationCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1BC13DDF0();

  return v8;
}

- (_TtC19HealthMedicationsUI17AddMedicationCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI17AddMedicationCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationCell____lazy_storage___addMedicationView) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI17AddMedicationCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC19HealthMedicationsUI17AddMedicationCell *v8;
  uint64_t v9;

  v4 = sub_1BC2B3B00();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC2B3AF4();
  v8 = self;
  sub_1BC13E124();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)actionButtonTappedWithSender:(id)a3
{
  _TtC19HealthMedicationsUI17AddMedicationCell *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BC2B5024();
  swift_unknownObjectRelease();
  sub_1BC13E3F4();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void).cxx_destruct
{
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationCell_item, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationCell____lazy_storage___addMedicationView));
}

@end
