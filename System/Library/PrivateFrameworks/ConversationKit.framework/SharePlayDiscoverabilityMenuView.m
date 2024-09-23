@implementation SharePlayDiscoverabilityMenuView

- (_TtC15ConversationKit32SharePlayDiscoverabilityMenuView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SharePlayDiscoverabilityMenuView.init(coder:)();
}

- (_TtC15ConversationKit32SharePlayDiscoverabilityMenuView)initWithFrame:(CGRect)a3
{
  SharePlayDiscoverabilityMenuView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32SharePlayDiscoverabilityMenuView____lazy_storage___titleLabel));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit32SharePlayDiscoverabilityMenuView____lazy_storage___moreButton);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit32SharePlayDiscoverabilityMenuView____lazy_storage___appCellRegistration, (uint64_t *)&demangling cache variable for type metadata for UICollectionView.CellRegistration<UICollectionViewCell, Application>?);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit32SharePlayDiscoverabilityMenuView____lazy_storage___collectionViewLayout);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit32SharePlayDiscoverabilityMenuView____lazy_storage___collectionView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32SharePlayDiscoverabilityMenuView_foregroundApp));
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  _TtC15ConversationKit32SharePlayDiscoverabilityMenuView *v6;
  Swift::Int v7;
  Swift::Int v8;

  v5 = a3;
  v6 = self;
  v8 = SharePlayDiscoverabilityMenuView.collectionView(_:numberOfItemsInSection:)((UICollectionView *)v6, v7);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15ConversationKit32SharePlayDiscoverabilityMenuView *v11;
  void *v12;
  uint64_t v14;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  v12 = (void *)SharePlayDiscoverabilityMenuView.collectionView(_:cellForItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)didTapMore
{
  _TtC15ConversationKit32SharePlayDiscoverabilityMenuView *v2;

  v2 = self;
  SharePlayDiscoverabilityMenuView.didTapMore()();

}

@end
