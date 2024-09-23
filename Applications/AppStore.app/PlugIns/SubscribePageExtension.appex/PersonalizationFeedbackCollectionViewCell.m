@implementation PersonalizationFeedbackCollectionViewCell

- (_TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell *)sub_1001A62A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001A9BF4();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell *v2;

  v2 = self;
  sub_1001A6B38();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell *v2;

  v2 = self;
  sub_1001A7724();

}

- (void)feedbackButtonSelectedWithFeedbackOptioButton:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1001A7930(v4);

}

- (void)didTapSubmitButton:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1001A7CF4(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_feedbackDescription));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_feedbackButtons));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_selectedOptionBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_submitButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_buttonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_dividerView));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_didSelectFeedbackOption), *(_QWORD *)&self->feedbackDescription[OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_didSelectFeedbackOption]);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_didSelectSubmitButton), *(_QWORD *)&self->feedbackDescription[OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_didSelectSubmitButton]);
}

@end
