@implementation CUIKEditingContext

- (CUIKEditingContext)initWithObjects:(id)a3 interfaceType:(unint64_t)a4 observer:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  CUIKEditingContext *v11;
  void *v12;
  uint64_t v13;
  EKEventStore *eventStore;
  objc_super v16;
  uint8_t buf[4];
  CUIKEditingContext *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_debug_impl(&dword_1B8A6A000, v10, OS_LOG_TYPE_DEBUG, "Creating context %@ with objects %@ and observer %@", buf, 0x20u);
  }

  v16.receiver = self;
  v16.super_class = (Class)CUIKEditingContext;
  v11 = -[CUIKEditingContext init](&v16, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "eventStore");
    v13 = objc_claimAutoreleasedReturnValue();
    eventStore = v11->_eventStore;
    v11->_eventStore = (EKEventStore *)v13;

    -[CUIKEditingContext setObjectsBeingEdited:](v11, "setObjectsBeingEdited:", v8);
    -[CUIKEditingContext setInterfaceType:](v11, "setInterfaceType:", a4);
    -[CUIKEditingContext setObserver:](v11, "setObserver:", v9);
  }

  return v11;
}

- (NSArray)objectsBeingEdited
{
  return self->_objectsBeingEdited;
}

- (void)setObjectsBeingEdited:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_objectsBeingEdited, a3);
  v5 = a3;
  -[CUIKEditingContext addOriginalIdentifiersForObjectsBeingEdited:](self, "addOriginalIdentifiersForObjectsBeingEdited:", v5);

}

- (void)addOriginalIdentifiersForObjectsBeingEdited:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKEventStore uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:](self->_eventStore, "uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingContext originalIdentifiersForObjectsBeingEdited](self, "originalIdentifiersForObjectsBeingEdited");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CUIKEditingContext originalIdentifiersForObjectsBeingEdited](self, "originalIdentifiersForObjectsBeingEdited");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromSet:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKEditingContext setOriginalIdentifiersForObjectsBeingEdited:](self, "setOriginalIdentifiersForObjectsBeingEdited:", v8);

  }
  else
  {
    -[CUIKEditingContext setOriginalIdentifiersForObjectsBeingEdited:](self, "setOriginalIdentifiersForObjectsBeingEdited:", v5);
  }
  v9 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "eventOccurrenceID", (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  -[CUIKEditingContext originalEventOccurrenceIDsForObjectsBeingEdited](self, "originalEventOccurrenceIDsForObjectsBeingEdited");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CUIKEditingContext originalEventOccurrenceIDsForObjectsBeingEdited](self, "originalEventOccurrenceIDsForObjectsBeingEdited");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setByAddingObjectsFromSet:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKEditingContext setOriginalEventOccurrenceIDsForObjectsBeingEdited:](self, "setOriginalEventOccurrenceIDsForObjectsBeingEdited:", v19);

  }
  else
  {
    -[CUIKEditingContext setOriginalEventOccurrenceIDsForObjectsBeingEdited:](self, "setOriginalEventOccurrenceIDsForObjectsBeingEdited:", v9);
  }

}

- (id)_eventStore
{
  return self->_eventStore;
}

- (BOOL)_allObjectsAreItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)_allObjectsAreEvents
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)_allObjectsAreCalendars
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)addAllObjects
{
  NSObject *v3;
  void *v4;
  BOOL v5;

  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingContext addAllObjects].cold.1();

  -[CUIKEditingContext _markAsActive](self, "_markAsActive");
  +[CUIKUndoManager operationForAction:context:](CUIKUndoManager, "operationForAction:context:", 1, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CUIKEditingContext performUndoableOperation:](self, "performUndoableOperation:", v4);

  return v5;
}

