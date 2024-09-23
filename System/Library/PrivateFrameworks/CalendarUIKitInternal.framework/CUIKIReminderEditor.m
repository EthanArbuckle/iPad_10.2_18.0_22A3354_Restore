@implementation CUIKIReminderEditor

- (CUIKIReminderEditor)initWithEventStore:(id)a3 undoManager:(id)a4 alertDisplayer:(id)a5 pendingReminderTracker:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CUIKIReminderEditor *v14;
  _TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation *v15;
  _TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation *reminderEditor;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CUIKIReminderEditor;
  v14 = -[CUIKIReminderEditor init](&v18, sel_init);
  if (v14)
  {
    v15 = -[CUIKIReminderEditorImplementation initWithEventStore:alertDisplayer:undoManager:changeTracker:]([_TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation alloc], "initWithEventStore:alertDisplayer:undoManager:changeTracker:", v10, v12, v11, v13);
    reminderEditor = v14->_reminderEditor;
    v14->_reminderEditor = v15;

  }
  return v14;
}

- (void)saveChangesToEvents:(id)a3 impliedCommitDecision:(BOOL)a4
{
  -[CUIKIReminderEditor _saveChangesToEvents:error:](self, "_saveChangesToEvents:error:", a3, 0);
}

- (void)saveChangesToEvents:(id)a3 span:(int64_t)a4
{
  -[CUIKIReminderEditor _saveChangesToEvents:error:](self, "_saveChangesToEvents:error:", a3, 0);
}

- (BOOL)_saveChangesToEvents:(id)a3 error:(id *)a4
{
  _TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation *reminderEditor;
  void *v6;

  reminderEditor = self->_reminderEditor;
  objc_msgSend(a3, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[CUIKIReminderEditorImplementation saveChangesToEvents:error:](reminderEditor, "saveChangesToEvents:error:", v6, a4);

  return (char)a4;
}

- (void)deleteEvents:(id)a3 resultHandler:(id)a4
{
  id v6;
  _TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation *reminderEditor;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  reminderEditor = self->_reminderEditor;
  objc_msgSend(a3, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__CUIKIReminderEditor_deleteEvents_resultHandler___block_invoke;
  v10[3] = &unk_2508F6220;
  v11 = v6;
  v9 = v6;
  -[CUIKIReminderEditorImplementation delete:completionHandler:](reminderEditor, "delete:completionHandler:", v8, v10);

}

uint64_t __50__CUIKIReminderEditor_deleteEvents_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)saveNewEvents:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    v11 = 1;
    do
    {
      v12 = 0;
      v13 = v11;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
        objc_msgSend(v14, "eventStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        v16 = objc_msgSend(v15, "saveEvent:span:commit:error:", v14, 0, 0, &v26);
        v17 = v26;

        v11 = 0;
        if (v16)
        {
          objc_msgSend(v6, "addObject:", v14);
          v11 = v13;
        }

        ++v12;
        v13 = v11;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v9);
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "eventStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      v21 = (void *)MEMORY[0x24BDBCED8];
      v31 = *MEMORY[0x24BE147B8];
      v32 = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dictionaryWithDictionary:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "postNotificationName:object:userInfo:", *MEMORY[0x24BE147B0], v19, v23);

  }
  return v11 & 1;
}

- (BOOL)saveEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  BOOL v11;
  BOOL v12;

  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "isNew");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v11 = -[CUIKIReminderEditor saveNewEvents:commit:error:](self, "saveNewEvents:commit:error:", v10, 1, a5);
    else
      v11 = -[CUIKIReminderEditor _saveChangesToEvents:error:](self, "_saveChangesToEvents:error:", v10, a5);
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)saveEventForOOPModificationRecording:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)commitEventForOOPModificationRecording:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)deleteEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKIReminderEditor deleteEvents:span:](self, "deleteEvents:span:", v7, a4);

  return 1;
}

- (void)deleteEvents:(id)a3
{
  -[CUIKIReminderEditor deleteEvents:resultHandler:](self, "deleteEvents:resultHandler:", a3, 0);
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4
{
  -[CUIKIReminderEditor deleteEvents:resultHandler:](self, "deleteEvents:resultHandler:", a3, 0);
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4 result:(id)a5
{
  -[CUIKIReminderEditor deleteEvents:resultHandler:](self, "deleteEvents:resultHandler:", a3, a5);
}

- (BOOL)saveCalendar:(id)a3 error:(id *)a4
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKIReminderEditor saveCalendars:](self, "saveCalendars:", v5);

  return 1;
}

- (void)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4
{
  id v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CUIKIReminderEditor deleteCalendars:](self, "deleteCalendars:", v5);

}

- (BOOL)eventUsesEditor:(id)a3
{
  return objc_msgSend(a3, "isIntegrationEvent");
}

- (BOOL)calendarUsesEditor:(id)a3
{
  return 0;
}

- (BOOL)sourceUsesEditor:(id)a3
{
  return 0;
}

- (void)performWithOptions:(id)a3 block:(id)a4
{
  _TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation *reminderEditor;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a4;
  reminderEditor = self->_reminderEditor;
  v7 = a3;
  -[CUIKIReminderEditorImplementation alertDisplayer](reminderEditor, "alertDisplayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE14790]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CUIKIReminderEditorImplementation setAlertDisplayer:](self->_reminderEditor, "setAlertDisplayer:", v9);
    v10[2]();
    -[CUIKIReminderEditorImplementation setAlertDisplayer:](self->_reminderEditor, "setAlertDisplayer:", v8);
  }
  else
  {
    v10[2]();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderEditor, 0);
}

@end
