@implementation SGRemindersAdapter

- (SGRemindersAdapter)initWithSGSqlEntityStore:(id)a3
{
  id v4;
  void *v5;
  SGRemindersAdapter *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[SGRemindersAdapter initWithSGSqlEntityStore:andREMStore:](self, "initWithSGSqlEntityStore:andREMStore:", v4, v5);

  return v6;
}

- (SGRemindersAdapter)initWithSGSqlEntityStore:(id)a3 andREMStore:(id)a4
{
  id v6;
  id v7;
  SGRemindersAdapter *v8;
  SGRemindersAdapter *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SGRemindersAdapter;
  v8 = -[SGRemindersAdapter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_store, v6);
    objc_storeStrong((id *)&v9->_reminderStore, a4);
  }

  return v9;
}

- (void)addReminder:(id)a3
{
  id v4;
  SGRemindersAdapter *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  +[SGSuggestHistory sharedSuggestHistory](SGSuggestHistory, "sharedSuggestHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isValidNewReminder:", v4);

  if (!v7)
  {
    sgRemindersLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_INFO, "Reminder is not a valid new one, already exists in SGSuggestHistory", (uint8_t *)&v18, 2u);
    }
    goto LABEL_21;
  }
  objc_msgSend(v4, "dueDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "dueDateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SGReminderDissector isReminderDueDateComponentsInPast:givenReferenceDate:allDay:](SGReminderDissector, "isReminderDueDateComponentsInPast:givenReferenceDate:allDay:", v9, v10, objc_msgSend(v4, "isAllDay")))
    {
      v11 = objc_msgSend(MEMORY[0x1E0D198F0], "showPastEvents");

      if ((v11 & 1) == 0)
      {
        sgRemindersLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v18) = 0;
          v13 = "SGRemindersAdapter: Not adding reminder that has dueDate in the past";
LABEL_16:
          _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v18, 2u);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
    }
    else
    {

    }
  }
  -[SGRemindersAdapter _remRemindersAssociatedWithStorageReminder:remStore:](v5, "_remRemindersAssociatedWithStorageReminder:remStore:", v4, v5->_reminderStore);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    sgRemindersLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      v13 = "SGRemindersAdapter: PseudoReminder found in Found in Apps list, not adding";
      goto LABEL_16;
    }
LABEL_21:

    goto LABEL_22;
  }
  if (objc_msgSend((id)objc_opt_class(), "reminderHasDuplicate:usingStore:", v4, v5->_reminderStore))
  {
    sgRemindersLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      v13 = "SGRemindersAdapter: Duplicate found in user defined list, not adding";
      goto LABEL_16;
    }
    goto LABEL_21;
  }
  sgRemindersLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "recordId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v17;
    _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Adding Reminder with recordId: %@", (uint8_t *)&v18, 0xCu);

  }
  if (-[SGRemindersAdapter _saveReminder:usingReminderStore:](v5, "_saveReminder:usingReminderStore:", v4, v5->_reminderStore))
  {
    +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject logReminderInteractionFromReminder:interface:actionType:](v12, "logReminderInteractionFromReminder:interface:actionType:", v4, 0, 1);
    goto LABEL_21;
  }
LABEL_22:
  objc_sync_exit(v5);

}

- (void)confirmReminderFromThisDevice:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  sgRemindersLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Confirming reminder", v6, 2u);
  }

  -[SGRemindersAdapter rejectReminderFromThisDevice:](self, "rejectReminderFromThisDevice:", v4);
}

- (void)rejectReminderFromThisDevice:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  sgRemindersLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Rejecting reminder", v6, 2u);
  }

  -[SGRemindersAdapter rejectReminder:](self, "rejectReminder:", v4);
}

- (void)reminderAlarmTriggeredFromThisDevice:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v4 = a3;
  sgRemindersLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "SGRemindersAdapter: alarm triggered from this device", buf, 2u);
  }

  if ((objc_msgSend(v4, "isAllDay") & 1) != 0)
  {
    sgRemindersLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Not removing reminder since it's an allDay reminder", v7, 2u);
    }

  }
  else
  {
    -[SGRemindersAdapter rejectReminder:](self, "rejectReminder:", v4);
  }

}

- (void)confirmReminderFromOtherDevice:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  sgRemindersLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Confirming reminder from other device", v6, 2u);
  }

  -[SGRemindersAdapter rejectReminder:](self, "rejectReminder:", v4);
}

