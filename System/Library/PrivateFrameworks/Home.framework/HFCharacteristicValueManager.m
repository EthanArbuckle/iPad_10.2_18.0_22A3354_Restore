@implementation HFCharacteristicValueManager

- (id)cachedValueForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v4 = a3;
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HFCharacteristicValueManager cacheManager](self, "cacheManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedValueForCharacteristic:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[HFCharacteristicValueManager characteristicsWithCachedValues](self, "characteristicsWithCachedValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if (v9)
    {
      objc_msgSend(v4, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  -[HFCharacteristicValueManager _overrideCachedValueForCharacteristic:value:](self, "_overrideCachedValueForCharacteristic:value:", v4, v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v7;
  v13 = v12;

  if (+[HFHomeKitDispatcher synchronizesHomeDataModel](HFHomeKitDispatcher, "synchronizesHomeDataModel"))
  {
    -[HFCharacteristicValueManager staticHomeDataModelCachedValueForCharacteristic:](self, "staticHomeDataModelCachedValueForCharacteristic:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;

      v13 = v16;
    }

  }
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlock");

  return v13;
}

void __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke_2(uint64_t a1, void *a2, BOOL *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD aBlock[4];
  id v15;

  v5 = a2;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 24);
  if ((v8 & 1) == 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke_3;
    aBlock[3] = &unk_1EA72BBA0;
    v9 = v5;
    v15 = v9;
    v10 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "cacheManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v11, "containsTransactionsReadingCharacteristic:filterBlock:", v9, v10);

    if ((_DWORD)v9)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 1uLL;

    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 24);
  }
  if ((v8 & 2) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cacheManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsTransactionsWritingCharacteristic:", v6);

    v7 = *(_QWORD *)(a1 + 40);
    if (v13)
    {
      *(_QWORD *)(*(_QWORD *)(v7 + 8) + 24) |= 2uLL;
      v7 = *(_QWORD *)(a1 + 40);
    }
  }
  *a3 = (~*(_DWORD *)(*(_QWORD *)(v7 + 8) + 24) & 3) == 0;

}

- (HFCharacteristicValueCacheManager)cacheManager
{
  return self->_cacheManager;
}

- (unint64_t)cachedLoadingStateForCharacteristics:(id)a3 actionSets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[HFCharacteristicValueManager testingOverrideLoadingStates](self, "testingOverrideLoadingStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke;
    v17[3] = &unk_1EA72BB78;
    v17[4] = self;
    v17[5] = &v18;
    objc_msgSend(v6, "na_each:", v17);
  }
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lock");

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke_2;
  v16[3] = &unk_1EA72BBC8;
  v16[4] = self;
  v16[5] = &v18;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v16);
  if ((v19[3] & 2) == 0)
  {
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke_4;
    v15[3] = &unk_1EA72BBF0;
    v15[4] = self;
    v15[5] = &v18;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v15);
  }
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unlock");

  v13 = v19[3];
  _Block_object_dispose(&v18, 8);

  return v13;
}

- (NSRecursiveLock)transactionLock
{
  return self->_transactionLock;
}

- (NSMutableDictionary)testingOverrideLoadingStates
{
  return self->_testingOverrideLoadingStates;
}

- (NSMutableSet)characteristicsWithCachedValues
{
  return self->_characteristicsWithCachedValues;
}

- (id)_overrideCachedValueForCharacteristic:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "characteristicType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB87C0]);

  v11 = 0;
  if (v8 && v10)
  {
    if (objc_msgSend(v8, "intValue"))
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v7, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "characteristics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "na_firstObjectPassingTest:", &__block_literal_global_209);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[HFCharacteristicValueManager cachedValueForCharacteristic:](self, "cachedValueForCharacteristic:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics"))
        {
          HFLogForCategory(0x38uLL);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "uniqueIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v15, "BOOLValue");
            *(_DWORD *)buf = 138413314;
            v22 = CFSTR("Off");
            v35 = v18;
            v36 = 2112;
            if (v21)
              v22 = CFSTR("On");
            v37 = v19;
            v38 = 2112;
            v39 = v8;
            v40 = 2112;
            v41 = v20;
            v42 = 2112;
            v43 = v22;
            _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ brightness %@ (%@) associatedPowerCharacteristic powered on: %@", buf, 0x34u);

          }
        }
        if (objc_msgSend(v15, "BOOLValue"))
        {
          HFLogForCategory(0x38uLL);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "uniqueIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "service");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "hf_serviceNameComponents");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "composedString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "service");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "uniqueIdentifier");
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413826;
            v35 = v31;
            v36 = 2112;
            v37 = v30;
            v38 = 2112;
            v39 = v25;
            v40 = 2112;
            v41 = v26;
            v42 = 2112;
            v43 = v28;
            v44 = 2112;
            v45 = v8;
            v46 = 2112;
            v47 = &unk_1EA7CBB48;
            _os_log_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ Overriding cached value for characteristic (%@) in service '%@' (%@) from %@ to %@", buf, 0x48u);

          }
          v11 = &unk_1EA7CBB48;
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
  }

  return v11;
}

uint64_t __75__HFCharacteristicValueManager_hasCachedReadErrorForAccessory_passingTest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cachedReadErrorsKeyedByCharacteristicIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "transactionLock");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unlock");

      v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "transactionLock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lock");

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)cachedReadErrorForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HFCharacteristicValueManager cachedReadErrorsKeyedByCharacteristicIdentifier](self, "cachedReadErrorsKeyedByCharacteristicIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  return v8;
}

- (NSMutableDictionary)cachedReadErrorsKeyedByCharacteristicIdentifier
{
  return self->_cachedReadErrorsKeyedByCharacteristicIdentifier;
}

- (NSSet)allReadCharacteristics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[HFCharacteristicValueManager mutableAllReadCharacteristics](self, "mutableAllReadCharacteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  return (NSSet *)v5;
}

- (NSMutableSet)mutableAllReadCharacteristics
{
  return self->_mutableAllReadCharacteristics;
}

- (id)staticHomeDataModelCachedValueForCharacteristic:(id)a3
{
  id v4;
  HFCharacteristicValueManager *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[3];
  uint64_t v14;

  v4 = a3;
  v5 = self;
  HFCharacteristicValueManager.staticHomeDataModelCachedValue(for:)(v4, (uint64_t)v13);

  v6 = v14;
  if (!v14)
    return 0;
  v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  v11 = (void *)sub_1DD63E848();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_234 != -1)
    dispatch_once(&_MergedGlobals_234, &__block_literal_global_207);
  return (NAIdentity *)(id)qword_1ED378ED0;
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
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
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  unint64_t v52;
  const __CFString *v53;
  BOOL v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  unint64_t v58;
  const __CFString *v59;
  id v60;
  void *v61;
  void *v62;
  id obj;
  uint64_t v64;
  void *v65;
  id WeakRetained;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint8_t v87[128];
  uint8_t buf[4];
  const __CFString *v89;
  os_activity_scope_state_s state;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v60 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1)
  {
    v64 = a1;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "transactionLock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lock");

    v4 = *(void **)(v64 + 32);
    if (v4)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v4, "loggerActivity");
      v5 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v5, &state);

      HFLogForCategory(0x38uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Received read responses:", buf, 2u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(state.opaque[0]) = 0;
        _os_log_impl(&dword_1DD34E000, v56, OS_LOG_TYPE_DEFAULT, "Received read responses:", (uint8_t *)&state, 2u);
      }

    }
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v7 = v60;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v82;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v82 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v10);
          v12 = *(void **)(v64 + 32);
          if (v12)
          {
            state.opaque[0] = 0;
            state.opaque[1] = 0;
            objc_msgSend(v12, "loggerActivity");
            v13 = objc_claimAutoreleasedReturnValue();
            os_activity_scope_enter(v13, &state);

            HFLogForCategory(0x38uLL);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "hf_prettyDescription");
              v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v89 = v15;
              _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "     %@", buf, 0xCu);

            }
            os_activity_scope_leave(&state);
          }
          else
          {
            HFLogForCategory(0x38uLL);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "hf_prettyDescription");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(state.opaque[0]) = 138412290;
              *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v17;
              _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "     %@", (uint8_t *)&state, 0xCu);

            }
          }
          ++v10;
        }
        while (v8 != v10);
        v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
        v8 = v18;
      }
      while (v18);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v7;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v78 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v22, "request");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            NSLog(CFSTR("Request (%@) contained in response (%@) was nil or the wrong class"), v23, v22);
          objc_opt_class();
          v24 = v23;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v25 = v24;
          else
            v25 = 0;
          v26 = v25;

          objc_msgSend(v26, "characteristic");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            if (+[HFCharacteristicValueManager _shouldTrackReadsCompleteForPerformanceTesting](HFCharacteristicValueManager, "_shouldTrackReadsCompleteForPerformanceTesting"))
            {
              objc_msgSend(*(id *)(v64 + 40), "logger");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "_endReadsCompleteTrackingForCharacteristic:withLogger:didRead:", v27, v28, 1);

            }
            objc_msgSend(v22, "error");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              objc_msgSend(v62, "addObject:", v27);
              objc_msgSend(WeakRetained, "characteristicsWithCachedValues");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "removeObject:", v27);

              objc_msgSend(v22, "error");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "cachedReadErrorsKeyedByCharacteristicIdentifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "uniqueIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v33);

            }
            else
            {
              objc_msgSend(v61, "addObject:", v27);
              objc_msgSend(WeakRetained, "mutableAllReadCharacteristics");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "addObject:", v27);

              objc_msgSend(WeakRetained, "characteristicsWithCachedValues");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "addObject:", v27);

              objc_msgSend(WeakRetained, "cachedReadErrorsKeyedByCharacteristicIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "uniqueIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "removeObjectForKey:", v37);

              objc_msgSend(WeakRetained, "cachedWriteErrorsKeyedByCharacteristicIdentifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "uniqueIdentifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "removeObjectForKey:", v32);
            }

            objc_msgSend(v27, "uniqueIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setObject:forKeyedSubscript:", v22, v38);

          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      }
      while (v19);
    }

    objc_msgSend(*(id *)(v64 + 48), "na_map:", &__block_literal_global_181);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "transactionLock");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "unlock");

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v41 = v39;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
    v43 = MEMORY[0x1E0C809B0];
    if (v42)
    {
      v44 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v74 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
          v71[0] = v43;
          v71[1] = 3221225472;
          v71[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_182;
          v71[3] = &unk_1EA72C000;
          v72 = v65;
          objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", v71);

        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
      }
      while (v42);
    }

    v47 = objc_loadWeakRetained((id *)(v64 + 72));
    if (!v47)
      goto LABEL_59;
    if (objc_msgSend(v61, "count"))
    {

    }
    else
    {
      v54 = objc_msgSend(v62, "count") == 0;

      if (v54)
      {
LABEL_59:

        goto LABEL_60;
      }
    }
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v43;
    v67[1] = 3221225472;
    v67[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_3_183;
    v67[3] = &unk_1EA72C028;
    objc_copyWeak(&v70, (id *)(v64 + 72));
    v68 = v61;
    v69 = v62;
    objc_msgSend(v55, "dispatchHomeObserverMessage:sender:", v67, 0);

    objc_destroyWeak(&v70);
    goto LABEL_59;
  }
  v48 = a1;
  v49 = *(void **)(a1 + 32);
  if (v49)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(v49, "loggerActivity");
    v50 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v50, &state);

    HFLogForCategory(0x38uLL);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v48 + 56) + 8) + 24) - 1;
      if (v52 > 2)
        v53 = CFSTR("NotStarted");
      else
        v53 = off_1EA72C218[v52];
      *(_DWORD *)buf = 138412290;
      v89 = v53;
      _os_log_impl(&dword_1DD34E000, v51, OS_LOG_TYPE_DEFAULT, "Not processing characteristic read progressHandler because the batch request is not in flight. Current state: %@", buf, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x38uLL);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v48 + 56) + 8) + 24) - 1;
      if (v58 > 2)
        v59 = CFSTR("NotStarted");
      else
        v59 = off_1EA72C218[v58];
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v59;
      _os_log_impl(&dword_1DD34E000, v57, OS_LOG_TYPE_DEFAULT, "Not processing characteristic read progressHandler because the batch request is not in flight. Current state: %@", (uint8_t *)&state, 0xCu);
    }

  }
LABEL_60:

}

id __61__HFCharacteristicValueManager_readValuesForCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HFCharacteristicBatchReadResponse *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  HFCharacteristicBatchReadResponse *v8;
  void *v9;

  v3 = a2;
  v4 = [HFCharacteristicBatchReadResponse alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFCharacteristicBatchReadResponse initWithReadResponses:contextProvider:](v4, "initWithReadResponses:contextProvider:", v5, v7);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HFCharacteristicOperationContextProviding)contextProvider
{
  void *v2;
  void *v3;

  -[HFCharacteristicValueManager valueReader](self, "valueReader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFCharacteristicOperationContextProviding *)v3;
}

- (HFCharacteristicValueReader)valueReader
{
  return self->_valueReader;
}

- (void)beginTransactionWithReason:(id)a3 readPolicy:(id)a4 logger:(id)a5
{
  id v9;
  id v10;
  HFUpdateLogger *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  HFCharacteristicValueTransaction *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  uint8_t buf[4];
  id v45;
  os_activity_scope_state_s state;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (HFUpdateLogger *)a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueManager.m"), 349, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lock");

  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v24 = objc_alloc_init(HFCharacteristicValueTransaction);
    -[HFCharacteristicValueManager setOpenTransaction:](self, "setOpenTransaction:", v24);

    if (v11)
    {
      -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = 1;
    }
    else
    {
      v11 = -[HFUpdateLogger initWithTimeout:description:]([HFUpdateLogger alloc], "initWithTimeout:description:", v9, 15.0);
      -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = 0;
    }
    objc_msgSend(v25, "setLoggerIsExternal:", v27);

    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setLogger:", v11);

    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logger");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "logger");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "loggerActivity");
      v33 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v33, &state);

      HFLogForCategory(0x38uLL);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v9;
        _os_log_impl(&dword_1DD34E000, v34, OS_LOG_TYPE_DEFAULT, "----- OPEN TRANSACTION (%@) -----", buf, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v9;
        _os_log_impl(&dword_1DD34E000, v43, OS_LOG_TYPE_DEFAULT, "----- OPEN TRANSACTION (%@) -----", (uint8_t *)&state, 0xCu);
      }

    }
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "onFinishGroup");
    v35 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v35);

    goto LABEL_18;
  }
  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "loggerActivity");
    v18 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v18, &state);

    HFLogForCategory(0x38uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v9;
      _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "Nest transaction (%@)", buf, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x38uLL);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v9;
      _os_log_impl(&dword_1DD34E000, v42, OS_LOG_TYPE_DEFAULT, "Nest transaction (%@)", (uint8_t *)&state, 0xCu);
    }

  }
  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "clientReasonsStack");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "containsObject:", v9);

  if (v22)
  {
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("The open transaction (%@) already has a duplicate nested transacation for reason: %@"), v23, v9);
LABEL_18:

  }
  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "readPolicy");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "pushPolicy:", v10);

  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "clientReasonsStack");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v9);

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "unlock");

}

