@implementation SAIntentGroupLaunchAppWithIntent

void __112__SAIntentGroupLaunchAppWithIntent_INSExtensionService__ins_launchAppWithConnection_delegate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _Unwind_Exception *v20;
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v21 = v5;
    v8 = v6;
    v9 = *MEMORY[0x24BDD1398];
    v10 = MEMORY[0x24BDAC760];
    do
    {
      objc_msgSend(v8, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v12 = (_QWORD *)getFBSOpenApplicationErrorDomainSymbolLoc_ptr;
      v26 = getFBSOpenApplicationErrorDomainSymbolLoc_ptr;
      if (!getFBSOpenApplicationErrorDomainSymbolLoc_ptr)
      {
        v22[0] = v10;
        v22[1] = 3221225472;
        v22[2] = __getFBSOpenApplicationErrorDomainSymbolLoc_block_invoke;
        v22[3] = &unk_24C4B95F8;
        v22[4] = &v23;
        __getFBSOpenApplicationErrorDomainSymbolLoc_block_invoke((uint64_t)v22);
        v12 = (_QWORD *)v24[3];
      }
      _Block_object_dispose(&v23, 8);
      if (!v12)
      {
        dlerror();
        v20 = (_Unwind_Exception *)abort_report_np();
        _Block_object_dispose(&v23, 8);
        _Unwind_Resume(v20);
      }
      if (objc_msgSend(v11, "isEqualToString:", *v12))
      {
        v13 = objc_msgSend(v8, "code");

        if (v13 == 7)
        {

          v17 = 1310;
          goto LABEL_14;
        }
      }
      else
      {

      }
      objc_msgSend(v8, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v9);
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v15;
    }
    while (v15);
    v17 = 1305;
LABEL_14:
    v18 = *(void **)(a1 + 32);
    INSExtensionServiceTraceCompletionHandlerWithCode(*(void **)(a1 + 40), 722470896);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v19, v17, 0);

    v5 = v21;
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(uint64_t, id, _QWORD))(v16 + 16))(v16, v5, 0);
  }

}

@end
