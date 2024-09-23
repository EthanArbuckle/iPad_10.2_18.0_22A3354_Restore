void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_209594A38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209594E34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209595040(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20959537C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209595424(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2095956FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209595794(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209595824(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2095958B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20959591C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209595A18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209595ACC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
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

void sub_2095998D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_209599AC4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _CATLogGeneral()
{
  if (_CATLogGeneral_onceToken_0 != -1)
    dispatch_once(&_CATLogGeneral_onceToken_0, &__block_literal_global_0);
  return (id)_CATLogGeneral_logObj_0;
}

id CATGetCatalystQueue()
{
  if (onceToken != -1)
    dispatch_once(&onceToken, &__block_literal_global_1);
  return (id)mainQueue;
}

void CATSetCatalystQueue(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __CATSetCatalystQueue_block_invoke;
  block[3] = &unk_24C1C5A60;
  v5 = v1;
  v2 = onceToken;
  v3 = v1;
  if (v2 != -1)
    dispatch_once(&onceToken, block);

}

id CATErrorWithDomainCodeAndUserInfo(void *a1, uint64_t a2, void (*a3)(uint64_t, id), void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v7 = a1;
  v8 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSError *CATErrorWithDomainCodeAndUserInfo(NSString *__strong, NSInteger, CATErrorDescriptionsGenerator, NSDictionary *__strong)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("CATError.m"), 12, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorDescriptionsWithCodeAndUserInfo"));

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSDescription")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v12 = v8;
  }
  else
  {
    a3(a2, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __CATErrorWithDomainCodeAndUserInfo_block_invoke;
      v21[3] = &unk_24C1C5B00;
      v22 = v14;
      v15 = v14;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v21);
      v16 = objc_msgSend(v15, "copy");

      v12 = (id)v16;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v7, a2, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void sub_20959C024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CATFormattedStringForKey(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = (void *)objc_opt_new();
  v26 = &a9;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v16, (_QWORD)v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_alloc(MEMORY[0x24BDD17C8]);
        v19 = (void *)objc_msgSend(v18, "initWithFormat:arguments:", v17, v26);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v13);
  }

  v20 = (void *)objc_msgSend(v10, "copy");
  return v20;
}

void sub_20959E000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20959E12C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20959E42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20959E6D4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

id _CATLogGeneral_0()
{
  if (_CATLogGeneral_onceToken_2 != -1)
    dispatch_once(&_CATLogGeneral_onceToken_2, &__block_literal_global_116);
  return (id)_CATLogGeneral_logObj_2;
}

void sub_20959ED88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __REACHABILITY_CALLBACK__(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "reachabilityDidChangeWithFlags:", a2);
}

void sub_2095A2FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095A3104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CATLogGeneral_1()
{
  if (_CATLogGeneral_onceToken_4 != -1)
    dispatch_once(&_CATLogGeneral_onceToken_4, &__block_literal_global_7);
  return (id)_CATLogGeneral_logObj_4;
}

void sub_2095A3700(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_2095A3D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095A48EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095A49F4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095A9F3C(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_2095A9F5C(void *a1)
{
  uint64_t v1;

  objc_begin_catch(a1);
  if (!v1)
    JUMPOUT(0x2095A9ED8);
  JUMPOUT(0x2095A9F14);
}

void sub_2095ABF78(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

id _CATLogGeneral_2()
{
  if (_CATLogGeneral_onceToken_7 != -1)
    dispatch_once(&_CATLogGeneral_onceToken_7, &__block_literal_global_11);
  return (id)_CATLogGeneral_logObj_7;
}

void sub_2095AD2A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095AD8E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095AE724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
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

void sub_2095AF9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095AFB54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095AFCAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095AFDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095B0034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095B0138(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _CATLogGeneral_3()
{
  if (_CATLogGeneral_onceToken_8 != -1)
    dispatch_once(&_CATLogGeneral_onceToken_8, &__block_literal_global_12);
  return (id)_CATLogGeneral_logObj_8;
}

void sub_2095B05AC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 72));
  _Unwind_Resume(a1);
}

void sub_2095B06E4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095B0820(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095B0930(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095B0A50(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095B2038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

void sub_2095B23F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2095B3584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095B36A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095B398C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CATLogGeneral_4()
{
  if (_CATLogGeneral_onceToken_10 != -1)
    dispatch_once(&_CATLogGeneral_onceToken_10, &__block_literal_global_14);
  return (id)_CATLogGeneral_logObj_10;
}

void sub_2095B3CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095B3E68(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_2095B3F90(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095B40CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095B4208(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095B4400(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id _CATLogFSM()
{
  if (_CATLogFSM_onceToken != -1)
    dispatch_once(&_CATLogFSM_onceToken, &__block_literal_global_16);
  return (id)_CATLogFSM_logObj;
}

void sub_2095B58DC(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    objc_begin_catch(exception_object);
    v3 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = 0;

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_2095B8AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095BAA94(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _CATLogGeneral_5()
{
  if (_CATLogGeneral_onceToken_11 != -1)
    dispatch_once(&_CATLogGeneral_onceToken_11, &__block_literal_global_17);
  return (id)_CATLogGeneral_logObj_11;
}

void sub_2095BD8A0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 buf)
{
  void *v13;
  id v14;
  NSObject *v15;

  if (a2 == 1)
  {
    v14 = objc_begin_catch(a1);
    _CATLogGeneral_6();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412546;
      *(_QWORD *)((char *)&buf + 4) = v13;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v14;
      _os_log_error_impl(&dword_209592000, v15, OS_LOG_TYPE_ERROR, "%@: %@", (uint8_t *)&buf, 0x16u);
    }

    objc_msgSend(v13, "setRequest:", 0);
    objc_end_catch();
    JUMPOUT(0x2095BD868);
  }
  _Unwind_Resume(a1);
}

id _CATLogGeneral_6()
{
  if (_CATLogGeneral_onceToken_12 != -1)
    dispatch_once(&_CATLogGeneral_onceToken_12, &__block_literal_global_18);
  return (id)_CATLogGeneral_logObj_12;
}

void sub_2095BE43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CATLogGeneral_7()
{
  if (_CATLogGeneral_onceToken_14 != -1)
    dispatch_once(&_CATLogGeneral_onceToken_14, &__block_literal_global_41);
  return (id)_CATLogGeneral_logObj_14;
}

void sub_2095C6BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095C75FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2095C7A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095C9614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095C97F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095C9A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095C9D70(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2095CA128(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_2095CA5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095CA784(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2095CAA38(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2095CB000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095CB108(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095CBAF0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2095CC0EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095CC208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095CC374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2095CC47C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095CC728(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2095CC9E8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_2095CCB20(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095CCC64(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095CCE24(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2095CCFC8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2095CD1B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id CATErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  return CATErrorWithDomainCodeAndUserInfo(CFSTR("Catalyst.error"), a1, (void (*)(uint64_t, id))_CATErrorDescriptionsWithCodeAndUserInfo, a2);
}

id _CATErrorDescriptionsWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v29 = a2;
  if (_CATErrorDescriptionsWithCodeAndUserInfo_onceToken != -1)
    dispatch_once(&_CATErrorDescriptionsWithCodeAndUserInfo_onceToken, &__block_literal_global_26);
  v3 = 0;
  if (a1 <= 500)
  {
    if (a1 > 199)
    {
      if (a1 > 300)
      {
        switch(a1)
        {
          case 400:
            v30 = (id)objc_opt_new();
            objc_msgSend((id)_CATErrorDescriptionsWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("An unknown service request (%@)."), &stru_24C1C6B98, CFSTR("CATErrors"));
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v3 = (id)objc_claimAutoreleasedReturnValue();
            v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
            if (v6)
            {
              v7 = v6;
              v8 = *(_QWORD *)v36;
              do
              {
                for (i = 0; i != v7; ++i)
                {
                  if (*(_QWORD *)v36 != v8)
                    objc_enumerationMutation(v3);
                  v10 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
                  objc_msgSend(v3, "objectForKeyedSubscript:", v10);
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  v12 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("kCATErrorRequestNameKey"));
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v13);
                  v14 = objc_claimAutoreleasedReturnValue();
                  v15 = (void *)v14;
                  if (v14)
                    v16 = (const __CFString *)v14;
                  else
                    v16 = CFSTR("FORMAT SPECIFIER ERROR");
                  objc_msgSend(v30, "setObject:forKeyedSubscript:", v16, v10);

                }
                v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
              }
              while (v7);
            }
            goto LABEL_79;
          case 401:
            v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            v5 = CFSTR("The operation is no longer available.");
            break;
          case 402:
            v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            v5 = CFSTR("There was a problem serializing the request.");
            break;
          case 403:
            v30 = (id)objc_opt_new();
            objc_msgSend((id)_CATErrorDescriptionsWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("Failed to create operation for request (%@)."), &stru_24C1C6B98, CFSTR("CATErrors"));
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v3 = (id)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v32;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v32 != v19)
                    objc_enumerationMutation(v3);
                  v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
                  objc_msgSend(v3, "objectForKeyedSubscript:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("kCATErrorRequestNameKey"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "stringWithValidatedFormat:validFormatSpecifiers:error:", v22, CFSTR("%@"), 0, v24);
                  v25 = objc_claimAutoreleasedReturnValue();
                  v26 = (void *)v25;
                  if (v25)
                    v27 = (const __CFString *)v25;
                  else
                    v27 = CFSTR("FORMAT SPECIFIER ERROR");
                  objc_msgSend(v30, "setObject:forKeyedSubscript:", v27, v21);

                }
                v18 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              }
              while (v18);
            }
LABEL_79:

            goto LABEL_83;
          case 404:
            v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            v5 = CFSTR("The operation was canceled.");
            break;
          default:
            if (a1 == 301)
            {
              v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
              v5 = CFSTR("Malformed message.");
            }
            else
            {
              v30 = 0;
              if (a1 != 302)
                goto LABEL_83;
              v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
              v5 = CFSTR("Unexpected message.");
            }
            break;
        }
      }
      else if (a1 == 200)
      {
        v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
        v5 = CFSTR("Transport has been invalidated.");
      }
      else if (a1 == 202)
      {
        v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
        v5 = CFSTR("Transport could not connect.");
      }
      else
      {
        v30 = 0;
        if (a1 != 300)
          goto LABEL_83;
        v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
        v5 = CFSTR("Unable to parse message.");
      }
    }
    else
    {
      if (a1 > 99)
      {
        v30 = 0;
        switch(a1)
        {
          case 'd':
            v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            v5 = CFSTR("The remote connection has been closed.");
            goto LABEL_82;
          case 'e':
            v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            v5 = CFSTR("Receiving data failed.");
            goto LABEL_82;
          case 'f':
            v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            v5 = CFSTR("Sending data failed.");
            goto LABEL_82;
          case 'g':
            v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            v5 = CFSTR("The remote connection has been closed by the peer.");
            goto LABEL_82;
          case 'h':
            v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            v5 = CFSTR("The remote connection could not create streams.");
            goto LABEL_82;
          case 'i':
            v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            v5 = CFSTR("The connection timed out.");
            goto LABEL_82;
          case 'j':
            v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            v5 = CFSTR("Unable to establish secure connection.");
            goto LABEL_82;
          case 'k':
            v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            v5 = CFSTR("Failed to configure secure settings on connection.");
            goto LABEL_82;
          default:
            goto LABEL_83;
        }
        goto LABEL_83;
      }
      if (a1 == 1)
      {
        v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
        v5 = CFSTR("An unknown error occurred.");
      }
      else if (a1 == 2)
      {
        v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
        v5 = CFSTR("A parameter was invalid.");
      }
      else
      {
        v30 = 0;
        if (a1 != 4)
          goto LABEL_83;
        v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
        v5 = CFSTR("The operation timed out.");
      }
    }
LABEL_82:
    objc_msgSend(v4, "cat_localizedStringsForKey:value:table:", v5, &stru_24C1C6B98, CFSTR("CATErrors"));
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v3 = 0;
    goto LABEL_83;
  }
  switch(a1)
  {
    case 700:
      v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      v5 = CFSTR("Terminal interrupted.");
      goto LABEL_82;
    case 701:
      v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      v5 = CFSTR("Terminal invalidated.");
      goto LABEL_82;
    case 702:
      v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      v5 = CFSTR("Terminal invalidated by vending paired connection.");
      goto LABEL_82;
    case 703:
      v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      v5 = CFSTR("The underlying session was closed.");
      goto LABEL_82;
    case 704:
      v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      v5 = CFSTR("Device session is not paired.");
      goto LABEL_82;
    case 705:
      v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      v5 = CFSTR("Pairing terminal invalidated by caller.");
      goto LABEL_82;
    case 706:
      v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      v5 = CFSTR("Pairing terminal is invalid.");
      goto LABEL_82;
    case 707:
      v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      v5 = CFSTR("Pairing verification is already in progress.");
      goto LABEL_82;
    case 708:
      v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      v5 = CFSTR("Verification is required to begin pairing.");
      goto LABEL_82;
    case 709:
      v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      v5 = CFSTR("Pairing is already in progress.");
      goto LABEL_82;
    default:
      switch(a1)
      {
        case 501:
          v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
          v5 = CFSTR("Invalid task client.");
          goto LABEL_82;
        case 502:
          v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
          v5 = CFSTR("Server session invalidated.");
          goto LABEL_82;
        case 503:
          v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
          v5 = CFSTR("Client session invalidated.");
          goto LABEL_82;
        case 504:
          v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
          v5 = CFSTR("The connection was rejected.");
          goto LABEL_82;
        case 505:
          v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
          v5 = CFSTR("The client's transport was captured.");
          goto LABEL_82;
        default:
          v30 = 0;
          switch(a1)
          {
            case 600:
              v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
              v5 = CFSTR("The connection timed out waiting to hear from the remote.");
              goto LABEL_82;
            case 601:
              v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
              v5 = CFSTR("The connection timed out waiting to receive the next segment in a full data send.");
              goto LABEL_82;
            case 602:
              v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
              v5 = CFSTR("The connection recieved an out of order data segment.");
              goto LABEL_82;
            case 603:
              v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
              v5 = CFSTR("The connection was closed by the other side of the connection.");
              goto LABEL_82;
            case 604:
              v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
              v5 = CFSTR("The connection is no longer able to communicate with the remote.");
              goto LABEL_82;
            default:
              goto LABEL_83;
          }
      }
  }
LABEL_83:

  return v30;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD10DB4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t CATAsyncPromise.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = swift_allocObject();
  CATAsyncPromise.init()(v0, v1, v2, v3);
  return v0;
}

char *CATAsyncPromise.init()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;

  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)v4 + 80);
  type metadata accessor for CATAsyncStreamMulticaster(0, v6, a3, a4);
  sub_2095D3DF0((uint64_t)&v12);
  v10 = v12;
  v11 = v13;
  *((_QWORD *)v4 + 2) = CATAsyncStreamMulticaster.__allocating_init(bufferingPolicy:)((uint64_t)&v10);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(&v5[*(_QWORD *)(*(_QWORD *)v5 + 96)], 1, 1, v6);
  v7 = *(_QWORD *)(*(_QWORD *)v4 + 104);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C28);
  v8 = swift_allocObject();
  *(_DWORD *)(v8 + 16) = 0;
  *(_QWORD *)&v5[v7] = v8;
  return v5;
}

uint64_t CATAsyncPromise.isFulfilled.getter()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  unsigned __int8 v4;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 104)) + 16);
  os_unfair_lock_lock(v1);
  sub_2095D02FC(&v4);
  v2 = v4;
  os_unfair_lock_unlock(v1);
  return v2;
}

uint64_t sub_2095D0218@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v4 = *a1;
  v5 = *(_QWORD *)(*a1 + 80);
  v6 = sub_2095DCCB8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - v8;
  v10 = (uint64_t)a1 + *(_QWORD *)(v4 + 96);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  LOBYTE(v10) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v9, 1, v5) != 1;
  result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *a2 = v10;
  return result;
}

uint64_t sub_2095D02FC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t *v1;

  return sub_2095D0218(v1, a1);
}

void CATAsyncPromise.fulfill(_:)(uint64_t a1)
{
  uint64_t *v1;
  os_unfair_lock_s *v3;

  v3 = (os_unfair_lock_s *)(*(uint64_t *)((char *)v1 + *(_QWORD *)(*v1 + 104)) + 16);
  os_unfair_lock_lock(v3);
  sub_2095D0350(v1, a1);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_2095D0350(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;

  v4 = *a1;
  v5 = *(_QWORD *)(*a1 + 80);
  v6 = sub_2095DCCB8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v21 - v12;
  v14 = *(_QWORD *)(v5 - 8);
  v15 = MEMORY[0x24BDAC7A8](v11);
  v22 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v21 - v17;
  v19 = (uint64_t)a1 + *(_QWORD *)(v4 + 96);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v13, v19, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    CATAsyncStreamMulticaster.yield(_:)(a2, (char *)&v23);
    CATAsyncStreamMulticaster.finish()();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v10, a2, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v10, 0, 1, v5);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 40))(v19, v10, v6);
    return swift_endAccess();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v18, v13, v5);
    v23 = 0;
    v24 = 0xE000000000000000;
    sub_2095DCCC4();
    swift_bridgeObjectRelease();
    v23 = 0xD000000000000023;
    v24 = 0x80000002095E5BC0;
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v22, v18, v5);
    sub_2095DCA3C();
    sub_2095DCA48();
    swift_bridgeObjectRelease();
    result = sub_2095DCCE8();
    __break(1u);
  }
  return result;
}

