void authInstalllogHandler(unsigned int a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a1 < 4)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      authInstalllogHandler_cold_1();
  }
  else if (a1 - 4 >= 3)
  {
    if (a1 == 7)
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_6);
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEBUG))
        authInstalllogHandler_cold_2();
    }
    else
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_8);
      v3 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 136446210;
        v5 = a2;
        goto LABEL_20;
      }
    }
  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_4);
    v3 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136446210;
      v5 = a2;
LABEL_20:
      _os_log_impl(&dword_222C3F000, v3, OS_LOG_TYPE_DEFAULT, "AMAuthInstall: %{public}s", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __authInstalllogHandler_block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __authInstalllogHandler_block_invoke_3()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __authInstalllogHandler_block_invoke_5()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __authInstalllogHandler_block_invoke_7()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_222C4A1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
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

id OUTLINED_FUNCTION_1_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  void *v0;

  return objc_msgSend(v0, "charValue");
}

id OUTLINED_FUNCTION_8_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  void *v0;

  return objc_msgSend(v0, "doubleValue");
}

id OUTLINED_FUNCTION_9_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_10()
{
  void *v0;

  return objc_msgSend(v0, "length");
}

void sub_222C4E838(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222C4EA34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222C4ECD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222C4F6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void OUTLINED_FUNCTION_3_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void safeAssignError(_QWORD *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  if (a1)
  {
    v12 = (objc_class *)MEMORY[0x24BDD16A8];
    v13 = a4;
    v14 = a3;
    v15 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &a9);

    _createError(a2, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    *a1 = v16;
  }
}

id _createError(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0FC8]);
  if (v5)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD1398]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.MobileInBoxUpdater.ErrorDomain"), a1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_222C53054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
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

void sub_222C538A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_222C541D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222C54734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_4(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!(_DWORD)result)
  {
    result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if ((_DWORD)result)
    {
      result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if ((_DWORD)result)
      {
        result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if ((_DWORD)result)
        {
          result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if ((_DWORD)result)
          {
            result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if ((_DWORD)result)
              return result;
            v3 = 0x1000000000;
          }
          else
          {
            v3 = 0x800000000;
          }
        }
        else
        {
          v3 = 0x400000000;
        }
      }
      else
      {
        v3 = 8;
      }
    }
    else
    {
      v3 = 3840;
    }
    *(_QWORD *)(a1 + 240) |= v3;
  }
  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  double result;
  time_t v3;
  tm v4;
  time_t v5;
  unint64_t v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    if (compare_octet_string_partial((uint64_t)&MFICommonNamePrefix, (uint64_t)v6))
      goto LABEL_3;
    v5 = 0;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      v3 = timegm(&v4);
      result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(_QWORD *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
        if (!compare_octet_string_partial((uint64_t)&MFi4ProvisioningHostNamePrefix, (uint64_t)v6))
          *(_QWORD *)(a1 + 240) |= 0x1000000000uLL;
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!result)
    return result;
  v3 = result;
  if (*(_BYTE *)(result + 16))
  {
    result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!(_DWORD)result
      || (result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !(_DWORD)result)
      || (result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !(_DWORD)result))
    {
      v5 = *(_QWORD *)(a2 + 240) | 0x58E30653FFF8;
      goto LABEL_11;
    }
  }
  v4 = *(_QWORD *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!(_DWORD)result)
    {
      v5 = *(_QWORD *)(a2 + 240) | 0x1000000;
      goto LABEL_11;
    }
LABEL_13:
    if (*(_BYTE *)(v3 + 17))
      result = X509PolicySetFlagsForTestAnchor((_QWORD *)v3, a2);
    goto LABEL_15;
  }
  if ((v4 & 0x1C00000000) == 0)
    goto LABEL_15;
  result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if ((_DWORD)result)
    goto LABEL_13;
  v5 = *(_QWORD *)(a2 + 240) | 0x1C00000000;
LABEL_11:
  *(_QWORD *)(a2 + 240) = v5;
LABEL_15:
  if (*(_BYTE *)(v3 + 16))
  {
    if (*(_BYTE *)(v3 + 17))
    {
      result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!(_DWORD)result
        || (result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !(_DWORD)result)
        || (result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !(_DWORD)result))
      {
        *(_QWORD *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }
    if (*(_BYTE *)(v3 + 16) && *(_BYTE *)(v3 + 17))
    {
      result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!(_DWORD)result)
        *(_QWORD *)(a2 + 240) |= 0x6400000uLL;
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForTestAnchor(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  _QWORD v5[2];
  unint64_t v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  v6[1] = 0;
  v5[0] = 0;
  v5[1] = 0;
  result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0, v5);
  if (!(_DWORD)result)
  {
    result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!(_DWORD)result)
    {
      result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!(_DWORD)result)
        *(_QWORD *)(a2 + 240) |= a1[1];
    }
  }
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result;

  result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result)
    *(_QWORD *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2;
  int *result;

  v2 = 0;
  while (1)
  {
    result = (int *)compare_octet_string_raw((uint64_t)&digests[v2 / 4 + 2], *(const void **)a1, *(_QWORD *)(a1 + 8));
    if (!(_DWORD)result)
      break;
    v2 += 32;
    if (v2 == 160)
      return 0;
  }
  if (v2 <= ~(unint64_t)digests)
    return &digests[v2 / 4];
  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1;

  v1 = 0;
  while (digests[v1 / 4] != (_DWORD)result)
  {
    v1 += 32;
    if (v1 == 160)
      return 0;
  }
  if (v1 <= ~(unint64_t)digests)
    return &digests[v1 / 4];
  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v6;

  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    v6 = &CTOidSha1;
    v4 = 5;
    goto LABEL_11;
  }
  v4 = 9;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    v6 = &CTOidSha256;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    v6 = &CTOidSha256;
LABEL_18:
    v4 = 9;
    goto LABEL_11;
  }
  v4 = 9;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    v6 = &CTOidSha384;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    v6 = &CTOidSha384;
    goto LABEL_18;
  }
  v4 = 9;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    if (compare_octet_string_raw(a1, &sha512WithECDSA_oid, 8uLL))
      return 0;
    v6 = &CTOidSha512;
    goto LABEL_18;
  }
  v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 v18;
  unint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t vars0;

  result = 0;
  v27 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!(_DWORD)result
              || (result = validateOIDs((uint64_t)&rsaAlgs, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), (_DWORD)result))
            {
              v21 = 0xAAAAAAAAAAAAAAAALL;
              v22 = 0xAAAAAAAAAAAAAAAALL;
              v10 = a5[9];
              v9 = a5[10];
              if (__CFADD__(v10, v9))
                goto LABEL_31;
              if (v10 > v10 + v9)
                goto LABEL_32;
              v21 = a5[9];
              v22 = v10 + v9;
              if (!v9 || (result = ccder_blob_check_null(), (_DWORD)result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    result = ccder_decode_rsa_pub_n();
                    if (!result)
                      return result;
                    v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }
                    v12 = result << 6;
                    if (result << 6 < 0x400)
                      return 0;
                    v25 = 0xAAAAAAAAAAAAAAAALL;
                    v26 = -21846;
                    v24 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      v13 = a5[4];
                      LOBYTE(v25) = v13;
                      if ((unint64_t)&v24 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          v14 = __memcpy_chk();
                          if (v12 > 0x1068)
                            return 0;
                          result = MEMORY[0x24BDAC7A8](v14);
                          v16 = (unint64_t *)((char *)&v20 - v15);
                          v17 = 0;
                          *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
                          *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            v19 = &v16[v17 / 8];
                            *(_OWORD *)v19 = v18;
                            *((_OWORD *)v19 + 1) = v18;
                            v17 += 32;
                          }
                          while (v15 != v17);
                          if (v15 >= 1)
                          {
                            *v16 = v11;
                            if (ccrsa_import_pub())
                              return 0;
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs())
                              return v23 != 0;
                            result = 0;
                            v23 = 0;
                            return result;
                          }
                        }
                        goto LABEL_32;
                      }
                    }
                    goto LABEL_31;
                  }
LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }
LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL validateOIDs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  BOOL v7;

  v6 = 0;
  v7 = 1;
  do
  {
    if (!compare_octet_string(a1, a2) && !compare_octet_string(a1 + 16, a3))
      break;
    v7 = v6 < 3;
    a1 += 32;
    ++v6;
  }
  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0;
  int is_supported;
  _UNKNOWN **v2;
  _UNKNOWN **v3;
  _UNKNOWN **v4;

  v0 = ccec_x963_import_pub_size();
  is_supported = ccec_keysize_is_supported();
  v2 = &CTOidSECP256r1;
  v3 = &CTOidSECP521r1;
  v4 = &CTOidSECP384r1;
  if (v0 != 384)
    v4 = 0;
  if (v0 != 521)
    v3 = v4;
  if (v0 != 256)
    v2 = v3;
  if (is_supported)
    return v2;
  else
    return 0;
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  result = 0;
  v18 = *MEMORY[0x24BDAC8D0];
  HIBYTE(v17) = 0;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (result = validateOIDs((uint64_t)&ecAlgs, a5 + 24, a5 + 56), (_DWORD)result))
            {
              result = ccec_cp_for_oid((int **)(a5 + 72));
              if (result)
              {
                v8 = *(_QWORD *)result;
                if (*(_QWORD *)result >> 61 || !is_mul_ok(8 * v8, 3uLL))
                {
                  __break(0x550Cu);
                }
                else
                {
                  v9 = 24 * v8;
                  v10 = __CFADD__(v9, 16);
                  v11 = v9 + 16;
                  if (!v10 && v11 < 0xFFFFFFFFFFFFFFF0)
                  {
                    result = MEMORY[0x24BDAC7A8](result);
                    v14 = (uint64_t *)((char *)&v17 - v12);
                    v15 = 0;
                    do
                    {
                      v16 = &v14[v15 / 8];
                      *v16 = 0xAAAAAAAAAAAAAAAALL;
                      v16[1] = 0xAAAAAAAAAAAAAAAALL;
                      v15 += 16;
                    }
                    while (v12 != v15);
                    if (v13 >= 0x10)
                    {
                      *v14 = result;
                      if (v12 >= 1)
                      {
                        if (!ccec_import_pub())
                        {
                          result = ccec_x963_import_pub_size();
                          if (result == 256 && *(_QWORD *)(a5 + 96) == 64)
                          {
                            if (*(_QWORD *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0)
                            {
                              if (!ccec_verify_composite())
                                return HIBYTE(v17) != 0;
                              goto LABEL_24;
                            }
LABEL_31:
                            __break(0x5513u);
                            return result;
                          }
                          if (ccec_verify())
LABEL_24:
                            HIBYTE(v17) = 0;
                        }
                        return HIBYTE(v17) != 0;
                      }
LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }
LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }
                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ccec_cp_for_oid(int **a1)
{
  int *v1;
  int *v3;
  int v5;
  int v6;

  if (!a1)
    return 0;
  v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(_QWORD *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793)
      JUMPOUT(0x22767B590);
    return 0;
  }
  v3 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497)
    JUMPOUT(0x22767B59CLL);
  v5 = *v3;
  v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713)
    return 0;
  return ccec_cp_521();
}

uint64_t compressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)ccec_cp_for_oid(a2);
  if (!v6)
    return 655366;
  v7 = v6;
  v8 = *v6;
  if (*v6 >> 61 || !is_mul_ok(8 * v8, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }
  v9 = 24 * v8;
  v10 = __CFADD__(v9, 16);
  v11 = v9 + 16;
  if (v10 || v11 >= 0xFFFFFFFFFFFFFFF0)
LABEL_19:
    __break(0x5500u);
  result = MEMORY[0x24BDAC7A8]();
  v15 = (_QWORD *)((char *)v18 - v13);
  v16 = 0;
  do
  {
    v17 = &v15[v16 / 8];
    *v17 = 0xAAAAAAAAAAAAAAAALL;
    v17[1] = 0xAAAAAAAAAAAAAAAALL;
    v16 += 16;
  }
  while (v13 != v16);
  if (v14 < 0x10)
    goto LABEL_21;
  *v15 = v7;
  if (v13 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }
  result = ccec_import_pub();
  if (!(_DWORD)result)
  {
    result = ccec_compressed_x962_export_pub_size();
    if (result == a4)
    {
      if (!a3 || a4)
        return ccec_compressed_x962_export_pub();
      goto LABEL_20;
    }
    return 393220;
  }
  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v6)
    return 655366;
  v7 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v7, 3uLL))
LABEL_22:
    __break(0x550Cu);
  v8 = 24 * v7;
  v9 = __CFADD__(v8, 16);
  v10 = v8 + 16;
  if (v9 || v10 >= 0xFFFFFFFFFFFFFFF0)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }
  result = MEMORY[0x24BDAC7A8]();
  v14 = (_QWORD *)((char *)v18 - v12);
  v15 = 0;
  do
  {
    v16 = &v14[v15 / 8];
    *v16 = 0xAAAAAAAAAAAAAAAALL;
    v16[1] = 0xAAAAAAAAAAAAAAAALL;
    v15 += 16;
  }
  while (v12 != v15);
  if (v13 < 0x10)
    goto LABEL_24;
  *v14 = result;
  if (v12 >= 1)
  {
    v17 = ccec_compressed_x962_import_pub();
    if (!(_DWORD)v17)
    {
      result = cczp_bitlen();
      if (result < 0xFFFFFFFFFFFFFFF9)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4)
            v17 = 0;
          else
            v17 = 393220;
          ccec_export_pub();
          return v17;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    return v17;
  }
