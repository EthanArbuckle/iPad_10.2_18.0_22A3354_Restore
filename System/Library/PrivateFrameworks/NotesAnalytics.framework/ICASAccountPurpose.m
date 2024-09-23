@implementation ICASAccountPurpose

- (ICASAccountPurpose)initWithAccountPurpose:(int64_t)a3
{
  ICASAccountPurpose *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASAccountPurpose;
  result = -[ICASAccountPurpose init](&v5, sel_init);
  if (result)
    result->_accountPurpose = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASAccountPurpose accountPurpose](self, "accountPurpose", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771BE60[v3 - 1];
}

- (int64_t)accountPurpose
{
  return self->_accountPurpose;
}

@end
