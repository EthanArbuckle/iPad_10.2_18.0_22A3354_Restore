@implementation FBAFilterGroup

- (NSArray)filters
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_filters);
  type metadata accessor for FBAFilter();
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setFilters:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  v5 = type metadata accessor for FBAFilter();
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_filters);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_filters) = v6;
  swift_bridgeObjectRelease(v7);
}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->filterManager[OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_title];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->filterManager[OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_title]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_title);
  v7 = *(_QWORD *)&self->filterManager[OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_title];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (unint64_t)compoundType
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_compoundType);
}

- (void)setCompoundType:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_compoundType) = (Class)a3;
}

- (_TtC18Feedback_Assistant14FBAFilterGroup)initWithName:(id)a3 filters:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = type metadata accessor for FBAFilter();
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  return (_TtC18Feedback_Assistant14FBAFilterGroup *)sub_100062578(v5, v7, v9);
}

- (_TtC18Feedback_Assistant14FBAFilterGroup)init
{
  _TtC18Feedback_Assistant14FBAFilterGroup *result;

  result = (_TtC18Feedback_Assistant14FBAFilterGroup *)_swift_stdlib_reportUnimplementedInitializer("Feedback_Assistant.FBAFilterGroup", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_filterManager);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_filters));
  swift_bridgeObjectRelease(*(_QWORD *)&self->filterManager[OBJC_IVAR____TtC18Feedback_Assistant14FBAFilterGroup_title]);
}

@end