- (BOOL)deleteAllObjects
{
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;

  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingContext deleteAllObjects].cold.2();

  if (-[CUIKEditingContext _requestSaveAndSpanDecisionIfNeededForAction:](self, "_requestSaveAndSpanDecisionIfNeededForAction:", 4)&& -[CUIKEditingContext _requestEarlyCommitDecisionAtSaveTimeForAction:](self, "_requestEarlyCommitDecisionAtSaveTimeForAction:", 4))
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CUIKEditingContext deleteAllObjects].cold.1();

    -[CUIKEditingContext _markAsActive](self, "_markAsActive");
    if (-[CUIKEditingContext _earlyCommitDecision](self, "_earlyCommitDecision") == 2)
      -[CUIKEditingContext _setAllObjectsToDontNotify](self, "_setAllObjectsToDontNotify");
    v5 = -[CUIKEditingContext _editingObjectsNeverCommitted](self, "_editingObjectsNeverCommitted");
    if (-[CUIKEditingContext _deleteIsUndoable](self, "_deleteIsUndoable"))
    {
      +[CUIKUndoManager operationForAction:context:](CUIKUndoManager, "operationForAction:context:", 4, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CUIKEditingContext performUndoableOperation:](self, "performUndoableOperation:", v6);

    }
    else
    {
      v7 = -[CUIKEditingContext _doManualDelete](self, "_doManualDelete");
    }
    if (v7 && v5)
    {
      -[CUIKEditingContext postLiveEditNotificationForEditedObjects](self, "postLiveEditNotificationForEditedObjects");
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)_editingObjectsNeverCommitted
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasEverBeenCommitted"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_deleteIsUndoable
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[CUIKEditingContext _allObjectsAreCalendars](self, "_allObjectsAreCalendars"))
    return 1;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isSubscribed") & 1) != 0)
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (BOOL)_doManualDelete
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  BOOL v19;
  void *v20;
  id obj;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = -[CUIKEditingContext _allObjectsAreCalendars](self, "_allObjectsAreCalendars");
  if (v3)
  {
    v19 = v3;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (!v4)
      goto LABEL_18;
    v5 = v4;
    v6 = *(_QWORD *)v26;
    v7 = 0x1E0C8F000uLL;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSubscribedHolidayCalendar"))
        {
          v10 = objc_alloc_init(*(Class *)(v7 + 696));
          objc_msgSend(MEMORY[0x1E0D0C310], "setHolidayCalendarIsEnabled:withAccountStore:", 0, v10);
        }
        else
        {
          if (!objc_msgSend(v9, "isSubscribed"))
            goto LABEL_16;
          objc_msgSend(v9, "subcalAccountID");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          v11 = objc_alloc_init(*(Class *)(v7 + 696));
          objc_msgSend(v11, "accountWithIdentifier:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v11;
            v14 = v5;
            v15 = v7;
            v16 = objc_msgSend(v13, "requestDaemonStopMonitoringAgents");

            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __37__CUIKEditingContext__doManualDelete__block_invoke;
            v22[3] = &unk_1E6EB6C18;
            v24 = v16;
            v7 = v15;
            v5 = v14;
            v11 = v20;
            v23 = v10;
            objc_msgSend(v20, "removeAccount:withCompletionHandler:", v12, v22);
            v17 = v23;
          }
          else
          {
            +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v30 = v10;
              _os_log_error_impl(&dword_1B8A6A000, v17, OS_LOG_TYPE_ERROR, "Can't find account with ID %{public}@ for calendar being removed", buf, 0xCu);
            }
          }

        }
LABEL_16:
        objc_msgSend(v9, "CUIKEditingContext_removeWithSpan:", 0);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (!v5)
      {
LABEL_18:

        LOBYTE(v3) = v19;
        return v3;
      }
    }
  }
  return v3;
}

void __37__CUIKEditingContext__doManualDelete__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestDaemonStartMonitoringAgentsWithToken:", *(_QWORD *)(a1 + 40));

  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __37__CUIKEditingContext__doManualDelete__block_invoke_cold_1(a1, v8, v9, v10, v11, v12, v13, v14);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __37__CUIKEditingContext__doManualDelete__block_invoke_cold_2(a1);
  }

}

- (BOOL)saveCompleteChangeWithImpliedCommitDecision:(id *)a3
{
  return -[CUIKEditingContext saveCompleteChangeWithImpliedCommitDecisionAndClose:error:](self, "saveCompleteChangeWithImpliedCommitDecisionAndClose:error:", 0, a3);
}

- (BOOL)saveCompleteChangeWithImpliedCommitDecisionAndClose:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;

  v5 = a3;
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingContext saveCompleteChangeWithImpliedCommitDecisionAndClose:error:].cold.1();

  -[CUIKEditingContext _specifyEarlyCommitDecision:](self, "_specifyEarlyCommitDecision:", 1);
  return -[CUIKEditingContext saveCompleteChangeAndClose:error:](self, "saveCompleteChangeAndClose:error:", v5, a4);
}

- (BOOL)saveCompleteChange
{
  return -[CUIKEditingContext saveCompleteChangeAndClose:error:](self, "saveCompleteChangeAndClose:error:", 0, 0);
}

- (BOOL)saveCompleteChange:(id *)a3
{
  return -[CUIKEditingContext saveCompleteChangeAndClose:error:](self, "saveCompleteChangeAndClose:error:", 0, a3);
}

- (BOOL)saveCompleteChangeAndClose:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  int v13;
  _BOOL4 v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;

  v5 = a3;
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingContext saveCompleteChangeAndClose:error:].cold.4();

  if (!-[CUIKEditingContext _hasChangesToSave](self, "_hasChangesToSave"))
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CUIKEditingContext saveCompleteChangeAndClose:error:].cold.3();
    v11 = 1;
    goto LABEL_34;
  }
  -[CUIKEditingContext _savePartialChangeAndPostNotification:](self, "_savePartialChangeAndPostNotification:", 0);
  v8 = -[CUIKEditingContext _hasChangesRequiringSpanAllAndSpanIsThis](self, "_hasChangesRequiringSpanAllAndSpanIsThis");
  if (v8)
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CUIKEditingContext saveCompleteChangeAndClose:error:].cold.1();

    -[CUIKEditingContext _unspecifySpanDecision](self, "_unspecifySpanDecision");
  }
  else if (-[CUIKEditingContext _shouldSilentlyTransitionToSpanAllAfterSave](self, "_shouldSilentlyTransitionToSpanAllAfterSave"))
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[CUIKEditingContext saveCompleteChangeAndClose:error:].cold.2();

    v13 = 1;
    goto LABEL_16;
  }
  v13 = 0;
