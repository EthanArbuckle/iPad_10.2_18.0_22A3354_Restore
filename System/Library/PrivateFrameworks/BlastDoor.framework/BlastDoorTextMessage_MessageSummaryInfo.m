@implementation BlastDoorTextMessage_MessageSummaryInfo

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 16];
  v3 = *(_QWORD *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 24];
  v4 = *(_QWORD *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 48];
  v5 = *(_QWORD *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 56];
  swift_retain();
  sub_1AD003E48(v2, v3);
  swift_retain();
  sub_1AD003E48(v4, v5);
  sub_1AD63B798();
  v6 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (BOOL)has_updatedDateWithServerTime
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo) != 2;
}

- (BOOL)updatedDateWithServerTime
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo) & 1;
}

- (BOOL)has_hasBeenRetried
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
         + 1) != 2;
}

- (BOOL)hasBeenRetried
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
         + 1) & 1;
}

- (NSString)sourceApplicationID
{
  return (NSString *)sub_1AD4D40FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo);
}

- (NSString)associatedBalloonBundleID
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSString *result;

  v2 = *(_QWORD *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 56];
  if (!v2)
  {
    v3 = 0;
    return (NSString *)v3;
  }
  if (v2 != 1)
  {
    v4 = *(_QWORD *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                        + 48];
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    sub_1AD003F24(v4, v2);
    return (NSString *)v3;
  }
  result = (NSString *)sub_1AD63BE28();
  __break(1u);
  return result;
}

- (BlastDoorTextMessage_MessageSummaryInfo)init
{
  BlastDoorTextMessage_MessageSummaryInfo *result;

  result = (BlastDoorTextMessage_MessageSummaryInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 16];
  v3 = *(_QWORD *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 24];
  v4 = *(_QWORD *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 48];
  v5 = *(_QWORD *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 56];
  swift_release();
  sub_1AD003F24(v2, v3);
  swift_release();
  sub_1AD003F24(v4, v5);
}

@end
