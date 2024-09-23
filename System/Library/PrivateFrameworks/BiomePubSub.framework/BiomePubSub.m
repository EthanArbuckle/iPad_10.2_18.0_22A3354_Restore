void sub_1A956D330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A956DF20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BPSPipelineSupportsPullBasedPublishers(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&overrideLock);
  v2 = (id)override;
  os_unfair_lock_unlock((os_unfair_lock_t)&overrideLock);
  if (v2)
  {
    v3 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    v4 = objc_opt_respondsToSelector();
    v5 = objc_opt_respondsToSelector();
    v6 = objc_opt_respondsToSelector();
    v7 = objc_opt_respondsToSelector();
    v8 = objc_opt_respondsToSelector();
    v3 = 0;
    if ((v4 & 1) != 0 && (v5 & 1) != 0 && (v6 & 1) != 0 && (v7 & 1) != 0 && (v8 & 1) != 0)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(v1, "upstreamPublishers", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v9);
            if (!BPSPipelineSupportsPullBasedPublishers(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13)))
            {
              v3 = 0;
              goto LABEL_18;
            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v11)
            continue;
          break;
        }
      }
      v3 = 1;
LABEL_18:

    }
  }

  return v3;
}

void sub_1A956E7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A956F400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMDSLSubscribeOnClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!BiomeDSLLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E554D098;
    v5 = 0;
    BiomeDSLLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiomeDSLLibraryCore_frameworkLibrary)
    __getBMDSLSubscribeOnClass_block_invoke_cold_1(&v3);
  result = objc_getClass("BMDSLSubscribeOn");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDSLSubscribeOnClass_block_invoke_cold_2();
  getBMDSLSubscribeOnClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLSubscribeOnClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!BiomeDSLLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E554D0B0;
    v5 = 0;
    BiomeDSLLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!BiomeDSLLibraryCore_frameworkLibrary_0)
    __getBMDSLSubscribeOnClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("BMDSLSubscribeOn");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDSLSubscribeOnClass_block_invoke_cold_2_0();
  getBMDSLSubscribeOnClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A95718BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_4(id a1)
{
  return a1;
}

void sub_1A957B094(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void BPSOverridePipelineSupportsPullBasedPublishers(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&overrideLock);
  v2 = (void *)override;
  override = (uint64_t)v1;

  os_unfair_lock_unlock((os_unfair_lock_t)&overrideLock);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

uint64_t BPSPBApproxPercentileDigestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v20;
  unint64_t v21;
  int v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t result;
  unint64_t *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;

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
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          v15 = v9++ >= 9;
          if (v15)
          {
            v10 = 0;
            v16 = *v5;
            v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *v5;
        v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(_BYTE *)(a2 + v16))
          v10 = 0;
LABEL_14:
        v18 = v10 & 7;
        if (!v17 && v18 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              *(_BYTE *)(a1 + 72) |= 8u;
              v20 = *v3;
              v21 = *(_QWORD *)(a2 + v20);
              if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v22 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v21);
                *(_QWORD *)(a2 + v20) = v21 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v22 = 0;
              }
              v60 = 68;
              goto LABEL_89;
            case 2u:
              *(_BYTE *)(a1 + 72) |= 4u;
              v41 = *v3;
              v42 = *(_QWORD *)(a2 + v41);
              if (v42 <= 0xFFFFFFFFFFFFFFFBLL && v42 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v22 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v42);
                *(_QWORD *)(a2 + v41) = v42 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v22 = 0;
              }
              v60 = 64;
