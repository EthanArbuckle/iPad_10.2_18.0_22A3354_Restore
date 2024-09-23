void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t sRecipientHandle_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "normalizedAddress");
}

void sub_1B1101F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B11035EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1B1103B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t isTraitCollectionAccessible(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0CEB3D8];
  v9 = *MEMORY[0x1E0CEB3E0];
  v10 = v1;
  v2 = *MEMORY[0x1E0CEB3C8];
  v11 = *MEMORY[0x1E0CEB3D0];
  v12 = v2;
  v13 = *MEMORY[0x1E0CEB3C0];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a1;
  objc_msgSend(v3, "arrayWithObjects:count:", &v9, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory", v9, v10, v11, v12, v13, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

NSObject *CreateSuggestionsFetchDebounceDispatchTimer(NSObject *a1, void *a2, double a3)
{
  id v5;
  NSObject *v6;
  dispatch_time_t v7;

  v5 = a2;
  v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, a1);
  if (v6)
  {
    v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    dispatch_source_set_event_handler(v6, v5);
    dispatch_resume(v6);
  }

  return v6;
}

void sub_1B1108D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B11099F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B110DA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B1110470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B1110AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
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

void sub_1B1111048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B1111ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t CNComposeFirstIndexInRangePassingTest(unint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  unsigned int (**v6)(_QWORD, _QWORD);

  v5 = a3;
  v6 = (unsigned int (**)(_QWORD, _QWORD))v5;
  if (a1 > a2)
    goto LABEL_9;
  if (((*((uint64_t (**)(id, unint64_t))v5 + 2))(v5, a1) & 1) != 0)
  {
    a2 = a1;
    goto LABEL_10;
  }
  if (!v6[2](v6, a2))
  {
LABEL_9:
    a2 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_10;
  }
  while (a1 + 1 < a2)
  {
    if (v6[2](v6, (a2 + a1) >> 1))
      a2 = (a2 + a1) >> 1;
    else
      a1 = (a2 + a1) >> 1;
  }
LABEL_10:

  return a2;
}

uint64_t CNComposeLastIndexInRangePassingTest(unint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t IndexInRangePassingTest;
  unint64_t v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = v5;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a1 <= a2)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __CNComposeLastIndexInRangePassingTest_block_invoke;
    v11[3] = &unk_1E62BF5D8;
    v12 = v5;
    IndexInRangePassingTest = CNComposeFirstIndexInRangePassingTest(a1, a2, v11);
    v9 = IndexInRangePassingTest - 1;
    if (IndexInRangePassingTest == 0x7FFFFFFFFFFFFFFFLL)
      v9 = a2;
    if (IndexInRangePassingTest != a1)
      v7 = v9;

  }
  return v7;
}

