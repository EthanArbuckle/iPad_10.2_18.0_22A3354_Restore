@implementation NEIKEv2ResponderTransportIPv6Address

+ (id)copyTypeDescription
{
  return CFSTR("IPv6 Responder Transport Address");
}

- (unint64_t)attributeType
{
  if (!self)
    return 25959;
  if (self->super._customType)
    return self->super._customType;
  return 25959;
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
    return CFSTR("AssignedResponderTransportIPv6Address");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedResponderTransportIPv6Address");
  return v4;
}

@end
