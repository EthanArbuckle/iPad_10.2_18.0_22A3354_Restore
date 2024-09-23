@implementation ASUserNotificationResponse

- (ASUserNotificationResponse)initWithActionIdentifier:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  ASUserNotificationResponse *v9;
  ASUserNotificationResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASUserNotificationResponse;
  v9 = -[ASUserNotificationResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionIdentifier, a3);
    objc_storeStrong((id *)&v10->_userInfo, a4);
  }

  return v10;
}

- (ASUserNotificationResponse)initWithCoder:(id)a3
{
  id v4;
  ASUserNotificationResponse *v5;
  uint64_t v6;
  NSString *actionIdentifier;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *userInfo;
  objc_super v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASUserNotificationResponse;
  v5 = -[ASUserNotificationResponse init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("userInfo"));
    v11 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *actionIdentifier;
  id v5;

  actionIdentifier = self->_actionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", actionIdentifier, CFSTR("actionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ASUserNotificationResponse actionIdentifier=%@ userInfo=%@"), self->_actionIdentifier, self->_userInfo);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
