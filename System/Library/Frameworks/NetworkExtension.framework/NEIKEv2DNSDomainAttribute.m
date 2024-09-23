@implementation NEIKEv2DNSDomainAttribute

+ (id)copyTypeDescription
{
  return CFSTR("DNS Domain");
}

- (unint64_t)attributeType
{
  if (!self)
    return 25;
  if (self->super._customType)
    return self->super._customType;
  return 25;
}

- (id)attributeName
{
  const char *v3;
  __CFString *v4;

  if (!self)
    return CFSTR("AssignedDNSDomain");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedDNSDomain");
  return v4;
}

@end
