void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

id sRecentContactLogDescription_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
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

  v2 = (void *)MEMORY[0x1E0C99DE8];
  v3 = a2;
  objc_msgSend(v2, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "lastSendingAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "mostRecentDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v13);

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void sub_1B9953D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 128), 8);
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

void sub_1B9954138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B9954524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B9954C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

Class init_PSSuggester()
{
  Class result;

  if (LoadPeopleSuggester_loadPredicate != -1)
    dispatch_once(&LoadPeopleSuggester_loadPredicate, &__block_literal_global_0);
  result = objc_getClass("_PSSuggester");
  class_PSSuggester = (uint64_t)result;
  get_PSSuggesterClass = (uint64_t (*)())_PSSuggesterFunction;
  return result;
}

id _PSSuggesterFunction()
{
  return (id)class_PSSuggester;
}

uint64_t _CNAInternalBuild()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isInternalBuild");

  return v1;
}

uint64_t CNAutocompleteIsDebugLoggingEnabled()
{
  int v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v0 = _CNAInternalBuild();
  objc_msgSend(MEMORY[0x1E0D13BE8], "standardPreferences");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v0)
    v3 = objc_msgSend(v1, "userHasOptedOutOfPreference:", CFSTR("CNAutocompleteLogEnabled")) ^ 1;
  else
    v3 = objc_msgSend(v1, "userHasOptedInToPreference:", CFSTR("CNAutocompleteLogEnabled"));

  return v3;
}

uint64_t CNAutocompleteIsSortingLoggingEnabled()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D13BE8], "standardPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userHasOptedInToPreference:", CFSTR("CNAutocompleteSortingLogEnabled"));

  return v1;
}

uint64_t CNAutocompleteIsProbesLoggingEnabled()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D13BE8], "standardPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("CNAutocompleteProbesLogEnabled"));

  return v1;
}

id CNALoggingContextPerformance()
{
  if (CNALoggingContextPerformance_cn_once_token_0 != -1)
    dispatch_once(&CNALoggingContextPerformance_cn_once_token_0, &__block_literal_global_1);
  return (id)CNALoggingContextPerformance_cn_once_object_0;
}

id CNALoggingContextSorting()
{
  if (CNALoggingContextSorting_cn_once_token_1 != -1)
    dispatch_once(&CNALoggingContextSorting_cn_once_token_1, &__block_literal_global_9);
  return (id)CNALoggingContextSorting_cn_once_object_1;
}

id CNALoggingContextDebug()
{
  if (CNALoggingContextDebug_cn_once_token_2 != -1)
    dispatch_once(&CNALoggingContextDebug_cn_once_token_2, &__block_literal_global_11);
  return (id)CNALoggingContextDebug_cn_once_object_2;
}

id CNALoggingContextProbes()
{
  if (CNALoggingContextProbes_cn_once_token_3 != -1)
    dispatch_once(&CNALoggingContextProbes_cn_once_token_3, &__block_literal_global_13);
  return (id)CNALoggingContextProbes_cn_once_object_3;
}

id CNALoggingContextTriage()
{
  if (CNALoggingContextTriage_cn_once_token_4 != -1)
    dispatch_once(&CNALoggingContextTriage_cn_once_token_4, &__block_literal_global_15);
  return (id)CNALoggingContextTriage_cn_once_object_4;
}

void sub_1B9955EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initSGSuggestionsService()
{
  Class result;

  if (LoadCoreSuggestions_loadPredicate != -1)
    dispatch_once(&LoadCoreSuggestions_loadPredicate, &__block_literal_global_97);
  result = objc_getClass("SGSuggestionsService");
  classSGSuggestionsService = (uint64_t)result;
  getSGSuggestionsServiceClass = (uint64_t (*)())SGSuggestionsServiceFunction;
  return result;
}

id SGSuggestionsServiceFunction()
{
  return (id)classSGSuggestionsService;
}

const __CFString *sBackspaceRepresentation_block_invoke()
{
  return CFSTR("^H");
}

Class initEKDirectorySearchOperation()
{
  Class result;

  if (LoadEventKit_loadPredicate != -1)
    dispatch_once(&LoadEventKit_loadPredicate, &__block_literal_global_4);
  result = objc_getClass("EKDirectorySearchOperation");
  classEKDirectorySearchOperation = (uint64_t)result;
  getEKDirectorySearchOperationClass = (uint64_t (*)())EKDirectorySearchOperationFunction;
  return result;
}

id EKDirectorySearchOperationFunction()
{
  return (id)classEKDirectorySearchOperation;
}

void sub_1B99583FC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 48));
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_1B99584E0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B995AAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sNameComponentsFromContact_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if (objc_msgSend(v2, "contactType") == 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "givenName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "familyName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nickname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nameSuffix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAutocompleteNameComponents nameComponentsWithFirstName:lastName:nickname:nameSuffix:](CNAutocompleteNameComponents, "nameComponentsWithFirstName:lastName:nickname:nameSuffix:", v4, v5, v6, v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

void sub_1B995E89C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sIsContact_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t sContainsAlphanumericCharacters_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CB3500];
  v3 = a2;
  objc_msgSend(v2, "alphanumericCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_cn_containsCharacterInSet:", v4);

  return v5;
}

Class init_PSSuggester_0()
{
  Class result;

  if (LoadPeopleSuggester_loadPredicate_0 != -1)
    dispatch_once(&LoadPeopleSuggester_loadPredicate_0, &__block_literal_global_30);
  result = objc_getClass("_PSSuggester");
  class_PSSuggester_0 = (uint64_t)result;
  get_PSSuggesterClass_0 = (uint64_t (*)())_PSSuggesterFunction_0;
  return result;
}

id _PSSuggesterFunction_0()
{
  return (id)class_PSSuggester_0;
}

Class init_PSCNAutocompleteFeedback()
{
  Class result;

  if (LoadPeopleSuggester_loadPredicate_0 != -1)
    dispatch_once(&LoadPeopleSuggester_loadPredicate_0, &__block_literal_global_30);
  result = objc_getClass("_PSCNAutocompleteFeedback");
  class_PSCNAutocompleteFeedback = (uint64_t)result;
  get_PSCNAutocompleteFeedbackClass = (uint64_t (*)())_PSCNAutocompleteFeedbackFunction;
  return result;
}

id _PSCNAutocompleteFeedbackFunction()
{
  return (id)class_PSCNAutocompleteFeedback;
}

Class initEKEventStore()
{
  Class result;

  if (LoadEventKit_loadPredicate_0 != -1)
    dispatch_once(&LoadEventKit_loadPredicate_0, &__block_literal_global_15);
  result = objc_getClass("EKEventStore");
  classEKEventStore = (uint64_t)result;
  getEKEventStoreClass = (uint64_t (*)())EKEventStoreFunction;
  return result;
}

id EKEventStoreFunction()
{
  return (id)classEKEventStore;
}

BOOL _block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteTokenMatcher tokensForNameString:](CNAutocompleteTokenMatcher, "tokensForNameString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  objc_msgSend(v6, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_cn_addNonNilObject:", v10);
  +[CNAutocompleteTokenMatcher tokensForNameString:](CNAutocompleteTokenMatcher, "tokensForNameString:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = +[CNAutocompleteTokenMatcher doSearchTokens:matchNameTokens:](CNAutocompleteTokenMatcher, "doSearchTokens:matchNameTokens:", v11, v7);
  return v12;
}

uint64_t _block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "kind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D18210]) ^ 1;

  return v3;
}

void sub_1B99666BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id sForkJoinCleanup_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "_cn_filter:", *MEMORY[0x1E0D13830]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_flatten");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1B9967328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_1B9967BC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9967F64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B996808C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9968634(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B99687A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B99688C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B99689E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B99696E4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_1B996A4D0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1B996AAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B996AFD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CNAutocompleteDelegateMultipleCallbacks(void *a1)
{
  id v1;
  NSObject *v2;

  v1 = a1;
  CNALoggingContextTriage();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    CNAutocompleteDelegateMultipleCallbacks_cold_1(v1, v2);

}

id contactSearchLog()
{
  if (contactSearchLog_cn_once_token_0 != -1)
    dispatch_once(&contactSearchLog_cn_once_token_0, &__block_literal_global_114);
  return (id)contactSearchLog_cn_once_object_0;
}

void sub_1B996C464(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B996C4CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B996C664(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B996C6C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __contactSearchLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete", "contactsearch");
  v1 = (void *)contactSearchLog_cn_once_object_0;
  contactSearchLog_cn_once_object_0 = (uint64_t)v0;

}

Class init_PSSuggestion()
{
  Class result;

  if (LoadPeopleSuggester_loadPredicate_1 != -1)
    dispatch_once(&LoadPeopleSuggester_loadPredicate_1, &__block_literal_global_88);
  result = objc_getClass("_PSSuggestion");
  class_PSSuggestion = (uint64_t)result;
  get_PSSuggestionClass = (uint64_t (*)())_PSSuggestionFunction;
  return result;
}

id _PSSuggestionFunction()
{
  return (id)class_PSSuggestion;
}

Class init_PSRecipient()
{
  Class result;

  if (LoadPeopleSuggester_loadPredicate_1 != -1)
    dispatch_once(&LoadPeopleSuggester_loadPredicate_1, &__block_literal_global_88);
  result = objc_getClass("_PSRecipient");
  class_PSRecipient = (uint64_t)result;
  get_PSRecipientClass = (uint64_t (*)())_PSRecipientFunction;
  return result;
}

id _PSRecipientFunction()
{
  return (id)class_PSRecipient;
}

uint64_t CNAutocompleteProbeBuildKey(void *a1, const char *a2)
{
  return objc_msgSend(a1, "componentsJoinedByString:", CFSTR("."));
}

id CNAutocompleteProbeBatchKey(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("batch"), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *CNAutocompleteProbeBoolKey(int a1)
{
  if (a1)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

const __CFString *CNAutocompleteProbeSourceTypeKey(uint64_t a1)
{
  char v1;
  _BOOL4 v2;
  const __CFString *v3;

  v1 = a1;
  v2 = +[CNAutocompleteResult isSourceTypeConsideredSuggestion:](CNAutocompleteResult, "isSourceTypeConsideredSuggestion:", a1);
  v3 = CFSTR("Duet Promoted");
  if ((v1 & 0x10) == 0)
    v3 = CFSTR("Other");
  if (v2)
    return CFSTR("Pure Suggestions");
  else
    return v3;
}

id CNAutocompleteProbeDuetModelID()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D15908], "loggingTagForAutocompleteFeedback");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Duet"), "stringByAppendingString:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1B996F418(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

Class init_PSAutocompleteSuggestion()
{
  Class result;

  if (LoadPeopleSuggester_loadPredicate_2 != -1)
    dispatch_once(&LoadPeopleSuggester_loadPredicate_2, &__block_literal_global_95);
  result = objc_getClass("_PSAutocompleteSuggestion");
  class_PSAutocompleteSuggestion = (uint64_t)result;
  get_PSAutocompleteSuggestionClass = (uint64_t (*)())_PSAutocompleteSuggestionFunction;
  return result;
}

id _PSAutocompleteSuggestionFunction()
{
  return (id)class_PSAutocompleteSuggestion;
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

Class init_PSSuggester_1()
{
  Class result;

  if (LoadPeopleSuggester_loadPredicate_2 != -1)
    dispatch_once(&LoadPeopleSuggester_loadPredicate_2, &__block_literal_global_95);
  result = objc_getClass("_PSSuggester");
  class_PSSuggester_1 = (uint64_t)result;
  get_PSSuggesterClass_1 = (uint64_t (*)())_PSSuggesterFunction_1;
  return result;
}

id _PSSuggesterFunction_1()
{
  return (id)class_PSSuggester_1;
}

Class init_PSPredictionContext()
{
  Class result;

  if (LoadPeopleSuggester_loadPredicate_2 != -1)
    dispatch_once(&LoadPeopleSuggester_loadPredicate_2, &__block_literal_global_95);
  result = objc_getClass("_PSPredictionContext");
  class_PSPredictionContext = (uint64_t)result;
  get_PSPredictionContextClass = (uint64_t (*)())_PSPredictionContextFunction;
  return result;
}

id _PSPredictionContextFunction()
{
  return (id)class_PSPredictionContext;
}

id sNormalizeSearchToken_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_cn_containsCharacterInSet:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", &stru_1E70E0E70);
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v6;
  }

  return v2;
}

Class init_PSPredictionContext_0()
{
  Class result;

  if (LoadPeopleSuggester_loadPredicate_3 != -1)
    dispatch_once(&LoadPeopleSuggester_loadPredicate_3, &__block_literal_global_124);
  result = objc_getClass("_PSPredictionContext");
  class_PSPredictionContext_0 = (uint64_t)result;
  get_PSPredictionContextClass_0 = (uint64_t (*)())_PSPredictionContextFunction_0;
  return result;
}

id _PSPredictionContextFunction_0()
{
  return (id)class_PSPredictionContext_0;
}

uint64_t sSortByPassingTest_block_invoke(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  uint64_t (*v7)(_QWORD *, uint64_t);
  _QWORD *v8;
  id v9;
  int v10;
  unsigned int v11;

  v7 = (uint64_t (*)(_QWORD *, uint64_t))a4[2];
  v8 = a4;
  v9 = a3;
  v10 = v7(v8, a2);
  v11 = ((uint64_t (*)(id, id))a4[2])(v8, v9);

  if (v10 ^ 1 | v11)
    return (v10 ^ 1) & v11;
  else
    return -1;
}

uint64_t sResultHasPreferredDomain_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPreferredDomain");
}

uint64_t sSortResultsByPreferredDomain_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  CNALoggingContextSorting();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sSortResultsByPreferredDomain_block_invoke_3_cold_1();

  v8 = sSortByPassingTest_block_invoke(v7, (uint64_t)v4, v5, __block_literal_global_2);
  return v8;
}

uint64_t sSortResultsByCategory_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  id v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend((id)objc_opt_class(), "category");
  v7 = objc_msgSend((id)objc_opt_class(), "category");
  CNALoggingContextSorting();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138478595;
    v12 = v4;
    v13 = 2048;
    v14 = v6;
    v15 = 2113;
    v16 = v5;
    v17 = 2048;
    v18 = v7;
    _os_log_debug_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEBUG, "Comparing type of %{private}@ (%lu) with %{private}@ (%lu)", (uint8_t *)&v11, 0x2Au);
  }

  if (v6 < v7)
    v9 = -1;
  else
    v9 = v6 > v7;

  return v9;
}

uint64_t sSortResultsByDisplayName_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  CNALoggingContextSorting();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sSortResultsByDisplayName_block_invoke_5_cold_1();

  objc_msgSend(v4, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "localizedCaseInsensitiveCompare:", v8);

  return v9;
}

uint64_t sSortResultsByAddress_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForSorting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForSorting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CNALoggingContextSorting();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138478595;
    v14 = v4;
    v15 = 2113;
    v16 = v7;
    v17 = 2113;
    v18 = v5;
    v19 = 2113;
    v20 = v9;
    _os_log_debug_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEBUG, "Comparing address of %{private}@ (%{private}@) with %{private}@ (%{private}@)", (uint8_t *)&v13, 0x2Au);
  }

  v11 = objc_msgSend(v7, "localizedCaseInsensitiveCompare:", v9);
  return v11;
}

uint64_t sRecentResultMatchesLastSendingAccount_block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesSendingAddress");
}

uint64_t sSortRecentResultsBySendingAddressMatch_block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  CNALoggingContextSorting();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sSortRecentResultsBySendingAddressMatch_block_invoke_8_cold_1();

  v8 = sSortByPassingTest_block_invoke(v7, (uint64_t)v4, v5, __block_literal_global_9_1);
  return v8;
}

uint64_t sRecentResultCompletesChosenGroup_block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "completesChosenGroup");
}

uint64_t sSortRecentResultsByCompletingChosenGroup_block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  CNALoggingContextSorting();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sSortRecentResultsByCompletingChosenGroup_block_invoke_10_cold_1();

  v8 = sSortByPassingTest_block_invoke(v7, (uint64_t)v4, v5, __block_literal_global_12_0);
  return v8;
}

uint64_t sSortRecentResultsByDate_block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  CNALoggingContextSorting();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sSortRecentResultsByDate_block_invoke_11_cold_1();

  if (v8 == 1)
    v10 = -1;
  else
    v10 = 0;
  if (v8 == -1)
    v11 = 1;
  else
    v11 = v10;

  return v11;
}

uint64_t sSortRecentResultsByDateCount_block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  id v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "dateCount");
  v7 = objc_msgSend(v5, "dateCount");
  CNALoggingContextSorting();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138478595;
    v12 = v4;
    v13 = 2048;
    v14 = v6;
    v15 = 2113;
    v16 = v5;
    v17 = 2048;
    v18 = v7;
    _os_log_debug_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEBUG, "Comparing date count of %{private}@ (%lu) with %{private}@ (%lu)", (uint8_t *)&v11, 0x2Au);
  }

  if (v6 > v7)
    v9 = -1;
  else
    v9 = v6 < v7;

  return v9;
}

void sub_1B9979410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  id *v32;
  uint64_t v33;

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v33 - 176), 8);
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

void sub_1B9979974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initEKDirectorySearchOperation_0()
{
  Class result;

  if (LoadEventKit_loadPredicate_1 != -1)
    dispatch_once(&LoadEventKit_loadPredicate_1, &__block_literal_global_102);
  result = objc_getClass("EKDirectorySearchOperation");
  classEKDirectorySearchOperation_0 = (uint64_t)result;
  getEKDirectorySearchOperationClass_0 = (uint64_t (*)())EKDirectorySearchOperationFunction_0;
  return result;
}

id EKDirectorySearchOperationFunction_0()
{
  return (id)classEKDirectorySearchOperation_0;
}

Class initEKEphemeralCacheEventStoreProvider()
{
  Class result;

  if (LoadEventKit_loadPredicate_1 != -1)
    dispatch_once(&LoadEventKit_loadPredicate_1, &__block_literal_global_102);
  result = objc_getClass("EKEphemeralCacheEventStoreProvider");
  classEKEphemeralCacheEventStoreProvider = (uint64_t)result;
  getEKEphemeralCacheEventStoreProviderClass = (uint64_t (*)())EKEphemeralCacheEventStoreProviderFunction;
  return result;
}

id EKEphemeralCacheEventStoreProviderFunction()
{
  return (id)classEKEphemeralCacheEventStoreProvider;
}

Class initEKEventStore_0()
{
  Class result;

  if (LoadEventKit_loadPredicate_1 != -1)
    dispatch_once(&LoadEventKit_loadPredicate_1, &__block_literal_global_102);
  result = objc_getClass("EKEventStore");
  classEKEventStore_0 = (uint64_t)result;
  getEKEventStoreClass_0 = (uint64_t (*)())EKEventStoreFunction_0;
  return result;
}

id EKEventStoreFunction_0()
{
  return (id)classEKEventStore_0;
}

Class initEKDirectorySearchQuery()
{
  Class result;

  if (LoadEventKit_loadPredicate_1 != -1)
    dispatch_once(&LoadEventKit_loadPredicate_1, &__block_literal_global_102);
  result = objc_getClass("EKDirectorySearchQuery");
  classEKDirectorySearchQuery = (uint64_t)result;
  getEKDirectorySearchQueryClass = (uint64_t (*)())EKDirectorySearchQueryFunction;
  return result;
}

id EKDirectorySearchQueryFunction()
{
  return (id)classEKDirectorySearchQuery;
}

void sub_1B997A5A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CNAutocompleteResultStringForHashingTransform_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringForHashing");
}

id sNormalizeCaseDiactriticsAndCharacterWidth_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  +[CNAutocompleteResult localeForHashing](CNAutocompleteResult, "localeForHashing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByFoldingWithOptions:locale:", 385, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id sNormalizePhoneNumberFormatting_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  const void *v5;
  const void *String;
  id v7;
  uint64_t v8;

  v2 = a2;
  +[CNAutocompleteResult localeForHashing](CNAutocompleteResult, "localeForHashing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997B0]);

  v4 = CFPhoneNumberCreate();
  if (v4)
  {
    v5 = (const void *)v4;
    String = (const void *)CFPhoneNumberCreateString();
    v7 = v2;
    if (String)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", String);
      v8 = objc_claimAutoreleasedReturnValue();

      CFRelease(String);
      v7 = (id)v8;
    }
    CFRelease(v5);
  }
  else
  {
    v7 = v2;
  }

  return v7;
}

id CNAutocompleteResultAddressStringForHashingEmailTransform_block_invoke_4(uint64_t a1, void *a2)
{
  return (*((id (**)(uint64_t, void *))sNormalizeCaseDiactriticsAndCharacterWidth + 2))((uint64_t)sNormalizeCaseDiactriticsAndCharacterWidth, a2);
}

id CNAutocompleteResultAddressStringForHashingPhoneNumberTransform_block_invoke_5(uint64_t a1, void *a2)
{
  return (*((id (**)(uint64_t, void *))sNormalizePhoneNumberFormatting + 2))((uint64_t)sNormalizePhoneNumberFormatting, a2);
}

id CNAutocompleteResultAddressStringForHashingTransform_block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  (*((void (**)(uint64_t, void *))sNormalizeCaseDiactriticsAndCharacterWidth + 2))((uint64_t)sNormalizeCaseDiactriticsAndCharacterWidth, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(uint64_t, void *))sNormalizePhoneNumberFormatting + 2))((uint64_t)sNormalizePhoneNumberFormatting, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id CNAutocompleteResultUserInfoDescriptionTransform_block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v2 = a2;
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = CNAutocompleteResultUserInfoDescriptionTransform_block_invoke_8;
  v9[3] = &unk_1E70DFDF0;
  v10 = v2;
  v5 = v2;
  objc_msgSend(v4, "_cn_map:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id CNAutocompleteResultUserInfoDescriptionTransform_block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t sub_1B997EF08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  _QWORD *v24;
  size_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  _QWORD *v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  unint64_t v45;
  size_t v46;
  uint64_t result;
  _QWORD v48[2];
  uint64_t v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;

  v2 = type metadata accessor for ComposeRecipient.Identifier(0);
  v49 = *(_QWORD *)(v2 - 8);
  v3 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v5 = (char *)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v48 - v6;
  v8 = type metadata accessor for ComposeRecipient(0);
  v9 = MEMORY[0x1E0C80A78](v8);
  v55 = (uint64_t)v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)v48 - v13;
  v15 = *(_QWORD *)(a1 + 16);
  if (!v15)
  {
    v18 = MEMORY[0x1E0DEE9D8];
LABEL_29:
    swift_bridgeObjectRelease();
    return v18;
  }
  v53 = v11;
  v48[0] = v2;
  v48[1] = a1;
  v51 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = a1 + v51;
  v17 = *(_QWORD *)(v12 + 72);
  swift_bridgeObjectRetain();
  v18 = MEMORY[0x1E0DEE9D8];
  v19 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v50 = v7;
  v52 = v17;
  while (1)
  {
    sub_1B997F378(v16, (uint64_t)v14, type metadata accessor for ComposeRecipient);
    v20 = v53;
    sub_1B997F378((uint64_t)&v14[*(int *)(v53 + 28)], (uint64_t)v7, type metadata accessor for ComposeRecipient.Identifier);
    if (!v19[2])
      break;
    v21 = sub_1B997F4C8((uint64_t)v7);
    if ((v22 & 1) == 0)
      break;
    v23 = *(_QWORD *)(v19[7] + 8 * v21);
    v24 = (_QWORD *)v18;
    v18 = *(_QWORD *)&v14[*(int *)(v20 + 24)];
    swift_bridgeObjectRetain();
    v25 = (size_t)v24;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      v26 = v52;
      if ((v23 & 0x8000000000000000) != 0)
        goto LABEL_26;
    }
    else
    {
      v25 = sub_1B997FECC(v24);
      v26 = v52;
      if ((v23 & 0x8000000000000000) != 0)
      {
LABEL_26:
        __break(1u);
LABEL_27:
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
    }
    if (v23 >= *(_QWORD *)(v25 + 16))
      goto LABEL_32;
    sub_1B997F3BC(v18);
    v18 = v25;
LABEL_4:
    sub_1B997FE90((uint64_t)v7, type metadata accessor for ComposeRecipient.Identifier);
    sub_1B997FE90((uint64_t)v14, type metadata accessor for ComposeRecipient);
    v16 += v26;
    if (!--v15)
      goto LABEL_27;
  }
  v54 = v15;
  v27 = (_QWORD *)v18;
  v28 = *(_QWORD *)(v18 + 16);
  sub_1B997F378((uint64_t)v7, (uint64_t)v5, type metadata accessor for ComposeRecipient.Identifier);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v56 = v19;
  v30 = (uint64_t)v5;
  v32 = sub_1B997F4C8((uint64_t)v5);
  v33 = v19[2];
  v34 = (v31 & 1) == 0;
  v35 = v33 + v34;
  if (!__OFADD__(v33, v34))
  {
    v36 = v31;
    if (v19[3] >= v35)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_1B997FC60();
      v39 = v27;
      v19 = v56;
      if ((v36 & 1) == 0)
      {
LABEL_15:
        v19[(v32 >> 6) + 8] |= 1 << v32;
        v5 = (char *)v30;
        sub_1B997F378(v30, v19[6] + *(_QWORD *)(v49 + 72) * v32, type metadata accessor for ComposeRecipient.Identifier);
        *(_QWORD *)(v19[7] + 8 * v32) = v28;
        v40 = v19[2];
        v41 = __OFADD__(v40, 1);
        v42 = v40 + 1;
        if (v41)
          goto LABEL_31;
        v19[2] = v42;
        goto LABEL_21;
      }
    }
    else
    {
      sub_1B997F7B8(v35, isUniquelyReferenced_nonNull_native);
      v37 = sub_1B997F4C8(v30);
      if ((v36 & 1) != (v38 & 1))
        goto LABEL_33;
      v32 = v37;
      v39 = v27;
      v19 = v56;
      if ((v36 & 1) == 0)
        goto LABEL_15;
    }
    *(_QWORD *)(v19[7] + 8 * v32) = v28;
    v5 = (char *)v30;
LABEL_21:
    swift_bridgeObjectRelease();
    sub_1B997FE90((uint64_t)v5, type metadata accessor for ComposeRecipient.Identifier);
    sub_1B997F378((uint64_t)v14, v55, type metadata accessor for ComposeRecipient);
    v43 = swift_isUniquelyReferenced_nonNull_native();
    v7 = v50;
    v26 = v52;
    if ((v43 & 1) == 0)
      v39 = (_QWORD *)sub_1B997F52C(0, v39[2] + 1, 1, v39);
    v15 = v54;
    v45 = v39[2];
    v44 = v39[3];
    v46 = (size_t)v39;
    if (v45 >= v44 >> 1)
      v46 = sub_1B997F52C(v44 > 1, v45 + 1, 1, v39);
    *(_QWORD *)(v46 + 16) = v45 + 1;
    v18 = v46;
    sub_1B997FF44(v55, v46 + v51 + v45 * v26, type metadata accessor for ComposeRecipient);
    goto LABEL_4;
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  result = sub_1B999730C();
  __break(1u);
  return result;
}

