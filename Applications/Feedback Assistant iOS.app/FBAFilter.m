@implementation FBAFilter

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_predicate));
}

- (void)setPredicate:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_predicate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_predicate) = (Class)a3;
  v3 = a3;

}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->predicate[OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_title];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_title);
  v6 = *(_QWORD *)&self->predicate[OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_title];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_image));
}

- (void)setImage:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_image);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_image) = (Class)a3;
  v3 = a3;

}

- (BOOL)active
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_active);
}

- (void)setActive:(BOOL)a3
{
  _TtC18Feedback_Assistant9FBAFilter *v4;

  v4 = self;
  sub_100076E68(a3, (uint64_t)v4);

}

- (_TtC18Feedback_Assistant9FBAFilter)initWithPredicate:(id)a3 title:(id)a4 image:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC18Feedback_Assistant9FBAFilter *v12;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v9 = v8;
  v10 = a3;
  v11 = a5;
  v12 = (_TtC18Feedback_Assistant9FBAFilter *)sub_100077480(v10, v7, v9, a5);

  return v12;
}

- (_TtC18Feedback_Assistant9FBAFilter)initWithPredicate:(id)a3 title:(id)a4 imageName:(id)a5
{
  uint64_t v7;
  uint64_t v8;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  return (_TtC18Feedback_Assistant9FBAFilter *)sub_100076FF4(a3, v7, v8, a5);
}

- (void)toggle
{
  uint64_t KeyPath;
  _TtC18Feedback_Assistant9FBAFilter *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  KeyPath = swift_getKeyPath(&unk_1000CCFA8);
  v4 = self;
  _KeyValueCodingAndObserving.willChangeValue<A>(for:)(KeyPath, &protocol witness table for NSObject);
  -[FBAFilter setActive:](v4, "setActive:", -[FBAFilter active](v4, "active") ^ 1);
  v5 = swift_getKeyPath(&unk_1000CCFA8);
  v6 = _KeyValueCodingAndObserving.didChangeValue<A>(for:)(v5, &protocol witness table for NSObject);
  sub_100077258(v6, v7);

}

- (_TtC18Feedback_Assistant9FBAFilter)init
{
  _TtC18Feedback_Assistant9FBAFilter *result;

  result = (_TtC18Feedback_Assistant9FBAFilter *)_swift_stdlib_reportUnimplementedInitializer("Feedback_Assistant.FBAFilter", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->predicate[OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_title]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_filterGroup);
}

@end