LABEL_89:
              *(_DWORD *)(a1 + v60) = v22;
              goto LABEL_92;
            case 3u:
              v23 = 0;
              v24 = 0;
              v25 = 0;
              *(_BYTE *)(a1 + 72) |= 2u;
              while (2)
              {
                v26 = *v3;
                v27 = *(_QWORD *)(a2 + v26);
                v28 = v27 + 1;
                if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
                  *(_QWORD *)(a2 + v26) = v28;
                  v25 |= (unint64_t)(v29 & 0x7F) << v23;
                  if (v29 < 0)
                  {
                    v23 += 7;
                    v15 = v24++ >= 9;
                    if (v15)
                    {
                      LODWORD(v25) = 0;
                      goto LABEL_67;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v25) = 0;
LABEL_67:
              v50 = 60;
              goto LABEL_72;
            case 4u:
              v30 = 0;
              v31 = 0;
              v25 = 0;
              *(_BYTE *)(a1 + 72) |= 1u;
              while (2)
              {
                v32 = *v3;
                v33 = *(_QWORD *)(a2 + v32);
                v34 = v33 + 1;
                if (v33 == -1 || v34 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
                  *(_QWORD *)(a2 + v32) = v34;
                  v25 |= (unint64_t)(v35 & 0x7F) << v30;
                  if (v35 < 0)
                  {
                    v30 += 7;
                    v15 = v31++ >= 9;
                    if (v15)
                    {
                      LODWORD(v25) = 0;
                      goto LABEL_71;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v25) = 0;
LABEL_71:
              v50 = 56;
LABEL_72:
              *(_DWORD *)(a1 + v50) = v25;
              goto LABEL_92;
            case 5u:
              if (v18 != 2)
              {
                v51 = *v3;
                v52 = *(_QWORD *)(a2 + v51);
                if (v52 <= 0xFFFFFFFFFFFFFFFBLL && v52 + 4 <= *(_QWORD *)(a2 + *v4))
                  *(_QWORD *)(a2 + v51) = v52 + 4;
                else
                  *(_BYTE *)(a2 + v16) = 1;
                PBRepeatedFloatAdd();
                goto LABEL_92;
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (1)
              {
                v37 = (unint64_t *)(a2 + *v3);
                v38 = *v37;
                v39 = *(_QWORD *)(a2 + *v4);
                if (*v37 >= v39)
                  break;
                v40 = *v5;
                if (*(_BYTE *)(a2 + v40))
                  break;
                if (v38 > 0xFFFFFFFFFFFFFFFBLL || v38 + 4 > v39)
                  *(_BYTE *)(a2 + v40) = 1;
                else
                  *v37 = v38 + 4;
                PBRepeatedFloatAdd();
              }
              goto LABEL_63;
            case 6u:
              if (v18 == 2)
              {
                result = PBReaderPlaceMark();
                if (!(_DWORD)result)
                  return result;
                while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
                {
                  v43 = 0;
                  v44 = 0;
                  v45 = 0;
                  while (1)
                  {
                    v46 = *v3;
                    v47 = *(_QWORD *)(a2 + v46);
                    v48 = v47 + 1;
                    if (v47 == -1 || v48 > *(_QWORD *)(a2 + *v4))
                      break;
                    v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
                    *(_QWORD *)(a2 + v46) = v48;
                    v45 |= (unint64_t)(v49 & 0x7F) << v43;
                    if (v49 < 0)
                    {
                      v43 += 7;
                      v15 = v44++ >= 9;
                      if (!v15)
                        continue;
                    }
                    goto LABEL_62;
                  }
                  *(_BYTE *)(a2 + *v5) = 1;
LABEL_62:
                  PBRepeatedUInt32Add();
                }
LABEL_63:
                PBReaderRecallMark();
              }
              else
              {
                v53 = 0;
                v54 = 0;
                v55 = 0;
                while (1)
                {
                  v56 = *v3;
                  v57 = *(_QWORD *)(a2 + v56);
                  v58 = v57 + 1;
                  if (v57 == -1 || v58 > *(_QWORD *)(a2 + *v4))
                    break;
                  v59 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
                  *(_QWORD *)(a2 + v56) = v58;
                  v55 |= (unint64_t)(v59 & 0x7F) << v53;
                  if (v59 < 0)
                  {
                    v53 += 7;
                    v15 = v54++ >= 9;
                    if (!v15)
                      continue;
                  }
                  goto LABEL_84;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_84:
                PBRepeatedUInt32Add();
              }
LABEL_92:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
            default:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                goto LABEL_92;
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A9581F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A958260C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A958303C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1A9584ACC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A958837C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
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

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_3_0(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

uint64_t BPSDemandMax(uint64_t result)
{
  if (result < 0)
    BPSDemandMax_cold_1();
  return result;
}

void sub_1A9595B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A95961C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A9596C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
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

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1A959A064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A959E6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_1A959E854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id Subscribers.Sink.__allocating_init(receiveBookmarkCompletion:receiveInput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD aBlock[6];

  v9 = objc_allocWithZone(v4);
  aBlock[4] = a1;
  aBlock[5] = a2;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  aBlock[3] = &block_descriptor;
  v11 = _Block_copy(aBlock);
  v15[4] = a3;
  v15[5] = a4;
  v15[0] = v10;
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  v15[3] = &block_descriptor_3;
  v12 = _Block_copy(v15);
  v13 = objc_msgSend(v9, sel_initWithReceiveBookmarkCompletion_receiveInput_, v11, v12);
  _Block_release(v11);
  _Block_release(v12);
  swift_release();
  swift_release();
  return v13;
}

void thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ()(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(id, uint64_t);
  id v6;

  v5 = *(void (**)(id, uint64_t))(a1 + 32);
  swift_retain();
  v6 = a2;
  swift_unknownObjectRetain();
  v5(v6, a3);
  swift_release();
  swift_unknownObjectRelease();

}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id Subscribers.Sink.init(receiveBookmarkCompletion:receiveInput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  objc_super v16;
  uint64_t aBlock;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = *MEMORY[0x1E0DEEDD8] & *v4;
  v21 = a1;
  v22 = a2;
  v8 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v18 = 1107296256;
  v19 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  v20 = &block_descriptor_6;
  v9 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v21 = a3;
  v22 = a4;
  aBlock = v8;
  v18 = 1107296256;
  v19 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  v20 = &block_descriptor_9;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v13 = (objc_class *)type metadata accessor for Subscribers.Sink(0, *(_QWORD *)(v7 + 80), v11, v12);
  v16.receiver = v4;
  v16.super_class = v13;
  v14 = objc_msgSendSuper2(&v16, sel_initWithReceiveBookmarkCompletion_receiveInput_, v9, v10);
  swift_release();
  swift_release();
  _Block_release(v10);
  _Block_release(v9);
  return v14;
}

uint64_t type metadata accessor for Subscribers.Sink(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Subscribers.Sink);
}

id @objc Subscribers.Sink.init(receiveBookmarkCompletion:receiveInput:)(int a1, int a2, void *aBlock, const void *a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = _Block_copy(aBlock);
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  return Subscribers.Sink.init(receiveBookmarkCompletion:receiveInput:)((uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion, @unowned BMBookmark?) -> ()partial apply, v7, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (), v8);
}

id Subscribers.Sink.__allocating_init(receiveCompletion:receiveInput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD aBlock[6];

  v9 = objc_allocWithZone(v4);
  aBlock[4] = a1;
  aBlock[5] = a2;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
  aBlock[3] = &block_descriptor_12;
  v11 = _Block_copy(aBlock);
  v15[4] = a3;
  v15[5] = a4;
  v15[0] = v10;
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  v15[3] = &block_descriptor_15;
  v12 = _Block_copy(v15);
  v13 = objc_msgSend(v9, sel_initWithReceiveCompletion_receiveInput_, v11, v12);
  _Block_release(v11);
  _Block_release(v12);
  swift_release();
  swift_release();
  return v13;
}

void thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id Subscribers.Sink.init(receiveCompletion:receiveInput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  objc_super v16;
  uint64_t aBlock;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = *MEMORY[0x1E0DEEDD8] & *v4;
  v21 = a1;
  v22 = a2;
  v8 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v18 = 1107296256;
  v19 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
  v20 = &block_descriptor_18;
  v9 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v21 = a3;
  v22 = a4;
  aBlock = v8;
  v18 = 1107296256;
  v19 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  v20 = &block_descriptor_21;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v13 = (objc_class *)type metadata accessor for Subscribers.Sink(0, *(_QWORD *)(v7 + 80), v11, v12);
  v16.receiver = v4;
  v16.super_class = v13;
  v14 = objc_msgSendSuper2(&v16, sel_initWithReceiveCompletion_receiveInput_, v9, v10);
  swift_release();
  swift_release();
  _Block_release(v10);
  _Block_release(v9);
  return v14;
}

id @objc Subscribers.Sink.init(receiveCompletion:receiveInput:)(int a1, int a2, void *aBlock, const void *a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = _Block_copy(aBlock);
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  return Subscribers.Sink.init(receiveCompletion:receiveInput:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (), v7, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (), v8);
}

id Subscribers.Sink.__allocating_init(receiveBookmarkedCompletion:receiveInput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD aBlock[6];

  v9 = objc_allocWithZone(v4);
  aBlock[4] = a1;
  aBlock[5] = a2;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  aBlock[3] = &block_descriptor_24;
  v11 = _Block_copy(aBlock);
  v15[4] = a3;
  v15[5] = a4;
  v15[0] = v10;
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  v15[3] = &block_descriptor_27;
  v12 = _Block_copy(v15);
  v13 = objc_msgSend(v9, sel_initWithReceiveBookmarkedCompletion_receiveInput_, v11, v12);
  _Block_release(v11);
  _Block_release(v12);
  swift_release();
  swift_release();
  return v13;
}

id Subscribers.Sink.init(receiveBookmarkedCompletion:receiveInput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  objc_super v16;
  uint64_t aBlock;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = *MEMORY[0x1E0DEEDD8] & *v4;
  v21 = a1;
  v22 = a2;
  v8 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v18 = 1107296256;
  v19 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  v20 = &block_descriptor_30;
  v9 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v21 = a3;
  v22 = a4;
  aBlock = v8;
  v18 = 1107296256;
  v19 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  v20 = &block_descriptor_33;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v13 = (objc_class *)type metadata accessor for Subscribers.Sink(0, *(_QWORD *)(v7 + 80), v11, v12);
  v16.receiver = v4;
  v16.super_class = v13;
  v14 = objc_msgSendSuper2(&v16, sel_initWithReceiveBookmarkedCompletion_receiveInput_, v9, v10);
  swift_release();
  swift_release();
  _Block_release(v10);
  _Block_release(v9);
  return v14;
}

id @objc Subscribers.Sink.init(receiveBookmarkedCompletion:receiveInput:)(int a1, int a2, void *aBlock, const void *a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = _Block_copy(aBlock);
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  return Subscribers.Sink.init(receiveBookmarkedCompletion:receiveInput:)((uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion, @unowned BMBookmark?) -> ()partial apply, v7, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (), v8);
}

id Subscribers.Sink.__deallocating_deinit()
{
  return Subscribers.Sink.__deallocating_deinit((uint64_t (*)(_QWORD, _QWORD))type metadata accessor for Subscribers.Sink);
}

id Subscribers.DrivableSink.__allocating_init(receiveBookmarkCompletion:shouldContinue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD aBlock[6];

  v9 = objc_allocWithZone(v4);
  aBlock[4] = a1;
  aBlock[5] = a2;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  aBlock[3] = &block_descriptor_36;
  v11 = _Block_copy(aBlock);
  v15[4] = a3;
  v15[5] = a4;
  v15[0] = v10;
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  v15[3] = &block_descriptor_39;
  v12 = _Block_copy(v15);
  v13 = objc_msgSend(v9, sel_initWithReceiveBookmarkCompletion_shouldContinue_, v11, v12);
  _Block_release(v11);
  _Block_release(v12);
  swift_release();
  swift_release();
  return v13;
}

id Subscribers.DrivableSink.init(receiveBookmarkCompletion:shouldContinue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  objc_super v16;
  uint64_t aBlock;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = *MEMORY[0x1E0DEEDD8] & *v4;
  v21 = a1;
  v22 = a2;
  v8 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v18 = 1107296256;
  v19 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  v20 = &block_descriptor_42;
  v9 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v21 = a3;
  v22 = a4;
  aBlock = v8;
  v18 = 1107296256;
  v19 = (void (*)(uint64_t, void *, uint64_t))thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  v20 = &block_descriptor_45;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v13 = (objc_class *)type metadata accessor for Subscribers.DrivableSink(0, *(_QWORD *)(v7 + 80), v11, v12);
  v16.receiver = v4;
  v16.super_class = v13;
  v14 = objc_msgSendSuper2(&v16, sel_initWithReceiveBookmarkCompletion_shouldContinue_, v9, v10);
  swift_release();
  swift_release();
  _Block_release(v10);
  _Block_release(v9);
  return v14;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool)(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v1 & 1;
}

uint64_t type metadata accessor for Subscribers.DrivableSink(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Subscribers.DrivableSink);
}

id @objc Subscribers.DrivableSink.init(receiveBookmarkCompletion:shouldContinue:)(int a1, int a2, void *aBlock, const void *a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = _Block_copy(aBlock);
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  return Subscribers.DrivableSink.init(receiveBookmarkCompletion:shouldContinue:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion, @unowned BMBookmark) -> (), v7, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (@unowned ObjCBool)partial apply, v8);
}

id Subscribers.DrivableSink.__allocating_init(receiveCompletion:shouldContinue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD aBlock[6];

  v9 = objc_allocWithZone(v4);
  aBlock[4] = a1;
  aBlock[5] = a2;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
  aBlock[3] = &block_descriptor_48;
  v11 = _Block_copy(aBlock);
  v15[4] = a3;
  v15[5] = a4;
  v15[0] = v10;
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  v15[3] = &block_descriptor_51;
  v12 = _Block_copy(v15);
  v13 = objc_msgSend(v9, sel_initWithReceiveCompletion_shouldContinue_, v11, v12);
  _Block_release(v11);
  _Block_release(v12);
  swift_release();
  swift_release();
  return v13;
}

id Subscribers.DrivableSink.init(receiveCompletion:shouldContinue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  objc_super v16;
  uint64_t aBlock;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = *MEMORY[0x1E0DEEDD8] & *v4;
  v21 = a1;
  v22 = a2;
  v8 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v18 = 1107296256;
  v19 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
  v20 = &block_descriptor_54;
  v9 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v21 = a3;
  v22 = a4;
  aBlock = v8;
  v18 = 1107296256;
  v19 = (void (*)(uint64_t, void *))thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  v20 = &block_descriptor_57;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v13 = (objc_class *)type metadata accessor for Subscribers.DrivableSink(0, *(_QWORD *)(v7 + 80), v11, v12);
  v16.receiver = v4;
  v16.super_class = v13;
  v14 = objc_msgSendSuper2(&v16, sel_initWithReceiveCompletion_shouldContinue_, v9, v10);
  swift_release();
  swift_release();
  _Block_release(v10);
  _Block_release(v9);
  return v14;
}

id @objc Subscribers.DrivableSink.init(receiveCompletion:shouldContinue:)(int a1, int a2, void *aBlock, const void *a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = _Block_copy(aBlock);
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  return Subscribers.DrivableSink.init(receiveCompletion:shouldContinue:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion) -> (), v7, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (@unowned ObjCBool)partial apply, v8);
}

id Subscribers.DrivableSink.__allocating_init(receiveBookmarkedCompletion:shouldContinue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD aBlock[6];

  v9 = objc_allocWithZone(v4);
  aBlock[4] = a1;
  aBlock[5] = a2;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  aBlock[3] = &block_descriptor_60;
  v11 = _Block_copy(aBlock);
  v15[4] = a3;
  v15[5] = a4;
  v15[0] = v10;
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  v15[3] = &block_descriptor_63;
  v12 = _Block_copy(v15);
  v13 = objc_msgSend(v9, sel_initWithReceiveBookmarkedCompletion_shouldContinue_, v11, v12);
  _Block_release(v11);
  _Block_release(v12);
  swift_release();
  swift_release();
  return v13;
}

id Subscribers.DrivableSink.init(receiveBookmarkedCompletion:shouldContinue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  objc_super v16;
  uint64_t aBlock;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = *MEMORY[0x1E0DEEDD8] & *v4;
  v21 = a1;
  v22 = a2;
  v8 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v18 = 1107296256;
  v19 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
  v20 = &block_descriptor_66;
  v9 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v21 = a3;
  v22 = a4;
  aBlock = v8;
  v18 = 1107296256;
  v19 = (void (*)(uint64_t, void *, uint64_t))thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  v20 = &block_descriptor_69;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v13 = (objc_class *)type metadata accessor for Subscribers.DrivableSink(0, *(_QWORD *)(v7 + 80), v11, v12);
  v16.receiver = v4;
  v16.super_class = v13;
  v14 = objc_msgSendSuper2(&v16, sel_initWithReceiveBookmarkedCompletion_shouldContinue_, v9, v10);
  swift_release();
  swift_release();
  _Block_release(v10);
  _Block_release(v9);
  return v14;
}

id @objc Subscribers.DrivableSink.init(receiveBookmarkedCompletion:shouldContinue:)(int a1, int a2, void *aBlock, const void *a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = _Block_copy(aBlock);
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  return Subscribers.DrivableSink.init(receiveBookmarkedCompletion:shouldContinue:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion, @unowned BMBookmark) -> (), v7, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (@unowned ObjCBool), v8);
}

id Subscribers.DrivableSink.__deallocating_deinit()
{
  return Subscribers.Sink.__deallocating_deinit((uint64_t (*)(_QWORD, _QWORD))type metadata accessor for Subscribers.DrivableSink);
}

id Subscribers.Sink.__deallocating_deinit(uint64_t (*a1)(_QWORD, _QWORD))
{
  _QWORD *v1;
  objc_class *v2;
  objc_super v4;

  v2 = (objc_class *)a1(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x50));
  v4.receiver = v1;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id PublisherProtocol.sink(completion:receiveInput:)(uint64_t (*a1)(), _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  int v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t AssociatedTypeWitness;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  uint64_t (*v37)(uint64_t);
  _QWORD *v38;
  uint64_t aBlock;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t (*v43)();
  _QWORD *v44;

  v12 = *(uint64_t (**)(uint64_t, uint64_t))(a6 + 24);
  v13 = (void *)v12(a5, a6);
  v14 = BPSPipelineSupportsPullBasedPublishers(v13);
  swift_unknownObjectRelease();
  v15 = (_QWORD *)swift_allocObject();
  if (v14)
  {
    v15[2] = a1;
    v15[3] = a2;
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = a5;
    v16[3] = a6;
    v16[4] = a3;
    v16[5] = a4;
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v20 = objc_allocWithZone((Class)type metadata accessor for Subscribers.Sink(0, AssociatedTypeWitness, v18, v19));
    v43 = partial apply for closure #1 in PublisherProtocol.sink(completion:receiveInput:);
    v44 = v15;
    v21 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v40 = 1107296256;
    v41 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
    v42 = &block_descriptor_84;
    v22 = _Block_copy(&aBlock);
    v37 = partial apply for closure #2 in PublisherProtocol.sink(completion:receiveInput:);
    v38 = v16;
    v33 = v21;
    v34 = 1107296256;
    v35 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
    v36 = &block_descriptor_87;
    v23 = _Block_copy(&v33);
    swift_retain();
    swift_retain();
    v24 = objc_msgSend(v20, sel_initWithReceiveBookmarkCompletion_receiveInput_, v22, v23);
    _Block_release(v22);
    _Block_release(v23);
    swift_release();
    swift_release();
    objc_msgSend(v24, sel_subscribeTo_, v12(a5, a6));
  }
  else
  {
    v15[2] = a5;
    v15[3] = a6;
    v15[4] = a3;
    v15[5] = a4;
    v25 = swift_getAssociatedTypeWitness();
    v28 = objc_allocWithZone((Class)type metadata accessor for Subscribers.Sink(0, v25, v26, v27));
    v43 = a1;
    v44 = a2;
    v29 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v40 = 1107296256;
    v41 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
    v42 = &block_descriptor_72;
    v30 = _Block_copy(&aBlock);
    v37 = (uint64_t (*)(uint64_t))partial apply for closure #3 in PublisherProtocol.sink(completion:receiveInput:);
    v38 = v15;
    v33 = v29;
    v34 = 1107296256;
    v35 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
    v36 = &block_descriptor_75;
    v31 = _Block_copy(&v33);
    swift_retain();
    swift_retain();
    v24 = objc_msgSend(v28, sel_initWithReceiveCompletion_receiveInput_, v30, v31);
    _Block_release(v30);
    _Block_release(v31);
    swift_release();
    swift_release();
    objc_msgSend((id)v12(a5, a6), sel_subscribe_, v24);
  }
  swift_unknownObjectRelease();
  return v24;
}

uint64_t sub_1A95A0474()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in PublisherProtocol.sink(completion:receiveInput:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t partial apply for closure #2 in PublisherProtocol.sink(completion:receiveInput:)(uint64_t a1)
{
  uint64_t v1;

  return closure #2 in PublisherProtocol.sink(completion:receiveInput:)(a1, *(void (**)())(v1 + 32));
}

id PublisherProtocol.sink(completion:shouldContinue:)(uint64_t (*a1)(), _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  int v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t AssociatedTypeWitness;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)();
  void *v36;
  uint64_t (*v37)(uint64_t);
  _QWORD *v38;
  uint64_t aBlock;
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  uint64_t (*v43)();
  _QWORD *v44;

  v12 = *(uint64_t (**)(uint64_t, uint64_t))(a6 + 24);
  v13 = (void *)v12(a5, a6);
  v14 = BPSPipelineSupportsPullBasedPublishers(v13);
  swift_unknownObjectRelease();
  v15 = (_QWORD *)swift_allocObject();
  if (v14)
  {
    v15[2] = a1;
    v15[3] = a2;
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = a5;
    v16[3] = a6;
    v16[4] = a3;
    v16[5] = a4;
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v20 = objc_allocWithZone((Class)type metadata accessor for Subscribers.DrivableSink(0, AssociatedTypeWitness, v18, v19));
    v43 = partial apply for closure #1 in PublisherProtocol.sink(completion:receiveInput:);
    v44 = v15;
    v21 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v40 = 1107296256;
    v41 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
    v42 = &block_descriptor_105;
    v22 = _Block_copy(&aBlock);
    v37 = partial apply for closure #2 in PublisherProtocol.sink(completion:shouldContinue:);
    v38 = v16;
    v33 = v21;
    v34 = 1107296256;
    v35 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
    v36 = &block_descriptor_108;
    v23 = _Block_copy(&v33);
    swift_retain();
    swift_retain();
    v24 = objc_msgSend(v20, sel_initWithReceiveCompletion_shouldContinue_, v22, v23);
    _Block_release(v22);
    _Block_release(v23);
    swift_release();
    swift_release();
    objc_msgSend(v24, sel_subscribeTo_, v12(a5, a6));
  }
  else
  {
    v15[2] = a5;
    v15[3] = a6;
    v15[4] = a3;
    v15[5] = a4;
    v25 = swift_getAssociatedTypeWitness();
    v28 = objc_allocWithZone((Class)type metadata accessor for Subscribers.DrivableSink(0, v25, v26, v27));
    v43 = a1;
    v44 = a2;
    v29 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v40 = 1107296256;
    v41 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
    v42 = &block_descriptor_93;
    v30 = _Block_copy(&aBlock);
    v37 = (uint64_t (*)(uint64_t))partial apply for closure #3 in PublisherProtocol.sink(completion:shouldContinue:);
    v38 = v15;
    v33 = v29;
    v34 = 1107296256;
    v35 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
    v36 = &block_descriptor_96;
    v31 = _Block_copy(&v33);
    swift_retain();
    swift_retain();
    v24 = objc_msgSend(v28, sel_initWithReceiveCompletion_shouldContinue_, v30, v31);
    _Block_release(v30);
    _Block_release(v31);
    swift_release();
    swift_release();
    objc_msgSend((id)v12(a5, a6), sel_subscribe_, v24);
  }
  swift_unknownObjectRelease();
  return v24;
}

uint64_t partial apply for closure #2 in PublisherProtocol.sink(completion:shouldContinue:)(uint64_t a1)
{
  uint64_t v1;

  return closure #2 in PublisherProtocol.sink(completion:shouldContinue:)(a1, *(uint64_t (**)())(v1 + 32)) & 1;
}

id PublisherProtocol<>.sink(with:completion:receiveInput:)(uint64_t a1, uint64_t (*a2)(uint64_t a1, void *a2), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t AssociatedTypeWitness;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  uint64_t (*v44)();
  _QWORD *v45;
  uint64_t aBlock;
  uint64_t v47;
  void (*v48)(uint64_t, void *, uint64_t);
  void *v49;
  uint64_t (*v50)(uint64_t, void *);
  uint64_t v51;

  v13 = *(uint64_t (**)(uint64_t, uint64_t))(a7 + 24);
  v14 = (void *)v13(a6, a7);
  v15 = BPSPipelineSupportsPullBasedPublishers(v14);
  swift_unknownObjectRelease();
  if (v15)
  {
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a2;
    *(_QWORD *)(v16 + 24) = a3;
    v17 = (_QWORD *)swift_allocObject();
    v17[2] = a6;
    v17[3] = a7;
    v17[4] = a4;
    v17[5] = a5;
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v21 = objc_allocWithZone((Class)type metadata accessor for Subscribers.Sink(0, AssociatedTypeWitness, v19, v20));
    v50 = partial apply for closure #1 in PublisherProtocol<>.sink(with:completion:receiveInput:);
    v51 = v16;
    v22 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v47 = 1107296256;
    v48 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
    v49 = &block_descriptor_126;
    v23 = _Block_copy(&aBlock);
    v44 = partial apply for closure #3 in PublisherProtocol.sink(completion:receiveInput:);
    v45 = v17;
    v40 = v22;
    v41 = 1107296256;
    v42 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
    v43 = &block_descriptor_129;
    v24 = _Block_copy(&v40);
    swift_retain();
    swift_retain();
    v25 = objc_msgSend(v21, sel_initWithReceiveBookmarkCompletion_receiveInput_, v23, v24);
    _Block_release(v23);
    _Block_release(v24);
    swift_release();
    swift_release();
    v13(a6, a7);
    objc_opt_self();
    v26 = swift_dynamicCastObjCClass();
    if (v26)
    {
      if (a1)
      {
        v27 = (void *)v26;
        objc_opt_self();
        v28 = swift_dynamicCastObjCClass();
        if (v28)
          objc_msgSend(v27, sel_applyBookmarkNode_, v28);
      }
    }
    swift_unknownObjectRelease();
    objc_msgSend(v25, sel_subscribeTo_, v13(a6, a7));
    swift_unknownObjectRelease();
  }
  else
  {
    v29 = (_QWORD *)swift_allocObject();
    v29[2] = a6;
    v29[3] = a7;
    v29[4] = a4;
    v29[5] = a5;
    v30 = swift_getAssociatedTypeWitness();
    v33 = objc_allocWithZone((Class)type metadata accessor for Subscribers.Sink(0, v30, v31, v32));
    v50 = a2;
    v51 = a3;
    v34 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v47 = 1107296256;
    v48 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
    v49 = &block_descriptor_114;
    v35 = _Block_copy(&aBlock);
    v44 = partial apply for closure #3 in PublisherProtocol.sink(completion:receiveInput:);
    v45 = v29;
    v40 = v34;
    v41 = 1107296256;
    v42 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
    v43 = &block_descriptor_117;
    v36 = _Block_copy(&v40);
    swift_retain();
    swift_retain();
    v25 = objc_msgSend(v33, sel_initWithReceiveBookmarkedCompletion_receiveInput_, v35, v36);
    _Block_release(v35);
    _Block_release(v36);
    swift_release();
    swift_release();
    v37 = objc_msgSend((id)v13(a6, a7), sel_withBookmark_, a1);
    swift_unknownObjectRelease();
    objc_msgSend(v37, sel_subscribe_, v25);

  }
  return v25;
}

uint64_t closure #2 in PublisherProtocol.sink(completion:receiveInput:)(uint64_t a1, void (*a2)())
{
  swift_getAssociatedTypeWitness();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  a2();
  return swift_unknownObjectRelease();
}

uint64_t sub_1A95A0C6C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in PublisherProtocol<>.sink(with:completion:receiveInput:)(uint64_t a1, void *a2)
{
  uint64_t v2;

  return closure #1 in PublisherProtocol<>.sink(with:completion:receiveInput:)(a1, a2, *(void (**)(uint64_t, id))(v2 + 16));
}

id PublisherProtocol<>.sink(with:completion:shouldContinue:)(uint64_t a1, uint64_t (*a2)(), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t AssociatedTypeWitness;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)();
  void *v43;
  uint64_t (*v44)();
  _QWORD *v45;
  uint64_t aBlock;
  uint64_t v47;
  void (*v48)(uint64_t, void *, uint64_t);
  void *v49;
  uint64_t (*v50)();
  uint64_t v51;

  v13 = *(uint64_t (**)(uint64_t, uint64_t))(a7 + 24);
  v14 = (void *)v13(a6, a7);
  v15 = BPSPipelineSupportsPullBasedPublishers(v14);
  swift_unknownObjectRelease();
  if (v15)
  {
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a2;
    *(_QWORD *)(v16 + 24) = a3;
    v17 = (_QWORD *)swift_allocObject();
    v17[2] = a6;
    v17[3] = a7;
    v17[4] = a4;
    v17[5] = a5;
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v21 = objc_allocWithZone((Class)type metadata accessor for Subscribers.DrivableSink(0, AssociatedTypeWitness, v19, v20));
    v50 = partial apply for closure #1 in PublisherProtocol<>.sink(with:completion:shouldContinue:);
    v51 = v16;
    v22 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v47 = 1107296256;
    v48 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
    v49 = &block_descriptor_147;
    v23 = _Block_copy(&aBlock);
    v44 = partial apply for closure #3 in PublisherProtocol.sink(completion:shouldContinue:);
    v45 = v17;
    v40 = v22;
    v41 = 1107296256;
    v42 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
    v43 = &block_descriptor_150;
    v24 = _Block_copy(&v40);
    swift_retain();
    swift_retain();
    v25 = objc_msgSend(v21, sel_initWithReceiveBookmarkCompletion_shouldContinue_, v23, v24);
    _Block_release(v23);
    _Block_release(v24);
    swift_release();
    swift_release();
    v13(a6, a7);
    objc_opt_self();
    v26 = swift_dynamicCastObjCClass();
    if (v26)
    {
      if (a1)
      {
        v27 = (void *)v26;
        objc_opt_self();
        v28 = swift_dynamicCastObjCClass();
        if (v28)
          objc_msgSend(v27, sel_applyBookmarkNode_, v28);
      }
    }
    swift_unknownObjectRelease();
    objc_msgSend(v25, sel_subscribeTo_, v13(a6, a7));
    swift_unknownObjectRelease();
  }
  else
  {
    v29 = (_QWORD *)swift_allocObject();
    v29[2] = a6;
    v29[3] = a7;
    v29[4] = a4;
    v29[5] = a5;
    v30 = swift_getAssociatedTypeWitness();
    v33 = objc_allocWithZone((Class)type metadata accessor for Subscribers.DrivableSink(0, v30, v31, v32));
    v50 = a2;
    v51 = a3;
    v34 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v47 = 1107296256;
    v48 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion, @guaranteed BMBookmark?) -> ();
    v49 = &block_descriptor_135;
    v35 = _Block_copy(&aBlock);
    v44 = partial apply for closure #3 in PublisherProtocol.sink(completion:shouldContinue:);
    v45 = v29;
    v40 = v34;
    v41 = 1107296256;
    v42 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
    v43 = &block_descriptor_138;
    v36 = _Block_copy(&v40);
    swift_retain();
    swift_retain();
    v25 = objc_msgSend(v33, sel_initWithReceiveBookmarkedCompletion_shouldContinue_, v35, v36);
    _Block_release(v35);
    _Block_release(v36);
    swift_release();
    swift_release();
    v37 = objc_msgSend((id)v13(a6, a7), sel_withBookmark_, a1);
    swift_unknownObjectRelease();
    objc_msgSend(v37, sel_subscribe_, v25);

  }
  return v25;
}

uint64_t closure #1 in PublisherProtocol<>.sink(with:completion:receiveInput:)(uint64_t a1, void *a2, void (*a3)(uint64_t, id))
{
  id v5;
  id v6;
  Class isa;

  if (a2)
  {
    v5 = a2;
  }
  else
  {
    v6 = objc_allocWithZone((Class)BMBookmarkNode);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BMBookmark);
    isa = Array._bridgeToObjectiveC()().super.isa;
    v5 = objc_msgSend(v6, sel_initWithValue_upstreams_name_, 0, isa, 0);

  }
  swift_unknownObjectRetain();
  a3(a1, v5);
  return swift_unknownObjectRelease();
}

