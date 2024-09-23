posix_spawnattr_t copyPOSIXSpawnAttributes()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  sigset_t v9;
  sigset_t v10;
  posix_spawnattr_t v11;

  v11 = 0;
  v9 = -1;
  v10 = -1;
  v0 = posix_spawnattr_init(&v11);
  if (v0)
  {
    v1 = v0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      copyPOSIXSpawnAttributes_cold_4(v1);
  }
  else
  {
    v9 = -1;
    v10 = 0;
    v2 = posix_spawnattr_setsigmask(&v11, &v10);
    if (v2)
    {
      v3 = v2;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        copyPOSIXSpawnAttributes_cold_3(v3);
    }
    else
    {
      v4 = posix_spawnattr_setsigdefault(&v11, &v9);
      if (v4)
      {
        v5 = v4;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          copyPOSIXSpawnAttributes_cold_2(v5);
      }
      else
      {
        v6 = posix_spawnattr_setflags(&v11, 142);
        if (!v6)
          return v11;
        v7 = v6;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          copyPOSIXSpawnAttributes_cold_1(v7);
      }
    }
  }
  if (v11)
    posix_spawnattr_destroy(&v11);
  return 0;
}

void sub_21F8D181C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
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

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

char *OUTLINED_FUNCTION_3(int __errnum)
{
  return strerror(__errnum);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id isNSNumber(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSDictionary(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSArray(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSString(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSData(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

uint64_t hasEntitlementValue(void *a1, void *a2, _QWORD *a3)
{
  __CFString *v5;
  id v6;
  __SecTask *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __SecTask *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  CFErrorRef error;

  v5 = a1;
  v6 = a2;
  error = 0;
  v7 = SecTaskCreateFromSelf(0);
  v11 = v7;
  if (!v7)
  {
    createConditionInducerError((uint64_t)"hasEntitlementValue", 82, -1, 0, CFSTR("Failed to create task."), v8, v9, v10, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    goto LABEL_10;
  }
  v12 = (void *)SecTaskCopyValueForEntitlement(v7, v5, &error);
  v16 = v12;
  if (!v12)
  {
    createConditionInducerError((uint64_t)"hasEntitlementValue", 88, -1, error, CFSTR("Missing entitlement: %@"), v13, v14, v15, (uint64_t)v5);
LABEL_9:
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v21 = 0;
    if (!a3)
      goto LABEL_12;
    goto LABEL_11;
  }
  if ((objc_msgSend(v12, "isEqual:", v6) & 1) == 0)
  {
    createConditionInducerError((uint64_t)"hasEntitlementValue", 94, -1, 0, CFSTR("Unexpected entitlement value (actual, expected): (%@, %@)"), v17, v18, v19, (uint64_t)v16);
    goto LABEL_9;
  }
  v20 = 0;
  v21 = 1;
  if (a3)
LABEL_11:
    *a3 = objc_retainAutorelease(v20);
LABEL_12:
  if (error)
    CFRelease(error);
  error = 0;
  if (v11)
    CFRelease(v11);

  return v21;
}

id createConditionInducerError(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v13 = a4;
  v14 = (objc_class *)MEMORY[0x24BDD16A8];
  v15 = a5;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithFormat:arguments:", v15, &a9);

  v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v18 = v17;
  if (v16)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDD0FC8]);
  if (v13)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD1398]);
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("FunctionName"));

  }
  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("SourceLine"));

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kCOErrorDomain"), a3, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t safeRemoveItemAtPath(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v15;

  v3 = a1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (!v5)
  {
    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = objc_msgSend(v6, "removeItemAtPath:error:", v3, &v15);
  v8 = v15;

  if ((v7 & 1) != 0)
  {
LABEL_6:
    v13 = 1;
    goto LABEL_7;
  }
  createConditionInducerError((uint64_t)"safeRemoveItemAtPath", 157, -1, v8, CFSTR("Failed to remove file (%@)."), v9, v10, v11, (uint64_t)v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    v8 = objc_retainAutorelease(v12);
    v13 = 0;
    *a2 = v8;
  }
  else
  {
    v13 = 0;
    v8 = v12;
  }
LABEL_7:

  return v13;
}

uint64_t safeRemoveItemAtPathWithRegex(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v10 = v6;
  if (!v5 || !v6)
  {
    createConditionInducerError((uint64_t)"safeRemoveItemAtPathWithRegex", 180, -1, 0, CFSTR("Invalid input(s)."), v7, v8, v9, v34);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (!a3)
      goto LABEL_20;
    goto LABEL_18;
  }
  v42 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v6, 1, &v42);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v42;
  if (!v11)
  {
    createConditionInducerError((uint64_t)"safeRemoveItemAtPathWithRegex", 188, -1, v15, CFSTR("Failed to allocate regex."), v12, v13, v14, v34);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
LABEL_20:
      v31 = 0;
      goto LABEL_21;
    }
LABEL_18:
    v18 = objc_retainAutorelease(v18);
    v31 = 0;
    *a3 = v18;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v15;
  objc_msgSend(v16, "contentsOfDirectoryAtPath:error:", v5, &v41);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v41;

  if (!v17)
  {
    createConditionInducerError((uint64_t)"safeRemoveItemAtPathWithRegex", 194, -1, v18, CFSTR("Failed to query files at %@."), v19, v20, v21, (uint64_t)v5);
    v32 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v32;
    if (!a3)
      goto LABEL_20;
    goto LABEL_18;
  }
  v35 = v10;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v22 = v17;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v11, "numberOfMatchesInString:options:range:", v27, 0, 0, objc_msgSend(v27, "length")))
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "stringByAppendingPathComponent:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v18;
          objc_msgSend(v28, "removeItemAtPath:error:", v29, &v36);
          v30 = v36;

          v18 = v30;
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v24);
  }

  v31 = 1;
  v10 = v35;