- (unint64_t)loadingStateForCharacteristics:(id)a3 actionSets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  unint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  _QWORD aBlock[4];
  id v37;
  _QWORD v38[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v6 = a3;
  v7 = a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  -[HFCharacteristicValueManager testingOverrideLoadingStates](self, "testingOverrideLoadingStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __74__HFCharacteristicValueManager_loadingStateForCharacteristics_actionSets___block_invoke;
    v38[3] = &unk_1EA72BB78;
    v38[4] = self;
    v38[5] = &v39;
    objc_msgSend(v6, "na_each:", v38);
  }
  v11 = -[HFCharacteristicValueManager cachedLoadingStateForCharacteristics:actionSets:](self, "cachedLoadingStateForCharacteristics:actionSets:", v6, v7);
  v40[3] |= v11;
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lock");

  v13 = v40[3];
  if ((v13 & 1) == 0)
  {
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "characteristicsToRead");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intersectsSet:", v6);

    v13 = v40[3];
    if (v16)
    {
      v13 |= 1uLL;
      v40[3] = v13;
    }
  }
  if ((v13 & 2) == 0)
  {
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionSetsToExecute");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intersectsSet:", v7);

    v13 = v40[3];
    if (v19)
    {
      v13 |= 2uLL;
      v40[3] = v13;
    }
  }
  if ((v13 & 2) == 0)
  {
    aBlock[0] = v10;
    aBlock[1] = 3221225472;
    aBlock[2] = __74__HFCharacteristicValueManager_loadingStateForCharacteristics_actionSets___block_invoke_2;
    aBlock[3] = &unk_1EA72BC18;
    v37 = v6;
    v20 = _Block_copy(aBlock);
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "writeCharacteristicRequests");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "na_any:", v20);

    if (v23)
      v40[3] |= 2uLL;

    v13 = v40[3];
  }
  if ((v13 & 2) == 0)
  {
    v31 = v10;
    v32 = 3221225472;
    v33 = __74__HFCharacteristicValueManager_loadingStateForCharacteristics_actionSets___block_invoke_3;
    v34 = &unk_1EA72BC40;
    v35 = v6;
    v24 = _Block_copy(&v31);
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction", v31, v32, v33, v34);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "actionsToExecute");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "na_any:", v24);

    if (v27)
      v40[3] |= 2uLL;

  }
  if (+[HFHomeKitDispatcher synchronizesHomeDataModel](HFHomeKitDispatcher, "synchronizesHomeDataModel")
    && -[HFCharacteristicValueManager staticHomeDataModelHasInProgressWriteForCharacteristic:](self, "staticHomeDataModelHasInProgressWriteForCharacteristic:", v6))
  {
    v40[3] |= 2uLL;
  }
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "unlock");

  v29 = v40[3];
  _Block_object_dispose(&v39, 8);

  return v29;
}

- (id)readValueForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  int v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  BOOL v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v83;
  _QWORD v84[5];
  id v85;
  id v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  _QWORD v91[4];
  id v92;
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[4];
  id v104;
  id v105;
  id v106;
  id v107;
  _BYTE v108[128];
  _BYTE buf[22];
  os_activity_scope_state_s state;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueManager.m"), 375, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characteristic != nil"));

  }
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = 0;
  v9 = objc_msgSend(v8, "evaluateWithCharacteristic:traits:", v4, &v107);
  v10 = v107;

  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = v9 == 0;
  else
    v13 = 0;
  v14 = v13;

  if (!v14)
    goto LABEL_15;
  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (v17)
  {
    HFLogForCategory(0x38uLL);
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "hf_prettyDescription");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v83;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v75;
      _os_log_impl(&dword_1DD34E000, v74, OS_LOG_TYPE_DEBUG, "Skip read (%@): %@", buf, 0x16u);

    }
  }
  else
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "loggerActivity");
    v20 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v20, &state);

    HFLogForCategory(0x38uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "hf_prettyDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v83;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v22;
      _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEBUG, "Skip read (%@): %@", buf, 0x16u);

    }
    os_activity_scope_leave(&state);
  }
  objc_initWeak((id *)buf, self);
  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commitFuture");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = MEMORY[0x1E0C809B0];
  v103[1] = 3221225472;
  v103[2] = __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke;
  v103[3] = &unk_1EA72BC68;
  objc_copyWeak(&v106, (id *)buf);
  v104 = v4;
  v105 = v10;
  objc_msgSend(v24, "flatMap:", v103);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v106);
  objc_destroyWeak((id *)buf);
  if (!v25)
  {
LABEL_15:
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    -[HFCharacteristicValueManager runningTransactions](self, "runningTransactions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v100;
LABEL_17:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v100 != v28)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * v29), "readFuturesKeyedByCharacteristicIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v6);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          if ((objc_msgSend(v31, "isFinished") & 1) == 0)
            break;
        }

        if (v27 == ++v29)
        {
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
          if (v27)
            goto LABEL_17;
          goto LABEL_24;
        }
      }
      -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logger");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33 == 0;

      if (v34)
      {
        HFLogForCategory(0x38uLL);
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "hf_prettyDescription");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v77;
          _os_log_impl(&dword_1DD34E000, v76, OS_LOG_TYPE_DEBUG, "Duplicate read in other running transaction: %@", buf, 0xCu);

        }
      }
      else
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "logger");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "loggerActivity");
        v37 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v37, (os_activity_scope_state_t)buf);

        HFLogForCategory(0x38uLL);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "hf_prettyDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(state.opaque[0]) = 138412290;
          *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v39;
          _os_log_impl(&dword_1DD34E000, v38, OS_LOG_TYPE_DEBUG, "Duplicate read in other running transaction: %@", (uint8_t *)&state, 0xCu);

        }
        os_activity_scope_leave((os_activity_scope_state_t)buf);
      }
      objc_initWeak((id *)buf, self);
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_95;
      v95[3] = &unk_1EA72BC90;
      objc_copyWeak(&v98, (id *)buf);
      v96 = v4;
      v97 = v10;
      objc_msgSend(v31, "flatMap:", v95);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v98);
      objc_destroyWeak((id *)buf);

      if (v25)
        goto LABEL_45;
    }
    else
    {
LABEL_24:

    }
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40 == 0;

    if (v41)
      goto LABEL_40;
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "readFuturesKeyedByCharacteristicIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", v6);
    v44 = (id)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v42, "characteristicsToRead");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "containsObject:", v4);

      if ((v46 & 1) == 0)
        NSLog(CFSTR("Inconsistent state: we have a future for the read, but it's not in characteristicsToRead"));
    }
    else
    {
      -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "logger");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48 == 0;

      if (v49)
      {
        HFLogForCategory(0x38uLL);
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "hf_prettyDescription");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v83;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v81;
          _os_log_impl(&dword_1DD34E000, v80, OS_LOG_TYPE_DEBUG, "New read request (%@): %@", buf, 0x16u);

        }
      }
      else
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "logger");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "loggerActivity");
        v52 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v52, &state);

        HFLogForCategory(0x38uLL);
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "hf_prettyDescription");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v83;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v54;
          _os_log_impl(&dword_1DD34E000, v53, OS_LOG_TYPE_DEBUG, "New read request (%@): %@", buf, 0x16u);

        }
        os_activity_scope_leave(&state);
      }
      v44 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      objc_msgSend(v42, "readFuturesKeyedByCharacteristicIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v44, v6);

    }
    objc_msgSend(v42, "characteristicsToRead");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addObject:", v4);

    objc_initWeak((id *)buf, self);
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_99;
    v91[3] = &unk_1EA72BC90;
    objc_copyWeak(&v94, (id *)buf);
    v92 = v4;
    v93 = v10;
    objc_msgSend(v44, "flatMap:", v91);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v94);
    objc_destroyWeak((id *)buf);

    if (!v25)
    {
LABEL_40:
      -[HFCharacteristicValueManager beginTransactionWithReason:](self, "beginTransactionWithReason:", CFSTR("characteristicValueManagerImplicitTransaction"));
      -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "logger");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v58 == 0;

      if (v59)
      {
        HFLogForCategory(0x38uLL);
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "hf_prettyDescription");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v83;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v79;
          _os_log_impl(&dword_1DD34E000, v78, OS_LOG_TYPE_DEBUG, "Read request for implicit transaction (%@): %@", buf, 0x16u);

        }
      }
      else
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        objc_msgSend(v57, "logger");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "loggerActivity");
        v61 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v61, &state);

        HFLogForCategory(0x38uLL);
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "hf_prettyDescription");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v83;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v63;
          _os_log_impl(&dword_1DD34E000, v62, OS_LOG_TYPE_DEBUG, "Read request for implicit transaction (%@): %@", buf, 0x16u);

        }
        os_activity_scope_leave(&state);
      }
      v64 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      objc_msgSend(v57, "readFuturesKeyedByCharacteristicIdentifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v64, v6);

      objc_msgSend(v57, "characteristicsToRead");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "addObject:", v4);

      objc_initWeak((id *)buf, self);
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_100;
      v87[3] = &unk_1EA72BC90;
      objc_copyWeak(&v90, (id *)buf);
      v88 = v4;
      v89 = v10;
      objc_msgSend(v64, "flatMap:", v87);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicValueManager commitTransactionWithReason:](self, "commitTransactionWithReason:", CFSTR("characteristicValueManagerImplicitTransaction"));

      objc_destroyWeak(&v90);
      objc_destroyWeak((id *)buf);

    }
  }
LABEL_45:
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "unlock");

  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueManager.m"), 481, CFSTR("None of our cases were able to create a future for this request"));

  }
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_2;
  v84[3] = &unk_1EA72BCB8;
  v84[4] = self;
  v85 = v4;
  v86 = v10;
  v68 = v10;
  v69 = v4;
  objc_msgSend(v25, "recover:", v84);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  return v70;
}

- (HFCharacteristicValueTransaction)openTransaction
{
  return self->_openTransaction;
}

uint64_t __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "readFuturesKeyedByCharacteristicIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFinished") ^ 1;

  return v6;
}

