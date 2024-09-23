@implementation BlastDoorSMSCTPartPlain

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)plainTextContentBody
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPartPlain_sMSCTPartPlain);
}

- (BlastDoorSMSCTPartPlain)init
{
  BlastDoorSMSCTPartPlain *result;

  result = (BlastDoorSMSCTPartPlain *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
