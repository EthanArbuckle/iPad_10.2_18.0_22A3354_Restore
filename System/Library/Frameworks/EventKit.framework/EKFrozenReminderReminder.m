@implementation EKFrozenReminderReminder

- (id)initNewReminderInStore:(id)a3
{
  id v4;
  EKChangeSet *v5;
  void *v6;
  void *v7;
  void *v8;
  EKFrozenReminderReminder *v9;
  objc_super v11;

  v4 = a3;
  v5 = objc_alloc_init(EKChangeSet);
  -[EKChangeSet setSkipsPersistentObjectCopy:](v5, "setSkipsPersistentObjectCopy:", 1);
  v6 = (void *)objc_msgSend(getREMReminderClass(), "newObjectID");
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v5, "changeSingleValue:forKey:basedOn:", v8, CFSTR("UUID"), 0);

  v11.receiver = self;
  v11.super_class = (Class)EKFrozenReminderReminder;
  v9 = -[EKFrozenReminderObject initWithREMObject:inStore:withChanges:](&v11, sel_initWithREMObject_inStore_withChanges_, 0, v4, v5);

  return v9;
}

- (id)_reminder
{
  return self->super._remObject;
}

- (id)remObjectID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EKFrozenReminderReminder _reminder](self, "_reminder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKFrozenReminderReminder _reminder](self, "_reminder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKFrozenReminderReminder calendarItemIdentifier](self, "calendarItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
    objc_msgSend(getREMReminderClass(), "objectIDWithUUID:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_applyChanges:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *WeakRetained;
  void *v13;
  int v14;
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
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  objc_class *v49;
  id *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  BOOL v64;
  EKFrozenReminderReminder *v66;
  id *obj;
  id obja;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  void *v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("unlocalizedTitle")))
  {
    -[EKChangeSet valueForSingleValueKey:basedOn:](self->super._changeSet, "valueForSingleValueKey:basedOn:", CFSTR("unlocalizedTitle"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitleAsString:", v7);

  }
  if (!-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("calendar")))
    goto LABEL_13;
  -[EKFrozenReminderReminder _reminder](self, "_reminder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "list");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKChangeSet valueForSingleValueKey:basedOn:](self->super._changeSet, "valueForSingleValueKey:basedOn:", CFSTR("calendar"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_10;
  objc_msgSend(v9, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "type") != 3 && objc_msgSend(v11, "type") != 4)
  {
    objc_msgSend(v10, "_account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqual:", v13);

    if (!v14)
      goto LABEL_8;
LABEL_10:
    objc_msgSend(v6, "removeFromList");
    objc_msgSend(v6, "saveRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateListWithSaveRequest:error:", v15, a4);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    if (!WeakRetained)
    {

      v64 = 0;
      goto LABEL_78;
    }
    objc_msgSend(WeakRetained, "addReminderChangeItem:", v6);
    goto LABEL_12;
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)&self->super._reminderStore);
  objc_msgSend(WeakRetained, "_reminderCopiedToNewList:", self);
LABEL_12:

