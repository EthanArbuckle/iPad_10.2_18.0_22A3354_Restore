@implementation AMSUserNotificationAction

- (AMSUserNotificationAction)init
{
  return -[AMSUserNotificationAction initWithTitle:style:](self, "initWithTitle:style:", 0, 0);
}

- (AMSUserNotificationAction)initWithTitle:(id)a3
{
  return -[AMSUserNotificationAction initWithTitle:style:](self, "initWithTitle:style:", a3, 0);
}

- (AMSUserNotificationAction)initWithTitle:(id)a3 style:(int64_t)a4
{
  id v7;
  AMSUserNotificationAction *v8;
  AMSUserNotificationAction *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AMSUserNotificationAction;
  v8 = -[AMSUserNotificationAction init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    v9->_style = a4;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v11;

  }
  return v9;
}

- (AMSUserNotificationAction)initWithUserInfoAction:(id)a3
{
  id v4;
  AMSUserNotificationAction *v5;
  NSDictionary *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *title;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURL *defaultURL;
  void *v15;
  AMSMetricsEvent *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSURLRequest *request;
  NSDictionary *userInfo;
  id v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)AMSUserNotificationAction;
  v5 = -[AMSUserNotificationAction init](&v33, sel_init);
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "mutableCopy");
    -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("_AMSIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("_AMSTitle"));
    v9 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v9;

    -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("_AMSStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_style = objc_msgSend(v11, "integerValue");

    -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("_AMSDefaultURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      defaultURL = v5->_defaultURL;
      v5->_defaultURL = (NSURL *)v13;

    }
    -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("_AMSMetrics"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v15);
      -[AMSUserNotificationAction setMetricsEvent:](v5, "setMetricsEvent:", v16);

    }
    -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("_AMSRequestURL"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = &stru_1E2548760;
    if (v17)
      v19 = (__CFString *)v17;
    v20 = v19;

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v32 = v4;
      -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("_AMSRequestMethod"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("_AMSRequestHeaders"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("_AMSRequestBody"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "dataUsingEncoding:", 4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v21);
      objc_msgSend(v27, "setHTTPMethod:", v22);
      objc_msgSend(v27, "setAllHTTPHeaderFields:", v23);
      objc_msgSend(v27, "setHTTPBody:", v26);
      v28 = objc_msgSend(v27, "copy");
      request = v5->_request;
      v5->_request = (NSURLRequest *)v28;

      v4 = v32;
    }
    -[NSDictionary removeObjectForKey:](v6, "removeObjectForKey:", CFSTR("_AMSDefaultURL"));
    -[NSDictionary removeObjectForKey:](v6, "removeObjectForKey:", CFSTR("_AMSIdentifier"));
    -[NSDictionary removeObjectForKey:](v6, "removeObjectForKey:", CFSTR("_AMSMetrics"));
    -[NSDictionary removeObjectForKey:](v6, "removeObjectForKey:", CFSTR("_AMSRequestBody"));
    -[NSDictionary removeObjectForKey:](v6, "removeObjectForKey:", CFSTR("_AMSRequestHeaders"));
    -[NSDictionary removeObjectForKey:](v6, "removeObjectForKey:", CFSTR("_AMSRequestMethod"));
    -[NSDictionary removeObjectForKey:](v6, "removeObjectForKey:", CFSTR("_AMSRequestURL"));
    -[NSDictionary removeObjectForKey:](v6, "removeObjectForKey:", CFSTR("_AMSStyle"));
    -[NSDictionary removeObjectForKey:](v6, "removeObjectForKey:", CFSTR("_AMSTitle"));
    userInfo = v5->_userInfo;
    v5->_userInfo = v6;

  }
  return v5;
}

- (id)generateUserInfoAction
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  -[AMSUserNotificationAction userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;

  -[AMSUserNotificationAction identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSUserNotificationAction identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("_AMSIdentifier"));

  }
  -[AMSUserNotificationAction title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSUserNotificationAction title](self, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("_AMSTitle"));

  }
  -[AMSUserNotificationAction defaultURL](self, "defaultURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AMSUserNotificationAction defaultURL](self, "defaultURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("_AMSDefaultURL"));

  }
  -[AMSUserNotificationAction metricsEvent](self, "metricsEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AMSUserNotificationAction metricsEvent](self, "metricsEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "underlyingDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("_AMSMetrics"));

  }
  -[AMSUserNotificationAction request](self, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AMSUserNotificationAction request](self, "request");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "absoluteString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("_AMSRequestURL"));

    -[AMSUserNotificationAction request](self, "request");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "HTTPMethod");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = CFSTR("GET");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("_AMSRequestMethod"));

    -[AMSUserNotificationAction request](self, "request");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allHTTPHeaderFields");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = v27;
    else
      v29 = MEMORY[0x1E0C9AA70];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("_AMSRequestHeaders"));

    -[AMSUserNotificationAction request](self, "request");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "HTTPBody");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[AMSUserNotificationAction request](self, "request");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "HTTPBody");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v32, "initWithData:encoding:", v34, 4);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("_AMSRequestBody"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSUserNotificationAction style](self, "style"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("_AMSStyle"));

  return v7;
}

- (unint64_t)un_ActionOptions
{
  _BOOL8 v3;

  v3 = -[AMSUserNotificationAction style](self, "style") == 2;
  return (-[AMSUserNotificationAction style](self, "style") == 3) | (unint64_t)(2 * v3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSURL)defaultURL
{
  return self->_defaultURL;
}

- (void)setDefaultURL:(id)a3
{
  objc_storeStrong((id *)&self->_defaultURL, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSURL)mediaApiRequestURL
{
  return self->_mediaApiRequestURL;
}

- (void)setMediaApiRequestURL:(id)a3
{
  objc_storeStrong((id *)&self->_mediaApiRequestURL, a3);
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
  objc_storeStrong((id *)&self->_systemImageName, a3);
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_mediaApiRequestURL, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_defaultURL, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
