@implementation BlastDoorCombinedPluginAttachmentInfo

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for CombinedPluginAttachmentInfo, &OBJC_IVAR___BlastDoorCombinedPluginAttachmentInfo_combinedPluginAttachmentInfo);
}

- (NSURL)attachmentURL
{
  return (NSURL *)sub_1AD4CE9A8(self, (uint64_t)a2, (void (*)(void))sub_1AD4AF9E4);
}

- (NSData)signature
{
  char *v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = (char *)self + OBJC_IVAR___BlastDoorCombinedPluginAttachmentInfo_combinedPluginAttachmentInfo;
  v3 = (uint64_t *)&v2[*(int *)(type metadata accessor for CombinedPluginAttachmentInfo() + 20)];
  v4 = *v3;
  v5 = v3[1];
  sub_1AD0040A0(*v3, v5);
  v6 = (void *)sub_1AD63AFA0();
  sub_1AD00412C(v4, v5);
  return (NSData *)v6;
}

- (NSString)ownerID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  void *v7;
  NSString *result;
  uint64_t v9;

  v3 = type metadata accessor for CombinedPluginAttachmentInfo();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorCombinedPluginAttachmentInfo_combinedPluginAttachmentInfo, (uint64_t)v5, v6);
  if (*(_QWORD *)&v5[*(int *)(v3 + 24) + 24])
  {
    swift_bridgeObjectRetain();
    sub_1AD066230((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CombinedPluginAttachmentInfo);
    v7 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
    return (NSString *)v7;
  }
  else
  {
    result = (NSString *)sub_1AD63BE28();
    __break(1u);
  }
  return result;
}

- (unint64_t)expectedFileSize
{
  return sub_1AD4CED78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorCombinedPluginAttachmentInfo_combinedPluginAttachmentInfo, (uint64_t (*)(_QWORD))type metadata accessor for CombinedPluginAttachmentInfo);
}

- (NSData)encryptionKey
{
  char *v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = (char *)self + OBJC_IVAR___BlastDoorCombinedPluginAttachmentInfo_combinedPluginAttachmentInfo;
  v3 = (uint64_t *)&v2[*(int *)(type metadata accessor for CombinedPluginAttachmentInfo() + 32)];
  v4 = *v3;
  v5 = v3[1];
  sub_1AD0040A0(*v3, v5);
  v6 = (void *)sub_1AD63AFA0();
  sub_1AD00412C(v4, v5);
  return (NSData *)v6;
}

- (BlastDoorCombinedPluginAttachmentInfo)init
{
  BlastDoorCombinedPluginAttachmentInfo *result;

  result = (BlastDoorCombinedPluginAttachmentInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorCombinedPluginAttachmentInfo_combinedPluginAttachmentInfo, (uint64_t (*)(_QWORD))type metadata accessor for CombinedPluginAttachmentInfo);
}

@end
