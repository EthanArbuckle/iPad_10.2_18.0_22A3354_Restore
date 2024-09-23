@implementation ICASSessionDetailType

- (ICASSessionDetailType)initWithSessionDetailType:(int64_t)a3
{
  ICASSessionDetailType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASSessionDetailType;
  result = -[ICASSessionDetailType init](&v5, sel_init);
  if (result)
    result->_sessionDetailType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASSessionDetailType sessionDetailType](self, "sessionDetailType", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771C398[v3 - 1];
}

- (int64_t)sessionDetailType
{
  return self->_sessionDetailType;
}

@end
