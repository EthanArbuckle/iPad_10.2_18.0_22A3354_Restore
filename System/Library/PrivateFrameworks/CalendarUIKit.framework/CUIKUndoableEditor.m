@implementation CUIKUndoableEditor

- (void)setUndoDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_undoDelegate, a3);
}

- (CUIKUndoableEditor)initWithEditingManager:(id)a3
{
  id v5;
  CUIKUndoableEditor *v6;
  CUIKUndoableEditor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKUndoableEditor;
  v6 = -[CUIKUndoableEditor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_editingManager, a3);

  return v7;
}

- (id)_openEditingContextForObjects:(id)a3
{
  CUIKEditingManager *editingManager;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  editingManager = self->_editingManager;
  objc_msgSend(a3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingManager openEditingContextWithObjects:interfaceType:](editingManager, "openEditingContextWithObjects:interfaceType:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKUndoableEditor decisionDelegate](self, "decisionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDecisionDelegate:", v7);

  -[CUIKUndoableEditor undoDelegate](self, "undoDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUndoDelegate:", v8);

  -[CUIKUndoableEditor commitDelegate](self, "commitDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCommitDelegate:", v9);

  return v6;
}

- (void)saveChangesToEvents:(id)a3 impliedCommitDecision:(BOOL)a4
{
  -[CUIKUndoableEditor _saveChangesToEvents:span:impliedCommitDecision:error:](self, "_saveChangesToEvents:span:impliedCommitDecision:error:", a3, -1, a4, 0);
}

- (void)saveChangesToEvents:(id)a3 span:(int64_t)a4
{
  -[CUIKUndoableEditor _saveChangesToEvents:span:impliedCommitDecision:error:](self, "_saveChangesToEvents:span:impliedCommitDecision:error:", a3, a4, 1, 0);
}

- (BOOL)_saveChangesToEvents:(id)a3 span:(int64_t)a4 impliedCommitDecision:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  void *v9;
  char v10;
  BOOL v11;

  v7 = a5;
  -[CUIKUndoableEditor _openEditingContextForObjects:](self, "_openEditingContextForObjects:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 != -1)
    objc_msgSend(v9, "_specifySpanDecision:", +[CUIKEditingContext spanDecisionFromSpan:](CUIKEditingContext, "spanDecisionFromSpan:", a4));
  if (v7)
    v10 = objc_msgSend(v9, "saveCompleteChangeWithImpliedCommitDecisionAndClose:error:", 1, a6);
  else
    v10 = objc_msgSend(v9, "saveCompleteChangeAndClose:error:", 1, a6);
  v11 = v10;

  return v11;
}

- (void)deleteEvents:(id)a3
{
  -[CUIKUndoableEditor deleteEvents:span:](self, "deleteEvents:span:", a3, -1);
}

- (void)saveCalendars:(id)a3
{
  id v4;

  -[CUIKUndoableEditor _openEditingContextForObjects:](self, "_openEditingContextForObjects:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveCompleteChange");
  -[CUIKEditingManager closeEditingContext:](self->_editingManager, "closeEditingContext:", v4);

}

- (void)deleteCalendars:(id)a3
{
  id v4;

  -[CUIKUndoableEditor _openEditingContextForObjects:](self, "_openEditingContextForObjects:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteAllObjects");
  -[CUIKEditingManager closeEditingContext:](self->_editingManager, "closeEditingContext:", v4);

}

- (void)saveNewSources:(id)a3 commit:(BOOL)a4
{
  id v5;

  -[CUIKUndoableEditor _openEditingContextForObjects:](self, "_openEditingContextForObjects:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAllObjects");
  -[CUIKEditingManager closeEditingContext:](self->_editingManager, "closeEditingContext:", v5);

}

- (void)saveChangesToSources:(id)a3
{
  id v4;

  -[CUIKUndoableEditor _openEditingContextForObjects:](self, "_openEditingContextForObjects:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveCompleteChange");
  -[CUIKEditingManager closeEditingContext:](self->_editingManager, "closeEditingContext:", v4);

}

- (void)deleteSources:(id)a3
{
  id v4;

  -[CUIKUndoableEditor _openEditingContextForObjects:](self, "_openEditingContextForObjects:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteAllObjects");
  -[CUIKEditingManager closeEditingContext:](self->_editingManager, "closeEditingContext:", v4);

}

- (BOOL)eventUsesEditor:(id)a3
{
  return objc_msgSend(a3, "isIntegrationEvent") ^ 1;
}

- (BOOL)calendarUsesEditor:(id)a3
{
  return 1;
}

- (BOOL)sourceUsesEditor:(id)a3
{
  return 1;
}

- (BOOL)saveNewEvents:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  CUIKEditingManager *editingManager;
  id *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v27 = a5;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v14, "startDate", v27);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "nextRoundedHour");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setStartDate:", v16);

          }
          objc_msgSend(v14, "endDateUnadjustedForLegacyClients");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            objc_msgSend(v14, "startDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "dateByAddingHours:inCalendar:", 1, 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setEndDateUnadjustedForLegacyClients:", v19);

          }
          objc_msgSend(v14, "calendar");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
          {
            objc_msgSend(v14, "eventStore");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "acquireDefaultCalendarForNewEvents");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setCalendar:", v22);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
    }

    -[CUIKUndoableEditor _openEditingContextForObjects:](self, "_openEditingContextForObjects:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "addAllObjects"))
      v24 = objc_msgSend(v23, "savePartialChange");
    else
      v24 = 0;
    if (v27 && (v24 & 1) == 0)
    {
      objc_msgSend(v23, "error");
      *v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    editingManager = self->_editingManager;
    if (a4)
      -[CUIKEditingManager closeEditingContext:](editingManager, "closeEditingContext:", v23);
    else
      -[CUIKEditingManager closeEditingContextWithoutCommittingChanges:](editingManager, "closeEditingContextWithoutCommittingChanges:", v23);

  }
  else
  {
    v24 = 1;
  }

  return v24;
}

