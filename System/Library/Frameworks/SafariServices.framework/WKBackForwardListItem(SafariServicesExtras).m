@implementation WKBackForwardListItem(SafariServicesExtras)

- (id)_sf_quickLookDocument
{
  return objc_getAssociatedObject(a1, (const void *)quickLookDocumentKey);
}

- (void)_sf_setQuickLookDocument:()SafariServicesExtras
{
  objc_setAssociatedObject(a1, (const void *)quickLookDocumentKey, a3, (void *)1);
}

- (id)_sf_securityInfo
{
  return objc_getAssociatedObject(a1, (const void *)securityInfoKey);
}

- (void)_sf_setSecurityInfo:()SafariServicesExtras
{
  objc_setAssociatedObject(a1, (const void *)securityInfoKey, a3, (void *)1);
}

- (id)_sf_explicitSuggestedFilename
{
  return objc_getAssociatedObject(a1, (const void *)explicitSuggestedFilenameKey);
}

- (void)_sf_setExplicitSuggestedFilename:()SafariServicesExtras
{
  objc_setAssociatedObject(a1, (const void *)explicitSuggestedFilenameKey, a3, (void *)3);
}

@end
