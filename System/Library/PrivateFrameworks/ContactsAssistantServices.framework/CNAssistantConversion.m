@implementation CNAssistantConversion

+ (NSArray)descriptorsForRequiredKeys
{
  return (NSArray *)+[CNAssistantConversion descriptorsForRequiredKeysForConversionType:](CNAssistantConversion, "descriptorsForRequiredKeysForConversionType:", 0);
}

+ (id)descriptorsForRequiredKeysForConversionType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[20];
  _QWORD v20[14];
  _QWORD v21[8];

  v21[7] = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", *MEMORY[0x24BDBA2E0], *MEMORY[0x24BDBA3F0], *MEMORY[0x24BDBA2C8], *MEMORY[0x24BDBA310], *MEMORY[0x24BDBA2C0], *MEMORY[0x24BDBA258], *MEMORY[0x24BDBA328], *MEMORY[0x24BDBA318], *MEMORY[0x24BDBA320], *MEMORY[0x24BDBA340], *MEMORY[0x24BDBA350], *MEMORY[0x24BDBA360], *MEMORY[0x24BDBA358], *MEMORY[0x24BDBA288], *MEMORY[0x24BDBA348], *MEMORY[0x24BDBA378], *MEMORY[0x24BDBA3C0],
        *MEMORY[0x24BDBA3C8],
        *MEMORY[0x24BDBA2D8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[19] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      return v10;
    case 2:
      v12 = *MEMORY[0x24BDBA3F0];
      v20[0] = *MEMORY[0x24BDBA2E0];
      v20[1] = v12;
      v13 = *MEMORY[0x24BDBA2C0];
      v20[2] = *MEMORY[0x24BDBA2C8];
      v20[3] = v13;
      v14 = *MEMORY[0x24BDBA340];
      v20[4] = *MEMORY[0x24BDBA328];
      v20[5] = v14;
      v15 = *MEMORY[0x24BDBA360];
      v20[6] = *MEMORY[0x24BDBA350];
      v20[7] = v15;
      v16 = *MEMORY[0x24BDBA288];
      v20[8] = *MEMORY[0x24BDBA358];
      v20[9] = v16;
      v17 = *MEMORY[0x24BDBA378];
      v20[10] = *MEMORY[0x24BDBA348];
      v20[11] = v17;
      v18 = *MEMORY[0x24BDBA2D8];
      v20[12] = *MEMORY[0x24BDBA3C0];
      v20[13] = v18;
      v6 = (void *)MEMORY[0x24BDBCE30];
      v7 = v20;
      v8 = 14;
      goto LABEL_7;
    case 1:
      v3 = *MEMORY[0x24BDBA2C8];
      v21[0] = *MEMORY[0x24BDBA2E0];
      v21[1] = v3;
      v4 = *MEMORY[0x24BDBA328];
      v21[2] = *MEMORY[0x24BDBA360];
      v21[3] = v4;
      v5 = *MEMORY[0x24BDBA350];
      v21[4] = *MEMORY[0x24BDBA3C0];
      v21[5] = v5;
      v21[6] = *MEMORY[0x24BDBA2D8];
      v6 = (void *)MEMORY[0x24BDBCE30];
      v7 = v21;
      v8 = 7;
LABEL_7:
      objc_msgSend(v6, "arrayWithObjects:count:", v7, v8);
      return (id)objc_claimAutoreleasedReturnValue();
  }
  return MEMORY[0x24BDBD1A8];
}

