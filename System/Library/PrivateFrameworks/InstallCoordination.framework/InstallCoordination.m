uint64_t OUTLINED_FUNCTION_20@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 40) = a2;
  return a1;
}

char *OUTLINED_FUNCTION_6(int *a1)
{
  return strerror(*a1);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x2Au);
}

int *OUTLINED_FUNCTION_5()
{
  return __error();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return _os_crash_msg();
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_14(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(_QWORD *)(a3 + 24) = a2;
  *(_WORD *)(a3 + 32) = 2112;
  *(_QWORD *)(a3 + 34) = 0;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return _os_log_send_and_compose_impl();
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x20u);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return _os_log_send_and_compose_impl();
}

int *OUTLINED_FUNCTION_7_0()
{
  return __error();
}

double OUTLINED_FUNCTION_1_2(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_1_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

BOOL OUTLINED_FUNCTION_3_1()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void OUTLINED_FUNCTION_3_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(a2 + 4) = v3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a3;
  *(_WORD *)(a2 + 22) = 2112;
  *(_QWORD *)(a2 + 24) = result;
  *(_WORD *)(a2 + 32) = 2112;
  *(_QWORD *)(a2 + 34) = 0;
  return result;
}

void OUTLINED_FUNCTION_18_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_19_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFString *IXStringForPlaceholderDisposition(unint64_t a1)
{
  if (a1 < 4)
    return off_1E4DC3A98[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown IXPlaceholderDisposition value: %lu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *IXStringForUninstallDisposition(unint64_t a1)
{
  if (a1 < 5)
    return off_1E4DC3AB8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown uninstall disposition: %lu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *IXStringForIXError(void *a1, unint64_t a2)
{
  id v3;
  __CFString *v4;
  uint64_t v6;

  v3 = a1;
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("IXUserPresentableErrorDomain")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("IXErrorDomain")))
    {
      if (a2 < 0x3A)
      {
        v4 = off_1E4DC3B10[a2];
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unhandled reason for code: %lu in domain IXErrorDomain"), a2, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unhandled error domain %@, code %lu"), v3, a2);
    }
LABEL_9:
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v4 = CFSTR("Unknown error.");
  switch(a2)
  {
    case 0uLL:
      break;
    case 1uLL:
      v4 = CFSTR("Could not install at this time.");
      break;
    case 2uLL:
      v4 = CFSTR("Could not install.");
      break;
    case 3uLL:
      v4 = CFSTR("User canceled.");
      break;
    case 4uLL:
      v4 = CFSTR("Incompatible device architecture.");
      break;
    case 5uLL:
      v4 = CFSTR("Device lacks required capabilities.");
      break;
    case 6uLL:
      v4 = CFSTR("Incompatible platform.");
      break;
    case 7uLL:
      v4 = CFSTR("Needs reinstallation from MDM.");
      break;
    case 8uLL:
      v4 = CFSTR("Needs manual reinstallation.");
      break;
    case 9uLL:
      v4 = CFSTR("No longer available in App Store.");
      break;
    case 0xAuLL:
      v4 = CFSTR("Content is not owned by this user.");
      break;
    case 0xBuLL:
      v4 = CFSTR("Insufficient storage.");
      break;
    case 0xCuLL:
      v4 = CFSTR("User data for this app failed to restore from backup.");
      break;
    case 0xDuLL:
      v4 = CFSTR("Forbidden.");
      break;
    case 0xEuLL:
      v4 = CFSTR("Unable to verify integrity.");
      break;
    case 0xFuLL:
      v4 = CFSTR("SINF not for this platform.");
      break;
    case 0x10uLL:
      v4 = CFSTR("Device OS version is too low to run this app.");
      break;
    case 0x11uLL:
      v4 = CFSTR("Code signature version is no longer supported.");
      break;
    case 0x12uLL:
      v4 = CFSTR("Device is not eligible to install this app.");
      break;
    default:
      if (a2 != 54)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unhandled reason for code: %lu in domain IXUserPresentableErrorDomain"), a2, v6);
        goto LABEL_9;
      }
      v4 = CFSTR("Reached code meant only for testing.");
      break;
  }
LABEL_10:

  return v4;
}

id IXCreateUserPresentableError(unint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  void *v15;

  v5 = a3;
  if (a1)
  {
    v6 = (void *)objc_opt_new();
    v7 = v6;
    v8 = (_QWORD *)MEMORY[0x1E0CB2D68];
    v9 = (_QWORD *)MEMORY[0x1E0CB2D50];
    if (v5)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB3388]);
      objc_msgSend(v5, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *v8);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2D80]);
      }

    }
    if (a2)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("AlertUser"));
    IXStringForIXError(CFSTR("IXUserPresentableErrorDomain"), a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *v8);

    if (a1 >= 0x13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unhandled IXUserPresentableErrorCode %lu"), a1);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E4DC3CE0[a1 - 1];
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, *v9);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IXUserPresentableErrorDomain"), a1, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      IXCreateUserPresentableError_cold_1(v14);

    v15 = 0;
  }

  return v15;
}

uint64_t IXUserPresentableErrorCodeIsHardError(unint64_t a1, unint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  if (a2 >= 0x1D)
    v2 = 1;
  else
    v2 = (0xF7FFFFDu >> a2) & 1;
  if (((1 << a1) & 0x34010) != 0)
    v3 = v2;
  else
    v3 = 0;
  if (((1 << a1) & 0xA1E4) != 0)
    v4 = 1;
  else
    v4 = v3;
  if (a1 <= 0x11)
    return v4;
  else
    return 0;
}

id IXStringifyObject(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = v1;
    }
    else
    {
      objc_msgSend(v1, "description");
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t IXArrayContainsOnlyClass(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = _EnumerateAndCheckClass(v1);
  else
    v2 = 0;

  return v2;
}

uint64_t _EnumerateAndCheckClass(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

uint64_t IXSetContainsOnlyClass(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = _EnumerateAndCheckClass(v1);
  else
    v2 = 0;

  return v2;
}

uint64_t IXDictionaryContainsOnlyClassesCheckingValueTypes(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[12];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v9 = a1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __IXDictionaryContainsOnlyClassesCheckingValueTypes_block_invoke;
  v15[3] = &unk_1E4DC3D78;
  v15[4] = &v16;
  v15[5] = a2;
  v15[6] = a3;
  v15[7] = v10;
  v15[8] = a4;
  v15[9] = a5;
  v15[10] = v11;
  v15[11] = v12;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v13;
}

void sub_1A4BF8C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t IXDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  return IXDictionaryContainsOnlyClassesCheckingValueTypes(a1, a2, a3, 0, 0);
}

BOOL IXDictionaryContainsOnlyPlistContent(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  objc_opt_class();
  v2 = (objc_opt_isKindOfClass() & 1) != 0 && CFPropertyListIsValid(v1, kCFPropertyListBinaryFormat_v1_0) == 1;

  return v2;
}

uint64_t IXBooleanValue(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a2 = objc_msgSend(v3, "BOOLValue");

  return a2;
}

id IXArrayifyThing(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (IXArrayContainsOnlyClass(v1))
    {
      v2 = v1;
LABEL_7:
      v3 = v2;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    v3 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v1, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (IXArrayContainsOnlyClass(v4))
    v3 = v4;
  else
    v3 = 0;

LABEL_12:
  return v3;
}

id IXFilterArrayForClass(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v3, "addObject:", v9, (_QWORD)v12);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    v10 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id IXFilterDictionaryForClass(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  if (!a1)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a1;
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __IXFilterDictionaryForClass_block_invoke;
  v11[3] = &unk_1E4DC3DA0;
  v13 = a2;
  v14 = a3;
  v12 = v7;
  v8 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);

  v9 = (void *)objc_msgSend(v8, "copy");
  return v9;
}

__CFString *IXCopyProcessNameForPid()
{
  int v0;
  int v1;
  void *v2;
  void *v3;
  _BYTE buffer[4096];
  uint64_t v6;

  v0 = MEMORY[0x1E0C80A78]();
  v6 = *MEMORY[0x1E0C80C00];
  v1 = proc_pidpath(v0, buffer, 0x1000u);
  if (v1 < 1)
    return CFSTR("Unknown Process Name");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v1, 4);
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v3;
}

id IXCopyClientNameForConnection(void *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = objc_msgSend(a1, "processIdentifier");
  v2 = (void *)MEMORY[0x1E0CB3940];
  IXCopyProcessNameForPid();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (pid %d)"), v3, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t IXHasTrueValueForEntitlement(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "valueForEntitlement:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

uint64_t IXHasMobileInstallationSPIEntitlement(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.private.mobileinstall.allowedSPI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", v3) & 1) == 0)
    {
LABEL_8:
      v5 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v4, "containsObject:", v3) & 1) == 0)
      goto LABEL_8;
  }
  v5 = 1;
LABEL_9:

  return v5;
}

