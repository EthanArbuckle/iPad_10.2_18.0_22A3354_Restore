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

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
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

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_18F80EDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_18F80EF08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F80F200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F80F4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void CNRunWithLock(void *a1, void *a2)
{
  void (**v3)(_QWORD);
  id v4;

  v4 = a1;
  v3 = a2;
  objc_msgSend(v4, "lock");
  v3[2](v3);
  objc_msgSend(v4, "unlock");

}

void sub_18F80F55C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18F80F57C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18F80F530);
}

id cn_objectResultWithObjectLock(void *a1, void *a2)
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
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __cn_objectResultWithObjectLock_block_invoke;
  v8[3] = &unk_1E29B8BE8;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  cn_runWithObjectLock(v3, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_18F80FBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void cn_runWithObjectLock(void *a1, void *a2)
{
  void (**v3)(_QWORD);
  id obj;

  v3 = a2;
  obj = a1;
  objc_sync_enter(obj);
  v3[2](v3);

  objc_sync_exit(obj);
}

void __cn_objectResultWithObjectLock_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_18F80FFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18F8108C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18F8109A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PAAccessLoggerFunction()
{
  return (id)classPAAccessLogger;
}

void sub_18F811C68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F811DE8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18F81204C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CNIdentity_block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

void sub_18F812460(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18F8125E4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t CNArrayFlatten_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_flatten");
}

Class initPAAccessLogger()
{
  Class result;

  if (LoadPrivacyAccounting_loadPredicate != -1)
    dispatch_once(&LoadPrivacyAccounting_loadPredicate, &__block_literal_global_178);
  result = objc_getClass("PAAccessLogger");
  classPAAccessLogger = (uint64_t)result;
  getPAAccessLoggerClass = (uint64_t (*)())PAAccessLoggerFunction;
  return result;
}

uint64_t CNEitherIsLeft_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLeft");
}

void sub_18F813EBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F813F50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F8141B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F81424C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F8142E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F814368(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL CNIsArrayEmpty_block_invoke(uint64_t a1, void *a2)
{
  return !a2 || objc_msgSend(a2, "count") == 0;
}

void sub_18F814F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

Class initACAccountStore()
{
  Class result;

  if (LoadAccounts_loadPredicate != -1)
    dispatch_once(&LoadAccounts_loadPredicate, &__block_literal_global_12);
  result = objc_getClass("ACAccountStore");
  classACAccountStore = (uint64_t)result;
  getACAccountStoreClass = (uint64_t (*)())ACAccountStoreFunction;
  return result;
}

void sub_18F816930(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 184));
  _Unwind_Resume(a1);
}

id CNResultWithLock(void *a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  void *v5;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "lock");
  v4[2](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unlock");

  return v5;
}

void sub_18F81711C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18F81713C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18F8170ECLL);
}

void sub_18F81743C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL CNIsStringNonempty_block_invoke_2(uint64_t a1, void *a2)
{
  return a2 && objc_msgSend(a2, "length") != 0;
}

Class initPAApplication()
{
  Class result;

  if (LoadPrivacyAccounting_loadPredicate != -1)
    dispatch_once(&LoadPrivacyAccounting_loadPredicate, &__block_literal_global_178);
  result = objc_getClass("PAApplication");
  classPAApplication = (uint64_t)result;
  getPAApplicationClass = (uint64_t (*)())PAApplicationFunction;
  return result;
}

id PAApplicationFunction()
{
  return (id)classPAApplication;
}

BOOL sIsNotEmpty_block_invoke_7(uint64_t a1, void *a2)
{
  return a2 && objc_msgSend(a2, "length") != 0;
}

uint64_t CNIsChineseJapaneseKoreanString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v1))
  {
    v2 = 0;
  }
  else
  {
    if (CNChineseJapaneseKoreanPlusWhitelistedCharacterUSet_onceToken != -1)
      dispatch_once(&CNChineseJapaneseKoreanPlusWhitelistedCharacterUSet_onceToken, &__block_literal_global_26);
    v2 = CNContentsExclusivelyInCharacterSet(v1, CNChineseJapaneseKoreanPlusWhitelistedCharacterUSet_set);
  }

  return v2;
}

const __CFString *CNNameDelimiterForString(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v1))
    goto LABEL_12;
  if (CNKatakanaCharacterUSet_onceToken != -1)
    dispatch_once(&CNKatakanaCharacterUSet_onceToken, &__block_literal_global_33);
  if ((CNContentsExclusivelyInCharacterSet(v1, CNKatakanaCharacterUSet_set) & 1) == 0)
  {
LABEL_12:
    if (CNIsChineseJapaneseKoreanString(v1))
      v2 = &stru_1E29BCC70;
    else
      v2 = CFSTR(" ");
  }
  else
  {
    v2 = CFSTR("・");
  }

  return v2;
}

uint64_t CNContentsExclusivelyInCharacterSet(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  v3 = a1;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v3))
  {
    v4 = 1;
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __CNContentsExclusivelyInCharacterSet_block_invoke;
    v7[3] = &__block_descriptor_40_e13__24__0r_S8Q16l;
    v7[4] = a2;
    objc_msgSend(v3, "_cn_resultWithAllCharacters:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "BOOLValue");

  }
  return v4;
}

BOOL CNIsStringEmpty_block_invoke(uint64_t a1, void *a2)
{
  return !a2 || objc_msgSend(a2, "length") == 0;
}

uint64_t CNCancelableCancel_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

void sub_18F818C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F818FF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18F819064(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F819604(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18F819690(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F819AE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F819E14(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18F81A000(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 104));
  _Unwind_Resume(a1);
}

void sub_18F81A128(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F81A578(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

id CNPromiseCompletionHandler(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  v1 = a1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __CNPromiseCompletionHandler_block_invoke;
  aBlock[3] = &unk_1E29BBD38;
  v7 = v1;
  v2 = v1;
  v3 = _Block_copy(aBlock);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

void sub_18F81B9D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL CNIsIndexSetEmpty_block_invoke(uint64_t a1, void *a2)
{
  return !a2 || objc_msgSend(a2, "count") == 0;
}

void sub_18F81C23C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11)
{
  uint64_t v11;

  objc_destroyWeak((id *)(v11 - 176));
  objc_destroyWeak((id *)(v11 - 168));
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

void sub_18F81C608(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_18F81C948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  uint64_t v15;

  objc_destroyWeak(v10);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 112));
  _Unwind_Resume(a1);
}

void sub_18F81CED0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18F81D030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F81D2E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18F81D434(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F81DBC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F81DD24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F81DED8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F81E498(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sSerialDispatchQueueSchedulerProvider_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNScheduler serialDispatchQueueSchedulerWithName:](CNScheduler, "serialDispatchQueueSchedulerWithName:", a2);
}

void sub_18F81FA04(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18F820124(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18F820890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

id sLongestString_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v4, "length");
  if (v6 <= objc_msgSend(v5, "length"))
    v7 = v5;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

id PATCCAccessFunction()
{
  return (id)classPATCCAccess;
}

Class initPATCCAccess()
{
  Class result;

  if (LoadPrivacyAccounting_loadPredicate != -1)
    dispatch_once(&LoadPrivacyAccounting_loadPredicate, &__block_literal_global_178);
  result = objc_getClass("PATCCAccess");
  classPATCCAccess = (uint64_t)result;
  getPATCCAccessClass = (uint64_t (*)())PATCCAccessFunction;
  return result;
}

void sub_18F821BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18F821FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F822B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CNArrayCompactMapFastPath(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, void *);
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v22 = v3;
  v5 = objc_msgSend(v3, "count");
  v6 = v5;
  if (v5 >= 0x81)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99768];
    v23 = CFSTR("count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, CFSTR("CNArrayCompactMapFastPath called with too many objects"), v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v20);
  }
  v7 = 8 * v5;
  MEMORY[0x1E0C80A78]();
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, 8 * v6);
  v21[1] = v21;
  v9 = 0;
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CNNullToNil_block_invoke_3((uint64_t)&__block_literal_global_2_1, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_storeStrong((id *)&v8[8 * v9++], v12);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    do
    {

      v7 -= 8;
    }
    while (v7);
  }

  return v14;
}

id CNNullToNil_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;

  v2 = a2;
  if ((id)*MEMORY[0x1E0C9B0D0] == v2
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v3 = (id)objc_claimAutoreleasedReturnValue(),
        v3,
        v3 == v2))
  {
    v4 = 0;
  }
  else
  {
    v4 = v2;
  }

  return v4;
}

id CNArrayMapFastPath(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, void *);
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  v6 = v5;
  if (v5 >= 0x81)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99768];
    v22 = CFSTR("count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, CFSTR("CNArrayMapFastPath called with too many objects"), v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v20);
  }
  v7 = 8 * v5;
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, 8 * v6);
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CNNilToNull_block_invoke_2((uint64_t)&__block_literal_global_1_2, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(void **)&v8[8 * i];
      *(_QWORD *)&v8[8 * i] = v12;

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    do
    {

      v7 -= 8;
    }
    while (v7);
  }

  return v14;
}

id CNNilToNull_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

BOOL CNIsNull_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99E38];
  v3 = a2;
  objc_msgSend(v2, "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4 == v3;
}

BOOL CNIsNotNull_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99E38];
  v3 = a2;
  objc_msgSend(v2, "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4 != v3;
}

uint64_t sTrim_block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_trimmedString");
}

id CNSortKeyStringForString(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  const char *v5;
  char *v6;
  id v7;
  void *v8;
  size_t v10;

  v3 = a1;
  v4 = v3;
  if (!a2)
    goto LABEL_7;
  if (!objc_msgSend(v3, "length"))
    goto LABEL_7;
  v10 = 0;
  v5 = CNCreateSortKey(v4, a2, 0, &v10);
  if (!v5)
    goto LABEL_7;
  v6 = (char *)v5;
  if (!v10
    || (v7 = objc_alloc(MEMORY[0x1E0CB3940]),
        (v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, v10, 5, 1)) == 0))
  {
    free(v6);
LABEL_7:
    v8 = 0;
  }

  return v8;
}

const char *CNCreateSortKey(void *a1, uint64_t a2, uint64_t a3, size_t *a4)
{
  __CFString *v6;
  uint64_t v7;
  CFIndex v8;
  uint64_t v9;
  const UniChar *CharactersPtr;
  UniChar *v11;
  unsigned int SortKey;
  char *v13;
  const char *v14;
  _QWORD v16[502];
  CFRange v17;

  v16[500] = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = -[__CFString length](v6, "length");
  v8 = v7;
  v9 = a2;
  if (a2)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v9 = CNCreateCollatorWithPreferredLocale(0, 0);
    if (v8)
    {
LABEL_3:
      CharactersPtr = CFStringGetCharactersPtr(v6);
      v11 = (UniChar *)CharactersPtr;
      if (!CharactersPtr)
      {
        v11 = (UniChar *)malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
        v17.location = 0;
        v17.length = v8;
        CFStringGetCharacters(v6, v17, v11);
      }
      ucol_setStrength();
      SortKey = ucol_getSortKey();
      v13 = (char *)malloc_type_calloc(SortKey, 1uLL, 0xEA638985uLL);
      v14 = v13;
      if (SortKey < 0xFA1)
      {
        memcpy(v13, v16, SortKey);
        if (CharactersPtr)
          goto LABEL_13;
      }
      else
      {
        SortKey = ucol_getSortKey();
        if (CharactersPtr)
          goto LABEL_13;
      }
      free(v11);
LABEL_13:
      if (a4)
      {
        *a4 = SortKey - 1;
        *a4 = strlen(v14);
      }
      goto LABEL_15;
    }
  }
  v14 = 0;
  if (a4)
    *a4 = 0;
LABEL_15:
  if (v9 != a2 && v9)
    ucol_close();

  return v14;
}

CNApplicationProxy *CNApplicationProxyFromLSApplicationProxy_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNApplicationProxy *v3;

  v2 = a2;
  v3 = -[CNApplicationProxy initWithLSApplicationProxy:]([CNApplicationProxy alloc], "initWithLSApplicationProxy:", v2);

  return v3;
}

void sub_18F825B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 152));
  _Unwind_Resume(a1);
}

void sub_18F825FA8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18F8263E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18F82669C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_18F826C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  uint64_t v9;

  objc_destroyWeak((id *)(v9 - 176));
  _Block_object_dispose((const void *)(v9 - 168), 8);
  _Block_object_dispose((const void *)(v9 - 136), 8);
  _Unwind_Resume(a1);
}

id sSynchronousSerialDispatchQueueSchedulerProvider_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[CNScheduler synchronousSerialDispatchQueueWithName:](CNScheduler, "synchronousSerialDispatchQueueWithName:", a2);
}

void sub_18F827E58(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL CNIsArrayNonEmpty_block_invoke_2(uint64_t a1, void *a2)
{
  return a2 && objc_msgSend(a2, "count") != 0;
}

BOOL CNIsDataEmpty_block_invoke(uint64_t a1, void *a2)
{
  return !a2 || objc_msgSend(a2, "length") == 0;
}

void sub_18F829680(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18F829770(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL CNIsDictionaryEmpty_block_invoke(uint64_t a1, void *a2)
{
  return !a2 || objc_msgSend(a2, "count") == 0;
}

id CNComparatorForSortingByAuxiliaryValues(uint64_t a1, uint64_t a2)
{
  return +[_CNSortsByPositionInAuxiliaryArray comparatorForSortingAccordingToAuxiliaryValues:transform:](_CNSortsByPositionInAuxiliaryArray, "comparatorForSortingAccordingToAuxiliaryValues:transform:", a1, a2);
}

void sub_18F829EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F82A078(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18F82A738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CNEmailAddressSafeUserVisible_block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[CNEmailAddressUtilities safeUserVisibleEmailAddress:](CNEmailAddressUtilities, "safeUserVisibleEmailAddress:", a2);
}

uint64_t initMGCopyAnswer(uint64_t a1, uint64_t a2)
{
  if (LoadMobileKeyBag_loadPredicate != -1)
    dispatch_once(&LoadMobileKeyBag_loadPredicate, &__block_literal_global_60);
  softLinkMGCopyAnswer = (uint64_t (*)())dlsym((void *)LoadMobileKeyBag_frameworkLibrary, "MGCopyAnswer");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkMGCopyAnswer)(a1, a2);
}

id CNAggregateComparator(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v1 = (objc_class *)MEMORY[0x1E0C99D20];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithArray:copyItems:", v2, 1);

  v4 = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___CNAggregateComparatorFromArray_block_invoke;
  aBlock[3] = &unk_1E29BB9A8;
  v9 = v4;
  v5 = _Block_copy(aBlock);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void sub_18F82BD34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18F82BED0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CNCopyCharacterUSetWithPattern(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 10);
  v1 = uset_openPattern();
  v2 = v1;
  MEMORY[0x1940049B0](v1);
  return v2;
}

uint64_t initMKBDeviceUnlockedSinceBoot()
{
  if (LoadMobileKeyBag_loadPredicate != -1)
    dispatch_once(&LoadMobileKeyBag_loadPredicate, &__block_literal_global_60);
  softLinkMKBDeviceUnlockedSinceBoot = (uint64_t (*)())dlsym((void *)LoadMobileKeyBag_frameworkLibrary, "MKBDeviceUnlockedSinceBoot");
  return softLinkMKBDeviceUnlockedSinceBoot();
}

id CNObjectFromJSONString_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

Class initMCProfileConnection()
{
  Class result;

  if (LoadManagedConfiguration_loadPredicate_0 != -1)
    dispatch_once(&LoadManagedConfiguration_loadPredicate_0, &__block_literal_global_118);
  result = objc_getClass("MCProfileConnection");
  classMCProfileConnection = (uint64_t)result;
  getMCProfileConnectionClass = (uint64_t (*)())MCProfileConnectionFunction;
  return result;
}

BOOL CNIsSetEmpty_block_invoke(uint64_t a1, void *a2)
{
  return !a2 || objc_msgSend(a2, "count") == 0;
}

id CNLogicalNot(void *a1)
{
  id v1;
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __CNLogicalNot_block_invoke;
  v5[3] = &unk_1E29BC3F8;
  v6 = v1;
  v2 = v1;
  v3 = (void *)objc_msgSend(v5, "copy");

  return v3;
}

CNReaderWriterScheduler *sReaderWriterSchedulerProvider_block_invoke_3()
{
  return objc_alloc_init(CNReaderWriterScheduler);
}

void sub_18F82E3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  id *v25;
  uint64_t v26;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Unwind_Resume(a1);
}

id CNResultWithAutoreleasePool(void *a1)
{
  void (**v1)(_QWORD);
  void *v2;
  void *v3;

  v1 = a1;
  v2 = (void *)MEMORY[0x194004260]();
  v1[2](v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);

  return v3;
}

void sub_18F82E5F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CNCreateCollatorWithPreferredLocale(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  const char *CStringPtr;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  int v13;

  v13 = 0;
  v2 = a2;
  v3 = v2;
  if (-[__CFString length](v2, "length"))
  {
    if (!v2)
      goto LABEL_10;
  }
  else
  {
    v3 = (__CFString *)CNCopyUserLanguage();

    if (!v3)
      goto LABEL_10;
  }
  CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  if (CStringPtr)
  {
    v5 = CStringPtr;
    v6 = 0;
    goto LABEL_11;
  }
  v7 = -[__CFString maximumLengthOfBytesUsingEncoding:](v3, "maximumLengthOfBytesUsingEncoding:", 1);
  v12 = 0;
  v5 = malloc_type_malloc(v7 + 1, 0x102A8723uLL);
  if ((-[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v5, v7, &v12, 1, 0, 0, -[__CFString length](v3, "length"), 0) & 1) != 0)
  {
    v5[v12] = 0;
    v6 = 1;
    goto LABEL_11;
  }
  free(v5);
LABEL_10:
  v6 = 0;
  v5 = 0;
LABEL_11:
  if (v5)
    v8 = v5;
  else
    v8 = "en";
  v9 = ucol_open();
  if (v13 >= 1)
    v10 = 0;
  else
    v10 = v9;
  ucol_setAttribute();
  if (v6)
    free(v8);

  return v10;
}

CFLocaleIdentifier CNCopyUserLanguage()
{
  const __CFArray *v0;
  const __CFArray *v1;
  const __CFString *ValueAtIndex;
  CFLocaleIdentifier CanonicalLanguageIdentifierFromString;

  v0 = (const __CFArray *)CFPreferencesCopyAppValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B228]);
  if (!v0)
    goto LABEL_6;
  v1 = v0;
  if (CFArrayGetCount(v0) <= 0)
  {
    CFRelease(v1);
LABEL_6:
    CanonicalLanguageIdentifierFromString = CFSTR("en");
    CFRetain(CFSTR("en"));
    return CanonicalLanguageIdentifierFromString;
  }
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v1, 0);
  CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(0, ValueAtIndex);
  CFRelease(v1);
  if (!CanonicalLanguageIdentifierFromString)
    goto LABEL_6;
  return CanonicalLanguageIdentifierFromString;
}

