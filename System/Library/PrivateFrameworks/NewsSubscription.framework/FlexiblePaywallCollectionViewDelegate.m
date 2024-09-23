@implementation FlexiblePaywallCollectionViewDelegate

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate *v15;
  id v16;
  uint64_t v17;

  v8 = sub_1BA4360C4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA4360A0();
  swift_getObjectType();
  if (swift_conformsToProtocol2())
    v13 = a4;
  else
    v13 = 0;
  if (v13)
  {
    v17 = v8;
    v14 = a4;
    v16 = a3;
    v15 = self;
    sub_1BA4370D8();
    swift_getObjectType();
    sub_1BA437318();
    sub_1BA43730C();
    v8 = v17;
    sub_1BA437294();

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate *v15;
  id v16;
  uint64_t v17;

  v8 = sub_1BA4360C4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA4360A0();
  swift_getObjectType();
  if (swift_conformsToProtocol2())
    v13 = a4;
  else
    v13 = 0;
  if (v13)
  {
    v17 = v8;
    v14 = a4;
    v16 = a3;
    v15 = self;
    sub_1BA4370F0();
    swift_getObjectType();
    sub_1BA437318();
    sub_1BA43730C();
    v8 = v17;
    sub_1BA4372A0();

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  id v16;
  _TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate *v17;
  uint64_t v18;

  v9 = sub_1BA4360C4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA4360A0();
  swift_getObjectType();
  if (swift_conformsToProtocol2())
    v14 = a4;
  else
    v14 = 0;
  if (v14)
  {
    v15 = a3;
    v16 = a4;
    v17 = self;
    sub_1BA4370D8();
    swift_getObjectType();
    sub_1BA4372AC();

  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  id v16;
  _TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate *v17;
  uint64_t v18;

  v9 = sub_1BA4360C4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA4360A0();
  swift_getObjectType();
  if (swift_conformsToProtocol2())
    v14 = a4;
  else
    v14 = 0;
  if (v14)
  {
    v15 = a3;
    v16 = a4;
    v17 = self;
    sub_1BA4370F0();
    swift_getObjectType();
    sub_1BA4372B8();

  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (_TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  _TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate *v7;
  id v8;
  objc_super v10;
  uint64_t v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = sub_1BA4370FC();
  MEMORY[0x1E0C80A78](v4, MEMORY[0x1E0DB9E20]);
  v5 = OBJC_IVAR____TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate_viewportMonitor;
  v11 = MEMORY[0x1E0DEE9D8];
  sub_1BA2F25C8((unint64_t *)&unk_1ED5C1BF0, v6, MEMORY[0x1E0DB9E28]);
  sub_1BA43011C();
  sub_1BA2F25C8((unint64_t *)&unk_1ED5C1C70, (uint64_t (*)(uint64_t))sub_1BA43011C, MEMORY[0x1E0DEAF38]);
  v7 = self;
  sub_1BA438104();
  v8 = objc_allocWithZone((Class)sub_1BA437114());
  *(Class *)((char *)&self->super.isa + v5) = (Class)sub_1BA437108();

  v10.receiver = v7;
  v10.super_class = ObjectType;
  return -[FlexiblePaywallCollectionViewDelegate init](&v10, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate_viewportMonitor));
}

@end
