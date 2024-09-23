@implementation BlastDoorEncodedAttachments_RawData

- (NSString)description
{
  void *v2;

  sub_1AD0040A0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEncodedAttachments_RawData_encodedAttachments_RawData), *(_QWORD *)&self->encodedAttachments_RawData[OBJC_IVAR___BlastDoorEncodedAttachments_RawData_encodedAttachments_RawData]);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSData)data
{
  uint64_t v2;
  unint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEncodedAttachments_RawData_encodedAttachments_RawData);
  v3 = *(_QWORD *)&self->encodedAttachments_RawData[OBJC_IVAR___BlastDoorEncodedAttachments_RawData_encodedAttachments_RawData];
  sub_1AD0040A0(v2, v3);
  v4 = (void *)sub_1AD63AFA0();
  sub_1AD00412C(v2, v3);
  return (NSData *)v4;
}

- (BlastDoorEncodedAttachments_RawData)init
{
  BlastDoorEncodedAttachments_RawData *result;

  result = (BlastDoorEncodedAttachments_RawData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD00412C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEncodedAttachments_RawData_encodedAttachments_RawData), *(_QWORD *)&self->encodedAttachments_RawData[OBJC_IVAR___BlastDoorEncodedAttachments_RawData_encodedAttachments_RawData]);
}

@end
