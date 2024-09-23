@implementation ASAnalyticsUpdateManateeStateWithFriends

uint64_t __ASAnalyticsUpdateManateeStateWithFriends_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFriendshipCurrentlyActive");
}

BOOL __ASAnalyticsUpdateManateeStateWithFriends_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudType") == 1;

  return v3;
}

uint64_t __ASAnalyticsUpdateManateeStateWithFriends_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "deviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("iOS"));

  return v3;
}

uint64_t __ASAnalyticsUpdateManateeStateWithFriends_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "deviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("watchOS"));

  return v3;
}

@end
