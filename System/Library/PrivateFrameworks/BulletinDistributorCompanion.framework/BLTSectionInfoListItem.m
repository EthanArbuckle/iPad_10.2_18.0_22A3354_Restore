@implementation BLTSectionInfoListItem

- (NSDictionary)overrides
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOverrides:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)universalSectionID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUniversalSectionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)overriddenFactorySectionID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOverriddenFactorySectionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)phoneSectionID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPhoneSectionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)overriddenDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOverriddenDisplayName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BBSectionIcon)overriddenIcon
{
  return (BBSectionIcon *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOverriddenIcon:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenIcon, 0);
  objc_storeStrong((id *)&self->_overriddenDisplayName, 0);
  objc_storeStrong((id *)&self->_phoneSectionID, 0);
  objc_storeStrong((id *)&self->_overriddenFactorySectionID, 0);
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

@end