uint64_t closure #2 in PublisherProtocol.sink(completion:shouldContinue:)(uint64_t a1, uint64_t (*a2)())
{
  swift_getAssociatedTypeWitness();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  LOBYTE(a2) = a2();
  swift_unknownObjectRelease();
  return a2 & 1;
}

ValueMetadata *type metadata accessor for Subscribers()
{
  return &type metadata for Subscribers;
}

uint64_t type metadata completion function for Subscribers.Sink()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for NSComparisonResult()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for NSComparisonResult)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSComparisonResult);
  }
}

uint64_t sub_1A95A125C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion, @unowned BMBookmark) -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject) -> (@unowned ObjCBool)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned BPSCompletion) -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1AF4160CC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1AF41609C](a1, v6, a5);
}

uint64_t (*Publishers.Collect.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Filter.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.FlatMap.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Last.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Map.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t Publishers.Map.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t (*Publishers.Merge.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t Publishers.Merge.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t (*Publishers.MergeMany.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.OrderedMerge.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Reduce.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Scan.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Sequence.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Multicast.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Correlate.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t Publishers.Correlate.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t (*Publishers.CombineLatest.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t Publishers.CombineLatest.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t (*Publishers.Debounce.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Future.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

id Publishers.HandleEvents.inner.getter()
{
  return (id)specialized Publishers.HandleEvents.inner.getter();
}

void Publishers.HandleEvents.inner.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*Publishers.HandleEvents.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t Publishers.HandleEvents.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id protocol witness for PublisherProtocol.inner.getter in conformance Publishers.HandleEvents<A>()
{
  return (id)specialized Publishers.HandleEvents.inner.getter();
}

uint64_t (*Publishers.RemoveDuplicates.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Throttle.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Timer.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Zip.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.ZipMany.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t (*Publishers.Buffer.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t specialized Publishers.HandleEvents.inner.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Collect<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Collect<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Filter<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Filter<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.FlatMap<A, B>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.FlatMap<A, B>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Last<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Last<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Map<A, B>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Map<A, B>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Merge<A, B, C>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Merge<A, B, C>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.MergeMany<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.MergeMany<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.OrderedMerge<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.OrderedMerge<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Reduce<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Reduce<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Scan<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Scan<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Sequence<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Sequence<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Multicast<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Multicast<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Correlate<A, B, C, D>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Correlate<A, B, C, D>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.CombineLatest<A, B>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.CombineLatest<A, B>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Debounce<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Debounce<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Future<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Future<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.HandleEvents<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.HandleEvents<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.RemoveDuplicates<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.RemoveDuplicates<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Throttle<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Throttle<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Timer<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Timer<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Zip<A, B>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Zip<A, B>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.ZipMany<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.ZipMany<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publishers.Buffer<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Buffer<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

ValueMetadata *type metadata accessor for Publishers()
{
  return &type metadata for Publishers;
}

uint64_t type metadata instantiation function for Publishers.Collect()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for Publishers.Collect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Collect);
}

uint64_t type metadata accessor for Publishers.Filter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Filter);
}

uint64_t type metadata instantiation function for Publishers.FlatMap()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for Publishers.FlatMap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.FlatMap);
}

uint64_t type metadata accessor for Publishers.Last(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Last);
}

