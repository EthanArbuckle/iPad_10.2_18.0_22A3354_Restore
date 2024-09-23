@implementation HFPinCodeManager

- (HFPinCodeManager)initWithHome:(id)a3
{
  id v5;
  HFPinCodeManager *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSHashTable *observers;
  uint64_t v11;
  HMAccessCodeManager *accessCodeManager;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFPinCodeManager;
  v6 = -[HFPinCodeManager init](&v14, sel_init);
  if (v6)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addHomeObserver:", v6);

    +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v6);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v9;

    v6->_fetchInProgress = 0;
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(v5, "createAccessCodeManager");
    v11 = objc_claimAutoreleasedReturnValue();
    accessCodeManager = v6->_accessCodeManager;
    v6->_accessCodeManager = (HMAccessCodeManager *)v11;

    -[HMAccessCodeManager addObserver:](v6->_accessCodeManager, "addObserver:", v6);
    -[HFPinCodeManager _kickoff](v6, "_kickoff");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[HMAccessCodeManager removeObserver:](self->_accessCodeManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)HFPinCodeManager;
  -[HFPinCodeManager dealloc](&v3, sel_dealloc);
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "supportsAccessCodes"))
  {
    HFLogForCategory(0x32uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Re-fetching access code constraints because accessory was added %@", (uint8_t *)&v8, 0xCu);
    }

    v7 = -[HFPinCodeManager _fetchAccessoryConstraints](self, "_fetchAccessoryConstraints");
  }

}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "supportsAccessCodes"))
  {
    HFLogForCategory(0x32uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Re-fetching access code constraints because accessory was removed %@", (uint8_t *)&v8, 0xCu);
    }

    v7 = -[HFPinCodeManager _fetchAccessoryConstraints](self, "_fetchAccessoryConstraints");
  }

}

- (void)executionEnvironmentRunningStateDidChange:(id)a3
{
  id v4;

  if (!objc_msgSend(a3, "runningState"))
    v4 = -[HFPinCodeManager fetchFromAccessories](self, "fetchFromAccessories");
}

- (id)_fetchCachedAccessoryAccessCodes
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HFPinCodeManager *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HFPinCodeManager setFetchInProgress:](self, "setFetchInProgress:", -[HFPinCodeManager fetchInProgress](self, "fetchInProgress") + 1);
  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  HFLogForCategory(0x32uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Starting to fetch accessory access codes from cache with future: %p", buf, 0xCu);
  }

  -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__HFPinCodeManager__fetchCachedAccessoryAccessCodes__block_invoke;
  v9[3] = &unk_1EA7326D8;
  v6 = v3;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "fetchCachedAccessoryAccessCodesWithCompletion:", v9);

  v7 = v6;
  return v7;
}

void __52__HFPinCodeManager__fetchCachedAccessoryAccessCodes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(0x32uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = &stru_1EA741FF8;
    if (v6)
      v9 = v6;
    v11 = 134218242;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Received response fetching PIN Codes from cache with future: %p %@", (uint8_t *)&v11, 0x16u);
  }

  v10 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v10, "finishWithError:", v6);
  else
    objc_msgSend(v10, "finishWithResult:", v5);
  objc_msgSend(*(id *)(a1 + 40), "setFetchInProgress:", objc_msgSend(*(id *)(a1 + 40), "fetchInProgress") - 1);

}

- (id)_fetchAccessCodesFromAccessories
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  HFPinCodeManager *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HFPinCodeManager setFetchInProgress:](self, "setFetchInProgress:", -[HFPinCodeManager fetchInProgress](self, "fetchInProgress") + 1);
  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  HFLogForCategory(0x32uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Starting to fetch accessory access codes directly from accessories with future: %p", buf, 0xCu);
  }

  -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoriesSupportingAccessCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__HFPinCodeManager__fetchAccessCodesFromAccessories__block_invoke;
  v11[3] = &unk_1EA7326D8;
  v8 = v3;
  v12 = v8;
  v13 = self;
  objc_msgSend(v5, "fetchAccessCodesFromAccessories:completion:", v7, v11);

  v9 = v8;
  return v9;
}

void __52__HFPinCodeManager__fetchAccessCodesFromAccessories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(0x32uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = &stru_1EA741FF8;
    if (v6)
      v9 = v6;
    v11 = 134218242;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Received response fetching PIN Codes directly from accessories with future: %p %@", (uint8_t *)&v11, 0x16u);
  }

  v10 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v10, "finishWithError:", v6);
  else
    objc_msgSend(v10, "finishWithResult:", v5);
  objc_msgSend(*(id *)(a1 + 40), "setFetchInProgress:", objc_msgSend(*(id *)(a1 + 40), "fetchInProgress") - 1);

}

- (id)_buildDataStoreWithAccessoryAccessCodeFetch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[2];
  uint8_t buf[4];
  HFPinCodeManager *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFPinCodeManager setFetchInProgress:](self, "setFetchInProgress:", -[HFPinCodeManager fetchInProgress](self, "fetchInProgress") + 1);
  HFLogForCategory(0x32uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = self;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "PIN Code Manager %@, Access Code Manager %@ Starting to build data store", buf, 0x16u);

  }
  v7 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_initWeak((id *)buf, self);
  -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__HFPinCodeManager__buildDataStoreWithAccessoryAccessCodeFetch___block_invoke;
  v21[3] = &unk_1EA736968;
  objc_copyWeak(&v23, (id *)buf);
  v10 = v7;
  v22 = v10;
  objc_msgSend(v8, "fetchHomeAccessCodesWithCompletion:", v21);

  v11 = (void *)MEMORY[0x1E0D519C0];
  v24[0] = v10;
  v24[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "combineAllFutures:ignoringErrors:scheduler:", v12, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __64__HFPinCodeManager__buildDataStoreWithAccessoryAccessCodeFetch___block_invoke_55;
  v20[3] = &unk_1EA72ADB0;
  v20[4] = self;
  objc_msgSend(v14, "flatMap:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __64__HFPinCodeManager__buildDataStoreWithAccessoryAccessCodeFetch___block_invoke_58;
  v18[3] = &unk_1EA736990;
  objc_copyWeak(&v19, (id *)buf);
  objc_msgSend(v15, "addSuccessBlock:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

  return v16;
}

void __64__HFPinCodeManager__buildDataStoreWithAccessoryAccessCodeFetch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  HFPinCodeDataStore *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    HFLogForCategory(0x32uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = (uint64_t)v6;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Received an error fetching PIN Codes from iCloud: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    v9 = objc_alloc_init(HFPinCodeDataStore);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(WeakRetained, "_addNewHomeAccessCode:toStore:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14++), v9, (_QWORD)v20);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      }
      while (v12);
    }

    HFLogForCategory(0x32uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[HFPinCodeDataStore userPINCodes](v9, "userPINCodes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      -[HFPinCodeDataStore guestPINCodes](v9, "guestPINCodes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      *(_DWORD *)buf = 134218498;
      v25 = v17;
      v26 = 2048;
      v27 = v19;
      v28 = 2112;
      v29 = &stru_1EA741FF8;
      _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Fetched %lu user PIN codes and %lu guest PIN codes from iCloud. %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v9);

  }
}

id __64__HFPinCodeManager__buildDataStoreWithAccessoryAccessCodeFetch___block_invoke_55(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HFPinCode *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  void *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v37 = a1;
  v57 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_opt_class();
  v38 = v2;
  objc_msgSend(v2, "objectAtIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v8;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v48;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v48 != v40)
          objc_enumerationMutation(obj);
        v42 = v9;
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v9);
        HFLogForCategory(0x32uLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "accessoryAccessCodes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");
          objc_msgSend(v10, "accessory");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v53 = v13;
          v54 = 2112;
          v55 = v14;
          _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Fetched %lu PIN codes from accessory %@.", buf, 0x16u);

        }
        objc_msgSend(v10, "error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          HFLogForCategory(0x32uLL);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "accessory");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "error");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v53 = (uint64_t)v33;
            v54 = 2112;
            v55 = v34;
            _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Received an error fetching PIN Codes from Accessory: %@ - %@", buf, 0x16u);

          }
        }
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        objc_msgSend(v10, "accessoryAccessCodes", v37);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v44;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v44 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v21);
              objc_msgSend(v22, "accessCodeValue");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "stringValue");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v5, "guestPINCodes");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKey:", v24);
              v26 = (HFPinCode *)objc_claimAutoreleasedReturnValue();

              if (v26)
                goto LABEL_26;
              objc_msgSend(v5, "userPINCodes");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectForKey:", v24);
              v26 = (HFPinCode *)objc_claimAutoreleasedReturnValue();

              if (v26
                || (objc_msgSend(v5, "removedUserPINCodes"),
                    v28 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v28, "objectForKey:", v24),
                    v26 = (HFPinCode *)objc_claimAutoreleasedReturnValue(),
                    v28,
                    v26))
              {
LABEL_26:
                -[HFPinCode addAccessoryAccessCode:](v26, "addAccessoryAccessCode:", v22);
              }
              else
              {
                v26 = -[HFPinCode initWithAccessoryAccessCode:]([HFPinCode alloc], "initWithAccessoryAccessCode:", v22);
                if (objc_msgSend(v24, "length"))
                {
                  objc_msgSend(v5, "guestPINCodes");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "accessCodeValue");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "stringValue");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "setValue:forKey:", v26, v31);

                }
                else
                {
                  objc_msgSend(v5, "otherEcosystemGuestPINCodes");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HFPinCode unknownMatterGuestUniqueID](v26, "unknownMatterGuestUniqueID");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "setValue:forKey:", v26, v30);
                }

              }
              ++v21;
            }
            while (v19 != v21);
            v32 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            v19 = v32;
          }
          while (v32);
        }

        v9 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v41);
  }

  objc_msgSend(*(id *)(v37 + 32), "setFetchInProgress:", objc_msgSend(*(id *)(v37 + 32), "fetchInProgress") - 1);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

