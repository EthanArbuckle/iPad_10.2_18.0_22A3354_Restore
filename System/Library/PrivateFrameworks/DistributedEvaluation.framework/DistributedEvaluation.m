void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

char *OUTLINED_FUNCTION_4_2(int *a1)
{
  return strerror(*a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

int *OUTLINED_FUNCTION_3_0()
{
  return __error();
}

void sub_1B96E8890(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
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

uint64_t DESBfloat16TransportReadFrom(uint64_t a1, uint64_t a2)
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
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;

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

uint64_t DESIsInternalInstall()
{
  return os_variant_has_internal_content();
}

BOOL DESDiagnosticsSubmissionAllowed()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FC0]) == 1;

  return v1;
}

BOOL DESServiceAvailable()
{
  void *v0;
  _BOOL8 v1;
  uint64_t v2;

  v0 = (void *)MGCopyAnswer();
  if ((objc_msgSend(v0, "BOOLValue") & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    v2 = MGGetProductType();
    v1 = v2 == 4240173202 || v2 == 2702125347;
  }

  return v1;
}

id DESGetDeviceClass()
{
  return (id)MGCopyAnswer();
}

id DESGetDeviceID()
{
  if (DESGetDeviceID_onceToken != -1)
    dispatch_once(&DESGetDeviceID_onceToken, &__block_literal_global);
  return (id)DESGetDeviceID_deviceID;
}

id DESGetDeviceType()
{
  return (id)MGCopyAnswer();
}

id DESGetOSVersion()
{
  int v0;
  void *v1;
  size_t v3;
  _BYTE v4[256];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 256;
  v0 = sysctlbyname("kern.osversion", v4, &v3, 0, 0);
  v1 = 0;
  if (!v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

id DESGetDeviceLocale()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "canonicalLocaleIdentifierFromString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t DESPathHasFileVault()
{
  return 0;
}

void DESApplyAsynchronousEnumeratorWithCompletion(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  void (**v12)(_QWORD);

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v5, "nextObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __DESApplyAsynchronousEnumeratorWithCompletion_block_invoke;
    v9[3] = &unk_1E706EA48;
    v10 = v5;
    v11 = v6;
    v12 = v7;
    (*((void (**)(id, void *, _QWORD *))v6 + 2))(v11, v8, v9);

  }
  else
  {
    v7[2](v7);
  }

}

void DESApplyAsynchronousEnumerator(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "nextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __DESApplyAsynchronousEnumerator_block_invoke;
    v7[3] = &unk_1E706EA70;
    v8 = v3;
    v9 = v4;
    (*((void (**)(id, void *, _QWORD *, uint64_t))v4 + 2))(v9, v5, v7, v6);

  }
}

id DESSubmissionLogFileURLs(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  DESSubmissionLogGarbageCollect();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DESSubmissionLogDirectoryURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = *MEMORY[0x1E0C9B5A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, v4, 0, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;

  if (a1 && v6)
    *a1 = objc_retainAutorelease(v6);

  return v5;
}

id DESSubmissionLogDirectoryURL()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/DES/"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("SubmissionLogs/"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t DESShouldAlwaysParticipate()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("ShouldAlwaysParticipate"));

  if ((_DWORD)v1)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      DESShouldAlwaysParticipate_cold_1(v2);

  }
  return v1;
}

id DESTemporaryDownloadDirectoryURL()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("dodML-Attachments"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL almostEqual(float a1, float a2)
{
  return vabds_f32(a1, a2) <= 0.00000011921;
}

BOOL almostEqualWithAccuracy(float a1, float a2, float a3)
{
  return vabds_f32(a1, a2) <= a3;
}

BOOL almostEqualDBL(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 2.22044605e-16;
}

BOOL almostEqualDBLWithAccuracy(double a1, double a2, double a3)
{
  return vabdd_f64(a1, a2) <= a3;
}

uint64_t binaryGCD(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = 1;
  if (a1 != a2)
  {
    v3 = a1;
    a1 = a2;
    while (1)
    {
      if (!v3)
        return a1 * v2;
      if (!a1)
      {
        a1 = v3;
        return a1 * v2;
      }
      if (((a1 | v3) & 1) == 0)
        break;
      if ((a1 & 1) == 0 || (v3 & 1) != 0)
      {
        if ((a1 & 1) != 0 || (v3 & 1) == 0)
        {
          v4 = (a1 - v3) >> 1;
          if (v3 > a1)
          {
            v3 = (v3 - a1) >> 1;
          }
          else
          {
            a1 = v3;
            v3 = v4;
          }
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      v3 >>= 1;
LABEL_11:
      if (v3 == a1)
        return a1 * v2;
    }
    v2 *= 2;
    v3 >>= 1;
LABEL_10:
    a1 >>= 1;
    goto LABEL_11;
  }
  return a1 * v2;
}

uint64_t allowCustomWakeUpPeriod()
{
  return 0;
}

uint64_t DESRootURL()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/DES/"), 1);
}

id DESDeviceIdentifierStoreURL()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/DES/"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("deviceIdentifiers.json"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id DESRecordRootURL()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/DES/"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("Records/"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t DESHourOfDayInUTC()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsInTimeZone:fromDate:", v0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "hour");
  return v4;
}

id DESLogAndReturnSunsetError()
{
  NSObject *v0;

  if (DESLogAndReturnSunsetError_onceToken != -1)
    dispatch_once(&DESLogAndReturnSunsetError_onceToken, &__block_literal_global_38);
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    DESLogAndReturnSunsetError_cold_1(v0);

  return (id)DESLogAndReturnSunsetError_sunSetError;
}

_QWORD *DESLogAndSetSunsetError(_QWORD *result)
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    DESLogAndReturnSunsetError();
    result = (id)objc_claimAutoreleasedReturnValue();
    *v1 = result;
  }
  return result;
}

