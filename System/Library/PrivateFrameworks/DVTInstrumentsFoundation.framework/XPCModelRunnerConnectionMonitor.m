@implementation XPCModelRunnerConnectionMonitor

+ (int64_t)diagnoseNoXPCResponse:(int)a3
{
  NSObject *v4;
  uint64_t v5;
  os_log_t v6;
  void *v7;
  NSObject *v8;
  os_log_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  int64_t v16;
  os_log_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  NSObject *v22;
  os_log_t v23;
  void *v24;
  int v25;
  char *v26;
  NSObject *v27;
  os_log_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  NSObject *v34;
  os_log_t v35;
  void *v36;
  int v37;
  os_log_t v38;
  void *v39;
  int v40;
  NSObject *v41;
  os_log_t v42;
  void *v43;
  int v44;
  NSObject *v45;
  os_log_t v46;
  void *v47;
  uint8_t v49[4];
  _BYTE v50[14];
  __int16 v51;
  int v52;
  uint8_t buf[8];
  void *v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = qword_25576DBB0;
  v5 = MEMORY[0x24BDACB78];
  if (qword_25576DBB0 == MEMORY[0x24BDACB78])
  {
    v6 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
    v7 = (void *)qword_25576DBB0;
    qword_25576DBB0 = (uint64_t)v6;

    v4 = qword_25576DBB0;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = a3;
    _os_log_impl(&dword_222B17000, v4, OS_LOG_TYPE_DEBUG, "diagnoseNoXPCResponseReason - DTMLModelRunnerService pid: %d", buf, 8u);
  }
  v8 = qword_25576DBB0;
  if (qword_25576DBB0 == v5)
  {
    v9 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
    v10 = (void *)qword_25576DBB0;
    qword_25576DBB0 = (uint64_t)v9;

    v8 = qword_25576DBB0;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = a3;
    _os_log_impl(&dword_222B17000, v8, OS_LOG_TYPE_DEBUG, "diagnoseNoXPCResponseReason - DTMLModelRunnerService pid: %d", buf, 8u);
  }
  sleep(1u);
  *(_QWORD *)buf = 0;
  v54 = 0;
  v55 = 0;
  v11 = _launch_service_stats_copy_impl();
  v12 = qword_25576DBB0;
  if (v11)
  {
    if (qword_25576DBB0 == v5)
    {
      v13 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
      v14 = (void *)qword_25576DBB0;
      qword_25576DBB0 = (uint64_t)v13;

      v12 = qword_25576DBB0;
    }
    v15 = v12;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v49 = 67109378;
      *(_DWORD *)v50 = v11;
      *(_WORD *)&v50[4] = 2080;
      *(_QWORD *)&v50[6] = xpc_strerror();
      _os_log_impl(&dword_222B17000, v15, OS_LOG_TYPE_ERROR, "diagnoseNoXPCResponseReason - Failed to fetch launch_service_stats (%d): %s", v49, 0x12u);
    }

    v16 = 2;
  }
  else
  {
    if (qword_25576DBB0 == v5)
    {
      v17 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
      v18 = (void *)qword_25576DBB0;
      qword_25576DBB0 = (uint64_t)v17;

      v12 = qword_25576DBB0;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v49 = 67109120;
      *(_DWORD *)v50 = v55;
      _os_log_impl(&dword_222B17000, v12, OS_LOG_TYPE_DEBUG, "diagnoseNoXPCResponseReason - Returned %u records", v49, 8u);
    }
    if ((_DWORD)v55)
    {
      v19 = 0;
      v20 = 0;
      v16 = 2;
      do
      {
        v21 = (char *)v54;
        v22 = qword_25576DBB0;
        if (qword_25576DBB0 == v5)
        {
          v23 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
          v24 = (void *)qword_25576DBB0;
          qword_25576DBB0 = (uint64_t)v23;

          v22 = qword_25576DBB0;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v25 = *(_DWORD *)&v21[v19 + 20];
          *(_DWORD *)v49 = 67109376;
          *(_DWORD *)v50 = v25;
          *(_WORD *)&v50[4] = 1024;
          *(_DWORD *)&v50[6] = a3;
          _os_log_impl(&dword_222B17000, v22, OS_LOG_TYPE_DEBUG, "diagnoseNoXPCResponseReason - record: pid: %d, desired pid: %d", v49, 0xEu);
        }
        v26 = &v21[v19];
        v27 = qword_25576DBB0;
        if (*(_DWORD *)&v21[v19 + 20] == a3)
        {
          if (qword_25576DBB0 == v5)
          {
            v28 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
            v29 = (void *)qword_25576DBB0;
            qword_25576DBB0 = (uint64_t)v28;

            v27 = qword_25576DBB0;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v30 = *(_QWORD *)&v21[v19 + 29];
            v31 = v21[v19 + 28];
            v32 = *((_DWORD *)v26 + 5);
            *(_DWORD *)v49 = 134218496;
            *(_QWORD *)v50 = v30;
            *(_WORD *)&v50[8] = 1024;
            *(_DWORD *)&v50[10] = v31;
            v51 = 1024;
            v52 = v32;
            _os_log_impl(&dword_222B17000, v27, OS_LOG_TYPE_DEBUG, "diagnoseNoXPCResponseReason - Found exit code: %llu, namespace: %d, pid: %d", v49, 0x18u);
          }
          v33 = v21[v19 + 28];
          if (v33 == 2)
          {
            v41 = qword_25576DBB0;
            if (qword_25576DBB0 == v5)
            {
              v42 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
              v43 = (void *)qword_25576DBB0;
              qword_25576DBB0 = (uint64_t)v42;

              v41 = qword_25576DBB0;
            }
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              v44 = *((_DWORD *)v26 + 5);
              *(_DWORD *)v49 = 67109120;
              *(_DWORD *)v50 = v44;
              _os_log_impl(&dword_222B17000, v41, OS_LOG_TYPE_DEBUG, "diagnoseNoXPCResponseReason - Found crash (%d)", v49, 8u);
            }
            v16 = 1;
          }
          else if (v33 == 1)
          {
            v34 = qword_25576DBB0;
            if (qword_25576DBB0 == v5)
            {
              v35 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
              v36 = (void *)qword_25576DBB0;
              qword_25576DBB0 = (uint64_t)v35;

              v34 = qword_25576DBB0;
            }
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              v37 = *((_DWORD *)v26 + 5);
              *(_DWORD *)v49 = 67109120;
              *(_DWORD *)v50 = v37;
              _os_log_impl(&dword_222B17000, v34, OS_LOG_TYPE_DEBUG, "diagnoseNoXPCResponseReason - Found jetsam (%d)", v49, 8u);
            }
            v16 = 0;
          }
        }
        else
        {
          if (qword_25576DBB0 == v5)
          {
            v38 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
            v39 = (void *)qword_25576DBB0;
            qword_25576DBB0 = (uint64_t)v38;

            v27 = qword_25576DBB0;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v40 = *((_DWORD *)v26 + 5);
            *(_DWORD *)v49 = 67109120;
            *(_DWORD *)v50 = v40;
            _os_log_impl(&dword_222B17000, v27, OS_LOG_TYPE_DEBUG, "diagnoseNoXPCResponseReason - Got launch service stats for non-related pid: %d", v49, 8u);
          }
        }
        ++v20;
        v19 += 51;
      }
      while (v20 < v55);
    }
    else
    {
      v16 = 2;
    }
    if (v54)
      free(v54);
    v45 = qword_25576DBB0;
    if (qword_25576DBB0 == v5)
    {
      v46 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
      v47 = (void *)qword_25576DBB0;
      qword_25576DBB0 = (uint64_t)v46;

      v45 = qword_25576DBB0;
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_222B17000, v45, OS_LOG_TYPE_DEBUG, "diagnoseNoXPCResponseReason - Found no supported reason for no response", v49, 2u);
    }
  }

  return v16;
}

