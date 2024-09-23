@implementation ASBuildFriendAchievementsToShare

id __ASBuildFriendAchievementsToShare_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  if (ACHIsActivityAchievementSharable())
  {
    objc_msgSend(v3, "relevantEarnedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "createdDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "isDate:inSameDayAsDate:", v6, *(_QWORD *)(a1 + 40));

    if ((_DWORD)v5)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v4, "earnedDateComponents");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateFromComponents:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = *(void **)(a1 + 32);
      objc_msgSend(v4, "createdDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "components:fromDate:toDate:options:", 16, v11, v9, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "day") < 0)
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v3, "template");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        ASFriendAchievementFromTemplateAndEarnedInstance(v13, v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
