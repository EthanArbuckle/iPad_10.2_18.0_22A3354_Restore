@implementation CNContact(EmailContactAdditions)

+ (id)em_contactFromEmailAddress:()EmailContactAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "ea_addressCommentPersonNameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ea_uncommentedAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)em_contactWithPersonNameComponents:()EmailContactAdditions
{
  objc_msgSend(a1, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:", a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)em_contactWithPersonNameComponents:()EmailContactAdditions emailAddress:emailAddressLabel:
{
  objc_msgSend(a1, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:allowInvalidEmailAddress:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)em_contactWithPersonNameComponents:()EmailContactAdditions emailAddress:emailAddressLabel:allowInvalidEmailAddress:
{
  id v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v9, "namePrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v9, "namePrefix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNamePrefix:", v14);

  }
  objc_msgSend(v9, "givenName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v9, "givenName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setGivenName:", v16);

  }
  objc_msgSend(v9, "middleName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v9, "middleName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMiddleName:", v18);

  }
  objc_msgSend(v9, "familyName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v9, "familyName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFamilyName:", v20);

  }
  objc_msgSend(v9, "nameSuffix");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v9, "nameSuffix");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNameSuffix:", v22);

  }
  objc_msgSend(v9, "phoneticRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "givenName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v23, "givenName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPhoneticGivenName:", v25);

  }
  objc_msgSend(v23, "middleName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v23, "middleName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPhoneticMiddleName:", v27);

  }
  objc_msgSend(v23, "familyName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v23, "familyName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPhoneticFamilyName:", v29);

  }
  if (v10 && (objc_msgSend(v10, "ea_isLegalEmailAddress") | a6) == 1)
  {
    if (v11)
      v30 = v11;
    else
      v30 = (id)*MEMORY[0x1E0C97000];
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v30, v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEmailAddresses:", v32);

  }
  return v12;
}

+ (id)em_bestMatchForName:()EmailContactAdditions fromContacts:keysToCheck:
{
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v26;
  id obj;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  int v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v7 = a4;
  v29 = a5;
  v30 = v7;
  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_40:
    v22 = (id)v8;
    goto LABEL_41;
  }
  v32 = objc_msgSend(v29, "containsObject:", *MEMORY[0x1E0C966D0]);
  v9 = objc_msgSend(v29, "containsObject:", *MEMORY[0x1E0C966C0]);
  if ((v32 | v9) != 1)
    goto LABEL_39;
  objc_msgSend(MEMORY[0x1E0D13AD8], "componentsFromString:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "givenName");
  v31 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "familyName");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v31 | v10)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v11)
    {
      v33 = 0;
      v34 = 0;
      v12 = *(_QWORD *)v36;
LABEL_7:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v13);
        if (v32)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v13), "givenName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
            goto LABEL_12;
        }
        else
        {
          v15 = 0;
          if (!v9)
          {
LABEL_12:
            v16 = 0;
            goto LABEL_15;
          }
        }
        objc_msgSend(v14, "familyName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
        v17 = objc_msgSend(v15, "isEqualToString:", v31);
        v18 = v10;
        v19 = objc_msgSend(v16, "isEqualToString:", v10);
        if ((v17 & v19 & 1) != 0)
        {
          v22 = v14;

          v10 = v18;
          v23 = v33;
          if (v22)
            goto LABEL_37;
          goto LABEL_34;
        }
        if (v33)
          v20 = 0;
        else
          v20 = v17;
        if (v20 == 1)
          v33 = v14;
        if (v34)
          v21 = 0;
        else
          v21 = v19;
        if (v21 == 1)
          v34 = v14;

        v10 = v18;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v11)
            goto LABEL_7;
          goto LABEL_33;
        }
      }
    }
    v33 = 0;
    v34 = 0;
LABEL_33:

LABEL_34:
    v24 = v34;
    if (v34 || (v34 = 0, v23 = 0, v22 = 0, (v24 = v33) != 0))
    {
      v22 = v24;
      v23 = v33;
    }
LABEL_37:

  }
  else
  {
    v22 = 0;
  }

  if (!v22)
  {
LABEL_39:
    objc_msgSend(v30, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
LABEL_41:

  return v22;
}

@end
