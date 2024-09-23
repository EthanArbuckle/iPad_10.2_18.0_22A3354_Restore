@implementation _DASLogExtractor

+ (id)extractorForArchive:(id)a3
{
  id v3;
  _DASLogExtractor *v4;

  v3 = a3;
  v4 = -[_DASLogExtractor initWithArchive:]([_DASLogExtractor alloc], "initWithArchive:", v3);

  return v4;
}

- (_DASLogExtractor)initWithArchive:(id)a3
{
  id v4;
  _DASLogExtractor *v5;
  NSDateFormatter *v6;
  NSDateFormatter *dateFormatter;
  NSString *subsystem;
  uint64_t v9;
  OSLogEventStore *logStore;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_DASLogExtractor;
  v5 = -[_DASLogExtractor init](&v12, sel_init);
  if (v5)
  {
    v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v5->_dateFormatter;
    v5->_dateFormatter = v6;

    subsystem = v5->_subsystem;
    v5->_subsystem = (NSString *)CFSTR("com.apple.duetactivityscheduler");

    -[NSDateFormatter setDateFormat:](v5->_dateFormatter, "setDateFormat:", CFSTR("y-MM-dd-HH-mm-ss.SSS-z"));
    if (v4)
      objc_msgSend(MEMORY[0x24BE60C78], "storeWithArchiveURL:", v4);
    else
      objc_msgSend(MEMORY[0x24BE60C78], "localStore");
    v9 = objc_claimAutoreleasedReturnValue();
    logStore = v5->_logStore;
    v5->_logStore = (OSLogEventStore *)v9;

    -[OSLogEventStore setUpgradeConfirmationHandler:](v5->_logStore, "setUpgradeConfirmationHandler:", &__block_literal_global_122);
  }

  return v5;
}

- (id)getDefaultFilterPredicate
{
  if (getDefaultFilterPredicate_onceToken != -1)
    dispatch_once(&getDefaultFilterPredicate_onceToken, &__block_literal_global_123);
  return (id)getDefaultFilterPredicate_subpredicates;
}

- (int)handleLogEventsLogEvents:(id)a3 sinceDate:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OSLogEventStore *logStore;
  id v12;
  id v13;
  id v14;
  int v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  _DASLogExtractor *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  logStore = self->_logStore;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67___DASLogExtractor_handleLogEventsLogEvents_sinceDate_withHandler___block_invoke;
  v17[3] = &unk_24E138890;
  v17[4] = self;
  v12 = v8;
  v18 = v12;
  v22 = self;
  v13 = v10;
  v20 = v13;
  v14 = v9;
  v19 = v14;
  v21 = &v23;
  -[OSLogEventStore prepareWithCompletionHandler:](logStore, "prepareWithCompletionHandler:", v17);
  v15 = *((_DWORD *)v24 + 6);

  _Block_object_dispose(&v23, 8);
  return v15;
}

- (id)getScheduledBlocksOfMessages:(id)a3 forActivity:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    v27 = 0;
    goto LABEL_27;
  }
  v25 = v6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = v5;
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v8)
  {
    v10 = 0;
    goto LABEL_24;
  }
  v9 = v8;
  v10 = 0;
  v11 = 1;
  v12 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v29 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      if ((v11 & 1) != 0)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "message");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "containsString:", CFSTR("Submitted Activity:")))
        {

LABEL_11:
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v18 = objc_claimAutoreleasedReturnValue();
          v11 = 0;
          goto LABEL_18;
        }
        objc_msgSend(v14, "message");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsString:", CFSTR("SUBMITTING:"));

        if (v17)
          goto LABEL_11;
      }
      objc_msgSend(v14, "message");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "containsString:", CFSTR("COMPLETED")))
      {

      }
      else
      {
        objc_msgSend(v14, "message");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "containsString:", CFSTR("CANCELED"));

        if (!v21)
          goto LABEL_19;
      }
      objc_msgSend(v10, "addObject:", v14);
      if (objc_msgSend(v10, "count"))
      {
        v22 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v27, "addObject:", v22);

      }
      v18 = 0;
      v11 = 1;
LABEL_18:

      v10 = (void *)v18;
LABEL_19:
      objc_msgSend(v10, "addObject:", v14);
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v9);
LABEL_24:

  v6 = v25;
  if (objc_msgSend(v10, "count"))
  {
    v23 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v27, "addObject:", v23);

  }
  v5 = v26;
LABEL_27:

  return v27;
}

- (id)getScheduledBlocksOfBARMessages:(id)a3 forApplication:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    v25 = 0;
    goto LABEL_21;
  }
  v23 = v6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v24 = v5;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v9)
    goto LABEL_17;
  v10 = v9;
  v11 = *(_QWORD *)v27;
  v12 = 1;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
      if ((v12 & 1) != 0
        && (objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v13), "message"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "containsString:", CFSTR("Setting process visibility to: Background")),
            v15,
            v16))
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v17 = objc_claimAutoreleasedReturnValue();
        v12 = 0;
      }
      else
      {
        objc_msgSend(v14, "message");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "containsString:", CFSTR("Setting process visibility to: Foreground"));

        if (!v19)
          goto LABEL_15;
        objc_msgSend(v7, "addObject:", v14);
        if (objc_msgSend(v7, "count"))
        {
          v20 = (void *)objc_msgSend(v7, "copy");
          objc_msgSend(v25, "addObject:", v20);

        }
        v17 = 0;
        v12 = 1;
      }

      v7 = (void *)v17;
LABEL_15:
      objc_msgSend(v7, "addObject:", v14);
      ++v13;
    }
    while (v10 != v13);
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v10);
LABEL_17:

  if (objc_msgSend(v7, "count"))
  {
    v21 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v25, "addObject:", v21);

  }
  v6 = v23;
  v5 = v24;
LABEL_21:

  return v25;
}

- (id)getMessagesBeforeRunning:(id)a3 forActivity:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  id v25;
  int v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v29 = *(_QWORD *)v31;
LABEL_3:
    v12 = 0;
    v28 = v9;
    while (1)
    {
      if (*(_QWORD *)v31 != v29)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
      objc_msgSend(v13, "message");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "containsString:", v15) & 1) == 0)
        break;
      v16 = v11;
      v17 = v7;
      v18 = v6;
      objc_msgSend(v13, "message");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "containsString:", CFSTR("Submitted:")))
      {

        v6 = v18;
        v7 = v17;
        v11 = v16;
        v9 = v28;
      }
      else
      {
        objc_msgSend(v13, "message");
        v20 = v10;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v21, "containsString:", CFSTR("SUBMITTING:"));

        v10 = v20;
        v6 = v18;
        v7 = v17;
        v11 = v16;
        v9 = v28;
        if (!v27)
          goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v22 = objc_claimAutoreleasedReturnValue();

      v10 = 1;
      v11 = (void *)v22;
LABEL_16:
      objc_msgSend(v11, "addObject:", v13);
      if (v9 == ++v12)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_21;
      }
    }

LABEL_12:
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v13, "message");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "containsString:", CFSTR("Running activities :"));

      if ((v24 & 1) != 0)
      {
        objc_msgSend(v11, "addObject:", v13);
        v25 = v11;

        goto LABEL_22;
      }
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
    goto LABEL_16;
  }
  v11 = 0;
LABEL_21:

  v25 = v11;
LABEL_22:

  return v25;
}

- (id)getAllBARActivityNames:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "message");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "containsString:", CFSTR("Submitted Activity: <_DASActivity: \"bgRefresh-")))
        {
          objc_msgSend(v9, "message");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "containsString:", CFSTR("widget"));

          if ((v12 & 1) != 0)
            continue;
          objc_msgSend(v9, "message");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          getSubstring(v13, CFSTR("Submitted: <_DASActivity: \"), CFSTR("\", Background,"), 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
            objc_msgSend(v15, "addObject:", v10);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v15;
}

- (id)getAllPushLaunchActivityNames:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  id v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = CFSTR("Submitted: <_DASActivity: ");
    v8 = *(_QWORD *)v25;
    v9 = CFSTR("widget");
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "message", v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "containsString:", v7))
        {
          objc_msgSend(v11, "message");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "containsString:", v9))
          {

          }
          else
          {
            objc_msgSend(v11, "message");
            v14 = v6;
            v15 = v8;
            v16 = v7;
            v17 = v4;
            v18 = v9;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v19, "containsString:", CFSTR("pushLaunch"));

            v9 = v18;
            v4 = v17;
            v7 = v16;
            v8 = v15;
            v6 = v14;

            if (!v23)
              continue;
            objc_msgSend(v11, "message");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            getSubstring(v20, CFSTR("Submitted: <_DASActivity: \"), CFSTR("\", Maintenance,"), 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
              objc_msgSend(v22, "addObject:", v12);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  return v22;
}

