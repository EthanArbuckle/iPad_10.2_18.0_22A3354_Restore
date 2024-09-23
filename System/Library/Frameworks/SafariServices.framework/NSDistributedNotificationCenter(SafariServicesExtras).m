@implementation NSDistributedNotificationCenter(SafariServicesExtras)

+ (void)_sf_postPerSitePreferencesDidChangeDistributedNotification
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0D4F638];
  processIdentifierString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", v1, v2);

}

@end