uint64_t type metadata accessor for Publishers.Map(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Map);
}

uint64_t type metadata instantiation function for Publishers.Merge()
{
  return swift_allocateGenericValueMetadata();
}

void type metadata accessor for Publishers.Merge()
{
  JUMPOUT(0x1AF41609CLL);
}

uint64_t type metadata accessor for Publishers.MergeMany(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.MergeMany);
}

uint64_t type metadata accessor for Publishers.OrderedMerge(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.OrderedMerge);
}

uint64_t type metadata accessor for Publishers.Reduce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Reduce);
}

uint64_t type metadata accessor for Publishers.Scan(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Scan);
}

uint64_t type metadata accessor for Publishers.Sequence(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Sequence);
}

uint64_t type metadata accessor for Publishers.Multicast(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Multicast);
}

uint64_t type metadata instantiation function for Publishers.Correlate()
{
  return swift_allocateGenericValueMetadata();
}

void type metadata accessor for Publishers.Correlate()
{
  JUMPOUT(0x1AF41609CLL);
}

void type metadata accessor for Publishers.CombineLatest()
{
  JUMPOUT(0x1AF41609CLL);
}

uint64_t type metadata accessor for Publishers.Debounce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Debounce);
}

uint64_t type metadata accessor for Publishers.Future(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Future);
}

uint64_t type metadata accessor for Publishers.HandleEvents(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.HandleEvents);
}

uint64_t type metadata accessor for Publishers.RemoveDuplicates(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.RemoveDuplicates);
}

uint64_t type metadata accessor for Publishers.Throttle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Throttle);
}

uint64_t type metadata accessor for Publishers.Timer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Timer);
}

void type metadata accessor for Publishers.Zip()
{
  JUMPOUT(0x1AF41609CLL);
}

