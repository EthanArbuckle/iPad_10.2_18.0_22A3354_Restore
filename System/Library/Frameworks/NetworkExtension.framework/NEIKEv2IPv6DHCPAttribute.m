@implementation NEIKEv2IPv6DHCPAttribute

+ (id)copyTypeDescription
{
  return CFSTR("IPv6 DHCP");
}

- (unint64_t)attributeType
{
  if (!self)
    return 12;
  if (self->super._customType)
    return self->super._customType;
  return 12;
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
    return CFSTR("AssignedIPv6DHCP");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedIPv6DHCP");
  return v4;
}

@end
