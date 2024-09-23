@implementation EventImportData

+ (id)acceptedTypeIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier", CFSTR("com.apple.calendar.spotlight.identifier"), CFSTR("com.apple.calendar.ics"), CFSTR("com.apple.ical.ics"), CFSTR("com.apple.reminders.ics"), CFSTR("com.apple.mapkit.map-item"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[5] = v2;
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[6] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (EventImportData)init
{
  EventImportData *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EventImportData;
  result = -[EventImportData init](&v3, sel_init);
  if (result)
    result->_requestedAction = 0;
  return result;
}

+ (void)extractEventImportDataFromDropSession:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  id v25;
  char v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(a1, "acceptedTypeIdentifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = a1;
  v26 = objc_msgSend(a1, "isSessionManaged:", v6);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v6, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (!v9)
  {

LABEL_26:
    v7[2](v7, 0);
    goto LABEL_27;
  }
  v10 = v9;
  v28 = v7;
  v25 = v6;
  v11 = 0;
  v12 = *(_QWORD *)v41;
  v29 = *(_QWORD *)v41;
  v30 = v8;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v41 != v12)
        objc_enumerationMutation(v8);
      if ((v11 & 1) != 0)
      {
        v11 = 1;
      }
      else
      {
        v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v15 = v31;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v37;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v37 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
              objc_msgSend(v14, "itemProvider");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "hasItemConformingToTypeIdentifier:", v20);

              if (v22)
              {
                objc_msgSend(v14, "itemProvider");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v32[0] = MEMORY[0x1E0C809B0];
                v32[1] = 3221225472;
                v32[2] = __73__EventImportData_extractEventImportDataFromDropSession_completionBlock___block_invoke;
                v32[3] = &unk_1E601C170;
                v34 = v27;
                v32[4] = v20;
                v35 = v26;
                v33 = v28;
                v24 = (id)objc_msgSend(v23, "loadDataRepresentationForTypeIdentifier:completionHandler:", v20, v32);

                v11 = 1;
                goto LABEL_18;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v17)
              continue;
            break;
          }
          v11 = 0;
LABEL_18:
          v12 = v29;
          v8 = v30;
        }
        else
        {
          v11 = 0;
        }

      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  }
  while (v10);

  v6 = v25;
  v7 = (void (**)(id, _QWORD))v28;
  if ((v11 & 1) == 0)
    goto LABEL_26;
LABEL_27:

}

void __73__EventImportData_extractEventImportDataFromDropSession_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 48), "eventImportDataFromData:forType:", a2, *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  objc_msgSend(v3, "setPrefersManagedCalendar:", *(unsigned __int8 *)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)isSessionManaged:(id)a3
{
  id v3;
  id v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EEF09F50))
  {
    v4 = v3;
    v5 = objc_msgSend(v4, "_dataOwner") == 2 || objc_msgSend(v4, "_dataOwner") == 3;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)itemContainsCalendarICSData:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("com.apple.calendar.ics"), CFSTR("com.apple.ical.ics"), 0);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v3, "itemProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v9, "hasItemConformingToTypeIdentifier:", v8);

        if ((v8 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)eventImportDataFromData:(id)a3 forType:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;
  int v12;
  void *v13;
  int v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.calendar.spotlight.identifier")))
  {
    objc_msgSend(a1, "_extractEventDataFromSpotlightIdentifier:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.calendar.ics")) & 1) != 0
         || objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ical.ics")))
  {
    objc_msgSend(a1, "_extractEventDataFromEventICSData:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.reminders.ics")))
  {
    objc_msgSend(a1, "_extractEventDataFromReminderICSData:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "isEqualToString:", v11);

    if (v12)
    {
      objc_msgSend(a1, "_extractEventDataFromURL:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v7, "isEqualToString:", v13);

      if (v14)
      {
        objc_msgSend(a1, "_extractEventDataFromUTF8StringData:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mapkit.map-item")))
        {
          v9 = 0;
          goto LABEL_7;
        }
        objc_msgSend(a1, "_extractEventDataFromMapKitItemData:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v9 = (void *)v8;
LABEL_7:

  return v9;
}

+ (id)_extractEventDataFromSpotlightIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 4);

  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CAA078]);
  objc_msgSend(v8, "calendarItemWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;
  if (v11)
  {
    v12 = v9;
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      v12 = v9;
      if (objc_msgSend(v11, "hasRecurrenceRules"))
      {
        objc_msgSend(v6, "objectAtIndex:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v12 = v9;
        if (v14 > 1.0)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uniqueId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "eventWithUniqueId:occurrenceDate:", v16, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v9;
          if (v17)
          {
            v12 = v17;

          }
        }

      }
    }
    v11 = (id)objc_opt_new();
    objc_msgSend(v12, "uniqueId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUniqueId:", v18);

    objc_msgSend(v12, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStartDate:", v19);

    objc_msgSend(v11, "setRequestedAction:", 2);
  }
  else
  {
    v12 = 0;
  }

  return v11;
}

