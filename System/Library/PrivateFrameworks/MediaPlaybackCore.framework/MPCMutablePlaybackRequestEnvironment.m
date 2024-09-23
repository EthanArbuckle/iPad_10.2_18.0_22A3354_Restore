@implementation MPCMutablePlaybackRequestEnvironment

- (void)setUserIdentity:(id)a3
{
  ICUserIdentity *v4;
  ICUserIdentity *userIdentity;

  if (self->super._userIdentity != a3)
  {
    v4 = (ICUserIdentity *)objc_msgSend(a3, "copy");
    userIdentity = self->super._userIdentity;
    self->super._userIdentity = v4;

  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MPCPlaybackRequestEnvironment _copyWithPlaybackRequestEnvironmentClass:](self, "_copyWithPlaybackRequestEnvironmentClass:", objc_opt_class());
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MPCPlaybackRequestEnvironment _copyWithPlaybackRequestEnvironmentClass:](self, "_copyWithPlaybackRequestEnvironmentClass:", objc_opt_class());
}

- (void)setClientIdentifier:(id)a3
{
  NSString *v4;
  NSString *clientIdentifier;

  if (self->super._clientIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    clientIdentifier = self->super._clientIdentifier;
    self->super._clientIdentifier = v4;

  }
}

- (void)setClientVersion:(id)a3
{
  NSString *v4;
  NSString *clientVersion;

  if (self->super._clientVersion != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    clientVersion = self->super._clientVersion;
    self->super._clientVersion = v4;

  }
}

- (void)setDelegationProperties:(id)a3
{
  MPCPlaybackDelegationProperties *v4;
  MPCPlaybackDelegationProperties *delegationProperties;

  if (self->super._delegationProperties != a3)
  {
    v4 = (MPCPlaybackDelegationProperties *)objc_msgSend(a3, "copy");
    delegationProperties = self->super._delegationProperties;
    self->super._delegationProperties = v4;

  }
}

- (void)setRequestingBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *requestingBundleIdentifier;

  if (self->super._requestingBundleIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    requestingBundleIdentifier = self->super._requestingBundleIdentifier;
    self->super._requestingBundleIdentifier = v4;

  }
}

- (void)setRequestingBundleVersion:(id)a3
{
  NSString *v4;
  NSString *requestingBundleVersion;

  if (self->super._requestingBundleVersion != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    requestingBundleVersion = self->super._requestingBundleVersion;
    self->super._requestingBundleVersion = v4;

  }
}

@end