+ (id)personFromMeContact:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  +[CNAssistantConversion descriptorsForRequiredKeysForConversionType:](CNAssistantConversion, "descriptorsForRequiredKeysForConversionType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "areKeysAvailable:", v4);

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setMe:", MEMORY[0x24BDBD1C8]);
    objc_msgSend(v3, "givenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFirstName:", v8);

    objc_msgSend(v3, "nickname");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNickName:", v10);

    objc_msgSend(v3, "phoneticGivenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFirstNamePhonetic:", v12);

    objc_msgSend(v6, "setIdentifier:", 0);
    +[CNAssistantConversion relationsFromContact:](CNAssistantConversion, "relationsFromContact:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilArray(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRelatedNames:", v14);

    objc_msgSend(v3, "phonemeData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPhonemeData:", v16);

    objc_msgSend(v3, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInternalGUID:", v18);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)personForSyncFromContact:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  void *v28;
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

  v3 = a3;
  +[CNAssistantConversion descriptorsForRequiredKeysForConversionType:](CNAssistantConversion, "descriptorsForRequiredKeysForConversionType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "areKeysAvailable:", v4);

  if (!v5)
    goto LABEL_19;
  objc_msgSend(v3, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "givenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length") != 0;

  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v3, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v3, "familyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v8 = 1;

  }
  objc_msgSend(v3, "organizationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v3, "organizationName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      v8 = 1;

  }
  objc_msgSend(v3, "nickname");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v3, "nickname");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
      v8 = 1;

  }
  if (v8)
  {
    v16 = (void *)objc_opt_new();
    +[CNAssistantID assistantIDFromContact:](CNAssistantID, "assistantIDFromContact:", v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIdentifier:", v17);
    objc_msgSend(v3, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInternalGUID:", v18);

    objc_msgSend(v3, "givenName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFirstName:", v20);

    objc_msgSend(v3, "familyName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLastName:", v22);

    objc_msgSend(v3, "nickname");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNickName:", v24);

    objc_msgSend(v3, "organizationName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCompany:", v26);

    objc_msgSend(v3, "phoneticGivenName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFirstNamePhonetic:", v28);

    objc_msgSend(v3, "phoneticFamilyName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLastNamePhonetic:", v30);

    objc_msgSend(v3, "phonemeData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPhonemeData:", v32);

    +[CNAssistantConversion emailAddressesForSyncFromContact:](CNAssistantConversion, "emailAddressesForSyncFromContact:", v3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilArray(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEmails:", v34);

    +[CNAssistantConversion phoneNumbersForSyncFromContact:](CNAssistantConversion, "phoneNumbersForSyncFromContact:", v3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilArray(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPhones:", v36);

    +[CNAssistantConversion addressesForSyncFromContact:](CNAssistantConversion, "addressesForSyncFromContact:", v3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilArray(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAddresses:", v38);

    +[CNAssistantConversion relationsForSyncFromContact:](CNAssistantConversion, "relationsForSyncFromContact:", v3);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilArray(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRelatedNames:", v40);

  }
  else
  {
LABEL_19:
    v16 = 0;
  }

  return v16;
}

+ (id)personFromContact:(id)a3 useABPerson:(BOOL)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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

  v4 = a3;
  +[CNAssistantConversion descriptorsForRequiredKeysForConversionType:](CNAssistantConversion, "descriptorsForRequiredKeysForConversionType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "areKeysAvailable:", v5);

  v7 = 0;
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    +[CNAssistantID assistantIDFromContact:](CNAssistantID, "assistantIDFromContact:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", v8);
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInternalGUID:", v9);

    objc_msgSend(v4, "givenName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFirstName:", v11);

    objc_msgSend(v4, "middleName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMiddleName:", v13);

    objc_msgSend(v4, "familyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLastName:", v15);

    objc_msgSend(v4, "birthday");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "birthday");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "year") == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v17, "setYear:", 1604);
      objc_msgSend(v17, "timeZone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTimeZone:", v19);

      }
      objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateFromComponents:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBirthday:", v21);

    }
    objc_msgSend(v4, "nickname");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNickName:", v23);

    objc_msgSend(v4, "namePrefix");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrefix:", v25);

    objc_msgSend(v4, "nameSuffix");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSuffix:", v27);

    objc_msgSend(v4, "organizationName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompany:", v29);

    objc_msgSend(v4, "phoneticGivenName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFirstNamePhonetic:", v31);

    objc_msgSend(v4, "phoneticFamilyName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLastNamePhonetic:", v33);

    objc_msgSend(v4, "phonemeData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhonemeData:", v35);

    +[CNAssistantConversion emailAddressesFromContact:](CNAssistantConversion, "emailAddressesFromContact:", v4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilArray(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEmails:", v37);

    +[CNAssistantConversion phoneNumbersFromContact:](CNAssistantConversion, "phoneNumbersFromContact:", v4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilArray(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhones:", v39);

    +[CNAssistantConversion addressesFromContact:](CNAssistantConversion, "addressesFromContact:", v4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilArray(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAddresses:", v41);

    +[CNAssistantConversion relationsFromContact:](CNAssistantConversion, "relationsFromContact:", v4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilArray(v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRelatedNames:", v43);

    objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v4, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    NonEmptyOrNilString(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFullName:", v45);

  }
  return v7;
}

+ (id)personFromContact:(id)a3
{
  return (id)objc_msgSend(a1, "personFromContact:useABPerson:", a3, 0);
}

+ (id)createSAPersonFromCNContact:(id)a3 conversionType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  +[CNAssistantConversion descriptorsForRequiredKeysForConversionType:](CNAssistantConversion, "descriptorsForRequiredKeysForConversionType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAssistantConversion verifyContact:hasDescriptorsForRequiredKeys:](CNAssistantConversion, "verifyContact:hasDescriptorsForRequiredKeys:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    if (a4 == 2)
    {
      objc_msgSend(a1, "personForSyncFromContact:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4 != 1)
      {
        v10 = 0;
        goto LABEL_9;
      }
      objc_msgSend(a1, "personFromMeContact:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(a1, "personFromContact:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_9:

  return v10;
}

+ (id)createSAPersonFromCNContact:(id)a3
{
  return +[CNAssistantConversion createSAPersonFromCNContact:conversionType:](CNAssistantConversion, "createSAPersonFromCNContact:conversionType:", a3, 0);
}

+ (id)createSAPersonFromCNContactWithExternalIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingFullTextSearch:containerIdentifiers:groupIdentifiers:", v3, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAssistantConversion descriptorsForRequiredKeysForConversionType:](CNAssistantConversion, "descriptorsForRequiredKeysForConversionType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unifiedContactsMatchingPredicate:keysToFetch:error:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAssistantConversion createSAPersonFromCNContact:](CNAssistantConversion, "createSAPersonFromCNContact:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)createSASourceFromCNContainer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDomainIdentifier:", *MEMORY[0x24BE81A00]);
  +[CNAssistantID assistantIDFromContainer:](CNAssistantID, "assistantIDFromContainer:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = objc_msgSend(v3, "type");

  objc_msgSend(v6, "numberWithBool:", v7 > 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemote:", v8);

  return v4;
}

+ (id)filterLabeledValues:(id)a3 droppingEmptyLabels:(BOOL)a4 droppingDuplicates:(BOOL)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  BOOL v16;

  v7 = a3;
  v8 = v7;
  if (a4 || a5)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __84__CNAssistantConversion_filterLabeledValues_droppingEmptyLabels_droppingDuplicates___block_invoke;
    v13[3] = &unk_24CE7BFA8;
    v15 = a4;
    v16 = a5;
    v14 = v10;
    v11 = v10;
    objc_msgSend(v8, "filterUsingBlock:", v13);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v7;
  }

  return v9;
}

uint64_t __84__CNAssistantConversion_filterLabeledValues_droppingEmptyLabels_droppingDuplicates___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_BYTE *)(a1 + 40) && (!v3 || !objc_msgSend(v3, "length")))
    goto LABEL_6;
  if (!*(_BYTE *)(a1 + 41))
  {
LABEL_8:
    v5 = 1;
    goto LABEL_9;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    goto LABEL_8;
  }
LABEL_6:
  v5 = 0;
LABEL_9:

  return v5;
}

+ (id)emailAddressesFromContact:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDBA288];
  if (!objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x24BDBA288]))
  {
    v27 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_16;
  }
  v29 = a1;
  objc_msgSend(MEMORY[0x24BDBAD20], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v4;
  objc_msgSend(v30, "entriesForContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:", v4, v5, 0, 0, *MEMORY[0x24BDBA200]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v9)
    goto LABEL_14;
  v10 = v9;
  v11 = *(_QWORD *)v37;
  v12 = *MEMORY[0x24BDBA210];
  v13 = *MEMORY[0x24BDBA248];
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v37 != v11)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      objc_msgSend(v15, "actionType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v12);

      if (v17)
      {
        objc_msgSend(v15, "contactProperty");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v7;
      }
      else
      {
        objc_msgSend(v15, "actionType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", v13);

        if (!v22)
          continue;
        objc_msgSend(v15, "contactProperty");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v32;
      }
      objc_msgSend(v20, "addObject:", v19);

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  }
  while (v10);
LABEL_14:

  v4 = v31;
  objc_msgSend(v31, "emailAddresses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "filterLabeledValues:droppingEmptyLabels:droppingDuplicates:", v23, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __51__CNAssistantConversion_emailAddressesFromContact___block_invoke;
  v33[3] = &unk_24CE7BFD0;
  v34 = v7;
  v35 = v32;
  v25 = v32;
  v26 = v7;
  objc_msgSend(v24, "mapUsingBlock:", v33);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v27;
}

id __51__CNAssistantConversion_emailAddressesFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEmailAddress:", v5);

  objc_msgSend(v3, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NonEmptyOrNilString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);
  v11 = MEMORY[0x24BDBD1C8];
  if (v10)
    v12 = MEMORY[0x24BDBD1C8];
  else
    v12 = 0;
  objc_msgSend(v4, "setFavoriteFacetimeAudio:", v12);

  v13 = *(void **)(a1 + 40);
  objc_msgSend(v3, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "containsObject:", v14))
    v15 = v11;
  else
    v15 = 0;
  objc_msgSend(v4, "setFavoriteFacetime:", v15);

  return v4;
}

+ (id)emailAddressesForSyncFromContact:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDBA288];
  if (!objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x24BDBA288]))
  {
    v27 = 0;
    goto LABEL_16;
  }
  v29 = a1;
  objc_msgSend(MEMORY[0x24BDBAD20], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v4;
  objc_msgSend(v30, "entriesForContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:", v4, v5, 0, 0, *MEMORY[0x24BDBA200]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v9)
    goto LABEL_14;
  v10 = v9;
  v11 = *(_QWORD *)v37;
  v12 = *MEMORY[0x24BDBA210];
  v13 = *MEMORY[0x24BDBA248];
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v37 != v11)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      objc_msgSend(v15, "actionType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v12);

      if (v17)
      {
        objc_msgSend(v15, "contactProperty");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v7;
      }
      else
      {
        objc_msgSend(v15, "actionType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", v13);

        if (!v22)
          continue;
        objc_msgSend(v15, "contactProperty");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v32;
      }
      objc_msgSend(v20, "addObject:", v19);

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  }
  while (v10);
LABEL_14:

  v4 = v31;
  objc_msgSend(v31, "emailAddresses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "filterLabeledValues:droppingEmptyLabels:droppingDuplicates:", v23, 1, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __58__CNAssistantConversion_emailAddressesForSyncFromContact___block_invoke;
  v33[3] = &unk_24CE7BFD0;
  v34 = v7;
  v35 = v32;
  v25 = v32;
  v26 = v7;
  objc_msgSend(v24, "mapUsingBlock:", v33);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v27;
}

id __58__CNAssistantConversion_emailAddressesForSyncFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);
  v9 = MEMORY[0x24BDBD1C8];
  if (v8)
    v10 = MEMORY[0x24BDBD1C8];
  else
    v10 = 0;
  objc_msgSend(v4, "setFavoriteFacetimeAudio:", v10);

  v11 = *(void **)(a1 + 40);
  objc_msgSend(v3, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "containsObject:", v12))
    v13 = v9;
  else
    v13 = 0;
  objc_msgSend(v4, "setFavoriteFacetime:", v13);

  return v4;
}

