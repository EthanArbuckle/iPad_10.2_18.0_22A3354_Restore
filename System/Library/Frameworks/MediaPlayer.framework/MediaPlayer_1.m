void __Block_byref_object_dispose__48770(uint64_t a1)
{

}

void sub_193E8DC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFRestrictionsPasscodeControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!SettingsFoundationLibraryCore_frameworkLibrary)
    SettingsFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SettingsFoundationLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SettingsFoundationLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPRestrictionsMonitor.m"), 47, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SFRestrictionsPasscodeController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSFRestrictionsPasscodeControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MPRestrictionsMonitor.m"), 48, CFSTR("Unable to find class %s"), "SFRestrictionsPasscodeController");

LABEL_8:
    __break(1u);
  }
  getSFRestrictionsPasscodeControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_193E92504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193E92C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__49899(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__49900(uint64_t a1)
{

}

void sub_193E93740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadExternalPropertyRentalInformation()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr;
  v8 = getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr;
  if (!getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr)
  {
    v1 = StoreServicesLibrary();
    v0 = (id *)dlsym(v1, "SSDownloadExternalPropertyRentalInformation");
    v6[3] = (uint64_t)v0;
    getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadExternalPropertyRentalInformation(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPStoreDownload.m"), 30, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_193E939C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *StoreServicesLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!StoreServicesLibraryCore_frameworkLibrary_49909)
    StoreServicesLibraryCore_frameworkLibrary_49909 = _sl_dlopen();
  v0 = (void *)StoreServicesLibraryCore_frameworkLibrary_49909;
  if (!StoreServicesLibraryCore_frameworkLibrary_49909)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *StoreServicesLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("MPStoreDownload.m"), 22, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void getSSDownloadPropertyStoreItemIdentifier()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr;
  v8 = getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr;
  if (!getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr)
  {
    v1 = StoreServicesLibrary();
    v0 = (id *)dlsym(v1, "SSDownloadPropertyStoreItemIdentifier");
    v6[3] = (uint64_t)v0;
    getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyStoreItemIdentifier(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPStoreDownload.m"), 46, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_193E93BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadPropertyReason()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSSDownloadPropertyReasonSymbolLoc_ptr;
  v8 = getSSDownloadPropertyReasonSymbolLoc_ptr;
  if (!getSSDownloadPropertyReasonSymbolLoc_ptr)
  {
    v1 = StoreServicesLibrary();
    v0 = (id *)dlsym(v1, "SSDownloadPropertyReason");
    v6[3] = (uint64_t)v0;
    getSSDownloadPropertyReasonSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyReason(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPStoreDownload.m"), 48, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_193E93CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadPhasePaused()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSSDownloadPhasePausedSymbolLoc_ptr;
  v8 = getSSDownloadPhasePausedSymbolLoc_ptr;
  if (!getSSDownloadPhasePausedSymbolLoc_ptr)
  {
    v1 = StoreServicesLibrary();
    v0 = (id *)dlsym(v1, "SSDownloadPhasePaused");
    v6[3] = (uint64_t)v0;
    getSSDownloadPhasePausedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPhasePaused(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPStoreDownload.m"), 37, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_193E93DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadPhasePreflight()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSSDownloadPhasePreflightSymbolLoc_ptr;
  v8 = getSSDownloadPhasePreflightSymbolLoc_ptr;
  if (!getSSDownloadPhasePreflightSymbolLoc_ptr)
  {
    v1 = StoreServicesLibrary();
    v0 = (id *)dlsym(v1, "SSDownloadPhasePreflight");
    v6[3] = (uint64_t)v0;
    getSSDownloadPhasePreflightSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPhasePreflight(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPStoreDownload.m"), 38, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_193E93EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadPhaseProcessing()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSSDownloadPhaseProcessingSymbolLoc_ptr;
  v8 = getSSDownloadPhaseProcessingSymbolLoc_ptr;
  if (!getSSDownloadPhaseProcessingSymbolLoc_ptr)
  {
    v1 = StoreServicesLibrary();
    v0 = (id *)dlsym(v1, "SSDownloadPhaseProcessing");
    v6[3] = (uint64_t)v0;
    getSSDownloadPhaseProcessingSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPhaseProcessing(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPStoreDownload.m"), 39, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_193E93FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadPhaseWaiting()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSSDownloadPhaseWaitingSymbolLoc_ptr;
  v8 = getSSDownloadPhaseWaitingSymbolLoc_ptr;
  if (!getSSDownloadPhaseWaitingSymbolLoc_ptr)
  {
    v1 = StoreServicesLibrary();
    v0 = (id *)dlsym(v1, "SSDownloadPhaseWaiting");
    v6[3] = (uint64_t)v0;
    getSSDownloadPhaseWaitingSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPhaseWaiting(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPStoreDownload.m"), 40, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_193E9409C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadPropertyLibraryItemIdentifier()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr;
  v8 = getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr;
  if (!getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr)
  {
    v1 = StoreServicesLibrary();
    v0 = (id *)dlsym(v1, "SSDownloadPropertyLibraryItemIdentifier");
    v6[3] = (uint64_t)v0;
    getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyLibraryItemIdentifier(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPStoreDownload.m"), 47, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_193E94194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193E9479C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193E959F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a40, 8);
  _Unwind_Resume(a1);
}

void __getSSPurchaseClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  StoreServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SSPurchase");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSSPurchaseClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSSPurchaseClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPStoreDownload.m"), 26, CFSTR("Unable to find class %s"), "SSPurchase");

    __break(1u);
  }
}

id getSSDownloadPolicyClass()
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
  v0 = (void *)getSSDownloadPolicyClass_softClass;
  v7 = getSSDownloadPolicyClass_softClass;
  if (!getSSDownloadPolicyClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSSDownloadPolicyClass_block_invoke;
    v3[3] = &unk_1E31639A0;
    v3[4] = &v4;
    __getSSDownloadPolicyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_193E95BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSSDownloadPolicyRuleClass()
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
  v0 = (void *)getSSDownloadPolicyRuleClass_softClass;
  v7 = getSSDownloadPolicyRuleClass_softClass;
  if (!getSSDownloadPolicyRuleClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSSDownloadPolicyRuleClass_block_invoke;
    v3[3] = &unk_1E31639A0;
    v3[4] = &v4;
    __getSSDownloadPolicyRuleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_193E95C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSSDownloadPolicyUserDefaultStateClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  StoreServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SSDownloadPolicyUserDefaultState");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadPolicyUserDefaultStateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSSDownloadPolicyUserDefaultStateClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPStoreDownload.m"), 28, CFSTR("Unable to find class %s"), "SSDownloadPolicyUserDefaultState");

    __break(1u);
  }
}

void __getSSMutableURLRequestPropertiesClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  StoreServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SSMutableURLRequestProperties");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSSMutableURLRequestPropertiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSSMutableURLRequestPropertiesClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPStoreDownload.m"), 24, CFSTR("Unable to find class %s"), "SSMutableURLRequestProperties");

    __break(1u);
  }
}

void __getSSDownloadPolicyRuleClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  StoreServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SSDownloadPolicyRule");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadPolicyRuleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSSDownloadPolicyRuleClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPStoreDownload.m"), 23, CFSTR("Unable to find class %s"), "SSDownloadPolicyRule");

    __break(1u);
  }
}

void __getSSDownloadPolicyClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  StoreServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SSDownloadPolicy");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadPolicyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSSDownloadPolicyClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPStoreDownload.m"), 25, CFSTR("Unable to find class %s"), "SSDownloadPolicy");

    __break(1u);
  }
}

void __getSSDownloadClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  StoreServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SSDownload");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSSDownloadClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPStoreDownload.m"), 27, CFSTR("Unable to find class %s"), "SSDownload");

    __break(1u);
  }
}

const __CFString *MPStoreDownloadSSDownloadKindFromMPMediaType(__int16 a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  v1 = CFSTR("feature-movie");
  v2 = CFSTR("tv-episode");
  v3 = CFSTR("book");
  v4 = CFSTR("podcast");
  v5 = CFSTR("videoPodcast");
  if ((a1 & 0x400) == 0)
    v5 = CFSTR("song");
  if ((a1 & 2) == 0)
    v4 = v5;
  if ((a1 & 4) == 0)
    v3 = v4;
  if ((a1 & 0x200) == 0)
    v2 = v3;
  if ((a1 & 0x100) == 0)
    v1 = v2;
  if ((a1 & 0x800) != 0)
    return CFSTR("music-video");
  else
    return v1;
}

uint64_t MPStoreDownloadAdditionalBuyParametersForOriginator(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("&reporting=%@"), a1);
}

id MPStoreDownloadOriginatorWithStationInformation(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = (void *)objc_msgSend(a1, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    if (a3)
      objc_msgSend(v6, "appendFormat:", CFSTR(";stationId:%llu"), a3);
    if (v5)
      objc_msgSend(v7, "appendFormat:", CFSTR(";stationHash:%@"), v5);
    v8 = v7;
  }

  return v7;
}

void sub_193E9641C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193E96A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  id *v33;

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_193E9A644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *StoreServicesLibrary_50149()
{
  void *v0;
  void *v2;
  void *v3;

  if (!StoreServicesLibraryCore_frameworkLibrary_50163)
    StoreServicesLibraryCore_frameworkLibrary_50163 = _sl_dlopen();
  v0 = (void *)StoreServicesLibraryCore_frameworkLibrary_50163;
  if (!StoreServicesLibraryCore_frameworkLibrary_50163)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *StoreServicesLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("MPStoreDownloadManager.m"), 35, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void getSSDownloadPropertyLibraryItemIdentifier_50156()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr_50158;
  v8 = getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr_50158;
  if (!getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr_50158)
  {
    v1 = StoreServicesLibrary_50149();
    v0 = (id *)dlsym(v1, "SSDownloadPropertyLibraryItemIdentifier");
    v6[3] = (uint64_t)v0;
    getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr_50158 = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyLibraryItemIdentifier(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPStoreDownloadManager.m"), 53, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_193E9ADCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193E9B2B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

id getSSPurchaseClass()
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
  v0 = (void *)getSSPurchaseClass_softClass_50174;
  v7 = getSSPurchaseClass_softClass_50174;
  if (!getSSPurchaseClass_softClass_50174)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSSPurchaseClass_block_invoke_50175;
    v3[3] = &unk_1E31639A0;
    v3[4] = &v4;
    __getSSPurchaseClass_block_invoke_50175((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_193E9B370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSSDownloadClass_block_invoke_50169(uint64_t a1)
{
  void *v2;
  void *v3;

  StoreServicesLibrary_50149();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SSDownload");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadClass_softClass_50168 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSSDownloadClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPStoreDownloadManager.m"), 41, CFSTR("Unable to find class %s"), "SSDownload");

    __break(1u);
  }
}

void __getSSPurchaseClass_block_invoke_50175(uint64_t a1)
{
  void *v2;
  void *v3;

  StoreServicesLibrary_50149();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SSPurchase");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSSPurchaseClass_softClass_50174 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSSPurchaseClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPStoreDownloadManager.m"), 40, CFSTR("Unable to find class %s"), "SSPurchase");

    __break(1u);
  }
}

void getSSDownloadPropertyStoreItemIdentifier_50197()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr_50198;
  v8 = getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr_50198;
  if (!getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr_50198)
  {
    v1 = StoreServicesLibrary_50149();
    v0 = (id *)dlsym(v1, "SSDownloadPropertyStoreItemIdentifier");
    v6[3] = (uint64_t)v0;
    getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr_50198 = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyStoreItemIdentifier(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPStoreDownloadManager.m"), 56, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_193E9B838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__50201(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__50202(uint64_t a1)
{

}

void soft_SSDownloadPhaseIsFinishedPhase(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v1 = a1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getSSDownloadPhaseIsFinishedPhaseSymbolLoc_ptr;
  v9 = getSSDownloadPhaseIsFinishedPhaseSymbolLoc_ptr;
  if (!getSSDownloadPhaseIsFinishedPhaseSymbolLoc_ptr)
  {
    v3 = StoreServicesLibrary_50149();
    v2 = dlsym(v3, "SSDownloadPhaseIsFinishedPhase");
    v7[3] = (uint64_t)v2;
    getSSDownloadPhaseIsFinishedPhaseSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (v2)
  {
    ((void (*)(id))v2)(v1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL soft_SSDownloadPhaseIsFinishedPhase(NSString *__strong)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MPStoreDownloadManager.m"), 72, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_193E9BF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadPhaseFailed()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSSDownloadPhaseFailedSymbolLoc_ptr_50235;
  v8 = getSSDownloadPhaseFailedSymbolLoc_ptr_50235;
  if (!getSSDownloadPhaseFailedSymbolLoc_ptr_50235)
  {
    v1 = StoreServicesLibrary_50149();
    v0 = (id *)dlsym(v1, "SSDownloadPhaseFailed");
    v6[3] = (uint64_t)v0;
    getSSDownloadPhaseFailedSymbolLoc_ptr_50235 = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPhaseFailed(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPStoreDownloadManager.m"), 71, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_193E9C010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193E9D568(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void *_MPStoreDownloadManagerInt64KeyPointerFunctionAcquire(const void *a1, uint64_t (*a2)(void))
{
  size_t v3;
  void *v4;

  if (!a1)
    return 0;
  v3 = a2();
  v4 = malloc_type_malloc(v3, 0xC2C006DuLL);
  memcpy(v4, a1, v3);
  return v4;
}

void _MPStoreDownloadManagerInt64KeyPointerFunctionRelinquish(void *a1)
{
  if (a1)
    free(a1);
}

_QWORD *_MPStoreDownloadManagerInt64KeyPointerFunctionHash(_QWORD *result)
{
  if (result)
    return (_QWORD *)((uint64_t)(*result ^ (*result << 32)) >> 32);
  return result;
}

BOOL _MPStoreDownloadManagerInt64KeyPointerFunctionIsEqual(_QWORD *a1, _QWORD *a2)
{
  _BOOL8 result;

  if (a1 == a2)
    return 1;
  result = 0;
  if (a1)
  {
    if (a2)
      return *a1 == *a2;
  }
  return result;
}

uint64_t _MPStoreDownloadManagerInt64KeyPointerFunctionSize()
{
  return 8;
}

__CFString *_MPStoreDownloadManagerInt64KeyPointerFunctionDescription(_QWORD *a1)
{
  if (!a1)
    return CFSTR("0");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lli"), *a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_193E9E564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__50429(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__50430(uint64_t a1)
{

}

uint64_t MPSubscriptionStatusCapabilitiesForSubscriptionStatus(void *a1)
{
  id v1;
  uint64_t v2;
  int v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "hasCapability:", 1);
  v3 = objc_msgSend(v1, "hasCapability:", 256);

  if (v3)
    return v2 | 2;
  else
    return v2;
}

BOOL MPPMediaPredicateReadFrom(void *a1, void *a2)
{
  id v3;
  _BYTE *v4;
  int *v5;
  int *v6;
  int *v7;
  int *v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  MPPPropertyPredicate *v24;
  _BOOL8 v25;

  v3 = a1;
  v4 = a2;
  v5 = (int *)MEMORY[0x1E0D82BF0];
  v6 = (int *)MEMORY[0x1E0D82BD8];
  v7 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_49:
    v25 = v4[*v7] == 0;
    goto LABEL_50;
  }
  v8 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v7])
      goto LABEL_49;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = *v5;
      v13 = *(_QWORD *)&v4[v12];
      if (v13 == -1 || v13 >= *(_QWORD *)&v4[*v6])
        break;
      v14 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v13);
      *(_QWORD *)&v4[v12] = v13 + 1;
      v11 |= (unint64_t)(v14 & 0x7F) << v9;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v9 += 7;
      v15 = v10++ >= 9;
      if (v15)
      {
        LODWORD(v11) = 0;
        v16 = v4[*v7];
        goto LABEL_14;
      }
    }
    v4[*v7] = 1;
LABEL_12:
    v16 = v4[*v7];
    if (v4[*v7])
      LODWORD(v11) = 0;
LABEL_14:
    if (v16 || (v11 & 7) == 4)
      goto LABEL_49;
    switch((unsigned __int16)(v11 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *((_BYTE *)v3 + 52) |= 1u;
        while (1)
        {
          v21 = *v5;
          v22 = *(_QWORD *)&v4[v21];
          if (v22 == -1 || v22 >= *(_QWORD *)&v4[*v6])
            break;
          v23 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v22);
          *(_QWORD *)&v4[v21] = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_46;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_48;
          }
        }
        v4[*v7] = 1;
LABEL_46:
        if (v4[*v7])
          LODWORD(v20) = 0;
LABEL_48:
        *((_DWORD *)v3 + 12) = v20;
        goto LABEL_43;
      case 2u:
        v24 = objc_alloc_init(MPPPropertyPredicate);
        objc_storeStrong((id *)v3 + 4, v24);
        if (!PBReaderPlaceMark() || !MPPPropertyPredicateReadFrom(v24, v4))
          goto LABEL_51;
        goto LABEL_42;
      case 3u:
        v24 = objc_alloc_init(MPPCompoundPredicate);
        objc_storeStrong((id *)v3 + 1, v24);
        if (!PBReaderPlaceMark() || (MPPCompoundPredicateReadFrom(v24, v4) & 1) == 0)
          goto LABEL_51;
        goto LABEL_42;
      case 4u:
        v24 = objc_alloc_init(MPPConditionalPredicate);
        objc_storeStrong((id *)v3 + 2, v24);
        if (!PBReaderPlaceMark() || !MPPConditionalPredicateReadFrom(v24, v4))
          goto LABEL_51;
        goto LABEL_42;
      case 5u:
        v24 = objc_alloc_init(MPPPersistentIDsPredicate);
        objc_storeStrong((id *)v3 + 3, v24);
        if (!PBReaderPlaceMark() || !MPPPersistentIDsPredicateReadFrom(v24, v4))
          goto LABEL_51;
        goto LABEL_42;
      case 6u:
        v24 = objc_alloc_init(MPPSearchStringPredicate);
        objc_storeStrong((id *)v3 + 5, v24);
        if (PBReaderPlaceMark() && MPPSearchStringPredicateReadFrom(v24, v4))
        {
LABEL_42:
          PBReaderRecallMark();

LABEL_43:
          if (*(_QWORD *)&v4[*v5] >= *(_QWORD *)&v4[*v6])
            goto LABEL_49;
          continue;
        }
LABEL_51:

LABEL_52:
        v25 = 0;
LABEL_50:

        return v25;
      default:
        if (!PBReaderSkipValueWithTag())
          goto LABEL_52;
        goto LABEL_43;
    }
  }
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1E0CB17D8]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x1E0DEC498]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x1E0DECAE0](isUnique, capacity);
}

