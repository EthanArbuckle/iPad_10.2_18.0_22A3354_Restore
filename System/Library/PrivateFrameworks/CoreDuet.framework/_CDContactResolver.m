@implementation _CDContactResolver

+ (id)resolveContactIdentifier:(id)a3 usingStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  objc_class *CNContactClass;
  void *v13;
  void *v14;
  objc_class *CNPhoneNumberClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if (getuid())
    {
      objc_msgSend(v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v5, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsString:", CFSTR("@"));

        CNContactClass = getCNContactClass();
        if (v11)
        {
          objc_msgSend(v5, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[objc_class predicateForContactsMatchingEmailAddress:](CNContactClass, "predicateForContactsMatchingEmailAddress:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          CNPhoneNumberClass = getCNPhoneNumberClass();
          objc_msgSend(v5, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[objc_class phoneNumberWithStringValue:](CNPhoneNumberClass, "phoneNumberWithStringValue:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[objc_class predicateForContactsMatchingPhoneNumber:](CNContactClass, "predicateForContactsMatchingPhoneNumber:", v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (v14)
        {
          getCNContactIdentifierKey();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          objc_msgSend(v7, "unifiedContactsMatchingPredicate:keysToFetch:error:", v14, v18, &v30);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v30;

          if (v20)
          {
            +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              resolve_cold_1((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);

          }
          else if (objc_msgSend(v19, "count"))
          {
            objc_msgSend(v19, "firstObject");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "identifier");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            goto LABEL_17;
          }
          v8 = 0;
          v28 = v19;
LABEL_17:

          goto LABEL_18;
        }
      }
    }
    v8 = 0;
  }
LABEL_18:

  return v8;
}

+ (id)resolveContact:(id)a3 usingStore:(id)a4
{
  void *v4;
  id v7;
  void *v8;

  v4 = 0;
  if (a3 && a4)
  {
    v7 = a4;
    objc_msgSend(a3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "resolveContactIfPossibleFromContactIdentifierString:usingStore:", v8, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)normalizedStringFromContactString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "containsString:", CFSTR("@")) & 1) != 0
      || (-[objc_class phoneNumberWithStringValue:](getCNPhoneNumberClass(), "phoneNumberWithStringValue:", v4),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "unformattedInternationalStringValue"),
          v6 = (id)objc_claimAutoreleasedReturnValue(),
          v5,
          !v6))
    {
      v6 = v4;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)resolveContactIfPossibleFromContactIdentifierString:(id)a3 usingStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *CNContactClass;
  objc_class *CNPhoneNumberClass;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if (getuid())
    {
      if (objc_msgSend(v5, "containsString:", CFSTR("@")))
      {
        -[objc_class predicateForContactsMatchingEmailAddress:](getCNContactClass(), "predicateForContactsMatchingEmailAddress:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
LABEL_6:
          resolve(v9, v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        -[objc_class phoneNumberWithStringValue:](getCNPhoneNumberClass(), "phoneNumberWithStringValue:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        CNContactClass = getCNContactClass();
        CNPhoneNumberClass = getCNPhoneNumberClass();
        objc_msgSend(v10, "unformattedInternationalStringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class phoneNumberWithStringValue:](CNPhoneNumberClass, "phoneNumberWithStringValue:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class predicateForContactsMatchingPhoneNumber:](CNContactClass, "predicateForContactsMatchingPhoneNumber:", v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          goto LABEL_6;
      }
      v8 = 0;
      goto LABEL_10;
    }
    v8 = 0;
  }
LABEL_11:

  return v8;
}

+ (id)resolveContactIfPossibleFromContactIdentifierString:(id)a3
{
  id v4;
  id v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init(getCNContactStoreClass());
    objc_msgSend(a1, "resolveContactIfPossibleFromContactIdentifierString:usingStore:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