LABEL_16:
  v14 = -[CUIKEditingContext _saveActionIsDecline](self, "_saveActionIsDecline");
  if (v14)
    v15 = 3;
  else
    v15 = 2;
  v16 = -[CUIKEditingContext _requestSaveAndSpanDecisionIfNeededForAction:](self, "_requestSaveAndSpanDecisionIfNeededForAction:", v15);
  if (v14 && v16)
    LOBYTE(v16) = -[CUIKEditingContext _requestEarlyCommitDecisionAtSaveTimeForAction:](self, "_requestEarlyCommitDecisionAtSaveTimeForAction:", 3);
  if (!v16)
  {
    -[CUIKEditingContext _cancelCurrentSave](self, "_cancelCurrentSave");
    v11 = 0;
    if (!v5)
      return v11;
    goto LABEL_35;
  }
  -[CUIKEditingContext _markAsActive](self, "_markAsActive");
  +[CUIKUndoManager operationForAction:context:](CUIKUndoManager, "operationForAction:context:", 2, self);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = -[CUIKEditingContext performUndoableOperation:](self, "performUndoableOperation:", v10);
  if (!v5)
    -[CUIKEditingContext postLiveEditNotificationForEditedObjects](self, "postLiveEditNotificationForEditedObjects");
  if (v8)
  {
    -[CUIKEditingContext _unspecifySpanDecision](self, "_unspecifySpanDecision");
  }
  else if (v13)
  {
    -[CUIKEditingContext _specifySpanDecision:](self, "_specifySpanDecision:", 2);
  }
  -[NSObject error](v10, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v17)
  {
    -[NSObject error](v10, "error");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_34:

  if (v5)
  {
LABEL_35:
    -[CUIKEditingContext editingManager](self, "editingManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "closeEditingContext:", self);

  }
  return v11;
}

- (BOOL)_hasChangesToSave
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        if ((v5 & 1) != 0)
        {
          v5 = 1;
          goto LABEL_12;
        }
        v5 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hasUnsavedChanges");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_12:

  return v5;
}

- (BOOL)_hasChangesRequiringSpanAllAndSpanIsThis
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[CUIKEditingContext _currentSpan](self, "_currentSpan"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v4);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "hasChangesRequiringSpanAll") & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_14;
          }
        }
        v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v3;
}

- (BOOL)_shouldSilentlyTransitionToSpanAllAfterSave
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[CUIKEditingContext _currentSpan](self, "_currentSpan"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v4);
          v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "recurrenceRuleString");
            v8 = objc_claimAutoreleasedReturnValue();
            if (v8)
            {
              v9 = (void *)v8;
              objc_msgSend(v7, "shallowCopyWithoutChanges");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "recurrenceRuleString");
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v11)
              {
                LOBYTE(v3) = 1;
                goto LABEL_15;
              }
            }
          }
        }
        v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_15:

  }
  return v3;
}

- (BOOL)_saveActionIsDecline
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CUIKEditingContext _diffSummarySinceLastSave](self, "_diffSummarySinceLastSave");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9F08]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "selfAttendee");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "participantStatus");

          if (v9 == 3)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        v4 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return (char)v4;
}

- (id)_diffSummarySinceLastSave
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_12;
        objc_msgSend(v9, "shallowCopyWithoutChanges");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

LABEL_12:
          v12 = 0;
          goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x1E0CAA0B8], "diffSummaryBetweenObject:andObject:", v10, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addEntriesFromDictionary:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }

  v12 = v3;
LABEL_13:

  return v12;
}

