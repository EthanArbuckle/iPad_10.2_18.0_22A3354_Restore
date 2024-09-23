@implementation AlarmComplicationCurvedTextView

- (_TtC11ClockPoster31AlarmComplicationCurvedTextView)initWithFrame:(CGRect)a3
{
  return (_TtC11ClockPoster31AlarmComplicationCurvedTextView *)sub_237E2D300(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ClockPoster31AlarmComplicationCurvedTextView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _TtC11ClockPoster31AlarmComplicationCurvedTextView *result;

  v5 = (char *)self + OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_pathProvider;
  *(_QWORD *)v5 = 0x4036000000000000;
  v5[8] = 0;
  v6 = OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_timeFormatter;
  v7 = objc_allocWithZone(MEMORY[0x24BDB87B0]);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);
  v9 = OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_alarmIconLayer;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)sub_237E2D9FC();
  v10 = OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_alarmTextLayer;
  *(Class *)((char *)&self->super.super.super.isa + v10) = (Class)sub_237E2DD10();

  result = (_TtC11ClockPoster31AlarmComplicationCurvedTextView *)sub_237EE309C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC11ClockPoster31AlarmComplicationCurvedTextView *v2;

  v2 = self;
  sub_237E2D504();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_timeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_alarmIconLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_alarmTextLayer));
}

@end
