@implementation SpinnyResetView

- (void)layoutSubviews
{
  _TtC10ClockAngel15SpinnyResetView *v2;

  v2 = self;
  sub_10002DEFC();

}

- (_TtC10ClockAngel15SpinnyResetView)initWithCoder:(id)a3
{
  id v4;
  _TtC10ClockAngel15SpinnyResetView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ClockAngel15SpinnyResetView_pendingWorkItem) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10ClockAngel15SpinnyResetView_mode) = 0;
  v4 = a3;

  result = (_TtC10ClockAngel15SpinnyResetView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100087060, "ClockAngel/SpinnyResetView.swift", 32, 2, 161, 0);
  __break(1u);
  return result;
}

- (_TtC10ClockAngel15SpinnyResetView)initWithFrame:(CGRect)a3
{
  _TtC10ClockAngel15SpinnyResetView *result;

  result = (_TtC10ClockAngel15SpinnyResetView *)_swift_stdlib_reportUnimplementedInitializer("ClockAngel.SpinnyResetView", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel15SpinnyResetView_lapViewRotationContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel15SpinnyResetView_lapViewTransitionContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel15SpinnyResetView_lapViewOffsetContainer));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC10ClockAngel15SpinnyResetView_pendingWorkItem));
}

@end
