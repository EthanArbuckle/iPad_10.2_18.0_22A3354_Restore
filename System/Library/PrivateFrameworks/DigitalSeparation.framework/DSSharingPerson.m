@implementation DSSharingPerson

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSSharingPerson");
    v3 = (void *)DSLogSharingPerson;
    DSLogSharingPerson = (uint64_t)v2;

  }
}

- (DSSharingPerson)initWithSource:(id)a3 sharedResource:(id)a4 participant:(id)a5 deviceOwnerRole:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  DSSharingPerson *v13;
  uint64_t v14;
  NSMutableDictionary *sources;
  uint64_t v16;
  NSMutableDictionary *participantsBySource;
  uint64_t v18;
  NSMutableDictionary *sharedResourcesBySource;
  uint64_t v20;
  NSMutableSet *emailAddresses;
  uint64_t v22;
  NSMutableSet *names;
  uint64_t v24;
  NSMutableDictionary *shareDirectionBySourceName;
  uint64_t v26;
  NSMapTable *shareDirectionByResource;
  uint64_t v28;
  NSMutableSet *phoneNumbers;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)DSSharingPerson;
  v13 = -[DSSharingPerson init](&v31, sel_init);
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    sources = v13->_sources;
    v13->_sources = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    participantsBySource = v13->_participantsBySource;
    v13->_participantsBySource = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    sharedResourcesBySource = v13->_sharedResourcesBySource;
    v13->_sharedResourcesBySource = (NSMutableDictionary *)v18;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    emailAddresses = v13->_emailAddresses;
    v13->_emailAddresses = (NSMutableSet *)v20;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    names = v13->_names;
    v13->_names = (NSMutableSet *)v22;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    shareDirectionBySourceName = v13->_shareDirectionBySourceName;
    v13->_shareDirectionBySourceName = (NSMutableDictionary *)v24;

    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 0, 1282);
    v26 = objc_claimAutoreleasedReturnValue();
    shareDirectionByResource = v13->_shareDirectionByResource;
    v13->_shareDirectionByResource = (NSMapTable *)v26;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v28 = objc_claimAutoreleasedReturnValue();
    phoneNumbers = v13->_phoneNumbers;
    v13->_phoneNumbers = (NSMutableSet *)v28;

    -[DSSharingPerson updateContactFromParticipant:](v13, "updateContactFromParticipant:", v12);
    -[DSSharingPerson addSource:sharedResource:participant:deviceOwnerRole:](v13, "addSource:sharedResource:participant:deviceOwnerRole:", v10, v11, v12, a6);
  }

  return v13;
}

- (void)setSharedResourcesBySource:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setEmailAddresses:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setNames:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setShareDirectionBySourceName:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)setShareDirectionByResource:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)setPhoneNumbers:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)updateContactFromParticipant:(id)a3
{
  DSSharingPerson *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  DSSharingPerson *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  DSSharingPerson *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  DSSharingPerson *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  DSSharingPerson *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  DSSharingPerson *v49;
  void *v50;
  uint8_t buf[4];
  DSSharingPerson *v52;
  __int16 v53;
  DSSharingPerson *v54;
  __int16 v55;
  DSSharingPerson *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = (DSSharingPerson *)a3;
  -[DSSharingPerson contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    -[DSSharingPerson identity](v4, "identity");
    v8 = (DSSharingPerson *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPerson unifiedContactIdentifier](v8, "unifiedContactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDBACA0];
      -[DSSharingPerson unifiedContactIdentifier](v8, "unifiedContactIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "predicateForContactsWithIdentifiers:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v7, "addObject:", v14);

    }
    -[DSSharingPerson nameComponents](v8, "nameComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDD1738];
      -[DSSharingPerson nameComponents](v8, "nameComponents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringFromPersonNameComponents:style:options:", v17, 3, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "length"))
      {
        objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingName:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v7, "addObject:", v19);

      }
    }
    -[DSSharingPerson emailAddress](v8, "emailAddress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "length");

    if (v21)
    {
      v22 = (void *)MEMORY[0x24BDBACA0];
      -[DSSharingPerson emailAddress](v8, "emailAddress");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "predicateForContactsMatchingEmailAddress:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v7, "addObject:", v24);

    }
    -[DSSharingPerson phoneNumber](v8, "phoneNumber");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    if (v26)
    {
      v27 = (void *)MEMORY[0x24BDBAD88];
      -[DSSharingPerson phoneNumber](v8, "phoneNumber");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "phoneNumberWithStringValue:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingPhoneNumber:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v7, "addObject:", v30);

      }
    }
    -[DSSharingPerson contactMatchingPredicates:](self, "contactMatchingPredicates:", v7);
    v31 = (DSSharingPerson *)objc_claimAutoreleasedReturnValue();
    v32 = DSLogSharingPerson;
    if (v31)
    {
      if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138478339;
        v52 = v31;
        v53 = 2114;
        v54 = self;
        v55 = 2113;
        v56 = v8;
        _os_log_impl(&dword_227D24000, v32, OS_LOG_TYPE_INFO, "Found contact %{private}@ for %{public}@ source: %{private}@", buf, 0x20u);
      }
      -[DSSharingPerson identifier](v31, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSSharingPerson setIdentifier:]((uint64_t)self, v33);

      -[DSSourceDescriptor setSourceName:]((uint64_t)self, v31);
      goto LABEL_37;
    }
    if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v52 = v8;
      v53 = 2114;
      v54 = self;
      _os_log_impl(&dword_227D24000, v32, OS_LOG_TYPE_DEFAULT, "No contact found for identity: %{private}@, person: %{public}@ . Trying other fallbacks...", buf, 0x16u);
    }
    -[DSSharingPerson nameComponents](v8, "nameComponents");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = (void *)MEMORY[0x24BDD1738];
      -[DSSharingPerson nameComponents](v8, "nameComponents");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringFromPersonNameComponents:style:options:", v36, 3, 0);
      v37 = (DSSharingPerson *)objc_claimAutoreleasedReturnValue();

      if (-[DSSharingPerson length](v37, "length"))
      {
        v38 = DSLogSharingPerson;
        if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138478083;
          v52 = v37;
          v53 = 2114;
          v54 = self;
          _os_log_impl(&dword_227D24000, v38, OS_LOG_TYPE_INFO, "Falling back to name component %{private}@ for %{public}@", buf, 0x16u);
        }
        goto LABEL_36;
      }

    }
    -[DSSharingPerson emailAddress](v8, "emailAddress");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "length");

    if (v40)
    {
      v41 = (void *)DSLogSharingPerson;
      if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
      {
        v42 = v41;
        -[DSSharingPerson emailAddress](v8, "emailAddress");
        v43 = (DSSharingPerson *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v52 = v43;
        v53 = 2114;
        v54 = self;
        _os_log_impl(&dword_227D24000, v42, OS_LOG_TYPE_INFO, "Falling back to email %{private}@ for %{public}@", buf, 0x16u);

      }
      -[DSSharingPerson emailAddress](v8, "emailAddress");
      v44 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[DSSharingPerson phoneNumber](v8, "phoneNumber");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "length");

      if (!v46)
      {
LABEL_37:

        goto LABEL_38;
      }
      v47 = (void *)DSLogSharingPerson;
      if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
      {
        v48 = v47;
        -[DSSharingPerson phoneNumber](v8, "phoneNumber");
        v49 = (DSSharingPerson *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v52 = v49;
        v53 = 2114;
        v54 = self;
        _os_log_impl(&dword_227D24000, v48, OS_LOG_TYPE_INFO, "Falling back to phone number %{private}@ for %{public}@", buf, 0x16u);

      }
      -[DSSharingPerson phoneNumber](v8, "phoneNumber");
      v44 = objc_claimAutoreleasedReturnValue();
    }
    v37 = (DSSharingPerson *)v44;
LABEL_36:
    -[DSSharingPerson setIdentifier:]((uint64_t)self, v37);

    goto LABEL_37;
  }
  v6 = (void *)DSLogSharingPerson;
  if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    -[DSSharingPerson contact](self, "contact");
    v8 = (DSSharingPerson *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v52 = v8;
    v53 = 2113;
    v54 = v4;
    v55 = 2114;
    v56 = self;
    _os_log_impl(&dword_227D24000, v7, OS_LOG_TYPE_INFO, "Using cached contact %{private}@ for participant %{private}@, person %{public}@", buf, 0x20u);
LABEL_38:

  }
}

