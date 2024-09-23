@implementation MapsSyncCollection

+ (void)fetchUniquelyOwnedCollectionItemsWithCollection:(id)a3 context:(id)a4 completion:(id)a5
{
  sub_1A40EC090((int)a1, (int)a2, a3, a4, a5, (uint64_t)&unk_1E4BA69C0, (uint64_t)sub_1A40EC9E0, (void (*)(id, id, uint64_t, uint64_t))sub_1A40EB44C);
}

+ (void)deleteUniquelyOwnedCollectionItemsWithCollection:(id)a3 context:(id)a4 completion:(id)a5
{
  sub_1A40EC090((int)a1, (int)a2, a3, a4, a5, (uint64_t)&unk_1E4BA6998, (uint64_t)sub_1A40E7534, sub_1A40EBAAC);
}

+ (id)fetchCollectionForIdentifier:(id)a3
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
  _s8MapsSync0aB10CollectionC05fetchC13ForIdentifieryACSg10Foundation4UUIDVFZ_0();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

- (NSSet)_placesUnstored
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for MapsSyncCollectionItem();
  sub_1A40D0EE8((unint64_t *)&qword_1ED1AA838, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncCollectionItem, MEMORY[0x1E0DEFCF8]);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A423C2B4();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)set_placesUnstored:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for MapsSyncCollectionItem();
  sub_1A40D0EE8((unint64_t *)&qword_1ED1AA838, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncCollectionItem, MEMORY[0x1E0DEFCF8]);
  v4 = sub_1A423C2D8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__placesUnstored);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  _TtC8MapsSync18MapsSyncCollection *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1A41B55BC(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_1A423C7AC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (NSString)description
{
  _TtC8MapsSync18MapsSyncCollection *v2;
  void *v3;

  v2 = self;
  sub_1A41B5884();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)collectionDescription
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__collectionDescription);
}

- (NSData)image
{
  uint64_t *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__image);
  v3 = *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__image];
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
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__imageUrl);
}

- (NSString)title
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__title);
}

- (NSSet)places
{
  return (NSSet *)sub_1A41B8C04(self, (uint64_t)a2, sub_1A41B5C3C);
}

- (int64_t)placesCount
{
  return *(int *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__placesCount);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync18MapsSyncCollection *v4;
  _TtC8MapsSync18MapsSyncCollection *v5;
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
  v6 = sub_1A41B635C((uint64_t)v8);

  sub_1A410251C((uint64_t)v8, (uint64_t *)&unk_1ED1AC4F0);
  return v6 & 1;
}

- (BOOL)attributesEqual:(id)a3
{
  uint64_t v3;
  id v5;
  _TtC8MapsSync18MapsSyncCollection *v6;

  v3 = (uint64_t)a3;
  v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_1A41B66C4(v3);

  return v3 & 1;
}

- (void)executeOnFirstSave:(id)a3
{
  id v4;
  _TtC8MapsSync18MapsSyncCollection *v5;

  v4 = a3;
  v5 = self;
  sub_1A41B693C(v4);

}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync18MapsSyncCollection *v5;

  v4 = a3;
  v5 = self;
  sub_1A41B7360(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync18MapsSyncCollection *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A41B9928, v6);

  swift_release();
  swift_release();
}

- (void)deleteWithCompletion:(id)a3
{
  void *v4;
  _TtC8MapsSync18MapsSyncCollection *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1A41B9DEC(v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (_TtC8MapsSync18MapsSyncCollection)initWithObject:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__collectionDescription);
  *v4 = 0;
  v4[1] = 0;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__image) = xmmword_1A4243680;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__imageUrl);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__title);
  *v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__places) = 0;
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__placesCount) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__placesUnstored) = (Class)MEMORY[0x1E0DEE9E8];
  v7 = a3;
  return (_TtC8MapsSync18MapsSyncCollection *)sub_1A41D033C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__image), *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__image]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