LABEL_13:
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("creationDate")))
  {
    -[EKChangeSet valueForSingleValueKey:basedOn:](self->super._changeSet, "valueForSingleValueKey:basedOn:", CFSTR("creationDate"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCreationDate:", v16);

  }
  -[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("structuredLocationWithoutPrediction"));
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("notes")))
  {
    -[EKChangeSet valueForSingleValueKey:basedOn:](self->super._changeSet, "valueForSingleValueKey:basedOn:", CFSTR("notes"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNotesAsString:", v17);

  }
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("URLString")))
  {
    -[EKChangeSet valueForSingleValueKey:basedOn:](self->super._changeSet, "valueForSingleValueKey:basedOn:", CFSTR("URLString"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v6, "setIcsUrl:", v19);

  }
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("startDateComponents")))
  {
    -[EKFrozenReminderReminder startDateComponents](self, "startDateComponents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStartDateComponents:", v20);

  }
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("dueDateComponents")))
  {
    -[EKFrozenReminderReminder dueDateComponents](self, "dueDateComponents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeZone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      objc_msgSend(v21, "setCalendar:", 0);
    -[EKFrozenReminderReminder dueDateComponents](self, "dueDateComponents");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDueDateComponents:", v23);

  }
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("completionDate")))
  {
    -[EKFrozenReminderReminder completionDate](self, "completionDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompleted:", v24 != 0);
    objc_msgSend(v6, "setCompletionDate:", v24);

  }
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("priority")))
    objc_msgSend(v6, "setPriority:", -[EKFrozenReminderReminder priority](self, "priority"));
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("uniqueID")))
  {
    -[EKFrozenReminderReminder calendarItemExternalIdentifier](self, "calendarItemExternalIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDaCalendarItemUniqueIdentifier:", v25);

  }
  if (-[EKChangeSet hasUnsavedMultiValueRemovalForKey:](self->super._changeSet, "hasUnsavedMultiValueRemovalForKey:", CFSTR("allAlarmsSet")))
  {
    obj = a4;
    -[EKChangeSet multiValueRemovals](self->super._changeSet, "multiValueRemovals");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("allAlarmsSet"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v83 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          objc_msgSend(v33, "alarms");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v79;
            do
            {
              for (j = 0; j != v36; ++j)
              {
                if (*(_QWORD *)v79 != v37)
                  objc_enumerationMutation(v34);
                objc_msgSend(v6, "removeAlarm:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j));
              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
            }
            while (v36);
          }

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
      }
      while (v30);
    }

    a4 = obj;
  }
  if (-[EKChangeSet hasUnsavedMultiValueAdditionForKey:](self->super._changeSet, "hasUnsavedMultiValueAdditionForKey:", CFSTR("allAlarmsSet")))
  {
    -[EKChangeSet multiValueAdditions](self->super._changeSet, "multiValueAdditions");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("allAlarmsSet"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = self;
    if (objc_msgSend(v40, "count"))
    {
      -[EKFrozenReminderReminder remObjectID](self, "remObjectID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v42 = 0;
    }
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    obja = v40;
    v43 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v75 != v45)
            objc_enumerationMutation(obja);
          v47 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (objc_class *)objc_opt_class();
            NSStringFromClass(v49);
            v50 = a4;
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, v66, CFSTR("EKFrozenReminderReminder.m"), 198, CFSTR("frozen alarm is of the wrong class: %@"), v51);

            a4 = v50;
          }
          objc_msgSend(v47, "setPath:", v42);
          objc_msgSend(v47, "_applyChanges:error:", v6, a4);
        }
        v44 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
      }
      while (v44);
    }

    self = v66;
  }
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("recurrenceRulesSet")))
  {
    objc_msgSend(v6, "removeAllRecurrenceRules");
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    -[EKFrozenReminderReminder recurrenceRulesSet](self, "recurrenceRulesSet");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v71;
      do
      {
        for (m = 0; m != v54; ++m)
        {
          if (*(_QWORD *)v71 != v55)
            objc_enumerationMutation(v52);
          v57 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * m), "addUpdatedRecurrenceRule:", v6);
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
      }
      while (v54);
    }

  }
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("appLinkData")))
  {
    -[EKFrozenReminderReminder appLinkData](self, "appLinkData");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(objc_alloc((Class)getREMUserActivityClass()), "initWithUserActivityData:", v58);
    objc_msgSend(v6, "setUserActivity:", v59);

  }
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("actionString")))
  {
    v60 = (void *)MEMORY[0x1E0C99E98];
    -[EKFrozenReminderReminder actionString](self, "actionString");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "URLWithString:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = (void *)objc_msgSend(objc_alloc((Class)getREMUserActivityClass()), "initWithUniversalLink:", v62);
    objc_msgSend(v6, "setUserActivity:", v63);

  }
  v64 = 1;
LABEL_78:

  return v64;
}

- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;

  v6 = a3;
  -[EKFrozenReminderReminder _reminder](self, "_reminder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKFrozenReminderObject isNew](self, "isNew"))
  {
    -[EKFrozenReminderReminder calendar](self, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateListWithSaveRequest:error:", v6, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v17 = 0;
      goto LABEL_9;
    }
    v10 = (void *)v9;
    -[EKFrozenReminderReminder unlocalizedTitle](self, "unlocalizedTitle");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = &stru_1E4789A58;
    if (v11)
      v13 = (__CFString *)v11;
    v14 = v13;

    -[EKFrozenReminderReminder remObjectID](self, "remObjectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addReminderWithTitle:toListChangeItem:reminderObjectID:", v14, v10, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v16;
  }
  else
  {
    objc_msgSend(v6, "updateReminder:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = -[EKFrozenReminderReminder _applyChanges:error:](self, "_applyChanges:error:", v8, a4);
LABEL_9:

  return v17;
}

- (id)_copyToNewList:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  -[EKFrozenReminderReminder _reminder](self, "_reminder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateReminder:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKChangeSet valueForSingleValueKey:basedOn:](self->super._changeSet, "valueForSingleValueKey:basedOn:", CFSTR("calendar"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateListWithSaveRequest:error:", v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v11 = (void *)getREMReminderChangeItemClass_softClass;
    v22 = getREMReminderChangeItemClass_softClass;
    if (!getREMReminderChangeItemClass_softClass)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __getREMReminderChangeItemClass_block_invoke;
      v18[3] = &unk_1E4784C68;
      v18[4] = &v19;
      __getREMReminderChangeItemClass_block_invoke((uint64_t)v18);
      v11 = (void *)v20[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v19, 8);
    v13 = (void *)objc_msgSend([v12 alloc], "initWithReminderChangeItem:insertIntoListChangeItem:", v8, v10);
    objc_msgSend(v6, "_trackReminderChangeItem:", v13);
    -[EKFrozenReminderReminder _fixAlarmUUIDsForClone:from:](self, "_fixAlarmUUIDsForClone:from:", v13, v8);
    objc_msgSend(v8, "removeFromList");
    objc_msgSend(v13, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_fixAlarmUUIDsForClone:(id)a3 from:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void (**v28)(_QWORD, _QWORD);
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id obj;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "alarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v5;
  objc_msgSend(v5, "alarms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v54 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        +[EKFrozenReminderAlarm semanticIdentifierFromREMAlarm:](EKFrozenReminderAlarm, "semanticIdentifierFromREMAlarm:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);
        }
        objc_msgSend(v13, "alarmUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v16);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v10);
  }

  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v40 = v7;
  v17 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v50 != v19)
          objc_enumerationMutation(v40);
        v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        +[EKFrozenReminderAlarm semanticIdentifierFromREMAlarm:](EKFrozenReminderAlarm, "semanticIdentifierFromREMAlarm:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "alarmUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v25, v24);
          if ((unint64_t)objc_msgSend(v23, "count") >= 2)
            objc_msgSend(v23, "removeObjectAtIndex:", 0);
        }
        else
        {
          +[EKReminderStore log](EKReminderStore, "log");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v59 = v22;
            _os_log_error_impl(&dword_1A2318000, v26, OS_LOG_TYPE_ERROR, "Couldn't find old alarm matching semantic ID %@; if it existed it will be disconnected from any extant EKObject instances",
              buf,
              0xCu);
          }

        }
      }
      v18 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v18);
  }

  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __56__EKFrozenReminderReminder__fixAlarmUUIDsForClone_from___block_invoke;
  v47[3] = &unk_1E4784CB8;
  v27 = v42;
  v48 = v27;
  v28 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v47);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v29 = v40;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v44 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
        objc_msgSend(v34, "alarmUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v28)[2](v28, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setAlarmUID:", v36);

        objc_msgSend(v34, "originalAlarmUID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v28)[2](v28, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setOriginalAlarmUID:", v38);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    }
    while (v31);
  }

}

