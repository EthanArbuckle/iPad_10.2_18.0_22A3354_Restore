@implementation BlastDoorChatSessionClose

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for ChatSessionClose, &OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose);
}

- (BlastDoorMetadata)metadata
{
  return (BlastDoorMetadata *)sub_1AD4ADC44(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Metadata, &OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose, type metadata accessor for _ObjCMetadataWrapper, &OBJC_IVAR___BlastDoorMetadata_metadata);
}

- (BOOL)isEmergencySOS
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose;
  return v2[*(int *)(type metadata accessor for ChatSessionClose() + 20)];
}

- (int64_t)version
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose;
  return *(_QWORD *)&v2[*(int *)(type metadata accessor for ChatSessionClose() + 24)];
}

- (NSString)handle
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for ChatSessionClose() + 28) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)name
{
  return (NSString *)sub_1AD4C2594((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose, (uint64_t (*)(_QWORD))type metadata accessor for ChatSessionClose);
}

- (NSString)conversationID
{
  void *v2;

  type metadata accessor for ChatSessionClose();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)deleteConversation
{
  return sub_1AD4C271C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose, (uint64_t (*)(_QWORD))type metadata accessor for ChatSessionClose);
}

- (BlastDoorChatSessionClose)init
{
  BlastDoorChatSessionClose *result;

  result = (BlastDoorChatSessionClose *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose, (uint64_t (*)(_QWORD))type metadata accessor for ChatSessionClose);
}

@end
