@implementation AppEventDetailPageView

- (_TtC20ProductPageExtension22AppEventDetailPageView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension22AppEventDetailPageView *)sub_1002C06C8();
}

- (_TtC20ProductPageExtension22AppEventDetailPageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002C14F8();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension22AppEventDetailPageView *v2;

  v2 = self;
  sub_1002BCE74();

}

- (void)didTapCloseButton:(id)a3
{
  sub_1002BE1CC(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_closeButtonActionBlock);
}

- (void)dismissTapGestureRecognized:(id)a3
{
  sub_1002BE1CC(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_dismissTapGestureActionBlock);
}

- (void)didTapShareButton:(id)a3
{
  id v4;
  _TtC20ProductPageExtension22AppEventDetailPageView *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC20ProductPageExtension22AppEventDetailPageView *v15;
  id v16;
  _QWORD v17[5];
  char v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, "bounds");
  v17[0] = v4;
  v17[1] = v6;
  v17[2] = v7;
  v17[3] = v8;
  v17[4] = v9;
  v18 = 1;
  __asm { FMOV            V0.2D, #10.0 }
  v19 = _Q0;
  v20 = _Q0;
  v21 = 15;
  v16 = v4;
  v15 = v5;
  sub_10024E87C((uint64_t)v17, (uint64_t)v15, v16);

}

- (void)videoTapGestureRecognized:(id)a3
{
  _TtC20ProductPageExtension22AppEventDetailPageView *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6, a3);
  swift_unknownObjectRelease();
  sub_1002BE2EC();

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v6);
}

- (void)notifyMeButtonTapped:(id)a3
{
  sub_1002BFA04((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_notifyMeButtonPresenter, (void (*)(id))NotifyMeButtonPresenter.didTapButton(sender:));
}

- (void)lockupTapGestureRecognized:(id)a3
{
  _TtC20ProductPageExtension22AppEventDetailPageView *v5;
  void (*v6)(_QWORD *, __n128);
  uint64_t v7;
  __n128 v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v9, a3);
  swift_unknownObjectRelease();
  v6 = *(void (**)(_QWORD *, __n128))((char *)&v5->super.super.super.isa
                                               + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_lockupTapGestureActionBlock);
  if (v6)
  {
    v7 = *(_QWORD *)&v5->cardScrollView[OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_lockupTapGestureActionBlock];
    v8 = swift_retain(v7);
    v6(v9, v8);
    sub_100018908((uint64_t)v6, v7);
  }

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v9);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC20ProductPageExtension22AppEventDetailPageView *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1002BEFF8(v6, v7);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC20ProductPageExtension22AppEventDetailPageView *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1002BF140(v6, v7);

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension22AppEventDetailPageView *v6;

  v5 = a3;
  v6 = self;
  sub_1002BF6AC(a3);

}

- (void)scrollViewDidScroll:(id)a3
{
  sub_1002BFA04((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_appPromotionCloseButtonAppearanceCoordinator, sub_10032DFD0);
}

- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC20ProductPageExtension29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_formattedDateView);
}

- (UIButton)accessibilityShareButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_shareButton));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityKindLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_kindLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDetailLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_detailLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityRequirementsLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_requirementsLabel));
}

- (_TtC20ProductPageExtension12HeaderButton)accessibilityCloseButton
{
  return (_TtC20ProductPageExtension12HeaderButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                             + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_closeButton));
}

- (_TtC20ProductPageExtension14NotifyMeButton)accessibilityNotifyMeButton
{
  return (_TtC20ProductPageExtension14NotifyMeButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                               + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_notifyMeButton));
}

- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_lockupView));
}

- (_TtC20ProductPageExtension9VideoView)accessibilityVideoView
{
  return (_TtC20ProductPageExtension9VideoView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_videoView);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_cardScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_cardContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_contentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_mediaContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_overlayContentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_formattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_kindLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_notifyMeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_contentBackgroundBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_mediaReplicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_requirementsLabel));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_closeButtonActionBlock), *(_QWORD *)&self->cardScrollView[OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_closeButtonActionBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_dismissTapGestureRecognizer));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_dismissTapGestureActionBlock), *(_QWORD *)&self->cardScrollView[OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_dismissTapGestureActionBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_videoTapGestureRecognizer));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_shareButtonActionBlock), *(_QWORD *)&self->cardScrollView[OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_shareButtonActionBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_lockupTapGestureRecognizer));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_lockupTapGestureActionBlock), *(_QWORD *)&self->cardScrollView[OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_lockupTapGestureActionBlock]);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_videoBackgroundColor));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_mediaOverlayStyle;
  v4 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension22AppEventDetailPageView_videoView);
  swift_release();
}

@end
