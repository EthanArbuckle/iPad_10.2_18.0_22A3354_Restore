@implementation OSLaunchdJob

- (void)cancelMonitor
{
  NSObject *monitor_source;
  OS_dispatch_source *v4;
  id monitor_handler;
  OS_dispatch_queue *monitor_queue;

  monitor_source = self->_monitor_source;
  if (monitor_source)
  {
    dispatch_source_cancel(monitor_source);
    v4 = self->_monitor_source;
    self->_monitor_source = 0;

  }
  monitor_handler = self->_monitor_handler;
  self->_monitor_handler = 0;

  monitor_queue = self->_monitor_queue;
  self->_monitor_queue = 0;

}

+ (id)copyJobWithPid:(int)a3
{
  xpc_object_t v5;
  int v6;
  int v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  _BYTE v13[10];
  _DWORD v14[18];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0)
    +[OSLaunchdJob copyJobWithPid:].cold.1(&v11, buf);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "pid", a3);
  v11 = 0;
  v6 = _launch_job_routine();
  if (!v6)
  {
    objc_msgSend(a1, "_createJobFromReplyHandle:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
      goto LABEL_12;
    _os_launch_job_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v13 = v8;
      *(_WORD *)&v13[8] = 1024;
      v14[0] = a3;
      _os_log_impl(&dword_21350E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: copyJobWithPid:%d created a job", buf, 0x12u);
    }
LABEL_11:

    goto LABEL_12;
  }
  v7 = v6;
  if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
  {
    _os_launch_job_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v13 = a3;
      *(_WORD *)&v13[4] = 1024;
      *(_DWORD *)&v13[6] = v7;
      LOWORD(v14[0]) = 2080;
      *(_QWORD *)((char *)v14 + 2) = xpc_strerror();
      _os_log_impl(&dword_21350E000, v9, OS_LOG_TYPE_DEFAULT, "copyJobWithPid:%d failed with error %d: %s", buf, 0x18u);
    }
    v8 = 0;
    goto LABEL_11;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

void __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke_30(uint64_t a1)
{
  uint64_t v2;
  int64_t int64;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  _WORD v19[17];

  *(_QWORD *)&v19[13] = *MEMORY[0x24BDAC8D0];
  v2 = xpc_pipe_receive();
  int64 = v2;
  if ((v2 | 0x20) != 0x20)
  {
    _os_assumes_log();
LABEL_4:
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v17 = v5;
        v18 = 1024;
        *(_DWORD *)v19 = int64;
        v19[2] = 2080;
        *(_QWORD *)&v19[3] = xpc_strerror();
        _os_log_impl(&dword_21350E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ monitor: got error %d: %s", buf, 0x1Cu);
      }

    }
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, +[OSLaunchdJob _monitorNormalizeError:](OSLaunchdJob, "_monitorNormalizeError:", int64));
    goto LABEL_9;
  }
  if ((_DWORD)v2)
    goto LABEL_4;
  int64 = xpc_dictionary_get_int64(0, "error");
  if ((_DWORD)int64)
    goto LABEL_4;
  +[OSLaunchdJob jobInfoFromMessage:](OSLaunchdJob, "jobInfoFromMessage:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
  {
    _os_launch_job_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2114;
      *(_QWORD *)v19 = v6;
      _os_log_impl(&dword_21350E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ monitor: got an update with info %{public}@", buf, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "_newRequest");
  v10 = (void *)xpc_mach_send_create_with_disposition();
  xpc_dictionary_set_value(v9, "client-port", v10);
  v11 = MEMORY[0x2199B51F4](1002, v9, *(unsigned int *)(a1 + 56));
  if ((_DWORD)v11)
  {
    v12 = v11;
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = xpc_strerror();
        *(_DWORD *)buf = 138543874;
        v17 = v14;
        v18 = 1024;
        *(_DWORD *)v19 = v12;
        v19[2] = 2080;
        *(_QWORD *)&v19[3] = v15;
        _os_log_impl(&dword_21350E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ monitor: failed to re-arm monitor poll, error %d: %s", buf, 0x1Cu);
      }

    }
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, +[OSLaunchdJob _monitorNormalizeError:](OSLaunchdJob, "_monitorNormalizeError:", v12));
  }

LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_monitor_queue, 0);
  objc_storeStrong(&self->_monitor_handler, 0);
  objc_storeStrong((id *)&self->_monitor_source, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_plist, 0);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (self->_handle)
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend((id)objc_opt_class(), "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ | handle=%@>"), v4, self->_handle);

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)OSLaunchdJob;
    -[OSLaunchdJob description](&v7, sel_description);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (OSLaunchdJob)initWithPlist:(id)a3
{
  id v4;
  void *v5;
  OSLaunchdJob *v6;

  v4 = a3;
  +[OSLaunchdDomain currentDomain](OSLaunchdDomain, "currentDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[OSLaunchdJob initWithPlist:domain:](self, "initWithPlist:domain:", v4, v5);

  return v6;
}

- (OSLaunchdJob)initWithPlist:(id)a3 domain:(id)a4
{
  id v7;
  id v8;
  void *v9;
  OSLaunchdJob *v10;
  OSLaunchdJob *v11;
  OSLaunchdJob *v12;
  objc_super v14;
  uint64_t v15;
  _OWORD v16[5];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
    -[OSLaunchdJob initWithPlist:domain:].cold.1(&v15, v16);
  v9 = v8;
  if (MEMORY[0x2199B5590](v7) != MEMORY[0x24BDACFA0])
    -[OSLaunchdJob initWithPlist:domain:].cold.2(&v15, v16);
  v14.receiver = self;
  v14.super_class = (Class)OSLaunchdJob;
  v10 = -[OSLaunchdJob init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_plist, a3);
    objc_storeStrong((id *)&v11->_domain, a4);
    v12 = v11;
  }

  return v11;
}

