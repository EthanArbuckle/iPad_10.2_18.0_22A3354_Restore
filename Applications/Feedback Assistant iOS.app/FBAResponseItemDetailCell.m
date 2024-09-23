@implementation FBAResponseItemDetailCell

- (UIStackView)questionGroupsStack
{
  return (UIStackView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_questionGroupsStack, a2);
}

- (void)setQuestionGroupsStack:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_questionGroupsStack, a3);
}

- (void)awakeFromNib
{
  _TtC18Feedback_Assistant25FBAResponseItemDetailCell *v3;
  id Strong;

  Strong = (id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_questionGroupsStack, a2);
  if (Strong)
  {
    v3 = self;
    objc_msgSend(Strong, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
  else
  {
    __break(1u);
  }
}

- (FBKContentItem)contentItem
{
  return (FBKContentItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem));
}

- (void)setContentItem:(id)a3
{
  void *v4;
  _TtC18Feedback_Assistant25FBAResponseItemDetailCell *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem) = (Class)a3;
  v8 = a3;
  v5 = self;

  sub_10007BA8C(v6, v7);
}

- (void)layoutSubviews
{
  _TtC18Feedback_Assistant25FBAResponseItemDetailCell *v2;

  v2 = self;
  sub_10007C8E4();

}

- (_TtC18Feedback_Assistant25FBAResponseItemDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  _TtC18Feedback_Assistant25FBAResponseItemDetailCell *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_questionGroupsStack, 0);
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem) = 0;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_questionGroupsStack, 0);
    v8 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem) = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBAResponseItemDetailCell();
  v9 = -[FBAResponseItemDetailCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (_TtC18Feedback_Assistant25FBAResponseItemDetailCell)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_questionGroupsStack, 0);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBAResponseItemDetailCell();
  return -[FBAResponseItemDetailCell initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_questionGroupsStack);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem));
}

@end
