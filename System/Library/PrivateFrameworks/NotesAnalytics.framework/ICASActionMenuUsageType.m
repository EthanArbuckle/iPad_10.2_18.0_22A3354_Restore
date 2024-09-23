@implementation ICASActionMenuUsageType

- (ICASActionMenuUsageType)initWithActionMenuUsageType:(int64_t)a3
{
  ICASActionMenuUsageType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASActionMenuUsageType;
  result = -[ICASActionMenuUsageType init](&v5, sel_init);
  if (result)
    result->_actionMenuUsageType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASActionMenuUsageType actionMenuUsageType](self, "actionMenuUsageType", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771C850[v3 - 1];
}

- (int64_t)actionMenuUsageType
{
  return self->_actionMenuUsageType;
}

@end
