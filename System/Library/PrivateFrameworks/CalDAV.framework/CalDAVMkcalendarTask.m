@implementation CalDAVMkcalendarTask

- (CalDAVMkcalendarTask)initWithURL:(id)a3
{
  return -[CalDAVMkcalendarTask initWithPropertiesToSet:atURL:](self, "initWithPropertiesToSet:atURL:", 0, a3);
}

- (CalDAVMkcalendarTask)initWithPropertiesToSet:(id)a3 atURL:(id)a4
{
  id v6;
  CalDAVMkcalendarTask *v7;
  CalDAVMkcalendarTask *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CalDAVMkcalendarTask;
  v7 = -[CalDAVMkcalendarTask initWithURL:](&v10, sel_initWithURL_, a4);
  v8 = v7;
  if (v7)
    -[CalDAVMkcalendarTask setSetElements:](v7, "setSetElements:", v6);

  return v8;
}

- (void)setSupportForEvents:(BOOL)a3 tasks:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  CalDAVSupportedCalendarComponentSet *v7;
  CalDAVCompItem *v8;
  CalDAVCompItem *v9;
  __CFString **v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  id WeakRetained;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  if (a3 == a4)
  {
    v13 = a4;
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE1AC70]));
    objc_msgSend(v14, "logHandleForAccountInfoProvider:", WeakRetained);
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v19 = v4;
      v20 = 1024;
      v21 = v13;
      _os_log_impl(&dword_2096EB000, v16, OS_LOG_TYPE_INFO, "setSupportForEvents:tasks: called with identical values for supportVEVENT (%d) and supportVTODO (%d), doing nothing", buf, 0xEu);
    }

  }
  else
  {
    -[CalDAVMkcalendarTask setElements](self, "setElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(CalDAVSupportedCalendarComponentSet);
    v8 = objc_alloc_init(CalDAVCompItem);
    v9 = v8;
    v10 = cdEventComponentType;
    if (!v4)
      v10 = cdTodoComponentType;
    -[CalDAVCompItem setNameAttribute:](v8, "setNameAttribute:", *v10);
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVSupportedCalendarComponentSet setComps:](v7, "setComps:", v11);

    objc_msgSend(v17, "setByAddingObject:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVMkcalendarTask setSetElements:](self, "setSetElements:", v12);

  }
}

uint64_t __50__CalDAVMkcalendarTask_setSupportForEvents_tasks___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE1AF60]))
  {
    objc_msgSend(v2, "nameSpace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE1ACF8]);

    v6 = v5 ^ 1u;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  -[CalDAVMkcalendarTask setElements](self, "setElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CalDAVMkcalendarTask setElements](self, "setElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

  }
  else
  {
    v5 = 0;
  }

  -[CalDAVMkcalendarTask requestBody](self, "requestBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8 = objc_retainAutorelease(v6);
  v9 = (void *)objc_msgSend(v7, "initWithBytes:length:encoding:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), 4);
  v10 = (void *)MEMORY[0x24BDD17C8];
  v14.receiver = self;
  v14.super_class = (Class)CalDAVMkcalendarTask;
  -[CalDAVMkcalendarTask description](&v14, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("[%@] Number of properties to set: [%u], Request body: [%@]"), v11, v5, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)httpMethod
{
  return CFSTR("MKCALENDAR");
}

- (id)requestBody
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[CalDAVMkcalendarTask setElements](self, "setElements");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[CalDAVMkcalendarTask setElements](self, "setElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0;
  v7 = objc_alloc_init(MEMORY[0x24BE1ABD8]);
  objc_msgSend(v7, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("mkcalendar"), *MEMORY[0x24BE1ACF8], 0);
  -[CalDAVMkcalendarTask setElements](self, "setElements");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CalDAVMkcalendarTask setElements](self, "setElements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    v12 = *MEMORY[0x24BE1AE30];
    if (v11)
    {
      v13 = *MEMORY[0x24BE1AF50];
      objc_msgSend(v7, "startElement:inNamespace:withAttributeNamesAndValues:", *MEMORY[0x24BE1AF50], *MEMORY[0x24BE1AE30], 0);
      v14 = *MEMORY[0x24BE1AF00];
      objc_msgSend(v7, "startElement:inNamespace:withAttributeNamesAndValues:", *MEMORY[0x24BE1AF00], v12, 0);
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[CalDAVMkcalendarTask setElements](self, "setElements", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v23;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v23 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19++), "write:", v7);
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v17);
      }

      objc_msgSend(v7, "endElement:inNamespace:", v14, v12);
      objc_msgSend(v7, "endElement:inNamespace:", v13, v12);
    }
  }
  else
  {
    v12 = *MEMORY[0x24BE1AE30];
  }
  objc_msgSend(v7, "endElement:inNamespace:", CFSTR("mkcalendar"), v12);
  objc_msgSend(v7, "data");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = objc_alloc(MEMORY[0x24BE1ABE0]);
  v5 = *MEMORY[0x24BE1ACF8];
  v6 = objc_opt_class();
  -[CalDAVMkcalendarTask url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithRootElementNameSpace:name:parseClass:baseURL:", v5, CFSTR("mkcalendar-response"), v6, v7);

  return v8;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "code");
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE1AC70]));
    objc_msgSend(v7, "logHandleForAccountInfoProvider:", WeakRetained);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == 1)
    {
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v22 = (id)objc_opt_class();
          v11 = v22;
          v12 = "%{public}@ cancelled";
          v13 = v10;
          v14 = OS_LOG_TYPE_INFO;
          v15 = 12;
LABEL_9:
          _os_log_impl(&dword_2096EB000, v13, v14, v12, buf, v15);

          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (v9)
    {
      v16 = v9;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v22 = (id)objc_opt_class();
        v23 = 2112;
        v24 = v5;
        v11 = v22;
        v12 = "%{public}@ failed: %@";
        v13 = v16;
        v14 = OS_LOG_TYPE_ERROR;
        v15 = 22;
        goto LABEL_9;
      }
LABEL_10:

    }
  }
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE1AC78]) = 0;
  -[CalDAVMkcalendarTask delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[CalDAVMkcalendarTask delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mkcalendarTask:error:", self, v5);

  }
  v20.receiver = self;
  v20.super_class = (Class)CalDAVMkcalendarTask;
  -[CalDAVMkcalendarTask finishCoreDAVTaskWithError:](&v20, sel_finishCoreDAVTaskWithError_, v5);

}

- (NSSet)setElements
{
  return self->_setElements;
}

- (void)setSetElements:(id)a3
{
  objc_storeStrong((id *)&self->_setElements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setElements, 0);
}

@end
