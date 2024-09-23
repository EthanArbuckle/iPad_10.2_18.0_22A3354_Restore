@implementation DADiagnosticsPSController

+ (id)linkSpecifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend((id)objc_opt_class(), "diagnosticsVisible"))
  {
    v2 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DIAG_LINK_TITLE"), &stru_24E437D68, CFSTR("Diagnostic"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, 0, 0, 0, objc_opt_class(), 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)dumpRuntimeStateSpecifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", &stru_24E437D68);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  v4 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DIAG_DUMP_RUNTIME_STATE"), &stru_24E437D68, CFSTR("Diagnostic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonSpecifierWithTitle:target:action:confirmationInfo:", v6, 0, sel_handleDumpRuntimeStateForSpecifier_, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  return v2;
}

- (id)diagnosticSpecifiers
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dumpRuntimeStateSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "addObjectsFromArray:", v3);
  objc_msgSend(v3, "lastObject");

  return v2;
}

- (id)specifiers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[DADiagnosticsPSController diagnosticSpecifiers](self, "diagnosticSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = (int *)MEMORY[0x24BE75768];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        objc_storeWeak((id *)(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8++) + *v7), self);
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  v9 = (int)*MEMORY[0x24BE756E0];
  v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v9);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)v3;
  v11 = v3;

  v12 = *(id *)((char *)&self->super.super.super.super.super.isa + v9);
  return v12;
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  UIAlertView *v6;
  UIAlertView *v7;
  SEL simpleConfirmSheetDismissedSEL;
  objc_super v9;

  v6 = (UIAlertView *)a3;
  v7 = v6;
  if (self->_simpleAlert == v6)
  {
    self->_simpleAlert = 0;

    simpleConfirmSheetDismissedSEL = self->_simpleConfirmSheetDismissedSEL;
    if (simpleConfirmSheetDismissedSEL)
      -[DADiagnosticsPSController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", simpleConfirmSheetDismissedSEL, 0, 1.0);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DADiagnosticsPSController;
    -[DADiagnosticsPSController alertView:clickedButtonAtIndex:](&v9, sel_alertView_clickedButtonAtIndex_, v6, a4);
  }

}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  UIAlertView *v5;
  UIAlertView *v6;

  v5 = (UIAlertView *)a3;
  if (self->_savingDataAlert == v5)
  {
    self->_savingDataAlert = 0;
    v6 = v5;

    -[DADiagnosticsPSController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_handleSaveAllLogsStep2, 0, 0.0);
    v5 = v6;
  }

}

- (void)runSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissedSelector:(SEL)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  UIAlertView *v14;
  UIAlertView *simpleAlert;

  v8 = (objc_class *)MEMORY[0x24BDF67F8];
  v9 = a4;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E437D68, CFSTR("Diagnostic"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (UIAlertView *)objc_msgSend(v11, "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", v10, v9, self, v13, 0);

  simpleAlert = self->_simpleAlert;
  self->_simpleAlert = v14;

  self->_simpleConfirmSheetDismissedSEL = a5;
  -[UIAlertView show](self->_simpleAlert, "show");
}

- (void)runSimpleAlertWithTitle:(id)a3 message:(id)a4
{
  void *v6;
  __CFString *v7;
  __CFString *alertHeader;
  CFOptionFlags v9;

  v6 = (void *)*MEMORY[0x24BDF74F8];
  v7 = (__CFString *)a4;
  alertHeader = (__CFString *)a3;
  if (objc_msgSend(v6, "isSuspended"))
  {
    v9 = 0;
    CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, alertHeader, v7, 0, 0, 0, &v9);

  }
  else
  {
    -[DADiagnosticsPSController runSimpleAlertWithTitle:message:dismissedSelector:](self, "runSimpleAlertWithTitle:message:dismissedSelector:", alertHeader, v7, 0);

  }
}

