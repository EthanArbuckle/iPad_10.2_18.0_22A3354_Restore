@implementation CalDAVOccurrenceChange

- (CalDAVOccurrenceChange)init
{
  CalDAVOccurrenceChange *v2;
  CalDAVOccurrenceChange *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CalDAVOccurrenceChange;
  v2 = -[CalDAVOccurrenceChange init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CalDAVOccurrenceChange setIsMaster:](v2, "setIsMaster:", 0);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVOccurrenceChange setChanges:](v3, "setChanges:", v4);

  }
  return v3;
}

- (CalDAVOccurrenceChange)initWithOccurrenceID:(id)a3
{
  id v4;
  CalDAVOccurrenceChange *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[CalDAVOccurrenceChange init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "length"))
    {
      v6 = objc_alloc(MEMORY[0x24BEC6F98]);
      objc_msgSend(MEMORY[0x24BEC6FB0], "dateFromICSString:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithValue:", v7);
      -[CalDAVOccurrenceChange setRecurrenceID:](v5, "setRecurrenceID:", v8);

    }
    else
    {
      -[CalDAVOccurrenceChange setIsMaster:](v5, "setIsMaster:", 1);
    }
  }

  return v5;
}

+ (id)changeWithOccurrenceID:(id)a3
{
  id v3;
  CalDAVOccurrenceChange *v4;

  v3 = a3;
  v4 = -[CalDAVOccurrenceChange initWithOccurrenceID:]([CalDAVOccurrenceChange alloc], "initWithOccurrenceID:", v3);

  return v4;
}

+ (id)changeWithItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSObject *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  NSObject *obj;
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

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((objc_msgSend(v3, "isMaster") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "recurrenceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "payloadAsString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trimWhiteSpace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend(v3, "isMaster") & 1) != 0 || objc_msgSend(v4, "length"))
  {
    v33 = v4;
    if (objc_msgSend(v3, "isMaster"))
      v7 = 0;
    else
      v7 = v4;
    +[CalDAVOccurrenceChange changeWithOccurrenceID:](CalDAVOccurrenceChange, "changeWithOccurrenceID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    scheduleChangesLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[CalDAVOccurrenceChange changeWithItem:].cold.1(v8, v9);

    v34 = v3;
    objc_msgSend(v3, "changes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "changedProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v11;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v41 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v16, "nameAttribute");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addChangedProperty:", v17);
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          objc_msgSend(v16, "changedParameters");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v37;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v37 != v21)
                  objc_enumerationMutation(v18);
                objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "nameAttribute");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addChangedParameter:ofProperty:", v23, v17);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v20);
          }

        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v13);
    }
    v24 = obj;

    v4 = v33;
    v3 = v34;
  }
  else
  {
    scheduleChangesLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[CalDAVOccurrenceChange changeWithItem:].cold.2(v24, v26, v27, v28, v29, v30, v31, v32);
    v8 = 0;
  }

  return v8;
}

- (void)addChangedProperty:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length") && !-[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", v4))
  {
    scheduleChangesLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CalDAVOccurrenceChange addChangedProperty:].cold.1((uint64_t)v4, v5, v6);

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVOccurrenceChange changes](self, "changes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v4);

  }
}

- (void)addChangedParameter:(id)a3 ofProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    -[CalDAVOccurrenceChange changes](self, "changes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9
      || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9 == v10))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVOccurrenceChange changes](self, "changes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v7);

    }
    else
    {
      objc_msgSend(v9, "addObject:", v6);
    }
    scheduleChangesLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CalDAVOccurrenceChange addChangedParameter:ofProperty:].cold.1((uint64_t)v6, (uint64_t)v7, v13);

  }
}

- (BOOL)didPropertyChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a3)
    return 0;
  v4 = a3;
  -[CalDAVOccurrenceChange changes](self, "changes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6 != 0;
  return v7;
}

