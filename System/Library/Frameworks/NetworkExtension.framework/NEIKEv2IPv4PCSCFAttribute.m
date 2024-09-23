@implementation NEIKEv2IPv4PCSCFAttribute

+ (id)copyTypeDescription
{
  return CFSTR("IPv4 PCSCF");
}

- (unint64_t)attributeType
{
  if (!self)
    return 20;
  if (self->super._customType)
    return self->super._customType;
  return 20;
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
    return CFSTR("AssignedIPv4PCSCF_STD");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedIPv4PCSCF_STD");
  return v4;
}

@end
