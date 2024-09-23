@implementation ProductMediaItemCollectionViewCell

- (_TtC8AppStore34ProductMediaItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34ProductMediaItemCollectionViewCell *)sub_1005D9FA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore34ProductMediaItemCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  _TtC8AppStore34ProductMediaItemCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_shouldForcePortrait) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_artworkDisplaySize;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  static VideoConfiguration.defaultConfiguration.getter(a3);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_videoView, 0);

  result = (_TtC8AppStore34ProductMediaItemCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ProductMediaItemCollectionViewCell.swift", 49, 2, 90, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC8AppStore34ProductMediaItemCollectionViewCell *v2;

  v2 = self;
  sub_1005DA340();

}

- (void)layoutSubviews
{
  _TtC8AppStore34ProductMediaItemCollectionViewCell *v2;

  v2 = self;
  sub_1005DA4BC();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_borderedScreenshotView));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_configuration;
  v4 = type metadata accessor for VideoConfiguration(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_videoView);
}

@end