LABEL_23:
  __break(0x5519u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t CMSParseContentInfoSignedDataWithOptions(char *a1, uint64_t a2, unint64_t *a3, char a4)
{
  int v4;
  int v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  int v12;
  char *v13;
  char *v15;
  int v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  size_t v26;
  __int16 v27;
  char *v28;
  char *v29;
  unint64_t v30[3];
  __int16 v31;
  char *v32;
  unint64_t v33;
  size_t v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  char *v37;
  char *v38;
  unint64_t v39;
  unsigned __int8 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v28 = (char *)0xAAAAAAAAAAAAAAAALL;
  v29 = (char *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2))
    goto LABEL_114;
  if (&a1[a2] < a1)
    goto LABEL_112;
  v4 = 65537;
  v28 = a1;
  v29 = &a1[a2];
  v27 = 0;
  v26 = 0xAAAAAAAAAAAAAAAALL;
  v7 = ccder_blob_decode_ber_tl((uint64_t)&v28, 0x2000000000000010, (_BYTE *)&v27 + 1, &v26);
  result = 65537;
  if (v7)
  {
    v24 = (char *)0xAAAAAAAAAAAAAAAALL;
    v25 = (char *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26))
      goto LABEL_114;
    if (v28 > &v28[v26] || &v28[v26] > v29)
      goto LABEL_112;
    v24 = v28;
    v25 = &v28[v26];
    if (ccder_blob_decode_tl())
    {
      if (v25 < v24 || v26 > v25 - v24)
        goto LABEL_112;
      if (compare_octet_string_raw((uint64_t)&pkcs7_signedData_oid, v24, v26))
        return 65539;
      if (__CFADD__(v24, v26))
        goto LABEL_114;
      if (v24 > &v24[v26] || &v24[v26] > v25)
        goto LABEL_112;
      v24 += v26;
      if (!ccder_blob_decode_ber_tl((uint64_t)&v24, 0xA000000000000000, &v27, &v26))
        return 65540;
      v22 = (char *)0xAAAAAAAAAAAAAAAALL;
      v23 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26))
        goto LABEL_114;
      if (v24 > &v24[v26] || &v24[v26] > v25)
        goto LABEL_112;
      v22 = v24;
      v23 = &v24[v26];
      v31 = 0;
      memset(v30, 170, sizeof(v30));
      if ((ccder_blob_decode_ber_tl((uint64_t)&v22, 0x2000000000000010, (_BYTE *)&v31 + 1, v30) & 1) == 0)
        return 131073;
      if (__CFADD__(v22, v30[0]))
        goto LABEL_114;
      v9 = 131080;
      if (&v22[v30[0]] != v23)
        return 131082;
      v10 = a3 + 11;
      if (!ccder_blob_decode_uint64())
        return 131074;
      result = 131092;
      if (*v10 <= 4uLL && ((1 << *v10) & 0x1A) != 0)
      {
        if (!ccder_blob_eat_ber_inner((unint64_t *)&v22, 0x2000000000000011, 0, 125))
          return 131075;
        v35 = 0;
        v34 = 0;
        if ((ccder_blob_decode_ber_tl((uint64_t)&v22, 0x2000000000000010, &v35, &v34) & 1) == 0)
          return 131076;
        v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        v33 = 0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34))
          goto LABEL_114;
        if (v22 > &v22[v34] || &v22[v34] > v23)
          goto LABEL_112;
        v32 = v22;
        v33 = (unint64_t)&v22[v34];
        if (!ccder_blob_decode_tl())
          return 131077;
        if (v33 < (unint64_t)v32 || v34 > v33 - (unint64_t)v32)
          goto LABEL_112;
        if (compare_octet_string_raw((uint64_t)&pkcs7_data_oid, v32, v34))
          return 131078;
        if (__CFADD__(v32, v34))
          goto LABEL_114;
        v11 = &v32[v34];
        if (v32 > &v32[v34] || (unint64_t)v11 > v33)
          goto LABEL_112;
        v32 += v34;
        v12 = v35;
        if (v11 != (char *)v33 || v35)
        {
          v40 = 0;
          v38 = (char *)v33;
          v39 = 0;
          v37 = v11;
          if (ccder_blob_decode_ber_tl((uint64_t)&v37, 0xA000000000000000, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39))
                goto LABEL_114;
              if (&v37[v39] != (char *)v33)
                return v9;
            }
            if (v37 > v38)
              goto LABEL_112;
            v32 = v37;
            v33 = (unint64_t)v38;
            v36 = 0;
            v16 = v40;
            if (v40 && !ccder_blob_decode_ber_tl((uint64_t)&v32, 0x2000000000000004, &v36, &v39))
              return 131079;
            v41 = 0;
            if (!ccder_blob_decode_tl())
              return 131090;
            v17 = v32;
            v18 = v33;
            if (v33 < (unint64_t)v32)
              goto LABEL_112;
            v19 = v41;
            if (v41 > v33 - (unint64_t)v32)
              goto LABEL_112;
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0;
            }
            v20 = &v17[v19];
            if ((unint64_t)v20 > v18 || v17 > v20)
              goto LABEL_112;
            v32 = v20;
            if ((ccder_blob_decode_eoc((unint64_t *)&v32, v36) & 1) == 0)
              return 131089;
          }
          else
          {
            if (!v12)
              return v9;
            v16 = v40;
          }
          if ((ccder_blob_decode_eoc((unint64_t *)&v32, v16 != 0) & 1) == 0)
            return 131088;
          v11 = v32;
        }
        if (v11 > v23 || v22 > v11)
          goto LABEL_112;
        v22 = v11;
        if ((ccder_blob_decode_eoc((unint64_t *)&v22, v12 != 0) & 1) == 0)
          return 131081;
        v37 = (char *)0xAAAAAAAAAAAAAAAALL;
        v38 = (char *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23)
          goto LABEL_112;
        v37 = v22;
        v38 = v23;
        if ((ccder_blob_decode_ber_tl((uint64_t)&v37, 0xA000000000000000, &v31, v30) & 1) == 0)
        {
          v13 = v22;
          v15 = v23;
          goto LABEL_86;
        }
        v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        v33 = 0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38)
            goto LABEL_112;
          v32 = v37;
          v33 = (unint64_t)&v37[v30[0]];
          if (!CMSParseImplicitCertificateSet((unint64_t *)&v32, a3[1], *a3, a3 + 3, a3 + 2))
            return 131085;
          if (!ccder_blob_decode_eoc((unint64_t *)&v32, v31))
            return 131086;
          v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32)
              goto LABEL_112;
            v15 = v38;
            if (v32 > v38)
              goto LABEL_112;
            v22 = v32;
            v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              v37 = v13;
              v38 = v15;
              if (ccder_blob_eat_ber_inner((unint64_t *)&v37, 0xA000000000000001, 0, 125))
              {
                if (v37 > v38)
                  goto LABEL_112;
                v22 = v37;
                v23 = v38;
              }
              if (!ccder_blob_eat_ber_inner((unint64_t *)&v22, 0x2000000000000011, &v30[1], 125))
                return 131083;
              if (v30[2] >= v30[1])
              {
                v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if ((ccder_blob_decode_eoc((unint64_t *)&v22, HIBYTE(v31)) & 1) == 0)
                    return 131084;
                  if (!ccder_blob_decode_eoc((unint64_t *)&v22, v27))
                    return 65541;
                  if (v22 <= v25 && v24 <= v22)
                  {
                    v24 = v22;
                    if (ccder_blob_decode_eoc((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29)
                        return 65543;
                      return 0;
                    }
                    return (v4 + 5);
                  }
                }
              }
            }
LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }
        goto LABEL_114;
      }
    }
    else
    {
      return 65538;
    }
  }
  return result;
}

uint64_t ccder_blob_decode_ber_tl(uint64_t a1, uint64_t a2, _BYTE *a3, unint64_t *a4)
{
  int v8;
  uint64_t result;

  v8 = ccder_blob_decode_tag();
  result = 0;
  if (v8)
  {
    if (a2 == 0xAAAAAAAAAAAAAAAALL)
      return ccder_blob_decode_ber_len(a1, a3, a4);
  }
  return result;
}

uint64_t ccder_blob_decode_eoc(unint64_t *a1, int a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;

  if (!a2)
    return 1;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return result;
  v4 = *a1;
  if (*a1 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }
  v5 = v4 - 0x5555555555555556;
  if (v4 > v4 - 0x5555555555555556 || v5 > a1[1])
    goto LABEL_12;
  *a1 = v5;
  return 1;
}

uint64_t CMSParseContentInfoSignedData(char *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, __int128 *))
{
  uint64_t v3;
  unint64_t v4;
  unsigned int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int *digest;
  int *v14;
  unsigned int v15;
  uint64_t result;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int *v33;
  unsigned int v34;
  unint64_t v35;
  _OWORD *v36;
  unint64_t v37;
  BOOL v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  unsigned int v48;
  int v49;
  uint64_t v50;
  _OWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  unsigned __int8 v60;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unsigned __int8 v71;
  unint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v84 = 0xAAAAAAAAAAAAAAAALL;
  v85 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  if (__CFADD__(v4, v3))
    goto LABEL_93;
  if (v4 > v4 + v3)
    goto LABEL_92;
  v84 = *(_QWORD *)(a1 + 40);
  v85 = v4 + v3;
  v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    v48 = 0;
    result = 0;
    if (v3)
      return (v48 << 8) | 0x30008;
    return result;
  }
  v6 = 0;
  v60 = 0;
  v7 = 256;
  while (1)
  {
    v71 = 0;
    v82 = 0u;
    v83 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((ccder_blob_decode_ber_tl((uint64_t)&v84, 0x2000000000000010, &v71, &v72) & 1) == 0)
    {
      v49 = 196609;
      return v7 | v49;
    }
    v69 = 0xAAAAAAAAAAAAAAAALL;
    v70 = 0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72))
      goto LABEL_93;
    if (v84 > v84 + v72 || v84 + v72 > v85)
      goto LABEL_92;
    v69 = v84;
    v70 = v84 + v72;
    if ((ccder_blob_decode_uint64() & 1) == 0)
    {
      v49 = 196610;
      return v7 | v49;
    }
    v9 = v69;
    v8 = v70;
    v67 = 0xAAAAAAAAAAAAAAAALL;
    v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70)
      goto LABEL_92;
    v67 = v69;
    v68 = v70;
    v65 = v69;
    v66 = v70;
    if (!ccder_blob_decode_tl())
      break;
    v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9))
      goto LABEL_94;
    if (v72 + v10 - v9 > v8 - v9)
      goto LABEL_92;
    *((_QWORD *)&v73 + 1) = v9;
    *(_QWORD *)&v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72))
      goto LABEL_93;
    if (v10 > v10 + v72 || v10 + v72 > v70)
      goto LABEL_92;
    v69 = v10 + v72;
    if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v74 + 1))
    {
      v49 = 196612;
      return v7 | v49;
    }
    v63 = 0xAAAAAAAAAAAAAAAALL;
    v64 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70)
      goto LABEL_92;
    v63 = v69;
    v64 = v70;
    if (ccder_blob_decode_tl())
    {
      if (v64 < v63 || v72 > v64 - v63)
        goto LABEL_92;
      *((_QWORD *)&v75 + 1) = v63;
      *(_QWORD *)&v76 = v72;
      if (__CFADD__(v63, v72))
        goto LABEL_93;
      if (v63 > v63 + v72 || v63 + v72 > v64)
        goto LABEL_92;
      v69 = v63 + v72;
      v70 = v64;
    }
    else
    {
      *((_QWORD *)&v75 + 1) = 0;
      *(_QWORD *)&v76 = 0;
    }
    if ((ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      v49 = 196613;
      return v7 | v49;
    }
    if ((ccder_blob_decode_tl() & 1) == 0)
    {
      v49 = 196614;
      return v7 | v49;
    }
    if (v70 < v69 || v72 > v70 - v69)
      goto LABEL_92;
    *((_QWORD *)&v78 + 1) = v69;
    *(_QWORD *)&v79 = v72;
    if (__CFADD__(v69, v72))
      goto LABEL_93;
    v12 = v69 + v72;
    if (v69 > v69 + v72 || v12 > v70)
      goto LABEL_92;
    v69 += v72;
    v63 = v12;
    v64 = v70;
    if (ccder_blob_eat_ber_inner(&v63, 0xA000000000000001, 0, 125))
    {
      if (v63 > v64)
        goto LABEL_92;
      v69 = v63;
      v70 = v64;
    }
    if ((ccder_blob_decode_eoc(&v69, v71) & 1) == 0)
    {
      v49 = 196615;
      return v7 | v49;
    }
    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      v14 = digest;
      v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        result = a3(a2, a1, &v73);
        if ((_DWORD)result != 327710)
        {
          if ((_DWORD)result)
            return result;
          v17 = *(_QWORD *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              v29 = v60 - 1;
              v30 = *(_QWORD *)(a1 + 56);
              v31 = 176 * v29;
              if (__CFADD__(v30, v31))
                goto LABEL_93;
              v32 = v30 + 176 * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30)
                goto LABEL_92;
              v33 = find_digest(v30 + 176 * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    v35 = *(_QWORD *)(a1 + 56);
                    if (__CFADD__(v35, v31))
                      goto LABEL_93;
                    v36 = (_OWORD *)(v35 + 176 * v29);
                    v37 = v35 + 176 * *(_QWORD *)(a1 + 64);
                    v38 = v37 >= (unint64_t)v36;
                    v39 = v37 - (_QWORD)v36;
                    if (!v38 || v35 > (unint64_t)v36 || v39 < 0xB0)
                      goto LABEL_92;
                    v40 = v73;
                    v41 = v75;
                    v36[1] = v74;
                    v36[2] = v41;
                    *v36 = v40;
                    v42 = v76;
                    v43 = v77;
                    v44 = v79;
                    v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    v36[4] = v43;
                    v45 = v80;
                    v46 = v81;
                    v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    v36[7] = v45;
                    v36[8] = v46;
                  }
                }
              }
            }
          }
          else
          {
            v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              v19 = *(_QWORD *)(a1 + 56);
              if (__CFADD__(v19, 176 * (char)v60))
                goto LABEL_93;
              v20 = (_OWORD *)(v19 + 176 * v60);
              if (176 * v17 - 176 * v60 < 0xB0)
                goto LABEL_92;
              v21 = v73;
              v22 = v75;
              v20[1] = v74;
              v20[2] = v22;
              *v20 = v21;
              v23 = v76;
              v24 = v77;
              v25 = v79;
              v20[5] = v78;
              v20[6] = v25;
              v20[3] = v23;
              v20[4] = v24;
              v26 = v80;
              v27 = v81;
              v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }
              ++v60;
            }
          }
        }
      }
    }
    if (v69 > v85 || v84 > v69)
      goto LABEL_92;
    v84 = v69;
    v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85)
        continue;
    }
    if (v69 == v85)
    {
      if (v60)
        return 0;
      v50 = *(_QWORD *)(a1 + 64);
      if (!v50)
        return 0;
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        result = 0;
        v51 = *(_OWORD **)(a1 + 56);
        v52 = v73;
        v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        *v51 = v52;
        v54 = v76;
        v55 = v77;
        v56 = v79;
        v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        v57 = v80;
        v58 = v81;
        v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }
LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }
    return (v48 << 8) | 0x30008;
  }
  if ((ccder_blob_decode_tl() & 1) != 0)
  {
    v10 = v67;
    v11 = v68;
LABEL_17:
    if (v10 > v11)
      goto LABEL_92;
    v69 = v10;
    v70 = v11;
    goto LABEL_19;
  }
  if (ccder_blob_decode_tl())
  {
    v10 = v65;
    v11 = v66;
    goto LABEL_17;
  }
  v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t CertificateUsingKeyIdentifier;
  uint64_t v13;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  v3 = *(_QWORD *)(a3 + 8);
  v4 = *(_QWORD *)(a3 + 16);
  if (__CFADD__(v3, v4))
LABEL_49:
    __break(0x5513u);
  v5 = v3 + v4;
  if (v3 > v5)
    goto LABEL_48;
  v20 = *(_QWORD *)(a3 + 8);
  v21 = v5;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(_QWORD *)a3 != 3)
  {
    if (*(_QWORD *)a3 != 1)
      return 524289;
    v8 = 524293;
    if (!ccder_blob_decode_tl())
      return 524290;
    if (!ccder_blob_decode_tl())
      return 524291;
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      v15 = v20;
      v16 = v19;
      if (__CFADD__(v20, v19))
        goto LABEL_49;
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (!ccder_blob_decode_tl())
          return 524292;
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          v17 = v20;
          v18 = v19;
          if (__CFADD__(v20, v19))
            goto LABEL_49;
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            v9 = *(_QWORD **)(a2 + 24);
            if (!v9)
              return v8;
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              v9 = (_QWORD *)v9[34];
              if (!v9)
                return v8;
            }
            goto LABEL_36;
          }
        }
      }
    }
    goto LABEL_48;
  }
  if (*(_QWORD *)(a2 + 88) == 1)
    return 524298;
  v15 = v3;
  v16 = v5;
  if (ccder_blob_decode_tl())
  {
    v11 = v20;
    v10 = v21;
    goto LABEL_29;
  }
  v8 = 524294;
  if (!ccder_blob_decode_tl() || !ccder_blob_decode_tl())
    return v8;
  v11 = v15;
  v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }
  v20 = v15;
  v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11)
    goto LABEL_48;
  v17 = v11;
  v18 = v19;
  if (__CFADD__(v11, v19))
    goto LABEL_49;
  if (v11 > v11 + v19 || v11 + v19 > v10)
    goto LABEL_48;
  v20 = v11 + v19;
  CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier)
    return 524295;
  v9 = (_QWORD *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21)
    return 524543;
  v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (_QWORD *)(a3 + 152));
  v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681)
    *(_DWORD *)(a3 + 168) = v13;
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  __int128 *v6;
  int *digest;
  unint64_t *v8;
  unint64_t *v9;
  _OWORD *v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28[2];
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _OWORD v34[4];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = (__int128 *)(a3 + 24);
  digest = find_digest(a3 + 24);
  if (!digest)
    return 327682;
  v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  v9 = v8;
  memset(v34, 0, sizeof(v34));
  v10 = (_OWORD *)a2[13];
  v11 = a2[14];
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (a2[9] && a2[10])
    {
      v10 = v34;
      v13 = ccdigest();
      v11 = *v9;
      if (*v9 >= 0x41)
        goto LABEL_55;
      goto LABEL_16;
    }
    if (!v10)
      goto LABEL_31;
  }
  if (*v8 != v11)
  {
LABEL_31:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710;
  }
  if (v11 > 0x40)
    goto LABEL_55;
  v13 = __memcpy_chk();