uint64_t type metadata accessor for _NativeDictionary()
{
  return MEMORY[0x1E0DECB20]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t dispatch thunk of Decoder.codingPath.getter()
{
  return MEMORY[0x1E0DEE220]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
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

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B0](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803C0](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
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

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
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

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
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

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x1E0C9C030](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x1E0C9C400](c, space);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x1E0C9C4C0](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGSize CGSizeFromString(NSString *string)
{
  double v1;
  double v2;
  CGSize result;

  MEMORY[0x1E0DC3280](string);
  result.height = v2;
  result.width = v1;
  return result;
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1E0C9F3A0](range, time);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1E0C9F3B8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1E0C9F3C0](range1, range2);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1E0C9F3D0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3D8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t HSLibraryCacheDirectoryForIdentifier()
{
  return MEMORY[0x1E0D33580]();
}

uint64_t HSLibraryCacheRootDirectory()
{
  return MEMORY[0x1E0D33588]();
}

uint64_t ICBundleIdentifierForSystemApplicationType()
{
  return MEMORY[0x1E0DDBC90]();
}

uint64_t ICCloudClientMigrateAllowMatchOnCellularToAllowAutoDownloadOnCellular()
{
  return MEMORY[0x1E0DDBCE8]();
}

uint64_t ICCloudClientMigrateStoreAllowAutomaticDownloadsOnCellularToMusicAllowDownloadOnCellular()
{
  return MEMORY[0x1E0DDBCF0]();
}

uint64_t ICCreateLoggableValueForDSIDString()
{
  return MEMORY[0x1E0DDBD10]();
}

uint64_t ICEnvironmentNetworkTypeIsCellular()
{
  return MEMORY[0x1E0DDBD20]();
}

uint64_t ICFairPlayGetHardwareInfo()
{
  return MEMORY[0x1E0DDBD40]();
}