- (id)getMessagesWhenAppBackgroundSwitch:(id)a3 forApplication:(id)a4 switchTo:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "message");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Setting process visibility to: %@"), v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "containsString:", v15);

        if ((v16 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v13);
          v18 = v19;

          v17 = v18;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
        continue;
      break;
    }
  }
  v17 = 0;
  v18 = v8;
LABEL_11:

  return v17;
}

- (id)getMessagesForAllBARTasks:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  unint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  id obj;
  id v25;
  int v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0x24BDD1000uLL;
    v8 = *(_QWORD *)v30;
    v9 = CFSTR("bgRefresh-");
    v22 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      v23 = v6;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        objc_msgSend(v11, "message");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v7 + 1992), "stringWithFormat:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "containsString:", v13);
        if (v14)
        {
          objc_msgSend(v11, "message");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v3, "containsString:", CFSTR("widget")) & 1) == 0)
          {

LABEL_17:
            objc_msgSend(v25, "addObject:", v11);
            goto LABEL_18;
          }
        }
        v27 = v12;
        v28 = v3;
        objc_msgSend(v11, "message");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v7 + 1992), "stringWithFormat:", CFSTR("Timeline for "));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "containsString:", v16) & 1) != 0)
        {
          v26 = 1;
        }
        else
        {
          objc_msgSend(v11, "message");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v7 + 1992), "stringWithFormat:", CFSTR("pushLaunch"));
          v18 = v9;
          v19 = v7;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v17, "containsString:", v20);

          v7 = v19;
          v9 = v18;
          v6 = v23;

          v8 = v22;
        }

        if (v14)
        {
          v3 = v28;

          if ((v26 & 1) != 0)
            goto LABEL_17;
        }
        else
        {

          v3 = v28;
          if (v26)
            goto LABEL_17;
        }
LABEL_18:
        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v6);
  }

  return v25;
}

- (id)getMessagesForBARLifecycle:(id)a3 forApplication:(id)a4 queryStatus:(id)a5 taskType:(id)a6
{
  id v9;
  id v10;
  id v11;
  const __CFString *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  const __CFString *v24;
  void *v25;
  void *v27;
  id v28;
  id v29;
  int v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v27 = v11;
  if ((objc_msgSend(v11, "isEqual:", CFSTR("Submitted")) & 1) != 0)
  {
    v12 = CFSTR("Submitted: <_DASActivity: ");
  }
  else if ((objc_msgSend(v11, "isEqual:", CFSTR("Completed"), v11) & 1) != 0)
  {
    v12 = CFSTR("COMPLETED ");
  }
  else if ((objc_msgSend(v11, "isEqual:", CFSTR("Prediction")) & 1) != 0)
  {
    v12 = CFSTR("Timeline for ");
  }
  else
  {
    NSLog(CFSTR("Unsupported input."));
    v12 = 0;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v18, "message", v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "containsString:", v10) & 1) == 0)
          goto LABEL_18;
        objc_msgSend(v18, "message");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "containsString:", v12) & 1) == 0)
        {

LABEL_18:
          continue;
        }
        objc_msgSend(v18, "message");
        v21 = v16;
        v22 = v10;
        v23 = v13;
        v24 = v12;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v25, "containsString:", v29);

        v12 = v24;
        v13 = v23;
        v10 = v22;
        v16 = v21;

        if (v30)
          objc_msgSend(v28, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v15);
  }

  return v28;
}

- (id)getActivityStartBeforeDate:(id)a3 forActivity:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "message");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsString:", CFSTR("Submitted:"));

        if (v10)
        {
          objc_msgSend(v8, "message");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          getSubstring(v11, CFSTR(", ["), CFSTR("], Group:"), 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(" "));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ %@ %@"), v15, v16, v17);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)didActivityRun:(id)a3 forActivity:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "message", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsString:", CFSTR("Running activities :"));

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)getMessagesAfterRunning:(id)a3 forActivity:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v20 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "message");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsString:", CFSTR("Running activities :"));

        if (v14)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v15 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v15;
        }
        else
        {
          objc_msgSend(v12, "message");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "containsString:", CFSTR("COMPLETED")))
          {

LABEL_15:
            if (!v9)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v9, "addObject:", v12);
            goto LABEL_18;
          }
          objc_msgSend(v12, "message");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsString:", CFSTR("CANCELED"));

          if (v18)
            goto LABEL_15;
        }
        objc_msgSend(v9, "addObject:", v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_18:

  return v9;
}

- (int)didActivityFinish:(id)a3 forActivity:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "message", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsString:", CFSTR("COMPLETED"));

        if ((v11 & 1) != 0)
        {
          v14 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v9, "message");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsString:", CFSTR("CANCELED"));

        if ((v13 & 1) != 0)
        {
          v14 = 2;
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  return v14;
}

- (int)didActivityFinish:(id)a3 forBARActivity:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  int v16;
  int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "message");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsString:", CFSTR("COMPLETED"));

        if ((v13 & 1) != 0)
        {
          v8 = 1;
        }
        else
        {
          objc_msgSend(v11, "message");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsString:", CFSTR("CANCELED"));

          v7 |= v15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
    if ((v7 & 1) != 0)
      v16 = 2;
    else
      v16 = 0;
    if ((v8 & 1) != 0)
      v17 = 1;
    else
      v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)getMessagesActivityFinish:(id)a3 forActivity:(id)a4 isCompleted:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  __CFString *v19;
  char v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "message", (_QWORD)v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsString:", v8);

        if (v16)
        {
          objc_msgSend(v14, "message");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          v19 = v5 ? CFSTR("COMPLETED") : CFSTR("CANCELED");
          v20 = objc_msgSend(v17, "containsString:", v19);

          if ((v20 & 1) != 0)
          {
            v21 = v14;
            goto LABEL_15;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_15:

  return v21;
}

- (BOOL)didBARFinish:(id)a3 forApplication:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "message", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsString:", CFSTR("COMPLETED bgRefresh-"));

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)summarizeRuntimeOverMessages:(id)a3 forActivity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    v25 = 0;
    goto LABEL_21;
  }
  defaultFormatter();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "date");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  v35 = v6;
  if (!v10)
  {

    v12 = 0;
    v20 = (void *)MEMORY[0x24BDD17C8];
LABEL_16:
    v21 = v34;
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%d %@"), 0, &stru_24E138A50);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    goto LABEL_17;
  }
  v11 = v10;
  v33 = v5;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v39 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(v16, "message");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsString:", CFSTR("Suspending"));

      if (v18)
      {
        objc_msgSend(v16, "date");
        v19 = objc_claimAutoreleasedReturnValue();

        v13 = 1;
        v12 = (void *)v19;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  }
  while (v11);

  v20 = (void *)MEMORY[0x24BDD17C8];
  if ((v13 & 1) == 0)
  {
    v5 = v33;
    goto LABEL_16;
  }
  v21 = v34;
  objc_msgSend(v34, "stringFromDate:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 1;
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%d %@"), 1, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v33;
LABEL_17:
  v26 = (void *)MEMORY[0x24BDD17C8];
  getIntervalString(v37, v36);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromDate:", v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromDate:", v36);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("Activity ran for %@, from %@ to %@(Was suspended = %@)\n"), v27, v28, v29, v24);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, CFSTR("result"));
  if ((v23 & 1) != 0)
  {
    objc_msgSend(v21, "stringFromDate:", v12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v31, CFSTR("suspendTime"));

  }
  else
  {
    objc_msgSend(v25, "setObject:forKeyedSubscript:", &stru_24E138A50, CFSTR("suspendTime"));
  }

  v6 = v35;
LABEL_21:

  return v25;
}

- (id)getPolicyDenialReasonsFromMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "containsString:", CFSTR("Must Not Proceed}")))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v3;
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("\n"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v10, "containsString:", CFSTR("Not Proceed, Score:")))
          {
            getSubstring(v10, CFSTR("\t{name: "), CFSTR(","), 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              getSubstring(v10, CFSTR("Rationale: ["), CFSTR("]"), 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }
    v13 = v4;

    v3 = v15;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)getpolicyToIntervals:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char v8;
  uint64_t v9;
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
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t k;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t m;
  void *v77;
  void *v78;
  id v79;
  id obj;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v87;
  uint64_t v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  defaultFormatter();
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v85 = *(_QWORD *)v118;
    v8 = 1;
    v98 = v4;
    do
    {
      v9 = 0;
      v82 = v6;
      do
      {
        if (*(_QWORD *)v118 != v85)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v9);
        objc_msgSend(v10, "message");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DASLogExtractor getPolicyDenialReasonsFromMessage:](self, "getPolicyDenialReasonsFromMessage:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v100 = v12;
        if (v12)
        {
          v88 = v9;
          v13 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v7, "allKeys");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setWithArray:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v12, "allKeys");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setWithArray:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v89 = v7;
          v87 = v18;
          if ((v8 & 1) != 0)
          {
            v19 = v18;

            v115 = 0u;
            v116 = 0u;
            v113 = 0u;
            v114 = 0u;
            v20 = v19;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
            if (v21)
            {
              v22 = v21;
              v92 = v20;
              v95 = *(_QWORD *)v114;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v114 != v95)
                    objc_enumerationMutation(v92);
                  v24 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * i);
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, v24);

                  v26 = (void *)objc_opt_new();
                  objc_msgSend(v10, "date");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setStartDate:", v27);

                  objc_msgSend(v10, "date");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setEndDate:", v28);

                  objc_msgSend(v100, "objectForKeyedSubscript:", v24);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v10, "date");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v99, "stringFromDate:", v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "stringWithFormat:", CFSTR("[%@] %@"), v33, v29);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "addObject:", v34);

                  v4 = v98;
                  objc_msgSend(v26, "setValue:", v30);
                  objc_msgSend(v98, "objectForKeyedSubscript:", v24);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "addObject:", v26);

                }
                v22 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
              }
              while (v22);
              v20 = v92;
              v36 = v92;
              v7 = v89;
              v6 = v82;
            }
            else
            {
              v36 = v20;
            }
          }
          else
          {
            v37 = (void *)objc_msgSend(v15, "mutableCopy");
            objc_msgSend(v37, "unionSet:", v18);
            objc_msgSend(v37, "minusSet:", v18);
            v83 = (void *)objc_msgSend(v37, "copy");
            objc_msgSend(v37, "unionSet:", v18);
            v84 = v15;
            objc_msgSend(v37, "minusSet:", v15);
            v93 = v37;
            v38 = (void *)objc_msgSend(v37, "copy");
            v109 = 0u;
            v110 = 0u;
            v111 = 0u;
            v112 = 0u;
            v91 = v38;
            v39 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
            if (v39)
            {
              v40 = v39;
              v96 = *(_QWORD *)v110;
              do
              {
                for (j = 0; j != v40; ++j)
                {
                  if (*(_QWORD *)v110 != v96)
                    objc_enumerationMutation(v91);
                  v42 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * j);
                  objc_msgSend(v4, "objectForKeyedSubscript:", v42);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v43)
                  {
                    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, v42);

                  }
                  v45 = (void *)objc_opt_new();
                  objc_msgSend(v10, "date");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "setStartDate:", v46);

                  objc_msgSend(v10, "date");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "setEndDate:", v47);

                  objc_msgSend(v100, "objectForKeyedSubscript:", v42);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v10, "date");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v99, "stringFromDate:", v51);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "stringWithFormat:", CFSTR("[%@] %@"), v52, v48);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "addObject:", v53);

                  v4 = v98;
                  objc_msgSend(v45, "setValue:", v49);
                  objc_msgSend(v98, "objectForKeyedSubscript:", v42);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "addObject:", v45);

                }
                v40 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
              }
              while (v40);
            }

            objc_msgSend(v93, "unionSet:", v84);
            objc_msgSend(v93, "minusSet:", v91);
            objc_msgSend(v93, "minusSet:", v83);
            v55 = (void *)objc_msgSend(v93, "copy");
            v105 = 0u;
            v106 = 0u;
            v107 = 0u;
            v108 = 0u;
            v90 = v55;
            v56 = v89;
            v57 = v100;
            v97 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v105, v122, 16);
            if (v97)
            {
              v94 = *(_QWORD *)v106;
              do
              {
                for (k = 0; k != v97; ++k)
                {
                  if (*(_QWORD *)v106 != v94)
                    objc_enumerationMutation(v90);
                  v59 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * k);
                  objc_msgSend(v4, "objectForKeyedSubscript:", v59);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "count");
                  objc_msgSend(v60, "lastObject");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "date");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "setEndDate:", v62);

                  objc_msgSend(v57, "objectForKeyedSubscript:", v59);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "objectForKeyedSubscript:", v59);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v63, "isEqualToString:", v64) & 1) == 0)
                  {
                    objc_msgSend(v61, "value");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    v66 = (void *)MEMORY[0x24BDD17C8];
                    objc_msgSend(v10, "date");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v99, "stringFromDate:", v67);
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "stringWithFormat:", CFSTR("[%@] %@"), v68, v63);
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "addObject:", v69);

                    v4 = v98;
                    v57 = v100;
                    v56 = v89;

                  }
                }
                v97 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v105, v122, 16);
              }
              while (v97);
            }

            v7 = v57;
            v6 = v82;
            v20 = v93;
            v36 = v84;
          }

          v8 = 0;
          v9 = v88;
        }

        ++v9;
      }
      while (v9 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(obj, "lastObject");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "date");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  objc_msgSend(v7, "allKeys");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v102;
    do
    {
      for (m = 0; m != v74; ++m)
      {
        if (*(_QWORD *)v102 != v75)
          objc_enumerationMutation(v72);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * m));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "count");
        objc_msgSend(v77, "lastObject");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setEndDate:", v71);

      }
      v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
    }
    while (v74);
  }

  v79 = v4;
  return v79;
}

- (id)descriptionOfPolicyToIntervalsMap:(id)a3
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  objc_msgSend(v35, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v30 = v3;
    obj = v3;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v53;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v53 != v32)
            objc_enumerationMutation(obj);
          v34 = v5;
          v6 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v5);
          -[__CFString appendString:](v4, "appendString:", CFSTR("\n\n-------------------------------------------------------"));
          -[__CFString appendString:](v4, "appendString:", CFSTR("-------------------------------------------------------\n"));
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Policy: %@"), v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendString:](v4, "appendString:", v7);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n\nDenial Intervals:\n"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendString:](v4, "appendString:", v8);

          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v38 = v6;
          objc_msgSend(v35, "objectForKeyedSubscript:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v49 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                objc_msgSend(v14, "intervalString");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "durationString");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t%@\t%@\n"), v15, v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString appendString:](v4, "appendString:", v17);

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
            }
            while (v11);
          }

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n\nRationales:\n"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendString:](v4, "appendString:", v18);

          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          objc_msgSend(v35, "objectForKeyedSubscript:", v38);
          v36 = (id)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
          if (v39)
          {
            v37 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v39; ++j)
              {
                if (*(_QWORD *)v45 != v37)
                  objc_enumerationMutation(v36);
                v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
                objc_msgSend(v20, "intervalString");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t%@:\n"), v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString appendString:](v4, "appendString:", v22);

                v42 = 0u;
                v43 = 0u;
                v40 = 0u;
                v41 = 0u;
                objc_msgSend(v20, "value");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
                if (v24)
                {
                  v25 = v24;
                  v26 = *(_QWORD *)v41;
                  do
                  {
                    for (k = 0; k != v25; ++k)
                    {
                      if (*(_QWORD *)v41 != v26)
                        objc_enumerationMutation(v23);
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\t%@\n"), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k));
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      -[__CFString appendString:](v4, "appendString:", v28);

                    }
                    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
                  }
                  while (v25);
                }

              }
              v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
            }
            while (v39);
          }

          v5 = v34 + 1;
        }
        while (v34 + 1 != v33);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v33);
    }

    -[__CFString appendString:](v4, "appendString:", CFSTR("\n\n-------------------------------------------------------"));
    -[__CFString appendString:](v4, "appendString:", CFSTR("-------------------------------------------------------"));
    v3 = v30;
  }
  else
  {
    v4 = &stru_24E138A50;
  }

  return v4;
}

