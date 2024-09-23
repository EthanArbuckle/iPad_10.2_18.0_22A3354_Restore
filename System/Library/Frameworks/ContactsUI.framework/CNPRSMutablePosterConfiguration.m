@implementation CNPRSMutablePosterConfiguration

- (CNPRSMutablePosterConfiguration)init
{
  CNPRSMutablePosterConfiguration *v2;
  char v3;
  Class v4;
  Class v5;
  void *v6;
  uint64_t v7;
  PRSMutablePosterConfiguration *wrappedMutablePosterConfiguration;
  uint64_t v9;
  CNPRSMutablePosterConfiguration *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNPRSMutablePosterConfiguration;
  v2 = -[CNPRSMutablePosterConfiguration init](&v12, sel_init);
  if (v2)
  {
    getPRSMutablePosterConfigurationClass[0]();
    objc_opt_class();
    v3 = objc_opt_respondsToSelector();
    v4 = (Class)getPRSMutablePosterConfigurationClass[0]();
    v5 = v4;
    if ((v3 & 1) != 0)
    {
      getPRSPosterRoleIncomingCall_61248();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class mutableConfigurationWithRole:](v5, "mutableConfigurationWithRole:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      wrappedMutablePosterConfiguration = v2->_wrappedMutablePosterConfiguration;
      v2->_wrappedMutablePosterConfiguration = (PRSMutablePosterConfiguration *)v7;

    }
    else
    {
      -[objc_class mutableConfiguration](v4, "mutableConfiguration");
      v9 = objc_claimAutoreleasedReturnValue();
      v6 = v2->_wrappedMutablePosterConfiguration;
      v2->_wrappedMutablePosterConfiguration = (PRSMutablePosterConfiguration *)v9;
    }

    v10 = v2;
  }

  return v2;
}

- (BOOL)storeUserInfo:(id)a3 error:(id *)a4
{
  return -[PRSMutablePosterConfiguration storeUserInfo:error:](self->_wrappedMutablePosterConfiguration, "storeUserInfo:error:", a3, a4);
}

- (NSURL)assetDirectory
{
  return (NSURL *)-[PRSMutablePosterConfiguration assetDirectory](self->_wrappedMutablePosterConfiguration, "assetDirectory");
}

- (PRSMutablePosterConfiguration)wrappedMutablePosterConfiguration
{
  return self->_wrappedMutablePosterConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedMutablePosterConfiguration, 0);
}

@end
