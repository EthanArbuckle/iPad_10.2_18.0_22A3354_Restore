uint64_t BLTPBSetNotificationsSoundRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v23;

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2173DD560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2173DDD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x219A0C15C](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

const char *BLTIDSConnectionStatusString(unint64_t a1)
{
  if (a1 > 3)
    return "unknown";
  else
    return off_24D761CD0[a1];
}

void sub_2173DF3EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void _BLTLogIDSSendFail(int a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  blt_ids_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412802;
    v9 = v6;
    v10 = 1024;
    v11 = a1;
    v12 = 2112;
    v13 = v5;
    _os_log_error_impl(&dword_2173D9000, v7, OS_LOG_TYPE_ERROR, "IDS error sending request with identifier %@ (paired device ready: %{BOOL}u): %@", (uint8_t *)&v8, 0x1Cu);
  }

}

void sub_2173E0B0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__230(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__231(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_2173E1AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2173E2E14(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  NSObject *v3;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    blt_general_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BLTObjectStore objectForKey:].cold.2();

    objc_end_catch();
    JUMPOUT(0x2173E2DC8);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id blt_bug_reporter_log()
{
  if (blt_bug_reporter_log_onceToken != -1)
    dispatch_once(&blt_bug_reporter_log_onceToken, &__block_literal_global_0);
  return (id)blt_bug_reporter_log___logger;
}

void __blt_bug_reporter_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "bug_reporter");
  v1 = (void *)blt_bug_reporter_log___logger;
  blt_bug_reporter_log___logger = (uint64_t)v0;

}

id blt_dnd_log()
{
  if (blt_dnd_log_onceToken != -1)
    dispatch_once(&blt_dnd_log_onceToken, &__block_literal_global_3);
  return (id)blt_dnd_log___logger;
}

void __blt_dnd_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "dnd");
  v1 = (void *)blt_dnd_log___logger;
  blt_dnd_log___logger = (uint64_t)v0;

}

id blt_general_log()
{
  if (blt_general_log_onceToken != -1)
    dispatch_once(&blt_general_log_onceToken, &__block_literal_global_5);
  return (id)blt_general_log___logger;
}

void __blt_general_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "general");
  v1 = (void *)blt_general_log___logger;
  blt_general_log___logger = (uint64_t)v0;

}

id blt_lights_and_sirens_log()
{
  if (blt_lights_and_sirens_log_onceToken != -1)
    dispatch_once(&blt_lights_and_sirens_log_onceToken, &__block_literal_global_7);
  return (id)blt_lights_and_sirens_log___logger;
}

void __blt_lights_and_sirens_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "lights_and_sirens");
  v1 = (void *)blt_lights_and_sirens_log___logger;
  blt_lights_and_sirens_log___logger = (uint64_t)v0;

}

id blt_send_queue_log()
{
  if (blt_send_queue_log_onceToken != -1)
    dispatch_once(&blt_send_queue_log_onceToken, &__block_literal_global_9_0);
  return (id)blt_send_queue_log___logger;
}

void __blt_send_queue_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "send_queue");
  v1 = (void *)blt_send_queue_log___logger;
  blt_send_queue_log___logger = (uint64_t)v0;

}

id blt_standalone_log()
{
  if (blt_standalone_log_onceToken != -1)
    dispatch_once(&blt_standalone_log_onceToken, &__block_literal_global_11);
  return (id)blt_standalone_log___logger;
}

void __blt_standalone_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "standalone");
  v1 = (void *)blt_standalone_log___logger;
  blt_standalone_log___logger = (uint64_t)v0;

}

id blt_ids_log()
{
  if (blt_ids_log_onceToken != -1)
    dispatch_once(&blt_ids_log_onceToken, &__block_literal_global_13);
  return (id)blt_ids_log___logger;
}

void __blt_ids_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "ids");
  v1 = (void *)blt_ids_log___logger;
  blt_ids_log___logger = (uint64_t)v0;

}

id blt_perf_log()
{
  if (blt_perf_log_onceToken != -1)
    dispatch_once(&blt_perf_log_onceToken, &__block_literal_global_15_0);
  return (id)blt_perf_log___logger;
}

void __blt_perf_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "perf");
  v1 = (void *)blt_perf_log___logger;
  blt_perf_log___logger = (uint64_t)v0;

}

id blt_settings_log()
{
  if (blt_settings_log_onceToken != -1)
    dispatch_once(&blt_settings_log_onceToken, &__block_literal_global_17);
  return (id)blt_settings_log___logger;
}

void __blt_settings_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "settings");
  v1 = (void *)blt_settings_log___logger;
  blt_settings_log___logger = (uint64_t)v0;

}

id blt_notification_size_log()
{
  if (blt_notification_size_log_onceToken != -1)
    dispatch_once(&blt_notification_size_log_onceToken, &__block_literal_global_19);
  return (id)blt_notification_size_log___logger;
}

void __blt_notification_size_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "notification_size");
  v1 = (void *)blt_notification_size_log___logger;
  blt_notification_size_log___logger = (uint64_t)v0;

}

id blt_cleanup_log()
{
  if (blt_cleanup_log_onceToken != -1)
    dispatch_once(&blt_cleanup_log_onceToken, &__block_literal_global_21);
  return (id)blt_cleanup_log___logger;
}

void __blt_cleanup_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "cleanup");
  v1 = (void *)blt_cleanup_log___logger;
  blt_cleanup_log___logger = (uint64_t)v0;

}

id blt_xpc_activity_log()
{
  if (blt_xpc_activity_log_onceToken != -1)
    dispatch_once(&blt_xpc_activity_log_onceToken, &__block_literal_global_23);
  return (id)blt_xpc_activity_log___logger;
}

void __blt_xpc_activity_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "xpc_activity");
  v1 = (void *)blt_xpc_activity_log___logger;
  blt_xpc_activity_log___logger = (uint64_t)v0;

}

id blt_global_settings_sync_log()
{
  if (blt_global_settings_sync_log_onceToken != -1)
    dispatch_once(&blt_global_settings_sync_log_onceToken, &__block_literal_global_25);
  return (id)blt_global_settings_sync_log___logger;
}

void __blt_global_settings_sync_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BulletinDistributor", "global_settings_sync");
  v1 = (void *)blt_global_settings_sync_log___logger;
  blt_global_settings_sync_log___logger = (uint64_t)v0;

}

void _BLTPerfLogCurrentThreadPriority(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  const char *label;
  _opaque_pthread_t *v5;
  thread_inspect_t v6;
  __CFString *v7;
  kern_return_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  integer_t thread_info_out[4];
  __int128 v16;
  uint64_t v17;
  mach_msg_type_number_t thread_info_outCnt;
  _BYTE v19[22];
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  blt_perf_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (!v3)
    return;
  label = dispatch_queue_get_label(0);
  v5 = pthread_self();
  v6 = pthread_mach_thread_np(v5);
  v17 = 0;
  *(_OWORD *)thread_info_out = 0u;
  v16 = 0u;
  thread_info_outCnt = 10;
  if (!thread_info(v6, 3u, thread_info_out, &thread_info_outCnt))
  {
    if ((DWORD1(v16) - 1) > 1)
    {
      v7 = CFSTR("Unknown thread policy");
      goto LABEL_18;
    }
    if (DWORD1(v16) == 1)
    {
      memset(v19, 0, 20);
      thread_info_outCnt = 5;
      v8 = thread_info(v6, 0xAu, (thread_info_t)v19, &thread_info_outCnt);
      v9 = *(unsigned int *)&v19[4];
      v10 = *(unsigned int *)&v19[8];
    }
    else
    {
      if (DWORD1(v16) != 2)
      {
        v10 = 0;
        v9 = 0;
        v11 = "timeshare";
        goto LABEL_16;
      }
      memset(v19, 0, 20);
      thread_info_outCnt = 5;
      v8 = thread_info(v6, 0xBu, (thread_info_t)v19, &thread_info_outCnt);
      v9 = *(unsigned int *)&v19[4];
      v10 = *(unsigned int *)&v19[4];
    }
    if (DWORD1(v16) == 2)
      v11 = "fixed";
    else
      v11 = "timeshare";
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to get thread priority %s info"), v11, v13, v14);
LABEL_17:
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("thread priority %s base: %d current: %d"), v11, v9, v10);
    goto LABEL_17;
  }
  v7 = CFSTR("Unable to get thread info");
LABEL_18:
  blt_perf_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v19 = 136315650;
    *(_QWORD *)&v19[4] = a1;
    *(_WORD *)&v19[12] = 2080;
    *(_QWORD *)&v19[14] = label;
    v20 = 2112;
    v21 = v7;
    _os_log_debug_impl(&dword_2173D9000, v12, OS_LOG_TYPE_DEBUG, "Function: %s Queue: %s %@", v19, 0x20u);
  }

}

