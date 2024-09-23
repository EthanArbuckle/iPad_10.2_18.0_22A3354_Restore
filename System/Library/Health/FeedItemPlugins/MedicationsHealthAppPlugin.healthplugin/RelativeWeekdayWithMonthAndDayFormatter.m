@implementation RelativeWeekdayWithMonthAndDayFormatter

- (_TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter)initWithCoder:(id)a3
{
  id v4;
  _TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter____lazy_storage___relativeDateFormatter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter____lazy_storage___nonRelativeDateFormatter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter____lazy_storage___dynamicRelativeDateFormatter) = 0;
  v4 = a3;

  result = (_TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter *)sub_2318D6150();
  __break(1u);
  return result;
}

- (id)stringFromDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter *v8;
  void *v9;
  uint64_t v11;

  v4 = sub_2318D294C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2318D2928();
  v8 = self;
  sub_2318894A0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v9 = (void *)sub_2318D558C();
  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter)init
{
  _TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter *result;

  result = (_TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter____lazy_storage___relativeDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter____lazy_storage___nonRelativeDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter____lazy_storage___dynamicRelativeDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter_weekdayMonthAndDayFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39RelativeWeekdayWithMonthAndDayFormatter_justMonthAndDayFormatter));
}

@end