uint64_t ICStoreVideoArtworkInfoBestSizesForSize()
{
  return MEMORY[0x1E0DDBE58]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MIPMultiverseIdentifierReadFrom()
{
  return MEMORY[0x1E0D50768]();
}

uint64_t ML3ArtworkPurgeabilityLevelCache()
{
  return MEMORY[0x1E0D50820]();
}

uint64_t ML3ContainerItemOccurrenceID()
{
  return MEMORY[0x1E0D50890]();
}

uint64_t ML3ContainerItemOccurrencePrefix()
{
  return MEMORY[0x1E0D50898]();
}

uint64_t MRAVEndpointCopyLocalizedName()
{
  return MEMORY[0x1E0D4B3D0]();
}

uint64_t MRAVEndpointCopyOutputDevices()
{
  return MEMORY[0x1E0D4B3E0]();
}

uint64_t MRAVEndpointGetClass()
{
  return MEMORY[0x1E0D4B408]();
}

uint64_t MRAVEndpointGetDesignatedGroupLeader()
{
  return MEMORY[0x1E0D4B410]();
}

uint64_t MRAVEndpointGetExternalDevice()
{
  return MEMORY[0x1E0D4B418]();
}

uint64_t MRAVEndpointGetLocalEndpoint()
{
  return MEMORY[0x1E0D4B420]();
}

uint64_t MRAVEndpointGetOutputDeviceVolume()
{
  return MEMORY[0x1E0D4B440]();
}

uint64_t MRAVEndpointGetOutputDeviceVolumeControlCapabilities()
{
  return MEMORY[0x1E0D4B448]();
}

uint64_t MRAVEndpointGetVolume()
{
  return MEMORY[0x1E0D4B450]();
}

uint64_t MRAVEndpointGetVolumeControlCapabilities()
{
  return MEMORY[0x1E0D4B458]();
}

uint64_t MRAVEndpointIsLocalEndpoint()
{
  return MEMORY[0x1E0D4B460]();
}

uint64_t MRAVEndpointRemoveOutputDevicesWithInitiator()
{
  return MEMORY[0x1E0D4B498]();
}

uint64_t MRAVEndpointResolveActiveSystemEndpoint()
{
  return MEMORY[0x1E0D4B4A0]();
}

uint64_t MRAVEndpointResolveActiveSystemEndpointWithType()
{
  return MEMORY[0x1E0D4B4A8]();
}

uint64_t MRAVEndpointSetOutputDeviceVolume()
{
  return MEMORY[0x1E0D4B4B8]();
}

uint64_t MRAVEndpointSetVolume()
{
  return MEMORY[0x1E0D4B4C0]();
}

uint64_t MRAVEndpointUpdateActiveSystemEndpointWithReason()
{
  return MEMORY[0x1E0D4B4C8]();
}

uint64_t MRAVOutputContextCopyOutputDevices()
{
  return MEMORY[0x1E0D4B4F0]();
}

uint64_t MRAVOutputContextCopyPredictedOutputDevice()
{
  return MEMORY[0x1E0D4B4F8]();
}

uint64_t MRAVOutputContextCopyUniqueIdentifier()
{
  return MEMORY[0x1E0D4B500]();
}

uint64_t MRAVOutputContextCreateRoutingContext()
{
  return MEMORY[0x1E0D4B508]();
}

uint64_t MRAVOutputContextGetSharedAudioPresentationContext()
{
  return MEMORY[0x1E0D4B510]();
}

uint64_t MRAVOutputContextRemoveOutputDevices()
{
  return MEMORY[0x1E0D4B518]();
}

uint64_t MRAVOutputContextResetPredictedOutputDevice()
{
  return MEMORY[0x1E0D4B520]();
}

uint64_t MRAVOutputContextSetOutputDevicesWithInitiator()
{
  return MEMORY[0x1E0D4B528]();
}

uint64_t MRAVOutputDeviceAllowsHeadTrackedSpatialAudio()
{
  return MEMORY[0x1E0D4B530]();
}

uint64_t MRAVOutputDeviceCanAccessRemoteAssets()
{
  return MEMORY[0x1E0D4B538]();
}

uint64_t MRAVOutputDeviceCanFetchMediaDataFromSender()
{
  return MEMORY[0x1E0D4B540]();
}

uint64_t MRAVOutputDeviceCanPlayEncryptedProgressiveDownloadAssets()
{
  return MEMORY[0x1E0D4B548]();
}

uint64_t MRAVOutputDeviceCopyDNSNames()
{
  return MEMORY[0x1E0D4B550]();
}

uint64_t MRAVOutputDeviceCopyGroupIdentifier()
{
  return MEMORY[0x1E0D4B558]();
}

uint64_t MRAVOutputDeviceCopyLocalDeviceLocalizedName()
{
  return MEMORY[0x1E0D4B560]();
}

uint64_t MRAVOutputDeviceCopyModelID()
{
  return MEMORY[0x1E0D4B568]();
}

uint64_t MRAVOutputDeviceCopyModelSpecificInformation()
{
  return MEMORY[0x1E0D4B570]();
}

uint64_t MRAVOutputDeviceCopyName()
{
  return MEMORY[0x1E0D4B578]();
}

uint64_t MRAVOutputDeviceCopyPlayingPairedDeviceName()
{
  return MEMORY[0x1E0D4B580]();
}

uint64_t MRAVOutputDeviceCopySourceInfo()
{
  return MEMORY[0x1E0D4B588]();
}

uint64_t MRAVOutputDeviceCopyUniqueIdentifier()
{
  return MEMORY[0x1E0D4B590]();
}

uint64_t MRAVOutputDeviceCreateFromAVOutputDevice()
{
  return MEMORY[0x1E0D4B598]();
}

uint64_t MRAVOutputDeviceGetBatteryLevel()
{
  return MEMORY[0x1E0D4B5A8]();
}

uint64_t MRAVOutputDeviceGetSubtype()
{
  return MEMORY[0x1E0D4B5B0]();
}

uint64_t MRAVOutputDeviceGetType()
{
  return MEMORY[0x1E0D4B5B8]();
}

uint64_t MRAVOutputDeviceHasBatteryLevel()
{
  return MEMORY[0x1E0D4B5C0]();
}

uint64_t MRAVOutputDeviceIsGroupLeader()
{
  return MEMORY[0x1E0D4B5D0]();
}

uint64_t MRAVOutputDeviceIsGroupable()
{
  return MEMORY[0x1E0D4B5D8]();
}

uint64_t MRAVOutputDeviceIsLocalDevice()
{
  return MEMORY[0x1E0D4B5E0]();
}

uint64_t MRAVOutputDeviceIsPickedOnPairedDevice()
{
  return MEMORY[0x1E0D4B5E8]();
}

uint64_t MRAVOutputDeviceIsVolumeControlAvailable()
{
  return MEMORY[0x1E0D4B5F8]();
}

uint64_t MRAVOutputDevicePresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets()
{
  return MEMORY[0x1E0D4B600]();
}

uint64_t MRAVOutputDeviceRequiresAuthorization()
{
  return MEMORY[0x1E0D4B608]();
}

uint64_t MRAVOutputDeviceSourceInfoMultipleBuiltInDevices()
{
  return MEMORY[0x1E0D4B610]();
}

uint64_t MRAVOutputDeviceSupportsExternalScreen()
{
  return MEMORY[0x1E0D4B630]();
}

uint64_t MRAVOutputDeviceSupportsHeadTrackedSpatialAudio()
{
  return MEMORY[0x1E0D4B640]();
}

uint64_t MRAVReconnaissanceSessionBeginSearch()
{
  return MEMORY[0x1E0D4B658]();
}

uint64_t MRAVReconnaissanceSessionCreateWithEndpointFeatures()
{
  return MEMORY[0x1E0D4B668]();
}

uint64_t MRAVRouteQueryCreate()
{
  return MEMORY[0x1E0D4B670]();
}

uint64_t MRAVRouteQuerySetRouteUID()
{
  return MEMORY[0x1E0D4B678]();
}

uint64_t MRActiveEndpointTypeForBundleIdentifier()
{
  return MEMORY[0x1E0D4B6A8]();
}

uint64_t MRActiveEndpointTypeForCurrentApplication()
{
  return MEMORY[0x1E0D4B6B0]();
}

uint64_t MRApplicationActivityBegin()
{
  return MEMORY[0x1E0D4B6C0]();
}

uint64_t MRApplicationActivityCreate()
{
  return MEMORY[0x1E0D4B6C8]();
}

uint64_t MRApplicationActivityEnd()
{
  return MEMORY[0x1E0D4B6D0]();
}

uint64_t MRComputeBaseRouteUID()
{
  return MEMORY[0x1E0D4B6F0]();
}

uint64_t MRContentItemCopy()
{
  return MEMORY[0x1E0D4B6F8]();
}

uint64_t MRContentItemCopyAlbumYear()
{
  return MEMORY[0x1E0D4B700]();
}

uint64_t MRContentItemCopyAuxiliaryNowPlayingInfo()
{
  return MEMORY[0x1E0D4B708]();
}

uint64_t MRContentItemCopyCollectionInfo()
{
  return MEMORY[0x1E0D4B710]();
}

uint64_t MRContentItemCopyDeviceSpecificUserInfo()
{
  return MEMORY[0x1E0D4B718]();
}

uint64_t MRContentItemCopyNowPlayingInfo()
{
  return MEMORY[0x1E0D4B720]();
}

uint64_t MRContentItemCopyUserInfo()
{
  return MEMORY[0x1E0D4B728]();
}

uint64_t MRContentItemCopyWithIdentifier()
{
  return MEMORY[0x1E0D4B730]();
}

uint64_t MRContentItemCreate()
{
  return MEMORY[0x1E0D4B738]();
}

uint64_t MRContentItemCreateExternalRepresentation()
{
  return MEMORY[0x1E0D4B740]();
}

uint64_t MRContentItemCreateFromExternalRepresentation()
{
  return MEMORY[0x1E0D4B748]();
}

uint64_t MRContentItemCreateSkeletonFrom()
{
  return MEMORY[0x1E0D4B750]();
}

uint64_t MRContentItemGetAlbumArtistName()
{
  return MEMORY[0x1E0D4B758]();
}

uint64_t MRContentItemGetAlbumName()
{
  return MEMORY[0x1E0D4B760]();
}

uint64_t MRContentItemGetArtworkIdentifier()
{
  return MEMORY[0x1E0D4B768]();
}

uint64_t MRContentItemGetArtworkURL()
{
  return MEMORY[0x1E0D4B770]();
}

uint64_t MRContentItemGetArtworkURLTemplates()
{
  return MEMORY[0x1E0D4B778]();
}

uint64_t MRContentItemGetAvailableLanguageOptions()
{
  return MEMORY[0x1E0D4B780]();
}

uint64_t MRContentItemGetCollectionIdentifier()
{
  return MEMORY[0x1E0D4B790]();
}

uint64_t MRContentItemGetComposer()
{
  return MEMORY[0x1E0D4B798]();
}

uint64_t MRContentItemGetContentIdentifier()
{
  return MEMORY[0x1E0D4B7A0]();
}

uint64_t MRContentItemGetCurrentLanguageOptions()
{
  return MEMORY[0x1E0D4B7A8]();
}

uint64_t MRContentItemGetDefaultPlaybackRate()
{
  return MEMORY[0x1E0D4B7B0]();
}

uint64_t MRContentItemGetDirectorName()
{
  return MEMORY[0x1E0D4B7B8]();
}

uint64_t MRContentItemGetDiscNumber()
{
  return MEMORY[0x1E0D4B7C0]();
}

uint64_t MRContentItemGetDuration()
{
  return MEMORY[0x1E0D4B7C8]();
}

uint64_t MRContentItemGetDurationStringLocalizationKey()
{
  return MEMORY[0x1E0D4B7D0]();
}

uint64_t MRContentItemGetEditingStyleFlags()
{
  return MEMORY[0x1E0D4B7D8]();
}

uint64_t MRContentItemGetElapsedTime()
{
  return MEMORY[0x1E0D4B7E0]();
}

uint64_t MRContentItemGetElapsedTimeTimestamp()
{
  return MEMORY[0x1E0D4B7E8]();
}

uint64_t MRContentItemGetEpisodeNumber()
{
  return MEMORY[0x1E0D4B7F0]();
}

uint64_t MRContentItemGetEpisodeType()
{
  return MEMORY[0x1E0D4B7F8]();
}

uint64_t MRContentItemGetGenre()
{
  return MEMORY[0x1E0D4B800]();
}

uint64_t MRContentItemGetHasArtworkData()
{
  return MEMORY[0x1E0D4B808]();
}

uint64_t MRContentItemGetHasElapsedTime()
{
  return MEMORY[0x1E0D4B810]();
}

uint64_t MRContentItemGetHasInfo()
{
  return MEMORY[0x1E0D4B818]();
}

uint64_t MRContentItemGetHasLanguageOptions()
{
  return MEMORY[0x1E0D4B820]();
}

uint64_t MRContentItemGetHasLyrics()
{
  return MEMORY[0x1E0D4B828]();
}

uint64_t MRContentItemGetHasMetadata()
{
  return MEMORY[0x1E0D4B830]();
}

uint64_t MRContentItemGetHasTranscriptAlignments()
{
  return MEMORY[0x1E0D4B838]();
}

uint64_t MRContentItemGetITunesStoreAlbumArtistIdentifier()
{
  return MEMORY[0x1E0D4B840]();
}

uint64_t MRContentItemGetITunesStoreAlbumIdentifier()
{
  return MEMORY[0x1E0D4B848]();
}

uint64_t MRContentItemGetITunesStoreArtistIdentifier()
{
  return MEMORY[0x1E0D4B850]();
}

uint64_t MRContentItemGetITunesStoreIdentifier()
{
  return MEMORY[0x1E0D4B858]();
}

uint64_t MRContentItemGetITunesStoreSubscriptionIdentifier()
{
  return MEMORY[0x1E0D4B860]();
}

uint64_t MRContentItemGetIdentifier()
{
  return MEMORY[0x1E0D4B868]();
}

uint64_t MRContentItemGetInfo()
{
  return MEMORY[0x1E0D4B870]();
}

uint64_t MRContentItemGetIsAdvertisement()
{
  return MEMORY[0x1E0D4B878]();
}

uint64_t MRContentItemGetIsAlwaysLive()
{
  return MEMORY[0x1E0D4B880]();
}

uint64_t MRContentItemGetIsContainer()
{
  return MEMORY[0x1E0D4B888]();
}

uint64_t MRContentItemGetIsExplicitItem()
{
  return MEMORY[0x1E0D4B890]();
}

uint64_t MRContentItemGetIsInTransition()
{
  return MEMORY[0x1E0D4B898]();
}

uint64_t MRContentItemGetIsLoading()
{
  return MEMORY[0x1E0D4B8A0]();
}

uint64_t MRContentItemGetIsPlayable()
{
  return MEMORY[0x1E0D4B8A8]();
}

uint64_t MRContentItemGetIsSteerable()
{
  return MEMORY[0x1E0D4B8B0]();
}

uint64_t MRContentItemGetIsStreamingContent()
{
  return MEMORY[0x1E0D4B8B8]();
}

uint64_t MRContentItemGetLegacyUniqueIdentifier()
{
  return MEMORY[0x1E0D4B8C0]();
}

uint64_t MRContentItemGetLocalizedContentRating()
{
  return MEMORY[0x1E0D4B8C8]();
}

uint64_t MRContentItemGetLocalizedDurationString()
{
  return MEMORY[0x1E0D4B8D0]();
}

uint64_t MRContentItemGetLyrics()
{
  return MEMORY[0x1E0D4B8D8]();
}

uint64_t MRContentItemGetLyricsAdamID()
{
  return MEMORY[0x1E0D4B8E0]();
}

uint64_t MRContentItemGetMediaSubType()
{
  return MEMORY[0x1E0D4B8E8]();
}

uint64_t MRContentItemGetMediaType()
{
  return MEMORY[0x1E0D4B8F0]();
}

uint64_t MRContentItemGetNumberOfSections()
{
  return MEMORY[0x1E0D4B8F8]();
}

uint64_t MRContentItemGetPlayCount()
{
  return MEMORY[0x1E0D4B900]();
}

uint64_t MRContentItemGetPlaybackProgress()
{
  return MEMORY[0x1E0D4B908]();
}

uint64_t MRContentItemGetPlaybackRate()
{
  return MEMORY[0x1E0D4B910]();
}

uint64_t MRContentItemGetPlaylistType()
{
  return MEMORY[0x1E0D4B918]();
}

uint64_t MRContentItemGetProfileIdentifier()
{
  return MEMORY[0x1E0D4B920]();
}

uint64_t MRContentItemGetRadioStationName()
{
  return MEMORY[0x1E0D4B928]();
}

uint64_t MRContentItemGetRadioStationString()
{
  return MEMORY[0x1E0D4B930]();
}

uint64_t MRContentItemGetRadioStationType()
{
  return MEMORY[0x1E0D4B938]();
}

uint64_t MRContentItemGetReleaseDate()
{
  return MEMORY[0x1E0D4B940]();
}

uint64_t MRContentItemGetReportingAdamID()
{
  return MEMORY[0x1E0D4B948]();
}

uint64_t MRContentItemGetSeasonNumber()
{
  return MEMORY[0x1E0D4B950]();
}

uint64_t MRContentItemGetSections()
{
  return MEMORY[0x1E0D4B958]();
}

uint64_t MRContentItemGetSeriesName()
{
  return MEMORY[0x1E0D4B960]();
}

uint64_t MRContentItemGetServiceIdentifier()
{
  return MEMORY[0x1E0D4B968]();
}

uint64_t MRContentItemGetStartTime()
{
  return MEMORY[0x1E0D4B970]();
}

uint64_t MRContentItemGetSubtitle()
{
  return MEMORY[0x1E0D4B978]();
}

uint64_t MRContentItemGetTitle()
{
  return MEMORY[0x1E0D4B980]();
}

uint64_t MRContentItemGetTotalDiscCount()
{
  return MEMORY[0x1E0D4B988]();
}

uint64_t MRContentItemGetTotalTrackCount()
{
  return MEMORY[0x1E0D4B990]();
}

uint64_t MRContentItemGetTrackArtistName()
{
  return MEMORY[0x1E0D4B998]();
}

uint64_t MRContentItemGetTrackNumber()
{
  return MEMORY[0x1E0D4B9A0]();
}

uint64_t MRContentItemGetTranscriptAlignments()
{
  return MEMORY[0x1E0D4B9A8]();
}

uint64_t MRContentItemHasPlaybackRate()
{
  return MEMORY[0x1E0D4B9B0]();
}

uint64_t MRContentItemMerge()
{
  return MEMORY[0x1E0D4B9B8]();
}

uint64_t MRContentItemRepresentationForIdentity()
{
  return MEMORY[0x1E0D4B9C0]();
}

uint64_t MRContentItemSetAlbumArtistName()
{
  return MEMORY[0x1E0D4B9C8]();
}

uint64_t MRContentItemSetAlbumName()
{
  return MEMORY[0x1E0D4B9D0]();
}

uint64_t MRContentItemSetAlbumYear()
{
  return MEMORY[0x1E0D4B9D8]();
}

uint64_t MRContentItemSetArtworkData()
{
  return MEMORY[0x1E0D4B9E0]();
}

uint64_t MRContentItemSetArtworkDataSize()
{
  return MEMORY[0x1E0D4B9E8]();
}

uint64_t MRContentItemSetArtworkIdentifier()
{
  return MEMORY[0x1E0D4B9F0]();
}

uint64_t MRContentItemSetArtworkMIMEType()
{
  return MEMORY[0x1E0D4B9F8]();
}

uint64_t MRContentItemSetArtworkURL()
{
  return MEMORY[0x1E0D4BA00]();
}

uint64_t MRContentItemSetArtworkURLTemplates()
{
  return MEMORY[0x1E0D4BA08]();
}

uint64_t MRContentItemSetAvailableLanguageOptions()
{
  return MEMORY[0x1E0D4BA10]();
}

uint64_t MRContentItemSetCollectionIdentifier()
{
  return MEMORY[0x1E0D4BA18]();
}

uint64_t MRContentItemSetCollectionInfo()
{
  return MEMORY[0x1E0D4BA20]();
}

uint64_t MRContentItemSetComposer()
{
  return MEMORY[0x1E0D4BA28]();
}

uint64_t MRContentItemSetContentIdentifier()
{
  return MEMORY[0x1E0D4BA30]();
}

uint64_t MRContentItemSetCurrentLanguageOptions()
{
  return MEMORY[0x1E0D4BA38]();
}

uint64_t MRContentItemSetDefaultPlaybackRate()
{
  return MEMORY[0x1E0D4BA40]();
}

uint64_t MRContentItemSetDeviceSpecificUserInfo()
{
  return MEMORY[0x1E0D4BA48]();
}

uint64_t MRContentItemSetDirectorName()
{
  return MEMORY[0x1E0D4BA50]();
}

uint64_t MRContentItemSetDiscNumber()
{
  return MEMORY[0x1E0D4BA58]();
}

uint64_t MRContentItemSetDuration()
{
  return MEMORY[0x1E0D4BA60]();
}

uint64_t MRContentItemSetDurationStringLocalizationKey()
{
  return MEMORY[0x1E0D4BA68]();
}

uint64_t MRContentItemSetEditingStyleFlags()
{
  return MEMORY[0x1E0D4BA70]();
}

uint64_t MRContentItemSetElapsedTime()
{
  return MEMORY[0x1E0D4BA78]();
}

uint64_t MRContentItemSetElapsedTimeTimestamp()
{
  return MEMORY[0x1E0D4BA80]();
}

uint64_t MRContentItemSetEpisodeNumber()
{
  return MEMORY[0x1E0D4BA88]();
}

uint64_t MRContentItemSetEpisodeType()
{
  return MEMORY[0x1E0D4BA90]();
}

uint64_t MRContentItemSetExplicitItem()
{
  return MEMORY[0x1E0D4BA98]();
}

uint64_t MRContentItemSetGenre()
{
  return MEMORY[0x1E0D4BAA0]();
}

uint64_t MRContentItemSetHasArtworkData()
{
  return MEMORY[0x1E0D4BAA8]();
}

uint64_t MRContentItemSetHasInfo()
{
  return MEMORY[0x1E0D4BAB0]();
}

uint64_t MRContentItemSetHasLanguageOptions()
{
  return MEMORY[0x1E0D4BAB8]();
}

uint64_t MRContentItemSetHasLyrics()
{
  return MEMORY[0x1E0D4BAC0]();
}

uint64_t MRContentItemSetHasTranscriptAlignments()
{
  return MEMORY[0x1E0D4BAC8]();
}

uint64_t MRContentItemSetITunesStoreAlbumArtistIdentifier()
{
  return MEMORY[0x1E0D4BAD0]();
}

uint64_t MRContentItemSetITunesStoreAlbumIdentifier()
{
  return MEMORY[0x1E0D4BAD8]();
}

uint64_t MRContentItemSetITunesStoreArtistIdentifier()
{
  return MEMORY[0x1E0D4BAE0]();
}

uint64_t MRContentItemSetITunesStoreIdentifier()
{
  return MEMORY[0x1E0D4BAE8]();
}

uint64_t MRContentItemSetITunesStoreSubscriptionIdentifier()
{
  return MEMORY[0x1E0D4BAF0]();
}

uint64_t MRContentItemSetInfo()
{
  return MEMORY[0x1E0D4BAF8]();
}

uint64_t MRContentItemSetIsAdvertisement()
{
  return MEMORY[0x1E0D4BB00]();
}

uint64_t MRContentItemSetIsAlwaysLive()
{
  return MEMORY[0x1E0D4BB08]();
}

uint64_t MRContentItemSetIsContainer()
{
  return MEMORY[0x1E0D4BB10]();
}

uint64_t MRContentItemSetIsInTransition()
{
  return MEMORY[0x1E0D4BB18]();
}

uint64_t MRContentItemSetIsLoading()
{
  return MEMORY[0x1E0D4BB20]();
}

uint64_t MRContentItemSetIsSteerable()
{
  return MEMORY[0x1E0D4BB28]();
}

uint64_t MRContentItemSetIsStreamingContent()
{
  return MEMORY[0x1E0D4BB30]();
}

uint64_t MRContentItemSetLegacyUniqueIdentifier()
{
  return MEMORY[0x1E0D4BB38]();
}

uint64_t MRContentItemSetLocalizedContentRating()
{
  return MEMORY[0x1E0D4BB40]();
}

uint64_t MRContentItemSetLocalizedDurationString()
{
  return MEMORY[0x1E0D4BB48]();
}

uint64_t MRContentItemSetLyrics()
{
  return MEMORY[0x1E0D4BB50]();
}

uint64_t MRContentItemSetLyricsAdamID()
{
  return MEMORY[0x1E0D4BB58]();
}

uint64_t MRContentItemSetMediaSubType()
{
  return MEMORY[0x1E0D4BB60]();
}

uint64_t MRContentItemSetMediaType()
{
  return MEMORY[0x1E0D4BB68]();
}

uint64_t MRContentItemSetNowPlayingInfo()
{
  return MEMORY[0x1E0D4BB70]();
}

uint64_t MRContentItemSetNumberOfSections()
{
  return MEMORY[0x1E0D4BB78]();
}

uint64_t MRContentItemSetPlayCount()
{
  return MEMORY[0x1E0D4BB80]();
}

uint64_t MRContentItemSetPlayable()
{
  return MEMORY[0x1E0D4BB88]();
}

uint64_t MRContentItemSetPlaybackProgress()
{
  return MEMORY[0x1E0D4BB90]();
}

uint64_t MRContentItemSetPlaybackRate()
{
  return MEMORY[0x1E0D4BB98]();
}

uint64_t MRContentItemSetPlaylistType()
{
  return MEMORY[0x1E0D4BBA0]();
}

uint64_t MRContentItemSetProfileIdentifier()
{
  return MEMORY[0x1E0D4BBA8]();
}

uint64_t MRContentItemSetRadioStationName()
{
  return MEMORY[0x1E0D4BBB0]();
}

uint64_t MRContentItemSetRadioStationString()
{
  return MEMORY[0x1E0D4BBB8]();
}

uint64_t MRContentItemSetRadioStationType()
{
  return MEMORY[0x1E0D4BBC0]();
}

uint64_t MRContentItemSetReleaseDate()
{
  return MEMORY[0x1E0D4BBC8]();
}

uint64_t MRContentItemSetReportingAdamID()
{
  return MEMORY[0x1E0D4BBD0]();
}

uint64_t MRContentItemSetSeasonNumber()
{
  return MEMORY[0x1E0D4BBD8]();
}

uint64_t MRContentItemSetSections()
{
  return MEMORY[0x1E0D4BBE0]();
}

uint64_t MRContentItemSetSeriesName()
{
  return MEMORY[0x1E0D4BBE8]();
}

uint64_t MRContentItemSetServiceIdentifier()
{
  return MEMORY[0x1E0D4BBF0]();
}

uint64_t MRContentItemSetStartTime()
{
  return MEMORY[0x1E0D4BBF8]();
}

uint64_t MRContentItemSetSubtitle()
{
  return MEMORY[0x1E0D4BC00]();
}

uint64_t MRContentItemSetTitle()
{
  return MEMORY[0x1E0D4BC08]();
}

uint64_t MRContentItemSetTotalDiscCount()
{
  return MEMORY[0x1E0D4BC10]();
}

uint64_t MRContentItemSetTotalTrackCount()
{
  return MEMORY[0x1E0D4BC18]();
}

uint64_t MRContentItemSetTrackArtistName()
{
  return MEMORY[0x1E0D4BC20]();
}

uint64_t MRContentItemSetTrackNumber()
{
  return MEMORY[0x1E0D4BC28]();
}

uint64_t MRContentItemSetTranscriptAlignments()
{
  return MEMORY[0x1E0D4BC30]();
}

uint64_t MRContentItemSetUserInfo()
{
  return MEMORY[0x1E0D4BC38]();
}

uint64_t MRExternalDeviceCopyName()
{
  return MEMORY[0x1E0D4BC60]();
}

uint64_t MRExternalDeviceCopyUniqueIdentifier()
{
  return MEMORY[0x1E0D4BC68]();
}

uint64_t MRExternalDeviceSendButtonEvent()
{
  return MEMORY[0x1E0D4BC80]();
}

uint64_t MRIdentityRepresentationForParticipantItem()
{
  return MEMORY[0x1E0D4BCD0]();
}

uint64_t MRLanguageOptionCopyCharacteristics()
{
  return MEMORY[0x1E0D4BCD8]();
}

uint64_t MRLanguageOptionCopyDisplayName()
{
  return MEMORY[0x1E0D4BCE0]();
}

uint64_t MRLanguageOptionCopyIdentifier()
{
  return MEMORY[0x1E0D4BCE8]();
}

uint64_t MRLanguageOptionCopyLanguageTag()
{
  return MEMORY[0x1E0D4BCF0]();
}

uint64_t MRLanguageOptionCreate()
{
  return MEMORY[0x1E0D4BCF8]();
}

uint64_t MRLanguageOptionCreateExternalRepresentation()
{
  return MEMORY[0x1E0D4BD08]();
}

uint64_t MRLanguageOptionCreateFromExternalRepresentation()
{
  return MEMORY[0x1E0D4BD10]();
}

uint64_t MRLanguageOptionGetType()
{
  return MEMORY[0x1E0D4BD18]();
}

uint64_t MRLanguageOptionGroupCopyLanguageOptions()
{
  return MEMORY[0x1E0D4BD20]();
}

uint64_t MRLanguageOptionGroupCreate()
{
  return MEMORY[0x1E0D4BD28]();
}

uint64_t MRLanguageOptionGroupGetAllowEmptySelection()
{
  return MEMORY[0x1E0D4BD38]();
}

uint64_t MRLanguageOptionGroupGetDefaultLanguageOption()
{
  return MEMORY[0x1E0D4BD40]();
}

uint64_t MRLanguageOptionGroupsCreateExternalRepresentation()
{
  return MEMORY[0x1E0D4BD48]();
}

uint64_t MRLanguageOptionIsAutomaticLanguageOptionForType()
{
  return MEMORY[0x1E0D4BD58]();
}

uint64_t MRLanguageOptionIsEqualToLanguageOption()
{
  return MEMORY[0x1E0D4BD60]();
}

uint64_t MRLanguageOptionsCreateExternalRepresentation()
{
  return MEMORY[0x1E0D4BD68]();
}

uint64_t MRLyricsEventGetEndDate()
{
  return MEMORY[0x1E0D4BD78]();
}

uint64_t MRLyricsEventGetStartDate()
{
  return MEMORY[0x1E0D4BD80]();
}

uint64_t MRLyricsEventGetToken()
{
  return MEMORY[0x1E0D4BD88]();
}

uint64_t MRLyricsItemCreate()
{
  return MEMORY[0x1E0D4BD90]();
}

uint64_t MRLyricsItemGetLyrics()
{
  return MEMORY[0x1E0D4BD98]();
}

uint64_t MRLyricsItemGetToken()
{
  return MEMORY[0x1E0D4BDA0]();
}

uint64_t MRLyricsItemIsUserProvided()
{
  return MEMORY[0x1E0D4BDA8]();
}

uint64_t MRLyricsItemTokenCreate()
{
  return MEMORY[0x1E0D4BDB0]();
}

uint64_t MRLyricsItemTokenGetIdentifier()
{
  return MEMORY[0x1E0D4BDB8]();
}

uint64_t MRLyricsItemTokenGetUserInfo()
{
  return MEMORY[0x1E0D4BDC0]();
}

uint64_t MRMediaRemoteAddCommandHandlerForPlayer()
{
  return MEMORY[0x1E0D4BDE0]();
}

uint64_t MRMediaRemoteCanBecomeActivePlayer()
{
  return MEMORY[0x1E0D4BE08]();
}

uint64_t MRMediaRemoteCopyBrowsableContentAPIMaskDescription()
{
  return MEMORY[0x1E0D4BE50]();
}

uint64_t MRMediaRemoteCopyCommandDescription()
{
  return MEMORY[0x1E0D4BE58]();
}

uint64_t MRMediaRemoteCopyCommandHandlerStatusDescription()
{
  return MEMORY[0x1E0D4BE60]();
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID()
{
  return MEMORY[0x1E0D4BE70]();
}

uint64_t MRMediaRemoteCopyPendingCommands()
{
  return MEMORY[0x1E0D4BE80]();
}

uint64_t MRMediaRemoteCreateError()
{
  return MEMORY[0x1E0D4BEA8]();
}

uint64_t MRMediaRemoteDismissMediaControlsCommand()
{
  return MEMORY[0x1E0D4BEB0]();
}

uint64_t MRMediaRemoteErrorIsInformational()
{
  return MEMORY[0x1E0D4BEB8]();
}

uint64_t MRMediaRemoteFindAndPickRoute()
{
  return MEMORY[0x1E0D4BEC0]();
}

uint64_t MRMediaRemoteFinishedPlaybackInitialization()
{
  return MEMORY[0x1E0D4BEC8]();
}

uint64_t MRMediaRemoteGetExternalScreenType()
{
  return MEMORY[0x1E0D4BEF0]();
}

uint64_t MRMediaRemoteGetNowPlayingClient()
{
  return MEMORY[0x1E0D4BF28]();
}

uint64_t MRMediaRemoteGetPickedRouteHasVolumeControl()
{
  return MEMORY[0x1E0D4BF48]();
}

uint64_t MRMediaRemoteGetPictureInPictureStatusForPlayer()
{
  return MEMORY[0x1E0D4BF50]();
}

uint64_t MRMediaRemoteInvalidateBrowsableContent()
{
  return MEMORY[0x1E0D4BF90]();
}

uint64_t MRMediaRemoteIsMusicAppInstalled()
{
  return MEMORY[0x1E0D4BFA0]();
}

uint64_t MRMediaRemoteNowPlayingWakePlayerServiceProcess()
{
  return MEMORY[0x1E0D4BFB8]();
}

uint64_t MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription()
{
  return MEMORY[0x1E0D4BFC0]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemArtworkCallbackForPlayer()
{
  return MEMORY[0x1E0D4BFC8]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemFormattedArtworkCallbackForPlayer()
{
  return MEMORY[0x1E0D4BFD0]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemInfoCallbackForPlayer()
{
  return MEMORY[0x1E0D4BFD8]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemLanguageOptionsCallbackForPlayer()
{
  return MEMORY[0x1E0D4BFE0]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemLyricsCallbackForPlayer()
{
  return MEMORY[0x1E0D4BFE8]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemMetadataCallbackForPlayer()
{
  return MEMORY[0x1E0D4BFF0]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemTranscriptAlignmentsCallbackForPlayer()
{
  return MEMORY[0x1E0D4BFF8]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddCreateChildContentItemCallbackForPlayer()
{
  return MEMORY[0x1E0D4C000]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddCreateContentItemForIdentifierCallbackForPlayer()
{
  return MEMORY[0x1E0D4C008]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddCreatePlaybackQueueForRequestCallbackForPlayer()
{
  return MEMORY[0x1E0D4C010]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceContentItemChangedWithRequestForPlayer()
{
  return MEMORY[0x1E0D4C018]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceContentItemsChangedForPlayer()
{
  return MEMORY[0x1E0D4C020]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceInvalidateWithPlaybackQueueForPlayer()
{
  return MEMORY[0x1E0D4C028]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceRemoveCallbackForPlayer()
{
  return MEMORY[0x1E0D4C030]();
}

uint64_t MRMediaRemotePlaybackSessionSetMigrateBeginCallback()
{
  return MEMORY[0x1E0D4C038]();
}

uint64_t MRMediaRemotePlaybackSessionSetMigrateEndCallback()
{
  return MEMORY[0x1E0D4C040]();
}

uint64_t MRMediaRemotePlaybackSessionSetRequestCallback()
{
  return MEMORY[0x1E0D4C048]();
}

uint64_t MRMediaRemotePostDelayedNotification()
{
  return MEMORY[0x1E0D4C058]();
}

uint64_t MRMediaRemotePresentMediaControlsCommand()
{
  return MEMORY[0x1E0D4C060]();
}

uint64_t MRMediaRemotePrewarmMediaControlsCommand()
{
  return MEMORY[0x1E0D4C068]();
}

uint64_t MRMediaRemoteRemoveCommandHandlerBlockForPlayer()
{
  return MEMORY[0x1E0D4C090]();
}

uint64_t MRMediaRemoteRemovePlayer()
{
  return MEMORY[0x1E0D4C098]();
}

uint64_t MRMediaRemoteSendCommandToApp()
{
  return MEMORY[0x1E0D4C0C0]();
}

uint64_t MRMediaRemoteSetAVAudioSessionOpaqueSessionIDForPlayer()
{
  return MEMORY[0x1E0D4C0D8]();
}

uint64_t MRMediaRemoteSetBeginLyricsEventCallbackForPlayer()
{
  return MEMORY[0x1E0D4C0E8]();
}

uint64_t MRMediaRemoteSetBrowsableContentEndpoint()
{
  return MEMORY[0x1E0D4C0F0]();
}

uint64_t MRMediaRemoteSetCanBeNowPlayingForPlayer()
{
  return MEMORY[0x1E0D4C100]();
}

uint64_t MRMediaRemoteSetDefaultSupportedCommands()
{
  return MEMORY[0x1E0D4C108]();
}

uint64_t MRMediaRemoteSetEndLyricsEventCallbackForPlayer()
{
  return MEMORY[0x1E0D4C110]();
}

uint64_t MRMediaRemoteSetMXSessionIDForPlayer()
{
  return MEMORY[0x1E0D4C118]();
}

uint64_t MRMediaRemoteSetNowPlayingInfoForPlayer()
{
  return MEMORY[0x1E0D4C128]();
}

uint64_t MRMediaRemoteSetNowPlayingPlayer()
{
  return MEMORY[0x1E0D4C138]();
}

uint64_t MRMediaRemoteSetNowPlayingPlayerIfPossible()
{
  return MEMORY[0x1E0D4C140]();
}

uint64_t MRMediaRemoteSetPictureInPictureStatusForPlayer()
{
  return MEMORY[0x1E0D4C150]();
}

uint64_t MRMediaRemoteSetPlaybackStateForPlayer()
{
  return MEMORY[0x1E0D4C158]();
}

uint64_t MRMediaRemoteSetSupportedBrowsableContentAPIs()
{
  return MEMORY[0x1E0D4C160]();
}

uint64_t MRMediaRemoteSetSupportedCommandsForPlayer()
{
  return MEMORY[0x1E0D4C170]();
}

uint64_t MRMediaRemoteSetWantsExternalScreenTypeChangeNotifications()
{
  return MEMORY[0x1E0D4C178]();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return MEMORY[0x1E0D4C180]();
}

uint64_t MRMediaRemoteSetWantsVolumeControlNotifications()
{
  return MEMORY[0x1E0D4C198]();
}

uint64_t MRMediaRemoteSystemMediaApplicationIsRunning()
{
  return MEMORY[0x1E0D4C1A0]();
}

uint64_t MRMediaRemoteSystemMediaApplicationWake()
{
  return MEMORY[0x1E0D4C1A8]();
}

uint64_t MRMediaRemoteUnpickAirPlayAVRoutes()
{
  return MEMORY[0x1E0D4C1B0]();
}

uint64_t MRMediaRemoteUpdateBrowsableContentItems()
{
  return MEMORY[0x1E0D4C1C8]();
}

uint64_t MRMediaRemoteUpdateClientProperties()
{
  return MEMORY[0x1E0D4C1D0]();
}

uint64_t MRMediaRemoteUpdateNowPlayingIdentifiers()
{
  return MEMORY[0x1E0D4C1D8]();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return MEMORY[0x1E0D4C1E0]();
}

uint64_t MRNowPlayingClientSetParentAppBundleIdentifier()
{
  return MEMORY[0x1E0D4C1F0]();
}

uint64_t MRNowPlayingPlayerPathGetClient()
{
  return MEMORY[0x1E0D4C200]();
}

uint64_t MRNowPlayingPlayerPathGetOrigin()
{
  return MEMORY[0x1E0D4C208]();
}

uint64_t MRNowPlayingPlayerPathGetPlayer()
{
  return MEMORY[0x1E0D4C210]();
}

uint64_t MROriginIsLocalOrigin()
{
  return MEMORY[0x1E0D4C218]();
}

uint64_t MRPlaybackQueueRequestCreateWithIdentifiers()
{
  return MEMORY[0x1E0D4C288]();
}

uint64_t MRPlaybackQueueRequestGetArtworkHeight()
{
  return MEMORY[0x1E0D4C290]();
}

uint64_t MRPlaybackQueueRequestGetArtworkWidth()
{
  return MEMORY[0x1E0D4C298]();
}

uint64_t MRPlaybackQueueRequestGetRange()
{
  return MEMORY[0x1E0D4C2A0]();
}

uint64_t MRPlaybackQueueRequestMerge()
{
  return MEMORY[0x1E0D4C2A8]();
}

uint64_t MRPlaybackQueueRequestSetIncludeArtwork()
{
  return MEMORY[0x1E0D4C2B0]();
}

uint64_t MRPlaybackQueueRequestSetIncludeInfo()
{
  return MEMORY[0x1E0D4C2B8]();
}

uint64_t MRPlaybackQueueRequestSetIncludeLanguageOptions()
{
  return MEMORY[0x1E0D4C2C0]();
}

uint64_t MRPlaybackQueueRequestSetIncludeLyrics()
{
  return MEMORY[0x1E0D4C2C8]();
}

uint64_t MRPlaybackQueueRequestSetIncludeMetadata()
{
  return MEMORY[0x1E0D4C2D0]();
}

uint64_t MRPlaybackQueueRequestSetIncludeSections()
{
  return MEMORY[0x1E0D4C2D8]();
}

uint64_t MRPlaybackSessionCopyIdentifier()
{
  return MEMORY[0x1E0D4C2E0]();
}

uint64_t MRPlaybackSessionCopyPlaybackSessionData()
{
  return MEMORY[0x1E0D4C2E8]();
}

uint64_t MRPlaybackSessionCopyType()
{
  return MEMORY[0x1E0D4C2F0]();
}

uint64_t MRPlaybackSessionCreate()
{
  return MEMORY[0x1E0D4C2F8]();
}

uint64_t MRPlaybackSessionCreateFromExternalRepresentation()
{
  return MEMORY[0x1E0D4C300]();
}

uint64_t MRPlaybackSessionRequestCopyIdentifier()
{
  return MEMORY[0x1E0D4C308]();
}

uint64_t MRPlaybackSessionRequestCopyRequestID()
{
  return MEMORY[0x1E0D4C310]();
}

uint64_t MRPlaybackSessionRequestCopyType()
{
  return MEMORY[0x1E0D4C318]();
}

uint64_t MRSystemAppPlaybackQueueCopyCustomData()
{
  return MEMORY[0x1E0D4C330]();
}

uint64_t MRSystemAppPlaybackQueueCopyCustomDataIdentifier()
{
  return MEMORY[0x1E0D4C338]();
}

uint64_t MRSystemAppPlaybackQueueCopyFeatureName()
{
  return MEMORY[0x1E0D4C340]();
}

uint64_t MRSystemAppPlaybackQueueCopyGenericTrackIdentifiers()
{
  return MEMORY[0x1E0D4C348]();
}

uint64_t MRSystemAppPlaybackQueueCopyRadioStationStringIdentifier()
{
  return MEMORY[0x1E0D4C350]();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return MEMORY[0x1E0D4C358]();
}

uint64_t MRSystemAppPlaybackQueueCreateExternalRepresentation()
{
  return MEMORY[0x1E0D4C360]();
}

uint64_t MRSystemAppPlaybackQueueCreateFromExternalRepresentation()
{
  return MEMORY[0x1E0D4C368]();
}

uint64_t MRSystemAppPlaybackQueueDestroy()
{
  return MEMORY[0x1E0D4C370]();
}

uint64_t MRSystemAppPlaybackQueueGetFirstItemGenericTrackIdentifier()
{
  return MEMORY[0x1E0D4C378]();
}

uint64_t MRSystemAppPlaybackQueueGetLocalQueryData()
{
  return MEMORY[0x1E0D4C380]();
}

uint64_t MRSystemAppPlaybackQueueGetLocalQueryEncodingType()
{
  return MEMORY[0x1E0D4C388]();
}

uint64_t MRSystemAppPlaybackQueueGetLocalQueryFirstItemMultiverseIDData()
{
  return MEMORY[0x1E0D4C390]();
}

uint64_t MRSystemAppPlaybackQueueGetLocalQueryFirstItemPID()
{
  return MEMORY[0x1E0D4C398]();
}

uint64_t MRSystemAppPlaybackQueueGetLocalQueryRepeatMode()
{
  return MEMORY[0x1E0D4C3A0]();
}

uint64_t MRSystemAppPlaybackQueueGetLocalQueryShuffleMode()
{
  return MEMORY[0x1E0D4C3A8]();
}

uint64_t MRSystemAppPlaybackQueueGetRadioStationIDType()
{
  return MEMORY[0x1E0D4C3B0]();
}

uint64_t MRSystemAppPlaybackQueueGetRadioStationIntegerPID()
{
  return MEMORY[0x1E0D4C3B8]();
}

uint64_t MRSystemAppPlaybackQueueGetReplaceIntent()
{
  return MEMORY[0x1E0D4C3C0]();
}

uint64_t MRSystemAppPlaybackQueueGetSiriAssetInfo()
{
  return MEMORY[0x1E0D4C3C8]();
}

uint64_t MRSystemAppPlaybackQueueGetSiriRecommendationIdentifier()
{
  return MEMORY[0x1E0D4C3D0]();
}

uint64_t MRSystemAppPlaybackQueueGetSiriWHAMetricsInfo()
{
  return MEMORY[0x1E0D4C3D8]();
}

uint64_t MRSystemAppPlaybackQueueGetTracklistCollectionIdentifierSetData()
{
  return MEMORY[0x1E0D4C3E0]();
}

uint64_t MRSystemAppPlaybackQueueGetTracklistRepeatMode()
{
  return MEMORY[0x1E0D4C3E8]();
}

uint64_t MRSystemAppPlaybackQueueGetTracklistShuffleMode()
{
  return MEMORY[0x1E0D4C3F0]();
}

uint64_t MRSystemAppPlaybackQueueGetType()
{
  return MEMORY[0x1E0D4C3F8]();
}

uint64_t MRSystemAppPlaybackQueueGetUserInfo()
{
  return MEMORY[0x1E0D4C400]();
}

uint64_t MRSystemAppPlaybackQueueIsRequestingImmediatePlayback()
{
  return MEMORY[0x1E0D4C408]();
}

uint64_t MRSystemAppPlaybackQueueSetCustomData()
{
  return MEMORY[0x1E0D4C410]();
}

uint64_t MRSystemAppPlaybackQueueSetCustomDataIdentifier()
{
  return MEMORY[0x1E0D4C418]();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return MEMORY[0x1E0D4C430]();
}

uint64_t MRSystemAppPlaybackQueueSetReplaceIntent()
{
  return MEMORY[0x1E0D4C468]();
}

uint64_t MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier()
{
  return MEMORY[0x1E0D4C478]();
}

uint64_t MRSystemAppPlaybackQueueSetUserInfo()
{
  return MEMORY[0x1E0D4C488]();
}

uint64_t MRTelevisionControllerBeginDiscovery()
{
  return MEMORY[0x1E0D4C490]();
}

uint64_t MRTelevisionControllerCreate()
{
  return MEMORY[0x1E0D4C498]();
}

uint64_t MRTelevisionControllerEndDiscovery()
{
  return MEMORY[0x1E0D4C4A0]();
}

uint64_t MRTelevisionControllerIsDiscoveringDevices()
{
  return MEMORY[0x1E0D4C4A8]();
}

uint64_t MRTelevisionControllerSetDiscoveryCallback()
{
  return MEMORY[0x1E0D4C4B0]();
}

uint64_t MRTelevisionControllerSetRemovalCallback()
{
  return MEMORY[0x1E0D4C4B8]();
}

uint64_t MSVCopyLocalizedModelName()
{
  return MEMORY[0x1E0D4CE60]();
}

uint64_t MSVDeviceIsAppleTV()
{
  return MEMORY[0x1E0D4CE70]();
}

uint64_t MSVDeviceIsAudioAccessory()
{
  return MEMORY[0x1E0D4CE78]();
}

uint64_t MSVDeviceIsHomePod()
{
  return MEMORY[0x1E0D4CE80]();
}

uint64_t MSVDeviceIsWatch()
{
  return MEMORY[0x1E0D4CE88]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x1E0D4CE98]();
}

uint64_t MSVDeviceSupportsExtendedColorDisplay()
{
  return MEMORY[0x1E0D4CEA0]();
}

uint64_t MSVDeviceSupportsMultiChannelMusic()
{
  return MEMORY[0x1E0D4CEA8]();
}

uint64_t MSVGetMaximumScreenSize()
{
  return MEMORY[0x1E0D4CEE0]();
}

uint64_t MSVGzipCompressData()
{
  return MEMORY[0x1E0D4CEE8]();
}

uint64_t MSVGzipDecompressData()
{
  return MEMORY[0x1E0D4CEF0]();
}

uint64_t MSVHasherSharedSeed()
{
  return MEMORY[0x1E0D4CF00]();
}

uint64_t MSVImageUtilitiesAddImageToDestination()
{
  return MEMORY[0x1E0D4CF10]();
}

uint64_t MSVImageUtilitiesAddJPEGToDestination()
{
  return MEMORY[0x1E0D4CF18]();
}

uint64_t MSVImageUtilitiesCreateFileImageDestination()
{
  return MEMORY[0x1E0D4CF30]();
}

uint64_t MSVLogAddStateHandler()
{
  return MEMORY[0x1E0D4CF48]();
}

uint64_t MSVLogRemoveStateHandler()
{
  return MEMORY[0x1E0D4CF50]();
}

uint64_t MSVNanoIDCreateTaggedPointer()
{
  return MEMORY[0x1E0D4CF68]();
}

uint64_t MSVPropertyListDataClasses()
{
  return MEMORY[0x1E0D4CF80]();
}

uint64_t MSVReplacementRangeForRanges()
{
  return MEMORY[0x1E0D4CF98]();
}

uint64_t MSVSignedIntersectionRange()
{
  return MEMORY[0x1E0D4CFA0]();
}

uint64_t MSVSignedSubtractedRange()
{
  return MEMORY[0x1E0D4CFB0]();
}

uint64_t MSVSignedUnionRange()
{
  return MEMORY[0x1E0D4CFB8]();
}

uint64_t MSVSystemRootDirectory()
{
  return MEMORY[0x1E0D4CFC0]();
}

uint64_t MSVTCCIdentityForCurrentProcess()
{
  return MEMORY[0x1E0D4CFC8]();
}

uint64_t MSVUnarchivedObjectOfClass()
{
  return MEMORY[0x1E0D4CFD0]();
}

uint64_t MSVUnarchivedObjectOfClasses()
{
  return MEMORY[0x1E0D4CFD8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x1E0CB2DC8](table, key);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromMSVSignedRange()
{
  return MEMORY[0x1E0D4CFF0]();
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

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
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

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x1E0D82E10]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x1E0D82E18]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x1E0D82E20]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x1E0D82E28]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x1E0D82E30]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x1E0D82E38]();
}

uint64_t PBRepeatedInt64Set()
{
  return MEMORY[0x1E0D82E40]();
}

uint64_t SBGetApplicationNetworkFlags()
{
  return MEMORY[0x1E0DAB270]();
}

uint64_t SBSIsSystemApplication()
{
  return MEMORY[0x1E0DAB780]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x1E0DAB9A8]();
}

uint64_t SBSetApplicationNetworkFlags()
{
  return MEMORY[0x1E0DABAB0]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x1E0DC49B8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0DC4C58](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1E0DC5240]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0DC5248]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0DC5250]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1E0DC5260]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1E0DC5268]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1E0DC5270]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0DC5278]();
}

void UIRectClip(CGRect rect)
{
  MEMORY[0x1E0DC5280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x1E0DC52A0](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0DC52B8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0DC52C8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0DC52E8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

uint64_t _AXSHapticMusicEnabled()
{
  return MEMORY[0x1E0DDD7C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFURLCachePurgeMemoryCache()
{
  return MEMORY[0x1E0C92F48]();
}

uint64_t _MRLogForCategory()
{
  return MEMORY[0x1E0D4C658]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1E0C9A860]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1E0C9A890]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t mediaplatform::ContentBundle::ContentBundle()
{
  return MEMORY[0x1E0D4A190]();
}

uint64_t mediaplatform::FormatOptions::FormatOptions(mediaplatform::FormatOptions *this)
{
  return MEMORY[0x1E0D4A198](this);
}

uint64_t mediaplatform::UTF8ToUTF16String()
{
  return MEMORY[0x1E0D4A1A0]();
}

uint64_t mediaplatform::StringToUCharString()
{
  return MEMORY[0x1E0D4A1A8]();
}

uint64_t mediaplatform::PlatformErrorCondition::PlatformErrorCondition()
{
  return MEMORY[0x1E0D4A1B0]();
}

void mediaplatform::PlatformErrorCondition::~PlatformErrorCondition(mediaplatform::PlatformErrorCondition *this)
{
  MEMORY[0x1E0D4A1B8](this);
}

uint64_t mediaplatform::Data::Data()
{
  return MEMORY[0x1E0D4A1C0]();
}

{
  return MEMORY[0x1E0D4A1C8]();
}

uint64_t mediaplatform::Data::Data(mediaplatform::Data *this)
{
  return MEMORY[0x1E0D4A1D0](this);
}

void mediaplatform::Data::~Data(mediaplatform::Data *this)
{
  MEMORY[0x1E0D4A1D8](this);
}

uint64_t mediaplatform::FilePath::FilePath()
{
  return MEMORY[0x1E0D4A1E0]();
}

uint64_t mlcore::ItemArtist::EntityClass(mlcore::ItemArtist *this)
{
  return MEMORY[0x1E0D4A1E8](this);
}

uint64_t mlcore::RangeQuery::setRange()
{
  return MEMORY[0x1E0D4A1F0]();
}

uint64_t mlcore::EntityCache::setCacheDisabled(mlcore::EntityCache *this)
{
  return MEMORY[0x1E0D4A1F8](this);
}

uint64_t mlcore::EntityCache::entityForClassAndPersistentID()
{
  return MEMORY[0x1E0D4A200]();
}

uint64_t mlcore::EntityCache::propertiesToFetchForEntityClass()
{
  return MEMORY[0x1E0D4A208]();
}

uint64_t mlcore::EntityCache::setPropertiesToFetchForEntityClass()
{
  return MEMORY[0x1E0D4A210]();
}

uint64_t mlcore::EntityCache::EntityCache()
{
  return MEMORY[0x1E0D4A218]();
}

void mlcore::EntityCache::~EntityCache(mlcore::EntityCache *this)
{
  MEMORY[0x1E0D4A220](this);
}

uint64_t mlcore::EntityQuery::songsQuery()
{
  return MEMORY[0x1E0D4A228]();
}

uint64_t mlcore::EntityQuery::albumsQuery()
{
  return MEMORY[0x1E0D4A230]();
}

uint64_t mlcore::EntityQuery::genresQuery()
{
  return MEMORY[0x1E0D4A238]();
}

uint64_t mlcore::EntityQuery::moviesQuery()
{
  return MEMORY[0x1E0D4A240]();
}

uint64_t mlcore::EntityQuery::artistsQuery()
{
  return MEMORY[0x1E0D4A248]();
}

uint64_t mlcore::EntityQuery::tvShowsQuery()
{
  return MEMORY[0x1E0D4A250]();
}

uint64_t mlcore::EntityQuery::podcastsQuery()
{
  return MEMORY[0x1E0D4A258]();
}

uint64_t mlcore::EntityQuery::composersQuery()
{
  return MEMORY[0x1E0D4A260]();
}

uint64_t mlcore::EntityQuery::playlistsQuery()
{
  return MEMORY[0x1E0D4A268]();
}

uint64_t mlcore::EntityQuery::tvSeasonsQuery()
{
  return MEMORY[0x1E0D4A270]();
}

uint64_t mlcore::EntityQuery::tvEpisodesQuery()
{
  return MEMORY[0x1E0D4A278]();
}

uint64_t mlcore::EntityQuery::playlistItemsQuery()
{
  return MEMORY[0x1E0D4A280]();
}

uint64_t mlcore::EntityQuery::albumsForGenreQuery()
{
  return MEMORY[0x1E0D4A288]();
}

uint64_t mlcore::EntityQuery::albumsForArtistQuery()
{
  return MEMORY[0x1E0D4A290]();
}

uint64_t mlcore::EntityQuery::podcastEpisodesQuery()
{
  return MEMORY[0x1E0D4A298]();
}

uint64_t mlcore::EntityQuery::tvSeasonsForShowQuery()
{
  return MEMORY[0x1E0D4A2A0]();
}

uint64_t mlcore::EntityQuery::albumsForComposerQuery()
{
  return MEMORY[0x1E0D4A2A8]();
}

uint64_t mlcore::EntityQuery::playlistsForFolderQuery()
{
  return MEMORY[0x1E0D4A2B0]();
}

uint64_t mlcore::EntityQuery::setIdentityPropertiesToFetch()
{
  return MEMORY[0x1E0D4A2B8]();
}

uint64_t mlcore::EntityQuery::albumsForArtistQueryWithPredicate()
{
  return MEMORY[0x1E0D4A2C0]();
}

uint64_t mlcore::EntityQuery::EntityQuery()
{
  return MEMORY[0x1E0D4A2C8]();
}

uint64_t mlcore::InPredicate<std::string>::InPredicate()
{
  return off_1E31477C8();
}

uint64_t mlcore::InPredicate<int>::InPredicate()
{
  return off_1E31477D0();
}

uint64_t mlcore::InPredicate<long long>::InPredicate()
{
  return off_1E31477D8();
}

uint64_t mlcore::LibraryView::setFilters(mlcore::LibraryView *this)
{
  return MEMORY[0x1E0D4A2D0](this);
}

uint64_t mlcore::LibraryView::viewWithLibrary()
{
  return MEMORY[0x1E0D4A2D8]();
}

uint64_t mlcore::LibraryView::setContentRestrictions()
{
  return MEMORY[0x1E0D4A2E0]();
}

uint64_t mlcore::LibraryView::setFilterPredicateForEntityClass()
{
  return MEMORY[0x1E0D4A2E8]();
}

uint64_t mlcore::PlaylistItem::EntityClass(mlcore::PlaylistItem *this)
{
  return MEMORY[0x1E0D4A2F0](this);
}

uint64_t mlcore::PlaylistItem::PlaylistItem(mlcore::PlaylistItem *this)
{
  return MEMORY[0x1E0D4A2F8](this);
}

uint64_t mlcore::DeviceLibrary::setExpectedEntityQuerySize()
{
  return MEMORY[0x1E0D4A300]();
}

uint64_t mlcore::PropertyCache::PropertyCache()
{
  return MEMORY[0x1E0D4A308]();
}

uint64_t mlcore::AnyInPredicate<long long>::AnyInPredicate()
{
  return off_1E3147820();
}

uint64_t mlcore::PlaylistAuthor::EntityClass(mlcore::PlaylistAuthor *this)
{
  return MEMORY[0x1E0D4A310](this);
}

uint64_t mlcore::PodcastEpisode::EntityClass(mlcore::PodcastEpisode *this)
{
  return MEMORY[0x1E0D4A318](this);
}

uint64_t mlcore::SortDescriptor::SortDescriptor()
{
  return MEMORY[0x1E0D4A320]();
}

uint64_t mlcore::UnaryPredicate<int>::UnaryPredicate()
{
  return off_1E3147840();
}

uint64_t mlcore::UnaryPredicate<long long>::UnaryPredicate()
{
  return off_1E3147848();
}

uint64_t mlcore::ExistsPredicate::ExistsPredicate()
{
  return MEMORY[0x1E0D4A328]();
}

uint64_t mlcore::ItemPropertyBPM(mlcore *this)
{
  return MEMORY[0x1E0D4A330](this);
}

uint64_t mlcore::PropertiesQuery::setSortDescriptors()
{
  return MEMORY[0x1E0D4A338]();
}

uint64_t mlcore::PropertiesQuery::setPropertiesToFetch()
{
  return MEMORY[0x1E0D4A340]();
}

uint64_t mlcore::PropertiesQuery::PropertiesQuery()
{
  return MEMORY[0x1E0D4A348]();
}

uint64_t mlcore::SearchPredicate::SearchPredicate()
{
  return MEMORY[0x1E0D4A350]();
}

uint64_t mlcore::ItemPropertyYear(mlcore *this)
{
  return MEMORY[0x1E0D4A358](this);
}

uint64_t mlcore::MultiEntityQuery::setViewForEntityClass()
{
  return MEMORY[0x1E0D4A360]();
}

uint64_t mlcore::MultiEntityQuery::setMultiSortDescriptors()
{
  return MEMORY[0x1E0D4A368]();
}

uint64_t mlcore::MultiEntityQuery::setPredicateForEntityClass()
{
  return MEMORY[0x1E0D4A370]();
}

uint64_t mlcore::MultiEntityQuery::setPropertiesToFetchForEntityClass()
{
  return MEMORY[0x1E0D4A378]();
}

uint64_t mlcore::MultiEntityQuery::MultiEntityQuery(mlcore::MultiEntityQuery *this)
{
  return MEMORY[0x1E0D4A380](this);
}

uint64_t mlcore::AlbumPropertyYear(mlcore *this)
{
  return MEMORY[0x1E0D4A388](this);
}

uint64_t mlcore::CreateOrPredicate()
{
  return MEMORY[0x1E0D4A390]();
}

uint64_t mlcore::EntityQueryResult::allEntities(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1E0D4A398](this);
}

uint64_t mlcore::EntityQueryResult::entityAtIndex(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1E0D4A3A0](this);
}

uint64_t mlcore::EntityQueryResult::propertyCaches(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1E0D4A3A8](this);
}

uint64_t mlcore::EntityQueryResult::idEntityAtIndex(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1E0D4A3B0](this);
}

uint64_t mlcore::EntityQueryResult::localizedSectionIndices(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1E0D4A3B8](this);
}

