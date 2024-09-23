@implementation NSNotification(SafariServicesExtras)

- (uint64_t)_sf_perSitePreferenceNotificationWasSentFromAnotherProcess
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  processIdentifierString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToString:", v2) ^ 1;

  return v3;
}

@end
