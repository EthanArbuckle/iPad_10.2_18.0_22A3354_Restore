@implementation ICASEndMode

- (ICASEndMode)initWithEndMode:(int64_t)a3
{
  ICASEndMode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASEndMode;
  result = -[ICASEndMode init](&v5, sel_init);
  if (result)
    result->_endMode = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASEndMode endMode](self, "endMode", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("v1");
  if (v3 == 2)
    return CFSTR("v2");
  else
    return (id)v4;
}

- (int64_t)endMode
{
  return self->_endMode;
}

@end
