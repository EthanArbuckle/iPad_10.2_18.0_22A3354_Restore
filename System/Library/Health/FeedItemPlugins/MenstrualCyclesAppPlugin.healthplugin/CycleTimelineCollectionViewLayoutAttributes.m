@implementation CycleTimelineCollectionViewLayoutAttributes

- (id)copyWithZone:(void *)a3
{
  _TtC24MenstrualCyclesAppPlugin43CycleTimelineCollectionViewLayoutAttributes *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self;
  sub_231B51D08((uint64_t)a3, v7);

  sub_23190D608(v7, v7[3]);
  v5 = (void *)sub_231CA2BA4();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin43CycleTimelineCollectionViewLayoutAttributes *v4;
  _TtC24MenstrualCyclesAppPlugin43CycleTimelineCollectionViewLayoutAttributes *v5;
  unsigned __int8 v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_231CA27D8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_231B51E24((uint64_t)v8);

  sub_23191BE84((uint64_t)v8);
  return v6 & 1;
}

- (_TtC24MenstrualCyclesAppPlugin43CycleTimelineCollectionViewLayoutAttributes)init
{
  return (_TtC24MenstrualCyclesAppPlugin43CycleTimelineCollectionViewLayoutAttributes *)sub_231B520B4();
}

@end
