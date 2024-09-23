@implementation _HKMedicalIDData(HKMedicalIDAddressBookBridge)

+ (id)contactKeysToLoadForMedicalID
{
  if (contactKeysToLoadForMedicalID_onceToken != -1)
    dispatch_once(&contactKeysToLoadForMedicalID_onceToken, &__block_literal_global_30);
  return (id)contactKeysToLoadForMedicalID_contactKeysToFetch;
}

- (void)loadDataFromCNContact:()HKMedicalIDAddressBookBridge
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "thumbnailImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setPictureData:", v4);

  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v11, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setName:", v5);

  objc_msgSend(v11, "birthday");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v11, "birthday");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "year");

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "birthday");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setGregorianBirthday:", v10);

    }
  }

}

- (uint64_t)updateEmergencyContacts
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "emergencyContacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
    return objc_msgSend(a1, "_updateExistingEmergencyContacts");
  else
    return 0;
}

- (uint64_t)updateEmergencyContactsAutopopulateForSecondaryProfileIfEmpty:()HKMedicalIDAddressBookBridge
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "emergencyContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = a1;
      _os_log_impl(&dword_1D7813000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating existing emergency contacts.", (uint8_t *)&v10, 0xCu);
    }
    return objc_msgSend(a1, "_updateExistingEmergencyContacts");
  }
  else if (a3)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = a1;
      _os_log_impl(&dword_1D7813000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Autopopulating emergency contacts.", (uint8_t *)&v10, 0xCu);
    }
    return objc_msgSend(a1, "_autopopulateEmergencyContactsForSecondaryProfile");
  }
  else
  {
    return 0;
  }
}

- (uint64_t)_updateExistingEmergencyContacts
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v33;
  id v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  id obj;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(a1, "emergencyContacts");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v49;
      v34 = v2;
      v35 = a1;
      v33 = *(_QWORD *)v49;
      do
      {
        v7 = 0;
        v37 = v4;
        do
        {
          if (*(_QWORD *)v49 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v7);
          v5 |= objc_msgSend(a1, "_updateIdentifierByPhoneNumberForEmergencyContact:contactStore:", v8, v2, v33, v34, v35);
          objc_msgSend(v8, "nameContactIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(a1, "_contactKeysToFetch");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 0;
            objc_msgSend(v2, "unifiedContactWithIdentifier:keysToFetch:error:", v9, v10, &v47);
            v11 = objc_claimAutoreleasedReturnValue();
            v42 = v47;

            v12 = (void *)v11;
            if (v11)
            {
              v40 = v9;
              v41 = (void *)v11;
              objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v11, 0);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "name");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v13, "isEqualToString:", v14);

              if ((v15 & 1) == 0)
              {
                objc_msgSend(v8, "setName:", v13);
                v5 = 1;
              }
              v12 = v41;
              objc_msgSend(v41, "phoneNumbers");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              v46 = 0u;
              v17 = v16;
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
              if (v18)
              {
                v19 = v18;
                v38 = v13;
                v36 = v5;
                v20 = *(_QWORD *)v44;
                while (2)
                {
                  for (i = 0; i != v19; ++i)
                  {
                    if (*(_QWORD *)v44 != v20)
                      objc_enumerationMutation(v17);
                    v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                    objc_msgSend(v22, "identifier");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "phoneNumberContactIdentifier");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = objc_msgSend(v23, "isEqualToString:", v24);

                    if (v25)
                    {
                      objc_msgSend(v22, "value");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      v27 = (void *)MEMORY[0x1E0C97398];
                      objc_msgSend(v8, "phoneNumber");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "phoneNumberWithStringValue:", v28);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!objc_msgSend(v26, "isLikePhoneNumber:", v29))
                      {
                        objc_msgSend(v26, "formattedStringValue");
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v8, "setPhoneNumber:", v30);

                        v5 = 1;
                        v2 = v34;
                        a1 = v35;
                        v6 = v33;
                        goto LABEL_23;
                      }

                    }
                  }
                  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
                  if (v19)
                    continue;
                  break;
                }
                v2 = v34;
                a1 = v35;
                v6 = v33;
                v5 = v36;
LABEL_23:
                v12 = v41;
                v13 = v38;
              }

              v4 = v37;
              v9 = v40;
            }

          }
          ++v7;
        }
        while (v7 != v4);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v4);
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    _HKInitializeLogging();
    v31 = *MEMORY[0x1E0CB5300];
    LOBYTE(v5) = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v55 = a1;
      _os_log_impl(&dword_1D7813000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Contacts access not authorized, skipping update emergency contacts", buf, 0xCu);
      LOBYTE(v5) = 0;
    }
  }
  return v5 & 1;
}

