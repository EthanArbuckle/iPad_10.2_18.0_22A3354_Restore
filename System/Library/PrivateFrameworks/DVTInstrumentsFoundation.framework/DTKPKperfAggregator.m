@implementation DTKPKperfAggregator

- (void)_reportTimeStats
{
  int64_t v3;
  int64_t rep;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t id;
  int v10;
  unint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  rep = self->_startTime.__d_.__rep_;
  v3 = self->_endTime.__d_.__rep_;
  if (qword_25576FC30 != -1)
    dispatch_once(&qword_25576FC30, &unk_24EB27A30);
  v5 = qword_25576FC38;
  if (os_log_type_enabled((os_log_t)qword_25576FC38, OS_LOG_TYPE_INFO))
  {
    v6 = (v3 - rep) % 3600000000000;
    v7 = v6 / 60000000000;
    v8 = (unsigned __int128)(v6 % 60000000000 * (__int128)0x112E0BE826D694B3) >> 64;
    id = self->_id;
    v10 = 134218496;
    v11 = id;
    v12 = 1024;
    v13 = v7;
    v14 = 1024;
    v15 = (v8 >> 26) + ((unint64_t)v8 >> 63);
    _os_log_impl(&dword_222B17000, v5, OS_LOG_TYPE_INFO, "[%llu] Lasted: %um:%us", (uint8_t *)&v10, 0x18u);
  }
}

- (void)_reportCallbackStats
{
  NSObject *v3;
  unint64_t id;
  unint64_t callbackCalledCount;
  unint64_t callbackNotificationCount;
  int v7;
  unint64_t v8;
  __int16 v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (qword_25576FC30 != -1)
    dispatch_once(&qword_25576FC30, &unk_24EB27A30);
  v3 = qword_25576FC38;
  if (os_log_type_enabled((os_log_t)qword_25576FC38, OS_LOG_TYPE_INFO))
  {
    id = self->_id;
    callbackCalledCount = self->_callbackCalledCount;
    callbackNotificationCount = self->_callbackNotificationCount;
    v7 = 134218496;
    v8 = id;
    v9 = 2048;
    v10 = callbackCalledCount;
    v11 = 2048;
    v12 = callbackNotificationCount;
    _os_log_impl(&dword_222B17000, v3, OS_LOG_TYPE_INFO, "[%llu] Callback: %llu calls (%llu notifications)", (uint8_t *)&v7, 0x20u);
  }
}

- (void)_reportStats
{
  unint64_t dataPulledSize;
  double v4;
  int v5;
  void *v6;
  NSObject *v7;
  unint64_t id;
  unint64_t v9;
  double v10;
  int v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  unint64_t numberOfPulls;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  dataPulledSize = self->_dataPulledSize;
  v4 = (double)dataPulledSize;
  if (dataPulledSize)
    v5 = vcvtmd_s64_f64(log2((double)dataPulledSize) / 10.0);
  else
    v5 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f %s"), v4 / exp2((double)v5 * 10.0), off_24EB2B088[v5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_25576FC30 != -1)
    dispatch_once(&qword_25576FC30, &unk_24EB27A30);
  v7 = (id)qword_25576FC38;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id = self->_id;
    v9 = -[DTKPConfiguration bufferSize](self->_config, "bufferSize");
    v10 = (double)v9;
    if (v9)
      v11 = vcvtmd_s64_f64(log2((double)v9) / 10.0);
    else
      v11 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f %s"), v10 / exp2((double)v11 * 10.0), off_24EB2B088[v11]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v17 = id;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_222B17000, v7, OS_LOG_TYPE_INFO, "[%llu] Kernel: buffer size: %@", buf, 0x16u);

  }
  if (qword_25576FC30 != -1)
    dispatch_once(&qword_25576FC30, &unk_24EB27A30);
  v13 = qword_25576FC38;
  if (os_log_type_enabled((os_log_t)qword_25576FC38, OS_LOG_TYPE_INFO))
  {
    v14 = self->_id;
    numberOfPulls = self->_numberOfPulls;
    *(_DWORD *)buf = 134218498;
    v17 = v14;
    v18 = 2112;
    v19 = v6;
    v20 = 2048;
    v21 = numberOfPulls;
    _os_log_impl(&dword_222B17000, v13, OS_LOG_TYPE_INFO, "[%llu] Pulled: %@ (%llu pulls)", buf, 0x20u);
  }
  -[DTKPKperfAggregator _reportTimeStats](self, "_reportTimeStats");
  -[DTKPKperfAggregator _reportCallbackStats](self, "_reportCallbackStats");

}

