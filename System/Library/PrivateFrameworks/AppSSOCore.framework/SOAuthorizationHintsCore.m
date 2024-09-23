@implementation SOAuthorizationHintsCore

- (SOAuthorizationHintsCore)initWithLocalizedExtensionBundleDisplayName:(id)a3
{
  id v5;
  SOAuthorizationHintsCore *v6;
  SOAuthorizationHintsCore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOAuthorizationHintsCore;
  v6 = -[SOAuthorizationHintsCore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_localizedExtensionBundleDisplayName, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SOAuthorizationHintsCore)initWithCoder:(id)a3
{
  id v4;
  SOAuthorizationHintsCore *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *localizedExtensionBundleDisplayName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SOAuthorizationHintsCore;
  v5 = -[SOAuthorizationHintsCore init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_localizedExtensionBundleDisplayName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    localizedExtensionBundleDisplayName = v5->_localizedExtensionBundleDisplayName;
    v5->_localizedExtensionBundleDisplayName = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedExtensionBundleDisplayName;
  id v4;
  id v5;

  localizedExtensionBundleDisplayName = self->_localizedExtensionBundleDisplayName;
  v4 = a3;
  NSStringFromSelector(sel_localizedExtensionBundleDisplayName);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", localizedExtensionBundleDisplayName, v5);

}

- (id)description
{
  const __CFString *localizedExtensionBundleDisplayName;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  localizedExtensionBundleDisplayName = CFSTR("(null)");
  if (self->_localizedExtensionBundleDisplayName)
    localizedExtensionBundleDisplayName = (const __CFString *)self->_localizedExtensionBundleDisplayName;
  v6 = CFSTR("localizedExtensionBundleDisplayName");
  v7[0] = localizedExtensionBundleDisplayName;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)localizedExtensionBundleDisplayName
{
  return self->_localizedExtensionBundleDisplayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedExtensionBundleDisplayName, 0);
}

@end