+ (id)copyJobWithHandle:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  const uint8_t *uuid;
  uint64_t v12;
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v17;
  xpc_object_t xdict;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
    +[OSLaunchdJob copyJobWithHandle:].cold.1(&xdict, buf);
  v4 = v3;

  v5 = -[OSLaunchdJob _initWithHandle:]([OSLaunchdJob alloc], "_initWithHandle:", v4);
  v6 = (void *)objc_msgSend(v5, "_newRequest");
  xdict = 0;
  v7 = _launch_job_routine();
  if (v7)
  {
    v8 = v7;
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v20 = v4;
        v21 = 1024;
        v22 = v8;
        v23 = 2080;
        v24 = xpc_strerror();
        _os_log_impl(&dword_21350E000, v9, OS_LOG_TYPE_DEFAULT, "copyJobWithHandle:%{public}@ failed with error %d: %s", buf, 0x1Cu);
      }

    }
    v10 = 0;
  }
  else
  {
    uuid = xpc_dictionary_get_uuid(xdict, "job-handle");
    if (!uuid)
      -[OSLaunchdJob _populateHandle:].cold.1(&v17, buf);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", uuid);

    objc_msgSend(v5, "handle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      +[OSLaunchdJob copyJobWithHandle:].cold.3(&v17, buf);
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v5;
        _os_log_impl(&dword_21350E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: copyJobWithHandle: created a job", buf, 0xCu);
      }

    }
    v10 = v5;
    v4 = (void *)v12;
  }

  return v10;
}

- (id)_newCreateInstanceRequest:(unsigned __int8)a3[16] properties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = -[OSLaunchdJob _newRequest](self, "_newRequest");
  xpc_dictionary_set_uuid(v7, "instance-uuid", a3);
  objc_msgSend(v6, "sandboxProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "sandboxProfile");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v7, "sandbox-profile", (const char *)objc_msgSend(v9, "UTF8String"));

  }
  objc_msgSend(v6, "environmentVariables");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "environmentVariables");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();

    xpc_dictionary_set_value(v7, "envvars", v12);
  }

  return v7;
}

+ (id)submitExtension:(id)a3 overlay:(id)a4 domain:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  xpc_object_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  _DWORD v24[23];

  *(_QWORD *)&v24[21] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
    +[OSLaunchdJob submitExtension:overlay:domain:error:].cold.1(&v22, buf);
  v13 = v12;
  if (!v12)
    +[OSLaunchdJob submitExtension:overlay:domain:error:].cold.2(&v22, buf);
  v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v14, "type", *((int *)v13 + 2));
  xpc_dictionary_set_uint64(v14, "handle", v13[2]);
  v15 = objc_retainAutorelease(v10);
  xpc_dictionary_set_string(v14, "path", (const char *)objc_msgSend(v15, "UTF8String"));
  xpc_dictionary_set_value(v14, "overlay", v11);
  v22 = 0;
  v16 = _launch_job_routine();
  if ((_DWORD)v16)
  {
    v17 = v16;
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v24[0] = v17;
        LOWORD(v24[1]) = 2080;
        *(_QWORD *)((char *)&v24[1] + 2) = xpc_strerror();
        _os_log_impl(&dword_21350E000, v18, OS_LOG_TYPE_DEFAULT, "submitExtension failed with error %d: %s", buf, 0x12u);
      }

    }
    if (a6)
    {
      +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", v17);
      v19 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    objc_msgSend(a1, "_createJobFromReplyHandle:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v24 = v19;
        _os_log_impl(&dword_21350E000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: submitExtension created a job", buf, 0xCu);
      }

    }
  }

  return v19;
}

