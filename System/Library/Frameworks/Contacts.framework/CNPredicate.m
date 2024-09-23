@implementation CNPredicate

- (void)_cn_acceptVisitor:(id)a3
{
  objc_msgSend(a3, "visitCNPredicate:", self);
}

- (void)mainStoreDidFetchContacts:(id)a3 unifiedFetch:(BOOL)a4
{
  void *v6;
  id v7;
  _QWORD v8[5];
  BOOL v9;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__CNPredicate_mainStoreDidFetchContacts_unifiedFetch___block_invoke;
    v8[3] = &unk_1E29F85D8;
    v8[4] = self;
    v9 = a4;
    objc_msgSend(v7, "_cn_flatMap:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPredicate setMainStoreContactIdentifiers:](self, "setMainStoreContactIdentifiers:", v6);

  }
}

- (void)setMainStoreContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_mainStoreContactIdentifiers, a3);
}

- (id)contactsFromDonationStore:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithLeft:", MEMORY[0x1E0C9AA60]);
}

- (id)suggestedContactsWithSortOrder:(void *)a3 keysToFetch:(unsigned int)a4 mutableObjects:(void *)a5 service:(_QWORD *)a6 error:
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  NSObject *i;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  id *v42;
  void *v43;
  id *v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  void *v49;
  id v50;
  id obj;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[6];
  uint64_t v75;
  id *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v8 = a5;
  v60 = v8;
  if (!a1)
  {
    v24 = 0;
    goto LABEL_62;
  }
  if (!v8)
  {
    if (CNGuardOSLog_cn_once_token_0 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global_104);
    v9 = CNGuardOSLog_cn_once_object_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT))
      -[CNPredicate suggestedContactsWithSortOrder:keysToFetch:mutableObjects:service:error:].cold.3(v9);
  }
  v10 = &unk_1EE18ABB8;
  v59 = a1;
  if (objc_msgSend(v59, "conformsToProtocol:", v10))
    v11 = v59;
  else
    v11 = 0;
  v58 = v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  v76 = (id *)&v75;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__0;
  v79 = __Block_byref_object_dispose__0;
  v80 = 0;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "watchdog");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "statusForEvent:", *MEMORY[0x1E0D13950]) == 0;

  if (v15)
  {
    v55 = objc_alloc_init(MEMORY[0x1E0D13B88]);
    v25 = MEMORY[0x1E0C809B0];
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke;
    v74[3] = &unk_1E29F7EA0;
    v74[5] = &v75;
    v74[4] = v59;
    v26 = (void *)objc_msgSend(v74, "copy");
    objc_opt_self();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = _Block_copy(v27);
    objc_msgSend(v55, "push:", v28);

    if (objc_msgSend(v59, "augmentMainStoreResults"))
    {
      v72[0] = v25;
      v72[1] = 3221225472;
      v72[2] = __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke_87;
      v72[3] = &unk_1E29F7EC8;
      v29 = (id)objc_opt_new();
      v73 = v29;
      objc_msgSend(v57, "enumerateObjectsUsingBlock:", v72);
      if (suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error__cn_once_token_6 != -1)
        dispatch_once(&suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error__cn_once_token_6, &__block_literal_global_89);
      v49 = v29;
      v50 = (id)suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error__cn_once_object_6;
      if (objc_msgSend(v50, "intersectsKeyVector:", v29))
      {
        objc_msgSend(v59, "mainStoreContactIdentifiers");
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
        if (v30)
        {
          v56 = *(_QWORD *)v69;
          while (2)
          {
            for (i = 0; i != v30; i = ((char *)i + 1))
            {
              if (*(_QWORD *)v69 != v56)
                objc_enumerationMutation(obj);
              v32 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
              v67 = 0;
              objc_msgSend(v60, "contactMatchesWithContactIdentifier:limitTo:error:", v32, 1, &v67);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v67;
              v35 = v67;
              if (v35)
              {
                v41 = v35;
                objc_storeStrong(v76 + 5, v34);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CONTACTS: failed to augment contact with identifier %@ with suggestions, error: %@"), v32, v76[5], v49, v50);
                v30 = objc_claimAutoreleasedReturnValue();

                goto LABEL_37;
              }
              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              v64 = 0u;
              v36 = v33;
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
              if (v37)
              {
                v38 = *(_QWORD *)v64;
                do
                {
                  for (j = 0; j != v37; ++j)
                  {
                    if (*(_QWORD *)v64 != v38)
                      objc_enumerationMutation(v36);
                    +[CNContactSuggestionMatch suggestionFromContactMatch:](CNContactSuggestionMatch, "suggestionFromContactMatch:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "setMainStoreLinkedIdentifier:", v32);
                    objc_msgSend(v12, "addObject:", v40);

                  }
                  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
                }
                while (v37);
              }

            }
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
            if (v30)
              continue;
            break;
          }
        }
LABEL_37:

      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
    }
    if (v76[5])
      goto LABEL_40;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v42 = v76 + 5;
      v62 = v76[5];
      objc_msgSend(v58, "suggestionsWithSortOrder:mutableObjects:service:error:", a2, a4, v60, &v62);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v42, v62);
      if (objc_msgSend(v43, "count"))
      {
        objc_msgSend(v12, "addObjectsFromArray:", v43);
LABEL_52:
        v16 = v30;
        goto LABEL_53;
      }
      if (!v76[5])
        goto LABEL_52;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CONTACTS: failed to find suggested contacts, error: %@"), v76[5]);
      v45 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_40:
        v16 = v30;
LABEL_54:
        if (v76[5])
        {
          objc_opt_class();
          +[CNPredicate os_log]();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            -[CNPredicate suggestedContactsWithSortOrder:keysToFetch:mutableObjects:service:error:].cold.1((uint64_t)v16, v46);

          v24 = 0;
          if (a6)
            *a6 = objc_retainAutorelease(v76[5]);
        }
        else
        {
          +[CNPredicate _convertSuggestions:withSortOrder:mutableObjects:]((uint64_t)CNPredicate, v12);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v55, "popAllWithHandler:", &__block_literal_global_102);
        v47 = (id)objc_opt_self();

        goto LABEL_61;
      }
      v44 = v76 + 5;
      v61 = v76[5];
      objc_msgSend(v58, "sgContactMatchesWithSortOrder:mutableObjects:service:error:", a2, a4, v60, &v61);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v44, v61);
      if (objc_msgSend(v43, "count"))
      {
        -[CNPredicate _convertContactMatches:withService:intoSuggestions:]((uint64_t)v59, v43, v60, v12);
        goto LABEL_52;
      }
      if (!v76[5])
        goto LABEL_52;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CONTACTS: failed to fetch suggested contact matches, error: %@"), v76[5]);
      v45 = objc_claimAutoreleasedReturnValue();
    }
    v16 = v45;