_DWORD *BLTStateDataWithTitleAndDescription(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  size_t v6;
  _DWORD *v7;
  uint64_t v9;

  v3 = a1;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a2, 200, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "length");
    v7 = malloc_type_calloc(1uLL, v6 + 200, 0x992B924AuLL);
    *v7 = 1;
    v7[1] = v6;
    objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    __strlcpy_chk();
    memcpy(v7 + 50, (const void *)objc_msgSend(objc_retainAutorelease(v5), "bytes"), v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t BLTPBRemoveSectionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL BLTPBRemoveBulletinRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 24;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBBulletinReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  BLTPBAction *v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char v104;
  char v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  uint64_t v112;
  unint64_t v113;
  char v114;
  unsigned int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  char v120;
  char v121;
  unsigned int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char v127;
  char v128;
  unsigned int v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  char v134;
  uint64_t result;
  char v136;
  unsigned int v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  char v141;
  char v142;
  unsigned int v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  char v148;
  void *v149;
  uint64_t v150;
  BOOL v151;
  uint64_t v152;
  uint64_t v153;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 112;
        goto LABEL_209;
      case 2u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 288;
        goto LABEL_209;
      case 3u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 280;
        goto LABEL_209;
      case 4u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 400;
        goto LABEL_209;
      case 5u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 352;
        goto LABEL_209;
      case 6u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 240;
        goto LABEL_209;
      case 7u:
        *(_DWORD *)(a1 + 428) |= 1u;
        v20 = *v3;
        v21 = *(_QWORD *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        v153 = 8;
        goto LABEL_290;
      case 8u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 72;
        goto LABEL_209;
      case 9u:
        v23 = objc_alloc_init(BLTPBAction);
        objc_msgSend((id)a1, "addSupplementaryActions:", v23);
        goto LABEL_194;
      case 0xAu:
        v24 = 0;
        v25 = 0;
        v26 = 0;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v29;
            v26 |= (unint64_t)(v30 & 0x7F) << v24;
            if (v30 < 0)
            {
              v24 += 7;
              v15 = v25++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_213;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_213:
        v150 = 192;
        goto LABEL_274;
      case 0xBu:
        v23 = objc_alloc_init(BLTPBAction);
        v31 = 304;
        goto LABEL_193;
      case 0xCu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 264;
        goto LABEL_209;
      case 0xDu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 256;
        goto LABEL_209;
      case 0xEu:
        v23 = objc_alloc_init(BLTPBAction);
        v31 = 168;
        goto LABEL_193;
      case 0xFu:
        v32 = 0;
        v33 = 0;
        v26 = 0;
        *(_DWORD *)(a1 + 428) |= 0x80u;
        while (2)
        {
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          v36 = v35 + 1;
          if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v36;
            v26 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              v15 = v33++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_217;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_217:
        v150 = 296;
        goto LABEL_274;
      case 0x10u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 312;
        goto LABEL_209;
      case 0x11u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 120;
        goto LABEL_209;
      case 0x12u:
        *(_DWORD *)(a1 + 428) |= 2u;
        v38 = *v3;
        v39 = *(_QWORD *)(a2 + v38);
        if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v39);
          *(_QWORD *)(a2 + v38) = v39 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        v153 = 16;
        goto LABEL_290;
      case 0x13u:
        v40 = 0;
        v41 = 0;
        v42 = 0;
        while (2)
        {
          v43 = *v3;
          v44 = *(_QWORD *)(a2 + v43);
          v45 = v44 + 1;
          if (v44 == -1 || v45 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
            *(_QWORD *)(a2 + v43) = v45;
            v42 |= (unint64_t)(v46 & 0x7F) << v40;
            if (v46 < 0)
            {
              v40 += 7;
              v15 = v41++ >= 9;
              if (v15)
              {
                v42 = 0;
                goto LABEL_221;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v42 = 0;
LABEL_221:
        v151 = v42 != 0;
        v152 = 421;
        goto LABEL_279;
      case 0x14u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 376;
        goto LABEL_209;
      case 0x15u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 152;
        goto LABEL_209;
      case 0x16u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 408;
        goto LABEL_209;
      case 0x17u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 56;
        goto LABEL_209;
      case 0x18u:
        v47 = 0;
        v48 = 0;
        v26 = 0;
        *(_DWORD *)(a1 + 428) |= 0x100u;
        while (2)
        {
          v49 = *v3;
          v50 = *(_QWORD *)(a2 + v49);
          v51 = v50 + 1;
          if (v50 == -1 || v51 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v50);
            *(_QWORD *)(a2 + v49) = v51;
            v26 |= (unint64_t)(v52 & 0x7F) << v47;
            if (v52 < 0)
            {
              v47 += 7;
              v15 = v48++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_225;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_225:
        v150 = 328;
        goto LABEL_274;
      case 0x19u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 320;
        goto LABEL_209;
      case 0x1Au:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 336;
        goto LABEL_209;
      case 0x1Bu:
        v53 = 0;
        v54 = 0;
        v26 = 0;
        *(_DWORD *)(a1 + 428) |= 0x20u;
        while (2)
        {
          v55 = *v3;
          v56 = *(_QWORD *)(a2 + v55);
          v57 = v56 + 1;
          if (v56 == -1 || v57 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v56);
            *(_QWORD *)(a2 + v55) = v57;
            v26 |= (unint64_t)(v58 & 0x7F) << v53;
            if (v58 < 0)
            {
              v53 += 7;
              v15 = v54++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_229;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_229:
        v150 = 88;
        goto LABEL_274;
      case 0x1Cu:
        v59 = 0;
        v60 = 0;
        v61 = 0;
        *(_DWORD *)(a1 + 428) |= 0x400u;
        while (2)
        {
          v62 = *v3;
          v63 = *(_QWORD *)(a2 + v62);
          v64 = v63 + 1;
          if (v63 == -1 || v64 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v65 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v63);
            *(_QWORD *)(a2 + v62) = v64;
            v61 |= (unint64_t)(v65 & 0x7F) << v59;
            if (v65 < 0)
            {
              v59 += 7;
              v15 = v60++ >= 9;
              if (v15)
              {
                v61 = 0;
                goto LABEL_233;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v61 = 0;
LABEL_233:
        v151 = v61 != 0;
        v152 = 417;
        goto LABEL_279;
      case 0x1Du:
        v66 = 0;
        v67 = 0;
        v68 = 0;
        *(_DWORD *)(a1 + 428) |= 0x4000u;
        while (2)
        {
          v69 = *v3;
          v70 = *(_QWORD *)(a2 + v69);
          v71 = v70 + 1;
          if (v70 == -1 || v71 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v72 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v70);
            *(_QWORD *)(a2 + v69) = v71;
            v68 |= (unint64_t)(v72 & 0x7F) << v66;
            if (v72 < 0)
            {
              v66 += 7;
              v15 = v67++ >= 9;
              if (v15)
              {
                v68 = 0;
                goto LABEL_237;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v68 = 0;
LABEL_237:
        v151 = v68 != 0;
        v152 = 422;
        goto LABEL_279;
      case 0x1Eu:
        v73 = 0;
        v74 = 0;
        v75 = 0;
        *(_DWORD *)(a1 + 428) |= 0x80000u;
        while (2)
        {
          v76 = *v3;
          v77 = *(_QWORD *)(a2 + v76);
          v78 = v77 + 1;
          if (v77 == -1 || v78 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v79 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v77);
            *(_QWORD *)(a2 + v76) = v78;
            v75 |= (unint64_t)(v79 & 0x7F) << v73;
            if (v79 < 0)
            {
              v73 += 7;
              v15 = v74++ >= 9;
              if (v15)
              {
                v75 = 0;
                goto LABEL_241;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v75 = 0;
LABEL_241:
        v151 = v75 != 0;
        v152 = 427;
        goto LABEL_279;
      case 0x1Fu:
        PBReaderReadString();
        v23 = (BLTPBAction *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend((id)a1, "addSubsectionIDs:", v23);
        goto LABEL_197;
      case 0x20u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 176;
        goto LABEL_209;
      case 0x21u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 96;
        goto LABEL_209;
      case 0x22u:
        PBReaderReadString();
        v23 = (BLTPBAction *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend((id)a1, "addPeopleIDs:", v23);
        goto LABEL_197;
      case 0x23u:
        v80 = 0;
        v81 = 0;
        v82 = 0;
        *(_DWORD *)(a1 + 428) |= 0x2000u;
        while (2)
        {
          v83 = *v3;
          v84 = *(_QWORD *)(a2 + v83);
          v85 = v84 + 1;
          if (v84 == -1 || v85 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v86 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v84);
            *(_QWORD *)(a2 + v83) = v85;
            v82 |= (unint64_t)(v86 & 0x7F) << v80;
            if (v86 < 0)
            {
              v80 += 7;
              v15 = v81++ >= 9;
              if (v15)
              {
                v82 = 0;
                goto LABEL_245;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v82 = 0;
LABEL_245:
        v151 = v82 != 0;
        v152 = 420;
        goto LABEL_279;
      case 0x24u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 128;
        goto LABEL_209;
      case 0x25u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 160;
        goto LABEL_209;
      case 0x26u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 64;
        goto LABEL_209;
      case 0x27u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 384;
        goto LABEL_209;
      case 0x28u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 80;
        goto LABEL_209;
      case 0x29u:
        v23 = objc_alloc_init(BLTPBBulletinAttachment);
        objc_msgSend((id)a1, "addAdditionalAttachments:", v23);
        if (!PBReaderPlaceMark() || (BLTPBBulletinAttachmentReadFrom((uint64_t)v23, a2) & 1) == 0)
          goto LABEL_293;
        goto LABEL_196;
      case 0x2Au:
        *(_DWORD *)(a1 + 428) |= 4u;
        v87 = *v3;
        v88 = *(_QWORD *)(a2 + v87);
        if (v88 <= 0xFFFFFFFFFFFFFFF7 && v88 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v88);
          *(_QWORD *)(a2 + v87) = v88 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        v153 = 24;
        goto LABEL_290;
      case 0x2Bu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 272;
        goto LABEL_209;
      case 0x2Cu:
        *(_DWORD *)(a1 + 428) |= 0x10u;
        v89 = *v3;
        v90 = *(_QWORD *)(a2 + v89);
        if (v90 <= 0xFFFFFFFFFFFFFFF7 && v90 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v90);
          *(_QWORD *)(a2 + v89) = v90 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        v153 = 40;
        goto LABEL_290;
      case 0x2Du:
        v91 = 0;
        v92 = 0;
        v93 = 0;
        *(_DWORD *)(a1 + 428) |= 0x20000u;
        while (2)
        {
          v94 = *v3;
          v95 = *(_QWORD *)(a2 + v94);
          v96 = v95 + 1;
          if (v95 == -1 || v96 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v97 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v95);
            *(_QWORD *)(a2 + v94) = v96;
            v93 |= (unint64_t)(v97 & 0x7F) << v91;
            if (v97 < 0)
            {
              v91 += 7;
              v15 = v92++ >= 9;
              if (v15)
              {
                v93 = 0;
                goto LABEL_249;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v93 = 0;
LABEL_249:
        v151 = v93 != 0;
        v152 = 425;
        goto LABEL_279;
      case 0x2Eu:
        v98 = 0;
        v99 = 0;
        v100 = 0;
        *(_DWORD *)(a1 + 428) |= 0x10000u;
        while (2)
        {
          v101 = *v3;
          v102 = *(_QWORD *)(a2 + v101);
          v103 = v102 + 1;
          if (v102 == -1 || v103 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v104 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v102);
            *(_QWORD *)(a2 + v101) = v103;
            v100 |= (unint64_t)(v104 & 0x7F) << v98;
            if (v104 < 0)
            {
              v98 += 7;
              v15 = v99++ >= 9;
              if (v15)
              {
                v100 = 0;
                goto LABEL_253;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v100 = 0;
LABEL_253:
        v151 = v100 != 0;
        v152 = 424;
        goto LABEL_279;
      case 0x2Fu:
        v105 = 0;
        v106 = 0;
        v107 = 0;
        *(_DWORD *)(a1 + 428) |= 0x800u;
        while (2)
        {
          v108 = *v3;
          v109 = *(_QWORD *)(a2 + v108);
          v110 = v109 + 1;
          if (v109 == -1 || v110 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v111 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v109);
            *(_QWORD *)(a2 + v108) = v110;
            v107 |= (unint64_t)(v111 & 0x7F) << v105;
            if (v111 < 0)
            {
              v105 += 7;
              v15 = v106++ >= 9;
              if (v15)
              {
                v107 = 0;
                goto LABEL_257;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v107 = 0;
LABEL_257:
        v151 = v107 != 0;
        v152 = 418;
        goto LABEL_279;
      case 0x30u:
        *(_DWORD *)(a1 + 428) |= 8u;
        v112 = *v3;
        v113 = *(_QWORD *)(a2 + v112);
        if (v113 <= 0xFFFFFFFFFFFFFFF7 && v113 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v113);
          *(_QWORD *)(a2 + v112) = v113 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        v153 = 32;
LABEL_290:
        *(_QWORD *)(a1 + v153) = v22;
        goto LABEL_291;
      case 0x31u:
        v114 = 0;
        v115 = 0;
        v116 = 0;
        *(_DWORD *)(a1 + 428) |= 0x8000u;
        while (2)
        {
          v117 = *v3;
          v118 = *(_QWORD *)(a2 + v117);
          v119 = v118 + 1;
          if (v118 == -1 || v119 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v120 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v118);
            *(_QWORD *)(a2 + v117) = v119;
            v116 |= (unint64_t)(v120 & 0x7F) << v114;
            if (v120 < 0)
            {
              v114 += 7;
              v15 = v115++ >= 9;
              if (v15)
              {
                v116 = 0;
                goto LABEL_261;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v116 = 0;
LABEL_261:
        v151 = v116 != 0;
        v152 = 423;
        goto LABEL_279;
      case 0x32u:
        v121 = 0;
        v122 = 0;
        v123 = 0;
        *(_DWORD *)(a1 + 428) |= 0x40000u;
        while (2)
        {
          v124 = *v3;
          v125 = *(_QWORD *)(a2 + v124);
          v126 = v125 + 1;
          if (v125 == -1 || v126 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v127 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v125);
            *(_QWORD *)(a2 + v124) = v126;
            v123 |= (unint64_t)(v127 & 0x7F) << v121;
            if (v127 < 0)
            {
              v121 += 7;
              v15 = v122++ >= 9;
              if (v15)
              {
                v123 = 0;
                goto LABEL_265;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v123 = 0;
LABEL_265:
        v151 = v123 != 0;
        v152 = 426;
        goto LABEL_279;
      case 0x33u:
        v23 = objc_alloc_init(BLTPBSectionIcon);
        objc_storeStrong((id *)(a1 + 224), v23);
        if (!PBReaderPlaceMark() || (BLTPBSectionIconReadFrom(v23, a2) & 1) == 0)
          goto LABEL_293;
        goto LABEL_196;
      case 0x34u:
        v128 = 0;
        v129 = 0;
        v130 = 0;
        *(_DWORD *)(a1 + 428) |= 0x200u;
        while (2)
        {
          v131 = *v3;
          v132 = *(_QWORD *)(a2 + v131);
          v133 = v132 + 1;
          if (v132 == -1 || v133 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v134 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v132);
            *(_QWORD *)(a2 + v131) = v133;
            v130 |= (unint64_t)(v134 & 0x7F) << v128;
            if (v134 < 0)
            {
              v128 += 7;
              v15 = v129++ >= 9;
              if (v15)
              {
                v130 = 0;
                goto LABEL_269;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v130 = 0;
LABEL_269:
        v151 = v130 != 0;
        v152 = 416;
        goto LABEL_279;
      case 0x35u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 216;
        goto LABEL_209;
      case 0x38u:
        v136 = 0;
        v137 = 0;
        v26 = 0;
        *(_DWORD *)(a1 + 428) |= 0x40u;
        while (2)
        {
          v138 = *v3;
          v139 = *(_QWORD *)(a2 + v138);
          v140 = v139 + 1;
          if (v139 == -1 || v140 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v141 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v139);
            *(_QWORD *)(a2 + v138) = v140;
            v26 |= (unint64_t)(v141 & 0x7F) << v136;
            if (v141 < 0)
            {
              v136 += 7;
              v15 = v137++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_273;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_273:
        v150 = 232;
LABEL_274:
        *(_DWORD *)(a1 + v150) = v26;
        goto LABEL_291;
      case 0x3Au:
        v23 = objc_alloc_init(BLTPBCommunicationContext);
        objc_storeStrong((id *)(a1 + 136), v23);
        if (!PBReaderPlaceMark() || (BLTPBCommunicationContextReadFrom((uint64_t)v23, a2) & 1) == 0)
          goto LABEL_293;
        goto LABEL_196;
      case 0x3Bu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 144;
        goto LABEL_209;
      case 0x3Cu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 200;
        goto LABEL_209;
      case 0x3Du:
        v23 = objc_alloc_init(BLTPBAction);
        v31 = 208;
LABEL_193:
        objc_storeStrong((id *)(a1 + v31), v23);
LABEL_194:
        if (PBReaderPlaceMark() && (BLTPBActionReadFrom((uint64_t)v23, a2) & 1) != 0)
        {
LABEL_196:
          PBReaderRecallMark();
LABEL_197:

LABEL_291:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_293:

        return 0;
      case 0x3Eu:
        v142 = 0;
        v143 = 0;
        v144 = 0;
        *(_DWORD *)(a1 + 428) |= 0x1000u;
        while (2)
        {
          v145 = *v3;
          v146 = *(_QWORD *)(a2 + v145);
          v147 = v146 + 1;
          if (v146 == -1 || v147 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v148 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v146);
            *(_QWORD *)(a2 + v145) = v147;
            v144 |= (unint64_t)(v148 & 0x7F) << v142;
            if (v148 < 0)
            {
              v142 += 7;
              v15 = v143++ >= 9;
              if (v15)
              {
                v144 = 0;
                goto LABEL_278;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v144 = 0;
LABEL_278:
        v151 = v144 != 0;
        v152 = 419;
LABEL_279:
        *(_BYTE *)(a1 + v152) = v151;
        goto LABEL_291;
      case 0x3Fu:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 360;
        goto LABEL_209;
      case 0x40u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 392;
        goto LABEL_209;
      case 0x41u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 104;
        goto LABEL_209;
      case 0x42u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 184;
LABEL_209:
        v149 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_291;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_291;
    }
  }
}

uint64_t BLTPBSetSectionSubtypeParametersIconRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  BLTPBSectionIcon *v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v17;

        goto LABEL_47;
      case 2u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 36) |= 1u;
        while (2)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              v14 = v21++ >= 9;
              if (v14)
              {
                v22 = 0;
                goto LABEL_42;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_42:
        *(_QWORD *)(a1 + 8) = v22;
        goto LABEL_47;
      case 3u:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 36) |= 2u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 1;
            v28 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              v14 = v27++ >= 9;
              if (v14)
              {
                v28 = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_46:
        *(_BYTE *)(a1 + 32) = v28 != 0;
        goto LABEL_47;
      case 4u:
        v32 = objc_alloc_init(BLTPBSectionIcon);
        objc_storeStrong((id *)(a1 + 16), v32);
        if (PBReaderPlaceMark() && (BLTPBSectionIconReadFrom(v32, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_47:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_47;
    }
  }
}

uint64_t BLTPBSetNotificationsCriticalAlertRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v23;

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBAckInitialSequenceNumberRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_43;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_45:
        *(_DWORD *)(a1 + 16) = v26;
      }
      else if ((_DWORD)v17 == 2)
      {
        PBReaderReadData();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v30;

      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 24) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_39;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_41:
        *(_BYTE *)(a1 + 20) = v20 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL BLTPBDateComponentsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  int *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((unsigned __int16)(v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 24) |= 4u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___BLTPBDateComponents__second;
              goto LABEL_53;
            }
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              break;
            v17 += 7;
            v23 = v18++ > 8;
            if (v23)
            {
              LODWORD(v19) = 0;
              v24 = &OBJC_IVAR___BLTPBDateComponents__second;
              goto LABEL_56;
            }
          }
          v24 = &OBJC_IVAR___BLTPBDateComponents__second;
          goto LABEL_54;
        case 2u:
          v25 = 0;
          v26 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 24) |= 1u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___BLTPBDateComponents__hour;
              goto LABEL_53;
            }
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              v23 = v26++ > 8;
              if (v23)
              {
                LODWORD(v19) = 0;
                v24 = &OBJC_IVAR___BLTPBDateComponents__hour;
                goto LABEL_56;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___BLTPBDateComponents__hour;
          goto LABEL_54;
        case 3u:
          v30 = 0;
          v31 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 24) |= 2u;
          while (2)
          {
            v32 = *v3;
            v33 = *(_QWORD *)(a2 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___BLTPBDateComponents__minute;
              goto LABEL_53;
            }
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              v23 = v31++ > 8;
              if (v23)
              {
                LODWORD(v19) = 0;
                v24 = &OBJC_IVAR___BLTPBDateComponents__minute;
                goto LABEL_56;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___BLTPBDateComponents__minute;
          goto LABEL_54;
        case 4u:
          v35 = 0;
          v36 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 24) |= 8u;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            continue;
          return 0;
      }
      while (1)
      {
        v37 = *v3;
        v38 = *(_QWORD *)(a2 + v37);
        if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
          break;
        v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
        *(_QWORD *)(a2 + v37) = v38 + 1;
        v19 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0)
        {
          v24 = &OBJC_IVAR___BLTPBDateComponents__weekday;
          goto LABEL_54;
        }
        v35 += 7;
        v23 = v36++ > 8;
        if (v23)
        {
          LODWORD(v19) = 0;
          v24 = &OBJC_IVAR___BLTPBDateComponents__weekday;
          goto LABEL_56;
        }
      }
      v24 = &OBJC_IVAR___BLTPBDateComponents__weekday;
LABEL_53:
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_54:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_56:
      *(_DWORD *)(a1 + *v24) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void ApplicationsChanged(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD block[5];

  BLTWorkQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __ApplicationsChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(v3, block);

}

uint64_t BLTBBSectionInfoEnabled(void *a1)
{
  id v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;

  v1 = a1;
  if (objc_msgSend(v1, "alertType"))
    LOBYTE(v2) = 1;
  else
    v2 = ((unint64_t)objc_msgSend(v1, "suppressedSettings") >> 5) & 1;
  if (objc_msgSend(v1, "lockScreenSetting") == 2)
    LODWORD(v3) = 1;
  else
    v3 = ((unint64_t)objc_msgSend(v1, "suppressedSettings") >> 1) & 1;
  v4 = objc_msgSend(v1, "spokenNotificationSetting");
  v5 = objc_msgSend(v1, "allowsNotifications");
  if (v4 == 2)
    v6 = 1;
  else
    v6 = v3;
  if (((v5 ^ 1 | v2) & 1) != 0)
    v7 = v5;
  else
    v7 = v6;

  return v7;
}

uint64_t BLTIsAggdLogEnabled()
{
  if (BLTIsAggdLogEnabled_onceToken != -1)
    dispatch_once(&BLTIsAggdLogEnabled_onceToken, &__block_literal_global_1);
  return BLTIsAggdLogEnabled___BLTAggdLogEnabled;
}

void BLTAnalyticsLogBulletinSize(void *a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("sectionID");
  v10[1] = CFSTR("publisherMatchID");
  v11[0] = a1;
  v11[1] = a3;
  v10[2] = CFSTR("bulletinSize");
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  v7 = a1;
  objc_msgSend(v5, "numberWithUnsignedLong:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

void BLTAnalyticsLogCompanionToGizmoDelay(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v20[0] = CFSTR("sectionID");
  v20[1] = CFSTR("publisherMatchID");
  v21[0] = a1;
  v21[1] = a2;
  v20[2] = CFSTR("delay");
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = a3;
  v11 = a2;
  v12 = a1;
  objc_msgSend(a4, "timeIntervalSince1970");
  v14 = v13;
  objc_msgSend(v10, "timeIntervalSince1970");
  v16 = v15;

  objc_msgSend(v9, "numberWithDouble:", v14 - v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  v20[3] = CFSTR("connectionStatus");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

void BLTAnalyticsLogOutOfOrderMessage()
{
  if (BLTIsAggdLogEnabled_onceToken != -1)
    dispatch_once(&BLTIsAggdLogEnabled_onceToken, &__block_literal_global_1);
  if (BLTIsAggdLogEnabled___BLTAggdLogEnabled)
    AnalyticsSendEvent();
}

void BLTAnalyticsLogMirroredNotificationsOverrides(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE0FD18];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "BOOLValue");
  v14[0] = v5;
  v13[0] = CFSTR("sectionID");
  v13[1] = CFSTR("showAlerts");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  v13[2] = CFSTR("sendToNotificationCenter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

BOOL BLTPBHandleAcknowledgeActionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  BLTPBActionInformation *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_24;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_24;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
LABEL_24:
        v19 = *(BLTPBActionInformation **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;
        goto LABEL_28;
      case 4u:
        v19 = objc_alloc_init(BLTPBActionInformation);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && BLTPBActionInformationReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_29;
    }
  }
}

void WristDetectSettingChanged(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  BLTWorkQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __WristDetectSettingChanged_block_invoke;
  block[3] = &unk_24D761AD0;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

uint64_t BLTPBIntelligentSummaryBulletinRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  BLTPBBulletin *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 28) |= 2u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          v25 = v24 + 1;
          if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
            break;
          v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v25;
          v22 |= (unint64_t)(v26 & 0x7F) << v20;
          if ((v26 & 0x80) == 0)
            goto LABEL_37;
          v20 += 7;
          v15 = v21++ >= 9;
          if (v15)
          {
            LODWORD(v22) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 24) = v22;
      }
      else if ((_DWORD)v18 == 2)
      {
        *(_BYTE *)(a1 + 28) |= 1u;
        v27 = *v3;
        v28 = *(_QWORD *)(a2 + v27);
        if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v29 = 0;
        }
        *(_QWORD *)(a1 + 8) = v29;
      }
      else if ((_DWORD)v18 == 1)
      {
        v19 = objc_alloc_init(BLTPBBulletin);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (!PBReaderPlaceMark() || (BLTPBBulletinReadFrom((uint64_t)v19, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL BLTPBBulletinSummaryKeyReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 24;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBUpdateBulletinListRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  BLTPBFullBulletinList *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(BLTPBFullBulletinList);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (BLTPBFullBulletinListReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBBulletinSummaryReadFrom(_DWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  BLTPBBulletinSummaryKey *v27;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 6;
        goto LABEL_24;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
        goto LABEL_24;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 10;
LABEL_24:
        v20 = *(void **)&a1[v18];
        *(_QWORD *)&a1[v18] = v17;

        goto LABEL_39;
      case 4u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_38:
        a1[2] = v23;
        goto LABEL_39;
      case 5u:
        v27 = objc_alloc_init(BLTPBBulletinSummaryKey);
        objc_msgSend(a1, "addKey:", v27);
        if (PBReaderPlaceMark() && BLTPBBulletinSummaryKeyReadFrom((uint64_t)v27, a2))
        {
          PBReaderRecallMark();

LABEL_39:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_39;
    }
  }
}

uint64_t BLTPBBulletinAttachmentReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_30;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_41:
          *(_DWORD *)(a1 + 16) = v22;
          continue;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_30:
          v26 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 4u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          break;
        v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
        *(_QWORD *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0)
          goto LABEL_43;
        v27 += 7;
        v14 = v28++ >= 9;
        if (v14)
        {
          v29 = 0;
          goto LABEL_45;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
      if (*(_BYTE *)(a2 + *v5))
        v29 = 0;
LABEL_45:
      *(_BYTE *)(a1 + 32) = v29 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2173F7444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2173F8658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _dictionaryFromPBData(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  v3 = a1;
  v4 = a2;
  if (!v3)
    goto LABEL_4;
  v9 = 0;
  +[BLTObjectSerializer unserializeObject:nulls:error:](BLTObjectSerializer, "unserializeObject:nulls:error:", v3, v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
  {
    v7 = v6;

LABEL_4:
    v5 = 0;
  }

  return v5;
}

uint64_t BLTPBSetRemoteGlobalSettingsRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v26 = 0;
        v27 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 32) |= 2u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          v30 = v29 + 1;
          if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
            break;
          v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v30;
          v21 |= (unint64_t)(v31 & 0x7F) << v26;
          if ((v31 & 0x80) == 0)
            goto LABEL_45;
          v26 += 7;
          v15 = v27++ >= 9;
          if (v15)
          {
            v21 = 0;
            goto LABEL_47;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_47:
        v36 = 16;
      }
      else
      {
        if ((_DWORD)v18 == 2)
        {
          *(_BYTE *)(a1 + 32) |= 4u;
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v34 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v34 = 0;
          }
          *(_QWORD *)(a1 + 24) = v34;
          continue;
        }
        if ((_DWORD)v18 != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
        }
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          v24 = v23 + 1;
          if (v23 == -1 || v24 > *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0)
            goto LABEL_41;
          v19 += 7;
          v15 = v20++ >= 9;
          if (v15)
          {
            v21 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_43:
        v36 = 8;
      }
      *(_QWORD *)(a1 + v36) = v21;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBSectionInfoSettingsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  BLTPBMuteAssertion *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 36) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_53;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_55;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_55:
        v41 = 8;
        goto LABEL_68;
      case 2u:
        v24 = objc_alloc_init(BLTPBMuteAssertion);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (PBReaderPlaceMark() && (BLTPBMuteAssertionReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_69:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        v25 = 0;
        v26 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 36) |= 4u;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              v14 = v26++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_59;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_59:
        v41 = 28;
        goto LABEL_68;
      case 4u:
        v30 = 0;
        v31 = 0;
        v32 = 0;
        *(_BYTE *)(a1 + 36) |= 8u;
        while (2)
        {
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 1;
            v32 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              v14 = v31++ >= 9;
              if (v14)
              {
                v32 = 0;
                goto LABEL_63;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v32 = 0;
LABEL_63:
        *(_BYTE *)(a1 + 32) = v32 != 0;
        goto LABEL_69;
      case 5u:
        v36 = 0;
        v37 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 36) |= 2u;
        while (2)
        {
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 1;
            v19 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              v14 = v37++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_67:
        v41 = 24;
LABEL_68:
        *(_DWORD *)(a1 + v41) = v19;
        goto LABEL_69;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_69;
    }
  }
}

void sub_2173FBD94(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 104));
  _Unwind_Resume(a1);
}

void sub_2173FC68C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t BLTPBAddBulletinSummaryRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  BLTPBBulletinSummary *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(BLTPBBulletinSummary);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (BLTPBBulletinSummaryReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void _writeDataToFile(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;

  v3 = a2;
  v4 = a1;
  v6 = objc_msgSend(v4, "length");
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v6, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeData:", v5);
  objc_msgSend(v3, "writeData:", v4);

}

id _readDataFromFile(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;

  v1 = a1;
  v11 = 0;
  objc_msgSend(v1, "readDataUpToLength:error:", 4, &v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v11;
  if (v3)
  {
    v4 = v3;
    blt_send_queue_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      _readDataFromFile_cold_1();
  }
  else
  {
    if (!v2 || !objc_msgSend(v2, "length"))
      goto LABEL_5;
    v7 = *(unsigned int *)objc_msgSend(objc_retainAutorelease(v2), "bytes");
    v10 = 0;
    objc_msgSend(v1, "readDataUpToLength:error:", v7, &v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (!v8)
      goto LABEL_6;
    v5 = v8;
    blt_send_queue_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      _readDataFromFile_cold_1();

  }
LABEL_5:
  v4 = 0;
LABEL_6:

  return v4;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

BOOL BLTPBSetSectionInfoResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  v6 = (int *)MEMORY[0x24BE7AF30];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

id BLTFileURLInAttachmentsPath(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "blt_uniqueKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "keyString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("attachments"), "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathExtension:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BLTFileURLInPairingPath(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id BLTBulletinAttachmentsURL(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "blt_uniqueKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "keyString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("attachments"), "stringByAppendingPathComponent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BLTFileURLInPairingPath(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void BLTCleanAttachmentsPath()
{
  void *v0;
  void *v1;
  char v2;
  id v3;
  NSObject *v4;
  id v5;

  BLTFileURLInPairingPath(CFSTR("attachments"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v2 = objc_msgSend(v1, "removeItemAtURL:error:", v0, &v5);
    v3 = v5;

    if ((v2 & 1) == 0)
    {
      blt_general_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        BLTCleanAttachmentsPath_cold_1((uint64_t)v0, v4);

    }
  }

}

id BLTTranscodedFileURLForBulletin(void *a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;

  BLTFileURLInAttachmentsPath(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
    v6 = v2;
  else
    v6 = 0;

  return v6;
}

void sub_2174012C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void BBSectionsChanged(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD block[5];

  BLTWorkQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __BBSectionsChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(v3, block);

}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id BLTSyncSupportedBundleIDsFromProxies(void *a1, id *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v23;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x24BDD9BE0], "appInfoWithAppProxy:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "supportedActions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count")
          || (objc_msgSend(v8, "plugInKitPlugins"),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              INSupportedIntentsByExtensions(),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v12, "count"),
              v12,
              v11,
              v13))
        {
          objc_msgSend(v8, "localizedName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (!v14)
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v2 = objc_claimAutoreleasedReturnValue();
            v15 = (void *)v2;
          }
          objc_msgSend(v8, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v15, v16);

          v17 = (void *)v2;
          if (!v14)
            goto LABEL_11;
        }
        else
        {
          objc_msgSend(v8, "correspondingApplicationRecord");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "supportsLiveActivities"))
          {
            objc_msgSend(v8, "localizedName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (uint64_t)v17;
            if (!v17)
            {
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v18 = objc_claimAutoreleasedReturnValue();
              v23 = (void *)v18;
            }
            objc_msgSend(v8, "bundleIdentifier", v23);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v18, v19);

            if (!v17)
LABEL_11:

            goto LABEL_12;
          }
          if (a2)
          {
            v20 = *a2;
            if (!*a2)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v20 = (id)objc_claimAutoreleasedReturnValue();
              *a2 = v20;
            }
            objc_msgSend(v8, "bundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v17);
            goto LABEL_11;
          }
        }
LABEL_12:

        ++v7;
      }
      while (v5 != v7);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v5 = v21;
    }
    while (v21);
  }

  return v26;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t BLTPBSectionIconVariantReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_39;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_41;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_41:
          *(_DWORD *)(a1 + 8) = v19;
          continue;
        case 2u:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 16;
          goto LABEL_37;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          break;
        case 4u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 24;
LABEL_37:
          v32 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v29 = *v3;
        v30 = *(_QWORD *)(a2 + v29);
        if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          break;
        v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
        *(_QWORD *)(a2 + v29) = v30 + 1;
        v28 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0)
          goto LABEL_43;
        v26 += 7;
        v14 = v27++ >= 9;
        if (v14)
        {
          v28 = 0;
          goto LABEL_45;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
      if (*(_BYTE *)(a2 + *v5))
        v28 = 0;
LABEL_45:
      *(_BYTE *)(a1 + 32) = v28 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBAppearanceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  BLTPBImage *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_35;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            v22 = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_37:
        *(_BYTE *)(a1 + 24) = v22 != 0;
      }
      else if ((_DWORD)v17 == 2)
      {
        v26 = objc_alloc_init(BLTPBImage);
        objc_storeStrong((id *)(a1 + 8), v26);
        if (!PBReaderPlaceMark() || (BLTPBImageReadFrom((uint64_t)v26, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v18;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBCommunicationContextReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  BLTPBContact *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  void *v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 48;
        goto LABEL_60;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_60;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
        goto LABEL_60;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
        goto LABEL_60;
      case 5u:
        v20 = objc_alloc_init(BLTPBContact);
        objc_storeStrong((id *)(a1 + 80), v20);
        goto LABEL_27;
      case 6u:
        v20 = objc_alloc_init(BLTPBContact);
        objc_msgSend((id)a1, "addRecipients:", v20);
LABEL_27:
        if (PBReaderPlaceMark() && (BLTPBContactReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_112:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 7u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_60;
      case 8u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 92) |= 8u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                v23 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_85:
        v62 = v23 != 0;
        v63 = 88;
        goto LABEL_102;
      case 9u:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        *(_BYTE *)(a1 + 92) |= 0x10u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v14 = v28++ >= 9;
              if (v14)
              {
                v29 = 0;
                goto LABEL_89;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v29 = 0;
LABEL_89:
        v62 = v29 != 0;
        v63 = 89;
        goto LABEL_102;
      case 0xAu:
        v33 = 0;
        v34 = 0;
        v35 = 0;
        *(_BYTE *)(a1 + 92) |= 0x20u;
        while (2)
        {
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 1;
            v35 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              v14 = v34++ >= 9;
              if (v14)
              {
                v35 = 0;
                goto LABEL_93;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v35 = 0;
LABEL_93:
        v62 = v35 != 0;
        v63 = 90;
        goto LABEL_102;
      case 0xBu:
        v39 = 0;
        v40 = 0;
        v41 = 0;
        *(_BYTE *)(a1 + 92) |= 4u;
        while (2)
        {
          v42 = *v3;
          v43 = *(_QWORD *)(a2 + v42);
          if (v43 == -1 || v43 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
            *(_QWORD *)(a2 + v42) = v43 + 1;
            v41 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              v14 = v40++ >= 9;
              if (v14)
              {
                LODWORD(v41) = 0;
                goto LABEL_97;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v41) = 0;
LABEL_97:
        v64 = 64;
        goto LABEL_111;
      case 0xCu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 56;
LABEL_60:
        v45 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_112;
      case 0xDu:
        v46 = 0;
        v47 = 0;
        v48 = 0;
        *(_BYTE *)(a1 + 92) |= 0x40u;
        while (2)
        {
          v49 = *v3;
          v50 = *(_QWORD *)(a2 + v49);
          if (v50 == -1 || v50 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v50);
            *(_QWORD *)(a2 + v49) = v50 + 1;
            v48 |= (unint64_t)(v51 & 0x7F) << v46;
            if (v51 < 0)
            {
              v46 += 7;
              v14 = v47++ >= 9;
              if (v14)
              {
                v48 = 0;
                goto LABEL_101;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v48 = 0;
LABEL_101:
        v62 = v48 != 0;
        v63 = 91;
LABEL_102:
        *(_BYTE *)(a1 + v63) = v62;
        goto LABEL_112;
      case 0xEu:
        v52 = 0;
        v53 = 0;
        v41 = 0;
        *(_BYTE *)(a1 + 92) |= 2u;
        while (2)
        {
          v54 = *v3;
          v55 = *(_QWORD *)(a2 + v54);
          if (v55 == -1 || v55 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v55);
            *(_QWORD *)(a2 + v54) = v55 + 1;
            v41 |= (unint64_t)(v56 & 0x7F) << v52;
            if (v56 < 0)
            {
              v52 += 7;
              v14 = v53++ >= 9;
              if (v14)
              {
                LODWORD(v41) = 0;
                goto LABEL_106;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v41) = 0;
LABEL_106:
        v64 = 28;
        goto LABEL_111;
      case 0xFu:
        v57 = 0;
        v58 = 0;
        v41 = 0;
        *(_BYTE *)(a1 + 92) |= 1u;
        while (2)
        {
          v59 = *v3;
          v60 = *(_QWORD *)(a2 + v59);
          if (v60 == -1 || v60 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v60);
            *(_QWORD *)(a2 + v59) = v60 + 1;
            v41 |= (unint64_t)(v61 & 0x7F) << v57;
            if (v61 < 0)
            {
              v57 += 7;
              v14 = v58++ >= 9;
              if (v14)
              {
                LODWORD(v41) = 0;
                goto LABEL_110;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v41) = 0;
LABEL_110:
        v64 = 24;
LABEL_111:
        *(_DWORD *)(a1 + v64) = v41;
        goto LABEL_112;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_112;
    }
  }
}

uint64_t BLTPBSetNotificationsGroupingRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v23;

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTGetTrafficRestrictedBufferTime()
{
  if (BLTGetPlayLightsAndSirensTrafficRestrictedTimeout_onceToken != -1)
    dispatch_once(&BLTGetPlayLightsAndSirensTrafficRestrictedTimeout_onceToken, &__block_literal_global_6);
  return __BLTPlayLightsAndSirensTrafficRestrictedTimeout - 5;
}

uint64_t BLTGetPlayLightsAndSirensTrafficRestrictedTimeout()
{
  if (BLTGetPlayLightsAndSirensTrafficRestrictedTimeout_onceToken != -1)
    dispatch_once(&BLTGetPlayLightsAndSirensTrafficRestrictedTimeout_onceToken, &__block_literal_global_6);
  return __BLTPlayLightsAndSirensTrafficRestrictedTimeout;
}

double BLTGetSettingSyncForNotificationTimeout()
{
  if (BLTGetSettingSyncForNotificationTimeout_onceToken != -1)
    dispatch_once(&BLTGetSettingSyncForNotificationTimeout_onceToken, &__block_literal_global_52);
  return *(double *)&BLTGetSettingSyncForNotificationTimeout___BLTGetSettingSyncForNotificationTimeout;
}

uint64_t BLTGetPlayLightsAndSirensTimeout(int a1)
{
  double v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    if (BLTGetPlayLightsAndSirensSendConnectedTimeout_onceToken != -1)
      dispatch_once(&BLTGetPlayLightsAndSirensSendConnectedTimeout_onceToken, &__block_literal_global_69);
    v1 = (double)__BLTPlayLightsAndSirensSendConnectedTimeout;
  }
  else
  {
    v1 = 14400.0;
  }
  +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "summarizationSetting");

  v4 = 7;
  if (v3 != 2)
    v4 = 0;
  return (uint64_t)(v1 + (double)v4);
}

id BLTFileURLInHomePath(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Library"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _BLTFileURLWithPath(v3, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _BLTFileURLWithPath(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (!v3)
  {
    blt_general_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      _BLTFileURLWithPath_cold_1(v6);
    goto LABEL_11;
  }
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("BulletinDistributor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = objc_claimAutoreleasedReturnValue();

  -[NSObject stringByDeletingLastPathComponent](v6, "stringByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDD0CF0];
    v19[0] = *MEMORY[0x24BDD0CF8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, v12, &v17);
    v10 = v17;

    if ((v13 & 1) != 0)
      goto LABEL_7;
    blt_general_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      _BLTFileURLWithPath_cold_2((uint64_t)v7, (uint64_t)v10, v15);

LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v10 = 0;
LABEL_7:
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v14;
}

id BLTPairingPath()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pairingStorePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id BLTFileURLInPairingPath(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  BLTPairingPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _BLTFileURLWithPath(v2, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id BLTFileURLInPairingPathWait(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v1 = a1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __BLTFileURLInPairingPathWait_block_invoke;
  v5[3] = &unk_24D762918;
  v5[4] = &v6;
  objc_msgSend(v2, "waitForPairingStorePathPairingID:", v5);

  _BLTFileURLWithPath((void *)v7[5], v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_21740C35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

uint64_t BLTIsDebugBuild()
{
  return 0;
}

uint64_t BLTDeviceOSIsInternalInstall()
{
  return MGGetBoolAnswer();
}

uint64_t BLTIsDebugOrInternalBuild()
{
  if (BLTIsDebugOrInternalBuild_onceToken != -1)
    dispatch_once(&BLTIsDebugOrInternalBuild_onceToken, &__block_literal_global_58);
  return BLTIsDebugOrInternalBuild___isDebugOrInternal;
}

uint64_t BLTIsWalkaboutEnabled()
{
  if (BLTIsWalkaboutEnabled_onceToken != -1)
    dispatch_once(&BLTIsWalkaboutEnabled_onceToken, &__block_literal_global_59);
  return BLTIsWalkaboutEnabled___BLTWalkaboutEnabled;
}

id BLTWorkQueue()
{
  if (BLTWorkQueue_onceToken != -1)
    dispatch_once(&BLTWorkQueue_onceToken, &__block_literal_global_67);
  return (id)BLTWorkQueue___workQueue;
}

void BLTDispatchWorkQueue(_QWORD *a1)
{
  _QWORD *v2;
  void (*v3)(void);
  NSObject *v4;

  if (dispatch_get_specific((const void *)BLTWorkQueueKey) == (void *)BLTWorkQueueIdentifier)
  {
    v3 = (void (*)(void))a1[2];
    v4 = a1;
    v3();
  }
  else
  {
    v2 = a1;
    BLTWorkQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v4, v2);

  }
}

BOOL BLTIsOnWorkQueue()
{
  return dispatch_get_specific((const void *)BLTWorkQueueKey) == (void *)BLTWorkQueueIdentifier;
}

uint64_t BLTPBSetNotificationsAlertLevelRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 28) |= 2u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_43;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            v26 = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          v26 = 0;
LABEL_45:
        *(_BYTE *)(a1 + 24) = v26 != 0;
      }
      else if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v30;

      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_39;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_41:
        *(_DWORD *)(a1 + 8) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL BLTPBHandleSnoozeActionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  BLTPBActionInformation *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_24;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_24;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
LABEL_24:
        v19 = *(BLTPBActionInformation **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;
        goto LABEL_28;
      case 4u:
        v19 = objc_alloc_init(BLTPBActionInformation);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && BLTPBActionInformationReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_29;
    }
  }
}

void sub_21740EDC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *BLTNameForActionType(uint64_t a1)
{
  if ((unint64_t)(a1 - 3) > 5)
    return CFSTR("unknown");
  else
    return off_24D762A50[a1 - 3];
}

uint64_t BLTPBWillSendLightsAndSirensResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            break;
          v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0)
            goto LABEL_41;
          v23 += 7;
          v14 = v24++ >= 9;
          if (v14)
          {
            LODWORD(v25) = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_43:
        *(_DWORD *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_37;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_39:
        *(_BYTE *)(a1 + 12) = v19 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL BLTPBHandlePairedDeviceReadyReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  v6 = (int *)MEMORY[0x24BE7AF30];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

uint64_t BLTPBSetRemoteGlobalSpokenSettingEnabledRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        *(_BYTE *)(a1 + 20) |= 1u;
        v25 = *v3;
        v26 = *(_QWORD *)(a2 + v25);
        if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v26);
          *(_QWORD *)(a2 + v25) = v26 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v27 = 0;
        }
        *(_QWORD *)(a1 + 8) = v27;
      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_33;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_35:
        *(_BYTE *)(a1 + 16) = v20 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL stateIsSyncRestricted(unint64_t a1)
{
  return a1 < 2;
}

BOOL stateIsTrafficRestricted(uint64_t a1)
{
  return a1 == 0;
}

uint64_t stateDidChange(void *a1, uint64_t (*a2)(uint64_t))
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a2(objc_msgSend(v4, "state")) & 1) != 0 || (a2(objc_msgSend(v6, "newState")) & 1) != 0)
    v7 = 0;
  else
    v7 = a2(objc_msgSend(v6, "oldState"));

  return v7;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

uint64_t BLTPBAddBulletinRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  BLTPBBulletin *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  BOOL v44;
  uint64_t v45;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = objc_alloc_init(BLTPBBulletin);
          objc_storeStrong((id *)(a1 + 16), v18);
          if (PBReaderPlaceMark() && (BLTPBBulletinReadFrom((uint64_t)v18, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 4u;
          while (1)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
              break;
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0)
              goto LABEL_49;
            v20 += 7;
            v15 = v21++ >= 9;
            if (v15)
            {
              v22 = 0;
              goto LABEL_51;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_51:
          v44 = v22 != 0;
          v45 = 28;
          goto LABEL_60;
        case 3u:
          *(_BYTE *)(a1 + 32) |= 1u;
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          *(_QWORD *)(a1 + 8) = v29;
          continue;
        case 4u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            v35 = v34 + 1;
            if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                v15 = v31++ >= 9;
                if (v15)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v32) = 0;
LABEL_55:
          *(_DWORD *)(a1 + 24) = v32;
          continue;
        case 5u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          *(_BYTE *)(a1 + 32) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v40 = *v3;
        v41 = *(_QWORD *)(a2 + v40);
        v42 = v41 + 1;
        if (v41 == -1 || v42 > *(_QWORD *)(a2 + *v4))
          break;
        v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
        *(_QWORD *)(a2 + v40) = v42;
        v39 |= (unint64_t)(v43 & 0x7F) << v37;
        if ((v43 & 0x80) == 0)
          goto LABEL_57;
        v37 += 7;
        v15 = v38++ >= 9;
        if (v15)
        {
          v39 = 0;
          goto LABEL_59;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_57:
      if (*(_BYTE *)(a2 + *v5))
        v39 = 0;
LABEL_59:
      v44 = v39 != 0;
      v45 = 29;
LABEL_60:
      *(_BYTE *)(a1 + v45) = v44;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL BLTPBSectionBulletinListReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  BLTPBBulletinIdentifier *v18;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (BLTPBBulletinIdentifier *)a1[2];
        a1[2] = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(BLTPBBulletinIdentifier);
    objc_msgSend(a1, "addBulletinIdentifier:", v18);
    if (!PBReaderPlaceMark() || !BLTPBBulletinIdentifierReadFrom((uint64_t)v18, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBThreadMuteAssertionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  int v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(_BYTE *)(a2 + v16))
        v10 = 0;
LABEL_14:
      if (v17 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v22;

      }
      else if ((v10 >> 3) == 1)
      {
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v21 = 0;
        }
        *(_QWORD *)(a1 + 8) = v21;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  BLTPBAppearance *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;
  uint64_t v33;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 48;
        goto LABEL_42;
      case 2u:
        v20 = objc_alloc_init(BLTPBAppearance);
        objc_storeStrong((id *)(a1 + 16), v20);
        if (PBReaderPlaceMark() && (BLTPBAppearanceReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_52:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_46:
        v33 = 8;
        goto LABEL_51;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 56;
        goto LABEL_42;
      case 5u:
        v27 = 0;
        v28 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 64) |= 1u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              v14 = v28++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_50;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_50:
        v33 = 24;
LABEL_51:
        *(_DWORD *)(a1 + v33) = v23;
        goto LABEL_52;
      case 6u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_42;
      case 7u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
LABEL_42:
        v32 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_52;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_52;
    }
  }
}

uint64_t BLTPBWillSendLightsAndSirensRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_24;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_24:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 4u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_33;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
        {
          v23 = 0;
          goto LABEL_35;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
      if (*(_BYTE *)(a2 + *v5))
        v23 = 0;
LABEL_35:
      *(_BYTE *)(a1 + 32) = v23 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL BLTPBSetSectionSubtypeParametersIconResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  v6 = (int *)MEMORY[0x24BE7AF30];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

void sub_21741B628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  uint64_t v59;

  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose((const void *)(v59 - 224), 8);
  _Block_object_dispose((const void *)(v59 - 192), 8);
  _Block_object_dispose((const void *)(v59 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_21741BD44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void BLTDaemonRestarted(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  BLTWorkQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __BLTDaemonRestarted_block_invoke;
  block[3] = &unk_24D761AD0;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

void sub_21741CA90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21741D050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;
  id *v23;
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v25 - 88));
  _Unwind_Resume(a1);
}

uint64_t BLTPBShouldSuppressLightsAndSirensNowResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_BYTE *)(a1 + 8) = v19 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBFullBulletinListReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  BLTPBSectionBulletinList *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(BLTPBSectionBulletinList);
        objc_msgSend(a1, "addSectionBulletinList:", v17);
        if (!PBReaderPlaceMark() || !BLTPBSectionBulletinListReadFrom(v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBCancelBulletinRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  void *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 32;
          goto LABEL_23;
        case 2u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
LABEL_23:
          v21 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        case 3u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          break;
        case 4u:
          *(_BYTE *)(a1 + 40) |= 1u;
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v31 = 0;
          }
          *(_QWORD *)(a1 + 8) = v31;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v25 = *v3;
        v26 = *(_QWORD *)(a2 + v25);
        v27 = v26 + 1;
        if (v26 == -1 || v27 > *(_QWORD *)(a2 + *v4))
          break;
        v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
        *(_QWORD *)(a2 + v25) = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0)
          goto LABEL_35;
        v22 += 7;
        v15 = v23++ >= 9;
        if (v15)
        {
          LODWORD(v24) = 0;
          goto LABEL_37;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v24) = 0;
LABEL_37:
      *(_DWORD *)(a1 + 16) = v24;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_217421C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t BLTPBHandleDidPlayLightsAndSirensReplyRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  BOOL v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          v15 = v9++ >= 9;
          if (v15)
          {
            v10 = 0;
            v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        if (v16)
          v17 = 1;
        else
          v17 = (v10 & 7) == 4;
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v18 = 0;
              v19 = 0;
              v20 = 0;
              *(_BYTE *)(a1 + 44) |= 2u;
              break;
            case 2u:
              PBReaderReadString();
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = 24;
              goto LABEL_34;
            case 3u:
              PBReaderReadString();
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = 16;
              goto LABEL_34;
            case 4u:
              *(_BYTE *)(a1 + 44) |= 1u;
              v28 = *v3;
              v29 = *(_QWORD *)(a2 + v28);
              if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
                *(_QWORD *)(a2 + v28) = v29 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v30 = 0;
              }
              *(_QWORD *)(a1 + 8) = v30;
              goto LABEL_41;
            case 5u:
              PBReaderReadString();
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = 32;
LABEL_34:
              v31 = *(void **)(a1 + v27);
              *(_QWORD *)(a1 + v27) = v26;

              goto LABEL_41;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_41:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              goto LABEL_36;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_38;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_38:
          *(_BYTE *)(a1 + 40) = v20 != 0;
          goto LABEL_41;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBImageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBMuteAssertionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  BLTPBThreadMuteAssertion *v21;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 3)
      {
        v21 = objc_alloc_init(BLTPBThreadMuteAssertion);
        objc_msgSend((id)a1, "addSectionBulletinList:", v21);
        if (!PBReaderPlaceMark() || (BLTPBThreadMuteAssertionReadFrom((uint64_t)v21, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 2)
      {
        *(_BYTE *)(a1 + 24) |= 1u;
        v18 = *v3;
        v19 = *(_QWORD *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        *(_QWORD *)(a1 + 8) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_217424060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _BLTCaptureBug(void *a1)
{
  id v1;
  void *v2;
  char v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (BLTIsDebugOrInternalBuild())
  {
    if (_BLTCaptureBug_onceToken != -1)
      dispatch_once(&_BLTCaptureBug_onceToken, &__block_literal_global_12);
    if (_BLTCaptureBug__diagnosticReporter)
    {
      objc_msgSend((id)_BLTCaptureBug__diagnosticReporter, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("BulletinDistributor"), CFSTR("Functional"), v1, CFSTR("bulletindistributord"), 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend((id)_BLTCaptureBug__diagnosticReporter, "snapshotWithSignature:duration:event:payload:reply:", v2, 0, 0, &__block_literal_global_7_0, 0.0);
      blt_general_log();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if ((v3 & 1) != 0)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v6 = 138412290;
          v7 = v1;
          _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "Diagnostic Reporter sent snapshot for bug %@", (uint8_t *)&v6, 0xCu);
        }
      }
      else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        _BLTCaptureBug_cold_1((uint64_t)v1, v5);
      }

    }
  }

}

void sub_217425098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_21742663C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL BLTPBShouldSuppressLightsAndSirensNowRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  v6 = (int *)MEMORY[0x24BE7AF30];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

uint64_t BLTPBSectionInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  char v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  char v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  BLTPBSectionInfo *v107;
  char v108;
  unsigned int v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char v113;
  char v114;
  unsigned int v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  char v119;
  char v120;
  unsigned int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  char v126;
  char v127;
  unsigned int v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char v133;
  char v134;
  unsigned int v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  char v140;
  char v141;
  unsigned int v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  char v146;
  char v147;
  unsigned int v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  char v153;
  char v154;
  unsigned int v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  char v159;
  char v160;
  unsigned int v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  char v165;
  char v166;
  unsigned int v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  char v171;
  char v172;
  unsigned int v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  char v177;
  char v178;
  unsigned int v179;
  uint64_t v180;
  uint64_t v181;
  unint64_t v182;
  char v183;
  void *v184;
  uint64_t v185;
  unint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  uint64_t v190;
  BOOL v191;
  uint64_t v192;
  uint64_t v193;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 88;
        goto LABEL_208;
      case 2u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 112;
        goto LABEL_208;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x800u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              v15 = v22++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_221;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_221:
        v190 = 104;
        goto LABEL_319;
      case 4u:
        v28 = 0;
        v29 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x400u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          v32 = v31 + 1;
          if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v32;
            v23 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v15 = v29++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_225;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_225:
        v190 = 84;
        goto LABEL_319;
      case 5u:
        v34 = 0;
        v35 = 0;
        v36 = 0;
        *(_DWORD *)(a1 + 180) |= 0x4000000u;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          v39 = v38 + 1;
          if (v38 == -1 || v39 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              v15 = v35++ >= 9;
              if (v15)
              {
                v36 = 0;
                goto LABEL_229;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v36 = 0;
LABEL_229:
        v191 = v36 != 0;
        v192 = 178;
        goto LABEL_298;
      case 6u:
        v41 = 0;
        v42 = 0;
        v43 = 0;
        *(_DWORD *)(a1 + 180) |= 0x800000u;
        while (2)
        {
          v44 = *v3;
          v45 = *(_QWORD *)(a2 + v44);
          v46 = v45 + 1;
          if (v45 == -1 || v46 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
            *(_QWORD *)(a2 + v44) = v46;
            v43 |= (unint64_t)(v47 & 0x7F) << v41;
            if (v47 < 0)
            {
              v41 += 7;
              v15 = v42++ >= 9;
              if (v15)
              {
                v43 = 0;
                goto LABEL_233;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v43 = 0;
LABEL_233:
        v191 = v43 != 0;
        v192 = 175;
        goto LABEL_298;
      case 7u:
        v48 = 0;
        v49 = 0;
        v50 = 0;
        *(_DWORD *)(a1 + 180) |= 0x400000u;
        while (2)
        {
          v51 = *v3;
          v52 = *(_QWORD *)(a2 + v51);
          v53 = v52 + 1;
          if (v52 == -1 || v53 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
            *(_QWORD *)(a2 + v51) = v53;
            v50 |= (unint64_t)(v54 & 0x7F) << v48;
            if (v54 < 0)
            {
              v48 += 7;
              v15 = v49++ >= 9;
              if (v15)
              {
                v50 = 0;
                goto LABEL_237;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v50 = 0;
LABEL_237:
        v191 = v50 != 0;
        v192 = 174;
        goto LABEL_298;
      case 8u:
        v55 = 0;
        v56 = 0;
        v57 = 0;
        *(_DWORD *)(a1 + 180) |= 0x2000000u;
        while (2)
        {
          v58 = *v3;
          v59 = *(_QWORD *)(a2 + v58);
          v60 = v59 + 1;
          if (v59 == -1 || v60 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v59);
            *(_QWORD *)(a2 + v58) = v60;
            v57 |= (unint64_t)(v61 & 0x7F) << v55;
            if (v61 < 0)
            {
              v55 += 7;
              v15 = v56++ >= 9;
              if (v15)
              {
                v57 = 0;
                goto LABEL_241;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v57 = 0;
LABEL_241:
        v191 = v57 != 0;
        v192 = 177;
        goto LABEL_298;
      case 9u:
        v62 = 0;
        v63 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x40u;
        while (2)
        {
          v64 = *v3;
          v65 = *(_QWORD *)(a2 + v64);
          v66 = v65 + 1;
          if (v65 == -1 || v66 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v65);
            *(_QWORD *)(a2 + v64) = v66;
            v23 |= (unint64_t)(v67 & 0x7F) << v62;
            if (v67 < 0)
            {
              v62 += 7;
              v15 = v63++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_245;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_245:
        v190 = 68;
        goto LABEL_319;
      case 0xAu:
        v68 = 0;
        v69 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x200u;
        while (2)
        {
          v70 = *v3;
          v71 = *(_QWORD *)(a2 + v70);
          v72 = v71 + 1;
          if (v71 == -1 || v72 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v73 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v71);
            *(_QWORD *)(a2 + v70) = v72;
            v23 |= (unint64_t)(v73 & 0x7F) << v68;
            if (v73 < 0)
            {
              v68 += 7;
              v15 = v69++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_249;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_249:
        v190 = 80;
        goto LABEL_319;
      case 0xBu:
        v74 = 0;
        v75 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 4u;
        while (2)
        {
          v76 = *v3;
          v77 = *(_QWORD *)(a2 + v76);
          v78 = v77 + 1;
          if (v77 == -1 || v78 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v79 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v77);
            *(_QWORD *)(a2 + v76) = v78;
            v23 |= (unint64_t)(v79 & 0x7F) << v74;
            if (v79 < 0)
            {
              v74 += 7;
              v15 = v75++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_253;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_253:
        v190 = 24;
        goto LABEL_319;
      case 0xCu:
        v80 = 0;
        v81 = 0;
        v82 = 0;
        *(_DWORD *)(a1 + 180) |= 0x1000000u;
        while (2)
        {
          v83 = *v3;
          v84 = *(_QWORD *)(a2 + v83);
          v85 = v84 + 1;
          if (v84 == -1 || v85 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v86 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v84);
            *(_QWORD *)(a2 + v83) = v85;
            v82 |= (unint64_t)(v86 & 0x7F) << v80;
            if (v86 < 0)
            {
              v80 += 7;
              v15 = v81++ >= 9;
              if (v15)
              {
                v82 = 0;
                goto LABEL_257;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v82 = 0;
LABEL_257:
        v191 = v82 != 0;
        v192 = 176;
        goto LABEL_298;
      case 0xDu:
        v87 = 0;
        v88 = 0;
        v89 = 0;
        *(_DWORD *)(a1 + 180) |= 0x10000u;
        while (2)
        {
          v90 = *v3;
          v91 = *(_QWORD *)(a2 + v90);
          v92 = v91 + 1;
          if (v91 == -1 || v92 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v93 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v91);
            *(_QWORD *)(a2 + v90) = v92;
            v89 |= (unint64_t)(v93 & 0x7F) << v87;
            if (v93 < 0)
            {
              v87 += 7;
              v15 = v88++ >= 9;
              if (v15)
              {
                v89 = 0;
                goto LABEL_261;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v89 = 0;
LABEL_261:
        v191 = v89 != 0;
        v192 = 168;
        goto LABEL_298;
      case 0xEu:
        v94 = 0;
        v95 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x4000u;
        while (2)
        {
          v96 = *v3;
          v97 = *(_QWORD *)(a2 + v96);
          v98 = v97 + 1;
          if (v97 == -1 || v98 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v99 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v97);
            *(_QWORD *)(a2 + v96) = v98;
            v23 |= (unint64_t)(v99 & 0x7F) << v94;
            if (v99 < 0)
            {
              v94 += 7;
              v15 = v95++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_265;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_265:
        v190 = 136;
        goto LABEL_319;
      case 0xFu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
        goto LABEL_208;
      case 0x10u:
        v100 = 0;
        v101 = 0;
        v102 = 0;
        *(_DWORD *)(a1 + 180) |= 0x40000u;
        while (2)
        {
          v103 = *v3;
          v104 = *(_QWORD *)(a2 + v103);
          v105 = v104 + 1;
          if (v104 == -1 || v105 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v106 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v104);
            *(_QWORD *)(a2 + v103) = v105;
            v102 |= (unint64_t)(v106 & 0x7F) << v100;
            if (v106 < 0)
            {
              v100 += 7;
              v15 = v101++ >= 9;
              if (v15)
              {
                v102 = 0;
                goto LABEL_269;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v102 = 0;
LABEL_269:
        v191 = v102 != 0;
        v192 = 170;
        goto LABEL_298;
      case 0x11u:
        v107 = objc_alloc_init(BLTPBSectionInfo);
        objc_msgSend((id)a1, "addSubsections:", v107);
        if (!PBReaderPlaceMark() || (BLTPBSectionInfoReadFrom(v107, a2) & 1) == 0)
          goto LABEL_328;
        goto LABEL_217;
      case 0x12u:
        v108 = 0;
        v109 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x2000u;
        while (2)
        {
          v110 = *v3;
          v111 = *(_QWORD *)(a2 + v110);
          v112 = v111 + 1;
          if (v111 == -1 || v112 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v113 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v111);
            *(_QWORD *)(a2 + v110) = v112;
            v23 |= (unint64_t)(v113 & 0x7F) << v108;
            if (v113 < 0)
            {
              v108 += 7;
              v15 = v109++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_273;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_273:
        v190 = 120;
        goto LABEL_319;
      case 0x13u:
        v114 = 0;
        v115 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x8000u;
        while (2)
        {
          v116 = *v3;
          v117 = *(_QWORD *)(a2 + v116);
          v118 = v117 + 1;
          if (v117 == -1 || v118 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v119 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v117);
            *(_QWORD *)(a2 + v116) = v118;
            v23 |= (unint64_t)(v119 & 0x7F) << v114;
            if (v119 < 0)
            {
              v114 += 7;
              v15 = v115++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_277;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_277:
        v190 = 152;
        goto LABEL_319;
      case 0x14u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 40;
        goto LABEL_208;
      case 0x15u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 144;
        goto LABEL_208;
      case 0x16u:
        v107 = objc_alloc_init(BLTPBSectionIcon);
        objc_storeStrong((id *)(a1 + 56), v107);
        if (!PBReaderPlaceMark() || (BLTPBSectionIconReadFrom(v107, a2) & 1) == 0)
          goto LABEL_328;
        goto LABEL_217;
      case 0x17u:
        v120 = 0;
        v121 = 0;
        v122 = 0;
        *(_DWORD *)(a1 + 180) |= 0x100000u;
        while (2)
        {
          v123 = *v3;
          v124 = *(_QWORD *)(a2 + v123);
          v125 = v124 + 1;
          if (v124 == -1 || v125 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v126 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v124);
            *(_QWORD *)(a2 + v123) = v125;
            v122 |= (unint64_t)(v126 & 0x7F) << v120;
            if (v126 < 0)
            {
              v120 += 7;
              v15 = v121++ >= 9;
              if (v15)
              {
                v122 = 0;
                goto LABEL_281;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v122 = 0;
LABEL_281:
        v191 = v122 != 0;
        v192 = 172;
        goto LABEL_298;
      case 0x18u:
        v127 = 0;
        v128 = 0;
        v129 = 0;
        *(_DWORD *)(a1 + 180) |= 0x200000u;
        while (2)
        {
          v130 = *v3;
          v131 = *(_QWORD *)(a2 + v130);
          v132 = v131 + 1;
          if (v131 == -1 || v132 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v133 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v131);
            *(_QWORD *)(a2 + v130) = v132;
            v129 |= (unint64_t)(v133 & 0x7F) << v127;
            if (v133 < 0)
            {
              v127 += 7;
              v15 = v128++ >= 9;
              if (v15)
              {
                v129 = 0;
                goto LABEL_285;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v129 = 0;
LABEL_285:
        v191 = v129 != 0;
        v192 = 173;
        goto LABEL_298;
      case 0x19u:
        v134 = 0;
        v135 = 0;
        v136 = 0;
        *(_DWORD *)(a1 + 180) |= 0x20000u;
        while (2)
        {
          v137 = *v3;
          v138 = *(_QWORD *)(a2 + v137);
          v139 = v138 + 1;
          if (v138 == -1 || v139 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v140 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v138);
            *(_QWORD *)(a2 + v137) = v139;
            v136 |= (unint64_t)(v140 & 0x7F) << v134;
            if (v140 < 0)
            {
              v134 += 7;
              v15 = v135++ >= 9;
              if (v15)
              {
                v136 = 0;
                goto LABEL_289;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v136 = 0;
LABEL_289:
        v191 = v136 != 0;
        v192 = 169;
        goto LABEL_298;
      case 0x1Au:
        v141 = 0;
        v142 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x10u;
        while (2)
        {
          v143 = *v3;
          v144 = *(_QWORD *)(a2 + v143);
          v145 = v144 + 1;
          if (v144 == -1 || v145 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v146 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v144);
            *(_QWORD *)(a2 + v143) = v145;
            v23 |= (unint64_t)(v146 & 0x7F) << v141;
            if (v146 < 0)
            {
              v141 += 7;
              v15 = v142++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_293;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_293:
        v190 = 48;
        goto LABEL_319;
      case 0x1Bu:
        v147 = 0;
        v148 = 0;
        v149 = 0;
        *(_DWORD *)(a1 + 180) |= 0x80000u;
        while (2)
        {
          v150 = *v3;
          v151 = *(_QWORD *)(a2 + v150);
          v152 = v151 + 1;
          if (v151 == -1 || v152 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v153 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v151);
            *(_QWORD *)(a2 + v150) = v152;
            v149 |= (unint64_t)(v153 & 0x7F) << v147;
            if (v153 < 0)
            {
              v147 += 7;
              v15 = v148++ >= 9;
              if (v15)
              {
                v149 = 0;
                goto LABEL_297;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v149 = 0;
LABEL_297:
        v191 = v149 != 0;
        v192 = 171;
LABEL_298:
        *(_BYTE *)(a1 + v192) = v191;
        goto LABEL_320;
      case 0x1Cu:
        v154 = 0;
        v155 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 8u;
        while (2)
        {
          v156 = *v3;
          v157 = *(_QWORD *)(a2 + v156);
          v158 = v157 + 1;
          if (v157 == -1 || v158 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v159 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v157);
            *(_QWORD *)(a2 + v156) = v158;
            v23 |= (unint64_t)(v159 & 0x7F) << v154;
            if (v159 < 0)
            {
              v154 += 7;
              v15 = v155++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_302;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_302:
        v190 = 28;
        goto LABEL_319;
      case 0x1Du:
        v160 = 0;
        v161 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x100u;
        while (2)
        {
          v162 = *v3;
          v163 = *(_QWORD *)(a2 + v162);
          v164 = v163 + 1;
          if (v163 == -1 || v164 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v165 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v163);
            *(_QWORD *)(a2 + v162) = v164;
            v23 |= (unint64_t)(v165 & 0x7F) << v160;
            if (v165 < 0)
            {
              v160 += 7;
              v15 = v161++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_306;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_306:
        v190 = 76;
        goto LABEL_319;
      case 0x1Eu:
        v166 = 0;
        v167 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x20u;
        while (2)
        {
          v168 = *v3;
          v169 = *(_QWORD *)(a2 + v168);
          v170 = v169 + 1;
          if (v169 == -1 || v170 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v171 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v169);
            *(_QWORD *)(a2 + v168) = v170;
            v23 |= (unint64_t)(v171 & 0x7F) << v166;
            if (v171 < 0)
            {
              v166 += 7;
              v15 = v167++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_310;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_310:
        v190 = 64;
        goto LABEL_319;
      case 0x1Fu:
        v172 = 0;
        v173 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x80u;
        while (2)
        {
          v174 = *v3;
          v175 = *(_QWORD *)(a2 + v174);
          v176 = v175 + 1;
          if (v175 == -1 || v176 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v177 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v175);
            *(_QWORD *)(a2 + v174) = v176;
            v23 |= (unint64_t)(v177 & 0x7F) << v172;
            if (v177 < 0)
            {
              v172 += 7;
              v15 = v173++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_314;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_314:
        v190 = 72;
        goto LABEL_319;
      case 0x20u:
        v178 = 0;
        v179 = 0;
        v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x1000u;
        while (2)
        {
          v180 = *v3;
          v181 = *(_QWORD *)(a2 + v180);
          v182 = v181 + 1;
          if (v181 == -1 || v182 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v183 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v181);
            *(_QWORD *)(a2 + v180) = v182;
            v23 |= (unint64_t)(v183 & 0x7F) << v178;
            if (v183 < 0)
            {
              v178 += 7;
              v15 = v179++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_318;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_318:
        v190 = 108;
LABEL_319:
        *(_DWORD *)(a1 + v190) = v23;
        goto LABEL_320;
      case 0x21u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 160;
LABEL_208:
        v184 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_320;
      case 0x22u:
        *(_DWORD *)(a1 + 180) |= 1u;
        v185 = *v3;
        v186 = *(_QWORD *)(a2 + v185);
        if (v186 <= 0xFFFFFFFFFFFFFFF7 && v186 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v187 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v186);
          *(_QWORD *)(a2 + v185) = v186 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v187 = 0;
        }
        v193 = 8;
        goto LABEL_326;
      case 0x23u:
        *(_DWORD *)(a1 + 180) |= 2u;
        v188 = *v3;
        v189 = *(_QWORD *)(a2 + v188);
        if (v189 <= 0xFFFFFFFFFFFFFFF7 && v189 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v187 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v189);
          *(_QWORD *)(a2 + v188) = v189 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v187 = 0;
        }
        v193 = 16;
LABEL_326:
        *(_QWORD *)(a1 + v193) = v187;
        goto LABEL_320;
      case 0x24u:
        v107 = objc_alloc_init(BLTPBSectionInfoSettings);
        objc_storeStrong((id *)(a1 + 96), v107);
        if (PBReaderPlaceMark() && (BLTPBSectionInfoSettingsReadFrom((uint64_t)v107, a2) & 1) != 0)
        {
LABEL_217:
          PBReaderRecallMark();

LABEL_320:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_328:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_320;
    }
  }
}

uint64_t BLTPBContactReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  void *v38;
  BOOL v39;
  uint64_t v40;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_48;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_52:
          *(_DWORD *)(a1 + 48) = v22;
          continue;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_48;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_48;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_48;
        case 6u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_48;
        case 7u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_56:
          v39 = v28 != 0;
          v40 = 64;
          goto LABEL_61;
        case 8u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 68) |= 1u;
          break;
        case 9u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_48:
          v38 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v35 = *v3;
        v36 = *(_QWORD *)(a2 + v35);
        if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
        *(_QWORD *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_58;
        v32 += 7;
        v14 = v33++ >= 9;
        if (v14)
        {
          v34 = 0;
          goto LABEL_60;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_58:
      if (*(_BYTE *)(a2 + *v5))
        v34 = 0;
LABEL_60:
      v39 = v34 != 0;
      v40 = 65;
LABEL_61:
      *(_BYTE *)(a1 + v40) = v39;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_217430F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21743224C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217432FE8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

__CFString *_stringForSettingsWillPresentBlockedBy(uint64_t a1)
{
  void *v2;
  uint64_t i;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;

  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 10; ++i)
    {
      v4 = _stringForSettingsWillPresentBlockedBy_flags[i];
      if ((v4 & a1) != 0)
      {
        if (v4 > 31)
        {
          if (v4 == 512)
            v6 = CFSTR("BLTSettingsWillPresentBlockedByScreenTime");
          else
            v6 = 0;
          if (v4 == 256)
            v6 = CFSTR("BLTSettingsWillPresentBlockedByForwardOnly");
          if (v4 == 128)
            v6 = CFSTR("BLTSettingsWillPresentBlockedByDisableWristDetection");
          if (v4 == 64)
            v7 = CFSTR("BLTSettingsWillPresentBlockedByOptOutOfCoordinationDenyListed");
          else
            v7 = 0;
          if (v4 == 32)
            v7 = CFSTR("BLTSettingsWillPresentBlockedByNotAllowsNotifications");
          if (v4 <= 127)
            v5 = v7;
          else
            v5 = v6;
        }
        else
        {
          v5 = 0;
          switch(v4)
          {
            case 1:
              v5 = CFSTR("BLTSettingsWillPresentBlockedByAlertType");
              break;
            case 2:
              v5 = CFSTR("BLTSettingsWillPresentBlockedByNotShowsInLockscreen");
              break;
            case 3:
            case 5:
            case 6:
            case 7:
              break;
            case 4:
              v5 = CFSTR("BLTSettingsWillPresentBlockedByFirstPartyCoordinationDenyListed");
              break;
            case 8:
              v5 = CFSTR("BLTSettingsWillPresentBlockedByDisconnection");
              break;
            default:
              if (v4 == 16)
                v5 = CFSTR("BLTSettingsWillPresentBlockedByNotShowsOnExternalDevices");
              else
                v5 = 0;
              break;
          }
        }
        objc_msgSend(v2, "addObject:", v5);
      }
    }
    if (objc_msgSend(v2, "count"))
    {
      objc_msgSend(v2, "componentsJoinedByString:", CFSTR("|"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("0");
    }

  }
  else
  {
    v8 = CFSTR("BLTSettingsWillPresentBlockedByNone");
  }
  return v8;
}

void sub_217434DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_217435604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 160), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_9(id *a1)
{
  return objc_msgSend(*a1, "actionType");
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

BOOL BLTPBActionInformationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 5)
        break;
      if ((v10 >> 3) == 4)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2174398F4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 128));
  _Unwind_Resume(a1);
}

void sub_217439C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21743AB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21743AE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_21743C318(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_21743D90C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL BLTPBHandleSupplementaryActionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  BLTPBActionInformation *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_25;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_25;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_25;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
LABEL_25:
        v19 = *(BLTPBActionInformation **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;
        goto LABEL_26;
      case 5u:
        v19 = objc_alloc_init(BLTPBActionInformation);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && BLTPBActionInformationReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_26:

LABEL_27:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_27;
    }
  }
}

id nilForNSNull(void *a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x24BDBCEF8];
  v2 = a1;
  objc_msgSend(v1, "null");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 == v2)
    v4 = 0;
  else
    v4 = v2;
  v5 = v4;

  return v5;
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

BOOL BLTPBHandleDismissActionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  BLTPBActionInformation *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_24;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_24;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
LABEL_24:
        v19 = *(BLTPBActionInformation **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;
        goto LABEL_28;
      case 4u:
        v19 = objc_alloc_init(BLTPBActionInformation);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && BLTPBActionInformationReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_29;
    }
  }
}

void BLTSignificantTimeChanged(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  BLTWorkQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __BLTSignificantTimeChanged_block_invoke;
  block[3] = &unk_24D761AD0;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

void BLTMuteForTodaySectionIdentifiersChanged(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  BLTWorkQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __BLTMuteForTodaySectionIdentifiersChanged_block_invoke;
  block[3] = &unk_24D761AD0;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

id _BLTToday()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "components:fromDate:", 28, v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_217443614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_217443EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2174440E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BBSectionInfoFromBLTPBSectionInfo(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
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
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (v1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE0FE80]);
    objc_msgSend(v1, "sectionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSectionID:", v3);

    objc_msgSend(v1, "subsectionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSubsectionID:", v4);

    objc_msgSend(v2, "setSectionType:", (int)objc_msgSend(v1, "sectionType"));
    objc_msgSend(v2, "setSuppressFromSettings:", objc_msgSend(v1, "suppressFromSettings"));
    objc_msgSend(v2, "setShowsOnExternalDevices:", objc_msgSend(v1, "showsOnExternalDevices"));
    objc_msgSend(v2, "setNotificationCenterLimit:", objc_msgSend(v1, "notificationCenterLimit"));
    objc_msgSend(v2, "setPushSettings:", objc_msgSend(v1, "pushSettings"));
    objc_msgSend(v2, "setAlertType:", objc_msgSend(v1, "alertType"));
    objc_msgSend(v2, "setShowsMessagePreview:", objc_msgSend(v1, "showsMessagePreview"));
    if (objc_msgSend(v1, "hasAuthorizationStatus"))
    {
      objc_msgSend(v2, "setAuthorizationStatus:", (int)objc_msgSend(v1, "authorizationStatus"));
    }
    else if (objc_msgSend(v1, "hasAllowsNotifications"))
    {
      objc_msgSend(v2, "setAllowsNotifications:", objc_msgSend(v1, "allowsNotifications"));
    }
    if (objc_msgSend(v1, "hasLockScreenSetting"))
    {
      v5 = objc_msgSend(v1, "lockScreenSetting");
      if (v5 == 2)
        v6 = 2;
      else
        v6 = v5 == 1;
      objc_msgSend(v2, "setLockScreenSetting:", v6);
    }
    else if (objc_msgSend(v1, "hasShowsInLockScreen"))
    {
      objc_msgSend(v2, "setShowsInLockScreen:", objc_msgSend(v1, "showsInLockScreen"));
    }
    if (objc_msgSend(v1, "hasNotificationCenterSetting"))
    {
      v7 = objc_msgSend(v1, "notificationCenterSetting");
      if (v7 == 2)
        v8 = 2;
      else
        v8 = v7 == 1;
      objc_msgSend(v2, "setNotificationCenterSetting:", v8);
    }
    else if (objc_msgSend(v1, "hasShowsInNotificationCenter"))
    {
      objc_msgSend(v2, "setShowsInNotificationCenter:", objc_msgSend(v1, "showsInNotificationCenter"));
    }
    if (objc_msgSend(v1, "hasSpokenNotificationSetting"))
    {
      v9 = objc_msgSend(v1, "spokenNotificationSetting");
      if (v9 == 2)
        v10 = 2;
      else
        v10 = v9 == 1;
      objc_msgSend(v2, "setSpokenNotificationSetting:", v10);
    }
    objc_msgSend(v2, "setSuppressedSettings:", objc_msgSend(v1, "suppressedSettings"));
    objc_msgSend(v1, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDisplayName:", v11);

    if (objc_msgSend(v1, "hasCriticalAlertSetting"))
    {
      if (objc_msgSend(v1, "criticalAlertSetting"))
        v12 = 2;
      else
        v12 = 1;
      objc_msgSend(v2, "setCriticalAlertSetting:", v12);
    }
    if (objc_msgSend(v1, "hasGroupingSetting"))
    {
      v13 = objc_msgSend(v1, "groupingSetting");
      if (v13 <= 2)
        objc_msgSend(v2, "setBulletinGroupingSetting:", v13);
    }
    objc_msgSend(v1, "subsections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v1, "subsections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend(v1, "subsections", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v37 != v22)
              objc_enumerationMutation(v19);
            BBSectionInfoFromBLTPBSectionInfo(*(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v24);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v21);
      }

      v25 = (void *)objc_msgSend(v18, "copy");
      objc_msgSend(v2, "setSubsections:", v25);

    }
    objc_msgSend(v2, "setSubsectionPriority:", (int)objc_msgSend(v1, "subsectionPriority"));
    objc_msgSend(v2, "setVersion:", objc_msgSend(v1, "version"));
    objc_msgSend(v1, "factorySectionID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFactorySectionID:", v26);

    objc_msgSend(v1, "icon");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    BBSectionIconFromBLTPBSectionIcon(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setIcon:", v28);

    if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsAuthorizationExpirationDate"))
    {
      if (objc_msgSend(v1, "hasAuthorizationExpirationDate"))
      {
        v29 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v1, "authorizationExpirationDate");
        objc_msgSend(v29, "dateWithTimeIntervalSince1970:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setAuthorizationExpirationDate:", v30);

      }
      if (objc_msgSend(v1, "hasLastUserGrantedAuthorizationDate"))
      {
        v31 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v1, "lastUserGrantedAuthorizationDate");
        objc_msgSend(v31, "dateWithTimeIntervalSince1970:");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setLastUserGrantedAuthorizationDate:", v32);

      }
    }
    if (objc_msgSend(v1, "hasSectionInfoSettings"))
    {
      objc_msgSend(v2, "sectionInfoSettings");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "sectionInfoSettings");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "applySectionInfoSettingsFromProtobuf:", v34);

    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id BBSectionIconFromBLTPBSectionIcon(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "variants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE0FE70]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v1, "variants", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x24BE0FE78], "sectionIconVariantFromProtobuf:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addVariant:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BLTPBSectionInfo *BLTPBSectionInfoFromBBSectionInfoForDeviceSize(void *a1, uint64_t a2)
{
  id v3;
  BLTPBSectionInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
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
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (v3)
  {
    v4 = objc_alloc_init(BLTPBSectionInfo);
    objc_msgSend(v3, "sectionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBSectionInfo setSectionID:](v4, "setSectionID:", v5);

    objc_msgSend(v3, "subsectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBSectionInfo setSubsectionID:](v4, "setSubsectionID:", v6);

    -[BLTPBSectionInfo setSectionType:](v4, "setSectionType:", objc_msgSend(v3, "sectionType"));
    -[BLTPBSectionInfo setSuppressFromSettings:](v4, "setSuppressFromSettings:", objc_msgSend(v3, "suppressFromSettings"));
    -[BLTPBSectionInfo setShowsOnExternalDevices:](v4, "setShowsOnExternalDevices:", objc_msgSend(v3, "showsOnExternalDevices"));
    -[BLTPBSectionInfo setNotificationCenterLimit:](v4, "setNotificationCenterLimit:", objc_msgSend(v3, "notificationCenterLimit"));
    -[BLTPBSectionInfo setPushSettings:](v4, "setPushSettings:", objc_msgSend(v3, "pushSettings"));
    -[BLTPBSectionInfo setAlertType:](v4, "setAlertType:", objc_msgSend(v3, "alertType"));
    -[BLTPBSectionInfo setShowsMessagePreview:](v4, "setShowsMessagePreview:", objc_msgSend(v3, "showsMessagePreview"));
    -[BLTPBSectionInfo setShowsInNotificationCenter:](v4, "setShowsInNotificationCenter:", objc_msgSend(v3, "showsInNotificationCenter"));
    -[BLTPBSectionInfo setShowsInLockScreen:](v4, "setShowsInLockScreen:", objc_msgSend(v3, "showsInLockScreen"));
    -[BLTPBSectionInfo setAllowsNotifications:](v4, "setAllowsNotifications:", objc_msgSend(v3, "allowsNotifications"));
    if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsAuthorizationStatusLockScreenAndNCSettings"))
    {
      if ((objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsAuthorizationExpirationDate") & 1) != 0
        || objc_msgSend(v3, "authorizationStatus") != 4)
      {
        v9 = objc_msgSend(v3, "authorizationStatus");
      }
      else
      {
        objc_msgSend(v3, "sectionInfoSettings");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isAuthorizedTemporarily");

        if (v8)
          v9 = 2;
        else
          v9 = 0;
      }
      -[BLTPBSectionInfo setAuthorizationStatus:](v4, "setAuthorizationStatus:", v9);
      v10 = objc_msgSend(v3, "lockScreenSetting");
      if (v10 == 2)
        v11 = 2;
      else
        v11 = v10 == 1;
      -[BLTPBSectionInfo setLockScreenSetting:](v4, "setLockScreenSetting:", v11);
      v12 = objc_msgSend(v3, "notificationCenterSetting");
      if (v12 == 2)
        v13 = 2;
      else
        v13 = v12 == 1;
      -[BLTPBSectionInfo setNotificationCenterSetting:](v4, "setNotificationCenterSetting:", v13);
    }
    if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsSpokenNotificationSettings"))
    {
      v14 = objc_msgSend(v3, "spokenNotificationSetting");
      if (v14 == 2)
        v15 = 2;
      else
        v15 = v14 == 1;
      -[BLTPBSectionInfo setSpokenNotificationSetting:](v4, "setSpokenNotificationSetting:", v15);
    }
    -[BLTPBSectionInfo setSuppressedSettings:](v4, "setSuppressedSettings:", objc_msgSend(v3, "suppressedSettings"));
    objc_msgSend(v3, "displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == v16)
      v18 = 0;
    else
      v18 = v16;
    v19 = v18;

    -[BLTPBSectionInfo setDisplayName:](v4, "setDisplayName:", v19);
    if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsCriticalAndGroupingSettings"))
    {
      v20 = objc_msgSend(v3, "criticalAlertSetting");
      if (v20)
        -[BLTPBSectionInfo setCriticalAlertSetting:](v4, "setCriticalAlertSetting:", v20 == 2);
      v21 = objc_msgSend(v3, "bulletinGroupingSetting");
      if (v21 <= 2)
        -[BLTPBSectionInfo setGroupingSetting:](v4, "setGroupingSetting:", v21);
    }
    objc_msgSend(v3, "subsections");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      v24 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v3, "subsections");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "arrayWithCapacity:", objc_msgSend(v25, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      objc_msgSend(v3, "subsections", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v49 != v30)
              objc_enumerationMutation(v27);
            BLTPBSectionInfoFromBBSectionInfoForDeviceSize(*(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), a2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v32);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        }
        while (v29);
      }

      -[BLTPBSectionInfo setSubsections:](v4, "setSubsections:", v26);
    }
    -[BLTPBSectionInfo setSubsectionPriority:](v4, "setSubsectionPriority:", objc_msgSend(v3, "subsectionPriority"));
    -[BLTPBSectionInfo setVersion:](v4, "setVersion:", objc_msgSend(v3, "version"));
    objc_msgSend(v3, "factorySectionID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBSectionInfo setFactorySectionID:](v4, "setFactorySectionID:", v33);

    objc_msgSend(v3, "parentSection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      blt_ids_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "sectionID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v36;
        _os_log_impl(&dword_2173D9000, v35, OS_LOG_TYPE_INFO, "Fetching icons for BBSectionInfo to BLTPBSectionInfo conversion of %@", buf, 0xCu);

      }
      objc_msgSend(v3, "icon");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sectionID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      BLTPBSectionIconFromBBSectionIconForDeviceSize(v37, v38, a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLTPBSectionInfo setIcon:](v4, "setIcon:", v39);

    }
    objc_msgSend(v3, "sectionInfoSettings");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v3, "sectionInfoSettings");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "blt_protobuf");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLTPBSectionInfo setSectionInfoSettings:](v4, "setSectionInfoSettings:", v42);

    }
    if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsAuthorizationExpirationDate"))
    {
      objc_msgSend(v3, "authorizationExpirationDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        objc_msgSend(v3, "authorizationExpirationDate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "timeIntervalSince1970");
        -[BLTPBSectionInfo setAuthorizationExpirationDate:](v4, "setAuthorizationExpirationDate:");

      }
      objc_msgSend(v3, "lastUserGrantedAuthorizationDate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend(v3, "lastUserGrantedAuthorizationDate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "timeIntervalSince1970");
        -[BLTPBSectionInfo setLastUserGrantedAuthorizationDate:](v4, "setLastUserGrantedAuthorizationDate:");

      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BLTPBSectionIcon *BLTPBSectionIconFromBBSectionIconForDeviceSize(void *a1, void *a2, unsigned int a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  BLTPBSectionIcon *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  BLTPBSectionIconVariant *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  __int128 v69;
  unsigned int v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *obj;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[4];
  id v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  _BYTE buf[24];
  uint64_t v87;
  double v88;
  uint64_t v89;
  _BYTE v90[16];
  _BYTE v91[16];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  objc_msgSend(MEMORY[0x24BE6B4E0], "blt_boundedWaitForActivePairedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BE6B3C0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

  }
  else
  {
    blt_ids_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_7(v12, v13, v14, v15, v16, v17, v18, v19);

    v11 = 2.0;
  }
  objc_msgSend(v5, "variants");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (!v21)
  {
    v22 = 0;
LABEL_34:
    if (v6)
    {
      blt_ids_log();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_2();

      v72 = v8;
      v73 = v5;
      switch(a3)
      {
        case 0u:
        case 1u:
        case 4u:
          *(_QWORD *)buf = 0x4058800000000000;
          v52 = 13;
          v53 = 27.5;
          v54 = 9;
          v55 = 0x4046000000000000;
          goto LABEL_40;
        case 3u:
          *(_QWORD *)buf = 0x405B000000000000;
          v53 = 29.0;
          v52 = 19;
          v54 = 9;
          v56 = 0x4049000000000000;
          v57 = 16;
          break;
        case 5u:
        case 8u:
          *(_QWORD *)buf = 0x4058800000000000;
          v53 = 29.0;
          v52 = 19;
          v54 = 9;
          v55 = 0x4049000000000000;
LABEL_40:
          v56 = v55;
          v57 = 5;
          break;
        case 6u:
        case 9u:
          *(_QWORD *)buf = 0x405D400000000000;
          v52 = 21;
          v53 = 33.0;
          v54 = 25;
          v56 = 0x404A400000000000;
          v57 = 23;
          break;
        case 7u:
          *(_QWORD *)buf = 0x4060200000000000;
          v52 = 28;
          v53 = 33.0;
          v54 = 32;
          v56 = 0x404A400000000000;
          v57 = 30;
          break;
        default:
          *(_QWORD *)buf = 0x4055800000000000;
          v53 = 24.0;
          v52 = 11;
          v54 = 7;
          v56 = 0x4044000000000000;
          v57 = 3;
          break;
      }
      *(_QWORD *)&buf[8] = v57;
      *(_QWORD *)&buf[16] = v56;
      v87 = v54;
      v88 = v53;
      v89 = v52;
      v22 = (BLTPBSectionIcon *)objc_opt_new();
      for (i = 0; i != 48; i += 16)
      {
        BLTPBGetPNGIconDataFromAppIcon(v6, *(double *)&buf[i], v11);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (v59)
        {
          v60 = (void *)objc_opt_new();
          objc_msgSend(v60, "setFormat:", *(unsigned int *)&buf[i + 8]);
          objc_msgSend(v60, "setPrecomposed:", 1);
          objc_msgSend(v60, "setImageData:", v59);
          blt_ids_log();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            v62 = *(_QWORD *)&buf[i];
            objc_msgSend(v60, "imageData");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "length");
            *(_DWORD *)v80 = 138412802;
            v81 = v6;
            v82 = 2048;
            v83 = v62;
            v84 = 2048;
            v85 = v64;
            _os_log_error_impl(&dword_2173D9000, v61, OS_LOG_TYPE_ERROR, "Fetched icon for %@ of size %f with data size %lu", v80, 0x20u);

          }
          -[BLTPBSectionIcon addVariant:](v22, "addVariant:", v60);

        }
      }
      -[BLTPBSectionIcon variants](v22, "variants");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "count");

      if (v66)
      {
        v8 = v72;
        v5 = v73;
      }
      else
      {

        blt_ids_log();
        v67 = objc_claimAutoreleasedReturnValue();
        v8 = v72;
        v5 = v73;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_1();

        v22 = 0;
      }
    }
    goto LABEL_56;
  }
  v74 = v6;
  v22 = objc_alloc_init(BLTPBSectionIcon);
  v70 = a3;
  BLTPBValidSectionIconVariantsForDeviceSize(a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  blt_ids_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_6(v24, v25, v26, v27, v28, v29, v30, v31);

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend(v5, "variants");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
  if (v32)
  {
    v34 = v32;
    v71 = v8;
    v35 = *(_QWORD *)v77;
    *(_QWORD *)&v33 = 134218240;
    v69 = v33;
    while (2)
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v77 != v35)
          objc_enumerationMutation(obj);
        v37 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v37, "format", v69));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v23, "containsObject:", v38);

        if ((v39 & 1) != 0)
        {
          objc_msgSend(v37, "applicationIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            blt_ids_log();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_4(v37);

            objc_msgSend(v37, "applicationIdentifier");
            v50 = objc_claimAutoreleasedReturnValue();

            v22 = 0;
            v74 = (void *)v50;
            goto LABEL_32;
          }
          objc_msgSend(v37, "systemImageName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            blt_ids_log();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_3((uint64_t)v90, (uint64_t)v37);

            objc_msgSend(v37, "systemImageName");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            +[BLTPBSectionIconVariant sectionIconVariantWithImageData:systemImageName:precomposed:format:](BLTPBSectionIconVariant, "sectionIconVariantWithImageData:systemImageName:precomposed:format:", 0, v43, 0, objc_msgSend(v37, "format"));
            v44 = (BLTPBSectionIconVariant *)objc_claimAutoreleasedReturnValue();

            -[BLTPBSectionIcon addVariant:](v22, "addVariant:", v44);
          }
          else
          {
            v44 = objc_alloc_init(BLTPBSectionIconVariant);
            -[BLTPBSectionIconVariant setFormat:](v44, "setFormat:", objc_msgSend(v37, "format"));
            BLTPBDataForSectionIconVariant(v37, v11);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[BLTPBSectionIconVariant setImageData:](v44, "setImageData:", v45);
            -[BLTPBSectionIconVariant setPrecomposed:](v44, "setPrecomposed:", objc_msgSend(v37, "isPrecomposed"));
            -[BLTPBSectionIcon addVariant:](v22, "addVariant:", v44);
            blt_ids_log();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              v47 = objc_msgSend(v37, "format");
              v48 = objc_msgSend(v45, "length");
              *(_DWORD *)buf = v69;
              *(_QWORD *)&buf[4] = v47;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v48;
              _os_log_error_impl(&dword_2173D9000, v46, OS_LOG_TYPE_ERROR, "Icon variant: %ld fetched with size %lu", buf, 0x16u);
            }

          }
        }
        else
        {
          blt_ids_log();
          v44 = (BLTPBSectionIconVariant *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v44->super.super, OS_LOG_TYPE_ERROR))
            BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_5((uint64_t)v91, (uint64_t)v37);
        }

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
      if (v34)
        continue;
      break;
    }
LABEL_32:
    v8 = v71;
  }
  a3 = v70;

  v6 = v74;
  if (!v22)
    goto LABEL_34;
LABEL_56:

  return v22;
}

id BLTPBSectionInfoFromBBSectionInfo(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v1 = (void *)MEMORY[0x24BE6B4E0];
  v2 = a1;
  objc_msgSend(v1, "blt_boundedWaitForActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B3B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NRDeviceSizeForProductType();
  BLTPBSectionInfoFromBBSectionInfoForDeviceSize(v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id BLTPBDataForSectionIconVariant(void *a1, double a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIImage *v20;
  void *v21;
  void *v22;
  void *v23;
  UIImage *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;

  v3 = a1;
  v4 = (void *)MEMORY[0x219A0BFAC]();
  objc_msgSend(v3, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    blt_ids_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      BLTPBDataForSectionIconVariant_cold_3(v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(v3, "imageData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "bundlePath");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15
      && (v16 = (void *)v15,
          objc_msgSend(v3, "imageName"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          v16,
          v17))
    {
      v18 = (void *)MEMORY[0x24BDD1488];
      objc_msgSend(v3, "bundlePath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleWithPath:", v19);
      v20 = (UIImage *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(v3, "imageName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithDisplayScale:", a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "imageNamed:inBundle:compatibleWithTraitCollection:", v22, v20, v23);
      v24 = (UIImage *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x24BDF7528];
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "postNotificationName:object:", v26, v27);

      objc_msgSend(MEMORY[0x24BDF7010], "_clearAllCachedImagesAndAssets");
      blt_ids_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        BLTPBDataForSectionIconVariant_cold_2((uint64_t)v24, v3);

      UIImagePNGRepresentation(v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "imagePath");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v14 = 0;
        goto LABEL_16;
      }
      v30 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(v3, "imagePath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "imageWithContentsOfFile:", v31);
      v20 = (UIImage *)objc_claimAutoreleasedReturnValue();

      blt_ids_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        BLTPBDataForSectionIconVariant_cold_1((uint64_t)v20, v3);

      UIImagePNGRepresentation(v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_16:
  objc_autoreleasePoolPop(v4);

  return v14;
}

id BLTPBGetPNGIconDataFromAppIcon(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  UIImage *v22;
  UIImage *v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = (void *)MEMORY[0x219A0BFAC]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithBundleIdentifier:", v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", a2, a2, a3);
  objc_msgSend(v8, "setShape:", 1);
  v30[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareImagesForImageDescriptors:", v9);

  objc_msgSend(v7, "imageForDescriptor:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    blt_general_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      BLTPBGetPNGIconDataFromAppIcon_cold_1();
    goto LABEL_14;
  }
  v11 = v10;
  if (-[NSObject placeholder](v10, "placeholder"))
  {
    blt_general_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      BLTPBGetPNGIconDataFromAppIcon_cold_4(v12, v13, v14, v15, v16, v17, v18, v19);

    objc_msgSend(v7, "prepareImageForDescriptor:", v8);
    v20 = objc_claimAutoreleasedReturnValue();

    v11 = v20;
  }
  v21 = -[NSObject CGImage](v11, "CGImage");
  if (!v21)
  {
    blt_general_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      BLTPBGetPNGIconDataFromAppIcon_cold_2();

LABEL_14:
    v24 = 0;
    v25 = 1;
    goto LABEL_19;
  }
  v22 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v21, 0, a3);
  v23 = v22;
  if (v22)
  {
    UIImagePNGRepresentation(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
  }
  else
  {
    blt_general_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      BLTPBGetPNGIconDataFromAppIcon_cold_3();

    v24 = 0;
    v25 = 1;
  }

LABEL_19:
  objc_autoreleasePoolPop(v6);
  if (v25)
    v28 = 0;
  else
    v28 = v24;

  return v28;
}

id BLTPBSectionIconFromBBSectionIcon(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BE6B4E0];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "blt_boundedWaitForActivePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BE6B3B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NRDeviceSizeForProductType();
  BLTPBSectionIconFromBBSectionIconForDeviceSize(v5, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id BLTPBValidSectionIconVariantsForDeviceSize(unsigned int a1)
{
  void *v1;

  if (a1 > 9)
    v1 = &unk_24D7865D8;
  else
    v1 = (void *)qword_24D763C90[(__int16)a1];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t BLTSettingSyncingNotificationsLevelToBLTPBSetNotificationsAlertLevel(uint64_t result)
{
  if ((unint64_t)(result - 1) < 3)
    return result;
  else
    return 0;
}

uint64_t BLTPBSetNotificationsAlertLevelToBLTSettingSyncingNotificationsLevel(int a1)
{
  uint64_t v1;

  v1 = (a1 - 1);
  if (v1 < 3)
    return v1 + 1;
  else
    return 0;
}

void sub_2174466A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_217446C5C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_2174497FC(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  id v3;
  NSObject *v4;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    blt_general_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BLTPreviouslySentMessageStore initWithMessageStorePath:].cold.1((uint64_t)v3, v2, v4);

    objc_end_catch();
    JUMPOUT(0x217449778);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_217449FCC()
{
  objc_end_catch();
  JUMPOUT(0x217449FD4);
}

BOOL BLTPBBulletinIdentifierReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BLTPBTransportDataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  void *v38;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_46;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_48;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_48:
          *(_QWORD *)(a1 + 8) = v19;
          continue;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 40) |= 4u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
              *(_QWORD *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  v26 = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v26 = 0;
LABEL_52:
          *(_BYTE *)(a1 + 36) = v26 != 0;
          continue;
        case 3u:
          PBReaderReadData();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 24;
          goto LABEL_44;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          break;
        case 5u:
          PBReaderReadData();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 16;
LABEL_44:
          v38 = *(void **)(a1 + v31);
          *(_QWORD *)(a1 + v31) = v30;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v35 = *v3;
        v36 = *(_QWORD *)(a2 + v35);
        if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
        *(_QWORD *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_54;
        v32 += 7;
        v14 = v33++ >= 9;
        if (v14)
        {
          LODWORD(v34) = 0;
          goto LABEL_56;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_54:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v34) = 0;
LABEL_56:
      *(_DWORD *)(a1 + 32) = v34;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL BLTPBHandleLaunchSessionActionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  BLTPBActionInformation *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_24;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_24;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
LABEL_24:
        v19 = *(BLTPBActionInformation **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;
        goto LABEL_28;
      case 4u:
        v19 = objc_alloc_init(BLTPBActionInformation);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && BLTPBActionInformationReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_29;
    }
  }
}

void sub_21744C77C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21744C864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BLTPBSectionIconReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  BLTPBSectionIconVariant *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(BLTPBSectionIconVariant);
        objc_msgSend(a1, "addVariant:", v17);
        if (!PBReaderPlaceMark() || (BLTPBSectionIconVariantReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL BLTPBSetSectionInfoRequestReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  BLTPBSectionInfo *v17;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(BLTPBSectionInfo);
        objc_storeStrong(a1 + 2, v17);
        if (!PBReaderPlaceMark() || (BLTPBSectionInfoReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = (BLTPBSectionInfo *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(a1, "addKeypaths:", v17);
LABEL_25:

    goto LABEL_27;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void _readDataFromFile_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_0(&dword_2173D9000, v0, v1, "-[NSData MD5:] call to readDataUpToLength: %@ failed with: %@");
  OUTLINED_FUNCTION_5();
}

void BLTCleanAttachmentsPath_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Unable to remove attachments dir %@", (uint8_t *)&v2, 0xCu);
}

void _BLTFileURLWithPath_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2173D9000, log, OS_LOG_TYPE_ERROR, "Error - received nil path while trying to construct bulletin distributor file path!", v1, 2u);
}

void _BLTFileURLWithPath_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2173D9000, log, OS_LOG_TYPE_ERROR, "Could not create %@ error: %@", (uint8_t *)&v3, 0x16u);
}

void _BLTCaptureBug_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Diagnostic Reporter failed to send snapshot for bug %@", (uint8_t *)&v2, 0xCu);
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "No sectionInfo icon. app icon for %@ not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "Fetching app icons for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_3(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_7_0(a1, a2), "systemImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v5;
  OUTLINED_FUNCTION_1_1(&dword_2173D9000, v2, OS_LOG_TYPE_ERROR, "Icon specified system image name: %@", v4);

  OUTLINED_FUNCTION_8_0();
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_4(void *a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "applicationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, v5, v6);

}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_5(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t *v3;
  uint8_t *v4;
  uint64_t v5;

  v5 = objc_msgSend((id)OUTLINED_FUNCTION_7_0(a1, a2), "format");
  *(_DWORD *)v4 = 134217984;
  *v3 = v5;
  OUTLINED_FUNCTION_1_1(&dword_2173D9000, v2, OS_LOG_TYPE_ERROR, "Skipping icon variant %ld as it is invalid for the current device", v4);
  OUTLINED_FUNCTION_8_0();
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2173D9000, a1, a3, "Fetching icon variants", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a1, a3, "Unable to get paired device to determine screen scale for icons! Using default scale %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void BLTPBDataForSectionIconVariant_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(a2, "imagePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);

}

void BLTPBDataForSectionIconVariant_cold_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;
  void *v9;

  objc_msgSend(a2, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "imageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);

}

void BLTPBDataForSectionIconVariant_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2173D9000, a1, a3, "Fetching iconVariant from imageData", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void BLTPBGetPNGIconDataFromAppIcon_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "BLTPBGetPNGIconDataFromAppIcon: No isImage for: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void BLTPBGetPNGIconDataFromAppIcon_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "BLTPBGetPNGIconDataFromAppIcon: No cgImage for: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void BLTPBGetPNGIconDataFromAppIcon_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "BLTPBGetPNGIconDataFromAppIcon: No UIImage for: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void BLTPBGetPNGIconDataFromAppIcon_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2173D9000, a1, a3, "BLTPBGetPNGIconDataFromAppIcon: isImage was a placeholder. Fetching fresh image", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t BBGetObserverGatewayTimeout()
{
  return MEMORY[0x24BE0FDE8]();
}

uint64_t BBServerListeningForConnections()
{
  return MEMORY[0x24BE0FE10]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC308](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC310](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC318](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x24BE3D630]();
}

uint64_t INSupportedIntentsByExtensions()
{
  return MEMORY[0x24BDD9A40]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t NRDeviceSizeForProductType()
{
  return MEMORY[0x24BE6B410]();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return MEMORY[0x24BE6B498]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x24BE7AF88]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x24BE7B028]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BDF7920](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x24BEDCF28](m1, m2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x24BDAF428]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x24BDAF8A8](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x24BDB0210](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