- (id)start:(id *)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  OSLaunchdJob *v14;
  __int16 v15;
  _WORD v16[41];

  *(_QWORD *)&v16[37] = *MEMORY[0x24BDAC8D0];
  v5 = -[OSLaunchdJob _newRequest](self, "_newRequest");
  v12 = 0;
  v6 = _launch_job_routine();
  if ((_DWORD)v6)
  {
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v14 = self;
        v15 = 1024;
        *(_DWORD *)v16 = v6;
        v16[2] = 2080;
        *(_QWORD *)&v16[3] = xpc_strerror();
        _os_log_impl(&dword_21350E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: start failed with error %d: %s", buf, 0x1Cu);
      }

    }
    if (a3)
    {
      +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", v6);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    +[OSLaunchdJob jobInfoFromMessage:](OSLaunchdJob, "jobInfoFromMessage:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v8, "state") - 4) <= 0xFFFFFFFFFFFFFFFDLL)
      -[OSLaunchdJob start:].cold.1(&v11, buf);
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v14 = self;
        v15 = 2114;
        *(_QWORD *)v16 = v8;
        _os_log_impl(&dword_21350E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: start succeeded, info=%{public}@", buf, 0x16u);
      }

    }
  }

  return v8;
}

- (id)submitAndStart:(id *)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  OS_xpc_object *plist;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  _BYTE v19[18];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (self->_handle)
    -[OSLaunchdJob _populateHandle:].cold.2(&v17, buf);
  if (!self->_plist)
    -[OSLaunchdJob _newSubmitRequest].cold.1(&v17, buf);
  if (!self->_domain)
    -[OSLaunchdJob _newSubmitRequest].cold.2(&v17, buf);
  v5 = -[OSLaunchdJob _newSubmitRequest](self, "_newSubmitRequest");
  v17 = 0;
  v6 = _launch_job_routine();
  if ((_DWORD)v6)
  {
    v7 = v6;
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v19 = v7;
        *(_WORD *)&v19[4] = 2080;
        *(_QWORD *)&v19[6] = xpc_strerror();
        _os_log_impl(&dword_21350E000, v8, OS_LOG_TYPE_DEFAULT, "submitAndStart failed with error %d: %s", buf, 0x12u);
      }

    }
    if (a3)
    {
      +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", v7);
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    -[OSLaunchdJob processSubmitReply:](self, "processSubmitReply:", v17);
    +[OSLaunchdJob jobInfoFromMessage:](OSLaunchdJob, "jobInfoFromMessage:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "state");
    if ((unint64_t)(v10 - 4) <= 0xFFFFFFFFFFFFFFFDLL)
      -[OSLaunchdJob submitAndStart:].cold.3(&v16, buf);
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v19 = self;
        *(_WORD *)&v19[8] = 2114;
        *(_QWORD *)&v19[10] = v9;
        _os_log_impl(&dword_21350E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: submitAndStart completed, info=%{public}@", buf, 0x16u);
      }

    }
    if (v10 == 3)
    {
      v12 = (void *)xpc_copy_short_description();
      if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
      {
        _os_launch_job_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[OSLaunchdJob submitAndStart:].cold.4((uint64_t)self, (uint64_t)v12, v13);

      }
      free(v12);
    }
    plist = self->_plist;
    self->_plist = 0;

  }
  return v9;
}

- (void)processSubmitReply:(id)a3
{
  id v4;

  v4 = a3;
  -[OSLaunchdJob _populateHandle:](self, "_populateHandle:");
  if (self->_monitor_handler)
    -[OSLaunchdJob _startMonitoringAfterSubmit:](self, "_startMonitoringAfterSubmit:", v4);

}

- (void)_populateHandle:(id)a3
{
  id v4;
  const uint8_t *uuid;
  NSUUID *v6;
  NSUUID *handle;
  id v8;
  uint64_t v9;
  _OWORD v10[5];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_handle)
    -[OSLaunchdJob _populateHandle:].cold.2(&v9, v10);
  v8 = v4;
  uuid = xpc_dictionary_get_uuid(v4, "job-handle");
  if (!uuid)
    -[OSLaunchdJob _populateHandle:].cold.1(&v9, v10);
  v6 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", uuid);
  handle = self->_handle;
  self->_handle = v6;

}

- (id)_newSubmitRequest
{
  id v3;
  uint64_t v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!self->_plist)
    -[OSLaunchdJob _newSubmitRequest].cold.1(&v5, v6);
  if (!self->_domain)
    -[OSLaunchdJob _newSubmitRequest].cold.2(&v5, v6);
  v3 = -[OSLaunchdJob _newRequest](self, "_newRequest");
  xpc_dictionary_set_uint64(v3, "type", self->_domain->_type);
  xpc_dictionary_set_uint64(v3, "handle", self->_domain->_handle);
  xpc_dictionary_set_value(v3, "plist", self->_plist);
  xpc_dictionary_set_BOOL(v3, "monitor", self->_monitor_handler != 0);
  return v3;
}

