@implementation MapsSyncReviewedPlace

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
  sub_1A40F5DAC(a3, a4, (uint64_t)v14, a6, a7, (void (**)(_QWORD, _QWORD, _QWORD))v13);
  _Block_release(v13);
  sub_1A40CD40C((uint64_t)v14);
}

+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completionWithError:(id)a8
{
  void *v11;
  uint64_t v12;
  _OWORD v13[2];

  v11 = _Block_copy(a8);
  if (a5)
  {
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  sub_1A40F6778((void *)a3, a4, (uint64_t)v13, 2, 0, sub_1A40F75A8, v12);
  swift_release();
  sub_1A40CD40C((uint64_t)v13);
}

+ (id)fetchWithMuids:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = sub_1A423C1C4();
  _s8MapsSync0aB13ReviewedPlaceC14fetchWithMuidsyACSgSays6UInt64VGFZ_0(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (void)fetchWithMuids:(id)a3 completion:(id)a4
{
  void *v4;
  uint64_t v5;
  _QWORD v6[4];

  v4 = _Block_copy(a4);
  v5 = sub_1A423C1C4();
  v6[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA9B8);
  v6[0] = v5;
  _Block_copy(v4);
  swift_bridgeObjectRetain();
  sub_1A40F5DAC(3, 1, (uint64_t)v6, 2, 0, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  sub_1A40CD40C((uint64_t)v6);
  _Block_release(v4);
  swift_bridgeObjectRelease();
}

- (_TtC8MapsSync21MapsSyncReviewedPlace)initWithAnonymousCredential:(id)a3
{
  return (_TtC8MapsSync21MapsSyncReviewedPlace *)MapsSyncReviewedPlace.init(anonymousCredential:)((uint64_t)a3);
}

- (_TtC8MapsSync21MapsSyncReviewedPlace)init
{
  return (_TtC8MapsSync21MapsSyncReviewedPlace *)MapsSyncReviewedPlace.init()();
}

- (_TtC8MapsSync21MapsSyncReviewedPlace)initWithObject:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC8MapsSync21MapsSyncReviewedPlace *)sub_1A421CE20(a3);
}

- (unint64_t)muid
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__muid);
}

- (NSNumber)resultProviderIdentifier
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__resultProviderIdentifier));
}

- (NSNumber)rating
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__rating));
}

- (NSNumber)latitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__latitude));
}

- (NSNumber)longitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__longitude));
}

- (NSDate)lastSuggestedReviewDate
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
  v6 = (char *)self + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__lastSuggestedReviewDate;
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

- (BOOL)hasUserReviewed
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__hasUserReviewed);
}

- (int)uploadedPhotosCount
{
  return *(_DWORD *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__uploadedPhotosCount);
}

- (signed)version
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__version);
}

- (_TtC8MapsSync27MapsSyncAnonymousCredential)anonymousCredential
{
  return (_TtC8MapsSync27MapsSyncAnonymousCredential *)sub_1A421D2F4(self, (uint64_t)a2, (uint64_t)sub_1A421D2C4, (uint64_t (*)(void))sub_1A418A5B0, &OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredential);
}

- (_TtC8MapsSync19MapsSyncCommunityID)communityId
{
  return (_TtC8MapsSync19MapsSyncCommunityID *)sub_1A421D2F4(self, (uint64_t)a2, (uint64_t)sub_1A421D3C0, (uint64_t (*)(void))sub_1A418A81C, &OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__communityId);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync21MapsSyncReviewedPlace *v4;
  _TtC8MapsSync21MapsSyncReviewedPlace *v5;
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
  v6 = sub_1A421D47C((uint64_t)v8);

  sub_1A410251C((uint64_t)v8, (uint64_t *)&unk_1ED1AC4F0);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync21MapsSyncReviewedPlace *v5;

  v4 = a3;
  v5 = self;
  sub_1A421D704(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedReviewedPlace();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync21MapsSyncReviewedPlace *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A421DA78, v6);

  swift_release();
  swift_release();
}

- (NSString)description
{
  _TtC8MapsSync21MapsSyncReviewedPlace *v2;
  void *v3;

  v2 = self;
  sub_1A421DB70();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  sub_1A410251C((uint64_t)self + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__lastSuggestedReviewDate, &qword_1ED1AB5D0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__resultProviderIdentifier));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredential));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredentialUnstored));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__communityId));
}

@end
