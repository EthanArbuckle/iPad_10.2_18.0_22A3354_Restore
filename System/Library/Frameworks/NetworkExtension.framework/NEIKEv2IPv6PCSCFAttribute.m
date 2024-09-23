@implementation NEIKEv2IPv6PCSCFAttribute

+ (id)copyTypeDescription
{
  return CFSTR("IPv6 PCSCF");
}

- (unint64_t)attributeType
{
  if (!self)
    return 21;
  if (self->super._customType)
    return self->super._customType;
  return 21;
}

- (unint64_t)valueType
{
  return 2;
}

- (id)attributeName
{
  const char *v3;
  __CFString *v4;

  if (!self)
    return CFSTR("AssignedIPv6PCSCF_STD");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedIPv6PCSCF_STD");
  return v4;
}

@end
