@implementation BlastDoorMessagePartAttribute

- (NSString)description
{
  return (NSString *)sub_1AD4A7920();
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_1AD4A8A64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMessagePartAttribute_messagePartAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (unint64_t)partNumber
{
  return *(_QWORD *)&self->messagePartAttribute[OBJC_IVAR___BlastDoorMessagePartAttribute_messagePartAttribute + 8];
}

- (BlastDoorMessagePartAttribute)init
{
  BlastDoorMessagePartAttribute *result;

  result = (BlastDoorMessagePartAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