uint64_t sub_1B997F378(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B997F3BC(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = (uint64_t)sub_1B997F6A0((char *)result, v10, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v7 = *(_QWORD *)(v3 + 16);
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    *(_QWORD *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1B997F4A8()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1B997F4B8()
{
  return swift_allocObject();
}

unint64_t sub_1B997F4C8(uint64_t a1)
{
  uint64_t v2;

  type metadata accessor for ComposeRecipient.Identifier(0);
  sub_1B997FF88(&qword_1EF236558, (uint64_t)&unk_1B999BA10);
  v2 = sub_1B99970A8();
  return sub_1B997FB2C(a1, v2);
}

size_t sub_1B997F52C(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF2369F0);
  v10 = *(_QWORD *)(type metadata accessor for ComposeRecipient(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for ComposeRecipient(0) - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *sub_1B997F6A0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236548);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8])
      memmove(v12, v13, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1B997F7B8(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;

  v3 = v2;
  v5 = type metadata accessor for ComposeRecipient.Identifier(0);
  v39 = *(_QWORD *)(v5 - 8);
  v40 = v5;
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236550);
  v41 = a2;
  v9 = sub_1B99972AC();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v38 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v36 = v2;
  v37 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v20 = v19 | (v17 << 6);
      goto LABEL_22;
    }
    v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v37)
      break;
    v22 = v38;
    v23 = v38[v21];
    ++v17;
    if (!v23)
    {
      v17 = v21 + 1;
      if (v21 + 1 >= v37)
        goto LABEL_34;
      v23 = v38[v17];
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v37)
        {
LABEL_34:
          swift_release();
          v3 = v36;
          if ((v41 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = v38[v24];
        if (!v23)
        {
          while (1)
          {
            v17 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v17 >= v37)
              goto LABEL_34;
            v23 = v38[v17];
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v17 = v24;
      }
    }
LABEL_21:
    v14 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v39 + 72);
    v26 = *(_QWORD *)(v8 + 48) + v25 * v20;
    if ((v41 & 1) != 0)
      sub_1B997FF44(v26, (uint64_t)v7, type metadata accessor for ComposeRecipient.Identifier);
    else
      sub_1B997F378(v26, (uint64_t)v7, type metadata accessor for ComposeRecipient.Identifier);
    v27 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v20);
    sub_1B997FF88(&qword_1EF236558, (uint64_t)&unk_1B999BA10);
    result = sub_1B99970A8();
    v28 = -1 << *(_BYTE *)(v10 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v15 + 8 * (v29 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v15 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v15 + 8 * v30);
      }
      while (v34 == -1);
      v18 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = sub_1B997FF44((uint64_t)v7, *(_QWORD *)(v10 + 48) + v25 * v18, type metadata accessor for ComposeRecipient.Identifier);
    *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v18) = v27;
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v36;
  v22 = v38;
  if ((v41 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v8 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

unint64_t sub_1B997FB2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v13;

  type metadata accessor for ComposeRecipient.Identifier(0);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = -1 << *(_BYTE *)(v2 + 32);
  v8 = a2 & ~v7;
  if (((*(_QWORD *)(v2 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v4 + 72);
    do
    {
      sub_1B997F378(*(_QWORD *)(v2 + 48) + v10 * v8, (uint64_t)v6, type metadata accessor for ComposeRecipient.Identifier);
      sub_1B997FF88(&qword_1EF236560, (uint64_t)&unk_1B999BA50);
      v11 = sub_1B99970CC();
      sub_1B997FE90((uint64_t)v6, type metadata accessor for ComposeRecipient.Identifier);
      if ((v11 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  return v8;
}

void *sub_1B997FC60()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *result;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v26 = *(_QWORD *)(type metadata accessor for ComposeRecipient.Identifier(0) - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236550);
  v4 = *v0;
  v5 = sub_1B99972A0();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v6;
    return result;
  }
  v24 = v1;
  result = (void *)(v5 + 64);
  v8 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  if (v6 != v4 || (unint64_t)result >= v4 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v4 + 64), 8 * v8);
  v25 = v4 + 64;
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v4 + 16);
  v11 = 1 << *(_BYTE *)(v4 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v4 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v14)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v10;
    if (!v21)
    {
      v10 = v20 + 1;
      if (v20 + 1 >= v14)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v10);
      if (!v21)
        break;
    }
LABEL_25:
    v13 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v26 + 72) * v16;
    sub_1B997F378(*(_QWORD *)(v4 + 48) + v17, (uint64_t)v3, type metadata accessor for ComposeRecipient.Identifier);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + v18);
    result = (void *)sub_1B997FF44((uint64_t)v3, *(_QWORD *)(v6 + 48) + v17, type metadata accessor for ComposeRecipient.Identifier);
    *(_QWORD *)(*(_QWORD *)(v6 + 56) + v18) = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v14)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v24;
    goto LABEL_28;
  }
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v10 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v10);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B997FE90(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

size_t sub_1B997FECC(_QWORD *a1)
{
  return sub_1B997F52C(0, a1[2], 0, a1);
}

uint64_t type metadata accessor for CombinesRecipients()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCC82F0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1B997FF44(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B997FF88(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ComposeRecipient.Identifier(255);
    result = MEMORY[0x1BCCC8308](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for ComposeRecipient(uint64_t a1)
{
  return sub_1B997FFF0(a1, (uint64_t *)&unk_1EF236D90);
}

uint64_t type metadata accessor for ComposeRecipient.Identifier(uint64_t a1)
{
  return sub_1B997FFF0(a1, qword_1EF236DA0);
}

uint64_t sub_1B997FFF0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B9980024(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ComposeRecipient.Identifier(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B9980068@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = type metadata accessor for ComposeRecipient(0);
  v4 = *(_QWORD *)(v1 + *(int *)(result + 24));
  if (*(_QWORD *)(v4 + 16))
  {
    v5 = *(_QWORD *)(v4 + 32);
    v6 = *(_QWORD *)(v4 + 40);
    v7 = *(_QWORD *)(v4 + 56);
    v8 = *(_QWORD *)(v4 + 64);
    v9 = *(_QWORD *)(v4 + 72);
    v10 = *(unsigned __int8 *)(v4 + 48);
    sub_1B9980110(v5, v6, *(_BYTE *)(v4 + 48));
    sub_1B9980128(v7, v8);
    result = swift_bridgeObjectRetain();
  }
  else
  {
    v5 = 0;
    v6 = 0;
    v10 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }
  *a1 = v5;
  a1[1] = v6;
  a1[2] = v10;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  return result;
}

uint64_t sub_1B9980110(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1B9980128(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 0xD)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1B998013C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ComposeRecipient(0) + 24));
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
  {
    __break(1u);
LABEL_9:
    swift_bridgeObjectRelease();
    v5 = sub_1B9980AE0(v1, v1 + 32, 1, (2 * v2) | 1);
    goto LABEL_7;
  }
  sub_1B9997300();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  v3 = swift_dynamicCastClass();
  if (!v3)
  {
    swift_bridgeObjectRelease();
    v3 = MEMORY[0x1E0DEE9D8];
  }
  v4 = *(_QWORD *)(v3 + 16);
  swift_release();
  if (v4 != v2 - 1)
    goto LABEL_9;
  v5 = swift_dynamicCastClass();
  if (!v5)
  {
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x1E0DEE9D8];
  }
LABEL_7:
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1B9980220@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1B999703C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

id sub_1B9980258@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  os_log_type_t v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD *v22;
  uint8_t *v23;
  id result;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  uint64_t *v30;
  _OWORD *v31;
  __int128 v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  _OWORD v46[3];

  v6 = type metadata accessor for ComposeRecipient.Identifier(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (uint64_t *)((char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = sub_1B9997078();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9997030();
  v13 = sub_1B998F54C();
  v45 = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  v14 = sub_1B99971B0();
  v15 = a1;
  v16 = sub_1B9997060();
  v17 = os_log_type_enabled(v16, v14);
  v43 = v6;
  v44 = v8;
  if (v17)
  {
    v18 = swift_slowAlloc();
    v42 = a3;
    v19 = (uint8_t *)v18;
    v40 = (_QWORD *)swift_slowAlloc();
    v41 = a2;
    *(_DWORD *)v19 = 138477827;
    *(_QWORD *)&v46[0] = v15;
    v20 = v9;
    v21 = v15;
    sub_1B9997204();
    v22 = v40;
    *v40 = v15;

    v9 = v20;
    _os_log_impl(&dword_1B9950000, v16, v14, "Converting result for %{private}@", v19, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236568);
    swift_arrayDestroy();
    a2 = v41;
    MEMORY[0x1BCCC83A4](v22, -1, -1);
    v23 = v19;
    a3 = v42;
    MEMORY[0x1BCCC83A4](v23, -1, -1);
  }
  else
  {

    v16 = v15;
  }

  (*(void (**)(char *, uint64_t))(v45 + 8))(v12, v9);
  result = -[NSObject displayName](v15, sel_displayName);
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }
  v25 = result;
  v26 = sub_1B9997108();
  v28 = v27;

  v29 = (int *)type metadata accessor for ComposeRecipient(0);
  v30 = (uint64_t *)(a3 + v29[5]);
  *v30 = v26;
  v30[1] = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236548);
  v31 = (_OWORD *)swift_allocObject();
  v31[1] = xmmword_1B999B9A0;
  result = -[NSObject value](v15, sel_value);
  if (!result)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  sub_1B998CD90(result, a2, (uint64_t)v46);
  v32 = v46[1];
  v31[2] = v46[0];
  v31[3] = v32;
  v31[4] = v46[2];
  *(_QWORD *)(a3 + v29[6]) = v31;
  v33 = -[NSObject identifier](v15, sel_identifier);
  if (v33)
  {
    v34 = v33;
    v35 = sub_1B9997108();
    v37 = v36;

    v38 = v44;
    *v44 = v35;
    v38[1] = v37;
    v39 = (uint64_t)v38;
  }
  else
  {
    v39 = (uint64_t)v44;
    sub_1B9997030();
  }
  swift_storeEnumTagMultiPayload();

  return (id)sub_1B9980024(v39, a3 + v29[7]);
}

uint64_t sub_1B99805A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  BOOL v7;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v5 = 1;
    }
    else
    {
      sub_1B9981DF4();
      v3 = 0;
      v4 = v2 - 1;
      do
      {
        v5 = sub_1B99970CC();
        v7 = v4-- != 0;
        if ((v5 & 1) == 0)
          break;
        v3 += 48;
      }
      while (v7);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_1B9980694()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(_QWORD);
  uint64_t v10;

  v1 = sub_1B999703C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ComposeRecipient.Identifier(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B997F378(v0, (uint64_t)v7, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_1B9997324();
    sub_1B998117C(&qword_1EF236570, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    sub_1B99970B4();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    sub_1B9997324();
    sub_1B9997120();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B99807EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v1 = v0;
  v2 = sub_1B999703C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ComposeRecipient.Identifier(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9997318();
  sub_1B997F378(v1, (uint64_t)v8, type metadata accessor for ComposeRecipient.Identifier);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_1B9997324();
    sub_1B998117C(&qword_1EF236570, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    sub_1B99970B4();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_1B9997324();
    sub_1B9997120();
    swift_bridgeObjectRelease();
  }
  return sub_1B9997330();
}

uint64_t sub_1B998096C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v1 = v0;
  v2 = sub_1B999703C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9997318();
  sub_1B997F378(v1, (uint64_t)v8, type metadata accessor for ComposeRecipient.Identifier);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_1B9997324();
    sub_1B998117C(&qword_1EF236570, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    sub_1B99970B4();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    sub_1B9997324();
    sub_1B9997120();
    swift_bridgeObjectRelease();
  }
  return sub_1B9997330();
}

uint64_t sub_1B9980AE0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  size_t v9;
  unint64_t v10;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5)
      return MEMORY[0x1E0DEE9D8];
    if (v5 <= 0)
    {
      v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0)
          goto LABEL_17;
        v10 = a2 + 48 * a3;
        if (v10 < (unint64_t)&v8[6 * v5 + 4] && (unint64_t)(v8 + 4) < v10 + 48 * v5)
          goto LABEL_17;
        swift_arrayInitWithCopy();
        return (uint64_t)v8;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236548);
      v8 = (_QWORD *)swift_allocObject();
      v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 48);
      if (v4 != a3)
        goto LABEL_5;
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  result = sub_1B99972C4();
  __break(1u);
  return result;
}

uint64_t sub_1B9980C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v26;

  v4 = sub_1B999703C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ComposeRecipient.Identifier(0);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (uint64_t *)((char *)&v26 - v12);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236578);
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &v17[*(int *)(v15 + 48)];
  sub_1B997F378(a1, (uint64_t)v17, type metadata accessor for ComposeRecipient.Identifier);
  sub_1B997F378(a2, (uint64_t)v18, type metadata accessor for ComposeRecipient.Identifier);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_1B997F378((uint64_t)v17, (uint64_t)v13, type metadata accessor for ComposeRecipient.Identifier);
    v22 = *v13;
    v21 = v13[1];
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      if (v22 == *(_QWORD *)v18 && v21 == *((_QWORD *)v18 + 1))
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v24 = sub_1B99972F4();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v24 & 1) == 0)
        {
          sub_1B997FE90((uint64_t)v17, type metadata accessor for ComposeRecipient.Identifier);
          goto LABEL_8;
        }
      }
      sub_1B997FE90((uint64_t)v17, type metadata accessor for ComposeRecipient.Identifier);
      v19 = 1;
      return v19 & 1;
    }
    swift_bridgeObjectRelease();
LABEL_7:
    sub_1B9981DB4((uint64_t)v17);
LABEL_8:
    v19 = 0;
    return v19 & 1;
  }
  sub_1B997F378((uint64_t)v17, (uint64_t)v11, type metadata accessor for ComposeRecipient.Identifier);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
  v19 = sub_1B9997024();
  v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v7, v4);
  v20(v11, v4);
  sub_1B997FE90((uint64_t)v17, type metadata accessor for ComposeRecipient.Identifier);
  return v19 & 1;
}

uint64_t sub_1B9980EF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  char v22;
  char v23;
  char v24;
  uint64_t v26;

  v4 = type metadata accessor for ComposeRecipient(0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v26 - v9;
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v26 - v12;
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)&v26 - v15;
  v17 = *(int *)(v14 + 20);
  v18 = *(_QWORD *)(a1 + v17);
  v19 = *(_QWORD *)(a1 + v17 + 8);
  v20 = (_QWORD *)(a2 + v17);
  if (v18 == *v20 && v19 == v20[1])
  {
    sub_1B997F378(a1, (uint64_t)&v26 - v15, type metadata accessor for ComposeRecipient);
    sub_1B997F378(a2, (uint64_t)v13, type metadata accessor for ComposeRecipient);
  }
  else
  {
    v22 = sub_1B99972F4();
    sub_1B997F378(a1, (uint64_t)v16, type metadata accessor for ComposeRecipient);
    sub_1B997F378(a2, (uint64_t)v13, type metadata accessor for ComposeRecipient);
    if ((v22 & 1) == 0)
    {
      sub_1B997FE90((uint64_t)v16, type metadata accessor for ComposeRecipient);
      sub_1B997FE90((uint64_t)v13, type metadata accessor for ComposeRecipient);
      sub_1B997F378(a1, (uint64_t)v10, type metadata accessor for ComposeRecipient);
      sub_1B997F378(a2, (uint64_t)v7, type metadata accessor for ComposeRecipient);
LABEL_10:
      v24 = 0;
      goto LABEL_11;
    }
  }
  v23 = sub_1B99805A0(*(_QWORD *)&v16[*(int *)(v4 + 24)], *(_QWORD *)&v13[*(int *)(v4 + 24)]);
  sub_1B997FE90((uint64_t)v16, type metadata accessor for ComposeRecipient);
  sub_1B997FE90((uint64_t)v13, type metadata accessor for ComposeRecipient);
  sub_1B997F378(a1, (uint64_t)v10, type metadata accessor for ComposeRecipient);
  sub_1B997F378(a2, (uint64_t)v7, type metadata accessor for ComposeRecipient);
  if ((v23 & 1) == 0)
    goto LABEL_10;
  v24 = sub_1B9980C6C((uint64_t)&v10[*(int *)(v4 + 28)], (uint64_t)&v7[*(int *)(v4 + 28)]);
LABEL_11:
  sub_1B997FE90((uint64_t)v7, type metadata accessor for ComposeRecipient);
  sub_1B997FE90((uint64_t)v10, type metadata accessor for ComposeRecipient);
  return v24 & 1;
}

uint64_t sub_1B9981124()
{
  return sub_1B998117C(&qword_1EF236570, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
}

uint64_t sub_1B9981150()
{
  return sub_1B998117C(&qword_1EF236560, type metadata accessor for ComposeRecipient.Identifier, (uint64_t)&unk_1B999BA50);
}

uint64_t sub_1B998117C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1BCCC8308](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_1B99811BC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1B999703C();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = a3[5];
    v10 = a3[6];
    v11 = (uint64_t *)((char *)a1 + v9);
    v12 = (uint64_t *)((char *)a2 + v9);
    v13 = v12[1];
    v14 = *(uint64_t *)((char *)a2 + v10);
    *v11 = *v12;
    v11[1] = v13;
    *(uint64_t *)((char *)a1 + v10) = v14;
    v15 = a3[7];
    v16 = (uint64_t *)((char *)a1 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    type metadata accessor for ComposeRecipient.Identifier(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8(v16, v17, v7);
    }
    else
    {
      v19 = v17[1];
      *v16 = *v17;
      v16[1] = v19;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1B99812E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v7)(uint64_t, uint64_t);

  v4 = sub_1B999703C();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v7(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = a1 + *(int *)(a2 + 28);
  type metadata accessor for ComposeRecipient.Identifier(0);
  if (swift_getEnumCaseMultiPayload() == 1)
    return ((uint64_t (*)(uint64_t, uint64_t))v7)(v5, v4);
  else
    return swift_bridgeObjectRelease();
}

_QWORD *sub_1B9981398(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  void (*v7)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v6 = sub_1B999703C();
  v7 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a3[6];
  v10 = (_QWORD *)((char *)a1 + v8);
  v11 = (_QWORD *)((char *)a2 + v8);
  v12 = v11[1];
  v13 = *(_QWORD *)((char *)a2 + v9);
  *v10 = *v11;
  v10[1] = v12;
  *(_QWORD *)((char *)a1 + v9) = v13;
  v14 = a3[7];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  type metadata accessor for ComposeRecipient.Identifier(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7(v15, v16, v6);
  }
  else
  {
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_1B9981488(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v6 = sub_1B999703C();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6);
  v8 = a3[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v11 = a3[7];
    v12 = (_QWORD *)(a1 + v11);
    v13 = (_QWORD *)(a2 + v11);
    sub_1B997FE90(a1 + v11, type metadata accessor for ComposeRecipient.Identifier);
    type metadata accessor for ComposeRecipient.Identifier(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v12, v13, v6);
    }
    else
    {
      *v12 = *v13;
      v12[1] = v13[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_1B99815B0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  void (*v7)(void *, const void *, uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = sub_1B999703C();
  v7 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  v9 = a3[7];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = type metadata accessor for ComposeRecipient.Identifier(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7(v10, v11, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  return a1;
}

uint64_t sub_1B9981684(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;

  v6 = sub_1B999703C();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, v6);
  v8 = a3[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v13 = a3[7];
    v14 = (void *)(a1 + v13);
    v15 = (const void *)(a2 + v13);
    sub_1B997FE90(a1 + v13, type metadata accessor for ComposeRecipient.Identifier);
    v16 = type metadata accessor for ComposeRecipient.Identifier(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(v14, v15, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1B9981790()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B998179C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_1B999703C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = type metadata accessor for ComposeRecipient.Identifier(0);
    v10 = a1 + *(int *)(a3 + 28);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_1B9981848()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B9981854(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_1B999703C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
      return result;
    }
    v10 = type metadata accessor for ComposeRecipient.Identifier(0);
    v12 = a1 + *(int *)(a4 + 28);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_1B99818FC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1B999703C();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for ComposeRecipient.Identifier(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1B9981998(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_1B999703C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1B9981A54(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_bridgeObjectRelease();
  v2 = sub_1B999703C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

_QWORD *sub_1B9981AA4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_1B999703C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_1B9981B34(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_1B997FE90((uint64_t)a1, type metadata accessor for ComposeRecipient.Identifier);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = sub_1B999703C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_1B9981BE4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_1B999703C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_1B9981C70(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1B997FE90((uint64_t)a1, type metadata accessor for ComposeRecipient.Identifier);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_1B999703C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1B9981D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_1B9981D20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1B9981D34()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1B9981D44()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B999703C();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_1B9981DB4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236578);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1B9981DF4()
{
  unint64_t result;

  result = qword_1EF236580[0];
  if (!qword_1EF236580[0])
  {
    result = MEMORY[0x1BCCC8308](&unk_1B999C6E8, &_s6HandleVN);
    atomic_store(result, qword_1EF236580);
  }
  return result;
}

BOOL sub_1B9981E38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1B9981E50()
{
  return sub_1B9997324();
}

uint64_t sub_1B9981E7C()
{
  sub_1B9997318();
  sub_1B9997324();
  return sub_1B9997330();
}

uint64_t sub_1B9981EC0()
{
  sub_1B9997318();
  sub_1B9997324();
  return sub_1B9997330();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1B9981F18(uint64_t a1)
{
  return sub_1B9981F3C(a1, qword_1EF238F60);
}

uint64_t sub_1B9981F3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1B9997078();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1B999706C();
}

uint64_t sub_1B9981FB0(uint64_t a1, char a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 56) = a2;
  *(_QWORD *)(v2 + 16) = a1;
  sub_1B9997090();
  *(_QWORD *)(v2 + 24) = swift_task_alloc();
  return swift_task_switch();
}

id sub_1B998200C()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)(_QWORD, _QWORD);

  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v2 = result;
    v3 = *(_QWORD *)(v0 + 24);
    sub_1B9997084();
    type metadata accessor for CachedIDSLookup();
    swift_allocObject();
    v4 = sub_1B9986B80(v2, 0xD00000000000001FLL, 0x80000001B99A1DF0, v3);
    *(_QWORD *)(v0 + 32) = v4;

    v6 = (uint64_t (*)(_QWORD, _QWORD))(**(int **)(*v4 + 112) + *(_QWORD *)(*v4 + 112));
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v5;
    *v5 = v0;
    v5[1] = sub_1B99820F4;
    return (id)v6(*(_QWORD *)(v0 + 16), *(unsigned __int8 *)(v0 + 56));
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B99820F4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B9982150()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 48));
}

_QWORD *sub_1B998218C(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  _QWORD *v8;

  swift_allocObject();
  v8 = sub_1B9986B80(a1, a2, a3, a4);

  return v8;
}

uint64_t type metadata accessor for CachedIDSLookup()
{
  return objc_opt_self();
}

uint64_t sub_1B9982218(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(**(_QWORD **)v2 + 80)
                                                + *(_QWORD *)(**(_QWORD **)v2 + 80));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1B998228C;
  return v8(a1, a2);
}

uint64_t sub_1B998228C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

unint64_t sub_1B99822DC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  char v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236630);
  v2 = (_QWORD *)sub_1B99972B8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (char *)(a1 + 49);
  while (1)
  {
    v5 = *(_QWORD *)(v4 - 17);
    v6 = *(_QWORD *)(v4 - 9);
    v7 = *(v4 - 1);
    v8 = *v4;
    swift_bridgeObjectRetain();
    result = sub_1B998518C(v5, v6, v7);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = v2[6] + 24 * result;
    *(_QWORD *)v11 = v5;
    *(_QWORD *)(v11 + 8) = v6;
    *(_BYTE *)(v11 + 16) = v7;
    *(_BYTE *)(v2[7] + result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4 += 24;
    v2[2] = v14;
    if (!--v3)
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

unint64_t sub_1B9982410(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236620);
  v2 = (_QWORD *)sub_1B99972B8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_1B9985128(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_1B9982528(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236638);
  v2 = (_QWORD *)sub_1B99972B8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_1B9985128(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
    v2[2] = v13;
    if (!--v3)
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

uint64_t sub_1B9982640(__int128 *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = swift_allocObject();
  v3 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v2 + 56) = sub_1B99822DC(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)(v2 + 64) = sub_1B9982410(v3);
  sub_1B9986D5C(a1, v2 + 16);
  return v2;
}

uint64_t sub_1B99826A8(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 107) = a2;
  *(_QWORD *)(v3 + 48) = a1;
  *(_QWORD *)(v3 + 56) = v2;
  return swift_task_switch();
}

uint64_t sub_1B99826C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  char v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  char isUniquelyReferenced_nonNull_native;
  char v37;
  unint64_t v38;
  uint64_t v39;
  _BOOL8 v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t *v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  _BYTE *v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t);
  uint64_t (*v61)(_QWORD *, _QWORD, uint64_t, uint64_t);
  _QWORD *v62;

  v58 = (_QWORD *)sub_1B9982528(MEMORY[0x1E0DEE9D8]);
  if (qword_1EF236DB8 != -1)
    goto LABEL_37;
  while (1)
  {
    v1 = sub_1B9997078();
    v2 = __swift_project_value_buffer(v1, (uint64_t)qword_1EF238F60);
    *(_QWORD *)(v0 + 64) = v2;
    v3 = sub_1B9997060();
    v4 = sub_1B99971B0();
    v59 = v0;
    v56 = v2;
    if (os_log_type_enabled(v3, v4))
    {
      v5 = *(_BYTE *)(v0 + 107);
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v62 = (_QWORD *)v7;
      *(_DWORD *)v6 = 136315138;
      *(_BYTE *)(v59 + 106) = v5;
      v8 = sub_1B9997114();
      *(_QWORD *)(v59 + 40) = sub_1B9984AE8(v8, v9, (uint64_t *)&v62);
      sub_1B9997204();
      v0 = v59;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B9950000, v3, v4, "Looking up status of handles for service .%s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCC83A4](v7, -1, -1);
      MEMORY[0x1BCCC83A4](v6, -1, -1);
    }

    v10 = *(_QWORD *)(*(_QWORD *)(v0 + 48) + 16);
    if (!v10)
      break;
    v55 = (_BYTE *)(v0 + 105);
    v60 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v0 + 56) + 104);
    v11 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
    v12 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    while (1)
    {
      v13 = *(v11 - 1);
      v14 = *v11;
      v15 = swift_bridgeObjectRetain_n();
      v16 = v60(v15);
      if (!*(_QWORD *)(v16 + 16) || (v17 = sub_1B998518C(v13, v14, *(_BYTE *)(v0 + 107)), (v18 & 1) == 0))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain_n();
        v26 = sub_1B9997060();
        v27 = sub_1B99971B0();
        if (os_log_type_enabled(v26, v27))
        {
          v28 = swift_slowAlloc();
          v29 = v2;
          v30 = v12;
          v31 = swift_slowAlloc();
          v62 = (_QWORD *)v31;
          *(_DWORD *)v28 = 136380675;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v28 + 4) = sub_1B9984AE8(v13, v14, (uint64_t *)&v62);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1B9950000, v26, v27, " - %{private}s: cache miss", (uint8_t *)v28, 0xCu);
          swift_arrayDestroy();
          v32 = v31;
          v12 = v30;
          v2 = v29;
          v0 = v59;
          MEMORY[0x1BCCC83A4](v32, -1, -1);
          MEMORY[0x1BCCC83A4](v28, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v12 = sub_1B99849DC(0, v12[2] + 1, 1, v12);
        v34 = v12[2];
        v33 = v12[3];
        if (v34 >= v33 >> 1)
          v12 = sub_1B99849DC((_QWORD *)(v33 > 1), v34 + 1, 1, v12);
        v12[2] = v34 + 1;
        v35 = &v12[2 * v34];
        v35[4] = v13;
        v35[5] = v14;
        goto LABEL_8;
      }
      v19 = *(unsigned __int8 *)(*(_QWORD *)(v16 + 56) + v17);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain_n();
      v20 = sub_1B9997060();
      v21 = sub_1B99971B0();
      v57 = v12;
      if (os_log_type_enabled(v20, v21))
      {
        v22 = swift_slowAlloc();
        v23 = swift_slowAlloc();
        v62 = (_QWORD *)v23;
        *(_DWORD *)v22 = 136380931;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v22 + 4) = sub_1B9984AE8(v13, v14, (uint64_t *)&v62);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v22 + 12) = 2080;
        *v55 = v19;
        v24 = sub_1B9997114();
        v0 = v19;
        *(_QWORD *)(v22 + 14) = sub_1B9984AE8(v24, v25, (uint64_t *)&v62);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1B9950000, v20, v21, " - %{private}s: .%s", (uint8_t *)v22, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1BCCC83A4](v23, -1, -1);
        MEMORY[0x1BCCC83A4](v22, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v62 = v58;
      v38 = sub_1B9985128(v13, v14);
      v39 = v58[2];
      v40 = (v37 & 1) == 0;
      v41 = v39 + v40;
      if (__OFADD__(v39, v40))
        break;
      v42 = v37;
      if (v58[3] >= v41)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_1B9986360();
          v58 = v62;
        }
      }
      else
      {
        sub_1B99854D4(v41, isUniquelyReferenced_nonNull_native);
        v43 = (uint64_t)v62;
        v44 = sub_1B9985128(v13, v14);
        if ((v42 & 1) != (v45 & 1))
          return sub_1B999730C();
        v38 = v44;
        v58 = (_QWORD *)v43;
      }
      v0 = v59;
      v2 = v56;
      if ((v42 & 1) != 0)
      {
        *(_BYTE *)(v58[7] + v38) = v19;
      }
      else
      {
        v58[(v38 >> 6) + 8] |= 1 << v38;
        v46 = (uint64_t *)(v58[6] + 16 * v38);
        *v46 = v13;
        v46[1] = v14;
        *(_BYTE *)(v58[7] + v38) = v19;
        v47 = v58[2];
        v48 = __OFADD__(v47, 1);
        v49 = v47 + 1;
        if (v48)
          goto LABEL_36;
        v58[2] = v49;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = v57;
LABEL_8:
      v11 += 2;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    swift_once();
  }
  v12 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_33:
  *(_QWORD *)(v0 + 72) = v58;
  *(_QWORD *)(v0 + 80) = v12;
  v50 = *(_QWORD **)(v0 + 56);
  v51 = v50[5];
  v52 = v50[6];
  __swift_project_boxed_opaque_existential_1(v50 + 2, v51);
  v61 = (uint64_t (*)(_QWORD *, _QWORD, uint64_t, uint64_t))(**(int **)(v52 + 8) + *(_QWORD *)(v52 + 8));
  v53 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v53;
  *v53 = v0;
  v53[1] = sub_1B9982DAC;
  return v61(v12, *(unsigned __int8 *)(v0 + 107), v51, v52);
}

uint64_t sub_1B9982DAC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

void sub_1B9982E10()
{
  _QWORD *v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  _QWORD *v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  unsigned __int8 v19;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  char v27;
  unsigned __int8 v28;
  unint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  char v36;
  char v37;
  unint64_t v38;
  uint64_t v39;
  _BOOL8 v40;
  uint64_t v41;
  char v42;
  unint64_t v43;
  char v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;

  v1 = 0;
  v2 = v0[12];
  v3 = *(_QWORD *)(v2 + 64);
  v54 = v0 + 13;
  v55 = v2 + 64;
  v57 = v2;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(v57 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & v3;
  v7 = (uint64_t *)(v0[7] + 56);
  v56 = (unint64_t)(63 - v5) >> 6;
  v8 = (_QWORD *)v0[9];
  while (1)
  {
    if (v6)
    {
      v58 = (v6 - 1) & v6;
      v9 = v1;
      v10 = __clz(__rbit64(v6)) | (v1 << 6);
    }
    else
    {
      v11 = v1 + 1;
      if (__OFADD__(v1, 1))
        goto LABEL_52;
      if (v11 >= v56)
      {
LABEL_46:
        swift_release();
        (*(void (**)(_QWORD *))(v59 + 8))(v8);
        return;
      }
      v12 = *(_QWORD *)(v55 + 8 * v11);
      v13 = v1 + 1;
      if (!v12)
      {
        v13 = v1 + 2;
        if (v1 + 2 >= v56)
          goto LABEL_46;
        v12 = *(_QWORD *)(v55 + 8 * v13);
        if (!v12)
        {
          v13 = v1 + 3;
          if (v1 + 3 >= v56)
            goto LABEL_46;
          v12 = *(_QWORD *)(v55 + 8 * v13);
          if (!v12)
          {
            v14 = v1 + 4;
            if (v1 + 4 >= v56)
              goto LABEL_46;
            v12 = *(_QWORD *)(v55 + 8 * v14);
            if (!v12)
            {
              while (1)
              {
                v13 = v14 + 1;
                if (__OFADD__(v14, 1))
                  goto LABEL_53;
                if (v13 >= v56)
                  goto LABEL_46;
                v12 = *(_QWORD *)(v55 + 8 * v13);
                ++v14;
                if (v12)
                  goto LABEL_21;
              }
            }
            v13 = v1 + 4;
          }
        }
      }
LABEL_21:
      v58 = (v12 - 1) & v12;
      v9 = v13;
      v10 = __clz(__rbit64(v12)) + (v13 << 6);
    }
    v15 = (uint64_t *)(*(_QWORD *)(v57 + 48) + 16 * v10);
    v17 = *v15;
    v16 = v15[1];
    v18 = *(_BYTE *)(*(_QWORD *)(v57 + 56) + v10);
    v19 = *(_BYTE *)(v59 + 107);
    swift_beginAccess();
    swift_bridgeObjectRetain_n();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v60 = (_QWORD *)*v7;
    v21 = v60;
    *v7 = 0x8000000000000000;
    v23 = sub_1B998518C(v17, v16, v19);
    v24 = v21[2];
    v25 = (v22 & 1) == 0;
    v26 = v24 + v25;
    if (__OFADD__(v24, v25))
      break;
    v27 = v22;
    if (v21[3] >= v26)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v22 & 1) != 0)
          goto LABEL_29;
      }
      else
      {
        sub_1B9986508();
        v21 = v60;
        if ((v27 & 1) != 0)
          goto LABEL_29;
      }
    }
    else
    {
      v28 = *(_BYTE *)(v59 + 107);
      sub_1B99857DC(v26, isUniquelyReferenced_nonNull_native);
      v21 = v60;
      v29 = sub_1B998518C(v17, v16, v28);
      if ((v27 & 1) != (v30 & 1))
        goto LABEL_47;
      v23 = v29;
      if ((v27 & 1) != 0)
      {
LABEL_29:
        *(_BYTE *)(v21[7] + v23) = v18;
        goto LABEL_33;
      }
    }
    v31 = *(_BYTE *)(v59 + 107);
    v21[(v23 >> 6) + 8] |= 1 << v23;
    v32 = v21[6] + 24 * v23;
    *(_QWORD *)v32 = v17;
    *(_QWORD *)(v32 + 8) = v16;
    *(_BYTE *)(v32 + 16) = v31;
    *(_BYTE *)(v21[7] + v23) = v18;
    v33 = v21[2];
    v34 = __OFADD__(v33, 1);
    v35 = v33 + 1;
    if (v34)
      goto LABEL_50;
    v21[2] = v35;
    swift_bridgeObjectRetain();
LABEL_33:
    *v7 = (uint64_t)v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_bridgeObjectRetain();
    v36 = swift_isUniquelyReferenced_nonNull_native();
    v60 = v8;
    v38 = sub_1B9985128(v17, v16);
    v39 = v8[2];
    v40 = (v37 & 1) == 0;
    v41 = v39 + v40;
    if (__OFADD__(v39, v40))
      goto LABEL_49;
    v42 = v37;
    if (v8[3] >= v41)
    {
      if ((v36 & 1) != 0)
      {
        if ((v37 & 1) != 0)
          goto LABEL_40;
      }
      else
      {
        sub_1B9986360();
        v8 = v60;
        if ((v42 & 1) != 0)
          goto LABEL_40;
      }
    }
    else
    {
      sub_1B99854D4(v41, v36);
      v8 = v60;
      v43 = sub_1B9985128(v17, v16);
      if ((v42 & 1) != (v44 & 1))
      {
LABEL_47:
        sub_1B999730C();
        return;
      }
      v38 = v43;
      if ((v42 & 1) != 0)
      {
LABEL_40:
        *(_BYTE *)(v8[7] + v38) = v18;
        goto LABEL_44;
      }
    }
    v8[(v38 >> 6) + 8] |= 1 << v38;
    v45 = (uint64_t *)(v8[6] + 16 * v38);
    *v45 = v17;
    v45[1] = v16;
    *(_BYTE *)(v8[7] + v38) = v18;
    v46 = v8[2];
    v34 = __OFADD__(v46, 1);
    v47 = v46 + 1;
    if (v34)
      goto LABEL_51;
    v8[2] = v47;
    swift_bridgeObjectRetain();
LABEL_44:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v48 = sub_1B9997060();
    v49 = sub_1B99971B0();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = swift_slowAlloc();
      v51 = swift_slowAlloc();
      v60 = (_QWORD *)v51;
      *(_DWORD *)v50 = 136315395;
      *v54 = v18;
      v52 = sub_1B9997114();
      *(_QWORD *)(v50 + 4) = sub_1B9984AE8(v52, v53, (uint64_t *)&v60);
      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2081;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v50 + 14) = sub_1B9984AE8(v17, v16, (uint64_t *)&v60);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B9950000, v48, v49, "Caching status .%s for %{private}s", (uint8_t *)v50, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BCCC83A4](v51, -1, -1);
      MEMORY[0x1BCCC83A4](v50, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v1 = v9;
    v6 = v58;
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
}

uint64_t sub_1B99833B4()
{
  sub_1B9997318();
  swift_bridgeObjectRetain();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  sub_1B9997324();
  return sub_1B9997330();
}

uint64_t sub_1B9983424()
{
  swift_bridgeObjectRetain();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  return sub_1B9997324();
}

uint64_t sub_1B998347C()
{
  sub_1B9997318();
  swift_bridgeObjectRetain();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  sub_1B9997324();
  return sub_1B9997330();
}

BOOL sub_1B99834E8(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  char v5;
  _BOOL8 result;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return v2 == v3;
  v5 = sub_1B99972F4();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 == v3;
  return result;
}

uint64_t sub_1B9983544()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1B9983578(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(**(_QWORD **)v2 + 160)
                                                + *(_QWORD *)(**(_QWORD **)v2 + 160));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1B9987E2C;
  return v8(a1, a2);
}

