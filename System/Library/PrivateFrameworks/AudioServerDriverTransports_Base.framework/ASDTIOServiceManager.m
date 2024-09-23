@implementation ASDTIOServiceManager

+ (id)forIOServiceWithClassName:(id)a3 withIDProperty:(id)a4 managerClass:(Class)a5
{
  id v7;
  id v8;
  char v9;
  void *v10;
  uint64_t v11;

  v7 = a3;
  v8 = a4;
  if (forIOServiceWithClassName_withIDProperty_managerClass__predicate == -1)
  {
    if (a5)
    {
LABEL_3:
      v9 = -[objc_class isSubclassOfClass:](a5, "isSubclassOfClass:", objc_opt_class());
      v10 = 0;
      if (!v7 || (v9 & 1) == 0)
        goto LABEL_15;
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&forIOServiceWithClassName_withIDProperty_managerClass__predicate, &__block_literal_global);
    if (a5)
      goto LABEL_3;
  }
  if (!v7)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_15;
  }
LABEL_8:
  if ((objc_msgSend(v7, "isEqualToString:", &stru_250842438) & 1) != 0)
    goto LABEL_9;
  objc_msgSend((id)gServiceManagerLock, "lock");
  objc_msgSend((id)gServiceManagerDictionary, "objectForKey:", v7);
  v11 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v11;
  if (a5)
  {
    if (!v11)
    {
      v10 = (void *)objc_msgSend([a5 alloc], "initForIOServiceWithClassName:andIDProperty:", v7, v8);
      if (v10)
        objc_msgSend((id)gServiceManagerDictionary, "setObject:forKey:", v10, v7);
    }
  }
  objc_msgSend((id)gServiceManagerLock, "unlock");
LABEL_15:

  return v10;
}

void __78__ASDTIOServiceManager_forIOServiceWithClassName_withIDProperty_managerClass___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v1 = (void *)gServiceManagerLock;
  gServiceManagerLock = (uint64_t)v0;

  objc_msgSend((id)gServiceManagerLock, "setName:", CFSTR("com.apple.AudioServerDriverTransports.ASDTIOServiceManager"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)gServiceManagerDictionary;
  gServiceManagerDictionary = v2;

}

+ (id)ioServiceClassName
{
  return 0;
}

+ (id)ioServiceIDProperty
{
  return 0;
}

+ (id)get
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "ioServiceClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ioServiceIDProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "forIOServiceWithClassName:withIDProperty:managerClass:", v3, v4, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)forIOServiceWithClassName:(id)a3
{
  return (id)objc_msgSend(a1, "forIOServiceWithClassName:withIDProperty:managerClass:", a3, 0, 0);
}

+ (Class)ioServiceMatcherClass
{
  return (Class)objc_opt_class();
}

- (id)initForIOServiceWithClassName:(id)a3 andIDProperty:(id)a4
{
  id v7;
  id v8;
  ASDTIOServiceManager *v9;
  ASDTIOServiceManager *v10;
  void *v11;
  objc_class *v12;
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
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  ASDTIOServiceManager *v32;
  void *v34;
  objc_super v35;

  v7 = a3;
  v8 = a4;
  if (!v7 || objc_msgSend(v7, "isEqualToString:", &stru_250842438))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTIOServiceManager initForIOServiceWithClassName:andIDProperty:].cold.3();
      if (v7)
      {
LABEL_5:
        if (!objc_msgSend(v7, "isEqualToString:", &stru_250842438))
          goto LABEL_6;
      }
    }
    else if (v7)
    {
      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTIOServiceManager.m"), 190, CFSTR("Bad argument."));

  }