+ (id)phoneNumbersFromContact:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDBA348];
  if (!objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x24BDBA348]))
  {
    v34 = 0;
    goto LABEL_20;
  }
  v36 = a1;
  objc_msgSend(MEMORY[0x24BDBAD20], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v4;
  objc_msgSend(v37, "entriesForContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:", v4, v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (!v8)
    goto LABEL_18;
  v9 = v8;
  v10 = *(_QWORD *)v48;
  v11 = *MEMORY[0x24BDBA200];
  v12 = *MEMORY[0x24BDBA208];
  v13 = *MEMORY[0x24BDBA210];
  v41 = *MEMORY[0x24BDBA248];
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v48 != v10)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      objc_msgSend(v15, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v11);

      if (v17)
      {
        objc_msgSend(v15, "actionType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v13);

        if (v19)
        {
          objc_msgSend(v15, "contactProperty");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v42;
        }
        else
        {
          objc_msgSend(v15, "actionType");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", v41);

          if (!v28)
            continue;
          objc_msgSend(v15, "contactProperty");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v39;
        }
        goto LABEL_15;
      }
      objc_msgSend(v15, "bundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", v12);

      if (v24)
      {
        objc_msgSend(v15, "actionType");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", v13);

        if (v26)
        {
          objc_msgSend(v15, "contactProperty");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v40;
LABEL_15:
          objc_msgSend(v22, "addObject:", v21);

          continue;
        }
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  }
  while (v9);
LABEL_18:

  v4 = v38;
  objc_msgSend(v38, "phoneNumbers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "filterLabeledValues:droppingEmptyLabels:droppingDuplicates:", v29, 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __49__CNAssistantConversion_phoneNumbersFromContact___block_invoke;
  v43[3] = &unk_24CE7BFF8;
  v44 = v42;
  v45 = v39;
  v46 = v40;
  v31 = v40;
  v32 = v39;
  v33 = v42;
  objc_msgSend(v30, "mapUsingBlock:", v43);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v34;
}

id __49__CNAssistantConversion_phoneNumbersFromContact___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedInternationalStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumber:", v6);

  objc_msgSend(v3, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NonEmptyOrNilString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v8);

  v9 = (void *)a1[4];
  objc_msgSend(v3, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);
  v12 = MEMORY[0x24BDBD1C8];
  if (v11)
    v13 = MEMORY[0x24BDBD1C8];
  else
    v13 = 0;
  objc_msgSend(v4, "setFavoriteFacetimeAudio:", v13);

  v14 = (void *)a1[5];
  objc_msgSend(v3, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "containsObject:", v15))
    v16 = v12;
  else
    v16 = 0;
  objc_msgSend(v4, "setFavoriteFacetime:", v16);

  v17 = (void *)a1[6];
  objc_msgSend(v3, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "containsObject:", v18))
    v19 = v12;
  else
    v19 = 0;
  objc_msgSend(v4, "setFavoriteVoice:", v19);

  return v4;
}

