@implementation FMFContactUtility

+ (id)sharedInstance
{
  if (sharedInstance_dispatch_predicate_3 != -1)
    dispatch_once(&sharedInstance_dispatch_predicate_3, &__block_literal_global_7);
  return (id)sharedInstance__instance_2;
}

void __35__FMFContactUtility_sharedInstance__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  LogCategory_Daemon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DC81B000, v0, OS_LOG_TYPE_INFO, "Creating shared instance of FMFContactUtility", v7, 2u);
  }

  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__instance_2;
  sharedInstance__instance_2 = v1;

  objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedInstance__instance_2, "setContactStore:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend((id)sharedInstance__instance_2, "setContactFormatter:", v4);

  objc_msgSend((id)sharedInstance__instance_2, "contactFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyle:", 0);

  objc_msgSend((id)sharedInstance__instance_2, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestAccessForEntityType:completionHandler:", 0, &__block_literal_global_5);

}

void __35__FMFContactUtility_sharedInstance__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __35__FMFContactUtility_sharedInstance__block_invoke_3_cold_1(a2, (uint64_t)v4, v5);

}

- (id)shortDisplayNameForContact:(id)a3 andHandle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *String;
  int v16;
  const void *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("NSPersonNameDefaultShouldPreferNicknamesPreference"));

  if (!v8
    || (objc_msgSend(v5, "nickname"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        !v10))
  {
    objc_msgSend(v5, "givenName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      objc_msgSend(v5, "givenName");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_8:
    v14 = &stru_1EA4F34A0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "nickname");
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v14 = (__CFString *)v11;
LABEL_9:
  if ((-[__CFString isEqualToString:](v14, "isEqualToString:", &stru_1EA4F34A0) & 1) != 0 || !v14)
  {
    v16 = objc_msgSend(v6, "isPhoneNumber");
    objc_msgSend(v6, "identifier");
    String = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (const void *)CFPhoneNumberCreate();

      String = (void *)CFPhoneNumberCreateString();
      if (v17)
        CFRelease(v17);
    }
    else
    {

    }
  }
  else
  {
    String = v14;
  }
  LogCategory_Daemon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = String;
    v23 = 2112;
    v24 = v19;
    _os_log_impl(&dword_1DC81B000, v18, OS_LOG_TYPE_DEFAULT, "Short display name %@ found for handle %@", (uint8_t *)&v21, 0x16u);

  }
  return String;
}

- (id)displayNameForContact:(id)a3 andHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *String;
  int v15;
  const void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("NSPersonNameDefaultShouldPreferNicknamesPreference"));

    if (v9
      && (objc_msgSend(v6, "nickname"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "length"),
          v10,
          v11))
    {
      objc_msgSend(v6, "nickname");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[FMFContactUtility contactFormatter](self, "contactFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromPotentiallySuggestedContact:relatedToProperty:", v6, 0);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = &stru_1EA4F34A0;
  }
  if ((-[__CFString isEqualToString:](v12, "isEqualToString:", &stru_1EA4F34A0) & 1) != 0 || !v12)
  {
    v15 = objc_msgSend(v7, "isPhoneNumber");
    objc_msgSend(v7, "identifier");
    String = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (const void *)CFPhoneNumberCreate();

      String = (void *)CFPhoneNumberCreateString();
      if (v16)
        CFRelease(v16);
    }
    else
    {

    }
  }
  else
  {
    String = v12;
  }
  LogCategory_Daemon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = String;
    v22 = 2112;
    v23 = v18;
    _os_log_impl(&dword_1DC81B000, v17, OS_LOG_TYPE_DEFAULT, "Display name %@ found for handle %@", (uint8_t *)&v20, 0x16u);

  }
  return String;
}

- (id)getContactForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FMFContactUtility contactKeys](self, "contactKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFContactUtility getContactForHandle:keysToFetch:](self, "getContactForHandle:keysToFetch:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getContactForHandle:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_15;
  }
  v8 = (void *)MEMORY[0x1DF0CE87C]();
  if (!objc_msgSend(v6, "isPhoneNumber"))
  {
    v16 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateForContactsMatchingEmailAddress:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v9 = objc_alloc(MEMORY[0x1E0C97398]);
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithStringValue:", v10);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v13 = (void *)v12;
    goto LABEL_8;
  }
  v13 = 0;
