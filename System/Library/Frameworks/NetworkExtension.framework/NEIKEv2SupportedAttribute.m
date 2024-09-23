@implementation NEIKEv2SupportedAttribute

+ (id)copyTypeDescription
{
  return CFSTR("Supported Attributes");
}

- (unint64_t)attributeType
{
  if (!self)
    return 14;
  if (self->super._customType)
    return self->super._customType;
  return 14;
}

- (id)attributeName
{
  const char *v3;
  __CFString *v4;

  if (!self)
    return CFSTR("AssignedSupportedAttribute");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedSupportedAttribute");
  return v4;
}

- (BOOL)validForChildlessSA
{
  return 1;
}

@end