LABEL_16:
  *(_QWORD *)(a3 + 128) = v10;
  *(_QWORD *)(a3 + 136) = v11;
  v15 = (_QWORD *)(a3 + 128);
  v16 = *(_QWORD *)(a3 + 48);
  if (!v16)
  {
    result = CMSBuildPath(v13, (uint64_t)a2, a3);
    switch((int)result)
    {
      case 524293:
      case 524295:
        *(_DWORD *)(a3 + 168) = result;
        return 0;
      case 524294:
        goto LABEL_52;
      case 524296:
        if (*(_DWORD *)(a3 + 168) != 458753)
          goto LABEL_43;
        v20 = 524296;
LABEL_42:
        *(_DWORD *)(a3 + 168) = v20;
LABEL_43:
        v21 = *v9;
        if (*v9 > 0x40)
          goto LABEL_55;
        v28[0] = (uint64_t)v34;
        v28[1] = v21;
        result = X509CertificateCheckSignatureDigest(29, *(_QWORD *)(a3 + 152), v28, v6, (__int128 *)(a3 + 88));
        if (!(_DWORD)result || (_DWORD)result == 655648 || (_DWORD)result == 655632)
        {
          v22 = *(_DWORD *)(a3 + 168);
          if (!v22 || v22 == 458753 || v22 == 327681)
            *(_DWORD *)(a3 + 168) = result;
          result = 0;
        }
        break;
      case 524297:
        v20 = 524297;
        goto LABEL_42;
      default:
        if ((_DWORD)result)
          goto LABEL_52;
        goto LABEL_43;
    }
    goto LABEL_52;
  }
  v25 = a1;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  v33 = 0xAAAAAAAAAAAAAAAALL;
  v17 = *(_QWORD *)(a3 + 40);
  if (__CFADD__(v17, v16))
LABEL_56:
    __break(0x5513u);
  v18 = v17 + v16;
  if (v17 > v18)
    goto LABEL_55;
  v32 = *(_QWORD *)(a3 + 40);
  v33 = v18;
  v31 = 0xAAAAAAAAAAAAAAAALL;
  if (v17 >= v18)
  {
    result = 262156;
    goto LABEL_52;
  }
  v27 = 0x2000000000000010;
  v24 = 262146;
  v26 = 262147;
  v23 = 458754;
  if (!ccder_blob_decode_tl())
  {
    result = 262145;
    goto LABEL_52;
  }
  if (__CFADD__(v32, v31))
    goto LABEL_56;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  if (v32 > v32 + v31 || v32 + v31 > v33)
  {
LABEL_55:
    __break(0x5519u);
    goto LABEL_56;
  }
  v29 = v32;
  v30 = v32 + v31;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v29, v31))
      goto LABEL_56;
    if (v29 <= v29 + v31 && v29 + v31 <= v30)
    {
      v29 += v31;
      result = 262150;
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  result = v24;
LABEL_52:
  if ((_OWORD *)*v15 == v34)
  {
    *v15 = 0;
    *(_QWORD *)(a3 + 136) = 0;
  }
  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v7;

  v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!(_DWORD)v5)
  {
    v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168))
        *(_DWORD *)(a3 + 168) = v7;
    }
  }
  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7)
{
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9[0] = 0;
  return CMSVerify(a1, a2, a3, a4, a5, a6, a7, &v8, v9);
}

uint64_t CMSVerify(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9)
{
  uint64_t result;
  uint64_t v18;
  _OWORD v19[9];
  __int128 v20;
  __int128 v21;
  unint64_t v22[2];
  __int128 v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  _OWORD v28[3];
  uint64_t v29;
  _QWORD v30[2];
  _BYTE __b[1216];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v30[0] = 0;
  memset(v28, 0, sizeof(v28));
  v26 = 0;
  v25 = 0;
  v23 = 0u;
  v24 = (char *)&v23 + 8;
  v30[1] = 0;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4;
  v22[1] = (unint64_t)__b;
  v20 = 0u;
  v21 = 0u;
  memset(v19, 0, sizeof(v19));
  v27 = v19;
  *(_QWORD *)&v28[0] = 1;
  DWORD2(v21) = 327681;
  if (a2 < 0)
    goto LABEL_19;
  result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if ((_DWORD)result)
    return result;
  if (!a4)
    goto LABEL_7;
  result = 131091;
  if (*(_OWORD *)((char *)v28 + 8) != 0)
    return result;
  if (a4 < 0)
LABEL_19:
    __break(0x5519u);
  *((_QWORD *)&v28[0] + 1) = a3;
  *(_QWORD *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  result = CMSParseSignerInfos((uint64_t)v22, (uint64_t)v30, (uint64_t (*)(uint64_t, uint64_t, __int128 *))validateSignerInfoAndChain);
  if (!(_DWORD)result)
  {
    result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7)
        result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            v18 = *(_QWORD *)&v28[1];
            if (*(_QWORD *)&v28[1])
            {
              if (*((_QWORD *)&v28[0] + 1))
              {
                *a8 = *((_QWORD *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CMSVerifySignedData(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v7 = 0;
  v9[0] = 0;
  v8 = 0;
  return CMSVerify(a1, a2, a3, a4, a5, &v6, &v7, &v8, v9);
}

uint64_t CMSVerifyAndReturnSignedData(char *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v7[0] = 0;
  return CMSVerify(a1, a2, 0, 0, a5, &v6, v7, a3, a4);
}

uint64_t ccder_blob_decode_ber_len(uint64_t result, _BYTE *a2, unint64_t *a3)
{
  unsigned __int8 *v3;
  unint64_t v4;
  unsigned __int8 *v5;
  unint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unint64_t v10;
  uint64_t v11;

  *a2 = 0;
  v3 = *(unsigned __int8 **)result;
  if (!*(_QWORD *)result)
    return 0;
  v4 = *(_QWORD *)(result + 8);
  if ((unint64_t)v3 >= v4)
    return 0;
  if (v3 == (unsigned __int8 *)-1)
    goto LABEL_42;
  v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
LABEL_42:
    __break(0x5513u);
    return result;
  }
  *(_QWORD *)result = v5;
  v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        v7 = v4 - (_QWORD)v5;
        *a2 = 1;
        break;
      case 0x81u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 1)
          return 0;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        v8 = v3 + 2;
        if (v5 > v8 || (unint64_t)v8 > v4)
          goto LABEL_41;
        *(_QWORD *)result = v8;
        v7 = *v5;
        v5 = v8;
        break;
      case 0x82u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 2)
          return 0;
        if ((unint64_t)v5 >= v4)
          goto LABEL_41;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_42;
        v9 = v3 + 3;
        if (v5 > v3 + 3 || (unint64_t)v9 > v4)
          goto LABEL_41;
        v10 = (unint64_t)v3[1] << 8;
        v11 = v3[2];
        goto LABEL_40;
      case 0x83u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 3)
          return 0;
        if ((unint64_t)v5 >= v4)
          goto LABEL_41;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_42;
        if (v3 + 3 < v5 || (unint64_t)(v3 + 3) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFCLL)
          goto LABEL_42;
        v9 = v3 + 4;
        if (v5 > v3 + 4 || (unint64_t)v9 > v4)
          goto LABEL_41;
        v10 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        v11 = v3[3];
LABEL_40:
        v7 = v10 | v11;
        *(_QWORD *)result = v9;
        v5 = v9;
        break;
      default:
        return 0;
    }
  }
  if (v4 - (unint64_t)v5 < v7)
    return 0;
  *a3 = v7;
  return 1;
}

uint64_t CMSParseImplicitCertificateSet(unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t **v19;
  unint64_t **v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v25;
  unint64_t **v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0;
  a4[1] = 0;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v5 = *a1;
  v6 = a1[1];
  if (*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }
  v30 = *a1;
  v31 = v6;
  v7 = v5 >= v6 || a3 == 0;
  if (v7)
  {
    v12 = 0;
LABEL_8:
    if (a5)
      *a5 = v12;
    return 1;
  }
  else
  {
    v12 = 0;
    v13 = 304 * a3;
    v14 = a2 + 304 * a3;
    v25 = ~a2;
    v27 = (unint64_t **)(a4 + 1);
    v23 = (unint64_t *)(a2 + 272);
    v15 = a2;
    while (1)
    {
      v29 = 0;
      if (!ccder_blob_decode_tag())
        return 0;
      if (!v32)
        goto LABEL_8;
      if (!ccder_blob_decode_ber_len((uint64_t)&v30, &v29, &v28) || v29 || v32 != 0x2000000000000010)
        return 0;
      if ((unsigned __int128)((uint64_t)v12 * (__int128)304) >> 64 != (uint64_t)(304 * v12) >> 63 || 304 * v12 > v25)
        goto LABEL_44;
      if (v15 > v14)
        goto LABEL_43;
      if (v15 < a2)
        goto LABEL_43;
      v16 = v13 >= 0x130;
      v13 -= 304;
      if (!v16)
        goto LABEL_43;
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14)
          goto LABEL_43;
        *(_QWORD *)(v15 + 272) = 0;
        v17 = *v27;
        *(_QWORD *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14)
            goto LABEL_43;
        }
        *v17 = v15;
        *v27 = (unint64_t *)(v15 + 272);
      }
      else
      {
        if (v15 + 304 > v14)
          goto LABEL_43;
        v18 = *a4;
        *v23 = *a4;
        v19 = (unint64_t **)(v18 + 280);
        v7 = v18 == 0;
        v20 = v27;
        if (!v7)
          v20 = v19;
        *v20 = v23;
        if (v15)
        {
          if (v15 >= v14)
            goto LABEL_43;
        }
        *a4 = v15;
        *(_QWORD *)(a2 + 280) = a4;
      }
      if (X509CertificateParseImplicit(v15, &v30, 0, 0))
        return 0;
      if (v6 < v5)
        goto LABEL_43;
      v21 = v30;
      v22 = v30 - v5;
      if (v30 - v5 > v6 - v5)
        goto LABEL_43;
      if (v15 + 304 > v14)
        goto LABEL_43;
      *(_QWORD *)v15 = v5;
      *(_QWORD *)(v15 + 8) = v22;
      v6 = v31;
      if (v21 > v31)
        goto LABEL_43;
      *a1 = v21;
      a1[1] = v6;
      ++v12;
      if (v21 < v6)
      {
        v15 += 304;
        v5 = v21;
        if (v12 < a3)
          continue;
      }
      goto LABEL_8;
    }
  }
}

uint64_t ccder_blob_eat_ber_inner(unint64_t *a1, uint64_t a2, unint64_t *a3, int a4)
{
  int v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v8 = ccder_blob_decode_tag();
  result = 0;
  if (v8 && v14 == a2)
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
    result = ccder_blob_decode_ber_len((uint64_t)a1, &v15, &v13);
    if ((result & 1) == 0)
      return 0;
    if (a3)
    {
      v10 = a1[1];
      if (*a1 > v10)
        goto LABEL_18;
      *a3 = *a1;
      a3[1] = v10;
    }
    if (v15)
    {
      if (a4 >= 1)
      {
        result = ccder_blob_eat_ber_inner(a1, 0, 0, (char)(a4 - 1));
        if (!(_DWORD)result)
          return result;
        return (ccder_blob_decode_eoc(a1, 1) & 1) != 0;
      }
      return 0;
    }
    v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }
    v12 = v11 + v13;
    if (v11 <= v11 + v13 && v12 <= a1[1])
    {
      *a1 = v12;
      return 1;
    }
LABEL_18:
    __break(0x5519u);
    goto LABEL_19;
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2;
  size_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  if (v2 > v3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3 == a3)
    return memcmp(*(const void **)a1, a2, a3);
  if (v3 > a3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 <= *(_QWORD *)(a2 + 8))
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  else
    return 0xFFFFFFFFLL;
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    if (*a1 > a1[1])
      goto LABEL_20;
    v5 = *a1;
    v6 = *a1;
    result = ccder_blob_decode_tl();
    if (!(_DWORD)result)
      return result;
    if (a2)
    {
      if (v6 < v5)
        goto LABEL_20;
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      result = ccder_blob_decode_tl();
      if (!(_DWORD)result)
        return result;
      if (v5 != v6)
        return 0;
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(_QWORD *a1)
{
  if (*a1 > a1[1])
    goto LABEL_6;
  if ((ccder_blob_decode_tl() & 1) != 0)
    return 0;
  if (*a1 > a1[1])
LABEL_6:
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0;
}

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  result = 0;
  if (a2 && a3)
  {
    *a3 = 0;
    a3[1] = 0;
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      *a2 = 0;
LABEL_6:
      v7 = v10;
LABEL_16:
      if (v7 <= a1[1] && *a1 <= v7)
      {
        *a1 = v7;
        return 1;
      }
LABEL_42:
      __break(0x5519u);
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v11 = *a1;
    v16 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v11;
      if (v16 < v11)
        goto LABEL_42;
      *a3 = v11;
      a3[1] = 0;
      v8 = 1;
LABEL_15:
      *a2 = v8;
      goto LABEL_16;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v12 = *a1;
    v17 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v12;
      if (v17 < v12)
        goto LABEL_42;
      *a3 = v12;
      a3[1] = 0;
      v8 = 2;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      v9 = 3;
LABEL_23:
      *a2 = v9;
      goto LABEL_6;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v13 = *a1;
    v18 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v13;
      if (v18 < v13)
        goto LABEL_42;
      *a3 = v13;
      a3[1] = 0;
      v8 = 4;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      v9 = 5;
      goto LABEL_23;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v14 = *a1;
    v19 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v14;
      if (v19 < v14)
        goto LABEL_42;
      *a3 = v14;
      a3[1] = 0;
      v8 = 6;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v15 = *a1;
    v20 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v15;
      if (v20 < v15)
        goto LABEL_42;
      *a3 = v15;
      a3[1] = 0;
      v8 = 7;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      v9 = 8;
      goto LABEL_23;
    }
  }
  return result;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  unint64_t v11;
  __int128 v12;
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  _OWORD v17[19];
  uint64_t v18;

  v6 = 0;
  v18 = *MEMORY[0x24BDAC8D0];
  if (a1 < a2 && a4)
  {
    v8 = 0;
    v9 = a4 - 1;
    v10 = a3;
    v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      v15 = a1;
      v16 = a2;
      result = X509CertificateParse((unint64_t *)v17, &v15);
      if ((_DWORD)result)
        break;
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3)
        __break(0x5519u);
      *v10 = v17[0];
      v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++)
          continue;
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    result = 0;
    if (a5)
      *a5 = v6;
  }
  return result;
}