void __64__HFPinCodeManager__buildDataStoreWithAccessoryAccessCodeFetch___block_invoke_58(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setDataStore:", v3);

  objc_msgSend(WeakRetained, "_reloadObservers");
}

- (id)_fetchAccessoryConstraints
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoriesSupportingAccessCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x32uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Starting to fetch constraints from accessories: %lu", buf, 0xCu);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFPinCodeManager setConstraintsFuture:](self, "setConstraintsFuture:", v6);
  objc_initWeak((id *)buf, self);
  -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__HFPinCodeManager__fetchAccessoryConstraints__block_invoke;
  v10[3] = &unk_1EA736968;
  objc_copyWeak(&v12, (id *)buf);
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "fetchAccessCodeConstraintsFromAccessories:completion:", v4, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

  return v8;
}

void __46__HFPinCodeManager__fetchAccessoryConstraints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "na_map:", &__block_literal_global_129);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setConstraints:", v8);
  HFLogForCategory(0x32uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218754;
    v14 = objc_msgSend(v8, "count");
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Fetched %lu constraints from accessories. Response: %@ Error: %@ constraints: %@", (uint8_t *)&v13, 0x2Au);
  }

  v10 = objc_msgSend(v8, "count");
  v11 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v11, "finishWithResult:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 73);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithError:", v12);

  }
}

uint64_t __46__HFPinCodeManager__fetchAccessoryConstraints__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "constraints");
}

- (void)_kickoff
{
  id v3;
  id v4;
  id v5;

  v3 = -[HFPinCodeManager fetchFromAccessoryCache](self, "fetchFromAccessoryCache");
  v4 = -[HFPinCodeManager fetchFromAccessories](self, "fetchFromAccessories");
  v5 = -[HFPinCodeManager _fetchAccessoryConstraints](self, "_fetchAccessoryConstraints");
}

- (void)_addNewHomeAccessCode:(id)a3 toStore:(id)a4
{
  id v6;
  id v7;
  HFPinCode *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  uint8_t v43[16];
  uint8_t v44[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = -[HFPinCode initWithHomeAccessCode:]([HFPinCode alloc], "initWithHomeAccessCode:", v6);
  objc_msgSend(v6, "userInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v42 = v9;
    objc_msgSend(v7, "userPINCodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPinCode pinCodeValue](v8, "pinCodeValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      HFLogForCategory(0x32uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Adding a new User Pin Code, we seem to already have one with the same value", buf, 2u);
      }

    }
    objc_msgSend(v7, "userPINCodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPinCode pinCodeValue](v8, "pinCodeValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v8, v16);

    -[HFPinCodeManager home](self, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentUser");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInformation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "user");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v19, "isEqual:", v22);

    v9 = v42;
    if (v23)
      objc_msgSend(v7, "setCurrentUserPinCode:", v8);
  }
  else
  {
    objc_msgSend(v9, "removedUserInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v7, "userPINCodes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFPinCode pinCodeValue](v8, "pinCodeValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "valueForKey:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        HFLogForCategory(0x32uLL);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v44 = 0;
          _os_log_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_DEFAULT, "Adding a removed User Pin Code, we seem to already have one with the same value", v44, 2u);
        }

      }
      objc_msgSend(v7, "removedUserPINCodes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFPinCode pinCodeValue](v8, "pinCodeValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setValue:forKey:", v8, v30);

    }
    else
    {
      objc_msgSend(v7, "guestPINCodes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFPinCode pinCodeValue](v8, "pinCodeValue");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "valueForKey:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
        goto LABEL_18;
      HFLogForCategory(0x32uLL);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_1DD34E000, v34, OS_LOG_TYPE_DEFAULT, "Adding a new Guest Pin Code, we seem to already have one with the same value", v43, 2u);
      }

      objc_msgSend(v33, "userLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "simpleLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFPinCode userLabel](v8, "userLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "simpleLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v36, "isEqualToString:", v38);

      if ((v39 & 1) == 0)
      {
LABEL_18:
        objc_msgSend(v7, "guestPINCodes");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFPinCode pinCodeValue](v8, "pinCodeValue");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setValue:forKey:", v8, v41);

      }
    }
  }

}

- (void)setFetchInProgress:(int64_t)a3
{
  BOOL v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = 1;
  else
    v4 = self->_fetchInProgress <= 0;
  v5 = !v4;
  self->_fetchInProgress = a3;
  if (a3 < 0)
  {
    v6 = objc_opt_class();
    NSLog(CFSTR("%@: fetchInProgress should not go below zero, that indicates an unbalanced operation."), v6);
    if (!v5)
      return;
  }
  else if (!v5)
  {
    return;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HFPinCodeManager observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "pinCodeManagerFetchDidComplete:", self);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)isAccessoryFetchInProgress
{
  return -[HFPinCodeManager fetchInProgress](self, "fetchInProgress") > 0;
}