- (void)monitorOnQueue:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  OS_dispatch_queue *monitor_queue;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id monitor_handler;
  OS_dispatch_queue *v16;
  id v17;
  uint8_t buf[4];
  OSLaunchdJob *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
    -[OSLaunchdJob monitorOnQueue:withHandler:].cold.1(&v17, buf);
  if (self->_monitor_handler)
    -[OSLaunchdJob monitorOnQueue:withHandler:].cold.4(&v17, buf);
  if (self->_monitor_source)
    -[OSLaunchdJob monitorOnQueue:withHandler:].cold.3(&v17, buf);
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (self->_handle)
  {
    monitor_queue = -[OSLaunchdJob _newRequest](self, "_newRequest");
    v17 = 0;
    v10 = _launch_job_routine();
    if ((_DWORD)v10)
    {
      v11 = v10;
      if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
      {
        _os_launch_job_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v19 = self;
          v20 = 1024;
          v21 = v11;
          v22 = 2080;
          v23 = xpc_strerror();
          _os_log_impl(&dword_21350E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: error creating monitor %d: %s", buf, 0x1Cu);
        }

      }
      v8[2](v8, 0, +[OSLaunchdJob _monitorNormalizeError:](OSLaunchdJob, "_monitorNormalizeError:", v11));
    }
    else
    {
      -[OSLaunchdJob setupMonitorOnQueue:withHandler:reply:](self, "setupMonitorOnQueue:withHandler:reply:", v6, v8, v17);
    }

  }
  else
  {
    if (!self->_plist)
      -[OSLaunchdJob _newSubmitRequest].cold.1(&v17, buf);
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21350E000, v13, OS_LOG_TYPE_DEFAULT, "monitoring will start once the job is submitted", buf, 2u);
      }

    }
    v14 = (void *)MEMORY[0x2199B53D4](v8);
    monitor_handler = self->_monitor_handler;
    self->_monitor_handler = v14;

    v16 = (OS_dispatch_queue *)v6;
    monitor_queue = self->_monitor_queue;
    self->_monitor_queue = v16;
  }

}

- (id)_newRequest
{
  xpc_object_t v3;
  NSUUID *handle;
  unsigned __int8 uuid[8];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = xpc_dictionary_create(0, 0, 0);
  handle = self->_handle;
  if (handle)
  {
    *(_QWORD *)uuid = 0;
    v7 = 0;
    -[NSUUID getUUIDBytes:](handle, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v3, "job-handle", uuid);
  }
  return v3;
}

