@implementation MSCollectionTransitItem

- (MSCollectionTransitItem)initWithMuid:(unint64_t)a3 transitLineStorage:(id)a4
{
  uint64_t v4;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  MSCollectionTransitItem *v12;

  v4 = (uint64_t)a4;
  if (a4)
  {
    v7 = a4;
    v4 = sub_1A423BF54();
    v9 = v8;

  }
  else
  {
    v9 = 0xF000000000000000;
  }
  if (qword_1ED1AB880 != -1)
    swift_once();
  v10 = qword_1ED1AB9F0;
  if (v9 >> 60 == 15)
  {
    v11 = 0;
  }
  else
  {
    sub_1A40D7734(v4, v9);
    v11 = (void *)sub_1A423BF48();
    sub_1A40D7778(v4, v9);
  }
  v12 = -[MSCollectionTransitItem initWithStore:muid:transitLineStorage:](self, sel_initWithStore_muid_transitLineStorage_, v10, a3, v11);
  sub_1A40D7778(v4, v9);

  return v12;
}

- (MSCollectionTransitItem)initWithStore:(id)a3 muid:(unint64_t)a4 transitLineStorage:(id)a5
{
  void *v5;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v5 = a5;
  if (a5)
  {
    v8 = a3;
    v9 = v5;
    v5 = (void *)sub_1A423BF54();
    v11 = v10;

  }
  else
  {
    v12 = a3;
    v11 = 0xF000000000000000;
  }
  return (MSCollectionTransitItem *)CollectionTransitItem.init(store:muid:transitLineStorage:)(a3, a4, (uint64_t)v5, v11);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCollectionTransitItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSCollectionTransitItem *v7;

  v6 = a3;
  v7 = self;
  sub_1A4160AF8(v6, a4);

}

- (unint64_t)muid
{
  void *v2;
  MSCollectionTransitItem *v3;
  unint64_t v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(unint64_t *)((char *)&v3->super.super.super.isa + OBJC_IVAR___MSCollectionTransitItem__muid);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setMuid:(unint64_t)a3
{
  MSCollectionTransitItem *v4;

  v4 = self;
  sub_1A4160D64(a3);

}

- (NSData)transitLineStorage
{
  MSCollectionTransitItem *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1A4161040();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_1A423BF48();
    sub_1A40D7778(v3, v5);
  }
  return (NSData *)v6;
}

- (void)setTransitLineStorage:(id)a3
{
  void *v3;
  MSCollectionTransitItem *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  MSCollectionTransitItem *v8;

  v3 = a3;
  if (a3)
  {
    v4 = self;
    v5 = v3;
    v3 = (void *)sub_1A423BF54();
    v7 = v6;

  }
  else
  {
    v8 = self;
    v7 = 0xF000000000000000;
  }
  sub_1A41618B4((uint64_t)v3, v7);
  sub_1A40D7778((uint64_t)v3, v7);

}

- (MSCollectionTransitItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionTransitItem__muid) = 0;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionTransitItem__transitLineStorage) = xmmword_1A4243680;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionItem__positionIndex) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionItem__collectionChanges) = (Class)MEMORY[0x1E0DEE9D8];
  v8 = a3;
  return (MSCollectionTransitItem *)sub_1A4185C24(a3, a4, a5);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionTransitItem__transitLineStorage), *(_QWORD *)&self->super.super._store[OBJC_IVAR___MSCollectionTransitItem__transitLineStorage]);
}

@end
