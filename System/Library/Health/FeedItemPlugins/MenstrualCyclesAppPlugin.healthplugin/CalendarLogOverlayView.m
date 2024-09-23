@implementation CalendarLogOverlayView

- (_TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView *)sub_2319C249C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView *v5;

  v4 = a3;
  v5 = self;
  sub_2319C36A0(v4);

}

- (void)toggleFlow
{
  _TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView *v2;

  v2 = self;
  sub_2319C3834(&OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_flowToggle, &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_spottingToggle, (void (*)(_QWORD))sub_23191ABC0, (void (*)(_QWORD))sub_23191AEF4);

}

- (void)toggleSpotting
{
  _TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView *v2;

  v2 = self;
  sub_2319C3834(&OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_spottingToggle, &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_flowToggle, (void (*)(_QWORD))sub_23191AEF4, (void (*)(_QWORD))sub_23191ABC0);

}

- (_TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2319C5448();
}

- (void).cxx_destruct
{
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_flowToggle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_spottingToggle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_header));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_separator));
}

@end