uint64_t CTParseExtensionValue(unint64_t a1, uint64_t a2, const void *a3, size_t a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v9;
  unint64_t v10[2];
  _OWORD v11[15];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_11;
  v10[0] = a1;
  v10[1] = a1 + a2;
  result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!(_DWORD)result)
  {
    result = 720914;
    if (*((_QWORD *)&v12 + 1))
    {
      v9 = v13;
      if ((_QWORD)v13)
      {
        result = 0;
        if (a5)
        {
          if (a6)
          {
            result = 0;
            *a5 = *((_QWORD *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  unint64_t v7[2];
  _OWORD v8[19];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(v8, 0, sizeof(v8));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_7;
  v7[0] = a1;
  v7[1] = a1 + a2;
  result = X509CertificateParse((unint64_t *)v8, v7);
  if (!(_DWORD)result)
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateCertifiedChip(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  uint64_t result;
  uint64_t *v22;
  uint64_t v23;
  __int128 *v24;
  unint64_t v25;
  int v26;
  unint64_t v27[2];
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33[4];
  _QWORD __b[154];

  __b[152] = *MEMORY[0x24BDAC8D0];
  result = (uint64_t)memset(__b, 170, 0x4C0uLL);
  memset(v33, 170, sizeof(v33));
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2))
    goto LABEL_34;
  if (a1 + a2 < a1)
    goto LABEL_35;
  v30 = a1;
  v31 = a1 + a2;
  result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4, &v33[2], &v32);
  if ((_DWORD)result)
    return result;
  result = 327690;
  if (v30 != v31)
    return result;
  if (v32 != 2)
    return 327692;
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  *v22 = (uint64_t)&__b[74];
  if ((_QWORD *)((char *)&__b[38] + 1) != 0 && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL)
LABEL_34:
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0;
  __b[37] = v33[1];
  *(_QWORD *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  result = X509ChainCheckPathWithOptions(12, v33, a12, 0);
  if ((_DWORD)result)
    return result;
  v23 = **(_QWORD **)(v33[1] + 8);
  v28 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000) != 0)
    goto LABEL_35;
  v28 = a3;
  v29 = a4;
  v24 = (__int128 *)oidForPubKeyLength();
  result = X509CertificateCheckSignatureWithPublicKey(&v28, (uint64_t)&ecPublicKey, v24, v23 + 16, (__int128 *)(v23 + 40), (__int128 *)(v23 + 56));
  if ((_DWORD)result)
    return result;
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000) != 0)
      goto LABEL_35;
    if (compare_octet_string_raw(v23 + 248, a9, a10))
      return 590085;
  }
  v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  v26 = result;
  if ((_DWORD)result)
    result = result;
  else
    result = 327691;
  if (!v25 || v26)
    return result;
  if (a11)
    *a11 = (*(_QWORD *)(v25 + 240) & a13) != 0;
  if (!a7 || !a8)
    return 0;
  v27[0] = 0;
  v27[1] = 0;
  if (v25 >= v25 + 304)
    goto LABEL_35;
  result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if ((_DWORD)result)
    return result;
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }
  result = CTCopyUID((uint64_t)v27, a7, a8);
  if (!(_DWORD)result)
    return 0;
  return result;
}

uint64_t CTEvaluateSavageCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, BOOL *a7)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, 0, 0, 0, 0, a7, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateYonkersCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicyYonkers, 0x80000);
}

uint64_t CTEvaluateSensorCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, _QWORD *a7, _QWORD *a8, _BYTE *a9, uint64_t a10, BOOL *a11)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a7, a8, a9, a10, a5, a6, a11, (uint64_t)&X509PolicySensor, 0x10000000000);
}

unint64_t CTCopyDeviceIdentifiers(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  uint64_t v6;
  int v7;
  char v8;
  _QWORD v9[2];
  unint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = 327696;
  if (!result || !a2)
    return v3;
  v11 = 0;
  v12[0] = 0;
  v10 = 0;
  if (__CFADD__(result, a2))
  {
    __break(0x5513u);
  }
  else if (result + a2 >= result)
  {
    v9[0] = result;
    v9[1] = result + a2;
    v5 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, v12);
    v6 = 327697;
    if (!v5 && !HIDWORD(v12[0]))
    {
      if (CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v11))
      {
        return 327698;
      }
      else
      {
        v7 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v10);
        v6 = 327699;
        if (!v7)
        {
          v8 = v10;
          if (v10 <= 0xFF)
          {
            v6 = 0;
            if (a3)
            {
              *(_DWORD *)a3 = v12[0];
              *(_QWORD *)(a3 + 8) = v11;
              *(_BYTE *)(a3 + 16) = (v8 & 8) != 0;
              *(_BYTE *)(a3 + 17) = (v8 & 4) != 0;
              *(_BYTE *)(a3 + 18) = v8 & 3;
              *(_QWORD *)(a3 + 24) = 0;
              *(_QWORD *)(a3 + 32) = 0;
            }
          }
        }
      }
    }
    return v6;
  }
  __break(0x5519u);
  return result;
}

uint64_t CTConvertDashTerminatedHexstringTo64BitInteger(uint64_t result, _QWORD *a2)
{
  unsigned __int8 *v2;
  unint64_t v3;
  _QWORD *v4;
  unsigned __int8 *v5;
  unint64_t v6;
  unsigned __int8 *v7;
  char v8;
  unsigned __int8 *v9;
  uint64_t v10;
  signed int v11;
  char v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  unsigned __int8 *v17;
  BOOL v18;
  unsigned __int8 *v19;
  unsigned __int8 *v21;
  unsigned int v22;
  unint64_t v23;

  v2 = *(unsigned __int8 **)result;
  v3 = *(_QWORD *)(result + 8);
  if (*(_QWORD *)result > v3)
    goto LABEL_50;
  v4 = (_QWORD *)result;
  v5 = *(unsigned __int8 **)result;
  if (*(_QWORD *)result < v3)
  {
    v6 = v3 - (_QWORD)v2;
    v5 = *(unsigned __int8 **)result;
    while (*v5 != 45)
    {
      v7 = v5 + 1;
      if ((unint64_t)(v5 + 1) > v3 || v5 > v7)
        goto LABEL_50;
      *(_QWORD *)result = v7;
      ++v5;
      if (!--v6)
      {
        v5 = (unsigned __int8 *)v3;
        break;
      }
    }
  }
  if ((unint64_t)v5 > v3 || v2 > v5)
    goto LABEL_50;
  result = 327708;
  if (v5 == (unsigned __int8 *)v3)
    return result;
  v8 = (_BYTE)v5 - (_BYTE)v2;
  if (v5 - v2 > 16)
    return result;
  if (v5 == (unsigned __int8 *)-1)
    goto LABEL_51;
  v9 = v5 + 1;
  if ((unint64_t)(v5 + 1) > v3 || v5 > v9)
  {
LABEL_50:
    __break(0x5519u);
LABEL_51:
    __break(0x5513u);
LABEL_52:
    __break(0x5500u);
    return result;
  }
  v10 = 0;
  *v4 = v9;
  if (v2 >= v5 || (v11 = v8 + 1 + (((v8 + 1) & 0x8000u) >> 15), v11 << 23 >> 24 < 1))
  {
LABEL_46:
    result = 0;
    if (a2)
      *a2 = v10;
  }
  else
  {
    v12 = 0;
    v10 = 0;
    v13 = v11 >> 1;
    v14 = 8 * v13 - 8;
    while (1)
    {
      if ((v8 & 1) == 0 || (v12 & 1) != 0)
      {
        v16 = *v2;
        if (v16 > ~(unint64_t)asciiNibbleToByte)
          goto LABEL_51;
        v17 = &asciiNibbleToByte[v16];
        v18 = v17 < byte_222C650A2 && v17 >= asciiNibbleToByte;
        if (!v18)
          goto LABEL_50;
        if (v2 == (unsigned __int8 *)-1)
          goto LABEL_51;
        if (v2 + 1 > v5 || v2 > v2 + 1)
          goto LABEL_50;
        v15 = *v17;
        ++v2;
      }
      else
      {
        v15 = 0;
      }
      if (v2 >= v5)
        return 327703;
      v19 = &asciiNibbleToByte[*v2];
      if (v19 >= byte_222C650A2 || v19 < asciiNibbleToByte)
        goto LABEL_50;
      v21 = v2 + 1;
      if (v2 + 1 > v5 || v2 > v21)
        goto LABEL_50;
      if (v15 > 0xF)
        return 327703;
      v22 = *v19;
      if (v22 > 0xF)
        return 327703;
      v23 = (unint64_t)(v22 | (16 * v15)) << (v14 & 0xF8);
      v18 = __CFADD__(v10, v23);
      v10 += v23;
      if (v18)
        goto LABEL_52;
      if (v21 < v5)
      {
        v14 -= 8;
        v12 = 1;
        v2 = v21;
        if (v13-- > 1)
          continue;
      }
      goto LABEL_46;
    }
  }
  return result;
}

uint64_t CTEvaluateCertsForPolicy(unint64_t a1, uint64_t a2, char a3, int a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8, _QWORD *a9, _QWORD *a10, __int128 *a11)
{
  uint64_t result;
  uint64_t v20;
  uint64_t *v21;
  _BYTE *v22;
  BOOL v23;
  __int128 v24;
  char v25;
  uint64_t v26;
  _UNKNOWN **v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __int128 v31;
  _BYTE v32[32];
  uint64_t v33;
  _QWORD v34[2];
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38[4];
  _BYTE v39[272];
  uint64_t v40;
  _QWORD v41[117];

  v41[116] = *MEMORY[0x24BDAC8D0];
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_42;
  v36 = a1 + a2;
  v37 = 0xAAAAAAAAAAAAAAAALL;
  v35 = a1;
  result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4, &v38[2], &v37);
  if ((_DWORD)result)
    return result;
  if (v35 != v36)
    return 327690;
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    v20 = v38[0];
    v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0])
      v21 = &v38[1];
    *v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7)
      v23 = a8 == 0;
    else
      v23 = 1;
    *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    v31 = *a11;
    v32[0] = *((_BYTE *)a11 + 16);
    if (v23)
      v25 = a3;
    else
      v25 = 1;
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(__int128 *)((char *)a11 + 24);
      v27 = (_UNKNOWN **)*((_QWORD *)a11 + 5);
    }
    else
    {
      v26 = *((_QWORD *)a11 + 4);
      *(_QWORD *)&v32[8] = v34;
      *(_QWORD *)&v32[16] = v26;
      v27 = oidForPubKeyLength();
    }
    v28 = *((_QWORD *)a11 + 6);
    *(_QWORD *)&v32[24] = v27;
    v33 = v28;
    result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0);
    if (!(_DWORD)result)
    {
      v29 = (_QWORD *)v38[0];
      if (!a5 || !a6 || !v38[0] || (result = X509CertificateParseKey(v38[0], a5, a6), !(_DWORD)result))
      {
        if (a10 && v29)
        {
          v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }
        result = 0;
        if (a9)
        {
          if (v29)
          {
            result = 0;
            *a9 = v29[30];
          }
        }
      }
    }
    return result;
  }
  if (v39[265])
  {
    if (v38[2])
    {
      v22 = (_BYTE *)v38[2];
      while (v22[265])
      {
        v22 = (_BYTE *)*((_QWORD *)v22 + 34);
        if (!v22)
        {
          v22 = (_BYTE *)v38[2];
          break;
        }
      }
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = v39;
  }
  result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!(_DWORD)result)
    goto LABEL_20;
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, _QWORD *a4, _QWORD *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0, 0, 0, 0, X509PolicySatori);
}

uint64_t CTEvaluateBAASystem(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, X509PolicyBAASystem);
}

unint64_t CTEvaluateBAASystemWithId(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9 = 0;
  v7 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, &v7, &v8, X509PolicyBAASystem);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v7, v8, v9, a5);
  return result;
}

unint64_t CTFillBAAIdentity(int a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result;

  if ((a1 & 0x800000) != 0 && a4)
  {
    result = CTCopyDeviceIdentifiers(a2, a3, a4);
    if ((_DWORD)result)
      return result;
  }
  else if (!a4)
  {
    return 0;
  }
  result = 0;
  if (a1 < 0 && a3)
  {
    if (a2)
    {
      *(_QWORD *)(a4 + 32) = 0;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      result = 0;
      *(_QWORD *)(a4 + 24) = a2;
      *(_QWORD *)(a4 + 32) = a3;
      return result;
    }
    return 0;
  }
  return result;
}

unint64_t CTEvaluateBAASystemTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAASystem);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

unint64_t CTEvaluateBAAUser(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9 = 0;
  v7 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, &v7, &v8, X509PolicyBAAUser);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v7, v8, v9, a5);
  return result;
}

unint64_t CTEvaluateBAAUserTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAAUser);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

unint64_t CTEvaluateBAASepApp(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAASepApp);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

uint64_t CTEvaluateBAA(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9, uint64_t a10)
{
  uint64_t result;

  switch(a1)
  {
    case 1:
      result = CTEvaluateBAASystemTestRoot(a2, a3, a4, a5, a6, a7, a10);
      break;
    case 2:
      result = CTEvaluateBAAUserTestRoot(a2, a3, a4, a5, a6, a7, a10);
      break;
    case 3:
      result = CTEvaluateBAAAccessory(a2, a3, a4, a5, a6, a7, a8, a9);
      break;
    case 4:
      result = CTEvaluateBAASepApp(a2, a3, a4, a5, a6, a7, a10);
      break;
    default:
      result = 327712;
      break;
  }
  return result;
}

uint64_t CTEvaluateBAAAccessory(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a5, a6, a3, a4, 0, &v12, X509PolicyMFi4Attestation);
  if (!(_DWORD)result && a7)
  {
    if (a8)
    {
      v11 = v13;
      *a7 = v12;
      *a8 = v11;
    }
  }
  return result;
}

uint64_t CTGetBAARootType(unint64_t a1, uint64_t a2)
{
  unint64_t v3[2];
  _OWORD v4[19];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_14:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_14;
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3))
    return 0;
  if (!compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BASystemRootSPKI))
    return 1;
  if (!compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BAUserRootSPKI))
    return 2;
  if (compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&MFi4RootSpki))
    return 4 * (compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BASepAppRootSPKI) == 0);
  return 3;
}

uint64_t CTGetBAASubCAType(unint64_t a1, uint64_t a2)
{
  unint64_t v3[2];
  _OWORD v4[19];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_14:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_14;
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3))
    return 0;
  if (!compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BASystemRootSKID))
    return 1;
  if (!compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BAUserRootSKID))
    return 2;
  if (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&MFi4RootSKID))
    return 4 * (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BASepAppRootSKID) == 0);
  return 3;
}