- (void)rejectReminderFromOtherDevice:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  sgRemindersLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Rejecting reminder from other device", v6, 2u);
  }

  -[SGRemindersAdapter rejectReminder:](self, "rejectReminder:", v4);
}

- (void)orphanReminder:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  sgRemindersLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Removing pseudo reminder because of parent deletion", v6, 2u);
  }

  -[SGRemindersAdapter rejectReminder:](self, "rejectReminder:", v4);
}

- (void)rejectReminder:(id)a3
{
  id v4;
  SGRemindersAdapter *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SGRemindersAdapter _remRemindersAssociatedWithStorageReminder:remStore:](v5, "_remRemindersAssociatedWithStorageReminder:remStore:", v4, v5->_reminderStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v7 = objc_claimAutoreleasedReturnValue();
      -[SGRemindersAdapter _deleteReminder:usingReminderStore:](v5, "_deleteReminder:usingReminderStore:", v7, v5->_reminderStore);
    }
    else
    {
      sgRemindersLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v8 = 0;
        _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "Didn't find any REMReminders to reject", v8, 2u);
      }
    }
  }
  else
  {
    sgRemindersLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "Multiple reminders linked to one storage reminder", buf, 2u);
    }
  }

  objc_sync_exit(v5);
}

- (id)sourceUniqueIdentifierForStorageReminder:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SGMessageKey *v7;
  void *v8;

  objc_msgSend(a3, "duplicateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[SGMessageKey initWithSerialized:]([SGMessageKey alloc], "initWithSerialized:", v6);
    -[SGMessageKey uniqueIdentifier](v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_saveReminder:(id)a3 usingReminderStore:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  char v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint8_t buf[4];
  NSObject *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_remindersFoundInAppsListInREMStore:", self->_reminderStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D84650]), "initWithStore:", self->_reminderStore);
    objc_msgSend(v7, "updateList:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)v8;
    objc_msgSend(v7, "addReminderWithTitle:toListChangeItem:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0D19930]);
    objc_msgSend(v5, "recordId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGRemindersAdapter sourceUniqueIdentifierForStorageReminder:](self, "sourceUniqueIdentifierForStorageReminder:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithRecordId:sourceUniqueIdentifier:", v12, v13);

    v50 = 0;
    v47 = (void *)v14;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v50);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v50;
    v46 = (void *)v15;
    if (v15)
    {
      objc_msgSend(v10, "setSiriFoundInAppsData:", v15);
    }
    else
    {
      sgRemindersLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v16;
        _os_log_error_impl(&dword_1C3607000, v19, OS_LOG_TYPE_ERROR, "Unable to serialize ReminderMetadata: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v5, "dueDateComponents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = objc_alloc(MEMORY[0x1E0D84470]);
      objc_msgSend(v5, "dueDateComponents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithDateComponents:", v22);

      v24 = (id)objc_msgSend(v10, "addAlarmWithTrigger:", v23);
      objc_msgSend(v5, "dueDateComponents");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDueDateComponents:", v25);

    }
    objc_msgSend(v5, "dueLocation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = objc_alloc(MEMORY[0x1E0D846C8]);
      objc_msgSend(v5, "dueLocation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "label");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v27, "initWithTitle:", v29);

      objc_msgSend(v5, "dueLocation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "latitude");
      objc_msgSend(v30, "setLatitude:");

      objc_msgSend(v5, "dueLocation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "longitude");
      objc_msgSend(v30, "setLongitude:");

      objc_msgSend(v5, "dueLocation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "accuracy");
      objc_msgSend(v30, "setRadius:");

      v34 = objc_msgSend(v5, "dueLocationTrigger");
      if (v34 == 1)
        v35 = 1;
      else
        v35 = 2 * (v34 == 2);
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D84478]), "initWithStructuredLocation:proximity:", v30, v35);
      v37 = (id)objc_msgSend(v10, "addAlarmWithTrigger:", v36);

    }
    objc_msgSend((id)objc_opt_class(), "constructNotesForReminder:", v5);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v38);
      objc_msgSend(v10, "setNotes:", v39);

    }
    objc_msgSend(v5, "origin");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "universalURL");
    v41 = objc_claimAutoreleasedReturnValue();

    sgRemindersLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v41;
      _os_log_impl(&dword_1C3607000, v42, OS_LOG_TYPE_INFO, "Saving Reminder with universal link: %@", buf, 0xCu);
    }

    if (v41)
    {
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D84748]), "initWithUniversalLink:", v41);
      objc_msgSend(v10, "setUserActivity:", v43);

    }
    v49 = 0;
    v18 = objc_msgSend(v7, "saveSynchronouslyWithError:", &v49);
    v17 = v49;
    if ((v18 & 1) == 0)
    {
      sgRemindersLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v17;
        _os_log_error_impl(&dword_1C3607000, v44, OS_LOG_TYPE_ERROR, "Unable to save reminder in ReminderKit error: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    sgRemindersLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v17, OS_LOG_TYPE_ERROR, "Unable to load RemindersFoundInApps list", buf, 2u);
    }
    v18 = 0;
  }

  return v18;
}

