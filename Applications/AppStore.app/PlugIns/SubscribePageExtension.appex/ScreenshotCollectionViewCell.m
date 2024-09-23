@implementation ScreenshotCollectionViewCell

- (_TtC22SubscribePageExtension28ScreenshotCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28ScreenshotCollectionViewCell *)sub_10031A28C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28ScreenshotCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC22SubscribePageExtension28ScreenshotCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension28ScreenshotCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension28ScreenshotCollectionViewCell_artworkDisplaySize;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v8 = a3;

  result = (_TtC22SubscribePageExtension28ScreenshotCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ScreenshotCollectionViewCell.swift", 57, 2, 60, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension28ScreenshotCollectionViewCell *v2;

  v2 = self;
  sub_10031A4F0();

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension28ScreenshotCollectionViewCell *v2;

  v2 = self;
  sub_10031A5E8();

}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension28ScreenshotCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28ScreenshotCollectionViewCell_borderedScreenshotView));
}

@end
