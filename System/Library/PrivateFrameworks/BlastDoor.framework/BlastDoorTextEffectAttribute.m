@implementation BlastDoorTextEffectAttribute

- (NSString)description
{
  return (NSString *)sub_1AD4A7F38();
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_1AD4A8A64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextEffectAttribute_textEffectAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (unint64_t)type
{
  unint64_t result;
  char v3;

  result = sub_1AD4D92B0(self->textEffectAttribute[OBJC_IVAR___BlastDoorTextEffectAttribute_textEffectAttribute + 8]);
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

- (BlastDoorTextEffectAttribute)init
{
  BlastDoorTextEffectAttribute *result;

  result = (BlastDoorTextEffectAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
