@implementation CUIKEventStoreEditor

- (BOOL)saveNewEvents:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  _BOOL4 v27;
  id *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v6 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v27 = v6;
    v28 = a5;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v32;
      v13 = 1;
      do
      {
        v14 = 0;
        v15 = v11;
        do
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v8);
          v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
          objc_msgSend(v16, "eventStore");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v15;
          v18 = objc_msgSend(v17, "saveEvent:span:commit:error:", v16, 0, 0, &v30);
          v11 = v30;

          if ((v18 & 1) == 0)
          {
            +[CUIKLogSubsystem eventStoreEditor](CUIKLogSubsystem, "eventStoreEditor");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v36 = v11;
              _os_log_error_impl(&dword_1B8A6A000, v19, OS_LOG_TYPE_ERROR, "Failed to save new event: %@", buf, 0xCu);
            }

            v13 = 0;
          }
          ++v14;
          v15 = v11;
        }
        while (v10 != v14);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
      v13 = 1;
    }

    if (v27)
    {
      objc_msgSend(v8, "anyObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "eventStore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v11;
      v23 = objc_msgSend(v22, "commit:", &v29);
      v24 = v29;

      if ((v23 & 1) == 0)
      {
        +[CUIKLogSubsystem eventStoreEditor](CUIKLogSubsystem, "eventStoreEditor");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[CUIKEventStoreEditor saveNewEvents:commit:error:].cold.1();

        v13 = 0;
      }
    }
    else
    {
      v24 = v11;
    }
    if (v28 && v24)
      *v28 = objc_retainAutorelease(v24);

    v20 = v13 & 1;
  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (void)saveChangesToEvents:(id)a3 span:(int64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v26;
      do
      {
        v11 = 0;
        v12 = v9;
        do
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
          objc_msgSend(v13, "eventStore");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v12;
          v15 = objc_msgSend(v14, "saveEvent:span:commit:error:", v13, a4, 0, &v24);
          v9 = v24;

          if ((v15 & 1) == 0)
          {
            +[CUIKLogSubsystem eventStoreEditor](CUIKLogSubsystem, "eventStoreEditor");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v9;
              _os_log_error_impl(&dword_1B8A6A000, v16, OS_LOG_TYPE_ERROR, "Failed to save new event: %@", buf, 0xCu);
            }

          }
          ++v11;
          v12 = v9;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    objc_msgSend(v6, "anyObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "eventStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v9;
    v19 = objc_msgSend(v18, "commit:", &v23);
    v20 = v23;

    v5 = v22;
    if ((v19 & 1) == 0)
    {
      +[CUIKLogSubsystem eventStoreEditor](CUIKLogSubsystem, "eventStoreEditor");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[CUIKEventStoreEditor saveNewEvents:commit:error:].cold.1();

    }
  }

}

- (BOOL)saveEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  return -[CUIKEventStoreEditor _saveEvent:span:commit:error:](self, "_saveEvent:span:commit:error:", a3, a4, 1, a5);
}

- (BOOL)_saveEvent:(id)a3 span:(int64_t)a4 commit:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v15;

  v7 = a5;
  v9 = a3;
  objc_msgSend(v9, "eventStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11 = objc_msgSend(v10, "saveEvent:span:commit:error:", v9, a4, v7, &v15);
  v12 = v15;

  if ((v11 & 1) == 0)
  {
    +[CUIKLogSubsystem eventStoreEditor](CUIKLogSubsystem, "eventStoreEditor");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CUIKEventStoreEditor _saveEvent:span:commit:error:].cold.1();

    if ((objc_msgSend(v9, "isNew") & 1) == 0)
      objc_msgSend(v9, "rollback");
  }
  if (a6)
    *a6 = objc_retainAutorelease(v12);

  return v11;
}

- (BOOL)saveEventForOOPModificationRecording:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  return -[CUIKEventStoreEditor _saveEvent:span:commit:error:](self, "_saveEvent:span:commit:error:", a3, a4, 0, a5);
}

- (BOOL)commitEventForOOPModificationRecording:(id)a3 error:(id *)a4
{
  void *v5;

  objc_msgSend(a3, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v5, "commitWithRollback:", a4);

  return (char)a4;
}

