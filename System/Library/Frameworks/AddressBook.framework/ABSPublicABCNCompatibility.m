@implementation ABSPublicABCNCompatibility

+ (BOOL)updateNewPublicABPerson:(void *)a3 withSavedContact:(id)a4 inAddressBook:(void *)a5
{
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v8 = objc_msgSend(v7, "hasBeenPersisted");
  if (v8)
  {
    v9 = a3;
    objc_msgSend(v9, "replaceRecordStorageWithCNObject:", v7);
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized)
    {
      v10 = a5;
      objc_msgSend(v10, "contacts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __85__ABSPublicABCNCompatibility_updateNewPublicABPerson_withSavedContact_inAddressBook___block_invoke;
      v15[3] = &unk_24C2F50E0;
      v12 = v9;
      v16 = v12;
      v13 = (id)objc_msgSend(v11, "cnImplFetched:creationBlock:", v7, v15);

      objc_msgSend(v12, "setAddressBook:", v10);
    }

  }
  return v8;
}

id __85__ABSPublicABCNCompatibility_updateNewPublicABPerson_withSavedContact_inAddressBook___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)overwritePublicABPerson:(void *)a3 withContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "keyVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__ABSPublicABCNCompatibility_overwritePublicABPerson_withContact___block_invoke;
  v11[3] = &unk_24C2F4918;
  v12 = v6;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "enumeratePropertiesUsingBlock:", v11);

  return 1;
}

void __66__ABSPublicABCNCompatibility_overwritePublicABPerson_withContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(MEMORY[0x24BDBAC70], "identifierDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v3 == v11)
  {
LABEL_5:

    v6 = v11;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDBAC70], "iOSLegacyIdentifierDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  if (v5 != v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "cnImpl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isKeyAvailable:", v7);

    if (v8)
    {
      objc_msgSend(v11, "CNValueForContact:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "valueWithResetIdentifiers:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setCNValue:onContact:", v10, v4);
    }
    goto LABEL_5;
  }
LABEL_6:

}

+ (id)contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4
{
  return (id)objc_msgSend(a1, "contactFromPublicABPerson:keysToFetch:mutable:", a3, a4, 0);
}

+ (id)contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4 mutable:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "completeCNImplIfNeededWithKeysToFetch:", v8) & 1) == 0)
    NSLog(CFSTR("ERROR: we can't convert ABPerson to contact."));
  objc_msgSend(v7, "cnImpl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithPropertyKeys:", v8);

  if (v5)
  {
    v11 = objc_msgSend(v10, "mutableCopy");

    v10 = (void *)v11;
  }

  return v10;
}

+ (id)contactPropertyKeyFromPublicABPropertyID:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDBAC70], "contactPropertiesByABSPropertyID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (int)publicABPropertyIDFromContactPropertyKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBAC70], "contactPropertiesByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -1;
  if ((objc_msgSend(v5, "absPropertyID:", &v8) & 1) == 0)
    NSLog(CFSTR("Unable to convert property %@ to ABPropertyID"), v3);
  v6 = v8;

  return v6;
}

+ (void)publicABPersonFromContact:(id)a3 contactStore:(id)a4 publicAddressBook:(const void *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ABSPerson *v12;
  ABSPerson *v13;
  void *v14;
  ABSPerson *v15;
  ABSPerson *v16;
  CFTypeRef v17;

  v8 = a3;
  v9 = a4;
  if (a5 && *a5)
  {
    v10 = (id)*a5;
  }
  else
  {
    objc_msgSend(a1, "createAddressBookForConversion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (a5)
    {
      v10 = v11;
      *a5 = v10;
    }
  }
  if (!objc_msgSend(v8, "hasBeenPersisted")
    || (objc_msgSend(v8, "isUnified") & 1) != 0
    || ABAddressBookGetAuthorizationStatus() != kABAuthorizationStatusAuthorized
    || (objc_msgSend(v10, "personWithRecordID:", objc_msgSend(v8, "iOSLegacyIdentifier")),
        (v12 = (ABSPerson *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v13 = [ABSPerson alloc];
    v14 = (void *)objc_msgSend(v8, "mutableCopy");
    v12 = -[ABSPerson initWithMutableContact:](v13, "initWithMutableContact:", v14);

  }
  v15 = v12;
  v16 = v15;
  if (v15)
    v17 = CFAutorelease(v15);
  else
    v17 = 0;

  return (void *)v17;
}

+ (int)publicMultiValueIdentifierFromLabeledValue:(id)a3 contactStore:(id)a4
{
  return objc_msgSend(a3, "iOSLegacyIdentifier");
}

+ (id)labeledValueFromPublicMultiValueIdentifier:(int)a3 contact:(id)a4 key:(id)a5 contactStore:(id)a6
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  int v18;

  v8 = (void *)MEMORY[0x24BDBAC70];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "contactPropertiesByKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "CNValueForContact:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __98__ABSPublicABCNCompatibility_labeledValueFromPublicMultiValueIdentifier_contact_key_contactStore___block_invoke;
  v17[3] = &__block_descriptor_36_e31_B32__0__CNLabeledValue_8Q16_B24l;
  v18 = a3;
  objc_msgSend(v13, "indexesOfObjectsPassingTest:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") == 1)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v14, "firstIndex"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

BOOL __98__ABSPublicABCNCompatibility_labeledValueFromPublicMultiValueIdentifier_contact_key_contactStore___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iOSLegacyIdentifier") == *(_DWORD *)(a1 + 32);
}

+ (id)createAddressBookForConversion
{
  return -[ABSAddressBook initWithOptions:error:]([ABSAddressBook alloc], "initWithOptions:error:", 0, 0);
}

+ (id)contactStoreForPublicAddressBook:(void *)a3
{
  return (id)ABAddressBookGetContactStore(a3, a2);
}

@end
