@implementation MSAnonymousCredential

- (MSAnonymousCredential)initWithAnonymousId:(id)a3 mapsToken:(id)a4 mapsTokenCreatedAt:(id)a5 mapsTokenTTL:(int64_t)a6 positionIndex:(int64_t)a7
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  MSAnonymousCredential *v27;
  uint64_t v29;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v15 = a4;
    v16 = a5;
    v17 = a3;
    a3 = (id)sub_1A423BF54();
    v19 = v18;

    if (a4)
      goto LABEL_3;
LABEL_6:
    v20 = 0;
    v22 = 0xF000000000000000;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v26 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v14, 1, 1, v26);
    goto LABEL_8;
  }
  v24 = a4;
  v25 = a5;
  v19 = 0xF000000000000000;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v20 = sub_1A423BF54();
  v22 = v21;

  if (!a5)
    goto LABEL_7;
LABEL_4:
  sub_1A423BF84();

  v23 = sub_1A423BF9C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v14, 0, 1, v23);
LABEL_8:
  v27 = (MSAnonymousCredential *)sub_1A41764F0((uint64_t)a3, v19, v20, v22, (uint64_t)v14, a6, a7);
  sub_1A40D7778(v20, v22);
  sub_1A40D7778((uint64_t)a3, v19);
  return v27;
}

- (MSAnonymousCredential)initWithStore:(id)a3 anonymousId:(id)a4 mapsToken:(id)a5 mapsTokenCreatedAt:(id)a6 mapsTokenTTL:(int64_t)a7 positionIndex:(int64_t)a8
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;

  v33 = a8;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v16 = a3;
    v17 = a5;
    v18 = a6;
    v19 = a4;
    v20 = sub_1A423BF54();
    v22 = v21;

    if (a5)
      goto LABEL_3;
LABEL_6:
    v23 = 0;
    v25 = 0xF000000000000000;
    if (a6)
      goto LABEL_4;
LABEL_7:
    v30 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v15, 1, 1, v30);
    return (MSAnonymousCredential *)AnonymousCredential.init(store:anonymousId:mapsToken:mapsTokenCreatedAt:mapsTokenTTL:positionIndex:)(a3, v20, v22, v23, v25, (uint64_t)v15, a7, v33);
  }
  v27 = a3;
  v28 = a5;
  v29 = a6;
  v20 = 0;
  v22 = 0xF000000000000000;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v23 = sub_1A423BF54();
  v25 = v24;

  if (!a6)
    goto LABEL_7;
LABEL_4:
  sub_1A423BF84();

  v26 = sub_1A423BF9C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v15, 0, 1, v26);
  return (MSAnonymousCredential *)AnonymousCredential.init(store:anonymousId:mapsToken:mapsTokenCreatedAt:mapsTokenTTL:positionIndex:)(a3, v20, v22, v23, v25, (uint64_t)v15, a7, v33);
}

- (void)flushChanges
{
  _QWORD *v3;
  uint64_t v4;
  MSAnonymousCredential *v5;
  _QWORD *v6;

  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  v4 = MEMORY[0x1E0DEE9D8];
  *v3 = MEMORY[0x1E0DEE9D8];
  v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR___MSAnonymousCredential__reviewedPlaceChanges);
  swift_beginAccess();
  *v6 = v4;

  swift_bridgeObjectRelease();
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedAnonymousCredential();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSAnonymousCredential *v7;

  v6 = a3;
  v7 = self;
  sub_1A4173808(v6, a4);

}

- (NSData)anonymousId
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A4173B3C);
}

- (void)setAnonymousId:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A4176864);
}

- (NSData)mapsToken
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A4173EE0);
}

- (void)setMapsToken:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A4176A84);
}

- (NSDate)mapsTokenCreatedAt
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  MSAnonymousCredential *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1A4174514((uint64_t)v5);

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

- (void)setMapsTokenCreatedAt:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  MSAnonymousCredential *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A423BF84();
    v8 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1A41749C8((uint64_t)v7);

}

- (int64_t)mapsTokenTTL
{
  return sub_1A40DCED8((char *)self, (uint64_t)a2, &OBJC_IVAR___MSAnonymousCredential__mapsTokenTTL);
}

- (void)setMapsTokenTTL:(int64_t)a3
{
  MSAnonymousCredential *v4;

  v4 = self;
  sub_1A4175110(a3);

}

- (int64_t)positionIndex
{
  return sub_1A40DCED8((char *)self, (uint64_t)a2, &OBJC_IVAR___MSAnonymousCredential__positionIndex);
}

- (void)setPositionIndex:(int64_t)a3
{
  MSAnonymousCredential *v4;

  v4 = self;
  sub_1A4175384(a3);

}

- (id)fetchReviewedPlaces
{
  MSAnonymousCredential *v2;
  void *v3;

  v2 = self;
  sub_1A41755FC();

  type metadata accessor for ReviewedPlace();
  v3 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)addReviewedPlace:(id)a3
{
  id v4;
  MSAnonymousCredential *v5;

  v4 = a3;
  v5 = self;
  sub_1A4175DE8(v4, 0, (uint64_t)sub_1A4175CEC, 0);

}

- (void)removeReviewedPlace:(id)a3
{
  id v4;
  MSAnonymousCredential *v5;

  v4 = a3;
  v5 = self;
  sub_1A4175DE8(v4, 1, (uint64_t)sub_1A4175D74, 0);

}

- (MSAnonymousCredential)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  char *v9;
  uint64_t v10;
  id v11;

  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__anonymousId) = xmmword_1A4243680;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__mapsToken) = xmmword_1A4243680;
  v9 = (char *)self + OBJC_IVAR___MSAnonymousCredential__mapsTokenCreatedAt;
  v10 = sub_1A423BF9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__mapsTokenTTL) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__positionIndex) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__reviewedPlaceChanges) = (Class)MEMORY[0x1E0DEE9D8];
  v11 = a3;
  return (MSAnonymousCredential *)sub_1A4185C24(a3, a4, a5);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__anonymousId), *(_QWORD *)&self->super._store[OBJC_IVAR___MSAnonymousCredential__anonymousId]);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__mapsToken), *(_QWORD *)&self->super._store[OBJC_IVAR___MSAnonymousCredential__mapsToken]);
  sub_1A40F1680((uint64_t)self + OBJC_IVAR___MSAnonymousCredential__mapsTokenCreatedAt);
  swift_bridgeObjectRelease();
}

@end