id RecordDirPathForRecordType(void *a1)
{
  void *v1;
  void *v2;

  RecordDirURLForRecordType(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id RecordDirURLForRecordType(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  DESRecordRootURL();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", v1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void GarbageCollectOldRecords(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  unint64_t v54;
  void *v55;
  NSObject *obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  id v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  RecordDirPathForRecordType(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DESRecordStorePolicyManager sharedInstance](DESRecordStorePolicyManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maximumNumberOfRecordsForPluginID:", v1);
  v5 = objc_msgSend(v3, "daysToExpirationOfRecordsForPluginID:", v1);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v71 = 0;
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v2, &v71);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v71;
  v9 = v8;
  if (v7)
  {
    v49 = v3;
    v50 = v1;
    v54 = 2 * v4;
    v51 = v2;
    objc_msgSend(v6, "changeCurrentDirectoryPath:", v2);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v7;
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 16, -v5, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v15 = v11;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
    obj = v15;
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v68;
      v19 = *MEMORY[0x1E0CB2A38];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          v21 = v9;
          if (*(_QWORD *)v68 != v18)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          v66 = v9;
          objc_msgSend(v6, "attributesOfItemAtPath:error:", v22, &v66);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v66;

          objc_msgSend(v23, "objectForKey:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            if (objc_msgSend(v24, "compare:", v14) == -1)
            {
              objc_msgSend(v22, "stringByDeletingPathExtension");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "addObject:", v25);

            }
            else
            {
              objc_msgSend(v52, "addObject:", v24);
            }
          }

        }
        v15 = obj;
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
      }
      while (v17);
    }

    if (objc_msgSend(v52, "count") >= v54)
    {
      objc_msgSend(v52, "sortUsingComparator:", &__block_literal_global_26);
      objc_msgSend(v52, "objectAtIndex:", v54 - 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v51, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v63;
        v31 = *MEMORY[0x1E0CB2A38];
        do
        {
          v32 = 0;
          v33 = v9;
          do
          {
            if (*(_QWORD *)v63 != v30)
              objc_enumerationMutation(v27);
            v34 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v32);
            v61 = v33;
            objc_msgSend(v6, "attributesOfItemAtPath:error:", v34, &v61);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = v61;

            objc_msgSend(v35, "objectForKey:", v31);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v36, "compare:", v55) == -1)
            {
              objc_msgSend(v34, "stringByDeletingPathExtension");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "addObject:", v37);

            }
            ++v32;
            v33 = v9;
          }
          while (v29 != v32);
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
        }
        while (v29);
      }

    }
    else
    {
      v55 = v14;
    }
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v38 = v53;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
    if (v39)
    {
      v40 = v39;
      v41 = 0;
      v42 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v58 != v42)
            objc_enumerationMutation(v38);
          v44 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
          v45 = (uint64_t)v41 + DeleteFileWithBasePath(v6, v44, (uint64_t)CFSTR("json"));
          v41 = (void *)(v45 + DeleteFileWithBasePath(v6, v44, (uint64_t)CFSTR("desdata")));
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
      }
      while (v40);

      if (v41)
      {
        v1 = v50;
        +[DESCoreAnalyticsEventManager sendEventDeleteRecordForBundleID:removedCount:](DESCoreAnalyticsEventManager, "sendEventDeleteRecordForBundleID:removedCount:", v50, v41);
LABEL_39:
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v47 = objc_msgSend(v38, "count");
          *(_DWORD *)buf = 134218498;
          v73 = v41;
          v74 = 2048;
          v75 = v47;
          v76 = 2112;
          v77 = v1;
          _os_log_debug_impl(&dword_1B96E5000, v46, OS_LOG_TYPE_DEBUG, "Garbage collected %lu file(s) and %lu record(s) for %@", buf, 0x20u);
        }

        v2 = v51;
        v7 = v48;
        v3 = v49;
        v26 = obj;
LABEL_42:

        goto LABEL_43;
      }
    }
    else
    {

      v41 = 0;
    }
    v1 = v50;
    goto LABEL_39;
  }
  if (objc_msgSend(v8, "code") != 260)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v73 = v9;
      _os_log_impl(&dword_1B96E5000, v26, OS_LOG_TYPE_DEFAULT, "Couldn't read old DES records: %@", buf, 0xCu);
    }
    goto LABEL_42;
  }
LABEL_43:

}

uint64_t DeleteFileWithBasePath(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v12;

  v5 = a1;
  objc_msgSend(a2, "stringByAppendingPathExtension:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = objc_msgSend(v5, "_fides_removeItemAtPath:error:", v6, &v12);

  v8 = v12;
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      DeleteFileWithBasePath_cold_1();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    DeleteFileWithBasePath_cold_2();
  }

  return v7;
}

void GarbageCollectAllRecords()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint32_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _QWORD v34[4];

  v34[1] = *MEMORY[0x1E0C80C00];
  DESRecordRootURL();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0C999D0];
  v34[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v0, v3, 4, &v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v28;

  if (v4)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (!v7)
      goto LABEL_19;
    v8 = v7;
    v19 = v4;
    v20 = v1;
    v21 = v0;
    v9 = *(_QWORD *)v25;
    while (1)
    {
      v10 = 0;
      do
      {
        v11 = v5;
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        v22 = 0;
        v23 = 0;
        objc_msgSend(v12, "getResourceValue:forKey:error:", &v23, v2, &v22);
        v13 = v23;
        v5 = v22;

        if (!v13)
        {
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          *(_DWORD *)buf = 138412546;
          v31 = v12;
          v32 = 2112;
          v33 = v5;
          v15 = v14;
          v16 = "Fail to read isDirectory for %@ with error=%@";
          v17 = 22;
          goto LABEL_16;
        }
        if ((objc_msgSend(v13, "BOOLValue") & 1) != 0)
        {
          objc_msgSend(v12, "lastPathComponent");
          v14 = objc_claimAutoreleasedReturnValue();
          GarbageCollectOldRecords(v14);
          goto LABEL_13;
        }
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v12;
          v15 = v14;
          v16 = "Unexpected file in DES record root: %@";
          v17 = 12;
LABEL_16:
          _os_log_error_impl(&dword_1B96E5000, v15, OS_LOG_TYPE_ERROR, v16, buf, v17);
        }
LABEL_13:

        ++v10;
      }
      while (v8 != v10);
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      v8 = v18;
      if (!v18)
      {
        v1 = v20;
        v0 = v21;
        v4 = v19;
        goto LABEL_19;
      }
    }
  }
  if (objc_msgSend(v5, "code") != 260)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v0;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_1B96E5000, v6, OS_LOG_TYPE_DEFAULT, "Couldn't find any directories in %@ with error=%@", buf, 0x16u);
    }
LABEL_19:

  }
}

