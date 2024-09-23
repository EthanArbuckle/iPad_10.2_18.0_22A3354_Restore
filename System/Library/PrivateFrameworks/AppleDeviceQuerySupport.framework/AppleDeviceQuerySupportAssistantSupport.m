@implementation AppleDeviceQuerySupportAssistantSupport

+ (BOOL)isInternalAssistant
{
  return 0;
}

+ (id)classList
{
  return &unk_2507BE650;
}

+ (id)armoryClassName
{
  return CFSTR("OBJC_CLASS_$_AppleDeviceQueryArmory");
}

+ (id)serviceXpcName
{
  return CFSTR("com.apple.AppleDeviceQueryService");
}

+ (void)getDylibHandlerWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  if (a3)
  {
    *a3 = 0;
    if (getDylibHandlerWithError__aToken != -1)
      dispatch_once(&getDylibHandlerWithError__aToken, &__block_literal_global_0);
    *a3 = objc_retainAutorelease((id)getDylibHandlerWithError__anError);
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getDylibHandlerWithError:]", 60, CFSTR("error p-pointer is nil!"), v3, v4, v5, v8);
  }
  return (void *)getDylibHandlerWithError__ZhuGeArmoryHandler;
}

void __68__AppleDeviceQuerySupportAssistantSupport_getDylibHandlerWithError___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t vars0;

  getDylibHandlerWithError__ZhuGeArmoryHandler = (uint64_t)dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/AppleDeviceQuerySupport.framework/libAppleDeviceQueryArmory.dylib"), "UTF8String"), 1);
  if (!getDylibHandlerWithError__ZhuGeArmoryHandler)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getDylibHandlerWithError:]_block_invoke", 69, CFSTR("Failed to dlopen ZhuGe armory dylib!"), v0, v1, v2, vars0);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 13, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)getDylibHandlerWithError__anError;
    getDylibHandlerWithError__anError = v3;

  }
}

+ (id)getSharedInstanceByName:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v31;
  id v32;

  v6 = a3;
  if (objc_msgSend(a1, "isInternalAssistant") && (isZhuGeInRestoreOS() & 1) != 0)
    goto LABEL_10;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]", 95, CFSTR("error p-pointer is nil!"), v7, v8, v9, v31);
LABEL_10:
    v19 = 0;
    v15 = 0;
    goto LABEL_15;
  }
  *a4 = 0;
  objc_msgSend(a1, "classList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v6);

  if ((v11 & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]", 101, CFSTR("Unknown class name!"), v12, v13, v14, v31);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 38, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0;
LABEL_12:
    v15 = 0;
LABEL_14:
    *a4 = v29;
    goto LABEL_15;
  }
  v32 = 0;
  v15 = (void *)objc_msgSend(a1, "getDylibHandlerWithError:", &v32);
  v19 = v32;
  if (!v15)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]", 109, CFSTR("Failed to get ZhuGe armory handler!"), v16, v17, v18, v31);
    v29 = objc_retainAutorelease(v19);
    v19 = v29;
    goto LABEL_14;
  }
  v20 = objc_retainAutorelease(v6);
  v21 = dlsym(v15, (const char *)objc_msgSend(v20, "UTF8String"));
  if (!v21)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]", 116, CFSTR("Failed to find class symbol for \"%@\"!"), v22, v23, v24, (uint64_t)v20);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 13, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v21, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]", 123, CFSTR("Failed to have shared instance for \"%@\"!"), v25, v26, v27, (uint64_t)v20);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 38, 0);
    v28 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v28;
  }
LABEL_15:

  return v15;
}

+ (id)isKey:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  id v25;
  id v26;

  v6 = a3;
  if (objc_msgSend(a1, "isInternalAssistant") && (isZhuGeInRestoreOS() & 1) != 0)
    goto LABEL_9;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport isKey:withError:]", 146, CFSTR("error p-pointer is nil!"), v7, v8, v9, v24);