LABEL_21:

  return v31;
}

id copy_calling_process_name()
{
  void *v0;
  void *v1;
  pid_t v2;
  int v3;
  uint64_t v4;
  BOOL v5;
  int v6;
  void *v7;
  _OWORD v9[16];
  char buffer[4096];
  uint64_t v11;

  MEMORY[0x24BDAC7A8]();
  v11 = *MEMORY[0x24BDAC8D0];
  bzero(buffer, 0x1000uLL);
  memset(v9, 0, sizeof(v9));
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "processIdentifier");
  else
    v2 = getpid();
  proc_pidpath(v2, buffer, 0x1000u);
  v3 = strlen(buffer);
  v4 = v3 - 1;
  do
  {
    v5 = __OFSUB__(v3--, 1);
    if (v3 < 0 != v5)
      break;
    v6 = buffer[v4--];
  }
  while (v6 != 47);
  __strlcpy_chk();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id _copySignpostLowSeverityLogHandle()
{
  if (_copySignpostLowSeverityLogHandle_onceToken != -1)
    dispatch_once(&_copySignpostLowSeverityLogHandle_onceToken, &__block_literal_global);
  return (id)_copySignpostLowSeverityLogHandle_log;
}

void ___copySignpostLowSeverityLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ConditionInducer.LowSeverity", "InduceCondition");
  v1 = (void *)_copySignpostLowSeverityLogHandle_log;
  _copySignpostLowSeverityLogHandle_log = (uint64_t)v0;

}

