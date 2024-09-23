void sub_228297E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  id *v23;

  _Block_object_dispose(&a23, 8);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_228298314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  id *v23;

  _Block_object_dispose(&a23, 8);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_228299920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22829A4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22829C0E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x250], 8);
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

void sub_22829D36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 152), 8);
  _Block_object_dispose((const void *)(v10 - 120), 8);
  _Unwind_Resume(a1);
}

FHPaymentRingSuggestionRequest *RequestFromPKAccountSummary(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, unsigned int a8)
{
  id v14;
  id v15;
  FHPaymentRingSuggestionRequest *v16;
  FHStatementDetails *v17;
  FHStatementDetails *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i;
  void *v87;
  FHPaymentRingData *v88;
  void *v89;
  void *v90;
  unsigned int v92;
  unsigned int v93;
  FHPaymentRingSuggestionRequest *v94;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  FHStatementDetails *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v99 = a2;
  v98 = a3;
  v97 = a4;
  v96 = a5;
  v15 = a6;
  v16 = objc_alloc_init(FHPaymentRingSuggestionRequest);
  v17 = objc_alloc_init(FHStatementDetails);
  v18 = objc_alloc_init(FHStatementDetails);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v14, "creditDetails");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isInMonthOfMerge");

  v100 = v15;
  v101 = v18;
  if (objc_opt_class())
  {
    v93 = a8;
    v22 = v14;
    objc_msgSend(v22, "details");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "creditDetails");
    v92 = v21;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "accountSummary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "currentStatement");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "openingDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setOpeningDate:](v17, "setOpeningDate:", v27);

    objc_msgSend(v22, "details");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "creditDetails");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "accountSummary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "currentStatement");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "closingDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setClosingDate:](v17, "setClosingDate:", v32);

    objc_msgSend(v22, "details");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "creditDetails");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "accountSummary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "balanceSummary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "openingDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setOpeningDate:](v101, "setOpeningDate:", v37);

    objc_msgSend(v22, "details");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "creditDetails");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "accountSummary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "balanceSummary");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "closingDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setClosingDate:](v101, "setClosingDate:", v42);

    objc_msgSend(v22, "details");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "creditDetails");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "accountSummary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "creditLimit");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setCreditLimit:](v17, "setCreditLimit:", v46);

    objc_msgSend(v22, "details");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "creditDetails");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "accountSummary");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "currentBalance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setCurrentBalance:](v17, "setCurrentBalance:", v50);

    objc_msgSend(v22, "details");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "creditDetails");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "accountSummary");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "adjustedBalance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setCurrentBalanceForMonthZero:](v17, "setCurrentBalanceForMonthZero:", v54);

    objc_msgSend(v22, "details");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "creditDetails");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "accountSummary");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "currentStatement");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "minimumDue");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setMinimumDue:](v17, "setMinimumDue:", v59);

    objc_msgSend(v22, "details");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "creditDetails");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "accountSummary");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "remainingMinimumPayment");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setRemainingMinimumPayment:](v17, "setRemainingMinimumPayment:", v63);

    objc_msgSend(v22, "details");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "creditDetails");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "accountSummary");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "currentStatement");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "statementBalance");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setStatementBalance:](v17, "setStatementBalance:", v68);

    objc_msgSend(v22, "details");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "creditDetails");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "accountSummary");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "remainingStatementBalance");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setRemainingStatementBalance:](v17, "setRemainingStatementBalance:", v72);

    objc_msgSend(v22, "details");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "creditDetails");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "accountSummary");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "remainingStatementBalanceForInterestCalculation");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setCombinedBalance:](v17, "setCombinedBalance:", v76);

    objc_msgSend(v22, "details");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v77, "creditDetails");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "accountSummary");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "currentStatement");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "identifier");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails setCurrentStatementIdentifier:](v17, "setCurrentStatementIdentifier:", v81);

    v15 = v100;
    v18 = v101;
    -[FHStatementDetails setIsMonthZero:](v17, "setIsMonthZero:", a7);
    -[FHStatementDetails setIsMonthOne:](v17, "setIsMonthOne:", v93);
    -[FHStatementDetails setIsMonthOfMerge:](v17, "setIsMonthOfMerge:", v92);
  }
  if (objc_opt_class())
  {
    v94 = v16;
    v82 = v15;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v102, v106, 16);
    if (v83)
    {
      v84 = v83;
      v85 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v84; ++i)
        {
          if (*(_QWORD *)v103 != v85)
            objc_enumerationMutation(v82);
          v87 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
          v88 = objc_alloc_init(FHPaymentRingData);
          objc_msgSend(v87, "transactionDate");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHPaymentRingData setTransactionDate:](v88, "setTransactionDate:", v89);

          objc_msgSend(v87, "transactionAmount");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHPaymentRingData setTransactionAmount:](v88, "setTransactionAmount:", v90);

          -[FHPaymentRingData setPaymentAmountCategory:](v88, "setPaymentAmountCategory:", objc_msgSend(v87, "suggestedAmountCategory"));
          objc_msgSend(v19, "addObject:", v88);

        }
        v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v102, v106, 16);
      }
      while (v84);
    }

    v16 = v94;
    v15 = v100;
    v18 = v101;
  }
  -[FHPaymentRingSuggestionRequest setCurrentStatement:](v16, "setCurrentStatement:", v17);
  -[FHPaymentRingSuggestionRequest setPreviousStatement:](v16, "setPreviousStatement:", v18);
  -[FHPaymentRingSuggestionRequest setPreviousStatementPaymentsSum:](v16, "setPreviousStatementPaymentsSum:", v99);
  -[FHPaymentRingSuggestionRequest setCurrentStatementPaymentsSum:](v16, "setCurrentStatementPaymentsSum:", v98);
  -[FHPaymentRingSuggestionRequest setStatementPurchasesSum:](v16, "setStatementPurchasesSum:", v97);
  -[FHPaymentRingSuggestionRequest setMerchantCategoryTransactionSums:](v16, "setMerchantCategoryTransactionSums:", v96);
  -[FHPaymentRingSuggestionRequest setPaymentDetails:](v16, "setPaymentDetails:", v19);

  return v16;
}

id ResponseToPKBillPaymentSuggestion(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x24BE6EA68]);
        objc_msgSend(v8, "amount", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithAmount:category:", v10, objc_msgSend(v8, "category"));

        objc_msgSend(v11, "setMerchantCategory:", objc_msgSend(v8, "merchantCategory"));
        objc_msgSend(v2, "addObject:", v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v2;
}

uint64_t FHPaymentRingSuggestionCategoryFromString()
{
  return MEMORY[0x24BE31548]();
}

uint64_t FHPaymentRingSuggestionCategoryToString()
{
  return MEMORY[0x24BE31550]();
}

uint64_t FinHealthLogObject()
{
  return MEMORY[0x24BE315B8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

