@implementation CNUserActivitySerialization

+ (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[10];

  v8[9] = *MEMORY[0x1E0C80C00];
  +[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0, CFSTR("identifier"), CFSTR("externalUUID"), CFSTR("emailAddresses"), CFSTR("phoneNumbers"), CFSTR("contactType"), CFSTR("givenName"), CFSTR("familyName"), CFSTR("organizationName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[8] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)userActivityPayloadWithContacts:(id)a3 shouldUnify:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void (**v13)(uint64_t, void *);
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void (**v19)(uint64_t, void *);
  void *v20;
  void *v21;
  void *v22;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "allAvailableServerUUIDsForContact:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v9, CFSTR("carddav-uuids"));

    objc_msgSend(a1, "distinctEmailAddressesForContact:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v10, CFSTR("email-addresses"));

    objc_msgSend(a1, "distinctPhoneNumbersForContact:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v11, CFSTR("phone-numbers"));

    v12 = objc_msgSend(a1, "isContactACompany:", v7);
    v13 = (void (**)(uint64_t, void *))sNilStringIfEmpty;
    if ((v12 & 1) != 0)
    {
      objc_msgSend(v7, "organizationName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2]((uint64_t)v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v15, CFSTR("organization-name"));

      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("is-organization"));
    }
    else
    {
      objc_msgSend(v7, "givenName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2]((uint64_t)v13, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v18, CFSTR("first-name"));

      v19 = (void (**)(uint64_t, void *))sNilStringIfEmpty;
      objc_msgSend(v7, "familyName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2]((uint64_t)v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v21, CFSTR("last-name"));

    }
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13820] + 16))() & 1) != 0)
    {
      v16 = (id)MEMORY[0x1E0C9AA70];
    }
    else
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E2A40368, CFSTR("version"));
      objc_msgSend(a1, "fullNameForContact:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("contact-name"));

      if (v4)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("unified"));
      v16 = v8;
    }

  }
  else
  {
    v16 = (id)MEMORY[0x1E0C9AA70];
  }

  return v16;
}

+ (id)userActivityTitleWithContacts:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fullNameForContact:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E29FF900;
  }

  return v6;
}

+ (BOOL)isContactACompany:(id)a3
{
  return objc_msgSend(a3, "contactType") == 1;
}

+ (id)allAvailableServerUUIDsForContact:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v3, "linkedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(uint64_t, void *))(v4 + 16))(v4, v5))
  {
    v13[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "linkedContacts");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  objc_msgSend(v7, "_cn_map:", sContactServerUUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_filter:", *MEMORY[0x1E0D13830]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(uint64_t, void *))(v4 + 16))(v4, v9))
    v10 = 0;
  else
    v10 = v9;
  v11 = v10;

  return v11;
}

+ (id)distinctEmailAddressesForContact:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v3, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNLabeledValue Value](CNLabeledValue, "Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_map:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_cn_distinctObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D13B90], "IsNotEmpty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_cn_filter:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(unsigned int (**)(uint64_t, void *))(v4 + 16))(v4, v13))
      v14 = 0;
    else
      v14 = v13;
    v7 = v14;

  }
  return v7;
}

+ (id)distinctPhoneNumbersForContact:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v3, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "phoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNLabeledValue Value](CNLabeledValue, "Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_map:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPhoneNumber StringValue](CNPhoneNumber, "StringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_cn_map:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "_cn_distinctObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D13B90], "IsNotEmpty");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_cn_filter:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(unsigned int (**)(uint64_t, void *))(v4 + 16))(v4, v15))
      v16 = 0;
    else
      v16 = v15;
    v7 = v16;

  }
  return v7;
}

+ (id)fullNameForContact:(id)a3
{
  return +[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", a3, 0);
}

@end