id IXValidateMobileInstallationSPIEntitlement(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;

  v3 = a1;
  v4 = a2;
  if ((IXHasMobileInstallationSPIEntitlement(v3, v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      IXValidateMobileInstallationSPIEntitlement_cold_1(v3, (uint64_t)v4, v6);

    IXCopyClientNameForConnection(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"IXValidateMobileInstallationSPIEntitlement", 84, CFSTR("IXErrorDomain"), 0x19uLL, 0, 0, CFSTR("Process %@ is required to have an entitlement named \"%@\" with an array containing \"%@\" to call this SPI."), v8, (uint64_t)v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id IXCopyAllowedLinkedParentBundleIDsForConnection(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.private.mobileinstall.allowed-linked-parents"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(), IXArrayContainsOnlyClass(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

__CFString *IXStringForQOSClass(uint64_t a1)
{
  __CFString *v1;

  if ((int)a1 > 20)
  {
    switch((_DWORD)a1)
    {
      case 0x15:
        return CFSTR("QOS_CLASS_DEFAULT");
      case 0x21:
        return CFSTR("QOS_CLASS_USER_INTERACTIVE");
      case 0x19:
        return CFSTR("QOS_CLASS_USER_INITIATED");
    }
    goto LABEL_16;
  }
  if (!(_DWORD)a1)
    return CFSTR("QOS_CLASS_UNSPECIFIED");
  if ((_DWORD)a1 == 9)
    return CFSTR("QOS_CLASS_BACKGROUND");
  if ((_DWORD)a1 != 17)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown Class: %u"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  v1 = CFSTR("QOS_CLASS_UTILITY");
  return v1;
}

id IXSanitizeAndValidateRestrictedStoreMetadata(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a1;
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = IXHasTrueValueForEntitlement(v7, (uint64_t)CFSTR("com.apple.private.install.distributor-info-source"));
  objc_msgSend(v9, "distributorInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v11 & 1) != 0 || !v12)
  {
    v18 = v10;
    v17 = 0;
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  objc_msgSend(v12, "distributorID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    IXCopyClientNameForConnection(v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v22 = "IXSanitizeAndValidateRestrictedStoreMetadata";
    v23 = 2112;
    v24 = v20;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = CFSTR("com.apple.private.install.distributor-info-source");
    v29 = 2112;
    v30 = v13;
    v31 = 2112;
    v32 = 0;
    _os_log_error_impl(&dword_1A4BF6000, v14, OS_LOG_TYPE_ERROR, "%s: Client %@ setting the %@ did not have the required entitlement \"%@\" = TRUE to allow the distribution info in the store metadata to be set (supplied distributor ID was '%@'). : %@", buf, 0x3Eu);

  }
  IXCopyClientNameForConnection(v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateError((uint64_t)"IXSanitizeAndValidateRestrictedStoreMetadata", 142, CFSTR("IXErrorDomain"), 0x19uLL, 0, 0, CFSTR("Client %@ setting the %@ did not have the required entitlement \"%@\" = TRUE to allow the distribution info in the store metadata to be set (supplied distributor ID was '%@')."), v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  if (a4)
  {
LABEL_8:
    if (!v18)
      *a4 = objc_retainAutorelease(v17);
  }
LABEL_10:

  return v18;
}

id IXFrameworkBundle()
{
  if (IXFrameworkBundle_onceToken != -1)
    dispatch_once(&IXFrameworkBundle_onceToken, &__block_literal_global);
  return (id)IXFrameworkBundle_sharedFrameworkBundle;
}

const __CFString *IXStringKeyForError(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x11)
    return CFSTR("kIXUserPresentableUnknownError");
  else
    return off_1E4DC3F68[a1 - 1];
}

void IXPresentErrorHighlightingLocalizedAppName(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = objc_msgSend(v13, "count");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __IXPresentErrorHighlightingLocalizedAppName_block_invoke;
  block[3] = &unk_1E4DC3EE0;
  v28 = v16;
  v29 = a4;
  v23 = v11;
  v24 = v15;
  v26 = v13;
  v27 = v14;
  v25 = v12;
  v17 = v13;
  v18 = v12;
  v19 = v14;
  v20 = v15;
  v21 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

id IXLocalizedTitleForFirstAppName(void *a1, unint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a1;
  IXStringKeyForError(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2 >= 2)
    v8 = CFSTR("_TITLE_MULTIPLE");
  else
    v8 = CFSTR("_TITLE");
  objc_msgSend(v6, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IXFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v9, &stru_1E4DC66E0, CFSTR("IXUserPresentableErrors"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id IXLocalizedBodyForOSVersionError(void *a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v13;
  void *v14;

  v5 = a1;
  v6 = a2;
  if (v5)
  {
    objc_msgSend(v5, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D3ACF0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D3ACE8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = CFSTR("kIXUserPresentableDeviceOSVersionTooLowError");
    if (v10)
    {
      if (objc_msgSend(v10, "unsignedIntegerValue") != 1 && a3 < 2)
        v11 = CFSTR("kIXUserPresentableDeviceOSVersionTooLowDiffPlatformError");
    }

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      IXLocalizedBodyForOSVersionError_cold_1();

    v8 = 0;
    v11 = CFSTR("kIXUserPresentableDeviceOSVersionTooLowError");
  }
  IXLocalizedBody(v11, v8, v6, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id IXLocalizedBodyForFirstAppName(void *a1, unint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a1;
  IXStringKeyForError(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IXLocalizedBody(v6, v5, v5, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void _LaunchAppStore()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openApplicationWithBundleIdentifier:configuration:completionHandler:", CFSTR("com.apple.AppStore"), 0, &__block_literal_global_106);

}

id IXLocalizedBody(void *a1, void *a2, void *a3, unint64_t a4)
{
  id v7;
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (a4 >= 2)
    v10 = CFSTR("_BODY_MULTIPLE");
  else
    v10 = CFSTR("_BODY");
  objc_msgSend(v7, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IXFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v11, &stru_1E4DC66E0, CFSTR("IXUserPresentableErrors"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 > 1)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13, v9, a4 - 1);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13, v8, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id IXGetLoggingHandle(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __IXGetLoggingHandle_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (IXGetLoggingHandle_onceToken != -1)
    dispatch_once(&IXGetLoggingHandle_onceToken, block);
  return (id)IXGetLoggingHandle_logHandle;
}

void sub_1A4BFF614(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

__CFString *_StringForIXCoordinatorIntent(unint64_t a1)
{
  if (a1 < 8)
    return off_1E4DC49D0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1A4C00344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 240), 8);
  _Block_object_dispose((const void *)(v37 - 208), 8);
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

void sub_1A4C01200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  id *v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v10);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__40(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__41(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_1A4C02778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C02BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _CheckCancelRequestSanity(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v11;

  v3 = a1;
  if (!v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      _CheckCancelRequestSanity_cold_1();

    v7 = CFSTR("Reason passed to IXAppInstallCoordinator cancellation method was nil!");
    v8 = 666;
    goto LABEL_10;
  }
  if (!a2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      _CheckCancelRequestSanity_cold_2();

    v7 = CFSTR("Cancellation method on IXAppInstallCoordinator was called with client of IXClientNone which is invalid");
    v8 = 670;
LABEL_10:
    _CreateError((uint64_t)"_CheckCancelRequestSanity", v8, CFSTR("IXErrorDomain"), 4uLL, 0, 0, v7, v6, v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v4 = 0;
LABEL_11:

  return v4;
}

void sub_1A4C0339C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C039CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C03EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C04390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C04FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C05CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0636C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C06EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C07534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C07B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C085C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C08A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C09168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C09530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C09A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C09E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0A1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0A6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0AA18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0AD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0B074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0B50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0B844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0BBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0BEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0C2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0C7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0CEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0D28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0D698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0DA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0DF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0E26C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0E61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0EC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0F068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0F420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0F990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C0FD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C10148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C1050C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C10A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C11138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C11564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C12004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C123EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C127A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C12B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C12F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C13228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C1352C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C1395C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C13D34(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C14270(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C14748(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C14F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C15394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C155D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C15844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C15AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C15D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C1625C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C198DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C19D74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Unwind_Resume(exception_object);
}

void sub_1A4C1A2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C1A564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C1A690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C1A974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C1AC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C1AF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C1B488(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Unwind_Resume(exception_object);
}

void sub_1A4C1B794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void sub_1A4C1C358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

BOOL _CompareObjects(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || objc_msgSend(v3, "isEqual:", v4));

  return v6;
}

void sub_1A4C1DEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
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

void sub_1A4C1E2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C1E684(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id IXEncodeRootObject(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeObject:forKey:", v3, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v4, "encodedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2 && !v5)
    *a2 = objc_retainAutorelease(0);

  return v5;
}

id IXUserPresentableErrorForInsufficientSpaceError(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("IXUserPresentableErrorDomain")))
  {
    v3 = objc_msgSend(v1, "code");

    if (v3 == 11)
    {
      v4 = v1;
      goto LABEL_16;
    }
  }
  else
  {

  }
  v5 = v1;
  v4 = v5;
  if (!v5)
    goto LABEL_16;
  v6 = *MEMORY[0x1E0CB2FE0];
  v7 = *MEMORY[0x1E0CB3388];
  v8 = v5;
  while (1)
  {
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToString:", v6))
    {

      goto LABEL_11;
    }
    v10 = objc_msgSend(v8, "code");

    if (v10 == 28)
      break;
LABEL_11:
    objc_msgSend(v8, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
    if (!v12)
    {
      v4 = 0;
      goto LABEL_16;
    }
  }
  objc_msgSend(v4, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", CFSTR("IXUserPresentableErrorDomain"));

  if (v14)
  {
    objc_msgSend(v4, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("AlertUser"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = IXBooleanValue(v16, 0);

  }
  IXCreateUserPresentableError(0xBuLL, v14, v4);
  v4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v4;
}

void IXDispatchAsyncWithAutoreleasePool(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __IXDispatchAsyncWithAutoreleasePool_block_invoke;
  block[3] = &unk_1E4DC3E68;
  v6 = v3;
  v4 = v3;
  dispatch_async(a1, block);

}

void IXAsyncTransaction(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = a1;
  v5 = (void *)os_transaction_create();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __IXAsyncTransaction_block_invoke;
  v8[3] = &unk_1E4DC4098;
  v9 = v5;
  v10 = v3;
  v6 = v5;
  v7 = v3;
  dispatch_async(v4, v8);

}

dispatch_queue_global_t IXQueueForConcurrentOperations()
{
  qos_class_t v0;

  v0 = qos_class_self();
  return dispatch_get_global_queue(v0, 0);
}

uint64_t IXBuildHasInternalDiagnostics()
{
  return os_variant_has_internal_diagnostics();
}

uint64_t _SelectorsRespondedToByDelegate()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[27];

  v0 = 0;
  v1 = 0;
  v5[26] = *MEMORY[0x1E0C80C00];
  v5[0] = sel_coordinatorShouldPrioritize_;
  v5[1] = 1;
  v5[2] = sel_coordinatorShouldResume_;
  v5[3] = 2;
  v5[4] = sel_coordinatorShouldPause_;
  v5[5] = 4;
  v5[6] = sel_coordinator_configuredPromiseDidBeginFulfillment_;
  v5[7] = 8;
  v5[8] = sel_coordinatorDidInstallPlaceholder_;
  v5[9] = 16;
  v5[10] = sel_coordinatorDidCompleteSuccessfully_;
  v5[11] = 32;
  v5[12] = sel_coordinator_canceledWithReason_client_;
  v5[13] = 64;
  v5[14] = sel_shouldPrioritizeAppWithBundleID_;
  v5[15] = 128;
  v5[16] = sel_coordinatorShouldBeginRestoringUserData_;
  v5[17] = 256;
  v5[18] = sel_coordinatorDidInstallPlaceholder_forApplicationRecord_;
  v5[19] = 2048;
  v5[20] = sel_coordinatorDidCompleteSuccessfully_forApplicationRecord_;
  v5[21] = 4096;
  v5[22] = sel_shouldPrioritizeAppWithIdentity_;
  v5[23] = 0x2000;
  v5[24] = sel_coordinatorShouldBeginPostProcessing_forApplicationRecord_;
  v5[25] = 0x4000;
  do
  {
    v2 = v5[v0 + 1];
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v1 |= v3;
    v0 += 2;
  }
  while (v0 != 26);
  return v1;
}

id _IXStringForObserverRespondsToSelectors(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("["));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(v2, "length") <= 1)
      v7 = CFSTR("%s");
    else
      v7 = CFSTR(" %s");
    objc_msgSend(v3, "appendFormat:", v7, "Prioritize");
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  if ((unint64_t)objc_msgSend(v3, "length") <= 1)
    v8 = CFSTR("%s");
  else
    v8 = CFSTR(" %s");
  objc_msgSend(v3, "appendFormat:", v8, "Resume");
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_27:
  if ((unint64_t)objc_msgSend(v3, "length") <= 1)
    v9 = CFSTR("%s");
  else
    v9 = CFSTR(" %s");
  objc_msgSend(v3, "appendFormat:", v9, "Pause");
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_31:
  if ((unint64_t)objc_msgSend(v3, "length") <= 1)
    v10 = CFSTR("%s");
  else
    v10 = CFSTR(" %s");
  objc_msgSend(v3, "appendFormat:", v10, "PromiseBegin");
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_35:
  if ((unint64_t)objc_msgSend(v3, "length") <= 1)
    v11 = CFSTR("%s");
  else
    v11 = CFSTR(" %s");
  objc_msgSend(v3, "appendFormat:", v11, "InstallPlaceholder");
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_39:
  if ((unint64_t)objc_msgSend(v3, "length") <= 1)
    v12 = CFSTR("%s");
  else
    v12 = CFSTR(" %s");
  objc_msgSend(v3, "appendFormat:", v12, "Complete");
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_43:
  if ((unint64_t)objc_msgSend(v3, "length") <= 1)
    v13 = CFSTR("%s");
  else
    v13 = CFSTR(" %s");
  objc_msgSend(v3, "appendFormat:", v13, "Cancel");
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_51;
  }
LABEL_47:
  if ((unint64_t)objc_msgSend(v3, "length") <= 1)
    v14 = CFSTR("%s");
  else
    v14 = CFSTR(" %s");
  objc_msgSend(v3, "appendFormat:", v14, "PrioritizeBundleID");
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_55;
  }
LABEL_51:
  if ((unint64_t)objc_msgSend(v3, "length") <= 1)
    v15 = CFSTR("%s");
  else
    v15 = CFSTR(" %s");
  objc_msgSend(v3, "appendFormat:", v15, "BeginRestoringUserData");
  if ((a1 & 0x800) == 0)
  {
LABEL_11:
    if ((a1 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_59;
  }
LABEL_55:
  if ((unint64_t)objc_msgSend(v3, "length") <= 1)
    v16 = CFSTR("%s");
  else
    v16 = CFSTR(" %s");
  objc_msgSend(v3, "appendFormat:", v16, "InstallPlaceholderForRecord");
  if ((a1 & 0x1000) == 0)
  {
LABEL_12:
    if ((a1 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_63;
  }
LABEL_59:
  if ((unint64_t)objc_msgSend(v3, "length") <= 1)
    v17 = CFSTR("%s");
  else
    v17 = CFSTR(" %s");
  objc_msgSend(v3, "appendFormat:", v17, "CompleteForRecord");
  if ((a1 & 0x2000) == 0)
  {
LABEL_13:
    if ((a1 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_14;
  }
LABEL_63:
  if ((unint64_t)objc_msgSend(v3, "length") <= 1)
    v18 = CFSTR("%s");
  else
    v18 = CFSTR(" %s");
  objc_msgSend(v3, "appendFormat:", v18, "PrioritizeAppWithIdentity");
  if ((a1 & 0x4000) != 0)
  {
LABEL_14:
    if ((unint64_t)objc_msgSend(v3, "length") <= 1)
      v4 = CFSTR("%s");
    else
      v4 = CFSTR(" %s");
    objc_msgSend(v3, "appendFormat:", v4, "ShouldBeginPostProcessing");
  }
LABEL_18:
  objc_msgSend(v3, "appendFormat:", CFSTR(" (%lu)]"), a1);
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

BOOL IXIsAppExtensionForPlaceholderType(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

__CFString *IXStringForClientID(unint64_t a1)
{
  if (a1 < 0x1D)
    return off_1E4DC4C78[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown IXClientIdentifier: %lu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1A4C23614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1A4C23924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void IXSyncLSDatabase(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "IXSyncLSDatabase";
    v7 = 2112;
    v8 = v1;
    _os_log_impl(&dword_1A4BF6000, v2, OS_LOG_TYPE_DEFAULT, "%s: %@; re-fetching local LS database",
      (uint8_t *)&v5,
      0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acquireDatabase");

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "IXSyncLSDatabase";
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Fetch of local LS database complete", (uint8_t *)&v5, 0xCu);
  }

}

id IXApplicationRecordForRecordPromise(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3)
  {
    v9 = CFSTR("Did not receive a LSRecordPromise");
    goto LABEL_19;
  }
  v35 = 0;
  objc_msgSend(v3, "fulfillReturningError:", &v35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v35;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(v6, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB2F90]))
    {
      v11 = objc_msgSend(v7, "code");

      if (v11 == -10814)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v38 = "_FulfillLSRecordPromise";
          v39 = 2112;
          v40 = v3;
          _os_log_impl(&dword_1A4BF6000, v12, OS_LOG_TYPE_DEFAULT, "%s: Could not fulfill record promise %@; the record was likely superseded or the app was uninstalled. Fallin"
            "g back to fetching the current record",
            buf,
            0x16u);
        }
        goto LABEL_15;
      }
    }
    else
    {

    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      IXApplicationRecordForRecordPromise_cold_2();
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      IXApplicationRecordForRecordPromise_cold_3((uint64_t)v3, (uint64_t)v5, v12);
LABEL_15:

    v8 = 0;
    goto LABEL_16;
  }
  v8 = v5;
LABEL_16:

  if (v8)
  {
    v29 = v3;
    v13 = v4;
    v14 = 0;
LABEL_22:
    v16 = objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v8, "applicationExtensionRecords");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v22, "extensionPointRecord");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            -[NSObject addObject:](v16, "addObject:", v23);
          -[NSObject addObject:](v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v19);
    }

    -[NSObject addObject:](v16, "addObject:", v8);
    v24 = (void *)MEMORY[0x1E0CA5900];
    v25 = -[NSObject copy](v16, "copy");
    objc_msgSend(v24, "resolveAllPropertiesOfRecords:andDetachOnQueue:", v25, 0);

    v4 = v13;
    v3 = v29;
    goto LABEL_32;
  }
  v9 = CFSTR("Could not fulfill LSRecordPromise");
LABEL_19:
  IXSyncLSDatabase(v9);
  if (!v4)
  {
    v14 = 0;
    v8 = 0;
    goto LABEL_34;
  }
  v34 = 0;
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v34);
  v15 = v34;
  v14 = v15;
  if (v8)
  {
    v29 = v3;
    v13 = v4;
    goto LABEL_22;
  }
  objc_msgSend(v15, "domain");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CB2F90]))
  {

LABEL_40:
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      IXApplicationRecordForRecordPromise_cold_1();
    goto LABEL_42;
  }
  v28 = objc_msgSend(v14, "code");

  if (v28 != -10814)
    goto LABEL_40;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "IXApplicationRecordForRecordPromise";
    v39 = 2112;
    v40 = v4;
    _os_log_impl(&dword_1A4BF6000, v16, OS_LOG_TYPE_DEFAULT, "%s: Application record for %@ was not found and its LSRecordPromise could not be fulfilled; likely the application"
      " was uninstalled. Caller will get a nil LSApplicationRecord",
      buf,
      0x16u);
  }
LABEL_42:
  v8 = 0;
LABEL_32:

LABEL_34:
  return v8;
}

id IXApplicationRecordForIdentityInDomain(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  char v7;
  id v8;
  id *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  id obj;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[40];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  v37 = __Block_byref_object_dispose__3;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 == 1)
  {
    v7 = 0;
LABEL_6:
    v8 = objc_alloc(MEMORY[0x1E0CA5870]);
    v9 = (id *)(v28 + 5);
    obj = (id)v28[5];
    v10 = objc_msgSend(v8, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, &obj);
    objc_storeStrong(v9, obj);
    v11 = (void *)v34[5];
    v34[5] = v10;

    if (v34[5])
      v12 = 1;
    else
      v12 = v7;
    if ((v12 & 1) != 0)
      goto LABEL_15;
    goto LABEL_10;
  }
  if (a2 != 2)
  {
    if (a2 != 3)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        MIStringForInstallationDomain();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        IXApplicationRecordForIdentityInDomain_cold_1(v15, buf, v14);
      }

      MIStringForInstallationDomain();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError((uint64_t)"IXApplicationRecordForIdentityInDomain", 139, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Unexpected value for installation domain: %@"), v17, (uint64_t)v16);
      v18 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v28[5];
      v28[5] = v18;
      goto LABEL_14;
    }
    v7 = 1;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CA58C0], "sharedDatabaseContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __IXApplicationRecordForIdentityInDomain_block_invoke;
  v22[3] = &unk_1E4DC4D68;
  v24 = &v27;
  v25 = &v33;
  v23 = v6;
  objc_msgSend(v13, "accessSystemScopeUsingBlock:", v22);

LABEL_14:
LABEL_15:
  v19 = (void *)v34[5];
  if (a3 && !v19)
  {
    *a3 = objc_retainAutorelease((id)v28[5]);
    v19 = (void *)v34[5];
  }
  v20 = v19;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

void sub_1A4C243B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

id IXApplicationRecordPromiseForIdentityInDomain(void *a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v9;
  id v10;

  v10 = 0;
  IXApplicationRecordForIdentityInDomain(a1, a2, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v4)
  {
    v9 = v5;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5908]), "initWithRecord:error:", v4, &v9);
    v7 = v9;

    v5 = v7;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v6 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v6)
    *a3 = objc_retainAutorelease(v5);
LABEL_7:

  return v6;
}

void sub_1A4C291E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1A4C29624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C299C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C29EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2A40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2A814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2AD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2B274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2B61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2BA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2BE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2C2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2C698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2CA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2CF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2D530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2DB7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2DF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2E27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2EAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2EEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2F1A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2F598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2F798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2F924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C2FF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C301E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void IXDisplayUserPresentableErrorForAppWithIdentity(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a1;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __IXDisplayUserPresentableErrorForAppWithIdentity_block_invoke;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v6[4] = a2;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_remote_displayUserPresentableErrorForApp:code:", v3, a2);

}

void IXDisplayUserPresentableErrorForAppsWithIdentitites(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a1;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __IXDisplayUserPresentableErrorForAppsWithIdentitites_block_invoke;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v6[4] = a2;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_remote_displayUserPresentableErrorForApps:code:", v3, a2);

}

void IXDisplayUserPresentableErrorForApp(void *a1, uint64_t a2)
{
  id v3;
  IXApplicationIdentity *v4;

  v3 = a1;
  v4 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v3);

  IXDisplayUserPresentableErrorForAppWithIdentity(v4, a2);
}

void IXDisplayUserPresentableErrorForApps(uint64_t a1, uint64_t a2)
{
  id v3;

  +[IXApplicationIdentity identitiesForBundleIdentifiers:](IXApplicationIdentity, "identitiesForBundleIdentifiers:", a1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  IXDisplayUserPresentableErrorForAppsWithIdentitites(v3, a2);

}

void IXDisplayUserPresentableErrorForAppWithLocalizedName(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a1;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __IXDisplayUserPresentableErrorForAppWithLocalizedName_block_invoke;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v6[4] = a2;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_remote_displayUserPresentableErrorForAppWithLocalizedName:code:", v3, a2);

}

const __CFString *IXStringForCoordinatorImportance(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Unhandled");
  else
    return off_1E4DC4E98[a1];
}

BOOL IXOncePerBootWorkNeeded(void *a1)
{
  const char *v1;
  size_t v2;
  sem_t *v3;
  sem_t *v4;

  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v2 = strlen(v1);
  if (v2 >= 0x20)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Identifier %s must be less <= %d bytes in length but was %ld bytes"), v1, 31, v2);
  v3 = sem_open(v1, 0);
  v4 = v3;
  if (v3 != (sem_t *)-1)
    sem_close(v3);
  return v4 == (sem_t *)-1;
}

void IXSetOncePerBootWorkCompleted(void *a1)
{
  const char *v1;
  size_t v2;
  sem_t *v3;
  NSObject *v4;
  int *v5;
  char *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v2 = strlen(v1);
  if (v2 >= 0x20)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Identifier %s must be less <= %d bytes in length but was %ld bytes"), v1, 31, v2);
  v3 = sem_open(v1, 512, 256, 0);
  if (v3 == (sem_t *)-1)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = __error();
      v6 = strerror(*v5);
      *(_DWORD *)buf = 136315650;
      v8 = "IXSetOncePerBootWorkCompleted";
      v9 = 2080;
      v10 = v1;
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to create semaphore %s: %s", buf, 0x20u);
    }

  }
  else
  {
    sem_close(v3);
  }
}

BOOL IXRunOncePerBootWork(void *a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  _BOOL8 v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  v5 = IXOncePerBootWorkNeeded(v3);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1A85A5738]();
    v4[2](v4);
    objc_autoreleasePoolPop(v6);
    IXSetOncePerBootWorkCompleted(v3);
  }

  return v5;
}

void _RemoveDelegateFromMap(void *a1)
{
  NSObject *v1;
  id v2;

  v1 = sAppInstallCoordinatorQueue;
  v2 = a1;
  dispatch_assert_queue_V2(v1);
  objc_msgSend((id)sOutstandingDelegates, "removeObject:", v2);

}

void sub_1A4C3284C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a40, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void _AddDelegateToMap(void *a1)
{
  NSObject *v1;
  id v2;

  v1 = sAppInstallCoordinatorQueue;
  v2 = a1;
  dispatch_assert_queue_V2(v1);
  objc_msgSend((id)sOutstandingDelegates, "addObject:", v2);

}

void sub_1A4C33328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C335E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C340CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1A4C34A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C34D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

__CFString *IXStringForAppRemovability(unint64_t a1)
{
  if (a1 < 4)
    return off_1E4DC5050[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown IXAppRemovability value: %lu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *IXStringForAppRemovabilityClient(unint64_t a1)
{
  if (a1 < 4)
    return off_1E4DC5070[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown IXAppRemovabilityClient value: %lu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1A4C35730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *IXStringForCoordinatorScopeRequirement(unsigned int a1)
{
  if (a1 < 3)
    return off_1E4DC5150[(char)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown Coordinator Scope Requirement: %hhu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL IXCoordinatorScopeRequirementIsDefinedValue(unsigned int a1)
{
  return a1 < 3;
}

void sub_1A4C37A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C385A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C3C3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1A4C3C744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C3CA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C3CEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C3D208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C3DEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C3E594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4C3EA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C3EDAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4C3F140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

__CFString *IXStringForCoordinatorScope(unsigned int a1)
{
  if (a1 < 3)
    return off_1E4DC52A0[(char)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown IXCoordinatorScope value %hhu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id IXCopyRemovabilityStorageURL()
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;

  if (_sRemovabilityStorageURLOverride)
    return (id)_sRemovabilityStorageURLOverride;
  +[IXGlobalConfiguration sharedInstance](IXGlobalConfiguration, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v1, "removabilityDirectoryWithError:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;

  if (v2)
  {
    objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ClockedRemovabilityMetadata.plist"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      IXCopyRemovabilityStorageURL_cold_1();

    v4 = 0;
  }

  return v4;
}

void IXSetRemovabilityStorageURLOverride(id obj)
{
  objc_storeStrong((id *)&_sRemovabilityStorageURLOverride, obj);
}

IXAppRemovabilityMetadata *IXGetRemovabilityMetadataForApp(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  IXAppRemovabilityMetadata *v8;
  IXAppRemovabilityMetadata *v9;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = (IXAppRemovabilityMetadata *)objc_msgSend(v6, "copy");
  else
    v8 = -[IXAppRemovabilityMetadata initWithRemovability:client:]([IXAppRemovabilityMetadata alloc], "initWithRemovability:client:", a3, a4);
  v9 = v8;

  return v9;
}

IXAppRemovabilityMetadata *IXGetUncachedRemovabilityMetadataForApp(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  IXAppRemovabilityMetadata *v22;
  NSObject *v23;
  NSObject *v24;
  void *v26;
  id v27;
  _QWORD *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  IXCopyRemovabilityStorageURL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _CopyRemovabilityDataFromURL(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v34 = 0;
    v8 = objc_msgSend(v5, "resolvePersonaRespectingSandboxingWithError:", &v34);
    v9 = v34;
    v10 = v9;
    if ((v8 & 1) != 0)
    {
      v28 = a4;
      v29 = v9;
      v27 = v5;
      objc_msgSend(v5, "possibleSerializationsForPlistKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_opt_new();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("RemovabilityEntries"), *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v15);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("RemovabilityChangeClock"), CFSTR("sequenceNumber"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v19);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("RemovabilityChangeClock"), CFSTR("guid"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v20);

      v21 = objc_msgSend(v12, "copy");
      v26 = (void *)v21;
      _CFPropertyListCreateFiltered();
      v10 = 0;

      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v24 = objc_claimAutoreleasedReturnValue();
      v5 = v27;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        IXGetUncachedRemovabilityMetadataForApp_cold_5();

      if (v28)
        *v28 = 0;
      v22 = -[IXAppRemovabilityMetadata initWithRemovability:client:]([IXAppRemovabilityMetadata alloc], "initWithRemovability:client:", 0, 0);

    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        IXGetUncachedRemovabilityMetadataForApp_cold_6();

      v22 = -[IXAppRemovabilityMetadata initWithRemovability:client:]([IXAppRemovabilityMetadata alloc], "initWithRemovability:client:", 0, 0);
    }

  }
  else
  {
    v22 = -[IXAppRemovabilityMetadata initWithRemovability:client:]([IXAppRemovabilityMetadata alloc], "initWithRemovability:client:", 0, 0);
  }

  return v22;
}

id _CopyRemovabilityDataFromURL(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  id v18;

  v1 = a1;
  if (v1)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v1, 1, &v18);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v18;
    v4 = v3;
    if (!v2)
    {
      -[NSObject domain](v3, "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *MEMORY[0x1E0CB28A8];
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8])
        && -[NSObject code](v4, "code") == 257)
      {
        -[NSObject userInfo](v4, "userInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *MEMORY[0x1E0CB3388];
        objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
        {
          -[NSObject userInfo](v4, "userInfo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v12, "code");

          if (v17 == 1)
          {
            IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
              _CopyRemovabilityDataFromURL_cold_2(v1, v13);
LABEL_20:

            goto LABEL_21;
          }
LABEL_14:
          -[NSObject domain](v4, "domain", v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", v6))
          {
            v15 = -[NSObject code](v4, "code");

            if (v15 == 260)
              goto LABEL_21;
          }
          else
          {

          }
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            _CopyRemovabilityDataFromURL_cold_3(v1, (uint64_t)v4, v13);
          goto LABEL_20;
        }

      }
      goto LABEL_14;
    }
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      _CopyRemovabilityDataFromURL_cold_1(v4);
    v2 = 0;
  }
LABEL_21:

  return v2;
}

id _IXValidateObject(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id _RemovabilityPListToMetadata(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___RemovabilityPListToMetadata_block_invoke;
  v6[3] = &unk_1E4DC52C0;
  v7 = v2;
  v3 = v2;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v6);

  v4 = (void *)objc_msgSend(v3, "copy");
  return v4;
}

NSObject *IXGetUncachedRemovabilityDataStore(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  id v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  IXCopyRemovabilityStorageURL();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _CopyRemovabilityDataFromURL(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v32 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (__CFString *)v32;
    if (v4)
    {
      objc_opt_class();
      v6 = v4;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("RemovabilityEntries"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_opt_class();
          v9 = v8;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v10 = v9;
          else
            v10 = 0;

          if (v10)
          {
            -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("RemovabilityChangeClock"));
            v15 = objc_claimAutoreleasedReturnValue();
            if (!v15)
            {
              IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v34 = "_ExtractObjectsFromDeserializedRemovabilityPlist";
                v35 = 2112;
                v36 = CFSTR("RemovabilityChangeClock");
                v37 = 2112;
                v38 = v7;
                _os_log_impl(&dword_1A4BF6000, v23, OS_LOG_TYPE_DEFAULT, "%s: Deserialized removability plist is missing key %@ : %@", buf, 0x20u);
              }
              v21 = 0;
              v22 = 0;
              goto LABEL_46;
            }
            objc_opt_class();
            v19 = v15;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v20 = v19;
            else
              v20 = 0;

            if (!v20)
            {
              IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v34 = "_ExtractObjectsFromDeserializedRemovabilityPlist";
                v35 = 2112;
                v36 = (const __CFString *)v19;
                _os_log_impl(&dword_1A4BF6000, v26, OS_LOG_TYPE_DEFAULT, "%s: Received non dictionary object for change clock in deserialized removability plist: %@", buf, 0x16u);
              }
              v21 = 0;
              v22 = 0;
              v23 = v26;
              goto LABEL_46;
            }
            _RemovabilityPListToMetadata(v9);
            v31 = objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              v24 = +[IXDataStoreClock newClockWithDictionary:](IXDataStoreClock, "newClockWithDictionary:", v19);
              if (v24)
              {
                v25 = v24;
                if (a1)
                  *a1 = objc_retainAutorelease(v24);
                v23 = v31;
                v21 = objc_retainAutorelease(v31);
                v22 = 1;
                goto LABEL_45;
              }
              IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v34 = "_ExtractObjectsFromDeserializedRemovabilityPlist";
                v35 = 2112;
                v36 = (const __CFString *)v19;
                _os_log_impl(&dword_1A4BF6000, v27, OS_LOG_TYPE_DEFAULT, "%s: Failed to extract change clock from deserialized removability plist: %@", buf, 0x16u);
              }

              v21 = 0;
              v25 = 0;
            }
            else
            {
              IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v34 = "_ExtractObjectsFromDeserializedRemovabilityPlist";
                v35 = 2112;
                v36 = v9;
                _os_log_impl(&dword_1A4BF6000, v25, OS_LOG_TYPE_DEFAULT, "%s: Failed to extract removability entries from deserialized removability plist: %@", buf, 0x16u);
              }
              v21 = 0;
            }
            v22 = 0;
            v23 = v31;
LABEL_45:

LABEL_46:
            goto LABEL_47;
          }
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v34 = "_ExtractObjectsFromDeserializedRemovabilityPlist";
            v35 = 2112;
            v36 = v9;
            v16 = "%s: Received non dictionary object for removability entries in deserialized removability plist: %@";
            v17 = v15;
            v18 = 22;
            goto LABEL_23;
          }
        }
        else
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v34 = "_ExtractObjectsFromDeserializedRemovabilityPlist";
            v35 = 2112;
            v36 = CFSTR("RemovabilityEntries");
            v37 = 2112;
            v38 = v7;
            v16 = "%s: Deserialized removability plist is missing key %@ : %@";
            v17 = v15;
            v18 = 32;
LABEL_23:
            _os_log_impl(&dword_1A4BF6000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
          }
        }
        v21 = 0;
        v22 = 0;
LABEL_47:

        v28 = v21;
        v29 = v28;
        if (v22)
          v11 = v28;
        else
          v11 = 0;

        goto LABEL_51;
      }

      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "IXGetUncachedRemovabilityDataStore";
        v12 = "%s: Deserialized removability plist is not dictionary";
        v13 = v7;
        v14 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "IXGetUncachedRemovabilityDataStore";
        v35 = 2112;
        v36 = v5;
        v12 = "%s: Failed to deserialize removability plist: %@";
        v13 = v7;
        v14 = 22;
LABEL_12:
        _os_log_impl(&dword_1A4BF6000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
    v11 = 0;
LABEL_51:

    goto LABEL_52;
  }
  v11 = 0;
LABEL_52:

  return v11;
}

id LoadInfoPlistFromBundleAtURL(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  __CFBundle *Unique;
  __CFBundle *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v15;

  v5 = a1;
  v6 = a2;
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    v8 = Unique;
    v15 = 0;
    LoadInfoPlistFromBundle(Unique, v6, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
    CFRelease(v8);
    if (!a3)
      goto LABEL_9;
    goto LABEL_7;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    LoadInfoPlistFromBundleAtURL_cold_1(v5, v11);

  objc_msgSend(v5, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateError((uint64_t)"LoadInfoPlistFromBundleAtURL", 24, CFSTR("IXErrorDomain"), 0xAuLL, 0, 0, CFSTR("Failed to create CFBundle from %@"), v13, (uint64_t)v12);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (a3)
  {
LABEL_7:
    if (!v9)
      *a3 = objc_retainAutorelease(v10);
  }
LABEL_9:

  return v9;
}

id LoadInfoPlistFromBundle(__CFBundle *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *FilteredInfoPlist;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v19;

  v5 = a2;
  if (!v5)
  {
    CFBundleGetInfoDictionary(a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    FilteredInfoPlist = v8;
    if (v8)
    {
      v9 = (void *)objc_msgSend(v8, "mutableCopy");
      v7 = v9;
      if (v9)
        objc_msgSend(v9, "removeObjectForKey:", CFSTR("CFBundleInfoPlistURL"));
      goto LABEL_8;
    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      LoadInfoPlistFromBundle_cold_1();

    _CreateError((uint64_t)"LoadInfoPlistFromBundle", 72, CFSTR("IXErrorDomain"), 0xFuLL, 0, 0, CFSTR("CFBundleGetInfoDictionary returned NULL for bundle %@"), v17, (uint64_t)a1);
    goto LABEL_18;
  }
  FilteredInfoPlist = (void *)_CFBundleCreateFilteredInfoPlist();
  if (!FilteredInfoPlist)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      LoadInfoPlistFromBundle_cold_2((uint64_t)v5, (uint64_t)a1, v11);

    _CreateError((uint64_t)"LoadInfoPlistFromBundle", 55, CFSTR("IXErrorDomain"), 0xFuLL, 0, 0, CFSTR("Failed to get filtered Info.plist with keys %@ from bundle %@"), v12, (uint64_t)v5);
LABEL_18:
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v7 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      LoadInfoPlistFromBundle_cold_3((uint64_t)a1, (uint64_t)FilteredInfoPlist, v13);

    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"LoadInfoPlistFromBundle", 60, CFSTR("IXErrorDomain"), 0x10uLL, 0, 0, CFSTR("Object returned from _CFBundleCreateFilteredInfoPlist for %@ was not a dictionary, was type %@"), v15, (uint64_t)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  v7 = (void *)objc_msgSend(FilteredInfoPlist, "mutableCopy");
LABEL_8:
  v10 = 0;
LABEL_20:

  if (a3 && !v7)
    *a3 = objc_retainAutorelease(v10);

  return v7;
}

id AppURLFromExtractedPayloadDir(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v26 = 0;
  IXUrlsForItemsInDirectoryAtURL(v3, 1, &v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v26;
  if (!v4)
  {
LABEL_16:
    if (a2)
    {
      v5 = objc_retainAutorelease(v5);
      v14 = 0;
      *a2 = v5;
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_19;
  }
  v20 = a2;
  v21 = v3;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (!v7)
  {
LABEL_10:

LABEL_13:
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v15 = objc_claimAutoreleasedReturnValue();
    v3 = v21;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      AppURLFromExtractedPayloadDir_cold_1(v21, v15);

    objc_msgSend(v21, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"AppURLFromExtractedPayloadDir", 112, CFSTR("IXErrorDomain"), 0xAuLL, 0, 0, CFSTR("Failed to find a \".app\" inside the extracted contents at %@"), v17, (uint64_t)v16);
    v18 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v18;
    a2 = v20;
    goto LABEL_16;
  }
  v8 = v7;
  v9 = *(_QWORD *)v23;
LABEL_4:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v23 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
    objc_msgSend(v11, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("app"));

    if ((v13 & 1) != 0)
      break;
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v8)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  v14 = v11;

  if (!v14)
    goto LABEL_13;
  v3 = v21;
LABEL_19:

  return v14;
}

void _RemoveDelegateFromMap_0(void *a1)
{
  NSObject *v1;
  id v2;

  v1 = sAppInstallCoordinatorQueue_0;
  v2 = a1;
  dispatch_assert_queue_V2(v1);
  objc_msgSend((id)sOutstandingDelegates_0, "removeObject:", v2);

}

void _AddDelegateToMap_0(void *a1)
{
  NSObject *v1;
  id v2;

  v1 = sAppInstallCoordinatorQueue_0;
  v2 = a1;
  dispatch_assert_queue_V2(v1);
  objc_msgSend((id)sOutstandingDelegates_0, "addObject:", v2);

}

void sub_1A4C41F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1A4C42178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

const __CFString *IXStatusForInstallationProgress(int a1)
{
  if (a1 <= 39)
  {
    if (a1 > 19)
    {
      switch(a1)
      {
        case 20:
          return CFSTR("InspectingPackage");
        case 30:
          return CFSTR("PreflightingApplication");
        case 35:
          return CFSTR("PatchingApplication");
      }
    }
    else
    {
      switch(a1)
      {
        case 0:
          return CFSTR("InstallingEmbeddedProfile");
        case 5:
          return CFSTR("CreatingStagingDirectory");
        case 15:
          return CFSTR("ExtractingPackage");
      }
    }
  }
  else if (a1 <= 69)
  {
    switch(a1)
    {
      case '(':
        return CFSTR("VerifyingApplication");
      case '2':
        return CFSTR("CreatingContainer");
      case '<':
        return CFSTR("InstallingApplication");
    }
  }
  else if (a1 > 89)
  {
    if (a1 == 90)
      return CFSTR("GeneratingApplicationMap");
    if (a1 == 100)
      return CFSTR("InstallComplete");
  }
  else
  {
    if (a1 == 70)
      return CFSTR("PostflightingApplication");
    if (a1 == 80)
      return CFSTR("SandboxingApplication");
  }
  return CFSTR("UnknownStatus");
}

const __CFString *IXStatusForUninstallationProgress(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("UnknownStatus");
  if (a1 == 90)
    v1 = CFSTR("GeneratingApplicationMap");
  if (a1 == 50)
    return CFSTR("RemovingApplication");
  else
    return v1;
}

void sub_1A4C430C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4C43744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1A4C439A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t IXRemoveItemAtURL(void *a1, int a2, _QWORD *a3)
{
  id v5;
  _removefile_state *v6;
  uint64_t v7;
  _removefile_state *v8;
  NSObject *v9;
  int *v10;
  char *v11;
  NSObject *v12;
  int *v13;
  char *v14;
  removefile_flags_t v15;
  id v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  int *v26;
  id v27;
  uint64_t v28;
  uint64_t v30;
  int value;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = removefile_state_alloc();
  v8 = v6;
  value = 0;
  if (!v5)
  {
    v20 = (void *)*MEMORY[0x1E0CB2FE0];
    v21 = CFSTR("nil url passed to -removeItemAtURL:error:");
    v22 = 54;
    v23 = 14;
LABEL_19:
    _CreateError((uint64_t)"IXRemoveItemAtURL", v22, v20, v23, 0, 0, v21, v7, v30);
    goto LABEL_20;
  }
  if (removefile_state_set(v6, 3u, _removefile_error_callback))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = __error();
      v11 = strerror(*v10);
      *(_DWORD *)buf = 136315394;
      v33 = "IXRemoveItemAtURL";
      v34 = 2080;
      v35 = v11;
      _os_log_impl(&dword_1A4BF6000, v9, OS_LOG_TYPE_DEFAULT, "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CALLBACK failed: %s", buf, 0x16u);
    }

  }
  if (removefile_state_set(v8, 4u, &value))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = __error();
      v14 = strerror(*v13);
      *(_DWORD *)buf = 136315394;
      v33 = "IXRemoveItemAtURL";
      v34 = 2080;
      v35 = v14;
      _os_log_impl(&dword_1A4BF6000, v12, OS_LOG_TYPE_DEFAULT, "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CONTEXT failed: %s", buf, 0x16u);
    }

  }
  if (a2)
    v15 = 3;
  else
    v15 = 1;
  v16 = objc_retainAutorelease(v5);
  if (removefile((const char *)objc_msgSend(v16, "fileSystemRepresentation"), v8, v15) && *__error() != 2)
  {
    v24 = (void *)*MEMORY[0x1E0CB2FE0];
    v25 = *__error();
    v26 = __error();
    v30 = (uint64_t)v16;
    strerror(*v26);
    v21 = CFSTR("removefile of %@ failed: %s");
    v22 = 75;
    v20 = v24;
    v23 = v25;
    goto LABEL_19;
  }
  v17 = value;
  if ((value & 0xFFFFFFFD) == 0)
  {
    removefile_state_free(v8);
    v27 = 0;
    v28 = 1;
    goto LABEL_24;
  }
  v18 = (void *)*MEMORY[0x1E0CB2FE0];
  strerror(value);
  _CreateError((uint64_t)"IXRemoveItemAtURL", 81, v18, v17, 0, 0, CFSTR("removefile of %@ failed: %s"), v19, (uint64_t)v16);
LABEL_20:
  v27 = (id)objc_claimAutoreleasedReturnValue();
  removefile_state_free(v8);
  if (a3)
  {
    v27 = objc_retainAutorelease(v27);
    v28 = 0;
    *a3 = v27;
  }
  else
  {
    v28 = 0;
  }
LABEL_24:

  return v28;
}

uint64_t _removefile_error_callback(_removefile_state *a1, uint64_t a2, _DWORD *a3)
{
  NSObject *v5;
  NSObject *v6;
  char *v7;
  int dst;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "_removefile_error_callback";
      v12 = 2080;
      v13 = a2;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: removefile hit error for %s but we failed to get the error number", buf, 0x16u);
    }

    dst = 2;
  }
  else if (dst != 2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = strerror(dst);
      *(_DWORD *)buf = 136315650;
      v11 = "_removefile_error_callback";
      v12 = 2080;
      v13 = a2;
      v14 = 2080;
      v15 = v7;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: removefile hit error for %s : %s", buf, 0x20u);
    }

  }
  if (a3 && !*a3)
    *a3 = dst;
  return 0;
}

BOOL IXCopyItemAtURL(void *a1, void *a2, char a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  _BOOL8 v11;
  id v12;
  void *v13;
  unint64_t v14;
  int *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  int *v19;
  uint64_t v20;
  id v21;
  stat v23;

  v7 = a1;
  v8 = a2;
  if ((a3 & 1) != 0
    || (memset(&v23, 0, sizeof(v23)),
        v9 = objc_retainAutorelease(v7),
        !lstat((const char *)objc_msgSend(v9, "fileSystemRepresentation"), &v23)))
  {
    v12 = objc_retainAutorelease(v7);
    if (!copyfile((const char *)objc_msgSend(v12, "fileSystemRepresentation"), (const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"), 0, 0x10C800Fu))
    {
      v21 = 0;
      v11 = 1;
      goto LABEL_14;
    }
    v13 = (void *)*MEMORY[0x1E0CB2FE0];
    v14 = *__error();
    v15 = __error();
    strerror(*v15);
    _CreateError((uint64_t)"IXCopyItemAtURL", 121, v13, v14, 0, 0, CFSTR("copyfile of %@ to %@ failed: %s"), v16, (uint64_t)v12);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (!a4)
      goto LABEL_14;
  }
  else
  {
    v10 = *__error();
    v11 = v10 == 2;
    if (v10 == 2)
    {
      v21 = 0;
      if (!a4)
        goto LABEL_14;
    }
    else
    {
      v17 = (void *)*MEMORY[0x1E0CB2FE0];
      v18 = *__error();
      v19 = __error();
      strerror(*v19);
      _CreateError((uint64_t)"IXCopyItemAtURL", 106, v17, v18, 0, 0, CFSTR("stat of %@ failed: %s"), v20, (uint64_t)v9);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_14;
    }
  }
  if (!v11)
  {
    v21 = objc_retainAutorelease(v21);
    v11 = 0;
    *a4 = v21;
  }
LABEL_14:

  return v11;
}

BOOL IXItemExistsAtURL(void *a1, BOOL *a2, _QWORD *a3)
{
  id v5;
  int v6;
  unint64_t v7;
  NSObject *v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  stat v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  memset(&v14, 0, sizeof(v14));
  v5 = objc_retainAutorelease(a1);
  v6 = lstat((const char *)objc_msgSend(v5, "fileSystemRepresentation"), &v14);
  if (v6)
  {
    v7 = *__error();
    if ((_DWORD)v7 != 2)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = strerror(v7);
        *(_DWORD *)buf = 136315650;
        v16 = "IXItemExistsAtURL";
        v17 = 2112;
        v18 = v5;
        v19 = 2080;
        v20 = v9;
        _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to determine if %@ exists: %s", buf, 0x20u);
      }

    }
    if (a3)
    {
      v10 = (void *)*MEMORY[0x1E0CB2FE0];
      v11 = objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
      strerror(v7);
      _CreateError((uint64_t)"IXItemExistsAtURL", 155, v10, v7, 0, 0, CFSTR("lstat of %s failed: %s"), v12, v11);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a2)
  {
    *a2 = (v14.st_mode & 0xF000) == 0x4000;
  }

  return v6 == 0;
}

BOOL IXCreateDirectoryAtURL(void *a1, int a2, mode_t a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  const char *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  DIR *v18;
  DIR *v19;
  int v20;
  int v21;
  _BOOL8 v22;
  void *v23;
  unint64_t v24;
  void *v25;
  int *v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  int *v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  int *v35;
  uint64_t v36;

  v9 = objc_retainAutorelease(a1);
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
  if (a2)
  {
    v11 = mkpath_np(v10, a3);
    if (v11)
    {
      v12 = v11;
      if (v11 != 17)
      {
        v13 = (void *)*MEMORY[0x1E0CB2FE0];
        objc_msgSend(v9, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        strerror(v12);
        _CreateError((uint64_t)"IXCreateDirectoryAtURL", 171, v13, v12, 0, 0, CFSTR("mkpath_np of %@ failed: %s"), v15, (uint64_t)v14);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
    }
  }
  else if (mkdir(v10, a3) && *__error() != 17)
  {
    v28 = (void *)*MEMORY[0x1E0CB2FE0];
    v29 = *__error();
    objc_msgSend(v9, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = __error();
    strerror(*v31);
    _CreateError((uint64_t)"IXCreateDirectoryAtURL", 177, v28, v29, 0, 0, CFSTR("mkdir of %@ failed: %s"), v32, (uint64_t)v30);
LABEL_14:
    v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    v22 = 0;
    if (!a5)
      goto LABEL_21;
    goto LABEL_19;
  }
  if ((_DWORD)a4 == -1)
  {
    v16 = 0;
    v22 = 1;
    goto LABEL_21;
  }
  v17 = objc_retainAutorelease(v9);
  v18 = opendir((const char *)objc_msgSend(v17, "fileSystemRepresentation"));
  if (!v18)
  {
    v33 = (void *)*MEMORY[0x1E0CB2FE0];
    v34 = *__error();
    objc_msgSend(v17, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = __error();
    strerror(*v35);
    _CreateError((uint64_t)"IXCreateDirectoryAtURL", 189, v33, v34, 0, 0, CFSTR("opendir of %@ failed: %s"), v36, (uint64_t)v30);
    goto LABEL_14;
  }
  v19 = v18;
  v20 = dirfd(v18);
  v21 = fcntl(v20, 64, a4);
  v22 = v21 == 0;
  if (v21)
  {
    v23 = (void *)*MEMORY[0x1E0CB2FE0];
    v24 = *__error();
    objc_msgSend(v17, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = __error();
    strerror(*v26);
    _CreateError((uint64_t)"IXCreateDirectoryAtURL", 195, v23, v24, 0, 0, CFSTR("Failed to setclass(%d) on directory %@: %s"), v27, a4);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  closedir(v19);
  if (a5)
  {
LABEL_19:
    if (!v22)
    {
      v16 = objc_retainAutorelease(v16);
      v22 = 0;
      *a5 = v16;
    }
  }
LABEL_21:

  return v22;
}

id IXUrlsForItemsInDirectoryAtURL(void *a1, char a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  int v11;
  DIR *v12;
  DIR *v13;
  int v14;
  void *v15;
  dirent *v16;
  void *v17;
  uint64_t d_namlen;
  id v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  char v24;
  char v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;
  _QWORD *v33;
  _QWORD v34[2];
  uint64_t (*v35)(uint64_t, uint64_t);
  void *v36;
  id v37;
  id v38;
  char v39;
  dirent *v40;
  stat v41;
  dirent v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = (void *)objc_opt_new();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v35 = __IXUrlsForItemsInDirectoryAtURL_block_invoke;
  v36 = &unk_1E4DC5498;
  v39 = a2;
  v37 = v5;
  v7 = v6;
  v38 = v7;
  v8 = v37;
  v9 = v34;
  memset(&v42, 0, 512);
  v40 = 0;
  v10 = objc_retainAutorelease(v8);
  v11 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 1048832);
  if ((v11 & 0x80000000) == 0)
  {
    v12 = fdopendir(v11);
    if (v12)
    {
      v13 = v12;
      v32 = v7;
      v33 = a3;
      while (1)
      {
        v14 = readdir_r(v13, &v42, &v40);
        if (v14 || !v40)
        {
LABEL_17:
          closedir(v13);
          v7 = v32;
          a3 = v33;
          goto LABEL_19;
        }
        v15 = (void *)MEMORY[0x1A85A5738]();
        v16 = v40;
        if (!v40->d_type)
          break;
LABEL_16:
        v25 = v35((uint64_t)v9, (uint64_t)v16);
        objc_autoreleasePoolPop(v15);
        if ((v25 & 1) == 0)
          goto LABEL_17;
      }
      memset(&v41, 0, sizeof(v41));
      v17 = (void *)MEMORY[0x1E0CB3940];
      d_namlen = v40->d_namlen;
      v19 = v10;
      objc_msgSend(v17, "stringWithFileSystemRepresentation:length:", v16->d_name, d_namlen);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_retainAutorelease(v21);
      if (!lstat((const char *)objc_msgSend(v22, "fileSystemRepresentation"), &v41))
      {
        v23 = v41.st_mode & 0xF000;
        switch(v23)
        {
          case 16384:
            v24 = 4;
            goto LABEL_14;
          case 32768:
            v24 = 8;
            goto LABEL_14;
          case 40960:
            v24 = 10;
LABEL_14:
            v16->d_type = v24;
            break;
        }
      }

      v16 = v40;
      goto LABEL_16;
    }
  }
  v14 = *__error();
LABEL_19:

  if (v14)
  {
    v26 = (void *)*MEMORY[0x1E0CB2FE0];
    v27 = objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation");
    strerror(v14);
    _CreateError((uint64_t)"IXUrlsForItemsInDirectoryAtURL", 298, v26, v14, 0, 0, CFSTR("_IterateDirectory for %s returned %s"), v28, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    if (!a3)
      goto LABEL_25;
  }
  else
  {
    v30 = (void *)objc_msgSend(v7, "copy");
    v29 = 0;
    if (!a3)
      goto LABEL_25;
  }
  if (!v30)
    *a3 = objc_retainAutorelease(v29);
LABEL_25:

  return v30;
}

id IXCreateTemporaryDirectoryInDirectoryURL(void *a1, _QWORD *a2)
{
  id v3;
  char *v4;
  void *v5;
  void *v6;
  int *v7;
  uint64_t v8;

  objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", CFSTR("temp.XXXXXX"), 1);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = strdup((const char *)objc_msgSend(v3, "fileSystemRepresentation"));
  if (mkdtemp(v4))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v4, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (!a2)
      goto LABEL_7;
  }
  else
  {
    v7 = __error();
    _CreateError((uint64_t)"IXCreateTemporaryDirectoryInDirectoryURL", 321, (void *)*MEMORY[0x1E0CB2FE0], *v7, 0, 0, CFSTR("Failed to create temp dir at path %s"), v8, (uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    if (!a2)
      goto LABEL_7;
  }
  if (!v5)
    *a2 = objc_retainAutorelease(v6);
LABEL_7:
  free(v4);

  return v5;
}

void sub_1A4C4795C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _ClientProcessLookupMachPortName(uint64_t a1, _QWORD *a2)
{
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  uint64_t v12;

  getpid();
  v4 = sandbox_check();
  if (v4)
  {
    if (v4 == 1)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        _ClientProcessLookupMachPortName_cold_2(a1, v5, v6);

      _CreateError((uint64_t)"_ClientProcessLookupMachPortName", 311, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("This process does not have sandbox access to mach-lookup %s"), v7, a1);
    }
    else
    {
      v10 = *__error();
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        _ClientProcessLookupMachPortName_cold_1(a1, v10, v11);

      strerror(v10);
      _CreateError((uint64_t)"_ClientProcessLookupMachPortName", 316, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("sandbox_check returned an error when checking if this process can mach-lookup %s : %s"), v12, a1);
    }
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      v8 = objc_retainAutorelease(v8);
      v9 = 0;
      *a2 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v8 = 0;
    v9 = 1;
  }

  return v9;
}

id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v17)
    v19 = objc_msgSend(v17, "mutableCopy");
  else
    v19 = objc_opt_new();
  v20 = (void *)v19;
  IXStringForIXError(v15, a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB2D68]);

  if (v18)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v18, a8);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CB2D50]);

  }
  if (v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("FunctionName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("SourceFileLine"));

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v15, a4, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

id _CreateError(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  _CreateErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1A4C493A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4C498F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4C49C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void IXCreateUserPresentableError_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "IXCreateUserPresentableError";
  _os_log_error_impl(&dword_1A4BF6000, log, OS_LOG_TYPE_ERROR, "%s: Client attempted to create IXUserPresentableError with invalid code (kIXUserPresentableUnknownError)", (uint8_t *)&v1, 0xCu);
}

void IXValidateMobileInstallationSPIEntitlement_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  IXCopyClientNameForConnection(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136316162;
  v7 = "IXValidateMobileInstallationSPIEntitlement";
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = CFSTR("com.apple.private.mobileinstall.allowedSPI");
  v12 = 2112;
  v13 = a2;
  v14 = 2112;
  v15 = 0;
  _os_log_error_impl(&dword_1A4BF6000, a3, OS_LOG_TYPE_ERROR, "%s: Process %@ is required to have an entitlement named \"%@\" with an array containing \"%@\" to call this SPI. : %@", (uint8_t *)&v6, 0x34u);

}

void IXLocalizedBodyForOSVersionError_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2[5];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0_1();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_1A4BF6000, v1, OS_LOG_TYPE_ERROR, "%s: Underlying error was nil when constructing OS version error for app name %@ and number of apps %lu", (uint8_t *)v2, 0x20u);
}

void _CheckCancelRequestSanity_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Reason passed to IXAppInstallCoordinator cancellation method was nil! : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void _CheckCancelRequestSanity_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Cancellation method on IXAppInstallCoordinator was called with client of IXClientNone which is invalid : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void IXEncodeRootObject_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = "IXEncodeRootObject";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  v9 = 2112;
  v10 = 0;
  _os_log_error_impl(&dword_1A4BF6000, log, OS_LOG_TYPE_ERROR, "%s: Got exception while trying to encode object %@ : %@ : %@", (uint8_t *)&v3, 0x2Au);
}

void IXApplicationRecordForRecordPromise_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0_5(&dword_1A4BF6000, v0, v1, "%s: Failed to look up LSApplicationRecord from fallback bundle ID %@ : %@", v2);
}

void IXApplicationRecordForRecordPromise_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0_5(&dword_1A4BF6000, v0, v1, "%s: Failed to fulfill record promise %@ : %@", v2);
}

void IXApplicationRecordForRecordPromise_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315906;
  v9 = "_FulfillLSRecordPromise";
  v10 = 2112;
  v11 = a1;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = a2;
  _os_log_fault_impl(&dword_1A4BF6000, a3, OS_LOG_TYPE_FAULT, "%s: Expected LSApplicationRecord instance from fulfilling LSRecord promise %@ but got instance with class %@ instead (%@)", (uint8_t *)&v8, 0x2Au);

}

void IXApplicationRecordForIdentityInDomain_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(_QWORD *)(buf + 4) = "IXApplicationRecordForIdentityInDomain";
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((_QWORD *)buf + 3) = 0;
  _os_log_error_impl(&dword_1A4BF6000, log, OS_LOG_TYPE_ERROR, "%s: Unexpected value for installation domain: %@ : %@", buf, 0x20u);

}

void IXCopyRemovabilityStorageURL_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to get removability directory URL: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void IXGetUncachedRemovabilityMetadataForApp_cold_1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Received non dictionary object for requested keys %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

void IXGetUncachedRemovabilityMetadataForApp_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "IXGetUncachedRemovabilityMetadataForApp";
  v5 = 2112;
  v6 = CFSTR("RemovabilityEntries");
  v7 = 2112;
  v8 = 0;
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a1, a3, "%s: Deserialized removability plist is missing key %@ : %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_10();
}

void IXGetUncachedRemovabilityMetadataForApp_cold_3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "IXGetUncachedRemovabilityMetadataForApp";
  v5 = 2112;
  v6 = CFSTR("RemovabilityEntries");
  v7 = 2112;
  v8 = a1;
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a2, a3, "%s: Received non dictionary object for %@ : %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_10();
}

void IXGetUncachedRemovabilityMetadataForApp_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to fetch removability metadata from %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void IXGetUncachedRemovabilityMetadataForApp_cold_5()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to fetch removability for %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

void IXGetUncachedRemovabilityMetadataForApp_cold_6()
{
  os_log_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  _os_log_fault_impl(&dword_1A4BF6000, v0, OS_LOG_TYPE_FAULT, "%s: Failed to read removability data because the persona for %@ couldn't be resolved. This defeats a daemon launch avoidance optimization: %@", (uint8_t *)v1, 0x20u);
  OUTLINED_FUNCTION_10();
}

void _CopyRemovabilityDataFromURL_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_CopyRemovabilityDataFromURL";
  _os_log_fault_impl(&dword_1A4BF6000, log, OS_LOG_TYPE_FAULT, "%s: removabilityURL was nil, so returning nil.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_12();
}

void _CopyRemovabilityDataFromURL_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1A4BF6000, a2, OS_LOG_TYPE_FAULT, "%s: Failed to read removability data from %@ because it wasn't accessible due to sandboxing restrictions on this process. This defeats a daemon launch avoidance optimization.", (uint8_t *)v4, 0x16u);

  OUTLINED_FUNCTION_10();
}

void _CopyRemovabilityDataFromURL_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "_CopyRemovabilityDataFromURL";
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = a2;
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a3, v6, "%s: Failed to read removability data from %@ : %@", (uint8_t *)&v7);

}

