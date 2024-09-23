@implementation BlastDoorBasicTapBack_MessageSummaryInfo

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)contentType
{
  return qword_1AD68DAE8[*((char *)&self->super.isa
                         + OBJC_IVAR___BlastDoorBasicTapBack_MessageSummaryInfo_basicTapBack_MessageSummaryInfo)];
}

- (NSString)summary
{
  return (NSString *)sub_1AD4D3488((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTapBack_MessageSummaryInfo_basicTapBack_MessageSummaryInfo);
}

- (BlastDoorBasicTapBack_MessageSummaryInfo)init
{
  BlastDoorBasicTapBack_MessageSummaryInfo *result;

  result = (BlastDoorBasicTapBack_MessageSummaryInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
