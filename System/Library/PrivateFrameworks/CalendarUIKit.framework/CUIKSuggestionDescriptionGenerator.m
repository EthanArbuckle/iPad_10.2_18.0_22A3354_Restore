@implementation CUIKSuggestionDescriptionGenerator

+ (id)originDescriptionStringWithAppName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (!v3)
  {
    CUIKBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Apps"), &stru_1E6EBAE30, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  CUIKBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Found in %@"), &stru_1E6EBAE30, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)brandedOriginDescriptionStringWithAppName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (!v3)
  {
    CUIKBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Apps"), &stru_1E6EBAE30, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  CUIKBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Siri Found in %@"), &stru_1E6EBAE30, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)coalescedInfoForSuggestionNotifications:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CUIKSuggestionCoalescedInfo *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v11, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "compare:", v13);

        if (v14 == -1)
        {
          v15 = v11;

          v5 = v15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "localizedYearMonthAndDayStringShortened:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Beginning on: %@"), &stru_1E6EBAE30, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringWithFormat:", v21, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v22);

  }
  objc_msgSend(v6, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "originAppName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v25 = v6;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v41;
    while (2)
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "originAppName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", v24);

        if ((v31 & 1) == 0)
        {

          v24 = 0;
          goto LABEL_22;
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v27)
        continue;
      break;
    }
  }
LABEL_22:

  +[CUIKSuggestionDescriptionGenerator brandedOriginDescriptionStringWithAppName:](CUIKSuggestionDescriptionGenerator, "brandedOriginDescriptionStringWithAppName:", v24);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v32);

  v33 = (void *)MEMORY[0x1E0CB3940];
  CUIKBundle();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("%ld Events Found"), &stru_1E6EBAE30, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringWithFormat:", v35, objc_msgSend(v25, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[CUIKSuggestionCoalescedInfo initWithTitle:descriptionText:earliestSuggestionNotification:]([CUIKSuggestionCoalescedInfo alloc], "initWithTitle:descriptionText:earliestSuggestionNotification:", v36, v37, v5);

  return v38;
}

@end