id DESAmendedRecordInfo(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v21;
  size_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a1;
  v5 = a2;
  v6 = a3;
  v22 = 256;
  v7 = 0;
  if (!sysctlbyname("kern.osversion", buf, &v22, 0, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  DESGetDeviceType();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v6, "length") >= 4)
    v9 = (int)(objc_msgSend(v6, "length") - 4);
  else
    v9 = 0;
  objc_msgSend(v6, "substringFromIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length")
    && ((int)objc_msgSend(v10, "length") < 1 ? (v11 = 0) : (v11 = (int)(objc_msgSend(v10, "length") - 1)),
        v12 = (char)objc_msgSend(v10, "characterAtIndex:", v11) - 48,
        v12 <= 3))
  {
    v13 = off_1E706ECE8[v12];
  }
  else
  {
    v13 = CFSTR("train");
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v7, CFSTR("$device_os"));
  objc_msgSend(v14, "setValue:forKey:", v8, CFSTR("$device_type"));
  objc_msgSend(v14, "setValue:forKey:", v10, CFSTR("$dodml_device_identifier"));
  objc_msgSend(v14, "setValue:forKey:", v13, CFSTR("$dodml_dataset"));
  objc_msgSend(v14, "setValue:forKey:", v5, CFSTR("$record_type"));
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    v24 = v10;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1B96E5000, v15, OS_LOG_TYPE_INFO, "DES identifier: %{private}@, dataset: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InfoKeys-%@"), v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v18;
      _os_log_impl(&dword_1B96E5000, v19, OS_LOG_TYPE_INFO, "Using custom info key/value pairs set by device owner: %@", buf, 0xCu);
    }

    objc_msgSend(v14, "addEntriesFromDictionary:", v18);
  }
  objc_msgSend(v14, "addEntriesFromDictionary:", v21);

  return v14;
}

BOOL AddRecordsForTypeWithUUIDs(void *a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  _QWORD *v32;
  id v33;
  id v34;
  id v35;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v35 = a1;
  v9 = a2;
  v34 = a3;
  v33 = a4;
  if (a5)
    *a5 = 0;
  RecordDirPathForRecordType(v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v9;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v37)
  {
    v11 = *(_QWORD *)v39;
    v12 = CFSTR("json");
    v13 = 0x1E0C99000uLL;
    v32 = a5;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v15, "UUIDString", v32);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathComponent:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByAppendingPathExtension:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)objc_msgSend(objc_alloc(*(Class *)(v13 + 3408)), "initWithContentsOfFile:options:error:", v18, 1, a5);
        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v19, 0, a5);
          v20 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            DESAmendedRecordInfo(v20, v35, v33);
            v21 = v13;
            v22 = v11;
            v23 = v10;
            v24 = v12;
            v25 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v34, "setObject:forKey:", v25, v15);
            v20 = v25;
            v12 = v24;
            v10 = v23;
            v11 = v22;
            v13 = v21;
            a5 = v32;
          }
          else
          {
            +[DESLogging coreChannel](DESLogging, "coreChannel");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              if (a5)
                v28 = *a5;
              else
                v28 = 0;
              *(_DWORD *)buf = 138412546;
              v43 = v18;
              v44 = 2112;
              v45 = v28;
              _os_log_impl(&dword_1B96E5000, v27, OS_LOG_TYPE_INFO, "Skipping unparsable record: %@, %@", buf, 0x16u);
            }

          }
        }
        else
        {
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            if (a5)
              v26 = *a5;
            else
              v26 = 0;
            *(_DWORD *)buf = 138412546;
            v43 = v18;
            v44 = 2112;
            v45 = v26;
            _os_log_impl(&dword_1B96E5000, v20, OS_LOG_TYPE_INFO, "Skipping unreadable record: %@, %@", buf, 0x16u);
          }
        }

      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v37);
  }

  v29 = objc_msgSend(obj, "count");
  v30 = !a5 || v29 || !*a5;

  return v30;
}

id AddRecordsForType(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  _QWORD *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v38 = a2;
  v37 = a3;
  GarbageCollectOldRecords(v7);
  if (a4)
    *a4 = 0;
  v39 = a4;
  v34 = v7;
  RecordDirPathForRecordType(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v35 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v36 = (void *)v8;
  objc_msgSend(v35, "enumeratorAtPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v11, "skipDescendants", v34);
        objc_msgSend(v16, "pathExtension");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("json"));

        if (v18)
        {
          v19 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v16, "stringByDeletingPathExtension");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v19, "initWithUUIDString:", v20);

          if (v21)
          {
            objc_msgSend(v10, "addObject:", v21);
          }
          else
          {
            +[DESLogging coreChannel](DESLogging, "coreChannel");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v45 = v16;
              _os_log_impl(&dword_1B96E5000, v22, OS_LOG_TYPE_INFO, "Skipping bad record name: %@", buf, 0xCu);
            }

          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v13);
  }

  v23 = v10;
  v24 = objc_msgSend(v10, "count");
  if (!v39 || v24)
  {
    v29 = v34;
    v28 = v35;
    v26 = v37;
    v25 = v38;
    v27 = v36;
  }
  else
  {
    v26 = v37;
    v25 = v38;
    v28 = v35;
    v27 = v36;
    if (*v39)
    {

      v23 = 0;
    }
    v29 = v34;
  }

  if (v23 && AddRecordsForTypeWithUUIDs(v29, v23, v25, v26, v39))
  {
    v30 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v25, "allKeys");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

id FindRecordTypeForRecordUUID(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a1;
  v4 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FindRecordTypeForRecordUUID_block_invoke;
  v8[3] = &unk_1E706EC00;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_1B96F14F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

id RecordDataForUUID(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a2;
  RecordDirPathForRecordType(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("desdata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v9, 1, a3);
  return v10;
}

id RecordInfoForUUID(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  RecordDirPathForRecordType(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v9, 1, &v19);
  v11 = v19;
  if (v10)
  {
    v18 = v11;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 0, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v12;
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v9;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_1B96E5000, v16, OS_LOG_TYPE_INFO, "Unparsable record: %@, %@", buf, 0x16u);
      }

      v14 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v13);
    }

  }
  else
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v9;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1B96E5000, v15, OS_LOG_TYPE_INFO, "Unreadable record: %@, %@", buf, 0x16u);
    }

    if (a3)
    {
      v13 = objc_retainAutorelease(v11);
      v14 = 0;
      *a3 = v13;
    }
    else
    {
      v14 = 0;
      v13 = v11;
    }
  }

  return v14;
}

