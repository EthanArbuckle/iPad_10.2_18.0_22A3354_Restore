@implementation CDSpotlightItemUtils

_CDContact *__45___CDSpotlightItemUtils__contactsForPersons___block_invoke(uint64_t a1, void *a2)
{
  return +[_CDSpotlightItemUtils _contactForPerson:](*(_QWORD *)(a1 + 32), a2);
}

void __33___CDSpotlightItemUtils_policies__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDInteractionPolicies interactionPolicies](_CDInteractionPolicies, "interactionPolicies");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)policies_policies;
  policies_policies = v0;

}

BOOL __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

id __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a2;
  v6 = (void *)MEMORY[0x1E0D81638];
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    objc_msgSend(v6, "tupleWithFirst:second:", v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tupleWithFirst:second:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", a2, 0);
}

id __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDSpotlightItemUtils _contactForPerson:](v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "second");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setParticipantStatus:", objc_msgSend(v8, "integerValue"));

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
          objc_msgSend(v6, "identifier", (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if (v17)
            objc_msgSend(v14, "setParticipantStatus:", objc_msgSend(v6, "participantStatus"));
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

  }
  return v6;
}

uint64_t __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_460(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[_CDSpotlightItemUtils shouldFilterEmailAddress:]((uint64_t)_CDSpotlightItemUtils, v2);

  return v3;
}

BOOL __69___CDSpotlightItemUtils_knowledgeEventsForSearchableItem_userAction___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", a2);
  return v3 >= 0.0 && v3 <= *(double *)(a1 + 40);
}

void __50___CDSpotlightItemUtils_shouldFilterEmailAddress___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E272BC08);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldFilterEmailAddress___localPartBlackList;
  shouldFilterEmailAddress___localPartBlackList = v0;

}

uint64_t __51___CDSpotlightItemUtils_UTI__expectedSupportedUTIs__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)expectedSupportedUTIs_hardCodedUTIs;
  expectedSupportedUTIs_hardCodedUTIs = (uint64_t)v0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[_CDSpotlightItemUtils mechanismUtiMap]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend((id)expectedSupportedUTIs_hardCodedUTIs, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v8 = (void *)expectedSupportedUTIs_hardCodedUTIs;
  objc_opt_self();
  return objc_msgSend(v8, "addObjectsFromArray:", &unk_1E272BD70);
}

void __45___CDSpotlightItemUtils_UTI__mechanismUtiMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E272AAE0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("public.message"), CFSTR("public.url"), CFSTR("com.apple.ichat.transcript"), getkUTTypeMessage(), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "allObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v1;
  v8[1] = &unk_1E272AAF8;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.ical.ics.event"), CFSTR("public.calendar-event"), getkUTTypeCalendarEvent(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = &unk_1E272AB10;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.mail.emlx"), getkUTTypeEmailMessage(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)mechanismUtiMap_mechanismUtiMap;
  mechanismUtiMap_mechanismUtiMap = v6;

}

void __45___CDSpotlightItemUtils_UTI__utiConformCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)utiConformCache_utiConformCache;
  utiConformCache_utiConformCache = v0;

}

@end