uint64_t sub_1B99835EC()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B9983620(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 56) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B9983664(__int128 *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEE9D8];
  sub_1B9986D5C(a1, v2 + 16);
  return v2;
}

uint64_t sub_1B99836B0(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 72) = a2;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = v2;
  return swift_task_switch();
}

uint64_t sub_1B99836CC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 48);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  v6 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_1B9983754;
  return v6(*(_QWORD *)(v0 + 40), *(unsigned __int8 *)(v0 + 72), v2, v3);
}

uint64_t sub_1B9983754(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B99837B0()
{
  uint64_t v0;
  _QWORD **v1;
  _QWORD *v2;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = (_QWORD **)(*(_QWORD *)(v0 + 48) + 56);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v2 = sub_1B99848B8(0, v2[2] + 1, 1, v2);
    *v1 = v2;
  }
  v5 = v2[2];
  v4 = v2[3];
  if (v5 >= v4 >> 1)
  {
    v2 = sub_1B99848B8((_QWORD *)(v4 > 1), v5 + 1, 1, v2);
    *v1 = v2;
  }
  v6 = *(_QWORD *)(v0 + 64);
  v7 = *(_BYTE *)(v0 + 72);
  v8 = *(_QWORD *)(v0 + 40);
  v2[2] = v5 + 1;
  v9 = &v2[3 * v5];
  v9[4] = v8;
  *((_BYTE *)v9 + 40) = v7;
  v9[6] = v6;
  swift_endAccess();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 64));
}

uint64_t sub_1B99838B8()
{
  uint64_t v0;

  swift_beginAccess();
  *(_QWORD *)(v0 + 56) = MEMORY[0x1E0DEE9D8];
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B99838F8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_1B99972F4(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_1B99972F4() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_1B99839BC(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  char v20;
  char v21;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v12 >= v9)
      return 1;
    v13 = *(_QWORD *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      v4 = v12 + 1;
      if (v12 + 1 >= v9)
        return 1;
      v13 = *(_QWORD *)(v5 + 8 * v4);
      if (!v13)
      {
        v4 = v12 + 2;
        if (v12 + 2 >= v9)
          return 1;
        v13 = *(_QWORD *)(v5 + 8 * v4);
        if (!v13)
        {
          v4 = v12 + 3;
          if (v12 + 3 >= v9)
            return 1;
          v13 = *(_QWORD *)(v5 + 8 * v4);
          if (!v13)
            break;
        }
      }
    }
LABEL_23:
    v8 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v11);
    v16 = *v15;
    v17 = v15[1];
    v18 = *(unsigned __int8 *)(*(_QWORD *)(v3 + 56) + v11);
    swift_bridgeObjectRetain();
    v19 = sub_1B9985128(v16, v17);
    v21 = v20;
    result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0 || *(unsigned __int8 *)(*(_QWORD *)(a2 + 56) + v19) != v18)
      return 0;
  }
  v14 = v12 + 4;
  if (v14 >= v9)
    return 1;
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
  {
    v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v9)
      return 1;
    v13 = *(_QWORD *)(v5 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_23;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1B9983B64(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(unsigned __int8 *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  if ((sub_1B99838F8(*(_QWORD **)a1, *(_QWORD **)a2) & 1) != 0 && v2 == v4)
    return sub_1B99839BC(v3, v5);
  else
    return 0;
}

uint64_t sub_1B9983BD0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1B9983BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(**(_QWORD **)v2 + 128)
                                                + *(_QWORD *)(**(_QWORD **)v2 + 128));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1B9987E2C;
  return v8(a1, a2);
}

uint64_t sub_1B9983C70(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

int64_t sub_1B9983C88()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  int64_t result;
  char v13;
  char v14;
  uint64_t *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (_QWORD *)sub_1B9982528(MEMORY[0x1E0DEE9D8]);
  v3 = *(_QWORD *)(v1 + 16);
  if (!v3)
    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v2);
  for (i = (uint64_t *)(swift_bridgeObjectRetain() + 40); ; i += 2)
  {
    v6 = *(i - 1);
    v5 = *i;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = sub_1B9985128(v6, v5);
    v10 = v2[2];
    v11 = (v8 & 1) == 0;
    result = v10 + v11;
    if (__OFADD__(v10, v11))
      break;
    v13 = v8;
    if (v2[3] >= result)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v8 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        result = (int64_t)sub_1B9986360();
        if ((v13 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_1B99854D4(result, isUniquelyReferenced_nonNull_native);
      result = sub_1B9985128(v6, v5);
      if ((v13 & 1) != (v14 & 1))
        return sub_1B999730C();
      v9 = result;
      if ((v13 & 1) != 0)
      {
LABEL_3:
        *(_BYTE *)(v2[7] + v9) = 2;
        goto LABEL_4;
      }
    }
    v2[(v9 >> 6) + 8] |= 1 << v9;
    v15 = (uint64_t *)(v2[6] + 16 * v9);
    *v15 = v6;
    v15[1] = v5;
    *(_BYTE *)(v2[7] + v9) = 2;
    v16 = v2[2];
    v17 = __OFADD__(v16, 1);
    v18 = v16 + 1;
    if (v17)
      goto LABEL_20;
    v2[2] = v18;
    swift_bridgeObjectRetain();
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v2);
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_1B9983E50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(**(_QWORD **)v2 + 80)
                                                + *(_QWORD *)(**(_QWORD **)v2 + 80));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1B9987E2C;
  return v8(a1, a2);
}

uint64_t sub_1B9983EC4(char a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t v4;
  uint64_t *v9;
  char v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t inited;
  unint64_t v14;
  char v15;
  uint64_t v16;

  v9 = (uint64_t *)(v4 + 16);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v4 + 16) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B9985128(a2, a3);
    if ((v10 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_1B9986238(a1, a4, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF2369E0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B999B9A0;
  *(_BYTE *)(inited + 32) = a4;
  *(_BYTE *)(inited + 33) = a1;
  v14 = sub_1B9986D98(inited);
  swift_setDeallocating();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v15 = swift_isUniquelyReferenced_nonNull_native();
  v16 = *v9;
  *v9 = 0x8000000000000000;
  sub_1B99860DC(v14, a2, a3, v15);
  *v9 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_1B998405C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 56) = a2;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = v2;
  return swift_task_switch();
}

int64_t sub_1B9984078()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  char v16;
  char isUniquelyReferenced_nonNull_native;
  char v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  int64_t result;
  char v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = (_QWORD *)sub_1B9982528(MEMORY[0x1E0DEE9D8]);
  v3 = *(_QWORD *)(v1 + 16);
  if (!v3)
    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v2);
  v4 = *(_QWORD *)(v0 + 40);
  v29 = v0;
  v5 = *(_QWORD *)(v0 + 48) + 16;
  swift_bridgeObjectRetain();
  v30 = v5;
  swift_beginAccess();
  for (i = (uint64_t *)(v4 + 40); ; i += 2)
  {
    v8 = *(i - 1);
    v7 = *i;
    v9 = *(_QWORD *)v30;
    v10 = *(_QWORD *)(*(_QWORD *)v30 + 16);
    swift_bridgeObjectRetain_n();
    if (v10)
    {
      swift_bridgeObjectRetain();
      v11 = sub_1B9985128(v8, v7);
      if ((v12 & 1) != 0)
      {
        v13 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v11);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (*(_QWORD *)(v13 + 16) && (v14 = sub_1B998521C(*(_BYTE *)(v29 + 56)), (v15 & 1) != 0))
          v16 = *(_BYTE *)(*(_QWORD *)(v13 + 56) + v14);
        else
          v16 = 1;
      }
      else
      {
        v16 = 1;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v16 = 1;
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = sub_1B9985128(v8, v7);
    v20 = v2[2];
    v21 = (v18 & 1) == 0;
    result = v20 + v21;
    if (__OFADD__(v20, v21))
      break;
    v23 = v18;
    if (v2[3] >= result)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v18 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        result = (int64_t)sub_1B9986360();
        if ((v23 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_1B99854D4(result, isUniquelyReferenced_nonNull_native);
      result = sub_1B9985128(v8, v7);
      if ((v23 & 1) != (v24 & 1))
        return sub_1B999730C();
      v19 = result;
      if ((v23 & 1) != 0)
      {
LABEL_3:
        *(_BYTE *)(v2[7] + v19) = v16;
        goto LABEL_4;
      }
    }
    v2[(v19 >> 6) + 8] |= 1 << v19;
    v25 = (uint64_t *)(v2[6] + 16 * v19);
    *v25 = v8;
    v25[1] = v7;
    *(_BYTE *)(v2[7] + v19) = v16;
    v26 = v2[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_29;
    v2[2] = v28;
    swift_bridgeObjectRetain();
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    if (!--v3)
    {
      v0 = v29;
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v2);
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1B9984300()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1B9984324()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_1B9982410(MEMORY[0x1E0DEE9D8]);
  return v0;
}

uint64_t sub_1B9984364(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(**(_QWORD **)v2 + 120)
                                                + *(_QWORD *)(**(_QWORD **)v2 + 120));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1B9987E2C;
  return v8(a1, a2);
}

uint64_t sub_1B99843D8(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 56) = a2;
  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = v2;
  return swift_task_switch();
}

uint64_t sub_1B99843F4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int8x16_t v3;
  _QWORD *v4;

  v1 = *(_BYTE *)(v0 + 56);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  v3 = *(int8x16_t *)(v0 + 24);
  *(_BYTE *)(v2 + 16) = v1;
  *(int8x16_t *)(v2 + 24) = vextq_s8(v3, v3, 8uLL);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2365B8);
  *v4 = v0;
  v4[1] = sub_1B99844B0;
  return sub_1B99972E8();
}

uint64_t sub_1B99844B0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B998450C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

void sub_1B9984514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD aBlock[6];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236600);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  sub_1B9997108();
  v18 = *(id *)(a3 + 16);
  sub_1B99846E8(a4);
  v10 = (void *)sub_1B9997144();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_1B99970FC();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_1B99970FC();
  v13 = *(_QWORD *)(a3 + 40);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v14 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15 + v14, (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  aBlock[4] = sub_1B9987550;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B998480C;
  aBlock[3] = &block_descriptor;
  v16 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v18, sel_currentIDStatusForDestinations_service_listenerID_queue_completionBlock_, v10, v11, v12, v13, v16);
  _Block_release(v16);

}