id CopyViaSecureCoding(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v1 = (objc_class *)MEMORY[0x1E0CB36F8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeObject:forKey:", v2, CFSTR("key"));
  objc_msgSend(v3, "finishEncoding");
  v4 = objc_alloc(MEMORY[0x1E0CB3710]);
  objc_msgSend(v3, "encodedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = (void *)objc_msgSend(v4, "initForReadingFromData:error:", v5, &v10);

  v7 = objc_opt_class();
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", v7, CFSTR("key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishDecoding");

  return v8;
}

id CopyViaSecureCodingWithAllowedClasses(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v3 = (objc_class *)MEMORY[0x1E0CB36F8];
  v4 = a2;
  v5 = a1;
  v6 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("key"));
  objc_msgSend(v6, "finishEncoding");
  v7 = objc_alloc(MEMORY[0x1E0CB3710]);
  objc_msgSend(v6, "encodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = (void *)objc_msgSend(v7, "initForReadingFromData:error:", v8, &v15);

  v10 = objc_opt_class();
  objc_msgSend(v4, "arrayByAddingObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v12, CFSTR("key"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "finishDecoding");
  return v13;
}

id CopyViaXPCCoding(void *a1)
{
  void *v1;
  id v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3B30];
  v2 = a1;
  objc_msgSend(v1, "_testEncodeAndDecodeObject:allowedClass:", v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id CopyViaXPCCodingWithAllowedClasses(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v3, "arrayByAddingObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3B30];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_testEncodeAndDecodeObject:allowedClasses:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t _block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuccess");
}

uint64_t sCNResultIsSuccess_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFailure");
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t CNVirtualSchedulerJobTimeComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "time");
  v6 = objc_msgSend(v4, "time");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

void sub_18F82FFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CNCoreDelegateInfo *CNCoreDelegateInfoFromFamilyMember_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNCoreDelegateInfo *v3;

  v2 = a2;
  v3 = -[CNCoreDelegateInfo initWithFamilyMember:]([CNCoreDelegateInfo alloc], "initWithFamilyMember:", v2);

  return v3;
}

CNCoreDelegateInfo *CNCoreDelegateInfoFromACAccount_block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  CNCoreDelegateInfo *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CNCoreDelegateInfo *v16;

  v2 = (objc_class *)MEMORY[0x1E0CB3850];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v3, "parentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGivenName:", v6);

  objc_msgSend(v3, "parentAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_lastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyName:", v8);

  objc_msgSend(v3, "childAccounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") != 0;

  v11 = [CNCoreDelegateInfo alloc];
  objc_msgSend(v3, "_cn_dsid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_altDSID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_appleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_principalPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[CNCoreDelegateInfo initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:](v11, "initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:", v12, v13, v14, v15, v4, v10);
  return v16;
}

void sub_18F832E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F833040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F8332CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18F8334F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

id CNRangeDividedIntoStridesOfLength(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t i;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  v4 = a2;
  v5 = a1;
  if (a2 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a1, a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = v5 + v4; v5 < i; v4 = v8)
    {
      v8 = v4 - a3;
      if (v4 >= a3)
        v9 = a3;
      else
        v9 = v4;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v5, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_cn_addNonNilObject:", v10);

      v5 += a3;
    }
  }
  return v6;
}

id CNRangeDividedIntoBalancedStridesOfLength(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  v5 = a1;
  if (a2 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a1, a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 + a2;
    if (v5 < v5 + a2)
    {
      v8 = vcvtpd_u64_f64((double)a2 / (double)a3);
      v9 = (unint64_t)(double)(a2 / v8);
      v10 = a2 % v8;
      do
      {
        if (v10)
          v11 = v9 + 1;
        else
          v11 = v9;
        if (v10)
          --v10;
        else
          v10 = 0;
        if (v11 >= v7 - v5)
          v12 = v7 - v5;
        else
          v12 = v11;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v5, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_cn_addNonNilObject:", v13);

        v5 += v12;
      }
      while (v5 < v7);
    }
  }
  return v6;
}

Class initPAOutOfProcessPickerAccess()
{
  Class result;

  if (LoadPrivacyAccounting_loadPredicate != -1)
    dispatch_once(&LoadPrivacyAccounting_loadPredicate, &__block_literal_global_178);
  result = objc_getClass("PAOutOfProcessPickerAccess");
  classPAOutOfProcessPickerAccess = (uint64_t)result;
  getPAOutOfProcessPickerAccessClass = (uint64_t (*)())PAOutOfProcessPickerAccessFunction;
  return result;
}

id PAOutOfProcessPickerAccessFunction()
{
  return (id)classPAOutOfProcessPickerAccess;
}

id initPAAuthenticatedClientIdentity(_OWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  void *v6;
  _OWORD v8[2];

  v3 = LoadPrivacyAccounting_loadPredicate;
  v4 = a2;
  if (v3 != -1)
    dispatch_once(&LoadPrivacyAccounting_loadPredicate, &__block_literal_global_178);
  softLinkPAAuthenticatedClientIdentity = (uint64_t (*)())dlsym((void *)LoadPrivacyAccounting_frameworkLibrary, "PAAuthenticatedClientIdentity");
  v5 = a1[1];
  v8[0] = *a1;
  v8[1] = v5;
  ((void (*)(_OWORD *, id))softLinkPAAuthenticatedClientIdentity)(v8, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id CNJSONStringFromObject_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a2, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v2, 4);

  return v3;
}

void sub_18F835EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CNCacheMissPolicyNewMutableArray_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99DE8], "array");
}

void sub_18F836BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F837274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sLock_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lock");
}

uint64_t sUnlock_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unlock");
}

void CNRunWithLocks(void *a1, void *a2)
{
  void (**v3)(_QWORD);
  id v4;

  v4 = a1;
  v3 = a2;
  objc_msgSend(v4, "_cn_each:", &__block_literal_global_9);
  v3[2](v3);
  objc_msgSend(v4, "_cn_each_reverse:", &__block_literal_global_1);

}

void sub_18F8378F0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18F837910(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18F8378BCLL);
}

void CNRunWithLockCatching(void *a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  id v6;
  id v7;

  v7 = a1;
  v5 = a2;
  v6 = a3;
  objc_msgSend(v7, "lock");
  v5[2](v5);
  objc_msgSend(v7, "unlock");

}

void sub_18F83799C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id CNResultWithLocks(void *a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  void *v5;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "_cn_each:", &__block_literal_global_9);
  v4[2](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_each_reverse:", &__block_literal_global_1);

  return v5;
}

void sub_18F837A94(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18F837AB4(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18F837A5CLL);
}

void __softLinkSimulateCrashAvailable_block_invoke()
{
  BOOL v0;

  if (LoadCrashReporterSupport_loadPredicate != -1)
    dispatch_once(&LoadCrashReporterSupport_loadPredicate, &__block_literal_global_10);
  if (LoadCrashReporterSupport_frameworkLibrary)
    v0 = dlsym((void *)LoadCrashReporterSupport_frameworkLibrary, "SimulateCrash") != 0;
  else
    v0 = 0;
  softLinkSimulateCrashAvailable_isAvailable = v0;
}

uint64_t initSimulateCrash(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;

  v5 = LoadCrashReporterSupport_loadPredicate;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&LoadCrashReporterSupport_loadPredicate, &__block_literal_global_10);
  softLinkSimulateCrash = (uint64_t (*)())dlsym((void *)LoadCrashReporterSupport_frameworkLibrary, "SimulateCrash");
  v7 = ((uint64_t (*)(uint64_t, uint64_t, id))softLinkSimulateCrash)(a1, a2, v6);

  return v7;
}

void sub_18F838010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F838778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18F838928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ACAccountStoreFunction()
{
  return (id)classACAccountStore;
}

id sIsDirectoryByResourceKey_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = 0;
  v2 = *MEMORY[0x1E0C999D0];
  v8 = 0;
  v3 = objc_msgSend(a2, "getResourceValue:forKey:error:", &v9, v2, &v8);
  v4 = v9;
  v5 = v8;
  if (v3)
    +[CNResult successWithValue:](CNResult, "successWithValue:", v4);
  else
    +[CNResult failureWithError:](CNResult, "failureWithError:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id sIsDirectoryByStat_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  unsigned __int8 v9;

  v9 = 0;
  v2 = a2;
  +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtURL:isDirectory:", v2, &v9);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNResult successWithValue:](CNResult, "successWithValue:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    +[CNResult failureWithError:](CNResult, "failureWithError:", 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t sIsDirectoryByStat_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;

  v2 = a2;
  sIsDirectoryByResourceKey_block_invoke((uint64_t)v2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFailure"))
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[CNFoundationError isFileNotFoundError:](CNFoundationError, "isFileNotFoundError:", v4);

    if (v5)
    {
      sIsDirectoryByStat_block_invoke_2(v6, v2);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
    }
  }
  if (objc_msgSend(v3, "isSuccess"))
  {
    objc_msgSend(v3, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

  }
  else
  {
    v10 = os_log_create("com.apple.contacts", "filesystem");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sIsDirectoryByStat_block_invoke_3_cold_1((uint64_t)v2, v3);

    v9 = 0;
  }

  return v9;
}

uint64_t sIsDirectory_block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;

  v2 = a2;
  sIsDirectoryByResourceKey_block_invoke((uint64_t)v2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFailure"))
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[CNFoundationError isFileNotFoundError:](CNFoundationError, "isFileNotFoundError:", v4);

    if (v5)
    {
      sIsDirectoryByStat_block_invoke_2(v6, v2);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
    }
  }
  if (objc_msgSend(v3, "isSuccess"))
  {
    objc_msgSend(v3, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue") ^ 1;

  }
  else
  {
    v10 = os_log_create("com.apple.contacts", "filesystem");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sIsDirectoryByStat_block_invoke_3_cold_1((uint64_t)v2, v3);

    v9 = 0;
  }

  return v9;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id MCProfileConnectionFunction()
{
  return (id)classMCProfileConnection;
}

void sub_18F839E9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F839FA8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18F83A0BC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id CNSubstringRangesContainingEmojiInString(void *a1)
{
  id v1;
  void (*v2)(uint64_t, uint64_t, uint64_t, void *);
  uint64_t v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v1 = a1;
  if (CNStringContainsEmojiCharacters(v1))
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__3;
    v11 = __Block_byref_object_dispose__3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (void (*)(uint64_t, uint64_t, uint64_t, void *))softLinkCEMEnumerateEmojiTokensInStringWithBlock;
    v3 = objc_msgSend(v1, "length");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __CNSubstringRangesContainingEmojiInString_block_invoke;
    v6[3] = &unk_1E29B9880;
    v6[4] = &v7;
    v2((uint64_t)v1, 0, v3, v6);
    v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

  }
  else
  {
    v4 = (id)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

void sub_18F83AA2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL CNStringContainsEmojiCharacters(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v1))
  {
    v2 = 0;
  }
  else
  {
    if (CNEmojiCharacterSet_onceToken != -1)
      dispatch_once(&CNEmojiCharacterSet_onceToken, &__block_literal_global_34);
    v2 = objc_msgSend(v1, "rangeOfCharacterFromSet:", CNEmojiCharacterSet_sEmoji) != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

uint64_t CNIsChineseString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v1))
  {
    v2 = 0;
  }
  else
  {
    if (CNChineseCharacterUSet_onceToken != -1)
      dispatch_once(&CNChineseCharacterUSet_onceToken, &__block_literal_global_27);
    v2 = CNContentsExclusivelyInCharacterSet(v1, CNChineseCharacterUSet_set);
  }

  return v2;
}

uint64_t CNIsArabicString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v1))
  {
    v2 = 0;
  }
  else
  {
    if (CNArabicCharacterUSet_onceToken != -1)
      dispatch_once(&CNArabicCharacterUSet_onceToken, &__block_literal_global_28);
    v2 = CNContentsExclusivelyInCharacterSet(v1, CNArabicCharacterUSet_set);
  }

  return v2;
}

uint64_t CNStringContainsChineseJapaneseKoreanCharacters(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[2];
  BOOL (*v10)(uint64_t, uint64_t, int);
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  _QWORD *v14;

  v1 = a1;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v1))
  {
    v2 = 0;
  }
  else
  {
    if (CNChineseJapaneseKoreanCharacterUSet_onceToken != -1)
      dispatch_once(&CNChineseJapaneseKoreanCharacterUSet_onceToken, &__block_literal_global_31);
    v3 = CNChineseJapaneseKoreanCharacterUSet_set;
    v4 = v1;
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v10 = __CNStringContainsAnyCharactersFromUSet_block_invoke;
    v11 = &__block_descriptor_40_e13_C20__0r_S8i16l;
    v12 = v3;
    v6 = v9;
    if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v4))
    {
      v2 = ((unsigned int (*)(_QWORD *, _QWORD, _QWORD))v10)(v6, 0, 0) != 0;
    }
    else
    {
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __CNStringEvaluateWithUCharTest_block_invoke;
      v13[3] = &unk_1E29B9928;
      v14 = v6;
      objc_msgSend(v4, "_cn_resultWithAllCharacters:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v7, "BOOLValue");

    }
  }

  return v2;
}

uint64_t CNStringContainsKoreanCharacters(void *a1)
{
  uint64_t v1;
  id v2;
  int v3;

  v1 = CNInvertedHangulCharacterUSet_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&CNInvertedHangulCharacterUSet_onceToken, &__block_literal_global_32);
  v3 = CNContentsExclusivelyInCharacterSet(v2, CNInvertedHangulCharacterUSet_set);

  return v3 ^ 1u;
}

BOOL CNStringContainsNonLatinCharacters(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v1))
  {
    v2 = 0;
  }
  else
  {
    if (CNLatinCharacterUSet_onceToken != -1)
      dispatch_once(&CNLatinCharacterUSet_onceToken, &__block_literal_global_41);
    if (CNContentsExclusivelyInCharacterSet(v1, CNLatinCharacterUSet_set))
      v2 = CNStringContainsEmojiCharacters(v1);
    else
      v2 = 1;
  }

  return v2;
}

void initCEMEnumerateEmojiTokensInStringWithBlock(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  id v8;

  v7 = LoadCoreEmoji_loadPredicate;
  v8 = a4;
  if (v7 != -1)
    dispatch_once(&LoadCoreEmoji_loadPredicate, &__block_literal_global_16);
  softLinkCEMEnumerateEmojiTokensInStringWithBlock = (uint64_t (*)())dlsym((void *)LoadCoreEmoji_frameworkLibrary, "CEMEnumerateEmojiTokensInStringWithBlock");
  ((void (*)(uint64_t, uint64_t, uint64_t, id))softLinkCEMEnumerateEmojiTokensInStringWithBlock)(a1, a2, a3, v8);

}

uint64_t initCTFontCreateWithName(uint64_t a1, uint64_t a2, float a3)
{
  if (LoadCoreText_loadPredicate != -1)
    dispatch_once(&LoadCoreText_loadPredicate, &__block_literal_global_37);
  softLinkCTFontCreateWithName = (uint64_t (*)())dlsym((void *)LoadCoreText_frameworkLibrary, "CTFontCreateWithName");
  return ((uint64_t (*)(uint64_t, uint64_t, float))softLinkCTFontCreateWithName)(a1, a2, a3);
}