- (id)getIncompatibilityReasons:(id)a3 forActivity:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;
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
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = CFSTR("Bailing  out.");
    v12 = *(_QWORD *)v41;
    v36 = v6;
    v37 = v7;
    do
    {
      v13 = 0;
      v39 = v9;
      do
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v13);
        objc_msgSend(v14, "message");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsString:", v11);

        if (v16)
        {
          v17 = v11;
          objc_msgSend(v14, "message");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          getSubstring(v18, CFSTR("'"), CFSTR("' has compatibility"), 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = (void *)objc_msgSend(v19, "copy");
          getSubstring(v20, 0, CFSTR(":"), 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v21, "containsString:", v6))
          {
            objc_msgSend(v14, "message");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            getSubstring(v22, CFSTR("with "), CFSTR(". Bailing "), 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "message");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            getSubstring(v24, CFSTR("score of "), CFSTR(" with"), 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v10)
            {
              if (objc_msgSend(v23, "isEqualToString:", v10))
              {
                objc_msgSend(v14, "date");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "lastObject");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setEndDate:", v26);

              }
              else
              {
                v26 = (void *)objc_opt_new();
                objc_msgSend(v14, "date");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setStartDate:", v31);

                objc_msgSend(v14, "date");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setEndDate:", v32);

                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v23, CFSTR("activity"), v25, CFSTR("score"), 0);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setValue:", v33);

                objc_msgSend(v38, "addObject:", v26);
                v34 = v23;

                v10 = v34;
                v6 = v36;
              }
            }
            else
            {
              v26 = (void *)objc_opt_new();
              objc_msgSend(v14, "date");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setStartDate:", v28);

              objc_msgSend(v14, "date");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setEndDate:", v29);

              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v23, CFSTR("activity"), v25, CFSTR("score"), 0);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setValue:", v30);

              objc_msgSend(v38, "addObject:", v26);
              v10 = v23;
            }

            v7 = v37;
          }

          v11 = v17;
          v9 = v39;
        }
        ++v13;
      }
      while (v9 != v13);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v38;
}

- (id)descriptionOfIncompatibilityDenials:(id)a3
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendString:](v4, "appendString:", CFSTR("\n"));
    -[__CFString appendString:](v4, "appendString:", CFSTR("Denials due to incompatibility:\n"));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v9, "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("activity"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v9, "durationString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "intervalString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("\tDuration: %@ %@ Activity: %@ \n"), v13, v14, v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[__CFString appendString:](v4, "appendString:", v15);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

    -[__CFString appendString:](v4, "appendString:", CFSTR("\n\n-------------------------------------------------------"));
    -[__CFString appendString:](v4, "appendString:", CFSTR("-------------------------------------------------------"));
    v3 = v17;
  }
  else
  {
    v4 = &stru_24E138A50;
  }

  return v4;
}

- (id)getInstancesOfHigherThreshold:(id)a3 forActivity:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
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
  int v24;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v27 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 1;
    v30 = *(_QWORD *)v32;
    v26 = v6;
    do
    {
      v10 = 0;
      v28 = v8;
      do
      {
        if (*(_QWORD *)v32 != v30)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
        objc_msgSend(v11, "message");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if ((v9 & 1) != 0)
        {
          v14 = objc_msgSend(v12, "containsString:", CFSTR("DecisionToRun:0"));

          if (v14)
          {
            v15 = (void *)objc_opt_new();
            objc_msgSend(v11, "date");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setStartDate:", v16);

            objc_msgSend(v11, "date");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setEndDate:", v17);

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%@"), v27);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "message");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            getSubstring(v19, v18, CFSTR(" CurrentScore:"), 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v18, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "message");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            getSubstring(v22, v21, CFSTR(" DecisionToRun"), 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setValue:", v23);

            objc_msgSend(v29, "addObject:", v15);
            v6 = v26;
            v8 = v28;

LABEL_11:
            v9 ^= 1u;

            goto LABEL_14;
          }
          v9 = 1;
        }
        else
        {
          v24 = objc_msgSend(v12, "containsString:", CFSTR("Must Not Proceed"));

          if (v24)
          {
            objc_msgSend(v11, "date");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "lastObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setEndDate:", v15);
            goto LABEL_11;
          }
          v9 = 0;
        }
LABEL_14:
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

  return v29;
}

- (id)descriptionOfHigherThresholds:(id)a3
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendString:](v4, "appendString:", CFSTR("\n"));
    -[__CFString appendString:](v4, "appendString:", CFSTR("Denials due to higher Threshold scores:\n"));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v9, "durationString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "intervalString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("\t%@   Duration: %@   Values: %@\n"), v12, v13, v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          -[__CFString appendString:](v4, "appendString:", v14);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    -[__CFString appendString:](v4, "appendString:", CFSTR("\n\n-------------------------------------------------------"));
    -[__CFString appendString:](v4, "appendString:", CFSTR("-------------------------------------------------------"));
  }
  else
  {
    v4 = &stru_24E138A50;
  }

  return v4;
}

- (id)summarizePolicyDenialsOverMessages:(id)a3 maxDuration:(double)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t j;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  __CFString *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t k;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  id obj;
  void *v41;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v5;
  objc_msgSend(v5, "allKeys");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v41, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v45;
          v17 = 0.0;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v45 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "duration");
              if (v17 < 0.0)
              {
                v17 = a4;
                goto LABEL_17;
              }
              v17 = v17 + v19;
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            if (v15)
              continue;
            break;
          }
        }
        else
        {
          v17 = 0.0;
        }
LABEL_17:

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, v11);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v8);
  }
  objc_msgSend(v6, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __67___DASLogExtractor_summarizePolicyDenialsOverMessages_maxDuration___block_invoke;
  v42[3] = &unk_24E1388B8;
  v22 = v6;
  v43 = v22;
  objc_msgSend(v21, "sortedArrayUsingComparator:", v42);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("\tThe top blocking policies are :\n"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "count");
    v27 = 6;
    if (v26 < 6)
      v27 = v26;
    if (v27)
    {
      for (k = 0; k < v38; ++k)
      {
        v29 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v23, "objectAtIndexedSubscript:", k);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "doubleValue");
        objc_msgSend(v29, "dateWithTimeInterval:sinceDate:", v25);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v23, "objectAtIndexedSubscript:", k);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        getIntervalString(v25, v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("\t\t%@ : %@,\n"), v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString appendString:](v24, "appendString:", v36);

        v37 = objc_msgSend(v23, "count");
        v38 = 6;
        if (v37 < 6)
          v38 = v37;
      }
    }

  }
  else
  {
    v24 = &stru_24E138A50;
  }

  return v24;
}