+ (id)phoneNumbersForSyncFromContact:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDBA348];
  if (!objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x24BDBA348]))
  {
    v34 = 0;
    goto LABEL_20;
  }
  v36 = a1;
  objc_msgSend(MEMORY[0x24BDBAD20], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v4;
  objc_msgSend(v37, "entriesForContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:", v4, v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (!v8)
    goto LABEL_18;
  v9 = v8;
  v10 = *(_QWORD *)v48;
  v11 = *MEMORY[0x24BDBA200];
  v12 = *MEMORY[0x24BDBA208];
  v13 = *MEMORY[0x24BDBA210];
  v41 = *MEMORY[0x24BDBA248];
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v48 != v10)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      objc_msgSend(v15, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v11);

      if (v17)
      {
        objc_msgSend(v15, "actionType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v13);

        if (v19)
        {
          objc_msgSend(v15, "contactProperty");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v42;
        }
        else
        {
          objc_msgSend(v15, "actionType");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", v41);

          if (!v28)
            continue;
          objc_msgSend(v15, "contactProperty");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v39;
        }
        goto LABEL_15;
      }
      objc_msgSend(v15, "bundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", v12);

      if (v24)
      {
        objc_msgSend(v15, "actionType");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", v13);

        if (v26)
        {
          objc_msgSend(v15, "contactProperty");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v40;
LABEL_15:
          objc_msgSend(v22, "addObject:", v21);

          continue;
        }
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  }
  while (v9);
LABEL_18:

  v4 = v38;
  objc_msgSend(v38, "phoneNumbers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "filterLabeledValues:droppingEmptyLabels:droppingDuplicates:", v29, 1, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __56__CNAssistantConversion_phoneNumbersForSyncFromContact___block_invoke;
  v43[3] = &unk_24CE7BFF8;
  v44 = v42;
  v45 = v39;
  v46 = v40;
  v31 = v40;
  v32 = v39;
  v33 = v42;
  objc_msgSend(v30, "mapUsingBlock:", v43);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v34;
}

id __56__CNAssistantConversion_phoneNumbersForSyncFromContact___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v5);

  v6 = (void *)a1[4];
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);
  v9 = MEMORY[0x24BDBD1C8];
  if (v8)
    v10 = MEMORY[0x24BDBD1C8];
  else
    v10 = 0;
  objc_msgSend(v4, "setFavoriteFacetimeAudio:", v10);

  v11 = (void *)a1[5];
  objc_msgSend(v3, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "containsObject:", v12))
    v13 = v9;
  else
    v13 = 0;
  objc_msgSend(v4, "setFavoriteFacetime:", v13);

  v14 = (void *)a1[6];
  objc_msgSend(v3, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "containsObject:", v15))
    v16 = v9;
  else
    v16 = 0;
  objc_msgSend(v4, "setFavoriteVoice:", v16);

  return v4;
}