void sub_1B96F2360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id DESServiceGetXPCInterface(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
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
  _QWORD v26[7];
  _QWORD v27[5];
  _QWORD v28[7];
  _QWORD v29[4];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  v2 = &protocolRef_DESRecordStoreService;
  if (a1 == 1)
    v2 = &protocolRef_DESFullService;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", *v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 == 1)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_runEvaluationForBundleId_recipePath_recordUUIDs_attachments_sandboxExtensions_completion_, 2, 0);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_runEvaluationForBundleId_recipePath_recordUUIDs_attachments_sandboxExtensions_completion_, 3, 0);

    v10 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_runEvaluationForBundleId_recipePath_recordUUIDs_attachments_sandboxExtensions_completion_, 4, 0);

    v13 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    v29[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_fetchRecordsForBundleId_completion_, 0, 1);

    v16 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    v28[3] = objc_opt_class();
    v28[4] = objc_opt_class();
    v28[5] = objc_opt_class();
    v28[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_fetchRecordsForBundleId_completion_, 1, 1);

    v19 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    v27[3] = objc_opt_class();
    v27[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_runLiveEvaluationForBundleId_taskSource_baseURL_localeIdentifier_completion_, 0, 1);

  }
  v22 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  v26[4] = objc_opt_class();
  v26[5] = objc_opt_class();
  v26[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_fetchSavedRecordInfoForRecordType_completion_, 0, 1);

  return v3;
}

void sub_1B96F6BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
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

void DESSubmissionLogGarbageCollect()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *obj;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  id v75;
  _BYTE v76[128];
  _BYTE v77[128];
  void *v78;
  _QWORD v79[3];
  _QWORD v80[3];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  DESSubmissionLogDirectoryURL();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = 0;
  v56 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v56, "contentsOfDirectoryAtPath:error:", v1, &v71);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v71;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v2;
    objc_msgSend(v2, "filteredArrayUsingPredicate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -28, v7, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v5;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    v51 = v1;
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v68;
      v55 = *MEMORY[0x1E0CB2A38];
      v11 = *MEMORY[0x1E0CB2AF0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          v13 = v3;
          if (*(_QWORD *)v68 != v10)
            objc_enumerationMutation(obj);
          objc_msgSend(v1, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v3;
          objc_msgSend(v56, "attributesOfItemAtPath:error:", v14, &v66);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v66;

          if (v15)
          {
            objc_msgSend(v15, "objectForKey:", v55);
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKey:", v11);
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = (void *)v17;
            if (v16)
              v19 = v17 == 0;
            else
              v19 = 1;
            if (!v19)
            {
              if (-[NSObject compare:](v16, "compare:", v50) == -1)
                objc_msgSend(v54, "addObject:", v14);
              v79[0] = CFSTR("Size");
              v79[1] = CFSTR("Date");
              v80[0] = v18;
              v80[1] = v16;
              v79[2] = CFSTR("Path");
              v80[2] = v14;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "addObject:", v20);

              v1 = v51;
            }

          }
          else
          {
            +[DESLogging coreChannel](DESLogging, "coreChannel");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v73 = v3;
              _os_log_error_impl(&dword_1B96E5000, v16, OS_LOG_TYPE_ERROR, "Failed to get file attributes: %@", buf, 0xCu);
            }
          }

        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("Date"), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "sortedArrayUsingDescriptors:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v27 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v63 != v27)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
          objc_msgSend(v29, "objectForKey:", CFSTR("Size"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v26 += objc_msgSend(v30, "unsignedLongLongValue");

          if (v26 > 0xA00000)
          {
            objc_msgSend(v29, "objectForKey:", CFSTR("Path"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "addObject:", v31);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
      }
      while (v25);
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v32 = v54;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v59;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          v37 = v3;
          if (*(_QWORD *)v59 != v35)
            objc_enumerationMutation(v32);
          v38 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
          v57 = v3;
          v39 = objc_msgSend(v56, "removeItemAtPath:error:", v38, &v57);
          v3 = v57;

          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = v40;
          if (v39)
          {
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v73 = v38;
              _os_log_debug_impl(&dword_1B96E5000, v41, OS_LOG_TYPE_DEBUG, "Garbage collected DES submission log file %@", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v73 = v38;
            v74 = 2112;
            v75 = v3;
            _os_log_error_impl(&dword_1B96E5000, v41, OS_LOG_TYPE_ERROR, "Could not garbage collect old DES submission log file %@: %@", buf, 0x16u);
          }

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
      }
      while (v34);
    }

    v1 = v51;
    v2 = v48;
  }
  else
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      DESSubmissionLogGarbageCollect_cold_1((uint64_t)v3, obj, v42, v43, v44, v45, v46, v47);
  }

}

uint64_t DESWriteSubmissionLogData(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  char v19;
  id v20;
  id v21;
  char v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  id v34;
  id v35;

  v5 = a2;
  v6 = a1;
  DESSubmissionLogDirectoryURL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (DESSubmissionLogsDateFormatter_onceToken != -1)
    dispatch_once(&DESSubmissionLogsDateFormatter_onceToken, &__block_literal_global_21);
  v9 = (id)DESSubmissionLogsDateFormatter_formatter;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@%@-%@.%@"), v6, v14, v11, CFSTR("submissionlog"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!sDESSubmissionLogHandler)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v35 = 0;
    v19 = objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v35);
    v20 = v35;
    v21 = v20;
    if ((v19 & 1) == 0)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        DESWriteSubmissionLogData_cold_2((uint64_t)v8, (uint64_t)v21, v24);

      if (a3)
      {
        v21 = objc_retainAutorelease(v21);
        v17 = 0;
        *a3 = v21;
      }
      else
      {
        v17 = 0;
      }
      goto LABEL_20;
    }
    v33 = v18;
    v34 = v20;
    v22 = objc_msgSend(v5, "writeToFile:options:error:", v16, 805306368, &v34);
    v23 = v34;

    if ((v22 & 1) != 0)
    {
      DESSubmissionLogGarbageCollect();
      v17 = 1;
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        DESWriteSubmissionLogData_cold_1((uint64_t)v23, v25, v26, v27, v28, v29, v30, v31);

      if (a3)
      {
        v21 = objc_retainAutorelease(v23);
        v17 = 0;
        *a3 = v21;
LABEL_19:
        v18 = v33;
LABEL_20:

        goto LABEL_21;
      }
      v17 = 0;
    }
    v21 = v23;
    goto LABEL_19;
  }
  v17 = (*(uint64_t (**)(void))(sDESSubmissionLogHandler + 16))();
