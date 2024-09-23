@implementation EKEventStore

id __53__EKEventStore_Suggestions__eventsPerWeekAroundDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;
  uint64_t v10;

  v2 = a2;
  objc_msgSend(v2, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSubscribedHolidayCalendar"))
    goto LABEL_8;
  objc_msgSend(v2, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFacebookBirthdayCalendar"))
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(v2, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSuggestedEventCalendar"))
  {
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v2, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isNaturalLanguageSuggestedEventCalendar") & 1) != 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v2, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");

  if (v10 != 4)
  {
    v7 = v2;
    goto LABEL_10;
  }
LABEL_9:
  v7 = 0;
LABEL_10:

  return v7;
}

uint64_t __81__EKEventStore_Suggestions__sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNaturalLanguageSuggestedEventCalendar");

  return v3;
}

void __81__EKEventStore_Suggestions__sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__lock;
  sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__lock = v0;

}

void __82__EKEventStore_Suggestions___sg_fetchEKEventsForPseudoNLEvent_title_participants___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isSuggestedEventCalendar"))
    goto LABEL_27;
  objc_msgSend(v3, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNaturalLanguageSuggestedEventCalendar");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v3, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0
      && ((unint64_t)objc_msgSend(v4, "length") < 2
       || (unint64_t)objc_msgSend(*(id *)(a1 + 40), "length") < 2
       || (objc_msgSend(*(id *)(a1 + 40), "localizedCaseInsensitiveContainsString:", v4) & 1) == 0))
    {
      objc_msgSend(v3, "attendees");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "count"))
      {

        goto LABEL_27;
      }
      v8 = *(_QWORD *)(a1 + 48);

      if (!v8)
        goto LABEL_27;
      v20 = v4;
      v9 = (void *)objc_opt_new();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v3, "attendees");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (objc_msgSend(v15, "participantType", v20) == 1)
            {
              objc_msgSend(v15, "URL");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "absoluteString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17 && (objc_msgSend(CFSTR("invalid:nomail"), "isEqual:", v17) & 1) == 0)
              {
                if (objc_msgSend(v17, "hasPrefix:", CFSTR("mailto:")))
                {
                  objc_msgSend(v17, "substringFromIndex:", 7);
                  v18 = objc_claimAutoreleasedReturnValue();

                  v17 = (void *)v18;
                }
                objc_msgSend(v9, "addObject:", v17);
              }

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v12);
      }

      v19 = objc_msgSend(*(id *)(a1 + 48), "isEqual:", v9);
      v4 = v20;
      if (!v19)
        goto LABEL_27;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v3, v20);
LABEL_27:

  }
}

void __86__EKEventStore_Suggestions__sg_fetchEKEventsForPseudoEventBySimilarTitleAndStartTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSuggestedEventCalendar"))
  {

  }
  else
  {
    objc_msgSend(v6, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isNaturalLanguageSuggestedEventCalendar");

    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);
  }

}

void __63__EKEventStore_Suggestions__sg_usingSharedStoreForReadingOnly___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:idleTimeout:", &__block_literal_global_5_28253, 1.0);
  v2 = (void *)sg_usingSharedStoreForReadingOnly___pasExprOnceResult;
  sg_usingSharedStoreForReadingOnly___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t __63__EKEventStore_Suggestions__sg_usingSharedStoreForReadingOnly___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0CAA078], "sg_newStore");
}

@end
