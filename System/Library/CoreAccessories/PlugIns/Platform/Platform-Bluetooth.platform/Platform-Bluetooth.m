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
  uint64_t (*__ptr32 *v2)();
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
  v2 = &off_21688C000;
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
          _os_log_error_impl(&dword_216886000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
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
          _os_log_debug_impl(&dword_216886000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_216886000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_21688C000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 57);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_216886000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(_QWORD *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

id logObjectForModule()
{
  BOOL v0;
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    v1 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v1)
      logObjectForModule_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    v10 = (id)MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  return v10;
}

void _AttachToBTServer(void *a1)
{
  id v1;
  BOOL v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t v11[4];
  int v12;
  uint8_t buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v1;
    _os_log_impl(&dword_216886000, v4, OS_LOG_TYPE_INFO, "_AttachToBTServer object=%@", buf, 0xCu);
  }

  if ((objc_msgSend(v1, "btUpdatesStarted") & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v1;
      _os_log_impl(&dword_216886000, v5, OS_LOG_TYPE_INFO, "btUpdates NOT Started, object=%@", buf, 0xCu);
    }
  }
  else
  {
    *(_QWORD *)buf = _BTSessionCallback;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.iaptransportd-%d"), getpid());
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[NSObject cStringUsingEncoding:](v5, "cStringUsingEncoding:", 4);
    objc_msgSend(v1, "btEventQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = BTSessionAttachWithQueue();

    if (v7)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
        v8 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 67109120;
        v12 = v7;
        _os_log_impl(&dword_216886000, v8, OS_LOG_TYPE_DEFAULT, "ERROR - failed attaching to BT server, result=%d", v11, 8u);
      }

      objc_msgSend(v1, "setBtSession:", 0);
    }
    else
    {
      objc_msgSend(v1, "setBtUpdatesStarted:", 1);
    }
  }

}

unint64_t _BTGetAccessoryManager(uint64_t a1)
{
  BOOL v1;
  id v2;
  BOOL v3;
  id v4;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  uint8_t buf[2];
  unint64_t v11;

  v11 = 0xAAAAAAAAAAAAAAAALL;
  if (!a1)
  {
    if (gLogObjects)
      v3 = gNumLogObjects < 1;
    else
      v3 = 1;
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)gLogObjects;
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v7 = "Error - NULL BT session";
    v8 = buf;
    goto LABEL_24;
  }
  if (!BTAccessoryManagerGetDefault())
    return v11;
  if (gLogObjects)
    v1 = gNumLogObjects < 1;
  else
    v1 = 1;
  if (v1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v2 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 0;
    v7 = "Error - Failed to get BT Accessory Manager";
    v8 = (uint8_t *)&v9;
LABEL_24:
    _os_log_impl(&dword_216886000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
  }
LABEL_25:

  return 0;
}

uint64_t _BTGetDevice(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  NSObject *v18;
  id v19;
  const char *v21;
  id v22;
  uint8_t v23[4];
  int v24;
  __int16 v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = v7;
  v27 = 0xAAAAAAAAAAAAAAAALL;
  v28 = 0;
  v26 = -1431655766;
  v25 = -21846;
  v24 = -1431655766;
  v29 = 0;
  if (a1 && a2 && v7 && a4)
  {
    objc_msgSend(v7, "name");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "UTF8String");

    objc_msgSend(v8, "macAddr");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getBytes:length:", &v24, 6);

    if (BTLocalDeviceGetDefault())
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
        v11 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        goto LABEL_39;
      *(_WORD *)v23 = 0;
      v17 = "Error - Failed to get local BT device";
LABEL_38:
      _os_log_impl(&dword_216886000, v11, OS_LOG_TYPE_INFO, v17, v23, 2u);
LABEL_39:

      v15 = 1;
      goto LABEL_40;
    }
    if (BTLocalDeviceGetModulePower())
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
        v11 = MEMORY[0x24BDACB70];
        v19 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        goto LABEL_39;
      *(_WORD *)v23 = 0;
      v17 = "Error - Failed to get local BT device power status";
      goto LABEL_38;
    }
    if (BTAccessoryManagerRegisterDevice())
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v18 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
        v18 = MEMORY[0x24BDACB70];
        v22 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        goto LABEL_50;
      *(_WORD *)v23 = 0;
      v21 = "Error - Failed to get device.";
    }
    else
    {
      if (v26 == -1)
      {
        v15 = 0;
        goto LABEL_40;
      }
      logObjectForModule();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        goto LABEL_50;
      *(_WORD *)v23 = 0;
      v21 = "Error - Bluetooth is not enabled.";
    }
    _os_log_impl(&dword_216886000, v18, OS_LOG_TYPE_INFO, v21, v23, 2u);