- (void)setBooleanProperty:(id)a3 withSpecifier:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = objc_msgSend(a3, "BOOLValue");
  objc_msgSend(v8, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", DiagnosticsEnabledKey))
    -[DADiagnosticsPSController setLoggingEnabled:forSpecifier:](self, "setLoggingEnabled:forSpecifier:", v6, v8);

}

- (id)BOOLeanPropertyWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", DiagnosticsEnabledKey))
    v6 = -[DADiagnosticsPSController isLoggingEnabledForSpecifier:](self, "isLoggingEnabledForSpecifier:", v4);
  else
    v6 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)handleDumpRuntimeStateForSpecifier:(id)a3
{
  pid_t v3;

  v3 = MEMORY[0x2207C95F0](CFSTR("dataaccessd"), a2, a3);
  if ((v3 & 0x80000000) == 0)
    kill(v3, 31);
}

- (id)savedLogsDirectoryNameForSpecifier:(id)a3
{
  return CFSTR("DALogs");
}

- (BOOL)saveFileAtPath:(id)a3 toDirectory:(id)a4 withExtension:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  id v21;

  v9 = a3;
  v10 = (void *)MEMORY[0x24BDD1580];
  v11 = a4;
  objc_msgSend(v10, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    objc_msgSend(v14, "pathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEqual:", CFSTR("log")) & 1) != 0)
    {
LABEL_5:

      goto LABEL_6;
    }
    objc_msgSend(v14, "pathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", CFSTR("gz"));

    if ((v17 & 1) == 0)
    {
      objc_msgSend(v14, "stringByAppendingPathExtension:", CFSTR("log"));
      v15 = v14;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }
LABEL_6:
  v21 = 0;
  objc_msgSend(v12, "copyItemAtPath:toPath:error:", v9, v14, &v21);
  v18 = v21;
  v19 = v18;
  if (a6 && v18)
    *a6 = objc_retainAutorelease(v18);

  return v19 == 0;
}

- (void)saveLogsWithNotes:(id)a3
{
  id v4;
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
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  void *v28;
  _QWORD block[4];
  id v30;
  DADiagnosticsPSController *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DADiagnosticsPSController pathsOfAllLogFiles](self, "pathsOfAllLogFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  validPathsForPaths(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A0], "calendarDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionWithCalendarFormat:", CFSTR("%Y-%m-%d-%H%M%S"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NSHomeDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[DADiagnosticsPSController savedLogsDirectoryNameForSpecifier:](self, "savedLogsDirectoryNameForSpecifier:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Library/Logs/CrashReporter/%@/Logs-%@"), v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, 0);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Log Notes [%@]\n==========================================================\n%@\n==========================================================\n"), v8, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("Notes.log"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeToFile:atomically:encoding:error:", v16, 1, 4, 0);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v28 = v6;
    v17 = v6;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v37;
LABEL_4:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v17);
        if (!-[DADiagnosticsPSController saveFileAtPath:toDirectory:withExtension:error:](self, "saveFileAtPath:toDirectory:withExtension:error:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v21), v13, CFSTR("log"), 0))break;
        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          if (v19)
            goto LABEL_4;

          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v22 = v17;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v33 != v25)
                  objc_enumerationMutation(v22);
                -[DADiagnosticsPSController purgeFileAtPath:](self, "purgeFileAtPath:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v24);
          }
          break;
        }
      }
    }

    v6 = v28;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__DADiagnosticsPSController_saveLogsWithNotes___block_invoke;
  block[3] = &unk_24E437C18;
  v30 = v13;
  v31 = self;
  v27 = v13;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __47__DADiagnosticsPSController_saveLogsWithNotes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DIAG_LOG_SAVED_MESSAGE"), &stru_24E437D68, CFSTR("Diagnostic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DIAG_LOG_SAVED_TITLE"), &stru_24E437D68, CFSTR("Diagnostic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "runSimpleAlertWithTitle:message:", v8, v9);

}

