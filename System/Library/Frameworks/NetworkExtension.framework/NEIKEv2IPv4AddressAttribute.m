@implementation NEIKEv2IPv4AddressAttribute

+ (id)copyTypeDescription
{
  return CFSTR("IPv4 Address");
}

- (unint64_t)attributeType
{
  if (!self)
    return 1;
  if (self->super._customType <= 1)
    return 1;
  return self->super._customType;
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
    return CFSTR("AssignedIPv4Address");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedIPv4Address");
  return v4;
}

@end
