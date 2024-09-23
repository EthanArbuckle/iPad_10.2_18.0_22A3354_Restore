@implementation TickerViewController

- (_TtC13FTMInternal_420TickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100181184();
}

- (void)viewDidLoad
{
  _TtC13FTMInternal_420TickerViewController *v2;

  v2 = self;
  sub_100180274();

}

- (void)viewDidAppear:(BOOL)a3
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  _TtC13FTMInternal_420TickerViewController *v6;

  v3 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC13FTMInternal_420TickerViewController_numberValue);
  v6 = self;
  sub_10018075C(v3, (uint64_t)v6, v4, v5);

}

- (_TtC13FTMInternal_420TickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13FTMInternal_420TickerViewController *result;

  v4 = a4;
  result = (_TtC13FTMInternal_420TickerViewController *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.TickerViewController", 34, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_420TickerViewController_numericAlphabet));
  swift_bridgeObjectRelease(*(_QWORD *)&self->numericAlphabet[OBJC_IVAR____TtC13FTMInternal_420TickerViewController_stringValue]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420TickerViewController_collectionView));
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC13FTMInternal_420TickerViewController *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  CGSize result;

  v9 = type metadata accessor for IndexPath(0, a2, a3);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_100181290();
  v17 = v16;
  v19 = v18;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC13FTMInternal_420TickerViewController *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_100181388(v7);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC13FTMInternal_420TickerViewController *v8;
  int64_t v9;

  v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC13FTMInternal_420TickerViewController_stringValue);
  v6 = *(_QWORD *)&self->numericAlphabet[OBJC_IVAR____TtC13FTMInternal_420TickerViewController_stringValue];
  v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain(v6);
  v9 = String.count.getter(v5, v6);

  swift_bridgeObjectRelease(v6);
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13FTMInternal_420TickerViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100180DD0(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

@end
