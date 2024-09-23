@implementation LKLogEventController

+ (id)loginDetailsPredicate
{
  if (loginDetailsPredicate_onceToken != -1)
    dispatch_once(&loginDetailsPredicate_onceToken, &__block_literal_global);
  return (id)loginDetailsPredicate_predicate;
}

void __45__LKLogEventController_loginDetailsPredicate__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("((senderImagePath contains \"UserManagement\") and (message contains \"Tell server\"))"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v1;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("((senderImagePath contains \"Security\") and (message contains \"ItemAdd\")) OR ((subsystem contains \"com.apple.securityd\") AND (category contains \"item\"))"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v2;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("((subsystem contains \"com.apple.purplebuddy\") and (message contains \"EMCS\"))"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("((subsystem contains \"com.apple.FrontBoard\") and (message contains \"Startup transition\"))"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "orPredicateWithSubpredicates:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)loginDetailsPredicate_predicate;
  loginDetailsPredicate_predicate = v6;

}

- (LKLogEventController)init
{
  LKLogEventController *v2;
  uint64_t v3;
  NSMutableArray *switchOperationsMutableArray;
  uint64_t v5;
  LKSwitchOperation *switchOperation;
  uint64_t v7;
  NSMutableDictionary *mutableKeychainItemsAddedByActivityID;
  id logEventHandler;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LKLogEventController;
  v2 = -[LKLogEventController init](&v11, sel_init);
  if (v2)
  {
    LKRegisterLoginKitLogging();
    v3 = objc_opt_new();
    switchOperationsMutableArray = v2->_switchOperationsMutableArray;
    v2->_switchOperationsMutableArray = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    switchOperation = v2->_switchOperation;
    v2->_switchOperation = (LKSwitchOperation *)v5;

    v7 = objc_opt_new();
    mutableKeychainItemsAddedByActivityID = v2->_mutableKeychainItemsAddedByActivityID;
    v2->_mutableKeychainItemsAddedByActivityID = (NSMutableDictionary *)v7;

    logEventHandler = v2->_logEventHandler;
    v2->_logEventHandler = 0;

  }
  return v2;
}

- (id)logEventHandler
{
  id logEventHandler;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;

  logEventHandler = self->_logEventHandler;
  if (!logEventHandler)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __39__LKLogEventController_logEventHandler__block_invoke;
    v7[3] = &unk_24D59AC10;
    objc_copyWeak(&v8, &location);
    v4 = (void *)MEMORY[0x2199FBC14](v7);
    v5 = self->_logEventHandler;
    self->_logEventHandler = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    logEventHandler = self->_logEventHandler;
  }
  return (id)MEMORY[0x2199FBC14](logEventHandler, a2);
}

void __39__LKLogEventController_logEventHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "streamingLogs")
      && (objc_msgSend(v3, "date"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "logEnumarationEndTime"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v6, "compare:", v7),
          v7,
          v6,
          v8 == 1))
    {
      objc_msgSend(v5, "dynamicdsema");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = LKLogDefault;
        if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_2167FC000, v10, OS_LOG_TYPE_DEFAULT, "LoginDetails: Login Ended", v12, 2u);
        }
        objc_msgSend(v5, "dynamicdsema");
        v11 = objc_claimAutoreleasedReturnValue();
        dispatch_semaphore_signal(v11);

      }
    }
    else
    {
      if (objc_msgSend(v3, "loggedByFramework:", CFSTR("UserManagement")))
      {
        objc_msgSend(v5, "_parseUserManagementFrameworkLog:", v3);
      }
      else if (objc_msgSend(v3, "loggedByProcess:", CFSTR("budd")))
      {
        objc_msgSend(v5, "_parseBuddLog:", v3);
      }
      else if (objc_msgSend(v3, "loggedByProcess:", CFSTR("SpringBoard")))
      {
        objc_msgSend(v5, "_parseSpringBoardLog:", v3);
      }
      if (objc_msgSend(v5, "_needToParseSecurityLogs")
        && objc_msgSend(v5, "_isKeychainLog:", v3))
      {
        objc_msgSend(v5, "_parseKeychainLog:", v3);
      }
    }
  }

}

