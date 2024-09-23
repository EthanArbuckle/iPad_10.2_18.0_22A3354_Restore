@implementation LargeLockupCollectionViewCell

- (_TtC22SubscribePageExtension29LargeLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension29LargeLockupCollectionViewCell *)sub_1001FE718(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension29LargeLockupCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _TtC22SubscribePageExtension29LargeLockupCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_avatarShowcase) = 0;
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_preferredArtworkSize);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_headingLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_tertiaryTitleLabel) = 0;
  v8 = a3;

  result = (_TtC22SubscribePageExtension29LargeLockupCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/LargeLockupCollectionViewCell.swift", 58, 2, 55, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension29LargeLockupCollectionViewCell *v2;

  v2 = self;
  sub_1001FEC84();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_subtitleLabel));
}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29LargeLockupCollectionViewCell_tertiaryTitleLabel));
}

@end
