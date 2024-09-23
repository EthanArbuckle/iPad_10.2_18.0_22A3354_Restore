@implementation CycleStatisticsCell

- (_TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell *)sub_231B9F640(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell____lazy_storage___valueLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell____lazy_storage___captionLabel) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell *v2;

  v2 = self;
  sub_231B9FA6C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_231B9FFC4(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleStatisticsCell();
  return -[CycleStatisticsCell isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CycleStatisticsCell();
  v4 = v5.receiver;
  -[CycleStatisticsCell setHighlighted:](&v5, sel_setHighlighted_, v3);
  sub_231BA048C();

}

- (void).cxx_destruct
{
  sub_2319B8DCC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell____lazy_storage___valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell____lazy_storage___captionLabel));
}

@end