- (BOOL)_requestSaveAndSpanDecisionIfNeededForAction:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;

  -[CUIKEditingContext decisionDelegate](self, "decisionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CUIKEditingContext _diffSummarySinceLastSave](self, "_diffSummarySinceLastSave");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CUIKEditingContext _requestSaveAndSpanDecisionIfNeededForAction:].cold.1((uint64_t)self);

    if (-[CUIKEditingContext _requestSaveDecisionIfNeededForAction:diffSummary:delegate:](self, "_requestSaveDecisionIfNeededForAction:diffSummary:delegate:", a3, v6, v5))
    {
      v8 = -[CUIKEditingContext _requestSpanDecisionIfNeededForAction:diffSummary:delegate:](self, "_requestSpanDecisionIfNeededForAction:diffSummary:delegate:", a3, v6, v5);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_requestSaveDecisionIfNeededForAction:(unint64_t)a3 diffSummary:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  BOOL v12;
  NSObject *v13;

  v8 = a4;
  v9 = a5;
  if (-[CUIKEditingContext _allObjectsAreItems](self, "_allObjectsAreItems")
    && (-[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "shouldSaveForItems:forEditingAction:diffSummary:", v10, a3, v8),
        v10,
        (v11 & 1) == 0))
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CUIKEditingContext _requestSaveDecisionIfNeededForAction:diffSummary:delegate:].cold.1();

    v12 = 0;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)_requestSpanDecisionIfNeededForAction:(unint64_t)a3 diffSummary:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  BOOL v14;

  v8 = a4;
  v9 = a5;
  if (-[CUIKEditingContext _spanDecisionSpecified](self, "_spanDecisionSpecified")
    || !-[CUIKEditingContext _allObjectsAreEvents](self, "_allObjectsAreEvents"))
  {
LABEL_10:
    v14 = 1;
    goto LABEL_11;
  }
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "spanDecisionForEvents:forEditingAction:diffSummary:", v10, a3, v8);

  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11 != 4)
  {
    if (v13)
      -[CUIKEditingContext _requestSpanDecisionIfNeededForAction:diffSummary:delegate:].cold.2();

    -[CUIKEditingContext _specifySpanDecision:](self, "_specifySpanDecision:", v11);
    goto LABEL_10;
  }
  if (v13)
    -[CUIKEditingContext _requestSaveDecisionIfNeededForAction:diffSummary:delegate:].cold.1();

  v14 = 0;
LABEL_11:

  return v14;
}

- (void)_cancelCurrentSave
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: cancelling current save", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_clearLiveChanges
{
  void *v3;
  void *v4;

  -[CUIKEditingContext editingManager](self, "editingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearLiveChangesForObjects:", v4);

  -[CUIKEditingContext postLiveEditNotificationForEditedObjects](self, "postLiveEditNotificationForEditedObjects");
}

- (BOOL)_requestEarlyCommitDecisionAtSaveTimeForAction:(unint64_t)a3
{
  unint64_t v4;
  NSObject *v5;

  v4 = -[CUIKEditingContext _requestCommitDecisionIfNeededForAction:](self, "_requestCommitDecisionIfNeededForAction:", a3);
  if (v4 == 4)
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CUIKEditingContext _requestEarlyCommitDecisionAtSaveTimeForAction:].cold.1();

  }
  else
  {
    -[CUIKEditingContext _specifyEarlyCommitDecision:](self, "_specifyEarlyCommitDecision:", v4);
  }
  return v4 != 4;
}

- (unint64_t)_requestCommitDecisionIfNeededForAction:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  unint64_t v11;

  v5 = -[CUIKEditingContext _earlyCommitDecision](self, "_earlyCommitDecision");
  -[CUIKEditingContext decisionDelegate](self, "decisionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (-[CUIKEditingContext _allObjectsAreItems](self, "_allObjectsAreItems")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "editingContext:commitDecisionForItems:forEditingAction:userImpliedDecision:withSpanDecision:", self, v7, a3, v5 != 0, -[CUIKEditingContext _currentSpanDecision](self, "_currentSpanDecision"));
LABEL_8:
      v5 = v8;

      goto LABEL_9;
    }
    if (-[CUIKEditingContext _allObjectsAreCalendars](self, "_allObjectsAreCalendars")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "commitDecisionForCalendars:forEditingAction:", v7, a3);
      goto LABEL_8;
    }
  }
LABEL_9:
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingContext _requestCommitDecisionIfNeededForAction:].cold.1();

  v10 = -[CUIKEditingContext _earlyCommitDecision](self, "_earlyCommitDecision");
  if (v5 <= v10)
    v11 = v10;
  else
    v11 = v5;

  return v11;
}

- (unint64_t)_currentSpanDecision
{
  void *v3;
  unint64_t v4;

  if (!-[CUIKEditingContext _spanDecisionSpecified](self, "_spanDecisionSpecified"))
    return 0;
  -[CUIKEditingContext group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "spanDecisionForGroup");

  return v4;
}

- (int64_t)_currentSpan
{
  return objc_msgSend((id)objc_opt_class(), "spanFromSpanDecision:", -[CUIKEditingContext _currentSpanDecision](self, "_currentSpanDecision"));
}

- (BOOL)_spanDecisionSpecified
{
  void *v2;
  char v3;

  -[CUIKEditingContext group](self, "group");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "spanDecisionForGroupIsSet");

  return v3;
}

- (void)_specifySpanDecision:(unint64_t)a3
{
  id v4;

  -[CUIKEditingContext group](self, "group");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specifySpanDecisionForGroup:", a3);

}

- (void)_unspecifySpanDecision
{
  id v2;

  -[CUIKEditingContext group](self, "group");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unspecifySpanDecisionForGroup");

}

- (unint64_t)_earlyCommitDecision
{
  void *v3;
  unint64_t v4;

  if (!-[CUIKEditingContext _earlyCommitDecisionSpecified](self, "_earlyCommitDecisionSpecified"))
    return 0;
  -[CUIKEditingContext group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "earlyCommitDecisionForGroup");

  return v4;
}