- (id)fetchFromAccessories
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HFPinCodeManager inProgressFetchFromAccessories](self, "inProgressFetchFromAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    HFLogForCategory(0x32uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[HFPinCodeManager inProgressFetchFromAccessories](self, "inProgressFetchFromAccessories");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v15 = v5;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Skipping fetch from accessories because a fetch is already in progress %p", buf, 0xCu);

    }
    -[HFPinCodeManager inProgressFetchFromAccessories](self, "inProgressFetchFromAccessories");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFPinCodeManager _fetchAccessCodesFromAccessories](self, "_fetchAccessCodesFromAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPinCodeManager _buildDataStoreWithAccessoryAccessCodeFetch:](self, "_buildDataStoreWithAccessoryAccessCodeFetch:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPinCodeManager setInProgressFetchFromAccessories:](self, "setInProgressFetchFromAccessories:", v8);

    objc_initWeak((id *)buf, self);
    -[HFPinCodeManager inProgressFetchFromAccessories](self, "inProgressFetchFromAccessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __40__HFPinCodeManager_fetchFromAccessories__block_invoke;
    v12[3] = &unk_1EA7369F8;
    objc_copyWeak(&v13, (id *)buf);
    v10 = (id)objc_msgSend(v9, "addCompletionBlock:", v12);

    -[HFPinCodeManager inProgressFetchFromAccessories](self, "inProgressFetchFromAccessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
    return v11;
  }
}

void __40__HFPinCodeManager_fetchFromAccessories__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setInProgressFetchFromAccessories:", 0);

}

- (id)fetchFromAccessoryCache
{
  void *v3;
  void *v4;

  -[HFPinCodeManager _fetchCachedAccessoryAccessCodes](self, "_fetchCachedAccessoryAccessCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCodeManager _buildDataStoreWithAccessoryAccessCodeFetch:](self, "_buildDataStoreWithAccessoryAccessCodeFetch:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)refreshDataStore
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  -[HFPinCodeManager fetchFromAccessoryCache](self, "fetchFromAccessoryCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCodeManager constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    v6 = -[HFPinCodeManager _fetchAccessoryConstraints](self, "_fetchAccessoryConstraints");
  v7 = -[HFPinCodeManager fetchFromAccessories](self, "fetchFromAccessories");
  return v3;
}

- (id)userPinCodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HFPinCodeManager dataStore](self, "dataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userPINCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)removedUserPINCodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HFPinCodeManager dataStore](self, "dataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedUserPINCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)guestPinCodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HFPinCodeManager dataStore](self, "dataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "guestPINCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)guestUserInformation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HFPinCodeManager dataStore](self, "dataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guestPINCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_68_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __40__HFPinCodeManager_guestUserInformation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userLabel");
}

- (id)otherEcosystemGuestPinCodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HFPinCodeManager dataStore](self, "dataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "otherEcosystemGuestPINCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)currentUserPinCode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HFPinCodeManager dataStore](self, "dataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUserPinCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pinCodeForCodeValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = a3;
  -[HFPinCodeManager dataStore](self, "dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pinCodeForCodeValue:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)addGuestPinCode:(id)a3 withLabel:(id)a4 onAccessories:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  HFLogForCategory(0x32uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v29 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Adding guest pin code on %lu accessories", buf, 0xCu);
  }

  if (objc_msgSend(v8, "length"))
  {
    objc_initWeak((id *)buf, self);
    v12 = (void *)MEMORY[0x1E0D519C0];
    v13 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke;
    v23[3] = &unk_1EA736430;
    objc_copyWeak(&v27, (id *)buf);
    v24 = v9;
    v14 = v8;
    v25 = v14;
    v26 = v10;
    objc_msgSend(v12, "futureWithBlock:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_4;
    v21[3] = &unk_1EA732620;
    v21[4] = self;
    v22 = v14;
    objc_msgSend(v15, "flatMap:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    HFLogForCategory(0x32uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_ERROR, "Pin Code Value should not be empty", buf, 2u);
    }

    v18 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithError:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

void __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  HFPinCode *v11;
  void *v12;
  HFPinCode *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  HFPinCode *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[8];
  _QWORD v50[4];
  HFPinCode *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guestPINCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_2;
  v50[3] = &unk_1EA736A60;
  v51 = (HFPinCode *)*(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "na_any:", v50);

  if (v8)
  {
    HFLogForCategory(0x32uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "There is already a guest PIN Code with this label. Aborting", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 76);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v10);

    v11 = v51;
  }
  else
  {
    v35 = v3;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA190]), "initWithSimpleLabel:", *(_QWORD *)(a1 + 32));
    v13 = -[HFPinCode initWithLabel:accessCodeValue:accessoryAccessCodes:]([HFPinCode alloc], "initWithLabel:accessCodeValue:accessoryAccessCodes:", v12, *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(WeakRetained, "dataStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "guestPINCodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v13;
    objc_msgSend(v15, "setValue:forKey:", v13, *(_QWORD *)(a1 + 40));

    objc_msgSend(WeakRetained, "_reloadObservers");
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA1A0]), "initWithStringValue:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v18 = *(id *)(a1 + 48);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v46;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v46 != v21)
            objc_enumerationMutation(v18);
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA150]), "initWithAccessCodeValue:accessory:", v16, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v22));
          objc_msgSend(v17, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v20);
    }

    v24 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    objc_msgSend(WeakRetained, "accessCodeManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_74;
    v42[3] = &unk_1EA726360;
    v43 = v12;
    v44 = v24;
    v27 = v24;
    v28 = v12;
    objc_msgSend(v25, "setUserInformation:forHomeAccessCodeWithValue:completion:", v28, v16, v42);

    v40[0] = v26;
    v40[1] = 3221225472;
    v40[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_76;
    v40[3] = &unk_1EA732690;
    v40[4] = WeakRetained;
    v41 = v17;
    v29 = v17;
    objc_msgSend(v27, "flatMap:", v40);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v26;
    v38[1] = 3221225472;
    v38[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_2_78;
    v38[3] = &unk_1EA726338;
    v3 = v35;
    v31 = v35;
    v39 = v31;
    objc_msgSend(v30, "addSuccessBlock:", v38);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v26;
    v36[1] = 3221225472;
    v36[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_3;
    v36[3] = &unk_1EA726968;
    v37 = v31;
    v33 = (id)objc_msgSend(v32, "addFailureBlock:", v36);

    v11 = v34;
  }

}

uint64_t __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "userLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x32uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Received response to setting iCloud User Info for new guest %@: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v3)
    objc_msgSend(v6, "finishWithError:", v3);
  else
    objc_msgSend(v6, "finishWithNoResult");

}

uint64_t __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_76(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitModificationRequests:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_2_78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

uint64_t __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

id __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinCodeForCodeValue:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)setUserPinCode:(id)a3 forUser:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HFPinCode *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0x32uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Setting user pin code for user %@", buf, 0xCu);
  }

  if (objc_msgSend(v6, "length"))
  {
    -[HFPinCodeManager dataStore](self, "dataStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userPINCodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __43__HFPinCodeManager_setUserPinCode_forUser___block_invoke;
    v30[3] = &unk_1EA736A88;
    v11 = v7;
    v31 = v11;
    objc_msgSend(v10, "na_firstKeyPassingTest:", v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HFPinCodeManager dataStore](self, "dataStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userPINCodes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v12);

    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA190]), "initWithUser:", v11);
    v16 = -[HFPinCode initWithLabel:accessCodeValue:accessoryAccessCodes:]([HFPinCode alloc], "initWithLabel:accessCodeValue:accessoryAccessCodes:", v15, v6, 0);
    -[HFPinCodeManager dataStore](self, "dataStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "userPINCodes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValue:forKey:", v16, v6);

    v19 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPinCodeManager _modificationCompletionHandlerForFuture:](self, "_modificationCompletionHandlerForFuture:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAccessCode:forUserWithUUID:completion:", v6, v21, v22);

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __43__HFPinCodeManager_setUserPinCode_forUser___block_invoke_2;
    v28[3] = &unk_1EA732620;
    v28[4] = self;
    v29 = v6;
    objc_msgSend(v19, "flatMap:", v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v31;
  }
  else
  {
    HFLogForCategory(0x32uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_ERROR, "Pin Code Value should not be empty", buf, 2u);
    }

    v26 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "futureWithError:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

