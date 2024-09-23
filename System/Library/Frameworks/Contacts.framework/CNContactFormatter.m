@implementation CNContactFormatter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameFormatter, 0);
}

+ (CNContactDisplayNameOrder)nameOrderForContact:(CNContact *)contact
{
  CNContact *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  CNContactDisplayNameOrder v7;
  void *v8;

  v3 = contact;
  v4 = (void *)MEMORY[0x1E0CB3858];
  objc_msgSend(MEMORY[0x1E0CB3850], "componentsForContact:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_nameOrderWithOverridesForComponents:options:", v5, 0);

  v7 = +[NSPersonNameComponentsFormatter contactsNameOrderFromFoundationNameOrder:](MEMORY[0x1E0CB3858], v6);
  if (+[CN isEmptyNameContact:phonetic:includingPrefixAndSuffix:](CN, "isEmptyNameContact:phonetic:includingPrefixAndSuffix:", v3, 0, 1)&& +[CN isEmptyNameContact:phonetic:includingPrefixAndSuffix:](CN, "isEmptyNameContact:phonetic:includingPrefixAndSuffix:", v3, 1, 1))
  {
    +[CNContactsUserDefaults sharedDefaults](CNContactsUserDefaults, "sharedDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "newContactDisplayNameOrder");

  }
  return v7;
}

- (id)fullNameForContact:(void *)a3 attributes:(uint64_t)a4 style:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  int v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  id *v42;
  char v43;
  __CFString *v44;
  int v45;
  __CFString *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[3];

  v57[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v47 = 0;
    goto LABEL_53;
  }
  if (a4 == 1)
  {
    +[CN localizedPhoneticNameDelimiterForContact:](CN, "localizedPhoneticNameDelimiterForContact:", v7);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[CN orderForContactPhoneticName:](CN, "orderForContactPhoneticName:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CN phoneticOrganizationNameDescription](CN, "phoneticOrganizationNameDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = v9;
    objc_msgSend(v9, "phoneticNameProperties");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CN localizedNameDelimiterForContact:](CN, "localizedNameDelimiterForContact:", v7);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 1003)
    {
      +[CNContactNameOrderImpl orderForSortOrder:](CNContactNameOrderImpl, "orderForSortOrder:", objc_msgSend(a1, "sortOrder"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[CN phoneticOrganizationNameDescription](CN, "phoneticOrganizationNameDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v14;
      +[CN organizationNameDescription](CN, "organizationNameDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v57[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = v13;
      objc_msgSend(v13, "sortingNameProperties");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CN orderForContactName:](CN, "orderForContactName:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CN organizationNameDescription](CN, "organizationNameDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = v16;
      objc_msgSend(v16, "nameProperties");
      v12 = objc_claimAutoreleasedReturnValue();
    }
  }
  v18 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = a4 == 1003 || objc_msgSend(a1, "fallbackStyle") == -1;
  if ((objc_msgSend(a1, "ignoresOrganization") & 1) == 0 && objc_msgSend(v7, "contactType") == 1)
    -[CNContactFormatter appendValueForProperties:fromContact:toString:delimiter:attributes:fallback:]((uint64_t)a1, v11, v7, v19, v53, v8, v20);
  v49 = v18;
  v52 = v11;
  if (objc_msgSend(v19, "length"))
  {
    objc_msgSend(v11, "firstObject", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "key");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNContactFormatter appendValueForProperties:fromContact:toString:delimiter:attributes:fallback:]((uint64_t)a1, v18, v7, v19, v53, v8, v20);
    v22 = 0;
  }
  v23 = objc_msgSend(v19, "length", v49);
  if (a4 != 1 && !v23 && (objc_msgSend(a1, "ignoresNickname") & 1) == 0)
  {
    +[CN nicknameDescription](CN, "nicknameDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactFormatter appendValueForProperties:fromContact:toString:delimiter:attributes:fallback:]((uint64_t)a1, v25, v7, v19, v53, v8, v20);

    objc_msgSend(v24, "key");
    v26 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v26;
  }
  if (!objc_msgSend(v19, "length")
    && (objc_msgSend(a1, "ignoresOrganization") & 1) == 0
    && objc_msgSend(v7, "contactType") != 1)
  {
    -[CNContactFormatter appendValueForProperties:fromContact:toString:delimiter:attributes:fallback:]((uint64_t)a1, v52, v7, v19, v53, v8, v20);
    v27 = CFSTR("organizationName");

    v22 = v27;
  }
  if (!objc_msgSend(v19, "length"))
  {
    v32 = objc_msgSend(a1, "fallbackStyle");
    if (a4 != 1 && v32 == -1)
    {
      if (objc_msgSend(v7, "isKeyAvailable:", CFSTR("emailAddresses")))
      {
        objc_msgSend(v7, "emailAddresses");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "value");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactFormatter appendValue:derivedFromPropertyName:toString:delimiter:attributes:]((uint64_t)a1, v35, CFSTR("emailAddresses"), v19, v53, v8);

        v36 = CFSTR("emailAddresses");
        v22 = v36;
      }
      if (!objc_msgSend(v19, "length") && objc_msgSend(v7, "isKeyAvailable:", CFSTR("phoneNumbers")))
      {
        objc_msgSend(v7, "phoneNumbers");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "firstObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "value");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "formattedStringValue");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactFormatter appendValue:derivedFromPropertyName:toString:delimiter:attributes:]((uint64_t)a1, v40, CFSTR("phoneNumbers"), v19, v53, v8);

        v41 = CFSTR("phoneNumbers");
        v22 = v41;
      }
    }
  }
  v28 = objc_msgSend(a1, "emphasizesPrimaryNameComponent");
  if (v8 && v28)
  {
    +[CNContactsUserDefaults sharedDefaults](CNContactsUserDefaults, "sharedDefaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "sortOrder");

    if (v22)
    {
LABEL_28:
      if ((__58__CNContactFormatter_fullNameForContact_attributes_style___block_invoke((uint64_t)v31, v22, v8) & 1) != 0)
        goto LABEL_49;
LABEL_44:
      v43 = objc_msgSend(CFSTR("givenName"), "isEqual:", v22);
      v44 = CFSTR("familyName");
      if ((v43 & 1) != 0 || (v45 = objc_msgSend(CFSTR("familyName"), "isEqual:", v22), v44 = CFSTR("givenName"), v45))
      {
        v44 = v44;
        v46 = v44;
      }
      else
      {
        v46 = 0;
      }
      __58__CNContactFormatter_fullNameForContact_attributes_style___block_invoke((uint64_t)v44, v46, v8);

      goto LABEL_49;
    }
    if (objc_msgSend(v53, "length"))
    {
      if (v30 == 2)
      {
        v42 = (id *)&CNContactGivenNameKey;
LABEL_43:
        v31 = *v42;
        v22 = v31;
        if (!v31)
          goto LABEL_44;
        goto LABEL_28;
      }
      if (v30 == 3)
      {
        v42 = (id *)&CNContactFamilyNameKey;
        goto LABEL_43;
      }
    }
    v22 = 0;
    goto LABEL_44;
  }
LABEL_49:
  if (objc_msgSend(v19, "length"))
    v47 = (void *)objc_msgSend(v19, "copy");
  else
    v47 = 0;

LABEL_53:
  return v47;
}

- (unint64_t)fallbackStyle
{
  return self->_fallbackStyle;
}

- (void)appendValueForProperties:(void *)a3 fromContact:(void *)a4 toString:(void *)a5 delimiter:(void *)a6 attributes:(char)a7 fallback:
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id obj;
  _QWORD aBlock[4];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  obj = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v19);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __98__CNContactFormatter_appendValueForProperties_fromContact_toString_delimiter_attributes_fallback___block_invoke;
          aBlock[3] = &unk_1E29FA998;
          v21 = v12;
          v31 = a7;
          v26 = v21;
          v27 = a1;
          v28 = v13;
          v29 = v14;
          v30 = v15;
          v22 = _Block_copy(aBlock);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v20, "enumerateObjectsUsingBlock:", v22);
          else
            (*((void (**)(void *, void *, _QWORD, _QWORD))v22 + 2))(v22, v20, 0, 0);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v17);
    }
  }

}