void sub_21F8D3160(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_2_1(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

void sub_21F8D3C8C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void _dummySlowNetwork()
{

}

void _dummyThermalCondition()
{

}

void _dummyGPUPerfStateCondition()
{

}

void sub_21F8D781C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_21F8D8614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_21F8D8AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F8D9004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t _nlc_connect(_DWORD *a1)
{
  mach_port_t *v2;
  mach_error_t v4;
  mach_port_t sp[2];

  *(_QWORD *)sp = 0;
  v2 = (mach_port_t *)MEMORY[0x24BDAD2F0];
  bootstrap_look_up(*MEMORY[0x24BDAD2F0], "com.apple.NetworkLinkConditioner", sp);
  if (bootstrap_look_up(*v2, "com.apple.NetworkLinkConditioner", sp))
  {
    puts("NLCd : Bootstrap failure");
    return 100;
  }
  else
  {
    v4 = nlc_connect(sp[0], a1, a1 + 1, &sp[1]);
    if (v4)
      mach_error("nlc_connect:", v4);
    return sp[1];
  }
}

uint64_t _nlc_disconnect(int *a1)
{
  mach_error_t v2;
  unsigned int v4;

  v4 = 0;
  v2 = nlc_disconnect(*a1, a1[1], &v4);
  if (v2)
    mach_error("nlc_disconnect:", v2);
  mach_port_deallocate(*MEMORY[0x24BDAEC58], *a1);
  return v4;
}

uint64_t _nlc_start_simulation(mach_port_name_t *a1, __int128 *a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  mach_error_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  *((_DWORD *)a2 + 1) = 0;
  v3 = a2[11];
  v28 = a2[10];
  v29 = v3;
  v30 = a2[12];
  v4 = a2[7];
  v24 = a2[6];
  v25 = v4;
  v5 = a2[9];
  v26 = a2[8];
  v27 = v5;
  v6 = a2[3];
  v20 = a2[2];
  v21 = v6;
  v7 = a2[5];
  v22 = a2[4];
  v23 = v7;
  v8 = a2[1];
  v18 = *a2;
  v19 = v8;
  v9 = nlc_simulate(*a1, (uint64_t)&v18, 0xD0u, a1[1], &v17);
  if (v9)
    mach_error("_nlc_start_simulation:", v9);
  v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_stop_simulation(mach_port_name_t *a1, __int128 *a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  mach_error_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  *((_DWORD *)a2 + 1) = 1;
  v3 = a2[11];
  v28 = a2[10];
  v29 = v3;
  v30 = a2[12];
  v4 = a2[7];
  v24 = a2[6];
  v25 = v4;
  v5 = a2[9];
  v26 = a2[8];
  v27 = v5;
  v6 = a2[3];
  v20 = a2[2];
  v21 = v6;
  v7 = a2[5];
  v22 = a2[4];
  v23 = v7;
  v8 = a2[1];
  v18 = *a2;
  v19 = v8;
  v9 = nlc_stop_simulation(*a1, (uint64_t)&v18, 0xD0u, a1[1], &v17);
  if (v9)
    mach_error("_nlc_stop_simulation:", v9);
  v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_get_status(mach_port_name_t *a1, _DWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  mach_error_t status;
  size_t __n;
  _BYTE __src[1024];
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  a2[1] = 2;
  __n = 208;
  v4 = *((_OWORD *)a2 + 11);
  v14[10] = *((_OWORD *)a2 + 10);
  v14[11] = v4;
  v14[12] = *((_OWORD *)a2 + 12);
  v5 = *((_OWORD *)a2 + 7);
  v14[6] = *((_OWORD *)a2 + 6);
  v14[7] = v5;
  v6 = *((_OWORD *)a2 + 9);
  v14[8] = *((_OWORD *)a2 + 8);
  v14[9] = v6;
  v7 = *((_OWORD *)a2 + 3);
  v14[2] = *((_OWORD *)a2 + 2);
  v14[3] = v7;
  v8 = *((_OWORD *)a2 + 5);
  v14[4] = *((_OWORD *)a2 + 4);
  v14[5] = v8;
  v9 = *((_OWORD *)a2 + 1);
  v14[0] = *(_OWORD *)a2;
  v14[1] = v9;
  bzero(__src, 0x400uLL);
  status = nlc_get_status(*a1, (uint64_t)v14, 0xD0u, __src, &__n, a1[1], (_DWORD *)&__n + 1);
  if (status)
    mach_error("_nlc_get_status:", status);
  memcpy(a2, __src, __n);
  return HIDWORD(__n);
}

uint64_t nlc_connect(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v13;
  int rcv_name;
  int rcv_name_4;
  mach_port_t rcv_name_8;
  _BYTE rcv_name_12[20];
  _DWORD v18[7];

  memset(v18, 0, sizeof(v18));
  *(_OWORD *)&rcv_name_12[4] = 0u;
  rcv_name = 0;
  reply_port = mig_get_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = reply_port;
  v13 = 5395;
  *(_QWORD *)rcv_name_12 = 0x9D4C00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v13);
    reply_port = rcv_name_8;
  }
  v9 = mach_msg((mach_msg_header_t *)&v13, 3, 0x18u, 0x40u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name_8);
  }
  else
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 40368)
      {
        if (v13 < 0)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&rcv_name_12[8] == 1 && rcv_name == 56 && !rcv_name_4 && HIWORD(v18[0]) << 16 == 1114112)
          {
            v10 = 0;
            v11 = v18[3];
            *a2 = *(_DWORD *)&rcv_name_12[12];
            *a3 = v11;
            *a4 = v18[4];
            return v10;
          }
        }
        else if (rcv_name == 36)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&rcv_name_12[16])
          {
            if (rcv_name_4)
              v10 = 4294966996;
            else
              v10 = *(unsigned int *)&rcv_name_12[16];
          }
        }
        else
        {
          v10 = 4294966996;
        }
      }
      else
      {
        v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v13);
      return v10;
    }
    mig_dealloc_reply_port(rcv_name_8);
  }
  return v10;
}