uint64_t CTEvaluateDAK(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t v7;
  uint64_t result;
  __int128 v12;
  unint64_t v13;
  _BYTE *v14;
  int v15;
  unint64_t v16[2];
  uint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[2];
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _OWORD v27[19];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a1 + a2;
  if (a1 + a2 < a1)
    goto LABEL_31;
  result = CTEvaluateBAAUserTestRoot(a1, a2, a3, a4, a5, a6, a7);
  if ((_DWORD)result)
    return result;
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[17] = v12;
  v27[18] = v12;
  v27[15] = v12;
  v27[16] = v12;
  v27[13] = v12;
  v27[14] = v12;
  v27[11] = v12;
  v27[12] = v12;
  v27[9] = v12;
  v27[10] = v12;
  v27[7] = v12;
  v27[8] = v12;
  v27[5] = v12;
  v27[6] = v12;
  v27[3] = v12;
  v27[4] = v12;
  v27[1] = v12;
  v27[2] = v12;
  v27[0] = v12;
  v18[0] = 0xAAAAAAAAAAAAAAAALL;
  v18[1] = 0xAAAAAAAAAAAAAAAALL;
  v17 = 0;
  if (__CFADD__(a1, a2))
    goto LABEL_32;
  v16[0] = a1;
  v16[1] = v7;
  result = (uint64_t)X509ChainParseCertificateSet(v16, (unint64_t)v27, 1, v18, &v17);
  if (!(_DWORD)result)
  {
    if (!v18[0])
      return 327691;
    v25 = 0;
    v26 = 0;
    result = CTParseExtensionValue(*(_QWORD *)v18[0], *(_QWORD *)(v18[0] + 8), &CTOidAppleFDRIdentity, 9uLL, &v25, &v26);
    if (!(_DWORD)result)
    {
      v23 = 0xAAAAAAAAAAAAAAAALL;
      v24 = 0xAAAAAAAAAAAAAAAALL;
      if (!__CFADD__(v25, v26))
      {
        if (v25 > v25 + v26)
          goto LABEL_31;
        v23 = v25;
        v24 = v25 + v26;
        v22 = v26;
        result = ccder_blob_decode_tl();
        if (!(_DWORD)result)
          return 720929;
        if (v24 < v23)
          goto LABEL_31;
        v13 = v22;
        if (v22 > v24 - v23)
          goto LABEL_31;
        v25 = v23;
        v26 = v22;
        if (!__CFADD__(v23, v22))
        {
          v14 = (_BYTE *)v23;
          if (v23 < v23 + v22)
          {
            do
            {
              if ((unint64_t)v14 < v23)
                goto LABEL_31;
              if (*v14 == 45)
                goto LABEL_19;
              ++v14;
              --v13;
            }
            while (v13);
            v14 = (_BYTE *)(v23 + v22);
          }
LABEL_19:
          if (v14 != (_BYTE *)-1)
          {
            if ((unint64_t)(v14 + 1) >= v23 + v22)
              return 327711;
            if (v23 <= (unint64_t)(v14 + 1))
            {
              v21[0] = v14 + 1;
              v21[1] = v23 + v22;
              v19 = 0;
              v20 = 0;
              v15 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v21, &v20);
              result = 327697;
              if (!v15 && !HIDWORD(v20))
              {
                if (CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v21, &v19))
                {
                  return 327698;
                }
                else
                {
                  result = 0;
                  if (a7)
                  {
                    *(_DWORD *)a7 = v20;
                    *(_QWORD *)(a7 + 8) = v19;
                  }
                }
              }
              return result;
            }
LABEL_31:
            __break(0x5519u);
          }
        }
      }
LABEL_32:
      __break(0x5513u);
    }
  }
  return result;
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0, 0, 0, 0, X509PolicyACRT);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, X509PolicyUcrt);
}

uint64_t CTEvaluateUcrtTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0, 0, X509PolicyUcrt);
}

uint64_t CTParseFlagsForAccessoryCerts(uint64_t result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;

  v1 = result;
  if (!result || (result = *(_QWORD *)(result + 240)) == 0)
  {
    v3 = v1 + 136;
    v2 = *(unsigned __int8 **)(v1 + 136);
    if (*(_QWORD *)(v3 + 8) != 15 || v2 == 0)
      return 0;
    if ((unint64_t)v2 < 0xFFFFFFFFFFFFFFFELL)
    {
      if (v2[2] != 170)
        return 0;
      if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF9)
      {
        if (v2[6] != 170)
          return 0;
        if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF7)
        {
          if (v2[8] == 170)
          {
            if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF4)
            {
              if (v2[11] == 170)
                return 0x8000000;
              return 0;
            }
            goto LABEL_17;
          }
          return 0;
        }
      }
    }
LABEL_17:
    __break(0x5513u);
  }
  return result;
}

uint64_t CTParseAccessoryCerts(char *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, char **a5, unint64_t *a6, uint64_t *a7)
{
  char *v14;
  uint64_t result;
  _BYTE *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  BOOL v34;
  uint64_t v35;
  unint64_t v36[4];
  unint64_t v37;
  unint64_t v38[2];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _BYTE v46[1216];
  _QWORD v47[2];

  v47[0] = *MEMORY[0x24BDAC8D0];
  bzero(v46, 0x4C0uLL);
  v45 = 0;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38[0] = 4;
  v38[1] = (unint64_t)v46;
  v14 = &a1[a2];
  v37 = 0;
  result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v38, 1);
  if ((_DWORD)result)
  {
    memset(v36, 170, sizeof(v36));
    if (__CFADD__(a1, a2))
      goto LABEL_65;
    v36[0] = (unint64_t)a1;
    v36[1] = (unint64_t)&a1[a2];
    result = (uint64_t)X509ChainParseCertificateSet(v36, (unint64_t)v46, 4, &v36[2], &v37);
    if ((_DWORD)result)
      return result;
    if (v36[0] != v36[1])
      return 327690;
  }
  else
  {
    v37 = v39;
  }
  if (!v46[265])
  {
    if (v37 < 2)
    {
      v20 = 0;
      v17 = 0;
      v16 = v46;
      goto LABEL_19;
    }
    v18 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_67:
      __break(0x5515u);
      return result;
    }
    v17 = 0;
    v16 = v46;
    v20 = 1;
    v19 = 1;
    goto LABEL_20;
  }
  v16 = v46;
  if (!v37)
  {
    v20 = 0;
    v17 = 0;
    goto LABEL_19;
  }
  if (v37 > 5)
  {
LABEL_66:
    __break(0x5512u);
    goto LABEL_67;
  }
  v17 = 304 * v37 - 304;
  if (__CFADD__(v46, v17))
  {
LABEL_65:
    __break(0x5513u);
    goto LABEL_66;
  }
  v16 = &v46[v17];
  v18 = v37 - 2;
  if (v37 < 2)
  {
    v20 = 0;
LABEL_19:
    v18 = -1;
    v19 = -1;
    goto LABEL_20;
  }
  v19 = 0;
  v20 = 1;
LABEL_20:
  if (a5 && a6)
  {
    v21 = v20 ^ 1;
    if (v18 < 0)
      v21 = 1;
    if ((v21 & 1) != 0)
    {
      v27 = 0;
      v26 = 0;
LABEL_47:
      *a5 = v27;
      *a6 = v26;
      goto LABEL_48;
    }
    v22 = (unint64_t *)&v46[304 * (int)v19];
    if (v22 >= v47 || v22 < (unint64_t *)v46)
      goto LABEL_63;
    v23 = 304 * (int)v19;
    if (v23 > 0x4BF)
      goto LABEL_64;
    v24 = v23 | 8;
    if ((v23 | 8) > 0x4C0)
      goto LABEL_64;
    v25 = *v22;
    if (v19 <= v18)
    {
      v26 = 0;
      while (1)
      {
        if (&v46[v24 - 8] >= (_BYTE *)v47 || &v46[v24 - 8] < v46)
          goto LABEL_63;
        if (v24 > 0x4C0)
          goto LABEL_64;
        v29 = *(_QWORD *)&v46[v24];
        v30 = __CFADD__(v26, v29);
        v26 += v29;
        if (v30)
          break;
        v31 = v19 + 1;
        if (__OFADD__(v19, 1))
          break;
        v24 += 304;
        ++v19;
        if (v31 > v18)
          goto LABEL_41;
      }
      __break(0x5500u);
      goto LABEL_63;
    }
    v26 = 0;
LABEL_41:
    v32 = v25 - (_QWORD)a1;
    v33 = v25 >= (unint64_t)a1;
    v34 = v25 < (unint64_t)a1;
    if (v32 < 0)
      v33 = v34;
    if (v33)
    {
      v27 = &a1[v32];
      if (v14 < v27 || v27 < a1 || v26 > v14 - v27)
        goto LABEL_63;
      goto LABEL_47;
    }
    goto LABEL_65;
  }
LABEL_48:
  if (a7 && v16)
  {
    if (v16 >= (_BYTE *)v47 || v16 < v46)
      goto LABEL_63;
    *a7 = CTParseFlagsForAccessoryCerts((uint64_t)v16);
  }
  result = 0;
  if (a3 && a4 && v16)
  {
    if (v46 <= v16 && v16 + 304 <= (_BYTE *)v47)
    {
      if (v17 <= 0x4BF && (v17 | 8) <= 0x4C0)
      {
        result = 0;
        v35 = *((_QWORD *)v16 + 1);
        *a3 = *(_QWORD *)v16;
        *a4 = v35;
        return result;
      }
LABEL_64:
      __break(1u);
    }
LABEL_63:
    __break(0x5519u);
    goto LABEL_64;
  }
  return result;
}

uint64_t CTEvaluateAccessoryCert(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8, _QWORD *a9, _QWORD *a10, _QWORD *a11)
{
  uint64_t result;
  uint64_t v20;
  uint64_t **v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL v25;
  unint64_t v26;
  char v27;
  char v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  __int16 v34;
  char v35;
  char v36;
  int v37;
  unint64_t *v38;
  unint64_t *v39;
  unint64_t *v40;
  uint64_t v41;
  unint64_t v42[2];
  unint64_t v43[4];
  unint64_t v44;
  unint64_t v45;
  unint64_t v46[4];
  unint64_t *v47;
  uint64_t *v48;
  _BYTE v49[272];
  uint64_t v50;
  unint64_t v51[34];
  _QWORD v52[4];
  unint64_t v53[11];
  unint64_t v54[19];
  uint64_t v55;
  _QWORD v56[44];

  v56[42] = *MEMORY[0x24BDAC8D0];
  bzero(v51, 0x390uLL);
  v47 = 0;
  v48 = 0;
  memset(v46, 170, sizeof(v46));
  if (__CFADD__(a1, a2))
    goto LABEL_56;
  if (a1 + a2 < a1)
    goto LABEL_57;
  v46[0] = a1;
  v46[1] = a1 + a2;
  result = X509CertificateParse(v51, v46);
  if ((_DWORD)result)
    return result;
  v20 = (uint64_t)v47;
  v21 = &v48;
  if (v47)
    v21 = (uint64_t **)(v47 + 35);
  *v21 = v52;
  v47 = v51;
  v52[0] = v20;
  v52[1] = &v47;
  v44 = 0xAAAAAAAAAAAAAAAALL;
  v45 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a5, a6))
    goto LABEL_56;
  if (a5 + a6 < a5)
    goto LABEL_57;
  v44 = a5;
  v45 = a5 + a6;
  if ((unint64_t *)((char *)v53 + 1) != 0 && (unint64_t)v51 >= 0xFFFFFFFFFFFFFECFLL)
    goto LABEL_56;
  result = X509CertificateParse(v53, &v44);
  if ((_DWORD)result)
    return result;
  v56[0] = 0;
  v56[1] = v48;
  *v48 = (uint64_t)v53;
  v48 = v56;
  bzero(v49, 0x390uLL);
  if (!a3 || !a4)
  {
LABEL_22:
    result = X509ChainBuildPath(v51, (uint64_t *)&v47, &v46[2]);
    if ((_DWORD)result)
      return result;
    v26 = 0;
    v27 = 0;
    v28 = 28;
    result = 327700;
    if (a7 <= 0x1FFFFFFF)
    {
      if (a7 <= 0x7FFFFFF)
      {
        if (a7)
        {
          v29 = 0;
          if (a7 != 4)
            return result;
        }
        else
        {
          v27 = 0;
          v26 = 0;
          v29 = 1;
        }
        goto LABEL_44;
      }
      if (a7 == 0x8000000)
      {
        v26 = 0;
        v29 = 0;
        v28 = 29;
        v27 = 1;
        goto LABEL_44;
      }
      if (a7 != 0x10000000)
        return result;
    }
    else
    {
      if (a7 > 0x3FFFFFFFFLL)
      {
        if (a7 == 0x400000000 || a7 == 0x800000000)
        {
          v29 = 0;
        }
        else
        {
          v29 = 0;
          if (a7 != 0x1000000000)
            return result;
        }
        goto LABEL_44;
      }
      if (a7 != 0x20000000)
      {
        if (a7 != 0x40000000)
          return result;
        v27 = 0;
        v29 = 0;
        v26 = 3;
        goto LABEL_44;
      }
      v27 = 1;
    }
    v29 = v27;
    v26 = 2;
    v27 = 0;
LABEL_44:
    if (!v55)
      v55 = a7;
    memset(v43, 170, sizeof(v43));
    v42[0] = 0xAAAAAAAAAAAAAAAALL;
    v42[1] = 0xAAAAAAAAAAAAAAAALL;
    X509CertificateParseSPKI(v54, &v43[2], v42, v43);
    v32 = v26;
    v33 = a7;
    v37 = -1431655766;
    v38 = v43;
    v34 = 0;
    v35 = v29;
    v36 = v27;
    v39 = &v43[2];
    v40 = v42;
    v41 = 0;
    result = X509ChainCheckPath(v28, (uint64_t *)&v46[2], (uint64_t)&v32);
    if (!(_DWORD)result)
    {
      v30 = v46[2];
      if (!a8 || !a9 || !v46[2] || (result = X509CertificateParseKey(v46[2], a8, a9), !(_DWORD)result))
      {
        result = 0;
        if (a10 && a11)
        {
          if (v30)
          {
            result = 0;
            v31 = *(_QWORD *)(v30 + 256);
            *a10 = *(_QWORD *)(v30 + 248);
            *a11 = v31;
          }
        }
      }
    }
    return result;
  }
  if (__CFADD__(a3, a4))
  {
LABEL_56:
    __break(0x5513u);
LABEL_57:
    __break(0x5519u);
  }
  if (a3 + a4 < a3)
    goto LABEL_57;
  v32 = a3;
  v33 = a3 + a4;
  if (a3 + a4 <= a3)
    goto LABEL_22;
  v22 = 0;
  v23 = &v50;
  while (1)
  {
    result = X509CertificateParse((unint64_t *)v23 - 34, &v32);
    if ((_DWORD)result)
      return result;
    v24 = v48;
    *v23 = 0;
    v23[1] = (uint64_t)v24;
    *v24 = (uint64_t)(v23 - 34);
    v48 = v23;
    v25 = v32 >= v33 || v22++ > 1;
    v23 += 38;
    if (v25)
      goto LABEL_22;
  }
}

uint64_t CTEvaluatePragueSignatureCMS(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6, _QWORD *a7)
{
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0xAAAAAAAA0000AA01;
  v8 = xmmword_222C65160;
  BYTE1(v9) = a5;
  v10 = 0u;
  v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6, _QWORD *a7)
{
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0xAAAAAAAA0000AA01;
  v8 = xmmword_222C65170;
  BYTE1(v9) = a5;
  v10 = 0u;
  v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  unsigned __int8 *v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  result = 327700;
  v4 = a1[31];
  v5 = a1[32];
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    return 327707;
  v7 = a1[30];
  if ((v7 & 0x100000000) == 0)
  {
    if ((v7 & 0x200000000) == 0)
      return result;
    if (!__CFADD__(v4, v5))
    {
      v11 = v4 + v5;
      if (v4 + v5 != -1)
      {
        if (v5 > 0x13)
          return 327704;
        v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          v10 = 0;
          v17 = 0;
          while ((unint64_t)v16 < v11)
          {
            v18 = *v16;
            if ((v18 - 58) < 0xFFFFFFF6)
              return 327705;
            if (v17 == 20)
              break;
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14)
              goto LABEL_39;
            v19 = (v18 - 48);
            v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20))
              goto LABEL_40;
            v21 = v19 * v20;
            v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15)
              goto LABEL_38;
            ++v17;
            if ((unint64_t)--v16 < v4)
              goto LABEL_23;
          }
LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }
        goto LABEL_13;
      }
    }
LABEL_41:
    __break(0x5513u);
    return result;
  }
  if (__CFADD__(v4, v5))
    goto LABEL_41;
  v8 = v4 + v5;
  if (v4 + v5 == -1)
    goto LABEL_41;
  v9 = (_BYTE *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    v12 = 0;
    v13 = 0;
    v10 = 0;
    while ((unint64_t)v9 < v8)
    {
      v14 = (unint64_t)(*v9 & 0x7F) << v12;
      v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15)
        goto LABEL_38;
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
        if ((unint64_t)v9 >= v4)
          continue;
      }
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_13:
  v10 = 0;
LABEL_23:
  if (v10 == a2)
    return 0;
  else
    return 589829;
}

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  _QWORD v7[2];
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 327702;
  if (*(_QWORD *)(a1 + 232) && *(_QWORD *)(a1 + 224))
  {
    v7[1] = a3;
    v8 = 0xAAAAAAAAAAAAAA00;
    v7[0] = a2;
    v4 = X509CertificateParseGeneralNamesContent(a1, (uint64_t (*)(_QWORD, int *, uint64_t))CTCompareGeneralNameToHostname, (uint64_t)v7);
    if ((_BYTE)v8)
      v5 = 0;
    else
      v5 = 327706;
    if (v4)
      return v4;
    else
      return v5;
  }
  return v3;
}

uint64_t CTCompareGeneralNameToHostname(uint64_t result, _QWORD *a2, unint64_t a3)
{
  char *v4;
  size_t v5;
  size_t v6;
  char *v7;
  char *v8;
  BOOL v9;
  int v11;
  size_t v12;
  unint64_t v13;
  _BYTE *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  char *v20;
  size_t v22;
  size_t v23;

  if ((_DWORD)result != 2)
    return 1;
  v4 = *(char **)a3;
  v5 = *(_QWORD *)(a3 + 8);
  v6 = ~*(_QWORD *)a3;
  if (v5 > v6)
    goto LABEL_50;
  v7 = &v4[v5];
  if (&v4[v5] == (char *)-1)
    goto LABEL_50;
  v8 = v7 - 1;
  if (v7)
    v9 = v8 >= v4;
  else
    v9 = 0;
  if (!v9 || a3 + 24 < a3)
    goto LABEL_49;
  v11 = *v8;
  result = compare_octet_string((uint64_t)a2, a3);
  if (!(_DWORD)result)
    goto LABEL_48;
  if (v11 != 46)
    goto LABEL_15;
  v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if ((_DWORD)result)
      {
LABEL_15:
        v13 = a2[1];
        if (v13 < 3)
          return 1;
        v14 = (_BYTE *)*a2;
        if (*(_BYTE *)*a2 != 42)
          return 1;
        if (v14 != (_BYTE *)-1)
        {
          v15 = v14 + 1;
          if (v14[1] == 46)
          {
            v16 = -2;
            if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL)
              v16 = (uint64_t)v14;
            v17 = -v16;
            v18 = 2;
            result = 1;
            while (v17 != v18)
            {
              if (&v14[v18] < v14)
                goto LABEL_49;
              if (v14[v18] == 46)
              {
                if (v13 == v18)
                  return 1;
                v19 = 0;
                if (v5)
                {
                  while (1)
                  {
                    v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4)
                      goto LABEL_49;
                    if (*v20 == 46)
                      break;
                    if (v5 == ++v19)
                    {
                      v19 = v5;
                      break;
                    }
                  }
                }
                v22 = v13 - 1;
                v9 = v5 >= v19;
                v23 = v5 - v19;
                if (!v9)
                  goto LABEL_51;
                if (v22 == v23)
                {
                  if (v19 > v6)
                    goto LABEL_50;
                  result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!(_DWORD)result)
                    goto LABEL_48;
                }
                if (v11 != 46)
                  return 1;
                if (!v23)
                  goto LABEL_51;
                if (v22 != v23 - 1)
                  return 1;
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22))
                    goto LABEL_48;
                  return 1;
                }
                goto LABEL_50;
              }
              if (v13 == ++v18)
                return result;
            }
            goto LABEL_50;
          }
          return 1;
        }
LABEL_50:
        __break(0x5513u);
        goto LABEL_51;
      }
LABEL_48:
      result = 0;
      *(_BYTE *)(a3 + 16) = 1;
      return result;
    }
LABEL_49:
    __break(0x5519u);
    goto LABEL_50;
  }
LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t result;
  __int128 v13;
  unint64_t v14[2];
  _QWORD v15[3];
  _OWORD v16[19];
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  unint64_t v20;
  __int128 *v21;
  __int128 *v22;
  __int128 *v23;
  _UNKNOWN **v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0xAAAAAAAA00AAAA01;
  v21 = &null_octet;
  v19 = xmmword_222C65180;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  v22 = &null_octet;
  v23 = &null_octet;
  v24 = &CTOctetServerAuthEKU;
  v17 = 0;
  v18 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0, 0, 0, 0, &v19);
  if (!(_DWORD)result)
  {
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    v16[8] = v13;
    v16[6] = v13;
    v16[4] = v13;
    v16[5] = v13;
    v16[2] = v13;
    v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }
    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1, &v15[1], v15);
      if (!(_DWORD)result)
      {
        result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!(_DWORD)result)
          return CTVerifyHostname((uint64_t)v16, a3, a4);
      }
    }
  }
  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CTCopyUID(uint64_t result, _BYTE *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  _BYTE *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v14;
  unsigned int v15;
  unsigned int v16;

  v5 = *(_QWORD *)result;
  v4 = *(_QWORD *)(result + 8);
  if (__CFADD__(*(_QWORD *)result, v4))
    goto LABEL_31;
  v6 = v5 + v4;
  v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      v3 = *v7;
      if (v3 != 45 && (unint64_t)++v7 < v6)
        continue;
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_6:
  if (v7 == (unsigned __int8 *)-1)
    goto LABEL_31;
  v8 = v7 + 1;
  v3 = 327693;
  result = 327693;
  if ((unint64_t)(v7 + 1) >= v6)
    return result;
  if (a3 < 0 || v5 > (unint64_t)v8)
  {
LABEL_34:
    __break(0x5519u);
    return result;
  }
  if (__CFADD__(v8, v6 - (_QWORD)v8))
    goto LABEL_31;
  if (v6 - (_QWORD)v8 != 2 * a3)
    return (v3 + 1);
  if (__CFADD__(a2, a3) || v7 == (unsigned __int8 *)-2)
  {
LABEL_31:
    __break(0x5513u);
    return (v3 + 1);
  }
  v9 = v7 + 2;
  v10 = a2;
  while (1)
  {
    result = 0;
    if ((unint64_t)v9 >= v6 || v10 >= &a2[a3])
      return result;
    v11 = v9 - 1;
    if ((unint64_t)(v9 - 1) >= v6 || v11 < v8)
      goto LABEL_34;
    v12 = &asciiNibbleToByte[*v11];
    result = (uint64_t)byte_222C650A2;
    if (v12 >= byte_222C650A2 || v12 < asciiNibbleToByte)
      goto LABEL_34;
    if (v11 < v7)
      goto LABEL_34;
    v14 = &asciiNibbleToByte[*v9];
    result = (uint64_t)byte_222C650A2;
    if (v14 >= byte_222C650A2 || v14 < asciiNibbleToByte)
      goto LABEL_34;
    v15 = *v12;
    result = 327695;
    if (v15 > 0xF)
      return result;
    v16 = *v14;
    if (v16 > 0xF)
      return result;
    if (v10 < a2)
      goto LABEL_34;
    *v10++ = v16 | (16 * v15);
    v9 += 2;
    if (!v9)
      goto LABEL_31;
  }
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  BOOL v39;
  int v40;
  int v41;
  unint64_t v43;
  unint64_t v51;
  unint64_t v52;
  unsigned __int8 v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  _OWORD v70[10];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v68 = 0;
  v69 = 0;
  v66 = 0xAAAAAAAAAAAAAAAALL;
  v67 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a2;
  v5 = a2[1];
  if (*a2 > v5)
    goto LABEL_186;
  v10 = 720915;
  v66 = *a2;
  v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return v10;
  v12 = v69;
  v13 = v66;
  v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4))
    goto LABEL_188;
  if (v14 > v5 - v4)
    goto LABEL_186;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v14;
  v64 = 0xAAAAAAAAAAAAAAAALL;
  v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12))
    goto LABEL_187;
  v15 = v13 + v12;
  if (v13 > v15 || v15 > v67)
    goto LABEL_186;
  v64 = v13;
  v65 = v15;
  v62 = v13;
  v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68))
      goto LABEL_187;
    v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63)
        goto LABEL_186;
      v64 = v62 + v68;
      v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl())
    return 720917;
  v18 = v64;
  v17 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v19 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 136) = v64;
  *(_QWORD *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19))
    goto LABEL_187;
  v20 = v18 + v19;
  if (v18 > v20 || v20 > v17)
    goto LABEL_186;
  v64 = v20;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 152)))
    return 720918;
  if (!ccder_blob_decode_tl())
    return 720919;
  v22 = v64;
  v21 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v23 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 120) = v64;
  *(_QWORD *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23))
    goto LABEL_187;
  v24 = v22 + v23;
  if (v22 > v24 || v24 > v21)
    goto LABEL_186;
  v64 = v24;
  if (!ccder_blob_decode_tl())
    return 720920;
  v26 = v64;
  v25 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v27 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 72) = v64;
  *(_QWORD *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27))
    goto LABEL_187;
  v28 = v26 + v27;
  if (v26 > v28 || v28 > v25)
    goto LABEL_186;
  v64 = v28;
  if (!ccder_blob_decode_tl())
    return 720921;
  v29 = v64;
  v30 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v31 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 104) = v64;
  *(_QWORD *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31))
    goto LABEL_187;
  v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30)
    goto LABEL_186;
  v64 = v29 + v31;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return 720922;
  v33 = v64;
  v34 = v68;
  v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32)
      goto LABEL_186;
    *(_QWORD *)(a1 + 88) = v32;
    *(_QWORD *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34))
      goto LABEL_187;
    v36 = v33 + v34;
    if (v33 > v36 || v36 > v65)
      goto LABEL_186;
    v63 = v65;
    v64 = v36;
    v62 = v36;
    if ((ccder_blob_decode_tl() & 1) != 0)
      return 720923;
    if (v64 > v65)
      goto LABEL_186;
    v62 = v64;
    v63 = v65;
    if ((ccder_blob_decode_tl() & 1) != 0)
      return 720924;
    if (v64 > v65)
      goto LABEL_186;
    v62 = v64;
    v63 = v65;
    if (ccder_blob_decode_tl())
    {
      v60 = 0xAAAAAAAAAAAAAAAALL;
      v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68))
        goto LABEL_187;
      if (v62 > v62 + v68 || v62 + v68 > v63)
        goto LABEL_186;
      v60 = v62;
      v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68)
        return 720925;
      v37 = v60;
      if (__CFADD__(v60, v68))