void __98__CNContactFormatter_appendValueForProperties_fromContact_toString_delimiter_attributes_fallback___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "CNValueForContact:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "length"))
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactFormatter appendValue:derivedFromPropertyName:toString:delimiter:attributes:](v7, v6, v8, *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));

    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (a4 && !*(_BYTE *)(a1 + 72))
LABEL_7:
    *a4 = 1;
LABEL_8:

}

- (BOOL)ignoresOrganization
{
  return self->_ignoresOrganization;
}

- (BOOL)emphasizesPrimaryNameComponent
{
  return self->_emphasizesPrimaryNameComponent;
}

- (void)appendValue:(void *)a3 derivedFromPropertyName:(void *)a4 toString:(void *)a5 delimiter:(void *)a6 attributes:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (a1 && objc_msgSend(v17, "length"))
  {
    if (objc_msgSend(v12, "length"))
      objc_msgSend(v12, "appendString:", v13);
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", objc_msgSend(v12, "length"), objc_msgSend(v17, "length"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v16, v15);
      }
      objc_msgSend(v16, "setObject:forKey:", v11, CFSTR("contactProperty"));

    }
    objc_msgSend(v12, "appendString:", v17);
  }

}

- (BOOL)ignoresNickname
{
  return self->_ignoresNickname;
}

