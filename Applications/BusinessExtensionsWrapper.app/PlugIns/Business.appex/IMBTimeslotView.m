@implementation IMBTimeslotView

- (UILabel)timeLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC8Business15IMBTimeslotView_timeLabel));
}

- (_TtC8Business15IMBTimeslotView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8Business15IMBTimeslotView *result;

  *(_QWORD *)&self->timeslot[OBJC_IVAR____TtC8Business15IMBTimeslotView_timeSelectionDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business15IMBTimeslotView_widthLayoutConstraint) = 0;
  v5 = OBJC_IVAR____TtC8Business15IMBTimeslotView_timeLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business15IMBTimeslotView_isSelected) = 0;

  result = (_TtC8Business15IMBTimeslotView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/IMBTimeslotView.swift", 30, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC8Business15IMBTimeslotView *v5;

  v4 = a3;
  v5 = self;
  sub_10007AFB4();

}

- (void)timeViewTappedWithGestureRecognizer:(id)a3
{
  id v4;
  _TtC8Business15IMBTimeslotView *v5;

  v4 = a3;
  v5 = self;
  sub_10007B078();

}

- (_TtC8Business15IMBTimeslotView)initWithFrame:(CGRect)a3
{
  _TtC8Business15IMBTimeslotView *result;

  result = (_TtC8Business15IMBTimeslotView *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBTimeslotView", 24, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business15IMBTimeslotView_timeslot));
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business15IMBTimeslotView_timeSelectionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business15IMBTimeslotView_widthLayoutConstraint));

}

@end
