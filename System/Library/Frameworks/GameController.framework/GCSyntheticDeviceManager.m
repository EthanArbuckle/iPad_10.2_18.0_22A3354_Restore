@implementation GCSyntheticDeviceManager

- (GCSyntheticDeviceManager)initWithServer:(id)a3
{
  id v6;
  unsigned int *v7;
  dispatch_queue_t v8;
  void *v9;
  mach_port_t v10;
  IONotificationPort *v11;
  const __CFDictionary *v12;
  io_service_t MatchingService;
  ipc_space_t *v14;
  NSObject *v15;
  GCSyntheticDeviceManager *v16;
  uint64_t v18;
  unsigned int *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  __CFDictionary *v24;
  IONotificationPort *v25;
  const __CFDictionary *v26;
  io_object_t *v27;
  NSObject *v28;
  IONotificationPort *v29;
  const __CFDictionary *v30;
  io_object_t *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  unsigned int *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  dispatch_time_t v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  _QWORD v49[4];
  NSObject *v50;
  _QWORD v51[4];
  NSObject *v52;
  _QWORD block[4];
  unsigned int *v54;
  _QWORD v55[4];
  NSObject *v56;
  unsigned int *v57;
  SEL v58;
  int v59;
  objc_super v60;

  v6 = a3;
  v60.receiver = self;
  v60.super_class = (Class)GCSyntheticDeviceManager;
  v7 = -[GCSyntheticDeviceManager init](&v60, sel_init);
  objc_storeStrong((id *)v7 + 1, a3);
  v8 = dispatch_queue_create("SyntheticDeviceManager", 0);
  v9 = (void *)*((_QWORD *)v7 + 2);
  *((_QWORD *)v7 + 2) = v8;

  v10 = *MEMORY[0x24BDD8B18];
  v11 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  *((_QWORD *)v7 + 3) = v11;
  if (!v11)
  {
    getLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[GCSyntheticDeviceManager initWithServer:].cold.1();
    goto LABEL_13;
  }
  IONotificationPortSetDispatchQueue(v11, *((dispatch_queue_t *)v7 + 2));
  v12 = IOServiceMatching("AppleGCResource");
  MatchingService = IOServiceGetMatchingService(v10, v12);
  v7[8] = MatchingService;
  if (!MatchingService)
  {
    getLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[GCSyntheticDeviceManager initWithServer:].cold.2();
    goto LABEL_13;
  }
  v14 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  if (!IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, v7 + 9))
  {
    if (-[GCSyntheticDeviceManager _kernel_open:]((uint64_t)v7, (uint64_t *)v7 + 5))
    {
      getLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[GCSyntheticDeviceManager initWithServer:].cold.9();
      goto LABEL_13;
    }
    if (_os_feature_enabled_impl())
    {
      if (mach_port_allocate(*v14, 1u, v7 + 12))
      {
        if (!gc_isInternalBuild())
        {
          v16 = 0;
          goto LABEL_15;
        }
        getGCLogger();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[GCSyntheticDeviceManager initWithServer:].cold.8();
        goto LABEL_13;
      }
      v18 = v7[12];
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __43__GCSyntheticDeviceManager_initWithServer___block_invoke;
      v55[3] = &unk_24D2B4C80;
      v59 = v18;
      v57 = v7;
      v58 = a2;
      v19 = v7;
      v56 = v19;
      v20 = (void *)MEMORY[0x2199DEBB0](v55);
      v21 = dispatch_mach_create();
      v22 = (void *)*((_QWORD *)v19 + 7);
      *((_QWORD *)v19 + 7) = v21;

      if (!*((_QWORD *)v19 + 7))
      {
        getLogger();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          -[GCSyntheticDeviceManager initWithServer:].cold.3();

        v16 = 0;
        v15 = v56;
        goto LABEL_14;
      }
      dispatch_mach_connect();
      if (MEMORY[0x2199DE19C](v7[9], 1, v18, 0))
      {
        getLogger();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[GCSyntheticDeviceManager initWithServer:].cold.7();

      }
    }
    v24 = IOServiceMatching("IOHIDUserDevice");
    *((_QWORD *)v7 + 8) = v24;
    CFDictionarySetValue(v24, CFSTR("VendorID"), &unk_24D30E140);
    CFDictionarySetValue(*((CFMutableDictionaryRef *)v7 + 8), CFSTR("ProductID"), &unk_24D30E158);
    v25 = (IONotificationPort *)*((_QWORD *)v7 + 3);
    v26 = (const __CFDictionary *)CFRetain(*((CFTypeRef *)v7 + 8));
    v27 = v7 + 18;
    if (IOServiceAddMatchingNotification(v25, "IOServicePublish", v26, (IOServiceMatchingCallback)__onqueue_3PSyntheticControllersChanged, v7, v7 + 18))
    {
      getLogger();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[GCSyntheticDeviceManager initWithServer:].cold.6();

    }
    v29 = (IONotificationPort *)*((_QWORD *)v7 + 3);
    v30 = (const __CFDictionary *)CFRetain(*((CFTypeRef *)v7 + 8));
    v31 = v7 + 19;
    if (IOServiceAddMatchingNotification(v29, "IOServiceTerminate", v30, (IOServiceMatchingCallback)__onqueue_3PSyntheticControllersChanged, v7, v7 + 19))
    {
      getLogger();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[GCSyntheticDeviceManager initWithServer:].cold.5();

    }
    v33 = *v27;
    if ((_DWORD)v33)
    {
      if (*v31)
      {
        __3PSyntheticControllersDrainIterator(v7, v33);
        __3PSyntheticControllersDrainIterator(v7, v7[19]);
LABEL_40:
        v34 = *((_QWORD *)v7 + 2);
        v35 = MEMORY[0x24BDAC760];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __43__GCSyntheticDeviceManager_initWithServer___block_invoke_76;
        block[3] = &unk_24D2B2B20;
        v36 = v7;
        v54 = v36;
        dispatch_async(v34, block);

        LOBYTE(v34) = _os_feature_enabled_impl() ^ 1;
        GCLookupService();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)*((_QWORD *)v36 + 11);
        *((_QWORD *)v36 + 11) = v37;

        GCLookupService();
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)*((_QWORD *)v36 + 13);
        *((_QWORD *)v36 + 13) = v39;

        *((_BYTE *)v36 + 96) = (_BYTE)v34;
        v41 = (void *)*((_QWORD *)v36 + 11);
        if (v41)
        {
          objc_msgSend(v41, "addObserver:forKeyPath:options:context:", v36, CFSTR("enableSyntheticDevices"), 5, 0);
        }
        else
        {
          getLogger();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            -[GCSyntheticDeviceManager initWithServer:].cold.4();

        }
        v42 = *((_QWORD *)v7 + 2);
        v51[0] = v35;
        v51[1] = 3221225472;
        v51[2] = __43__GCSyntheticDeviceManager_initWithServer___block_invoke_78;
        v51[3] = &unk_24D2B2B20;
        v43 = v36;
        v52 = v43;
        dispatch_async(v42, v51);
        v44 = dispatch_time(0, 5000000000);
        v45 = *((_QWORD *)v7 + 2);
        v49[0] = v35;
        v49[1] = 3221225472;
        v49[2] = __43__GCSyntheticDeviceManager_initWithServer___block_invoke_2;
        v49[3] = &unk_24D2B2B20;
        v46 = v43;
        v50 = v46;
        dispatch_after(v44, v45, v49);
        v16 = v46;

        v15 = v52;
        goto LABEL_14;
      }
      IOObjectRelease(*v27);
      *v27 = 0;
    }
    if (*v31)
    {
      IOObjectRelease(*v31);
      *v31 = 0;
    }
    goto LABEL_40;
  }
  getLogger();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[GCSyntheticDeviceManager initWithServer:].cold.10();
