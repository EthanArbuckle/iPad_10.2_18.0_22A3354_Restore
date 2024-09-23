@implementation _HKSourceAliasMapping

- (NSString)aliasName
{
  return self->_aliasName;
}

- (void)setAliasName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleIdentifierForInstallationStatus
{
  return self->_bundleIdentifierForInstallationStatus;
}

- (void)setBundleIdentifierForInstallationStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleIdentifierForIcon
{
  return self->_bundleIdentifierForIcon;
}

- (void)setBundleIdentifierForIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierForIcon, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForInstallationStatus, 0);
  objc_storeStrong((id *)&self->_aliasName, 0);
}

@end
