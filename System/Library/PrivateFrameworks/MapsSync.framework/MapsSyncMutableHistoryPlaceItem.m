@implementation MapsSyncMutableHistoryPlaceItem

- (_TtC8MapsSync31MapsSyncMutableHistoryPlaceItem)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedHistoryPlaceItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync31MapsSyncMutableHistoryPlaceItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (GEOMapItemStorage)mapItemStorage
{
  _TtC8MapsSync31MapsSyncMutableHistoryPlaceItem *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1A418FEE8();
  v4 = v3;

  return (GEOMapItemStorage *)v4;
}

- (void)setMapItemStorage:(id)a3
{
  id v5;
  _TtC8MapsSync31MapsSyncMutableHistoryPlaceItem *v6;

  v5 = a3;
  v6 = self;
  sub_1A4190074(a3);

}

- (NSUUID)supersededSearchId
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _TtC8MapsSync31MapsSyncMutableHistoryPlaceItem *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v17 - v7;
  v9 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync31MapsSyncMutableHistoryPlaceItem__proxyHistory);
  v10 = self;
  v11 = objc_msgSend(v9, sel_supersededSearchId);
  if (v11)
  {
    v12 = v11;
    sub_1A423BFCC();

    v13 = sub_1A423BFE4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 0, 1, v13);
  }
  else
  {
    v13 = sub_1A423BFE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 1, 1, v13);
  }
  sub_1A4190E94((uint64_t)v6, (uint64_t)v8);

  sub_1A423BFE4();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    v15 = (void *)sub_1A423BFC0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }
  return (NSUUID *)v15;
}

- (void)setSupersededSearchId:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC8MapsSync31MapsSyncMutableHistoryPlaceItem *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A423BFCC();
    v8 = sub_1A423BFE4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1A423BFE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1A4190894((uint64_t)v7);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync31MapsSyncMutableHistoryPlaceItem__proxyHistory));
}

@end
