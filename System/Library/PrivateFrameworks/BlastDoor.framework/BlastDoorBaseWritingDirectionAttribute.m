@implementation BlastDoorBaseWritingDirectionAttribute

- (NSString)description
{
  return (NSString *)sub_1AD4A7F38();
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_1AD4A8A64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBaseWritingDirectionAttribute_baseWritingDirectionAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (int64_t)direction
{
  unint64_t v2;

  v2 = *(unsigned __int8 *)(self + OBJC_IVAR___BlastDoorBaseWritingDirectionAttribute_baseWritingDirectionAttribute + 16);
  if (v2 <= 2)
    return v2 - 1;
  __break(1u);
  return self;
}

- (BlastDoorBaseWritingDirectionAttribute)init
{
  BlastDoorBaseWritingDirectionAttribute *result;

  result = (BlastDoorBaseWritingDirectionAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
