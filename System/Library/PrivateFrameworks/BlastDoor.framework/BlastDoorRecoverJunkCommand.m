@implementation BlastDoorRecoverJunkCommand

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for RecoverJunkCommand, &OBJC_IVAR___BlastDoorRecoverJunkCommand_recoverJunkCommand);
}

- (BlastDoorMetadata)metadata
{
  BlastDoorRecoverJunkCommand *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4C09A0();

  return (BlastDoorMetadata *)v3;
}

- (BlastDoorRecoverJunkCommand)init
{
  BlastDoorRecoverJunkCommand *result;

  result = (BlastDoorRecoverJunkCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorRecoverJunkCommand_recoverJunkCommand, (uint64_t (*)(_QWORD))type metadata accessor for RecoverJunkCommand);
}

@end