uint64_t __43__HFPinCodeManager_setUserPinCode_forUser___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a3, "userLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  return v8;
}

id __43__HFPinCodeManager_setUserPinCode_forUser___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinCodeForCodeValue:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deleteGuestPinCodeWithItem:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  uint8_t buf[16];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPinCodeManager.m"), 693, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pinCodeItem"));

  }
  HFLogForCategory(0x32uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Deleting guest pin code.", buf, 2u);
  }

  -[HFPinCodeManager dataStore](self, "dataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guestPinCodeFromItem:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isUnknownGuestFromMatter"))
    -[HFPinCodeManager _deleteUnknownGuestFromMatterPinCode:](self, "_deleteUnknownGuestFromMatterPinCode:", v8);
  else
    -[HFPinCodeManager _deleteGuestPinCode:](self, "_deleteGuestPinCode:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_deleteUnknownGuestFromMatterPinCode:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPinCodeManager.m"), 710, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pinCode"));

  }
  objc_msgSend(v5, "unknownMatterGuestUniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HFPinCodeManager dataStore](self, "dataStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "otherEcosystemGuestPINCodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unknownMatterGuestUniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

    -[HFPinCodeManager _reloadObservers](self, "_reloadObservers");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v5, "accessoryAccessCodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA178]), "initWithAccessoryAccessCode:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    -[HFPinCodeManager _submitModificationRequests:](self, "_submitModificationRequests:", v10);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HFLogForCategory(0x32uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[HFPinCodeManager _deleteUnknownGuestFromMatterPinCode:]";
      v30 = 2112;
      v31 = v5;
      _os_log_error_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_ERROR, "(%s) Expected an unknown guest from Matter PIN Code, but got this: %@", buf, 0x16u);
    }

    v19 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "futureWithError:", v10);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v17;

  return v20;
}

- (id)_deleteGuestPinCode:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPinCodeManager.m"), 735, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pinCode"));

  }
  objc_msgSend(v5, "pinCodeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[HFPinCodeManager dataStore](self, "dataStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "guestPINCodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pinCodeValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

    -[HFPinCodeManager _reloadObservers](self, "_reloadObservers");
    v11 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pinCodeValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPinCodeManager _modificationCompletionHandlerForFuture:](self, "_modificationCompletionHandlerForFuture:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeSimpleLabelAccessCode:completion:", v13, v14);

  }
  else
  {
    HFLogForCategory(0x32uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Attempted to delete a guest PIN Code that has no value: %@", buf, 0xCu);
    }

    v16 = -[HFPinCodeManager fetchFromAccessoryCache](self, "fetchFromAccessoryCache");
    v17 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithError:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)deleteUserPinCodeWithUser:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x32uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Deleting user PIN Code for user: %@", buf, 0xCu);

  }
  -[HFPinCodeManager dataStore](self, "dataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userPINCodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __46__HFPinCodeManager_deleteUserPinCodeWithUser___block_invoke;
  v18[3] = &unk_1EA736A88;
  v19 = v4;
  v9 = v4;
  objc_msgSend(v8, "na_firstKeyPassingTest:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HFPinCodeManager dataStore](self, "dataStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userPINCodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v10);

  }
  v13 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCodeManager _modificationCompletionHandlerForFuture:](self, "_modificationCompletionHandlerForFuture:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessCode:forUserWithUUID:completion:", 0, v15, v16);

  return v13;
}

uint64_t __46__HFPinCodeManager_deleteUserPinCodeWithUser___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a3, "userLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  return v8;
}

- (id)updateGuestPinCodeWithItem:(id)a3 withLabel:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id buf[2];

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPinCodeManager.m"), 788, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("label"));

  }
  HFLogForCategory(0x32uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Updating guest PIN Code with new label", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v10 = (void *)MEMORY[0x1E0D519C0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__HFPinCodeManager_updateGuestPinCodeWithItem_withLabel___block_invoke;
  v16[3] = &unk_1EA736AB0;
  objc_copyWeak(&v19, buf);
  v11 = v7;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v10, "futureWithBlock:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak(buf);

  return v13;
}

void __57__HFPinCodeManager_updateGuestPinCodeWithItem_withLabel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "guestPinCodeFromItem:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CBA1A0]);
  objc_msgSend(v7, "pinCodeValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithStringValue:", v9);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA190]), "initWithSimpleLabel:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setUserLabel:", v11);
  objc_msgSend(WeakRetained, "_reloadObservers");
  objc_msgSend(WeakRetained, "accessCodeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__HFPinCodeManager_updateGuestPinCodeWithItem_withLabel___block_invoke_2;
  v14[3] = &unk_1EA72F608;
  objc_copyWeak(&v16, v4);
  v13 = v3;
  v15 = v13;
  objc_msgSend(v12, "setUserInformation:forHomeAccessCodeWithValue:completion:", v11, v10, v14);

  objc_destroyWeak(&v16);
}

void __57__HFPinCodeManager_updateGuestPinCodeWithItem_withLabel___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x32uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Received response from iCloud for updating guest PIN Code label: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = (id)objc_msgSend(WeakRetained, "fetchFromAccessoryCache");

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

- (id)updatePinCodeWithItem:(id)a3 withCodeValue:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPinCodeManager.m"), 833, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newCodeValue"));

  }
  HFLogForCategory(0x32uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Updating pin code with new code value", buf, 2u);
  }

  objc_msgSend(v7, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[HFPinCodeManager setUserPinCode:forUser:](self, "setUserPinCode:forUser:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFPinCodeManager dataStore](self, "dataStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pinCodeFromItem:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "userLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPinCodeManager _updateGuestPinCodeWithItem:withCodeValue:withUserInfo:](self, "_updateGuestPinCodeWithItem:withCodeValue:withUserInfo:", v7, v8, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)updateGuestPinCodeWithItem:(id)a3 withCodeValue:(id)a4 withLabel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  id v25;
  void *v26;
  void *v27;
  int v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HFPinCodeManager dataStore](self, "dataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "guestPINCodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pinCodeValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[HFPinCodeManager dataStore](self, "dataStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "userPINCodes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pinCodeValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x32uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        v29 = 136315138;
        v30 = "-[HFPinCodeManager updateGuestPinCodeWithItem:withCodeValue:withLabel:]";
        v24 = "(%s) Expected a guest PIN Code, but found a user code instead.";
LABEL_12:
        _os_log_error_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v29, 0xCu);
      }
    }
    else if (v23)
    {
      v29 = 136315138;
      v30 = "-[HFPinCodeManager updateGuestPinCodeWithItem:withCodeValue:withLabel:]";
      v24 = "(%s) Could not find PIN Code in data store.";
      goto LABEL_12;
    }

    v25 = -[HFPinCodeManager fetchFromAccessoryCache](self, "fetchFromAccessoryCache");
    v26 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "futureWithError:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  HFLogForCategory(0x32uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Updating guest pin code with new code value and label", (uint8_t *)&v29, 2u);
  }

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA190]), "initWithSimpleLabel:", v10);
  -[HFPinCodeManager _updateGuestPinCodeWithItem:withCodeValue:withUserInfo:](self, "_updateGuestPinCodeWithItem:withCodeValue:withUserInfo:", v8, v9, v16);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v27 = (void *)v17;

  return v27;
}

