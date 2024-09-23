@implementation TileItemCell

- (_TtC19HealthMedicationsUI12TileItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI12TileItemCell *)sub_1BC1732FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI12TileItemCell)initWithCoder:(id)a3
{
  char *v4;
  _QWORD *v5;
  id v6;
  _TtC19HealthMedicationsUI12TileItemCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI12TileItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC19HealthMedicationsUI12TileItemCell_didTapDismiss);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI12TileItemCell____lazy_storage___tileTipView) = 0;
  v6 = a3;

  result = (_TtC19HealthMedicationsUI12TileItemCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC0E8594((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI12TileItemCell_item, (uint64_t (*)(_QWORD))sub_1BC0E84E8);
  swift_release();
  sub_1BC0F2600(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC19HealthMedicationsUI12TileItemCell_didTapDismiss));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI12TileItemCell____lazy_storage___tileTipView));
}

@end
