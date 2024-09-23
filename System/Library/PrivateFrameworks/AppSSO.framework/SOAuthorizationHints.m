@implementation SOAuthorizationHints

- (SOAuthorizationHints)initWithAuthorizationHintsCore:(id)a3
{
  id v4;
  SOAuthorizationHints *v5;
  uint64_t v6;
  NSString *localizedExtensionBundleDisplayName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOAuthorizationHints;
  v5 = -[SOAuthorizationHints init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "localizedExtensionBundleDisplayName");
    v6 = objc_claimAutoreleasedReturnValue();
    localizedExtensionBundleDisplayName = v5->_localizedExtensionBundleDisplayName;
    v5->_localizedExtensionBundleDisplayName = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  const __CFString *localizedExtensionBundleDisplayName;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  localizedExtensionBundleDisplayName = CFSTR("(null)");
  if (self->_localizedExtensionBundleDisplayName)
    localizedExtensionBundleDisplayName = (const __CFString *)self->_localizedExtensionBundleDisplayName;
  v6 = CFSTR("localizedExtensionBundleDisplayName");
  v7[0] = localizedExtensionBundleDisplayName;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
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
