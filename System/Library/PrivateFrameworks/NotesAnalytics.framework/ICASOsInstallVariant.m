@implementation ICASOsInstallVariant

- (ICASOsInstallVariant)initWithOsInstallVariant:(int64_t)a3
{
  ICASOsInstallVariant *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASOsInstallVariant;
  result = -[ICASOsInstallVariant init](&v5, sel_init);
  if (result)
    result->_osInstallVariant = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASOsInstallVariant osInstallVariant](self, "osInstallVariant", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("internal");
  if (v3 == 2)
    return CFSTR("external");
  else
    return (id)v4;
}

- (int64_t)osInstallVariant
{
  return self->_osInstallVariant;
}

@end