uint64_t mlcore::EntityQueryResult::optionalLocalizedSectionIndicesRange(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1E0D4A3C0](this);
}

uint64_t mlcore::EntityQueryResult::sections(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1E0D4A3C8](this);
}

uint64_t mlcore::EntityQueryResult::EntityQueryResult()
{
  return MEMORY[0x1E0D4A3D0]();
}

uint64_t mlcore::GenrePropertyName(mlcore *this)
{
  return MEMORY[0x1E0D4A3D8](this);
}

uint64_t mlcore::ItemPropertyTitle(mlcore *this)
{
  return MEMORY[0x1E0D4A3E0](this);
}

uint64_t mlcore::LanguageResources::LanguageResources()
{
  return MEMORY[0x1E0D4A3E8]();
}

uint64_t mlcore::MoviePropertyInfo(mlcore *this)
{
  return MEMORY[0x1E0D4A3F0](this);
}

uint64_t mlcore::AlbumPropertyOrder(mlcore *this)
{
  return MEMORY[0x1E0D4A3F8](this);
}

uint64_t mlcore::AlbumPropertyTitle(mlcore *this)
{
  return MEMORY[0x1E0D4A400](this);
}

uint64_t mlcore::ArtistPropertyName(mlcore *this)
{
  return MEMORY[0x1E0D4A408](this);
}

