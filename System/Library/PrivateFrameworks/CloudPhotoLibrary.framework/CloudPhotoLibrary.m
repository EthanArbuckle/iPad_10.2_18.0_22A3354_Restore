id __CPLManagerOSLogDomain()
{
  if (__CPLManagerOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLManagerOSLogDomain_onceToken, &__block_literal_global_505);
  return (id)__CPLManagerOSLogDomain_result;
}

void sub_1B03C6A4C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B03C6A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
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

void sub_1B03C6C3C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B03C6C50(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B03C6F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  id *v23;
  id *v24;
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_1B03C7C58(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B03C7C6C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void _unregisterConnectedLibraryManager(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  _connectedLibraryManagerRegisterQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___unregisterConnectedLibraryManager_block_invoke;
  block[3] = &unk_1E60D65B8;
  v5 = v1;
  v3 = v1;
  dispatch_sync(v2, block);

}

void sub_1B03C9EEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id _connectedLibraryManagerRegisterQueue()
{
  if (_connectedLibraryManagerRegisterQueue_onceToken != -1)
    dispatch_once(&_connectedLibraryManagerRegisterQueue_onceToken, &__block_literal_global_507);
  return (id)_connectedLibraryManagerRegisterQueue_queue;
}

uint64_t ___registerConnectedLibraryManager_block_invoke(uint64_t a1)
{
  return objc_msgSend((id)_connectedLibraryManagers_unprotected, "addObject:", *(_QWORD *)(a1 + 32));
}

void ___connectedLibraryManagerRegisterQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.cpl.connectedlibrarymanagers", 0);
  v1 = (void *)_connectedLibraryManagerRegisterQueue_queue;
  _connectedLibraryManagerRegisterQueue_queue = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = (void *)_connectedLibraryManagers_unprotected;
  _connectedLibraryManagers_unprotected = (uint64_t)v2;

}

uint64_t ___unregisterConnectedLibraryManager_block_invoke(uint64_t a1)
{
  return objc_msgSend((id)_connectedLibraryManagers_unprotected, "removeObject:", *(_QWORD *)(a1 + 32));
}

void ___connectedLibraryManagers_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend((id)_connectedLibraryManagers_unprotected, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL OUTLINED_FUNCTION_1(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_2()
{
  uint64_t v0;

  return v0;
}

id __CPLProxyPullSessionOSLogDomain()
{
  if (__CPLProxyPullSessionOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLProxyPullSessionOSLogDomain_onceToken, &__block_literal_global_0);
  return (id)__CPLProxyPullSessionOSLogDomain_result;
}

void __cpl_dispatch_async_block_invoke_0(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLProxyPushSessionOSLogDomain()
{
  if (__CPLProxyPushSessionOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLProxyPushSessionOSLogDomain_onceToken, &__block_literal_global_1);
  return (id)__CPLProxyPushSessionOSLogDomain_result;
}

void __cpl_dispatch_async_block_invoke_1(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLSessionOSLogDomain()
{
  if (__CPLSessionOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLSessionOSLogDomain_onceToken, &__block_literal_global_2);
  return (id)__CPLSessionOSLogDomain_result;
}

void __cpl_dispatch_async_block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_1B03E369C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 + 64), 8);
  _Unwind_Resume(a1);
}

id __CPLStorageOSLogDomain()
{
  if (__CPLStorageOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken, &__block_literal_global_195);
  return (id)__CPLStorageOSLogDomain_result;
}

void sub_1B03EA2F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B03EA8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B03EB20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_1B03EBDB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

id __CPLStorageOSLogDomain_186()
{
  if (__CPLStorageOSLogDomain_onceToken_188 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_188, &__block_literal_global_189);
  return (id)__CPLStorageOSLogDomain_result_190;
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

void sub_1B03EC0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B03EC8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B03ED058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___initializePredictionTypes_block_invoke()
{
  void *v0;
  id v1;
  id v2;
  id *v3;
  id *v4;
  id *v5;
  id *v6;
  id *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CPLTransferSpeedFormatter *v13;

  v13 = objc_alloc_init(CPLTransferSpeedFormatter);
  -[CPLTransferSpeedFormatter byteCountFormatter](v13, "byteCountFormatter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[_CPLSyncSessionPredictionType initWithType:formatter:]((id *)[_CPLSyncSessionPredictionType alloc], CFSTR("uploadSize"), v0);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v3, CFSTR("uploadSize"));
  objc_msgSend(v2, "addObject:", v3);

  v4 = -[_CPLSyncSessionPredictionType initWithType:formatter:]((id *)[_CPLSyncSessionPredictionType alloc], CFSTR("largestResource"), v0);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v4, CFSTR("largestResource"));
  objc_msgSend(v2, "addObject:", v4);

  v5 = -[_CPLSyncSessionPredictionType initWithType:formatter:]((id *)[_CPLSyncSessionPredictionType alloc], CFSTR("derivativesSpeed"), v13);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v5, CFSTR("derivativesSpeed"));
  objc_msgSend(v2, "addObject:", v5);

  v6 = -[_CPLSyncSessionPredictionType initWithType:formatter:]((id *)[_CPLSyncSessionPredictionType alloc], CFSTR("largeDerivativesSpeed"), v13);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v6, CFSTR("largeDerivativesSpeed"));
  objc_msgSend(v2, "addObject:", v6);

  v7 = -[_CPLSyncSessionPredictionType initWithType:formatter:]((id *)[_CPLSyncSessionPredictionType alloc], CFSTR("uploadSpeed"), v13);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v7, CFSTR("uploadSpeed"));
  objc_msgSend(v2, "addObject:", v7);

  v8 = -[_CPLSyncSessionPredictionType initWithType:formatter:]((id *)[_CPLSyncSessionPredictionType alloc], CFSTR("downloadSize"), v0);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v8, CFSTR("downloadSize"));
  objc_msgSend(v2, "addObject:", v8);

  v9 = objc_msgSend(v1, "copy");
  v10 = (void *)_predictionTypes;
  _predictionTypes = v9;

  v11 = objc_msgSend(v2, "copy");
  v12 = (void *)_orderedPredictionTypes;
  _orderedPredictionTypes = v11;

}

uint64_t __Block_byref_object_copy__329(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__330(uint64_t a1)
{

}

void sub_1B03ED9DC(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B03ED9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B03EDAB8(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B03EDACC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B03EDB88(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B03EDB9C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B03EDD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t CPLRampingResponseResourceReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
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
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_39;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            v22 = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_41:
        *(_QWORD *)(a1 + 8) = v22;
      }
      else if ((_DWORD)v17 == 2)
      {
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 28) |= 2u;
        while (1)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            break;
          v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
          *(_QWORD *)(a2 + v29) = v30 + 1;
          v28 |= (unint64_t)(v31 & 0x7F) << v26;
          if ((v31 & 0x80) == 0)
            goto LABEL_43;
          v26 += 7;
          v14 = v27++ >= 9;
          if (v14)
          {
            v28 = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_45:
        *(_BYTE *)(a1 + 24) = v28 != 0;
      }
      else if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v18;

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

id __CPLTaskOSLogDomain()
{
  if (__CPLTaskOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken, &__block_literal_global_425);
  return (id)__CPLTaskOSLogDomain_result;
}

id __CPLStorageOSLogDomain_487()
{
  if (__CPLStorageOSLogDomain_onceToken_489 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_489, &__block_literal_global_490);
  return (id)__CPLStorageOSLogDomain_result_491;
}

void sub_1B03F0E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a69;

  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

id __CPLTaskOSLogDomain_584()
{
  if (__CPLTaskOSLogDomain_onceToken_587 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_587, &__block_literal_global_588);
  return (id)__CPLTaskOSLogDomain_result_589;
}

id __CPLStoreOSLogDomain_2635()
{
  if (__CPLStoreOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLStoreOSLogDomain_onceToken, &__block_literal_global_848);
  return (id)__CPLStoreOSLogDomain_result;
}

void sub_1B03F5914(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int buf, __int128 a14)
{
  void *v14;
  id v15;
  NSObject *v16;

  if (a2 == 1)
  {
    v15 = objc_begin_catch(a1);
    if ((objc_msgSend(v14, "_handleException:", v15) & 1) != 0)
    {

      objc_end_catch();
      JUMPOUT(0x1B03F56F4);
    }
    if (!_CPLSilentLogging)
    {
      __CPLTransactionOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        buf = 138412546;
        WORD2(a14) = 2112;
        *(_QWORD *)((char *)&a14 + 6) = v15;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "! %@ raised an exception %@", (uint8_t *)&buf, 0x16u);
      }

    }
    objc_exception_throw(objc_retainAutorelease(v15));
  }
  _Unwind_Resume(a1);
}

void sub_1B03F6828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B03F69FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B03F6D1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B03F770C(void *a1)
{
  uint64_t v1;

  objc_begin_catch(a1);
  *(_BYTE *)(v1 + 42) = 0;
  objc_exception_rethrow();
}

void sub_1B03F771C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B03FAF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__640(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__641(uint64_t a1)
{

}

void sub_1B03FC4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_644(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_1B03FCA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B03FD268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLTransactionOSLogDomain()
{
  if (__CPLTransactionOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLTransactionOSLogDomain_onceToken, &__block_literal_global_850);
  return (id)__CPLTransactionOSLogDomain_result;
}

void sub_1B03FF374(void *a1, int a2)
{
  uint64_t v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v4 = 1;
  if (a2 != 1)
    JUMPOUT(0x1B03FF55CLL);
  v5 = objc_begin_catch(a1);
  if ((objc_msgSend(*(id *)(v13 + 32), "_handleException:", v5) & 1) != 0)
  {
LABEL_14:

    objc_end_catch();
    if ((v4 & 1) != 0)
      JUMPOUT(0x1B03FE32CLL);
    JUMPOUT(0x1B03FDFE8);
  }
  if (v3)
  {
    if (_CPLSilentLogging)
    {
      v9 = CFSTR("failed to re-inject batch");
      goto LABEL_13;
    }
    v6 = __CPLStoreOSLogDomain_2635();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "batch"));
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Re-injecting %@ raised an exception: %@", (uint8_t *)&v14, 0x16u);

    }
    v9 = CFSTR("failed to re-inject batch");
  }
  else
  {
    if (_CPLSilentLogging)
    {
      v9 = CFSTR("failed to decode extracted batch at launch");
      goto LABEL_13;
    }
    v10 = __CPLStoreOSLogDomain_2635();
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Failed to decode extracted batch at launch: %@", (uint8_t *)&v14, 0xCu);
    }
    v9 = CFSTR("failed to decode extracted batch at launch");
  }

LABEL_13:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLResetTracker currentTracker](CPLResetTracker, "currentTracker"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "likelyResetReasonWithImmediateReason:", v9));
  v4 = objc_msgSend(*(id *)(v13 + 32), "resetLocalSyncStateWithCause:error:", v12, v2);
  +[CPLResetTracker discardTracker:](CPLResetTracker, "discardTracker:", v11);

  goto LABEL_14;
}

