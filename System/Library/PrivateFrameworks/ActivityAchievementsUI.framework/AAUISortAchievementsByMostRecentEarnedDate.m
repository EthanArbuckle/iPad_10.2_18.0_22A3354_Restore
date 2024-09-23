@implementation AAUISortAchievementsByMostRecentEarnedDate

uint64_t __AAUISortAchievementsByMostRecentEarnedDate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "unearned") & 1) != 0 || (objc_msgSend(v6, "unearned") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    if (*(_BYTE *)(a1 + 32))
    {
      v9 = v5;
      v10 = v6;
    }
    else
    {
      v9 = v6;
      v10 = v5;
    }
    v7 = AAUICompareAchievementsByMostRecentEarnedDate(v9, v10);
    if (!v7)
    {
      v11 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "template");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "displayOrder"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v6, "template");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "displayOrder"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v13, "compare:", v16);

    }
  }

  return v7;
}

@end
