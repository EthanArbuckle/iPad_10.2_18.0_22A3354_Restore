@implementation CalendarViewLayoutAttributes

- (id)copyWithZone:(void *)a3
{
  _TtC8HealthUI28CalendarViewLayoutAttributes *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self;
  sub_1D7B19C8C((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_0(v7, v7[3]);
  v5 = (void *)sub_1D7B4A92C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8HealthUI28CalendarViewLayoutAttributes *v4;
  _TtC8HealthUI28CalendarViewLayoutAttributes *v5;
  unsigned __int8 v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D7B4A770();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1D7B19E84((uint64_t)v8);

  sub_1D7AB1290((uint64_t)v8);
  return v6 & 1;
}

- (_TtC8HealthUI28CalendarViewLayoutAttributes)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8HealthUI28CalendarViewLayoutAttributes_horizontalSectionInset) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8HealthUI28CalendarViewLayoutAttributes_numberOfDaysPerWeek) = (Class)7;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8HealthUI28CalendarViewLayoutAttributes_weekdayRange) = xmmword_1D7B86350;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CalendarViewLayoutAttributes();
  return -[UICollectionViewLayoutAttributes init](&v3, sel_init);
}

@end
