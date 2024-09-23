@implementation HFAppleMusicAccountOperations

+ (id)executeCompanionLoginForAccessory:(id)a3 account:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAppleMusicAccountArbitrator.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessory"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAppleMusicAccountArbitrator.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

LABEL_3:
  +[HFMediaDispatcher sharedDispatcher](HFMediaDispatcher, "sharedDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appleMusicAccountStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F0C8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountsWithAccountType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __75__HFAppleMusicAccountOperations_executeCompanionLoginForAccessory_account___block_invoke;
  v29[3] = &unk_1EA73E608;
  v15 = v9;
  v30 = v15;
  objc_msgSend(v13, "na_firstObjectPassingTest:", v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D519C0];
  if (v16)
  {
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __75__HFAppleMusicAccountOperations_executeCompanionLoginForAccessory_account___block_invoke_2;
    v25[3] = &unk_1EA7330E8;
    v28 = a1;
    v26 = v7;
    v27 = v16;
    objc_msgSend(v17, "lazyFutureWithBlock:", v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v26;
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v31 = CFSTR("accessory");
    v32[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hf_errorWithCode:operation:options:", 10, CFSTR("AppleMusicProxyLogin"), v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithError:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

uint64_t __75__HFAppleMusicAccountOperations_executeCompanionLoginForAccessory_account___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "aa_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

void __75__HFAppleMusicAccountOperations_executeCompanionLoginForAccessory_account___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 48), "_validateRemoteLoginHandlerForAccessory:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__HFAppleMusicAccountOperations_executeCompanionLoginForAccessory_account___block_invoke_3;
  v7[3] = &unk_1EA73E630;
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v5 = v3;
  v6 = (id)objc_msgSend(v4, "addSuccessBlock:", v7);

}

void __75__HFAppleMusicAccountOperations_executeCompanionLoginForAccessory_account___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "errorOnlyCompletionHandlerAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "companionLoginWithAccount:completion:", v2, v5);

}

+ (id)executeProxyLoginForAccessory:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAppleMusicAccountArbitrator.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessory"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAppleMusicAccountArbitrator.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)MEMORY[0x1E0D519C0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke;
  v17[3] = &unk_1EA7330E8;
  v19 = v9;
  v20 = a1;
  v18 = v7;
  v11 = v9;
  v12 = v7;
  objc_msgSend(v10, "lazyFutureWithBlock:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(a1[6], "_validateRemoteLoginHandlerForAccessory:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_2;
  v9[3] = &unk_1EA73E680;
  v10 = a1[5];
  v5 = a1[4];
  v6 = a1[6];
  v12 = v3;
  v13 = v6;
  v11 = v5;
  v7 = v3;
  v8 = (id)objc_msgSend(v4, "addSuccessBlock:", v9);

}

void __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  uint8_t buf[16];

  v2 = (void *)objc_opt_new();
  HFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Calling [AKAppleIDAuthenticationController authenticateWithContext:completion:]", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_19;
  v7[3] = &unk_1EA73A1F0;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v9 = v6;
  objc_msgSend(v2, "authenticateWithContext:completion:", v4, v7);

}

void __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "AKAppleIDAuthenticationController returned with results %@ - error = %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_20;
  block[3] = &unk_1EA73E658;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v15 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v16 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_20(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Now completing Login for Accessory %@ ", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 64), "_completeLoginForAccessory:results:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_21;
  v6[3] = &unk_1EA72CBB8;
  v7 = *(id *)(a1 + 56);
  v5 = (id)objc_msgSend(v4, "addCompletionBlock:", v6);

}

void __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "_completeLoginForAccessory returned with result [%@] Error - [%@] ", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v5, v6);
}

+ (id)logoutAccessories:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  id obj;
  _QWORD v36[4];
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
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAppleMusicAccountArbitrator.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessories.count >= 1"));

  }
  v6 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v11);
      objc_msgSend(v12, "remoteLoginHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v13)
        break;
      if ((objc_msgSend(v13, "isControllable") & 1) == 0)
      {
        v25 = (void *)MEMORY[0x1E0D519C0];
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v47[0] = CFSTR("accessories");
        v47[1] = CFSTR("failedAccessory");
        v48[0] = v7;
        v48[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v30;
        v29 = 12;
        goto LABEL_22;
      }

      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    v25 = (void *)MEMORY[0x1E0D519C0];
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v49[0] = CFSTR("accessories");
    v49[1] = CFSTR("failedAccessory");
    v50[0] = v7;
    v50[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = 11;
LABEL_22:
    objc_msgSend(v28, "hf_errorWithCode:operation:options:", v29, CFSTR("AppleMusicLogout"), v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "futureWithError:", v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
LABEL_12:

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v34 = v7;
  obj = v7;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v39;
    v18 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "remoteLoginHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0D519C0];
        v36[0] = v18;
        v36[1] = 3221225472;
        v36[2] = __51__HFAppleMusicAccountOperations_logoutAccessories___block_invoke;
        v36[3] = &unk_1EA728A78;
        v37 = v20;
        v22 = v20;
        objc_msgSend(v21, "lazyFutureWithBlock:", v36);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v23);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v34;
LABEL_23:

  return v24;
}

void __51__HFAppleMusicAccountOperations_logoutAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HFAppleMusicAccountOperations_logoutAccessories___block_invoke_2;
  v6[3] = &unk_1EA726968;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "signout:", v6);

}

void __51__HFAppleMusicAccountOperations_logoutAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__HFAppleMusicAccountOperations_logoutAccessories___block_invoke_3;
  v5[3] = &unk_1EA727188;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __51__HFAppleMusicAccountOperations_logoutAccessories___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v1, "finishWithError:");
  else
    return objc_msgSend(v1, "finishWithNoResult");
}

+ (id)_completeLoginForAccessory:(id)a3 results:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    HFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "Returning from _completeLoginForAccessory due to error  = [%@]", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_msgSend(v8, "count");
    v14 = (void *)MEMORY[0x1E0D519C0];
    if (v13)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __74__HFAppleMusicAccountOperations__completeLoginForAccessory_results_error___block_invoke;
      v16[3] = &unk_1EA728590;
      v17 = v7;
      v18 = v8;
      objc_msgSend(v14, "futureWithErrorOnlyHandlerAdapterBlock:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
LABEL_8:

  return v12;
}

void __74__HFAppleMusicAccountOperations__completeLoginForAccessory_results_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  HFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Calling  proxyLoginWithAuthResults:", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "remoteLoginHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxyLoginWithAuthResults:completion:", *(_QWORD *)(a1 + 40), v3);

}

+ (id)_validateRemoteLoginHandlerForAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "remoteLoginHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v7 = (void *)MEMORY[0x1E0D519C0];
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v18 = CFSTR("accessory");
    v19[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = 11;
LABEL_6:
    objc_msgSend(v11, "hf_errorWithCode:operation:options:", v12, CFSTR("AppleMusicProxyLogin"), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithError:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "isControllable");
  v7 = (void *)MEMORY[0x1E0D519C0];
  if ((v6 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v16 = CFSTR("accessory");
    v17 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v12 = 12;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

@end
