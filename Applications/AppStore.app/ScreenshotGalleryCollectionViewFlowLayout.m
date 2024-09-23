@implementation ScreenshotGalleryCollectionViewFlowLayout

- (_TtC8AppStore41ScreenshotGalleryCollectionViewFlowLayout)init
{
  char *v3;
  uint64_t v4;
  _TtC8AppStore41ScreenshotGalleryCollectionViewFlowLayout *v5;
  objc_super v7;

  v3 = (char *)self + OBJC_IVAR____TtC8AppStore41ScreenshotGalleryCollectionViewFlowLayout_indexPathAtInitialScroll;
  v4 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ScreenshotGalleryCollectionViewFlowLayout(0);
  v5 = -[ScreenshotGalleryCollectionViewFlowLayout init](&v7, "init");
  -[ScreenshotGalleryCollectionViewFlowLayout setScrollDirection:](v5, "setScrollDirection:", 1);
  return v5;
}

- (_TtC8AppStore41ScreenshotGalleryCollectionViewFlowLayout)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore41ScreenshotGalleryCollectionViewFlowLayout *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore41ScreenshotGalleryCollectionViewFlowLayout_indexPathAtInitialScroll;
  v6 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC8AppStore41ScreenshotGalleryCollectionViewFlowLayout *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ScreenshotGalleryCollectionViewFlowLayout.swift", 56, 2, 36, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  _TtC8AppStore41ScreenshotGalleryCollectionViewFlowLayout *v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v2 = self;
  v3 = -[ScreenshotGalleryCollectionViewFlowLayout collectionView](v2, "collectionView");
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "panGestureRecognizer");

    objc_msgSend(v5, "removeTarget:action:", v2, 0);
  }
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ScreenshotGalleryCollectionViewFlowLayout(0);
  -[ScreenshotGalleryCollectionViewFlowLayout dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  sub_1000E20E4((uint64_t)self + OBJC_IVAR____TtC8AppStore41ScreenshotGalleryCollectionViewFlowLayout_indexPathAtInitialScroll);
}

- (void)prepareLayout
{
  _TtC8AppStore41ScreenshotGalleryCollectionViewFlowLayout *v2;

  v2 = self;
  sub_1004702A8();

}

- (void)prepareForTransitionToLayout:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ScreenshotGalleryCollectionViewFlowLayout(0);
  v4 = a3;
  v5 = v9.receiver;
  -[ScreenshotGalleryCollectionViewFlowLayout prepareForTransitionToLayout:](&v9, "prepareForTransitionToLayout:", v4);
  v6 = objc_msgSend(v5, "collectionView", v9.receiver, v9.super_class);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "panGestureRecognizer");

    objc_msgSend(v8, "removeTarget:action:", v5, 0);
    v4 = v5;
    v5 = v8;
  }

}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  _TtC8AppStore41ScreenshotGalleryCollectionViewFlowLayout *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v8 = self;
  sub_1004704A0(v7, v6, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)panGestureRecognizedBy:(id)a3
{
  id v4;
  _TtC8AppStore41ScreenshotGalleryCollectionViewFlowLayout *v5;

  v4 = a3;
  v5 = self;
  sub_100470A8C(v4);

}

@end
