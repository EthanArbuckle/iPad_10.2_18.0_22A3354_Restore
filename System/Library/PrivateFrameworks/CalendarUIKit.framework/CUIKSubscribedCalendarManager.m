@implementation CUIKSubscribedCalendarManager

- (void)shutdownDAForCalendarUpdates
{
  void *v3;
  NSObject *v4;
  unint64_t calendarSaveMonitoringToken;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!self->_calendarSaveMonitoringToken)
  {
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_calendarSaveMonitoringToken = objc_msgSend(v3, "requestDaemonStopMonitoringAgents");

    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      calendarSaveMonitoringToken = self->_calendarSaveMonitoringToken;
      v6 = 134217984;
      v7 = calendarSaveMonitoringToken;
      _os_log_impl(&dword_1B8A6A000, v4, OS_LOG_TYPE_DEFAULT, "Requesting DA stop monitoring agents for calendar updates with token %lu", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)restartDAAfterCalendarUpdates
{
  NSObject *v3;
  unint64_t calendarSaveMonitoringToken;
  void *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_calendarSaveMonitoringToken)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      calendarSaveMonitoringToken = self->_calendarSaveMonitoringToken;
      v6 = 134217984;
      v7 = calendarSaveMonitoringToken;
      _os_log_impl(&dword_1B8A6A000, v3, OS_LOG_TYPE_DEFAULT, "Requesting DA start monitoring agents for calendar updates with token %lu", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestDaemonStartMonitoringAgentsWithToken:", self->_calendarSaveMonitoringToken);

    self->_calendarSaveMonitoringToken = 0;
  }
}

- (void)shutdownDAForAccountUpdates
{
  void *v3;
  NSObject *v4;
  unint64_t accountsSaveMonitoringToken;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!self->_accountsSaveMonitoringToken)
  {
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_accountsSaveMonitoringToken = objc_msgSend(v3, "requestDaemonStopMonitoringAgents");

    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      accountsSaveMonitoringToken = self->_accountsSaveMonitoringToken;
      v6 = 134217984;
      v7 = accountsSaveMonitoringToken;
      _os_log_impl(&dword_1B8A6A000, v4, OS_LOG_TYPE_DEFAULT, "Requesting DA stop monitoring agents for account updates with token %lu", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)restartDAAfterAccountUpdates
{
  NSObject *v3;
  unint64_t accountsSaveMonitoringToken;
  void *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_accountsSaveMonitoringToken)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      accountsSaveMonitoringToken = self->_accountsSaveMonitoringToken;
      v6 = 134217984;
      v7 = accountsSaveMonitoringToken;
      _os_log_impl(&dword_1B8A6A000, v3, OS_LOG_TYPE_DEFAULT, "Requesting DA start monitoring agents for account updates with token %lu", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestDaemonStartMonitoringAgentsWithToken:", self->_accountsSaveMonitoringToken);

    self->_accountsSaveMonitoringToken = 0;
  }
}

- (void)updateOrCreateAccountWithCalendar:(id)a3 previousAccountID:(id)a4 newUsername:(id)a5 newPassword:(id)a6 newAllowsInsecureConnections:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _BOOL8 v23;
  NSObject *v24;
  uint64_t v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if ((objc_msgSend(v12, "isSubscribedHolidayCalendar") & 1) == 0)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    v17 = v16;
    if (v13)
    {
      objc_msgSend(v16, "accountWithIdentifier:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        goto LABEL_8;
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CUIKSubscribedCalendarManager updateOrCreateAccountWithCalendar:previousAccountID:newUsername:newPassword:newAllowsInsecureConnections:].cold.2();

    }
    v18 = 0;
LABEL_8:
    objc_msgSend(v12, "subcalAccountID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v17, "accountWithIdentifier:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        v23 = 0;
        HIBYTE(v25) = 0;
LABEL_15:
        LOBYTE(v25) = a7;
        -[CUIKSubscribedCalendarManager _updateAccount:inAccountStore:withCalendar:oldAccount:newAccountDirty:newUsername:newPassword:newAllowsInsecureConnections:](self, "_updateAccount:inAccountStore:withCalendar:oldAccount:newAccountDirty:newUsername:newPassword:newAllowsInsecureConnections:", v22, v17, v12, v18, v23, v14, v15, v25);

        goto LABEL_16;
      }
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[CUIKSubscribedCalendarManager updateOrCreateAccountWithCalendar:previousAccountID:newUsername:newPassword:newAllowsInsecureConnections:].cold.1();

    }
    HIBYTE(v25) = 0;
    -[CUIKSubscribedCalendarManager shutdownDAForAccountUpdates](self, "shutdownDAForAccountUpdates");
    -[CUIKSubscribedCalendarManager _createSubcalAccountForCalendar:inAccountStore:newAccountNeedsSaving:](self, "_createSubcalAccountForCalendar:inAccountStore:newAccountNeedsSaving:", v12, v17, (char *)&v25 + 7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = HIBYTE(v25) != 0;
    goto LABEL_15;
  }
