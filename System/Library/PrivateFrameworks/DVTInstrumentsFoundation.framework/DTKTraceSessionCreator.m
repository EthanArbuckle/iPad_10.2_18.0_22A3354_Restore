@implementation DTKTraceSessionCreator

- (DTKTraceSessionCreator)initWithFD:(int)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  DTKTraceSessionCreator *v8;
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  DTKTraceSessionCreator *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *providerLoggers;
  NSArray *v35;
  dispatch_semaphore_t v36;
  NSObject *v37;
  uint64_t started;
  void *v39;
  void *v40;
  void *v41;
  OS_dispatch_semaphore *stoppingSemaphore;
  id v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  objc_super v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)DTKTraceSessionCreator;
  v8 = -[DTKTraceSessionCreator init](&v55, sel_init);
  if (!v8)
    goto LABEL_40;
  objc_msgSend(v7, "bitmap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12 = a5 == 0;
LABEL_9:
    v16 = ktrace_session_create();
    ktrace_session_set_event_names_enabled();
    ktrace_session_set_default_event_names_enabled();
    ktrace_set_only_do_time_sensitive_postprocess();
    if (objc_msgSend(v7, "collectionInterval"))
      objc_msgSend(v7, "collectionInterval");
    ktrace_set_collection_interval();
    if (!v16)
      goto LABEL_19;
    objc_msgSend(v7, "bitmap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v7, "bitmap");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v18, "bytes");
      v19 = ktrace_events_filter_bitmap();

    }
    else
    {
      v19 = ktrace_events_all();
    }

    if ((_DWORD)v19)
    {
      if (!v12)
      {
        v20 = (void *)MEMORY[0x24BDD1540];
        v62 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error: %d"), v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v21;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("DTKTraceSessionCreator"), -1, v22);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_18:
      ktrace_session_destroy();
      goto LABEL_19;
    }
    if (objc_msgSend(v7, "useExisting"))
    {
      v24 = ktrace_set_use_existing();
      if ((_DWORD)v24)
      {
        if (!v12)
        {
          v25 = (void *)MEMORY[0x24BDD1540];
          v60 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error: %d"), v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v26;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("DTKTraceSessionCreator"), -1, v27);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_18;
      }
    }
    else
    {
      v28 = (void *)objc_opt_new();
      v49 = 0;
      v50 = &v49;
      v51 = 0x3032000000;
      v52 = sub_222B203A8;
      v53 = sub_222B203B8;
      v54 = 0;
      objc_msgSend(v7, "providers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = sub_222B203C0;
      v45[3] = &unk_24EB28278;
      v47 = &v49;
      v48 = v16;
      v44 = v28;
      v46 = v44;
      objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v45);

      v30 = v50[5];
      if (v30)
      {
        v31 = (void *)MEMORY[0x24BDD1540];
        v58 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to instantiate data providers"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v32;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.ktrace_recording.provider"), 1, v33);
        providerLoggers = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          *a5 = objc_retainAutorelease(providerLoggers);
        ktrace_session_destroy();
      }
      else
      {
        v35 = (NSArray *)v44;
        providerLoggers = v8->_providerLoggers;
        v8->_providerLoggers = v35;
      }

      _Block_object_dispose(&v49, 8);
      if (v30)
        goto LABEL_19;
    }
    v36 = dispatch_semaphore_create(0);
    v37 = v36;
    ktrace_set_completion_handler();
    objc_storeStrong((id *)&v8->_stoppingSemaphore, v36);
    started = ktrace_start_writing_fd();
    if ((_DWORD)started)
    {
      if (!v12)
      {
        v39 = (void *)MEMORY[0x24BDD1540];
        v56 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error: %d"), started);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v40;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("DTKTraceSessionCreator"), -1, v41);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_19;
    }
    if (objc_msgSend(v7, "useExisting"))
    {
      dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
      if (v8->_ktraceSession)
        ktrace_session_destroy();
      stoppingSemaphore = v8->_stoppingSemaphore;
      v8->_ktraceSession = 0;
      v8->_stoppingSemaphore = 0;

    }
    v8->_ktraceSession = (ktrace_session *)v16;

LABEL_40:
    v23 = v8;
    goto LABEL_41;
  }
  objc_msgSend(v7, "bitmap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length") == 0x2000;

  v12 = a5 == 0;
  if (a5)
    v13 = v11;
  else
    v13 = 1;
  if ((v13 & 1) != 0)
    goto LABEL_9;
  v14 = (void *)MEMORY[0x24BDD1540];
  v64 = *MEMORY[0x24BDD0FC8];
  v65[0] = CFSTR("Invalid tracing configuration bitmap");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("DTKTraceSessionCreator"), -1, v15);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
  v23 = 0;
LABEL_41:

  return v23;
}

- (id)_providerTopErrors
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_providerLoggers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "errors", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)stopWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!self->_ktraceSession)
    return 1;
  if (!self->_stoppingSemaphore)
    sub_222BC59B0();
  ktrace_end();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_stoppingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  ktrace_session_destroy();
  self->_ktraceSession = 0;
  -[DTKTraceSessionCreator _providerTopErrors](self, "_providerTopErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

    return 1;
  }
  v6 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DVTKtraceSessionProviderName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v6, "addObject:", v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }

  v14 = (void *)MEMORY[0x24BDD1540];
  v26[0] = *MEMORY[0x24BDD0FC8];
  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Data Providers emitted errors: %@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = CFSTR("DVTKtraceSessionProviderErrorsArrayKey");
  v27[0] = v18;
  v27[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.ktrace_recording.provider"), 2, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease(v20);

  return 0;
}

+ (id)getDefaultedRemotePath:(int *)a3
{
  void *v4;
  void *v5;
  id v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v14;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DTKTraceHelpers.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outFD != nil"));

  }
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("instrumentsXXXXXX.ktrace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v5);
  v7 = strdup((const char *)objc_msgSend(v6, "fileSystemRepresentation"));
  *a3 = mkstemps(v7, 7);
  v8 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  free(v7);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerLoggers, 0);
  objc_storeStrong((id *)&self->_stoppingSemaphore, 0);
}

@end