uint64_t initCTFontCopyCharacterSet(uint64_t a1)
{
  if (LoadCoreText_loadPredicate != -1)
    dispatch_once(&LoadCoreText_loadPredicate, &__block_literal_global_37);
  softLinkCTFontCopyCharacterSet = (uint64_t (*)())dlsym((void *)LoadCoreText_frameworkLibrary, "CTFontCopyCharacterSet");
  return ((uint64_t (*)(uint64_t))softLinkCTFontCopyCharacterSet)(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id sRE(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", a1, 1, &v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_18F83E098()
{
  objc_end_catch();
  JUMPOUT(0x18F83E0A0);
}

uint64_t CNEitherIsRight_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRight");
}

uint64_t CNEitherLeft_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "left");
}

uint64_t CNEitherRight_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "right");
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_18F8404D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18F84057C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18F8406F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CNIsAddressingGrammarEmpty_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  if (!a2)
    return 1;
  objc_msgSend(a2, "pronouns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v2);

  return v3;
}

id CNContactsFoundationBundle()
{
  if (CNContactsFoundationBundle_onceToken != -1)
    dispatch_once(&CNContactsFoundationBundle_onceToken, &__block_literal_global_15);
  return (id)CNContactsFoundationBundle___bundle;
}

void sub_18F84610C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CNObservedResultIsResultFilter_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isResultEvent");
}

uint64_t CNObservedResultValueTransform_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t CNPairFirst_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "first");
}

uint64_t CNPairSecond_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "second");
}

BOOL CNPairNeitherElementIsNil_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "second");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  uint64_t v0;

  return v0;
}

void sub_18F84A6F0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18F84C7D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18F84D5B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18F84DA8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18F84E21C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

_CNBlockObservable *CNObservableWithBlock(void *a1)
{
  id v1;
  _CNBlockObservable *v2;

  v1 = a1;
  v2 = -[_CNBlockObservable initWithBlock:]([_CNBlockObservable alloc], "initWithBlock:", v1);

  return v2;
}

_CNScheduledObservable *CNObservableSubscribeOn(void *a1, void *a2)
{
  id v3;
  id v4;
  _CNScheduledObservable *v5;

  v3 = a2;
  v4 = a1;
  v5 = -[_CNScheduledObservable initWithObservable:scheduler:]([_CNScheduledObservable alloc], "initWithObservable:scheduler:", v4, v3);

  return v5;
}

id CNObservableAllObjects(void *a1, uint64_t a2)
{
  id v3;
  CNPromise *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a1;
  v4 = objc_alloc_init(CNPromise);
  -[CNPromise completionHandlerAdapter](v4, "completionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNObserver observerWithCompletionHandler:](CNObserver, "observerWithCompletionHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v3, "subscribe:", v6);
  -[CNPromise future](v4, "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "result:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "threadId");
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 16), "threadId");
}

Class initFAFetchFamilyCircleRequest()
{
  Class result;

  if (LoadFamilyCircle_loadPredicate != -1)
    dispatch_once(&LoadFamilyCircle_loadPredicate, &__block_literal_global_43);
  result = objc_getClass("FAFetchFamilyCircleRequest");
  classFAFetchFamilyCircleRequest = (uint64_t)result;
  getFAFetchFamilyCircleRequestClass = (uint64_t (*)())FAFetchFamilyCircleRequestFunction;
  return result;
}

id FAFetchFamilyCircleRequestFunction()
{
  return (id)classFAFetchFamilyCircleRequest;
}

void sub_18F8510F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F851274(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F851460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F851910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t CNIntFromUVersionInfo(unsigned __int8 *a1)
{
  return (*a1 << 24) | (a1[1] << 16);
}

uint64_t CNGetICUVersion()
{
  UVersionInfo versionArray;

  *(_DWORD *)versionArray = 0;
  u_getVersion(versionArray);
  return (versionArray[0] << 24) | (versionArray[1] << 16);
}

void CNGetICUCollatorVersions(_DWORD *a1, _DWORD *a2)
{
  if (CNGetICUCollatorVersions_onceToken == -1)
  {
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&CNGetICUCollatorVersions_onceToken, &__block_literal_global_46);
  if (a2)
LABEL_3:
    *a2 = CNGetICUCollatorVersions_cachedUCAVersion;
LABEL_4:
  if (a1)
    *a1 = CNGetICUCollatorVersions_cachedCollatorVersion;
}

uint64_t CNReleaseCollator(uint64_t result)
{
  if (result)
    return ucol_close();
  return result;
}

void sub_18F853518(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F85359C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18F853DE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sNoopBlock_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99E38], "null");
}

const __CFString *CNSuspendableSchedulerConditionToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("CNSuspendableSchedulerConditionBuffering");
  if (a1 == 1)
    v1 = CFSTR("CNSuspendableSchedulerConditionDraining");
  if (a1 == 2)
    return CFSTR("CNSuspendableSchedulerConditionRelaying");
  else
    return v1;
}

void sub_18F857A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18F857C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CNTimestampedValue_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

void OUTLINED_FUNCTION_0_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4_1@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

void sub_18F85AD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  char v15;
  uint64_t v16;
  va_list va;

  va_start(va, a15);
  if ((v15 & 1) != 0)
    objc_end_catch();
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18F85AD40(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_begin_catch(a1);
  JUMPOUT(0x18F85AC98);
}

void sub_18F85B030(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F85B0B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t initDiagnosticLogSubmissionEnabled()
{
  if (LoadCrashReporterSupport_loadPredicate_0 != -1)
    dispatch_once(&LoadCrashReporterSupport_loadPredicate_0, &__block_literal_global_57);
  softLinkDiagnosticLogSubmissionEnabled = (uint64_t (*)())dlsym((void *)LoadCrashReporterSupport_frameworkLibrary_0, "DiagnosticLogSubmissionEnabled");
  return softLinkDiagnosticLogSubmissionEnabled();
}

id CNSocialProfileServiceUsernameURLTemplate(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "uppercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E29EFF48, "objectForKey:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id CNSocialProfileURLForUsername(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  CNSocialProfileServiceUsernameURLTemplate(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNSocialProfileURLFromTemplate(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id CNSocialProfileURLFromTemplate(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v3)
    || CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v4))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v3, CFSTR("%@"), &v12, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v9)
    {
      +[CNLogging sdkBreakageLog](CNLogging, "sdkBreakageLog");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v14 = v3;
        v15 = 2114;
        v16 = v4;
        v17 = 2114;
        v18 = v9;
        _os_log_error_impl(&dword_18F80C000, v10, OS_LOG_TYPE_ERROR, "Error creating social profile URL from template = %{public}@, value = %{public}@, error = %{public}@", buf, 0x20u);
      }

    }
    if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v8))
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

id CNSocialProfileURLForUserIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a1;
  objc_msgSend(a2, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E29EFF70, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CNSocialProfileURLFromTemplate(v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t CNFoundationSocialProfileService_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "service");
}

uint64_t CNFoundationSocialProfileUsername_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "username");
}

uint64_t CNFoundationSocialProfileUserIdentifier_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userIdentifier");
}

uint64_t CNFoundationSocialProfileDisplayName_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayName");
}

uint64_t CNSocialProfileEquivalentValues(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a1;
  v4 = a2;
  if (CNSocialProfileEquivalentOptionalValues(v3, v4))
  {
    v5 = v3;
    v6 = v4;
    objc_msgSend(v5, "urlString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
    {
      v9 = 0;
      if (!v7 || !v8)
        goto LABEL_18;
      if ((objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
      {
        +[CNSocialProfileURLParser parseSocialProfileURL:](CNSocialProfileURLParser, "parseSocialProfileURL:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNSocialProfileURLParser parseSocialProfileURL:](CNSocialProfileURLParser, "parseSocialProfileURL:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (CNSocialProfileEquivalentOptionalValues(v10, v11))
        {
          objc_msgSend(v5, "service");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", CFSTR("LinkedIn"));

          if (v13)
          {
            v14 = v7;
            v15 = v8;
            if (objc_msgSend(v14, "_cn_containsSubstring:", CFSTR("/pub/"))
              && objc_msgSend(v15, "_cn_containsSubstring:", CFSTR("/pub/")))
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "pathComponents");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "pathComponents");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = objc_msgSend(v19, "isEqual:", v17);

            }
            else
            {
              v9 = 1;
            }

          }
          else
          {
            v9 = 1;
          }
        }
        else
        {
          v9 = 0;
        }

        goto LABEL_18;
      }
    }
    v9 = 1;
LABEL_18:

    goto LABEL_19;
  }
  v9 = 0;
LABEL_19:

  return v9;
}

BOOL CNSocialProfileEquivalentOptionalValues(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;

  v3 = a1;
  v4 = a2;
  v5 = CNSocialProfileEquivalentValue((uint64_t)v3, v4, __block_literal_global_58)
    && CNSocialProfileEquivalentValue((uint64_t)v3, v4, __block_literal_global_49_0)
    && CNSocialProfileEquivalentValue((uint64_t)v3, v4, __block_literal_global_50)
    && CNSocialProfileEquivalentValue((uint64_t)v3, v4, __block_literal_global_51);

  return v5;
}

id CNSocialProfileStandardServices()
{
  if (CNSocialProfileStandardServices_onceToken != -1)
    dispatch_once(&CNSocialProfileStandardServices_onceToken, &__block_literal_global_53);
  return (id)CNSocialProfileStandardServices_services;
}

uint64_t CNSocialProfileIsStandardServiceName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  CNSocialProfileStandardServices();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", v1);

  return v3;
}

BOOL CNSocialProfileEquivalentValue(uint64_t a1, void *a2, _QWORD *a3)
{
  void (*v6)(_QWORD *, uint64_t);
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  _BOOL8 v12;

  v6 = (void (*)(_QWORD *, uint64_t))a3[2];
  v7 = a3;
  v8 = a2;
  v6(v7, a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(id, id))a3[2])(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  v12 = v11 || objc_msgSend(v9, "localizedCaseInsensitiveCompare:", v10) == 0;

  return v12;
}

void sub_18F85D3A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F85D4E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F85D580(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F85D99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,id a25)
{
  void *v25;
  id *v26;
  id *v27;
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a25);
  objc_sync_exit(v25);
  _Unwind_Resume(a1);
}

void sub_18F85F1CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, const __CFString *a16, uint64_t a17)
{
  _QWORD *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  if (a2)
  {
    if (a2 == 2)
    {
      v18 = objc_begin_catch(exception_object);
      objc_msgSend(a12, "os_log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[CNArchiver decodeObjectOfClass:associatedClasses:data:error:].cold.2((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

      a16 = CFSTR("exception");
      a17 = (uint64_t)v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a17, &a16, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNFoundationError errorWithCode:userInfo:](CNFoundationError, "errorWithCode:userInfo:", 6, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v17)
        *v17 = objc_retainAutorelease(v27);

      objc_end_catch();
    }
    else
    {
      objc_begin_catch(exception_object);
    }
    JUMPOUT(0x18F85F164);
  }
  _Unwind_Resume(exception_object);
}

void sub_18F85FCE8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_18F85FF58(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void CNFutureThrowProtocolExceptionWithReason(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a1;
  v3 = a2;
  if (+[CNObservableContractEnforcement shouldEnforceRxProtocols](CNObservableContractEnforcement, "shouldEnforceRxProtocols"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v5, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise");

  }
}

id CNPromiseCompletionHandlerWithDefaultValue(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v3 = a1;
  v4 = a2;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __CNPromiseCompletionHandlerWithDefaultValue_block_invoke;
  v13 = &unk_1E29BBD60;
  v14 = v3;
  v15 = v4;
  v5 = v4;
  v6 = v3;
  v7 = _Block_copy(&v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

id CNPromiseBoolErrorCompletionHandler(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  v1 = a1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __CNPromiseBoolErrorCompletionHandler_block_invoke;
  aBlock[3] = &unk_1E29BBD88;
  v7 = v1;
  v2 = v1;
  v3 = _Block_copy(aBlock);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

id CNPromiseErrorOnlyCompletionHandler(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  v1 = a1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __CNPromiseErrorOnlyCompletionHandler_block_invoke;
  aBlock[3] = &unk_1E29B9558;
  v7 = v1;
  v2 = v1;
  v3 = _Block_copy(aBlock);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

void sub_18F861B78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F861C04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CNLargestNumberReducer_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = a2;
  if (objc_msgSend(v5, "compare:", v4) == -1)
    v6 = v4;
  else
    v6 = v5;
  v7 = v6;

  return v7;
}

uint64_t CNFloatingPointNumberSummationReducer_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  v9 = v8;

  return objc_msgSend(v4, "numberWithDouble:", v7 + v9);
}

id DarwinObservers()
{
  if (DarwinObservers_cn_once_token_0 != -1)
    dispatch_once(&DarwinObservers_cn_once_token_0, &__block_literal_global_66);
  return (id)DarwinObservers_cn_once_object_0;
}

void _handler(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = a2;
  DarwinObservers();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "observerDidReceiveResult:", a3);
}

uint64_t sAscendingLocation_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  v6 = objc_msgSend(v4, "rangeValue");

  v7 = -1;
  if (v5 >= v6)
    v7 = 1;
  if (v5 == v6)
    return 0;
  else
    return v7;
}

void sub_18F862DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F862EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AppSupportLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AppSupportLibraryCore_frameworkLibrary)
    AppSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AppSupportLibraryCore_frameworkLibrary;
  if (!AppSupportLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_18F864410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL sIsNameSuffix_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNNameComponentsStringTokenizer isNameSuffix:](CNNameComponentsStringTokenizer, "isNameSuffix:", a2);
}

BOOL sIsNobiliaryParticle_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[CNNameComponentsStringTokenizer isNobiliaryParticle:](CNNameComponentsStringTokenizer, "isNobiliaryParticle:", a2);
}

id sNormalizeElements_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  v3 = a2;
  objc_msgSend(v2, "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByFoldingWithOptions:locale:", 385, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL sStringIsNotEmpty_block_invoke_4(uint64_t a1, void *a2)
{
  return !CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, a2);
}

id _block_invoke_0(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v14[0] = v5;
  v6 = a3;
  objc_msgSend(v6, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(v6, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_flatten");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t ACAccountToType_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accountType");
}

uint64_t ACAccountIsSyncable_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncableDataclasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0C8F388]);

  return v4;
}

uint64_t CoreGraphicsLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CoreGraphicsLibraryCore_frameworkLibrary)
    CoreGraphicsLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CoreGraphicsLibraryCore_frameworkLibrary;
  if (!CoreGraphicsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void OUTLINED_FUNCTION_2_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id CNEmailAddressExpandAliasedDomains_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNEmailAddressUtilities expandAliasedDomainsInAddress:](CNEmailAddressUtilities, "expandAliasedDomainsInAddress:", a2);
}

id CNEmailAddressSanitize_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  CNEmailAddressSanitizationTask *v3;
  void *v4;

  v2 = a2;
  v3 = -[CNEmailAddressSanitizationTask initWithAddress:]([CNEmailAddressSanitizationTask alloc], "initWithAddress:", v2);

  -[CNEmailAddressSanitizationTask run:](v3, "run:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t CNEmailAddressNormalize_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_stringByNormalizingCase");
}

void sub_18F86A220(void *a1)
{
  -[CNDescriptionBuilder appendKey:].cold.1(a1);
  JUMPOUT(0x18F86A20CLL);
}

void sub_18F86A320(_Unwind_Exception *a1, int a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[CNDescriptionBuilder appendKeys:].cold.1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    objc_end_catch();
    JUMPOUT(0x18F86A2E4);
  }
  _Unwind_Resume(a1);
}

void cn_runWithPropertyLock(uint64_t a1, unint64_t a2, void *a3)
{
  os_unfair_lock_s *v3;
  void (**v4)(_QWORD);

  v3 = (os_unfair_lock_s *)((char *)&sPropertyLocks + 4 * ((a2 >> 5) & 0x7F));
  v4 = a3;
  os_unfair_lock_lock(v3);
  v4[2](v4);

  os_unfair_lock_unlock(v3);
}

