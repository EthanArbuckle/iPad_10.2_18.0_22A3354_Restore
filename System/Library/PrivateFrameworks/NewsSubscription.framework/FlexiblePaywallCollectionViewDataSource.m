@implementation FlexiblePaywallCollectionViewDataSource

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource *v7;
  int64_t v8;
  uint64_t v10;

  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource_layoutProvider), *(_QWORD *)&self->layoutProvider[OBJC_IVAR____TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource_layoutProvider+ 16]);
  v6 = a3;
  v7 = self;
  swift_retain();
  sub_1BA4364FC();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(v10 + 16);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_1BA4360C4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA4360A0();
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1BA3EE2A4((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource *v13;
  void *v14;
  uint64_t v16;

  v7 = sub_1BA4360C4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA4360A0();
  v12 = a3;
  v13 = self;
  v14 = (void *)sub_1BA3EE954((uint64_t)v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (_TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource)init
{
  _TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource *result;

  result = (_TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource_layoutProvider);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource_feedItemSupplementaryRenderer);
  sub_1BA3110FC((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource_delegate);
  swift_release();
}

@end