- (BOOL)didParameterChange:(id)a3 onProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    -[CalDAVOccurrenceChange changes](self, "changes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = objc_msgSend(v9, "containsObject:", v6);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)dateTimeChanged
{
  return -[CalDAVOccurrenceChange startTimeChanged](self, "startTimeChanged")
      || -[CalDAVOccurrenceChange endTimeChanged](self, "endTimeChanged");
}

- (BOOL)startTimeChanged
{
  return -[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", *MEMORY[0x24BEC7030]);
}

- (BOOL)endTimeChanged
{
  return -[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", *MEMORY[0x24BEC7028]);
}

- (BOOL)timeZoneChanged
{
  uint64_t v3;

  v3 = *MEMORY[0x24BEC7068];
  return -[CalDAVOccurrenceChange didParameterChange:onProperty:](self, "didParameterChange:onProperty:", *MEMORY[0x24BEC7068], *MEMORY[0x24BEC7030])|| -[CalDAVOccurrenceChange didParameterChange:onProperty:](self, "didParameterChange:onProperty:", v3, *MEMORY[0x24BEC7028]);
}

- (BOOL)locationChanged
{
  return -[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", *MEMORY[0x24BEC7038]);
}

- (BOOL)urlChanged
{
  return -[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", *MEMORY[0x24BEC7070]);
}

- (BOOL)summaryChanged
{
  return -[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", *MEMORY[0x24BEC7060]);
}

- (BOOL)attendeesChanged
{
  return -[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", *MEMORY[0x24BEC7018]);
}

- (BOOL)descriptionChanged
{
  return -[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", *MEMORY[0x24BEC7020]);
}

- (BOOL)statusChanged
{
  return -[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", *MEMORY[0x24BEC7058]);
}

- (BOOL)attachmentsChanged
{
  return -[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", *MEMORY[0x24BEC7010]);
}

- (BOOL)recurrenceChanged
{
  return -[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", *MEMORY[0x24BEC7050]);
}

- (BOOL)participationChanged
{
  return -[CalDAVOccurrenceChange didParameterChange:onProperty:](self, "didParameterChange:onProperty:", *MEMORY[0x24BEC7040], *MEMORY[0x24BEC7018]);
}

- (BOOL)privateCommentChanged
{
  return -[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", *MEMORY[0x24BEC7000]);
}

- (BOOL)proposedStartDateChanged
{
  return -[CalDAVOccurrenceChange didParameterChange:onProperty:](self, "didParameterChange:onProperty:", *MEMORY[0x24BEC7008], *MEMORY[0x24BEC7018]);
}

- (BOOL)isMaster
{
  return self->_isMaster;
}

- (void)setIsMaster:(BOOL)a3
{
  self->_isMaster = a3;
}

- (ICSDate)recurrenceID
{
  return self->_recurrenceID;
}

- (void)setRecurrenceID:(id)a3
{
  objc_storeStrong((id *)&self->_recurrenceID, a3);
}

- (NSMutableDictionary)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
  objc_storeStrong((id *)&self->_changes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_recurrenceID, 0);
}

+ (void)changeWithItem:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  __CFString *v6;
  int v7;
  __CFString *v8;
  uint64_t v9;

  v3 = a1;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a1, "isMaster");
  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("MASTER");
  }
  else
  {
    objc_msgSend(v3, "recurrenceID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = 138412290;
  v8 = v6;
  OUTLINED_FUNCTION_1(&dword_2096EB000, a2, v4, ":: ------- %@", (uint8_t *)&v7);
  if (!v5)
  {

  }
}

+ (void)changeWithItem:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2096EB000, a1, a3, "invalid recurrence node - no master or recurrenceID specified", a5, a6, a7, a8, 0);
}

- (void)addChangedProperty:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1(&dword_2096EB000, a2, a3, ":: changed property \"%@\", (uint8_t *)&v3);
}

- (void)addChangedParameter:(os_log_t)log ofProperty:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_2096EB000, log, OS_LOG_TYPE_DEBUG, ":: :: changed parameter \"%@\" of \"%@\", (uint8_t *)&v3, 0x16u);
}

@end