LABEL_9:
    v17 = 0;
    v15 = 0;
    v11 = 0;
    v14 = 0;
    goto LABEL_11;
  }
  *a4 = 0;
  objc_msgSend(a1, "armoryClassName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(a1, "getSharedInstanceByName:withError:", v10, &v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v26;

  if (v11)
  {
    objc_msgSend(v11, "helper");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v12;
    objc_msgSend(v13, "getConfigOfKey:withError:", v6, &v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v25;

    v16 = (void *)MEMORY[0x24BDBD1C8];
    if (!v14)
      v16 = (void *)MEMORY[0x24BDBD1C0];
    v17 = v16;
  }
  else
  {
    objc_msgSend(a1, "armoryClassName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport isKey:withError:]", 154, CFSTR("Failed to get a shared instance for \"%@\"!"), v19, v20, v21, (uint64_t)v18);

    v15 = objc_retainAutorelease(v12);
    v17 = 0;
    v11 = 0;
    v14 = 0;
    *a4 = v15;
  }
LABEL_11:
  v22 = v17;

  return v22;
}

+ (id)getXpcProxyWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[5];
  _QWORD v48[6];

  if (objc_msgSend(a1, "isInternalAssistant") && (isZhuGeInRestoreOS() & 1) != 0)
    goto LABEL_10;
  if (!a3)
  {
    v8 = CFSTR("error p-pointer is nil!");
    v9 = 1040;
    v10 = 181;
    goto LABEL_9;
  }
  *a3 = 0;
  if (getXpcProxyWithError__aToken != -1)
    dispatch_once(&getXpcProxyWithError__aToken, &__block_literal_global_23);
  pthread_mutex_lock(&getXpcProxyWithError__aRecursiveMutex);
  if (getXpcProxyWithError__aProxy)
  {
    v8 = CFSTR("XPC proxy is already available");
    v9 = 524544;
    v10 = 193;
LABEL_9:
    ZhuGeLog(v9, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]", v10, v8, v5, v6, v7, v42);
LABEL_10:
    v11 = 0;
    v12 = 0;
    goto LABEL_11;
  }
  v15 = objc_alloc(MEMORY[0x24BDD1988]);
  objc_msgSend(a1, "serviceXpcName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v15, "initWithServiceName:", v16);

  if (!v11)
  {
    objc_msgSend(a1, "serviceXpcName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]", 200, CFSTR("Failed to connect \"%@\"!"), v39, v40, v41, (uint64_t)v38);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 67, 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = 0;
    goto LABEL_18;
  }
  if (isZhuGeInRestoreOS())
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2563E2A30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setExportedInterface:", v17);

    v18 = (void *)objc_opt_new();
    objc_msgSend(v11, "setExportedObject:", v18);

  }
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2563E48D8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRemoteObjectInterface:", v19);

  v46 = (void *)MEMORY[0x24BDBCF20];
  v45 = objc_opt_class();
  v44 = objc_opt_class();
  v43 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend(v46, "setWithObjects:", v45, v44, v43, v20, v21, v22, v23, v24, v25, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectInterface");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_setBulkKeys_getValuesAndError_, 0, 1);

  objc_msgSend(v11, "remoteObjectInterface");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_setBulkInternalKeys_getValuesAndError_, 0, 1);

  objc_msgSend(v11, "remoteObjectInterface");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_setBulkMGKeys_getValuesAndError_, 0, 1);

  objc_msgSend(v11, "remoteObjectInterface");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_setBulkInternalMGKeys_getValuesAndError_, 0, 1);

  v30 = MEMORY[0x24BDAC760];
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_2;
  v48[3] = &__block_descriptor_40_e5_v8__0l;
  v48[4] = a1;
  objc_msgSend(v11, "setInvalidationHandler:", v48);
  v47[0] = v30;
  v47[1] = 3221225472;
  v47[2] = __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_3;
  v47[3] = &__block_descriptor_40_e5_v8__0l;
  v47[4] = a1;
  objc_msgSend(v11, "setInterruptionHandler:", v47);
  objc_msgSend(v11, "activate");
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_65);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)getXpcProxyWithError__aProxy;
  getXpcProxyWithError__aProxy = v31;

  if (!getXpcProxyWithError__aProxy)
  {
    objc_msgSend(a1, "serviceXpcName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]", 257, CFSTR("Failed to get proxy for \"%@\"!"), v34, v35, v36, (uint64_t)v33);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 66, 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
    *a3 = v37;
  }
LABEL_11:
  pthread_mutex_unlock(&getXpcProxyWithError__aRecursiveMutex);
  v13 = (id)getXpcProxyWithError__aProxy;

  return v13;
}

uint64_t __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke()
{
  return initPthreadRecursiveMutex(&getXpcProxyWithError__aRecursiveMutex);
}

uint64_t __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  pthread_mutex_lock(&getXpcProxyWithError__aRecursiveMutex);
  objc_msgSend(*(id *)(a1 + 32), "serviceXpcName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]_block_invoke_2", 235, CFSTR("Connection to \"%@\" invalidated!"), v3, v4, v5, (uint64_t)v2);

  v6 = (void *)getXpcProxyWithError__aProxy;
  getXpcProxyWithError__aProxy = 0;

  return pthread_mutex_unlock(&getXpcProxyWithError__aRecursiveMutex);
}

uint64_t __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  pthread_mutex_lock(&getXpcProxyWithError__aRecursiveMutex);
  objc_msgSend(*(id *)(a1 + 32), "serviceXpcName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]_block_invoke_3", 241, CFSTR("Connection to \"%@\" interrupted!"), v3, v4, v5, (uint64_t)v2);

  v6 = (void *)getXpcProxyWithError__aProxy;
  getXpcProxyWithError__aProxy = 0;

  return pthread_mutex_unlock(&getXpcProxyWithError__aRecursiveMutex);
}

uint64_t __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = a2;
  pthread_mutex_lock(&getXpcProxyWithError__aRecursiveMutex);
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]_block_invoke_4", 251, CFSTR("Connection failed to provide a synchronized proxy, error : %@!"), v3, v4, v5, (uint64_t)v2);

  v6 = (void *)getXpcProxyWithError__aProxy;
  getXpcProxyWithError__aProxy = 0;

  return pthread_mutex_unlock(&getXpcProxyWithError__aRecursiveMutex);
}

@end
