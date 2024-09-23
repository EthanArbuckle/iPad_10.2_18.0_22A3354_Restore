@implementation PageFacetOptionsViewController

- (_TtC22SubscribePageExtension30PageFacetOptionsViewController)initWithCoder:(id)a3
{
  char *v5;
  char *v6;
  id v7;
  _TtC22SubscribePageExtension30PageFacetOptionsViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_diffableDataSource) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_preselectionContentOffset;
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v7 = a3;

  result = (_TtC22SubscribePageExtension30PageFacetOptionsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/PageFacetOptionsViewController.swift", 59, 2, 68, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension30PageFacetOptionsViewController *v2;

  v2 = self;
  sub_1001CE4FC();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC22SubscribePageExtension30PageFacetOptionsViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1001CEEC0(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC22SubscribePageExtension30PageFacetOptionsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC22SubscribePageExtension30PageFacetOptionsViewController *result;

  v3 = a3;
  result = (_TtC22SubscribePageExtension30PageFacetOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.PageFacetOptionsViewController", 53, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension30PageFacetOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension30PageFacetOptionsViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension30PageFacetOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.PageFacetOptionsViewController", 53, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_facetsPresenter));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_facet;
  v4 = type metadata accessor for PageFacets.Facet(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_selectedFacetOptions));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_diffableDataSource));
}

@end
