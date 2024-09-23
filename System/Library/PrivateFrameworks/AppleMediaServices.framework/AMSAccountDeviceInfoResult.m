@implementation AMSAccountDeviceInfoResult

- (AMSAccountDeviceInfoResult)initWithAccount:(id)a3 responseDictionary:(id)a4
{
  id v7;
  id v8;
  AMSAccountDeviceInfoResult *v9;
  AMSAccountDeviceInfoResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSAccountDeviceInfoResult;
  v9 = -[AMSAccountDeviceInfoResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_rawResult, a4);
  }

  return v10;
}

- (NSNumber)isBundleOwner
{
  void *v2;
  void *v3;
  id v4;

  -[AMSAccountDeviceInfoResult rawResult](self, "rawResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isBundleOwner"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (id)description
{
  void *v2;
  void *v3;

  -[AMSAccountDeviceInfoResult rawResult](self, "rawResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)rawResult
{
  return self->_rawResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawResult, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