uint64_t sub_1B99846E8(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_1B99869F8(0, v1, 0);
    v2 = v9;
    v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B99869F8(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1B99869F8(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      v4 += 16;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_1B9987A6C(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1B998480C(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
    v3 = sub_1B999709C();
  else
    v3 = 0;
  swift_retain();
  v2(v3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B9984884()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

_QWORD *sub_1B99848B8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236628);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v12 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1B9987BE0(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1B99849DC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF2369D0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1B9987AF0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B9984AE8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1B9984BB8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1B9987A10((uint64_t)v12, *a3);
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
      sub_1B9987A10((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1B9984BB8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1B9997210();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1B9984D70(a5, a6);
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
  v8 = sub_1B9997270();
  if (!v8)
  {
    sub_1B999727C();
    __break(1u);
LABEL_17:
    result = sub_1B99972C4();
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

uint64_t sub_1B9984D70(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1B9984E04(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1B9984FDC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1B9984FDC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B9984E04(uint64_t a1, unint64_t a2)
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
      v3 = sub_1B9984F78(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1B9997240();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1B999727C();
      __break(1u);
LABEL_10:
      v2 = sub_1B9997138();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1B99972C4();
    __break(1u);
LABEL_14:
    result = sub_1B999727C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1B9984F78(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236640);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1B9984FDC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236640);
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
  result = sub_1B99972C4();
  __break(1u);
  return result;
}

unint64_t sub_1B9985128(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1B9997318();
  sub_1B9997120();
  v4 = sub_1B9997330();
  return sub_1B9985274(a1, a2, v4);
}

unint64_t sub_1B998518C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;

  sub_1B9997318();
  swift_bridgeObjectRetain();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  sub_1B9997324();
  v6 = sub_1B9997330();
  return sub_1B9985354(a1, a2, a3, v6);
}

unint64_t sub_1B998521C(unsigned __int8 a1)
{
  uint64_t v2;

  sub_1B9997318();
  sub_1B9997324();
  v2 = sub_1B9997330();
  return sub_1B9985434(a1, v2);
}

unint64_t sub_1B9985274(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1B99972F4() & 1) == 0)
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
      while (!v14 && (sub_1B99972F4() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1B9985354(uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  BOOL v15;

  v5 = v4 + 64;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = a4 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v10 = a3;
    v11 = ~v6;
    v12 = *(_QWORD *)(v4 + 48);
    do
    {
      v13 = v12 + 24 * v7;
      v14 = *(unsigned __int8 *)(v13 + 16);
      v15 = *(_QWORD *)v13 == a1 && *(_QWORD *)(v13 + 8) == a2;
      if ((v15 || (sub_1B99972F4() & 1) != 0) && v14 == v10)
        break;
      v7 = (v7 + 1) & v11;
    }
    while (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_1B9985434(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_1B99854D4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236638);
  v37 = a2;
  v6 = sub_1B99972AC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_1B9997318();
    sub_1B9997120();
    result = sub_1B9997330();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1B99857DC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  int64_t v34;
  _QWORD *v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236630);
  v36 = a2;
  v6 = sub_1B99972AC();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v35 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v34 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v19 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v20 = v19 | (v13 << 6);
      }
      else
      {
        v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v34)
          goto LABEL_33;
        v22 = v35[v21];
        ++v13;
        if (!v22)
        {
          v13 = v21 + 1;
          if (v21 + 1 >= v34)
            goto LABEL_33;
          v22 = v35[v13];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v34)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v36 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v35[v23];
            if (!v22)
            {
              while (1)
              {
                v13 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_40;
                if (v13 >= v34)
                  goto LABEL_33;
                v22 = v35[v13];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v13 = v23;
          }
        }
LABEL_30:
        v10 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      v28 = *(_QWORD *)(v5 + 48) + 24 * v20;
      v30 = *(_QWORD *)v28;
      v29 = *(_QWORD *)(v28 + 8);
      v31 = *(_BYTE *)(v28 + 16);
      v32 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v20);
      if ((v36 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_1B9997318();
      swift_bridgeObjectRetain();
      sub_1B9997120();
      swift_bridgeObjectRelease();
      sub_1B9997324();
      result = sub_1B9997330();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = *(_QWORD *)(v7 + 48) + 24 * v17;
      *(_QWORD *)v18 = v30;
      *(_QWORD *)(v18 + 8) = v29;
      *(_BYTE *)(v18 + 16) = v31;
      *(_BYTE *)(*(_QWORD *)(v7 + 56) + v17) = v32;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1B9985B04(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236620);
  v36 = a2;
  v6 = sub_1B99972AC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1B9997318();
    sub_1B9997120();
    result = sub_1B9997330();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1B9985E18(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  _QWORD *v31;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236618);
  result = sub_1B99972AC();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v30 = a2;
    v8 = 0;
    v31 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v8 << 6);
      }
      else
      {
        v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v17 >= v12)
          goto LABEL_31;
        v18 = v31[v17];
        ++v8;
        if (!v18)
        {
          v8 = v17 + 1;
          if (v17 + 1 >= v12)
            goto LABEL_31;
          v18 = v31[v8];
          if (!v18)
          {
            v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_31:
              if ((v30 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_38;
              }
              v29 = 1 << *(_BYTE *)(v5 + 32);
              if (v29 >= 64)
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v31 = -1 << v29;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                v8 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_40;
                if (v8 >= v12)
                  goto LABEL_31;
                v18 = v31[v8];
                ++v19;
                if (v18)
                  goto LABEL_21;
              }
            }
            v8 = v19;
          }
        }
LABEL_21:
        v11 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      v20 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v16);
      v21 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v16);
      sub_1B9997318();
      sub_1B9997324();
      result = sub_1B9997330();
      v22 = -1 << *(_BYTE *)(v7 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v14) = v20;
      *(_BYTE *)(*(_QWORD *)(v7 + 56) + v14) = v21;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_1B99860DC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1B9985128(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1B99866BC();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1B9985B04(v15, a4 & 1);
  v21 = sub_1B9985128(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1B999730C();
  __break(1u);
  return result;
}

uint64_t sub_1B9986238(char a1, unsigned __int8 a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v4 = v3;
  v8 = *v3;
  v10 = sub_1B998521C(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_1B9986870();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v16[7] + v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_BYTE *)(v16[6] + v10) = a2;
    *(_BYTE *)(v16[7] + v10) = a1;
    v18 = v16[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_1B9985E18(result, a3 & 1);
  result = sub_1B998521C(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1B999730C();
  __break(1u);
  return result;
}

void *sub_1B9986360()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236638);
  v2 = *v0;
  v3 = sub_1B99972A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B9986508()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236630);
  v2 = *v0;
  v3 = sub_1B99972A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(v2 + 48) + 24 * v15;
    v18 = *(_QWORD *)v16;
    v17 = *(_QWORD *)(v16 + 8);
    LOBYTE(v16) = *(_BYTE *)(v16 + 16);
    v19 = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v20 = *(_QWORD *)(v4 + 48) + 24 * v15;
    *(_QWORD *)v20 = v18;
    *(_QWORD *)(v20 + 8) = v17;
    *(_BYTE *)(v20 + 16) = v16;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = v19;
    result = (void *)swift_bridgeObjectRetain();
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B99866BC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236620);
  v2 = *v0;
  v3 = sub_1B99972A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B9986870()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236618);
  v2 = *v0;
  v3 = sub_1B99972A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v20 = __clz(__rbit64(v18));
    v12 = (v18 - 1) & v18;
    v15 = v20 + (v9 << 6);
LABEL_12:
    v16 = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = v16;
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1B99869F8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1B9986A14(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1B9986A14(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236610);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1B99972C4();
  __break(1u);
  return result;
}

_QWORD *sub_1B9986B80(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = v4;
  v20 = a3;
  v9 = sub_1B99971D4();
  v21 = *(_QWORD *)(v9 - 8);
  v22 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1B99971C8();
  MEMORY[0x1E0C80A78](v12);
  v13 = sub_1B9997090();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = v20;
  v20 = sub_1B9987CD4();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a4, v13);
  v23 = MEMORY[0x1E0DEE9D8];
  sub_1B9987D10();
  v17 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236658);
  sub_1B9987D58();
  sub_1B999721C();
  (*(void (**)(char *, _QWORD, uint64_t))(v21 + 104))(v11, *MEMORY[0x1E0DEF8D0], v22);
  v18 = sub_1B99971E0();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a4, v13);
  v5[5] = v18;
  return v5;
}

uint64_t sub_1B9986D5C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1B9986D98(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  char *i;
  unsigned __int8 v5;
  char v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236618);
    v3 = (_QWORD *)sub_1B99972B8();
    for (i = (char *)(a1 + 33); ; i += 2)
    {
      v5 = *(i - 1);
      v6 = *i;
      result = sub_1B998521C(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v3[6] + result) = v5;
      *(_BYTE *)(v3[7] + result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E0];
  }
  return result;
}

void sub_1B9986E6C(uint64_t a1)
{
  uint64_t v1;

  sub_1B9984514(a1, *(unsigned __int8 *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

unint64_t sub_1B9986E7C()
{
  unint64_t result;

  result = qword_1EF2365C0;
  if (!qword_1EF2365C0)
  {
    result = MEMORY[0x1BCCC8308](&unk_1B999BAFC, &type metadata for IDS.Status);
    atomic_store(result, (unint64_t *)&qword_1EF2365C0);
  }
  return result;
}

unint64_t sub_1B9986EC4()
{
  unint64_t result;

  result = qword_1EF2365C8;
  if (!qword_1EF2365C8)
  {
    result = MEMORY[0x1BCCC8308](&unk_1B999BB64, &type metadata for IDS.Service);
    atomic_store(result, (unint64_t *)&qword_1EF2365C8);
  }
  return result;
}

unint64_t sub_1B9986F0C()
{
  unint64_t result;

  result = qword_1EF2365D8;
  if (!qword_1EF2365D8)
  {
    result = MEMORY[0x1BCCC8308](&unk_1B999BC1C, &type metadata for IDS.CachingLookup.CacheKey);
    atomic_store(result, (unint64_t *)&qword_1EF2365D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for IDS()
{
  return &type metadata for IDS;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_1B9986F78(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1B9986F80(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for IDS.Status()
{
  return &type metadata for IDS.Status;
}

uint64_t getEnumTagSinglePayload for ServiceAvailabilityAppEnum(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s20ContactsAutocomplete3IDSV7ServiceOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B9987074 + 4 * byte_1B999BAF5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B99870A8 + 4 * byte_1B999BAF0[v4]))();
}

uint64_t sub_1B99870A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B99870B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B99870B8);
  return result;
}

uint64_t sub_1B99870C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B99870CCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B99870D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B99870D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IDS.Service()
{
  return &type metadata for IDS.Service;
}

ValueMetadata *type metadata accessor for IDS.Logs()
{
  return &type metadata for IDS.Logs;
}

uint64_t type metadata accessor for IDS.LiveLookup()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for IDS.CachingLookup()
{
  return objc_opt_self();
}

uint64_t destroy for IDS.CachingLookup.CacheKey()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s20ContactsAutocomplete3IDSV13CachingLookupC8CacheKeyVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IDS.CachingLookup.CacheKey(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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

uint64_t assignWithTake for IDS.CachingLookup.CacheKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for IDS.CachingLookup.CacheKey(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IDS.CachingLookup.CacheKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IDS.CachingLookup.CacheKey()
{
  return &type metadata for IDS.CachingLookup.CacheKey;
}

uint64_t type metadata accessor for IDS.LookupSpy()
{
  return objc_opt_self();
}

uint64_t destroy for IDS.LookupSpy.StatusCallDescription()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s20ContactsAutocomplete3IDSV9LookupSpyC21StatusCallDescriptionVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IDS.LookupSpy.StatusCallDescription(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for IDS.LookupSpy.StatusCallDescription(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IDS.LookupSpy.StatusCallDescription(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IDS.LookupSpy.StatusCallDescription(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IDS.LookupSpy.StatusCallDescription()
{
  return &type metadata for IDS.LookupSpy.StatusCallDescription;
}

uint64_t type metadata accessor for IDS.LookupStub()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for IDS.LookupTestDouble()
{
  return objc_opt_self();
}

uint64_t sub_1B99874EC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236600);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1B9987550(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t i;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char isUniquelyReferenced_nonNull_native;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  int64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  _OWORD v35[2];
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[2];
  uint64_t v39;
  _OWORD v40[2];
  _OWORD v41[2];
  uint64_t v42;
  _OWORD v43[2];
  _OWORD v44[2];
  uint64_t v45;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236600);
  if (!a1)
  {
    *(_QWORD *)&v43[0] = sub_1B9982528(MEMORY[0x1E0DEE9D8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236600);
    return sub_1B9997180();
  }
  v2 = (_QWORD *)sub_1B9982528(MEMORY[0x1E0DEE9D8]);
  v30 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v31 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  for (i = 0; ; i = v32)
  {
    if (v5)
    {
      v7 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v32 = i;
      v8 = v7 | (i << 6);
    }
    else
    {
      v9 = i + 1;
      if (__OFADD__(i, 1))
        goto LABEL_47;
      if (v9 >= v31)
      {
LABEL_42:
        swift_release();
        *(_QWORD *)&v43[0] = v2;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236600);
        return sub_1B9997180();
      }
      v10 = *(_QWORD *)(v30 + 8 * v9);
      v11 = i + 1;
      if (!v10)
      {
        v11 = i + 2;
        if (i + 2 >= v31)
          goto LABEL_42;
        v10 = *(_QWORD *)(v30 + 8 * v11);
        if (!v10)
        {
          v11 = i + 3;
          if (i + 3 >= v31)
            goto LABEL_42;
          v10 = *(_QWORD *)(v30 + 8 * v11);
          if (!v10)
          {
            v11 = i + 4;
            if (i + 4 >= v31)
              goto LABEL_42;
            v10 = *(_QWORD *)(v30 + 8 * v11);
            if (!v10)
            {
              v12 = i + 5;
              if (i + 5 >= v31)
                goto LABEL_42;
              v10 = *(_QWORD *)(v30 + 8 * v12);
              if (!v10)
              {
                while (1)
                {
                  v11 = v12 + 1;
                  if (__OFADD__(v12, 1))
                    goto LABEL_48;
                  if (v11 >= v31)
                    goto LABEL_42;
                  v10 = *(_QWORD *)(v30 + 8 * v11);
                  ++v12;
                  if (v10)
                    goto LABEL_24;
                }
              }
              v11 = i + 5;
            }
          }
        }
      }
LABEL_24:
      v5 = (v10 - 1) & v10;
      v32 = v11;
      v8 = __clz(__rbit64(v10)) + (v11 << 6);
    }
    sub_1B99879D4(*(_QWORD *)(a1 + 48) + 40 * v8, (uint64_t)v43);
    v13 = a1;
    sub_1B9987A10(*(_QWORD *)(a1 + 56) + 32 * v8, (uint64_t)v44 + 8);
    v41[0] = v44[0];
    v41[1] = v44[1];
    v42 = v45;
    v40[0] = v43[0];
    v40[1] = v43[1];
    sub_1B99879D4((uint64_t)v40, (uint64_t)v35);
    sub_1B9987A10((uint64_t)v41 + 8, (uint64_t)v37);
    v38[0] = v35[0];
    v38[1] = v35[1];
    v39 = v36;
    swift_dynamicCast();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
    sub_1B99879D4((uint64_t)v40, (uint64_t)v35);
    sub_1B9987A10((uint64_t)v41 + 8, (uint64_t)v37);
    sub_1B9987A6C(v37, v38);
    swift_dynamicCast();
    sub_1B9987A7C((uint64_t)v35);
    v14 = v33 == 2 ? 1 : 2;
    v15 = v33 == 1 ? 0 : v14;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v35[0] = v2;
    v18 = sub_1B9985128(v33, v34);
    v19 = v2[2];
    v20 = (v17 & 1) == 0;
    v21 = v19 + v20;
    if (__OFADD__(v19, v20))
      break;
    v22 = v17;
    if (v2[3] >= v21)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v17 & 1) != 0)
          goto LABEL_5;
      }
      else
      {
        sub_1B9986360();
        v2 = *(_QWORD **)&v35[0];
        if ((v22 & 1) != 0)
          goto LABEL_5;
      }
    }
    else
    {
      sub_1B99854D4(v21, isUniquelyReferenced_nonNull_native);
      v2 = *(_QWORD **)&v35[0];
      v23 = sub_1B9985128(v33, v34);
      if ((v22 & 1) != (v24 & 1))
        goto LABEL_49;
      v18 = v23;
      if ((v22 & 1) != 0)
      {
LABEL_5:
        *(_BYTE *)(v2[7] + v18) = v15;
        goto LABEL_6;
      }
    }
    v2[(v18 >> 6) + 8] |= 1 << v18;
    v25 = (uint64_t *)(v2[6] + 16 * v18);
    *v25 = v33;
    v25[1] = v34;
    *(_BYTE *)(v2[7] + v18) = v15;
    v26 = v2[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_46;
    v2[2] = v28;
    swift_bridgeObjectRetain();
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B9987AB0((uint64_t)v40);
    a1 = v13;
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  result = sub_1B999730C();
  __break(1u);
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

uint64_t sub_1B99879D4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1B9987A10(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_OWORD *sub_1B9987A6C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B9987A7C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1B9987AB0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236608);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B9987AF0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1B99972C4();
  __break(1u);
  return result;
}

uint64_t sub_1B9987BE0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1B99972C4();
  __break(1u);
  return result;
}

unint64_t sub_1B9987CD4()
{
  unint64_t result;

  result = qword_1EF236648;
  if (!qword_1EF236648)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF236648);
  }
  return result;
}

unint64_t sub_1B9987D10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF236650;
  if (!qword_1EF236650)
  {
    v1 = sub_1B99971C8();
    result = MEMORY[0x1BCCC8308](MEMORY[0x1E0DEF828], v1);
    atomic_store(result, (unint64_t *)&qword_1EF236650);
  }
  return result;
}

unint64_t sub_1B9987D58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF236660;
  if (!qword_1EF236660)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF236658);
    result = MEMORY[0x1BCCC8308](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EF236660);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCC82FC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

ContactsAutocomplete::ServiceAvailabilityAppEnum_optional __swiftcall ServiceAvailabilityAppEnum.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  ContactsAutocomplete::ServiceAvailabilityAppEnum_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1B99972D0();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t ServiceAvailabilityAppEnum.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x616C696176616E75;
  if (*v0 != 1)
    v1 = 0x6E776F6E6B6E75;
  if (*v0)
    return v1;
  else
    return 0x6C62616C69617661;
}

uint64_t sub_1B9987F00(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1B9987F0C(*a1, *a2);
}

uint64_t sub_1B9987F0C(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xE900000000000065;
  v3 = 0x6C62616C69617661;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0x616C696176616E75;
    else
      v5 = 0x6E776F6E6B6E75;
    if (v4 == 1)
      v6 = 0xEB00000000656C62;
    else
      v6 = 0xE700000000000000;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x6C62616C69617661;
  v6 = 0xE900000000000065;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0x616C696176616E75;
    else
      v3 = 0x6E776F6E6B6E75;
    if (v7 == 1)
      v2 = 0xEB00000000656C62;
    else
      v2 = 0xE700000000000000;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1B9988034()
{
  sub_1B9997318();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  return sub_1B9997330();
}

uint64_t sub_1B99880E0()
{
  sub_1B9997120();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B9988168()
{
  sub_1B9997318();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  return sub_1B9997330();
}

ContactsAutocomplete::ServiceAvailabilityAppEnum_optional sub_1B9988210(Swift::String *a1)
{
  return ServiceAvailabilityAppEnum.init(rawValue:)(*a1);
}

void sub_1B998821C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE900000000000065;
  v4 = 0xEB00000000656C62;
  v5 = 0x616C696176616E75;
  if (v2 != 1)
  {
    v5 = 0x6E776F6E6B6E75;
    v4 = 0xE700000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x6C62616C69617661;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t static ServiceAvailabilityAppEnum.typeDisplayRepresentation.getter()
{
  return sub_1B9996FB8();
}

uint64_t sub_1B99882B8()
{
  return sub_1B9996FAC();
}

uint64_t sub_1B99882CC()
{
  return sub_1B9996FB8();
}

uint64_t sub_1B99882FC()
{
  sub_1B9988B44();
  return sub_1B9996D9C();
}

uint64_t sub_1B9988340()
{
  sub_1B9988AC0();
  return sub_1B9996FA0();
}

unint64_t sub_1B998837C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2366E8);
    v2 = (_QWORD *)sub_1B99972B8();
    v3 = *(_QWORD *)(a1 + 16);
  }
  else
  {
    v3 = 0;
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2366E0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v8 = (unsigned __int8 *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3)
  {
    v9 = &v8[*(int *)(v5 + 48)];
    v10 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v22[1] = a1;
    v11 = a1 + v10;
    v12 = *(_QWORD *)(v6 + 72);
    swift_retain();
    while (1)
    {
      sub_1B9988D7C(v11, (uint64_t)v8);
      v13 = *v8;
      result = sub_1B998852C(*v8);
      if ((v15 & 1) != 0)
        break;
      v16 = result;
      *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v2[6] + result) = v13;
      v17 = v2[7];
      v18 = sub_1B9996F70();
      result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v9, v18);
      v19 = v2[2];
      v20 = __OFADD__(v19, 1);
      v21 = v19 + 1;
      if (v20)
        goto LABEL_12;
      v2[2] = v21;
      v11 += v12;
      if (!--v3)
      {
        swift_release();
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  return result;
}

void *static ServiceAvailabilityAppEnum.allCases.getter()
{
  return &unk_1E70DDEA8;
}

void sub_1B998851C(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E70DDFC8;
}

unint64_t sub_1B998852C(unsigned __int8 a1)
{
  uint64_t v2;

  sub_1B9997318();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  v2 = sub_1B9997330();
  return sub_1B99885EC(a1, v2);
}

unint64_t sub_1B99885EC(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  char v12;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    while (1)
    {
      if (*(_BYTE *)(*(_QWORD *)(v2 + 48) + v4))
      {
        if (*(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) == 1)
        {
          v7 = 0x616C696176616E75;
          v8 = 0xEB00000000656C62;
          v9 = a1;
          if (!a1)
            goto LABEL_17;
        }
        else
        {
          v8 = 0xE700000000000000;
          v7 = 0x6E776F6E6B6E75;
          v9 = a1;
          if (!a1)
          {
LABEL_17:
            v11 = 0xE900000000000065;
            if (v7 != 0x6C62616C69617661)
              goto LABEL_19;
            goto LABEL_18;
          }
        }
      }
      else
      {
        v7 = 0x6C62616C69617661;
        v8 = 0xE900000000000065;
        v9 = a1;
        if (!a1)
          goto LABEL_17;
      }
      if (v9 == 1)
        v10 = 0x616C696176616E75;
      else
        v10 = 0x6E776F6E6B6E75;
      if (v9 == 1)
        v11 = 0xEB00000000656C62;
      else
        v11 = 0xE700000000000000;
      if (v7 != v10)
        goto LABEL_19;
LABEL_18:
      if (v8 == v11)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_19:
      v12 = sub_1B99972F4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        v4 = (v4 + 1) & v6;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
  }
  return v4;
}

unint64_t _s20ContactsAutocomplete26ServiceAvailabilityAppEnumO26caseDisplayRepresentationsSDyAC0E7Intents0H14RepresentationVGvgZ_0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _BYTE *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2366D8);
  v0 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF2366E0) - 8);
  v1 = *(_QWORD *)(v0 + 72);
  v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B999BDB0;
  v4 = (_BYTE *)(v3 + v2);
  *v4 = 0;
  sub_1B9996F58();
  v4[v1] = 1;
  sub_1B9996F58();
  v4[2 * v1] = 2;
  sub_1B9996F58();
  return sub_1B998837C(v3);
}

unint64_t sub_1B99888BC()
{
  unint64_t result;

  result = qword_1EF236668;
  if (!qword_1EF236668)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAvailabilityAppEnum, &type metadata for ServiceAvailabilityAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF236668);
  }
  return result;
}

unint64_t sub_1B9988904()
{
  unint64_t result;

  result = qword_1EF236670;
  if (!qword_1EF236670)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAvailabilityAppEnum, &type metadata for ServiceAvailabilityAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF236670);
  }
  return result;
}

unint64_t sub_1B998894C()
{
  unint64_t result;

  result = qword_1EF236678;
  if (!qword_1EF236678)
  {
    result = MEMORY[0x1BCCC8308]("EHt-dr", &type metadata for ServiceAvailabilityAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF236678);
  }
  return result;
}

unint64_t sub_1B9988994()
{
  unint64_t result;

  result = qword_1EF236680;
  if (!qword_1EF236680)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAvailabilityAppEnum, &type metadata for ServiceAvailabilityAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF236680);
  }
  return result;
}

uint64_t sub_1B99889D8()
{
  return MEMORY[0x1E0DEA9E0];
}

unint64_t sub_1B99889E8()
{
  unint64_t result;

  result = qword_1EF236688;
  if (!qword_1EF236688)
  {
    result = MEMORY[0x1BCCC8308]("-Ht-4r", &type metadata for ServiceAvailabilityAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF236688);
  }
  return result;
}

unint64_t sub_1B9988A30()
{
  unint64_t result;

  result = qword_1EF236690;
  if (!qword_1EF236690)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAvailabilityAppEnum, &type metadata for ServiceAvailabilityAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF236690);
  }
  return result;
}

unint64_t sub_1B9988A78()
{
  unint64_t result;

  result = qword_1EF236698;
  if (!qword_1EF236698)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAvailabilityAppEnum, &type metadata for ServiceAvailabilityAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF236698);
  }
  return result;
}

unint64_t sub_1B9988AC0()
{
  unint64_t result;

  result = qword_1EF2366A0;
  if (!qword_1EF2366A0)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAvailabilityAppEnum, &type metadata for ServiceAvailabilityAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF2366A0);
  }
  return result;
}

uint64_t sub_1B9988B04()
{
  sub_1B9988B44();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1B9988B44()
{
  unint64_t result;

  result = qword_1EF2366A8;
  if (!qword_1EF2366A8)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAvailabilityAppEnum, &type metadata for ServiceAvailabilityAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF2366A8);
  }
  return result;
}

unint64_t sub_1B9988B8C()
{
  unint64_t result;

  result = qword_1EF2366B0;
  if (!qword_1EF2366B0)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAvailabilityAppEnum, &type metadata for ServiceAvailabilityAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF2366B0);
  }
  return result;
}

unint64_t sub_1B9988BD4()
{
  unint64_t result;

  result = qword_1EF2366B8;
  if (!qword_1EF2366B8)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAvailabilityAppEnum, &type metadata for ServiceAvailabilityAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF2366B8);
  }
  return result;
}

unint64_t sub_1B9988C1C()
{
  unint64_t result;

  result = qword_1EF2366C0;
  if (!qword_1EF2366C0)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAvailabilityAppEnum, &type metadata for ServiceAvailabilityAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF2366C0);
  }
  return result;
}

unint64_t sub_1B9988C64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF2366C8;
  if (!qword_1EF2366C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF2366D0);
    result = MEMORY[0x1BCCC8308](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EF2366C8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ServiceAvailabilityAppEnum(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B9988CFC + 4 * byte_1B999BDC5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B9988D30 + 4 * byte_1B999BDC0[v4]))();
}

uint64_t sub_1B9988D30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9988D38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B9988D40);
  return result;
}

uint64_t sub_1B9988D4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B9988D54);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B9988D58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9988D60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceAvailabilityAppEnum()
{
  return &type metadata for ServiceAvailabilityAppEnum;
}

uint64_t sub_1B9988D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2366E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ContactsAutocomplete::ComposeRecipientStatus_optional __swiftcall ComposeRecipientStatus.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  ContactsAutocomplete::ComposeRecipientStatus_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1B99972D0();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t ComposeRecipientStatus.rawValue.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000011;
  if (*v0 != 1)
    v1 = 0x736552796C6C7566;
  if (*v0)
    return v1;
  else
    return 0x766C6F7365726E75;
}

uint64_t sub_1B9988E8C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1B9988E98(*a1, *a2);
}

uint64_t sub_1B9988E98(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xEA00000000006465;
  v3 = 0x766C6F7365726E75;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD000000000000011;
    else
      v5 = 0x736552796C6C7566;
    if (v4 == 1)
      v6 = 0x80000001B99A21F0;
    else
      v6 = 0xED00006465766C6FLL;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x766C6F7365726E75;
  v6 = 0xEA00000000006465;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0xD000000000000011;
    else
      v3 = 0x736552796C6C7566;
    if (v7 == 1)
      v2 = 0x80000001B99A21F0;
    else
      v2 = 0xED00006465766C6FLL;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1B9988FC8()
{
  sub_1B9997318();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  return sub_1B9997330();
}

uint64_t sub_1B998907C()
{
  sub_1B9997120();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B998910C()
{
  sub_1B9997318();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  return sub_1B9997330();
}

ContactsAutocomplete::ComposeRecipientStatus_optional sub_1B99891BC(Swift::String *a1)
{
  return ComposeRecipientStatus.init(rawValue:)(*a1);
}

void sub_1B99891C8(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xEA00000000006465;
  v4 = 0x80000001B99A21F0;
  v5 = 0xD000000000000011;
  if (v2 != 1)
  {
    v5 = 0x736552796C6C7566;
    v4 = 0xED00006465766C6FLL;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x766C6F7365726E75;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t static ComposeRecipientStatus.typeDisplayRepresentation.getter()
{
  return sub_1B9996FB8();
}

uint64_t sub_1B9989260()
{
  return sub_1B9996FB8();
}

uint64_t sub_1B9989284()
{
  sub_1B9989AD4();
  return sub_1B9996D9C();
}

uint64_t sub_1B99892C8()
{
  sub_1B9989A50();
  return sub_1B9996FA0();
}

unint64_t sub_1B9989304(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236770);
    v2 = (_QWORD *)sub_1B99972B8();
    v3 = *(_QWORD *)(a1 + 16);
  }
  else
  {
    v3 = 0;
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236768);
  v5 = MEMORY[0x1E0C80A78](v4);
  v8 = (unsigned __int8 *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3)
  {
    v9 = &v8[*(int *)(v5 + 48)];
    v10 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v22[1] = a1;
    v11 = a1 + v10;
    v12 = *(_QWORD *)(v6 + 72);
    swift_retain();
    while (1)
    {
      sub_1B9989D0C(v11, (uint64_t)v8);
      v13 = *v8;
      result = sub_1B99894B4(*v8);
      if ((v15 & 1) != 0)
        break;
      v16 = result;
      *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v2[6] + result) = v13;
      v17 = v2[7];
      v18 = sub_1B9996F70();
      result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v9, v18);
      v19 = v2[2];
      v20 = __OFADD__(v19, 1);
      v21 = v19 + 1;
      if (v20)
        goto LABEL_12;
      v2[2] = v21;
      v11 += v12;
      if (!--v3)
      {
        swift_release();
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  return result;
}

void *static ComposeRecipientStatus.allCases.getter()
{
  return &unk_1E70DDD60;
}

void sub_1B99894A4(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E70DDE80;
}

unint64_t sub_1B99894B4(unsigned __int8 a1)
{
  uint64_t v2;

  sub_1B9997318();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  v2 = sub_1B9997330();
  return sub_1B998957C(a1, v2);
}

unint64_t sub_1B998957C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  char v12;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    while (1)
    {
      if (*(_BYTE *)(*(_QWORD *)(v2 + 48) + v4))
      {
        if (*(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) == 1)
        {
          v7 = 0x80000001B99A21F0;
          v8 = 0xD000000000000011;
          v9 = a1;
          if (!a1)
            goto LABEL_17;
        }
        else
        {
          v8 = 0x736552796C6C7566;
          v7 = 0xED00006465766C6FLL;
          v9 = a1;
          if (!a1)
          {
LABEL_17:
            v11 = 0xEA00000000006465;
            if (v8 != 0x766C6F7365726E75)
              goto LABEL_19;
            goto LABEL_18;
          }
        }
      }
      else
      {
        v8 = 0x766C6F7365726E75;
        v7 = 0xEA00000000006465;
        v9 = a1;
        if (!a1)
          goto LABEL_17;
      }
      if (v9 == 1)
        v10 = 0xD000000000000011;
      else
        v10 = 0x736552796C6C7566;
      if (v9 == 1)
        v11 = 0x80000001B99A21F0;
      else
        v11 = 0xED00006465766C6FLL;
      if (v8 != v10)
        goto LABEL_19;
LABEL_18:
      if (v7 == v11)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_19:
      v12 = sub_1B99972F4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        v4 = (v4 + 1) & v6;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
  }
  return v4;
}

unint64_t _s20ContactsAutocomplete22ComposeRecipientStatusO26caseDisplayRepresentationsSDyAC10AppIntents0G14RepresentationVGvgZ_0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _BYTE *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236760);
  v0 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF236768) - 8);
  v1 = *(_QWORD *)(v0 + 72);
  v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B999BDB0;
  v4 = (_BYTE *)(v3 + v2);
  *v4 = 0;
  sub_1B9996F58();
  v4[v1] = 1;
  sub_1B9996F58();
  v4[2 * v1] = 2;
  sub_1B9996F58();
  return sub_1B9989304(v3);
}

unint64_t sub_1B9989858()
{
  unint64_t result;

  result = qword_1EF2366F0;
  if (!qword_1EF2366F0)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ComposeRecipientStatus, &type metadata for ComposeRecipientStatus);
    atomic_store(result, (unint64_t *)&qword_1EF2366F0);
  }
  return result;
}

unint64_t sub_1B99898A0()
{
  unint64_t result;

  result = qword_1EF2366F8;
  if (!qword_1EF2366F8)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ComposeRecipientStatus, &type metadata for ComposeRecipientStatus);
    atomic_store(result, (unint64_t *)&qword_1EF2366F8);
  }
  return result;
}

unint64_t sub_1B99898E8()
{
  unint64_t result;

  result = qword_1EF236700;
  if (!qword_1EF236700)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ComposeRecipientStatus, &type metadata for ComposeRecipientStatus);
    atomic_store(result, (unint64_t *)&qword_1EF236700);
  }
  return result;
}

unint64_t sub_1B9989930()
{
  unint64_t result;

  result = qword_1EF236708;
  if (!qword_1EF236708)
  {
    atomic_store(result, (unint64_t *)&qword_1EF236708);
  }
  return result;
}

unint64_t sub_1B9989978()
{
  unint64_t result;

  result = qword_1EF236710;
  if (!qword_1EF236710)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ComposeRecipientStatus, &type metadata for ComposeRecipientStatus);
    atomic_store(result, (unint64_t *)&qword_1EF236710);
  }
  return result;
}

unint64_t sub_1B99899C0()
{
  unint64_t result;

  result = qword_1EF236718;
  if (!qword_1EF236718)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ComposeRecipientStatus, &type metadata for ComposeRecipientStatus);
    atomic_store(result, (unint64_t *)&qword_1EF236718);
  }
  return result;
}

