@implementation MapsSyncCachedUserReview

- (NSString)description
{
  _TtC8MapsSync24MapsSyncCachedUserReview *v2;
  void *v3;

  v2 = self;
  sub_1A41139F4();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (unint64_t)muid
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync24MapsSyncCachedUserReview__muid);
}

- (int)numberPhotosUploaded
{
  return *(_DWORD *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync24MapsSyncCachedUserReview__numberPhotosUploaded);
}

- (signed)rating
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncCachedUserReview__rating);
}

- (_TtC8MapsSync19MapsSyncDataSession)session
{
  uint64_t v3;
  _TtC8MapsSync24MapsSyncCachedUserReview *v4;
  uint64_t *v5;
  uint64_t v6;
  _TtC8MapsSync24MapsSyncCachedUserReview *v7;
  _TtC8MapsSync19MapsSyncDataSession *v8;

  if (byte_1EE70EEE8 == 1)
  {
    v3 = qword_1EE70E270;
    v4 = self;
    if (v3 != -1)
      swift_once();
    v5 = &qword_1EE70EEE0;
  }
  else
  {
    v6 = qword_1ED1AB520;
    v7 = self;
    if (v6 != -1)
      swift_once();
    v5 = &qword_1ED1AB4E8;
  }
  v8 = (_TtC8MapsSync19MapsSyncDataSession *)(id)*v5;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync24MapsSyncCachedUserReview *v4;
  _TtC8MapsSync24MapsSyncCachedUserReview *v5;
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
  v6 = sub_1A4113D6C((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync24MapsSyncCachedUserReview *v5;

  v4 = a3;
  v5 = self;
  sub_1A4113FC8(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCachedUserReview();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync24MapsSyncCachedUserReview *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A411472C, v6);

  swift_release();
  swift_release();
}

- (_TtC8MapsSync24MapsSyncCachedUserReview)initWithObject:(id)a3
{
  id v4;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncCachedUserReview__muid) = 0;
  *(_DWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync24MapsSyncCachedUserReview__numberPhotosUploaded) = 0;
  *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncCachedUserReview__rating) = 0;
  v4 = a3;
  return (_TtC8MapsSync24MapsSyncCachedUserReview *)sub_1A41D033C(a3);
}

@end
