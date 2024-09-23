@implementation InteractiveTimelineDayCell

- (_TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell)initWithFrame:(CGRect)a3
{
  return (_TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell *)sub_23185C438(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell)initWithCoder:(id)a3
{
  return (_TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell *)sub_23185C734(a3);
}

- (NSDate)startDate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_2318D294C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_startDate;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_2318D28F8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v8;
}

- (void)setStartDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  _TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell *v10;
  uint64_t v11;

  v4 = sub_2318D294C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2318D2928();
  v8 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_startDate;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell *v5;

  v4 = a3;
  v5 = self;
  sub_23185E848(v4);

}

- (NSDate)axTimelineDay
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_2318D294C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_startDate;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_2318D28F8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v8;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2317DD39C((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_gregorianCalendar, &qword_25418B2D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF2D8]);
  sub_2317CF774((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_timelineDay, (uint64_t (*)(_QWORD))type metadata accessor for TimelineDay);
  v3 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_startDate;
  v4 = sub_2318D294C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell____lazy_storage___dayOfWeekLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell____lazy_storage___formatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell____lazy_storage___logIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell____lazy_storage___pill));
  objc_release(*(id *)((char *)&self->super.super.super._traitChangeRegistry
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_configuration));
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_23185F1E8(v6, v4);

}

@end
