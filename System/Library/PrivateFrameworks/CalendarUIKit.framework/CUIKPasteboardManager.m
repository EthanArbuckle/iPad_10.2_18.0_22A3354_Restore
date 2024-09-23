@implementation CUIKPasteboardManager

- (void)setDateForPaste:(id)a3
{
  objc_storeStrong((id *)&self->_dateForPaste, a3);
}

- (CUIKPasteboardManager)initWithEventStoreProvider:(id)a3 pasteboard:(id)a4 calendarProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  CUIKPasteboardManager *v11;
  CUIKPasteboardManager *v12;
  uint64_t v13;
  NSMutableDictionary *copiedEvents;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CUIKPasteboardManager;
  v11 = -[CUIKPasteboardManager init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_eventStoreProvider, v8);
    objc_storeStrong((id *)&v12->_pasteboard, a4);
    objc_storeWeak((id *)&v12->_calendarProvider, v10);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    copiedEvents = v12->_copiedEvents;
    v12->_copiedEvents = (NSMutableDictionary *)v13;

  }
  return v12;
}

- (void)cutEvents:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  CUIKPasteboardManager *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__CUIKPasteboardManager_cutEvents_delegate___block_invoke;
  v10[3] = &unk_1E6EB6C90;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  -[CUIKPasteboardManager _validateAction:forEvents:delegate:completion:](self, "_validateAction:forEvents:delegate:completion:", 0, v8, v9, v10);

}

void __44__CUIKPasteboardManager_cutEvents_delegate___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "editorForPasteboardManager:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_cutEvents:editor:", *(_QWORD *)(a1 + 48), v3);

  }
}

- (void)_cutEvents:(id)a3 editor:(id)a4
{
  NSMutableDictionary *copiedEvents;
  id v7;
  id v8;

  copiedEvents = self->_copiedEvents;
  v7 = a4;
  v8 = a3;
  -[CUIKPasteboardManager _copyEvents:toDict:](self, "_copyEvents:toDict:", v8, copiedEvents);
  objc_msgSend(v7, "deleteEvents:span:", v8, 0);

}

- (void)copyEvents:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__CUIKPasteboardManager_copyEvents_delegate___block_invoke;
  v8[3] = &unk_1E6EB6CB8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[CUIKPasteboardManager _validateAction:forEvents:delegate:completion:](self, "_validateAction:forEvents:delegate:completion:", 1, v7, a4, v8);

}

uint64_t __45__CUIKPasteboardManager_copyEvents_delegate___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_copyEvents:toDict:", *(_QWORD *)(result + 40), *(_QWORD *)(*(_QWORD *)(result + 32) + 32));
  return result;
}

- (void)_copyEvents:(id)a3 toDict:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "removeAllObjects");
  -[CUIKPasteboardManager setDateForPaste:](self, "setDateForPaste:", 0);
  -[CUIKPasteboardManager setCalendarForPaste:](self, "setCalendarForPaste:", 0);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v13, "eventOccurrenceID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "duplicate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend((id)objc_opt_class(), "_pasteboardItemForEvent:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j), (_QWORD)v26);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v22);
  }

  -[CUIKPasteboard setItems:](self->_pasteboard, "setItems:", v19);
}

- (void)setCalendarForPaste:(id)a3
{
  objc_storeStrong((id *)&self->_calendarForPaste, a3);
}

- (BOOL)_calendarIsPasteableTo:(id)a3 allCalendars:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "allowsContentModifications"))
    v7 = objc_msgSend(v6, "containsObject:", v5);
  else
    v7 = 0;

  return v7;
}