- (void)_parseBuddLog:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "containsMessage:", CFSTR("Buddy: Starting EMCS Recovery...")))
  {
    v5 = LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2167FC000, v5, OS_LOG_TYPE_DEFAULT, "LoginDetails: EMCS Recovery started", buf, 2u);
    }
    v6 = (void *)objc_opt_new();
    objc_msgSend(v4, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStartTime:", v7);

    -[LKLogEventController switchOperation](self, "switchOperation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRecoverEMCSOperation:", v6);
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "containsMessage:", CFSTR("Buddy: EMCS recovery completed")))
  {
    -[LKLogEventController switchOperation](self, "switchOperation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recoverEMCSOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = LKLogDefault;
    v11 = os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT);
    if (!v6)
    {
      if (v11)
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_2167FC000, v10, OS_LOG_TYPE_DEFAULT, "We should have a start of recover EMCS recovery. We shouldn't end up here.", v14, 2u);
      }
      goto LABEL_11;
    }
    if (v11)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2167FC000, v10, OS_LOG_TYPE_DEFAULT, "LoginDetails: EMCS Recovery ended", v15, 2u);
    }
    objc_msgSend(v4, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEndTime:", v12);

    objc_msgSend(v6, "endTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v13);
    objc_msgSend(v6, "setDuration:");

LABEL_10:
LABEL_11:

  }
}

- (void)_parseSpringBoardLog:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v4 = objc_msgSend(v25, "containsMessage:", CFSTR("Startup transition completed."));
  v5 = v25;
  if (!v4)
    goto LABEL_9;
  objc_msgSend(v25, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LKLogEventController switchOperation](self, "switchOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEndTime:", v6);

  -[LKLogEventController switchOperation](self, "switchOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endTime");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_5;
  v10 = (void *)v9;
  -[LKLogEventController switchOperation](self, "switchOperation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[LKLogEventController switchOperation](self, "switchOperation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKLogEventController switchOperation](self, "switchOperation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v15);
    v17 = v16;
    -[LKLogEventController switchOperation](self, "switchOperation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDuration:", v17);

LABEL_5:
  }
  -[LKLogEventController switchOperation](self, "switchOperation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "switchType");

  if (v20)
  {
    -[LKLogEventController switchOperationsMutableArray](self, "switchOperationsMutableArray");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKLogEventController switchOperation](self, "switchOperation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v23);

  }
  v24 = (void *)objc_opt_new();
  -[LKLogEventController setSwitchOperation:](self, "setSwitchOperation:", v24);

  v5 = v25;
LABEL_9:

}

- (void)_parseUserManagementFrameworkLog:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (objc_msgSend(v15, "containsMessage:", CFSTR("switch to user")))
  {
    objc_msgSend(v15, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKLogEventController switchOperation](self, "switchOperation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStartTime:", v4);

    -[LKLogEventController switchOperation](self, "switchOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
LABEL_9:
    objc_msgSend(v6, "setSwitchType:", v8);

    goto LABEL_10;
  }
  if (objc_msgSend(v15, "containsMessage:", CFSTR("direct switch to User")))
  {
    objc_msgSend(v15, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKLogEventController switchOperation](self, "switchOperation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStartTime:", v9);

    -[LKLogEventController switchOperation](self, "switchOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 3;
    goto LABEL_9;
  }
  if (objc_msgSend(v15, "containsMessage:", CFSTR("Logout to LoginSession Screen")))
  {
    objc_msgSend(v15, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKLogEventController switchOperation](self, "switchOperation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStartTime:", v11);

    -[LKLogEventController switchOperation](self, "switchOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 2;
    goto LABEL_9;
  }
  if (objc_msgSend(v15, "containsMessage:", CFSTR("switch to login screen")))
  {
    objc_msgSend(v15, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKLogEventController switchOperation](self, "switchOperation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStartTime:", v13);

    -[LKLogEventController switchOperation](self, "switchOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 4;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_parseKeychainLog:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!objc_msgSend(v12, "containsMessage:", CFSTR("SecItemAdd_ios")))
  {
    if (!objc_msgSend(v12, "containsMessage:", CFSTR("inserted <")))
      goto LABEL_11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "activityIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKLogEventController mutableKeychainItemsAddedByActivityID](self, "mutableKeychainItemsAddedByActivityID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v12, "composedMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsString:", CFSTR("vwht=null")) & 1) == 0)
    {
      objc_msgSend(v12, "composedMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsString:", CFSTR("sysb=null"));

      if (!v9)
      {
LABEL_9:
        -[LKLogEventController mutableKeychainItemsAddedByActivityID](self, "mutableKeychainItemsAddedByActivityID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v4);

        goto LABEL_10;
      }
      objc_msgSend(v12, "composedMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setKeychainItemAdded:", v10);

      -[LKLogEventController switchOperation](self, "switchOperation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addKeychainItemAdditionEvent:", v6);
    }

    goto LABEL_9;
  }
  -[LKLogEventController _handleKeychainItemEventFromLogEvent:](self, "_handleKeychainItemEventFromLogEvent:", v12);
LABEL_11:

}

- (BOOL)_isKeychainLog:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "loggedByProcess:", CFSTR("securityd")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "loggedByFramework:", CFSTR("Security"));

  return v4;
}

