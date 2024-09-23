@implementation MapsSyncAnonymousCredential

- (NSSet)_reviewedPlacesUnstored
{
  void *v2;

  type metadata accessor for MapsSyncReviewedPlace();
  sub_1A40D0EE8((unint64_t *)&unk_1EE710610, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncReviewedPlace, MEMORY[0x1E0DEFCF8]);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A423C2B4();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)set_reviewedPlacesUnstored:(id)a3
{
  type metadata accessor for MapsSyncReviewedPlace();
  sub_1A40D0EE8((unint64_t *)&unk_1EE710610, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncReviewedPlace, MEMORY[0x1E0DEFCF8]);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlacesUnstored) = (Class)sub_1A423C2D8();
  swift_bridgeObjectRelease();
}

+ (_TtC8MapsSync27MapsSyncAnonymousCredential)fetchLatestAnonymousCredential
{
  id v2;

  _s8MapsSync0aB19AnonymousCredentialC011fetchLatestcD0ACSgvgZ_0();
  return (_TtC8MapsSync27MapsSyncAnonymousCredential *)v2;
}

+ (id)fetchWithAnonymousId:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  _s8MapsSync0aB19AnonymousCredentialC09fetchWithC2IdyACSgSo6NSDataCFZ_0(v3);
  v5 = v4;

  return v5;
}

- (NSData)anonymousId
{
  return (NSData *)sub_1A41152D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId);
}

- (NSData)mapsToken
{
  return (NSData *)sub_1A41152D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken);
}

- (NSDate)mapsTokenCreatedAt
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt;
  swift_beginAccess();
  sub_1A410356C((uint64_t)v6, (uint64_t)v5, &qword_1ED1AB5D0);
  v7 = sub_1A423BF9C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A423BF6C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (unint64_t)mapsTokenTTL
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenTTL);
}

- (NSSet)reviewedPlaces
{
  _TtC8MapsSync27MapsSyncAnonymousCredential *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1A418A344((uint64_t)v2, (uint64_t)sub_1A41FA260, 0);
  v4 = OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlaces;
  *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlaces) = (Class)v3;
  swift_bridgeObjectRelease();
  v5 = *(uint64_t *)((char *)&v2->super.super.super.isa + v4);
  swift_bridgeObjectRetain();

  if (v5)
  {
    type metadata accessor for MapsSyncReviewedPlace();
    sub_1A40D0EE8((unint64_t *)&unk_1EE710610, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncReviewedPlace, MEMORY[0x1E0DEFCF8]);
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
  _TtC8MapsSync27MapsSyncAnonymousCredential *v4;
  _TtC8MapsSync27MapsSyncAnonymousCredential *v5;
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
  v6 = sub_1A41FA344((uint64_t)v8);

  sub_1A410251C((uint64_t)v8, (uint64_t *)&unk_1ED1AC4F0);
  return v6 & 1;
}

- (void)executeOnFirstSave:(id)a3
{
  id v4;
  _TtC8MapsSync27MapsSyncAnonymousCredential *v5;

  v4 = a3;
  v5 = self;
  sub_1A41FA654(v4);

}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync27MapsSyncAnonymousCredential *v5;

  v4 = a3;
  v5 = self;
  sub_1A41FB02C(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedAnonymousCredential();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync27MapsSyncAnonymousCredential *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A41FD0D0, v6);

  swift_release();
  swift_release();
}

- (NSString)description
{
  _TtC8MapsSync27MapsSyncAnonymousCredential *v2;
  void *v3;

  v2 = self;
  sub_1A41FB420();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC8MapsSync27MapsSyncAnonymousCredential)initWithObject:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;

  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId) = xmmword_1A4243680;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken) = xmmword_1A4243680;
  v5 = (char *)self + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt;
  v6 = sub_1A423BF9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenTTL) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlaces) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlacesUnstored) = (Class)MEMORY[0x1E0DEE9E8];
  v7 = a3;
  return (_TtC8MapsSync27MapsSyncAnonymousCredential *)sub_1A41D033C(a3);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId), *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId]);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken), *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken]);
  sub_1A410251C((uint64_t)self + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt, &qword_1ED1AB5D0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
