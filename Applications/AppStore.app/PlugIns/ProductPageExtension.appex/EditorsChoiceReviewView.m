@implementation EditorsChoiceReviewView

- (_TtC20ProductPageExtension23EditorsChoiceReviewView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension23EditorsChoiceReviewView *)sub_1002ABE08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension23EditorsChoiceReviewView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC20ProductPageExtension23EditorsChoiceReviewView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_isExpanded) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_showsBadge) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_pageTraits) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_moreTapHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC20ProductPageExtension23EditorsChoiceReviewView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/EditorsChoiceReviewView.swift", 50, 2, 199, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  __n128 v2;
  _TtC20ProductPageExtension23EditorsChoiceReviewView *v3;

  v3 = self;
  sub_1002AD080(v2);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension23EditorsChoiceReviewView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1002AE388(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)moreFrom:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC20ProductPageExtension23EditorsChoiceReviewView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_moreTapHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->badgeView[OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_moreTapHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_100018918((uint64_t)v3, v5);
    v3(v7);
    sub_100018908((uint64_t)v3, v5);

  }
}

- (_TtC20ProductPageExtension17EditorsChoiceView)accessibilityBadgeView
{
  return (_TtC20ProductPageExtension17EditorsChoiceView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_badgeView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_textLabel));
}

- (BOOL)accessibilityShowsBadge
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_showsBadge);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_moreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_backgroundImageView));
  swift_unknownObjectRelease();
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_moreTapHandler), *(_QWORD *)&self->badgeView[OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_moreTapHandler]);
}

@end