id __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  HFCharacteristicReadResponse *v7;
  void *v8;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "cachedValueForCharacteristic:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "cachedReadErrorForCharacteristic:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = -[HFCharacteristicReadResponse initWithCharacteristic:readTraits:value:error:]([HFCharacteristicReadResponse alloc], "initWithCharacteristic:readTraits:value:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4, v6);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)staticHomeDataModelHasInProgressWriteForCharacteristic:(id)a3
{
  uint64_t v4;
  HFCharacteristicValueManager *v5;
  char v6;
  char v7;

  sub_1DD352C44();
  sub_1DD361D24();
  v4 = sub_1DD63E398();
  v5 = self;
  sub_1DD421D2C(v4);
  v7 = v6;

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (NSMutableArray)runningTransactions
{
  return self->_runningTransactions;
}

+ (BOOL)_shouldTrackReadsCompleteForPerformanceTesting
{
  return (objc_msgSend((id)*MEMORY[0x1E0CEB258], "launchedToTest") & 1) != 0
      || HFPreferencesBooleanValueForKey(CFSTR("HFPreferencesReadsCompleteTrackingKey")) == 2;
}

- (void)setInFlightReadCancelationToken:(id)a3
{
  objc_storeStrong((id *)&self->_inFlightReadCancelationToken, a3);
}

- (id)readValuesForCharacteristics:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;
  id obj;
  _QWORD v21[4];
  id v22;
  id location;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    -[HFCharacteristicValueManager beginTransactionWithReason:](self, "beginTransactionWithReason:", CFSTR("characteristicValueManagerBatchReadTransaction"));
  objc_msgSend(MEMORY[0x1E0C99E20], "set", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        -[HFCharacteristicValueManager readValueForCharacteristic:](self, "readValueForCharacteristic:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v8;
        v24[1] = 3221225472;
        v24[2] = __61__HFCharacteristicValueManager_readValuesForCharacteristics___block_invoke;
        v24[3] = &unk_1EA72C190;
        v24[4] = self;
        v24[5] = a2;
        v12 = (id)objc_msgSend(v11, "addFailureBlock:", v24);
        objc_msgSend(v6, "addObject:", v11);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  objc_initWeak(&location, self);
  v13 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v6, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "combineAllFutures:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __61__HFCharacteristicValueManager_readValuesForCharacteristics___block_invoke_2;
  v21[3] = &unk_1EA72A438;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v15, "flatMap:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    -[HFCharacteristicValueManager commitTransactionWithReason:](self, "commitTransactionWithReason:", CFSTR("characteristicValueManagerBatchReadTransaction"));
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v16;
}

- (BOOL)isNaturalLightingSupportedForProfile:(id)a3
{
  id v3;
  _BOOL8 v4;
  void *v5;

  v3 = a3;
  if (+[HFUtilities isRunningInStoreDemoMode](HFUtilities, "isRunningInStoreDemoMode")
    || +[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_msgSend(v3, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "supportedFeatures") & 1;

  }
  return v4;
}

- (id)cachedErrorForWriteToCharacteristic:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    -[HFCharacteristicValueManager cachedWriteErrorsKeyedByCharacteristicIdentifier](self, "cachedWriteErrorsKeyedByCharacteristicIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlock");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)cachedWriteErrorsKeyedByCharacteristicIdentifier
{
  return self->_cachedWriteErrorsKeyedByCharacteristicIdentifier;
}

- (BOOL)hasCachedReadErrorForAccessory:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  HFCharacteristicValueManager *v17;
  id v18;

  v6 = a4;
  v7 = a3;
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lock");

  objc_msgSend(v7, "services");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __75__HFCharacteristicValueManager_hasCachedReadErrorForAccessory_passingTest___block_invoke;
  v16 = &unk_1EA72C140;
  v17 = self;
  v18 = v6;
  v10 = v6;
  LOBYTE(v6) = objc_msgSend(v9, "na_any:", &v13);

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock", v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

  return (char)v6;
}

- (id)readValuesForCharacteristicTypes:(id)a3 inServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__HFCharacteristicValueManager_readValuesForCharacteristicTypes_inServices___block_invoke;
  v10[3] = &unk_1EA72BB50;
  v11 = v6;
  v7 = v6;
  -[HFCharacteristicValueManager readValuesForCharacteristicsPassingTest:inServices:](self, "readValuesForCharacteristicsPassingTest:inServices:", v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)readValuesForCharacteristicsPassingTest:(id)a3 inServices:(id)a4
{
  unsigned int (**v5)(id, _QWORD);
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  HFCharacteristicValueManager *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v20 = self;
  v34 = *MEMORY[0x1E0C80C00];
  v5 = (unsigned int (**)(id, _QWORD))a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v10, "characteristics", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v15);
              if (!v5 || v5[2](v5, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15)))
              {
                objc_msgSend(v7, "addObject:", v16);
                objc_msgSend(v16, "uniqueIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v17);

              }
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

  -[HFCharacteristicValueManager readValuesForCharacteristics:](v20, "readValuesForCharacteristics:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __76__HFCharacteristicValueManager_readValuesForCharacteristicTypes_inServices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __75__HFCharacteristicValueManager_hasCachedReadErrorForAccessory_passingTest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__HFCharacteristicValueManager_hasCachedReadErrorForAccessory_passingTest___block_invoke_2;
  v7[3] = &unk_1EA72C118;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v5 = objc_msgSend(v3, "na_any:", v7);

  return v5;
}

- (void)commitTransactionWithReason:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  id v49;
  _QWORD block[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  NSObject *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  NSObject *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  NSObject *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  NSObject *v67;
  id v68;
  _BYTE buf[22];
  os_activity_scope_state_s state;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueManager.m"), 828, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueManager.m"), 833, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction"));

  }
  objc_msgSend(v6, "clientReasonsStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v49);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueManager.m"), 834, CFSTR("Attempt to commit transaction with unknown reason (not used in a call to -beginTransaction...): %@"), v49);

  }
  objc_msgSend(v6, "clientReasonsStack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v49);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientReasonsStack");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "lastObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueManager.m"), 835, CFSTR("Attempt to commit transactions with out-of-order reasons. The last call to -beginTransaction had a reason of %@, but the client attempted to commit the transaction with a reason (%@) that is further down the stack (i.e., begin(A) -> begin(B) -> commit(A).)"), v45, v49);

  }
  objc_msgSend(v6, "clientReasonsStack");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeLastObject");

  objc_msgSend(v6, "readPolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "popPolicy");

  objc_msgSend(v6, "clientReasonsStack");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count") == 0;

  objc_msgSend(v6, "logger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (v17)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v6, "logger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "loggerActivity");
      v24 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v24, (os_activity_scope_state_t)buf);

      HFLogForCategory(0x38uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v49;
        _os_log_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_DEFAULT, "----- COMMIT TRANSACTION (%@) -----", (uint8_t *)&state, 0xCu);
      }

      os_activity_scope_leave((os_activity_scope_state_t)buf);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v49;
        _os_log_impl(&dword_1DD34E000, v48, OS_LOG_TYPE_DEFAULT, "----- COMMIT TRANSACTION (%@) -----", buf, 0xCu);
      }

    }
    -[HFCharacteristicValueManager runningTransactions](self, "runningTransactions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v6);

    -[HFCharacteristicValueManager cacheManager](self, "cacheManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "transactionAdded:", v6);

    -[HFCharacteristicValueManager setOpenTransaction:](self, "setOpenTransaction:", 0);
    objc_msgSend(v6, "commitFuture");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = dispatch_group_create();
    objc_initWeak((id *)buf, self);
    dispatch_group_enter(v28);
    v29 = MEMORY[0x1E0C809B0];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke;
    v65[3] = &unk_1EA72BE50;
    objc_copyWeak(&v68, (id *)buf);
    v30 = v6;
    v66 = v30;
    v31 = v28;
    v67 = v31;
    -[HFCharacteristicValueManager _transactionLock_executeWriteTransaction:completionHandler:](self, "_transactionLock_executeWriteTransaction:completionHandler:", v30, v65);
    dispatch_group_enter(v31);
    v61[0] = v29;
    v61[1] = 3221225472;
    v61[2] = __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_136;
    v61[3] = &unk_1EA72BE50;
    objc_copyWeak(&v64, (id *)buf);
    v32 = v30;
    v62 = v32;
    v33 = v31;
    v63 = v33;
    -[HFCharacteristicValueManager _transactionLock_executeActionSetTransaction:completionHandler:](self, "_transactionLock_executeActionSetTransaction:completionHandler:", v32, v61);
    dispatch_group_enter(v33);
    v57[0] = v29;
    v57[1] = 3221225472;
    v57[2] = __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_137;
    v57[3] = &unk_1EA72BE50;
    objc_copyWeak(&v60, (id *)buf);
    v34 = v32;
    v58 = v34;
    v35 = v33;
    v59 = v35;
    -[HFCharacteristicValueManager _transactionLock_executeActionsTransaction:completionHandler:](self, "_transactionLock_executeActionsTransaction:completionHandler:", v34, v57);
    dispatch_group_enter(v35);
    v53[0] = v29;
    v53[1] = 3221225472;
    v53[2] = __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_138;
    v53[3] = &unk_1EA72BE50;
    objc_copyWeak(&v56, (id *)buf);
    v36 = v34;
    v54 = v36;
    v37 = v35;
    v55 = v37;
    -[HFCharacteristicValueManager _transactionLock_executeReadTransaction:completionHandler:](self, "_transactionLock_executeReadTransaction:completionHandler:", v36, v53);
    block[0] = v29;
    block[1] = 3221225472;
    block[2] = __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_139;
    block[3] = &unk_1EA727A48;
    objc_copyWeak(&v52, (id *)buf);
    v51 = v36;
    dispatch_group_notify(v37, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v52);
    objc_destroyWeak(&v56);

    objc_destroyWeak(&v60);
    objc_destroyWeak(&v64);

    objc_destroyWeak(&v68);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (v17)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v6, "logger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "loggerActivity");
      v19 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v19, &state);

      HFLogForCategory(0x38uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "clientReasonsStack");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v49;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v21;
        _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "Commit nested transaction (%@). Remaining: %@", buf, 0x16u);

      }
      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "clientReasonsStack");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v49;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v47;
        _os_log_impl(&dword_1DD34E000, v46, OS_LOG_TYPE_DEFAULT, "Commit nested transaction (%@). Remaining: %@", buf, 0x16u);

      }
    }
    v22 = 0;
  }

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "unlock");

  NAEmptyResult();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "finishWithResult:", v39);

}

- (void)setOpenTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_openTransaction, a3);
}

- (void)_transactionLock_executeWriteTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  void (**v46)(_QWORD);
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  os_activity_scope_state_s state;
  id location;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!v6)
    NSLog(CFSTR("nil transaction"));
  objc_msgSend(v6, "writeCharacteristicRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v6, "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (v11)
    {
      HFLogForCategory(0x38uLL);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        -[HFCharacteristicValueManager valueWriter](self, "valueWriter");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "writeCharacteristicRequests");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "hf_prettyDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v57 = v37;
        v58 = 2112;
        v59 = v39;
        _os_log_impl(&dword_1DD34E000, v36, OS_LOG_TYPE_DEFAULT, "Start executing write with writer:%@. Characteristic requests:%@", buf, 0x16u);

      }
    }
    else
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v6, "logger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "loggerActivity");
      v13 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v13, &state);

      HFLogForCategory(0x38uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[HFCharacteristicValueManager valueWriter](self, "valueWriter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "writeCharacteristicRequests");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hf_prettyDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v57 = v15;
        v58 = 2112;
        v59 = v17;
        _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Start executing write with writer:%@. Characteristic requests:%@", buf, 0x16u);

      }
      os_activity_scope_leave(&state);
    }
    -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lock");

    objc_msgSend(v6, "writeCharacteristicRequests");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");

    objc_msgSend(v20, "na_map:", &__block_literal_global_145);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unlock");

    -[HFCharacteristicValueManager valueWriter](self, "valueWriter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hf_home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = MEMORY[0x1E0C809B0];
    if (v23)
    {
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v24;
      v51[1] = 3221225472;
      v51[2] = __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_2;
      v51[3] = &unk_1EA7277C8;
      v52 = v23;
      v53 = v40;
      objc_msgSend(v25, "dispatchHomeObserverMessage:sender:", v51, 0);

    }
    v26 = (void *)MEMORY[0x1E0CBA460];
    objc_msgSend(v20, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "characteristicBatchRequestWithWriteRequests:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v24;
    v48[1] = 3221225472;
    v48[2] = __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_3;
    v48[3] = &unk_1EA72BEB8;
    v30 = v6;
    v49 = v30;
    v31 = v29;
    v50 = v31;
    objc_msgSend(v28, "setProgressHandler:", v48);
    v41[0] = v24;
    v41[1] = 3221225472;
    v41[2] = __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_151;
    v41[3] = &unk_1EA72BF30;
    objc_copyWeak(&v47, &location);
    v42 = v30;
    v32 = v31;
    v43 = v32;
    v33 = v20;
    v44 = v33;
    v34 = v23;
    v45 = v34;
    v46 = v7;
    objc_msgSend(v28, "setCompletionHandler:", v41);
    -[HFCharacteristicValueManager valueWriter](self, "valueWriter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "performBatchCharacteristicRequest:", v28);

    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v7[2](v7);
  }

}

void __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  os_activity_scope_state_s state;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(*(id *)(a1 + 32), "writeCharacteristicRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(*(id *)(a1 + 32), "logger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loggerActivity");
      v8 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v8, &state);

      HFLogForCategory(0x38uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Finished write execution", v12, 2u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(state.opaque[0]) = 0;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Finished write execution", (uint8_t *)&state, 2u);
      }

    }
  }
  objc_msgSend(WeakRetained, "transactionLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_transactionLock_executeReadTransaction:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  _QWORD block[5];
  id v19;
  SEL v20;

  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  if (!v7)
    NSLog(CFSTR("Nil transaction"));
  objc_msgSend(v7, "characteristicsToRead");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lock");

    -[HFCharacteristicValueManager readTransactionsToExecuteOnNextRunLoop](self, "readTransactionsToExecuteOnNextRunLoop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v7);

    -[HFCharacteristicValueManager completionHandlersForReadTransactionsToExecuteOnNextRunLoop](self, "completionHandlersForReadTransactionsToExecuteOnNextRunLoop");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v13, "addObject:", v14);

    -[HFCharacteristicValueManager readTransactionsToExecuteOnNextRunLoop](self, "readTransactionsToExecuteOnNextRunLoop");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unlock");

    if (v16 <= 1)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke;
      block[3] = &unk_1EA727778;
      block[4] = self;
      v20 = a2;
      v19 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else if (v8)
  {
    v8[2](v8);
  }

}

