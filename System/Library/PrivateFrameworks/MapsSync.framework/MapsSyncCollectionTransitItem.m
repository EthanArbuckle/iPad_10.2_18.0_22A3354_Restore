@implementation MapsSyncCollectionTransitItem

- (BOOL)requiresCollection
{
  return 0;
}

- (NSString)description
{
  _TtC8MapsSync29MapsSyncCollectionTransitItem *v2;
  void *v3;

  v2 = self;
  sub_1A4105498();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSData)transitLineStorageData
{
  uint64_t *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync29MapsSyncCollectionTransitItem__transitLineStorage);
  v3 = *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync29MapsSyncCollectionTransitItem__transitLineStorage];
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

- (unint64_t)muid
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync29MapsSyncCollectionTransitItem__muid);
}

- (BOOL)isDuplicateOfOther:(id)a3
{
  id v4;
  _TtC8MapsSync29MapsSyncCollectionTransitItem *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1A41056D8(v4);

  return self & 1;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync29MapsSyncCollectionTransitItem *v4;
  _TtC8MapsSync29MapsSyncCollectionTransitItem *v5;
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
  v6 = sub_1A41057BC((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync29MapsSyncCollectionTransitItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A41059E0(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCollectionTransitItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8MapsSync29MapsSyncCollectionTransitItem *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1A4105C94;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A40E7860, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync29MapsSyncCollectionTransitItem)initWithCollection:(id)a3
{
  return (_TtC8MapsSync29MapsSyncCollectionTransitItem *)MapsSyncCollectionTransitItem.init(collection:)(a3);
}

- (_TtC8MapsSync29MapsSyncCollectionTransitItem)initWithObject:(id)a3
{
  id v4;

  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync29MapsSyncCollectionTransitItem__transitLineStorage) = xmmword_1A4243680;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync29MapsSyncCollectionTransitItem__muid) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncCollectionItem__collections) = 0;
  v4 = a3;
  return (_TtC8MapsSync29MapsSyncCollectionTransitItem *)sub_1A41D033C(a3);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync29MapsSyncCollectionTransitItem__transitLineStorage), *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync29MapsSyncCollectionTransitItem__transitLineStorage]);
}

+ (id)fetchCollectionTransitItemForIdentifier:(id)a3
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
  _s8MapsSync0aB21CollectionTransitItemC05fetchcdE13ForIdentifieryACSg10Foundation4UUIDVFZ_0();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

@end
