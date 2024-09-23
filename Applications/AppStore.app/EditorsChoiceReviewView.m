@implementation EditorsChoiceReviewView

- (_TtC8AppStore23EditorsChoiceReviewView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23EditorsChoiceReviewView *)sub_1001D1A28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23EditorsChoiceReviewView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8AppStore23EditorsChoiceReviewView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_isExpanded) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_showsBadge) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_pageTraits) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_moreTapHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8AppStore23EditorsChoiceReviewView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/EditorsChoiceReviewView.swift", 38, 2, 199, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore23EditorsChoiceReviewView *v2;

  v2 = self;
  sub_1001D2CA0();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore23EditorsChoiceReviewView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1001D3FA8(width, height);
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
  _TtC8AppStore23EditorsChoiceReviewView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_moreTapHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->badgeView[OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_moreTapHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_10003A340((uint64_t)v3, v5);
    v3(v7);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (_TtC8AppStore17EditorsChoiceView)accessibilityBadgeView
{
  return (_TtC8AppStore17EditorsChoiceView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_badgeView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_textLabel));
}

- (BOOL)accessibilityShowsBadge
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_showsBadge);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_moreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_backgroundImageView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_pageTraits));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_moreTapHandler), *(_QWORD *)&self->badgeView[OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_moreTapHandler]);
}

@end
