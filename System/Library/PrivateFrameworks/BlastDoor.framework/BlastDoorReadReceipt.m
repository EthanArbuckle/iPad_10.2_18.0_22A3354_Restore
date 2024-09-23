@implementation BlastDoorReadReceipt

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for ReadReceipt, &OBJC_IVAR___BlastDoorReadReceipt_readReceipt);
}

- (BlastDoorMetadata)metadata
{
  BlastDoorReadReceipt *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4C0824();

  return (BlastDoorMetadata *)v3;
}

- (BlastDoorReadReceipt)init
{
  BlastDoorReadReceipt *result;

  result = (BlastDoorReadReceipt *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorReadReceipt_readReceipt, (uint64_t (*)(_QWORD))type metadata accessor for ReadReceipt);
}

@end