uint64_t mlcore::CreateAndPredicate()
{
  return MEMORY[0x1E0D4A410]();
}

uint64_t mlcore::CreateNotPredicate()
{
  return MEMORY[0x1E0D4A418]();
}

uint64_t mlcore::GenrePropertyOrder(mlcore *this)
{
  return MEMORY[0x1E0D4A420](this);
}

uint64_t mlcore::ItemPropertyLyrics(mlcore *this)
{
  return MEMORY[0x1E0D4A428](this);
}

uint64_t mlcore::ItemPropertySyncID(mlcore *this)
{
  return MEMORY[0x1E0D4A430](this);
}

uint64_t mlcore::PersonPropertyName(mlcore *this)
{
  return MEMORY[0x1E0D4A438](this);
}

uint64_t mlcore::AlbumPropertySyncID(mlcore *this)
{
  return MEMORY[0x1E0D4A440](this);
}

uint64_t mlcore::ArtistPropertyOrder(mlcore *this)
{
  return MEMORY[0x1E0D4A448](this);
}

uint64_t mlcore::ComparisonPredicate<std::string>::ComparisonPredicate()
{
  return off_1E3147978();
}

uint64_t mlcore::ComparisonPredicate<int>::ComparisonPredicate()
{
  return off_1E3147980();
}

