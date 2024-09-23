@implementation DTKPKTraceFileAggregator

- (DTKPKTraceFileAggregator)initWithConfig:(id)a3
{
  id v5;
  DTKPKTraceFileAggregator *v6;
  DTKPKTraceFileAggregator *v7;
  DVTFileStream *fileStream;
  os_log_t v9;
  OS_os_log *logHandle;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DTKPKTraceFileAggregator;
  v6 = -[DTKPKTraceFileAggregator init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_kperfSample = 0;
    fileStream = v7->_fileStream;
    v7->_fileStream = 0;

    v9 = os_log_create("com.apple.DTServiceHub", "Ktrace File Recording");
    logHandle = v7->_logHandle;
    v7->_logHandle = (OS_os_log *)v9;

  }
  return v7;
}

- (int)startKtraceSession:(char *)a3 useExisting:(BOOL)a4 outputFileURL:(id *)a5
{
  _BOOL8 v6;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *logHandle;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  NSObject *v22;
  DTKTraceSessionCreator *v24;
  DTKTraceSessionCreator *v25;
  id v26;
  DTKTraceSessionCreator *ktraceSession;
  id v28;
  unsigned int v29;
  uint8_t buf[4];
  __CFString *v31;
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  -[DTKPConfiguration providerOptions](self->_config, "providerOptions");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x24BDBD1B8];
  if (v9)
    v11 = (void *)v9;
  v12 = v11;

  v29 = 0;
  +[DTKTraceSessionCreator getDefaultedRemotePath:](DTKTraceSessionCreator, "getDefaultedRemotePath:", &v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 == -1)
  {
    v18 = 5;
  }
  else
  {
    logHandle = self->_logHandle;
    if (os_signpost_enabled(logHandle))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_222B17000, logHandle, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Start Operation", ", buf, 2u);
    }
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setProviders:", v12);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, 0x2000);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBitmap:", v16);

    objc_msgSend(v15, "setUseExisting:", v6);
    objc_msgSend(v15, "setCollectionInterval:", -[DTKPConfiguration collectionInterval](self->_config, "collectionInterval"));
    *(_DWORD *)buf = -1;
    if (kperf_bless_get() || (v17 = *(_DWORD *)buf, v17 != getpid()) || geteuid())
    {
      v18 = 5;
    }
    else
    {
      v24 = [DTKTraceSessionCreator alloc];
      v28 = 0;
      v25 = -[DTKTraceSessionCreator initWithFD:configuration:error:](v24, "initWithFD:configuration:error:", v29, v15, &v28);
      v26 = v28;
      ktraceSession = self->_ktraceSession;
      self->_ktraceSession = v25;

      if (v25)
        v18 = 0;
      else
        v18 = 5;

    }
    if (!v6)
    {
      v19 = self->_logHandle;
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_222B17000, v19, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Recording Lifetime", ", buf, 2u);
      }
    }
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeItemAtURL:error:", v13, 0);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failure: %s"), strerror(v18));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      *a5 = objc_retainAutorelease(v13);
      v21 = CFSTR("Success");
    }
    v22 = self->_logHandle;
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_signpost_emit_with_name_impl(&dword_222B17000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Start Operation", "Result: %@", buf, 0xCu);
    }

  }
  return v18;
}

- (BOOL)stopKtraceSessionWithError:(id *)a3
{
  NSObject *logHandle;
  NSObject *v6;
  DTKTraceSessionCreator *ktraceSession;
  BOOL v8;
  id v9;
  DTKTraceSessionCreator *v10;
  char v11;
  __CFString *v12;
  NSURL *ktraceURL;
  void *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  logHandle = self->_logHandle;
  if (os_signpost_enabled(logHandle))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_222B17000, logHandle, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Recording Lifetime", ", buf, 2u);
  }
  v6 = self->_logHandle;
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_222B17000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "End Operation", ", buf, 2u);
  }
  ktraceSession = self->_ktraceSession;
  v17 = 0;
  v8 = -[DTKTraceSessionCreator stopWithError:](ktraceSession, "stopWithError:", &v17);
  v9 = v17;
  v10 = self->_ktraceSession;
  self->_ktraceSession = 0;

  if (a3)
    v11 = v8;
  else
    v11 = 1;
  if ((v11 & 1) != 0)
  {
    v12 = 0;
    if (v8)
    {
LABEL_10:
      ktraceURL = (NSURL *)v12;
      v12 = CFSTR("Success");
      goto LABEL_16;
    }
  }
  else
  {
    if (!v9)
    {
      sub_222B70978(CFSTR("Failed stoping ktrace session."), -11);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_retainAutorelease(v9);
    *a3 = v9;
    objc_msgSend(v9, "localizedDescription");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_10;
  }
  if (!self->_ktraceURL)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeItemAtURL:error:", self->_ktraceURL, 0);

  ktraceURL = self->_ktraceURL;
  self->_ktraceURL = 0;
LABEL_16:

LABEL_17:
  v15 = self->_logHandle;
  if (os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_signpost_emit_with_name_impl(&dword_222B17000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "End Operation", "Result: %@", buf, 0xCu);
  }

  return v8;
}

