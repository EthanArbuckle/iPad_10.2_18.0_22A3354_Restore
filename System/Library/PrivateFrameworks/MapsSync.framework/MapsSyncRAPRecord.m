@implementation MapsSyncRAPRecord

- (NSString)countryCode
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__countryCode);
}

- (signed)type
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__type);
}

- (NSString)summary
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__summary);
}

- (NSString)reportId
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__reportId);
}

- (signed)status
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__status);
}

- (NSDate)statusLastUpdatedDate
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
  v6 = (char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__statusLastUpdatedDate;
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

- (NSData)contentData
{
  return (NSData *)sub_1A41152D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__contentData);
}

- (NSData)rapResponse
{
  return (NSData *)sub_1A41152D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__rapResponse);
}

- (_TtC8MapsSync19MapsSyncCommunityID)communityId
{
  _TtC8MapsSync17MapsSyncRAPRecord *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _TtC8MapsSync19MapsSyncCommunityID *v6;

  v2 = self;
  v3 = sub_1A4189C00((uint64_t)v2, (uint64_t)sub_1A4115428, 0);
  v4 = OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__communityId;
  v5 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__communityId);
  *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__communityId) = (Class)v3;

  v6 = (_TtC8MapsSync19MapsSyncCommunityID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&v2->super.super.super.isa
                                                                                     + v4));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync17MapsSyncRAPRecord *v4;
  _TtC8MapsSync17MapsSyncRAPRecord *v5;
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
  v6 = sub_1A41154C4((uint64_t)v8);

  sub_1A410251C((uint64_t)v8, (uint64_t *)&unk_1ED1AC4F0);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync17MapsSyncRAPRecord *v5;

  v4 = a3;
  v5 = self;
  sub_1A4115D50(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedRAPRecord();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync17MapsSyncRAPRecord *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A411812C, v6);

  swift_release();
  swift_release();
}

- (_TtC8MapsSync17MapsSyncRAPRecord)initWithObject:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC8MapsSync17MapsSyncRAPRecord *)sub_1A4116254(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A410251C((uint64_t)self + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__statusLastUpdatedDate, &qword_1ED1AB5D0);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__contentData), *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__contentData]);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__rapResponse), *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__rapResponse]);

}

@end