id cn_objectResultWithPropertyLock(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a1;
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__11;
  v17 = __Block_byref_object_dispose__11;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __cn_objectResultWithPropertyLock_block_invoke;
  v10[3] = &unk_1E29B8BE8;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  cn_runWithPropertyLock((uint64_t)v7, a2, v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void sub_18F86AD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __cn_objectResultWithPropertyLock_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id CNFullMethodName(void *a1, const char *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a1;
  v4 = objc_opt_class();

  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 45;
  if ((id)v4 == v3)
    v7 = 43;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%c[%@ %@]"), v7, v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id CNUnimplementedMethodException(void *a1, const char *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  CNFullMethodName(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("selector not implemented: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id CNAbstractMethodException(void *a1, const char *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a1;
  CNFullMethodName(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: must override selector sent to %p"), v4, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id CNInitializerUnavailableException(void *a1, const char *a2, const char *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a1;
  CNFullMethodName(v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CNFullMethodName(v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: initializer unavailable; use %@ instead"), v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t CNObjectEquals_block_invoke_6(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 | a3)
    return objc_msgSend((id)a2, "isEqual:");
  else
    return 1;
}

uint64_t CNObjectEquator_block_invoke_7(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 | a3)
    return objc_msgSend((id)a2, "isEqual:");
  else
    return 1;
}

id _CNAggregateObjectTestFromArray(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  v1 = a1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___CNAggregateObjectTestFromArray_block_invoke;
  aBlock[3] = &unk_1E29BB568;
  v7 = v1;
  v2 = v1;
  v3 = _Block_copy(aBlock);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

id CNAggregateObjectTest(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "count") == 1)
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v1, 1);
    _CNAggregateObjectTestFromArray(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id CNMakeErrorHelper(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD aBlock[5];

  if (a1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __CNMakeErrorHelper_block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e23_v16__0_____NSError____8l;
    aBlock[4] = a1;
    v1 = _Block_copy(aBlock);
  }
  else
  {
    v1 = &__block_literal_global_77;
  }
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

id CNUserInfoWithMyProcessInfo()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (int)objc_msgSend(v0, "processIdentifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", geteuid());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v0, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v1, CFSTR("ABSenderProcessID"), v4, CFSTR("ABSenderProcessName"), v2, CFSTR("ABSenderProcessName"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_18F86D294(void *a1)
{
  void *v1;

  objc_begin_catch(a1);
  free(v1);
  objc_exception_rethrow();
}

void sub_18F86D2A8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

Class initIntlUtility()
{
  Class result;

  if (LoadIntlUtilities_loadPredicate != -1)
    dispatch_once(&LoadIntlUtilities_loadPredicate, &__block_literal_global_31_1);
  result = objc_getClass("IntlUtility");
  classIntlUtility = (uint64_t)result;
  getIntlUtilityClass = (uint64_t (*)())IntlUtilityFunction;
  return result;
}

id IntlUtilityFunction()
{
  return (id)classIntlUtility;
}

__CFString *CNRangeShortDescription_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  const __CFString *v21;

  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 == 1)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v6;
      v9 = CFSTR("%@");
    }
    else
    {
      if (a3)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v11);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3 + a2 - 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "commonPrefixWithString:options:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length");

        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "_cn_skip:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@–%@"), v6, v18);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v6;
      v21 = CFSTR("∅");
      v9 = CFSTR("%@(%@)");
    }
    objc_msgSend(v8, "stringWithFormat:", v9, v20, v21);
LABEL_9:
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    return v4;
  }
  v4 = CFSTR("∄");
  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@(%@)"), CFSTR("∄"), v6);
    goto LABEL_9;
  }
  return v4;
}

void sub_18F86F798(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F86FE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F87007C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18F8701FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getRBSDomainAttributeClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RBSDomainAttribute");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRBSDomainAttributeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRBSDomainAttributeClass_block_invoke_cold_1();
    RunningBoardServicesLibrary();
  }
}

void RunningBoardServicesLibrary()
{
  void *v0;

  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getRBSAcquisitionCompletionAttributeClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSAcquisitionCompletionAttribute");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRBSAcquisitionCompletionAttributeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getRBSAcquisitionCompletionAttributeClass_block_invoke_cold_1();
    return __getRBSAssertionClass_block_invoke(v3);
  }
  return result;
}

Class __getRBSAssertionClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSAssertion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRBSAssertionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getRBSAssertionClass_block_invoke_cold_1();
    return (Class)__getRBSTargetClass_block_invoke(v3);
  }
  return result;
}

Class __getRBSTargetClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSTarget");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRBSTargetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRBSTargetClass_block_invoke_cold_1();
    return (Class)CNDebugLog();
  }
  return result;
}

void CNDebugLog(NSString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  NSLogv(a1, &a9);
}