LABEL_16:

}

- (void)_updateAccount:(id)a3 inAccountStore:(id)a4 withCalendar:(id)a5 oldAccount:(id)a6 newAccountDirty:(BOOL)a7 newUsername:(id)a8 newPassword:(id)a9 newAllowsInsecureConnections:(BOOL)a10
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  char v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  id v57;
  id v58;
  id v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  CUIKSubscribedCalendarManager *v67;
  id v68;
  id v69;
  BOOL v70;

  v11 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = v19;
  v22 = v20;
  v23 = v22;
  v62 = v22;
  v63 = v21;
  if (v18)
  {
    objc_msgSend(v18, "username");
    v24 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "credential");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "password");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1C438], "SubCalInsecureConnectionApproved");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    if (!v24)
      goto LABEL_4;
    goto LABEL_3;
  }
  v28 = a10;
  v64 = v22;
  v24 = (uint64_t)v21;
  if (v21)
  {
LABEL_3:
    objc_msgSend(v15, "setUsername:", v24);
    v11 = 1;
  }
LABEL_4:
  if (v64)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B0], "credentialWithPassword:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCredential:", v29);

    v11 = 1;
  }
  v61 = (void *)v24;
  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0D1C438], "SubCalInsecureConnectionApproved");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v30);

    v11 = 1;
  }
  objc_msgSend(MEMORY[0x1E0D1C240], "daAccountSubclassWithBackingAccountInfo:", v15);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v17, "subcalURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "URLWithString:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v57 = v18;
    v58 = v16;
    v59 = v15;
    objc_msgSend(v34, "scheme");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("https"));

    objc_msgSend(v34, "scheme");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("ftp"));

    objc_msgSend(MEMORY[0x1E0D0C3C0], "hostStringFromURL:", v34);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "user");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringByRemovingPercentEncoding");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "password");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringByRemovingPercentEncoding");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v36 != objc_msgSend(v31, "useSSL"))
    {
      objc_msgSend(v31, "setUseSSL:", v36);
      v11 = 1;
    }
    if ((_DWORD)v38 != objc_msgSend(v31, "useFTP"))
    {
      objc_msgSend(v31, "setUseFTP:", v38);
      v11 = 1;
    }
    objc_msgSend(v31, "host");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isEqualToString:", v39);

    if ((v45 & 1) == 0)
    {
      objc_msgSend(v31, "setHost:", v39);
      v11 = 1;
    }
    v18 = v57;
    if (objc_msgSend(v41, "length"))
    {
      objc_msgSend(v31, "username");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v41, "isEqualToString:", v46);

      if ((v47 & 1) == 0)
      {
        objc_msgSend(v31, "setUsername:", v41);
        v11 = 1;
      }
    }
    if (objc_msgSend(v43, "length"))
    {
      objc_msgSend(v31, "password");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v43, "isEqualToString:", v48);

      if ((v49 & 1) == 0)
      {
        objc_msgSend(v31, "setPassword:", v43);
        v11 = 1;
      }
    }

    v16 = v58;
    v15 = v59;
  }
  objc_msgSend(v31, "calendarExternalId");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "externalID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "isEqualToString:", v50);

  if ((v52 & 1) == 0)
    objc_msgSend(v17, "setExternalID:", v50);
  v53 = objc_msgSend(v17, "stripAlarms");
  if ((_DWORD)v53 != objc_msgSend(v31, "shouldRemoveAlarms"))
  {
    objc_msgSend(v31, "setShouldRemoveAlarms:", v53);
    v11 = 1;
  }
  v54 = objc_msgSend(v17, "stripAttachments");
  if ((_DWORD)v54 != objc_msgSend(v31, "shouldRemoveAttachments"))
  {
    objc_msgSend(v31, "setShouldRemoveAttachments:", v54);
    v11 = 1;
  }
  v55 = (double)(int)objc_msgSend(v17, "refreshInterval");
  objc_msgSend(v31, "refreshInterval");
  if (v56 != v55)
  {
    objc_msgSend(v31, "setRefreshInterval:", v55);
    v11 = 1;
  }
  if (v18)
  {
    -[CUIKSubscribedCalendarManager shutdownDAForAccountUpdates](self, "shutdownDAForAccountUpdates");
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __156__CUIKSubscribedCalendarManager__updateAccount_inAccountStore_withCalendar_oldAccount_newAccountDirty_newUsername_newPassword_newAllowsInsecureConnections___block_invoke;
    v65[3] = &unk_1E6EB5AE0;
    v66 = v18;
    v67 = self;
    v68 = v15;
    v69 = v16;
    v70 = v11;
    objc_msgSend(v69, "removeAccount:withCompletionHandler:", v66, v65);

  }
  else
  {
    -[CUIKSubscribedCalendarManager _saveAccount:inStore:updated:](self, "_saveAccount:inStore:updated:", v15, v16, v11);
  }

}