+ (id)addressesFromContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x24BDBA378]))
  {
    objc_msgSend(v4, "postalAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filterLabeledValues:droppingEmptyLabels:droppingDuplicates:", v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "mapUsingBlock:", &__block_literal_global);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __46__CNAssistantConversion_addressesFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NonEmptyOrNilString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabel:", v5);

  objc_msgSend(v2, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "street");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NonEmptyOrNilString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStreet:", v8);

  objc_msgSend(v2, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "city");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NonEmptyOrNilString(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCity:", v11);

  objc_msgSend(v2, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NonEmptyOrNilString(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStateCode:", v14);

  objc_msgSend(v2, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postalCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NonEmptyOrNilString(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPostalCode:", v17);

  objc_msgSend(v2, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "ISOCountryCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NonEmptyOrNilString(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCountryCode:", v20);

  return v3;
}

+ (id)addressesForSyncFromContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x24BDBA378]))
  {
    objc_msgSend(v4, "postalAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filterLabeledValues:droppingEmptyLabels:droppingDuplicates:", v5, 1, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "mapUsingBlock:", &__block_literal_global_21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __53__CNAssistantConversion_addressesForSyncFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setLabel:", v4);
  return v3;
}

+ (id)relationsFromContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x24BDBA3C0]))
  {
    objc_msgSend(v4, "contactRelations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filterLabeledValues:droppingEmptyLabels:droppingDuplicates:", v5, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "mapUsingBlock:", &__block_literal_global_23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

id __46__CNAssistantConversion_relationsFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabel:", v4);

  objc_msgSend(v2, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v6);

  return v3;
}

+ (id)relationsForSyncFromContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x24BDBA3C0]))
  {
    objc_msgSend(v4, "contactRelations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filterLabeledValues:droppingEmptyLabels:droppingDuplicates:", v5, 1, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "mapUsingBlock:", &__block_literal_global_25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

id __53__CNAssistantConversion_relationsForSyncFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setLabel:", v4);
  return v3;
}

+ (id)socialProfilesFromContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x24BDBA3C8]))
  {
    objc_msgSend(v4, "socialProfiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filterLabeledValues:droppingEmptyLabels:droppingDuplicates:", v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "mapUsingBlock:", &__block_literal_global_27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

id __51__CNAssistantConversion_socialProfilesFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NonEmptyOrNilString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceType:", v6);

  objc_msgSend(v2, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NonEmptyOrNilString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUrl:", v9);

  objc_msgSend(v2, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NonEmptyOrNilString(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserName:", v12);

  return v3;
}

+ (id)verifyContact:(id)a3 hasDescriptorsForRequiredKeys:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "areKeysAvailable:", v6) & 1) == 0)
  {
    v14[0] = *MEMORY[0x24BDBA2E0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "areKeysAvailable:", v7);

    if (!v8)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v9 = (void *)objc_opt_new();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unifiedContactWithIdentifier:keysToFetch:error:", v10, v6, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v11;
  }
  v5 = v5;
  v12 = v5;
LABEL_6:

  return v12;
}

