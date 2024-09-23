@implementation NEIKEv2IPv4DNSAttribute

+ (id)copyTypeDescription
{
  return CFSTR("IPv4 DNS");
}

- (unint64_t)attributeType
{
  if (!self)
    return 3;
  if (self->super._customType)
    return self->super._customType;
  return 3;
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
    return CFSTR("AssignedIPv4DNS");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedIPv4DNS");
  return v4;
}

@end
