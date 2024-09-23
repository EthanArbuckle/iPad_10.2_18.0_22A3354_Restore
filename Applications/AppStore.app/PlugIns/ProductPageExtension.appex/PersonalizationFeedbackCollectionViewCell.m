@implementation PersonalizationFeedbackCollectionViewCell

- (_TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell *)sub_1005D298C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005D70EC();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell *v2;

  v2 = self;
  sub_1005D3224();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell *v2;

  v2 = self;
  sub_1005D3E10();

}

- (void)feedbackButtonSelectedWithFeedbackOptioButton:(id)a3
{
  id v4;
  _TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1005D401C(v4);

}

- (void)didTapSubmitButton:(id)a3
{
  id v4;
  _TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1005D43E0(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_feedbackDescription));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_feedbackButtons));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_selectedOptionBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_submitButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_buttonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_dividerView));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_didSelectFeedbackOption), *(_QWORD *)&self->feedbackDescription[OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_didSelectFeedbackOption]);
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_didSelectSubmitButton), *(_QWORD *)&self->feedbackDescription[OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_didSelectSubmitButton]);
}

@end