id __56__EKFrozenReminderReminder__fixAlarmUUIDsForClone_from___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  v7 = v6;

  return v7;
}

- (id)calendarItemIdentifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__EKFrozenReminderReminder_calendarItemIdentifier__block_invoke;
  v3[3] = &unk_1E4784C18;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("UUID"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __50__EKFrozenReminderReminder_calendarItemIdentifier__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)calendar
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__EKFrozenReminderReminder_calendar__block_invoke;
  v3[3] = &unk_1E4784C40;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("calendar"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __36__EKFrozenReminderReminder_calendar__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "list");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(WeakRetained, "frozenObjectForReminderObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)calendarItemExternalIdentifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__EKFrozenReminderReminder_calendarItemExternalIdentifier__block_invoke;
  v3[3] = &unk_1E4784C18;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("uniqueID"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __58__EKFrozenReminderReminder_calendarItemExternalIdentifier__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "daCalendarItemUniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)unlocalizedTitle
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__EKFrozenReminderReminder_unlocalizedTitle__block_invoke;
  v3[3] = &unk_1E4784C18;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("unlocalizedTitle"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__EKFrozenReminderReminder_unlocalizedTitle__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "titleAsString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)structuredLocation
{
  return -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("structuredLocationWithoutPrediction"), &__block_literal_global_1);
}

uint64_t __46__EKFrozenReminderReminder_structuredLocation__block_invoke()
{
  return 0;
}

- (id)notes
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__EKFrozenReminderReminder_notes__block_invoke;
  v3[3] = &unk_1E4784C18;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("notes"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __33__EKFrozenReminderReminder_notes__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notesAsString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)URLString
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__EKFrozenReminderReminder_URLString__block_invoke;
  v3[3] = &unk_1E4784C18;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("URLString"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __37__EKFrozenReminderReminder_URLString__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "icsUrl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastModifiedDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__EKFrozenReminderReminder_lastModifiedDate__block_invoke;
  v3[3] = &unk_1E4784D00;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("lastModifiedDate"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__EKFrozenReminderReminder_lastModifiedDate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)creationDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__EKFrozenReminderReminder_creationDate__block_invoke;
  v3[3] = &unk_1E4784D00;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("creationDate"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __40__EKFrozenReminderReminder_creationDate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "creationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)alarms
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id WeakRetained;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  id v34;
  void *v35;
  EKChangeSet *changeSet;
  id v37;
  void *v38;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  -[EKFrozenReminderReminder _reminder](self, "_reminder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alarms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v55 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v10, "alarmUID");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
          v12 = (__CFString *)v11;
        else
          v12 = &stru_1E4789A58;
        objc_msgSend(v10, "alarmUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v12);
        }
        objc_msgSend(v14, "addObject:", v10);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(obj, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(obj, "count"))
  {
    -[EKFrozenReminderReminder remObjectID](self, "remObjectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v19)
  {
    v20 = v19;
    v45 = *(_QWORD *)v51;
    v40 = v18;
    do
    {
      v21 = 0;
      v41 = v20;
      do
      {
        if (*(_QWORD *)v51 != v45)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v21);
        objc_msgSend(v18, "objectForKeyedSubscript:", v22, v40);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "length"))
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->super._reminderStore);
          v25 = v23;
          v26 = WeakRetained;
          v27 = v25;
          objc_msgSend(WeakRetained, "frozenAlarmForREMAlarms:");
          v28 = (id)objc_claimAutoreleasedReturnValue();

          if (v17)
            objc_msgSend(v28, "setPath:", v17);
          objc_msgSend(v15, "addObject:", v28);
        }
        else
        {
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v44 = v23;
          v28 = v23;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
          if (v29)
          {
            v30 = v29;
            v42 = v21;
            v31 = *(_QWORD *)v47;
            do
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v47 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
                v34 = objc_loadWeakRetained((id *)&self->super._reminderStore);
                objc_msgSend(v34, "frozenObjectForReminderObject:", v33);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (v17)
                  objc_msgSend(v35, "setPath:", v17);
                objc_msgSend(v15, "addObject:", v35);

              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            }
            while (v30);
            v18 = v40;
            v20 = v41;
            v21 = v42;
          }
          v27 = v44;
        }

        ++v21;
      }
      while (v21 != v20);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v20);
  }

  changeSet = self->super._changeSet;
  if (changeSet)
  {
    -[EKChangeSet valuesForMultiValueKey:basedOnSet:](changeSet, "valuesForMultiValueKey:basedOnSet:", CFSTR("allAlarmsSet"), v15);
    v37 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = v15;
  }
  v38 = v37;

  return v38;
}