- (id)summarizeAllDenialsOverMessages:(id)a3 forActivity:(id)a4 detail:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "date");
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)v12;
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    v16 = v15;
    -[_DASLogExtractor getpolicyToIntervals:](self, "getpolicyToIntervals:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASLogExtractor summarizePolicyDenialsOverMessages:maxDuration:](self, "summarizePolicyDenialsOverMessages:maxDuration:", v17, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendString:](v10, "appendString:", v18);
    if (v5)
    {
      -[_DASLogExtractor descriptionOfPolicyToIntervalsMap:](self, "descriptionOfPolicyToIntervalsMap:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendString:](v10, "appendString:", v19);

    }
    -[_DASLogExtractor getIncompatibilityReasons:forActivity:](self, "getIncompatibilityReasons:forActivity:", v8, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASLogExtractor descriptionOfIncompatibilityDenials:](self, "descriptionOfIncompatibilityDenials:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendString:](v10, "appendString:", v21);
    -[_DASLogExtractor getInstancesOfHigherThreshold:forActivity:](self, "getInstancesOfHigherThreshold:forActivity:", v8, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASLogExtractor descriptionOfHigherThresholds:](self, "descriptionOfHigherThresholds:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendString:](v10, "appendString:", v23);

  }
  else
  {
    v10 = CFSTR("The task is not blocked");
  }

  return v10;
}

- (id)getSummaryFromLogs:(id)a3 forActivity:(id)a4 detail:(BOOL)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned int v52;
  uint64_t v53;
  id obj;
  __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  __CFString *v62;
  __CFString *v63;
  uint64_t v64;
  _DASLogExtractor *v65;
  id v66;
  __CFString *v67;
  void *v68;
  id v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v5 = a5;
  v76 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v65 = self;
  -[_DASLogExtractor getScheduledBlocksOfMessages:forActivity:](self, "getScheduledBlocksOfMessages:forActivity:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  defaultFormatter();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v66 = (id)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
  if (v10)
  {
    v11 = v10;
    v59 = *(_QWORD *)v72;
    v60 = v8;
    v64 = 1;
    v52 = v5;
    do
    {
      v12 = 0;
      v53 = v11;
      do
      {
        if (*(_QWORD *)v72 != v59)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v12);
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "date");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "date");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        -[_DASLogExtractor getMessagesBeforeRunning:forActivity:](v65, "getMessagesBeforeRunning:forActivity:", v13, v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DASLogExtractor summarizeAllDenialsOverMessages:forActivity:detail:](v65, "summarizeAllDenialsOverMessages:forActivity:detail:", v16, v8, v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("The task is not blocked")) & 1) == 0)
        {
          -[_DASLogExtractor getActivityStartBeforeDate:forActivity:](v65, "getActivityStartBeforeDate:forActivity:", v13, v8);
          v18 = v61;
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "dateFromString:");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v19 || (objc_msgSend(v19, "timeIntervalSinceDate:", v70), v69 = v20, v21 < 0.0))
          {
            v69 = v70;

          }
          v57 = v20;
          v22 = -[_DASLogExtractor didActivityRun:forActivity:](v65, "didActivityRun:forActivity:", v13, v8);
          v56 = v16;
          objc_msgSend(v16, "lastObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "date");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            -[_DASLogExtractor getMessagesAfterRunning:forActivity:](v65, "getMessagesAfterRunning:forActivity:", v13, v8);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DASLogExtractor summarizeRuntimeOverMessages:forActivity:](v65, "summarizeRuntimeOverMessages:forActivity:", v25, v8);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("result"));
            v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("suspendTime"));
            v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v61, "stringFromDate:", v24);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("%@"), v28);
            v63 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v18 = v61;
            v29 = &stru_24E138A50;
          }
          else
          {
            v63 = CFSTR("-");
            v29 = &stru_24E138A50;
            v55 = &stru_24E138A50;
            v67 = &stru_24E138A50;
          }
          getIntervalString(v69, v24);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v30, "isEqualToString:", &stru_24E138A50) & 1) == 0)
          {
            v31 = (void *)MEMORY[0x24BDD17C8];
            getIntervalString(v69, v24);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stringWithFormat:", CFSTR("Activity was blocked for %@\n\n"), v32);
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          v33 = -[_DASLogExtractor didActivityFinish:forActivity:](v65, "didActivityFinish:forActivity:", v13, v60);
          if (v33)
          {
            v34 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v18, "stringFromDate:", v68);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "stringWithFormat:", CFSTR("%@"), v35);
            v62 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v18 = v61;
          }
          else
          {
            v62 = CFSTR("-");
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n\n############################################# Scheduled Block %d #############################################\n\n"), v64);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "appendString:", v36);

          v37 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v18, "stringFromDate:", v70);
          v38 = v18;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringWithFormat:", CFSTR("Submitted at:         %@\n"), v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "appendString:", v40);

          v41 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v38, "stringFromDate:", v69);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringWithFormat:", CFSTR("Eligible from:        %@\n"), v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "appendString:", v43);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Activity ran at:      %@\n"), v63);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "appendString:", v44);

          if ((-[__CFString isEqualToString:](v67, "isEqualToString:", &stru_24E138A50) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Suspended at:         %@\n"), v67);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "appendString:", v45);

          }
          v5 = v52;
          if (v33 == 1)
          {
            v46 = CFSTR("Completed at:        %@\n");
            v8 = v60;
LABEL_24:
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v46, v62);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "appendString:", v47);

          }
          else
          {
            v8 = v60;
            if (v33 == 2)
            {
              v46 = CFSTR("Canceled at:         %@\n");
              goto LABEL_24;
            }
          }
          v64 = (v64 + 1);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@\n"), v55);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "appendString:", v48);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v29);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "appendString:", v49);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v17);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "appendString:", v50);

          v11 = v53;
          v16 = v56;
        }

        ++v12;
      }
      while (v11 != v12);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    }
    while (v11);
  }

  return v66;
}

