@implementation MSHistoryItem

- (MSHistoryItem)initWithPosition:(double)a3 positionIndex:(int64_t)a4
{
  if (qword_1ED1AB880 != -1)
    swift_once();
  return -[MSHistoryItem initWithStore:position:positionIndex:](self, sel_initWithStore_position_positionIndex_, qword_1ED1AB9F0, a4, a3);
}

- (MSHistoryItem)initWithStore:(id)a3 position:(double)a4 positionIndex:(int64_t)a5
{
  return (MSHistoryItem *)HistoryItem.init(store:position:positionIndex:)(a3, a5, a4);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  objc_class *v9;
  objc_class *v10;
  MSHistoryItem *v11;

  v5 = a3;
  v11 = self;
  sub_1A4187884(v5);
  type metadata accessor for MapsSyncManagedHistoryItem();
  v6 = swift_dynamicCastClass();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = v5;
    objc_msgSend(v7, sel_position);
    *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR___MSHistoryItem__position) = v9;
    v10 = (objc_class *)objc_msgSend(v7, sel_positionIndex);

    *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = v10;
  }

}

- (double)position
{
  void *v2;
  MSHistoryItem *v3;
  double v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(double *)((char *)&v3->super.super.isa + OBJC_IVAR___MSHistoryItem__position);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPosition:(double)a3
{
  MSHistoryItem *v4;

  v4 = self;
  sub_1A421FE10(a3);

}

- (int64_t)positionIndex
{
  void *v2;
  MSHistoryItem *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  MSHistoryItem *v4;

  v4 = self;
  sub_1A4220094(a3);

}

- (MSHistoryItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSHistoryItem__position) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = 0;
  v8 = a3;
  return (MSHistoryItem *)sub_1A4185C24(a3, a4, a5);
}

+ (void)beforeFetchWithStore:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A4226474();

}

+ (id)optionsWith:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_1A4225B18(a3);

  return v5;
}

+ (void)pruneHistoryItemsWithStore:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A4226474();

}

@end