- (BOOL)_deleteReminder:(id)a3 usingReminderStore:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D84650];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithStore:", v6);
  objc_msgSend((id)objc_opt_class(), "_remindersFoundInAppsListInREMStore:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v8, "updateList:", v9);
  objc_msgSend(v8, "updateReminder:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "removeFromList");
  v16 = 0;
  v12 = objc_msgSend(v8, "saveSynchronouslyWithError:", &v16);
  v13 = v16;
  if ((v12 & 1) == 0)
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_error_impl(&dword_1C3607000, v14, OS_LOG_TYPE_ERROR, "Unable to delete reminder in ReminderKit error: %@", buf, 0xCu);
    }

  }
  return v12;
}

- (id)_remRemindersAssociatedWithStorageReminder:(id)a3 remStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRemindersAdapter sourceUniqueIdentifierForStorageReminder:](self, "sourceUniqueIdentifierForStorageReminder:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGRemindersAdapter _remRemindersAssociatedWithTitle:sourceUniqueIdentifier:usingStore:](self, "_remRemindersAssociatedWithTitle:sourceUniqueIdentifier:usingStore:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_remRemindersAssociatedWithTitle:(id)a3 sourceUniqueIdentifier:(id)a4 usingStore:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id obj;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v30 = a4;
  v7 = a5;
  v31 = (id)objc_opt_new();
  v29 = v7;
  objc_msgSend((id)objc_opt_class(), "_remindersFoundInAppsListInREMStore:", v7);
  v39 = 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "fetchRemindersWithError:", &v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v39;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    v12 = 0x1E0CB3000uLL;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v13);
        v15 = *(void **)(v12 + 1808);
        v16 = objc_opt_class();
        objc_msgSend(v14, "siriFoundInAppsData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        objc_msgSend(v15, "unarchivedObjectOfClass:fromData:error:", v16, v17, &v34);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v34;

        if (v18)
        {
          objc_msgSend(v14, "title");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "string");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v33, "isEqualToString:", v21))
          {

          }
          else
          {
            objc_msgSend(v18, "sourceUniqueIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v30, "isEqualToString:", v23);

            v12 = 0x1E0CB3000;
            if (!v24)
              goto LABEL_14;
          }
          objc_msgSend(v31, "addObject:", v14);
        }
        else
        {
          sgRemindersLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "objectID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v41 = v25;
            v42 = 2112;
            v43 = v19;
            _os_log_error_impl(&dword_1C3607000, v22, OS_LOG_TYPE_ERROR, "Unable to load metadata from reminder with id: %@ error: %@", buf, 0x16u);

            v12 = 0x1E0CB3000;
          }

        }
LABEL_14:

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v10);
  }

  return v31;
}

- (SGSqlEntityStore)store
{
  return (SGSqlEntityStore *)objc_loadWeakRetained((id *)&self->_store);
}

- (void)setStore:(id)a3
{
  objc_storeWeak((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_reminderStore, 0);
}

+ (id)_remindersFoundInAppsListInREMStore:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  objc_msgSend(a3, "fetchSiriFoundInAppsListWithError:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (!v3)
  {
    sgRemindersLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "Unable to retrieve found in apps list: %@", buf, 0xCu);
    }

  }
  return v3;
}