uint64_t CATAsyncPromise.value.getter(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = v1;
  v3 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  v2[4] = swift_task_alloc();
  v2[5] = *(_QWORD *)(v3 + 80);
  v4 = sub_2095DCCB8();
  v2[6] = v4;
  v2[7] = *(_QWORD *)(v4 - 8);
  v2[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095D0664()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 40);
  sub_2095D0828(v1);
  v3 = *(_QWORD *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v4 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 40);
    v6 = *(_QWORD *)(v0 + 24);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
    v7 = sub_2095DCAD8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 1, 1, v7);
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v6;
    swift_retain();
    *(_QWORD *)(v0 + 72) = sub_2095D0BAC(v4, (uint64_t)&unk_2545A2C48, (uint64_t)v8, v5);
    sub_2095D12F8(v4);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v9;
    *v9 = v0;
    v9[1] = sub_2095D07C8;
    return sub_2095DCB80();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v3 + 32))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 40));
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2095D07C8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_2095D0828(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 104));
  sub_2095DCCB8();
  v4 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v4);
  v5 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 96);
  swift_beginAccess();
  v6 = sub_2095DCCB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, v5, v6);
  os_unfair_lock_unlock(v4);
}

uint64_t sub_2095D08D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;

  v4[2] = a1;
  v4[3] = *(_QWORD *)(*(_QWORD *)a4 + 80);
  sub_2095DCCB8();
  v5 = swift_task_alloc();
  v4[4] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v4[5] = v6;
  *v6 = v4;
  v6[1] = sub_2095D0958;
  return sub_2095D0A20(v5);
}

uint64_t sub_2095D0958()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2095D09AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v1 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v2, 1, v1);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 16), v2, v1);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_2095D0A20(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3 = sub_2095DCB5C();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095D0A8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[4];
  v1 = v0[5];
  CATAsyncStreamMulticaster.makeStream()(v0[7]);
  v3 = swift_task_alloc();
  v0[8] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[9] = v4;
  MEMORY[0x20BD10DCC](MEMORY[0x24BEE6AA8], v1);
  *v4 = v0;
  v4[1] = sub_2095D0B34;
  return sub_2095DCBA4();
}

uint64_t sub_2095D0B34()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = *(_QWORD *)(*v0 + 48);
  v1 = *(_QWORD *)(*v0 + 56);
  v3 = *(_QWORD *)(*v0 + 40);
  v5 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_2095D0BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD v17[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2095D1630(a1, (uint64_t)v9);
  v10 = sub_2095DCAD8();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_2095D12F8((uint64_t)v9);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v12 = sub_2095DCA90();
      v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2095DCACC();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a4;
  v15[3] = a2;
  v15[4] = a3;
  if (v14 | v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    v17[2] = v12;
    v17[3] = v14;
  }
  return swift_task_create();
}

uint64_t CATAsyncPromise.throwingValue.getter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3 = sub_2095DCCB8();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095D0DB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 32);
  sub_2095D0828(v1);
  v3 = *(_QWORD *)(v2 - 8);
  *(_QWORD *)(v0 + 72) = v3;
  v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  *(_QWORD *)(v0 + 80) = v4;
  if (v4(v1, 1, v2) == 1)
  {
    v5 = *(_QWORD *)(v0 + 64);
    v6 = *(_QWORD *)(v0 + 40);
    v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 48) + 8);
    *(_QWORD *)(v0 + 88) = v7;
    v7(v5, v6);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v8;
    *v8 = v0;
    v8[1] = sub_2095D0E98;
    return sub_2095D0A20(*(_QWORD *)(v0 + 56));
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v3 + 32))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 32));
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2095D0E98()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2095D0EEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 32);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 80))(v1, 1, v2) == 1)
  {
    (*(void (**)(uint64_t, _QWORD))(v0 + 88))(v1, *(_QWORD *)(v0 + 40));
    sub_2095DCA9C();
    sub_2095D1338();
    swift_allocError();
    sub_2095DC9DC();
    swift_willThrow();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v0 + 72) + 32))(*(_QWORD *)(v0 + 16), v1, v2);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D0FDC()
{
  uint64_t v0;

  return sub_2095D161C(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 1);
}

uint64_t CATAsyncPromise.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 96);
  v2 = sub_2095DCCB8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t CATAsyncPromise.__deallocating_deinit()
{
  CATAsyncPromise.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2095D1080(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2095D1748;
  return CATAsyncPromise.value.getter(a1);
}

uint64_t sub_2095D10D4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2095D1128;
  return CATAsyncPromise.throwingValue.getter(a1);
}

uint64_t sub_2095D1128()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2095D1170()
{
  return CATAsyncPromise.isFulfilled.getter() & 1;
}

void sub_2095D1194(uint64_t a1)
{
  CATAsyncPromise.fulfill(_:)(a1);
}

uint64_t CATAsyncPromiseWriting<>.fulfill()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 24))(a1, a1, a2);
}

uint64_t sub_2095D11C4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2095D1228;
  return v6(a1);
}

uint64_t sub_2095D1228()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2095D1274()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2095D12A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2095D1128;
  return sub_2095D08D4(a1, v6, v7, v4);
}

uint64_t sub_2095D12F8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2095D1338()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2545A2C60;
  if (!qword_2545A2C60)
  {
    v1 = sub_2095DCA9C();
    result = MEMORY[0x20BD10DCC](MEMORY[0x24BEE6848], v1);
    atomic_store(result, (unint64_t *)&qword_2545A2C60);
  }
  return result;
}

uint64_t sub_2095D1384()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2095DCCB8();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for CATAsyncPromise(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CATAsyncPromise);
}

uint64_t method lookup function for CATAsyncPromise()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CATAsyncPromise.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of CATAsyncPromiseReading.value.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 16) + *(_QWORD *)(a3 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2095D1748;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CATAsyncPromiseReading.throwingValue.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 24) + *(_QWORD *)(a3 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2095D1128;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CATAsyncPromiseWriting.isFulfilled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CATAsyncPromiseWriting.fulfill(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2545A2C88)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, &qword_2545A2C88);
  }
}

uint64_t sub_2095D1580()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2095D15CC;
  return sub_2095D15CC(1);
}

uint64_t sub_2095D15CC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_2095D161C(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_2095D1630(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2095D1678()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2095D169C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2095D1748;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2545A2CA0 + dword_2545A2CA0))(a1, v4);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x20BD10D78](a1, v6, a5);
}

uint64_t static CATAsyncStreamVendors.from<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for CATAsyncGeneratorBackedVendor(0, a3, a3, a4);
  swift_retain();
  return sub_2095D2238(a1, a2);
}

ValueMetadata *type metadata accessor for CATAsyncStreamVendors()
{
  return &type metadata for CATAsyncStreamVendors;
}

uint64_t sub_2095D17AC()
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t sub_2095D17E0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2095D17E8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2095D1854(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_2095D18C4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_2095D18D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_2095D1904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_2095D1934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_2095D1964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_2095D1994(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_2095D1A44 + 4 * byte_2095E2860[(v7 - 1)]))();
}

void sub_2095D1A94(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for CATSendableBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CATSendableBox);
}

uint64_t initializeBufferWithCopyOfBuffer for CATAnyTask(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_2095D1C94(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2095D1CB4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 8) = v3;
  return result;
}

uint64_t type metadata accessor for CATWeakSendableBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CATWeakSendableBox);
}

uint64_t sub_2095D1CE8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2095D1D08(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2095D1128;
  return v6();
}

uint64_t (*sub_2095D1D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  _QWORD *v8;
  _QWORD *v9;

  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = a4;
  v8[5] = a1;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a4;
  v9[5] = a1;
  swift_retain_n();
  return sub_2095D1E24;
}

uint64_t sub_2095D1E00()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2095D1E24()
{
  return sub_2095DCB74();
}

uint64_t sub_2095D1E30(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v2[2] = a2;
  v3 = sub_2095DCCB8();
  v2[3] = v3;
  v2[4] = *(_QWORD *)(v3 - 8);
  v2[5] = swift_task_alloc();
  v4 = (_QWORD *)swift_task_alloc();
  v2[6] = v4;
  *v4 = v2;
  v4[1] = sub_2095D1EE0;
  return sub_2095DCB68();
}

uint64_t sub_2095D1EE0()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  return swift_task_switch();
}

uint64_t sub_2095D1F4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 56))(v1, 0, 1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D1FB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 56))(v1, 1, 1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D201C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2095D1748;
  return sub_2095D1E30(v3, v2);
}

uint64_t destroy for CATAnyTask()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for CATAnyTask(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for CATAnyTask(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for CATAnyTask(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CATAnyTask(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CATAnyTask(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CATAnyTask()
{
  return &type metadata for CATAnyTask;
}

uint64_t sub_2095D2238(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t CATAsyncGeneratorBackedVendor.makeStream()@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[2];

  v25[0] = a1;
  v2 = *v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v2 + 80);
  v7 = sub_2095DCB08();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v25 - v9;
  v11 = sub_2095DCB2C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v25 - v16;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE6A10], v7);
  sub_2095DCAE4();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v18 = sub_2095DCAD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v5, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  v19 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v20 = (char *)swift_allocObject();
  *((_QWORD *)v20 + 2) = 0;
  *((_QWORD *)v20 + 3) = 0;
  v21 = v25[1];
  *((_QWORD *)v20 + 4) = v6;
  *((_QWORD *)v20 + 5) = v21;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v20[v19], v15, v11);
  swift_retain();
  v22 = sub_2095D2A84((uint64_t)v5, (uint64_t)&unk_2545A2CD0, (uint64_t)v20);
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v6;
  *(_QWORD *)(v23 + 24) = v22;
  sub_2095DCAFC();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

uint64_t sub_2095D24A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5[2] = a4;
  v5[3] = a5;
  v6 = *(_QWORD *)(*(_QWORD *)a4 + 80);
  v5[4] = v6;
  v5[5] = *(_QWORD *)(v6 - 8);
  v5[6] = swift_task_alloc();
  v7 = sub_2095DCAF0();
  v5[7] = v7;
  v5[8] = *(_QWORD *)(v7 - 8);
  v5[9] = swift_task_alloc();
  sub_2095DCCB8();
  v5[10] = swift_task_alloc();
  v8 = sub_2095DCB50();
  v5[11] = v8;
  v5[12] = *(_QWORD *)(v8 - 8);
  v5[13] = swift_task_alloc();
  v9 = sub_2095DCB5C();
  v5[14] = v9;
  v5[15] = *(_QWORD *)(v9 - 8);
  v5[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095D25B0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  sub_2095DCB8C();
  v0[17] = 0;
  v3 = (uint64_t (*)(_QWORD))(**(int **)(v0[2] + 16) + *(_QWORD *)(v0[2] + 16));
  v1 = (_QWORD *)swift_task_alloc();
  v0[18] = v1;
  *v1 = v0;
  v1[1] = sub_2095D2684;
  return v3(v0[16]);
}

uint64_t sub_2095D2684()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2095D26D8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 136);
  sub_2095DCB8C();
  if (v1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    sub_2095DCB38();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v3;
    *v3 = v0;
    v3[1] = sub_2095D27C0;
    return sub_2095DCB44();
  }
}

