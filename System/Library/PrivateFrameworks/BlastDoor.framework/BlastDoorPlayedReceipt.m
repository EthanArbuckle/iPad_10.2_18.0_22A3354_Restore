@implementation BlastDoorPlayedReceipt

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for PlayedReceipt, &OBJC_IVAR___BlastDoorPlayedReceipt_playedReceipt);
}

- (BlastDoorMetadata)metadata
{
  BlastDoorPlayedReceipt *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4BFC38();

  return (BlastDoorMetadata *)v3;
}

- (BlastDoorPlayedReceipt)init
{
  BlastDoorPlayedReceipt *result;

  result = (BlastDoorPlayedReceipt *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorPlayedReceipt_playedReceipt, (uint64_t (*)(_QWORD))type metadata accessor for PlayedReceipt);
}

@end