- (BOOL)_needToParseSecurityLogs
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  -[LKLogEventController switchOperation](self, "switchOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recoverEMCSOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[LKLogEventController switchOperation](self, "switchOperation");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "recoverEMCSOperation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  -[LKLogEventController switchOperation](self, "switchOperation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "switchType") == 2)
  {
    v8 = 1;
  }
  else
  {
    -[LKLogEventController switchOperation](self, "switchOperation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "switchType") == 3;

  }
  if (v6)
  {
    v7 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (void)_handleKeychainItemEventFromLogEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  +[LKLogKeychainItemAdditionEvent eventFromLKLogEvent:](LKLogKeychainItemAdditionEvent, "eventFromLKLogEvent:", v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[LKLogEventController mutableKeychainItemsAddedByActivityID](self, "mutableKeychainItemsAddedByActivityID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = objc_msgSend(v4, "activityIdentifier");

  *(float *)&v8 = (float)v7;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v9);

  -[LKLogEventController switchOperation](self, "switchOperation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recoverEMCSOperation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "startTime");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v11, "endTime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        objc_msgSend(v11, "setRecoveredKeychainItemCount:", objc_msgSend(v11, "recoveredKeychainItemCount") + 1);
    }
  }

}

- (void)enumurateLogEventsSynchronouslyFromDate:(id)a3 predicate:(id)a4 logEventHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  dispatch_semaphore_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BE60C78], "localStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v12 = MEMORY[0x24BDAC760];
  v29 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __90__LKLogEventController_enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler___block_invoke;
  v23[3] = &unk_24D59AC38;
  v23[4] = &v24;
  objc_msgSend(v11, "prepareWithCompletionHandler:", v23);
  v13 = dispatch_semaphore_create(0);
  -[LKLogEventController setDynamicdsema:](self, "setDynamicdsema:", v13);

  -[LKLogEventController setStreamingLogs:](self, "setStreamingLogs:", 1);
  v14 = objc_alloc(MEMORY[0x24BE60C80]);
  v15 = objc_msgSend(v14, "initWithSource:", v25[5]);
  v16 = (void *)enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream;
  enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream = v15;

  objc_msgSend((id)enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream, "setFlags:", 21);
  objc_msgSend((id)enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream, "setFilterPredicate:", v9);
  v17 = (void *)enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream;
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __90__LKLogEventController_enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler___block_invoke_2;
  v21[3] = &unk_24D59AC60;
  v18 = v10;
  v22 = v18;
  objc_msgSend(v17, "setEventHandler:", v21);
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __90__LKLogEventController_enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler___block_invoke_3;
  v20[3] = &unk_24D59AC88;
  v20[4] = self;
  objc_msgSend((id)enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream, "setInvalidationHandler:", v20);
  objc_msgSend((id)enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream, "activateStreamFromDate:", v8);
  -[LKLogEventController dynamicdsema](self, "dynamicdsema");
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v24, 8);
}