- (BOOL)_earlyCommitDecisionSpecified
{
  void *v2;
  char v3;
  NSObject *v4;

  -[CUIKEditingContext group](self, "group");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "earlyCommitDecisionForGroupIsSet");

  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingContext _earlyCommitDecisionSpecified].cold.1();

  return v3;
}

- (void)_specifyEarlyCommitDecision:(unint64_t)a3
{
  NSObject *v5;
  void *v6;

  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingContext _specifyEarlyCommitDecision:].cold.1();

  -[CUIKEditingContext group](self, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specifyEarlyCommitDecisionForGroup:", a3);

}

- (void)_unspecifyEarlyCommitDecision
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: unspecifying early commit decision", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_markAsActive
{
  -[CUIKEditingContext setIsActive:](self, "setIsActive:", 1);
}

- (void)_markAsInactive
{
  -[CUIKEditingContext setIsActive:](self, "setIsActive:", 0);
}

- (void)_markAsOpen
{
  -[CUIKEditingContext setIsOpen:](self, "setIsOpen:", 1);
}

- (void)_markAsClosed
{
  -[CUIKEditingContext setIsOpen:](self, "setIsOpen:", 0);
}

- (void)_setAllObjectsToDontNotify
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: Setting objects to dontNotify", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)_savePartialChangeAndPostNotification:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v14 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
        }
        -[CUIKEditingContext _markAsActive](self, "_markAsActive");
        -[CUIKEditingContext editingManager](self, "editingManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "partialSaveObject:", v10);

        objc_msgSend(v10, "specificIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[CUIKEditingContext trackedObjectsDidUpdate:](self, "trackedObjectsDidUpdate:", v4);
  -[CUIKEditingContext notifyObservers](self, "notifyObservers");
  if (v14)
    -[CUIKEditingContext postLiveEditNotificationForEditedObjects](self, "postLiveEditNotificationForEditedObjects");

  return 1;
}

- (BOOL)savePartialChange
{
  return -[CUIKEditingContext _savePartialChangeAndPostNotification:](self, "_savePartialChangeAndPostNotification:", 1);
}

- (void)postLiveEditNotificationForEditedObjects
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingContext changeUserInfoForObjects:](self, "changeUserInfoForObjects:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingContext _eventStore](self, "_eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("CUIKLiveEditNotification"), v5, v6);
  else
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("CUIKLiveEditNotification"), v5);

}

+ (void)postLiveEditNotificationForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v10 = CFSTR("CUIKLiveEditNotificationModifiedObjectUniqueIdentifiersUserInfoKey");
    v11 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("CUIKLiveEditNotification"), v9, v7);

}

- (id)changeUserInfoForObjects:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[EKEventStore uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:](self->_eventStore, "uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingContext originalIdentifiersForObjectsBeingEdited](self, "originalIdentifiersForObjectsBeingEdited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CUIKEditingContext originalIdentifiersForObjectsBeingEdited](self, "originalIdentifiersForObjectsBeingEdited");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setByAddingObjectsFromSet:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  if (objc_msgSend(v4, "count"))
  {
    v8 = (void *)MEMORY[0x1E0C99E08];
    v12 = CFSTR("CUIKLiveEditNotificationModifiedObjectUniqueIdentifiersUserInfoKey");
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)hide
{
  void *v3;
  void *v4;

  -[CUIKEditingContext editingManager](self, "editingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hide:", v4);

  -[CUIKEditingContext postLiveEditNotificationForEditedObjects](self, "postLiveEditNotificationForEditedObjects");
}

- (void)unhide
{
  void *v3;
  void *v4;

  -[CUIKEditingContext editingManager](self, "editingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unhide:", v4);

  -[CUIKEditingContext postLiveEditNotificationForEditedObjects](self, "postLiveEditNotificationForEditedObjects");
}

- (void)revert
{
  -[CUIKEditingContext revert:](self, "revert:", 1);
}

- (void)_revert
{
  -[CUIKEditingContext revert:](self, "revert:", 0);
}

- (void)revert:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;

  v3 = a3;
  +[CUIKUndoManager operationForAction:context:](CUIKUndoManager, "operationForAction:context:", 5, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CUIKEditingContext revert:].cold.1();

    -[CUIKEditingContext performUndoableOperation:](self, "performUndoableOperation:", v5);
  }
  else
  {
    -[CUIKEditingContext undoDelegate](self, "undoDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executeWithUndoDelegate:", v7);

  }
  -[CUIKEditingContext _clearLiveChanges](self, "_clearLiveChanges");
  -[CUIKEditingContext _unspecifyEarlyCommitDecision](self, "_unspecifyEarlyCommitDecision");
  -[CUIKEditingContext _cancelCurrentSave](self, "_cancelCurrentSave");

}