- (void)_transactionLock_executeActionsTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  void (**v43)(_QWORD);
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  os_activity_scope_state_s state;
  id location;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!v6)
    NSLog(CFSTR("Nil transaction"));
  objc_msgSend(v6, "actionsToExecute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v6, "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (v11)
    {
      HFLogForCategory(0x38uLL);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        -[HFCharacteristicValueManager valueWriter](self, "valueWriter");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "actionsToExecute");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "hf_prettyDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v51 = v35;
        v52 = 2112;
        v53 = v37;
        _os_log_impl(&dword_1DD34E000, v34, OS_LOG_TYPE_DEFAULT, "Start executing actions with writer:%@. Action sets:%@", buf, 0x16u);

      }
    }
    else
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v6, "logger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "loggerActivity");
      v13 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v13, &state);

      HFLogForCategory(0x38uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[HFCharacteristicValueManager valueWriter](self, "valueWriter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "actionsToExecute");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hf_prettyDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v51 = v15;
        v52 = 2112;
        v53 = v17;
        _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Start executing actions with writer:%@. Action sets:%@", buf, 0x16u);

      }
      os_activity_scope_leave(&state);
    }
    -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lock");

    -[HFCharacteristicValueManager _transactionLock_characteristicsWithPendingWritesInTransacton:includeDirectWrites:includeActionSets:includeActions:](self, "_transactionLock_characteristicsWithPendingWritesInTransacton:includeDirectWrites:includeActionSets:includeActions:", v6, 0, 0, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unlock");

    -[HFCharacteristicValueManager valueWriter](self, "valueWriter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hf_home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C809B0];
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __93__HFCharacteristicValueManager__transactionLock_executeActionsTransaction_completionHandler___block_invoke;
      v45[3] = &unk_1EA7277C8;
      v25 = v22;
      v46 = v25;
      v26 = v19;
      v47 = v26;
      objc_msgSend(v23, "dispatchHomeObserverMessage:sender:", v45, 0);

      objc_msgSend(v6, "actionsToExecute");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v27, "copy");

      -[HFCharacteristicValueManager valueWriter](self, "valueWriter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v24;
      v38[1] = 3221225472;
      v38[2] = __93__HFCharacteristicValueManager__transactionLock_executeActionsTransaction_completionHandler___block_invoke_2;
      v38[3] = &unk_1EA72BF30;
      objc_copyWeak(&v44, &location);
      v39 = v6;
      v30 = v28;
      v40 = v30;
      v41 = v25;
      v42 = v26;
      v43 = v7;
      objc_msgSend(v29, "executeActions:completionHandler:", v30, v38);

      objc_destroyWeak(&v44);
    }
    else
    {
      -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lock");

      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setActionsError:", v32);

      -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "unlock");

      if (v7)
        v7[2](v7);
    }

    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (void)_transactionLock_executeActionSetTransaction:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void (**v45)(_QWORD);
  id obj;
  void *v47;
  void *v48;
  void *v50;
  _QWORD block[4];
  id v52;
  id v53;
  HFCharacteristicValueManager *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  void (**v60)(_QWORD);
  id v61;
  _QWORD v62[4];
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  NSObject *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  os_activity_scope_state_s state;
  id location;
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v45 = (void (**)(_QWORD))a4;
  if (!v5)
    NSLog(CFSTR("Nil transaction"));
  v50 = v5;
  objc_msgSend(v5, "actionSetsToExecute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v50, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (v9)
    {
      HFLogForCategory(0x38uLL);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        -[HFCharacteristicValueManager valueWriter](self, "valueWriter");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "actionSetsToExecute");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "hf_prettyDescription");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v86 = v40;
        v87 = 2112;
        v88 = v42;
        _os_log_impl(&dword_1DD34E000, v39, OS_LOG_TYPE_DEFAULT, "Start executing action sets with writer:%@. Action sets:%@", buf, 0x16u);

      }
    }
    else
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v50, "logger");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loggerActivity");
      v11 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v11, &state);

      HFLogForCategory(0x38uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[HFCharacteristicValueManager valueWriter](self, "valueWriter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "actionSetsToExecute");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hf_prettyDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v86 = v13;
        v87 = 2112;
        v88 = v15;
        _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Start executing action sets with writer:%@. Action sets:%@", buf, 0x16u);

      }
      os_activity_scope_leave(&state);
    }
    -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lock");

    -[HFCharacteristicValueManager _transactionLock_characteristicsWithPendingWritesInTransacton:includeDirectWrites:includeActionSets:includeActions:](self, "_transactionLock_characteristicsWithPendingWritesInTransacton:includeDirectWrites:includeActionSets:includeActions:", v50, 0, 1, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unlock");

    -[HFCharacteristicValueManager valueWriter](self, "valueWriter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_home");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke;
      v79[3] = &unk_1EA7277C8;
      v20 = v44;
      v80 = v20;
      v81 = v50;
      objc_msgSend(v19, "dispatchHomeObserverMessage:sender:", v79, 0);

      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_2;
      v76[3] = &unk_1EA7277C8;
      v77 = v20;
      v78 = v43;
      objc_msgSend(v21, "dispatchHomeObserverMessage:sender:", v76, 0);

    }
    v22 = dispatch_group_create();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    objc_msgSend(v50, "actionSetsToExecute");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (id)objc_msgSend(v26, "copy");

    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v73;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v73 != v28)
            objc_enumerationMutation(obj);
          v30 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v29);
          dispatch_group_enter(v22);
          -[HFCharacteristicValueManager valueWriter](self, "valueWriter");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_3;
          v62[3] = &unk_1EA72C0C8;
          objc_copyWeak(&v71, &location);
          v63 = v50;
          v64 = v30;
          v65 = v48;
          v66 = v23;
          v67 = v25;
          v68 = v47;
          v69 = v24;
          v70 = v22;
          objc_msgSend(v31, "executeActionSet:completionHandler:", v30, v62);

          objc_destroyWeak(&v71);
          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
      }
      while (v27);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_192;
    block[3] = &unk_1EA72C0F0;
    objc_copyWeak(&v61, &location);
    v52 = v50;
    v53 = v48;
    v54 = self;
    v55 = v24;
    v56 = v44;
    v57 = v25;
    v58 = v47;
    v59 = v23;
    v60 = v45;
    v32 = v23;
    v33 = v47;
    v34 = v25;
    v35 = v44;
    v36 = v24;
    v37 = v48;
    dispatch_group_notify(v22, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v61);
    objc_destroyWeak(&location);
    v38 = v45;
  }
  else
  {
    v38 = v45;
    if (v45)
      v45[2](v45);
  }

}

uint64_t __76__HFCharacteristicValueManager__overrideCachedValueForCharacteristic_value___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "characteristicType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB89C8]);

  return v3;
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id WeakRetained;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _BYTE *v49;
  id v50;
  _QWORD aBlock[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _BYTE *v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  _BYTE *v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  os_activity_scope_state_s state;
  id location;
  _BYTE buf[24];
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "set_debug_totalNumberOfIssuedBatchReadRequests:", objc_msgSend(*(id *)(a1 + 32), "_debug_totalNumberOfIssuedBatchReadRequests") + 1);
  objc_msgSend(*v2, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(*v2, "readTransactionsToExecuteOnNextRunLoop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(*v2, "completionHandlersForReadTransactionsToExecuteOnNextRunLoop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(*v2, "readTransactionsToExecuteOnNextRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  objc_msgSend(*v2, "completionHandlersForReadTransactionsToExecuteOnNextRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HFCharacteristicValueManager.m"), 1125, CFSTR("Inconsistant state: readTransactionsToExecute should always be non-empty on the next run loop"));

  }
  objc_msgSend(v5, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_map:", &__block_literal_global_169);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_setByFlattening");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "transactionLock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unlock");

  if (+[HFCharacteristicValueManager _shouldTrackReadsCompleteForPerformanceTesting](HFCharacteristicValueManager, "_shouldTrackReadsCompleteForPerformanceTesting"))
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_beginReadsCompleteTrackingForCharacteristics:withLogger:", v14, v17);

  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (v11)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(v11, "loggerActivity");
    v18 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v18, &state);

    HFLogForCategory(0x38uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "valueReader");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hf_prettyDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "Start executing read with reader:%@. Characteristics to read:%@", buf, 0x16u);

    }
    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x38uLL);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "valueReader");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hf_prettyDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v43;
      _os_log_impl(&dword_1DD34E000, v41, OS_LOG_TYPE_DEFAULT, "Start executing read with reader:%@. Characteristics to read:%@", buf, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "valueReader");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hf_home");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)&state, v23);

  WeakRetained = objc_loadWeakRetained((id *)&state);
  if (WeakRetained)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_171;
    v67[3] = &unk_1EA72BF98;
    objc_copyWeak(&v69, (id *)&state);
    v68 = v14;
    objc_msgSend(v25, "dispatchHomeObserverMessage:sender:", v67, 0);

    objc_destroyWeak(&v69);
  }
  objc_msgSend(v14, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "na_map:", &__block_literal_global_176);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBA460], "characteristicBatchRequestWithReadRequests:", v45);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v73 = 0;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_3;
  v60[3] = &unk_1EA72C050;
  objc_copyWeak(&v65, &location);
  v64 = buf;
  v28 = v11;
  v61 = v28;
  v62 = *(id *)(a1 + 40);
  v29 = v5;
  v63 = v29;
  objc_copyWeak(&v66, (id *)&state);
  objc_msgSend(v27, "setProgressHandler:", v60);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_4;
  aBlock[3] = &unk_1EA72C078;
  objc_copyWeak(&v58, &location);
  v57 = buf;
  v30 = v28;
  v52 = v30;
  v44 = v29;
  v53 = v44;
  v31 = v14;
  v54 = v31;
  v55 = *(id *)(a1 + 40);
  objc_copyWeak(&v59, (id *)&state);
  v32 = v7;
  v56 = v32;
  v33 = _Block_copy(aBlock);
  objc_msgSend(v27, "setCompletionHandler:", v33);
  objc_msgSend(*(id *)(a1 + 32), "valueReader");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "performBatchCharacteristicRequest:", v27);

  *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "transactionLock");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "lock");

  objc_msgSend(*(id *)(a1 + 32), "inFlightReadCancelationToken");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_189;
  v46[3] = &unk_1EA72C0A0;
  objc_copyWeak(&v50, &location);
  v49 = buf;
  v37 = v30;
  v47 = v37;
  v38 = v33;
  v48 = v38;
  objc_msgSend(v36, "addCancelationBlock:", v46);

  objc_msgSend(*(id *)(a1 + 32), "transactionLock");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "unlock");

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v59);

  objc_destroyWeak(&v58);
  objc_destroyWeak(&v66);

  objc_destroyWeak(&v65);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak((id *)&state);
  objc_destroyWeak(&location);

}

- (NSMutableArray)readTransactionsToExecuteOnNextRunLoop
{
  return self->_readTransactionsToExecuteOnNextRunLoop;
}

- (NSMutableArray)completionHandlersForReadTransactionsToExecuteOnNextRunLoop
{
  return self->_completionHandlersForReadTransactionsToExecuteOnNextRunLoop;
}

- (void)set_debug_totalNumberOfIssuedBatchReadRequests:(int64_t)a3
{
  self->__debug_totalNumberOfIssuedBatchReadRequests = a3;
}

- (NACancelationToken)inFlightReadCancelationToken
{
  return self->_inFlightReadCancelationToken;
}

- (int64_t)_debug_totalNumberOfIssuedBatchReadRequests
{
  return self->__debug_totalNumberOfIssuedBatchReadRequests;
}

- (void)_beginReadsCompleteTrackingForCharacteristics:(id)a3 withLogger:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HFCharacteristicReadLogger *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  os_activity_scope_state_s v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  HFCharacteristicValueManager *v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HFCharacteristicValueManager readsCompleteLogger](self, "readsCompleteLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(HFCharacteristicReadLogger);
    -[HFCharacteristicValueManager setReadsCompleteLogger:](self, "setReadsCompleteLogger:", v9);

  }
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __89__HFCharacteristicValueManager__beginReadsCompleteTrackingForCharacteristics_withLogger___block_invoke;
  v30 = &unk_1EA72C168;
  v31 = self;
  v10 = v7;
  v32 = v10;
  objc_msgSend(v6, "na_each:", &v27);
  if (v10)
  {
    objc_msgSend(v10, "loggerActivity", 0, 0, v27, v28, v29, v30, v31);
    v11 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v11, &v26);

    HFLogForCategory(0x38uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HFCharacteristicValueManager readsCompleteLogger](self, "readsCompleteLogger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "numberOfAccessoriesForTransportType:", 0);
      -[HFCharacteristicValueManager readsCompleteLogger](self, "readsCompleteLogger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "numberOfAccessoriesForTransportType:", 1);
      -[HFCharacteristicValueManager readsCompleteLogger](self, "readsCompleteLogger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "numberOfAccessoriesForTransportType:", 2);
      *(_DWORD *)buf = 134218496;
      v34 = v14;
      v35 = 2048;
      v36 = v16;
      v37 = 2048;
      v38 = v18;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: Beginning reads for %lu IP accessories, %lu BLE accessories, %lu other.", buf, 0x20u);

    }
    os_activity_scope_leave(&v26);
  }
  else
  {
    HFLogForCategory(0x38uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[HFCharacteristicValueManager readsCompleteLogger](self, "readsCompleteLogger");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "numberOfAccessoriesForTransportType:", 0);
      -[HFCharacteristicValueManager readsCompleteLogger](self, "readsCompleteLogger");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "numberOfAccessoriesForTransportType:", 1);
      -[HFCharacteristicValueManager readsCompleteLogger](self, "readsCompleteLogger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "numberOfAccessoriesForTransportType:", 2);
      *(_DWORD *)buf = 134218496;
      v34 = v21;
      v35 = 2048;
      v36 = v23;
      v37 = 2048;
      v38 = v25;
      _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: Beginning reads for %lu IP accessories, %lu BLE accessories, %lu other.", buf, 0x20u);

    }
  }

}

- (void)setReadsCompleteLogger:(id)a3
{
  objc_storeStrong((id *)&self->_readsCompleteLogger, a3);
}

void __89__HFCharacteristicValueManager__beginReadsCompleteTrackingForCharacteristics_withLogger___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "readsCompleteLogger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addCharacteristic:withUpdateLogger:", v4, *(_QWORD *)(a1 + 40));

}

- (void)_endReadsCompleteTrackingForCharacteristic:(id)a3 withLogger:(id)a4 didRead:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  os_activity_scope_state_s v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v5)
  {
    if (v9)
    {
      objc_msgSend(v9, "loggerActivity", 0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v11, &v24);

      HFLogForCategory(0x38uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "service");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "accessory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v8;
        v27 = 2112;
        v28 = v15;
        v16 = "Reads Complete Tracking: Read characteristic %@ from %@";
LABEL_8:
        _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
    HFLogForCategory(0x38uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "service");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "accessory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v8;
      v27 = 2112;
      v28 = v22;
      v23 = "Reads Complete Tracking: Read characteristic %@ from %@";
LABEL_15:
      _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v9)
  {
    HFLogForCategory(0x38uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "service");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "accessory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v8;
      v27 = 2112;
      v28 = v22;
      v23 = "Reads Complete Tracking: No read response for characteristic %@ from %@ (ignoring)";
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_10;
  }
  objc_msgSend(v9, "loggerActivity", 0, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v17, &v24);

  HFLogForCategory(0x38uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "service");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v8;
    v27 = 2112;
    v28 = v15;
    v16 = "Reads Complete Tracking: No read response for characteristic %@ from %@ (ignoring)";
    goto LABEL_8;
  }
LABEL_9:

  os_activity_scope_leave(&v24);
LABEL_10:
  -[HFCharacteristicValueManager readsCompleteLogger](self, "readsCompleteLogger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "markCharacteristicAsRead:withLogger:", v8, v10);

}

- (HFCharacteristicReadLogger)readsCompleteLogger
{
  return self->_readsCompleteLogger;
}

uint64_t __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicsToRead");
}

- (id)cachedErrorForExecutionOfActionSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    -[HFCharacteristicValueManager cachedExecutionErrorsKeyedByActionSetIdentifier](self, "cachedExecutionErrorsKeyedByActionSetIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlock");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)cachedExecutionErrorsKeyedByActionSetIdentifier
{
  return self->_cachedExecutionErrorsKeyedByActionSetIdentifier;
}

void __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "cacheManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsTransactionsExecutingActionSet:", v6);

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 2uLL;
    *a3 = 1;
  }
}

- (BOOL)isNaturalLightingEnabledForProfile:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;

  v3 = a3;
  if (+[HFUtilities isRunningInStoreDemoMode](HFUtilities, "isRunningInStoreDemoMode")
    || +[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    objc_getAssociatedObject(v3, "HF_NaturalLightDemoMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    objc_msgSend(v3, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isNaturalLightingEnabled");
  }
  v6 = v5;

  return v6;
}

