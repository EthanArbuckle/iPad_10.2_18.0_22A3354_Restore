@implementation ICASResultType

- (ICASResultType)initWithResultType:(int64_t)a3
{
  ICASResultType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASResultType;
  result = -[ICASResultType init](&v5, sel_init);
  if (result)
    result->_resultType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASResultType resultType](self, "resultType", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771BDE8[v3 - 1];
}

- (int64_t)resultType
{
  return self->_resultType;
}

@end