- (void)createAutoBugCapture
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0C230]), "initWithType:subtype:context:", CFSTR("EditingContext"), CFSTR("UnexpectedDiff"), 0);
  v23 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0x1E0CAA000uLL;
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "diffFromCommitted");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "result"))
          {
            objc_msgSend(v9, "exportToICSWithOptions:", 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB820]), "initWithData:options:error:", v25, 0, 0);
            objc_msgSend(v11, "ICSStringWithOptions:", 0);
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = (void *)v12;
            if (v12)
              v14 = (const __CFString *)v12;
            else
              v14 = &stru_1E6EBAE30;
            v30[0] = CFSTR("ICS");
            v30[1] = CFSTR("Diff");
            v31[0] = v14;
            objc_msgSend(v10, "summaryString", v22);
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v15)
              v17 = (const __CFString *)v15;
            else
              v17 = &stru_1E6EBAE30;
            v31[1] = v17;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
            v18 = v4;
            v19 = v6;
            v20 = v5;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v21);

            v5 = v20;
            v6 = v19;
            v4 = v18;

          }
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v4);
  }

  objc_msgSend(v22, "setEvents:", v23);
  objc_msgSend(v22, "report");

}

- (BOOL)_prepareForCommitWithDecision:(unint64_t)a3 shouldClose:(BOOL *)a4
{
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  void *v27;
  void *v28;

  if (a4)
    *a4 = 1;
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.8();

  if (-[CUIKEditingContext _earlyCommitDecision](self, "_earlyCommitDecision") == 4)
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.2();

    -[CUIKEditingContext _revert](self, "_revert");
LABEL_9:
    v9 = 0;
    if (!a4)
      goto LABEL_56;
LABEL_53:
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.1();

    goto LABEL_56;
  }
  v10 = -[CUIKEditingContext _earlyCommitDecision](self, "_earlyCommitDecision");
  if (v10 <= a3)
    v11 = a3;
  else
    v11 = v10;
  -[CUIKEditingContext _specifyEarlyCommitDecision:](self, "_specifyEarlyCommitDecision:", v11);
  v12 = -[CUIKEditingContext _actionToCommit](self, "_actionToCommit");
  if (-[CUIKEditingContext _allObjectsAreEvents](self, "_allObjectsAreEvents") && v12)
  {
    switch(-[CUIKEditingContext _requestCommitDecisionIfNeededForAction:](self, "_requestCommitDecisionIfNeededForAction:", v12))
    {
      case 2uLL:
        +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.7();

        if (a4)
          *a4 = 1;
        if (v12 == 2)
          -[CUIKEditingContext _setAllObjectsToDontNotify](self, "_setAllObjectsToDontNotify");
        v14 = 0;
        goto LABEL_48;
      case 4uLL:
        +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.4();

        -[CUIKEditingContext _revert](self, "_revert");
        if (!a4)
          goto LABEL_47;
        -[CUIKEditingContext commitDelegate](self, "commitDelegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_45;
        -[CUIKEditingContext commitDelegate](self, "commitDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "contextShouldStayOpenWhenCommitIsCanceled");
        goto LABEL_34;
      case 5uLL:
        +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.5();

        -[CUIKEditingContext _revert](self, "_revert");
        if (!a4)
          goto LABEL_47;
        -[CUIKEditingContext commitDelegate](self, "commitDelegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[CUIKEditingContext commitDelegate](self, "commitDelegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "contextShouldStayOpenWhenCommitIsReverted");
LABEL_34:
          *a4 = v18 ^ 1;

        }
        else
        {
LABEL_45:
          *a4 = 1;
        }

LABEL_47:
        v14 = 1;
LABEL_48:
        if (-[CUIKEditingContext _actionToCommit](self, "_actionToCommit"))
        {
          -[CUIKEditingContext createAutoBugCapture](self, "createAutoBugCapture");
          if (a4)
          {
            v9 = 1;
            *a4 = 1;
            return v9;
          }
        }
        if ((v14 & 1) == 0)
          break;
        goto LABEL_9;
      case 6uLL:
        +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.6();

        if (a4)
          *a4 = 1;
        -[CUIKEditingContext deleteAllObjects](self, "deleteAllObjects");
        break;
      case 7uLL:
        +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[CUIKEditingContext _prepareForCommitWithDecision:shouldClose:].cold.3();

        if (a4)
        {
          -[CUIKEditingContext commitDelegate](self, "commitDelegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            -[CUIKEditingContext commitDelegate](self, "commitDelegate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = objc_msgSend(v23, "contextShouldStayOpenWhenCommitIsDeferred") ^ 1;

          }
          else
          {
            *a4 = 1;
          }

        }
        -[CUIKEditingContext commitDelegate](self, "commitDelegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKEditingContext originalEventOccurrenceIDsForObjectsBeingEdited](self, "originalEventOccurrenceIDsForObjectsBeingEdited");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "commitDeferredForObjects:originalIdentifiers:", v27, v28);

        goto LABEL_9;
      default:
        break;
    }
  }
  -[CUIKEditingContext _markAsInactive](self, "_markAsInactive");
  v9 = 1;
  if (a4)
    goto LABEL_53;
LABEL_56:
  -[CUIKEditingContext _unspecifyEarlyCommitDecision](self, "_unspecifyEarlyCommitDecision");
  return v9;
}

- (unint64_t)_actionToCommit
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isDeleted") & 1) != 0)
        {
          v5 = 4;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 = objc_msgSend(v8, "isDifferentFromCommitted");
          else
            v9 = objc_msgSend(v8, "hasChanges");
          if (v9)
            v5 = 2;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)performUndoableOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CUIKEditingContext editingManager](self, "editingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearLiveChangesForObjects:", v6);

  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingContext performUndoableOperation:].cold.1((uint64_t)self);

  -[CUIKEditingContext undoDelegate](self, "undoDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "executeWithUndoDelegate:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v4, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKEditingContext setError:](self, "setError:", v10);

  }
  -[CUIKEditingContext undoDelegate](self, "undoDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleUndoForOperation:", v4);

  return v9;
}

