@implementation BSXPCBundle

+ (id)mainBundle
{
  if (qword_1ECD39700 != -1)
    dispatch_once(&qword_1ECD39700, &__block_literal_global);
  return (id)_MergedGlobals_3;
}

void __25__BSXPCBundle_mainBundle__block_invoke()
{
  BSXPCBundle *v0;
  id v1;
  void *v2;
  id main;

  v0 = [BSXPCBundle alloc];
  main = (id)xpc_bundle_create_main();
  v1 = -[BSXPCBundle _initWithXPCBundle:](v0, main);
  v2 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v1;

}

- (id)_initWithXPCBundle:(id)a1
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a2;
  v5 = v4;
  if (a1 && v4)
  {
    v6 = objc_msgSend(a1, "init");
    v7 = (void *)v6;
    if (v6)
      objc_storeStrong((id *)(v6 + 40), a2);
    a1 = v7;
    v8 = a1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)bundleForPID:(int)a3
{
  void *v3;
  void *v4;

  BSXPCBundleForPID(*(uint64_t *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSXPCBundle bundleWithXPCBundle:](BSXPCBundle, "bundleWithXPCBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bundleWithPath:(id)a3
{
  void *v3;
  void *v4;

  BSXPCBundleForBundlePath(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSXPCBundle bundleWithXPCBundle:](BSXPCBundle, "bundleWithXPCBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bundleWithExecutablePath:(id)a3
{
  void *v3;
  void *v4;

  BSXPCBundleForExecutablePath(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSXPCBundle bundleWithXPCBundle:](BSXPCBundle, "bundleWithXPCBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bundleWithXPCBundle:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[BSXPCBundle _initWithXPCBundle:]([BSXPCBundle alloc], v3);

  return v4;
}

- (NSString)bundleIdentifier
{
  NSString *bundleIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  bundleIdentifier = self->_bundleIdentifier;
  if (!bundleIdentifier)
  {
    BSXPCBundleGetIdentifier(self->_xpcBundle);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSString *)objc_msgSend(v4, "copy");
    v6 = self->_bundleIdentifier;
    self->_bundleIdentifier = v5;

    bundleIdentifier = self->_bundleIdentifier;
  }
  return bundleIdentifier;
}

- (NSString)bundlePath
{
  NSString *bundlePath;
  void *v4;
  NSString *v5;
  NSString *v6;

  bundlePath = self->_bundlePath;
  if (!bundlePath)
  {
    BSXPCBundleGetBundlePath(self->_xpcBundle);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSString *)objc_msgSend(v4, "copy");
    v6 = self->_bundlePath;
    self->_bundlePath = v5;

    bundlePath = self->_bundlePath;
  }
  return bundlePath;
}

- (NSString)executablePath
{
  NSString *executablePath;
  void *v4;
  NSString *v5;
  NSString *v6;

  executablePath = self->_executablePath;
  if (!executablePath)
  {
    BSXPCBundleGetExecutablePath(self->_xpcBundle);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSString *)objc_msgSend(v4, "copy");
    v6 = self->_executablePath;
    self->_executablePath = v5;

    executablePath = self->_executablePath;
  }
  return executablePath;
}

- (NSDictionary)infoDictionary
{
  NSDictionary *infoDictionary;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  infoDictionary = self->_infoDictionary;
  if (!infoDictionary)
  {
    BSXPCBundleGetInfoDictionary(self->_xpcBundle);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSDictionary *)objc_msgSend(v4, "copy");
    v6 = self->_infoDictionary;
    self->_infoDictionary = v5;

    infoDictionary = self->_infoDictionary;
  }
  return infoDictionary;
}

- (NSString)description
{
  return (NSString *)-[BSXPCBundle descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSXPCBundle succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSXPCBundle bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("bundleID"));

  -[BSXPCBundle bundlePath](self, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("path"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSXPCBundle descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  -[BSXPCBundle succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (OS_xpc_object)xpcBundle
{
  return self->_xpcBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcBundle, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
