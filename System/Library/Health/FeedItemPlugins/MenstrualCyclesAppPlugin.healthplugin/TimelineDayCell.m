@implementation TimelineDayCell

- (_TtC24MenstrualCyclesAppPlugin15TimelineDayCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin15TimelineDayCell *)sub_231A6CC3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin15TimelineDayCell)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin15TimelineDayCell *)sub_231A6CEF4(a3);
}

- (void)adaptToContentSizeChanges
{
  _TtC24MenstrualCyclesAppPlugin15TimelineDayCell *v2;

  v2 = self;
  sub_231A6F34C();

}

- (void)adaptToColorSchemeChanges
{
  _TtC24MenstrualCyclesAppPlugin15TimelineDayCell *v2;

  v2 = self;
  sub_231A6F4E4();

}

- (void)adaptToHorizontalSizeChanges
{
  _TtC24MenstrualCyclesAppPlugin15TimelineDayCell *v2;

  v2 = self;
  sub_231A6F050();

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin15TimelineDayCell *v5;

  v4 = a3;
  v5 = self;
  sub_231A6F660(v4);

}

- (void)layoutSubviews
{
  _BYTE *v2;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TimelineDayCell(0);
  v2 = v4.receiver;
  -[TimelineDayCell layoutSubviews](&v4, sel_layoutSubviews);
  v3 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_didUpdateFromCycleDay;
  if (v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_didUpdateFromCycleDay] == 1)
  {
    sub_231A6F818();
    v2[v3] = 0;
  }

}

- (HKMCDayViewModel)axCycleDayViewModel
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_cycleDay;
  swift_beginAccess();
  return (HKMCDayViewModel *)objc_retainAutoreleaseReturnValue(*(id *)&v2[*(int *)(type metadata accessor for CycleDay()
                                                                                 + 20)]);
}

- (NSDate)axCycleDay
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_231C9D150();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_startDate;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_231C9D0CC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v8;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___dayOfWeekLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___formatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___logIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___pill));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___bleedingIndicator));
  sub_231A717FC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_gregorianCalendar);
  swift_bridgeObjectRelease();
  sub_231A65778((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_cycleDay);
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_startDate;
  v4 = sub_231C9D150();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___fertilityProjectionReversed));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___menstruationProjectionHighReversed));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___menstruationProjectionLowReversed));
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _TtC24MenstrualCyclesAppPlugin15TimelineDayCell *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_231A708D8(v6, v4);

}

@end