void LoadInfoPlistFromBundleAtURL_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a2, v4, "%s: Failed to create CFBundle from %@ : %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_23();
}

void LoadInfoPlistFromBundle_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v1, "%s: CFBundleGetInfoDictionary returned NULL for bundle %@ : %@", (uint8_t *)v2);
}

void LoadInfoPlistFromBundle_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = "LoadInfoPlistFromBundle";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  v9 = 2112;
  v10 = 0;
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, a3, (uint64_t)a3, "%s: Failed to get filtered Info.plist with keys %@ from bundle %@ : %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_23();
}

void LoadInfoPlistFromBundle_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315906;
  v9 = "LoadInfoPlistFromBundle";
  v10 = 2112;
  v11 = a1;
  v12 = 2112;
  v13 = v6;
  v14 = 2112;
  v15 = 0;
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, a3, v7, "%s: Object returned from _CFBundleCreateFilteredInfoPlist for %@ was not a dictionary, was type %@ : %@", (uint8_t *)&v8);

}

void AppURLFromExtractedPayloadDir_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a2, v4, "%s: Failed to find a \".app\" inside the extracted contents at %@ : %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_23();
}

void _ClientProcessLookupMachPortName_cold_1(uint64_t a1, int __errnum, NSObject *a3)
{
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = 136315906;
  v5 = "_ClientProcessLookupMachPortName";
  v6 = 2080;
  v7 = a1;
  v8 = 2080;
  v9 = strerror(__errnum);
  v10 = 2112;
  v11 = 0;
  _os_log_error_impl(&dword_1A4BF6000, a3, OS_LOG_TYPE_ERROR, "%s: sandbox_check returned an error when checking if this process can mach-lookup %s : %s : %@", (uint8_t *)&v4, 0x2Au);
}

