@implementation CalDAVAccountPropertyRefreshOperation

- (CalDAVAccountPropertyRefreshOperation)initWithPrincipal:(id)a3
{
  CalDAVAccountPropertyRefreshOperation *v3;
  dispatch_group_t v4;
  OS_dispatch_group *defaultAlarmGroup;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalDAVAccountPropertyRefreshOperation;
  v3 = -[CalDAVOperation initWithPrincipal:](&v7, sel_initWithPrincipal_, a3);
  if (v3)
  {
    v4 = dispatch_group_create();
    defaultAlarmGroup = v3->_defaultAlarmGroup;
    v3->_defaultAlarmGroup = (OS_dispatch_group *)v4;

  }
  return v3;
}

- (id)propPatchForProperty:(id)a3 value:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x24BE1AB18];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithNameSpace:andName:", *MEMORY[0x24BE1ACF8], v7);

  objc_msgSend(v9, "setPayloadAsString:", v6);
  objc_msgSend(v9, "setUseCDATA:", 1);
  return v9;
}

- (void)sendLocallyChangedPropertiesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;
  id from;
  id location;

  v3 = (void *)objc_opt_new();
  -[CalDAVOperation principal](self, "principal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_7;
  -[CalDAVOperation principal](self, "principal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "needsDefaultTimedAlarmUpdate") & 1) == 0)
  {

    goto LABEL_7;
  }
  -[CalDAVOperation principal](self, "principal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CalDAVOperation principal](self, "principal");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "defaultTimedAlarms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVAccountPropertyRefreshOperation propPatchForProperty:value:](self, "propPatchForProperty:value:", CFSTR("default-alarm-vevent-datetime"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

    -[CalDAVOperation principal](self, "principal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CalDAVOperation principal](self, "principal");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setNeedsDefaultTimedAlarmUpdate:", 0);
LABEL_7:

    }
  }
  -[CalDAVOperation principal](self, "principal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  -[CalDAVOperation principal](self, "principal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "needsDefaultAllDayAlarmUpdate") & 1) == 0)
  {

    goto LABEL_14;
  }
  -[CalDAVOperation principal](self, "principal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[CalDAVOperation principal](self, "principal");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "defaultAllDayAlarms");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVAccountPropertyRefreshOperation propPatchForProperty:value:](self, "propPatchForProperty:value:", CFSTR("default-alarm-vevent-date"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

    -[CalDAVOperation principal](self, "principal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[CalDAVOperation principal](self, "principal");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNeedsDefaultAllDayAlarmUpdate:", 0);
      goto LABEL_14;
    }
  }
LABEL_15:
  if (objc_msgSend(v3, "count"))
  {
    v20 = objc_alloc(MEMORY[0x24BE1ABA8]);
    -[CalDAVOperation principal](self, "principal");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "calendarHomeURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithPropertiesToSet:andRemove:atURL:", v3, 0, v22);

    -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAccountInfoProvider:", v24);

    objc_initWeak(&location, self);
    objc_initWeak(&from, v23);
    dispatch_group_enter((dispatch_group_t)self->_defaultAlarmGroup);
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __77__CalDAVAccountPropertyRefreshOperation_sendLocallyChangedPropertiesIfNeeded__block_invoke;
    v30 = &unk_24C1FB248;
    objc_copyWeak(&v31, &location);
    objc_copyWeak(&v32, &from);
    objc_msgSend(v23, "setCompletionBlock:", &v27);
    -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks", v27, v28, v29, v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v23);

    -[CoreDAVTaskGroup taskManager](self, "taskManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "submitQueuedCoreDAVTask:", v23);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

void __77__CalDAVAccountPropertyRefreshOperation_sendLocallyChangedPropertiesIfNeeded__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2)
  {
    objc_msgSend(WeakRetained, "outstandingTasks");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v2);

  }
  v4 = WeakRetained[14];
  if (v4)
    dispatch_group_leave(v4);

}

- (void)refreshProperties
{
  NSObject *defaultAlarmGroup;
  _QWORD block[5];

  -[CalDAVAccountPropertyRefreshOperation sendLocallyChangedPropertiesIfNeeded](self, "sendLocallyChangedPropertiesIfNeeded");
  defaultAlarmGroup = self->_defaultAlarmGroup;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CalDAVAccountPropertyRefreshOperation_refreshProperties__block_invoke;
  block[3] = &unk_24C1FB270;
  block[4] = self;
  dispatch_group_notify(defaultAlarmGroup, MEMORY[0x24BDAC9B8], block);
}

