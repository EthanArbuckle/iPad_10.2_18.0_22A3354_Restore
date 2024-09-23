@implementation EMContactsCache

uint64_t __62___EMContactsCache_contactsForEmailAddress_keysToFetch_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", *(_QWORD *)(a1 + 32));
}

uint64_t __54___EMContactsCache_contactsForName_keysToFetch_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", *(_QWORD *)(a1 + 32));
}

id __75___EMContactsCache__contactsForKey_cache_keysToFetch_predicateBlock_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id obj;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "unifiedContactsMatchingPredicate:keysToFetch:error:", v2, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "ef_mapSelector:", sel_identifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __54___EMContactsCache_allContactEmailAddressesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addressesCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54___EMContactsCache_allContactEmailAddressesWithError___block_invoke_2;
  v10[3] = &unk_1E70F2650;
  v7 = v5;
  v11 = v7;
  v8 = (id)objc_msgSend(v6, "objectForKey:generator:", v9, v10);

}

id __54___EMContactsCache_allContactEmailAddressesWithError___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
