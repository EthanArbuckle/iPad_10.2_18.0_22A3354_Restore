@implementation CalMigrationToolArgumentParser

+ (id)parseOptionsFromCommandLineArguments:(id)a3 printUsage:(BOOL *)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  BOOL *v40;
  id *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!objc_msgSend(v8, "count"))
  {
    if (a4)
      *a4 = 1;
    v21 = 0;
    if (a5)
      *a5 = 0;
    goto LABEL_74;
  }
  v54 = 0;
  v55 = 0;
  v52 = 0;
  v53 = 0;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (!v10)
  {

    v16 = 0;
    v26 = -1;
    v27 = -1;
    v28 = -1;
    v29 = -1;
    v30 = -1;
    v31 = -1;
    goto LABEL_42;
  }
  v11 = v10;
  v40 = a4;
  v41 = a5;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v49;
  v46 = -1;
  v47 = -1;
  v44 = -1;
  v45 = -1;
  v42 = -1;
  v43 = -1;
LABEL_4:
  v15 = 0;
  while (2)
  {
    v16 = v13;
    if (*(_QWORD *)v49 != v14)
      objc_enumerationMutation(v9);
    v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v15);
    v18 = objc_msgSend(a1, "_argumentFromCommandLineArgument:", v17);
    if (v12 && v18 != 1)
    {
      v22 = v41;
      if (v41)
      {
        v23 = a1;
        v24 = 2;
        v25 = v16;
LABEL_40:
        objc_msgSend(v23, "_argumentParseErrorWithCode:argument:", v24, v25);
        v21 = 0;
        *v22 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      }
LABEL_71:
      v21 = 0;
LABEL_72:

      goto LABEL_73;
    }
    switch(v18)
    {
      case -1:
        goto LABEL_52;
      case 0:
        if (v40)
          *v40 = 1;
        if (!v41)
          goto LABEL_71;
        v21 = 0;
        *v41 = 0;
        goto LABEL_72;
      case 1:
        if (!v12)
        {
LABEL_52:
          v35 = v41;
          if (!v41)
            goto LABEL_71;
          v36 = a1;
          v37 = 0;
LABEL_65:
          objc_msgSend(v36, "_argumentParseErrorWithCode:argument:", v37, v17);
          v21 = 0;
          *v35 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        }
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v17);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *v12;
        *v12 = (void *)v19;

        if (!*v12)
        {
          v35 = v41;
          if (!v41)
            goto LABEL_71;
          v36 = a1;
          v37 = 3;
          goto LABEL_65;
        }
        v12 = 0;
LABEL_29:
        v13 = v17;

        if (v11 != ++v15)
          continue;
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v11)
          goto LABEL_4;

        if (!v12)
        {
          v16 = v13;
          a5 = v41;
          v27 = v42;
          v30 = v46;
          v31 = v47;
          v28 = v44;
          v29 = v45;
          v26 = v43;
LABEL_42:
          if (v55)
          {
            if (!v52 || v53)
            {
              v34 = objc_alloc(MEMORY[0x24BE13D38]);
              v21 = (void *)objc_msgSend(v34, "initWithHomeDirectory:destinationDirectory:performCalendarMigration:performReminderMigration:performCleanup:deleteMigratedData:backupBeforeCalendarMigration:backupBeforeReminderMigration:saveAccountsChangesToFile:accountsDatabaseFile:", v55, v54, v31, v30, v29, v28, v27, v26, v53, v52);
              goto LABEL_73;
            }
            if (a5)
            {
              v32 = a1;
              v33 = 6;
LABEL_49:
              objc_msgSend(v32, "_argumentParseErrorWithCode:argument:", v33, 0);
              v21 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_73;
            }
          }
          else if (a5)
          {
            v32 = a1;
            v33 = 1;
            goto LABEL_49;
          }
          v21 = 0;
          goto LABEL_73;
        }
        if (v41)
        {
          objc_msgSend(a1, "_argumentParseErrorWithCode:argument:", 2, v13);
          v21 = 0;
          *v41 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
        }
        v16 = v13;
LABEL_73:

LABEL_74:
        return v21;
      case 2:
        v12 = &v55;
        goto LABEL_29;
      case 3:
        v12 = &v54;
        goto LABEL_29;
      case 4:
        if (objc_msgSend(v9, "count") == 1)
        {
          v38 = objc_msgSend(objc_alloc(MEMORY[0x24BE13D38]), "initUsingCalendarDaemon");
          goto LABEL_62;
        }
        v22 = v41;
        if (!v41)
          goto LABEL_71;
        v23 = a1;
        v24 = 4;
        goto LABEL_70;
      case 5:
        if (objc_msgSend(v9, "count") == 1)
        {
          v38 = objc_msgSend(objc_alloc(MEMORY[0x24BE13D38]), "initUsingCalendarDaemonWaitingForRemindersOnly");
LABEL_62:
          v21 = (void *)v38;
          goto LABEL_72;
        }
        v22 = v41;
        if (!v41)
          goto LABEL_71;
        v23 = a1;
        v24 = 5;