- (id)getBARSummaryFromLogs:(id)a3 forApplication:(id)a4 detail:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _BOOL4 v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t i;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t j;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  __CFString *v89;
  __CFString *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  __CFString *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  double v116;
  double v117;
  void *v118;
  void *v119;
  id obj;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  __CFString *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  int v131;
  int v132;
  int v133;
  int v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  id v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  void *v156;
  _DASLogExtractor *v157;
  void *v158;
  void *v159;
  _BOOL4 v160;
  __CFString *v161;
  __CFString *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  uint64_t v181;

  v160 = a5;
  v181 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[_DASLogExtractor getScheduledBlocksOfBARMessages:forApplication:](self, "getScheduledBlocksOfBARMessages:forApplication:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  defaultFormatter();
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = 0u;
  v175 = 0u;
  v176 = 0u;
  v177 = 0u;
  obj = v8;
  v10 = 0x24BDD1000uLL;
  v123 = v7;
  v124 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v174, v180, 16);
  if (v124)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v122 = *(_QWORD *)v175;
    v15 = 1;
    v157 = self;
    v158 = v9;
    while (1)
    {
      v16 = 0;
      do
      {
        v146 = v15;
        if (*(_QWORD *)v175 != v122)
        {
          v17 = v16;
          objc_enumerationMutation(obj);
          v16 = v17;
        }
        v130 = v16;
        v18 = *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * v16);
        -[_DASLogExtractor getMessagesWhenAppBackgroundSwitch:forApplication:switchTo:](self, "getMessagesWhenAppBackgroundSwitch:forApplication:switchTo:", v18, v7, CFSTR("Background"));
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DASLogExtractor getMessagesWhenAppBackgroundSwitch:forApplication:switchTo:](self, "getMessagesWhenAppBackgroundSwitch:forApplication:switchTo:", v18, v7, CFSTR("Foreground"));
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = v18;
        -[_DASLogExtractor getMessagesForAllBARTasks:](self, "getMessagesForAllBARTasks:", v18);
        v19 = objc_claimAutoreleasedReturnValue();
        -[_DASLogExtractor getMessagesForBARLifecycle:forApplication:queryStatus:taskType:](self, "getMessagesForBARLifecycle:forApplication:queryStatus:taskType:", v19, v7, CFSTR("Submitted"), CFSTR("bgRefresh"));
        v20 = objc_claimAutoreleasedReturnValue();
        v148 = (void *)v19;
        v21 = v19;
        v22 = (void *)v20;
        -[_DASLogExtractor getMessagesForBARLifecycle:forApplication:queryStatus:taskType:](self, "getMessagesForBARLifecycle:forApplication:queryStatus:taskType:", v21, v7, CFSTR("Completed"), CFSTR("bgRefresh"));
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count"))
          v142 = objc_msgSend(v22, "count");
        else
          v142 = 0;
        v145 = v22;
        if (objc_msgSend(v156, "count"))
          v141 = objc_msgSend(v156, "count");
        else
          v141 = 0;
        -[_DASLogExtractor getMessagesForBARLifecycle:forApplication:queryStatus:taskType:](self, "getMessagesForBARLifecycle:forApplication:queryStatus:taskType:", v148, v7, CFSTR("Submitted"), CFSTR("pushLaunch"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DASLogExtractor getMessagesForBARLifecycle:forApplication:queryStatus:taskType:](self, "getMessagesForBARLifecycle:forApplication:queryStatus:taskType:", v148, v7, CFSTR("Completed"), CFSTR("pushLaunch"));
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count"))
          v139 = objc_msgSend(v23, "count");
        else
          v139 = 0;
        v133 = v13;
        v134 = v14;
        v131 = v11;
        v132 = v12;
        v129 = v23;
        if (objc_msgSend(v155, "count"))
          v138 = objc_msgSend(v155, "count");
        else
          v138 = 0;
        -[_DASLogExtractor getMessagesForBARLifecycle:forApplication:queryStatus:taskType:](self, "getMessagesForBARLifecycle:forApplication:queryStatus:taskType:", v148, v7, CFSTR("Prediction"), &stru_24E138A50);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DASLogExtractor getAllBARActivityNames:](self, "getAllBARActivityNames:", v148);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DASLogExtractor getAllPushLaunchActivityNames:](self, "getAllPushLaunchActivityNames:", v148);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "lastObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "date");
        v25 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v143, "lastObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "date");
        v27 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v156, "lastObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "date");
        v135 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = *(void **)(v10 + 1992);
        v128 = (void *)v25;
        objc_msgSend(v159, "stringFromDate:", v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("%@"), v30);
        v137 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = *(void **)(v10 + 1992);
        v127 = (void *)v27;
        objc_msgSend(v159, "stringFromDate:", v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%@"), v32);
        v33 = objc_claimAutoreleasedReturnValue();

        v34 = -[_DASLogExtractor didBARFinish:forApplication:](self, "didBARFinish:forApplication:", v148, v7);
        v35 = &stru_24E138A50;
        if (v34)
        {
          v36 = *(void **)(v10 + 1992);
          objc_msgSend(v159, "stringFromDate:", v135);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", CFSTR("%@"), v37);
          v35 = (const __CFString *)objc_claimAutoreleasedReturnValue();

        }
        v38 = v146;
        objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("\n\n######################## Scheduled Block %d ########################\n\n"), v146);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v39);

        objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("App switch to background at:                %@\n"), v137);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v40);

        v126 = (void *)v33;
        objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("App switch to foreground at:                %@\n"), v33);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v41);

        objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Number of bgRefresh tasks submitted:        %lu\n"), v142);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v42);

        objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Number of bgRefresh tasks completed:        %lu\n"), v141);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v43);

        objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Number of pushLaunch tasks submitted:       %lu\n"), v139);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v44);

        objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Number of pushLaunch tasks completed:       %lu\n"), v138);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v45);

        v46 = v145;
        if (v34)
        {
          objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Last Background Refresh Task Completed at:  %@\n"), v35);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendString:", v47);

        }
        v125 = (__CFString *)v35;
        if (objc_msgSend(v140, "count"))
        {
          objc_msgSend(v140, "lastObject");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "date");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = *(void **)(v10 + 1992);
          objc_msgSend(v159, "stringFromDate:", v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "stringWithFormat:", CFSTR("%@"), v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v140, "lastObject");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "message");
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Last App Launch Prediction Generated at:    %@\n"), v52);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendString:", v55);

          objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Last App Launch Prediction:                 %@\n"), v54);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendString:", v56);

        }
        if (objc_msgSend(v147, "count"))
        {
          objc_msgSend(v9, "appendString:", CFSTR("--------------------------------------------------------------------\n"));
          objc_msgSend(v9, "appendString:", CFSTR("Summary for bgRefresh tasks:\n"));
          v172 = 0u;
          v173 = 0u;
          v170 = 0u;
          v171 = 0u;
          v149 = v147;
          v153 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v170, v179, 16);
          if (!v153)
            goto LABEL_45;
          v151 = *(_QWORD *)v171;
          while (1)
          {
            for (i = 0; i != v153; ++i)
            {
              if (*(_QWORD *)v171 != v151)
                objc_enumerationMutation(v149);
              v58 = *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * i);
              objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Activity %@     \n"), v58);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "appendString:", v59);

              -[_DASLogExtractor getMessagesBeforeRunning:forActivity:](self, "getMessagesBeforeRunning:forActivity:", v165, v58);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v59) = -[_DASLogExtractor didActivityRun:forActivity:](self, "didActivityRun:forActivity:", v165, v58);
              objc_msgSend(v60, "lastObject");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "date");
              v163 = (void *)objc_claimAutoreleasedReturnValue();

              v62 = &stru_24E138A50;
              v63 = &stru_24E138A50;
              v161 = &stru_24E138A50;
              if ((_DWORD)v59)
              {
                -[_DASLogExtractor getMessagesAfterRunning:forActivity:](self, "getMessagesAfterRunning:forActivity:", v165, v58);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                -[_DASLogExtractor summarizeRuntimeOverMessages:forActivity:](self, "summarizeRuntimeOverMessages:forActivity:", v64, v58);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("result"));
                v161 = (__CFString *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("suspendTime"));
                v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v66 = *(void **)(v10 + 1992);
                objc_msgSend(v159, "stringFromDate:", v163);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "stringWithFormat:", CFSTR("%@"), v67);
                v62 = (__CFString *)objc_claimAutoreleasedReturnValue();

                v9 = v158;
                objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Activity ran at:                            %@\n"), v62);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v158, "appendString:", v68);

                if ((-[__CFString isEqualToString:](v63, "isEqualToString:", &stru_24E138A50) & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Suspended at:                                %@\n"), v63);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v158, "appendString:", v69);

                }
                v10 = 0x24BDD1000;
                self = v157;
              }
              v70 = -[_DASLogExtractor didActivityFinish:forBARActivity:](self, "didActivityFinish:forBARActivity:", v156, v58);
              if (v70 == 2)
              {
                -[_DASLogExtractor getMessagesActivityFinish:forActivity:isCompleted:](self, "getMessagesActivityFinish:forActivity:isCompleted:", v156, v58, 0);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = v77;
                if (!v77)
                {
                  v71 = &stru_24E138A50;
                  goto LABEL_42;
                }
                objc_msgSend(v77, "date");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v159, "stringFromDate:", v74);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "stringWithFormat:", CFSTR("%@"), v79);
                v71 = (__CFString *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Canceled at:                                %@\n"), v71);
                goto LABEL_40;
              }
              v71 = &stru_24E138A50;
              if (v70 != 1)
                goto LABEL_43;
              -[_DASLogExtractor getMessagesActivityFinish:forActivity:isCompleted:](self, "getMessagesActivityFinish:forActivity:isCompleted:", v156, v58, 1);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = v72;
              if (v72)
              {
                objc_msgSend(v72, "date");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v159, "stringFromDate:", v74);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "stringWithFormat:", CFSTR("%@"), v76);
                v71 = (__CFString *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Completed at:                               %@\n"), v71);
LABEL_40:
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v9 = v158;
                objc_msgSend(v158, "appendString:", v80);

                self = v157;
              }
LABEL_42:

              v10 = 0x24BDD1000uLL;
LABEL_43:
              -[_DASLogExtractor summarizeAllDenialsOverMessages:forActivity:detail:](self, "summarizeAllDenialsOverMessages:forActivity:detail:", v60, v58, v160);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("%@\n"), v81);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "appendString:", v82);

            }
            v153 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v170, v179, 16);
            if (!v153)
            {
LABEL_45:

              v46 = v145;
              v38 = v146;
              break;
            }
          }
        }
        v83 = v136;
        if (!objc_msgSend(v136, "count"))
          goto LABEL_68;
        objc_msgSend(v9, "appendString:", CFSTR("--------------------------------------------------------------------\n"));
        objc_msgSend(v9, "appendString:", CFSTR("Summary for pushLaunch tasks:\n"));
        v168 = 0u;
        v169 = 0u;
        v166 = 0u;
        v167 = 0u;
        v150 = v136;
        v154 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v166, v178, 16);
        if (!v154)
          goto LABEL_67;
        v152 = *(_QWORD *)v167;
        do
        {
          for (j = 0; j != v154; ++j)
          {
            if (*(_QWORD *)v167 != v152)
              objc_enumerationMutation(v150);
            v85 = *(_QWORD *)(*((_QWORD *)&v166 + 1) + 8 * j);
            objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Activity %@     \n"), v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "appendString:", v86);

            -[_DASLogExtractor getMessagesBeforeRunning:forActivity:](self, "getMessagesBeforeRunning:forActivity:", v165, v85);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v86) = -[_DASLogExtractor didActivityRun:forActivity:](self, "didActivityRun:forActivity:", v165, v85);
            objc_msgSend(v87, "lastObject");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "date");
            v164 = (void *)objc_claimAutoreleasedReturnValue();

            v89 = &stru_24E138A50;
            v90 = &stru_24E138A50;
            v162 = &stru_24E138A50;
            if ((_DWORD)v86)
            {
              -[_DASLogExtractor getMessagesAfterRunning:forActivity:](self, "getMessagesAfterRunning:forActivity:", v165, v85);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DASLogExtractor summarizeRuntimeOverMessages:forActivity:](self, "summarizeRuntimeOverMessages:forActivity:", v91, v85);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("result"));
              v162 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("suspendTime"));
              v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v93 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v159, "stringFromDate:", v164);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "stringWithFormat:", CFSTR("%@"), v94);
              v90 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v9 = v158;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Activity ran at:                            %@\n"), v90);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v158, "appendString:", v95);

              if ((-[__CFString isEqualToString:](v89, "isEqualToString:", &stru_24E138A50) & 1) == 0)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Suspended at:                                %@\n"), v89);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v158, "appendString:", v96);

              }
              self = v157;
            }
            v97 = -[_DASLogExtractor didActivityFinish:forBARActivity:](self, "didActivityFinish:forBARActivity:", v155, v85);
            if (v97 == 2)
            {
              -[_DASLogExtractor getMessagesActivityFinish:forActivity:isCompleted:](self, "getMessagesActivityFinish:forActivity:isCompleted:", v155, v85, 0);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = v104;
              if (!v104)
              {
                v98 = &stru_24E138A50;
                goto LABEL_64;
              }
              objc_msgSend(v104, "date");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v159, "stringFromDate:", v101);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "stringWithFormat:", CFSTR("%@"), v106);
              v98 = (__CFString *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Canceled at:                                %@\n"), v98);
              goto LABEL_62;
            }
            v98 = &stru_24E138A50;
            if (v97 != 1)
              goto LABEL_65;
            -[_DASLogExtractor getMessagesActivityFinish:forActivity:isCompleted:](self, "getMessagesActivityFinish:forActivity:isCompleted:", v155, v85, 1);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = v99;
            if (v99)
            {
              objc_msgSend(v99, "date");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v102 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v159, "stringFromDate:", v101);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "stringWithFormat:", CFSTR("%@"), v103);
              v98 = (__CFString *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Completed at:                               %@\n"), v98);
LABEL_62:
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = v158;
              objc_msgSend(v158, "appendString:", v107);

              self = v157;
            }