LABEL_13:
  v16 = 0;
LABEL_14:

LABEL_15:
  return v16;
}

- (uint64_t)_kernel_open:(uint64_t)result
{
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input;

  if (result)
  {
    output = 0;
    input = 0;
    outputCnt = 1;
    result = IOConnectCallScalarMethod(*(_DWORD *)(result + 36), 0, &input, 1u, &output, &outputCnt);
    if (a2)
      *a2 = output;
  }
  return result;
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  CFTypeRef v10;
  void *v11;
  CFTypeID v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  NSObject *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CFStringRef errorString;
  int v49;
  _BYTE msg[32];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2 != 2)
  {
    if (a2 == 8)
      mach_port_mod_refs(*MEMORY[0x24BDAEC58], *(_DWORD *)(a1 + 56), 1u, -1);
    goto LABEL_38;
  }
  v6 = dispatch_mach_msg_get_msg();
  v7 = v6;
  memset(msg, 0, sizeof(msg));
  v8 = v6 + 20;
  if (*(_DWORD *)(v6 + 20) != 1)
  {
    getLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_8(v8, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_27;
  }
  if ((*(_DWORD *)v6 & 0x80000000) == 0)
  {
    getLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_1();
    goto LABEL_27;
  }
  if (*(_DWORD *)(v6 + 4) != 48)
  {
    getLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_7(v7 + 4, v19, v30, v31, v32, v33, v34, v35);
    goto LABEL_27;
  }
  if (*(_DWORD *)(v6 + 24) != 1)
  {
    getLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_6(v7 + 24, v19, v36, v37, v38, v39, v40, v41);
    goto LABEL_27;
  }
  if (*(_BYTE *)(v6 + 39) != 1 || (v9 = *(const char **)(v6 + 28)) == 0)
  {
    getLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_2();
LABEL_27:

    mach_msg_destroy((mach_msg_header_t *)v7);
    goto LABEL_38;
  }
  v49 = 0;
  errorString = 0;
  v10 = IOCFUnserializeWithSize(v9, *(unsigned int *)(v7 + 40), 0, 0, &errorString);
  v11 = (void *)v10;
  if (v10)
  {
    v12 = CFGetTypeID(v10);
    if (v12 != CFDictionaryGetTypeID())
    {
      CFRelease(v11);
      v11 = 0;
      errorString = CFSTR("ClientAttributes not a CFDictionary");
    }
  }
  MEMORY[0x2199DEEF8](*MEMORY[0x24BDAEC58], *(_QWORD *)(v7 + 28), *(unsigned int *)(v7 + 40));
  if (v11)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "keyEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v45;
LABEL_16:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v17));
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          unk_254DEC4F8(&off_254DEC660, "currentHandler");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("GCSyntheticDeviceManager.m"), 202, CFSTR("Bug in %s"), "-[GCSyntheticDeviceManager initWithServer:]_block_invoke");

        }
        if (-[_GCSyntheticDevice serviceIdentity]((uint64_t)v18) == *(_DWORD *)(v7 + 44))
          break;

        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
          if (v15)
            goto LABEL_16;
          goto LABEL_24;
        }
      }

      if (!v18)
        goto LABEL_30;
      -[GCSyntheticDeviceManager _user_check:device:enabled:](*(_QWORD *)(a1 + 40), v11, v18, &v49);
      v26 = 0;
    }
    else
    {
LABEL_24:

LABEL_30:
      getLogger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_5();
      v26 = 4;
    }

    v27 = v49;
  }
  else
  {
    getLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_4((uint64_t *)&errorString, v28);

    v27 = 0;
    v26 = 4;
  }
  *(_DWORD *)msg = *(_DWORD *)v7 & 0x1F;
  *(_DWORD *)&msg[4] = 32;
  v29 = *(_DWORD *)(v7 + 20);
  *(_DWORD *)&msg[8] = *(_DWORD *)(v7 + 8);
  *(_QWORD *)&msg[20] = __PAIR64__(v26, v29);
  *(_DWORD *)&msg[28] = v27;
  if (mach_msg((mach_msg_header_t *)msg, 17, 0x20u, 0, 0, 0, 0))
  {
    getLogger();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_3();

  }
