@implementation PageFacetOptionsViewController

- (_TtC8AppStore30PageFacetOptionsViewController)initWithCoder:(id)a3
{
  char *v5;
  char *v6;
  id v7;
  _TtC8AppStore30PageFacetOptionsViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_diffableDataSource) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_preselectionContentOffset;
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v7 = a3;

  result = (_TtC8AppStore30PageFacetOptionsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/PageFacetOptionsViewController.swift", 45, 2, 68, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8AppStore30PageFacetOptionsViewController *v2;

  v2 = self;
  sub_10062EE04();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore30PageFacetOptionsViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10062F7C8(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC8AppStore30PageFacetOptionsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC8AppStore30PageFacetOptionsViewController *result;

  v3 = a3;
  result = (_TtC8AppStore30PageFacetOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.PageFacetOptionsViewController", 39, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore30PageFacetOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore30PageFacetOptionsViewController *result;

  v4 = a4;
  result = (_TtC8AppStore30PageFacetOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.PageFacetOptionsViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_delegate);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_facet;
  v4 = type metadata accessor for PageFacets.Facet(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_selectedFacetOptions));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_diffableDataSource));
}

@end