LABEL_6:
  v35.receiver = self;
  v35.super_class = (Class)ASDTIOServiceManager;
  v9 = -[ASDTIOServiceManager init](&v35, sel_init);
  v10 = v9;
  if (v9)
  {
    -[ASDTIOServiceManager setIdProperty:](v9, "setIdProperty:", v8);
    -[ASDTIOServiceManager setIoServiceClassName:](v10, "setIoServiceClassName:", v7);
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOServiceManager ioServiceClassName](v10, "ioServiceClassName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOServiceManager setName:](v10, "setName:", v15);

    v16 = (void *)MEMORY[0x24BDD17C8];
    -[ASDTIOServiceManager name](v10, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%s.%@"), "com.apple.AudioServerDriverTransports", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASDTCondition conditionWithName:](ASDTCondition, "conditionWithName:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOServiceManager setCond:](v10, "setCond:", v19);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOServiceManager setDelegates:](v10, "setDelegates:", v20);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOServiceManager setIoServices:](v10, "setIoServices:", v21);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOServiceManager setIoServicesByIdentifier:](v10, "setIoServicesByIdentifier:", v22);

    -[ASDTIOServiceManager cond](v10, "cond");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_15;
    v24 = (void *)v23;
    -[ASDTIOServiceManager delegates](v10, "delegates");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      -[ASDTIOServiceManager ioServices](v10, "ioServices");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)v27;
        -[ASDTIOServiceManager ioServicesByIdentifier](v10, "ioServicesByIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          -[ASDTIOServiceManager allocateMatcher](v10, "allocateMatcher");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDTIOServiceManager setMatcher:](v10, "setMatcher:", v30);

          -[ASDTIOServiceManager matcher](v10, "matcher");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
            goto LABEL_12;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ASDTIOServiceManager initForIOServiceWithClassName:andIDProperty:].cold.2(v10);
LABEL_17:
          v32 = 0;
          goto LABEL_18;
        }
LABEL_15:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ASDTPMAction initWithConfig:forSequencer:].cold.1(v10);
        goto LABEL_17;
      }

    }
    goto LABEL_15;
  }
LABEL_12:
  v32 = v10;
LABEL_18:

  return v32;
}

- (id)allocateMatcher
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "ioServiceMatcherClass"));
  -[ASDTIOServiceManager ioServiceClassName](self, "ioServiceClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initForIOServiceWithClassName:withDelegate:", v4, self);

  return v5;
}

- (NSArray)delegateList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ASDTIOServiceManager cond](self, "cond");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[ASDTIOServiceManager delegates](self, "delegates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[ASDTIOServiceManager cond](self, "cond");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  return (NSArray *)v5;
}

- (id)createIOServiceForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;
  int v14;
  void *v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ASDTIOServiceManager serviceForIOObject:andIDValue:](self, "serviceForIOObject:andIDValue:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDTIOServiceManager name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTIOServiceManager idProperty](self, "idProperty");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[ASDTIOServiceManager idProperty](self, "idProperty");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = CFSTR("identifier");
      }
      v14 = 138412802;
      v15 = v8;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: IOService with %@ '%@' is ready.", (uint8_t *)&v14, 0x20u);
      if (v9)

    }
    -[ASDTIOServiceManager ioServices](self, "ioServices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v7, v6);

    v12 = v7;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTIOServiceManager createIOServiceForIOObject:andIDValue:].cold.1(self, (uint64_t)v6, v4);
  }

  return v7;
}