id CNObserverCompletionHandler(void *a1)
{
  id v1;
  CNCancelationToken *v2;
  void *v3;

  v1 = a1;
  v2 = objc_alloc_init(CNCancelationToken);
  CNObserverCancelableCompletionHandler(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id CNObserverCancelableCompletionHandler(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v3 = a1;
  v4 = a2;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __CNObserverCancelableCompletionHandler_block_invoke;
  v13 = &unk_1E29BBD60;
  v14 = v4;
  v15 = v3;
  v5 = v3;
  v6 = v4;
  v7 = _Block_copy(&v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

void CNObserverThrowProtocolExceptionWithReason(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a1;
  v3 = a2;
  if (+[CNObservableContractEnforcement shouldEnforceRxProtocols](CNObservableContractEnforcement, "shouldEnforceRxProtocols"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v5, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise");

  }
}

BOOL CNFamilyMemberIsDelegateChild_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNFamilyMember isDelegateChildFamilyMember:](CNFamilyMember, "isDelegateChildFamilyMember:", a2);
}

BOOL CNFamilyMemberIsAdministrativeGuardian_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[CNFamilyMember isAdministrativeGuardianFamilyMember:](CNFamilyMember, "isAdministrativeGuardianFamilyMember:", a2);
}

void sub_18F8713E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initIntlUtility_0()
{
  Class result;

  if (LoadIntlPreferences_loadPredicate != -1)
    dispatch_once(&LoadIntlPreferences_loadPredicate, &__block_literal_global_19);
  result = objc_getClass("IntlUtility");
  classIntlUtility_0 = (uint64_t)result;
  getIntlUtilityClass_0 = (uint64_t (*)())IntlUtilityFunction_0;
  return result;
}

id IntlUtilityFunction_0()
{
  return (id)classIntlUtility_0;
}

void OUTLINED_FUNCTION_1_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_18F872FFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F8730E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F8732B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F8734D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL CNDispatchSemaphoreWait(void *a1, double a2)
{
  NSObject *v3;
  dispatch_time_t v4;
  _BOOL8 v5;

  v3 = a1;
  if (a2 <= 1000000000.0)
    v4 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
  else
    v4 = -1;
  v5 = dispatch_semaphore_wait(v3, v4) == 0;

  return v5;
}

void CNRunWithQueueName(void *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a1;
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v4, "setName:", v7);
  v3[2](v3);
  objc_msgSend(v4, "setName:", v6);

}

void sub_18F873648(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18F873668(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18F87360CLL);
}

void sub_18F873874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_CNToStringFromTypeAndValue(const char *a1, NSRange *a2)
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  __CFString *v8;
  uint64_t v9;
  double v10;

  if (!strcmp(a1, "{_NSRange=QQ}"))
  {
    NSStringFromRange(*a2);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (!strcmp(a1, "@"))
  {
    objc_msgSend((id)a2->location, "description");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (!strcmp(a1, "Q"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a2->location, v9);
    goto LABEL_17;
  }
  if (!strcmp(a1, "q"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a2->location, v9);
    goto LABEL_17;
  }
  if (!strcmp(a1, "d"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v10 = *(double *)&a2->location;
    v6 = 15;
LABEL_16:
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%.*g"), v6, *(_QWORD *)&v10);
    goto LABEL_17;
  }
  if (!strcmp(a1, "f"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v10 = *(float *)&a2->location;
    v6 = 6;
    goto LABEL_16;
  }
  if (!strcmp(a1, ":"))
  {
    NSStringFromSelector((SEL)a2->location);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (strcmp(a1, "B"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown typeCode: %s, %p"), a1, a2);
LABEL_17:
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (LOBYTE(a2->location))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v4 = v8;
  return v4;
}

id cn_sprintf(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  void *v11;

  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a1;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithFormat:arguments:", v10, &a9);

  return v11;
}

void cn_printf(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  cn_vfprintf((FILE *)*MEMORY[0x1E0C80C20], a1, (uint64_t)&a9);
}

void cn_vprintf(void *a1, uint64_t a2)
{
  cn_vfprintf((FILE *)*MEMORY[0x1E0C80C20], a1, a2);
}

void cn_vfprintf(FILE *a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, a3);

  v8 = objc_retainAutorelease(v7);
  fputs((const char *)objc_msgSend(v8, "UTF8String"), a1);

}

void cn_fprintf(FILE *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  cn_vfprintf(a1, a2, (uint64_t)&a9);
}

__CFString *CNEmptyStringIfNil_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  __CFString *v4;

  v2 = a2;
  v3 = v2;
  if (v2)
    v4 = (__CFString *)v2;
  else
    v4 = &stru_1E29BCC70;

  return v4;
}

id CNNilIfEmptyString_block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

void sub_18F874890(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CNKeychainResult.__allocating_init(value:error:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  objc_class *v3;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v3 = v2;
  v6 = (char *)objc_allocWithZone(v3);
  v7 = &v6[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v8 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
  *(_QWORD *)&v6[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
  swift_beginAccess();
  v9 = v6;
  sub_18F874BF0(a1, (uint64_t)v7);
  swift_endAccess();
  v10 = *(void **)&v6[v8];
  *(_QWORD *)&v6[v8] = a2;
  v11 = a2;

  v14.receiver = v9;
  v14.super_class = v3;
  v12 = objc_msgSendSuper2(&v14, sel_init);

  sub_18F878CB4(a1, &qword_1EE176BC8);
  return v12;
}

id CNKeychainResult.init(value:error:)(uint64_t a1, void *a2)
{
  char *v2;
  char *v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  objc_super v12;

  v5 = &v2[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v6 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
  swift_beginAccess();
  v7 = v2;
  sub_18F874BF0(a1, (uint64_t)v5);
  swift_endAccess();
  v8 = *(void **)&v2[v6];
  *(_QWORD *)&v2[v6] = a2;
  v9 = a2;

  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for CNKeychainResult();
  v10 = objc_msgSendSuper2(&v12, sel_init);

  sub_18F878CB4(a1, &qword_1EE176BC8);
  return v10;
}

uint64_t sub_18F874BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x194004764]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for CNKeychainResult()
{
  return objc_opt_self();
}

void CNKeychainResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CNKeychainResult.__deallocating_deinit()
{
  return sub_18F87615C(type metadata accessor for CNKeychainResult);
}

void sub_18F874D3C()
{
  qword_1EE176B60 = 0x656C707061;
  *(_QWORD *)algn_1EE176B68 = 0xE500000000000000;
}

uint64_t sub_18F874D5C()
{
  uint64_t v0;

  v0 = sub_18F87F704();
  __swift_allocate_value_buffer(v0, qword_1EE176BD8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE176BD8);
  return sub_18F87F6F8();
}

unint64_t sub_18F874DD8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176BB8);
  v2 = sub_18F87F884();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_18F8791FC(v6, (uint64_t)&v13, &qword_1EE176BB0);
    v7 = v13;
    result = sub_18F876220(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_18F879164(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_18F874F30(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v6 = sub_18F87F7C4();
  v8 = v7;
  v9 = a1;
  v10 = (void *)a4(v6, v8);

  swift_bridgeObjectRelease();
  return v10;
}

id CNKeychainFacade.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CNKeychainFacade.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNKeychainFacade();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNKeychainFacade.__deallocating_deinit()
{
  return sub_18F87615C(type metadata accessor for CNKeychainFacade);
}

uint64_t sub_18F87502C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_18F87507C(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_18F8750C8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_18F87510C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_18F875154())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_18F87519C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  void *v29;
  uint64_t v30;
  objc_class *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, char *, uint64_t);
  uint64_t v42;
  uint64_t *v43;
  objc_class *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  void *v49;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v51;
  objc_class *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  void *v57;
  _QWORD v59[2];
  uint64_t v60;
  uint64_t v61;
  objc_super v62;
  objc_super v63;
  objc_super v64;
  __int128 v65;
  __int128 v66;

  v61 = a2;
  sub_18F87F74C();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176B80);
  v4 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (char *)v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v59 - v7;
  v9 = sub_18F87F734();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)v59 - v14;
  v16 = (_BYTE *)(v2 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  swift_beginAccess();
  if (*v16 == 1)
  {
    v17 = a1;
    v18 = v61;
    v19 = v13;
    v60 = v17;
    v20 = (uint64_t *)(v2 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keyDict);
    swift_beginAccess();
    v21 = *v20;
    v22 = *(_QWORD *)(*v20 + 16);
    v59[1] = v20;
    if (v22)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v23 = sub_18F876250(v60, v18);
      v24 = v15;
      v25 = (uint64_t)v6;
      v26 = v9;
      v59[0] = v10;
      if ((v27 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v8, *(_QWORD *)(v21 + 56) + *(_QWORD *)(v10 + 72) * v23, v9);
        v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
        v28(v8, 0, 1, v9);
      }
      else
      {
        v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
        v28(v8, 1, 1, v9);
      }
      v40 = v61;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v39 = v59[0];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v59[0] + 48))(v8, 1, v26) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v15, v8, v26);
        *((_QWORD *)&v66 + 1) = v26;
        boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v65);
        (*(void (**)(uint64_t *, char *, uint64_t))(v39 + 16))(boxed_opaque_existential_0, v15, v26);
        v51 = v39;
        v52 = (objc_class *)type metadata accessor for CNKeychainResult();
        v53 = (char *)objc_allocWithZone(v52);
        v54 = &v53[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
        *(_OWORD *)v54 = 0u;
        *((_OWORD *)v54 + 1) = 0u;
        v55 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
        *(_QWORD *)&v53[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
        swift_beginAccess();
        v56 = v53;
        sub_18F874BF0((uint64_t)&v65, (uint64_t)v54);
        swift_endAccess();
        v57 = *(void **)&v53[v55];
        *(_QWORD *)&v53[v55] = 0;

        v62.receiver = v56;
        v62.super_class = v52;
        v38 = objc_msgSendSuper2(&v62, sel_init);
        sub_18F878CB4((uint64_t)&v65, &qword_1EE176BC8);
        (*(void (**)(char *, uint64_t))(v51 + 8))(v24, v26);
        return v38;
      }
    }
    else
    {
      v39 = v10;
      v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      v28(v8, 1, 1, v9);
      v25 = (uint64_t)v6;
      v26 = v9;
      v40 = v18;
    }
    sub_18F878CB4((uint64_t)v8, &qword_1EE176B80);
    sub_18F87F740();
    sub_18F87F728();
    v41 = *(void (**)(uint64_t, char *, uint64_t))(v39 + 16);
    v41(v25, v19, v26);
    v28((char *)v25, 0, 1, v26);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v42 = v39;
    sub_18F87573C(v25, v60, v40);
    swift_endAccess();
    *((_QWORD *)&v66 + 1) = v26;
    v43 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v65);
    v41((uint64_t)v43, v19, v26);
    v44 = (objc_class *)type metadata accessor for CNKeychainResult();
    v45 = (char *)objc_allocWithZone(v44);
    v46 = &v45[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)v46 = 0u;
    *((_OWORD *)v46 + 1) = 0u;
    v47 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(_QWORD *)&v45[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    v48 = v45;
    sub_18F874BF0((uint64_t)&v65, (uint64_t)v46);
    swift_endAccess();
    v49 = *(void **)&v45[v47];
    *(_QWORD *)&v45[v47] = 0;

    v63.receiver = v48;
    v63.super_class = v44;
    v38 = objc_msgSendSuper2(&v63, sel_init);
    sub_18F878CB4((uint64_t)&v65, &qword_1EE176BC8);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v19, v26);
  }
  else
  {
    sub_18F878C70();
    v65 = 0u;
    v66 = 0u;
    v29 = (void *)swift_allocError();
    *(_QWORD *)v30 = 0xD000000000000017;
    *(_QWORD *)(v30 + 8) = 0x800000018F8908B0;
    *(_BYTE *)(v30 + 16) = 1;
    v31 = (objc_class *)type metadata accessor for CNKeychainResult();
    v32 = (char *)objc_allocWithZone(v31);
    v33 = &v32[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)v33 = 0u;
    *((_OWORD *)v33 + 1) = 0u;
    v34 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(_QWORD *)&v32[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    v35 = v32;
    sub_18F874BF0((uint64_t)&v65, (uint64_t)v33);
    swift_endAccess();
    v36 = *(void **)&v32[v34];
    *(_QWORD *)&v32[v34] = v29;
    v37 = v29;

    v64.receiver = v35;
    v64.super_class = v31;
    v38 = objc_msgSendSuper2(&v64, sel_init);

    sub_18F878CB4((uint64_t)&v65, &qword_1EE176BC8);
  }
  return v38;
}

uint64_t sub_18F87573C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176B80);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_18F87F734();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78]();
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1, 1, v10) == 1)
  {
    sub_18F878CB4(a1, &qword_1EE176B80);
    sub_18F87649C(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_18F878CB4((uint64_t)v9, &qword_1EE176B80);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v13, a1, v10);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v17 = *v4;
    *v4 = 0x8000000000000000;
    sub_18F876B30((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v17;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

id sub_18F8758BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _BYTE *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  objc_class *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t *boxed_opaque_existential_0;
  objc_class *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  void *v44;
  objc_super v45;
  objc_super v46;
  objc_super v47;
  __int128 v48;
  __int128 v49;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176B80);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_18F87F734();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_BYTE *)(v2 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  swift_beginAccess();
  if (*v12 == 1)
  {
    v13 = (uint64_t *)(v2 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keyDict);
    swift_beginAccess();
    v14 = *v13;
    if (*(_QWORD *)(*v13 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v15 = sub_18F876250(a1, a2);
      if ((v16 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v7, *(_QWORD *)(v14 + 56) + *(_QWORD *)(v9 + 72) * v15, v8);
        v17 = 0;
      }
      else
      {
        v17 = 1;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, v17, 1, v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
        *((_QWORD *)&v49 + 1) = v8;
        boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v48);
        (*(void (**)(uint64_t *, char *, uint64_t))(v9 + 16))(boxed_opaque_existential_0, v11, v8);
        v39 = (objc_class *)type metadata accessor for CNKeychainResult();
        v40 = (char *)objc_allocWithZone(v39);
        v41 = &v40[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
        *(_OWORD *)v41 = 0u;
        *((_OWORD *)v41 + 1) = 0u;
        v42 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
        *(_QWORD *)&v40[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
        swift_beginAccess();
        v43 = v40;
        sub_18F874BF0((uint64_t)&v48, (uint64_t)v41);
        swift_endAccess();
        v44 = *(void **)&v40[v42];
        *(_QWORD *)&v40[v42] = 0;

        v45.receiver = v43;
        v45.super_class = v39;
        v36 = objc_msgSendSuper2(&v45, sel_init);
        sub_18F878CB4((uint64_t)&v48, &qword_1EE176BC8);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        return v36;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    }
    sub_18F878CB4((uint64_t)v7, &qword_1EE176B80);
    sub_18F878C70();
    v48 = 0u;
    v49 = 0u;
    v18 = (void *)swift_allocError();
    *(_QWORD *)v28 = 0;
    *(_QWORD *)(v28 + 8) = 0;
    *(_BYTE *)(v28 + 16) = 3;
    v29 = (objc_class *)type metadata accessor for CNKeychainResult();
    v30 = (char *)objc_allocWithZone(v29);
    v31 = &v30[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)v31 = 0u;
    *((_OWORD *)v31 + 1) = 0u;
    v32 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(_QWORD *)&v30[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    v33 = v30;
    sub_18F874BF0((uint64_t)&v48, (uint64_t)v31);
    swift_endAccess();
    v34 = *(void **)&v30[v32];
    *(_QWORD *)&v30[v32] = v18;
    v35 = v18;

    v46.receiver = v33;
    v46.super_class = v29;
    v27 = objc_msgSendSuper2(&v46, sel_init);
  }
  else
  {
    sub_18F878C70();
    v48 = 0u;
    v49 = 0u;
    v18 = (void *)swift_allocError();
    *(_QWORD *)v19 = 0xD000000000000017;
    *(_QWORD *)(v19 + 8) = 0x800000018F8908B0;
    *(_BYTE *)(v19 + 16) = 0;
    v20 = (objc_class *)type metadata accessor for CNKeychainResult();
    v21 = (char *)objc_allocWithZone(v20);
    v22 = &v21[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)v22 = 0u;
    *((_OWORD *)v22 + 1) = 0u;
    v23 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(_QWORD *)&v21[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    v24 = v21;
    sub_18F874BF0((uint64_t)&v48, (uint64_t)v22);
    swift_endAccess();
    v25 = *(void **)&v21[v23];
    *(_QWORD *)&v21[v23] = v18;
    v26 = v18;

    v47.receiver = v24;
    v47.super_class = v20;
    v27 = objc_msgSendSuper2(&v47, sel_init);
  }
  v36 = v27;

  sub_18F878CB4((uint64_t)&v48, &qword_1EE176BC8);
  return v36;
}

id sub_18F875D20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _BYTE *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  objc_class *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  void *v27;
  id v28;
  id v29;
  objc_class *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  void *v35;
  uint64_t v37;
  objc_super v38;
  objc_super v39;
  objc_super v40;
  __int128 v41;
  __int128 v42;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176B80);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (_BYTE *)(v2 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  swift_beginAccess();
  if (*v8 == 1)
  {
    swift_beginAccess();
    sub_18F87649C(a1, a2, (uint64_t)v7);
    swift_endAccess();
    v9 = sub_18F87F734();
    v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v7, 1, v9);
    sub_18F878CB4((uint64_t)v7, &qword_1EE176B80);
    if (v10 != 1)
    {
      *((_QWORD *)&v42 + 1) = MEMORY[0x1E0DEAFA0];
      LOBYTE(v41) = 1;
      v30 = (objc_class *)type metadata accessor for CNKeychainResult();
      v31 = (char *)objc_allocWithZone(v30);
      v32 = &v31[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
      *(_OWORD *)v32 = 0u;
      *((_OWORD *)v32 + 1) = 0u;
      v33 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(_QWORD *)&v31[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      v34 = v31;
      sub_18F874BF0((uint64_t)&v41, (uint64_t)v32);
      swift_endAccess();
      v35 = *(void **)&v31[v33];
      *(_QWORD *)&v31[v33] = 0;

      v38.receiver = v34;
      v38.super_class = v30;
      v29 = objc_msgSendSuper2(&v38, sel_init);
      goto LABEL_7;
    }
    sub_18F878C70();
    v41 = 0u;
    v42 = 0u;
    v11 = (void *)swift_allocError();
    *(_QWORD *)v12 = 0;
    *(_QWORD *)(v12 + 8) = 0;
    *(_BYTE *)(v12 + 16) = 3;
    v13 = (objc_class *)type metadata accessor for CNKeychainResult();
    v14 = (char *)objc_allocWithZone(v13);
    v15 = &v14[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)v15 = 0u;
    *((_OWORD *)v15 + 1) = 0u;
    v16 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(_QWORD *)&v14[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    v17 = v14;
    sub_18F874BF0((uint64_t)&v41, (uint64_t)v15);
    swift_endAccess();
    v18 = *(void **)&v14[v16];
    *(_QWORD *)&v14[v16] = v11;
    v19 = v11;

    v39.receiver = v17;
    v39.super_class = v13;
    v20 = objc_msgSendSuper2(&v39, sel_init);
  }
  else
  {
    sub_18F878C70();
    v41 = 0u;
    v42 = 0u;
    v11 = (void *)swift_allocError();
    *(_QWORD *)v21 = 0xD000000000000017;
    *(_QWORD *)(v21 + 8) = 0x800000018F8908B0;
    *(_BYTE *)(v21 + 16) = 2;
    v22 = (objc_class *)type metadata accessor for CNKeychainResult();
    v23 = (char *)objc_allocWithZone(v22);
    v24 = &v23[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)v24 = 0u;
    *((_OWORD *)v24 + 1) = 0u;
    v25 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(_QWORD *)&v23[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    v26 = v23;
    sub_18F874BF0((uint64_t)&v41, (uint64_t)v24);
    swift_endAccess();
    v27 = *(void **)&v23[v25];
    *(_QWORD *)&v23[v25] = v11;
    v28 = v11;

    v40.receiver = v26;
    v40.super_class = v22;
    v20 = objc_msgSendSuper2(&v40, sel_init);
  }
  v29 = v20;

LABEL_7:
  sub_18F878CB4((uint64_t)&v41, &qword_1EE176BC8);
  return v29;
}

id CNKeychainFacadeTestDouble.init()()
{
  _BYTE *v0;
  objc_super v2;

  v0[OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keyDict] = MEMORY[0x1E0DEE9E0];
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNKeychainFacadeTestDouble();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNKeychainFacadeTestDouble.__deallocating_deinit()
{
  return sub_18F87615C(type metadata accessor for CNKeychainFacadeTestDouble);
}

id sub_18F87615C(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_18F87619C(UInt8 *bytes@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  CFIndex v4;
  CFDataRef v5;
  CFDataRef v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (bytes)
    v4 = a2 - (_QWORD)bytes;
  else
    v4 = 0;
  v5 = CFDataCreateWithBytesNoCopy(0, bytes, v4, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (v5)
  {
    v6 = v5;
    v7 = sub_18F87F6E0();
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0xC000000000000000;
  }
  *a3 = v7;
  a3[1] = v9;
}

unint64_t sub_18F876220(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_18F87F800();
  return sub_18F8762B4(a1, v2);
}

unint64_t sub_18F876250(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_18F87F8FC();
  sub_18F87F7D0();
  v4 = sub_18F87F908();
  return sub_18F8763BC(a1, a2, v4);
}

unint64_t sub_18F8762B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_18F8790D0();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_18F87F80C();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_18F87F80C();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_18F8763BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_18F87F8B4() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_18F87F8B4() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_18F87649C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_18F876250(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_18F876CFC();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = sub_18F87F734();
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a3, v12 + *(_QWORD *)(v14 + 72) * v8, v13);
    sub_18F876934(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = sub_18F87F734();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_18F8765CC(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;

  v3 = v2;
  v45 = sub_18F87F734();
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78]();
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1783F8);
  v43 = a2;
  v8 = sub_18F87F878();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v43 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v7 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = v7;
      v26 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
      v28 = *v26;
      v27 = v26[1];
      v29 = *(_QWORD *)(v5 + 72);
      v30 = v24 + v29 * v20;
      if ((v43 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v44, v30, v45);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v30, v45);
        swift_bridgeObjectRetain();
      }
      sub_18F87F8FC();
      sub_18F87F7D0();
      result = sub_18F87F908();
      v31 = -1 << *(_BYTE *)(v9 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v14 + 8 * v33);
        }
        while (v37 == -1);
        v17 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v17);
      *v18 = v28;
      v18[1] = v27;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v9 + 56) + v29 * v17, v44, v45);
      ++*(_QWORD *)(v9 + 16);
      v7 = v25;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

unint64_t sub_18F876934(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_18F87F83C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_18F87F8FC();
        swift_bridgeObjectRetain();
        sub_18F87F7D0();
        v9 = sub_18F87F908();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(sub_18F87F734() - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_18F876B30(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_18F876250(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = sub_18F87F734();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_18F876CFC();
      goto LABEL_7;
    }
    sub_18F8765CC(v15, a4 & 1);
    v22 = sub_18F876250(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_18F876C6C(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_18F87F8C0();
  __break(1u);
  return result;
}

uint64_t sub_18F876C6C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = sub_18F87F734();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_18F876CFC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_18F87F734();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1783F8);
  v31 = v0;
  v4 = *v0;
  v5 = sub_18F87F86C();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_18F876F58(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void **v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void **v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  const __CFDictionary *v41;
  OSStatus v42;
  unint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  unint64_t v49;
  __int128 v50;
  char *v51;
  uint64_t v52;
  uint64_t *boxed_opaque_existential_0;
  objc_class *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  void *v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  CFStringRef v66;
  __CFString *v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  objc_class *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  objc_class *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  char *v91;
  void *v92;
  id v93;
  unint64_t v94;
  CFStringRef v95;
  __CFString *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  objc_class *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  char *v106;
  void *v107;
  id v108;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  objc_super v117;
  objc_super v118;
  objc_super v119;
  objc_super v120;
  CFTypeRef v121;
  __int128 v122;
  __int128 v123;
  CFTypeRef v124[47];

  v124[45] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v4 = sub_18F87F734();
  v5 = *(_QWORD *)(v4 - 8);
  v112 = v4;
  v113 = v5;
  MEMORY[0x1E0C80A78]();
  v111 = (char *)&v110 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176BC0);
  inited = swift_initStackObject();
  v8 = (void **)MEMORY[0x1E0CD6C98];
  *(_OWORD *)(inited + 16) = xmmword_18F8910E0;
  v9 = *v8;
  *(_QWORD *)(inited + 32) = *v8;
  v10 = (void *)*MEMORY[0x1E0CD6CC0];
  type metadata accessor for CFString();
  *(_QWORD *)(inited + 40) = v10;
  v11 = (void *)*MEMORY[0x1E0CD6900];
  v116 = v12;
  *(_QWORD *)(inited + 64) = v12;
  *(_QWORD *)(inited + 72) = v11;
  v13 = MEMORY[0x1E0DEA968];
  v14 = (void **)MEMORY[0x1E0CD6898];
  v114 = a1;
  *(_QWORD *)(inited + 80) = a1;
  *(_QWORD *)(inited + 88) = a2;
  v15 = *v14;
  *(_QWORD *)(inited + 104) = v13;
  *(_QWORD *)(inited + 112) = v15;
  v16 = qword_1EE176B70;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  swift_bridgeObjectRetain();
  v20 = v15;
  if (v16 != -1)
    swift_once();
  v115 = a2;
  v21 = qword_1EE176B60;
  v22 = *(_QWORD *)algn_1EE176B68;
  *(_QWORD *)(inited + 144) = v13;
  *(_QWORD *)(inited + 120) = v21;
  *(_QWORD *)(inited + 128) = v22;
  v23 = (void *)*MEMORY[0x1E0CD6B78];
  if (!*MEMORY[0x1E0CD6B78])
    __break(1u);
  *(_QWORD *)(inited + 152) = v23;
  v24 = (void *)*MEMORY[0x1E0CD6BE0];
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176B98);
  v26 = (void **)MEMORY[0x1E0CD70A8];
  *(_QWORD *)(inited + 160) = v24;
  v27 = *v26;
  *(_QWORD *)(inited + 184) = v25;
  *(_QWORD *)(inited + 192) = v27;
  v28 = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 200) = 1;
  v29 = (void *)*MEMORY[0x1E0CD6B80];
  *(_QWORD *)(inited + 224) = v28;
  *(_QWORD *)(inited + 232) = v29;
  *(_BYTE *)(inited + 240) = 1;
  v30 = (void *)*MEMORY[0x1E0CD68A0];
  *(_QWORD *)(inited + 264) = v28;
  *(_QWORD *)(inited + 272) = v30;
  v31 = (void *)*MEMORY[0x1E0CD68E8];
  v32 = (void **)MEMORY[0x1E0CD7018];
  *(_QWORD *)(inited + 280) = *MEMORY[0x1E0CD68E8];
  v33 = *v32;
  *(_QWORD *)(inited + 304) = v116;
  *(_QWORD *)(inited + 312) = v33;
  *(_QWORD *)(inited + 344) = v28;
  *(_BYTE *)(inited + 320) = 1;
  v34 = v24;
  v35 = v27;
  v36 = v29;
  v37 = v30;
  v38 = v31;
  v39 = v33;
  swift_bridgeObjectRetain();
  v40 = v23;
  sub_18F874DD8(inited);
  v124[0] = 0;
  sub_18F8790D0();
  sub_18F879240(&qword_1EE176BA8, (uint64_t (*)(uint64_t))sub_18F8790D0, MEMORY[0x1E0DEFCF8]);
  v41 = (const __CFDictionary *)sub_18F87F7AC();
  swift_bridgeObjectRelease();
  v42 = SecItemCopyMatching(v41, v124);

  if (v42)
  {
    v43 = v115;
    if (v42 == -25300)
    {
      if (qword_1EE176BF0 != -1)
        swift_once();
      v44 = sub_18F87F704();
      __swift_project_value_buffer(v44, (uint64_t)qword_1EE176BD8);
      swift_bridgeObjectRetain_n();
      v45 = sub_18F87F6EC();
      v46 = sub_18F87F7E8();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = (uint8_t *)swift_slowAlloc();
        v48 = swift_slowAlloc();
        *(_QWORD *)&v122 = v48;
        *(_DWORD *)v47 = 136315138;
        swift_bridgeObjectRetain();
        v121 = (CFTypeRef)sub_18F87A470(v114, v43, (uint64_t *)&v122);
        sub_18F87F818();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_18F80C000, v45, v46, "Existing encryption key with label %s not found", v47, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1940047DC](v48, -1, -1);
        MEMORY[0x1940047DC](v47, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_18F878C70();
      v122 = 0u;
      v123 = 0u;
      v76 = (void *)swift_allocError();
      *(_QWORD *)v77 = 0;
      *(_QWORD *)(v77 + 8) = 0;
      *(_BYTE *)(v77 + 16) = 3;
      v78 = (objc_class *)type metadata accessor for CNKeychainResult();
      v79 = (char *)objc_allocWithZone(v78);
      v80 = &v79[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
      *(_OWORD *)v80 = 0u;
      *((_OWORD *)v80 + 1) = 0u;
      v81 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(_QWORD *)&v79[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      v82 = v79;
      sub_18F874BF0((uint64_t)&v122, (uint64_t)v80);
      swift_endAccess();
      v83 = *(void **)&v79[v81];
      *(_QWORD *)&v79[v81] = v76;
      v84 = v76;

      v117.receiver = v82;
      v117.super_class = v78;
      v85 = objc_msgSendSuper2(&v117, sel_init);
    }
    else
    {
      if (qword_1EE176BF0 != -1)
        swift_once();
      v61 = sub_18F87F704();
      __swift_project_value_buffer(v61, (uint64_t)qword_1EE176BD8);
      swift_bridgeObjectRetain_n();
      v62 = sub_18F87F6EC();
      v63 = sub_18F87F7F4();
      if (os_log_type_enabled(v62, v63))
      {
        v64 = swift_slowAlloc();
        v65 = swift_slowAlloc();
        *(_QWORD *)&v122 = v65;
        *(_DWORD *)v64 = 136315394;
        swift_bridgeObjectRetain();
        v121 = (CFTypeRef)sub_18F87A470(v114, v43, (uint64_t *)&v122);
        sub_18F87F818();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v64 + 12) = 2080;
        v66 = SecCopyErrorMessageString(v42, 0);
        if (v66)
        {
          v67 = (__CFString *)v66;
          v68 = sub_18F87F7C4();
          v70 = v69;

        }
        else
        {
          LODWORD(v121) = v42;
          v68 = sub_18F87F89C();
          v70 = v94;
        }
        v121 = (CFTypeRef)sub_18F87A470(v68, v70, (uint64_t *)&v122);
        sub_18F87F818();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_18F80C000, v62, v63, "Error getting encryption key with label %s: %s", (uint8_t *)v64, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1940047DC](v65, -1, -1);
        MEMORY[0x1940047DC](v64, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v122 = 0u;
      v123 = 0u;
      v95 = SecCopyErrorMessageString(v42, 0);
      if (v95)
      {
        v96 = (__CFString *)v95;
        v97 = sub_18F87F7C4();
        v99 = v98;

      }
      else
      {
        LODWORD(v121) = v42;
        v97 = sub_18F87F89C();
        v99 = v100;
      }
      sub_18F878C70();
      v76 = (void *)swift_allocError();
      *(_QWORD *)v101 = v97;
      *(_QWORD *)(v101 + 8) = v99;
      *(_BYTE *)(v101 + 16) = 0;
      v102 = (objc_class *)type metadata accessor for CNKeychainResult();
      v103 = (char *)objc_allocWithZone(v102);
      v104 = &v103[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
      *(_OWORD *)v104 = 0u;
      *((_OWORD *)v104 + 1) = 0u;
      v105 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(_QWORD *)&v103[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      v106 = v103;
      sub_18F874BF0((uint64_t)&v122, (uint64_t)v104);
      swift_endAccess();
      v107 = *(void **)&v103[v105];
      *(_QWORD *)&v103[v105] = v76;
      v108 = v76;

      v120.receiver = v106;
      v120.super_class = v102;
      v85 = objc_msgSendSuper2(&v120, sel_init);
    }
LABEL_33:
    v60 = v85;

    sub_18F878CB4((uint64_t)&v122, &qword_1EE176BC8);
    goto LABEL_34;
  }
  v49 = v115;
  if (!v124[0] || (v121 = v124[0], swift_unknownObjectRetain(), (swift_dynamicCast() & 1) == 0))
  {
    if (qword_1EE176BF0 != -1)
      swift_once();
    v71 = sub_18F87F704();
    __swift_project_value_buffer(v71, (uint64_t)qword_1EE176BD8);
    swift_bridgeObjectRetain_n();
    v72 = sub_18F87F6EC();
    v73 = sub_18F87F7F4();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      v75 = swift_slowAlloc();
      *(_QWORD *)&v122 = v75;
      *(_DWORD *)v74 = 136315138;
      swift_bridgeObjectRetain();
      v121 = (CFTypeRef)sub_18F87A470(v114, v49, (uint64_t *)&v122);
      sub_18F87F818();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_18F80C000, v72, v73, "Search result for existing encryption key with label %s was not data", v74, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1940047DC](v75, -1, -1);
      MEMORY[0x1940047DC](v74, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_18F878C70();
    v122 = 0u;
    v123 = 0u;
    v76 = (void *)swift_allocError();
    *(_OWORD *)v86 = xmmword_18F8910F0;
    *(_BYTE *)(v86 + 16) = 3;
    v87 = (objc_class *)type metadata accessor for CNKeychainResult();
    v88 = (char *)objc_allocWithZone(v87);
    v89 = &v88[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)v89 = 0u;
    *((_OWORD *)v89 + 1) = 0u;
    v90 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(_QWORD *)&v88[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    v91 = v88;
    sub_18F874BF0((uint64_t)&v122, (uint64_t)v89);
    swift_endAccess();
    v92 = *(void **)&v88[v90];
    *(_QWORD *)&v88[v90] = v76;
    v93 = v76;

    v119.receiver = v91;
    v119.super_class = v87;
    v85 = objc_msgSendSuper2(&v119, sel_init);
    goto LABEL_33;
  }
  v50 = v122;
  sub_18F879174(v122, *((unint64_t *)&v122 + 1));
  v51 = v111;
  sub_18F87F71C();
  v52 = v112;
  *((_QWORD *)&v123 + 1) = v112;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v122);
  (*(void (**)(uint64_t *, char *, uint64_t))(v113 + 16))(boxed_opaque_existential_0, v51, v52);
  v54 = (objc_class *)type metadata accessor for CNKeychainResult();
  v55 = (char *)objc_allocWithZone(v54);
  v56 = &v55[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
  *(_OWORD *)v56 = 0u;
  *((_OWORD *)v56 + 1) = 0u;
  v57 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
  *(_QWORD *)&v55[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
  swift_beginAccess();
  v58 = v55;
  sub_18F874BF0((uint64_t)&v122, (uint64_t)v56);
  swift_endAccess();
  v59 = *(void **)&v55[v57];
  *(_QWORD *)&v55[v57] = 0;

  v118.receiver = v58;
  v118.super_class = v54;
  v60 = objc_msgSendSuper2(&v118, sel_init);
  sub_18F878CB4((uint64_t)&v122, &qword_1EE176BC8);
  sub_18F8791B8(v50, *((unint64_t *)&v50 + 1));
  (*(void (**)(char *, uint64_t))(v113 + 8))(v51, v52);
LABEL_34:
  swift_unknownObjectRelease();
  return v60;
}

char *sub_18F877AC4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *result;
  void *v12;
  id v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t inited;
  void **v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  uint64_t v39;
  void **v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  __int128 v67;
  const __CFDictionary *v68;
  OSStatus v69;
  NSObject *v70;
  os_log_type_t v71;
  __objc2_meth_list **p_inst_meths;
  os_log_type_t v73;
  uint64_t v74;
  uint64_t v75;
  CFStringRef v76;
  __CFString *v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v82;
  objc_class *v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  void *v89;
  id v90;
  NSObject *v91;
  unint64_t v92;
  CFStringRef v93;
  __CFString *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  objc_class *v101;
  char *v102;
  _OWORD *v103;
  uint64_t v104;
  char *v105;
  void *v106;
  id v107;
  id v108;
  _QWORD v109[2];
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  NSObject *v116;
  objc_super v117;
  objc_super v118;
  uint64_t v119;
  __int128 v120;
  __int128 v121;

  sub_18F87F74C();
  MEMORY[0x1E0C80A78]();
  v4 = sub_18F87F734();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = ((char *)v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = (char *)sub_18F876F58(a1, a2);
  v9 = (uint64_t)&v8[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
  swift_beginAccess();
  sub_18F8791FC(v9, (uint64_t)&v120, &qword_1EE176BC8);
  v10 = *((_QWORD *)&v121 + 1);
  sub_18F878CB4((uint64_t)&v120, &qword_1EE176BC8);
  if (v10)
    return v8;
  v12 = *(void **)&v8[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error];
  if (!v12)
    return v8;
  v119 = *(_QWORD *)&v8[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error];
  v13 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176C00);
  if (!swift_dynamicCast())
    return v8;
  v116 = v7;
  v14 = v120;
  v15 = v121;
  if (v121 != 3 || v120 != 0)
  {
    v23 = *((_QWORD *)&v120 + 1);
    if (qword_1EE176BF0 != -1)
      swift_once();
    v24 = sub_18F87F704();
    __swift_project_value_buffer(v24, (uint64_t)qword_1EE176BD8);
    swift_bridgeObjectRetain();
    sub_18F878D50(v14, v23, v15);
    swift_bridgeObjectRetain();
    sub_18F878D50(v14, v23, v15);
    v25 = sub_18F87F6EC();
    v26 = sub_18F87F7F4();
    v116 = v25;
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v114 = (_QWORD *)swift_slowAlloc();
      v115 = swift_slowAlloc();
      *(_QWORD *)&v120 = v115;
      *(_DWORD *)v27 = 136315394;
      swift_bridgeObjectRetain();
      v119 = sub_18F87A470(a1, a2, (uint64_t *)&v120);
      sub_18F87F818();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v27 + 12) = 2112;
      sub_18F878C70();
      swift_allocError();
      *(_QWORD *)v28 = v14;
      *(_QWORD *)(v28 + 8) = v23;
      *(_BYTE *)(v28 + 16) = v15;
      sub_18F878D50(v14, v23, v15);
      v29 = _swift_stdlib_bridgeErrorToNSError();
      v119 = v29;
      sub_18F87F818();
      v30 = v114;
      *v114 = v29;
      sub_18F878D78(v14, v23, v15);
      sub_18F878D78(v14, v23, v15);
      v31 = v116;
      _os_log_impl(&dword_18F80C000, v116, v26, "Error checking if encryption key with label %s exists: %@", (uint8_t *)v27, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE178400);
      swift_arrayDestroy();
      MEMORY[0x1940047DC](v30, -1, -1);
      v32 = v115;
      swift_arrayDestroy();
      MEMORY[0x1940047DC](v32, -1, -1);
      MEMORY[0x1940047DC](v27, -1, -1);

    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_18F878D78(v14, v23, v15);
      sub_18F878D78(v14, v23, v15);

    }
    sub_18F878D78(v14, v23, v15);
    return v8;
  }
  if (qword_1EE176BF0 != -1)
    swift_once();
  v16 = sub_18F87F704();
  v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EE176BD8);
  swift_bridgeObjectRetain_n();
  v18 = sub_18F87F6EC();
  v19 = sub_18F87F7E8();
  v20 = os_log_type_enabled(v18, v19);
  v115 = v4;
  v112 = v5;
  v109[1] = v17;
  if (v20)
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    *(_QWORD *)&v120 = v22;
    *(_DWORD *)v21 = 136315138;
    v114 = v21 + 4;
    swift_bridgeObjectRetain();
    v119 = sub_18F87A470(a1, a2, (uint64_t *)&v120);
    sub_18F87F818();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_18F80C000, v18, v19, "No existing encryption key with label %s found, will create a new one", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1940047DC](v22, -1, -1);
    MEMORY[0x1940047DC](v21, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_18F87F740();
  sub_18F87F728();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176BC0);
  inited = swift_initStackObject();
  v34 = (void **)MEMORY[0x1E0CD6C98];
  *(_OWORD *)(inited + 16) = xmmword_18F8910E0;
  v35 = *v34;
  *(_QWORD *)(inited + 32) = *v34;
  v36 = (void *)*MEMORY[0x1E0CD6CC0];
  type metadata accessor for CFString();
  *(_QWORD *)(inited + 40) = v36;
  v37 = (void *)*MEMORY[0x1E0CD6900];
  v114 = v38;
  *(_QWORD *)(inited + 64) = v38;
  *(_QWORD *)(inited + 72) = v37;
  v39 = MEMORY[0x1E0DEA968];
  v40 = (void **)MEMORY[0x1E0CD6898];
  *(_QWORD *)(inited + 80) = a1;
  *(_QWORD *)(inited + 88) = a2;
  v41 = *v40;
  *(_QWORD *)(inited + 104) = v39;
  *(_QWORD *)(inited + 112) = v41;
  v42 = qword_1EE176B70;
  swift_bridgeObjectRetain();
  v43 = v35;
  v44 = v36;
  v45 = v37;
  result = v41;
  if (v42 != -1)
    result = (char *)swift_once();
  v47 = qword_1EE176B60;
  v46 = *(_QWORD *)algn_1EE176B68;
  *(_QWORD *)(inited + 144) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 120) = v47;
  *(_QWORD *)(inited + 128) = v46;
  v113 = v46;
  v48 = (void *)*MEMORY[0x1E0CD6B78];
  if (*MEMORY[0x1E0CD6B78])
  {
    *(_QWORD *)(inited + 152) = v48;
    v110 = (id)*MEMORY[0x1E0CD6BE0];
    v49 = v110;
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176B98);
    *(_QWORD *)(inited + 160) = v49;
    v111 = (id)*MEMORY[0x1E0CD70A8];
    v51 = v111;
    *(_QWORD *)(inited + 184) = v50;
    *(_QWORD *)(inited + 192) = v51;
    v52 = MEMORY[0x1E0DEAFA0];
    *(_BYTE *)(inited + 200) = 1;
    v53 = (void *)*MEMORY[0x1E0CD6B80];
    *(_QWORD *)(inited + 224) = v52;
    *(_QWORD *)(inited + 232) = v53;
    *(_BYTE *)(inited + 240) = 1;
    v54 = (void *)*MEMORY[0x1E0CD68A0];
    *(_QWORD *)(inited + 264) = v52;
    *(_QWORD *)(inited + 272) = v54;
    v55 = (void *)*MEMORY[0x1E0CD68E8];
    *(_QWORD *)(inited + 280) = *MEMORY[0x1E0CD68E8];
    v56 = (void *)*MEMORY[0x1E0CD70D8];
    *(_QWORD *)(inited + 304) = v114;
    *(_QWORD *)(inited + 312) = v56;
    v114 = (_QWORD *)sub_18F879240(&qword_1EE176BF8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA93C8], MEMORY[0x1E0CA9398]);
    swift_bridgeObjectRetain();
    v57 = v48;
    v58 = v110;
    v59 = v111;
    v60 = v53;
    v61 = v54;
    v62 = v55;
    v63 = v56;
    v64 = MEMORY[0x1E0CB0338];
    v65 = v115;
    v66 = v116;
    sub_18F87F6B0();
    v67 = v120;
    *(_QWORD *)(inited + 344) = v64;
    *(_OWORD *)(inited + 320) = v67;
    sub_18F874DD8(inited);
    sub_18F8790D0();
    sub_18F879240(&qword_1EE176BA8, (uint64_t (*)(uint64_t))sub_18F8790D0, MEMORY[0x1E0DEFCF8]);
    v68 = (const __CFDictionary *)sub_18F87F7AC();
    swift_bridgeObjectRelease();
    v69 = SecItemAdd(v68, 0);

    if (v69)
    {
      swift_bridgeObjectRetain_n();
      v70 = sub_18F87F6EC();
      v71 = sub_18F87F7F4();
      p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSXPCListenerDelegate + 24);
      if (os_log_type_enabled(v70, v71))
      {
        v73 = v71;
        v74 = swift_slowAlloc();
        v75 = swift_slowAlloc();
        *(_QWORD *)&v120 = v75;
        *(_DWORD *)v74 = 136315394;
        swift_bridgeObjectRetain();
        v119 = sub_18F87A470(a1, a2, (uint64_t *)&v120);
        sub_18F87F818();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v74 + 12) = 2080;
        v76 = SecCopyErrorMessageString(v69, 0);
        if (v76)
        {
          v77 = (__CFString *)v76;
          v78 = sub_18F87F7C4();
          v80 = v79;

        }
        else
        {
          LODWORD(v119) = v69;
          v78 = sub_18F87F89C();
          v80 = v92;
        }
        v119 = sub_18F87A470(v78, v80, (uint64_t *)&v120);
        sub_18F87F818();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_18F80C000, v70, v73, "Failed to add encryption key with label %s to keychain: %s", (uint8_t *)v74, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1940047DC](v75, -1, -1);
        MEMORY[0x1940047DC](v74, -1, -1);

        v91 = v116;
        p_inst_meths = &OBJC_PROTOCOL___NSXPCListenerDelegate.inst_meths;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v91 = v116;
      }
      v120 = 0u;
      v121 = 0u;
      v93 = SecCopyErrorMessageString(v69, 0);
      if (v93)
      {
        v94 = (__CFString *)v93;
        v95 = sub_18F87F7C4();
        v97 = v96;

      }
      else
      {
        LODWORD(v119) = v69;
        v95 = sub_18F87F89C();
        v97 = v98;
      }
      sub_18F878C70();
      v99 = (void *)swift_allocError();
      *(_QWORD *)v100 = v95;
      *(_QWORD *)(v100 + 8) = v97;
      *(_BYTE *)(v100 + 16) = 1;
      v101 = (objc_class *)type metadata accessor for CNKeychainResult();
      v102 = (char *)objc_allocWithZone(v101);
      v103 = (_OWORD *)((char *)p_inst_meths[123] + (_QWORD)v102);
      *v103 = 0u;
      v103[1] = 0u;
      v104 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(_QWORD *)&v102[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      v105 = v102;
      sub_18F874BF0((uint64_t)&v120, (uint64_t)v103);
      swift_endAccess();
      v106 = *(void **)&v102[v104];
      *(_QWORD *)&v102[v104] = v99;
      v107 = v99;

      v118.receiver = v105;
      v118.super_class = v101;
      v108 = objc_msgSendSuper2(&v118, sel_init);

      sub_18F878CB4((uint64_t)&v120, &qword_1EE176BC8);
      (*(void (**)(NSObject *, uint64_t))(v112 + 8))(v91, v115);
      return (char *)v108;
    }
    else
    {
      *((_QWORD *)&v121 + 1) = v65;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v120);
      v82 = v112;
      (*(void (**)(uint64_t *, NSObject *, uint64_t))(v112 + 16))(boxed_opaque_existential_0, v66, v65);
      v83 = (objc_class *)type metadata accessor for CNKeychainResult();
      v84 = (char *)objc_allocWithZone(v83);
      v85 = &v84[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
      *(_OWORD *)v85 = 0u;
      *((_OWORD *)v85 + 1) = 0u;
      v86 = v65;
      v87 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(_QWORD *)&v84[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      v88 = v84;
      sub_18F874BF0((uint64_t)&v120, (uint64_t)v85);
      swift_endAccess();
      v89 = *(void **)&v84[v87];
      *(_QWORD *)&v84[v87] = 0;

      v117.receiver = v88;
      v117.super_class = v83;
      v90 = objc_msgSendSuper2(&v117, sel_init);
      sub_18F878CB4((uint64_t)&v120, &qword_1EE176BC8);

      (*(void (**)(NSObject *, uint64_t))(v82 + 8))(v66, v86);
      return (char *)v90;
    }
  }
  __break(1u);
  return result;
}

id sub_18F8786AC(uint64_t a1, unint64_t a2)
{
  uint64_t inited;
  void **v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id result;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void **v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  const __CFDictionary *v31;
  OSStatus v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  CFStringRef v38;
  __CFString *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  objc_class *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  void *v48;
  id v49;
  unint64_t v50;
  CFStringRef v51;
  __CFString *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  objc_class *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  char *v63;
  void *v64;
  id v65;
  objc_super v66;
  objc_super v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176BC0);
  inited = swift_initStackObject();
  v5 = (void **)MEMORY[0x1E0CD6C98];
  *(_OWORD *)(inited + 16) = xmmword_18F891100;
  v6 = *v5;
  *(_QWORD *)(inited + 32) = *v5;
  v7 = (void *)*MEMORY[0x1E0CD6CC0];
  type metadata accessor for CFString();
  *(_QWORD *)(inited + 40) = v7;
  v8 = (void *)*MEMORY[0x1E0CD6900];
  *(_QWORD *)(inited + 64) = v9;
  *(_QWORD *)(inited + 72) = v8;
  v10 = MEMORY[0x1E0DEA968];
  v11 = (void **)MEMORY[0x1E0CD6898];
  *(_QWORD *)(inited + 80) = a1;
  *(_QWORD *)(inited + 88) = a2;
  v12 = *v11;
  *(_QWORD *)(inited + 104) = v10;
  *(_QWORD *)(inited + 112) = v12;
  v13 = qword_1EE176B70;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  swift_bridgeObjectRetain();
  result = v12;
  if (v13 != -1)
    result = (id)swift_once();
  v18 = qword_1EE176B60;
  v19 = *(_QWORD *)algn_1EE176B68;
  *(_QWORD *)(inited + 144) = v10;
  *(_QWORD *)(inited + 120) = v18;
  *(_QWORD *)(inited + 128) = v19;
  v20 = (void *)*MEMORY[0x1E0CD6B78];
  if (*MEMORY[0x1E0CD6B78])
  {
    *(_QWORD *)(inited + 152) = v20;
    v21 = (void *)*MEMORY[0x1E0CD6BE0];
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176B98);
    *(_QWORD *)(inited + 160) = v21;
    v23 = (void *)*MEMORY[0x1E0CD70A8];
    *(_QWORD *)(inited + 184) = v22;
    *(_QWORD *)(inited + 192) = v23;
    v24 = MEMORY[0x1E0DEAFA0];
    v25 = (void **)MEMORY[0x1E0CD6B80];
    *(_BYTE *)(inited + 200) = 1;
    v26 = *v25;
    *(_QWORD *)(inited + 224) = v24;
    *(_QWORD *)(inited + 232) = v26;
    *(_QWORD *)(inited + 264) = v24;
    *(_BYTE *)(inited + 240) = 1;
    v27 = v21;
    v28 = v23;
    v29 = v26;
    swift_bridgeObjectRetain();
    v30 = v20;
    sub_18F874DD8(inited);
    sub_18F8790D0();
    sub_18F879240(&qword_1EE176BA8, (uint64_t (*)(uint64_t))sub_18F8790D0, MEMORY[0x1E0DEFCF8]);
    v31 = (const __CFDictionary *)sub_18F87F7AC();
    swift_bridgeObjectRelease();
    v32 = SecItemDelete(v31);

    if (v32)
    {
      if (qword_1EE176BF0 != -1)
        swift_once();
      v33 = sub_18F87F704();
      __swift_project_value_buffer(v33, (uint64_t)qword_1EE176BD8);
      swift_bridgeObjectRetain_n();
      v34 = sub_18F87F6EC();
      v35 = sub_18F87F7F4();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = swift_slowAlloc();
        v37 = swift_slowAlloc();
        *(_QWORD *)&v69 = v37;
        *(_DWORD *)v36 = 136315394;
        swift_bridgeObjectRetain();
        v68 = sub_18F87A470(a1, a2, (uint64_t *)&v69);
        sub_18F87F818();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v36 + 12) = 2080;
        v38 = SecCopyErrorMessageString(v32, 0);
        if (v38)
        {
          v39 = (__CFString *)v38;
          v40 = sub_18F87F7C4();
          v42 = v41;

        }
        else
        {
          LODWORD(v68) = v32;
          v40 = sub_18F87F89C();
          v42 = v50;
        }
        v68 = sub_18F87A470(v40, v42, (uint64_t *)&v69);
        sub_18F87F818();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_18F80C000, v34, v35, "Could not delete encryption key with label %s: %s", (uint8_t *)v36, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1940047DC](v37, -1, -1);
        MEMORY[0x1940047DC](v36, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v69 = 0u;
      v70 = 0u;
      v51 = SecCopyErrorMessageString(v32, 0);
      if (v51)
      {
        v52 = (__CFString *)v51;
        v53 = sub_18F87F7C4();
        v55 = v54;

      }
      else
      {
        LODWORD(v68) = v32;
        v53 = sub_18F87F89C();
        v55 = v56;
      }
      sub_18F878C70();
      v57 = (void *)swift_allocError();
      *(_QWORD *)v58 = v53;
      *(_QWORD *)(v58 + 8) = v55;
      *(_BYTE *)(v58 + 16) = 2;
      v59 = (objc_class *)type metadata accessor for CNKeychainResult();
      v60 = (char *)objc_allocWithZone(v59);
      v61 = &v60[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
      *(_OWORD *)v61 = 0u;
      *((_OWORD *)v61 + 1) = 0u;
      v62 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(_QWORD *)&v60[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      v63 = v60;
      sub_18F874BF0((uint64_t)&v69, (uint64_t)v61);
      swift_endAccess();
      v64 = *(void **)&v60[v62];
      *(_QWORD *)&v60[v62] = v57;
      v65 = v57;

      v67.receiver = v63;
      v67.super_class = v59;
      v49 = objc_msgSendSuper2(&v67, sel_init);

    }
    else
    {
      *((_QWORD *)&v70 + 1) = v24;
      LOBYTE(v69) = 1;
      v43 = (objc_class *)type metadata accessor for CNKeychainResult();
      v44 = (char *)objc_allocWithZone(v43);
      v45 = &v44[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
      *(_OWORD *)v45 = 0u;
      *((_OWORD *)v45 + 1) = 0u;
      v46 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(_QWORD *)&v44[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      v47 = v44;
      sub_18F874BF0((uint64_t)&v69, (uint64_t)v45);
      swift_endAccess();
      v48 = *(void **)&v44[v46];
      *(_QWORD *)&v44[v46] = 0;

      v66.receiver = v47;
      v66.super_class = v43;
      v49 = objc_msgSendSuper2(&v66, sel_init);
    }
    sub_18F878CB4((uint64_t)&v69, &qword_1EE176BC8);
    return v49;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for CNKeychainFacade()
{
  return objc_opt_self();
}

unint64_t sub_18F878C70()
{
  unint64_t result;

  result = qword_1EE176BD0;
  if (!qword_1EE176BD0)
  {
    result = MEMORY[0x194004770](&protocol conformance descriptor for SecKeyError, &type metadata for SecKeyError);
    atomic_store(result, (unint64_t *)&qword_1EE176BD0);
  }
  return result;
}

uint64_t sub_18F878CB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t type metadata accessor for CNKeychainFacadeTestDouble()
{
  return objc_opt_self();
}

uint64_t sub_18F878D50(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for SecKeyError(uint64_t a1)
{
  return sub_18F878D78(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_18F878D78(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s18ContactsFoundation11SecKeyErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_18F878D50(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SecKeyError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_18F878D50(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_18F878D78(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SecKeyError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_18F878D78(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SecKeyError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SecKeyError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_18F878F10(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_18F878F2C(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SecKeyError()
{
  return &type metadata for SecKeyError;
}

uint64_t method lookup function for CNKeychainResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNKeychainResult.__allocating_init(value:error:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t method lookup function for CNKeychainFacade()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNKeychainFacade.createSymmetricKeyIfNeeded(label:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of CNKeychainFacade.existingSymmetricKey(label:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CNKeychainFacade.removeEncryptionKey(label:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t method lookup function for CNKeychainFacadeTestDouble()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNKeychainFacadeTestDouble.keychainEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CNKeychainFacadeTestDouble.keychainEnabled.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CNKeychainFacadeTestDouble.keychainEnabled.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CNKeychainFacadeTestDouble.createSymmetricKeyIfNeeded(label:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CNKeychainFacadeTestDouble.existingSymmetricKey(label:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CNKeychainFacadeTestDouble.removeEncryptionKey(label:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

void type metadata accessor for CFString()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EE176B90)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EE176B90);
  }
}

unint64_t sub_18F8790D0()
{
  unint64_t result;

  result = qword_1EE176BA0;
  if (!qword_1EE176BA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE176BA0);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

_OWORD *sub_18F879164(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_18F879174(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_18F8791B8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_18F8791FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_18F879240(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x194004770](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18F879288()
{
  uint64_t v0;

  v0 = sub_18F87F704();
  __swift_allocate_value_buffer(v0, qword_1EE178408);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE178408);
  return sub_18F87F6F8();
}

uint64_t static CNDataEncoder.decode(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = sub_18F87F668();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F87F620();
  swift_allocObject();
  sub_18F87F614();
  sub_18F879AC8(&qword_1EE176B40, MEMORY[0x1E0CAE750]);
  sub_18F87F608();
  swift_release();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(a1, 0, 1, v2);
}

id CNDataEncoder.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CNDataEncoder.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNDataEncoder();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNDataEncoder.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNDataEncoder();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s18ContactsFoundation13CNDataEncoderC6encodey0B04DataVSgAE13TermOfAddressVFZ_0()
{
  uint64_t v0;

  sub_18F87F644();
  swift_allocObject();
  sub_18F87F638();
  sub_18F87F668();
  sub_18F879AC8(&qword_1EE176B38, MEMORY[0x1E0CAE740]);
  v0 = sub_18F87F62C();
  swift_release();
  return v0;
}

uint64_t type metadata accessor for CNDataEncoder()
{
  return objc_opt_self();
}

uint64_t method lookup function for CNDataEncoder()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_18F879AB4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_18F8791B8(a1, a2);
  return a1;
}

uint64_t sub_18F879AC8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_18F87F668();
    result = MEMORY[0x194004770](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_18F879B08()
{
  qword_1EE1789A0 = 0x6E6961686379656BLL;
  *(_QWORD *)algn_1EE1789A8 = 0xEF6564616361662DLL;
}

uint64_t sub_18F879B68()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t result;
  uint64_t v5;
  _QWORD aBlock[6];

  if (qword_1EE176B58 != -1)
    swift_once();
  v1 = (void *)sub_18F87F7B8();
  aBlock[4] = sub_18F879CB4;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18F879D10;
  aBlock[3] = &block_descriptor_3;
  v2 = _Block_copy(aBlock);
  swift_release();
  v3 = objc_msgSend(v0, sel_valueForKey_onCacheMiss_, v1, v2);

  _Block_release(v2);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_18F87F830();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176B78);
    swift_dynamicCast();
    return v5;
  }
  return result;
}

id sub_18F879CB4@<X0>(_QWORD *a1@<X8>)
{
  return sub_18F879CCC((uint64_t (*)(_QWORD))type metadata accessor for CNKeychainFacade, a1);
}

id sub_18F879CC0@<X0>(_QWORD *a1@<X8>)
{
  return sub_18F879CCC((uint64_t (*)(_QWORD))type metadata accessor for CNKeychainFacadeTestDouble, a1);
}

id sub_18F879CCC@<X0>(uint64_t (*a1)(_QWORD)@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v3;
  id result;

  v3 = (objc_class *)a1(0);
  result = objc_msgSend(objc_allocWithZone(v3), sel_init);
  a2[3] = v3;
  *a2 = result;
  return result;
}

id sub_18F879D10(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];

  (*(void (**)(_QWORD *__return_ptr))(a1 + 32))(v3);
  __swift_project_boxed_opaque_existential_0(v3, v3[3]);
  v1 = (void *)sub_18F87F8A8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  return v1;
}

uint64_t sub_18F879D94()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t result;
  unsigned __int8 v5;
  unsigned __int8 *v6;
  uint64_t v7;
  _QWORD aBlock[6];

  if (qword_1EE176B58 != -1)
    swift_once();
  v1 = (void *)sub_18F87F7B8();
  aBlock[4] = sub_18F879CC0;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18F879D10;
  aBlock[3] = &block_descriptor;
  v2 = _Block_copy(aBlock);
  swift_release();
  v3 = objc_msgSend(v0, sel_valueForKey_onCacheMiss_, v1, v2);

  _Block_release(v2);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_18F87F830();
    swift_unknownObjectRelease();
    type metadata accessor for CNKeychainFacadeTestDouble();
    swift_dynamicCast();
    v5 = objc_msgSend(v0, sel_isKeychainEnabled);
    v6 = (unsigned __int8 *)(v7 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
    swift_beginAccess();
    *v6 = v5;
    return v7;
  }
  return result;
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

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

void CNData.synchronousData(withContentsOf:timeout:)(double a1)
{
  void *v1;
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)sub_18F87F6BC();
  v4 = objc_msgSend(v1, sel_synchronousDataWithContentsOfURL_timeout_, v3, a1);

  if (objc_msgSend(v4, sel_isSuccess))
  {
    v5 = objc_msgSend(v4, sel_value);
    if (v5)
    {
      v6 = v5;
      sub_18F87F6E0();

      return;
    }
    __break(1u);
  }
  else if (objc_msgSend(v4, sel_error))
  {
    swift_willThrow();

    return;
  }
  __break(1u);
}

uint64_t sub_18F87A120()
{
  uint64_t v0;

  v0 = sub_18F87F704();
  __swift_allocate_value_buffer(v0, qword_1EE178420);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE178420);
  return sub_18F87F6F8();
}

void sub_18F87A1AC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_18F87A1E8()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (BYTE6(v0) > 0x1BuLL)
  {
    sub_18F879174(v1, v0);
    sub_18F87AAB0(v1, v0);
    sub_18F87F794();
  }
  else
  {
    v2 = sub_18F87F710();
    sub_18F87C078();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, *MEMORY[0x1E0CA91E0], v2);
    swift_willThrow();
  }
  return sub_18F8791B8(v1, v0);
}

id sub_18F87A2E0(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t (*a5)(uint64_t, unint64_t, uint64_t, uint64_t))
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = sub_18F87F6E0();
  v11 = v10;

  v12 = sub_18F87F7C4();
  v14 = v13;

  v15 = a5(v9, v11, v12, v14);
  v17 = v16;
  swift_bridgeObjectRelease();
  sub_18F8791B8(v9, v11);
  if (v17 >> 60 == 15)
  {
    v18 = 0;
  }
  else
  {
    v18 = (void *)sub_18F87F6D4();
    sub_18F879AB4(v15, v17);
  }
  return v18;
}

id CNDataEncryptor.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CNDataEncryptor.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNDataEncryptor();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNDataEncryptor.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNDataEncryptor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18F87A470(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_18F87A540(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_18F87C038((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_18F87C038((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_18F87A540(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_18F87F824();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_18F87A6F8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_18F87F854();
  if (!v8)
  {
    sub_18F87F860();
    __break(1u);
LABEL_17:
    result = sub_18F87F890();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_18F87A6F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_18F87A78C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_18F87A964(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_18F87A964(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_18F87A78C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_18F87A900(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_18F87F848();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_18F87F860();
      __break(1u);
LABEL_10:
      v2 = sub_18F87F7DC();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_18F87F890();
    __break(1u);
LABEL_14:
    result = sub_18F87F860();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_18F87A900(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE178438);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_18F87A964(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE178438);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_18F87F890();
  __break(1u);
  return result;
}

void sub_18F87AAB0(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[3] = MEMORY[0x1E0CB0338];
  v3[4] = MEMORY[0x1E0CB0318];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_18F87AB14
     + *((int *)qword_18F87AD48 + (__swift_project_boxed_opaque_existential_0(v3, MEMORY[0x1E0CB0338])[1] >> 62));
  __asm { BR              X10 }
}

uint64_t sub_18F87AB24()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int16 v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v6 = v2;
  v7 = v3;
  v8 = BYTE2(v3);
  v9 = BYTE3(v3);
  v10 = BYTE4(v3);
  v11 = BYTE5(v3);
  sub_18F879174(v1, v0);
  sub_18F87AD58(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  sub_18F8791B8(v1, v0);
  v4 = v12;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v13);
  return v4;
}

_BYTE *sub_18F87AD58@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_18F87B56C(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_18F87B62C((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_18F87B6A4((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t _s18ContactsFoundation15CNDataEncryptorC7encrypt_8keyLabel0B04DataVSgAH_SStFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  int v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  id v37;
  char *v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50[5];

  v42 = a1;
  v43 = a2;
  v50[4] = *MEMORY[0x1E0C80C00];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176B88);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_18F87F7A0();
  v9 = *(_QWORD *)(v41 - 8);
  MEMORY[0x1E0C80A78](v41);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_18F87F77C();
  v48 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45);
  v47 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176B80);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_18F87F734();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v46 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = objc_msgSend((id)objc_opt_self(), sel_currentEnvironment);
  v20 = objc_msgSend(v19, sel_keychainFacade);

  v44 = a3;
  v21 = (void *)sub_18F87F7B8();
  v22 = objc_msgSend(v20, sel_createSymmetricKeyIfNeededWithLabel_, v21);

  swift_unknownObjectRelease();
  v23 = (uint64_t)v22 + OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value;
  swift_beginAccess();
  sub_18F87BFF0(v23, (uint64_t)v50);
  if (v50[3])
  {
    v24 = swift_dynamicCast();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v15, v24 ^ 1u, 1, v16);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) != 1)
    {
      v44 = v9;
      v25 = v46;
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v46, v15, v16);
      v26 = v47;
      sub_18F87F770();
      v50[0] = v42;
      v50[1] = v43;
      v27 = v48;
      v28 = v45;
      (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v8, v26, v45);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v8, 0, 1, v28);
      sub_18F87C0C0();
      sub_18F87F764();
      sub_18F878CB4((uint64_t)v8, &qword_1EE176B88);
      v38 = v26;
      v39 = sub_18F87F788();

      (*(void (**)(char *, uint64_t))(v44 + 8))(v11, v41);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v38, v28);
      (*(void (**)(char *, uint64_t))(v17 + 8))(v25, v16);
      return v39;
    }
  }
  else
  {
    sub_18F878CB4((uint64_t)v50, &qword_1EE176BC8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  }
  sub_18F878CB4((uint64_t)v15, &qword_1EE176B80);
  if (qword_1EE1783D0 != -1)
    swift_once();
  v29 = sub_18F87F704();
  __swift_project_value_buffer(v29, (uint64_t)qword_1EE178420);
  swift_bridgeObjectRetain_n();
  v30 = (char *)v22;
  v31 = sub_18F87F6EC();
  v32 = sub_18F87F7F4();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = swift_slowAlloc();
    v34 = (_QWORD *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v50[0] = v35;
    *(_DWORD *)v33 = 136315394;
    swift_bridgeObjectRetain();
    v49 = sub_18F87A470(v44, a4, v50);
    sub_18F87F818();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v33 + 12) = 2112;
    v36 = *(void **)&v30[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error];
    if (v36)
    {
      v37 = v36;
      v36 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v49 = (uint64_t)v36;
    }
    else
    {
      v49 = 0;
    }
    sub_18F87F818();
    *v34 = v36;

    _os_log_impl(&dword_18F80C000, v31, v32, "Failed to create symmetric key with label %s: %@", (uint8_t *)v33, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE178400);
    swift_arrayDestroy();
    MEMORY[0x1940047DC](v34, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1940047DC](v35, -1, -1);
    MEMORY[0x1940047DC](v33, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_18F87B56C(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_18F87B62C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_18F87F6A4();
  swift_allocObject();
  result = sub_18F87F674();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_18F87F6C8();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_18F87B6A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_18F87F6A4();
  swift_allocObject();
  result = sub_18F87F674();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t _s18ContactsFoundation15CNDataEncryptorC7decrypt_8keyLabel0B04DataVSgAH_SStFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  int v30;
  void (**v31)(char *, char *, uint64_t);
  char *v32;
  uint64_t v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void (*v44)(char *, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57[5];

  v54 = a3;
  v55 = a4;
  v57[4] = *MEMORY[0x1E0C80C00];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176B80);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_18F87F734();
  v10 = *(char **)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_18F87F7A0();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v48 - v18;
  sub_18F879174(a1, a2);
  sub_18F87A1AC(a1, a2);
  v50 = v9;
  v51 = v10;
  v49 = v12;
  v52 = v14;
  v53 = v13;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v17, v13);
  v20 = objc_msgSend((id)objc_opt_self(), sel_currentEnvironment);
  v21 = objc_msgSend(v20, sel_keychainFacade);

  v23 = v54;
  v22 = (unint64_t)v55;
  v24 = (void *)sub_18F87F7B8();
  v25 = objc_msgSend(v21, sel_existingSymmetricKeyWithLabel_, v24);

  swift_unknownObjectRelease();
  v26 = (uint64_t)v25 + OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value;
  swift_beginAccess();
  sub_18F87BFF0(v26, (uint64_t)v57);
  v27 = v19;
  v28 = v22;
  if (v57[3])
  {
    v29 = v50;
    v30 = swift_dynamicCast();
    v31 = (void (**)(char *, char *, uint64_t))v51;
    (*((void (**)(char *, _QWORD, uint64_t, uint64_t))v51 + 7))(v8, v30 ^ 1u, 1, v29);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v31[6])(v8, 1, v29) != 1)
    {
      v55 = v25;
      v32 = v49;
      v31[4](v49, v8, v29);
      v46 = sub_18F87F758();

      ((void (*)(char *, uint64_t))v31[1])(v32, v29);
      (*(void (**)(char *, uint64_t))(v52 + 8))(v27, v53);
      return v46;
    }
  }
  else
  {
    sub_18F878CB4((uint64_t)v57, &qword_1EE176BC8);
    (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v51 + 7))(v8, 1, 1, v50);
  }
  sub_18F878CB4((uint64_t)v8, &qword_1EE176B80);
  if (qword_1EE1783D0 != -1)
    swift_once();
  v33 = sub_18F87F704();
  __swift_project_value_buffer(v33, (uint64_t)qword_1EE178420);
  swift_bridgeObjectRetain_n();
  v34 = (char *)v25;
  v35 = sub_18F87F6EC();
  v36 = sub_18F87F7F4();
  v37 = os_log_type_enabled(v35, v36);
  v38 = v53;
  if (v37)
  {
    v51 = v27;
    v39 = swift_slowAlloc();
    v40 = (_QWORD *)swift_slowAlloc();
    v41 = swift_slowAlloc();
    v57[0] = v41;
    *(_DWORD *)v39 = 136315394;
    swift_bridgeObjectRetain();
    v56 = sub_18F87A470(v23, v28, v57);
    sub_18F87F818();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v39 + 12) = 2112;
    v42 = *(void **)&v34[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error];
    if (v42)
    {
      v43 = v42;
      v42 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v56 = (uint64_t)v42;
    }
    else
    {
      v56 = 0;
    }
    sub_18F87F818();
    *v40 = v42;

    _os_log_impl(&dword_18F80C000, v35, v36, "Error retrieving encryption key with label %s from keychain: %@", (uint8_t *)v39, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE178400);
    swift_arrayDestroy();
    MEMORY[0x1940047DC](v40, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1940047DC](v41, -1, -1);
    MEMORY[0x1940047DC](v39, -1, -1);

    v45 = v51;
    v44 = *(void (**)(char *, uint64_t))(v52 + 8);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    v44 = *(void (**)(char *, uint64_t))(v52 + 8);
    v45 = v27;
  }
  v44(v45, v38);
  return 0;
}

uint64_t type metadata accessor for CNDataEncryptor()
{
  return objc_opt_self();
}

uint64_t method lookup function for CNDataEncryptor()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_18F87BFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18F87C038(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_18F87C078()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE178440;
  if (!qword_1EE178440)
  {
    v1 = sub_18F87F710();
    result = MEMORY[0x194004770](MEMORY[0x1E0CA91F0], v1);
    atomic_store(result, (unint64_t *)&qword_1EE178440);
  }
  return result;
}

unint64_t sub_18F87C0C0()
{
  unint64_t result;

  result = qword_1EE176B50;
  if (!qword_1EE176B50)
  {
    result = MEMORY[0x194004770](MEMORY[0x1E0CB0310], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EE176B50);
  }
  return result;
}

void sIsDirectoryByStat_block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18F80C000, v3, v4, "Error checking whether %{public}@ is a directory; unexpected behavior may follow: %{public}@",
    v5,
    v6,
    v7,
    v8,
    v9);

  OUTLINED_FUNCTION_2();
}

uint64_t __getRBSDomainAttributeClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getRBSAcquisitionCompletionAttributeClass_block_invoke_cold_1(v0);
}

uint64_t __getRBSAcquisitionCompletionAttributeClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getRBSAssertionClass_block_invoke_cold_1();
}

uint64_t __getRBSAssertionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getRBSTargetClass_block_invoke_cold_1(v0);
}

void __getRBSTargetClass_block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = abort_report_np();
  __62__CNLaunchServices_applicationsAvailableForHandlingURLScheme___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

uint64_t sub_18F87F608()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_18F87F614()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_18F87F620()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_18F87F62C()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_18F87F638()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_18F87F644()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_18F87F650()
{
  return MEMORY[0x1E0CAE720]();
}

uint64_t sub_18F87F65C()
{
  return MEMORY[0x1E0CAE728]();
}

uint64_t sub_18F87F668()
{
  return MEMORY[0x1E0CAE730]();
}

uint64_t sub_18F87F674()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_18F87F680()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_18F87F68C()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_18F87F698()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_18F87F6A4()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_18F87F6B0()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t sub_18F87F6BC()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_18F87F6C8()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_18F87F6D4()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_18F87F6E0()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_18F87F6EC()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_18F87F6F8()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_18F87F704()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_18F87F710()
{
  return MEMORY[0x1E0CA91E8]();
}

uint64_t sub_18F87F71C()
{
  return MEMORY[0x1E0CA93B0]();
}

uint64_t sub_18F87F728()
{
  return MEMORY[0x1E0CA93B8]();
}

uint64_t sub_18F87F734()
{
  return MEMORY[0x1E0CA93C8]();
}

uint64_t sub_18F87F740()
{
  return MEMORY[0x1E0CA9448]();
}

uint64_t sub_18F87F74C()
{
  return MEMORY[0x1E0CA9458]();
}

uint64_t sub_18F87F758()
{
  return MEMORY[0x1E0CA94B8]();
}

uint64_t sub_18F87F764()
{
  return MEMORY[0x1E0CA94D0]();
}

uint64_t sub_18F87F770()
{
  return MEMORY[0x1E0CA94F0]();
}

uint64_t sub_18F87F77C()
{
  return MEMORY[0x1E0CA94F8]();
}

uint64_t sub_18F87F788()
{
  return MEMORY[0x1E0CA9528]();
}

uint64_t sub_18F87F794()
{
  return MEMORY[0x1E0CA9530]();
}

uint64_t sub_18F87F7A0()
{
  return MEMORY[0x1E0CA9538]();
}

uint64_t sub_18F87F7AC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_18F87F7B8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_18F87F7C4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_18F87F7D0()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_18F87F7DC()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_18F87F7E8()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_18F87F7F4()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_18F87F800()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_18F87F80C()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_18F87F818()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_18F87F824()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_18F87F830()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_18F87F83C()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_18F87F848()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_18F87F854()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_18F87F860()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_18F87F86C()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_18F87F878()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_18F87F884()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_18F87F890()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_18F87F89C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_18F87F8A8()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_18F87F8B4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_18F87F8C0()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_18F87F8CC()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_18F87F8D8()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_18F87F8E4()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_18F87F8F0()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_18F87F8FC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_18F87F908()
{
  return MEMORY[0x1E0DEDF40]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987A0](allocator, localeIdentifier);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0CFA188]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0CFA190]();
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

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C00](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

CFRunLoopTimerRef CFRunLoopTimerCreateWithHandler(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, void *block)
{
  return (CFRunLoopTimerRef)MEMORY[0x1E0C98D10](allocator, flags, order, block, fireDate, interval);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x1E0CFA360]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLogv(NSString *format, va_list args)
{
  MEMORY[0x1E0CB2D90](format, args);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return MEMORY[0x1E0CFA9C0]();
}

uint64_t PNCopyBestGuessNormalizedNumberForCountry()
{
  return MEMORY[0x1E0CFA9C8]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1E0CD6218](*(_QWORD *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD6600](task, entitlements, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x1E0DB0F90]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x1E0DB0FB0]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x1E0DB0FC8]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1E0DB0FF0]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x1E0DB1018]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1E0DB1048]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x1E0DB1070]();
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

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1E0C9A260]();
}

uint64_t _CFStringTokenizerCreateNamePartsArrayWithString()
{
  return MEMORY[0x1E0C9A540]();
}

uint64_t _PNCopyLastFourDigitsOfLocalNumber()
{
  return MEMORY[0x1E0CFAA20]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1E0DDFE88]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1E0DDFE98]();
}