LABEL_50:

    v15 = 0;
    *a4 = 0;
    goto LABEL_40;
  }
  if (gLogObjects)
    v12 = gNumLogObjects < 1;
  else
    v12 = 1;
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  else
  {
    v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_216886000, v14, OS_LOG_TYPE_INFO, "Error - NULL parameter", v23, 2u);
  }

  v15 = 3;
LABEL_40:

  return v15;
}

void __notifyComponentStatus(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint8_t v13[8];
  unint64_t v14;
  int v15;
  __int16 v16;
  int v17;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (v5 && v6)
  {
    v17 = 0;
    objc_msgSend(v6, "macAddr");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && (a3 & 1) == 0)
    {
      v16 = -21846;
      v15 = -1431655766;
      objc_msgSend(v7, "macAddr");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getBytes:length:", &v15, 6);

      v14 = 0xAAAAAAAAAAAAAAAALL;
      if (!objc_msgSend(v5, "btSession") || BTDeviceFromAddress())
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v10 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
          v10 = MEMORY[0x24BDACB70];
          v11 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_216886000, v10, OS_LOG_TYPE_DEFAULT, "ERROR - BTDeviceFromAddress failed.", v13, 2u);
        }
        goto LABEL_18;
      }
      if (BTDeviceGetConnectedServices())
        v17 = 0;
    }
    objc_msgSend(v7, "accessoryUID");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _sendBluetoothConnectionStatusNotification(v10, v12, v17);

LABEL_18:
  }

}

