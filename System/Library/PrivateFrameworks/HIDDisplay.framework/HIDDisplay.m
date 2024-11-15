HIDDisplayDeviceManagementInterface *HIDDisplayCreateDeviceManagementInterfaceWithContainerID(uint64_t a1)
{
  HIDDisplayDeviceManagementInterface *v1;
  HIDDisplayDeviceManagementInterface *v2;
  HIDDisplayDeviceManagementInterface *v3;

  v1 = -[HIDDisplayDeviceManagementInterface initWithContainerID:]([HIDDisplayDeviceManagementInterface alloc], "initWithContainerID:", a1);
  v2 = v1;
  if (v1)
    v3 = v1;

  return v2;
}

HIDDisplayDeviceManagementInterface *HIDDisplayCreateDeviceManagementInterfaceWithService(uint64_t a1)
{
  HIDDisplayDeviceManagementInterface *v1;
  HIDDisplayDeviceManagementInterface *v2;
  HIDDisplayDeviceManagementInterface *v3;

  v1 = -[HIDDisplayDeviceManagementInterface initWithService:]([HIDDisplayDeviceManagementInterface alloc], "initWithService:", a1);
  v2 = v1;
  if (v1)
    v3 = v1;

  return v2;
}

uint64_t HIDDisplayDeviceManagementFactoryReset(void *a1, unsigned __int8 a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  v5 = objc_msgSend(a1, "factoryReset:securityToken:error:", a2, a3, &v9);
  v6 = v9;
  v7 = v6;
  if (a4 && (v5 & 1) == 0)
    *a4 = v6;

  return v5;
}

uint64_t HIDDisplayDeviceManagementSetFactoryResetData(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  v5 = objc_msgSend(a1, "factoryReset:securityToken:error:", a2, a3, &v9);
  v6 = v9;
  v7 = v6;
  if (a4 && (v5 & 1) == 0)
    *a4 = v6;

  return v5;
}