LABEL_187:
        __break(0x5513u);
      v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61)
        goto LABEL_186;
      v61 = v60 + v68;
      *(_BYTE *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3)
        v39 = a4 == 0;
      else
        v39 = 1;
      v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        v53 = 0;
        v41 = 0;
        do
        {
          v58 = 0xAAAAAAAAAAAAAAAALL;
          v59 = 0xAAAAAAAAAAAAAAAALL;
          v57 = 0;
          v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0)
            return 720926;
          v54 = 0xAAAAAAAAAAAAAAAALL;
          v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56))
            goto LABEL_187;
          if (v60 > v60 + v56 || v60 + v56 > v61)
            goto LABEL_186;
          v54 = v60;
          v55 = v60 + v56;
          if (!ccder_blob_decode_tl())
            return 720927;
          if (v55 < v54 || v68 > v55 - v54)
            goto LABEL_186;
          v58 = v54;
          v59 = v68;
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v54 > v54 + v68 || v54 + v68 > v55)
            goto LABEL_186;
          v54 += v68;
          if (!der_get_BOOLean(&v54, 1, &v57))
            return 720928;
          if (!ccder_blob_decode_tl())
            return 720929;
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v55 != v54 + v68)
            return 720929;
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54)
              goto LABEL_186;
            v43 = v68;
            if (v68 > v55 - v54)
              goto LABEL_186;
            *(_QWORD *)(a1 + 248) = v54;
            *(_QWORD *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 15)
            {
              v16 = 720930;
              if ((v41 & 1) != 0 || (X509ExtensionParseKeyUsage() & 1) == 0)
                return v16;
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 19)
            {
              v16 = 720931;
              if ((v41 & 2) != 0
                || (X509ExtensionParseBasicConstraints(&v54, (_QWORD *)(a1 + 200), (_BYTE *)(a1 + 265)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 35)
            {
              v16 = 720932;
              if ((v41 & 4) != 0
                || (X509ExtensionParseAuthorityKeyIdentifier(&v54, (unint64_t *)(a1 + 168), (_QWORD *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 14)
            {
              v16 = 720933;
              if ((v41 & 8) != 0
                || (X509ExtensionParseSubjectKeyIdentifier(&v54, (unint64_t *)(a1 + 184), (_QWORD *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 37)
            {
              v16 = 720934;
              if ((v41 & 0x10) != 0
                || (X509ExtensionParseExtendedKeyUsage(&v54, (unint64_t *)(a1 + 208), (_QWORD *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 17)
            {
              v16 = 720935;
              if ((v41 & 0x20) != 0
                || (X509ExtensionParseSubjectAltName(&v54, (unint64_t *)(a1 + 224), (_QWORD *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            v16 = 720936;
            if (!X509CertificateVerifyOnlyOneAppleExtension((uint64_t)&v58, (uint64_t)v70, v53))
              return v16;
            result = X509ExtensionParseAppleExtension((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!(_DWORD)result)
              return v16;
            if (v53 == 0xFF)
              goto LABEL_189;
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v54 > v54 + v68 || v54 + v68 > v55)
            goto LABEL_186;
          v54 += v68;
          if (v57)
            *(_BYTE *)(a1 + 266) = 1;
LABEL_155:
          if (v54 != v55)
            return 720926;
          if (__CFADD__(v60, v56))
            goto LABEL_187;
          v37 = v60 + v56;
          if (v60 > v60 + v56)
            goto LABEL_186;
          v38 = v61;
          if (v37 > v61)
            goto LABEL_186;
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38)
        return 720925;
      if (v37 > v65 || v64 > v37)
        goto LABEL_186;
      v64 = v37;
    }
    if (*(_QWORD *)(a1 + 32) < 3uLL)
    {
      v16 = 720915;
      if (v64 != v65)
        return v16;
LABEL_170:
      if (__CFADD__(v66, v69))
        goto LABEL_187;
      if (v66 > v66 + v69 || v66 + v69 > v67)
        goto LABEL_186;
      v66 += v69;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 40)))
        return 720937;
      *(_QWORD *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      v60 = 0;
      result = ccder_blob_decode_bitstring();
      if (!(_DWORD)result)
        return 720938;
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((_QWORD *)&v70[0] + 1) >= *(_QWORD *)&v70[0])
        {
          v51 = (v60 + 7) >> 3;
          if (v51 <= *((_QWORD *)&v70[0] + 1) - *(_QWORD *)&v70[0])
          {
            *(_QWORD *)(a1 + 56) = *(_QWORD *)&v70[0];
            *(_QWORD *)(a1 + 64) = v51;
            v52 = v67;
            if (v66 <= v67)
            {
              v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t der_get_BOOLean(_QWORD *a1, int a2, _BYTE *a3)
{
  if (*a1 > a1[1])
    __break(0x5519u);
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2)
    return 0;
  if (a3)
    *a3 = 0;
  return 1;
}

uint64_t X509ExtensionParseKeyUsage()
{
  uint64_t result;

  result = ccder_blob_decode_bitstring();
  if ((_DWORD)result)
    return 0;
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(_QWORD *a1, _QWORD *a2, _BYTE *a3)
{
  uint64_t result;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    result = der_get_BOOLean(a1, 1, a3);
    if ((_DWORD)result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3)
          return 0;
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
      goto LABEL_15;
    if (v7 - 0x5555555555555556 != a1[1])
      return 0;
    if (v7 > v7 - 0x5555555555555556)
      goto LABEL_16;
    v10 = *a1;
    v11 = v7 - 0x5555555555555556;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
        goto LABEL_16;
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseSubjectKeyIdentifier(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = a1[1];
    v8 = v7 >= *a1;
    v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1])
LABEL_13:
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v6 = ccder_blob_decode_tl();
  result = 0;
  if (v6)
  {
    if (*a1 > a1[1])
      goto LABEL_11;
    v10 = *a1;
    v11 = a1[1];
    result = ccder_blob_decode_tl();
    if (!(_DWORD)result)
      return result;
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_11;
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1])
LABEL_11:
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result == 1)
  {
    v7 = a1[1];
    v8 = v7 >= *a1;
    v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1])
LABEL_13:
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  _QWORD *v5;
  unsigned __int8 v6;
  unint64_t v7;
  uint64_t v9;
  _QWORD *v10;

  if (a3 > 9)
    return 0;
  v5 = (_QWORD *)result;
  v6 = 0;
  v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!(_DWORD)result)
      return result;
    if (a3 <= v6++)
    {
      v9 = v5[1];
      v10 = (_QWORD *)(a2 + 16 * a3);
      *v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t X509ExtensionParseAppleExtension(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v24;
  int v44;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (a6)
    a5 = 0;
  if (a3 == 11)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10301066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x200;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10601066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x800;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11801066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x12401066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x21901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x8000;
      goto LABEL_261;
    }
LABEL_157:
    v44 = 0;
LABEL_158:
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27)
      return X509ExtensionParseServerAuthMarker(result, a2, a3, a4, a5);
    if (!v44)
      goto LABEL_232;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 37748736;
    }
    else
    {
      if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_WORD *)(a2 + 8) != 4354)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
          return (uint64_t)X509ExtensionParseMFI4Properties((unint64_t *)result, a4, a5);
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
        {
          v52 = *(_QWORD *)result;
          v51 = *(_QWORD *)(result + 8);
          if (a5)
          {
            if (v52 > v51)
              goto LABEL_265;
            *a5 = v52;
            a5[1] = v51 - v52;
          }
          *a4 |= 0x80000000uLL;
LABEL_233:
          if (v52 <= v51)
          {
            *(_QWORD *)result = v51;
            return 1;
          }
LABEL_265:
          __break(0x5519u);
          return result;
        }
        goto LABEL_232;
      }
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x8004000000;
    }
LABEL_201:
    v24 = v54 | v55;
    goto LABEL_261;
  }
  if (a3 == 10)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x58600003F0D0;
      goto LABEL_201;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538)
      goto LABEL_203;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0xF00;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x40;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x1000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
      return X509ExtensionParseMFISWAuth((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x300000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
      return X509ExtensionParseGenericSSLMarker();
    v44 = 1;
    goto LABEL_158;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA)
      goto LABEL_232;
    goto LABEL_157;
  }
  if (*(_QWORD *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1)
    return X509ExtensionParseComponentAuth((unint64_t *)result, a4, a5);
  if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44)
      return X509ExtensionParseCertifiedChipIntermediate((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36)
      return X509ExtensionParseMFIAuthv3Leaf((unint64_t *)result);
    if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(_QWORD *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        result = ccder_blob_check_null();
        if (!(_DWORD)result)
          return result;
        v24 = *a4 | 0x8000000000;
        goto LABEL_261;
      }
      if (*(_QWORD *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          result = ccder_blob_check_null();
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x2000000;
        }
        else
        {
          if (*(_QWORD *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(_QWORD *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3)
              return X509ExtensionParseDeviceAttestationIdentity((unint64_t *)result, a4, a5);
            goto LABEL_232;
          }
          result = ccder_blob_check_null();
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x4000000;
        }
LABEL_261:
        *a4 = v24;
        return 1;
      }
      *a4 |= 0x1000000uLL;
LABEL_232:
      v52 = *(_QWORD *)result;
      v51 = *(_QWORD *)(result + 8);
      goto LABEL_233;
    }
    result = ccder_blob_check_null();
    if (!(_DWORD)result)
      return result;
    v54 = *a4;
    v55 = 1048584;
    goto LABEL_201;
  }
  v56 = 0;
  result = der_get_BOOLean((_QWORD *)result, 0, &v56);
  if ((_DWORD)result)
  {
    v53 = 0x10000080002;
    if (!v56)
      v53 = 0x20000040001;
    *a4 |= v53;
  }
  return result;
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;

  v8 = 720939;
  v9 = *a2;
  v10 = a2[1];
  if (!ccder_blob_decode_tl())
    return v8;
  v11 = *a2;
  result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  v8 = result;
  if ((_DWORD)result)
    return v8;
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556)
    return v8;
  v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556)
    goto LABEL_11;
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, unint64_t *a2, unint64_t *a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v4 = *a1;
  v5 = a1[1];
  if (__CFADD__(*a1, v5))
    goto LABEL_31;
  v6 = v4 + v5;
  if (v4 > v6)
    goto LABEL_30;
  v10 = 655361;
  v14 = *a1;
  v15 = v6;
  if (!ccder_blob_decode_tl())
    return v10;
  if (!ccder_blob_decode_tl())
    return 655363;
  if (v14 >= 0x5555555555555556)
LABEL_31:
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556 || v14 - 0x5555555555555556 > v15)
    goto LABEL_30;
  v13 = v14 - 0x5555555555555556;
  if (!ccder_blob_decode_tl())
    return 655362;
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
LABEL_12:
  v11 = v14 - 0x5555555555555556;
  if (v14 > v14 - 0x5555555555555556 || v11 > v13)
    goto LABEL_30;
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }
  if (v13 > v15 || v14 > v13)
    goto LABEL_30;
  if (!ccder_blob_decode_bitstring())
    return 655364;
  *a4 = 0;
  a4[1] = 0;
  if (v13 == v15)
    return 0;
  else
    return 655365;
}

uint64_t X509CertificateParseKey(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  result = 327691;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 96))
    {
      v8 = 0;
      v9 = 0;
      result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0, 0, &v8);
      if (!(_DWORD)result)
      {
        if (a2)
        {
          if (a3)
          {
            v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }
  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, uint64_t *a3, __int128 *a4, __int128 *a5)
{
  uint64_t v9;
  uint64_t result;
  unsigned int (*v11)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v28 = 0uLL;
  v27 = 0uLL;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  v23 = 0u;
  v22 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v28, (unint64_t *)&v27, &v25);
  if ((_DWORD)v9)
    return v9;
  v9 = 655632;
  if (compare_octet_string((uint64_t)&v28, (uint64_t)&rsaEncryption))
  {
    if (compare_octet_string((uint64_t)&v28, (uint64_t)&ecPublicKey))
      return 655617;
    v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
  }
  else
  {
    v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureRSA;
  }
  memset(v14, 0, sizeof(v14));
  v19 = *a5;
  v15 = *a4;
  v17 = v28;
  v18 = v27;
  if (((a1 & 1) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha512, 9uLL)))
  {
    return v9;
  }
  result = v25;
  if (v26 || !v25)
  {
    v12 = *a3;
    v13 = a3[1];
    if (v13 || !v12)
    {
      if (v11(v25, v26, v12, v13, v14))
        return 0;
      else
        return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  __int128 v8;
  uint64_t result;
  __int128 v10;
  uint64_t v11[2];
  _OWORD v12[4];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[2] = v8;
  v12[3] = v8;
  v12[0] = v8;
  v12[1] = v8;
  v11[0] = (uint64_t)v12;
  v11[1] = 64;
  v10 = 0uLL;
  result = X509MatchSignatureAlgorithm(a3, a4, (uint64_t)v11, &v10);
  if (!(_DWORD)result)
    return X509CertificateCheckSignatureDigest(a1, a2, v11, &v10, a5);
  return result;
}

uint64_t X509MatchSignatureAlgorithm(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
    goto LABEL_8;
  result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9;
    if (*(_QWORD *)(a3 + 8) < 0x20uLL)
      goto LABEL_15;
    *(_QWORD *)(a3 + 8) = 32;
    ccsha256_di();
    goto LABEL_14;
  }
  result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
    goto LABEL_12;
  result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!(_DWORD)result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5;
    if (*(_QWORD *)(a3 + 8) < 0x14uLL)
      goto LABEL_15;
    *(_QWORD *)(a3 + 8) = 20;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0;
  }
  result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!(_DWORD)result)
    goto LABEL_10;
  result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if ((_DWORD)result)
    return 656640;
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9;
  if (*(_QWORD *)(a3 + 8) >= 0x30uLL)
  {
    *(_QWORD *)(a3 + 8) = 48;
    ccsha384_di();
    goto LABEL_14;
  }
LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey(uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, __int128 *a6)
{
  __int128 v11;
  uint64_t matched;
  unsigned int (*v13)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  __int128 v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
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
  uint64_t v28;
  __int128 v29;
  _OWORD *v30;
  uint64_t v31;
  _OWORD v32[4];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[2] = v11;
  v32[3] = v11;
  v32[0] = v11;
  v32[1] = v11;
  v30 = v32;
  v31 = 64;
  v29 = 0uLL;
  matched = X509MatchSignatureAlgorithm(a4, (uint64_t)a5, (uint64_t)&v30, &v29);
  if ((_DWORD)matched)
    return matched;
  matched = 655617;
  if (compare_octet_string(a2, (uint64_t)&rsaEncryption))
  {
    if (compare_octet_string(a2, (uint64_t)&ecPublicKey))
      return matched;
    v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
  }
  else
  {
    v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureRSA;
  }
  v28 = 0;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v22 = 0u;
  v20 = 0u;
  v18 = 0u;
  v21 = *a5;
  v17 = 0;
  v23 = *a6;
  v19 = v29;
  if (a3)
    v14 = *a3;
  else
    v14 = null_octet;
  v22 = v14;
  result = *a1;
  v16 = a1[1];
  if ((v16 || !result) && (!v30 || v31))
  {
    if (v13(result, v16, (uint64_t)v30, v31, &v17))
      return 0;
    else
      return 655648;
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent(uint64_t a1, uint64_t (*a2)(_QWORD, int *, uint64_t), uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v9[5];
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 224);
  v4 = *(_QWORD *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  v5 = v3 + v4;
  if (v3 > v5)
    goto LABEL_11;
  v10 = *(_QWORD *)(a1 + 224);
  v11 = v5;
  while (1)
  {
    if (v10 >= v11)
      return 0;
    memset(v9, 170, sizeof(v9));
    if ((ccder_blob_decode_GeneralName(&v10, v9, (unint64_t *)&v9[1]) & 1) == 0)
      break;
    if ((a2(v9[0], &v9[1], a3) & 1) == 0)
      return 0;
  }
  return 720912;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v2 = *a1;
  v3 = a1[1];
  v20 = v3;
  if (__CFADD__(*a1, v3))
    goto LABEL_59;
  v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }
  v6 = 720901;
  v18 = *a1;
  v19 = v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl() || !v20)
        return 720898;
      v2 = v18;
      if (__CFADD__(v18, v20))
        break;
      v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19)
        goto LABEL_58;
      v16 = v18;
      v17 = v18 + v20;
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl())
          return 720899;
        if (__CFADD__(v16, v20))
          goto LABEL_59;
        if (v16 > v16 + v20 || v16 + v20 > v17)
          goto LABEL_58;
        v15 = v16 + v20;
        if (!ccder_blob_decode_tl())
          return 720900;
        v2 = v16 + v20;
        if (v16 > v15)
          goto LABEL_58;
        if (__CFADD__(v16, v20))
          goto LABEL_59;
        if (v16 > v16 + v20)
          goto LABEL_58;
        v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(_BYTE *)(v16 + 2) == 3)
        {
          v12 = v16 + v20;
          v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15)
              goto LABEL_58;
            v12 = v16 + v20;
            v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15)
                goto LABEL_58;
              v12 = v16 + v20;
              v13 = v16 + v20;
              if (!ccder_blob_decode_tl())
                return v6;
            }
          }
          if (__CFADD__(v12, v20))
            goto LABEL_59;
          v2 = v12 + v20;
          if (v15 != v12 + v20)
            return 720902;
          if (v13 < v12 || v20 > v13 - v12)
            goto LABEL_58;
          *a2 = v12;
          a2[1] = v20;
        }
        v7 = v18 + v20;
        if (v2 > v17 || v16 > v2)
          goto LABEL_58;
        v16 = v2;
      }
      if (v2 != v7)
        return 720903;
      v4 = v19;
      if (v2 > v19 || v18 > v2)
        goto LABEL_58;
      v18 = v2;
      if (v2 >= v19)
        goto LABEL_46;
    }
LABEL_59:
    __break(0x5513u);
  }
