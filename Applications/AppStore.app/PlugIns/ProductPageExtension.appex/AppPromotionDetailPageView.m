@implementation AppPromotionDetailPageView

- (_TtC20ProductPageExtension26AppPromotionDetailPageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10043A124();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension26AppPromotionDetailPageView *v2;

  v2 = self;
  sub_1004372C0();

}

- (void)didTapCloseButton
{
  _TtC20ProductPageExtension26AppPromotionDetailPageView *v2;

  v2 = self;
  sub_1003ED8E0();
  if (swift_unknownObjectWeakLoadStrong((char *)v2 + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_delegate))
  {
    sub_10032DB0C();

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)dismissTapGestureRecognized
{
  _TtC20ProductPageExtension26AppPromotionDetailPageView *v2;

  v2 = self;
  sub_100438360();

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
  _TtC20ProductPageExtension26AppPromotionDetailPageView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100439730((uint64_t)v6, v7);

  return v9 & 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v3;
  id v5;
  _TtC20ProductPageExtension26AppPromotionDetailPageView *v6;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_appPromotionCloseButtonAppearanceCoordinator);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    swift_retain(v3);
    sub_10032DFD0(v5);

    swift_release();
  }
}

- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC20ProductPageExtension29AppPromotionFormattedDateView *)*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_contentView) + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_availabilityLabelView);
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityKindLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_contentView)
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_promotionKindLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_contentView)
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(_QWORD *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_contentView) + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_subtitleView)
                                                                                        + qword_1008203F0));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDetailLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_contentView)
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_detailLabel));
}

- (_TtC20ProductPageExtension12HeaderButton)accessibilityCloseButton
{
  return (_TtC20ProductPageExtension12HeaderButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                             + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_closeButton));
}

- (_TtC20ProductPageExtension22SubscriptionLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension22SubscriptionLockupView *)*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_contentView) + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_lockupView);
}

- (_TtC20ProductPageExtension9VideoView)accessibilityVideoView
{
  return (_TtC20ProductPageExtension9VideoView *)(id)swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_mediaContainerView)+ OBJC_IVAR____TtC20ProductPageExtension30AppPromotionMediaContainerView_videoView);
}

- (_TtC20ProductPageExtension26AppPromotionDetailPageView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension26AppPromotionDetailPageView *result;

  result = (_TtC20ProductPageExtension26AppPromotionDetailPageView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.AppPromotionDetailPageView", 47, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100010D1C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_pageScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_pageContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_mediaContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_learnMoreView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_mediaReplicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_videoBackgroundColor));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_mediaOverlayStyle;
  v4 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

@end
