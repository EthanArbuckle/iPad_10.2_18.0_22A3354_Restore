@implementation CNContactStore(IC)

- (id)ic_existingOrNewContactFromParticipant:()IC keysToFetch:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "userIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lookupInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "emailAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "ic_contactForEmailAddressString:keysToFetch:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v6, "userIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lookupInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "phoneNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 && v14)
  {
    objc_msgSend(a1, "ic_contatForPhoneNumberString:keysToFetch:", v14, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v11)
  {
    v15 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CNContactStore(IC) ic_existingOrNewContactFromParticipant:keysToFetch:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    objc_msgSend(MEMORY[0x1E0C97200], "ic_contactFromParticipant:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)ic_contactForEmailAddressString:()IC keysToFetch:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:", v8, v7, &v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v27;
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v12 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CNContactStore(IC) ic_contactForEmailAddressString:keysToFetch:].cold.2((uint64_t)v10, v12, v13, v14, v15, v16, v17, v18);

    }
    else if (v11)
    {
      v10 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[CNContactStore(IC) ic_contactForEmailAddressString:keysToFetch:].cold.1(v10, v19, v20, v21, v22, v23, v24, v25);
      goto LABEL_11;
    }

    v11 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (id)ic_contatForPhoneNumberString:()IC keysToFetch:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v6);
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:", v10, v7, &v29);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v29;
      objc_msgSend(v11, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v14 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[CNContactStore(IC) ic_contatForPhoneNumberString:keysToFetch:].cold.2((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);

      }
      else if (v13)
      {
        v12 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[CNContactStore(IC) ic_contatForPhoneNumberString:keysToFetch:].cold.1(v12, v21, v22, v23, v24, v25, v26, v27);
        goto LABEL_12;
      }

      v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (id)ic_contactForHandleString:()IC keysToFetch:
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (!v6
    || (objc_msgSend(a1, "ic_contactForEmailAddressString:keysToFetch:", v6, v7),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "ic_contatForPhoneNumberString:keysToFetch:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)ic_existingOrNewContactFromParticipant:()IC keysToFetch:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Created contact for participant", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)ic_contactForEmailAddressString:()IC keysToFetch:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Fetched contact for participant by email address", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)ic_contactForEmailAddressString:()IC keysToFetch:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Cannot fetch contact for participant by email address {error: %@}", a5, a6, a7, a8, 2u);
}

- (void)ic_contatForPhoneNumberString:()IC keysToFetch:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Fetched contact for participant by phone number", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)ic_contatForPhoneNumberString:()IC keysToFetch:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Cannot fetch contact for participant by phone number {error: %@}", a5, a6, a7, a8, 2u);
}

@end
