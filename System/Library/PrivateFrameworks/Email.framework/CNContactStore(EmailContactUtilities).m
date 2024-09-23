@implementation CNContactStore(EmailContactUtilities)

+ (id)em_authorizedContactStore
{
  uint64_t v0;
  id v1;

  v0 = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
  v1 = 0;
  if (v0 == 3)
    v1 = objc_alloc_init(MEMORY[0x1E0C97298]);
  return v1;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CNContactStore_EmailContactUtilities__log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1)
    dispatch_once(&log_onceToken_8, block);
  return (id)log_log_8;
}

- (id)em_fetchContactForEmailAddress:()EmailContactUtilities keysToFetch:createIfNeeded:
{
  objc_msgSend(a1, "em_fetchContactForEmailAddress:keysToFetch:allowMatchOnDisplayName:createIfNeeded:", a3, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)em_fetchContactForEmailAddress:()EmailContactUtilities keysToFetch:allowMatchOnDisplayName:createIfNeeded:
{
  objc_msgSend(a1, "_fetchContactForEmailAddress:keysToFetch:allowMatchOnDisplayName:createIfNeeded:error:", a3, a4, a5, a6, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_fetchContactForEmailAddress:()EmailContactUtilities keysToFetch:allowMatchOnDisplayName:createIfNeeded:error:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;

  v12 = a3;
  v13 = a4;
  objc_msgSend(v12, "emailAddressValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v12, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
    v15 = 0;
    if (v20 && a6)
    {
      v21 = (void *)MEMORY[0x1E0C97200];
      objc_msgSend(v20, "ea_addressCommentPersonNameComponents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:allowInvalidEmailAddress:", v22, v17, 0, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (a7 && !v15 && a6)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v24 = v23;
      if (v17)
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, CFSTR("EMContactStoreErrorKeyAddress"));
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EMContactStoreErrorDomain"), 0, v24);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97298], "log");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[CNContactStore(EmailContactUtilities) _fetchContactForEmailAddress:keysToFetch:allowMatchOnDisplayName:createIfNeeded:error:].cold.1((uint64_t)v12, (uint64_t)v13, v25);

    }
    goto LABEL_16;
  }
  objc_msgSend(a1, "_bestContactForEmailAddress:keysToFetch:allowMatchOnDisplayName:error:", v14, v13, a5, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15 && a6)
  {
    v16 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v14, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ec_personNameComponents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "simpleAddress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:allowInvalidEmailAddress:", v18, v19, 0, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  }

  return v15;
}

- (id)em_onScheduler:()EmailContactUtilities contactFutureForEmailAddress:keysToFetch:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D1EEC0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__CNContactStore_EmailContactUtilities__em_onScheduler_contactFutureForEmailAddress_keysToFetch___block_invoke;
  v15[3] = &unk_1E70F2588;
  v15[4] = a1;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "onScheduler:futureWithBlock:", a3, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)em_contactsFutureOnScheduler:()EmailContactUtilities forEmailAddresses:keysToFetch:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D1EEC0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__CNContactStore_EmailContactUtilities__em_contactsFutureOnScheduler_forEmailAddresses_keysToFetch___block_invoke;
  v15[3] = &unk_1E70F25D8;
  v16 = v8;
  v17 = a1;
  v18 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "onScheduler:futureWithBlock:", a3, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_bestContactForEmailAddress:()EmailContactUtilities keysToFetch:allowMatchOnDisplayName:error:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "simpleAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_allContactsForEmailAddress:keysToFetch:error:", v12, v11, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (objc_msgSend(v13, "count") != 1)
    {
      if (objc_msgSend(v13, "count"))
      {
        v15 = (void *)MEMORY[0x1E0C97200];
        objc_msgSend(v10, "displayName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "em_bestMatchForName:fromContacts:keysToCheck:", v16, v13, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
        goto LABEL_11;
      }
      if (a5)
      {
        objc_msgSend(v10, "displayName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_allContactsForName:keysToFetch:error:", v17, v11, a6);
        v18 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v18;
      }
    }
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)_allContactsForEmailAddress:()EmailContactUtilities keysToFetch:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(a1, "em_cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contactsForEmailAddress:keysToFetch:error:", v8, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (id)_allContactsForName:()EmailContactUtilities keysToFetch:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(a1, "em_cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contactsForName:keysToFetch:error:", v8, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (id)allContactEmailAddressesWithError:()EmailContactUtilities
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "em_cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allContactEmailAddressesWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_EMContactsCache)em_cache
{
  _EMContactsCache *v4;

  objc_getAssociatedObject(a1, a2);
  v4 = (_EMContactsCache *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[_EMContactsCache initWithStore:]([_EMContactsCache alloc], "initWithStore:", a1);
    objc_setAssociatedObject(a1, a2, v4, (void *)0x301);
  }
  return v4;
}

- (void)_fetchContactForEmailAddress:()EmailContactUtilities keysToFetch:allowMatchOnDisplayName:createIfNeeded:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_2(&dword_1B99BB000, a2, a3, "Failed to fetch contact for email address: %@ using key descriptors: %@ due to EMContactStoreIllegalEmailAddressError", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