LABEL_46:
  if (v2 != v4)
    return 720904;
  if (a2[1] && *a2)
    return 0;
  *a2 = 0;
  a2[1] = 0;
  return 720905;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  _BOOL8 result;
  time_t v5;
  time_t v6[2];

  result = 0;
  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6[0] = 0;
  if (a1 && a2 != -1)
    return !X509CertificateGetNotBefore(a1, v6)
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6[0]) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  uint64_t result;
  const char *v4[3];

  v4[2] = *(const char **)MEMORY[0x24BDAC8D0];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result)
    return X509TimeConvert(v4, a2);
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  uint64_t result;
  const char *v4[3];

  v4[2] = *(const char **)MEMORY[0x24BDAC8D0];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result)
    return X509TimeConvert(v4, a2);
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2;

  v2 = time(0);
  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v1 = 720906;
  if (!result)
    return v1;
  v2 = *(_QWORD *)(result + 72);
  v3 = *(_QWORD *)(result + 80);
  if (!v2 || v3 == 0)
    return v1;
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(_QWORD *)(result + 72);
      v6[1] = v5;
      if (!ccder_blob_decode_Time(v6))
        return 720907;
      if (ccder_blob_decode_Time(v6))
        return 0;
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509TimeConvert(const char **a1, time_t *a2)
{
  uint64_t v2;
  const char *v4;
  __int128 v6;
  const char *v7;
  uint64_t result;
  const char *v9;
  time_t v10;
  tm v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = 720909;
  if (!a1)
    return v2;
  v4 = a1[1];
  if (((unint64_t)v4 | 2) != 0xF)
    return v2;
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  v7 = *a1;
  if (v4 == (const char *)13)
  {
    result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150)
      v11.tm_year -= 100;
  }
  else
  {
    result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }
  v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    if ((const char *)result != &v9[(_QWORD)*a1])
      return 720910;
    v10 = timegm(&v11);
    if (v10 == -1)
      return 720911;
    v2 = 0;
    if (a2)
      *a2 = v10;
    return v2;
  }
  __break(0x5513u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1[1];
  if (*a1 > v3)
    goto LABEL_19;
  v12 = *a1;
  v13 = a1[1];
  v11 = v3 - *a1;
  if ((ccder_blob_decode_tl() & 1) != 0)
    goto LABEL_5;
  if (*a1 > a1[1])
    goto LABEL_19;
  v12 = *a1;
  v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    v8 = v12;
    v7 = v13;
    if (v12 > v13)
      goto LABEL_19;
    *a1 = v12;
    a1[1] = v13;
    v9 = v11;
  }
  else
  {
    v8 = *a1;
    v7 = a1[1];
    v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9))
    goto LABEL_20;
  if (v7 == v8 + v9)
  {
    if (!v9)
      goto LABEL_16;
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556)
      return 0;
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8)
        goto LABEL_12;
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556)
        return 0;
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556)
        return 0;
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL)
          goto LABEL_13;
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseGenericSSLMarker()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t X509ExtensionParseServerAuthMarker(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4, unint64_t *a5)
{
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  BOOL v13;
  _BOOL4 v14;
  int v15;

  result = ccder_blob_check_null();
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6)
      goto LABEL_26;
    if (__CFADD__(a2, a3))
      goto LABEL_26;
    v10 = a2 + a3;
    if (a2 + a3 == -1)
      goto LABEL_26;
    v11 = a2 + 9;
    v12 = (char *)(a2 + 9);
    while (1)
    {
      v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      v14 = v13;
      if ((unint64_t)v12 >= v10 - 1)
        break;
      if (!v14)
        goto LABEL_25;
      v15 = *v12++;
      if ((v15 & 0x80000000) == 0)
        return 0;
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
      goto LABEL_17;
    if (a1[1] != v7 - 0x5555555555555556)
      return 0;
    if (v7 > v7 - 0x5555555555555556)
      goto LABEL_18;
    v10 = *a1;
    v11 = v7 - 0x5555555555555556;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      result = ccder_blob_decode_tl();
      if ((_DWORD)result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
            goto LABEL_18;
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *X509ExtensionParseMFI4Properties(unint64_t *result, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *result;
  v3 = result[1];
  v5 = v3 - *result;
  if (v5 != 32)
    return (unint64_t *)(v5 == 32);
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

unint64_t *X509ChainParseCertificateSet(unint64_t *result, unint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  BOOL v6;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v21;

  v5 = 0;
  *a4 = 0;
  a4[1] = 0;
  v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      result = 0;
      *a5 = v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v9 = result;
    v10 = 0;
    v11 = a2 + 304 * a3;
    v12 = ~a2;
    v13 = a4 + 1;
    v14 = (_QWORD *)(a2 + 272);
    v15 = a3 - 1;
    v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      v16 = v14 - 34;
      if (v14 != (_QWORD *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }
      result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if ((_DWORD)result)
        return result;
      if (v10)
      {
        if ((unint64_t)v16 < a2)
          goto LABEL_30;
        if ((unint64_t)(v14 + 4) > v11)
          goto LABEL_30;
        v17 = (_QWORD *)*v13;
        *v14 = 0;
        v14[1] = v17;
        if (v14 != (_QWORD *)272 && (unint64_t)v16 >= v11)
          goto LABEL_30;
        *v17 = v16;
        *v13 = (unint64_t)v14;
      }
      else
      {
        v18 = *a4;
        *(_QWORD *)(a2 + 272) = *a4;
        if (v18)
          v19 = (unint64_t *)(v18 + 280);
        else
          v19 = v13;
        *v19 = v21;
        *a4 = v16;
        *(_QWORD *)(a2 + 280) = a4;
      }
      v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        v6 = v15 == v10++;
        if (!v6)
          continue;
      }
      goto LABEL_6;
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  uint64_t i;

  for (i = *a1; i; i = *(_QWORD *)(i + 272))
  {
    if (*(_QWORD *)(i + 192) && !compare_octet_string(a2, i + 184))
      break;
  }
  return i;
}

_QWORD *X509ChainResetChain(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;

  *result = 0;
  result[1] = result;
  v2 = (_QWORD *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0;
      v2[37] = 0;
      v2 = (_QWORD *)v2[34];
    }
    while (v2);
  }
  return result;
}

uint64_t X509ChainBuildPathPartial(_QWORD *a1, uint64_t *a2, _QWORD *a3, int a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t CertificateUsingKeyIdentifier;
  _QWORD *v12;
  _QWORD *v13;
  int v14;
  uint64_t BAARootUsingKeyIdentifier;
  unsigned int v16;

  if (!a1)
    return 327691;
  v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0;
  a1[37] = a3;
  v8 = (uint64_t)(a1 + 15);
  result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if ((_DWORD)result)
  {
    while (1)
    {
      v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (v7 = (_QWORD *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        v7 = (_QWORD *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (X509ChainGetAppleRootUsingKeyIdentifier(v10, 1))
            return 0;
          BAARootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v10);
          if (a4)
            v16 = 0;
          else
            v16 = 524296;
          if (BAARootUsingKeyIdentifier)
            return 0;
          else
            return v16;
        }
        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          v7 = (_QWORD *)v7[34];
          if (!v7)
            goto LABEL_16;
        }
      }
      v12 = (_QWORD *)*a3;
      if (*a3)
        break;
LABEL_13:
      v13 = (_QWORD *)a3[1];
      v7[36] = 0;
      v7[37] = v13;
      *v13 = v7;
      a3[1] = v7 + 36;
      v8 = (uint64_t)(v7 + 15);
      v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      result = 0;
      if (!v14)
        return result;
    }
    while (v12 != v7)
    {
      v12 = (_QWORD *)v12[36];
      if (!v12)
        goto LABEL_13;
    }
    return 524297;
  }
  return result;
}

uint64_t X509ChainGetAppleRootUsingKeyIdentifier(uint64_t result, int a2)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *i;
  uint64_t v7;

  v2 = &numAppleRoots;
  if (!a2)
    v2 = &numAppleProdRoots;
  v3 = *v2;
  if (*v2)
  {
    v4 = result;
    for (i = (uint64_t *)&AppleRoots; i < (uint64_t *)&BlockedYonkersSPKI && i >= (uint64_t *)&AppleRoots; ++i)
    {
      v7 = *i;
      result = compare_octet_string(v4, *i + 184);
      if (!(_DWORD)result)
        return v7;
      if (!--v3)
        return 0;
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainGetBAARootUsingKeyIdentifier(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int *i;
  uint64_t v5;

  v1 = numBAARoots;
  if (numBAARoots)
  {
    v2 = result;
    for (i = (int *)&BAARoots; i < digests && i >= (int *)&BAARoots; i += 2)
    {
      v5 = *(_QWORD *)i;
      result = compare_octet_string(v2, *(_QWORD *)i + 184);
      if (!(_DWORD)result)
        return v5;
      if (!--v1)
        return 0;
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainBuildPath(_QWORD *a1, uint64_t *a2, _QWORD *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t AppleRootUsingKeyIdentifier;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t *v31;
  uint64_t *v32;
  char v33;
  unint64_t v34[2];
  unint64_t v35[5];

  v6 = a2;
  v35[4] = *MEMORY[0x24BDAC8D0];
  v8 = *a2;
  if (a3)
  {
    v9 = *(_QWORD *)(a3 + 48);
    if (v9)
    {
      if (*(_QWORD *)(v9 + 8))
      {
        if (compare_octet_string(v9, v8 + 208))
          return 327701;
        v8 = *v6;
      }
    }
  }
  if (v8)
  {
    v31 = v6;
    v32 = a4;
    v11 = 0;
    v12 = 0;
    v33 = 0;
    v13 = -1;
    while (1)
    {
      v14 = *(_QWORD *)(v8 + 288);
      v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        v16 = 0;
        goto LABEL_11;
      }
      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        v16 = 0;
        v15 = v8 + 304;
        v14 = v8;
        goto LABEL_11;
      }
      if (!a3)
        return v12 | 0x9000Du;
      if (*(_BYTE *)(a3 + 16))
      {
        AppleRootUsingKeyIdentifier = X509ChainGetAppleRootUsingKeyIdentifier(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }
      else
      {
        if (!*(_QWORD *)(a3 + 24))
          goto LABEL_58;
        AppleRootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v8 + 168);
      }
      v14 = AppleRootUsingKeyIdentifier;
      v33 |= AppleRootUsingKeyIdentifier != 0;
      v15 = AppleRootUsingKeyIdentifier + 304;
      if (AppleRootUsingKeyIdentifier)
        goto LABEL_10;
LABEL_58:
      if (!*(_BYTE *)(a3 + 19))
        return v12 | 0x9000Du;
      v14 = 0;
      v16 = 1;
LABEL_11:
      if (v11 && *(_QWORD *)(v8 + 32) >= 2uLL)
      {
        if (!*(_BYTE *)(v8 + 265))
        {
          v30 = 589825;
          return v12 | v30;
        }
        if ((*(_BYTE *)(v8 + 264) & 4) == 0)
        {
          v30 = 589826;
          return v12 | v30;
        }
      }
      v17 = *(_QWORD *)(v8 + 200);
      if (v17)
        v18 = v17 >= v11;
      else
        v18 = 1;
      if (!v18)
      {
        v30 = 589827;
        return v12 | v30;
      }
      if (*(_BYTE *)(v8 + 266))
      {
        v30 = 589831;
        return v12 | v30;
      }
      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        v30 = 589828;
        return v12 | v30;
      }
      if ((v16 & 1) == 0 && *(_QWORD *)(v8 + 168) && *(_QWORD *)(v8 + 176))
      {
        if (v14 >= v15)
          goto LABEL_100;
        if (compare_octet_string(v8 + 168, v14 + 184))
          return v12 | 0x9000Au;
      }
      if (a3 && v11 && (*(_QWORD *)(v8 + 240) & *(_QWORD *)(a3 + 8)) == 0)
        X509PolicySetFlagsForCommonNames(v8);
      if (v14 == v8 && !*(_QWORD *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(_BYTE *)(a3 + 18) && !X509CertificateIsValid(v8))
            return v12 | 0x90009u;
          v19 = *(_QWORD *)(a3 + 8);
          if (!v11 && (*(_QWORD *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            v19 = *(_QWORD *)(a3 + 8);
          }
          v13 &= *(_QWORD *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            v30 = 589829;
            return v12 | v30;
          }
          goto LABEL_49;
        }
      }
      else if (a3)
      {
        goto LABEL_34;
      }
      v13 &= *(_QWORD *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15)
          goto LABEL_100;
        result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40, (__int128 *)(v8 + 56));
        if ((_DWORD)result)
          return result;
      }
      v21 = v11 + 1;
      if (v11 == -1)
        goto LABEL_99;
      v8 = *(_QWORD *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3)
          goto LABEL_61;
        goto LABEL_87;
      }
    }
  }
  v21 = 0;
  v13 = -1;
  if (!a3)
    goto LABEL_87;
LABEL_61:
  if (*(_QWORD *)a3)
  {
    v22 = v21;
    if ((v8 & 1) != 0)
    {
      v22 = v21 + 1;
      if (v21 == -1)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }
    if (*(_QWORD *)a3 != v22)
      return ((_DWORD)v22 << 8) | 0x90006u;
  }
  v23 = *(_QWORD *)(a3 + 24);
  if (!v23 || !*(_QWORD *)(v23 + 8))
  {
    if (!*(_BYTE *)(a3 + 16))
      goto LABEL_87;
    v24 = (_DWORD)v21 << 8;
    v25 = **(_QWORD **)(v6[1] + 8);
LABEL_75:
    v27 = 184;
    if ((v8 & 1) != 0)
      v27 = 168;
    v28 = X509ChainGetAppleRootUsingKeyIdentifier(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28)
      return v24 | 0x9000Bu;
    v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40, (__int128 *)(v25 + 56)))
    {
      goto LABEL_87;
    }
    v26 = 589836;
    return v24 | v26;
  }
  v24 = (_DWORD)v21 << 8;
  v25 = **(_QWORD **)(v6[1] + 8);
  if (*(_BYTE *)(a3 + 16))
    goto LABEL_75;
  memset(v35, 170, 32);
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    v26 = 589832;
    return v24 | v26;
  }
  if (compare_octet_string((uint64_t)&v35[2], *(_QWORD *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(_QWORD *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey(*(uint64_t **)(a3 + 24), *(_QWORD *)(a3 + 32), *(__int128 **)(a3 + 40), v25 + 16, (__int128 *)(v25 + 40), (__int128 *)(v25 + 56)))goto LABEL_72;
  }
  else if (!compare_octet_string(*(_QWORD *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(_QWORD *)(a3 + 40));
  }
LABEL_87:
  result = 0;
  if (a4)
    *a4 = v13;
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0);
}

void authInstalllogHandler_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_222C3F000, v0, v1, "AMAuthInstall: %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void authInstalllogHandler_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_222C3F000, v0, OS_LOG_TYPE_DEBUG, "AMAuthInstall: %{public}s", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

void __authInstalllogHandler_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, MEMORY[0x24BDACB70], a3, "Couldn't create os_log_t", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

uint64_t AMAuthInstallApCreatePersonalizedResponse()
{
  return MEMORY[0x24BEDA688]();
}

uint64_t AMAuthInstallApImg4ForceServerSigning()
{
  return MEMORY[0x24BEDA698]();
}

uint64_t AMAuthInstallApImg4ServerRequestAddRequiredTags()
{
  return MEMORY[0x24BEDA6B0]();
}

uint64_t AMAuthInstallApSetParameters()
{
  return MEMORY[0x24BEDA6B8]();
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x24BEDA6C8]();
}

uint64_t AMAuthInstallLogSetHandler()
{
  return MEMORY[0x24BEDA6D0]();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return MEMORY[0x24BEDA6F0]();
}

uint64_t AMAuthInstallSsoEnable()
{
  return MEMORY[0x24BEDA6F8]();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return MEMORY[0x24BEDA700]();
}

uint64_t AMAuthInstallSupportGetLibraryVersionString()
{
  return MEMORY[0x24BEDA720]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x24BEDA0E0]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

uint64_t MAEGetActivationStateWithError()
{
  return MEMORY[0x24BE66A40]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t SBGetScreenLockStatus()
{
  return MEMORY[0x24BEB0B80]();
}

uint64_t SBSSpringBoardBlockableServerPort()
{
  return MEMORY[0x24BEB0D40]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x24BDE87A0](allocator, protection, flags, error);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
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

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x24BDAD400]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x24BDAD428]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x24BDAD430]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x24BDAD438]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x24BDAD460]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x24BDAD478]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x24BDAD500]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x24BDAD518]();
}

uint64_t ccdigest()
{
  return MEMORY[0x24BDAD538]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x24BDAD540]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x24BDAD548]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x24BDAD568]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x24BDAD570]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x24BDAD578]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x24BDAD590]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x24BDAD598]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x24BDAD5A0]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x24BDAD5B0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x24BDAD5D0]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x24BDAD5D8]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x24BDAD5F0]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x24BDAD5F8]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x24BDAD618]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x24BDAD7D0]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x24BDAD7F8]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x24BDAD818]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x24BDAD838]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x24BDAD928]();
}

double difftime(time_t a1, time_t a2)
{
  double result;

  MEMORY[0x24BDADC30](a1, a2);
  return result;
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x24BDAFF98](a1, a2, a3);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x24BDB0248](a1);
}

