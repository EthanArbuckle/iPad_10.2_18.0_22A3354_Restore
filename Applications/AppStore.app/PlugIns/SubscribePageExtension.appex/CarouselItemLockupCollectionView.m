@implementation CarouselItemLockupCollectionView

- (_TtC22SubscribePageExtension32CarouselItemLockupCollectionView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC22SubscribePageExtension32CarouselItemLockupCollectionView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension32CarouselItemLockupCollectionView_artworkViews) = (Class)_swiftEmptyArrayStorage;
  v5 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension32CarouselItemLockupCollectionView____lazy_storage___artworkViewPool;
  v6 = sub_10000DF3C(&qword_1007FC668);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension32CarouselItemLockupCollectionView_numberOfArtworks) = 0;
  v7 = a3;

  result = (_TtC22SubscribePageExtension32CarouselItemLockupCollectionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/CarouselItemLockupCollectionView.swift", 61, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC22SubscribePageExtension32CarouselItemLockupCollectionView *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  id v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v12.receiver = self;
  v12.super_class = ObjectType;
  v4 = self;
  -[CarouselItemLockupCollectionView layoutSubviews](&v12, "layoutSubviews");
  sub_1002EC474(v9);
  v5 = v10;
  v6 = v11;
  sub_100011064(v9, v10);
  v7 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  v8 = -[CarouselItemLockupCollectionView traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v8, v5, v6, v7);

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension32CarouselItemLockupCollectionView *v5;
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
  sub_1002EC474(v14);
  v7 = v15;
  v8 = v16;
  sub_100011064(v14, v15);
  v9 = dispatch thunk of Placeable.measure(toFit:with:)(v6, v7, v8, width, height);
  v11 = v10;
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v14);

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC22SubscribePageExtension32CarouselItemLockupCollectionView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension32CarouselItemLockupCollectionView *result;

  result = (_TtC22SubscribePageExtension32CarouselItemLockupCollectionView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.CarouselItemLockupCollectionView", 55, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension32CarouselItemLockupCollectionView_artworkViews));
  sub_1002ECBE8((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension32CarouselItemLockupCollectionView____lazy_storage___artworkViewPool);
}

@end