uint64_t __58__CNContactFormatter_fullNameForContact_attributes_style___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a2;
  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__CNContactFormatter_fullNameForContact_attributes_style___block_invoke_2;
  v9[3] = &unk_1E29FA970;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactFormatter attributedStringFromContact:defaultAttributes:](self, "attributedStringFromContact:defaultAttributes:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSAttributedString)attributedStringFromContact:(CNContact *)contact defaultAttributes:(NSDictionary *)attributes
{
  NSDictionary *v6;
  void *v7;
  CNContact *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  NSDictionary *v20;

  v6 = attributes;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = contact;
  objc_msgSend(v7, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactFormatter stringFromContact:attributes:](self, "stringFromContact:attributes:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v10, v6);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __68__CNContactFormatter_attributedStringFromContact_defaultAttributes___block_invoke;
    v18 = &unk_1E29FA948;
    v19 = v11;
    v20 = v6;
    v12 = v11;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v15);
    v13 = (void *)objc_msgSend(v12, "copy", v15, v16, v17, v18);

  }
  else
  {
    v13 = 0;
  }

  return (NSAttributedString *)v13;
}

void __56__CNContactFormatter_descriptorForRequiredKeysForStyle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[9];

  v9[8] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("givenName");
  v9[1] = CFSTR("middleName");
  v9[2] = CFSTR("familyName");
  v9[3] = CFSTR("phoneticGivenName");
  v9[4] = CFSTR("phoneticMiddleName");
  v9[5] = CFSTR("phoneticFamilyName");
  v9[6] = CFSTR("phoneticOrganizationName");
  v9[7] = CFSTR("contactType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Formatter style: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:description:](CNAggregateKeyDescriptor, "keyDescriptorWithKeyDescriptors:description:", v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)descriptorForRequiredKeysForStyle__cn_once_object_1;
  descriptorForRequiredKeysForStyle__cn_once_object_1 = v7;

}

void __56__CNContactFormatter_descriptorForRequiredKeysForStyle___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[9];

  v9[8] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("namePrefix");
  v9[1] = CFSTR("givenName");
  v9[2] = CFSTR("middleName");
  v9[3] = CFSTR("familyName");
  v9[4] = CFSTR("nameSuffix");
  v9[5] = CFSTR("contactType");
  v9[6] = CFSTR("organizationName");
  v9[7] = CFSTR("nickname");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Formatter style: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:description:](CNAggregateKeyDescriptor, "keyDescriptorWithKeyDescriptors:description:", v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)descriptorForRequiredKeysForStyle__cn_once_object_3;
  descriptorForRequiredKeysForStyle__cn_once_object_3 = v7;

}

