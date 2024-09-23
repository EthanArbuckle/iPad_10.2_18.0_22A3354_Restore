void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t mapNRGIconVariantToLI(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (mapNRGIconVariantToLI_onceToken != -1)
    dispatch_once(&mapNRGIconVariantToLI_onceToken, &__block_literal_global);
  v2 = (void *)mapNRGIconVariantToLI_nrgToLIMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (!(_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "LIIconVariant mapNRGIconVariantToLI(NRGIconVariant)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NRGProtocols.m"), 39, CFSTR("unknown icon variant %@ generated from %@"), v9, v10);

  }
  return v5;
}

void __mapNRGIconVariantToLI_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];
  _QWORD v3[17];

  v3[16] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24CBE3AA0;
  v2[1] = &unk_24CBE3AD0;
  v3[0] = &unk_24CBE3AB8;
  v3[1] = &unk_24CBE3AE8;
  v2[2] = &unk_24CBE3B00;
  v2[3] = &unk_24CBE3B30;
  v3[2] = &unk_24CBE3B18;
  v3[3] = &unk_24CBE3B48;
  v2[4] = &unk_24CBE3B60;
  v2[5] = &unk_24CBE3B90;
  v3[4] = &unk_24CBE3B78;
  v3[5] = &unk_24CBE3BA8;
  v2[6] = &unk_24CBE3BC0;
  v2[7] = &unk_24CBE3BF0;
  v3[6] = &unk_24CBE3BD8;
  v3[7] = &unk_24CBE3C08;
  v2[8] = &unk_24CBE3C20;
  v2[9] = &unk_24CBE3C50;
  v3[8] = &unk_24CBE3C38;
  v3[9] = &unk_24CBE3C68;
  v2[10] = &unk_24CBE3C80;
  v2[11] = &unk_24CBE3CB0;
  v3[10] = &unk_24CBE3C98;
  v3[11] = &unk_24CBE3CC8;
  v2[12] = &unk_24CBE3CE0;
  v2[13] = &unk_24CBE3D10;
  v3[12] = &unk_24CBE3CF8;
  v3[13] = &unk_24CBE3D28;
  v2[14] = &unk_24CBE3D40;
  v2[15] = &unk_24CBE3D70;
  v3[14] = &unk_24CBE3D58;
  v3[15] = &unk_24CBE3D88;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mapNRGIconVariantToLI_nrgToLIMap;
  mapNRGIconVariantToLI_nrgToLIMap = v0;

}

uint64_t mapLIIconVariantToNRG(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (mapLIIconVariantToNRG_onceToken != -1)
    dispatch_once(&mapLIIconVariantToNRG_onceToken, &__block_literal_global_45);
  v2 = (void *)mapLIIconVariantToNRG_liToNRGMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if ((int)v5 <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NRGIconVariant mapLIIconVariantToNRG(LIIconVariant)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NRGProtocols.m"), 67, CFSTR("unknown icon variant %@ generated %@ LIIconVariantNanoCircular108pt2x is %@"), v9, v10, &unk_24CBE3D88);

  }
  return v5;
}

void __mapLIIconVariantToNRG_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];
  _QWORD v3[17];

  v3[16] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24CBE3AB8;
  v2[1] = &unk_24CBE3AE8;
  v3[0] = &unk_24CBE3AA0;
  v3[1] = &unk_24CBE3AD0;
  v2[2] = &unk_24CBE3B18;
  v2[3] = &unk_24CBE3B48;
  v3[2] = &unk_24CBE3B00;
  v3[3] = &unk_24CBE3B30;
  v2[4] = &unk_24CBE3B78;
  v2[5] = &unk_24CBE3BA8;
  v3[4] = &unk_24CBE3B60;
  v3[5] = &unk_24CBE3B90;
  v2[6] = &unk_24CBE3BD8;
  v2[7] = &unk_24CBE3C08;
  v3[6] = &unk_24CBE3BC0;
  v3[7] = &unk_24CBE3BF0;
  v2[8] = &unk_24CBE3C38;
  v2[9] = &unk_24CBE3C68;
  v3[8] = &unk_24CBE3C20;
  v3[9] = &unk_24CBE3C50;
  v2[10] = &unk_24CBE3C98;
  v2[11] = &unk_24CBE3CC8;
  v3[10] = &unk_24CBE3C80;
  v3[11] = &unk_24CBE3CB0;
  v2[12] = &unk_24CBE3CF8;
  v2[13] = &unk_24CBE3D28;
  v3[12] = &unk_24CBE3CE0;
  v3[13] = &unk_24CBE3D10;
  v2[14] = &unk_24CBE3D58;
  v2[15] = &unk_24CBE3D88;
  v3[14] = &unk_24CBE3D40;
  v3[15] = &unk_24CBE3D70;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mapLIIconVariantToNRG_liToNRGMap;
  mapLIIconVariantToNRG_liToNRGMap = v0;

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

void sub_211479B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_211479EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21147A0EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_21147A1FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id NRGGetActivePairedDevice()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B348]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
    v5 = 0;
  else
    v5 = v3;
  v6 = v5;

  return v6;
}

id NRGGetActivePairedDeviceStorePath()
{
  void *v0;
  void *v1;

  NRGGetActivePairedDevice();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForProperty:", *MEMORY[0x24BE6B378]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void NRGWaitForActivePairedDeviceStorePath(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __NRGWaitForActivePairedDeviceStorePath_block_invoke;
  v4[3] = &unk_24CBE2DD0;
  v5 = v1;
  v3 = v1;
  objc_msgSend(v2, "waitForAltAccountPairingStorePathPairingID:", v4);

}

id nrg_framework_log()
{
  if (nrg_framework_log_onceToken != -1)
    dispatch_once(&nrg_framework_log_onceToken, &__block_literal_global_1);
  return (id)nrg_framework_log___logger;
}

void __nrg_framework_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NanoResourceGrabber", "framework");
  v1 = (void *)nrg_framework_log___logger;
  nrg_framework_log___logger = (uint64_t)v0;

}

id nrg_daemon_log()
{
  if (nrg_daemon_log_onceToken != -1)
    dispatch_once(&nrg_daemon_log_onceToken, &__block_literal_global_3_0);
  return (id)nrg_daemon_log___logger;
}

void __nrg_daemon_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NanoResourceGrabber", "daemon");
  v1 = (void *)nrg_daemon_log___logger;
  nrg_daemon_log___logger = (uint64_t)v0;

}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t LICreateIconForBundleAndDisplayGamut()
{
  return MEMORY[0x24BE670F8]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x24BDBCF80]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

