@implementation NWDatagramConnection

- (BOOL)readDatagramsWithMinimumCount:(unint64_t)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  unsigned int v5;
  unsigned int v6;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[NWConnection internalConnection](self, "internalConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__NWDatagramConnection_readDatagramsWithMinimumCount_maximumCount_completionHandler___block_invoke;
  v12[3] = &unk_1E14AAA18;
  v13 = v8;
  v10 = v8;
  LOBYTE(v5) = nw_connection_read_multiple(v9, v6, v5, v12);

  return v5;
}

- (BOOL)writeDatagrams:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  size_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  char *backtrace_string;
  os_log_type_t v27;
  _BOOL4 v28;
  NSObject *v29;
  os_log_type_t v30;
  _QWORD v32[4];
  id v33;
  char v34;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (!v8)
  {
LABEL_30:
    v18 = 0;
    goto LABEL_31;
  }
  v9 = v8;
  v10 = malloc_type_calloc(v8, 8uLL, 0x80040B8603338uLL);
  if (!v10)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v19 = (id)gLogObj;
    *(_DWORD *)buf = 136446722;
    v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
    v38 = 1024;
    v39 = v9;
    v40 = 2048;
    v41 = 8;
    v20 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v34 = 0;
    if (!__nwlog_fault(v20, &type, &v34))
      goto LABEL_28;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v21 = (id)gLogObj;
      v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446722;
        v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
        v38 = 1024;
        v39 = v9;
        v40 = 2048;
        v41 = 8;
        v23 = "%{public}s calloc(%u, %zu) failed";
LABEL_25:
        v29 = v21;
        v30 = v22;
LABEL_26:
        _os_log_impl(&dword_182FBE000, v29, v30, v23, buf, 0x1Cu);
      }
    }
    else
    {
      if (v34)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v21 = (id)gLogObj;
        v27 = type;
        v28 = os_log_type_enabled(v21, type);
        if (backtrace_string)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136446978;
            v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
            v38 = 1024;
            v39 = v9;
            v40 = 2048;
            v41 = 8;
            v42 = 2082;
            v43 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v21, v27, "%{public}s calloc(%u, %zu) failed, dumping backtrace:%{public}s", buf, 0x26u);
          }

          free(backtrace_string);
          goto LABEL_28;
        }
        if (!v28)
          goto LABEL_27;
        *(_DWORD *)buf = 136446722;
        v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
        v38 = 1024;
        v39 = v9;
        v40 = 2048;
        v41 = 8;
        v23 = "%{public}s calloc(%u, %zu) failed, no backtrace";
        v29 = v21;
        v30 = v27;
        goto LABEL_26;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v21 = (id)gLogObj;
      v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446722;
        v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
        v38 = 1024;
        v39 = v9;
        v40 = 2048;
        v41 = 8;
        v23 = "%{public}s calloc(%u, %zu) failed, backtrace limit exceeded";
        goto LABEL_25;
      }
    }
LABEL_27:

LABEL_28:
    if (v20)
      free(v20);
    goto LABEL_30;
  }
  v11 = v10;
  for (i = 0; i != v9; ++i)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v14 = (void *)objc_msgSend(v14, "_createDispatchData");
    v13 = (void *)v11[i];
    v11[i] = v14;

  }
  -[NWConnection internalConnection](self, "internalConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 == &__block_literal_global_14095)
  {
    v18 = nw_connection_write_multiple(v16, (uint64_t)v11, v9, &__block_literal_global_42);

  }
  else
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __57__NWDatagramConnection_writeDatagrams_completionHandler___block_invoke;
    v32[3] = &unk_1E14AAA50;
    v33 = v7;
    v18 = nw_connection_write_multiple(v17, (uint64_t)v11, v9, v32);

  }
  v24 = 0;
  if (v9 <= 1)
    v9 = 1;
  do
  {
    v25 = (void *)v11[v24];
    v11[v24] = 0;

    ++v24;
  }
  while (v9 != v24);
  free(v11);
LABEL_31:

  return v18;
}

void __57__NWDatagramConnection_writeDatagrams_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  id v4;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __85__NWDatagramConnection_readDatagramsWithMinimumCount_maximumCount_completionHandler___block_invoke(uint64_t a1, id *a2, unsigned int a3, int a4)
{
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v8 = a3;
    do
    {
      if (*a2)
      {
        v9 = *a2;

        objc_msgSend(v11, "addObject:", v9);
      }
      ++a2;
      --v8;
    }
    while (v8);
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (NWDatagramConnection)connectionWithConnectedSocket:(int)a3
{
  return -[NWConnection initWithConnectedSocket:]([NWDatagramConnection alloc], "initWithConnectedSocket:", *(_QWORD *)&a3);
}

@end
