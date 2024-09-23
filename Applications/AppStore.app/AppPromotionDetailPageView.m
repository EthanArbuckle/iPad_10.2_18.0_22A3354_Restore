@implementation AppPromotionDetailPageView

- (_TtC8AppStore26AppPromotionDetailPageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100369604();
}

- (void)layoutSubviews
{
  _TtC8AppStore26AppPromotionDetailPageView *v2;

  v2 = self;
  sub_1003667C4();

}

- (void)didTapCloseButton
{
  uint64_t Strong;
  uint64_t v3;
  _TtC8AppStore26AppPromotionDetailPageView *v4;

  v4 = self;
  sub_10028CE64();
  Strong = swift_unknownObjectWeakLoadStrong((char *)v4 + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_delegate);
  if (Strong)
  {
    v3 = Strong;
    sub_100193490();

    swift_unknownObjectRelease(v3);
  }
  else
  {

  }
}

- (void)dismissTapGestureRecognized
{
  _TtC8AppStore26AppPromotionDetailPageView *v2;

  v2 = self;
  sub_100367864();

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
  _TtC8AppStore26AppPromotionDetailPageView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100368C34((uint64_t)v6, v7);

  return v9 & 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v3;
  id v5;
  _TtC8AppStore26AppPromotionDetailPageView *v6;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_appPromotionCloseButtonAppearanceCoordinator);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    swift_retain(v3);
    sub_10061F4B8(v5);

    swift_release(v3);
  }
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView)
                                                                                                 + OBJC_IVAR____TtC8AppStore33AppPromotionDetailPageContentView_availabilityLabelView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityKindLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView)
                                                                                        + OBJC_IVAR____TtC8AppStore33AppPromotionDetailPageContentView_promotionKindLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView)
                                                                                        + OBJC_IVAR____TtC8AppStore33AppPromotionDetailPageContentView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(_QWORD *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView) + OBJC_IVAR____TtC8AppStore33AppPromotionDetailPageContentView_subtitleView)
                                                                                        + qword_100848808));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDetailLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView)
                                                                                        + OBJC_IVAR____TtC8AppStore33AppPromotionDetailPageContentView_detailLabel));
}

- (_TtC8AppStore12HeaderButton)accessibilityCloseButton
{
  return (_TtC8AppStore12HeaderButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_closeButton));
}

- (_TtC8AppStore22SubscriptionLockupView)accessibilityLockupView
{
  return (_TtC8AppStore22SubscriptionLockupView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView)
                                                                                          + OBJC_IVAR____TtC8AppStore33AppPromotionDetailPageContentView_lockupView));
}

- (_TtC8AppStore9VideoView)accessibilityVideoView
{
  return (_TtC8AppStore9VideoView *)(id)swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_mediaContainerView)+ OBJC_IVAR____TtC8AppStore30AppPromotionMediaContainerView_videoView);
}

- (_TtC8AppStore26AppPromotionDetailPageView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore26AppPromotionDetailPageView *result;

  result = (_TtC8AppStore26AppPromotionDetailPageView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.AppPromotionDetailPageView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_displayModeTransitionCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_pageScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_pageContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_mediaContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_learnMoreView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_mediaReplicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_videoBackgroundColor));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_mediaOverlayStyle;
  v4 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_appPromotionCloseButtonAppearanceCoordinator));
}

@end
