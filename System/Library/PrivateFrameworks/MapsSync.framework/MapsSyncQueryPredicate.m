@implementation MapsSyncQueryPredicate

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MapsSyncQueryPredicate();
  return -[MapsSyncQueryPredicate initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithAnd:(id)a3
{
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)sub_1A41D6B90(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithOr:(id)a3
{
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)sub_1A41D6B90(self, (uint64_t)a2, (uint64_t)a3, 2);
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithNot:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  _TtC8MapsSync22MapsSyncQueryPredicate *v8;
  objc_super v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1A4243670;
  *(_QWORD *)(v5 + 32) = a3;
  v11 = v5;
  sub_1A423C1DC();
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
  v6 = a3;
  v7 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MapsSyncQueryPredicate();
  v8 = -[MapsSyncQueryPredicate initWithType:subpredicates:](&v10, sel_initWithType_subpredicates_, 0, v7);

  return v8;
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithType:(unint64_t)a3 subpredicates:(id)a4
{
  void *v6;
  _TtC8MapsSync22MapsSyncQueryPredicate *v7;
  objc_super v9;

  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
  sub_1A423C1C4();
  v6 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MapsSyncQueryPredicate();
  v7 = -[MapsSyncQueryPredicate initWithType:subpredicates:](&v9, sel_initWithType_subpredicates_, a3, v6);

  return v7;
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithCenterLatitude:(double)a3 centerLongitude:(double)a4 squareSideLengthMeters:(double)a5
{
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)MapsSyncQueryPredicate.init(centerLatitude:centerLongitude:squareSideLengthMeters:)(a3, a4, a5);
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithFormat:(id)a3 args:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = sub_1A423C14C();
  v7 = v6;
  if (a4)
    v8 = sub_1A423C1C4();
  else
    v8 = 0;
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)sub_1A41D70F4(v5, v7, v8);
}

+ (_TtC8MapsSync22MapsSyncQueryPredicate)queryPredicateWithFormat:(id)a3 argumentArray:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = sub_1A423C14C();
  v7 = v6;
  if (a4)
    a4 = (id)sub_1A423C1C4();
  v8 = objc_allocWithZone((Class)type metadata accessor for MapsSyncQueryPredicate());
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)sub_1A41D70F4(v5, v7, (uint64_t)a4);
}

- (id)not
{
  objc_class *Predicate;
  id v4;
  uint64_t v5;
  _TtC8MapsSync22MapsSyncQueryPredicate *v6;
  void *v7;
  _TtC8MapsSync22MapsSyncQueryPredicate *v8;
  objc_super v10;
  uint64_t v11;

  Predicate = (objc_class *)type metadata accessor for MapsSyncQueryPredicate();
  v4 = objc_allocWithZone(Predicate);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1A4243670;
  *(_QWORD *)(v5 + 32) = self;
  v11 = v5;
  sub_1A423C1DC();
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
  v6 = self;
  v7 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  v10.receiver = v4;
  v10.super_class = Predicate;
  v8 = -[MapsSyncQueryPredicate initWithType:subpredicates:](&v10, sel_initWithType_subpredicates_, 0, v7);

  return v8;
}

- (Class)classForCoder
{
  sub_1A40D19C0(0, &qword_1ED1AB618);
  return (Class)swift_getObjCClassFromMetadata();
}

+ (Class)classForKeyedUnarchiver
{
  sub_1A40D19C0(0, &qword_1ED1AB618);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithMapItem:(id)a3 customName:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a4)
  {
    v4 = sub_1A423C14C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (void *)swift_unknownObjectRetain();
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)MapsSyncQueryPredicate.init(mapItem:customName:)(v7, v4, v6);
}

+ (id)mapsFavoritesPredicateWithHidden:(BOOL)a3
{
  return _s8MapsSync0aB14QueryPredicateC013mapsFavoritesD06hiddenACSb_tFZ_0(a3);
}

@end
