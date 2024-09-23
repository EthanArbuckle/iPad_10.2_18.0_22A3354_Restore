@implementation FBAFFUValidationCell

- (NSString)itemIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant20FBAFFUValidationCell_itemIdentifier];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setItemIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant20FBAFFUValidationCell_itemIdentifier);
  v6 = *(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant20FBAFFUValidationCell_itemIdentifier];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (void)awakeFromNib
{
  _TtC18Feedback_Assistant20FBAFFUValidationCell *v2;

  v2 = self;
  sub_10008E214();

}

- (_TtC18Feedback_Assistant20FBAFFUValidationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC18Feedback_Assistant20FBAFFUValidationCell *)sub_10008E3D0(a3, (uint64_t)a4, v6);
}

- (_TtC18Feedback_Assistant20FBAFFUValidationCell)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant20FBAFFUValidationCell *)sub_10008E4D8(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant20FBAFFUValidationCell_itemIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant20FBAFFUValidationCell_validationQuery]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant20FBAFFUValidationCell____lazy_storage___choiceLabel));
}

@end
