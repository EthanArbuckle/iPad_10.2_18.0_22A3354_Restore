@implementation ACDAccountChange

- (ACDAccountChange)initWithChangeType:(int)a3 account:(id)a4 oldAccount:(id)a5
{
  id v9;
  id v10;
  ACDAccountChange *v11;
  ACDAccountChange *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ACDAccountChange;
  v11 = -[ACDAccountChange init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_changeType = a3;
    objc_storeStrong((id *)&v11->_account, a4);
    objc_storeStrong((id *)&v12->_oldAccount, a5);
  }

  return v12;
}

+ (id)changeWithChangeType:(int)a3 account:(id)a4 oldAccount:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  ACDAccountChange *v9;

  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = a4;
  v9 = -[ACDAccountChange initWithChangeType:account:oldAccount:]([ACDAccountChange alloc], "initWithChangeType:account:oldAccount:", v6, v8, v7);

  return v9;
}

- (int)changeType
{
  return self->_changeType;
}

- (ACAccount)account
{
  return self->_account;
}

- (ACAccount)oldAccount
{
  return self->_oldAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
