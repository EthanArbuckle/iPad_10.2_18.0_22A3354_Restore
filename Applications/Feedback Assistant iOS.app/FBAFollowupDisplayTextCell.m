@implementation FBAFollowupDisplayTextCell

- (NSString)itemIdentifier
{
  return (NSString *)sub_10006394C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_itemIdentifier);
}

- (void)setItemIdentifier:(id)a3
{
  sub_1000639A0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_itemIdentifier);
}

- (UILabel)displayText
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_displayText, a2);
}

- (void)setDisplayText:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_displayText, a3);
}

- (void)awakeFromNib
{
  char *v2;
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FBAFollowupDisplayTextCell();
  v2 = (char *)v7.receiver;
  -[FBAFollowupDisplayTextCell awakeFromNib](&v7, "awakeFromNib");
  objc_msgSend(v2, "setSelectionStyle:", 3, v7.receiver, v7.super_class);
  Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_displayText], v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = objc_msgSend((id)objc_opt_self(UIColor), "secondaryLabelColor");
    objc_msgSend(v5, "setTextColor:", v6);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC18Feedback_Assistant26FBAFollowupDisplayTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  NSString v9;
  _QWORD *v10;
  _TtC18Feedback_Assistant26FBAFollowupDisplayTextCell *v11;
  objc_super v13;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_itemIdentifier);
    *v8 = 0;
    v8[1] = 0xE000000000000000;
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_displayText, 0);
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_itemIdentifier);
    *v10 = 0;
    v10[1] = 0xE000000000000000;
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_displayText, 0);
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FBAFollowupDisplayTextCell();
  v11 = -[FBAFollowupDisplayTextCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, v9);

  return v11;
}

- (_TtC18Feedback_Assistant26FBAFollowupDisplayTextCell)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_super v7;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_itemIdentifier);
  *v5 = 0;
  v5[1] = 0xE000000000000000;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_displayText, 0);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FBAFollowupDisplayTextCell();
  return -[FBAFollowupDisplayTextCell initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_itemIdentifier]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_displayText);
}

@end
