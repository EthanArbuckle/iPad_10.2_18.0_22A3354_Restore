@implementation SearchHintsCollectionViewDataSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  _TtC22SubscribePageExtension35SearchHintsCollectionViewDataSource *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = dispatch thunk of SearchHintsPresenter.resultCount.getter();

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC22SubscribePageExtension35SearchHintsCollectionViewDataSource *v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  Class isa;
  id v17;
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  type metadata accessor for SearchHintCollectionViewCell();
  v11 = a3;
  v12 = self;
  static UICollectionReusableView.defaultReuseIdentifier.getter();
  v14 = v13;
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v17 = objc_msgSend(v11, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v15, isa);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v17;
}

- (_TtC22SubscribePageExtension35SearchHintsCollectionViewDataSource)init
{
  _TtC22SubscribePageExtension35SearchHintsCollectionViewDataSource *result;

  result = (_TtC22SubscribePageExtension35SearchHintsCollectionViewDataSource *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.SearchHintsCollectionViewDataSource", 58, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension35SearchHintsCollectionViewDataSource_presenter));
}

@end