uint64_t HIDDisplayDeviceManagementGetSecurityToken(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  v4 = objc_msgSend(a1, "getSecurityToken:error:", a2, &v8);
  v5 = v8;
  v6 = v5;
  if (a3 && (v4 & 1) == 0)
    *a3 = v5;

  return v4;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_2161BEE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2161BFD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id OUTLINED_FUNCTION_4(id *location)
{
  return objc_loadWeakRetained(location);
}

void sub_2161C0D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id HIDDisplayLog()
{
  if (HIDDisplayLog_onceToken != -1)
    dispatch_once(&HIDDisplayLog_onceToken, &__block_literal_global);
  return (id)HIDDisplayLog_log;
}

id getUnicharStringFromData(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_8;
  v3 = objc_retainAutorelease(v1);
  v4 = objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  if (!v5)
    goto LABEL_8;
  v6 = 0;
  v7 = 0;
  do
  {
    if (!*(_WORD *)(v4 + v6))
      break;
    ++v7;
    v6 += 2;
  }
  while (v6 < v5);
  if (v7)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", objc_msgSend(objc_retainAutorelease(v3), "bytes"), 2 * v7, 2483028224);
  else
LABEL_8:
    v8 = 0;

  return v8;
}

HIDDisplayIOReportingInterface *HIDDisplayCreateIOReportingInterfaceWithContainerID(uint64_t a1)
{
  HIDDisplayIOReportingInterface *v1;
  HIDDisplayIOReportingInterface *v2;
  HIDDisplayIOReportingInterface *v3;

  v1 = -[HIDDisplayIOReportingInterface initWithContainerID:]([HIDDisplayIOReportingInterface alloc], "initWithContainerID:", a1);
  v2 = v1;
  if (v1)
    v3 = v1;

  return v2;
}

uint64_t HIDDisplayIOReportingSetDispatchQueue(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setDispatchQueue:", a2);
}

uint64_t HIDDisplayIOReportingSetInputDataHandler(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setInputDataHandler:", a2);
}

uint64_t HIDDisplayIOReportingSetOutputData(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  v4 = objc_msgSend(a1, "setOutputData:error:", a2, &v8);
  v5 = v8;
  v6 = v5;
  if (a3 && (v4 & 1) == 0)
    *a3 = v5;

  return v4;
}

uint64_t HIDDisplayIOReportingSetCancelHandler(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setCancelHandler:", a2);
}

HIDDisplayUserAdjustmentInterface *HIDDisplayCreateUserAdjustmentInterfaceWithContainerID(uint64_t a1)
{
  HIDDisplayUserAdjustmentInterface *v1;
  HIDDisplayUserAdjustmentInterface *v2;
  HIDDisplayUserAdjustmentInterface *v3;

  v1 = -[HIDDisplayUserAdjustmentInterface initWithContainerID:]([HIDDisplayUserAdjustmentInterface alloc], "initWithContainerID:", a1);
  v2 = v1;
  if (v1)
    v3 = v1;

  return v2;
}

HIDDisplayUserAdjustmentInterface *HIDDisplayCreateUserAdjustmentInterfaceWithService(uint64_t a1)
{
  HIDDisplayUserAdjustmentInterface *v1;
  HIDDisplayUserAdjustmentInterface *v2;
  HIDDisplayUserAdjustmentInterface *v3;

  v1 = -[HIDDisplayUserAdjustmentInterface initWithService:]([HIDDisplayUserAdjustmentInterface alloc], "initWithService:", a1);
  v2 = v1;
  if (v1)
    v3 = v1;

  return v2;
}

uint64_t HIDDisplayUserAdjustmentSetData(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  v4 = objc_msgSend(a1, "set:error:", a2, &v8);
  v5 = v8;
  v6 = v5;
  if (a3 && (v4 & 1) == 0)
    *a3 = v5;

  return v4;
}

uint64_t HIDDisplayUserAdjustmentCopyData(void *a1, _QWORD *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v7;

  v7 = 0;
  objc_msgSend(a1, "get:", &v7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = v4;
  if (a2 && !v3)
    *a2 = v4;

  return v3;
}

uint64_t HIDDisplayUserAdjustmentInvalidate(void *a1, _QWORD *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v7;

  v7 = 0;
  v3 = objc_msgSend(a1, "invalidate:", &v7);
  v4 = v7;
  v5 = v4;
  if (a2 && (v3 & 1) == 0)
    *a2 = v4;

  return v3;
}

HIDDisplayPresetInterface *HIDDisplayCreatePresetInterfaceWithContainerID(uint64_t a1)
{
  HIDDisplayPresetInterface *v1;
  HIDDisplayPresetInterface *v2;
  HIDDisplayPresetInterface *v3;

  v1 = -[HIDDisplayPresetInterface initWithContainerID:]([HIDDisplayPresetInterface alloc], "initWithContainerID:", a1);
  v2 = v1;
  if (v1)
    v3 = v1;

  return v2;
}

uint64_t HIDDisplayGetPresetCount(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    -[NSObject presets](v2, "presets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

  }
  else
  {
    HIDDisplayLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      HIDDisplayGetPresetCount_cold_1();
    v4 = -1;
  }

  return v4;
}

uint64_t HIDDisplayGetFactoryDefaultPresetIndex(void *a1, _QWORD *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v9 = 0;
    v5 = -[NSObject getFactoryDefaultPresetIndex:](v4, "getFactoryDefaultPresetIndex:", &v9);
    v6 = v9;
    if (v5 == -1)
    {
      HIDDisplayLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        HIDDisplayGetFactoryDefaultPresetIndex_cold_1();

      if (a2)
        *a2 = v6;
    }

  }
  else
  {
    HIDDisplayLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      HIDDisplayGetPresetCount_cold_1();
    v5 = -1;
  }

  return v5;
}

uint64_t HIDDisplayGetActivePresetIndex(void *a1, _QWORD *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v9 = 0;
    v5 = -[NSObject getActivePresetIndex:](v4, "getActivePresetIndex:", &v9);
    v6 = v9;
    if (v5 == -1)
    {
      HIDDisplayLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        HIDDisplayGetActivePresetIndex_cold_1();

      if (a2)
        *a2 = v6;
    }

  }
  else
  {
    HIDDisplayLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      HIDDisplayGetPresetCount_cold_1();
    v5 = -1;
  }

  return v5;
}

