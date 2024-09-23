@implementation FACircleContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FACircleContext)init
{
  -[FACircleContext doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (BOOL)isPlatformSupported
{
  return 1;
}

- (FACircleContext)initWithEventType:(id)a3
{
  id v5;
  FACircleContext *v6;
  FACircleContext *v7;
  uint64_t v8;
  NSString *clientName;
  void *v10;
  uint64_t v11;
  NSString *clientBundleID;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FACircleContext;
  v6 = -[FACircleContext init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventType, a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", getprogname());
    v8 = objc_claimAutoreleasedReturnValue();
    clientName = v7->_clientName;
    v7->_clientName = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    clientBundleID = v7->_clientBundleID;
    v7->_clientBundleID = (NSString *)v11;

    v7->_activityIndicatorStyle = 1;
  }

  return v7;
}

- (FACircleContext)initWithCoder:(id)a3
{
  id v4;
  FACircleContext *v5;
  uint64_t v6;
  NSString *eventType;
  uint64_t v8;
  NSString *clientName;
  uint64_t v10;
  NSString *clientBundleID;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *additionalParameters;
  uint64_t v18;
  NSString *urlEndpoint;
  uint64_t v20;
  NSURL *urlForContext;
  uint64_t v22;
  AKAppleIDAuthenticationContext *authContext;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FACircleContext;
  v5 = -[FACircleContext init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_eventType"));
    v6 = objc_claimAutoreleasedReturnValue();
    eventType = v5->_eventType;
    v5->_eventType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientName"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientBundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    clientBundleID = v5->_clientBundleID;
    v5->_clientBundleID = (NSString *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_additionalParameters"));
    v16 = objc_claimAutoreleasedReturnValue();
    additionalParameters = v5->_additionalParameters;
    v5->_additionalParameters = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_urlEndpoint"));
    v18 = objc_claimAutoreleasedReturnValue();
    urlEndpoint = v5->_urlEndpoint;
    v5->_urlEndpoint = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_urlForContext"));
    v20 = objc_claimAutoreleasedReturnValue();
    urlForContext = v5->_urlForContext;
    v5->_urlForContext = (NSURL *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_authContext"));
    v22 = objc_claimAutoreleasedReturnValue();
    authContext = v5->_authContext;
    v5->_authContext = (AKAppleIDAuthenticationContext *)v22;

    NSStringFromSelector(sel_activityIndicatorStyle);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activityIndicatorStyle = objc_msgSend(v4, "decodeIntegerForKey:", v24);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *eventType;
  id v5;
  unint64_t activityIndicatorStyle;
  id v7;

  eventType = self->_eventType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eventType, CFSTR("_eventType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientName, CFSTR("_clientName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientBundleID, CFSTR("_clientBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalParameters, CFSTR("_additionalParameters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_urlEndpoint, CFSTR("_urlEndpoint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authContext, CFSTR("_authContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_urlForContext, CFSTR("_urlForContext"));
  activityIndicatorStyle = self->_activityIndicatorStyle;
  NSStringFromSelector(sel_activityIndicatorStyle);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", activityIndicatorStyle, v7);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FACircleContext eventType](self, "eventType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FACircleContext clientName](self, "clientName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { eventType: %@, clientName: %@ }>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FACircleContext eventType](self, "eventType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FACircleContext clientName](self, "clientName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FACircleContext clientBundleID](self, "clientBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FACircleContext additionalParameters](self, "additionalParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { eventType: %@, clientName: %@, clientBundleID: %@, additionalParameters: %@ }>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)additionalParameters
{
  return self->_additionalParameters;
}

- (void)setAdditionalParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)activityIndicatorStyle
{
  return self->_activityIndicatorStyle;
}

- (void)setActivityIndicatorStyle:(unint64_t)a3
{
  self->_activityIndicatorStyle = a3;
}

- (NSURL)urlForContext
{
  return self->_urlForContext;
}

- (void)setUrlForContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)urlEndpoint
{
  return self->_urlEndpoint;
}

- (void)setUrlEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (AKAppleIDAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (NSDictionary)ephemeralAuthResults
{
  return self->_ephemeralAuthResults;
}

- (void)setEphemeralAuthResults:(id)a3
{
  objc_storeStrong((id *)&self->_ephemeralAuthResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralAuthResults, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_urlEndpoint, 0);
  objc_storeStrong((id *)&self->_urlForContext, 0);
  objc_storeStrong((id *)&self->_additionalParameters, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

+ (FACircleContext)contextWithData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDD1620];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, 0);

  v6 = objc_opt_class();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (FACircleContext *)v9;
}

- (NSData)dataRepresentation
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:forKey:", self, v5);

  objc_msgSend(v3, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v6;
}

@end