uint64_t sub_2095D27C0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2095D2814()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    v5 = *(_QWORD *)(v0 + 120);
    v4 = *(_QWORD *)(v0 + 128);
    v6 = *(_QWORD *)(v0 + 112);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
    sub_2095DCB2C();
    sub_2095DCB20();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 64);
    v8 = *(_QWORD *)(v0 + 72);
    v10 = *(_QWORD *)(v0 + 56);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(*(_QWORD *)(v0 + 48), v1, v3);
    sub_2095DCB2C();
    sub_2095DCB14();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v11;
    *v11 = v0;
    v11[1] = sub_2095D27C0;
    return sub_2095DCB44();
  }
}

uint64_t sub_2095D2994()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2095DCB2C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2095D2A14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_2095DCB2C() - 8) + 80);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = v0 + ((v2 + 48) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2095D1128;
  return sub_2095D24A8((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t sub_2095D2A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_2095DCAD8();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2095DCACC();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_2095D12F8(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2095DCA90();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2095D2BB0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2095D2BD4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CD8);
  return sub_2095DCB74();
}

uint64_t CATAsyncGeneratorBackedVendor.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t CATAsyncGeneratorBackedVendor.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2095D2C58@<X0>(uint64_t a1@<X8>)
{
  return CATAsyncGeneratorBackedVendor.makeStream()(a1);
}

uint64_t sub_2095D2C78()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for CATAsyncGeneratorBackedVendor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CATAsyncGeneratorBackedVendor);
}

uint64_t method lookup function for CATAsyncGeneratorBackedVendor()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2095D2CD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC8Catalyst12CATAsyncGate_continuation;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CE0);
  sub_2095DCB20();
  v4 = v1 + OBJC_IVAR____TtC8Catalyst12CATAsyncGate_stream;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_deallocClassInstance();
}

uint64_t sub_2095D2D68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CF0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CE0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CE8);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE6A10], v0);
  sub_2095DCAE4();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12 + OBJC_IVAR____TtC8Catalyst12CATAsyncGate_stream, v11, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v12 + OBJC_IVAR____TtC8Catalyst12CATAsyncGate_continuation, v7, v4);
  return v12;
}

uint64_t sub_2095D2EF8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CE0);
  return sub_2095DCB20();
}

uint64_t sub_2095D2F2C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CE8);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = *(_QWORD *)(v3 + 64);
  v1[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  v1[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095D2FB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = v0[6];
  v1 = v0[7];
  v3 = v0[4];
  v4 = v0[3];
  v5 = v0[2] + OBJC_IVAR____TtC8Catalyst12CATAsyncGate_stream;
  v6 = sub_2095DCAD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v1, 1, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v2, v4);
  v0[8] = sub_2095D349C(v1, (uint64_t)&unk_2545A2D08, v8);
  sub_2095D12F8(v1);
  v9 = (_QWORD *)swift_task_alloc();
  v0[9] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2D10);
  *v9 = v0;
  v9[1] = sub_2095D30E8;
  return sub_2095DCB80();
}

uint64_t sub_2095D30E8()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2095D3144()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D317C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[2] = a1;
  v4[3] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CE8);
  v4[4] = v5;
  v4[5] = *(_QWORD *)(v5 - 8);
  v4[6] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2D38);
  v4[7] = v6;
  v4[8] = *(_QWORD *)(v6 - 8);
  v4[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095D320C()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[5] + 16))(v0[6], v0[3], v0[4]);
  sub_2095D38F4(&qword_2545A2D40, &qword_2545A2CE8, MEMORY[0x24BEE6AA8]);
  sub_2095DCB98();
  sub_2095D38F4(&qword_2545A2D48, &qword_2545A2D38, MEMORY[0x24BEE6A88]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[10] = v1;
  *v1 = v0;
  v1[1] = sub_2095D32E0;
  return sub_2095DCAC0();
}

uint64_t sub_2095D32E0()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v2[8] + 8))(v2[9], v2[7]);
  else
    return swift_task_switch();
}

uint64_t sub_2095D3350()
{
  uint64_t v0;
  _BYTE *v1;
  char v2;

  v1 = *(_BYTE **)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 88);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  *v1 = v2;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D33B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CE8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2095D3428(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CE8) - 8) + 80);
  v5 = v1 + ((v4 + 32) & ~v4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_2095D1128;
  return sub_2095D317C(a1, v7, v8, v5);
}

uint64_t sub_2095D349C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2095D1630(a1, (uint64_t)v8);
  v9 = sub_2095DCAD8();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_2095D12F8((uint64_t)v8);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v11 = sub_2095DCA90();
      v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2095DCACC();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v11 = 0;
  v13 = 0;
LABEL_6:
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2D10);
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t sub_2095D362C()
{
  return type metadata accessor for CATAsyncGate();
}

uint64_t type metadata accessor for CATAsyncGate()
{
  uint64_t result;

  result = qword_2545A3410;
  if (!qword_2545A3410)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2095D3670()
{
  unint64_t v0;
  unint64_t v1;

  sub_2095D3718(319, &qword_2545A2D18, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE6A98]);
  if (v0 <= 0x3F)
  {
    sub_2095D3718(319, &qword_2545A2D20, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE6A40]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_2095D3718(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, MEMORY[0x24BEE4AE0] + 8);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_2095D3764(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_2095D37CC;
  return v5(v2 + 32);
}

uint64_t sub_2095D37CC()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_2095D381C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2095D3840(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2095D1128;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2545A2D28 + dword_2545A2D28))(a1, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD10DC0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2095D38F4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x20BD10DCC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

BOOL static CATAsyncStreamMulticaster.YieldResult.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CATAsyncStreamMulticaster.YieldResult.hash(into:)()
{
  return sub_2095DCD54();
}

uint64_t CATAsyncStreamMulticaster.YieldResult.hashValue.getter()
{
  sub_2095DCD48();
  sub_2095DCD54();
  return sub_2095DCD60();
}

uint64_t sub_2095D39C0()
{
  sub_2095DCD48();
  CATAsyncStreamMulticaster.YieldResult.hash(into:)();
  return sub_2095DCD60();
}

unint64_t sub_2095D39F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2545A2D50;
  if (!qword_2545A2D50)
  {
    v1 = sub_2095DC9B8();
    result = MEMORY[0x20BD10DCC](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_2545A2D50);
  }
  return result;
}

uint64_t CATAsyncStreamMulticaster.deinit()
{
  uint64_t v0;

  sub_2095D3A80();
  swift_bridgeObjectRelease();
  swift_release();

  sub_2095D3DC0(*(_QWORD *)(v0 + 72));
  sub_2095D3DC0(*(_QWORD *)(v0 + 88));
  return v0;
}

uint64_t sub_2095D3A80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t TupleTypeMetadata2;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  int64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;

  v1 = sub_2095DCB2C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v32 = (char *)&v28 - v3;
  v4 = sub_2095DC9B8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v6 = sub_2095DCCB8();
  v33 = *(_QWORD *)(v6 - 8);
  v34 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v28 - v10;
  swift_beginAccess();
  v12 = *(_QWORD *)(v0 + 32);
  v13 = *(_QWORD *)(v12 + 64);
  v29 = v12 + 64;
  v14 = 1 << *(_BYTE *)(v12 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v30 = (unint64_t)(v14 + 63) >> 6;
  v31 = v12;
  v28 = v30 - 1;
  result = swift_bridgeObjectRetain();
  v18 = 0;
  if (!v16)
    goto LABEL_9;
LABEL_4:
  v19 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  v20 = v18;
  v21 = v19 | (v18 << 6);
LABEL_5:
  v22 = v31;
  (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(v9, *(_QWORD *)(v31 + 48) + *(_QWORD *)(*(_QWORD *)(v4 - 8) + 72) * v21, v4);
  (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(&v9[*(int *)(TupleTypeMetadata2 + 48)], *(_QWORD *)(v22 + 56) + *(_QWORD *)(v2 + 72) * v21, v1);
  v23 = 0;
LABEL_6:
  v18 = v20;
  while (1)
  {
LABEL_7:
    v24 = *(_QWORD *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v9, v23, 1, TupleTypeMetadata2);
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v11, v9, v34);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v11, 1, TupleTypeMetadata2) == 1)
      return swift_release();
    v25 = v32;
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v32, &v11[*(int *)(TupleTypeMetadata2 + 48)], v1);
    sub_2095DCB20();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v25, v1);
    result = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v11, v4);
    if (v16)
      goto LABEL_4;
LABEL_9:
    v20 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 < v30)
    {
      v26 = *(_QWORD *)(v29 + 8 * v20);
      if (v26)
        goto LABEL_12;
      v18 += 2;
      if (v20 + 1 >= v30)
      {
        v16 = 0;
        v23 = 1;
        goto LABEL_6;
      }
      v26 = *(_QWORD *)(v29 + 8 * v18);
      if (v26)
      {
        ++v20;
LABEL_12:
        v16 = (v26 - 1) & v26;
        v21 = __clz(__rbit64(v26)) + (v20 << 6);
        goto LABEL_5;
      }
      v27 = v20 + 2;
      if (v20 + 2 < v30)
        break;
    }
    v16 = 0;
    v23 = 1;
  }
  v26 = *(_QWORD *)(v29 + 8 * v27);
  if (v26)
  {
    v20 += 2;
    goto LABEL_12;
  }
  while (1)
  {
    v20 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v20 >= v30)
    {
      v16 = 0;
      v23 = 1;
      v18 = v28;
      goto LABEL_7;
    }
    v26 = *(_QWORD *)(v29 + 8 * v20);
    ++v27;
    if (v26)
      goto LABEL_12;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2095D3DC0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t CATAsyncStreamMulticaster.__deallocating_deinit()
{
  CATAsyncStreamMulticaster.deinit();
  return swift_deallocClassInstance();
}

void sub_2095D3DF0(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t CATAsyncStreamMulticaster.__allocating_init(bufferingPolicy:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  CATAsyncStreamMulticaster.init(bufferingPolicy:)(a1);
  return v2;
}

uint64_t *CATAsyncStreamMulticaster.init(bufferingPolicy:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *v1;
  v3 = *(_QWORD *)a1;
  v4 = *(unsigned __int8 *)(a1 + 8);
  sub_2095DC9B8();
  v5 = *(_QWORD *)(v2 + 80);
  sub_2095DCB2C();
  sub_2095D39F8();
  v1[4] = sub_2095DC9C4();
  *((_BYTE *)v1 + 48) = 0;
  v1[7] = (uint64_t)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1788]), sel_init);
  *((_OWORD *)v1 + 4) = 0u;
  *((_OWORD *)v1 + 5) = 0u;
  v1[12] = 0;
  v1[2] = v3;
  *((_BYTE *)v1 + 24) = v4;
  type metadata accessor for CATQueue(0, v5, v6, v7);
  if (v4)
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = v3;
  v1[5] = (uint64_t)sub_2095D7C44(v8);
  return v1;
}

uint64_t type metadata accessor for CATAsyncStreamMulticaster.BufferingPolicy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CATAsyncStreamMulticaster.BufferingPolicy);
}

id CATAsyncStreamMulticaster.makeStream()@<X0>(unint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + 56);
  sub_2095D47C4();
  sub_2095DCB5C();
  objc_msgSend(v3, sel_lock);
  sub_2095D3F7C(v1, a1);
  return objc_msgSend(v3, sel_unlock);
}

uint64_t sub_2095D3F7C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unsigned int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(_QWORD *);
  uint64_t v43;
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char v55[8];
  _QWORD v56[2];
  _BYTE v57[24];

  v48 = a2;
  v3 = *(_QWORD *)a1;
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v5 = sub_2095DCB2C();
  v6 = sub_2095DCCB8();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v45 - v7;
  v9 = sub_2095DC9B8();
  v54 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = v11;
  MEMORY[0x24BDAC7A8](v10);
  v53 = (char *)&v45 - v13;
  v14 = sub_2095DCB08();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (uint64_t *)((char *)&v45 - v17);
  v19 = *(_QWORD *)(v5 - 8);
  v51 = v5;
  v52 = v19;
  MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v45 - v20;
  LOBYTE(v20) = *(_BYTE *)(a1 + 24);
  v50 = v3;
  v22 = v9;
  if ((v20 & 1) != 0)
  {
    v23 = (unsigned int *)MEMORY[0x24BEE6A10];
  }
  else
  {
    *v18 = *(_QWORD *)(a1 + 16);
    v23 = (unsigned int *)MEMORY[0x24BEE6A00];
  }
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v15 + 104))(v18, *v23, v14);
  sub_2095DCAE4();
  (*(void (**)(_QWORD *, uint64_t))(v15 + 8))(v18, v14);
  v24 = (uint64_t)v21;
  v47 = v4;
  v25 = v53;
  sub_2095DC9AC();
  v46 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
  v26 = v12;
  v46(v12, v25, v22);
  v27 = v52;
  v28 = v21;
  v29 = v51;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v8, v28, v51);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v8, 0, 1, v29);
  v45 = a1 + 32;
  swift_beginAccess();
  v48 = sub_2095D39F8();
  sub_2095DCA0C();
  sub_2095DCA24();
  swift_endAccess();
  sub_2095D43C8(v24);
  swift_retain();
  v30 = v50;
  sub_2095D17AC();
  v33 = type metadata accessor for CATWeakSendableBox(0, v30, v31, v32);
  v34 = *(_QWORD *)(v33 - 8);
  (*(void (**)(_BYTE *, char *, uint64_t))(v34 + 16))(v57, v55, v33);
  v35 = v24;
  v46(v26, v25, v22);
  v36 = v54;
  v37 = (*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = v47;
  v50 = v34;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v34 + 32))(v38 + 24, v57, v33);
  v39 = v26;
  v40 = v35;
  (*(void (**)(unint64_t, char *, uint64_t))(v36 + 32))(v38 + v37, v39, v22);
  sub_2095DCAFC();
  swift_beginAccess();
  sub_2095DCB2C();
  swift_bridgeObjectRetain();
  v41 = sub_2095DC9E8();
  swift_bridgeObjectRelease();
  if (v41 == 1)
  {
    v42 = *(void (**)(_QWORD *))(a1 + 72);
    if (v42)
    {
      v43 = *(_QWORD *)(a1 + 64);
      v56[0] = a1;
      v56[1] = v43;
      swift_retain();
      sub_2095D52CC((uint64_t)v42);
      v42(v56);
      sub_2095D3DC0((uint64_t)v42);
      swift_release();
    }
  }
  if (*(_BYTE *)(a1 + 48) == 1)
    sub_2095DCB20();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v55, v33);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v53, v22);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v52 + 8))(v40, v29);
}