void *__58__CalDAVAccountPropertyRefreshOperation_refreshProperties__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (!*((_BYTE *)result + (int)*MEMORY[0x24BE1AC88]))
    return (void *)objc_msgSend(result, "_reallyRefreshProperties");
  return result;
}

- (void)_reallyRefreshProperties
{
  CalDAVGetAccountPropertiesTaskGroup *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CalDAVGetAccountPropertiesTaskGroup *v10;

  v3 = [CalDAVGetAccountPropertiesTaskGroup alloc];
  -[CalDAVOperation principal](self, "principal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CoreDAVGetAccountPropertiesTaskGroup initWithAccountInfoProvider:taskManager:](v3, "initWithAccountInfoProvider:taskManager:", v4, v5);

  -[CoreDAVTaskGroup setDelegate:](v10, "setDelegate:", self);
  -[CalDAVOperation principal](self, "principal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isDelegate");

  if ((_DWORD)v4)
  {
    -[CalDAVOperation principal](self, "principal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "principalURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVGetAccountPropertiesTaskGroup setDelegatePrincipalURL:](v10, "setDelegatePrincipalURL:", v8);

  }
  -[CoreDAVGetAccountPropertiesTaskGroup setFetchPrincipalSearchProperties:](v10, "setFetchPrincipalSearchProperties:", -[CalDAVAccountPropertyRefreshOperation fetchPrincipalSearchProperties](self, "fetchPrincipalSearchProperties"));
  -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  -[CalDAVGetAccountPropertiesTaskGroup startTaskGroup](v10, "startTaskGroup");
}

- (void)getAccountPropertiesTask:(id)a3 completedWithError:(id)a4
{
  id v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v6 = a4;
  -[CalDAVOperation outstandingTaskGroups](self, "outstandingTaskGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v36);

  -[CalDAVOperation principal](self, "principal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    -[CalDAVAccountPropertyRefreshOperation _finishCalDAVAccountPropertyRefreshOperationWithError:](self, "_finishCalDAVAccountPropertyRefreshOperationWithError:", v6);
  }
  else
  {
    objc_msgSend(v8, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "collections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCollectionSetURL:", v12);

    objc_msgSend(v36, "serverVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setServerVersion:", v13);

    objc_msgSend(v36, "principalSearchProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalDAVPrincipalSearchPropertySet searchSetWithProperties:](CalDAVPrincipalSearchPropertySet, "searchSetWithProperties:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSearchPropertySet:", v15);

    v16 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v36, "calendarHomes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "anyObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendSlashIfNeeded");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLWithString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCalendarHomeURL:", v21);

    objc_msgSend(v36, "inboxURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInboxURL:", v22);

    objc_msgSend(v36, "outboxURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOutboxURL:", v23);

    objc_msgSend(v36, "dropboxURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDropBoxURL:", v24);

    objc_msgSend(v36, "notificationURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNotificationCollectionURL:", v25);

    objc_msgSend(v36, "displayName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFullName:", v26);

    objc_msgSend(v9, "setSupportsCalendarUserSearch:", objc_msgSend(v36, "supportsCalendarUserSearch"));
    if ((objc_msgSend(v36, "isExpandPropertyReportSupported") & 1) != 0)
    {
      objc_msgSend(v36, "serverVersion");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIsExpandPropertyReportSupported:", objc_msgSend(v27, "expandPropertyReportIsUnreliable") ^ 1);

    }
    else
    {
      objc_msgSend(v9, "setIsExpandPropertyReportSupported:", 0);
    }
    objc_msgSend(v36, "preferredUserAddresses");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreferredCalendarUserAddresses:", v28);

    v29 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v36, "principalURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "absoluteString");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v31, "appendSlashIfNeeded");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "URLWithString:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "principalURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v31) = objc_msgSend(v34, "isEqual:", v33);

    if ((v31 & 1) == 0)
    {
      objc_msgSend(v10, "password");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPrincipalURL:", v33);
      objc_msgSend(v10, "setPassword:", v35);

    }
    if (-[CalDAVAccountPropertyRefreshOperation shouldRefreshDefaultAlarms](self, "shouldRefreshDefaultAlarms"))
      -[CalDAVAccountPropertyRefreshOperation _refreshDefaultAlarms](self, "_refreshDefaultAlarms");
    else
      -[CalDAVAccountPropertyRefreshOperation _finishCalDAVAccountPropertyRefreshOperationWithError:](self, "_finishCalDAVAccountPropertyRefreshOperationWithError:", 0);

  }
}

- (BOOL)shouldRefreshDefaultAlarms
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CalDAVOperation principal](self, "principal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serverVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "supportsDefaultAlarms");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_refreshDefaultAlarms
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];

  -[CalDAVOperation principal](self, "principal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarHomeURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[CalDAVAccountPropertyRefreshOperation _copyHomePropertiesPropFindElements](self, "_copyHomePropertiesPropFindElements");
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1ABA0]), "initWithPropertiesToFind:atURL:withDepth:", v5, v4, 2);
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC90]), "addObject:", v6);
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "setAccountInfoProvider:", v3);
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC98]));
    objc_msgSend(WeakRetained, "submitQueuedCoreDAVTask:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logHandleForAccountInfoProvider:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2096EB000, v10, OS_LOG_TYPE_ERROR, "Skipping default alarm refresh because there is no home URL", v11, 2u);
    }

    -[CalDAVAccountPropertyRefreshOperation _finishCalDAVAccountPropertyRefreshOperationWithError:](self, "_finishCalDAVAccountPropertyRefreshOperationWithError:", 0);
  }

}

