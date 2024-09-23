@implementation BlastDoorTapBack

- (NSString)description
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  _OWORD v9[10];
  uint64_t v10;

  v2 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 136];
  v9[8] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 120];
  v9[9] = v2;
  v3 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 72];
  v9[4] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 56];
  v9[5] = v3;
  v4 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 104];
  v9[6] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 88];
  v9[7] = v4;
  v5 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorTapBack_tapBack);
  v9[1] = v5;
  v6 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 40];
  v9[2] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 24];
  v9[3] = v6;
  v10 = *(_QWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 152];
  sub_1AD4DA4E4(v9);
  sub_1AD63B798();
  v7 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (int64_t)associatedMessageType
{
  int64_t result;
  char v3;

  result = sub_1AD4DA5A4(qword_1AD68DA10[*((char *)&self->super.isa + OBJC_IVAR___BlastDoorTapBack_tapBack)]);
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

- (NSString)associatedMessageGUID
{
  return (NSString *)sub_1AD4C918C();
}

- (NSString)associatedMessageFallbackHash
{
  return (NSString *)sub_1AD4C9220((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTapBack_tapBack);
}

- (_NSRange)associatedMessageRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_1AD4C9290((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTapBack_tapBack);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1AD4C92E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTapBack_tapBack);
}

- (BlastDoorTapBack_MessageSummaryInfo)messageSummaryInfo
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  char *v13;
  BlastDoorTapBack *v14;
  uint64_t v16;
  objc_super v17;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorTapBack_tapBack);
  v3 = *(_QWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 96];
  if (v3)
  {
    v4 = v2[18];
    v16 = v2[17];
    v6 = v2[15];
    v5 = v2[16];
    v7 = v2[14];
    v9 = v2[11];
    v8 = v2[12];
    v10 = v2[10];
    v11 = (objc_class *)type metadata accessor for _ObjCTapBack_MessageSummaryInfoWrapper();
    v12 = (char *)objc_allocWithZone(v11);
    v13 = &v12[OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo];
    *v13 = v10;
    *((_QWORD *)v13 + 1) = v9;
    *((_QWORD *)v13 + 2) = v8;
    *((_QWORD *)v13 + 3) = v3;
    *((_QWORD *)v13 + 4) = v7;
    *((_QWORD *)v13 + 5) = v6;
    *((_QWORD *)v13 + 6) = v5;
    *((_QWORD *)v13 + 7) = v16;
    *((_QWORD *)v13 + 8) = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1AD003E48(v6, v5);
    v17.receiver = v12;
    v17.super_class = v11;
    swift_bridgeObjectRetain();
    v14 = -[BlastDoorTapBack init](&v17, sel_init);
  }
  else
  {
    v14 = 0;
  }
  return (BlastDoorTapBack_MessageSummaryInfo *)v14;
}

- (NSString)plainTextBody
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorTapBack)init
{
  BlastDoorTapBack *result;

  result = (BlastDoorTapBack *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[10];
  uint64_t v8;

  v2 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 136];
  v7[8] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 120];
  v7[9] = v2;
  v8 = *(_QWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 152];
  v3 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 72];
  v7[4] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 56];
  v7[5] = v3;
  v4 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 104];
  v7[6] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 88];
  v7[7] = v4;
  v5 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 8];
  v7[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorTapBack_tapBack);
  v7[1] = v5;
  v6 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 40];
  v7[2] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 24];
  v7[3] = v6;
  sub_1AD28D2CC(v7);
}

@end
