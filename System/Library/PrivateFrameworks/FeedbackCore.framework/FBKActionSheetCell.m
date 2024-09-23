@implementation FBKActionSheetCell

- (UILabel)actionTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel));
}

- (void)setActionTitleLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel) = (Class)a3;
  v3 = a3;

}

- (UIImageView)actionImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView));
}

- (void)setActionImageView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView) = (Class)a3;
  v3 = a3;

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  void *v8;
  _TtC12FeedbackCore18FBKActionSheetCell *v9;

  v9 = self;
  v4 = a3;
  v5 = -[FBKActionSheetCell traitCollection](v9, sel_traitCollection);
  v6 = objc_msgSend(v5, sel_preferredContentSizeCategory);

  v7 = sub_21DAC4AF8();
  v8 = *(Class *)((char *)&v9->super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel);
  if (v8)
  {
    objc_msgSend(v8, sel_setNumberOfLines_, (v7 & 1) == 0);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC12FeedbackCore18FBKActionSheetCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v6;
  _TtC12FeedbackCore18FBKActionSheetCell *v7;
  objc_super v9;

  if (a4)
  {
    sub_21DAC481C();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView) = 0;
    v6 = (void *)sub_21DAC4810();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FBKActionSheetCell();
  v7 = -[FBKActionSheetCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, v6);

  return v7;
}

- (_TtC12FeedbackCore18FBKActionSheetCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBKActionSheetCell();
  return -[FBKActionSheetCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView));
}

@end
