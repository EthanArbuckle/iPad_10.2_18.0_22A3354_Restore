void init_logging_signposts()
{
  init_logging_signpost_modules((uint64_t)&_gLogSignpostObjects, 4, (uint64_t)_kLoggingSignpostModuleEntries);
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1)
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &loc_2171F9000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_2171EA000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_2171EA000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_2171EA000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = (_QWORD *)&loc_2171F9000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v2[498];
    LODWORD(v13) = v5;
    _os_log_impl(&dword_2171EA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(_QWORD *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void __CardReaderClassMatch(void *a1, uint64_t a2)
{
  void *v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  io_object_t v11;
  io_object_t v12;
  NSObject *v13;
  io_object_t v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  NSObject *v18;
  kern_return_t v19;
  kern_return_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  io_service_t v26;
  kern_return_t v27;
  kern_return_t v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  int v40;
  NSObject *v41;
  int v42;
  id v43;
  const __CFString *mode;
  uint8_t v45;
  char v46[15];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  +[IAPUIDManager sharedIAPUIDManager](IAPUIDManager, "sharedIAPUIDManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "objectForIAPUID:", a1);

  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v48 = (uint64_t)a1;
    _os_log_impl(&dword_2171EA000, v8, OS_LOG_TYPE_INFO, "uidForNotification = %lu", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v48 = (uint64_t)v5;
    _os_log_impl(&dword_2171EA000, v9, OS_LOG_TYPE_INFO, "pUSBMonitor=%@", buf, 0xCu);
  }

  if (v5)
  {
    MEMORY[0x219A07B80](a2);
    v11 = IOIteratorNext(a2);
    if (v11)
    {
      v12 = v11;
      mode = (const __CFString *)*MEMORY[0x24BDBD5A0];
      v13 = MEMORY[0x24BDACB70];
      while (1)
      {
        v14 = *((_DWORD *)v5 + 11);
        if (v14 == v12)
        {
          v15 = gLogObjects;
          v16 = gNumLogObjects;
          if (gLogObjects)
            v17 = gNumLogObjects < 1;
          else
            v17 = 1;
          if (v17)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v48 = v15;
              v49 = 1024;
              v50 = v16;
              _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v18 = v13;
            v24 = v13;
          }
          else
          {
            v24 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v48) = v12;
            _os_log_error_impl(&dword_2171EA000, v24, OS_LOG_TYPE_ERROR, "ERROR - already registered, service=%x", buf, 8u);
          }
          goto LABEL_67;
        }
        if (v14)
          IOObjectRelease(v14);
        *((_DWORD *)v5 + 11) = v12;
        v19 = IOObjectRetain(v12);
        if (v19)
        {
          v20 = v19;
          v21 = gLogObjects;
          v22 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v23 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v48 = v21;
              v49 = 1024;
              v50 = v22;
              _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v25 = v13;
            v23 = v13;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v48) = v20;
            _os_log_error_impl(&dword_2171EA000, v23, OS_LOG_TYPE_ERROR, "ERROR - IOObjectRetain failed %#x", buf, 8u);
          }

        }
        v24 = v5;
        v26 = *((_DWORD *)v5 + 11);
        if (!v26)
          break;
        v27 = IOServiceAddInterestNotification(*((IONotificationPortRef *)v5 + 4), v26, "IOGeneralInterest", (IOServiceInterestCallback)__USBCardReaderInterest, *((void **)v5 + 7), (io_object_t *)v5 + 10);
        if (v27)
        {
          v28 = v27;
          v29 = gLogObjects;
          v30 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v31 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v48 = v29;
              v49 = 1024;
              v50 = v30;
              _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v37 = v13;
            v31 = v13;
          }
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v48) = v28;
            _os_log_error_impl(&dword_2171EA000, v31, OS_LOG_TYPE_ERROR, "ERROR - Couldn't add interest notification %#x", buf, 8u);
          }

          goto LABEL_67;
        }
        if (!IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)v5 + 4)))
        {
          v39 = gLogObjects;
          v40 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v34 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v48 = v39;
              v49 = 1024;
              v50 = v40;
              _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v41 = v13;
            v34 = v13;
          }
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            __CardReaderClassMatch_cold_3(&v45, v46, v34);
LABEL_66:

          goto LABEL_67;
        }
        Main = CFRunLoopGetMain();
        RunLoopSource = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)v5 + 4));
        CFRunLoopAddSource(Main, RunLoopSource, mode);
LABEL_67:

        IOObjectRelease(v12);
        v12 = IOIteratorNext(a2);
        if (!v12)
          goto LABEL_85;
      }
      v32 = gLogObjects;
      v33 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v34 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v48 = v32;
          v49 = 1024;
          v50 = v33;
          _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v38 = v13;
        v34 = v13;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v42 = *((_DWORD *)v5 + 11);
        *(_DWORD *)buf = 67109120;
        LODWORD(v48) = v42;
        _os_log_error_impl(&dword_2171EA000, v34, OS_LOG_TYPE_ERROR, "ERROR: Class instance == NULL or _ioUSBCardReaderService(0x%x) = NULL !\n", buf, 8u);
      }
      goto LABEL_66;
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v5 = (id)MEMORY[0x24BDACB70];
      v43 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      __CardReaderClassMatch_cold_1();
  }
LABEL_85:

}

