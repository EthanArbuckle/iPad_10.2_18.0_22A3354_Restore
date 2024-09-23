@implementation ProductLockupCollectionViewCell

- (void)prepareForReuse
{
  uint64_t v2;
  _TtC8AppStore31ProductLockupCollectionViewCell *v3;

  v3 = self;
  sub_10010FC28((uint64_t)v3, v2);

}

- (_TtC8AppStore31ProductLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31ProductLockupCollectionViewCell *)sub_100383788(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  _TtC8AppStore31ProductLockupCollectionViewCell *v2;
  uint64_t v3;

  v2 = self;
  sub_100384DDC((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_lockupContentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_uberView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_titleLabel));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_appStateMachine));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerLabelPresenter, (uint64_t *)&unk_10082B490);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_developerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_taglineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_tertiaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_disclosureArrow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_secondaryBannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_blurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_keylineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_iconView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_expandedOfferTitleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_expandedOfferSubtitleText]);
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_theme;
  v4 = type metadata accessor for ProductPageTheme(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_expandedOfferTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_expandedOfferSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_downloadProgressLabel));
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((Class *)((char *)&self->super.super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_networkInquiry));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_networkObservation, &qword_100840790);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_shareTapHandler), *(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_shareTapHandler]);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_developerTapHandler), *(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_developerTapHandler]);
}

- (_TtC8AppStore31ProductLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10038CF98();
}

- (void)layoutSubviews
{
  _TtC8AppStore31ProductLockupCollectionViewCell *v2;

  v2 = self;
  sub_100386370();

}

- (void)applyLayoutAttributes:(id)a3
{
  char *v4;
  _TtC8AppStore31ProductLockupCollectionViewCell *v5;

  v4 = (char *)a3;
  v5 = self;
  sub_100388ECC(v4);

}

- (void)shareTappedFrom:(id)a3
{
  id v4;
  _TtC8AppStore31ProductLockupCollectionViewCell *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC8AppStore31ProductLockupCollectionViewCell *v15;
  __n128 v16;
  id v17;
  _QWORD v18[5];
  char v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, "bounds");
  v18[0] = v4;
  v18[1] = v6;
  v18[2] = v7;
  v18[3] = v8;
  v18[4] = v9;
  v19 = 1;
  __asm { FMOV            V0.2D, #10.0 }
  v20 = _Q0;
  v21 = _Q0;
  v22 = 15;
  v17 = v4;
  v15 = v5;
  sub_10016C238((uint64_t)v18, (uint64_t)v15, (uint64_t)v17, v16);

}

- (void)developerLabelTapped:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC8AppStore31ProductLockupCollectionViewCell *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_developerTapHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_developerTapHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_10003A340((uint64_t)v3, v5);
    v3(v7);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (void)taglineLabelTapped:(id)a3
{
  id v4;
  _TtC8AppStore31ProductLockupCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_10038E014();

}

- (void)layoutDirectionDidChanged
{
  _TtC8AppStore31ProductLockupCollectionViewCell *v2;

  v2 = self;
  sub_100113AFC(v2, (uint64_t)v2);

}

- (void)userInterfaceStyleDidChanged
{
  _TtC8AppStore31ProductLockupCollectionViewCell *v2;

  v2 = self;
  sub_1003854A8();
  sub_1003856D8();

}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC8AppStore31ProductLockupCollectionViewCell *v2;
  id v3;
  void *v4;
  id v5;

  v2 = self;
  v3 = -[ProductLockupCollectionViewCell traitCollection](v2, "traitCollection");
  sub_10038CE6C((uint64_t)v3);
  v5 = v4;

  objc_msgSend(*(id *)((char *)&v2->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_shareButton), "setImage:forState:", v5, 0);
}

- (UIView)accessibilityBannerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_bannerView));
}

- (UIView)accessibilitySecondaryBannerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_secondaryBannerView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit11ArtworkView)accessibilityArtworkView
{
  return (_TtC11AppStoreKit11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_iconView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDeveloperLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_developerLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTaglineLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_taglineLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTertiaryTitleLabel
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_tertiaryTitleLabel);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_tertiaryTitleLabel, v4, 0, 0);
  return (_TtC11AppStoreKit16DynamicTypeLabel *)*v2;
}

- (_TtC8AppStore11OfferButton)accessibilityOfferButton
{
  return (_TtC8AppStore11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                               + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerButton));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityOfferSubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerSubtitleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDownloadProgressLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_downloadProgressLabel));
}

- (_TtC8AppStore12HeaderButton)accessibilityShareButton
{
  return (_TtC8AppStore12HeaderButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_shareButton));
}

- (_TtC8AppStore11ChevronView)accessibilityDisclosureArrow
{
  return (_TtC8AppStore11ChevronView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                               + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_disclosureArrow));
}

- (_TtC8AppStore9VideoView)accessibilityVideoView
{
  return (_TtC8AppStore9VideoView *)(id)sub_1003851C4();
}

@end
