@implementation NEIKEv2IPv4DHCPAttribute

+ (id)copyTypeDescription
{
  return CFSTR("IPv4 DHCP");
}

- (unint64_t)attributeType
{
  if (!self)
    return 6;
  if (self->super._customType)
    return self->super._customType;
  return 6;
}

- (unint64_t)valueType
{
  return 1;
}

- (id)attributeName
{
  const char *v3;
  __CFString *v4;

  if (!self)
    return CFSTR("AssignedIPv4DHCP");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedIPv4DHCP");
  return v4;
}

@end