- (id)createInstance:(unsigned __int8)a3[16] properties:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v13;
  uint8_t buf[4];
  OSLaunchdJob *v15;
  __int16 v16;
  _WORD v17[17];

  *(_QWORD *)&v17[13] = *MEMORY[0x24BDAC8D0];
  if (self->_handle)
  {
    v7 = -[OSLaunchdJob _newCreateInstanceRequest:properties:](self, "_newCreateInstanceRequest:properties:", a3, a4);
    v8 = _launch_job_routine();
    if ((_DWORD)v8)
    {
      if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
      {
        _os_launch_job_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v15 = self;
          v16 = 1024;
          *(_DWORD *)v17 = v8;
          v17[2] = 2080;
          *(_QWORD *)&v17[3] = xpc_strerror();
          _os_log_impl(&dword_21350E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: createInstance failed with error %d: %s", buf, 0x1Cu);
        }

      }
      if (a5)
      {
        +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", v8);
        v10 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      +[OSLaunchdJob _createJobFromReplyHandle:](OSLaunchdJob, "_createJobFromReplyHandle:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
      {
        _os_launch_job_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v15 = self;
          v16 = 2114;
          *(_QWORD *)v17 = v10;
          _os_log_impl(&dword_21350E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: createInstance created a job %{public}@", buf, 0x16u);
        }

      }
    }

    return v10;
  }
  else
  {
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd", a3, a4))
    {
      _os_launch_job_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = self;
        _os_log_impl(&dword_21350E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: createInstance on a job with no handle (ESRCH)", buf, 0xCu);
      }

    }
    if (a5)
    {
      +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", 3);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
}

- (void)_setupMonitorSourceWithPort:(unsigned int)a3 onQueue:(id)a4 withHandler:(id)a5
{
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *monitor_source;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  OSLaunchdJob *v21;
  id v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  unsigned int v28;
  uint64_t v29;
  uint8_t buf[88];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (!a3)
    -[OSLaunchdJob _setupMonitorSourceWithPort:onQueue:withHandler:].cold.1(&v29, buf);
  v10 = v9;
  if (!v9)
    -[OSLaunchdJob monitorOnQueue:withHandler:].cold.1(&v29, buf);
  if (self->_monitor_source)
    -[OSLaunchdJob monitorOnQueue:withHandler:].cold.3(&v29, buf);
  if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
  {
    _os_launch_job_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_21350E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: starting monitoring", buf, 0xCu);
    }

  }
  v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDAC9E0], a3, 0, v8);
  monitor_source = self->_monitor_source;
  self->_monitor_source = v12;

  v14 = MEMORY[0x24BDAC760];
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke;
  v27 = &__block_descriptor_36_e5_v8__0l;
  v28 = a3;
  dispatch_source_set_mandatory_cancel_handler();
  -[OSLaunchdJob handle](self, "handle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_monitor_source;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke_30;
  v19[3] = &unk_24CFE3B38;
  v23 = a3;
  v21 = self;
  v22 = v10;
  v20 = v15;
  v17 = v10;
  v18 = v15;
  dispatch_source_set_event_handler(v16, v19);
  dispatch_activate((dispatch_object_t)self->_monitor_source);

}

- (NSUUID)handle
{
  return self->_handle;
}

+ (id)jobInfoFromMessage:(id)a3
{
  id v3;
  int64_t int64;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  OSLaunchdJobExitStatus *v9;
  uint64_t v10;
  const uint8_t *uuid;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  OSLaunchdJobInfo *v17;
  OSLaunchdJobInfo *v18;
  void *v19;
  int64_t v20;
  void *v21;
  OSLaunchdJobInfo *v22;
  int64_t v23;
  int64_t value;
  OSLaunchdJobExitStatus *v26;
  int64_t v27;
  _BOOL4 v28;
  void *v29;
  OSLaunchdJobExitStatus *v30;
  uint64_t v31;
  _OWORD v32[5];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v27 = +[OSLaunchdJob jobStateFromMessage:](OSLaunchdJob, "jobStateFromMessage:", v3);
  int64 = xpc_dictionary_get_int64(v3, "pid");
  v5 = xpc_dictionary_get_int64(v3, "spawn-error");
  xpc_dictionary_get_value(v3, "wait4-status");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v3, "os-reason-ns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v3, "os-reason-code");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v3, "os-reason-flags");
  v9 = (OSLaunchdJobExitStatus *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v3, "additional-properties");
  v10 = objc_claimAutoreleasedReturnValue();
  v28 = xpc_dictionary_get_BOOL(v3, "removing");
  uuid = xpc_dictionary_get_uuid(v3, "instance");
  v29 = (void *)v10;
  v30 = v9;
  if (v6 || v7 || v8 || v9)
  {
    if (!v6)
      +[OSLaunchdJob jobInfoFromMessage:].cold.4(&v31, v32);
    if (!v7)
      +[OSLaunchdJob jobInfoFromMessage:].cold.3(&v31, v32);
    if (!v8)
      +[OSLaunchdJob jobInfoFromMessage:].cold.2(&v31, v32);
    if (!v9)
      +[OSLaunchdJob jobInfoFromMessage:].cold.1(&v31, v32);
    v26 = [OSLaunchdJobExitStatus alloc];
    value = xpc_int64_get_value(v6);
    v12 = v5;
    v13 = xpc_uint64_get_value(v7);
    v14 = xpc_uint64_get_value(v8);
    v15 = xpc_uint64_get_value(v9);
    v16 = v13;
    v5 = v12;
    v9 = -[OSLaunchdJobExitStatus initWithWait4Status:os_reason_namespace:os_reason_code:os_reason_flags:](v26, "initWithWait4Status:os_reason_namespace:os_reason_code:os_reason_flags:", value, v16, v14, v15);
  }
  v17 = [OSLaunchdJobInfo alloc];
  v18 = v17;
  if (uuid)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", uuid);
    v20 = int64;
    v21 = v29;
    v22 = -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:](v18, "initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:", v27, v20, v5, v9, v29, v28, v19);

  }
  else
  {
    v23 = int64;
    v21 = v29;
    v22 = -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:](v17, "initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:", v27, v23, v5, v9, v29, v28, 0);
  }

  return v22;
}

+ (int64_t)jobStateFromMessage:(id)a3
{
  id v3;
  unsigned int uint64;
  uint64_t v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  uint64 = xpc_dictionary_get_uint64(v3, "job-state");
  if (uint64 >= 4)
    +[OSLaunchdJob jobStateFromMessage:].cold.1(&v6, v7);

  return uint64 + 1;
}

- (void)setupMonitorOnQueue:(id)a3 withHandler:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id monitor_handler;
  id v15;
  int v16;
  OSLaunchdJob *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  +[OSLaunchdJob jobInfoFromMessage:](OSLaunchdJob, "jobInfoFromMessage:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
  {
    _os_launch_job_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_21350E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: monitor initial info is %{public}@", (uint8_t *)&v16, 0x16u);
    }

  }
  v13 = (void *)MEMORY[0x2199B53D4](v9);
  monitor_handler = self->_monitor_handler;
  self->_monitor_handler = v13;

  v9[2](v9, v11, 0);
  v15 = self->_monitor_handler;
  if (v15)
  {
    self->_monitor_handler = 0;

    -[OSLaunchdJob _setupMonitorSourceWithPort:onQueue:withHandler:](self, "_setupMonitorSourceWithPort:onQueue:withHandler:", xpc_dictionary_extract_mach_recv(), v8, v9);
  }

}