+ (void)markMeContactInPeople:(id)a3 usingStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[3];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v24[0] = *MEMORY[0x24BDBA2E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v14, "internalGUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if (v17)
          {
            objc_msgSend(v14, "setMe:", MEMORY[0x24BDBD1C8]);
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

    v5 = v18;
  }

}

+ (id)keysFromPerson:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA2C8]);
  objc_msgSend(v3, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA2C0]);
  objc_msgSend(v3, "middleName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA310]);
  objc_msgSend(v3, "nickName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA328]);
  objc_msgSend(v3, "prefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA318]);
  objc_msgSend(v3, "suffix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA320]);
  objc_msgSend(v3, "company");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA340]);
  objc_msgSend(v3, "birthday");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA258]);
  objc_msgSend(v3, "phonemeData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA350]);
  objc_msgSend(v3, "addresses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA378]);
  objc_msgSend(v3, "emails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA288]);
  objc_msgSend(v3, "phones");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA348]);
  objc_msgSend(v3, "relatedNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v4, "addObject:", *MEMORY[0x24BDBA3C0]);

  return v4;
}

+ (id)addressesFromPerson:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "addresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapUsingBlock:", &__block_literal_global_31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __45__CNAssistantConversion_addressesFromPerson___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "street");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStreet:", v4);

  objc_msgSend(v2, "city");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCity:", v5);

  objc_msgSend(v2, "stateCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setState:", v6);

  objc_msgSend(v2, "postalCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPostalCode:", v7);

  objc_msgSend(v2, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setISOCountryCode:", v8);

  v9 = (void *)MEMORY[0x24BDBAD38];
  objc_msgSend(v2, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "labeledValueWithLabel:value:", v10, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)emailAddressesFromPerson:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "emails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapUsingBlock:", &__block_literal_global_35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __50__CNAssistantConversion_emailAddressesFromPerson___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBAD38];
  v3 = a2;
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "labeledValueWithLabel:value:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)phoneNumbersFromPerson:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "phones");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapUsingBlock:", &__block_literal_global_37);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __48__CNAssistantConversion_phoneNumbersFromPerson___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDBAD88];
  v3 = a2;
  objc_msgSend(v3, "number");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phoneNumberWithStringValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDBAD38];
  objc_msgSend(v3, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "labeledValueWithLabel:value:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)relationsFromPerson:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "relatedNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapUsingBlock:", &__block_literal_global_40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __45__CNAssistantConversion_relationsFromPerson___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDBACF0];
  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactRelationWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDBAD38];
  objc_msgSend(v3, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "labeledValueWithLabel:value:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)addFieldsFromPerson:(id)a3 toContactWithIdentifier:(id)a4 usingStore:(id)a5 saveRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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
  id v40;
  _QWORD v41[10];

  v41[9] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  objc_msgSend(a1, "keysFromPerson:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BDBA288];
  v41[0] = *MEMORY[0x24BDBA348];
  v41[1] = v15;
  v16 = *MEMORY[0x24BDBA3F8];
  v41[2] = *MEMORY[0x24BDBA278];
  v41[3] = v16;
  v17 = *MEMORY[0x24BDBA3C0];
  v41[4] = *MEMORY[0x24BDBA2F8];
  v41[5] = v17;
  v18 = *MEMORY[0x24BDBA378];
  v41[6] = *MEMORY[0x24BDBA3C8];
  v41[7] = v18;
  v41[8] = *MEMORY[0x24BDBA260];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0;
  objc_msgSend(v12, "contactWithIdentifier:keysToFetch:error:", v13, v20, &v40);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v40;
  v23 = (void *)objc_msgSend(v21, "mutableCopy");

  if (v23)
  {
    objc_msgSend(v10, "addresses");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(a1, "addressesFromPerson:", v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postalAddresses");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "arrayByAddingObjectsFromArray:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setPostalAddresses:", v27);

    }
    objc_msgSend(v10, "emails");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(a1, "emailAddressesFromPerson:", v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "emailAddresses");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setEmailAddresses:", v31);

    }
    objc_msgSend(v10, "phones");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(a1, "phoneNumbersFromPerson:", v10);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "phoneNumbers");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setPhoneNumbers:", v35);

    }
    objc_msgSend(v10, "relatedNames");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(a1, "relationsFromPerson:", v10);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contactRelations");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "arrayByAddingObjectsFromArray:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setContactRelations:", v39);

    }
    objc_msgSend(v11, "updateContact:", v23);
  }
  else
  {
    _AFServiceLog();
  }

}