uint64_t nlc_disconnect(int a1, int a2, _DWORD *a3)
{
  mach_port_name_t reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&rcv_name[28] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v10 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x9D4D00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
      return v7;
    }
    if (*(_DWORD *)&rcv_name[16] == 71)
    {
      v7 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name[16] == 40369)
    {
      if ((v10 & 0x80000000) == 0)
      {
        if (*(_DWORD *)rcv_name == 40)
        {
          if (!*(_DWORD *)&rcv_name[4])
          {
            v7 = *(unsigned int *)&rcv_name[28];
            if (!*(_DWORD *)&rcv_name[28])
            {
              *a3 = *(_DWORD *)&rcv_name[32];
              return v7;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)rcv_name == 36)
        {
          if (*(_DWORD *)&rcv_name[4])
            v8 = 1;
          else
            v8 = *(_DWORD *)&rcv_name[28] == 0;
          if (v8)
            v7 = 4294966996;
          else
            v7 = *(unsigned int *)&rcv_name[28];
          goto LABEL_23;
        }
      }
      v7 = 4294966996;
    }
    else
    {
      v7 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v10);
    return v7;
  }
  mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  return v7;
}

uint64_t nlc_simulate(mach_port_name_t a1, uint64_t a2, unsigned int a3, mach_port_name_t a4, _DWORD *a5)
{
  uint64_t v5;
  uint64_t v10;
  mach_msg_size_t v11;
  mach_port_name_t reply_port;
  uint64_t v13;
  BOOL v14;
  mach_port_name_t rcv_name[4];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)rcv_name = 0u;
  v17 = 0u;
  *((_QWORD *)&v17 + 1) = *MEMORY[0x24BDAC470];
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(v18) = a3;
    v10 = (a3 + 3) & 0xFFFFFFFC;
    v11 = v10 + 40;
    *(mach_port_name_t *)((char *)&rcv_name[9] + v10) = a4;
    reply_port = mig_get_reply_port();
    rcv_name[2] = a1;
    rcv_name[3] = reply_port;
    rcv_name[0] = 5395;
    *(_QWORD *)&v17 = 0x9D4E00000000;
    if (MEMORY[0x24BDB0418])
    {
      voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
      reply_port = rcv_name[3];
    }
    v13 = mach_msg((mach_msg_header_t *)rcv_name, 3, v11, 0x30u, reply_port, 0, 0);
    v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name[3]);
      return v5;
    }
    if ((_DWORD)v13)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v5;
    }
    if (DWORD1(v17) == 71)
    {
      v5 = 4294966988;
    }
    else if (DWORD1(v17) == 40370)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            v5 = v18;
            if (!(_DWORD)v18)
            {
              *a5 = DWORD1(v18);
              return v5;
            }
            goto LABEL_25;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2])
            v14 = 1;
          else
            v14 = (_DWORD)v18 == 0;
          if (v14)
            v5 = 4294966996;
          else
            v5 = v18;
          goto LABEL_25;
        }
      }
      v5 = 4294966996;
    }
    else
    {
      v5 = 4294966995;
    }
LABEL_25:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v5;
  }
  return 4294966989;
}

