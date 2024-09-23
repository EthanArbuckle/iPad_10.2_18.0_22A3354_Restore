@implementation PageFacetsViewController

- (_TtC22SubscribePageExtension24PageFacetsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10033C32C();
}

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension24PageFacetsViewController *v2;

  v2 = self;
  sub_100336FB4();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC22SubscribePageExtension24PageFacetsViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100339BA8(v11, (uint64_t)v10);

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
  sub_10033C420((uint64_t)v10, v13);
  LOBYTE(a1) = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return a1 & 1;
}

- (_TtC22SubscribePageExtension24PageFacetsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC22SubscribePageExtension24PageFacetsViewController *result;

  v3 = a3;
  result = (_TtC22SubscribePageExtension24PageFacetsViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.PageFacetsViewController", 47, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension24PageFacetsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension24PageFacetsViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension24PageFacetsViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.PageFacetsViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension24PageFacetsViewController_objectGraph));
  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24PageFacetsViewController_delegate);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24PageFacetsViewController_pageFacets, (uint64_t *)&unk_100804D90);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension24PageFacetsViewController_selectedFacetOptions));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension24PageFacetsViewController_facetsPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24PageFacetsViewController_diffableDataSource));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension24PageFacetsViewController_actionRunner));
}

@end
