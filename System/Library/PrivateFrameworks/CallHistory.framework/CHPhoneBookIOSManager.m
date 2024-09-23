@implementation CHPhoneBookIOSManager

- (CHPhoneBookIOSManager)initWithContactStore:(id)a3
{
  id v5;
  CHPhoneBookIOSManager *v6;
  CHPhoneBookIOSManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHPhoneBookIOSManager;
  v6 = -[CHPhoneBookIOSManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contactStore, a3);

  return v7;
}

- (id)fetchCNContact:(id)a3 countryCode:(id)a4 isEmail:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  NSObject *v26;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logHandleForDomain:", "ch.pbm");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = (uint64_t)v8;
    v31 = 1024;
    LODWORD(v32) = v5;
    _os_log_impl(&dword_1B3FA4000, v11, OS_LOG_TYPE_DEFAULT, "fetchCNContact! Trying to find contact info for %@, isEmail? %d", buf, 0x12u);
  }

  v12 = (void *)objc_opt_new();
  if (v5)
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v8);
  else
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactMatchingPhoneNumberWithDigits:countryCode:", v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logHandleForDomain:", "ch.pbm");
  v15 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = (uint64_t)v13;
    _os_log_impl(&dword_1B3FA4000, v15, OS_LOG_TYPE_DEFAULT, "The predicate used to find contact: %@", buf, 0xCu);
  }

  v28 = 0;
  -[CHPhoneBookIOSManager fetchCNContactsMatchingPredicate:keysToKetch:error:](self, "fetchCNContactsMatchingPredicate:keysToKetch:error:", v13, MEMORY[0x1E0C9AA60], &v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v28;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logHandleForDomain:", "ch.pbm");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v19;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 134218242;
    v30 = v21;
    v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_1B3FA4000, v20, OS_LOG_TYPE_DEFAULT, "Num of contacts found: %lu for %@", buf, 0x16u);
  }

  if (!objc_msgSend(v16, "count"))
  {
    if (!v16)
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logHandleForDomain:", "ch.pbm");
      v26 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[CHPhoneBookIOSManager fetchCNContact:countryCode:isEmail:].cold.1();

    }
    goto LABEL_17;
  }
  objc_msgSend(v16, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
LABEL_17:
    v24 = CFSTR("kCNContactInfoNotFound");
    goto LABEL_18;
  }
  v23 = v22;
  objc_msgSend(v22, "identifier");
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  objc_msgSend(v12, "setValue:forKey:", v24, CFSTR("kCHABCacheCNContactIdKey"));

  return v12;
}

- (id)fetchFullCNContactForContactIdentifier:(id)a3 isEmail:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v21;
  id v22;
  _QWORD v23[3];

  v4 = a4;
  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (uint64_t *)MEMORY[0x1E0C966A8];
  if (!v4)
    v9 = (uint64_t *)MEMORY[0x1E0C967C0];
  v10 = *v9;
  v23[0] = v7;
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C97200];
  v22 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateForContactsWithIdentifiers:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  -[CHPhoneBookIOSManager fetchCNContactsMatchingPredicate:keysToKetch:error:](self, "fetchCNContactsMatchingPredicate:keysToKetch:error:", v14, v11, &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;
  objc_msgSend(v15, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logHandleForDomain:", "ch.pbm");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CHPhoneBookIOSManager fetchFullCNContactForContactIdentifier:isEmail:].cold.1();

  }
  return v17;
}

- (id)fetchCNContactsMatchingPredicate:(id)a3 keysToKetch:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v8 = (objc_class *)MEMORY[0x1E0C97210];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithKeysToFetch:", v9);

  objc_msgSend(v11, "setPredicate:", v10);
  objc_msgSend(v11, "setUnifyResults:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHPhoneBookIOSManager contactStore](self, "contactStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__CHPhoneBookIOSManager_fetchCNContactsMatchingPredicate_keysToKetch_error___block_invoke;
  v17[3] = &unk_1E6746C88;
  v14 = v12;
  v18 = v14;
  LODWORD(a5) = objc_msgSend(v13, "enumerateContactsWithFetchRequest:error:usingBlock:", v11, a5, v17);

  if ((_DWORD)a5)
    v15 = v14;
  else
    v15 = 0;

  return v15;
}

uint64_t __76__CHPhoneBookIOSManager_fetchCNContactsMatchingPredicate_keysToKetch_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)getPersonsNameForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logHandleForDomain:", "ch.pbm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CHPhoneBookIOSManager getPersonsNameForContact:].cold.2(a2, v7);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logHandleForDomain:", "ch.pbm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CHPhoneBookIOSManager getPersonsNameForContact:].cold.1(a2, (uint64_t)v8, v11);

  return v8;
}

- (id)getLocalizedCallerIdLabelForContact:(id)a3 forCallerId:(id)a4 withCallerIdIsEmail:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v5 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v35 = v7;
    if (v5)
    {
      objc_msgSend(v7, "emailAddresses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      v11 = 0;
      if (v10)
      {
        v12 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v41 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v14, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v8);

            if (v16)
            {
              v17 = v14;

              v11 = v17;
            }
          }
          v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v10);
        v18 = v11;
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      objc_msgSend(v7, "phoneNumbers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = v9;
        v21 = v9;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v22)
        {
          v23 = v22;
          v11 = 0;
          v24 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v37 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
              objc_msgSend(v26, "value", v34);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "isLikePhoneNumber:", v20);

              if (v28)
              {
                v29 = v26;

                v11 = v29;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v23);
        }
        else
        {
          v11 = 0;
        }

        v9 = v34;
      }
      else
      {
        v11 = 0;
      }

      v18 = 0;
      v10 = v11;
    }

    v30 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(v11, "label");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForLabel:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v32;
    v7 = v35;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)fetchCNContact:countryCode:isEmail:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Error looking for contacts matching caller ID %@, error: %@");
}

- (void)fetchFullCNContactForContactIdentifier:isEmail:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Can't find contact for identifier %@, error: %@");
}

- (void)getPersonsNameForContact:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1B3FA4000, a3, OS_LOG_TYPE_DEBUG, "%@ <== %@", (uint8_t *)&v6, 0x16u);

}

- (void)getPersonsNameForContact:(const char *)a1 .cold.2(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1B3FA4000, a2, OS_LOG_TYPE_DEBUG, "==> %@", (uint8_t *)&v4, 0xCu);

}

@end