void __CardReaderClassTerminate(void *a1, uint64_t a2)
{
  void *v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  io_object_t v11;
  __int128 v12;
  io_object_t v13;
  NSObject *v14;
  id v15;
  io_object_t v16;
  io_object_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  NSObject *v24;
  int v25;
  id v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  +[IAPUIDManager sharedIAPUIDManager](IAPUIDManager, "sharedIAPUIDManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "objectForIAPUID:", a1);

  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v29 = (uint64_t)a1;
    _os_log_impl(&dword_2171EA000, v8, OS_LOG_TYPE_INFO, "uidForNotification = %lu", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = (uint64_t)v5;
    _os_log_impl(&dword_2171EA000, v9, OS_LOG_TYPE_INFO, "pUSBMonitor=%@", buf, 0xCu);
  }

  if (v5)
  {
    MEMORY[0x219A07B80](a2);
    v11 = IOIteratorNext(a2);
    if (v11)
    {
      v13 = v11;
      v14 = MEMORY[0x24BDACB70];
      *(_QWORD *)&v12 = 134218240;
      v27 = v12;
      do
      {
        if (*((_DWORD *)v5 + 11) == v13)
        {
          v15 = v5;
          v16 = *((_DWORD *)v5 + 11);
          if (v16)
          {
            IOObjectRelease(v16);
            *((_DWORD *)v5 + 11) = 0;
            v17 = *((_DWORD *)v5 + 10);
            if (v17)
            {
              IOObjectRelease(v17);
              *((_DWORD *)v5 + 10) = 0;
            }
            objc_msgSend(*((id *)v5 + 1), "removeAllObjects", v27);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
            v18 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)v5 + 2), "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19
              || (v20 = objc_msgSend(v15, "getFaultState:", 2), v20 != objc_msgSend(v19, "BOOLValue")))
            {
              objc_msgSend(v15, "sendUSBFaultNotification");
            }

          }
          else
          {
            v21 = gLogObjects;
            v22 = gNumLogObjects;
            if (gLogObjects)
              v23 = gNumLogObjects < 1;
            else
              v23 = 1;
            if (v23)
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v27;
                v29 = v21;
                v30 = 1024;
                v31 = v22;
                _os_log_error_impl(&dword_2171EA000, v14, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v24 = v14;
              v18 = v14;
            }
            else
            {
              v18 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v25 = *((_DWORD *)v5 + 11);
              *(_DWORD *)buf = 67109120;
              LODWORD(v29) = v25;
              _os_log_error_impl(&dword_2171EA000, v18, OS_LOG_TYPE_ERROR, "ERROR: Class instance == NULL or _ioUSBCardReaderService(0x%x) = NULL !\n", buf, 8u);
            }
          }

        }
        IOObjectRelease(v13);
        v13 = IOIteratorNext(a2);
      }
      while (v13);
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v5 = (id)MEMORY[0x24BDACB70];
      v26 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      __CardReaderClassMatch_cold_1();
  }

}

void __USBCardReaderInterest(_DWORD *a1, uint64_t a2, int a3)
{
  void *v6;
  _DWORD *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  int v16;
  _DWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[IAPUIDManager sharedIAPUIDManager](IAPUIDManager, "sharedIAPUIDManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_DWORD *)objc_msgSend(v6, "objectForIAPUID:", a1);

  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v16 = 134217984;
    v17 = a1;
    _os_log_impl(&dword_2171EA000, v10, OS_LOG_TYPE_INFO, "uidForNotification = %lu", (uint8_t *)&v16, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v7;
    _os_log_impl(&dword_2171EA000, v11, OS_LOG_TYPE_INFO, "pUSBMonitor=%@", (uint8_t *)&v16, 0xCu);
  }

  if (!v7 || !v7[11])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __USBCardReaderInterest_cold_1();
    goto LABEL_32;
  }
  if (!(_DWORD)a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v13 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __USBCardReaderInterest_cold_3();
LABEL_32:

    goto LABEL_33;
  }
  if (a3 == -413532160)
    objc_msgSend(v7, "checkUSBCardReaderProperty:", a2);
LABEL_33:

}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

uint64_t __USBCameraKitHubGetPortCurAllocation(uint64_t entry)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v5;
  id v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  int v11;
  int v12;
  io_registry_entry_t object;
  io_registry_entry_t child;
  unsigned int valuePtr;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  io_registry_entry_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v1 = entry;
  v24 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)entry)
  {
    child = -1431655766;
    if (IORegistryEntryGetChildEntry(entry, "IOService", &child))
    {
      return 0;
    }
    else
    {
      +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      object = -1431655766;
      if (IORegistryEntryGetChildEntry(child, "IOService", &object))
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v3 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          v3 = MEMORY[0x24BDACB70];
          v6 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          v7 = objc_msgSend(v2, "ioUSB30CameraKitHubService");
          valuePtr = 67109888;
          if (v7 == (_DWORD)v1)
            v8 = 2;
          else
            v8 = 3;
          v17 = v1;
          v18 = 1024;
          v19 = v8;
          v20 = 1024;
          v21 = child;
          v22 = 1024;
          v23 = 0;
          _os_log_impl(&dword_2171EA000, v3, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubGetPortCurAllocation: failed to get child kIOUSBPlane, service=%d(%d) child=%d, result=%d", (uint8_t *)&valuePtr, 0x1Au);
        }

        v1 = 0;
      }
      else
      {
        CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(child, CFSTR("kUSBBusCurrentAllocation"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
        if (CFProperty)
        {
          v5 = CFProperty;
          valuePtr = -1431655766;
          CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
          v1 = valuePtr;
          CFRelease(v5);
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v9 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              __29__SleepAssertionManager_init__block_invoke_cold_1();
            v9 = MEMORY[0x24BDACB70];
            v10 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v11 = objc_msgSend(v2, "ioUSB30CameraKitHubService");
            valuePtr = 67109888;
            if (v11 == (_DWORD)v1)
              v12 = 2;
            else
              v12 = 3;
            v17 = v1;
            v18 = 1024;
            v19 = v12;
            v20 = 1024;
            v21 = child;
            v22 = 1024;
            v23 = 0;
            _os_log_impl(&dword_2171EA000, v9, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubGetPortCurAllocation: failed to get kUSBBusCurrentAllocation, service=%d(%d) child=%d usbCurAllocRef=%x", (uint8_t *)&valuePtr, 0x1Au);
          }

          v1 = 0;
        }
        IOObjectRelease(object);
      }
      IOObjectRelease(child);

    }
  }
  return v1;
}

uint64_t __USBCameraKitHubGetPortFailedRequestedPower(uint64_t entry)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  const __CFNumber *v4;
  const __CFNumber *v5;
  id v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  int v11;
  int v12;
  io_registry_entry_t object;
  io_registry_entry_t child;
  unsigned int valuePtr;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  io_registry_entry_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v1 = entry;
  v24 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)entry)
  {
    child = -1431655766;
    if (IORegistryEntryGetChildEntry(entry, "IOService", &child))
    {
      return 0;
    }
    else
    {
      +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      object = -1431655766;
      if (IORegistryEntryGetChildEntry(child, "IOService", &object))
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v3 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          v3 = MEMORY[0x24BDACB70];
          v6 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          v7 = objc_msgSend(v2, "ioUSB30CameraKitHubService");
          valuePtr = 67109888;
          if (v7 == (_DWORD)v1)
            v8 = 2;
          else
            v8 = 3;
          v17 = v1;
          v18 = 1024;
          v19 = v8;
          v20 = 1024;
          v21 = child;
          v22 = 1024;
          v23 = 0;
          _os_log_impl(&dword_2171EA000, v3, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubGetPortFailedRequestedPower: failed to get child kIOUSBPlane, service=%d(%d) child=%d, result=%d", (uint8_t *)&valuePtr, 0x1Au);
        }

        v1 = 0;
      }
      else
      {
        v4 = (const __CFNumber *)IORegistryEntrySearchCFProperty(child, "IOService", CFSTR("kUSBFailedRequestedPower"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 1u);
        if (v4)
        {
          v5 = v4;
          valuePtr = -1431655766;
          CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
          v1 = valuePtr;
          CFRelease(v5);
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v9 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              __29__SleepAssertionManager_init__block_invoke_cold_1();
            v9 = MEMORY[0x24BDACB70];
            v10 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v11 = objc_msgSend(v2, "ioUSB30CameraKitHubService");
            valuePtr = 67109888;
            if (v11 == (_DWORD)v1)
              v12 = 2;
            else
              v12 = 3;
            v17 = v1;
            v18 = 1024;
            v19 = v12;
            v20 = 1024;
            v21 = child;
            v22 = 1024;
            v23 = 0;
            _os_log_impl(&dword_2171EA000, v9, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubGetPortFailedRequestedPower: failed to get kUSBFailedRequestedPower, service=%d(%d) child=%d usbFailedRequestedPowerRef=%x, expected for normal condition", (uint8_t *)&valuePtr, 0x1Au);
          }

          v1 = 0;
        }
        IOObjectRelease(object);
      }
      IOObjectRelease(child);

    }
  }
  return v1;
}