- (id)pause
{
  __assert_rtn("-[DTKPKTraceFileAggregator pause]", "DTKPKTraceFileAggregator.mm", 145, "false && \"This feature is not available when writing a ktrace file.\");
}

- (id)resume
{
  __assert_rtn("-[DTKPKTraceFileAggregator resume]", "DTKPKTraceFileAggregator.mm", 150, "false && \"This feature is not available when writing a ktrace file.\");
}

- (id)start
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t *i;
  uint64_t (***v6)();
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t (***v11)();
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t *jj;
  uint64_t (***v16)();
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t *ii;
  uint64_t (***v23)();
  uint64_t v24;
  int v25;
  uint64_t *j;
  uint64_t (***v27)();
  uint64_t v28;
  uint64_t v29;
  int v30;
  id v31;
  id v32;
  uint64_t *n;
  uint64_t (***v34)();
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t (***v39)();
  uint64_t v40;
  uint64_t v41;
  uint64_t *k;
  uint64_t (***v43)();
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t (***v48)();
  uint64_t v49;
  uint64_t *m;
  uint64_t (***v51)();
  uint64_t v52;
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  DTKPKTraceFileAggregator *v58;
  uint64_t (**v59)();
  DTKPKTraceFileAggregator **v60;
  uint64_t (***v61)();
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v57 = 0;
  v58 = self;
  v55 = (uint64_t)&v55;
  v56 = &v55;
  -[DTKPConfiguration triggers](self->_config, "triggers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (-[DTKPConfiguration hasEnabledKPCClasses](v58->_config, "hasEnabledKPCClasses"))
  {
    -[DTKPConfiguration enabledKPCClasses](v58->_config, "enabledKPCClasses");
    if (kpc_set_counting())
    {
      v4 = *__error();
      for (i = v56; ; i = (uint64_t *)i[1])
      {
        if (i == &v55)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kpc_set_counting failed (%s)."), strerror(v4));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          sub_222B70978(v13, -6);
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
        sub_222B716BC((uint64_t)&v59, (uint64_t)(i + 2));
        if (!v61)
          sub_222B41964();
        ((void (*)(uint64_t (***)()))(*v61)[6])(v61);
        v6 = v61;
        if (v61 == &v59)
        {
          v6 = &v59;
          v7 = 4;
        }
        else
        {
          if (!v61)
            continue;
          v7 = 5;
        }
        (*v6)[v7]();
      }
    }
  }
  if (!v3)
    goto LABEL_33;
  v8 = kperf_sample_on();
  v59 = &off_24EB27140;
  v60 = &v58;
  v61 = &v59;
  v9 = (uint64_t *)operator new(0x30uLL);
  *v9 = 0;
  v9[1] = 0;
  sub_222B71720((uint64_t)(v9 + 2), (uint64_t)&v59);
  v10 = v56;
  *v9 = (uint64_t)&v55;
  v9[1] = (uint64_t)v10;
  *v10 = (uint64_t)v9;
  v56 = v9;
  ++v57;
  v11 = v61;
  if (v61 == &v59)
  {
    v12 = 4;
    v11 = &v59;
  }
  else
  {
    if (!v61)
      goto LABEL_20;
    v12 = 5;
  }
  (*v11)[v12]();
LABEL_20:
  if (!(_DWORD)v8)
  {
    v58->_kperfSample = 1;
LABEL_33:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[DTKPConfiguration queryCodeSet](v58->_config, "queryCodeSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
        v21 = v19;
      else
        v21 = (id)objc_opt_new();
      v13 = v21;

      objc_msgSend(v13, "addClass:", 37);
      if (-[DTKPConfiguration collectionMode](v58->_config, "collectionMode") == 3)
      {
        if (-[DTKPConfiguration hasEnabledKPCClasses](v58->_config, "hasEnabledKPCClasses"))
        {
          -[DTKPConfiguration enabledKPCClasses](v58->_config, "enabledKPCClasses");
          if (kpc_set_counting())
          {
            v25 = *__error();
            for (j = v56; ; j = (uint64_t *)j[1])
            {
              if (j == &v55)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kpc_set_counting failed (%s)."), strerror(v25));
                v32 = (id)objc_claimAutoreleasedReturnValue();
                sub_222B70978(v32, -6);
                v41 = objc_claimAutoreleasedReturnValue();
                goto LABEL_106;
              }
              sub_222B716BC((uint64_t)&v59, (uint64_t)(j + 2));
              if (!v61)
                sub_222B41964();
              ((void (*)(uint64_t (***)()))(*v61)[6])(v61);
              v27 = v61;
              if (v61 == &v59)
              {
                v27 = &v59;
                v28 = 4;
              }
              else
              {
                if (!v61)
                  continue;
                v28 = 5;
              }
              (*v27)[v28]();
            }
          }
        }
        if (!v3)
          goto LABEL_90;
        v36 = kperf_sample_on();
        v59 = &off_24EB27198;
        v60 = &v58;
        v61 = &v59;
        v37 = (uint64_t *)operator new(0x30uLL);
        *v37 = 0;
        v37[1] = 0;
        sub_222B71720((uint64_t)(v37 + 2), (uint64_t)&v59);
        v38 = v56;
        *v37 = (uint64_t)&v55;
        v37[1] = (uint64_t)v38;
        *v38 = (uint64_t)v37;
        v56 = v37;
        ++v57;
        v39 = v61;
        if (v61 == &v59)
        {
          v40 = 4;
          v39 = &v59;
        }
        else
        {
          if (!v61)
          {
LABEL_78:
            if ((_DWORD)v36)
            {
              for (k = v56; ; k = (uint64_t *)k[1])
              {
                if (k == &v55)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kperf_sample_on failed with %d."), v36);
                  v32 = (id)objc_claimAutoreleasedReturnValue();
                  sub_222B70978(v32, -6);
                  v41 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_106;
                }
                sub_222B716BC((uint64_t)&v59, (uint64_t)(k + 2));
                if (!v61)
                  sub_222B41964();
                ((void (*)(uint64_t (***)()))(*v61)[6])(v61);
                v43 = v61;
                if (v61 == &v59)
                {
                  v43 = &v59;
                  v44 = 4;
                }
                else
                {
                  if (!v61)
                    continue;
                  v44 = 5;
                }
                (*v43)[v44]();
              }
            }
            v58->_kperfSample = 1;
LABEL_90:
            v45 = kperf_logging_start();
            v59 = &off_24EB271F0;
            v61 = &v59;
            v46 = (uint64_t *)operator new(0x30uLL);
            *v46 = 0;
            v46[1] = 0;
            sub_222B71720((uint64_t)(v46 + 2), (uint64_t)&v59);
            v47 = v56;
            *v46 = (uint64_t)&v55;
            v46[1] = (uint64_t)v47;
            *v47 = (uint64_t)v46;
            v56 = v46;
            ++v57;
            v48 = v61;
            if (v61 == &v59)
            {
              v49 = 4;
              v48 = &v59;
            }
            else
            {
              if (!v61)
              {
LABEL_95:
                if (!(_DWORD)v45)
                {
                  v18 = 0;
                  goto LABEL_108;
                }
                for (m = v56; ; m = (uint64_t *)m[1])
                {
                  if (m == &v55)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kperf_logging_start failed with %d."), v45);
                    v32 = (id)objc_claimAutoreleasedReturnValue();
                    sub_222B70978(v32, -6);
                    v41 = objc_claimAutoreleasedReturnValue();
LABEL_106:
                    v18 = (void *)v41;
LABEL_107:

                    goto LABEL_108;
                  }
                  sub_222B716BC((uint64_t)&v59, (uint64_t)(m + 2));
                  if (!v61)
                    sub_222B41964();
                  ((void (*)(uint64_t (***)()))(*v61)[6])(v61);
                  v51 = v61;
                  if (v61 == &v59)
                  {
                    v51 = &v59;
                    v52 = 4;
                  }
                  else
                  {
                    if (!v61)
                      continue;
                    v52 = 5;
                  }
                  (*v51)[v52]();
                }
              }
              v49 = 5;
            }
            (*v48)[v49]();
            goto LABEL_95;
          }
          v40 = 5;
        }
        (*v39)[v40]();
        goto LABEL_78;
      }
      v29 = objc_msgSend(v13, "createFilterMask:", 0);
      v54 = 0;
      v30 = -[DTKPKTraceFileAggregator startKtraceSession:useExisting:outputFileURL:](v58, "startKtraceSession:useExisting:outputFileURL:", v29, 0, &v54);
      v31 = v54;
      v32 = v54;
      objc_storeStrong((id *)&v58->_ktraceURL, v31);
      +[DTKPKDebugCodeSet releaseFilterMask:](DTKPKDebugCodeSet, "releaseFilterMask:", v29);
      if (!v30)
      {
        v18 = 0;
        goto LABEL_107;
      }
      for (n = v56; ; n = (uint64_t *)n[1])
      {
        if (n == &v55)
        {
          sub_222B70978(CFSTR("Failed starting ktrace session."), -11);
          v41 = objc_claimAutoreleasedReturnValue();
          goto LABEL_106;
        }
        sub_222B716BC((uint64_t)&v59, (uint64_t)(n + 2));
        if (!v61)
          sub_222B41964();
        ((void (*)(uint64_t (***)()))(*v61)[6])(v61);
        v34 = v61;
        if (v61 == &v59)
        {
          v34 = &v59;
          v35 = 4;
        }
        else
        {
          if (!v61)
            continue;
          v35 = 5;
        }
        (*v34)[v35]();
      }
    }
    for (ii = v56; ; ii = (uint64_t *)ii[1])
    {
      if (ii == &v55)
      {
        sub_222B70978(CFSTR("DTKPKTraceFileAggregator can only work with DTKPKperfConfiguration."), -11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_109;
      }
      sub_222B716BC((uint64_t)&v59, (uint64_t)(ii + 2));
      if (!v61)
        sub_222B41964();
      ((void (*)(uint64_t (***)()))(*v61)[6])(v61);
      v23 = v61;
      if (v61 == &v59)
      {
        v23 = &v59;
        v24 = 4;
      }
      else
      {
        if (!v61)
          continue;
        v24 = 5;
      }
      (*v23)[v24]();
    }
  }
  for (jj = v56; jj != &v55; jj = (uint64_t *)jj[1])
  {
    sub_222B716BC((uint64_t)&v59, (uint64_t)(jj + 2));
    if (!v61)
      sub_222B41964();
    ((void (*)(uint64_t (***)()))(*v61)[6])(v61);
    v16 = v61;
    if (v61 == &v59)
    {
      v16 = &v59;
      v17 = 4;
    }
    else
    {
      if (!v61)
        continue;
      v17 = 5;
    }
    (*v16)[v17]();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kperf_sample_on failed with %d."), v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_222B70978(v13, -6);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_31:
  v18 = (void *)v14;
LABEL_108:

LABEL_109:
  sub_222B71624(&v55);
  return v18;
}

- (id)stop
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v10;
  id v11;

  if (-[DTKPConfiguration collectionMode](self->_config, "collectionMode") == 3)
  {
    -[DTKPConfiguration queryCodeSet](self->_config, "queryCodeSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addClass:", 37);
    v4 = objc_msgSend(v3, "createFilterMask:", 0);
    v11 = 0;
    -[DTKPKTraceFileAggregator startKtraceSession:useExisting:outputFileURL:](self, "startKtraceSession:useExisting:outputFileURL:", v4, 1, &v11);
    v5 = v11;
    v6 = v11;
    objc_storeStrong((id *)&self->_ktraceURL, v5);
    +[DTKPKDebugCodeSet releaseFilterMask:](DTKPKDebugCodeSet, "releaseFilterMask:", v4);

    v7 = 0;
  }
  else
  {
    v10 = 0;
    -[DTKPKTraceFileAggregator stopKtraceSessionWithError:](self, "stopKtraceSessionWithError:", &v10);
    v7 = v10;
  }
  if (self->_kperfSample)
    kperf_sample_off();
  if (-[DTKPConfiguration hasEnabledKPCClasses](self->_config, "hasEnabledKPCClasses"))
    kpc_set_counting();
  if (-[DTKPConfiguration collectionMode](self->_config, "collectionMode") == 3)
  {
    v8 = kperf_logging_stop();
    MEMORY[0x227679830](v8);
  }
  kperf_reset();
  return v7;
}

- (id)swapOutCurrentDatastream:(id *)a3
{
  DVTFileStream *fileStream;
  DVTFileStream *v5;
  DVTFileStream *v6;
  DVTFileStream *v7;

  if (self->_ktraceURL)
  {
    fileStream = self->_fileStream;
    if (!fileStream)
    {
      v5 = -[DVTFileStream initWithURL:]([DVTFileStream alloc], "initWithURL:", self->_ktraceURL);
      v6 = self->_fileStream;
      self->_fileStream = v5;

      fileStream = self->_fileStream;
    }
    v7 = fileStream;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_ktraceSession, 0);
  objc_storeStrong((id *)&self->_ktraceURL, 0);
  objc_storeStrong((id *)&self->_fileStream, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