LABEL_38:

}

- (uint64_t)_user_check:(void *)a3 device:(int *)a4 enabled:
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  os_activity_scope_state_s v20;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = _os_activity_create(&dword_215181000, "[Synthetic Device Manager] Check Process Enabled", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    v20.opaque[0] = 0;
    v20.opaque[1] = 0;
    os_activity_scope_enter(v9, &v20);
    getLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[GCSyntheticDeviceManager _user_check:device:enabled:].cold.1((uint64_t)v8, (uint64_t)v7, v10);

    -[_GCSyntheticDevice persistentIdentifier](v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BundleIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 104), "games");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "gameWithBundleIdentifier:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v15, "controllerToCompatibilityModeMappings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }
      if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BE3A6B8]) & 1) != 0)
      {
        v18 = 2;
LABEL_12:
        *a4 = v18;

LABEL_15:
        os_activity_scope_leave(&v20);

        goto LABEL_16;
      }
      if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BE3A6B0]) & 1) != 0)
      {
        v18 = 0;
        goto LABEL_12;
      }

    }
    *a4 = 0;
    goto LABEL_15;
  }
LABEL_16:

  return 0;
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_76(uint64_t a1)
{
  __onqueue_3PSyntheticControllersScan(*(void **)(a1 + 32));
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_78(uint64_t a1)
{
  -[GCSyntheticDeviceManager _onqueue_refreshSyntheticControllersEnabled](*(_QWORD *)(a1 + 32));
}

- (void)_onqueue_refreshSyntheticControllersEnabled
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_6_0(&dword_215181000, a2, a3, "Disabling synthetic game controllers because %zu third-party synthetic game controllers were found.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5_0();
}

uint64_t __43__GCSyntheticDeviceManager_initWithServer___block_invoke_2(uint64_t a1)
{
  return -[GCSyntheticDeviceManager _kernel_terminateAllDevices:](*(_QWORD *)(a1 + 32), 1);
}

- (uint64_t)_kernel_terminateAllDevices:(uint64_t)result
{
  uint64_t v2;
  uint64_t input;

  if (result)
  {
    if (a2)
      v2 = *(_QWORD *)(result + 40);
    else
      v2 = 0;
    input = v2;
    return IOConnectCallScalarMethod(*(_DWORD *)(result + 36), 4u, &input, 1u, 0, 0);
  }
  return result;
}

- (GCSyntheticDeviceManager)init
{
  -[GCSyntheticDeviceManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  NSMapTable *syntheticDevices;
  GCUserDefaults *defaults;
  GCUserDefaults *v5;
  __CFDictionary *_3pSyntheticControllerMatchingCriteria;
  OS_dispatch_mach *upcallMachChannel;
  objc_super v8;

  if (self->_syntheticDevices)
  {
    -[_GCControllerManagerServer removeObserver:forKeyPath:context:](self->_server, "removeObserver:forKeyPath:context:", self, CFSTR("activeControllerDevices"), 0);
    syntheticDevices = self->_syntheticDevices;
    self->_syntheticDevices = 0;

  }
  defaults = self->_defaults;
  if (defaults)
  {
    -[GCUserDefaults removeObserver:forKeyPath:](defaults, "removeObserver:forKeyPath:", self, CFSTR("enableSyntheticDevices"));
    v5 = self->_defaults;
    self->_defaults = 0;

  }
  IOObjectRelease(self->_3pSyntheticControllerTerminatedNotification);
  self->_3pSyntheticControllerTerminatedNotification = 0;
  IOObjectRelease(self->_3pSyntheticControllerPublishedNotification);
  self->_3pSyntheticControllerPublishedNotification = 0;
  _3pSyntheticControllerMatchingCriteria = self->_3pSyntheticControllerMatchingCriteria;
  if (_3pSyntheticControllerMatchingCriteria)
  {
    CFRelease(_3pSyntheticControllerMatchingCriteria);
    self->_3pSyntheticControllerMatchingCriteria = 0;
  }
  if (self->_upcallMachChannel)
  {
    dispatch_mach_cancel();
    upcallMachChannel = self->_upcallMachChannel;
    self->_upcallMachChannel = 0;

  }
  IOConnectCallScalarMethod(self->_connect, 1u, 0, 0, 0, 0);
  IOServiceClose(self->_connect);
  self->_connect = 0;
  IOObjectRelease(self->_service);
  self->_service = 0;
  v8.receiver = self;
  v8.super_class = (Class)GCSyntheticDeviceManager;
  -[GCSyntheticDeviceManager dealloc](&v8, sel_dealloc);
}

- (uint64_t)_kernel_close
{
  if (result)
    return IOConnectCallScalarMethod(*(_DWORD *)(result + 36), 1u, 0, 0, 0, 0);
  return result;
}

- (id)_onqueue_setupDeviceWithDescription:(void *)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[5];
  os_activity_scope_state_s state;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = _os_activity_create(&dword_215181000, "[Synthetic Device Manager] Setup Kernel Device", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    getLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "debugDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[GCSyntheticDeviceManager _onqueue_setupDeviceWithDescription:].cold.1(v6, (uint64_t)v10, v5);
    }

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__GCSyntheticDeviceManager__onqueue_setupDeviceWithDescription___block_invoke;
    v8[3] = &unk_24D2B4CA8;
    v8[4] = a1;
    +[_GCSyntheticDevice deviceWithDescription:creator:]((uint64_t)_GCSyntheticXbox360Controller, v3, v8);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    os_activity_scope_leave(&state);

  }
  return a1;
}

