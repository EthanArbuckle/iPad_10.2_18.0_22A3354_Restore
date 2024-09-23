@implementation CalendarMonthCell

- (NSDate)ax_month
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;

  sub_23190AB28(0, (unint64_t *)&qword_254196970, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v13 - v4;
  v6 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_viewModel;
  swift_beginAccess();
  v7 = type metadata accessor for CompactCalendarMonthViewModel(0);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  v9 = sub_231C9D150();
  v10 = *(_QWORD *)(v9 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v5, 1, 1, v9);
    return (NSDate *)0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v5, v6, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9) == 1)
    {
      return (NSDate *)0;
    }
    else
    {
      v12 = (void *)sub_231C9D0CC();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v9);
      return (NSDate *)v12;
    }
  }
}

- (NSArray)ax_spottingDays
{
  return (NSArray *)sub_231BC29D0();
}

- (void)setAx_spottingDays:(id)a3
{
  sub_231BC2A20((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_ax_spottingDays);
}

- (NSArray)ax_flowDays
{
  return (NSArray *)sub_231BC29D0();
}

- (void)setAx_flowDays:(id)a3
{
  sub_231BC2A20((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_ax_flowDays);
}

- (_TtC24MenstrualCyclesAppPlugin17CalendarMonthCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  uint64_t v10;
  objc_class *v11;
  _TtC24MenstrualCyclesAppPlugin17CalendarMonthCell *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_calendarView) = 0;
  v9 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_viewModel;
  v10 = type metadata accessor for CompactCalendarMonthViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (objc_class *)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_ax_spottingDays) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_ax_flowDays) = v11;
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[CalendarMonthCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  -[CalendarMonthCell setMaximumContentSizeCategory:](v12, sel_setMaximumContentSizeCategory_, *MEMORY[0x24BEBE078]);
  return v12;
}

- (_TtC24MenstrualCyclesAppPlugin17CalendarMonthCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  _TtC24MenstrualCyclesAppPlugin17CalendarMonthCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_calendarView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_viewModel;
  v6 = type metadata accessor for CompactCalendarMonthViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (objc_class *)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_ax_spottingDays) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_ax_flowDays) = v7;
  v8 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin17CalendarMonthCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_calendarView));
  sub_23194F720((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_viewModel, &qword_255F49CF0, type metadata accessor for CompactCalendarMonthViewModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