void sub_1B03FF54C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t CPLIsInTestReadonlyMode()
{
  void *v0;

  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    CPLIsInTestReadonlyMode__readOnlyMode = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPLTestReadOnlyMode"));

  }
  return CPLIsInTestReadonlyMode__readOnlyMode;
}

void _CPLStoreFailure(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("CPLAssertStoreException"), v1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

void _CPLBaseRecordViewFailure(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __objc2_meth_list **p_class_meths;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  +[CPLEngineStoreTransaction currentTransaction](CPLEngineStoreTransaction, "currentTransaction");
  objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopeIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scopes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scopeWithIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  p_class_meths = &OBJC_PROTOCOL___CPLNetworkWatcherDelegate.class_meths;
  if (!v10)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "baseStorageView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v50 = v14;
        v51 = 2112;
        v52 = v4;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_ERROR, "No base record in %@ to apply %@ on - missing scope", buf, 0x16u);

      }
    }
    v15 = CFSTR("missing scope");
    goto LABEL_7;
  }
  v48 = v3;
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v48, "baseStorageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v50 = v17;
      v51 = 2112;
      v52 = v4;
      v53 = 2112;
      v54 = v10;
      _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "No base record in %@ to apply %@ on - scope: %@", buf, 0x20u);

    }
  }
  +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", objc_msgSend(v10, "scopeType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v18);

  objc_msgSend(v8, "flagsForScope:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v19, "arrayDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsJoinedByString:", CFSTR("|"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("flags: %@"), v22);
  objc_msgSend(v11, "addObject:", v23);

  v24 = objc_msgSend(v10, "localIndex");
  if (v24 != objc_msgSend(v6, "scopeIndex") && objc_msgSend(v6, "scopeIndex"))
  {
    v37 = objc_msgSend(v10, "cloudIndex");
    if (v37 != objc_msgSend(v6, "scopeIndex"))
    {
      v38 = objc_msgSend(v10, "cloudIndex");
      v39 = CFSTR("invalid index from reset sync");
      v3 = v48;
      if (v38 <= objc_msgSend(v6, "scopeIndex"))
      {
        v40 = objc_msgSend(v10, "localIndex");
        if (v40 <= objc_msgSend(v6, "scopeIndex"))
          v39 = CFSTR("invalid index");
      }
      objc_msgSend(v11, "addObject:", v39);

      p_class_meths = &OBJC_PROTOCOL___CPLNetworkWatcherDelegate.class_meths;
      goto LABEL_39;
    }
    v28 = objc_msgSend(v6, "copy");
    v26 = 0;
    v3 = v48;
    p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CPLNetworkWatcherDelegate + 32);
  }
  else
  {
    objc_msgSend(v5, "idMapping");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v6, "copy");
    buf[0] = 0;
    objc_msgSend(v25, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v26, buf);
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = v27;
      v30 = CFSTR("in ID mapping");
    }
    else
    {
      v28 = objc_msgSend(v6, "copy");
      objc_msgSend(v25, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v28, buf);
      v29 = objc_claimAutoreleasedReturnValue();

      if (v29)
        v30 = CFSTR("conflicting ID mapping");
      else
        v30 = CFSTR("no ID mapping");
      v26 = (void *)v29;
    }
    p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CPLNetworkWatcherDelegate + 32);
    objc_msgSend(v11, "addObject:", v30);

    v3 = v48;
  }

  if (v28)
  {
    objc_msgSend(v9, "recordWithScopedIdentifier:isFinal:", v28, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordWithScopedIdentifier:isFinal:", v28, 1);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    v34 = CFSTR("in cloud cache");
    if (!v32)
      v34 = CFSTR("delete staged in cloud cache");
    v35 = CFSTR("not in cloud cache");
    if (v32)
      v35 = CFSTR("staged in cloud cache");
    if (v31)
      v36 = v34;
    else
      v36 = v35;
    objc_msgSend(v11, "addObject:", v36);

    p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CPLNetworkWatcherDelegate + 32);
  }
  if (v26 && objc_msgSend(v9, "hasRecordAcknowledgedByClientWithScopedIdentifier:", v26))
  {
    v15 = CFSTR("acknowledged by client");
LABEL_7:
    objc_msgSend(v11, "addObject:", v15);
  }
LABEL_39:
  if (!objc_msgSend(v11, "count"))
    objc_msgSend(v11, "addObject:", CFSTR("no context"));
  if (!*((_BYTE *)p_class_meths + 3376))
  {
    __CPLStoreOSLogDomain_2635();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("/"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v42;
      _os_log_impl(&dword_1B03C2000, v41, OS_LOG_TYPE_ERROR, "Context: %@", buf, 0xCu);

    }
  }
  v43 = objc_alloc(MEMORY[0x1E0CB3940]);
  v44 = objc_opt_class();
  objc_msgSend(v3, "redactedDescription");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("/"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR("missing base %@ in %@ (%@)"), v44, v45, v46);

  _CPLStoreFailure(v47);
}

