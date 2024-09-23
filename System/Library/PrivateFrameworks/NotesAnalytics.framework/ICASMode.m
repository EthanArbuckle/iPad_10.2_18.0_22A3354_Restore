@implementation ICASMode

- (ICASMode)initWithMode:(int64_t)a3
{
  ICASMode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASMode;
  result = -[ICASMode init](&v5, sel_init);
  if (result)
    result->_mode = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASMode mode](self, "mode", a3);
  if ((unint64_t)(v3 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E771CEC8[v3 - 1];
}

- (int64_t)mode
{
  return self->_mode;
}

@end
