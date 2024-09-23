@implementation CXCallDirectoryStoreIdentificationEntry

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (void)setLocalizedLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedLabel, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

@end
