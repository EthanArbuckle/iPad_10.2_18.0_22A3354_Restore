@implementation BlastDoorBasicEmojiTapback

- (NSString)description
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  _OWORD v8[9];
  uint64_t v9;

  v2 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 104];
  v8[6] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 88];
  v8[7] = v2;
  v8[8] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 120];
  v3 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 40];
  v8[2] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 24];
  v8[3] = v3;
  v4 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 72];
  v8[4] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 56];
  v8[5] = v4;
  v5 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback);
  v8[1] = v5;
  v9 = *(_QWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 136];
  sub_1AD284434(v8);
  sub_1AD63B798();
  v6 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (int64_t)associatedMessageType
{
  if (*((_BYTE *)&self->super.isa + OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback))
    return 3006;
  else
    return 2006;
}

- (NSString)associatedMessageGUID
{
  return (NSString *)sub_1AD4C918C();
}

- (NSString)associatedMessageFallbackHash
{
  return (NSString *)sub_1AD4C9220((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback);
}

- (_NSRange)associatedMessageRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_1AD4C9290((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSString)associatedMessageEmoji
{
  return (NSString *)sub_1AD4B1734((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback);
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1AD4B1860((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback);
}

- (BlastDoorBasicTapBack_MessageSummaryInfo)messageSummaryInfo
{
  char *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  char *v9;
  objc_super v10;

  v2 = (char *)self + OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback;
  v3 = *(_QWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 120];
  if (v3 == 1)
    return (BlastDoorBasicTapBack_MessageSummaryInfo *)0;
  v6 = *((_QWORD *)v2 + 14);
  v5 = *((_QWORD *)v2 + 15);
  v7 = (objc_class *)type metadata accessor for _ObjCBasicTapBack_MessageSummaryInfoWrapper();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = &v8[OBJC_IVAR___BlastDoorBasicTapBack_MessageSummaryInfo_basicTapBack_MessageSummaryInfo];
  *v9 = v6;
  *((_QWORD *)v9 + 1) = v5;
  *((_QWORD *)v9 + 2) = v3;
  v10.receiver = v8;
  v10.super_class = v7;
  swift_bridgeObjectRetain();
  return (BlastDoorBasicTapBack_MessageSummaryInfo *)-[BlastDoorBasicEmojiTapback init](&v10, sel_init);
}

- (NSString)plainTextBody
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorBasicEmojiTapback)init
{
  BlastDoorBasicEmojiTapback *result;

  result = (BlastDoorBasicEmojiTapback *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[9];
  uint64_t v7;

  v2 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 104];
  v6[6] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 88];
  v6[7] = v2;
  v6[8] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 120];
  v7 = *(_QWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 136];
  v3 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 40];
  v6[2] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 24];
  v6[3] = v3;
  v4 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 72];
  v6[4] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 56];
  v6[5] = v4;
  v5 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback);
  v6[1] = v5;
  sub_1AD2842A4(v6);
}

@end
