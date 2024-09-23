@implementation ProductLockupCollectionViewCell

- (_TtC20ProductPageExtension31ProductLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31ProductLockupCollectionViewCell *)sub_10029A7B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  _TtC20ProductPageExtension31ProductLockupCollectionViewCell *v2;
  uint64_t v3;

  v2 = self;
  sub_10029BE04((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_lockupContentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_uberView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_titleLabel));
  swift_unknownObjectRelease();
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_offerLabelPresenter, &qword_100808F20);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_developerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_taglineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_tertiaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_offerSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_disclosureArrow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_secondaryBannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_blurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_keylineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_iconView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_expandedOfferTitleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_expandedOfferSubtitleText]);
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_theme;
  v4 = type metadata accessor for ProductPageTheme(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_expandedOfferTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_expandedOfferSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_downloadProgressLabel));
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((Class *)((char *)&self->super.super.super.super.super.isa
                                                                 + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_networkInquiry));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_networkObservation, &qword_100819410);
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_shareTapHandler), *(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_shareTapHandler]);
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_developerTapHandler), *(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_developerTapHandler]);
}

- (_TtC20ProductPageExtension31ProductLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  __n128 v4;

  v3 = a3;
  sub_1002A42EC(v4);
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31ProductLockupCollectionViewCell *v2;

  v2 = self;
  sub_10029D51C();

}

- (void)applyLayoutAttributes:(id)a3
{
  char *v4;
  _TtC20ProductPageExtension31ProductLockupCollectionViewCell *v5;

  v4 = (char *)a3;
  v5 = self;
  sub_10029FDE8(v4);

}

- (void)shareTappedFrom:(id)a3
{
  id v4;
  _TtC20ProductPageExtension31ProductLockupCollectionViewCell *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC20ProductPageExtension31ProductLockupCollectionViewCell *v15;
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
  sub_10024E5A4((uint64_t)v17, (uint64_t)v15, (uint64_t)v16);

}

- (void)developerLabelTapped:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC20ProductPageExtension31ProductLockupCollectionViewCell *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_developerTapHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->lockupContentBackgroundView[OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_developerTapHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_100018918((uint64_t)v3, v5);
    v3(v7);
    sub_100018908((uint64_t)v3, v5);

  }
}

- (void)taglineLabelTapped:(id)a3
{
  id v4;
  _TtC20ProductPageExtension31ProductLockupCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002A4EA0();

}

- (void)layoutDirectionDidChanged
{
  _TtC20ProductPageExtension31ProductLockupCollectionViewCell *v2;

  v2 = self;
  sub_100542DF4(v2, (uint64_t)v2);

}

- (void)userInterfaceStyleDidChanged
{
  _TtC20ProductPageExtension31ProductLockupCollectionViewCell *v2;

  v2 = self;
  sub_10029C580();
  sub_10029C7B0();

}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC20ProductPageExtension31ProductLockupCollectionViewCell *v2;
  id v3;
  void *v4;
  id v5;

  v2 = self;
  v3 = -[ProductLockupCollectionViewCell traitCollection](v2, "traitCollection");
  sub_1002A41C0((uint64_t)v3);
  v5 = v4;

  objc_msgSend(*(id *)((char *)&v2->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_shareButton), "setImage:forState:", v5, 0);
}

- (UIView)accessibilityBannerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_bannerView));
}

- (UIView)accessibilitySecondaryBannerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_secondaryBannerView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit11ArtworkView)accessibilityArtworkView
{
  return (_TtC11AppStoreKit11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_iconView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDeveloperLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_developerLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTaglineLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_taglineLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTertiaryTitleLabel
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_tertiaryTitleLabel);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_tertiaryTitleLabel, v4, 0, 0);
  return (_TtC11AppStoreKit16DynamicTypeLabel *)*v2;
}

- (_TtC20ProductPageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC20ProductPageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                            + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_offerButton));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityOfferSubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_offerSubtitleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDownloadProgressLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_downloadProgressLabel));
}

- (_TtC20ProductPageExtension12HeaderButton)accessibilityShareButton
{
  return (_TtC20ProductPageExtension12HeaderButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                             + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_shareButton));
}

- (_TtC20ProductPageExtension11ChevronView)accessibilityDisclosureArrow
{
  return (_TtC20ProductPageExtension11ChevronView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                            + OBJC_IVAR____TtC20ProductPageExtension31ProductLockupCollectionViewCell_disclosureArrow));
}

- (_TtC20ProductPageExtension9VideoView)accessibilityVideoView
{
  return (_TtC20ProductPageExtension9VideoView *)(id)sub_10029C29C();
}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension31ProductLockupCollectionViewCell *v2;

  v2 = self;
  sub_10053EF48();

}

@end
