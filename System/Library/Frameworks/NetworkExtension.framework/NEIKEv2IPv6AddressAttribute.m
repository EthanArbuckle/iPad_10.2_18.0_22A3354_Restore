@implementation NEIKEv2IPv6AddressAttribute

+ (id)copyTypeDescription
{
  return CFSTR("IPv6 Address");
}

- (unint64_t)attributeType
{
  if (!self)
    return 8;
  if (self->super._customType)
    return self->super._customType;
  return 8;
}

- (unint64_t)valueType
{
  return 4;
}

- (id)attributeName
{
  const char *v3;
  __CFString *v4;

  if (!self)
    return CFSTR("AssignedIPv6Address");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedIPv6Address");
  return v4;
}

@end
