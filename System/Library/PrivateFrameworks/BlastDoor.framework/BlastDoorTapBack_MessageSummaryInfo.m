@implementation BlastDoorTapBack_MessageSummaryInfo

- (NSString)description
{
  uint64_t v2;
  void *v3;
  __int128 v5;

  v2 = *(_QWORD *)&self->tapBack_MessageSummaryInfo[OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo
                                                  + 32];
  v5 = *(_OWORD *)&self->tapBack_MessageSummaryInfo[OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo
                                                  + 40];
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1AD003E48(v2, v5);
  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v3 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)contentType
{
  int64_t result;
  char v3;

  result = sub_1AD4DA9CC(qword_1AD68DB00[*((char *)&self->super.isa
                                         + OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo)]);
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

- (NSString)summary
{
  return (NSString *)sub_1AD4D3488((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo);
}

- (NSString)pluginBundleID
{
  return (NSString *)sub_1AD4D34F8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo);
}

- (NSString)pluginDisplayName
{
  return (NSString *)sub_1AD4D3644((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo);
}

- (BlastDoorTapBack_MessageSummaryInfo)init
{
  BlastDoorTapBack_MessageSummaryInfo *result;

  result = (BlastDoorTapBack_MessageSummaryInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)&self->tapBack_MessageSummaryInfo[OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo
                                                  + 32];
  v3 = *(_QWORD *)&self->tapBack_MessageSummaryInfo[OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo
                                                  + 40];
  swift_release();
  swift_bridgeObjectRelease();
  sub_1AD003F24(v2, v3);
  swift_bridgeObjectRelease();
}

@end
