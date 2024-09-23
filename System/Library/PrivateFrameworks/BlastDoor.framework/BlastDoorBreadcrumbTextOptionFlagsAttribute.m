@implementation BlastDoorBreadcrumbTextOptionFlagsAttribute

- (NSString)description
{
  return (NSString *)sub_1AD4A7920();
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_1AD4A8A64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBreadcrumbTextOptionFlagsAttribute_breadcrumbTextOptionFlagsAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (unint64_t)optionFlags
{
  return *(_QWORD *)&self->breadcrumbTextOptionFlagsAttribute[OBJC_IVAR___BlastDoorBreadcrumbTextOptionFlagsAttribute_breadcrumbTextOptionFlagsAttribute
                                                            + 8];
}

- (BlastDoorBreadcrumbTextOptionFlagsAttribute)init
{
  BlastDoorBreadcrumbTextOptionFlagsAttribute *result;

  result = (BlastDoorBreadcrumbTextOptionFlagsAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
