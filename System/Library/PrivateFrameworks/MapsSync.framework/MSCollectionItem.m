@implementation MSCollectionItem

- (MSCollectionItem)initWithPositionIndex:(int64_t)a3
{
  if (qword_1ED1AB880 != -1)
    swift_once();
  return -[MSCollectionItem initWithStore:positionIndex:](self, sel_initWithStore_positionIndex_, qword_1ED1AB9F0, a3);
}

- (MSCollectionItem)initWithStore:(id)a3 positionIndex:(int64_t)a4
{
  return (MSCollectionItem *)CollectionItem.init(store:positionIndex:)(a3, a4);
}

- (void)flushChanges
{
  _QWORD *v3;
  uint64_t v4;
  MSCollectionItem *v5;
  _QWORD *v6;

  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  v4 = MEMORY[0x1E0DEE9D8];
  *v3 = MEMORY[0x1E0DEE9D8];
  v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR___MSCollectionItem__collectionChanges);
  swift_beginAccess();
  *v6 = v4;

  swift_bridgeObjectRelease();
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCollectionItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v5;
  void *v6;
  objc_class *v7;
  MSCollectionItem *v8;

  v5 = a3;
  v8 = self;
  sub_1A4187884(v5);
  type metadata accessor for MapsSyncManagedCollectionItem();
  v6 = (void *)swift_dynamicCastClass();
  if (v6)
  {
    v7 = (objc_class *)objc_msgSend(v6, sel_positionIndex);
    *(Class *)((char *)&v8->super.super.isa + OBJC_IVAR___MSCollectionItem__positionIndex) = v7;
  }

}

- (int64_t)positionIndex
{
  void *v2;
  MSCollectionItem *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCollectionItem__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  MSCollectionItem *v4;

  v4 = self;
  sub_1A40CE050(a3);

}

- (id)fetchCollections
{
  MSCollectionItem *v2;
  void *v3;

  v2 = self;
  sub_1A40CE364();

  type metadata accessor for Collection();
  v3 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)addCollection:(id)a3
{
  id v4;
  MSCollectionItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A40CEB18(v4, 0, (uint64_t)sub_1A40CEA1C, 0);

}

- (void)removeCollection:(id)a3
{
  id v4;
  MSCollectionItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A40CEB18(v4, 1, (uint64_t)sub_1A40CEAA4, 0);

}

- (MSCollectionItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollectionItem__positionIndex) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollectionItem__collectionChanges) = (Class)MEMORY[0x1E0DEE9D8];
  v8 = a3;
  return (MSCollectionItem *)sub_1A4185C24(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (MSCollectionItem)initWithCollection:(id)a3
{
  id v4;
  MSCollectionItem *v5;

  v4 = a3;
  v5 = -[MapsSyncObject init](self, sel_init);
  sub_1A40CEB18(v4, 0, (uint64_t)sub_1A40CEA1C, 0);

  return v5;
}

@end