- (void)setIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (id)contactMatchingPredicates:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  id v14;
  __objc2_meth_list **p_opt_class_meths;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  __objc2_meth_list **v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  __int128 v41;
  id obj;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  NSObject *log;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  _QWORD v65[2];
  _BYTE v66[128];
  _BYTE v67[128];
  _QWORD v68[21];

  v68[18] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BDBA2C8];
  v68[0] = *MEMORY[0x24BDBA318];
  v68[1] = v4;
  v5 = *MEMORY[0x24BDBA2C0];
  v68[2] = *MEMORY[0x24BDBA310];
  v68[3] = v5;
  v6 = *MEMORY[0x24BDBA360];
  v68[4] = *MEMORY[0x24BDBA380];
  v68[5] = v6;
  v7 = *MEMORY[0x24BDBA368];
  v68[6] = *MEMORY[0x24BDBA358];
  v68[7] = v7;
  v8 = *MEMORY[0x24BDBA328];
  v68[8] = *MEMORY[0x24BDBA320];
  v68[9] = v8;
  v9 = *MEMORY[0x24BDBA2F0];
  v68[10] = *MEMORY[0x24BDBA3F0];
  v68[11] = v9;
  v10 = *MEMORY[0x24BDBA2E8];
  v68[12] = *MEMORY[0x24BDBA3E8];
  v68[13] = v10;
  v11 = *MEMORY[0x24BDBA288];
  v68[14] = *MEMORY[0x24BDBA340];
  v68[15] = v11;
  v12 = *MEMORY[0x24BDBA250];
  v68[16] = *MEMORY[0x24BDBA348];
  v68[17] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 18);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v3;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  v14 = 0;
  if (v46)
  {
    v43 = *(_QWORD *)v57;
    p_opt_class_meths = &OBJC_PROTOCOL___DSSource.opt_class_meths;
    *(_QWORD *)&v13 = 138478339;
    v41 = v13;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v57 != v43)
          objc_enumerationMutation(obj);
        v48 = v16;
        v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v16);
        v55 = 0;
        objc_msgSend(v44, "unifiedContactsMatchingPredicate:keysToFetch:error:", v17, v45, &v55, v41);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v55;
        v19 = p_opt_class_meths[57];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = v19;
          v21 = objc_msgSend(v18, "count");
          *(_DWORD *)buf = v41;
          v61 = v17;
          v62 = 2113;
          v63 = (uint64_t)v18;
          v64 = 2050;
          v65[0] = v21;
          _os_log_impl(&dword_227D24000, v20, OS_LOG_TYPE_INFO, "Searching contacts with predicate %{private}@ and got %{private}@ (%{public}lu)", buf, 0x20u);

        }
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = v18;
        v22 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v52;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v52 != v24)
                objc_enumerationMutation(v49);
              v26 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v26, 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = p_opt_class_meths[57];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                log = v28;
                v29 = v23;
                v30 = p_opt_class_meths;
                v31 = objc_msgSend(v27, "length");
                objc_msgSend(v26, "imageData");
                v32 = v27;
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v26, "isSuggested");
                *(_DWORD *)buf = 138478595;
                v61 = v32;
                v62 = 2050;
                v63 = v31;
                p_opt_class_meths = v30;
                v23 = v29;
                v64 = 1024;
                LODWORD(v65[0]) = v33 != 0;
                WORD2(v65[0]) = 1026;
                *(_DWORD *)((char *)v65 + 6) = v34;
                _os_log_impl(&dword_227D24000, log, OS_LOG_TYPE_INFO, "Found potential contact match with name: %{private}@ (%{public}lu) and contains-thumbnail: %{BOOL}d, suggested: %{public}d", buf, 0x22u);

                v27 = v32;
              }
              if (objc_msgSend(v27, "length"))
              {
                objc_msgSend(v26, "imageData");
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (v35)
                {
                  v38 = p_opt_class_meths[57];
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138477827;
                    v61 = v26;
                    _os_log_impl(&dword_227D24000, v38, OS_LOG_TYPE_INFO, "Choosing contact %{private}@ because it has a name and image data", buf, 0xCu);
                  }
                  v39 = v26;

                  v14 = v39;
                  goto LABEL_31;
                }
              }
              if (objc_msgSend(v14, "isSuggested")
                && (objc_msgSend(v26, "isSuggested") & 1) == 0
                && objc_msgSend(v27, "length"))
              {
                v36 = p_opt_class_meths[57];
                if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138477827;
                  v61 = v26;
                  _os_log_impl(&dword_227D24000, v36, OS_LOG_TYPE_INFO, "Making contact %{private}@ the current best choice", buf, 0xCu);
                }
                v37 = v26;

                v14 = v37;
              }
              else if (!v14)
              {
                v14 = v26;
              }

            }
            v23 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
            if (v23)
              continue;
            break;
          }
        }
LABEL_31:

        v16 = v48 + 1;
      }
      while (v48 + 1 != v46);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    }
    while (v46);
  }

  return v14;
}

- (void)updateKnownEmailAddressesForParticipant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableSet *emailAddresses;
  NSMutableSet *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSMutableSet *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DSSharingPerson contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
          if (self)
            emailAddresses = self->_emailAddresses;
          else
            emailAddresses = 0;
          v14 = emailAddresses;
          objc_msgSend(v12, "value", (_QWORD)v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](v14, "addObject:", v15);

          ++v11;
        }
        while (v9 != v11);
        v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v9 = v16;
      }
      while (v16);
    }

  }
  objc_msgSend(v4, "identity", (_QWORD)v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "emailAddress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "length"))
  {
    if (self)
      v19 = self->_emailAddresses;
    else
      v19 = 0;
    -[NSMutableSet addObject:](v19, "addObject:", v18);
  }

}

- (uint64_t)emailAddresses
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (void)updateKnownNameForParticipant:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableSet *names;
  void *v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  id v12;

  v12 = a3;
  v4 = (void *)MEMORY[0x24BDBACC0];
  -[DSSharingPerson contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromContact:style:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    if (self)
      names = self->_names;
    else
      names = 0;
    -[NSMutableSet addObject:](names, "addObject:", v6);
  }
  objc_msgSend(v12, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nameComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", v9, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(MEMORY[0x24BE19260], "isStringEmailAddress:", v10) & 1) == 0
      && (objc_msgSend(MEMORY[0x24BE192B0], "isStringPhoneNumber:", v10) & 1) == 0
      && objc_msgSend(v10, "length"))
    {
      if (self)
        v11 = self->_names;
      else
        v11 = 0;
      -[NSMutableSet addObject:](v11, "addObject:", v10);
    }
  }
  else
  {
    v10 = v6;
  }

}

