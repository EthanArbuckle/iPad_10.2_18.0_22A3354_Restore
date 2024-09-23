@implementation ScheduledDetailItemCell

- (_TtC19HealthMedicationsUI23ScheduledDetailItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI23ScheduledDetailItemCell *)sub_1BC255348(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC19HealthMedicationsUI23ScheduledDetailItemCell *v8;
  uint64_t v9;

  v4 = sub_1BC2B3B00();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC2B3AF4();
  v8 = self;
  sub_1BC255B10();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC19HealthMedicationsUI23ScheduledDetailItemCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  char *v7;
  _TtC19HealthMedicationsUI23ScheduledDetailItemCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell____lazy_storage___medicationView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell____lazy_storage___timeLabel) = 0;
  v5 = OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell_detailProvider;
  sub_1BC2B34D0();
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)sub_1BC2B34C4();
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell_item;
  *((_QWORD *)v7 + 4) = 0;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;

  result = (_TtC19HealthMedicationsUI23ScheduledDetailItemCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell____lazy_storage___medicationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell____lazy_storage___timeLabel));
  swift_release();
  sub_1BC0F2444((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell_item, (unint64_t *)&qword_1EDA0F7D0, (uint64_t (*)(uint64_t))sub_1BC0E1B94);
}

- (void)medicationDetailDidUpdate:(id)a3 for:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC19HealthMedicationsUI23ScheduledDetailItemCell *v10;

  v6 = sub_1BC2B4460();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_1BC2560CC(v9, v6, v8);

  swift_bridgeObjectRelease();
}

@end