unint64_t sub_1B9989A08()
{
  unint64_t result;

  result = qword_1EF236720;
  if (!qword_1EF236720)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ComposeRecipientStatus, &type metadata for ComposeRecipientStatus);
    atomic_store(result, (unint64_t *)&qword_1EF236720);
  }
  return result;
}

unint64_t sub_1B9989A50()
{
  unint64_t result;

  result = qword_1EF236728;
  if (!qword_1EF236728)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ComposeRecipientStatus, &type metadata for ComposeRecipientStatus);
    atomic_store(result, (unint64_t *)&qword_1EF236728);
  }
  return result;
}

uint64_t sub_1B9989A94()
{
  sub_1B9989AD4();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1B9989AD4()
{
  unint64_t result;

  result = qword_1EF236730;
  if (!qword_1EF236730)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ComposeRecipientStatus, &type metadata for ComposeRecipientStatus);
    atomic_store(result, (unint64_t *)&qword_1EF236730);
  }
  return result;
}

unint64_t sub_1B9989B1C()
{
  unint64_t result;

  result = qword_1EF236738;
  if (!qword_1EF236738)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ComposeRecipientStatus, &type metadata for ComposeRecipientStatus);
    atomic_store(result, (unint64_t *)&qword_1EF236738);
  }
  return result;
}

unint64_t sub_1B9989B64()
{
  unint64_t result;

  result = qword_1EF236740;
  if (!qword_1EF236740)
  {
    result = MEMORY[0x1BCCC8308]("UFt-pn", &type metadata for ComposeRecipientStatus);
    atomic_store(result, (unint64_t *)&qword_1EF236740);
  }
  return result;
}

unint64_t sub_1B9989BAC()
{
  unint64_t result;

  result = qword_1EF236748;
  if (!qword_1EF236748)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ComposeRecipientStatus, &type metadata for ComposeRecipientStatus);
    atomic_store(result, (unint64_t *)&qword_1EF236748);
  }
  return result;
}

unint64_t sub_1B9989BF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF236750;
  if (!qword_1EF236750)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF236758);
    result = MEMORY[0x1BCCC8308](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EF236750);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ComposeRecipientStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B9989C8C + 4 * byte_1B999C095[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B9989CC0 + 4 * byte_1B999C090[v4]))();
}

uint64_t sub_1B9989CC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9989CC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B9989CD0);
  return result;
}

uint64_t sub_1B9989CDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B9989CE4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B9989CE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9989CF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ComposeRecipientStatus()
{
  return &type metadata for ComposeRecipientStatus;
}

uint64_t sub_1B9989D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static CompleteNameIntent.openAppWhenRun.getter()
{
  return 0;
}

uint64_t static CompleteNameIntent.isDiscoverable.getter()
{
  swift_beginAccess();
  return byte_1EF237D40;
}

uint64_t static CompleteNameIntent.isDiscoverable.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_1EF237D40 = a1;
  return result;
}

uint64_t (*static CompleteNameIntent.isDiscoverable.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B9989E20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1B99970F0();
  MEMORY[0x1E0C80A78](v0);
  v1 = sub_1B9996FF4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1B9997054();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1B9997000();
  __swift_allocate_value_buffer(v6, qword_1EF237D50);
  __swift_project_value_buffer(v6, (uint64_t)qword_1EF237D50);
  sub_1B99970E4();
  sub_1B9997048();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0CAF9B8], v1);
  return sub_1B999700C();
}

uint64_t static CompleteNameIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF237D48 != -1)
    swift_once();
  v2 = sub_1B9997000();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF237D50);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1B998A020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v0 = sub_1B99970F0();
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236778);
  MEMORY[0x1E0C80A78](v1);
  v12[0] = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1B9996FF4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B9997054();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1B9997000();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = sub_1B9996F40();
  __swift_allocate_value_buffer(v10, qword_1EF237D70);
  __swift_project_value_buffer(v10, (uint64_t)qword_1EF237D70);
  sub_1B99970E4();
  sub_1B9997048();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CAF9B8], v3);
  sub_1B999700C();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_1B9996F4C();
}

uint64_t static CompleteNameIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF237D68 != -1)
    swift_once();
  v2 = sub_1B9996F40();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF237D70);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static CompleteNameIntent.description.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_1EF237D68 != -1)
    swift_once();
  v2 = sub_1B9996F40();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF237D70);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CompleteNameIntent.description.modify())()
{
  uint64_t v0;

  if (qword_1EF237D68 != -1)
    swift_once();
  v0 = sub_1B9996F40();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF237D70);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CompleteNameIntent.names.getter()
{
  uint64_t v1;

  sub_1B9996F04();
  return v1;
}

uint64_t sub_1B998A454@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1B9996F04();
  *a1 = v3;
  return result;
}

uint64_t sub_1B998A48C()
{
  swift_bridgeObjectRetain();
  return sub_1B9996F10();
}

uint64_t CompleteNameIntent.names.setter()
{
  return sub_1B9996F10();
}

uint64_t (*CompleteNameIntent.names.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1B9996EF8();
  return sub_1B998A53C;
}

uint64_t CompleteNameIntent.$names.getter()
{
  return sub_1B9996F1C();
}

uint64_t CompleteNameIntent.services.getter()
{
  uint64_t v1;

  sub_1B9996F04();
  return v1;
}

uint64_t sub_1B998A590@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1B9996F04();
  *a1 = v3;
  return result;
}

uint64_t sub_1B998A5C8()
{
  swift_bridgeObjectRetain();
  return sub_1B9996F10();
}

uint64_t CompleteNameIntent.services.setter()
{
  return sub_1B9996F10();
}

uint64_t (*CompleteNameIntent.services.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1B9996EF8();
  return sub_1B998A53C;
}

unint64_t sub_1B998A678()
{
  unint64_t result;

  result = qword_1EF2367A0;
  if (!qword_1EF2367A0)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAppEnum, &type metadata for ServiceAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF2367A0);
  }
  return result;
}

unint64_t sub_1B998A6BC()
{
  unint64_t result;

  result = qword_1EF2367A8;
  if (!qword_1EF2367A8)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAppEnum, &type metadata for ServiceAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF2367A8);
  }
  return result;
}

uint64_t CompleteNameIntent.$services.getter()
{
  return sub_1B9996F1C();
}

_QWORD *CompleteNameIntent.init()@<X0>(uint64_t *a1@<X8>)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t (*v43)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  id v49;
  _QWORD *result;
  _QWORD v51[3];
  char *v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int v55;
  void (*v56)(char *);
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t);
  unsigned int v62;
  char *v63;
  void (*v64)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t *v70;
  __int128 v71[2];

  v70 = a1;
  v1 = sub_1B99970F0();
  v2 = MEMORY[0x1E0C80A78](v1);
  v66 = (char *)v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x1E0C80A78](v2);
  v68 = (char *)v51 - v5;
  v6 = MEMORY[0x1E0C80A78](v4);
  MEMORY[0x1E0C80A78](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236778);
  v8 = MEMORY[0x1E0C80A78](v7);
  v67 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v52 = (char *)v51 - v10;
  v11 = sub_1B9996FF4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = v11;
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1B9997054();
  MEMORY[0x1E0C80A78](v16);
  v17 = sub_1B9997000();
  v18 = *(_QWORD *)(v17 - 8);
  v65 = v17;
  v19 = MEMORY[0x1E0C80A78](v17);
  v69 = (char *)v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v63 = (char *)v51 - v21;
  sub_1B99970E4();
  sub_1B9997048();
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 104);
  v62 = *MEMORY[0x1E0CAF9B8];
  v22 = v62;
  v60 = v13;
  v23(v15, v62, v13);
  v61 = v23;
  sub_1B999700C();
  sub_1B99970E4();
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236780);
  sub_1B9997048();
  v23(v15, v22, v13);
  v24 = v52;
  sub_1B999700C();
  v64 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56);
  v64(v24, 0, 1, v17);
  *(_QWORD *)&v71[0] = 0;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236788);
  v51[2] = v51;
  MEMORY[0x1E0C80A78](v25);
  v27 = (char *)v51 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_1B99970D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v27, 1, 1, v28);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236790);
  v51[1] = v51;
  v30 = *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64);
  MEMORY[0x1E0C80A78](v29);
  v59 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0;
  v31 = (char *)v51 - v59;
  v32 = sub_1B9996DFC();
  v54 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56);
  v54(v31, 1, 1, v32);
  v33 = sub_1B9996F94();
  v34 = *(_QWORD *)(v33 - 8);
  v57 = v33;
  v35 = *(_QWORD *)(v34 + 64);
  MEMORY[0x1E0C80A78](v33);
  v58 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0;
  v55 = *MEMORY[0x1E0C91740];
  v56 = *(void (**)(char *))(v36 + 104);
  v56((char *)v51 - v58);
  *v70 = sub_1B9996F34();
  sub_1B99970E4();
  sub_1B9997048();
  v37 = v62;
  v38 = v60;
  v39 = v61;
  v61(v15, v62, v60);
  sub_1B999700C();
  sub_1B99970E4();
  v66 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EF236798);
  sub_1B9997048();
  v39(v15, v37, v38);
  v40 = v67;
  sub_1B999700C();
  v41 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v64)(v40, 0, 1, v65);
  *(_QWORD *)&v71[0] = 0;
  MEMORY[0x1E0C80A78](v41);
  v42 = v59;
  v43 = (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v54;
  v44 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v54)((char *)v51 - v59, 1, 1, v32);
  MEMORY[0x1E0C80A78](v44);
  v45 = v43((char *)v51 - v42, 1, 1, v32);
  MEMORY[0x1E0C80A78](v45);
  ((void (*)(char *, _QWORD, uint64_t))v56)((char *)v51 - v58, v55, v57);
  sub_1B998A678();
  sub_1B999724C();
  sub_1B998A6BC();
  v46 = sub_1B9996F28();
  v47 = v70;
  v70[1] = v46;
  v48 = type metadata accessor for AutocompleteStore();
  v49 = sub_1B998F594();
  sub_1B998F5B8((uint64_t *)v71);
  result = sub_1B998F5F4((uint64_t)v49, v71);
  v47[5] = v48;
  v47[6] = (uint64_t)&off_1E70DD9B0;
  v47[2] = (uint64_t)result;
  return result;
}

uint64_t CompleteNameIntent.perform()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[4] = a1;
  v2[5] = v1;
  v2[6] = *(_QWORD *)(type metadata accessor for ComposeRecipient(0) - 8);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  v2[9] = *(_QWORD *)(type metadata accessor for ComposeRecipientEntity() - 8);
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B998AEFC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[5];
  sub_1B9996F04();
  v2 = nullsub_1(v0[2], &unk_1E70DDCB0);
  v4 = v3;
  v0[11] = v2;
  v0[12] = v3;
  v5 = v1 + 2;
  v6 = v1[5];
  v7 = v1[6];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v7 + 8) + *(_QWORD *)(v7 + 8));
  v8 = (_QWORD *)swift_task_alloc();
  v0[13] = v8;
  *v8 = v0;
  v8[1] = sub_1B998AFB4;
  return v10(v2, v4, v6, v7);
}

uint64_t sub_1B998AFB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 112) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v4 + 120) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_1B998B038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 120);
  type metadata accessor for CombinesRecipients();
  v2 = sub_1B997F4B8();
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 80))(v1);
  swift_bridgeObjectRelease();
  swift_release();
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = *(_QWORD *)(v0 + 72);
    v6 = *(_QWORD *)(v0 + 48);
    v17 = MEMORY[0x1E0DEE9D8];
    sub_1B998BA64(0, v4, 0);
    v7 = v3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v8 = *(_QWORD *)(v6 + 72);
    v9 = v17;
    do
    {
      v10 = *(uint64_t **)(v0 + 80);
      v12 = *(_QWORD *)(v0 + 56);
      v11 = *(_QWORD *)(v0 + 64);
      sub_1B998BA80(v7, v11);
      sub_1B998BA80(v11, v12);
      sub_1B9993A04(v12, v10);
      sub_1B998BAC4(v11);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B998BA64(0, *(_QWORD *)(v9 + 16) + 1, 1);
        v9 = v17;
      }
      v14 = *(_QWORD *)(v9 + 16);
      v13 = *(_QWORD *)(v9 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_1B998BA64(v13 > 1, v14 + 1, 1);
        v9 = v17;
      }
      v15 = *(_QWORD *)(v0 + 80);
      *(_QWORD *)(v9 + 16) = v14 + 1;
      sub_1B998BB00(v15, v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v14);
      v7 += v8;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x1E0DEE9D8];
  }
  *(_QWORD *)(v0 + 24) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2367B8);
  sub_1B998BDBC(&qword_1EF2367C0, MEMORY[0x1E0C91CD0]);
  sub_1B9996E98();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B998B250()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B998B2B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF237D48 != -1)
    swift_once();
  v2 = sub_1B9997000();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF237D50);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1B998B324()
{
  return 0;
}

uint64_t sub_1B998B32C()
{
  return sub_1B9996DCC();
}

uint64_t sub_1B998B340()
{
  swift_beginAccess();
  return byte_1EF237D40;
}

uint64_t sub_1B998B380()
{
  return sub_1B9996DC0();
}

uint64_t sub_1B998B394()
{
  return sub_1B9996DB4();
}

uint64_t sub_1B998B3A8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1B998C860;
  return CompleteNameIntent.perform()(a1);
}

uint64_t sub_1B998B3FC()
{
  sub_1B998BB84();
  return sub_1B9996DD8();
}

void sub_1B998B428(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t AutocompleteComposeRecipientQuery.init()@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2367D0);
  if (qword_1EF237D88 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1B9997234();
  sub_1B9996D90();
  sub_1B9996D84();
  *a1 = sub_1B9996D78();
  type metadata accessor for AutocompleteComposeRecipientQuery();
  return sub_1B999706C();
}

uint64_t AutocompleteComposeRecipientQuery.entities(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[3] = a1;
  v2[4] = v1;
  v3 = sub_1B9997078();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B998B5AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v5 = type metadata accessor for AutocompleteComposeRecipientQuery();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4 + *(int *)(v5 + 20), v3);
  swift_bridgeObjectRetain_n();
  v6 = sub_1B9997060();
  v7 = sub_1B99971BC();
  if (os_log_type_enabled(v6, v7))
  {
    v18 = *(_QWORD *)(v0 + 48);
    v19 = *(_QWORD *)(v0 + 40);
    v20 = *(_QWORD *)(v0 + 56);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v21 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = swift_bridgeObjectRetain();
    v11 = MEMORY[0x1BCCC7B04](v10, MEMORY[0x1E0DEA968]);
    v13 = v12;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 16) = sub_1B9984AE8(v11, v13, &v21);
    sub_1B9997204();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B9950000, v6, v7, "Querying for identifiers %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCC83A4](v9, -1, -1);
    MEMORY[0x1BCCC83A4](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 48);
    v14 = *(_QWORD *)(v0 + 56);
    v16 = *(_QWORD *)(v0 + 40);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x1E0DEE9D8]);
}

uint64_t sub_1B998B7C0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1B998B80C;
  return AutocompleteComposeRecipientQuery.entities(for:)(a1);
}

uint64_t sub_1B998B80C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_1B998B860()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1B998B8CC;
  return sub_1B9996DE4();
}

uint64_t sub_1B998B8CC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B998B914()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_1B998117C(&qword_1EF236858, (uint64_t (*)(uint64_t))type metadata accessor for AutocompleteComposeRecipientQuery, (uint64_t)&protocol conformance descriptor for AutocompleteComposeRecipientQuery);
  *v1 = v0;
  v1[1] = sub_1B998C860;
  return sub_1B9996DF0();
}

uint64_t sub_1B998B998()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1B998B8CC;
  return sub_1B9996F7C();
}

uint64_t sub_1B998BA04()
{
  return MEMORY[0x1BCCC7930]() & 1;
}

void sub_1B998BA1C()
{
  strcpy((char *)&qword_1EF238F78, "entityProvider");
  unk_1EF238F87 = -18;
}

uint64_t ComposeRecipientEntityProvider.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ComposeRecipientEntityProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1B998BA64(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1B998C680(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1B998BA80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ComposeRecipient(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B998BAC4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ComposeRecipient(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B998BB00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ComposeRecipientEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for AutocompleteComposeRecipientQuery()
{
  uint64_t result;

  result = qword_1EF238190;
  if (!qword_1EF238190)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1B998BB84()
{
  unint64_t result;

  result = qword_1EF2367E0;
  if (!qword_1EF2367E0)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for CompleteNameIntent, &type metadata for CompleteNameIntent);
    atomic_store(result, (unint64_t *)&qword_1EF2367E0);
  }
  return result;
}

unint64_t sub_1B998BBCC()
{
  unint64_t result;

  result = qword_1EF2367E8;
  if (!qword_1EF2367E8)
  {
    result = MEMORY[0x1BCCC8308]("\rFt-tm", &type metadata for CompleteNameIntent);
    atomic_store(result, (unint64_t *)&qword_1EF2367E8);
  }
  return result;
}

unint64_t sub_1B998BC14()
{
  unint64_t result;

  result = qword_1EF2367F0;
  if (!qword_1EF2367F0)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for CompleteNameIntent, &type metadata for CompleteNameIntent);
    atomic_store(result, (unint64_t *)&qword_1EF2367F0);
  }
  return result;
}

uint64_t sub_1B998BC58()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1B998BC7C()
{
  sub_1B998BB84();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B998BCBC()
{
  return sub_1B998117C(&qword_1EF236800, (uint64_t (*)(uint64_t))type metadata accessor for AutocompleteComposeRecipientQuery, (uint64_t)&protocol conformance descriptor for AutocompleteComposeRecipientQuery);
}

uint64_t sub_1B998BCE8()
{
  return sub_1B998117C(&qword_1EF236808, (uint64_t (*)(uint64_t))type metadata accessor for AutocompleteComposeRecipientQuery, (uint64_t)&protocol conformance descriptor for AutocompleteComposeRecipientQuery);
}

uint64_t sub_1B998BD14()
{
  return sub_1B998117C(qword_1EF236810, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
}

uint64_t sub_1B998BD40()
{
  return sub_1B998117C(&qword_1EF236828, (uint64_t (*)(uint64_t))type metadata accessor for AutocompleteComposeRecipientQuery, (uint64_t)&protocol conformance descriptor for AutocompleteComposeRecipientQuery);
}

uint64_t sub_1B998BD6C()
{
  return sub_1B998117C(&qword_1EF2367C8, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
}

uint64_t sub_1B998BD98()
{
  return sub_1B998BDBC(qword_1EF236830, MEMORY[0x1E0C91CD8]);
}

uint64_t sub_1B998BDBC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF2367B8);
    v6 = sub_1B998117C(&qword_1EF2367C8, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
    result = MEMORY[0x1BCCC8308](a2, v5, &v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s6HandleVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CompleteNameIntent(uint64_t a1)
{
  swift_release();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 16);
}

uint64_t initializeWithCopy for CompleteNameIntent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = a2 + 16;
  v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v5;
  v6 = v5;
  v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  swift_retain();
  v7(a1 + 16, v4, v6);
  return a1;
}

_QWORD *assignWithCopy for CompleteNameIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CompleteNameIntent(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompleteNameIntent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CompleteNameIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CompleteNameIntent()
{
  return &type metadata for CompleteNameIntent;
}

uint64_t *initializeBufferWithCopyOfBuffer for AutocompleteComposeRecipientQuery(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_1B9997078();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_retain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for AutocompleteComposeRecipientQuery(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_1B9997078();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for AutocompleteComposeRecipientQuery(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1B9997078();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_retain();
  v8(v5, v6, v7);
  return a1;
}

_QWORD *assignWithCopy for AutocompleteComposeRecipientQuery(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1B9997078();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *initializeWithTake for AutocompleteComposeRecipientQuery(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1B9997078();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for AutocompleteComposeRecipientQuery(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1B9997078();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutocompleteComposeRecipientQuery()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B998C490(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1B9997078();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AutocompleteComposeRecipientQuery()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_1B998C518(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_1B9997078();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_1B998C58C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B9997078();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for ComposeRecipientEntityProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for ComposeRecipientEntityProvider()
{
  return swift_lookUpClassMethod();
}

unint64_t sub_1B998C634()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF236848;
  if (!qword_1EF236848)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF236850);
    result = MEMORY[0x1BCCC8308](MEMORY[0x1E0C915A8], v1);
    atomic_store(result, (unint64_t *)&qword_1EF236848);
  }
  return result;
}

uint64_t sub_1B998C680(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236860);
  v10 = *(_QWORD *)(type metadata accessor for ComposeRecipientEntity() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for ComposeRecipientEntity() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_1B99972C4();
  __break(1u);
  return result;
}

uint64_t destroy for ComposeRecipientFetchRequest()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s20ContactsAutocomplete28ComposeRecipientFetchRequestVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ComposeRecipientFetchRequest(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for ComposeRecipientFetchRequest(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComposeRecipientFetchRequest(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ComposeRecipientFetchRequest(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ComposeRecipientFetchRequest()
{
  return &type metadata for ComposeRecipientFetchRequest;
}

uint64_t sub_1B998CA00(uint64_t a1, uint64_t a2)
{
  return sub_1B998CFF8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

uint64_t sub_1B998CA1C()
{
  sub_1B9997318();
  sub_1B9997324();
  sub_1B9997120();
  return sub_1B9997330();
}

uint64_t sub_1B998CA7C()
{
  sub_1B9997324();
  return sub_1B9997120();
}

uint64_t sub_1B998CABC()
{
  sub_1B9997318();
  sub_1B9997324();
  sub_1B9997120();
  return sub_1B9997330();
}

uint64_t sub_1B998CB18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      result = sub_1B9997324();
      break;
    default:
      sub_1B9997324();
      result = sub_1B9997120();
      break;
  }
  return result;
}

uint64_t sub_1B998CBF0(uint64_t *a1, uint64_t a2)
{
  return sub_1B998D05C(*a1, a1[1], *(_QWORD *)a2, *(_QWORD *)(a2 + 8));
}

uint64_t sub_1B998CC04()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];

  v1 = *v0;
  v2 = v0[1];
  sub_1B9997318();
  sub_1B998CB18((uint64_t)v4, v1, v2);
  return sub_1B9997330();
}

uint64_t sub_1B998CC4C(uint64_t a1)
{
  uint64_t *v1;

  return sub_1B998CB18(a1, *v1, v1[1]);
}

uint64_t sub_1B998CC54()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];

  v1 = *v0;
  v2 = v0[1];
  sub_1B9997318();
  sub_1B998CB18((uint64_t)v4, v1, v2);
  return sub_1B9997330();
}

unint64_t sub_1B998CC98(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  char *v4;
  unsigned __int8 v5;
  char v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236618);
  v2 = (_QWORD *)sub_1B99972B8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (char *)(a1 + 33);
  while (1)
  {
    v5 = *(v4 - 1);
    v6 = *v4;
    result = sub_1B998521C(v5);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v2[6] + result) = v5;
    *(_BYTE *)(v2[7] + result) = v6;
    v9 = v2[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      goto LABEL_11;
    v4 += 2;
    v2[2] = v11;
    if (!--v3)
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

uint64_t sub_1B998CD90@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t result;
  uint64_t v13;

  sub_1B998CC98(MEMORY[0x1E0DEE9D8]);
  swift_bridgeObjectRelease();
  v6 = a1;
  v7 = sub_1B998D488(v6);
  v9 = v8;
  v11 = v10;
  result = sub_1B998D5F8(v6);
  *(_QWORD *)a3 = v7;
  *(_QWORD *)(a3 + 8) = v9;
  *(_BYTE *)(a3 + 16) = v11;
  *(_QWORD *)(a3 + 24) = result;
  *(_QWORD *)(a3 + 32) = v13;
  *(_QWORD *)(a3 + 40) = a2;
  return result;
}

uint64_t sub_1B998CE04(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  char v14;

  if (result == a2)
    return 1;
  v2 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v4 = result + 64;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_24;
    }
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v11 >= v8)
      return 1;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        return 1;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          return 1;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
        {
          v3 = v11 + 3;
          if (v11 + 3 >= v8)
            return 1;
          v12 = *(_QWORD *)(v4 + 8 * v3);
          if (!v12)
            break;
        }
      }
    }
LABEL_23:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_24:
    sub_1B998521C(*(_BYTE *)(*(_QWORD *)(v2 + 48) + v10));
    if ((v14 & 1) != 0)
    {
      sub_1B9986E7C();
      result = sub_1B99970CC();
      if ((result & 1) != 0)
        continue;
    }
    return 0;
  }
  v13 = v11 + 4;
  if (v13 >= v8)
    return 1;
  v12 = *(_QWORD *)(v4 + 8 * v13);
  if (v12)
  {
    v3 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v8)
      return 1;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_23;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B998CFB4(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[3];
  _OWORD v8[3];

  v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  v3 = *a2;
  v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_1B998D190((uint64_t)v7, (uint64_t)v8) & 1;
}

uint64_t sub_1B998CFF8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (!a3)
  {
    if (!a6)
      goto LABEL_4;
    return 0;
  }
  if (a3 != 1)
  {
    if (a6 == 2)
      goto LABEL_4;
    return 0;
  }
  if (a6 != 1)
    return 0;
LABEL_4:
  if (a1 == a4 && a2 == a5)
    return 1;
  else
    return sub_1B99972F4();
}

uint64_t sub_1B998D05C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;

  switch(a2)
  {
    case 0:
      if (a4)
        goto LABEL_32;
      result = 1;
      break;
    case 1:
      if (a4 != 1)
        goto LABEL_32;
      result = 1;
      break;
    case 2:
      if (a4 != 2)
        goto LABEL_32;
      result = 1;
      break;
    case 3:
      if (a4 != 3)
        goto LABEL_32;
      result = 1;
      break;
    case 4:
      if (a4 != 4)
        goto LABEL_32;
      result = 1;
      break;
    case 5:
      if (a4 != 5)
        goto LABEL_32;
      result = 1;
      break;
    case 6:
      if (a4 != 6)
        goto LABEL_32;
      result = 1;
      break;
    case 7:
      if (a4 != 7)
        goto LABEL_32;
      result = 1;
      break;
    case 8:
      if (a4 != 8)
        goto LABEL_32;
      result = 1;
      break;
    case 9:
      if (a4 != 9)
        goto LABEL_32;
      result = 1;
      break;
    case 10:
      if (a4 != 10)
        goto LABEL_32;
      result = 1;
      break;
    case 11:
      if (a4 != 11)
        goto LABEL_32;
      result = 1;
      break;
    case 12:
      if (a4 != 12)
        goto LABEL_32;
      result = 1;
      break;
    default:
      if (a4 < 0xD)
      {
LABEL_32:
        result = 0;
      }
      else if (a1 == a3 && a2 == a4)
      {
        result = 1;
      }
      else
      {
        result = sub_1B99972F4();
      }
      break;
  }
  return result;
}

uint64_t sub_1B998D178(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1B998D190(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD v19[2];
  char v20;
  __int128 v21;
  __int128 v22;

  sub_1B998E424((__int128 *)a1, (uint64_t)&v15);
  sub_1B998E424((__int128 *)a2, (uint64_t)&v14);
  sub_1B998E424(&v15, (uint64_t)&v16);
  if (!v18)
  {
    v4 = v16;
    v5 = v17;
    sub_1B998E424(&v14, (uint64_t)v19);
    if (!v20)
      goto LABEL_8;
LABEL_36:
    v7 = 0;
    return v7 & 1;
  }
  if (v18 != 1)
  {
    v4 = v16;
    v5 = v17;
    sub_1B998E424(&v14, (uint64_t)v19);
    if (v20 == 2)
      goto LABEL_8;
    goto LABEL_36;
  }
  v4 = v16;
  v5 = v17;
  sub_1B998E424(&v14, (uint64_t)v19);
  if (v20 != 1)
    goto LABEL_36;
LABEL_8:
  if (v4 == v19[0] && v5 == v19[1] || (v6 = sub_1B99972F4(), v7 = 0, (v6 & 1) != 0))
  {
    sub_1B998E43C((_OWORD *)(a1 + 24), &v13);
    sub_1B998E43C((_OWORD *)(a2 + 24), &v12);
    sub_1B998E43C(&v13, &v21);
    v8 = *((_QWORD *)&v21 + 1);
    switch(*((_QWORD *)&v21 + 1))
    {
      case 0:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1))
          goto LABEL_36;
        goto LABEL_43;
      case 1:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) != 1)
          goto LABEL_36;
        goto LABEL_43;
      case 2:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) != 2)
          goto LABEL_36;
        goto LABEL_43;
      case 3:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) != 3)
          goto LABEL_36;
        goto LABEL_43;
      case 4:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) != 4)
          goto LABEL_36;
        goto LABEL_43;
      case 5:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) != 5)
          goto LABEL_36;
        goto LABEL_43;
      case 6:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) != 6)
          goto LABEL_36;
        goto LABEL_43;
      case 7:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) != 7)
          goto LABEL_36;
        goto LABEL_43;
      case 8:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) != 8)
          goto LABEL_36;
        goto LABEL_43;
      case 9:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) != 9)
          goto LABEL_36;
        goto LABEL_43;
      case 0xALL:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) != 10)
          goto LABEL_36;
        goto LABEL_43;
      case 0xBLL:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) != 11)
          goto LABEL_36;
        goto LABEL_43;
      case 0xCLL:
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) != 12)
          goto LABEL_36;
        goto LABEL_43;
      default:
        v9 = v21;
        sub_1B998E43C(&v12, &v22);
        if (*((_QWORD *)&v22 + 1) < 0xDuLL)
          goto LABEL_36;
        if (v9 != (_QWORD)v22 || v8 != *((_QWORD *)&v22 + 1))
        {
          v10 = sub_1B99972F4();
          v7 = 0;
          if ((v10 & 1) == 0)
            return v7 & 1;
        }