+ (id)_extractEventDataFromEventICSData:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setIcsData:", v3);

  objc_msgSend(v4, "setRequestedAction:", 1);
  return v4;
}

+ (id)_extractEventDataFromUTF8StringData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 4);

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setTitle:", v5);
  objc_msgSend(v6, "setRequestedAction:", 0);

  return v6;
}

+ (id)_extractEventDataFromReminderICSData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithEKOptions:", 48);
  objc_msgSend(v4, "defaultCalendarForNewReminders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "importICSData:intoCalendar:options:", v3, v5, 0xFFFFFFFF80000000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v8 == (void *)++v10)
      {
        v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v11;

    if (v12)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v12, "title", (_QWORD)v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v13);

      objc_msgSend(v12, "notes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNotes:", v14);

      objc_msgSend(v12, "dueDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setStartDate:", v15);

      objc_msgSend(v8, "setRequestedAction:", 0);
      goto LABEL_12;
    }
    v8 = 0;
  }
  else
  {
LABEL_9:
    v12 = v7;
LABEL_12:

  }
  return v8;
}

+ (id)_extractEventDataFromURL:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = (void *)*MEMORY[0x1E0CEC618];
  v5 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "objectWithItemProviderData:typeIdentifier:error:", v5, v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "_title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v7, "resourceSpecifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "hasPrefix:", CFSTR("//")))
      {
        objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", 0, 2, &stru_1E601DFA8);
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
      }
    }
    objc_msgSend(v8, "setTitle:", v9);
    objc_msgSend(v8, "setURL:", v7);
    objc_msgSend(v8, "setRequestedAction:", 0);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_extractEventDataFromMapKitItemData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0;
  objc_msgSend((id)EKWeakLinkClass(), "objectWithItemProviderData:typeIdentifier:error:", v3, CFSTR("com.apple.mapkit.map-item"), &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v11;
  if (v4)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);

    objc_msgSend(MEMORY[0x1E0CAA158], "locationWithMapItem:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStructuredLocation:", v8);

    objc_msgSend(v6, "setRequestedAction:", 0);
  }
  else
  {
    v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_ERROR, "Unable to import mapkit data from drop. Error: %@", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (NSData)icsData
{
  return self->_icsData;
}

- (void)setIcsData:(id)a3
{
  objc_storeStrong((id *)&self->_icsData, a3);
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueId, a3);
}

- (EKStructuredLocation)structuredLocation
{
  return self->_structuredLocation;
}

- (void)setStructuredLocation:(id)a3
{
  objc_storeStrong((id *)&self->_structuredLocation, a3);
}

- (int)requestedAction
{
  return self->_requestedAction;
}

- (void)setRequestedAction:(int)a3
{
  self->_requestedAction = a3;
}

- (BOOL)prefersManagedCalendar
{
  return self->_prefersManagedCalendar;
}

- (void)setPrefersManagedCalendar:(BOOL)a3
{
  self->_prefersManagedCalendar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structuredLocation, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_icsData, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
