@implementation CoreDAVSRVLookupTask

- (CoreDAVSRVLookupTask)initWithServiceString:(id)a3
{
  id v5;
  void *v6;
  CoreDAVSRVLookupTask *v7;
  CoreDAVSRVLookupTask *v8;
  NSArray *fetchedRecords;
  id v11;
  objc_super v12;

  v5 = a3;
  if (!v5 || (v6 = v5, !objc_msgSend(v5, "length")))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Non-nil and non-zero length 'serviceSting' required."), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVSRVLookupTask;
  v7 = -[CoreDAVTask initWithURL:](&v12, sel_initWithURL_, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_serviceString, a3);
    fetchedRecords = v8->_fetchedRecords;
    v8->_fetchedRecords = 0;

  }
  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVSRVLookupTask;
  -[CoreDAVTask description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVSRVLookupTask serviceString](self, "serviceString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("|  Service string: [%@]"), v5);

  -[CoreDAVSRVLookupTask fetchedRecords](self, "fetchedRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Number of SRV records: [%lu]"), objc_msgSend(v6, "count"));

  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (void)performCoreDAVTask
{
  OS_nw_resolver *resolver;
  NSTimer *timeoutTimer;
  NSTimer *v5;
  id v6;
  void *srv;
  nw_parameters_t v8;
  OS_nw_resolver *v9;
  OS_nw_resolver *v10;
  OS_nw_resolver *v11;
  uint64_t v12;
  double v13;
  NSTimer *v14;
  NSTimer *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  CoreDAVSRVLookupTask *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, int, void *);
  void *v26;
  CoreDAVSRVLookupTask *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  CoreDAVSRVLookupTask *v32;

  if (self->_resolver)
  {
    nw_resolver_set_cancel_handler();
    nw_resolver_cancel();
    resolver = self->_resolver;
    self->_resolver = 0;

  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    -[NSTimer invalidate](timeoutTimer, "invalidate");
    v5 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  -[CoreDAVSRVLookupTask serviceString](self, "serviceString");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "UTF8String");
  srv = (void *)nw_endpoint_create_srv();

  v8 = nw_parameters_create();
  v9 = (OS_nw_resolver *)nw_resolver_create_with_endpoint();
  v10 = self->_resolver;
  self->_resolver = v9;
  v11 = v9;

  v12 = MEMORY[0x24BDAC760];
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_2;
  v31 = &unk_24C1D9A40;
  v32 = self;
  nw_resolver_set_cancel_handler();
  v23 = v12;
  v24 = 3221225472;
  v25 = __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_2_16;
  v26 = &unk_24C1D9C08;
  v27 = self;
  nw_resolver_set_update_handler();
  -[CoreDAVTask timeoutInterval](self, "timeoutInterval");
  v17 = v12;
  v18 = 3221225472;
  v19 = __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_4;
  v20 = &unk_24C1D9C30;
  if (v13 <= 0.0)
    v13 = 60.0;
  v22 = v13;
  v21 = self;
  objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:repeats:block:", 0, &v17);
  v14 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v15 = self->_timeoutTimer;
  self->_timeoutTimer = v14;

  -[CoreDAVTask workRunLoop](self, "workRunLoop", v17, v18, v19, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addTimer:forMode:", self->_timeoutTimer, *MEMORY[0x24BDBCA90]);

}

uint64_t __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  NSObject *v4;
  void *v5;
  _QWORD v7[5];
  uint8_t buf[16];

  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v2, "logHandleForAccountInfoProvider:", WeakRetained);
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209602000, v4, OS_LOG_TYPE_DEFAULT, "nw_resolver canceled; canceling CoreDAVSRVLookupTask",
      buf,
      2u);
  }

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_14;
  v7[3] = &unk_24C1D9A40;
  v7[4] = v5;
  return objc_msgSend(v5, "_runOnCallbackThread:", v7);
}

void __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_14(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishCoreDAVTaskWithError:", v2);

}