uint64_t sub_2095D43C8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t *, _QWORD);
  uint64_t v20;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26[4];
  uint64_t v27;
  uint64_t v28;

  v24 = a1;
  v2 = *(_QWORD *)(*v1 + 80);
  v23 = sub_2095DCAF0();
  v3 = *(_QWORD *)(v23 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v22 - v5;
  v7 = *(_QWORD *)(v2 - 8);
  v8 = MEMORY[0x24BDAC7A8](v4);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v22 - v11;
  v26[0] = v1[5];
  v13 = v26[0];
  v16 = type metadata accessor for CATQueue(0, v2, v14, v15);
  swift_retain();
  v17 = MEMORY[0x20BD10DCC](&unk_2095E2C28, v16);
  sub_2095DCC28();
  v27 = v28;
  v28 = v13;
  v18 = v27;
  v25 = v17;
  sub_2095DCC34();
  if (v18 != v26[0])
  {
    v22 = v12;
    do
    {
      v19 = (void (*)(uint64_t *, _QWORD))sub_2095DCCA0();
      (*(void (**)(char *))(v7 + 16))(v12);
      v19(v26, 0);
      v26[0] = v28;
      sub_2095DCC40();
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v12, v2);
      sub_2095DCB2C();
      sub_2095DCB14();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v23);
      v20 = v27;
      sub_2095DCC34();
      v12 = v22;
    }
    while (v20 != v26[0]);
  }
  return swift_release();
}

uint64_t sub_2095D4600(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v4 = sub_2095DCB2C();
  v5 = sub_2095DCCB8();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - v6;
  v8 = sub_2095DC9B8();
  MEMORY[0x24BDAC7A8](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v7, 1, 1, v4);
  swift_beginAccess();
  v11 = sub_2095D39F8();
  sub_2095DCA0C();
  sub_2095DCA24();
  swift_endAccess();
  swift_beginAccess();
  v12 = sub_2095DCB2C();
  v13 = swift_bridgeObjectRetain();
  LOBYTE(v8) = MEMORY[0x20BD10118](v13, v8, v12, v11);
  result = swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
    ++*(_QWORD *)(a1 + 64);
    v15 = *(void (**)(uint64_t))(a1 + 88);
    if (v15)
    {
      v16 = swift_retain();
      v15(v16);
      return sub_2095D3DC0((uint64_t)v15);
    }
  }
  return result;
}

unint64_t sub_2095D47C4()
{
  unint64_t result;

  result = qword_2545A2D58;
  if (!qword_2545A2D58)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2545A2D58);
  }
  return result;
}

id CATAsyncStreamMulticaster.yield(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_2095D480C(a1, 0, 1, a2);
}

id sub_2095D480C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char *a4@<X8>)
{
  uint64_t v4;
  int v8;
  void *v9;

  v8 = a3 & 1;
  v9 = *(void **)(v4 + 56);
  sub_2095D47C4();
  objc_msgSend(v9, sel_lock);
  sub_2095D4ED0(v4, a2, v8, a1, a4);
  return objc_msgSend(v9, sel_unlock);
}

Swift::Void __swiftcall CATAsyncStreamMulticaster.clearBuffer()()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 56);
  (*(void (**)(id))(**(_QWORD **)(v0 + 40) + 232))(objc_msgSend(v1, sel_lock));
  objc_msgSend(v1, sel_unlock);
}

Swift::Void __swiftcall CATAsyncStreamMulticaster.finish()()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 56);
  objc_msgSend(v1, sel_lock);
  if ((*(_BYTE *)(v0 + 48) & 1) == 0)
  {
    *(_BYTE *)(v0 + 48) = 1;
    v2 = *(_QWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 88) = 0;
    *(_QWORD *)(v0 + 96) = 0;
    sub_2095D3DC0(v2);
    v3 = *(_QWORD *)(v0 + 72);
    *(_QWORD *)(v0 + 72) = 0;
    *(_QWORD *)(v0 + 80) = 0;
    sub_2095D3DC0(v3);
    sub_2095D3A80();
  }
  objc_msgSend(v1, sel_unlock);
}

uint64_t (*CATAsyncStreamMulticaster.subscriberSessionDidBegin.getter())()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v10)();
  _QWORD *v11;

  v1 = *v0;
  v2 = (void *)v0[7];
  sub_2095D47C4();
  v3 = *(_QWORD *)(v1 + 80);
  type metadata accessor for CATAsyncStreamMulticaster.SubscriberSessionContinuation(255, v3, v4, v5);
  swift_getFunctionTypeMetadata1();
  sub_2095DCCB8();
  objc_msgSend(v2, sel_lock);
  v6 = v0[9];
  v7 = v0[10];
  if (v6)
  {
    v8 = *v0;
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = *(_QWORD *)(v8 + 80);
    v9[3] = v6;
    v9[4] = v7;
    v10 = sub_2095D592C;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  sub_2095D52CC(v6);
  objc_msgSend(v2, sel_unlock);
  if (!v6)
    return 0;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v3;
  v11[3] = v10;
  v11[4] = v9;
  return sub_2095D4BB0;
}

_QWORD *sub_2095D4A48@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (**a3)()@<X8>)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t (*v9)();

  v4 = *(_QWORD *)(a2 + a1 - 8);
  result = CATAsyncStreamMulticaster.subscriberSessionDidBegin.getter();
  if (result)
  {
    v7 = result;
    v8 = v6;
    result = (_QWORD *)swift_allocObject();
    result[2] = v4;
    result[3] = v7;
    result[4] = v8;
    v9 = sub_2095D4BB0;
  }
  else
  {
    v9 = 0;
  }
  *a3 = v9;
  a3[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_2095D4AB8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v8)();

  v4 = *a1;
  v5 = a1[1];
  if (*a1)
  {
    v6 = *(_QWORD *)(a4 + a3 - 8);
    v7 = (_QWORD *)swift_allocObject();
    v7[2] = v6;
    v7[3] = v4;
    v7[4] = v5;
    v8 = sub_2095D592C;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  sub_2095D52CC(v4);
  sub_2095D5254((uint64_t)v8, (uint64_t)v7);
  return sub_2095D3DC0((uint64_t)v8);
}

uint64_t CATAsyncStreamMulticaster.subscriberSessionDidBegin.setter(uint64_t a1, uint64_t a2)
{
  sub_2095D5254(a1, a2);
  return sub_2095D3DC0(a1);
}

uint64_t type metadata accessor for CATAsyncStreamMulticaster.SubscriberSessionContinuation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CATAsyncStreamMulticaster.SubscriberSessionContinuation);
}

uint64_t sub_2095D4B8C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2095D4BB0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t (*CATAsyncStreamMulticaster.subscriberSessionDidBegin.modify(uint64_t (**a1)()))(uint64_t *a1, char a2)
{
  uint64_t (*v1)();
  uint64_t (*v3)();

  a1[2] = v1;
  *a1 = CATAsyncStreamMulticaster.subscriberSessionDidBegin.getter();
  a1[1] = v3;
  return sub_2095D4C04;
}

uint64_t sub_2095D4C04(uint64_t *a1, char a2)
{
  return sub_2095D4E54(a1, a2, (void (*)(uint64_t, uint64_t))sub_2095D5254, (void (*)(uint64_t, uint64_t))sub_2095D52CC, (void (*)(uint64_t, uint64_t))sub_2095D3DC0);
}

uint64_t (*CATAsyncStreamMulticaster.subscriberSessionDidEnd.getter())()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v6;

  v1 = (void *)v0[7];
  objc_msgSend(v1, sel_lock);
  v3 = v0[11];
  v2 = v0[12];
  if (v3)
  {
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v3;
    *(_QWORD *)(v4 + 24) = v2;
    v5 = sub_2095D5904;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  sub_2095D52CC(v3);
  objc_msgSend(v1, sel_unlock);
  if (!v3)
    return 0;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v4;
  return sub_2095D52DC;
}

uint64_t sub_2095D4CE4@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  result = (uint64_t)CATAsyncStreamMulticaster.subscriberSessionDidEnd.getter();
  if (result)
  {
    v4 = result;
    v5 = v3;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v4;
    *(_QWORD *)(result + 24) = v5;
    v6 = sub_2095D52DC;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_2095D4D48(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_2095D5904;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_2095D52CC(v1);
  sub_2095D52FC((uint64_t)v4, v3);
  return sub_2095D3DC0((uint64_t)v4);
}

uint64_t CATAsyncStreamMulticaster.subscriberSessionDidEnd.setter(uint64_t a1, uint64_t a2)
{
  sub_2095D52FC(a1, a2);
  return sub_2095D3DC0(a1);
}

uint64_t (*CATAsyncStreamMulticaster.subscriberSessionDidEnd.modify(uint64_t (**a1)()))(uint64_t *a1, char a2)
{
  uint64_t (*v1)();
  uint64_t (*v3)();

  a1[2] = v1;
  *a1 = CATAsyncStreamMulticaster.subscriberSessionDidEnd.getter();
  a1[1] = v3;
  return sub_2095D4E38;
}

uint64_t sub_2095D4E38(uint64_t *a1, char a2)
{
  return sub_2095D4E54(a1, a2, (void (*)(uint64_t, uint64_t))sub_2095D52FC, (void (*)(uint64_t, uint64_t))sub_2095D590C, (void (*)(uint64_t, uint64_t))sub_2095D5908);
}

uint64_t sub_2095D4E54(uint64_t *a1, char a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *a1;
  v7 = a1[1];
  v8 = *a1;
  if ((a2 & 1) != 0)
  {
    a4(v8, v7);
    a3(v6, v7);
    a5(v6, v7);
  }
  else
  {
    a3(v8, v7);
  }
  return ((uint64_t (*)(uint64_t, uint64_t))a5)(v6, v7);
}

uint64_t sub_2095D4ED0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t result;
  uint64_t v19;
  char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  LODWORD(v37) = a3;
  v35 = a5;
  v36 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v41 = *(_QWORD *)(v6 - 8);
  v42 = a4;
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2095DCAF0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v34 - v11;
  v13 = sub_2095DCB2C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v34 - v19;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v21 = 2;
LABEL_27:
    *v35 = v21;
    return result;
  }
  result = v42;
  v38 = v10;
  v39 = v9;
  v40 = v6;
  if ((v37 & 1) == 0 && *(_QWORD *)(a1 + 64) != v36)
  {
    v21 = 1;
    goto LABEL_27;
  }
  (*(void (**)(uint64_t))(**(_QWORD **)(a1 + 40) + 200))(v42);
  swift_beginAccess();
  v22 = *(_QWORD *)(a1 + 32);
  sub_2095DC9B8();
  sub_2095D39F8();
  v23 = *(_QWORD *)(v22 + 64);
  v36 = v22 + 64;
  v24 = 1 << *(_BYTE *)(v22 + 32);
  v25 = -1;
  if (v24 < 64)
    v25 = ~(-1 << v24);
  v26 = v25 & v23;
  v37 = (unint64_t)(v24 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v27 = 0;
  while (1)
  {
    if (v26)
    {
      v28 = __clz(__rbit64(v26));
      v26 &= v26 - 1;
      v29 = v28 | (v27 << 6);
      v30 = v40;
      goto LABEL_9;
    }
    v31 = v27 + 1;
    v30 = v40;
    if (__OFADD__(v27, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v31 >= v37)
      goto LABEL_25;
    v32 = *(_QWORD *)(v36 + 8 * v31);
    ++v27;
    if (!v32)
    {
      v27 = v31 + 1;
      if (v31 + 1 >= v37)
        goto LABEL_25;
      v32 = *(_QWORD *)(v36 + 8 * v27);
      if (!v32)
      {
        v27 = v31 + 2;
        if (v31 + 2 >= v37)
          goto LABEL_25;
        v32 = *(_QWORD *)(v36 + 8 * v27);
        if (!v32)
          break;
      }
    }
LABEL_24:
    v26 = (v32 - 1) & v32;
    v29 = __clz(__rbit64(v32)) + (v27 << 6);
LABEL_9:
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v20, *(_QWORD *)(v22 + 56) + *(_QWORD *)(v14 + 72) * v29, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v20, v13);
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v8, v42, v30);
    sub_2095DCB14();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v39);
    result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  v33 = v31 + 3;
  if (v33 >= v37)
  {
LABEL_25:
    result = swift_release();
    v21 = 0;
    goto LABEL_27;
  }
  v32 = *(_QWORD *)(v36 + 8 * v33);
  if (v32)
  {
    v27 = v33;
    goto LABEL_24;
  }
  while (1)
  {
    v27 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v27 >= v37)
      goto LABEL_25;
    v32 = *(_QWORD *)(v36 + 8 * v27);
    ++v33;
    if (v32)
      goto LABEL_24;
  }
LABEL_29:
  __break(1u);
  return result;
}

id CATAsyncStreamMulticaster.SubscriberSessionContinuation.yield(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return sub_2095D480C(a1, *(_QWORD *)(v2 + 8), 0, a2);
}

id sub_2095D5234@<X0>(unint64_t a1@<X8>)
{
  return CATAsyncStreamMulticaster.makeStream()(a1);
}

id sub_2095D5254(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;

  v5 = *(void **)(v2 + 56);
  objc_msgSend(v5, sel_lock);
  if ((*(_BYTE *)(v2 + 48) & 1) == 0)
  {
    v6 = *(_QWORD *)(v2 + 72);
    *(_QWORD *)(v2 + 72) = a1;
    *(_QWORD *)(v2 + 80) = a2;
    sub_2095D52CC(a1);
    sub_2095D3DC0(v6);
  }
  return objc_msgSend(v5, sel_unlock);
}

uint64_t sub_2095D52CC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_2095D52DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_2095D52FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;

  v5 = *(void **)(v2 + 56);
  objc_msgSend(v5, sel_lock);
  if ((*(_BYTE *)(v2 + 48) & 1) == 0)
  {
    v6 = *(_QWORD *)(v2 + 88);
    *(_QWORD *)(v2 + 88) = a1;
    *(_QWORD *)(v2 + 96) = a2;
    sub_2095D52CC(a1);
    sub_2095D3DC0(v6);
  }
  return objc_msgSend(v5, sel_unlock);
}

