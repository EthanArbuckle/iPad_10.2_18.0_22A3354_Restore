@implementation ASFriendsWithCompetitionsStartingToday

uint64_t __ASFriendsWithCompetitionsStartingToday_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "currentCompetition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstDayOfCompetition");

  return v3;
}

@end
