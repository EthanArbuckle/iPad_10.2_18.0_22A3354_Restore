@implementation BlastDoorRepositionStickerCommand

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for RepositionStickerCommand, &OBJC_IVAR___BlastDoorRepositionStickerCommand_repositionStickerCommand);
}

- (BlastDoorMetadata)metadata
{
  return (BlastDoorMetadata *)sub_1AD4ADC44(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Metadata, &OBJC_IVAR___BlastDoorRepositionStickerCommand_repositionStickerCommand, type metadata accessor for _ObjCMetadataWrapper, &OBJC_IVAR___BlastDoorMetadata_metadata);
}

- (BlastDoorStickerAttachmentInfo)stickerMetadata
{
  char *v2;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  objc_super v7;
  _QWORD __dst[35];

  v2 = (char *)self + OBJC_IVAR___BlastDoorRepositionStickerCommand_repositionStickerCommand;
  v3 = type metadata accessor for RepositionStickerCommand();
  memcpy(__dst, &v2[*(int *)(v3 + 20)], 0x111uLL);
  v4 = (objc_class *)type metadata accessor for _ObjCStickerAttachmentInfoWrapper();
  v5 = (char *)objc_allocWithZone(v4);
  memcpy(&v5[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo], __dst, 0x111uLL);
  sub_1AD282B4C(__dst);
  v7.receiver = v5;
  v7.super_class = v4;
  return (BlastDoorStickerAttachmentInfo *)-[BlastDoorRepositionStickerCommand init](&v7, sel_init);
}

- (NSString)stickerEditedMessageGUID
{
  return (NSString *)sub_1AD4CECB4((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___BlastDoorRepositionStickerCommand_repositionStickerCommand, (void (*)(_QWORD))type metadata accessor for RepositionStickerCommand);
}

- (BlastDoorRepositionStickerCommand)init
{
  BlastDoorRepositionStickerCommand *result;

  result = (BlastDoorRepositionStickerCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorRepositionStickerCommand_repositionStickerCommand, (uint64_t (*)(_QWORD))type metadata accessor for RepositionStickerCommand);
}

@end
