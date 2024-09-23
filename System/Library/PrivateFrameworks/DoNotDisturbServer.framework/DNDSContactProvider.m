@implementation DNDSContactProvider

+ (id)sharedContactStore
{
  if (sharedContactStore_onceToken != -1)
    dispatch_once(&sharedContactStore_onceToken, &__block_literal_global_4);
  return (id)sharedContactStore_contactStore;
}

void __41__DNDSContactProvider_sharedContactStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v1 = (void *)sharedContactStore_contactStore;
  sharedContactStore_contactStore = (uint64_t)v0;

}

- (DNDSContactProvider)init
{
  DNDSContactProvider *v2;
  uint64_t v3;
  CNContactStore *contactStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DNDSContactProvider;
  v2 = -[DNDSContactProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "sharedContactStore");
    v3 = objc_claimAutoreleasedReturnValue();
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v3;

  }
  return v2;
}

- (id)contactForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNContactStore *contactStore;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v19;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  objc_msgSend(v4, "emailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingHandleStrings:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  if (v10)
  {
    contactStore = self->_contactStore;
    objc_msgSend(MEMORY[0x1E0D1D5C0], "keysToFetch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v10, v13, &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;

    if ((unint64_t)objc_msgSend(v14, "count") < 2)
      objc_msgSend(v14, "firstObject");
    else
      -[DNDSContactProvider _bestMatchForContact:inContacts:](self, "_bestMatchForContact:inContacts:", v4, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D1D5C0], "contactWithCNContact:", v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = DNDSLogSettings;
      v11 = v4;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
      {
        -[DNDSContactProvider contactForContact:].cold.1((uint64_t)v4, v17);
        v11 = v4;
      }
    }

  }
  return v11;
}

- (id)_bestMatchForContact:(id)a3 inContacts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t m;
  NSObject *v66;
  NSObject *v67;
  id v68;
  NSObject *v69;
  __int128 v71;
  id obj;
  uint64_t v73;
  id v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint8_t v103[128];
  uint8_t buf[4];
  uint64_t v105;
  __int16 v106;
  unint64_t v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)DNDSLogSettings;
  if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 134349314;
    v105 = objc_msgSend(v6, "count");
    v106 = 2112;
    v107 = (unint64_t)v5;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Scoring %{public}llu matches for contact %@", buf, 0x16u);

  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = v6;
  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
  if (!v75)
  {
    v74 = 0;
    v76 = 0;
    goto LABEL_70;
  }
  v76 = 0;
  v73 = *(_QWORD *)v96;
  v74 = 0;
  *(_QWORD *)&v9 = 134349056;
  v71 = v9;
  v78 = v5;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v96 != v73)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v10);
      objc_msgSend(v11, "givenName", v71);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v10;
      if (objc_msgSend(v12, "length"))
      {
        objc_msgSend(v5, "firstName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(v11, "givenName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lowercaseString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "firstName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lowercaseString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v15, "isEqualToString:", v17);

          v19 = v18;
          goto LABEL_13;
        }

      }
      v19 = 0;
LABEL_13:
      objc_msgSend(v11, "middleName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length"))
      {
        objc_msgSend(v5, "middleName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "length"))
        {
          objc_msgSend(v11, "middleName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "lowercaseString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "middleName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lowercaseString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v23, "isEqualToString:", v25);

          v19 += v26;
          goto LABEL_18;
        }

      }
LABEL_18:
      objc_msgSend(v11, "familyName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "length"))
      {
        objc_msgSend(v5, "lastName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "length"))
        {
          objc_msgSend(v11, "familyName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "lowercaseString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "lastName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "lowercaseString");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v30, "isEqualToString:", v32);

          v19 += v33;
          goto LABEL_23;
        }

      }
LABEL_23:
      objc_msgSend(v11, "organizationName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "length"))
      {
        objc_msgSend(v5, "organizationName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "length"))
        {
          objc_msgSend(v11, "organizationName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "lowercaseString");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "organizationName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "lowercaseString");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v37, "isEqualToString:", v39);

          v19 += v40;
          goto LABEL_28;
        }

      }
LABEL_28:
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      objc_msgSend(v11, "emailAddresses");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v92;
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v92 != v45)
              objc_enumerationMutation(v42);
            objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i), "value");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addObject:", v47);

          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
        }
        while (v44);
      }

      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      objc_msgSend(v78, "emailAddresses");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v88;
        do
        {
          for (j = 0; j != v50; ++j)
          {
            if (*(_QWORD *)v88 != v51)
              objc_enumerationMutation(v48);
            if (objc_msgSend(v41, "containsObject:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j)))
              v19 += 10;
          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
        }
        while (v50);
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      objc_msgSend(v11, "phoneNumbers");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v84;
        do
        {
          for (k = 0; k != v56; ++k)
          {
            if (*(_QWORD *)v84 != v57)
              objc_enumerationMutation(v54);
            objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * k), "value");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "stringValue");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v60);

          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
        }
        while (v56);
      }

      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v5 = v78;
      objc_msgSend(v78, "phoneNumbers");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
      if (v62)
      {
        v63 = v62;
        v64 = *(_QWORD *)v80;
        do
        {
          for (m = 0; m != v63; ++m)
          {
            if (*(_QWORD *)v80 != v64)
              objc_enumerationMutation(v61);
            if (objc_msgSend(v53, "containsObject:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * m)))
              v19 += 10;
          }
          v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
        }
        while (v63);
      }

      v66 = DNDSLogSettings;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v105 = (uint64_t)v11;
        v106 = 2050;
        v107 = v19;
        _os_log_impl(&dword_1CB895000, v66, OS_LOG_TYPE_DEFAULT, "Contact %@ scored %{public}llu", buf, 0x16u);
      }
      if (v19 > v76)
      {
        v67 = DNDSLogSettings;
        if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v71;
          v105 = v19;
          _os_log_impl(&dword_1CB895000, v67, OS_LOG_TYPE_DEFAULT, "New high score: %{public}llu", buf, 0xCu);
        }
        v68 = v11;

        v74 = v68;
        v76 = v19;
      }

      v10 = v77 + 1;
    }
    while (v77 + 1 != v75);
    v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
  }
  while (v75);
LABEL_70:

  v69 = DNDSLogSettings;
  if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v105 = (uint64_t)v74;
    v106 = 2050;
    v107 = v76;
    _os_log_impl(&dword_1CB895000, v69, OS_LOG_TYPE_DEFAULT, "Contact %@ has the high score %{public}llu", buf, 0x16u);
  }

  return v74;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)contactForContact:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CB895000, a2, OS_LOG_TYPE_ERROR, "Could not fetch a contact for contact: %@", (uint8_t *)&v2, 0xCu);
}

@end