- (HFCharacteristicValueManager)initWithValueReader:(id)a3 valueWriter:(id)a4
{
  id v6;
  id v7;
  HFCharacteristicValueManager *v8;
  HFCharacteristicValueManager *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HFCharacteristicValueCacheManager *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NAFuture *v22;
  NAFuture *firstReadCompleteFuture;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HFCharacteristicValueManager;
  v8 = -[HFCharacteristicValueManager init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HFCharacteristicValueManager setValueReader:](v8, "setValueReader:", v6);
    -[HFCharacteristicValueManager setValueWriter:](v9, "setValueWriter:", v7);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager setRunningTransactions:](v9, "setRunningTransactions:", v10);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager setReadTransactionsToExecuteOnNextRunLoop:](v9, "setReadTransactionsToExecuteOnNextRunLoop:", v11);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager setCompletionHandlersForReadTransactionsToExecuteOnNextRunLoop:](v9, "setCompletionHandlersForReadTransactionsToExecuteOnNextRunLoop:", v12);

    v13 = objc_alloc_init(MEMORY[0x1E0CB38E0]);
    -[HFCharacteristicValueManager setTransactionLock:](v9, "setTransactionLock:", v13);

    -[HFCharacteristicValueManager transactionLock](v9, "transactionLock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setName:", CFSTR("com.apple.Home.valueManager.transactionLock"));

    v15 = objc_alloc_init(HFCharacteristicValueCacheManager);
    -[HFCharacteristicValueManager setCacheManager:](v9, "setCacheManager:", v15);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager setMutableAllReadCharacteristics:](v9, "setMutableAllReadCharacteristics:", v16);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager setCharacteristicsWithCachedValues:](v9, "setCharacteristicsWithCachedValues:", v17);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager setCachedReadErrorsKeyedByCharacteristicIdentifier:](v9, "setCachedReadErrorsKeyedByCharacteristicIdentifier:", v18);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager setCachedWriteErrorsKeyedByCharacteristicIdentifier:](v9, "setCachedWriteErrorsKeyedByCharacteristicIdentifier:", v19);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager setCachedExecutionErrorsKeyedByActionSetIdentifier:](v9, "setCachedExecutionErrorsKeyedByActionSetIdentifier:", v20);

    v21 = objc_alloc_init(MEMORY[0x1E0D51990]);
    -[HFCharacteristicValueManager setInFlightReadCancelationToken:](v9, "setInFlightReadCancelationToken:", v21);

    v22 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    firstReadCompleteFuture = v9->_firstReadCompleteFuture;
    v9->_firstReadCompleteFuture = v22;

  }
  return v9;
}

- (void)setValueWriter:(id)a3
{
  objc_storeStrong((id *)&self->_valueWriter, a3);
}

- (void)setValueReader:(id)a3
{
  objc_storeStrong((id *)&self->_valueReader, a3);
}

- (void)setTransactionLock:(id)a3
{
  objc_storeStrong((id *)&self->_transactionLock, a3);
}

- (void)setRunningTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_runningTransactions, a3);
}

- (void)setReadTransactionsToExecuteOnNextRunLoop:(id)a3
{
  objc_storeStrong((id *)&self->_readTransactionsToExecuteOnNextRunLoop, a3);
}

- (void)setMutableAllReadCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_mutableAllReadCharacteristics, a3);
}

- (void)setCompletionHandlersForReadTransactionsToExecuteOnNextRunLoop:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlersForReadTransactionsToExecuteOnNextRunLoop, a3);
}

- (void)setCharacteristicsWithCachedValues:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicsWithCachedValues, a3);
}

- (void)setCachedWriteErrorsKeyedByCharacteristicIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedWriteErrorsKeyedByCharacteristicIdentifier, a3);
}

- (void)setCachedReadErrorsKeyedByCharacteristicIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedReadErrorsKeyedByCharacteristicIdentifier, a3);
}

- (void)setCachedExecutionErrorsKeyedByActionSetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedExecutionErrorsKeyedByActionSetIdentifier, a3);
}

- (void)setCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_cacheManager, a3);
}

void __43__HFCharacteristicValueManager_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D519C8], "buildPointerIdentity");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378ED0;
  qword_1ED378ED0 = v0;

}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  __CFString *v3;
  id WeakRetained;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  unint64_t v26;
  const __CFString *v27;
  __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  BOOL v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  unint64_t v46;
  const __CFString *v47;
  NSObject *v48;
  id obj;
  __CFString *v50;
  void *v51;
  __CFString *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  __CFString *v58;
  id v59;
  _QWORD v60[4];
  id v61;
  void *v62;
  id v63;
  __CFString *v64;
  __CFString *v65;
  __CFString *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  const __CFString *v79;
  os_activity_scope_state_s state;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v51 = WeakRetained;
  v52 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 1)
  {
    v5 = WeakRetained;
    v6 = -[__CFString na_isCancelledError](v3, "na_isCancelledError");
    v7 = 2;
    if (!v6)
      v7 = 3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v7;
    objc_msgSend(v5, "transactionLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lock");

    v9 = *(void **)(a1 + 32);
    if (v9)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v9, "loggerActivity");
      v10 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v10, &state);

      HFLogForCategory(0x38uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v79 = v3;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Finished batch read with error: %@", buf, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v3;
        _os_log_impl(&dword_1DD34E000, v44, OS_LOG_TYPE_DEFAULT, "Finished batch read with error: %@", (uint8_t *)&state, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v13 = *(id *)(a1 + 40);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v72 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend(v17, "setOverallReadError:", v52);
          objc_msgSend(v17, "readFuturesKeyedByCharacteristicIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "copy");
          objc_msgSend(v12, "addObject:", v19);

          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setCharacteristicsToRead:", v20);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      }
      while (v14);
    }

    objc_msgSend(v51, "transactionLock");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unlock");

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      v22 = v52;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v28 = v22;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v12;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v68 != v30)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_186;
          v60[3] = &unk_1EA72BEE0;
          v61 = *(id *)(a1 + 48);
          v62 = v51;
          v63 = *(id *)(a1 + 56);
          v64 = v52;
          v65 = v50;
          v66 = v28;
          objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v60);

        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v29);
    }

    v33 = objc_loadWeakRetained((id *)(a1 + 88));
    if (v33)
    {
      v34 = -[__CFString count](v50, "count") == 0;

      if (!v34)
      {
        v35 = *(void **)(a1 + 32);
        if (v35)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          objc_msgSend(v35, "loggerActivity");
          v36 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v36, &state);

          HFLogForCategory(0x38uLL);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v79 = v50;
            _os_log_impl(&dword_1DD34E000, v37, OS_LOG_TYPE_ERROR, "Warning: did not get read responses for characteristics: %@", buf, 0xCu);
          }

          os_activity_scope_leave(&state);
        }
        else
        {
          HFLogForCategory(0x38uLL);
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            LODWORD(state.opaque[0]) = 138412290;
            *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v50;
            _os_log_impl(&dword_1DD34E000, v48, OS_LOG_TYPE_ERROR, "Warning: did not get read responses for characteristics: %@", (uint8_t *)&state, 0xCu);
          }

        }
        +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_188;
        v57[3] = &unk_1EA72BF98;
        objc_copyWeak(&v59, (id *)(a1 + 88));
        v58 = v50;
        objc_msgSend(v38, "dispatchHomeObserverMessage:sender:", v57, 0);

        objc_destroyWeak(&v59);
      }
    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v39 = *(id *)(a1 + 64);
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v53, v75, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v40; ++k)
        {
          if (*(_QWORD *)v54 != v41)
            objc_enumerationMutation(v39);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k) + 16))();
        }
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v53, v75, 16);
      }
      while (v40);
    }

    objc_msgSend(v51, "firstReadCompleteFuture");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "finishWithNoResult");

  }
  else
  {
    v23 = *(void **)(a1 + 32);
    if (v23)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v23, "loggerActivity");
      v24 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v24, &state);

      HFLogForCategory(0x38uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) - 1;
        if (v26 > 2)
          v27 = CFSTR("NotStarted");
        else
          v27 = off_1EA72C218[v26];
        *(_DWORD *)buf = 138412290;
        v79 = v27;
        _os_log_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_DEFAULT, "Not processing characteristic read completion handler because the batch request is not in flight. Current state: %@", buf, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) - 1;
        if (v46 > 2)
          v47 = CFSTR("NotStarted");
        else
          v47 = off_1EA72C218[v46];
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v47;
        _os_log_impl(&dword_1DD34E000, v45, OS_LOG_TYPE_DEFAULT, "Not processing characteristic read completion handler because the batch request is not in flight. Current state: %@", (uint8_t *)&state, 0xCu);
      }

    }
  }

}

- (NAFuture)firstReadCompleteFuture
{
  return self->_firstReadCompleteFuture;
}

- (id)writeNaturalLightEnabledState:(BOOL)a3 forProfile:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;
  _QWORD v16[4];
  id v17;
  id buf;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (+[HFUtilities isRunningInStoreDemoMode](HFUtilities, "isRunningInStoreDemoMode")
    || +[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v5, "HF_NaturalLightDemoMode", v6, (void *)1);

    HFLogForCategory(0x38uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109378;
      HIDWORD(buf) = v4;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Updating natural light state IN DEMO MODE to %{BOOL}d for profile: %@", (uint8_t *)&buf, 0x12u);
    }

    objc_initWeak(&buf, v5);
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke;
    v16[3] = &unk_1EA729188;
    objc_copyWeak(&v17, &buf);
    objc_msgSend(v8, "dispatchLightObserverMessage:sender:", v16, 0);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v17);
    objc_destroyWeak(&buf);
  }
  else if (v4)
  {
    objc_initWeak(&buf, v5);
    v11 = (void *)MEMORY[0x1E0D519C0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_2;
    v12[3] = &unk_1EA7291B0;
    v15 = v4;
    v13 = v5;
    objc_copyWeak(&v14, &buf);
    objc_msgSend(v11, "futureWithBlock:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v14);

    objc_destroyWeak(&buf);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lightProfile:didUpdateSettings:", WeakRetained, v4);

}

void __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x38uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(a1 + 48);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Updating natural light state to %{BOOL}d for profile: %@ %@", buf, 0x1Cu);

  }
  v8 = *(void **)(a1 + 32);
  v9 = *(_BYTE *)(a1 + 48) != 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_72;
  v10[3] = &unk_1EA727818;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  objc_msgSend(v8, "setNaturalLightingEnabled:completionHandler:", v9, v10);
  objc_msgSend(v3, "finishWithNoResult");
  objc_destroyWeak(&v11);

}

void __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory(0x38uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      *(_DWORD *)buf = 138412546;
      v10 = WeakRetained;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Error updating natural light state for profile %@. Error: %@", buf, 0x16u);

    }
  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_73;
  v7[3] = &unk_1EA729188;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  objc_msgSend(v6, "dispatchLightObserverMessage:sender:", v7, 0);

  objc_destroyWeak(&v8);
}

void __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_73(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lightProfile:didUpdateSettings:", WeakRetained, v4);

}

- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 lightProfile:(id)a4 completion:(id)a5
{
  FetchNaturalLightColorTemperatureForBrightness(a3, a4, a5);
}

- (NSSet)characteristicsWithPendingReads
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HFCharacteristicValueManager *v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueManager runningTransactions](self, "runningTransactions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v20 = self;
  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeAddObject:", v7);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "characteristicsToRead");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "characteristicsToRead");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = v12;
          v21[1] = 3221225472;
          v21[2] = __63__HFCharacteristicValueManager_characteristicsWithPendingReads__block_invoke;
          v21[3] = &unk_1EA72BB50;
          v21[4] = v14;
          objc_msgSend(v16, "na_filter:", v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v17);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  -[HFCharacteristicValueManager transactionLock](v20, "transactionLock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unlock");

  return (NSSet *)v4;
}

uint64_t __63__HFCharacteristicValueManager_characteristicsWithPendingReads__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "readFuturesKeyedByCharacteristicIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFinished") ^ 1;

  return v7;
}

- (NSSet)characteristicsWithPendingWrites
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueManager runningTransactions](self, "runningTransactions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeAddObject:", v7);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        -[HFCharacteristicValueManager _transactionLock_characteristicsWithPendingWritesInTransacton:includeDirectWrites:includeActionSets:includeActions:](self, "_transactionLock_characteristicsWithPendingWritesInTransacton:includeDirectWrites:includeActionSets:includeActions:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), 1, 1, 1, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unlock");

  return (NSSet *)v4;
}

void __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "testingOverrideLoadingStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v10)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v9 = objc_msgSend(v10, "unsignedIntegerValue") | v8;
    v7 = v10;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
  }

}

void __74__HFCharacteristicValueManager_loadingStateForCharacteristics_actionSets___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "testingOverrideLoadingStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v10)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v9 = objc_msgSend(v10, "unsignedIntegerValue") | v8;
    v7 = v10;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
  }

}

uint64_t __74__HFCharacteristicValueManager_loadingStateForCharacteristics_actionSets___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __74__HFCharacteristicValueManager_loadingStateForCharacteristics_actionSets___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_transactionLock_characteristicsWithPendingWritesInTransacton:(id)a3 includeDirectWrites:(BOOL)a4 includeActionSets:(BOOL)a5 includeActions:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v9, "writeCharacteristicRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v9, "writeCharacteristicRequests");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v46;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v46 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v16), "characteristic");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "na_safeAddObject:", v17);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v14);
      }

    }
  }
  if (v7)
  {
    objc_msgSend(v9, "actionSetsToExecute");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v9, "actionSetsToExecute");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v42;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v42 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v23), "hf_affectedCharacteristics");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              objc_msgSend(v10, "unionSet:", v24);

            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        }
        while (v21);
      }

    }
  }
  if (v6)
  {
    objc_msgSend(v9, "actionsToExecute");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v9, "actionsToExecute", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v38;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v38 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v30);
            objc_opt_class();
            v32 = v31;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v33 = v32;
            else
              v33 = 0;
            v34 = v33;

            objc_msgSend(v34, "characteristic");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "na_safeAddObject:", v35);

            ++v30;
          }
          while (v28 != v30);
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        }
        while (v28);
      }

    }
  }

  return v10;
}