void __58__CNContactFormatter_fullNameForContact_attributes_style___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "objectForKey:", CFSTR("contactProperty"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("contactNameEmphasis"));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __68__CNContactFormatter_attributedStringFromContact_defaultAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  uint64_t UIFontForLanguage;

  v5 = a3;
  v6 = objc_msgSend(a2, "rangeValue");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", v5, v6, v7);
  objc_msgSend(v5, "objectForKey:", CFSTR("contactNameEmphasis"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v9, "BOOLValue");
  if ((_DWORD)v5)
  {
    if (LoadCoreText_loadPredicate != -1)
      dispatch_once(&LoadCoreText_loadPredicate, &__block_literal_global_139_0);
    v10 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("contactNameEmphasisFont"));
    if (v10)
    {
      v11 = v10;
      v12 = 0;
LABEL_10:
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", getkCTFontAttributeName(), v11, v6, v8);
      if (v12)
        CFRelease(v12);
      return;
    }
    v13 = objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", getkCTFontAttributeName(), v6, 0);
    if (v13)
      UIFontForLanguage = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, double))softLinkCTFontCreateCopyWithSymbolicTraits[0])(v13, 0, 2, 2, 0.0);
    else
      UIFontForLanguage = softLinkCTFontCreateUIFontForLanguage(3, 0, 0.0);
    v12 = (const void *)UIFontForLanguage;
    v11 = UIFontForLanguage;
    if (UIFontForLanguage)
      goto LABEL_10;
  }
}

+ (id)abbreviatedStringFromContact:(id)a3 trimmingWhitespace:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "givenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_cn_trimmedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGivenName:", v8);

    objc_msgSend(v6, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_cn_trimmedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFamilyName:", v10);

  }
  objc_msgSend((id)objc_opt_class(), "stringFromContact:style:", v6, 1002);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)descriptorForRequiredKeys
{
  CNContactFormatterStyle v3;
  CNContactFormatterSmartFetcher *v4;

  if ((-[CNContactFormatter style](self, "style") == CNContactFormatterStyleFullName
     || (v3 = -[CNContactFormatter style](self, "style"), objc_opt_self(), (v3 & 0xFFFFFFFFFFFFFFFELL) == 0x3E8))
    && -[CNContactFormatter fallbackStyle](self, "fallbackStyle") == -1)
  {
    v4 = objc_alloc_init(CNContactFormatterSmartFetcher);
    -[CNContactFormatterSmartFetcher setIgnoresNickname:](v4, "setIgnoresNickname:", -[CNContactFormatter ignoresNickname](self, "ignoresNickname"));
    -[CNContactFormatterSmartFetcher setIgnoresOrganization:](v4, "setIgnoresOrganization:", -[CNContactFormatter ignoresOrganization](self, "ignoresOrganization"));
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForStyle:", -[CNContactFormatter style](self, "style"));
    v4 = (CNContactFormatterSmartFetcher *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)descriptorForRequiredKeysForStyle:(CNContactFormatterStyle)style
{
  uint64_t *v3;
  _QWORD v5[5];
  _QWORD v6[6];
  _QWORD block[5];

  if (style == 1003)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__CNContactFormatter_descriptorForRequiredKeysForStyle___block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = a1;
    v6[5] = 1003;
    if (descriptorForRequiredKeysForStyle__cn_once_token_2 != -1)
      dispatch_once(&descriptorForRequiredKeysForStyle__cn_once_token_2, v6);
    v3 = &descriptorForRequiredKeysForStyle__cn_once_object_2;
  }
  else if (style == CNContactFormatterStylePhoneticFullName)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__CNContactFormatter_descriptorForRequiredKeysForStyle___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = 1;
    if (descriptorForRequiredKeysForStyle__cn_once_token_1 != -1)
      dispatch_once(&descriptorForRequiredKeysForStyle__cn_once_token_1, block);
    v3 = &descriptorForRequiredKeysForStyle__cn_once_object_1;
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__CNContactFormatter_descriptorForRequiredKeysForStyle___block_invoke_3;
    v5[3] = &__block_descriptor_40_e5_v8__0l;
    v5[4] = style;
    if (descriptorForRequiredKeysForStyle__cn_once_token_3 != -1)
      dispatch_once(&descriptorForRequiredKeysForStyle__cn_once_token_3, v5);
    v3 = &descriptorForRequiredKeysForStyle__cn_once_object_3;
  }
  return (id)*v3;
}

