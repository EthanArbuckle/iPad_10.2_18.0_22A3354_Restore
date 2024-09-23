@implementation LSApplicationWorkspace(Extensions)

- (uint64_t)hk_asyncOpenURL:()Extensions
{
  return objc_msgSend(a1, "openURL:configuration:completionHandler:", a3, 0, &__block_literal_global);
}

@end