uint64_t type metadata accessor for Publishers.ZipMany(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.ZipMany);
}

uint64_t type metadata accessor for Publishers.Buffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Buffer);
}

id Publisher.inner.getter()
{
  return (id)specialized Publishers.HandleEvents.inner.getter();
}

void Publisher.inner.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*Publisher.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t Publisher.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Publisher<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publisher<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of PublisherProtocol.inner.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PublisherProtocol.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t type metadata accessor for Publisher(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publisher);
}

uint64_t PublisherProtocol.merge<A>(with:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  return PublisherProtocol.merge<A>(with:)(a1, a2, a3, a4, (Class *)off_1E554B6C8, a5);
}

uint64_t PublisherProtocol.mergeAny<A>(with:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  return PublisherProtocol.merge<A>(with:)(a1, a2, a3, a4, (Class *)off_1E554B6C8, a5);
}

void PublisherProtocol.merge<A>(with:)(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  Class isa;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  __int128 v37;
  uint64_t AssociatedTypeWitness;
  uint64_t v39;

  v33 = a3;
  v32 = a1;
  v8 = *(_QWORD *)(a2 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = v10;
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v29 - v13;
  v36 = v12;
  v16 = MEMORY[0x1AF415A0C](v12, v15);
  if (!v16)
  {
LABEL_15:
    v25 = objc_allocWithZone(MEMORY[0x1E0C99DE8]);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v27 = objc_msgSend(v25, sel_initWithArray_, isa);

    objc_msgSend(v27, sel_addObject_, (*(uint64_t (**)(uint64_t))(v33 + 24))(v32));
    swift_unknownObjectRelease();
    v28 = objc_msgSend(objc_allocWithZone((Class)BPSMergeMany), sel_initWithPublishers_, v27);

    *a5 = v28;
    return;
  }
  v17 = v16;
  v39 = MEMORY[0x1E0DEE9D8];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16 & ~(v16 >> 63), 0);
  if ((v17 & 0x8000000000000000) == 0)
  {
    v31 = a5;
    v18 = 0;
    v19 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 24);
    v34 = v36 & 0xC000000000000001;
    v35 = v19;
    do
    {
      if ((_swift_isClassOrObjCExistentialType() & 1) != 0 && v34)
      {
        v24 = _ArrayBuffer._getElementSlowPath(_:)();
        if (v30 != 8)
          goto LABEL_17;
        *(_QWORD *)&v37 = v24;
        (*(void (**)(char *, __int128 *, uint64_t))(v8 + 16))(v14, &v37, a2);
        swift_unknownObjectRelease();
      }
      else
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v14, v36+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v18, a2);
      }
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v14, a2);
      v20 = v35(a2, a4);
      AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      *(_QWORD *)&v37 = v20;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, a2);
      v21 = v39;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v21 + 16) + 1, 1);
        v21 = v39;
      }
      v23 = *(_QWORD *)(v21 + 16);
      v22 = *(_QWORD *)(v21 + 24);
      if (v23 >= v22 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v22 > 1), v23 + 1, 1);
        v21 = v39;
      }
      ++v18;
      *(_QWORD *)(v21 + 16) = v23 + 1;
      outlined init with take of Any(&v37, (_OWORD *)(v21 + 32 * v23 + 32));
    }
    while (v17 != v18);
    a5 = v31;
    goto LABEL_15;
  }
  __break(1u);
LABEL_17:
  __break(1u);
}

void PublisherProtocol.mergeAny<A>(with:)(uint64_t a1@<X0>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  id v4;
  Class isa;
  id v6;
  id v7;

  specialized _arrayForceCast<A, B>(_:)(a1, a2);
  v4 = objc_allocWithZone(MEMORY[0x1E0C99DE8]);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithArray_, isa);

  objc_msgSend(v6, sel_addObject_, _bridgeAnythingToObjectiveC<A>(_:)());
  swift_unknownObjectRelease();
  v7 = objc_msgSend(objc_allocWithZone((Class)BPSMergeMany), sel_initWithPublishers_, v6);

  *a3 = v7;
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char isClassOrObjCExistentialType;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void (*v20)(char *, unint64_t, uint64_t);
  unint64_t v21;
  unint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[2];
  uint64_t v30;

  v3 = a1;
  v4 = *(_QWORD *)(a2 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v24 - v9;
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v24 - v11;
  _swift_isClassOrObjCExistentialType();
  if ((_swift_isClassOrObjCExistentialType() & 1) != 0 && (v3 < 0 || (v3 & 0x4000000000000000) != 0))
    goto LABEL_23;
  isClassOrObjCExistentialType = _swift_isClassOrObjCExistentialType();
  v14 = v3 & 0xFFFFFFFFFFFFF8;
  if ((isClassOrObjCExistentialType & 1) == 0)
    v14 = v3;
  v15 = *(_QWORD *)(v14 + 16);
  while (1)
  {
    v16 = MEMORY[0x1E0DEE9D8];
    if (!v15)
      return v16;
    v30 = MEMORY[0x1E0DEE9D8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15 & ~(v15 >> 63), 0);
    if ((v15 & 0x8000000000000000) == 0)
      break;
    __break(1u);
LABEL_23:
    swift_unknownObjectRetain();
    v15 = _CocoaArrayWrapper.endIndex.getter();
    swift_unknownObjectRelease();
  }
  v28 = v15;
  v17 = 0;
  v25 = v5;
  v26 = v3 & 0xC000000000000001;
  v27 = MEMORY[0x1E0DEE9B8] + 8;
  v18 = v3;
  while ((_swift_isClassOrObjCExistentialType() & 1) == 0 || !v26)
  {
    v19 = v3
        + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
        + *(_QWORD *)(v4 + 72) * v17;
    v20 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    v20(v12, v19, a2);
LABEL_13:
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v10, v12, a2);
    v20(v7, (unint64_t)v10, a2);
    swift_dynamicCast();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, a2);
    v16 = v30;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v16 + 16) + 1, 1);
      v16 = v30;
    }
    v22 = *(_QWORD *)(v16 + 16);
    v21 = *(_QWORD *)(v16 + 24);
    if (v22 >= v21 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v21 > 1), v22 + 1, 1);
      v16 = v30;
    }
    ++v17;
    *(_QWORD *)(v16 + 16) = v22 + 1;
    outlined init with take of Any(v29, (_OWORD *)(v16 + 32 * v22 + 32));
    v3 = v18;
    if (v28 == v17)
      return v16;
  }
  result = _ArrayBuffer._getElementSlowPath(_:)();
  if (v25 == 8)
  {
    *(_QWORD *)&v29[0] = result;
    v20 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    v20(v12, (unint64_t)v29, a2);
    swift_unknownObjectRelease();
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t PublisherProtocol.combineLatest<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  return PublisherProtocol.merge<A>(with:)(a1, a2, a3, a4, (Class *)off_1E554B640, a5);
}

uint64_t PublisherProtocol.scan<A>(_:nextPartialResult:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  return PublisherProtocol.scan<A>(_:nextPartialResult:)(a1, a2, a3, a4, a5, a6, (Class *)off_1E554B728, a7, (uint64_t)partial apply for closure #1 in PublisherProtocol.scan<A>(_:nextPartialResult:), (uint64_t)&block_descriptor_0);
}

uint64_t PublisherProtocol.reduce<A>(_:nextPartialResult:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  return PublisherProtocol.scan<A>(_:nextPartialResult:)(a1, a2, a3, a4, a5, a6, (Class *)off_1E554B710, a7, (uint64_t)partial apply for closure #1 in PublisherProtocol.scan<A>(_:nextPartialResult:), (uint64_t)&block_descriptor_6_0);
}

uint64_t PublisherProtocol.scan<A>(_:nextPartialResult:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, Class *a7@<X7>, _QWORD *a8@<X8>, uint64_t a9, uint64_t a10)
{
  uint64_t v16;
  _QWORD *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t result;
  _QWORD aBlock[6];

  v16 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 24))(a4, a6);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a4;
  v17[3] = a5;
  v17[4] = a6;
  v17[5] = a2;
  v17[6] = a3;
  v18 = objc_allocWithZone(*a7);
  aBlock[4] = a9;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed A, @in_guaranteed Any) -> (@owned A);
  aBlock[3] = a10;
  v19 = _Block_copy(aBlock);
  swift_retain();
  v20 = objc_msgSend(v18, sel_initWithUpstream_initialResult_nextPartialResult_, v16, a1, v19);
  swift_unknownObjectRelease();
  _Block_release(v19);
  result = swift_release();
  *a8 = v20;
  return result;
}

uint64_t closure #1 in PublisherProtocol.scan<A>(_:nextPartialResult:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  _BYTE v7[32];

  outlined init with copy of Any(a2, (uint64_t)v7);
  swift_getAssociatedTypeWitness();
  swift_dynamicCast();
  v5 = a3(a1);
  swift_unknownObjectRelease();
  return v5;
}

uint64_t PublisherProtocol.map<A>(transform:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t result;
  _QWORD v13[6];

  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  v9 = objc_allocWithZone((Class)BPSMap);
  v13[4] = a1;
  v13[5] = a2;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@owned B);
  v13[3] = &block_descriptor_9_0;
  v10 = _Block_copy(v13);
  swift_retain();
  v11 = objc_msgSend(v9, sel_initWithUpstream_transform_, v8, v10);
  swift_unknownObjectRelease();
  _Block_release(v10);
  result = swift_release();
  *a5 = v11;
  return result;
}

uint64_t PublisherProtocol.last()@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  return PublisherProtocol.last()(a1, (Class *)off_1E554B6B8, a2);
}

uint64_t PublisherProtocol.filter(isIncluded:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t result;
  _QWORD v13[6];

  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  v9 = objc_allocWithZone((Class)BPSFilter);
  v13[4] = a1;
  v13[5] = a2;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
  v13[3] = &block_descriptor_12_0;
  v10 = _Block_copy(v13);
  swift_retain();
  v11 = objc_msgSend(v9, sel_initWithUpstream_isIncluded_, v8, v10);
  swift_unknownObjectRelease();
  _Block_release(v10);
  result = swift_release();
  *a5 = v11;
  return result;
}