uint64_t ct_green_tea_logging_enabled()
{
  return MEMORY[0x1E0DDFEA0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
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

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82CF8]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
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

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x1E0C82E68](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
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

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1E0C83570](*(_QWORD *)&a1, a2);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1E0DDFEA8]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1E0C84F38](a1, a2);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1E0C850F0](path, name, *(_QWORD *)&options);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1E0DB1208]();
}

uint64_t tcc_authorization_record_get_subject_attributed_entity()
{
  return MEMORY[0x1E0DB1228]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x1E0DB1230]();
}

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return MEMORY[0x1E0DB1240]();
}

uint64_t tcc_credential_create_for_process_with_audit_token_and_assumed_identity()
{
  return MEMORY[0x1E0DB1250]();
}

uint64_t tcc_credential_create_for_self_with_assumed_identity()
{
  return MEMORY[0x1E0DB1258]();
}

uint64_t tcc_credential_singleton_for_self()
{
  return MEMORY[0x1E0DB1268]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1E0DB1290]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1E0DB12A0]();
}

uint64_t tcc_identity_get_type()
{
  return MEMORY[0x1E0DB12A8]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1E0DB12C8]();
}

uint64_t tcc_message_options_set_nokill_policy()
{
  return MEMORY[0x1E0DB12E0]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1E0DB12F0]();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return MEMORY[0x1E0DB1300]();
}