- (void)beginTransactionWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  -[HFCharacteristicValueManager beginTransactionWithReason:readPolicy:logger:](self, "beginTransactionWithReason:readPolicy:logger:", v4, v5, 0);

}

id __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_95(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  HFCharacteristicReadResponse *v8;
  void *v9;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "cachedValueForCharacteristic:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D519C0];
  v8 = -[HFCharacteristicReadResponse initWithHomeKitResponse:value:readTraits:]([HFCharacteristicReadResponse alloc], "initWithHomeKitResponse:value:readTraits:", v4, v6, *(_QWORD *)(a1 + 40));

  objc_msgSend(v7, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_99(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  HFCharacteristicReadResponse *v8;
  void *v9;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "cachedValueForCharacteristic:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D519C0];
  v8 = -[HFCharacteristicReadResponse initWithHomeKitResponse:value:readTraits:]([HFCharacteristicReadResponse alloc], "initWithHomeKitResponse:value:readTraits:", v4, v6, *(_QWORD *)(a1 + 40));

  objc_msgSend(v7, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_100(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  HFCharacteristicReadResponse *v8;
  void *v9;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "cachedValueForCharacteristic:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D519C0];
  v8 = -[HFCharacteristicReadResponse initWithHomeKitResponse:value:readTraits:]([HFCharacteristicReadResponse alloc], "initWithHomeKitResponse:value:readTraits:", v4, v6, *(_QWORD *)(a1 + 40));

  objc_msgSend(v7, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  HFCharacteristicReadResponse *v8;
  void *v9;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "cachedValueForCharacteristic:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D519C0];
  v8 = -[HFCharacteristicReadResponse initWithCharacteristic:readTraits:value:error:]([HFCharacteristicReadResponse alloc], "initWithCharacteristic:readTraits:value:error:", a1[5], a1[6], v6, v5);

  objc_msgSend(v7, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)writeValue:(id)a3 forCharacteristic:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  int v46;
  BOOL v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  SEL v80;
  uint64_t v81;
  void *v82;
  HFCharacteristicValueManager *v83;
  id v84;
  void *v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t v99[128];
  uint8_t buf[4];
  void *v101;
  os_activity_scope_state_s state;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueManager.m"), 497, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characteristic != nil"));

  }
  v80 = a2;
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lock");

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  -[HFCharacteristicValueManager runningTransactions](self, "runningTransactions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reverseObjectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = self;
  v84 = v7;
  v85 = v9;
  v86 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
  if (!v86)
  {
LABEL_30:

    goto LABEL_31;
  }
  v13 = *(_QWORD *)v96;
  v81 = *(_QWORD *)v96;
  v82 = v12;
LABEL_5:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v96 != v13)
      objc_enumerationMutation(v12);
    v15 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v14);
    objc_msgSend(v15, "writeFuturesKeyedByCharacteristicIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17 || (objc_msgSend(v17, "isFinished") & 1) != 0)
      goto LABEL_19;
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    objc_msgSend(v15, "writeCharacteristicRequests");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
    if (v19)
      break;
LABEL_18:

    self = v83;
    v7 = v84;
    v9 = v85;
    v13 = v81;
    v12 = v82;
LABEL_19:

    if (++v14 == v86)
    {
      v86 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
      if (v86)
        goto LABEL_5;
      goto LABEL_30;
    }
  }
  v20 = v19;
  v21 = *(_QWORD *)v92;
LABEL_12:
  v22 = 0;
  while (1)
  {
    if (*(_QWORD *)v92 != v21)
      objc_enumerationMutation(v18);
    v23 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v22);
    objc_msgSend(v23, "characteristic");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqual:", v8);

    if ((v25 & 1) != 0)
      break;
    if (v20 == ++v22)
    {
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
      if (v20)
        goto LABEL_12;
      goto LABEL_18;
    }
  }
  objc_msgSend(v23, "value");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v84;
  v27 = objc_msgSend(v26, "isEqual:", v84);

  if ((v27 & 1) == 0)
  {

    v12 = v82;
    self = v83;
    v9 = v85;
    goto LABEL_30;
  }
  self = v83;
  -[HFCharacteristicValueManager openTransaction](v83, "openTransaction");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "logger");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    -[HFCharacteristicValueManager openTransaction](v83, "openTransaction");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "logger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "loggerActivity");
    v32 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v32, &state);

    HFLogForCategory(0x38uLL);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "hf_prettyDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v101 = v34;
      _os_log_impl(&dword_1DD34E000, v33, OS_LOG_TYPE_DEFAULT, "Duplicate write: %@", buf, 0xCu);

    }
    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x38uLL);
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "hf_prettyDescription");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v77;
      _os_log_impl(&dword_1DD34E000, v76, OS_LOG_TYPE_DEFAULT, "Duplicate write: %@", (uint8_t *)&state, 0xCu);

    }
  }
  v9 = v85;
  objc_msgSend(v17, "flatMap:", &__block_literal_global_46);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
    goto LABEL_60;
LABEL_31:
  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
    goto LABEL_55;
  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "writeFuturesKeyedByCharacteristicIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", v9);
  v39 = objc_claimAutoreleasedReturnValue();

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend(v37, "writeCharacteristicRequests");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v88;
    while (2)
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v88 != v42)
          objc_enumerationMutation(v40);
        v44 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
        objc_msgSend(v44, "characteristic");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "isEqual:", v8);

        if (v46)
        {
          v41 = v44;
          goto LABEL_42;
        }
      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
      if (v41)
        continue;
      break;
    }
LABEL_42:
    self = v83;
    v7 = v84;
    v9 = v85;
  }

  if (v39)
    v47 = v41 == 0;
  else
    v47 = 1;
  if (v47 && (v41 | v39) != 0)
    NSLog(&CFSTR("Inconsistent state: If we have an exising write request, we should also have a write future. If we don't have"
                 " an existing write request, we should not have a write future").isa);
  if (v41)
  {
    objc_msgSend(v37, "writeCharacteristicRequests");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "removeObject:", v41);

    if (!v39)
      goto LABEL_53;
  }
  else
  {
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "logger");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "logger");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "loggerActivity");
      v69 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v69, &state);

      HFLogForCategory(0x38uLL);
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "hf_prettyDescription");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v101 = v71;
        _os_log_impl(&dword_1DD34E000, v70, OS_LOG_TYPE_DEFAULT, "New write request: %@", buf, 0xCu);

      }
      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "hf_prettyDescription");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v79;
        _os_log_impl(&dword_1DD34E000, v78, OS_LOG_TYPE_DEFAULT, "New write request: %@", (uint8_t *)&state, 0xCu);

      }
    }
    v9 = v85;
    if (!v39)
    {
LABEL_53:
      v39 = (uint64_t)objc_alloc_init(MEMORY[0x1E0D519C0]);
      objc_msgSend(v37, "writeFuturesKeyedByCharacteristicIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setObject:forKeyedSubscript:", v39, v9);

    }
  }
  objc_msgSend(v37, "writeCharacteristicRequests");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA488], "writeRequestWithCharacteristic:value:", v8, v7);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObject:", v52);

  objc_msgSend((id)v39, "flatMap:", &__block_literal_global_108_1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
LABEL_55:
    -[HFCharacteristicValueManager beginTransactionWithReason:](self, "beginTransactionWithReason:", CFSTR("characteristicValueManagerImplicitTransaction"));
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "logger");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v53, "logger");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "loggerActivity");
      v56 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v56, &state);

      HFLogForCategory(0x38uLL);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "hf_prettyDescription");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v101 = v58;
        _os_log_impl(&dword_1DD34E000, v57, OS_LOG_TYPE_DEFAULT, "Write request for implicit transaction: %@", buf, 0xCu);

      }
      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "hf_prettyDescription");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v75;
        _os_log_impl(&dword_1DD34E000, v74, OS_LOG_TYPE_DEFAULT, "Write request for implicit transaction: %@", (uint8_t *)&state, 0xCu);

      }
    }
    objc_msgSend(v53, "writeCharacteristicRequests");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBA488], "writeRequestWithCharacteristic:value:", v8, v7);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObject:", v60);

    v61 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    objc_msgSend(v53, "writeFuturesKeyedByCharacteristicIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, v9);

    objc_msgSend(v61, "flatMap:", &__block_literal_global_110);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager commitTransactionWithReason:](self, "commitTransactionWithReason:", CFSTR("characteristicValueManagerImplicitTransaction"));

  }
LABEL_60:
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "unlock");

  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", v80, self, CFSTR("HFCharacteristicValueManager.m"), 612, CFSTR("None of our cases were able to create a future for this request"));

  }
  return v35;
}

id __61__HFCharacteristicValueManager_writeValue_forCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    objc_msgSend(v2, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

id __61__HFCharacteristicValueManager_writeValue_forCharacteristic___block_invoke_107(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    objc_msgSend(v2, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

id __61__HFCharacteristicValueManager_writeValue_forCharacteristic___block_invoke_109(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    objc_msgSend(v2, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)executeActionSet:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[HFCharacteristicValueManager executeActionSet:](self, "executeActionSet:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__HFCharacteristicValueManager_executeActionSet_completionHandler___block_invoke;
  v10[3] = &unk_1EA72BD60;
  v11 = v6;
  v8 = v6;
  v9 = (id)objc_msgSend(v7, "addCompletionBlock:", v10);

}

uint64_t __67__HFCharacteristicValueManager_executeActionSet_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (id)executeActionSet:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  void *v50;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  SEL v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  _QWORD block[5];
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  void *v77;
  os_activity_scope_state_s state;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueManager.m"), 628, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionSet != nil"));

  }
  v60 = a2;
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  -[HFCharacteristicValueManager runningTransactions](self, "runningTransactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v73;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v73 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v11);
      objc_msgSend(v12, "actionSetsToExecute");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v5);

      if (v14)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "loggerActivity");
      v19 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v19, &state);

      HFLogForCategory(0x38uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "hf_prettyDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v77 = v21;
        _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "Duplicate action set execution request: %@", buf, 0xCu);

      }
      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "hf_prettyDescription");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v55;
        _os_log_impl(&dword_1DD34E000, v54, OS_LOG_TYPE_DEFAULT, "Duplicate action set execution request: %@", (uint8_t *)&state, 0xCu);

      }
    }
    v22 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    objc_msgSend(v12, "onFinishGroup");
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__HFCharacteristicValueManager_executeActionSet___block_invoke;
    block[3] = &unk_1EA7270A0;
    block[4] = v12;
    v70 = v5;
    v24 = v22;
    v71 = v24;
    dispatch_group_notify(v23, MEMORY[0x1E0C80D38], block);

    if (v24)
      goto LABEL_29;
  }
  else
  {
LABEL_11:

  }
  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    goto LABEL_24;
  v26 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "actionSetsToExecute");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "containsObject:", v5);

  if ((v29 & 1) == 0)
  {
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "logger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logger");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "loggerActivity");
      v34 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v34, &state);

      HFLogForCategory(0x38uLL);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "hf_prettyDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v77 = v36;
        _os_log_impl(&dword_1DD34E000, v35, OS_LOG_TYPE_DEFAULT, "Execute action set request: %@", buf, 0xCu);

      }
      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "hf_prettyDescription");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v59;
        _os_log_impl(&dword_1DD34E000, v58, OS_LOG_TYPE_DEFAULT, "Execute action set request: %@", (uint8_t *)&state, 0xCu);

      }
    }
  }
  objc_msgSend(v27, "actionSetsToExecute");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v5);

  objc_msgSend(v27, "onFinishGroup");
  v38 = objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __49__HFCharacteristicValueManager_executeActionSet___block_invoke_115;
  v65[3] = &unk_1EA7270A0;
  v66 = v27;
  v67 = v5;
  v24 = v26;
  v68 = v24;
  v39 = v27;
  dispatch_group_notify(v38, MEMORY[0x1E0C80D38], v65);

  if (!v24)
  {
LABEL_24:
    v40 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HFCharacteristicValueManager beginTransactionWithReason:](self, "beginTransactionWithReason:", CFSTR("characteristicValueManagerImplicitTransaction"));
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "logger");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v41, "logger");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "loggerActivity");
      v44 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v44, &state);

      HFLogForCategory(0x38uLL);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "hf_prettyDescription");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v77 = v46;
        _os_log_impl(&dword_1DD34E000, v45, OS_LOG_TYPE_DEFAULT, "Execute action set request in implicit transaction: %@", buf, 0xCu);

      }
      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "hf_prettyDescription");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v57;
        _os_log_impl(&dword_1DD34E000, v56, OS_LOG_TYPE_DEFAULT, "Execute action set request in implicit transaction: %@", (uint8_t *)&state, 0xCu);

      }
    }
    objc_msgSend(v41, "actionSetsToExecute");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v5);

    objc_msgSend(v41, "onFinishGroup");
    v48 = objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __49__HFCharacteristicValueManager_executeActionSet___block_invoke_116;
    v61[3] = &unk_1EA7270A0;
    v62 = v41;
    v63 = v5;
    v24 = v40;
    v64 = v24;
    v49 = v41;
    dispatch_group_notify(v48, MEMORY[0x1E0C80D38], v61);

    -[HFCharacteristicValueManager commitTransactionWithReason:](self, "commitTransactionWithReason:", CFSTR("characteristicValueManagerImplicitTransaction"));
  }
LABEL_29:
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "unlock");

  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", v60, self, CFSTR("HFCharacteristicValueManager.m"), 695, CFSTR("None of our cases were able to create a future for this request"));

  }
  return v24;
}

void __49__HFCharacteristicValueManager_executeActionSet___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "executionErrorForActionSet:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v4 = (id)v2;
  if (v2)
    objc_msgSend(v3, "finishWithError:", v2);
  else
    objc_msgSend(v3, "finishWithNoResult");

}

void __49__HFCharacteristicValueManager_executeActionSet___block_invoke_115(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "executionErrorForActionSet:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v4 = (id)v2;
  if (v2)
    objc_msgSend(v3, "finishWithError:", v2);
  else
    objc_msgSend(v3, "finishWithNoResult");

}