void __156__CUIKSubscribedCalendarManager__updateAccount_inAccountStore_withCalendar_oldAccount_newAccountDirty_newUsername_newPassword_newAllowsInsecureConnections___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __156__CUIKSubscribedCalendarManager__updateAccount_inAccountStore_withCalendar_oldAccount_newAccountDirty_newUsername_newPassword_newAllowsInsecureConnections___block_invoke_cold_1(a1);

  }
  objc_msgSend(*(id *)(a1 + 40), "_saveAccount:inStore:updated:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));

}

- (void)_saveAccount:(id)a3 inStore:(id)a4 updated:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  CUIKSubscribedCalendarManager *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a5)
  {
    -[CUIKSubscribedCalendarManager shutdownDAForAccountUpdates](self, "shutdownDAForAccountUpdates");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__CUIKSubscribedCalendarManager__saveAccount_inStore_updated___block_invoke;
    v12[3] = &unk_1E6EB5B08;
    v13 = v8;
    v14 = self;
    objc_msgSend(v9, "saveAccount:withCompletionHandler:", v13, v12);

  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_impl(&dword_1B8A6A000, v10, OS_LOG_TYPE_INFO, "No accounts changes required saving subscribed calendar for account %{public}@", buf, 0xCu);

    }
    -[CUIKSubscribedCalendarManager restartDAAfterAccountUpdates](self, "restartDAAfterAccountUpdates");
  }

}

void __62__CUIKSubscribedCalendarManager__saveAccount_inStore_updated___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __62__CUIKSubscribedCalendarManager__saveAccount_inStore_updated___block_invoke_cold_1(a1);

  }
  objc_msgSend(*(id *)(a1 + 40), "restartDAAfterAccountUpdates");

}

- (id)_createSubcalAccountForCalendar:(id)a3 inAccountStore:(id)a4 newAccountNeedsSaving:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "sourceType") == 2)
  {
    *a5 = 0;
    -[CUIKSubscribedCalendarManager _createCalDAVChildSubCalAccountForCalendar:inAccountStore:](self, "_createCalDAVChildSubCalAccountForCalendar:inAccountStore:", v9, v8);
  }
  else
  {
    *a5 = 1;
    -[CUIKSubscribedCalendarManager _createLocalSubCalAccountForCalendar:inAccountStore:](self, "_createLocalSubCalAccountForCalendar:inAccountStore:", v9, v8);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_createCalDAVChildSubCalAccountForCalendar:(id)a3 inAccountStore:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
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
  id v22;
  dispatch_semaphore_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[3];
  _QWORD v51[5];

  v51[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "source");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "externalID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v37;
    _os_log_impl(&dword_1B8A6A000, v8, OS_LOG_TYPE_DEFAULT, "Adding subscription calendar account to parent account ID %{public}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v7, "accountWithIdentifier:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1C240], "daAccountSubclassWithBackingAccountInfo:", v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v38, "conformsToProtocol:", &unk_1EF207720) & 1) != 0)
  {
    v9 = v38;
    objc_msgSend(v6, "externalIDTag");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setExternalIDTag:", v34);

    }
    -[NSObject mainPrincipal](v9, "mainPrincipal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "calendarHomeURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "appendSlashIfNeeded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "URLByAppendingPathComponent:", v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendSlashIfNeeded");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v50[0] = *MEMORY[0x1E0D0C540];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "stripAttachments"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v14;
    v50[1] = *MEMORY[0x1E0D0C538];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "stripAlarms"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v15;
    v50[2] = *MEMORY[0x1E0D0C558];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "refreshInterval"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v6, "subcalURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D0C568]);

    -[CUIKSubscribedCalendarManager _accountDescriptionForCalendar:](self, "_accountDescriptionForCalendar:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D0C570]);

    -[NSObject subscribedCalendars](v9, "subscribedCalendars");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "mutableCopy");

    if (!v22)
      v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, v31);
    -[NSObject setSubscribedCalendars:](v9, "setSubscribedCalendars:", v22);
    -[CUIKSubscribedCalendarManager shutdownDAForAccountUpdates](self, "shutdownDAForAccountUpdates");
    v23 = dispatch_semaphore_create(0);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy_;
    v48 = __Block_byref_object_dispose_;
    v49 = 0;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke;
    v39[3] = &unk_1E6EB5B30;
    v24 = v23;
    v40 = v24;
    v41 = v7;
    v42 = v36;
    v25 = v31;
    v43 = v25;
    p_buf = &buf;
    objc_msgSend(v41, "saveAccount:withCompletionHandler:", v42, v39);
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    v26 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v26)
    {
      objc_msgSend(v26, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSubcalAccountID:", v27);

      v28 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    }
    else
    {
      v28 = 0;
    }
    v29 = v28;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CUIKSubscribedCalendarManager _createCalDAVChildSubCalAccountForCalendar:inAccountStore:].cold.1();
    v29 = 0;
  }

  return v29;
}