uint64_t CNComposeLastIndexPassingTest(uint64_t a1, void *a2)
{
  if (a1)
    return CNComposeLastIndexInRangePassingTest(0, a1 - 1, a2);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

void sub_1B1114B20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
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

id CNAutocompleteSharedContactStore()
{
  if (CNAutocompleteSharedContactStore_onceToken != -1)
    dispatch_once(&CNAutocompleteSharedContactStore_onceToken, &__block_literal_global_6);
  return (id)CNAutocompleteSharedContactStore_store;
}

id CNAutocompleteSharedLocalOnlyContactStore()
{
  if (CNAutocompleteSharedLocalOnlyContactStore_onceToken != -1)
    dispatch_once(&CNAutocompleteSharedLocalOnlyContactStore_onceToken, &__block_literal_global_2);
  return (id)CNAutocompleteSharedLocalOnlyContactStore_store;
}

id CNAutocompleteFetchNonUnifiedContactsForPredicate(void *a1, void *a2, void *a3, _QWORD *a4)
{
  return fetchContactsForPredicate(a1, a2, a3, 0, a4);
}

id fetchContactsForPredicate(void *a1, void *a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = (objc_class *)MEMORY[0x1E0C97210];
  v11 = a3;
  v12 = a1;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithKeysToFetch:", v11);

  objc_msgSend(v13, "setPredicate:", v9);
  objc_msgSend(v13, "setUnifyResults:", a4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __fetchContactsForPredicate_block_invoke;
  v23 = &unk_1E62BF708;
  v15 = v14;
  v24 = v15;
  LOBYTE(v10) = objc_msgSend(v12, "enumerateContactsWithFetchRequest:error:usingBlock:", v13, &v25, &v20);

  v16 = v25;
  if ((v10 & 1) != 0)
  {

    v17 = (void *)objc_msgSend(v15, "copy", v20, v21, v22, v23);
  }
  else
  {
    contactsUtilsLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v9;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_1B10FF000, v18, OS_LOG_TYPE_DEFAULT, "Error fetching contact matching predicate %@, error: %@", buf, 0x16u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v16);

    v17 = 0;
  }

  return v17;
}

id CNAutocompleteCopyClosestMatchingExistingContactUsingAddressesAndDisplayName(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  return copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(a1, a2, a3, a4, a5, 0);
}

id copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void (**v24)(uint64_t, uint64_t);
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _CNCountableMatchesContext *v33;
  id v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _QWORD v52[9];

  v52[7] = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = 0;
  v41 = v11;
  if (!v11 || !v13)
    goto LABEL_23;
  v17 = *MEMORY[0x1E0C966D0];
  v52[0] = *MEMORY[0x1E0C96790];
  v52[1] = v17;
  v18 = *MEMORY[0x1E0C966C0];
  v52[2] = *MEMORY[0x1E0C96780];
  v52[3] = v18;
  v19 = *MEMORY[0x1E0C967B8];
  v52[4] = *MEMORY[0x1E0C96798];
  v52[5] = v19;
  v52[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v40 = v15;
  if (v15)
  {
    objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v15);
    v22 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v22;
  }
  v23 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  if ((objc_msgSend(v13, "isEqual:", *MEMORY[0x1E0C966A8]) & 1) != 0)
  {
    v37 = v14;
    v38 = v13;
    v24 = (void (**)(uint64_t, uint64_t))&__block_literal_global_39;
LABEL_9:
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v39 = v12;
    v25 = v12;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v48;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v48 != v28)
            objc_enumerationMutation(v25);
          v24[2]((uint64_t)v24, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v29));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          fetchContactsForPredicate(v41, v30, v21, a6, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            objc_msgSend(v23, "addObjectsFromArray:", v31);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v27);
    }

    v13 = v38;
    v12 = v39;
    v14 = v37;
    goto LABEL_19;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    v37 = v14;
    v38 = v13;
    v24 = (void (**)(uint64_t, uint64_t))&__block_literal_global_40;
    goto LABEL_9;
  }
LABEL_19:
  if (objc_msgSend(v23, "count") == 1)
  {
    objc_msgSend(v23, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v14, "ea_personNameComponents");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc_init(_CNCountableMatchesContext);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_4;
    v42[3] = &unk_1E62BF7D0;
    v46 = &__block_literal_global_44;
    v43 = v23;
    v44 = v32;
    v45 = v14;
    v34 = v32;
    -[_CNCountableMatchesContext countInstances:usingPredicate:](v33, "countInstances:usingPredicate:", v43, v42);
    -[_CNCountableMatchesContext highestMatches](v33, "highestMatches");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = v40;

LABEL_23:
  return v16;
}

id CNAutocompletePreferredAbbreviatedNameForAddressAndDisplayName(void *a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v34;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a4;
  idealDisplayName(v10, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(v10, "length") && objc_msgSend(v10, "ea_isLegalEmailAddress"))
  {
    objc_msgSend(MEMORY[0x1E0CB3850], "descriptorForUsedKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v13;
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1000);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v14;
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v11);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }
    v34 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(v9, v18, (void *)*MEMORY[0x1E0C966A8], v12, v16, 1);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v12, "ea_personNameComponents");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "givenName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {

      }
      else
      {
        objc_msgSend(v19, "familyName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
LABEL_16:

          goto LABEL_17;
        }
      }
      v22 = objc_alloc_init(MEMORY[0x1E0C97360]);
      objc_msgSend(v19, "namePrefix");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setNamePrefix:", v23);

      objc_msgSend(v19, "givenName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setGivenName:", v24);

      objc_msgSend(v19, "middleName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setMiddleName:", v25);

      objc_msgSend(v19, "familyName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFamilyName:", v26);

      objc_msgSend(v19, "nameSuffix");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setNameSuffix:", v27);

      v28 = objc_msgSend(v22, "copy");
      v19 = (id)v28;
      if (!v28)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v19, 1000);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29
      || (objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v19, 0),
          (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v30 = v29;

      v12 = v30;
    }
    if (a5)
    {
      v19 = objc_retainAutorelease(v19);
      *a5 = v19;
    }
    goto LABEL_16;
  }