- (id)findOrAddIOServiceForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ASDTIOServiceManager ioServices](self, "ioServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[ASDTIOServiceManager ioServicesByIdentifier](self, "ioServicesByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[ASDTIOServiceManager createIOServiceForIOObject:andIDValue:](self, "createIOServiceForIOObject:andIDValue:", objc_msgSend(v10, "ioObject"), v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)addDelegate:(id)a3 forIDValues:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[16];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[ASDTIOServiceManager cond](self, "cond");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lock");

  -[ASDTIOServiceManager matcher](self, "matcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOServiceManager addDelegate:forIDValues:].cold.4(self);
    -[ASDTIOServiceManager matcher](self, "matcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTIOServiceManager name](self, "name");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTIOServiceManager.m"), 275, CFSTR("%@: Failed to allocate ASDTIOServiceMatcher."), v50);

    }
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[ASDTIOServiceManager delegates](self, "delegates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v64;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v64 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v17, "delegate");
        v18 = (id)objc_claimAutoreleasedReturnValue();

        if (v18 == v7)
        {
          if (v8)
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "idValues");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "count");

            if (v23)
            {
              objc_msgSend(v17, "idValues");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "allObjects");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addObjectsFromArray:", v25);

            }
            objc_msgSend(v21, "addObjectsFromArray:", v8);
            v26 = (void *)objc_msgSend(v21, "copy");
            objc_msgSend(v17, "setIdValues:", v26);

          }
          else
          {
            objc_msgSend(v17, "setIdValues:", 0);
          }
          goto LABEL_21;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      if (v14)
        continue;
      break;
    }
  }

  +[ASDTIOServiceManagerDelegateProxy forDelegate:andIDValues:](ASDTIOServiceManagerDelegateProxy, "forDelegate:andIDValues:", v7, v8);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v12 = (void *)v19;
    -[ASDTIOServiceManager delegates](self, "delegates");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v12);

LABEL_21:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[ASDTIOServiceManager addDelegate:forIDValues:].cold.3(self);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v8)
    {
      objc_msgSend(v28, "addObjectsFromArray:", v8);
    }
    else
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      -[ASDTIOServiceManager ioServicesByIdentifier](self, "ioServicesByIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "allKeys");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v60;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v60 != v34)
              objc_enumerationMutation(v31);
            +[ASDTIOServiceID forIdentifier:andClientType:](ASDTIOServiceID, "forIdentifier:andClientType:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j), 0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              objc_msgSend(v29, "addObject:", v36);
            }
            else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              -[ASDTIOServiceManager addDelegate:forIDValues:].cold.2((uint64_t)v69, (uint64_t)self);
            }

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
        }
        while (v33);
      }

      v8 = 0;
    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v37 = v29;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v56;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v56 != v40)
            objc_enumerationMutation(v37);
          -[ASDTIOServiceManager findOrAddIOServiceForID:](self, "findOrAddIOServiceForID:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
            objc_msgSend(v27, "addObject:", v42);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      }
      while (v39);
    }

    -[ASDTIOServiceManager cond](self, "cond");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "unlock");

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v44 = v27;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v52;
      do
      {
        for (m = 0; m != v46; ++m)
        {
          if (*(_QWORD *)v52 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(v7, "ioServiceAvailable:withManager:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * m), self);
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
      }
      while (v46);
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTPMAction initWithConfig:forSequencer:].cold.1(self);
    -[ASDTIOServiceManager cond](self, "cond");
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "unlock");
  }

}

- (void)removeDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ASDTIOServiceManager cond](self, "cond");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ASDTIOServiceManager delegates](self, "delegates", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "delegate");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(v12, "delegate");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          if (v15 != v4)
            continue;
        }
        objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  -[ASDTIOServiceManager delegates](self, "delegates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectsInArray:", v6);

  -[ASDTIOServiceManager cond](self, "cond");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlock");

}

- (BOOL)ioServiceCanBeAdded:(id)a3
{
  return 1;
}

- (id)serviceForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  return +[ASDTIOService forIOObject:andIDValue:](ASDTIOService, "forIOObject:andIDValue:", *(_QWORD *)&a3, a4);
}

- (id)matchedIOServiceForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ASDTIOServiceManager cond](self, "cond");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ASDTIOServiceManager findOrAddIOServiceForID:](self, "findOrAddIOServiceForID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASDTIOServiceManager cond](self, "cond");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  return v6;
}

