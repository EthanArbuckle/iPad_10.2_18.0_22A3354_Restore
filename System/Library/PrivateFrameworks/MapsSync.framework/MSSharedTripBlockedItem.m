@implementation MSSharedTripBlockedItem

- (MSSharedTripBlockedItem)initWithExpiryTime:(int64_t)a3 sharedTripIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  MSSharedTripBlockedItem *v10;

  if (a4)
  {
    sub_1A423C14C();
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  if (qword_1ED1AB880 != -1)
    swift_once();
  v8 = qword_1ED1AB9F0;
  if (v7)
  {
    v9 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = -[MSSharedTripBlockedItem initWithStore:expiryTime:sharedTripIdentifier:](self, sel_initWithStore_expiryTime_sharedTripIdentifier_, v8, a3, v9);

  return v10;
}

- (MSSharedTripBlockedItem)initWithStore:(id)a3 expiryTime:(int64_t)a4 sharedTripIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;

  if (a5)
  {
    v7 = sub_1A423C14C();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = sub_1A40F8F6C(a3, a4, v7, v9);
  swift_bridgeObjectRelease();
  return (MSSharedTripBlockedItem *)v10;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedSharedTripBlockedItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSSharedTripBlockedItem *v7;

  v6 = a3;
  v7 = self;
  sub_1A40F8314(v6, a4);

}

- (int64_t)expiryTime
{
  void *v2;
  MSSharedTripBlockedItem *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSSharedTripBlockedItem__expiryTime);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setExpiryTime:(int64_t)a3
{
  MSSharedTripBlockedItem *v4;

  v4 = self;
  sub_1A40F8550(a3);

}

- (NSString)sharedTripIdentifier
{
  MSSharedTripBlockedItem *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1A40F8820();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setSharedTripIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MSSharedTripBlockedItem *v7;

  if (a3)
  {
    v4 = sub_1A423C14C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1A40F91D8(v4, v6);

  swift_bridgeObjectRelease();
}

- (MSSharedTripBlockedItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  _QWORD *v8;
  id v9;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSSharedTripBlockedItem__expiryTime) = 0;
  v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSSharedTripBlockedItem__sharedTripIdentifier);
  *v8 = 0;
  v8[1] = 0;
  v9 = a3;
  return (MSSharedTripBlockedItem *)sub_1A4185C24(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