- (id)_updateGuestPinCodeWithItem:(id)a3 withCodeValue:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HFPinCode *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id buf[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HFPinCodeManager dataStore](self, "dataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pinCodeFromItem:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA1A0]), "initWithStringValue:", v9);
  v14 = -[HFPinCode initWithLabel:accessCodeValue:accessoryAccessCodes:]([HFPinCode alloc], "initWithLabel:accessCodeValue:accessoryAccessCodes:", v10, v9, 0);
  -[HFPinCodeManager dataStore](self, "dataStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pinCodeValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateWithPinCode:forOldCodeValue:", v14, v16);

  -[HFPinCodeManager _reloadObservers](self, "_reloadObservers");
  HFLogForCategory(0x32uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "Removing current home access code ahead of replacing it with new value", (uint8_t *)buf, 2u);
  }

  v18 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pinCodeValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCodeManager _modificationCompletionHandlerForFuture:](self, "_modificationCompletionHandlerForFuture:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeSimpleLabelAccessCode:completion:", v20, v21);

  objc_initWeak(buf, self);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke;
  v28[3] = &unk_1EA736B28;
  objc_copyWeak(&v33, buf);
  v22 = v10;
  v29 = v22;
  v23 = v13;
  v30 = v23;
  v24 = v12;
  v31 = v24;
  v25 = v9;
  v32 = v25;
  objc_msgSend(v18, "flatMap:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v33);
  objc_destroyWeak(buf);

  return v26;
}

id __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke(id *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  id *location;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  v4 = (void *)MEMORY[0x1E0D519C0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_2;
  v32[3] = &unk_1EA736AD8;
  v22 = WeakRetained;
  v32[4] = WeakRetained;
  v33 = a1[4];
  v34 = a1[5];
  location = &v35;
  objc_copyWeak(&v35, a1 + 8);
  objc_msgSend(v4, "futureWithBlock:", v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a1[6], "accessoryAccessCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0CBA150]);
        v12 = a1[5];
        objc_msgSend(v10, "accessory", v20, location);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v11, "initWithAccessCodeValue:accessory:", v12, v13);

        objc_msgSend(v5, "addObject:", v14);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v7);
  }

  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_98;
  v26[3] = &unk_1EA732620;
  v26[4] = v22;
  v16 = v5;
  v27 = v16;
  objc_msgSend(v23, "flatMap:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_2_99;
  v24[3] = &unk_1EA736B00;
  v24[4] = v22;
  v25 = a1[7];
  objc_msgSend(v17, "flatMap:", v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(location);
  return v18;
}

void __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[16];

  v3 = a2;
  HFLogForCategory(0x32uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Add new home access code", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "accessCodeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_97;
  v9[3] = &unk_1EA72F608;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  v8 = v3;
  v10 = v8;
  objc_msgSend(v5, "setUserInformation:forHomeAccessCodeWithValue:completion:", v6, v7, v9);

  objc_destroyWeak(&v11);
}

void __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x32uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Got response from adding home access code: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = (id)objc_msgSend(WeakRetained, "fetchFromAccessoryCache");

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

uint64_t __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitModificationRequests:", *(_QWORD *)(a1 + 40));
}

id __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_2_99(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x32uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "All operations for updating PIN Code have completed: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_reloadObservers");
  objc_msgSend(*(id *)(a1 + 32), "dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pinCodeForCodeValue:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_modificationCompletionHandlerForFuture:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HFPinCodeManager__modificationCompletionHandlerForFuture___block_invoke;
  aBlock[3] = &unk_1EA736968;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

void __60__HFPinCodeManager__modificationCompletionHandlerForFuture___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  unint64_t v29;
  NSObject *v30;
  uint64_t v31;
  unint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *obj;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  void *v54;
  uint8_t v55[128];
  uint8_t buf[4];
  NSObject *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v43 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory(0x32uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v57 = v5;
    v58 = 2112;
    v59 = (uint64_t)v6;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Received response to access code modification requests: %@ %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v6;
  if (v5)
    v9 = 0;
  else
    v9 = v6;
  v42 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v5;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v10)
  {
    v11 = v10;
    v48 = *(_QWORD *)v50;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v50 != v48)
          objc_enumerationMutation(obj);
        v13 = *(NSObject **)(*((_QWORD *)&v49 + 1) + 8 * v12);
        -[NSObject accessoryAccessCode](v13, "accessoryAccessCode");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "accessCodeValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v15;
        }
        else
        {
          -[NSObject accessCodeValue](v13, "accessCodeValue");
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;

        objc_msgSend(WeakRetained, "dataStore");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "pinCodeForCodeValue:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        -[NSObject error](v13, "error");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v23 = WeakRetained;
          -[NSObject error](v13, "error");
          v24 = objc_claimAutoreleasedReturnValue();
          HFLogForCategory(0x32uLL);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject accessory](v13, "accessory");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v57 = v24;
            v58 = 2112;
            v59 = (uint64_t)v26;
            _os_log_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_DEFAULT, "Access Code Modification Response has an error: %@ accessory: %@", buf, 0x16u);

          }
          -[NSObject accessory](v13, "accessory");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "supportsCHIP");

          v29 = -[NSObject operationType](v13, "operationType");
          if (v29 >= 2)
          {
            if (v29 != 2 || -[NSObject code](v24, "code") != 2606)
            {
LABEL_29:
              objc_msgSend(v46, "addObject:", v24);
              objc_setAssociatedObject(v24, "HFAssociatedPinCodeKey", v21, (void *)0x301);
              HFLogForCategory(0x32uLL);
              v33 = objc_claimAutoreleasedReturnValue();
              WeakRetained = v23;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v57 = v21;
                v58 = 2112;
                v59 = (uint64_t)v24;
                _os_log_impl(&dword_1DD34E000, v33, OS_LOG_TYPE_DEFAULT, "Setting PinCode (%@) on error (%@)", buf, 0x16u);
              }

LABEL_32:
              goto LABEL_33;
            }
          }
          else if ((v28 & 1) != 0 || -[NSObject code](v24, "code") != 2602)
          {
            goto LABEL_29;
          }
          HFLogForCategory(0x32uLL);
          v30 = objc_claimAutoreleasedReturnValue();
          WeakRetained = v23;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = -[NSObject operationType](v13, "operationType");
            *(_DWORD *)buf = 138412546;
            v57 = v24;
            v58 = 2048;
            v59 = v31;
            _os_log_impl(&dword_1DD34E000, v30, OS_LOG_TYPE_DEFAULT, "Ignoring Access Code Modification Response error: %@ for operation type %ld", buf, 0x16u);
          }

        }
        if (v21)
        {
          objc_msgSend(v45, "addObject:", v21);
          v32 = -[NSObject operationType](v13, "operationType");
          if (v32 >= 2)
          {
            if (v32 == 2)
              -[NSObject removeAccessoryAccessCode:](v21, "removeAccessoryAccessCode:", v14);
          }
          else
          {
            -[NSObject addAccessoryAccessCode:](v21, "addAccessoryAccessCode:", v14);
          }
        }
        else if (-[NSObject operationType](v13, "operationType") != 2)
        {
          HFLogForCategory(0x32uLL);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v13;
            _os_log_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_DEFAULT, "Failed to find existing PIN Code while processing update response %@", buf, 0xCu);
          }
          goto LABEL_32;
        }
