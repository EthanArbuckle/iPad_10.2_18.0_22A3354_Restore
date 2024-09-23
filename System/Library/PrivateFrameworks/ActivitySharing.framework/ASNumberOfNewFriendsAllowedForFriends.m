@implementation ASNumberOfNewFriendsAllowedForFriends

uint64_t __ASNumberOfNewFriendsAllowedForFriends_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isFriendshipCurrentlyActive") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "hasInviteRequestFromMe");

  return v3;
}

@end
