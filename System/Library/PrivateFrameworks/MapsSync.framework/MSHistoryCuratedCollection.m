@implementation MSHistoryCuratedCollection

- (MSHistoryCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (qword_1ED1AB880 != -1)
    swift_once();
  return -[MSHistoryCuratedCollection initWithStore:curatedCollectionIdentifier:resultProviderIdentifier:](self, sel_initWithStore_curatedCollectionIdentifier_resultProviderIdentifier_, qword_1ED1AB9F0, a3, v4);
}

- (MSHistoryCuratedCollection)initWithStore:(id)a3 curatedCollectionIdentifier:(unint64_t)a4 resultProviderIdentifier:(int)a5
{
  return (MSHistoryCuratedCollection *)HistoryCuratedCollection.init(store:curatedCollectionIdentifier:resultProviderIdentifier:)(a3, a4, a5);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryCuratedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v5;
  MSHistoryCuratedCollection *v6;

  v5 = a3;
  v6 = self;
  sub_1A4132E8C(v5);

}

- (unint64_t)curatedCollectionIdentifier
{
  void *v2;
  MSHistoryCuratedCollection *v3;
  unint64_t v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(unint64_t *)((char *)&v3->super.super.super.isa
                           + OBJC_IVAR___MSHistoryCuratedCollection__curatedCollectionIdentifier);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setCuratedCollectionIdentifier:(unint64_t)a3
{
  MSHistoryCuratedCollection *v4;

  v4 = self;
  sub_1A41324C4(a3);

}

- (int)resultProviderIdentifier
{
  void *v2;
  MSHistoryCuratedCollection *v3;
  int v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(_DWORD *)((char *)&v3->super.super.super.isa + OBJC_IVAR___MSHistoryCuratedCollection__resultProviderIdentifier);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setResultProviderIdentifier:(int)a3
{
  MSHistoryCuratedCollection *v4;

  v4 = self;
  sub_1A413282C(a3);

}

- (MSHistoryCuratedCollection)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryCuratedCollection__curatedCollectionIdentifier) = 0;
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryCuratedCollection__resultProviderIdentifier) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__position) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = 0;
  v8 = a3;
  return (MSHistoryCuratedCollection *)sub_1A4185C24(a3, a4, a5);
}

@end