LABEL_18:
  if (v12)
  {
    if (objc_msgSend(v12, "containsString:", CFSTR("@"))
      && !objc_msgSend(v12, "isEqualToString:", v10))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@>"), v12, v10);
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = v12;
    }
  }
  else
  {
    v31 = v10;
  }
  v32 = v31;

  return v32;
}

id idealDisplayName(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  int v7;
  _BOOL8 v8;
  int v9;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "length");
    if (v6 < 3)
    {
      v8 = 0;
    }
    else
    {
      v7 = objc_msgSend(v5, "characterAtIndex:", 0);
      v8 = 0;
      if (v7 == 60)
      {
        v9 = objc_msgSend(v5, "characterAtIndex:", v6 - 1);
        v8 = v9 == 62;
        if (v9 == 62)
          v6 -= 2;
      }
    }
    if (!objc_msgSend(v5, "compare:options:range:", v3, 9, v8, v6))
    {

      v5 = 0;
    }
  }

  return v5;
}

id CNAutocompletePreferredCompositeNameForAddressAndDisplayName(void *a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a4;
  idealDisplayName(v10, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(v10, "length") && objc_msgSend(v10, "ea_isLegalEmailAddress"))
  {
    CNAutocompleteDescriptorForRequiredKeysForCompositeName();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v11)
    {
      objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v11);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    v25[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(v9, v16, (void *)*MEMORY[0x1E0C966A8], v12, v14, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      preferredCompositeNameForUnifiedContact(v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18)
        v20 = (void *)v18;
      else
        v20 = v12;
      v21 = v20;

      if (a5)
        *a5 = objc_retainAutorelease(v17);
    }
    else
    {
      v21 = v12;
    }

    v12 = v21;
  }
  if (v12)
  {
    if (objc_msgSend(v12, "containsString:", CFSTR("@"))
      && !objc_msgSend(v12, "isEqualToString:", v10))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@>"), v12, v10);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = v12;
    }
  }
  else
  {
    v22 = v10;
  }
  v23 = v22;

  return v23;
}

id CNAutocompleteDescriptorForRequiredKeysForCompositeName()
{
  void *v0;
  void *v1;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0C967A0];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id preferredCompositeNameForUnifiedContact(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "shortNameFormatPrefersNicknames"))
  {
    objc_msgSend(v1, "nickname");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v1, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }

  return v3;
}

id CNAutocompletePreferredCompositeNameForContact(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  void *v33;
  _QWORD v34[13];

  v34[11] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v4)
  {
    CNAutocompleteDescriptorForRequiredKeysForCompositeName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = (void *)MEMORY[0x1E0C97200];
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predicateForContactsWithIdentifiers:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      fetchContactsForPredicate(v3, v9, v5, 1, &v29);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v29;
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        contactsUtilsLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          CNAutocompletePreferredCompositeNameForContact_cold_1((uint64_t)v4, (uint64_t)v11, v13);

      }
    }
    else
    {
      v12 = 0;
    }
    if (v12)
      v15 = v12;
    else
      v15 = v4;
    v16 = v15;
    if ((objc_msgSend(v16, "areKeysAvailable:", v5) & 1) == 0)
    {
      v17 = v16;
      v18 = *MEMORY[0x1E0C966D0];
      v34[0] = *MEMORY[0x1E0C96790];
      v34[1] = v18;
      v19 = *MEMORY[0x1E0C966C0];
      v34[2] = *MEMORY[0x1E0C96780];
      v34[3] = v19;
      v20 = *MEMORY[0x1E0C967D8];
      v34[4] = *MEMORY[0x1E0C96798];
      v34[5] = v20;
      v21 = *MEMORY[0x1E0C967D0];
      v34[6] = *MEMORY[0x1E0C967E0];
      v34[7] = v21;
      v22 = *MEMORY[0x1E0C967B8];
      v34[8] = *MEMORY[0x1E0C967A0];
      v34[9] = v22;
      v34[10] = *MEMORY[0x1E0C966A8];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 11);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc_init(MEMORY[0x1E0C97360]);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __fallbackContactForMissingContactRequiringKeys_block_invoke;
      v30[3] = &unk_1E62BF7F8;
      v31 = v17;
      v25 = v24;
      v32 = v25;
      v26 = v17;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v30);
      v27 = v32;
      v16 = v25;

    }
    preferredCompositeNameForUnifiedContact(v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id contactsUtilsLog()
{
  if (contactsUtilsLog_cn_once_token_1 != -1)
    dispatch_once(&contactsUtilsLog_cn_once_token_1, &__block_literal_global_46);
  return (id)contactsUtilsLog_cn_once_object_1;
}

uint64_t __fetchContactsForPredicate_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", a2);
}

