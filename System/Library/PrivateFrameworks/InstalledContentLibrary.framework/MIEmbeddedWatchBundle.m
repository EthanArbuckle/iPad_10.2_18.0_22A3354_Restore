@implementation MIEmbeddedWatchBundle

- (unsigned)bundleType
{
  return 9;
}

- (BOOL)isApplicableToKnownWatchOSVersion
{
  return -[MIBundle isApplicableToOSVersion:error:](self, "isApplicableToOSVersion:error:", CFSTR("11.9999"), 0);
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (MIEmbeddedWatchBundle)initWithParentBundle:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 isPlaceholder:(BOOL)a6 error:(id *)a7
{
  MIEmbeddedWatchBundle *result;

  result = -[MIBundle initWithParentBundle:parentSubdirectory:bundleName:error:](self, "initWithParentBundle:parentSubdirectory:bundleName:error:", a3, a4, a5, a7);
  if (result)
    result->_isPlaceholder = a6;
  return result;
}

- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4
{
  if (a3)
    *a3 = 1;
  return CFSTR("11.9999");
}

- (BOOL)allowsAppleAppExtensionsNotInExtensionCache
{
  return 1;
}

- (id)pluginKitBundlesWithError:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MIEmbeddedWatchBundle;
  -[MIBundle pluginKitBundlesPerformingPlatformValidation:withError:](&v4, sel_pluginKitBundlesPerformingPlatformValidation_withError_, 2, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pluginKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIEmbeddedWatchBundle;
  -[MIBundle pluginKitBundlesPerformingPlatformValidation:withError:](&v5, sel_pluginKitBundlesPerformingPlatformValidation_withError_, a3 & 2, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)extensionKitBundlesWithError:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MIEmbeddedWatchBundle;
  -[MIBundle extensionKitBundlesPerformingPlatformValidation:withError:](&v4, sel_extensionKitBundlesPerformingPlatformValidation_withError_, 2, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)extensionKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIEmbeddedWatchBundle;
  -[MIBundle extensionKitBundlesPerformingPlatformValidation:withError:](&v5, sel_extensionKitBundlesPerformingPlatformValidation_withError_, a3 & 2, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
