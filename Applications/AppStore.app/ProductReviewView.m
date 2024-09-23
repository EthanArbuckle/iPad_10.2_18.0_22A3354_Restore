@implementation ProductReviewView

- (_TtC8AppStore17ProductReviewView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore17ProductReviewView *)sub_10058C6E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore17ProductReviewView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC8AppStore17ProductReviewView *)sub_100590148();
}

- (void)layoutSubviews
{
  _TtC8AppStore17ProductReviewView *v2;

  v2 = self;
  sub_10058EDB8();

}

- (void)stateChangedFor:(id)a3
{
  id v4;
  void (*v5)(__n128);
  uint64_t v6;
  __n128 v7;
  _TtC8AppStore17ProductReviewView *v8;

  v4 = a3;
  v8 = self;
  if (objc_msgSend(v4, "state") == (id)1)
  {
    v5 = *(void (**)(__n128))((char *)&v8->super.super.super.isa
                                       + OBJC_IVAR____TtC8AppStore17ProductReviewView_actionHandler);
    if (v5)
    {
      v6 = *(_QWORD *)&v8->titleLabel[OBJC_IVAR____TtC8AppStore17ProductReviewView_actionHandler];
      v7 = swift_retain(v6);
      v5(v7);
      sub_10003A350((uint64_t)v5, v6);
    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)moreReviewFrom:(id)a3
{
  sub_10058FB28((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8AppStore17ProductReviewView_moreReviewTapHandler);
}

- (void)moreResponseFrom:(id)a3
{
  sub_10058FB28((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8AppStore17ProductReviewView_moreResponseTapHandler);
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore17ProductReviewView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDateLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore17ProductReviewView_dateLabel));
}

- (_TtC8AppStore10RatingView)accessibilityRatingView
{
  return (_TtC8AppStore10RatingView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                              + OBJC_IVAR____TtC8AppStore17ProductReviewView_ratingView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityAuthorLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore17ProductReviewView_authorLabel));
}

- (_TtC8AppStore18ExpandableTextView)accessibilityBodyLabel
{
  return (_TtC8AppStore18ExpandableTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                      + OBJC_IVAR____TtC8AppStore17ProductReviewView_bodyLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityResponseTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore17ProductReviewView_responseTitleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityResponseDateLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore17ProductReviewView_responseDateLabel));
}

- (_TtC8AppStore18ExpandableTextView)accessibilityResponseBodyLabel
{
  return (_TtC8AppStore18ExpandableTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                      + OBJC_IVAR____TtC8AppStore17ProductReviewView_responseBodyLabel));
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17ProductReviewView_dateAuthorLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17ProductReviewView_responseTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17ProductReviewView_responseDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17ProductReviewView_responseBodyLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17ProductReviewView_roundedCornerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17ProductReviewView_cardContentView));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17ProductReviewView_moreReviewTapHandler), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC8AppStore17ProductReviewView_moreReviewTapHandler]);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore17ProductReviewView_moreResponseTapHandler), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC8AppStore17ProductReviewView_moreResponseTapHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17ProductReviewView_moreReviewTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17ProductReviewView_moreResponseTapGestureRecognizer));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17ProductReviewView_actionHandler), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC8AppStore17ProductReviewView_actionHandler]);
}

@end
