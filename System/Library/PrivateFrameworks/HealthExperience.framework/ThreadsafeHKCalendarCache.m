@implementation ThreadsafeHKCalendarCache

- (id)calendarForTimeZone:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC16HealthExperience25ThreadsafeHKCalendarCache *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  objc_super v18;

  v4 = sub_1BC9331A4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC933174();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC93318C();
  v12 = self;
  sub_1BC9334A4();
  v13 = (void *)sub_1BC933180();
  v14 = (objc_class *)type metadata accessor for ThreadsafeHKCalendarCache();
  v18.receiver = v12;
  v18.super_class = v14;
  v15 = -[HKCalendarCache calendarForTimeZone:](&v18, sel_calendarForTimeZone_, v13);

  sub_1BC933114();
  sub_1BC9334B0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v16 = (void *)sub_1BC933108();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v16;
}

- (id)currentCalendar
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC16HealthExperience25ThreadsafeHKCalendarCache *v7;
  objc_class *v8;
  id v9;
  void *v10;
  objc_super v12;

  v3 = sub_1BC933174();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1BC9334A4();
  v8 = (objc_class *)type metadata accessor for ThreadsafeHKCalendarCache();
  v12.receiver = v7;
  v12.super_class = v8;
  v9 = -[HKCalendarCache currentCalendar](&v12, sel_currentCalendar);
  sub_1BC933114();

  sub_1BC9334B0();
  v10 = (void *)sub_1BC933108();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v10;
}

- (_TtC16HealthExperience25ThreadsafeHKCalendarCache)init
{
  uint64_t v3;
  _TtC16HealthExperience25ThreadsafeHKCalendarCache *v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC16HealthExperience25ThreadsafeHKCalendarCache_lock;
  sub_1BC9334C8();
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_1BC9334BC();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ThreadsafeHKCalendarCache();
  return -[HKCalendarCache init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