id __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForContactsMatchingPhoneNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(a2, "hasPrefix:");
  else
    return 0;
}

uint64_t __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v2 = a1;
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "countForObject:", v4);
  v6 = *(_QWORD *)(v2 + 56);
  objc_msgSend(v4, "namePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 40), "namePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

  v9 = v5 + v6;
  v10 = *(_QWORD *)(v2 + 56);
  objc_msgSend(v4, "givenName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 40), "givenName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = (*(uint64_t (**)(uint64_t, void *, void *))(v10 + 16))(v10, v11, v12);

  v13 = v9 + v10;
  v14 = *(_QWORD *)(v2 + 56);
  objc_msgSend(v4, "middleName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 40), "middleName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = (*(uint64_t (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v16);

  v17 = v13 + v14;
  v18 = *(_QWORD *)(v2 + 56);
  objc_msgSend(v4, "familyName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 40), "familyName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = (*(uint64_t (**)(uint64_t, void *, void *))(v18 + 16))(v18, v19, v20);

  v21 = v17 + v18;
  v22 = *(_QWORD *)(v2 + 56);
  objc_msgSend(v4, "nameSuffix");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 40), "nameSuffix");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = (*(uint64_t (**)(uint64_t, void *, void *))(v22 + 16))(v22, v23, v24);

  v25 = v21 + v22;
  v26 = *(_QWORD *)(v2 + 56);
  objc_msgSend(v4, "organizationName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = (*(uint64_t (**)(uint64_t, void *, _QWORD))(v26 + 16))(v26, v27, *(_QWORD *)(v2 + 48));
  return v25 + v2;
}

void __contactsUtilsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "CNAutocompleteUIContactsUtilities");
  v1 = (void *)contactsUtilsLog_cn_once_object_1;
  contactsUtilsLog_cn_once_object_1 = (uint64_t)v0;

}

void __fallbackContactForMissingContactRequiringKeys_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isKeyAvailable:"))
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v4, v5);

  }
}

