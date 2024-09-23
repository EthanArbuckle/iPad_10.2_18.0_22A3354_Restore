@implementation EKUICalendarMenu

+ (id)calendarMenuWithCalendars:(id)a3 eventStore:(id)a4 backgroundColor:(id)a5 setupActionHandler:(id)a6 selectionHandler:(id)a7
{
  return (id)objc_msgSend(a1, "_calendarMenuWithCalendars:eventStore:backgroundColor:setupActionHandler:selectionHandler:subtitle:", a3, a4, a5, a6, a7, 0);
}

+ (id)calendarSubmenuWithSubtitle:(id)a3 calendars:(id)a4 eventStore:(id)a5 backgroundColor:(id)a6 setupActionHandler:(id)a7 selectionHandler:(id)a8
{
  return (id)objc_msgSend(a1, "_calendarMenuWithCalendars:eventStore:backgroundColor:setupActionHandler:selectionHandler:subtitle:", a4, a5, a6, a7, a8, a3);
}

+ (id)calendarCircleImageForColor:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DC3870];
  v4 = a3;
  objc_msgSend(v3, "systemImageNamed:", CFSTR("circlebadge.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:renderingMode:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)placeholderMenuForCalendar:(id)a3 backgroundColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "displayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKAdjustedColorForBackgroundColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "calendarCircleImageForColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKDisplayedTitleForCalendar();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", v11, v10, 0, &__block_literal_global_16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC39D0];
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "menuWithChildren:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_calendarMenuWithCalendars:(id)a3 eventStore:(id)a4 backgroundColor:(id)a5 setupActionHandler:(id)a6 selectionHandler:(id)a7 subtitle:(id)a8
{
  void (**v13)(id, void *, void *);
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  id v42;
  id obj;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v51;
  _QWORD v52[5];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v13 = (void (**)(id, void *, void *))a6;
  v51 = a7;
  v42 = a8;
  LOBYTE(v41) = 0;
  objc_msgSend(MEMORY[0x1E0D0CD28], "generateGroupsForCalendars:eventStore:entityType:forMode:usingBackgroundColor:includingAccountsWithoutCalendars:filterByFocus:usingUnselectedCalendars:foundRefreshableCalendar:anyGroupsHiddenByFocus:numberOfCalendarsHiddenByFocus:", a3, a4, 0, 0, a5, 0, v41, 0, 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v14;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v46)
  {
    v44 = *(_QWORD *)v59;
    v45 = v15;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v59 != v44)
          objc_enumerationMutation(obj);
        v48 = v16;
        v17 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v17, "calendarInfos");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v47 = v17;
        objc_msgSend(v17, "calendarInfos");
        v49 = (id)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v55 != v23)
                objc_enumerationMutation(v49);
              v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
              v26 = (void *)MEMORY[0x1E0DC3428];
              objc_msgSend(v25, "title");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "color");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "calendarCircleImageForColor:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v52[0] = MEMORY[0x1E0C809B0];
              v52[1] = 3221225472;
              v52[2] = __119__EKUICalendarMenu__calendarMenuWithCalendars_eventStore_backgroundColor_setupActionHandler_selectionHandler_subtitle___block_invoke;
              v52[3] = &unk_1E60199E8;
              v52[4] = v25;
              v53 = v51;
              objc_msgSend(v26, "actionWithTitle:image:identifier:handler:", v27, v29, 0, v52);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v25, "isShared"))
              {
                objc_msgSend(v25, "stringForSharedCalendar");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "setDiscoverabilityTitle:", v31);

              }
              if (v13)
              {
                objc_msgSend(v25, "calendar");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v13[2](v13, v30, v32);

              }
              objc_msgSend(v20, "addObject:", v30);

            }
            v22 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          }
          while (v22);
        }

        objc_msgSend(v47, "title");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v45;
        CalAddInlineMenuItemArrayToArrayWithTitle(v45, (uint64_t)v20, (uint64_t)v33);

        v16 = v48 + 1;
      }
      while (v48 + 1 != v46);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v46);
  }

  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", &stru_1E601DFA8, 0, 0, &__block_literal_global_15_0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v34);

  }
  v35 = (void *)MEMORY[0x1E0DC39D0];
  if (v42)
  {
    EventKitUIBundle();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Calendar - context menu"), CFSTR("Calendar"), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "menuWithTitle:image:identifier:options:children:", v37, v38, 0, 0, v15);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "setSubtitle:", v42);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v15);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v39;
}

void __119__EKUICalendarMenu__calendarMenuWithCalendars_eventStore_backgroundColor_setupActionHandler_selectionHandler_subtitle___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "calendar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
