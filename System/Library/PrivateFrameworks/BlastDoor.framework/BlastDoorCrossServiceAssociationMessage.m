@implementation BlastDoorCrossServiceAssociationMessage

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for CrossServiceAssociationMessage, &OBJC_IVAR___BlastDoorCrossServiceAssociationMessage_crossServiceAssociationMessage);
}

- (BlastDoorMetadata)metadata
{
  return (BlastDoorMetadata *)sub_1AD4ADC44(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Metadata, &OBJC_IVAR___BlastDoorCrossServiceAssociationMessage_crossServiceAssociationMessage, type metadata accessor for _ObjCMetadataWrapper, &OBJC_IVAR___BlastDoorMetadata_metadata);
}

- (NSUUID)replacementGUID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = sub_1AD63B084();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___BlastDoorCrossServiceAssociationMessage_crossServiceAssociationMessage;
  v8 = type metadata accessor for CrossServiceAssociationMessage();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 20)], v3);
  v9 = (void *)sub_1AD63B060();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v9;
}

- (BlastDoorCrossServiceAssociationMessage)init
{
  BlastDoorCrossServiceAssociationMessage *result;

  result = (BlastDoorCrossServiceAssociationMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorCrossServiceAssociationMessage_crossServiceAssociationMessage, (uint64_t (*)(_QWORD))type metadata accessor for CrossServiceAssociationMessage);
}

@end