LABEL_33:

        ++v12;
      }
      while (v11 != v12);
      v34 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      v11 = v34;
    }
    while (v34);
  }

  objc_msgSend(WeakRetained, "_reloadObservers");
  if (objc_msgSend(v46, "count"))
  {
    v35 = -[NSObject count](obj, "count");
    if (v35 == objc_msgSend(v46, "count"))
    {
      objc_msgSend(v46, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v44;
      v38 = v45;
      v39 = v42;
    }
    else
    {
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2F70];
      v54 = v46;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("HFErrorDomain"), 80, v39);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = v44;
      v38 = v45;
    }

    if (v36)
      goto LABEL_48;
  }
  else
  {
    v37 = v44;
    v38 = v45;
    v36 = v42;
    if (v42)
    {
LABEL_48:
      v41 = (id)objc_msgSend(WeakRetained, "fetchFromAccessoryCache");
      objc_msgSend(*(id *)(v43 + 32), "finishWithError:", v36);
      goto LABEL_49;
    }
  }
  objc_msgSend(*(id *)(v43 + 32), "finishWithResult:", v38);
LABEL_49:

}

- (id)_submitModificationRequests:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x32uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Called _submitModificationRequests with %lu requests", (uint8_t *)&v10, 0xCu);
  }

  if (objc_msgSend(v4, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPinCodeManager _modificationCompletionHandlerForFuture:](self, "_modificationCompletionHandlerForFuture:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submitAccessCodeModificationRequests:completion:", v4, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)setPinCodeWithItem:(id)a3 enabled:(BOOL)a4 onAccessories:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id buf;
  __int16 v22;
  id v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  HFLogForCategory(0x32uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = v6;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Setting pin code enabled (%{BOOL}d) on accessories: %@", (uint8_t *)&buf, 0x12u);
  }

  objc_initWeak(&buf, self);
  v11 = (void *)MEMORY[0x1E0D519C0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__HFPinCodeManager_setPinCodeWithItem_enabled_onAccessories___block_invoke;
  v16[3] = &unk_1EA736BA0;
  objc_copyWeak(&v19, &buf);
  v12 = v8;
  v17 = v12;
  v20 = v6;
  v13 = v9;
  v18 = v13;
  objc_msgSend(v11, "futureWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&buf);

  return v14;
}

void __61__HFPinCodeManager_setPinCodeWithItem_enabled_onAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id obj;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[8];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pinCodeFromItem:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_BYTE *)(a1 + 56))
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v35 = a1;
      obj = *(id *)(a1 + 40);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v43 != v23)
              objc_enumerationMutation(obj);
            v25 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v6, "accessoryAccessCodes");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __61__HFPinCodeManager_setPinCodeWithItem_enabled_onAccessories___block_invoke_101;
            v41[3] = &unk_1EA736B50;
            v41[4] = v25;
            objc_msgSend(v26, "na_firstObjectPassingTest:", v41);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA178]), "initWithAccessoryAccessCode:", v27);
            objc_msgSend(v7, "addObject:", v28);

          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        }
        while (v22);
      }

      v19 = v35;
      objc_msgSend(v6, "removeAccessories:", *(_QWORD *)(v35 + 40));
      goto LABEL_23;
    }
    objc_msgSend(v6, "pinCodeValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0CBA1A0]);
      objc_msgSend(v6, "pinCodeValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithStringValue:", v11);

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v34 = a1;
      v13 = *(id *)(a1 + 40);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v47 != v16)
              objc_enumerationMutation(v13);
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA150]), "initWithAccessCodeValue:accessory:", v12, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
            objc_msgSend(v7, "addObject:", v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        }
        while (v15);
      }

      v19 = v34;
      objc_msgSend(v6, "addAccessories:", *(_QWORD *)(v34 + 40));

LABEL_23:
      objc_msgSend(WeakRetained, "_submitModificationRequests:", v7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __61__HFPinCodeManager_setPinCodeWithItem_enabled_onAccessories___block_invoke_2;
      v37[3] = &unk_1EA736B78;
      v37[4] = WeakRetained;
      v38 = *(id *)(v19 + 32);
      v39 = v3;
      v40 = v6;
      v30 = (id)objc_msgSend(v29, "addCompletionBlock:", v37);

      goto LABEL_27;
    }
    v31 = WeakRetained;
    HFLogForCategory(0x32uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v32, OS_LOG_TYPE_ERROR, "Pin Code Value should not be empty", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v33);

    WeakRetained = v31;
  }
  else
  {
    HFLogForCategory(0x32uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "Couldn't find Pin Code from item", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v7);
  }
LABEL_27:

}

uint64_t __61__HFPinCodeManager_setPinCodeWithItem_enabled_onAccessories___block_invoke_101(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __61__HFPinCodeManager_setPinCodeWithItem_enabled_onAccessories___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("home"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CC568, CFSTR("operationType"));
  objc_msgSend(v4, "na_safeSetObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("pinCodeItem"));
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("error"));
  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 26, v4);
  v6 = *(void **)(a1 + 48);
  if (v7)
    objc_msgSend(v6, "finishWithError:", v7);
  else
    objc_msgSend(v6, "finishWithResult:", *(_QWORD *)(a1 + 56));

}

- (id)enablePinCodesForAllUsersOnNewAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HFPinCodeManager *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = self;
  -[HFPinCodeManager dataStore](self, "dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userPINCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x32uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v33 = objc_msgSend(v8, "count");
    v34 = 2112;
    v35 = v4;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Enabling pin codes for all (%lu) users on accessory: %@", buf, 0x16u);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "accessories");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsObject:", v4);

        if (v17)
        {
          HFLogForCategory(0x32uLL);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Skipping user that is already enabled on accessory", buf, 2u);
          }
        }
        else
        {
          v19 = objc_alloc(MEMORY[0x1E0CBA1A0]);
          objc_msgSend(v15, "pinCodeValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v19, "initWithStringValue:", v20);

          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA150]), "initWithAccessCodeValue:accessory:", v18, v4);
          objc_msgSend(v5, "addObject:", v21);

          v30 = v4;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addAccessories:", v22);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  -[HFPinCodeManager _submitModificationRequests:](v25, "_submitModificationRequests:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)enablePinCodesForNewAccessory:(id)a3 forGuestItems:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory(0x32uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Enabling pin codes on accessory for provided guests: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v10 = (void *)MEMORY[0x1E0D519C0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__HFPinCodeManager_enablePinCodesForNewAccessory_forGuestItems___block_invoke;
  v15[3] = &unk_1EA736BF0;
  objc_copyWeak(v18, (id *)buf);
  v11 = v8;
  v16 = v11;
  v18[1] = (id)a2;
  v12 = v7;
  v17 = v12;
  objc_msgSend(v10, "futureWithBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);

  return v13;
}

void __64__HFPinCodeManager_enablePinCodesForNewAccessory_forGuestItems___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(void **)(a1 + 32);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __64__HFPinCodeManager_enablePinCodesForNewAccessory_forGuestItems___block_invoke_2;
  v26[3] = &unk_1EA736BC8;
  v20 = WeakRetained;
  v26[4] = WeakRetained;
  objc_msgSend(v4, "na_map:", v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "pinCodeValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA1A0]), "initWithStringValue:", v13);
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA150]), "initWithAccessCodeValue:accessory:", v14, *(_QWORD *)(a1 + 40));
          objc_msgSend(v6, "addObject:", v15);

          v27 = *(_QWORD *)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addAccessories:", v16);
        }
        else
        {
          HFLogForCategory(0x32uLL);
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            goto LABEL_11;
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v29 = v16;
          v30 = 2112;
          v31 = v12;
          _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "[%@]: Skipping pin code that does not have a value %@", buf, 0x16u);
        }

