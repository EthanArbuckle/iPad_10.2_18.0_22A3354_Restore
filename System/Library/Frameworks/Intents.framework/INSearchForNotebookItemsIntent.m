@implementation INSearchForNotebookItemsIntent

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 9;
}

- (id)_categoryVerb
{
  return CFSTR("Search");
}

- (INSearchForNotebookItemsIntent)initWithTitle:(INSpeakableString *)title content:(NSString *)content itemType:(INNotebookItemType)itemType status:(INTaskStatus)status location:(CLPlacemark *)location locationSearchType:(INLocationSearchType)locationSearchType dateTime:(INDateComponentsRange *)dateTime dateSearchType:(INDateSearchType)dateSearchType temporalEventTriggerTypes:(INTemporalEventTriggerTypeOptions)temporalEventTriggerTypes taskPriority:(INTaskPriority)taskPriority notebookItemIdentifier:(NSString *)notebookItemIdentifier
{
  NSString *v19;
  CLPlacemark *v20;
  INDateComponentsRange *v21;
  NSString *v22;
  INSearchForNotebookItemsIntent *v23;
  INSearchForNotebookItemsIntent *v24;
  INSpeakableString *v26;
  objc_super v27;

  v26 = title;
  v19 = content;
  v20 = location;
  v21 = dateTime;
  v22 = notebookItemIdentifier;
  v27.receiver = self;
  v27.super_class = (Class)INSearchForNotebookItemsIntent;
  v23 = -[INIntent init](&v27, sel_init);
  v24 = v23;
  if (v23)
  {
    -[INSearchForNotebookItemsIntent setTitle:](v23, "setTitle:", v26);
    -[INSearchForNotebookItemsIntent setContent:](v24, "setContent:", v19);
    -[INSearchForNotebookItemsIntent setItemType:](v24, "setItemType:", itemType);
    -[INSearchForNotebookItemsIntent setStatus:](v24, "setStatus:", status);
    -[INSearchForNotebookItemsIntent setLocation:](v24, "setLocation:", v20);
    -[INSearchForNotebookItemsIntent setLocationSearchType:](v24, "setLocationSearchType:", locationSearchType);
    -[INSearchForNotebookItemsIntent setDateTime:](v24, "setDateTime:", v21);
    -[INSearchForNotebookItemsIntent setDateSearchType:](v24, "setDateSearchType:", dateSearchType);
    -[INSearchForNotebookItemsIntent setTemporalEventTriggerTypes:](v24, "setTemporalEventTriggerTypes:", temporalEventTriggerTypes);
    -[INSearchForNotebookItemsIntent setTaskPriority:](v24, "setTaskPriority:", taskPriority);
    -[INSearchForNotebookItemsIntent setNotebookItemIdentifier:](v24, "setNotebookItemIdentifier:", v22);
  }

  return v24;
}

- (INSpeakableString)title
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTitle:", v5);
}

- (NSString)content
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setContent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContent:", v4);

}

- (INNotebookItemType)itemType
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  INNotebookItemType v9;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasItemType");
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "itemType");
  v7 = 3;
  v8 = 2;
  if (v6 != 20)
    v8 = v6 == 10;
  if (v6 != 30)
    v7 = v8;
  if (v4)
    v9 = v7;
  else
    v9 = INNotebookItemTypeUnknown;

  return v9;
}

- (void)setItemType:(int64_t)a3
{
  void *v4;
  id v5;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 <= 3)
    objc_msgSend(v4, "setItemType:", (10 * a3));
  else
    objc_msgSend(v4, "setHasItemType:", 0);

}

- (INTaskStatus)status
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  INTaskStatus v8;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasStatus");
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");
  v7 = v6 == 10;
  if (v6 == 20)
    v7 = 2;
  if (v4)
    v8 = v7;
  else
    v8 = INTaskStatusUnknown;

  return v8;
}

- (void)setStatus:(int64_t)a3
{
  void *v4;
  id v5;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 <= 2)
    objc_msgSend(v4, "setStatus:", (10 * a3));
  else
    objc_msgSend(v4, "setHasStatus:", 0);

}

- (CLPlacemark)location
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromLocation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLPlacemark *)v4;
}

- (void)setLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToLocation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLocation:", v5);
}

- (INLocationSearchType)locationSearchType
{
  void *v3;
  INLocationSearchType v4;
  void *v5;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v3, "hasLocationSearchType");
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "locationSearchType") == 10)
    v4 = (unint64_t)v4;
  else
    v4 = INLocationSearchTypeUnknown;

  return v4;
}