void __CameraKitHubClassReset(int a1)
{
  void *v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 67109378;
    v9 = a1;
    v10 = 2112;
    v11 = v2;
    _os_log_impl(&dword_2171EA000, v5, OS_LOG_TYPE_INFO, "__CameraKitHubClassReset: pRefcon=%x monitor=%@", (uint8_t *)&v8, 0x12u);
  }

  if (a1 == 3)
  {
    if (objc_msgSend(v2, "ioUSB30CameraKitHubPortService"))
    {
      IOObjectRelease(objc_msgSend(v2, "ioUSB30CameraKitHubPortService"));
      objc_msgSend(v2, "setIoUSB30CameraKitHubPortService:", 0);
    }
    if (objc_msgSend(v2, "ioUSB30CameraKitHubPortNotification"))
    {
      IOObjectRelease(objc_msgSend(v2, "ioUSB30CameraKitHubPortNotification"));
      objc_msgSend(v2, "setIoUSB30CameraKitHubPortNotification:", 0);
    }
    if (objc_msgSend(v2, "ioUSB30CameraKitHubService"))
    {
      IOObjectRelease(objc_msgSend(v2, "ioUSB30CameraKitHubService"));
      objc_msgSend(v2, "setIoUSB30CameraKitHubService:", 0);
    }
    if (objc_msgSend(v2, "ioUSB30CameraKitHubNotification"))
    {
      IOObjectRelease(objc_msgSend(v2, "ioUSB30CameraKitHubNotification"));
      objc_msgSend(v2, "setIoUSB30CameraKitHubNotification:", 0);
    }
    goto LABEL_29;
  }
  if (a1 == 2)
  {
    if (objc_msgSend(v2, "ioUSB20CameraKitHubPortService"))
    {
      IOObjectRelease(objc_msgSend(v2, "ioUSB20CameraKitHubPortService"));
      objc_msgSend(v2, "setIoUSB20CameraKitHubPortService:", 0);
    }
    if (objc_msgSend(v2, "ioUSB20CameraKitHubPortNotification"))
    {
      IOObjectRelease(objc_msgSend(v2, "ioUSB20CameraKitHubPortNotification"));
      objc_msgSend(v2, "setIoUSB20CameraKitHubPortNotification:", 0);
    }
    if (objc_msgSend(v2, "ioUSB20CameraKitHubService"))
    {
      IOObjectRelease(objc_msgSend(v2, "ioUSB20CameraKitHubService"));
      objc_msgSend(v2, "setIoUSB20CameraKitHubService:", 0);
    }
    if (objc_msgSend(v2, "ioUSB20CameraKitHubNotification"))
    {
      IOObjectRelease(objc_msgSend(v2, "ioUSB20CameraKitHubNotification"));
      objc_msgSend(v2, "setIoUSB20CameraKitHubNotification:", 0);
    }
LABEL_29:
    objc_msgSend(v2, "_powerPostCCKHubChangeNotification");
    goto LABEL_39;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 67109120;
    v9 = a1;
    _os_log_impl(&dword_2171EA000, v6, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassReset: ERROR: Invalid pRefCon(%d)", (uint8_t *)&v8, 8u);
  }

LABEL_39:
}

