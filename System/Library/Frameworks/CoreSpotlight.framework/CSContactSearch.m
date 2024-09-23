@implementation CSContactSearch

void __31___CSContactSearch_targetQueue__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  dispatch_queue_attr_make_initially_inactive(MEMORY[0x1E0C80D50]);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.corespotlight.contactsPeopleSuggester", v1);
  v3 = (void *)targetQueue_targetQueue;
  targetQueue_targetQueue = (uint64_t)v2;

  dispatch_queue_set_width();
  dispatch_activate((dispatch_object_t)targetQueue_targetQueue);
}

uint64_t __25___CSContactSearch_start__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "autocompleteEnabled");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "startAutocompleteContactsSearch");
  else
    return objc_msgSend(v3, "startContactsSearch");
}

void __32___CSContactSearch_contactStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(+[CSContactsWrapper CNContactStoreClass](CSContactsWrapper, "CNContactStoreClass"));
  v1 = (void *)contactStore_store;
  contactStore_store = (uint64_t)v0;

}

void __37___CSContactSearch_autocompleteStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(+[CSAutocompleteContactsWrapper CNAutocompleteStoreClass](CSAutocompleteContactsWrapper, "CNAutocompleteStoreClass"));
  v1 = (void *)autocompleteStore_store;
  autocompleteStore_store = (uint64_t)v0;

}

void __39___CSContactSearch_startContactsSearch__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _CSContactSearchResult *v23;
  void *v24;
  _CSContactSearchResult *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(v2, "contactsMatchingQuery:error:", v3, &v46);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v46;

  if (!v5)
  {
    v33 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_alloc_init(+[CSContactsWrapper CNContactFormatterClass](CSContactsWrapper, "CNContactFormatterClass"));
    objc_msgSend(v35, "setStyle:", 0);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v30 = v4;
    obj = v4;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (!v36)
      goto LABEL_33;
    v34 = *(_QWORD *)v43;
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v6);
        objc_msgSend(v35, "stringFromContact:", v7);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v7, "emailAddresses");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v39 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(v14, "value");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "length");

              if (v16)
              {
                objc_msgSend(v14, "value");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObject:", v17);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          }
          while (v11);
        }

        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(v7, "givenName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18 || (objc_msgSend(v7, "middleName"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {

            goto LABEL_21;
          }
          objc_msgSend(v7, "familyName");
          v19 = (id)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
LABEL_21:
            v19 = objc_alloc_init(MEMORY[0x1E0CB3850]);
            objc_msgSend(v7, "givenName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setGivenName:", v20);

            objc_msgSend(v7, "middleName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setMiddleName:", v21);

            objc_msgSend(v7, "familyName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setFamilyName:", v22);

          }
          v23 = [_CSContactSearchResult alloc];
          objc_msgSend(v7, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[_CSContactSearchResult initWithDisplayName:nameComponents:emailAddresses:contactIdentifier:recentsIdentifier:sourceType:](v23, "initWithDisplayName:nameComponents:emailAddresses:contactIdentifier:recentsIdentifier:sourceType:", v37, v19, v8, v24, 0, 2);

          objc_msgSend(*(id *)(v33 + 32), "query");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v26, "containsString:", CFSTR("@")) & 1) != 0)
          {
            objc_msgSend(*(id *)(v33 + 32), "query");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = +[_CSContactSearch doesContactMatchTerm:contact:](_CSContactSearch, "doesContactMatchTerm:contact:", v27, v25);

            if (!v28)
              goto LABEL_27;
          }
          else
          {

          }
          objc_msgSend(v31, "addObject:", v25);
LABEL_27:

        }
        ++v6;
      }
      while (v6 != v36);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      v36 = v29;
      if (!v29)
      {
LABEL_33:

        objc_msgSend(*(id *)(v33 + 32), "handleCompletionWithContacts:error:", v31, 0);
        v5 = 0;
        v4 = v30;
        goto LABEL_34;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "handleCompletionWithContacts:error:", 0, v5);
LABEL_34:

}

uint64_t __48___CSContactSearch_contactsMatchingQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
