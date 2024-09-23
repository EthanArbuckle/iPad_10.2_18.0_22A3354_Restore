@implementation AMSSyncAccountFlagsTask

- (AMSSyncAccountFlagsTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSSyncAccountFlagsTask *v9;
  AMSSyncAccountFlagsTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSSyncAccountFlagsTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (id)performSync
{
  objc_super v3;
  _QWORD v4[5];

  v4[1] = 3221225472;
  v4[2] = sub_230ED3CA8;
  v4[3] = &unk_24FFA3020;
  v4[4] = self;
  v3.receiver = self;
  v3.super_class = (Class)AMSSyncAccountFlagsTask;
  v4[0] = MEMORY[0x24BDAC760];
  -[AMSTask performTaskWithBlock:](&v3, sel_performTaskWithBlock_, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
