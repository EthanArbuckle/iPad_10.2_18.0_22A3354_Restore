@implementation NEIKEv2InitiatorTransportIPv6Address

+ (id)copyTypeDescription
{
  return CFSTR("IPv6 Initiator Transport Address");
}

- (unint64_t)attributeType
{
  if (!self)
    return 25958;
  if (self->super._customType)
    return self->super._customType;
  return 25958;
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
    return CFSTR("AssignedInitiatorTransportIPv6Address");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedInitiatorTransportIPv6Address");
  return v4;
}

@end
