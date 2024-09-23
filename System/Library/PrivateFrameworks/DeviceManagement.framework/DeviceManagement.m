void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id DMFEmergencyModeLog()
{
  if (DMFEmergencyModeLog_onceToken != -1)
    dispatch_once(&DMFEmergencyModeLog_onceToken, &__block_literal_global_3);
  return (id)DMFEmergencyModeLog_log;
}

void sub_1B8C0FD7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id DMFPolicyLog()
{
  if (DMFPolicyLog_onceToken != -1)
    dispatch_once(&DMFPolicyLog_onceToken, &__block_literal_global_5);
  return (id)DMFPolicyLog_log;
}

void sub_1B8C1027C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B8C107E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B8C17620(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B8C17B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1B8C1C9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

id DMFAllConfigurationOrganizationTypes()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("screentime");
  v4[1] = CFSTR("personal");
  v4[2] = CFSTR("family");
  v4[3] = CFSTR("internal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1B8C1DA80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id DMFConfigurationSourceClientXPCInterface()
{
  if (DMFConfigurationSourceClientXPCInterface_onceToken != -1)
    dispatch_once(&DMFConfigurationSourceClientXPCInterface_onceToken, &__block_literal_global_1);
  return (id)DMFConfigurationSourceClientXPCInterface_interface;
}

BOOL DMFInterfaceOrientationIsValid(unint64_t a1)
{
  return a1 < 5;
}

void sub_1B8C23C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8C246A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8C24910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8C24BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8C24E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

id DMFConfigurationEngineLog()
{
  if (DMFConfigurationEngineLog_onceToken != -1)
    dispatch_once(&DMFConfigurationEngineLog_onceToken, &__block_literal_global_14);
  return (id)DMFConfigurationEngineLog_log;
}

id DMFAppLog()
{
  if (DMFAppLog_onceToken != -1)
    dispatch_once(&DMFAppLog_onceToken, &__block_literal_global_7);
  return (id)DMFAppLog_log;
}

id DMFPersonalHotspotLog()
{
  if (DMFPersonalHotspotLog_onceToken != -1)
    dispatch_once(&DMFPersonalHotspotLog_onceToken, &__block_literal_global_9);
  return (id)DMFPersonalHotspotLog_log;
}

id DMFServerLog()
{
  if (DMFServerLog_onceToken != -1)
    dispatch_once(&DMFServerLog_onceToken, &__block_literal_global_11);
  return (id)DMFServerLog_log;
}

id DMFOSUpdateLog()
{
  if (DMFOSUpdateLog_onceToken != -1)
    dispatch_once(&DMFOSUpdateLog_onceToken, &__block_literal_global_13_0);
  return (id)DMFOSUpdateLog_log;
}

id DMFAtomicFileWritingLog()
{
  if (DMFAtomicFileWritingLog_onceToken != -1)
    dispatch_once(&DMFAtomicFileWritingLog_onceToken, &__block_literal_global_15_0);
  return (id)DMFAtomicFileWritingLog_log;
}

__CFString *DMFPolicyUnlocalizedDisplayName(unint64_t a1)
{
  if (a1 < 6)
    return off_1E6ED89E0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1B8C36C14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B8C36DA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id DMFObjectDescription(void *a1, __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  objc_class *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;

  v10 = a1;
  if (a2)
  {
    v11 = (objc_class *)MEMORY[0x1E0CB3940];
    v12 = a2;
    a2 = (__CFString *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, &a9);

  }
  v13 = -[__CFString length](a2, "length");
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = CFSTR("; ");
  v19 = &stru_1E6ED9BA0;
  if (!v13)
    v18 = &stru_1E6ED9BA0;
  if (a2)
    v19 = a2;
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p%@%@>"), v16, v10, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id DMFObjectDescriptionWithProperties(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  void *v31;
  id obj;
  void *v33;
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v31 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v31;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          v37 = 0;
          v38 = &v37;
          v39 = 0x3032000000;
          v40 = __Block_byref_object_copy__3;
          v41 = __Block_byref_object_dispose__3;
          v42 = 0;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v3;
            objc_msgSend(v15, "managedObjectContext");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v34[0] = MEMORY[0x1E0C809B0];
            v34[1] = 3221225472;
            v34[2] = __DMFObjectDescriptionWithProperties_block_invoke;
            v34[3] = &unk_1E6ED8AC0;
            v36 = &v37;
            v34[4] = v14;
            v17 = v15;
            v35 = v17;
            objc_msgSend(v16, "performBlockAndWait:", v34);

          }
          else
          {
            v18 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v3, "valueForKeyPath:", v14);
            v17 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("%@='%@'"), v14, v17);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = (void *)v38[5];
            v38[5] = v19;

          }
          if (v38[5])
            objc_msgSend(v33, "addObject:");
          _Block_object_dispose(&v37, 8);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v11);
    }

    objc_msgSend(v33, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    DMFObjectDescription(v3, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    DMFObjectDescription(v3, 0, v5, v6, v7, v8, v9, v10, v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

void sub_1B8C407F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DMFErrorWithCodeAndUserInfo()
{
  return CATErrorWithDomainCodeAndUserInfo();
}

id _DMFErrorDescriptionsWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v19;

  v3 = a2;
  if (_DMFErrorDescriptionsWithCodeAndUserInfo_onceToken != -1)
    dispatch_once(&_DMFErrorDescriptionsWithCodeAndUserInfo_onceToken, &__block_literal_global_16);
  v4 = 0;
  if (a1 > 1999)
  {
    if (a1 > 2699)
    {
      if (a1 > 3999)
      {
        if (a1 > 4299)
        {
          if (a1 <= 4799)
          {
            if (a1 > 4699)
            {
              if (a1 == 4700)
              {
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("Could not update app metadata.");
              }
              else
              {
                if (a1 != 4701)
                  goto LABEL_263;
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("App bundle identifier is missing.");
              }
            }
            else if (a1 == 4300)
            {
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not shut down device.");
            }
            else
            {
              if (a1 != 4400)
                goto LABEL_263;
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not restart device.");
            }
          }
          else if (a1 <= 4899)
          {
            if (a1 == 4800)
            {
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not find target.");
            }
            else
            {
              if (a1 != 4801)
                goto LABEL_263;
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("User is not logged in.");
            }
          }
          else
          {
            switch(a1)
            {
              case 4900:
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("Unknown transaction.");
                break;
              case 5000:
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("Could not set app removability.");
                break;
              case 5200:
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("Could not set app Tap To Pay Screen Lock.");
                break;
              default:
                goto LABEL_263;
            }
          }
        }
        else
        {
          switch(a1)
          {
            case 4000:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("The configuration payload dictionary is invalid.");
              goto LABEL_261;
            case 4001:
              v9 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v10 = CFSTR("The payload identifier “%@” is not unique.");
              goto LABEL_180;
            case 4002:
              v9 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v10 = CFSTR("The organization identifier “%@” is not valid.");
              goto LABEL_180;
            case 4003:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("No configuration source is available.");
              goto LABEL_261;
            case 4004:
              v9 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v10 = CFSTR("The configuration payload identifier “%@” is not valid.");
              goto LABEL_180;
            case 4005:
              v9 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v10 = CFSTR("The configuration organization identifier “%@” is not unique.");
              goto LABEL_180;
            case 4006:
              v9 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v10 = CFSTR("The limit for organizations of type “%@” has been reached.");
              goto LABEL_180;
            case 4007:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not load configuration database.");
              goto LABEL_261;
            default:
              if (a1 == 4100)
              {
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("Could not fetch certificates.");
              }
              else
              {
                if (a1 != 4200)
                  goto LABEL_263;
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("Could not fetch security information.");
              }
              break;
          }
        }
      }
      else if (a1 > 3599)
      {
        if (a1 <= 3700)
        {
          switch(a1)
          {
            case 3600:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("The activation lock bypass code has expired.");
              break;
            case 3601:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("The activation lock bypass code is unavailable.");
              break;
            case 3700:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("The app update was canceled.");
              break;
            default:
              goto LABEL_263;
          }
        }
        else
        {
          switch(a1)
          {
            case 3900:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not fetch effective policy.");
              goto LABEL_261;
            case 3901:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not persist the effective policy.");
              goto LABEL_261;
            case 3902:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not fetch Emergency Mode.");
              goto LABEL_261;
            case 3903:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not persist Emergency Mode.");
              goto LABEL_261;
            case 3904:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not register policy changed notification.");
              goto LABEL_261;
            default:
              if (a1 == 3701)
              {
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("The app update failed.");
              }
              else
              {
                if (a1 != 3950)
                  goto LABEL_263;
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("Effective policy not available");
              }
              break;
          }
        }
      }
      else if (a1 > 3099)
      {
        if (a1 <= 3299)
        {
          if (a1 == 3100)
          {
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Cannot validate applications.");
          }
          else
          {
            if (a1 != 3200)
              goto LABEL_263;
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Could not play lost mode sound.");
          }
        }
        else
        {
          switch(a1)
          {
            case 3300:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Unknown language.");
              break;
            case 3400:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Unknown locale.");
              break;
            case 3500:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not fetch profiles.");
              break;
            default:
              goto LABEL_263;
          }
        }
      }
      else if (a1 <= 2899)
      {
        if (a1 == 2700)
        {
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("Could not apply redemption code.");
        }
        else
        {
          if (a1 != 2800)
            goto LABEL_263;
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("Cannot install provisioning profile.");
        }
      }
      else
      {
        switch(a1)
        {
          case 2900:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Cannot log out user.");
            break;
          case 2901:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("No user logged in.");
            break;
          case 3000:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Cannot trigger diagnostics.");
            break;
          default:
            goto LABEL_263;
        }
      }
    }
    else if (a1 > 2299)
    {
      if (a1 <= 2500)
      {
        switch(a1)
        {
          case 2300:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The device name cannot be set.");
            break;
          case 2400:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Could not fetch provisioning profiles.");
            break;
          case 2500:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The wallpaper image is bad.");
            break;
          default:
            goto LABEL_263;
        }
      }
      else
      {
        switch(a1)
        {
          case 2600:
            v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v8 = CFSTR("The app “%@” is already installed.");
            goto LABEL_237;
          case 2601:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The app is not managed.");
            goto LABEL_261;
          case 2602:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The app is a system app.");
            goto LABEL_261;
          case 2603:
            v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v8 = CFSTR("The app “%@” is already queued to be installed.");
            goto LABEL_237;
          case 2604:
            v11 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v12 = CFSTR("Could not validate manifest.");
LABEL_235:
            objc_msgSend(v11, "cat_localizedStringsForKey:value:table:", v12, &stru_1E6ED9BA0, CFSTR("DMFErrors"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = CFSTR("urlString");
            goto LABEL_238;
          case 2605:
            v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v8 = CFSTR("No license was found for app “%@”.");
LABEL_237:
            objc_msgSend(v7, "cat_localizedStringsForKey:value:table:", v8, &stru_1E6ED9BA0, CFSTR("DMFErrors"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = CFSTR("bundleIdentifier");
            goto LABEL_238;
          case 2606:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Could not validate app identifier.");
            goto LABEL_261;
          case 2607:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The user rejected the request.");
            goto LABEL_261;
          case 2608:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("An iTunes Store login is required.");
            goto LABEL_261;
          case 2609:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Too many apps are in the manifest.");
            goto LABEL_261;
          case 2610:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The redemption code is invalid.");
            goto LABEL_261;
          case 2611:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Not waiting for redemption code.");
            goto LABEL_261;
          case 2612:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The replacement media type is invalid.");
            goto LABEL_261;
          case 2613:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The media download failed.");
            goto LABEL_261;
          case 2614:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The media identifier could not be validated.");
            goto LABEL_261;
          case 2615:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Could not find volume purchase program assignment.");
            goto LABEL_261;
          case 2616:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The install failed because the app is being modified.");
            goto LABEL_261;
          default:
            if (a1 != 2501)
              goto LABEL_263;
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Could not set the wallpaper.");
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 2200:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("A download is in progress.");
          break;
        case 2201:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("A download is complete.");
          break;
        case 2202:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("A download failed.");
          break;
        case 2203:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("There is insufficient network for a download.");
          break;
        case 2204:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("There is insufficient space for a download.");
          break;
        case 2205:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("There is insufficient power for a download.");
          break;
        case 2206:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("The download requires a computer.");
          break;
        case 2207:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("An installation is in progress.");
          break;
        case 2208:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("An installation failed.");
          break;
        case 2209:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("There is insufficient space for an installation.");
          break;
        case 2210:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("There is insufficient power for an installation.");
          break;
        case 2211:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("The installation requires a download.");
          break;
        case 2212:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("The device passcode must be cleared.");
          break;
        case 2213:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("No update available.");
          break;
        case 2214:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("Scan failed.");
          break;
        default:
          switch(a1)
          {
            case 2000:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("The profile must be installed non-interactively.");
              goto LABEL_261;
            case 2001:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("The request cannot be performed while the device is in Setup Assistant.");
              goto LABEL_261;
            case 2002:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Cannot install profile.");
              goto LABEL_261;
            case 2003:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Invalid profile data.");
              goto LABEL_261;
            case 2004:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Invalid file.");
              goto LABEL_261;
            default:
              if (a1 != 2100)
                goto LABEL_263;
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("The device cannot be erased.");
              break;
          }
          break;
      }
    }
    goto LABEL_261;
  }
  if (a1 > 899)
  {
    if (a1 <= 1399)
    {
      if (a1 > 1099)
      {
        if (a1 > 1201)
        {
          switch(a1)
          {
            case 1300:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("A destination name or device identifier is required.");
              break;
            case 1301:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("The requested destination could not be found");
              break;
            case 1302:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not get shared output context");
              break;
            case 1303:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not set output devices");
              break;
            default:
              if (a1 != 1202)
                goto LABEL_263;
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Cannot remove provisioning profile.");
              break;
          }
        }
        else
        {
          switch(a1)
          {
            case 1100:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Could not remove app.");
              break;
            case 1200:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("A unique identifier is required.");
              break;
            case 1201:
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("The provisioning profile is not managed.");
              break;
            default:
              goto LABEL_263;
          }
        }
      }
      else
      {
        switch(a1)
        {
          case 1000:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The app installation was rejected.");
            break;
          case 1001:
            v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v8 = CFSTR("A redemption code is needed for app “%@”.");
            goto LABEL_237;
          case 1002:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The app installation was canceled.");
            break;
          case 1003:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The app installation failed.");
            break;
          case 1004:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("An iTunes Store ID or manifest URL is required.");
            break;
          case 1005:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Could not install app.");
            break;
          case 1006:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Could not redeem the code for the app.");
            break;
          default:
            if (a1 == 900)
            {
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Cannot create escrow keybag.");
            }
            else
            {
              if (a1 != 901)
                goto LABEL_263;
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Cannot copy escrow keybag data.");
            }
            break;
        }
      }
    }
    else
    {
      if (a1 <= 1599)
      {
        switch(a1)
        {
          case 1400:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The App Store is not allowed.");
            goto LABEL_261;
          case 1401:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("An invitation URL is required.");
            goto LABEL_261;
          case 1402:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The invitation URL is invalid.");
            goto LABEL_261;
          case 1403:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("A program identifier is required.");
            goto LABEL_261;
          case 1404:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The program identifier is invalid.");
            goto LABEL_261;
          case 1405:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The device cannot proceed.");
            goto LABEL_261;
          case 1406:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Could not invite user to VPP.");
            goto LABEL_261;
          case 1407:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The user is already being prompted.");
            goto LABEL_261;
          default:
            switch(a1)
            {
              case 1500:
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("An iTunes Store identifier is required.");
                goto LABEL_261;
              case 1501:
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("A persistent identifier is required.");
                goto LABEL_261;
              case 1502:
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("A URL is required.");
                goto LABEL_261;
              case 1503:
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("A file type is required.");
                goto LABEL_261;
              case 1504:
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("The file type is invalid.");
                goto LABEL_261;
              case 1505:
                v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                v6 = CFSTR("Cannot look up book purchase history.");
                goto LABEL_261;
              default:
                goto LABEL_263;
            }
        }
        goto LABEL_263;
      }
      if (a1 > 1799)
      {
        switch(a1)
        {
          case 1800:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("A username is required.");
            goto LABEL_261;
          case 1801:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The specified user is logged in.");
            goto LABEL_261;
          case 1802:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The specified user does not exist.");
            goto LABEL_261;
          case 1803:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The specified user has data to sync.");
            goto LABEL_261;
          case 1804:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Could not delete user.");
            goto LABEL_261;
          default:
            if (a1 == 1900)
            {
              v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              v6 = CFSTR("Cannot remove profile.");
              goto LABEL_261;
            }
            if (a1 != 1901)
              goto LABEL_263;
            v9 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v10 = CFSTR("The profile “%@” is not installed.");
            break;
        }
LABEL_180:
        objc_msgSend(v9, "cat_localizedStringsForKey:value:table:", v10, &stru_1E6ED9BA0, CFSTR("DMFErrors"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("identifier");
LABEL_238:
        objc_msgSend(v3, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CATFormattedStringForKey();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_239:

        goto LABEL_262;
      }
      switch(a1)
      {
        case 1600:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("An iTunes Store identifier or persistent identifier is required.");
          break;
        case 1650:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("Book migration must be complete.");
          break;
        case 1700:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("Cannot get list of users.");
          break;
        default:
          goto LABEL_263;
      }
    }
LABEL_261:
    objc_msgSend(v5, "cat_localizedStringsForKey:value:table:", v6, &stru_1E6ED9BA0, CFSTR("DMFErrors"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CATFormattedStringForKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_262:

    goto LABEL_263;
  }
  if (a1 <= 199)
  {
    switch(a1)
    {
      case 'e':
        v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v8 = CFSTR("The provided app “%@” could not be opened.");
        goto LABEL_237;
      case 'f':
        v11 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The provided URL “%@” could not be opened.");
        goto LABEL_235;
      case 'g':
        v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v6 = CFSTR("The volume could not be set.");
        goto LABEL_261;
      case 'h':
        v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v6 = CFSTR("A password is required to AirPlay to the requested route.");
        goto LABEL_261;
      case 'i':
        v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v6 = CFSTR("The supplied password for the AirPlay route was incorrect.");
        goto LABEL_261;
      case 'j':
        v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v6 = CFSTR("Canceling Single App Mode timed out.");
        goto LABEL_261;
      case 'k':
        v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v8 = CFSTR("Single App Mode could not be initiated for the provided bundle identifier “%@”.");
        goto LABEL_237;
      case 'l':
        objc_msgSend((id)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("The shell command “%@” failed."), &stru_1E6ED9BA0, CFSTR("DMFErrors"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("itemPath");
        goto LABEL_238;
      case 'm':
        v15 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v16 = CFSTR("The property value for “%@” is missing.");
        goto LABEL_163;
      case 'n':
        v15 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v16 = CFSTR("Unknown property “%@”.");
        goto LABEL_163;
      case 'o':
        v15 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v16 = CFSTR("Property “%@” was never retrieved.");
LABEL_163:
        objc_msgSend(v15, "cat_localizedStringsForKey:value:table:", v16, &stru_1E6ED9BA0, CFSTR("DMFErrors"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("propertyKey");
        goto LABEL_238;
      case 'p':
        v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v6 = CFSTR("The AirPlay route is busy.");
        goto LABEL_261;
      case 'q':
        v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v6 = CFSTR("The device failed to request AirPlay mirroring.");
        goto LABEL_261;
      case 'r':
        v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v6 = CFSTR("The device failed to stop AirPlay mirroring.");
        goto LABEL_261;
      default:
        switch(a1)
        {
          case 0:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("Unknown error.");
            goto LABEL_261;
          case 1:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("A parameter was invalid.");
            goto LABEL_261;
          case 2:
            objc_msgSend((id)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("Item “%@” is read-only."), &stru_1E6ED9BA0, CFSTR("DMFErrors"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = CFSTR("itemName");
            goto LABEL_238;
          case 3:
            v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v8 = CFSTR("The app “%@” is not installed.");
            goto LABEL_237;
          case 4:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The request is not permitted.");
            goto LABEL_261;
          case 5:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The client is unauthorized to perform the request.");
            goto LABEL_261;
          case 6:
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("A temporary file could not be created.");
            goto LABEL_261;
          default:
            goto LABEL_263;
        }
        goto LABEL_263;
    }
  }
  if (a1 > 399)
  {
    if (a1 > 699)
    {
      if (a1 > 799)
      {
        if (a1 == 800)
        {
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("Authentication failed.");
        }
        else
        {
          if (a1 != 801)
            goto LABEL_263;
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("The request timed out.");
        }
      }
      else if (a1 == 700)
      {
        v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v6 = CFSTR("The escrow secret cannot be copied.");
      }
      else
      {
        if (a1 != 701)
          goto LABEL_263;
        v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v6 = CFSTR("The device’s passcode cannot be cleared.");
      }
    }
    else
    {
      switch(a1)
      {
        case 600:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("The device’s location cannot be determined.");
          goto LABEL_261;
        case 601:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("The device is not in lost mode.");
          goto LABEL_261;
        case 602:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("The device’s location cannot be requested at this time.");
          goto LABEL_261;
        case 603:
          v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          v6 = CFSTR("The device’s location cannot be requested at this time because audit information cannot be saved.");
          goto LABEL_261;
        default:
          if (a1 == 400)
          {
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The device cannot be put in lost mode.");
          }
          else
          {
            if (a1 != 500)
              goto LABEL_263;
            v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            v6 = CFSTR("The device cannot be taken out of lost mode.");
          }
          break;
      }
    }
    goto LABEL_261;
  }
  if (a1 > 299)
  {
    switch(a1)
    {
      case 300:
        v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v6 = CFSTR("The device cannot be locked.");
        break;
      case 301:
        v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v6 = CFSTR("A passcode must be set.");
        break;
      case 302:
        v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        v6 = CFSTR("The device is in lost mode.");
        break;
      default:
        goto LABEL_263;
    }
    goto LABEL_261;
  }
  switch(a1)
  {
    case 200:
      v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
      v6 = CFSTR("Could not connect cellular.");
      goto LABEL_261;
    case 201:
      v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
      v6 = CFSTR("Could not refresh cellular plans.");
      goto LABEL_261;
    case 202:
      v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
      v6 = CFSTR("Cellular hardware not supported.");
      goto LABEL_261;
    case 203:
      v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
      v6 = CFSTR("Could not fetch cellular info.");
      goto LABEL_261;
    case 204:
      objc_msgSend((id)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("Could not send cellular request (CTError={%@, %@})."), &stru_1E6ED9BA0, CFSTR("DMFErrors"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CTErrorDomain"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CTErrorCode"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CATFormattedStringForKey();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_239;
    case 205:
      v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
      v6 = CFSTR("Invalid response to cellular request.");
      goto LABEL_261;
    default:
      break;
  }
LABEL_263:

  return v4;
}

uint64_t CATErrorWithDomainCodeAndUserInfo()
{
  return MEMORY[0x1E0D0D430]();
}

uint64_t CATFormattedStringForKey()
{
  return MEMORY[0x1E0D0D438]();
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()
{
  return MEMORY[0x1E0CFA228]();
}

uint64_t MKBUserUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E588]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1E0CB2C08](userName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

in_addr_t inet_addr(const char *a1)
{
  return MEMORY[0x1E0C83950](a1);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x1E0C83960](*(_QWORD *)&a1.s_addr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