uint64_t mlcore::ComparisonPredicate<long long>::ComparisonPredicate()
{
  return off_1E3147988();
}

uint64_t mlcore::ContentRestrictions::setRestrictMusicVideos(mlcore::ContentRestrictions *this)
{
  return MEMORY[0x1E0D4A450](this);
}

uint64_t mlcore::ContentRestrictions::setRestrictedMoviesRank(mlcore::ContentRestrictions *this)
{
  return MEMORY[0x1E0D4A458](this);
}

uint64_t mlcore::ContentRestrictions::setRestrictedTVShowsRank(mlcore::ContentRestrictions *this)
{
  return MEMORY[0x1E0D4A460](this);
}

uint64_t mlcore::ContentRestrictions::setRestrictExplicitLyrics(mlcore::ContentRestrictions *this)
{
  return MEMORY[0x1E0D4A468](this);
}

uint64_t mlcore::ContentRestrictions::ContentRestrictions(mlcore::ContentRestrictions *this)
{
  return MEMORY[0x1E0D4A470](this);
}

uint64_t mlcore::ItemPropertyIsVideo(mlcore *this)
{
  return MEMORY[0x1E0D4A478](this);
}

uint64_t mlcore::ItemPropertyStoreID(mlcore *this)
{
  return MEMORY[0x1E0D4A480](this);
}

uint64_t mlcore::MultiSortDescriptor::setPropertyForEntityClass()
{
  return MEMORY[0x1E0D4A488]();
}

uint64_t mlcore::MultiSortDescriptor::MultiSortDescriptor()
{
  return MEMORY[0x1E0D4A490]();
}

uint64_t mlcore::AlbumPropertyAppData(mlcore *this)
{
  return MEMORY[0x1E0D4A498](this);
}

uint64_t mlcore::AlbumPropertyFeedURL(mlcore *this)
{
  return MEMORY[0x1E0D4A4A0](this);
}

uint64_t mlcore::AlbumPropertyStoreID(mlcore *this)
{
  return MEMORY[0x1E0D4A4A8](this);
}

uint64_t mlcore::ComposerPropertyName(mlcore *this)
{
  return MEMORY[0x1E0D4A4B0](this);
}

uint64_t mlcore::GenrePropertyHasName(mlcore *this)
{
  return MEMORY[0x1E0D4A4B8](this);
}

uint64_t mlcore::ItemPropertyFileSize(mlcore *this)
{
  return MEMORY[0x1E0D4A4C0](this);
}

uint64_t mlcore::ItemPropertyGrouping(mlcore *this)
{
  return MEMORY[0x1E0D4A4C8](this);
}

uint64_t mlcore::ItemPropertyLocation(mlcore *this)
{
  return MEMORY[0x1E0D4A4D0](this);
}

uint64_t mlcore::ItemPropertyStopTime(mlcore *this)
{
  return MEMORY[0x1E0D4A4D8](this);
}

uint64_t mlcore::LocalizedSearchQuery::setPerScopeResultLimit(mlcore::LocalizedSearchQuery *this)
{
  return MEMORY[0x1E0D4A4E0](this);
}

uint64_t mlcore::LocalizedSearchQuery::cancel(mlcore::LocalizedSearchQuery *this)
{
  return MEMORY[0x1E0D4A4E8](this);
}

uint64_t mlcore::LocalizedSearchQuery::setScopes()
{
  return MEMORY[0x1E0D4A4F0]();
}

uint64_t mlcore::LocalizedSearchQuery::LocalizedSearchQuery()
{
  return MEMORY[0x1E0D4A4F8]();
}

uint64_t mlcore::LocalizedSearchScope::LocalizedSearchScope()
{
  return MEMORY[0x1E0D4A500]();
}

{
  return MEMORY[0x1E0D4A508]();
}

uint64_t mlcore::PersonPropertyHandle(mlcore *this)
{
  return MEMORY[0x1E0D4A510](this);
}

uint64_t mlcore::PlaylistItemReaction::EntityClass(mlcore::PlaylistItemReaction *this)
{
  return MEMORY[0x1E0D4A518](this);
}

uint64_t mlcore::PlaylistPropertyName(mlcore *this)
{
  return MEMORY[0x1E0D4A520](this);
}

uint64_t mlcore::AlbumPropertyHasTitle(mlcore *this)
{
  return MEMORY[0x1E0D4A528](this);
}

uint64_t mlcore::ArtistPropertyHasName(mlcore *this)
{
  return MEMORY[0x1E0D4A530](this);
}

uint64_t mlcore::ArtistPropertyStoreID(mlcore *this)
{
  return MEMORY[0x1E0D4A538](this);
}

uint64_t mlcore::ComposerPropertyOrder(mlcore *this)
{
  return MEMORY[0x1E0D4A540](this);
}

uint64_t mlcore::ItemPropertyCopyright(mlcore *this)
{
  return MEMORY[0x1E0D4A548](this);
}

uint64_t mlcore::ItemPropertyDateAdded(mlcore *this)
{
  return MEMORY[0x1E0D4A550](this);
}

uint64_t mlcore::ItemPropertyKeepLocal(mlcore *this)
{
  return MEMORY[0x1E0D4A558](this);
}

uint64_t mlcore::ItemPropertyMediaType(mlcore *this)
{
  return MEMORY[0x1E0D4A560](this);
}

uint64_t mlcore::ItemPropertyStartTime(mlcore *this)
{
  return MEMORY[0x1E0D4A568](this);
}

uint64_t mlcore::ItemPropertyTotalTime(mlcore *this)
{
  return MEMORY[0x1E0D4A570](this);
}

uint64_t mlcore::LocalizedSectionsInfo::LocalizedSectionsInfo()
{
  return MEMORY[0x1E0D4A578]();
}

uint64_t mlcore::MoviePropertyIsRental(mlcore *this)
{
  return MEMORY[0x1E0D4A580](this);
}

uint64_t mlcore::PropertiesQueryResult::enumerateResults()
{
  return MEMORY[0x1E0D4A588]();
}

uint64_t mlcore::AggregateFunctionQuery::AggregateFunctionQuery()
{
  return MEMORY[0x1E0D4A590]();
}

uint64_t mlcore::AlbumPropertyCopyright(mlcore *this)
{
  return MEMORY[0x1E0D4A598](this);
}

uint64_t mlcore::AlbumPropertyItemCount(mlcore *this)
{
  return MEMORY[0x1E0D4A5A0](this);
}

uint64_t mlcore::AlbumPropertyKeepLocal(mlcore *this)
{
  return MEMORY[0x1E0D4A5A8](this);
}

uint64_t mlcore::GetForeignPropertyBase()
{
  return MEMORY[0x1E0D4A5B0]();
}

uint64_t mlcore::ItemArtistPropertyName(mlcore *this)
{
  return MEMORY[0x1E0D4A5B8](this);
}

uint64_t mlcore::ItemPropertyDatePlayed(mlcore *this)
{
  return MEMORY[0x1E0D4A5C0](this);
}

uint64_t mlcore::ItemPropertyDiscNumber(mlcore *this)
{
  return MEMORY[0x1E0D4A5C8](this);
}

uint64_t mlcore::ItemPropertyIsExplicit(mlcore *this)
{
  return MEMORY[0x1E0D4A5D0](this);
}

uint64_t mlcore::ItemPropertyLikedState(mlcore *this)
{
  return MEMORY[0x1E0D4A5D8](this);
}

uint64_t mlcore::ItemPropertyTitleOrder(mlcore *this)
{
  return MEMORY[0x1E0D4A5E0](this);
}

uint64_t mlcore::ItemPropertyUserRating(mlcore *this)
{
  return MEMORY[0x1E0D4A5E8](this);
}

uint64_t mlcore::LocalizedSectionHeader::LocalizedSectionHeader()
{
  return MEMORY[0x1E0D4A5F0]();
}

uint64_t mlcore::PersonPropertyImageURL(mlcore *this)
{
  return MEMORY[0x1E0D4A5F8](this);
}

uint64_t mlcore::PlaylistPropertySyncID(mlcore *this)
{
  return MEMORY[0x1E0D4A600](this);
}

uint64_t mlcore::PlaylistPropertyTraits(mlcore *this)
{
  return MEMORY[0x1E0D4A608](this);
}

uint64_t mlcore::AlbumPropertyArtistName(mlcore *this)
{
  return MEMORY[0x1E0D4A610](this);
}

uint64_t mlcore::AlbumPropertyIsPreOrder(mlcore *this)
{
  return MEMORY[0x1E0D4A618](this);
}

uint64_t mlcore::AlbumPropertyLikedState(mlcore *this)
{
  return MEMORY[0x1E0D4A620](this);
}

uint64_t mlcore::ArtistPropertyItemCount(mlcore *this)
{
  return MEMORY[0x1E0D4A628](this);
}

uint64_t mlcore::ComposerPropertyHasName(mlcore *this)
{
  return MEMORY[0x1E0D4A630](this);
}

uint64_t mlcore::ItemArtistPropertyOrder(mlcore *this)
{
  return MEMORY[0x1E0D4A638](this);
}

uint64_t mlcore::ItemPropertyAlbumSyncID(mlcore *this)
{
  return MEMORY[0x1E0D4A640](this);
}

uint64_t mlcore::ItemPropertyCloudKVSKey(mlcore *this)
{
  return MEMORY[0x1E0D4A648](this);
}

uint64_t mlcore::ItemPropertyEpisodeType(mlcore *this)
{
  return MEMORY[0x1E0D4A650](this);
}

uint64_t mlcore::ItemPropertyInMyLibrary(mlcore *this)
{
  return MEMORY[0x1E0D4A658](this);
}

uint64_t mlcore::ItemPropertyIsMusicShow(mlcore *this)
{
  return MEMORY[0x1E0D4A660](this);
}

uint64_t mlcore::ItemPropertyIsProtected(mlcore *this)
{
  return MEMORY[0x1E0D4A668](this);
}

uint64_t mlcore::ItemPropertyTrackNumber(mlcore *this)
{
  return MEMORY[0x1E0D4A670](this);
}

uint64_t mlcore::LocalizedSortingDetails::LocalizedSortingDetails()
{
  return MEMORY[0x1E0D4A678]();
}

uint64_t mlcore::PlaylistPropertyIsOwner(mlcore *this)
{
  return MEMORY[0x1E0D4A680](this);
}

uint64_t mlcore::PlaylistPropertyIsSmart(mlcore *this)
{
  return MEMORY[0x1E0D4A688](this);
}

uint64_t mlcore::ArtistPropertyAlbumCount(mlcore *this)
{
  return MEMORY[0x1E0D4A690](this);
}

uint64_t mlcore::ArtistPropertyLikedState(mlcore *this)
{
  return MEMORY[0x1E0D4A698](this);
}

uint64_t mlcore::ItemPropertyAlbumStoreID(mlcore *this)
{
  return MEMORY[0x1E0D4A6A0](this);
}

uint64_t mlcore::ItemPropertyDateReleased(mlcore *this)
{
  return MEMORY[0x1E0D4A6A8](this);
}

uint64_t mlcore::ItemPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4A6B0](this);
}

uint64_t mlcore::ItemPropertyStoreCloudID(mlcore *this)
{
  return MEMORY[0x1E0D4A6B8](this);
}

uint64_t mlcore::PlaylistItemPropertyUUID(mlcore *this)
{
  return MEMORY[0x1E0D4A6C0](this);
}

uint64_t mlcore::PlaylistPropertyIsHidden(mlcore *this)
{
  return MEMORY[0x1E0D4A6C8](this);
}

uint64_t mlcore::AlbumPropertyDateReleased(mlcore *this)
{
  return MEMORY[0x1E0D4A6D0](this);
}

uint64_t mlcore::AlbumPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4A6D8](this);
}

uint64_t mlcore::AlbumPropertySeasonNumber(mlcore *this)
{
  return MEMORY[0x1E0D4A6E0](this);
}

uint64_t mlcore::ArtistPropertyGroupingKey(mlcore *this)
{
  return MEMORY[0x1E0D4A6E8](this);
}

uint64_t mlcore::GenrePropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4A6F0](this);
}

uint64_t mlcore::ItemArtistPropertyHasName(mlcore *this)
{
  return MEMORY[0x1E0D4A6F8](this);
}

uint64_t mlcore::ItemArtistPropertyStoreID(mlcore *this)
{
  return MEMORY[0x1E0D4A700](this);
}

uint64_t mlcore::ItemPropertyArtistStoreID(mlcore *this)
{
  return MEMORY[0x1E0D4A708](this);
}

uint64_t mlcore::ItemPropertyClassicalWork(mlcore *this)
{
  return MEMORY[0x1E0D4A710](this);
}

uint64_t mlcore::ItemPropertyEpisodeSortID(mlcore *this)
{
  return MEMORY[0x1E0D4A718](this);
}

uint64_t mlcore::ItemPropertyHasBeenPlayed(mlcore *this)
{
  return MEMORY[0x1E0D4A720](this);
}

uint64_t mlcore::ItemPropertyHomeSharingID(mlcore *this)
{
  return MEMORY[0x1E0D4A728](this);
}

uint64_t mlcore::ItemPropertyPlayCountUser(mlcore *this)
{
  return MEMORY[0x1E0D4A730](this);
}

uint64_t mlcore::ItemPropertySkipCountUser(mlcore *this)
{
  return MEMORY[0x1E0D4A738](this);
}

uint64_t mlcore::PlaylistPropertyKeepLocal(mlcore *this)
{
  return MEMORY[0x1E0D4A740](this);
}

uint64_t mlcore::PlaylistPropertyNameOrder(mlcore *this)
{
  return MEMORY[0x1E0D4A748](this);
}

uint64_t mlcore::TVShowPropertySeriesOrder(mlcore *this)
{
  return MEMORY[0x1E0D4A750](this);
}

uint64_t mlcore::ArtistPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4A758](this);
}

uint64_t mlcore::ItemPropertyAlbumLikeState(mlcore *this)
{
  return MEMORY[0x1E0D4A760](this);
}

uint64_t mlcore::ItemPropertyDateDownloaded(mlcore *this)
{
  return MEMORY[0x1E0D4A768](this);
}

uint64_t mlcore::ItemPropertyHLSAssetTraits(mlcore *this)
{
  return MEMORY[0x1E0D4A770](this);
}

uint64_t mlcore::ItemPropertyHasTrackNumber(mlcore *this)
{
  return MEMORY[0x1E0D4A778](this);
}

uint64_t mlcore::ItemPropertyItemArtistName(mlcore *this)
{
  return MEMORY[0x1E0D4A780](this);
}

uint64_t mlcore::ItemPropertyRelativeVolume(mlcore *this)
{
  return MEMORY[0x1E0D4A788](this);
}

uint64_t mlcore::ItemPropertyStoreAccountID(mlcore *this)
{
  return MEMORY[0x1E0D4A790](this);
}

uint64_t mlcore::LocalizedSearchQueryResult::resultForSearchScope()
{
  return MEMORY[0x1E0D4A798]();
}

uint64_t mlcore::PersonPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4A7A0](this);
}

uint64_t mlcore::PlaylistAuthorPropertyRole(mlcore *this)
{
  return MEMORY[0x1E0D4A7A8](this);
}

uint64_t mlcore::PlaylistPropertyLikedState(mlcore *this)
{
  return MEMORY[0x1E0D4A7B0](this);
}

uint64_t mlcore::TVShowPropertyEpisodeCount(mlcore *this)
{
  return MEMORY[0x1E0D4A7B8](this);
}

uint64_t mlcore::AlbumPropertyCloudLibraryID(mlcore *this)
{
  return MEMORY[0x1E0D4A7C0](this);
}

