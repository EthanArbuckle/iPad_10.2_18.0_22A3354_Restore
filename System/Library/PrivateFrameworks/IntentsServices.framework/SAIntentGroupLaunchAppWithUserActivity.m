@implementation SAIntentGroupLaunchAppWithUserActivity

void __141__SAIntentGroupLaunchAppWithUserActivity_INSExtensionService__ins_launchAppWithConnection_userActivityIdentifier_delegate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _Unwind_Exception *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v9 = (_QWORD *)getFBSOpenApplicationErrorDomainSymbolLoc_ptr_270;
    v20 = getFBSOpenApplicationErrorDomainSymbolLoc_ptr_270;
    if (!getFBSOpenApplicationErrorDomainSymbolLoc_ptr_270)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __getFBSOpenApplicationErrorDomainSymbolLoc_block_invoke_271;
      v16[3] = &unk_24C4B95F8;
      v16[4] = &v17;
      __getFBSOpenApplicationErrorDomainSymbolLoc_block_invoke_271((uint64_t)v16);
      v9 = (_QWORD *)v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (!v9)
    {
      dlerror();
      v15 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v17, 8);
      _Unwind_Resume(v15);
    }
    if (objc_msgSend(v8, "isEqualToString:", *v9))
    {
      v10 = objc_msgSend(v7, "code");

      if (v10 == 7)
        v11 = 1310;
      else
        v11 = 1308;
    }
    else
    {

      v11 = 1308;
    }
    v13 = *(void **)(a1 + 32);
    INSExtensionServiceTraceCompletionHandlerWithCode(*(void **)(a1 + 40), 722470896);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v14, v11, v7);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, id, _QWORD))(v12 + 16))(v12, v5, 0);
  }

}

@end