uint64_t PublisherProtocol.flatMap<A, B>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t result;
  _QWORD aBlock[6];

  v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 24))(a3, a6);
  v16 = BPSDemandMax(1);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = a7;
  v17[7] = a1;
  v17[8] = a2;
  v18 = objc_allocWithZone((Class)BPSFlatMap);
  aBlock[4] = partial apply for closure #1 in PublisherProtocol.flatMap<A, B>(_:);
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@owned B);
  aBlock[3] = &block_descriptor_18_0;
  v19 = _Block_copy(aBlock);
  swift_retain();
  v20 = objc_msgSend(v18, sel_initWithUpstream_maxPublishers_transform_, v15, v16, v19);
  swift_unknownObjectRelease();
  _Block_release(v19);
  result = swift_release();
  *a8 = v20;
  return result;
}

uint64_t closure #1 in PublisherProtocol.flatMap<A, B>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v17;

  v10 = *(_QWORD *)(a6 - 8);
  v11 = MEMORY[0x1E0C80A78]();
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14(v11);
  v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 24))(a6, a8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, a6);
  return v15;
}

uint64_t PublisherProtocol.orderedMerge<A>(with:comparator:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, _QWORD *a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t result;
  _QWORD v21[6];

  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a3, a5);
  v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 24))(a4, a6);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = a1;
  v16[7] = a2;
  v17 = objc_allocWithZone((Class)BPSOrderedMerge);
  v21[4] = partial apply for closure #1 in PublisherProtocol.orderedMerge<A>(with:comparator:);
  v21[5] = v16;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 1107296256;
  v21[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @in_guaranteed Any) -> (@unowned NSComparisonResult);
  v21[3] = &block_descriptor_24_0;
  v18 = _Block_copy(v21);
  swift_retain();
  v19 = objc_msgSend(v17, sel_initWithA_b_comparator_, v14, v15, v18);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  _Block_release(v18);
  result = swift_release();
  *a7 = v19;
  return result;
}

uint64_t PublisherProtocol.orderedMergeAny<A>(with:comparator:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, _QWORD *a7@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t result;
  _QWORD v19[6];

  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a3, a5);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 24))(a4, a6);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a1;
  *(_QWORD *)(v14 + 24) = a2;
  v15 = objc_allocWithZone((Class)BPSOrderedMerge);
  v19[4] = partial apply for closure #1 in PublisherProtocol.orderedMergeAny<A>(with:comparator:);
  v19[5] = v14;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 1107296256;
  v19[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @in_guaranteed Any) -> (@unowned NSComparisonResult);
  v19[3] = &block_descriptor_30_0;
  v16 = _Block_copy(v19);
  swift_retain();
  v17 = objc_msgSend(v15, sel_initWithA_b_comparator_, v12, v13, v16);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  _Block_release(v16);
  result = swift_release();
  *a7 = v17;
  return result;
}

uint64_t PublisherProtocol.orderedMergeManyAny<A>(with:comparator:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  Class isa;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  Class v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  __int128 aBlock;
  uint64_t (*v49)(uint64_t, uint64_t, uint64_t);
  void *AssociatedTypeWitness;
  uint64_t (*v51)();
  uint64_t v52;
  uint64_t v53;

  v44 = a6;
  v43 = a4;
  v40 = a2;
  v41 = a3;
  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x1E0C80A78](a1);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = v13;
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v38 - v16;
  v47 = v15;
  v19 = MEMORY[0x1AF415A0C](v15, v18);
  v42 = a8;
  if (v19)
  {
    v20 = v19;
    v53 = MEMORY[0x1E0DEE9D8];
    result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v19 & ~(v19 >> 63), 0);
    if (v20 < 0)
    {
      __break(1u);
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    v22 = 0;
    v23 = *(uint64_t (**)(uint64_t, uint64_t))(a7 + 24);
    v45 = v47 & 0xC000000000000001;
    v46 = v23;
    do
    {
      if ((_swift_isClassOrObjCExistentialType() & 1) != 0 && v45)
      {
        result = _ArrayBuffer._getElementSlowPath(_:)();
        if (v39 != 8)
          goto LABEL_18;
        *(_QWORD *)&aBlock = result;
        (*(void (**)(char *, __int128 *, uint64_t))(v11 + 16))(v17, &aBlock, a5);
        swift_unknownObjectRelease();
      }
      else
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v17, v47+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v22, a5);
      }
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v17, a5);
      v24 = v46(a5, a7);
      AssociatedTypeWitness = (void *)swift_getAssociatedTypeWitness();
      *(_QWORD *)&aBlock = v24;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, a5);
      v25 = v53;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v25 + 16) + 1, 1);
        v25 = v53;
      }
      v27 = *(_QWORD *)(v25 + 16);
      v26 = *(_QWORD *)(v25 + 24);
      if (v27 >= v26 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v26 > 1), v27 + 1, 1);
        v25 = v53;
      }
      ++v22;
      *(_QWORD *)(v25 + 16) = v27 + 1;
      outlined init with take of Any(&aBlock, (_OWORD *)(v25 + 32 * v27 + 32));
    }
    while (v20 != v22);
  }
  v28 = objc_allocWithZone(MEMORY[0x1E0C99DE8]);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v30 = objc_msgSend(v28, sel_initWithArray_, isa);

  objc_msgSend(v30, sel_addObject_, (*(uint64_t (**)(uint64_t))(v44 + 24))(v43));
  swift_unknownObjectRelease();
  *(_QWORD *)&aBlock = 0;
  v31 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BPSPublisher);
  result = static Array._forceBridgeFromObjectiveC(_:result:)();
  if ((_QWORD)aBlock)
  {

    v32 = swift_allocObject();
    v33 = v41;
    *(_QWORD *)(v32 + 16) = v40;
    *(_QWORD *)(v32 + 24) = v33;
    v34 = objc_allocWithZone((Class)BPSOrderedMerge);
    swift_retain();
    v35 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v51 = partial apply for closure #2 in PublisherProtocol.orderedMergeManyAny<A>(with:comparator:);
    v52 = v32;
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v49 = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @in_guaranteed Any) -> (@unowned NSComparisonResult);
    AssociatedTypeWitness = &block_descriptor_36_0;
    v36 = _Block_copy(&aBlock);
    v37 = objc_msgSend(v34, sel_initWithPublishers_comparator_, v35, v36);

    _Block_release(v36);
    result = swift_release();
    *v42 = v37;
    return result;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t PublisherProtocol.orderedMerge<A>(withOthers:comparator:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  id v30;
  Class isa;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD aBlock[6];
  uint64_t v46;

  v44 = a7;
  v40 = a4;
  v41 = a2;
  v13 = *(_QWORD *)(a5 - 8);
  v14 = MEMORY[0x1E0C80A78](a1);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = v15;
  v17 = MEMORY[0x1E0C80A78](v14);
  v19 = (char *)&v34 - v18;
  v43 = v17;
  v21 = MEMORY[0x1AF415A0C](v17, v20);
  v22 = MEMORY[0x1E0DEE9D8];
  if (!v21)
  {
LABEL_11:
    v46 = v22;
    v27 = v40;
    (*(void (**)(uint64_t, uint64_t))(a6 + 24))(v40, a6);
    MEMORY[0x1AF4159B8]();
    if (*(_QWORD *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    v28 = (_QWORD *)swift_allocObject();
    v28[2] = v27;
    v28[3] = a5;
    v29 = v44;
    v28[4] = a6;
    v28[5] = v29;
    v28[6] = v41;
    v28[7] = a3;
    v30 = objc_allocWithZone((Class)BPSOrderedMerge);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BPSPublisher);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    aBlock[4] = partial apply for closure #1 in PublisherProtocol.orderedMerge<A>(with:comparator:);
    aBlock[5] = v28;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @in_guaranteed Any) -> (@unowned NSComparisonResult);
    aBlock[3] = &block_descriptor_42_0;
    v32 = _Block_copy(aBlock);
    v33 = objc_msgSend(v30, sel_initWithPublishers_comparator_, isa, v32);

    _Block_release(v32);
    result = swift_release();
    *a8 = v33;
    return result;
  }
  v23 = v21;
  v39 = v8;
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  result = specialized ContiguousArray.reserveCapacity(_:)();
  if ((v23 & 0x8000000000000000) == 0)
  {
    v36 = a6;
    v37 = a3;
    v38 = a8;
    v25 = 0;
    v26 = *(void (**)(uint64_t, uint64_t))(v44 + 24);
    v42 = v43 & 0xC000000000000001;
    do
    {
      if ((_swift_isClassOrObjCExistentialType() & 1) != 0 && v42)
      {
        result = _ArrayBuffer._getElementSlowPath(_:)();
        if (v35 != 8)
          goto LABEL_15;
        v46 = result;
        (*(void (**)(char *, uint64_t *, uint64_t))(v13 + 16))(v19, &v46, a5);
        swift_unknownObjectRelease();
      }
      else
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v19, v43+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(_QWORD *)(v13 + 72) * v25, a5);
      }
      ++v25;
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v19, a5);
      v26(a5, v44);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, a5);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
    while (v23 != v25);
    v22 = aBlock[0];
    a3 = v37;
    a8 = v38;
    a6 = v36;
    goto LABEL_11;
  }
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t closure #1 in PublisherProtocol.orderedMerge<A>(with:comparator:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[32];
  uint64_t v9;
  _BYTE v10[32];

  outlined init with copy of Any(a1, (uint64_t)v10);
  swift_getAssociatedTypeWitness();
  swift_dynamicCast();
  v5 = v9;
  outlined init with copy of Any(a2, (uint64_t)v8);
  swift_dynamicCast();
  v6 = a3(v5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v6;
}

uint64_t PublisherProtocol.collect()@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  return PublisherProtocol.last()(a1, (Class *)off_1E554B638, a2);
}

uint64_t PublisherProtocol.last()@<X0>(uint64_t a1@<X1>, Class *a2@<X2>, _QWORD *a3@<X8>)
{
  id v4;
  uint64_t result;

  v4 = objc_msgSend(objc_allocWithZone(*a2), sel_initWithUpstream_, (*(uint64_t (**)(void))(a1 + 24))());
  result = swift_unknownObjectRelease();
  *a3 = v4;
  return result;
}

uint64_t PublisherProtocol.debounce(for:getTimestamp:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>, double a6@<D0>)
{
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t result;
  _QWORD v15[6];

  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  v11 = objc_allocWithZone((Class)BPSDebounce);
  v15[4] = a1;
  v15[5] = a2;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@out Date);
  v15[3] = &block_descriptor_45_0;
  v12 = _Block_copy(v15);
  swift_retain();
  v13 = objc_msgSend(v11, sel_initWithUpstream_for_getTimestamp_, v10, v12, a6);
  swift_unknownObjectRelease();
  _Block_release(v12);
  result = swift_release();
  *a5 = v13;
  return result;
}

