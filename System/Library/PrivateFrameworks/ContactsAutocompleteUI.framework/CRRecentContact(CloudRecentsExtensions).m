@implementation CRRecentContact(CloudRecentsExtensions)

- (id)_contactContext
{
  return objc_getAssociatedObject(a1, "_CRContactContextKey");
}

- (void)_setContactContext:()CloudRecentsExtensions
{
  objc_setAssociatedObject(a1, "_CRContactContextKey", a3, (void *)1);
}

- (id)contactKey
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "kind");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CNAutocompleteContactKeyForRecentsKind(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)existingContactWithKeysToFetch:()CloudRecentsExtensions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  CNAutocompleteSharedContactStore();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "existingContactWithKeysToFetch:contactStore:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)existingContactWithKeysToFetch:()CloudRecentsExtensions contactStore:
{
  id v6;
  id v7;
  _CNAUICRRecentContactCNContext *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_contactContext");
  v8 = (_CNAUICRRecentContactCNContext *)objc_claimAutoreleasedReturnValue();
  -[_CNAUICRRecentContactCNContext existingContact](v8, "existingContact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_CNAUICRRecentContactCNContext existingContact](v8, "existingContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "areKeysAvailable:", v6);

    if ((v11 & 1) == 0)
    {
      -[_CNAUICRRecentContactCNContext existingContact](v8, "existingContact");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "availableKeyDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v6);
        v15 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v15;
      }
      v16 = (void *)MEMORY[0x1E0C97200];
      -[_CNAUICRRecentContactCNContext existingContact](v8, "existingContact");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "predicateForContactsWithIdentifiers:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CNAutocompleteFetchNonUnifiedContactsForPredicate(v7, v20, v14, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CNAUICRRecentContactCNContext setExistingContact:](v8, "setExistingContact:", v22);

LABEL_11:
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D139A0], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isAccessGranted");

    if (v24)
    {
      objc_msgSend(a1, "address");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "contactKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "displayName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      CNAutocompleteCopyClosestMatchingExistingContactUsingAddressesAndDisplayName(v7, v26, v27, v28, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (!v8)
        {
          v8 = objc_alloc_init(_CNAUICRRecentContactCNContext);
          objc_msgSend(a1, "_setContactContext:", v8);
        }
        -[_CNAUICRRecentContactCNContext setExistingContact:](v8, "setExistingContact:", v14);
      }
      goto LABEL_11;
    }
  }
  -[_CNAUICRRecentContactCNContext existingContact](v8, "existingContact");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)contactWithKeysToFetch:()CloudRecentsExtensions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  CNAutocompleteSharedContactStore();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contactWithKeysToFetch:contactStore:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contactWithKeysToFetch:()CloudRecentsExtensions contactStore:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _CNAUICRRecentContactCNContext *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_contactContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interimContact");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend(a1, "existingContactWithKeysToFetch:contactStore:", v6, v7),
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (id)v9;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(a1, "kind");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D18228]);

    objc_msgSend(a1, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v10, "setGivenName:", v14);
    }
    else
    {
      objc_msgSend(v14, "ea_personNameComponents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "namePrefix");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNamePrefix:", v17);

      objc_msgSend(v16, "givenName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setGivenName:", v18);

      objc_msgSend(v16, "middleName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMiddleName:", v19);

      objc_msgSend(v16, "familyName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFamilyName:", v20);

      objc_msgSend(v16, "nameSuffix");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNameSuffix:", v21);

      v15 = v16;
    }

    objc_msgSend(a1, "contactKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0C966A8]))
    {
      objc_msgSend(a1, "address");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0C967C0]))
    {
      v24 = (void *)MEMORY[0x1E0C97398];
      objc_msgSend(a1, "address");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "phoneNumberWithStringValue:", v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", *MEMORY[0x1E0C97000], v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v27, v22);

    v28 = objc_alloc_init(_CNAUICRRecentContactCNContext);
    -[_CNAUICRRecentContactCNContext setInterimContact:](v28, "setInterimContact:", v10);
    objc_msgSend(a1, "_setContactContext:", v28);

    v8 = v28;
  }

  return v10;
}

@end