uint64_t __64__GCSyntheticDeviceManager__onqueue_setupDeviceWithDescription___block_invoke(uint64_t a1, void *a2)
{
  int v2;
  int v3;
  NSObject *v4;
  unsigned int v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v2 = -[GCSyntheticDeviceManager _kernel_createDeviceWithProperties:service:](*(_QWORD *)(a1 + 32), a2, &v6);
  if (!v2)
    return v6;
  v3 = v2;
  getLogger();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = v3;
    _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_DEFAULT, "#KERNEL AppleGCResource create device failed: %{mach.errno}d.", buf, 8u);
  }

  return 0;
}

- (uint64_t)_kernel_createDeviceWithProperties:(_DWORD *)a3 service:
{
  id v5;
  void *v6;
  const __CFData *v7;
  const __CFData *v8;
  mach_port_t v9;
  const UInt8 *BytePtr;
  size_t Length;
  NSObject *v12;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf[16];

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = IOCFSerialize(v5, 0);
    if (v7)
    {
      v8 = v7;
      output = 0;
      outputCnt = 1;
      v9 = *(_DWORD *)(a1 + 36);
      BytePtr = CFDataGetBytePtr(v7);
      Length = CFDataGetLength(v8);
      a1 = IOConnectCallMethod(v9, 2u, 0, 0, BytePtr, Length, &output, &outputCnt, 0, 0);
      if (!(_DWORD)a1)
      {
        if (a3)
          *a3 = output;
        else
          mach_port_deallocate(*MEMORY[0x24BDAEC58], output);
      }
      CFRelease(v8);
    }
    else
    {
      getLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "Serialization failed", buf, 2u);
      }

      a1 = 3758097097;
    }
  }

  return a1;
}