- (BOOL)saveEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  BOOL v13;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "isNew");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v12 = -[CUIKUndoableEditor saveNewEvents:commit:error:](self, "saveNewEvents:commit:error:", v11, 1, a5);
    else
      v12 = -[CUIKUndoableEditor _saveChangesToEvents:span:impliedCommitDecision:error:](self, "_saveChangesToEvents:span:impliedCommitDecision:error:", v11, a4, 0, a5);
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
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

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKUndoableEditor deleteEvents:span:](self, "deleteEvents:span:", v7, a4);

  return 1;
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4
{
  id v6;

  -[CUIKUndoableEditor _openEditingContextForObjects:](self, "_openEditingContextForObjects:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (a4 != -1)
    objc_msgSend(v6, "_specifySpanDecision:", +[CUIKEditingContext spanDecisionFromSpan:](CUIKEditingContext, "spanDecisionFromSpan:", a4));
  objc_msgSend(v6, "deleteAllObjects");
  -[CUIKEditingManager closeEditingContext:](self->_editingManager, "closeEditingContext:", v6);

}

- (void)deleteEvents:(id)a3 span:(int64_t)a4 result:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  -[CUIKUndoableEditor deleteEvents:span:](self, "deleteEvents:span:", a3, a4);
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
    v8 = v9;
  }

}

- (BOOL)saveCalendar:(id)a3 error:(id *)a4
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKUndoableEditor saveCalendars:](self, "saveCalendars:", v5);

  return 1;
}

- (void)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CUIKUndoableEditor deleteCalendars:](self, "deleteCalendars:", v5);

}

- (void)performWithOptions:(id)a3 block:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (CUIKDecisionDelegate)decisionDelegate
{
  return (CUIKDecisionDelegate *)objc_loadWeakRetained((id *)&self->_decisionDelegate);
}

- (void)setDecisionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_decisionDelegate, a3);
}

- (CUIKUndoDelegate)undoDelegate
{
  return (CUIKUndoDelegate *)objc_loadWeakRetained((id *)&self->_undoDelegate);
}

- (CUIKCommitDelegate)commitDelegate
{
  return (CUIKCommitDelegate *)objc_loadWeakRetained((id *)&self->_commitDelegate);
}

- (void)setCommitDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_commitDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commitDelegate);
  objc_destroyWeak((id *)&self->_undoDelegate);
  objc_destroyWeak((id *)&self->_decisionDelegate);
  objc_storeStrong((id *)&self->_editingManager, 0);
}

@end
