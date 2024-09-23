@implementation ParticipantsCollectionViewDataSource

- (_TtC15ConversationKit36ParticipantsCollectionViewDataSource)init
{
  ParticipantsCollectionViewDataSource.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15ConversationKit36ParticipantsCollectionViewDataSource_didCreateCellForParticipant));
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return ParticipantsCollectionViewDataSource.collectionView(_:numberOfItemsInSection:)((UICollectionView *)self, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15ConversationKit36ParticipantsCollectionViewDataSource *v11;
  void *v12;
  uint64_t v14;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  v12 = (void *)ParticipantsCollectionViewDataSource.collectionView(_:cellForItemAt:)(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

@end