void _ClientProcessLookupMachPortName_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "_ClientProcessLookupMachPortName";
  v5 = 2080;
  v6 = a1;
  v7 = 2112;
  v8 = 0;
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a2, a3, "%s: This process does not have sandbox access to mach-lookup %s : %@", (uint8_t *)&v3);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98020](bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x1E0C98AF0](plist, format);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

uint64_t IFCaptureIconContent()
{
  return MEMORY[0x1E0D3A800]();
}

uint64_t MIStringForInstallationDomain()
{
  return MEMORY[0x1E0D3AD08]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x1E0CD61F0](code, *(_QWORD *)&flags, information);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x1E0CD65D0](path, *(_QWORD *)&flags, staticCode);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x1E0C99FA8]();
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return MEMORY[0x1E0C99FE0]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CFBundleFlushBundleCaches()
{
  return MEMORY[0x1E0C9A008]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1E0C9A3F8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1E0C81438](obj_p);
}

acl_t acl_get_link_np(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x1E0C81478](path_p, *(_QWORD *)&type);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1E0C814A0](*(_QWORD *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x1E0C814A8](*(_QWORD *)&fd, acl);
}

int acl_set_link_np(const char *path_p, acl_type_t type, acl_t acl)
{
  return MEMORY[0x1E0C814C8](path_p, *(_QWORD *)&type, acl);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C826D0](*(_QWORD *)&a1, a2, a3);
}

uint64_t container_create_or_lookup_for_current_user()
{
  return MEMORY[0x1E0C82810]();
}

uint64_t container_delete_all_container_content()
{
  return MEMORY[0x1E0C82848]();
}

uint64_t container_free_object()
{
  return MEMORY[0x1E0C828B0]();
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1E0C82A90]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1E0C82BA0](dirp);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
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

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1E0C83320](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1E0C835A0](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1E0C835A8](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1E0C835B0](a1);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1E0C83620](*(_QWORD *)&a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C83798](a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C83B30](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1E0C84198](path, omode);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
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

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1E0C85010](a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C85018](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1E0C850C0](path, state, *(_QWORD *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1E0C850C8]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1E0C850D0](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1E0C850D8](state, *(_QWORD *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1E0C850E0](state, *(_QWORD *)&key, value);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x1E0C85290](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x1E0C852A8](a1, *(_QWORD *)&a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85718](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