- (BOOL)shouldResetUndoStack
{
  return 0;
}

- (BOOL)hasUpdatePriority
{
  return 1;
}

- (id)trackedObjects
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!-[CUIKEditingContext isOpen](self, "isOpen"))
    goto LABEL_20;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "specificIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CUIKEditingContext group](self, "group", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trackedObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        objc_msgSend(v18, "specificIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "containsObject:", v19) & 1) == 0)
          objc_msgSend(v3, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v15);
  }

  v20 = objc_msgSend(v3, "count");
  if (!v20)
  {

LABEL_20:
    v3 = 0;
  }
  return v3;
}

- (void)trackedObjectsDidUpdate:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  CUIKEditingContext *v35;
  id obj;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];
  _BYTE v48[128];
  _QWORD v49[2];
  _QWORD v50[2];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingContext trackedObjectsDidUpdate:].cold.1(v4);

  if (-[CUIKEditingContext isOpen](self, "isOpen"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v35 = self;
    -[CUIKEditingContext objectsBeingEdited](self, "objectsBeingEdited");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v44 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v11;
            objc_msgSend(v12, "specificIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
              goto LABEL_11;
            -[CUIKEditingContext group](v35, "group");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "specificIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v19, "newIdentifierForIdentifier:", v20);

            if (!v21)
              goto LABEL_15;
            objc_msgSend(v38, "objectForKeyedSubscript:", v21);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
LABEL_11:
              objc_msgSend(v37, "addObject:", v14);
              objc_msgSend(v14, "specificIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v15);

              v16 = v14;
              v17 = v16;
            }
            else
            {
LABEL_15:
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v16 = (id)objc_claimAutoreleasedReturnValue();
              v17 = 0;
            }
            v50[0] = v12;
            v50[1] = v16;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v22);

          }
          else
          {
            v49[0] = v11;
            v49[1] = v11;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v18);

            objc_msgSend(v37, "addObject:", v11);
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v8);
    }

    -[CUIKEditingContext setObjectsBeingEdited:](v35, "setObjectsBeingEdited:", v37);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[CUIKEditingContext group](v35, "group");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trackedObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v40 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v30, "specificIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v5, "containsObject:", v31) & 1) == 0)
          {
            objc_msgSend(v38, "objectForKeyedSubscript:", v31);
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = (void *)v32;
            if (v32)
            {
              v47[0] = v30;
              v47[1] = v32;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "addObject:", v34);

            }
          }

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v27);
    }

    -[CUIKEditingContext setPendingObserverUpdates:](v35, "setPendingObserverUpdates:", v6);
    -[CUIKEditingContext setPendingGroupUpdates:](v35, "setPendingGroupUpdates:", v23);

  }
}

- (void)notifyObservers
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD block[5];
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[CUIKEditingContext pendingObserverUpdates](self, "pendingObserverUpdates");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v37 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
        {

          v9 = 0;
        }
        if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0
          || (-[CUIKEditingContext observer](self, "observer"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v12, "isTestObserver"),
              v12,
              v13))
        {
          -[CUIKEditingContext observer](self, "observer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (id)objc_msgSend(v14, "oldObject:didUpdateTo:", v8, v9);

        }
        else
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __37__CUIKEditingContext_notifyObservers__block_invoke;
          block[3] = &unk_1E6EB61C0;
          block[4] = self;
          v34 = v8;
          v35 = v9;
          dispatch_async(MEMORY[0x1E0C80D38], block);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v4);
  }

  -[CUIKEditingContext setPendingObserverUpdates:](self, "setPendingObserverUpdates:", 0);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[CUIKEditingContext pendingGroupUpdates](self, "pendingGroupUpdates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (v25)
        {

          v23 = 0;
        }
        -[CUIKEditingContext group](self, "group");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v26, "oldObject:didUpdateTo:", v22, v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    }
    while (v18);
  }

  -[CUIKEditingContext setPendingGroupUpdates:](self, "setPendingGroupUpdates:", 0);
}

