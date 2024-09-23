@implementation BAAppStoreEventDescriptor

- (BAAppStoreEventDescriptor)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initPrivatelyWithAppBundleIdentifier:(void *)a3 appBundleURL:(void *)a4 event:(void *)a5 client:
{
  id v10;
  id v11;
  id *v12;
  objc_super v14;

  v10 = a2;
  v11 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)BAAppStoreEventDescriptor;
    v12 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      a1[4] = a4;
      a1[5] = a5;
      *((_WORD *)a1 + 4) = 0;
    }
  }

  return a1;
}

+ (id)descriptorWithAppBundleIdentifier:(id)a3 appBundleURL:(id)a4 event:(unint64_t)a5 client:(unint64_t)a6
{
  id v9;
  id v10;
  id *v11;

  v9 = a4;
  v10 = a3;
  v11 = -[BAAppStoreEventDescriptor initPrivatelyWithAppBundleIdentifier:appBundleURL:event:client:]((id *)[BAAppStoreEventDescriptor alloc], v10, v9, (void *)a5, (void *)a6);

  return v11;
}

- (BAAppStoreEventDescriptor)initWithCoder:(id)a3
{
  id v4;
  BAAppStoreEventDescriptor *v5;
  uint64_t v6;
  NSString *appBundleIdentifier;
  uint64_t v8;
  NSURL *appBundleURL;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BAAppStoreEventDescriptor;
  v5 = -[BAAppStoreEventDescriptor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    appBundleURL = v5->_appBundleURL;
    v5->_appBundleURL = (NSURL *)v8;

    v5->_eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventType"));
    v5->_clientType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientType"));
    v5->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInitiated"));
    v5->_automaticInstall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("automaticInstall"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[BAAppStoreEventDescriptor appBundleIdentifier](self, "appBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("appBundleIdentifier"));

  -[BAAppStoreEventDescriptor appBundleURL](self, "appBundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("appBundleURL"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[BAAppStoreEventDescriptor eventType](self, "eventType"), CFSTR("eventType"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[BAAppStoreEventDescriptor clientType](self, "clientType"), CFSTR("clientType"));
  objc_msgSend(v6, "encodeBool:forKey:", -[BAAppStoreEventDescriptor userInitiated](self, "userInitiated"), CFSTR("userInitiated"));
  objc_msgSend(v6, "encodeBool:forKey:", -[BAAppStoreEventDescriptor automaticInstall](self, "automaticInstall"), CFSTR("automaticInstall"));

}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSURL)appBundleURL
{
  return self->_appBundleURL;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)automaticInstall
{
  return self->_automaticInstall;
}

- (void)setAutomaticInstall:(BOOL)a3
{
  self->_automaticInstall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleURL, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
