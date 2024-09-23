@implementation BlastDoorSMSCTPartAttachment

- (NSString)description
{
  void *v2;

  sub_1AD00408C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSMSCTPartAttachment_sMSCTPartAttachment), *(_QWORD *)&self->sMSCTPartAttachment[OBJC_IVAR___BlastDoorSMSCTPartAttachment_sMSCTPartAttachment]);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSData)contentData
{
  return (NSData *)sub_1AD4C4F1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPartAttachment_sMSCTPartAttachment, (void (*)(uint64_t, uint64_t))sub_1AD00408C);
}

- (BlastDoorSMSCTPartAttachment)init
{
  BlastDoorSMSCTPartAttachment *result;

  result = (BlastDoorSMSCTPartAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD004118(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSMSCTPartAttachment_sMSCTPartAttachment), *(_QWORD *)&self->sMSCTPartAttachment[OBJC_IVAR___BlastDoorSMSCTPartAttachment_sMSCTPartAttachment]);
}

@end
