id _CDDCurrentActiveComplications()
{
  dispatch_semaphore_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  const __CFString *v19;
  objc_class *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  unint64_t i;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  id v32;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 buf;
  uint64_t v48;
  void *v49;
  uint64_t *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v0 = dispatch_semaphore_create(0);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  v42 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2050000000;
  v1 = (void *)getNRPairedDeviceRegistryClass_softClass;
  v46 = getNRPairedDeviceRegistryClass_softClass;
  v2 = MEMORY[0x1E0C809B0];
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v48 = (uint64_t)__getNRPairedDeviceRegistryClass_block_invoke;
    v49 = &unk_1E98828C8;
    v50 = &v43;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)&buf);
    v1 = (void *)v44[3];
  }
  v3 = objc_retainAutorelease(v1);
  _Block_object_dispose(&v43, 8);
  objc_msgSend(v3, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getActivePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0;
  v44 = &v43;
  v45 = 0x2050000000;
  v6 = (void *)getACXDeviceConnectionClass_softClass;
  v46 = getACXDeviceConnectionClass_softClass;
  if (!getACXDeviceConnectionClass_softClass)
  {
    *(_QWORD *)&buf = v2;
    *((_QWORD *)&buf + 1) = 3221225472;
    v48 = (uint64_t)__getACXDeviceConnectionClass_block_invoke;
    v49 = &unk_1E98828C8;
    v50 = &v43;
    __getACXDeviceConnectionClass_block_invoke((uint64_t)&buf);
    v6 = (void *)v44[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v43, 8);
  objc_msgSend(v7, "sharedDeviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v2;
  v34[1] = 3221225472;
  v34[2] = ___CDDCurrentActiveComplications_block_invoke;
  v34[3] = &unk_1E98828A0;
  v36 = &v37;
  v9 = v0;
  v35 = v9;
  objc_msgSend(v8, "fetchInstalledApplicationsForPairedDevice:completion:", v5, v34);

  v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v9, v10);
  v11 = v5;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x2020000000;
  v12 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
  v49 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
  if (!getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr)
  {
    v13 = (void *)NanoRegistryLibrary();
    v12 = dlsym(v13, "NRWatchOSVersionForRemoteDevice");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v12;
    getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = v12;
  }
  _Block_object_dispose(&buf, 8);
  if (!v12)
    goto LABEL_30;
  v14 = ((uint64_t (*)(id))v12)(v11);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x2020000000;
  v15 = getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr;
  v49 = getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr;
  if (!getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr)
  {
    v16 = (void *)NanoRegistryLibrary();
    v15 = dlsym(v16, "NRVersionIsGreaterThanOrEqual");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v15;
    getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr = v15;
  }
  _Block_object_dispose(&buf, 8);
  if (!v15)
  {
LABEL_30:
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v17 = ((uint64_t (*)(uint64_t, uint64_t))v15)(v14, 0x40000);
  v43 = 0;
  v44 = &v43;
  v45 = 0x2050000000;
  v18 = (void *)getNPSDomainAccessorClass_softClass;
  v46 = getNPSDomainAccessorClass_softClass;
  if (!getNPSDomainAccessorClass_softClass)
  {
    *(_QWORD *)&buf = v2;
    *((_QWORD *)&buf + 1) = 3221225472;
    v48 = (uint64_t)__getNPSDomainAccessorClass_block_invoke;
    v49 = &unk_1E98828C8;
    v50 = &v43;
    __getNPSDomainAccessorClass_block_invoke((uint64_t)&buf);
    v18 = (void *)v44[3];
  }
  if (v17)
    v19 = CFSTR("CLKActiveComplications");
  else
    v19 = CFSTR("activeComplications");
  v20 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v43, 8);
  v21 = [v20 alloc];
  if (v17)
    v22 = CFSTR("com.apple.ClockKit.activeComplications");
  else
    v22 = CFSTR("com.apple.sockpuppet.activeComplications");
  v23 = (void *)objc_msgSend(v21, "initWithDomain:pairedDevice:", v22, v11);
  v24 = (id)objc_msgSend(v23, "synchronize");
  objc_msgSend(v23, "objectForKey:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i < objc_msgSend(v25, "count"); ++i)
  {
    objc_msgSend(v25, "objectAtIndex:", i);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isEqualToString:", &stru_1E9882990) & 1) == 0)
    {
      objc_msgSend((id)v38[5], "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (!v29
        || (objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("SPContainerAppBundleId")),
            (v31 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v31 = &stru_1E9882990;
      }
      objc_msgSend(v26, "addObject:", v31);

    }
  }
  v32 = v26;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v32;
    _os_log_impl(&dword_1D4D20000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "New list of active complications: %@\n", (uint8_t *)&buf, 0xCu);
  }

  _Block_object_dispose(&v37, 8);
  return v32;
}

void sub_1D4D21208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

const __CFString *_CDDComplicationChangeNotificationString()
{
  return CFSTR("com.apple.sockpuppet.complications.updated");
}

const __CFString *_CDDComplicationChangeOverCloudNotificationString()
{
  return CFSTR("com.apple.ClockKit.activeComplicationsChangedNotification");
}

uint64_t _CDDExtensionIdForCompanionBundle()
{
  return 0;
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!NanoRegistryLibraryCore_frameworkLibrary)
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("NRPairedDeviceRegistry");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getNRPairedDeviceRegistryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getACXDeviceConnectionClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!AppConduitLibraryCore_frameworkLibrary)
    AppConduitLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("ACXDeviceConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getACXDeviceConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoRegistryLibrary()
{
  uint64_t v0;
  void *v2;

  if (!NanoRegistryLibraryCore_frameworkLibrary)
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = NanoRegistryLibraryCore_frameworkLibrary;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getNPSDomainAccessorClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("NPSDomainAccessor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getNPSDomainAccessorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getNPSDomainAccessorClass_block_invoke_cold_1()
{
  const void *v0;
  int v1;

  v0 = (const void *)abort_report_np();
  _Block_object_dispose(v0, v1);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