LABEL_11:
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v9);
  }

  objc_msgSend(v20, "_submitModificationRequests:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "completionHandlerAdapter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "addCompletionBlock:", v18);

}

id __64__HFPinCodeManager_enablePinCodesForNewAccessory_forGuestItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "guestPinCodeFromItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)generateNewCodeValue
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id buf[2];

  HFLogForCategory(0x32uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Generating a new unique Pin Code Value", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[HFPinCodeManager constraintsFuture](self, "constraintsFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HFPinCodeManager_generateNewCodeValue__block_invoke;
  v7[3] = &unk_1EA72A438;
  objc_copyWeak(&v8, buf);
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(buf);
  return v5;
}

id __40__HFPinCodeManager_generateNewCodeValue__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v19[16];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    HFLogForCategory(0x32uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Pin Code data store is nil.", v19, 2u);
    }

  }
  objc_msgSend(WeakRetained, "dataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userPINCodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "dataStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "guestPINCodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBA168], "generateAccessCodeValueFromConstraints:existingAccessCodes:", v3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v14, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "futureWithResult:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)checkForValidationErrorsWithPINCodeValue:(id)a3 originalPINCode:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id buf[2];

  v6 = a3;
  v7 = a4;
  HFLogForCategory(0x32uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Validating PIN Code value", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[HFPinCodeManager constraintsFuture](self, "constraintsFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__HFPinCodeManager_checkForValidationErrorsWithPINCodeValue_originalPINCode___block_invoke;
  v14[3] = &unk_1EA736C40;
  objc_copyWeak(&v17, buf);
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  objc_msgSend(v9, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);

  return v12;
}

id __77__HFPinCodeManager_checkForValidationErrorsWithPINCodeValue_originalPINCode___block_invoke(id *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v38;
  id v39;
  uint8_t buf[16];
  _QWORD v41[6];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t v46[8];
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[2];
  _QWORD v51[2];
  const __CFString *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v39 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "dataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    HFLogForCategory(0x32uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v46 = 0;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Pin Code data store is nil.", v46, 2u);
    }

  }
  objc_msgSend(WeakRetained, "dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userPINCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "dataStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "guestPINCodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)v46 = 0;
  v47 = v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __77__HFPinCodeManager_checkForValidationErrorsWithPINCodeValue_originalPINCode___block_invoke_107;
  v41[3] = &unk_1EA736C18;
  v41[4] = v46;
  v41[5] = &v42;
  objc_msgSend(WeakRetained, "_fetchPinCodeConstraints:", v41);
  _HFLocalizedStringWithDefaultValue(CFSTR("HFPinCodeEditorErrorChangeButtonTitle"), CFSTR("HFPinCodeEditorErrorChangeButtonTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((uint64_t *)v47 + 3) >= 1)
  {
    v14 = objc_msgSend(a1[4], "length");
    v21 = *((_QWORD *)v47 + 3);
    if (v14 < v21)
      goto LABEL_10;
  }
  if (v43[3] >= 1)
  {
    v22 = objc_msgSend(a1[4], "length");
    if (v22 > v43[3])
    {
      v21 = *((_QWORD *)v47 + 3);
LABEL_10:
      HFLocalizedStringWithFormat(CFSTR("HFPinCodeEditorCodeLengthErrorMessage"), CFSTR("%ld %ld"), v15, v16, v17, v18, v19, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v25 = 74;
LABEL_16:
      v52 = CFSTR("HFErrorHandlerOptionCancelButtonTextKey");
      v53[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v31, "mutableCopy");

      if (v24)
        objc_msgSend(v32, "setObject:forKey:", v24, CFSTR("HFErrorHandlerOptionRetryButtonText"));
      if (v23)
        objc_msgSend(v32, "setObject:forKey:", v23, CFSTR("HFErrorUserInfoOptionDescriptionKey"));
      v50[0] = CFSTR("HFErrorUserInfoOptionsKey");
      v50[1] = CFSTR("HFErrorUserInfoOperationKey");
      v51[0] = v32;
      v51[1] = CFSTR("HFOperationChangePINCodeValue");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HFErrorDomain"), v25, v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "futureWithError:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }
  }
  if ((objc_msgSend(a1[5], "isEqualToString:", a1[4]) & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0CBA168];
    v27 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v26, "doesAccessCode:conflictWithExistingAccessCodes:", v27, v28);

    if ((v29 & 1) != 0)
    {
      v23 = 0;
      v24 = 0;
      v25 = 75;
      goto LABEL_16;
    }
  }
  if (objc_msgSend(MEMORY[0x1E0CBA168], "isWeakAccessCode:", a1[4]))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFPinCodeEditorErrorPickNewPINButtonTitle"), CFSTR("HFPinCodeEditorErrorPickNewPINButtonTitle"), 1);
    v30 = objc_claimAutoreleasedReturnValue();

    _HFLocalizedStringWithDefaultValue(CFSTR("HFPinCodeEditorErrorContinueButtonTitle"), CFSTR("HFPinCodeEditorErrorContinueButtonTitle"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v25 = 77;
    v13 = (void *)v30;
    goto LABEL_16;
  }
  HFLogForCategory(0x32uLL);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v38, OS_LOG_TYPE_DEFAULT, "Validating PIN Code value succeeded with no problems!", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v46, 8);

  return v36;
}

uint64_t __77__HFPinCodeManager_checkForValidationErrorsWithPINCodeValue_originalPINCode___block_invoke_107(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

- (id)restoreFullAccessForUserWithItem:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x32uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = (uint64_t)v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Restoring full access for user pin code %@", buf, 0xCu);
  }

  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HFPinCodeManager dataStore](self, "dataStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pinCodeFromItem:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "userLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "user");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      NSLog(CFSTR("Restore Full Access should only be called on a user's PIN Code."));
    -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessoriesSupportingAccessCodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __53__HFPinCodeManager_restoreFullAccessForUserWithItem___block_invoke;
    v22[3] = &unk_1EA727840;
    v23 = v10;
    v15 = v10;
    objc_msgSend(v14, "na_filter:", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFPinCodeManager setPinCodeWithItem:enabled:onAccessories:](self, "setPinCodeWithItem:enabled:onAccessories:", v8, 1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory(0x32uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v25 = v21;
      _os_log_error_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_ERROR, "Restore Full Access was called with an unsupported item type: %@", buf, 0xCu);
    }

    v19 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "futureWithError:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

uint64_t __53__HFPinCodeManager_restoreFullAccessForUserWithItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1u;
}

- (id)revokeAccessForAllRemovedUsers
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x32uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to remove all deleted users", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HFPinCodeManager dataStore](self, "dataStore", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removedUserPINCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "userLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removedUserInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "userUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_alloc_init(MEMORY[0x1E0D519C0]);
        -[HFPinCodeManager accessCodeManager](self, "accessCodeManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFPinCodeManager _modificationCompletionHandlerForFuture:](self, "_modificationCompletionHandlerForFuture:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setAccessCode:forUserWithUUID:completion:", 0, v15, v18);

        objc_msgSend(v4, "addObject:", v16);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)hasValidConstraints
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFPinCodeManager constraintsFuture](self, "constraintsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__HFPinCodeManager_hasValidConstraints__block_invoke;
  v7[3] = &unk_1EA72A050;
  v7[4] = self;
  objc_msgSend(v3, "recover:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flatMap:", &__block_literal_global_126_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __39__HFPinCodeManager_hasValidConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (+[HFExecutionEnvironment isHomeUIService](HFExecutionEnvironment, "isHomeUIService"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchAccessoryConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recover:", &__block_literal_global_125_2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t __39__HFPinCodeManager_hasValidConstraints__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", a2);
}

uint64_t __39__HFPinCodeManager_hasValidConstraints__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  char isKindOfClass;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D519C0];
  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = MEMORY[0x1E0C9AAA0];
  else
    v5 = MEMORY[0x1E0C9AAB0];
  return objc_msgSend(v2, "futureWithResult:", v5);
}

