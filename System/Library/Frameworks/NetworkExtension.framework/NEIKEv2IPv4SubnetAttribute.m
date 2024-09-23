@implementation NEIKEv2IPv4SubnetAttribute

+ (id)copyTypeDescription
{
  return CFSTR("IPv4 Subnet");
}

- (unint64_t)attributeType
{
  if (!self)
    return 13;
  if (self->super._customType)
    return self->super._customType;
  return 13;
}

- (unint64_t)valueType
{
  return 3;
}

- (id)attributeName
{
  const char *v3;
  __CFString *v4;

  if (!self)
    return CFSTR("AssignedIPv4Subnet");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedIPv4Subnet");
  return v4;
}

@end