void __37__CUIKEditingContext_notifyObservers__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "oldObject:didUpdateTo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)trackedObjectsDidRevert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[CUIKEditingContext group](self, "group");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "originalObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:copyItems:", v5, 1);
  -[CUIKEditingContext setObjectsBeingEdited:](self, "setObjectsBeingEdited:", v6);

}

+ (int64_t)spanFromSpanDecision:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return qword_1B8BA4780[a3 - 1];
}

+ (unint64_t)spanDecisionFromSpan:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 4;
  else
    return qword_1B8BA4798[a3];
}

- (CUIKEditingContextGroup)group
{
  return (CUIKEditingContextGroup *)objc_loadWeakRetained((id *)&self->_group);
}

- (void)setGroup:(id)a3
{
  objc_storeWeak((id *)&self->_group, a3);
}

- (CUIKEditingManager)editingManager
{
  return (CUIKEditingManager *)objc_loadWeakRetained((id *)&self->_editingManager);
}

- (void)setEditingManager:(id)a3
{
  objc_storeWeak((id *)&self->_editingManager, a3);
}

- (unint64_t)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(unint64_t)a3
{
  self->_interfaceType = a3;
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

- (void)setUndoDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_undoDelegate, a3);
}

- (CUIKCommitDelegate)commitDelegate
{
  return (CUIKCommitDelegate *)objc_loadWeakRetained((id *)&self->_commitDelegate);
}

- (void)setCommitDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_commitDelegate, a3);
}

- (CUIKEditingContextObserver)observer
{
  return (CUIKEditingContextObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_isOpen = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 88, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSSet)originalIdentifiersForObjectsBeingEdited
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setOriginalIdentifiersForObjectsBeingEdited:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSSet)originalEventOccurrenceIDsForObjectsBeingEdited
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOriginalEventOccurrenceIDsForObjectsBeingEdited:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSArray)pendingObserverUpdates
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPendingObserverUpdates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSArray)pendingGroupUpdates
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPendingGroupUpdates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingGroupUpdates, 0);
  objc_storeStrong((id *)&self->_pendingObserverUpdates, 0);
  objc_storeStrong((id *)&self->_originalEventOccurrenceIDsForObjectsBeingEdited, 0);
  objc_storeStrong((id *)&self->_originalIdentifiersForObjectsBeingEdited, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_commitDelegate);
  objc_destroyWeak((id *)&self->_undoDelegate);
  objc_destroyWeak((id *)&self->_decisionDelegate);
  objc_destroyWeak((id *)&self->_editingManager);
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_objectsBeingEdited, 0);
}

- (void)addAllObjects
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: addAllObjects", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deleteAllObjects
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: deleteAllObjects", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __37__CUIKEditingContext__doManualDelete__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, a2, a3, "Successfully removed subscribed calendar account %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __37__CUIKEditingContext__doManualDelete__block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_1B8A6A000, v1, v2, "Error removing account %{public}@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)saveCompleteChangeWithImpliedCommitDecisionAndClose:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: Saving+Committing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveCompleteChangeAndClose:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: has changes requiring span to go from this-->all now", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveCompleteChangeAndClose:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: has changes requiring span to go from this-->all after save", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveCompleteChangeAndClose:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: No changes to save", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveCompleteChangeAndClose:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: saveCompleteChange", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_requestSaveAndSpanDecisionIfNeededForAction:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_1B8A6A000, v1, v2, "Context %@: has diff summary %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_requestSaveDecisionIfNeededForAction:diffSummary:delegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: decided not to save", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_requestSpanDecisionIfNeededForAction:diffSummary:delegate:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_1B8A6A000, v0, v1, "Context %@: chose span %lu");
  OUTLINED_FUNCTION_2();
}

- (void)_requestEarlyCommitDecisionAtSaveTimeForAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: decided not to commit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_requestCommitDecisionIfNeededForAction:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_1B8A6A000, v0, v1, "Context %@: commit decision is %lu");
  OUTLINED_FUNCTION_2();
}

- (void)_earlyCommitDecisionSpecified
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_1B8A6A000, v0, v1, "Context %@: has an early commit decision specified? %d");
  OUTLINED_FUNCTION_2();
}

- (void)_specifyEarlyCommitDecision:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_1B8A6A000, v0, v1, "Context %@: specifying early commit decision %lu");
  OUTLINED_FUNCTION_2();
}

- (void)revert:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: undoable revert", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_1B8A6A000, v0, v1, "Context %@: close context? %d");
  OUTLINED_FUNCTION_2();
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: aborting and reverting commit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: continuing to edit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: cancelled commit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: reverting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: deleting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, v0, v1, "Context %@: committing without notifying", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_prepareForCommitWithDecision:shouldClose:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_1B8A6A000, v0, v1, "Context %@: preparing to commit (%lu)");
  OUTLINED_FUNCTION_2();
}

- (void)performUndoableOperation:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_1B8A6A000, v1, v2, "Context %@ performing operation %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)trackedObjectsDidUpdate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B8A6A000, log, OS_LOG_TYPE_DEBUG, "Context received trackedObjectsDidUpdate", v1, 2u);
}

@end