- (void)setLocationSearchType:(int64_t)a3
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a3 == 1)
    v3 = 10;
  else
    v3 = 0x7FFFFFFF;
  if (a3)
    v4 = v3;
  else
    v4 = 0;
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4 == 0x7FFFFFFF)
    objc_msgSend(v5, "setHasLocationSearchType:", 0);
  else
    objc_msgSend(v5, "setLocationSearchType:", v4);

}

- (INDateComponentsRange)dateTime
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setDateTime:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDateTime:", v5);
}

- (INDateSearchType)dateSearchType
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  INDateSearchType v9;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasDateSearchType");
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dateSearchType");
  v7 = 3;
  v8 = 2;
  if (v6 != 20)
    v8 = v6 == 10;
  if (v6 != 30)
    v7 = v8;
  if (v4)
    v9 = v7;
  else
    v9 = INDateSearchTypeUnknown;

  return v9;
}

- (void)setDateSearchType:(int64_t)a3
{
  void *v4;
  id v5;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 <= 3)
    objc_msgSend(v4, "setDateSearchType:", (10 * a3));
  else
    objc_msgSend(v4, "setHasDateSearchType:", 0);

}

- (INTemporalEventTriggerTypeOptions)temporalEventTriggerTypes
{
  void *v3;
  uint64_t v4;
  INTemporalEventTriggerTypeOptions v5;
  uint64_t i;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "temporalEventTriggerTypesCount");

  v5 = 0;
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "temporalEventTriggerTypeAtIndex:", i);
      v9 = v5 | 2;
      v10 = v5 | 1;
      if (v8 != 1)
        v10 = v5;
      if (v8 != 2)
        v9 = v10;
      if (v8 == 3)
        v5 |= 4uLL;
      else
        v5 = v9;

    }
  }
  return v5;
}

- (void)setTemporalEventTriggerTypes:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearTemporalEventTriggerTypes");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__INSearchForNotebookItemsIntent_setTemporalEventTriggerTypes___block_invoke;
  v6[3] = &unk_1E2295130;
  v6[4] = self;
  INTemporalEventTriggerTypeOptionsEnumerateBackingTypes(a3, v6);
}

- (INTaskPriority)taskPriority
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  INTaskPriority v8;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTaskPriority");
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "taskPriority");
  v7 = v6 == 1;
  if (v6 == 2)
    v7 = 2;
  if (v4)
    v8 = v7;
  else
    v8 = INTaskPriorityUnknown;

  return v8;
}

- (void)setTaskPriority:(int64_t)a3
{
  void *v4;
  id v5;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 2)
    objc_msgSend(v4, "setHasTaskPriority:", 0);
  else
    objc_msgSend(v4, "setTaskPriority:", a3);

}

- (INSpeakableString)groupName
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setGroupName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setGroupName:", v5);
}

- (BOOL)includeAllNoteContents
{
  void *v3;
  void *v4;
  char v5;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasIncludeAllNoteContents"))
  {
    -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "includeAllNoteContents");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setIncludeAllNoteContents:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setIncludeAllNoteContents:", 1);
  else
    objc_msgSend(v4, "setHasIncludeAllNoteContents:", 0);

}