void sub_2095D5374()
{
  JUMPOUT(0x20BD10DCCLL);
}

uint64_t sub_2095D5384()
{
  return 8;
}

_QWORD *sub_2095D5390(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2095D539C()
{
  return 8;
}

uint64_t sub_2095D53A8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for CATAsyncStreamMulticaster(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CATAsyncStreamMulticaster);
}

uint64_t method lookup function for CATAsyncStreamMulticaster()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CATAsyncStreamMulticaster.__allocating_init(bufferingPolicy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_2095D5454()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_2095D5474(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2095D5494(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_2095D54C4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2095D54E4(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_2095D5510(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t sub_2095D55A0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2095D55EC + 4 * byte_2095E2955[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2095D5620 + 4 * asc_2095E2950[v4]))();
}

uint64_t sub_2095D5620(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2095D5628(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2095D5630);
  return result;
}

uint64_t sub_2095D563C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2095D5644);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2095D5648(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2095D5650(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2095D565C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2095D5664(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

uint64_t type metadata accessor for CATAsyncStreamMulticaster.YieldResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CATAsyncStreamMulticaster.YieldResult);
}

_QWORD *sub_2095D5678(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_2095D56A4()
{
  return swift_release();
}

_QWORD *sub_2095D56AC(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *sub_2095D5704(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t sub_2095D5740(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_2095D5788(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_2095D57C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2095D57E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2095DC9B8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_weakDestroy();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_2095D585C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;
  id v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_2095DC9B8() - 8) + 80);
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v3 = Strong;
    v4 = *(id *)(Strong + 56);
    objc_msgSend(v4, sel_lock);
    sub_2095D4600(v3, v0 + ((v1 + 32) & ~v1));
    objc_msgSend(v4, sel_unlock);
    swift_release();

  }
}

uint64_t static Task<>.cat_withTimeout<A, B>(duration:clock:body:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[5] = a3;
  v8[6] = a4;
  v8[3] = a1;
  v8[4] = a2;
  sub_2095DCCB8();
  v8[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  v9 = sub_2095DCC04();
  v8[12] = v9;
  v8[13] = *(_QWORD *)(v9 - 8);
  v8[14] = swift_task_alloc();
  sub_2095DCBBC();
  v8[15] = swift_task_alloc();
  v10 = sub_2095DCC10();
  v8[16] = v10;
  v8[17] = *(_QWORD *)(v10 - 8);
  v8[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095D5A54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 48);
  v5 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 40) = v4;
  *(_OWORD *)(v3 + 56) = v5;
  sub_2095D6EFC(v1);
  sub_2095DCC1C();
  swift_task_dealloc();
  sub_2095DCB38();
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v6;
  *v6 = v0;
  v6[1] = sub_2095D5B48;
  return sub_2095DCBF8();
}

uint64_t sub_2095D5B48()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2095D5BAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 64);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
  v3 = *(_QWORD *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
    return sub_2095DCCE8();
  v5 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 24);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v7, v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D5CE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D5D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v45 = a8;
  v46 = a2;
  v41 = a6;
  v42 = a4;
  v39 = a7;
  v40 = a1;
  v8 = *(_QWORD *)(a7 - 8);
  v47 = a3;
  v48 = v8;
  v9 = *(_QWORD *)(v8 + 64);
  v43 = a5;
  v44 = v9;
  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = v11;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v36 = AssociatedTypeWitness;
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v16 = (char *)&v35 - v15;
  v37 = (char *)&v35 - v15;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  v17 = sub_2095DCBE0();
  v18 = *(_QWORD *)(v17 - 8);
  v35 = v17;
  v19 = *(_QWORD *)(v18 + 64);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v35 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_2095DCAD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v24, 1, 1, v25);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, v40, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v42, AssociatedTypeWitness);
  v26 = v48;
  v27 = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v11, v43, v39);
  v28 = (*(unsigned __int8 *)(v18 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v29 = (v19 + *(unsigned __int8 *)(v13 + 80) + v28) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v30 = (v14 + *(unsigned __int8 *)(v26 + 80) + v29) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  v31 = (char *)swift_allocObject();
  *((_QWORD *)v31 + 2) = 0;
  *((_QWORD *)v31 + 3) = 0;
  *((_QWORD *)v31 + 4) = v41;
  *((_QWORD *)v31 + 5) = v27;
  v32 = v46;
  v33 = v47;
  *((_QWORD *)v31 + 6) = v45;
  *((_QWORD *)v31 + 7) = v32;
  *((_QWORD *)v31 + 8) = v33;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v31[v28], v21, v35);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v31[v29], v37, v36);
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(&v31[v30], v38, v27);
  swift_retain();
  sub_2095D6DB8((uint64_t)v24, (uint64_t)&unk_2545A2D78, (uint64_t)v31);
  return swift_release();
}

uint64_t sub_2095D6008(uint64_t a1)
{
  uint64_t *v1;

  return sub_2095D5D68(a1, v1[5], v1[6], v1[7], v1[8], v1[2], v1[3], v1[4]);
}

uint64_t sub_2095D601C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  __int128 v10;
  uint64_t v11;

  *(_QWORD *)(v8 + 80) = v11;
  *(_OWORD *)(v8 + 64) = v10;
  *(_QWORD *)(v8 + 48) = a7;
  *(_QWORD *)(v8 + 56) = a8;
  *(_QWORD *)(v8 + 32) = a5;
  *(_QWORD *)(v8 + 40) = a6;
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a4;
  return swift_task_switch();
}

uint64_t sub_2095D6050()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  v4 = *(_OWORD *)(v0 + 24);
  v5 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v3 + 32) = v1;
  *(_OWORD *)(v3 + 40) = v4;
  *(_OWORD *)(v3 + 56) = v5;
  *(_QWORD *)(v3 + 72) = v2;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v6;
  *v6 = v0;
  v6[1] = sub_2095D610C;
  return sub_2095DCCD0();
}

uint64_t sub_2095D610C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2095D615C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v8[9] = v15;
  v8[10] = v16;
  v8[7] = a7;
  v8[8] = a8;
  v8[5] = a5;
  v8[6] = a6;
  v8[3] = a3;
  v8[4] = a4;
  v8[2] = a2;
  v9 = *(_QWORD *)(v15 - 8);
  v8[11] = v9;
  v8[12] = *(_QWORD *)(v9 + 64);
  v8[13] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[14] = AssociatedTypeWitness;
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8[15] = v11;
  v8[16] = *(_QWORD *)(v11 + 64);
  v8[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  v12 = sub_2095DCBE0();
  v8[18] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v8[19] = v13;
  v8[20] = *(_QWORD *)(v13 + 64);
  v8[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  v8[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095D6284()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  _QWORD *v17;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v1 = v0[21];
  v2 = v0[22];
  v32 = v2;
  v3 = v0[19];
  v4 = v0[18];
  v30 = v0[16];
  v23 = v0[15];
  v25 = v0[14];
  v26 = v0[17];
  v35 = v0[13];
  v29 = v0[12];
  v33 = v0[10];
  v34 = v0[11];
  v5 = v0[8];
  v31 = v0[9];
  v24 = v0[7];
  v6 = v0[5];
  v22 = v0[6];
  v21 = v6;
  v19 = v0[4];
  v27 = v0[3];
  v7 = sub_2095DCAD8();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v8(v2, 1, 1, v7);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v9 = v6;
  v10 = v4;
  v20(v1, v9, v4);
  v11 = *(unsigned __int8 *)(v3 + 80);
  v12 = (char *)swift_allocObject();
  *((_QWORD *)v12 + 2) = 0;
  *((_QWORD *)v12 + 3) = 0;
  *((_QWORD *)v12 + 4) = v5;
  *((_QWORD *)v12 + 5) = v31;
  *((_QWORD *)v12 + 6) = v33;
  *((_QWORD *)v12 + 7) = v27;
  *((_QWORD *)v12 + 8) = v19;
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 32);
  v28(&v12[(v11 + 72) & ~v11], v1, v10);
  swift_retain();
  sub_2095D68F0(v2, (uint64_t)&unk_2545A2DA8, (uint64_t)v12);
  sub_2095D12F8(v2);
  v8(v2, 1, 1, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v26, v22, v25);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v35, v24, v31);
  v20(v1, v21, v10);
  v13 = (*(unsigned __int8 *)(v23 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  v14 = (v30 + *(unsigned __int8 *)(v34 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  v15 = (v29 + v11 + v14) & ~v11;
  v16 = (char *)swift_allocObject();
  *((_QWORD *)v16 + 2) = 0;
  *((_QWORD *)v16 + 3) = 0;
  *((_QWORD *)v16 + 4) = v5;
  *((_QWORD *)v16 + 5) = v31;
  *((_QWORD *)v16 + 6) = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 32))(&v16[v13], v26, v25);
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(&v16[v14], v35, v31);
  v28(&v16[v15], v1, v10);
  sub_2095D68F0(v32, (uint64_t)&unk_2545A2DB8, (uint64_t)v16);
  sub_2095D12F8(v32);
  v17 = (_QWORD *)swift_task_alloc();
  v0[23] = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2DC0);
  *v17 = v0;
  v17[1] = sub_2095D6580;
  return sub_2095DCAA8();
}

uint64_t sub_2095D6580()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2095D65D4()
{
  uint64_t v0;

  sub_2095DCAB4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D6648(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t);

  v7[4] = a6;
  v7[5] = a7;
  v7[6] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  v10 = sub_2095DCBB0();
  v7[7] = v10;
  v7[8] = *(_QWORD *)(v10 - 8);
  v7[9] = swift_task_alloc();
  v7[10] = *(_QWORD *)(a7 - 8);
  v7[11] = swift_task_alloc();
  v11 = swift_task_alloc();
  v7[12] = v11;
  v14 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v12 = (_QWORD *)swift_task_alloc();
  v7[13] = v12;
  *v12 = v7;
  v12[1] = sub_2095D6730;
  return v14(v11);
}

uint64_t sub_2095D6730()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2095D6794()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 40);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 16))(*(_QWORD *)(v0 + 88), v1, v6);
  sub_2095DCBE0();
  sub_2095DCBC8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  *(_QWORD *)(v0 + 24) = 0;
  sub_2095DCBD4();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D687C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 112);
  sub_2095DCBE0();
  sub_2095DCBD4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D68F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];
  _QWORD v21[4];

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2095D1630(a1, (uint64_t)v10);
  v11 = sub_2095DCAD8();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_2095D12F8((uint64_t)v10);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v13 = sub_2095DCA90();
      v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2095DCACC();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v16 = *v4;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  v18 = (_QWORD *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    v18 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_2095D6A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  v8[8] = a8;
  v8[9] = v11;
  v8[6] = a6;
  v8[7] = a7;
  v8[4] = a4;
  v8[5] = a5;
  v8[10] = swift_getAssociatedTypeWitness();
  v9 = sub_2095DCCB8();
  v8[11] = v9;
  v8[12] = *(_QWORD *)(v9 - 8);
  v8[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095D6B1C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v0[10] - 8) + 56))(v0[13], 1, 1);
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2545A2DC8 + dword_2545A2DC8);
  v1 = (_QWORD *)swift_task_alloc();
  v0[14] = v1;
  *v1 = v0;
  v1[1] = sub_2095D6BA0;
  return v3(v0[4], v0[13], v0[5], v0[8], v0[9]);
}

uint64_t sub_2095D6BA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 104);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 96);
  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch();
}

uint64_t sub_2095D6C20()
{
  uint64_t v0;

  sub_2095D790C();
  *(_QWORD *)(v0 + 24) = swift_allocError();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  sub_2095DCBE0();
  sub_2095DCBD4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D6CB0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 120);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  sub_2095DCBE0();
  sub_2095DCBD4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D6D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2545A2DD8 + dword_2545A2DD8);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_2095D1128;
  return v12(a1, a2, a4, a5);
}

uint64_t sub_2095D6DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2095DCAD8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2095DCACC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2095D12F8(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2095DCA90();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2095D6EFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BEE6CA0];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  v3 = sub_2095DCBBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t static CATTaskTimeoutError.== infix(_:_:)()
{
  return 1;
}

uint64_t CATTaskTimeoutError.hash(into:)()
{
  return sub_2095DCD54();
}

uint64_t CATTaskTimeoutError.hashValue.getter()
{
  sub_2095DCD48();
  sub_2095DCD54();
  return sub_2095DCD60();
}

uint64_t sub_2095D6FD4()
{
  return 1;
}

uint64_t sub_2095D6FDC()
{
  sub_2095DCD48();
  sub_2095DCD54();
  return sub_2095DCD60();
}

uint64_t sub_2095D701C()
{
  return sub_2095DCD54();
}

uint64_t sub_2095D7040()
{
  sub_2095DCD48();
  sub_2095DCD54();
  return sub_2095DCD60();
}

unint64_t sub_2095D7080()
{
  unint64_t result;

  result = qword_2545A2D68;
  if (!qword_2545A2D68)
  {
    result = MEMORY[0x20BD10DCC](&protocol conformance descriptor for CATTaskTimeoutError, &type metadata for CATTaskTimeoutError);
    atomic_store(result, &qword_2545A2D68);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CATTaskTimeoutError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for CATTaskTimeoutError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_2095D7168 + 4 * byte_2095E2B50[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2095D7188 + 4 * byte_2095E2B55[v4]))();
}

