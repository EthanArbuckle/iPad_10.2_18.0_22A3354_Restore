@implementation ProductLockupCollectionViewCell

- (void)prepareForReuse
{
  uint64_t v2;
  _TtC22SubscribePageExtension31ProductLockupCollectionViewCell *v3;

  v3 = self;
  sub_1001F5A6C((uint64_t)v3, v2);

}

- (_TtC22SubscribePageExtension31ProductLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31ProductLockupCollectionViewCell *)sub_100212E60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  _TtC22SubscribePageExtension31ProductLockupCollectionViewCell *v2;
  uint64_t v3;

  v2 = self;
  sub_1002144B4((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_lockupContentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_uberView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_titleLabel));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_appStateMachine));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_offerLabelPresenter, &qword_1007F6E90);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_developerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_taglineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_tertiaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_offerSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_disclosureArrow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_secondaryBannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_blurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_keylineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_iconView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_expandedOfferTitleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_expandedOfferSubtitleText]);
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_theme;
  v4 = type metadata accessor for ProductPageTheme(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_expandedOfferTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_expandedOfferSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_downloadProgressLabel));
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((Class *)((char *)&self->super.super.super.super.super.isa
                                                                                            + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_networkInquiry));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_networkObservation, &qword_100801FE0);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_shareTapHandler), *(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_shareTapHandler]);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_developerTapHandler), *(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_developerTapHandler]);
}

- (_TtC22SubscribePageExtension31ProductLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  __n128 v4;

  v3 = a3;
  sub_10021C47C(v4);
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension31ProductLockupCollectionViewCell *v2;

  v2 = self;
  sub_100215A48();

}

- (void)applyLayoutAttributes:(id)a3
{
  char *v4;
  _TtC22SubscribePageExtension31ProductLockupCollectionViewCell *v5;

  v4 = (char *)a3;
  v5 = self;
  sub_100218314(v4);

}

- (void)shareTappedFrom:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension31ProductLockupCollectionViewCell *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC22SubscribePageExtension31ProductLockupCollectionViewCell *v15;
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
  sub_100277A24((uint64_t)v17, (uint64_t)v15, (uint64_t)v16);

}

- (void)developerLabelTapped:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC22SubscribePageExtension31ProductLockupCollectionViewCell *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_developerTapHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_developerTapHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_100019320((uint64_t)v3, v5);
    v3(v7);
    sub_100019310((uint64_t)v3, v5);

  }
}

- (void)taglineLabelTapped:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension31ProductLockupCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_10021D030();

}

- (void)layoutDirectionDidChanged
{
  _TtC22SubscribePageExtension31ProductLockupCollectionViewCell *v2;

  v2 = self;
  sub_1001F9918(v2, (uint64_t)v2);

}

- (void)userInterfaceStyleDidChanged
{
  _TtC22SubscribePageExtension31ProductLockupCollectionViewCell *v2;

  v2 = self;
  sub_100214B80();
  sub_100214DB0();

}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC22SubscribePageExtension31ProductLockupCollectionViewCell *v2;
  id v3;
  void *v4;
  id v5;

  v2 = self;
  v3 = -[ProductLockupCollectionViewCell traitCollection](v2, "traitCollection");
  sub_10021C350((uint64_t)v3);
  v5 = v4;

  objc_msgSend(*(id *)((char *)&v2->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_shareButton), "setImage:forState:", v5, 0);
}

- (UIView)accessibilityBannerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_bannerView));
}

- (UIView)accessibilitySecondaryBannerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_secondaryBannerView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit11ArtworkView)accessibilityArtworkView
{
  return (_TtC11AppStoreKit11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_iconView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDeveloperLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_developerLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTaglineLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_taglineLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTertiaryTitleLabel
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_tertiaryTitleLabel);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_tertiaryTitleLabel, v4, 0, 0);
  return (_TtC11AppStoreKit16DynamicTypeLabel *)*v2;
}

- (_TtC22SubscribePageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC22SubscribePageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                              + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_offerButton));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityOfferSubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_offerSubtitleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDownloadProgressLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_downloadProgressLabel));
}

- (_TtC22SubscribePageExtension12HeaderButton)accessibilityShareButton
{
  return (_TtC22SubscribePageExtension12HeaderButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                               + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_shareButton));
}

- (_TtC22SubscribePageExtension11ChevronView)accessibilityDisclosureArrow
{
  return (_TtC22SubscribePageExtension11ChevronView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                              + OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_disclosureArrow));
}

- (_TtC22SubscribePageExtension9VideoView)accessibilityVideoView
{
  return (_TtC22SubscribePageExtension9VideoView *)(id)sub_10021489C();
}

@end
