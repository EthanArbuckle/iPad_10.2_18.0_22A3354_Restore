@implementation ICASAccountType

- (ICASAccountType)initWithAccountType:(int64_t)a3
{
  ICASAccountType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASAccountType;
  result = -[ICASAccountType init](&v5, sel_init);
  if (result)
    result->_accountType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASAccountType accountType](self, "accountType", a3);
  if ((unint64_t)(v3 - 1) > 0xC)
    return CFSTR("unknown");
  else
    return off_1E771C788[v3 - 1];
}

- (int64_t)accountType
{
  return self->_accountType;
}

@end