+ (id)reminderPredicateForReminder:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_msgSend(v28, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGReminderMessage searchTokensForReminderTitle:](SGReminderMessage, "searchTokensForReminderTitle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D84638], "predicateDescriptorForRemindersWithCompleted:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0D84638], "predicateDescriptorForRemindersWithTitleContains:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D84638];
        v35[0] = v6;
        v35[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "andPredicateDescriptorWithDescriptors:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v14);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v8);
  }

  objc_msgSend(v28, "dueDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0D84638];
    objc_msgSend(v28, "dueDateComponents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dueDateComponents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicateDescriptorForRemindersWithDueDateBetween:and:", v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0D84638];
    v34[0] = v6;
    v34[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "andPredicateDescriptorWithDescriptors:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v25);
  }
  objc_msgSend(MEMORY[0x1E0D84638], "orPredicateDescriptorWithDescriptors:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (BOOL)reminderHasDuplicate:(id)a3 usingStore:(id)a4
{
  id v6;
  id v7;
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
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  BOOL v34;
  NSObject *v35;
  const char *v36;
  id v38;
  void *v39;
  id v40;
  id obj;
  uint8_t buf[16];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
    v7 = (id)objc_opt_new();
  objc_msgSend(a1, "reminderPredicateForReminder:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v7, "fetchRemindersMatchingPredicateDescriptor:sortDescriptors:options:error:", v8, 0, 0, &v47);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v47;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v11)
  {
    v12 = v11;
    v38 = v10;
    v39 = v8;
    v40 = v7;
    v13 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1C3BD4F6C]();
        if ((objc_msgSend(v15, "isCompleted") & 1) == 0)
        {
          objc_msgSend(v15, "title");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "string");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "title");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if (v20)
          {
            sgRemindersLogHandle();
            v35 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
LABEL_22:
              v8 = v39;
              v7 = v40;
              v10 = v38;

              objc_autoreleasePoolPop(v16);
              v34 = 1;
              goto LABEL_23;
            }
            *(_WORD *)buf = 0;
            v36 = "SGRemindersAdapter: Duplicate reminder found based on exact title match";
LABEL_25:
            _os_log_debug_impl(&dword_1C3607000, v35, OS_LOG_TYPE_DEBUG, v36, buf, 2u);
            goto LABEL_22;
          }
          objc_msgSend(v15, "dueDateComponents");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "dueDateComponents");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqual:", v22);

          if (v23)
          {
            objc_msgSend(v6, "title");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "title");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "string");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = +[SGLevenshtein distanceBetweenStrings:and:](SGLevenshtein, "distanceBetweenStrings:and:", v24, v26);

            objc_msgSend(v6, "title");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "length");

            objc_msgSend(v15, "title");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "string");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "length");

            v33 = v29 <= v32 ? v32 : v29;
            if ((double)v27 / (double)v33 < 0.5)
            {
              sgRemindersLogHandle();
              v35 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                goto LABEL_22;
              *(_WORD *)buf = 0;
              v36 = "SGRemindersAdapter: Duplicate reminder found based on dueDate and edit distance of title";
              goto LABEL_25;
            }
          }
        }
        objc_autoreleasePoolPop(v16);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v12)
        continue;
      break;
    }
    v34 = 0;
    v8 = v39;
    v7 = v40;
    v10 = v38;
  }
  else
  {
    v34 = 0;
  }
LABEL_23:

  return v34;
}

+ (unint64_t)remindersCreatedBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__SGRemindersAdapter_remindersCreatedBetweenStartDate_endDate___block_invoke;
  v12[3] = &unk_1E7DA9F38;
  v8 = v5;
  v13 = v8;
  v9 = v6;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v7, "enumerateAllRemindersWithBlock:", v12);
  v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (id)constructNotesForReminder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedApplicationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  +[SGContactsInterface unifiedContactWithIdentifier:keysToFetch:usingContactStore:error:](SGContactsInterface, "unifiedContactWithIdentifier:keysToFetch:usingContactStore:error:", v7, v9, v6, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;

  if (v10
    && (objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v10, 1000),
        (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    +[SGFoundInAppsStrings foundInAppsStringLongVersionForAppName:contactName:](SGFoundInAppsStrings, "foundInAppsStringLongVersionForAppName:contactName:", v5, v12);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v14;
  }
  else
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "loggingIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2114;
      v22 = v11;
      _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEFAULT, "SGRemindersAdapter - [SGStorageReminder (%{public}@)] constructNotesForReminder: Unable to fetch contact: %{public}@", buf, 0x16u);

    }
    v15 = 0;
  }

  return v15;
}

void __63__SGRemindersAdapter_remindersCreatedBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  if (v7 >= v8)
  {
    objc_msgSend(v14, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
    v13 = v12;

    if (v11 <= v13)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  else
  {

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 0x33uLL)
    *a3 = 1;

}

@end
