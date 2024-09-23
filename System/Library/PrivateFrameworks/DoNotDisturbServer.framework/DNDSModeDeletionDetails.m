@implementation DNDSModeDeletionDetails

- (NSSet)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (void)setApplicationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)modeSpecificSettings
{
  return self->_modeSpecificSettings;
}

- (void)setModeSpecificSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeSpecificSettings, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
}

@end
