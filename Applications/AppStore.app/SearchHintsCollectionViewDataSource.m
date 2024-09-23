@implementation SearchHintsCollectionViewDataSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  _TtC8AppStore35SearchHintsCollectionViewDataSource *v6;
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
  _TtC8AppStore35SearchHintsCollectionViewDataSource *v12;
  __n128 v13;
  uint64_t v14;
  uint64_t v15;
  NSString v16;
  Class isa;
  id v18;
  uint64_t v20;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  type metadata accessor for SearchHintCollectionViewCell();
  v11 = a3;
  v12 = self;
  static UICollectionReusableView.defaultReuseIdentifier.getter(v13);
  v15 = v14;
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v18 = objc_msgSend(v11, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v16, isa);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v18;
}

- (_TtC8AppStore35SearchHintsCollectionViewDataSource)init
{
  _TtC8AppStore35SearchHintsCollectionViewDataSource *result;

  result = (_TtC8AppStore35SearchHintsCollectionViewDataSource *)_swift_stdlib_reportUnimplementedInitializer("AppStore.SearchHintsCollectionViewDataSource", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8AppStore35SearchHintsCollectionViewDataSource_presenter));
}

@end
