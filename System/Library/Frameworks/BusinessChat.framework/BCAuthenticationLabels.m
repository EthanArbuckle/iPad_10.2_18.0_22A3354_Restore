@implementation BCAuthenticationLabels

- (BCAuthenticationLabels)initWithDictionary:(id)a3
{
  id v4;
  BCAuthenticationLabels *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *title;
  NSString *v17;
  NSString *subtitle;
  NSString *v19;
  NSString *action;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BCAuthenticationLabels;
  v5 = -[BCAuthenticationLabels init](&v22, sel_init);
  if (v5)
  {
    LogCategory_Daemon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl(&dword_21C655000, v6, OS_LOG_TYPE_DEFAULT, "BCAuthenticationLabels: initWithDictionary %@", buf, 0xCu);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
      v15 = objc_claimAutoreleasedReturnValue();
    }

    title = v5->_title;
    v5->_title = v9;
    v17 = v9;

    subtitle = v5->_subtitle;
    v5->_subtitle = v12;
    v19 = v12;

    action = v5->_action;
    v5->_action = (NSString *)v15;

  }
  return v5;
}

- (BCAuthenticationLabels)initWithTitle:(id)a3 subtitle:(id)a4 action:(id)a5
{
  id v9;
  id v10;
  id v11;
  BCAuthenticationLabels *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BCAuthenticationLabels;
  v12 = -[BCAuthenticationLabels init](&v15, sel_init);
  if (v12)
  {
    LogCategory_Daemon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_21C655000, v13, OS_LOG_TYPE_DEFAULT, "BCAuthenticationLabels: initWithTitle: %@, subtitle: %@, action: %@", buf, 0x20u);
    }

    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v12->_subtitle, a4);
    objc_storeStrong((id *)&v12->_action, a5);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_action, CFSTR("action"));

}

- (BCAuthenticationLabels)initWithCoder:(id)a3
{
  id v4;
  BCAuthenticationLabels *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSString *action;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCAuthenticationLabels;
  v5 = -[BCAuthenticationLabels init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v10 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_title, CFSTR("title"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_action, CFSTR("action"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
