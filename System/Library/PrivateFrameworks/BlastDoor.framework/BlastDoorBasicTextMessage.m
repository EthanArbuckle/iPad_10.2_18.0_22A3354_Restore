@implementation BlastDoorBasicTextMessage

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for BasicTextMessage, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage);
}

- (BlastDoorMetadata)metadata
{
  return (BlastDoorMetadata *)sub_1AD4ADC44(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Metadata, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, type metadata accessor for _ObjCMetadataWrapper, &OBJC_IVAR___BlastDoorMetadata_metadata);
}

- (BlastDoorBasicTextMessageMessageTypeWrapper)messageSubType
{
  char *v2;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  objc_super v7;
  _OWORD v8[10];

  v2 = (char *)self + OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage;
  v3 = type metadata accessor for BasicTextMessage();
  sub_1AD141274(&v2[*(int *)(v3 + 20)], v8);
  v4 = (objc_class *)type metadata accessor for _ObjCEnumBasicTextMessageMessageTypeWrapper();
  v5 = (char *)objc_allocWithZone(v4);
  sub_1AD141274(v8, &v5[OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType]);
  sub_1AD1414D0((uint64_t)v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1AD1412AC);
  v7.receiver = v5;
  v7.super_class = v4;
  return (BlastDoorBasicTextMessageMessageTypeWrapper *)-[BlastDoorBasicTextMessage init](&v7, sel_init);
}

- (NSString)threadIdentifierGUID
{
  return (NSString *)sub_1AD4B4E7C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for BasicTextMessage, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage);
}

- (NSString)threadOriginatorFallbackHash
{
  return (NSString *)sub_1AD4BCC2C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for BasicTextMessage, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage);
}

- (NSString)groupID
{
  return (NSString *)sub_1AD4CBD50((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for BasicTextMessage, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage);
}

- (NSString)currentGroupName
{
  return (NSString *)sub_1AD4C0E6C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for BasicTextMessage, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage);
}

- (BOOL)has_groupParticipantVersion
{
  return sub_1AD4B5B28((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(_QWORD))type metadata accessor for BasicTextMessage);
}

- (unint64_t)groupParticipantVersion
{
  return sub_1AD4B5BC8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(_QWORD))type metadata accessor for BasicTextMessage);
}

- (BOOL)has_groupProtocolVersion
{
  return sub_1AD4C5FE4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(_QWORD))type metadata accessor for BasicTextMessage);
}

- (unint64_t)groupProtocolVersion
{
  return sub_1AD4C6084((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(_QWORD))type metadata accessor for BasicTextMessage);
}

- (BOOL)has_replicationSourceID
{
  return sub_1AD4CC294((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(_QWORD))type metadata accessor for BasicTextMessage);
}

- (int64_t)replicationSourceID
{
  return sub_1AD4CC334((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(_QWORD))type metadata accessor for BasicTextMessage);
}

- (NSArray)replicatedFallbackGUIDs
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for BasicTextMessage() + 52)])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B990();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (BlastDoorBasicTextMessage)init
{
  BlastDoorBasicTextMessage *result;

  result = (BlastDoorBasicTextMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(_QWORD))type metadata accessor for BasicTextMessage);
}

@end