uint64_t nlc_stop_simulation(mach_port_name_t a1, uint64_t a2, unsigned int a3, mach_port_name_t a4, _DWORD *a5)
{
  uint64_t v5;
  uint64_t v10;
  mach_msg_size_t v11;
  mach_port_name_t reply_port;
  uint64_t v13;
  BOOL v14;
  mach_port_name_t rcv_name[4];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)rcv_name = 0u;
  v17 = 0u;
  *((_QWORD *)&v17 + 1) = *MEMORY[0x24BDAC470];
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(v18) = a3;
    v10 = (a3 + 3) & 0xFFFFFFFC;
    v11 = v10 + 40;
    *(mach_port_name_t *)((char *)&rcv_name[9] + v10) = a4;
    reply_port = mig_get_reply_port();
    rcv_name[2] = a1;
    rcv_name[3] = reply_port;
    rcv_name[0] = 5395;
    *(_QWORD *)&v17 = 0x9D4F00000000;
    if (MEMORY[0x24BDB0418])
    {
      voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
      reply_port = rcv_name[3];
    }
    v13 = mach_msg((mach_msg_header_t *)rcv_name, 3, v11, 0x30u, reply_port, 0, 0);
    v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name[3]);
      return v5;
    }
    if ((_DWORD)v13)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v5;
    }
    if (DWORD1(v17) == 71)
    {
      v5 = 4294966988;
    }
    else if (DWORD1(v17) == 40371)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            v5 = v18;
            if (!(_DWORD)v18)
            {
              *a5 = DWORD1(v18);
              return v5;
            }
            goto LABEL_25;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2])
            v14 = 1;
          else
            v14 = (_DWORD)v18 == 0;
          if (v14)
            v5 = 4294966996;
          else
            v5 = v18;
          goto LABEL_25;
        }
      }
      v5 = 4294966996;
    }
    else
    {
      v5 = 4294966995;
    }
LABEL_25:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v5;
  }
  return 4294966989;
}

uint64_t nlc_get_status(mach_port_name_t a1, uint64_t a2, unsigned int a3, void *a4, _DWORD *a5, mach_port_name_t a6, _DWORD *a7)
{
  uint64_t v7;
  uint64_t v14;
  mach_msg_size_t v15;
  mach_port_name_t reply_port;
  uint64_t v17;
  BOOL v18;
  int v21;
  unsigned int v22;
  char *v23;
  mach_port_name_t rcv_name[4];
  __int128 v25;
  size_t __n[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  *(_OWORD *)__n = 0u;
  v27 = 0u;
  *(_OWORD *)rcv_name = 0u;
  v25 = 0u;
  *((_QWORD *)&v25 + 1) = *MEMORY[0x24BDAC470];
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(__n[0]) = a3;
    v14 = (a3 + 3) & 0xFFFFFFFC;
    v15 = v14 + 40;
    *(mach_port_name_t *)((char *)&rcv_name[9] + v14) = a6;
    reply_port = mig_get_reply_port();
    rcv_name[2] = a1;
    rcv_name[3] = reply_port;
    rcv_name[0] = 5395;
    *(_QWORD *)&v25 = 0x9D5000000000;
    if (MEMORY[0x24BDB0418])
    {
      voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
      reply_port = rcv_name[3];
    }
    v17 = mach_msg((mach_msg_header_t *)rcv_name, 3, v15, 0x434u, reply_port, 0, 0);
    v7 = v17;
    if ((v17 - 268435458) <= 0xE && ((1 << (v17 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name[3]);
      return v7;
    }
    if ((_DWORD)v17)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v7;
    }
    if (DWORD1(v25) == 71)
    {
      v7 = 4294966988;
    }
    else if (DWORD1(v25) == 40372)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] - 1069 <= 0xFFFFFBFE)
        {
          if (rcv_name[2])
            v18 = 1;
          else
            v18 = LODWORD(__n[0]) == 0;
          if (!v18 && rcv_name[1] == 36)
            v7 = LODWORD(__n[0]);
          else
            v7 = 4294966996;
          goto LABEL_27;
        }
        if (!rcv_name[2])
        {
          v7 = LODWORD(__n[0]);
          if (LODWORD(__n[0]))
            goto LABEL_27;
          v21 = HIDWORD(__n[0]);
          if (HIDWORD(__n[0]) <= 0x400)
          {
            v7 = 4294966996;
            if (rcv_name[1] - 44 >= HIDWORD(__n[0]))
            {
              v22 = (HIDWORD(__n[0]) + 3) & 0xFFFFFFFC;
              if (rcv_name[1] == v22 + 44)
              {
                v23 = (char *)&rcv_name[-256] + v22;
                memcpy(a4, &__n[1], HIDWORD(__n[0]));
                v7 = 0;
                *a5 = v21;
                *a7 = *((_DWORD *)v23 + 266);
                return v7;
              }
            }
            goto LABEL_27;
          }
        }
      }
      v7 = 4294966996;
    }
    else
    {
      v7 = 4294966995;
    }