- (id)calendarToPasteTo
{
  void *v3;
  void *v4;

  -[CUIKPasteboardManager _eventsFromPasteboard:](self, "_eventsFromPasteboard:", self->_pasteboard);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKPasteboardManager calendarToPasteToWithEvents:](self, "calendarToPasteToWithEvents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)calendarToPasteToWithEvents:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  EKCalendar *calendarForPaste;
  EKCalendar *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStoreProvider);
  objc_msgSend(WeakRetained, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendarsForEntityType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  calendarForPaste = self->_calendarForPaste;
  if (calendarForPaste
    && -[CUIKPasteboardManager _calendarIsPasteableTo:allCalendars:](self, "_calendarIsPasteableTo:allCalendars:", calendarForPaste, v7))
  {
    v9 = self->_calendarForPaste;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v18, "calendar", (_QWORD)v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[CUIKPasteboardManager _calendarIsPasteableTo:allCalendars:](self, "_calendarIsPasteableTo:allCalendars:", v19, v7);

          if (v20)
          {
            objc_msgSend(v18, "calendar");
            v9 = (EKCalendar *)objc_claimAutoreleasedReturnValue();
            v21 = v13;
            goto LABEL_14;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v15)
          continue;
        break;
      }
    }

    v21 = objc_loadWeakRetained((id *)&self->_calendarProvider);
    objc_msgSend(v21, "defaultCalendarForNewEvents");
    v9 = (EKCalendar *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  }
  return v9;
}

- (BOOL)canPerformPaste
{
  void *v3;
  BOOL v4;

  if (!-[CUIKPasteboardManager numberOfEventsToPaste](self, "numberOfEventsToPaste"))
    return 0;
  -[CUIKPasteboardManager calendarToPasteTo](self, "calendarToPasteTo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (unint64_t)numberOfEventsToPaste
{
  CUIKPasteboard *pasteboard;
  void *v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  pasteboard = self->_pasteboard;
  v7[0] = CFSTR("com.apple.calendar.pasteboard.event");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKPasteboard itemSetWithPasteboardTypes:](pasteboard, "itemSetWithPasteboardTypes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  return v5;
}

- (void)pasteEventsWithDateMode:(unint64_t)a3 delegate:(id)a4
{
  CUIKPasteboard *pasteboard;
  id v7;
  id v8;

  pasteboard = self->_pasteboard;
  v7 = a4;
  -[CUIKPasteboardManager _eventsFromPasteboard:](self, "_eventsFromPasteboard:", pasteboard);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CUIKPasteboardManager _pasteEvents:atDate:dateMode:pasteDelegate:duplicate:](self, "_pasteEvents:atDate:dateMode:pasteDelegate:duplicate:", v8, self->_dateForPaste, a3, v7, 0);

}

- (void)duplicateEvents:(id)a3 withDateMode:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__CUIKPasteboardManager_duplicateEvents_withDateMode_delegate___block_invoke;
  v12[3] = &unk_1E6EB6CE0;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  -[CUIKPasteboardManager _validateAction:forEvents:delegate:completion:](self, "_validateAction:forEvents:delegate:completion:", 2, v11, v10, v12);

}

uint64_t __63__CUIKPasteboardManager_duplicateEvents_withDateMode_delegate___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_pasteEvents:atDate:dateMode:pasteDelegate:duplicate:", *(_QWORD *)(result + 40), *(_QWORD *)(*(_QWORD *)(result + 32) + 48), *(_QWORD *)(result + 56), *(_QWORD *)(result + 48), 1);
  return result;
}

- (void)_pasteEvents:(id)a3 atDate:(id)a4 dateMode:(unint64_t)a5 pasteDelegate:(id)a6 duplicate:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  -[CUIKPasteboardManager calendarToPasteToWithEvents:](self, "calendarToPasteToWithEvents:", v14);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  +[CUIKPasteboardUtilities duplicateEventsByStrippingUnsupportedFields:toNewCalendar:](CUIKPasteboardUtilities, "duplicateEventsByStrippingUnsupportedFields:toNewCalendar:", v14, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKCalendar();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKPasteboardUtilities adjustTimesForEventsToPaste:pasteDate:dateMode:calendar:](CUIKPasteboardUtilities, "adjustTimesForEventsToPaste:pasteDate:dateMode:calendar:", v15, v13, a5, v16);

  -[CUIKPasteboardManager _saveNewEventsOrOpenEditor:pasteDelegate:duplicate:](self, "_saveNewEventsOrOpenEditor:pasteDelegate:duplicate:", v15, v12, v7);
}

