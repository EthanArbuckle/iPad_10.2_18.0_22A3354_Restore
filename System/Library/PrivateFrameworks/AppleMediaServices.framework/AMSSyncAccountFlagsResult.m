@implementation AMSSyncAccountFlagsResult

- (AMSSyncAccountFlagsResult)initWithAccountFlags:(id)a3
{
  id v5;
  AMSSyncAccountFlagsResult *v6;
  AMSSyncAccountFlagsResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSyncAccountFlagsResult;
  v6 = -[AMSSyncAccountFlagsResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountFlags, a3);

  return v7;
}

- (NSDictionary)accountFlags
{
  return self->_accountFlags;
}

- (void)setAccountFlags:(id)a3
{
  objc_storeStrong((id *)&self->_accountFlags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountFlags, 0);
}

@end