+ (BOOL)disableLogging_4watchdogd
{
  return _OSLaunchdJobLoggingDisabled;
}

+ (id)_createJobFromReplyHandle:(id)a3
{
  id v3;
  const uint8_t *uuid;
  void *v5;
  id v6;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  uuid = xpc_dictionary_get_uuid(v3, "job-handle");
  if (!uuid)
    -[OSLaunchdJob _populateHandle:].cold.1(&v8, v9);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", uuid);
  v6 = -[OSLaunchdJob _initWithHandle:]([OSLaunchdJob alloc], "_initWithHandle:", v5);

  return v6;
}

- (id)_initWithHandle:(id)a3
{
  id v5;
  void *v6;
  OSLaunchdJob *v7;
  OSLaunchdJob *v8;
  OSLaunchdJob *v9;
  objc_super v11;
  uint64_t v12;
  __int128 v13[5];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
    -[OSLaunchdJob _initWithHandle:].cold.1(&v12, v13);
  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)OSLaunchdJob;
  v7 = -[OSLaunchdJob init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_handle, a3);
    v9 = v8;
  }

  return v8;
}

- (void)monitorOnQueue:(_QWORD *)a1 withHandler:(_OWORD *)a2 .cold.3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

uint64_t __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  result = _xpc_mach_port_close_recv(*(_DWORD *)(a1 + 32), 0, 0);
  if ((_DWORD)result)
    __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke_cold_1(&v2, v3);
  return result;
}

- (void)_startMonitoringAfterSubmit:(id)a3
{
  id v4;
  id monitor_handler;
  OS_dispatch_queue *monitor_queue;
  id v7;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_monitor_handler)
    -[OSLaunchdJob _startMonitoringAfterSubmit:].cold.1(&v8, v9);
  v7 = v4;
  -[OSLaunchdJob _setupMonitorSourceWithPort:onQueue:withHandler:](self, "_setupMonitorSourceWithPort:onQueue:withHandler:", xpc_dictionary_extract_mach_recv(), self->_monitor_queue, self->_monitor_handler);
  monitor_handler = self->_monitor_handler;
  self->_monitor_handler = 0;

  monitor_queue = self->_monitor_queue;
  self->_monitor_queue = 0;

}

- (BOOL)submit:(id *)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  OS_xpc_object *plist;
  id v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_handle)
    -[OSLaunchdJob _populateHandle:].cold.2(&v10, buf);
  if (!self->_plist)
    -[OSLaunchdJob _newSubmitRequest].cold.1(&v10, buf);
  if (!self->_domain)
    -[OSLaunchdJob _newSubmitRequest].cold.2(&v10, buf);
  v5 = -[OSLaunchdJob _newSubmitRequest](self, "_newSubmitRequest");
  v10 = 0;
  v6 = _launch_job_routine();
  if ((_DWORD)v6)
  {
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v12 = v6;
        v13 = 2080;
        v14 = xpc_strerror();
        _os_log_impl(&dword_21350E000, v7, OS_LOG_TYPE_DEFAULT, "submit failed with error %d: %s", buf, 0x12u);
      }

    }
    if (a3)
    {
      +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    plist = self->_plist;
    self->_plist = 0;

    -[OSLaunchdJob processSubmitReply:](self, "processSubmitReply:", v10);
  }

  return (_DWORD)v6 == 0;
}