- (void)_saveNewEventsOrOpenEditor:(id)a3 pasteDelegate:(id)a4 duplicate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CUIKPasteboardManager *v41;
  _QWORD v42[4];
  id v43;
  CUIKPasteboardManager *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  CUIKPasteboardManager *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v5 = a5;
  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v41 = self;
  objc_msgSend(v9, "editorForPasteboardManager:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v51 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        if (objc_msgSend(v18, "hasAttendees"))
          v19 = v12;
        else
          v19 = v11;
        objc_msgSend(v19, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v15);
  }

  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    CUIKBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v10;
    if (v5)
    {
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("You’re duplicating multiple events with attendees."), &stru_1E6EBAE30, 0);
      v23 = objc_claimAutoreleasedReturnValue();

      CUIKBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("More than one of the events you are trying to duplicate has attendees."), &stru_1E6EBAE30, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      CUIKBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = CFSTR("Duplicate And Send Invitations");
    }
    else
    {
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("You’re pasting multiple events with attendees."), &stru_1E6EBAE30, 0);
      v23 = objc_claimAutoreleasedReturnValue();

      CUIKBundle();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("More than one of the events you are trying to paste has attendees."), &stru_1E6EBAE30, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      CUIKBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = CFSTR("Paste And Send Invitations");
    }
    objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_1E6EBAE30, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)v23;

    +[CUIKAlertController alertControllerWithTitle:message:](CUIKAlertController, "alertControllerWithTitle:message:", v23, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __76__CUIKPasteboardManager__saveNewEventsOrOpenEditor_pasteDelegate_duplicate___block_invoke;
    v45[3] = &unk_1E6EB6D08;
    v39 = v22;
    v46 = v22;
    v47 = v13;
    v32 = v9;
    v48 = v32;
    v49 = v41;
    +[CUIKAlertAction actionWithTitle:style:handler:](CUIKAlertAction, "actionWithTitle:style:handler:", v38, 0, v45);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addAction:", v37);
    CUIKBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1E6EBAE30, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __76__CUIKPasteboardManager__saveNewEventsOrOpenEditor_pasteDelegate_duplicate___block_invoke_2;
    v42[3] = &unk_1E6EB6D30;
    v35 = v32;
    v43 = v35;
    v44 = v41;
    +[CUIKAlertAction actionWithTitle:style:handler:](CUIKAlertAction, "actionWithTitle:style:handler:", v34, 1, v42);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v40;
    objc_msgSend(v31, "addAction:", v36);
    objc_msgSend(v35, "pasteboardManager:presentAlert:", v41, v31);

    v10 = v39;
    goto LABEL_20;
  }
  objc_msgSend(v10, "saveNewEvents:commit:error:", v11, 1, 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "pasteboardManager:didFinishPasteWithResult:willOpenEditor:", v41, 0, objc_msgSend(v12, "count") != 0);
  if (objc_msgSend(v12, "count") == 1)
  {
    objc_msgSend(v12, "anyObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pasteboardManager:beginEditingEvent:", v41, v29);
LABEL_20:

  }
}

uint64_t __76__CUIKPasteboardManager__saveNewEventsOrOpenEditor_pasteDelegate_duplicate___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "saveNewEvents:commit:error:", *(_QWORD *)(a1 + 40), 1, 0);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 48), "pasteboardManager:didFinishPasteWithResult:willOpenEditor:", *(_QWORD *)(a1 + 56), 0, 1);
  return result;
}

uint64_t __76__CUIKPasteboardManager__saveNewEventsOrOpenEditor_pasteDelegate_duplicate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "pasteboardManager:didFinishPasteWithResult:willOpenEditor:", *(_QWORD *)(a1 + 40), 1, 0);
  return result;
}