id _displayableAddressOfKind(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a1;
  if (v3 && a2 == 1)
  {
    v4 = (void *)CPPhoneNumberCopyFormattedStringForTextMessage();
    v5 = v4;
    if (v4)
    {
      v6 = v4;

      objc_msgSend(CFSTR("\u200E"), "stringByAppendingString:", v6);
      v3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

id _normalizeAddressOfKind(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  const char *v5;
  char *v6;
  CFStringRef v7;
  void *v8;
  const void *v9;
  uint64_t String;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    if (a2 == 1)
    {
      v4 = objc_retainAutorelease(v3);
      objc_msgSend(v4, "UTF8String");
      v5 = (const char *)CPPhoneNumberCopyNormalized();
      if (v5)
      {
        v6 = (char *)v5;
        v7 = CFStringCreateWithCString(0, v5, 0x8000100u);
        v8 = (void *)CPPhoneNumberCopyHomeCountryCode();
        v9 = (const void *)CFPhoneNumberCreate();
        String = CFPhoneNumberCreateString();

        v4 = (id)String;
        if (!String)
          v4 = (id)CFPhoneNumberCreateString();
        if (v9)
          CFRelease(v9);
        if (v7)
          CFRelease(v7);
        free(v6);

      }
    }
  }
  return v4;
}

uint64_t _fastCountOfCompleteMatches(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  _QWORD *v29;
  id v30;
  id obj;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (v5)
  {
    v29 = a3;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v5;
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v9;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v34)
    {
      v32 = *(_QWORD *)v43;
      v33 = v7;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v43 != v32)
            objc_enumerationMutation(obj);
          v35 = v10;
          v11 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v10);
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v36 = v7;
          v12 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v39;
LABEL_9:
            v15 = 0;
            while (1)
            {
              if (*(_QWORD *)v39 != v14)
                objc_enumerationMutation(v36);
              v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v15);
              if (objc_msgSend(v37, "count") == 1)
                break;
              objc_msgSend(v16, "address");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "displayString");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "ea_personNameComponents");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "givenName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                objc_msgSend(v19, "givenName");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "rangeOfString:options:", v11, 1);

                if (!v22)
                  goto LABEL_19;
              }
              if ((objc_msgSend(v19, "familyName"),
                    v23 = (void *)objc_claimAutoreleasedReturnValue(),
                    v23,
                    v23)
                && (objc_msgSend(v19, "familyName"),
                    v24 = (void *)objc_claimAutoreleasedReturnValue(),
                    v25 = objc_msgSend(v24, "rangeOfString:options:", v11, 1),
                    v24,
                    !v25)
                || v17 && !objc_msgSend(v17, "rangeOfString:options:", v11, 1))
              {
LABEL_19:
                objc_msgSend(v37, "addObject:", v16);
              }

              if (v13 == ++v15)
              {
                v13 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
                if (v13)
                  goto LABEL_9;
                break;
              }
            }
          }

          v10 = v35 + 1;
          v7 = v33;
        }
        while (v35 + 1 != v34);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v34);
    }

    v26 = objc_retainAutorelease(v37);
    *v29 = v26;
    v27 = objc_msgSend(v26, "count");

    v5 = v30;
  }
  else
  {
    v27 = objc_msgSend(v6, "count");
  }

  return v27;
}

