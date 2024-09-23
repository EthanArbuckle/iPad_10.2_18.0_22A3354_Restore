@implementation MSCommunityID

- (MSCommunityID)initWithCommunityIdentifier:(id)a3 expired:(BOOL)a4 positionIndex:(int64_t)a5 usedCount:(int64_t)a6
{
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  MSCommunityID *v14;

  v8 = a4;
  if (a3)
  {
    sub_1A423C14C();
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  if (qword_1ED1AB880 != -1)
    swift_once();
  v12 = qword_1ED1AB9F0;
  if (v11)
  {
    v13 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v14 = -[MSCommunityID initWithStore:communityIdentifier:expired:positionIndex:usedCount:](self, sel_initWithStore_communityIdentifier_expired_positionIndex_usedCount_, v12, v13, v8, a5, a6);

  return v14;
}

- (MSCommunityID)initWithStore:(id)a3 communityIdentifier:(id)a4 expired:(BOOL)a5 positionIndex:(int64_t)a6 usedCount:(int64_t)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;

  if (a4)
  {
    v11 = sub_1A423C14C();
    v13 = v12;
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v14 = sub_1A417A394(a3, v11, v13, a5, a6, a7);
  swift_bridgeObjectRelease();
  return (MSCommunityID *)v14;
}

- (void)flushChanges
{
  _QWORD *v3;
  uint64_t v4;
  MSCommunityID *v5;
  _QWORD *v6;
  _QWORD *v7;

  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  v4 = MEMORY[0x1E0DEE9D8];
  *v3 = MEMORY[0x1E0DEE9D8];
  v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR___MSCommunityID__rapRecordChanges);
  swift_beginAccess();
  *v6 = v4;
  swift_bridgeObjectRelease();
  v7 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR___MSCommunityID__reviewedPlaceChanges);
  swift_beginAccess();
  *v7 = v4;

  swift_bridgeObjectRelease();
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCommunityID();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSCommunityID *v7;

  v6 = a3;
  v7 = self;
  sub_1A4177AE8(v6, a4);

}

- (NSString)communityIdentifier
{
  MSCommunityID *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1A4177CB4();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setCommunityIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MSCommunityID *v7;

  if (a3)
  {
    v4 = sub_1A423C14C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1A417A610(v4, v6);

  swift_bridgeObjectRelease();
}

- (BOOL)expired
{
  void *v2;
  MSCommunityID *v3;
  char v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *((_BYTE *)&v3->super.super.isa + OBJC_IVAR___MSCommunityID__expired);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setExpired:(BOOL)a3
{
  MSCommunityID *v4;

  v4 = self;
  sub_1A41783CC(a3);

}

- (int64_t)positionIndex
{
  return sub_1A40DCED8((char *)self, (uint64_t)a2, &OBJC_IVAR___MSCommunityID__positionIndex);
}

- (void)setPositionIndex:(int64_t)a3
{
  MSCommunityID *v4;

  v4 = self;
  sub_1A4178694(a3);

}

- (int64_t)usedCount
{
  return sub_1A40DCED8((char *)self, (uint64_t)a2, &OBJC_IVAR___MSCommunityID__usedCount);
}

- (void)setUsedCount:(int64_t)a3
{
  MSCommunityID *v4;

  v4 = self;
  sub_1A4178908(a3);

}

- (id)fetchRapRecords
{
  return sub_1A4179C34(self, (uint64_t)a2, (void (*)(void))sub_1A4178B80, (void (*)(_QWORD))type metadata accessor for RAPRecord);
}

- (void)addRapRecord:(id)a3
{
  id v4;
  MSCommunityID *v5;

  v4 = a3;
  v5 = self;
  sub_1A4179318(v4, 0, (uint64_t)sub_1A417921C, 0);

}

- (void)removeRapRecord:(id)a3
{
  id v4;
  MSCommunityID *v5;

  v4 = a3;
  v5 = self;
  sub_1A4179318(v4, 1, (uint64_t)sub_1A41792A4, 0);

}

- (id)fetchReviewedPlaces
{
  return sub_1A4179C34(self, (uint64_t)a2, (void (*)(void))sub_1A417957C, (void (*)(_QWORD))type metadata accessor for ReviewedPlace);
}

- (void)addReviewedPlace:(id)a3
{
  id v4;
  MSCommunityID *v5;

  v4 = a3;
  v5 = self;
  sub_1A4179D84(v4, 0, (uint64_t)sub_1A4175CEC, 0);

}

- (void)removeReviewedPlace:(id)a3
{
  id v4;
  MSCommunityID *v5;

  v4 = a3;
  v5 = self;
  sub_1A4179D84(v4, 1, (uint64_t)sub_1A4175D74, 0);

}

- (MSCommunityID)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  _QWORD *v8;
  objc_class *v9;
  id v10;

  v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCommunityID__communityIdentifier);
  *v8 = 0;
  v8[1] = 0;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___MSCommunityID__expired) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCommunityID__positionIndex) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCommunityID__usedCount) = 0;
  v9 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCommunityID__rapRecordChanges) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCommunityID__reviewedPlaceChanges) = v9;
  v10 = a3;
  return (MSCommunityID *)sub_1A4185C24(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
