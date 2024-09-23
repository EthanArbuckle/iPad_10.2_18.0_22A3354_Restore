@implementation EditorialCardCollectionViewCell

- (_TtC20ProductPageExtension31EditorialCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31EditorialCardCollectionViewCell *)sub_100345744(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31EditorialCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100349008();
}

- (void)dealloc
{
  _TtC20ProductPageExtension31EditorialCardCollectionViewCell *v2;

  v2 = self;
  sub_100346934();
}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_cardContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_cardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_lockupView));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_lockupViewTappedAction), *(_QWORD *)&self->cardContainerView[OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_lockupViewTappedAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_appEventFormattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_longPressGestureRecognizer));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_clickAction, &qword_100819850);
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31EditorialCardCollectionViewCell *v2;

  v2 = self;
  sub_100346DE4();

}

- (void)stateChangedFor:(id)a3
{
  id v4;
  _TtC20ProductPageExtension31EditorialCardCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1003473CC(v4);

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension31EditorialCardCollectionViewCell *v2;

  v2 = self;
  sub_1003449B8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension31EditorialCardCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_100347CA8(a3);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v5;

  v5 = objc_opt_self(UIPanGestureRecognizer);
  return swift_dynamicCastObjCClass(a4, v5) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC20ProductPageExtension31EditorialCardCollectionViewCell *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100347F90(v6, v7);

  return v9;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC20ProductPageExtension31EditorialCardCollectionViewCell *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_lockupViewTappedAction);
  if (v3)
  {
    v5 = *(_QWORD *)&self->cardContainerView[OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_lockupViewTappedAction];
    v6 = a3;
    v8 = self;
    v7 = sub_100018918((uint64_t)v3, v5);
    v3(v7);
    sub_100018908((uint64_t)v3, v5);

  }
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityCaptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_captionLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_subtitleLabel));
}

- (_TtC20ProductPageExtension19CrossLinkLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension19CrossLinkLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_lockupView);
}

- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)accessibilityAppPromotionFormattedDateView
{
  return (_TtC20ProductPageExtension29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_appEventFormattedDateView);
}

@end