void __49__HFCharacteristicValueManager_executeActionSet___block_invoke_116(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "executionErrorForActionSet:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v4 = (id)v2;
  if (v2)
    objc_msgSend(v3, "finishWithError:", v2);
  else
    objc_msgSend(v3, "finishWithNoResult");

}

- (id)executeActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  HFCharacteristicValueManager *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  NSObject *v63;
  HFCharacteristicValueManager *v64;
  void *v65;
  void *v67;
  id obj;
  HFCharacteristicValueManager *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[4];
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  _QWORD block[5];
  id v80;
  _QWORD v81[4];
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  void *v88;
  os_activity_scope_state_s state;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueManager.m"), 702, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actions != nil"));

  }
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  v8 = objc_msgSend(v7, "count");
  v9 = MEMORY[0x1E0C809B0];
  v10 = &unk_1DD669000;
  if (v8)
  {
    v67 = v4;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    -[HFCharacteristicValueManager runningTransactions](self, "runningTransactions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
    if (v72)
    {
      v71 = *(_QWORD *)v84;
      v69 = self;
      v70 = v7;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v84 != v71)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v11);
          objc_msgSend(v12, "actionsToExecute");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "mutableCopy");

          objc_msgSend(v12, "actionSetsToExecute");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "na_flatMap:", &__block_literal_global_120);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "unionSet:", v16);

          objc_msgSend(v12, "writeCharacteristicRequests");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "na_map:", &__block_literal_global_122);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "unionSet:", v18);

          v81[0] = v9;
          v81[1] = 3221225472;
          v81[2] = __47__HFCharacteristicValueManager_executeActions___block_invoke_3;
          v81[3] = &unk_1EA72BE08;
          v19 = v7;
          v82 = v19;
          objc_msgSend(v14, "na_map:", v81);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count"))
          {
            v21 = v9;
            v22 = v6;
            -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "logger");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              state.opaque[0] = 0;
              state.opaque[1] = 0;
              -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "logger");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "loggerActivity");
              v27 = objc_claimAutoreleasedReturnValue();
              os_activity_scope_enter(v27, &state);

              HFLogForCategory(0x38uLL);
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v67, "hf_prettyDescription");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v88 = v29;
                _os_log_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_DEFAULT, "Overlapping actions execution request: %@", buf, 0xCu);

              }
              os_activity_scope_leave(&state);
            }
            else
            {
              HFLogForCategory(0x38uLL);
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v67, "hf_prettyDescription");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(state.opaque[0]) = 138412290;
                *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v35;
                _os_log_impl(&dword_1DD34E000, v34, OS_LOG_TYPE_DEFAULT, "Overlapping actions execution request: %@", (uint8_t *)&state, 0xCu);

              }
            }
            v6 = v22;
            v30 = objc_alloc_init(MEMORY[0x1E0D519C0]);
            objc_msgSend(v22, "addObject:", v30);
            objc_msgSend(v19, "minusSet:", v20);
            objc_msgSend(v12, "onFinishGroup");
            v31 = objc_claimAutoreleasedReturnValue();
            v9 = v21;
            block[0] = v21;
            block[1] = 3221225472;
            block[2] = __47__HFCharacteristicValueManager_executeActions___block_invoke_124;
            block[3] = &unk_1EA727188;
            block[4] = v12;
            v80 = v30;
            v32 = v30;
            dispatch_group_notify(v31, MEMORY[0x1E0C80D38], block);

            v33 = objc_msgSend(v19, "count");
            self = v69;
            v7 = v70;
            if (!v33)
            {

              v10 = &unk_1DD669000;
              goto LABEL_23;
            }
          }

          ++v11;
        }
        while (v72 != v11);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
        v10 = (_QWORD *)&unk_1DD669000;
        v72 = v36;
      }
      while (v36);
    }
LABEL_23:

    v4 = v67;
  }
  if (objc_msgSend(v7, "count"))
  {
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      objc_msgSend(v6, "addObject:", v38);
      -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "actionsToExecute");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "minusSet:", v7);

      objc_msgSend(v39, "actionsToExecute");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "unionSet:", v7);

      objc_msgSend(v7, "removeAllObjects");
      objc_msgSend(v39, "onFinishGroup");
      v42 = objc_claimAutoreleasedReturnValue();
      v76[0] = v9;
      v76[1] = v10[108];
      v76[2] = __47__HFCharacteristicValueManager_executeActions___block_invoke_2_125;
      v76[3] = &unk_1EA727188;
      v77 = v39;
      v78 = v38;
      v43 = v38;
      v44 = v39;
      dispatch_group_notify(v42, MEMORY[0x1E0C80D38], v76);

    }
  }
  if (objc_msgSend(v7, "count"))
  {
    v45 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    objc_msgSend(v6, "addObject:", v45);
    -[HFCharacteristicValueManager beginTransactionWithReason:](self, "beginTransactionWithReason:", CFSTR("characteristicValueManagerImplicitTransaction"));
    -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "logger");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      v48 = self;
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v46, "logger");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "loggerActivity");
      v50 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v50, &state);

      HFLogForCategory(0x38uLL);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "hf_prettyDescription");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v88 = v52;
        _os_log_impl(&dword_1DD34E000, v51, OS_LOG_TYPE_DEFAULT, "Execute actions request in implicit transaction: %@", buf, 0xCu);

      }
      os_activity_scope_leave(&state);
      self = v48;
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "hf_prettyDescription");
        v64 = self;
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v65;
        _os_log_impl(&dword_1DD34E000, v63, OS_LOG_TYPE_DEFAULT, "Execute actions request in implicit transaction: %@", (uint8_t *)&state, 0xCu);

        self = v64;
      }

    }
    objc_msgSend(v46, "actionsToExecute");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "unionSet:", v7);

    objc_msgSend(v7, "removeAllObjects");
    objc_msgSend(v46, "onFinishGroup");
    v54 = objc_claimAutoreleasedReturnValue();
    v73[0] = v9;
    v73[1] = v10[108];
    v73[2] = __47__HFCharacteristicValueManager_executeActions___block_invoke_126;
    v73[3] = &unk_1EA727188;
    v74 = v46;
    v75 = v45;
    v55 = v45;
    v56 = v46;
    dispatch_group_notify(v54, MEMORY[0x1E0C80D38], v73);

    -[HFCharacteristicValueManager commitTransactionWithReason:](self, "commitTransactionWithReason:", CFSTR("characteristicValueManagerImplicitTransaction"));
  }
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "unlock");

  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicValueManager.m"), 819, CFSTR("None of our cases were able to create a future for this request"));

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v6);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "flatMap:", &__block_literal_global_129_1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  return v59;
}

uint64_t __47__HFCharacteristicValueManager_executeActions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actions");
}

id __47__HFCharacteristicValueManager_executeActions___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0CBA480];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithCharacteristic:targetValue:", v5, v6);
  return v7;
}

id __47__HFCharacteristicValueManager_executeActions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
  {
    objc_opt_class();
    v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __47__HFCharacteristicValueManager_executeActions___block_invoke_4;
      v15[3] = &unk_1EA72BC40;
      v8 = v4;
      v16 = v8;
      objc_msgSend(v7, "na_firstObjectPassingTest:", v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "targetValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "targetValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
        v13 = v8;
      else
        v13 = 0;

    }
    else
    {
      v13 = v4;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __47__HFCharacteristicValueManager_executeActions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
}

void __47__HFCharacteristicValueManager_executeActions___block_invoke_124(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "actionsError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = (id)v2;
  if (v2)
    objc_msgSend(v3, "finishWithError:", v2);
  else
    objc_msgSend(v3, "finishWithNoResult");

}

void __47__HFCharacteristicValueManager_executeActions___block_invoke_2_125(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "actionsError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = (id)v2;
  if (v2)
    objc_msgSend(v3, "finishWithError:", v2);
  else
    objc_msgSend(v3, "finishWithNoResult");

}

void __47__HFCharacteristicValueManager_executeActions___block_invoke_126(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "actionsError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = (id)v2;
  if (v2)
    objc_msgSend(v3, "finishWithError:", v2);
  else
    objc_msgSend(v3, "finishWithNoResult");

}

uint64_t __47__HFCharacteristicValueManager_executeActions___block_invoke_2_127()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

void __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_136(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  os_activity_scope_state_s state;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(*(id *)(a1 + 32), "actionSetsToExecute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(*(id *)(a1 + 32), "logger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loggerActivity");
      v8 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v8, &state);

      HFLogForCategory(0x38uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Finished all action set executions", v12, 2u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(state.opaque[0]) = 0;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Finished all action set executions", (uint8_t *)&state, 2u);
      }

    }
  }
  objc_msgSend(WeakRetained, "transactionLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_137(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  os_activity_scope_state_s state;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(*(id *)(a1 + 32), "actionsToExecute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(*(id *)(a1 + 32), "logger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loggerActivity");
      v8 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v8, &state);

      HFLogForCategory(0x38uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Finished all action executions", v12, 2u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(state.opaque[0]) = 0;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Finished all action executions", (uint8_t *)&state, 2u);
      }

    }
  }
  objc_msgSend(WeakRetained, "transactionLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_138(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  os_activity_scope_state_s state;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(*(id *)(a1 + 32), "characteristicsToRead");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(*(id *)(a1 + 32), "logger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loggerActivity");
      v8 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v8, &state);

      HFLogForCategory(0x38uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Finished read execution", v12, 2u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(state.opaque[0]) = 0;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Finished read execution", (uint8_t *)&state, 2u);
      }

    }
  }
  objc_msgSend(WeakRetained, "transactionLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_139(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _DWORD v19[4];
  os_activity_scope_state_s state;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggerActivity");
    v6 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v6, &state);

    HFLogForCategory(0x38uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "runningTransactions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = 67109120;
      v19[1] = objc_msgSend(v8, "count") - 1;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "All executions complete. Cleaning up. Remaining running transactions: %d", (uint8_t *)v19, 8u);

    }
    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x38uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "runningTransactions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(state.opaque[0]) = 67109120;
      HIDWORD(state.opaque[0]) = objc_msgSend(v18, "count") - 1;
      _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "All executions complete. Cleaning up. Remaining running transactions: %d", (uint8_t *)&state, 8u);

    }
  }
  objc_msgSend(WeakRetained, "runningTransactions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(WeakRetained, "cacheManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transactionRemoved:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "onFinishGroup");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "runningTransactions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0D51990]);
    objc_msgSend(WeakRetained, "setInFlightReadCancelationToken:", v14);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "loggerIsExternal") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finish");

  }
  objc_msgSend(WeakRetained, "transactionLock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unlock");

  dispatch_group_leave(v11);
}

- (id)_openTransactionCompletionFuture
{
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  void *v12;

  -[HFCharacteristicValueManager openTransaction](self, "openTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    NSLog(CFSTR("No open transaction!"));
  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(v2, "onFinishGroup");
  v4 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__HFCharacteristicValueManager__openTransactionCompletionFuture__block_invoke;
  v10[3] = &unk_1EA727188;
  v5 = v3;
  v11 = v5;
  v12 = v2;
  v6 = v2;
  dispatch_group_notify(v4, MEMORY[0x1E0C80D38], v10);

  v7 = v12;
  v8 = v5;

  return v8;
}

uint64_t __64__HFCharacteristicValueManager__openTransactionCompletionFuture__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

uint64_t __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

void __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:willWriteValuesForCharacteristics:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  os_activity_scope_state_s state;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggerActivity");
    v6 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v6, &state);

    HFLogForCategory(0x38uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Finished partial write", buf, 2u);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x38uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_DEFAULT, "Finished partial write", (uint8_t *)&state, 2u);
    }

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v26;
    *(_QWORD *)&v10 = 138412290;
    v24 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
        objc_msgSend(*(id *)(a1 + 32), "logger", v24, (_QWORD)v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          objc_msgSend(*(id *)(a1 + 32), "logger");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "loggerActivity");
          v17 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v17, &state);

          HFLogForCategory(0x38uLL);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v14, "hf_prettyDescription");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v24;
            v30 = v19;
            _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "     %@", buf, 0xCu);

          }
          os_activity_scope_leave(&state);
        }
        else
        {
          HFLogForCategory(0x38uLL);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v14, "hf_prettyDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(state.opaque[0]) = v24;
            *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v21;
            _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "     %@", (uint8_t *)&state, 0xCu);

          }
        }
        ++v13;
      }
      while (v11 != v13);
      v22 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      v11 = v22;
    }
    while (v22);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v8);
}

void __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_151(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void (**v43)(void);
  NSObject *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  id v75;
  os_activity_scope_state_s state;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 9);
  objc_msgSend(WeakRetained, "transactionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_msgSend(a1[4], "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(a1[4], "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggerActivity");
    v8 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v8, &state);

    HFLogForCategory(0x38uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v3;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Finished write with error: %@.", buf, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x38uLL);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v3;
      _os_log_impl(&dword_1DD34E000, v44, OS_LOG_TYPE_DEFAULT, "Finished write with error: %@.", (uint8_t *)&state, 0xCu);
    }

  }
  v46 = v3;
  objc_msgSend(a1[4], "setOverallWriteError:", v3);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setWriteCharacteristicRequests:", v10);

  objc_msgSend(a1[4], "writeFuturesKeyedByCharacteristicIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v11, "copy");

  objc_msgSend(WeakRetained, "transactionLock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unlock");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v49 = a1;
  v14 = a1[5];
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v69 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v19, "request");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "characteristic");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v19, "error");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v52;
          if (v22)
          {
            objc_msgSend(v19, "error");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "uniqueIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setObject:forKeyedSubscript:", v24, v25);

            v23 = v50;
          }
          objc_msgSend(v23, "addObject:", v21);
          objc_msgSend(v21, "uniqueIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v26);

        }
        else
        {
          NSLog(CFSTR("writeRespones is missing the HMCharacteristic for: %@"), v19);
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    }
    while (v16);
  }

  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_154;
  v61[3] = &unk_1EA72BEE0;
  v45 = v13;
  v62 = v45;
  v63 = v49[4];
  v47 = v46;
  v64 = v47;
  v27 = v51;
  v65 = v27;
  v66 = v49[6];
  v28 = v50;
  v67 = v28;
  objc_msgSend(v48, "enumerateKeysAndObjectsUsingBlock:", v61);
  objc_msgSend(WeakRetained, "transactionLock");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lock");

  objc_msgSend(WeakRetained, "cachedWriteErrorsKeyedByCharacteristicIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addEntriesFromDictionary:", v27);

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v31 = v52;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v58 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
        objc_msgSend(WeakRetained, "cachedWriteErrorsKeyedByCharacteristicIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "uniqueIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "removeObjectForKey:", v38);

        objc_msgSend(WeakRetained, "cachedReadErrorsKeyedByCharacteristicIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "uniqueIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "removeObjectForKey:", v40);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
    }
    while (v33);
  }

  objc_msgSend(WeakRetained, "transactionLock");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "unlock");

  if (v49[7] && (objc_msgSend(v31, "count") || objc_msgSend(v28, "count")))
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_2_159;
    v53[3] = &unk_1EA72BF08;
    v54 = v49[7];
    v55 = v31;
    v56 = v28;
    objc_msgSend(v42, "dispatchHomeObserverMessage:sender:", v53, 0);

  }
  v43 = (void (**)(void))v49[8];
  if (v43)
    v43[2]();

}