- (void)_fetchPinCodeConstraints:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  v5 = (void *)MEMORY[0x1E0CBA168];
  -[HFPinCodeManager constraints](self, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "greatestLowerBoundForAccessCodeLengthFromConstraints:", v6);

  v8 = (void *)MEMORY[0x1E0CBA168];
  -[HFPinCodeManager constraints](self, "constraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "leastUpperBoundForAccessCodeLengthFromConstraints:", v9);

  if (v7 < 0 || v10 <= 0)
  {
    HFLogForCategory(0x32uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[HFPinCodeManager constraints](self, "constraints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218498;
      v14 = v7;
      v15 = 2048;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "Fetching constraints Pin Code, we got a min or max length of zero. min: %ld max: %ld constraints: %@", (uint8_t *)&v13, 0x20u);

    }
  }
  v4[2](v4, v7, v10);

}

- (void)fetchPinCodeConstraints:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HFPinCodeManager constraintsFuture](self, "constraintsFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__HFPinCodeManager_fetchPinCodeConstraints___block_invoke;
  v13[3] = &unk_1EA736CC8;
  objc_copyWeak(&v15, &location);
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "addSuccessBlock:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __44__HFPinCodeManager_fetchPinCodeConstraints___block_invoke_2;
  v11[3] = &unk_1EA736CF0;
  v9 = v7;
  v12 = v9;
  v10 = (id)objc_msgSend(v8, "addFailureBlock:", v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __44__HFPinCodeManager_fetchPinCodeConstraints___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchPinCodeConstraints:", *(_QWORD *)(a1 + 32));

}

uint64_t __44__HFPinCodeManager_fetchPinCodeConstraints___block_invoke_2(uint64_t a1)
{
  NSLog(CFSTR("We should not be trying to fetch PIN Code constraints when they are unavailable."));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFPinCodeManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFPinCodeManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_reloadObservers
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x32uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFPinCodeManager observers](self, "observers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Telling observers to reload %@", buf, 0xCu);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HFPinCodeManager observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "pinCodeManagerDidUpdate:pinCodes:", self, 0);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)accessCodeManager:(id)a3 didAddAccessoryAccessCodes:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  HFPinCode *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory(0x32uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v27 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Received didAddAccessoryAccessCodes notification with %lu new PIN codes", buf, 0xCu);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "accessCodeValue", (_QWORD)v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[HFPinCodeManager dataStore](self, "dataStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pinCodeForCodeValue:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v16, "addAccessoryAccessCode:", v12);
        }
        else
        {
          HFLogForCategory(0x32uLL);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "Adding new guest PIN Code because we could not find an existing PIN Code for new accessory access code.", buf, 2u);
          }

          v18 = -[HFPinCode initWithAccessoryAccessCode:]([HFPinCode alloc], "initWithAccessoryAccessCode:", v12);
          -[HFPinCodeManager dataStore](self, "dataStore");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "guestPINCodes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setValue:forKey:", v18, v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  -[HFPinCodeManager _reloadObservers](self, "_reloadObservers");
}

- (void)accessCodeManager:(id)a3 didRemoveAccessoryAccessCodes:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory(0x32uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v23 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Received didRemoveAccessoryAccessCodes notification with %lu PIN codes", buf, 0xCu);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "accessCodeValue", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[HFPinCodeManager dataStore](self, "dataStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pinCodeForCodeValue:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "removeAccessoryAccessCode:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  -[HFPinCodeManager _reloadObservers](self, "_reloadObservers");
}

- (void)accessCodeManager:(id)a3 didAddHomeAccessCodes:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory(0x32uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Received didAddHomeAccessCodes notification with %lu new PIN codes", buf, 0xCu);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        -[HFPinCodeManager dataStore](self, "dataStore", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFPinCodeManager _addNewHomeAccessCode:toStore:](self, "_addNewHomeAccessCode:toStore:", v12, v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[HFPinCodeManager _reloadObservers](self, "_reloadObservers");
}

- (void)accessCodeManager:(id)a3 didUpdateHomeAccessCodes:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory(0x32uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Received didUpdateHomeAccessCodes notification with %lu PIN codes", buf, 0xCu);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "accessCodeValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "userInformation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "user");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[HFPinCodeManager dataStore](self, "dataStore");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v16)
        {
          objc_msgSend(v17, "userPINCodes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "allValues");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __63__HFPinCodeManager_accessCodeManager_didUpdateHomeAccessCodes___block_invoke;
          v28[3] = &unk_1EA736A60;
          v28[4] = v12;
          objc_msgSend(v20, "na_firstObjectPassingTest:", v28);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v22 = (void *)objc_msgSend(v21, "copyWithNewPinCodeValue:", v14);
            -[HFPinCodeManager dataStore](self, "dataStore");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "pinCodeValue");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "updateWithPinCode:forOldCodeValue:", v22, v24);

          }
        }
        else
        {
          objc_msgSend(v17, "guestPINCodes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", v14);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "userInformation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setUserLabel:", v27);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v9);
  }

  -[HFPinCodeManager _reloadObservers](self, "_reloadObservers");
}

uint64_t __63__HFPinCodeManager_accessCodeManager_didUpdateHomeAccessCodes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a2, "userLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  return v9;
}

- (void)accessCodeManager:(id)a3 didRemoveHomeAccessCodes:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory(0x32uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Received didRemoveHomeAccessCodes notification with %lu PIN codes", buf, 0xCu);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "accessCodeValue", (_QWORD)v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[HFPinCodeManager dataStore](self, "dataStore");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "userPINCodes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeObjectForKey:", v13);

          -[HFPinCodeManager dataStore](self, "dataStore");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "guestPINCodes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObjectForKey:", v13);

          -[HFPinCodeManager dataStore](self, "dataStore");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removedUserPINCodes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObjectForKey:", v13);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  -[HFPinCodeManager _reloadObservers](self, "_reloadObservers");
}

+ (id)asciiStringForLocalizedPINString:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v7 = 0;
    do
    {
      v8 = u_charDigitValue(objc_msgSend(v5, "characterAtIndex:", v7));
      if ((_DWORD)v8 == -1)
      {

        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HFErrorDomain"), 82, 0);
          v6 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v6 = 0;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v10);

      }
      ++v7;
    }
    while (v7 < objc_msgSend(v5, "length"));
  }

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HMAccessCodeManager)accessCodeManager
{
  return self->_accessCodeManager;
}

- (void)setAccessCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_accessCodeManager, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (HFPinCodeDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (int64_t)fetchInProgress
{
  return self->_fetchInProgress;
}

- (NAFuture)constraintsFuture
{
  return self->_constraintsFuture;
}

- (void)setConstraintsFuture:(id)a3
{
  objc_storeStrong((id *)&self->_constraintsFuture, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (NAFuture)inProgressFetchFromAccessories
{
  return (NAFuture *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInProgressFetchFromAccessories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProgressFetchFromAccessories, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_constraintsFuture, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessCodeManager, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
