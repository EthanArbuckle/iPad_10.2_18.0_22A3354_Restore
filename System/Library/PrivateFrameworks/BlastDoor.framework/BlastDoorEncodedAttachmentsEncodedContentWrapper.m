@implementation BlastDoorEncodedAttachmentsEncodedContentWrapper

- (NSString)description
{
  void *v2;
  uint64_t v4;

  sub_1AD2A1398((uint64_t *)((char *)self+ OBJC_IVAR___BlastDoorEncodedAttachmentsEncodedContentWrapper_encodedAttachments_EncodedContent), (uint64_t)&v4);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (unint64_t)type
{
  uint64_t v3[59];
  char v4;

  sub_1AD2A1398((uint64_t *)((char *)self+ OBJC_IVAR___BlastDoorEncodedAttachmentsEncodedContentWrapper_encodedAttachments_EncodedContent), (uint64_t)v3);
  if ((v4 & 1) != 0)
  {
    sub_1AD00412C(v3[0], v3[1]);
    return 1;
  }
  else
  {
    sub_1AD384D0C((uint64_t)v3);
    return 0;
  }
}

- (BlastDoorEncodedAttachments_EncodedAstc)astc
{
  BlastDoorEncodedAttachmentsEncodedContentWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4D7CDC();

  return (BlastDoorEncodedAttachments_EncodedAstc *)v3;
}

- (BlastDoorEncodedAttachments_RawData)other
{
  BlastDoorEncodedAttachmentsEncodedContentWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4D7DCC();

  return (BlastDoorEncodedAttachments_RawData *)v3;
}

- (BlastDoorEncodedAttachmentsEncodedContentWrapper)init
{
  BlastDoorEncodedAttachmentsEncodedContentWrapper *result;

  result = (BlastDoorEncodedAttachmentsEncodedContentWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD384D0C((uint64_t)self + OBJC_IVAR___BlastDoorEncodedAttachmentsEncodedContentWrapper_encodedAttachments_EncodedContent);
}

@end
