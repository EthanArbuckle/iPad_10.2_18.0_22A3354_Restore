@implementation ICASSelectedResultAccountType

- (ICASSelectedResultAccountType)initWithSelectedResultAccountType:(int64_t)a3
{
  ICASSelectedResultAccountType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASSelectedResultAccountType;
  result = -[ICASSelectedResultAccountType init](&v5, sel_init);
  if (result)
    result->_selectedResultAccountType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASSelectedResultAccountType selectedResultAccountType](self, "selectedResultAccountType", a3);
  if ((unint64_t)(v3 - 1) > 5)
    return CFSTR("unknown");
  else
    return off_1E771C4E8[v3 - 1];
}

- (int64_t)selectedResultAccountType
{
  return self->_selectedResultAccountType;
}

@end
