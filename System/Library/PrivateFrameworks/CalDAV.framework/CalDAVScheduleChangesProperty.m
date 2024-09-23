@implementation CalDAVScheduleChangesProperty

- (CalDAVScheduleChangesProperty)init
{
  CalDAVScheduleChangesProperty *v2;
  CalDAVScheduleChangesProperty *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CalDAVScheduleChangesProperty;
  v2 = -[CalDAVScheduleChangesProperty init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CalDAVScheduleChangesProperty setActionType:](v2, "setActionType:", 0);
    -[CalDAVScheduleChangesProperty setDateStamp:](v3, "setDateStamp:", 0);
    -[CalDAVScheduleChangesProperty setAttendeeAddress:](v3, "setAttendeeAddress:", 0);
    -[CalDAVScheduleChangesProperty setMasterChange:](v3, "setMasterChange:", 0);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVScheduleChangesProperty setOccurrenceChanges:](v3, "setOccurrenceChanges:", v4);

  }
  return v3;
}

+ (id)debugStringForType:(int)a3
{
  if ((a3 - 1) > 3)
    return CFSTR("UNKNOWN");
  else
    return off_24C1FB740[a3 - 1];
}

- (BOOL)isCancel
{
  return -[CalDAVScheduleChangesProperty actionType](self, "actionType") == 3;
}

- (BOOL)isReply
{
  return -[CalDAVScheduleChangesProperty actionType](self, "actionType") == 4;
}

- (BOOL)isUpdate
{
  return -[CalDAVScheduleChangesProperty actionType](self, "actionType") == 2;
}

- (BOOL)isCreate
{
  return -[CalDAVScheduleChangesProperty actionType](self, "actionType") == 1;
}

+ (id)propertyWithItem:(id)a3
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "dtstamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "payloadAsString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
      objc_msgSend(v4, "setDateStamp:", v6);
    objc_msgSend(v3, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "create");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "setActionType:", 1);
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v7, "cancel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "setActionType:", 3);
      objc_msgSend(v7, "cancel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "reply");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v4, "setActionType:", 4);
        objc_msgSend(v7, "reply");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "attendee");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "payloadAsString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "trimWhiteSpace");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setAttendeeAddress:", v15);

        objc_msgSend(v7, "reply");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v7, "update");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_22;
        objc_msgSend(v4, "setActionType:", 2);
        objc_msgSend(v7, "update");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v17 = v10;
    objc_msgSend(v10, "recurrences");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v27 != v22)
              objc_enumerationMutation(v19);
            +[CalDAVOccurrenceChange changeWithItem:](CalDAVOccurrenceChange, "changeWithItem:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), (_QWORD)v26);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addOccurrenceChange:", v24);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v21);
      }

    }
    goto LABEL_22;
  }
  v4 = 0;
LABEL_23:

  return v4;
}

- (void)addOccurrenceChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isMaster"))
    {
      -[CalDAVScheduleChangesProperty masterChange](self, "masterChange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        scheduleChangesLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[CalDAVScheduleChangesProperty addOccurrenceChange:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

      }
      -[CalDAVScheduleChangesProperty setMasterChange:](self, "setMasterChange:", v5);
    }
    else
    {
      objc_msgSend(v5, "recurrenceID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ICSStringWithOptions:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[CalDAVScheduleChangesProperty occurrenceChanges](self, "occurrenceChanges");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v5, v16);

    }
  }

}

- (NSArray)recurrenceIDs
{
  void *v2;
  void *v3;
  void *v4;

  -[CalDAVScheduleChangesProperty occurrenceChanges](self, "occurrenceChanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByApplyingSelector:", sel_recurrenceID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)changeForOccurrence:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(a3, "ICSStringWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVScheduleChangesProperty occurrenceChanges](self, "occurrenceChanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CalDAVScheduleChangesProperty masterChange](self, "masterChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSString)dateStamp
{
  return self->_dateStamp;
}

- (void)setDateStamp:(id)a3
{
  objc_storeStrong((id *)&self->_dateStamp, a3);
}

- (int)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int)a3
{
  self->_actionType = a3;
}

- (NSString)attendeeAddress
{
  return self->_attendeeAddress;
}

- (void)setAttendeeAddress:(id)a3
{
  objc_storeStrong((id *)&self->_attendeeAddress, a3);
}

- (CalDAVOccurrenceChange)masterChange
{
  return self->_masterChange;
}

- (void)setMasterChange:(id)a3
{
  objc_storeStrong((id *)&self->_masterChange, a3);
}

- (NSMutableDictionary)occurrenceChanges
{
  return self->_occurrenceChanges;
}

- (void)setOccurrenceChanges:(id)a3
{
  objc_storeStrong((id *)&self->_occurrenceChanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceChanges, 0);
  objc_storeStrong((id *)&self->_masterChange, 0);
  objc_storeStrong((id *)&self->_attendeeAddress, 0);
  objc_storeStrong((id *)&self->_dateStamp, 0);
}

- (void)addOccurrenceChange:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2096EB000, a1, a3, "Error: schedule changes message from server contains multiple master events - picking one at random...", a5, a6, a7, a8, 0);
}

@end
