@implementation ASPreferredCompetitionVictoryBadgeStylesForFriend

uint64_t __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else if ((objc_msgSend(v3, "isCompetitionActive") & 1) != 0
         || objc_msgSend(v3, "numberOfCompetitionWinsByMe")
         || (objc_msgSend(v3, "hasPendingCompetitionRequestFromMe") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(v3, "isAwaitingCompetitionResponseFromMe");
  }

  return v7;
}

id __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  if (objc_msgSend(v2, "isCompetitionActive"))
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v2, "currentCompetition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(v2, "hasPendingCompetitionRequestFromMe") & 1) != 0
         || objc_msgSend(v2, "isAwaitingCompetitionResponseFromMe"))
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v2, "competitionPendingAcceptance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v2, "mostRecentlyCompletedCompetition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(v3, "numberWithUnsignedInt:", objc_msgSend(v4, "victoryBadgeStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke_3(uint64_t a1, void *a2)
{
  unsigned int v2;

  v2 = objc_msgSend(a2, "unsignedIntValue");
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", HIWORD(v2));
}

id __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke_207(uint64_t a1, void *a2)
{
  id v3;
  unsigned int v4;
  __int16 v5;
  void *v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "unsignedIntValue");
  v5 = objc_msgSend(v3, "unsignedIntValue");

  if (*(unsigned __int16 *)(a1 + 32) == HIWORD(v4))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

id __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke_2_208(uint64_t a1, void *a2)
{
  id v3;
  unsigned int v4;
  __int16 v5;
  void *v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "unsignedIntValue");
  v5 = objc_msgSend(v3, "unsignedIntValue");

  if (*(unsigned __int16 *)(a1 + 32) == HIWORD(v4))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

@end