- (void)_validateAction:(unint64_t)a3 forEvents:(id)a4 delegate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  CUIKPasteboardManager *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id *v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  CUIKPasteboardManager *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v69 != v16)
          objc_enumerationMutation(v10);
        v15 += objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "isOnlyOccurrence") ^ 1;
      }
      v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    }
    while (v14);
    if (v15 >= 1)
    {
      v53 = self;
      +[CUIKAlertController alertControllerWithTitle:message:](CUIKAlertController, "alertControllerWithTitle:message:", 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1E6EBAE30, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke;
      v66[3] = &unk_1E6EB6D58;
      v21 = v12;
      v67 = v21;
      +[CUIKAlertAction actionWithTitle:style:handler:](CUIKAlertAction, "actionWithTitle:style:handler:", v20, 1, v66);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "addAction:", v22);
      if (a3)
      {
        if (a3 == 2)
        {
          CUIKBundle();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v15 == 1)
          {
            objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("You’re duplicating an event."), &stru_1E6EBAE30, 0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setTitle:", v40);

            CUIKBundle();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("This event is an occurrence of a repeating event. Calendar will duplicate only this selected occurrence."), &stru_1E6EBAE30, 0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setMessage:", v42);

            CUIKBundle();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Duplicate This Event"), &stru_1E6EBAE30, 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v54[0] = MEMORY[0x1E0C809B0];
            v54[1] = 3221225472;
            v54[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_7;
            v54[3] = &unk_1E6EB6D58;
            v31 = &v55;
            v55 = v21;
            v32 = v54;
          }
          else
          {
            objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("You’re duplicating events."), &stru_1E6EBAE30, 0);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setTitle:", v46);

            CUIKBundle();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Some of the selected events are repeating events. Calendar will duplicate only the selected occurrences of these events."), &stru_1E6EBAE30, 0);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setMessage:", v48);

            CUIKBundle();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Duplicate These Events"), &stru_1E6EBAE30, 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v56[0] = MEMORY[0x1E0C809B0];
            v56[1] = 3221225472;
            v56[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_6;
            v56[3] = &unk_1E6EB6D58;
            v31 = &v57;
            v57 = v21;
            v32 = v56;
          }
        }
        else
        {
          v23 = v53;
          if (a3 != 1)
          {
LABEL_23:
            objc_msgSend(v11, "pasteboardManager:presentAlert:", v23, v18);

            goto LABEL_24;
          }
          CUIKBundle();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v15 == 1)
          {
            objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("You’re copying an event."), &stru_1E6EBAE30, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setTitle:", v26);

            CUIKBundle();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("This event is an occurrence of a repeating event. Calendar will copy only this selected occurrence."), &stru_1E6EBAE30, 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setMessage:", v28);

            CUIKBundle();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Copy This Event"), &stru_1E6EBAE30, 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v62[0] = MEMORY[0x1E0C809B0];
            v62[1] = 3221225472;
            v62[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_3;
            v62[3] = &unk_1E6EB6D58;
            v31 = &v63;
            v63 = v21;
            v32 = v62;
          }
          else
          {
            objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("You’re copying events."), &stru_1E6EBAE30, 0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setTitle:", v49);

            CUIKBundle();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("Some of the selected events are repeating events. Calendar will copy only the selected occurrences of these events."), &stru_1E6EBAE30, 0);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setMessage:", v51);

            CUIKBundle();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Copy These Events"), &stru_1E6EBAE30, 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v64[0] = MEMORY[0x1E0C809B0];
            v64[1] = 3221225472;
            v64[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_2;
            v64[3] = &unk_1E6EB6D58;
            v31 = &v65;
            v65 = v21;
            v32 = v64;
          }
        }
      }
      else
      {
        CUIKBundle();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v15 == 1)
        {
          objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("You’re cutting an event."), &stru_1E6EBAE30, 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setTitle:", v35);

          CUIKBundle();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("This event is an occurrence of a repeating event. Calendar will cut only this selected occurrence."), &stru_1E6EBAE30, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setMessage:", v37);

          CUIKBundle();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Cut This Event"), &stru_1E6EBAE30, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_5;
          v58[3] = &unk_1E6EB6D58;
          v31 = &v59;
          v59 = v21;
          v32 = v58;
        }
        else
        {
          objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("You’re cutting events."), &stru_1E6EBAE30, 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setTitle:", v43);

          CUIKBundle();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Some of the selected events are repeating events. Calendar will cut only the selected occurrences of these events."), &stru_1E6EBAE30, 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setMessage:", v45);

          CUIKBundle();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Cut These Events"), &stru_1E6EBAE30, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_4;
          v60[3] = &unk_1E6EB6D58;
          v31 = &v61;
          v61 = v21;
          v32 = v60;
        }
      }
      +[CUIKAlertAction actionWithTitle:style:handler:](CUIKAlertAction, "actionWithTitle:style:handler:", v30, 0, v32);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAction:", v52);

      v23 = v53;
      goto LABEL_23;
    }
  }
  (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
LABEL_24:

}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__CUIKPasteboardManager__validateAction_forEvents_delegate_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_pasteboardItemForEvent:(id)a3
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
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventOccurrenceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("com.apple.calendar.pasteboard.event"));
  +[CUIKEventDescriptionGenerator sharedGenerator](CUIKEventDescriptionGenerator, "sharedGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textRepresentationForEvent:withTextFormat:showURI:", v3, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v9);

  +[CUIKEventDescriptionGenerator sharedGenerator](CUIKEventDescriptionGenerator, "sharedGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textRepresentationForEvent:withTextFormat:showURI:", v3, 1, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "length");
  v22 = *MEMORY[0x1E0DC1118];
  v23[0] = *MEMORY[0x1E0DC1190];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v11, "dataFromRange:documentAttributes:error:", 0, v12, v13, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v21;

  if (v14)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v16);
  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[CUIKPasteboardManager _pasteboardItemForEvent:].cold.1((uint64_t)v15, v16);
  }

  +[CUIKEventDescriptionGenerator sharedGenerator](CUIKEventDescriptionGenerator, "sharedGenerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "textRepresentationForEvent:withTextFormat:showURI:", v3, 2, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v19);

  return v4;
}

