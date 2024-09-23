@implementation ICASSessionType

- (ICASSessionType)initWithSessionType:(int64_t)a3
{
  ICASSessionType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASSessionType;
  result = -[ICASSessionType init](&v5, sel_init);
  if (result)
    result->_sessionType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASSessionType sessionType](self, "sessionType", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771C5F0[v3 - 1];
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

@end