- (void)_resetStats
{
  self->_dataPulledSize = 0;
  self->_numberOfPulls = 0;
  self->_callbackCalledCount = 0;
  self->_callbackNotificationCount = 0;
}

- (BOOL)_ktraceTeardown:(id *)a3
{
  uint64_t v5;
  int v6;
  BOOL v7;
  void *v8;
  int v9;
  void *v10;
  int *v11;
  void *v12;
  int v13;
  void *v14;
  int *v15;
  void *v16;

  v5 = kperf_logging_stop();
  v6 = v5;
  v7 = (_DWORD)v5 == 0;
  if (a3 && (_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kperf_logging_stop failed with %d."), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_222B96DA4(v8, -6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[DTKPConfiguration hasEnabledKPCClasses](self->_config, "hasEnabledKPCClasses"))
  {
    v9 = kpc_set_counting();
    v7 = (v9 | v6) == 0;
    if (a3)
    {
      if (v9)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        v11 = __error();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("kpc_set_counting failed (%s)."), strerror(*v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        sub_222B96DA4(v12, -8);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        v7 = 0;
      }
    }
  }
  if (self->_kperfSample)
  {
    v13 = kperf_sample_off();
    if (v13)
      v7 = 0;
    if (a3 && v13)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = __error();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("kperf_sample_on failed (%s)."), strerror(*v15));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_222B96DA4(v16, -6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
  }
  return v7;
}

- (DTKPKperfAggregator)initWithConfig:(id)a3
{
  id v5;
  DTKPKperfAggregator *v6;
  DTKPKperfAggregator *v7;
  DVTStreamManager *v8;
  void *v9;
  uint64_t v10;
  DVTStreamManager *manager;
  unint64_t v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DTKPKperfAggregator;
  v6 = -[DTKPKperfAggregator init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = [DVTStreamManager alloc];
    v9 = (void *)objc_opt_new();
    v10 = -[DVTStreamManager initWithStream:](v8, "initWithStream:", v9);
    manager = v7->_manager;
    v7->_manager = (DVTStreamManager *)v10;

    v7->_usingTimer = 0;
    *(_WORD *)&v7->_kperfSample = 0;
    do
      v12 = __ldaxr(&qword_25576FC40);
    while (__stlxr(v12 + 1, &qword_25576FC40));
    v7->_id = v12;
  }

  return v7;
}

- (id)start
{
  recursive_mutex *p_lock;
  void *v4;
  id v5;
  void *v6;
  uint64_t live;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t (***v10)();
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *i;
  uint64_t (***v17)();
  uint64_t v18;
  int v19;
  uint64_t *j;
  uint64_t (***v21)();
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t (***v26)();
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t *k;
  uint64_t (***v31)();
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t (***v37)();
  uint64_t v38;
  uint64_t *m;
  uint64_t (***v40)();
  uint64_t v41;
  void *v42;
  std::chrono::steady_clock::time_point v44;
  DTKPKperfAggregator *v45;
  uint64_t (***v46)();
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  DTKPKperfAggregator *v54;
  uint64_t (**v55)();
  DTKPKperfAggregator **v56;
  uint64_t (***v57)();
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v54 = self;
  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  -[DTKPKperfAggregator _kernelCallbackInit](self, "_kernelCallbackInit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v6 = v5;
    goto LABEL_71;
  }
  -[DTKPKperfAggregator _resetStats](self, "_resetStats");
  v51 = (uint64_t)&v51;
  v52 = &v51;
  v53 = 0;
  live = kperf_buffer_create_live();
  v54->_kperfBuffer = (kperf_buf *)live;
  if (!live)
  {
    sub_222B986D0(CFSTR("kperf_buffer_create_live failed."), -1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    goto LABEL_70;
  }
  v55 = &off_24EB26FE0;
  v56 = &v54;
  v57 = &v55;
  v8 = (uint64_t *)operator new(0x30uLL);
  *v8 = 0;
  v8[1] = 0;
  sub_222B71720((uint64_t)(v8 + 2), (uint64_t)&v55);
  v9 = v52;
  *v8 = (uint64_t)&v51;
  v8[1] = (uint64_t)v9;
  *v9 = (uint64_t)v8;
  v52 = v8;
  ++v53;
  v10 = v57;
  if (v57 == &v55)
  {
    v11 = 4;
    v10 = &v55;
    goto LABEL_9;
  }
  if (v57)
  {
    v11 = 5;
LABEL_9:
    (*v10)[v11]();
  }
  -[DTKPConfiguration generateConfigWords](v54->_config, "generateConfigWords");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTKPConfiguration triggers](v54->_config, "triggers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(v12, "length");
    objc_msgSend(objc_retainAutorelease(v12), "bytes");
    v15 = kperf_buffer_set_config();
    if ((_DWORD)v15)
    {
      for (i = v52; ; i = (uint64_t *)i[1])
      {
        if (i == &v51)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kperf_buffer_set_config failed with %d."), v15);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          sub_222B986D0(v28, -6);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_68;
        }
        sub_222B716BC((uint64_t)&v55, (uint64_t)(i + 2));
        if (!v57)
          sub_222B41964();
        ((void (*)(uint64_t (***)()))(*v57)[6])(v57);
        v17 = v57;
        if (v57 == &v55)
        {
          v17 = &v55;
          v18 = 4;
        }
        else
        {
          if (!v57)
            continue;
          v18 = 5;
        }
        (*v17)[v18]();
      }
    }
  }
  if (-[DTKPConfiguration hasEnabledKPCClasses](v54->_config, "hasEnabledKPCClasses"))
  {
    -[DTKPConfiguration enabledKPCClasses](v54->_config, "enabledKPCClasses");
    if (kpc_set_counting())
    {
      v19 = *__error();
      for (j = v52; ; j = (uint64_t *)j[1])
      {
        if (j == &v51)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kpc_set_counting failed (%s)."), strerror(v19));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          sub_222B986D0(v29, -6);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_68;
        }
        sub_222B716BC((uint64_t)&v55, (uint64_t)(j + 2));
        if (!v57)
          sub_222B41964();
        ((void (*)(uint64_t (***)()))(*v57)[6])(v57);
        v21 = v57;
        if (v57 == &v55)
        {
          v21 = &v55;
          v22 = 4;
        }
        else
        {
          if (!v57)
            continue;
          v22 = 5;
        }
        (*v21)[v22]();
      }
    }
  }
  if (!v14)
    goto LABEL_52;
  v23 = kperf_sample_on();
  v55 = &off_24EB27038;
  v56 = &v54;
  v57 = &v55;
  v24 = (uint64_t *)operator new(0x30uLL);
  *v24 = 0;
  v24[1] = 0;
  sub_222B71720((uint64_t)(v24 + 2), (uint64_t)&v55);
  v25 = v52;
  *v24 = (uint64_t)&v51;
  v24[1] = (uint64_t)v25;
  *v25 = (uint64_t)v24;
  v52 = v24;
  ++v53;
  v26 = v57;
  if (v57 == &v55)
  {
    v27 = 4;
    v26 = &v55;
    goto LABEL_39;
  }
  if (v57)
  {
    v27 = 5;
LABEL_39:
    (*v26)[v27]();
  }
  if ((_DWORD)v23)
  {
    for (k = v52; ; k = (uint64_t *)k[1])
    {
      if (k == &v51)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kperf_sample_on failed with %d."), v23);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        sub_222B986D0(v33, -6);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_68;
      }
      sub_222B716BC((uint64_t)&v55, (uint64_t)(k + 2));
      if (!v57)
        sub_222B41964();
      ((void (*)(uint64_t (***)()))(*v57)[6])(v57);
      v31 = v57;
      if (v57 == &v55)
      {
        v31 = &v55;
        v32 = 4;
      }
      else
      {
        if (!v57)
          continue;
        v32 = 5;
      }
      (*v31)[v32]();
    }
  }
  v54->_kperfSample = 1;