void __CameraKitHubClassMatch(int a1, io_object_t a2)
{
  unsigned __int8 v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  _QWORD v12[4];
  void *v13;
  io_object_t v14;
  _QWORD block[4];
  void *v16;
  io_object_t v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v3 = a1;
  v20 = *MEMORY[0x24BDAC8D0];
  if (a1 == 3)
  {
    +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IOObjectRetain(a2);
    objc_msgSend(v8, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ____CameraKitHubClassMatch_block_invoke_211;
    v12[3] = &unk_24D70BC60;
    v14 = a2;
    v13 = v8;
    v6 = v8;
    dispatch_async(v9, v12);

    v7 = v13;
    goto LABEL_5;
  }
  if (a1 == 2)
  {
    +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IOObjectRetain(a2);
    objc_msgSend(v4, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ____CameraKitHubClassMatch_block_invoke;
    block[3] = &unk_24D70BC60;
    v17 = a2;
    v16 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    v7 = v16;
LABEL_5:

    goto LABEL_16;
  }
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v19 = v3;
    _os_log_impl(&dword_2171EA000, v6, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassMatch: ERROR: invalid pRefCon(%x) !", buf, 8u);
  }
LABEL_16:

}

void __CameraKitHubClassTerminate(uint64_t a1, io_object_t a2)
{
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t v14;
  io_object_t v15;
  _QWORD block[4];
  NSObject *v17;
  uint64_t v18;
  io_object_t v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v21 = a1;
    _os_log_impl(&dword_2171EA000, v7, OS_LOG_TYPE_INFO, "__CameraKitHubClassTerminate: pRefcon=%d", buf, 8u);
  }

  if ((_DWORD)a1 == 3)
  {
    IOObjectRetain(a2);
    objc_msgSend(v4, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ____CameraKitHubClassTerminate_block_invoke_2;
    v12[3] = &unk_24D70BC88;
    v15 = a2;
    v13 = v4;
    v14 = a1;
    dispatch_async(v10, v12);

    v9 = v13;
  }
  else if ((_DWORD)a1 == 2)
  {
    IOObjectRetain(a2);
    objc_msgSend(v4, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ____CameraKitHubClassTerminate_block_invoke;
    block[3] = &unk_24D70BC88;
    v19 = a2;
    v17 = v4;
    v18 = a1;
    dispatch_async(v8, block);

    v9 = v17;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v9 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2171EA000, v9, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassTerminate: ERROR: Invalid pRefCon!", buf, 2u);
    }
  }

}

void __CameraKitHubClassHandleMatch(void *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  kern_return_t v9;
  NSObject *v10;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  id v13;
  NSObject *v14;
  id v15;
  io_object_t notification;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  notification = -1431655766;
  if ((_DWORD)a1 == 3)
  {
    if (objc_msgSend(v2, "ioUSB30CameraKitHubService"))
      goto LABEL_37;
  }
  else if ((_DWORD)a1 == 2 && objc_msgSend(v2, "ioUSB20CameraKitHubService"))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v4 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v18 = 2;
      v19 = 1024;
      v20 = objc_msgSend(v3, "ioUSB20CameraKitHubService");
      _os_log_impl(&dword_2171EA000, v4, OS_LOG_TYPE_INFO, "__CameraKitHubClassHandleMatch: pRefCon=%x ioUSB20CameraKitHubService=%d", buf, 0xEu);
    }

    v9 = IOServiceAddInterestNotification((IONotificationPortRef)objc_msgSend(v3, "ioUSB20CameraKitHubNotifyPort"), objc_msgSend(v3, "ioUSB20CameraKitHubService"), "IOGeneralInterest", (IOServiceInterestCallback)__USBCameraKitHubInterest, a1, &notification);
    objc_msgSend(v3, "setIoUSB20CameraKitHubNotification:", notification);
    if (v9)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v10 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v18 = v9;
        _os_log_impl(&dword_2171EA000, v10, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassHandleMatch: ERROR: couldn't add interest notification %#x", buf, 8u);
      }

    }
    else if (IONotificationPortGetRunLoopSource((IONotificationPortRef)objc_msgSend(v3, "ioUSB20CameraKitHubNotifyPort")))
    {
      Main = CFRunLoopGetMain();
      RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)objc_msgSend(v3, "ioUSB20CameraKitHubNotifyPort"));
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      objc_msgSend(v3, "_powerPostCCKHubChangeNotification");
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v14 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v14 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2171EA000, v14, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassHandleMatch: ERROR: IONotificationPortGetRunLoopSource(ioUSB20CameraKitHubNotifyPort) returned NULL!", buf, 2u);
      }

    }
    __CameraKitHubClassSetupPortNotificationHandlerHelper((uint64_t)a1);
    goto LABEL_37;
  }
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v18 = (int)a1;
    _os_log_impl(&dword_2171EA000, v7, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassHandleMatch: ERROR: Invalid pRefCon(%d)", buf, 8u);
  }

LABEL_37:
}

void __USBCameraKitHubInterest(int a1, int a2, int a3, uint64_t a4)
{
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  int v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a1 != 2 || !objc_msgSend(v8, "ioUSB20CameraKitHubService"))
  {
    if (gLogObjects)
      v11 = gNumLogObjects < 1;
    else
      v11 = 1;
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v13 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    else
    {
      v13 = *(id *)gLogObjects;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v21 = 67109120;
    v22 = a1;
    v14 = "__USBCameraKitHubInterest: ERROR: Invalid pRefCon(%d)";
    v15 = v13;
    v16 = 8;
    goto LABEL_19;
  }
  if (!a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v13 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    LOWORD(v21) = 0;
    v14 = "__USBCameraKitHubInterest: ERROR: service is NULL";
    v15 = v13;
    v16 = 2;
LABEL_19:
    _os_log_impl(&dword_2171EA000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v21, v16);
LABEL_20:

    goto LABEL_21;
  }
  if (a3 == -536854509)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v17 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v21 = 67109376;
      v22 = 2;
      v23 = 1024;
      v24 = a4;
      _os_log_impl(&dword_2171EA000, v17, OS_LOG_TYPE_INFO, "__USBCameraKitHubInterest: received kUSBHostMessageOvercurrentCondition! pRefCon=%d msgArg=%d", (uint8_t *)&v21, 0xEu);
    }

    objc_msgSend(v9, "setOvercurrentSiphoning:", 0);
  }
  else if (a3 == -469794558)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v10 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v21 = 67109376;
      v22 = 2;
      v23 = 1024;
      v24 = a4;
      _os_log_impl(&dword_2171EA000, v10, OS_LOG_TYPE_INFO, "__USBCameraKitHubInterest: received kTotalCamKitCurrentMessage! pRefCon=%d msgArg=%d", (uint8_t *)&v21, 0xEu);
    }

    objc_msgSend(v9, "setIoUSBCameraKitHubTotalCurrent:", a4);
    objc_msgSend(v9, "setIoUSBCameraKitHubCurrentNeedUpdate:", 1);
    objc_msgSend(v9, "_powerPostCCKHubChangeNotification");
  }
LABEL_21:

}

void __CameraKitHubClassSetupPortNotificationHandlerHelper(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_time(0, 100000000);
  objc_msgSend(v2, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ____CameraKitHubClassSetupPortNotificationHandlerHelper_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_after(v3, v4, block);

}

void __USBCameraKitHubPortInterest(int a1, int a2, int a3, int a4)
{
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  int v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a1 == 3)
  {
    if (objc_msgSend(v8, "ioUSB30CameraKitHubPortService"))
      goto LABEL_4;
LABEL_11:
    if (gLogObjects)
      v11 = gNumLogObjects < 1;
    else
      v11 = 1;
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v13 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    else
    {
      v13 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 67109120;
      v20 = a1;
      _os_log_impl(&dword_2171EA000, v13, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubPortInterest: ERROR: Invalid pRefCon(%d)", (uint8_t *)&v19, 8u);
    }

    goto LABEL_46;
  }
  if (a1 != 2 || !objc_msgSend(v8, "ioUSB20CameraKitHubPortService"))
    goto LABEL_11;
LABEL_4:
  if (a2)
  {
    if (a3 != -536870655)
    {
      if (a3 != -536854509)
        goto LABEL_46;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v10 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v19 = 67109376;
        v20 = a1;
        v21 = 1024;
        v22 = a4;
        _os_log_impl(&dword_2171EA000, v10, OS_LOG_TYPE_INFO, "__USBCameraKitHubPortInterest: received kUSBHostMessageOvercurrentCondition! pRefCon=%d msgArg=%d", (uint8_t *)&v19, 0xEu);
      }

      objc_msgSend(v9, "setOvercurrentSiphoning:", 0);
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v17 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = 67109376;
      v20 = a1;
      v21 = 1024;
      v22 = a4;
      _os_log_impl(&dword_2171EA000, v17, OS_LOG_TYPE_INFO, "__USBCameraKitHubPortInterest: received kIOMessageServiceIsAttemptingOpen, pRefCon=%d msgArg=%d", (uint8_t *)&v19, 0xEu);
    }

    objc_msgSend(v9, "setIoUSBCameraKitHubCurrentNeedUpdate:", 1);
    objc_msgSend(v9, "_powerPostCCKHubChangeNotification");
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v14 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_2171EA000, v14, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubPortInterest: ERROR: service is NULL", (uint8_t *)&v19, 2u);
    }

  }