void __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_2_16(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  v6 = v5;
  if (a2 == 2)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_3;
    v8[3] = &unk_24C1D9AB8;
    v8[4] = v7;
    v9 = v5;
    objc_msgSend(v7, "_runOnCallbackThread:", v8);

  }
}

uint64_t __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleResolvedEndPoints:", *(_QWORD *)(a1 + 40));
}

void __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logHandleForAccountInfoProvider:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 134217984;
    v8 = v5;
    _os_log_impl(&dword_209602000, v4, OS_LOG_TYPE_ERROR, "Timeout interval of %f reached", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishCoreDAVTaskWithError:", v6);

}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  OS_nw_resolver *resolver;
  NSTimer *timeoutTimer;
  NSTimer *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CoreDAVSRVLookupTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v7, sel_finishCoreDAVTaskWithError_, a3);
  if (self->_resolver)
  {
    nw_resolver_set_cancel_handler();
    nw_resolver_cancel();
    resolver = self->_resolver;
    self->_resolver = 0;

  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    -[NSTimer invalidate](timeoutTimer, "invalidate");
    v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
}

- (void)_runOnCallbackThread:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CoreDAVTask taskManager](self, "taskManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:", v4);

}

- (void)handleResolvedEndPoints:(id)a3
{
  id v4;
  uint64_t count;
  uint64_t v6;
  void *srv_weighted_variant;
  void *v8;
  NSObject *v9;
  NSArray *v10;
  NSArray *fetchedRecords;
  void *v12;
  int error;
  id WeakRetained;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4 || (count = nw_array_get_count()) == 0)
  {
    if (self->_resolver)
    {
      error = nw_resolver_get_error();
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      srv_weighted_variant = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(srv_weighted_variant, "logHandleForAccountInfoProvider:", WeakRetained);
      v9 = objc_claimAutoreleasedReturnValue();

      if (!error)
      {
        if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209602000, v9, OS_LOG_TYPE_INFO, "SRV lookup returned no records", buf, 2u);
        }
        goto LABEL_4;
      }
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v18 = error;
        _os_log_impl(&dword_209602000, v9, OS_LOG_TYPE_INFO, "nw_resolver_get_error returned %i", buf, 8u);
      }

    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
    goto LABEL_12;
  }
  v6 = count;
  srv_weighted_variant = (void *)nw_resolver_create_srv_weighted_variant();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v6);
  v15 = MEMORY[0x24BDAC760];
  v16 = v8;
  v9 = v8;
  nw_array_apply();
  v10 = -[NSObject copy](v9, "copy", v15, 3221225472, __48__CoreDAVSRVLookupTask_handleResolvedEndPoints___block_invoke, &unk_24C1D9C78, self);
  fetchedRecords = self->_fetchedRecords;
  self->_fetchedRecords = v10;

LABEL_4:
  v12 = 0;
LABEL_12:
  -[CoreDAVSRVLookupTask finishCoreDAVTaskWithError:](self, "finishCoreDAVTaskWithError:", v12);

}

uint64_t __48__CoreDAVSRVLookupTask_handleResolvedEndPoints___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  CoreDAVSRVResourceRecord *v5;
  void *v6;
  void *v7;
  const char *hostname;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = objc_alloc_init(CoreDAVSRVResourceRecord);
  objc_msgSend(*(id *)(a1 + 32), "serviceString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVSRVResourceRecord setServiceString:](v5, "setServiceString:", v6);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", nw_endpoint_get_port(v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVSRVResourceRecord setPort:](v5, "setPort:", v7);

  hostname = nw_endpoint_get_hostname(v4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", hostname, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasSuffix:", CFSTR(".")))
  {
    objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  -[CoreDAVSRVResourceRecord setTarget:](v5, "setTarget:", v9);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  return 1;
}

- (NSString)serviceString
{
  return self->_serviceString;
}

- (void)setServiceString:(id)a3
{
  objc_storeStrong((id *)&self->_serviceString, a3);
}

- (NSArray)fetchedRecords
{
  return self->_fetchedRecords;
}

- (void)setFetchedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedRecords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_fetchedRecords, 0);
  objc_storeStrong((id *)&self->_serviceString, 0);
}

@end