LABEL_21:

  return v17;
}

void DESSubmissionLogSetHandler(void *a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "copy");
  v2 = (void *)sDESSubmissionLogHandler;
  sDESSubmissionLogHandler = v1;

}

uint64_t DESBinary32TransportReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t result;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v6 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = *v3;
        v11 = *(_QWORD *)(a2 + v10);
        v12 = v11 + 1;
        if (v11 == -1 || v12 > *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v11);
        *(_QWORD *)(a2 + v10) = v12;
        v9 |= (unint64_t)(v13 & 0x7F) << v7;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v7 += 7;
        if (v8++ >= 9)
        {
          v9 = 0;
          v15 = *v5;
          v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *v5;
      v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(_BYTE *)(a2 + v15))
        v9 = 0;
LABEL_14:
      v17 = v9 & 7;
      if (v16 || v17 == 4)
        break;
      if ((v9 >> 3) == 1)
      {
        if (v17 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v20 = (unint64_t *)(a2 + *v3);
            v21 = *v20;
            v22 = *(_QWORD *)(a2 + *v4);
            if (*v20 >= v22)
              break;
            v23 = *v5;
            if (*(_BYTE *)(a2 + v23))
              break;
            if (v21 > 0xFFFFFFFFFFFFFFFBLL || v21 + 4 > v22)
              *(_BYTE *)(a2 + v23) = 1;
            else
              *v20 = v21 + 4;
            PBRepeatedFloatAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(_QWORD *)(a2 + *v4))
            *(_QWORD *)(a2 + v24) = v25 + 4;
          else
            *(_BYTE *)(a2 + v15) = 1;
          PBRepeatedFloatAdd();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t DESBinary64TransportReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t result;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v6 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = *v3;
        v11 = *(_QWORD *)(a2 + v10);
        v12 = v11 + 1;
        if (v11 == -1 || v12 > *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v11);
        *(_QWORD *)(a2 + v10) = v12;
        v9 |= (unint64_t)(v13 & 0x7F) << v7;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v7 += 7;
        if (v8++ >= 9)
        {
          v9 = 0;
          v15 = *v5;
          v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *v5;
      v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(_BYTE *)(a2 + v15))
        v9 = 0;
LABEL_14:
      v17 = v9 & 7;
      if (v16 || v17 == 4)
        break;
      if ((v9 >> 3) == 1)
      {
        if (v17 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v20 = (unint64_t *)(a2 + *v3);
            v21 = *v20;
            v22 = *(_QWORD *)(a2 + *v4);
            if (*v20 >= v22)
              break;
            v23 = *v5;
            if (*(_BYTE *)(a2 + v23))
              break;
            if (v21 > 0xFFFFFFFFFFFFFFF7 || v21 + 8 > v22)
              *(_BYTE *)(a2 + v23) = 1;
            else
              *v20 = v21 + 8;
            PBRepeatedDoubleAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)(a2 + *v4))
            *(_QWORD *)(a2 + v24) = v25 + 8;
          else
            *(_BYTE *)(a2 + v15) = 1;
          PBRepeatedDoubleAdd();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t DESPFLNoisableReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  unint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  uint64_t v19;
  int v20;
  int v21;
  char v23;
  unsigned int v24;
  uint64_t v25;
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
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t result;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  DESDataTransport *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x1EF22C000uLL;
  v8 = 0x1EF22C000uLL;
  v9 = (int *)MEMORY[0x1E0D82BB8];
  v10 = 0x1EF22C000uLL;
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = *v3;
      v15 = *(_QWORD *)(a2 + v14);
      v16 = v15 + 1;
      if (v15 == -1 || v16 > *(_QWORD *)(a2 + *v4))
        break;
      v17 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v15);
      *(_QWORD *)(a2 + v14) = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0)
        goto LABEL_12;
      v11 += 7;
      v18 = v12++ >= 9;
      if (v18)
      {
        v13 = 0;
        v19 = *v5;
        v20 = *(unsigned __int8 *)(a2 + v19);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v19 = *v5;
    v20 = *(unsigned __int8 *)(a2 + v19);
    if (*(_BYTE *)(a2 + v19))
      v13 = 0;
LABEL_14:
    v21 = v13 & 7;
    if (v20 || v21 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v13 >> 3))
    {
      case 1u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 444)) |= 4u;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          v28 = v27 + 1;
          if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v27);
          *(_QWORD *)(a2 + v26) = v28;
          v25 |= (unint64_t)(v29 & 0x7F) << v23;
          if ((v29 & 0x80) == 0)
            goto LABEL_64;
          v23 += 7;
          v18 = v24++ >= 9;
          if (v18)
          {
            LODWORD(v25) = 0;
            goto LABEL_66;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_64:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_66:
        v55 = *(int *)(v8 + 448);
        goto LABEL_71;
      case 2u:
        PBReaderReadString();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(int *)(v10 + 452);
        goto LABEL_58;
      case 3u:
        v32 = 0;
        v33 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 444)) |= 2u;
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
            v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v35);
            *(_QWORD *)(a2 + v34) = v36;
            v25 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              v18 = v33++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_70:
        v55 = 72;
LABEL_71:
        *(_DWORD *)(a1 + v55) = v25;
        goto LABEL_84;
      case 4u:
        *(_BYTE *)(a1 + *(int *)(v7 + 444)) |= 1u;
        v38 = *v3;
        v39 = *(_QWORD *)(a2 + v38);
        if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v40 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v39);
          *(_QWORD *)(a2 + v38) = v39 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v40 = 0;
        }
        *(_QWORD *)(a1 + 56) = v40;
        goto LABEL_84;
      case 5u:
        if (v21 != 2)
        {
          v56 = *v3;
          v57 = *(_QWORD *)(a2 + v56);
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(_QWORD *)(a2 + *v4))
            *(_QWORD *)(a2 + v56) = v57 + 8;
          else
            *(_BYTE *)(a2 + v19) = 1;
          PBRepeatedDoubleAdd();
          goto LABEL_84;
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (1)
        {
          v42 = (unint64_t *)(a2 + *v3);
          v43 = *v42;
          v44 = *(_QWORD *)(a2 + *v4);
          if (*v42 >= v44)
            break;
          v45 = *v5;
          if (*(_BYTE *)(a2 + v45))
            break;
          if (v43 > 0xFFFFFFFFFFFFFFF7 || v43 + 8 > v44)
            *(_BYTE *)(a2 + v45) = 1;
          else
            *v42 = v43 + 8;
          PBRepeatedDoubleAdd();
        }
        goto LABEL_62;
      case 6u:
        if (v21 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v46 = (unint64_t *)(a2 + *v3);
            v47 = *v46;
            v48 = *(_QWORD *)(a2 + *v4);
            if (*v46 >= v48)
              break;
            v49 = *v5;
            if (*(_BYTE *)(a2 + v49))
              break;
            if (v47 > 0xFFFFFFFFFFFFFFFBLL || v47 + 4 > v48)
              *(_BYTE *)(a2 + v49) = 1;
            else
              *v46 = v47 + 4;
            PBRepeatedFloatAdd();
          }