+ (id)matchedIOServiceForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "get");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchedIOServiceForID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getIdentifierForIOObject:(unsigned int)a3 withProperties:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[ASDTIOServiceManager idProperty](self, "idProperty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ASDTIOServiceManager idProperty](self, "idProperty");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ASDTIOServiceManager getIdentifierForIOObject:withProperties:].cold.1(self);
      v9 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%08x"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)matchedIOService:(unsigned int)a3 withProperties:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  ASDTIOServiceManager *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  id v18;
  ASDTIOServiceManager *v19;
  void *v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id obj;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  unsigned int v70;
  void *v71;
  ASDTIOServiceManager *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint8_t v97[128];
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  __CFString *v101;
  __int16 v102;
  void *v103;
  uint64_t v104;

  v4 = *(_QWORD *)&a3;
  v104 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v70 = v4;
  -[ASDTIOServiceManager getIdentifierForIOObject:withProperties:](self, "getIdentifierForIOObject:withProperties:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && -[ASDTIOServiceManager ioServiceCanBeAdded:](self, "ioServiceCanBeAdded:", v6))
  {
    -[ASDTIOServiceManager cond](self, "cond");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lock");

    v72 = self;
    -[ASDTIOServiceManager ioServicesByIdentifier](self, "ioServicesByIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ASDTIOServiceManager matchedIOService:withProperties:].cold.3(self);
      -[ASDTIOServiceManager cond](self, "cond");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unlock");
    }
    else
    {
      +[ASDTIOServiceID forIdentifier:andClientType:](ASDTIOServiceID, "forIdentifier:andClientType:", v7, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASDTIOService forIOObject:andIDValue:](ASDTIOService, "forIOObject:andIDValue:", v70, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v10 = (void *)v12;
        v63 = v11;
        v13 = self;
        -[ASDTIOServiceManager ioServicesByIdentifier](self, "ioServicesByIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v10, v7);

        v71 = v7;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          -[ASDTIOServiceManager name](self, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDTIOServiceManager idProperty](self, "idProperty");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            -[ASDTIOServiceManager idProperty](v72, "idProperty");
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v17 = CFSTR("identifier");
          }
          *(_DWORD *)buf = 138412802;
          v99 = v15;
          v100 = 2112;
          v101 = v17;
          v102 = 2112;
          v103 = v7;
          _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: IOServices with %@ '%@' ready to match.", buf, 0x20u);
          if (v16)

          v13 = v72;
        }
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        -[ASDTIOServiceManager delegates](v13, "delegates");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
        v62 = v6;
        if (v67)
        {
          v19 = v13;
          v20 = 0;
          v65 = 0;
          v66 = *(_QWORD *)v90;
          do
          {
            for (i = 0; i != v67; ++i)
            {
              if (*(_QWORD *)v90 != v66)
                objc_enumerationMutation(obj);
              v22 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
              objc_msgSend(v22, "delegate", v62);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                v68 = v20;
                v69 = i;
                objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "idValues");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "count");

                if (v26)
                {
                  v87 = 0u;
                  v88 = 0u;
                  v85 = 0u;
                  v86 = 0u;
                  objc_msgSend(v22, "idValues");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
                  if (v28)
                  {
                    v29 = v28;
                    v30 = *(_QWORD *)v86;
                    do
                    {
                      for (j = 0; j != v29; ++j)
                      {
                        if (*(_QWORD *)v86 != v30)
                          objc_enumerationMutation(v27);
                        v32 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
                        objc_msgSend(v32, "identifier");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        v34 = objc_msgSend(v33, "isEqual:", v71);

                        if (v34)
                          objc_msgSend(v24, "addObject:", v32);
                      }
                      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
                    }
                    while (v29);
                  }

                  v19 = v72;
                }
                else
                {
                  objc_msgSend(v24, "addObject:", v63);
                }
                v83 = 0u;
                v84 = 0u;
                v81 = 0u;
                v82 = 0u;
                v36 = v24;
                v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
                if (v37)
                {
                  v38 = v37;
                  v39 = *(_QWORD *)v82;
                  v20 = v68;
                  do
                  {
                    v40 = 0;
                    do
                    {
                      if (*(_QWORD *)v82 != v39)
                        objc_enumerationMutation(v36);
                      v41 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v40);
                      -[ASDTIOServiceManager ioServices](v19, "ioServices");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v42, "objectForKey:", v41);
                      v43 = objc_claimAutoreleasedReturnValue();

                      v10 = (void *)v43;
                      if (v43
                        || (-[ASDTIOServiceManager createIOServiceForIOObject:andIDValue:](v72, "createIOServiceForIOObject:andIDValue:", v70, v41), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                      {
                        objc_msgSend(v22, "delegate");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        +[ASDTIOServiceManagerDelegatePair forDelegate:andIOService:](ASDTIOServiceManagerDelegatePair, "forDelegate:andIOService:", v44, v10);
                        v45 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v45)
                        {
                          v19 = v72;
                          if (!v20)
                          {
                            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
                            v20 = (void *)objc_claimAutoreleasedReturnValue();
                          }
                          objc_msgSend(v20, "addObject:", v45);
                        }
                        else
                        {
                          v19 = v72;
                          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                            -[ASDTIOServiceManager matchedIOService:withProperties:].cold.2((uint64_t)buf, (uint64_t)v72);
                        }

                      }
                      else
                      {
                        v19 = v72;
                      }
                      ++v40;
                    }
                    while (v38 != v40);
                    v46 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
                    v38 = v46;
                  }
                  while (v46);
                }
                else
                {
                  v20 = v68;
                }

                i = v69;
              }
              else
              {
                v35 = v65;
                if (!v65)
                {
                  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v65 = v35;
                objc_msgSend(v35, "addObject:", v22);
              }
            }
            v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
          }
          while (v67);
        }
        else
        {
          v65 = 0;
          v20 = 0;
        }

        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v47 = v65;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v78;
          do
          {
            for (k = 0; k != v49; ++k)
            {
              if (*(_QWORD *)v78 != v50)
                objc_enumerationMutation(v47);
              v52 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
              -[ASDTIOServiceManager delegates](v72, "delegates", v62);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "removeObject:", v52);

            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
          }
          while (v49);
        }

        -[ASDTIOServiceManager cond](v72, "cond");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "unlock");

        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v18 = v20;
        v55 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
        if (v55)
        {
          v56 = v55;
          v57 = *(_QWORD *)v74;
          do
          {
            for (m = 0; m != v56; ++m)
            {
              if (*(_QWORD *)v74 != v57)
                objc_enumerationMutation(v18);
              v59 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * m);
              objc_msgSend(v59, "delegate", v62);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "ioService");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "ioServiceAvailable:withManager:", v61, v72);

            }
            v56 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
          }
          while (v56);
        }

        v6 = v62;
        v11 = v63;
        v7 = v71;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ASDTIOServiceManager matchedIOService:withProperties:].cold.1(self);
        -[ASDTIOServiceManager cond](self, "cond");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "unlock");
        v10 = 0;
      }

    }
  }

}