- (uint64_t)names
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (void)updateKnownPhoneNumbersForParticipant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableSet *phoneNumbers;
  NSMutableSet *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSMutableSet *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DSSharingPerson contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
          if (self)
            phoneNumbers = self->_phoneNumbers;
          else
            phoneNumbers = 0;
          v14 = phoneNumbers;
          objc_msgSend(v12, "value", (_QWORD)v21);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](v14, "addObject:", v16);

          ++v11;
        }
        while (v9 != v11);
        v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v9 = v17;
      }
      while (v17);
    }

  }
  objc_msgSend(v4, "identity", (_QWORD)v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "phoneNumber");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "length"))
  {
    if (self)
      v20 = self->_phoneNumbers;
    else
      v20 = 0;
    -[NSMutableSet addObject:](v20, "addObject:", v19);
  }

}

- (uint64_t)phoneNumbers
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (void)updateShareDirectionForParticipant:(id)a3 source:(id)a4 sharedResource:(id)a5 deviceOwnerRole:(int64_t)a6
{
  id v10;
  id v11;
  uint64_t v12;
  NSMutableDictionary *shareDirectionBySourceName;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSMapTable *shareDirectionByResource;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  v10 = a4;
  v11 = a5;
  if (a6 == 2)
  {
    v22 = objc_msgSend(v24, "role");
    if (v22 == 1)
      v12 = 1;
    else
      v12 = 4 * (v22 == 2);
    if (self)
      goto LABEL_6;
  }
  else
  {
    if (a6 == 1)
      v12 = 2;
    else
      v12 = 0;
    if (self)
    {
LABEL_6:
      shareDirectionBySourceName = self->_shareDirectionBySourceName;
      goto LABEL_7;
    }
  }
  shareDirectionBySourceName = 0;
LABEL_7:
  v14 = shareDirectionBySourceName;
  objc_msgSend(v10, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v17 | v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v19 = self->_shareDirectionBySourceName;
    objc_msgSend(v10, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v20);

    shareDirectionByResource = self->_shareDirectionByResource;
  }
  else
  {
    objc_msgSend(v10, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "setObject:forKeyedSubscript:", v18, v23);

    shareDirectionByResource = 0;
  }
  NSMapInsert(shareDirectionByResource, v11, (const void *)v12);

}

- (uint64_t)shareDirectionBySourceName
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (uint64_t)shareDirectionByResource
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (unint64_t)shareDirectionForSourceName:(id)a3
{
  void *v3;
  unint64_t v4;

  if (self)
    self = (DSSharingPerson *)self->_shareDirectionBySourceName;
  -[DSSharingPerson objectForKeyedSubscript:](self, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)shareDirectionForSharedResource:(id)a3
{
  NSMapTable *shareDirectionByResource;
  NSMapTable *v5;
  void *v6;

  if (self)
    shareDirectionByResource = self->_shareDirectionByResource;
  else
    shareDirectionByResource = 0;
  v5 = shareDirectionByResource;
  v6 = NSMapGet(v5, a3);

  return (unint64_t)v6;
}

- (void)addSource:(id)a3 sharedResource:(id)a4 participant:(id)a5 deviceOwnerRole:(int64_t)a6
{
  id v10;
  id v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *participantsBySource;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  NSMutableDictionary *sharedResourcesBySource;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v10 = a4;
  v11 = a5;
  if (self)
  {
    v12 = self->_sources;
    objc_msgSend(v29, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v29, v13);

    participantsBySource = self->_participantsBySource;
  }
  else
  {
    objc_msgSend(v29, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "setObject:forKeyedSubscript:", v29, v27);

    participantsBySource = 0;
  }
  v15 = participantsBySource;
  objc_msgSend(v29, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "addObject:", v11);
  if (self)
  {
    v18 = self->_participantsBySource;
    objc_msgSend(v29, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v19);

    sharedResourcesBySource = self->_sharedResourcesBySource;
  }
  else
  {
    objc_msgSend(v29, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "setObject:forKeyedSubscript:", v17, v28);

    sharedResourcesBySource = 0;
  }
  v21 = sharedResourcesBySource;
  objc_msgSend(v29, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v23, "addObject:", v10);
  if (self)
    v24 = self->_sharedResourcesBySource;
  else
    v24 = 0;
  v25 = v24;
  objc_msgSend(v29, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v23, v26);

  -[DSSharingPerson updateKnownEmailAddressesForParticipant:](self, "updateKnownEmailAddressesForParticipant:", v11);
  -[DSSharingPerson updateKnownNameForParticipant:](self, "updateKnownNameForParticipant:", v11);
  -[DSSharingPerson updateShareDirectionForParticipant:source:sharedResource:deviceOwnerRole:](self, "updateShareDirectionForParticipant:source:sharedResource:deviceOwnerRole:", v11, v29, v10, a6);
  -[DSSharingPerson updateKnownPhoneNumbersForParticipant:](self, "updateKnownPhoneNumbersForParticipant:", v11);

}

- (uint64_t)sharedResourcesBySource
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (void)removeSource:(id)a3
{
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *sources;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id v12;

  if (self)
  {
    v5 = self->_participantsBySource;
    objc_msgSend(a3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeAllObjects");
    sources = self->_sources;
  }
  else
  {
    objc_msgSend(a3, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

    sources = 0;
  }
  v9 = sources;
  objc_msgSend(a3, "name");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", 0, v12);
}

- (void)removeParticipant:(id)a3 fromSource:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *participantsBySource;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *sources;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  v7 = v6;
  if (self)
  {
    v8 = self->_participantsBySource;
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "removeObject:", v21);
    participantsBySource = self->_participantsBySource;
  }
  else
  {
    objc_msgSend(v6, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObject:", v21);

    participantsBySource = 0;
  }
  v12 = participantsBySource;
  objc_msgSend(v7, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "count");
  if (!v15)
  {
    if (self)
      sources = self->_sources;
    else
      sources = 0;
    v17 = sources;
    objc_msgSend(v7, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", 0, v18);

  }
}

- (int64_t)score
{
  NSMutableDictionary *sources;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  NSMutableSet *names;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  if (self)
    sources = self->_sources;
  else
    sources = 0;
  v4 = sources;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "priority");
        v12 = __OFADD__(v7, v11);
        v7 += v11;
        if (v12)
        {
          v13 = (void *)DSLogSharingPerson;
          if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_FAULT))
            -[DSSharingPerson score].cold.1(self == 0, (uint64_t)self, v13);

          return 0x7FFFFFFFFFFFFFFFLL;
        }

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }

  if (self)
    names = self->_names;
  else
    names = 0;
  return (__PAIR128__(v7, -[NSMutableSet count](names, "count", (_QWORD)v16)) - 1) >> 64;
}