void __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  os_activity_scope_state_s state;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "finishWithResult:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(*(id *)(a1 + 40), "logger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "loggerActivity");
      v10 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v10, &state);

      HFLogForCategory(0x38uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v5;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "Warning: No error or response for write request characteristic: %@", buf, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v5;
        _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_ERROR, "Warning: No error or response for write request characteristic: %@", (uint8_t *)&state, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 48);
    if (v13)
    {
      v14 = v13;

      v12 = v14;
    }
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v12, v5);
    v15 = *(void **)(a1 + 64);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_155;
    v23 = &unk_1EA72BC18;
    v16 = v5;
    v24 = v16;
    objc_msgSend(v15, "na_firstObjectPassingTest:", &v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "characteristic");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      NSLog(CFSTR("No characteristic request for identifier: %@"), v16, v20, v21, v22, v23);
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v18);
    objc_msgSend(v6, "finishWithError:", v12);

  }
}

uint64_t __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_155(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_2_159(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didWriteValuesForCharacteristics:failedCharacteristics:", a1[4], a1[5], a1[6]);

}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_171(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "home:willReadValuesForCharacteristics:", WeakRetained, *(_QWORD *)(a1 + 32));

  }
}

uint64_t __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_174(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CBA470], "readRequestWithCharacteristic:", a2);
}

id __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_180(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "readFuturesKeyedByCharacteristicIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_182(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "finishWithResult:", v5);

}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_3_183(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v4, "home:didReadValuesForCharacteristics:failedCharacteristics:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
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
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;

  v18 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "isFinished") & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_187;
    v22 = &unk_1EA72BB50;
    v23 = v18;
    objc_msgSend(v6, "na_firstObjectPassingTest:", &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (+[HFCharacteristicValueManager _shouldTrackReadsCompleteForPerformanceTesting](HFCharacteristicValueManager, "_shouldTrackReadsCompleteForPerformanceTesting"))
      {
        v8 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "logger");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_endReadsCompleteTrackingForCharacteristic:withLogger:didRead:", v7, v9, 0);

      }
      v10 = *(void **)(a1 + 56);
      if (!v10 || (objc_msgSend(v10, "na_isCancelledError") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "transactionLock", v18, v19, v20, v21, v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lock");

        objc_msgSend(*(id *)(a1 + 40), "characteristicsWithCachedValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObject:", v7);

        v13 = *(void **)(a1 + 56);
        v14 = v13;
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(*(id *)(a1 + 40), "cachedReadErrorsKeyedByCharacteristicIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

        if (!v13)
        objc_msgSend(*(id *)(a1 + 64), "addObject:", v7);
        objc_msgSend(*(id *)(a1 + 40), "transactionLock");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "unlock");

      }
    }
    objc_msgSend(v5, "finishWithError:", *(_QWORD *)(a1 + 72), v18);

  }
}

uint64_t __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_187(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_188(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didReadValuesForCharacteristics:failedCharacteristics:", WeakRetained, v4, *(_QWORD *)(a1 + 32));

  }
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_189(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  os_activity_scope_state_s state;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 1)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v3, "loggerActivity");
      v4 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v4, &state);

      HFLogForCategory(0x38uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = WeakRetained;
        _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Cancelling in-flight read transaction: %@", (uint8_t *)&v9, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)WeakRetained;
        _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Cancelling in-flight read transaction: %@", (uint8_t *)&state, 0xCu);
      }

    }
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 103);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "actionSetsToExecute");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:willExecuteActionSets:", v3, v4);

  }
}

void __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:willWriteValuesForCharacteristics:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  NSObject *v18;
  uint64_t v19;
  os_activity_scope_state_s v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  objc_msgSend(WeakRetained, "transactionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "logger", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggerActivity");
    v8 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v8, &v20);

    HFLogForCategory(0x38uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Finished action set execution: %@. Error: %@", buf, 0x16u);
    }

    os_activity_scope_leave(&v20);
  }
  else
  {
    HFLogForCategory(0x38uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v19;
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Finished action set execution: %@. Error: %@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "actionSetsToExecute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", *(_QWORD *)(a1 + 40));

  v12 = objc_loadWeakRetained((id *)(a1 + 96));
  objc_msgSend(v12, "transactionLock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unlock");

  objc_msgSend(*(id *)(a1 + 40), "hf_affectedCharacteristics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      goto LABEL_7;
LABEL_9:
    objc_msgSend(*(id *)(a1 + 72), "unionSet:", v14);
    v17 = (id *)(a1 + 80);
    goto LABEL_10;
  }
  if (!v3)
    goto LABEL_9;
LABEL_7:
  v15 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v3, v16);

  objc_msgSend(*(id *)(a1 + 56), "unionSet:", v14);
  v17 = (id *)(a1 + 64);
LABEL_10:
  objc_msgSend(*v17, "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));

}

uint64_t __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_192(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t result;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 104);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  objc_msgSend(WeakRetained, "transactionLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  objc_msgSend(*(id *)(a1 + 32), "setActionSetErrorsKeyedByUUID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "cachedExecutionErrorsKeyedByActionSetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = *(id *)(a1 + 56);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 48), "cachedExecutionErrorsKeyedByActionSetIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

  v14 = objc_loadWeakRetained(v2);
  objc_msgSend(v14, "transactionLock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unlock");

  if (*(_QWORD *)(a1 + 64))
  {
    v19 = objc_msgSend(*(id *)(a1 + 56), "count");
    v20 = MEMORY[0x1E0C809B0];
    if (v19 || objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v20;
      v28[1] = 3221225472;
      v28[2] = __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_2_193;
      v28[3] = &unk_1EA72BF08;
      v29 = *(id *)(a1 + 64);
      v30 = *(id *)(a1 + 56);
      v31 = *(id *)(a1 + 72);
      objc_msgSend(v21, "dispatchHomeObserverMessage:sender:", v28, 0);

    }
    if (*(_QWORD *)(a1 + 64) && (objc_msgSend(*(id *)(a1 + 80), "count") || objc_msgSend(*(id *)(a1 + 88), "count")))
    {
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v20;
      v24[1] = 3221225472;
      v24[2] = __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_3_196;
      v24[3] = &unk_1EA72BF08;
      v25 = *(id *)(a1 + 64);
      v26 = *(id *)(a1 + 80);
      v27 = *(id *)(a1 + 88);
      objc_msgSend(v22, "dispatchHomeObserverMessage:sender:", v24, 0);

    }
  }
  result = *(_QWORD *)(a1 + 96);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, v16, v17, v18);
  return result;
}

void __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_2_193(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didExecuteActionSets:failedActionSets:", a1[4], a1[5], a1[6]);

}

void __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_3_196(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didWriteValuesForCharacteristics:failedCharacteristics:", a1[4], a1[5], a1[6]);

}

void __93__HFCharacteristicValueManager__transactionLock_executeActionsTransaction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:willWriteValuesForCharacteristics:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __93__HFCharacteristicValueManager__transactionLock_executeActionsTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "transactionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggerActivity");
    v8 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v8, &state);

    HFLogForCategory(0x38uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v29 = v10;
      v30 = 2112;
      v31 = v3;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Finished actions execution: %@. Error: %@", buf, 0x16u);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x38uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v29 = v22;
      v30 = 2112;
      v31 = v3;
      _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "Finished actions execution: %@. Error: %@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "actionsToExecute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", *(_QWORD *)(a1 + 40));

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setActionsError:", v3);
  v12 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v12, "transactionLock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unlock");

  if (*(_QWORD *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = *(id *)(a1 + 56);
    }
    else
    {
      v14 = *(id *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __93__HFCharacteristicValueManager__transactionLock_executeActionsTransaction_completionHandler___block_invoke_197;
    v23[3] = &unk_1EA72BF08;
    v24 = *(id *)(a1 + 48);
    v25 = v14;
    v26 = v16;
    v18 = v16;
    v19 = v14;
    objc_msgSend(v17, "dispatchHomeObserverMessage:sender:", v23, 0);

  }
  v20 = *(_QWORD *)(a1 + 64);
  if (v20)
    (*(void (**)(void))(v20 + 16))();

}

void __93__HFCharacteristicValueManager__transactionLock_executeActionsTransaction_completionHandler___block_invoke_197(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didWriteValuesForCharacteristics:failedCharacteristics:", a1[4], a1[5], a1[6]);

}

- (void)invalidateCachedValueForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HFCharacteristicValueManager characteristicsWithCachedValues](self, "characteristicsWithCachedValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)invalidateCachedValuesForAccessory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = v4;
  objc_msgSend(v4, "services");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v10, "characteristics");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v22;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15);
              -[HFCharacteristicValueManager characteristicsWithCachedValues](self, "characteristicsWithCachedValues");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "removeObject:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unlock");

}

- (void)invalidateCachedErrorForExecutionOfActionSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HFCharacteristicValueManager cachedExecutionErrorsKeyedByActionSetIdentifier](self, "cachedExecutionErrorsKeyedByActionSetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v7);
  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (void)invalidateAllCachedErrors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[HFCharacteristicValueManager cachedReadErrorsKeyedByCharacteristicIdentifier](self, "cachedReadErrorsKeyedByCharacteristicIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[HFCharacteristicValueManager cachedWriteErrorsKeyedByCharacteristicIdentifier](self, "cachedWriteErrorsKeyedByCharacteristicIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[HFCharacteristicValueManager cachedExecutionErrorsKeyedByActionSetIdentifier](self, "cachedExecutionErrorsKeyedByActionSetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)cancelInFlightReadRequests
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[HFCharacteristicValueManager inFlightReadCancelationToken](self, "inFlightReadCancelationToken");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0D51990]);
  -[HFCharacteristicValueManager setInFlightReadCancelationToken:](self, "setInFlightReadCancelationToken:", v4);

  -[HFCharacteristicValueManager transactionLock](self, "transactionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  objc_msgSend(v6, "cancel");
}

void __61__HFCharacteristicValueManager_readValuesForCharacteristics___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HFCharacteristicValueManager.m"), 1680, CFSTR("-[HFCharacteristicValueManager should never return a future that fails; it should always return a future that finishes with a HFCharacteristicReadResponse, with the error property set as needed"));

}

- (id)writeValuesForCharacteristics:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  HFCharacteristicValueManager *v19;

  v4 = a3;
  objc_msgSend(v4, "allCharacteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[HFCharacteristicValueManager beginTransactionWithReason:](self, "beginTransactionWithReason:", CFSTR("characteristicValueManagerBatchWriteTransaction"));
    objc_msgSend(v4, "allCharacteristics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __62__HFCharacteristicValueManager_writeValuesForCharacteristics___block_invoke;
    v17 = &unk_1EA72C1B8;
    v18 = v4;
    v19 = self;
    objc_msgSend(v8, "na_map:", &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler", v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "combineAllFutures:ignoringErrors:scheduler:", v9, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFCharacteristicValueManager commitTransactionWithReason:](self, "commitTransactionWithReason:", CFSTR("characteristicValueManagerBatchWriteTransaction"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

id __62__HFCharacteristicValueManager_writeValuesForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForCharacteristic:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "writeValue:forCharacteristic:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HFCharacteristicValueWriter)valueWriter
{
  return self->_valueWriter;
}

- (void)setTestingOverrideLoadingStates:(id)a3
{
  objc_storeStrong((id *)&self->_testingOverrideLoadingStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstReadCompleteFuture, 0);
  objc_storeStrong((id *)&self->_testingOverrideLoadingStates, 0);
  objc_storeStrong((id *)&self->_readsCompleteLogger, 0);
  objc_storeStrong((id *)&self->_inFlightReadCancelationToken, 0);
  objc_storeStrong((id *)&self->_cacheManager, 0);
  objc_storeStrong((id *)&self->_cachedExecutionErrorsKeyedByActionSetIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedWriteErrorsKeyedByCharacteristicIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedReadErrorsKeyedByCharacteristicIdentifier, 0);
  objc_storeStrong((id *)&self->_characteristicsWithCachedValues, 0);
  objc_storeStrong((id *)&self->_mutableAllReadCharacteristics, 0);
  objc_storeStrong((id *)&self->_transactionLock, 0);
  objc_storeStrong((id *)&self->_completionHandlersForReadTransactionsToExecuteOnNextRunLoop, 0);
  objc_storeStrong((id *)&self->_readTransactionsToExecuteOnNextRunLoop, 0);
  objc_storeStrong((id *)&self->_runningTransactions, 0);
  objc_storeStrong((id *)&self->_openTransaction, 0);
  objc_storeStrong((id *)&self->_valueWriter, 0);
  objc_storeStrong((id *)&self->_valueReader, 0);
}

- (void)setOverrideLoadingState:(unint64_t)a3 forCharacteristic:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  -[HFCharacteristicValueManager testingOverrideLoadingStates](self, "testingOverrideLoadingStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueManager setTestingOverrideLoadingStates:](self, "setTestingOverrideLoadingStates:", v8);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueManager testingOverrideLoadingStates](self, "testingOverrideLoadingStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);
}

- (void)clearOverrideLoadingStates
{
  id v2;

  -[HFCharacteristicValueManager testingOverrideLoadingStates](self, "testingOverrideLoadingStates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

@end