LABEL_53:
    goto LABEL_54;
  }
  objc_opt_class();
  +[CNPredicate os_log]();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[CNPredicate suggestedContactsWithSortOrder:keysToFetch:mutableObjects:service:error:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
  v24 = (void *)MEMORY[0x1E0C9AA60];
LABEL_61:

  _Block_object_dispose(&v75, 8);
LABEL_62:

  return v24;
}

- (NSArray)mainStoreContactIdentifiers
{
  return self->_mainStoreContactIdentifiers;
}

- (BOOL)augmentMainStoreResults
{
  return self->_augmentMainStoreResults;
}

+ (id)_convertSuggestions:(uint64_t)a1 withSortOrder:(void *)a2 mutableObjects:
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "mainStoreLinkedIdentifier", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v19 = CFSTR("CNContactMainStoreLinkedIdentifier");
          objc_msgSend(v9, "mainStoreLinkedIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v9, "contact");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        CNContactFromSGContact(v12, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v3, "addObject:", v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainStoreContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_cn_predicate, 0);
}

void __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "code") == 10)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "domain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D19AE8]);

    if (v3)
    {
      objc_opt_class();
      +[CNPredicate os_log]();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "watchdog");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordExceptionForEvent:", *MEMORY[0x1E0D13950]);

    }
  }
}

- (BOOL)cn_hasHighSpecificity
{
  return 0;
}

void __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("emailAddresses");
  v4[1] = CFSTR("phoneNumbers");
  v4[2] = CFSTR("postalAddresses");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error__cn_once_object_6;
  suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error__cn_once_object_6 = v2;

}

id __54__CNPredicate_mainStoreDidFetchContacts_unifiedFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13838] + 16))())
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __54__CNPredicate_mainStoreDidFetchContacts_unifiedFetch___block_invoke_cold_1(v4);

    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    if (*(_BYTE *)(a1 + 40) && objc_msgSend(v3, "isUnified"))
    {
      objc_msgSend(v3, "linkedContacts");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForKey:", CFSTR("identifier"));
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v7;

  }
  return v5;
}

- (CNPredicate)initWithPredicate:(id)a3
{
  id v4;
  CNPredicate *v5;
  uint64_t v6;
  NSPredicate *cn_predicate;
  CNPredicate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPredicate;
  v5 = -[CNPredicate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cn_predicate = v5->_cn_predicate;
    v5->_cn_predicate = (NSPredicate *)v6;

    v5->_augmentMainStoreResults = 1;
    v8 = v5;
  }

  return v5;
}

