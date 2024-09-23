@implementation BlastDoorStickerTapBack

- (NSString)description
{
  char *v2;
  void *v3;
  _BYTE v5[272];
  _QWORD __dst[34];

  v2 = (char *)self + OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack;
  memcpy(__dst, (char *)self + OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack, sizeof(__dst));
  memcpy(v5, v2, sizeof(v5));
  sub_1AD4DA2D4(__dst);
  sub_1AD63B798();
  v3 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)associatedMessageType
{
  return qword_1AD68D9F8[*((char *)&self->super.isa + OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack)];
}

- (NSString)associatedMessageGUID
{
  return (NSString *)sub_1AD4C918C();
}

- (NSString)associatedMessageFallbackHash
{
  return (NSString *)sub_1AD4C9220((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack);
}

- (_NSRange)associatedMessageRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_1AD4C9290((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1AD4C92E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack);
}

- (BlastDoorMessage)messageContent
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  char *v11;
  char *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v2 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 80];
  v3 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 96];
  v17 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 88];
  v18 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 72];
  v4 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 112];
  v5 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 120];
  v6 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 128];
  v14 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 136];
  v7 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 152];
  v15 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 144];
  v16 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 104];
  v9 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 160];
  v8 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 168];
  v10 = (objc_class *)type metadata accessor for _ObjCMessageWrapper();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = &v11[OBJC_IVAR___BlastDoorMessage_message];
  *(_QWORD *)v12 = v18;
  *((_QWORD *)v12 + 1) = v2;
  *((_QWORD *)v12 + 2) = v17;
  *((_QWORD *)v12 + 3) = v3;
  *((_QWORD *)v12 + 4) = v16;
  *((_QWORD *)v12 + 5) = v4;
  *((_QWORD *)v12 + 6) = v5;
  *((_QWORD *)v12 + 7) = v6;
  *((_QWORD *)v12 + 8) = v14;
  *((_QWORD *)v12 + 9) = v15;
  *((_QWORD *)v12 + 10) = v7;
  *((_QWORD *)v12 + 11) = v9;
  *((_QWORD *)v12 + 12) = v8;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1AD0E2EC4(v5);
  v19.receiver = v11;
  v19.super_class = v10;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return (BlastDoorMessage *)-[BlastDoorStickerTapBack init](&v19, sel_init);
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
  BlastDoorStickerTapBack *v14;
  uint64_t v16;
  objc_super v17;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack);
  v3 = *(_QWORD *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 200];
  if (v3)
  {
    v4 = v2[31];
    v16 = v2[30];
    v6 = v2[28];
    v5 = v2[29];
    v7 = v2[27];
    v9 = v2[24];
    v8 = v2[25];
    v10 = v2[23];
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
    v14 = -[BlastDoorStickerTapBack init](&v17, sel_init);
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

- (BlastDoorStickerTapBack)init
{
  BlastDoorStickerTapBack *result;

  result = (BlastDoorStickerTapBack *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _QWORD v2[34];

  memcpy(v2, (char *)self + OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack, sizeof(v2));
  sub_1AD28CE88(v2);
}

@end
