@implementation HFContactStore

+ (HFContactStore)defaultStore
{
  if (_MergedGlobals_223 != -1)
    dispatch_once(&_MergedGlobals_223, &__block_literal_global_2_2);
  return (HFContactStore *)(id)qword_1ED378DD0;
}

void __30__HFContactStore_defaultStore__block_invoke_2()
{
  HFContactStore *v0;
  void *v1;

  v0 = objc_alloc_init(HFContactStore);
  v1 = (void *)qword_1ED378DD0;
  qword_1ED378DD0 = (uint64_t)v0;

}

- (HFContactStore)init
{
  HFContactStore *v2;
  CNContactStore *v3;
  CNContactStore *contactStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFContactStore;
  v2 = -[HFContactStore init](&v6, sel_init);
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

  }
  return v2;
}

- (id)contactForUserHandle:(id)a3 withKeys:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint8_t v14[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(v6, "type");
    if (v8 == 1)
    {
      objc_msgSend(v6, "userID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFContactStore contactForEmailAddress:withKeys:](self, "contactForEmailAddress:withKeys:", v9, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (!v8)
    {
      objc_msgSend(v6, "userID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFContactStore _meContactWithEmailAddress:keys:](self, "_meContactWithEmailAddress:keys:", v9, v7);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v12 = (void *)v10;

      goto LABEL_10;
    }
  }
  HFLogForCategory(0x45uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v14 = 0;
    _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "Cannot create contact because HFUserHandle is nil.", v14, 2u);
  }

  v12 = 0;
LABEL_10:

  return v12;
}

- (id)_meContactWithEmailAddress:(id)a3 keys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "arrayByAddingObject:", *MEMORY[0x1E0C966A8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFContactStore contactStore](self, "contactStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v10, "unifiedMeContactMatchingEmailAddress:keysToFetch:error:", v6, v9, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;

    v8 = v9;
    if (v11)
    {
      if (!v12)
        goto LABEL_4;
LABEL_8:
      HFLogForCategory(0x45uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v12;
        _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "Error fetching me contact: %@", buf, 0xCu);
      }

      if (v11)
        goto LABEL_5;
LABEL_11:
      -[HFContactStore _fallbackContactWithEmailAddress:phoneNumber:](self, "_fallbackContactWithEmailAddress:phoneNumber:", v6, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    v12 = 0;
    v9 = v7;
  }
  -[HFContactStore contactStore](self, "contactStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v12;
  objc_msgSend(v14, "_ios_meContactWithKeysToFetch:error:", v8, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;

  v12 = v15;
  if (v15)
    goto LABEL_8;
LABEL_4:
  if (!v11)
    goto LABEL_11;
LABEL_5:
  v13 = v11;
LABEL_12:
  v17 = v13;

  return v17;
}

- (id)contactForEmailAddress:(id)a3 withKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFContactStore contactStore](self, "contactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v9, "unifiedContactsMatchingPredicate:keysToFetch:error:", v8, v7, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    objc_msgSend(v10, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      HFLogForCategory(0x45uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = (uint64_t)v6;
        v23 = 2112;
        v24 = v11;
        _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "Error fetching contact with email %@: %@", buf, 0x16u);
      }

      HFLogForCategory(0x45uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
        *(_DWORD *)buf = 134217984;
        v22 = v19;
        _os_log_error_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_ERROR, "Contact Store access: %ld", buf, 0xCu);
      }

    }
    if (v12)
    {
      v15 = v12;
    }
    else
    {
      -[HFContactStore _fallbackContactWithEmailAddress:phoneNumber:](self, "_fallbackContactWithEmailAddress:phoneNumber:", v6, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v15;

  }
  else
  {
    HFLogForCategory(0x45uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Email address for user is nil!", buf, 2u);
    }

    -[HFContactStore _fallbackContactWithEmailAddress:phoneNumber:](self, "_fallbackContactWithEmailAddress:phoneNumber:", 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)contactForPhoneNumber:(id)a3 withKeys:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFContactStore.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phoneNumberString"));

  }
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFContactStore contactStore](self, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v11, "unifiedContactsMatchingPredicate:keysToFetch:error:", v10, v8, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    HFLogForCategory(0x45uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = (uint64_t)v7;
      v25 = 2112;
      v26 = v13;
      _os_log_error_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_ERROR, "Error fetching contact with phone number %@: %@", buf, 0x16u);
    }

    HFLogForCategory(0x45uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
      *(_DWORD *)buf = 134217984;
      v24 = v20;
      _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Contact Store access: %ld", buf, 0xCu);
    }

  }
  if (v14)
  {
    v17 = v14;
  }
  else
  {
    -[HFContactStore _fallbackContactWithEmailAddress:phoneNumber:](self, "_fallbackContactWithEmailAddress:phoneNumber:", 0, v9);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  return v18;
}

- (id)_fallbackContactWithEmailAddress:(id)a3 phoneNumber:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C97360]);
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setGivenName:", v5);
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEmailAddresses:", v10);

  }
  else
  {
    objc_msgSend(v6, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGivenName:", v9);
  }

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPhoneNumbers:", v12);

  }
  v13 = (void *)objc_msgSend(v8, "copy");

  return v13;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