- (void)_onqueue_teardownDevice:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  os_activity_scope_state_s v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v16.opaque[0] = 0;
    v16.opaque[1] = 0;
    v4 = _os_activity_create(&dword_215181000, "[Synthetic Device Manager] Teardown Kernel Device", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v4, &v16);
    getLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[GCSyntheticDeviceManager _onqueue_teardownDevice:].cold.1((uint64_t)v3, v5, v6);

    -[_GCSyntheticDevice identifier](v3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[GCSyntheticDeviceManager _kernel_terminateDeviceWithIdentifier:](a1, v8);
    if (!v9)
      goto LABEL_12;
    v10 = v9;
    if (v9 == -536870208)
    {
      getLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        v12 = "No kernel device with identifier '%@'.";
        v13 = v11;
        v14 = OS_LOG_TYPE_INFO;
        v15 = 12;
LABEL_10:
        _os_log_impl(&dword_215181000, v13, v14, v12, buf, v15);
      }
    }
    else
    {
      getLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = v10;
        v12 = "#KERNEL AppleGCResource terminate device failed: %{mach.errno}d.";
        v13 = v11;
        v14 = OS_LOG_TYPE_DEFAULT;
        v15 = 8;
        goto LABEL_10;
      }
    }

LABEL_12:
    os_activity_scope_leave(&v16);

  }
}

