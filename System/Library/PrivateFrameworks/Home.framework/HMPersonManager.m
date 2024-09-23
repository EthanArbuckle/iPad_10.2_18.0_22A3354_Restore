@implementation HMPersonManager

void __56__HMPersonManager_HFAdditions__hf_personWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HMPersonManager_HFAdditions__hf_personWithIdentifier___block_invoke_2;
  v9[3] = &unk_1EA736DA0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v12 = v7;
  v8 = v3;
  objc_msgSend(v4, "fetchPersonsWithUUIDs:completion:", v5, v9);

}

void __56__HMPersonManager_HFAdditions__hf_personWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithResult:", v8);
  }
  else
  {
    if (v6)
    {
      v9 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
    HFLogForCategory(0x13uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = 138412802;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "%@: Unable to fetch person with identifier:%@ (error: %@)", (uint8_t *)&v13, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v8);
  }

}

void __68__HMPersonManager_HFAdditions__hf_faceCropsForPersonWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v2, "na_setWithSafeObject:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchFaceCropsForPersonsWithUUIDs:completion:", v6, v5);

}

id __68__HMPersonManager_HFAdditions__hf_faceCropsForPersonWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "count"))
  {
    HFLogForCategory(0x13uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "%@: No face crops for person with identifier:%@", (uint8_t *)&v12, 0x16u);
    }

  }
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_131);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __68__HMPersonManager_HFAdditions__hf_faceCropsForPersonWithIdentifier___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_class();
  v7 = v4;
  if (!v7)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v7;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

LABEL_7:
    v9 = 0;
  }

  v12 = objc_opt_class();
  v13 = v5;
  if (!v13)
  {
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v13;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v12, objc_opt_class());

    goto LABEL_14;
  }
LABEL_15:

  objc_msgSend(v9, "dateCreated");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateCreated");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "compare:", v19);

  return v20;
}

id __70__HMPersonManager_HFAdditions__hf_keyFaceCropForPersonWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  v3 = objc_msgSend(v2, "count");
  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    objc_msgSend(v2, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithResult:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithError:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CBA6D8]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "initWithUUID:", v6);

  }
  objc_msgSend(v4, "setName:", *(_QWORD *)(a1 + 40), v17);
  objc_msgSend(v4, "personLinks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke_2;
    v24[3] = &unk_1EA736E08;
    v24[4] = WeakRetained;
    objc_msgSend(v7, "na_filter:", v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personLinks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_setByRemovingObjectsFromSet:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setPersonLinks:", v12);
    HFLogForCategory(0x13uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v10;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Removing links %@, setting person links to %@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke_14;
  v19[3] = &unk_1EA736E58;
  objc_copyWeak(&v23, (id *)(a1 + 48));
  v15 = v4;
  v20 = v15;
  v16 = v18;
  v21 = v16;
  v22 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "addOrUpdatePersons:completion:", v14, v19);

  objc_destroyWeak(&v23);
}

BOOL __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "personManagerUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 != v4;

  return v5;
}

void __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  HFLogForCategory(0x13uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v18 = WeakRetained;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%@: Unable to update person:%@ (error:%@)", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v18 = WeakRetained;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "%@: Renamed and updated person %@ to %@", buf, 0x20u);
    }

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke_16;
    v14 = &unk_1EA736E30;
    v15 = WeakRetained;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v9, "dispatchHomePersonManagerObserverMessage:sender:", &v11, 0);

    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", *(_QWORD *)(a1 + 32), v11, v12, v13, v14, v15);
  }

}

void __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personManager:didUpdatePersons:", v3, v4);

  }
}

void __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(a1[4], "hf_faceCropsForPersonWithIdentifier:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_2;
  v7[3] = &unk_1EA736EC8;
  objc_copyWeak(&v10, a1 + 6);
  v8 = a1[5];
  v5 = v3;
  v9 = v5;
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v7);

  objc_destroyWeak(&v10);
}

void __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  HFLogForCategory(0x13uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    *(_DWORD *)buf = 138412546;
    v20 = WeakRetained;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@: Removing person with identifier:%@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1[4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_19;
  v13[3] = &unk_1EA736EA0;
  objc_copyWeak(&v18, a1 + 6);
  v14 = a1[4];
  v15 = a1[5];
  v11 = v6;
  v16 = v11;
  v12 = v5;
  v17 = v12;
  objc_msgSend(WeakRetained, "removePersonsWithUUIDs:completion:", v10, v13);

  objc_destroyWeak(&v18);
}

void __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v3)
  {
    HFLogForCategory(0x13uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v18 = WeakRetained;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v3;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "%@: Unable to remove person with identifier:%@ (error: %@)", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (*(_QWORD *)(a1 + 56))
      v6 = *(void **)(a1 + 56);
    else
      v6 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v6, "na_map:", &__block_literal_global_22_6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x13uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = WeakRetained;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@: Removing face crops with identifiers:%@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_23;
    v12[3] = &unk_1EA736E58;
    objc_copyWeak(&v16, (id *)(a1 + 64));
    v13 = *(id *)(a1 + 32);
    v10 = v7;
    v14 = v10;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "removeFaceCropsWithUUIDs:completion:", v9, v12);

    objc_destroyWeak(&v16);
  }

}

uint64_t __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

