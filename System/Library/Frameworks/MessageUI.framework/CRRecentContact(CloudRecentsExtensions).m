@implementation CRRecentContact(CloudRecentsExtensions)

- (id)_addressBookContext
{
  return objc_getAssociatedObject(a1, "_CRAddressBookContextKey");
}

- (void)_setAddressBookContext:()CloudRecentsExtensions
{
  objc_setAssociatedObject(a1, "_CRAddressBookContextKey", a3, (void *)1);
}

- (uint64_t)property
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "kind");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = MFABPropertyForRecentsKind(v1);

  return v2;
}

- (uint64_t)existingPerson
{
  _MFCRRecentContactABContext *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  const void *v11;
  CFTypeRef v12;
  const void *v13;
  CFIndex FirstIndexOfValueWithCallback;
  uint64_t v15;
  CFTypeRef cf;
  void *v18;
  uint8_t buf[4];
  CFTypeRef v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_addressBookContext");
  v2 = (_MFCRRecentContactABContext *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MFMailMessageLibraryAddressBook"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {

    }
    else
    {
      cf = 0;
      v5 = (void *)ABAddressBookCreateWithOptions(0, (CFErrorRef *)&cf);
      if (v5)
      {
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("MFMailMessageLibraryAddressBook"));
        CFRelease(v5);
      }
      else
      {
        MFLogGeneral();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = cf;
          _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "#Warning %@", buf, 0xCu);
        }

      }
      if (cf)
        CFRelease(cf);

      if (!v5)
      {
        v2 = 0;
        goto LABEL_23;
      }
    }
    objc_msgSend(a1, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1, "property");
    v18 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (const void *)MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName(v5, v9, v8, v10);

    if (v11)
    {
      v2 = objc_alloc_init(_MFCRRecentContactABContext);
      -[_MFCRRecentContactABContext setExistingPerson:](v2, "setExistingPerson:", v11);
      v12 = ABRecordCopyValue(v11, v8);
      v13 = v12;
      if (v12)
      {
        if (*MEMORY[0x1E0CF61A0] == v8)
          FirstIndexOfValueWithCallback = ABMultiValueGetFirstIndexOfValueWithCallback();
        else
          FirstIndexOfValueWithCallback = ABMultiValueGetFirstIndexOfValue(v12, v7);
        if (FirstIndexOfValueWithCallback != -1)
          -[_MFCRRecentContactABContext setIdentifier:](v2, "setIdentifier:", ABMultiValueGetIdentifierAtIndex(v13, FirstIndexOfValueWithCallback));
        CFRelease(v13);
      }
      objc_msgSend(a1, "_setAddressBookContext:", v2);
      CFRelease(v11);
    }
    else
    {
      v2 = 0;
    }

  }
LABEL_23:
  v15 = -[_MFCRRecentContactABContext existingPerson](v2, "existingPerson");

  return v15;
}

- (ABRecordRef)person
{
  _MFCRRecentContactABContext *v2;
  ABRecordRef v3;
  _MFCRRecentContactABContext *v4;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ABPropertyID v18;
  ABMutableMultiValueRef Mutable;
  const void *v20;
  uint64_t v21;
  ABMultiValueIdentifier outIdentifier;

  objc_msgSend(a1, "_addressBookContext");
  v2 = (_MFCRRecentContactABContext *)objc_claimAutoreleasedReturnValue();
  v3 = -[_MFCRRecentContactABContext interimPerson](v2, "interimPerson");
  if (v3 || (v3 = (ABRecordRef)objc_msgSend(a1, "existingPerson")) != 0)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "kind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D18228]);

    if (v7)
    {
      v8 = 0;
      objc_msgSend(a1, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v11 = 0;
      v12 = 0;
    }
    else
    {
      objc_msgSend(a1, "displayName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ec_personNameComponents");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "namePrefix");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "givenName");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "middleName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "familyName");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "nameSuffix");
      v21 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v16;
      v11 = (void *)v17;
      v8 = (void *)v15;
      v12 = (void *)v21;
    }
    v3 = ABPersonCreate();
    ABRecordSetValue(v3, *MEMORY[0x1E0CF61D8], v8, 0);
    ABRecordSetValue(v3, *MEMORY[0x1E0CF5FD8], v9, 0);
    ABRecordSetValue(v3, *MEMORY[0x1E0CF6108], v10, 0);
    ABRecordSetValue(v3, *MEMORY[0x1E0CF60D0], v11, 0);
    ABRecordSetValue(v3, *MEMORY[0x1E0CF6280], v12, 0);
    v18 = objc_msgSend(a1, "property");
    Mutable = ABMultiValueCreateMutable(1u);
    outIdentifier = -1431655766;
    v20 = (const void *)objc_msgSend(a1, "address");
    ABMultiValueAddValueAndLabel(Mutable, v20, (CFStringRef)*MEMORY[0x1E0CF5E98], &outIdentifier);
    ABRecordSetValue(v3, v18, Mutable, 0);
    CFRelease(Mutable);
    v4 = objc_alloc_init(_MFCRRecentContactABContext);

    -[_MFCRRecentContactABContext setInterimPerson:](v4, "setInterimPerson:", v3);
    -[_MFCRRecentContactABContext setIdentifier:](v4, "setIdentifier:", outIdentifier);
    objc_msgSend(a1, "_setAddressBookContext:", v4);
    CFRelease(v3);

  }
  return v3;
}

- (uint64_t)matchedIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "_addressBookContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(a1, "person");
  objc_msgSend(a1, "_addressBookContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "identifier");

  return v4;
}

@end
