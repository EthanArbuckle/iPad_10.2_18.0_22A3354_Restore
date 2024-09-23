@implementation ASFriendsSortedByCompetitionEndDate

uint64_t __ASFriendsSortedByCompetitionEndDate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _ASFriendsSortedByComparator(a2, a3, (uint64_t)&__block_literal_global_18);
}

uint64_t __ASFriendsSortedByCompetitionEndDate_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "currentCompetition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentCompetition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

@end