- (_QWORD)nameFormatter
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      +[NSPersonNameComponentsFormatter formatterWithCNContactStyle:](MEMORY[0x1E0CB3858], objc_msgSend(a1, "style"));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v1[2];
      v1[2] = v3;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

+ (NSString)stringFromContact:(CNContact *)contact style:(CNContactFormatterStyle)style
{
  CNContact *v6;
  id v7;
  void *v8;

  v6 = contact;
  v7 = objc_alloc_init((Class)a1);
  objc_msgSend(v7, "setStyle:", style);
  objc_msgSend(v7, "stringFromContact:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setStyle:(CNContactFormatterStyle)style
{
  self->_style = style;
}

- (CNContactFormatter)init
{
  CNContactFormatter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactFormatter;
  result = -[CNContactFormatter init](&v3, sel_init);
  if (result)
    result->_fallbackStyle = 1;
  return result;
}

- (id)stringFromContact:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  CNContactFormatterStyle v8;
  CNContactFormatterStyle v9;
  uint64_t v10;
  CNContactFormatter *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = -[CNContactFormatter style](self, "style");
  v9 = v8;
  switch(v8)
  {
    case 1000:
      -[CNContactFormatter shortNameForContact:attributes:](self, v6);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1001:
    case 1002:
      -[CNContactFormatter avatarNameForContact:attributes:](self, v6);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1003:
      v11 = self;
      v12 = v6;
      v13 = v7;
      v14 = 1003;
      goto LABEL_9;
    default:
      if (v8 == CNContactFormatterStylePhoneticFullName)
      {
        v11 = self;
        v12 = v6;
        v13 = v7;
        v14 = 1;
      }
      else
      {
        if (v8)
        {
          v15 = 0;
          goto LABEL_11;
        }
        v11 = self;
        v12 = v6;
        v13 = v7;
        v14 = 0;
      }
LABEL_9:
      -[CNContactFormatter fullNameForContact:attributes:style:](v11, v12, v13, v14);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v15 = (void *)v10;
LABEL_11:
      v16 = *MEMORY[0x1E0D13848];
      v17 = (*(uint64_t (**)(_QWORD, void *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v15);
      if (v9)
      {
        if (v17)
        {
          if ((-[CNContactFormatter fallbackStyle](self, "fallbackStyle") & 1) != 0)
          {
            objc_opt_self();
            if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 0x3E8)
            {
              -[CNContactFormatter fullNameForContact:attributes:style:](self, v6, v7, 0);
              v18 = objc_claimAutoreleasedReturnValue();

              v15 = (void *)v18;
            }
          }
        }
      }
      if ((*(unsigned int (**)(uint64_t, void *))(v16 + 16))(v16, v15))
      {

        v15 = 0;
      }

      return v15;
  }
}

- (CNContactFormatterStyle)style
{
  return self->_style;
}

- (NSString)stringFromContact:(CNContact *)contact
{
  return (NSString *)-[CNContactFormatter stringFromContact:attributes:](self, "stringFromContact:attributes:", contact, 0);
}

- (_QWORD)avatarNameForContact:(_QWORD *)a1 attributes:(void *)a2
{
  _QWORD *v2;
  id v3;
  void *v4;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    -[CNContactFormatter nameFormatter](v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPersonNameComponentsFormatter stringFromContact:](v4, (uint64_t)v3);
    v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (_QWORD)shortNameForContact:(_QWORD *)a1 attributes:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "contactType") == 1
      && (+[CNContactsUserDefaults sharedDefaults](CNContactsUserDefaults, "sharedDefaults"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "shortNameFormatPrefersNicknames"),
          v5,
          !v6))
    {
      a1 = 0;
    }
    else
    {
      -[CNContactFormatter nameFormatter](a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSPersonNameComponentsFormatter stringFromContact:](v7, (uint64_t)v4);
      a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    }
  }

  return a1;
}

