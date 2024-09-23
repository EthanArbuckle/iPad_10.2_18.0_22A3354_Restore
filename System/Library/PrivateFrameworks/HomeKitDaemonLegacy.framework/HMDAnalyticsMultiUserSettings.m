@implementation HMDAnalyticsMultiUserSettings

- (NSArray)multiUserSettingsValuesByKeyPaths
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMultiUserSettingsValuesByKeyPaths:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)isOwner
{
  return self->_isOwner;
}

- (void)setIsOwner:(BOOL)a3
{
  self->_isOwner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiUserSettingsValuesByKeyPaths, 0);
}

@end