LABEL_62:
          PBReaderRecallMark();
        }
        else
        {
          v58 = *v3;
          v59 = *(_QWORD *)(a2 + v58);
          if (v59 <= 0xFFFFFFFFFFFFFFFBLL && v59 + 4 <= *(_QWORD *)(a2 + *v4))
            *(_QWORD *)(a2 + v58) = v59 + 4;
          else
            *(_BYTE *)(a2 + v19) = 1;
          PBRepeatedFloatAdd();
        }
        goto LABEL_84;
      case 7u:
        PBReaderReadString();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = 88;
LABEL_58:
        v50 = *(void **)(a1 + v31);
        *(_QWORD *)(a1 + v31) = v30;

        goto LABEL_84;
      case 8u:
        v51 = v10;
        v52 = v8;
        v53 = v7;
        v54 = objc_alloc_init(DESDataTransport);
        objc_storeStrong((id *)(a1 + 64), v54);
        if (PBReaderPlaceMark() && DESDataTransportReadFrom((id *)&v54->super.super.isa, a2))
        {
          PBReaderRecallMark();

          v7 = v53;
          v8 = v52;
          v10 = v51;
LABEL_84:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_84;
    }
  }
}

void calculateSigmaFromEpsilonAndDeltaForUnitL2Norm(long double a1, long double a2)
{
  long double v4;
  double v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD *v11;
  _QWORD v12[3];
  _QWORD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2 != 0.0 && a1 != 0.0)
  {
    v4 = erfc(-0.0) * 0.5;
    v5 = exp(a1);
    if (v4 - v5 * (erfc(sqrt(a1 + a1) / 1.41421356) * 0.5) <= a2)
    {
      v12[0] = &off_1E706E758;
      *(long double *)&v12[1] = a1;
      *(long double *)&v12[2] = a2;
      v13 = v12;
      bisect((uint64_t)v12);
      v8 = v13;
      if (v13 == v12)
      {
        v9 = 4;
        v8 = v12;
      }
      else
      {
        if (!v13)
          return;
        v9 = 5;
      }
      (*(void (**)(void))(*v8 + 8 * v9))();
    }
    else
    {
      v10[0] = &off_1E706E7B0;
      *(long double *)&v10[1] = a1;
      *(long double *)&v10[2] = a2;
      v11 = v10;
      bisect((uint64_t)v10);
      v6 = v11;
      if (v11 == v10)
      {
        v7 = 4;
        v6 = v10;
      }
      else
      {
        if (!v11)
          return;
        v7 = 5;
      }
      (*(void (**)(void))(*v6 + 8 * v7))();
    }
  }
}