LABEL_52:
  v34 = kperf_logging_start();
  v55 = &off_24EB27090;
  v57 = &v55;
  v35 = (uint64_t *)operator new(0x30uLL);
  *v35 = 0;
  v35[1] = 0;
  sub_222B71720((uint64_t)(v35 + 2), (uint64_t)&v55);
  v36 = v52;
  *v35 = (uint64_t)&v51;
  v35[1] = (uint64_t)v36;
  *v36 = (uint64_t)v35;
  v52 = v35;
  ++v53;
  v37 = v57;
  if (v57 == &v55)
  {
    v38 = 4;
    v37 = &v55;
  }
  else
  {
    if (!v57)
      goto LABEL_57;
    v38 = 5;
  }
  (*v37)[v38]();
LABEL_57:
  if (!(_DWORD)v34)
  {
    v44.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    v45 = v54;
    v54->_startTime.__d_.__rep_ = v44.__d_.__rep_;
    if (-[DTKPConfiguration collectionMode](v45->_config, "collectionMode") == 3)
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_69;
    }
    -[DTKPKperfAggregator _kernelCallbackStart](v54, "_kernelCallbackStart");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = 0;
      v54->_usingTimer = 1;
      goto LABEL_69;
    }
    v55 = &off_24EB270E8;
    v56 = &v54;
    v57 = &v55;
    sub_222B977C4((uint64_t)&v51, (uint64_t)&v55);
    v46 = v57;
    if (v57 == &v55)
    {
      v47 = 4;
      v46 = &v55;
    }
    else
    {
      if (!v57)
      {
LABEL_81:
        sub_222B9781C(v52, &v51);
        v48 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "localizedDescription");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringWithFormat:", CFSTR("_kernelCallbackStart failed. Underlying error: %@"), v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        sub_222B977AC(v50, -6);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_69;
      }
      v47 = 5;
    }
    (*v46)[v47]();
    goto LABEL_81;
  }
  for (m = v52; m != &v51; m = (uint64_t *)m[1])
  {
    sub_222B716BC((uint64_t)&v55, (uint64_t)(m + 2));
    if (!v57)
      sub_222B41964();
    ((void (*)(uint64_t (***)()))(*v57)[6])(v57);
    v40 = v57;
    if (v57 == &v55)
    {
      v40 = &v55;
      v41 = 4;
    }
    else
    {
      if (!v57)
        continue;
      v41 = 5;
    }
    (*v40)[v41]();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kperf_logging_start failed with %d."), v34);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  sub_222B986D0(v42, -6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_68:
  v5 = 0;
LABEL_69:

LABEL_70:
  sub_222B71624(&v51);
LABEL_71:

  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
  return v6;
}