- (id)_eventsFromPasteboard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = CFSTR("com.apple.calendar.pasteboard.event");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemSetWithPasteboardTypes:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)v7;
  v18 = v4;
  objc_msgSend(v4, "dataForPasteboardType:inItemSet:", CFSTR("com.apple.calendar.pasteboard.event"), v7);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), 4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_copiedEvents, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13
          || (WeakRetained = objc_loadWeakRetained((id *)&self->_eventStoreProvider),
              objc_msgSend(WeakRetained, "eventStore"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v15, "eventWithIdentifier:", v12),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              WeakRetained,
              v13))
        {
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)eventsFromPasteboard
{
  return -[CUIKPasteboardManager _eventsFromPasteboard:](self, "_eventsFromPasteboard:", self->_pasteboard);
}

- (CGColor)colorOfCalendarToPasteTo
{
  void *v2;
  CGColorRef v3;
  CGColor *v4;

  -[CUIKPasteboardManager calendarToPasteTo](self, "calendarToPasteTo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CGColorRetain((CGColorRef)objc_msgSend(v2, "CGColor"));
  v4 = (CGColor *)CFAutorelease(v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateForPaste, 0);
  objc_storeStrong((id *)&self->_calendarForPaste, 0);
  objc_storeStrong((id *)&self->_copiedEvents, 0);
  objc_destroyWeak((id *)&self->_calendarProvider);
  objc_storeStrong((id *)&self->_pasteboard, 0);
  objc_destroyWeak((id *)&self->_eventStoreProvider);
}

+ (void)_pasteboardItemForEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B8A6A000, a2, OS_LOG_TYPE_ERROR, "Unable to convert attributed string to RTF for the pasteboard: %@", (uint8_t *)&v2, 0xCu);
}

@end
