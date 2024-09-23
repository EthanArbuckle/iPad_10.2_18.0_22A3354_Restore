@implementation ScreenshotCollectionViewCell

- (_TtC20ProductPageExtension28ScreenshotCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension28ScreenshotCollectionViewCell *)sub_1002F8090(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension28ScreenshotCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC20ProductPageExtension28ScreenshotCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension28ScreenshotCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension28ScreenshotCollectionViewCell_artworkDisplaySize;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v8 = a3;

  result = (_TtC20ProductPageExtension28ScreenshotCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ScreenshotCollectionViewCell.swift", 55, 2, 60, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension28ScreenshotCollectionViewCell *v2;

  v2 = self;
  sub_1002F82F4();

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension28ScreenshotCollectionViewCell *v2;

  v2 = self;
  sub_1002F83EC();

}

- (void).cxx_destruct
{
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension28ScreenshotCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28ScreenshotCollectionViewCell_borderedScreenshotView));
}

@end
