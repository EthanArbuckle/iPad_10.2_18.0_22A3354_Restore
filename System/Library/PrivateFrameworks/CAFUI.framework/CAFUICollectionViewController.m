@implementation CAFUICollectionViewController

- (_TtC5CAFUI29CAFUICollectionViewController)initWithCoder:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  _TtC5CAFUI29CAFUICollectionViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_emptyView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_itemSize;
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_collectionViewSize;
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = a3;

  result = (_TtC5CAFUI29CAFUICollectionViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC5CAFUI29CAFUICollectionViewController *v2;

  v2 = self;
  CAFUICollectionViewController.viewDidLoad()();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CAFUICollectionViewController();
  v4 = v6.receiver;
  -[CAFUICollectionViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  v5 = objc_msgSend(v4, sel_navigationItem, v6.receiver, v6.super_class);
  objc_msgSend(v5, sel_setRightBarButtonItem_, 0);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  char *v4;

  v4 = (char *)self + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_items;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v4 + 16);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC5CAFUI29CAFUICollectionViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  v12 = (void *)CAFUICollectionViewController.collectionView(_:cellForItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC5CAFUI29CAFUICollectionViewController *v11;
  unint64_t v12;
  char *v13;
  BOOL result;
  uint64_t v15;
  uint64_t v16;
  char v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  v12 = IndexPath.row.getter();
  v13 = (char *)v11 + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_items;
  result = swift_beginAccess();
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v12 < *(_QWORD *)(*(_QWORD *)v13 + 16))
  {
    outlined init with copy of CAFUIImageRepresentableItemProtocol(*(_QWORD *)v13 + 40 * v12 + 32, (uint64_t)v18);
    v15 = v19;
    v16 = v20;
    __swift_project_boxed_opaque_existential_1(v18, v19);
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 32))(v15, v16);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v17 & 1;
  }
  __break(1u);
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC5CAFUI29CAFUICollectionViewController *v11;
  uint64_t v12;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  specialized CAFUICollectionViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _TtC5CAFUI29CAFUICollectionViewController *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  objc_opt_self();
  v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = a3;
    v11 = a4;
    v12 = self;
    objc_msgSend(v9, sel_scrollDirection);

  }
  v13 = 45.0;
  v14 = 2.0;
  v15 = 6.0;
  v16 = 45.0;
  result.right = v16;
  result.bottom = v15;
  result.left = v13;
  result.top = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC5CAFUI29CAFUICollectionViewController *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  CGSize result;

  v8 = type metadata accessor for IndexPath();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = a3;
  v13 = a4;
  v14 = self;
  specialized CAFUICollectionViewController.collectionView(_:layout:sizeForItemAt:)(v12);
  v16 = v15;
  v18 = v17;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (_TtC5CAFUI29CAFUICollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC5CAFUI29CAFUICollectionViewController *result;

  v3 = a3;
  result = (_TtC5CAFUI29CAFUICollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5CAFUI29CAFUICollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5CAFUI29CAFUICollectionViewController *result;

  v4 = a4;
  result = (_TtC5CAFUI29CAFUICollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_emptyView));
}

@end
