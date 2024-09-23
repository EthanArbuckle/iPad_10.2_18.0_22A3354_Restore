@implementation FLFollowUpAction

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setSqlID:(unint64_t)a3
{
  self->_sqlID = a3;
}

- (void)setLaunchActionURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchActionArguments, 0);
  objc_storeStrong((id *)&self->_launchActionURL, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)set_userInfoData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;

  if (a3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    -[FLFollowUpAction setUserInfo:](self, "setUserInfo:", v4);

    -[FLFollowUpAction userInfo](self, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      _FLLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[FLFollowUpItem set_userInfoData:].cold.1();

    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (FLFollowUpAction)actionWithLabel:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabel:url:", v7, v6);

  return (FLFollowUpAction *)v8;
}

- (FLFollowUpAction)initWithLabel:(id)a3 url:(id)a4
{
  id v7;
  id v8;
  FLFollowUpAction *v9;
  FLFollowUpAction *v10;
  void *v11;
  uint64_t v12;
  NSString *identifier;

  v7 = a3;
  v8 = a4;
  v9 = -[FLFollowUpAction init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    objc_storeStrong((id *)&v10->_url, a4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *label;
  id v5;

  label = self->_label;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", label, CFSTR("_label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("_url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_launchActionURL, CFSTR("_launchActionURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("_userInfo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eventSource, CFSTR("_eventSource"));

}

- (FLFollowUpAction)initWithCoder:(id)a3
{
  id v4;
  FLFollowUpAction *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  NSURL *url;
  uint64_t v10;
  NSURL *launchActionURL;
  uint64_t v12;
  NSString *identifier;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSDictionary *userInfo;

  v4 = a3;
  v5 = -[FLFollowUpAction init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_url"));
    v8 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_launchActionURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    launchActionURL = v5->_launchActionURL;
    v5->_launchActionURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("_userInfo"));
    v20 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v20;

    v5->_eventSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_eventSource"));
  }

  return v5;
}

- (void)setDestructive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v3 = a3;
  -[FLFollowUpAction userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "mutableCopy");

  v6 = v9;
  if (!v9)
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  if (v3)
    v7 = MEMORY[0x1E0C9AAB0];
  else
    v7 = MEMORY[0x1E0C9AAA0];
  v10 = v6;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("FLFollowUpActionIsDestructiveKey"));
  v8 = (void *)objc_msgSend(v10, "copy");
  -[FLFollowUpAction setUserInfo:](self, "setUserInfo:", v8);

}

- (BOOL)destructive
{
  void *v2;
  void *v3;
  char v4;

  -[FLFollowUpAction userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FLFollowUpActionIsDestructiveKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (NSData)launchActionArguments
{
  return (NSData *)-[NSDictionary objectForKeyedSubscript:](self->_userInfo, "objectForKeyedSubscript:", CFSTR("FLFollowUpActionLaunchArgumentsKey"));
}

- (NSData)_userInfoData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  -[FLFollowUpAction userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[FLFollowUpAction userInfo](self, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, &v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;

    if (!v3)
    {
      _FLLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[FLFollowUpItem _userInfoData].cold.1();

    }
  }
  return (NSData *)v3;
}

- (BOOL)_loadActionURL
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[FLFollowUpAction url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _FLLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[FLFollowUpAction url](self, "url");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1B8D53000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to handle URL: %@", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v6 = objc_claimAutoreleasedReturnValue();
    -[FLFollowUpAction url](self, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject openSensitiveURL:withOptions:](v6, "openSensitiveURL:withOptions:", v7, 0);
    goto LABEL_5;
  }
  -[FLFollowUpAction launchActionURL](self, "launchActionURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    return 0;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[FLFollowUpAction launchActionURL](self, "launchActionURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to handle launch URL: %@", (uint8_t *)&v10, 0xCu);
LABEL_5:

  }
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p - label: %@, url: %@, macURL: %@, userInfo: %@>"), v4, self, self->_label, self->_url, self->_launchActionURL, self->_userInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSURL)launchActionURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLaunchActionArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)eventSource
{
  return self->_eventSource;
}

- (void)setEventSource:(unint64_t)a3
{
  self->_eventSource = a3;
}

- (unint64_t)sqlID
{
  return self->_sqlID;
}

@end
