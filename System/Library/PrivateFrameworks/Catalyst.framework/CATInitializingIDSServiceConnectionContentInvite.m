@implementation CATInitializingIDSServiceConnectionContentInvite

- (CATInitializingIDSServiceConnectionContentInvite)init
{
  return -[CATInitializingIDSServiceConnectionContentInvite initWithUserInfo:](self, "initWithUserInfo:", 0);
}

- (CATInitializingIDSServiceConnectionContentInvite)initWithUserInfo:(id)a3
{
  id v4;
  CATInitializingIDSServiceConnectionContentInvite *v5;
  uint64_t v6;
  NSDictionary *userInfo;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATInitializingIDSServiceConnectionContentInvite;
  v5 = -[CATInitializingIDSServiceConnectionContentInvite init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v6;

  }
  return v5;
}

- (int64_t)contentType
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[CATInitializingIDSServiceConnectionContentInvite userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("UserInfo"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v6;
}

+ (id)instanceWithDictionary:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UserInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUserInfo:", v4);

  return v5;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
