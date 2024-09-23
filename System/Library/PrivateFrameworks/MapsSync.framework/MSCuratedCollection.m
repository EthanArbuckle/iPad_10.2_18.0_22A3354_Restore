@implementation MSCuratedCollection

- (MSCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 positionIndex:(int64_t)a4 resultProviderIdentifier:(int)a5
{
  uint64_t v5;

  v5 = *(_QWORD *)&a5;
  if (qword_1ED1AB880 != -1)
    swift_once();
  return -[MSCuratedCollection initWithStore:curatedCollectionIdentifier:positionIndex:resultProviderIdentifier:](self, sel_initWithStore_curatedCollectionIdentifier_positionIndex_resultProviderIdentifier_, qword_1ED1AB9F0, a3, a4, v5);
}

- (MSCuratedCollection)initWithStore:(id)a3 curatedCollectionIdentifier:(unint64_t)a4 positionIndex:(int64_t)a5 resultProviderIdentifier:(int)a6
{
  return (MSCuratedCollection *)CuratedCollection.init(store:curatedCollectionIdentifier:positionIndex:resultProviderIdentifier:)(a3, a4, a5, a6);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCuratedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v5;
  MSCuratedCollection *v6;

  v5 = a3;
  v6 = self;
  sub_1A4213694(v5);

}

- (unint64_t)curatedCollectionIdentifier
{
  void *v2;
  MSCuratedCollection *v3;
  unint64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(unint64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCuratedCollection__curatedCollectionIdentifier);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setCuratedCollectionIdentifier:(unint64_t)a3
{
  MSCuratedCollection *v4;

  v4 = self;
  sub_1A42128B4(a3);

}

- (int64_t)positionIndex
{
  void *v2;
  MSCuratedCollection *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCuratedCollection__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  MSCuratedCollection *v4;

  v4 = self;
  sub_1A4212BCC(a3);

}

- (int)resultProviderIdentifier
{
  void *v2;
  MSCuratedCollection *v3;
  int v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(_DWORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCuratedCollection__resultProviderIdentifier);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setResultProviderIdentifier:(int)a3
{
  MSCuratedCollection *v4;

  v4 = self;
  sub_1A4212F40(a3);

}

- (MSCuratedCollection)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCuratedCollection__curatedCollectionIdentifier) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCuratedCollection__positionIndex) = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSCuratedCollection__resultProviderIdentifier) = 0;
  v8 = a3;
  return (MSCuratedCollection *)sub_1A4185C24(a3, a4, a5);
}

@end
