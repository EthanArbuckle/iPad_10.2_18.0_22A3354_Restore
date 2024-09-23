@implementation ATXModeConfigurationLoggerSuggestedItems

- (ATXModeConfigurationLoggerSuggestedItems)init
{
  ATXModeConfigurationLoggerSuggestedItems *v2;
  uint64_t v3;
  NSMutableSet *suggestedDeniedApps;
  uint64_t v5;
  NSMutableSet *suggestedAllowedApps;
  uint64_t v7;
  NSMutableSet *suggestedDeniedContacts;
  uint64_t v9;
  NSMutableSet *suggestedAllowedContacts;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ATXModeConfigurationLoggerSuggestedItems;
  v2 = -[ATXModeConfigurationLoggerSuggestedItems init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    suggestedDeniedApps = v2->_suggestedDeniedApps;
    v2->_suggestedDeniedApps = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    suggestedAllowedApps = v2->_suggestedAllowedApps;
    v2->_suggestedAllowedApps = (NSMutableSet *)v5;

    v7 = objc_opt_new();
    suggestedDeniedContacts = v2->_suggestedDeniedContacts;
    v2->_suggestedDeniedContacts = (NSMutableSet *)v7;

    v9 = objc_opt_new();
    suggestedAllowedContacts = v2->_suggestedAllowedContacts;
    v2->_suggestedAllowedContacts = (NSMutableSet *)v9;

  }
  return v2;
}

- (NSMutableSet)suggestedDeniedApps
{
  return self->_suggestedDeniedApps;
}

- (void)setSuggestedDeniedApps:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedDeniedApps, a3);
}

- (NSMutableSet)suggestedAllowedApps
{
  return self->_suggestedAllowedApps;
}

- (void)setSuggestedAllowedApps:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedAllowedApps, a3);
}

- (NSMutableSet)suggestedDeniedContacts
{
  return self->_suggestedDeniedContacts;
}

- (void)setSuggestedDeniedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedDeniedContacts, a3);
}

- (NSMutableSet)suggestedAllowedContacts
{
  return self->_suggestedAllowedContacts;
}

- (void)setSuggestedAllowedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedAllowedContacts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAllowedContacts, 0);
  objc_storeStrong((id *)&self->_suggestedDeniedContacts, 0);
  objc_storeStrong((id *)&self->_suggestedAllowedApps, 0);
  objc_storeStrong((id *)&self->_suggestedDeniedApps, 0);
}

@end
