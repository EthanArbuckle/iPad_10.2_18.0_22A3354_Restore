@implementation MapsSyncCuratedCollection

- (_TtC8MapsSync25MapsSyncCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4
{
  return (_TtC8MapsSync25MapsSyncCuratedCollection *)MapsSyncCuratedCollection.init(curatedCollectionIdentifier:resultProviderIdentifier:)(a3, a4);
}

- (_TtC8MapsSync25MapsSyncCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3
{
  return -[MapsSyncCuratedCollection initWithCuratedCollectionIdentifier:resultProviderIdentifier:](self, sel_initWithCuratedCollectionIdentifier_resultProviderIdentifier_, a3, 0);
}

- (_TtC8MapsSync25MapsSyncCuratedCollection)initWithObject:(id)a3
{
  id v4;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync25MapsSyncCuratedCollection__curatedCollectionIdentifier) = 0;
  *(_DWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync25MapsSyncCuratedCollection__resultProviderIdentifier) = 0;
  v4 = a3;
  return (_TtC8MapsSync25MapsSyncCuratedCollection *)sub_1A41D033C(a3);
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
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync25MapsSyncCuratedCollection__curatedCollectionIdentifier);
}

- (int)resultProviderIdentifier
{
  return *(_DWORD *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync25MapsSyncCuratedCollection__resultProviderIdentifier);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync25MapsSyncCuratedCollection *v4;
  _TtC8MapsSync25MapsSyncCuratedCollection *v5;
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
  v6 = sub_1A41691E0((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_class *v7;
  _TtC8MapsSync25MapsSyncCuratedCollection *v8;

  v4 = a3;
  v8 = self;
  sub_1A41CF8C8(v4);
  type metadata accessor for MapsSyncManagedCuratedCollection();
  if (swift_dynamicCastClass())
  {
    v5 = (void *)swift_dynamicCastClassUnconditional();
    v6 = v4;
    v7 = (objc_class *)objc_msgSend(v5, sel_curatedCollectionIdentifier);
    *(Class *)((char *)&v8->super.super.super.isa
             + OBJC_IVAR____TtC8MapsSync25MapsSyncCuratedCollection__curatedCollectionIdentifier) = v7;
    LODWORD(v5) = objc_msgSend(v5, sel_resultProviderIdentifier);

    *(_DWORD *)((char *)&v8->super.super.super.isa
              + OBJC_IVAR____TtC8MapsSync25MapsSyncCuratedCollection__resultProviderIdentifier) = (_DWORD)v5;
  }

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCuratedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync25MapsSyncCuratedCollection *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A4169630, v6);

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
  _TtC8MapsSync25MapsSyncCuratedCollection *v9;
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
  *(_QWORD *)(v11 + 16) = sub_1A416A370;
  *(_QWORD *)(v11 + 24) = v6;
  swift_retain();
  _s8MapsSync0aB23CachedCuratedCollectionC09fetchWithD11Collections_13callbackQueue10completionySayAA0abdE0CG_So17OS_dispatch_queueCySayACG_AItctFZ_0(v12, v10, (uint64_t)sub_1A416A36C, v11);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (NSString)description
{
  _TtC8MapsSync25MapsSyncCuratedCollection *v2;
  void *v3;

  v2 = self;
  sub_1A4169BEC();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