- (NSString)notebookItemIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notebookItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setNotebookItemIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotebookItemIdentifier:", v4);

}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  INNotebookItemType v7;
  __CFString *v8;
  INTaskStatus v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  INLocationSearchType v13;
  __CFString *v14;
  void *v15;
  void *v16;
  INDateSearchType v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  INTaskPriority v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  _QWORD v37[11];
  _QWORD v38[13];

  v38[11] = *MEMORY[0x1E0C80C00];
  v37[0] = CFSTR("title");
  -[INSearchForNotebookItemsIntent title](self, "title");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v3;
  v38[0] = v3;
  v37[1] = CFSTR("content");
  -[INSearchForNotebookItemsIntent content](self, "content");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v5;
  v38[1] = v5;
  v37[2] = CFSTR("itemType");
  v7 = -[INSearchForNotebookItemsIntent itemType](self, "itemType");
  if ((unint64_t)(v7 - 1) > 2)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E22894E0[v7 - 1];
  v35 = v6;
  v34 = v8;
  v38[2] = v34;
  v37[3] = CFSTR("status");
  v9 = -[INSearchForNotebookItemsIntent status](self, "status");
  v10 = CFSTR("unknown");
  if (v9 == INTaskStatusCompleted)
    v10 = CFSTR("completed");
  if (v9 == INTaskStatusNotCompleted)
    v10 = CFSTR("notCompleted");
  v33 = v10;
  v38[3] = v33;
  v37[4] = CFSTR("location");
  -[INSearchForNotebookItemsIntent location](self, "location");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v38[4] = v11;
  v37[5] = CFSTR("locationSearchType");
  v13 = -[INSearchForNotebookItemsIntent locationSearchType](self, "locationSearchType", v11);
  v14 = CFSTR("unknown");
  if (v13 == INLocationSearchTypeByLocationTrigger)
    v14 = CFSTR("byLocationTrigger");
  v32 = v14;
  v38[5] = v32;
  v37[6] = CFSTR("dateTime");
  -[INSearchForNotebookItemsIntent dateTime](self, "dateTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[6] = v16;
  v37[7] = CFSTR("dateSearchType");
  v17 = -[INSearchForNotebookItemsIntent dateSearchType](self, "dateSearchType");
  if ((unint64_t)(v17 - 1) > 2)
    v18 = CFSTR("unknown");
  else
    v18 = off_1E228C9D0[v17 - 1];
  v36 = v4;
  v19 = v18;
  v38[7] = v19;
  v37[8] = CFSTR("temporalEventTriggerTypes");
  INTemporalEventTriggerTypeOptionsGetNames(-[INSearchForNotebookItemsIntent temporalEventTriggerTypes](self, "temporalEventTriggerTypes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[8] = v21;
  v37[9] = CFSTR("taskPriority");
  v22 = -[INSearchForNotebookItemsIntent taskPriority](self, "taskPriority");
  v23 = CFSTR("unknown");
  if (v22 == INTaskPriorityFlagged)
    v23 = CFSTR("flagged");
  if (v22 == INTaskPriorityNotFlagged)
    v23 = CFSTR("notFlagged");
  v24 = v23;
  v38[9] = v24;
  v37[10] = CFSTR("notebookItemIdentifier");
  -[INSearchForNotebookItemsIntent notebookItemIdentifier](self, "notebookItemIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[10] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)

  if (!v20)
  if (!v15)

  if (!v12)
  if (!v35)

  if (!v36)
  return v27;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  -[INSearchForNotebookItemsIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedLocationFromLocation(v9, a3, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocation:", v10);

  objc_msgSend(v7, "dateTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDateTime:", v12);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Notebook");
}

- (id)verb
{
  return CFSTR("SearchForNotebookItems");
}

void __63__INSearchForNotebookItemsIntent_setTemporalEventTriggerTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_typedBackingStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTemporalEventTriggerType:", a2);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INSearchForNotebookItemsIntent)initWithTitle:(INSpeakableString *)title content:(NSString *)content itemType:(INNotebookItemType)itemType status:(INTaskStatus)status location:(CLPlacemark *)location locationSearchType:(INLocationSearchType)locationSearchType dateTime:(INDateComponentsRange *)dateTime dateSearchType:(INDateSearchType)dateSearchType
{
  return -[INSearchForNotebookItemsIntent initWithTitle:content:itemType:status:location:locationSearchType:dateTime:dateSearchType:temporalEventTriggerTypes:taskPriority:notebookItemIdentifier:](self, "initWithTitle:content:itemType:status:location:locationSearchType:dateTime:dateSearchType:temporalEventTriggerTypes:taskPriority:notebookItemIdentifier:", title, content, itemType, status, location, locationSearchType, dateTime, dateSearchType, 0, 0, 0);
}

- (INSearchForNotebookItemsIntent)initWithTitle:(INSpeakableString *)title content:(NSString *)content itemType:(INNotebookItemType)itemType status:(INTaskStatus)status location:(CLPlacemark *)location locationSearchType:(INLocationSearchType)locationSearchType dateTime:(INDateComponentsRange *)dateTime dateSearchType:(INDateSearchType)dateSearchType notebookItemIdentifier:(NSString *)notebookItemIdentifier
{
  return -[INSearchForNotebookItemsIntent initWithTitle:content:itemType:status:location:locationSearchType:dateTime:dateSearchType:temporalEventTriggerTypes:taskPriority:notebookItemIdentifier:](self, "initWithTitle:content:itemType:status:location:locationSearchType:dateTime:dateSearchType:temporalEventTriggerTypes:taskPriority:notebookItemIdentifier:", title, content, itemType, status, location, locationSearchType, dateTime, dateSearchType, 0, 0, notebookItemIdentifier);
}

@end
