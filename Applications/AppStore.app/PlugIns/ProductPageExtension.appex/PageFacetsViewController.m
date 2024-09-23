@implementation PageFacetsViewController

- (_TtC20ProductPageExtension24PageFacetsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005640A4();
}

- (void)viewDidLoad
{
  _TtC20ProductPageExtension24PageFacetsViewController *v2;

  v2 = self;
  sub_10055ED04();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC20ProductPageExtension24PageFacetsViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1005618D4(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (uint64_t)collectionView:(void *)a3 shouldSelectItemAtIndexPath:(uint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  __n128 v13;
  char v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a1;
  sub_100564198((uint64_t)v10, v13);
  LOBYTE(a1) = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return a1 & 1;
}

- (_TtC20ProductPageExtension24PageFacetsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC20ProductPageExtension24PageFacetsViewController *result;

  v3 = a3;
  result = (_TtC20ProductPageExtension24PageFacetsViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.PageFacetsViewController", 45, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension24PageFacetsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension24PageFacetsViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension24PageFacetsViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.PageFacetsViewController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100010D1C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24PageFacetsViewController_delegate);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24PageFacetsViewController_pageFacets, (uint64_t *)&unk_100816380);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension24PageFacetsViewController_selectedFacetOptions));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24PageFacetsViewController_diffableDataSource));
  swift_release();
}

@end