void _sendBluetoothConnectionStatusNotification(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _DWORD v28[2];
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if ((a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v13);

  if ((a3 & 8) == 0)
  {
LABEL_4:
    if ((a3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v14);

  if ((a3 & 0x10) == 0)
  {
LABEL_5:
    if ((a3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v15);

  if ((a3 & 0x20) == 0)
  {
LABEL_6:
    if ((a3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v16);

  if ((a3 & 0x40) == 0)
  {
LABEL_7:
    if ((a3 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v17);

  if ((a3 & 0x80) == 0)
  {
LABEL_8:
    if ((a3 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v18);

  if ((a3 & 0x100) == 0)
  {
LABEL_9:
    if ((a3 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v19);

  if ((a3 & 0x200) == 0)
  {
LABEL_10:
    if ((a3 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v20);

  if ((a3 & 0x400) == 0)
  {
LABEL_11:
    if ((a3 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v21);

  if ((a3 & 0x800) == 0)
  {
LABEL_12:
    if ((a3 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v22);

  if ((a3 & 0x1000) == 0)
  {
LABEL_13:
    if ((a3 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v23);

  if ((a3 & 0x2000) == 0)
  {
LABEL_14:
    if ((a3 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v24);

  if ((a3 & 0x4000) == 0)
  {
LABEL_15:
    if ((a3 & 0x8000) == 0)
      goto LABEL_16;
LABEL_35:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v26);

    if ((a3 & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v25);

  if ((a3 & 0x8000) != 0)
    goto LABEL_35;
LABEL_16:
  if ((a3 & 0x10000) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
LABEL_18:
  objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("ACCBluetoothStatusComponentUpdateInfoAccessoryUID"));
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("ACCBluetoothStatusComponentUpdateInfoUID"));
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("ACCBluetoothStatusComponentUpdateInfoProfiles"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("ACCBluetoothStatusComponentUpdateNotification"), 0, v7);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v27 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v28[0] = 67109890;
    v28[1] = a3;
    v29 = 1024;
    v30 = 131067;
    v31 = 2112;
    v32 = v5;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_216886000, v11, OS_LOG_TYPE_DEFAULT, "BluetoothConnectionStatusNotification: service mask 0x%04X(0x%04X), accessoryUID: %@, componentUID: %@", (uint8_t *)v28, 0x22u);
  }

}

void _BTSessionCallback(uint64_t a1, int a2, int a3, void *a4)
{
  BOOL v5;
  id v6;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  const char *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  BOOL v25;
  id v26;
  NSObject *v27;
  uint8_t v28[16];
  uint8_t v29[16];
  unint64_t v30;
  unint64_t v31;
  uint8_t buf[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (gLogObjects)
      v5 = gNumLogObjects < 1;
    else
      v5 = 1;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a3;
      _os_log_impl(&dword_216886000, v11, OS_LOG_TYPE_DEFAULT, "ERROR - called with a BTResult of %d", buf, 8u);
    }
    goto LABEL_50;
  }
  v11 = a4;
  if (gLogObjects)
    v9 = gNumLogObjects < 1;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_216886000, v12, OS_LOG_TYPE_INFO, "_BTSessionCallback object=%@", buf, 0xCu);
  }

  if (a2 == 2)
  {
    -[NSObject setBtSession:](v11, "setBtSession:", 0);
    -[NSObject iterateRegisteredComponentsForKnownAddresses:allOFF:](v11, "iterateRegisteredComponentsForKnownAddresses:allOFF:", 0, 1);
    _AttachToBTServer(v11);
    goto LABEL_50;
  }
  if (!a2)
  {
    if (a1)
    {
      -[NSObject setBtSession:](v11, "setBtSession:", a1);
      if (!BTLocalDeviceGetDefault())
      {
        *(_OWORD *)buf = xmmword_24D5BE4F8;
        *(_QWORD *)&v33 = 0;
        BTLocalDeviceAddCallbacks();
      }
      BTServiceAddCallbacks();
      BTAccessoryManagerGetDefault();
      v13 = -[NSObject btSession](v11, "btSession", 0, 0);
      v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v30 = 0xAAAAAAAAAAAAAAAALL;
      v31 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v38 = v15;
      v39 = v15;
      v36 = v15;
      v37 = v15;
      v34 = v15;
      v35 = v15;
      *(_OWORD *)buf = v15;
      v33 = v15;
      if (v13 && !BTLocalDeviceGetDefault())
      {
        if (!BTLocalDeviceGetConnectedDevices())
        {
          v22 = 0;
          while (1)
          {
            memset(v29, 170, 6);
            if (_BTGetMACAddress())
              break;
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v29, 6);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v23);

            if (++v22 >= v30)
              goto LABEL_75;
          }
          if (gLogObjects)
            v25 = gNumLogObjects < 1;
          else
            v25 = 1;
          if (v25)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
            v27 = MEMORY[0x24BDACB70];
            v26 = MEMORY[0x24BDACB70];
          }
          else
          {
            v27 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v28 = 0;
            _os_log_impl(&dword_216886000, v27, OS_LOG_TYPE_DEFAULT, "ERROR - failed getting MAC address for device", v28, 2u);
          }

LABEL_75:
          v20 = v14;
          goto LABEL_43;
        }
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v16 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
          v16 = MEMORY[0x24BDACB70];
          v24 = MEMORY[0x24BDACB70];
        }
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
LABEL_42:

          v20 = 0;
LABEL_43:

          -[NSObject iterateRegisteredComponentsForKnownAddresses:allOFF:](v11, "iterateRegisteredComponentsForKnownAddresses:allOFF:", v20, 0);
          goto LABEL_50;
        }
        *(_WORD *)v29 = 0;
        v19 = "ERROR - failed getting connected BT devices";
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v16 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
          v16 = MEMORY[0x24BDACB70];
          v18 = MEMORY[0x24BDACB70];
        }
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_42;
        *(_WORD *)v29 = 0;
        v19 = "ERROR - failed getting local BT device";
      }
      _os_log_impl(&dword_216886000, v16, OS_LOG_TYPE_DEFAULT, v19, v29, 2u);
      goto LABEL_42;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216886000, v17, OS_LOG_TYPE_DEFAULT, "ERROR - called with a NULL BTSession", buf, 2u);
    }

  }
LABEL_50:

}

void _BTLocalDeviceCallback(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  _BYTE v9[12];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v9 = 138412290;
    *(_QWORD *)&v9[4] = v5;
    _os_log_impl(&dword_216886000, v8, OS_LOG_TYPE_INFO, "_BTLocalDeviceCallback object=%@", v9, 0xCu);
  }

  if (!a2)
  {
    *(_DWORD *)v9 = -1431655766;
    if (BTLocalDeviceGetModulePower())
    {
      *(_DWORD *)v9 = 0;
    }
    else if (*(_DWORD *)v9)
    {
      goto LABEL_16;
    }
    objc_msgSend(v5, "iterateRegisteredComponentsForKnownAddresses:allOFF:", 0, 1, *(_QWORD *)v9);
  }
LABEL_16:

}

void _BTServiceCallback(uint64_t a1, int a2, int a3, int a4, int a5, void *a6)
{
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v10;
    _os_log_impl(&dword_216886000, v13, OS_LOG_TYPE_INFO, "_BTServiceCallback object=%@", (uint8_t *)&v14, 0xCu);
  }

  if (a3 != 1)
  {
    if (a3 || (a2 & 0x1FFFB) == 0 || a4 != 11 || a5)
      goto LABEL_20;
LABEL_19:
    _BTPostConnectionStatus(v10);
    goto LABEL_20;
  }
  if ((a2 & 0x1FFFB) != 0 && a4 == 12)
    goto LABEL_19;
LABEL_20:

}

void _BTPostConnectionStatus(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  __int16 v6;

  v1 = a1;
  v6 = -21846;
  v5 = -1431655766;
  if (!_BTGetMACAddress())
  {
    v2 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v5, 6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "iterateRegisteredComponentsForKnownAddresses:allOFF:", v4, 0);
  }

}

uint64_t _BTGetMACAddress()
{
  uint64_t result;

  result = BTDeviceGetAddressString();
  if (!(_DWORD)result)
    return BTDeviceAddressFromString();
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 3, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
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
  uint64_t (*__ptr32 *v2)();
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
  v2 = &off_21688C000;
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
          _os_log_error_impl(&dword_216886000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
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
          _os_log_debug_impl(&dword_216886000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_216886000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_21688C000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 57);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_216886000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(_QWORD *)(a1 + 40);
  gNumLogObjects = v11;
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_216886000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void logObjectForModule_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_216886000, MEMORY[0x24BDACB70], a3, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_216886000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x24BE66CB8]();
}

uint64_t BTAccessoryManagerPlugInDevice()
{
  return MEMORY[0x24BE66DA8]();
}

uint64_t BTAccessoryManagerRegisterDevice()
{
  return MEMORY[0x24BE66DB8]();
}

uint64_t BTAccessoryManagerUnplugDevice()
{
  return MEMORY[0x24BE66E48]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x24BE66E50]();
}

uint64_t BTDeviceConnect()
{
  return MEMORY[0x24BE66E60]();
}

uint64_t BTDeviceDisconnect()
{
  return MEMORY[0x24BE66E70]();
}

uint64_t BTDeviceFromAddress()
{
  return MEMORY[0x24BE66E78]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x24BE66E88]();
}

uint64_t BTDeviceGetConnectedServices()
{
  return MEMORY[0x24BE66E98]();
}

uint64_t BTDeviceGetName()
{
  return MEMORY[0x24BE66EE0]();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return MEMORY[0x24BE66F90]();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return MEMORY[0x24BE66FC0]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x24BE66FD8]();
}

uint64_t BTLocalDeviceGetModulePower()
{
  return MEMORY[0x24BE66FF8]();
}

uint64_t BTServiceAddCallbacks()
{
  return MEMORY[0x24BE67098]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x24BE670B0]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x24BE670B8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