LABEL_70:
        v25 = 0;
        goto LABEL_40;
      case 6:
        v47 = 1;
        goto LABEL_29;
      case 7:
        v47 = 0;
        goto LABEL_29;
      case 8:
        v46 = 1;
        goto LABEL_29;
      case 9:
        v46 = 0;
        goto LABEL_29;
      case 10:
        v45 = 1;
        goto LABEL_29;
      case 11:
        v45 = 0;
        goto LABEL_29;
      case 12:
        v44 = 1;
        goto LABEL_29;
      case 13:
        v44 = 0;
        goto LABEL_29;
      case 14:
        v42 = 1;
        goto LABEL_29;
      case 15:
        v42 = 0;
        goto LABEL_29;
      case 16:
        v43 = 1;
        goto LABEL_29;
      case 17:
        v43 = 0;
        goto LABEL_29;
      case 18:
        v12 = &v53;
        goto LABEL_29;
      case 19:
        v12 = &v52;
        goto LABEL_29;
      default:
        goto LABEL_29;
    }
  }
}

+ (unint64_t)_argumentFromCommandLineArgument:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("--")))
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--help")) & 1) != 0)
    {
      v4 = 0;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--homeDirectory")) & 1) != 0)
    {
      v4 = 2;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--destinationDirectory")) & 1) != 0)
    {
      v4 = 3;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--migrateUsingCalendarDaemon")) & 1) != 0)
    {
      v4 = 4;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--migrateUsingCalendarDaemonWaitingForRemindersOnly")) & 1) != 0)
    {
      v4 = 5;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--performCalendarMigration")) & 1) != 0)
    {
      v4 = 6;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--skipCalendarMigration")) & 1) != 0)
    {
      v4 = 7;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--performReminderMigration")) & 1) != 0)
    {
      v4 = 8;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--skipReminderMigration")) & 1) != 0)
    {
      v4 = 9;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--performCleanup")) & 1) != 0)
    {
      v4 = 10;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--skipCleanup")) & 1) != 0)
    {
      v4 = 11;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--deleteMigratedData")) & 1) != 0)
    {
      v4 = 12;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--skipDeleteMigratedData")) & 1) != 0)
    {
      v4 = 13;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--backupBeforeCalendarMigration")) & 1) != 0)
    {
      v4 = 14;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--skipBackupBeforeCalendarMigration")) & 1) != 0)
    {
      v4 = 15;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--backupBeforeReminderMigration")) & 1) != 0)
    {
      v4 = 16;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--skipBackupBeforeReminderMigration")) & 1) != 0)
    {
      v4 = 17;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("--saveAccountChangesToFile")) & 1) != 0)
    {
      v4 = 18;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("--accountsDatabaseFile")))
    {
      v4 = 19;
    }
    else
    {
      v4 = -1;
    }
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (id)_argumentParseErrorWithCode:(unint64_t)a3 argument:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("kCalMigrationToolOptionsArgumentParseErrorUserInfoKey_Argument"), CFSTR("kCalMigrationToolOptionsArgumentParseErrorUserInfoKey_Argument"));
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unrecognized option: %@"), v5);
      goto LABEL_7;
    case 1uLL:
      v7 = CFSTR("Missing required option: --homeDirectory");
      break;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing required argument for option %@"), v5);
      goto LABEL_7;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid path: %@"), v5);
LABEL_7:
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      v7 = CFSTR("--migrateUsingCalendarDaemon cannot be used in combination with any other options");
      break;
    case 5uLL:
      v7 = CFSTR("--migrateUsingCalendarDaemonWaitingForRemindersOnly cannot be used in combination with any other options");
      break;
    case 6uLL:
      v7 = CFSTR("--accountsDatabaseFile requires --saveAccountChangesToFile");
      break;
    default:
      v7 = 0;
      break;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("kCalMigrationToolOptionsArgumentParseErrorUserInfoKey_Message"));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kCalMigrationToolOptionsArgumentParseErrorDomain"), a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)usageStringWithToolPath:(id)a3 parseError:(id)a4
{
  __CFString *v5;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = (__CFString *)a3;
  v6 = a4;
  if (v5)
    v7 = v5;
  else
    v7 = CFSTR("CalendarMigrationTool");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Usage:\n  %@ --migrateUsingCalendarDaemon\n    Asks the calendar daemon to perform migration and blocks until migration is finished\n  %@ --migrateUsingCalendarDaemonWaitingForRemindersOnly\n    Asks the calendar daemon to perform migration and blocks only until reminder migration is finished\n\n  %@ --homeDirectory <path to user home directory> [options]\n    Performs migration with the given options in this tool's process\n\nOptions:\n--help                                               Print this usage message\n--migrateUsingCalendarDaemon                         Asks the calendar daemon to perform migration and blocks until migration is finished\n--migrateUsingCalendarDaemonWaitingForRemindersOnly  Asks the calendar daemon to perform migration and blocks only until reminder migration is finished\n--homeDirectory                                      The home directory of the user to migrate\n--destinationDirectory                               The directory to migrate into\n--performCalendarMigration                           Force migration of calendar data\n--skipCalendarMigration                              Skip migration of calendar data\n--performReminderMigration                           Force migration of reminder data\n--skipReminderMigration                              Skip migration of reminder data\n--performCleanup                                     Force cleanup\n--skipCleanup                                        Skip cleanup\n--deleteMigratedData                                 Force deletion of migrated data\n--skipDeleteMigratedData                             Skip deletion of migrated data\n--backupBeforeCalendarMigration                      Perform a backup of the Calendars directory before calendar migration\n--skipBackupBeforeCalendarMigration                  Skip backup of the Calendars directory before calendar migration\n--backupBeforeReminderMigration                      Perform a backup of the Calendars directory before reminder migration\n--skipBackupBeforeReminderMigration                  Skip backup of the Calendars directory before reminder migration\n--saveAccountChangesToFile                           Save any account changes to the given file instead of modifying the actual account store\n--accountsDatabaseFile                               Use the specified Accounts database instead of the current user's (requires --saveAccountChangesToFile).\n"), v7, v7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v12 = CFSTR("Performs migration of legacy calendar files");
    goto LABEL_16;
  }
  objc_msgSend(v6, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("kCalMigrationToolOptionsArgumentParseErrorDomain"));

  if (v10)
  {
    objc_msgSend(v6, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCalMigrationToolOptionsArgumentParseErrorUserInfoKey_Message"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_16;
    objc_msgSend(v6, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCalMigrationToolOptionsArgumentParseErrorUserInfoKey_Argument"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error parsing command line arguments here: %@"), v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(v6, "localizedDescription");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  if (v15)
    v12 = (__CFString *)v15;
  else
    v12 = CFSTR("Unknown error parsing arguments");
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), v12, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)commandLineArgumentsForToolOptions:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
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

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "migrateUsingCalendarDaemon"))
  {
    if (objc_msgSend(v4, "waitForRemindersOnly"))
      v6 = CFSTR("--migrateUsingCalendarDaemonWaitingForRemindersOnly");
    else
      v6 = CFSTR("--migrateUsingCalendarDaemon");
    objc_msgSend(v5, "addObject:", v6);
  }
  else
  {
    objc_msgSend(v5, "addObject:", CFSTR("--homeDirectory"));
    objc_msgSend(v4, "homeDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    objc_msgSend(v4, "destinationDirectory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "addObject:", CFSTR("--destinationDirectory"));
      objc_msgSend(v4, "destinationDirectory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);

    }
    objc_msgSend(a1, "_appendToArguments:ifNeededForTriStateOption:forceEnableArgument:forceDisableArgument:", v5, objc_msgSend(v4, "performCalendarMigration"), CFSTR("--performCalendarMigration"), CFSTR("--skipCalendarMigration"));
    objc_msgSend(a1, "_appendToArguments:ifNeededForTriStateOption:forceEnableArgument:forceDisableArgument:", v5, objc_msgSend(v4, "performReminderMigration"), CFSTR("--performReminderMigration"), CFSTR("--skipReminderMigration"));
    objc_msgSend(a1, "_appendToArguments:ifNeededForTriStateOption:forceEnableArgument:forceDisableArgument:", v5, objc_msgSend(v4, "performCleanup"), CFSTR("--performCleanup"), CFSTR("--skipCleanup"));
    objc_msgSend(a1, "_appendToArguments:ifNeededForTriStateOption:forceEnableArgument:forceDisableArgument:", v5, objc_msgSend(v4, "deleteMigratedData"), CFSTR("--deleteMigratedData"), CFSTR("--skipDeleteMigratedData"));
    objc_msgSend(a1, "_appendToArguments:ifNeededForTriStateOption:forceEnableArgument:forceDisableArgument:", v5, objc_msgSend(v4, "backupBeforeCalendarMigration"), CFSTR("--backupBeforeCalendarMigration"), CFSTR("--skipBackupBeforeCalendarMigration"));
    objc_msgSend(a1, "_appendToArguments:ifNeededForTriStateOption:forceEnableArgument:forceDisableArgument:", v5, objc_msgSend(v4, "backupBeforeReminderMigration"), CFSTR("--backupBeforeReminderMigration"), CFSTR("--skipBackupBeforeReminderMigration"));
    objc_msgSend(v4, "accountsChangesFile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v5, "addObject:", CFSTR("--saveAccountChangesToFile"));
      objc_msgSend(v4, "accountsChangesFile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v14);

    }
    objc_msgSend(v4, "accountsDatabaseFile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v5, "addObject:", CFSTR("--accountsDatabaseFile"));
      objc_msgSend(v4, "accountsDatabaseFile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v17);

    }
  }
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

+ (void)_appendToArguments:(id)a3 ifNeededForTriStateOption:(int64_t)a4 forceEnableArgument:(id)a5 forceDisableArgument:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v9 = a5;
  v10 = a6;
  v11 = v10;
  v12 = v9;
  if (a4 == 1)
    goto LABEL_4;
  if (!a4)
  {
    v12 = v10;
LABEL_4:
    objc_msgSend(v13, "addObject:", v12);
  }

}

@end