uint64_t PublisherProtocol.throttle(for:latest:getTimestamp:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>, double a7@<D0>)
{
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t result;
  _QWORD v17[6];

  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a4, a5);
  v13 = objc_allocWithZone((Class)BPSThrottle);
  v17[4] = a2;
  v17[5] = a3;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@out Date);
  v17[3] = &block_descriptor_48_0;
  v14 = _Block_copy(v17);
  swift_retain();
  v15 = objc_msgSend(v13, sel_initWithUpstream_interval_latest_getTimestamp_, v12, a1 & 1, v14, a7);
  swift_unknownObjectRelease();
  _Block_release(v14);
  result = swift_release();
  *a6 = v15;
  return result;
}

uint64_t PublisherProtocol.zip<A>(with:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  return PublisherProtocol.merge<A>(with:)(a1, a2, a3, a4, (Class *)off_1E554B7A8, a5);
}

uint64_t PublisherProtocol.merge<A>(with:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, Class *a5@<X5>, _QWORD *a6@<X8>)
{
  uint64_t v10;
  id v11;
  uint64_t result;

  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a1, a3);
  v11 = objc_msgSend(objc_allocWithZone(*a5), sel_initWithA_b_, v10, (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 24))(a2, a4));
  swift_unknownObjectRelease();
  result = swift_unknownObjectRelease();
  *a6 = v11;
  return result;
}

void PublisherProtocol.zip<A>(with:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  Class isa;
  id v26;
  _QWORD v27[2];
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v7 = v6;
  v32 = a5;
  v30 = a2;
  v11 = *(_QWORD *)(a3 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = MEMORY[0x1E0C80A78](a1);
  v14 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v27 - v16;
  v33 = v15;
  v19 = MEMORY[0x1AF415A0C](v15, v18);
  v20 = MEMORY[0x1E0DEE9D8];
  if (!v19)
  {
LABEL_11:
    v35 = v20;
    (*(void (**)(uint64_t, uint64_t))(a4 + 24))(v30, a4);
    MEMORY[0x1AF4159B8]();
    if (*(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BPSPublisher);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v26 = objc_msgSend(objc_allocWithZone((Class)BPSZipMany), sel_initWithPublishers_, isa);

    *a6 = v26;
    return;
  }
  v21 = v19;
  v27[0] = v12;
  v35 = MEMORY[0x1E0DEE9D8];
  specialized ContiguousArray.reserveCapacity(_:)();
  if ((v21 & 0x8000000000000000) == 0)
  {
    v27[1] = v7;
    v28 = a4;
    v29 = a6;
    v22 = 0;
    v23 = *(void (**)(uint64_t, uint64_t))(v32 + 24);
    v31 = v33 & 0xC000000000000001;
    do
    {
      if ((_swift_isClassOrObjCExistentialType() & 1) != 0 && v31)
      {
        v24 = _ArrayBuffer._getElementSlowPath(_:)();
        if (v27[0] != 8)
          goto LABEL_15;
        v34 = v24;
        (*(void (**)(char *, uint64_t *, uint64_t))(v11 + 16))(v17, &v34, a3);
        swift_unknownObjectRelease();
      }
      else
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v17, v33+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v22, a3);
      }
      ++v22;
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v17, a3);
      v23(a3, v32);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, a3);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
    while (v21 != v22);
    v20 = v35;
    a4 = v28;
    a6 = v29;
    goto LABEL_11;
  }
  __break(1u);
LABEL_15:
  __break(1u);
}

uint64_t PublisherProtocol.correlate<A, B, C>(_:comparator:correlateHandler:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, _QWORD *a6@<X8>, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t result;
  _QWORD v20[6];

  v13 = (*(uint64_t (**)(uint64_t))(a7 + 24))(a4);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 24))(a5, a8);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a1;
  *(_QWORD *)(v15 + 24) = a2;
  v16 = objc_allocWithZone((Class)BPSCorrelate);
  v20[4] = partial apply for closure #2 in PublisherProtocol.orderedMergeManyAny<A>(with:comparator:);
  v20[5] = v15;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 1107296256;
  v20[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @in_guaranteed Any) -> (@unowned NSComparisonResult);
  v20[3] = &block_descriptor_54_0;
  v17 = _Block_copy(v20);
  swift_retain();
  v18 = objc_msgSend(v16, sel_initWithPrior_current_comparator_correlateHandler_, v13, v14, v17, a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  _Block_release(v17);
  result = swift_release();
  *a6 = v18;
  return result;
}

uint64_t closure #1 in PublisherProtocol.orderedMergeAny<A>(with:comparator:)(_QWORD *a1, _QWORD *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  v5 = _bridgeAnythingToObjectiveC<A>(_:)();
  __swift_project_boxed_opaque_existential_0(a2, a2[3]);
  v6 = _bridgeAnythingToObjectiveC<A>(_:)();
  v7 = a3(v5, v6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v7;
}

id PublisherProtocol.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, void *a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, void *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  id result;
  uint64_t v23;

  v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a13 + 24))(a12, a13);
  objc_allocWithZone((Class)BPSHandleEvents);
  outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)a1);
  outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)a3);
  outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)a5);
  outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)a7);
  outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)a10);
  swift_getAssociatedTypeWitness();
  result = @nonobjc BPSHandleEvents.init(upstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)(v23, a1, a2, a3, a4, a5, a6, a7, a8, a10, a11);
  *a9 = result;
  return result;
}

uint64_t PublisherProtocol.buffer(size:prefetch:whenFull:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t result;
  id v11;

  result = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a4, a5);
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v11 = objc_msgSend(objc_allocWithZone((Class)BPSBuffer), sel_initWithUpstream_size_prefetch_whenFull_, result, a1, a2, a3);
    result = swift_unknownObjectRelease();
    *a6 = v11;
  }
  return result;
}

uint64_t PublisherProtocol.compactMap<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  _QWORD *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t result;
  _QWORD v24[6];

  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  v12[5] = a1;
  v12[6] = a2;
  v13 = *(uint64_t (**)(uint64_t, uint64_t))(a5 + 24);
  swift_retain();
  v14 = v13(a3, a5);
  v15 = BPSDemandMax(1);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v19 = type metadata accessor for Publishers.Sequence(0, a4, v17, v18);
  v16[4] = v19;
  v16[5] = a5;
  v16[6] = MEMORY[0x1AF4160D8](&protocol conformance descriptor for Publishers.Sequence<A>, v19);
  v16[7] = partial apply for closure #1 in PublisherProtocol.compactMap<A>(_:);
  v16[8] = v12;
  v20 = objc_allocWithZone((Class)BPSFlatMap);
  v24[4] = partial apply for closure #1 in PublisherProtocol.flatMap<A, B>(_:);
  v24[5] = v16;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 1107296256;
  v24[2] = thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@owned B);
  v24[3] = &block_descriptor_64;
  v21 = _Block_copy(v24);
  swift_retain();
  v22 = objc_msgSend(v20, sel_initWithUpstream_maxPublishers_transform_, v14, v15, v21);
  swift_unknownObjectRelease();
  _Block_release(v21);
  swift_release();
  result = swift_release();
  *a6 = v22;
  return result;
}

void closure #1 in PublisherProtocol.compactMap<A>(_:)(uint64_t (*a1)(void)@<X1>, uint64_t a2@<X4>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSArray v9;
  id v10;
  id v11;

  v5 = a1();
  if (v5)
  {
    v6 = v5;
    getContiguousArrayStorageType<A>(for:)(a2, a2);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1A95AD3C0;
    *(_QWORD *)(v7 + 32) = v6;
    v8 = objc_allocWithZone((Class)BPSSequence);
    swift_unknownObjectRetain();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    v10 = objc_msgSend(v8, sel_initWithSequence_, v9.super.isa);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = objc_allocWithZone((Class)BPSSequence);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    v10 = objc_msgSend(v11, sel_initWithSequence_, v9.super.isa);
  }

  *a3 = v10;
}

void Array<A>.bmPublisher.getter(_QWORD *a1@<X8>)
{
  id v2;
  Class isa;
  id v4;

  v2 = objc_allocWithZone((Class)BPSSequence);
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithSequence_, isa);

  *a1 = v4;
}

id thunk for @escaping @callee_guaranteed (@guaranteed A, @in_guaranteed Any) -> (@owned A)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v4)(uint64_t, _QWORD *);
  void *v5;
  _QWORD v7[4];

  v4 = *(uint64_t (**)(uint64_t, _QWORD *))(a1 + 32);
  v7[3] = MEMORY[0x1E0DEE9B0] + 8;
  v7[0] = a3;
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5 = (void *)v4(a2, v7);
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

id thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@owned B)(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  void *v3;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v3 = (void *)v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @in_guaranteed Any) -> (@unowned NSComparisonResult)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(_QWORD *, _QWORD *);
  uint64_t v6;
  _QWORD v8[4];
  _QWORD v9[4];

  v5 = *(uint64_t (**)(_QWORD *, _QWORD *))(a1 + 32);
  v9[3] = swift_getObjectType();
  v9[0] = a2;
  v8[3] = swift_getObjectType();
  v8[0] = a3;
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = v5(v9, v8);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v6;
}

Class thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@out Date)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  Class isa;
  uint64_t v10;

  v2 = type metadata accessor for Date();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v7 = swift_unknownObjectRetain();
  v6(v7);
  swift_release();
  swift_unknownObjectRelease();
  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return isa;
}