- (id)pause
{
  recursive_mutex *p_lock;
  id v4;
  id v6;

  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  v6 = 0;
  -[DTKPKperfAggregator _ktraceTeardown:](self, "_ktraceTeardown:", &v6);
  v4 = v6;
  if (self->_usingTimer)
    -[DVTQueueBasedTimer pause](self->_timer, "pause");
  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
  return v4;
}

- (id)resume
{
  recursive_mutex *p_lock;
  int v4;
  void *v5;
  int *v6;
  void *v7;
  id v8;
  void *v9;
  int *v10;
  void *v11;
  int *v12;
  int v13;
  id v14;
  void *v15;
  id v17;

  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  v4 = -[DTKPConfiguration hasEnabledKPCClasses](self->_config, "hasEnabledKPCClasses");
  if (v4
    && (-[DTKPConfiguration enabledKPCClasses](self->_config, "enabledKPCClasses"), kpc_set_counting()))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = __error();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("kpc_set_counting failed (%s)."), strerror(*v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_222B986D0(v7, -8);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_kperfSample && kperf_sample_on())
  {
    if (v4)
      kpc_set_counting();
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = __error();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("kperf_sample_on failed (%s)."), strerror(*v10));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_222B986D0(v7, -6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (kperf_logging_start())
  {
    kperf_sample_off();
    if (v4)
      kpc_set_counting();
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = __error();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("kperf_logging_start failed (%s)."), strerror(*v12));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_222B986D0(v7, -6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_usingTimer)
      -[DVTQueueBasedTimer resume](self->_timer, "resume");
    v17 = 0;
    v13 = -[DTKPKperfAggregator _flushDataFromKernel:more:error:](self, "_flushDataFromKernel:more:error:", 1, 0, &v17);
    v14 = v17;
    v7 = v14;
    if (!v13)
    {
      v15 = 0;
      goto LABEL_18;
    }
    v8 = v14;
  }
  v15 = v8;
LABEL_18:

  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
  return v15;
}

- (id)stop
{
  recursive_mutex *p_lock;
  id v4;
  int v5;
  id v6;
  id v8;
  char v9;
  id v10;

  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  v10 = 0;
  -[DTKPKperfAggregator _ktraceTeardown:](self, "_ktraceTeardown:", &v10);
  v4 = v10;
  self->_endTime.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  if (self->_usingTimer)
    -[DVTQueueBasedTimer stop](self->_timer, "stop");
  v9 = 0;
  do
  {
    v8 = v4;
    v5 = -[DTKPKperfAggregator _flushDataFromKernel:more:error:](self, "_flushDataFromKernel:more:error:", 0, &v9, &v8);
    v6 = v8;

    if (v5)
      break;
    v4 = v6;
  }
  while (v9);
  -[DTKPKperfAggregator _releaseKernelResources](self, "_releaseKernelResources");
  -[DTKPKperfAggregator _reportStats](self, "_reportStats");
  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
  return v6;
}

