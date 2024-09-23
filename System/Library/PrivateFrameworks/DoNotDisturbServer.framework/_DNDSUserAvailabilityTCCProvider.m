@implementation _DNDSUserAvailabilityTCCProvider

- (id)userAvailabilityTCCApprovedBundleIds
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = (void *)TCCAccessCopyBundleIdentifiersForService();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
