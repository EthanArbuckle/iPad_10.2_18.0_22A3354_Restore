@implementation FBATopicCell

- (NSString)itemIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_itemIdentifier];
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
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_itemIdentifier);
  v6 = *(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_itemIdentifier];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (NSLayoutConstraint)topicToBottomOfView
{
  return (NSLayoutConstraint *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_topicToBottomOfView, a2);
}

- (void)setTopicToBottomOfView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_topicToBottomOfView, a3);
}

- (FBAQuestionCellTextView)formDescriptions
{
  return (FBAQuestionCellTextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formDescriptions, a2);
}

- (void)setFormDescriptions:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formDescriptions, a3);
}

- (FBABugFormLabel)formName
{
  return (FBABugFormLabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formName, a2);
}

- (void)setFormName:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formName, a3);
}

+ (NSString)reuseIdentifier
{
  uint64_t v2;
  NSString v3;

  if (qword_100115DC0 != -1)
    swift_once(&qword_100115DC0, sub_100051700);
  v2 = unk_100119F40;
  swift_bridgeObjectRetain(unk_100119F40);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (FBKBugFormStub)formStub
{
  return (FBKBugFormStub *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formStub));
}

- (void)setFormStub:(id)a3
{
  void *v4;
  _TtC18Feedback_Assistant12FBATopicCell *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formStub);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formStub) = (Class)a3;
  v8 = a3;
  v5 = self;

  sub_10005180C(v6, v7);
}

- (BOOL)disclosesMoreForms
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_disclosesMoreForms);
}

- (void)setDisclosesMoreForms:(BOOL)a3
{
  _TtC18Feedback_Assistant12FBATopicCell *v4;

  v4 = self;
  sub_100051A20(a3);

}

- (_TtC18Feedback_Assistant12FBATopicCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC18Feedback_Assistant12FBATopicCell *)sub_100051A74(a3, (uint64_t)a4, v6);
}

- (_TtC18Feedback_Assistant12FBATopicCell)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant12FBATopicCell *)sub_100051BAC(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_itemIdentifier]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_topicToBottomOfView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formDescriptions);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formName);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formStub));
}

@end
