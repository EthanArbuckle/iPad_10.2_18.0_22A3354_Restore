@implementation MFMailMessageLibraryAddMailboxActionsUpgradeStep

+ (int)runWithConnection:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  void *v29;
  id v30;
  uint64_t i;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[3];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  if ((objc_msgSend(v30, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS mailbox_actions (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, account_identifier TEXT, action_type INTEGER, mailbox_name TEXT);"),
          CFSTR("Creating mailbox_actions table")) & 1) != 0)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    +[MailAccount mailAccounts](MailAccount, "mailAccounts");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(obj);
          v3 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v3, "path");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR(".OfflineCache/operations"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(a1, "_readSavedOperationsAtPath:", v29);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "preparedStatementForQueryString:", CFSTR("INSERT INTO mailbox_actions (account_identifier, action_type, mailbox_name) VALUES (?, ?, ?)"));
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            v6 = v24;
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
            if (v7)
            {
              v8 = *(_QWORD *)v34;
              while (2)
              {
                for (j = 0; j != v7; ++j)
                {
                  if (*(_QWORD *)v34 != v8)
                    objc_enumerationMutation(v6);
                  v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
                  v11 = objc_msgSend(v10, "operationType");
                  objc_msgSend(v3, "identifier");
                  v12 = objc_claimAutoreleasedReturnValue();
                  v13 = (void *)v12;
                  if (v11 == 1)
                    v14 = 1;
                  else
                    v14 = 2;
                  v41[0] = v12;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  v41[1] = v15;
                  objc_msgSend(v10, "mailboxName");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v41[2] = v16;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  v32 = 0;
                  v18 = objc_msgSend(v5, "executeWithIndexedBindings:usingBlock:error:", v17, 0, &v32);
                  v19 = v32;
                  v20 = v19;
                  if ((v18 & 1) == 0)
                  {
                    EDLibraryLog();
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                      +[MFMailMessageLibraryAddMailboxActionsUpgradeStep runWithConnection:].cold.1((uint64_t)v20, v22);

                    v21 = 1;
                    goto LABEL_28;
                  }

                }
                v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
                if (v7)
                  continue;
                break;
              }
            }

          }
        }
        v21 = 0;
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v25);
    }
    else
    {
      v21 = 0;
    }
LABEL_28:

  }
  else
  {
    v21 = 1;
  }

  return v21;
}

+ (id)_readSavedOperationsAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  id v11;
  uint64_t v13;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    v5 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v3, 1, 0);
    v6 = v5;
    if (v5)
    {
      v13 = 0;
      v7 = objc_msgSend(v5, "length");
      if (v7 >= 4)
      {
        do
        {
          v8 = objc_retainAutorelease(v6);
          v9 = objc_msgSend(v8, "bytes");
          if (*(_WORD *)(v9 + v13) != 0x7FFF || *(unsigned __int8 *)(v9 + v13 + 2) != 255)
            break;
          v13 += 3;
          v11 = +[_MFOldIMAPOfflineOperation deserializedCopyFromData:cursor:](_MFOldIMAPOfflineOperation, "deserializedCopyFromData:cursor:", v8, &v13);
          if (!v11)
            break;
          objc_msgSend(v4, "addObject:", v11);

        }
        while (v13 + 3 < v7);
      }

    }
  }

  return v4;
}

+ (void)runWithConnection:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_ERROR, "Got error %@ inserting mailboxAction", (uint8_t *)&v2, 0xCu);
}

@end
