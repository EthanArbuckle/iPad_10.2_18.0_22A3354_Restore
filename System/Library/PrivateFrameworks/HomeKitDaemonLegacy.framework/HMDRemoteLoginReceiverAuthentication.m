@implementation HMDRemoteLoginReceiverAuthentication

- (HMDRemoteLoginReceiverAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7
{
  id v12;
  HMDRemoteLoginReceiverAuthentication *v13;
  HMDRemoteLoginReceiverAuthentication *v14;
  objc_super v16;

  v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)HMDRemoteLoginReceiverAuthentication;
  v13 = -[HMDRemoteLoginAuthentication initWithSessionID:remoteDevice:workQueue:remoteMessageSender:](&v16, sel_initWithSessionID_remoteDevice_workQueue_remoteMessageSender_, a3, a4, a5, a6);
  v14 = v13;
  if (v13)
    objc_storeWeak((id *)&v13->_delegate, v12);

  return v14;
}

- (void)_saveRemoteVerifiedAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountTypeWithAccountTypeIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAccountType:", v14);
    objc_msgSend(v6, "_setObjectID:", 0);
    objc_msgSend(v6, "markAllPropertiesDirty");
    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __78__HMDRemoteLoginReceiverAuthentication__saveRemoteVerifiedAccount_completion___block_invoke;
    v17[3] = &unk_1E89B9648;
    v17[4] = self;
    v19 = v7;
    v18 = v6;
    objc_msgSend(v16, "saveVerifiedAccount:withCompletionHandler:", v18, v17);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
  }

}

- (void)_authenticateForAccountType:(unint64_t)a3 usingAuthenticationResults:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  HMDRemoteLoginReceiverAuthentication *v11;
  NSObject *v12;
  void *v13;
  char *v14;
  void *v15;
  HMDRemoteLoginReceiverAuthentication *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMDRemoteLoginAccountTypeAsString(a3);
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Authenticating account type %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  if (a3)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v11;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HMDRemoteLoginAccountTypeAsString(a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v18;
      v23 = 2080;
      v24 = "-[HMDRemoteLoginReceiverAuthentication _authenticateForAccountType:usingAuthenticationResults:completionHandler:]";
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@%s: Unknown account services: %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 43);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v20, 0);

  }
  else
  {
    -[HMDRemoteLoginReceiverAuthentication _authenticateStoreWithAuthenticationResults:completionHandler:](v11, "_authenticateStoreWithAuthenticationResults:completionHandler:", v8, v9);
  }

}

- (void)_authenticateStoreWithAuthenticationResults:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  HMDRemoteLoginReceiverAuthentication *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDRemoteLoginReceiverAuthentication *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = a4;
  objc_msgSend(v6, "hmf_stringForKey:", *MEMORY[0x1E0CFFFC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_stringForKey:", *MEMORY[0x1E0CFFF40]);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_stringForKey:", *MEMORY[0x1E0CFFFA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_stringForKey:", *MEMORY[0x1E0CFFFA8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v37 = v14;
    v38 = 2112;
    v39 = v7;
    v40 = 2112;
    v41 = v8;
    v42 = 2112;
    v43 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Authenticating iTunes account with username %@, altDSID: %@, pet: %@", buf, 0x2Au);

  }
  v29 = (void *)v8;

  objc_autoreleasePoolPop(v11);
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = v12;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "length");
    HMFBooleanToString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v18;
    v38 = 2112;
    v39 = v19;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Password: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v20 = objc_alloc_init(MEMORY[0x1E0CFD9C8]);
  objc_msgSend(v20, "setAuthenticationType:", 1);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFD9D8]), "initWithAuthenticationResults:options:", v6, v20);
  objc_msgSend(v21, "performAuthentication");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke;
  v33[3] = &unk_1E89C1558;
  v33[4] = v16;
  v24 = v7;
  v34 = v24;
  v25 = v28;
  v35 = v25;
  objc_msgSend(v22, "addErrorBlock:", v33);
  v30[0] = v23;
  v30[1] = 3221225472;
  v30[2] = __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_25;
  v30[3] = &unk_1E89B5088;
  v30[4] = v16;
  v31 = v24;
  v32 = v25;
  v26 = v25;
  v27 = v24;
  objc_msgSend(v22, "addSuccessBlock:", v30);

}

- (void)_authenticateAccount:(id)a3 targetedAccountType:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  HMDRemoteLoginReceiverAuthentication *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13[2];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Authenticating the account with context: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_initWeak((id *)buf, v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__HMDRemoteLoginReceiverAuthentication__authenticateAccount_targetedAccountType___block_invoke;
  v12[3] = &unk_1E89B50B0;
  objc_copyWeak(v13, (id *)buf);
  v13[1] = (id)a4;
  objc_msgSend(v7, "authenticateWithContext:completion:", v6, v12);
  objc_destroyWeak(v13);
  objc_destroyWeak((id *)buf);

}

