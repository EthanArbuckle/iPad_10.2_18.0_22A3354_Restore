@implementation ICASSelectedResultType

- (ICASSelectedResultType)initWithSelectedResultType:(int64_t)a3
{
  ICASSelectedResultType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASSelectedResultType;
  result = -[ICASSelectedResultType init](&v5, sel_init);
  if (result)
    result->_selectedResultType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASSelectedResultType selectedResultType](self, "selectedResultType", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("note");
  if (v3 == 2)
    return CFSTR("attachment");
  else
    return (id)v4;
}

- (int64_t)selectedResultType
{
  return self->_selectedResultType;
}

@end
