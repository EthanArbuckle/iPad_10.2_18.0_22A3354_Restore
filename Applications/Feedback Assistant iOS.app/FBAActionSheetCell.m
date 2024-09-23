@implementation FBAActionSheetCell

- (UILabel)actionTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel));
}

- (void)setActionTitleLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel) = (Class)a3;
  v3 = a3;

}

- (UIImageView)actionImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView));
}

- (void)setActionImageView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView) = (Class)a3;
  v3 = a3;

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  void *v8;
  _TtC18Feedback_Assistant18FBAActionSheetCell *v9;

  v9 = self;
  v4 = a3;
  v5 = -[FBAActionSheetCell traitCollection](v9, "traitCollection");
  v6 = objc_msgSend(v5, "preferredContentSizeCategory");

  v7 = UIContentSizeCategory.isAccessibilityCategory.getter(v6);
  v8 = *(Class *)((char *)&v9->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel);
  if (v8)
  {
    objc_msgSend(v8, "setNumberOfLines:", (v7 & 1) == 0);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC18Feedback_Assistant18FBAActionSheetCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  _TtC18Feedback_Assistant18FBAActionSheetCell *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView) = 0;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView) = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBAActionSheetCell();
  v9 = -[FBAActionSheetCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (_TtC18Feedback_Assistant18FBAActionSheetCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBAActionSheetCell();
  return -[FBAActionSheetCell initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView));
}

@end