LABEL_64:

LABEL_65:
            -[_DASLogExtractor summarizeAllDenialsOverMessages:forActivity:detail:](self, "summarizeAllDenialsOverMessages:forActivity:detail:", v87, v85, v160);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v108);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "appendString:", v109);

            v10 = 0x24BDD1000uLL;
          }
          v154 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v166, v178, 16);
        }
        while (v154);
LABEL_67:

        v46 = v145;
        v38 = v146;
        v83 = v136;
LABEL_68:
        v14 = v142 + v134;
        v13 = v141 + v133;
        v12 = v139 + v132;
        v15 = (v38 + 1);
        v11 = v138 + v131;

        v16 = v130 + 1;
        v7 = v123;
      }
      while (v130 + 1 != v124);
      v124 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v174, v180, 16);
      if (!v124)
      {
        v110 = v139 + v132;
        goto LABEL_72;
      }
    }
  }
  v11 = 0;
  v110 = 0;
  v13 = 0;
  v14 = 0;
LABEL_72:

  objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("\n\n######################### Overall Summary #########################\n\n"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v111);

  objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Total Number of bgRefresh tasks submitted:  %lu\n"), v14);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v112);

  objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Total Number of bgRefresh tasks completed:  %lu\n"), v13);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v113);

  objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Total Number of pushLaunch tasks submitted: %lu\n"), v110);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v114);

  objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Total Number of pushLaunch tasks completed: %lu\n"), v11);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v115);

  v116 = 0.0;
  v117 = (float)((float)((float)v13 / (float)v14) * 100.0);
  if (!v14)
    v117 = 0.0;
  objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Success rate of bgRefresh tasks completed: %.1f%%\n"), *(_QWORD *)&v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v118);

  if (v11)
    v116 = (float)((float)((float)v11 / (float)v110) * 100.0);
  objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("Success rate of pushLaunch tasks completed: %.1f%%\n"), *(_QWORD *)&v116);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v119);

  return v9;
}

- (int)summarizeActivity:(id)a3 startDate:(id)a4 endDate:(id)a5 detail:(BOOL)a6
{
  id v6;
  void *v7;
  int v8;
  int v10;

  v10 = 0;
  v6 = -[_DASLogExtractor copyActivitySummary:startDate:endDate:detail:error:](self, "copyActivitySummary:startDate:endDate:detail:error:", a3, a4, a5, a6, &v10);
  v7 = v6;
  v8 = v10;
  if (!v10)
    NSLog(CFSTR("Summary:\n%@"), v6);

  return v8;
}

- (int)summarizeApplication:(id)a3 startDate:(id)a4 endDate:(id)a5 detail:(BOOL)a6
{
  id v6;
  void *v7;
  int v8;
  int v10;

  v10 = 0;
  v6 = -[_DASLogExtractor copyApplicationSummary:startDate:endDate:detail:error:](self, "copyApplicationSummary:startDate:endDate:detail:error:", a3, a4, a5, a6, &v10);
  v7 = v6;
  v8 = v10;
  if (!v10)
    NSLog(CFSTR("Summary: \n%@"), v6);

  return v8;
}

- (id)copyActivitySummary:(id)a3 startDate:(id)a4 endDate:(id)a5 detail:(BOOL)a6 error:(int *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("subsystem = %@"), self->_subsystem);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("eventMessage contains %@"), v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v17);

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("date <= %@"), v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v18);

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __71___DASLogExtractor_copyActivitySummary_startDate_endDate_detail_error___block_invoke;
  v22[3] = &unk_24E1388E0;
  v22[4] = &v23;
  v19 = -[_DASLogExtractor handleLogEventsLogEvents:sinceDate:withHandler:](self, "handleLogEventsLogEvents:sinceDate:withHandler:", v15, v13, v22);
  if (v19)
  {
    v20 = 0;
    if (a7)
      *a7 = v19;
  }
  else
  {
    -[_DASLogExtractor getSummaryFromLogs:forActivity:detail:](self, "getSummaryFromLogs:forActivity:detail:", v24[5], v12, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (id)copyApplicationSummary:(id)a3 startDate:(id)a4 endDate:(id)a5 detail:(BOOL)a6 error:(int *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("eventMessage contains %@"), v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("date <= %@"), v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v17);

  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __74___DASLogExtractor_copyApplicationSummary_startDate_endDate_detail_error___block_invoke;
  v21[3] = &unk_24E1388E0;
  v21[4] = &v22;
  v18 = -[_DASLogExtractor handleLogEventsLogEvents:sinceDate:withHandler:](self, "handleLogEventsLogEvents:sinceDate:withHandler:", v15, v13, v21);
  if (v18)
  {
    v19 = 0;
    if (a7)
      *a7 = v18;
  }
  else
  {
    -[_DASLogExtractor getBARSummaryFromLogs:forApplication:detail:](self, "getBARSummaryFromLogs:forApplication:detail:", v23[5], v12, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v22, 8);

  return v19;
}

- (id)objectForTrigger:(id)a3 fromCondition:(id)a4 compactRepresentation:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("/device/system/thermalpressure")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("/device/system/isPluggedIn")))
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("0")))
      {
        v9 = CFSTR("Plugged In");
        goto LABEL_15;
      }
      v10 = CFSTR("Unplugged");
      goto LABEL_58;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("/device/system/cpuusage")))
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("0")))
        goto LABEL_3;
      v12 = objc_msgSend(v8, "isEqualToString:", CFSTR("50"));
      if (v5)
      {
        if (v12)
          goto LABEL_3;
        v10 = CFSTR("Under CPU Load");
LABEL_58:
        +[_DASLogCondition withCondition:](_DASLogCondition, "withCondition:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
      if (v12)
      {
        v9 = CFSTR("Light");
        goto LABEL_15;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("75")))
      {
        v10 = CFSTR("Moderate");
        goto LABEL_58;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("90")))
      {
        v10 = CFSTR("Somewhat Heavy");
        goto LABEL_58;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("95")))
      {
        v10 = CFSTR("Really Heavy");
        goto LABEL_58;
      }
    }
    else
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("/device/system/wifi/status")) & 1) == 0
        && (objc_msgSend(v7, "isEqualToString:", CFSTR("/device/system/cell/status")) & 1) == 0
        && !objc_msgSend(v7, "isEqualToString:", CFSTR("/device/system/wired/status")))
      {
        v11 = 0;
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("/device/system/batteryPercentage")) && v5)
        {
          v16 = objc_msgSend(v8, "intValue");
          if ((int)v16 <= 10)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16);
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v15 = v11;
            goto LABEL_28;
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10 * (v16 / 0xA));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DASLogCondition withCondition:](_DASLogCondition, "withCondition:", v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 < 0x15)
            goto LABEL_59;
LABEL_62:
          v13 = v14;
          goto LABEL_16;
        }
