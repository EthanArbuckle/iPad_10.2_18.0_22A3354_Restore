@implementation MapsSyncHistoryCuratedCollection

- (_TtC8MapsSync32MapsSyncHistoryCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4
{
  return (_TtC8MapsSync32MapsSyncHistoryCuratedCollection *)MapsSyncHistoryCuratedCollection.init(curatedCollectionIdentifier:resultProviderIdentifier:)(a3, a4);
}

- (_TtC8MapsSync32MapsSyncHistoryCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3
{
  return -[MapsSyncHistoryCuratedCollection initWithCuratedCollectionIdentifier:resultProviderIdentifier:](self, sel_initWithCuratedCollectionIdentifier_resultProviderIdentifier_, a3, 0);
}

- (_TtC8MapsSync32MapsSyncHistoryCuratedCollection)initWithObject:(id)a3
{
  id v4;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync32MapsSyncHistoryCuratedCollection__curatedCollectionIdentifier) = 0;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync32MapsSyncHistoryCuratedCollection__resultProviderIdentifier) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  v4 = a3;
  return (_TtC8MapsSync32MapsSyncHistoryCuratedCollection *)sub_1A41D033C(a3);
}

- (int64_t)identifierHash
{
  sub_1A423C8B4();
  sub_1A423C890();
  sub_1A423C884();
  return sub_1A423C89C();
}

- (unint64_t)curatedCollectionIdentifier
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync32MapsSyncHistoryCuratedCollection__curatedCollectionIdentifier);
}

- (int)resultProviderIdentifier
{
  return *(_DWORD *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync32MapsSyncHistoryCuratedCollection__resultProviderIdentifier);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync32MapsSyncHistoryCuratedCollection *v4;
  _TtC8MapsSync32MapsSyncHistoryCuratedCollection *v5;
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
  v6 = sub_1A417B230((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync32MapsSyncHistoryCuratedCollection *v5;

  v4 = a3;
  v5 = self;
  sub_1A417B474(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryCuratedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8MapsSync32MapsSyncHistoryCuratedCollection *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1A417B670;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A4126A80, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (void)deleteWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8MapsSync32MapsSyncHistoryCuratedCollection *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_1A411127C;
  v6[4] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1A4243670;
  *(_QWORD *)(v7 + 32) = self;
  v12 = v7;
  sub_1A423C1DC();
  v8 = qword_1EE70D9C0;
  v9 = self;
  swift_retain();
  if (v8 != -1)
    swift_once();
  v10 = (void *)qword_1EE713160;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_1A417C280;
  *(_QWORD *)(v11 + 24) = v6;
  swift_retain();
  _s8MapsSync0aB23CachedCuratedCollectionC016fetchWithHistoryD11Collections_13callbackQueue10completionySayAA0abhdE0CG_So17OS_dispatch_queueCySayACG_AiA0aB5ErrorCSgtctFZ_0(v12, v10, (uint64_t)sub_1A417C27C, v11);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