- (uint64_t)_autopopulateEmergencyContactsForSecondaryProfile
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C97298]);
  objc_msgSend(a1, "_contactKeysToFetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v2, "_ios_meContactWithKeysToFetch:error:", v3, &v37);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v37;

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB6F88], "emergencyContactUsingSimCardNumberWithContact:property:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "phoneNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("relationship_guardian"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setRelationship:", v10);

        objc_msgSend(a1, "emergencyContacts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = v11;
          objc_msgSend(v11, "arrayByAddingObject:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v38[0] = v7;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(a1, "setEmergencyContacts:", v13);

        v21 = 1;
        goto LABEL_16;
      }
      _HKInitializeLogging();
      v29 = *MEMORY[0x1E0CB5300];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
        -[_HKMedicalIDData(HKMedicalIDAddressBookBridge) _autopopulateEmergencyContactsForSecondaryProfile].cold.3((uint64_t)a1, v29, v30, v31, v32, v33, v34, v35);
    }
    else
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E0CB5300];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
        -[_HKMedicalIDData(HKMedicalIDAddressBookBridge) _autopopulateEmergencyContactsForSecondaryProfile].cold.2((uint64_t)a1, v22, v23, v24, v25, v26, v27, v28);
    }
    v21 = 0;
LABEL_16:

    goto LABEL_17;
  }
  _HKInitializeLogging();
  v14 = *MEMORY[0x1E0CB5300];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
    -[_HKMedicalIDData(HKMedicalIDAddressBookBridge) _autopopulateEmergencyContactsForSecondaryProfile].cold.1((uint64_t)a1, v14, v15, v16, v17, v18, v19, v20);
  v21 = 0;
LABEL_17:

  return v21;
}

- (uint64_t)_updateIdentifierByPhoneNumberForEmergencyContact:()HKMedicalIDAddressBookBridge contactStore:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  id v49;
  unsigned int v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C97398];
  objc_msgSend(v6, "phoneNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "phoneNumberWithStringValue:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v56 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_contactKeysToFetch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  objc_msgSend(v7, "unifiedContactsMatchingPredicate:keysToFetch:error:", v11, v12, &v71);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v71;

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (v15)
  {
    v16 = v15;
    v51 = v14;
    v52 = v11;
    v17 = *(_QWORD *)v68;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v68 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v19, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqualToString:", v21);

        if (v22)
        {
          objc_msgSend(v6, "nameContactIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqualToString:", v25);

          if ((v26 & 1) == 0)
          {
            objc_msgSend(v19, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setNameContactIdentifier:", v27);

          }
          v50 = v26 ^ 1;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          objc_msgSend(v19, "phoneNumbers");
          v53 = (id)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
          if (v54)
          {
            v49 = v7;
            v55 = *(_QWORD *)v64;
            while (2)
            {
              for (j = 0; j != v54; ++j)
              {
                if (*(_QWORD *)v64 != v55)
                  objc_enumerationMutation(v53);
                v29 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
                objc_msgSend(v29, "value", v49);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "unformattedInternationalStringValue");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "phoneNumber");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v31, "isEqualToString:", v32) & 1) != 0)
                  goto LABEL_28;
                objc_msgSend(v29, "value");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "formattedInternationalStringValue");
                v34 = v6;
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "phoneNumber");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v35, "isEqualToString:", v36) & 1) != 0)
                  goto LABEL_27;
                v59 = v32;
                v60 = v31;
                v61 = v30;
                objc_msgSend(v29, "value");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "formattedStringValue");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = v34;
                objc_msgSend(v34, "phoneNumber");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v38, "isEqualToString:", v40) & 1) != 0)
                {

                  v34 = v39;
                  v31 = v60;
                  v30 = v61;
                  v32 = v59;
LABEL_27:

                  v6 = v34;
LABEL_28:

                  v41 = v29;
LABEL_29:
                  objc_msgSend(v6, "phoneNumberContactIdentifier");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = v41;
                  objc_msgSend(v41, "identifier");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = objc_msgSend(v43, "isEqualToString:", v45);

                  v7 = v49;
                  v23 = v50;
                  if ((v46 & 1) == 0)
                  {
                    objc_msgSend(v44, "identifier");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "setPhoneNumberContactIdentifier:", v47);

                    v23 = 1;
                  }
                  goto LABEL_31;
                }
                objc_msgSend(v29, "value");
                v57 = v33;
                v41 = v29;
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend(v42, "isLikePhoneNumber:", v56);

                v6 = v39;
                if ((v58 & 1) != 0)
                  goto LABEL_29;
              }
              v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
              if (v54)
                continue;
              break;
            }
            v7 = v49;
          }
          v23 = v50;
LABEL_31:

          goto LABEL_32;
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      if (v16)
        continue;
      break;
    }
    v23 = 0;
LABEL_32:
    v14 = v51;
    v11 = v52;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_contactKeysToFetch
{
  if (_contactKeysToFetch_onceToken != -1)
    dispatch_once(&_contactKeysToFetch_onceToken, &__block_literal_global_198);
  return (id)_contactKeysToFetch_contactKeys;
}

- (void)_autopopulateEmergencyContactsForSecondaryProfile
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "%{public}@: The emergency contact does not have a phone number", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

@end
