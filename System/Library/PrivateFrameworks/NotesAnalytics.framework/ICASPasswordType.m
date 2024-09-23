@implementation ICASPasswordType

- (ICASPasswordType)initWithPasswordType:(int64_t)a3
{
  ICASPasswordType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASPasswordType;
  result = -[ICASPasswordType init](&v5, sel_init);
  if (result)
    result->_passwordType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASPasswordType passwordType](self, "passwordType", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("v1");
  if (v3 == 2)
    return CFSTR("v2");
  else
    return (id)v4;
}

- (int64_t)passwordType
{
  return self->_passwordType;
}

@end
