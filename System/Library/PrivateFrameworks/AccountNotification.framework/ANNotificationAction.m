@implementation ANNotificationAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionForOpeningWebURL:(id)a3
{
  id v3;
  ANNotificationAction *v4;

  v3 = a3;
  v4 = objc_alloc_init(ANNotificationAction);
  -[ANNotificationAction setUrl:](v4, "setUrl:", v3);

  -[ANNotificationAction setIsInternalURL:](v4, "setIsInternalURL:", 0);
  return v4;
}

+ (id)actionForLaunchingApp:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;
  ANNotificationAction *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(ANNotificationAction);
  -[ANNotificationAction setUrl:](v7, "setUrl:", v6);

  -[ANNotificationAction setIsInternalURL:](v7, "setIsInternalURL:", 1);
  -[ANNotificationAction setOptions:](v7, "setOptions:", v5);

  return v7;
}

+ (id)actionForLaunchingApp:(id)a3
{
  return +[ANNotificationAction actionForLaunchingApp:withOptions:](ANNotificationAction, "actionForLaunchingApp:withOptions:", a3, 0);
}

- (ANNotificationAction)initWithManagedObject:(id)a3
{
  id v4;
  ANNotificationAction *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *url;
  void *v10;
  uint64_t v11;
  NSDictionary *options;
  ANNotificationAction *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ANNotificationAction;
  v5 = -[ANNotificationAction init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    objc_msgSend(v4, "isInternal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isInternalURL = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "options");
    v11 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSDictionary *)v11;

  }
  v13 = v5;

  return v13;
}

- (ANNotificationAction)initWithCoder:(id)a3
{
  id v4;
  ANNotificationAction *v5;
  uint64_t v6;
  NSURL *url;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *options;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ANNotificationAction;
  v5 = -[ANNotificationAction init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isInternalURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isInternalURL = objc_msgSend(v8, "BOOLValue");

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_options"));
    v15 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSDictionary *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  void *v5;
  id v6;

  url = self->_url;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", url, CFSTR("_url"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isInternalURL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_isInternalURL"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_options, CFSTR("_options"));
}

- (ANNotificationAction)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  ANNotificationAction *v5;
  void *v6;
  uint64_t v7;
  NSURL *url;
  void *v9;
  uint64_t v10;
  NSDictionary *options;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANNotificationAction;
  v5 = -[ANNotificationAction init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      url = v5->_url;
      v5->_url = (NSURL *)v7;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_isInternalURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isInternalURL = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_options"));
    v10 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSDictionary *)v10;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  NSURL *url;
  void *v5;
  NSDictionary *options;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  url = self->_url;
  if (url)
  {
    -[NSURL absoluteString](url, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_url"));

  }
  options = self->_options;
  if (options)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", options, CFSTR("_options"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isInternalURL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("_isInternalURL"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (void)perform
{
  NSObject *v3;
  NSURL *url;
  _BOOL4 isInternalURL;
  void *v6;
  void *v7;
  NSURL *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  NSURL *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  _ANLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    url = self->_url;
    v9 = 136315650;
    v10 = "-[ANNotificationAction perform]";
    v11 = 1024;
    v12 = 276;
    v13 = 2112;
    v14 = url;
    _os_log_impl(&dword_215D17000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Launching URL: %@\", (uint8_t *)&v9, 0x1Cu);
  }

  isInternalURL = self->_isInternalURL;
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = self->_url;
  if (isInternalURL)
    objc_msgSend(v6, "openSensitiveURL:withOptions:", v8, self->_options);
  else
    objc_msgSend(v6, "openURL:", v8);

}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isInternalURL
{
  return self->_isInternalURL;
}

- (void)setIsInternalURL:(BOOL)a3
{
  self->_isInternalURL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithManagedObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215D17000, v0, v1, "%s (%d) \"NSObjectInaccessibleException caught inside -[ANNotificationAction initWithManagedObject:]\", v2, v3, v4, v5, v6);
}

@end