id _sortedArrayByRelevancy(void *a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  void *v40;
  id v41;
  unint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  char v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  _QWORD *v52;
  _QWORD *v53;
  id v54;
  id v55;
  char *__base;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  id obj;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  BOOL v66;
  id v67;
  BOOL v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  if (objc_msgSend(v7, "length"))
  {
    v52 = a3;
    v53 = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CA6AB8];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = ___sortedArrayByRelevancy_block_invoke;
    v73[3] = &unk_1E62BF900;
    v54 = v7;
    v55 = v9;
    v74 = v55;
    objc_msgSend(v10, "enumerateTokensForString:locale:options:withHandler:", v7, 0, 0, v73);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __base = (char *)malloc_type_calloc(0x18uLL, objc_msgSend(v8, "count"), 0xEAFB10CEuLL);
    v59 = v8;
    v60 = v11;
    if (objc_msgSend(v8, "count"))
    {
      v12 = 0;
      do
      {
        v58 = v12;
        objc_msgSend(v8, "objectAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "compositeName");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "address");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        obj = v55;
        v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
        v57 = v13;
        if (v65)
        {
          v66 = 0;
          v62 = *(_QWORD *)v70;
          v63 = v14;
          v15 = -1;
          do
          {
            for (i = 0; i != v65; ++i)
            {
              if (*(_QWORD *)v70 != v62)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
              v68 = 0;
              v18 = 0x7FFFFFFFFFFFFFFFLL;
              if (!v14
                || ((v19 = objc_msgSend(v14, "rangeOfString:options:", v17, 385),
                     v21 = v19 - v20,
                     v68 = v19 == 0,
                     v19 != 0x7FFFFFFFFFFFFFFFLL)
                  ? (v22 = v21 == 0x7FFFFFFFFFFFFFFFLL)
                  : (v22 = 1),
                    v22))
              {
                v23 = v66;
              }
              else
              {
                v24 = v19;
                v18 = v21 + 15;
                if (v19)
                {
                  v23 = v19 == 0 || v66;
                }
                else
                {
                  v25 = v20;
                  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v14);
                  objc_msgSend(v26, "addAttribute:value:range:", CFSTR("CNComposeRecipientStringMatchType"), CFSTR("CNComposeRecipientStringMatchAddress"), v24, v25);
                  objc_msgSend(v11, "addObject:", v26);

                  v23 = 1;
                }
              }
              v67 = 0;
              _getDisplayNameMatches(v64, v17, &v67, &v68);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v67;
              objc_msgSend(v11, "addObjectsFromArray:", v27);
              v66 = (v68 | v23 & 1) != 0;
              v29 = objc_msgSend(v28, "count");
              if (v29
                && (objc_msgSend(v28, "objectAtIndex:", 0),
                    v30 = (void *)objc_claimAutoreleasedReturnValue(),
                    v31 = objc_msgSend(v30, "integerValue"),
                    v30,
                    v31 != 0x7FFFFFFFFFFFFFFFLL))
              {
                v32 = v31 + 5;
              }
              else
              {
                v32 = 0x7FFFFFFFFFFFFFFFLL;
              }
              if (v29 < 2)
              {
                v33 = 0;
              }
              else if (v29 - 2 < 2)
              {
                v33 = 10;
              }
              else
              {
                v33 = 0;
                v34 = 3;
                do
                {
                  objc_msgSend(v28, "objectAtIndex:", v34 - 2);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 += objc_msgSend(v35, "integerValue");

                  ++v34;
                }
                while (v29 != v34);
                if (v33 != 0x7FFFFFFFFFFFFFFFLL)
                  v33 += 10;
                v11 = v60;
              }
              objc_msgSend(v28, "lastObject");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "integerValue");

              if (v32 >= v33)
                v38 = v33;
              else
                v38 = v32;
              if (v38 >= v37)
                v38 = v37;
              if (v38 >= v18)
                v38 = v18;
              v15 += v38;

              v14 = v63;
            }
            v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
          }
          while (v65);
        }
        else
        {
          v66 = 0;
          v15 = -1;
        }

        v39 = &__base[24 * v58];
        *(_QWORD *)v39 = v15;
        *((_QWORD *)v39 + 1) = v58;
        v39[16] = v66;

        v12 = v58 + 1;
        v8 = v59;
      }
      while (v58 + 1 < (unint64_t)objc_msgSend(v59, "count"));
    }
    qsort(__base, objc_msgSend(v8, "count"), 0x18uLL, (int (__cdecl *)(const void *, const void *))_relevancyComparator);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v41 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v42 = 0;
      v43 = __base + 16;
      do
      {
        v44 = *((_QWORD *)v43 - 1);
        v45 = *v43;
        objc_msgSend(v8, "objectAtIndex:", v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:atIndexedSubscript:", v46, v42);

        v8 = v59;
        if ((v45 & 1) != 0)
        {
          objc_msgSend(v59, "objectAtIndex:", v44);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v47);

        }
        v43 += 24;
        ++v42;
      }
      while (v42 < objc_msgSend(v59, "count"));
    }
    free(__base);
    v48 = objc_retainAutorelease(v40);
    *v52 = v48;
    v49 = objc_retainAutorelease(v60);
    *v53 = v49;

    v7 = v54;
  }
  else
  {
    v50 = objc_retainAutorelease(v8);
    *a3 = v50;
    *a4 = MEMORY[0x1E0C9AA60];
    v41 = v50;
  }

  return v41;
}

void sub_1B1118F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

id _getDisplayNameMatches(void *a1, void *a2, _QWORD *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  _QWORD v25[4];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v7 = a1;
  v8 = a2;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    v11 = (void *)MEMORY[0x1E0CA6AB8];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = ___getDisplayNameMatches_block_invoke;
    v18[3] = &unk_1E62BF940;
    v19 = v8;
    v12 = v9;
    v20 = v12;
    v23 = &v26;
    v24 = v25;
    v21 = v7;
    v13 = v10;
    v22 = v13;
    objc_msgSend(v11, "enumerateTokensForString:locale:options:withHandler:", v21, 0, 0, v18);
    *a4 = *((_BYTE *)v27 + 24);
    v14 = objc_retainAutorelease(v12);
    *a3 = v14;
    v15 = v22;
    v16 = v13;

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(&v26, 8);

  }
  else
  {
    v16 = (id)MEMORY[0x1E0C9AA60];
    *a3 = MEMORY[0x1E0C9AA60];
  }

  return v16;
}