+ (void)setFieldsFromPerson:(id)a3 toContactWithIdentifier:(id)a4 usingStore:(id)a5 saveRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[10];

  v53[9] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  objc_msgSend(a1, "keysFromPerson:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BDBA288];
  v53[0] = *MEMORY[0x24BDBA348];
  v53[1] = v15;
  v16 = *MEMORY[0x24BDBA3F8];
  v53[2] = *MEMORY[0x24BDBA278];
  v53[3] = v16;
  v17 = *MEMORY[0x24BDBA3C0];
  v53[4] = *MEMORY[0x24BDBA2F8];
  v53[5] = v17;
  v18 = *MEMORY[0x24BDBA378];
  v53[6] = *MEMORY[0x24BDBA3C8];
  v53[7] = v18;
  v53[8] = *MEMORY[0x24BDBA260];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0;
  objc_msgSend(v12, "contactWithIdentifier:keysToFetch:error:", v13, v20, &v52);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v52;
  v23 = (void *)objc_msgSend(v21, "mutableCopy");

  if (v23)
  {
    objc_msgSend(v10, "firstName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v10, "firstName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setGivenName:", v25);

    }
    objc_msgSend(v10, "lastName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v10, "lastName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFamilyName:", v27);

    }
    objc_msgSend(v10, "middleName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v10, "middleName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setMiddleName:", v29);

    }
    objc_msgSend(v10, "nickName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v10, "nickName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setNickname:", v31);

    }
    objc_msgSend(v10, "prefix");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v10, "prefix");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setNamePrefix:", v33);

    }
    objc_msgSend(v10, "suffix");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v10, "suffix");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setNameSuffix:", v35);

    }
    objc_msgSend(v10, "company");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v10, "company");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setOrganizationName:", v37);

    }
    objc_msgSend(v10, "birthday");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "birthday");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "components:fromDate:", 28, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "setBirthday:", v41);
    }
    objc_msgSend(v10, "phonemeData");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v10, "phonemeData");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setPhonemeData:", v43);

    }
    objc_msgSend(v10, "addresses");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      +[CNAssistantConversion addressesFromPerson:](CNAssistantConversion, "addressesFromPerson:", v10);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setPostalAddresses:", v45);

    }
    objc_msgSend(v10, "emails");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      +[CNAssistantConversion emailAddressesFromPerson:](CNAssistantConversion, "emailAddressesFromPerson:", v10);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setEmailAddresses:", v47);

    }
    objc_msgSend(v10, "phones");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      +[CNAssistantConversion phoneNumbersFromPerson:](CNAssistantConversion, "phoneNumbersFromPerson:", v10);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setPhoneNumbers:", v49);

    }
    objc_msgSend(v10, "relatedNames");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      +[CNAssistantConversion relationsFromPerson:](CNAssistantConversion, "relationsFromPerson:", v10);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setContactRelations:", v51);

    }
    objc_msgSend(v11, "updateContact:", v23);
  }
  else
  {
    _AFServiceLog();
  }

}

