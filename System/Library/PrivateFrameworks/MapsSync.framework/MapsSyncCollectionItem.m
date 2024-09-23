@implementation MapsSyncCollectionItem

+ (id)fetchCollectionItemForIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1A423BFE4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A423BFCC();
  _s8MapsSync0aB14CollectionItemC05fetchcD13ForIdentifieryACSg10Foundation4UUIDVFZ_0();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

- (_TtC8MapsSync22MapsSyncCollectionItem)initWithCollection:(id)a3
{
  return (_TtC8MapsSync22MapsSyncCollectionItem *)MapsSyncCollectionItem.init(collection:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  _TtC8MapsSync22MapsSyncCollectionItem *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1A4188ADC(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_1A423C7AC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)executeOnFirstSave:(id)a3
{
  id v4;
  _TtC8MapsSync22MapsSyncCollectionItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A4188DB0(v4);

}

- (_TtC8MapsSync22MapsSyncCollectionItem)initWithObject:(id)a3
{
  id v4;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncCollectionItem__collections) = 0;
  v4 = a3;
  return (_TtC8MapsSync22MapsSyncCollectionItem *)sub_1A41D033C(a3);
}

- (BOOL)requiresCollection
{
  return 1;
}

- (NSSet)collections
{
  _TtC8MapsSync22MapsSyncCollectionItem *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1A4189728((uint64_t)v2, (uint64_t)sub_1A418B118, 0);
  v4 = OBJC_IVAR____TtC8MapsSync22MapsSyncCollectionItem__collections;
  *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncCollectionItem__collections) = (Class)v3;
  swift_bridgeObjectRelease();
  v5 = *(uint64_t *)((char *)&v2->super.super.super.isa + v4);
  swift_bridgeObjectRetain();

  if (v5)
  {
    type metadata accessor for MapsSyncCollection();
    sub_1A418DF64(&qword_1EE70F9D8, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncCollection);
    v6 = (void *)sub_1A423C2B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSSet *)v6;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync22MapsSyncCollectionItem *v4;
  _TtC8MapsSync22MapsSyncCollectionItem *v5;
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
  v6 = sub_1A418C634((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync22MapsSyncCollectionItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A4188B68(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCollectionItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync22MapsSyncCollectionItem *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A418D3B0, v6);

  swift_release();
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