- (void)ioServiceWillTerminate:(unsigned int)a3 withProperties:(id)a4
{
  __CFString *v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  ASDTIOServiceManager *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t m;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t n;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  id obj;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  id v93;
  ASDTIOServiceManager *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
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
  __int128 v121;
  __int128 v122;
  uint8_t v123[128];
  uint8_t buf[4];
  void *v125;
  __int16 v126;
  const __CFString *v127;
  __int16 v128;
  uint64_t v129;
  _BYTE v130[128];
  _BYTE v131[128];
  char v132[16];
  _BYTE v133[128];
  _BYTE v134[128];
  char v135[24];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v5 = *(_QWORD *)&a3;
  v138 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[ASDTIOServiceManager getIdentifierForIOObject:withProperties:](self, "getIdentifierForIOObject:withProperties:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ASDTIOServiceManager cond](self, "cond");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lock");

    -[ASDTIOServiceManager ioServicesByIdentifier](self, "ioServicesByIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v94 = self;
    if (v11)
    {
      v82 = v11;
      v83 = v7;
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = 0u;
      v120 = 0u;
      v121 = 0u;
      v122 = 0u;
      -[ASDTIOServiceManager ioServices](self, "ioServices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
      v89 = v8;
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v120;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v120 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
            objc_msgSend(v18, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", v8);

            if (v20)
              objc_msgSend(v86, "addObject:", v18);
            v8 = v89;
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
        }
        while (v15);
      }

      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v21 = v94;
      -[ASDTIOServiceManager delegates](v94, "delegates");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v136, 16);
      if (!v22)
      {
        v24 = 0;
        v25 = 0;
        goto LABEL_65;
      }
      v23 = v22;
      v24 = 0;
      v25 = 0;
      v26 = *(_QWORD *)v116;
      v84 = *(_QWORD *)v116;
      while (1)
      {
        v27 = 0;
        v85 = v23;
        do
        {
          if (*(_QWORD *)v116 != v26)
            objc_enumerationMutation(obj);
          v90 = v27;
          v28 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v27);
          objc_msgSend(v28, "delegate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v28, "delegate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_opt_respondsToSelector();

            if ((v31 & 1) != 0)
            {
              v88 = v24;
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
              v92 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "idValues");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "count");

              if (v33)
              {
                v113 = 0u;
                v114 = 0u;
                v111 = 0u;
                v112 = 0u;
                objc_msgSend(v28, "idValues");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v111, v134, 16);
                if (v35)
                {
                  v36 = v35;
                  v37 = *(_QWORD *)v112;
                  do
                  {
                    for (j = 0; j != v36; ++j)
                    {
                      if (*(_QWORD *)v112 != v37)
                        objc_enumerationMutation(v34);
                      v39 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * j);
                      objc_msgSend(v39, "identifier");
                      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      v40 = -[__CFString isEqualToString:](v4, "isEqualToString:", v89);

                      if (v40)
                        objc_msgSend(v92, "addObject:", v39);
                    }
                    v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v111, v134, 16);
                  }
                  while (v36);
                  v21 = v94;
                }
LABEL_36:

                v109 = 0u;
                v110 = 0u;
                v107 = 0u;
                v108 = 0u;
                v43 = v92;
                v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v107, v133, 16);
                if (!v44)
                  goto LABEL_53;
                v45 = v44;
                v46 = *(_QWORD *)v108;
                while (2)
                {
                  v47 = 0;
LABEL_39:
                  if (*(_QWORD *)v108 != v46)
                    objc_enumerationMutation(v43);
                  v48 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * v47);
                  -[ASDTIOServiceManager ioServices](v21, "ioServices");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "objectForKey:", v48);
                  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  if (v4)
                  {
                    objc_msgSend(v28, "delegate");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    +[ASDTIOServiceManagerDelegatePair forDelegate:andIOService:](ASDTIOServiceManagerDelegatePair, "forDelegate:andIOService:", v50, v4);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v51)
                    {
                      if (!v25)
                      {
                        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      objc_msgSend(v25, "addObject:", v51);
LABEL_47:
                      v21 = v94;
                    }
                    else
                    {
                      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        goto LABEL_47;
                      v21 = v94;
                      -[ASDTIOServiceManager matchedIOService:withProperties:].cold.2((uint64_t)v132, (uint64_t)v94);
                    }

                  }
                  if (v45 == ++v47)
                  {
                    v52 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v107, v133, 16);
                    v45 = v52;
                    if (!v52)
                    {
LABEL_53:

                      v8 = v89;
                      v24 = v88;
                      v26 = v84;
                      v23 = v85;
                      goto LABEL_54;
                    }
                    continue;
                  }
                  goto LABEL_39;
                }
              }
              v8 = v89;
              +[ASDTIOServiceID forIdentifier:andClientType:](ASDTIOServiceID, "forIdentifier:andClientType:", v89, 0);
              v42 = objc_claimAutoreleasedReturnValue();
              if (v42)
              {
                v34 = (void *)v42;
                objc_msgSend(v92, "addObject:", v42);
                goto LABEL_36;
              }
              v26 = v84;
              v23 = v85;
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ASDTIOServiceManager matchedIOService:withProperties:].cold.2((uint64_t)v135, (uint64_t)v21);
LABEL_54:
              v41 = v90;

            }
            else
            {
              v8 = v89;
              v41 = v90;
            }
          }
          else
          {
            if (!v24)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v24, "addObject:", v28);
            v41 = v90;
          }
          v27 = v41 + 1;
        }
        while (v27 != v23);
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v136, 16);
        v23 = v53;
        if (!v53)
        {
LABEL_65:

          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          v55 = v24;
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v103, v131, 16);
          if (v56)
          {
            v57 = v56;
            v58 = *(_QWORD *)v104;
            do
            {
              for (k = 0; k != v57; ++k)
              {
                if (*(_QWORD *)v104 != v58)
                  objc_enumerationMutation(v55);
                v60 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * k);
                -[ASDTIOServiceManager delegates](v94, "delegates");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "removeObject:", v60);

              }
              v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v103, v131, 16);
            }
            while (v57);
          }
          v91 = v55;

          -[ASDTIOServiceManager ioServicesByIdentifier](v94, "ioServicesByIdentifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "removeObjectForKey:", v8);

          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          v93 = v86;
          v63 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v99, v130, 16);
          if (v63)
          {
            v64 = v63;
            v65 = *(_QWORD *)v100;
            v66 = MEMORY[0x24BDACB70];
            do
            {
              for (m = 0; m != v64; ++m)
              {
                if (*(_QWORD *)v100 != v65)
                  objc_enumerationMutation(v93);
                v68 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * m);
                v69 = v66;
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                {
                  -[ASDTIOServiceManager name](v94, "name");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ASDTIOServiceManager idProperty](v94, "idProperty");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v71)
                  {
                    -[ASDTIOServiceManager idProperty](v94, "idProperty");
                    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    v72 = v4;
                  }
                  else
                  {
                    v72 = CFSTR("identifier");
                  }
                  *(_DWORD *)buf = 138412802;
                  v125 = v70;
                  v126 = 2112;
                  v127 = v72;
                  v128 = 2112;
                  v129 = v68;
                  _os_log_impl(&dword_236CEE000, v66, OS_LOG_TYPE_DEFAULT, "%@: IOService with %@ value '%@' will terminate.", buf, 0x20u);
                  if (v71)

                }
                -[ASDTIOServiceManager ioServices](v94, "ioServices");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "removeObjectForKey:", v68);

              }
              v64 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v99, v130, 16);
            }
            while (v64);
          }

          -[ASDTIOServiceManager cond](v94, "cond");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "unlock");

          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          v54 = v25;
          v75 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v95, v123, 16);
          v8 = v89;
          if (v75)
          {
            v76 = v75;
            v77 = *(_QWORD *)v96;
            do
            {
              for (n = 0; n != v76; ++n)
              {
                if (*(_QWORD *)v96 != v77)
                  objc_enumerationMutation(v54);
                v79 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * n);
                objc_msgSend(v79, "delegate");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "ioService");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "ioServiceWillTerminate:withManager:", v81, v94);

              }
              v76 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v95, v123, 16);
            }
            while (v76);
          }

          v11 = v82;
          v7 = v83;
          goto LABEL_94;
        }
      }
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[ASDTIOServiceManager ioServiceWillTerminate:withProperties:].cold.1(self);
    -[ASDTIOServiceManager cond](self, "cond");
    v54 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "unlock");
