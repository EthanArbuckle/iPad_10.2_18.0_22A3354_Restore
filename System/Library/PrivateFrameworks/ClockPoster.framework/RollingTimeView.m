@implementation RollingTimeView

- (_TtC11ClockPoster15RollingTimeView)initWithFrame:(CGRect)a3
{
  return (_TtC11ClockPoster15RollingTimeView *)sub_237E6FAB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ClockPoster15RollingTimeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_237E73DCC();
}

- (void)layoutSubviews
{
  _TtC11ClockPoster15RollingTimeView *v2;

  v2 = self;
  sub_237E6FF18();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_timeZone;
  v4 = sub_237EE1EC0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_237E74BBC((uint64_t)self + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_compositingFilter));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_237E21F00((uint64_t)self + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_timeString, type metadata accessor for TimeString);
}

@end