- (id)swapOutCurrentDatastream:(id *)a3
{
  return (id)MEMORY[0x24BEDD108](self->_manager, sel_export);
}

- (void)_kernelCallbackNotifyCallblock:(unsigned int)a3
{
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  unsigned int v8;

  v4 = _Block_copy(self->_callback);
  if (v4)
  {
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = sub_222B97D2C;
    v6[3] = &unk_24EB2B020;
    v7 = v4;
    v8 = a3;
    dispatch_async(v5, v6);

  }
}

- (void)_kernelCallbackStop
{
  -[DVTQueueBasedTimer stop](self->_timer, "stop");
}

- (id)_kernelCallbackStart
{
  -[DVTQueueBasedTimer start](self->_timer, "start");
  return 0;
}

- (void)_kernelCallbackError
{
  NSObject *v3;
  _QWORD block[5];

  -[DTKPKperfAggregator _kernelCallbackNotifyCallblock:](self, "_kernelCallbackNotifyCallblock:", 1);
  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B97DE0;
  block[3] = &unk_24EB2A030;
  block[4] = self;
  dispatch_async(v3, block);

}

- (unsigned)_kernelCallbackImpl
{
  int v3;
  int v4;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  unint64_t v11;
  id v13;
  char v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  ++self->_callbackCalledCount;
  v3 = kperf_buffer_wait();
  v4 = v3;
  if (v3 == 35 || v3 == 0)
  {
    v14 = 0;
    v13 = 0;
    -[DTKPKperfAggregator _flushDataFromKernel:more:error:](self, "_flushDataFromKernel:more:error:", 0, &v14, &v13);
    v6 = v13;
    if (v6)
    {
      if (qword_25576FC30 != -1)
        dispatch_once(&qword_25576FC30, &unk_24EB27A30);
      v7 = (id)qword_25576FC38;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "localizedDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        sub_222BC77E4(v8, (uint64_t)v15, v7);
      }

      -[DTKPKperfAggregator _kernelCallbackError](self, "_kernelCallbackError");
      v9 = 2;
    }
    else if (!v4
           || v14
           || (v11 = -[DVTStreamManager currentStreamSize](self->_manager, "currentStreamSize"),
               v11 >= -[DTKPConfiguration bufferSize](self->_config, "bufferSize")))
    {
      -[DTKPKperfAggregator _kernelCallbackNotifyCallblock:](self, "_kernelCallbackNotifyCallblock:", 2);
      v9 = 0;
      ++self->_callbackNotificationCount;
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    if (qword_25576FC30 != -1)
      dispatch_once(&qword_25576FC30, &unk_24EB27A30);
    v10 = qword_25576FC38;
    if (os_log_type_enabled((os_log_t)qword_25576FC38, OS_LOG_TYPE_ERROR))
      sub_222BC7770(v4, v10);
    -[DTKPKperfAggregator _kernelCallbackError](self, "_kernelCallbackError");
    return 2;
  }
  return v9;
}

- (id)_kernelCallbackInit
{
  DVTQueueBasedTimer *v3;
  DVTQueueBasedTimer *v4;
  DVTQueueBasedTimer *timer;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = *(_QWORD *)"";
  v8[3] = sub_222B98110;
  v8[4] = sub_222B9811C;
  objc_initWeak(&v9, self);
  v3 = [DVTQueueBasedTimer alloc];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B98124;
  v7[3] = &unk_24EB2B048;
  v7[4] = v8;
  v4 = -[DVTQueueBasedTimer initWithInterval:qos:block:](v3, "initWithInterval:qos:block:", 25, v7, 0.2);
  timer = self->_timer;
  self->_timer = v4;

  _Block_object_dispose(v8, 8);
  objc_destroyWeak(&v9);
  return 0;
}

- (void)_releaseKernelResources
{
  uint64_t v3;

  if (self->_kperfBuffer)
  {
    kperf_buffer_free();
    self->_kperfBuffer = 0;
    v3 = kperf_logging_set_size();
    MEMORY[0x227679830](v3);
    kperf_reset();
  }
}

