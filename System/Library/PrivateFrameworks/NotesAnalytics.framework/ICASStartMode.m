@implementation ICASStartMode

- (ICASStartMode)initWithStartMode:(int64_t)a3
{
  ICASStartMode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASStartMode;
  result = -[ICASStartMode init](&v5, sel_init);
  if (result)
    result->_startMode = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASStartMode startMode](self, "startMode", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("v1");
  if (v3 == 2)
    return CFSTR("v2");
  else
    return (id)v4;
}

- (int64_t)startMode
{
  return self->_startMode;
}

@end