uint64_t mlcore::AlbumPropertyDateDownloaded(mlcore *this)
{
  return MEMORY[0x1E0D4A7C8](this);
}

uint64_t mlcore::ComparisonPropertyPredicate::ComparisonPropertyPredicate()
{
  return MEMORY[0x1E0D4A7D0]();
}

uint64_t mlcore::ItemPropertyAlbumTrackCount(mlcore *this)
{
  return MEMORY[0x1E0D4A7D8](this);
}

uint64_t mlcore::ItemPropertyHLSKeyServerURL(mlcore *this)
{
  return MEMORY[0x1E0D4A7E0](this);
}

uint64_t mlcore::ItemPropertyKeepLocalStatus(mlcore *this)
{
  return MEMORY[0x1E0D4A7E8](this);
}

uint64_t mlcore::ItemPropertyLongDescription(mlcore *this)
{
  return MEMORY[0x1E0D4A7F0](this);
}

uint64_t mlcore::ItemPropertyStorePlaylistID(mlcore *this)
{
  return MEMORY[0x1E0D4A7F8](this);
}

uint64_t mlcore::PlaylistPropertyDateCreated(mlcore *this)
{
  return MEMORY[0x1E0D4A800](this);
}

uint64_t mlcore::PlaylistPropertyDescription(mlcore *this)
{
  return MEMORY[0x1E0D4A808](this);
}

uint64_t mlcore::TVShowPropertyHasSeriesName(mlcore *this)
{
  return MEMORY[0x1E0D4A810](this);
}

uint64_t mlcore::AlbumPropertyAllCompilations(mlcore *this)
{
  return MEMORY[0x1E0D4A818](this);
}

uint64_t mlcore::AlbumPropertyDatePlayedLocal(mlcore *this)
{
  return MEMORY[0x1E0D4A820](this);
}

uint64_t mlcore::AlbumPropertyKeepLocalStatus(mlcore *this)
{
  return MEMORY[0x1E0D4A828](this);
}

uint64_t mlcore::ComposerPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4A830](this);
}

uint64_t mlcore::ItemArtistPropertySeriesName(mlcore *this)
{
  return MEMORY[0x1E0D4A838](this);
}

uint64_t mlcore::ItemPropertyAssetStoreItemID(mlcore *this)
{
  return MEMORY[0x1E0D4A840](this);
}

uint64_t mlcore::ItemPropertyBaseLocationPath(mlcore *this)
{
  return MEMORY[0x1E0D4A848](this);
}

uint64_t mlcore::ItemPropertyRemoteLocationID(mlcore *this)
{
  return MEMORY[0x1E0D4A850](this);
}

uint64_t mlcore::ItemPropertyStoreCloudStatus(mlcore *this)
{
  return MEMORY[0x1E0D4A858](this);
}

uint64_t mlcore::PlaylistItemPropertyPosition(mlcore *this)
{
  return MEMORY[0x1E0D4A860](this);
}

uint64_t mlcore::PlaylistPropertyDateModified(mlcore *this)
{
  return MEMORY[0x1E0D4A868](this);
}

uint64_t mlcore::PlaylistPropertyIsSubscribed(mlcore *this)
{
  return MEMORY[0x1E0D4A870](this);
}

uint64_t mlcore::PlaylistPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4A878](this);
}

uint64_t mlcore::PlaylistPropertyStoreCloudID(mlcore *this)
{
  return MEMORY[0x1E0D4A880](this);
}

uint64_t mlcore::TVSeasonPropertyEpisodeCount(mlcore *this)
{
  return MEMORY[0x1E0D4A888](this);
}

uint64_t mlcore::ItemPropertyAlbumPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4A890](this);
}

uint64_t mlcore::ItemPropertyClassicalMovement(mlcore *this)
{
  return MEMORY[0x1E0D4A898](this);
}

uint64_t mlcore::ItemPropertyDurationInSamples(mlcore *this)
{
  return MEMORY[0x1E0D4A8A0](this);
}

uint64_t mlcore::ItemPropertyGenrePersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4A8A8](this);
}

uint64_t mlcore::ItemPropertyHasStreamingAsset(mlcore *this)
{
  return MEMORY[0x1E0D4A8B0](this);
}

uint64_t mlcore::ItemPropertyPurchaseHistoryID(mlcore *this)
{
  return MEMORY[0x1E0D4A8B8](this);
}

uint64_t mlcore::ItemPropertyStoreCloudAlbumID(mlcore *this)
{
  return MEMORY[0x1E0D4A8C0](this);
}

uint64_t mlcore::LocalizedSearchPropertyWeight(mlcore *this)
{
  return MEMORY[0x1E0D4A8C8](this);
}

uint64_t mlcore::PersonPropertyCloudIdentifier(mlcore *this)
{
  return MEMORY[0x1E0D4A8D0](this);
}

uint64_t mlcore::PlaylistAuthorSocialProfileID(mlcore *this)
{
  return MEMORY[0x1E0D4A8D8](this);
}

uint64_t mlcore::PlaylistPropertyCloudGlobalID(mlcore *this)
{
  return MEMORY[0x1E0D4A8E0](this);
}

uint64_t mlcore::PlaylistPropertyCloudIsPublic(mlcore *this)
{
  return MEMORY[0x1E0D4A8E8](this);
}

uint64_t mlcore::PlaylistPropertyCloudShareURL(mlcore *this)
{
  return MEMORY[0x1E0D4A8F0](this);
}

uint64_t mlcore::PlaylistPropertySmartIsFolder(mlcore *this)
{
  return MEMORY[0x1E0D4A8F8](this);
}

uint64_t mlcore::PlaylistPropertySmartIsGenius(mlcore *this)
{
  return MEMORY[0x1E0D4A900](this);
}

uint64_t mlcore::AlbumPropertyGenrePersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4A908](this);
}

uint64_t mlcore::ArtistPropertyLibraryItemCount(mlcore *this)
{
  return MEMORY[0x1E0D4A910](this);
}

uint64_t mlcore::ItemArtistPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4A918](this);
}

uint64_t mlcore::ItemPropertyContentRatingLevel(mlcore *this)
{
  return MEMORY[0x1E0D4A920](this);
}

uint64_t mlcore::ItemPropertyExcludeFromShuffle(mlcore *this)
{
  return MEMORY[0x1E0D4A928](this);
}

uint64_t mlcore::ItemPropertyHLSAudioCapability(mlcore *this)
{
  return MEMORY[0x1E0D4A930](this);
}

uint64_t mlcore::ItemPropertyHasCloudSyncSource(mlcore *this)
{
  return MEMORY[0x1E0D4A938](this);
}

uint64_t mlcore::PlaylistAuthorPropertyPosition(mlcore *this)
{
  return MEMORY[0x1E0D4A940](this);
}

uint64_t mlcore::PlaylistPropertyCloudIsVisible(mlcore *this)
{
  return MEMORY[0x1E0D4A948](this);
}

uint64_t mlcore::PlaylistPropertyDateDownloaded(mlcore *this)
{
  return MEMORY[0x1E0D4A950](this);
}

uint64_t mlcore::PlaylistPropertyIsCuratorOwned(mlcore *this)
{
  return MEMORY[0x1E0D4A958](this);
}

uint64_t mlcore::PlaylistPropertyIsSourceRemote(mlcore *this)
{
  return MEMORY[0x1E0D4A960](this);
}

uint64_t mlcore::PlaylistPropertySmartIsDynamic(mlcore *this)
{
  return MEMORY[0x1E0D4A968](this);
}

uint64_t mlcore::PlaylistPropertySmartIsLimited(mlcore *this)
{
  return MEMORY[0x1E0D4A970](this);
}

uint64_t mlcore::TVEpisodePropertyEpisodeSortID(mlcore *this)
{
  return MEMORY[0x1E0D4A978](this);
}

uint64_t mlcore::AlbumPropertyArtistPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4A980](this);
}

uint64_t mlcore::CloudKVSEntityPropertyPlayCount(mlcore *this)
{
  return MEMORY[0x1E0D4A988](this);
}

uint64_t mlcore::ItemPropertyCloudAssetAvailable(mlcore *this)
{
  return MEMORY[0x1E0D4A990](this);
}

uint64_t mlcore::ItemPropertyEpisodeSubSortOrder(mlcore *this)
{
  return MEMORY[0x1E0D4A998](this);
}

uint64_t mlcore::ItemPropertyIsMasteredForiTunes(mlcore *this)
{
  return MEMORY[0x1E0D4A9A0](this);
}

uint64_t mlcore::ItemPropertyPodcastExternalGUID(mlcore *this)
{
  return MEMORY[0x1E0D4A9A8](this);
}

uint64_t mlcore::ItemPropertyStoreNeedsReporting(mlcore *this)
{
  return MEMORY[0x1E0D4A9B0](this);
}

uint64_t mlcore::ItemPropertyVolumeNormalization(mlcore *this)
{
  return MEMORY[0x1E0D4A9B8](this);
}

uint64_t mlcore::PlaylistAuthorPropertyIsPending(mlcore *this)
{
  return MEMORY[0x1E0D4A9C0](this);
}

uint64_t mlcore::PlaylistCategoryTypeIsEditorial(mlcore *this)
{
  return MEMORY[0x1E0D4A9C8](this);
}

uint64_t mlcore::PlaylistPropertyCloudAuthorName(mlcore *this)
{
  return MEMORY[0x1E0D4A9D0](this);
}

uint64_t mlcore::PlaylistPropertyDatePlayedLocal(mlcore *this)
{
  return MEMORY[0x1E0D4A9D8](this);
}

uint64_t mlcore::PlaylistPropertyIsCollaborative(mlcore *this)
{
  return MEMORY[0x1E0D4A9E0](this);
}

uint64_t mlcore::PlaylistPropertyKeepLocalStatus(mlcore *this)
{
  return MEMORY[0x1E0D4A9E8](this);
}

uint64_t mlcore::AlbumPropertyLatestItemDateAdded(mlcore *this)
{
  return MEMORY[0x1E0D4A9F0](this);
}

uint64_t mlcore::AlbumPropertyVolumeNormalization(mlcore *this)
{
  return MEMORY[0x1E0D4A9F8](this);
}

uint64_t mlcore::GenrePropertyLatestItemDateAdded(mlcore *this)
{
  return MEMORY[0x1E0D4AA00](this);
}

uint64_t mlcore::ItemPropertyComposerPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AA08](this);
}

uint64_t mlcore::ItemPropertyGaplessEncodingDelay(mlcore *this)
{
  return MEMORY[0x1E0D4AA10](this);
}

uint64_t mlcore::ItemPropertyGaplessEncodingDrain(mlcore *this)
{
  return MEMORY[0x1E0D4AA18](this);
}

uint64_t mlcore::ItemPropertyGaplessHeuristicInfo(mlcore *this)
{
  return MEMORY[0x1E0D4AA20](this);
}

uint64_t mlcore::ItemPropertyHLSKeyCertificateURL(mlcore *this)
{
  return MEMORY[0x1E0D4AA28](this);
}

uint64_t mlcore::ItemPropertyHLSKeyServerProtocol(mlcore *this)
{
  return MEMORY[0x1E0D4AA30](this);
}

uint64_t mlcore::ItemPropertyHasNonPurgeableAsset(mlcore *this)
{
  return MEMORY[0x1E0D4AA38](this);
}

uint64_t mlcore::ItemPropertyKeepLocalConstraints(mlcore *this)
{
  return MEMORY[0x1E0D4AA40](this);
}

uint64_t mlcore::ItemPropertyRememberBookmarkTime(mlcore *this)
{
  return MEMORY[0x1E0D4AA48](this);
}

uint64_t mlcore::ItemPropertyReportingStoreItemID(mlcore *this)
{
  return MEMORY[0x1E0D4AA50](this);
}

uint64_t mlcore::ItemPropertyShowComposerAsArtist(mlcore *this)
{
  return MEMORY[0x1E0D4AA58](this);
}

uint64_t mlcore::ItemPropertyStoreCanonicalItemId(mlcore *this)
{
  return MEMORY[0x1E0D4AA60](this);
}

uint64_t mlcore::ItemPropertyStoreLyricsAvailable(mlcore *this)
{
  return MEMORY[0x1E0D4AA68](this);
}

uint64_t mlcore::PlaylistCategoryTypeIsUserShared(mlcore *this)
{
  return MEMORY[0x1E0D4AA70](this);
}

uint64_t mlcore::PlaylistItemPropertyOccurrenceID(mlcore *this)
{
  return MEMORY[0x1E0D4AA78](this);
}

uint64_t mlcore::PlaylistItemPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AA80](this);
}

uint64_t mlcore::PlaylistItemPropertyPositionUUID(mlcore *this)
{
  return MEMORY[0x1E0D4AA88](this);
}

uint64_t mlcore::PlaylistItemReactionPropertyDate(mlcore *this)
{
  return MEMORY[0x1E0D4AA90](this);
}

uint64_t mlcore::PlaylistPropertyCloudVersionHash(mlcore *this)
{
  return MEMORY[0x1E0D4AA98](this);
}

uint64_t mlcore::PlaylistPropertyIsFavoritedSongs(mlcore *this)
{
  return MEMORY[0x1E0D4AAA0](this);
}

uint64_t mlcore::AlbumPropertyKeepLocalConstraints(mlcore *this)
{
  return MEMORY[0x1E0D4AAA8](this);
}

uint64_t mlcore::ArtistPropertyLatestItemDateAdded(mlcore *this)
{
  return MEMORY[0x1E0D4AAB0](this);
}

uint64_t mlcore::ItemPropertyAvailableArtworkToken(mlcore *this)
{
  return MEMORY[0x1E0D4AAB8](this);
}

uint64_t mlcore::ItemPropertyFetchableArtworkToken(mlcore *this)
{
  return MEMORY[0x1E0D4AAC0](this);
}

uint64_t mlcore::ItemPropertyHasLoFiStreamingAsset(mlcore *this)
{
  return MEMORY[0x1E0D4AAC8](this);
}

uint64_t mlcore::ItemPropertyIsStoreRedownloadable(mlcore *this)
{
  return MEMORY[0x1E0D4AAD0](this);
}

uint64_t mlcore::ItemPropertyKeepLocalStatusReason(mlcore *this)
{
  return MEMORY[0x1E0D4AAD8](this);
}

uint64_t mlcore::ItemPropertyLikedStateChangedDate(mlcore *this)
{
  return MEMORY[0x1E0D4AAE0](this);
}

uint64_t mlcore::PlaylistCategoryTypeIsPersonalMix(mlcore *this)
{
  return MEMORY[0x1E0D4AAE8](this);
}

uint64_t mlcore::PlaylistPropertyCloudAuthorHandle(mlcore *this)
{
  return MEMORY[0x1E0D4AAF0](this);
}

uint64_t mlcore::PlaylistPropertyCollaborationMode(mlcore *this)
{
  return MEMORY[0x1E0D4AAF8](this);
}

uint64_t mlcore::AlbumPropertyContainsClassicalWork(mlcore *this)
{
  return MEMORY[0x1E0D4AB00](this);
}

uint64_t mlcore::AlbumPropertyKeepLocalStatusReason(mlcore *this)
{
  return MEMORY[0x1E0D4AB08](this);
}

uint64_t mlcore::AlbumPropertyLikedStateChangedDate(mlcore *this)
{
  return MEMORY[0x1E0D4AB10](this);
}

uint64_t mlcore::CloudKVSEntityPropertyBookmarkTime(mlcore *this)
{
  return MEMORY[0x1E0D4AB18](this);
}

uint64_t mlcore::ItemPropertyClassicalMovementCount(mlcore *this)
{
  return MEMORY[0x1E0D4AB20](this);
}

uint64_t mlcore::ItemPropertyEpisodeTypeDisplayName(mlcore *this)
{
  return MEMORY[0x1E0D4AB28](this);
}

uint64_t mlcore::ItemPropertyGaplessLastFrameResync(mlcore *this)
{
  return MEMORY[0x1E0D4AB30](this);
}

uint64_t mlcore::ItemPropertyItemArtistPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AB38](this);
}

uint64_t mlcore::ItemPropertyLibraryLyricsAvailable(mlcore *this)
{
  return MEMORY[0x1E0D4AB40](this);
}

uint64_t mlcore::PlaylistAuthorPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AB48](this);
}

uint64_t mlcore::PlaylistPropertyCloudAuthorStoreID(mlcore *this)
{
  return MEMORY[0x1E0D4AB50](this);
}

uint64_t mlcore::PlaylistPropertyCollaboratorStatus(mlcore *this)
{
  return MEMORY[0x1E0D4AB58](this);
}

uint64_t mlcore::PlaylistPropertyCoverArtworkRecipe(mlcore *this)
{
  return MEMORY[0x1E0D4AB60](this);
}

uint64_t mlcore::PlaylistPropertyParentPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AB68](this);
}

uint64_t mlcore::PlaylistPropertyShouldDisplayIndex(mlcore *this)
{
  return MEMORY[0x1E0D4AB70](this);
}

