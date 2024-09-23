@implementation EditorialCardCollectionViewCell

- (_TtC8AppStore31EditorialCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31EditorialCardCollectionViewCell *)sub_10023C8B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31EditorialCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  sub_10023F9CC((uint64_t)v3, v4);
}

- (void)dealloc
{
  _TtC8AppStore31EditorialCardCollectionViewCell *v2;
  uint64_t v3;

  v2 = self;
  sub_10023DAA0((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_cardContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_cardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_lockupView));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_lockupViewTappedAction), *(_QWORD *)&self->cardContainerView[OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_lockupViewTappedAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_appEventFormattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_longPressGestureRecognizer));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_clickAction, (uint64_t *)&unk_100835F20);
}

- (void)layoutSubviews
{
  _TtC8AppStore31EditorialCardCollectionViewCell *v2;

  v2 = self;
  sub_10023DEE0();

}

- (void)stateChangedFor:(id)a3
{
  id v4;
  _TtC8AppStore31EditorialCardCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_10023E4C8(v4);

}

- (void)prepareForReuse
{
  _TtC8AppStore31EditorialCardCollectionViewCell *v2;

  v2 = self;
  sub_10023BB24();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore31EditorialCardCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_10023EDA4(a3);

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
  _TtC8AppStore31EditorialCardCollectionViewCell *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10023F08C(v6, v7);

  return v9;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC8AppStore31EditorialCardCollectionViewCell *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_lockupViewTappedAction);
  if (v3)
  {
    v5 = *(_QWORD *)&self->cardContainerView[OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_lockupViewTappedAction];
    v6 = a3;
    v8 = self;
    v7 = sub_10003A340((uint64_t)v3, v5);
    v3(v7);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityCaptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_captionLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_subtitleLabel));
}

- (_TtC8AppStore19CrossLinkLockupView)accessibilityLockupView
{
  return (_TtC8AppStore19CrossLinkLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                       + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_lockupView));
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityAppPromotionFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_appEventFormattedDateView));
}

@end
