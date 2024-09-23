@implementation PersonalizationFeedbackCollectionViewCell

- (_TtC8AppStore41PersonalizationFeedbackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore41PersonalizationFeedbackCollectionViewCell *)sub_1005FFE40(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore41PersonalizationFeedbackCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100604524();
}

- (void)layoutSubviews
{
  _TtC8AppStore41PersonalizationFeedbackCollectionViewCell *v2;

  v2 = self;
  sub_1006006D8();

}

- (void)prepareForReuse
{
  _TtC8AppStore41PersonalizationFeedbackCollectionViewCell *v2;

  v2 = self;
  sub_1006012C4();

}

- (void)feedbackButtonSelectedWithFeedbackOptioButton:(id)a3
{
  id v4;
  _TtC8AppStore41PersonalizationFeedbackCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1006014D0(v4);

}

- (void)didTapSubmitButton:(id)a3
{
  id v4;
  _TtC8AppStore41PersonalizationFeedbackCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_100601894(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_feedbackDescription));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_feedbackButtons));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_selectedOptionBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_submitButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_buttonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_dividerView));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_didSelectFeedbackOption), *(_QWORD *)&self->feedbackDescription[OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_didSelectFeedbackOption]);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_didSelectSubmitButton), *(_QWORD *)&self->feedbackDescription[OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_didSelectSubmitButton]);
}

@end
