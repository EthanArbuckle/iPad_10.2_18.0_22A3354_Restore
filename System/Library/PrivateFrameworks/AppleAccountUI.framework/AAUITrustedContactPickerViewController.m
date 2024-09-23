@implementation AAUITrustedContactPickerViewController

- (AAUITrustedContactPickerViewController)init
{
  AAUITrustedContactPickerViewController *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;
  _QWORD v19[2];
  void *v20;
  const __CFString *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)AAUITrustedContactPickerViewController;
  v2 = -[AAUITrustedContactPickerViewController init](&v18, sel_init);
  if (v2)
  {
    v3 = *MEMORY[0x1E0C966E8];
    v23[0] = *MEMORY[0x1E0C966E8];
    v4 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C97298]);
    objc_msgSend(v6, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)) AND (NOT %K IN $IDENTIFIERS)"), v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v8;
      v21 = CFSTR("IDENTIFIERS");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateWithSubstitutionVariables:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactPickerViewController setPredicateForEnablingContact:](v2, "setPredicateForEnablingContact:", v12);

      v4 = 0x1E0C99000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactPickerViewController setPredicateForEnablingContact:](v2, "setPredicateForEnablingContact:", v9);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(emailAddresses.@count == 1 AND phoneNumbers.@count == 0) OR (emailAddresses.@count == 0 AND phoneNumbers.@count == 1)"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController setPredicateForSelectionOfContact:](v2, "setPredicateForSelectionOfContact:", v13);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(property == 'emailAddresses') OR (property == 'phoneNumbers')"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController setPredicateForSelectionOfProperty:](v2, "setPredicateForSelectionOfProperty:", v14);

    v15 = *MEMORY[0x1E0C967C0];
    v19[0] = *MEMORY[0x1E0C966A8];
    v19[1] = v15;
    objc_msgSend(*(id *)(v4 + 3360), "arrayWithObjects:count:", v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController setDisplayedPropertyKeys:](v2, "setDisplayedPropertyKeys:", v16);

  }
  return v2;
}

+ (id)addressKindAndHandleForSingleAddressContact:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  AAUIHandleWithKind *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v3;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "AAUITrustedContactPickerViewController extracting handle and type for contact: %@", (uint8_t *)&v21, 0xCu);
  }

  objc_msgSend(v3, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v3, "emailAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 0;

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v3, "phoneNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {

    if (!v7)
      goto LABEL_18;
    goto LABEL_10;
  }
  objc_msgSend(v3, "emailAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v7)
  {
LABEL_10:
    objc_msgSend(v3, "phoneNumbers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    _AAUILogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v14;
      _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "AAUITrustedContactPickerViewController extracted phone number: %@", (uint8_t *)&v21, 0xCu);
    }
    v16 = 1;
    goto LABEL_13;
  }
  if (v10 != 1)
  {
LABEL_18:
    v14 = 0;
    v16 = 5;
    goto LABEL_19;
  }
  objc_msgSend(v3, "emailAddresses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _AAUILogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v14;
    _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "AAUITrustedContactPickerViewController extracted email: %@", (uint8_t *)&v21, 0xCu);
  }
  v16 = 0;
LABEL_13:

LABEL_19:
  v19 = -[AAUIHandleWithKind initWithHandle:kind:]([AAUIHandleWithKind alloc], "initWithHandle:kind:", v14, v16);

  return v19;
}

@end
