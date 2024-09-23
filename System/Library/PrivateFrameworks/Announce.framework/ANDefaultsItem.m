@implementation ANDefaultsItem

+ (id)itemWithValue:(id)a3 userInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDefaultValue:", v6);

  objc_msgSend(v7, "setUserInfo:", v5);
  return v7;
}

- (NSObject)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValue, a3);
}

- (NSString)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
}

@end