LABEL_94:

  }
}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ASDTIOServiceManager cond](self, "cond");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[ASDTIOServiceManager ioServices](self, "ioServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[ASDTIOServiceManager ioServicesByIdentifier](self, "ioServicesByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[ASDTIOServiceManager delegates](self, "delegates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[ASDTIOServiceManager allocateMatcher](self, "allocateMatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTIOServiceManager setMatcher:](self, "setMatcher:", v7);

  -[ASDTIOServiceManager cond](self, "cond");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

+ (void)resetAll
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)gServiceManagerLock, "lock");
  objc_msgSend((id)gServiceManagerDictionary, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gServiceManagerLock, "unlock");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "reset", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (id)dependencyForID:(id)a3 andConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "get");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ioServiceClassName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDTIOServiceDependency forClassName:idValue:andConfiguration:](ASDTIOServiceDependency, "forClassName:idValue:andConfiguration:", v9, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)dependencyForIdentifier:(id)a3 andConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "get");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ioServiceClassName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDTIOServiceID forIdentifier:andClientType:](ASDTIOServiceID, "forIdentifier:andClientType:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASDTIOServiceDependency forClassName:idValue:andConfiguration:](ASDTIOServiceDependency, "forClassName:idValue:andConfiguration:", v9, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)dependencyForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "get");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ioServiceClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDTIOServiceDependency forAnyInstanceOfClassName:andConfiguration:](ASDTIOServiceDependency, "forAnyInstanceOfClassName:andConfiguration:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)ioServiceClassName
{
  return self->_ioServiceClassName;
}