- (CNPredicate)init
{
  return -[CNPredicate initWithPredicate:](self, "initWithPredicate:", 0);
}

- (id)cn_resultTransformWithMatchInfos:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cn_predicate, CFSTR("_cn_predicate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_augmentMainStoreResults, CFSTR("_augmentMainStoreResults"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mainStoreContactIdentifiers, CFSTR("_mainStoreContactIdentifiers"));

}

+ (id)os_log
{
  if (os_log_cn_once_token_0_1 != -1)
    dispatch_once(&os_log_cn_once_token_0_1, &__block_literal_global_10);
  return (id)os_log_cn_once_object_0_1;
}

void __32__CNPredicate_Suggested__os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.predicates", "suggested-contact");
  v1 = (void *)os_log_cn_once_object_2;
  os_log_cn_once_object_2 = (uint64_t)v0;

}

- (void)_convertContactMatches:(void *)a3 withService:(void *)a4 intoSuggestions:
{
  id v6;
  id v7;
  id v8;

  if (a1)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(a2, "_cn_map:", &__block_literal_global_35);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[CNContactSuggestionMatch fetchLinkedIdentifiersForContactSuggestionMatches:fromSuggestionService:](CNContactSuggestionMatch, "fetchLinkedIdentifiersForContactSuggestionMatches:fromSuggestionService:", v8, v7);

    objc_msgSend(v6, "addObjectsFromArray:", v8);
  }
}

id __77__CNPredicate_Suggested___convertContactMatches_withService_intoSuggestions___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNContactSuggestionMatch suggestionFromContactMatch:](CNContactSuggestionMatch, "suggestionFromContactMatch:", a2);
}

void __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke_87(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  v3 = v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {

    }
    else
    {
      v6 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EE191798);

      if (!v6)
        goto LABEL_9;
    }
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "_cn_requiredKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionKeyVector:", v3);
  }

LABEL_9:
}

uint64_t __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke_100(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __21__CNPredicate_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "predicates");
  v1 = (void *)os_log_cn_once_object_0_1;
  os_log_cn_once_object_0_1 = (uint64_t)v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPredicate)initWithCoder:(id)a3
{
  id v4;
  CNPredicate *v5;
  void *v6;
  uint64_t v7;
  NSPredicate *cn_predicate;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *mainStoreContactIdentifiers;
  CNPredicate *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNPredicate;
  v5 = -[CNPredicate initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cn_predicate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    cn_predicate = v5->_cn_predicate;
    v5->_cn_predicate = (NSPredicate *)v7;

    v5->_augmentMainStoreResults = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_augmentMainStoreResults"));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_mainStoreContactIdentifiers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    mainStoreContactIdentifiers = v5->_mainStoreContactIdentifiers;
    v5->_mainStoreContactIdentifiers = (NSArray *)v13;

    v15 = v5;
  }

  return v5;
}

- (BOOL)evaluateWithObject:(id)a3
{
  return -[NSPredicate evaluateWithObject:](self->_cn_predicate, "evaluateWithObject:", a3);
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  return -[NSPredicate evaluateWithObject:substitutionVariables:](self->_cn_predicate, "evaluateWithObject:substitutionVariables:", a3, a4);
}

- (id)predicateFormat
{
  return -[NSPredicate predicateFormat](self->_cn_predicate, "predicateFormat");
}

- (id)cn_predicate
{
  return self->_cn_predicate;
}

- (NSString)description
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAugmentMainStoreResults:(BOOL)a3
{
  self->_augmentMainStoreResults = a3;
}

- (void)suggestedContactsWithSortOrder:(uint64_t)a1 keysToFetch:(NSObject *)a2 mutableObjects:service:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)suggestedContactsWithSortOrder:(uint64_t)a3 keysToFetch:(uint64_t)a4 mutableObjects:(uint64_t)a5 service:(uint64_t)a6 error:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_18F8BD000, a1, a3, "CoreSuggestions call timed out recently; will not attempt to augment results",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_4();
}

- (void)suggestedContactsWithSortOrder:(os_log_t)log keysToFetch:mutableObjects:service:error:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18F8BD000, log, OS_LOG_TYPE_FAULT, "parameter ‘service’ must be nonnull", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_18F8BD000, a1, a3, "CoreSuggestions call timed out; results may not be augmented in subsequent calls",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_4();
}

void __54__CNPredicate_mainStoreDidFetchContacts_unifiedFetch___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "mainStoreDidFetchContacts: unexpected null contact in list of contacts", v1, 2u);
}

@end
