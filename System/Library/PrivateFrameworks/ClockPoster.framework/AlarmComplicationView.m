@implementation AlarmComplicationView

- (_TtC11ClockPoster21AlarmComplicationView)initWithCoder:(id)a3
{
  id v4;
  _TtC11ClockPoster21AlarmComplicationView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon) = 0;
  v4 = a3;

  result = (_TtC11ClockPoster21AlarmComplicationView *)sub_237EE309C();
  __break(1u);
  return result;
}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AlarmComplicationView();
  return -[AlarmComplicationView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  char *v4;
  id v5;
  void *v6;
  id v7;
  char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AlarmComplicationView();
  v4 = (char *)v9.receiver;
  v5 = a3;
  -[AlarmComplicationView setTintColor:](&v9, sel_setTintColor_, v5);
  v6 = *(void **)&v4[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon];
  if (v6)
  {
    v7 = v6;
    v8 = (char *)objc_msgSend(v4, sel_tintColor, v9.receiver, v9.super_class);
    objc_msgSend(v7, sel_setTintColor_, v8);

    v4 = v8;
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  _TtC11ClockPoster21AlarmComplicationView *v2;

  v2 = self;
  sub_237EE0274();

}

- (_TtC11ClockPoster21AlarmComplicationView)initWithFrame:(CGRect)a3
{
  _TtC11ClockPoster21AlarmComplicationView *result;

  result = (_TtC11ClockPoster21AlarmComplicationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_fireDate;
  v4 = sub_237EE1D70();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon));
}

@end
