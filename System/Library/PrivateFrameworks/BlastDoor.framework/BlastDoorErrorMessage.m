@implementation BlastDoorErrorMessage

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for ErrorMessage, &OBJC_IVAR___BlastDoorErrorMessage_errorMessage);
}

- (BlastDoorMetadata)metadata
{
  return (BlastDoorMetadata *)sub_1AD4ADC44(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Metadata, &OBJC_IVAR___BlastDoorErrorMessage_errorMessage, type metadata accessor for _ObjCMetadataWrapper, &OBJC_IVAR___BlastDoorMetadata_metadata);
}

- (unsigned)type
{
  char *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (char *)self + OBJC_IVAR___BlastDoorErrorMessage_errorMessage;
  v3 = type metadata accessor for ErrorMessage();
  v4 = sub_1AD4D9884(word_1AD68D988[v2[*(int *)(v3 + 20)]]);
  if ((v4 & 0x10000) != 0)
    __break(1u);
  return v4;
}

- (NSString)additionalInfo
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorErrorMessage_errorMessage;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for ErrorMessage() + 24) + 8])
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

- (BlastDoorErrorMessage)init
{
  BlastDoorErrorMessage *result;

  result = (BlastDoorErrorMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorErrorMessage_errorMessage, (uint64_t (*)(_QWORD))type metadata accessor for ErrorMessage);
}

@end
