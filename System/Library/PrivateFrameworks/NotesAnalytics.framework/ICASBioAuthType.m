@implementation ICASBioAuthType

- (ICASBioAuthType)initWithBioAuthType:(int64_t)a3
{
  ICASBioAuthType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASBioAuthType;
  result = -[ICASBioAuthType init](&v5, sel_init);
  if (result)
    result->_bioAuthType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASBioAuthType bioAuthType](self, "bioAuthType", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("face");
  if (v3 == 2)
    return CFSTR("finger");
  else
    return (id)v4;
}

- (int64_t)bioAuthType
{
  return self->_bioAuthType;
}

@end