+ (void)enableMonitoring
{
  int v2;
  NSObject *v3;
  os_log_t v4;
  void *v5;
  NSObject *v6;
  os_log_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = launch_service_stats_enable();
  v3 = qword_25576DBB0;
  if (v2)
  {
    if (qword_25576DBB0 == MEMORY[0x24BDACB78])
    {
      v4 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
      v5 = (void *)qword_25576DBB0;
      qword_25576DBB0 = (uint64_t)v4;

      v3 = qword_25576DBB0;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = v3;
      v9 = 136315138;
      v10 = xpc_strerror();
      _os_log_impl(&dword_222B17000, v6, OS_LOG_TYPE_ERROR, "enableLaunchServiceMonitoring - Enabling launch_service_stats failed: %s", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    if (qword_25576DBB0 == MEMORY[0x24BDACB78])
    {
      v7 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
      v8 = (void *)qword_25576DBB0;
      qword_25576DBB0 = (uint64_t)v7;

      v3 = qword_25576DBB0;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_222B17000, v3, OS_LOG_TYPE_DEBUG, "enableLaunchServiceMonitoring - launch_service_stats enabled", (uint8_t *)&v9, 2u);
    }
  }
}

+ (void)disableMonitoring
{
  int v2;
  NSObject *v3;
  os_log_t v4;
  void *v5;
  NSObject *v6;
  os_log_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = launch_service_stats_disable();
  v3 = qword_25576DBB0;
  if (v2)
  {
    if (qword_25576DBB0 == MEMORY[0x24BDACB78])
    {
      v4 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
      v5 = (void *)qword_25576DBB0;
      qword_25576DBB0 = (uint64_t)v4;

      v3 = qword_25576DBB0;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = v3;
      v9 = 136315138;
      v10 = xpc_strerror();
      _os_log_impl(&dword_222B17000, v6, OS_LOG_TYPE_ERROR, "disableLaunchServiceMonitoring - Disabling launch_service_stats monitoring failed: %s", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    if (qword_25576DBB0 == MEMORY[0x24BDACB78])
    {
      v7 = os_log_create("com.apple.DTServiceHub", "CoreMLPerfService");
      v8 = (void *)qword_25576DBB0;
      qword_25576DBB0 = (uint64_t)v7;

      v3 = qword_25576DBB0;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_222B17000, v3, OS_LOG_TYPE_DEBUG, "disableLaunchServiceMonitoring - launch_service_stats monitoring disabled", (uint8_t *)&v9, 2u);
    }
  }
}

@end