void __90__LKLogEventController_enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __90__LKLogEventController_enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = a2;
    v9 = (id)objc_opt_new();
    objc_msgSend(v3, "process");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProcess:", v4);

    objc_msgSend(v3, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDate:", v5);

    objc_msgSend(v3, "composedMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setComposedMessage:", v6);

    objc_msgSend(v3, "sender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSenderImagePath:", v7);

    v8 = objc_msgSend(v3, "activityIdentifier");
    objc_msgSend(v9, "setActivityIdentifier:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __90__LKLogEventController_enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "dynamicdsema");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v1);

}

- (void)enumuratePersistentLogsSynchronouslyFromDate:(id)a3 logArchivePath:(id)a4 predicate:(id)a5 logEventHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setLogArchive:", v11);

  v14 = objc_alloc(MEMORY[0x24BDD14C0]);
  v20[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithType:subpredicates:", 1, v15);
  objc_msgSend(v13, "setPredicate:", v16);

  objc_msgSend(v13, "setOptions:", 3);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __110__LKLogEventController_enumuratePersistentLogsSynchronouslyFromDate_logArchivePath_predicate_logEventHandler___block_invoke;
  v18[3] = &unk_24D59ACB0;
  v19 = v9;
  v17 = v9;
  objc_msgSend(v13, "enumerateFromStartDate:toEndDate:withBlock:", v12, 0, v18);

}

uint64_t __110__LKLogEventController_enumuratePersistentLogsSynchronouslyFromDate_logArchivePath_predicate_logEventHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = a2;
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "process");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProcess:", v5);

    objc_msgSend(v3, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDate:", v6);

    objc_msgSend(v3, "eventMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setComposedMessage:", v7);

    objc_msgSend(v3, "sender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSenderImagePath:", v8);

    v9 = objc_msgSend(v3, "activityID");
    objc_msgSend(v4, "setActivityIdentifier:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  return 1;
}

- (id)loginDetailsWithStartDate:(id)a3 logArchivePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "loginDetailsPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKLogEventController logEventHandler](self, "logEventHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKLogEventController enumuratePersistentLogsSynchronouslyFromDate:logArchivePath:predicate:logEventHandler:](self, "enumuratePersistentLogsSynchronouslyFromDate:logArchivePath:predicate:logEventHandler:", v7, v6, v8, v9);
  }
  else
  {
    v10 = (void *)objc_opt_new();
    -[LKLogEventController setLogEnumarationEndTime:](self, "setLogEnumarationEndTime:", v10);

    objc_msgSend((id)objc_opt_class(), "loginDetailsPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKLogEventController logEventHandler](self, "logEventHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKLogEventController enumurateLogEventsSynchronouslyFromDate:predicate:logEventHandler:](self, "enumurateLogEventsSynchronouslyFromDate:predicate:logEventHandler:", v7, v8, v9);
  }

  -[LKLogEventController switchOperationsMutableArray](self, "switchOperationsMutableArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

- (NSMutableArray)switchOperationsMutableArray
{
  return self->_switchOperationsMutableArray;
}

- (void)setSwitchOperationsMutableArray:(id)a3
{
  objc_storeStrong((id *)&self->_switchOperationsMutableArray, a3);
}

- (NSMutableDictionary)mutableKeychainItemsAddedByActivityID
{
  return self->_mutableKeychainItemsAddedByActivityID;
}

- (void)setMutableKeychainItemsAddedByActivityID:(id)a3
{
  objc_storeStrong((id *)&self->_mutableKeychainItemsAddedByActivityID, a3);
}

- (LKSwitchOperation)switchOperation
{
  return self->_switchOperation;
}

- (void)setSwitchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_switchOperation, a3);
}

- (OS_dispatch_semaphore)dynamicdsema
{
  return self->_dynamicdsema;
}

- (void)setDynamicdsema:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicdsema, a3);
}

- (NSDate)logEnumarationEndTime
{
  return self->_logEnumarationEndTime;
}

- (void)setLogEnumarationEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_logEnumarationEndTime, a3);
}

- (BOOL)streamingLogs
{
  return self->_streamingLogs;
}

- (void)setStreamingLogs:(BOOL)a3
{
  self->_streamingLogs = a3;
}

- (void)setLogEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_logEventHandler, 0);
  objc_storeStrong((id *)&self->_logEnumarationEndTime, 0);
  objc_storeStrong((id *)&self->_dynamicdsema, 0);
  objc_storeStrong((id *)&self->_switchOperation, 0);
  objc_storeStrong((id *)&self->_mutableKeychainItemsAddedByActivityID, 0);
  objc_storeStrong((id *)&self->_switchOperationsMutableArray, 0);
}

@end
