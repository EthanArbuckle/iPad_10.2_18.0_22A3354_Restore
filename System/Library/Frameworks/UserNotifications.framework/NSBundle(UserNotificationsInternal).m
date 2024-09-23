@implementation NSBundle(UserNotificationsInternal)

+ (id)un_safeBundleWithURL:()UserNotificationsInternal
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
