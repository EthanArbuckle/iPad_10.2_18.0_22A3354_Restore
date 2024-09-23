@implementation BlastDoorSticker

- (NSString)description
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  _OWORD v9[11];
  uint64_t v10;

  v2 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 136];
  v9[8] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 120];
  v9[9] = v2;
  v9[10] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 152];
  v3 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 72];
  v9[4] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 56];
  v9[5] = v3;
  v4 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 104];
  v9[6] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 88];
  v9[7] = v4;
  v5 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSticker_sticker);
  v9[1] = v5;
  v6 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 40];
  v9[2] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 24];
  v9[3] = v6;
  v10 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 168];
  sub_1AD4DA6C4((uint64_t)v9);
  sub_1AD63B798();
  v7 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)associatedMessageGUID
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSticker_sticker);
}

- (BOOL)has_associatedMessageRange
{
  return (self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 24] & 1) == 0;
}

- (_NSRange)associatedMessageRange
{
  BlastDoorSticker *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = sub_1AD4CAA14();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (NSString)associatedMessageFallbackHash
{
  void *v2;

  if (*(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 40])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
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

  v2 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 56];
  v3 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 72];
  v17 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 64];
  v18 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 48];
  v4 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 88];
  v5 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 96];
  v6 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 104];
  v14 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 112];
  v7 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 128];
  v15 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 120];
  v16 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 80];
  v9 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 136];
  v8 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 144];
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
  return (BlastDoorMessage *)-[BlastDoorSticker init](&v19, sel_init);
}

- (NSArray)participantDestinationIdentifiers
{
  void *v2;
  NSArray *result;

  if (*(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 168])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1AD63B990();
    swift_bridgeObjectRelease();
    return (NSArray *)v2;
  }
  else
  {
    result = (NSArray *)sub_1AD63BE28();
    __break(1u);
  }
  return result;
}

- (BlastDoorSticker)init
{
  BlastDoorSticker *result;

  result = (BlastDoorSticker *)_swift_stdlib_reportUnimplementedInitializer();
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
  _OWORD v7[11];
  uint64_t v8;

  v2 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 136];
  v7[8] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 120];
  v7[9] = v2;
  v7[10] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 152];
  v8 = *(_QWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 168];
  v3 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 72];
  v7[4] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 56];
  v7[5] = v3;
  v4 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 104];
  v7[6] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 88];
  v7[7] = v4;
  v5 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 8];
  v7[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSticker_sticker);
  v7[1] = v5;
  v6 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 40];
  v7[2] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 24];
  v7[3] = v6;
  sub_1AD290664((uint64_t)v7);
}

@end