void sub_1B1119F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void ___sortedArrayByRelevancy_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t _relevancyComparator(_QWORD *a1, _QWORD *a2)
{
  unsigned int v2;

  if (*a1 >= *a2)
    v2 = 0;
  else
    v2 = -1;
  if (*a1 > *a2)
    return 1;
  else
    return v2;
}

void ___getDisplayNameMatches_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t i;
  __int128 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  v19 = xmmword_1E62BF920;
  v20 = CFSTR("CNComposeRecipientStringMatchLastName");
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7)
  {
    v10 = objc_msgSend(v7, "rangeOfString:options:", *(_QWORD *)(a1 + 32), 385, v19, v20, v21);
    v12 = v10;
    v13 = v11;
    v14 = v10 == 0;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v9 = v10 - v11;
  }
  else
  {
    v14 = 0;
    v12 = 0;
    v13 = 0;
  }
  v15 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9, v19, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= v14;
  if (v14)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
      && a3 + a4 >= (unint64_t)objc_msgSend(*(id *)(a1 + 48), "length"))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 2;
    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v8);
    objc_msgSend(v17, "addAttribute:value:range:", CFSTR("CNComposeRecipientStringMatchType"), *((_QWORD *)&v19 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)), v12, v13);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v17);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

  }
  for (i = 16; i != -8; i -= 8)

}