- (uint64_t)_kernel_terminateDeviceWithIdentifier:(uint64_t)a1
{
  uint64_t v2;
  id v3;
  void *v4;
  const __CFData *v5;
  const __CFData *v6;
  mach_port_t v7;
  const UInt8 *BytePtr;
  size_t Length;
  NSObject *v10;
  uint8_t buf[8];
  const __CFString *v13;
  _QWORD v14[2];

  v2 = a1;
  v14[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v13 = CFSTR("_GCSyntheticDeviceIdentifier");
    v14[0] = a2;
    v3 = a2;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = IOCFSerialize(v4, 0);
    if (v5)
    {
      v6 = v5;
      v7 = *(_DWORD *)(v2 + 36);
      BytePtr = CFDataGetBytePtr(v5);
      Length = CFDataGetLength(v6);
      v2 = IOConnectCallMethod(v7, 3u, 0, 0, BytePtr, Length, 0, 0, 0, 0);
      CFRelease(v6);
    }
    else
    {
      getLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_INFO, "Serialization failed", buf, 2u);
      }

      v2 = 3758097097;
    }

  }
  return v2;
}

- (void)_onqueue_setActiveDevices:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v4 = (void *)objc_msgSend(*(id *)(a1 + 112), "copy");
    v5 = v4;
    if (v4)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v4, "keyEnumerator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (v7)
      {
        v8 = v7;
        v9 = sel__onqueue_setActiveDevices_;
        v10 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v32 != v10)
              objc_enumerationMutation(v6);
            v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v3, "member:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
            {
              objc_msgSend(v5, "objectForKey:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v14)
              {
                unk_254DEC4F8(&off_254DEC660, "currentHandler");
                v26 = v9;
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v26, a1, CFSTR("GCSyntheticDeviceManager.m"), 449, CFSTR("Bug in %s"), "-[GCSyntheticDeviceManager _onqueue_setActiveDevices:]");

                v9 = v26;
              }
              -[GCSyntheticDeviceManager _onqueue_teardownDevice:](a1, v14);
              objc_msgSend(*(id *)(a1 + 112), "removeObjectForKey:", v12);

            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
        }
        while (v8);
      }

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v16 = v3;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v28;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v28 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v20);
            objc_msgSend(v5, "objectForKey:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v22)
            {
              objc_msgSend(v21, "makeSyntheticController");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
              {
                -[GCSyntheticDeviceManager _onqueue_setupDeviceWithDescription:]((void *)a1, v23);
                v24 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 112), "setObject:forKey:", v24, v21);
              }
              else
              {
                getLogger();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v36 = v21;
                  _os_log_error_impl(&dword_215181000, v24, OS_LOG_TYPE_ERROR, "%@ did not return a synthetic device description.", buf, 0xCu);
                }
              }

            }
            ++v20;
          }
          while (v18 != v20);
          v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          v18 = v25;
        }
        while (v25);
      }

    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  GCUserDefaults *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *queue;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  objc_super v21;
  _QWORD v22[5];
  _QWORD block[4];
  id v24;
  GCSyntheticDeviceManager *v25;
  os_activity_scope_state_s state;

  v10 = a3;
  v11 = (GCUserDefaults *)a4;
  v12 = a5;
  if ((GCUserDefaults *)self->_server == v11
    && objc_msgSend(v10, "isEqualToString:", CFSTR("activeControllerDevices")))
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v13 = _os_activity_create(&dword_215181000, "[Synthetic Device Manager] 'activeControllerDevices' changed", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v13, &state);
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__GCSyntheticDeviceManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24D2B2B48;
    v24 = v14;
    v25 = self;
    v16 = v14;
    dispatch_async(queue, block);
    os_activity_scope_leave(&state);

  }
  else
  {
    if (self->_defaults != v11 || !objc_msgSend(v10, "isEqualToString:", CFSTR("enableSyntheticDevices")))
    {
      v21.receiver = self;
      v21.super_class = (Class)GCSyntheticDeviceManager;
      -[GCSyntheticDeviceManager observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
      goto LABEL_13;
    }
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v13 = _os_activity_create(&dword_215181000, "[Synthetic Device Manager] Preference changed", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v13, &state);
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    getLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[GCSyntheticDeviceManager observeValueForKeyPath:ofObject:change:context:].cold.1((uint64_t)v17, v18, v19);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->_disabledByPreference = objc_msgSend(v17, "BOOLValue") ^ 1;
    v20 = self->_queue;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __75__GCSyntheticDeviceManager_observeValueForKeyPath_ofObject_change_context___block_invoke_94;
    v22[3] = &unk_24D2B2B20;
    v22[4] = self;
    dispatch_async(v20, v22);
    os_activity_scope_leave(&state);

  }
LABEL_13:

}

