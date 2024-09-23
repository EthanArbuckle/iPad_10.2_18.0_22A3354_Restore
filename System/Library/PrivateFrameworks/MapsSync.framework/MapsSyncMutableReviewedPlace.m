@implementation MapsSyncMutableReviewedPlace

- (_TtC8MapsSync28MapsSyncMutableReviewedPlace)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedReviewedPlace();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (unint64_t)muid
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_muid);
}

- (void)setMuid:(unint64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setMuid_, a3);
}

- (NSDate)lastSuggestedReviewDate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _TtC8MapsSync28MapsSyncMutableReviewedPlace *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v17 - v7;
  v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject);
  v10 = self;
  v11 = objc_msgSend(v9, sel_lastSuggestedReviewDate);
  if (v11)
  {
    v12 = v11;
    sub_1A423BF84();

    v13 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 0, 1, v13);
  }
  else
  {
    v13 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 1, 1, v13);
  }
  sub_1A40F1F64((uint64_t)v6, (uint64_t)v8);

  sub_1A423BF9C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    v15 = (void *)sub_1A423BF6C();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }
  return (NSDate *)v15;
}

- (void)setLastSuggestedReviewDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC8MapsSync28MapsSyncMutableReviewedPlace *v10;
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
  sub_1A421E338((uint64_t)v7);

}

- (BOOL)hasUserReviewed
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_hasUserReviewed);
}

- (void)setHasUserReviewed:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setHasUserReviewed_, a3);
}

- (NSNumber)rating
{
  return (NSNumber *)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_rating);
}

- (void)setRating:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setRating_, a3);
}

- (int)uploadedPhotosCount
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_uploadedPhotosCount);
}

- (void)setUploadedPhotosCount:(int)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setUploadedPhotosCount_, *(_QWORD *)&a3);
}

- (signed)version
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_version);
}

- (void)setVersion:(signed __int16)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setVersion_, a3);
}

- (void)setMapItemIdentifier:(id)a3
{
  id v4;
  _TtC8MapsSync28MapsSyncMutableReviewedPlace *v5;

  v4 = a3;
  v5 = self;
  sub_1A421EC54(v4);

}

- (_TtC8MapsSync27MapsSyncAnonymousCredential)anonymousCredential
{
  _TtC8MapsSync28MapsSyncMutableReviewedPlace *v2;
  id v3;

  v2 = self;
  v3 = sub_1A421EECC();

  return (_TtC8MapsSync27MapsSyncAnonymousCredential *)v3;
}

- (void)setAnonymousCredential:(id)a3
{
  id v5;
  _TtC8MapsSync28MapsSyncMutableReviewedPlace *v6;

  v5 = a3;
  v6 = self;
  sub_1A421F020((char *)a3);

}

- (_TtC8MapsSync19MapsSyncCommunityID)communityID
{
  _TtC8MapsSync28MapsSyncMutableReviewedPlace *v2;
  id v3;

  v2 = self;
  v3 = sub_1A421F0E4();

  return (_TtC8MapsSync19MapsSyncCommunityID *)v3;
}

- (void)setCommunityID:(id)a3
{
  id v5;
  _TtC8MapsSync28MapsSyncMutableReviewedPlace *v6;

  v5 = a3;
  v6 = self;
  sub_1A421F1F8((char *)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject));
}

@end
