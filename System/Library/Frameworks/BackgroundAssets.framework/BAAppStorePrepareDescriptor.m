@implementation BAAppStorePrepareDescriptor

- (BAAppStorePrepareDescriptor)init
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

- (id)initPrivatelyWithAppBundleIdentifier:(void *)a3 appStoreMetadata:(void *)a4 client:
{
  id v8;
  id v9;
  id *v10;
  objc_super v12;

  v8 = a2;
  v9 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)BAAppStorePrepareDescriptor;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      a1[4] = a4;
    }
  }

  return a1;
}

+ (id)descriptorWithAppBundleIdentifier:(id)a3 appStoreMetadata:(id)a4 client:(unint64_t)a5
{
  id v7;
  id v8;
  id *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[BAAppStorePrepareDescriptor initPrivatelyWithAppBundleIdentifier:appStoreMetadata:client:]((id *)[BAAppStorePrepareDescriptor alloc], v8, v7, (void *)a5);

  return v9;
}

- (BAAppStorePrepareDescriptor)initWithCoder:(id)a3
{
  id v4;
  BAAppStorePrepareDescriptor *v5;
  uint64_t v6;
  NSString *appBundleIdentifier;
  void *v8;
  uint64_t v9;
  NSDictionary *appStoreMetadata;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BAAppStorePrepareDescriptor;
  v5 = -[BAAppStorePrepareDescriptor init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v6;

    +[NSSet _baassets_propertyListClasses]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("appStoreMetadata"));
    v9 = objc_claimAutoreleasedReturnValue();
    appStoreMetadata = v5->_appStoreMetadata;
    v5->_appStoreMetadata = (NSDictionary *)v9;

    v5->_cellularPolicy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cellularPolicy"));
    v5->_clientType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientType"));
    v5->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInitiated"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[BAAppStorePrepareDescriptor appBundleIdentifier](self, "appBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("appBundleIdentifier"));

  -[BAAppStorePrepareDescriptor appStoreMetadata](self, "appStoreMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("appStoreMetadata"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[BAAppStorePrepareDescriptor cellularPolicy](self, "cellularPolicy"), CFSTR("cellularPolicy"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[BAAppStorePrepareDescriptor clientType](self, "clientType"), CFSTR("clientType"));
  objc_msgSend(v6, "encodeBool:forKey:", -[BAAppStorePrepareDescriptor userInitiated](self, "userInitiated"), CFSTR("userInitiated"));

}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSDictionary)appStoreMetadata
{
  return self->_appStoreMetadata;
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (unint64_t)cellularPolicy
{
  return self->_cellularPolicy;
}

- (void)setCellularPolicy:(unint64_t)a3
{
  self->_cellularPolicy = a3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreMetadata, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
