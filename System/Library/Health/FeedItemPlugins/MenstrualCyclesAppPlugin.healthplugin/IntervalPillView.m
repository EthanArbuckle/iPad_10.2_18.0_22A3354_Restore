@implementation IntervalPillView

- (_TtC24MenstrualCyclesAppPlugin16IntervalPillView)initWithCoder:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin16IntervalPillView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView_maxDays) = (Class)60;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView____lazy_storage___dateComponentLabel) = 0;
  v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin16IntervalPillView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  double v3;
  double v4;
  id v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IntervalPillView(0);
  v2 = v6.receiver;
  -[IntervalPillView layoutSubviews](&v6, sel_layoutSubviews);
  objc_msgSend(v2, sel_frame, v6.receiver, v6.super_class);
  CGRectGetHeight(v7);
  if (qword_255F3D100 != -1)
    swift_once();
  HKUIFloorToScreenScale();
  v4 = v3;
  v5 = objc_msgSend(v2, sel_layer);
  objc_msgSend(v5, sel_setCornerRadius_, v4);

}

- (_TtC24MenstrualCyclesAppPlugin16IntervalPillView)initWithFrame:(CGRect)a3
{
  sub_2319C529C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView_startDate;
  v4 = sub_231C9D150();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView_endDate, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView____lazy_storage___dateComponentLabel));
}

@end