+ (BOOL)submitAll:(id)a3 error:(id *)a4
{
  id v5;
  xpc_object_t empty;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  xpc_object_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  size_t count;
  size_t v21;
  id v22;
  unint64_t v23;
  void *v24;
  int64_t int64;
  NSObject *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  xpc_object_t v33;
  id *v34;
  uint64_t v35;
  xpc_object_t xdict;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  _BYTE v42[14];
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  empty = xpc_array_create_empty();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "_newSubmitRequest");
        xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v9);
  }

  v13 = xpc_dictionary_create_empty();
  xpc_dictionary_set_value(v13, "all-jobs", empty);
  xdict = 0;
  v14 = _launch_job_routine();
  if ((_DWORD)v14)
  {
    v15 = v14;
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = xpc_strerror();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v42 = v15;
        *(_WORD *)&v42[4] = 2080;
        *(_QWORD *)&v42[6] = v17;
        _os_log_impl(&dword_21350E000, v16, OS_LOG_TYPE_DEFAULT, "submit failed with error %d: %s", buf, 0x12u);
      }

    }
    if (a4)
    {
      +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", v15);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    xpc_dictionary_get_array(xdict, "results");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    count = xpc_array_get_count(v19);
    if (count != objc_msgSend(v7, "count"))
      +[OSLaunchdJob submitAll:error:].cold.1(&v35, buf);
    if (xpc_array_get_count(v19))
    {
      v33 = v13;
      v34 = a4;
      v21 = 0;
      v22 = 0;
      v23 = 0x24CFE3000uLL;
      do
      {
        xpc_array_get_dictionary(v19, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        int64 = xpc_dictionary_get_int64(v24, "error");
        if ((_DWORD)int64)
        {
          if ((objc_msgSend(*(id *)(v23 + 2024), "disableLogging_4watchdogd") & 1) == 0)
          {
            _os_launch_job_log();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "objectAtIndexedSubscript:", v21);
              v27 = v23;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = xpc_strerror();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)v42 = v28;
              *(_WORD *)&v42[8] = 1024;
              *(_DWORD *)&v42[10] = int64;
              v43 = 2080;
              v44 = v29;
              _os_log_impl(&dword_21350E000, v26, OS_LOG_TYPE_DEFAULT, "submit (%@) failed with error %d: %s", buf, 0x1Cu);

              v23 = v27;
            }

          }
          if (v22)
          {
            +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", 133);
            v30 = objc_claimAutoreleasedReturnValue();

            v22 = (id)v30;
          }
          else
          {
            +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", int64);
            v22 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v21);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "processSubmitReply:", v24);

        }
        ++v21;
      }
      while (v21 < xpc_array_get_count(v19));
      v13 = v33;
      if (v34 && v22)
      {
        v22 = objc_retainAutorelease(v22);
        *v34 = v22;
      }
    }
    else
    {
      v22 = 0;
    }
    v18 = v22 == 0;

  }
  return v18;
}

- (BOOL)remove:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint8_t buf[4];
  OSLaunchdJob *v15;
  __int16 v16;
  _WORD v17[17];

  *(_QWORD *)&v17[13] = *MEMORY[0x24BDAC8D0];
  if (self->_handle)
  {
    v5 = -[OSLaunchdJob _newRequest](self, "_newRequest");
    v6 = _launch_job_routine();
    v7 = v6;
    if ((_DWORD)v6 != 36 && (_DWORD)v6)
    {
      if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
      {
        _os_launch_job_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v15 = self;
          v16 = 1024;
          *(_DWORD *)v17 = v7;
          v17[2] = 2080;
          *(_QWORD *)&v17[3] = xpc_strerror();
          v10 = "%{public}@: remove failed with error %d %s";
          v11 = v8;
          v12 = 28;
LABEL_15:
          _os_log_impl(&dword_21350E000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
        }
LABEL_16:

      }
    }
    else if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (const char *)&unk_2135159BE;
        if ((_DWORD)v7 == 36)
          v9 = " (EINPROGRESS)";
        *(_DWORD *)buf = 138543618;
        v15 = self;
        v16 = 2080;
        *(_QWORD *)v17 = v9;
        v10 = "%{public}@: remove succeeded%s";
        v11 = v8;
        v12 = 22;
        goto LABEL_15;
      }
      goto LABEL_16;
    }

    goto LABEL_21;
  }
  if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
  {
    _os_launch_job_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_21350E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: remove on a job with no handle (ESRCH)", buf, 0xCu);
    }
    v7 = 3;
LABEL_21:

    if (!a3)
      return (_DWORD)v7 == 0;
    goto LABEL_22;
  }
  v7 = 3;
  if (!a3)
    return (_DWORD)v7 == 0;
LABEL_22:
  if ((_DWORD)v7)
  {
    +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (_DWORD)v7 == 0;
}

