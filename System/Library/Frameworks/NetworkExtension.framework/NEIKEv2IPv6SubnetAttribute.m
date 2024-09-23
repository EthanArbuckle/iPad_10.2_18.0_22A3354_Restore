@implementation NEIKEv2IPv6SubnetAttribute

+ (id)copyTypeDescription
{
  return CFSTR("IPv6 Subnet");
}

- (unint64_t)attributeType
{
  if (!self)
    return 15;
  if (self->super._customType)
    return self->super._customType;
  return 15;
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
    return CFSTR("AssignedIPv6Subnet");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedIPv6Subnet");
  return v4;
}

@end