- (void)_handleAuthenticationResults:(id)a3 error:(id)a4 targetedAccountType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  HMDRemoteLoginReceiverAuthentication *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _BYTE location[12];
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_initWeak((id *)location, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __95__HMDRemoteLoginReceiverAuthentication__handleAuthenticationResults_error_targetedAccountType___block_invoke;
    v14[3] = &unk_1E89B50D8;
    objc_copyWeak(&v15, (id *)location);
    -[HMDRemoteLoginReceiverAuthentication _authenticateForAccountType:usingAuthenticationResults:completionHandler:](self, "_authenticateForAccountType:usingAuthenticationResults:completionHandler:", a5, v8, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v13;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Authentication results is not valid, resulted in error %@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDRemoteLoginReceiverAuthentication _completedAuthenticationRequest:loggedInAccount:](v11, "_completedAuthenticationRequest:loggedInAccount:", v9, 0);
  }

}

- (void)_completedAuthenticationRequest:(id)a3 loggedInAccount:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  HMDRemoteLoginAuthenticationResponse *v10;
  void *v11;
  HMDRemoteLoginAuthenticationResponse *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[HMDRemoteLoginReceiverAuthentication delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EFB48050))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = [HMDRemoteLoginAuthenticationResponse alloc];
    -[HMDRemoteLoginAuthentication sessionID](self, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMRemoteLoginMessage initWithSessionID:](v10, "initWithSessionID:", v11);

    if (v6)
      -[HMDRemoteLoginAuthenticationResponse setLoggedInAccount:](v12, "setLoggedInAccount:", v6);
    -[HMRemoteLoginMessage setError:](v12, "setError:", v13);
    objc_msgSend(v9, "didCompleteAuthentication:response:", self, v12);

  }
}

- (HMDRemoteLoginReceiverAuthenticationDelegate)delegate
{
  return (HMDRemoteLoginReceiverAuthenticationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __95__HMDRemoteLoginReceiverAuthentication__handleAuthenticationResults_error_targetedAccountType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__HMDRemoteLoginReceiverAuthentication__handleAuthenticationResults_error_targetedAccountType___block_invoke_2;
    block[3] = &unk_1E89C20C8;
    block[4] = v8;
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __95__HMDRemoteLoginReceiverAuthentication__handleAuthenticationResults_error_targetedAccountType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedAuthenticationRequest:loggedInAccount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __81__HMDRemoteLoginReceiverAuthentication__authenticateAccount_targetedAccountType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleAuthenticationResults:error:targetedAccountType:", v7, v6, *(_QWORD *)(a1 + 40));

}

void __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v11 = 138543874;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@iTunes authentication failed. (%@). Error: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

}

void __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_2;
  v6[3] = &unk_1E89C0448;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@iTunes successfully authenticated. Making active. (%@).", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 48), "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_setActive:forMediaType:", 1, 0);

  objc_msgSend(*(id *)(a1 + 48), "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("wasOtherAccount"));

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_saveAccount:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_27;
  v16[3] = &unk_1E89C1B48;
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v11, "addSuccessBlock:", v16);
  v13[0] = v12;
  v13[1] = 3221225472;
  v13[2] = __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_29;
  v13[3] = &unk_1E89C1558;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v11, "addErrorBlock:", v13);

}

void __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_27(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForObjectValue:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v5;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Succeeded in save of account: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

}

void __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringForObjectValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to save account %@: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v12, 0);

}

void __78__HMDRemoteLoginReceiverAuthentication__saveRemoteVerifiedAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 40);
      v17 = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Save of verified account successful; %@.",
        (uint8_t *)&v17,
        0x16u);

    }
  }
  else
  {
    v12 = objc_msgSend(v5, "code");
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (v12 == 5)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(a1 + 40);
        v17 = 138543618;
        v18 = v14;
        v19 = 2112;
        v20 = v15;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Account already existed %@.", (uint8_t *)&v17, 0x16u);

      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v16;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Save of account failed. This will stop further attempts as this should not fail. Error: %@", (uint8_t *)&v17, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_121842 != -1)
    dispatch_once(&logCategory__hmf_once_t0_121842, &__block_literal_global_121843);
  return (id)logCategory__hmf_once_v1_121844;
}

void __51__HMDRemoteLoginReceiverAuthentication_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_121844;
  logCategory__hmf_once_v1_121844 = v0;

}

@end