void __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v33 = 0;
    objc_msgSend(v6, "childAccountsForAccount:error:", v7, &v33);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v33;
    v10 = v9;
    if (v8)
    {
      v28 = v9;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
        v15 = *MEMORY[0x1E0D0C528];
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v17, "objectForKeyedSubscript:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "isEqualToString:", *(_QWORD *)(a1 + 56)))
            {
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v17);

              goto LABEL_16;
            }

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          if (v13)
            continue;
          break;
        }
      }
LABEL_16:

      v10 = v28;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        goto LABEL_22;
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    else
    {
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke_cold_1();
    }

LABEL_22:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

    goto LABEL_23;
  }
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke_cold_3();

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_23:

}

- (id)_createLocalSubCalAccountForCalendar:(id)a3 inAccountStore:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F140]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v7);
    -[CUIKSubscribedCalendarManager _accountDescriptionForCalendar:](self, "_accountDescriptionForCalendar:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccountDescription:", v9);

    objc_msgSend(v8, "setSupportsAuthentication:", 1);
    objc_msgSend(v8, "setAuthenticated:", 1);
    objc_msgSend(v8, "setEnabled:forDataclass:", 1, *MEMORY[0x1E0C8F378]);
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubcalAccountID:", v10);

    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v12;
      _os_log_impl(&dword_1B8A6A000, v11, OS_LOG_TYPE_DEFAULT, "Creating local subscription calendar account ID %{public}@", (uint8_t *)&v21, 0xCu);

    }
  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CUIKSubscribedCalendarManager _createLocalSubCalAccountForCalendar:inAccountStore:].cold.1(v11, v13, v14, v15, v16, v17, v18, v19);
    v8 = 0;
  }

  return v8;
}

- (id)_accountDescriptionForCalendar:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "subcalURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D0C3C0], "hostStringFromURL:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }

  return v4;
}

- (void)updateOrCreateAccountWithCalendar:previousAccountID:newUsername:newPassword:newAllowsInsecureConnections:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, v0, v1, "Unable to find account with ID %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateOrCreateAccountWithCalendar:previousAccountID:newUsername:newPassword:newAllowsInsecureConnections:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, v0, v1, "Unable to find previous account with ID %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __156__CUIKSubscribedCalendarManager__updateAccount_inAccountStore_withCalendar_oldAccount_newAccountDirty_newUsername_newPassword_newAllowsInsecureConnections___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B8A6A000, v2, v3, "Failed to remove old subcal account %{public}@; %@",
    v4,
    v5,
    v6,
    v7,
    v8);

  OUTLINED_FUNCTION_5();
}

void __62__CUIKSubscribedCalendarManager__saveAccount_inStore_updated___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B8A6A000, v2, v3, "Failed to save subcal account %{public}@; %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_createCalDAVChildSubCalAccountForCalendar:inAccountStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, v0, v1, "The parent account for the subscribed calendar (%@) does not appear to be a CalDAV account. This is not going to work.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, v0, v1, "Error fetching child accounts after updating parent CalDAVAccount: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, a1, a3, "No child account found after updating parent", a5, a6, a7, a8, 0);
}

void __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, v0, v1, "Error saving parent CalDAV account while adding subscription calendar: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_createLocalSubCalAccountForCalendar:(uint64_t)a3 inAccountStore:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, a1, a3, "Couldn't get subscribed calendar account type; won't create account",
    a5,
    a6,
    a7,
    a8,
    0);
}

@end