- (BOOL)deleteEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v13;

  v7 = a3;
  objc_msgSend(v7, "eventStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = objc_msgSend(v8, "removeEvent:span:error:", v7, a4, &v13);
  v10 = v13;

  if ((v9 & 1) == 0)
  {
    +[CUIKLogSubsystem eventStoreEditor](CUIKLogSubsystem, "eventStoreEditor");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CUIKEventStoreEditor deleteEvent:span:error:].cold.1();

    objc_msgSend(v7, "rollback");
  }
  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v9;
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4
{
  -[CUIKEventStoreEditor deleteEvents:span:result:](self, "deleteEvents:span:result:", a3, a4, 0);
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4 result:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, id);
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  void (**v27)(id, uint64_t, id);
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, id))a5;
  if (!objc_msgSend(v7, "count"))
  {
    v21 = 0;
    v22 = 1;
    if (!v8)
      goto LABEL_24;
    goto LABEL_23;
  }
  v27 = v8;
  v28 = v7;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v32;
    v14 = 1;
    do
    {
      v15 = 0;
      v16 = v12;
      do
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v15);
        objc_msgSend(v17, "eventStore", v27, v28);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v16;
        v19 = objc_msgSend(v18, "removeEvent:span:commit:error:", v17, a4, 0, &v30);
        v12 = v30;

        if ((v19 & 1) == 0)
        {
          +[CUIKLogSubsystem eventStoreEditor](CUIKLogSubsystem, "eventStoreEditor");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v12;
            _os_log_error_impl(&dword_1B8A6A000, v20, OS_LOG_TYPE_ERROR, "Failed to remove event: %@", buf, 0xCu);
          }

          v14 = 0;
        }
        ++v15;
        v16 = v12;
      }
      while (v11 != v15);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
    v14 = 1;
  }

  objc_msgSend(v9, "anyObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "eventStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v12;
  v25 = objc_msgSend(v24, "commit:", &v29);
  v21 = v29;

  if ((v25 & 1) != 0)
  {
    v22 = v14 & 1;
  }
  else
  {
    +[CUIKLogSubsystem eventStoreEditor](CUIKLogSubsystem, "eventStoreEditor");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[CUIKEventStoreEditor deleteEvents:span:result:].cold.1();

    v22 = 0;
  }
  v8 = v27;
  v7 = v28;
  if (v27)
LABEL_23:
    v8[2](v8, v22, v21);
LABEL_24:

}

- (BOOL)saveCalendar:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v11;

  v5 = a3;
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v6, "saveCalendar:commit:error:", v5, 1, &v11);

  v8 = v11;
  if ((v7 & 1) == 0)
  {
    +[CUIKLogSubsystem eventStoreEditor](CUIKLogSubsystem, "eventStoreEditor");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CUIKEventStoreEditor saveCalendar:error:].cold.1();

  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

- (void)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  char v11;
  id v12;
  id v13;

  v5 = a3;
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4)
  {
    v13 = 0;
    v8 = objc_msgSend(v6, "deleteCalendar:forEntityType:error:", v5, a4, &v13);
    v9 = v13;

    if ((v8 & 1) == 0)
    {
      +[CUIKLogSubsystem eventStoreEditor](CUIKLogSubsystem, "eventStoreEditor");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CUIKEventStoreEditor deleteCalendar:forEntityType:].cold.2();
LABEL_8:

    }
  }
  else
  {
    v12 = 0;
    v11 = objc_msgSend(v6, "removeCalendar:commit:error:", v5, 1, &v12);
    v9 = v12;

    if ((v11 & 1) == 0)
    {
      +[CUIKLogSubsystem eventStoreEditor](CUIKLogSubsystem, "eventStoreEditor");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CUIKEventStoreEditor deleteCalendar:forEntityType:].cold.1();
      goto LABEL_8;
    }
  }

}

- (void)performWithOptions:(id)a3 block:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
}

- (void)saveNewEvents:commit:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, v0, v1, "Failed commit event store after saving new events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_saveEvent:span:commit:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, v0, v1, "Failed to save event: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deleteEvent:span:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, v0, v1, "Failed to delete event: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deleteEvents:span:result:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, v0, v1, "Failed to commit event store after removing events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveCalendar:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, v0, v1, "Failed to save calendar: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deleteCalendar:forEntityType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, v0, v1, "Failed to remove calendar: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deleteCalendar:forEntityType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, v0, v1, "Failed to delete calendar: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
