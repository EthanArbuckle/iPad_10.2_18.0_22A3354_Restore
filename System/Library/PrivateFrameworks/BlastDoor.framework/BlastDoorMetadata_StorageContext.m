@implementation BlastDoorMetadata_StorageContext

- (NSString)description
{
  void *v2;

  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isFromStorage
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BlastDoorMetadata_StorageContext_metadata_StorageContext);
}

- (BOOL)isLastFromStorage
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BlastDoorMetadata_StorageContext_metadata_StorageContext + 1);
}

- (BlastDoorMetadata_StorageContext)init
{
  BlastDoorMetadata_StorageContext *result;

  result = (BlastDoorMetadata_StorageContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