- (id)getCurrentJobInfo
{
  id v2;
  void *v3;

  v2 = -[OSLaunchdJob _newRequest](self, "_newRequest");
  v3 = 0;
  if (!_launch_job_routine())
  {
    +[OSLaunchdJob jobInfoFromMessage:](OSLaunchdJob, "jobInfoFromMessage:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)createInstance:(unsigned __int8)a3[16] error:(id *)a4
{
  void *v7;
  void *v8;

  v7 = (void *)objc_opt_new();
  -[OSLaunchdJob createInstance:properties:error:](self, "createInstance:properties:error:", a3, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (int)_monitorNormalizeError:(int)a3
{
  if (a3 == 3)
    return 113;
  else
    return a3;
}

+ (id)copyJobsManagedBy:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  xpc_object_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  size_t v14;
  const uint8_t *uuid;
  void *v16;
  id v17;
  uint64_t v19;
  xpc_object_t xdict;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
    +[OSLaunchdJob copyJobsManagedBy:error:].cold.1(&xdict, buf);
  v6 = v5;
  v7 = xpc_dictionary_create(0, 0, 0);
  v8 = objc_retainAutorelease(v6);
  xpc_dictionary_set_string(v7, "manager", (const char *)objc_msgSend(v8, "UTF8String"));
  xdict = 0;
  v9 = _launch_job_routine();
  if ((_DWORD)v9)
  {
    v10 = v9;
    if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v22 = v10;
        v23 = 2080;
        v24 = xpc_strerror();
        _os_log_impl(&dword_21350E000, v11, OS_LOG_TYPE_DEFAULT, "copyJobsManagedBy failed with error %d: %s", buf, 0x12u);
      }

    }
    if (a4)
    {
      +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", v10);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    xpc_dictionary_get_array(xdict, "handles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", xpc_array_get_count(v13));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (xpc_array_get_count(v13))
    {
      v14 = 0;
      do
      {
        uuid = xpc_array_get_uuid(v13, v14);
        if (!uuid)
          -[OSLaunchdJob _populateHandle:].cold.1(&v19, buf);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", uuid);
        v17 = -[OSLaunchdJob _initWithHandle:]([OSLaunchdJob alloc], "_initWithHandle:", v16);
        objc_msgSend(v12, "addObject:", v17);

        ++v14;
      }
      while (v14 < xpc_array_get_count(v13));
    }

  }
  return v12;
}

+ (id)copyJobWithLabel:(id)a3 domain:(id)a4
{
  id v6;
  _QWORD *v7;
  xpc_object_t v8;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  _WORD v19[17];

  *(_QWORD *)&v19[13] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = objc_retainAutorelease(v6);
  xpc_dictionary_set_string(v8, "label", (const char *)objc_msgSend(v9, "UTF8String"));
  xpc_dictionary_set_uint64(v8, "type", *((int *)v7 + 2));
  v10 = v7[2];

  xpc_dictionary_set_uint64(v8, "handle", v10);
  v11 = _launch_job_routine();
  if (!v11)
  {
    objc_msgSend(a1, "_createJobFromReplyHandle:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
      goto LABEL_11;
    _os_launch_job_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2114;
      *(_QWORD *)v19 = v9;
      _os_log_impl(&dword_21350E000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: copyJobWithLabel for label %{public}@ created a job", buf, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  v12 = v11;
  if (!+[OSLaunchdJob disableLogging_4watchdogd](OSLaunchdJob, "disableLogging_4watchdogd"))
  {
    _os_launch_job_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v17 = v9;
      v18 = 1024;
      *(_DWORD *)v19 = v12;
      v19[2] = 2080;
      *(_QWORD *)&v19[3] = xpc_strerror();
      _os_log_impl(&dword_21350E000, v14, OS_LOG_TYPE_DEFAULT, "copyJobWithLabel for label %{public}@ failed with error %d: %s", buf, 0x1Cu);
    }
    v13 = 0;
    goto LABEL_10;
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (void)setDisableLogging_4watchdogd:(BOOL)a3
{
  _OSLaunchdJobLoggingDisabled = a3;
}

- (void)_newSubmitRequest
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)_populateHandle:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)_populateHandle:(_QWORD *)a1 .cold.2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)_startMonitoringAfterSubmit:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)submitAndStart:(_QWORD *)a1 .cold.3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_6(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  __break(1u);
}

- (void)submitAndStart:(os_log_t)log .cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2082;
  v6 = a2;
  _os_log_error_impl(&dword_21350E000, log, OS_LOG_TYPE_ERROR, "%{public}@: job failed to spawn, plist=%{public}s", (uint8_t *)&v3, 0x16u);
}

+ (void)submitAll:(_QWORD *)a1 error:(_OWORD *)a2 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)start:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_6(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  __break(1u);
}

- (void)monitorOnQueue:(_QWORD *)a1 withHandler:(_OWORD *)a2 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)monitorOnQueue:(_QWORD *)a1 withHandler:(_OWORD *)a2 .cold.4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)initWithPlist:(_QWORD *)a1 domain:(_OWORD *)a2 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)initWithPlist:(_QWORD *)a1 domain:(_OWORD *)a2 .cold.2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)_initWithHandle:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

+ (void)jobStateFromMessage:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_6(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  __break(1u);
}

+ (void)jobInfoFromMessage:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

+ (void)jobInfoFromMessage:(_QWORD *)a1 .cold.2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

+ (void)jobInfoFromMessage:(_QWORD *)a1 .cold.3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

+ (void)jobInfoFromMessage:(_QWORD *)a1 .cold.4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)_setupMonitorSourceWithPort:(_QWORD *)a1 onQueue:(_OWORD *)a2 withHandler:.cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_6(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  __break(1u);
}

+ (void)copyJobsManagedBy:(_QWORD *)a1 error:(_OWORD *)a2 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

+ (void)copyJobWithHandle:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

+ (void)copyJobWithHandle:(_QWORD *)a1 .cold.3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

+ (void)submitExtension:(_QWORD *)a1 overlay:(_OWORD *)a2 domain:error:.cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

+ (void)submitExtension:(_QWORD *)a1 overlay:(_OWORD *)a2 domain:error:.cold.2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

+ (void)copyJobWithPid:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

@end