LABEL_43:
        v7 = sub_1B998CE04(*(_QWORD *)(a1 + 40), *(_QWORD *)(a2 + 40));
        break;
    }
  }
  return v7 & 1;
}

uint64_t sub_1B998D488(void *a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  switch((unint64_t)objc_msgSend(a1, sel_addressType))
  {
    case 0uLL:
      v2 = objc_msgSend(a1, sel_address);
      if (v2)
        goto LABEL_7;
      __break(1u);
LABEL_4:
      v3 = objc_msgSend(a1, sel_address);
      if (!v3)
      {
        __break(1u);
LABEL_12:
        __break(1u);
LABEL_13:
        __break(1u);
LABEL_14:
        sub_1B9997288();
        __break(1u);
        JUMPOUT(0x1B998D5E8);
      }
      v4 = v3;
      break;
    case 1uLL:
      v5 = objc_msgSend(a1, sel_address);
      if (!v5)
        goto LABEL_13;
      v4 = v5;
      break;
    case 2uLL:
      goto LABEL_4;
    case 3uLL:
      v2 = objc_msgSend(a1, sel_address);
      if (!v2)
        goto LABEL_12;
LABEL_7:
      v4 = v2;
      break;
    default:
      goto LABEL_14;
  }
  v6 = sub_1B9997108();

  return v6;
}

uint64_t sub_1B998D5F8(void *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;

  v2 = objc_msgSend(a1, sel_label);
  if (!v2)
    goto LABEL_29;
  v3 = v2;
  v4 = sub_1B9997108();
  v6 = v5;

  if (v4 == sub_1B9997108() && v6 == v7)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v9 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  if (v4 == sub_1B9997108() && v6 == v10)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v12 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  if (v4 == sub_1B9997108() && v6 == v13)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v14 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  if (v4 == sub_1B9997108() && v6 == v15)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v16 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_29:

    return 0;
  }
  if (v4 == sub_1B9997108() && v6 == v18)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v19 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  if ((v19 & 1) != 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  if (v4 == sub_1B9997108() && v6 == v20)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v21 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  if ((v21 & 1) != 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  if (v4 == sub_1B9997108() && v6 == v22)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  if ((v23 & 1) != 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  if (v4 == sub_1B9997108() && v6 == v24)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v25 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  if ((v25 & 1) != 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  if (v4 == sub_1B9997108() && v6 == v26)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v27 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  if ((v27 & 1) != 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  if (v4 == sub_1B9997108() && v6 == v28)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v29 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  if ((v29 & 1) != 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  if (v4 == sub_1B9997108() && v6 == v30)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v31 = sub_1B99972F4();
  swift_bridgeObjectRelease();
  if ((v31 & 1) != 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  if (v4 == sub_1B9997108() && v6 == v32)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v33 = sub_1B99972F4();
    swift_bridgeObjectRelease();
    if ((v33 & 1) == 0)
    {
      if (v4 == sub_1B9997108() && v6 == v34)
      {
        swift_bridgeObjectRelease_n();

      }
      else
      {
        v35 = sub_1B99972F4();
        swift_bridgeObjectRelease();

        if ((v35 & 1) == 0)
          return v4;
        swift_bridgeObjectRelease();
      }
      return 0;
    }
    swift_bridgeObjectRelease();

  }
  return 0;
}

unint64_t sub_1B998DC68()
{
  unint64_t result;

  result = qword_1EF236868;
  if (!qword_1EF236868)
  {
    result = MEMORY[0x1BCCC8308](&unk_1B999C618, &_s6HandleV5ValueON);
    atomic_store(result, (unint64_t *)&qword_1EF236868);
  }
  return result;
}

unint64_t sub_1B998DCB0()
{
  unint64_t result;

  result = qword_1EF236870;
  if (!qword_1EF236870)
  {
    result = MEMORY[0x1BCCC8308]("ADt-\bl", &_s6HandleV5LabelON);
    atomic_store(result, (unint64_t *)&qword_1EF236870);
  }
  return result;
}

uint64_t _s6HandleVwxx(uint64_t a1)
{
  sub_1B998D178(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  if (*(_QWORD *)(a1 + 32) >= 0xDuLL)
    swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s6HandleVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  _QWORD *v7;
  unint64_t v8;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_1B9980110(*(_QWORD *)a2, v5, v6);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = (_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  if (v8 >= 0xD)
  {
    *(_QWORD *)(a1 + 24) = *v7;
    *(_QWORD *)(a1 + 32) = v8;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v7;
  }
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s6HandleVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  unint64_t v10;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_1B9980110(*(_QWORD *)a2, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v9 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v6;
  sub_1B998D178(v7, v8, v9);
  v10 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32) >= 0xDuLL)
  {
    if (v10 >= 0xD)
    {
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_1B998DEA8(a1 + 24);
    goto LABEL_6;
  }
  if (v10 < 0xD)
  {
LABEL_6:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
LABEL_8:
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B998DEA8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEA968] - 8) + 8))();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s6HandleVwta(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  _QWORD *v8;
  unint64_t v9;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v7 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  sub_1B998D178(v5, v6, v7);
  v8 = (_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 32) >= 0xDuLL)
  {
    v9 = *(_QWORD *)(a2 + 32);
    if (v9 >= 0xD)
    {
      *(_QWORD *)(a1 + 24) = *v8;
      *(_QWORD *)(a1 + 32) = v9;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_1B998DEA8(a1 + 24);
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)v8;
LABEL_6:
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6HandleVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s6HandleVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s6HandleVMa()
{
  return &_s6HandleVN;
}

uint64_t _s6HandleV5ValueOwxx(uint64_t a1)
{
  return sub_1B998D178(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s6HandleV5ValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1B9980110(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s6HandleV5ValueOwca(uint64_t a1, uint64_t a2)
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
  sub_1B9980110(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1B998D178(v6, v7, v8);
  return a1;
}

uint64_t _s6HandleV5ValueOwta(uint64_t a1, uint64_t a2)
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
  sub_1B998D178(v4, v5, v6);
  return a1;
}

uint64_t _s6HandleV5ValueOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s6HandleV5ValueOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1B998E1B0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1B998E1B8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *_s6HandleV5ValueOMa()
{
  return &_s6HandleV5ValueON;
}

unint64_t _s6HandleV5LabelOwxx(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s6HandleV5LabelOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *_s6HandleV5LabelOwca(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6HandleV5LabelOwta(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6HandleV5LabelOwet(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFF2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483635);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 12;
  if (v4 >= 0xE)
    return v5;
  else
    return 0;
}

uint64_t _s6HandleV5LabelOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF3)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483635;
    if (a3 >= 0x7FFFFFF3)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFF3)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 12;
  }
  return result;
}

uint64_t sub_1B998E3DC(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1B998E3F4(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *_s6HandleV5LabelOMa()
{
  return &_s6HandleV5LabelON;
}

uint64_t sub_1B998E424(__int128 *a1, uint64_t a2)
{
  __int128 v2;

  v2 = *a1;
  *(_BYTE *)(a2 + 16) = *((_BYTE *)a1 + 16);
  *(_OWORD *)a2 = v2;
  return a2;
}

_OWORD *sub_1B998E43C(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  return a2;
}

ContactsAutocomplete::ServiceAppEnum_optional __swiftcall ServiceAppEnum.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  ContactsAutocomplete::ServiceAppEnum_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1B99972D0();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t ServiceAppEnum.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x656D695465636166;
  else
    return 0x6567617373654D69;
}

uint64_t sub_1B998E518(char *a1, unsigned __int8 *a2)
{
  return sub_1B998E524(*a1, *a2);
}

uint64_t sub_1B998E524(char a1, unsigned __int8 a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  char v6;

  if (a1)
  {
    if (a1 == 1)
      v2 = 0xED00006F69647541;
    else
      v2 = 0xED00006F65646956;
    v3 = 0x656D695465636166;
    v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1)
        v5 = 0xED00006F69647541;
      else
        v5 = 0xED00006F65646956;
      if (v3 != 0x656D695465636166)
        goto LABEL_15;
      goto LABEL_13;
    }
  }
  else
  {
    v2 = 0xE800000000000000;
    v3 = 0x6567617373654D69;
    v4 = a2;
    if (a2)
      goto LABEL_6;
  }
  v5 = 0xE800000000000000;
  if (v3 != 0x6567617373654D69)
  {
LABEL_15:
    v6 = sub_1B99972F4();
    goto LABEL_16;
  }
LABEL_13:
  if (v2 != v5)
    goto LABEL_15;
  v6 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

uint64_t sub_1B998E644()
{
  sub_1B9997318();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  return sub_1B9997330();
}

uint64_t sub_1B998E6FC()
{
  sub_1B9997120();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B998E790()
{
  sub_1B9997318();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  return sub_1B9997330();
}

ContactsAutocomplete::ServiceAppEnum_optional sub_1B998E844(Swift::String *a1)
{
  return ServiceAppEnum.init(rawValue:)(*a1);
}

void sub_1B998E850(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;

  v2 = *v1;
  v3 = 0xE800000000000000;
  v4 = 0xED00006F69647541;
  if (v2 != 1)
    v4 = 0xED00006F65646956;
  v5 = v2 == 0;
  if (*v1)
    v6 = 0x656D695465636166;
  else
    v6 = 0x6567617373654D69;
  if (!v5)
    v3 = v4;
  *a1 = v6;
  a1[1] = v3;
}

uint64_t static ServiceAppEnum.typeDisplayRepresentation.getter()
{
  return sub_1B9996FB8();
}

uint64_t sub_1B998E8F0()
{
  return sub_1B9996FB8();
}

uint64_t sub_1B998E918()
{
  sub_1B998A6BC();
  return sub_1B9996D9C();
}

uint64_t sub_1B998E95C()
{
  sub_1B998F0CC();
  return sub_1B9996FA0();
}

unint64_t sub_1B998E998(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2368E8);
    v2 = (_QWORD *)sub_1B99972B8();
    v3 = *(_QWORD *)(a1 + 16);
  }
  else
  {
    v3 = 0;
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2368E0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v8 = (unsigned __int8 *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3)
  {
    v9 = &v8[*(int *)(v5 + 48)];
    v10 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v22[1] = a1;
    v11 = a1 + v10;
    v12 = *(_QWORD *)(v6 + 72);
    swift_retain();
    while (1)
    {
      sub_1B998F300(v11, (uint64_t)v8);
      v13 = *v8;
      result = sub_1B998EB48(*v8);
      if ((v15 & 1) != 0)
        break;
      v16 = result;
      *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v2[6] + result) = v13;
      v17 = v2[7];
      v18 = sub_1B9996F70();
      result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v9, v18);
      v19 = v2[2];
      v20 = __OFADD__(v19, 1);
      v21 = v19 + 1;
      if (v20)
        goto LABEL_12;
      v2[2] = v21;
      v11 += v12;
      if (!--v3)
      {
        swift_release();
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  return result;
}

void *static ServiceAppEnum.allCases.getter()
{
  return &unk_1E70DD9C0;
}

void sub_1B998EB38(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E70DDAE0;
}

unint64_t sub_1B998EB48(unsigned __int8 a1)
{
  uint64_t v2;

  sub_1B9997318();
  sub_1B9997120();
  swift_bridgeObjectRelease();
  v2 = sub_1B9997330();
  return sub_1B998EC14(a1, v2);
}

unint64_t sub_1B998EC14(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  char v12;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    while (1)
    {
      if (*(_BYTE *)(*(_QWORD *)(v2 + 48) + v4))
      {
        v7 = 0x656D695465636166;
        if (*(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) == 1)
          v8 = 1768191297;
        else
          v8 = 1701079382;
        v9 = v8 | 0xED00006F00000000;
        v10 = a1;
        if (!a1)
        {
LABEL_7:
          v11 = 0xE800000000000000;
          if (v7 != 0x6567617373654D69)
            goto LABEL_16;
          goto LABEL_15;
        }
      }
      else
      {
        v9 = 0xE800000000000000;
        v7 = 0x6567617373654D69;
        v10 = a1;
        if (!a1)
          goto LABEL_7;
      }
      if (v10 == 1)
        v11 = 0xED00006F69647541;
      else
        v11 = 0xED00006F65646956;
      if (v7 != 0x656D695465636166)
        goto LABEL_16;
LABEL_15:
      if (v9 == v11)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_16:
      v12 = sub_1B99972F4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        v4 = (v4 + 1) & v6;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
  }
  return v4;
}

unint64_t _s20ContactsAutocomplete14ServiceAppEnumO26caseDisplayRepresentationsSDyAC0D7Intents0G14RepresentationVGvgZ_0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _BYTE *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2368D8);
  v0 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF2368E0) - 8);
  v1 = *(_QWORD *)(v0 + 72);
  v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B999BDB0;
  v4 = (_BYTE *)(v3 + v2);
  *v4 = 0;
  sub_1B9996F58();
  v4[v1] = 1;
  sub_1B9996F58();
  v4[2 * v1] = 2;
  sub_1B9996F58();
  return sub_1B998E998(v3);
}

unint64_t sub_1B998EED4()
{
  unint64_t result;

  result = qword_1EF236878;
  if (!qword_1EF236878)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAppEnum, &type metadata for ServiceAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF236878);
  }
  return result;
}

unint64_t sub_1B998EF1C()
{
  unint64_t result;

  result = qword_1EF236880;
  if (!qword_1EF236880)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAppEnum, &type metadata for ServiceAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF236880);
  }
  return result;
}

unint64_t sub_1B998EF64()
{
  unint64_t result;

  result = qword_1EF236888;
  if (!qword_1EF236888)
  {
    result = MEMORY[0x1BCCC8308]("MCt-Pj", &type metadata for ServiceAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF236888);
  }
  return result;
}

unint64_t sub_1B998EFAC()
{
  unint64_t result;

  result = qword_1EF236890;
  if (!qword_1EF236890)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAppEnum, &type metadata for ServiceAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF236890);
  }
  return result;
}

unint64_t sub_1B998EFF4()
{
  unint64_t result;

  result = qword_1EF236898;
  if (!qword_1EF236898)
  {
    result = MEMORY[0x1BCCC8308]("5Ct- j", &type metadata for ServiceAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF236898);
  }
  return result;
}

unint64_t sub_1B998F03C()
{
  unint64_t result;

  result = qword_1EF2368A0;
  if (!qword_1EF2368A0)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAppEnum, &type metadata for ServiceAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF2368A0);
  }
  return result;
}

unint64_t sub_1B998F084()
{
  unint64_t result;

  result = qword_1EF2368A8;
  if (!qword_1EF2368A8)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAppEnum, &type metadata for ServiceAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF2368A8);
  }
  return result;
}

unint64_t sub_1B998F0CC()
{
  unint64_t result;

  result = qword_1EF2368B0;
  if (!qword_1EF2368B0)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAppEnum, &type metadata for ServiceAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF2368B0);
  }
  return result;
}

uint64_t sub_1B998F110()
{
  sub_1B998A6BC();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1B998F154()
{
  unint64_t result;

  result = qword_1EF2368B8;
  if (!qword_1EF2368B8)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAppEnum, &type metadata for ServiceAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF2368B8);
  }
  return result;
}

unint64_t sub_1B998F1A0()
{
  unint64_t result;

  result = qword_1EF2368C0;
  if (!qword_1EF2368C0)
  {
    result = MEMORY[0x1BCCC8308](&protocol conformance descriptor for ServiceAppEnum, &type metadata for ServiceAppEnum);
    atomic_store(result, (unint64_t *)&qword_1EF2368C0);
  }
  return result;
}

unint64_t sub_1B998F1E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF2368C8;
  if (!qword_1EF2368C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF2368D0);
    result = MEMORY[0x1BCCC8308](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EF2368C8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ServiceAppEnum(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B998F280 + 4 * byte_1B999C735[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B998F2B4 + 4 * asc_1B999C730[v4]))();
}

uint64_t sub_1B998F2B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B998F2BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B998F2C4);
  return result;
}

uint64_t sub_1B998F2D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B998F2D8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B998F2DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B998F2E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceAppEnum()
{
  return &type metadata for ServiceAppEnum;
}

uint64_t sub_1B998F300(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2368E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1B998F348(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF236A20);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236A00);
  v6 = sub_1B99972B8();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1B9992BB4(v12, (uint64_t)v5);
    result = sub_1B99912A0((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_1B999703C();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

uint64_t sub_1B998F4D4()
{
  uint64_t v0;

  v0 = sub_1B9997078();
  __swift_allocate_value_buffer(v0, qword_1EF238F88);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF238F88);
  return sub_1B999706C();
}

uint64_t sub_1B998F54C()
{
  uint64_t v0;

  if (qword_1EF238A20 != -1)
    swift_once();
  v0 = sub_1B9997078();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EF238F88);
}

id sub_1B998F594()
{
  return objc_msgSend(objc_allocWithZone((Class)CNAutocompleteStore), sel_init);
}

uint64_t sub_1B998F5B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for IDS.LiveLookup();
  result = sub_1B997F4B8();
  a1[3] = v2;
  a1[4] = (uint64_t)&off_1E70DE070;
  *a1 = result;
  return result;
}

_QWORD *sub_1B998F5F4(uint64_t a1, __int128 *a2)
{
  _QWORD *v4;

  v4 = (_QWORD *)swift_allocObject();
  v4[8] = sub_1B998F348(MEMORY[0x1E0DEE9D8]);
  v4[9] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D13BD8]), sel_init);
  v4[2] = a1;
  sub_1B9986D5C(a2, (uint64_t)(v4 + 3));
  return v4;
}

uint64_t sub_1B998F670()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_1B998F6AC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  v3[20] = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2368F8);
  v3[21] = swift_task_alloc();
  v4 = sub_1B999703C();
  v3[22] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[23] = v5;
  v3[24] = *(_QWORD *)(v5 + 64);
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  v3[28] = swift_task_alloc();
  v3[29] = swift_task_alloc();
  return swift_task_switch();
}

id sub_1B998F774()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  id v21;
  id result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void (*v38)(unint64_t, uint64_t, uint64_t);
  id v39;
  char *v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  id v52;
  id v53;
  double v54;
  double v55;
  void *v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t *v63;
  NSObject *v64;
  os_log_type_t v65;
  _BOOL4 v66;
  uint64_t v67;
  uint64_t v68;
  uint8_t *v69;
  void (*v70)(uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  id v82;
  void *v83;
  uint64_t v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  unint64_t v99;
  unint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t *v104;
  void (*v105)(uint64_t, uint64_t);
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  os_log_type_t type;
  os_log_type_t typea[8];
  os_log_type_t typeb[8];
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void (*v121)(uint64_t, uint64_t, uint64_t);
  unint64_t v122;
  uint64_t (*v123)(_QWORD *, uint64_t, uint64_t, uint64_t);
  void (*v124)(uint64_t, uint64_t);
  uint64_t v125[2];

  v2 = v0 + 136;
  v1 = *(_QWORD *)(v0 + 136);
  if (!*(_QWORD *)(v1 + 16))
  {
    v21 = (id)MEMORY[0x1E0DEE9D8];
    goto LABEL_6;
  }
  v106 = (uint64_t *)(v0 + 120);
  sub_1B9997030();
  *(_QWORD *)(v0 + 88) = v1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236900);
  sub_1B9992900(&qword_1EF236908, &qword_1EF236900, MEMORY[0x1E0DEAF20]);
  v3 = sub_1B99970C0();
  v5 = v4;
  swift_bridgeObjectRelease();
  if (qword_1EF238A20 != -1)
LABEL_37:
    swift_once();
  v104 = (uint64_t *)(v2 - 24);
  v6 = *(_QWORD *)(v0 + 224);
  v7 = *(_QWORD *)(v0 + 232);
  v8 = *(_QWORD *)(v0 + 176);
  v9 = *(_QWORD *)(v0 + 184);
  v10 = sub_1B9997078();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EF238F88);
  v121 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v121(v6, v7, v8);
  swift_bridgeObjectRetain();
  v11 = sub_1B9997060();
  v12 = sub_1B99971B0();
  v13 = os_log_type_enabled(v11, v12);
  v14 = *(_QWORD *)(v0 + 224);
  v16 = *(_QWORD *)(v0 + 176);
  v15 = *(_QWORD *)(v0 + 184);
  v118 = v2;
  if (v13)
  {
    type = v12;
    v17 = swift_slowAlloc();
    v113 = swift_slowAlloc();
    v125[0] = v113;
    *(_DWORD *)v17 = 136380931;
    swift_bridgeObjectRetain();
    *v106 = sub_1B9984AE8(v3, v5, v125);
    sub_1B9997204();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2080;
    sub_1B9992984(&qword_1EF236938, MEMORY[0x1E0CB09F0]);
    v18 = sub_1B99972DC();
    *(_QWORD *)(v2 - 8) = sub_1B9984AE8(v18, v19, v125);
    sub_1B9997204();
    swift_bridgeObjectRelease();
    v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v20(v14, v16);
    _os_log_impl(&dword_1B9950000, v11, type, "Preparing request for “%{private}s” (%s)", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCC83A4](v113, -1, -1);
    MEMORY[0x1BCCC83A4](v17, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v20(v14, v16);
  }

  v105 = v20;
  *(_QWORD *)(v0 + 240) = v20;
  v23 = *(_QWORD *)(v0 + 232);
  v24 = *(_QWORD *)(v0 + 216);
  v25 = *(_QWORD *)(v0 + 184);
  v109 = v23;
  v110 = *(_QWORD *)(v0 + 192);
  v26 = *(_QWORD *)(v0 + 168);
  v27 = *(_QWORD *)(v0 + 176);
  v107 = v24;
  v108 = v26;
  v114 = *(_QWORD *)(v0 + 160);
  *(_QWORD *)typea = *(_QWORD *)(v0 + 208);
  v111 = *(_QWORD *)(v0 + 152);
  v28 = objc_msgSend(objc_allocWithZone((Class)CNAutocompleteFetchRequest), sel_init);
  *(_QWORD *)(v0 + 248) = v28;
  v29 = (void *)sub_1B9997144();
  objc_msgSend(v28, sel_setSearchNames_, v29);

  objc_msgSend(v28, sel_setIncludeDirectoryServers_, 0);
  v30 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StoreSpy()), sel_init);
  *(_QWORD *)(v0 + 256) = v30;
  v31 = sub_1B9997198();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v26, 1, 1, v31);
  v112 = v0;
  v121(v24, v23, v27);
  v32 = v25;
  v33 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  v34 = (v110 + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
  v35 = (v34 + 15) & 0xFFFFFFFFFFFFFFF8;
  v36 = (v35 + 15) & 0xFFFFFFFFFFFFFFF8;
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 16) = 0;
  *(_QWORD *)(v37 + 24) = 0;
  v38 = *(void (**)(unint64_t, uint64_t, uint64_t))(v32 + 32);
  v0 = v112;
  v38(v37 + v33, v107, v27);
  *(_QWORD *)(v37 + v34) = v111;
  *(_QWORD *)(v37 + v35) = v28;
  *(_QWORD *)(v37 + v36) = v30;
  *(_QWORD *)(v37 + ((v36 + 15) & 0xFFFFFFFFFFFFFFF8)) = v114;
  swift_retain();
  v39 = v28;
  v40 = (char *)v30;
  sub_1B9990A70(v108, (uint64_t)&unk_1EF236918, v37);
  swift_release();
  v121(*(_QWORD *)typea, v109, v27);
  v41 = sub_1B9997060();
  v42 = sub_1B99971B0();
  v43 = os_log_type_enabled(v41, v42);
  v44 = *(_QWORD *)(v112 + 208);
  v45 = *(_QWORD *)(v112 + 176);
  if (v43)
  {
    v46 = (uint8_t *)swift_slowAlloc();
    *(_QWORD *)typeb = v40;
    v47 = swift_slowAlloc();
    v125[0] = v47;
    *(_DWORD *)v46 = 136315138;
    sub_1B9992984(&qword_1EF236938, MEMORY[0x1E0CB09F0]);
    v48 = sub_1B99972DC();
    *v104 = sub_1B9984AE8(v48, v49, v125);
    sub_1B9997204();
    swift_bridgeObjectRelease();
    v50 = v105;
    v105(v44, v45);
    _os_log_impl(&dword_1B9950000, v41, v42, "Waiting for query to complete (%s)", v46, 0xCu);
    swift_arrayDestroy();
    v51 = v47;
    v40 = *(char **)typeb;
    MEMORY[0x1BCCC83A4](v51, -1, -1);
    MEMORY[0x1BCCC83A4](v46, -1, -1);
  }
  else
  {
    v50 = v105;
    v105(v44, v45);
  }

  v52 = objc_msgSend((id)objc_opt_self(), sel_currentEnvironment);
  v53 = objc_msgSend(v52, sel_timeProvider);

  objc_msgSend(v53, sel_timestamp);
  v55 = v54;
  sub_1B99971EC();
  v56 = *(void **)&v40[OBJC_IVAR____TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy_error];
  v57 = *(_QWORD *)(v112 + 232);
  if (v56)
  {
    v58 = v50;
    v59 = *(_QWORD *)(v112 + 176);
    v60 = v56;
    swift_willThrow();
    sub_1B9990C14(v53, v55);
    swift_unknownObjectRelease();
    v58(v57, v59);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (id)(*(uint64_t (**)(void))(v112 + 8))();
  }
  v61 = *(_QWORD *)(v112 + 200);
  v62 = *(_QWORD *)(v112 + 176);
  v63 = (unint64_t *)&v40[OBJC_IVAR____TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy_results];
  swift_beginAccess();
  v3 = *v63;
  *(_QWORD *)(v112 + 264) = *v63;
  swift_bridgeObjectRetain();
  sub_1B9990C14(v53, v55);
  swift_unknownObjectRelease();
  v121(v61, v57, v62);
  v64 = sub_1B9997060();
  v65 = sub_1B99971B0();
  v66 = os_log_type_enabled(v64, v65);
  v67 = *(_QWORD *)(v112 + 200);
  v68 = *(_QWORD *)(v112 + 176);
  v122 = v3;
  if (v66)
  {
    v69 = (uint8_t *)swift_slowAlloc();
    v70 = v50;
    v71 = swift_slowAlloc();
    v125[0] = v71;
    *(_DWORD *)v69 = 136315138;
    sub_1B9992984(&qword_1EF236938, MEMORY[0x1E0CB09F0]);
    v72 = sub_1B99972DC();
    *(_QWORD *)(v118 - 32) = sub_1B9984AE8(v72, v73, v125);
    sub_1B9997204();
    swift_bridgeObjectRelease();
    v70(v67, v68);
    _os_log_impl(&dword_1B9950000, v64, v65, "Query is complete (%s)", v69, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCC83A4](v71, -1, -1);
    MEMORY[0x1BCCC83A4](v69, -1, -1);
  }
  else
  {
    v50(v67, v68);
  }

  v74 = *(_QWORD *)(v112 + 152) + 64;
  swift_beginAccess();
  v75 = *(_QWORD *)v74;
  if (*(_QWORD *)(*(_QWORD *)v74 + 16) && (v76 = sub_1B99912A0(*(_QWORD *)(v112 + 232)), (v77 & 1) != 0))
  {
    v78 = *(void **)(*(_QWORD *)(v75 + 56) + 8 * v76);
    swift_endAccess();
    objc_msgSend(v78, sel_cancel);
  }
  else
  {
    swift_endAccess();
  }
  v79 = *(_QWORD *)(v112 + 232);
  swift_beginAccess();
  sub_1B999143C(v79);
  swift_endAccess();
  swift_unknownObjectRelease();
  if (!(v3 >> 62))
  {
    v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_22;
    goto LABEL_39;
  }
  swift_bridgeObjectRetain();
  v5 = sub_1B9997294();
  if (!v5)
  {
LABEL_39:
    v81 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_40:
    *(_QWORD *)(v112 + 272) = v81;
    v93 = *(_QWORD *)(v112 + 144);
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v93 + 16))
    {
      v94 = *(_QWORD **)(v112 + 152);
      v95 = v94[6];
      v96 = v94[7];
      v97 = *(unsigned __int8 *)(*(_QWORD *)(v112 + 144) + 32);
      __swift_project_boxed_opaque_existential_1(v94 + 3, v95);
      v123 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t))(**(int **)(v96 + 8) + *(_QWORD *)(v96 + 8));
      v98 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v112 + 280) = v98;
      *v98 = v112;
      v98[1] = sub_1B99903DC;
      return (id)v123(v81, v97, v95, v96);
    }
    swift_bridgeObjectRelease();
    v99 = sub_1B9982528(MEMORY[0x1E0DEE9D8]);
    v101 = *(void **)(v112 + 256);
    v100 = *(_QWORD *)(v112 + 264);
    v102 = *(void **)(v112 + 248);
    v120 = *(_QWORD *)(v112 + 232);
    v124 = *(void (**)(uint64_t, uint64_t))(v112 + 240);
    v119 = *(_QWORD *)(v112 + 176);
    v103 = *(_QWORD *)(v112 + 144);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = sub_1B99925D4(v100, v103, v99);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    v124(v120, v119);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (id)(*(uint64_t (**)(id))(v0 + 8))(v21);
  }
