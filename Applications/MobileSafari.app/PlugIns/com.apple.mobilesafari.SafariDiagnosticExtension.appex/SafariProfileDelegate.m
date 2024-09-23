@implementation SafariProfileDelegate

- (id)sfWebExtensionsControllersForAllProfiles:(id)a3
{
  void *v3;
  void *v4;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SafariDiagnosticExtension defaultWebExtensionsController](SafariDiagnosticExtension, "defaultWebExtensionsController", a3));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (id)sfWebExtensionsControllersContentBlockerManagersForAllProfiles:(id)a3
{
  void *v3;
  void *v4;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SafariDiagnosticExtension defaultContentBlockerManager](SafariDiagnosticExtension, "defaultContentBlockerManager", a3));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (id)sfWebExtensionsControllerTabGroupManager:(id)a3
{
  return +[SafariDiagnosticExtension tabGroupManager](SafariDiagnosticExtension, "tabGroupManager", a3);
}

@end
