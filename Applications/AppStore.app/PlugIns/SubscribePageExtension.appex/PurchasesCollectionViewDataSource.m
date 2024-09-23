@implementation PurchasesCollectionViewDataSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension33PurchasesCollectionViewDataSource *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = PurchasesContentPresenter.sectionCount.getter(v5);

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v6;
  id v7;
  _TtC22SubscribePageExtension33PurchasesCollectionViewDataSource *v8;
  int64_t v9;

  v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension33PurchasesCollectionViewDataSource_pageTraits);
  v7 = a3;
  v8 = self;
  swift_unknownObjectRetain(v6);
  v9 = sub_10034CA90(a4);

  swift_unknownObjectRelease(v6);
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC22SubscribePageExtension33PurchasesCollectionViewDataSource *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100318208((uint64_t)v10, v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC22SubscribePageExtension33PurchasesCollectionViewDataSource)init
{
  _TtC22SubscribePageExtension33PurchasesCollectionViewDataSource *result;

  result = (_TtC22SubscribePageExtension33PurchasesCollectionViewDataSource *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.PurchasesCollectionViewDataSource", 56, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension33PurchasesCollectionViewDataSource_shelfDataSource));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension33PurchasesCollectionViewDataSource_presenter));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension33PurchasesCollectionViewDataSource_pageTraits));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension33PurchasesCollectionViewDataSource_objectGraph));
}

@end