uint64_t mlcore::AlbumPropertyMaximumItemTrackNumber(mlcore *this)
{
  return MEMORY[0x1E0D4AB78](this);
}

uint64_t mlcore::ArtistPropertyAvailableArtworkToken(mlcore *this)
{
  return MEMORY[0x1E0D4AB80](this);
}

uint64_t mlcore::ArtistPropertyFetchableArtworkToken(mlcore *this)
{
  return MEMORY[0x1E0D4AB88](this);
}

uint64_t mlcore::ArtistPropertyLikedStateChangedDate(mlcore *this)
{
  return MEMORY[0x1E0D4AB90](this);
}

uint64_t mlcore::CloudKVSEntityPropertyHasBeenPlayed(mlcore *this)
{
  return MEMORY[0x1E0D4AB98](this);
}

uint64_t mlcore::ComposerPropertyLatestItemDateAdded(mlcore *this)
{
  return MEMORY[0x1E0D4ABA0](this);
}

uint64_t mlcore::ItemPropertyAlbumArtistPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4ABA8](this);
}

uint64_t mlcore::ItemPropertyClassicalMovementNumber(mlcore *this)
{
  return MEMORY[0x1E0D4ABB0](this);
}

uint64_t mlcore::ItemPropertyIsArtistUploadedContent(mlcore *this)
{
  return MEMORY[0x1E0D4ABB8](this);
}

uint64_t mlcore::ItemPropertySubscriptionStoreItemID(mlcore *this)
{
  return MEMORY[0x1E0D4ABC0](this);
}

uint64_t mlcore::PersonPropertyHasLightweightProfile(mlcore *this)
{
  return MEMORY[0x1E0D4ABC8](this);
}

uint64_t mlcore::TVSeasonPropertyLatestItemDateAdded(mlcore *this)
{
  return MEMORY[0x1E0D4ABD0](this);
}

uint64_t mlcore::PlaylistItemPropertyItemPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4ABD8](this);
}

uint64_t mlcore::PlaylistPropertyKeepLocalConstraints(mlcore *this)
{
  return MEMORY[0x1E0D4ABE0](this);
}

uint64_t mlcore::ArtistPropertyCloudUniversalLibraryID(mlcore *this)
{
  return MEMORY[0x1E0D4ABE8](this);
}

uint64_t mlcore::ItemPropertyHomeSharingAssetAvailable(mlcore *this)
{
  return MEMORY[0x1E0D4ABF0](this);
}

uint64_t mlcore::ItemPropertyMatchRedownloadParameters(mlcore *this)
{
  return MEMORY[0x1E0D4ABF8](this);
}

uint64_t mlcore::ItemPropertyStorePlaybackEndpointType(mlcore *this)
{
  return MEMORY[0x1E0D4AC00](this);
}

uint64_t mlcore::ItemPropertyTimeSyncedLyricsAvailable(mlcore *this)
{
  return MEMORY[0x1E0D4AC08](this);
}

uint64_t mlcore::PlaylistPropertyAvailableArtworkToken(mlcore *this)
{
  return MEMORY[0x1E0D4AC10](this);
}

uint64_t mlcore::PlaylistPropertyFetchableArtworkToken(mlcore *this)
{
  return MEMORY[0x1E0D4AC18](this);
}

uint64_t mlcore::PlaylistPropertyKeepLocalStatusReason(mlcore *this)
{
  return MEMORY[0x1E0D4AC20](this);
}

uint64_t mlcore::PlaylistPropertyLikedStateChangedDate(mlcore *this)
{
  return MEMORY[0x1E0D4AC28](this);
}

uint64_t mlcore::ItemPropertyFetchableArtworkSourceType(mlcore *this)
{
  return MEMORY[0x1E0D4AC30](this);
}

uint64_t mlcore::ItemArtistPropertyAvailableArtworkToken(mlcore *this)
{
  return MEMORY[0x1E0D4AC38](this);
}

uint64_t mlcore::ItemArtistPropertyFetchableArtworkToken(mlcore *this)
{
  return MEMORY[0x1E0D4AC40](this);
}

uint64_t mlcore::PlaylistPropertyCloudUniversalLibraryID(mlcore *this)
{
  return MEMORY[0x1E0D4AC48](this);
}

uint64_t mlcore::PlaylistPropertyCollaboratorPermissions(mlcore *this)
{
  return MEMORY[0x1E0D4AC50](this);
}

uint64_t mlcore::PlaylistPropertyIsTracklistUserEditable(mlcore *this)
{
  return MEMORY[0x1E0D4AC58](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemMediaType(mlcore *this)
{
  return MEMORY[0x1E0D4AC60](this);
}

uint64_t mlcore::ArtistPropertyFetchableArtworkSourceType(mlcore *this)
{
  return MEMORY[0x1E0D4AC68](this);
}

uint64_t mlcore::ItemPropertyStoreCloudUniversalLibraryID(mlcore *this)
{
  return MEMORY[0x1E0D4AC70](this);
}

uint64_t mlcore::ItemPropertyStoreExtendedLyricsAttribute(mlcore *this)
{
  return MEMORY[0x1E0D4AC78](this);
}

uint64_t mlcore::PlaylistAuthorPropertyPersonPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AC80](this);
}

uint64_t mlcore::PlaylistItemReactionPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AC88](this);
}

uint64_t mlcore::PlaylistItemReactionPropertyReactionText(mlcore *this)
{
  return MEMORY[0x1E0D4AC90](this);
}

uint64_t mlcore::PlaylistPropertyIsExternalVendorPlaylist(mlcore *this)
{
  return MEMORY[0x1E0D4AC98](this);
}

uint64_t mlcore::TVSeasonPropertyLatestItemDateDownloaded(mlcore *this)
{
  return MEMORY[0x1E0D4ACA0](this);
}

uint64_t mlcore::AlbumPropertyClassicalExperienceAvailable(mlcore *this)
{
  return MEMORY[0x1E0D4ACA8](this);
}

uint64_t mlcore::PlaylistItemPropertyAvailableArtworkToken(mlcore *this)
{
  return MEMORY[0x1E0D4ACB0](this);
}

uint64_t mlcore::PlaylistItemPropertyFetchableArtworkToken(mlcore *this)
{
  return MEMORY[0x1E0D4ACB8](this);
}

uint64_t mlcore::PlaylistPropertyExternalVendorDisplayName(mlcore *this)
{
  return MEMORY[0x1E0D4ACC0](this);
}

uint64_t mlcore::TVEpisodePropertyAvailableScreenshotToken(mlcore *this)
{
  return MEMORY[0x1E0D4ACC8](this);
}

uint64_t mlcore::TVEpisodePropertyFetchableScreenshotToken(mlcore *this)
{
  return MEMORY[0x1E0D4ACD0](this);
}

uint64_t mlcore::ArtistPropertyClassicalExperienceAvailable(mlcore *this)
{
  return MEMORY[0x1E0D4ACD8](this);
}

uint64_t mlcore::PlaylistPropertyCollaborationInvitationURL(mlcore *this)
{
  return MEMORY[0x1E0D4ACE0](this);
}

uint64_t mlcore::PlaylistPropertyFetchableArtworkSourceType(mlcore *this)
{
  return MEMORY[0x1E0D4ACE8](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4ACF0](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemShowSortType(mlcore *this)
{
  return MEMORY[0x1E0D4ACF8](this);
}

uint64_t mlcore::PlaylistAuthorPropertyContainerPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AD00](this);
}

uint64_t mlcore::ArtistPropertyRepresentativeItemPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AD08](this);
}

uint64_t mlcore::ItemArtistPropertyFetchableArtworkSourceType(mlcore *this)
{
  return MEMORY[0x1E0D4AD10](this);
}

uint64_t mlcore::ContainerItemPersonPropertyPersonPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AD18](this);
}

uint64_t mlcore::PlaylistPropertyIsSubscribedAndNotPersonalMix(mlcore *this)
{
  return MEMORY[0x1E0D4AD20](this);
}

uint64_t mlcore::ItemArtistPropertyClassicalExperienceAvailable(mlcore *this)
{
  return MEMORY[0x1E0D4AD28](this);
}

uint64_t mlcore::PlaylistItemPropertyFetchableArtworkSourceType(mlcore *this)
{
  return MEMORY[0x1E0D4AD30](this);
}

uint64_t mlcore::PlaylistItemReactionPropertyPersonPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AD38](this);
}

uint64_t mlcore::TVEpisodePropertyFetchableScreenshotSourceType(mlcore *this)
{
  return MEMORY[0x1E0D4AD40](this);
}

uint64_t mlcore::ItemPropertyPurchaseHistoryRedownloadParameters(mlcore *this)
{
  return MEMORY[0x1E0D4AD48](this);
}

uint64_t mlcore::PlaylistPropertyCollaborationJoinRequestPending(mlcore *this)
{
  return MEMORY[0x1E0D4AD50](this);
}

uint64_t mlcore::ItemArtistPropertyRepresentativeItemPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AD58](this);
}

uint64_t mlcore::Item::EntityClass(mlcore::Item *this)
{
  return MEMORY[0x1E0D4AD60](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemAvailableArtworkToken(mlcore *this)
{
  return MEMORY[0x1E0D4AD68](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemCollectionDescription(mlcore *this)
{
  return MEMORY[0x1E0D4AD70](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemFetchableArtworkToken(mlcore *this)
{
  return MEMORY[0x1E0D4AD78](this);
}

uint64_t mlcore::PlaylistItemReactionPropertyContainerItemPersistentID(mlcore *this)
{
  return MEMORY[0x1E0D4AD80](this);
}

uint64_t mlcore::PlaylistPropertyCollaborationInvitationURLExpirationDate(mlcore *this)
{
  return MEMORY[0x1E0D4AD88](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemFetchableArtworkSourceType(mlcore *this)
{
  return MEMORY[0x1E0D4AD90](this);
}

uint64_t mlcore::Album::EntityClass(mlcore::Album *this)
{
  return MEMORY[0x1E0D4AD98](this);
}

uint64_t mlcore::Genre::EntityClass(mlcore::Genre *this)
{
  return MEMORY[0x1E0D4ADA0](this);
}

uint64_t mlcore::Genre::Genre(mlcore::Genre *this)
{
  return MEMORY[0x1E0D4ADA8](this);
}

uint64_t mlcore::Movie::EntityClass(mlcore::Movie *this)
{
  return MEMORY[0x1E0D4ADB0](this);
}

uint64_t mlcore::Query::setPredicate()
{
  return MEMORY[0x1E0D4ADB8]();
}

uint64_t mlcore::Query::Query()
{
  return MEMORY[0x1E0D4ADC0]();
}

uint64_t mlcore::Artist::EntityClass(mlcore::Artist *this)
{
  return MEMORY[0x1E0D4ADC8](this);
}

uint64_t mlcore::Artist::Artist(mlcore::Artist *this)
{
  return MEMORY[0x1E0D4ADD0](this);
}

uint64_t mlcore::Entity::propertyCache(mlcore::Entity *this)
{
  return MEMORY[0x1E0D4ADD8](this);
}

uint64_t mlcore::Person::EntityClass(mlcore::Person *this)
{
  return MEMORY[0x1E0D4ADE0](this);
}

uint64_t mlcore::TVShow::EntityClass(mlcore::TVShow *this)
{
  return MEMORY[0x1E0D4ADE8](this);
}

uint64_t mlcore::TVShow::TVShow(mlcore::TVShow *this)
{
  return MEMORY[0x1E0D4ADF0](this);
}

uint64_t mlcore::Library::createLibrary()
{
  return MEMORY[0x1E0D4ADF8]();
}

uint64_t mlcore::Podcast::EntityClass(mlcore::Podcast *this)
{
  return MEMORY[0x1E0D4AE00](this);
}

uint64_t mlcore::Section::Section()
{
  return MEMORY[0x1E0D4AE08]();
}

uint64_t mlcore::Composer::EntityClass(mlcore::Composer *this)
{
  return MEMORY[0x1E0D4AE10](this);
}

uint64_t mlcore::Composer::Composer(mlcore::Composer *this)
{
  return MEMORY[0x1E0D4AE18](this);
}

uint64_t mlcore::Playlist::EntityClass(mlcore::Playlist *this)
{
  return MEMORY[0x1E0D4AE20](this);
}

uint64_t mlcore::Playlist::Playlist(mlcore::Playlist *this)
{
  return MEMORY[0x1E0D4AE28](this);
}

uint64_t mlcore::TVSeason::EntityClass(mlcore::TVSeason *this)
{
  return MEMORY[0x1E0D4AE30](this);
}

uint64_t mlcore::TVEpisode::EntityClass(mlcore::TVEpisode *this)
{
  return MEMORY[0x1E0D4AE38](this);
}

uint64_t mediaplatform::DatabaseTableBase::name(mediaplatform::DatabaseTableBase *this)
{
  return MEMORY[0x1E0D4AE40](this);
}

uint64_t mediaplatform::Data::bytes(mediaplatform::Data *this)
{
  return MEMORY[0x1E0D4AE48](this);
}

uint64_t mediaplatform::Data::length(mediaplatform::Data *this)
{
  return MEMORY[0x1E0D4AE50](this);
}

uint64_t mlcore::MediaError::operator BOOL()
{
  return MEMORY[0x1E0D4AE58]();
}

uint64_t mlcore::EntityQuery::identityPropertiesToFetch(mlcore::EntityQuery *this)
{
  return MEMORY[0x1E0D4AE60](this);
}

uint64_t mlcore::LibraryView::filterPredicateForEntityClass()
{
  return MEMORY[0x1E0D4AE68]();
}

uint64_t mlcore::LibraryView::filters(mlcore::LibraryView *this)
{
  return MEMORY[0x1E0D4AE70](this);
}

uint64_t mlcore::QueryResult::error(mlcore::QueryResult *this)
{
  return MEMORY[0x1E0D4AE78](this);
}

uint64_t mlcore::PropertyCache::hasValueForProperty(mlcore::PropertyCache *this, ModelPropertyBase *a2)
{
  return MEMORY[0x1E0D4AE80](this, a2);
}

uint64_t mlcore::SortDescriptor::ordering(mlcore::SortDescriptor *this)
{
  return MEMORY[0x1E0D4AE88](this);
}

uint64_t mlcore::SortDescriptor::property(mlcore::SortDescriptor *this)
{
  return MEMORY[0x1E0D4AE90](this);
}

uint64_t mlcore::PropertiesQuery::propertiesToFetch(mlcore::PropertiesQuery *this)
{
  return MEMORY[0x1E0D4AE98](this);
}

uint64_t mlcore::EntityQueryResult::entityCache(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1E0D4AEA0](this);
}

uint64_t mlcore::EntityQueryResult::entityCount(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1E0D4AEA8](this);
}

uint64_t mlcore::EntityQueryResult::entityRevision(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1E0D4AEB0](this);
}

uint64_t mlcore::EntityQueryResult::persistentIDAtIndex(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1E0D4AEB8](this);
}

uint64_t mlcore::PropertiesQueryResult::allResults(mlcore::PropertiesQueryResult *this)
{
  return MEMORY[0x1E0D4AEC0](this);
}

uint64_t mlcore::AggregateFunctionQueryResult::value(mlcore::AggregateFunctionQueryResult *this)
{
  return MEMORY[0x1E0D4AEC8](this);
}

uint64_t mlcore::Query::entityClass(mlcore::Query *this)
{
  return MEMORY[0x1E0D4AED0](this);
}

uint64_t mlcore::Query::predicate(mlcore::Query *this)
{
  return MEMORY[0x1E0D4AED8](this);
}

uint64_t mlcore::Section::sectionIndex(mlcore::Section *this)
{
  return MEMORY[0x1E0D4AEE0](this);
}

uint64_t mlcore::Section::localizedTitle(mlcore::Section *this)
{
  return MEMORY[0x1E0D4AEE8](this);
}

uint64_t mlcore::Section::range(mlcore::Section *this)
{
  return MEMORY[0x1E0D4AEF0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4290](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E3148538(__p);
}

uint64_t operator delete()
{
  return off_1E3148540();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E3148548(__sz);
}

uint64_t operator new()
{
  return off_1E3148550();
}

uint64_t __UIApplicationLinkedOnOrAfter()
{
  return MEMORY[0x1E0DC5B30]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A68](cls, protocol);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x1E0DE7AD0](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF0](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
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

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CC0](data1, data2);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
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

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
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

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
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

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  ldiv_t result;

  v2 = MEMORY[0x1E0C83B50](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  lldiv_t result;

  v2 = MEMORY[0x1E0C83B90](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

uint64_t msv_dispatch_async_on_queue()
{
  return MEMORY[0x1E0D4D138]();
}

uint64_t msv_dispatch_on_main_queue()
{
  return MEMORY[0x1E0D4D140]();
}

uint64_t msv_dispatch_sync_on_queue()
{
  return MEMORY[0x1E0D4D148]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
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

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1E0DE8060](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1E0DE80A0](proto, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80D0](str);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1E0DE80D8](lhs, rhs);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