- (void)setFallbackStyle:(unint64_t)a3
{
  self->_fallbackStyle = a3;
}

- (void)setEmphasizesPrimaryNameComponent:(BOOL)a3
{
  self->_emphasizesPrimaryNameComponent = a3;
}

- (void)setIgnoresOrganization:(BOOL)a3
{
  self->_ignoresOrganization = a3;
}

+ (id)posterNameComponentsForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNContactsUserDefaults sharedDefaults](CNContactsUserDefaults, "sharedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "posterNameComponentsForContact:nameOrder:localeEmphasisStyle:preferNicknames:", v4, 0, 4, objc_msgSend(v5, "shortNameFormatPrefersNicknames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)posterNameComponentsForContact:(id)a3 nameOrder:(int64_t)a4 localeEmphasisStyle:(int64_t)a5 preferNicknames:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  int64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;

  v6 = a6;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3850], "componentsForContact:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v12, "setStyle:", 2);
  v13 = +[CNContactFormatter nameEmphasisStyleForContact:localeBasedEmphasisStyle:preferNickname:](CNContactFormatter, "nameEmphasisStyleForContact:localeBasedEmphasisStyle:preferNickname:", v9, a5, v6);
  v14 = +[CNContactFormatter singleNameStyleForContact:](CNContactFormatter, "singleNameStyleForContact:", v9);
  if (v13 == 2)
    goto LABEL_5;
  if (v13 == 3)
  {
    objc_msgSend(v9, "nickname");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFirstNameComponent:", v15);

    objc_msgSend(v10, "setEmphasizedNameComponentIndex:", 0);
    v16 = 0;
LABEL_4:
    objc_msgSend(v10, "setSingleNameComponentIndex:", v16);
    goto LABEL_5;
  }
  v26 = v14;
  if (!a4)
    a4 = objc_msgSend(v12, "_nameOrderWithOverridesForComponents:", v11);
  if (a4 == 2)
  {
    objc_msgSend(v11, "familyName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "length");

    if (!v32)
      goto LABEL_5;
    objc_msgSend(v11, "familyName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "length"))
    {
      objc_msgSend(v11, "familyName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFirstNameComponent:", v34);

    }
    else
    {
      objc_msgSend(v10, "setFirstNameComponent:", &stru_1E29FF900);
    }

    objc_msgSend(v11, "givenName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "length"))
    {
      objc_msgSend(v11, "givenName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSecondNameComponent:", v38);

    }
    else
    {
      objc_msgSend(v10, "setSecondNameComponent:", 0);
    }

    if (v13)
    {
      if (v13 != 1)
      {
LABEL_38:
        v16 = v26 == 0;
        goto LABEL_4;
      }
      v39 = 0;
    }
    else
    {
      v39 = 1;
    }
    objc_msgSend(v10, "setEmphasizedNameComponentIndex:", v39);
    goto LABEL_38;
  }
  if (a4 == 1)
  {
    objc_msgSend(v11, "givenName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length");

    if (v28)
    {
      objc_msgSend(v11, "givenName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "length"))
      {
        objc_msgSend(v11, "givenName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setFirstNameComponent:", v30);

      }
      else
      {
        objc_msgSend(v10, "setFirstNameComponent:", &stru_1E29FF900);
      }

      objc_msgSend(v11, "familyName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "length"))
      {
        objc_msgSend(v11, "familyName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSecondNameComponent:", v36);

      }
      else
      {
        objc_msgSend(v10, "setSecondNameComponent:", 0);
      }

      if (v13 <= 1)
        objc_msgSend(v10, "setEmphasizedNameComponentIndex:", v13);
      v16 = v26 != 0;
      goto LABEL_4;
    }
  }
LABEL_5:
  objc_msgSend(v10, "firstNameComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (!v18)
  {
    objc_msgSend(v12, "stringFromPersonNameComponents:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFirstNameComponent:", v19);

  }
  objc_msgSend(v10, "firstNameComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (!v21)
  {
    objc_msgSend(v9, "organizationName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFirstNameComponent:", v22);

  }
  objc_msgSend(v10, "secondNameComponent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (!v24)
    objc_msgSend(v10, "setSingleNameComponentIndex:", 0);

  return v10;
}

+ (NSAttributedString)attributedStringFromContact:(CNContact *)contact style:(CNContactFormatterStyle)style defaultAttributes:(NSDictionary *)attributes
{
  NSDictionary *v8;
  CNContact *v9;
  id v10;
  void *v11;

  v8 = attributes;
  v9 = contact;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setStyle:", style);
  objc_msgSend(v10, "attributedStringFromContact:defaultAttributes:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v11;
}

void __56__CNContactFormatter_descriptorForRequiredKeysForStyle___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v10[1] = CFSTR("phoneticGivenName");
  v10[2] = CFSTR("phoneticMiddleName");
  v10[3] = CFSTR("phoneticFamilyName");
  v10[4] = CFSTR("phoneticOrganizationName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Formatter style: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:description:](CNAggregateKeyDescriptor, "keyDescriptorWithKeyDescriptors:description:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)descriptorForRequiredKeysForStyle__cn_once_object_2;
  descriptorForRequiredKeysForStyle__cn_once_object_2 = v8;

}

+ (id)descriptorForRequiredKeysForNameOrder
{
  if (descriptorForRequiredKeysForNameOrder_cn_once_token_4 != -1)
    dispatch_once(&descriptorForRequiredKeysForNameOrder_cn_once_token_4, &__block_literal_global_62);
  return (id)descriptorForRequiredKeysForNameOrder_cn_once_object_4;
}

void __59__CNContactFormatter_descriptorForRequiredKeysForNameOrder__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[NSPersonNameComponents keyVectorForUsedKeys]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  +[CN keyVectorForAllUsedKeysForInternationalSupport](CN, "keyVectorForAllUsedKeysForInternationalSupport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "unionKeyVector:", v2);

  v7[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:description:](CNAggregateKeyDescriptor, "keyDescriptorWithKeyDescriptors:description:", v3, CFSTR("Name order"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)descriptorForRequiredKeysForNameOrder_cn_once_object_4;
  descriptorForRequiredKeysForNameOrder_cn_once_object_4 = v5;

}

+ (int64_t)nameEmphasisStyleForContact:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  +[CNContactsUserDefaults sharedDefaults](CNContactsUserDefaults, "sharedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "nameEmphasisStyleForContact:localeBasedEmphasisStyle:preferNickname:", v4, 4, objc_msgSend(v5, "shortNameFormatPrefersNicknames"));

  return v6;
}

+ (int64_t)nameEmphasisStyleForContact:(id)a3 localeBasedEmphasisStyle:(int64_t)a4 preferNickname:(BOOL)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD block[5];

  v8 = a3;
  objc_msgSend(v8, "nickname");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10 && a5)
  {
    a4 = 3;
  }
  else if (+[CN hasContactChineseJapaneseKoreanName:](CN, "hasContactChineseJapaneseKoreanName:", v8))
  {
    a4 = 2;
  }
  else if (a4 == 4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__CNContactFormatter_nameEmphasisStyleForContact_localeBasedEmphasisStyle_preferNickname___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (nameEmphasisStyleForContact_localeBasedEmphasisStyle_preferNickname__onceToken != -1)
      dispatch_once(&nameEmphasisStyleForContact_localeBasedEmphasisStyle_preferNickname__onceToken, block);
    a4 = nameEmphasisStyleForContact_localeBasedEmphasisStyle_preferNickname___localeEmphasisStyle;
  }

  return a4;
}

void __90__CNContactFormatter_nameEmphasisStyleForContact_localeBasedEmphasisStyle_preferNickname___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathForResource:ofType:", CFSTR("CNContactNameFormatStyle"), CFSTR("plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfFile:", v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_LOCALIZABLE_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CNContactNameFormatStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  nameEmphasisStyleForContact_localeBasedEmphasisStyle_preferNickname___localeEmphasisStyle = objc_msgSend(v4, "integerValue");

}

+ (int64_t)singleNameStyleForContact:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CNContactFormatter_singleNameStyleForContact___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (singleNameStyleForContact__onceToken != -1)
    dispatch_once(&singleNameStyleForContact__onceToken, block);
  return singleNameStyleForContact___localeSingleNameStyle;
}

void __48__CNContactFormatter_singleNameStyleForContact___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathForResource:ofType:", CFSTR("CNContactNameFormatStyle"), CFSTR("plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfFile:", v2);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_LOCALIZABLE_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CNContactSingleNameStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "integerValue");
  else
    v5 = 0;
  singleNameStyleForContact___localeSingleNameStyle = v5;

}

+ (id)descriptorForRequiredKeysForDelimiter
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3850], "descriptorForUsedKeys");
}