void __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_2_24;
  v11 = &unk_1EA736E30;
  v12 = WeakRetained;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v5, "dispatchHomePersonManagerObserverMessage:sender:", &v8, 0);

  if (v3)
  {
    HFLogForCategory(0x13uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v15 = WeakRetained;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v3;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%@: Unable to remove face crops with identifiers:%@ (error: %@)", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3, v8, v9, v10, v11, v12);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult", v8, v9, v10, v11, v12);
  }

}

void __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke_2_24(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personManager:didRemovePersonsWithUUIDs:", v3, v4);

  }
}

void __60__HMPersonManager_HFAdditions__hf_removeFaceCropsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x13uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@: Removing face crops with identifiers:%@", buf, 0x16u);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v7 = (id *)(a1 + 40);
    v9 = *(v7 - 1);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__HMPersonManager_HFAdditions__hf_removeFaceCropsWithUUIDs___block_invoke_28;
    v10[3] = &unk_1EA736F18;
    objc_copyWeak(&v13, v7 + 1);
    v11 = *v7;
    v12 = v3;
    objc_msgSend(v9, "removeFaceCropsWithUUIDs:completion:", v8, v10);

    objc_destroyWeak(&v13);
  }
  else
  {
    objc_msgSend(v3, "finishWithNoResult");
  }

}

void __60__HMPersonManager_HFAdditions__hf_removeFaceCropsWithUUIDs___block_invoke_28(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v3)
  {
    HFLogForCategory(0x13uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      *(_DWORD *)buf = 138412802;
      v15 = WeakRetained;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v3;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "%@: Unable to remove face crop with identifier:%@ (error: %@)", buf, 0x20u);
    }

    objc_msgSend(a1[5], "finishWithError:", v3);
  }
  else
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __60__HMPersonManager_HFAdditions__hf_removeFaceCropsWithUUIDs___block_invoke_29;
    v11 = &unk_1EA736E30;
    v12 = WeakRetained;
    v13 = a1[4];
    objc_msgSend(v6, "dispatchHomePersonManagerObserverMessage:sender:", &v8, 0);

    objc_msgSend(a1[5], "finishWithNoResult", v8, v9, v10, v11, v12);
  }

}

void __60__HMPersonManager_HFAdditions__hf_removeFaceCropsWithUUIDs___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "personManager:didRemoveFaceCropsWithUUIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __80__HMPersonManager_HFAdditions__hf_associateFaceCropsWithUUIDs_toPersonWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__HMPersonManager_HFAdditions__hf_associateFaceCropsWithUUIDs_toPersonWithUUID___block_invoke_2;
  v8[3] = &unk_1EA72EDE8;
  v8[4] = WeakRetained;
  v9 = v5;
  v10 = v3;
  v11 = *(id *)(a1 + 32);
  v7 = v3;
  objc_msgSend(WeakRetained, "associateFaceCropsWithUUIDs:toPersonWithUUID:completion:", v6, v9, v8);

}

void __80__HMPersonManager_HFAdditions__hf_associateFaceCropsWithUUIDs_toPersonWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x13uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v3;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "%@: Unable to associate face crops to person with identifier:%@ (error: %@)", (uint8_t *)&v11, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 56);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@: Associated face crops:%@ to person with identifier:%@", (uint8_t *)&v11, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");
  }

}

void __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  char v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "hf_faceCropsForPersonWithIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_2;
  v9[3] = &unk_1EA736FB0;
  v5 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v6 = *(id *)(a1 + 48);
  v13 = *(_BYTE *)(a1 + 56);
  v11 = v6;
  v12 = v3;
  v7 = v3;
  v8 = (id)objc_msgSend(v4, "addSuccessBlock:", v9);

}

void __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  char v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "na_map:", &__block_literal_global_32_5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x13uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    v23 = v6;
    v24 = 2112;
    v25 = v3;
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@: Reassociating face crops:%@ from person with identifier:%@ to person with identifier:%@", buf, 0x2Au);
  }

  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_associateFaceCropsWithUUIDs:toPersonWithUUID:", v10, *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_33;
  v18[3] = &unk_1EA736F88;
  v21 = *(_BYTE *)(a1 + 64);
  v12 = *(void **)(a1 + 40);
  v18[4] = *(_QWORD *)(a1 + 32);
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v19 = v12;
  v20 = *(id *)(a1 + 56);
  objc_msgSend(v11, "addSuccessBlock:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_4;
  v16[3] = &unk_1EA726968;
  v17 = *(id *)(a1 + 56);
  v15 = (id)objc_msgSend(v14, "addFailureBlock:", v16);

}

uint64_t __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

void __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_33(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_removePersonWithUUID:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_2_34;
    v8[3] = &unk_1EA736F60;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v2, "addSuccessBlock:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_3_36;
    v6[3] = &unk_1EA726968;
    v7 = *(id *)(a1 + 48);
    v5 = (id)objc_msgSend(v4, "addFailureBlock:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");
  }
}

uint64_t __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_2_34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

uint64_t __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_3_36(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

uint64_t __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __79__HMPersonManager_HFAdditions__hf_linkFromPerson_toPerson_toPersonManagerUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__HMPersonManager_HFAdditions__hf_linkFromPerson_toPerson_toPersonManagerUUID___block_invoke_2;
  v7[3] = &unk_1EA72CAF0;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = v3;
  v6 = v3;
  objc_msgSend(v4, "addOrUpdatePersons:completion:", v5, v7);

}

void __79__HMPersonManager_HFAdditions__hf_linkFromPerson_toPerson_toPersonManagerUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x13uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Unable to create link between person %@ and %@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Created link between person %@ and %@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");
  }

}

@end