LABEL_46:

}

void __USB30XHCIRemovablePortClassMatch(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  io_object_t v11;
  io_object_t v12;
  NSObject *v13;
  io_object_t v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  NSObject *v18;
  kern_return_t v19;
  kern_return_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  io_service_t v30;
  kern_return_t v31;
  kern_return_t v32;
  uint64_t v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  int v37;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  uint64_t v44;
  int v45;
  NSObject *v46;
  int v47;
  NSObject *v48;
  id v49;
  const __CFString *mode;
  _QWORD block[4];
  NSObject *v52;
  uint8_t v53;
  char v54[15];
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  +[IAPUIDManager sharedIAPUIDManager](IAPUIDManager, "sharedIAPUIDManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "objectForIAPUID:", a1);

  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v56 = a1;
    _os_log_impl(&dword_2171EA000, v8, OS_LOG_TYPE_INFO, "uidForNotification = %lu", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v5;
    _os_log_impl(&dword_2171EA000, v9, OS_LOG_TYPE_INFO, "pUSBMonitor=%@", buf, 0xCu);
  }

  if (v5)
  {
    MEMORY[0x219A07B80](a2);
    v11 = IOIteratorNext(a2);
    if (v11)
    {
      v12 = v11;
      v13 = MEMORY[0x24BDACB70];
      mode = (const __CFString *)*MEMORY[0x24BDBD5A0];
      while (1)
      {
        v14 = *(_DWORD *)(v5 + 36);
        if (v14 == v12)
        {
          v15 = gLogObjects;
          v16 = gNumLogObjects;
          if (gLogObjects)
            v17 = gNumLogObjects < 1;
          else
            v17 = 1;
          if (v17)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v56 = v15;
              v57 = 1024;
              v58 = v16;
              _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v18 = v13;
            v24 = v13;
          }
          else
          {
            v24 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v56) = v12;
            _os_log_error_impl(&dword_2171EA000, v24, OS_LOG_TYPE_ERROR, "Already registered, service=%x", buf, 8u);
          }
          goto LABEL_73;
        }
        if (v14)
          IOObjectRelease(v14);
        *(_DWORD *)(v5 + 36) = v12;
        v19 = IOObjectRetain(v12);
        if (v19)
        {
          v20 = v19;
          v21 = gLogObjects;
          v22 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v23 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v56 = v21;
              v57 = 1024;
              v58 = v22;
              _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v25 = v13;
            v23 = v13;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v56) = v20;
            _os_log_error_impl(&dword_2171EA000, v23, OS_LOG_TYPE_ERROR, "ERROR - IOObjectRetain failed %#x", buf, 8u);
          }

        }
        v24 = (id)v5;
        v26 = gLogObjects;
        v27 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v28 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v56 = v26;
            v57 = 1024;
            v58 = v27;
            _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v29 = v13;
          v28 = v13;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v5;
          _os_log_impl(&dword_2171EA000, v28, OS_LOG_TYPE_INFO, "pUSBMonitor=%@", buf, 0xCu);
        }

        v30 = *(_DWORD *)(v5 + 36);
        if (!v30)
          break;
        v31 = IOServiceAddInterestNotification(*(IONotificationPortRef *)(v5 + 24), v30, "IOGeneralInterest", (IOServiceInterestCallback)__USB30XHCIRemovablePortInterest, *(void **)(v5 + 8), (io_object_t *)(v5 + 32));
        if (v31)
        {
          v32 = v31;
          v33 = gLogObjects;
          v34 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v35 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v56 = v33;
              v57 = 1024;
              v58 = v34;
              _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v40 = v13;
            v35 = v13;
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v56) = v32;
            v41 = v35;
            v42 = "ERROR - Couldn't add interest notification %#x";
            goto LABEL_84;
          }
          goto LABEL_72;
        }
        if (!IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)(v5 + 24)))
        {
          v44 = gLogObjects;
          v45 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v35 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v56 = v44;
              v57 = 1024;
              v58 = v45;
              _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v46 = v13;
            v35 = v13;
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            __USB30XHCIRemovablePortClassMatch_cold_3(&v53, v54, v35);
          goto LABEL_72;
        }
        Main = CFRunLoopGetMain();
        RunLoopSource = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)(v5 + 24));
        CFRunLoopAddSource(Main, RunLoopSource, mode);
LABEL_73:

        IOObjectRelease(v12);
        v12 = IOIteratorNext(a2);
        if (!v12)
          goto LABEL_85;
      }
      v36 = gLogObjects;
      v37 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v35 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v56 = v36;
          v57 = 1024;
          v58 = v37;
          _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v43 = v13;
        v35 = v13;
      }
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        goto LABEL_72;
      v47 = *(_DWORD *)(v5 + 36);
      *(_DWORD *)buf = 67109120;
      LODWORD(v56) = v47;
      v41 = v35;
      v42 = "ERROR: Class instance pUSBMonitor == NULL or _ioUSB30XHCIRemovablePortService(0x%x) = NULL !\n";
LABEL_84:
      _os_log_error_impl(&dword_2171EA000, v41, OS_LOG_TYPE_ERROR, v42, buf, 8u);
LABEL_72:

      goto LABEL_73;
    }
LABEL_85:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ____USB30XHCIRemovablePortClassMatch_block_invoke;
    block[3] = &unk_24D70BBF8;
    v52 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v48 = v52;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v48 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v48 = MEMORY[0x24BDACB70];
      v49 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      __CardReaderClassMatch_cold_1();
  }

}