- (id)_kdebugReadWithMoreLocked:(BOOL *)a3 error:(id *)a4
{
  unint64_t v6;
  size_t v7;
  void *v8;
  void *v9;
  void *v10;
  int *v11;
  void *v12;
  size_t v14;
  int v15[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3)
    *a3 = 0;
  v6 = -[DTKPConfiguration bufferSize](self->_config, "bufferSize");
  if (v6 >= 0x2000000)
    v7 = 0x2000000;
  else
    v7 = v6;
  v14 = v7;
  v8 = malloc_type_malloc(v7, 0xA52F31E0uLL);
  *(_OWORD *)v15 = xmmword_222BD2380;
  v16 = 0;
  if (sysctl(v15, 3u, v8, &v14, 0, 0) < 0)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      v11 = __error();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("trace_read failed with errno: %s"), strerror(*v11));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      sub_222B96DA4(v12, -1);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (*__error())
    {
      v9 = 0;
      return v9;
    }
  }
  else
  {
    v14 <<= 6;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 && v7 - v14 <= 0x3FF)
    *a3 = 1;
  return v9;
}

- (id)_getKperfKernelBufferLocked:(BOOL *)a3 error:(id *)a4
{
  int v5;
  int v6;
  __CFString *v7;
  int v8;
  void *v9;

  v5 = kperf_buffer_readdata_withmore();
  if (v5 <= 0)
  {
    v8 = v5;
    v9 = 0;
    if (a4 && v8)
    {
      v7 = CFSTR("kperf_buffer_readdata_withmore failed.");
      goto LABEL_8;
    }
  }
  else
  {
    v6 = kperf_buffer_getbuf();
    if (a4 && v6)
    {
      v7 = CFSTR("kperf_buffer_getbuf failed.");
LABEL_8:
      sub_222B986D0(v7, -6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:deallocator:");
  }
  return v9;
}

- (id)_getKernelBufferLocked:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  void *v9;

  if (!self->_hasUsedKperf)
  {
    -[DTKPKperfAggregator _getKperfKernelBufferLocked:error:](self, "_getKperfKernelBufferLocked:error:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      return v7;
    v9 = v7;
    self->_hasUsedKperf = 1;
    -[DVTStreamManager commit:error:](self->_manager, "commit:error:", v7, a4);

  }
  -[DTKPKperfAggregator _kdebugReadWithMoreLocked:error:](self, "_kdebugReadWithMoreLocked:error:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (int)_flushDataFromKernel:(unsigned int)a3 more:(BOOL *)a4 error:(id *)a5
{
  unint64_t v6;
  BOOL *v7;
  unint64_t v8;
  id *v9;
  void *v10;
  uint64_t v11;
  int64x2_t v12;
  uint64_t v13;
  int v14;
  int64x2_t v16;
  uint64_t v17;
  char v18;

  v18 = 1;
  v17 = 0;
  if (a3)
    v6 = a3;
  else
    v6 = 0xFFFFFFFFLL;
  if (a4)
  {
    v7 = a4;
    *a4 = 1;
  }
  else
  {
    v7 = (BOOL *)&v18;
  }
  v8 = 0;
  if (a5)
    v9 = a5;
  else
    v9 = (id *)&v17;
  v16 = vdupq_n_s64(1uLL);
  while (1)
  {
    if (!std::recursive_mutex::try_lock((std::recursive_mutex *)&self->_lock))
      return 0;
    -[DTKPKperfAggregator _getKernelBufferLocked:error:](self, "_getKernelBufferLocked:error:", v7, v9, v16.i64[0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    v12.i64[1] = v16.i64[1];
    v12.i64[0] = v11;
    *(int64x2_t *)&self->_dataPulledSize = vaddq_s64(*(int64x2_t *)&self->_dataPulledSize, v12);
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_lock);
    if (*v9)
    {
      v14 = -6;
      goto LABEL_22;
    }
    if (objc_msgSend(v10, "length"))
      break;
LABEL_16:

    v14 = 0;
    if (!*v7 || v8 >= v6)
      return v14;
  }
  v13 = objc_msgSend(v10, "length");
  -[DVTStreamManager commit:error:](self->_manager, "commit:error:", v10, v9);
  if (!*v9)
  {
    v8 += v13;
    goto LABEL_16;
  }
  v14 = -100;
LABEL_22:

  return v14;
}

- (id)callback
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_lock);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (id).cxx_construct
{
  self->_startTime.__d_.__rep_ = 0;
  self->_endTime.__d_.__rep_ = 0;
  MEMORY[0x227678F78](&self->_lock, a2);
  return self;
}

@end
