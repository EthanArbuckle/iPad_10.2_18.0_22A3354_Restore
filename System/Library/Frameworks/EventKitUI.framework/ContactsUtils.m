@implementation ContactsUtils

+ (id)defaultContactKeysToFetch
{
  if (defaultContactKeysToFetch_onceToken != -1)
    dispatch_once(&defaultContactKeysToFetch_onceToken, &__block_literal_global_14);
  return (id)defaultContactKeysToFetch_keysToFetch;
}

void __42__ContactsUtils_defaultContactKeysToFetch__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)EKWeakLinkClass(), "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)EKWeakLinkClass(), "descriptorForRequiredKeys", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend((id)EKWeakLinkClass(), "descriptorForRequiredKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultContactKeysToFetch_keysToFetch;
  defaultContactKeysToFetch_keysToFetch = v3;

}

+ (id)contactForContact:(id)a3 keysToFetch:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  v7 = v5;
  v8 = v6;
  CalendarFoundationPerformBlockOnSharedContactStore();
  if (objc_msgSend((id)v13[5], "count"))
  {
    objc_msgSend((id)v13[5], "objectAtIndexedSubscript:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  _Block_object_dispose(&v12, 8);
  return v10;
}

void __47__ContactsUtils_contactForContact_keysToFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)EKWeakLinkClass();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForContactsWithIdentifiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "unifiedContactsMatchingPredicate:keysToFetch:error:", v7, *(_QWORD *)(a1 + 40), 0);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

+ (id)contactForAddress:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[ContactsUtils defaultContactKeysToFetch](ContactsUtils, "defaultContactKeysToFetch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contactForAddress:fullName:firstName:lastName:keysToFetch:", v13, v12, v11, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)contactForAddress:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6 keysToFetch:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4;
  v38 = __Block_byref_object_dispose__4;
  v39 = 0;
  v33 = MEMORY[0x1E0C809B0];
  v16 = v11;
  v17 = v15;
  v18 = v12;
  v19 = v13;
  CalendarFoundationPerformBlockOnSharedContactStore();
  if (objc_msgSend((id)v35[5], "count", v33, 3221225472, __75__ContactsUtils_contactForAddress_fullName_firstName_lastName_keysToFetch___block_invoke, &unk_1E6019838))
  {
    objc_msgSend((id)v35[5], "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  EKWeakLinkClass();
  v21 = (void *)objc_opt_new();
  v20 = v21;
  if (v19 && v14)
  {
    objc_msgSend(v21, "setGivenName:", v19);
    objc_msgSend(v20, "setFamilyName:", v14);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0D0C360], "personNameComponentsFromString:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "givenName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {

  }
  else
  {
    objc_msgSend(v22, "familyName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24 == 0;

    if (v25)
    {
      objc_msgSend(v20, "setNickname:", v18);
      goto LABEL_10;
    }
  }
  objc_msgSend(v22, "givenName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setGivenName:", v26);

  objc_msgSend(v22, "familyName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFamilyName:", v27);

LABEL_10:
LABEL_11:
  if (v16)
  {
    if (objc_msgSend(v16, "cal_isPhoneNumber"))
    {
      v28 = (void *)EKWeakLinkClass();
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v16);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "labeledValueWithLabel:value:", 0, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPhoneNumbers:", v31);

    }
    else
    {
      objc_msgSend((id)EKWeakLinkClass(), "labeledValueWithLabel:value:", 0, v16);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setEmailAddresses:", v30);
    }

  }
LABEL_16:

  _Block_object_dispose(&v34, 8);
  return v20;
}

void __75__ContactsUtils_contactForAddress_fullName_firstName_lastName_keysToFetch___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "cal_isPhoneNumber");
  v4 = (void *)EKWeakLinkClass();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForContactsMatchingPhoneNumber:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "predicateForContactsMatchingEmailAddress:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "unifiedContactsMatchingPredicate:keysToFetch:error:", v7, *(_QWORD *)(a1 + 40), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count")
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)
    && (*(_QWORD *)(a1 + 48) || *(_QWORD *)(a1 + 56)))
  {
    v11 = (void *)EKWeakLinkClass();
    v12 = *(_QWORD *)(a1 + 48);
    if (!v12)
      v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v11, "predicateForContactsMatchingName:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "unifiedContactsMatchingPredicate:keysToFetch:error:", v13, *(_QWORD *)(a1 + 40), 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v7 = (void *)v13;
  }

}

@end
