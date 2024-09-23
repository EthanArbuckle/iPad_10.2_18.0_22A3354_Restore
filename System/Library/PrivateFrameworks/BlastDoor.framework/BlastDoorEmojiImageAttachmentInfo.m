@implementation BlastDoorEmojiImageAttachmentInfo

- (NSString)description
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  _OWORD v11[14];

  v2 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 168];
  v11[10] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                     + 152];
  v11[11] = v2;
  v3 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 200];
  v11[12] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                     + 184];
  v11[13] = v3;
  v4 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 104];
  v11[6] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                    + 88];
  v11[7] = v4;
  v5 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 136];
  v11[8] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                    + 120];
  v11[9] = v5;
  v6 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 40];
  v11[2] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                    + 24];
  v11[3] = v6;
  v7 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 72];
  v11[4] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                    + 56];
  v11[5] = v7;
  v8 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 8];
  v11[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo);
  v11[1] = v8;
  sub_1AD2828CC(v11);
  sub_1AD63B798();
  v9 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v9;
}

- (NSString)emojiImageContentIdentifer
{
  return (NSString *)sub_1AD4C3120((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo);
}

- (NSString)emojiImageShortDescription
{
  return (NSString *)sub_1AD4C1828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo);
}

- (NSString)stickerIdentifier
{
  return (NSString *)sub_1AD4A9E68((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo);
}

- (NSString)stickerPackIdentifier
{
  void *v2;
  NSString *result;

  if (*(_QWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 112])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
    return (NSString *)v2;
  }
  else
  {
    result = (NSString *)sub_1AD63BE28();
    __break(1u);
  }
  return result;
}

- (NSString)stickerHash
{
  void *v2;
  NSString *result;

  if (*(_QWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 144])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
    return (NSString *)v2;
  }
  else
  {
    result = (NSString *)sub_1AD63BE28();
    __break(1u);
  }
  return result;
}

- (NSString)stickerExternalURI
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSString *result;

  v2 = *(_QWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 176];
  if (!v2)
  {
    v3 = 0;
    return (NSString *)v3;
  }
  if (v2 != 1)
  {
    v4 = *(_QWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                  + 168];
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    sub_1AD003F24(v4, v2);
    return (NSString *)v3;
  }
  result = (NSString *)sub_1AD63BE28();
  __break(1u);
  return result;
}

- (NSString)stickerBalloonBundleID
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSString *result;

  v2 = *(_QWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 208];
  if (!v2)
  {
    v3 = 0;
    return (NSString *)v3;
  }
  if (v2 != 1)
  {
    v4 = *(_QWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                  + 200];
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    sub_1AD003F24(v4, v2);
    return (NSString *)v3;
  }
  result = (NSString *)sub_1AD63BE28();
  __break(1u);
  return result;
}

- (BlastDoorEmojiImageAttachmentInfo)init
{
  BlastDoorEmojiImageAttachmentInfo *result;

  result = (BlastDoorEmojiImageAttachmentInfo *)_swift_stdlib_reportUnimplementedInitializer();
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
  __int128 v8;
  _OWORD v9[14];

  v2 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 168];
  v9[10] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                    + 152];
  v9[11] = v2;
  v3 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 200];
  v9[12] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                    + 184];
  v9[13] = v3;
  v4 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 104];
  v9[6] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                   + 88];
  v9[7] = v4;
  v5 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 136];
  v9[8] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                   + 120];
  v9[9] = v5;
  v6 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 40];
  v9[2] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                   + 24];
  v9[3] = v6;
  v7 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 72];
  v9[4] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                   + 56];
  v9[5] = v7;
  v8 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo);
  v9[1] = v8;
  sub_1AD282788(v9);
}

@end
