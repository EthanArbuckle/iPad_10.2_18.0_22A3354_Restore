@implementation BlastDoorEmojiTapBack

- (NSString)description
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  _OWORD v10[12];
  uint64_t v11;

  v2 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 168];
  v10[10] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 152];
  v10[11] = v2;
  v3 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 104];
  v10[6] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 88];
  v10[7] = v3;
  v4 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 136];
  v10[8] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 120];
  v10[9] = v4;
  v5 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 40];
  v10[2] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 24];
  v10[3] = v5;
  v6 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 72];
  v10[4] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 56];
  v10[5] = v6;
  v7 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 8];
  v10[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
  v10[1] = v7;
  v11 = *(_QWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 184];
  sub_1AD288250(v10);
  sub_1AD63B798();
  v8 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (int64_t)associatedMessageType
{
  return qword_1AD68D970[*((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack)];
}

- (NSString)associatedMessageGUID
{
  return (NSString *)sub_1AD4C918C();
}

- (NSString)associatedMessageFallbackHash
{
  return (NSString *)sub_1AD4C9220((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
}

- (_NSRange)associatedMessageRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_1AD4C9290((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSString)associatedMessageEmoji
{
  return (NSString *)sub_1AD4B1734((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1AD4B1860((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
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
  BlastDoorEmojiTapBack *v14;
  uint64_t v16;
  objc_super v17;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
  v3 = *(_QWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 128];
  if (v3)
  {
    v4 = v2[22];
    v16 = v2[21];
    v6 = v2[19];
    v5 = v2[20];
    v7 = v2[18];
    v9 = v2[15];
    v8 = v2[16];
    v10 = v2[14];
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
    v14 = -[BlastDoorEmojiTapBack init](&v17, sel_init);
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

- (BlastDoorEmojiTapBack)init
{
  BlastDoorEmojiTapBack *result;

  result = (BlastDoorEmojiTapBack *)_swift_stdlib_reportUnimplementedInitializer();
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
  __int128 v7;
  _OWORD v8[12];
  uint64_t v9;

  v2 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 168];
  v8[10] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 152];
  v8[11] = v2;
  v9 = *(_QWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 184];
  v3 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 104];
  v8[6] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 88];
  v8[7] = v3;
  v4 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 136];
  v8[8] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 120];
  v8[9] = v4;
  v5 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 40];
  v8[2] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 24];
  v8[3] = v5;
  v6 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 72];
  v8[4] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 56];
  v8[5] = v6;
  v7 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
  v8[1] = v7;
  sub_1AD288064(v8);
}

@end
