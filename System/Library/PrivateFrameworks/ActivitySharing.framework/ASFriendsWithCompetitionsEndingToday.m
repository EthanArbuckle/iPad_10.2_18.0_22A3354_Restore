@implementation ASFriendsWithCompetitionsEndingToday

uint64_t __ASFriendsWithCompetitionsEndingToday_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "currentCompetition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLastDayOfCompetition");

  return v3;
}

@end
