@implementation DDActionSuggestionsContext

- (NSString)coreSpotlightUniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCoreSpotlightUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_coreSpotlightUniqueIdentifier, 0);
}

@end