LABEL_27:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  return 4294966989;
}

uint64_t SetDVFSStates(mach_port_t a1, uint64_t *input)
{
  uint64_t v2;

  if (!a1)
    return 0;
  v2 = IOConnectCallMethod(a1, dword_25551F6E0, input, 5u, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    SetDVFSStates_cold_1(v2);
  return v2;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

void SetDVFSStates_cold_1(mach_error_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", mach_error_string(a1));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "_setDVFSStates (0x%x - %@)", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

BOOL CallIO(mach_port_t a1, void *inputStruct, void *outputStruct, uint64_t a4)
{
  kern_return_t v5;
  _BOOL8 v6;
  mach_error_t v7;
  size_t outputStructCnt;

  if (!a1)
    return 0;
  outputStructCnt = 8;
  v5 = IOConnectCallStructMethod(a1, 0x41u, inputStruct, 8uLL, outputStruct, &outputStructCnt);
  v6 = v5 == 0;
  if (v5)
  {
    v7 = v5;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      CallIO_cold_2(a4, v7);
  }
  else if (outputStructCnt != 8)
  {
    CallIO_cold_1();
  }
  return v6;
}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void CallIO_cold_1()
{
  __assert_rtn("CallIO", "GPUPerformanceState.m", 111, "outSize == sizeof(AGXConsistentPerfStateControl)");
}

void CallIO_cold_2(uint64_t a1, mach_error_t a2)
{
  void *v3;
  void *v4;
  _DWORD v5[2];
  __int16 v6;
  void *v7;
  __int16 v8;
  mach_error_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", mach_error_string(a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 67109890;
  v5[1] = 65;
  v6 = 2112;
  v7 = v3;
  v8 = 1024;
  v9 = a2;
  v10 = 2112;
  v11 = v4;
  _os_log_fault_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "IOConnectCallStructMethod method:%u for:%@ failed (0x%x - %@)", (uint8_t *)v5, 0x22u);

}

void copyPOSIXSpawnAttributes_cold_1(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F8CF000, MEMORY[0x24BDACB70], v1, "posix_spawnattr_setflags failed: %d (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void copyPOSIXSpawnAttributes_cold_2(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F8CF000, MEMORY[0x24BDACB70], v1, "posix_spawnattr_setsigdefault failed: %d (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void copyPOSIXSpawnAttributes_cold_3(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F8CF000, MEMORY[0x24BDACB70], v1, "posix_spawnattr_setsigmask failed: %d (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void copyPOSIXSpawnAttributes_cold_4(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F8CF000, MEMORY[0x24BDACB70], v1, "posix_spawnattr_init failed: %d (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationDisplayNotice(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle)
{
  return MEMORY[0x24BDBC938](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x24BDD13F8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x24BDAC768]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2E0](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
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

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_registration_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFC8](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int flock(int a1, int a2)
{
  return MEMORY[0x24BDAE3B0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE978](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int killpg(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE980](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void mach_error(const char *str, mach_error_t error_value)
{
  MEMORY[0x24BDAEB50](str, *(_QWORD *)&error_value);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEEE0](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x24BDAEEF8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEF08](*(_QWORD *)&reply_port);
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

const char **__cdecl objc_copyClassNamesForImage(const char *image, unsigned int *outCount)
{
  return (const char **)MEMORY[0x24BEDD000](image, outCount);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x24BDAF600](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x24BDAF618](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x24BDAF630](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x24BDAF638](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x24BDAF640](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x24BDAF650](a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x24BDAF660](a1, a2);
}

int posix_spawnattr_setsigdefault(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return MEMORY[0x24BDAF670](a1, a2);
}

int posix_spawnattr_setsigmask(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return MEMORY[0x24BDAF678](a1, a2);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x24BDB02A0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x24BDB0418](msg);
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  return MEMORY[0x24BDB0470](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