LABEL_22:
  v80 = 0;
  v2 = v3 & 0xC000000000000001;
  v81 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  while (1)
  {
    if (v2)
      v82 = (id)MEMORY[0x1BCCC7C00](v80, v3);
    else
      v82 = *(id *)(v3 + 8 * v80 + 32);
    v83 = v82;
    v84 = v80 + 1;
    if (__OFADD__(v80, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    result = objc_msgSend(v82, sel_value);
    if (!result)
      break;
    v85 = result;
    v86 = objc_msgSend(result, sel_address);

    if (v86)
    {
      v87 = sub_1B9997108();
      v89 = v88;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v81 = sub_1B99849DC(0, v81[2] + 1, 1, v81);
      v91 = v81[2];
      v90 = v81[3];
      if (v91 >= v90 >> 1)
        v81 = sub_1B99849DC((_QWORD *)(v90 > 1), v91 + 1, 1, v81);
      v81[2] = v91 + 1;
      v92 = &v81[2 * v91];
      v92[4] = v87;
      v92[5] = v89;
      v3 = v122;
    }
    else
    {

    }
    ++v80;
    if (v84 == v5)
      goto LABEL_40;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B99903DC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 288) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1B9990440()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 288);
  v3 = *(void **)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 264);
  v4 = *(void **)(v0 + 248);
  v9 = *(_QWORD *)(v0 + 232);
  v10 = *(void (**)(uint64_t, uint64_t))(v0 + 240);
  v5 = *(_QWORD *)(v0 + 176);
  v6 = *(_QWORD *)(v0 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = sub_1B99925D4(v2, v6, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v10(v9, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v7);
}

uint64_t sub_1B999055C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[11] = a6;
  v7[12] = a7;
  v7[9] = a4;
  v7[10] = a5;
  v8 = sub_1B999703C();
  v7[13] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[14] = v9;
  v7[15] = *(_QWORD *)(v9 + 64);
  v7[16] = swift_task_alloc();
  v7[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B99905D4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;

  if (qword_1EF238A20 != -1)
    swift_once();
  v1 = v0[9];
  v2 = v0[17];
  v4 = v0[13];
  v3 = v0[14];
  v5 = sub_1B9997078();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EF238F88);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v6(v2, v1, v4);
  v7 = sub_1B9997060();
  v8 = sub_1B99971B0();
  v9 = os_log_type_enabled(v7, v8);
  v10 = v0[17];
  v11 = v0[13];
  v12 = v0[14];
  if (v9)
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    v29 = v28;
    *(_DWORD *)v13 = 136315138;
    sub_1B9992984(&qword_1EF236938, MEMORY[0x1E0CB09F0]);
    v14 = sub_1B99972DC();
    v0[8] = sub_1B9984AE8(v14, v15, &v29);
    sub_1B9997204();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    _os_log_impl(&dword_1B9950000, v7, v8, "Executing request (%s)", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCC83A4](v28, -1, -1);
    MEMORY[0x1BCCC83A4](v13, -1, -1);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v12 + 8))(v0[17], v0[13]);
  }

  v17 = v0[15];
  v16 = v0[16];
  v18 = v0[13];
  v19 = v0[14];
  v21 = v0[9];
  v20 = v0[10];
  v22 = objc_msgSend(*(id *)(v20 + 16), sel_executeFetchRequest_delegate_, v0[11], v0[12]);
  v6(v16, v21, v18);
  v23 = (*(unsigned __int8 *)(v19 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v20;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v19 + 32))(v24 + v23, v16, v18);
  *(_QWORD *)(v24 + ((v17 + v23 + 7) & 0xFFFFFFFFFFFFFFF8)) = v22;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = sub_1B9992B28;
  *(_QWORD *)(v25 + 24) = v24;
  v0[6] = sub_1B9992B7C;
  v0[7] = v25;
  v0[2] = MEMORY[0x1E0C809B0];
  v0[3] = 1107296256;
  v0[4] = sub_1B9990A50;
  v0[5] = &block_descriptor_0;
  v26 = _Block_copy(v0 + 2);
  swift_retain();
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  CNRunWithLock();
  _Block_release(v26);
  swift_unknownObjectRelease();
  swift_release();
  LOBYTE(v22) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v22 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return ((uint64_t (*)(void))v0[1])();
  }
  return result;
}

uint64_t sub_1B9990958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;

  v6 = sub_1B999703C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  swift_beginAccess();
  swift_unknownObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = 0x8000000000000000;
  sub_1B9991B30(a3, (uint64_t)v9, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(a1 + 64) = v12;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return swift_endAccess();
}

uint64_t sub_1B9990A50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1B9990A70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1B9997198();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B999718C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1B99929C4(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B9997174();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B9990BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1B998B80C;
  return sub_1B998F6AC(a1, a2);
}

void sub_1B9990C14(void *a1, double a2)
{
  double v3;
  double v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *log;
  uint64_t v14;

  objc_msgSend(a1, sel_timestamp);
  v4 = v3;
  if (qword_1EF238A20 != -1)
    swift_once();
  v5 = sub_1B9997078();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EF238F88);
  v6 = sub_1B99971A4();
  log = sub_1B9997060();
  if (os_log_type_enabled(log, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v14 = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = objc_msgSend((id)objc_opt_self(), sel_stringForTimeInterval_, v4 - a2);
    v10 = sub_1B9997108();
    v12 = v11;

    sub_1B9984AE8(v10, v12, &v14);
    sub_1B9997204();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B9950000, log, v6, "Waited for %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCC83A4](v8, -1, -1);
    MEMORY[0x1BCCC83A4](v7, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_1B9990DF8(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1B9997294();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1B9997294();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x1BCCC7C0C](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1B99923C8(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1B9997294();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_1B9997168();
  }
  __break(1u);
  return result;
}

id sub_1B9991174()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B99911F0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1B9991254;
  return v6(a1);
}

uint64_t sub_1B9991254()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_1B99912A0(uint64_t a1)
{
  uint64_t v2;

  sub_1B999703C();
  sub_1B9992984(&qword_1EF236570, MEMORY[0x1E0CB09C8]);
  v2 = sub_1B99970A8();
  return sub_1B9991304(a1, v2);
}

unint64_t sub_1B9991304(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_1B999703C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_1B9992984(&qword_1EF236A08, MEMORY[0x1E0CB09D0]);
      v14 = sub_1B99970CC();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_1B999143C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_1B99912A0(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1B9991D24();
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = sub_1B999703C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_1B99918A4(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1B9991514(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t i;
  int v43;

  v3 = v2;
  v5 = sub_1B999703C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236A00);
  v43 = a2;
  v10 = sub_1B99972AC();
  v11 = v9;
  v12 = v10;
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_41;
  v13 = 1 << *(_BYTE *)(v11 + 32);
  v14 = *(_QWORD *)(v11 + 64);
  v41 = (_QWORD *)(v11 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v39 = v3;
  v40 = (unint64_t)(v13 + 63) >> 6;
  v17 = v10 + 64;
  result = swift_retain();
  v19 = 0;
  for (i = v11; ; v11 = i)
  {
    if (v16)
    {
      v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v22 = v21 | (v19 << 6);
      goto LABEL_22;
    }
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = v41;
    v25 = v41[v23];
    ++v19;
    if (!v25)
    {
      v19 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_34;
      v25 = v41[v19];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v25 = v41[v26];
        if (!v25)
        {
          while (1)
          {
            v19 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_43;
            if (v19 >= v40)
              goto LABEL_34;
            v25 = v41[v19];
            ++v26;
            if (v25)
              goto LABEL_21;
          }
        }
        v19 = v26;
      }
    }
LABEL_21:
    v16 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_22:
    v27 = *(_QWORD *)(v6 + 72);
    v28 = *(_QWORD *)(v11 + 48) + v27 * v22;
    if ((v43 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v28, v5);
      v29 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v22);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v28, v5);
      v29 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v22);
      swift_unknownObjectRetain();
    }
    sub_1B9992984(&qword_1EF236570, MEMORY[0x1E0CB09C8]);
    result = sub_1B99970A8();
    v30 = -1 << *(_BYTE *)(v12 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v17 + 8 * (v31 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v17 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v33 = 0;
      v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v35 = v32 == v34;
        if (v32 == v34)
          v32 = 0;
        v33 |= v35;
        v36 = *(_QWORD *)(v17 + 8 * v32);
      }
      while (v36 == -1);
      v20 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v12 + 48) + v27 * v20, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v20) = v29;
    ++*(_QWORD *)(v12 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = v41;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v37 = 1 << *(_BYTE *)(v11 + 32);
  if (v37 >= 64)
    bzero(v24, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v37;
  *(_QWORD *)(v11 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v12;
  return result;
}

unint64_t sub_1B99918A4(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  unint64_t v33;
  uint64_t v34;

  v4 = sub_1B999703C();
  v34 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_1B9997228();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v33 = (result + 1) & v11;
      v12 = *(_QWORD *)(v34 + 72);
      v32 = *(void (**)(char *, unint64_t, uint64_t))(v34 + 16);
      v13 = v11;
      do
      {
        v14 = v12;
        v15 = v12 * v10;
        v16 = v13;
        v32(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_1B9992984(&qword_1EF236570, MEMORY[0x1E0CB09C8]);
        v17 = sub_1B99970A8();
        result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v7, v4);
        v13 = v16;
        v18 = v17 & v16;
        if (a1 >= (uint64_t)v33)
        {
          if (v18 >= v33 && a1 >= (uint64_t)v18)
          {
LABEL_17:
            v21 = *(_QWORD *)(a2 + 48);
            result = v21 + v14 * a1;
            if (v14 * a1 < v15 || (v12 = v14, result >= v21 + v15 + v14))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_22:
              v13 = v16;
              v12 = v14;
            }
            else if (v14 * a1 != v15)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_22;
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = (_QWORD *)(v22 + 8 * a1);
            v24 = (_QWORD *)(v22 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v33 || a1 >= (uint64_t)v18)
        {
          goto LABEL_17;
        }
        v12 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v25 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v26 = *v25;
    v27 = (-1 << a1) - 1;
  }
  else
  {
    v25 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v25;
    v26 = (-1 << a1) - 1;
  }
  *v25 = v27 & v26;
  v28 = *(_QWORD *)(a2 + 16);
  v29 = __OFSUB__(v28, 1);
  v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1B9991B30(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = sub_1B999703C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_1B99912A0(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_unknownObjectRelease();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_1B9991D24();
    goto LABEL_7;
  }
  sub_1B9991514(v17, a3 & 1);
  v23 = sub_1B99912A0(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = sub_1B999730C();
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_1B9991C8C(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_1B9991C8C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_1B999703C();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

void *sub_1B9991D24()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_1B999703C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236A00);
  v24 = v0;
  v5 = *v0;
  v6 = sub_1B99972A0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_unknownObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1B9991F54(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1B9991F70(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1B9991F70(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF2369F0);
  v10 = *(_QWORD *)(type metadata accessor for ComposeRecipient(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for ComposeRecipient(0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_1B99972C4();
  __break(1u);
  return result;
}

void (*sub_1B9992150(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1B99921D0(v6, a2, a3);
  return sub_1B99921A4;
}

void sub_1B99921A4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1B99921D0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1BCCC7C00](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_1B999223C;
  }
  __break(1u);
  return result;
}

void sub_1B999223C(id *a1)
{

}

uint64_t type metadata accessor for StoreSpy()
{
  return objc_opt_self();
}

uint64_t sub_1B9992264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_1B999703C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1B9992324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(sub_1B999703C() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  v6 = v0 + v3;
  v7 = *(_QWORD *)(v0 + v4);
  v8 = *(_QWORD *)(v0 + v5);
  v9 = *(_QWORD *)(v0 + ((v5 + 15) & 0xFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v10;
  *v10 = v1;
  v10[1] = sub_1B998B8CC;
  return sub_1B999055C((uint64_t)v10, v11, v12, v6, v7, v8, v9);
}

uint64_t sub_1B99923C8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1B9997294();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1B9997294();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1B9992900((unint64_t *)&unk_1EF2369C0, &qword_1EF2369B8, MEMORY[0x1E0DEAF50]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2369B8);
          v12 = sub_1B9992150(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1B99928C4();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1B99972C4();
  __break(1u);
  return result;
}

id sub_1B99925D4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  uint64_t inited;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD v31[2];
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = v3;
  v33 = a3;
  v35 = a2;
  v6 = type metadata accessor for ComposeRecipient(0);
  v37 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1B9997294();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v10 = MEMORY[0x1E0DEE9D8];
  if (!v9)
    return (id)v10;
  v38 = MEMORY[0x1E0DEE9D8];
  result = (id)sub_1B9991F54(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    v31[1] = v4;
    v12 = 0;
    v10 = v38;
    v36 = a1 & 0xC000000000000001;
    v32 = xmmword_1B999B9A0;
    v34 = v9;
    while (1)
    {
      if (v9 == v12)
      {
        __break(1u);
        goto LABEL_25;
      }
      if (v36)
        v13 = (id)MEMORY[0x1BCCC7C00](v12, a1);
      else
        v13 = *(id *)(a1 + 8 * v12 + 32);
      v14 = v13;
      result = objc_msgSend(v13, sel_value);
      if (!result)
        goto LABEL_27;
      v15 = result;
      v16 = objc_msgSend(result, sel_address);

      if (v16)
      {
        v17 = v8;
        v18 = a1;
        v19 = sub_1B9997108();
        v21 = v20;

        if (*(_QWORD *)(v35 + 16))
        {
          v22 = *(_BYTE *)(v35 + 32);
          v23 = v33;
          if (*(_QWORD *)(v33 + 16) && (v24 = sub_1B9985128(v19, v21), (v25 & 1) != 0))
            v26 = *(_BYTE *)(*(_QWORD *)(v23 + 56) + v24);
          else
            v26 = 2;
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF2369E0);
          inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = v32;
          *(_BYTE *)(inited + 32) = v22;
          *(_BYTE *)(inited + 33) = v26;
          v28 = sub_1B998CC98(inited);
          a1 = v18;
          v8 = v17;
          v9 = v34;
          goto LABEL_20;
        }
        swift_bridgeObjectRelease();
        a1 = v18;
        v8 = v17;
        v9 = v34;
      }
      v28 = sub_1B998CC98(MEMORY[0x1E0DEE9D8]);
LABEL_20:
      sub_1B9980258(v14, v28, (uint64_t)v8);
      v38 = v10;
      v30 = *(_QWORD *)(v10 + 16);
      v29 = *(_QWORD *)(v10 + 24);
      v4 = v30 + 1;
      if (v30 >= v29 >> 1)
      {
        sub_1B9991F54(v29 > 1, v30 + 1, 1);
        v10 = v38;
      }
      ++v12;
      *(_QWORD *)(v10 + 16) = v4;
      sub_1B9992940((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80))+ *(_QWORD *)(v37 + 72) * v30);
      if (v9 == v12)
        return (id)v10;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AutocompleteStore()
{
  return objc_opt_self();
}

unint64_t sub_1B99928C4()
{
  unint64_t result;

  result = qword_1EF2369B0;
  if (!qword_1EF2369B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF2369B0);
  }
  return result;
}

uint64_t sub_1B9992900(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1BCCC8308](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B9992940(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ComposeRecipient(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B9992984(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1B999703C();
    result = MEMORY[0x1BCCC8308](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B99929C4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2368F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B9992A04()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B9992A28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1B998B8CC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF236A10 + dword_1EF236A10))(a1, v4);
}

uint64_t sub_1B9992A98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1B999703C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1B9992B28()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(sub_1B999703C() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_1B9990958(*(_QWORD *)(v0 + 16), v0 + v2, *(_QWORD *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_1B9992B6C()
{
  return swift_deallocObject();
}

uint64_t sub_1B9992B7C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_1B9992BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF236A20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B9992BFC()
{
  uint64_t v0;
  uint64_t *v1;

  v0 = type metadata accessor for AutocompleteComposeRecipientQuery();
  __swift_allocate_value_buffer(v0, qword_1EF238A38);
  v1 = (uint64_t *)__swift_project_value_buffer(v0, (uint64_t)qword_1EF238A38);
  return AutocompleteComposeRecipientQuery.init()(v1);
}

uint64_t static ComposeRecipientEntity.defaultQuery.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF238A30 != -1)
    swift_once();
  v2 = type metadata accessor for AutocompleteComposeRecipientQuery();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF238A38);
  swift_beginAccess();
  return sub_1B997F378(v3, a1, (uint64_t (*)(_QWORD))type metadata accessor for AutocompleteComposeRecipientQuery);
}

uint64_t static ComposeRecipientEntity.defaultQuery.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF238A30 != -1)
    swift_once();
  v2 = type metadata accessor for AutocompleteComposeRecipientQuery();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF238A38);
  swift_beginAccess();
  sub_1B9992D7C(a1, v3);
  swift_endAccess();
  return sub_1B997FE90(a1, (uint64_t (*)(_QWORD))type metadata accessor for AutocompleteComposeRecipientQuery);
}

uint64_t sub_1B9992D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AutocompleteComposeRecipientQuery();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t (*static ComposeRecipientEntity.defaultQuery.modify())()
{
  uint64_t v0;

  if (qword_1EF238A30 != -1)
    swift_once();
  v0 = type metadata accessor for AutocompleteComposeRecipientQuery();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF238A38);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static ComposeRecipientEntity.typeDisplayRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[16];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236778);
  MEMORY[0x1E0C80A78](v0);
  v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = sub_1B9996FF4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_1B9997054();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1B99970F0();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1B9997000();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  sub_1B99970E4();
  sub_1B9997048();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CAF9B8], v3);
  sub_1B999700C();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
  return sub_1B9996FC4();
}

uint64_t ComposeRecipientEntity.displayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD v16[4];

  v16[1] = a1;
  v1 = sub_1B9996E8C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9996EB0();
  v5 = sub_1B9996E20();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9996E2C();
  v9 = sub_1B999492C((uint64_t)v8);
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236A90);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9996E80();
  sub_1B9994DCC((uint64_t)v14);
  sub_1B9995464((uint64_t)v14, &qword_1EF236A90);
  v16[2] = v9;
  v16[3] = v11;
  sub_1B999712C();
  sub_1B999712C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_1B9996F58();
}

uint64_t ComposeRecipientEntity.person.getter()
{
  return sub_1B9996EB0();
}

uint64_t ComposeRecipientEntity.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ComposeRecipientEntity.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ComposeRecipientEntity.id.modify())()
{
  return nullsub_1;
}

uint64_t sub_1B9993268()
{
  return sub_1B9996EB0();
}

uint64_t sub_1B9993288(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t (*v6)(char *, char *, uint64_t);
  uint64_t v7;
  uint64_t v9;

  v2 = sub_1B9996E8C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x1E0C80A78](v2);
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 16);
  v7 = v6((char *)&v9 - v5, a1, v2);
  MEMORY[0x1E0C80A78](v7);
  v6((char *)&v9 - v5, (char *)&v9 - v5, v2);
  sub_1B9996EBC();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))((char *)&v9 - v5, v2);
}

uint64_t ComposeRecipientEntity.person.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_1B9996E8C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_1B9996EBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*ComposeRecipientEntity.person.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1B9996EA4();
  return sub_1B998A53C;
}

uint64_t ComposeRecipientEntity.$person.getter()
{
  return sub_1B9996EC8();
}

uint64_t ComposeRecipientEntity.status.getter()
{
  return sub_1B9996EB0();
}

uint64_t sub_1B9993478@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_1B9996EB0();
  *a1 = v3;
  return result;
}

uint64_t sub_1B99934B0()
{
  return sub_1B9996EBC();
}

uint64_t ComposeRecipientEntity.status.setter()
{
  return sub_1B9996EBC();
}

uint64_t (*ComposeRecipientEntity.status.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1B9996EA4();
  return sub_1B998A53C;
}

uint64_t ComposeRecipientEntity.$status.getter()
{
  return sub_1B9996EC8();
}

uint64_t ComposeRecipientEntity.children.getter()
{
  uint64_t v1;

  sub_1B9996EB0();
  return v1;
}

uint64_t sub_1B99935B0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1B9996EB0();
  *a1 = v3;
  return result;
}

uint64_t sub_1B99935E8()
{
  swift_bridgeObjectRetain();
  return sub_1B9996EBC();
}

uint64_t ComposeRecipientEntity.children.setter()
{
  return sub_1B9996EBC();
}

uint64_t (*ComposeRecipientEntity.children.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1B9996EA4();
  return sub_1B998A53C;
}

uint64_t ComposeRecipientEntity.$children.getter()
{
  return sub_1B9996EC8();
}

uint64_t sub_1B99936B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF238A30 != -1)
    swift_once();
  v2 = type metadata accessor for AutocompleteComposeRecipientQuery();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF238A38);
  swift_beginAccess();
  return sub_1B997F378(v3, a1, (uint64_t (*)(_QWORD))type metadata accessor for AutocompleteComposeRecipientQuery);
}

uint64_t sub_1B999374C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B999375C()
{
  sub_1B998117C(qword_1EF236810, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
  return sub_1B9996DA8();
}

uint64_t sub_1B99937B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD v16[4];

  v16[1] = a1;
  v1 = sub_1B9996E8C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9996EB0();
  v5 = sub_1B9996E20();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9996E2C();
  v9 = sub_1B999492C((uint64_t)v8);
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236A90);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9996E80();
  sub_1B9994DCC((uint64_t)v14);
  sub_1B9995464((uint64_t)v14, &qword_1EF236A90);
  v16[2] = v9;
  v16[3] = v11;
  sub_1B999712C();
  sub_1B999712C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_1B9996F58();
}

uint64_t sub_1B9993950()
{
  sub_1B998117C(&qword_1EF236AF0, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
  return sub_1B9996FD0();
}

uint64_t static ComposeRecipientEntity.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1B99972F4();
}

uint64_t sub_1B99939D4(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1B99972F4();
}

