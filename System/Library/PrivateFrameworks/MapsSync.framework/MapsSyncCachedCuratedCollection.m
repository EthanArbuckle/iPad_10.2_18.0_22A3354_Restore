@implementation MapsSyncCachedCuratedCollection

- (_TtC8MapsSync31MapsSyncCachedCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4
{
  return (_TtC8MapsSync31MapsSyncCachedCuratedCollection *)MapsSyncCachedCuratedCollection.init(curatedCollectionIdentifier:resultProviderIdentifier:)(a3, a4);
}

- (_TtC8MapsSync31MapsSyncCachedCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3
{
  return -[MapsSyncCachedCuratedCollection initWithCuratedCollectionIdentifier:resultProviderIdentifier:](self, sel_initWithCuratedCollectionIdentifier_resultProviderIdentifier_, a3, 0);
}

- (_TtC8MapsSync31MapsSyncCachedCuratedCollection)initWithObject:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC8MapsSync31MapsSyncCachedCuratedCollection *)sub_1A4119260(a3);
}

- (int64_t)identifierHash
{
  sub_1A423C8B4();
  sub_1A423C890();
  sub_1A423C884();
  return sub_1A423C89C();
}

- (NSString)collectionDescription
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__collectionDescription);
}

- (NSData)image
{
  uint64_t *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__image);
  v3 = *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__image];
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    v5 = *v2;
    sub_1A40D7734(*v2, v3);
    v4 = (void *)sub_1A423BF48();
    sub_1A40D7778(v5, v3);
  }
  return (NSData *)v4;
}

- (NSString)imageUrl
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__imageUrl);
}

- (NSString)title
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__title);
}

- (unint64_t)curatedCollectionIdentifier
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__curatedCollectionIdentifier);
}

- (BOOL)isTombstone
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__isTombstone);
}

- (NSDate)lastFetchedDate
{
  return (NSDate *)sub_1A4119578((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__lastFetchedDate);
}

- (NSDate)lastSignificantChangeDate
{
  return (NSDate *)sub_1A4119578((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__lastSignificantChangeDate);
}

- (int)placesCount
{
  return *(_DWORD *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__placesCount);
}

- (NSString)publisherAttribution
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__publisherAttribution);
}

- (NSString)titleLocale
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__titleLocale);
}

- (int)resultProviderIdentifier
{
  return *(_DWORD *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__resultProviderIdentifier);
}

- (_TtC8MapsSync19MapsSyncDataSession)session
{
  uint64_t v3;
  _TtC8MapsSync31MapsSyncCachedCuratedCollection *v4;
  uint64_t *v5;
  uint64_t v6;
  _TtC8MapsSync31MapsSyncCachedCuratedCollection *v7;
  _TtC8MapsSync19MapsSyncDataSession *v8;

  if (byte_1EE70EEE8 == 1)
  {
    v3 = qword_1EE70E270;
    v4 = self;
    if (v3 != -1)
      swift_once();
    v5 = &qword_1EE70EEE0;
  }
  else
  {
    v6 = qword_1ED1AB520;
    v7 = self;
    if (v6 != -1)
      swift_once();
    v5 = &qword_1ED1AB4E8;
  }
  v8 = (_TtC8MapsSync19MapsSyncDataSession *)(id)*v5;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync31MapsSyncCachedCuratedCollection *v4;
  _TtC8MapsSync31MapsSyncCachedCuratedCollection *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1A41197D8((uint64_t)v8);

  sub_1A410251C((uint64_t)v8, (uint64_t *)&unk_1ED1AC4F0);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync31MapsSyncCachedCuratedCollection *v5;

  v4 = a3;
  v5 = self;
  sub_1A411A090(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCachedCuratedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync31MapsSyncCachedCuratedCollection *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A411A610, v6);

  swift_release();
  swift_release();
}

- (NSString)description
{
  _TtC8MapsSync31MapsSyncCachedCuratedCollection *v2;
  void *v3;

  v2 = self;
  sub_1A411A708();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__image), *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__image]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A410251C((uint64_t)self + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__lastFetchedDate, &qword_1ED1AB5D0);
  sub_1A410251C((uint64_t)self + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__lastSignificantChangeDate, &qword_1ED1AB5D0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8
{
  void *v13;
  _OWORD v14[2];

  v13 = _Block_copy(a8);
  if (a5)
  {
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_1A41E9B24(a3, a4, (uint64_t)v14, a6, a7, v13);
  _Block_release(v13);
  sub_1A40CD40C((uint64_t)v14);
}

+ (void)fetchWithCuratedCollections:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  sub_1A41E8CB4((int)a1, (int)a2, (int)a3, a4, a5, (void (*)(_QWORD))type metadata accessor for MapsSyncCuratedCollection, (int)&unk_1E4BB71F8, (uint64_t)sub_1A41E9740, (void (*)(uint64_t, id, uint64_t, uint64_t))_s8MapsSync0aB23CachedCuratedCollectionC09fetchWithD11Collections_13callbackQueue10completionySayAA0abdE0CG_So17OS_dispatch_queueCySayACG_AItctFZ_0);
}

+ (void)fetchWithHistoryCuratedCollections:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  sub_1A41E8CB4((int)a1, (int)a2, (int)a3, a4, a5, (void (*)(_QWORD))type metadata accessor for MapsSyncHistoryCuratedCollection, (int)&unk_1E4BB71D0, (uint64_t)sub_1A41E9738, (void (*)(uint64_t, id, uint64_t, uint64_t))_s8MapsSync0aB23CachedCuratedCollectionC016fetchWithHistoryD11Collections_13callbackQueue10completionySayAA0abhdE0CG_So17OS_dispatch_queueCySayACG_AiA0aB5ErrorCSgtctFZ_0);
}

+ (void)fetchWithCuratedCollection:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1A4243670;
  *(_QWORD *)(v7 + 32) = a3;
  v12 = v7;
  sub_1A423C1DC();
  v8 = qword_1EE70D9C0;
  v9 = a3;
  if (v8 != -1)
    swift_once();
  v10 = (void *)qword_1EE713160;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_1A41EA004;
  *(_QWORD *)(v11 + 24) = v6;
  swift_retain();
  _s8MapsSync0aB23CachedCuratedCollectionC09fetchWithD11Collections_13callbackQueue10completionySayAA0abdE0CG_So17OS_dispatch_queueCySayACG_AItctFZ_0(v12, v10, (uint64_t)sub_1A41EA008, v11);

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)fetchWithHistoryCuratedCollection:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1A4243670;
  *(_QWORD *)(v7 + 32) = a3;
  v12 = v7;
  sub_1A423C1DC();
  v8 = qword_1EE70D9C0;
  v9 = a3;
  if (v8 != -1)
    swift_once();
  v10 = (void *)qword_1EE713160;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_1A41E970C;
  *(_QWORD *)(v11 + 24) = v6;
  swift_retain();
  _s8MapsSync0aB23CachedCuratedCollectionC016fetchWithHistoryD11Collections_13callbackQueue10completionySayAA0abhdE0CG_So17OS_dispatch_queueCySayACG_AiA0aB5ErrorCSgtctFZ_0(v12, v10, (uint64_t)sub_1A41E93D8, v11);

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