void __USB30XHCIRemovablePortClassTerminate(void *a1, uint64_t a2)
{
  void *v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  io_object_t v11;
  io_object_t v12;
  NSObject *v13;
  id v14;
  io_object_t v15;
  io_object_t v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  +[IAPUIDManager sharedIAPUIDManager](IAPUIDManager, "sharedIAPUIDManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "objectForIAPUID:", a1);

  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v25 = (uint64_t)a1;
    _os_log_impl(&dword_2171EA000, v8, OS_LOG_TYPE_INFO, "uidForNotification = %lu", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = (uint64_t)v5;
    _os_log_impl(&dword_2171EA000, v9, OS_LOG_TYPE_INFO, "pUSBMonitor=%@", buf, 0xCu);
  }

  if (v5)
  {
    MEMORY[0x219A07B80](a2);
    v11 = IOIteratorNext(a2);
    if (v11)
    {
      v12 = v11;
      v13 = MEMORY[0x24BDACB70];
      do
      {
        if (*((_DWORD *)v5 + 9) == v12)
        {
          v14 = v5;
          v15 = *((_DWORD *)v5 + 9);
          if (v15)
          {
            IOObjectRelease(v15);
            *((_DWORD *)v5 + 9) = 0;
            v16 = *((_DWORD *)v5 + 8);
            if (v16)
            {
              IOObjectRelease(v16);
              *((_DWORD *)v5 + 8) = 0;
              __USB30XHCIRemovablePortActive = 0;
            }
          }
          else
          {
            v17 = gLogObjects;
            v18 = gNumLogObjects;
            if (gLogObjects)
              v19 = gNumLogObjects < 1;
            else
              v19 = 1;
            if (v19)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v25 = v17;
                v26 = 1024;
                v27 = v18;
                _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v20 = v13;
              v21 = v13;
            }
            else
            {
              v21 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = *((_DWORD *)v5 + 9);
              *(_DWORD *)buf = 67109120;
              LODWORD(v25) = v22;
              _os_log_error_impl(&dword_2171EA000, v21, OS_LOG_TYPE_ERROR, "ERROR: Class instance pUSBMonitor == NULL or _ioUSB30XHCIRemovablePortService(0x%x) = NULL !\n", buf, 8u);
            }

          }
        }
        IOObjectRelease(v12);
        v12 = IOIteratorNext(a2);
      }
      while (v12);
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v5 = (id)MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      __USBCardReaderInterest_cold_1();
  }

}

void _HandleUSBConnectChange(void *a1)
{
  id v1;
  int v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  int v10;
  int v11;
  int v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = +[USBCableTypeMonitor usbCableType](USBCableTypeMonitor, "usbCableType");
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 67109376;
    v13 = v2;
    v14 = 1024;
    v15 = __USB30XHCIRemovablePortActive;
    _os_log_impl(&dword_2171EA000, v5, OS_LOG_TYPE_INFO, "cableType=%d RemovablePortActive=%d", (uint8_t *)&v12, 0xEu);
  }

  if ((v2 - 7) < 2)
    v6 = __USB30XHCIRemovablePortActive;
  else
    v6 = 0;
  if ((v2 - 5) < 2)
    v7 = __USB30XHCIRemovablePortActive;
  else
    v7 = 0;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v8 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v8 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if ((v2 - 3) < 2)
      v10 = 1;
    else
      v10 = v6;
    v12 = 67109632;
    v13 = v2;
    v14 = 1024;
    if ((v2 - 1) < 2)
      v11 = 1;
    else
      v11 = v7;
    v15 = v10;
    v16 = 1024;
    v17 = v11;
    _os_log_impl(&dword_2171EA000, v8, OS_LOG_TYPE_INFO, "cableType=%d bCableTypeUSBDevice=%d bCableTypeUSBHost=%d", (uint8_t *)&v12, 0x14u);
  }

  if (v2 && v2 != __usbCableType)
  {
    __usbCableType = v2;
    objc_msgSend(v1, "sendUSBCableTypeChangedNotification");
  }

}

void __USB30XHCIRemovablePortInterest(_DWORD *a1, int a2, int a3, unsigned __int8 a4)
{
  void *v8;
  _DWORD *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD block[4];
  NSObject *v21;
  uint8_t buf[4];
  _DWORD *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  +[IAPUIDManager sharedIAPUIDManager](IAPUIDManager, "sharedIAPUIDManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_DWORD *)objc_msgSend(v8, "objectForIAPUID:", a1);

  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v23 = a1;
    _os_log_impl(&dword_2171EA000, v12, OS_LOG_TYPE_INFO, "uidForNotification = %lu", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v13 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v13 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v9;
    v24 = 1024;
    v25 = a3;
    v26 = 1024;
    v27 = a4;
    _os_log_impl(&dword_2171EA000, v13, OS_LOG_TYPE_INFO, "pUSBMonitor=%@ msgType=%xh msgArg=%hhx", buf, 0x18u);
  }

  if (!v9 || !v9[9])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v15 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __CardReaderClassMatch_cold_1();
    goto LABEL_33;
  }
  if (!a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v15 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __USBCardReaderInterest_cold_3();
    goto LABEL_33;
  }
  if (a3 == -536870384)
  {
    __USB30XHCIRemovablePortActive = 0;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = ____USB30XHCIRemovablePortInterest_block_invoke_2;
    v18[3] = &unk_24D70BBF8;
    v19 = v9;
    dispatch_sync(MEMORY[0x24BDAC9B8], v18);
    v15 = v19;
    goto LABEL_33;
  }
  if (a3 == -536870352)
  {
    __USB30XHCIRemovablePortActive = 1;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ____USB30XHCIRemovablePortInterest_block_invoke;
    block[3] = &unk_24D70BBF8;
    v21 = v9;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
    v15 = v21;
LABEL_33:

  }
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 3, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

uint64_t __mapFamilyCodeToChargingType(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  id v3;
  NSObject *v4;

  v1 = 0xFFFFFFFFLL;
  if (a1 > -536838145)
  {
    switch(a1)
    {
      case -536723456:
        v1 = 10;
        break;
      case -536723455:
      case -536723451:
        break;
      case -536723454:
        v1 = 11;
        break;
      case -536723453:
      case -536723450:
        v1 = 12;
        break;
      case -536723452:
        v1 = 13;
        break;
      case -536723449:
        v1 = 14;
        break;
      case -536723448:
        v1 = 15;
        break;
      default:
        if (a1 == -536838144)
        {
          v1 = 1;
        }
        else if (!a1)
        {
          v1 = 0;
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case -536854528:
      case -536854527:
        v1 = 2;
        break;
      case -536854526:
        v1 = 3;
        break;
      case -536854525:
        v1 = 4;
        break;
      case -536854524:
      case -536854523:
      case -536854522:
        v1 = 5;
        break;
      case -536854521:
        v1 = 6;
        break;
      case -536854520:
        v1 = 7;
        break;
      case -536854519:
        v1 = 8;
        break;
      case -536854518:
        v1 = 9;
        break;
      default:
        break;
    }
  }
  if (gLogObjects)
    v2 = gNumLogObjects < 3;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __mapFamilyCodeToChargingType_cold_1();

  return v1;
}

void __preferenceChangedNotification()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_165);
}

