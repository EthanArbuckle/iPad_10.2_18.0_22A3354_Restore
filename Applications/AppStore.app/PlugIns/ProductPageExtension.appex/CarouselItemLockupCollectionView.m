@implementation CarouselItemLockupCollectionView

- (_TtC20ProductPageExtension32CarouselItemLockupCollectionView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension32CarouselItemLockupCollectionView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension32CarouselItemLockupCollectionView_artworkViews) = (Class)_swiftEmptyArrayStorage;
  v5 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtension32CarouselItemLockupCollectionView____lazy_storage___artworkViewPool;
  v6 = sub_10000DAF8((uint64_t *)&unk_100811760);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension32CarouselItemLockupCollectionView_numberOfArtworks) = 0;
  v7 = a3;

  result = (_TtC20ProductPageExtension32CarouselItemLockupCollectionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/CarouselItemLockupCollectionView.swift", 59, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC20ProductPageExtension32CarouselItemLockupCollectionView *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v18.receiver = self;
  v18.super_class = ObjectType;
  v4 = self;
  -[CarouselItemLockupCollectionView layoutSubviews](&v18, "layoutSubviews");
  sub_1004ACF30(v15);
  v5 = v16;
  v6 = v17;
  sub_100010F08(v15, v16);
  v7 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[CarouselItemLockupCollectionView traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v14, v5, v6, v7, v9, v11, v13);

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v15);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension32CarouselItemLockupCollectionView *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[CarouselItemLockupCollectionView traitCollection](v5, "traitCollection");
  sub_1004ACF30(v14);
  v7 = v15;
  v8 = v16;
  sub_100010F08(v14, v15);
  v9 = dispatch thunk of Placeable.measure(toFit:with:)(v6, v7, v8, width, height);
  v11 = v10;
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v14);

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC20ProductPageExtension32CarouselItemLockupCollectionView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension32CarouselItemLockupCollectionView *result;

  result = (_TtC20ProductPageExtension32CarouselItemLockupCollectionView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.CarouselItemLockupCollectionView", 53, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension32CarouselItemLockupCollectionView_artworkViews));
  sub_1004AD6A4((uint64_t)self+ OBJC_IVAR____TtC20ProductPageExtension32CarouselItemLockupCollectionView____lazy_storage___artworkViewPool);
}

@end