uint64_t tcc_message_options_set_request_prompt_rights_mask()
{
  return MEMORY[0x1E0DB1308]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1E0DB1320]();
}

uint64_t tcc_server_message_get_authorization_records_by_service()
{
  return MEMORY[0x1E0DB1330]();
}

uint64_t tcc_server_message_get_identity_for_credential()
{
  return MEMORY[0x1E0DB1338]();
}

uint64_t tcc_server_message_request_authorization()
{
  return MEMORY[0x1E0DB1348]();
}

uint64_t tcc_server_message_set_authorization_value()
{
  return MEMORY[0x1E0DB1360]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x1E0DB1390]();
}

void u_getVersion(UVersionInfo versionArray)
{
  MEMORY[0x1E0DE59D8](versionArray);
}

char *__cdecl u_strToUTF8(char *dest, int32_t destCapacity, int32_t *pDestLength, const UChar *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (char *)MEMORY[0x1E0DE5AC0](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

uint64_t ucol_close()
{
  return MEMORY[0x1E0DE5F70]();
}

uint64_t ucol_getSortKey()
{
  return MEMORY[0x1E0DE5FD0]();
}

uint64_t ucol_getUCAVersion()
{
  return MEMORY[0x1E0DE5FE0]();
}

uint64_t ucol_getVersion()
{
  return MEMORY[0x1E0DE5FE8]();
}

uint64_t ucol_open()
{
  return MEMORY[0x1E0DE6008]();
}

uint64_t ucol_setAttribute()
{
  return MEMORY[0x1E0DE6030]();
}

uint64_t ucol_setStrength()
{
  return MEMORY[0x1E0DE6038]();
}

uint64_t udatpg_close()
{
  return MEMORY[0x1E0DE61B0]();
}

uint64_t udatpg_getAppendItemName()
{
  return MEMORY[0x1E0DE61B8]();
}

uint64_t udatpg_open()
{
  return MEMORY[0x1E0DE61E8]();
}

uint64_t uset_containsAllCodePoints()
{
  return MEMORY[0x1E0DE69A0]();
}

uint64_t uset_freeze()
{
  return MEMORY[0x1E0DE69A8]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1E0DE69E0]();
}

uint64_t uset_span()
{
  return MEMORY[0x1E0DE6A18]();
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1E0C85F80]();
}