void sub_1B9702FE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v18;
  uint64_t v19;

  v18 = a17;
  if (a17 == &a14)
  {
    v19 = 4;
    v18 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

double bisect(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v13;

  v13 = 0.0;
  v2 = *(_QWORD *)(a1 + 24);
  if (!v2)
    goto LABEL_16;
  (*(void (**)(uint64_t, double *))(*(_QWORD *)v2 + 48))(v2, &v13);
  v13 = 1000.0;
  v4 = *(_QWORD *)(a1 + 24);
  if (!v4)
    goto LABEL_16;
  if (v3 * (*(double (**)(uint64_t, double *))(*(_QWORD *)v4 + 48))(v4, &v13) < 0.0)
  {
    v5 = 0.0;
    v6 = 1000.0;
    while (1)
    {
      v7 = (v5 + v6) * 0.5;
      v13 = v7;
      v8 = *(_QWORD *)(a1 + 24);
      if (!v8)
        break;
      if (fabs((*(double (**)(uint64_t, double *))(*(_QWORD *)v8 + 48))(v8, &v13)) <= 2.22044605e-16)
        return v7;
      v13 = (v5 + v6) * 0.5;
      v9 = *(_QWORD *)(a1 + 24);
      if (!v9)
        break;
      (*(void (**)(uint64_t, double *))(*(_QWORD *)v9 + 48))(v9, &v13);
      v13 = v5;
      v11 = *(_QWORD *)(a1 + 24);
      if (!v11)
        break;
      if (v10 * (*(double (**)(uint64_t, double *))(*(_QWORD *)v11 + 48))(v11, &v13) < 0.0)
        v6 = (v5 + v6) * 0.5;
      else
        v5 = (v5 + v6) * 0.5;
      if (v6 - v5 < 2.22044605e-16)
        return v7;
    }
LABEL_16:
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return NAN;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1BCCC3734);
}

void std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0>,double ()(double)>::~__func()
{
  JUMPOUT(0x1BCCC3734);
}

__n128 std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0>,double ()(double)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E706E758;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0>,double ()(double)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E706E758;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

long double std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0>,double ()(double)>::operator()(uint64_t a1, double *a2)
{
  double v3;
  long double v4;
  long double v5;
  double v6;

  v3 = *a2;
  v4 = *(double *)(a1 + 8);
  v5 = erfc(sqrt(*a2 * v4) / -1.41421356) * 0.5;
  v6 = exp(v4);
  return v5 - v6 * (erfc(sqrt((v3 + 2.0) * v4) / 1.41421356) * 0.5) - *(double *)(a1 + 16);
}

uint64_t std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0>,double ()(double)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0>,double ()(double)>::target_type()
{
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

void std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1>,double ()(double)>::~__func()
{
  JUMPOUT(0x1BCCC3734);
}

__n128 std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1>,double ()(double)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E706E7B0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1>,double ()(double)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E706E7B0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

long double std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1>,double ()(double)>::operator()(uint64_t a1, double *a2)
{
  double v3;
  long double v4;
  long double v5;
  double v6;

  v3 = *a2;
  v4 = *(double *)(a1 + 8);
  v5 = erfc(sqrt(*a2 * v4) / 1.41421356) * 0.5;
  v6 = exp(v4);
  return v5 - v6 * (erfc(sqrt((v3 + 2.0) * v4) / 1.41421356) * 0.5) - *(double *)(a1 + 16);
}

uint64_t std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1>,double ()(double)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1>,double ()(double)>::target_type()
{
}

void sub_1B97042FC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t DESEncryptedDataReadFrom(uint64_t a1, uint64_t a2)
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
  BOOL v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
        if (v15)
          v16 = 1;
        else
          v16 = (v10 & 7) == 4;
        if (!v16)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v17 = 0;
              v18 = 0;
              v19 = 0;
              *(_BYTE *)(a1 + 36) |= 1u;
              break;
            case 2u:
              PBReaderReadData();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 16;
              goto LABEL_31;
            case 3u:
              PBReaderReadData();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 24;
              goto LABEL_31;
            case 4u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 8;
LABEL_31:
              v26 = *(void **)(a1 + v25);
              *(_QWORD *)(a1 + v25) = v24;

              goto LABEL_36;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_36:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
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
              goto LABEL_33;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_35;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_35:
          *(_DWORD *)(a1 + 32) = v19;
          goto LABEL_36;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id getFedStatsDataEncoderClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getFedStatsDataEncoderClass_softClass;
  v7 = getFedStatsDataEncoderClass_softClass;
  if (!getFedStatsDataEncoderClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getFedStatsDataEncoderClass_block_invoke;
    v3[3] = &unk_1E706F220;
    v3[4] = &v4;
    __getFedStatsDataEncoderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B9705A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFedStatsDataEncoderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!PrivateFederatedLearningLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E706F200;
    v5 = 0;
    PrivateFederatedLearningLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PrivateFederatedLearningLibraryCore_frameworkLibrary)
    __getFedStatsDataEncoderClass_block_invoke_cold_1(&v3);
  result = objc_getClass("FedStatsDataEncoder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getFedStatsDataEncoderClass_block_invoke_cold_2();
  getFedStatsDataEncoderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B9706418(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, int a12, __int16 a13, __int16 a14, id a15, __int128 a16)
{
  _QWORD *v16;
  const char *v17;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;

  if (a2)
  {
    v19 = objc_begin_catch(a1);
    if (a2 == 2)
    {
      v20 = v19;
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v17);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bundleIdentifier");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138413058;
        *(_QWORD *)((char *)&buf + 4) = v29;
        WORD6(buf) = 2112;
        *(_QWORD *)((char *)&buf + 14) = v24;
        a14 = 2112;
        a15 = v20;
        LOWORD(a16) = 2112;
        *(_QWORD *)((char *)&a16 + 2) = v25;
        _os_log_error_impl(&dword_1B96E5000, v21, OS_LOG_TYPE_ERROR, "Caught exception during %@ for plugin %@: %@, %@", (uint8_t *)&buf, 0x2Au);

      }
      if (v16)
      {
        ErrorFromException(v20);
        *v16 = (id)objc_claimAutoreleasedReturnValue();
      }

      objc_end_catch();
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v17);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "bundleIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412546;
        *(_QWORD *)((char *)&buf + 4) = v26;
        WORD6(buf) = 2112;
        *(_QWORD *)((char *)&buf + 14) = v28;
        _os_log_error_impl(&dword_1B96E5000, v22, OS_LOG_TYPE_ERROR, "Caught non-ObjC exception during %@ for plugin %@", (uint8_t *)&buf, 0x16u);

      }
      if (v16)
      {
        ErrorFromException(0);
        *v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
    }
    JUMPOUT(0x1B97063C8);
  }
  _Unwind_Resume(a1);
}

id ErrorFromException(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  if (a1)
  {
    v6 = CFSTR("callStackSymbols");
    objc_msgSend(a1, "callStackSymbols");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 4000, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 4000, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void sub_1B970682C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, int a10, __int16 a11, __int16 a12, uint64_t a13, __int128 a14)
{
  _QWORD *v14;
  const char *v15;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;

  if (a2)
  {
    v17 = objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      v18 = v17;
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v15);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bundleIdentifier");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a9) = 138413058;
        *(_QWORD *)((char *)&a9 + 4) = v21;
        WORD6(a9) = 2112;
        *(_QWORD *)((char *)&a9 + 14) = v23;
        a12 = 2112;
        a13 = (uint64_t)v18;
        LOWORD(a14) = 2112;
        *(_QWORD *)((char *)&a14 + 2) = v24;
        _os_log_error_impl(&dword_1B96E5000, v19, OS_LOG_TYPE_ERROR, "Caught exception during %@ for plugin %@: %@, %@", (uint8_t *)&a9, 0x2Au);

      }
      if (v14)
      {
        ErrorFromException(v18);
        *v14 = (id)objc_claimAutoreleasedReturnValue();
      }

      objc_end_catch();
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v15);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a9) = 138412546;
        *(_QWORD *)((char *)&a9 + 4) = v25;
        WORD6(a9) = 2112;
        *(_QWORD *)((char *)&a9 + 14) = v27;
        _os_log_error_impl(&dword_1B96E5000, v20, OS_LOG_TYPE_ERROR, "Caught non-ObjC exception during %@ for plugin %@", (uint8_t *)&a9, 0x16u);

      }
      if (v14)
      {
        ErrorFromException(0);
        *v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
    }
    JUMPOUT(0x1B97067E4);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B9706B38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, int a10, __int16 a11, __int16 a12, uint64_t a13, __int128 a14)
{
  _QWORD *v14;
  const char *v15;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;

  if (a2)
  {
    v17 = objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      v18 = v17;
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v15);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bundleIdentifier");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a9) = 138413058;
        *(_QWORD *)((char *)&a9 + 4) = v21;
        WORD6(a9) = 2112;
        *(_QWORD *)((char *)&a9 + 14) = v23;
        a12 = 2112;
        a13 = (uint64_t)v18;
        LOWORD(a14) = 2112;
        *(_QWORD *)((char *)&a14 + 2) = v24;
        _os_log_error_impl(&dword_1B96E5000, v19, OS_LOG_TYPE_ERROR, "Caught exception during %@ for plugin %@: %@, %@", (uint8_t *)&a9, 0x2Au);

      }
      if (v14)
      {
        ErrorFromException(v18);
        *v14 = (id)objc_claimAutoreleasedReturnValue();
      }

      objc_end_catch();
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v15);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a9) = 138412546;
        *(_QWORD *)((char *)&a9 + 4) = v25;
        WORD6(a9) = 2112;
        *(_QWORD *)((char *)&a9 + 14) = v27;
        _os_log_error_impl(&dword_1B96E5000, v20, OS_LOG_TYPE_ERROR, "Caught non-ObjC exception during %@ for plugin %@", (uint8_t *)&a9, 0x16u);

      }
      if (v14)
      {
        ErrorFromException(0);
        *v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
    }
    JUMPOUT(0x1B9706AF0);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B9706E0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, int a10, __int16 a11, __int16 a12, uint64_t a13, __int128 a14)
{
  void *v14;
  const char *v15;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;

  if (a2)
  {
    v17 = objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      v18 = v17;
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v15);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bundleIdentifier");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a9) = 138413058;
        *(_QWORD *)((char *)&a9 + 4) = v23;
        WORD6(a9) = 2112;
        *(_QWORD *)((char *)&a9 + 14) = v25;
        a12 = 2112;
        a13 = (uint64_t)v18;
        LOWORD(a14) = 2112;
        *(_QWORD *)((char *)&a14 + 2) = v26;
        _os_log_error_impl(&dword_1B96E5000, v19, OS_LOG_TYPE_ERROR, "Caught exception during %@ for plugin %@: %@, %@", (uint8_t *)&a9, 0x2Au);

      }
      ErrorFromException(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "completeWithError:completionHandler:", v20, &__block_literal_global_8);

      objc_end_catch();
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v15);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a9) = 138412546;
        *(_QWORD *)((char *)&a9 + 4) = v27;
        WORD6(a9) = 2112;
        *(_QWORD *)((char *)&a9 + 14) = v29;
        _os_log_error_impl(&dword_1B96E5000, v21, OS_LOG_TYPE_ERROR, "Caught non-ObjC exception during %@ for plugin %@", (uint8_t *)&a9, 0x16u);

      }
      ErrorFromException(0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "completeWithError:completionHandler:", v22, &__block_literal_global_3_0);

      objc_end_catch();
    }
    JUMPOUT(0x1B9706DD0);
  }
  _Unwind_Resume(exception_object);
}