id @nonobjc BPSHandleEvents.init(upstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, void *a8, uint64_t a9, void *a10, uint64_t a11)
{
  void *v11;
  void *v12;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  v12 = v11;
  v19 = MEMORY[0x1E0C809B0];
  if (a2)
  {
    v30 = a2;
    v31 = a3;
    v26 = MEMORY[0x1E0C809B0];
    v27 = 1107296256;
    v28 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
    v29 = &block_descriptor_79;
    v20 = _Block_copy(&v26);
    swift_release();
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v20 = 0;
    if (a4)
    {
LABEL_3:
      v30 = a4;
      v31 = a5;
      v26 = v19;
      v27 = 1107296256;
      v28 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
      v29 = &block_descriptor_76;
      v21 = _Block_copy(&v26);
      swift_release();
      if (a6)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  v21 = 0;
  if (a6)
  {
LABEL_4:
    v30 = a6;
    v31 = a7;
    v26 = v19;
    v27 = 1107296256;
    v28 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
    v29 = &block_descriptor_73;
    v22 = _Block_copy(&v26);
    swift_release();
    v23 = a10;
    if (!a8)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  v22 = 0;
  v23 = a10;
  if (a8)
  {
LABEL_5:
    v30 = a8;
    v31 = a9;
    v26 = v19;
    v27 = 1107296256;
    v28 = thunk for @escaping @callee_guaranteed () -> ();
    v29 = &block_descriptor_70;
    a8 = _Block_copy(&v26);
    swift_release();
  }
LABEL_6:
  if (v23)
  {
    v30 = v23;
    v31 = a11;
    v26 = v19;
    v27 = 1107296256;
    v28 = thunk for @escaping @callee_guaranteed (@unowned BPSDemand) -> ();
    v29 = &block_descriptor_67;
    v23 = _Block_copy(&v26);
    swift_release();
  }
  v24 = objc_msgSend(v12, sel_initWithUpstream_receiveSubscription_receiveOutput_receiveCompletion_receiveCancel_receiveRequest_, a1, v20, v21, v22, a8, v23);
  swift_unknownObjectRelease();
  _Block_release(v23);
  _Block_release(a8);
  _Block_release(v22);
  _Block_release(v21);
  _Block_release(v20);
  return v24;
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned BPSDemand) -> ()(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t getContiguousArrayStorageType<A>(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (swift_isClassType())
    v3 = a2;
  else
    v3 = 0;
  if (v3)
    return __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  else
    return type metadata accessor for _ContiguousArrayStorage();
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1A95A47A8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t partial apply for closure #1 in PublisherProtocol.scan<A>(_:nextPartialResult:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in PublisherProtocol.scan<A>(_:nextPartialResult:)(a1, a2, *(uint64_t (**)(uint64_t))(v2 + 40));
}

uint64_t sub_1A95A4808()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A95A4830()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A95A4858()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in PublisherProtocol.orderedMergeAny<A>(with:comparator:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return closure #1 in PublisherProtocol.orderedMergeAny<A>(with:comparator:)(a1, a2, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t partial apply for closure #1 in PublisherProtocol.orderedMerge<A>(with:comparator:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in PublisherProtocol.orderedMerge<A>(with:comparator:)(a1, a2, *(uint64_t (**)(uint64_t))(v2 + 48));
}

uint64_t outlined copy of (@escaping @callee_guaranteed () -> ())?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void partial apply for closure #1 in PublisherProtocol.compactMap<A>(_:)(_QWORD *a1@<X8>)
{
  uint64_t v1;

  closure #1 in PublisherProtocol.compactMap<A>(_:)(*(uint64_t (**)(void))(v1 + 40), *(_QWORD *)(v1 + 24), a1);
}

uint64_t partial apply for closure #1 in PublisherProtocol.flatMap<A, B>(_:)(uint64_t a1)
{
  uint64_t *v1;

  return closure #1 in PublisherProtocol.flatMap<A, B>(_:)(a1, v1[7], v1[8], v1[2], v1[3], v1[4], v1[5], v1[6]);
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

id BookmarkablePublisher.inner.getter()
{
  return (id)specialized Publishers.HandleEvents.inner.getter();
}

void BookmarkablePublisher.inner.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*BookmarkablePublisher.inner.modify())()
{
  return Publishers.Collect.inner.modify;
}

uint64_t BookmarkablePublisher.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t BookmarkablePublisher.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  objc_class *v7;
  char *v8;
  uint64_t result;
  objc_super v10;

  v7 = (objc_class *)type metadata accessor for BMBookmarkablePublisherImpl(0, a2, a3, a4);
  v8 = (char *)objc_allocWithZone(v7);
  *(_QWORD *)&v8[direct field offset for BMBookmarkablePublisherImpl.inner] = a1;
  v10.receiver = v8;
  v10.super_class = v7;
  objc_msgSendSuper2(&v10, sel_init);
  objc_opt_self();
  result = swift_dynamicCastObjCClassUnconditional();
  *a5 = result;
  return result;
}

{
  objc_class *v7;
  char *v8;
  uint64_t result;
  objc_super v10;

  v7 = (objc_class *)type metadata accessor for BMBookmarkablePublisherImpl(0, a2, a3, a4);
  v8 = (char *)objc_allocWithZone(v7);
  *(_QWORD *)&v8[direct field offset for BMBookmarkablePublisherImpl.inner] = a1;
  v10.receiver = v8;
  v10.super_class = v7;
  objc_msgSendSuper2(&v10, sel_init);
  objc_opt_self();
  result = swift_dynamicCastObjCClassUnconditional();
  *a5 = result;
  return result;
}

id protocol witness for PublisherProtocol.inner.getter in conformance BookmarkablePublisher<A>()
{
  return (id)specialized Publishers.HandleEvents.inner.getter();
}

id BMBookmarkablePublisherImpl.subscribe(_:)(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + direct field offset for BMBookmarkablePublisherImpl.inner), sel_subscribe_, a1);
}

void @objc BMBookmarkablePublisherImpl.subscribe(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;

  swift_unknownObjectRetain();
  v5 = a1;
  BMBookmarkablePublisherImpl.subscribe(_:)(a3);
  swift_unknownObjectRelease();

}

Class @objc BMBookmarkablePublisherImpl.bookmarkableUpstreams.getter(void *a1)
{
  id v1;
  uint64_t v2;
  NSArray v3;

  v1 = a1;
  v2 = BMBookmarkablePublisherImpl.bookmarkableUpstreams.getter();

  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for BPSPublisher);
    v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }
  return v3.super.isa;
}

uint64_t BMBookmarkablePublisherImpl.bookmarkableUpstreams.getter()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*(id *)(v0 + direct field offset for BMBookmarkablePublisherImpl.inner), sel_bookmarkableUpstreams);
  if (!v1)
    return 0;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for BPSPublisher);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id static BMBookmarkablePublisherImpl.publisher(with:upstreams:bookmarkState:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *ObjCClassFromMetadata;
  Class isa;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  objc_super v13;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for BPSPublisher);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v10 = (objc_class *)(*MEMORY[0x1E0DEEDD8] & *(_QWORD *)type metadata accessor for BMBookmarkablePublisherImpl(0, *(_QWORD *)(v3 + 80), v8, v9));
  v13.receiver = ObjCClassFromMetadata;
  v13.super_class = v10;
  v11 = objc_msgSendSuper2(&v13, sel_publisherWithPublisher_upstreams_bookmarkState_, a1, isa, a3);

  return v11;
}

id @objc static BMBookmarkablePublisherImpl.publisher(with:upstreams:bookmarkState:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  id v8;
  id v9;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for BPSPublisher);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  v8 = a3;
  swift_unknownObjectRetain();
  v9 = static BMBookmarkablePublisherImpl.publisher(with:upstreams:bookmarkState:)((uint64_t)v8, v7, a5);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id BMBookmarkablePublisherImpl.withBookmark(_:)(uint64_t a1)
{
  uint64_t v1;

  return objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                               + direct field offset for BMBookmarkablePublisherImpl.inner), sel_withBookmark_, a1));
}

id @objc BMBookmarkablePublisherImpl.withBookmark(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  id v6;

  swift_unknownObjectRetain();
  v5 = a1;
  v6 = BMBookmarkablePublisherImpl.withBookmark(_:)(a3);
  swift_unknownObjectRelease();

  return v6;
}

Swift::Bool __swiftcall BMBookmarkablePublisherImpl.canStoreInternalStateInBookmark()()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + direct field offset for BMBookmarkablePublisherImpl.inner), sel_canStoreInternalStateInBookmark);
}

BOOL @objc BMBookmarkablePublisherImpl.canStoreInternalStateInBookmark()(void *a1)
{
  id v1;
  Swift::Bool v2;

  v1 = a1;
  v2 = BMBookmarkablePublisherImpl.canStoreInternalStateInBookmark()();

  return v2;
}

Swift::Bool __swiftcall BMBookmarkablePublisherImpl.canStorePassThroughValueInBookmark()()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + direct field offset for BMBookmarkablePublisherImpl.inner), sel_canStorePassThroughValueInBookmark);
}

BOOL @objc BMBookmarkablePublisherImpl.canStorePassThroughValueInBookmark()(void *a1)
{
  id v1;
  Swift::Bool v2;

  v1 = a1;
  v2 = BMBookmarkablePublisherImpl.canStorePassThroughValueInBookmark()();

  return v2;
}

void @objc BMBookmarkablePublisherImpl.init()()
{
  specialized BMBookmarkablePublisherImpl.init()();
}

id BMBookmarkablePublisherImpl.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for BMBookmarkablePublisherImpl(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x50), a3, a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t @objc BMBookmarkablePublisherImpl.__ivar_destroyer()
{
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for BMBookmarkablePublisherImpl(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BMBookmarkablePublisherImpl);
}

uint64_t instantiation function for generic protocol witness table for BookmarkablePublisher<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1AF4160D8](&protocol conformance descriptor for BookmarkablePublisher<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for BookmarkablePublisher(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BookmarkablePublisher);
}

uint64_t type metadata completion function for BMBookmarkablePublisherImpl()
{
  return swift_initClassMetadata2();
}

void specialized BMBookmarkablePublisherImpl.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void __getBMDSLSubscribeOnClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BiomeDSLLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BPSSink.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBMDSLSubscribeOnClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDSLSubscribeOnClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BPSSink.m"), 22, CFSTR("Unable to find class %s"), "BMDSLSubscribeOn");

  __break(1u);
}

void __getBMDSLSubscribeOnClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BiomeDSLLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BPSDrivableSink.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBMDSLSubscribeOnClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDSLSubscribeOnClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BPSDrivableSink.m"), 22, CFSTR("Unable to find class %s"), "BMDSLSubscribeOn");

  __break(1u);
}

void BPSDemandMax_cold_1()
{
  __assert_rtn("BPSDemandMax", "BPSDemand.m", 17, "value >= 0");
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x1E0CB06B8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEADA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1E0CB1AC0]();
}

uint64_t static Array._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB1AD0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t type metadata accessor for _ContiguousArrayStorage()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x1E0DED5F0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
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

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1E0D82BF8]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1E0D82C00]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
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

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1E0D82E48]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x1E0D82E50]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x1E0D82E58]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x1E0D82E60]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x1E0D82E68]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x1E0D82E70]();
}

uint64_t PBRepeatedUInt32Set()
{
  return MEMORY[0x1E0D82E78]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _PASMurmur3_x86_32()
{
  return MEMORY[0x1E0D81728]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __biome_log_for_category()
{
  return MEMORY[0x1E0D01D58]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