LABEL_8:

  objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", *MEMORY[0x1E0C96708]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v7)
  {
    objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v7);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  LogCategory_Daemon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC81B000, v20, OS_LOG_TYPE_DEFAULT, "Get contacts...", buf, 2u);
  }

  -[FMFContactUtility contactStore](self, "contactStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v21, "unifiedContactsMatchingPredicate:keysToFetch:error:", v13, v18, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;

  LogCategory_Daemon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v14;
    _os_log_impl(&dword_1DC81B000, v22, OS_LOG_TYPE_DEFAULT, "Contacts: %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v8);
  if (!v15)
  {
    -[FMFContactUtility findOptimalContactInContacts:](self, "findOptimalContactInContacts:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_15:
  v23 = 0;
LABEL_17:

  return v23;
}

- (id)findOptimalContactInContacts:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint8_t v16;
  _BYTE v17[15];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v10, "imageData");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v14 = v10;

            v4 = v14;
            goto LABEL_17;
          }
          if (objc_msgSend(v4, "isSuggested") && (objc_msgSend(v10, "isSuggested") & 1) == 0)
          {
            LogCategory_Daemon();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
              -[FMFContactUtility findOptimalContactInContacts:].cold.1(&v16, v17, v12);

            v13 = v10;
            v4 = v13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_17:

  }
  return v4;
}

- (id)contactKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[33];

  v19[32] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C96768];
  v19[0] = *MEMORY[0x1E0C966E8];
  v19[1] = v2;
  v3 = *MEMORY[0x1E0C966D0];
  v19[2] = *MEMORY[0x1E0C96790];
  v19[3] = v3;
  v4 = *MEMORY[0x1E0C966C0];
  v19[4] = *MEMORY[0x1E0C96780];
  v19[5] = v4;
  v5 = *MEMORY[0x1E0C96798];
  v19[6] = *MEMORY[0x1E0C96820];
  v19[7] = v5;
  v6 = *MEMORY[0x1E0C967D8];
  v19[8] = *MEMORY[0x1E0C967A0];
  v19[9] = v6;
  v7 = *MEMORY[0x1E0C967D0];
  v19[10] = *MEMORY[0x1E0C967E0];
  v19[11] = v7;
  v8 = *MEMORY[0x1E0C96698];
  v19[12] = *MEMORY[0x1E0C967B8];
  v19[13] = v8;
  v9 = *MEMORY[0x1E0C96670];
  v19[14] = *MEMORY[0x1E0C96758];
  v19[15] = v9;
  v10 = *MEMORY[0x1E0C967B0];
  v19[16] = *MEMORY[0x1E0C967A8];
  v19[17] = v10;
  v11 = *MEMORY[0x1E0C96890];
  v19[18] = *MEMORY[0x1E0C96708];
  v19[19] = v11;
  v12 = *MEMORY[0x1E0C967F8];
  v19[20] = *MEMORY[0x1E0C96818];
  v19[21] = v12;
  v13 = *MEMORY[0x1E0C96898];
  v19[22] = *MEMORY[0x1E0C96700];
  v19[23] = v13;
  v14 = *MEMORY[0x1E0C966A8];
  v19[24] = *MEMORY[0x1E0C967C0];
  v19[25] = v14;
  v15 = *MEMORY[0x1E0C96690];
  v19[26] = *MEMORY[0x1E0C967F0];
  v19[27] = v15;
  v16 = *MEMORY[0x1E0C96840];
  v19[28] = *MEMORY[0x1E0C968A0];
  v19[29] = v16;
  v17 = *MEMORY[0x1E0C96740];
  v19[30] = *MEMORY[0x1E0C96868];
  v19[31] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __35__FMFContactUtility_sharedInstance__block_invoke_3_cold_1(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_1DC81B000, log, OS_LOG_TYPE_ERROR, "Request access to contact store %d %@", (uint8_t *)v3, 0x12u);
}

- (void)findOptimalContactInContacts:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1DC81B000, log, OS_LOG_TYPE_DEBUG, "Overriding suggested contact with new contact", buf, 2u);
}

@end
