@implementation CategoryListViewController

- (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_selectionHandler);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_placeholderImage) = 0;
  v5 = a3;

  result = (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/SelectCategoryViewController.swift", 55, 2, 187, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *v2;

  v2 = self;
  sub_1005C5B4C();

}

- (void)as_viewWillBecomeFullyVisible
{
  sub_1005C5E20(self, (uint64_t)a2, (const char **)&selRef_as_viewWillBecomeFullyVisible, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = v8.receiver;
  -[CategoryListViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v5 = ArtworkLoader.isOccluded.setter(0);
  v6 = 0;
  if (!IndexPath.count.getter(v5))
    v6 = objc_msgSend(v4, "_isInPopoverPresentation", v8.receiver, v8.super_class);
  v7 = objc_msgSend(v4, "navigationController", v8.receiver, v8.super_class);
  objc_msgSend(v7, "setNavigationBarHidden:animated:", v6, 0);

}

- (void)as_viewDidBecomePartiallyVisible
{
  sub_1005C5E20(self, (uint64_t)a2, (const char **)&selRef_as_viewDidBecomePartiallyVisible, 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[CategoryListViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  ArtworkLoader.isOccluded.setter(1);

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[CategoryListViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)dismissSelf
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *v5;

  v5 = self;
  -[CategoryListViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);
  v2 = (Class *)((char *)&v5->super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_selectionHandler);
  v3 = *(uint64_t *)((char *)&v5->super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_selectionHandler);
  v4 = *(_QWORD *)&v5->dataSource[OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_selectionHandler];
  *v2 = 0;
  v2[1] = 0;
  sub_100018908(v3, v4);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *v11;
  int64_t v12;

  v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_dataSource);
  v7 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_parentIndexPath;
  v8 = v6[5];
  v9 = v6[6];
  sub_100010F08(v6 + 2, v8);
  v10 = a3;
  v11 = self;
  v12 = dispatch thunk of TopChartsCategoriesPresenter.categoryCount(at:)(v7, v8, v9);

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1005C6050(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  id v13;
  id v14;
  _TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  _BYTE v20[40];

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = objc_msgSend(v14, "imageView");
  if (v16)
  {
    v19 = v16;
    v17 = sub_10007B378();
    v18 = sub_10007B3B4();
    AnyHashable.init<A>(_:)(&v19, v17, v18);
    ArtworkLoader.forgetFetch(forHandlerKey:deprioritizingFetch:)(v20, 1);
    sub_100018968((uint64_t)v20);

    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    __break(1u);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1005C6B84();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController)initWithStyle:(int64_t)a3
{
  _TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *result;

  result = (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.CategoryListViewController", 47, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_1005C67F4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"ProductPageExtension.CategoryListViewController", 47);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_parentIndexPath;
  v4 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_selectionHandler), *(_QWORD *)&self->dataSource[OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_selectionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_placeholderImage));
}

@end