void sub_1B111C370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr;
  v6 = getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr;
  if (!getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke;
    v2[3] = &unk_1E62BFA18;
    v2[4] = &v3;
    __getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke((uint64_t)v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B111FDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (IMCoreLibraryCore_frameworkLibrary)
  {
    v2 = (void *)IMCoreLibraryCore_frameworkLibrary;
  }
  else
  {
    IMCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)IMCoreLibraryCore_frameworkLibrary;
    if (!IMCoreLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "IMSPIGetGroupPhotosForChatsWithGroupIDs");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id CNAutocompleteContactKeyForRecentsKind(void *a1)
{
  id v1;
  id *v2;
  id v3;

  v1 = a1;
  if ((objc_msgSend((id)*MEMORY[0x1E0D18208], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C966A8];
  }
  else
  {
    if (!objc_msgSend((id)*MEMORY[0x1E0D18228], "isEqualToString:", v1))
    {
      v3 = 0;
      goto LABEL_7;
    }
    v2 = (id *)MEMORY[0x1E0C967C0];
  }
  v3 = *v2;
LABEL_7:

  return v3;
}

id CNAutocompleteRecentsKindForContactKey(void *a1)
{
  id v1;
  id *v2;
  id v3;

  v1 = a1;
  if ((objc_msgSend((id)*MEMORY[0x1E0C966A8], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0D18208];
  }
  else
  {
    if (!objc_msgSend((id)*MEMORY[0x1E0C967C0], "isEqualToString:", v1))
    {
      v3 = 0;
      goto LABEL_7;
    }
    v2 = (id *)MEMORY[0x1E0D18228];
  }
  v3 = *v2;
LABEL_7:

  return v3;
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

BOOL CNComposeApplicationPreferredContentSizeIsLargerThanLarge()
{
  void *v0;
  NSString *v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();

  v2 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB420]) == NSOrderedDescending;
  return v2;
}

void sub_1B1123400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
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

id CNIconImageForDownwardChevron()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB568], 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("chevron.down"), v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id CNIconImageForPresentationOption(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5)
{
  id v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v7 = a2;
  if ((a5 & 1) != 0)
    _specialGlyphColorForSelectedPresentationOption(a1);
  else
    _specialGlyphColorForPresentationOption(a1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = v7;
  v9 = 0;
  if (a1 <= 1023)
  {
    if (a1 <= 63)
    {
      if (a1 == 16)
      {
        v9 = CFSTR("star.fill");
      }
      else if (a1 == 32)
      {
        v9 = CFSTR("checkmark.seal.fill");
      }
    }
    else
    {
      switch(a1)
      {
        case 64:
          v9 = CFSTR("lock.open.fill");
          break;
        case 128:
          v9 = CFSTR("lock.fill");
          break;
        case 256:
          v9 = CFSTR("questionmark.circle.fill");
          break;
      }
    }
  }
  else if (a1 >= 0x2000)
  {
    switch(a1)
    {
      case 0x2000:
        v9 = CFSTR("hourglass.tophalf.filled");
        break;
      case 0x20000:
        v9 = CFSTR("exclamationmark.circle");
        break;
      case 0x100000:
        v9 = CFSTR("checkmark.circle.fill");
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 1024:
        v9 = CFSTR("checkmark.circle");
        break;
      case 2048:
        v9 = CFSTR("xmark.circle");
        break;
      case 4096:
        v9 = CFSTR("questionmark.circle");
        break;
    }
  }
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB588], 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (v8)
    {
      objc_msgSend(v11, "imageWithTintColor:renderingMode:", v8, 1);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v13;
    }
    v12 = v12;
  }

  return v12;
}

id _specialGlyphColorForSelectedPresentationOption(uint64_t a1)
{
  if (a1 == 0x20000)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  else
    _specialGlyphColorForPresentationOption(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _specialGlyphColorForPresentationOption(uint64_t a1)
{
  void *v2;

  v2 = 0;
  if (a1 > 4095)
  {
    if (a1 != 4096)
    {
      if (a1 == 0x2000)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (a1 == 0x20000)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
      }
      return v2;
    }
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 == 16)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 == 1024 || a1 == 2048)
    goto LABEL_10;
  return v2;
}

void sub_1B1129334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B112A174(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CNComposeIsAppDesignedForVisionOS()
{
  return 0;
}

id CNAUILocalizedAddressSeparator()
{
  if (CNAUILocalizedAddressSeparator_cn_once_token_1 != -1)
    dispatch_once(&CNAUILocalizedAddressSeparator_cn_once_token_1, &__block_literal_global_12);
  return (id)CNAUILocalizedAddressSeparator_cn_once_object_1;
}

uint64_t getSimulateAutocompleteResultsInternalSetting()
{
  id v0;
  uint64_t v1;

  v0 = +[CNAutocompleteUIPreferences copyCompositionServicesPreferenceValueForKey:](CNAutocompleteUIPreferences, "copyCompositionServicesPreferenceValueForKey:", CFSTR("SimulateAutocompleteResults"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v1 = objc_msgSend(v0, "BOOLValue");
  else
    v1 = 0;

  return v1;
}

void sub_1B112E430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B112EBC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id contactsSearchManagerLog()
{
  if (contactsSearchManagerLog_cn_once_token_1 != -1)
    dispatch_once(&contactsSearchManagerLog_cn_once_token_1, &__block_literal_global_14);
  return (id)contactsSearchManagerLog_cn_once_object_1;
}

void __contactsSearchManagerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "contactssearchmanager");
  v1 = (void *)contactsSearchManagerLog_cn_once_object_1;
  contactsSearchManagerLog_cn_once_object_1 = (uint64_t)v0;

}

void sub_1B1131F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B11333F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B1133B7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B1133EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B1134FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B11368A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B1136DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B1138030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B113D50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CNAutocompletePreferredCompositeNameForContact_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1B10FF000, log, OS_LOG_TYPE_ERROR, "Error re-fetching contact matching contact %@, error: %@", (uint8_t *)&v3, 0x16u);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D17838]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0D17848]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CNSubstringRangesContainingEmojiInString()
{
  return MEMORY[0x1E0D13940]();
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1E0CFA250]();
}

uint64_t CPPhoneNumberCopyFormattedStringForTextMessage()
{
  return MEMORY[0x1E0CFA350]();
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x1E0CFA360]();
}

uint64_t CPPhoneNumberCopyNormalized()
{
  return MEMORY[0x1E0CFA378]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0CEA110]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
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

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0CEB250]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1E0CEB3A8]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0CEB3E8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0CEB418](category);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1E0CEB480]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1E0CEB4B8]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1E0CEB4C0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0CEB630](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0CEB638]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0CEB688](image);
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0CEBAB0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0CEBAF8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0CEBB20]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1E0CEBB28]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0CEBB30]();
}

uint64_t UIUnformattedPhoneNumberFromString()
{
  return MEMORY[0x1E0CEBDC8]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1E0CA5940](inUTI, inConformsToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