_BYTE *sub_2095D7168(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2095D7188(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2095D7190(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2095D7198(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2095D71A0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2095D71A8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2095D71B4()
{
  return 0;
}

ValueMetadata *type metadata accessor for CATTaskTimeoutError()
{
  return &type metadata for CATTaskTimeoutError;
}

uint64_t sub_2095D71CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 40);
  v12 = v1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  v2 = sub_2095DCBE0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = (v4 + v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v1 - 8);
  v10 = (v8 + *(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v2);
  (*(void (**)(unint64_t, uint64_t))(v7 + 8))(v0 + v8, AssociatedTypeWitness);
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v0 + v10, v12);
  return swift_deallocObject();
}

uint64_t sub_2095D7308(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = *(_QWORD *)(v1 + 48);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  v7 = *(_QWORD *)(sub_2095DCBE0() - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v13 = v1 + v11;
  v14 = v1 + ((v11 + *(_QWORD *)(v10 + 64) + v12) & ~v12);
  v15 = swift_task_alloc();
  v16 = *(_OWORD *)(v1 + 56);
  *(_QWORD *)(v2 + 16) = v15;
  *(_QWORD *)v15 = v2;
  *(_QWORD *)(v15 + 8) = sub_2095D1128;
  *(_QWORD *)(v15 + 72) = v5;
  *(_QWORD *)(v15 + 80) = v6;
  *(_QWORD *)(v15 + 56) = v14;
  *(_QWORD *)(v15 + 64) = v4;
  *(_QWORD *)(v15 + 40) = v1 + v8;
  *(_QWORD *)(v15 + 48) = v13;
  *(_OWORD *)(v15 + 24) = v16;
  *(_QWORD *)(v15 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2095D742C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2095D7C3C;
  return v6(a1);
}

uint64_t sub_2095D7490(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2095D1748;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2545A2D80 + dword_2545A2D80))(a1, v4);
}

uint64_t sub_2095D7500(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v5 = v2[2];
  v6 = v2[5];
  v7 = v2[6];
  v8 = v2[7];
  v10 = v2[8];
  v9 = v2[9];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = sub_2095D1748;
  return sub_2095D615C((uint64_t)v11, a2, v6, v7, v8, v10, v9, v5);
}

uint64_t sub_2095D7598()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  v1 = sub_2095DCBE0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2095D7634()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v0[4];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_2095DCBE0() - 8) + 80);
  v4 = (int *)v0[7];
  v5 = v0[8];
  v6 = (uint64_t)v0 + ((v3 + 72) & ~v3);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_2095D1748;
  return sub_2095D6648((uint64_t)v7, v8, v9, v4, v5, v6, v2);
}

uint64_t sub_2095D76D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 40);
  v12 = v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v1 - 8);
  v5 = (v3 + *(_QWORD *)(v2 + 64) + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  v7 = sub_2095DCBE0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (v5 + v6 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v5, v12);
  (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + v9, v7);
  return swift_deallocObject();
}

uint64_t sub_2095D7800()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v2 - 8);
  v7 = (v5 + *(_QWORD *)(v4 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2CD8);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(sub_2095DCBE0() - 8) + 80);
  v10 = v7 + v8 + v9;
  v11 = v0 + v5;
  v12 = v0 + v7;
  v13 = v0 + (v10 & ~v9);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v14;
  *v14 = v1;
  v14[1] = sub_2095D1748;
  return sub_2095D6A8C((uint64_t)v14, v15, v16, v11, v12, v13, v3, v2);
}

unint64_t sub_2095D790C()
{
  unint64_t result;

  result = qword_2545A2DD0;
  if (!qword_2545A2DD0)
  {
    result = MEMORY[0x20BD10DCC](&protocol conformance descriptor for CATTaskTimeoutError, &type metadata for CATTaskTimeoutError);
    atomic_store(result, (unint64_t *)&qword_2545A2DD0);
  }
  return result;
}

uint64_t sub_2095D7950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t AssociatedTypeWitness;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5[7] = AssociatedTypeWitness;
  v5[8] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v5[9] = swift_task_alloc();
  v5[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095D79E0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[9];
  v2 = v0[7];
  v3 = v0[8];
  sub_2095DCD00();
  swift_getAssociatedConformanceWitness();
  sub_2095DCCDC();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[11] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[12] = v5;
  *v5 = v0;
  v5[1] = sub_2095D7AC0;
  return sub_2095DCD0C();
}

uint64_t sub_2095D7AC0()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 88);
  v3 = *(_QWORD *)(*v1 + 80);
  v4 = *(_QWORD *)(*v1 + 56);
  v5 = *v1;
  *(_QWORD *)(v5 + 104) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_2095D7B6C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D7BA8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2095D7BCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2095D1128;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2545A2DE0 + dword_2545A2DE0))(a1, v4);
}

_QWORD *sub_2095D7C44(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)swift_allocObject();
  v3 = sub_2095DC9C4();
  v2[4] = 0;
  v2[5] = 0;
  v2[2] = a1;
  v2[3] = v3;
  return v2;
}

uint64_t sub_2095D7C9C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _BYTE v14[24];
  uint64_t v15;

  v2 = v1;
  v4 = *(_QWORD *)(*v1 + 80);
  v5 = sub_2095DCCB8();
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v14[-v6];
  sub_2095D8134();
  v8 = v1[5];
  v9 = *(_QWORD *)(v4 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v7, a1, v4);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v4);
  v15 = v8;
  swift_beginAccess();
  sub_2095DCA0C();
  sub_2095DCA24();
  result = swift_endAccess();
  v11 = v2[5];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
  {
    __break(1u);
  }
  else
  {
    v2[5] = v13;
    return sub_2095D846C();
  }
  return result;
}

uint64_t sub_2095D7DB4@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  _QWORD v18[4];

  v2 = v1;
  v4 = *v1;
  v5 = *(_QWORD *)(v4 + 80);
  v6 = sub_2095DCCB8();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18[-1] - v8;
  if ((*(uint64_t (**)(uint64_t))(v4 + 216))(v7) < 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a1, 1, 1, v5);
  v10 = v2[4];
  swift_beginAccess();
  v11 = v2[3];
  v18[0] = v10;
  swift_bridgeObjectRetain();
  MEMORY[0x20BD1013C](v18, v11, MEMORY[0x24BEE1768], v5, MEMORY[0x24BEE1778]);
  swift_bridgeObjectRelease();
  v12 = v2[4];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v9, 1, 1, v5);
  v18[3] = v12;
  swift_beginAccess();
  sub_2095DCA0C();
  sub_2095DCA24();
  result = swift_endAccess();
  v14 = v2[4];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    v2[4] = v16;
  return result;
}

uint64_t sub_2095D7F50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  result = v1 - v2;
  if (__OFSUB__(v1, v2))
    __break(1u);
  return result;
}

uint64_t sub_2095D7F64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v15 - v7;
  v16 = sub_2095DC9D0();
  (*(void (**)(void))(*(_QWORD *)v1 + 216))();
  sub_2095DCA84();
  sub_2095DCA6C();
  v9 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 216);
  v10 = swift_retain();
  if (v9(v10))
  {
    v11 = 0;
    while (1)
    {
      result = sub_2095D8538(v11, (uint64_t)v8);
      v13 = v11 + 1;
      if (__OFADD__(v11, 1))
        break;
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
      v14 = sub_2095DCA78();
      ++v11;
      if (v13 == (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 216))(v14))
        goto LABEL_5;
    }
    __break(1u);
  }
  else
  {
LABEL_5:
    swift_release();
    return v16;
  }
  return result;
}

uint64_t sub_2095D80BC()
{
  uint64_t v0;
  uint64_t result;

  swift_beginAccess();
  sub_2095DCA0C();
  sub_2095DCA00();
  result = swift_endAccess();
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  return result;
}

uint64_t sub_2095D8134()
{
  _QWORD *v0;
  uint64_t result;

  if (v0[5] == 0x7FFFFFFFFFFFFFFFLL)
  {
    result = (*(uint64_t (**)(void))(*v0 + 248))();
    if (v0[5] == 0x7FFFFFFFFFFFFFFFLL)
    {
      result = sub_2095DCCE8();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_2095D81C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  char *v32;
  uint64_t v33[3];
  uint64_t v34;

  v1 = *(_QWORD *)(*v0 + 80);
  v2 = sub_2095DCCB8();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v29 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v32 = (char *)&v24 - v6;
  v7 = *(_QWORD *)(v1 - 8);
  result = MEMORY[0x24BDAC7A8](v5);
  v30 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v0[4];
  if (v10 < 1)
    return result;
  v28 = v0[5];
  v27 = v28 - v10;
  if (v28 >= v10)
  {
    v11 = v10;
    if (v28 == v10)
    {
LABEL_9:
      v0[4] = 0;
      v22 = __OFSUB__(v11, v10);
      v23 = v11 - v10;
      if (!v22)
      {
        v0[5] = v23;
        return result;
      }
      goto LABEL_14;
    }
    v25 = v0;
    v12 = v0 + 3;
    result = swift_beginAccess();
    v13 = 0;
    v14 = MEMORY[0x24BEE1768];
    v15 = MEMORY[0x24BEE1778];
    v26 = v10;
    while (1)
    {
      v16 = v10 + v13;
      if (v10 + v13 >= v28)
        break;
      v17 = *v12;
      v33[0] = v10 + v13;
      swift_bridgeObjectRetain();
      v18 = v32;
      MEMORY[0x20BD1013C](v33, v17, v14, v1, v15);
      swift_bridgeObjectRelease();
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v18, 1, v1);
      if ((_DWORD)result == 1)
        goto LABEL_15;
      v19 = v30;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v30, v32, v1);
      v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
      v20 = v1;
      v21 = v29;
      v31(v29, 1, 1, v20);
      v34 = v16;
      swift_beginAccess();
      sub_2095DCA0C();
      sub_2095DCA24();
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v21, v19, v20);
      v31(v21, 0, 1, v20);
      v34 = v13;
      v1 = v20;
      sub_2095DCA24();
      swift_endAccess();
      result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v19, v20);
      ++v13;
      v10 = v26;
      if (v27 == v13)
      {
        v0 = v25;
        v11 = v25[5];
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_2095D846C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;

  v1 = *v0;
  v2 = sub_2095DCCB8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v8 - v5;
  result = (*(uint64_t (**)(uint64_t))(v1 + 216))(v4);
  if (v0[2] < result)
  {
    (*(void (**)(void))(*v0 + 208))();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

uint64_t sub_2095D8508()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2095D852C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t sub_2095D8538@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(*v2 + 80);
  v6 = sub_2095DCCB8();
  result = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - v8;
  v10 = v2[4];
  v11 = __OFADD__(a1, v10);
  v12 = a1 + v10;
  if (v11)
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess();
    v13 = v2[3];
    v15 = v12;
    swift_bridgeObjectRetain();
    MEMORY[0x20BD1013C](&v15, v13, MEMORY[0x24BEE1768], v5, MEMORY[0x24BEE1778]);
    swift_bridgeObjectRelease();
    v14 = *(_QWORD *)(v5 - 8);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v5);
    if ((_DWORD)result != 1)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a2, v9, v5);
  }
  __break(1u);
  return result;
}

void sub_2095D8644(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_2095D864C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2095D852C();
  *a1 = result;
  return result;
}

void (*sub_2095D8674(_QWORD *a1, uint64_t *a2))(_QWORD *a1)
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2095D86F0(v4, *a2);
  return sub_2095D86C4;
}

void sub_2095D86C4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2095D86F0(_QWORD *a1, uint64_t a2))(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v6 = *(_QWORD *)(v5 - 8);
  *a1 = v5;
  a1[1] = v6;
  v7 = malloc(*(_QWORD *)(v6 + 64));
  a1[2] = v7;
  sub_2095D8538(a2, (uint64_t)v7);
  return sub_2095D8750;
}

void sub_2095D8750(_QWORD *a1)
{
  void *v1;

  v1 = (void *)a1[2];
  (*(void (**)(void *, _QWORD))(a1[1] + 8))(v1, *a1);
  free(v1);
}

uint64_t sub_2095D8780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for CATQueue(0, *(_QWORD *)(a2 + 80), a3, a4);
  return sub_2095DCC94();
}

uint64_t sub_2095D87C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for CATQueue(0, *(_QWORD *)(a1 + 80), a3, a4);
  return sub_2095DCC88();
}

uint64_t sub_2095D8808()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 216))();
}

void sub_2095D8830(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_2095D8840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for CATQueue(0, *(_QWORD *)(a3 + 80), a3, a4);
  return sub_2095DCC64();
}

uint64_t sub_2095D8898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for CATQueue(0, *(_QWORD *)(a4 + 80), a3, a4);
  return sub_2095DCC58();
}

uint64_t sub_2095D88F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for CATQueue(0, *(_QWORD *)(a3 + 80), a3, a4);
  return sub_2095DCC7C();
}

uint64_t sub_2095D8940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for CATQueue(0, *(_QWORD *)(a3 + 80), a3, a4);
  return sub_2095D8E08(a1, a2, v7, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x24BEE1B68], MEMORY[0x24BEE07E0]);
}

uint64_t sub_2095D899C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for CATQueue(0, *(_QWORD *)(a3 + 80), a3, a4);
  return sub_2095D8E08(a1, a2, v7, a4, MEMORY[0x24BEE08B8], (uint64_t (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE07F0]);
}

uint64_t sub_2095D89F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for CATQueue(0, *(_QWORD *)(a3 + 80), a3, a4);
  return sub_2095D8C80(a1, a2);
}

_QWORD *sub_2095D8A40@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    *a2 = *result + 1;
  return result;
}

_QWORD *sub_2095D8A58(_QWORD *result)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    ++*result;
  return result;
}

void sub_2095D8A70()
{
  JUMPOUT(0x20BD10DCCLL);
}

uint64_t sub_2095D8A80()
{
  return MEMORY[0x24BEE1780];
}

void sub_2095D8A8C()
{
  JUMPOUT(0x20BD10DCCLL);
}

void sub_2095D8A9C()
{
  JUMPOUT(0x20BD10DCCLL);
}

void sub_2095D8AAC()
{
  JUMPOUT(0x20BD10DCCLL);
}

void sub_2095D8ABC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_2095D8AC8(uint64_t a1)
{
  MEMORY[0x20BD10DCC](&unk_2095E2C28, a1);
  return sub_2095DCC4C();
}

uint64_t sub_2095D8AFC()
{
  return 2;
}

uint64_t sub_2095D8B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for CATQueue(0, *(_QWORD *)(a1 + 80), a3, a4);
  MEMORY[0x20BD10DCC](&unk_2095E2C28, v4);
  v5 = sub_2095D8FB4();
  swift_release();
  return v5;
}

void sub_2095D8B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for CATQueue(0, *(_QWORD *)(a4 + 80), a3, a4);
  JUMPOUT(0x20BD10178);
}

uint64_t sub_2095D8BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for CATQueue(0, *(_QWORD *)(a4 + 80), a3, a4);
  return sub_2095DCA60();
}

uint64_t sub_2095D8C20()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for CATQueue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CATQueue);
}