+ (void)removeFieldsFromPerson:(id)a3 toContactWithIdentifier:(id)a4 usingStore:(id)a5 saveRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  objc_msgSend(a1, "keysFromPerson:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v12, "contactWithIdentifier:keysToFetch:error:", v13, v14, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v19;
  v17 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v10)
  {
    objc_msgSend(v10, "phonemeData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      objc_msgSend(v17, "setPhonemeData:", 0);
    objc_msgSend(v11, "updateContact:", v17);
  }
  else
  {
    _AFServiceLog();
  }

}

+ (void)applyUpdate:(id)a3 toContactWithIdentifier:(id)a4 usingStore:(id)a5 saveRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v21, "addFields");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v21, "addFields");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addFieldsFromPerson:toContactWithIdentifier:usingStore:saveRequest:", v14, v10, v11, v12);

  }
  objc_msgSend(v21, "setFields");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v21, "setFields");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setFieldsFromPerson:toContactWithIdentifier:usingStore:saveRequest:", v16, v10, v11, v12);

    objc_msgSend(v21, "setFields");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "me");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "BOOLValue");

  }
  objc_msgSend(v21, "removeFields");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v21, "removeFields");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeFieldsFromPerson:toContactWithIdentifier:usingStore:saveRequest:", v20, v10, v11, v12);

  }
}

@end
