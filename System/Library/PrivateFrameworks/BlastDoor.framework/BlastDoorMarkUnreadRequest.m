@implementation BlastDoorMarkUnreadRequest

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for MarkUnreadRequest, &OBJC_IVAR___BlastDoorMarkUnreadRequest_markUnreadRequest);
}

- (BlastDoorMetadata)metadata
{
  BlastDoorMarkUnreadRequest *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4B5368();

  return (BlastDoorMetadata *)v3;
}

- (BlastDoorMarkUnreadRequest)init
{
  BlastDoorMarkUnreadRequest *result;

  result = (BlastDoorMarkUnreadRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorMarkUnreadRequest_markUnreadRequest, (uint64_t (*)(_QWORD))type metadata accessor for MarkUnreadRequest);
}

@end