- (void)setIoServiceClassName:(id)a3
{
  objc_storeStrong((id *)&self->_ioServiceClassName, a3);
}

- (ASDTIOServiceMatcher)matcher
{
  return self->_matcher;
}

- (void)setMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_matcher, a3);
}

- (NSString)idProperty
{
  return self->_idProperty;
}

- (void)setIdProperty:(id)a3
{
  objc_storeStrong((id *)&self->_idProperty, a3);
}

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (NSMutableDictionary)ioServices
{
  return self->_ioServices;
}

- (void)setIoServices:(id)a3
{
  objc_storeStrong((id *)&self->_ioServices, a3);
}

- (NSMutableDictionary)ioServicesByIdentifier
{
  return self->_ioServicesByIdentifier;
}

- (void)setIoServicesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ioServicesByIdentifier, a3);
}

- (ASDTCondition)cond
{
  return self->_cond;
}

- (void)setCond:(id)a3
{
  objc_storeStrong((id *)&self->_cond, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cond, 0);
  objc_storeStrong((id *)&self->_ioServicesByIdentifier, 0);
  objc_storeStrong((id *)&self->_ioServices, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_idProperty, 0);
  objc_storeStrong((id *)&self->_matcher, 0);
  objc_storeStrong((id *)&self->_ioServiceClassName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initForIOServiceWithClassName:(void *)a1 andIDProperty:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Failed to allocate matcher.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)initForIOServiceWithClassName:andIDProperty:.cold.3()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Bad argument.", v0, 2u);
}

