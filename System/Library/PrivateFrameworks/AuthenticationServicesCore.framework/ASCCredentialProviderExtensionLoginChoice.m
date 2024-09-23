@implementation ASCCredentialProviderExtensionLoginChoice

- (ASCCredentialProviderExtensionLoginChoice)initWithProviderName:(id)a3 providerBundleID:(id)a4 providerExtensionContainingAppBundleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASCCredentialProviderExtensionLoginChoice *v11;
  uint64_t v12;
  NSString *providerName;
  uint64_t v14;
  NSString *providerExtensionBundleID;
  uint64_t v16;
  NSString *providerExtensionContainingAppBundleID;
  ASCCredentialProviderExtensionLoginChoice *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ASCCredentialProviderExtensionLoginChoice;
  v11 = -[ASCCredentialProviderExtensionLoginChoice init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    providerName = v11->_providerName;
    v11->_providerName = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    providerExtensionBundleID = v11->_providerExtensionBundleID;
    v11->_providerExtensionBundleID = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    providerExtensionContainingAppBundleID = v11->_providerExtensionContainingAppBundleID;
    v11->_providerExtensionContainingAppBundleID = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (unint64_t)loginChoiceKind
{
  return 6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *providerName;
  void *v7;
  NSString *providerExtensionBundleID;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    providerName = self->_providerName;
    objc_msgSend(v5, "providerName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](providerName, "isEqualToString:", v7))
    {
      providerExtensionBundleID = self->_providerExtensionBundleID;
      objc_msgSend(v5, "providerExtensionBundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSString isEqualToString:](providerExtensionBundleID, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *providerName;
  id v5;

  providerName = self->_providerName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", providerName, CFSTR("providerName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerExtensionBundleID, CFSTR("providerExtensionBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerExtensionContainingAppBundleID, CFSTR("providerExtensionContainingAppBundleID"));

}

- (ASCCredentialProviderExtensionLoginChoice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ASCCredentialProviderExtensionLoginChoice *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerExtensionBundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerExtensionContainingAppBundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ASCCredentialProviderExtensionLoginChoice initWithProviderName:providerBundleID:providerExtensionContainingAppBundleID:](self, "initWithProviderName:providerBundleID:providerExtensionContainingAppBundleID:", v5, v6, v7);
  return v8;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (NSString)providerExtensionBundleID
{
  return self->_providerExtensionBundleID;
}

- (NSString)providerExtensionContainingAppBundleID
{
  return self->_providerExtensionContainingAppBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerExtensionContainingAppBundleID, 0);
  objc_storeStrong((id *)&self->_providerExtensionBundleID, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
}

@end
