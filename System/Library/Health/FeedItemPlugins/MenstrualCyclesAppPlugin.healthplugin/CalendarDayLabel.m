@implementation CalendarDayLabel

- (void)didMoveToWindow
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CalendarDayLabel();
  v2 = v9.receiver;
  -[CalendarDayLabel didMoveToWindow](&v9, sel_didMoveToWindow);
  v3 = objc_msgSend(v2, sel_window, v9.receiver, v9.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, sel_layer);
    v6 = objc_msgSend(v4, sel_screen);
    objc_msgSend(v6, sel_scale);
    v8 = v7;

    objc_msgSend(v5, sel_setRasterizationScale_, v8);
    v2 = v5;
  }

}

- (void)layoutSubviews
{
  _TtC24MenstrualCyclesAppPlugin16CalendarDayLabel *v2;

  v2 = self;
  sub_23191F490();

}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CalendarDayLabel_label));
}

- (_TtC24MenstrualCyclesAppPlugin16CalendarDayLabel)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  _TtC24MenstrualCyclesAppPlugin16CalendarDayLabel *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CalendarDayLabel_label;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CalendarDayLabel_lastSize);
  *v8 = 0;
  v8[1] = 0;

  result = (_TtC24MenstrualCyclesAppPlugin16CalendarDayLabel *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin16CalendarDayLabel)initWithFrame:(CGRect)a3
{
  _TtC24MenstrualCyclesAppPlugin16CalendarDayLabel *result;

  result = (_TtC24MenstrualCyclesAppPlugin16CalendarDayLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CalendarDayLabel_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CalendarDayLabel_circleMask));
}

@end