- (void)createIOServiceForIOObject:(int)a3 andIDValue:.cold.1(void *a1, uint64_t a2, int a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  v7 = 1024;
  v8 = a3;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Failed creating object for IOService: %x with ID: %@", v6, 0x1Cu);

}

- (void)addDelegate:(uint64_t)a1 forIDValues:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend((id)OUTLINED_FUNCTION_6_1(a1, a2), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_3(&dword_236CEE000, MEMORY[0x24BDACB70], v3, "%@: Memory allocation error while adding delegate.");

  OUTLINED_FUNCTION_5_0();
}

- (void)addDelegate:(void *)a1 forIDValues:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_7_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Adding delegate for IDs: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)addDelegate:(void *)a1 forIDValues:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Failed to allocate ASDTIOServiceMatcher.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)getIdentifierForIOObject:(void *)a1 withProperties:.cold.1(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "idProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v3, "%@: ioService missing property with key '%@'", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)matchedIOService:(void *)a1 withProperties:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Failed to create IOService for identifier '%@'", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)matchedIOService:(uint64_t)a1 withProperties:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend((id)OUTLINED_FUNCTION_6_1(a1, a2), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_3(&dword_236CEE000, MEMORY[0x24BDACB70], v3, "%@: Memory allocation error.");

  OUTLINED_FUNCTION_5_0();
}

- (void)matchedIOService:(void *)a1 withProperties:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Duplicate IOService for identifier '%@'", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)ioServiceWillTerminate:(void *)a1 withProperties:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_7_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Not managing IOService with identifier: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

@end
