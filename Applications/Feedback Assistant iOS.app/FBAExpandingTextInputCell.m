@implementation FBAExpandingTextInputCell

- (NSString)itemIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_itemIdentifier];
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
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_itemIdentifier);
  v6 = *(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_itemIdentifier];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (_TtC18Feedback_Assistant20FBAExpandingTextView)commentsTextView
{
  return (_TtC18Feedback_Assistant20FBAExpandingTextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_commentsTextView, a2);
}

- (void)setCommentsTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_commentsTextView, a3);
}

- (UILabel)characterCountLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_characterCountLabel, a2);
}

- (void)setCharacterCountLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_characterCountLabel, a3);
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return (NSLayoutConstraint *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_minimumHeightConstraint, a2);
}

- (void)setMinimumHeightConstraint:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_minimumHeightConstraint, a3);
}

- (void)awakeFromNib
{
  _TtC18Feedback_Assistant25FBAExpandingTextInputCell *v2;

  v2 = self;
  sub_100088D78();

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v6;

  v4 = a4;
  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBAExpandingTextInputCell();
  -[FBAExpandingTextInputCell setSelected:animated:](&v6, "setSelected:animated:", v5, v4);
}

- (void)textViewDidBeginEditing:(id)a3
{
  uint64_t Strong;
  void *v6;
  id v7;
  _TtC18Feedback_Assistant25FBAExpandingTextInputCell *v8;
  id v9;
  id v10;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_delegate, a2);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = a3;
    v8 = self;
    v9 = objc_msgSend(v6, "tableView");
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "flashScrollIndicators");

    }
    else
    {
      __break(1u);
    }
  }
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant25FBAExpandingTextInputCell *v5;

  v4 = a3;
  v5 = self;
  sub_100089230(v4);

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC18Feedback_Assistant25FBAExpandingTextInputCell *v6;

  v4 = a3;
  v6 = self;
  sub_100089880((uint64_t)v6, v5);

}

- (BOOL)textViewShouldEndEditing:(id)a3
{
  void *Strong;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_delegate, a2);
  if (Strong)

  return 1;
}

- (_TtC18Feedback_Assistant25FBAExpandingTextInputCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC18Feedback_Assistant25FBAExpandingTextInputCell *)sub_1000894A8(a3, (uint64_t)a4, v6);
}

- (_TtC18Feedback_Assistant25FBAExpandingTextInputCell)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant25FBAExpandingTextInputCell *)sub_100089614(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_itemIdentifier]);
  sub_1000535EC((uint64_t)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_followup));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_commentsTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_characterCountLabel);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_minimumHeightConstraint);
}

@end