uint64_t __powerBatteryMatch(IONotificationPort **a1, io_iterator_t iterator)
{
  IONotificationPort *v3;
  uint64_t result;
  io_registry_entry_t v5;
  NSObject *v6;
  kern_return_t v7;
  kern_return_t v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  io_object_t notification;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  notification = -1431655766;
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      __powerUpdateBatteryState(v5);
      v7 = IOServiceAddInterestNotification(v3, v5, "IOGeneralInterest", (IOServiceInterestCallback)__powerBatteryInterest, 0, &notification);
      if (v7)
      {
        v8 = v7;
        v9 = gLogObjects;
        v10 = gNumLogObjects;
        if (gLogObjects)
          v11 = gNumLogObjects < 3;
        else
          v11 = 1;
        if (v11)
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v16 = (const char *)v9;
            v17 = 1024;
            v18 = v10;
            _os_log_error_impl(&dword_2171EA000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v12 = v6;
          v13 = v6;
        }
        else
        {
          v13 = *(id *)(gLogObjects + 16);
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v16 = "void __powerBatteryMatch(void *, io_iterator_t)";
          v17 = 1024;
          v18 = v8;
          _os_log_error_impl(&dword_2171EA000, v13, OS_LOG_TYPE_ERROR, "%s IOServiceAddInterestNotification failed: %08x", buf, 0x12u);
        }

      }
      IOObjectRelease(v5);
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

void __SystemPowerCallback(void *a1, uint64_t a2, int a3, intptr_t a4)
{
  id v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  BOOL v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *v23;
  dispatch_time_t v24;
  intptr_t v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  _QWORD block[4];
  id v32;
  uint8_t buf[16];

  v6 = a1;
  switch(a3)
  {
    case -536870144:
      if (gLogObjects)
        v8 = gNumLogObjects < 3;
      else
        v8 = 1;
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v16 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      else
      {
        v16 = *(id *)(gLogObjects + 16);
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2171EA000, v16, OS_LOG_TYPE_DEFAULT, "Received kIOMessageSystemHasPoweredOn", buf, 2u);
      }

      objc_msgSend(v6, "setSystemIsAsleep:", 0);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformSystemPower_SystemHasPoweredOnNotification"), 0, 0);

      break;
    case -536870272:
      if (gLogObjects)
        v10 = gNumLogObjects < 3;
      else
        v10 = 1;
      if (v10)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v18 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      else
      {
        v18 = *(id *)(gLogObjects + 16);
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2171EA000, v18, OS_LOG_TYPE_DEFAULT, "Received kIOMessageSystemWillSleep", buf, 2u);
      }

      objc_msgSend(v6, "setSystemIsAsleep:", 1);
      if (!objc_msgSend(v6, "sleepNotificationsEnabled"))
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = &ACCPlatformSystemPower_SystemWillSleepNotification;
LABEL_40:
        objc_msgSend(v13, "postNotificationName:object:userInfo:", *v15, 0, 0);

        IOAllowPowerChange(objc_msgSend(v6, "systemPowerPort"), a4);
        break;
      }
      objc_msgSend(v6, "clientsPreventingSleepLock");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = ____SystemPowerCallback_block_invoke;
      block[3] = &unk_24D70BBF8;
      v21 = v6;
      v32 = v21;
      dispatch_sync(v19, block);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformSystemPower_SystemWillSleepNotification"), 0, 0);

      objc_msgSend(v21, "sleepSemaphore");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = dispatch_time(0, 2000000000);
      v25 = dispatch_semaphore_wait(v23, v24);

      if (v25)
      {
        if (gLogObjects && gNumLogObjects >= 3)
        {
          v26 = *(id *)(gLogObjects + 16);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          v26 = MEMORY[0x24BDACB70];
          v27 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2171EA000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] sleep notification handling timed out", buf, 2u);
        }

      }
      IOAllowPowerChange(objc_msgSend(v21, "systemPowerPort"), a4);
      objc_msgSend(v21, "clientsPreventingSleepLock");
      v28 = objc_claimAutoreleasedReturnValue();
      v29[0] = v20;
      v29[1] = 3221225472;
      v29[2] = ____SystemPowerCallback_block_invoke_182;
      v29[3] = &unk_24D70BBF8;
      v30 = v21;
      dispatch_sync(v28, v29);

      break;
    case -536870288:
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v7 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v7 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2171EA000, v7, OS_LOG_TYPE_DEFAULT, "Received kIOMessageCanSystemSleep", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = &ACCPlatformSystemPower_SystemCanSleepNotification;
      goto LABEL_40;
  }

}

void ____preferenceChangedNotification_block_invoke()
{
  void *v0;
  uint64_t v1;
  BOOL v2;
  id v3;
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = acc_userDefaultsIapd_copyIntegerForKey((uint64_t)CFSTR("PretendBatteryLevel"));
  if (gLogObjects)
    v2 = gNumLogObjects < 3;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109376;
    v5[1] = objc_msgSend(v0, "batteryCapacityOverride");
    v6 = 1024;
    v7 = v1;
    _os_log_impl(&dword_2171EA000, v4, OS_LOG_TYPE_INFO, "Logging preferences changed! (pretendBatteryLevel): %d -> %d", (uint8_t *)v5, 0xEu);
  }

  objc_msgSend(v0, "setBatteryCapacityOverride:", v1);
  objc_msgSend(v0, "_checkAndSendNotificationForOldConnected:oldIsBatteryCharging:oldBatteryChargeLevelPercent:oldBatteryChargingType:oldBatteryChargingTypeExt:overrideChanged:", objc_msgSend(v0, "isExternalChargerConnected"), objc_msgSend(v0, "isBatteryCharging"), objc_msgSend(v0, "batteryChargeLevelPercent"), objc_msgSend(v0, "batteryChargingType"), objc_msgSend(v0, "batteryChargingTypeExternal"), 1);

}