uint64_t HIDDisplaySetActivePresetIndex(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v13 = 0;
    v7 = objc_msgSend(v6, "setActivePresetIndex:error:", a2, &v13);
    v8 = v13;
    if ((v7 & 1) == 0)
    {
      HIDDisplayLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v15 = v6;
        v16 = 2112;
        v17 = v8;
        v18 = 2048;
        v19 = a2;
        _os_log_error_impl(&dword_2161BB000, v9, OS_LOG_TYPE_ERROR, "%@ HIDDisplaySetActivePresetIndex error %@ for  preset index %ld ", buf, 0x20u);
      }

      if (a3)
        *a3 = v8;
    }

  }
  else
  {
    HIDDisplayLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      HIDDisplayGetPresetCount_cold_1();

    if (a3)
    {
      v11 = objc_alloc(MEMORY[0x24BDD1540]);
      v7 = 0;
      *a3 = objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870911, 0);
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

id HIDDisplayCopyPreset(void *a1, unint64_t a2, uint64_t *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    HIDDisplayLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      HIDDisplayGetPresetCount_cold_1();

    if (!a3)
    {
      v14 = 0;
      v7 = 0;
      goto LABEL_23;
    }
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("Invalid object"), -536870206, 0);
    v14 = 0;
    v7 = 0;
    goto LABEL_15;
  }
  v6 = v5;
  v7 = v6;
  if ((a2 & 0x8000000000000000) != 0
    || (objc_msgSend(v6, "presets"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9 <= a2))
  {
    HIDDisplayLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      HIDDisplayCopyPreset_cold_1(a2, v17);

    if (!a3)
    {
      v14 = 0;
      goto LABEL_23;
    }
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("Invalid index"), -536870206, 0);
    v14 = 0;
LABEL_15:
    *a3 = v16;
    goto LABEL_23;
  }
  objc_msgSend(v7, "presets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  objc_msgSend(v11, "get:", &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;
  if (v12 && objc_msgSend(v12, "count"))
  {
    v14 = v12;
  }
  else
  {
    HIDDisplayLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v22 = v7;
      v23 = 2112;
      v24 = v13;
      v25 = 2048;
      v26 = a2;
      _os_log_error_impl(&dword_2161BB000, v18, OS_LOG_TYPE_ERROR, "%@ HIDDisplayCopyPreset error %@ for  preset index %ld ", buf, 0x20u);
    }

    v14 = 0;
    if (a3)
      *a3 = (uint64_t)v13;
  }

LABEL_23:
  return v14;
}

uint64_t HIDDisplaySetPreset(void *a1, unint64_t a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    HIDDisplayLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      HIDDisplayGetPresetCount_cold_1();

    if (!a4)
    {
      v14 = 0;
      v15 = 0;
      v9 = 0;
      goto LABEL_21;
    }
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("Invalid object"), -536870206, 0);
    v15 = v18;
    v14 = 0;
    v9 = 0;
    goto LABEL_18;
  }
  v8 = v7;
  v9 = v8;
  if ((a2 & 0x8000000000000000) != 0
    || (objc_msgSend(v8, "presets"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11 <= a2))
  {
    HIDDisplayLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      HIDDisplaySetPreset_cold_1();

    if (!a4)
    {
      v14 = 0;
      v15 = 0;
      goto LABEL_21;
    }
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("Invalid index"), -536870206, 0);
    v15 = v18;
    v14 = 0;
LABEL_18:
    *a4 = v18;
    goto LABEL_21;
  }
  objc_msgSend(v9, "presets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v14 = objc_msgSend(v13, "set:error:", a3, &v21);
  v15 = v21;
  if ((v14 & 1) == 0)
  {
    HIDDisplayLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v23 = v9;
      v24 = 2112;
      v25 = v15;
      v26 = 2048;
      v27 = a2;
      _os_log_error_impl(&dword_2161BB000, v16, OS_LOG_TYPE_ERROR, "%@ HIDDisplaySetPreset error %@ for  preset index %ld ", buf, 0x20u);
    }

    if (a4)
      *a4 = v15;
  }