LABEL_61:
        +[_DASLogCondition withCondition:](_DASLogCondition, "withCondition:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("0")))
      {
        v10 = CFSTR("None");
        goto LABEL_58;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("20")))
      {
        v10 = CFSTR("Minimally Viable");
        goto LABEL_58;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("50")))
      {
        v10 = CFSTR("Fair");
        goto LABEL_58;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("100")))
      {
        +[_DASLogCondition withCondition:](_DASLogCondition, "withCondition:", CFSTR("Best"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "containsString:", CFSTR("cell")) & 1) != 0)
          goto LABEL_59;
        goto LABEL_62;
      }
    }
    v11 = 0;
    goto LABEL_61;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("0")))
  {
    if (v5)
    {
      +[_DASLogCondition withCondition:](_DASLogCondition, "withCondition:", CFSTR("Under Thermal Pressure"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("10")))
    {
      v15 = CFSTR("Light");
LABEL_28:
      +[_DASLogCondition withCondition:](_DASLogCondition, "withCondition:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_59;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("1")) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", CFSTR("20")))
    {
      v15 = CFSTR("Moderate");
      goto LABEL_28;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("2")) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", CFSTR("30")))
    {
      v15 = CFSTR("Heavy");
      goto LABEL_28;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("3")) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", CFSTR("40"))
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("4")) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", CFSTR("50")))
    {
      v15 = CFSTR("Trapping");
      goto LABEL_28;
    }
    goto LABEL_61;
  }
LABEL_3:
  v9 = CFSTR("Nominal");
LABEL_15:
  +[_DASLogCondition withCondition:](_DASLogCondition, "withCondition:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
LABEL_16:
  objc_msgSend(v13, "setIsIdeal:", 1);
LABEL_59:
  v18 = v14;

  return v18;
}

- (void)addConditionToHistory:(id)a3 fromMessage:(id)a4 atTimestamp:(id)a5 compactRepresentation:(BOOL)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
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
  void *v31;
  _DASLogExtractor *v32;
  unsigned int v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v6 = a6;
  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v11, "containsString:", CFSTR("\n")))
  {
    getSubstring(v11, CFSTR("["), CFSTR("]"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "containsString:", CFSTR("quality")))
    {
      objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("\n"));
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v15)
      {
        v16 = v15;
        v32 = self;
        v33 = v6;
        v17 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v35 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            if (objc_msgSend(v19, "containsString:", CFSTR("quality"), v32))
            {
              objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" ;"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "componentsSeparatedByCharactersInSet:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)objc_msgSend(v22, "mutableCopy");

              objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_468);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "filterUsingPredicate:", v24);

              objc_msgSend(v23, "lastObject");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_15;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v16)
            continue;
          break;
        }
        v20 = 0;
LABEL_15:
        v6 = v33;
        self = v32;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(v25, "lastObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "substringWithRange:", 1, objc_msgSend(v28, "length") - 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[_DASLogExtractor objectForTrigger:fromCondition:compactRepresentation:](self, "objectForTrigger:fromCondition:compactRepresentation:", v26, v20, v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = v30;
    objc_msgSend(v30, "addCondition:atDate:", v29, v12);
  }
  else
  {
    +[_DASLogConditionHistory condition:fromDate:](_DASLogConditionHistory, "condition:fromDate:", v29, v12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v31, v26);

}

- (int)sysConditionsLog:(BOOL)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  FILE *v47;
  void *v48;
  id v49;
  const char *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  char v56;
  double v57;
  FILE *v58;
  const char *v59;
  double v60;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id obj;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[5];
  id v79;
  BOOL v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("subsystem = %@"), self->_subsystem);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("eventMessage contains \"Trigger:\"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v13);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("date <= %@"), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);

  }
  v15 = MEMORY[0x24BDAC760];
  v78[0] = MEMORY[0x24BDAC760];
  v78[1] = 3221225472;
  v78[2] = __55___DASLogExtractor_sysConditionsLog_startDate_endDate___block_invoke;
  v78[3] = &unk_24E138948;
  v78[4] = self;
  v16 = v10;
  v79 = v16;
  v80 = a3;
  v17 = -[_DASLogExtractor handleLogEventsLogEvents:sinceDate:withHandler:](self, "handleLogEventsLogEvents:sinceDate:withHandler:", v11, v8, v78);
  if (!v17)
  {
    v62 = v8;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v76[0] = v15;
    v76[1] = 3221225472;
    v76[2] = __55___DASLogExtractor_sysConditionsLog_startDate_endDate___block_invoke_2;
    v76[3] = &unk_24E138970;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v77 = v18;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v76);
    v65 = v11;
    v66 = v9;
    v63 = v18;
    v64 = v16;
    if ((unint64_t)objc_msgSend(v18, "count") >= 2)
    {
      do
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v19;
        v22 = v20;
        if (objc_msgSend(v21, "count") && objc_msgSend(v22, "count"))
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "count"))
          {
            v23 = 0;
            v24 = 0;
            v25 = 0;
            do
            {
              if (objc_msgSend(v22, "count") <= (unint64_t)v24)
                break;
              v26 = v24;
              objc_msgSend(v21, "objectAtIndexedSubscript:", v23);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectAtIndexedSubscript:", v24);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "intersectionWithDateInterval:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
                objc_msgSend(v70, "addObject:", v29);
              objc_msgSend(v21, "objectAtIndexedSubscript:", v23);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "endDate");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectAtIndexedSubscript:", v24);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "endDate");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v31, "compare:", v33);

              v23 = v34 == 1 ? v25 : v25 + 1;
              v24 = v34 == 1 ? v26 + 1 : v26;

              v25 = v23;
            }
            while (objc_msgSend(v21, "count") > v23);
          }
          v35 = (void *)objc_msgSend(v70, "copy");

          v11 = v65;
          v9 = v66;
          v18 = v63;
          v16 = v64;
        }
        else
        {
          v35 = (void *)MEMORY[0x24BDBD1A8];
        }

        objc_msgSend(v18, "addObject:", v35);
        objc_msgSend(v18, "removeObjectAtIndex:", 0);
        objc_msgSend(v18, "removeObjectAtIndex:", 0);

      }
      while ((unint64_t)objc_msgSend(v18, "count") > 1);
    }
    fwrite("Ideal Conditions:-----------\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8E8]);
    defaultFormatter();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (timeOnlyFormatter_onceToken != -1)
      dispatch_once(&timeOnlyFormatter_onceToken, &__block_literal_global_556);
    v69 = (id)timeOnlyFormatter_timeOnlyFormatter;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    objc_msgSend(v18, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    if (v71)
    {
      obj = v38;
      v68 = *(_QWORD *)v73;
      v39 = 0.0;
      do
      {
        for (i = 0; i != v71; ++i)
        {
          if (*(_QWORD *)v73 != v68)
            objc_enumerationMutation(obj);
          v41 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v41, "startDate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "components:fromDate:", 24, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "endDate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "components:fromDate:", 24, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v43, "isEqual:", v45);

          v47 = (FILE *)*MEMORY[0x24BDAC8E8];
          objc_msgSend(v41, "startDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringFromDate:", v48);
          v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v50 = (const char *)objc_msgSend(v49, "UTF8String");
          objc_msgSend(v41, "endDate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46)
            v52 = v69;
          else
            v52 = v36;
          objc_msgSend(v52, "stringFromDate:", v51);
          v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          fprintf(v47, "  %s - %s\n", v50, (const char *)objc_msgSend(v53, "UTF8String"));

          objc_msgSend(v41, "endDate");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v54, "isEqual:", v55);

          if ((v56 & 1) == 0)
          {
            objc_msgSend(v41, "duration");
            v39 = v39 + v57;
          }
        }
        v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
      }
      while (v71);

      v58 = (FILE *)*MEMORY[0x24BDAC8E8];
      if (v39 >= 3600.0)
      {
        v59 = "hours";
        v60 = v39 / 3600.0;
        v11 = v65;
        v9 = v66;
        v18 = v63;
        v16 = v64;
        goto LABEL_41;
      }
      v11 = v65;
      v9 = v66;
      v18 = v63;
      v16 = v64;
    }
    else
    {

      v58 = (FILE *)*MEMORY[0x24BDAC8E8];
      v39 = 0.0;
    }
    v59 = "minutes";
    v60 = v39 / 60.0;
LABEL_41:
    fprintf(v58, "Over the course of the log, there was %5.2f %s of \"ideal\" conditions.\n", v60, v59);

    v17 = 0;
    v8 = v62;
  }

  return v17;
}

- (OSLogEventStore)logStore
{
  return self->_logStore;
}

- (void)setLogStore:(id)a3
{
  objc_storeStrong((id *)&self->_logStore, a3);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (OSLogEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_eventStream, a3);
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (void)setSubsystem:(id)a3
{
  objc_storeStrong((id *)&self->_subsystem, a3);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_logStore, 0);
}

@end
