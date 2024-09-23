@implementation StandardLinkView

- (_TtC8AppStore16StandardLinkView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore16StandardLinkView *result;

  sub_10028AF04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC8AppStore16StandardLinkView)initWithCoder:(id)a3
{
  _TtC8AppStore16StandardLinkView *result;

  result = (_TtC8AppStore16StandardLinkView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/StandardLinkView.swift", 31, 2, 101, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC8AppStore16StandardLinkView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_10028B41C(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore16StandardLinkView *v2;

  v2 = self;
  sub_10028B568();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore16StandardLinkView *v6;

  v5 = a3;
  v6 = self;
  sub_10028B958(a3);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore16StandardLinkView_descriptionLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore16StandardLinkView_summaryLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16StandardLinkView_descriptionLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16StandardLinkView_disclosureIndicator));
}

@end
