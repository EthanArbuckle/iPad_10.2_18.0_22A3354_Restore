@implementation MapsSyncCommunityID

- (_TtC8MapsSync19MapsSyncCommunityID)init
{
  _QWORD *v2;

  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__communityIdentifier);
  *v2 = 0;
  v2[1] = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__expired) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__usedCount) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__reviewedPlaces) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__rapRecords) = 0;
  return (_TtC8MapsSync19MapsSyncCommunityID *)sub_1A41D033C(0);
}

- (_TtC8MapsSync19MapsSyncCommunityID)initWithObject:(id)a3
{
  _QWORD *v4;
  id v5;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__communityIdentifier);
  *v4 = 0;
  v4[1] = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__expired) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__usedCount) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__reviewedPlaces) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__rapRecords) = 0;
  v5 = a3;
  return (_TtC8MapsSync19MapsSyncCommunityID *)sub_1A41D033C(a3);
}

- (NSString)communityIdentifier
{
  void *v2;

  if (*(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__communityIdentifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)expired
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__expired);
}

- (int64_t)usedCount
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__usedCount);
}

- (NSSet)rapRecords
{
  _TtC8MapsSync19MapsSyncCommunityID *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1A4189E6C((uint64_t)v2, (uint64_t)sub_1A41AF7DC, 0);
  v4 = OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__rapRecords;
  *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__rapRecords) = (Class)v3;
  swift_bridgeObjectRelease();
  v5 = *(uint64_t *)((char *)&v2->super.super.super.isa + v4);
  swift_bridgeObjectRetain();

  if (v5)
  {
    type metadata accessor for MapsSyncRAPRecord();
    sub_1A418DF64(&qword_1EE70F9F0, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncRAPRecord);
    v6 = (void *)sub_1A423C2B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSSet *)v6;
}

- (NSSet)reviewedPlaces
{
  _TtC8MapsSync19MapsSyncCommunityID *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1A418A0D8((uint64_t)v2, (uint64_t)sub_1A41AF908, 0);
  v4 = OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__reviewedPlaces;
  *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__reviewedPlaces) = (Class)v3;
  swift_bridgeObjectRelease();
  v5 = *(uint64_t *)((char *)&v2->super.super.super.isa + v4);
  swift_bridgeObjectRetain();

  if (v5)
  {
    type metadata accessor for MapsSyncReviewedPlace();
    sub_1A418DF64((unint64_t *)&unk_1EE710610, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncReviewedPlace);
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
  _TtC8MapsSync19MapsSyncCommunityID *v4;
  _TtC8MapsSync19MapsSyncCommunityID *v5;
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
  v6 = sub_1A41AFA18((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync19MapsSyncCommunityID *v5;

  v4 = a3;
  v5 = self;
  sub_1A41AFCE4(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCommunityID();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync19MapsSyncCommunityID *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A41AFEE0, v6);

  swift_release();
  swift_release();
}

- (NSString)description
{
  _TtC8MapsSync19MapsSyncCommunityID *v2;
  void *v3;

  v2 = self;
  sub_1A41AFFD8();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