+ (NSString)delimiterForContact:(CNContact *)contact
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3858];
  objc_msgSend(MEMORY[0x1E0CB3850], "componentsForContact:", contact);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_localizedDelimiterForComponents:options:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactFormatter)initWithCoder:(id)a3
{
  id v4;
  CNContactFormatter *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CNContactFormatter;
  v5 = -[CNContactFormatter initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    v5->_ignoresNickname = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoresNickname"));
    v5->_ignoresOrganization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoresOrganization"));
    v5->_fallbackStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fallbackStyle"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactFormatter;
  v4 = a3;
  -[CNContactFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, CFSTR("style"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_ignoresOrganization, CFSTR("ignoresOrganization"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_ignoresNickname, CFSTR("ignoresNickname"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_fallbackStyle, CFSTR("fallbackStyle"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactFormatter;
  v4 = -[CNContactFormatter copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setIgnoresNickname:", -[CNContactFormatter ignoresNickname](self, "ignoresNickname"));
  objc_msgSend(v4, "setIgnoresOrganization:", -[CNContactFormatter ignoresOrganization](self, "ignoresOrganization"));
  objc_msgSend(v4, "setFallbackStyle:", -[CNContactFormatter fallbackStyle](self, "fallbackStyle"));
  objc_msgSend(v4, "setStyle:", -[CNContactFormatter style](self, "style"));
  return v4;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactFormatter stringFromContact:](self, "stringFromContact:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  NSLog(CFSTR("Parsing a string into a contact is not supported."), a2, a3, a4, a5);
  return 0;
}

- (void)setIgnoresNickname:(BOOL)a3
{
  self->_ignoresNickname = a3;
}

- (int64_t)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(int64_t)a3
{
  self->_sortOrder = a3;
}

- (id)stringFromPotentiallySuggestedContact:(id)a3 relatedToProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  -[CNContactFormatter stringFromContact:](self, "stringFromContact:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isSuggested");

  if ((v9 & 1) != 0
    || (objc_msgSend(v6, "labeledValue"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isSuggested"),
        v10,
        v11))
  {
    objc_msgSend(MEMORY[0x1E0D13A98], "localizedStringForString:class:returningNilIfNotFound:", CFSTR("MAYBE_FORMAT-%@"), objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v12, v8);
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }

  return v8;
}

@end