BOOL DESDataTransportReadFrom(id *a1, uint64_t a2)
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
  DESBfloat16Transport *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      {
        v18 = objc_alloc_init(DESBfloat16Transport);
        objc_storeStrong(a1 + 1, v18);
        if (!PBReaderPlaceMark() || (DESBfloat16TransportReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if ((_DWORD)v17 == 2)
        break;
      if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(DESBinary64Transport);
        objc_storeStrong(a1 + 3, v18);
        if (!PBReaderPlaceMark() || (DESBinary64TransportReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_34;
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_31:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(DESBinary32Transport);
    objc_storeStrong(a1 + 2, v18);
    if (!PBReaderPlaceMark() || (DESBinary32TransportReadFrom((uint64_t)v18, a2) & 1) == 0)
      goto LABEL_34;
    goto LABEL_29;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void DESShouldAlwaysParticipate_cold_1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = CFSTR("ShouldAlwaysParticipate");
  _os_log_debug_impl(&dword_1B96E5000, log, OS_LOG_TYPE_DEBUG, "Detected override preference key: %@", (uint8_t *)&v1, 0xCu);
}

void DESLogAndReturnSunsetError_cold_1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138477827;
  v2 = CFSTR("DodML is already sunset. Pls refer to #help-pfl for more details");
  _os_log_error_impl(&dword_1B96E5000, log, OS_LOG_TYPE_ERROR, "%{private}@", (uint8_t *)&v1, 0xCu);
}

void DeleteFileWithBasePath_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_1B96E5000, v0, OS_LOG_TYPE_DEBUG, "Garbage collected old DES record file %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void DeleteFileWithBasePath_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2(&dword_1B96E5000, v0, v1, "Could not garbage collect old DES record file %@: %@");
  OUTLINED_FUNCTION_1();
}

void DESSubmissionLogGarbageCollect_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B96E5000, a2, a3, "Couldn't read DES submission logs: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void DESWriteSubmissionLogData_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B96E5000, a2, a3, "Failed to write submission log data to file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void DESWriteSubmissionLogData_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1B96E5000, log, OS_LOG_TYPE_ERROR, "Failed to create submission logs directory: %@. Error: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __getFedStatsDataEncoderClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PrivateFederatedLearningLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("DESFedStatsRecorder.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFedStatsDataEncoderClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFedStatsDataEncoderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DESFedStatsRecorder.m"), 22, CFSTR("Unable to find class %s"), "FedStatsDataEncoder");

  __break(1u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1E0D82BF8]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1E0D82C00]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedDoubleAdd()
{
  return MEMORY[0x1E0D82D68]();
}

uint64_t PBRepeatedDoubleClear()
{
  return MEMORY[0x1E0D82D70]();
}

uint64_t PBRepeatedDoubleCopy()
{
  return MEMORY[0x1E0D82D78]();
}

uint64_t PBRepeatedDoubleHash()
{
  return MEMORY[0x1E0D82D80]();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return MEMORY[0x1E0D82D88]();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return MEMORY[0x1E0D82D90]();
}

uint64_t PBRepeatedDoubleSet()
{
  return MEMORY[0x1E0D82D98]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x1E0D82DA0]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x1E0D82DA8]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x1E0D82DB0]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x1E0D82DB8]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x1E0D82DC0]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x1E0D82DC8]();
}

uint64_t PBRepeatedFloatSet()
{
  return MEMORY[0x1E0D82DD0]();
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x1E0CD5F48](certificate, commonName);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1E0CD5F98](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1E0CD6218](*(_QWORD *)&status, reserved);
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x1E0CD63F0](key, operation, algorithm);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1E0CD6418](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1E0CD64B8]();
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void operator delete(void *__p)
{
  off_1E706E340(__p);
}

uint64_t operator delete()
{
  return off_1E706E348();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E706E350(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

long double erfc(long double __x)
{
  long double result;

  MEMORY[0x1E0C831F8](__x);
  return result;
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

