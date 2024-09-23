@implementation ICASErrorStatus

- (ICASErrorStatus)initWithErrorStatus:(int64_t)a3
{
  ICASErrorStatus *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASErrorStatus;
  result = -[ICASErrorStatus init](&v5, sel_init);
  if (result)
    result->_errorStatus = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASErrorStatus errorStatus](self, "errorStatus", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771BF10[v3 - 1];
}

- (int64_t)errorStatus
{
  return self->_errorStatus;
}

@end