- (id)startDateComponents
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__EKFrozenReminderReminder_startDateComponents__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("startDateComponents"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __47__EKFrozenReminderReminder_startDateComponents__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startDateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v3);

  return v2;
}

- (id)dueDateComponents
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__EKFrozenReminderReminder_dueDateComponents__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("dueDateComponents"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __45__EKFrozenReminderReminder_dueDateComponents__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dueDateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v3);

  return v2;
}

- (id)timeZone
{
  return 0;
}

- (id)completionDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__EKFrozenReminderReminder_completionDate__block_invoke;
  v3[3] = &unk_1E4784D00;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("completionDate"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __42__EKFrozenReminderReminder_completionDate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completionDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (unint64_t)priority
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__EKFrozenReminderReminder_priority__block_invoke;
  v5[3] = &unk_1E4784D28;
  v5[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("priority"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

id __36__EKFrozenReminderReminder_priority__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithUnsignedInteger:", objc_msgSend(v2, "priority"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appLinkData
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__EKFrozenReminderReminder_appLinkData__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("appLinkData"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __39__EKFrozenReminderReminder_appLinkData__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "userActivityData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)actionString
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__EKFrozenReminderReminder_actionString__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("actionString"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __40__EKFrozenReminderReminder_actionString__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_reminder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "universalLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasRecurrenceRules
{
  void *v2;
  BOOL v3;

  -[EKFrozenReminderReminder recurrenceRulesSet](self, "recurrenceRulesSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasAttendees
{
  return 0;
}

- (BOOL)hasNotes
{
  void *v2;
  BOOL v3;

  -[EKFrozenReminderReminder notes](self, "notes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)attendeesRaw
{
  return 0;
}

- (id)recurrenceRulesSet
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  EKFrozenReminderRecurrenceRule *v11;
  id WeakRetained;
  EKFrozenReminderRecurrenceRule *v13;
  EKChangeSet *changeSet;
  id v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[EKFrozenReminderReminder _reminder](self, "_reminder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recurrenceRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = [EKFrozenReminderRecurrenceRule alloc];
        WeakRetained = objc_loadWeakRetained((id *)&self->super._reminderStore);
        v13 = -[EKFrozenReminderRecurrenceRule initWithREMObject:inStore:](v11, "initWithREMObject:inStore:", v10, WeakRetained);

        objc_msgSend(v5, "addObject:", v13);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  changeSet = self->super._changeSet;
  if (changeSet)
  {
    -[EKChangeSet valuesForMultiValueKey:basedOnSet:](changeSet, "valuesForMultiValueKey:basedOnSet:", CFSTR("recurrenceRulesSet"), v5);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v5;
  }
  v16 = v15;

  return v16;
}

- (id)clientLocation
{
  return 0;
}

- (id)organizer
{
  return 0;
}

- (id)selfAttendee
{
  return 0;
}

- (id)originalItem
{
  return 0;
}

- (id)travelStartLocation
{
  return 0;
}

- (id)attachmentsSet
{
  return 0;
}

- (id)detachedItems
{
  return 0;
}

- (id)ekExceptionDates
{
  return 0;
}

- (id)syncError
{
  return 0;
}

- (BOOL)defaultAlarmRemoved
{
  return 0;
}

- (BOOL)defaultAlarmWasDeleted
{
  return 0;
}

@end
