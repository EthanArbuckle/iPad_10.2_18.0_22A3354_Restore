@implementation FBAFilterManager

- (NSArray)filterGroups
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_filterGroups);
  type metadata accessor for FBAFilterGroup();
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setFilterGroups:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  v5 = type metadata accessor for FBAFilterGroup();
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_filterGroups);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_filterGroups) = v6;
  swift_bridgeObjectRelease(v7);
}

- (_TtP18Feedback_Assistant24FBAFilterManagerDelegate_)filterDelegate
{
  return (_TtP18Feedback_Assistant24FBAFilterManagerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_filterDelegate, a2);
}

- (void)setFilterDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_filterDelegate, a3);
}

- (BOOL)active
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_active);
}

- (void)setActive:(BOOL)a3
{
  _TtC18Feedback_Assistant16FBAFilterManager *v4;

  v4 = self;
  sub_100077660(a3, (uint64_t)v4);

}

- (NSArray)filters
{
  return (NSArray *)sub_100077854(self, (uint64_t)a2, (uint64_t (*)(void))sub_10007770C);
}

- (NSArray)activeFilters
{
  return (NSArray *)sub_100077854(self, (uint64_t)a2, (uint64_t (*)(void))sub_1000778A8);
}

- (NSPredicate)predicate
{
  _TtC18Feedback_Assistant16FBAFilterManager *v2;
  id v3;

  v2 = self;
  v3 = sub_100077AF4();

  return (NSPredicate *)v3;
}

+ (id)keyPathsForValuesAffectingUserDescription
{
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  Class isa;
  uint64_t v7;

  v2 = sub_10004BB9C(&qword_100116890);
  inited = swift_initStackObject(v2, &v7);
  *(_OWORD *)(inited + 16) = xmmword_1000CC730;
  strcpy((char *)(inited + 32), "activeFilters");
  *(_WORD *)(inited + 46) = -4864;
  v4 = sub_100083338(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 1, &type metadata for String);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (NSString)userDescription
{
  _TtC18Feedback_Assistant16FBAFilterManager *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100078180();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC18Feedback_Assistant16FBAFilterManager)initWithFilterGroups:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for FBAFilterGroup();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  return (_TtC18Feedback_Assistant16FBAFilterManager *)sub_1000786FC(v5);
}

- (id)filterForIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC18Feedback_Assistant16FBAFilterManager *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100078888((unint64_t)v8);
  v11 = v10;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
}

- (void)toggleFilterAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC18Feedback_Assistant16FBAFilterManager *v9;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100078A34((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)toggleFilterAtIndex:(int64_t)a3
{
  _TtC18Feedback_Assistant16FBAFilterManager *v4;

  v4 = self;
  sub_100078CB0(a3);

}

- (BOOL)toggleActive
{
  _TtC18Feedback_Assistant16FBAFilterManager *v2;
  char v3;

  v2 = self;
  v3 = sub_100078F10();

  return v3 & 1;
}

- (void)activate
{
  uint64_t v2;
  _TtC18Feedback_Assistant16FBAFilterManager *v3;

  v3 = self;
  sub_100079030((uint64_t)v3, v2);

}

- (void)deactivate
{
  uint64_t v2;
  _TtC18Feedback_Assistant16FBAFilterManager *v3;

  v3 = self;
  sub_1000790F0((uint64_t)v3, v2);

}

- (_TtC18Feedback_Assistant16FBAFilterManager)init
{
  _TtC18Feedback_Assistant16FBAFilterManager *result;

  result = (_TtC18Feedback_Assistant16FBAFilterManager *)_swift_stdlib_reportUnimplementedInitializer("Feedback_Assistant.FBAFilterManager", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_filterGroups));
  sub_1000535EC((uint64_t)self + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_filterDelegate);
}

@end
