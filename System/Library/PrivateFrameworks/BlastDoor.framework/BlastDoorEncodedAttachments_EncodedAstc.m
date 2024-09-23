@implementation BlastDoorEncodedAttachments_EncodedAstc

- (NSString)description
{
  void *v2;
  _BYTE v4[472];

  sub_1AD4DA940((uint64_t)self + OBJC_IVAR___BlastDoorEncodedAttachments_EncodedAstc_encodedAttachments_EncodedAstc, (uint64_t)v4);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorImage)image
{
  BlastDoorEncodedAttachments_EncodedAstc *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4D067C();

  return (BlastDoorImage *)v3;
}

- (NSString)originalUTIType
{
  void *v2;
  NSString *result;
  _QWORD v4[59];

  sub_1AD4DA940((uint64_t)self + OBJC_IVAR___BlastDoorEncodedAttachments_EncodedAstc_encodedAttachments_EncodedAstc, (uint64_t)v4);
  if (v4[58])
  {
    swift_bridgeObjectRetain();
    sub_1AD29103C(v4);
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

- (BlastDoorEncodedAttachments_EncodedAstc)init
{
  BlastDoorEncodedAttachments_EncodedAstc *result;

  result = (BlastDoorEncodedAttachments_EncodedAstc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD29103C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR___BlastDoorEncodedAttachments_EncodedAstc_encodedAttachments_EncodedAstc));
}

@end
