@implementation STLockoutAppContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STLockoutAppContext)initWithEventType:(id)a3
{
  id v5;
  STLockoutAppContext *v6;
  STLockoutAppContext *v7;
  NSString *v8;
  uint64_t v9;
  NSString *clientName;
  void *v11;
  uint64_t v12;
  NSString *clientBundleID;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STLockoutAppContext;
  v6 = -[STLockoutAppContext init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventType, a3);
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", getprogname());
    v9 = objc_claimAutoreleasedReturnValue(v8);
    clientName = v7->_clientName;
    v7->_clientName = (NSString *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
    clientBundleID = v7->_clientBundleID;
    v7->_clientBundleID = (NSString *)v12;

  }
  return v7;
}

- (STLockoutAppContext)initWithCoder:(id)a3
{
  id v4;
  STLockoutAppContext *v5;
  id v6;
  uint64_t v7;
  NSString *eventType;
  id v9;
  uint64_t v10;
  NSString *clientName;
  id v12;
  uint64_t v13;
  NSString *clientBundleID;
  id v15;
  uint64_t v16;
  NSDictionary *additionalParameters;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STLockoutAppContext;
  v5 = -[STLockoutAppContext init](&v19, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("_eventType"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    eventType = v5->_eventType;
    v5->_eventType = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("_clientName"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("_clientBundleID"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    clientBundleID = v5->_clientBundleID;
    v5->_clientBundleID = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDictionary), CFSTR("_additionalParameters"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    additionalParameters = v5->_additionalParameters;
    v5->_additionalParameters = (NSDictionary *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *eventType;
  id v5;

  eventType = self->_eventType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eventType, CFSTR("_eventType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientName, CFSTR("_clientName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientBundleID, CFSTR("_clientBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalParameters, CFSTR("_additionalParameters"));

}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STLockoutAppContext eventType](self, "eventType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STLockoutAppContext clientName](self, "clientName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p { eventType: %@, clientName: %@ }>"), v5, self, v6, v7));

  return v8;
}

- (id)debugDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STLockoutAppContext eventType](self, "eventType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STLockoutAppContext clientName](self, "clientName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STLockoutAppContext clientBundleID](self, "clientBundleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STLockoutAppContext additionalParameters](self, "additionalParameters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p { eventType: %@, clientName: %@, clientBundleID: %@, additionalParameters: %@ }>"), v5, self, v6, v7, v8, v9));

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

- (NSDictionary)additionalParameters
{
  return self->_additionalParameters;
}

- (void)setAdditionalParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalParameters, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

+ (id)contextWithData:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("STLockoutAppContext.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v6 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v5, 0);
  v7 = objc_opt_class(STLockoutAppContext);
  v8 = (objc_class *)objc_opt_class(STLockoutAppContext);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeObjectOfClass:forKey:", v7, v10));

  return v11;
}

- (id)dataRepresentation
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;

  v3 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  v4 = (objc_class *)objc_opt_class(STLockoutAppContext);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "encodeObject:forKey:", self, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "encodedData"));
  return v7;
}

@end
