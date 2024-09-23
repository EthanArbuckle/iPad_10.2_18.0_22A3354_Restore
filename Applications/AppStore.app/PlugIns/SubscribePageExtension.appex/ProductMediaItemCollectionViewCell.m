@implementation ProductMediaItemCollectionViewCell

- (_TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell *)sub_10038E074(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  _TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell_shouldForcePortrait) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell_artworkDisplaySize;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  static VideoConfiguration.defaultConfiguration.getter(a3);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell_videoView, 0);

  result = (_TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ProductMediaItemCollectionViewCell.swift", 63, 2, 90, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell *v2;

  v2 = self;
  sub_10038E40C();

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell *v2;

  v2 = self;
  sub_10038E588();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell_borderedScreenshotView));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell_configuration;
  v5 = type metadata accessor for VideoConfiguration(0, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension34ProductMediaItemCollectionViewCell_videoView);
}

@end