void __powerUpdateBatteryState(io_registry_entry_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  properties = 0;
  if (!IORegistryEntryCreateCFProperties(a1, &properties, 0, 0))
  {
    +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v1, "batteryCapacity");
    v32 = objc_msgSend(v1, "batteryCapacityMax");
    v2 = objc_msgSend(v1, "isExtChargerConnected");
    v3 = objc_msgSend(v1, "isBatteryCharging");
    v4 = objc_msgSend(v1, "batteryChargeLevelPercent");
    v5 = objc_msgSend(v1, "batteryChargingType");
    v6 = objc_msgSend(v1, "batteryChargingTypeExternal");
    -[__CFDictionary objectForKey:](properties, "objectForKey:", CFSTR("CurrentCapacity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setBatteryCapacity:", objc_msgSend(v7, "intValue"));

    -[__CFDictionary objectForKey:](properties, "objectForKey:", CFSTR("MaxCapacity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setBatteryCapacityMax:", objc_msgSend(v8, "intValue"));

    -[__CFDictionary objectForKey:](properties, "objectForKey:", CFSTR("ExternalConnected"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setIsExtChargerConnected:", objc_msgSend(v9, "BOOLValue"));

    -[__CFDictionary objectForKey:](properties, "objectForKey:", CFSTR("IsCharging"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setIsBatteryCharging:", objc_msgSend(v10, "BOOLValue"));

    if (objc_msgSend(v1, "isBatteryCharging"))
    {
      if (objc_msgSend(v1, "isExtChargerConnected"))
      {
        v11 = objc_msgSend(v1, "batteryCapacity");
        if (v11 == objc_msgSend(v1, "batteryCapacityMax"))
          objc_msgSend(v1, "setIsBatteryCharging:", 0);
      }
    }
    objc_msgSend(v1, "setBatteryChargeLevelPercent:", ((int)(100 * objc_msgSend(v1, "batteryCapacity")) / (int)objc_msgSend(v1, "batteryCapacityMax")));
    objc_msgSend(v1, "setBatteryChargingType:", 0xFFFFFFFFLL);
    -[__CFDictionary objectForKey:](properties, "objectForKey:", CFSTR("AdapterDetails"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("FamilyCode"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        objc_msgSend(v1, "setBatteryChargingType:", __mapFamilyCodeToChargingType(objc_msgSend(v14, "longLongValue")));

    }
    v35 = v13;
    objc_msgSend(v1, "setBatteryChargingTypeExternal:", 0xFFFFFFFFLL);
    -[__CFDictionary objectForKey:](properties, "objectForKey:", CFSTR("DownstreamAdapterFamily"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (uint64_t)v16;
    if (v16)
      objc_msgSend(v1, "setBatteryChargingTypeExternal:", __mapFamilyCodeToChargingType(objc_msgSend(v16, "longLongValue")));
    v34 = (void *)v17;
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v18 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __powerUpdateBatteryState_cold_2(v17, (uint64_t)v35, v18);

    if (gLogObjects && gNumLogObjects >= 3)
    {
      v20 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v20 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v31 = objc_msgSend(v1, "isExtChargerConnected");
      v30 = objc_msgSend(v1, "isBatteryCharging");
      v29 = objc_msgSend(v1, "batteryCapacity");
      v22 = v4;
      v23 = objc_msgSend(v1, "batteryCapacityMax");
      v24 = v5;
      v25 = objc_msgSend(v1, "batteryChargeLevelPercent");
      v26 = v6;
      v27 = objc_msgSend(v1, "batteryChargingType");
      v28 = objc_msgSend(v1, "batteryChargingTypeExternal");
      *(_DWORD *)buf = 67112448;
      v38 = v2;
      v39 = 1024;
      v40 = v31;
      v41 = 1024;
      v42 = v3;
      v43 = 1024;
      v44 = v30;
      v45 = 1024;
      v46 = v33;
      v47 = 1024;
      v48 = v29;
      v49 = 1024;
      v50 = v32;
      v51 = 1024;
      v52 = v23;
      v4 = v22;
      v53 = 1024;
      v54 = v22;
      v55 = 1024;
      v56 = v25;
      v5 = v24;
      v57 = 1024;
      v58 = v24;
      v59 = 1024;
      v60 = v27;
      v6 = v26;
      v61 = 1024;
      v62 = v26;
      v63 = 1024;
      v64 = v28;
      _os_log_impl(&dword_2171EA000, v20, OS_LOG_TYPE_INFO, "handle battery state update: isExtChg=%u->%u, isBChg%u->%u, bCap=%u->%u, bCapMax=%u->%u, bCLP=%u->%u, chgType=%d->%d, chgTypeExt=%d->%d", buf, 0x56u);
    }

    objc_msgSend(v1, "_checkAndSendNotificationForOldConnected:oldIsBatteryCharging:oldBatteryChargeLevelPercent:oldBatteryChargingType:oldBatteryChargingTypeExt:overrideChanged:", v2, v3, v4, v5, v6, 0);
    CFRelease(properties);

  }
}

void __powerBatteryInterest(uint64_t a1, io_registry_entry_t a2, int a3)
{
  if (a3 == -536723200)
    __powerUpdateBatteryState(a2);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1)
    dispatch_once(&init_logging_modules_onceToken, block);
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &loc_2171F9000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_2171EA000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_2171EA000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_2171EA000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = (_QWORD *)&loc_2171F9000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v2[498];
    LODWORD(v13) = v5;
    _os_log_impl(&dword_2171EA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(_QWORD *)(a1 + 40);
  gNumLogObjects = v11;
}

uint64_t acc_userDefaults_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", a1);

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", a1);
  v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", a2, a1);

}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a2, a1);

}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", a1, a2);

}

uint64_t acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", a1);

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", a1);
  v4 = v3;

  return v4;
}

uint64_t acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsLogging](ACCUserDefaults, "sharedDefaultsLogging");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_2171EA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void __CardReaderClassMatch_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2171EA000, v0, v1, "ERROR: Class instance pUSBMonitor = nil !\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __CardReaderClassMatch_cold_3(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2171EA000, log, OS_LOG_TYPE_ERROR, "ERROR - IONotificationPortGetRunLoopSource(pUSBMonitor->_ioUSBCardReaderNotifyPort) returned NULL!", buf, 2u);
}

void __USBCardReaderInterest_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2171EA000, v0, v1, "ERROR: Class instance pUSBMonitor = NULL !\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __USBCardReaderInterest_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2171EA000, v0, v1, "ERROR - service is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __USB30XHCIRemovablePortClassMatch_cold_3(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2171EA000, log, OS_LOG_TYPE_ERROR, "ERROR - IONotificationPortGetRunLoopSource(pUSBMonitor->_ioUSB30XHCIRemovablePortNotifyPort) returned NULL!", buf, 2u);
}

void __mapFamilyCodeToChargingType_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_2171EA000, v0, OS_LOG_TYPE_DEBUG, "familyCode to charging type: %llx -> %d", v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __powerUpdateBatteryState_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_debug_impl(&dword_2171EA000, log, OS_LOG_TYPE_DEBUG, "handle battery state update: adapterFamily = %@, adapterDetails = %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_2171EA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
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

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x24BDD7EA8](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x24BDD7FC8](notifier);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
  MEMORY[0x24BDD8670](*(_QWORD *)&iterator);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8688](*(_QWORD *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x24BDD8720](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x24BDD8888](refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x24BDD88C8](*(_QWORD *)&entry, plane, child);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return MEMORY[0x24BDD8940](*(_QWORD *)&mainPort);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