uint64_t sub_2095D8C80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  void (*v12)(char *, uint64_t, uint64_t);
  char v13;
  void (*v14)(char *, uint64_t);
  uint64_t result;
  void (*v16)(char *, uint64_t);
  uint64_t v17;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v4 = sub_2095DCCAC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  v11 = sub_2095DCA30();
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, a1, v4);
  v12(v8, a2, v4);
  if ((v11 & 1) == 0)
  {
    v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    result = ((uint64_t (*)(char *, uint64_t))v16)(v10, v4);
    goto LABEL_5;
  }
  v13 = sub_2095DCA30();
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  result = ((uint64_t (*)(char *, uint64_t))v14)(v10, v4);
  if ((v13 & 1) == 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t sub_2095D8E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
  char v20;
  uint64_t result;
  uint64_t v22;
  uint64_t (*v23)(char *, char *, uint64_t, uint64_t);

  v23 = a6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v11 = a5(0, AssociatedTypeWitness, AssociatedConformanceWitness);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v22 - v14;
  v16 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v22 - v17;
  v19 = sub_2095DCA30();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a2, v11);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
    goto LABEL_5;
  }
  v20 = v23(v18, &v15[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
  if ((v20 & 1) == 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t dispatch thunk of CATAsyncStreamVending.makeStream()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t type metadata accessor for CATSerializer.Nucleus()
{
  uint64_t result;

  result = qword_2545A3AE8;
  if (!qword_2545A3AE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CATSerializer.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _OWORD v6[3];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2DF0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v6, 0, 41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2DF8);
  sub_2095DCB14();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_release();
  return v0;
}

uint64_t CATSerializer.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _OWORD v5[3];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2DF0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v5, 0, 41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2DF8);
  sub_2095DCB14();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t CATSerializer.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_allocObject();
  type metadata accessor for CATSerializer.Nucleus();
  v1 = swift_allocObject();
  sub_2095D9550();
  *(_QWORD *)(v0 + 16) = v1;
  return v0;
}

uint64_t CATSerializer.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0;
  type metadata accessor for CATSerializer.Nucleus();
  v2 = swift_allocObject();
  sub_2095D9550();
  *(_QWORD *)(v1 + 16) = v2;
  return v1;
}

Swift::Void __swiftcall CATSerializer.cancelAllTasks()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _OWORD v4[3];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2DF0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v4, 0, 41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2DF8);
  sub_2095DCB14();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t CATSerializer.enqueue<A>(respectingCancelAll:_:)(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2095D9D00(a1, a2, a3, a4);
}

uint64_t sub_2095D92F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = v0;
  if (*(_QWORD *)(v0 + 112))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CD8);
    sub_2095DCB74();
    swift_release();
  }
  v2 = v0
     + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_executionLoopContinuation;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E60);
  sub_2095DCB20();
  v4 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem);
  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem))
  {
    v5 = (uint64_t (*)(void))v4[1];
    swift_retain();
    swift_retain();
    sub_2095D1CE8(v5);
    swift_release();
    swift_release();
  }
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoop))
  {
    swift_retain();
    sub_2095DCB74();
    swift_release();
  }
  v6 = v1
     + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoopContinuation;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2DF8);
  sub_2095DCB20();
  v8 = v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phaseContinuation;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E58);
  sub_2095DCB20();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v10 = v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_executionLoopStream;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  sub_2095DBA40(*v4);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v12 = v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoopStream;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v14 = v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phaseStream;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_2095D9550()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  _OWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  MEMORY[0x24BDAC7A8](v2);
  v71 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E40);
  v69 = *(_QWORD *)(v4 - 8);
  v70 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v68 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E98);
  v64 = *(_QWORD *)(v6 - 8);
  v65 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v62 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E58);
  v66 = *(_QWORD *)(v8 - 8);
  v67 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v60 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E00);
  v61 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v59 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2EA0);
  v55 = *(_QWORD *)(v11 - 8);
  v56 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v53 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2DF8);
  v57 = *(_QWORD *)(v13 - 8);
  v58 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v51 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E80);
  v52 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v50 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2EA8);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E60);
  v48 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v21 = (char *)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E48);
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v48 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(_QWORD *)(v1 + 112) = 0;
  v26 = (_OWORD *)(v1
                 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem);
  *v26 = 0u;
  v26[1] = 0u;
  *(_OWORD *)((char *)v26 + 25) = 0u;
  *(_QWORD *)(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phase) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoop) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E10);
  v27 = *MEMORY[0x24BEE6A10];
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 104))(v19, v27, v16);
  sub_2095DCAE4();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_executionLoopStream, v25, v22);
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_executionLoopContinuation, v21, v49);
  v29 = v55;
  v28 = v56;
  v30 = v53;
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 104))(v53, v27, v56);
  v31 = v50;
  v32 = v51;
  sub_2095DCAE4();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v28);
  (*(void (**)(uint64_t, char *, uint64_t))(v52 + 32))(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoopStream, v31, v54);
  (*(void (**)(uint64_t, char *, uint64_t))(v57 + 32))(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoopContinuation, v32, v58);
  v34 = v64;
  v33 = v65;
  v35 = v62;
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 104))(v62, v27, v65);
  v36 = v59;
  v37 = v60;
  sub_2095DCAE4();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v33);
  (*(void (**)(uint64_t, char *, uint64_t))(v61 + 32))(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phaseStream, v36, v63);
  v39 = v66;
  v38 = v67;
  (*(void (**)(uint64_t, char *, uint64_t))(v66 + 32))(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phaseContinuation, v37, v67);
  v40 = *(void (**)(char *, uint64_t, uint64_t))(v39 + 16);
  v41 = v39;
  v42 = v38;
  v40(v37, v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phaseContinuation, v38);
  v72 = *(_QWORD *)(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phase);
  v43 = v68;
  sub_2095DCB14();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v37, v42);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v43, v70);
  v44 = sub_2095DCAD8();
  v45 = (uint64_t)v71;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v71, 1, 1, v44);
  v46 = (_QWORD *)swift_allocObject();
  v46[2] = 0;
  v46[3] = 0;
  v46[4] = v1;
  swift_retain();
  sub_2095D6DB8(v45, (uint64_t)&unk_2545A2EB8, (uint64_t)v46);
  swift_release();
  return v1;
}

uint64_t sub_2095D9B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[2] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E80);
  v4[3] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[4] = v6;
  v4[5] = *(_QWORD *)(v6 + 64);
  v4[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  v4[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095D9BBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  v7 = v5 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoopStream;
  v8 = sub_2095DCAD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v1, 1, 1, v8);
  v9 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v7, v6);
  v10 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v11 + v10, v2, v6);
  *(_QWORD *)(v11 + ((v4 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  *(_QWORD *)(v5 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoop) = sub_2095D6DB8(v1, (uint64_t)&unk_2545A2EC8, v11);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095D9D00(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)();
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v26[12];
  int v27;
  uint64_t v28;
  uint64_t (*v29)();
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v5 = v4;
  v27 = a1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2DF0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  MEMORY[0x24BDAC7A8](v13);
  v15 = &v26[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for CATAsyncGate();
  v16 = sub_2095D2D68();
  v17 = sub_2095DCAD8();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v15, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = a4;
  v18[5] = v16;
  v18[6] = a2;
  v18[7] = a3;
  v18[8] = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  v19 = sub_2095DA09C((uint64_t)v15, (uint64_t)&unk_2545A2E90, (uint64_t)v18);
  sub_2095D12F8((uint64_t)v15);
  swift_retain();
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2CD8);
  v21 = sub_2095D1D5C(v19, a4, v20, MEMORY[0x24BEE3F20]);
  v28 = v16;
  v29 = v21;
  v30 = v22;
  v31 = v23;
  v32 = v24;
  v33 = v27;
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2DF8);
  sub_2095DCB14();
  swift_release_n();
  swift_release();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
  return v19;
}

uint64_t sub_2095D9F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a1;
  v7 = (_QWORD *)swift_task_alloc();
  v6[5] = v7;
  *v7 = v6;
  v7[1] = sub_2095D9F70;
  return sub_2095D2F2C();
}

uint64_t sub_2095D9F70()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2095D9FC4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  sub_2095DCB8C();
  v3 = (uint64_t (*)(_QWORD))(**(int **)(v0 + 24) + *(_QWORD *)(v0 + 24));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_2095DA054;
  return v3(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2095DA054()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2095DA09C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2095D1630(a1, (uint64_t)v7);
  v8 = sub_2095DCAD8();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_2095D12F8((uint64_t)v7);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
  }
  else
  {
    sub_2095DCACC();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  v10 = sub_2095DCA90();
  v12 = v11;
  swift_unknownObjectRelease();
  if (v12 | v10)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v10;
    v14[3] = v12;
  }
  return swift_task_create();
}

uint64_t sub_2095DA208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[17] = a4;
  v5[18] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2545A2ED0);
  v5[19] = v6;
  v5[20] = *(_QWORD *)(v6 - 8);
  v5[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095DA26C()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E80);
  sub_2095DCB38();
  swift_beginAccess();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v1;
  *v1 = v0;
  v1[1] = sub_2095DA318;
  return sub_2095DCB44();
}

uint64_t sub_2095DA318()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2095DA36C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t Strong;
  _QWORD *v9;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 184) = v1;
  *(_QWORD *)(v0 + 192) = v2;
  v5 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 200) = v3;
  *(_QWORD *)(v0 + 208) = v4;
  *(_QWORD *)(v0 + 216) = v5;
  v6 = *(_BYTE *)(v0 + 104);
  *(_BYTE *)(v0 + 57) = v6;
  if (v1 == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 152));
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 16) = v1;
    *(_QWORD *)(v0 + 24) = v2;
    *(_QWORD *)(v0 + 32) = v3;
    *(_QWORD *)(v0 + 40) = v4;
    *(_QWORD *)(v0 + 48) = v5;
    *(_BYTE *)(v0 + 56) = v6;
    Strong = swift_weakLoadStrong();
    *(_QWORD *)(v0 + 224) = Strong;
    if (Strong)
    {
      return swift_task_switch();
    }
    else
    {
      sub_2095DBA24(*(_QWORD *)(v0 + 184));
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 176) = v9;
      *v9 = v0;
      v9[1] = sub_2095DA318;
      return sub_2095DCB44();
    }
  }
}

uint64_t sub_2095DA480()
{
  uint64_t v0;

  sub_2095DA540((__int128 *)(v0 + 16));
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2095DA4C8()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2095DBA24(*(_QWORD *)(v0 + 184));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v1;
  *v1 = v0;
  v1[1] = sub_2095DA318;
  return sub_2095DCB44();
}

uint64_t sub_2095DA540(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t (*v19)(void);
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  char *v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  char v41;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E40);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E48);
  v28 = *(_QWORD *)(v8 - 8);
  v29 = v8;
  v9 = *(_QWORD *)(v28 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v32 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2C38);
  MEMORY[0x24BDAC7A8](v10);
  v31 = (uint64_t)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E50);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2095DB708(a1, &v38);
  if ((_QWORD)v38)
  {
    v16 = *(_QWORD *)(v2 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phase);
    v33 = v38;
    v30 = v39;
    v34 = v39;
    v35 = v40;
    v36 = v41;
    v37 = v16;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E60);
    sub_2095DCB14();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    if (!*(_QWORD *)(v2 + 112))
    {
      v22 = v2
          + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_executionLoopStream;
      v23 = sub_2095DCAD8();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v31, 1, 1, v23);
      *(_QWORD *)&v30 = swift_allocObject();
      swift_weakInit();
      v24 = v28;
      v25 = v29;
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v32, v22, v29);
      v26 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      v27 = swift_allocObject();
      *(_QWORD *)(v27 + 16) = 0;
      *(_QWORD *)(v27 + 24) = 0;
      (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v27 + v26, v32, v25);
      *(_QWORD *)(v27 + ((v9 + v26 + 7) & 0xFFFFFFFFFFFFFFF8)) = v30;
      *(_QWORD *)(v2 + 112) = sub_2095D2A84(v31, (uint64_t)&unk_2545A2E70, v27);
      swift_release();
    }
    swift_release();
    swift_release();
    return swift_release();
  }
  else
  {
    v17 = *(_QWORD *)(v2
                    + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem);
    if (v17)
      v18 = (*(_BYTE *)(v2
                      + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem
                      + 40) & 1) == 0;
    else
      v18 = 1;
    if (!v18)
    {
      v19 = *(uint64_t (**)(void))(v2
                                + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem
                                + 8);
      swift_retain();
      swift_retain();
      swift_retain();
      sub_2095D1CE8(v19);
      sub_2095DBA40(v17);
    }
    v20 = *(_QWORD *)(v2 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phase)
        + 1;
    *(_QWORD *)(v2 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phase) = v20;
    *(_QWORD *)&v33 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E58);
    sub_2095DCB14();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2095DA900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[12] = a4;
  v5[13] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E78);
  v5[14] = v6;
  v5[15] = *(_QWORD *)(v6 - 8);
  v5[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2095DA964()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E48);
  sub_2095DCB38();
  swift_beginAccess();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v1;
  *v1 = v0;
  v1[1] = sub_2095DAA10;
  return sub_2095DCB44();
}

