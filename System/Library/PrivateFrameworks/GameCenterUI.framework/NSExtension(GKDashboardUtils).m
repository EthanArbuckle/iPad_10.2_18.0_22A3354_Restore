@implementation NSExtension(GKDashboardUtils)

+ (uint64_t)_gkExtensionWithIdentifier:()GKDashboardUtils error:
{
  return objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:");
}

@end