uint64_t __Block_byref_object_copy__841(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__842(uint64_t a1)
{

}

id __CPLStorageOSLogDomain_864()
{
  if (__CPLStorageOSLogDomain_onceToken_873 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_873, &__block_literal_global_874);
  return (id)__CPLStorageOSLogDomain_result_875;
}

void sub_1B0402B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0402C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__957(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__958(uint64_t a1)
{

}

void sub_1B04034F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B0403648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B0403DC4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B0403DD8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B0404024(_Unwind_Exception *exception_object, int a2)
{
  os_unfair_lock_s *v2;

  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B0404044(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B0404050(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1B040405CLL);
}

void sub_1B0404170(_Unwind_Exception *exception_object, int a2)
{
  os_unfair_lock_s *v2;

  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B04042BC(_Unwind_Exception *exception_object, int a2)
{
  os_unfair_lock_s *v2;

  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B0404504(_Unwind_Exception *exception_object, int a2)
{
  os_unfair_lock_s *v2;

  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B0404524(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B0404530(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1B040453CLL);
}

void sub_1B0404994(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B04049A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0404A70(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B0404A84(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B0404B64(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B0404B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0404C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0404D24(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B0404D38(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B0404E20(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B0404E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0404EFC(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B0404F10(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B0404FEC(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B0405000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0405114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B040523C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0405338(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B040534C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0405908(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B040591C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B04059FC(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B0405A10(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B0405AA4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B0405AB8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B0405B7C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B0405B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0405CAC(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B0405CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0405DB4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B0405DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1106(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1107(uint64_t a1)
{

}

id __CPLSchedulerOSLogDomain()
{
  if (__CPLSchedulerOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLSchedulerOSLogDomain_onceToken, &__block_literal_global_1111);
  return (id)__CPLSchedulerOSLogDomain_result;
}

void sub_1B04071C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B040749C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B040789C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLTaskOSLogDomain_1243()
{
  if (__CPLTaskOSLogDomain_onceToken_1262 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_1262, &__block_literal_global_101);
  return (id)__CPLTaskOSLogDomain_result_1263;
}

uint64_t __Block_byref_object_copy__1245(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1246(uint64_t a1)
{

}

void sub_1B040804C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_1267(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_1B0408E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

id __CPLBatchOSLogDomain()
{
  if (__CPLBatchOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLBatchOSLogDomain_onceToken, &__block_literal_global_1370);
  return (id)__CPLBatchOSLogDomain_result;
}

uint64_t CPLRampingRequestReadFrom(void *a1, uint64_t a2)
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
  CPLRampingRequestResource *v17;
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
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(CPLRampingRequestResource);
        objc_msgSend(a1, "addRequest:", v17);
        if (!PBReaderPlaceMark() || (CPLRampingRequestResourceReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

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

id __CPLObserverOSLogDomain()
{
  if (__CPLObserverOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLObserverOSLogDomain_onceToken, &__block_literal_global_1613);
  return (id)__CPLObserverOSLogDomain_result;
}

void __cpl_dispatch_async_block_invoke_1672(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLNetworkOSLogDomain()
{
  if (__CPLNetworkOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLNetworkOSLogDomain_onceToken, &__block_literal_global_1728);
  return (id)__CPLNetworkOSLogDomain_result;
}

uint64_t CPLRequestClient()
{
  uint64_t result;

  result = _requestBlock;
  if (_requestBlock)
    return (*(uint64_t (**)(void))(_requestBlock + 16))();
  return result;
}

void CPLRequestClientSetRequestBlock(void *a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "copy");
  v2 = (void *)_requestBlock;
  _requestBlock = v1;

}

void cpllogGreenTeaSetCallerBundleIdentifier(id obj)
{
  objc_storeStrong((id *)&callerBundleIdentifier, obj);
}

void cpllogGreenTeaWithFormat(void *a1, int a2, void *a3)
{
  cpllogGreenTea(a1, a2, a3);
}

void cpllogGreenTea(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a1;
  v6 = a3;
  v8 = objc_retainAutorelease(v5);
  objc_msgSend(v8, "UTF8String");
  if (a2)
    ct_green_tea_logger_create();
  else
    ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    os_log_with_args();
  }
  if (a2)
    ct_green_tea_logger_destroy();

}

void cpllogGreenTeaReadingPhotosOrVideos()
{
  void *v0;
  __CFString *v1;
  id v2;

  v0 = (void *)callerBundleIdentifier;
  if (callerBundleIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v1 = CFSTR("%@ [Photos] : Reading photos or videos");
  }
  else
  {
    if (_prepareLog_onceToken != -1)
      dispatch_once(&_prepareLog_onceToken, &__block_literal_global_1760);
    v0 = (void *)bundleIdentifier;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v1 = CFSTR("%@ <%@>[Photos][%@] : Reading photos or videos");
  }
  cpllogGreenTeaWithFormat(v0, 0, v1);

}

void ___prepareLog_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)bundleIdentifier;
  bundleIdentifier = v0;

  objc_msgSend(v7, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)applicationName;
  applicationName = v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)processName;
  processName = v5;

}

void cpllogGreenTeaTransmittingPhotosOrVideos()
{
  void *v0;
  __CFString *v1;
  id v2;

  v0 = (void *)callerBundleIdentifier;
  if (callerBundleIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v1 = CFSTR("%@ [Photos] : Transmitting photos or videos");
  }
  else
  {
    if (_prepareLog_onceToken != -1)
      dispatch_once(&_prepareLog_onceToken, &__block_literal_global_1760);
    v0 = (void *)bundleIdentifier;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v1 = CFSTR("%@ <%@>[Photos][%@] : Transmitting photos or videos");
  }
  cpllogGreenTeaWithFormat(v0, 0, v1);

}

void sub_1B0410750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04109E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04116E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

id __CPLStorageOSLogDomain_1882()
{
  if (__CPLStorageOSLogDomain_onceToken_1884 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_1884, &__block_literal_global_1885);
  return (id)__CPLStorageOSLogDomain_result_1886;
}

uint64_t __Block_byref_object_copy__1899(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1900(uint64_t a1)
{

}

id __CPLItemOSLogDomain()
{
  if (__CPLItemOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLItemOSLogDomain_onceToken, &__block_literal_global_227);
  return (id)__CPLItemOSLogDomain_result;
}

uint64_t __Block_byref_object_copy__2317(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2318(uint64_t a1)
{

}

id __CPLTaskOSLogDomain_2369()
{
  if (__CPLTaskOSLogDomain_onceToken_2371 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_2371, &__block_literal_global_2372);
  return (id)__CPLTaskOSLogDomain_result_2373;
}

void sub_1B041603C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2381(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2382(uint64_t a1)
{

}

id __CPLEngineOSLogDomain()
{
  if (__CPLEngineOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLEngineOSLogDomain_onceToken, &__block_literal_global_2619);
  return (id)__CPLEngineOSLogDomain_result;
}

const char *_CPLOSLogSubsystem()
{
  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  return "com.apple.photos.cpl";
}

id __CPLStoreOSLogDomain()
{
  if (__CPLStoreOSLogDomain_onceToken_2636 != -1)
    dispatch_once(&__CPLStoreOSLogDomain_onceToken_2636, &__block_literal_global_2);
  return (id)__CPLStoreOSLogDomain_result_2637;
}

id __CPLQOSOSLogDomain()
{
  if (__CPLQOSOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLQOSOSLogDomain_onceToken, &__block_literal_global_4);
  return (id)__CPLQOSOSLogDomain_result;
}

const __CFString *__CPLVersion()
{
  return CFSTR("CloudPhotoLibrary-702.0.230");
}

id __CPLBuildVersion()
{
  return (id)MGCopyAnswer();
}

id __CPLEnvironmentDictionary()
{
  __CFString *v0;
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v0 = (__CFString *)MGCopyAnswer();
  v1 = (__CFString *)MGCopyAnswer();
  v2 = (__CFString *)MGCopyAnswer();
  v3 = (__CFString *)MGCopyAnswer();
  v4 = (__CFString *)MGCopyAnswer();
  v5 = MGCopyAnswer();
  v6 = (void *)v5;
  v7 = CFSTR("Unknown");
  if (v1)
    v8 = v1;
  else
    v8 = CFSTR("Unknown");
  v15[0] = CFSTR("ProductName");
  v15[1] = CFSTR("ProductVersion");
  if (v2)
    v9 = v2;
  else
    v9 = CFSTR("Unknown");
  v16[0] = v8;
  v16[1] = v9;
  if (v0)
    v10 = v0;
  else
    v10 = CFSTR("Unknown");
  v15[2] = CFSTR("BuildVersion");
  v15[3] = CFSTR("DeviceType");
  if (v3)
    v11 = v3;
  else
    v11 = CFSTR("Unknown");
  v16[2] = v10;
  v16[3] = v11;
  if (v4)
    v12 = v4;
  else
    v12 = CFSTR("Unknown");
  v15[4] = CFSTR("DeviceName");
  v15[5] = CFSTR("DeviceUDID");
  if (v5)
    v7 = (const __CFString *)v5;
  v16[4] = v12;
  v16[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __CPLGenericOSLogDomain()
{
  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  return (id)_CPLGenericLog;
}

uint64_t __CPLShouldLogQOS()
{
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  return __CPLShouldLogQOS_debugQOS;
}

const __CFString *CPLCurrentQOS()
{
  qos_class_t v0;

  v0 = qos_class_self();
  if ((int)v0 > 20)
  {
    switch(v0)
    {
      case QOS_CLASS_DEFAULT:
        return CFSTR("Default");
      case QOS_CLASS_USER_INITIATED:
        return CFSTR("UserInitiated");
      case QOS_CLASS_USER_INTERACTIVE:
        return CFSTR("UserInteractive");
    }
  }
  else
  {
    switch(v0)
    {
      case QOS_CLASS_UNSPECIFIED:
        return CFSTR("Unspecified");
      case QOS_CLASS_BACKGROUND:
        return CFSTR("Background");
      case QOS_CLASS_UTILITY:
        return CFSTR("Utility");
    }
  }
  return CFSTR("Unknown");
}

void _CPLExit(int a1)
{
  exit(a1);
}

void _CPLAbort()
{
  sleep(2u);
  abort();
}

uint64_t CPLFaceAnalysisReadFrom(_BYTE *a1, uint64_t a2)
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
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  CPLFaceInstance *v24;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
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
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        a1[36] |= 1u;
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
            goto LABEL_35;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_37:
        a1[32] = v19 != 0;
        goto LABEL_38;
      case 2u:
        v24 = objc_alloc_init(CPLFaceInstance);
        objc_msgSend(a1, "addFaceInstances:", v24);
        goto LABEL_31;
      case 3u:
        v24 = objc_alloc_init(CPLFaceInstance);
        objc_msgSend(a1, "addPetFaceInstances:", v24);
        goto LABEL_31;
      case 4u:
        v24 = objc_alloc_init(CPLFaceInstance);
        objc_msgSend(a1, "addTorsoFaceInstances:", v24);
LABEL_31:
        if (PBReaderPlaceMark() && (CPLFaceInstanceReadFrom((char *)v24, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_38:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_38;
    }
  }
}

void sub_1B041A55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2826(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2827(uint64_t a1)
{

}

id __CPLPushSessionOSLogDomain()
{
  if (__CPLPushSessionOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLPushSessionOSLogDomain_onceToken, &__block_literal_global_158);
  return (id)__CPLPushSessionOSLogDomain_result;
}

BOOL CPLMomentSharePreviewDataReadFrom(char *a1, uint64_t a2)
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
  void *v17;
  uint64_t v18;
  uint64_t v19;

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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(a1, "addPreviewImageData:", v17);
          goto LABEL_28;
        case 2u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 8;
LABEL_25:
          v17 = *(void **)&a1[v19];
          *(_QWORD *)&a1[v19] = v18;
          goto LABEL_28;
        case 4u:
          PBReaderReadString();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(a1, "addCuratedAssetIdentifiers:", v17);
LABEL_28:

          goto LABEL_29;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_29:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B041CC14(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B041CC28(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id __CPLStrategyOSLogDomain()
{
  if (__CPLStrategyOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLStrategyOSLogDomain_onceToken, &__block_literal_global_163);
  return (id)__CPLStrategyOSLogDomain_result;
}

id CPLIgnoredDateForRecord(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a2;
  objc_msgSend(a1, "recordModificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordModificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
    {
      objc_msgSend(v7, "laterDate:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v7;
    }
  }
  else
  {
    if (v8)
      v10 = v8;
    else
      v10 = v5;
    v9 = v10;
  }
  v11 = v9;
  objc_msgSend(v5, "earlierDate:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t _nilGenerator_block_invoke()
{
  return MEMORY[0x1E0C9AA60];
}

BOOL CPLMemoryAssetReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v17;
  uint64_t v18;
  CPLMemoryAssetFlag *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
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
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_27;
      case 2u:
        v19 = objc_alloc_init(CPLMemoryAssetFlag);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && CPLMemoryAssetFlagReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_27;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
LABEL_27:
        v19 = *(CPLMemoryAssetFlag **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;
        goto LABEL_28;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_29;
    }
  }
}

BOOL CPLMarkDownloadedResourceWithDynamicVersion(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;
  int v8;
  _BOOL8 v9;
  uint64_t value;

  v5 = a1;
  v6 = v5;
  if (a2)
  {
    value = a2;
    v7 = objc_retainAutorelease(v5);
    v8 = setxattr((const char *)objc_msgSend(v7, "fileSystemRepresentation"), "com.apple.cpl.dynamicVersion", &value, 8uLL, 0, 0);
    v9 = v8 == 0;
    if (a3 && v8)
    {
      +[CPLErrors posixErrorForURL:](CPLErrors, "posixErrorForURL:", v7);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t CPLGetDynamicVersionForDownloadResource(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  ssize_t v6;
  uint64_t v7;
  uint64_t value;

  value = 0;
  v5 = objc_retainAutorelease(a1);
  v6 = getxattr((const char *)objc_msgSend(v5, "fileSystemRepresentation"), "com.apple.cpl.dynamicVersion", &value, 8uLL, 0, 0);
  if (v6 == 8)
  {
    *a2 = value;
LABEL_6:
    v7 = 1;
    goto LABEL_7;
  }
  if ((v6 & 0x8000000000000000) == 0 || *__error() == 93)
  {
    *a2 = 0;
    goto LABEL_6;
  }
  if (a3)
  {
    +[CPLErrors posixErrorForURL:](CPLErrors, "posixErrorForURL:", v5);
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
LABEL_7:

  return v7;
}

uint64_t CPLSocialGroupPersonReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v17;
  void *v18;
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
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

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

void sub_1B042C918(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B042CA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

id __CPLTaskOSLogDomain_4715()
{
  if (__CPLTaskOSLogDomain_onceToken_4718 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_4718, &__block_literal_global_4719);
  return (id)__CPLTaskOSLogDomain_result_4720;
}

void sub_1B042DB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _displayableKey(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;

  v1 = _displayableKey_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_displayableKey_onceToken, &__block_literal_global_268);
  objc_msgSend((id)_displayableKey_displayableKeys, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

void ___displayableKey_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("initial sync");
  v2[1] = CFSTR("initial client download");
  v3[0] = CFSTR("synced");
  v3[1] = CFSTR("fast pass");
  v2[2] = CFSTR("initial mingle");
  v2[3] = CFSTR("initial shared metadata download");
  v3[2] = CFSTR("mingle");
  v3[3] = CFSTR("shared metadata");
  v2[4] = CFSTR("initial metadata queries");
  v2[5] = CFSTR("initial metadata download");
  v3[4] = CFSTR("queries");
  v3[5] = CFSTR("metadata");
  v2[6] = CFSTR("activation");
  v3[6] = CFSTR("activation");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_displayableKey_displayableKeys;
  _displayableKey_displayableKeys = v0;

}

void sub_1B04331A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4959(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4960(uint64_t a1)
{

}

id __CPLStorageOSLogDomain_5316()
{
  if (__CPLStorageOSLogDomain_onceToken_5318 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_5318, &__block_literal_global_5319);
  return (id)__CPLStorageOSLogDomain_result_5320;
}

void sub_1B043A73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5522(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5523(uint64_t a1)
{

}

void sub_1B043D3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5707(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5708(uint64_t a1)
{

}

void __valueForDictionaryOfCounts_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v5, "integerValue"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

uint64_t _statusDidChange(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_statusDidChange");
}

void __cpl_dispatch_async_block_invoke_5746(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLStatusOSLogDomain()
{
  if (__CPLStatusOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLStatusOSLogDomain_onceToken, &__block_literal_global_5787);
  return (id)__CPLStatusOSLogDomain_result;
}

BOOL CPLServerFeedbackKeyAndValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
        break;
      if (v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
LABEL_22:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void __cpl_dispatch_async_block_invoke_6092(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLTaskOSLogDomain_6094()
{
  if (__CPLTaskOSLogDomain_onceToken_6106 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_6106, &__block_literal_global_6107);
  return (id)__CPLTaskOSLogDomain_result_6108;
}

uint64_t _CPLCutoffDate()
{
  void *v0;
  double v1;
  double v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "doubleForKey:", CFSTR("CPLIgnoredRecordsExpirationInterval"));
  v2 = v1;

  v3 = 3600.0;
  if (v2 != 0.0)
    v3 = v2;
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v3);
}

void sub_1B0445894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04459D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6163(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6164(uint64_t a1)
{

}

void sub_1B044A080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B044A344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_1B044BB20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_6369(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLSchedulerOSLogDomain_6445()
{
  if (__CPLSchedulerOSLogDomain_onceToken_6446 != -1)
    dispatch_once(&__CPLSchedulerOSLogDomain_onceToken_6446, &__block_literal_global_483);
  return (id)__CPLSchedulerOSLogDomain_result_6447;
}

uint64_t __Block_byref_object_copy__6491(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6492(uint64_t a1)
{

}

void ___decentNextSessionDate_block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "doubleForKey:", CFSTR("CPLSecondSessionCoalescingInterval"));
  _decentNextSessionDate_secondSessionCoalescingInterval = v1;

  if (*(double *)&_decentNextSessionDate_secondSessionCoalescingInterval < 0.100000001)
    _decentNextSessionDate_secondSessionCoalescingInterval = 0x4034000000000000;
}

void sub_1B0455F58(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_1B0456684(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

id __CPLStorageOSLogDomain_6732()
{
  if (__CPLStorageOSLogDomain_onceToken_6734 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_6734, &__block_literal_global_288_6735);
  return (id)__CPLStorageOSLogDomain_result_6736;
}

void __cpl_dispatch_async_block_invoke_6746(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t __Block_byref_object_copy__6773(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6774(uint64_t a1)
{

}

void sub_1B0459894(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t CPLAccountFlagsReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
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
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_49;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            v26 = 0;
            goto LABEL_51;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
        if (*(_BYTE *)(a2 + *v5))
          v26 = 0;
LABEL_51:
        *(_QWORD *)(a1 + 8) = v26;
      }
      else if ((_DWORD)v17 == 2)
      {
        v30 = 0;
        v31 = 0;
        v32 = 0;
        *(_BYTE *)(a1 + 24) |= 2u;
        while (1)
        {
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            break;
          v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
          *(_QWORD *)(a2 + v33) = v34 + 1;
          v32 |= (unint64_t)(v35 & 0x7F) << v30;
          if ((v35 & 0x80) == 0)
            goto LABEL_53;
          v30 += 7;
          v14 = v31++ >= 9;
          if (v14)
          {
            LODWORD(v32) = 0;
            goto LABEL_55;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v32) = 0;
LABEL_55:
        *(_DWORD *)(a1 + 16) = v32;
      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 24) |= 4u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_45;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_47;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_47:
        *(_BYTE *)(a1 + 20) = v20 != 0;
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

void sub_1B045C568(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B045C57C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B045C6E4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B045C6F8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B045C7E8(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B045C7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B045C8C4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B045C8D8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B045C9C0(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B045C9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7115(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7116(uint64_t a1)
{

}

void sub_1B045E900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0461B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

id __CPLStorageOSLogDomain_7377()
{
  if (__CPLStorageOSLogDomain_onceToken_7384 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_7384, &__block_literal_global_477);
  return (id)__CPLStorageOSLogDomain_result_7385;
}

id _ClassesForInitialQueries(uint64_t a1)
{
  id v2;

  if (_ClassesForInitialQueries_onceToken != -1)
    dispatch_once(&_ClassesForInitialQueries_onceToken, &__block_literal_global_479);
  if ((unint64_t)(a1 - 1) > 2)
    v2 = (id)MEMORY[0x1E0C9AA60];
  else
    v2 = (id)*off_1E60D9438[a1 - 1];
  return v2;
}

id __CPLSessionOSLogDomain_0()
{
  if (__CPLSessionOSLogDomain_onceToken_0 != -1)
    dispatch_once(&__CPLSessionOSLogDomain_onceToken_0, &__block_literal_global_7658);
  return (id)__CPLSessionOSLogDomain_result_0;
}

id __CPLStorageOSLogDomain_7755()
{
  if (__CPLStorageOSLogDomain_onceToken_7760 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_7760, &__block_literal_global_7761);
  return (id)__CPLStorageOSLogDomain_result_7762;
}

id __CPLStorageOSLogDomain_7905()
{
  if (__CPLStorageOSLogDomain_onceToken_7907 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_7907, &__block_literal_global_109);
  return (id)__CPLStorageOSLogDomain_result_7908;
}

id __CPLStorageOSLogDomain_8093()
{
  if (__CPLStorageOSLogDomain_onceToken_8095 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_8095, &__block_literal_global_163_8096);
  return (id)__CPLStorageOSLogDomain_result_8097;
}

id __CPLProgressOSLogDomain()
{
  if (__CPLProgressOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLProgressOSLogDomain_onceToken, &__block_literal_global_8313);
  return (id)__CPLProgressOSLogDomain_result;
}

void sub_1B0471EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  uint64_t v56;

  _Block_object_dispose(&a56, 8);
  _Block_object_dispose((const void *)(v56 - 176), 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_8407(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLDerivativesOSLogDomain()
{
  if (__CPLDerivativesOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLDerivativesOSLogDomain_onceToken, &__block_literal_global_235);
  return (id)__CPLDerivativesOSLogDomain_result;
}

uint64_t __Block_byref_object_copy__8410(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8411(uint64_t a1)
{

}

id _shortDescriptionForArrayOfCPLResourceTypes(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v1 = (objc_class *)MEMORY[0x1E0C99DE8];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___shortDescriptionForArrayOfCPLResourceTypes_block_invoke;
  v7[3] = &unk_1E60D99E8;
  v8 = v3;
  v4 = v3;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v7);

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void ___shortDescriptionForArrayOfCPLResourceTypes_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", objc_msgSend(a2, "unsignedIntegerValue"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void sub_1B047380C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0473DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0474788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CPLDefaultConfigurationDictionaryUniquifier_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8628;
  v15 = __Block_byref_object_dispose__8629;
  v16 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = CPLDefaultConfigurationDictionaryUniquifier_block_invoke_2;
  v8 = &unk_1E60DC8A0;
  v2 = v16;
  v9 = v2;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock((os_unfair_lock_t)&_mostRecentConfigurationDictionaryLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_mostRecentConfigurationDictionaryLock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

void sub_1B0474CB4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&_mostRecentConfigurationDictionaryLock);
  objc_exception_rethrow();
}

void sub_1B0474CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8628(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8629(uint64_t a1)
{

}

void CPLDefaultConfigurationDictionaryUniquifier_block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  BOOL v4;
  void *v5;
  id obj;

  WeakRetained = objc_loadWeakRetained(&_mostRecentConfigurationDictionary);
  if (WeakRetained != *(id *)(a1 + 32))
  {
    obj = WeakRetained;
    if (WeakRetained)
    {
      v3 = objc_msgSend(WeakRetained, "compare:");
      if (!v3)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
        goto LABEL_10;
      }
      v4 = v3 == -1;
      WeakRetained = obj;
      if (!v4)
        goto LABEL_11;
      v5 = *(void **)(a1 + 32);
    }
    else
    {
      v5 = *(void **)(a1 + 32);
    }
    objc_storeWeak(&_mostRecentConfigurationDictionary, v5);
LABEL_10:
    WeakRetained = obj;
  }
LABEL_11:

}

void __cpl_dispatch_async_block_invoke_8710(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLConfigurationOSLogDomain()
{
  if (__CPLConfigurationOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLConfigurationOSLogDomain_onceToken, &__block_literal_global_169);
  return (id)__CPLConfigurationOSLogDomain_result;
}

id _CPLConfigurationDefaultURL()
{
  if (_CPLConfigurationDefaultURL_onceToken != -1)
    dispatch_once(&_CPLConfigurationDefaultURL_onceToken, &__block_literal_global_8732);
  return (id)_CPLConfigurationDefaultURL_url;
}

uint64_t CPLRampingRequestResourceReadFrom(uint64_t a1, uint64_t a2)
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
            v21 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_33:
        *(_QWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
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

id CPLPrimaryScopeIdentifierForCurrentUniverse()
{
  if (CPLPrimaryScopeIdentifierForCurrentUniverse_onceToken != -1)
    dispatch_once(&CPLPrimaryScopeIdentifierForCurrentUniverse_onceToken, &__block_literal_global_21);
  return (id)CPLPrimaryScopeIdentifierForCurrentUniverse_result;
}

id CPLCurrentUniverseName()
{
  if (CPLCurrentUniverseName_onceToken != -1)
    dispatch_once(&CPLCurrentUniverseName_onceToken, &__block_literal_global_17_9244);
  return (id)CPLCurrentUniverseName_result;
}

__CFString *CPLPrimaryScopeIdentifierForUniverseName(void *a1)
{
  objc_class *v1;
  id v2;
  __CFString *v3;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x1E0CB3940];
    v2 = a1;
    v3 = (__CFString *)objc_msgSend([v1 alloc], "initWithFormat:", CFSTR("%@%@"), CFSTR("TestSync-"), v2);

  }
  else
  {
    v3 = CFSTR("PrimarySync");
  }
  return v3;
}

id CPLMainScopeIdentifierForApp(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = a1;
  v6 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%@%@-%@"), CFSTR("AppLibrarySync-"), v5, v4);

  return v6;
}

id CPLAllLibraryScopeIdentifierPrefixes()
{
  if (CPLAllLibraryScopeIdentifierPrefixes_onceToken != -1)
    dispatch_once(&CPLAllLibraryScopeIdentifierPrefixes_onceToken, &__block_literal_global_9312);
  return (id)CPLAllLibraryScopeIdentifierPrefixes_result;
}

__CFString *CPLSharingScopePrefixForScopeWithIdentifier(void *a1)
{
  id v1;
  __CFString *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PrimarySync")) & 1) != 0)
  {
    v2 = CFSTR("SharedSync-");
  }
  else if (objc_msgSend(v1, "hasPrefix:", CFSTR("TestSync-"))
         && (CPLUniverseNameFromMainScopeIdentifier(v1), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@-"), CFSTR("TestSharedSync-"), v3);

  }
  else
  {
    v2 = CFSTR("BogusSharedSync-");
  }

  return v2;
}

id CPLUniverseNameFromMainScopeIdentifier(void *a1)
{
  id v1;
  unint64_t v2;
  unint64_t v3;
  void *v4;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PrimarySync")) & 1) != 0
    || objc_msgSend(v1, "rangeOfString:", CFSTR("TestSync-"))
    || (v3 = v2, v2 >= objc_msgSend(v1, "length")))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v1, "substringWithRange:", v3, objc_msgSend(v1, "length") - v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __CPLStorageOSLogDomain_9628()
{
  if (__CPLStorageOSLogDomain_onceToken_9637 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_9637, &__block_literal_global_9638);
  return (id)__CPLStorageOSLogDomain_result_9639;
}

void sub_1B047DE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9654(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9655(uint64_t a1)
{

}

id __CPLStorageOSLogDomain_9704()
{
  if (__CPLStorageOSLogDomain_onceToken_9707 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_9707, &__block_literal_global_9708);
  return (id)__CPLStorageOSLogDomain_result_9709;
}

void sub_1B047EFA4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B047EFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B047F0F8(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B047F10C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B047F1A8(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B047F1BC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B047FB88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B047FE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B04806C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B0480F10(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_9881(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLTaskOSLogDomain_9885()
{
  if (__CPLTaskOSLogDomain_onceToken_9916 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_9916, &__block_literal_global_9917);
  return (id)__CPLTaskOSLogDomain_result_9918;
}

uint64_t __Block_byref_object_copy__9931(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9932(uint64_t a1)
{

}

void sub_1B0482734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B0483BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CPLSocialGroupPersonListReadFrom(uint64_t a1, uint64_t a2)
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
  CPLSocialGroupPerson *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
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
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_33;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(CPLSocialGroupPerson);
        objc_msgSend((id)a1, "addPerson:", v17);
        if (!PBReaderPlaceMark() || (CPLSocialGroupPersonReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

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

void __cpl_dispatch_async_block_invoke_10471(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLManagerOSLogDomain_0()
{
  if (__CPLManagerOSLogDomain_onceToken_0 != -1)
    dispatch_once(&__CPLManagerOSLogDomain_onceToken_0, &__block_literal_global_693);
  return (id)__CPLManagerOSLogDomain_result_0;
}

uint64_t __Block_byref_object_copy__10661(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10662(uint64_t a1)
{

}

void _statusDidChange_10665(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "weakLibraryManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_statusDidChange");

}

void _configurationDidChange(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "weakLibraryManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_configurationDidChange");

}

void sub_1B0493A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04947B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CPLLibraryIdentifierForApp(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = a1;
  v6 = [v3 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@%@]-%@"), CPLAppLibraryIdentifierPrefix, v5, v4);

  return v7;
}

__CFString *CPLBundleIdentifierForLibraryIdentifier(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  __CFString *v7;

  v1 = a1;
  if (!objc_msgSend(v1, "hasPrefix:", CPLAppLibraryIdentifierPrefix)
    || (v2 = objc_msgSend((id)CPLAppLibraryIdentifierPrefix, "length"),
        v3 = objc_msgSend(v1, "length"),
        v4 = objc_msgSend(v1, "rangeOfString:options:range:", CFSTR("]"), 0, v2, v3 - objc_msgSend((id)CPLAppLibraryIdentifierPrefix, "length")), v4 == 0x7FFFFFFFFFFFFFFFLL)|| (v5 = v4, v4 <= objc_msgSend((id)CPLAppLibraryIdentifierPrefix, "length")))
  {
    v7 = CFSTR("com.apple.mobileslideshow");
  }
  else
  {
    v6 = objc_msgSend((id)CPLAppLibraryIdentifierPrefix, "length");
    objc_msgSend(v1, "substringWithRange:", v6, v5 - objc_msgSend((id)CPLAppLibraryIdentifierPrefix, "length"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void sub_1B0496268(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 + 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B04978C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CPLIsDynamicResourceFingerprint(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("#"));
}

void sub_1B0498328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0498408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLCodingOSLogDomain()
{
  if (__CPLCodingOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLCodingOSLogDomain_onceToken, &__block_literal_global_224);
  return (id)__CPLCodingOSLogDomain_result;
}

uint64_t __Block_byref_object_copy__11416(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11417(uint64_t a1)
{

}

void _CPLAllowCrossPlatformBoolDecoding()
{
  NSObject *v0;
  objc_class *v1;
  objc_method *InstanceMethod;
  void (*Implementation)(void);
  const char *TypeEncoding;
  objc_class *v5;
  objc_method *v6;
  void (*v7)(void);
  const char *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if ((_hasSetupCrossPlatformBoolDecoding & 1) == 0)
  {
    _hasSetupCrossPlatformBoolDecoding = 1;
    if (objc_msgSend(MEMORY[0x1E0CB3710], "instancesRespondToSelector:", sel___setError_))
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v0 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v0, OS_LOG_TYPE_DEFAULT, "Enabling cross platform BOOL decoding", buf, 2u);
        }

      }
      v1 = (objc_class *)objc_opt_class();
      InstanceMethod = class_getInstanceMethod(v1, sel__cplDecodeBoolForKey_);
      Implementation = method_getImplementation(InstanceMethod);
      TypeEncoding = method_getTypeEncoding(InstanceMethod);
      class_addMethod(v1, sel_cplDecodeBoolForKey_, Implementation, TypeEncoding);
      v5 = (objc_class *)objc_opt_class();
      v6 = class_getInstanceMethod(v5, sel__cplDecodeCharForKey_);
      v7 = method_getImplementation(v6);
      v8 = method_getTypeEncoding(v6);
      class_addMethod(v5, sel_cplDecodeCharForKey_, v7, v8);
    }
    else if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Can't enable cross platform BOOL decoding", v10, 2u);
      }

    }
  }
}

uint64_t CPLSuggestionMemoryReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  void *v31;
  uint64_t v32;

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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_37;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_41:
          v32 = 32;
          goto LABEL_46;
        case 3u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          break;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_37:
          v31 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          break;
        v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
        *(_QWORD *)(a2 + v28) = v29 + 1;
        v22 |= (unint64_t)(v30 & 0x7F) << v26;
        if ((v30 & 0x80) == 0)
          goto LABEL_43;
        v26 += 7;
        v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_45;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_45:
      v32 = 16;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B04A0920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;

  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11905(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11906(uint64_t a1)
{

}

void sub_1B04A11D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

id CPLStepAllChanges(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scopeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "allChangesWithScopeIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id CPLStepNew(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "extractionClass");
  objc_msgSend(v1, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "allChangesWithClass:scopeIdentifier:changeType:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id CPLStepDeleted(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "extractionClass");
  objc_msgSend(v1, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "allChangesWithClass:scopeIdentifier:changeType:", v3, v4, 1024);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id CPLStepNotDeleted(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "extractionClass");
  objc_msgSend(v1, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "allNonDeletedChangesWithClass:scopeIdentifier:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t CPLFaceInstanceReadFrom(char *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t result;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  int *v39;
  int *v40;
  int *v41;
  void *v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = &OBJC_IVAR___CPLEnginePushRepository__lastUploadRateUpdateDate;
    v8 = &OBJC_IVAR___CPLEnginePushRepository__lastUploadRateUpdateDate;
    v9 = (int *)MEMORY[0x1E0D82BB8];
    v10 = &OBJC_IVAR___CPLEnginePushRepository__lastUploadRateUpdateDate;
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
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
          v19 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v19 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v13 = 0;
LABEL_14:
      if (v19 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = v7[620];
          v23 = *(void **)&a1[v22];
          *(_QWORD *)&a1[v22] = v21;

          continue;
        case 2u:
          *(_WORD *)&a1[v8[621]] |= 0x10u;
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v64 = v10[622];
          goto LABEL_95;
        case 3u:
          *(_WORD *)&a1[v8[621]] |= 0x20u;
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v64 = 48;
          goto LABEL_95;
        case 4u:
          *(_WORD *)&a1[v8[621]] |= 0x40u;
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v64 = 56;
          goto LABEL_95;
        case 5u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_WORD *)&a1[v8[621]] |= 0x100u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v36);
              *(_QWORD *)(a2 + v35) = v37;
              v34 |= (unint64_t)(v38 & 0x7F) << v32;
              if (v38 < 0)
              {
                v32 += 7;
                v18 = v33++ >= 9;
                if (v18)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v34) = 0;
LABEL_71:
          v63 = 68;
          goto LABEL_80;
        case 6u:
          v39 = v10;
          v40 = v8;
          v41 = v7;
          PBReaderReadString();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
            objc_msgSend(a1, "addRejectedPersonIdentifiers:", v42);

          v7 = v41;
          v8 = v40;
          v10 = v39;
          continue;
        case 7u:
          v43 = 0;
          v44 = 0;
          v34 = 0;
          *(_WORD *)&a1[v8[621]] |= 0x200u;
          while (2)
          {
            v45 = *v3;
            v46 = *(_QWORD *)(a2 + v45);
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v46);
              *(_QWORD *)(a2 + v45) = v47;
              v34 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                v18 = v44++ >= 9;
                if (v18)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v34) = 0;
LABEL_75:
          v63 = 72;
          goto LABEL_80;
        case 8u:
          v49 = 0;
          v50 = 0;
          v34 = 0;
          *(_WORD *)&a1[v8[621]] |= 0x80u;
          break;
        case 9u:
          *(_WORD *)&a1[v8[621]] |= 1u;
          v55 = *v3;
          v56 = *(_QWORD *)(a2 + v55);
          if (v56 <= 0xFFFFFFFFFFFFFFF7 && v56 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v56);
            *(_QWORD *)(a2 + v55) = v56 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v64 = 8;
          goto LABEL_95;
        case 0xAu:
          *(_WORD *)&a1[v8[621]] |= 2u;
          v57 = *v3;
          v58 = *(_QWORD *)(a2 + v57);
          if (v58 <= 0xFFFFFFFFFFFFFFF7 && v58 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v58);
            *(_QWORD *)(a2 + v57) = v58 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v64 = 16;
          goto LABEL_95;
        case 0xBu:
          *(_WORD *)&a1[v8[621]] |= 8u;
          v59 = *v3;
          v60 = *(_QWORD *)(a2 + v59);
          if (v60 <= 0xFFFFFFFFFFFFFFF7 && v60 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v60);
            *(_QWORD *)(a2 + v59) = v60 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v64 = 32;
          goto LABEL_95;
        case 0xCu:
          *(_WORD *)&a1[v8[621]] |= 4u;
          v61 = *v3;
          v62 = *(_QWORD *)(a2 + v61);
          if (v62 <= 0xFFFFFFFFFFFFFFF7 && v62 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v62);
            *(_QWORD *)(a2 + v61) = v62 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v64 = 24;
LABEL_95:
          *(_QWORD *)&a1[v64] = v27;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v51 = *v3;
        v52 = *(_QWORD *)(a2 + v51);
        v53 = v52 + 1;
        if (v52 == -1 || v53 > *(_QWORD *)(a2 + *v4))
          break;
        v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v52);
        *(_QWORD *)(a2 + v51) = v53;
        v34 |= (unint64_t)(v54 & 0x7F) << v49;
        if ((v54 & 0x80) == 0)
          goto LABEL_77;
        v49 += 7;
        v18 = v50++ >= 9;
        if (v18)
        {
          LODWORD(v34) = 0;
          goto LABEL_79;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_77:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v34) = 0;
LABEL_79:
      v63 = 64;
LABEL_80:
      *(_DWORD *)&a1[v63] = v34;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B04A481C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1B04A4A74(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B04A4FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04A5214(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B04A533C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B04A54F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id __CPLTaskOSLogDomain_12177()
{
  if (__CPLTaskOSLogDomain_onceToken_12179 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_12179, &__block_literal_global_12180);
  return (id)__CPLTaskOSLogDomain_result_12181;
}

void __cpl_dispatch_async_block_invoke_12187(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t __Block_byref_object_copy__12200(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12201(uint64_t a1)
{

}

void sub_1B04A6CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04A88CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04A8C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12365(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12366(uint64_t a1)
{

}

void __cpl_dispatch_async_block_invoke_12510(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_1B04AA9A4(_Unwind_Exception *exception_object, int a2)
{
  os_unfair_lock_s *v2;

  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B04AAA9C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B04AAAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04AAB88(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B04AAB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_12578(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLTaskOSLogDomain_12581()
{
  if (__CPLTaskOSLogDomain_onceToken_12583 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_12583, &__block_literal_global_82);
  return (id)__CPLTaskOSLogDomain_result_12584;
}

void sub_1B04AC8D8(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x228], 8);
  _Unwind_Resume(a1);
}

void sub_1B04AFDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B04B0550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1B04B18E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13081(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13082(uint64_t a1)
{

}

void sub_1B04B31DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B04B3A74(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;

  if (a2 == 1)
  {
    v12 = objc_begin_catch(a1);
    if (!_CPLSilentLogging)
    {
      __CPLArchiverOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "allObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543618;
        *(_QWORD *)((char *)&buf + 4) = v15;
        WORD6(buf) = 2112;
        *(_QWORD *)((char *)&buf + 14) = v12;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_ERROR, "Data for (%{public}@) was corrupt: %@", (uint8_t *)&buf, 0x16u);

      }
    }

    objc_end_catch();
    JUMPOUT(0x1B04B3A2CLL);
  }
  _Unwind_Resume(a1);
}

id __CPLArchiverOSLogDomain()
{
  if (__CPLArchiverOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLArchiverOSLogDomain_onceToken, &__block_literal_global_13247);
  return (id)__CPLArchiverOSLogDomain_result;
}

id __CPLFileWatcherOSLogDomain()
{
  if (__CPLFileWatcherOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLFileWatcherOSLogDomain_onceToken, &__block_literal_global_13325);
  return (id)__CPLFileWatcherOSLogDomain_result;
}

BOOL CPLSuggestionAssetFlagReadFrom(uint64_t a1, uint64_t a2)
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
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  int *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
          {
            v24 = &OBJC_IVAR___CPLSuggestionAssetFlag__isRepresentative;
            goto LABEL_38;
          }
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            break;
          v17 += 7;
          v23 = v18++ > 8;
          if (v23)
          {
            v19 = 0;
            v24 = &OBJC_IVAR___CPLSuggestionAssetFlag__isRepresentative;
            goto LABEL_41;
          }
        }
        v24 = &OBJC_IVAR___CPLSuggestionAssetFlag__isRepresentative;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_41:
        *(_BYTE *)(a1 + *v24) = v19 != 0;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v25 = 0;
    v26 = 0;
    v19 = 0;
    *(_BYTE *)(a1 + 12) |= 1u;
    while (1)
    {
      v27 = *v3;
      v28 = *(_QWORD *)(a2 + v27);
      if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
        break;
      v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
      *(_QWORD *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        v24 = &OBJC_IVAR___CPLSuggestionAssetFlag__isKeyAsset;
        goto LABEL_39;
      }
      v25 += 7;
      v23 = v26++ > 8;
      if (v23)
      {
        v19 = 0;
        v24 = &OBJC_IVAR___CPLSuggestionAssetFlag__isKeyAsset;
        goto LABEL_41;
      }
    }
    v24 = &OBJC_IVAR___CPLSuggestionAssetFlag__isKeyAsset;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id __CPLTaskOSLogDomain_13504()
{
  if (__CPLTaskOSLogDomain_onceToken_13512 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_13512, &__block_literal_global_13513);
  return (id)__CPLTaskOSLogDomain_result_13514;
}

void __cpl_dispatch_async_block_invoke_13582(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t __Block_byref_object_copy__13591(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13592(uint64_t a1)
{

}

BOOL CPLSuggestionAssetReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v17;
  uint64_t v18;
  CPLSuggestionAssetFlag *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
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
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_27;
      case 2u:
        v19 = objc_alloc_init(CPLSuggestionAssetFlag);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (PBReaderPlaceMark() && CPLSuggestionAssetFlagReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
        goto LABEL_27;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
LABEL_27:
        v19 = *(CPLSuggestionAssetFlag **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;
        goto LABEL_28;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_29;
    }
  }
}

BOOL CPLMemoryAssetFlagReadFrom(uint64_t a1, uint64_t a2)
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
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  int *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  unint64_t v53;
  char v54;

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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 16) |= 0x20u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isRepresentative;
              goto LABEL_77;
            }
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              break;
            v17 += 7;
            v23 = v18++ > 8;
            if (v23)
            {
              v19 = 0;
              v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isRepresentative;
              goto LABEL_80;
            }
          }
          v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isRepresentative;
          goto LABEL_78;
        case 2u:
          v25 = 0;
          v26 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 16) |= 1u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isCurated;
              goto LABEL_77;
            }
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              v23 = v26++ > 8;
              if (v23)
              {
                v19 = 0;
                v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isCurated;
                goto LABEL_80;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isCurated;
          goto LABEL_78;
        case 3u:
          v30 = 0;
          v31 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 16) |= 0x10u;
          while (2)
          {
            v32 = *v3;
            v33 = *(_QWORD *)(a2 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isMovieCurated;
              goto LABEL_77;
            }
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              v23 = v31++ > 8;
              if (v23)
              {
                v19 = 0;
                v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isMovieCurated;
                goto LABEL_80;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isMovieCurated;
          goto LABEL_78;
        case 4u:
          v35 = 0;
          v36 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 16) |= 8u;
          while (2)
          {
            v37 = *v3;
            v38 = *(_QWORD *)(a2 + v37);
            if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isKeyAsset;
              goto LABEL_77;
            }
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 1;
            v19 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              v23 = v36++ > 8;
              if (v23)
              {
                v19 = 0;
                v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isKeyAsset;
                goto LABEL_80;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isKeyAsset;
          goto LABEL_78;
        case 5u:
          v40 = 0;
          v41 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 16) |= 4u;
          while (2)
          {
            v42 = *v3;
            v43 = *(_QWORD *)(a2 + v42);
            if (v43 == -1 || v43 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isExtendedCurated;
              goto LABEL_77;
            }
            v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
            *(_QWORD *)(a2 + v42) = v43 + 1;
            v19 |= (unint64_t)(v44 & 0x7F) << v40;
            if (v44 < 0)
            {
              v40 += 7;
              v23 = v41++ > 8;
              if (v23)
              {
                v19 = 0;
                v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isExtendedCurated;
                goto LABEL_80;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isExtendedCurated;
          goto LABEL_78;
        case 6u:
          v45 = 0;
          v46 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 16) |= 0x40u;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isUserCurated;
              goto LABEL_77;
            }
            v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
            *(_QWORD *)(a2 + v47) = v48 + 1;
            v19 |= (unint64_t)(v49 & 0x7F) << v45;
            if (v49 < 0)
            {
              v45 += 7;
              v23 = v46++ > 8;
              if (v23)
              {
                v19 = 0;
                v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isUserCurated;
                goto LABEL_80;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isUserCurated;
          goto LABEL_78;
        case 7u:
          v50 = 0;
          v51 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 16) |= 2u;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            continue;
          return 0;
      }
      while (1)
      {
        v52 = *v3;
        v53 = *(_QWORD *)(a2 + v52);
        if (v53 == -1 || v53 >= *(_QWORD *)(a2 + *v4))
          break;
        v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
        *(_QWORD *)(a2 + v52) = v53 + 1;
        v19 |= (unint64_t)(v54 & 0x7F) << v50;
        if ((v54 & 0x80) == 0)
        {
          v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isCustomUserAsset;
          goto LABEL_78;
        }
        v50 += 7;
        v23 = v51++ > 8;
        if (v23)
        {
          v19 = 0;
          v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isCustomUserAsset;
          goto LABEL_80;
        }
      }
      v24 = &OBJC_IVAR___CPLMemoryAssetFlag__isCustomUserAsset;
LABEL_77:
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_78:
      if (*(_BYTE *)(a2 + *v5))
        v19 = 0;
LABEL_80:
      *(_BYTE *)(a1 + *v24) = v19 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B04BFE9C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x3D0], 8);
  _Unwind_Resume(a1);
}

id __CPLSessionOSLogDomain_14133()
{
  if (__CPLSessionOSLogDomain_onceToken_14177 != -1)
    dispatch_once(&__CPLSessionOSLogDomain_onceToken_14177, &__block_literal_global_197);
  return (id)__CPLSessionOSLogDomain_result_14178;
}

void sub_1B04C0E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14246(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14247(uint64_t a1)
{

}

void sub_1B04C282C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04C3590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04C427C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1B04C4A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1B04C5060(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1B04C55F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1B04C5C6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x278], 8);
  _Block_object_dispose((const void *)(v1 - 216), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B04C5FB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B04C655C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1B04C6850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 160), 8);
  _Block_object_dispose((const void *)(v12 - 128), 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_14500(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLLibraryOSLogDomain()
{
  if (__CPLLibraryOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLLibraryOSLogDomain_onceToken, &__block_literal_global_649);
  return (id)__CPLLibraryOSLogDomain_result;
}

id __CPLInitialDownloadOSLogDomain()
{
  if (__CPLInitialDownloadOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLInitialDownloadOSLogDomain_onceToken, &__block_literal_global_655);
  return (id)__CPLInitialDownloadOSLogDomain_result;
}

uint64_t __Block_byref_object_copy__14519(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14520(uint64_t a1)
{

}

id __CPLBackupOSLogDomain()
{
  if (__CPLBackupOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLBackupOSLogDomain_onceToken, &__block_literal_global_653);
  return (id)__CPLBackupOSLogDomain_result;
}

void sub_1B04CC160(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id __CPLDataRecoveryOSLogDomain()
{
  if (__CPLDataRecoveryOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLDataRecoveryOSLogDomain_onceToken, &__block_literal_global_651);
  return (id)__CPLDataRecoveryOSLogDomain_result;
}

void sub_1B04D2368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04D25E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04D2D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04D4F18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id __CPLTaskOSLogDomain_14898()
{
  if (__CPLTaskOSLogDomain_onceToken_14904 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_14904, &__block_literal_global_147);
  return (id)__CPLTaskOSLogDomain_result_14905;
}

void sub_1B04D58B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_14959(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t __Block_byref_object_copy__14982(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14983(uint64_t a1)
{

}

void __cpl_dispatch_async_block_invoke_15285(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLFeedbackOSLogDomain()
{
  if (__CPLFeedbackOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLFeedbackOSLogDomain_onceToken, &__block_literal_global_15324);
  return (id)__CPLFeedbackOSLogDomain_result;
}

void sub_1B04DF818(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Unwind_Resume(a1);
}

id __CPLStorageOSLogDomain_15506()
{
  if (__CPLStorageOSLogDomain_onceToken_15508 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_15508, &__block_literal_global_15509);
  return (id)__CPLStorageOSLogDomain_result_15510;
}

uint64_t __Block_byref_object_copy__15533(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15534(uint64_t a1)
{

}

void sub_1B04E176C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&anchorLock);
  objc_exception_rethrow();
}

void sub_1B04E1784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04E18F8(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&anchorLock);
  objc_exception_rethrow();
}

void sub_1B04E1910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke_15726(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLSessionOSLogDomain_15864()
{
  if (__CPLSessionOSLogDomain_onceToken_15869 != -1)
    dispatch_once(&__CPLSessionOSLogDomain_onceToken_15869, &__block_literal_global_149);
  return (id)__CPLSessionOSLogDomain_result_15870;
}

id __CPLFeaturesOSLogDomain()
{
  if (__CPLFeaturesOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLFeaturesOSLogDomain_onceToken, &__block_literal_global_16);
  return (id)__CPLFeaturesOSLogDomain_result;
}

void __cpl_dispatch_async_block_invoke_16158(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLForceSyncOSLogDomain()
{
  if (__CPLForceSyncOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLForceSyncOSLogDomain_onceToken, &__block_literal_global_16162);
  return (id)__CPLForceSyncOSLogDomain_result;
}

uint64_t __Block_byref_object_copy__16267(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16268(uint64_t a1)
{

}

uint64_t BatteryStateChanged(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  if (a3 == -536723200)
    return +[CPLBatteryMonitor _updateBatteryWithBatteryEntry:](CPLBatteryMonitor, "_updateBatteryWithBatteryEntry:", a2);
  return result;
}

BOOL _CPLFacesDataAreAlmostIdentical(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  _BOOL8 v6;
  CPLFaceAnalysisReference *v7;
  CPLFaceAnalysisReference *v8;
  id v9;
  CPLFaceAnalysisReference *v10;
  unint64_t v11;
  BOOL v12;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  v6 = (v3 | v4) == 0;
  if (v3 && v4)
  {
    v7 = -[CPLFaceAnalysisReference initWithData:]([CPLFaceAnalysisReference alloc], "initWithData:", v3);
    v8 = -[CPLFaceAnalysisReference initWithData:]([CPLFaceAnalysisReference alloc], "initWithData:", v5);
    v9 = v7;
    v10 = v8;
    v11 = (unint64_t)v10;
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    v6 = !v12 && (objc_msgSend(v9, "isEqual:", v10) & 1) != 0 || ((unint64_t)v9 | v11) == 0;

  }
  return v6;
}

uint64_t __CPLSupportedFeatureVersion()
{
  return 20;
}

BOOL CPLServerFeedbackResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

uint64_t CPLRampingResponseReadFrom(void *a1, uint64_t a2)
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
  CPLRampingResponseResource *v17;
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
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(CPLRampingResponseResource);
        objc_msgSend(a1, "addResponse:", v17);
        if (!PBReaderPlaceMark() || (CPLRampingResponseResourceReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

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

void __cpl_dispatch_async_block_invoke_16992(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLConfigurationOSLogDomain_17006()
{
  if (__CPLConfigurationOSLogDomain_onceToken_17011 != -1)
    dispatch_once(&__CPLConfigurationOSLogDomain_onceToken_17011, &__block_literal_global_17012);
  return (id)__CPLConfigurationOSLogDomain_result_17013;
}

void sub_1B04ED7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04ED88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04ED970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLCheckOSLogDomain()
{
  if (__CPLCheckOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLCheckOSLogDomain_onceToken, &__block_literal_global_17355);
  return (id)__CPLCheckOSLogDomain_result;
}

void sub_1B04F16BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t CPLUploadCheckRuleFullRecordAlreadyOnServerFunction(void *a1, int a2)
{
  void *v2;

  if (a2)
  {
    objc_msgSend(a1, "change");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "markAsSparseFullChange");

  }
  return 1;
}

uint64_t CPLUploadCheckRuleDropSparseResourcesFunction(void *a1, int a2)
{
  if (!a2)
    return objc_msgSend(a1, "rejectChangeWithReason:error:", CFSTR("sparse resources with no record on server"));
  objc_msgSend(a1, "dropResourceChangeWithReason:", CFSTR("sparse resources"));
  return 1;
}

uint64_t CPLUploadCheckRuleOnlyUploadAddedResourcesFunction(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = a3;
  if (v7)
  {
    objc_msgSend(v6, "change");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "onlyAddedResources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLCheckOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138412546;
          v14 = v7;
          v15 = 2112;
          v16 = v9;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Will append resources to %@:\n%@", (uint8_t *)&v13, 0x16u);
        }

      }
      objc_msgSend(v8, "markToOnlyUploadNewResources");
    }
    else
    {
      objc_msgSend(v6, "dropResourceChangeWithReason:", CFSTR("sparse resources"));
    }

    v11 = 1;
  }
  else
  {
    v11 = objc_msgSend(v6, "rejectChangeWithReason:error:", CFSTR("sparse resources with no record on server"), a4);
  }

  return v11;
}

uint64_t CPLUploadCheckRuleCopyDerivativesFromSourceFunction(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(a1, "change");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "copyDerivativesFromRecordIfPossible:", v5);

    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(a1, "rejectChangeWithReason:error:", CFSTR("source record for copy does not exist on server"), a3);
  }

  return v7;
}

uint64_t CPLUploadCheckRuleDontTrustCloudCacheFunction()
{
  return 1;
}

uint64_t CPLUploadCheckRuleForwardCompatibilityFunction(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a1;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "hasChangeType:", 32))
    {
      objc_msgSend(v6, "realIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(v4, "change");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "copyPropertyBlockForDirection:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v8, "propertiesForChangeType:", 32);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __CPLUploadCheckRuleForwardCompatibilityFunction_block_invoke;
          v12[3] = &unk_1E60DC5A0;
          v14 = v9;
          v13 = v6;
          objc_msgSend(v8, "cplCopyProperties:fromObject:withCopyBlock:", v10, v8, v12);

        }
      }
    }
  }

  return 1;
}

uint64_t CPLUploadCheckRuleAvoidGeneratingDerivativesFunction(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a1;
  v7 = v6;
  if (!a3)
  {
    objc_msgSend(v6, "change");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isAssetChange"))
    {
      objc_msgSend(v9, "adjustments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {

      }
      else if (!+[CPLBeforeUploadCheckItem allowsAssetsWithResourcesButNoAdjustments](CPLBeforeUploadCheckItem, "allowsAssetsWithResourcesButNoAdjustments"))
      {
        v8 = objc_msgSend(v7, "rejectChangeWithReason:error:", CFSTR("unadjusted asset with adjusted resources"), a4);
        goto LABEL_8;
      }
    }
    v8 = 1;
LABEL_8:

    goto LABEL_9;
  }
  v8 = objc_msgSend(v6, "dropGeneratingDerivativesIfPossibleWithRecordOnServer:error:", a3, a4);
LABEL_9:

  return v8;
}

uint64_t CPLUploadCheckRuleAvoidAccidentalUnshareFunction(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    objc_msgSend(a1, "dropSharingChangeWithReason:", CFSTR("avoid accidental unsharing during initial upload"));
  return 1;
}

uint64_t CPLUploadCheckRuleUpdateRecordTargetForSharingChangeFunction()
{
  return 1;
}

uint64_t CPLUploadCheckRuleUpdateRecordTargetDuringResetSyncFunction()
{
  return 1;
}

uint64_t CPLUploadCheckRuleEnsureRelatedRecordIsSharedFunction()
{
  return 1;
}

uint64_t CPLUploadCheckRuleUpdatePushRepositoryPriorityWhenOverQuotaFunction(void *a1)
{
  objc_msgSend(a1, "updatePushRepositoryPriorityWithRecordOnServer:");
  return 1;
}

uint64_t __Block_byref_object_copy__17551(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17552(uint64_t a1)
{

}

void sub_1B04F27C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04F2ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04F3074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04F3CD0(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B04F3CE4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B04F4024(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B04F4038(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id __CPLStorageOSLogDomain_17660()
{
  if (__CPLStorageOSLogDomain_onceToken_17662 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_17662, &__block_literal_global_17663);
  return (id)__CPLStorageOSLogDomain_result_17664;
}

void sub_1B04F44B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17678(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17679(uint64_t a1)
{

}

void sub_1B04F4710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B04F4C78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B04F5DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1B04F7588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1B04F9458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04F9460(_Unwind_Exception *exc_buf, int a2)
{
  os_unfair_lock_s *v2;

  if (a2)
  {
    objc_begin_catch(exc_buf);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exc_buf);
}

void sub_1B04F9480()
{
  objc_end_catch();
  JUMPOUT(0x1B04F9488);
}

void sub_1B04F9498(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1B04F94A4);
}

void sub_1B04FA748(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B04FA75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04FA86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04FA9A0(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B04FA9B4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B04FAB18(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1B04FAB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B04FB414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __CPLSyncOSLogDomain()
{
  if (__CPLSyncOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLSyncOSLogDomain_onceToken, &__block_literal_global_531);
  return (id)__CPLSyncOSLogDomain_result;
}

void __cpl_dispatch_async_block_invoke_18166(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_1B04FD0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18178(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18179(uint64_t a1)
{

}

void sub_1B04FE8C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id __CPLForceSyncOSLogDomain_18271()
{
  if (__CPLForceSyncOSLogDomain_onceToken_18280 != -1)
    dispatch_once(&__CPLForceSyncOSLogDomain_onceToken_18280, &__block_literal_global_535);
  return (id)__CPLForceSyncOSLogDomain_result_18281;
}

id _willDownloadInBackgroundErrorForTask(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "scopeIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsJoinedByString:", CFSTR(", "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 10, CFSTR("Will download %@ in background"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __CPLLastSyncErrorOSLogDomain()
{
  if (__CPLLastSyncErrorOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLLastSyncErrorOSLogDomain_onceToken, &__block_literal_global_533);
  return (id)__CPLLastSyncErrorOSLogDomain_result;
}

void __cpl_dispatch_async_block_invoke_18634(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __CPLTaskOSLogDomain_18636()
{
  if (__CPLTaskOSLogDomain_onceToken_18668 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_18668, &__block_literal_global_111_18669);
  return (id)__CPLTaskOSLogDomain_result_18670;
}

void sub_1B05032B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18678(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18679(uint64_t a1)
{

}

id __CPLStorageOSLogDomain_18809()
{
  if (__CPLStorageOSLogDomain_onceToken_18813 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_18813, &__block_literal_global_18814);
  return (id)__CPLStorageOSLogDomain_result_18815;
}

id __CPLSystemMonitorOSLogDomain()
{
  if (__CPLSystemMonitorOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLSystemMonitorOSLogDomain_onceToken, &__block_literal_global_393);
  return (id)__CPLSystemMonitorOSLogDomain_result;
}

void __cpl_dispatch_async_block_invoke_18977(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

double _CPLSystemMonitorReadOverrideTimeIntervalFromSharedDefaults(void *a1)
{
  __CFString *v1;
  CFIndex AppIntegerValue;
  double result;
  Boolean keyExistsAndHasValidFormat;

  v1 = a1;
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(v1, CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);

  result = (double)(unint64_t)AppIntegerValue;
  if (!keyExistsAndHasValidFormat)
    return 0.0;
  return result;
}

id _CPLSystemMonitorReadOverrideTimeIntervalExpiryDateFromSharedDefaults(void *a1)
{
  __CFString *v1;
  void *v2;

  v1 = a1;
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  v2 = (void *)CFPreferencesCopyAppValue(v1, CFSTR("com.apple.mobileslideshow"));

  return v2;
}

uint64_t _unlimitedSyncOverCellularDidChange(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_permanentDataOverrideHasChanged");
}

void sub_1B050998C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19127(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19128(uint64_t a1)
{

}

void sub_1B050AD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B050BC3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

id __CPLStorageOSLogDomain_19388()
{
  if (__CPLStorageOSLogDomain_onceToken_19392 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_19392, &__block_literal_global_19393);
  return (id)__CPLStorageOSLogDomain_result_19394;
}

uint64_t __Block_byref_object_copy__19398(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19399(uint64_t a1)
{

}

id __CPLStorageOSLogDomain_19619()
{
  if (__CPLStorageOSLogDomain_onceToken_19626 != -1)
    dispatch_once(&__CPLStorageOSLogDomain_onceToken_19626, &__block_literal_global_19627);
  return (id)__CPLStorageOSLogDomain_result_19628;
}

uint64_t CPLMemoryAssetListReadFrom(uint64_t a1, uint64_t a2)
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
  CPLMemoryAsset *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
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
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_33;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(CPLMemoryAsset);
        objc_msgSend((id)a1, "addAsset:", v17);
        if (!PBReaderPlaceMark() || !CPLMemoryAssetReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

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

id __CPLSessionOSLogDomain_19957()
{
  if (__CPLSessionOSLogDomain_onceToken_19959 != -1)
    dispatch_once(&__CPLSessionOSLogDomain_onceToken_19959, &__block_literal_global_19960);
  return (id)__CPLSessionOSLogDomain_result_19961;
}

void __cpl_dispatch_async_block_invoke_20092(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_1B051226C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0512618(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B0512DB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B0513560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B051370C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B051395C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

id __CPLTaskOSLogDomain_20266()
{
  if (__CPLTaskOSLogDomain_onceToken_20273 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_20273, &__block_literal_global_244);
  return (id)__CPLTaskOSLogDomain_result_20274;
}

void __cpl_dispatch_async_block_invoke_20279(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t __Block_byref_object_copy__20328(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20329(uint64_t a1)
{

}

void sub_1B051A518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

uint64_t CPLServerFeedbackMessageReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  CPLServerFeedbackKeyAndValue *v17;
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
        if (v9++ >= 9)
        {
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 & 0x7FFF8) == 8)
      {
        v17 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
        objc_msgSend(a1, "addKeysAndValues:", v17);
        if (!PBReaderPlaceMark() || !CPLServerFeedbackKeyAndValueReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

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

void sub_1B051C6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20597(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20598(uint64_t a1)
{

}

uint64_t CPLSuggestionRecordListReadFrom(uint64_t a1, uint64_t a2)
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
  CPLSuggestionAsset *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
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
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(CPLSuggestionAsset);
        objc_msgSend((id)a1, "addAsset:", v17);
        if (PBReaderPlaceMark() && CPLSuggestionAssetReadFrom((uint64_t)v17, a2))
          goto LABEL_36;
        goto LABEL_43;
      case 2u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 36) |= 1u;
        while (2)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_40:
        *(_DWORD *)(a1 + 32) = v21;
        goto LABEL_41;
      case 3u:
        v17 = objc_alloc_init(CPLSuggestionPerson);
        objc_msgSend((id)a1, "addPerson:", v17);
        if (!PBReaderPlaceMark() || (CPLSuggestionPersonReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_43;
        goto LABEL_36;
      case 4u:
        v17 = objc_alloc_init(CPLSuggestionMemory);
        objc_msgSend((id)a1, "addMemory:", v17);
        if (PBReaderPlaceMark() && (CPLSuggestionMemoryReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_41:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_43:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_41;
    }
  }
}

void sub_1B051F764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLPlatformOSLogDomain()
{
  if (__CPLPlatformOSLogDomain_onceToken != -1)
    dispatch_once(&__CPLPlatformOSLogDomain_onceToken, &__block_literal_global_20824);
  return (id)__CPLPlatformOSLogDomain_result;
}

uint64_t CPLServerFeedbackRequestReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  CPLServerFeedbackMessage *v17;
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
        if (v9++ >= 9)
        {
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 & 0x7FFF8) == 8)
      {
        v17 = objc_alloc_init(CPLServerFeedbackMessage);
        objc_msgSend(a1, "addMessages:", v17);
        if (!PBReaderPlaceMark() || (CPLServerFeedbackMessageReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

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

void sub_1B05231D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void sub_1B052390C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B0524658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __CPLTaskOSLogDomain_21238()
{
  if (__CPLTaskOSLogDomain_onceToken_21245 != -1)
    dispatch_once(&__CPLTaskOSLogDomain_onceToken_21245, &__block_literal_global_347);
  return (id)__CPLTaskOSLogDomain_result_21246;
}

uint64_t __Block_byref_object_copy__21278(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21279(uint64_t a1)
{

}

void __cpl_dispatch_async_block_invoke_21285(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_1B0528708()
{
  objc_end_catch();
  JUMPOUT(0x1B0528710);
}

void sub_1B0529EF4(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2F8], 8);
  _Block_object_dispose(&STACK[0x360], 8);
  _Unwind_Resume(a1);
}

id CPLCopyDefaultSerialQueueAttributes()
{
  if (CPLCopyDefaultSerialQueueAttributes_onceToken != -1)
    dispatch_once(&CPLCopyDefaultSerialQueueAttributes_onceToken, &__block_literal_global_21463);
  return (id)CPLCopyDefaultSerialQueueAttributes_attr;
}

uint64_t CPLIsSharedLibraryFeatureEnabled()
{
  return (isFeatureEnabled != 0) | ((overridesFeatureFlag & 1) == 0);
}

uint64_t CPLForceSharedLibraryFeatureEnabled(uint64_t result)
{
  isFeatureEnabled = result;
  overridesFeatureFlag = 1;
  return result;
}

uint64_t CPLAllowsInactiveSharedLibraryScope()
{
  if (CPLAllowsInactiveSharedLibraryScope_onceToken != -1)
    dispatch_once(&CPLAllowsInactiveSharedLibraryScope_onceToken, &__block_literal_global_1_21468);
  return CPLAllowsInactiveSharedLibraryScope_allowsInactiveSharedLibraryScope;
}

void CPLEnableUnsupportedScopesAlert()
{
  _warnAboutUnsupportedScopes = 1;
}

uint64_t CPLDontWarnAboutUnsupportedScopes()
{
  void *v0;
  char v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPLDontWarnAboutUnsupportedScopes"));

  return v1 & 1 | ((_warnAboutUnsupportedScopes & 1) == 0);
}

uint64_t _CPLShouldValidateStableHash()
{
  if (_CPLShouldValidateStableHash_onceToken != -1)
    dispatch_once(&_CPLShouldValidateStableHash_onceToken, &__block_literal_global_5_21475);
  return _CPLShouldValidateStableHash_result;
}

id _CPLArrayFromColonSeparatedList(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)MEMORY[0x1B5E08BF0]();
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "stringByTrimmingCharactersInSet:", v5, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v4, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(v2);
  return v4;
}

uint64_t CPLEnableWorkaroundFor101242629()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CPLDisableWorkaroundFor101242629"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue") ^ 1;
  else
    v2 = 1;

  return v2;
}

__CFString *_CPLShortDescriptionForFaceCropType(unint64_t a1)
{
  __CFString *v1;

  if (a1 < 9 && ((0x117u >> a1) & 1) != 0)
    v1 = off_1E60DDCA0[a1];
  else
    v1 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld??"), a1);
  return v1;
}

uint64_t CPLSuggestionPersonReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  void *v31;
  uint64_t v32;

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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_37;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_41:
          v32 = 32;
          goto LABEL_46;
        case 3u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          break;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_37:
          v31 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          break;
        v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
        *(_QWORD *)(a2 + v28) = v29 + 1;
        v22 |= (unint64_t)(v30 & 0x7F) << v26;
        if ((v30 & 0x80) == 0)
          goto LABEL_43;
        v26 += 7;
        v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_45;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_45:
      v32 = 16;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
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

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1E0C9F3B8](allocator, range);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB700](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1E0CBB9C0](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MMCSSignatureAndSchemeSize()
{
  return MEMORY[0x1E0D46698]();
}

uint64_t MMCSSignatureGeneratorCreate()
{
  return MEMORY[0x1E0D466B0]();
}

uint64_t MMCSSignatureGeneratorCreateWithBoundaryKey()
{
  return MEMORY[0x1E0D466B8]();
}

uint64_t MMCSSignatureGeneratorFinish()
{
  return MEMORY[0x1E0D466C8]();
}

uint64_t MMCSSignatureGeneratorUpdate()
{
  return MEMORY[0x1E0D466E0]();
}

uint64_t MMCSSignatureIsValid()
{
  return MEMORY[0x1E0D466E8]();
}

uint64_t MMCSSignatureIsValidV2()
{
  return MEMORY[0x1E0D466F0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return MEMORY[0x1E0CB29B8]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)bPoint, *(__n128 *)&bPoint.y);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1E0CB29C0]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x1E0CB29C8]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

BOOL NSIsEmptyRect(NSRect aRect)
{
  return MEMORY[0x1E0CB2C90]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1E0CB2D70]();
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x1E0CB3118](namestr);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1E0CB3210]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1E0DE7AB8](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1E0DDFE88]();
}

uint64_t ct_green_tea_logger_create_static()
{
  return MEMORY[0x1E0DDFE90]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1E0DDFE98]();
}

uint64_t ct_green_tea_logging_enabled()
{
  return MEMORY[0x1E0DDFEA0]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
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

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
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

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1E0DDFEA8]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1E0DE7B30](v);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

uint64_t network_usage_policy_create_client()
{
  return MEMORY[0x1E0DE55E8]();
}

uint64_t network_usage_policy_destroy_client()
{
  return MEMORY[0x1E0DE55F8]();
}

uint64_t network_usage_policy_get_bundle_from_policy()
{
  return MEMORY[0x1E0DE5608]();
}

uint64_t network_usage_policy_get_cell_data_allowed_from_policy()
{
  return MEMORY[0x1E0DE5610]();
}

uint64_t network_usage_policy_get_for_bundle()
{
  return MEMORY[0x1E0DE5620]();
}

uint64_t network_usage_policy_set_changed_handler()
{
  return MEMORY[0x1E0DE5628]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x1E0CCFE10](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x1E0CCFE20](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE48](monitor);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1E0CCFE50]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCFE60](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x1E0CCFE68](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE70](monitor);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x1E0CCFE88](path, *(_QWORD *)&interface_type);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

id object_getIvar(id a1, Ivar a2)
{
  return (id)MEMORY[0x1E0DE8018](a1, a2);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x1E0DE8028](obj);
}

void object_setIvar(id obj, Ivar ivar, id value)
{
  MEMORY[0x1E0DE8048](obj, ivar, value);
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

uint64_t os_log_with_args()
{
  return MEMORY[0x1E0C84790]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8068](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
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

uint64_t voucher_adopt()
{
  return MEMORY[0x1E0C85B10]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1E0C85B18]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

