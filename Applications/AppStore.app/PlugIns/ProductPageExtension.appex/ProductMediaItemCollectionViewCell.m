@implementation ProductMediaItemCollectionViewCell

- (_TtC20ProductPageExtension34ProductMediaItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension34ProductMediaItemCollectionViewCell *)sub_10036F1B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension34ProductMediaItemCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  _TtC20ProductPageExtension34ProductMediaItemCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_shouldForcePortrait) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_artworkDisplaySize;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  static VideoConfiguration.defaultConfiguration.getter(a3);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_videoView, 0);

  result = (_TtC20ProductPageExtension34ProductMediaItemCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ProductMediaItemCollectionViewCell.swift", 61, 2, 90, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension34ProductMediaItemCollectionViewCell *v2;

  v2 = self;
  sub_10036F54C();

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension34ProductMediaItemCollectionViewCell *v2;

  v2 = self;
  sub_10036F6C8();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_borderedScreenshotView));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_configuration;
  v4 = type metadata accessor for VideoConfiguration(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_videoView);
}

@end
