@implementation ASAnalyticsUpdateWithFriends

uint64_t __ASAnalyticsUpdateWithFriends_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFriendshipCurrentlyActive");
}

uint64_t __ASAnalyticsUpdateWithFriends_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCompetitionActive");
}

uint64_t __ASAnalyticsUpdateWithFriends_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "hasCompetitionHistory") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isCompetitionActive");

  return v3;
}

@end