- (id)sharedResourcesForSourceName:(id)a3
{
  void *v3;
  void *v4;

  if (self)
    self = (DSSharingPerson *)self->_sharedResourcesBySource;
  -[DSSharingPerson objectForKeyedSubscript:](self, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)participationForSourceName:(id)a3
{
  void *v3;
  void *v4;

  if (self)
    self = (DSSharingPerson *)self->_participantsBySource;
  -[DSSharingPerson objectForKeyedSubscript:](self, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (unint64_t)hash
{
  if (self)
    self = (DSSharingPerson *)self->_identifier;
  return -[DSSharingPerson hash](self, "hash");
}

- (uint64_t)identifier
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  DSSharingPerson *v4;
  NSString *identifier;
  NSString *v6;
  NSString *v7;
  char v8;

  v4 = (DSSharingPerson *)a3;
  if (v4 == self)
  {
    v8 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    goto LABEL_9;
  }
  if (!self)
  {
    identifier = 0;
    if (v4)
      goto LABEL_5;
LABEL_11:
    v6 = 0;
    goto LABEL_6;
  }
  identifier = self->_identifier;
  if (!v4)
    goto LABEL_11;
LABEL_5:
  v6 = v4->_identifier;
LABEL_6:
  v7 = identifier;
  v8 = -[NSString isEqualToString:](v7, "isEqualToString:", v6);

LABEL_9:
  return v8;
}

- (BOOL)isMe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *identifier;
  int v8;
  void *v9;
  int v10;
  NSString *v11;
  NSObject *v12;
  NSMutableSet *emailAddresses;
  void *v14;
  NSMutableSet *v15;
  NSObject *v16;
  NSObject *v17;
  NSMutableSet *phoneNumbers;
  void *v19;
  NSMutableSet *v20;
  NSObject *v21;
  int v23;
  NSMutableSet *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "meCardIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self)
    identifier = self->_identifier;
  else
    identifier = 0;
  v8 = objc_msgSend(v5, "isEqualToString:", identifier);

  if (!v8)
  {
    objc_msgSend(v4, "emails");
    v12 = objc_claimAutoreleasedReturnValue();
    if (self)
      emailAddresses = self->_emailAddresses;
    else
      emailAddresses = 0;
    if (-[NSMutableSet intersectsSet:](emailAddresses, "intersectsSet:", v12))
    {
      v14 = (void *)DSLogSharingPerson;
      LOBYTE(v10) = 1;
      if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
      {
        if (self)
          v15 = self->_emailAddresses;
        else
          v15 = 0;
        v23 = 138478083;
        v24 = v15;
        v25 = 2113;
        v26 = v12;
        v16 = v14;
        _os_log_impl(&dword_227D24000, v16, OS_LOG_TYPE_INFO, "%{private}@ is one of the email addresses in the Apple ID primary account: %{private}@", (uint8_t *)&v23, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v4, "phoneNumbers");
      v17 = objc_claimAutoreleasedReturnValue();
      if (self)
        phoneNumbers = self->_phoneNumbers;
      else
        phoneNumbers = 0;
      v10 = -[NSMutableSet intersectsSet:](phoneNumbers, "intersectsSet:", v17);
      if (v10)
      {
        v19 = (void *)DSLogSharingPerson;
        if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
        {
          if (self)
            v20 = self->_phoneNumbers;
          else
            v20 = 0;
          v23 = 138478083;
          v24 = v20;
          v25 = 2113;
          v26 = v17;
          v21 = v19;
          _os_log_impl(&dword_227D24000, v21, OS_LOG_TYPE_INFO, "%{private}@ is one of the phone numbers in the Apple ID primary account: %{private}@", (uint8_t *)&v23, 0x16u);

        }
      }

    }
    goto LABEL_23;
  }
  v9 = (void *)DSLogSharingPerson;
  LOBYTE(v10) = 1;
  if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
  {
    if (self)
      v11 = self->_identifier;
    else
      v11 = 0;
    v23 = 138477827;
    v24 = (NSMutableSet *)v11;
    v12 = v9;
    _os_log_impl(&dword_227D24000, v12, OS_LOG_TYPE_INFO, "%{private}@ is the me card", (uint8_t *)&v23, 0xCu);
LABEL_23:

  }
  return v10;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSMutableSet *names;
  uint64_t v15;
  void *v16;
  NSString *identifier;
  void *v18;
  uint64_t v19;
  void *v20;

  -[DSSharingPerson contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBACC0];
    -[DSSharingPerson contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromContact:style:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[DSSharingPerson contact](self, "contact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "emailAddresses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      -[DSSharingPerson contact](self, "contact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      if (v9)
      {
        objc_msgSend(v10, "emailAddresses");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v10, "phoneNumbers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (!v19)
        {
          v13 = 0;
          return v13;
        }
        -[DSSharingPerson contact](self, "contact");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "phoneNumbers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringValue");
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_16;
    }
LABEL_9:
    v16 = (void *)MEMORY[0x24BDD17C8];
    DSLocStringForKey(CFSTR("SHARING_PERSON_DISPLAY_NAME"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v11, v6);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    return v13;
  }
  if (self)
    names = self->_names;
  else
    names = 0;
  -[NSMutableSet anyObject](names, "anyObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v6 = (void *)v15;
    goto LABEL_9;
  }
  if (self)
    identifier = self->_identifier;
  else
    identifier = 0;
  v13 = identifier;
  return v13;
}

- (NSString)displayGivenName
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDD1730]);
  -[DSSharingPerson contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGivenName:", v5);

  -[DSSharingPerson contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFamilyName:", v7);

  objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", v3, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = v8;
  }
  else
  {
    -[DSSharingPerson displayName](self, "displayName");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return (NSString *)v10;
}

- (NSArray)termsOfAddress
{
  void *v3;
  void *v4;
  void *v5;

  -[DSSharingPerson contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DSSharingPerson contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "termsOfAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  return (NSArray *)v5;
}

- (NSArray)sortedSourceNames
{
  void *v2;
  void *v3;

  if (self)
    self = (DSSharingPerson *)self->_sources;
  -[DSSharingPerson allKeys](self, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __36__DSSharingPerson_sortedSourceNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "priority");
  if (v7 >= objc_msgSend(v6, "priority"))
  {
    v9 = objc_msgSend(v5, "priority");
    if (v9 <= objc_msgSend(v6, "priority"))
    {
      objc_msgSend(v5, "localizedName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "localizedStandardCompare:", v11);

    }
    else
    {
      v8 = -1;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (NSArray)allSources
{
  if (self)
    self = (DSSharingPerson *)self->_sources;
  return (NSArray *)-[DSSharingPerson allValues](self, "allValues");
}

- (NSString)localizedDetail
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[DSSharingPerson sortedSourceNames](self, "sortedSourceNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  +[DSUtilities localizedDetailStringWithTruncationFromArray:withType:](DSUtilities, "localizedDetailStringWithTruncationFromArray:withType:", v3, CFSTR("com.apple.DigitalSeparation.Resources"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)stopSharingSources:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *participantsBySource;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  char *v26;
  void *v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char *v38;
  void *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  os_signpost_id_t v44;
  const char *v45;
  void *v46;
  int v47;
  NSObject *v48;
  void *v49;
  int v50;
  NSObject *v51;
  void *v52;
  int v53;
  NSObject *v54;
  void *v55;
  int v56;
  NSObject *v57;
  void *v58;
  int v59;
  NSObject *v60;
  void *v61;
  int v62;
  NSObject *v63;
  void *v64;
  int v65;
  NSObject *v66;
  void *v67;
  int v68;
  NSObject *v69;
  void *v70;
  int v71;
  NSObject *v72;
  void *v73;
  int v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  int v81;
  NSObject *v82;
  void *v83;
  int v84;
  NSObject *v85;
  void *v86;
  int v87;
  NSObject *v88;
  void *v89;
  int v90;
  NSObject *v91;
  void *v92;
  int v93;
  NSObject *v94;
  void *v95;
  int v96;
  NSObject *v97;
  void *v98;
  int v99;
  NSObject *v100;
  void *v101;
  int v102;
  NSObject *v103;
  void *v104;
  int v105;
  NSObject *v106;
  void *v107;
  int v108;
  NSObject *v109;
  NSObject *v110;
  void *v111;
  id v112;
  void *v113;
  uint64_t v114;
  id v115;
  id v116;
  id v117;
  os_signpost_id_t spid;
  NSObject *queue;
  id obj;
  uint64_t v121;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  id v126;
  void *v127;
  _QWORD block[4];
  id v129;
  id v130;
  os_signpost_id_t v131;
  _QWORD v132[6];
  id v133;
  NSObject *v134;
  id v135[2];
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _QWORD v140[5];
  id v141;
  id v142;
  NSObject *v143;
  id v144[2];
  id location;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  uint8_t v150[4];
  uint64_t v151;
  uint8_t v152[128];
  uint8_t buf[4];
  void *v154;
  __int16 v155;
  void *v156;
  uint8_t v157[4];
  uint64_t v158;
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  queue = a4;
  v117 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_group_create();
  v9 = os_signpost_id_generate((os_log_t)DSLogSharingPerson);
  v10 = (id)DSLogSharingPerson;
  v11 = v10;
  spid = v9;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_227D24000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "stop", " enableTelemetry=YES ", buf, 2u);
  }

  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  obj = v7;
  v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v159, 16);
  if (v123)
  {
    v121 = *(_QWORD *)v147;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v147 != v121)
        {
          v13 = v12;
          objc_enumerationMutation(obj);
          v12 = v13;
        }
        v124 = v12;
        v14 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * v12);
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = +[DSRestrictionStore isSourceRestricted:](DSRestrictionStore, "isSourceRestricted:", v15);

        if (v16)
        {
          v17 = (void *)DSLogSharingPerson;
          if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
          {
            v18 = v17;
            objc_msgSend(v14, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v154 = v19;
            _os_log_impl(&dword_227D24000, v18, OS_LOG_TYPE_INFO, "Cannot reset %@ due to restrictions", buf, 0xCu);

          }
          objc_msgSend(v14, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[DSError errorWithCode:sourceName:](DSError, "errorWithCode:sourceName:", 6, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "addObject:", v21);

          goto LABEL_127;
        }
        objc_initWeak(&location, self);
        if (self)
          participantsBySource = self->_participantsBySource;
        else
          participantsBySource = 0;
        v23 = participantsBySource;
        objc_msgSend(v14, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = (void *)objc_msgSend(v25, "copy");

        if ((unint64_t)objc_msgSend(v125, "count") < 2 || (objc_opt_respondsToSelector() & 1) == 0)
        {
          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          v126 = v125;
          v34 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v136, v152, 16);
          if (!v34)
            goto LABEL_81;
          v35 = *(_QWORD *)v137;
          while (1)
          {
            v36 = 0;
            do
            {
              if (*(_QWORD *)v137 != v35)
                objc_enumerationMutation(v126);
              v37 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v36);
              dispatch_group_enter(v8);
              v38 = (char *)os_signpost_id_generate((os_log_t)DSLogSharingPerson);
              objc_msgSend(v14, "name");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Calendars"));

              if (v40)
              {
                v41 = (id)DSLogSharingPerson;
                v42 = v41;
                if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
                {
                  *(_WORD *)buf = 0;
                  v43 = v42;
                  v44 = (os_signpost_id_t)v38;
                  v45 = "stop.Calendars";
LABEL_70:
                  _os_signpost_emit_with_name_impl(&dword_227D24000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v44, v45, " enableTelemetry=YES ", buf, 2u);
                }
              }
              else
              {
                objc_msgSend(v14, "name");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.FindMy"));

                if (v47)
                {
                  v48 = (id)DSLogSharingPerson;
                  v42 = v48;
                  if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
                  {
                    *(_WORD *)buf = 0;
                    v43 = v42;
                    v44 = (os_signpost_id_t)v38;
                    v45 = "stop.FindMy";
                    goto LABEL_70;
                  }
                }
                else
                {
                  objc_msgSend(v14, "name");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Photos"));

                  if (v50)
                  {
                    v51 = (id)DSLogSharingPerson;
                    v42 = v51;
                    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
                    {
                      *(_WORD *)buf = 0;
                      v43 = v42;
                      v44 = (os_signpost_id_t)v38;
                      v45 = "stop.Photos";
                      goto LABEL_70;
                    }
                  }
                  else
                  {
                    objc_msgSend(v14, "name");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HomeKit.HomeSharing"));

                    if (v53)
                    {
                      v54 = (id)DSLogSharingPerson;
                      v42 = v54;
                      if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
                      {
                        *(_WORD *)buf = 0;
                        v43 = v42;
                        v44 = (os_signpost_id_t)v38;
                        v45 = "stop.Home";
                        goto LABEL_70;
                      }
                    }
                    else
                    {
                      objc_msgSend(v14, "name");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HealthKit.HealthSharing"));

                      if (v56)
                      {
                        v57 = (id)DSLogSharingPerson;
                        v42 = v57;
                        if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
                        {
                          *(_WORD *)buf = 0;
                          v43 = v42;
                          v44 = (os_signpost_id_t)v38;
                          v45 = "stop.Health";
                          goto LABEL_70;
                        }
                      }
                      else
                      {
                        objc_msgSend(v14, "name");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Notes"));

                        if (v59)
                        {
                          v60 = (id)DSLogSharingPerson;
                          v42 = v60;
                          if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
                          {
                            *(_WORD *)buf = 0;
                            v43 = v42;
                            v44 = (os_signpost_id_t)v38;
                            v45 = "stop.Notes";
                            goto LABEL_70;
                          }
                        }
                        else
                        {
                          objc_msgSend(v14, "name");
                          v61 = (void *)objc_claimAutoreleasedReturnValue();
                          v62 = objc_msgSend(v61, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Zelkova"));

                          if (v62)
                          {
                            v63 = (id)DSLogSharingPerson;
                            v42 = v63;
                            if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
                            {
                              *(_WORD *)buf = 0;
                              v43 = v42;
                              v44 = (os_signpost_id_t)v38;
                              v45 = "stop.Zelkova";
                              goto LABEL_70;
                            }
                          }
                          else
                          {
                            objc_msgSend(v14, "name");
                            v64 = (void *)objc_claimAutoreleasedReturnValue();
                            v65 = objc_msgSend(v64, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Fitness"));

                            if (v65)
                            {
                              v66 = (id)DSLogSharingPerson;
                              v42 = v66;
                              if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
                              {
                                *(_WORD *)buf = 0;
                                v43 = v42;
                                v44 = (os_signpost_id_t)v38;
                                v45 = "stop.Activity";
                                goto LABEL_70;
                              }
                            }
                            else
                            {
                              objc_msgSend(v14, "name");
                              v67 = (void *)objc_claimAutoreleasedReturnValue();
                              v68 = objc_msgSend(v67, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.PassKeys"));

                              if (v68)
                              {
                                v69 = (id)DSLogSharingPerson;
                                v42 = v69;
                                if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
                                {
                                  *(_WORD *)buf = 0;
                                  v43 = v42;
                                  v44 = (os_signpost_id_t)v38;
                                  v45 = "stop.Passkeys";
                                  goto LABEL_70;
                                }
                              }
                              else
                              {
                                objc_msgSend(v14, "name");
                                v70 = (void *)objc_claimAutoreleasedReturnValue();
                                v71 = objc_msgSend(v70, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.ItemSharing"));

                                if (v71)
                                {
                                  v72 = (id)DSLogSharingPerson;
                                  v42 = v72;
                                  if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
                                  {
                                    *(_WORD *)buf = 0;
                                    v43 = v42;
                                    v44 = (os_signpost_id_t)v38;
                                    v45 = "stop.ItemSharing";
                                    goto LABEL_70;
                                  }
                                }
                                else
                                {
                                  objc_msgSend(v14, "name");
                                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                                  v74 = objc_msgSend(v73, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Maps"));

                                  v75 = (id)DSLogSharingPerson;
                                  v42 = v75;
                                  if (v74)
                                  {
                                    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
                                    {
                                      *(_WORD *)buf = 0;
                                      v43 = v42;
                                      v44 = (os_signpost_id_t)v38;
                                      v45 = "stop.Maps";
                                      goto LABEL_70;
                                    }
                                  }
                                  else
                                  {
                                    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
                                    {
                                      *(_WORD *)buf = 0;
                                      _os_signpost_emit_with_name_impl(&dword_227D24000, v42, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v38, "stop.Notes", " enableTelemetry=YES ", buf, 2u);
                                    }

                                    v42 = (id)DSLogSharingPerson;
                                    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
                                    {
                                      objc_msgSend(v14, "name");
                                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[DSSharingPerson stopSharingSources:queue:completion:].cold.1(v78, v150, &v151, v42);
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }

              v76 = (id)DSLogSharingPerson;
              if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v14, "name");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138478083;
                v154 = v37;
                v155 = 2114;
                v156 = v77;
                _os_log_impl(&dword_227D24000, v76, OS_LOG_TYPE_INFO, "Stopping sharing of %{private}@ from source %{public}@", buf, 0x16u);

              }
              v132[0] = MEMORY[0x24BDAC760];
              v132[1] = 3221225472;
              v132[2] = __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_217;
              v132[3] = &unk_24F081F48;
              v132[4] = v14;
              v132[5] = v37;
              v133 = v127;
              objc_copyWeak(v135, &location);
              v135[1] = v38;
              v134 = v8;
              objc_msgSend(v14, "stopSharingWithParticipant:completion:", v37, v132);

              objc_destroyWeak(v135);
              ++v36;
            }
            while (v34 != v36);
            v79 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v136, v152, 16);
            v34 = v79;
            if (!v79)
            {
LABEL_81:

              goto LABEL_126;
            }
          }
        }
        dispatch_group_enter(v8);
        v26 = (char *)os_signpost_id_generate((os_log_t)DSLogSharingPerson);
        objc_msgSend(v14, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Calendars"));

        if (v28)
        {
          v29 = (id)DSLogSharingPerson;
          v30 = v29;
          if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            *(_WORD *)buf = 0;
            v31 = v30;
            v32 = (os_signpost_id_t)v26;
            v33 = "stopParticipants.Calendars";
LABEL_122:
            _os_signpost_emit_with_name_impl(&dword_227D24000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v32, v33, " enableTelemetry=YES ", buf, 2u);
          }
        }
        else
        {
          objc_msgSend(v14, "name");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v80, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.FindMy"));

          if (v81)
          {
            v82 = (id)DSLogSharingPerson;
            v30 = v82;
            if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
            {
              *(_WORD *)buf = 0;
              v31 = v30;
              v32 = (os_signpost_id_t)v26;
              v33 = "stopParticipants.FindMy";
              goto LABEL_122;
            }
          }
          else
          {
            objc_msgSend(v14, "name");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = objc_msgSend(v83, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Photos"));

            if (v84)
            {
              v85 = (id)DSLogSharingPerson;
              v30 = v85;
              if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
              {
                *(_WORD *)buf = 0;
                v31 = v30;
                v32 = (os_signpost_id_t)v26;
                v33 = "stopParticipants.Photos";
                goto LABEL_122;
              }
            }
            else
            {
              objc_msgSend(v14, "name");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = objc_msgSend(v86, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HomeKit.HomeSharing"));

              if (v87)
              {
                v88 = (id)DSLogSharingPerson;
                v30 = v88;
                if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
                {
                  *(_WORD *)buf = 0;
                  v31 = v30;
                  v32 = (os_signpost_id_t)v26;
                  v33 = "stopParticipants.Home";
                  goto LABEL_122;
                }
              }
              else
              {
                objc_msgSend(v14, "name");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = objc_msgSend(v89, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HealthKit.HealthSharing"));

                if (v90)
                {
                  v91 = (id)DSLogSharingPerson;
                  v30 = v91;
                  if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
                  {
                    *(_WORD *)buf = 0;
                    v31 = v30;
                    v32 = (os_signpost_id_t)v26;
                    v33 = "stopParticipants.Health";
                    goto LABEL_122;
                  }
                }
                else
                {
                  objc_msgSend(v14, "name");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  v93 = objc_msgSend(v92, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Notes"));

                  if (v93)
                  {
                    v94 = (id)DSLogSharingPerson;
                    v30 = v94;
                    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
                    {
                      *(_WORD *)buf = 0;
                      v31 = v30;
                      v32 = (os_signpost_id_t)v26;
                      v33 = "stopParticipants.Notes";
                      goto LABEL_122;
                    }
                  }
                  else
                  {
                    objc_msgSend(v14, "name");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    v96 = objc_msgSend(v95, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Zelkova"));

                    if (v96)
                    {
                      v97 = (id)DSLogSharingPerson;
                      v30 = v97;
                      if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
                      {
                        *(_WORD *)buf = 0;
                        v31 = v30;
                        v32 = (os_signpost_id_t)v26;
                        v33 = "stopParticipants.Zelkova";
                        goto LABEL_122;
                      }
                    }
                    else
                    {
                      objc_msgSend(v14, "name");
                      v98 = (void *)objc_claimAutoreleasedReturnValue();
                      v99 = objc_msgSend(v98, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Fitness"));

                      if (v99)
                      {
                        v100 = (id)DSLogSharingPerson;
                        v30 = v100;
                        if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
                        {
                          *(_WORD *)buf = 0;
                          v31 = v30;
                          v32 = (os_signpost_id_t)v26;
                          v33 = "stopParticipants.Activity";
                          goto LABEL_122;
                        }
                      }
                      else
                      {
                        objc_msgSend(v14, "name");
                        v101 = (void *)objc_claimAutoreleasedReturnValue();
                        v102 = objc_msgSend(v101, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.PassKeys"));

                        if (v102)
                        {
                          v103 = (id)DSLogSharingPerson;
                          v30 = v103;
                          if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
                          {
                            *(_WORD *)buf = 0;
                            v31 = v30;
                            v32 = (os_signpost_id_t)v26;
                            v33 = "stopParticipants.Passkeys";
                            goto LABEL_122;
                          }
                        }
                        else
                        {
                          objc_msgSend(v14, "name");
                          v104 = (void *)objc_claimAutoreleasedReturnValue();
                          v105 = objc_msgSend(v104, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.ItemSharing"));

                          if (v105)
                          {
                            v106 = (id)DSLogSharingPerson;
                            v30 = v106;
                            if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
                            {
                              *(_WORD *)buf = 0;
                              v31 = v30;
                              v32 = (os_signpost_id_t)v26;
                              v33 = "stopParticipants.ItemSharing";
                              goto LABEL_122;
                            }
                          }
                          else
                          {
                            objc_msgSend(v14, "name");
                            v107 = (void *)objc_claimAutoreleasedReturnValue();
                            v108 = objc_msgSend(v107, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Maps"));

                            v109 = (id)DSLogSharingPerson;
                            v30 = v109;
                            if (v108)
                            {
                              if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
                              {
                                *(_WORD *)buf = 0;
                                v31 = v30;
                                v32 = (os_signpost_id_t)v26;
                                v33 = "stopParticipants.Maps";
                                goto LABEL_122;
                              }
                            }
                            else
                            {
                              if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
                              {
                                *(_WORD *)buf = 0;
                                _os_signpost_emit_with_name_impl(&dword_227D24000, v30, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v26, "stopParticipants.Notes", " enableTelemetry=YES ", buf, 2u);
                              }

                              v30 = (id)DSLogSharingPerson;
                              if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                              {
                                objc_msgSend(v14, "name");
                                v113 = (void *)objc_claimAutoreleasedReturnValue();
                                -[DSSharingPerson stopSharingSources:queue:completion:].cold.1(v113, v157, &v158, v30);
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }

        v110 = (id)DSLogSharingPerson;
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v14, "name");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          v154 = v125;
          v155 = 2114;
          v156 = v111;
          _os_log_impl(&dword_227D24000, v110, OS_LOG_TYPE_INFO, "Stopping sharing of participants %{private}@ from source %{public}@", buf, 0x16u);

        }
        v140[0] = MEMORY[0x24BDAC760];
        v140[1] = 3221225472;
        v140[2] = __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke;
        v140[3] = &unk_24F081F48;
        v140[4] = v14;
        v112 = v125;
        v141 = v112;
        v142 = v127;
        objc_copyWeak(v144, &location);
        v144[1] = v26;
        v143 = v8;
        objc_msgSend(v14, "stopSharingWithParticipants:completion:", v112, v140);

        objc_destroyWeak(v144);
LABEL_126:

        objc_destroyWeak(&location);
LABEL_127:
        v12 = v124 + 1;
      }
      while (v124 + 1 != v123);
      v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v159, 16);
      v123 = v114;
    }
    while (v114);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_218;
  block[3] = &unk_24F081AC0;
  v129 = v127;
  v130 = v117;
  v131 = spid;
  v115 = v117;
  v116 = v127;
  dispatch_group_notify(v8, queue, block);

}

void __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id WeakRetained;
  void *v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  const char *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  int v45;
  NSObject *v46;
  void *v47;
  int v48;
  NSObject *v49;
  void *v50;
  int v51;
  NSObject *v52;
  void *v53;
  int v54;
  NSObject *v55;
  void *v56;
  int v57;
  NSObject *v58;
  void *v59;
  int v60;
  NSObject *v61;
  NSObject *v62;
  os_signpost_id_t v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  void *v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)DSLogSharingPerson;
  if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v72 = v7;
    _os_log_impl(&dword_227D24000, v6, OS_LOG_TYPE_INFO, "Stopping sharing with %{public}@ for participants complete", buf, 0xCu);

  }
  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ds_errorFromIgnorableError:sourceName:", v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)DSLogSharingPerson;
    if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_ERROR))
    {
      v40 = *(void **)(a1 + 32);
      v41 = v12;
      objc_msgSend(v40, "name");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543875;
      v72 = v42;
      v73 = 2113;
      v74 = v43;
      v75 = 2114;
      v76 = v11;
      _os_log_error_impl(&dword_227D24000, v41, OS_LOG_TYPE_ERROR, "Failed to stop sharing on source %{public}@ for participants %{private}@ because %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v70, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSError errorWithCode:sourceName:underlyingErrors:](DSError, "errorWithCode:sourceName:underlyingErrors:", 2, v13, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
  }
  else
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v15 = *(id *)(a1 + 40);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v66 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(WeakRetained, "removeParticipant:fromSource:", v20, *v9, (_QWORD)v65);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      }
      while (v17);
    }
  }

  objc_msgSend(*v9, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Calendars"));

  if (v23)
  {
    v24 = (id)DSLogSharingPerson;
    v25 = v24;
    v26 = *(_QWORD *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v27 = "stopParticipants.Calendars";
LABEL_54:
    _os_signpost_emit_with_name_impl(&dword_227D24000, v25, OS_SIGNPOST_INTERVAL_END, v26, v27, " enableTelemetry=YES ", buf, 2u);
LABEL_55:

    goto LABEL_56;
  }
  objc_msgSend(*v9, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.FindMy"));

  if (v29)
  {
    v30 = (id)DSLogSharingPerson;
    v25 = v30;
    v26 = *(_QWORD *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v30))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v27 = "stopParticipants.FindMy";
    goto LABEL_54;
  }
  objc_msgSend(*v9, "name");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Photos"));

  if (v32)
  {
    v33 = (id)DSLogSharingPerson;
    v25 = v33;
    v26 = *(_QWORD *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v33))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v27 = "stopParticipants.Photos";
    goto LABEL_54;
  }
  objc_msgSend(*v9, "name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HomeKit.HomeSharing"));

  if (v35)
  {
    v36 = (id)DSLogSharingPerson;
    v25 = v36;
    v26 = *(_QWORD *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v36))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v27 = "stopParticipants.Home";
    goto LABEL_54;
  }
  objc_msgSend(*v9, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HealthKit.HealthSharing"));

  if (v38)
  {
    v39 = (id)DSLogSharingPerson;
    v25 = v39;
    v26 = *(_QWORD *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v39))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v27 = "stopParticipants.Health";
    goto LABEL_54;
  }
  objc_msgSend(*v9, "name");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Notes"));

  if (v45)
  {
    v46 = (id)DSLogSharingPerson;
    v25 = v46;
    v26 = *(_QWORD *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v46))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v27 = "stopParticipants.Notes";
    goto LABEL_54;
  }
  objc_msgSend(*v9, "name");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Zelkova"));

  if (v48)
  {
    v49 = (id)DSLogSharingPerson;
    v25 = v49;
    v26 = *(_QWORD *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v49))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v27 = "stopParticipants.Zelkova";
    goto LABEL_54;
  }
  objc_msgSend(*v9, "name");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Fitness"));

  if (v51)
  {
    v52 = (id)DSLogSharingPerson;
    v25 = v52;
    v26 = *(_QWORD *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v52))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v27 = "stopParticipants.Activity";
    goto LABEL_54;
  }
  objc_msgSend(*v9, "name");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.PassKeys"));

  if (v54)
  {
    v55 = (id)DSLogSharingPerson;
    v25 = v55;
    v26 = *(_QWORD *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v55))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v27 = "stopParticipants.Passkeys";
    goto LABEL_54;
  }
  objc_msgSend(*v9, "name");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.ItemSharing"));

  if (v57)
  {
    v58 = (id)DSLogSharingPerson;
    v25 = v58;
    v26 = *(_QWORD *)(a1 + 72);
    if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v58))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v27 = "stopParticipants.ItemSharing";
    goto LABEL_54;
  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Maps"));

  v61 = (id)DSLogSharingPerson;
  v62 = v61;
  v63 = *(_QWORD *)(a1 + 72);
  if (v60)
  {
    if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v62, OS_SIGNPOST_INTERVAL_END, v63, "stopParticipants.Maps", " enableTelemetry=YES ", buf, 2u);
    }

  }
  else
  {
    if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v62, OS_SIGNPOST_INTERVAL_END, v63, "stopParticipants.Notes", " enableTelemetry=YES ", buf, 2u);
    }

    v64 = (void *)DSLogSharingPerson;
    if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_FAULT))
      __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_cold_1(a1 + 32, v64);
  }
LABEL_56:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_217(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *WeakRetained;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  int v45;
  NSObject *v46;
  void *v47;
  int v48;
  NSObject *v49;
  void *v50;
  int v51;
  NSObject *v52;
  void *v53;
  int v54;
  NSObject *v55;
  NSObject *v56;
  os_signpost_id_t v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)DSLogSharingPerson;
  if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v61 = v7;
    _os_log_impl(&dword_227D24000, v6, OS_LOG_TYPE_INFO, "Stopping sharing with %{public}@ complete", buf, 0xCu);

  }
  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ds_errorFromIgnorableError:sourceName:", v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)DSLogSharingPerson;
    if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_ERROR))
    {
      v34 = *(void **)(a1 + 32);
      v35 = v12;
      objc_msgSend(v34, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v61 = v36;
      v62 = 2114;
      v63 = v37;
      v64 = 2114;
      v65 = v11;
      _os_log_error_impl(&dword_227D24000, v35, OS_LOG_TYPE_ERROR, "Failed to stop sharing on source %{public}@ for %{public}@ because %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSError errorWithCode:sourceName:underlyingErrors:](DSError, "errorWithCode:sourceName:underlyingErrors:", 2, v13, v14);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "addObject:", WeakRetained);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "removeParticipant:fromSource:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }

  objc_msgSend(*v9, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Calendars"));

  if (v17)
  {
    v18 = (id)DSLogSharingPerson;
    v19 = v18;
    v20 = *(_QWORD *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v18))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v21 = "stop.Calendars";
LABEL_48:
    _os_signpost_emit_with_name_impl(&dword_227D24000, v19, OS_SIGNPOST_INTERVAL_END, v20, v21, " enableTelemetry=YES ", buf, 2u);
LABEL_49:

    goto LABEL_50;
  }
  objc_msgSend(*v9, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.FindMy"));

  if (v23)
  {
    v24 = (id)DSLogSharingPerson;
    v19 = v24;
    v20 = *(_QWORD *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v21 = "stop.FindMy";
    goto LABEL_48;
  }
  objc_msgSend(*v9, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Photos"));

  if (v26)
  {
    v27 = (id)DSLogSharingPerson;
    v19 = v27;
    v20 = *(_QWORD *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v27))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v21 = "stop.Photos";
    goto LABEL_48;
  }
  objc_msgSend(*v9, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HomeKit.HomeSharing"));

  if (v29)
  {
    v30 = (id)DSLogSharingPerson;
    v19 = v30;
    v20 = *(_QWORD *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v30))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v21 = "stop.Home";
    goto LABEL_48;
  }
  objc_msgSend(*v9, "name");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HealthKit.HealthSharing"));

  if (v32)
  {
    v33 = (id)DSLogSharingPerson;
    v19 = v33;
    v20 = *(_QWORD *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v33))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v21 = "stop.Health";
    goto LABEL_48;
  }
  objc_msgSend(*v9, "name");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Notes"));

  if (v39)
  {
    v40 = (id)DSLogSharingPerson;
    v19 = v40;
    v20 = *(_QWORD *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v40))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v21 = "stop.Notes";
    goto LABEL_48;
  }
  objc_msgSend(*v9, "name");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Zelkova"));

  if (v42)
  {
    v43 = (id)DSLogSharingPerson;
    v19 = v43;
    v20 = *(_QWORD *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v43))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v21 = "stop.Zelkova";
    goto LABEL_48;
  }
  objc_msgSend(*v9, "name");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Fitness"));

  if (v45)
  {
    v46 = (id)DSLogSharingPerson;
    v19 = v46;
    v20 = *(_QWORD *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v46))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v21 = "stop.Activity";
    goto LABEL_48;
  }
  objc_msgSend(*v9, "name");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.PassKeys"));

  if (v48)
  {
    v49 = (id)DSLogSharingPerson;
    v19 = v49;
    v20 = *(_QWORD *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v49))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v21 = "stop.Passkeys";
    goto LABEL_48;
  }
  objc_msgSend(*v9, "name");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.ItemSharing"));

  if (v51)
  {
    v52 = (id)DSLogSharingPerson;
    v19 = v52;
    v20 = *(_QWORD *)(a1 + 72);
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v52))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v21 = "stop.ItemSharing";
    goto LABEL_48;
  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Maps"));

  v55 = (id)DSLogSharingPerson;
  v56 = v55;
  v57 = *(_QWORD *)(a1 + 72);
  if (v54)
  {
    if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v56, OS_SIGNPOST_INTERVAL_END, v57, "stop.Maps", " enableTelemetry=YES ", buf, 2u);
    }

  }
  else
  {
    if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v56, OS_SIGNPOST_INTERVAL_END, v57, "stop.Notes", " enableTelemetry=YES ", buf, 2u);
    }

    v58 = (void *)DSLogSharingPerson;
    if (os_log_type_enabled((os_log_t)DSLogSharingPerson, OS_LOG_TYPE_FAULT))
      __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_cold_1(a1 + 32, v58);
  }
LABEL_50:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_218(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    +[DSError errorWithCode:underlyingErrors:](DSError, "errorWithCode:underlyingErrors:", 2, *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (id)DSLogSharingPerson;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_227D24000, v4, OS_SIGNPOST_INTERVAL_END, v5, "stop", " enableTelemetry=YES ", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)stopSharingSourceNames:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *sources;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        if (self)
          sources = self->_sources;
        else
          sources = 0;
        -[NSMutableDictionary objectForKeyedSubscript:](sources, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16), (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v11, "addObject:", v18);

        ++v16;
      }
      while (v14 != v16);
      v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v14 = v19;
    }
    while (v19);
  }

  -[DSSharingPerson stopSharingSources:queue:completion:](self, "stopSharingSources:queue:completion:", v11, v9, v10);
}

- (void)stopAllSharingOnQueue:(id)a3 completion:(id)a4
{
  NSMutableDictionary *sources;
  id v7;
  id v8;
  id v9;

  if (self)
    sources = self->_sources;
  else
    sources = 0;
  v7 = a4;
  v8 = a3;
  -[NSMutableDictionary allValues](sources, "allValues");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[DSSharingPerson stopSharingSources:queue:completion:](self, "stopSharingSources:queue:completion:", v9, v8, v7);

}

- (id)valueForKey:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("displayName")))
  {
    -[DSSharingPerson displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareDirectionByResource, 0);
  objc_storeStrong((id *)&self->_shareDirectionBySourceName, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sharedResourcesBySource, 0);
  objc_storeStrong((id *)&self->_participantsBySource, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)score
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((a1 & 1) != 0)
    v3 = 0;
  else
    v3 = *(_QWORD *)(a2 + 16);
  v6 = 138412290;
  v7 = v3;
  v4 = a3;
  OUTLINED_FUNCTION_1_1(&dword_227D24000, v4, v5, "Counting any more priorities in %@ will overflow", (uint8_t *)&v6);

  OUTLINED_FUNCTION_9();
}

- (void)stopSharingSources:(_QWORD *)a3 queue:(NSObject *)a4 completion:.cold.1(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_1_1(&dword_227D24000, a4, (uint64_t)a3, "Signpost for unsupported source name %{public}@", a2);

}

void __55__DSSharingPerson_stopSharingSources_queue_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = OUTLINED_FUNCTION_11(a1, a2);
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_1_1(&dword_227D24000, v3, v5, "Signpost for unsupported source name %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_9();
}

@end