uint64_t sub_1B9993A04@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v66[4];
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76[6];
  _OWORD v77[2];
  __int128 v78;
  _OWORD v79[3];
  uint64_t v80[2];
  unsigned __int8 v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;

  v4 = sub_1B9996FF4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B9997054();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1B99970F0();
  MEMORY[0x1E0C80A78](v9);
  v10 = sub_1B9997000();
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236A98);
  sub_1B99970E4();
  sub_1B9997048();
  v13 = *MEMORY[0x1E0CAF9B8];
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v14(v7, v13, v4);
  sub_1B999700C();
  v71 = MEMORY[0x1BCCC7894](v12);
  a2[2] = v71;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236AA0);
  sub_1B99970E4();
  sub_1B9997048();
  v14(v7, v13, v4);
  sub_1B999700C();
  v15 = sub_1B9989AD4();
  a2[3] = MEMORY[0x1BCCC787C](v12, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236AA8);
  sub_1B99970E4();
  sub_1B9997048();
  v14(v7, v13, v4);
  sub_1B999700C();
  v16 = sub_1B998117C(qword_1EF236810, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
  v17 = MEMORY[0x1BCCC7888](v12, v16);
  v73 = a2;
  a2[4] = v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236A90);
  v19 = *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64);
  v20 = MEMORY[0x1E0C80A78](v18);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)v66 - v21;
  sub_1B9980068(v76);
  sub_1B9995138((uint64_t)v76, (uint64_t)v77, &qword_1EF236AB0);
  if (*((_QWORD *)&v78 + 1))
  {
    v79[0] = v77[0];
    v79[1] = v77[1];
    v79[2] = v78;
    sub_1B99942BC((uint64_t)v79, (uint64_t)v22);
    v23 = sub_1B9996E68();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 0, 1, v23);
  }
  else
  {
    v24 = sub_1B9996E68();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v22, 1, 1, v24);
  }
  v70 = (uint64_t)v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9995138((uint64_t)v22, v70, &qword_1EF236A90);
  v25 = sub_1B998013C();
  v26 = *(_QWORD *)(v25 + 16);
  v72 = a1;
  if (v26)
  {
    v69 = v19;
    v75 = MEMORY[0x1E0DEE9D8];
    sub_1B999479C(0, v26, 0);
    v27 = v75;
    v28 = sub_1B9996E68();
    v74 = (_QWORD *)v28;
    v29 = *(_QWORD *)(v28 - 8);
    v30 = *(_QWORD *)(v29 + 64);
    v68 = v25;
    v31 = (_QWORD *)(v25 + 72);
    do
    {
      MEMORY[0x1E0C80A78](v28);
      v32 = *(v31 - 4);
      v33 = *(v31 - 2);
      v34 = *(v31 - 1);
      v35 = *v31;
      v80[0] = *(v31 - 5);
      v80[1] = v32;
      v81 = *((_BYTE *)v31 - 24);
      v82 = v33;
      v83 = v34;
      v84 = v35;
      sub_1B9980110(v80[0], v32, v81);
      sub_1B9980128(v33, v34);
      swift_bridgeObjectRetain();
      sub_1B99942BC((uint64_t)v80, (uint64_t)v66 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
      v75 = v27;
      v37 = *(_QWORD *)(v27 + 16);
      v36 = *(_QWORD *)(v27 + 24);
      if (v37 >= v36 >> 1)
      {
        sub_1B999479C(v36 > 1, v37 + 1, 1);
        v27 = v75;
      }
      *(_QWORD *)(v27 + 16) = v37 + 1;
      v28 = (*(uint64_t (**)(unint64_t, char *, _QWORD *))(v29 + 32))(v27+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(_QWORD *)(v29 + 72) * v37, (char *)v66 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), v74);
      v31 += 6;
      --v26;
    }
    while (v26);
    swift_bridgeObjectRelease();
    a1 = v72;
    v19 = v69;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v38 = sub_1B9997018();
  v39 = v73;
  *v73 = v38;
  v39[1] = v40;
  v41 = v39;
  v42 = type metadata accessor for ComposeRecipient(0);
  v43 = a1 + *(int *)(v42 + 28);
  v44 = type metadata accessor for ComposeRecipientEntity();
  sub_1B997F378(v43, (uint64_t)v41 + *(int *)(v44 + 32), type metadata accessor for ComposeRecipient.Identifier);
  v69 = sub_1B9996E8C();
  v74 = v66;
  v68 = *(_QWORD *)(v69 - 8);
  v45 = *(_QWORD *)(v68 + 64);
  MEMORY[0x1E0C80A78](v69);
  v67 = (v45 + 15) & 0xFFFFFFFFFFFFFFF0;
  v46 = (char *)v66 - v67;
  v47 = sub_1B9996E08();
  v66[3] = v66;
  MEMORY[0x1E0C80A78](v47);
  (*(void (**)(char *, _QWORD))(v49 + 104))((char *)v66 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C90808]);
  v50 = sub_1B9996E20();
  v66[2] = v66;
  MEMORY[0x1E0C80A78](v50);
  v52 = (_QWORD *)((char *)v66 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0));
  v53 = (_QWORD *)(a1 + *(int *)(v42 + 20));
  v54 = v53[1];
  *v52 = *v53;
  v52[1] = v54;
  v56 = (*(uint64_t (**)(_QWORD *, _QWORD))(v55 + 104))(v52, *MEMORY[0x1E0C90830]);
  v66[1] = v66;
  MEMORY[0x1E0C80A78](v56);
  v57 = v70;
  sub_1B9995D70(v70, (uint64_t)v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1EF236A90);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236AB8);
  MEMORY[0x1E0C80A78](v58);
  v60 = (char *)v66 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_1B9996F64();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(v60, 1, 1, v61);
  swift_bridgeObjectRetain();
  v62 = sub_1B9996E14();
  MEMORY[0x1E0C80A78](v62);
  v63 = v68;
  v64 = v69;
  (*(void (**)(char *, char *, uint64_t))(v68 + 16))((char *)v66 - v67, v46, v69);
  sub_1B9996EBC();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v46, v64);
  LOBYTE(v75) = 0;
  sub_1B9996EBC();
  sub_1B997FE90(v72, type metadata accessor for ComposeRecipient);
  return sub_1B9995464(v57, &qword_1EF236A90);
}

uint64_t sub_1B99942BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  char *v7;
  unsigned int *v8;
  unsigned int *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unsigned int *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[3];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  char v27;
  char v28;
  __int128 v29;
  _OWORD v30[2];

  v21[2] = a2;
  v3 = sub_1B9996E44();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v6 = (_OWORD *)((char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B998E424((__int128 *)a1, (uint64_t)&v24);
  sub_1B998E424(&v24, (uint64_t)&v25);
  v7 = &v27;
  v8 = (unsigned int *)MEMORY[0x1E0C90900];
  if (v26 != 1)
    v8 = (unsigned int *)MEMORY[0x1E0C90910];
  if (v26)
  {
    v7 = &v28;
    v9 = v8;
  }
  else
  {
    v9 = (unsigned int *)MEMORY[0x1E0C908F0];
  }
  v10 = v25;
  *(_OWORD *)v7 = v25;
  *v6 = v10;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))((char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), *v9, v3);
  v11 = sub_1B9996E38();
  v21[1] = v21;
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x1E0C80A78](v11);
  v14 = (_QWORD *)((char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B998E43C((_OWORD *)(a1 + 24), &v23);
  sub_1B998E43C(&v23, &v29);
  switch(*((_QWORD *)&v29 + 1))
  {
    case 0:
      *(_QWORD *)&v30[0] = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)v30);
      v15 = (unsigned int *)MEMORY[0x1E0C90880];
      goto LABEL_22;
    case 1:
      *(_QWORD *)&v30[0] = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)v30);
      v15 = (unsigned int *)MEMORY[0x1E0C90890];
      goto LABEL_22;
    case 2:
      *(_QWORD *)&v30[0] = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)v30);
      v15 = (unsigned int *)MEMORY[0x1E0C908B8];
      goto LABEL_22;
    case 3:
      *(_QWORD *)&v30[0] = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)v30);
      v16 = 0x615720656C707041;
      v17 = 0xEB00000000686374;
      goto LABEL_14;
    case 4:
      *(_QWORD *)&v30[0] = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)v30);
      v16 = 0x64756F6C4369;
      v17 = 0xE600000000000000;
LABEL_14:
      *v14 = v16;
      v14[1] = v17;
      goto LABEL_15;
    case 5:
      *(_QWORD *)&v30[0] = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)v30);
      v15 = (unsigned int *)MEMORY[0x1E0C908C0];
      goto LABEL_22;
    case 6:
      *(_QWORD *)&v30[0] = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)v30);
      v15 = (unsigned int *)MEMORY[0x1E0C90888];
      goto LABEL_22;
    case 7:
      *(_QWORD *)&v30[0] = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)v30);
      v15 = (unsigned int *)MEMORY[0x1E0C908D0];
      goto LABEL_22;
    case 8:
      *(_QWORD *)&v30[0] = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)v30);
      v15 = (unsigned int *)MEMORY[0x1E0C908D8];
      goto LABEL_22;
    case 9:
    case 0xBLL:
      *(_QWORD *)&v30[0] = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)v30);
      v15 = (unsigned int *)MEMORY[0x1E0C908A0];
      goto LABEL_22;
    case 0xALL:
      *(_QWORD *)&v30[0] = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)v30);
      v15 = (unsigned int *)MEMORY[0x1E0C908A8];
      goto LABEL_22;
    case 0xCLL:
      *(_QWORD *)&v30[0] = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)v30);
      v15 = (unsigned int *)MEMORY[0x1E0C908C8];
      goto LABEL_22;
    default:
      v30[0] = v29;
      v22 = *(_QWORD *)(a1 + 40);
      sub_1B9995DB4((uint64_t)&v22);
      *(_OWORD *)v14 = v30[0];
LABEL_15:
      v15 = (unsigned int *)MEMORY[0x1E0C908B0];
LABEL_22:
      v18 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v12 + 104))((char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), *v15, v11);
      MEMORY[0x1E0C80A78](v18);
      v19 = (*(uint64_t (**)(char *, _OWORD *, uint64_t))(v4 + 16))((char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6, v3);
      MEMORY[0x1E0C80A78](v19);
      (*(void (**)(char *, uint64_t *, uint64_t))(v12 + 16))((char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v14, v11);
      sub_1B9996E74();
      (*(void (**)(uint64_t *, uint64_t))(v12 + 8))(v14, v11);
      return (*(uint64_t (**)(_OWORD *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t ComposeRecipientEntity.oneLineSummary.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[16];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236AC0);
  MEMORY[0x1E0C80A78](v0);
  v2 = &v8[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B9996EB0();
  v3 = sub_1B9996E8C();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 0, 1, v3);
  sub_1B9996EB0();
  v8[14] = v8[15];
  v4 = ComposeRecipientStatus.rawValue.getter();
  v6 = sub_1B999517C((uint64_t)v2, v4, v5);
  swift_bridgeObjectRelease();
  sub_1B9995464((uint64_t)v2, &qword_1EF236AC0);
  return v6;
}

uint64_t static ComposeRecipientEntity.oneLineSummary(id:person:status:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B999517C(a3, a4, a5);
}

size_t sub_1B999479C(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_1B99947B8(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

size_t sub_1B99947B8(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF236B10);
  v10 = *(_QWORD *)(sub_1B9996E68() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_1B9996E68() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_1B999492C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;

  v2 = sub_1B9996FE8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B9996E20();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (MEMORY[0x1E0C90830] && v10 == *MEMORY[0x1E0C90830])
  {
    (*(void (**)(char *, uint64_t))(v7 + 96))(v9, v6);
    return *(_QWORD *)v9;
  }
  else if (MEMORY[0x1E0C90848] && v10 == *MEMORY[0x1E0C90848])
  {
    (*(void (**)(char *, uint64_t))(v7 + 96))(v9, v6);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v9, v2);
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3858]), sel_init);
    v13 = (void *)sub_1B9996FDC();
    v14 = objc_msgSend(v12, sel_stringFromPersonNameComponents_, v13);

    v11 = sub_1B9997108();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else if (MEMORY[0x1E0C90850] && v10 == *MEMORY[0x1E0C90850])
  {
    return 0x6E776F6E6B6E7528;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return 0x746C756166656428;
  }
  return v11;
}

uint64_t sub_1B9994B44(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  unsigned int v8;
  uint64_t v9;

  v2 = sub_1B9996E38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (MEMORY[0x1E0C908B0] && v6 == *MEMORY[0x1E0C908B0])
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
    return *(_QWORD *)v5;
  }
  if (MEMORY[0x1E0C90880] && v6 == *MEMORY[0x1E0C90880])
    return 1701670760;
  if (MEMORY[0x1E0C90890] && v6 == *MEMORY[0x1E0C90890])
    return 1802661751;
  if (MEMORY[0x1E0C908B8] && v6 == *MEMORY[0x1E0C908B8])
    return 0x656E6F685069;
  if (MEMORY[0x1E0C908C0] && v6 == *MEMORY[0x1E0C908C0])
    return 0x656C69626F6DLL;
  if (MEMORY[0x1E0C90888] && v6 == *MEMORY[0x1E0C90888])
    return 1852399981;
  if (MEMORY[0x1E0C908D0] && v6 == *MEMORY[0x1E0C908D0])
  {
    v8 = 1701670760;
    return v8 | 0x7861662000000000;
  }
  if (MEMORY[0x1E0C908D8] && v6 == *MEMORY[0x1E0C908D8])
  {
    v8 = 1802661751;
    return v8 | 0x7861662000000000;
  }
  if (MEMORY[0x1E0C908A8] && v6 == *MEMORY[0x1E0C908A8])
    return 0x7265676170;
  if (MEMORY[0x1E0C908A0] && v6 == *MEMORY[0x1E0C908A0])
    return 0x726568746FLL;
  if (MEMORY[0x1E0C908C8] && v6 == *MEMORY[0x1E0C908C8])
    return 0x6C6F6F686373;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return 0x746C756166656428;
}

uint64_t sub_1B9994DCC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;

  v2 = sub_1B9996E68();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236A90);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9995D70(a1, (uint64_t)v8, &qword_1EF236A90);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_1B9995464((uint64_t)v8, &qword_1EF236A90);
    return 0x646E6168206F6E28;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    v10 = sub_1B9996E44();
    v26 = &v23;
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(_QWORD *)(v11 + 64);
    MEMORY[0x1E0C80A78](v10);
    v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
    v14 = sub_1B9996E5C();
    MEMORY[0x1E0C80A78](v14);
    v15 = (uint64_t *)((char *)&v23 - v13);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))((char *)&v23 - v13, (char *)&v23 - v13, v10);
    v16 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))((char *)&v23 - v13, v10);
    if (MEMORY[0x1E0C908F0] && v16 == *MEMORY[0x1E0C908F0]
      || MEMORY[0x1E0C90900] && v16 == *MEMORY[0x1E0C90900]
      || MEMORY[0x1E0C90910] && v16 == *MEMORY[0x1E0C90910])
    {
      (*(void (**)(char *, uint64_t))(v11 + 96))((char *)&v23 - v13, v10);
      v17 = *v15;
      v24 = v15[1];
      v25 = v17;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))((char *)&v23 - v13, v10);
      v24 = 0xE900000000000029;
      v25 = 0x746C756166656428;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))((char *)&v23 - v13, v10);
    v18 = sub_1B9996E38();
    v19 = *(_QWORD *)(v18 - 8);
    MEMORY[0x1E0C80A78](v18);
    v21 = (char *)&v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1B9996E50();
    sub_1B9994B44((uint64_t)v21);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    v27 = v25;
    v28 = v24;
    sub_1B999712C();
    sub_1B999712C();
    swift_bridgeObjectRelease();
    sub_1B999712C();
    v9 = v27;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v9;
}

uint64_t type metadata accessor for ComposeRecipientEntity()
{
  uint64_t result;

  result = qword_1EF238F50;
  if (!qword_1EF238F50)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B9995138(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B999517C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _QWORD v23[4];
  uint64_t v24;
  unint64_t v25;

  v24 = 0;
  v25 = 0xE000000000000000;
  v6 = sub_1B9996E8C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236AC0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9995D70(a1, (uint64_t)v12, &qword_1EF236AC0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) == 1)
  {
    sub_1B9995464((uint64_t)v12, &qword_1EF236AC0);
    sub_1B999712C();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v12, v6);
    v13 = sub_1B9996E20();
    v23[1] = a2;
    v14 = *(_QWORD *)(v13 - 8);
    MEMORY[0x1E0C80A78](v13);
    v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1B9996E2C();
    v23[0] = sub_1B999492C((uint64_t)v16);
    v18 = v17;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF236A90);
    MEMORY[0x1E0C80A78](v19);
    v21 = (char *)v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1B9996E80();
    sub_1B9994DCC((uint64_t)v21);
    sub_1B9995464((uint64_t)v21, &qword_1EF236A90);
    v23[2] = v23[0];
    v23[3] = v18;
    sub_1B999712C();
    sub_1B999712C();
    swift_bridgeObjectRelease();
    sub_1B999712C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  sub_1B999712C();
  sub_1B999712C();
  if (a3)
  {
    swift_bridgeObjectRetain();
    sub_1B999712C();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B999712C();
  }
  sub_1B999712C();
  return v24;
}

uint64_t sub_1B9995464(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1B99954A0()
{
  return sub_1B998117C(&qword_1EF236AC8, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)"iBt-Ph");
}

uint64_t sub_1B99954CC()
{
  return sub_1B998117C(&qword_1EF236AD0, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
}

uint64_t sub_1B99954F8()
{
  return sub_1B998117C(&qword_1EF236AD8, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
}

uint64_t sub_1B9995524()
{
  return sub_1B998117C(&qword_1EF236858, (uint64_t (*)(uint64_t))type metadata accessor for AutocompleteComposeRecipientQuery, (uint64_t)&protocol conformance descriptor for AutocompleteComposeRecipientQuery);
}

uint64_t sub_1B9995550()
{
  return MEMORY[0x1E0C91C90];
}

uint64_t sub_1B999555C()
{
  return sub_1B998117C(&qword_1EF236AE0, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
}

uint64_t sub_1B9995588()
{
  return sub_1B998117C(&qword_1EF236AE8, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
}

uint64_t sub_1B99955B4()
{
  return sub_1B998117C(&qword_1EF2367C8, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
}

uint64_t sub_1B99955E0()
{
  return sub_1B998117C(&qword_1EF236AF0, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
}

uint64_t sub_1B999560C()
{
  return MEMORY[0x1E0DEA978];
}

unint64_t sub_1B999561C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF236AF8;
  if (!qword_1EF236AF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF236B00);
    result = MEMORY[0x1BCCC8308](MEMORY[0x1E0C919A0], v1);
    atomic_store(result, (unint64_t *)&qword_1EF236AF8);
  }
  return result;
}

uint64_t sub_1B9995668()
{
  return sub_1B998117C(&qword_1EF236B08, (uint64_t (*)(uint64_t))type metadata accessor for ComposeRecipientEntity, (uint64_t)&protocol conformance descriptor for ComposeRecipientEntity);
}

uint64_t *initializeBufferWithCopyOfBuffer for ComposeRecipientEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = *(int *)(a3 + 32);
    v8 = (uint64_t *)((char *)a1 + v7);
    v9 = (uint64_t *)((char *)a2 + v7);
    a1[4] = a2[4];
    type metadata accessor for ComposeRecipient.Identifier(0);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_1B999703C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      v12 = v9[1];
      *v8 = *v9;
      v8[1] = v12;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t destroy for ComposeRecipientEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 32);
  type metadata accessor for ComposeRecipient.Identifier(0);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_bridgeObjectRelease();
  v5 = sub_1B999703C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for ComposeRecipientEntity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  a1[4] = a2[4];
  v6 = *(int *)(a3 + 32);
  v7 = (_QWORD *)((char *)a1 + v6);
  v8 = (_QWORD *)((char *)a2 + v6);
  type metadata accessor for ComposeRecipient.Identifier(0);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_1B999703C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    v10 = v8[1];
    *v7 = *v8;
    v7[1] = v10;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for ComposeRecipientEntity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 32);
    v7 = (_QWORD *)((char *)a1 + v6);
    v8 = (_QWORD *)((char *)a2 + v6);
    sub_1B997FE90((uint64_t)a1 + v6, type metadata accessor for ComposeRecipient.Identifier);
    type metadata accessor for ComposeRecipient.Identifier(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_1B999703C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      v7[1] = v8[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for ComposeRecipientEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v5 = *(int *)(a3 + 32);
  v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  v8 = type metadata accessor for ComposeRecipient.Identifier(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_1B999703C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v6, v7, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  return a1;
}

_QWORD *assignWithTake for ComposeRecipientEntity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 32);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    sub_1B997FE90((uint64_t)a1 + v7, type metadata accessor for ComposeRecipient.Identifier);
    v10 = type metadata accessor for ComposeRecipient.Identifier(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_1B999703C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ComposeRecipientEntity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B9995BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ComposeRecipient.Identifier(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ComposeRecipientEntity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B9995C78(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ComposeRecipient.Identifier(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1B9995CEC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ComposeRecipient.Identifier(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1B9995D70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B9995DB4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

void CNAutocompleteDelegateMultipleCallbacks_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v6;
  v9 = 2112;
  v10 = a1;
  v11 = 2080;
  v12 = "CNAutocompleteDelegateMultipleCallbacks";
  _os_log_fault_impl(&dword_1B9950000, a2, OS_LOG_TYPE_FAULT, "Error: Delegate of class %@ called completion handler multiple times for query %@. This is contributing to a degradation of system performance. In the future, this will be a hard error. Break on %s() to debug.", (uint8_t *)&v7, 0x20u);

}

void sSortResultsByPreferredDomain_block_invoke_3_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v1, "hasPreferredDomain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v0, "hasPreferredDomain"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1B9950000, v4, v5, "Comparing preferred domain of %{private}@ (%@) with %{private}@ (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void sSortResultsByDisplayName_block_invoke_5_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_5();
  objc_msgSend(v1, "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_1B9950000, v3, v4, "Comparing display name of %{private}@ (%{private}@) with %{private}@ (%{private}@)", v5, v6, v7, v8, 3u);

  OUTLINED_FUNCTION_2_0();
}

void sSortRecentResultsBySendingAddressMatch_block_invoke_8_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_1B9950000, v0, v1, "Comparing sending address match of %{private}@ with %{private}@");
  OUTLINED_FUNCTION_1_0();
}

void sSortRecentResultsByCompletingChosenGroup_block_invoke_10_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_1B9950000, v0, v1, "Comparing completes current group for %{private}@ and %{private}@");
  OUTLINED_FUNCTION_1_0();
}

void sSortRecentResultsByDate_block_invoke_11_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  objc_msgSend(v1, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1B9950000, v4, v5, "Comparing recent date of %{private}@ (%@) with %{private}@ (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B9996D78()
{
  return MEMORY[0x1E0C90388]();
}

uint64_t sub_1B9996D84()
{
  return MEMORY[0x1E0C90430]();
}

uint64_t sub_1B9996D90()
{
  return MEMORY[0x1E0C90440]();
}

uint64_t sub_1B9996D9C()
{
  return MEMORY[0x1E0C904E0]();
}

uint64_t sub_1B9996DA8()
{
  return MEMORY[0x1E0C90510]();
}

uint64_t sub_1B9996DB4()
{
  return MEMORY[0x1E0C905C8]();
}

uint64_t sub_1B9996DC0()
{
  return MEMORY[0x1E0C905E8]();
}

uint64_t sub_1B9996DCC()
{
  return MEMORY[0x1E0C90648]();
}

uint64_t sub_1B9996DD8()
{
  return MEMORY[0x1E0C90658]();
}

uint64_t sub_1B9996DE4()
{
  return MEMORY[0x1E0C90758]();
}

uint64_t sub_1B9996DF0()
{
  return MEMORY[0x1E0C90780]();
}

uint64_t sub_1B9996DFC()
{
  return MEMORY[0x1E0C907D8]();
}

uint64_t sub_1B9996E08()
{
  return MEMORY[0x1E0C90818]();
}

uint64_t sub_1B9996E14()
{
  return MEMORY[0x1E0C90820]();
}

uint64_t sub_1B9996E20()
{
  return MEMORY[0x1E0C90868]();
}

uint64_t sub_1B9996E2C()
{
  return MEMORY[0x1E0C90870]();
}

uint64_t sub_1B9996E38()
{
  return MEMORY[0x1E0C908E0]();
}

uint64_t sub_1B9996E44()
{
  return MEMORY[0x1E0C90920]();
}

uint64_t sub_1B9996E50()
{
  return MEMORY[0x1E0C90930]();
}

uint64_t sub_1B9996E5C()
{
  return MEMORY[0x1E0C90940]();
}

uint64_t sub_1B9996E68()
{
  return MEMORY[0x1E0C90948]();
}

uint64_t sub_1B9996E74()
{
  return MEMORY[0x1E0C90968]();
}

uint64_t sub_1B9996E80()
{
  return MEMORY[0x1E0C90988]();
}

uint64_t sub_1B9996E8C()
{
  return MEMORY[0x1E0C90990]();
}

uint64_t sub_1B9996E98()
{
  return MEMORY[0x1E0C909E8]();
}

uint64_t sub_1B9996EA4()
{
  return MEMORY[0x1E0C90AD0]();
}

uint64_t sub_1B9996EB0()
{
  return MEMORY[0x1E0C90AE0]();
}

uint64_t sub_1B9996EBC()
{
  return MEMORY[0x1E0C90AF0]();
}

uint64_t sub_1B9996EC8()
{
  return MEMORY[0x1E0C90B00]();
}

uint64_t sub_1B9996ED4()
{
  return MEMORY[0x1E0C90B10]();
}

uint64_t sub_1B9996EE0()
{
  return MEMORY[0x1E0C90B18]();
}

uint64_t sub_1B9996EEC()
{
  return MEMORY[0x1E0C90B30]();
}

uint64_t sub_1B9996EF8()
{
  return MEMORY[0x1E0C90CE8]();
}

uint64_t sub_1B9996F04()
{
  return MEMORY[0x1E0C90CF8]();
}

uint64_t sub_1B9996F10()
{
  return MEMORY[0x1E0C90D08]();
}

uint64_t sub_1B9996F1C()
{
  return MEMORY[0x1E0C90D18]();
}

uint64_t sub_1B9996F28()
{
  return MEMORY[0x1E0C90DA0]();
}

uint64_t sub_1B9996F34()
{
  return MEMORY[0x1E0C90E48]();
}

uint64_t sub_1B9996F40()
{
  return MEMORY[0x1E0C91130]();
}

uint64_t sub_1B9996F4C()
{
  return MEMORY[0x1E0C91150]();
}

uint64_t sub_1B9996F58()
{
  return MEMORY[0x1E0C91448]();
}

uint64_t sub_1B9996F64()
{
  return MEMORY[0x1E0C91488]();
}

uint64_t sub_1B9996F70()
{
  return MEMORY[0x1E0C914C8]();
}

uint64_t sub_1B9996F7C()
{
  return MEMORY[0x1E0C91628]();
}

uint64_t sub_1B9996F88()
{
  return MEMORY[0x1E0C91648]();
}

uint64_t sub_1B9996F94()
{
  return MEMORY[0x1E0C91748]();
}

uint64_t sub_1B9996FA0()
{
  return MEMORY[0x1E0C917F0]();
}

uint64_t sub_1B9996FAC()
{
  return MEMORY[0x1E0C91828]();
}

uint64_t sub_1B9996FB8()
{
  return MEMORY[0x1E0C91908]();
}

uint64_t sub_1B9996FC4()
{
  return MEMORY[0x1E0C91928]();
}

uint64_t sub_1B9996FD0()
{
  return MEMORY[0x1E0C91A40]();
}

uint64_t sub_1B9996FDC()
{
  return MEMORY[0x1E0CAF750]();
}

uint64_t sub_1B9996FE8()
{
  return MEMORY[0x1E0CAF790]();
}

uint64_t sub_1B9996FF4()
{
  return MEMORY[0x1E0CAF9D0]();
}

uint64_t sub_1B9997000()
{
  return MEMORY[0x1E0CAF9F8]();
}

uint64_t sub_1B999700C()
{
  return MEMORY[0x1E0CAFA28]();
}

uint64_t sub_1B9997018()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1B9997024()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1B9997030()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1B999703C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B9997048()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1B9997054()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1B9997060()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B999706C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1B9997078()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B9997084()
{
  return MEMORY[0x1E0DEF588]();
}

uint64_t sub_1B9997090()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B999709C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B99970A8()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1B99970B4()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1B99970C0()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1B99970CC()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1B99970D8()
{
  return MEMORY[0x1E0C91CA0]();
}

uint64_t sub_1B99970E4()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_1B99970F0()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_1B99970FC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B9997108()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B9997114()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B9997120()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B999712C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B9997138()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B9997144()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B9997150()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B999715C()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1B9997168()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B9997174()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1B9997180()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1B999718C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1B9997198()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1B99971A4()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1B99971B0()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1B99971BC()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B99971C8()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1B99971D4()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1B99971E0()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1B99971EC()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_1B99971F8()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1B9997204()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B9997210()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B999721C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B9997228()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B9997234()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1B9997240()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B999724C()
{
  return MEMORY[0x1E0DEC2D0]();
}

uint64_t sub_1B9997258()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B9997264()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1B9997270()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B999727C()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B9997288()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B9997294()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B99972A0()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1B99972AC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B99972B8()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B99972C4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B99972D0()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1B99972DC()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B99972E8()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1B99972F4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B9997300()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1B999730C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B9997318()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B9997324()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B9997330()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D17838]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0D17848]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

uint64_t CNObserverCancelableCompletionHandler()
{
  return MEMORY[0x1E0D13890]();
}

uint64_t CNRunWithLock()
{
  return MEMORY[0x1E0D13908]();
}

uint64_t CNStringContainsChineseJapaneseKoreanCharacters()
{
  return MEMORY[0x1E0D13920]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t PNCopyBestGuessNormalizedNumberForCountry()
{
  return MEMORY[0x1E0D17868]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

