@implementation CHSDescriptorEnablementChangeRequest

- (CHSDescriptorEnablementChangeRequest)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 enabled:(BOOL)a5
{
  id v9;
  id v10;
  CHSDescriptorEnablementChangeRequest *v11;
  CHSDescriptorEnablementChangeRequest *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHSDescriptorEnablementChangeRequest;
  v11 = -[CHSDescriptorEnablementChangeRequest init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_extensionBundleIdentifier, a3);
    objc_storeStrong((id *)&v12->_kind, a4);
    v12->_enabled = a5;
  }

  return v12;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionBundleIdentifier, CFSTR("extensionBundleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));

}

- (CHSDescriptorEnablementChangeRequest)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CHSDescriptorEnablementChangeRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CHSDescriptorEnablementChangeRequest initWithExtensionBundleIdentifier:kind:enabled:](self, "initWithExtensionBundleIdentifier:kind:enabled:", v5, v6, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled")));

  return v7;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)kind
{
  return self->_kind;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

@end
