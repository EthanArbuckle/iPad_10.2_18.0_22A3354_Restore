@implementation BlastDoorMentionAttribute

- (NSString)description
{
  return (NSString *)sub_1AD4A7BF4();
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_1AD4A8A64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMentionAttribute_mentionAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSString)uri
{
  return (NSString *)sub_1AD4CFC08();
}

- (BlastDoorMentionAttribute)init
{
  BlastDoorMentionAttribute *result;

  result = (BlastDoorMentionAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