- (id)_copyHomePropertiesPropFindElements
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = *MEMORY[0x24BE1ACF8];
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ACF8], CFSTR("default-alarm-vevent-datetime"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v3, CFSTR("default-alarm-vevent-date"), objc_opt_class());
  return v2;
}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  CalDAVAccountPropertyRefreshOperation *v29;
  id v30;
  id obj;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CalDAVOperation principal](self, "principal");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v10)
  {
    v28 = (void *)v11;
    v29 = self;
    v30 = v8;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v9;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v16)
    {
      v17 = v16;
      v10 = 0;
      v32 = *(_QWORD *)v35;
      v33 = 0;
      v18 = *MEMORY[0x24BE1ACF8];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v35 != v32)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "successfulPropertiesToValues");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "CDVObjectForKeyWithNameSpace:andName:", v18, CFSTR("default-alarm-vevent-datetime"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            objc_msgSend(v21, "payloadAsString");
            v23 = objc_claimAutoreleasedReturnValue();

            v10 = (id)v23;
          }
          objc_msgSend(v20, "CDVObjectForKeyWithNameSpace:andName:", v18, CFSTR("default-alarm-vevent-date"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v24, "payloadAsString");
            v26 = v10;
            v27 = objc_claimAutoreleasedReturnValue();

            v33 = (void *)v27;
            v10 = v26;
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v17);
    }
    else
    {
      v33 = 0;
      v10 = 0;
    }

    v12 = v28;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v28, "setDefaultTimedAlarms:", v10);
    v8 = v30;
    self = v29;
    v13 = v33;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v28, "setDefaultAllDayAlarms:", v33);
    goto LABEL_24;
  }
  if (!-[CalDAVAccountPropertyRefreshOperation shouldKeepDefaultAlarmError:](self, "shouldKeepDefaultAlarmError:", v10))
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logHandleForAccountInfoProvider:", 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v10;
      _os_log_impl(&dword_2096EB000, v15, OS_LOG_TYPE_ERROR, "Fetching default alarms failed. Ignoring and moving on. The error was %@", buf, 0xCu);
    }

LABEL_24:
    v10 = 0;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC90]), "removeObject:", v8);
  -[CalDAVAccountPropertyRefreshOperation _finishCalDAVAccountPropertyRefreshOperationWithError:](self, "_finishCalDAVAccountPropertyRefreshOperationWithError:", v10);

}

- (BOOL)shouldKeepDefaultAlarmError:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD1308]);

  return v4;
}

- (void)_finishCalDAVAccountPropertyRefreshOperationWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __95__CalDAVAccountPropertyRefreshOperation__finishCalDAVAccountPropertyRefreshOperationWithError___block_invoke;
  v6[3] = &unk_24C1FB298;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v5, v6);

}

void __95__CalDAVAccountPropertyRefreshOperation__finishCalDAVAccountPropertyRefreshOperationWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "principal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyRefreshForPrincipal:completedWithError:", v2, *(_QWORD *)(a1 + 40));

}

- (BOOL)fetchPrincipalSearchProperties
{
  return self->_fetchPrincipalSearchProperties;
}

- (void)setFetchPrincipalSearchProperties:(BOOL)a3
{
  self->_fetchPrincipalSearchProperties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAlarmGroup, 0);
}

@end
