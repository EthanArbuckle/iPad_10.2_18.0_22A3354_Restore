@implementation BlastDoorEncodedAttachments_Content

- (NSString)description
{
  void *v2;
  uint64_t v4;

  sub_1AD4D97E0((uint64_t)self + OBJC_IVAR___BlastDoorEncodedAttachments_Content_encodedAttachments_Content, (uint64_t)&v4);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorEncodedAttachmentsEncodedContentWrapper)content
{
  objc_class *v3;
  id v4;
  BlastDoorEncodedAttachments_Content *v5;
  BlastDoorEncodedAttachments_Content *v6;
  objc_super v8;
  uint64_t v9[60];
  _BYTE v10[480];

  sub_1AD4D97E0((uint64_t)self + OBJC_IVAR___BlastDoorEncodedAttachments_Content_encodedAttachments_Content, (uint64_t)v10);
  sub_1AD290F28(v10, v9);
  v3 = (objc_class *)type metadata accessor for _ObjCEnumEncodedAttachmentsEncodedContentWrapper();
  v4 = objc_allocWithZone(v3);
  sub_1AD2A1398(v9, (uint64_t)v4 + OBJC_IVAR___BlastDoorEncodedAttachmentsEncodedContentWrapper_encodedAttachments_EncodedContent);
  v8.receiver = v4;
  v8.super_class = v3;
  v5 = self;
  v6 = -[BlastDoorEncodedAttachments_Content init](&v8, sel_init);
  sub_1AD384D0C((uint64_t)v9);

  return (BlastDoorEncodedAttachmentsEncodedContentWrapper *)v6;
}

- (BlastDoorEncodedAttachments_Content)init
{
  BlastDoorEncodedAttachments_Content *result;

  result = (BlastDoorEncodedAttachments_Content *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4D983C((uint64_t)self + OBJC_IVAR___BlastDoorEncodedAttachments_Content_encodedAttachments_Content);
}

@end
