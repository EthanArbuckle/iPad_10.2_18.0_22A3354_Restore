@implementation FBSystemServiceOpenApplicationRequest

- (FBSOpenApplicationOptions)options
{
  return self->_options;
}

- (BOOL)isTrusted
{
  return self->_trusted;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (FBProcess)clientProcess
{
  return self->_clientProcess;
}

- (void)setTrusted:(BOOL)a3
{
  self->_trusted = a3;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setClientProcess:(id)a3
{
  objc_storeStrong((id *)&self->_clientProcess, a3);
}

- (FBSystemServiceOpenApplicationRequest)initWithBundleId:(id)a3
{
  id v4;
  FBSystemServiceOpenApplicationRequest *v5;
  FBSystemServiceOpenApplicationRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBSystemServiceOpenApplicationRequest;
  v5 = -[FBSystemServiceOpenApplicationRequest init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[FBSystemServiceOpenApplicationRequest setBundleIdentifier:](v5, "setBundleIdentifier:", v4);

  return v6;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProcess, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_trusted, CFSTR("trusted"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_bundleIdentifier, CFSTR("bundleID"));
  -[FBSOpenApplicationOptions url](self->_options, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v7, CFSTR("urlScheme"), 1);

  FBSProcessPrettyDescription();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("client"));

  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
