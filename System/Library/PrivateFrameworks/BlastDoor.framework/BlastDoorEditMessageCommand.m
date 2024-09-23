@implementation BlastDoorEditMessageCommand

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for EditMessageCommand, &OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand);
}

- (BlastDoorMetadata)metadata
{
  return (BlastDoorMetadata *)sub_1AD4ADC44(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Metadata, &OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand, type metadata accessor for _ObjCMetadataWrapper, &OBJC_IVAR___BlastDoorMetadata_metadata);
}

- (NSString)editedMessageGUID
{
  return (NSString *)sub_1AD4CEBF0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand, (void (*)(_QWORD))type metadata accessor for EditMessageCommand);
}

- (int64_t)editType
{
  char *v2;
  int64_t result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand;
  result = v2[*(int *)(type metadata accessor for EditMessageCommand() + 24)];
  if ((unint64_t)result > 2)
    __break(1u);
  return result;
}

- (BOOL)has_editedMessagePartIndex
{
  return sub_1AD4B57E8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand, (uint64_t (*)(_QWORD))type metadata accessor for EditMessageCommand);
}

- (int64_t)editedMessagePartIndex
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand;
  v3 = &v2[*(int *)(type metadata accessor for EditMessageCommand() + 28)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BlastDoorMessageContent)editedMessagePartBody
{
  char *v2;
  uint64_t v3;
  BlastDoorEditMessageCommand *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  char *v14;
  char *v15;
  objc_super v17;

  v2 = (char *)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand;
  v3 = type metadata accessor for EditMessageCommand();
  v4 = 0;
  v5 = &v2[*(int *)(v3 + 32)];
  v6 = *((_QWORD *)v5 + 1);
  if (v6 != 1)
  {
    v8 = *((_QWORD *)v5 + 5);
    v7 = *((_QWORD *)v5 + 6);
    v10 = *((_QWORD *)v5 + 3);
    v9 = *((_QWORD *)v5 + 4);
    v11 = *((_QWORD *)v5 + 2);
    v12 = *(_QWORD *)v5;
    v13 = (objc_class *)type metadata accessor for _ObjCMessageContentWrapper();
    v14 = (char *)objc_allocWithZone(v13);
    v15 = &v14[OBJC_IVAR___BlastDoorMessageContent_messageContent];
    *(_QWORD *)v15 = v12;
    *((_QWORD *)v15 + 1) = v6;
    *((_QWORD *)v15 + 2) = v11;
    *((_QWORD *)v15 + 3) = v10;
    *((_QWORD *)v15 + 4) = v9;
    *((_QWORD *)v15 + 5) = v8;
    *((_QWORD *)v15 + 6) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1AD00C45C(v9);
    v17.receiver = v14;
    v17.super_class = v13;
    v4 = -[BlastDoorEditMessageCommand init](&v17, sel_init);
  }
  return (BlastDoorMessageContent *)v4;
}

- (BOOL)has_shouldRetractSubject
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand;
  return v2[*(int *)(type metadata accessor for EditMessageCommand() + 36)] != 2;
}

- (BOOL)shouldRetractSubject
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand;
  return v2[*(int *)(type metadata accessor for EditMessageCommand() + 36)] & 1;
}

- (BlastDoorMessageContent)messageContent
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  char *v13;
  objc_super v15;

  v2 = (char *)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand;
  v3 = &v2[*(int *)(type metadata accessor for EditMessageCommand() + 40)];
  v5 = *(_QWORD *)v3;
  v4 = *((_QWORD *)v3 + 1);
  v7 = *((_QWORD *)v3 + 2);
  v6 = *((_QWORD *)v3 + 3);
  v8 = *((_QWORD *)v3 + 4);
  v9 = *((_QWORD *)v3 + 5);
  v10 = *((_QWORD *)v3 + 6);
  v11 = (objc_class *)type metadata accessor for _ObjCMessageContentWrapper();
  v12 = (char *)objc_allocWithZone(v11);
  v13 = &v12[OBJC_IVAR___BlastDoorMessageContent_messageContent];
  *(_QWORD *)v13 = v5;
  *((_QWORD *)v13 + 1) = v4;
  *((_QWORD *)v13 + 2) = v7;
  *((_QWORD *)v13 + 3) = v6;
  *((_QWORD *)v13 + 4) = v8;
  *((_QWORD *)v13 + 5) = v9;
  *((_QWORD *)v13 + 6) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AD00C45C(v8);
  v15.receiver = v12;
  v15.super_class = v11;
  return (BlastDoorMessageContent *)-[BlastDoorEditMessageCommand init](&v15, sel_init);
}

- (BlastDoorEditMessageCommand)init
{
  BlastDoorEditMessageCommand *result;

  result = (BlastDoorEditMessageCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand, (uint64_t (*)(_QWORD))type metadata accessor for EditMessageCommand);
}

@end
