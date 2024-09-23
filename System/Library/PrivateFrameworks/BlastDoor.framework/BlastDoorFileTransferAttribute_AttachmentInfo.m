@implementation BlastDoorFileTransferAttribute_AttachmentInfo

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, type metadata accessor for FileTransferAttribute.AttachmentInfo, &OBJC_IVAR___BlastDoorFileTransferAttribute_AttachmentInfo_fileTransferAttribute_AttachmentInfo);
}

- (NSURL)attachmentURL
{
  return (NSURL *)sub_1AD4CE9A8(self, (uint64_t)a2, (void (*)(void))sub_1AD4CEA48);
}

- (NSString)signature
{
  return (NSString *)sub_1AD4CEBF0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___BlastDoorFileTransferAttribute_AttachmentInfo_fileTransferAttribute_AttachmentInfo, (void (*)(_QWORD))type metadata accessor for FileTransferAttribute.AttachmentInfo);
}

- (NSString)ownerID
{
  return (NSString *)sub_1AD4CECB4((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___BlastDoorFileTransferAttribute_AttachmentInfo_fileTransferAttribute_AttachmentInfo, (void (*)(_QWORD))type metadata accessor for FileTransferAttribute.AttachmentInfo);
}

- (unint64_t)expectedFileSize
{
  return sub_1AD4CED78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorFileTransferAttribute_AttachmentInfo_fileTransferAttribute_AttachmentInfo, type metadata accessor for FileTransferAttribute.AttachmentInfo);
}

- (NSString)encryptionKey
{
  void *v2;

  type metadata accessor for FileTransferAttribute.AttachmentInfo(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorFileTransferAttribute_AttachmentInfo)init
{
  BlastDoorFileTransferAttribute_AttachmentInfo *result;

  result = (BlastDoorFileTransferAttribute_AttachmentInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorFileTransferAttribute_AttachmentInfo_fileTransferAttribute_AttachmentInfo, type metadata accessor for FileTransferAttribute.AttachmentInfo);
}

@end
