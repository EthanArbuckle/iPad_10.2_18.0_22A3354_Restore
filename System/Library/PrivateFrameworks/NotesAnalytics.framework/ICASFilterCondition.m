@implementation ICASFilterCondition

- (ICASFilterCondition)initWithFilterCondition:(int64_t)a3
{
  ICASFilterCondition *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASFilterCondition;
  result = -[ICASFilterCondition init](&v5, sel_init);
  if (result)
    result->_filterCondition = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASFilterCondition filterCondition](self, "filterCondition", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("all");
  if (v3 == 2)
    return CFSTR("any");
  else
    return (id)v4;
}

- (int64_t)filterCondition
{
  return self->_filterCondition;
}

@end