- (void)_presentNotesController
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  char *v10;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DIAG_NOTES_TITLE"), &stru_24E437D68, CFSTR("Diagnostic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, v6, 1, objc_opt_class());
  v10 = (char *)objc_claimAutoreleasedReturnValue();

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v8, *MEMORY[0x24BE75C60]);

  objc_msgSend(v10, "setProperty:forKey:", self, CFSTR("kDADiagnosticSaveNotesDelegate"));
  v9 = (void *)objc_opt_new();
  *((_BYTE *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756D8]) = 1;
  objc_msgSend(v9, "setParentController:", self);
  objc_msgSend(v9, "setSpecifier:", v10);
  objc_storeWeak((id *)&v10[*MEMORY[0x24BE75768]], self);
  -[DADiagnosticsPSController pushController:](self, "pushController:", v9);

}

- (void)handleSaveAllLogsStep2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[DADiagnosticsPSController pathsOfAllLogFiles](self, "pathsOfAllLogFiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  validPathsForPaths(v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    -[DADiagnosticsPSController _presentNotesController](self, "_presentNotesController");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DIAG_NO_LOGS_TO_SAVE_TITLE"), &stru_24E437D68, CFSTR("Diagnostic"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DIAGS_NO_LOGS_TO_SAVE_MESSAGE"), &stru_24E437D68, CFSTR("Diagnostic"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DADiagnosticsPSController runSimpleAlertWithTitle:message:](self, "runSimpleAlertWithTitle:message:", v5, v7);

  }
}

- (void)_dismissSavingDataAlert
{
  id v3;

  -[UIAlertView dismissWithClickedButtonIndex:animated:](self->_savingDataAlert, "dismissWithClickedButtonIndex:animated:", 0, 1);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "setIgnoresInteractionEvents:", 0);
  -[DADiagnosticsPSController rootController](self, "rootController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "taskFinished:", self);

}

- (void)handleSaveAllLogsForSpecifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIAlertView *v12;
  UIAlertView *savingDataAlert;
  id v14;

  v4 = a3;
  -[DADiagnosticsPSController rootController](self, "rootController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[DADiagnosticsPSController handleDumpRuntimeStateForSpecifier:](self, "handleDumpRuntimeStateForSpecifier:", v4);

  objc_msgSend(v14, "addTask:", self);
  v5 = objc_alloc(MEMORY[0x24BDF67F8]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DIAG_SAVING_ADDITIONAL_DATA_TITLE"), &stru_24E437D68, CFSTR("Diagnostic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DIAG_SAVING_ADDITIONAL_DATA_MESSAGE"), &stru_24E437D68, CFSTR("Diagnostic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E437D68, CFSTR("Diagnostic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (UIAlertView *)objc_msgSend(v5, "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", v7, v9, self, v11, 0);
  savingDataAlert = self->_savingDataAlert;
  self->_savingDataAlert = v12;

  -[UIAlertView show](self->_savingDataAlert, "show");
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "setIgnoresInteractionEvents:", 1);
  -[DADiagnosticsPSController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__dismissSavingDataAlert, 0, 4.0);

}

- (void)suspend
{
  id v3;

  if ((objc_msgSend((id)*MEMORY[0x24BDF74F8], "isSuspendedEventsOnly") & 1) == 0)
  {
    -[DADiagnosticsPSController navigationController](self, "navigationController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

- (void)handleClearAllLogsForSpecifier:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[DADiagnosticsPSController pathsOfAllLogFiles](self, "pathsOfAllLogFiles", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[DADiagnosticsPSController purgeFileAtPath:](self, "purgeFileAtPath:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)pathsOfAllLogFiles
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
}

- (void)purgeFileAtPath:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("dataaccess.log")))
  {
    truncate((const char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation"), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", v5, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savingDataAlert, 0);
  objc_storeStrong((id *)&self->_simpleAlert, 0);
}

@end
