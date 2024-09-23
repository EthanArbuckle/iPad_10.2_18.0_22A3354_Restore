@implementation NEIKEv2AppVersionAttribute

+ (id)copyTypeDescription
{
  return CFSTR("App Version");
}

- (unint64_t)attributeType
{
  if (!self)
    return 7;
  if (self->super._customType)
    return self->super._customType;
  return 7;
}

- (id)attributeName
{
  const char *v3;
  __CFString *v4;

  if (!self)
    return CFSTR("AssignedAppVersion");
  if (self->super._customType && objc_getProperty(self, a2, 8, 1))
    v4 = (__CFString *)objc_getProperty(self, v3, 8, 1);
  else
    v4 = CFSTR("AssignedAppVersion");
  return v4;
}

- (BOOL)validForChildlessSA
{
  return 1;
}

@end