void __75__GCSyntheticDeviceManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  +[NSPredicate predicateWithBlock:](&off_254E00828, "predicateWithBlock:", &__block_literal_global_20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[GCSyntheticDeviceManager _onqueue_setActiveDevices:](*(_QWORD *)(a1 + 40), v4);
}

uint64_t __75__GCSyntheticDeviceManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_254DCEA28);
}

void __75__GCSyntheticDeviceManager_observeValueForKeyPath_ofObject_change_context___block_invoke_94(uint64_t a1)
{
  -[GCSyntheticDeviceManager _onqueue_refreshSyntheticControllersEnabled](*(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntheticDevices, 0);
  objc_storeStrong((id *)&self->_settingsStore, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_upcallMachChannel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

- (void)initWithServer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_14(&dword_215181000, v0, v1, "#IOKit notification port creation failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

- (void)initWithServer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_14(&dword_215181000, v0, v1, "#KERNEL 'AppleGCResource' kernel service not found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

- (void)initWithServer:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_14(&dword_215181000, v0, v1, "#Mach channel creation failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

- (void)initWithServer:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_14(&dword_215181000, v0, v1, "Failed to load user defaults.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

- (void)initWithServer:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_15(&dword_215181000, v0, v1, "#IOKit Failed to setup 3rd party synthetic game controller terminated notification: %{mach.errno}d.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

- (void)initWithServer:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_15(&dword_215181000, v0, v1, "#IOKit Failed to setup 3rd party synthetic game controller published notification: %{mach.errno}d.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

- (void)initWithServer:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_15(&dword_215181000, v0, v1, "#IOKit upcall port registration failed: %{mach.errno}d.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

- (void)initWithServer:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_14(&dword_215181000, v0, v1, "#Mach port allocation failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

- (void)initWithServer:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_15(&dword_215181000, v0, v1, "#KERNEL AppleGCResource open failed: %{mach.errno}d.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

- (void)initWithServer:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_15(&dword_215181000, v0, v1, "#KERNEL Connect to 'AppleGCResource' service failed: %{mach.errno}d.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_14(&dword_215181000, v0, v1, "#Mach message received with non-complex bits.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_14(&dword_215181000, v0, v1, "#Mach message received with invalid descriptor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_15(&dword_215181000, v0, v1, "#Mach message reply failed: %{mach.errno}d.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_215181000, a2, OS_LOG_TYPE_ERROR, "#Mach message received with invalid client attributes: %{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_5_0();
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_14(&dword_215181000, v0, v1, "#Mach message received for unknown device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_15(&dword_215181000, a2, a3, "#Mach message received with descriptor count: %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_13();
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_15(&dword_215181000, a2, a3, "#Mach message received with invalid size: %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_13();
}

void __43__GCSyntheticDeviceManager_initWithServer___block_invoke_cold_8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_15(&dword_215181000, a2, a3, "#Mach message received with invalid msgh_id: %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_13();
}

- (void)_user_check:(uint64_t)a1 device:(uint64_t)a2 enabled:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
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
  OUTLINED_FUNCTION_8(&dword_215181000, a3, (uint64_t)a3, "Check %@ enabled: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5_0();
}

- (void)_onqueue_setupDeviceWithDescription:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6_0(&dword_215181000, a3, (uint64_t)a3, "Setup kernel synthetic device with description: %@", (uint8_t *)a2);

}

- (void)_onqueue_teardownDevice:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6_0(&dword_215181000, a2, a3, "Teardown kernel synthetic device: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5_0();
}

- (void)observeValueForKeyPath:(uint64_t)a3 ofObject:change:context:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = CFSTR("enableSyntheticDevices");
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_8(&dword_215181000, a2, a3, "New %{public}@ #preference is %{public}@.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5_0();
}

@end