uint64_t sub_2095DAA10()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2095DAA64()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  uint64_t Strong;
  _QWORD *v6;

  v2 = *(_OWORD *)(v0 + 16);
  v1 = *(_OWORD *)(v0 + 32);
  v3 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 + 144) = v2;
  *(_OWORD *)(v0 + 160) = v1;
  *(_OWORD *)(v0 + 176) = v3;
  *(_QWORD *)(v0 + 192) = *(_QWORD *)(v0 + 64);
  if ((_QWORD)v2)
  {
    Strong = swift_weakLoadStrong();
    *(_QWORD *)(v0 + 200) = Strong;
    if (Strong)
    {
      swift_retain();
      swift_retain();
      swift_retain();
      return swift_task_switch();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      v6 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 136) = v6;
      *v6 = v0;
      v6[1] = sub_2095DAA10;
      return sub_2095DCB44();
    }
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2095DABAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 184);
  if ((v1 & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 192);
    v8 = *(_QWORD *)(v0 + 176);
    v9 = *(_QWORD *)(v0 + 160);
    v4 = *(_QWORD *)(v0 + 144);
    v10 = *(_QWORD *)(*(_QWORD *)(v0 + 200)
                    + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phase);
    swift_retain();
    swift_retain();
    swift_retain();
    if (v10 == v7)
    {
      v6 = v8;
      v5 = v9;
    }
    else
    {
      sub_2095D1CE8(*(uint64_t (**)(void))(v0 + 152));
      v6 = *(_QWORD *)(v0 + 176);
      v1 = *(_QWORD *)(v0 + 184);
      v5 = *(_QWORD *)(v0 + 160);
      v4 = *(_QWORD *)(v0 + 144);
    }
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 176);
    v3 = *(_QWORD *)(v0 + 160);
    v4 = *(_QWORD *)(v0 + 144);
    swift_retain();
    v5 = v3;
    swift_retain();
    v6 = v2;
    swift_retain();
  }
  v11 = *(_QWORD *)(v0 + 200);
  v12 = *(int **)(v0 + 168);
  v13 = *(_QWORD *)(v0 + 152);
  sub_2095D2EF8();
  v14 = OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem;
  *(_QWORD *)(v0 + 208) = OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem;
  v15 = v11 + v14;
  v18 = *(_QWORD *)v15;
  *(_QWORD *)v15 = v4;
  *(_QWORD *)(v15 + 8) = v13;
  *(_QWORD *)(v15 + 16) = v5;
  *(_QWORD *)(v15 + 24) = v12;
  *(_QWORD *)(v15 + 32) = v6;
  *(_BYTE *)(v15 + 40) = v1 & 1;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2095DBA40(v18);
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v16;
  *v16 = v0;
  v16[1] = sub_2095DAD3C;
  return sub_2095D1D08(v13, v5, v12);
}

uint64_t sub_2095DAD3C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2095DAD94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 200) + *(_QWORD *)(v0 + 208);
  swift_release();
  swift_release();
  swift_release();
  v2 = *(_QWORD *)v1;
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 25) = 0u;
  sub_2095DBA40(v2);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2095DAE44()
{
  uint64_t v0;
  _QWORD *v1;

  swift_release();
  swift_release();
  swift_release();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v1;
  *v1 = v0;
  v1[1] = sub_2095DAA10;
  return sub_2095DCB44();
}

uint64_t sub_2095DAED0()
{
  uint64_t v0;

  return v0;
}

uint64_t static Task<>.cat_serialized(on:operation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2095D9D00(1, a2, a3, a4);
}

uint64_t type metadata accessor for CATSerializer()
{
  return objc_opt_self();
}

uint64_t method lookup function for CATSerializer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CATSerializer.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2095DAF34()
{
  return type metadata accessor for CATSerializer.Nucleus();
}

void sub_2095DAF3C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  sub_2095DB0DC(319, &qword_2545A2E08, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE6A40]);
  if (v0 <= 0x3F)
  {
    sub_2095DB0DC(319, &qword_2545A2E18, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE6A98]);
    if (v1 <= 0x3F)
    {
      sub_2095DB138(319, &qword_2545A2E20, (uint64_t)&type metadata for CATSerializer.Nucleus.Command, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE6A40]);
      if (v2 <= 0x3F)
      {
        sub_2095DB138(319, &qword_2545A2E28, (uint64_t)&type metadata for CATSerializer.Nucleus.Command, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE6A98]);
        if (v3 <= 0x3F)
        {
          sub_2095DB138(319, &qword_2545A2E30, MEMORY[0x24BEE1E88], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE6A98]);
          if (v4 <= 0x3F)
          {
            sub_2095DB138(319, &qword_2545A2E38, MEMORY[0x24BEE1E88], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE6A40]);
            if (v5 <= 0x3F)
              swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

void sub_2095DB0DC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545A2E10);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_2095DB138(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t destroy for CATSerializer.Nucleus.Work()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for CATSerializer.Nucleus.Work(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CATSerializer.Nucleus.Work(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_retain();
  swift_release();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CATSerializer.Nucleus.Work(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = v4;
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for CATSerializer.Nucleus.Work(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CATSerializer.Nucleus.Work(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CATSerializer.Nucleus.Work()
{
  return &type metadata for CATSerializer.Nucleus.Work;
}

unint64_t destroy for CATSerializer.Nucleus.Command(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for CATSerializer.Nucleus.Command(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    v4 = *(_QWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 32) = v4;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  return a1;
}

uint64_t assignWithCopy for CATSerializer.Nucleus.Command(uint64_t a1, __int128 *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)a2;
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *(_QWORD *)a1 = v5;
      v8 = *((_QWORD *)a2 + 2);
      *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
      *(_QWORD *)(a1 + 16) = v8;
      v9 = *((_QWORD *)a2 + 4);
      *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
      *(_QWORD *)(a1 + 32) = v9;
      *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
      swift_retain();
      swift_retain();
      swift_retain();
      return a1;
    }
LABEL_7:
    v10 = *a2;
    v11 = a2[1];
    *(_OWORD *)(a1 + 25) = *(__int128 *)((char *)a2 + 25);
    *(_OWORD *)a1 = v10;
    *(_OWORD *)(a1 + 16) = v11;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_release();
    swift_release();
    swift_release();
    goto LABEL_7;
  }
  *(_QWORD *)a1 = v5;
  swift_retain();
  swift_release();
  v6 = *((_QWORD *)a2 + 2);
  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
  *(_QWORD *)(a1 + 16) = v6;
  swift_retain();
  swift_release();
  v7 = *((_QWORD *)a2 + 4);
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  *(_QWORD *)(a1 + 32) = v7;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
  return a1;
}

uint64_t assignWithTake for CATSerializer.Nucleus.Command(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  if (*(_QWORD *)a1 < 0xFFFFFFFFuLL)
    goto LABEL_5;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    swift_release();
    swift_release();
    swift_release();
LABEL_5:
    v4 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v4;
    *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for CATSerializer.Nucleus.Command(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 41))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CATSerializer.Nucleus.Command(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_2095DB6B4(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_2095DB6CC(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    v2 = a2 ^ 0x80000000;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
  }
  else
  {
    if (!a2)
      return result;
    v2 = (a2 - 1);
  }
  *(_QWORD *)result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CATSerializer.Nucleus.Command()
{
  return &type metadata for CATSerializer.Nucleus.Command;
}

_OWORD *sub_2095DB708(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(__int128 *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t sub_2095DB720()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2095DB744()
{
  return objectdestroy_2Tm(&qword_2545A2E48);
}

uint64_t sub_2095DB750()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E48) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v0 + v3;
  v5 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_2095D1128;
  return sub_2095DA900((uint64_t)v6, v7, v8, v4, v5);
}

uint64_t sub_2095DB7D0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2095DB80C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 48);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_2095D1748;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 40) = v6;
  *v6 = v4;
  v6[1] = sub_2095D9F70;
  return sub_2095D2F2C();
}

uint64_t sub_2095DB894()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2095DB8C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2095D1748;
  return sub_2095D9B2C((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_2095DB90C()
{
  return objectdestroy_2Tm(&qword_2545A2E80);
}

uint64_t objectdestroy_2Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2095DB9A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2545A2E80) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v0 + v3;
  v5 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_2095D1128;
  return sub_2095DA208((uint64_t)v6, v7, v8, v4, v5);
}

uint64_t sub_2095DBA24(uint64_t result)
{
  if (result != 1)
    return sub_2095DBA40(result);
  return result;
}

uint64_t sub_2095DBA40(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2095DC9AC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2095DC9B8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2095DC9C4()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_2095DC9D0()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_2095DC9DC()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_2095DC9E8()
{
  return MEMORY[0x24BEE0370]();
}

uint64_t sub_2095DC9F4()
{
  return MEMORY[0x24BEE03E8]();
}

uint64_t sub_2095DCA00()
{
  return MEMORY[0x24BEE0458]();
}

uint64_t sub_2095DCA0C()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_2095DCA18()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_2095DCA24()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_2095DCA30()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_2095DCA3C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2095DCA48()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2095DCA54()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_2095DCA60()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_2095DCA6C()
{
  return MEMORY[0x24BEE1150]();
}

uint64_t sub_2095DCA78()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_2095DCA84()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2095DCA90()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2095DCA9C()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_2095DCAA8()
{
  return MEMORY[0x24BEE6878]();
}

uint64_t sub_2095DCAB4()
{
  return MEMORY[0x24BEE68B0]();
}

uint64_t sub_2095DCAC0()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_2095DCACC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2095DCAD8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2095DCAE4()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_2095DCAF0()
{
  return MEMORY[0x24BEE69E8]();
}

uint64_t sub_2095DCAFC()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_2095DCB08()
{
  return MEMORY[0x24BEE6A18]();
}

uint64_t sub_2095DCB14()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_2095DCB20()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_2095DCB2C()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t sub_2095DCB38()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_2095DCB44()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_2095DCB50()
{
  return MEMORY[0x24BEE6A78]();
}

uint64_t sub_2095DCB5C()
{
  return MEMORY[0x24BEE6A98]();
}

uint64_t sub_2095DCB68()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_2095DCB74()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_2095DCB80()
{
  return MEMORY[0x24BEE6B00]();
}

uint64_t sub_2095DCB8C()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_2095DCB98()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_2095DCBA4()
{
  return MEMORY[0x24BEE6C30]();
}

uint64_t sub_2095DCBB0()
{
  return MEMORY[0x24BEE6C80]();
}

uint64_t sub_2095DCBBC()
{
  return MEMORY[0x24BEE6CA8]();
}

uint64_t sub_2095DCBC8()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_2095DCBD4()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_2095DCBE0()
{
  return MEMORY[0x24BEE6CD0]();
}

uint64_t sub_2095DCBEC()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t sub_2095DCBF8()
{
  return MEMORY[0x24BEE6CE8]();
}

uint64_t sub_2095DCC04()
{
  return MEMORY[0x24BEE6D08]();
}

uint64_t sub_2095DCC10()
{
  return MEMORY[0x24BEE6D28]();
}

uint64_t sub_2095DCC1C()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t sub_2095DCC28()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_2095DCC34()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_2095DCC40()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_2095DCC4C()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t sub_2095DCC58()
{
  return MEMORY[0x24BEE1988]();
}

uint64_t sub_2095DCC64()
{
  return MEMORY[0x24BEE1990]();
}

uint64_t sub_2095DCC70()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_2095DCC7C()
{
  return MEMORY[0x24BEE19C0]();
}

uint64_t sub_2095DCC88()
{
  return MEMORY[0x24BEE19F8]();
}

uint64_t sub_2095DCC94()
{
  return MEMORY[0x24BEE1A18]();
}

uint64_t sub_2095DCCA0()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_2095DCCAC()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_2095DCCB8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2095DCCC4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2095DCCD0()
{
  return MEMORY[0x24BEE6D68]();
}

uint64_t sub_2095DCCDC()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_2095DCCE8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2095DCCF4()
{
  return MEMORY[0x24BEE3D90]();
}

uint64_t sub_2095DCD00()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_2095DCD0C()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_2095DCD18()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2095DCD24()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2095DCD30()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2095DCD3C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2095DCD48()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2095DCD54()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2095DCD60()
{
  return MEMORY[0x24BEE4328]();
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

Boolean CFHTTPMessageAppendBytes(CFHTTPMessageRef message, const UInt8 *newBytes, CFIndex numBytes)
{
  return MEMORY[0x24BDB7298](message, newBytes, numBytes);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x24BDB72A0](message);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x24BDB72A8](message);
}

CFStringRef CFHTTPMessageCopyRequestMethod(CFHTTPMessageRef request)
{
  return (CFStringRef)MEMORY[0x24BDB72B8](request);
}

CFURLRef CFHTTPMessageCopyRequestURL(CFHTTPMessageRef request)
{
  return (CFURLRef)MEMORY[0x24BDB72C0](request);
}

CFDataRef CFHTTPMessageCopySerializedMessage(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x24BDB72C8](message);
}

CFHTTPMessageRef CFHTTPMessageCreateEmpty(CFAllocatorRef alloc, Boolean isRequest)
{
  return (CFHTTPMessageRef)MEMORY[0x24BDB72D0](alloc, isRequest);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x24BDB72D8](alloc, requestMethod, url, httpVersion);
}

CFHTTPMessageRef CFHTTPMessageCreateResponse(CFAllocatorRef alloc, CFIndex statusCode, CFStringRef statusDescription, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x24BDB72E0](alloc, statusCode, statusDescription, httpVersion);
}

Boolean CFHTTPMessageIsHeaderComplete(CFHTTPMessageRef message)
{
  return MEMORY[0x24BDB72F8](message);
}

Boolean CFHTTPMessageIsRequest(CFHTTPMessageRef message)
{
  return MEMORY[0x24BDB7300](message);
}

void CFHTTPMessageSetBody(CFHTTPMessageRef message, CFDataRef bodyData)
{
  MEMORY[0x24BDB7308](message, bodyData);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x24BDB7310](message, headerField, value);
}

CFTypeRef CFReadStreamCopyProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x24BDBC228](stream, propertyName);
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x24BDBC278](stream, q);
}

uint64_t CFReadStreamSignalEvent()
{
  return MEMORY[0x24BDBC288]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x24BDBC9C0](stream, q);
}

uint64_t CFWriteStreamSignalEvent()
{
  return MEMORY[0x24BDBC9D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x24BDD1250](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x24BDF5798](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x24BDF57A0](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x24BDF57B0](target, runLoop, runLoopMode);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8E08](trust, result);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x24BDE8E28](trust, anchorCertificates);
}

OSStatus SecTrustSetAnchorCertificatesOnly(SecTrustRef trust, Boolean anchorCertificatesOnly)
{
  return MEMORY[0x24BDE8E30](trust, anchorCertificatesOnly);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x24BDE8E50](trust, policies);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
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

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x24BEDCE78](cls, outCount);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x24BEDCED0](cls);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x24BDADF98](source, value);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x24BDAE458](a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x24BDAE5A0](a1, a2, a3, a4);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE6C0](*(_QWORD *)&a1, a2, a3);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE770](*(_QWORD *)&a1, a2, a3);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int listen(int a1, int a2)
{
  return MEMORY[0x24BDAEA78](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x24BEDD4B0](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x24BEDD4B8](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x24BEDD4D8](proto, outCount);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x24BEDD518](str);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x24BDAFFF0](__str, __sep);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x24BEE4D60]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

