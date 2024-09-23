@implementation _HKEmergencyContact(HDMedicalIDDataMigrator)

- (void)_migrateToSchemaVersion:()HDMedicalIDDataMigrator withAddressBook:
{
  void *v5;
  const __CFArray *v6;
  CFIndex v7;
  uint64_t v8;
  const void *ValueAtIndex;
  CFTypeRef v10;
  CFIndex v11;
  CFIndex v12;
  const __CFArray *v13;
  void *v14;
  char v15;
  uint64_t v16;
  CFTypeRef v17;
  unsigned int IdentifierAtIndex;
  void *v19;
  void *v20;
  void *v21;
  void *PersonWithRecordID;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  __CFString *v43;
  void *v44;
  int v45;
  ABPropertyID property;
  CFIndex Count;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _QWORD v54[3];

  v5 = a1;
  v54[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 3)
  {
    if (!a1)
      return;
    objc_msgSend(a1, "nameRecordID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PersonWithRecordID = (void *)ABAddressBookGetPersonWithRecordID(a4, objc_msgSend(v21, "intValue"));

    if (PersonWithRecordID)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0C97298]);
      objc_msgSend(v5, "nameRecordID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = *MEMORY[0x1E0C967C0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "unifiedContactWithIdentifier:keysToFetch:error:", v25, v26, 0);
      PersonWithRecordID = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(PersonWithRecordID, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNameContactIdentifier:", v27);

    objc_msgSend(PersonWithRecordID, "linkedContacts");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PersonWithRecordID, "phoneNumbers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v28;
    if (objc_msgSend(v28, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C97200], "unifyContacts:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "phoneNumbers");
      v31 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v31;
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v32 = v29;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (!v33)
      goto LABEL_34;
    v34 = v33;
    v35 = *(_QWORD *)v50;
    while (1)
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v50 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v38 = objc_msgSend(v37, "iOSLegacyIdentifier");
        v39 = v5;
        objc_msgSend(v5, "phoneNumberPropertyID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "intValue");

        if (v38 == v41)
        {
          objc_msgSend(v37, "identifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setPhoneNumberContactIdentifier:", v42);

LABEL_34:
          return;
        }
        v5 = v39;
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (!v34)
        goto LABEL_34;
    }
  }
  if (a3 != 2 || !a1)
    return;
  objc_msgSend(a1, "name");
  v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = ABAddressBookCopyPeopleWithName(a4, v43);
  Count = CFArrayGetCount(v6);
  if (Count <= 0)
  {
    CFRelease(v6);
    goto LABEL_37;
  }
  v44 = v5;
  v7 = 0;
  property = *MEMORY[0x1E0C902C0];
  v8 = 0xFFFFFFFFLL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v6, v7);
    v45 = MEMORY[0x1BCCAAE5C](ValueAtIndex);
    v10 = ABRecordCopyValue(ValueAtIndex, property);
    v11 = ABMultiValueGetCount(v10);
    if (v11 > 0)
      break;
    CFRelease(v10);
LABEL_16:
    if (++v7 == Count)
      goto LABEL_17;
  }
  v12 = v11;
  v13 = v6;
  objc_msgSend(v44, "phoneNumber", v43);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 1;
  do
  {
    v17 = ABMultiValueCopyValueAtIndex(v10, v16 - 1);
    IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v10, v16 - 1);
    if (objc_msgSend(v14, "isEqualToString:", v17))
    {
      v15 = 1;
      v8 = IdentifierAtIndex;
    }
    else
    {
      v8 = v8;
    }
    CFRelease(v17);
    if (v16 >= v12)
      break;
    ++v16;
  }
  while ((v15 & 1) == 0);

  CFRelease(v10);
  v6 = v13;
  if ((v15 & 1) == 0)
    goto LABEL_16;
LABEL_17:
  CFRelease(v6);
  if (v45 != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setNameRecordID:", v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setPhoneNumberPropertyID:", v20);

  }
LABEL_37:

}

@end