LABEL_21:
  return v14;
}

uint64_t HIDDisplayIsPresetValid(void *a1, unint64_t a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    HIDDisplayLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      HIDDisplayGetPresetCount_cold_1();
    goto LABEL_10;
  }
  v4 = v3;
  v5 = v4;
  if ((a2 & 0x8000000000000000) != 0
    || (-[NSObject presets](v4, "presets"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7 <= a2))
  {
    HIDDisplayLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      HIDDisplaySetPreset_cold_1();

LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  -[NSObject presets](v5, "presets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "valid");
LABEL_11:

  return v10;
}

uint64_t HIDDisplayIsPresetWritable(void *a1, unint64_t a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    HIDDisplayLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      HIDDisplayGetPresetCount_cold_1();
    goto LABEL_10;
  }
  v4 = v3;
  v5 = v4;
  if ((a2 & 0x8000000000000000) != 0
    || (-[NSObject presets](v4, "presets"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7 <= a2))
  {
    HIDDisplayLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      HIDDisplaySetPreset_cold_1();

LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  -[NSObject presets](v5, "presets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "writable");
LABEL_11:

  return v10;
}

void *HIDDisplayGetPresetCapabilities(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    -[NSObject capabilities](v2, "capabilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HIDDisplayLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      HIDDisplayGetPresetCount_cold_1();
    v3 = 0;
  }

  return v3;
}

void *HIDDisplayCopyPresetUniqueID(void *a1, unint64_t a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    HIDDisplayLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      HIDDisplayGetPresetCount_cold_1();
    goto LABEL_12;
  }
  v4 = v3;
  v5 = v4;
  if ((a2 & 0x8000000000000000) != 0
    || (-[NSObject presets](v4, "presets"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7 <= a2))
  {
    HIDDisplayLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      HIDDisplaySetPreset_cold_1();

LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  -[NSObject presets](v5, "presets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = v10;

LABEL_13:
  return v11;
}

HIDDisplayPresetInterface *HIDDisplayCreatePresetInterfaceWithService(uint64_t a1)
{
  HIDDisplayPresetInterface *v1;
  HIDDisplayPresetInterface *v2;
  HIDDisplayPresetInterface *v3;

  v1 = -[HIDDisplayPresetInterface initWithService:]([HIDDisplayPresetInterface alloc], "initWithService:", a1);
  v2 = v1;
  if (v1)
    v3 = v1;

  return v2;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void *HIDDisplayGetContainerID(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    -[NSObject containerID](v2, "containerID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HIDDisplayLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      HIDDisplayGetContainerID_cold_1(v2);
    v3 = 0;
  }

  return v3;
}

void HIDDisplayGetPresetCount_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2161BB000, v0, v1, "Invalid HIDDisplayPresetInterfaceRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void HIDDisplayGetFactoryDefaultPresetIndex_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_2161BB000, v0, v1, "%@ HIDDisplayGetFactoryDefaultPresetIndex error %@ ");
  OUTLINED_FUNCTION_2();
}

void HIDDisplayGetActivePresetIndex_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_2161BB000, v0, v1, "%@ HIDDisplayGetActivePresetIndex error %@ ");
  OUTLINED_FUNCTION_2();
}

void HIDDisplayCopyPreset_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_2161BB000, a2, OS_LOG_TYPE_ERROR, "Invalid preset index %ld ", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void HIDDisplaySetPreset_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_2161BB000, v0, v1, "%@ Invalid preset index %ld ");
  OUTLINED_FUNCTION_2();
}

void HIDDisplayGetContainerID_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2161BB000, log, OS_LOG_TYPE_ERROR, "Invalid HIDDisplayInterfaceRef", v1, 2u);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

